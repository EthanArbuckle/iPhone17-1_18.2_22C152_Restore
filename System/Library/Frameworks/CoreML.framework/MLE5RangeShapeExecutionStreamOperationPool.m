@interface MLE5RangeShapeExecutionStreamOperationPool
- (BOOL)prepareWithInitialPoolSize:(int64_t)a3 error:(id *)a4;
- (MLE5ProgramLibrary)programLibrary;
- (MLE5RangeShapeExecutionStreamOperationPool)initWithProgramLibrary:(id)a3 functionName:(id)a4 modelDescription:(id)a5 configuration:(id)a6 modelSignpostId:(unint64_t)a7 compilerVersionInfo:(id)a8;
- (MLModelConfiguration)configuration;
- (MLModelDescription)modelDescription;
- (MLVersionInfo)compilerVersionInfo;
- (NSMutableDictionary)shapeHashToPoolMap;
- (NSMutableSet)defaultShapePool;
- (NSString)milDefaultShapeFunctionName;
- (NSString)milFunctionName;
- (OS_dispatch_queue)serialQueue;
- (id)_makeAndPreloadOperationForFunction:(id)a3 error:(id *)a4;
- (id)_takeOutAnyOperation;
- (id)takeOutOperationForFeatures:(id)a3 error:(id *)a4;
- (unint64_t)modelSignpostId;
- (void)_putBack:(id)a3;
- (void)putBack:(id)a3;
@end

@implementation MLE5RangeShapeExecutionStreamOperationPool

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compilerVersionInfo, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_defaultShapePool, 0);
  objc_storeStrong((id *)&self->_shapeHashToPoolMap, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_modelDescription, 0);
  objc_storeStrong((id *)&self->_milDefaultShapeFunctionName, 0);
  objc_storeStrong((id *)&self->_milFunctionName, 0);

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

- (NSMutableSet)defaultShapePool
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (NSMutableDictionary)shapeHashToPoolMap
{
  return self->_shapeHashToPoolMap;
}

- (MLModelConfiguration)configuration
{
  return self->_configuration;
}

- (MLModelDescription)modelDescription
{
  return self->_modelDescription;
}

- (NSString)milDefaultShapeFunctionName
{
  return self->_milDefaultShapeFunctionName;
}

- (NSString)milFunctionName
{
  return self->_milFunctionName;
}

- (MLE5ProgramLibrary)programLibrary
{
  return self->_programLibrary;
}

- (id)_takeOutAnyOperation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(MLE5RangeShapeExecutionStreamOperationPool *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [(MLE5RangeShapeExecutionStreamOperationPool *)self shapeHashToPoolMap];
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
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(MLE5RangeShapeExecutionStreamOperationPool *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [v4 functionName];
  uint64_t v7 = [(MLE5RangeShapeExecutionStreamOperationPool *)self milDefaultShapeFunctionName];

  if (v6 == v7)
  {
    long long v14 = [(MLE5RangeShapeExecutionStreamOperationPool *)self defaultShapePool];
    [v14 addObject:v4];
  }
  else
  {
    v8 = [(MLE5RangeShapeExecutionStreamOperationPool *)self shapeHashToPoolMap];
    v9 = [v4 shapeHash];
    v10 = [v8 objectForKeyedSubscript:v9];

    if (!v10)
    {
      v11 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        long long v15 = [v4 shapeHash];
        *(_DWORD *)buf = 138412290;
        uint64_t v17 = v15;
        _os_log_error_impl(&dword_19E58B000, v11, OS_LOG_TYPE_ERROR, "Tried to get pool for shape hash %@, but it does not exist.", buf, 0xCu);
      }
      long long v12 = (void *)MEMORY[0x1E4F1CA00];
      long long v13 = [v4 shapeHash];
      [v12 raise:*MEMORY[0x1E4F1C3B8], @"Tried to get pool for shape hash %@, but it does not exist.", v13 format];
    }
    [v10 addObject:v4];
  }
}

- (void)putBack:(id)a3
{
  id v4 = a3;
  v5 = [(MLE5RangeShapeExecutionStreamOperationPool *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__MLE5RangeShapeExecutionStreamOperationPool_putBack___block_invoke;
  v7[3] = &unk_1E59A5458;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __54__MLE5RangeShapeExecutionStreamOperationPool_putBack___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _putBack:*(void *)(a1 + 40)];
}

- (id)takeOutOperationForFeatures:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__16306;
  v36 = __Block_byref_object_dispose__16307;
  id v37 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__16306;
  v30 = __Block_byref_object_dispose__16307;
  id v31 = 0;
  v8 = uint64_t v7 = [(MLE5RangeShapeExecutionStreamOperationPool *)self compilerVersionInfo];

  v9 = [(MLE5RangeShapeExecutionStreamOperationPool *)self modelDescription];
  long long v12 = v10 = [(MLE5RangeShapeExecutionStreamOperationPool *)self compilerVersionInfo];
  char v13 = [v8 isEqualToString:v12];

  long long v14 = [(MLE5RangeShapeExecutionStreamOperationPool *)self serialQueue];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __80__MLE5RangeShapeExecutionStreamOperationPool_takeOutOperationForFeatures_error___block_invoke;
  v20[3] = &unk_1E59A4A90;
  char v25 = v13;
  v20[4] = self;
  v23 = &v32;
  v24 = &v26;
  id v15 = v8;
  id v21 = v15;
  id v16 = v6;
  id v22 = v16;
  dispatch_sync(v14, v20);

  uint64_t v17 = (void *)v33[5];
  if (a4 && !v17)
  {
    *a4 = (id) v27[5];
    uint64_t v17 = (void *)v33[5];
  }
  id v18 = v17;

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v18;
}

void __80__MLE5RangeShapeExecutionStreamOperationPool_takeOutOperationForFeatures_error___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 72)
    || ([*(id *)(a1 + 32) milDefaultShapeFunctionName],
        v2 = objc_claimAutoreleasedReturnValue(),
        v2,
        !v2))
  {
    id v8 = [*(id *)(a1 + 32) shapeHashToPoolMap];
    v9 = [v8 objectForKeyedSubscript:*(void *)(a1 + 40)];

    if (!v9)
    {
      uint64_t v10 = objc_opt_new();
      v11 = [*(id *)(a1 + 32) shapeHashToPoolMap];
      [v11 setObject:v10 forKeyedSubscript:*(void *)(a1 + 40)];

      v9 = (void *)v10;
    }
    uint64_t v12 = [v9 anyObject];
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    long long v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      objc_msgSend(v9, "removeObject:");
LABEL_17:

      return;
    }
    uint64_t v15 = [*(id *)(a1 + 32) _takeOutAnyOperation];
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    id v18 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (!v18)
    {
      v19 = *(void **)(a1 + 32);
      v20 = [v19 milFunctionName];
      uint64_t v21 = *(void *)(*(void *)(a1 + 64) + 8);
      id obj = *(id *)(v21 + 40);
      uint64_t v22 = [v19 _makeAndPreloadOperationForFunction:v20 error:&obj];
      objc_storeStrong((id *)(v21 + 40), obj);
      uint64_t v23 = *(void *)(*(void *)(a1 + 56) + 8);
      v24 = *(void **)(v23 + 40);
      *(void *)(v23 + 40) = v22;

      id v18 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if (!v18) {
        goto LABEL_17;
      }
    }
    char v25 = *(void **)(a1 + 48);
    uint64_t v26 = [*(id *)(a1 + 32) modelDescription];
    v27 = [*(id *)(a1 + 32) compilerVersionInfo];
    uint64_t v28 = *(void *)(*(void *)(a1 + 64) + 8);
    id v36 = *(id *)(v28 + 40);
    objc_storeStrong((id *)(v28 + 40), v36);

    if (v29) {
      goto LABEL_17;
    }
    uint64_t v30 = *(void *)(*(void *)(a1 + 56) + 8);
    id v31 = *(void **)(v30 + 40);
    *(void *)(v30 + 40) = 0;
LABEL_16:

    goto LABEL_17;
  }
  v3 = [*(id *)(a1 + 32) defaultShapePool];
  uint64_t v4 = [v3 anyObject];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = *(void **)(a1 + 32);
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    v9 = [*(id *)(a1 + 32) milDefaultShapeFunctionName];
    uint64_t v32 = *(void *)(*(void *)(a1 + 64) + 8);
    id v38 = *(id *)(v32 + 40);
    uint64_t v33 = [v7 _makeAndPreloadOperationForFunction:v9 error:&v38];
    objc_storeStrong((id *)(v32 + 40), v38);
    uint64_t v34 = *(void *)(*(void *)(a1 + 56) + 8);
    id v31 = *(void **)(v34 + 40);
    *(void *)(v34 + 40) = v33;
    goto LABEL_16;
  }
  id v35 = [*(id *)(a1 + 32) defaultShapePool];
  [v35 removeObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
}

- (id)_makeAndPreloadOperationForFunction:(id)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [MLE5ExecutionStreamOperation alloc];
  id v8 = [(MLE5RangeShapeExecutionStreamOperationPool *)self programLibrary];
  v9 = [(MLE5RangeShapeExecutionStreamOperationPool *)self modelDescription];
  uint64_t v10 = [(MLE5RangeShapeExecutionStreamOperationPool *)self configuration];
  v11 = [(MLE5ExecutionStreamOperation *)v7 initWithProgramLibrary:v8 functionName:v6 modelDescription:v9 configuration:v10 debugLabel:0 modelSignpostId:[(MLE5RangeShapeExecutionStreamOperationPool *)self modelSignpostId]];

  if (!v11 || ![(MLE5ExecutionStreamOperation *)v11 preloadAndReturnError:a4])
  {
    uint64_t v12 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_debug_impl(&dword_19E58B000, v12, OS_LOG_TYPE_DEBUG, "Unable to create exection stream operation for function %@.", (uint8_t *)&v14, 0xCu);
    }

    v11 = 0;
  }

  return v11;
}

- (BOOL)prepareWithInitialPoolSize:(int64_t)a3 error:(id *)a4
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__16306;
  uint64_t v16 = __Block_byref_object_dispose__16307;
  id v17 = 0;
  uint64_t v7 = [(MLE5RangeShapeExecutionStreamOperationPool *)self serialQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__MLE5RangeShapeExecutionStreamOperationPool_prepareWithInitialPoolSize_error___block_invoke;
  v11[3] = &unk_1E59A4A68;
  v11[4] = self;
  v11[5] = &v12;
  v11[6] = &v18;
  v11[7] = a3;
  dispatch_sync(v7, v11);

  int v8 = *((unsigned __int8 *)v19 + 24);
  if (a4 && !*((unsigned char *)v19 + 24))
  {
    *a4 = (id) v13[5];
    int v8 = *((unsigned __int8 *)v19 + 24);
  }
  BOOL v9 = v8 != 0;
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void __79__MLE5RangeShapeExecutionStreamOperationPool_prepareWithInitialPoolSize_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) milDefaultShapeFunctionName];

  if (v2)
  {
    if (*(uint64_t *)(a1 + 56) >= 1)
    {
      uint64_t v3 = 0;
      while (1)
      {
        uint64_t v4 = *(void **)(a1 + 32);
        uint64_t v5 = [v4 milDefaultShapeFunctionName];
        uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
        id obj = *(id *)(v6 + 40);
        uint64_t v7 = [v4 _makeAndPreloadOperationForFunction:v5 error:&obj];
        objc_storeStrong((id *)(v6 + 40), obj);

        if (!v7) {
          break;
        }
        [*(id *)(a1 + 32) _putBack:v7];

        if (++v3 >= *(void *)(a1 + 56)) {
          return;
        }
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }
  }
  else
  {
    int v8 = [*(id *)(a1 + 32) modelDescription];
    v11 = BOOL v9 = [*(id *)(a1 + 32) compilerVersionInfo];

    uint64_t v12 = objc_opt_new();
    uint64_t v13 = [*(id *)(a1 + 32) shapeHashToPoolMap];
    [v13 setObject:v12 forKeyedSubscript:v11];

    if (*(uint64_t *)(a1 + 56) >= 1)
    {
      uint64_t v14 = 0;
      while (1)
      {
        id v15 = *(void **)(a1 + 32);
        uint64_t v16 = [v15 milFunctionName];
        uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
        id v24 = *(id *)(v17 + 40);
        uint64_t v18 = [v15 _makeAndPreloadOperationForFunction:v16 error:&v24];
        objc_storeStrong((id *)(v17 + 40), v24);

        if (!v18) {
          break;
        }
        v19 = [*(id *)(a1 + 32) modelDescription];
        uint64_t v20 = [*(id *)(a1 + 32) compilerVersionInfo];
        uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 8);
        id v23 = *(id *)(v21 + 40);
        objc_storeStrong((id *)(v21 + 40), v23);

        if (!v22) {
          break;
        }
        [*(id *)(a1 + 32) _putBack:v18];

        if (++v14 >= *(void *)(a1 + 56)) {
          goto LABEL_15;
        }
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }
LABEL_15:
  }
}

- (MLE5RangeShapeExecutionStreamOperationPool)initWithProgramLibrary:(id)a3 functionName:(id)a4 modelDescription:(id)a5 configuration:(id)a6 modelSignpostId:(unint64_t)a7 compilerVersionInfo:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v38 = a5;
  id v37 = a6;
  id v35 = a8;
  v39 = v15;
  if (!v15) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"programLibrary parameter must not be nil.", v35, v37, v38);
  }
  if (!v16) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"functionName parameter must not be nil."];
  }
  v40.receiver = self;
  v40.super_class = (Class)MLE5RangeShapeExecutionStreamOperationPool;
  uint64_t v17 = [(MLE5RangeShapeExecutionStreamOperationPool *)&v40 init];
  p_isa = (id *)&v17->super.isa;
  v19 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_programLibrary, a3);
    v19->_modelSignpostId = a7;
    uint64_t v20 = [v16 copy];
    milFunctionName = v19->_milFunctionName;
    v19->_milFunctionName = (NSString *)v20;

    id v22 = v16;
    id v23 = [v15 functionNames];
    id v24 = [v22 stringByAppendingString:@"_default_function"];
    if ([v23 containsObject:v24]) {
      char v25 = v24;
    }
    else {
      char v25 = 0;
    }

    milDefaultShapeFunctionName = v19->_milDefaultShapeFunctionName;
    v19->_milDefaultShapeFunctionName = v25;

    objc_storeStrong(p_isa + 4, a5);
    objc_storeStrong(p_isa + 5, a6);
    objc_storeStrong(p_isa + 10, a8);
    uint64_t v27 = objc_opt_new();
    shapeHashToPoolMap = v19->_shapeHashToPoolMap;
    v19->_shapeHashToPoolMap = (NSMutableDictionary *)v27;

    uint64_t v29 = objc_opt_new();
    defaultShapePool = v19->_defaultShapePool;
    v19->_defaultShapePool = (NSMutableSet *)v29;

    id v31 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v32 = dispatch_queue_create("com.apple.coreml.MLE5Engine.rangeOperationPoolQueue", v31);
    serialQueue = v19->_serialQueue;
    v19->_serialQueue = (OS_dispatch_queue *)v32;
  }
  return v19;
}

@end