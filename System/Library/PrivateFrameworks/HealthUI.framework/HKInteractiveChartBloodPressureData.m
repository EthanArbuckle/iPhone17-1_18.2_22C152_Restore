@interface HKInteractiveChartBloodPressureData
- (HKValueRange)diastolicRange;
- (HKValueRange)systolicRange;
- (void)setDiastolicRange:(id)a3;
- (void)setSystolicRange:(id)a3;
@end

@implementation HKInteractiveChartBloodPressureData

- (HKValueRange)systolicRange
{
  return self->_systolicRange;
}

- (void)setSystolicRange:(id)a3
{
}

- (HKValueRange)diastolicRange
{
  return self->_diastolicRange;
}

- (void)setDiastolicRange:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diastolicRange, 0);
  objc_storeStrong((id *)&self->_systolicRange, 0);
}

@end