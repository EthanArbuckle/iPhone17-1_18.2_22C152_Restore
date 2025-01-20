@interface BWMovingWindowStats
- (BWMovingWindowStats)initWithWindowSize:(int)a3;
- (double)max;
- (double)min;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)windowSize;
- (void)addDataPoint:(double)a3;
- (void)dealloc;
@end

@implementation BWMovingWindowStats

- (BWMovingWindowStats)initWithWindowSize:(int)a3
{
  if (a3 < 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Window size needs to be greater than 0" userInfo:0]);
  }
  v7.receiver = self;
  v7.super_class = (Class)BWMovingWindowStats;
  v4 = [(BWStats *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_windowSize = a3;
    v4->_numDataPoints = 0;
    v4->_dataPointIndex = 0;
    v4->_dataPoints = (double *)malloc_type_malloc(8 * v4->_windowSize, 0x100004000313F17uLL);
  }
  return v5;
}

- (void)addDataPoint:(double)a3
{
  if (self->_numDataPoints == self->_windowSize) {
    [(BWStats *)self removeDataPoint:self->_dataPoints[self->_dataPointIndex]];
  }
  v7.receiver = self;
  v7.super_class = (Class)BWMovingWindowStats;
  [(BWStats *)&v7 addDataPoint:a3];
  uint64_t dataPointIndex = self->_dataPointIndex;
  self->_dataPoints[dataPointIndex] = a3;
  self->_uint64_t dataPointIndex = ((int)dataPointIndex + 1) % self->_windowSize;
  int numDataPoints = self->_numDataPoints;
  if (numDataPoints < self->_windowSize) {
    self->_int numDataPoints = numDataPoints + 1;
  }
}

- (void)dealloc
{
  free(self->_dataPoints);
  v3.receiver = self;
  v3.super_class = (Class)BWMovingWindowStats;
  [(BWStats *)&v3 dealloc];
}

- (double)min
{
  uint64_t numDataPoints = self->_numDataPoints;
  if ((int)numDataPoints < 1)
  {
    double v4 = 0.0;
  }
  else
  {
    dataPoints = self->_dataPoints;
    double v4 = *dataPoints;
    if (numDataPoints != 1)
    {
      v5 = dataPoints + 1;
      uint64_t v6 = numDataPoints - 1;
      do
      {
        double v7 = *v5++;
        double v8 = v7;
        if (v4 > v7) {
          double v4 = v8;
        }
        --v6;
      }
      while (v6);
    }
  }
  [(BWStats *)self multiplier];
  return v4 * v9;
}

- (double)max
{
  uint64_t numDataPoints = self->_numDataPoints;
  if ((int)numDataPoints < 1)
  {
    double v4 = 0.0;
  }
  else
  {
    dataPoints = self->_dataPoints;
    double v4 = *dataPoints;
    if (numDataPoints != 1)
    {
      v5 = dataPoints + 1;
      uint64_t v6 = numDataPoints - 1;
      do
      {
        double v7 = *v5++;
        double v8 = v7;
        if (v4 < v7) {
          double v4 = v8;
        }
        --v6;
      }
      while (v6);
    }
  }
  [(BWStats *)self multiplier];
  return v4 * v9;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)BWMovingWindowStats;
  return (id)[NSString stringWithFormat:@"Moving Average: %@", -[BWStats description](&v3, sel_description)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BWMovingWindowStats;
  double v4 = [(BWStats *)&v7 copyWithZone:a3];
  v4[24] = self->_windowSize;
  v4[25] = self->_numDataPoints;
  v4[26] = self->_dataPointIndex;
  v5 = malloc_type_malloc(8 * self->_windowSize, 0x100004000313F17uLL);
  *((void *)v4 + 14) = v5;
  memcpy(v5, self->_dataPoints, 8 * self->_windowSize);
  return v4;
}

- (int)windowSize
{
  return self->_windowSize;
}

@end