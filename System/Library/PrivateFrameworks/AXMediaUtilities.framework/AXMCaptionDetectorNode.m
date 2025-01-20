@interface AXMCaptionDetectorNode
+ (BOOL)isSupported;
+ (BOOL)supportsSecureCoding;
+ (CGSize)preferredModelInputSize;
+ (id)title;
- (AXImageCaptionModel)effectiveCaptionModelInfo;
- (AXMCaptionDetectorNode)initWithCoder:(id)a3;
- (AXMSceneDetectorNode)sceneDetector;
- (BOOL)_captionModelCloningIsNeeded;
- (BOOL)requiresVisionFramework;
- (CVNLPCaptionHandler)_withLock_captionHandlerCreateIfNeeded:(id)a3;
- (NSURL)effectiveModelURL;
- (NSURL)overrideModelURL;
- (id)_computeCaptionForPixelBuffer:(__CVBuffer *)a3 orImage:(CGImage *)a4 captionHandler:(CVNLPCaptionHandler *)a5 metrics:(id)a6;
- (id)_withLock_captionModelURLCloningAssetIfNeeded;
- (id)_withLock_cloneCaptionModelIfNeeded:(id)a3;
- (id)_withLock_modelURLForOverrideURL:(id)a3;
- (id)_withLock_valueForOverrideScaleMethod;
- (unint64_t)genderStrategy;
- (unint64_t)overrideScaleMethod;
- (void)_performWithLock:(id)a3;
- (void)_withLock_captionModelURLCloningAssetIfNeeded;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)evaluate:(id)a3 metrics:(id)a4;
- (void)nodeInitialize;
- (void)setGenderStrategy:(unint64_t)a3;
- (void)setOverrideModelURL:(id)a3;
- (void)setOverrideScaleMethod:(unint64_t)a3;
- (void)setSceneDetector:(id)a3;
@end

@implementation AXMCaptionDetectorNode

+ (CGSize)preferredModelInputSize
{
  double v2 = 448.0;
  double v3 = 448.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)nodeInitialize
{
  v3.receiver = self;
  v3.super_class = (Class)AXMCaptionDetectorNode;
  [(AXMEvaluationNode *)&v3 nodeInitialize];
  self->_lock._os_unfair_lock_opaque = 0;
}

- (void)dealloc
{
  captionHandlerRef = self->_captionHandlerRef;
  if (captionHandlerRef)
  {
    CFRelease(captionHandlerRef);
    self->_captionHandlerRef = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AXMCaptionDetectorNode;
  [(AXMCaptionDetectorNode *)&v4 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMCaptionDetectorNode)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXMCaptionDetectorNode;
  v5 = [(AXMEvaluationNode *)&v9 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"overrideModelURL"];
    [(AXMCaptionDetectorNode *)v5 setOverrideModelURL:v6];

    -[AXMCaptionDetectorNode setOverrideScaleMethod:](v5, "setOverrideScaleMethod:", [v4 decodeBoolForKey:@"overrideScaleMethod"]);
    -[AXMCaptionDetectorNode setGenderStrategy:](v5, "setGenderStrategy:", [v4 decodeIntegerForKey:@"genderStrategy"]);
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sceneDetector"];
    [(AXMCaptionDetectorNode *)v5 setSceneDetector:v7];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AXMCaptionDetectorNode;
  id v4 = a3;
  [(AXMEvaluationNode *)&v7 encodeWithCoder:v4];
  v5 = [(AXMCaptionDetectorNode *)self overrideModelURL];
  [v4 encodeObject:v5 forKey:@"overrideModelURL"];

  objc_msgSend(v4, "encodeBool:forKey:", -[AXMCaptionDetectorNode overrideScaleMethod](self, "overrideScaleMethod") != 0, @"overrideScaleMethod");
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXMCaptionDetectorNode genderStrategy](self, "genderStrategy"), @"genderStrategy");
  v6 = [(AXMCaptionDetectorNode *)self sceneDetector];
  [v4 encodeObject:v6 forKey:@"sceneDetector"];
}

+ (BOOL)isSupported
{
  double v2 = [MEMORY[0x1E4F28F80] processInfo];
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
  return @"Caption Detector";
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AXMCaptionDetectorNode;
  [(AXMEvaluationNode *)&v13 evaluate:v6 metrics:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__AXMCaptionDetectorNode_evaluate_metrics___block_invoke;
  v10[3] = &unk_1E61179A0;
  v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(AXMCaptionDetectorNode *)self _performWithLock:v10];
}

void __43__AXMCaptionDetectorNode_evaluate_metrics___block_invoke(uint64_t a1)
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend(*(id *)(a1 + 32), "_withLock_captionHandlerCreateIfNeeded:", *(void *)(a1 + 40)))
  {
    v5 = AXMediaLogCommon();
    id v6 = v5;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_69;
    }
    __43__AXMCaptionDetectorNode_evaluate_metrics___block_invoke_cold_1();
LABEL_6:
    id v6 = v5;
    goto LABEL_69;
  }
  uint64_t v77 = a1;
  double v2 = [*(id *)(a1 + 48) sourceInput];
  uint64_t v3 = [v2 wrappedPixelBuffer];

  uint64_t v73 = v3;
  if (v3)
  {
    id v4 = 0;
    goto LABEL_10;
  }
  id v7 = AXMediaLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B57D5000, v7, OS_LOG_TYPE_INFO, "No CVPixelBufferRef found in pipeline context. Falling back to CGImageRef", buf, 2u);
  }

  id v8 = [*(id *)(v77 + 48) sourceInput];
  uint64_t v9 = [v8 createCGImageWithMetrics:*(void *)(v77 + 40)];

  id v4 = (const void *)v9;
  if (!v9)
  {
    v5 = AXMediaLogCommon();
    id v6 = v5;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_69;
    }
    __43__AXMCaptionDetectorNode_evaluate_metrics___block_invoke_cold_2();
    goto LABEL_6;
  }
LABEL_10:
  CFTypeRef cf = v4;
  v74 = objc_msgSend(*(id *)(v77 + 32), "_computeCaptionForPixelBuffer:orImage:captionHandler:metrics:", v73);
  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x2020000000;
  v10 = (void *)getCVNLPCaptionsSymbolLoc_ptr;
  uint64_t v86 = getCVNLPCaptionsSymbolLoc_ptr;
  if (!getCVNLPCaptionsSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getCVNLPCaptionsSymbolLoc_block_invoke;
    unint64_t v89 = (unint64_t)&unk_1E6116AD8;
    *(void *)v90 = &v83;
    id v11 = (void *)CVNLPLibrary();
    id v12 = dlsym(v11, "CVNLPCaptions");
    *(void *)(*(void *)(*(void *)v90 + 8) + 24) = v12;
    getCVNLPCaptionsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)v90 + 8) + 24);
    v10 = (void *)v84[3];
  }
  _Block_object_dispose(&v83, 8);
  if (!v10) {
    goto LABEL_74;
  }
  objc_super v13 = [v74 objectForKeyedSubscript:*v10];
  v75 = [v13 firstObject];

  if (v75)
  {
    uint64_t v83 = 0;
    v84 = &v83;
    uint64_t v85 = 0x2020000000;
    v14 = (id *)getCVNLPGeneratedCaptionSymbolLoc_ptr;
    uint64_t v86 = getCVNLPGeneratedCaptionSymbolLoc_ptr;
    if (!getCVNLPGeneratedCaptionSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getCVNLPGeneratedCaptionSymbolLoc_block_invoke;
      unint64_t v89 = (unint64_t)&unk_1E6116AD8;
      *(void *)v90 = &v83;
      v15 = (void *)CVNLPLibrary();
      v16 = dlsym(v15, "CVNLPGeneratedCaption");
      *(void *)(*(void *)(*(void *)v90 + 8) + 24) = v16;
      getCVNLPGeneratedCaptionSymbolLoc_ptr = *(void *)(*(void *)(*(void *)v90 + 8) + 24);
      v14 = (id *)v84[3];
    }
    _Block_object_dispose(&v83, 8);
    if (v14)
    {
      id v17 = *v14;
      v18 = [v75 objectForKeyedSubscript:v17];

      uint64_t v83 = 0;
      v84 = &v83;
      uint64_t v85 = 0x2020000000;
      v19 = (id *)getCVNLPGeneratedCaptionScoreSymbolLoc_ptr;
      uint64_t v86 = getCVNLPGeneratedCaptionScoreSymbolLoc_ptr;
      if (!getCVNLPGeneratedCaptionScoreSymbolLoc_ptr)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getCVNLPGeneratedCaptionScoreSymbolLoc_block_invoke;
        unint64_t v89 = (unint64_t)&unk_1E6116AD8;
        *(void *)v90 = &v83;
        v20 = (void *)CVNLPLibrary();
        v21 = dlsym(v20, "CVNLPGeneratedCaptionScore");
        *(void *)(*(void *)(*(void *)v90 + 8) + 24) = v21;
        getCVNLPGeneratedCaptionScoreSymbolLoc_ptr = *(void *)(*(void *)(*(void *)v90 + 8) + 24);
        v19 = (id *)v84[3];
      }
      _Block_object_dispose(&v83, 8);
      if (v19)
      {
        id v22 = *v19;
        v23 = [v75 objectForKeyedSubscript:v22];

        uint64_t v83 = 0;
        v84 = &v83;
        uint64_t v85 = 0x2020000000;
        v24 = (void *)getCVNLPGeneratedCaptionConfidenceLowSymbolLoc_ptr;
        uint64_t v86 = getCVNLPGeneratedCaptionConfidenceLowSymbolLoc_ptr;
        if (!getCVNLPGeneratedCaptionConfidenceLowSymbolLoc_ptr)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __getCVNLPGeneratedCaptionConfidenceLowSymbolLoc_block_invoke;
          unint64_t v89 = (unint64_t)&unk_1E6116AD8;
          *(void *)v90 = &v83;
          v25 = (void *)CVNLPLibrary();
          v26 = dlsym(v25, "CVNLPGeneratedCaptionConfidenceLow");
          *(void *)(*(void *)(*(void *)v90 + 8) + 24) = v26;
          getCVNLPGeneratedCaptionConfidenceLowSymbolLoc_ptr = *(void *)(*(void *)(*(void *)v90 + 8) + 24);
          v24 = (void *)v84[3];
        }
        _Block_object_dispose(&v83, 8);
        if (v24)
        {
          v27 = [v75 objectForKeyedSubscript:*v24];
          unsigned int v72 = [v27 BOOLValue];

          v28 = AXMediaLogCommon();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            v29 = [*(id *)(*(void *)(v77 + 32) + 112) version];
            v30 = [*(id *)(*(void *)(v77 + 32) + 112) stage];
            *(_DWORD *)buf = 138413314;
            *(void *)&buf[4] = v18;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v23;
            *(_WORD *)&buf[22] = 2048;
            unint64_t v89 = v72;
            *(_WORD *)v90 = 2112;
            *(void *)&v90[2] = v29;
            __int16 v91 = 2112;
            v92 = v30;
            _os_log_impl(&dword_1B57D5000, v28, OS_LOG_TYPE_INFO, "Did produce caption for image. text: '%@'. confidence: %@. lowConfidence: %ld. model: [v'%@' - '%@']", buf, 0x34u);
          }
          v31 = [*(id *)(v77 + 48) analysisOptions];
          v32 = [v31 preferredOutputLocale];

          if (!v32)
          {
            v33 = AXMediaLogLanguageTranslation();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B57D5000, v33, OS_LOG_TYPE_INFO, "preferred output language unexpectedly nil! Falling back to english", buf, 2u);
            }

            v34 = +[AXMLocSupport sharedInstance];
            v32 = objc_msgSend(v34, "en_USLocale");
          }
          v35 = +[AXMLocSupport sharedInstance];
          int v36 = [v35 localeBaseLanguageIsEnglish:v32];

          if (v36)
          {
            v37 = AXMediaLogLanguageTranslation();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B57D5000, v37, OS_LOG_TYPE_INFO, "preferred output language is English. Translation not required", buf, 2u);
            }

            v38 = +[AXMTranslatedText text:v18 confidence:0 isLowConfidence:v32 targetLocale:1.0];
          }
          else
          {
            uint64_t v39 = v77;
            v40 = *(void **)(*(void *)(v77 + 32) + 128);
            if (!v40)
            {
              v41 = objc_alloc_init(AXMLanguageTranslator);
              uint64_t v42 = *(void *)(v77 + 32);
              v43 = *(void **)(v42 + 128);
              *(void *)(v42 + 128) = v41;

              v40 = *(void **)(*(void *)(v77 + 32) + 128);
              uint64_t v39 = v77;
            }
            uint64_t v44 = *(void *)(v39 + 40);
            id v82 = 0;
            v38 = [v40 translateText:v18 toLocale:v32 respectAllowList:1 metrics:v44 error:&v82];
            id v45 = v82;
            if (v45)
            {
              v46 = AXMediaLogLanguageTranslation();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
                __43__AXMCaptionDetectorNode_evaluate_metrics___block_invoke_cold_9((uint64_t)v45, v46, v47, v48, v49, v50, v51, v52);
              }
            }
          }
          [v23 floatValue];
          v76 = +[AXMVisionFeature featureWithCaptionResult:v18, v38, @"AXCustomModel", v72, v53, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8) confidence translatedCaption modelIdentifier canvasSize isLowConfidence];
          [*(id *)(v77 + 48) appendFeature:v76];

          goto LABEL_44;
        }
      }
    }
LABEL_74:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
LABEL_75:
    __break(1u);
  }
  v18 = AXMediaLogCommon();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B57D5000, v18, OS_LOG_TYPE_INFO, "Image produced no captions", buf, 2u);
  }
  unsigned int v72 = 0;
  v76 = 0;
LABEL_44:

  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x2020000000;
  v54 = (void *)getCVNLPImageClassificationIdentifiersSymbolLoc_ptr;
  uint64_t v86 = getCVNLPImageClassificationIdentifiersSymbolLoc_ptr;
  if (!getCVNLPImageClassificationIdentifiersSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getCVNLPImageClassificationIdentifiersSymbolLoc_block_invoke;
    unint64_t v89 = (unint64_t)&unk_1E6116AD8;
    *(void *)v90 = &v83;
    v55 = (void *)CVNLPLibrary();
    v56 = dlsym(v55, "CVNLPImageClassificationIdentifiers");
    *(void *)(*(void *)(*(void *)v90 + 8) + 24) = v56;
    getCVNLPImageClassificationIdentifiersSymbolLoc_ptr = *(void *)(*(void *)(*(void *)v90 + 8) + 24);
    v54 = (void *)v84[3];
  }
  _Block_object_dispose(&v83, 8);
  if (!v54)
  {
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    goto LABEL_75;
  }
  [v74 objectForKeyedSubscript:*v54];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v57 = (id)objc_claimAutoreleasedReturnValue();
  int v58 = 0;
  uint64_t v59 = [v57 countByEnumeratingWithState:&v78 objects:v87 count:16];
  if (v59)
  {
    uint64_t v60 = *(void *)v79;
    do
    {
      for (uint64_t i = 0; i != v59; ++i)
      {
        if (*(void *)v79 != v60) {
          objc_enumerationMutation(v57);
        }
        uint64_t v62 = *(void *)(*((void *)&v78 + 1) + 8 * i);
        BOOL v63 = +[AXMSignificantEventDetectorNode addSignificantEventResultToContext:*(void *)(v77 + 48) forIdentifier:v62 confidence:1 markAsSensitiveCaptionContent:1.0];
        BOOL v64 = +[AXMNSFWDetectorNode addNSFWResultToContext:*(void *)(v77 + 48) forIdentifier:v62 confidence:1 markAsSensitiveCaptionContent:1.0];
        if (v64 || v63) {
          [v76 setCaptionMayContainSensitiveContent:1];
        }
        v65 = AXMediaLogCommon();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v62;
          _os_log_impl(&dword_1B57D5000, v65, OS_LOG_TYPE_INFO, "Captioned image did activate classifier: %@", buf, 0xCu);
        }

        v58 |= v64;
      }
      uint64_t v59 = [v57 countByEnumeratingWithState:&v78 objects:v87 count:16];
    }
    while (v59);
  }

  if (!v73) {
    CFRelease(cf);
  }
  if ((v72 | v58))
  {
    v66 = AXMediaLogCommon();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B57D5000, v66, OS_LOG_TYPE_INFO, "Caption was low confidence or explicit. Requesting auxiliary scene detection", buf, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(v77 + 32) + 136));
    BOOL v68 = WeakRetained == 0;

    if (v68)
    {
      v70 = AXMediaLogCommon();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
        __43__AXMCaptionDetectorNode_evaluate_metrics___block_invoke_cold_5();
      }
    }
    else
    {
      v69 = *(void **)(v77 + 48);
      v70 = objc_loadWeakRetained((id *)(*(void *)(v77 + 32) + 136));
      [v69 addAuxiliaryDetector:v70];
    }
  }
  id v6 = v76;
LABEL_69:
}

- (NSURL)overrideModelURL
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__13;
  uint64_t v9 = __Block_byref_object_dispose__13;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__AXMCaptionDetectorNode_overrideModelURL__block_invoke;
  v4[3] = &unk_1E6116EC0;
  v4[4] = self;
  v4[5] = &v5;
  [(AXMCaptionDetectorNode *)self _performWithLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSURL *)v2;
}

void __42__AXMCaptionDetectorNode_overrideModelURL__block_invoke(uint64_t a1)
{
}

- (void)setOverrideModelURL:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__AXMCaptionDetectorNode_setOverrideModelURL___block_invoke;
  v6[3] = &unk_1E6116F08;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(AXMCaptionDetectorNode *)self _performWithLock:v6];
}

void __46__AXMCaptionDetectorNode_setOverrideModelURL___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  unint64_t v3 = *(void *)(*(void *)(a1 + 32) + 80);
  if (v3 | v2)
  {
    if ((objc_msgSend((id)v3, "isEqual:") & 1) == 0)
    {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), *(id *)(a1 + 40));
      *(unsigned char *)(*(void *)(a1 + 32) + 68) = 1;
    }
  }
}

- (unint64_t)overrideScaleMethod
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__AXMCaptionDetectorNode_overrideScaleMethod__block_invoke;
  v4[3] = &unk_1E6116EC0;
  v4[4] = self;
  v4[5] = &v5;
  [(AXMCaptionDetectorNode *)self _performWithLock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __45__AXMCaptionDetectorNode_overrideScaleMethod__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 88);
  return result;
}

- (void)setOverrideScaleMethod:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__AXMCaptionDetectorNode_setOverrideScaleMethod___block_invoke;
  v3[3] = &unk_1E6117438;
  v3[4] = self;
  v3[5] = a3;
  [(AXMCaptionDetectorNode *)self _performWithLock:v3];
}

uint64_t __49__AXMCaptionDetectorNode_setOverrideScaleMethod___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(result + 40);
  if (*(void *)(v1 + 88) != v2)
  {
    *(void *)(v1 + 88) = v2;
    *(unsigned char *)(*(void *)(result + 32) + 68) = 1;
  }
  return result;
}

- (unint64_t)genderStrategy
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__AXMCaptionDetectorNode_genderStrategy__block_invoke;
  v4[3] = &unk_1E6116EC0;
  v4[4] = self;
  v4[5] = &v5;
  [(AXMCaptionDetectorNode *)self _performWithLock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __40__AXMCaptionDetectorNode_genderStrategy__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 96);
  return result;
}

- (void)setGenderStrategy:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__AXMCaptionDetectorNode_setGenderStrategy___block_invoke;
  v3[3] = &unk_1E6117438;
  v3[4] = self;
  v3[5] = a3;
  [(AXMCaptionDetectorNode *)self _performWithLock:v3];
}

uint64_t __44__AXMCaptionDetectorNode_setGenderStrategy___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(result + 40);
  if (*(void *)(v1 + 96) != v2)
  {
    *(void *)(v1 + 96) = v2;
    *(unsigned char *)(*(void *)(result + 32) + 68) = 1;
  }
  return result;
}

- (NSURL)effectiveModelURL
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__13;
  uint64_t v9 = __Block_byref_object_dispose__13;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__AXMCaptionDetectorNode_effectiveModelURL__block_invoke;
  v4[3] = &unk_1E6116EC0;
  v4[4] = self;
  v4[5] = &v5;
  [(AXMCaptionDetectorNode *)self _performWithLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSURL *)v2;
}

void __43__AXMCaptionDetectorNode_effectiveModelURL__block_invoke(uint64_t a1)
{
}

- (AXImageCaptionModel)effectiveCaptionModelInfo
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__13;
  uint64_t v9 = __Block_byref_object_dispose__13;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__AXMCaptionDetectorNode_effectiveCaptionModelInfo__block_invoke;
  v4[3] = &unk_1E6116EC0;
  v4[4] = self;
  v4[5] = &v5;
  [(AXMCaptionDetectorNode *)self _performWithLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (AXImageCaptionModel *)v2;
}

void __51__AXMCaptionDetectorNode_effectiveCaptionModelInfo__block_invoke(uint64_t a1)
{
}

- (void)_performWithLock:(id)a3
{
  p_lock = &self->_lock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (id)_withLock_modelURLForOverrideURL:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v5 = [v3 URLByAppendingPathComponent:@"model_info.json"];
  id v6 = [v5 path];
  int v7 = [v4 fileExistsAtPath:v6];

  if (v7)
  {
    id v8 = v3;
LABEL_5:
    id v12 = v8;
    goto LABEL_7;
  }
  uint64_t v9 = [v3 URLByAppendingPathComponent:@"ImageCaptionModel/model_info.json"];
  id v10 = [v9 path];
  int v11 = [v4 fileExistsAtPath:v10];

  if (v11)
  {
    id v8 = [v3 URLByAppendingPathComponent:@"ImageCaptionModel"];
    goto LABEL_5;
  }
  id v12 = 0;
LABEL_7:
  objc_super v13 = AXMediaLogCommon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = [v12 path];
    int v16 = 138412290;
    id v17 = v14;
    _os_log_impl(&dword_1B57D5000, v13, OS_LOG_TYPE_INFO, "Fixed up URL for override URL for image caption model: %@", (uint8_t *)&v16, 0xCu);
  }

  return v12;
}

- (id)_withLock_captionModelURLCloningAssetIfNeeded
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_overrideModelURL)
  {
    id v3 = AXMediaLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = [(NSURL *)self->_overrideModelURL path];
      int v12 = 138412290;
      objc_super v13 = v4;
      _os_log_impl(&dword_1B57D5000, v3, OS_LOG_TYPE_INFO, "Override URL specified for image caption model: %@", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v5 = [(AXMCaptionDetectorNode *)self _withLock_modelURLForOverrideURL:self->_overrideModelURL];
  }
  else
  {
    id v6 = +[AXMImageCaptionModelAssetManager sharedInstance];
    uint64_t v5 = [v6 modelURLForType:0 timeout:0.5];
  }
  int v7 = AXMediaLogCommon();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [v5 path];
      int v12 = 138412290;
      objc_super v13 = v9;
      _os_log_impl(&dword_1B57D5000, v8, OS_LOG_TYPE_INFO, "Original URL for caption model [type:AXMCaptionModelTypeImage] before cloning: %@", (uint8_t *)&v12, 0xCu);
    }
    id v10 = [(AXMCaptionDetectorNode *)self _withLock_cloneCaptionModelIfNeeded:v5];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[AXMCaptionDetectorNode _withLock_captionModelURLCloningAssetIfNeeded]();
    }

    id v10 = 0;
  }

  return v10;
}

- (id)_withLock_cloneCaptionModelIfNeeded:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(AXMCaptionDetectorNode *)self _captionModelCloningIsNeeded])
  {
    uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v6 = (void *)MEMORY[0x1E4F1CB10];
    int v7 = NSTemporaryDirectory();
    id v8 = [v6 fileURLWithPath:v7 isDirectory:1];
    uint64_t v9 = [v8 URLByAppendingPathComponent:@"ClonedImageCaptionModel" isDirectory:1];

    char v44 = 0;
    id v10 = [v9 path];
    LODWORD(v8) = [v5 fileExistsAtPath:v10 isDirectory:&v44];

    if (v8)
    {
      int v11 = AXMediaLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v9;
        _os_log_impl(&dword_1B57D5000, v11, OS_LOG_TYPE_INFO, "Deleting old clone directory for caption model: %@", buf, 0xCu);
      }

      id v43 = 0;
      char v12 = [v5 removeItemAtURL:v9 error:&v43];
      id v13 = v43;
      id v14 = v13;
      if ((v12 & 1) == 0)
      {
        id v22 = AXMediaLogCommon();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[AXMCaptionDetectorNode _withLock_cloneCaptionModelIfNeeded:].cold.4();
        }

        goto LABEL_20;
      }
      v15 = v13;
    }
    else
    {
      v15 = 0;
    }
    v19 = AXMediaLogCommon();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v9;
      _os_log_impl(&dword_1B57D5000, v19, OS_LOG_TYPE_INFO, "Creating clone directory for caption model: %@", buf, 0xCu);
    }

    id v42 = v15;
    char v20 = [v5 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:&v42];
    id v14 = v42;

    if ((v20 & 1) == 0)
    {
      v21 = AXMediaLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[AXMCaptionDetectorNode _withLock_cloneCaptionModelIfNeeded:]();
      }
      uint64_t v18 = 0;
LABEL_31:

      goto LABEL_32;
    }
LABEL_20:
    v23 = [v4 lastPathComponent];
    v21 = [v9 URLByAppendingPathComponent:v23 isDirectory:1];

    v24 = [v4 path];
    v25 = [v21 path];
    v26 = AXMediaLogCommon();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v46 = v24;
      __int16 v47 = 2112;
      uint64_t v48 = v25;
      _os_log_impl(&dword_1B57D5000, v26, OS_LOG_TYPE_INFO, "Cloning caption model: '%@' to: '%@'", buf, 0x16u);
    }

    id v27 = v24;
    v28 = (const char *)[v27 UTF8String];
    id v29 = v25;
    if (!clonefile(v28, (const char *)[v29 UTF8String], 3u)) {
      goto LABEL_29;
    }
    v30 = AXMediaLogCommon();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      [(AXMCaptionDetectorNode *)(uint64_t)v27 _withLock_cloneCaptionModelIfNeeded:v30];
    }

    v31 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v41 = 0;
    [v31 copyItemAtPath:v27 toPath:v29 error:&v41];
    id v32 = v41;

    if (v32)
    {
      v33 = AXMediaLogCommon();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        -[AXMCaptionDetectorNode _withLock_cloneCaptionModelIfNeeded:]((uint64_t)v32, v33, v34, v35, v36, v37, v38, v39);
      }

      uint64_t v18 = 0;
    }
    else
    {
LABEL_29:
      uint64_t v18 = v21;
    }

    goto LABEL_31;
  }
  int v16 = AXMediaLogCommon();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = [v4 path];
    *(_DWORD *)buf = 138412290;
    v46 = v17;
    _os_log_impl(&dword_1B57D5000, v16, OS_LOG_TYPE_INFO, "Will not clone caption model. Using original location: %@", buf, 0xCu);
  }
  uint64_t v18 = v4;
LABEL_32:

  return v18;
}

- (BOOL)_captionModelCloningIsNeeded
{
  return 1;
}

- (CVNLPCaptionHandler)_withLock_captionHandlerCreateIfNeeded:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v64 = a3;
  if (self->_needsCaptionHandlerRefresh)
  {
    id v4 = AXMediaLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B57D5000, v4, OS_LOG_TYPE_INFO, "image caption model overrides changed. Will recreate _captionHandlerRef", buf, 2u);
    }

    captionHandlerRef = self->_captionHandlerRef;
    if (captionHandlerRef)
    {
      CFRelease(captionHandlerRef);
      self->_captionHandlerRef = 0;
    }
    effectiveModelURL = self->_effectiveModelURL;
    self->_effectiveModelURL = 0;

    effectiveCaptionModelInfo = self->_effectiveCaptionModelInfo;
    self->_effectiveCaptionModelInfo = 0;

    self->_needsCaptionHandlerRefresh = 0;
  }
  id v8 = self->_captionHandlerRef;
  if (!v8)
  {
    id obj = [(AXMCaptionDetectorNode *)self _withLock_captionModelURLCloningAssetIfNeeded];
    uint64_t v9 = obj;
    if (!obj)
    {
      id v8 = 0;
LABEL_48:

      goto LABEL_49;
    }
    objc_storeStrong((id *)&self->_effectiveModelURL, obj);
    id v10 = +[AXMImageCaptionModelAssetManager sharedInstance];
    int v11 = [v10 infoForModelAtURL:self->_effectiveModelURL];
    char v12 = self->_effectiveCaptionModelInfo;
    self->_effectiveCaptionModelInfo = v11;

    id v13 = AXMediaLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = [(AXImageCaptionModel *)self->_effectiveCaptionModelInfo version];
      v15 = [(AXImageCaptionModel *)self->_effectiveCaptionModelInfo stage];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v15;
      _os_log_impl(&dword_1B57D5000, v13, OS_LOG_TYPE_INFO, "Did load image caption model: [v'%@' - '%@']", buf, 0x16u);
    }
    uint64_t v66 = 0;
    v67 = &v66;
    uint64_t v68 = 0x2020000000;
    int v16 = (id *)getCVNLPCaptionModelPathSymbolLoc_ptr;
    v69 = (void *)getCVNLPCaptionModelPathSymbolLoc_ptr;
    if (!getCVNLPCaptionModelPathSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getCVNLPCaptionModelPathSymbolLoc_block_invoke;
      v74 = &unk_1E6116AD8;
      v75 = &v66;
      id v17 = (void *)CVNLPLibrary();
      uint64_t v18 = dlsym(v17, "CVNLPCaptionModelPath");
      *(void *)(v75[1] + 24) = v18;
      getCVNLPCaptionModelPathSymbolLoc_ptr = *(void *)(v75[1] + 24);
      int v16 = (id *)v67[3];
    }
    _Block_object_dispose(&v66, 8);
    if (v16)
    {
      id v19 = *v16;
      v70[0] = v19;
      v72[0] = obj;
      uint64_t v66 = 0;
      v67 = &v66;
      uint64_t v68 = 0x2020000000;
      char v20 = (id *)getCVNLPCaptionLanguageSymbolLoc_ptr;
      v69 = (void *)getCVNLPCaptionLanguageSymbolLoc_ptr;
      if (!getCVNLPCaptionLanguageSymbolLoc_ptr)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getCVNLPCaptionLanguageSymbolLoc_block_invoke;
        v74 = &unk_1E6116AD8;
        v75 = &v66;
        v21 = (void *)CVNLPLibrary();
        id v22 = dlsym(v21, "CVNLPCaptionLanguage");
        *(void *)(v75[1] + 24) = v22;
        getCVNLPCaptionLanguageSymbolLoc_ptr = *(void *)(v75[1] + 24);
        char v20 = (id *)v67[3];
      }
      _Block_object_dispose(&v66, 8);
      if (v20)
      {
        id v23 = *v20;
        v70[1] = v23;
        v72[1] = @"en-US";
        uint64_t v66 = 0;
        v67 = &v66;
        uint64_t v68 = 0x2020000000;
        v24 = (id *)getCVNLPBeamSearchSizeSymbolLoc_ptr;
        v69 = (void *)getCVNLPBeamSearchSizeSymbolLoc_ptr;
        if (!getCVNLPBeamSearchSizeSymbolLoc_ptr)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __getCVNLPBeamSearchSizeSymbolLoc_block_invoke;
          v74 = &unk_1E6116AD8;
          v75 = &v66;
          v25 = (void *)CVNLPLibrary();
          v26 = dlsym(v25, "CVNLPBeamSearchSize");
          *(void *)(v75[1] + 24) = v26;
          getCVNLPBeamSearchSizeSymbolLoc_ptr = *(void *)(v75[1] + 24);
          v24 = (id *)v67[3];
        }
        _Block_object_dispose(&v66, 8);
        if (v24)
        {
          id v27 = *v24;
          v70[2] = v27;
          v72[2] = &unk_1F0E93E50;
          uint64_t v66 = 0;
          v67 = &v66;
          uint64_t v68 = 0x2020000000;
          v28 = (id *)getCVNLPCaptionModelTypeSymbolLoc_ptr;
          v69 = (void *)getCVNLPCaptionModelTypeSymbolLoc_ptr;
          if (!getCVNLPCaptionModelTypeSymbolLoc_ptr)
          {
            *(void *)buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __getCVNLPCaptionModelTypeSymbolLoc_block_invoke;
            v74 = &unk_1E6116AD8;
            v75 = &v66;
            id v29 = (void *)CVNLPLibrary();
            v30 = dlsym(v29, "CVNLPCaptionModelType");
            *(void *)(v75[1] + 24) = v30;
            getCVNLPCaptionModelTypeSymbolLoc_ptr = *(void *)(v75[1] + 24);
            v28 = (id *)v67[3];
          }
          _Block_object_dispose(&v66, 8);
          if (v28)
          {
            id v31 = *v28;
            v70[3] = v31;
            uint64_t v66 = 0;
            v67 = &v66;
            uint64_t v68 = 0x2020000000;
            id v32 = (id *)getCVNLPCaptionModelTransformerSymbolLoc_ptr;
            v69 = (void *)getCVNLPCaptionModelTransformerSymbolLoc_ptr;
            if (!getCVNLPCaptionModelTransformerSymbolLoc_ptr)
            {
              *(void *)buf = MEMORY[0x1E4F143A8];
              *(void *)&buf[8] = 3221225472;
              *(void *)&buf[16] = __getCVNLPCaptionModelTransformerSymbolLoc_block_invoke;
              v74 = &unk_1E6116AD8;
              v75 = &v66;
              v33 = (void *)CVNLPLibrary();
              uint64_t v34 = dlsym(v33, "CVNLPCaptionModelTransformer");
              *(void *)(v75[1] + 24) = v34;
              getCVNLPCaptionModelTransformerSymbolLoc_ptr = *(void *)(v75[1] + 24);
              id v32 = (id *)v67[3];
            }
            _Block_object_dispose(&v66, 8);
            if (v32)
            {
              id v35 = *v32;
              v72[3] = v35;
              uint64_t v66 = 0;
              v67 = &v66;
              uint64_t v68 = 0x2020000000;
              uint64_t v36 = (id *)getCVNLPCaptionEnableGenderedCaptionsSymbolLoc_ptr;
              v69 = (void *)getCVNLPCaptionEnableGenderedCaptionsSymbolLoc_ptr;
              if (!getCVNLPCaptionEnableGenderedCaptionsSymbolLoc_ptr)
              {
                *(void *)buf = MEMORY[0x1E4F143A8];
                *(void *)&buf[8] = 3221225472;
                *(void *)&buf[16] = __getCVNLPCaptionEnableGenderedCaptionsSymbolLoc_block_invoke;
                v74 = &unk_1E6116AD8;
                v75 = &v66;
                uint64_t v37 = (void *)CVNLPLibrary();
                uint64_t v38 = dlsym(v37, "CVNLPCaptionEnableGenderedCaptions");
                *(void *)(v75[1] + 24) = v38;
                getCVNLPCaptionEnableGenderedCaptionsSymbolLoc_ptr = *(void *)(v75[1] + 24);
                uint64_t v36 = (id *)v67[3];
              }
              _Block_object_dispose(&v66, 8);
              if (v36)
              {
                id v71 = *v36;
                uint64_t v39 = NSNumber;
                unint64_t genderStrategy = self->_genderStrategy;
                id v41 = v71;
                id v42 = [v39 numberWithUnsignedInteger:genderStrategy];
                v72[4] = v42;
                id v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v70 count:5];
                uint64_t v62 = (void *)[v43 mutableCopy];

                char v44 = [(AXMCaptionDetectorNode *)self _withLock_valueForOverrideScaleMethod];
                if (v44)
                {
                  uint64_t v66 = 0;
                  v67 = &v66;
                  uint64_t v68 = 0x2020000000;
                  id v45 = (void *)getCVNLPCaptionScaleMethodSymbolLoc_ptr;
                  v69 = (void *)getCVNLPCaptionScaleMethodSymbolLoc_ptr;
                  if (!getCVNLPCaptionScaleMethodSymbolLoc_ptr)
                  {
                    *(void *)buf = MEMORY[0x1E4F143A8];
                    *(void *)&buf[8] = 3221225472;
                    *(void *)&buf[16] = __getCVNLPCaptionScaleMethodSymbolLoc_block_invoke;
                    v74 = &unk_1E6116AD8;
                    v75 = &v66;
                    v46 = (void *)CVNLPLibrary();
                    __int16 v47 = dlsym(v46, "CVNLPCaptionScaleMethod");
                    *(void *)(v75[1] + 24) = v47;
                    getCVNLPCaptionScaleMethodSymbolLoc_ptr = *(void *)(v75[1] + 24);
                    id v45 = (void *)v67[3];
                  }
                  _Block_object_dispose(&v66, 8);
                  if (!v45) {
                    goto LABEL_50;
                  }
                  [v62 setObject:v44 forKeyedSubscript:*v45];
                }
                uint64_t v48 = AXMediaLogCommon();
                if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v62;
                  _os_log_impl(&dword_1B57D5000, v48, OS_LOG_TYPE_INFO, "Will generate captions with options: %@", buf, 0xCu);
                }

                uint64_t v65 = 0;
                uint64_t v49 = [v64 startMeasure:@"CVNLPCaptionHandlerCreate"];
                uint64_t v66 = 0;
                v67 = &v66;
                uint64_t v68 = 0x2020000000;
                uint64_t v50 = (uint64_t (*)(void *, uint64_t *))getCVNLPCaptionHandlerCreateSymbolLoc_ptr;
                v69 = getCVNLPCaptionHandlerCreateSymbolLoc_ptr;
                if (!getCVNLPCaptionHandlerCreateSymbolLoc_ptr)
                {
                  *(void *)buf = MEMORY[0x1E4F143A8];
                  *(void *)&buf[8] = 3221225472;
                  *(void *)&buf[16] = __getCVNLPCaptionHandlerCreateSymbolLoc_block_invoke;
                  v74 = &unk_1E6116AD8;
                  v75 = &v66;
                  uint64_t v51 = (void *)CVNLPLibrary();
                  uint64_t v52 = dlsym(v51, "CVNLPCaptionHandlerCreate");
                  *(void *)(v75[1] + 24) = v52;
                  getCVNLPCaptionHandlerCreateSymbolLoc_ptr = *(_UNKNOWN **)(v75[1] + 24);
                  uint64_t v50 = (uint64_t (*)(void *, uint64_t *))v67[3];
                }
                _Block_object_dispose(&v66, 8);
                if (v50)
                {
                  self->_captionHandlerRef = (CVNLPCaptionHandler *)v50(v62, &v65);
                  [v49 endMeasurement];
                  if (v65)
                  {
                    float v53 = AXMediaLogCommon();
                    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
                      -[AXMCaptionDetectorNode _withLock_captionHandlerCreateIfNeeded:].cold.8((uint64_t)&v65, v53, v54, v55, v56, v57, v58, v59);
                    }

                    uint64_t v60 = self->_captionHandlerRef;
                    if (v60)
                    {
                      CFRelease(v60);
                      id v8 = 0;
                      self->_captionHandlerRef = 0;
                    }
                    else
                    {
                      id v8 = 0;
                    }
                  }
                  else
                  {
                    id v8 = self->_captionHandlerRef;
                  }

                  uint64_t v9 = obj;
                  goto LABEL_48;
                }
              }
            }
          }
        }
      }
    }
LABEL_50:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    __break(1u);
  }
LABEL_49:

  return v8;
}

- (id)_withLock_valueForOverrideScaleMethod
{
  switch(self->_overrideScaleMethod)
  {
    case 1uLL:
      uint64_t v11 = 0;
      char v12 = &v11;
      uint64_t v13 = 0x2020000000;
      id v2 = (id *)getCVNLPCaptionScaleMethodCGInterpolationNoneSymbolLoc_ptr;
      uint64_t v14 = getCVNLPCaptionScaleMethodCGInterpolationNoneSymbolLoc_ptr;
      if (!getCVNLPCaptionScaleMethodCGInterpolationNoneSymbolLoc_ptr)
      {
        id v3 = (void *)CVNLPLibrary();
        v12[3] = (uint64_t)dlsym(v3, "CVNLPCaptionScaleMethodCGInterpolationNone");
        getCVNLPCaptionScaleMethodCGInterpolationNoneSymbolLoc_ptr = v12[3];
        id v2 = (id *)v12[3];
      }
      _Block_object_dispose(&v11, 8);
      if (v2) {
        goto LABEL_21;
      }
      __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
      goto LABEL_6;
    case 2uLL:
LABEL_6:
      uint64_t v11 = 0;
      char v12 = &v11;
      uint64_t v13 = 0x2020000000;
      id v2 = (id *)getCVNLPCaptionScaleMethodCGInterpolationLowSymbolLoc_ptr;
      uint64_t v14 = getCVNLPCaptionScaleMethodCGInterpolationLowSymbolLoc_ptr;
      if (!getCVNLPCaptionScaleMethodCGInterpolationLowSymbolLoc_ptr)
      {
        id v4 = (void *)CVNLPLibrary();
        v12[3] = (uint64_t)dlsym(v4, "CVNLPCaptionScaleMethodCGInterpolationLow");
        getCVNLPCaptionScaleMethodCGInterpolationLowSymbolLoc_ptr = v12[3];
        id v2 = (id *)v12[3];
      }
      _Block_object_dispose(&v11, 8);
      if (v2) {
        goto LABEL_21;
      }
      __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
LABEL_10:
      uint64_t v11 = 0;
      char v12 = &v11;
      uint64_t v13 = 0x2020000000;
      id v2 = (id *)getCVNLPCaptionScaleMethodCGInterpolationMediumSymbolLoc_ptr;
      uint64_t v14 = getCVNLPCaptionScaleMethodCGInterpolationMediumSymbolLoc_ptr;
      if (!getCVNLPCaptionScaleMethodCGInterpolationMediumSymbolLoc_ptr)
      {
        uint64_t v5 = (void *)CVNLPLibrary();
        v12[3] = (uint64_t)dlsym(v5, "CVNLPCaptionScaleMethodCGInterpolationMedium");
        getCVNLPCaptionScaleMethodCGInterpolationMediumSymbolLoc_ptr = v12[3];
        id v2 = (id *)v12[3];
      }
      _Block_object_dispose(&v11, 8);
      if (!v2)
      {
        __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
LABEL_14:
        uint64_t v11 = 0;
        char v12 = &v11;
        uint64_t v13 = 0x2020000000;
        id v2 = (id *)getCVNLPCaptionScaleMethodCGInterpolationHighSymbolLoc_ptr;
        uint64_t v14 = getCVNLPCaptionScaleMethodCGInterpolationHighSymbolLoc_ptr;
        if (!getCVNLPCaptionScaleMethodCGInterpolationHighSymbolLoc_ptr)
        {
          id v6 = (void *)CVNLPLibrary();
          v12[3] = (uint64_t)dlsym(v6, "CVNLPCaptionScaleMethodCGInterpolationHigh");
          getCVNLPCaptionScaleMethodCGInterpolationHighSymbolLoc_ptr = v12[3];
          id v2 = (id *)v12[3];
        }
        _Block_object_dispose(&v11, 8);
        if (!v2)
        {
          __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
LABEL_18:
          uint64_t v11 = 0;
          char v12 = &v11;
          uint64_t v13 = 0x2020000000;
          id v2 = (id *)getCVNLPCaptionScaleMethodvImageSymbolLoc_ptr;
          uint64_t v14 = getCVNLPCaptionScaleMethodvImageSymbolLoc_ptr;
          if (!getCVNLPCaptionScaleMethodvImageSymbolLoc_ptr)
          {
            int v7 = (void *)CVNLPLibrary();
            v12[3] = (uint64_t)dlsym(v7, "CVNLPCaptionScaleMethodvImage");
            getCVNLPCaptionScaleMethodvImageSymbolLoc_ptr = v12[3];
            id v2 = (id *)v12[3];
          }
          _Block_object_dispose(&v11, 8);
          if (!v2)
          {
            id v10 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
            _Block_object_dispose(&v11, 8);
            _Unwind_Resume(v10);
          }
        }
      }
LABEL_21:
      id v8 = *v2;
LABEL_22:
      return v8;
    case 3uLL:
      goto LABEL_10;
    case 4uLL:
      goto LABEL_14;
    case 5uLL:
      goto LABEL_18;
    default:
      id v8 = 0;
      goto LABEL_22;
  }
}

- (id)_computeCaptionForPixelBuffer:(__CVBuffer *)a3 orImage:(CGImage *)a4 captionHandler:(CVNLPCaptionHandler *)a5 metrics:(id)a6
{
  id v9 = a6;
  id v10 = v9;
  uint64_t v28 = 0;
  if (a3)
  {
    uint64_t v11 = [v9 startMeasure:@"CVNLPCaptionCopyForCVPixelBuffer"];
    uint64_t v34 = 0;
    id v35 = &v34;
    uint64_t v36 = 0x2020000000;
    char v12 = (uint64_t (*)(CVNLPCaptionHandler *, __CVBuffer *, void, uint64_t *))getCVNLPCaptionCopyForCVPixelBufferSymbolLoc_ptr;
    uint64_t v37 = getCVNLPCaptionCopyForCVPixelBufferSymbolLoc_ptr;
    if (!getCVNLPCaptionCopyForCVPixelBufferSymbolLoc_ptr)
    {
      uint64_t v29 = MEMORY[0x1E4F143A8];
      uint64_t v30 = 3221225472;
      id v31 = __getCVNLPCaptionCopyForCVPixelBufferSymbolLoc_block_invoke;
      id v32 = &unk_1E6116AD8;
      v33 = &v34;
      uint64_t v13 = (void *)CVNLPLibrary();
      v35[3] = (uint64_t)dlsym(v13, "CVNLPCaptionCopyForCVPixelBuffer");
      getCVNLPCaptionCopyForCVPixelBufferSymbolLoc_ptr = *(_UNKNOWN **)(v33[1] + 24);
      char v12 = (uint64_t (*)(CVNLPCaptionHandler *, __CVBuffer *, void, uint64_t *))v35[3];
    }
    _Block_object_dispose(&v34, 8);
    if (v12)
    {
      uint64_t v14 = a5;
      v15 = a3;
      goto LABEL_10;
    }
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
LABEL_19:
    id v27 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    _Block_object_dispose(&v34, 8);
    _Unwind_Resume(v27);
  }
  uint64_t v11 = [v9 startMeasure:@"CVNLPCaptionCreateForImage"];
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v12 = (uint64_t (*)(CVNLPCaptionHandler *, __CVBuffer *, void, uint64_t *))getCVNLPCaptionCopyForImageSymbolLoc_ptr;
  uint64_t v37 = (void *)getCVNLPCaptionCopyForImageSymbolLoc_ptr;
  if (!getCVNLPCaptionCopyForImageSymbolLoc_ptr)
  {
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    id v31 = __getCVNLPCaptionCopyForImageSymbolLoc_block_invoke;
    id v32 = &unk_1E6116AD8;
    v33 = &v34;
    int v16 = (void *)CVNLPLibrary();
    v35[3] = (uint64_t)dlsym(v16, "CVNLPCaptionCopyForImage");
    getCVNLPCaptionCopyForImageSymbolLoc_ptr = *(void *)(v33[1] + 24);
    char v12 = (uint64_t (*)(CVNLPCaptionHandler *, __CVBuffer *, void, uint64_t *))v35[3];
  }
  _Block_object_dispose(&v34, 8);
  if (!v12) {
    goto LABEL_19;
  }
  uint64_t v14 = a5;
  v15 = a4;
LABEL_10:
  id v17 = (void *)v12(v14, v15, 0, &v28);
  [v11 endMeasurement];
  if (v28)
  {
    uint64_t v18 = AXMediaLogCommon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[AXMCaptionDetectorNode _computeCaptionForPixelBuffer:orImage:captionHandler:metrics:]((uint64_t)&v28, v18, v19, v20, v21, v22, v23, v24);
    }

    id v25 = 0;
  }
  else
  {
    id v25 = v17;
  }

  return v25;
}

- (AXMSceneDetectorNode)sceneDetector
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDetector);

  return (AXMSceneDetectorNode *)WeakRetained;
}

- (void)setSceneDetector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sceneDetector);
  objc_storeStrong((id *)&self->_languageTranslator, 0);
  objc_storeStrong((id *)&self->_effectiveModelURL, 0);
  objc_storeStrong((id *)&self->_effectiveCaptionModelInfo, 0);

  objc_storeStrong((id *)&self->_overrideModelURL, 0);
}

void __43__AXMCaptionDetectorNode_evaluate_metrics___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1B57D5000, v0, v1, "Caption handler is NULL", v2, v3, v4, v5, v6);
}

void __43__AXMCaptionDetectorNode_evaluate_metrics___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1B57D5000, v0, v1, "Could not extract CGImageRef or CVPixelBufferRef from pipeline context", v2, v3, v4, v5, v6);
}

void __43__AXMCaptionDetectorNode_evaluate_metrics___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1B57D5000, v0, v1, "Cannot run auxiliary scene detection, detector was nil.", v2, v3, v4, v5, v6);
}

void __43__AXMCaptionDetectorNode_evaluate_metrics___block_invoke_cold_9(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_withLock_captionModelURLCloningAssetIfNeeded
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1B57D5000, v0, v1, "Could not retrieve caption model asset URL", v2, v3, v4, v5, v6);
}

- (void)_withLock_cloneCaptionModelIfNeeded:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_withLock_cloneCaptionModelIfNeeded:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v6 = *__error();
  int v7 = __error();
  id v8 = strerror(*v7);
  int v9 = 138413314;
  uint64_t v10 = a1;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  __int16 v13 = 1024;
  int v14 = 1;
  __int16 v15 = 1024;
  int v16 = v6;
  __int16 v17 = 2080;
  uint64_t v18 = v8;
  _os_log_error_impl(&dword_1B57D5000, a3, OS_LOG_TYPE_ERROR, "Could not clone caption model. clonefile(%@, %@, %o) FAILED with (%d : %s) - trying copy", (uint8_t *)&v9, 0x2Cu);
}

- (void)_withLock_cloneCaptionModelIfNeeded:.cold.3()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_1B57D5000, v0, v1, "Could not create clone directory for caption model: %@. error: %@");
}

- (void)_withLock_cloneCaptionModelIfNeeded:.cold.4()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_1B57D5000, v0, v1, "Could not delete old clone directory for caption model: %@. error: %@");
}

- (void)_withLock_captionHandlerCreateIfNeeded:(uint64_t)a3 .cold.8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_computeCaptionForPixelBuffer:(uint64_t)a3 orImage:(uint64_t)a4 captionHandler:(uint64_t)a5 metrics:(uint64_t)a6 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end