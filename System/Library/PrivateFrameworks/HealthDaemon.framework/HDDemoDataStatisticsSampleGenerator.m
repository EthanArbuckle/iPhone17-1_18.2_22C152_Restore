@interface HDDemoDataStatisticsSampleGenerator
+ (BOOL)supportsSecureCoding;
- (HDDemoDataStatisticsSampleGenerator)init;
- (HDDemoDataStatisticsSampleGenerator)initWithCoder:(id)a3;
- (double)computeNoiseFromTime:(double)a3 stdDev:(double)a4;
- (double)computeStatisticalTimeFromCurrentTime:(double)a3 mean:(double)a4 stdDev:(double)a5;
- (double)pseudoRandomDoubleFromTime:(double)a3;
- (double)randomDoubleFromGenerator;
- (double)randomSampleFromNormalDistributionWithMean:(double)a3 stdDev:(double)a4;
- (id).cxx_construct;
- (id)_pseudoRandomDoubles;
- (void)encodeWithCoder:(id)a3;
- (void)setupWithDemoDataGenerator:(id)a3;
@end

@implementation HDDemoDataStatisticsSampleGenerator

- (HDDemoDataStatisticsSampleGenerator)init
{
  v6.receiver = self;
  v6.super_class = (Class)HDDemoDataStatisticsSampleGenerator;
  v2 = [(HDDemoDataBaseSampleGenerator *)&v6 init];
  v3 = (HDDemoDataStatisticsSampleGenerator *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 40) = xmmword_1BD326B00;
    v2[64] = 0;
    v4 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = 0;
  }
  return v3;
}

- (HDDemoDataStatisticsSampleGenerator)initWithCoder:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDDemoDataStatisticsSampleGenerator;
  v5 = [(HDDemoDataBaseSampleGenerator *)&v13 initWithCoder:v4];
  objc_super v6 = (HDDemoDataStatisticsSampleGenerator *)v5;
  if (v5)
  {
    *(_OWORD *)(v5 + 40) = xmmword_1BD326B00;
    v5[64] = 0;
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    v9 = [v7 setWithArray:v8];
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"HDDemoDataStatisticsSampleGeneratorPseudoRandomDoublesKey"];
    pseudoRandomDoubles = v6->_pseudoRandomDoubles;
    v6->_pseudoRandomDoubles = (NSArray *)v10;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)HDDemoDataStatisticsSampleGenerator;
  [(HDDemoDataBaseSampleGenerator *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_pseudoRandomDoubles forKey:@"HDDemoDataStatisticsSampleGeneratorPseudoRandomDoublesKey"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setupWithDemoDataGenerator:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDDemoDataStatisticsSampleGenerator;
  [(HDDemoDataBaseSampleGenerator *)&v11 setupWithDemoDataGenerator:v4];
  if (![(HDDemoDataBaseSampleGenerator *)self createdFromNSKeyedUnarchiver])
  {
    if (self)
    {
      objc_super v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      for (uint64_t i = 1; i != 101; ++i)
      {
        v7 = [NSNumber numberWithDouble:(double)i / 100.0];
        [(NSArray *)v5 addObject:v7];
      }
      uint64_t v8 = 0;
      uint32_t v9 = 100;
      do
      {
        [(NSArray *)v5 exchangeObjectAtIndex:v8 withObjectAtIndex:v8 + arc4random_uniform(v9)];
        ++v8;
        --v9;
      }
      while (v8 != 100);
    }
    else
    {
      objc_super v5 = 0;
    }
    pseudoRandomDoubles = self->_pseudoRandomDoubles;
    self->_pseudoRandomDoubles = v5;
  }
}

- (double)randomDoubleFromGenerator
{
  return std::normal_distribution<double>::operator()<std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>>((uint64_t)&self->_distribution, &self->_generator.__x_, &self->_distribution.__p_.__mean_);
}

- (double)pseudoRandomDoubleFromTime:(double)a3
{
  v3 = [(NSArray *)self->_pseudoRandomDoubles objectAtIndexedSubscript:(uint64_t)(a3 * 15485863.0) % [(NSArray *)self->_pseudoRandomDoubles count]];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (double)computeNoiseFromTime:(double)a3 stdDev:(double)a4
{
  double result = 0.0;
  if (self)
  {
    if (a4 != 0.0)
    {
      [(HDDemoDataStatisticsSampleGenerator *)self pseudoRandomDoubleFromTime:a3];
      return 0.0 - (a4 - (a4 + a4) * v7);
    }
  }
  return result;
}

- (double)computeStatisticalTimeFromCurrentTime:(double)a3 mean:(double)a4 stdDev:(double)a5
{
  [(HDDemoDataStatisticsSampleGenerator *)self computeNoiseFromTime:a3 stdDev:a5];
  return fabs(v6) + a4;
}

- (double)randomSampleFromNormalDistributionWithMean:(double)a3 stdDev:(double)a4
{
  v5[0] = a3;
  v5[1] = a4;
  char v6 = 0;
  return std::normal_distribution<double>::operator()<std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>>((uint64_t)v5, &self->_generator.__x_, v5);
}

- (id)_pseudoRandomDoubles
{
  return self->_pseudoRandomDoubles;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_DWORD *)self + 8) = 1;
  *(_OWORD *)((char *)self + 40) = xmmword_1BD326B10;
  *((unsigned char *)self + 64) = 0;
  return self;
}

@end