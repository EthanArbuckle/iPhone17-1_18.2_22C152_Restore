@interface HKCardioFitnessLevelData
- (HKCardioFitnessLevelData)initWithCardioFitnessLevel:(int64_t)a3 biologicalSex:(int64_t)a4 ageLowerBound:(int64_t)a5 ageUpperBound:(int64_t)a6 vo2MaxLowerBound:(double)a7 vo2MaxUpperBound:(double)a8;
- (double)vo2MaxLowerBound;
- (double)vo2MaxUpperBound;
- (id)description;
- (int64_t)ageLowerBound;
- (int64_t)ageUpperBound;
- (int64_t)biologicalSex;
- (int64_t)cardioFitnessLevel;
- (void)setAgeLowerBound:(int64_t)a3;
- (void)setAgeUpperBound:(int64_t)a3;
- (void)setBiologicalSex:(int64_t)a3;
- (void)setCardioFitnessLevel:(int64_t)a3;
- (void)setVo2MaxLowerBound:(double)a3;
- (void)setVo2MaxUpperBound:(double)a3;
@end

@implementation HKCardioFitnessLevelData

- (HKCardioFitnessLevelData)initWithCardioFitnessLevel:(int64_t)a3 biologicalSex:(int64_t)a4 ageLowerBound:(int64_t)a5 ageUpperBound:(int64_t)a6 vo2MaxLowerBound:(double)a7 vo2MaxUpperBound:(double)a8
{
  v15.receiver = self;
  v15.super_class = (Class)HKCardioFitnessLevelData;
  result = [(HKCardioFitnessLevelData *)&v15 init];
  if (result)
  {
    result->_biologicalSex = a4;
    result->_cardioFitnessLevel = a3;
    result->_ageLowerBound = a5;
    result->_ageUpperBound = a6;
    result->_vo2MaxLowerBound = a7;
    result->_vo2MaxUpperBound = a8;
  }
  return result;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"HKCardioFitnessLevelData: biological sex: %ld, age range: %ld-%ld, vo2max range: %.2f-%.2f, level: %ld", self->_biologicalSex, self->_ageLowerBound, self->_ageUpperBound, *(void *)&self->_vo2MaxLowerBound, *(void *)&self->_vo2MaxUpperBound, self->_cardioFitnessLevel];
}

- (int64_t)biologicalSex
{
  return self->_biologicalSex;
}

- (void)setBiologicalSex:(int64_t)a3
{
  self->_biologicalSex = a3;
}

- (int64_t)cardioFitnessLevel
{
  return self->_cardioFitnessLevel;
}

- (void)setCardioFitnessLevel:(int64_t)a3
{
  self->_cardioFitnessLevel = a3;
}

- (int64_t)ageLowerBound
{
  return self->_ageLowerBound;
}

- (void)setAgeLowerBound:(int64_t)a3
{
  self->_ageLowerBound = a3;
}

- (int64_t)ageUpperBound
{
  return self->_ageUpperBound;
}

- (void)setAgeUpperBound:(int64_t)a3
{
  self->_ageUpperBound = a3;
}

- (double)vo2MaxLowerBound
{
  return self->_vo2MaxLowerBound;
}

- (void)setVo2MaxLowerBound:(double)a3
{
  self->_vo2MaxLowerBound = a3;
}

- (double)vo2MaxUpperBound
{
  return self->_vo2MaxUpperBound;
}

- (void)setVo2MaxUpperBound:(double)a3
{
  self->_vo2MaxUpperBound = a3;
}

@end