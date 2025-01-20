@interface CMAAltimeterData
- (double)machAbsoluteTimestamp;
- (double)pressure;
- (double)relativeAltitude;
- (double)timestamp;
- (void)setMachAbsoluteTimestamp:(double)a3;
- (void)setPressure:(double)a3;
- (void)setRelativeAltitude:(double)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation CMAAltimeterData

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)machAbsoluteTimestamp
{
  return self->_machAbsoluteTimestamp;
}

- (void)setMachAbsoluteTimestamp:(double)a3
{
  self->_machAbsoluteTimestamp = a3;
}

- (double)relativeAltitude
{
  return self->_relativeAltitude;
}

- (void)setRelativeAltitude:(double)a3
{
  self->_relativeAltitude = a3;
}

- (double)pressure
{
  return self->_pressure;
}

- (void)setPressure:(double)a3
{
  self->_pressure = a3;
}

@end