@interface HAP2SerializedOperationQueue
+ (NSOperationQueue)commonOperationQueue;
- (HAP2Lock)lock;
- (HAP2SerializedOperationQueue)init;
- (HAP2SerializedOperationQueue)initWithName:(id)a3;
- (HAP2SerializedOperationQueue)initWithName:(id)a3 operationQueue:(id)a4;
- (NSOperation)lastOperation;
- (NSOperationQueue)queue;
- (NSString)name;
- (id)_swapLastOperation:(id)a3;
- (void)addBlock:(id)a3;
- (void)addConcurrentBlock:(id)a3;
- (void)addConcurrentOperation:(id)a3;
- (void)addOperation:(id)a3;
- (void)setLastOperation:(id)a3;
@end

@implementation HAP2SerializedOperationQueue

void __45__HAP2SerializedOperationQueue_addOperation___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v4 = [v3 dependencies];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __cleanUpOperationDependencies_block_invoke;
    v6[3] = &unk_1E69F23A8;
    id v7 = v3;
    id v5 = v3;
    [v4 enumerateObjectsUsingBlock:v6];
  }
}

- (void)addBlock:(id)a3
{
  id v4 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:a3];
  [(HAP2SerializedOperationQueue *)self addOperation:v4];
}

- (void)addOperation:(id)a3
{
  location[1] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HAP2SerializedOperationQueue *)self _swapLastOperation:v4];
  id v6 = v4;
  id v7 = [v6 dependencies];
  if ([v7 count])
  {
    uint64_t v8 = [v7 count] + 1;
    v9 = [MEMORY[0x1E4F1CA80] setWithCapacity:v8];
    v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v8];
    [v10 addObject:v6];
    if ([v10 count])
    {
      do
      {
        v11 = [v10 popFirstObject];
        if ([v9 containsObject:v11])
        {
          v12 = v7;
        }
        else
        {
          [v9 addObject:v11];
          v12 = [v11 dependencies];

          if ([v12 count]) {
            [v10 addObjectsFromArray:v12];
          }
        }

        id v7 = v12;
      }
      while ([v10 count]);
    }
    else
    {
      v12 = v7;
    }
    v13 = [v9 allObjects];

    id v7 = v12;
  }
  else
  {
    location[0] = v6;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:location count:1];
  }

  if (v5 && ([v5 isFinished] & 1) == 0)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __45__HAP2SerializedOperationQueue_addOperation___block_invoke;
    v27[3] = &unk_1E69F23A8;
    id v28 = v5;
    [v13 enumerateObjectsUsingBlock:v27];
  }
  objc_initWeak(location, v6);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __45__HAP2SerializedOperationQueue_addOperation___block_invoke_2;
  v25[3] = &unk_1E69F4658;
  objc_copyWeak(&v26, location);
  v14 = (void *)MEMORY[0x1D944E2D0](v25);
  v15 = [v6 completionBlock];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __45__HAP2SerializedOperationQueue_addOperation___block_invoke_3;
  v22 = &unk_1E69F23D0;
  id v16 = v15;
  id v23 = v16;
  id v17 = v14;
  id v24 = v17;
  [v6 setCompletionBlock:&v19];
  v18 = [(HAP2SerializedOperationQueue *)self queue];
  [v18 addOperations:v13 waitUntilFinished:0];

  objc_destroyWeak(&v26);
  objc_destroyWeak(location);
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (id)_swapLastOperation:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__12886;
  id v16 = __Block_byref_object_dispose__12887;
  id v17 = 0;
  id v5 = [(HAP2SerializedOperationQueue *)self lock];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__HAP2SerializedOperationQueue__swapLastOperation___block_invoke;
  v9[3] = &unk_1E69F26B0;
  v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  [v5 performBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __51__HAP2SerializedOperationQueue__swapLastOperation___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) lastOperation];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);

  return [v5 setLastOperation:v6];
}

- (NSOperation)lastOperation
{
  uint64_t v3 = [(HAP2SerializedOperationQueue *)self lock];
  [v3 assertOwner];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastOperation);

  return (NSOperation *)WeakRetained;
}

- (void)setLastOperation:(id)a3
{
  id obj = a3;
  id v4 = [(HAP2SerializedOperationQueue *)self lock];
  [v4 assertOwner];

  objc_storeWeak((id *)&self->_lastOperation, obj);
}

- (HAP2Lock)lock
{
  return self->_lock;
}

uint64_t __45__HAP2SerializedOperationQueue_addOperation___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_destroyWeak((id *)&self->_lastOperation);
}

- (NSString)name
{
  return self->_name;
}

- (void)addConcurrentBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(HAP2SerializedOperationQueue *)self queue];
  [v5 addOperationWithBlock:v4];
}

- (void)addConcurrentOperation:(id)a3
{
  id v4 = a3;
  id v5 = [(HAP2SerializedOperationQueue *)self queue];
  [v5 addOperation:v4];
}

uint64_t __45__HAP2SerializedOperationQueue_addOperation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addDependency:*(void *)(a1 + 32)];
}

- (HAP2SerializedOperationQueue)initWithName:(id)a3 operationQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HAP2SerializedOperationQueue;
  v9 = [(HAP2SerializedOperationQueue *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    uint64_t v11 = +[HAP2Lock lockWithName:@"HAP2OperationQueue.lock"];
    lock = v10->_lock;
    v10->_lock = (HAP2Lock *)v11;

    objc_storeStrong((id *)&v10->_queue, a4);
  }

  return v10;
}

- (HAP2SerializedOperationQueue)initWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() commonOperationQueue];
  uint64_t v6 = [(HAP2SerializedOperationQueue *)self initWithName:v4 operationQueue:v5];

  return v6;
}

- (HAP2SerializedOperationQueue)init
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(HAP2SerializedOperationQueue *)self initWithName:v4];

  return v5;
}

+ (NSOperationQueue)commonOperationQueue
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HAP2SerializedOperationQueue_commonOperationQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (commonOperationQueue_onceToken != -1) {
    dispatch_once(&commonOperationQueue_onceToken, block);
  }
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__12886;
  id v10 = __Block_byref_object_dispose__12887;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__HAP2SerializedOperationQueue_commonOperationQueue__block_invoke_3;
  v5[3] = &unk_1E69F2D00;
  v5[4] = &v6;
  v5[5] = a1;
  [(id)commonOperationQueue_lock performBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSOperationQueue *)v3;
}

void __52__HAP2SerializedOperationQueue_commonOperationQueue__block_invoke(uint64_t a1)
{
  v1 = NSString;
  NSStringFromClass(*(Class *)(a1 + 32));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v1 stringWithFormat:@"%@.commonOperationQueueLock", v5];
  uint64_t v3 = +[HAP2Lock lockWithName:v2];
  id v4 = (void *)commonOperationQueue_lock;
  commonOperationQueue_lock = v3;
}

void __52__HAP2SerializedOperationQueue_commonOperationQueue__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained(&commonOperationQueue_weakQueue);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;

  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setQualityOfService:17];
    uint64_t v8 = NSString;
    v9 = NSStringFromClass(*(Class *)(a1 + 40));
    id v10 = [v8 stringWithFormat:@"com.apple.CoreHAP.%@.commonOperationQueue", v9];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setName:v10];

    id v11 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    objc_storeWeak(&commonOperationQueue_weakQueue, v11);
  }
}

@end