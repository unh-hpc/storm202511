#! /bin/bash

rm -rf *.bp
ln -sf ../adios2cfg.xml .

mpirun -n 10 ./openggcm 2>&1 | tee log.openggcm &
mpirun -n 1 build/conductance-srv 2>&1 | tee log.conductance-srv &

wait