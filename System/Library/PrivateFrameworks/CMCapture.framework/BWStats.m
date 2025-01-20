@interface BWStats
- (BWStats)init;
- (BWStats)initWithMedianCalculationEnabled:(BOOL)a3 maxNumberOfSamplesForMedianCalculation:(int64_t)a4;
- (BWStats)initWithStats:(id)a3;
- (NSString)unitDesignator;
- (double)average;
- (double)max;
- (double)median;
- (double)min;
- (double)multiplier;
- (double)standardDeviation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (int64_t)nextDataPointIndex;
- (int64_t)numberOfSamples;
- (void)addDataPoint:(double)a3;
- (void)dealloc;
- (void)removeDataPoint:(double)a3;
- (void)setMultiplier:(double)a3;
- (void)setNextDataPointIndex:(int64_t)a3;
- (void)setUnitDesignator:(id)a3;
@end

@implementation BWStats

- (void)addDataPoint:(double)a3
{
  double v3 = self->_multiplier * a3;
  int64_t numberOfSamples = self->_numberOfSamples;
  self->_int64_t numberOfSamples = numberOfSamples + 1;
  if (v3 < self->_min) {
    self->_min = v3;
  }
  if (v3 > self->_max) {
    self->_max = v3;
  }
  double v5 = self->_sumXX + v3 * v3;
  self->_sumX = v3 + self->_sumX;
  self->_sumXX = v5;
  int64_t maxNumberOfSamplesForMedianCalculation = self->_maxNumberOfSamplesForMedianCalculation;
  if (maxNumberOfSamplesForMedianCalculation < 1 || numberOfSamples < maxNumberOfSamplesForMedianCalculation)
  {
    samples = self->_samples;
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithDouble:");
    [(NSMutableArray *)samples addObject:v9];
  }
}

- (BWStats)init
{
  return [(BWStats *)self initWithMedianCalculationEnabled:0 maxNumberOfSamplesForMedianCalculation:0];
}

- (double)average
{
  int64_t numberOfSamples = self->_numberOfSamples;
  if (numberOfSamples) {
    return self->_sumX / (double)numberOfSamples;
  }
  else {
    return 0.0;
  }
}

- (void)removeDataPoint:(double)a3
{
  int64_t numberOfSamples = self->_numberOfSamples;
  BOOL v4 = numberOfSamples < 1;
  int64_t v5 = numberOfSamples - 1;
  if (!v4)
  {
    double v6 = self->_multiplier * a3;
    self->_int64_t numberOfSamples = v5;
    double v7 = self->_sumXX - v6 * v6;
    self->_sumX = self->_sumX - v6;
    self->_sumXX = v7;
    samples = self->_samples;
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithDouble:");
    [(NSMutableArray *)samples removeObject:v9];
  }
}

- (BWStats)initWithMedianCalculationEnabled:(BOOL)a3 maxNumberOfSamplesForMedianCalculation:(int64_t)a4
{
  BOOL v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BWStats;
  double v6 = [(BWStats *)&v9 init];
  double v7 = v6;
  if (v6)
  {
    v6->_multiplier = 1.0;
    v6->_unitDesignator = (NSString *)[[NSString alloc] initWithString:&stru_1EFA403E0];
    v7->_medianCalculationEnabled = v5;
    v7->_int64_t maxNumberOfSamplesForMedianCalculation = a4;
    v7->_int64_t numberOfSamples = 0;
    *(_OWORD *)&v7->_min = xmmword_1A5F0BF60;
    v7->_sumX = 0.0;
    v7->_sumXX = 0.0;
    if (v5) {
      v7->_samples = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
  }
  return v7;
}

- (void)setMultiplier:(double)a3
{
  self->_multiplier = a3;
}

- (void)setUnitDesignator:(id)a3
{
}

- (BWStats)initWithStats:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)BWStats;
  BOOL v4 = [(BWStats *)&v10 init];
  BOOL v5 = v4;
  if (v4)
  {
    v4->_multiplier = *((double *)a3 + 1);
    if (*((void *)a3 + 2)) {
      uint64_t v6 = [[NSString alloc] initWithString:*((void *)a3 + 2)];
    }
    else {
      uint64_t v6 = 0;
    }
    v5->_unitDesignator = (NSString *)v6;
    v5->_medianCalculationEnabled = *((unsigned char *)a3 + 24);
    v5->_int64_t maxNumberOfSamplesForMedianCalculation = *((void *)a3 + 4);
    v5->_int64_t numberOfSamples = *((void *)a3 + 5);
    [a3 min];
    v5->_min = v7;
    [a3 max];
    v5->_max = v8;
    v5->_sumX = *((double *)a3 + 8);
    v5->_sumXX = *((double *)a3 + 9);
    v5->_samples = (NSMutableArray *)[*((id *)a3 + 10) copy];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWStats;
  [(BWStats *)&v3 dealloc];
}

- (double)standardDeviation
{
  int64_t numberOfSamples = self->_numberOfSamples;
  if (numberOfSamples) {
    return sqrt(vabdd_f64(self->_sumXX, self->_sumX * self->_sumX / (double)numberOfSamples) / (double)numberOfSamples);
  }
  else {
    return 0.0;
  }
}

- (double)median
{
  uint64_t v3 = [(NSMutableArray *)self->_samples count];
  double result = 0.0;
  if (self->_medianCalculationEnabled && v3 != 0)
  {
    unint64_t v6 = v3;
    double v7 = (void *)-[NSMutableArray sortedArrayUsingSelector:](self->_samples, "sortedArrayUsingSelector:", sel_compare_, 0.0);
    double v8 = v7;
    unint64_t v9 = v6 >> 1;
    if (self->_numberOfSamples)
    {
      v13 = (void *)[v7 objectAtIndex:v9];
      [v13 doubleValue];
    }
    else
    {
      objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", v9 - 1), "doubleValue");
      double v11 = v10;
      objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", v9), "doubleValue");
      return (v11 + v12) * 0.5;
    }
  }
  return result;
}

- (id)description
{
  uint64_t v3 = 0;
  if (self->_numberOfSamples < 1)
  {
    uint64_t v5 = 0;
  }
  else
  {
    [(BWStats *)self min];
    uint64_t v5 = v4;
    if (self->_numberOfSamples >= 1)
    {
      [(BWStats *)self max];
      uint64_t v3 = v6;
    }
  }
  if (self->_medianCalculationEnabled)
  {
    double v7 = NSString;
    [(BWStats *)self median];
    unint64_t v9 = (__CFString *)[v7 stringWithFormat:@", median: %lf%@", v8, -[BWStats unitDesignator](self, "unitDesignator")];
  }
  else
  {
    unint64_t v9 = &stru_1EFA403E0;
  }
  double v10 = NSString;
  int64_t numberOfSamples = self->_numberOfSamples;
  unitDesignator = self->_unitDesignator;
  [(BWStats *)self average];
  uint64_t v14 = v13;
  v15 = self->_unitDesignator;
  [(BWStats *)self standardDeviation];
  return (id)[v10 stringWithFormat:@"Number of samples: %lld, min: %lf%@, max: %lf%@, average: %lf%@, standard deviation: %lf%@ %@", numberOfSamples, v5, unitDesignator, v3, unitDesignator, v14, v15, v16, self->_unitDesignator, v9];
}

- (id)debugDescription
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p> %@", NSStringFromClass(v4), self, -[BWStats description](self, "description")];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(id)objc_opt_class() allocWithZone:a3];
  [(BWStats *)self multiplier];
  objc_msgSend((id)v4, "setMultiplier:");
  objc_msgSend((id)v4, "setUnitDesignator:", -[BWStats unitDesignator](self, "unitDesignator"));
  *(void *)(v4 + 40) = [(BWStats *)self numberOfSamples];
  *(double *)(v4 + 48) = self->_min;
  *(double *)(v4 + 56) = self->_max;
  *(double *)(v4 + 64) = self->_sumX;
  *(double *)(v4 + 72) = self->_sumXX;
  *(unsigned char *)(v4 + 24) = self->_medianCalculationEnabled;
  *(void *)(v4 + 32) = self->_maxNumberOfSamplesForMedianCalculation;
  *(void *)(v4 + 80) = [(NSMutableArray *)self->_samples copy];
  return (id)v4;
}

- (double)multiplier
{
  return self->_multiplier;
}

- (NSString)unitDesignator
{
  return self->_unitDesignator;
}

- (int64_t)numberOfSamples
{
  return self->_numberOfSamples;
}

- (double)min
{
  return self->_min;
}

- (double)max
{
  return self->_max;
}

- (int64_t)nextDataPointIndex
{
  return self->_nextDataPointIndex;
}

- (void)setNextDataPointIndex:(int64_t)a3
{
  self->_nextDataPointIndex = a3;
}

@end