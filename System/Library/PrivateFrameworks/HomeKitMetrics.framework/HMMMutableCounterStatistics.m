@interface HMMMutableCounterStatistics
- (HMMCounterStatistics)statistics;
- (void)addValue:(int64_t)a3;
@end

@implementation HMMMutableCounterStatistics

- (HMMCounterStatistics)statistics
{
  if (self->_valueCount) {
    v2 = [[HMMCounterStatistics alloc] initWithMinValue:self->_minValue maxValue:self->_maxValue sumOfValues:self->_sumOfValues valueCount:self->_valueCount];
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)addValue:(int64_t)a3
{
  int64_t valueCount = self->_valueCount;
  if (valueCount)
  {
    if (self->_minValue > a3) {
      self->_minValue = a3;
    }
    if (self->_maxValue < a3) {
      self->_maxValue = a3;
    }
    self->_sumOfValues += a3;
  }
  else
  {
    self->_minValue = a3;
    self->_maxValue = a3;
    self->_sumOfValues = a3;
  }
  self->_int64_t valueCount = valueCount + 1;
}

@end