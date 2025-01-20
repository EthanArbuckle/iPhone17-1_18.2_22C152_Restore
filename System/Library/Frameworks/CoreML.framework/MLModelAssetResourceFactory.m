@interface MLModelAssetResourceFactory
+ (MLModelAssetResourceFactory)resourceFactoryWithArchiveData:(id)a3;
+ (MLModelAssetResourceFactory)resourceFactoryWithModelURL:(id)a3 error:(id *)a4;
- (MLModelAssetResourceFactory)initWithImpl:(id)a3;
- (MLModelAssetResourceFactoryImpl)impl;
- (NSURL)compiledModelURL;
- (OS_dispatch_queue)descriptionLoadQueue;
- (OS_dispatch_queue)modelLoadQueue;
- (OS_dispatch_queue)structureLoadQueue;
- (id)modelWithConfiguration:(id)a3 error:(id *)a4;
- (void)modelAssetDescriptionWithCompletionHandler:(id)a3;
- (void)modelStructureWithCompletionHandler:(id)a3;
- (void)modelWithConfiguration:(id)a3 completionHandler:(id)a4;
@end

@implementation MLModelAssetResourceFactory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
  objc_storeStrong((id *)&self->_structureLoadQueue, 0);
  objc_storeStrong((id *)&self->_descriptionLoadQueue, 0);

  objc_storeStrong((id *)&self->_modelLoadQueue, 0);
}

+ (MLModelAssetResourceFactory)resourceFactoryWithModelURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [[MLModelAssetResourceFactoryOnDiskImpl alloc] initWithModelURL:v5 error:a4];
  if (v6) {
    v7 = [[MLModelAssetResourceFactory alloc] initWithImpl:v6];
  }
  else {
    v7 = 0;
  }

  return v7;
}

- (MLModelAssetResourceFactory)initWithImpl:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MLModelAssetResourceFactory;
  v6 = [(MLModelAssetResourceFactory *)&v17 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.coreml.MLModelAssetResourceFactory.modelLoadQueue", v7);
    modelLoadQueue = v6->_modelLoadQueue;
    v6->_modelLoadQueue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.coreml.MLModelAssetResourceFactory.descriptionLoadQueue", v10);
    descriptionLoadQueue = v6->_descriptionLoadQueue;
    v6->_descriptionLoadQueue = (OS_dispatch_queue *)v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.coreml.MLModelAssetResourceFactory.structureLoadQueue", v13);
    structureLoadQueue = v6->_structureLoadQueue;
    v6->_structureLoadQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v6->_impl, a3);
  }

  return v6;
}

void __60__MLModelAssetResourceFactory_modelWithConfiguration_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) impl];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 modelWithConfiguration:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (MLModelAssetResourceFactoryImpl)impl
{
  return self->_impl;
}

- (id)modelWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__21784;
  v26 = __Block_byref_object_dispose__21785;
  id v27 = 0;
  uint64_t v16 = 0;
  objc_super v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__21784;
  v20 = __Block_byref_object_dispose__21785;
  id v21 = 0;
  v7 = [(MLModelAssetResourceFactory *)self modelLoadQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__MLModelAssetResourceFactory_modelWithConfiguration_error___block_invoke;
  v12[3] = &unk_1E59A4EF0;
  dispatch_queue_t v14 = &v22;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  v15 = &v16;
  dispatch_sync(v7, v12);

  v9 = (void *)v23[5];
  if (a4 && !v9)
  {
    *a4 = (id) v17[5];
    v9 = (void *)v23[5];
  }
  id v10 = v9;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (OS_dispatch_queue)modelLoadQueue
{
  return self->_modelLoadQueue;
}

- (OS_dispatch_queue)structureLoadQueue
{
  return self->_structureLoadQueue;
}

- (OS_dispatch_queue)descriptionLoadQueue
{
  return self->_descriptionLoadQueue;
}

- (void)modelStructureWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MLModelAssetResourceFactory *)self structureLoadQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__MLModelAssetResourceFactory_modelStructureWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E59A4EC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __67__MLModelAssetResourceFactory_modelStructureWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) impl];
  id v5 = 0;
  uint64_t v3 = [v2 modelStructureWithError:&v5];
  id v4 = v5;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)modelWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MLModelAssetResourceFactory *)self modelLoadQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__MLModelAssetResourceFactory_modelWithConfiguration_completionHandler___block_invoke;
  block[3] = &unk_1E59A4F18;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __72__MLModelAssetResourceFactory_modelWithConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) impl];
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = 0;
  id v4 = [v2 modelWithConfiguration:v3 error:&v6];
  id v5 = v6;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)modelAssetDescriptionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(MLModelAssetResourceFactory *)self descriptionLoadQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__MLModelAssetResourceFactory_modelAssetDescriptionWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E59A4EC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __74__MLModelAssetResourceFactory_modelAssetDescriptionWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) impl];
  id v5 = 0;
  uint64_t v3 = [v2 modelAssetDescriptionWithError:&v5];
  id v4 = v5;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (NSURL)compiledModelURL
{
  v2 = [(MLModelAssetResourceFactory *)self impl];
  uint64_t v3 = [v2 compiledModelURL];

  return (NSURL *)v3;
}

+ (MLModelAssetResourceFactory)resourceFactoryWithArchiveData:(id)a3
{
  id v3 = a3;
  id v4 = [[MLModelAssetResourceFactoryInMemoryImpl alloc] initWithArchiveData:v3];
  if (v4) {
    id v5 = [[MLModelAssetResourceFactory alloc] initWithImpl:v4];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

@end