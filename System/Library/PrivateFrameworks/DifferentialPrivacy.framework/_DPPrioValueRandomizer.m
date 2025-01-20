@interface _DPPrioValueRandomizer
+ (id)randomizerWithEpsilon:(double)a3 parameters:(id)a4;
- (BOOL)dynamicVectorSize;
- (NSDictionary)plistParameters;
- (_DPPrioValueRandomizer)init;
- (_DPPrioValueRandomizer)initWithEpsilon:(double)a3 parameters:(id)a4;
- (double)defaultLocalEpsilon;
- (id)randomize:(id)a3 withLocalEpsilon:(double)a4 metadata:(id)a5;
- (id)randomizeBitValues:(id)a3 forKey:(id)a4;
- (id)randomizeBitValues:(id)a3 metadata:(id)a4 forKey:(id)a5;
- (id)randomizeBitVectors:(id)a3 metadata:(id)a4 forKey:(id)a5;
- (id)randomizeStrings:(id)a3 forKey:(id)a4;
- (id)randomizeVector:(id)a3 withLocalEpsilon:(double)a4 metadata:(id)a5;
- (id)randomizeWords:(id)a3 fragmentWidth:(unint64_t)a4 forKey:(id)a5;
- (unint64_t)p;
@end

@implementation _DPPrioValueRandomizer

- (_DPPrioValueRandomizer)init
{
  return 0;
}

- (_DPPrioValueRandomizer)initWithEpsilon:(double)a3 parameters:(id)a4
{
  id v7 = a4;
  v8 = v7;
  if (a3 < 0.0 || a3 > 16.0)
  {
    v10 = 0;
  }
  else
  {
    if (v7)
    {
      v11 = objc_msgSend(v7, "objectForKeyedSubscript:", @"p", 16.0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 unsignedIntegerValue])
      {
        v12 = [v8 objectForKeyedSubscript:@"dynamicVectorSize"];
        char v13 = [v12 BOOLValue];
        v17.receiver = self;
        v17.super_class = (Class)_DPPrioValueRandomizer;
        v14 = [(_DPPrioValueRandomizer *)&v17 init];
        v15 = v14;
        if (v14)
        {
          v14->_defaultLocalEpsilon = a3;
          v14->_p = [v11 unsignedIntegerValue];
          v15->_dynamicVectorSize = v13;
          objc_storeStrong((id *)&v15->_plistParameters, a4);
        }
        self = v15;
        v10 = self;
      }
      else
      {
        v12 = +[_DPLog framework];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[_DPPrioValueRandomizer initWithEpsilon:parameters:]();
        }
        v10 = 0;
      }
    }
    else
    {
      v11 = +[_DPLog framework];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[_DPPrioValueRandomizer initWithEpsilon:parameters:]();
      }
      v10 = 0;
    }
  }
  return v10;
}

+ (id)randomizerWithEpsilon:(double)a3 parameters:(id)a4
{
  id v6 = a4;
  id v7 = (void *)[objc_alloc((Class)a1) initWithEpsilon:v6 parameters:a3];

  return v7;
}

- (id)randomize:(id)a3 withLocalEpsilon:(double)a4 metadata:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unint64_t v10 = [(_DPPrioValueRandomizer *)self p];
  if ([(_DPPrioValueRandomizer *)self dynamicVectorSize])
  {
    v11 = [NSString stringWithFormat:@"%@.%@", @"AlgorithmParameters", @"Dimensionality"];
    v12 = [v9 valueForKeyPath:v11];
    char v13 = v12;
    if (v12) {
      unint64_t v10 = [v12 unsignedIntegerValue];
    }
  }
  if (v10 < 0x186A1)
  {
    v14 = +[_DPPrioAlgorithm prioWithEpsilon:v10 dimensionality:a4];
    if (v14)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __62___DPPrioValueRandomizer_randomize_withLocalEpsilon_metadata___block_invoke;
      v18[3] = &unk_1E6C447C0;
      v19 = v8;
      v15 = [v14 privatizeDataWithBlock:v18];
      v16 = v19;
    }
    else
    {
      v16 = +[_DPLog framework];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[_DPPrioValueRandomizer randomize:withLocalEpsilon:metadata:]();
      }
      v15 = 0;
    }
  }
  else
  {
    v14 = +[_DPLog framework];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[_DPPrioValueRandomizer randomize:withLocalEpsilon:metadata:]();
    }
    v15 = 0;
  }

  return v15;
}

- (id)randomizeVector:(id)a3 withLocalEpsilon:(double)a4 metadata:(id)a5
{
  id v7 = a3;
  if ([(_DPPrioValueRandomizer *)self dynamicVectorSize]) {
    uint64_t v8 = [v7 length];
  }
  else {
    uint64_t v8 = [(_DPPrioValueRandomizer *)self p];
  }
  id v9 = +[_DPPrioAlgorithm prioWithEpsilon:v8 dimensionality:a4];
  if (v9)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __68___DPPrioValueRandomizer_randomizeVector_withLocalEpsilon_metadata___block_invoke;
    v13[3] = &unk_1E6C447C0;
    v14 = v7;
    unint64_t v10 = [v9 privatizeDataWithBlock:v13];
    v11 = v14;
  }
  else
  {
    v11 = +[_DPLog framework];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[_DPPrioValueRandomizer randomize:withLocalEpsilon:metadata:]();
    }
    unint64_t v10 = 0;
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

- (id)randomizeBitValues:(id)a3 metadata:(id)a4 forKey:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v35 = a5;
  unint64_t v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
  [v10 timeIntervalSinceReferenceDate];
  double v12 = v11;

  v36 = self;
  char v13 = [(_DPPrioValueRandomizer *)self plistParameters];
  id v44 = 0;
  v14 = +[_DPBudgetAuditor budgetAuditorFromMetadata:v9 plistParameters:v13 error:&v44];
  id v15 = v44;

  if (v14)
  {
    id v43 = v15;
    uint64_t v16 = [v14 getSymmetricRAPPORLocalEpsilonWithError:&v43];
    id v17 = v43;

    v37 = v16;
    if (v16)
    {
      id v42 = v17;
      v18 = [v14 auditedMetadataWithError:&v42];
      id v15 = v42;

      if (v18)
      {
        id v33 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        obj = v8;
        uint64_t v19 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          id v30 = v15;
          id v31 = v9;
          id v32 = v8;
          uint64_t v21 = *(void *)v39;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v39 != v21) {
                objc_enumerationMutation(obj);
              }
              uint64_t v23 = *(void *)(*((void *)&v38 + 1) + 8 * i);
              [v37 doubleValue];
              v24 = -[_DPPrioValueRandomizer randomize:withLocalEpsilon:metadata:](v36, "randomize:withLocalEpsilon:metadata:", v23, v18);
              if ([v24 count])
              {
                v25 = [v24 objectForKeyedSubscript:@"share1"];
                v26 = [v24 objectForKeyedSubscript:@"share2"];
                v27 = [v24 objectForKeyedSubscript:@"dimensionality"];
                v28 = -[_DPPrioRecord initWithKey:share1:share2:dimension:metadata:creationDate:submitted:objectId:]([_DPPrioRecord alloc], "initWithKey:share1:share2:dimension:metadata:creationDate:submitted:objectId:", v35, v25, v26, [v27 longLongValue], v18, 0, v12, 0);
                if (v28) {
                  [v33 addObject:v28];
                }
              }
            }
            uint64_t v20 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
          }
          while (v20);
          id v9 = v31;
          id v8 = v32;
          id v15 = v30;
        }
      }
      else
      {
        obj = +[_DPLog framework];
        if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
          -[_DPPrio3SumVectorRandomizer randomizeBitValues:metadata:forKey:]();
        }
        id v33 = 0;
      }
    }
    else
    {
      id v33 = 0;
      id v15 = v17;
    }
  }
  else
  {
    v37 = +[_DPLog framework];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[_DPPrio3SumVectorRandomizer randomizeBitValues:metadata:forKey:]();
    }
    id v33 = 0;
  }

  return v33;
}

- (id)randomizeBitVectors:(id)a3 metadata:(id)a4 forKey:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
  [v11 timeIntervalSinceReferenceDate];
  double v13 = v12;

  v14 = [(_DPPrioValueRandomizer *)self plistParameters];
  id v48 = 0;
  id v15 = +[_DPBudgetAuditor budgetAuditorFromMetadata:v9 plistParameters:v14 error:&v48];
  id v16 = v48;

  if (v15)
  {
    id v47 = v16;
    uint64_t v17 = [v15 getSymmetricRAPPORLocalEpsilonWithError:&v47];
    id v18 = v47;

    v36 = v17;
    if (v17)
    {
      id v46 = v18;
      uint64_t v19 = [v15 auditedMetadataWithError:&v46];
      id v16 = v46;

      if (v19)
      {
        id v32 = v16;
        id v33 = v15;
        id v34 = v9;
        id v37 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v35 = v8;
        id obj = v8;
        uint64_t v41 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
        if (v41)
        {
          uint64_t v40 = *(void *)v43;
          uint64_t v20 = (void *)v17;
          long long v39 = self;
          do
          {
            for (uint64_t i = 0; i != v41; ++i)
            {
              if (*(void *)v43 != v40) {
                objc_enumerationMutation(obj);
              }
              uint64_t v22 = *(void *)(*((void *)&v42 + 1) + 8 * i);
              [v20 doubleValue];
              uint64_t v23 = -[_DPPrioValueRandomizer randomizeVector:withLocalEpsilon:metadata:](self, "randomizeVector:withLocalEpsilon:metadata:", v22, v19);
              if ([v23 count])
              {
                v24 = [v23 objectForKeyedSubscript:@"share1"];
                [v23 objectForKeyedSubscript:@"share2"];
                v26 = v25 = self;
                v27 = [v23 objectForKeyedSubscript:@"dimensionality"];
                if ([(_DPPrioValueRandomizer *)v25 dynamicVectorSize])
                {
                  id v28 = [v19 mutableCopy];
                  [v28 setObject:v27 forKey:@"dimensionality"];
                  uint64_t v29 = [v28 copy];

                  uint64_t v20 = v36;
                }
                else
                {
                  uint64_t v29 = (uint64_t)v19;
                }
                uint64_t v19 = v29;
                id v30 = -[_DPPrioRecord initWithKey:share1:share2:dimension:metadata:creationDate:submitted:objectId:]([_DPPrioRecord alloc], "initWithKey:share1:share2:dimension:metadata:creationDate:submitted:objectId:", v10, v24, v26, [v27 longLongValue], v29, 0, v13, 0);
                if (v30) {
                  [v37 addObject:v30];
                }

                self = v39;
              }
            }
            uint64_t v41 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
          }
          while (v41);
        }

        id v9 = v34;
        id v8 = v35;
        id v16 = v32;
        id v15 = v33;
      }
      else
      {
        uint64_t v19 = +[_DPLog framework];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[_DPPrio3SumVectorRandomizer randomizeBitValues:metadata:forKey:]();
        }
        id v37 = 0;
      }
    }
    else
    {
      id v37 = 0;
      id v16 = v18;
    }
  }
  else
  {
    v36 = +[_DPLog framework];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      -[_DPPrio3SumVectorRandomizer randomizeBitValues:metadata:forKey:]();
    }
    id v37 = 0;
  }

  return v37;
}

- (double)defaultLocalEpsilon
{
  return self->_defaultLocalEpsilon;
}

- (unint64_t)p
{
  return self->_p;
}

- (BOOL)dynamicVectorSize
{
  return self->_dynamicVectorSize;
}

- (NSDictionary)plistParameters
{
  return self->_plistParameters;
}

- (void).cxx_destruct
{
}

- (void)initWithEpsilon:parameters:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1DC55E000, v0, v1, "Malformed plist parameters, expect non-nil parameters.", v2, v3, v4, v5, v6);
}

- (void)initWithEpsilon:parameters:.cold.2()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1DC55E000, v0, v1, "Prio default dimension p must be provided, and cannot be 0.", v2, v3, v4, v5, v6);
}

- (void)randomize:withLocalEpsilon:metadata:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v2 = 2048;
  uint64_t v3 = 100000;
  _os_log_error_impl(&dword_1DC55E000, v0, OS_LOG_TYPE_ERROR, "Dimensionality=(%lu) should be less than or equal to %zu", v1, 0x16u);
}

- (void)randomize:withLocalEpsilon:metadata:.cold.2()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1DC55E000, v0, v1, "Failed to create PrioAlgorithm.", v2, v3, v4, v5, v6);
}

@end