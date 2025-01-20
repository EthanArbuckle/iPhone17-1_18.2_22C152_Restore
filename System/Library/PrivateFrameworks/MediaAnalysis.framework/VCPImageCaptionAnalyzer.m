@interface VCPImageCaptionAnalyzer
+ (BOOL)greedySearchEnabled;
+ (BOOL)useVCPMobileAssetAXCaptionModel;
+ (BOOL)writeSpatialEmbeddingToFile;
+ (id)sharedCSUCaptionerWithConfig:(id)a3 identifier:(id)a4;
+ (id)sharedCVNLPCaptionHandlerWithOptions:(id)a3 identifier:(id)a4;
- (BOOL)containPotentialUnsafeContent:(__CVBuffer *)a3;
- (VCPImageCaptionAnalyzer)init;
- (VCPImageCaptionAnalyzer)initWithCaptionModelType:(int64_t)a3 captionSafetyType:(int64_t)a4 useSharedModel:(BOOL)a5;
- (int)analyzeEmbedding:(id)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6;
- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6;
- (void)dealloc;
@end

@implementation VCPImageCaptionAnalyzer

+ (BOOL)greedySearchEnabled
{
  return 0;
}

+ (BOOL)useVCPMobileAssetAXCaptionModel
{
  return 0;
}

+ (BOOL)writeSpatialEmbeddingToFile
{
  return 0;
}

- (VCPImageCaptionAnalyzer)initWithCaptionModelType:(int64_t)a3 captionSafetyType:(int64_t)a4 useSharedModel:(BOOL)a5
{
  v58[5] = *MEMORY[0x1E4F143B8];
  v54.receiver = self;
  v54.super_class = (Class)VCPImageCaptionAnalyzer;
  v8 = [(VCPImageCaptionAnalyzer *)&v54 init];
  v9 = v8;
  if (v8)
  {
    v8->_modelType = a3;
    v8->_safetyType = a4;
    v8->_rescaledImageBuffer = 0;
    v8->_useSharedModel = a5;
    switch(a3)
    {
      case 1:
        if ([(id)objc_opt_class() useVCPMobileAssetAXCaptionModel])
        {
          v10 = +[VCPMobileAssetManager sharedManager];
          v11 = [v10 retrieveAssetOnce:0 petWatchDog:0 cancelBlock:0];
        }
        else
        {
          v34 = [MEMORY[0x1E4F487E8] sharedInstance];
          v10 = [v34 modelURLForType:0 timeout:0.5];

          if (!v10)
          {
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              v21 = VCPLogInstance();
              if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
                goto LABEL_49;
              }
              *(_WORD *)buf = 0;
              v47 = "[ImageCaption] Accessibility image caption model mobile asset not available";
              goto LABEL_65;
            }
LABEL_66:
            v11 = 0;
            goto LABEL_67;
          }
          v35 = +[VCPMobileAssetManager sharedManager];
          v11 = [v35 cloneAsset:v10 to:@"ClonedImageCaptionModel"];
        }
        if (v11)
        {
          v36 = [MEMORY[0x1E4F28CB8] defaultManager];
          v37 = [v11 path];
          char v38 = [v36 fileExistsAtPath:v37];

          if (v38)
          {
            uint64_t v39 = *MEMORY[0x1E4F566F0];
            v57[0] = *MEMORY[0x1E4F566F8];
            v57[1] = v39;
            v58[0] = v11;
            v58[1] = @"en-US";
            uint64_t v40 = *MEMORY[0x1E4F56708];
            v57[2] = *MEMORY[0x1E4F566E0];
            v57[3] = v40;
            uint64_t v41 = *MEMORY[0x1E4F56700];
            v58[2] = &unk_1F15EDD28;
            v58[3] = v41;
            v57[4] = *MEMORY[0x1E4F566E8];
            v58[4] = MEMORY[0x1E4F1CC28];
            v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:5];
            v42 = NSString;
            v43 = [v11 absoluteString];
            v44 = [v42 stringWithFormat:@"%@_%@", @"CVNLPImageCaptionHandler", v43];

            if (v9->_useSharedModel) {
              uint64_t v45 = [(id)objc_opt_class() sharedCVNLPCaptionHandlerWithOptions:v21 identifier:v44];
            }
            else {
              uint64_t v45 = CVNLPCaptionHandlerCreate();
            }
            v9->_captionHandlerRef = (CVNLPCaptionHandler *)v45;
            if (v45)
            {

              v12 = v9;
              goto LABEL_51;
            }
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              v48 = VCPLogInstance();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1BBEDA000, v48, OS_LOG_TYPE_ERROR, "[ImageCaption] Failed to create CVNLPCaptionHandlerRef", buf, 2u);
              }
            }
LABEL_50:
            v12 = 0;
LABEL_51:

LABEL_52:
            goto LABEL_53;
          }
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v21 = VCPLogInstance();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_ERROR, "Local image caption model not exists", buf, 2u);
            }
            goto LABEL_50;
          }
LABEL_67:
          v12 = 0;
          goto LABEL_52;
        }
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v21 = VCPLogInstance();
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            goto LABEL_49;
          }
          *(_WORD *)buf = 0;
          v47 = "[ImageCaption] Fail cloning image caption model to local path";
LABEL_65:
          _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_ERROR, v47, buf, 2u);
          goto LABEL_49;
        }
        goto LABEL_66;
      case 2:
        v15 = +[VCPMobileAssetManager sharedManager];
        v16 = [v15 retrieveAssetOnce:1 petWatchDog:0 cancelBlock:0];

        if (v16)
        {
          v17 = [v16 URLByAppendingPathComponent:@"ImageCaptioning.config.json"];
          v18 = (void *)MEMORY[0x1E4F5D078];
          v19 = [v17 path];
          id v49 = 0;
          uint64_t v20 = [v18 createCSUImageCaptionerConfigurationWithConfigPath:v19 error:&v49];
          v21 = v49;
          captionerConfig = v9->_captionerConfig;
          v9->_captionerConfig = (CSUImageCaptionerConfiguration *)v20;

          v23 = @"CSUImageCaptioner_AX_CSU";
          goto LABEL_21;
        }
        if ((int)MediaAnalysisLogLevel() < 3)
        {
          v21 = 0;
          goto LABEL_49;
        }
        v31 = VCPLogInstance();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v31, OS_LOG_TYPE_ERROR, "[ImageCaption] VCPMobileAsset_ImageCaption_AX_CSU model download failed", buf, 2u);
        }
        v21 = 0;
        goto LABEL_48;
      case 3:
        if (_os_feature_enabled_impl())
        {
          v53 = 0;
          uint64_t v24 = [MEMORY[0x1E4F5D078] CSUImageCaptionerConfigurationForRevision:6 error:&v53];
          v25 = v53;
        }
        else
        {
          v52 = 0;
          uint64_t v24 = [MEMORY[0x1E4F5D078] CSUImageCaptionerConfigurationForRevision:5 error:&v52];
          v25 = v52;
        }
        v21 = v25;
        v16 = v9->_captionerConfig;
        v9->_captionerConfig = (CSUImageCaptionerConfiguration *)v24;
        v23 = @"CSUImageCaptioner_MiCa";
        goto LABEL_21;
      case 4:
        if (_os_feature_enabled_impl())
        {
          id v51 = 0;
          uint64_t v26 = [MEMORY[0x1E4F5D078] CSUImageCaptionerConfigurationForRevision:7 error:&v51];
          v21 = v51;
          v16 = v9->_captionerConfig;
          v9->_captionerConfig = (CSUImageCaptionerConfiguration *)v26;
          v23 = @"CSUImageCaptioner_MiCa_SafeCaption";
          goto LABEL_21;
        }
        v21 = 0;
        v23 = @"CSUImageCaptioner_MiCa_SafeCaption";
        goto LABEL_22;
      case 5:
        if (_os_feature_enabled_impl())
        {
          id v50 = 0;
          uint64_t v27 = [MEMORY[0x1E4F5D078] CSUImageCaptionerConfigurationForRevision:8 error:&v50];
          v21 = v50;
          v16 = v9->_captionerConfig;
          v9->_captionerConfig = (CSUImageCaptionerConfiguration *)v27;
          v23 = @"CSUImageCaptioner_MiCa_GP";
LABEL_21:
        }
        else
        {
          v21 = 0;
          v23 = @"CSUImageCaptioner_MiCa_GP";
        }
LABEL_22:
        if (v9->_captionerConfig) {
          BOOL v28 = v21 == 0;
        }
        else {
          BOOL v28 = 0;
        }
        if (v28)
        {
          if (v9->_useSharedModel)
          {
            uint64_t v29 = [(id)objc_opt_class() sharedCSUCaptionerWithConfig:v9->_captionerConfig identifier:v23];
          }
          else
          {
            uint64_t v29 = [objc_alloc(MEMORY[0x1E4F5D070]) initWithConfiguration:v9->_captionerConfig];
          }
          imageCaptioner = v9->_imageCaptioner;
          v9->_imageCaptioner = (CSUImageCaptioner *)v29;
        }
        if (v9->_imageCaptioner)
        {
          v11 = v21;
          v12 = v9;
          goto LABEL_52;
        }
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v31 = VCPLogInstance();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            id v32 = [v21 description];
            uint64_t v33 = [v32 UTF8String];
            *(_DWORD *)buf = 136315138;
            int64_t v56 = v33;
            _os_log_impl(&dword_1BBEDA000, v31, OS_LOG_TYPE_ERROR, "[ImageCaption] Failed to create CSUImageCaptioner: (%s)", buf, 0xCu);
          }
LABEL_48:
        }
LABEL_49:
        v11 = 0;
        goto LABEL_50;
      default:
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v13 = VCPLogInstance();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            int64_t v56 = a3;
            _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_ERROR, "[ImageCaption] Init fails with unsupported MADImageCaptionModelType: %ld", buf, 0xCu);
          }
        }
        v14 = 0;
        goto LABEL_54;
    }
  }
  v12 = 0;
LABEL_53:
  v14 = v12;
LABEL_54:

  return v14;
}

- (VCPImageCaptionAnalyzer)init
{
  return [(VCPImageCaptionAnalyzer *)self initWithCaptionModelType:1 captionSafetyType:0 useSharedModel:1];
}

- (void)dealloc
{
  rescaledImageBuffer = self->_rescaledImageBuffer;
  if (rescaledImageBuffer)
  {
    CFRelease(rescaledImageBuffer);
    self->_rescaledImageBuffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPImageCaptionAnalyzer;
  [(VCPImageCaptionAnalyzer *)&v4 dealloc];
}

+ (id)sharedCSUCaptionerWithConfig:(id)a3 identifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    v8 = +[VCPSharedInstanceManager sharedManager];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67__VCPImageCaptionAnalyzer_sharedCSUCaptionerWithConfig_identifier___block_invoke;
    v11[3] = &unk_1E629D038;
    id v12 = v7;
    id v13 = v5;
    v9 = [v8 sharedInstanceWithIdentifier:v12 andCreationBlock:v11];

LABEL_8:
    goto LABEL_10;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v8 = VCPLogInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_ERROR, "[ImageCaption] Initiating captioner with nil config or identifier", buf, 2u);
    }
    v9 = 0;
    goto LABEL_8;
  }
  v9 = 0;
LABEL_10:

  return v9;
}

id __67__VCPImageCaptionAnalyzer_sharedCSUCaptionerWithConfig_identifier___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v2 = VCPLogInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      int v7 = 138412546;
      uint64_t v8 = v3;
      __int16 v9 = 2112;
      uint64_t v10 = v4;
      _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_INFO, "[ImageCaption] Initiating captioner:%@ with config:%@", (uint8_t *)&v7, 0x16u);
    }
  }
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F5D070]) initWithConfiguration:*(void *)(a1 + 40)];
  return v5;
}

+ (id)sharedCVNLPCaptionHandlerWithOptions:(id)a3 identifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = v6;
  if (v5 && v6)
  {
    uint64_t v8 = +[VCPSharedInstanceManager sharedManager];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__VCPImageCaptionAnalyzer_sharedCVNLPCaptionHandlerWithOptions_identifier___block_invoke;
    v11[3] = &unk_1E629B308;
    id v12 = v5;
    __int16 v9 = [v8 sharedInstanceWithIdentifier:v7 andCreationBlock:v11];

LABEL_8:
    goto LABEL_10;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    uint64_t v8 = VCPLogInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_ERROR, "[ImageCaption] Initiating CVNLPCaptionHandler with nil options or identifier", buf, 2u);
    }
    __int16 v9 = 0;
    goto LABEL_8;
  }
  __int16 v9 = 0;
LABEL_10:

  return v9;
}

id __75__VCPImageCaptionAnalyzer_sharedCVNLPCaptionHandlerWithOptions_identifier___block_invoke()
{
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v0 = VCPLogInstance();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_1BBEDA000, v0, OS_LOG_TYPE_INFO, "[ImageCaption] Initiating CVNLPCaptionHandler", v3, 2u);
    }
  }
  v1 = CVNLPCaptionHandlerCreate();
  return v1;
}

- (BOOL)containPotentialUnsafeContent:(__CVBuffer *)a3
{
  v81[1] = *MEMORY[0x1E4F143B8];
  if (self->_safetyType != 1) {
    return 0;
  }
  uint64_t v80 = *MEMORY[0x1E4F9A670];
  v81[0] = MEMORY[0x1E4F1CC38];
  v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:&v80 count:1];
  id v70 = 0;
  int64_t v56 = (void *)[objc_alloc(MEMORY[0x1E4F9A610]) initWithOptions:v59 error:0];
  uint64_t v4 = [v56 classifyPixelBuffer:a3 error:&v70];
  double v60 = COERCE_DOUBLE(v70);
  if (v60 != 0.0 && (int)MediaAnalysisLogLevel() >= 3)
  {
    id v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      double v73 = v60;
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_ERROR, "[ImageCaption] Error calling into SCML: %@", buf, 0xCu);
    }
  }
  if (v4 != 1)
  {
    v58 = objc_alloc_init(MEMORY[0x1E4F456A0]);
    [v58 setRevision:2];
    id v55 = objc_alloc_init(MEMORY[0x1E4F45988]);
    id v8 = objc_alloc_init(MEMORY[0x1E4F456F8]);
    id v69 = 0;
    char v9 = [v8 setRevision:3737841669 error:&v69];
    id v53 = v69;
    if ((v9 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        uint64_t v10 = VCPLogInstance();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "[ImageCaption] Failed to set revision for meme identification", buf, 2u);
        }
      }
      id v8 = 0;
    }
    v52 = v8;
    id v11 = objc_alloc(MEMORY[0x1E4F45890]);
    id v12 = (void *)[v11 initWithCVPixelBuffer:a3 orientation:1 options:MEMORY[0x1E4F1CC08]];
    v79[0] = v58;
    v79[1] = v55;
    v79[2] = v8;
    id v51 = v12;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:3];
    [v12 performRequests:v13 error:0];

    v57 = [MEMORY[0x1E4F1CA48] array];
    v14 = [v58 results];
    [v57 addObjectsFromArray:v14];

    v15 = [v55 results];
    [v57 addObjectsFromArray:v15];

    uint64_t v16 = *MEMORY[0x1E4F45D08];
    v77[0] = *MEMORY[0x1E4F45A28];
    v77[1] = v16;
    v78[0] = &unk_1F15EADC8;
    v78[1] = &unk_1F15EADD8;
    uint64_t v17 = *MEMORY[0x1E4F45B20];
    v77[2] = *MEMORY[0x1E4F45A58];
    v77[3] = v17;
    v78[2] = &unk_1F15EADE8;
    v78[3] = &unk_1F15EADF8;
    uint64_t v18 = *MEMORY[0x1E4F45A08];
    v77[4] = *MEMORY[0x1E4F45D30];
    v77[5] = v18;
    v78[4] = &unk_1F15EAE08;
    v78[5] = &unk_1F15EAE08;
    uint64_t v19 = *MEMORY[0x1E4F45A20];
    v77[6] = *MEMORY[0x1E4F45D50];
    v77[7] = v19;
    v78[6] = &unk_1F15EAE18;
    v78[7] = &unk_1F15EAE18;
    v77[8] = *MEMORY[0x1E4F45B40];
    v78[8] = &unk_1F15EADF8;
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:v77 count:9];
    v21 = [v20 allKeys];
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v22 = v57;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v65 objects:v76 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v66;
LABEL_20:
      uint64_t v25 = 0;
      while (1)
      {
        if (*(void *)v66 != v24) {
          objc_enumerationMutation(v22);
        }
        uint64_t v26 = *(void **)(*((void *)&v65 + 1) + 8 * v25);
        uint64_t v27 = [v26 identifier];
        [v26 confidence];
        float v29 = v28;
        v30 = [v20 objectForKeyedSubscript:v27];
        [v30 floatValue];
        float v32 = v31;

        char v33 = [v21 containsObject:v27];
        char v34 = v29 > v32 ? v33 : 0;
        if (v34) {
          break;
        }

        if (v23 == ++v25)
        {
          uint64_t v23 = [v22 countByEnumeratingWithState:&v65 objects:v76 count:16];
          if (v23) {
            goto LABEL_20;
          }
          goto LABEL_29;
        }
      }
      if ((int)MediaAnalysisLogLevel() < 6)
      {
        id obj = v22;
        goto LABEL_52;
      }
      v46 = VCPLogInstance();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        double v73 = v29;
        __int16 v74 = 2048;
        double v75 = v32;
        _os_log_impl(&dword_1BBEDA000, v46, OS_LOG_TYPE_INFO, "[ImageCaption] This image looks unsafe with confidence %f/%f. Don't caption this image.", buf, 0x16u);
      }
      id obj = v22;
    }
    else
    {
LABEL_29:

      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      v35 = [v52 results];
      uint64_t v36 = [v35 countByEnumeratingWithState:&v61 objects:v71 count:16];
      if (!v36)
      {
        int v7 = 0;
LABEL_54:

        goto LABEL_55;
      }
      id obj = v35;
      uint64_t v37 = *(void *)v62;
LABEL_31:
      uint64_t v38 = 0;
      while (1)
      {
        if (*(void *)v62 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v39 = *(void **)(*((void *)&v61 + 1) + 8 * v38);
        uint64_t v27 = [v39 identifier];
        [v39 confidence];
        float v41 = v40;
        int v42 = [&unk_1F15EE7D8 containsObject:v27];
        int v43 = v41 > 0.2 ? v42 : 0;
        if (v43 == 1) {
          break;
        }
        int v44 = [&unk_1F15EE7F0 containsObject:v27];
        if (v41 > 0.15) {
          int v45 = v44;
        }
        else {
          int v45 = 0;
        }
        if (v45 == 1)
        {
          if ((int)MediaAnalysisLogLevel() < 6) {
            goto LABEL_52;
          }
          v46 = VCPLogInstance();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            v48 = "[ImageCaption] The junk filter has determined that this image might be sensitive. Don't caption this image.";
            id v49 = v46;
            uint32_t v50 = 2;
            goto LABEL_66;
          }
          goto LABEL_49;
        }

        if (v36 == ++v38)
        {
          uint64_t v36 = [obj countByEnumeratingWithState:&v61 objects:v71 count:16];
          if (v36) {
            goto LABEL_31;
          }
          int v7 = 0;
          goto LABEL_53;
        }
      }
      if ((int)MediaAnalysisLogLevel() < 6) {
        goto LABEL_52;
      }
      v46 = VCPLogInstance();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        double v73 = v41;
        v48 = "[ImageCaption] This image looks to be of low quality (confidence: %f). Don't caption this image.";
        id v49 = v46;
        uint32_t v50 = 12;
LABEL_66:
        _os_log_impl(&dword_1BBEDA000, v49, OS_LOG_TYPE_INFO, v48, buf, v50);
      }
    }
LABEL_49:

LABEL_52:
    int v7 = 1;
LABEL_53:
    v35 = obj;
    goto LABEL_54;
  }
  if ((int)MediaAnalysisLogLevel() < 6)
  {
    int v7 = 1;
    goto LABEL_56;
  }
  id v6 = VCPLogInstance();
  v58 = v6;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_INFO, "[ImageCaption] This image is sensitive per SCML. Don't caption this image.", buf, 2u);
  }
  int v7 = 1;
LABEL_55:

LABEL_56:
  return v7 != 0;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  v159[1] = *MEMORY[0x1E4F143B8];
  char v9 = (uint64_t (**)(void))a6;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    uint64_t v10 = VCPLogInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEBUG, "[ImageCaption] Computing image caption with pixelBuffer", buf, 2u);
    }
  }
  if (!v9 || !v9[2](v9))
  {
    if ([(VCPImageCaptionAnalyzer *)self containPotentialUnsafeContent:a3])
    {
      v158 = @"ImageCaptionResults";
      v155 = @"attributes";
      v153 = @"imageCaptionUnsafeContent";
      id v11 = [NSNumber numberWithBool:1];
      v154 = v11;
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v154 forKeys:&v153 count:1];
      v156 = v13;
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v156 forKeys:&v155 count:1];
      v157 = v14;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v157 count:1];
      v159[0] = v15;
      *a5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v159 forKeys:&v158 count:1];

      int v12 = 0;
LABEL_129:

      goto LABEL_130;
    }
    int64_t modelType = self->_modelType;
    if ((unint64_t)(modelType - 3) >= 3)
    {
      if (modelType != 2)
      {
        if (modelType == 1)
        {
          *(void *)buf = 0;
          uint64_t v23 = VCPSignPostLog();
          os_signpost_id_t v24 = os_signpost_id_generate(v23);

          uint64_t v25 = VCPSignPostLog();
          uint64_t v26 = v25;
          unint64_t v27 = v24 - 1;
          if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
          {
            *(_WORD *)v128 = 0;
            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "VCPImageCaptionAnalyzer_AX_CVNLP_Inference", "", v128, 2u);
          }

          float v28 = (void *)CVNLPCaptionCopyForCVPixelBuffer();
          float v29 = [v28 objectForKeyedSubscript:*MEMORY[0x1E4F56710]];
          v30 = [v29 firstObject];

          if (!v30)
          {
            int v76 = MediaAnalysisLogLevel();
            v77 = v28;
            if (v76 >= 3)
            {
              v78 = VCPLogInstance();
              if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)v128 = 0;
                _os_log_impl(&dword_1BBEDA000, v78, OS_LOG_TYPE_ERROR, "[ImageCaption] No image caption result generated", v128, 2u);
              }

              v77 = v28;
            }

            char v33 = 0;
            float v31 = 0;
            goto LABEL_89;
          }
          os_signpost_id_t spid = v24;
          id v11 = [v30 objectForKeyedSubscript:*MEMORY[0x1E4F56718]];
          float v31 = [v30 objectForKeyedSubscript:*MEMORY[0x1E4F56728]];
          float v32 = [v30 objectForKeyedSubscript:*MEMORY[0x1E4F56720]];
          unsigned int v117 = [v32 BOOLValue];

          char v33 = [v28 objectForKeyedSubscript:*MEMORY[0x1E4F56730]];
          char v34 = VCPSignPostLog();
          v35 = v34;
          if (v27 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
          {
            *(_WORD *)v128 = 0;
            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v35, OS_SIGNPOST_INTERVAL_END, spid, "VCPImageCaptionAnalyzer_AX_CVNLP_Inference", "", v128, 2u);
          }

LABEL_29:
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            uint64_t v36 = VCPLogInstance();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
            {
              int64_t v37 = self->_modelType;
              *(_DWORD *)buf = 134218498;
              *(void *)&uint8_t buf[4] = v37;
              __int16 v147 = 2112;
              v148 = v11;
              __int16 v149 = 2112;
              v150 = v31;
              _os_log_impl(&dword_1BBEDA000, v36, OS_LOG_TYPE_DEBUG, "[ImageCaption] image caption modelType:%lu, text:%@, score:%@", buf, 0x20u);
            }
          }
          if (v11)
          {
            if (v31)
            {
              v144[0] = @"imageCaptionText";
              v144[1] = @"imageCaptionConfidence";
              v145[0] = v11;
              v145[1] = v31;
              v144[2] = @"imageCaptionUnsafeContent";
              uint64_t v38 = [NSNumber numberWithBool:0];
              v145[2] = v38;
              uint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v145 forKeys:v144 count:3];
              float v40 = (void *)[v39 mutableCopy];

              int64_t v41 = self->_modelType;
              if ((unint64_t)(v41 - 3) >= 3)
              {
                if (v41 == 2)
                {
                  v137 = @"ImageCaptionResults";
                  v134 = @"attributes";
                  v135 = v40;
                  int v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v135 forKeys:&v134 count:1];
                  v136 = v42;
                  int v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v136 count:1];
                  v138 = v43;
                  int v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v138 forKeys:&v137 count:1];
                }
                else
                {
                  if (v41 != 1)
                  {
LABEL_151:

                    int v12 = 0;
                    goto LABEL_128;
                  }
                  v89 = [NSNumber numberWithBool:v117];
                  [v40 setObject:v89 forKeyedSubscript:@"imageCaptionLowConfidence"];

                  [v40 setObject:v33 forKeyedSubscript:@"classificationIdentifiers"];
                  v142 = @"ImageCaptionResults";
                  v139 = @"attributes";
                  v140 = v40;
                  int v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v140 forKeys:&v139 count:1];
                  v141 = v42;
                  int v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v141 count:1];
                  v143 = v43;
                  int v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v143 forKeys:&v142 count:1];
                }
              }
              else
              {
                v132 = @"MiCaImageCaptionResults";
                v129 = @"attributes";
                v130 = v40;
                int v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v130 forKeys:&v129 count:1];
                v131 = v42;
                int v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v131 count:1];
                v133 = v43;
                int v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v133 forKeys:&v132 count:1];
              }
              *a5 = v44;

              goto LABEL_151;
            }
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              v88 = VCPLogInstance();
              if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1BBEDA000, v88, OS_LOG_TYPE_ERROR, "[ImageCaption] No caption confidence score text generated", buf, 2u);
              }
            }
            float v31 = 0;
LABEL_100:
            int v12 = -18;
LABEL_128:

            goto LABEL_129;
          }
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v86 = VCPLogInstance();
            if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BBEDA000, v86, OS_LOG_TYPE_ERROR, "[ImageCaption] No caption text generated", buf, 2u);
            }
          }
LABEL_89:
          id v11 = 0;
          goto LABEL_100;
        }
        id v22 = 0;
        v21 = 0;
LABEL_61:
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          uint32_t v50 = VCPLogInstance();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            id v73 = [v22 description];
            uint64_t v74 = [v73 UTF8String];
            *(_DWORD *)buf = 136315138;
            *(void *)&uint8_t buf[4] = v74;
            _os_log_impl(&dword_1BBEDA000, v50, OS_LOG_TYPE_ERROR, "[ImageCaption] Failed to generate CSUCaptionResults: (%s)", buf, 0xCu);
          }
          goto LABEL_70;
        }
LABEL_106:
        int v12 = -18;
        goto LABEL_127;
      }
      p_rescaledImageBuffer = &self->_rescaledImageBuffer;
      rescaledImageBuffer = self->_rescaledImageBuffer;
      if (rescaledImageBuffer) {
        goto LABEL_55;
      }
      double v60 = [(CSUImageCaptionerConfiguration *)self->_captionerConfig captioningEncoderConfiguration];
      long long v61 = [v60 inputPixelBufferDescriptor];

      size_t v62 = [v61 width];
      size_t v63 = [v61 height];
      OSType v64 = [v61 pixelFormat];
      uint64_t v65 = [v61 bytesPerRowAlignment];
      [v61 isIOSurfaceBacked];
      OSType pixelFormatTypea = v64;
      uint64_t v66 = *MEMORY[0x1E4F24C98];
      v151[0] = *MEMORY[0x1E4F24D20];
      v151[1] = v66;
      v152[0] = MEMORY[0x1E4F1CC08];
      long long v67 = [NSNumber numberWithUnsignedLong:v65];
      v152[1] = v67;
      CFDictionaryRef v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v152 forKeys:v151 count:2];

      if (CVPixelBufferCreate(0, v62, v63, pixelFormatTypea, v68, &self->_rescaledImageBuffer)
        && *p_rescaledImageBuffer)
      {
        CFRelease(*p_rescaledImageBuffer);
        *p_rescaledImageBuffer = 0;
      }

      rescaledImageBuffer = *p_rescaledImageBuffer;
      if (*p_rescaledImageBuffer)
      {
LABEL_55:
        imageCaptioner = self->_imageCaptioner;
        id v127 = 0;
        [(CSUImageCaptioner *)imageCaptioner resampleImage:a3 intoInputImage:rescaledImageBuffer error:&v127];
        id v70 = v127;
        if (v70)
        {
          id v22 = v70;
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            uint32_t v50 = VCPLogInstance();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              id v71 = [v22 description];
              uint64_t v72 = [v71 UTF8String];
              *(_DWORD *)buf = 136315138;
              *(void *)&uint8_t buf[4] = v72;
              _os_log_impl(&dword_1BBEDA000, v50, OS_LOG_TYPE_ERROR, "[ImageCaption] Failed to resample input pixelBuffer: (%s)", buf, 0xCu);
            }
            v21 = 0;
            goto LABEL_70;
          }
          v21 = 0;
          goto LABEL_106;
        }
        if (v9 && (v9[2](v9) & 1) != 0)
        {
LABEL_18:
          v21 = 0;
          id v22 = 0;
          int v12 = -128;
LABEL_127:

          char v33 = 0;
          float v31 = 0;
          id v11 = 0;
          goto LABEL_128;
        }
        v79 = VCPSignPostLog();
        os_signpost_id_t v80 = os_signpost_id_generate(v79);

        v81 = VCPSignPostLog();
        v82 = v81;
        if (v80 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v81))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v82, OS_SIGNPOST_INTERVAL_BEGIN, v80, "VCPImageCaptionAnalyzer_AX_CSU_Inference", "", buf, 2u);
        }

        v83 = self->_imageCaptioner;
        v84 = *p_rescaledImageBuffer;
        id v126 = 0;
        v21 = [(CSUImageCaptioner *)v83 computeCaptionForImage:v84 withDecodingMethod:1 error:&v126];
        id v22 = v126;
        v85 = VCPSignPostLog();
        uint32_t v50 = v85;
        if (v80 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v85))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v50, OS_SIGNPOST_INTERVAL_END, v80, "VCPImageCaptionAnalyzer_AX_CSU_Inference", "", buf, 2u);
        }
        goto LABEL_141;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        uint32_t v50 = VCPLogInstance();
        if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
          goto LABEL_68;
        }
        *(_WORD *)buf = 0;
        double v75 = "[ImageCaption] Failed to create rescaledImageBuffer";
        goto LABEL_67;
      }
    }
    else
    {
      if (!self->_imageBackboneAnalyzer)
      {
        uint64_t v17 = [VCPImageBackboneAnalyzer alloc];
        uint64_t v18 = objc_msgSend(NSNumber, "numberWithInteger:", +[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision"));
        uint64_t v19 = [(VCPImageBackboneAnalyzer *)v17 initWithRequestedAnalyses:0x1000000000000 andRevision:v18 useSharedModel:1];
        imageBackboneAnalyzer = self->_imageBackboneAnalyzer;
        self->_imageBackboneAnalyzer = v19;
      }
      if (v9 && (v9[2](v9) & 1) != 0) {
        goto LABEL_18;
      }
      if (self->_imageBackboneAnalyzer)
      {
        int v45 = VCPSignPostLog();
        os_signpost_id_t v46 = os_signpost_id_generate(v45);

        v47 = VCPSignPostLog();
        v48 = v47;
        if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v48, OS_SIGNPOST_INTERVAL_BEGIN, v46, "VCPImageCaptionAnalyzer_MiCa_EmbeddingInference", "", buf, 2u);
        }

        id v49 = self->_imageBackboneAnalyzer;
        id v125 = 0;
        int v12 = [(VCPImageBackboneAnalyzer *)v49 analyzePixelBuffer:a3 flags:0 results:&v125 cancel:v9];
        uint32_t v50 = v125;
        if (v12) {
          goto LABEL_125;
        }
        id v51 = [(VCPImageBackboneAnalyzer *)self->_imageBackboneAnalyzer spatialEmbedding];
        v52 = VCPSignPostLog();
        id v53 = v52;
        if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v53, OS_SIGNPOST_INTERVAL_END, v46, "VCPImageCaptionAnalyzer_MiCa_EmbeddingInference", "", buf, 2u);
        }

        if (!v51)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v87 = VCPLogInstance();
            if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BBEDA000, v87, OS_LOG_TYPE_ERROR, "[ImageCaption] Image embedding for caption generation is nil", buf, 2u);
            }
          }
          int v12 = -18;
          goto LABEL_124;
        }
        if (![(id)objc_opt_class() writeSpatialEmbeddingToFile]) {
          goto LABEL_121;
        }
        pixelFormatType = [MEMORY[0x1E4F28CB8] defaultManager];
        objc_super v54 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/tmp/com.apple.mediaanalysisd/" isDirectory:1];
        id v55 = [v54 path];
        char v56 = [pixelFormatType fileExistsAtPath:v55];

        if (v56)
        {
          id v57 = 0;
        }
        else
        {
          v90 = [v54 path];
          id v124 = 0;
          char v91 = [pixelFormatType createDirectoryAtPath:v90 withIntermediateDirectories:1 attributes:0 error:&v124];
          id v57 = v124;

          if ((v91 & 1) == 0)
          {
            v92 = [v57 localizedDescription];
            NSLog(&cfstr_ImagecaptionFa.isa, v54, v92);
          }
        }
        v93 = [v54 URLByAppendingPathComponent:@"imageSpatialEmbedding.dat" isDirectory:0];

        id v123 = v57;
        int v94 = [v51 writeToURL:v93 options:1 error:&v123];
        id v95 = v123;

        if (v94)
        {
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            v96 = VCPLogInstance();
            if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v93;
              _os_log_impl(&dword_1BBEDA000, v96, OS_LOG_TYPE_INFO, "[ImageCaption] Image spatial embedding successfully saved to %@", buf, 0xCu);
            }
LABEL_119:
          }
        }
        else if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v96 = VCPLogInstance();
          if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
          {
            v97 = [v95 localizedDescription];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v93;
            __int16 v147 = 2112;
            v148 = v97;
            _os_log_impl(&dword_1BBEDA000, v96, OS_LOG_TYPE_ERROR, "[ImageCaption] Failed to save image spatial embedding to %@ with error: %@", buf, 0x16u);
          }
          goto LABEL_119;
        }

LABEL_121:
        if (v9 && (v9[2](v9) & 1) != 0)
        {
          int v12 = -128;
LABEL_124:

LABEL_125:
          v21 = 0;
          id v22 = 0;
          goto LABEL_126;
        }
        v99 = VCPSignPostLog();
        os_signpost_id_t v100 = os_signpost_id_generate(v99);

        v101 = VCPSignPostLog();
        v102 = v101;
        if (v100 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v101))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v102, OS_SIGNPOST_INTERVAL_BEGIN, v100, "VCPImageCaptionAnalyzer_MiCa_CaptionInference", "", buf, 2u);
        }

        char v103 = [(id)objc_opt_class() greedySearchEnabled];
        v104 = self->_imageCaptioner;
        if (v103)
        {
          uint64_t v121 = 0;
          v105 = (id *)&v121;
          uint64_t v106 = [(CSUImageCaptioner *)v104 computeCaptionForEmbedding:v51 withDecodingMethod:0 error:&v121];
        }
        else
        {
          uint64_t v122 = 0;
          v105 = (id *)&v122;
          uint64_t v106 = [(CSUImageCaptioner *)v104 computeCaptionForEmbedding:v51 withDecodingMethod:1 error:&v122];
        }
        v21 = (void *)v106;
        id v22 = *v105;
        v107 = VCPSignPostLog();
        v108 = v107;
        if (v100 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v107))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v108, OS_SIGNPOST_INTERVAL_END, v100, "VCPImageCaptionAnalyzer_MiCa_CaptionInference", "", buf, 2u);
        }

LABEL_141:
        if (v21 && !v22)
        {
          v109 = [v21 results];
          if (v109)
          {
            v110 = [v21 results];
            BOOL v111 = [v110 count] == 0;

            if (!v111)
            {
              v112 = [v21 results];
              v113 = [v112 objectAtIndexedSubscript:0];
              id v11 = [v113 caption];

              v114 = NSNumber;
              v115 = [v21 results];
              v116 = [v115 objectAtIndexedSubscript:0];
              [v116 score];
              float v31 = objc_msgSend(v114, "numberWithFloat:");

              char v33 = 0;
              unsigned int v117 = 0;
              goto LABEL_29;
            }
          }
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            uint32_t v50 = VCPLogInstance();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BBEDA000, v50, OS_LOG_TYPE_ERROR, "[ImageCaption] [ERROR] CSUCaptionResults has no results", buf, 2u);
            }
            goto LABEL_69;
          }
          goto LABEL_105;
        }
        goto LABEL_61;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        uint32_t v50 = VCPLogInstance();
        if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
LABEL_68:
          v21 = 0;
LABEL_69:
          id v22 = 0;
LABEL_70:
          int v12 = -18;
LABEL_126:

          goto LABEL_127;
        }
        *(_WORD *)buf = 0;
        double v75 = "[ImageCaption] Failed to init VCPImageBackboneAnalyzer";
LABEL_67:
        _os_log_impl(&dword_1BBEDA000, v50, OS_LOG_TYPE_ERROR, v75, buf, 2u);
        goto LABEL_68;
      }
    }
    v21 = 0;
LABEL_105:
    id v22 = 0;
    goto LABEL_106;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v11 = VCPLogInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "[ImageCaption] Image caption analysis cancelled", buf, 2u);
    }
    int v12 = -128;
    goto LABEL_129;
  }
  int v12 = -128;
LABEL_130:

  return v12;
}

- (int)analyzeEmbedding:(id)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  char v9 = (unsigned int (**)(void))a6;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    uint64_t v10 = VCPLogInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEBUG, "[ImageCaption] Computing MiCa image caption with embedding", buf, 2u);
    }
  }
  if (!v9 || !v9[2](v9))
  {
    if (v8)
    {
      if (self->_modelType == 3)
      {
        if ([v8 length] == 374784)
        {
          id v13 = VCPSignPostLog();
          os_signpost_id_t v14 = os_signpost_id_generate(v13);

          v15 = VCPSignPostLog();
          uint64_t v16 = v15;
          if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "VCPImageCaptionAnalyzer_MiCa_CaptionInference", "", buf, 2u);
          }

          char v17 = [(id)objc_opt_class() greedySearchEnabled];
          imageCaptioner = self->_imageCaptioner;
          if (v17)
          {
            uint64_t v51 = 0;
            uint64_t v19 = (id *)&v51;
            uint64_t v20 = [(CSUImageCaptioner *)imageCaptioner computeCaptionForEmbedding:v8 withDecodingMethod:0 error:&v51];
          }
          else
          {
            uint64_t v52 = 0;
            uint64_t v19 = (id *)&v52;
            uint64_t v20 = [(CSUImageCaptioner *)imageCaptioner computeCaptionForEmbedding:v8 withDecodingMethod:1 error:&v52];
          }
          id v49 = (void *)v20;
          id v11 = *v19;
          uint64_t v25 = VCPSignPostLog();
          uint64_t v26 = v25;
          if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v26, OS_SIGNPOST_INTERVAL_END, v14, "VCPImageCaptionAnalyzer_MiCa_CaptionInference", "", buf, 2u);
          }

          if (!v49 || v11)
          {
            int v39 = MediaAnalysisLogLevel();
            float v40 = v49;
            if (v39 >= 3)
            {
              log = VCPLogInstance();
              if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
              {
                id v41 = [v11 description];
                uint64_t v42 = [v41 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v61 = v42;
                _os_log_impl(&dword_1BBEDA000, log, OS_LOG_TYPE_ERROR, "[ERROR] Failed to generate CSUCaptionResults: (%s)", buf, 0xCu);
              }
              goto LABEL_52;
            }
          }
          else
          {
            unint64_t v27 = [v49 results];
            if (v27)
            {
              float v28 = [v49 results];
              BOOL v29 = [v28 count] == 0;

              if (!v29)
              {
                v30 = [v49 results];
                float v31 = [v30 objectAtIndexedSubscript:0];
                log = [v31 caption];

                os_signpost_id_t v46 = NSNumber;
                float v32 = [v49 results];
                char v33 = [v32 objectAtIndexedSubscript:0];
                [v33 score];
                v47 = objc_msgSend(v46, "numberWithFloat:");

                if ((int)MediaAnalysisLogLevel() >= 7)
                {
                  char v34 = VCPLogInstance();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                  {
                    int64_t modelType = self->_modelType;
                    *(_DWORD *)buf = 134218498;
                    uint64_t v61 = modelType;
                    __int16 v62 = 2112;
                    uint64_t v63 = (uint64_t)log;
                    __int16 v64 = 2112;
                    uint64_t v65 = v47;
                    _os_log_impl(&dword_1BBEDA000, v34, OS_LOG_TYPE_DEBUG, "[ImageCaption] image caption modelType:%lu, text:%@, score:%@", buf, 0x20u);
                  }
                }
                v58 = @"MiCaImageCaptionResults";
                id v55 = @"attributes";
                v53[0] = @"imageCaptionText";
                v53[1] = @"imageCaptionConfidence";
                v54[0] = log;
                v54[1] = v47;
                v53[2] = @"imageCaptionUnsafeContent";
                v54[2] = MEMORY[0x1E4F1CC28];
                uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:3];
                char v56 = v36;
                int64_t v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
                id v57 = v37;
                uint64_t v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
                v59 = v38;
                *a5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];

                int v12 = 0;
                goto LABEL_53;
              }
            }
            int v43 = MediaAnalysisLogLevel();
            float v40 = v49;
            if (v43 >= 3)
            {
              int v44 = VCPLogInstance();
              log = v44;
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1BBEDA000, v44, OS_LOG_TYPE_ERROR, "[ERROR] CSUCaptionResults has no results", buf, 2u);
              }
LABEL_52:
              int v12 = -18;
LABEL_53:

              float v40 = v49;
LABEL_55:

              goto LABEL_56;
            }
          }
          int v12 = -18;
          goto LABEL_55;
        }
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          id v11 = VCPLogInstance();
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            goto LABEL_27;
          }
          uint64_t v24 = [v8 length];
          *(_DWORD *)buf = 134218240;
          uint64_t v61 = v24;
          __int16 v62 = 2048;
          uint64_t v63 = 374784;
          v21 = "Embedding size mismatch (current embedding size in byte: %lu, expected size in byte with float: %lu) ana"
                "lyzeEmbedding only supports VCPMUBBRevision_V4 and VCPMUBBRevision_V5";
          id v22 = v11;
          uint32_t v23 = 22;
          goto LABEL_26;
        }
LABEL_32:
        int v12 = -18;
        goto LABEL_57;
      }
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_32;
      }
      id v11 = VCPLogInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v21 = "analyzeEmbedding only support MADImageCaptionModelType_Mica";
        goto LABEL_25;
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_32;
      }
      id v11 = VCPLogInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v21 = "[ImageCaption] Image embedding for caption generation is nil";
LABEL_25:
        id v22 = v11;
        uint32_t v23 = 2;
LABEL_26:
        _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
      }
    }
LABEL_27:
    int v12 = -18;
LABEL_56:

    goto LABEL_57;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v11 = VCPLogInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "[ImageCaption] Image caption analysis cancelled", buf, 2u);
    }
    int v12 = -128;
    goto LABEL_56;
  }
  int v12 = -128;
LABEL_57:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageBackboneAnalyzer, 0);
  objc_storeStrong((id *)&self->_captionerConfig, 0);
  objc_storeStrong((id *)&self->_imageCaptioner, 0);
}

@end