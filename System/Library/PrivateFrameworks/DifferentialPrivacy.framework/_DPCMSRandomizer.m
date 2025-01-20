@interface _DPCMSRandomizer
+ (id)randomizerWithEpsilon:(double)a3 bitCount:(unint64_t)a4 hashFunctionCount:(unint64_t)a5;
+ (id)randomizerWithEpsilon:(double)a3 bitCount:(unint64_t)a4 hashFunctionCount:(unint64_t)a5 fragmentEpsilon:(double)a6 fragmentBitCount:(unint64_t)a7 fragmentHashFunctionCount:(unint64_t)a8;
- (NSString)description;
- (_DPCMSRandomizer)init;
- (_DPCMSRandomizer)initWithEpsilon:(double)a3 bitCount:(unint64_t)a4 hashFunctionCount:(unint64_t)a5;
- (_DPCMSRandomizer)initWithEpsilon:(double)a3 bitCount:(unint64_t)a4 hashFunctionCount:(unint64_t)a5 fragmentEpsilon:(double)a6 fragmentBitCount:(unint64_t)a7 fragmentHashFunctionCount:(unint64_t)a8;
- (double)epsilon;
- (double)fragmentEpsilon;
- (id)cmsSampleForFragment:(id)a3;
- (id)cmsSampleForString:(id)a3;
- (id)randomizeBitValues:(id)a3 forKey:(id)a4;
- (id)randomizeStrings:(id)a3 forKey:(id)a4;
- (id)randomizeWords:(id)a3 fragmentWidth:(unint64_t)a4 forKey:(id)a5;
- (unint64_t)fragmentK;
- (unint64_t)fragmentM;
- (unint64_t)k;
- (unint64_t)m;
@end

@implementation _DPCMSRandomizer

- (_DPCMSRandomizer)init
{
  return 0;
}

- (_DPCMSRandomizer)initWithEpsilon:(double)a3 bitCount:(unint64_t)a4 hashFunctionCount:(unint64_t)a5 fragmentEpsilon:(double)a6 fragmentBitCount:(unint64_t)a7 fragmentHashFunctionCount:(unint64_t)a8
{
  if (isInvalidEpsilon(a3))
  {
    v15 = 0;
  }
  else
  {
    BOOL v17 = isNonZeroPowerOfTwo(a4);
    v15 = 0;
    if (a5)
    {
      if (v17)
      {
        BOOL v18 = isNonZeroPowerOfTwo(a7);
        v15 = 0;
        if (a8)
        {
          if (v18)
          {
            v20.receiver = self;
            v20.super_class = (Class)_DPCMSRandomizer;
            v19 = [(_DPCMSRandomizer *)&v20 init];
            if (v19)
            {
              v19->_epsilon = a3;
              v19->_m = a4;
              v19->_k = a5;
              v19->_fragmentEpsilon = a6;
              v19->_fragmentM = a7;
              v19->_fragmentK = a8;
            }
            self = v19;
            v15 = self;
          }
        }
      }
    }
  }

  return v15;
}

- (_DPCMSRandomizer)initWithEpsilon:(double)a3 bitCount:(unint64_t)a4 hashFunctionCount:(unint64_t)a5
{
  return [(_DPCMSRandomizer *)self initWithEpsilon:a4 bitCount:a5 hashFunctionCount:a4 fragmentEpsilon:a5 fragmentBitCount:a3 fragmentHashFunctionCount:a3];
}

+ (id)randomizerWithEpsilon:(double)a3 bitCount:(unint64_t)a4 hashFunctionCount:(unint64_t)a5 fragmentEpsilon:(double)a6 fragmentBitCount:(unint64_t)a7 fragmentHashFunctionCount:(unint64_t)a8
{
  v8 = (void *)[objc_alloc((Class)a1) initWithEpsilon:a4 bitCount:a5 hashFunctionCount:a7 fragmentEpsilon:a8 fragmentBitCount:a3 fragmentHashFunctionCount:a6];
  return v8;
}

+ (id)randomizerWithEpsilon:(double)a3 bitCount:(unint64_t)a4 hashFunctionCount:(unint64_t)a5
{
  v5 = (void *)[objc_alloc((Class)a1) initWithEpsilon:a4 bitCount:a5 hashFunctionCount:a3];
  return v5;
}

- (id)cmsSampleForString:(id)a3
{
  id v4 = a3;
  [(_DPCMSRandomizer *)self epsilon];
  v6 = +[_DPCMSSample cmsSampleWith:v4 privacyParameter:[(_DPCMSRandomizer *)self k] hashFunctionCount:[(_DPCMSRandomizer *)self m] bitCount:v5];

  return v6;
}

- (id)cmsSampleForFragment:(id)a3
{
  id v4 = a3;
  [(_DPCMSRandomizer *)self fragmentEpsilon];
  v6 = +[_DPCMSSample cmsSampleWith:v4 privacyParameter:[(_DPCMSRandomizer *)self fragmentK] hashFunctionCount:[(_DPCMSRandomizer *)self fragmentM] bitCount:v5];

  return v6;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"%@: { epsilon=%.16g ; m=%ld ; k=%ld ; fragmentEpsilon=%.16g ; fragmentM=%ld ; fragmentK=%ld }",
    v5,
    *(void *)&self->_epsilon,
    self->_m,
    self->_k,
    *(void *)&self->_fragmentEpsilon,
    self->_fragmentM,
  v6 = self->_fragmentK);

  return (NSString *)v6;
}

- (id)randomizeStrings:(id)a3 forKey:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
  [v8 timeIntervalSinceReferenceDate];
  double v10 = v9;

  id v23 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v6;
  uint64_t v11 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x1E019F810]();
        BOOL v17 = [(_DPCMSRandomizer *)self cmsSampleForString:v15];
        BOOL v18 = [_DPCMSSequenceRecord alloc];
        v19 = [v17 bitString];
        objc_super v20 = -[_DPCMSSequenceRecord initWithKey:plainSequence:sequence:sequenceHashIndex:creationDate:submitted:objectId:](v18, "initWithKey:plainSequence:sequence:sequenceHashIndex:creationDate:submitted:objectId:", v7, v15, v19, (unsigned __int16)[v17 hashFunctionIndex], 0, 0, v10);

        if (v20) {
          [v23 addObject:v20];
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v12);
  }

  return v23;
}

- (id)randomizeWords:(id)a3 fragmentWidth:(unint64_t)a4 forKey:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([v7 count] == 2)
  {
    double v9 = [v7 objectAtIndexedSubscript:0];
    double v10 = [v7 objectAtIndexedSubscript:1];
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
    [v11 timeIntervalSinceReferenceDate];
    double v13 = v12;

    v14 = [v9 word];
    uint64_t v15 = [(_DPCMSRandomizer *)self cmsSampleForString:v14];

    v16 = [v10 word];
    BOOL v17 = [(_DPCMSRandomizer *)self cmsSampleForFragment:v16];

    v32 = [_DPCMSWordRecord alloc];
    v35 = v9;
    BOOL v18 = [v9 word];
    v19 = [v15 bitString];
    v33 = v15;
    id v20 = v8;
    unsigned __int16 v21 = [v15 hashFunctionIndex];
    v22 = [v10 word];
    id v23 = [v17 bitString];
    LOWORD(v15) = [v17 hashFunctionIndex];
    v34 = v10;
    long long v24 = [v10 wordPosition];
    __int16 v25 = [v24 shortValue];
    BYTE4(v31) = 0;
    uint64_t v26 = v21;
    id v8 = v20;
    WORD1(v31) = v25;
    LOWORD(v31) = (_WORD)v15;
    long long v27 = -[_DPCMSWordRecord initWithKey:plainSequence:sequence:sequenceHashIndex:plainFragment:fragment:fragmentHashIndex:fragmentPosition:creationDate:submitted:objectId:](v32, "initWithKey:plainSequence:sequence:sequenceHashIndex:plainFragment:fragment:fragmentHashIndex:fragmentPosition:creationDate:submitted:objectId:", v20, v18, v19, v26, v22, v23, v13, v31, 0);

    v28 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    uint64_t v29 = v28;
    if (v27) {
      [v28 addObject:v27];
    }
  }
  else
  {
    uint64_t v29 = 0;
  }

  return v29;
}

- (id)randomizeBitValues:(id)a3 forKey:(id)a4
{
  return 0;
}

- (double)epsilon
{
  return self->_epsilon;
}

- (unint64_t)m
{
  return self->_m;
}

- (unint64_t)k
{
  return self->_k;
}

- (double)fragmentEpsilon
{
  return self->_fragmentEpsilon;
}

- (unint64_t)fragmentM
{
  return self->_fragmentM;
}

- (unint64_t)fragmentK
{
  return self->_fragmentK;
}

@end