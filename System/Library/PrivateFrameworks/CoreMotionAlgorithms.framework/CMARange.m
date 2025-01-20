@interface CMARange
- (double)range;
- (double)rangeError;
- (double)rssi;
- (double)timestamp;
- (unsigned)cycleIndex;
- (void)setCycleIndex:(unsigned __int16)a3;
- (void)setRange:(double)a3;
- (void)setRangeError:(double)a3;
- (void)setRssi:(double)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation CMARange

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)range
{
  return self->_range;
}

- (void)setRange:(double)a3
{
  self->_range = a3;
}

- (double)rangeError
{
  return self->_rangeError;
}

- (void)setRangeError:(double)a3
{
  self->_rangeError = a3;
}

- (double)rssi
{
  return self->_rssi;
}

- (void)setRssi:(double)a3
{
  self->_rssi = a3;
}

- (unsigned)cycleIndex
{
  return self->_cycleIndex;
}

- (void)setCycleIndex:(unsigned __int16)a3
{
  self->_cycleIndex = a3;
}

@end