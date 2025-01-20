@interface _DPPrioPlusPlusValueRandomizer
+ (id)randomizerWithEpsilon:(double)a3 delta:(double)a4 maxLength:(unint64_t)a5;
+ (id)reconstructedDataFromShare1:(id)a3 share2:(id)a4;
- (_DPPrioPlusPlusValueRandomizer)init;
- (_DPPrioPlusPlusValueRandomizer)initWithEpsilon:(double)a3 delta:(double)a4 maxLength:(unint64_t)a5;
- (double)delta;
- (double)epsilon;
- (id)randomizeBitValues:(id)a3 forKey:(id)a4;
- (id)randomizeFloatVector:(id)a3 metadata:(id)a4;
- (id)randomizeFloatVectors:(id)a3 forKey:(id)a4;
- (id)randomizeFloatVectors:(id)a3 metadata:(id)a4 forKey:(id)a5;
- (id)randomizeStrings:(id)a3 forKey:(id)a4;
- (id)randomizeWords:(id)a3 fragmentWidth:(unint64_t)a4 forKey:(id)a5;
- (unint64_t)n;
@end

@implementation _DPPrioPlusPlusValueRandomizer

- (_DPPrioPlusPlusValueRandomizer)init
{
  return 0;
}

- (_DPPrioPlusPlusValueRandomizer)initWithEpsilon:(double)a3 delta:(double)a4 maxLength:(unint64_t)a5
{
  BOOL v6 = a3 < 0.0 || a3 > 16.0;
  if (v6 || (a4 > 0.0 ? (BOOL v9 = a5 == 0) : (BOOL v9 = 1), v9))
  {
    v10 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_DPPrioPlusPlusValueRandomizer;
    v11 = [(_DPPrioPlusPlusValueRandomizer *)&v13 init];
    if (v11)
    {
      v11->_epsilon = a3;
      v11->_delta = a4;
      v11->_n = a5;
    }
    self = v11;
    v10 = self;
  }

  return v10;
}

+ (id)randomizerWithEpsilon:(double)a3 delta:(double)a4 maxLength:(unint64_t)a5
{
  v5 = (void *)[objc_alloc((Class)a1) initWithEpsilon:a5 delta:a3 maxLength:a4];
  return v5;
}

- (id)randomizeFloatVector:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = (unint64_t)[v6 length] >> 2;
  p_n = (uint64_t *)&self->_n;
  if (v8 <= self->_n)
  {
    [(_DPPrioPlusPlusValueRandomizer *)self epsilon];
    double v12 = v11;
    [(_DPPrioPlusPlusValueRandomizer *)self delta];
    v14 = +[_DPRandomizerUtils auditedDPParametersWithMetadata:v7 maxCentralEpsilon:v12 maxCentralDelta:v13];

    if (v14)
    {
      v15 = [v7 objectForKeyedSubscript:@"AlgorithmParameters"];
      v16 = [v15 objectForKeyedSubscript:@"SigmaAfterNormalizing"];
      [v16 doubleValue];
      double v18 = v17;

      v19 = [v7 objectForKeyedSubscript:@"AlgorithmParameters"];
      v20 = [v19 objectForKeyedSubscript:@"CurrentCohortSize"];

      if (v20)
      {
        v21 = [v7 objectForKeyedSubscript:@"AlgorithmParameters"];
        v22 = [v21 objectForKeyedSubscript:@"CurrentCohortSize"];
        double v18 = v18 / sqrt((double)[v22 longLongValue]);
      }
      v23 = +[_DPPrioPlusPlusAlgorithm initializeWithSigma:v8 secretSharingSigma:v18 dimensionality:1000.0];
      v10 = v23;
      if (v23)
      {
        v24 = [v23 randomize:v6];
        goto LABEL_15;
      }
      v32 = +[_DPLog framework];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[_DPPrioPlusPlusValueRandomizer randomizeFloatVector:metadata:](v32, v33, v34, v35, v36, v37, v38, v39);
      }
    }
    else
    {
      v10 = +[_DPLog framework];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[_DPPrioPlusPlusValueRandomizer randomizeFloatVector:metadata:](v10, v25, v26, v27, v28, v29, v30, v31);
      }
    }
  }
  else
  {
    v10 = +[_DPLog framework];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[_DPPrioPlusPlusValueRandomizer randomizeFloatVector:metadata:](p_n, v8, v10);
    }
  }
  v24 = 0;
LABEL_15:

  return v24;
}

+ (id)reconstructedDataFromShare1:(id)a3 share2:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [v5 length];
  unint64_t v8 = v7 >> 2;
  BOOL v9 = +[_DPGaussianPRNG randomFloatVectorFromSeed:v6 length:v7 >> 2 mean:0.0 stddev:1000.0];
  if (v9)
  {
    v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v8];
    double v11 = (int *)[v5 bytes];
    uint64_t v12 = [v9 bytes];
    if (v7 >= 4)
    {
      v14 = (float *)v12;
      if (v8 <= 1) {
        uint64_t v15 = 1;
      }
      else {
        uint64_t v15 = v7 >> 2;
      }
      do
      {
        int v16 = *v11++;
        LODWORD(v13) = v16;
        float v17 = *v14++;
        *(float *)&double v13 = *(float *)&v13 + v17;
        double v18 = [NSNumber numberWithFloat:v13];
        [v10 addObject:v18];

        --v15;
      }
      while (v15);
    }
  }
  else
  {
    v19 = +[_DPLog framework];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      +[_DPPrioPlusPlusValueRandomizer reconstructedDataFromShare1:share2:](v19, v20, v21, v22, v23, v24, v25, v26);
    }

    v10 = 0;
  }

  return v10;
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
  return 0;
}

- (id)randomizeFloatVectors:(id)a3 forKey:(id)a4
{
  return [(_DPPrioPlusPlusValueRandomizer *)self randomizeFloatVectors:a3 metadata:MEMORY[0x1E4F1CC08] forKey:a4];
}

- (id)randomizeFloatVectors:(id)a3 metadata:(id)a4 forKey:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v25 = a5;
  BOOL v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
  [v9 timeIntervalSinceReferenceDate];
  double v11 = v10;

  id v23 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v7;
  uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(obj);
        }
        int v16 = [(_DPPrioPlusPlusValueRandomizer *)self randomizeFloatVector:*(void *)(*((void *)&v27 + 1) + 8 * i) metadata:v8];
        if ([v16 count])
        {
          float v17 = [v16 objectForKeyedSubscript:@"share1"];
          double v18 = [v16 objectForKeyedSubscript:@"share2"];
          v19 = [v16 objectForKeyedSubscript:@"dimensionality"];
          id v20 = v8;
          uint64_t v21 = -[_DPPrioRecord initWithKey:share1:share2:dimension:metadata:creationDate:submitted:objectId:]([_DPPrioRecord alloc], "initWithKey:share1:share2:dimension:metadata:creationDate:submitted:objectId:", v25, v17, v18, [v19 longLongValue], v20, 0, v11, 0);
          if (v21) {
            [v23 addObject:v21];
          }
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v13);
  }

  return v23;
}

- (double)epsilon
{
  return self->_epsilon;
}

- (double)delta
{
  return self->_delta;
}

- (unint64_t)n
{
  return self->_n;
}

- (void)randomizeFloatVector:(os_log_t)log metadata:.cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 134218240;
  uint64_t v5 = a2;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1DC55E000, log, OS_LOG_TYPE_ERROR, "Float vector dimension %lu exceeds limit %lu for PrioPlusPlusAlgorithm.", (uint8_t *)&v4, 0x16u);
}

- (void)randomizeFloatVector:(uint64_t)a3 metadata:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)randomizeFloatVector:(uint64_t)a3 metadata:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)reconstructedDataFromShare1:(uint64_t)a3 share2:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end