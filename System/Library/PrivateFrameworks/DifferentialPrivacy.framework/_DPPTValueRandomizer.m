@interface _DPPTValueRandomizer
+ (id)randomizerWithEpsilon:(double)a3 numberOfGroups:(unsigned int)a4;
- (_DPPTValueRandomizer)init;
- (_DPPTValueRandomizer)initWithEpsilon:(double)a3 numberOfGroups:(unsigned int)a4;
- (double)chancePMinusQ;
- (double)epsilon;
- (id)randomize:(id)a3;
- (id)randomizeBitValues:(id)a3 forKey:(id)a4;
- (id)randomizeStrings:(id)a3 forKey:(id)a4;
- (id)randomizeWords:(id)a3 fragmentWidth:(unint64_t)a4 forKey:(id)a5;
- (unint64_t)mask;
- (unsigned)bucketCount;
- (unsigned)numGroups;
- (void)setBucketCount:(unsigned int)a3;
- (void)setChancePMinusQ:(double)a3;
- (void)setEpsilon:(double)a3;
- (void)setMask:(unint64_t)a3;
- (void)setNumGroups:(unsigned int)a3;
@end

@implementation _DPPTValueRandomizer

- (_DPPTValueRandomizer)init
{
  return 0;
}

- (_DPPTValueRandomizer)initWithEpsilon:(double)a3 numberOfGroups:(unsigned int)a4
{
  BOOL v7 = isInvalidEpsilon(a3);
  v8 = 0;
  if (a4 - 61 >= 0xFFFFFFC4 && !v7)
  {
    v14.receiver = self;
    v14.super_class = (Class)_DPPTValueRandomizer;
    v9 = [(_DPPTValueRandomizer *)&v14 init];
    v10 = v9;
    if (v9)
    {
      v9->_epsilon = a3;
      v9->_numGroups = a4;
      v9->_mask = 0x7FFFFFFFFFFFFFFFLL;
      long double v11 = exp(a3);
      unsigned int v12 = vcvtpd_u64_f64(v11 + 1.0);
      v10->_bucketCount = v12;
      v10->_chancePMinusQ = v11 / (v11 + (double)v12 + -1.0) + -1.0 / (v11 + (double)v12 + -1.0);
    }
    self = v10;
    v8 = self;
  }

  return v8;
}

+ (id)randomizerWithEpsilon:(double)a3 numberOfGroups:(unsigned int)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithEpsilon:*(void *)&a4 numberOfGroups:a3];
  return v4;
}

- (id)randomize:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(_DPPTValueRandomizer *)self numGroups];
  MEMORY[0x1F4188790]();
  v6 = (void *)((char *)v20 - v5);
  bzero((char *)v20 - v5, v7);
  unsigned int v8 = [(_DPPTValueRandomizer *)self numGroups];
  if ([v4 length] <= (unint64_t)v8) {
    uint64_t v9 = [v4 length];
  }
  else {
    uint64_t v9 = [(_DPPTValueRandomizer *)self numGroups];
  }
  objc_msgSend(v4, "getCharacters:range:", v6, 0, v9);
  unint64_t v10 = arc4random_uniform([(_DPPTValueRandomizer *)self numGroups]);
  unint64_t v11 = arc4random_uniform(0x77359400u);
  double v12 = uniformRandomProbability();
  [(_DPPTValueRandomizer *)self chancePMinusQ];
  if (v12 >= v13)
  {
    unint64_t v15 = arc4random_uniform([(_DPPTValueRandomizer *)self bucketCount]);
  }
  else
  {
    if ([v4 length] <= v10) {
      uint64_t v14 = [v4 length];
    }
    else {
      uint64_t v14 = v10 + 1;
    }
    unint64_t v16 = XXH64(v6, 2 * v14, v11);
    unint64_t v17 = [(_DPPTValueRandomizer *)self mask] & v16;
    unint64_t v15 = v17 % [(_DPPTValueRandomizer *)self bucketCount];
  }
  v18 = objc_msgSend(NSString, "stringWithFormat:", @"%lu,%lu,%llu", v10, v11, v15);

  return v18;
}

- (id)randomizeStrings:(id)a3 forKey:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
  [v8 timeIntervalSinceReferenceDate];
  double v10 = v9;

  unint64_t v11 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        unint64_t v17 = -[_DPPTValueRandomizer randomize:](self, "randomize:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
        v18 = [[_DPPTRecord alloc] initWithKey:v7 privateValue:v17 creationDate:0 submitted:0 objectId:v10];
        if (v18) {
          [v11 addObject:v18];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }

  return v11;
}

- (id)randomizeWords:(id)a3 fragmentWidth:(unint64_t)a4 forKey:(id)a5
{
  return 0;
}

- (id)randomizeBitValues:(id)a3 forKey:(id)a4
{
  return 0;
}

- (double)epsilon
{
  return self->_epsilon;
}

- (void)setEpsilon:(double)a3
{
  self->_epsilon = a3;
}

- (unsigned)numGroups
{
  return self->_numGroups;
}

- (void)setNumGroups:(unsigned int)a3
{
  self->_numGroups = a3;
}

- (unint64_t)mask
{
  return self->_mask;
}

- (void)setMask:(unint64_t)a3
{
  self->_mask = a3;
}

- (unsigned)bucketCount
{
  return self->_bucketCount;
}

- (void)setBucketCount:(unsigned int)a3
{
  self->_bucketCount = a3;
}

- (double)chancePMinusQ
{
  return self->_chancePMinusQ;
}

- (void)setChancePMinusQ:(double)a3
{
  self->_chancePMinusQ = a3;
}

@end