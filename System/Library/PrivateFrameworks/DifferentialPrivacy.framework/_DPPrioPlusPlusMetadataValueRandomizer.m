@interface _DPPrioPlusPlusMetadataValueRandomizer
+ (id)randomizerWithEpsilon:(double)a3 dimensionality:(unint64_t)a4 dynamicVectorSize:(BOOL)a5;
- (BOOL)dynamicVectorSize;
- (_DPPrioPlusPlusMetadataValueRandomizer)init;
- (_DPPrioPlusPlusMetadataValueRandomizer)initWithEpsilon:(double)a3 dimensionality:(unint64_t)a4 dynamicVectorSize:(BOOL)a5;
- (double)epsilon;
- (id)randomizeBitValues:(id)a3 forKey:(id)a4;
- (id)randomizeBitVector:(id)a3 metadata:(id)a4;
- (id)randomizeBitVectors:(id)a3 forKey:(id)a4;
- (id)randomizeBitVectors:(id)a3 metadata:(id)a4 forKey:(id)a5;
- (id)randomizeStrings:(id)a3 forKey:(id)a4;
- (id)randomizeWords:(id)a3 fragmentWidth:(unint64_t)a4 forKey:(id)a5;
- (unint64_t)p;
@end

@implementation _DPPrioPlusPlusMetadataValueRandomizer

- (_DPPrioPlusPlusMetadataValueRandomizer)init
{
  return 0;
}

- (_DPPrioPlusPlusMetadataValueRandomizer)initWithEpsilon:(double)a3 dimensionality:(unint64_t)a4 dynamicVectorSize:(BOOL)a5
{
  if (!a4 || (a3 >= 0.0 ? (BOOL v6 = a3 > 16.0) : (BOOL v6 = 1), v6))
  {
    v7 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)_DPPrioPlusPlusMetadataValueRandomizer;
    v10 = [(_DPPrioPlusPlusMetadataValueRandomizer *)&v12 init];
    if (v10)
    {
      v10->_epsilon = a3;
      v10->_p = a4;
      v10->_dynamicVectorSize = a5;
    }
    self = v10;
    v7 = self;
  }

  return v7;
}

+ (id)randomizerWithEpsilon:(double)a3 dimensionality:(unint64_t)a4 dynamicVectorSize:(BOOL)a5
{
  v5 = (void *)[objc_alloc((Class)a1) initWithEpsilon:a4 dimensionality:a5 dynamicVectorSize:a3];
  return v5;
}

- (id)randomizeBitVector:(id)a3 metadata:(id)a4
{
  id v5 = a3;
  if ([(_DPPrioPlusPlusMetadataValueRandomizer *)self dynamicVectorSize]) {
    uint64_t v6 = [v5 length];
  }
  else {
    uint64_t v6 = [(_DPPrioPlusPlusMetadataValueRandomizer *)self p];
  }
  uint64_t v7 = v6;
  id v8 = v5;
  uint64_t v9 = [v8 bytes];
  if ([v8 length])
  {
    uint64_t v10 = 0;
    while (*(unsigned __int8 *)(v9 + v10) <= 1u)
    {
      if (++v10 >= (unint64_t)[v8 length]) {
        goto LABEL_8;
      }
    }
    v13 = 0;
  }
  else
  {
LABEL_8:
    v11 = +[_DPPrioPlusPlusMetadataAlgorithm initializeWithDimensionality:v7];
    objc_super v12 = v11;
    if (v11)
    {
      v13 = [v11 randomize:v8];
    }
    else
    {
      v14 = +[_DPLog framework];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[_DPPrioPlusPlusMetadataValueRandomizer randomizeBitVector:metadata:](v14);
      }

      v13 = 0;
    }
  }
  return v13;
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

- (id)randomizeBitVectors:(id)a3 forKey:(id)a4
{
  return [(_DPPrioPlusPlusMetadataValueRandomizer *)self randomizeBitVectors:a3 metadata:MEMORY[0x1E4F1CC08] forKey:a4];
}

- (id)randomizeBitVectors:(id)a3 metadata:(id)a4 forKey:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
  [v11 timeIntervalSinceReferenceDate];
  double v13 = v12;

  id v30 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v8;
  uint64_t v14 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v35;
    do
    {
      uint64_t v17 = 0;
      uint64_t v29 = v15;
      do
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(obj);
        }
        v18 = [(_DPPrioPlusPlusMetadataValueRandomizer *)self randomizeBitVector:*(void *)(*((void *)&v34 + 1) + 8 * v17) metadata:v9];
        if ([v18 count])
        {
          v33 = [v18 objectForKeyedSubscript:@"share1"];
          v32 = [v18 objectForKeyedSubscript:@"share2"];
          v19 = [v18 objectForKeyedSubscript:@"dimensionality"];
          id v20 = v9;
          if ([(_DPPrioPlusPlusMetadataValueRandomizer *)self dynamicVectorSize])
          {
            v21 = (void *)[v20 mutableCopy];
            [v21 setObject:v19 forKey:@"dimensionality"];
            uint64_t v22 = v16;
            id v23 = v9;
            v24 = self;
            id v25 = v10;
            uint64_t v26 = [v21 copy];

            id v20 = (id)v26;
            id v10 = v25;
            self = v24;
            id v9 = v23;
            uint64_t v16 = v22;
            uint64_t v15 = v29;
          }
          v27 = -[_DPPrioRecord initWithKey:share1:share2:dimension:metadata:creationDate:submitted:objectId:]([_DPPrioRecord alloc], "initWithKey:share1:share2:dimension:metadata:creationDate:submitted:objectId:", v10, v33, v32, [v19 longLongValue], v20, 0, v13, 0);
          if (v27) {
            [v30 addObject:v27];
          }
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v15);
  }

  return v30;
}

- (double)epsilon
{
  return self->_epsilon;
}

- (unint64_t)p
{
  return self->_p;
}

- (BOOL)dynamicVectorSize
{
  return self->_dynamicVectorSize;
}

- (void)randomizeBitVector:(os_log_t)log metadata:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DC55E000, log, OS_LOG_TYPE_ERROR, "Failed to create _DPPrioPlusPlusMetadataAlgorithm.", v1, 2u);
}

@end