@interface ADStreamSyncTimestampedObject
- (ADCameraCalibration)calibration;
- (double)midExposureTimestamp;
- (double)pose;
- (double)timestamp;
- (id)data;
- (id)metadata;
- (void)setCalibration:(id)a3;
- (void)setData:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setMidExposureTimestamp:(double)a3;
- (void)setPose:(__n128)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation ADStreamSyncTimestampedObject

- (double)timestamp
{
  return self->_timestamp;
}

- (id)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_metadata, 0);
  objc_storeStrong((id *)&self->_calibration, 0);

  objc_storeStrong(&self->_data, 0);
}

- (id)metadata
{
  return self->_metadata;
}

- (double)midExposureTimestamp
{
  return self->_midExposureTimestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void)setPose:(__n128)a3
{
  v5[0] = a2;
  v5[1] = a3;
  v5[2] = a4;
  v5[3] = a5;
  objc_copyStruct((void *)(a1 + 48), v5, 64, 1, 0);
}

- (void)setMidExposureTimestamp:(double)a3
{
  self->_midExposureTimestamp = a3;
}

- (void)setMetadata:(id)a3
{
}

- (void)setData:(id)a3
{
}

- (void)setCalibration:(id)a3
{
}

- (ADCameraCalibration)calibration
{
  return self->_calibration;
}

- (double)pose
{
  objc_copyStruct(&v2, (const void *)(a1 + 48), 64, 1, 0);
  return *(double *)&v2;
}

@end