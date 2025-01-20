@interface CBHIDPerformanceSummary
- (CBDevice)device;
- (NSError)error;
- (char)rssi;
- (double)errorRate;
- (double)intervalSecondsExpected;
- (double)intervalSecondsMax;
- (void)setDevice:(id)a3;
- (void)setError:(id)a3;
- (void)setErrorRate:(double)a3;
- (void)setIntervalSecondsExpected:(double)a3;
- (void)setIntervalSecondsMax:(double)a3;
- (void)setRssi:(char)a3;
@end

@implementation CBHIDPerformanceSummary

- (CBDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (double)errorRate
{
  return self->_errorRate;
}

- (void)setErrorRate:(double)a3
{
  self->_errorRate = a3;
}

- (double)intervalSecondsExpected
{
  return self->_intervalSecondsExpected;
}

- (void)setIntervalSecondsExpected:(double)a3
{
  self->_intervalSecondsExpected = a3;
}

- (double)intervalSecondsMax
{
  return self->_intervalSecondsMax;
}

- (void)setIntervalSecondsMax:(double)a3
{
  self->_intervalSecondsMax = a3;
}

- (char)rssi
{
  return self->_rssi;
}

- (void)setRssi:(char)a3
{
  self->_rssi = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end