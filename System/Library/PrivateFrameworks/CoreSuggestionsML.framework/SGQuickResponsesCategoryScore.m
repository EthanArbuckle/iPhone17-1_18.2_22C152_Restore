@interface SGQuickResponsesCategoryScore
- (SGQuickResponsesCategoryScore)init;
- (double)average;
- (double)maximum;
- (void)addScore:(double)a3;
@end

@implementation SGQuickResponsesCategoryScore

- (double)maximum
{
  return self->_maximum;
}

- (double)average
{
  return self->_average;
}

- (void)addScore:(double)a3
{
  if (a3 < 0.0)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SGQuickResponsesRanking.m", 335, @"Invalid parameter not satisfying: %@", @"score >= 0" object file lineNumber description];
  }
  unint64_t v5 = self->_modelCount + 1;
  self->_modelCount = v5;
  double maximum = self->_maximum;
  if (maximum <= a3) {
    double maximum = a3;
  }
  self->_average = self->_average + (a3 - self->_average) / (double)v5;
  self->_double maximum = maximum;
}

- (SGQuickResponsesCategoryScore)init
{
  v3.receiver = self;
  v3.super_class = (Class)SGQuickResponsesCategoryScore;
  result = [(SGQuickResponsesCategoryScore *)&v3 init];
  if (result)
  {
    result->_modelCount = 0;
    result->_average = 0.0;
    result->_double maximum = 0.0;
  }
  return result;
}

@end