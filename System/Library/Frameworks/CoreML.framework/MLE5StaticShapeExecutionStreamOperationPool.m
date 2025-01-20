@interface MLE5StaticShapeExecutionStreamOperationPool
- (BOOL)prepareWithInitialPoolSize:(int64_t)a3 error:(id *)a4;
- (MLE5ProgramLibrary)programLibrary;
- (MLE5StaticShapeExecutionStreamOperationPool)initWithProgramLibrary:(id)a3 functionName:(id)a4 modelDescription:(id)a5 configuration:(id)a6 modelSignpostId:(unint64_t)a7 compilerVersionInfo:(id)a8;
- (MLModelConfiguration)modelConfiguration;
- (MLModelDescription)modelDescription;
- (MLPixelBufferPool)pixelBufferPool;
- (NSMutableSet)pool;
- (NSString)functionName;
- (OS_dispatch_queue)serialQueue;
- (id)_takeOut;
- (id)takeOutOperationForFeatures:(id)a3 error:(id *)a4;
- (int64_t)numberOfOperationsInUse;
- (unint64_t)modelSignpostId;
- (void)_putBack:(id)a3;
- (void)putBack:(id)a3;
- (void)setNumberOfOperationsInUse:(int64_t)a3;
@end

@implementation MLE5StaticShapeExecutionStreamOperationPool

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pixelBufferPool, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_pool, 0);
  objc_storeStrong((id *)&self->_modelConfiguration, 0);
  objc_storeStrong((id *)&self->_modelDescription, 0);
  objc_storeStrong((id *)&self->_functionName, 0);

  objc_storeStrong((id *)&self->_programLibrary, 0);
}

- (void)setNumberOfOperationsInUse:(int64_t)a3
{
  self->_numberOfOperationsInUse = a3;
}

- (int64_t)numberOfOperationsInUse
{
  return self->_numberOfOperationsInUse;
}

- (MLPixelBufferPool)pixelBufferPool
{
  return self->_pixelBufferPool;
}

- (unint64_t)modelSignpostId
{
  return self->_modelSignpostId;
}

- (OS_dispatch_queue)serialQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (NSMutableSet)pool
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (MLModelConfiguration)modelConfiguration
{
  return (MLModelConfiguration *)objc_getProperty(self, a2, 32, 1);
}

- (MLModelDescription)modelDescription
{
  return (MLModelDescription *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)functionName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (MLE5ProgramLibrary)programLibrary
{
  return (MLE5ProgramLibrary *)objc_getProperty(self, a2, 8, 1);
}

- (void)_putBack:(id)a3
{
  id v5 = a3;
  [(MLE5StaticShapeExecutionStreamOperationPool *)self setNumberOfOperationsInUse:[(MLE5StaticShapeExecutionStreamOperationPool *)self numberOfOperationsInUse] - 1];
  v4 = [(MLE5StaticShapeExecutionStreamOperationPool *)self pool];
  [v4 addObject:v5];
}

- (void)putBack:(id)a3
{
  id v4 = a3;
  id v5 = [(MLE5StaticShapeExecutionStreamOperationPool *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__MLE5StaticShapeExecutionStreamOperationPool_putBack___block_invoke;
  v7[3] = &unk_1E59A5458;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __55__MLE5StaticShapeExecutionStreamOperationPool_putBack___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _putBack:*(void *)(a1 + 40)];
}

- (id)_takeOut
{
  v3 = [(MLE5StaticShapeExecutionStreamOperationPool *)self pool];
  id v4 = [v3 anyObject];

  if (v4)
  {
    id v5 = [(MLE5StaticShapeExecutionStreamOperationPool *)self pool];
    [v5 removeObject:v4];
  }
  else
  {
    id v6 = [MLE5ExecutionStreamOperation alloc];
    v7 = [(MLE5StaticShapeExecutionStreamOperationPool *)self programLibrary];
    id v8 = [(MLE5StaticShapeExecutionStreamOperationPool *)self functionName];
    v9 = [(MLE5StaticShapeExecutionStreamOperationPool *)self modelDescription];
    v10 = [(MLE5StaticShapeExecutionStreamOperationPool *)self modelConfiguration];
    id v4 = [(MLE5ExecutionStreamOperation *)v6 initWithProgramLibrary:v7 functionName:v8 modelDescription:v9 configuration:v10 debugLabel:0 modelSignpostId:[(MLE5StaticShapeExecutionStreamOperationPool *)self modelSignpostId]];

    id v5 = [(MLE5StaticShapeExecutionStreamOperationPool *)self pixelBufferPool];
    [(MLE5ExecutionStreamOperation *)v4 setPixelBufferPool:v5];
  }

  [(MLE5StaticShapeExecutionStreamOperationPool *)self setNumberOfOperationsInUse:[(MLE5StaticShapeExecutionStreamOperationPool *)self numberOfOperationsInUse] + 1];

  return v4;
}

- (id)takeOutOperationForFeatures:(id)a3 error:(id *)a4
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  id v5 = [(MLE5StaticShapeExecutionStreamOperationPool *)self serialQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__MLE5StaticShapeExecutionStreamOperationPool_takeOutOperationForFeatures_error___block_invoke;
  v8[3] = &unk_1E59A5300;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v5, v8);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __81__MLE5StaticShapeExecutionStreamOperationPool_takeOutOperationForFeatures_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _takeOut];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)prepareWithInitialPoolSize:(int64_t)a3 error:(id *)a4
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  v7 = [(MLE5StaticShapeExecutionStreamOperationPool *)self serialQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__MLE5StaticShapeExecutionStreamOperationPool_prepareWithInitialPoolSize_error___block_invoke;
  v11[3] = &unk_1E59A4A68;
  v11[4] = self;
  v11[5] = &v18;
  v11[6] = &v12;
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

void __80__MLE5StaticShapeExecutionStreamOperationPool_prepareWithInitialPoolSize_error___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2 <= [*(id *)(a1 + 32) numberOfOperationsInUse])
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 56);
    uint64_t v4 = v3 - [*(id *)(a1 + 32) numberOfOperationsInUse];
  }
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v4];
  if (v4)
  {
    uint64_t v6 = v4 - 1;
    do
    {
      v7 = [*(id *)(a1 + 32) _takeOut];
      uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
      id obj = *(id *)(v8 + 40);
      char v9 = [v7 preloadAndReturnError:&obj];
      objc_storeStrong((id *)(v8 + 40), obj);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;
      [v5 addObject:v7];
      BOOL v10 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 0;

      if (v6) {
        char v11 = v10;
      }
      else {
        char v11 = 1;
      }
      --v6;
    }
    while ((v11 & 1) == 0);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v12 = v5;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(a1 + 32), "_putBack:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v13);
  }
}

- (MLE5StaticShapeExecutionStreamOperationPool)initWithProgramLibrary:(id)a3 functionName:(id)a4 modelDescription:(id)a5 configuration:(id)a6 modelSignpostId:(unint64_t)a7 compilerVersionInfo:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v30 = a5;
  id v17 = a6;
  id v18 = a8;
  if (!v15) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"programLibrary parameter must not be nil."];
  }
  if (!v16) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"functionName parameter must not be nil."];
  }
  v31.receiver = self;
  v31.super_class = (Class)MLE5StaticShapeExecutionStreamOperationPool;
  long long v19 = [(MLE5StaticShapeExecutionStreamOperationPool *)&v31 init];
  uint64_t v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_programLibrary, a3);
    v20->_modelSignpostId = a7;
    uint64_t v21 = [v16 copy];
    functionName = v20->_functionName;
    v20->_functionName = (NSString *)v21;

    objc_storeStrong((id *)&v20->_modelDescription, a5);
    objc_storeStrong((id *)&v20->_modelConfiguration, a6);
    uint64_t v23 = [MEMORY[0x1E4F1CA80] set];
    pool = v20->_pool;
    v20->_pool = (NSMutableSet *)v23;

    v25 = objc_alloc_init(MLPixelBufferPool);
    pixelBufferPool = v20->_pixelBufferPool;
    v20->_pixelBufferPool = v25;

    v20->_numberOfOperationsInUse = 0;
    dispatch_queue_t v27 = dispatch_queue_create("com.apple.coreml.MLE5Engine.staticOperationPoolQueue", 0);
    serialQueue = v20->_serialQueue;
    v20->_serialQueue = (OS_dispatch_queue *)v27;
  }
  return v20;
}

@end