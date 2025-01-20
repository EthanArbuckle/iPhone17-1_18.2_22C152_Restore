@interface FBSApplicationDataStoreClientFactory
+ (BOOL)isServerProcess;
+ (id)sharedInstance;
- (FBSApplicationDataStoreClientFactory)init;
- (NSArray)prefetchedKeys;
- (id)checkout;
- (void)checkin;
- (void)setPrefetchedKeys:(id)a3;
@end

@implementation FBSApplicationDataStoreClientFactory

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance___singleton;

  return v2;
}

- (id)checkout
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__FBSApplicationDataStoreClientFactory_checkout__block_invoke;
  v5[3] = &unk_1E58F5230;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)checkin
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__FBSApplicationDataStoreClientFactory_checkin__block_invoke;
  block[3] = &unk_1E58F4B00;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __47__FBSApplicationDataStoreClientFactory_checkin__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 8);
  if (v2)
  {
    *(void *)(v1 + 8) = v2 - 1;
    uint64_t v4 = *(void *)(a1 + 32);
    if (!*(void *)(v4 + 8))
    {
      [*(id *)(v4 + 24) invalidate];
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void **)(v5 + 24);
      *(void *)(v5 + 24) = 0;
    }
  }
}

void __48__FBSApplicationDataStoreClientFactory_checkout__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 8);
  if (!v3)
  {
    if (!*(void *)(v2 + 24))
    {
      uint64_t v5 = NSClassFromString(&cfstr_Fbapplicationd.isa);
      if (+[FBSApplicationDataStoreClientFactory isServerProcess])
      {
        BOOL v6 = v5 == 0;
      }
      else
      {
        BOOL v6 = 1;
      }
      if (v6)
      {
        v7 = objc_alloc_init(FBSApplicationDataStoreRepositoryClient);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __48__FBSApplicationDataStoreClientFactory_checkout__block_invoke_2;
        v15[3] = &unk_1E58F4B00;
        uint64_t v8 = v7;
        v16 = v8;
        uint64_t v4 = (void (**)(void))MEMORY[0x19F3991F0](v15);
        uint64_t v9 = *(void *)(a1 + 32);
        v10 = *(void **)(v9 + 24);
        *(void *)(v9 + 24) = v8;
        id v11 = v8;
      }
      else
      {
        id v12 = objc_alloc_init(v5);
        uint64_t v13 = *(void *)(a1 + 32);
        v14 = *(void **)(v13 + 24);
        *(void *)(v13 + 24) = v12;

        uint64_t v4 = 0;
      }
      [*(id *)(*(void *)(a1 + 32) + 24) addPrefetchedKeys:*(void *)(*(void *)(a1 + 32) + 32)];
      uint64_t v2 = *(void *)(a1 + 32);
      uint64_t v3 = *(void *)(v2 + 8);
      goto LABEL_5;
    }
    uint64_t v3 = 0;
  }
  uint64_t v4 = 0;
LABEL_5:
  *(void *)(v2 + 8) = v3 + 1;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 24));
  if (v4) {
    v4[2](v4);
  }
}

- (FBSApplicationDataStoreClientFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)FBSApplicationDataStoreClientFactory;
  if ([(FBSApplicationDataStoreClientFactory *)&v3 init]) {
    BSDispatchQueueCreateSerial();
  }
  return 0;
}

uint64_t __54__FBSApplicationDataStoreClientFactory_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(FBSApplicationDataStoreClientFactory);
  uint64_t v1 = sharedInstance___singleton;
  sharedInstance___singleton = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)isServerProcess
{
  uint64_t v2 = [off_1E58F4520 environmentAliases];
  objc_super v3 = [off_1E58F4568 defaultShellMachName];
  uint64_t v4 = [v2 resolveMachService:v3];

  uint64_t v5 = [off_1E58F4588 bootstrapConfiguration];
  BOOL v6 = [v5 domainForMachName:v4];

  v7 = +[FBSSystemServiceSpecification identifier];
  uint64_t v8 = [v6 serviceForIdentifier:v7];

  return v8 != 0;
}

void __48__FBSApplicationDataStoreClientFactory_checkout__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) calloutQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__FBSApplicationDataStoreClientFactory_checkout__block_invoke_3;
  block[3] = &unk_1E58F4B00;
  id v4 = *(id *)(a1 + 32);
  dispatch_async(v2, block);
}

uint64_t __48__FBSApplicationDataStoreClientFactory_checkout__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) activate];
}

- (NSArray)prefetchedKeys
{
  return self->_prefetchedKeys;
}

- (void)setPrefetchedKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefetchedKeys, 0);
  objc_storeStrong((id *)&self->_sharedClient, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end