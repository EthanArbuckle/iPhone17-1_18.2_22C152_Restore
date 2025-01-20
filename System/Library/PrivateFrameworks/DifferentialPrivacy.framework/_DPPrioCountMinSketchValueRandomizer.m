@interface _DPPrioCountMinSketchValueRandomizer
+ (id)randomizerWithEpsilon:(double)a3 bitCount:(unint64_t)a4 hashFunctionCount:(unint64_t)a5;
- (_DPPrioCountMinSketchValueRandomizer)init;
- (_DPPrioCountMinSketchValueRandomizer)initWithEpsilon:(double)a3 bitCount:(unint64_t)a4 hashFunctionCount:(unint64_t)a5;
- (double)epsilon;
- (id)randomize:(id)a3 metadata:(id)a4;
- (id)randomizeBitValues:(id)a3 forKey:(id)a4;
- (id)randomizeStrings:(id)a3 forKey:(id)a4;
- (id)randomizeStrings:(id)a3 metadata:(id)a4 forKey:(id)a5;
- (id)randomizeWords:(id)a3 fragmentWidth:(unint64_t)a4 forKey:(id)a5;
- (unint64_t)k;
- (unint64_t)m;
@end

@implementation _DPPrioCountMinSketchValueRandomizer

- (_DPPrioCountMinSketchValueRandomizer)init
{
  return 0;
}

- (_DPPrioCountMinSketchValueRandomizer)initWithEpsilon:(double)a3 bitCount:(unint64_t)a4 hashFunctionCount:(unint64_t)a5
{
  v5 = 0;
  if (a5 && a4 && a3 >= 0.0 && a3 <= 16.0)
  {
    v12.receiver = self;
    v12.super_class = (Class)_DPPrioCountMinSketchValueRandomizer;
    v10 = [(_DPPrioCountMinSketchValueRandomizer *)&v12 init];
    if (v10)
    {
      v10->_epsilon = a3;
      v10->_m = a4;
      v10->_k = a5;
    }
    self = v10;
    v5 = self;
  }

  return v5;
}

+ (id)randomizerWithEpsilon:(double)a3 bitCount:(unint64_t)a4 hashFunctionCount:(unint64_t)a5
{
  v5 = (void *)[objc_alloc((Class)a1) initWithEpsilon:a4 bitCount:a5 hashFunctionCount:a3];
  return v5;
}

- (id)randomize:(id)a3 metadata:(id)a4
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = [(_DPPrioCountMinSketchValueRandomizer *)self m];
  unint64_t v7 = [(_DPPrioCountMinSketchValueRandomizer *)self k];
  [(_DPPrioCountMinSketchValueRandomizer *)self epsilon];
  v9 = +[_DPPrioAlgorithm prioWithEpsilon:[(_DPPrioCountMinSketchValueRandomizer *)self m] dimensionality:v8];
  if (v9)
  {
    v10 = v5;
    v25 = [MEMORY[0x1E4F1CA58] dataWithCapacity:0];
    v24 = [MEMORY[0x1E4F1CA58] dataWithCapacity:0];
    if (v7)
    {
      int v11 = 0;
      uint64_t v23 = MEMORY[0x1E4F143A8];
      v22 = __59___DPPrioCountMinSketchValueRandomizer_randomize_metadata___block_invoke;
      do
      {
        v26[0] = v23;
        v26[1] = 3221225472;
        v26[2] = __59___DPPrioCountMinSketchValueRandomizer_randomize_metadata___block_invoke;
        v26[3] = &unk_1E6C445E8;
        int v29 = v11;
        id v27 = v10;
        unint64_t v28 = v6;
        objc_super v12 = [v9 privatizeDataWithBlock:v26];
        [v12 objectForKeyedSubscript:@"share1"];
        v13 = v10;
        v15 = v14 = v9;
        [v12 objectForKeyedSubscript:@"share2"];
        unint64_t v16 = v7;
        v18 = unint64_t v17 = v6;
        [v25 appendData:v15];
        [v24 appendData:v18];

        unint64_t v6 = v17;
        unint64_t v7 = v16;

        v9 = v14;
        v10 = v13;

        ++v11;
      }
      while (v16 != v11);
    }
    v30[0] = @"share1";
    v30[1] = @"share2";
    v19 = v25;
    v31[0] = v25;
    v31[1] = v24;
    v20 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v31, v30, 2, v22, v23);

    id v5 = v10;
  }
  else
  {
    v19 = +[_DPLog framework];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[_DPPrioCountMinSketchValueRandomizer randomize:metadata:](v19);
    }
    v20 = 0;
  }

  return v20;
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

- (id)randomizeStrings:(id)a3 metadata:(id)a4 forKey:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v24 = a5;
  v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
  [v10 timeIntervalSinceReferenceDate];
  double v12 = v11;

  id v22 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v8;
  uint64_t v13 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(obj);
        }
        unint64_t v17 = [(_DPPrioCountMinSketchValueRandomizer *)self randomize:*(void *)(*((void *)&v25 + 1) + 8 * i) metadata:v9];
        if ([v17 count])
        {
          v18 = [v17 objectForKeyedSubscript:@"share1"];
          v19 = [v17 objectForKeyedSubscript:@"share2"];
          v20 = [[_DPPrioRecord alloc] initWithKey:v24 share1:v18 share2:v19 dimension:[(_DPPrioCountMinSketchValueRandomizer *)self m] metadata:v9 creationDate:0 submitted:v12 objectId:0];
          if (v20) {
            [v22 addObject:v20];
          }
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v14);
  }

  return v22;
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

- (void)randomize:(os_log_t)log metadata:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DC55E000, log, OS_LOG_TYPE_ERROR, "Failed to create PrioAlgorithm.", v1, 2u);
}

@end