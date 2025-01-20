@interface MLProgramEvaluator
- (MLModeling)model;
- (MLProgramEvaluator)initWithProgram:(id)a3 error:(id *)a4;
- (MLProgramInternal)program;
- (id)evaluateFunction:(id)a3 arguments:(id)a4 context:(id)a5 error:(id *)a6;
- (id)evaluateFunction:(id)a3 arguments:(id)a4 context:(id)a5 updateContext:(BOOL)a6 error:(id *)a7;
- (id)newContextAndReturnError:(id *)a3;
- (id)prepareArgumentsFromFeatures:(id)a3 context:(id)a4 forFunctionName:(id)a5;
- (void)setProgram:(id)a3;
- (void)updateContext:(id)a3 functionName:(id)a4 result:(id)a5;
@end

@implementation MLProgramEvaluator

- (void).cxx_destruct
{
}

- (void)setProgram:(id)a3
{
}

- (MLProgramInternal)program
{
  return self->_program;
}

- (MLModeling)model
{
  v2 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_19E58B000, v2, OS_LOG_TYPE_ERROR, ".model property is not implemented yet. See rdar://86160890.", v4, 2u);
  }

  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@".model property is not implemented yet. See rdar://86160890."];
  return 0;
}

- (id)newContextAndReturnError:(id *)a3
{
  v5 = (void *)MEMORY[0x19F3C29E0](self, a2);
  v6 = [(MLProgramEvaluator *)self program];
  id v11 = 0;
  v7 = (void *)[v6 newContextAndReturnError:&v11];
  id v8 = v11;

  if (v7)
  {
    id v9 = v7;
  }
  else if (a3)
  {
    *a3 = v8;
  }

  return v7;
}

- (id)evaluateFunction:(id)a3 arguments:(id)a4 context:(id)a5 error:(id *)a6
{
  return [(MLProgramEvaluator *)self evaluateFunction:a3 arguments:a4 context:a5 updateContext:1 error:a6];
}

- (id)evaluateFunction:(id)a3 arguments:(id)a4 context:(id)a5 updateContext:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (v14)
  {
    uint64_t v15 = [(MLProgramEvaluator *)self prepareArgumentsFromFeatures:v13 context:v14 forFunctionName:v12];

    id v13 = (id)v15;
  }
  v16 = [(MLProgramEvaluator *)self program];
  v17 = [v16 evaluateFunction:v12 arguments:v13 error:a7];

  if (v17)
  {
    if (v8) {
      [(MLProgramEvaluator *)self updateContext:v14 functionName:v12 result:v17];
    }
    id v18 = v17;
  }

  return v17;
}

- (id)prepareArgumentsFromFeatures:(id)a3 context:(id)a4 forFunctionName:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v30 = a4;
  id v29 = a5;
  BOOL v8 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v9 = [v7 featureNames];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v15 = [v7 featureValueForName:v14];
        [v8 setObject:v15 forKeyedSubscript:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v11);
  }

  v16 = [v30 functionNameToInputLayersNames];
  v17 = [v16 objectForKeyedSubscript:v29];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v18 = [v30 executionState];
  v19 = [v18 featureNames];

  uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v32 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v31 + 1) + 8 * j);
        if ([v17 containsObject:v24])
        {
          v25 = [v30 executionState];
          v26 = [v25 featureValueForName:v24];
          [v8 setObject:v26 forKeyedSubscript:v24];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v21);
  }

  v27 = [[MLDictionaryFeatureProvider alloc] initWithDictionary:v8 error:0];

  return v27;
}

- (void)updateContext:(id)a3 functionName:(id)a4 result:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v45 = a4;
  id v8 = a5;
  id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v10 = [v7 executionState];
  uint64_t v11 = [v10 featureNames];
  uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
  id v13 = [v7 functionNameToInputLayersNames];
  uint64_t v14 = [NSString stringWithUTF8String:"train"];
  uint64_t v15 = [v13 objectForKeyedSubscript:v14];
  v16 = [v12 setWithArray:v15];
  if ([v11 intersectsSet:v16])
  {
  }
  else
  {
    [v7 executionState];
    v17 = id obja = v11;
    [v17 featureNames];
    id v18 = v42 = v13;
    v19 = [v8 featureNames];
    char v41 = [v18 intersectsSet:v19];

    if ((v41 & 1) == 0) {
      goto LABEL_18;
    }
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v20 = [v7 executionState];
  uint64_t v21 = [v20 featureNames];

  obuint64_t j = v21;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v47 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void *)(*((void *)&v46 + 1) + 8 * i);
        v27 = [v7 executionState];
        v28 = [v27 featureValueForName:v26];
        [v9 setObject:v28 forKeyedSubscript:v26];

        id v29 = [v7 functionNameToInputLayersNames];
        id v30 = [v29 objectForKeyedSubscript:v45];
        int v31 = [v30 containsObject:v26];

        if (v31)
        {
          long long v32 = [v7 functionNameToStateMap];
          long long v33 = [v32 objectForKeyedSubscript:v45];
          long long v34 = [v33 objectForKeyedSubscript:v26];

          long long v35 = [v8 featureNames];
          LODWORD(v33) = [v35 containsObject:v34];

          if (v33)
          {
            long long v36 = [v8 featureValueForName:v34];
            [v9 setObject:v36 forKeyedSubscript:v26];
          }
        }
        long long v37 = [v8 featureNames];
        int v38 = [v37 containsObject:v26];

        if (v38)
        {
          v39 = [v8 featureValueForName:v26];
          [v9 setObject:v39 forKeyedSubscript:v26];
        }
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v23);
  }

  v40 = [[MLDictionaryFeatureProvider alloc] initWithDictionary:v9 error:0];
  [v7 setExecutionState:v40];

LABEL_18:
}

- (MLProgramEvaluator)initWithProgram:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MLProgramEvaluator;
  id v7 = [(MLProgramEvaluator *)&v12 init];
  if (!v7) {
    goto LABEL_4;
  }
  if ([v6 conformsToProtocol:&unk_1EF12A780])
  {
    objc_storeStrong((id *)&v7->_program, a3);
LABEL_4:
    id v8 = v7;
    goto LABEL_8;
  }
  id v9 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_error_impl(&dword_19E58B000, v9, OS_LOG_TYPE_ERROR, "The program argument to MLProgramEvaluator is not conforming to some internal requirements. Do not implement MLProgram protocol by yourself. Use the one returned by MLModel's .program property.", v11, 2u);
  }

  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The program argument to MLProgramEvaluator is not conforming to some internal requirements. Do not implement MLProgram protocol by yourself. Use the one returned by MLModel's .program property."];
  id v8 = 0;
LABEL_8:

  return v8;
}

@end