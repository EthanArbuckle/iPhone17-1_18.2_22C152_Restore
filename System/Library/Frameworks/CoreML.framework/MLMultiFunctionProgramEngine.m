@interface MLMultiFunctionProgramEngine
+ (id)loadModelFromCompiledArchive:(_MLModelInputArchiver *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7;
- (BOOL)verifyArgumentNames:(id)a3 functionName:(id)a4 error:(id *)a5;
- (MLMultiFunctionProgramContainer)container;
- (MLMultiFunctionProgramEngine)initWithProgramContainer:(id)a3 configuration:(id)a4 error:(id *)a5;
- (NSString)modelFileBasePath;
- (NSString)serializedMILText;
- (id)classLabels;
- (id)classify:(id)a3 options:(id)a4 error:(id *)a5;
- (id)evaluate:(id)a3 error:(id *)a4;
- (id)evaluateFunction:(id)a3 arguments:(id)a4 error:(id *)a5;
- (id)executionSchedule;
- (id)modelPath;
- (id)newContextAndReturnError:(id *)a3;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5;
- (id)programEngineForFunction:(id)a3 error:(id *)a4;
- (id)regress:(id)a3 options:(id)a4 error:(id *)a5;
- (unint64_t)predictionTypeForKTrace;
- (unint64_t)signpostID;
- (void)enableInstrumentsTracing;
- (void)removeEngineForFunctionName:(id)a3;
- (void)setModelPath:(id)a3 modelName:(id)a4;
- (void)updateModelFilePath:(id)a3;
@end

@implementation MLMultiFunctionProgramEngine

- (MLMultiFunctionProgramEngine)initWithProgramContainer:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = [v9 modelDescription];
  v22.receiver = self;
  v22.super_class = (Class)MLMultiFunctionProgramEngine;
  v12 = [(MLModelEngine *)&v22 initWithDescription:v11 configuration:v10];

  if (!v12) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v12->_container, a3);
  v13 = [NSString stringWithUTF8String:"main"];
  [(MLMultiFunctionProgramContainer *)v12->_container setActiveFunction:v13];

  uint64_t v14 = [v9 modelFilePath];
  modelFileBasePath = v12->_modelFileBasePath;
  v12->_modelFileBasePath = (NSString *)v14;

  v16 = [(MLNeuralNetworkEngine *)[MLProgramEngine alloc] initWithContainer:v9 configuration:v10 error:a5];
  if (v16)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
    functionNameToEngineMap = v12->_functionNameToEngineMap;
    v12->_functionNameToEngineMap = (NSMutableDictionary *)v17;

    v19 = v12->_functionNameToEngineMap;
    v20 = [NSString stringWithUTF8String:"main"];
    [(NSMutableDictionary *)v19 setObject:v16 forKeyedSubscript:v20];

LABEL_4:
    v16 = v12;
  }

  return (MLMultiFunctionProgramEngine *)v16;
}

+ (id)loadModelFromCompiledArchive:(_MLModelInputArchiver *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  kdebug_trace();
  v15 = +[MLMultiFunctionProgramContainer containerFromCompiledArchive:a3 modelVersionInfo:v12 compilerVersionInfo:v13 configuration:v14 error:a7];
  if (v15) {
    v16 = (void *)[objc_alloc((Class)a1) initWithProgramContainer:v15 configuration:v14 error:a7];
  }
  else {
    v16 = 0;
  }

  kdebug_trace();

  return v16;
}

- (unint64_t)signpostID
{
  v3 = [NSString stringWithUTF8String:"main"];
  id v10 = 0;
  v4 = [(MLMultiFunctionProgramEngine *)self programEngineForFunction:v3 error:&v10];
  id v5 = v10;

  if (v4)
  {
    unint64_t v6 = [v4 signpostID];
  }
  else
  {
    v7 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v9 = 0;
    }

    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)predictionTypeForKTrace
{
  v3 = [NSString stringWithUTF8String:"main"];
  id v10 = 0;
  v4 = [(MLMultiFunctionProgramEngine *)self programEngineForFunction:v3 error:&v10];
  id v5 = v10;

  if (v4)
  {
    unint64_t v6 = [v4 predictionTypeForKTrace];
  }
  else
  {
    v7 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v9 = 0;
    }

    unint64_t v6 = 0;
  }

  return v6;
}

- (id)programEngineForFunction:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = self->_functionNameToEngineMap;
  objc_sync_enter(v7);
  v8 = [(NSMutableDictionary *)self->_functionNameToEngineMap objectForKeyedSubscript:v6];
  if (!v8)
  {
    id v9 = [(MLMultiFunctionProgramEngine *)self container];
    [v9 setActiveFunction:v6];

    [(MLMultiFunctionProgramEngine *)self updateModelFilePath:v6];
    id v10 = [MLProgramEngine alloc];
    v11 = [(MLMultiFunctionProgramEngine *)self container];
    id v12 = [(MLModelEngine *)self configuration];
    id v17 = 0;
    v8 = [(MLNeuralNetworkEngine *)v10 initWithContainer:v11 configuration:v12 error:&v17];
    id v13 = v17;

    if (v8)
    {
      [(NSMutableDictionary *)self->_functionNameToEngineMap setObject:v8 forKeyedSubscript:v6];
    }
    else
    {
      id v14 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v16 = [v13 localizedDescription];
        *(_DWORD *)buf = 138412546;
        id v19 = v6;
        __int16 v20 = 2112;
        v21 = v16;
        _os_log_error_impl(&dword_19E58B000, v14, OS_LOG_TYPE_ERROR, "Failed to create MLProgramEngine for function: %@ with error: %@", buf, 0x16u);
      }
      v8 = 0;
      if (a4) {
        *a4 = v13;
      }
    }
  }
  objc_sync_exit(v7);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelFileBasePath, 0);
  objc_storeStrong((id *)&self->_container, 0);

  objc_storeStrong((id *)&self->_functionNameToEngineMap, 0);
}

- (NSString)modelFileBasePath
{
  return self->_modelFileBasePath;
}

- (MLMultiFunctionProgramContainer)container
{
  return self->_container;
}

- (NSString)serializedMILText
{
  functionNameToEngineMap = self->_functionNameToEngineMap;
  v3 = [NSString stringWithUTF8String:"main"];
  v4 = [(NSMutableDictionary *)functionNameToEngineMap objectForKeyedSubscript:v3];

  if ([v4 conformsToProtocol:&unk_1EF12A6D8])
  {
    id v5 = [v4 serializedMILText];
  }
  else
  {
    id v5 = 0;
  }

  return (NSString *)v5;
}

- (void)enableInstrumentsTracing
{
  functionNameToEngineMap = self->_functionNameToEngineMap;
  v3 = [NSString stringWithUTF8String:"main"];
  id v4 = [(NSMutableDictionary *)functionNameToEngineMap objectForKeyedSubscript:v3];

  [v4 enableInstrumentsTracing];
}

- (id)evaluateFunction:(id)a3 arguments:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(MLMultiFunctionProgramEngine *)self programEngineForFunction:v8 error:a5];
  if (v10
    && ([v9 featureNames],
        v11 = objc_claimAutoreleasedReturnValue(),
        BOOL v12 = [(MLMultiFunctionProgramEngine *)self verifyArgumentNames:v11 functionName:v8 error:a5], v11, v12))
  {
    id v13 = +[MLPredictionOptions defaultOptions];
    id v14 = [v10 predictionFromFeatures:v9 options:v13 error:a5];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (BOOL)verifyArgumentNames:(id)a3 functionName:(id)a4 error:(id *)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(MLMultiFunctionProgramEngine *)self container];
  v11 = [v10 functionNameToInputLayersNames];
  BOOL v12 = [v11 objectForKeyedSubscript:v9];

  uint64_t v13 = [v12 count];
  if (v13 != [v8 count]
    || (v33[0] = MEMORY[0x1E4F143A8],
        v33[1] = 3221225472,
        v33[2] = __71__MLMultiFunctionProgramEngine_verifyArgumentNames_functionName_error___block_invoke,
        v33[3] = &unk_1E59A4210,
        id v34 = v8,
        BOOL v14 = [v12 indexOfObjectPassingTest:v33] == 0x7FFFFFFFFFFFFFFFLL,
        v34,
        !v14))
  {
    v32 = [MEMORY[0x1E4F1CAD0] setWithArray:v12];
    v15 = [MEMORY[0x1E4F1CA80] setWithSet:v8];
    [v15 minusSet:v32];
    if ([v15 count])
    {
      v16 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v27 = [v15 allObjects];
        v28 = [v27 componentsJoinedByString:@", "];
        *(_DWORD *)buf = 138412546;
        v40 = v28;
        __int16 v41 = 2112;
        id v42 = v9;
        _os_log_error_impl(&dword_19E58B000, v16, OS_LOG_TYPE_ERROR, "The provided input(s): [%@] does not exist in the %@ function.", buf, 0x16u);
      }
      if (!a5) {
        goto LABEL_17;
      }
      id v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v37 = *MEMORY[0x1E4F28568];
      v18 = NSString;
      id v19 = [v15 allObjects];
      __int16 v20 = [v19 componentsJoinedByString:@", "];
      v21 = [v18 stringWithFormat:@"The provided input(s): [%@] does not exist in the %@ function.", v20, v9];
      v38 = v21;
      uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      *a5 = [v17 errorWithDomain:@"com.apple.CoreML" code:60 userInfo:v22];
    }
    else
    {
      id v19 = [MEMORY[0x1E4F1CA80] setWithSet:v32];
      [v19 minusSet:v8];
      if (![v19 count])
      {
        LOBYTE(a5) = 1;
        goto LABEL_16;
      }
      v23 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v29 = [v19 allObjects];
        v30 = [v29 componentsJoinedByString:@", "];
        *(_DWORD *)buf = 138412546;
        v40 = v30;
        __int16 v41 = 2112;
        id v42 = v9;
        _os_log_error_impl(&dword_19E58B000, v23, OS_LOG_TYPE_ERROR, "The provided input(s) missing argument(s): [%@] for the %@ function.", buf, 0x16u);
      }
      if (!a5) {
        goto LABEL_16;
      }
      v31 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v35 = *MEMORY[0x1E4F28568];
      v24 = NSString;
      __int16 v20 = [v19 allObjects];
      v21 = [v20 componentsJoinedByString:@", "];
      uint64_t v22 = [v24 stringWithFormat:@"The provided input(s) missing argument(s): [%@] for the %@ function.", v21, v9];
      v36 = v22;
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      *a5 = [v31 errorWithDomain:@"com.apple.CoreML" code:60 userInfo:v25];
    }
    LOBYTE(a5) = 0;
LABEL_16:

LABEL_17:
    goto LABEL_18;
  }
  LOBYTE(a5) = 1;
LABEL_18:

  return (char)a5;
}

uint64_t __71__MLMultiFunctionProgramEngine_verifyArgumentNames_functionName_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (void)removeEngineForFunctionName:(id)a3
{
  obj = self->_functionNameToEngineMap;
  id v5 = a3;
  objc_sync_enter(obj);
  [(NSMutableDictionary *)self->_functionNameToEngineMap removeObjectForKey:v5];

  objc_sync_exit(obj);
}

- (void)updateModelFilePath:(id)a3
{
  id v10 = a3;
  id v4 = [NSString stringWithUTF8String:"main"];
  int v5 = [v10 isEqualToString:v4];

  id v6 = [(MLMultiFunctionProgramEngine *)self modelFileBasePath];
  if (v5)
  {
    v7 = [(MLMultiFunctionProgramEngine *)self container];
    [v7 setModelFilePath:v6];
  }
  else
  {
    v7 = [NSString stringWithFormat:@":%@", v10];
    id v8 = [v6 stringByAppendingString:v7];
    id v9 = [(MLMultiFunctionProgramEngine *)self container];
    [v9 setModelFilePath:v8];
  }
}

- (id)newContextAndReturnError:(id *)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  int v5 = [(MLMultiFunctionProgramEngine *)self container];
  id v6 = [v5 functionNameToInputLayersNames];
  v7 = [NSString stringWithUTF8String:"init"];
  id v8 = [v6 objectForKey:v7];

  if (v8)
  {
    id v9 = [NSString stringWithUTF8String:"init"];
    uint64_t v10 = [(MLMultiFunctionProgramEngine *)self evaluateFunction:v9 arguments:0 error:a3];

    v59 = (void *)v10;
    if (!v10)
    {
      v59 = 0;
      v27 = 0;
      goto LABEL_23;
    }
    v11 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
    BOOL v12 = [(MLMultiFunctionProgramEngine *)self container];
    uint64_t v13 = [v12 functionNameToOutputLayersNames];
    BOOL v14 = [NSString stringWithUTF8String:"init"];
    v15 = [v13 objectForKeyedSubscript:v14];

    v16 = [(MLMultiFunctionProgramEngine *)self container];
    id v17 = [v16 functionNameToInputLayersNames];
    v18 = [NSString stringWithUTF8String:"train"];
    id v19 = [v17 objectForKeyedSubscript:v18];

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v20 = v19;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v60 objects:v66 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v61 != v22) {
            objc_enumerationMutation(v20);
          }
          v24 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          if ([v15 containsObject:v24])
          {
            v25 = [v24 stringByAppendingString:@"_updated"];
            [v11 setObject:v25 forKeyedSubscript:v24];
          }
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v60 objects:v66 count:16];
      }
      while (v21);
    }

    v26 = [NSString stringWithUTF8String:"train"];
    v64 = v26;
    v65 = v11;
    v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];

    v27 = [[MLProgramContext alloc] initWithExecutionState:v59 functionNameToStateMap:v58];
    v28 = [(MLMultiFunctionProgramEngine *)self container];
    v29 = [v28 functionNameToInputLayersNames];
    [(MLProgramContext *)v27 setFunctionNameToInputLayersNames:v29];

    v30 = [(MLMultiFunctionProgramEngine *)self container];
    v31 = [v30 functionNameToOutputLayersNames];
    [(MLProgramContext *)v27 setFunctionNameToOutputLayersNames:v31];

    v32 = [(MLMultiFunctionProgramEngine *)self container];
    v33 = [v32 functionNameToOutputLayersNames];
    id v34 = [NSString stringWithUTF8String:"train"];
    uint64_t v35 = [v33 objectForKeyedSubscript:v34];
    BOOL v36 = [v35 count] == 0;

    if (!v36)
    {
      uint64_t v37 = [(MLMultiFunctionProgramEngine *)self container];
      v38 = [v37 functionNameToOutputLayersNames];
      v39 = [NSString stringWithUTF8String:"train"];
      v40 = [v38 objectForKeyedSubscript:v39];
      __int16 v41 = [v40 objectAtIndexedSubscript:0];
      [(MLProgramContext *)v27 setTrainFunctionLossName:v41];
    }
    id v42 = [(MLMultiFunctionProgramEngine *)self container];
    uint64_t v43 = [v42 functionNameToOutputLayersNames];
    v44 = [NSString stringWithUTF8String:"forward"];
    v45 = [v43 objectForKeyedSubscript:v44];
    BOOL v46 = [v45 count] == 0;

    if (!v46)
    {
      v47 = [(MLMultiFunctionProgramEngine *)self container];
      v48 = [v47 functionNameToOutputLayersNames];
      v49 = [NSString stringWithUTF8String:"forward"];
      v50 = [v48 objectForKeyedSubscript:v49];
      v51 = [v50 objectAtIndexedSubscript:0];
      [(MLProgramContext *)v27 setForwardFunctionLossName:v51];
    }
    v52 = [NSString stringWithUTF8String:"init"];
    [(MLMultiFunctionProgramEngine *)self removeEngineForFunctionName:v52];
  }
  else
  {
    v53 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      v57 = [(MLMultiFunctionProgramEngine *)self modelFileBasePath];
      *(_DWORD *)buf = 138412290;
      v70 = v57;
      _os_log_error_impl(&dword_19E58B000, v53, OS_LOG_TYPE_ERROR, "The program (%@) has no init function, which means all the functions are stateless. Do not try to create a context on such a program.", buf, 0xCu);
    }
    if (!a3) {
      return 0;
    }
    v54 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v67 = *MEMORY[0x1E4F28568];
    v55 = NSString;
    v59 = [(MLMultiFunctionProgramEngine *)self modelFileBasePath];
    v11 = [v55 stringWithFormat:@"The program (%@) has no init function, which means all the functions are stateless. Do not try to create a context on such a program.", v59];
    v68 = v11;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
    [v54 errorWithDomain:@"com.apple.CoreML" code:60 userInfo:v15];
    v27 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_23:
  return v27;
}

- (id)evaluate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [NSString stringWithUTF8String:"main"];
  id v8 = [(MLMultiFunctionProgramEngine *)self programEngineForFunction:v7 error:a4];

  if (v8)
  {
    id v9 = [v8 evaluate:v6 error:a4];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)regress:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [NSString stringWithUTF8String:"main"];
  v11 = [(MLMultiFunctionProgramEngine *)self programEngineForFunction:v10 error:a5];

  if (v11)
  {
    BOOL v12 = [v11 regress:v8 options:v9 error:a5];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)classify:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [NSString stringWithUTF8String:"main"];
  v11 = [(MLMultiFunctionProgramEngine *)self programEngineForFunction:v10 error:a5];

  if (v11)
  {
    BOOL v12 = [v11 classify:v8 options:v9 error:a5];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)classLabels
{
  v3 = [NSString stringWithUTF8String:"main"];
  id v4 = [(MLMultiFunctionProgramEngine *)self programEngineForFunction:v3 error:0];

  if (v4)
  {
    int v5 = [v4 classLabels];
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (void)setModelPath:(id)a3 modelName:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [NSString stringWithUTF8String:"main"];
  id v8 = [(MLMultiFunctionProgramEngine *)self programEngineForFunction:v7 error:0];

  if (v8) {
    [v8 setModelPath:v9 modelName:v6];
  }
}

- (id)modelPath
{
  v3 = [NSString stringWithUTF8String:"main"];
  id v4 = [(MLMultiFunctionProgramEngine *)self programEngineForFunction:v3 error:0];
  int v5 = [v4 modelPath];

  return v5;
}

- (id)executionSchedule
{
  v3 = [NSString stringWithUTF8String:"main"];
  id v4 = [(MLMultiFunctionProgramEngine *)self programEngineForFunction:v3 error:0];
  int v5 = [v4 executionSchedule];

  return v5;
}

- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [NSString stringWithUTF8String:"main"];
  v11 = [(MLMultiFunctionProgramEngine *)self programEngineForFunction:v10 error:a5];

  if (v11)
  {
    BOOL v12 = [v11 predictionsFromBatch:v8 options:v9 error:a5];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [NSString stringWithUTF8String:"main"];
  v11 = [(MLMultiFunctionProgramEngine *)self programEngineForFunction:v10 error:a5];

  if (v11)
  {
    BOOL v12 = [v11 predictionFromFeatures:v8 options:v9 error:a5];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

@end