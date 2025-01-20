@interface VCPMADVIUserFeedbackTask
+ (id)dependencies;
+ (id)taskWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5;
- (BOOL)autoCancellable;
- (VCPMADVIUserFeedbackTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5;
- (float)resourceRequirement;
- (int)run;
- (void)cancel;
- (void)setPreferredMetalDevice:(id)a3;
@end

@implementation VCPMADVIUserFeedbackTask

- (VCPMADVIUserFeedbackTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VCPMADVIUserFeedbackTask;
  v12 = [(VCPMADVIUserFeedbackTask *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_imageAsset, a4);
    objc_storeStrong((id *)&v13->_signpostPayload, a5);
    dispatch_queue_t v14 = dispatch_queue_create("VCPMADVIUserFeedbackTask", 0);
    cancelQueue = v13->_cancelQueue;
    v13->_cancelQueue = (OS_dispatch_queue *)v14;
  }
  return v13;
}

+ (id)taskWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isMemberOfClass:objc_opt_class()])
  {
    id v11 = (void *)[objc_alloc((Class)a1) initWithRequest:v8 imageAsset:v9 andSignpostPayload:v10];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v12 = VCPLogInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        v15 = (objc_class *)objc_opt_class();
        v16 = NSStringFromClass(v15);
        int v18 = 138412546;
        id v19 = v14;
        __int16 v20 = 2112;
        v21 = v16;
        _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEFAULT, "Incompatible request (%@) specified to %@", (uint8_t *)&v18, 0x16u);
      }
    }
    id v11 = 0;
  }

  return v11;
}

+ (id)dependencies
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)setPreferredMetalDevice:(id)a3
{
}

- (float)resourceRequirement
{
  return 1.0;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (void)cancel
{
  cancelQueue = self->_cancelQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__VCPMADVIUserFeedbackTask_cancel__block_invoke;
  block[3] = &unk_1E6296FF8;
  block[4] = self;
  dispatch_sync(cancelQueue, block);
}

uint64_t __34__VCPMADVIUserFeedbackTask_cancel__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 56) cancel];
  atomic_store(1u, (unsigned __int8 *)(*(void *)(a1 + 32) + 48));
  return result;
}

- (int)run
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_INFO, "VCPMADVIUserFeedbackTask running...", buf, 2u);
    }
  }
  v4 = +[VCPMADVIVisualSearchResource sharedResource];
  v5 = +[VCPMADResourceManager sharedManager];
  v6 = [v5 activateResource:v4];

  *(void *)buf = 0;
  v25 = buf;
  uint64_t v26 = 0x2020000000;
  int v27 = 0;
  dispatch_group_t v7 = dispatch_group_create();
  cancelQueue = self->_cancelQueue;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  int v18 = __31__VCPMADVIUserFeedbackTask_run__block_invoke;
  id v19 = &unk_1E6298C68;
  __int16 v20 = self;
  v23 = buf;
  id v9 = v7;
  v21 = v9;
  id v10 = v4;
  id v22 = v10;
  dispatch_sync(cancelQueue, &v16);
  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  id v11 = objc_msgSend(v10, "service", v16, v17, v18, v19, v20);
  [v11 clearCacheWithOption:56];

  [v6 reset];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v12 = VCPLogInstance();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = *((_DWORD *)v25 + 6);
      *(_DWORD *)v28 = 67109120;
      int v29 = v13;
      _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_INFO, "VCPMADVIUserFeedbackTask complete (%d)", v28, 8u);
    }
  }
  int v14 = *((_DWORD *)v25 + 6);

  _Block_object_dispose(buf, 8);
  return v14;
}

void __31__VCPMADVIUserFeedbackTask_run__block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 48));
  if (v2)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = -128;
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __31__VCPMADVIUserFeedbackTask_run__block_invoke_2;
    aBlock[3] = &unk_1E6298BF0;
    aBlock[4] = *(void *)(a1 + 32);
    v3 = _Block_copy(aBlock);
    id v4 = objc_alloc(MEMORY[0x1E4FB4030]);
    [*(id *)(*(void *)(a1 + 32) + 16) resolution];
    v5 = objc_msgSend(v4, "initWithImageLoader:imageSize:", v3);
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__51;
    v37 = __Block_byref_object_dispose__51;
    v38 = objc_alloc_init(VCPTimeMeasurement);
    [(id)v34[5] start];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __31__VCPMADVIUserFeedbackTask_run__block_invoke_234;
    v29[3] = &unk_1E629C2C0;
    v6 = *(void **)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 32);
    v31 = &v33;
    v29[4] = v7;
    uint64_t v32 = *(void *)(a1 + 56);
    id v30 = v6;
    id v8 = _Block_copy(v29);
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    id v9 = objc_alloc(MEMORY[0x1E4FB4090]);
    id v10 = [*(id *)(*(void *)(a1 + 32) + 8) userFeedbackPayload];
    id v11 = [*(id *)(*(void *)(a1 + 32) + 8) sfReportData];
    v12 = [*(id *)(*(void *)(a1 + 32) + 8) reportIdentifier];
    int v13 = (void *)[v9 initWithImage:v5 userFeedbackPayload:v10 sfReportData:v11 reportIdentifier:v12];

    int v14 = VCPSignPostLog();
    os_signpost_id_t v15 = os_signpost_id_generate(v14);

    uint64_t v16 = VCPSignPostLog();
    uint64_t v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 24);
      *(_DWORD *)buf = 138412290;
      uint64_t v41 = v18;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "VIService_UserFeedback", "%@", buf, 0xCu);
    }

    id v19 = [*(id *)(a1 + 48) service];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __31__VCPMADVIUserFeedbackTask_run__block_invoke_239;
    v25[3] = &unk_1E629C2E8;
    uint64_t v20 = *(void *)(a1 + 32);
    os_signpost_id_t v27 = v15;
    uint64_t v28 = 0;
    v25[4] = v20;
    id v21 = v8;
    id v26 = v21;
    uint64_t v22 = [v19 submitUserFeedback:v13 completion:v25];
    uint64_t v23 = *(void *)(a1 + 32);
    v24 = *(void **)(v23 + 56);
    *(void *)(v23 + 56) = v22;

    _Block_object_dispose(&v33, 8);
  }
}

id __31__VCPMADVIUserFeedbackTask_run__block_invoke_2(uint64_t a1)
{
  v6 = 0;
  unsigned int v5 = 0;
  if ([*(id *)(*(void *)(a1 + 32) + 16) loadPixelBuffer:&v6 orientation:&v5])
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v1 = VCPLogInstance();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v4 = 0;
        _os_log_impl(&dword_1BBEDA000, v1, OS_LOG_TYPE_DEFAULT, "VCPMADVIUserFeedbackTask image loading failed", v4, 2u);
      }
    }
    unsigned __int8 v2 = 0;
  }
  else
  {
    unsigned __int8 v2 = [MEMORY[0x1E4FB4020] imageWithPixelBuffer:v6 orientation:v5];
  }
  CF<opaqueCMSampleBuffer *>::~CF(&v6);
  return v2;
}

void __31__VCPMADVIUserFeedbackTask_run__block_invoke_234(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) stop];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v3)
  {
    unsigned __int8 v5 = atomic_load((unsigned __int8 *)(v4 + 48));
    if (v5) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = -128;
    }
    else {
      [*(id *)(*(void *)(a1 + 32) + 8) setError:v3];
    }
  }
  else
  {
    v6 = *(void **)(v4 + 8);
    id v7 = objc_alloc_init(MEMORY[0x1E4F74710]);
    v12[0] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [v6 setResults:v8];

    id v9 = [*(id *)(*(void *)(a1 + 32) + 8) results];
    id v10 = [v9 firstObject];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) elapsedTimeSeconds];
    [v10 setExecutionNanoseconds:(unint64_t)(v11 * 1000000000.0)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __31__VCPMADVIUserFeedbackTask_run__block_invoke_239(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = VCPSignPostLog();
  unsigned __int8 v5 = v4;
  os_signpost_id_t v6 = a1[6];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    uint64_t v7 = *(void *)(a1[4] + 24);
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v5, OS_SIGNPOST_INTERVAL_END, v6, "VIService_UserFeedback", "%@", (uint8_t *)&v8, 0xCu);
  }

  if (a1[7])
  {
    mach_absolute_time();
    VCPPerformance_LogMeasurement();
  }
  (*(void (**)(void))(a1[5] + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancellable, 0);
  objc_storeStrong((id *)&self->_cancelQueue, 0);
  objc_storeStrong((id *)&self->_preferredMetalDevice, 0);
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong((id *)&self->_imageAsset, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end