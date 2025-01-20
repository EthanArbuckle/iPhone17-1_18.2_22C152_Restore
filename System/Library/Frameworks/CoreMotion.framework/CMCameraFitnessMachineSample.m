@interface CMCameraFitnessMachineSample
- (double)elapsedTime;
- (double)globalMachtime;
- (double)localMachtime;
- (float)averageCadence;
- (float)averageHeartRate;
- (float)averagePace;
- (float)averagePower;
- (float)averageSpeed;
- (float)crossTrainerDistance;
- (float)elevationGain;
- (float)energy;
- (float)inclination;
- (float)indoorBikeDistance;
- (float)instantaneousCadence;
- (float)instantaneousHeartRate;
- (float)instantaneousPace;
- (float)instantaneousPower;
- (float)instantaneousSpeed;
- (float)resistanceLevel;
- (float)strideCount;
- (float)treadmillDistance;
- (int)floors;
- (int)stepCount;
- (void)setAverageCadence:(float)a3;
- (void)setAverageHeartRate:(float)a3;
- (void)setAveragePace:(float)a3;
- (void)setAveragePower:(float)a3;
- (void)setAverageSpeed:(float)a3;
- (void)setCrossTrainerDistance:(float)a3;
- (void)setElapsedTime:(double)a3;
- (void)setElevationGain:(float)a3;
- (void)setEnergy:(float)a3;
- (void)setFloors:(int)a3;
- (void)setGlobalMachtime:(double)a3;
- (void)setInclination:(float)a3;
- (void)setIndoorBikeDistance:(float)a3;
- (void)setInstantaneousCadence:(float)a3;
- (void)setInstantaneousHeartRate:(float)a3;
- (void)setInstantaneousPace:(float)a3;
- (void)setInstantaneousPower:(float)a3;
- (void)setInstantaneousSpeed:(float)a3;
- (void)setLocalMachtime:(double)a3;
- (void)setResistanceLevel:(float)a3;
- (void)setStepCount:(int)a3;
- (void)setStrideCount:(float)a3;
- (void)setTreadmillDistance:(float)a3;
@end

@implementation CMCameraFitnessMachineSample

- (double)localMachtime
{
  return self->_localMachtime;
}

- (void)setLocalMachtime:(double)a3
{
  self->_localMachtime = a3;
}

- (double)globalMachtime
{
  return self->_globalMachtime;
}

- (void)setGlobalMachtime:(double)a3
{
  self->_globalMachtime = a3;
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (void)setElapsedTime:(double)a3
{
  self->_elapsedTime = a3;
}

- (float)energy
{
  return self->_energy;
}

- (void)setEnergy:(float)a3
{
  self->_energy = a3;
}

- (float)treadmillDistance
{
  return self->_treadmillDistance;
}

- (void)setTreadmillDistance:(float)a3
{
  self->_treadmillDistance = a3;
}

- (float)indoorBikeDistance
{
  return self->_indoorBikeDistance;
}

- (void)setIndoorBikeDistance:(float)a3
{
  self->_indoorBikeDistance = a3;
}

- (float)crossTrainerDistance
{
  return self->_crossTrainerDistance;
}

- (void)setCrossTrainerDistance:(float)a3
{
  self->_crossTrainerDistance = a3;
}

- (int)floors
{
  return self->_floors;
}

- (void)setFloors:(int)a3
{
  self->_floors = a3;
}

- (int)stepCount
{
  return self->_stepCount;
}

- (void)setStepCount:(int)a3
{
  self->_stepCount = a3;
}

- (float)strideCount
{
  return self->_strideCount;
}

- (void)setStrideCount:(float)a3
{
  self->_strideCount = a3;
}

- (float)instantaneousSpeed
{
  return self->_instantaneousSpeed;
}

- (void)setInstantaneousSpeed:(float)a3
{
  self->_instantaneousSpeed = a3;
}

- (float)averageSpeed
{
  return self->_averageSpeed;
}

- (void)setAverageSpeed:(float)a3
{
  self->_averageSpeed = a3;
}

- (float)instantaneousPace
{
  return self->_instantaneousPace;
}

- (void)setInstantaneousPace:(float)a3
{
  self->_instantaneousPace = a3;
}

- (float)averagePace
{
  return self->_averagePace;
}

- (void)setAveragePace:(float)a3
{
  self->_averagePace = a3;
}

- (float)elevationGain
{
  return self->_elevationGain;
}

- (void)setElevationGain:(float)a3
{
  self->_elevationGain = a3;
}

- (float)inclination
{
  return self->_inclination;
}

- (void)setInclination:(float)a3
{
  self->_inclination = a3;
}

- (float)resistanceLevel
{
  return self->_resistanceLevel;
}

- (void)setResistanceLevel:(float)a3
{
  self->_resistanceLevel = a3;
}

- (float)instantaneousPower
{
  return self->_instantaneousPower;
}

- (void)setInstantaneousPower:(float)a3
{
  self->_instantaneousPower = a3;
}

- (float)averagePower
{
  return self->_averagePower;
}

- (void)setAveragePower:(float)a3
{
  self->_averagePower = a3;
}

- (float)instantaneousCadence
{
  return self->_instantaneousCadence;
}

- (void)setInstantaneousCadence:(float)a3
{
  self->_instantaneousCadence = a3;
}

- (float)averageCadence
{
  return self->_averageCadence;
}

- (void)setAverageCadence:(float)a3
{
  self->_averageCadence = a3;
}

- (float)instantaneousHeartRate
{
  return self->_instantaneousHeartRate;
}

- (void)setInstantaneousHeartRate:(float)a3
{
  self->_instantaneousHeartRate = a3;
}

- (float)averageHeartRate
{
  return self->_averageHeartRate;
}

- (void)setAverageHeartRate:(float)a3
{
  self->_averageHeartRate = a3;
}

@end