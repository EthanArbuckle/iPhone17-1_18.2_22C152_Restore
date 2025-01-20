@interface _DPPrioPlusPlusMetricsValueRandomizer
+ (id)randomizerWithEpsilon:(double)a3 delta:(double)a4 maxLength:(unint64_t)a5;
- (_DPPrioPlusPlusMetricsValueRandomizer)init;
- (_DPPrioPlusPlusMetricsValueRandomizer)initWithEpsilon:(double)a3 delta:(double)a4 maxLength:(unint64_t)a5;
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

@implementation _DPPrioPlusPlusMetricsValueRandomizer

- (_DPPrioPlusPlusMetricsValueRandomizer)init
{
  return 0;
}

- (_DPPrioPlusPlusMetricsValueRandomizer)initWithEpsilon:(double)a3 delta:(double)a4 maxLength:(unint64_t)a5
{
  BOOL v6 = a3 < 0.0 || a3 > 16.0;
  if (v6 || (a4 > 0.0 ? (BOOL v9 = a5 == 0) : (BOOL v9 = 1), v9))
  {
    v10 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_DPPrioPlusPlusMetricsValueRandomizer;
    v11 = [(_DPPrioPlusPlusMetricsValueRandomizer *)&v13 init];
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
  id v5 = a3;
  unint64_t v6 = (unint64_t)[v5 length] >> 2;
  unint64_t n = self->_n;
  p_unint64_t n = (uint64_t *)&self->_n;
  if (v6 <= n)
  {
    v10 = +[_DPPrioPlusPlusMetricsAlgorithm initializeWithSecretSharingSigma:v6 dimensionality:1000.0];
    BOOL v9 = v10;
    if (v10)
    {
      v11 = [v10 randomize:v5];
      goto LABEL_10;
    }
    v12 = +[_DPLog framework];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[_DPPrioPlusPlusMetricsValueRandomizer randomizeFloatVector:metadata:](v12);
    }
  }
  else
  {
    BOOL v9 = +[_DPLog framework];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_DPPrioPlusPlusMetricsValueRandomizer randomizeFloatVector:metadata:](p_n, v6, v9);
    }
  }
  v11 = 0;
LABEL_10:

  return v11;
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
  return [(_DPPrioPlusPlusMetricsValueRandomizer *)self randomizeFloatVectors:a3 metadata:MEMORY[0x1E4F1CC08] forKey:a4];
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
        v16 = [(_DPPrioPlusPlusMetricsValueRandomizer *)self randomizeFloatVector:*(void *)(*((void *)&v27 + 1) + 8 * i) metadata:v8];
        if ([v16 count])
        {
          v17 = [v16 objectForKeyedSubscript:@"share1"];
          v18 = [v16 objectForKeyedSubscript:@"share2"];
          v19 = [v16 objectForKeyedSubscript:@"dimensionality"];
          id v20 = v8;
          v21 = -[_DPPrioRecord initWithKey:share1:share2:dimension:metadata:creationDate:submitted:objectId:]([_DPPrioRecord alloc], "initWithKey:share1:share2:dimension:metadata:creationDate:submitted:objectId:", v25, v17, v18, [v19 longLongValue], v20, 0, v11, 0);
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
  _os_log_error_impl(&dword_1DC55E000, log, OS_LOG_TYPE_ERROR, "Float vector dimension %lu exceeds limit %lu for PrioPlusPlusMetricsAlgorithm.", (uint8_t *)&v4, 0x16u);
}

- (void)randomizeFloatVector:(os_log_t)log metadata:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DC55E000, log, OS_LOG_TYPE_ERROR, "Failed to create _DPPrioPlusPlusMetricsAlgorithm.", v1, 2u);
}

@end