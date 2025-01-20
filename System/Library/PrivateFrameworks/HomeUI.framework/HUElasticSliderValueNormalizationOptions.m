@interface HUElasticSliderValueNormalizationOptions
- (BOOL)applyMinimumVisualRangeSpan;
- (BOOL)applyStepValue;
- (HUElasticSliderValueNormalizationOptions)init;
- (unint64_t)boundingStrategy;
- (void)setApplyMinimumVisualRangeSpan:(BOOL)a3;
- (void)setApplyStepValue:(BOOL)a3;
- (void)setBoundingStrategy:(unint64_t)a3;
@end

@implementation HUElasticSliderValueNormalizationOptions

- (HUElasticSliderValueNormalizationOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)HUElasticSliderValueNormalizationOptions;
  result = [(HUElasticSliderValueNormalizationOptions *)&v3 init];
  if (result) {
    result->_boundingStrategy = 1;
  }
  return result;
}

- (unint64_t)boundingStrategy
{
  return self->_boundingStrategy;
}

- (void)setBoundingStrategy:(unint64_t)a3
{
  self->_boundingStrategy = a3;
}

- (BOOL)applyStepValue
{
  return self->_applyStepValue;
}

- (void)setApplyStepValue:(BOOL)a3
{
  self->_applyStepValue = a3;
}

- (BOOL)applyMinimumVisualRangeSpan
{
  return self->_applyMinimumVisualRangeSpan;
}

- (void)setApplyMinimumVisualRangeSpan:(BOOL)a3
{
  self->_applyMinimumVisualRangeSpan = a3;
}

@end