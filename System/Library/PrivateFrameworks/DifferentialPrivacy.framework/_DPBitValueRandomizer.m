@interface _DPBitValueRandomizer
+ (id)bitValueRandomizerWithDimensionality:(unint64_t)a3 epsilon:(double)a4;
- (NSString)description;
- (_DPBiasedCoin)epsilonCoin;
- (_DPBitValueRandomizer)init;
- (_DPBitValueRandomizer)initWithDimensionality:(unint64_t)a3 epsilon:(double)a4;
- (double)epsilon;
- (id)randomize:(id)a3;
- (id)randomizeBitValues:(id)a3 forKey:(id)a4;
- (id)randomizeStrings:(id)a3 forKey:(id)a4;
- (id)randomizeWords:(id)a3 fragmentWidth:(unint64_t)a4 forKey:(id)a5;
- (unint64_t)p;
@end

@implementation _DPBitValueRandomizer

- (_DPBitValueRandomizer)init
{
  return 0;
}

- (_DPBitValueRandomizer)initWithDimensionality:(unint64_t)a3 epsilon:(double)a4
{
  if (isInvalidEpsilon(a4)) {
    goto LABEL_5;
  }
  v12.receiver = self;
  v12.super_class = (Class)_DPBitValueRandomizer;
  v7 = [(_DPBitValueRandomizer *)&v12 init];
  self = v7;
  if (!v7) {
    goto LABEL_4;
  }
  v7->_p = a3;
  v7->_epsilon = a4;
  v8 = +[_DPBiasedCoin coinWithBias:(double)(1.0 / (exp(a4 * 0.5) + 1.0))];
  epsilonCoin = self->_epsilonCoin;
  self->_epsilonCoin = v8;

  if (!self->_epsilonCoin)
  {
LABEL_5:
    v10 = 0;
  }
  else
  {
LABEL_4:
    self = self;
    v10 = self;
  }

  return v10;
}

+ (id)bitValueRandomizerWithDimensionality:(unint64_t)a3 epsilon:(double)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithDimensionality:a3 epsilon:a4];
  return v4;
}

- (id)randomize:(id)a3
{
  unint64_t v4 = [a3 unsignedLongValue];
  if (v4 >= self->_p)
  {
    v6 = 0;
  }
  else
  {
    unint64_t v5 = v4;
    v6 = (void *)[&stru_1F3681BE0 mutableCopy];
    if (self->_p)
    {
      unint64_t v7 = 0;
      do
      {
        int v8 = [(_DPBiasedCoin *)self->_epsilonCoin generateByte];
        if ((v7 ^ v5) >= 8) {
          int v9 = 0;
        }
        else {
          int v9 = 1 << (v5 & 7);
        }
        objc_msgSend(v6, "appendFormat:", @"%02X", v8 ^ v9);
        v7 += 8;
      }
      while (v7 < self->_p);
    }
  }
  return v6;
}

- (NSString)description
{
  v3 = NSString;
  unint64_t v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"%@: { p=%ld ; epsilon=%lf ; cEpsilon=%lf ; epsilonCoin=%@ }",
    v5,
    self->_p,
    *(void *)&self->_epsilon,
    1.0 / (exp(self->_epsilon * 0.5) + 1.0),
  v6 = self->_epsilonCoin);

  return (NSString *)v6;
}

- (id)randomizeStrings:(id)a3 forKey:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = +[_DPBitValueMap bitValueMapForKey:v6];
  int v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
  [v8 timeIntervalSinceReferenceDate];
  double v10 = v9;

  id v20 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = objc_msgSend(v7, "bitValueForString:", *(void *)(*((void *)&v22 + 1) + 8 * i), v20);
        if (([v16 isEqualToNumber:&unk_1F372C600] & 1) == 0)
        {
          v17 = [(_DPBitValueRandomizer *)self randomize:v16];
          v18 = -[_DPBitValueRecord initWithKey:clearBitValue:privateBitValueStr:creationDate:submitted:objectId:]([_DPBitValueRecord alloc], "initWithKey:clearBitValue:privateBitValueStr:creationDate:submitted:objectId:", v6, [v16 shortValue], v17, 0, 0, v10);
          if (v18) {
            [v20 addObject:v18];
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }

  return v20;
}

- (id)randomizeWords:(id)a3 fragmentWidth:(unint64_t)a4 forKey:(id)a5
{
  return 0;
}

- (id)randomizeBitValues:(id)a3 forKey:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
  [v8 timeIntervalSinceReferenceDate];
  double v10 = v9;

  id v20 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (([v16 isEqualToNumber:&unk_1F372C600] & 1) == 0)
        {
          v17 = [(_DPBitValueRandomizer *)self randomize:v16];
          v18 = -[_DPBitValueRecord initWithKey:clearBitValue:privateBitValueStr:creationDate:submitted:objectId:]([_DPBitValueRecord alloc], "initWithKey:clearBitValue:privateBitValueStr:creationDate:submitted:objectId:", v7, [v16 shortValue], v17, 0, 0, v10);
          if (v18) {
            [v20 addObject:v18];
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  return v20;
}

- (unint64_t)p
{
  return self->_p;
}

- (double)epsilon
{
  return self->_epsilon;
}

- (_DPBiasedCoin)epsilonCoin
{
  return self->_epsilonCoin;
}

- (void).cxx_destruct
{
}

@end