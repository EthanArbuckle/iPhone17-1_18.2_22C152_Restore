@interface VCPMADVIVisualSearchGatingTask
+ (id)dependencies;
+ (id)taskWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5;
- (BOOL)autoCancellable;
- (VCPMADVIVisualSearchGatingTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5;
- (float)resourceRequirement;
- (id)createQueryContextWithError:(id *)a3;
- (int)run;
- (void)cancel;
- (void)setPreferredMetalDevice:(id)a3;
- (void)storeResults:(id)a3;
@end

@implementation VCPMADVIVisualSearchGatingTask

- (VCPMADVIVisualSearchGatingTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VCPMADVIVisualSearchGatingTask;
  v12 = [(VCPMADVIVisualSearchGatingTask *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_imageAsset, a4);
    objc_storeStrong((id *)&v13->_signpostPayload, a5);
    dispatch_queue_t v14 = dispatch_queue_create("VCPMADVIVisualSearchGatingTask", 0);
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
  block[2] = __40__VCPMADVIVisualSearchGatingTask_cancel__block_invoke;
  block[3] = &unk_1E6296FF8;
  block[4] = self;
  dispatch_sync(cancelQueue, block);
}

uint64_t __40__VCPMADVIVisualSearchGatingTask_cancel__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 56) cancel];
  atomic_store(1u, (unsigned __int8 *)(*(void *)(a1 + 32) + 48));
  return result;
}

- (id)createQueryContextWithError:(id *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v6 = [(MADVIVisualSearchGatingRequest *)self->_request queryID];

  if (v6)
  {
    v7 = [(MADVIVisualSearchGatingRequest *)self->_request queryID];
    [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4FB40E0]];
  }
  id v8 = [(MADVIVisualSearchGatingRequest *)self->_request location];

  id v9 = (void *)MEMORY[0x1E4FB40D0];
  if (v8)
  {
    id v10 = [(MADVIVisualSearchGatingRequest *)self->_request location];
    [v5 setObject:v10 forKeyedSubscript:*v9];
  }
  id v11 = [(MADVIVisualSearchGatingRequest *)self->_request imageType];

  v12 = (void *)MEMORY[0x1E4FB40C0];
  if (v11)
  {
    v13 = [(MADVIVisualSearchGatingRequest *)self->_request imageType];
    [v5 setObject:v13 forKeyedSubscript:*v12];
  }
  id v14 = [(MADVIVisualSearchGatingRequest *)self->_request featureIdentifier];

  if (v14)
  {
    v15 = [(MADVIVisualSearchGatingRequest *)self->_request featureIdentifier];
    [v5 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4FB40B8]];
  }
  v16 = [(VCPMADServiceImageAsset *)self->_imageAsset location];

  if (v16)
  {
    objc_super v17 = [(VCPMADServiceImageAsset *)self->_imageAsset location];
    [v5 setObject:v17 forKeyedSubscript:*v9];
  }
  if ([(VCPMADServiceImageAsset *)self->_imageAsset isScreenshot]) {
    [v5 setObject:&unk_1F15ED218 forKeyedSubscript:*v12];
  }
  int v18 = [(VCPMADServiceImageAsset *)self->_imageAsset clientBundleID];

  if (v18)
  {
    id v19 = [(VCPMADServiceImageAsset *)self->_imageAsset clientBundleID];
    [v5 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4FB40A0]];
  }
  preferredMetalDevice = self->_preferredMetalDevice;
  if (preferredMetalDevice) {
    [v5 setObject:preferredMetalDevice forKeyedSubscript:*MEMORY[0x1E4FB40D8]];
  }
  v21 = [(MADVIVisualSearchGatingRequest *)self->_request imageURL];

  uint64_t v22 = (void *)MEMORY[0x1E4FB40C8];
  if (v21) {
    [v5 setObject:@"<redacted>" forKeyedSubscript:*MEMORY[0x1E4FB40C8]];
  }
  v23 = [(MADVIVisualSearchGatingRequest *)self->_request referralURL];

  v24 = (void *)MEMORY[0x1E4FB40E8];
  if (v23) {
    [v5 setObject:@"<redacted>" forKeyedSubscript:*MEMORY[0x1E4FB40E8]];
  }
  v25 = [(MADVIVisualSearchGatingRequest *)self->_request engagementSuggestionType];

  if (v25)
  {
    v26 = [(MADVIVisualSearchGatingRequest *)self->_request engagementSuggestionType];
    [v5 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4FB40B0]];
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v27 = VCPLogInstance();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v5;
      _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_DEBUG, "Query context: %@", buf, 0xCu);
    }
  }
  v28 = [(MADVIVisualSearchGatingRequest *)self->_request imageURL];
  BOOL v29 = v28 == 0;

  if (!v29)
  {
    v30 = [(MADVIVisualSearchGatingRequest *)self->_request imageURL];
    [v5 setObject:v30 forKeyedSubscript:*v22];
  }
  v31 = [(MADVIVisualSearchGatingRequest *)self->_request referralURL];
  BOOL v32 = v31 == 0;

  if (!v32)
  {
    v33 = [(MADVIVisualSearchGatingRequest *)self->_request referralURL];
    [v5 setObject:v33 forKeyedSubscript:*v24];
  }
  id v38 = 0;
  v34 = [MEMORY[0x1E4FB4040] contextWithDictionary:v5 error:&v38];
  id v35 = v38;
  id v36 = v38;
  if (a3) {
    objc_storeStrong(a3, v35);
  }

  return v34;
}

- (void)storeResults:(id)a3
{
  v31 = self;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v35 = [MEMORY[0x1E4F1CA48] array];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v3 = [v32 visualUnderstanding];
  v4 = [v3 imageRegions];

  id obj = v4;
  uint64_t v36 = [v4 countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v36)
  {
    uint64_t v34 = *(void *)v46;
    do
    {
      uint64_t v38 = 0;
      do
      {
        if (*(void *)v46 != v34) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v45 + 1) + 8 * v38);
        v40 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v31);
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        v37 = v5;
        v6 = [v5 domainInfo];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v41 objects:v50 count:16];
        if (v7)
        {
          uint64_t v8 = *(void *)v42;
          id v39 = v6;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v42 != v8) {
                objc_enumerationMutation(v39);
              }
              id v10 = *(void **)(*((void *)&v41 + 1) + 8 * v9);
              id v11 = objc_alloc(MEMORY[0x1E4F74718]);
              v12 = [v10 domainKey];
              v13 = [v10 labelName];
              id v14 = [v10 glyphName];
              uint64_t v15 = [v10 hasFocalPoint];
              [v10 focalPoint];
              double v17 = v16;
              double v19 = v18;
              __int16 v20 = [v10 displayLabel];
              v21 = [v10 displayMessage];
              uint64_t v22 = objc_msgSend(v11, "initWithDomain:label:glyphName:hasFocalPoint:focalPoint:displayLabel:displayMessage:", v12, v13, v14, v15, v20, v21, v17, v19);
              [v40 addObject:v22];

              ++v9;
            }
            while (v7 != v9);
            v6 = v39;
            uint64_t v7 = [v39 countByEnumeratingWithState:&v41 objects:v50 count:16];
          }
          while (v7);
        }

        id v23 = objc_alloc(MEMORY[0x1E4F74730]);
        [v37 regionOfInterest];
        v24 = objc_msgSend(v23, "initWithNormalizedBoundingBox:andDomains:", v40);
        [v35 addObject:v24];

        ++v38;
      }
      while (v38 != v36);
      uint64_t v36 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v36);
  }

  request = v31->_request;
  id v26 = objc_alloc(MEMORY[0x1E4F74728]);
  v27 = [v32 visualUnderstanding];
  v28 = [v27 payload];
  BOOL v29 = (void *)[v26 initWithResultItems:v35 andPayload:v28];
  v49 = v29;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
  [(MADVIVisualSearchGatingRequest *)request setResults:v30];
}

- (int)run
{
  v65[1] = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_INFO, "VCPMADVIVisualSearchGatingTask running...", (uint8_t *)&buf, 2u);
    }
  }
  if ([(VCPMADServiceImageAsset *)self->_imageAsset fromGenerativePlayground])
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v4 = VCPLogInstance();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_INFO, "[VS] Skipping Generative Playground asset", (uint8_t *)&buf, 2u);
      }
    }
    request = self->_request;
    id v6 = objc_alloc(MEMORY[0x1E4F74728]);
    uint64_t v7 = (void *)[v6 initWithResultItems:MEMORY[0x1E4F1CBF0] andPayload:0];
    v65[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:1];
    [(MADVIVisualSearchGatingRequest *)request setResults:v8];

LABEL_11:
    int v9 = 0;
    goto LABEL_35;
  }
  if (VCPPhotosParseCachingEnabled()
    && [(VCPMADServiceImageAsset *)self->_imageAsset hasCachedParseData])
  {
    uint64_t v7 = [(VCPMADServiceImageAsset *)self->_imageAsset cachedParseData];
    if (!v7)
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        id v10 = VCPLogInstance();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_INFO, "[VS] Cached parse result empty; returning empty result",
            (uint8_t *)&buf,
            2u);
        }
      }
      id v11 = self->_request;
      id v12 = objc_alloc(MEMORY[0x1E4F74728]);
      uint64_t v7 = (void *)[v12 initWithResultItems:MEMORY[0x1E4F1CBF0] andPayload:0];
      v64 = v7;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
      [(MADVIVisualSearchGatingRequest *)v11 setResults:v13];

      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v56 = 0;
  id v14 = [(VCPMADVIVisualSearchGatingTask *)self createQueryContextWithError:&v56];
  if (v14)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v60 = 0x2020000000;
    char v61 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __37__VCPMADVIVisualSearchGatingTask_run__block_invoke;
    aBlock[3] = &unk_1E629B270;
    aBlock[4] = self;
    aBlock[5] = &buf;
    long long v43 = _Block_copy(aBlock);
    id v15 = objc_alloc(MEMORY[0x1E4FB4030]);
    [(VCPMADServiceImageAsset *)self->_imageAsset resolution];
    long long v41 = objc_msgSend(v15, "initWithImageLoader:imageSize:", v43);
    long long v42 = [(VCPMADServiceImageAsset *)self->_imageAsset vcp_annotationWithTypes:7];
    double v16 = VIAllVisualSearchDomains();
    double v17 = [(MADVIVisualSearchGatingRequest *)self->_request domains];
    BOOL v18 = [v17 count] == 0;

    if (!v18)
    {
      double v19 = (void *)MEMORY[0x1E4F1CAD0];
      __int16 v20 = [(MADVIVisualSearchGatingRequest *)self->_request domains];
      uint64_t v21 = [v19 setWithArray:v20];

      double v16 = (void *)v21;
    }
    uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB4098]), "initWithImage:annotation:normalizedRegionOfInterest:domainsOfInterest:queryContext:", v41, v42, v16, v14, 0.0, 0.0, 1.0, 1.0);
    id v23 = +[VCPMADVIVisualSearchResource sharedResource];
    v24 = +[VCPMADResourceManager sharedManager];
    v25 = [v24 activateResource:v23];

    uint64_t v51 = 0;
    uint64_t v52 = &v51;
    uint64_t v53 = 0x2020000000;
    int v54 = 0;
    dispatch_group_t v26 = dispatch_group_create();
    cancelQueue = self->_cancelQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__VCPMADVIVisualSearchGatingTask_run__block_invoke_252;
    block[3] = &unk_1E629B2C0;
    block[4] = self;
    v49 = &v51;
    v28 = v26;
    long long v45 = v28;
    id v29 = v23;
    id v46 = v29;
    id v30 = v22;
    id v47 = v30;
    id v48 = v7;
    p_long long buf = &buf;
    dispatch_sync(cancelQueue, block);
    dispatch_group_wait(v28, 0xFFFFFFFFFFFFFFFFLL);
    [v25 reset];
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v31 = VCPLogInstance();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        int v32 = *((_DWORD *)v52 + 6);
        *(_DWORD *)v57 = 67109120;
        int v58 = v32;
        _os_log_impl(&dword_1BBEDA000, v31, OS_LOG_TYPE_INFO, "VCPMADVIVisualSearchGatingTask complete (%d)", v57, 8u);
      }
    }
    int v9 = *((_DWORD *)v52 + 6);

    _Block_object_dispose(&v51, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v33 = VCPLogInstance();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v34 = [v56 description];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v34;
        _os_log_impl(&dword_1BBEDA000, v33, OS_LOG_TYPE_DEFAULT, "VCPMADVIVisualSearchGatingTask failed to create visual search query context (%@)", (uint8_t *)&buf, 0xCu);
      }
    }
    id v35 = self->_request;
    uint64_t v36 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v62 = *MEMORY[0x1E4F28568];
    v37 = [NSString stringWithFormat:@"Failed to create visual search query context"];
    v63 = v37;
    uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
    id v39 = [v36 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v38];
    [(MADVIVisualSearchGatingRequest *)v35 setError:v39];

    int v9 = 0;
  }

LABEL_35:
  return v9;
}

id __37__VCPMADVIVisualSearchGatingTask_run__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  id v6 = 0;
  unsigned int v5 = 0;
  if ([*(id *)(*(void *)(a1 + 32) + 16) loadPixelBuffer:&v6 orientation:&v5])
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v1 = VCPLogInstance();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_1BBEDA000, v1, OS_LOG_TYPE_DEFAULT, "VCPMADVIVisualSearchGatingTask image loading failed", v4, 2u);
      }
    }
    v2 = 0;
  }
  else
  {
    v2 = [MEMORY[0x1E4FB4020] imageWithPixelBuffer:v6 orientation:v5];
  }
  CF<opaqueCMSampleBuffer *>::~CF(&v6);
  return v2;
}

void __37__VCPMADVIVisualSearchGatingTask_run__block_invoke_252(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 48));
  if (v2)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = -128;
  }
  else
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__32;
    v25 = __Block_byref_object_dispose__32;
    dispatch_group_t v26 = objc_alloc_init(VCPTimeMeasurement);
    [(id)v22[5] start];
    v3 = VCPSignPostLog();
    os_signpost_id_t v4 = os_signpost_id_generate(v3);

    unsigned int v5 = VCPSignPostLog();
    id v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 24);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v28 = v7;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "VIService_VisualSearchGating", "%@", buf, 0xCu);
    }

    uint64_t v8 = [*(id *)(a1 + 48) service];
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 64);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __37__VCPMADVIVisualSearchGatingTask_run__block_invoke_254;
    v15[3] = &unk_1E629B298;
    os_signpost_id_t v19 = v4;
    uint64_t v20 = 0;
    id v11 = *(void **)(a1 + 40);
    v15[4] = *(void *)(a1 + 32);
    double v17 = &v21;
    int8x16_t v18 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
    id v16 = v11;
    uint64_t v12 = [v8 parseWithVisualQuery:v9 cachedResults:v10 completion:v15];
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(void **)(v13 + 56);
    *(void *)(v13 + 56) = v12;

    _Block_object_dispose(&v21, 8);
  }
}

void __37__VCPMADVIVisualSearchGatingTask_run__block_invoke_254(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = VCPSignPostLog();
  id v11 = v10;
  os_signpost_id_t v12 = *(void *)(a1 + 72);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 24);
    int v20 = 138412290;
    uint64_t v21 = v13;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v11, OS_SIGNPOST_INTERVAL_END, v12, "VIService_VisualSearchGating", "%@", (uint8_t *)&v20, 0xCu);
  }

  if (*(void *)(a1 + 80))
  {
    mach_absolute_time();
    VCPPerformance_LogMeasurement();
  }
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) stop];
  id v14 = *(unsigned __int8 **)(a1 + 32);
  if (v9)
  {
    unsigned __int8 v15 = atomic_load(v14 + 48);
    if (v15) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = -128;
    }
    else {
      [*(id *)(*(void *)(a1 + 32) + 8) setError:v9];
    }
  }
  else
  {
    [v14 storeResults:v7];
    id v16 = [*(id *)(*(void *)(a1 + 32) + 8) results];
    double v17 = [v16 firstObject];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) elapsedTimeSeconds];
    [v17 setExecutionNanoseconds:(unint64_t)(v18 * 1000000000.0)];

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      uint64_t v19 = [*(id *)(*(void *)(a1 + 32) + 16) hasValidSceneProcessing];
    }
    else {
      uint64_t v19 = 0;
    }
    if (VCPPhotosParseCachingEnabled()
      && ([*(id *)(*(void *)(a1 + 32) + 16) hasCachedParseData] ^ 1 | v19) == 1)
    {
      [*(id *)(*(void *)(a1 + 32) + 16) setCachedParseData:v8 overwriteExisting:v19];
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
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