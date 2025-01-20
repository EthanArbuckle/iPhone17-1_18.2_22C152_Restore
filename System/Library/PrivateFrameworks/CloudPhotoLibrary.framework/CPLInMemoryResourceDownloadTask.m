@interface CPLInMemoryResourceDownloadTask
+ (id)failedTaskForResource:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (CPLInMemoryResourceDownloadTask)initWithResource:(id)a3 taskIdentifier:(id)a4 launchHandler:(id)a5 completionHandler:(id)a6;
- (CPLPlaceholderRecord)cloudRecord;
- (CPLResource)cloudResource;
- (id)completionHandler;
- (id)launchHandler;
- (void)associateCloudResource:(id)a3 ofRecord:(id)a4;
- (void)cancelTask;
- (void)finishWithData:(id)a3 error:(id)a4;
- (void)launch;
- (void)launchTransportTask:(id)a3;
@end

@implementation CPLInMemoryResourceDownloadTask

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_launchHandler, 0);
  objc_storeStrong((id *)&self->_cloudRecord, 0);
  objc_storeStrong((id *)&self->_cloudResource, 0);
  objc_storeStrong((id *)&self->_transportTask, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (id)launchHandler
{
  return self->_launchHandler;
}

- (CPLPlaceholderRecord)cloudRecord
{
  return self->_cloudRecord;
}

- (CPLResource)cloudResource
{
  return self->_cloudResource;
}

- (void)launchTransportTask:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__CPLInMemoryResourceDownloadTask_launchTransportTask___block_invoke;
  v10[3] = &unk_1E60A6728;
  v10[4] = self;
  id v11 = v4;
  v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_13728;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

uint64_t __55__CPLInMemoryResourceDownloadTask_launchTransportTask___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if ((result & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 40));
    v3 = *(void **)(*(void *)(a1 + 32) + 56);
    return [v3 runWithNoSyncSession];
  }
  return result;
}

- (void)finishWithData:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__CPLInMemoryResourceDownloadTask_finishWithData_error___block_invoke;
  v14[3] = &unk_1E60A6660;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  dispatch_block_t v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_13728;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  v10 = queue;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __56__CPLInMemoryResourceDownloadTask_finishWithData_error___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 88) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = 0;
}

- (void)cancelTask
{
  v5.receiver = self;
  v5.super_class = (Class)CPLInMemoryResourceDownloadTask;
  [(CPLResourceTransferTask *)&v5 cancelTask];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CPLInMemoryResourceDownloadTask_cancelTask__block_invoke;
  block[3] = &unk_1E60A5DD8;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __45__CPLInMemoryResourceDownloadTask_cancelTask__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = (void *)v1[7];
  if (v2)
  {
    [v2 cancel];
  }
  else
  {
    id v3 = +[CPLErrors operationCancelledError];
    [v1 finishWithData:0 error:v3];
  }
}

- (void)launch
{
}

- (void)associateCloudResource:(id)a3 ofRecord:(id)a4
{
  id v6 = (CPLResource *)a3;
  id v7 = (CPLPlaceholderRecord *)a4;
  cloudResource = self->_cloudResource;
  self->_cloudResource = v6;
  v10 = v6;

  cloudRecord = self->_cloudRecord;
  self->_cloudRecord = v7;
}

- (CPLInMemoryResourceDownloadTask)initWithResource:(id)a3 taskIdentifier:(id)a4 launchHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CPLInMemoryResourceDownloadTask;
  id v12 = [(CPLResourceTransferTask *)&v21 initWithResource:a3 taskIdentifier:a4];
  if (v12)
  {
    dispatch_block_t v13 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.cpl.inmemorydownloadtask", v13);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v14;

    uint64_t v16 = [v10 copy];
    id launchHandler = v12->_launchHandler;
    v12->_id launchHandler = (id)v16;

    uint64_t v18 = [v11 copy];
    id completionHandler = v12->_completionHandler;
    v12->_id completionHandler = (id)v18;
  }
  return v12;
}

+ (id)failedTaskForResource:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = objc_alloc((Class)a1);
  id v12 = [MEMORY[0x1E4F29128] UUID];
  dispatch_block_t v13 = [v12 UUIDString];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __81__CPLInMemoryResourceDownloadTask_failedTaskForResource_error_completionHandler___block_invoke;
  v17[3] = &unk_1E60A8F20;
  id v18 = v8;
  id v14 = v8;
  id v15 = (void *)[v11 initWithResource:v10 taskIdentifier:v13 launchHandler:v17 completionHandler:v9];

  return v15;
}

uint64_t __81__CPLInMemoryResourceDownloadTask_failedTaskForResource_error_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 finishWithData:0 error:*(void *)(a1 + 32)];
}

@end