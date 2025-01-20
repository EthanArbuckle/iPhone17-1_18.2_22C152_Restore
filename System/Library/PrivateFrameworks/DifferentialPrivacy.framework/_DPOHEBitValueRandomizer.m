@interface _DPOHEBitValueRandomizer
+ (id)oheBitValueRandomizerWithDimensionality:(unint64_t)a3 epsilon:(double)a4;
- (NSString)description;
- (_DPOHEBitValueRandomizer)init;
- (_DPOHEBitValueRandomizer)initWithDimensionality:(unint64_t)a3 epsilon:(double)a4;
- (id).cxx_construct;
- (id)randomize:(id)a3;
- (id)randomizeBitValues:(id)a3 forKey:(id)a4;
- (id)randomizeStrings:(id)a3 forKey:(id)a4;
- (id)randomizeWithMessageIndex:(unint64_t)a3 numberOfFlippedBits:(unint64_t)a4;
- (id)randomizeWords:(id)a3 fragmentWidth:(unint64_t)a4 forKey:(id)a5;
- (unint64_t)drawNumberOfFlippedBits;
@end

@implementation _DPOHEBitValueRandomizer

- (_DPOHEBitValueRandomizer)init
{
  return 0;
}

- (_DPOHEBitValueRandomizer)initWithDimensionality:(unint64_t)a3 epsilon:(double)a4
{
  BOOL v7 = isInvalidEpsilon(a4);
  if (a3) {
    char v8 = v7;
  }
  else {
    char v8 = 1;
  }
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)_DPOHEBitValueRandomizer;
    v10 = [(_DPOHEBitValueRandomizer *)&v18 init];
    v11 = v10;
    if (v10)
    {
      v10->_epsilon = a4;
      v10->_domainSize = a3;
      long double v12 = exp(-a4);
      v11->_flipProbability = v12 / (v12 + 1.0);
      uint32_t v13 = arc4random();
      v11->_rng.__x_[0] = v13;
      uint64_t v14 = 1;
      for (uint64_t i = 9; i != 632; ++i)
      {
        int v16 = 1812433253 * (v13 ^ (v13 >> 30));
        uint32_t v13 = v16 + v14;
        *((_DWORD *)&v11->super.isa + i) = i + v16 - 8;
        ++v14;
      }
      v11->_rng.__i_ = 0;
    }
    self = v11;
    v9 = self;
  }

  return v9;
}

+ (id)oheBitValueRandomizerWithDimensionality:(unint64_t)a3 epsilon:(double)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithDimensionality:a3 epsilon:a4];
  return v4;
}

- (id)randomizeWithMessageIndex:(unint64_t)a3 numberOfFlippedBits:(unint64_t)a4
{
  unint64_t v18 = a4;
  unint64_t v19 = a3;
  unint64_t domainSize = self->_domainSize;
  BOOL v5 = domainSize > a3 && domainSize >= a4;
  if (v5)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    int v17 = 1065353216;
    if (sampleUniformWithoutReplace<unsigned long,std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>(&v15, &self->_domainSize, &v18, (uint64_t)&self->_rng))
    {
      std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::__emplace_unique_key_args<unsigned long,unsigned long const&>((uint64_t)&v15, &v19, &v19);
      char v8 = v7;
      std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::__erase_unique<unsigned long>(&v15, &v19);
      double v9 = uniformRandomProbabilityExcludingOne();
      unint64_t v10 = *((void *)&v16 + 1);
      v11 = (void *)[&stru_1F3681BE0 mutableCopy];
      long double v12 = (void *)v16;
      if ((void)v16)
      {
        int v13 = (int)(v9 * (double)v10);
        do
        {
          if ([v11 length]) {
            [v11 appendString:@","];
          }
          objc_msgSend(v11, "appendFormat:", @"%lu", v12[2]);
          BOOL v5 = v13-- != 0;
          if (!v5 && (v8 & 1) != 0) {
            objc_msgSend(v11, "appendFormat:", @",%lu", v19);
          }
          long double v12 = (void *)*v12;
        }
        while (v12);
      }
      if (!*((void *)&v16 + 1) && (v8 & 1) != 0) {
        objc_msgSend(v11, "appendFormat:", @"%lu", v19);
      }
      v6 = (void *)[v11 copy];
    }
    else
    {
      v6 = 0;
    }
    std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::~__hash_table((uint64_t)&v15);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (unint64_t)drawNumberOfFlippedBits
{
  std::binomial_distribution<unsigned long>::param_type::param_type((uint64_t)v4, self->_domainSize, self->_flipProbability);
  return std::binomial_distribution<unsigned long>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((int)v4, (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)&self->_rng, (uint64_t)v4);
}

- (id)randomize:(id)a3
{
  unint64_t v4 = [a3 unsignedLongValue];
  if (v4 >= self->_domainSize)
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = [(_DPOHEBitValueRandomizer *)self randomizeWithMessageIndex:v4 numberOfFlippedBits:[(_DPOHEBitValueRandomizer *)self drawNumberOfFlippedBits]];
  }
  return v5;
}

- (NSString)description
{
  v3 = NSString;
  unint64_t v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"%@: { p=%lu ; epsilon=%lf }",
    v5,
    self->_domainSize,
  v6 = *(void *)&self->_epsilon);

  return (NSString *)v6;
}

- (id)randomizeStrings:(id)a3 forKey:(id)a4
{
  return 0;
}

- (id)randomizeWords:(id)a3 fragmentWidth:(unint64_t)a4 forKey:(id)a5
{
  return 0;
}

- (id)randomizeBitValues:(id)a3 forKey:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v19 = a4;
  v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
  [v6 timeIntervalSinceReferenceDate];
  double v8 = v7;

  id v18 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v17;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v9);
        }
        int v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (([v13 isEqualToNumber:&unk_1F372C5D0] & 1) == 0)
        {
          uint64_t v14 = [(_DPOHEBitValueRandomizer *)self randomize:v13];
          long long v15 = -[_DPBitValueRecord initWithKey:clearBitValue:privateBitValueStr:creationDate:submitted:objectId:]([_DPBitValueRecord alloc], "initWithKey:clearBitValue:privateBitValueStr:creationDate:submitted:objectId:", v19, [v13 shortValue], v14, 0, 0, v8);
          if (v15) {
            [v18 addObject:v15];
          }
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  return v18;
}

- (id).cxx_construct
{
  unsigned int v2 = 5489;
  *((_DWORD *)self + 8) = 5489;
  uint64_t v3 = 1;
  for (uint64_t i = 9; i != 632; ++i)
  {
    int v5 = 1812433253 * (v2 ^ (v2 >> 30));
    unsigned int v2 = v5 + v3;
    *((_DWORD *)self + i) = i + v5 - 8;
    ++v3;
  }
  *((void *)self + 316) = 0;
  return self;
}

@end