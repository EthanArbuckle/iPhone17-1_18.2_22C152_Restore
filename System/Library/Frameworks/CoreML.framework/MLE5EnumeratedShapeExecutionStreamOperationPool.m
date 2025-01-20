@interface MLE5EnumeratedShapeExecutionStreamOperationPool
- (BOOL)prepareWithInitialPoolSize:(int64_t)a3 error:(id *)a4;
- (MLE5EnumeratedShapeExecutionStreamOperationPool)initWithProgramLibrary:(id)a3 functionName:(id)a4 modelDescription:(id)a5 configuration:(id)a6 modelSignpostId:(unint64_t)a7 compilerVersionInfo:(id)a8;
- (MLE5ProgramLibrary)programLibrary;
- (MLModelConfiguration)configuration;
- (MLModelDescription)modelDescription;
- (MLVersionInfo)compilerVersionInfo;
- (NSMutableDictionary)functionNameToPoolMap;
- (NSSet)milFunctionNames;
- (NSString)milEntryFunctionName;
- (OS_dispatch_queue)serialQueue;
- (id)_takeOutOperationForFunctionName:(id)a3 error:(id *)a4;
- (id)_takeOutOperationFromAnyProgramFunction;
- (id)takeOutOperationForFeatures:(id)a3 error:(id *)a4;
- (unint64_t)modelSignpostId;
- (void)_putBack:(id)a3;
- (void)putBack:(id)a3;
@end

@implementation MLE5EnumeratedShapeExecutionStreamOperationPool

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compilerVersionInfo, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_functionNameToPoolMap, 0);
  objc_storeStrong((id *)&self->_modelDescription, 0);
  objc_storeStrong((id *)&self->_milFunctionNames, 0);
  objc_storeStrong((id *)&self->_milEntryFunctionName, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_programLibrary, 0);
}

- (MLVersionInfo)compilerVersionInfo
{
  return self->_compilerVersionInfo;
}

- (unint64_t)modelSignpostId
{
  return self->_modelSignpostId;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (NSMutableDictionary)functionNameToPoolMap
{
  return self->_functionNameToPoolMap;
}

- (MLModelDescription)modelDescription
{
  return self->_modelDescription;
}

- (NSSet)milFunctionNames
{
  return self->_milFunctionNames;
}

- (NSString)milEntryFunctionName
{
  return self->_milEntryFunctionName;
}

- (MLModelConfiguration)configuration
{
  return self->_configuration;
}

- (MLE5ProgramLibrary)programLibrary
{
  return self->_programLibrary;
}

- (id)_takeOutOperationFromAnyProgramFunction
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(MLE5EnumeratedShapeExecutionStreamOperationPool *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [(MLE5EnumeratedShapeExecutionStreamOperationPool *)self functionNameToPoolMap];
  v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v10 = [v9 anyObject];
        if (v10)
        {
          [v9 removeObject:v10];
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)_putBack:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(MLE5EnumeratedShapeExecutionStreamOperationPool *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(MLE5EnumeratedShapeExecutionStreamOperationPool *)self functionNameToPoolMap];
  uint64_t v7 = [v4 functionName];
  v8 = [v6 objectForKeyedSubscript:v7];

  if (!v8)
  {
    v9 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      long long v12 = [v4 functionName];
      *(_DWORD *)buf = 138412290;
      long long v14 = v12;
      _os_log_error_impl(&dword_19E58B000, v9, OS_LOG_TYPE_ERROR, "Tried to get pool for program function %@, but it does not exist.", buf, 0xCu);
    }
    v10 = (void *)MEMORY[0x1E4F1CA00];
    v11 = [v4 functionName];
    [v10 raise:*MEMORY[0x1E4F1C3B8], @"Tried to get pool for program function %@, but it does not exist.", v11 format];
  }
  [v8 addObject:v4];
}

- (void)putBack:(id)a3
{
  id v4 = a3;
  v5 = [(MLE5EnumeratedShapeExecutionStreamOperationPool *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__MLE5EnumeratedShapeExecutionStreamOperationPool_putBack___block_invoke;
  v7[3] = &unk_1E59A5458;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __59__MLE5EnumeratedShapeExecutionStreamOperationPool_putBack___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _putBack:*(void *)(a1 + 40)];
}

- (id)_takeOutOperationForFunctionName:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [(MLE5EnumeratedShapeExecutionStreamOperationPool *)self serialQueue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = [(MLE5EnumeratedShapeExecutionStreamOperationPool *)self functionNameToPoolMap];
  id v8 = [v7 objectForKeyedSubscript:v5];

  if (!v8)
  {
    uint64_t v9 = objc_opt_new();
    v10 = [(MLE5EnumeratedShapeExecutionStreamOperationPool *)self functionNameToPoolMap];
    [v10 setObject:v9 forKeyedSubscript:v5];

    id v8 = (void *)v9;
  }
  v11 = [v8 anyObject];
  if (v11)
  {
    [v8 removeObject:v11];
  }
  else
  {
    id v12 = [(MLE5EnumeratedShapeExecutionStreamOperationPool *)self _takeOutOperationFromAnyProgramFunction];
    long long v13 = [MLE5ExecutionStreamOperation alloc];
    long long v14 = [(MLE5EnumeratedShapeExecutionStreamOperationPool *)self programLibrary];
    uint64_t v15 = [(MLE5EnumeratedShapeExecutionStreamOperationPool *)self modelDescription];
    v16 = [(MLE5EnumeratedShapeExecutionStreamOperationPool *)self configuration];
    v11 = [(MLE5ExecutionStreamOperation *)v13 initWithProgramLibrary:v14 functionName:v5 modelDescription:v15 configuration:v16 debugLabel:0 modelSignpostId:[(MLE5EnumeratedShapeExecutionStreamOperationPool *)self modelSignpostId]];
  }

  return v11;
}

- (id)takeOutOperationForFeatures:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__5195;
  v34 = __Block_byref_object_dispose__5196;
  id v35 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__5195;
  v28 = __Block_byref_object_dispose__5196;
  id v29 = 0;
  uint64_t v7 = [(MLE5EnumeratedShapeExecutionStreamOperationPool *)self milEntryFunctionName];
  id v8 = [(MLE5EnumeratedShapeExecutionStreamOperationPool *)self milFunctionNames];
  uint64_t v9 = [(MLE5EnumeratedShapeExecutionStreamOperationPool *)self compilerVersionInfo];
  id v10 = v7;
  id v11 = v8;
  id v12 = v9;
  long long v13 = CoreML::MLNeuralNetworkUtilities::hashFeatureProviderToConfigurationName(&buf, v6, 1, v12);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(buf.__r_.__value_.__l.__data_);
  }

  if (!v13)
  {
    long long v14 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf.__r_.__value_.__l.__data_) = 138412290;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v6;
      _os_log_error_impl(&dword_19E58B000, v14, OS_LOG_TYPE_ERROR, "There is no function in the program library for the provided input=%@.", (uint8_t *)&buf, 0xCu);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"There is no function in the program library for the provided input=%@.", v6 format];
  }
  uint64_t v15 = [(MLE5EnumeratedShapeExecutionStreamOperationPool *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__MLE5EnumeratedShapeExecutionStreamOperationPool_takeOutOperationForFeatures_error___block_invoke;
  block[3] = &unk_1E59A4EF0;
  v22 = &v30;
  block[4] = self;
  id v16 = v13;
  id v21 = v16;
  v23 = &v24;
  dispatch_sync(v15, block);

  uint64_t v17 = (void *)v31[5];
  if (a4 && !v17)
  {
    *a4 = (id) v25[5];
    uint64_t v17 = (void *)v31[5];
  }
  id v18 = v17;

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v18;
}

void __85__MLE5EnumeratedShapeExecutionStreamOperationPool_takeOutOperationForFeatures_error___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 _takeOutOperationForFunctionName:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (BOOL)prepareWithInitialPoolSize:(int64_t)a3 error:(id *)a4
{
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 1;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__5195;
  uint64_t v30 = __Block_byref_object_dispose__5196;
  id v31 = 0;
  uint64_t v7 = [(MLE5EnumeratedShapeExecutionStreamOperationPool *)self milEntryFunctionName];
  id v8 = [(MLE5EnumeratedShapeExecutionStreamOperationPool *)self milFunctionNames];
  uint64_t v9 = [(MLE5EnumeratedShapeExecutionStreamOperationPool *)self modelDescription];
  id v10 = [(MLE5EnumeratedShapeExecutionStreamOperationPool *)self compilerVersionInfo];
  id v11 = v7;
  id v12 = v8;
  long long v13 = v10;
  long long v14 = CoreML::MLNeuralNetworkUtilities::hashE5ModelDefaultShapesToConfigurationName(&buf, v9, v13);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(buf.__r_.__value_.__l.__data_);
  }

  if (!v14)
  {
    uint64_t v15 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.__r_.__value_.__l.__data_) = 0;
      _os_log_error_impl(&dword_19E58B000, v15, OS_LOG_TYPE_ERROR, "There is no function in the program library for the default shapes.", (uint8_t *)&buf, 2u);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"There is no function in the program library for the default shapes."];
  }
  id v16 = [(MLE5EnumeratedShapeExecutionStreamOperationPool *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__MLE5EnumeratedShapeExecutionStreamOperationPool_prepareWithInitialPoolSize_error___block_invoke;
  block[3] = &unk_1E59A3F18;
  int64_t v25 = a3;
  block[4] = self;
  id v17 = v14;
  id v22 = v17;
  v23 = &v26;
  uint64_t v24 = &v32;
  dispatch_sync(v16, block);

  int v18 = *((unsigned __int8 *)v33 + 24);
  if (a4 && !*((unsigned char *)v33 + 24))
  {
    *a4 = (id) v27[5];
    int v18 = *((unsigned __int8 *)v33 + 24);
  }
  BOOL v19 = v18 != 0;

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
  return v19;
}

void __84__MLE5EnumeratedShapeExecutionStreamOperationPool_prepareWithInitialPoolSize_error___block_invoke(uint64_t a1)
{
  if (*(uint64_t *)(a1 + 64) >= 1)
  {
    uint64_t v2 = 0;
    while (1)
    {
      uint64_t v3 = *(void **)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
      id obj = *(id *)(v5 + 40);
      uint64_t v6 = [v3 _takeOutOperationForFunctionName:v4 error:&obj];
      objc_storeStrong((id *)(v5 + 40), obj);
      if (!v6) {
        break;
      }
      uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
      id v9 = *(id *)(v7 + 40);
      char v8 = [v6 preloadAndReturnError:&v9];
      objc_storeStrong((id *)(v7 + 40), v9);
      if ((v8 & 1) == 0) {
        break;
      }
      [*(id *)(a1 + 32) _putBack:v6];

      if (++v2 >= *(void *)(a1 + 64)) {
        return;
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

- (MLE5EnumeratedShapeExecutionStreamOperationPool)initWithProgramLibrary:(id)a3 functionName:(id)a4 modelDescription:(id)a5 configuration:(id)a6 modelSignpostId:(unint64_t)a7 compilerVersionInfo:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v34 = a5;
  id v32 = a6;
  id v17 = a8;
  if (!v15) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"programLibrary parameter must not be nil.", v32, v34);
  }
  if (!v16) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"functionName parameter must not be nil."];
  }
  v35.receiver = self;
  v35.super_class = (Class)MLE5EnumeratedShapeExecutionStreamOperationPool;
  int v18 = [(MLE5EnumeratedShapeExecutionStreamOperationPool *)&v35 init];
  BOOL v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_programLibrary, a3);
    v19->_modelSignpostId = a7;
    uint64_t v20 = [v16 copy];
    milEntryFunctionName = v19->_milEntryFunctionName;
    v19->_milEntryFunctionName = (NSString *)v20;

    id v22 = (void *)MEMORY[0x1E4F1CAD0];
    v23 = [v15 functionNames];
    uint64_t v24 = [v22 setWithArray:v23];
    milFunctionNames = v19->_milFunctionNames;
    v19->_milFunctionNames = (NSSet *)v24;

    objc_storeStrong((id *)&v19->_modelDescription, a5);
    objc_storeStrong((id *)&v19->_configuration, a6);
    objc_storeStrong((id *)&v19->_compilerVersionInfo, a8);
    uint64_t v26 = objc_opt_new();
    functionNameToPoolMap = v19->_functionNameToPoolMap;
    v19->_functionNameToPoolMap = (NSMutableDictionary *)v26;

    uint64_t v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v29 = dispatch_queue_create("com.apple.coreml.MLE5Engine.enumeratedOperationPoolQueue", v28);
    serialQueue = v19->_serialQueue;
    v19->_serialQueue = (OS_dispatch_queue *)v29;
  }
  return v19;
}

@end