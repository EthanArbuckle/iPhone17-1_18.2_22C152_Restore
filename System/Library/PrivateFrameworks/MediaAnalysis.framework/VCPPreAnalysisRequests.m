@interface VCPPreAnalysisRequests
+ (BOOL)includeCN;
+ (BOOL)includeDMF;
+ (BOOL)includeDO;
+ (BOOL)includeDocument;
+ (BOOL)includeIVS;
+ (BOOL)includeJunk;
+ (BOOL)includeLM;
+ (BOOL)includeMeme;
+ (BOOL)includeNSFW;
+ (BOOL)includePA;
+ (BOOL)includeRotation;
+ (BOOL)includeSDG;
+ (BOOL)includeSE;
+ (BOOL)includeSO;
+ (BOOL)includeWP;
+ (BOOL)isDimensionUnknown:(id)a3;
+ (id)_cachedRequestIdealDimension;
+ (unint64_t)sharpnessRevision;
+ (void)asyncCacheRequestIdealDimension;
+ (void)asyncLoadSharedPhotoFormatsObjects;
- (VN1JC7R3k4455fKQz0dY1VhQ)adjustmentsRequest;
- (VN5kJNH3eYuyaLxNpZr5Z7zi)semanticRequest;
- (VN6Mb1ME89lyW3HpahkEygIG)tabooRequest;
- (VNClassifyCityNatureImageRequest)cityNatureRequest;
- (VNClassifyImageAestheticsRequest)aestheticsRequest;
- (VNClassifyImageRequest)classifyImageRequest;
- (VNClassifyJunkImageRequest)junkImageRequest;
- (VNClassifyMemeImageRequest)memeRequest;
- (VNClassifyPotentialLandmarkRequest)landmarkRequest;
- (VNCreateImageFingerprintsRequest)imagefingerprintsRequest;
- (VNCreateSceneprintRequest)sceneprintRawRequest;
- (VNCreateSceneprintRequest)sceneprintRequest;
- (VNGenerateAttentionBasedSaliencyImageRequest)saliencyRequest;
- (VNGenerateObjectnessBasedSaliencyImageRequest)saliencyObjectnessRequest;
- (VNRecognizeDocumentElementsRequest)documentRequest;
- (VNRecognizeObjectsRequest)objectRequest;
- (VNSceneClassificationRequest)classificationRequest;
- (VNVYvzEtX1JlUdu8xx5qhDI)nsfwRequest;
- (id)gatherAvailableRequests;
- (id)mapAvailableRequestsToResolution;
- (void)setAdjustmentsRequest:(id)a3;
- (void)setAestheticsRequest:(id)a3;
- (void)setCityNatureRequest:(id)a3;
- (void)setClassificationRequest:(id)a3;
- (void)setClassifyImageRequest:(id)a3;
- (void)setDocumentRequest:(id)a3;
- (void)setImagefingerprintsRequest:(id)a3;
- (void)setJunkImageRequest:(id)a3;
- (void)setLandmarkRequest:(id)a3;
- (void)setMemeRequest:(id)a3;
- (void)setNsfwRequest:(id)a3;
- (void)setObjectRequest:(id)a3;
- (void)setSaliencyObjectnessRequest:(id)a3;
- (void)setSaliencyRequest:(id)a3;
- (void)setSceneprintRawRequest:(id)a3;
- (void)setSceneprintRequest:(id)a3;
- (void)setSemanticRequest:(id)a3;
- (void)setTabooRequest:(id)a3;
@end

@implementation VCPPreAnalysisRequests

+ (BOOL)includeNSFW
{
  return 1;
}

+ (BOOL)includeLM
{
  return 1;
}

+ (BOOL)includeSE
{
  return 1;
}

+ (BOOL)includeSDG
{
  return 1;
}

+ (BOOL)includeWP
{
  return 1;
}

+ (BOOL)includeDO
{
  return 1;
}

+ (BOOL)includeSO
{
  return 1;
}

+ (BOOL)includeMeme
{
  return 1;
}

+ (BOOL)includeRotation
{
  return 1;
}

+ (BOOL)includeDocument
{
  return 1;
}

+ (BOOL)includeIVS
{
  return 1;
}

+ (BOOL)includePA
{
  return 1;
}

+ (BOOL)includeCN
{
  return 1;
}

+ (BOOL)includeJunk
{
  return 1;
}

+ (BOOL)includeDMF
{
  return 1;
}

+ (unint64_t)sharpnessRevision
{
  v2 = &OBJC_METACLASS___VCPPhotoAnalyzer;
  {
    v2 = &OBJC_METACLASS___VCPPhotoAnalyzer;
    if (v4)
    {
      +[VCPPreAnalysisRequests sharpnessRevision]::revision = 2;
      v2 = &OBJC_METACLASS___VCPPhotoAnalyzer;
    }
  }
  return (unint64_t)v2[68].cache;
}

+ (BOOL)isDimensionUnknown:(id)a3
{
  return [a3 isEqualToValue:&unk_1F15EB6D0];
}

- (id)gatherAvailableRequests
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  int v4 = v3;
  if (self->_aestheticsRequest) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_classificationRequest) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_sceneprintRequest) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_saliencyRequest) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_junkImageRequest) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_objectRequest) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_saliencyObjectnessRequest) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_landmarkRequest) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_nsfwRequest) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_tabooRequest) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_semanticRequest) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_sceneprintRawRequest) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_memeRequest) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_adjustmentsRequest) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_documentRequest) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_cityNatureRequest) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_imagefingerprintsRequest) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_classifyImageRequest) {
    objc_msgSend(v4, "addObject:");
  }
  return v4;
}

+ (id)_cachedRequestIdealDimension
{
  if (+[VCPPreAnalysisRequests _cachedRequestIdealDimension]::once != -1) {
    dispatch_once(&+[VCPPreAnalysisRequests _cachedRequestIdealDimension]::once, &__block_literal_global_17);
  }
  v2 = (void *)+[VCPPreAnalysisRequests _cachedRequestIdealDimension]::cachedRequestIdealDimension;
  return v2;
}

void __54__VCPPreAnalysisRequests__cachedRequestIdealDimension__block_invoke()
{
  v66[15] = *MEMORY[0x1E4F143B8];
  v65[0] = objc_opt_class();
  v65[1] = &unk_1F15EB6E8;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:2];
  v66[0] = v30;
  v64[0] = objc_opt_class();
  v64[1] = &unk_1F15EB700;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:2];
  v66[1] = v37;
  v63[0] = objc_opt_class();
  v63[1] = &unk_1F15EB718;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:2];
  v66[2] = v35;
  v62[0] = objc_opt_class();
  v62[1] = &unk_1F15EB6E8;
  type = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:2];
  v66[3] = type;
  v61[0] = objc_opt_class();
  v61[1] = &unk_1F15EB730;
  id obja = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
  v66[4] = obja;
  v60[0] = objc_opt_class();
  v60[1] = &unk_1F15EB6E8;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2];
  v66[5] = v31;
  v59[0] = objc_opt_class();
  v59[1] = &unk_1F15EB748;
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
  v66[6] = v0;
  v58[0] = objc_opt_class();
  v58[1] = &unk_1F15EB760;
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:2];
  v66[7] = v1;
  v57[0] = objc_opt_class();
  v57[1] = &unk_1F15EB6E8;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
  v66[8] = v2;
  v56[0] = objc_opt_class();
  v56[1] = &unk_1F15EB778;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
  v66[9] = v3;
  v55[0] = objc_opt_class();
  v55[1] = &unk_1F15EB790;
  int v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
  v66[10] = v4;
  v54[0] = objc_opt_class();
  v54[1] = &unk_1F15EB7A8;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
  v66[11] = v5;
  v53[0] = objc_opt_class();
  v53[1] = &unk_1F15EB760;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
  v66[12] = v6;
  v52[0] = objc_opt_class();
  v52[1] = &unk_1F15EB790;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
  v66[13] = v7;
  v51[0] = objc_opt_class();
  v51[1] = &unk_1F15EB6E8;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
  v66[14] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:15];

  id v10 = v9;
  v38 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v10;
  uint64_t v11 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v11)
  {
    v12 = 0;
    uint64_t v36 = *(void *)v41;
    while (1)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v41 != v36) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v15 = (objc_class *)(id)[v14 objectAtIndexedSubscript:0];
        v16 = [v14 objectAtIndexedSubscript:1];
        unsigned int v17 = [v16 unsignedIntValue];

        id v18 = objc_alloc_init(v15);
        uint64_t v19 = v17;
        id v39 = v12;
        int v20 = [v18 setRevision:v17 error:&v39];
        id v21 = v39;

        v12 = v21;
        if (!v20)
        {
          v22 = &unk_1F15EB6D0;
          if ((int)MediaAnalysisLogLevel() < 3) {
            goto LABEL_16;
          }
          v23 = VCPLogInstance();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v45 = v15;
            __int16 v46 = 2048;
            uint64_t v47 = v19;
            __int16 v48 = 2112;
            v49 = v12;
            v24 = v23;
            v25 = "Failed to set %@::setRevision %lu: %@";
            uint32_t v26 = 32;
LABEL_14:
            _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_ERROR, v25, buf, v26);
          }
LABEL_15:

          v22 = &unk_1F15EB6D0;
          goto LABEL_16;
        }
        v22 = objc_msgSend(v18, "vcp_idealDimension");
        if (!v22)
        {
          v22 = &unk_1F15EB6D0;
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v23 = VCPLogInstance();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v45 = v15;
              __int16 v46 = 2048;
              uint64_t v47 = v19;
              v24 = v23;
              v25 = "Failed to get the ideal size of request %@ with revision %lu";
              uint32_t v26 = 22;
              goto LABEL_14;
            }
            goto LABEL_15;
          }
        }
LABEL_16:
        [v38 setObject:v22 forKeyedSubscript:v14];
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          v27 = VCPLogInstance();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            v45 = v15;
            __int16 v46 = 2048;
            uint64_t v47 = v19;
            __int16 v48 = 2112;
            v49 = v22;
            _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_DEBUG, "Request %@ (revision %lu) ideal size %@", buf, 0x20u);
          }
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
      if (!v11) {
        goto LABEL_24;
      }
    }
  }
  v12 = 0;
LABEL_24:

  v28 = (void *)+[VCPPreAnalysisRequests _cachedRequestIdealDimension]::cachedRequestIdealDimension;
  +[VCPPreAnalysisRequests _cachedRequestIdealDimension]::cachedRequestIdealDimension = (uint64_t)v38;
  id v29 = v38;
}

- (id)mapAvailableRequestsToResolution
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v19 = [(VCPPreAnalysisRequests *)self gatherAvailableRequests];
  int v4 = [(id)objc_opt_class() _cachedRequestIdealDimension];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v19;
  uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v27[0] = objc_opt_class();
        v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "revision"));
        v27[1] = v9;
        id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];

        uint64_t v11 = [v4 objectForKeyedSubscript:v10];
        if (!v11)
        {
          uint64_t v11 = &unk_1F15EB6D0;
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v12 = VCPLogInstance();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              v13 = [v8 description];
              *(_DWORD *)buf = 138412290;
              uint32_t v26 = v13;
              _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_ERROR, "Ideal size for request %@ not cached", buf, 0xCu);
            }
            uint64_t v11 = &unk_1F15EB6D0;
          }
        }
        v14 = [v3 objectForKeyedSubscript:v11];
        BOOL v15 = v14 == 0;

        if (v15)
        {
          v16 = [MEMORY[0x1E4F1CA48] array];
          [v3 setObject:v16 forKeyedSubscript:v11];
        }
        unsigned int v17 = [v3 objectForKeyedSubscript:v11];
        [v17 addObject:v8];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v28 count:16];
    }
    while (v5);
  }

  return v3;
}

+ (void)asyncCacheRequestIdealDimension
{
  v3 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__VCPPreAnalysisRequests_asyncCacheRequestIdealDimension__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(v3, block);
}

void __57__VCPPreAnalysisRequests_asyncCacheRequestIdealDimension__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = mach_absolute_time();
  v3 = VCPSignPostLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v5 = VCPSignPostLog();
  uint64_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "VCPPreAnalysisRequests_CacheRequestIdealDimension", "", (uint8_t *)&v13, 2u);
  }

  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_DEBUG, "[PreAnalysis] Caching Vision request input resolutions ... ", (uint8_t *)&v13, 2u);
    }
  }
  v8 = [*(id *)(a1 + 32) _cachedRequestIdealDimension];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = [v8 count];
      int v13 = 134217984;
      uint64_t v14 = v10;
      _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_DEBUG, "[PreAnalysis] Cached %lu request", (uint8_t *)&v13, 0xCu);
    }
  }
  uint64_t v11 = VCPSignPostLog();
  v12 = v11;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v12, OS_SIGNPOST_INTERVAL_END, v4, "VCPPreAnalysisRequests_CacheRequestIdealDimension", "", (uint8_t *)&v13, 2u);
  }

  if (v2)
  {
    mach_absolute_time();
    VCPPerformance_LogMeasurement();
  }
}

+ (void)asyncLoadSharedPhotoFormatsObjects
{
  uint64_t v2 = dispatch_get_global_queue(0, 0);
  dispatch_async(v2, &__block_literal_global_306);
}

void __60__VCPPreAnalysisRequests_asyncLoadSharedPhotoFormatsObjects__block_invoke()
{
  v26[1] = *MEMORY[0x1E4F143B8];
  uint64_t v21 = mach_absolute_time();
  v0 = VCPSignPostLog();
  os_signpost_id_t v1 = os_signpost_id_generate(v0);

  uint64_t v2 = VCPSignPostLog();
  v3 = v2;
  if (v1 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v1, "VCPPreAnalysisRequests_LoadPFSceneObjects", "", buf, 2u);
  }

  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    os_signpost_id_t v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEBUG, "[PreAnalysis] Initializing PFSceneObjects ... ", buf, 2u);
    }
  }
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F8CD58], "vcp_sharedTaxonomy");
  if (!v5)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v11 = VCPLogInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v16 = "[PreAnalysis] Failed to initialize PFSceneTaxonomy";
LABEL_20:
        _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, v16, buf, 2u);
      }
LABEL_21:
      uint64_t v6 = 0;
LABEL_22:
      v8 = 0;
LABEL_23:

      goto LABEL_24;
    }
LABEL_25:
    unsigned int v17 = 0;
    id v18 = 0;
    goto LABEL_26;
  }
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F8CD50], "vcp_sharedSceneGeography");
  if (!v6)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v11 = VCPLogInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v16 = "[PreAnalysis] Failed to initialize PFSceneGeography";
        goto LABEL_20;
      }
      goto LABEL_21;
    }
    goto LABEL_25;
  }
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F39288], "vcp_instanceWithExtendedSceneIdentifier:confidence:", 1472, 0.001);
  v8 = (void *)v7;
  if (!v7)
  {
    if ((int)MediaAnalysisLogLevel() < 3)
    {
      id v18 = 0;
      unsigned int v17 = (void *)v6;
      goto LABEL_26;
    }
    uint64_t v11 = VCPLogInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "[PreAnalysis] Failed to create scene classification", buf, 2u);
    }
    goto LABEL_22;
  }
  v9 = (void *)MEMORY[0x1E4F8E7B0];
  v26[0] = v7;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  [v9 assetIconicScoreForSceneClassifications:v10 assetLatitude:v6 assetLongitude:v5 sceneGeography:45.5787 sceneTaxonomy:-122.1177];

  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    uint64_t v11 = VCPLogInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = (objc_class *)objc_opt_class();
      uint64_t v15 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138412546;
      id v23 = v13;
      __int16 v24 = 2112;
      v25 = v15;
      _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_DEBUG, "[PreAnalysis] Initialized %@ and %@", buf, 0x16u);
    }
    goto LABEL_23;
  }
LABEL_24:
  unsigned int v17 = (void *)v6;
  id v18 = v8;
LABEL_26:
  uint64_t v19 = VCPSignPostLog();
  int v20 = v19;
  if (v1 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v20, OS_SIGNPOST_INTERVAL_END, v1, "VCPPreAnalysisRequests_LoadPFSceneObjects", "", buf, 2u);
  }

  if (v21)
  {
    mach_absolute_time();
    VCPPerformance_LogMeasurement();
  }
}

- (VNClassifyImageAestheticsRequest)aestheticsRequest
{
  return self->_aestheticsRequest;
}

- (void)setAestheticsRequest:(id)a3
{
}

- (VNSceneClassificationRequest)classificationRequest
{
  return self->_classificationRequest;
}

- (void)setClassificationRequest:(id)a3
{
}

- (VNCreateSceneprintRequest)sceneprintRequest
{
  return self->_sceneprintRequest;
}

- (void)setSceneprintRequest:(id)a3
{
}

- (VNGenerateAttentionBasedSaliencyImageRequest)saliencyRequest
{
  return self->_saliencyRequest;
}

- (void)setSaliencyRequest:(id)a3
{
}

- (VNClassifyJunkImageRequest)junkImageRequest
{
  return self->_junkImageRequest;
}

- (void)setJunkImageRequest:(id)a3
{
}

- (VNRecognizeObjectsRequest)objectRequest
{
  return self->_objectRequest;
}

- (void)setObjectRequest:(id)a3
{
}

- (VNGenerateObjectnessBasedSaliencyImageRequest)saliencyObjectnessRequest
{
  return self->_saliencyObjectnessRequest;
}

- (void)setSaliencyObjectnessRequest:(id)a3
{
}

- (VNClassifyPotentialLandmarkRequest)landmarkRequest
{
  return self->_landmarkRequest;
}

- (void)setLandmarkRequest:(id)a3
{
}

- (VNVYvzEtX1JlUdu8xx5qhDI)nsfwRequest
{
  return self->_nsfwRequest;
}

- (void)setNsfwRequest:(id)a3
{
}

- (VN6Mb1ME89lyW3HpahkEygIG)tabooRequest
{
  return self->_tabooRequest;
}

- (void)setTabooRequest:(id)a3
{
}

- (VN5kJNH3eYuyaLxNpZr5Z7zi)semanticRequest
{
  return self->_semanticRequest;
}

- (void)setSemanticRequest:(id)a3
{
}

- (VNCreateSceneprintRequest)sceneprintRawRequest
{
  return self->_sceneprintRawRequest;
}

- (void)setSceneprintRawRequest:(id)a3
{
}

- (VNClassifyMemeImageRequest)memeRequest
{
  return self->_memeRequest;
}

- (void)setMemeRequest:(id)a3
{
}

- (VN1JC7R3k4455fKQz0dY1VhQ)adjustmentsRequest
{
  return self->_adjustmentsRequest;
}

- (void)setAdjustmentsRequest:(id)a3
{
}

- (VNRecognizeDocumentElementsRequest)documentRequest
{
  return self->_documentRequest;
}

- (void)setDocumentRequest:(id)a3
{
}

- (VNClassifyCityNatureImageRequest)cityNatureRequest
{
  return self->_cityNatureRequest;
}

- (void)setCityNatureRequest:(id)a3
{
}

- (VNCreateImageFingerprintsRequest)imagefingerprintsRequest
{
  return self->_imagefingerprintsRequest;
}

- (void)setImagefingerprintsRequest:(id)a3
{
}

- (VNClassifyImageRequest)classifyImageRequest
{
  return self->_classifyImageRequest;
}

- (void)setClassifyImageRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classifyImageRequest, 0);
  objc_storeStrong((id *)&self->_imagefingerprintsRequest, 0);
  objc_storeStrong((id *)&self->_cityNatureRequest, 0);
  objc_storeStrong((id *)&self->_documentRequest, 0);
  objc_storeStrong((id *)&self->_adjustmentsRequest, 0);
  objc_storeStrong((id *)&self->_memeRequest, 0);
  objc_storeStrong((id *)&self->_sceneprintRawRequest, 0);
  objc_storeStrong((id *)&self->_semanticRequest, 0);
  objc_storeStrong((id *)&self->_tabooRequest, 0);
  objc_storeStrong((id *)&self->_nsfwRequest, 0);
  objc_storeStrong((id *)&self->_landmarkRequest, 0);
  objc_storeStrong((id *)&self->_saliencyObjectnessRequest, 0);
  objc_storeStrong((id *)&self->_objectRequest, 0);
  objc_storeStrong((id *)&self->_junkImageRequest, 0);
  objc_storeStrong((id *)&self->_saliencyRequest, 0);
  objc_storeStrong((id *)&self->_sceneprintRequest, 0);
  objc_storeStrong((id *)&self->_classificationRequest, 0);
  objc_storeStrong((id *)&self->_aestheticsRequest, 0);
}

@end