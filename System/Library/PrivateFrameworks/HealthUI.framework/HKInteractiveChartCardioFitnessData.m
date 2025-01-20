@interface HKInteractiveChartCardioFitnessData
- (id)description;
- (int64_t)age;
- (int64_t)biologicalSex;
- (int64_t)classification;
- (unint64_t)sampleCount;
- (void)setAge:(int64_t)a3;
- (void)setBiologicalSex:(int64_t)a3;
- (void)setClassification:(int64_t)a3;
- (void)setSampleCount:(unint64_t)a3;
@end

@implementation HKInteractiveChartCardioFitnessData

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)HKInteractiveChartCardioFitnessData;
  v4 = [(HKInteractiveChartSinglePointData *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@, biologicalSex: %ld, age: %ld, classification: %ld, sample count: %lu", v4, self->_biologicalSex, self->_age, self->_classification, self->_sampleCount];

  return v5;
}

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

- (int64_t)classification
{
  return self->_classification;
}

- (void)setClassification:(int64_t)a3
{
  self->_classification = a3;
}

- (unint64_t)sampleCount
{
  return self->_sampleCount;
}

- (void)setSampleCount:(unint64_t)a3
{
  self->_sampleCount = a3;
}

@end