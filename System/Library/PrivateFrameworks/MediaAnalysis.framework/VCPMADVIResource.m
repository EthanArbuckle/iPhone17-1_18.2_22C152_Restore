@interface VCPMADVIResource
- (VCPMADVIResource)init;
- (VIService)service;
- (int64_t)activeCost;
- (int64_t)inactiveCost;
- (void)purge;
@end

@implementation VCPMADVIResource

- (VCPMADVIResource)init
{
  v6.receiver = self;
  v6.super_class = (Class)VCPMADVIResource;
  v2 = [(VCPMADVIResource *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("VCPMADVIResource", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (int64_t)activeCost
{
  if (DeviceHasANE()) {
    return 40;
  }
  else {
    return 100;
  }
}

- (int64_t)inactiveCost
{
  if (DeviceHasANE()) {
    return 5;
  }
  else {
    return 100;
  }
}

- (VIService)service
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__8;
  v10 = __Block_byref_object_dispose__8;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__VCPMADVIResource_service__block_invoke;
  v5[3] = &unk_1E6296FA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (VIService *)v3;
}

void __27__VCPMADVIResource_service__block_invoke(uint64_t a1)
{
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
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "VIService_init", "", buf, 2u);
    }

    id v7 = objc_alloc_init(MEMORY[0x1E4FB4070]);
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(v8 + 16);
    *(void *)(v8 + 16) = v7;

    v10 = VCPSignPostLog();
    id v11 = v10;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v11, OS_SIGNPOST_INTERVAL_END, v4, "VIService_init", "", v12, 2u);
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
  block[2] = __25__VCPMADVIResource_purge__block_invoke;
  block[3] = &unk_1E6296FD0;
  block[4] = self;
  dispatch_sync(queue, block);
  id v3 = [MEMORY[0x1E4F45968] globalSession];
  [v3 releaseCachedResources];
}

void __25__VCPMADVIResource_purge__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end