@interface AVConcreteMutableValueTiming
- ($F24F406B2B787EFB06265DBA3D28CBD5)_timing;
- (AVConcreteMutableValueTiming)initWithAnchorValue:(double)a3 anchorTimeStamp:(double)a4 rate:(double)a5;
- (double)anchorTimeStamp;
- (double)anchorValue;
- (double)rate;
- (void)setAnchorTimeStamp:(double)a3;
- (void)setAnchorValue:(double)a3;
- (void)setRate:(double)a3;
@end

@implementation AVConcreteMutableValueTiming

- ($F24F406B2B787EFB06265DBA3D28CBD5)_timing
{
  double value = self->_value;
  double rate = self->_rate;
  double v4 = 0.0;
  if (rate != 0.0)
  {
    double value = self->_timeStamp - value / rate;
    double v4 = self->_rate;
  }
  result.var1 = v4;
  result.var0 = value;
  return result;
}

- (void)setRate:(double)a3
{
  self->_double rate = a3;
}

- (void)setAnchorTimeStamp:(double)a3
{
  self->_timeStamp = a3;
}

- (void)setAnchorValue:(double)a3
{
  self->_double value = a3;
}

- (double)rate
{
  return self->_rate;
}

- (double)anchorTimeStamp
{
  return self->_timeStamp;
}

- (double)anchorValue
{
  return self->_value;
}

- (AVConcreteMutableValueTiming)initWithAnchorValue:(double)a3 anchorTimeStamp:(double)a4 rate:(double)a5
{
  self->_double value = a3;
  self->_timeStamp = a4;
  self->_double rate = a5;
  return self;
}

@end