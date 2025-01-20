@interface _DPHCMSRandomizer
+ (id)randomizerWithEpsilon:(double)a3 bitCount:(unint64_t)a4 hashFunctionCount:(unint64_t)a5;
+ (id)randomizerWithEpsilon:(double)a3 bitCount:(unint64_t)a4 hashFunctionCount:(unint64_t)a5 fragmentEpsilon:(double)a6 fragmentBitCount:(unint64_t)a7 fragmentHashFunctionCount:(unint64_t)a8;
- (NSString)description;
- (_DPHCMSRandomizer)init;
- (_DPHCMSRandomizer)initWithEpsilon:(double)a3 bitCount:(unint64_t)a4 hashFunctionCount:(unint64_t)a5;
- (_DPHCMSRandomizer)initWithEpsilon:(double)a3 bitCount:(unint64_t)a4 hashFunctionCount:(unint64_t)a5 fragmentEpsilon:(double)a6 fragmentBitCount:(unint64_t)a7 fragmentHashFunctionCount:(unint64_t)a8;
- (double)epsilon;
- (double)fragmentEpsilon;
- (id)hcmsSampleForFragment:(id)a3;
- (id)hcmsSampleForString:(id)a3;
- (id)randomizeBitValues:(id)a3 forKey:(id)a4;
- (id)randomizeStrings:(id)a3 forKey:(id)a4;
- (id)randomizeWords:(id)a3 fragmentWidth:(unint64_t)a4 forKey:(id)a5;
- (unint64_t)fragmentK;
- (unint64_t)fragmentM;
- (unint64_t)k;
- (unint64_t)m;
@end

@implementation _DPHCMSRandomizer

- (_DPHCMSRandomizer)init
{
  return 0;
}

- (_DPHCMSRandomizer)initWithEpsilon:(double)a3 bitCount:(unint64_t)a4 hashFunctionCount:(unint64_t)a5 fragmentEpsilon:(double)a6 fragmentBitCount:(unint64_t)a7 fragmentHashFunctionCount:(unint64_t)a8
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
            v20.super_class = (Class)_DPHCMSRandomizer;
            v19 = [(_DPHCMSRandomizer *)&v20 init];
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

- (_DPHCMSRandomizer)initWithEpsilon:(double)a3 bitCount:(unint64_t)a4 hashFunctionCount:(unint64_t)a5
{
  return [(_DPHCMSRandomizer *)self initWithEpsilon:a4 bitCount:a5 hashFunctionCount:a4 fragmentEpsilon:a5 fragmentBitCount:a3 fragmentHashFunctionCount:a3];
}

+ (id)randomizerWithEpsilon:(double)a3 bitCount:(unint64_t)a4 hashFunctionCount:(unint64_t)a5
{
  v5 = (void *)[objc_alloc((Class)a1) initWithEpsilon:a4 bitCount:a5 hashFunctionCount:a3];
  return v5;
}

+ (id)randomizerWithEpsilon:(double)a3 bitCount:(unint64_t)a4 hashFunctionCount:(unint64_t)a5 fragmentEpsilon:(double)a6 fragmentBitCount:(unint64_t)a7 fragmentHashFunctionCount:(unint64_t)a8
{
  v8 = (void *)[objc_alloc((Class)a1) initWithEpsilon:a4 bitCount:a5 hashFunctionCount:a7 fragmentEpsilon:a8 fragmentBitCount:a3 fragmentHashFunctionCount:a6];
  return v8;
}

- (id)hcmsSampleForString:(id)a3
{
  id v4 = a3;
  [(_DPHCMSRandomizer *)self epsilon];
  v6 = +[_DPHCMSSample hcmsSampleWith:v4 privacyParameter:[(_DPHCMSRandomizer *)self k] hashFunctionCount:[(_DPHCMSRandomizer *)self m] bitCount:v5];

  return v6;
}

- (id)hcmsSampleForFragment:(id)a3
{
  id v4 = a3;
  [(_DPHCMSRandomizer *)self fragmentEpsilon];
  v6 = +[_DPHCMSSample hcmsSampleWith:v4 privacyParameter:[(_DPHCMSRandomizer *)self fragmentK] hashFunctionCount:[(_DPHCMSRandomizer *)self fragmentM] bitCount:v5];

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
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
  [v8 timeIntervalSinceReferenceDate];
  double v10 = v9;

  id v22 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v6;
  uint64_t v11 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v16 = [(_DPHCMSRandomizer *)self hcmsSampleForString:v15];
        BOOL v17 = [_DPHCMSSequenceRecord alloc];
        BOOL v18 = [v16 bitString];
        v19 = -[_DPHCMSSequenceRecord initWithKey:plainSequence:sequence:sequenceHashIndex:sequenceBitIndex:creationDate:submitted:objectId:](v17, "initWithKey:plainSequence:sequence:sequenceHashIndex:sequenceBitIndex:creationDate:submitted:objectId:", v7, v15, v18, (unsigned __int16)[v16 hashFunctionIndex], objc_msgSend(v16, "bitIndex"), 0, v10, 0);

        if (v19) {
          [v22 addObject:v19];
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v12);
  }

  return v22;
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
    uint64_t v15 = [(_DPHCMSRandomizer *)self hcmsSampleForString:v14];

    v16 = [v10 word];
    BOOL v17 = [(_DPHCMSRandomizer *)self hcmsSampleForFragment:v16];

    v35 = [_DPHCMSWordRecord alloc];
    v36 = v9;
    v34 = [v9 word];
    v33 = [v15 bitString];
    id v37 = v8;
    unsigned __int16 v18 = [v15 hashFunctionIndex];
    uint64_t v32 = [v15 bitIndex];
    v19 = [v10 word];
    objc_super v20 = [v17 bitString];
    __int16 v21 = [v17 hashFunctionIndex];
    int v22 = [v17 bitIndex];
    long long v23 = [v10 wordPosition];
    __int16 v24 = [v23 unsignedShortValue];
    BYTE2(v31) = 0;
    uint64_t v25 = v18;
    id v8 = v37;
    LOWORD(v31) = v24;
    HIDWORD(v30) = v22;
    LOWORD(v30) = v21;
    long long v26 = -[_DPHCMSWordRecord initWithKey:plainSequence:sequence:sequenceHashIndex:sequenceBitIndex:plainFragment:fragment:fragmentHashIndex:fragmentBitIndex:fragmentPosition:creationDate:submitted:objectId:](v35, "initWithKey:plainSequence:sequence:sequenceHashIndex:sequenceBitIndex:plainFragment:fragment:fragmentHashIndex:fragmentBitIndex:fragmentPosition:creationDate:submitted:objectId:", v37, v34, v33, v25, v32, v19, v13, v20, v30, v31, 0);

    v27 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    uint64_t v28 = v27;
    if (v26) {
      [v27 addObject:v26];
    }
  }
  else
  {
    uint64_t v28 = 0;
  }

  return v28;
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