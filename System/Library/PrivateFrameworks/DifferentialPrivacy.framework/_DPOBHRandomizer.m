@interface _DPOBHRandomizer
+ (id)obhRandomizerWithDimensionality:(unint64_t)a3 epsilon:(double)a4;
- (BOOL)getBitValueAtIndex:(unint64_t)a3 forString:(id)a4;
- (NSString)description;
- (_DPBiasedCoin)epsilonCoin;
- (_DPOBHRandomizer)init;
- (_DPOBHRandomizer)initWithDimensionality:(unint64_t)a3 epsilon:(double)a4;
- (_DPRandomBitPositionGenerator)bitPositionGenerator;
- (double)cEpsilon;
- (double)epsilon;
- (id)randomizeBitValues:(id)a3 forKey:(id)a4;
- (id)randomizeStrings:(id)a3 forKey:(id)a4;
- (id)randomizeWords:(id)a3 fragmentWidth:(unint64_t)a4 forKey:(id)a5;
- (id)randomizedBitForString:(id)a3;
- (unint64_t)m;
@end

@implementation _DPOBHRandomizer

- (_DPOBHRandomizer)init
{
  return 0;
}

- (_DPOBHRandomizer)initWithDimensionality:(unint64_t)a3 epsilon:(double)a4
{
  if (isInvalidEpsilon(a4)) {
    goto LABEL_2;
  }
  v15.receiver = self;
  v15.super_class = (Class)_DPOBHRandomizer;
  v8 = [(_DPOBHRandomizer *)&v15 init];
  self = v8;
  if (!v8) {
    goto LABEL_6;
  }
  v8->_m = a3;
  v9 = +[_DPRandomBitPositionGenerator generatorWithDimensionality:a3];
  bitPositionGenerator = self->_bitPositionGenerator;
  self->_bitPositionGenerator = v9;

  self->_epsilon = a4;
  long double v11 = exp(a4);
  self->_cEpsilon = v11 / (v11 + 1.0);
  +[_DPBiasedCoin coinWithBias:](_DPBiasedCoin, "coinWithBias:");
  v12 = (_DPBiasedCoin *)objc_claimAutoreleasedReturnValue();
  epsilonCoin = self->_epsilonCoin;
  self->_epsilonCoin = v12;

  if (!self->_bitPositionGenerator || !self->_epsilonCoin)
  {
LABEL_2:
    v7 = 0;
  }
  else
  {
LABEL_6:
    self = self;
    v7 = self;
  }

  return v7;
}

+ (id)obhRandomizerWithDimensionality:(unint64_t)a3 epsilon:(double)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithDimensionality:a3 epsilon:a4];
  return v4;
}

- (BOOL)getBitValueAtIndex:(unint64_t)a3 forString:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v5 = (const char *)[a4 UTF8String];
  CC_LONG v6 = strlen(v5);
  CC_SHA256(v5, v6, md);
  dataIn[0] = 0;
  dataIn[1] = bswap64(a3 >> 7);
  CCCryptorStatus v7 = CCCrypt(0, 0, 2u, md, 0x20uLL, 0, dataIn, 0x10uLL, dataIn, 0x10uLL, 0);
  if (v7)
  {
    int v8 = v7;
    v9 = +[_DPLog framework];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_DPOBHRandomizer getBitValueAtIndex:forString:](v8, v9);
    }

    LOBYTE(v10) = 0;
  }
  else
  {
    return (*((unsigned __int8 *)dataIn + ((a3 >> 3) & 0xF)) >> (a3 & 7)) & 1;
  }
  return v10;
}

- (id)randomizedBitForString:(id)a3
{
  bitPositionGenerator = self->_bitPositionGenerator;
  id v5 = a3;
  uint64_t v6 = [(_DPRandomBitPositionGenerator *)bitPositionGenerator sample];
  BOOL v7 = [(_DPOBHRandomizer *)self getBitValueAtIndex:v6 forString:v5];

  if (v7) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = -1;
  }
  if ([(_DPBiasedCoin *)self->_epsilonCoin flip]) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = -v8;
  }
  return +[_DPRandomizedBit randomizedBit:v9 atIndex:v6];
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"%@: { dimensionality=%ld ; bitPositionGenerator=%@ ; epsilon=%.16g ; cEpsilon=%.16g ; epsilonCoin=%@ }",
    v5,
    self->_m,
    self->_bitPositionGenerator,
    *(void *)&self->_epsilon,
    *(void *)&self->_cEpsilon,
  uint64_t v6 = self->_epsilonCoin);

  return (NSString *)v6;
}

- (id)randomizeStrings:(id)a3 forKey:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
  [v8 timeIntervalSinceReferenceDate];
  double v10 = v9;

  id v20 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v6;
  uint64_t v11 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v16 = [(_DPOBHRandomizer *)self randomizedBitForString:v15];
        v17 = +[_DPOBHSequenceRecord recordWithKey:sequence:bitPosition:bitValue:creationDate:submitted:objectId:](_DPOBHSequenceRecord, "recordWithKey:sequence:bitPosition:bitValue:creationDate:submitted:objectId:", v7, v15, [v16 index], objc_msgSend(v16, "value") == 1, 0, 0, v10);
        if (v17) {
          [v20 addObject:v17];
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  return v20;
}

- (id)randomizeWords:(id)a3 fragmentWidth:(unint64_t)a4 forKey:(id)a5
{
  return 0;
}

- (id)randomizeBitValues:(id)a3 forKey:(id)a4
{
  return 0;
}

- (unint64_t)m
{
  return self->_m;
}

- (double)epsilon
{
  return self->_epsilon;
}

- (_DPBiasedCoin)epsilonCoin
{
  return self->_epsilonCoin;
}

- (_DPRandomBitPositionGenerator)bitPositionGenerator
{
  return self->_bitPositionGenerator;
}

- (double)cEpsilon
{
  return self->_cEpsilon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bitPositionGenerator, 0);
  objc_storeStrong((id *)&self->_epsilonCoin, 0);
}

- (void)getBitValueAtIndex:(int)a1 forString:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1DC55E000, a2, OS_LOG_TYPE_ERROR, "CCCryptorStatus failed: %d", (uint8_t *)v2, 8u);
}

@end