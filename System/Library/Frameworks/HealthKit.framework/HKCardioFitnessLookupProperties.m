@interface HKCardioFitnessLookupProperties
- (HKQuantity)vo2MaxQuantity;
- (int64_t)age;
- (int64_t)biologicalSex;
- (void)setAge:(int64_t)a3;
- (void)setBiologicalSex:(int64_t)a3;
- (void)setVo2MaxQuantity:(id)a3;
@end

@implementation HKCardioFitnessLookupProperties

- (int64_t)biologicalSex
{
  return self->_biologicalSex;
}

- (void)setBiologicalSex:(int64_t)a3
{
  self->_biologicalSex = a3;
}

- (int64_t)age
{
  return self->_age;
}

- (void)setAge:(int64_t)a3
{
  self->_age = a3;
}

- (HKQuantity)vo2MaxQuantity
{
  return self->_vo2MaxQuantity;
}

- (void)setVo2MaxQuantity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end