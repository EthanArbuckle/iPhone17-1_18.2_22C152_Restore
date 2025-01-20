@interface VCPSharedInstanceManager
+ (id)sharedManager;
- (VCPSharedInstanceManager)init;
- (id)sharedInstanceWithIdentifier:(id)a3 andCreationBlock:(id)a4;
- (void)reset;
- (void)resetSharedInstanceWithIdentifier:(id)a3;
@end

@implementation VCPSharedInstanceManager

- (VCPSharedInstanceManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)VCPSharedInstanceManager;
  v2 = [(VCPSharedInstanceManager *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.mediaanalysis.VCPSharedInstanceManager", 0);
    serialQueue = v2->serialQueue_;
    v2->serialQueue_ = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    sharedInstances = v2->sharedInstances_;
    v2->sharedInstances_ = (NSMutableDictionary *)v5;
  }
  return v2;
}

+ (id)sharedManager
{
  if (sharedManager_once_token != -1) {
    dispatch_once(&sharedManager_once_token, &__block_literal_global_22);
  }
  v2 = (void *)sharedManager_instance;
  return v2;
}

void __41__VCPSharedInstanceManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(VCPSharedInstanceManager);
  v1 = (void *)sharedManager_instance;
  sharedManager_instance = (uint64_t)v0;
}

- (id)sharedInstanceWithIdentifier:(id)a3 andCreationBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__14;
  v21 = __Block_byref_object_dispose__14;
  id v22 = 0;
  serialQueue = self->serialQueue_;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__VCPSharedInstanceManager_sharedInstanceWithIdentifier_andCreationBlock___block_invoke;
  v13[3] = &unk_1E6298600;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(serialQueue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __74__VCPSharedInstanceManager_sharedInstanceWithIdentifier_andCreationBlock___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    uint64_t v5 = (void *)MEMORY[0x1C186D320]();
    uint64_t v6 = (*(void (**)(void))(a1[6] + 16))();
    uint64_t v7 = *(void *)(a1[7] + 8);
    objc_super v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    uint64_t v9 = *(void *)(*(void *)(a1[7] + 8) + 40);
    if (v9) {
      [*(id *)(a1[4] + 16) setObject:v9 forKeyedSubscript:a1[5]];
    }
  }
}

- (void)resetSharedInstanceWithIdentifier:(id)a3
{
  id v4 = a3;
  serialQueue = self->serialQueue_;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__VCPSharedInstanceManager_resetSharedInstanceWithIdentifier___block_invoke;
  v7[3] = &unk_1E6297790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

uint64_t __62__VCPSharedInstanceManager_resetSharedInstanceWithIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)reset
{
  serialQueue = self->serialQueue_;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__VCPSharedInstanceManager_reset__block_invoke;
  block[3] = &unk_1E6296FD0;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

uint64_t __33__VCPSharedInstanceManager_reset__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->sharedInstances_, 0);
  objc_storeStrong((id *)&self->serialQueue_, 0);
}

@end