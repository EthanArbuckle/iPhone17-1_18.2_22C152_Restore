@interface VCPMADVIVisualSearchTask
+ (id)dependencies;
+ (id)taskWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5;
- (BOOL)autoCancellable;
- (VCPMADVIVisualSearchTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5;
- (float)resourceRequirement;
- (id)createQueryContextWithError:(id *)a3;
- (int)run;
- (void)cancel;
- (void)setPreferredMetalDevice:(id)a3;
- (void)storeResults:(id)a3;
@end

@implementation VCPMADVIVisualSearchTask

- (VCPMADVIVisualSearchTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VCPMADVIVisualSearchTask;
  v12 = [(VCPMADVIVisualSearchTask *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_imageAsset, a4);
    objc_storeStrong((id *)&v13->_signpostPayload, a5);
    dispatch_queue_t v14 = dispatch_queue_create("VCPMADVIVisualSearchTask", 0);
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
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
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
  block[2] = __34__VCPMADVIVisualSearchTask_cancel__block_invoke;
  block[3] = &unk_1E6296FF8;
  block[4] = self;
  dispatch_sync(cancelQueue, block);
}

uint64_t __34__VCPMADVIVisualSearchTask_cancel__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 56) cancel];
  atomic_store(1u, (unsigned __int8 *)(*(void *)(a1 + 32) + 48));
  return result;
}

- (id)createQueryContextWithError:(id *)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v6 = [(MADVIVisualSearchRequest *)self->_request queryID];

  if (v6)
  {
    v7 = [(MADVIVisualSearchRequest *)self->_request queryID];
    [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4FB40E0]];
  }
  id v8 = [(MADVIVisualSearchRequest *)self->_request uiScale];

  if (v8)
  {
    id v9 = [(MADVIVisualSearchRequest *)self->_request uiScale];
    [v5 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4FB40F8]];
  }
  id v10 = [(MADVIVisualSearchRequest *)self->_request location];

  id v11 = (void *)MEMORY[0x1E4FB40D0];
  if (v10)
  {
    v12 = [(MADVIVisualSearchRequest *)self->_request location];
    [v5 setObject:v12 forKeyedSubscript:*v11];
  }
  v13 = [(MADVIVisualSearchRequest *)self->_request imageType];

  id v14 = (void *)MEMORY[0x1E4FB40C0];
  if (v13)
  {
    v15 = [(MADVIVisualSearchRequest *)self->_request imageType];
    [v5 setObject:v15 forKeyedSubscript:*v14];
  }
  v16 = [(MADVIVisualSearchRequest *)self->_request catalogIDs];

  if (v16)
  {
    objc_super v17 = [(MADVIVisualSearchRequest *)self->_request catalogIDs];
    [v5 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4FB40A8]];
  }
  int v18 = [(MADVIVisualSearchRequest *)self->_request featureIdentifier];

  if (v18)
  {
    id v19 = [(MADVIVisualSearchRequest *)self->_request featureIdentifier];
    [v5 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4FB40B8]];
  }
  __int16 v20 = [(VCPMADServiceImageAsset *)self->_imageAsset location];

  if (v20)
  {
    v21 = [(VCPMADServiceImageAsset *)self->_imageAsset location];
    [v5 setObject:v21 forKeyedSubscript:*v11];
  }
  if ([(VCPMADServiceImageAsset *)self->_imageAsset isScreenshot]) {
    [v5 setObject:&unk_1F15ED440 forKeyedSubscript:*v14];
  }
  uint64_t v22 = [(VCPMADServiceImageAsset *)self->_imageAsset clientBundleID];

  if (v22)
  {
    v23 = [(VCPMADServiceImageAsset *)self->_imageAsset clientBundleID];
    [v5 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4FB40A0]];
  }
  v24 = [(VCPMADServiceImageAsset *)self->_imageAsset clientTeamID];

  if (v24)
  {
    v25 = [(VCPMADServiceImageAsset *)self->_imageAsset clientTeamID];
    [v5 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4FB40F0]];
  }
  preferredMetalDevice = self->_preferredMetalDevice;
  if (preferredMetalDevice) {
    [v5 setObject:preferredMetalDevice forKeyedSubscript:*MEMORY[0x1E4FB40D8]];
  }
  v27 = [(MADVIVisualSearchRequest *)self->_request imageURL];

  v28 = (void *)MEMORY[0x1E4FB40C8];
  if (v27) {
    [v5 setObject:@"<redacted>" forKeyedSubscript:*MEMORY[0x1E4FB40C8]];
  }
  v29 = [(MADVIVisualSearchRequest *)self->_request referralURL];

  v30 = (void *)MEMORY[0x1E4FB40E8];
  if (v29) {
    [v5 setObject:@"<redacted>" forKeyedSubscript:*MEMORY[0x1E4FB40E8]];
  }
  v31 = [(MADVIVisualSearchRequest *)self->_request engagementSuggestionType];

  if (v31)
  {
    v32 = [(MADVIVisualSearchRequest *)self->_request engagementSuggestionType];
    [v5 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4FB40B0]];
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v33 = VCPLogInstance();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v5;
      _os_log_impl(&dword_1BBEDA000, v33, OS_LOG_TYPE_DEBUG, "Query context: %@", buf, 0xCu);
    }
  }
  v34 = [(MADVIVisualSearchRequest *)self->_request imageURL];
  BOOL v35 = v34 == 0;

  if (!v35)
  {
    v36 = [(MADVIVisualSearchRequest *)self->_request imageURL];
    [v5 setObject:v36 forKeyedSubscript:*v28];
  }
  v37 = [(MADVIVisualSearchRequest *)self->_request referralURL];
  BOOL v38 = v37 == 0;

  if (!v38)
  {
    v39 = [(MADVIVisualSearchRequest *)self->_request referralURL];
    [v5 setObject:v39 forKeyedSubscript:*v30];
  }
  id v44 = 0;
  v40 = [MEMORY[0x1E4FB4040] contextWithDictionary:v5 error:&v44];
  id v41 = v44;
  id v42 = v44;
  if (a3) {
    objc_storeStrong(a3, v41);
  }

  return v40;
}

- (void)storeResults:(id)a3
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v61 = a3;
  v65 = [MEMORY[0x1E4F1CA48] array];
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id obj = [v61 regionOfInterestResults];
  uint64_t v60 = [obj countByEnumeratingWithState:&v87 objects:v94 count:16];
  if (v60)
  {
    uint64_t v62 = *(void *)v88;
    do
    {
      for (uint64_t i = 0; i != v60; ++i)
      {
        if (*(void *)v88 != v62) {
          objc_enumerationMutation(obj);
        }
        v3 = *(void **)(*((void *)&v87 + 1) + 8 * i);
        v72 = [MEMORY[0x1E4F1CA48] array];
        long long v85 = 0u;
        long long v86 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        v63 = v3;
        id v67 = [v3 resultItems];
        uint64_t v69 = [v67 countByEnumeratingWithState:&v83 objects:v93 count:16];
        if (v69)
        {
          uint64_t v68 = *(void *)v84;
          do
          {
            for (uint64_t j = 0; j != v69; ++j)
            {
              if (*(void *)v84 != v68) {
                objc_enumerationMutation(v67);
              }
              v4 = *(void **)(*((void *)&v83 + 1) + 8 * j);
              v5 = [MEMORY[0x1E4F1CA60] dictionary];
              long long v81 = 0u;
              long long v82 = 0u;
              long long v79 = 0u;
              long long v80 = 0u;
              v6 = [v4 objectKnowledge];
              v7 = [v6 knowledgeProperties];

              uint64_t v8 = [v7 countByEnumeratingWithState:&v79 objects:v92 count:16];
              if (v8)
              {
                uint64_t v9 = *(void *)v80;
                do
                {
                  for (uint64_t k = 0; k != v8; ++k)
                  {
                    if (*(void *)v80 != v9) {
                      objc_enumerationMutation(v7);
                    }
                    id v11 = *(void **)(*((void *)&v79 + 1) + 8 * k);
                    v12 = [v11 value];
                    v13 = [v11 name];
                    [v5 setObject:v12 forKeyedSubscript:v13];
                  }
                  uint64_t v8 = [v7 countByEnumeratingWithState:&v79 objects:v92 count:16];
                }
                while (v8);
              }

              id v14 = [v4 objectKnowledge];
              v15 = [v14 knowledgeGraphID];
              if (v15) {
                [v4 objectKnowledge];
              }
              else {
              v16 = [v4 ontologyNode];
              }
              v77 = [v16 knowledgeGraphID];

              objc_super v17 = [v4 thirdPartyObject];
              BOOL v18 = v17 == 0;

              if (v18)
              {
                v29 = 0;
              }
              else
              {
                id v19 = objc_alloc(MEMORY[0x1E4F74758]);
                v75 = [v4 thirdPartyObject];
                uint64_t v20 = [v75 objectIdentifier];
                v21 = [v4 thirdPartyObject];
                uint64_t v22 = [v21 imageURL];
                v23 = [v4 thirdPartyObject];
                v24 = [v23 thumbnailURL];
                v25 = [v4 thirdPartyObject];
                v26 = [v25 metadata];
                v27 = v19;
                v28 = (void *)v20;
                v29 = (void *)[v27 initWithObjectIdentifier:v20 imageURL:v22 thumbnailURL:v24 metadata:v26];
              }
              id v30 = objc_alloc(MEMORY[0x1E4F74738]);
              v74 = [v4 domain];
              v70 = [v4 objectKnowledge];
              v73 = [v70 title];
              v71 = [v4 objectKnowledge];
              v76 = [v71 thumbnailURL];
              v31 = [v4 objectKnowledge];
              [v31 thumbnailAspectRatio];
              int v33 = v32;
              v34 = [v4 objectKnowledge];
              BOOL v35 = [v34 shortDescription];
              v36 = [v4 objectKnowledge];
              v37 = [v36 detailedDescription];
              BOOL v38 = [v4 objectKnowledge];
              v39 = [v38 webURL];
              LODWORD(v40) = v33;
              id v41 = (void *)[v30 initWithDomain:v74 knowledgeGraphID:v77 title:v73 thumbnailURL:v76 thumbnailAspectRatio:v35 shortDescription:v37 detailedDescription:v40 webURL:v39 knowledgeProperties:v5];
              [v72 addObject:v41];

              id v42 = [v72 lastObject];
              [v42 setThirdPartyObject:v29];
            }
            uint64_t v69 = [v67 countByEnumeratingWithState:&v83 objects:v93 count:16];
          }
          while (v69);
        }

        id v43 = objc_alloc(MEMORY[0x1E4F74750]);
        [v63 normalizedBoundingBox];
        double v45 = v44;
        double v47 = v46;
        double v49 = v48;
        double v51 = v50;
        v52 = [v63 searchSections];
        v53 = objc_msgSend(v43, "initWithNormalizedBoundingBox:regionAttributes:andSearchSections:", v72, v52, v45, v47, v49, v51);
        [v65 addObject:v53];
      }
      uint64_t v60 = [obj countByEnumeratingWithState:&v87 objects:v94 count:16];
    }
    while (v60);
  }

  request = self->_request;
  id v55 = objc_alloc(MEMORY[0x1E4F74748]);
  v56 = [v61 userFeedbackPayload];
  v57 = (void *)[v55 initWithResultItems:v65 andUserFeedbackPayload:v56];
  v91 = v57;
  v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v91 count:1];
  [(MADVIVisualSearchRequest *)request setResults:v58];
}

- (int)run
{
  v39[1] = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_INFO, "VCPMADVIVisualSearchTask running...", buf, 2u);
    }
  }
  BOOL v35 = 0;
  int v34 = 0;
  if ([(VCPMADServiceImageAsset *)self->_imageAsset loadPixelBuffer:&v35 orientation:&v34])
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v4 = VCPLogInstance();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "VCPMADVIVisualSearchTask image loading failed", buf, 2u);
      }
    }
    request = self->_request;
    v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v38 = *MEMORY[0x1E4F28568];
    id v7 = [NSString stringWithFormat:@"Image loading failed"];
    v39[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
    uint64_t v9 = [v6 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v8];
    [(MADVIVisualSearchRequest *)request setError:v9];

    int v10 = 0;
  }
  else
  {
    id v11 = +[VCPMADVIVisualSearchResource sharedResource];
    v12 = +[VCPMADResourceManager sharedManager];
    uint64_t v8 = [v12 activateResource:v11];

    *(void *)buf = 0;
    v31 = buf;
    uint64_t v32 = 0x2020000000;
    int v33 = 0;
    dispatch_group_t v13 = dispatch_group_create();
    cancelQueue = self->_cancelQueue;
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3321888768;
    uint64_t v22 = __31__VCPMADVIVisualSearchTask_run__block_invoke;
    v23 = &unk_1F159F0B8;
    v24 = self;
    v27 = buf;
    v15 = v13;
    v25 = v15;
    v28 = v35;
    if (v35) {
      CFRetain(v35);
    }
    int v29 = v34;
    id v7 = v11;
    id v26 = v7;
    dispatch_sync(cancelQueue, &v20);
    dispatch_group_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    v16 = objc_msgSend(v7, "service", v20, v21, v22, v23, v24);
    [v16 clearCacheWithOption:16];

    [v8 reset];
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      objc_super v17 = VCPLogInstance();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v18 = *((_DWORD *)v31 + 6);
        *(_DWORD *)v36 = 67109120;
        int v37 = v18;
        _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_INFO, "VCPMADVIVisualSearchTask complete (%d)", v36, 8u);
      }
    }
    int v10 = *((_DWORD *)v31 + 6);

    CF<opaqueCMSampleBuffer *>::~CF(&v28);
    _Block_object_dispose(buf, 8);
  }

  CF<opaqueCMSampleBuffer *>::~CF(&v35);
  return v10;
}

void __31__VCPMADVIVisualSearchTask_run__block_invoke(uint64_t a1)
{
  v85[1] = *MEMORY[0x1E4F143B8];
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 48));
  if (v2)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = -128;
  }
  else
  {
    id v74 = 0;
    v56 = [*(id *)(a1 + 32) createQueryContextWithError:&v74];
    uint64_t v57 = a1;
    if (v56)
    {
      v3 = [*(id *)(*(void *)(a1 + 32) + 8) documentObservations];
      BOOL v4 = v3 == 0;

      if (!v4)
      {
        uint64_t v5 = v57;
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          v6 = VCPLogInstance();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_INFO, "[VisualSearch] Using client provided OCR results", (uint8_t *)&buf, 2u);
          }

          uint64_t v5 = v57;
        }
        id v7 = [*(id *)(*(void *)(v5 + 32) + 8) documentObservations];
        [*(id *)(*(void *)(v5 + 32) + 16) setDocumentObservations:v7];
      }
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v80 = 0x3032000000;
      long long v81 = __Block_byref_object_copy__34;
      long long v82 = __Block_byref_object_dispose__34;
      long long v83 = objc_alloc_init(VCPTimeMeasurement);
      [*(id *)(*((void *)&buf + 1) + 40) start];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __31__VCPMADVIVisualSearchTask_run__block_invoke_253;
      aBlock[3] = &unk_1E629B350;
      uint64_t v8 = *(void *)(v57 + 32);
      p_long long buf = &buf;
      aBlock[4] = v8;
      uint64_t v73 = *(void *)(v57 + 56);
      id v71 = *(id *)(v57 + 40);
      id v55 = _Block_copy(aBlock);
      dispatch_group_enter(*(dispatch_group_t *)(v57 + 40));
      uint64_t v9 = [*(id *)(*(void *)(v57 + 32) + 8) gatingResultItems];
      BOOL v10 = [v9 count] == 0;

      if (v10)
      {
        v59 = objc_msgSend(*(id *)(*(void *)(v57 + 32) + 16), "vcp_annotationWithTypes:", 15);
        int v29 = objc_msgSend(MEMORY[0x1E4FB4098], "queryWithPixelBuffer:orientation:normalizedRegionOfInterest:annotation:queryContext:", *(void *)(v57 + 64), *(unsigned int *)(v57 + 72), 0.0, 0.0, 1.0, 1.0);
        double v47 = VCPSignPostLog();
        os_signpost_id_t v48 = os_signpost_id_generate(v47);

        double v49 = VCPSignPostLog();
        double v50 = v49;
        if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
        {
          uint64_t v51 = *(void *)(*(void *)(v57 + 32) + 24);
          *(_DWORD *)v75 = 138412290;
          uint64_t v76 = v51;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v50, OS_SIGNPOST_INTERVAL_BEGIN, v48, "VIService_VisualSearch", "%@", v75, 0xCu);
        }

        BOOL v35 = [*(id *)(v57 + 48) service];
        v36 = v60;
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __31__VCPMADVIVisualSearchTask_run__block_invoke_260;
        v60[3] = &unk_1E629B378;
        uint64_t v37 = v57;
        uint64_t v52 = *(void *)(v57 + 32);
        v60[6] = v48;
        v60[7] = 0;
        v60[4] = v52;
        v60[5] = v55;
        uint64_t v39 = [v35 searchWithVisualQuery:v29 completion:v60];
      }
      else
      {
        v59 = [MEMORY[0x1E4F1CA48] array];
        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id v11 = [*(id *)(*(void *)(v57 + 32) + 8) gatingResultItems];
        id obj = v11;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v66 objects:v78 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v67;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v67 != v13) {
                objc_enumerationMutation(obj);
              }
              v15 = *(void **)(*((void *)&v66 + 1) + 8 * i);
              v16 = [MEMORY[0x1E4F1CA48] array];
              long long v64 = 0u;
              long long v65 = 0u;
              long long v62 = 0u;
              long long v63 = 0u;
              objc_super v17 = [v15 domains];
              uint64_t v18 = [v17 countByEnumeratingWithState:&v62 objects:v77 count:16];
              if (v18)
              {
                uint64_t v19 = *(void *)v63;
                do
                {
                  for (uint64_t j = 0; j != v18; ++j)
                  {
                    if (*(void *)v63 != v19) {
                      objc_enumerationMutation(v17);
                    }
                    uint64_t v21 = [*(id *)(*((void *)&v62 + 1) + 8 * j) domain];
                    [v16 addObject:v21];
                  }
                  uint64_t v18 = [v17 countByEnumeratingWithState:&v62 objects:v77 count:16];
                }
                while (v18);
              }

              id v22 = objc_alloc(MEMORY[0x1E4FB4028]);
              [v15 normalizedBoundingBox];
              v23 = objc_msgSend(v22, "initWithRegionOfInterest:domains:", v16);
              [v59 addObject:v23];
            }
            id v11 = obj;
            uint64_t v12 = [obj countByEnumeratingWithState:&v66 objects:v78 count:16];
          }
          while (v12);
        }

        v24 = (void *)MEMORY[0x1E4FB4038];
        uint64_t v25 = *(void *)(v57 + 64);
        uint64_t v26 = *(unsigned int *)(v57 + 72);
        v27 = objc_msgSend(*(id *)(*(void *)(v57 + 32) + 16), "vcp_textAnnotation");
        v28 = [*(id *)(*(void *)(v57 + 32) + 8) gatingPayload];
        int v29 = [v24 queryWithPixelBuffer:v25 orientation:v26 imageRegions:v59 textBlockAnnotation:v27 queryContext:v56 payload:v28];

        id v30 = VCPSignPostLog();
        os_signpost_id_t v31 = os_signpost_id_generate(v30);

        uint64_t v32 = VCPSignPostLog();
        int v33 = v32;
        if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
        {
          uint64_t v34 = *(void *)(*(void *)(v57 + 32) + 24);
          *(_DWORD *)v75 = 138412290;
          uint64_t v76 = v34;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v33, OS_SIGNPOST_INTERVAL_BEGIN, v31, "VIService_ParsedVisualSearch", "%@", v75, 0xCu);
        }

        BOOL v35 = [*(id *)(v57 + 48) service];
        v36 = v61;
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = __31__VCPMADVIVisualSearchTask_run__block_invoke_257;
        v61[3] = &unk_1E629B378;
        uint64_t v37 = v57;
        uint64_t v38 = *(void *)(v57 + 32);
        v61[6] = v31;
        v61[7] = 0;
        v61[4] = v38;
        v61[5] = v55;
        uint64_t v39 = [v35 searchWithParsedVisualQuery:v29 completion:v61];
      }
      uint64_t v53 = *(void *)(v37 + 32);
      v54 = *(void **)(v53 + 56);
      *(void *)(v53 + 56) = v39;

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        double v40 = VCPLogInstance();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          id v41 = [v74 description];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v41;
          _os_log_impl(&dword_1BBEDA000, v40, OS_LOG_TYPE_ERROR, "VCPMADVIVisualSearchTask failed to create visual search query context (%@)", (uint8_t *)&buf, 0xCu);
        }
      }
      id v42 = *(void **)(*(void *)(a1 + 32) + 8);
      id v43 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v84 = *MEMORY[0x1E4F28568];
      double v44 = [NSString stringWithFormat:@"Failed to create visual search query context"];
      v85[0] = v44;
      double v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:&v84 count:1];
      double v46 = [v43 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v45];
      [v42 setError:v46];
    }
  }
}

void __31__VCPMADVIVisualSearchTask_run__block_invoke_253(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) stop];
  v6 = *(unsigned __int8 **)(a1 + 32);
  if (v5)
  {
    unsigned __int8 v7 = atomic_load(v6 + 48);
    if (v7) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = -128;
    }
    else {
      [*(id *)(*(void *)(a1 + 32) + 8) setError:v5];
    }
  }
  else
  {
    [v6 storeResults:v11];
    uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 8) results];
    uint64_t v9 = [v8 firstObject];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) elapsedTimeSeconds];
    [v9 setExecutionNanoseconds:(unint64_t)(v10 * 1000000000.0)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __31__VCPMADVIVisualSearchTask_run__block_invoke_257(void *a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unsigned __int8 v7 = VCPSignPostLog();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    uint64_t v10 = *(void *)(a1[4] + 24);
    int v11 = 138412290;
    uint64_t v12 = v10;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v8, OS_SIGNPOST_INTERVAL_END, v9, "VIService_ParsedVisualSearch", "%@", (uint8_t *)&v11, 0xCu);
  }

  if (a1[7])
  {
    mach_absolute_time();
    VCPPerformance_LogMeasurement();
  }
  (*(void (**)(void))(a1[5] + 16))();
}

void __31__VCPMADVIVisualSearchTask_run__block_invoke_260(void *a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unsigned __int8 v7 = VCPSignPostLog();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    uint64_t v10 = *(void *)(a1[4] + 24);
    int v11 = 138412290;
    uint64_t v12 = v10;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v8, OS_SIGNPOST_INTERVAL_END, v9, "VIService_VisualSearch", "%@", (uint8_t *)&v11, 0xCu);
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