@interface _HKAxisLabelDimensionBloodGlucosePercentInRange
- (NSNumberFormatter)formatter;
- (_HKAxisLabelDimensionBloodGlucosePercentInRange)init;
- (double)niceStepSizeLargerThan:(double)a3;
- (double)ticksPerStepSize:(double)a3;
- (id)endingLabelsFactorOverride;
- (id)formatterForLabelStepSize:(double)a3;
- (id)stringForLocation:(id)a3 formatterForStepSize:(id)a4;
@end

@implementation _HKAxisLabelDimensionBloodGlucosePercentInRange

- (_HKAxisLabelDimensionBloodGlucosePercentInRange)init
{
  v6.receiver = self;
  v6.super_class = (Class)_HKAxisLabelDimensionBloodGlucosePercentInRange;
  v2 = [(_HKAxisLabelDimensionBloodGlucosePercentInRange *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28EE0], "hk_percentNumberFormatter");
    formatter = v2->_formatter;
    v2->_formatter = (NSNumberFormatter *)v3;
  }
  return v2;
}

- (double)niceStepSizeLargerThan:(double)a3
{
  return 1.0;
}

- (double)ticksPerStepSize:(double)a3
{
  return 0.0;
}

- (id)formatterForLabelStepSize:(double)a3
{
  return 0;
}

- (id)endingLabelsFactorOverride
{
  return 0;
}

- (id)stringForLocation:(id)a3 formatterForStepSize:(id)a4
{
  return -[NSNumberFormatter stringFromNumber:](self->_formatter, "stringFromNumber:", a3, a4);
}

- (NSNumberFormatter)formatter
{
  return self->_formatter;
}

- (void).cxx_destruct
{
}

@end