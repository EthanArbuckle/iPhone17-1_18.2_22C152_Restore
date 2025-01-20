@interface VCPMADVisionResource
- (VCPMADVisionResource)init;
- (VNSession)session;
- (void)purge;
@end

@implementation VCPMADVisionResource

- (VCPMADVisionResource)init
{
  v6.receiver = self;
  v6.super_class = (Class)VCPMADVisionResource;
  v2 = [(VCPMADVisionResource *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("VCPMADVisionResource", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (VNSession)session
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__44;
  v10 = __Block_byref_object_dispose__44;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__VCPMADVisionResource_session__block_invoke;
  v5[3] = &unk_1E6296FA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (VNSession *)v3;
}

void __31__VCPMADVisionResource_session__block_invoke(uint64_t a1)
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
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "VNSession_init", "", buf, 2u);
    }

    id v7 = objc_alloc_init(MEMORY[0x1E4F45968]);
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(v8 + 16);
    *(void *)(v8 + 16) = v7;

    v10 = VCPSignPostLog();
    id v11 = v10;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v11, OS_SIGNPOST_INTERVAL_END, v4, "VNSession_init", "", v12, 2u);
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
  block[2] = __29__VCPMADVisionResource_purge__block_invoke;
  block[3] = &unk_1E6296FD0;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __29__VCPMADVisionResource_purge__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) releaseCachedResources];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end