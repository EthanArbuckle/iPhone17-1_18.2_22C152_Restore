@interface HKInteractiveChartBloodGlucosePercentInRangeData
- (double)fractionForClassification:(int64_t)a3;
- (int64_t)countForClassification:(int64_t)a3;
- (int64_t)countInEuglycemia;
- (int64_t)countInHyperglycemia;
- (int64_t)countInLevel1Hypoglycemia;
- (int64_t)countInLevel2Hypoglycemia;
- (int64_t)totalCount;
- (void)setCountInEuglycemia:(int64_t)a3;
- (void)setCountInHyperglycemia:(int64_t)a3;
- (void)setCountInLevel1Hypoglycemia:(int64_t)a3;
- (void)setCountInLevel2Hypoglycemia:(int64_t)a3;
@end

@implementation HKInteractiveChartBloodGlucosePercentInRangeData

- (int64_t)countForClassification:(int64_t)a3
{
  if ((unint64_t)a3 <= 3) {
    return *(void *)(self + 8 * a3 + 8);
  }
  return self;
}

- (double)fractionForClassification:(int64_t)a3
{
  double v4 = (double)[(HKInteractiveChartBloodGlucosePercentInRangeData *)self countForClassification:a3];
  return v4 / (double)[(HKInteractiveChartBloodGlucosePercentInRangeData *)self totalCount];
}

- (int64_t)totalCount
{
  return vaddvq_s64(vaddq_s64(*(int64x2_t *)&self->_countInLevel2Hypoglycemia, *(int64x2_t *)&self->_countInEuglycemia));
}

- (int64_t)countInLevel2Hypoglycemia
{
  return self->_countInLevel2Hypoglycemia;
}

- (void)setCountInLevel2Hypoglycemia:(int64_t)a3
{
  self->_countInLevel2Hypoglycemia = a3;
}

- (int64_t)countInLevel1Hypoglycemia
{
  return self->_countInLevel1Hypoglycemia;
}

- (void)setCountInLevel1Hypoglycemia:(int64_t)a3
{
  self->_countInLevel1Hypoglycemia = a3;
}

- (int64_t)countInEuglycemia
{
  return self->_countInEuglycemia;
}

- (void)setCountInEuglycemia:(int64_t)a3
{
  self->_countInEuglycemia = a3;
}

- (int64_t)countInHyperglycemia
{
  return self->_countInHyperglycemia;
}

- (void)setCountInHyperglycemia:(int64_t)a3
{
  self->_countInHyperglycemia = a3;
}

@end