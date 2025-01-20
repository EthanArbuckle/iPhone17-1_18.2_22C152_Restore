@interface AXMMediaAnalysisCaptionDetectorNode
+ (BOOL)isSupported;
+ (BOOL)supportsSecureCoding;
+ (id)title;
- (AXMMediaAnalysisCaptionDetectorNode)initWithCoder:(id)a3;
- (AXMMediaAnalysisSceneDetectorNode)sceneDetector;
- (BOOL)requiresVisionFramework;
- (id)_captionsFromAnalysis:(id)a3 forType:(unint64_t)a4;
- (id)_mediaAnalysisCaptionResultForPHAssetsFromAnalysis:(id)a3;
- (id)_mediaAnalysisCaptionResultFromResults:(id)a3;
- (id)translatedTextForCaption:(id)a3 withContext:(id)a4 metrics:(id)a5;
- (void)_addCaptionFeaturesToContext:(id)a3 metrics:(id)a4 fromResult:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)evaluate:(id)a3 metrics:(id)a4;
- (void)setSceneDetector:(id)a3;
@end

@implementation AXMMediaAnalysisCaptionDetectorNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMMediaAnalysisCaptionDetectorNode)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AXMMediaAnalysisCaptionDetectorNode;
  v5 = [(AXMEvaluationNode *)&v8 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sceneDetector"];
    [(AXMMediaAnalysisCaptionDetectorNode *)v5 setSceneDetector:v6];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AXMMediaAnalysisCaptionDetectorNode;
  id v4 = a3;
  [(AXMEvaluationNode *)&v6 encodeWithCoder:v4];
  v5 = [(AXMMediaAnalysisCaptionDetectorNode *)self sceneDetector];
  [v4 encodeObject:v5 forKey:@"sceneDetector"];
}

+ (BOOL)isSupported
{
  if (!AXRuntimeCheck_MediaAnalysisSupport()) {
    return 0;
  }
  v2 = [MEMORY[0x1E4F28F80] processInfo];
  if ((unint64_t)[v2 physicalMemory] < 0x77359400) {
    char v3 = 0;
  }
  else {
    char v3 = AXRuntimeCheck_HasANE();
  }

  return v3;
}

- (BOOL)requiresVisionFramework
{
  return 0;
}

+ (id)title
{
  return @"AXM Media Analysis - Caption Detector Node";
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v78.receiver = self;
  v78.super_class = (Class)AXMMediaAnalysisCaptionDetectorNode;
  id v54 = a4;
  -[AXMEvaluationNode evaluate:metrics:](&v78, sel_evaluate_metrics_, v6);
  v7 = [v6 sourceInput];
  v56 = [v7 phAssetLocalIdentifier];

  objc_super v8 = [v6 sourceInput];
  v57 = [v8 photoLibraryURL];

  v9 = [v6 sourceInput];
  v55 = [v9 ciImage];

  v10 = [v6 sourceInput];
  v53 = [v10 pixelBuffer];

  v11 = AXMediaLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v56;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v57;
    _os_log_impl(&dword_1B57D5000, v11, OS_LOG_TYPE_DEFAULT, "AXM Media analysis: Will evaluate media analysis caption detector node. phAssetLocalIdentifier : %@ and photoLibraryURL : %@", buf, 0x16u);
  }

  if (v57 && v56)
  {
    v12 = +[AXMPhotoAssetData phAssetFromLocalIdentifier:v56 photoLibraryURL:v57];
    if (!v12)
    {
      v50 = AXMediaLogCommon();
      v49 = v50;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
      {
        -[AXMMediaAnalysisCaptionDetectorNode evaluate:metrics:]();
        v49 = v50;
      }
      goto LABEL_38;
    }
    v52 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v79 = 0;
    v80 = &v79;
    uint64_t v81 = 0x2020000000;
    v13 = (void *)getVCPMediaAnalysisService_AllowOnDemandOptionSymbolLoc_ptr;
    uint64_t v82 = getVCPMediaAnalysisService_AllowOnDemandOptionSymbolLoc_ptr;
    if (!getVCPMediaAnalysisService_AllowOnDemandOptionSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getVCPMediaAnalysisService_AllowOnDemandOptionSymbolLoc_block_invoke;
      v87 = &unk_1E6116AD8;
      v88 = &v79;
      v14 = (void *)MediaAnalysisLibrary();
      v15 = dlsym(v14, "VCPMediaAnalysisService_AllowOnDemandOption");
      *(void *)(v88[1] + 24) = v15;
      getVCPMediaAnalysisService_AllowOnDemandOptionSymbolLoc_ptr = *(void *)(v88[1] + 24);
      v13 = (void *)v80[3];
    }
    _Block_object_dispose(&v79, 8);
    if (!v13)
    {
      __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
      __break(1u);
    }
    [v52 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*v13];
    dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
    uint64_t v79 = 0;
    v80 = &v79;
    uint64_t v81 = 0x2050000000;
    v17 = (void *)getVCPMediaAnalysisServiceClass_softClass;
    uint64_t v82 = getVCPMediaAnalysisServiceClass_softClass;
    if (!getVCPMediaAnalysisServiceClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getVCPMediaAnalysisServiceClass_block_invoke;
      v87 = &unk_1E6116AD8;
      v88 = &v79;
      __getVCPMediaAnalysisServiceClass_block_invoke((uint64_t)buf);
      v17 = (void *)v80[3];
    }
    id v18 = v17;
    _Block_object_dispose(&v79, 8);
    v19 = [v18 analysisService];
    objc_initWeak((id *)buf, self);
    v85 = v12;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_67;
    v72[3] = &unk_1E61188A8;
    location = &v77;
    objc_copyWeak(&v77, (id *)buf);
    v12 = v12;
    v73 = v12;
    id v74 = v6;
    id v75 = v54;
    v21 = v16;
    v76 = v21;
    uint64_t v22 = [v19 requestAnalysisTypes:0x100000000 forAssets:v20 withOptions:v52 progressHandler:&__block_literal_global_29 andCompletionHandler:v72];

    dispatch_time_t v23 = dispatch_time(0, 100000000);
    if (dispatch_semaphore_wait(v21, v23))
    {
      unint64_t v24 = 100000000;
      do
      {
        if (v24 > 0x2540BE400)
        {
          v25 = AXMediaLogCommon();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            -[AXMMediaAnalysisCaptionDetectorNode evaluate:metrics:](&v79, (unsigned char *)&v79 + 1);
          }

          objc_msgSend(v19, "cancelRequest:", v22, location);
        }
        dispatch_time_t v26 = dispatch_time(0, 100000000);
        v24 += 100000000;
      }
      while (dispatch_semaphore_wait(v21, v26));
    }

    objc_destroyWeak(location);
    objc_destroyWeak((id *)buf);

LABEL_37:
    v49 = v52;
LABEL_38:

    goto LABEL_39;
  }
  if (v55)
  {
    dispatch_semaphore_t v27 = dispatch_semaphore_create(0);
    id v28 = objc_alloc_init((Class)getMADImageCaptionRequestClass());
    v29 = +[AXMMADSService sharedInstance];
    v30 = [v29 service];

    objc_initWeak((id *)buf, self);
    id v84 = v28;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v84 count:1];
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_73;
    v65[3] = &unk_1E61188D0;
    objc_copyWeak(&v71, (id *)buf);
    v52 = v28;
    v66 = v52;
    id v67 = v55;
    id v68 = v6;
    id v69 = v54;
    v12 = v27;
    v70 = v12;
    uint64_t v32 = [v30 performRequests:v31 onCIImage:v67 withOrientation:1 andIdentifier:&stru_1F0E72D10 completionHandler:v65];

    dispatch_time_t v33 = dispatch_time(0, 100000000);
    if (dispatch_semaphore_wait(v12, v33))
    {
      unint64_t v34 = 100000000;
      do
      {
        if (v34 > 0x2540BE400)
        {
          v35 = AXMediaLogCommon();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            -[AXMMediaAnalysisCaptionDetectorNode evaluate:metrics:].cold.5(&v79, (unsigned char *)&v79 + 1);
          }

          [v30 cancelRequestID:v32];
        }
        dispatch_time_t v36 = dispatch_time(0, 100000000);
        v34 += 100000000;
      }
      while (dispatch_semaphore_wait(v12, v36));
    }

    objc_destroyWeak(&v71);
    objc_destroyWeak((id *)buf);

    goto LABEL_37;
  }
  if (v53)
  {
    dispatch_semaphore_t v37 = dispatch_semaphore_create(0);
    id v38 = objc_alloc_init((Class)getMADImageCaptionRequestClass());
    v39 = +[AXMMADSService sharedInstance];
    v40 = [v39 service];

    objc_initWeak((id *)buf, self);
    id v83 = v38;
    v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
    uint64_t v42 = [v53 pixelBuffer];
    uint64_t v43 = [v53 orientation];
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_75;
    v58[3] = &unk_1E61188D0;
    objc_copyWeak(&v64, (id *)buf);
    v52 = v38;
    v59 = v52;
    id v60 = v53;
    id v61 = v6;
    id v62 = v54;
    v12 = v37;
    v63 = v12;
    uint64_t v44 = [v40 performRequests:v41 onPixelBuffer:v42 withOrientation:v43 andIdentifier:&stru_1F0E72D10 completionHandler:v58];

    dispatch_time_t v45 = dispatch_time(0, 100000000);
    if (dispatch_semaphore_wait(v12, v45))
    {
      unint64_t v46 = 100000000;
      do
      {
        if (v46 > 0x2540BE400)
        {
          v47 = AXMediaLogCommon();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
            -[AXMMediaAnalysisCaptionDetectorNode evaluate:metrics:].cold.4(&v79, (unsigned char *)&v79 + 1);
          }

          [v40 cancelRequestID:v44];
        }
        dispatch_time_t v48 = dispatch_time(0, 100000000);
        v46 += 100000000;
      }
      while (dispatch_semaphore_wait(v12, v48));
    }

    objc_destroyWeak(&v64);
    objc_destroyWeak((id *)buf);

    goto LABEL_37;
  }
LABEL_39:
}

void __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke()
{
  v0 = AXMediaLogCommon();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

void __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_67(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_super v8 = AXMediaLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_67_cold_5();
  }

  if (v6)
  {
    v9 = AXMediaLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_67_cold_4();
    }
  }
  else if (v5)
  {
    v10 = [*(id *)(a1 + 32) localIdentifier];
    v9 = [v5 objectForKeyedSubscript:v10];

    if (v9)
    {
      v11 = [WeakRetained _mediaAnalysisCaptionResultForPHAssetsFromAnalysis:v9];
      if (v11)
      {
        [WeakRetained _addCaptionFeaturesToContext:*(void *)(a1 + 40) metrics:*(void *)(a1 + 48) fromResult:v11];
      }
      else
      {
        v12 = AXMediaLogCommon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_67_cold_3((id *)(a1 + 32));
        }
      }
    }
    else
    {
      v11 = AXMediaLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_67_cold_2((id *)(a1 + 32));
      }
    }
  }
  else
  {
    v9 = AXMediaLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_67_cold_1(a1);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

void __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_73(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v7 = AXMediaLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v11 = [*(id *)(a1 + 32) results];
    v12[0] = 67109634;
    v12[1] = a2;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    dispatch_semaphore_t v16 = v11;
    _os_log_debug_impl(&dword_1B57D5000, v7, OS_LOG_TYPE_DEBUG, "AXM Media analysis: Caption Detection (CIImage) results: requestID: %d error: %@ results: %@", (uint8_t *)v12, 0x1Cu);
  }
  if (v5)
  {
    objc_super v8 = AXMediaLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_73_cold_3();
    }
  }
  else if (a2 == -1)
  {
    objc_super v8 = AXMediaLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_73_cold_1();
    }
  }
  else
  {
    v9 = [*(id *)(a1 + 32) results];
    objc_super v8 = [WeakRetained _mediaAnalysisCaptionResultFromResults:v9];

    if (v8)
    {
      [WeakRetained _addCaptionFeaturesToContext:*(void *)(a1 + 48) metrics:*(void *)(a1 + 56) fromResult:v8];
    }
    else
    {
      v10 = AXMediaLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_73_cold_2();
      }
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
}

void __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_75(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v7 = AXMediaLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v11 = [*(id *)(a1 + 32) results];
    v12[0] = 67109634;
    v12[1] = a2;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    dispatch_semaphore_t v16 = v11;
    _os_log_debug_impl(&dword_1B57D5000, v7, OS_LOG_TYPE_DEBUG, "AXM Media analysis: Caption Detection (PixelBuffer) results: requestID: %d. error: %@ results: %@", (uint8_t *)v12, 0x1Cu);
  }
  if (v5)
  {
    objc_super v8 = AXMediaLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_75_cold_3();
    }
  }
  else if (a2 == -1)
  {
    objc_super v8 = AXMediaLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_75_cold_1();
    }
  }
  else
  {
    v9 = [*(id *)(a1 + 32) results];
    objc_super v8 = [WeakRetained _mediaAnalysisCaptionResultFromResults:v9];

    if (v8)
    {
      [WeakRetained _addCaptionFeaturesToContext:*(void *)(a1 + 48) metrics:*(void *)(a1 + 56) fromResult:v8];
    }
    else
    {
      v10 = AXMediaLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_75_cold_2();
      }
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
}

- (id)translatedTextForCaption:(id)a3 withContext:(id)a4 metrics:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [a4 analysisOptions];
  v11 = [v10 preferredOutputLocale];

  if (!v11)
  {
    v12 = AXMediaLogLanguageTranslation();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B57D5000, v12, OS_LOG_TYPE_INFO, "preferred output language unexpectedly nil! Falling back to english", buf, 2u);
    }

    __int16 v13 = +[AXMLocSupport sharedInstance];
    v11 = objc_msgSend(v13, "en_USLocale");
  }
  id v14 = +[AXMLocSupport sharedInstance];
  int v15 = [v14 localeBaseLanguageIsEnglish:v11];

  if (v15)
  {
    dispatch_semaphore_t v16 = AXMediaLogLanguageTranslation();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_1B57D5000, v16, OS_LOG_TYPE_INFO, "preferred output language is English. Translation not required", v25, 2u);
    }

    uint64_t v17 = +[AXMTranslatedText text:v8 confidence:0 isLowConfidence:v11 targetLocale:1.0];
  }
  else
  {
    languageTranslator = self->_languageTranslator;
    if (!languageTranslator)
    {
      v19 = objc_alloc_init(AXMLanguageTranslator);
      v20 = self->_languageTranslator;
      self->_languageTranslator = v19;

      languageTranslator = self->_languageTranslator;
    }
    id v24 = 0;
    uint64_t v17 = [(AXMLanguageTranslator *)languageTranslator translateText:v8 toLocale:v11 respectAllowList:1 metrics:v9 error:&v24];
    id v21 = v24;
    if (v21)
    {
      uint64_t v22 = AXMediaLogLanguageTranslation();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[AXMMediaAnalysisCaptionDetectorNode translatedTextForCaption:withContext:metrics:]();
      }
    }
  }

  return v17;
}

- (void)_addCaptionFeaturesToContext:(id)a3 metrics:(id)a4 fromResult:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [a5 imageCaptionResults];
  v11 = [v10 firstObject];

  if (v11)
  {
    v12 = [v11 text];
    id v28 = self;
    id v31 = v9;
    uint64_t v13 = [(AXMMediaAnalysisCaptionDetectorNode *)self translatedTextForCaption:v12 withContext:v8 metrics:v9];

    id v14 = [v11 text];
    [v11 confidence];
    v29 = (void *)v13;
    uint64_t v32 = +[AXMVisionFeature featureWithMediaAnalysisImageCaptionResult:confidence:translatedCaption:](AXMVisionFeature, "featureWithMediaAnalysisImageCaptionResult:confidence:translatedCaption:", v14, v13);

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v30 = v11;
    int v15 = [v11 classificationIdentifiers];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      char v18 = 0;
      uint64_t v19 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v34 != v19) {
            objc_enumerationMutation(v15);
          }
          uint64_t v21 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          BOOL v22 = +[AXMMediaAnalysisSceneDetectorNode addSignificantEventResultToContext:v8 forIdentifier:v21 confidence:1 markAsSensitiveCaptionContent:1.0];
          BOOL v23 = +[AXMMediaAnalysisSceneDetectorNode addNSFWResultToContext:v8 forIdentifier:v21 confidence:1 markAsSensitiveCaptionContent:1.0];
          if (v23 || v22) {
            [v32 setCaptionMayContainSensitiveContent:1];
          }
          id v24 = AXMediaLogCommon();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v38 = v21;
            _os_log_impl(&dword_1B57D5000, v24, OS_LOG_TYPE_INFO, "Captioned image did activate classifier: %@", buf, 0xCu);
          }
          v18 |= v23;
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v17);
    }
    else
    {
      char v18 = 0;
    }

    [v8 appendFeature:v32];
    [v8 addEvaluatedFeatureType:25];
    v11 = v30;
    if ([v30 isLowConfidence] & 1) != 0 || (v18)
    {
      v25 = AXMediaLogCommon();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B57D5000, v25, OS_LOG_TYPE_INFO, "Caption was low confidence or explicit. Requesting auxiliary scene detection", buf, 2u);
      }

      id WeakRetained = objc_loadWeakRetained((id *)&v28->_sceneDetector);
      if (WeakRetained)
      {
        dispatch_semaphore_t v27 = objc_loadWeakRetained((id *)&v28->_sceneDetector);
        [v8 addAuxiliaryDetector:v27];
      }
      else
      {
        dispatch_semaphore_t v27 = AXMediaLogCommon();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          -[AXMMediaAnalysisCaptionDetectorNode _addCaptionFeaturesToContext:metrics:fromResult:](v27);
        }
      }
    }
    id v9 = v31;
  }
}

- (id)_mediaAnalysisCaptionResultForPHAssetsFromAnalysis:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(AXMMediaAnalysisCaptionsResult);
  id v6 = [(AXMMediaAnalysisCaptionDetectorNode *)self _captionsFromAnalysis:v4 forType:0];

  if ([v6 count])
  {
    [(AXMMediaAnalysisCaptionsResult *)v5 setImageCaptionResults:v6];
  }
  else
  {
    uint64_t v7 = AXMediaLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[AXMMediaAnalysisCaptionDetectorNode _mediaAnalysisCaptionResultForPHAssetsFromAnalysis:](v7);
    }
  }

  return v5;
}

- (id)_captionsFromAnalysis:(id)a3 forType:(unint64_t)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  id v5 = (id *)getMediaAnalysisResultAttributesKeySymbolLoc_ptr;
  uint64_t v54 = getMediaAnalysisResultAttributesKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultAttributesKeySymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v57 = __getMediaAnalysisResultAttributesKeySymbolLoc_block_invoke;
    v58 = &unk_1E6116AD8;
    v59 = &v51;
    id v6 = (void *)MediaAnalysisLibrary();
    uint64_t v7 = dlsym(v6, "MediaAnalysisResultAttributesKey");
    *(void *)(v59[1] + 24) = v7;
    getMediaAnalysisResultAttributesKeySymbolLoc_ptr = *(void *)(v59[1] + 24);
    id v5 = (id *)v52[3];
  }
  _Block_object_dispose(&v51, 8);
  if (!v5) {
    goto LABEL_40;
  }
  id v46 = *v5;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  id v8 = (id *)getMediaAnalysisResultImageCaptionLowConfidenceAttributeKeySymbolLoc_ptr;
  uint64_t v54 = getMediaAnalysisResultImageCaptionLowConfidenceAttributeKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultImageCaptionLowConfidenceAttributeKeySymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v57 = __getMediaAnalysisResultImageCaptionLowConfidenceAttributeKeySymbolLoc_block_invoke;
    v58 = &unk_1E6116AD8;
    v59 = &v51;
    id v9 = (void *)MediaAnalysisLibrary();
    v10 = dlsym(v9, "MediaAnalysisResultImageCaptionLowConfidenceAttributeKey");
    *(void *)(v59[1] + 24) = v10;
    getMediaAnalysisResultImageCaptionLowConfidenceAttributeKeySymbolLoc_ptr = *(void *)(v59[1] + 24);
    id v8 = (id *)v52[3];
  }
  _Block_object_dispose(&v51, 8);
  if (!v8) {
    goto LABEL_40;
  }
  id v45 = *v8;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  v11 = (id *)getMediaAnalysisResultClassificationIdentifiersAttributeKeySymbolLoc_ptr;
  uint64_t v54 = getMediaAnalysisResultClassificationIdentifiersAttributeKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultClassificationIdentifiersAttributeKeySymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v57 = __getMediaAnalysisResultClassificationIdentifiersAttributeKeySymbolLoc_block_invoke;
    v58 = &unk_1E6116AD8;
    v59 = &v51;
    v12 = (void *)MediaAnalysisLibrary();
    uint64_t v13 = dlsym(v12, "MediaAnalysisResultClassificationIdentifiersAttributeKey");
    *(void *)(v59[1] + 24) = v13;
    getMediaAnalysisResultClassificationIdentifiersAttributeKeySymbolLoc_ptr = *(void *)(v59[1] + 24);
    v11 = (id *)v52[3];
  }
  _Block_object_dispose(&v51, 8);
  if (!v11) {
    goto LABEL_40;
  }
  id v44 = *v11;
  if (a4)
  {
    id v14 = 0;
    id v15 = 0;
    id v41 = 0;
    goto LABEL_22;
  }
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  uint64_t v16 = (id *)getMediaAnalysisImageCaptionResultsKeySymbolLoc_ptr;
  uint64_t v54 = getMediaAnalysisImageCaptionResultsKeySymbolLoc_ptr;
  if (!getMediaAnalysisImageCaptionResultsKeySymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v57 = __getMediaAnalysisImageCaptionResultsKeySymbolLoc_block_invoke;
    v58 = &unk_1E6116AD8;
    v59 = &v51;
    uint64_t v17 = (void *)MediaAnalysisLibrary();
    char v18 = dlsym(v17, "MediaAnalysisImageCaptionResultsKey");
    *(void *)(v59[1] + 24) = v18;
    getMediaAnalysisImageCaptionResultsKeySymbolLoc_ptr = *(void *)(v59[1] + 24);
    uint64_t v16 = (id *)v52[3];
  }
  _Block_object_dispose(&v51, 8);
  if (!v16) {
    goto LABEL_40;
  }
  id v41 = *v16;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  uint64_t v19 = (id *)getMediaAnalysisResultImageCaptionTextAttributeKeySymbolLoc_ptr;
  uint64_t v54 = getMediaAnalysisResultImageCaptionTextAttributeKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultImageCaptionTextAttributeKeySymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v57 = __getMediaAnalysisResultImageCaptionTextAttributeKeySymbolLoc_block_invoke;
    v58 = &unk_1E6116AD8;
    v59 = &v51;
    v20 = (void *)MediaAnalysisLibrary();
    uint64_t v21 = dlsym(v20, "MediaAnalysisResultImageCaptionTextAttributeKey");
    *(void *)(v59[1] + 24) = v21;
    getMediaAnalysisResultImageCaptionTextAttributeKeySymbolLoc_ptr = *(void *)(v59[1] + 24);
    uint64_t v19 = (id *)v52[3];
  }
  _Block_object_dispose(&v51, 8);
  if (!v19) {
    goto LABEL_40;
  }
  id v15 = *v19;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  BOOL v22 = (id *)getMediaAnalysisResultImageCaptionConfidenceAttributeKeySymbolLoc_ptr;
  uint64_t v54 = getMediaAnalysisResultImageCaptionConfidenceAttributeKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultImageCaptionConfidenceAttributeKeySymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v57 = __getMediaAnalysisResultImageCaptionConfidenceAttributeKeySymbolLoc_block_invoke;
    v58 = &unk_1E6116AD8;
    v59 = &v51;
    BOOL v23 = (void *)MediaAnalysisLibrary();
    id v24 = dlsym(v23, "MediaAnalysisResultImageCaptionConfidenceAttributeKey");
    *(void *)(v59[1] + 24) = v24;
    getMediaAnalysisResultImageCaptionConfidenceAttributeKeySymbolLoc_ptr = *(void *)(v59[1] + 24);
    BOOL v22 = (id *)v52[3];
  }
  _Block_object_dispose(&v51, 8);
  if (!v22)
  {
LABEL_40:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    __break(1u);
  }
  id v14 = *v22;
LABEL_22:
  id v43 = [MEMORY[0x1E4F1CA48] array];
  if (v41)
  {
    v39 = [v40 objectForKeyedSubscript:v41];
    if ([v39 count])
    {
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id obj = v39;
      uint64_t v25 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
      if (v25)
      {
        uint64_t v26 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v48 != v26) {
              objc_enumerationMutation(obj);
            }
            id v28 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            v29 = [v28 objectForKeyedSubscript:v46];
            v30 = [v29 objectForKeyedSubscript:v15];
            id v31 = [v29 objectForKeyedSubscript:v14];
            [v31 doubleValue];
            double v33 = v32;

            long long v34 = [v29 objectForKeyedSubscript:v45];
            uint64_t v35 = [v34 BOOLValue];

            long long v36 = [v29 objectForKeyedSubscript:v44];
            if ([v30 length])
            {
              dispatch_semaphore_t v37 = [[AXMMediaAnalysisCaptions alloc] initWithText:v30 confidence:v35 isLowConfidence:v36 classificationIdentifiers:v33];
              [v43 addObject:v37];
            }
            else
            {
              AXMediaLogCommon();
              dispatch_semaphore_t v37 = (AXMMediaAnalysisCaptions *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(&v37->super, OS_LOG_TYPE_DEBUG))
              {
                LODWORD(buf) = 138412290;
                *(void *)((char *)&buf + 4) = v28;
                _os_log_debug_impl(&dword_1B57D5000, &v37->super, OS_LOG_TYPE_DEBUG, "AXM Media analysis: No caption attrs unexpected: %@", (uint8_t *)&buf, 0xCu);
              }
            }
          }
          uint64_t v25 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
        }
        while (v25);
      }
    }
  }

  return v43;
}

- (id)_mediaAnalysisCaptionResultFromResults:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(AXMMediaAnalysisCaptionsResult);
  if (![v3 count])
  {
    id v9 = AXMediaLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[AXMMediaAnalysisCaptionDetectorNode _mediaAnalysisCaptionResultFromResults:](v9);
    }
    goto LABEL_12;
  }
  id v5 = [v3 firstObject];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2050000000;
  id v6 = (void *)getMADCaptionResultClass_softClass;
  uint64_t v22 = getMADCaptionResultClass_softClass;
  if (!getMADCaptionResultClass_softClass)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __getMADCaptionResultClass_block_invoke;
    v18[3] = &unk_1E6116AD8;
    v18[4] = &v19;
    __getMADCaptionResultClass_block_invoke((uint64_t)v18);
    id v6 = (void *)v20[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v19, 8);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v9 = [v3 firstObject];
    v10 = [v9 caption];
    [v9 score];
    float v12 = v11;
    uint64_t v13 = [v9 isLowConfidence];
    id v14 = [v9 classificationIdentifiers];
    id v15 = [MEMORY[0x1E4F1CA48] array];
    if ([v10 length])
    {
      uint64_t v16 = [[AXMMediaAnalysisCaptions alloc] initWithText:v10 confidence:v13 isLowConfidence:v14 classificationIdentifiers:v12];
      [v15 addObject:v16];
    }
    if ([v15 count]) {
      [(AXMMediaAnalysisCaptionsResult *)v4 setImageCaptionResults:v15];
    }

LABEL_12:
  }

  return v4;
}

- (AXMMediaAnalysisSceneDetectorNode)sceneDetector
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDetector);

  return (AXMMediaAnalysisSceneDetectorNode *)WeakRetained;
}

- (void)setSceneDetector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sceneDetector);

  objc_storeStrong((id *)&self->_languageTranslator, 0);
}

- (void)evaluate:metrics:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0(&dword_1B57D5000, v0, v1, "AXM Media analysis: PHAsset is nil for phAssetLocalIdentifier : %@ and photoLibraryURL : %@");
}

- (void)evaluate:(unsigned char *)a1 metrics:(unsigned char *)a2 .cold.3(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1_3(a1, a2);
  OUTLINED_FUNCTION_4(&dword_1B57D5000, v2, v3, "AXM Media Analysis: Caption Detection (PHAsset) request timed out", v4);
}

- (void)evaluate:(unsigned char *)a1 metrics:(unsigned char *)a2 .cold.4(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1_3(a1, a2);
  OUTLINED_FUNCTION_4(&dword_1B57D5000, v2, v3, "AXM Media Analysis: Caption Detection (PixelBuffer) request timed out", v4);
}

- (void)evaluate:(unsigned char *)a1 metrics:(unsigned char *)a2 .cold.5(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1_3(a1, a2);
  OUTLINED_FUNCTION_4(&dword_1B57D5000, v2, v3, "AXM Media Analysis: Caption Detection (CIImage) request timed out", v4);
}

void __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_67_cold_1(uint64_t a1)
{
  os_log_t v1 = [*(id *)(a1 + 32) localIdentifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1B57D5000, v2, v3, "AXM Media analysis: No analysis result or error produced for asset with ID: %@", v4, v5, v6, v7, v8);
}

void __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_67_cold_2(id *a1)
{
  os_log_t v1 = [*a1 localIdentifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1B57D5000, v2, v3, "AXM Media analysis: No analysis dict found for asset with ID: %@", v4, v5, v6, v7, v8);
}

void __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_67_cold_3(id *a1)
{
  os_log_t v1 = [*a1 localIdentifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1B57D5000, v2, v3, "AXM Media analysis: AXMMediaAnalysisCaptionsResult is nil for asset with ID: %@", v4, v5, v6, v7, v8);
}

void __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_67_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1B57D5000, v0, v1, "AXM Media analysis: Error in caption analysis with PHAsset: %@", v2, v3, v4, v5, v6);
}

void __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_67_cold_5()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0(&dword_1B57D5000, v0, v1, "AXM Media analysis: Caption Detection (PHAsset) results: result: %@ error: %@");
}

void __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_73_cold_1()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_1B57D5000, v0, v1, "AXM Media analysis: Invalid request - MADImageCaptionRequest on ciimage : %@", v2, v3, v4, v5, v6);
}

void __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_73_cold_2()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_1B57D5000, v0, v1, "AXM Media analysis: AXMMediaAnalysisCaptionsResult is nil on ciimage : %@", v2, v3, v4, v5, v6);
}

void __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_73_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1B57D5000, v0, v1, "AXM Media analysis: Error in caption analysis with CIImage: %@", v2, v3, v4, v5, v6);
}

void __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_75_cold_1()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_1B57D5000, v0, v1, "AXM Media analysis: Invalid request - MADImageCaptionRequest on pixelBuffer : %@", v2, v3, v4, v5, v6);
}

void __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_75_cold_2()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_1B57D5000, v0, v1, "AXM Media analysis: AXMMediaAnalysisCaptionsResult is nil on pixelBuffer : %@", v2, v3, v4, v5, v6);
}

void __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_75_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1B57D5000, v0, v1, "AXM Media analysis: Error in caption analysis with CVPixelBuffer: %@", v2, v3, v4, v5, v6);
}

- (void)translatedTextForCaption:withContext:metrics:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1B57D5000, v0, OS_LOG_TYPE_ERROR, "Caption translation failed: %@", v1, 0xCu);
}

- (void)_addCaptionFeaturesToContext:(os_log_t)log metrics:fromResult:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1B57D5000, log, OS_LOG_TYPE_ERROR, "Cannot run auxiliary scene detection, detector was nil.", v1, 2u);
}

- (void)_mediaAnalysisCaptionResultForPHAssetsFromAnalysis:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1B57D5000, log, OS_LOG_TYPE_DEBUG, "AXM Media analysis: No image captions result", v1, 2u);
}

- (void)_mediaAnalysisCaptionResultFromResults:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1B57D5000, log, OS_LOG_TYPE_DEBUG, "AXM Media analysis: No results available", v1, 2u);
}

@end