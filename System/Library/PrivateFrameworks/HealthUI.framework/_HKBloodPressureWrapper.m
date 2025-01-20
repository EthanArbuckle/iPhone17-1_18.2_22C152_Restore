@interface _HKBloodPressureWrapper
- (HKStatistics)diastolic;
- (HKStatistics)systolic;
- (void)setDiastolic:(id)a3;
- (void)setSystolic:(id)a3;
@end

@implementation _HKBloodPressureWrapper

- (HKStatistics)systolic
{
  return self->_systolic;
}

- (void)setSystolic:(id)a3
{
}

- (HKStatistics)diastolic
{
  return self->_diastolic;
}

- (void)setDiastolic:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diastolic, 0);
  objc_storeStrong((id *)&self->_systolic, 0);
}

@end