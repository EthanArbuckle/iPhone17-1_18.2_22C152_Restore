@interface VCPMADVITextLookupTask
+ (id)dependencies;
+ (id)taskWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5;
- (BOOL)autoCancellable;
- (VCPMADVITextLookupTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5;
- (float)resourceRequirement;
- (id)createQueryContextWithError:(id *)a3;
- (int)run;
- (void)cancel;
- (void)setPreferredMetalDevice:(id)a3;
@end

@implementation VCPMADVITextLookupTask

- (VCPMADVITextLookupTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VCPMADVITextLookupTask;
  v12 = [(VCPMADVITextLookupTask *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_imageAsset, a4);
    objc_storeStrong((id *)&v13->_signpostPayload, a5);
    dispatch_queue_t v14 = dispatch_queue_create("VCPMADVITextLookupTask", 0);
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
  block[2] = __32__VCPMADVITextLookupTask_cancel__block_invoke;
  block[3] = &unk_1E6296FF8;
  block[4] = self;
  dispatch_sync(cancelQueue, block);
}

uint64_t __32__VCPMADVITextLookupTask_cancel__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 56) cancel];
  atomic_store(1u, (unsigned __int8 *)(*(void *)(a1 + 32) + 48));
  return result;
}

- (id)createQueryContextWithError:(id *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v6 = [(MADVITextLookupRequest *)self->_request queryID];

  if (v6)
  {
    v7 = [(MADVITextLookupRequest *)self->_request queryID];
    [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4FB40E0]];
  }
  id v8 = [(MADVITextLookupRequest *)self->_request uiScale];

  if (v8)
  {
    id v9 = [(MADVITextLookupRequest *)self->_request uiScale];
    [v5 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4FB40F8]];
  }
  id v10 = [(VCPMADServiceImageAsset *)self->_imageAsset clientBundleID];

  if (v10)
  {
    id v11 = [(VCPMADServiceImageAsset *)self->_imageAsset clientBundleID];
    [v5 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4FB40A0]];
  }
  preferredMetalDevice = self->_preferredMetalDevice;
  if (preferredMetalDevice) {
    [v5 setObject:preferredMetalDevice forKeyedSubscript:*MEMORY[0x1E4FB40D8]];
  }
  v13 = [(MADVITextLookupRequest *)self->_request engagementSuggestionType];

  if (v13)
  {
    id v14 = [(MADVITextLookupRequest *)self->_request engagementSuggestionType];
    [v5 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4FB40B0]];
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v15 = VCPLogInstance();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v5;
      _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_DEBUG, "Query context: %@", buf, 0xCu);
    }
  }
  id v20 = 0;
  v16 = [MEMORY[0x1E4FB4040] contextWithDictionary:v5 error:&v20];
  id v17 = v20;
  id v18 = v20;
  if (a3) {
    objc_storeStrong(a3, v17);
  }

  return v16;
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
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_INFO, "VCPMADVITextLookupTask running...", buf, 2u);
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
  id v18 = __29__VCPMADVITextLookupTask_run__block_invoke;
  id v19 = &unk_1E6298C68;
  id v20 = self;
  uint64_t v23 = buf;
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
      _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_INFO, "VCPMADVITextLookupTask complete (%d)", v28, 8u);
    }
  }
  int v14 = *((_DWORD *)v25 + 6);

  _Block_object_dispose(buf, 8);
  return v14;
}

void __29__VCPMADVITextLookupTask_run__block_invoke(uint64_t a1)
{
  v56[1] = *MEMORY[0x1E4F143B8];
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 48));
  if (v2)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = -128;
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __29__VCPMADVITextLookupTask_run__block_invoke_2;
    aBlock[3] = &unk_1E6298BF0;
    aBlock[4] = *(void *)(a1 + 32);
    v3 = _Block_copy(aBlock);
    id v4 = objc_alloc(MEMORY[0x1E4FB4030]);
    [*(id *)(*(void *)(a1 + 32) + 16) resolution];
    v5 = objc_msgSend(v4, "initWithImageLoader:imageSize:", v3);
    v6 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "vcp_annotationWithTypes:", 16);
    id v46 = 0;
    dispatch_group_t v7 = [*(id *)(a1 + 32) createQueryContextWithError:&v46];
    if (v7)
    {
      id v8 = [*(id *)(*(void *)(a1 + 32) + 8) surroundingText];
      BOOL v9 = v8 == 0;

      if (v9)
      {
        int v13 = 0;
      }
      else
      {
        id v10 = objc_alloc(MEMORY[0x1E4FB4080]);
        id v11 = [*(id *)(*(void *)(a1 + 32) + 8) surroundingText];
        v12 = [*(id *)(*(void *)(a1 + 32) + 8) normalizedBoundingBoxes];
        int v13 = (void *)[v10 initWithSurroundingText:v11 normalizedBoundingBoxes:v12];
      }
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v51 = 0x3032000000;
      v52 = __Block_byref_object_copy__18;
      v53 = __Block_byref_object_dispose__18;
      v54 = objc_alloc_init(VCPTimeMeasurement);
      [*(id *)(*((void *)&buf + 1) + 40) start];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __29__VCPMADVITextLookupTask_run__block_invoke_243;
      v42[3] = &unk_1E6298C18;
      id v20 = *(void **)(a1 + 40);
      uint64_t v21 = *(void *)(a1 + 32);
      p_long long buf = &buf;
      v42[4] = v21;
      uint64_t v45 = *(void *)(a1 + 56);
      id v43 = v20;
      id v22 = _Block_copy(v42);
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      id v23 = objc_alloc(MEMORY[0x1E4FB4088]);
      v24 = [*(id *)(*(void *)(a1 + 32) + 8) queryTerm];
      v25 = [*(id *)(*(void *)(a1 + 32) + 8) hintDomain];
      uint64_t v26 = (void *)[v23 initWithQueryTerm:v24 hintDomain:v25 textContext:v13 imageContext:v5 annotation:v6 queryContext:v7];

      int v27 = VCPSignPostLog();
      os_signpost_id_t v28 = os_signpost_id_generate(v27);

      int v29 = VCPSignPostLog();
      uint64_t v30 = v29;
      if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
      {
        uint64_t v31 = *(void *)(*(void *)(a1 + 32) + 24);
        *(_DWORD *)v48 = 138412290;
        uint64_t v49 = v31;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v30, OS_SIGNPOST_INTERVAL_BEGIN, v28, "VIService_TextLookup", "%@", v48, 0xCu);
      }

      v32 = [*(id *)(a1 + 48) service];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __29__VCPMADVITextLookupTask_run__block_invoke_248;
      v38[3] = &unk_1E6298C40;
      uint64_t v33 = *(void *)(a1 + 32);
      os_signpost_id_t v40 = v28;
      uint64_t v41 = 0;
      v38[4] = v33;
      id v34 = v22;
      id v39 = v34;
      uint64_t v35 = [v32 lookupTextWithQuery:v26 completion:v38];
      uint64_t v36 = *(void *)(a1 + 32);
      v37 = *(void **)(v36 + 56);
      *(void *)(v36 + 56) = v35;

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        int v14 = VCPLogInstance();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = [v46 description];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v15;
          _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_ERROR, "VCPMADVITextLookupTask failed to create text lookup query context (%@)", (uint8_t *)&buf, 0xCu);
        }
      }
      uint64_t v16 = *(void **)(*(void *)(a1 + 32) + 8);
      uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v55 = *MEMORY[0x1E4F28568];
      int v13 = [NSString stringWithFormat:@"Failed to create text lookup query context"];
      v56[0] = v13;
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:&v55 count:1];
      id v19 = [v17 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v18];
      [v16 setError:v19];
    }
  }
}

id __29__VCPMADVITextLookupTask_run__block_invoke_2(uint64_t a1)
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
        _os_log_impl(&dword_1BBEDA000, v1, OS_LOG_TYPE_DEFAULT, "VCPMADVITextLookupTask image loading failed", v4, 2u);
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

void __29__VCPMADVITextLookupTask_run__block_invoke_243(uint64_t a1, void *a2, void *a3)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) stop];
  uint64_t v7 = *(void *)(a1 + 32);
  if (v6)
  {
    unsigned __int8 v8 = atomic_load((unsigned __int8 *)(v7 + 48));
    if (v8) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = -128;
    }
    else {
      [*(id *)(*(void *)(a1 + 32) + 8) setError:v6];
    }
  }
  else
  {
    BOOL v9 = *(void **)(v7 + 8);
    id v10 = objc_alloc(MEMORY[0x1E4F74700]);
    id v11 = [v5 sections];
    v12 = (void *)[v10 initWithSearchSections:v11];
    v17[0] = v12;
    int v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    [v9 setResults:v13];

    int v14 = [*(id *)(*(void *)(a1 + 32) + 8) results];
    v15 = [v14 firstObject];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) elapsedTimeSeconds];
    [v15 setExecutionNanoseconds:(unint64_t)(v16 * 1000000000.0)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __29__VCPMADVITextLookupTask_run__block_invoke_248(void *a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = VCPSignPostLog();
  unsigned __int8 v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    uint64_t v10 = *(void *)(a1[4] + 24);
    int v11 = 138412290;
    uint64_t v12 = v10;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v8, OS_SIGNPOST_INTERVAL_END, v9, "VIService_TextLookup", "%@", (uint8_t *)&v11, 0xCu);
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