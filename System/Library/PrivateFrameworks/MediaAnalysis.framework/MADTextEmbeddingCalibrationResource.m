@interface MADTextEmbeddingCalibrationResource
+ (id)sharedResource;
- (MADTextEmbeddingCalibration)instance;
- (MADTextEmbeddingCalibrationResource)init;
- (int64_t)activeCost;
- (int64_t)inactiveCost;
- (void)purge;
@end

@implementation MADTextEmbeddingCalibrationResource

- (MADTextEmbeddingCalibrationResource)init
{
  v10.receiver = self;
  v10.super_class = (Class)MADTextEmbeddingCalibrationResource;
  v2 = [(MADTextEmbeddingCalibrationResource *)&v10 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    id v4 = objc_claimAutoreleasedReturnValue();
    v5 = (const char *)[v4 UTF8String];
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create(v5, v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

+ (id)sharedResource
{
  v3 = +[VCPSharedInstanceManager sharedManager];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__MADTextEmbeddingCalibrationResource_sharedResource__block_invoke;
  v8[3] = &__block_descriptor_40_e5__8__0l;
  v8[4] = a1;
  v6 = [v3 sharedInstanceWithIdentifier:v5 andCreationBlock:v8];

  return v6;
}

id __53__MADTextEmbeddingCalibrationResource_sharedResource__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  return v0;
}

- (int64_t)activeCost
{
  if (DeviceHasANE()) {
    return 4;
  }
  else {
    return 100;
  }
}

- (int64_t)inactiveCost
{
  if (DeviceHasANE()) {
    return 1;
  }
  else {
    return 100;
  }
}

- (MADTextEmbeddingCalibration)instance
{
  uint64_t v6 = 0;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__24;
  objc_super v10 = __Block_byref_object_dispose__24;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__MADTextEmbeddingCalibrationResource_instance__block_invoke;
  v5[3] = &unk_1E6296FA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MADTextEmbeddingCalibration *)v3;
}

void __47__MADTextEmbeddingCalibrationResource_instance__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(a1 + 32) + 16))
  {
    v2 = objc_alloc_init(MADTextEmbeddingCalibration);
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = v2;

    if (!*(void *)(*(void *)(a1 + 32) + 16) && (int)MediaAnalysisLogLevel() >= 3)
    {
      v5 = VCPLogInstance();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = (objc_class *)objc_opt_class();
        dispatch_queue_t v7 = NSStringFromClass(v6);
        int v8 = 138412290;
        v9 = v7;
        _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_ERROR, "[Resource] Failed to init %@", (uint8_t *)&v8, 0xCu);
      }
    }
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 16));
}

- (void)purge
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MADTextEmbeddingCalibrationResource_purge__block_invoke;
  block[3] = &unk_1E6296FD0;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __44__MADTextEmbeddingCalibrationResource_purge__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end