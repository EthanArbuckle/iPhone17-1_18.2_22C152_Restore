@interface _HDRollingBaseline
- (BOOL)hasSufficientDataToBaseline;
- (_HDRollingBaseline)initWithConfiguration:(id)a3;
- (double)_sum;
- (double)currentBaseline;
- (double)mostRecentSampleStartTime;
- (double)mostRecentSupplementarySampleStartTime;
- (int64_t)additionalSampleCountRequiredToBaseline;
- (unint64_t)_sampleCount;
- (void)_assertValidNextStartTime:(double)a3;
- (void)addNextSampleValue:(double)a3 startTime:(double)a4;
- (void)addSupplementarySampleValue:(double)a3 startTime:(double)a4;
- (void)pruneForNextSampleStartTime:(double)a3;
@end

@implementation _HDRollingBaseline

- (_HDRollingBaseline)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_HDRollingBaseline;
  v6 = [(_HDRollingBaseline *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    samples = v7->_samples;
    v7->_samples = (NSMutableArray *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    supplementarySamples = v7->_supplementarySamples;
    v7->_supplementarySamples = (NSMutableArray *)v10;

    v7->_samplesSum = 0.0;
    v7->_supplementarySamplesSum = 0.0;
  }

  return v7;
}

- (double)_sum
{
  return self->_samplesSum + self->_supplementarySamplesSum;
}

- (unint64_t)_sampleCount
{
  uint64_t v3 = [(NSMutableArray *)self->_samples count];
  return [(NSMutableArray *)self->_supplementarySamples count] + v3;
}

- (BOOL)hasSufficientDataToBaseline
{
  return [(_HDRollingBaseline *)self additionalSampleCountRequiredToBaseline] == 0;
}

- (int64_t)additionalSampleCountRequiredToBaseline
{
  uint64_t v3 = [(HKRollingBaselineConfiguration *)self->_configuration minimumSampleCount];
  unint64_t v4 = [(_HDRollingBaseline *)self _sampleCount];
  return (v3 - v4) & ~((uint64_t)(v3 - v4) >> 63);
}

- (double)currentBaseline
{
  if (![(_HDRollingBaseline *)self hasSufficientDataToBaseline])
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
  }
  [(_HDRollingBaseline *)self _sum];
  return v4 / (double)[(_HDRollingBaseline *)self _sampleCount];
}

- (double)mostRecentSampleStartTime
{
  uint64_t v3 = [(NSMutableArray *)self->_samples lastObject];

  if (v3)
  {
    double v4 = [(NSMutableArray *)self->_samples lastObject];
    objc_msgSend(v4, "_hd_trivialQuantitySampleValue");
    double v6 = v5;
  }
  else
  {
    double v4 = [MEMORY[0x1E4F1C9C8] distantPast];
    [v4 timeIntervalSinceReferenceDate];
    double v6 = v7;
  }

  return v6;
}

- (double)mostRecentSupplementarySampleStartTime
{
  uint64_t v3 = [(NSMutableArray *)self->_supplementarySamples lastObject];

  if (v3)
  {
    double v4 = [(NSMutableArray *)self->_supplementarySamples lastObject];
    objc_msgSend(v4, "_hd_trivialQuantitySampleValue");
    double v6 = v5;
  }
  else
  {
    double v4 = [MEMORY[0x1E4F1C9C8] distantPast];
    [v4 timeIntervalSinceReferenceDate];
    double v6 = v7;
  }

  return v6;
}

- (void)pruneForNextSampleStartTime:(double)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  double v5 = [MEMORY[0x1E4F1CA48] array];
  supplementarySamples = self->_supplementarySamples;
  self->_supplementarySamples = v5;

  self->_supplementarySamplesSum = 0.0;
  if ([(NSMutableArray *)self->_samples count])
  {
    [(HKRollingBaselineConfiguration *)self->_configuration maximumWindowDuration];
    double v8 = v7;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v9 = self->_samples;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = 0;
      double v13 = a3 - v8;
      uint64_t v14 = *(void *)v21;
      double v15 = 0.0;
      while (2)
      {
        uint64_t v16 = 0;
        uint64_t v17 = v11 + v12;
        do
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v16), "_hd_trivialQuantitySampleValue", (void)v20);
          if (v19 >= v13)
          {
            uint64_t v17 = v12 + v16;
            goto LABEL_12;
          }
          double v15 = v15 + v18;
          ++v16;
        }
        while (v11 != v16);
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
        uint64_t v12 = v17;
        if (v11) {
          continue;
        }
        break;
      }
LABEL_12:

      if (v17)
      {
        -[NSMutableArray removeObjectsInRange:](self->_samples, "removeObjectsInRange:", 0, v17);
        self->_samplesSum = self->_samplesSum - v15;
      }
    }
    else
    {
    }
  }
}

- (void)addNextSampleValue:(double)a3 startTime:(double)a4
{
  [(_HDRollingBaseline *)self _assertValidNextStartTime:a4];
  uint64_t v7 = [(NSMutableArray *)self->_samples count];
  if (v7 == [(HKRollingBaselineConfiguration *)self->_configuration maximumSampleCount])
  {
    double v8 = [(NSMutableArray *)self->_samples firstObject];
    objc_msgSend(v8, "_hd_trivialQuantitySampleValue");
    double v10 = v9;

    [(NSMutableArray *)self->_samples removeObjectAtIndex:0];
    self->_samplesSum = self->_samplesSum - v10;
  }
  objc_msgSend(MEMORY[0x1E4F29238], "_hd_valueWithTrivialQuantitySample:", a3, a4);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableArray *)self->_samples addObject:v11];
  self->_samplesSum = self->_samplesSum + a3;
}

- (void)_assertValidNextStartTime:(double)a3
{
  if ([(NSMutableArray *)self->_samples count])
  {
    double v6 = [(NSMutableArray *)self->_samples lastObject];
    objc_msgSend(v6, "_hd_trivialQuantitySampleValue");
    double v8 = v7;

    if (v8 > a3)
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"HDRollingBaselineRelativeQuantityCalculator.m" lineNumber:275 description:@"Values must be added in ascending order by date for baseline calculations"];
    }
  }
}

- (void)addSupplementarySampleValue:(double)a3 startTime:(double)a4
{
  if ([(_HDRollingBaseline *)self hasSufficientDataToBaseline])
  {
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
  }
  objc_msgSend(MEMORY[0x1E4F29238], "_hd_valueWithTrivialQuantitySample:", a3, a4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableArray *)self->_supplementarySamples addObject:v9];
  self->_supplementarySamplesSum = self->_supplementarySamplesSum + a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementarySamples, 0);
  objc_storeStrong((id *)&self->_samples, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end