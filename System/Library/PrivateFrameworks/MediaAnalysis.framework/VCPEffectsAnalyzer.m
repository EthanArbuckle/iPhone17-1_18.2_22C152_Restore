@interface VCPEffectsAnalyzer
+ (BOOL)isAutoLoopFramworkAvailable;
+ (BOOL)usePHAssetScene;
+ (id)gatingResultKeyToIndex;
+ (id)gatingTypeKeys;
+ (id)getResultIndex:(id)a3;
- (VCPEffectsAnalyzer)initWithAnalysisResults:(id)a3;
- (VCPEffectsAnalyzer)initWithFlagHasFaceOrPet:(BOOL)a3;
- (id)matchingNodeForSceneClassification:(id)a3 inSceneNames:(id)a4;
- (id)performanSceneClassificationOfImageFileAtURL:(id)a3;
- (int)analyzeAsset:(id)a3 onDemand:(BOOL)a4 cancel:(id)a5 statsFlags:(unint64_t *)a6 results:(id *)a7;
- (int)enumerateMatchingScenesOfAsset:(id)a3 forLongExposureUsingBlock:(id)a4;
- (unint64_t)generateStatsToBeCollectedFrom:(id)a3;
- (void)reportLivePhotoEffectAnalysisResults:(id)a3;
@end

@implementation VCPEffectsAnalyzer

- (VCPEffectsAnalyzer)initWithAnalysisResults:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"FaceResults"];
  if (v5)
  {
    BOOL v6 = 1;
  }
  else
  {
    v7 = [v4 objectForKeyedSubscript:@"PetsResults"];
    BOOL v6 = v7 != 0;
  }
  v8 = [(VCPEffectsAnalyzer *)self initWithFlagHasFaceOrPet:v6];

  return v8;
}

- (VCPEffectsAnalyzer)initWithFlagHasFaceOrPet:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VCPEffectsAnalyzer;
  id v4 = [(VCPEffectsAnalyzer *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_hasFaceOrPet = a3;
    BOOL v6 = v4;
  }

  return v5;
}

+ (BOOL)isAutoLoopFramworkAvailable
{
  if (isAutoLoopFramworkAvailable_once_token != -1) {
    dispatch_once(&isAutoLoopFramworkAvailable_once_token, &__block_literal_global_63);
  }
  return (isAutoLoopFramworkAvailable_available & 1) == 0;
}

void __49__VCPEffectsAnalyzer_isAutoLoopFramworkAvailable__block_invoke()
{
  uint64_t v2 = MEMORY[0x1E4F4F160];
  if (!MEMORY[0x1E4F4F160])
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v0 = VCPLogInstance();
      if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v1 = 0;
        _os_log_impl(&dword_1BBEDA000, v0, OS_LOG_TYPE_DEFAULT, "AutoLoop framework not available", v1, 2u);
      }
    }
    isAutoLoopFramworkAvailable_available = 1;
  }
}

+ (BOOL)usePHAssetScene
{
  return 1;
}

- (int)analyzeAsset:(id)a3 onDemand:(BOOL)a4 cancel:(id)a5 statsFlags:(unint64_t *)a6 results:(id *)a7
{
  BOOL v10 = a4;
  v126[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  if (+[VCPEffectsAnalyzer isAutoLoopFramworkAvailable])
  {
    if ([v12 isLivePhoto])
    {
      v14 = [v12 originalMovie];
      if (!v14)
      {
        v125 = @"LivePhotoEffectsResults";
        v122 = @"attributes";
        v120[0] = @"loopSuggestionState";
        v25 = [NSNumber numberWithUnsignedLongLong:0];
        v121[0] = v25;
        v120[1] = @"longExposureSuggestionState";
        v26 = [NSNumber numberWithUnsignedLongLong:0];
        v121[1] = v26;
        v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v121 forKeys:v120 count:2];
        v123 = v27;
        v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v123 forKeys:&v122 count:1];
        v124 = v28;
        v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v124 count:1];
        v126[0] = v29;
        *a7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v126 forKeys:&v125 count:1];

        int v24 = 0;
LABEL_48:

        goto LABEL_49;
      }
      v93 = a7;
      [MEMORY[0x1E4F1CA60] dictionary];
      v99 = v98 = v14;
      int v113 = 0;
      uint64_t v112 = 0;
      uint64_t AutoLoopSettingsForAsset = createAutoLoopSettingsForAsset();
      v15 = NSString;
      v16 = [MEMORY[0x1E4F29128] UUID];
      v17 = [v16 UUIDString];
      uint64_t v18 = [v15 stringWithFormat:@"autoloop-tmp-%@", v17];

      v19 = NSTemporaryDirectory();
      v94 = (void *)v18;
      v20 = [v19 stringByAppendingPathComponent:v18];

      v101 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v20];
      uint64_t BundleDefaultGatingClassifierURL = createBundleDefaultGatingClassifierURL();
      v22 = [v12 mainFileURL];
      if (v22)
      {
        uint64_t v23 = [v12 mainFileURL];
      }
      else
      {
        uint64_t v23 = 0;
      }

      uint64_t v30 = AutoLoopSettingsForAsset;
      CFTypeRef v96 = (CFTypeRef)v23;
      CFTypeRef cf = (CFTypeRef)BundleDefaultGatingClassifierURL;
      autoloopSettingsSetGating();
      v25 = v99;
      if (!v10)
      {
        autoloopSettingsSetOptimizeForMemoryUse();
        autoloopSettingsSetDisableStabilizationGPU();
      }
      v31 = [MEMORY[0x1E4F28CB8] defaultManager];
      if (![v31 fileExistsAtPath:v20])
      {
LABEL_23:
        id v110 = 0;
        int v40 = [v31 createDirectoryAtURL:v101 withIntermediateDirectories:1 attributes:0 error:&v110];
        id v95 = v110;
        if (!v40)
        {
          int v24 = -50;
          goto LABEL_27;
        }
        if (v113)
        {
          int v24 = 0;
LABEL_27:
          v41 = v94;
          goto LABEL_28;
        }
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __70__VCPEffectsAnalyzer_analyzeAsset_onDemand_cancel_statsFlags_results___block_invoke;
        aBlock[3] = &unk_1E629B9D0;
        id v109 = v13;
        v51 = _Block_copy(aBlock);
        *(_OWORD *)buf = xmmword_1BC283750;
        int v113 = runLiveAnalysisPipeline();
        v91 = v20;
        [NSString stringWithFormat:@"%@/%@", v20, @"gatingData.plist"];
        uint64_t v53 = v52 = v25;
        id v54 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        v92 = (void *)v53;
        uint64_t v55 = v53;
        v25 = v52;
        v90 = (void *)[v54 initWithContentsOfFile:v55];
        uint64_t v56 = [v90 objectForKeyedSubscript:@"gatingResults"];
        v57 = (void *)v56;
        if (!v113)
        {
          v88 = (void *)v56;
          v84 = v51;
          uint64_t v107 = 0;
          int GatingResult = getGatingResult();
          id v59 = 0;
          if (GatingResult == 1)
          {
            uint64_t v89 = 2;
            if (!self->_hasFaceOrPet && v88)
            {
              if ((int)MediaAnalysisLogLevel() >= 7)
              {
                v60 = VCPLogInstance();
                if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)v106 = 0;
                  _os_log_impl(&dword_1BBEDA000, v60, OS_LOG_TYPE_DEBUG, "Reading activity from gatingDataPlist.", v106, 2u);
                }
              }
              v61 = [v88 objectForKeyedSubscript:@"loopActivityDecision"];
              int v62 = [@"ALGatingResultPass" isEqualToString:v61];
              uint64_t v63 = 1;
              if (!v62) {
                uint64_t v63 = 2;
              }
              uint64_t v89 = v63;
            }
          }
          else
          {
            uint64_t v89 = 2;
          }
          uint64_t v105 = 0;
          uint64_t v64 = 2;
          int v65 = getGatingResult();
          id v87 = 0;
          if (v65 == 1)
          {
            if (self->_hasFaceOrPet)
            {
              uint64_t v64 = 2;
            }
            else
            {
              v66 = [MEMORY[0x1E4F1CA80] set];
              v103[0] = MEMORY[0x1E4F143A8];
              v103[1] = 3221225472;
              v103[2] = __70__VCPEffectsAnalyzer_analyzeAsset_onDemand_cancel_statsFlags_results___block_invoke_255;
              v103[3] = &unk_1E629B9F8;
              id v67 = v66;
              id v104 = v67;
              [(VCPEffectsAnalyzer *)self enumerateMatchingScenesOfAsset:v12 forLongExposureUsingBlock:v103];
              uint64_t v68 = [v67 count];
              if (v68) {
                uint64_t v64 = 1;
              }
              else {
                uint64_t v64 = 2;
              }
              if (v68 && v10)
              {
                [v67 allObjects];
                v69 = uint64_t v85 = v64;
                [v25 setObject:v69 forKeyedSubscript:@"livePhotoEffectsMatchingScenes"];

                uint64_t v64 = v85;
              }
            }
          }
          uint64_t v86 = v64;
          if (v10)
          {
            v102[1] = 0;
            getGatingResult();
            id v70 = 0;
            v71 = [MEMORY[0x1E4F1CA60] dictionary];
            if (v59)
            {
              v72 = [&unk_1F15ED5D8 stringValue];
              [v71 setObject:v59 forKeyedSubscript:v72];
            }
            if (v70)
            {
              v73 = [&unk_1F15ED5F0 stringValue];
              [v71 setObject:v70 forKeyedSubscript:v73];
            }
            if (v87)
            {
              v74 = [&unk_1F15ED608 stringValue];
              [v71 setObject:v87 forKeyedSubscript:v74];
            }
            [v99 setObject:v71 forKeyedSubscript:@"livePhotoEffectsGatingDescriptions"];

            v25 = v99;
          }
          v75 = [NSNumber numberWithUnsignedLongLong:v89];
          [v25 setObject:v75 forKey:@"loopSuggestionState"];

          v76 = [NSNumber numberWithUnsignedLongLong:v86];
          [v25 setObject:v76 forKey:@"longExposureSuggestionState"];

          v77 = liveAnalysisResultToDictionary();
          if (v77 && (v10 || v89 == 1 || v86 == 1))
          {
            v78 = +[VCPProtoLivePhotoEffectsRecipe resultFromLegacyDictionary:v77];
            uint64_t v79 = [v78 data];
            if (!v79)
            {

              int v24 = -50;
              v41 = v94;
              uint64_t v30 = AutoLoopSettingsForAsset;
              v51 = v84;
LABEL_90:
              v20 = v91;

LABEL_28:
              if (v112) {
                liveAnalysisResultDestroy();
              }
              if (cf) {
                CFRelease(cf);
              }
              if (v96) {
                CFRelease(v96);
              }
              if (v30) {
                autoloopSettingsDestroy();
              }
              if (![v31 fileExistsAtPath:v20]) {
                goto LABEL_47;
              }
              v102[0] = 0;
              char v42 = [v31 removeItemAtPath:v20 error:v102];
              id v43 = v102[0];
              int v44 = MediaAnalysisLogLevel();
              if (v42)
              {
                if (v44 >= 7)
                {
                  v45 = VCPLogInstance();
                  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
                  {
                    *(_WORD *)buf = 0;
                    v46 = "Autoloop working directory removed";
                    v47 = v45;
                    os_log_type_t v48 = OS_LOG_TYPE_DEBUG;
                    uint32_t v49 = 2;
LABEL_44:
                    _os_log_impl(&dword_1BBEDA000, v47, v48, v46, buf, v49);
                    goto LABEL_45;
                  }
                  goto LABEL_45;
                }
              }
              else if (v44 >= 4)
              {
                v45 = VCPLogInstance();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&buf[4] = v43;
                  v46 = "Failed to remove Autoloop working directory (%@)";
                  v47 = v45;
                  os_log_type_t v48 = OS_LOG_TYPE_DEFAULT;
                  uint32_t v49 = 12;
                  goto LABEL_44;
                }
LABEL_45:
              }
LABEL_47:

              v14 = v98;
              goto LABEL_48;
            }
            v80 = (void *)v79;
            [v25 setObject:v79 forKey:@"livePhotoEffectsRecipe"];
          }
          uint64_t v30 = AutoLoopSettingsForAsset;
          v51 = v84;
          v57 = v88;
        }
        *a6 |= [(VCPEffectsAnalyzer *)self generateStatsToBeCollectedFrom:v57];
        [(VCPEffectsAnalyzer *)self reportLivePhotoEffectAnalysisResults:v57];
        if ([v25 count])
        {
          v117 = @"LivePhotoEffectsResults";
          v114 = @"attributes";
          v115 = v25;
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v115 forKeys:&v114 count:1];
          v82 = v81 = v51;
          v116 = v82;
          v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v116 count:1];
          v118 = v83;
          id *v93 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v118 forKeys:&v117 count:1];

          v51 = v81;
        }

        int v24 = 0;
        v41 = v94;
        goto LABEL_90;
      }
      id v111 = 0;
      char v32 = [v31 removeItemAtPath:v20 error:&v111];
      id v33 = v111;
      int v34 = MediaAnalysisLogLevel();
      if (v32)
      {
        if (v34 >= 7)
        {
          v35 = VCPLogInstance();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            v36 = "Existing Autoloop working directory removed";
            v37 = v35;
            os_log_type_t v38 = OS_LOG_TYPE_DEBUG;
            uint32_t v39 = 2;
LABEL_20:
            _os_log_impl(&dword_1BBEDA000, v37, v38, v36, buf, v39);
            goto LABEL_21;
          }
          goto LABEL_21;
        }
      }
      else if (v34 >= 4)
      {
        v35 = VCPLogInstance();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v33;
          v36 = "Failed to remove existing Autoloop working directory (%@)";
          v37 = v35;
          os_log_type_t v38 = OS_LOG_TYPE_DEFAULT;
          uint32_t v39 = 12;
          goto LABEL_20;
        }
LABEL_21:

        v25 = v99;
      }

      uint64_t v30 = AutoLoopSettingsForAsset;
      goto LABEL_23;
    }
    int v24 = 0;
  }
  else
  {
    int v24 = -18;
  }
LABEL_49:

  return v24;
}

uint64_t __70__VCPEffectsAnalyzer_analyzeAsset_onDemand_cancel_statsFlags_results___block_invoke(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))() ^ 1;
}

uint64_t __70__VCPEffectsAnalyzer_analyzeAsset_onDemand_cancel_statsFlags_results___block_invoke_255(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) addObject:a2];
  *a3 = 1;
  return result;
}

- (id)matchingNodeForSceneClassification:(id)a3 inSceneNames:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__41;
  v21 = __Block_byref_object_dispose__41;
  id v22 = 0;
  v7 = objc_msgSend(MEMORY[0x1E4F8CD58], "vcp_sharedTaxonomy");
  objc_super v8 = objc_msgSend(v7, "nodeForSceneClassId:", objc_msgSend(v5, "sceneIdentifier"));

  if (v8 && ([v5 confidence], double v10 = v9, objc_msgSend(v8, "searchThreshold"), v10 >= v11))
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __70__VCPEffectsAnalyzer_matchingNodeForSceneClassification_inSceneNames___block_invoke;
    v14[3] = &unk_1E629BA20;
    id v15 = v6;
    v16 = &v17;
    [v8 traverse:0 visitor:v14];
    id v12 = (id)v18[5];
  }
  else
  {
    id v12 = 0;
  }

  _Block_object_dispose(&v17, 8);
  return v12;
}

uint64_t __70__VCPEffectsAnalyzer_matchingNodeForSceneClassification_inSceneNames___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = *(void **)(a1 + 32);
  id v6 = [v4 name];
  uint64_t v7 = [v5 containsObject:v6];

  if (v7) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }

  return v7;
}

- (id)performanSceneClassificationOfImageFileAtURL:(id)a3
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v30 = [MEMORY[0x1E4F1CA48] array];
  id v4 = (void *)MEMORY[0x1C186D320]();
  id v5 = objc_alloc(MEMORY[0x1E4F45890]);
  uint64_t v6 = [v5 initWithURL:v3 options:MEMORY[0x1E4F1CC08]];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    id v8 = objc_alloc_init(MEMORY[0x1E4F45948]);
    double v9 = v8;
    if (v8)
    {
      [v8 setPreferBackgroundProcessing:1];
      [v9 setRevision:2];
      v36[0] = v9;
      double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
      int v11 = [v7 performRequests:v10 error:0];

      id v12 = 0;
      if (v11)
      {
        v28 = v4;
        id v29 = v3;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v13 = [v9 results];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v32;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v32 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
              uint64_t v19 = objc_msgSend(MEMORY[0x1E4F8CD58], "vcp_sharedTaxonomy");
              v20 = [v18 identifier];
              v21 = [v19 nodeForName:v20];

              id v22 = (void *)MEMORY[0x1E4F39288];
              uint64_t v23 = [v21 extendedSceneClassId];
              [v18 confidence];
              v25 = objc_msgSend(v22, "vcp_instanceWithExtendedSceneIdentifier:confidence:", v23, v24);
              [v30 addObject:v25];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
          }
          while (v15);
        }

        id v3 = v29;
        id v12 = v30;
        id v4 = v28;
      }
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }
  id v26 = v12;

  return v26;
}

- (int)enumerateMatchingScenesOfAsset:(id)a3 forLongExposureUsingBlock:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, unsigned char *))a4;
  if (v7)
  {
    id v8 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F15EE568];
    uint64_t v9 = [v6 localIdentifier];
    if (!v9
      || (double v10 = (void *)v9,
          BOOL v11 = +[VCPEffectsAnalyzer usePHAssetScene],
          v10,
          !v11)
      || ([v6 allScenes], (id v12 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v13 = [v6 mainFileURL];
      id v12 = [(VCPEffectsAnalyzer *)self performanSceneClassificationOfImageFileAtURL:v13];
    }
    id v24 = v6;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v14 = v12;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = -[VCPEffectsAnalyzer matchingNodeForSceneClassification:inSceneNames:](self, "matchingNodeForSceneClassification:inSceneNames:", *(void *)(*((void *)&v26 + 1) + 8 * i), v8, v24);
          v20 = v19;
          if (v19)
          {
            char v25 = 0;
            v21 = [v19 name];
            v7[2](v7, v21, &v25);

            if (v25)
            {

              goto LABEL_18;
            }
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
LABEL_18:

    int v22 = 0;
    id v6 = v24;
  }
  else
  {
    int v22 = -50;
  }

  return v22;
}

+ (id)gatingTypeKeys
{
  if (gatingTypeKeys_once != -1) {
    dispatch_once(&gatingTypeKeys_once, &__block_literal_global_292);
  }
  uint64_t v2 = (void *)gatingTypeKeys_gatingTypeKeys;
  return v2;
}

void __36__VCPEffectsAnalyzer_gatingTypeKeys__block_invoke()
{
  v2[12] = *MEMORY[0x1E4F143B8];
  v2[0] = @"mShortInputDecision";
  v2[1] = @"mPreGateStillMetadataDecision";
  v2[2] = @"mPreGateVideoTrimDecision";
  v2[3] = @"mPreGateVideoMLDecision";
  v2[4] = @"mPreGateFacesDecision";
  v2[5] = @"stabilizeGateDecision";
  v2[6] = @"postGateDecision";
  v2[7] = @"finalDecision";
  v2[8] = @"loopActivityDecision";
  v2[9] = @"bounceActivityDecision";
  v2[10] = @"longexpActivityDecision";
  v2[11] = @"stabilizeResult";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:12];
  v1 = (void *)gatingTypeKeys_gatingTypeKeys;
  gatingTypeKeys_gatingTypeKeys = v0;
}

+ (id)gatingResultKeyToIndex
{
  if (gatingResultKeyToIndex_once != -1) {
    dispatch_once(&gatingResultKeyToIndex_once, &__block_literal_global_294);
  }
  uint64_t v2 = (void *)gatingResultKeyToIndex_gatingResultKeyToIndex;
  return v2;
}

void __44__VCPEffectsAnalyzer_gatingResultKeyToIndex__block_invoke()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"ALGatingResultError";
  v2[1] = @"ALGatingResultUnset";
  v3[0] = &unk_1F15ED620;
  v3[1] = &unk_1F15ED638;
  v2[2] = @"ALGatingResultFail";
  v2[3] = @"ALGatingResultPass";
  v3[2] = &unk_1F15ED650;
  v3[3] = &unk_1F15ED668;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:4];
  v1 = (void *)gatingResultKeyToIndex_gatingResultKeyToIndex;
  gatingResultKeyToIndex_gatingResultKeyToIndex = v0;
}

+ (id)getResultIndex:(id)a3
{
  id v3 = &unk_1F15ED680;
  if (a3)
  {
    id v4 = a3;
    id v5 = +[VCPEffectsAnalyzer gatingResultKeyToIndex];
    id v6 = [v5 objectForKeyedSubscript:v4];

    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = &unk_1F15ED680;
    }
    id v3 = v7;
  }
  return v3;
}

- (void)reportLivePhotoEffectAnalysisResults:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__VCPEffectsAnalyzer_reportLivePhotoEffectAnalysisResults___block_invoke;
  aBlock[3] = &unk_1E629BA48;
  id v12 = v5;
  id v13 = self;
  id v14 = v4;
  id v6 = v4;
  id v7 = v5;
  id v8 = (void (**)(void *, __CFString *, __CFString *))_Block_copy(aBlock);
  uint64_t v9 = [v6 objectForKeyedSubscript:@"stabilizeResult"];
  [v7 setObject:v9 forKeyedSubscript:@"LivePhotoEffectsStabilizeResult"];

  v8[2](v8, @"LivePhotoEffectsShortInputDecision", @"mShortInputDecision");
  v8[2](v8, @"LivePhotoEffectsPreGateStillMetadataDecision", @"mPreGateStillMetadataDecision");
  v8[2](v8, @"LivePhotoEffectsPreGateVideoTrimDecision", @"mPreGateVideoTrimDecision");
  v8[2](v8, @"LivePhotoEffectsPreGateVideoMLDecision", @"mPreGateVideoMLDecision");
  v8[2](v8, @"LivePhotoEffectsPreGateFacesDecision", @"mPreGateFacesDecision");
  v8[2](v8, @"LivePhotoEffectsStabilizeGateDecision", @"stabilizeGateDecision");
  v8[2](v8, @"LivePhotoEffectsPostGateDecision", @"postGateDecision");
  v8[2](v8, @"LivePhotoEffectsFinalGateDecision", @"finalDecision");
  v8[2](v8, @"LivePhotoEffectsLoopActivityDecision", @"loopActivityDecision");
  v8[2](v8, @"LivePhotoEffectsBounceActivityDecision", @"bounceActivityDecision");
  v8[2](v8, @"LivePhotoEffectsLongexpActivityDecision", @"longexpActivityDecision");
  double v10 = +[VCPMADCoreAnalyticsManager sharedManager];
  [v10 sendEvent:@"com.apple.mediaanalysisd.livephotoeffectanalysisresults" withAnalytics:v7];
}

void __59__VCPEffectsAnalyzer_reportLivePhotoEffectAnalysisResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = objc_opt_class();
  id v9 = [*(id *)(a1 + 48) objectForKeyedSubscript:v5];

  id v8 = [v7 getResultIndex:v9];
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v6];
}

- (unint64_t)generateStatsToBeCollectedFrom:(id)a3
{
  id v3 = a3;
  id v4 = +[VCPEffectsAnalyzer gatingTypeKeys];
  uint64_t v17 = +[VCPEffectsAnalyzer gatingResultKeyToIndex];
  if ([v4 count])
  {
    uint64_t v5 = 0;
    unint64_t v6 = 2;
    while (1)
    {
      id v7 = [v4 objectAtIndexedSubscript:v5];
      uint64_t v8 = MediaAnalysisLivePhotoGatingResultKeyToType(v7);
      if (v8)
      {
        char v9 = v8;
        int v10 = [v7 isEqualToString:@"stabilizeResult"];
        BOOL v11 = [v3 objectForKeyedSubscript:v7];
        id v12 = v11;
        if (v10)
        {
          uint64_t v13 = [v11 integerValue];

          unint64_t v14 = v13 + 3;
          if (v14 >= 8) {
            goto LABEL_12;
          }
        }
        else
        {
          uint64_t v15 = [v17 objectForKeyedSubscript:v11];
          unint64_t v14 = [v15 integerValue];

          if (v14 > 3)
          {
LABEL_12:

            unint64_t v6 = 0;
            goto LABEL_13;
          }
        }
        v6 |= 1 << v9 << v14;
      }

      if ([v4 count] <= (unint64_t)++v5) {
        goto LABEL_13;
      }
    }
  }
  unint64_t v6 = 2;
LABEL_13:

  return v6;
}

@end