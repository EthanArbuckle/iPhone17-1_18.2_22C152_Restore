@interface ARRollingNumberSeries
- (ARRollingNumberSeries)initWithWindowSize:(unint64_t)a3;
- (double)average;
- (double)max;
- (double)min;
- (double)sum;
- (double)variance;
- (unint64_t)count;
- (unint64_t)windowSize;
- (void)appendNumber:(double)a3;
- (void)clear;
- (void)dealloc;
@end

@implementation ARRollingNumberSeries

- (ARRollingNumberSeries)initWithWindowSize:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ARRollingNumberSeries;
  v4 = [(ARRollingNumberSeries *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_windowSize = a3;
    v4->_count = 0;
    v4->_series = (double *)malloc_type_malloc(8 * a3, 0x100004000313F17uLL);
    v5->_currentIndex = 0;
  }
  return v5;
}

- (void)dealloc
{
  free(self->_series);
  v3.receiver = self;
  v3.super_class = (Class)ARRollingNumberSeries;
  [(ARRollingNumberSeries *)&v3 dealloc];
}

- (double)max
{
  unint64_t count = self->_count;
  if (!count) {
    return 2.22507386e-308;
  }
  series = self->_series;
  double result = 2.22507386e-308;
  do
  {
    double v5 = *series++;
    double v6 = v5;
    if (result < v5) {
      double result = v6;
    }
    --count;
  }
  while (count);
  return result;
}

- (double)min
{
  unint64_t count = self->_count;
  if (!count) {
    return 1.79769313e308;
  }
  series = self->_series;
  double result = 1.79769313e308;
  do
  {
    double v5 = *series++;
    double v6 = v5;
    if (result >= v5) {
      double result = v6;
    }
    --count;
  }
  while (count);
  return result;
}

- (void)appendNumber:(double)a3
{
  unint64_t windowSize = self->_windowSize;
  unint64_t count = self->_count;
  series = self->_series;
  if (count >= windowSize)
  {
    unint64_t currentIndex = self->_currentIndex;
    double v8 = series[currentIndex];
    self->_sum = self->_sum - v8;
    series[currentIndex] = a3;
    unint64_t v6 = count;
  }
  else
  {
    series[count] = a3;
    unint64_t v6 = count + 1;
    self->_unint64_t count = count + 1;
    unint64_t currentIndex = self->_currentIndex;
    double v8 = 0.0;
  }
  self->_unint64_t currentIndex = (currentIndex + 1) % windowSize;
  double average = self->_average;
  double v10 = self->_sum + a3;
  double v11 = v10 / (double)v6;
  self->_sum = v10;
  self->_double average = v11;
  if (v6 < 2)
  {
    self->_sumVariance = 0.0;
    double v14 = 0.0;
  }
  else
  {
    double v12 = a3 - average;
    double v13 = a3 - v11;
    if (count >= windowSize) {
      double v14 = v12 * v13 - (v8 - average) * (v8 - v11) + self->_sumVariance;
    }
    else {
      double v14 = self->_sumVariance + v12 * v13;
    }
    self->_sumVariance = v14;
  }
  self->_variance = fabs(v14 / (double)(v6 - 1));
}

- (void)clear
{
  self->_unint64_t currentIndex = 0;
  self->_sumVariance = 0.0;
  *(_OWORD *)&self->_unint64_t count = 0u;
  *(_OWORD *)&self->_double average = 0u;
}

- (unint64_t)windowSize
{
  return self->_windowSize;
}

- (unint64_t)count
{
  return self->_count;
}

- (double)sum
{
  return self->_sum;
}

- (double)average
{
  return self->_average;
}

- (double)variance
{
  return self->_variance;
}

@end