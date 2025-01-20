@interface MADImageSafetyClassificationResource
+ (id)sharedResource;
- (MADImageSafetyClassificationResource)init;
- (SCMLHandler)handler;
- (int64_t)activeCost;
- (int64_t)inactiveCost;
- (void)purge;
@end

@implementation MADImageSafetyClassificationResource

- (MADImageSafetyClassificationResource)init
{
  v6.receiver = self;
  v6.super_class = (Class)MADImageSafetyClassificationResource;
  v2 = [(MADImageSafetyClassificationResource *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("MADImageSafetyClassificationResource", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

+ (id)sharedResource
{
  v2 = +[VCPSharedInstanceManager sharedManager];
  dispatch_queue_t v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [v2 sharedInstanceWithIdentifier:v4 andCreationBlock:&__block_literal_global_68];

  return v5;
}

MADImageSafetyClassificationResource *__54__MADImageSafetyClassificationResource_sharedResource__block_invoke()
{
  v0 = objc_alloc_init(MADImageSafetyClassificationResource);
  return v0;
}

- (int64_t)activeCost
{
  if (DeviceHasANE()) {
    return 10;
  }
  else {
    return 100;
  }
}

- (int64_t)inactiveCost
{
  if (DeviceHasANE()) {
    return 2;
  }
  else {
    return 100;
  }
}

- (SCMLHandler)handler
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__43;
  v10 = __Block_byref_object_dispose__43;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__MADImageSafetyClassificationResource_handler__block_invoke;
  v5[3] = &unk_1E6296FA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SCMLHandler *)v3;
}

void __47__MADImageSafetyClassificationResource_handler__block_invoke(uint64_t a1)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    id v3 = VCPSignPostLog();
    os_signpost_id_t v4 = os_signpost_id_generate(v3);

    v5 = VCPSignPostLog();
    uint64_t v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CommSafetyHandler_init", "", buf, 2u);
    }

    id v7 = objc_alloc(MEMORY[0x1E4F9A610]);
    uint64_t v23 = *MEMORY[0x1E4F9A670];
    v24[0] = MEMORY[0x1E4F1CC38];
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    id v18 = 0;
    uint64_t v9 = [v7 initWithOptions:v8 error:&v18];
    id v10 = v18;
    uint64_t v11 = *(void *)(a1 + 32);
    v12 = *(void **)(v11 + 16);
    *(void *)(v11 + 16) = v9;

    v13 = VCPSignPostLog();
    v14 = v13;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v14, OS_SIGNPOST_INTERVAL_END, v4, "CommSafetyHandler_init", "", buf, 2u);
    }

    if (v10 && (int)MediaAnalysisLogLevel() >= 3)
    {
      v15 = VCPLogInstance();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = objc_opt_class();
        v17 = [v10 description];
        *(_DWORD *)buf = 138412546;
        uint64_t v20 = v16;
        __int16 v21 = 2112;
        v22 = v17;
        _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_ERROR, "Failed to create %@: %@", buf, 0x16u);
      }
    }

    v2 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
}

- (void)purge
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__MADImageSafetyClassificationResource_purge__block_invoke;
  block[3] = &unk_1E6296FD0;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __45__MADImageSafetyClassificationResource_purge__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end