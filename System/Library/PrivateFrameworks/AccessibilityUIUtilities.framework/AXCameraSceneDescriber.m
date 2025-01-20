@interface AXCameraSceneDescriber
- (AXCameraSceneDescriber)init;
- (BOOL)includeTextDetection;
- (void)imageDescriptionForCurrentCameraScene:(id)a3 withPreferredLocale:(id)a4;
- (void)setIncludeTextDetection:(BOOL)a3;
@end

@implementation AXCameraSceneDescriber

- (AXCameraSceneDescriber)init
{
  v9.receiver = self;
  v9.super_class = (Class)AXCameraSceneDescriber;
  v2 = [(AXCameraSceneDescriber *)&v9 init];
  v3 = [[AXCameraManager alloc] init];
  manager = v2->_manager;
  v2->_manager = v3;

  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F487F8]) init];
  visionEngine = v2->_visionEngine;
  v2->_visionEngine = (AXMVoiceOverVisionEngine *)v5;

  v7 = [(AXMVoiceOverVisionEngine *)v2->_visionEngine imageNode];
  [v7 setShouldProcessRemotely:1];

  [(AXMVoiceOverVisionEngine *)v2->_visionEngine prewarmEngine];
  return v2;
}

- (void)imageDescriptionForCurrentCameraScene:(id)a3 withPreferredLocale:(id)a4
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v25[0] = *MEMORY[0x1E4F487D8];
  v7 = (void *)MEMORY[0x1E4F1CA20];
  id v8 = a4;
  objc_super v9 = [v7 localeWithLocaleIdentifier:@"en_US"];
  v25[1] = *MEMORY[0x1E4F487E0];
  v26[0] = v9;
  v26[1] = &unk_1F1F20180;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];

  v11 = [(AXMVoiceOverVisionEngine *)self->_visionEngine configuredOptionsDisableAllDetectors:0 elementOptions:2048 textRecognitionLevel:0 textDetectionLocales:0 preferringFullCaptions:1];
  objc_msgSend(v11, "setDetectText:", -[AXCameraSceneDescriber includeTextDetection](self, "includeTextDetection"));
  if ([(AXCameraSceneDescriber *)self includeTextDetection])
  {
    v12 = [MEMORY[0x1E4F487F0] defaultOptions];
    [v11 setTextDetectionOptions:v12];
  }
  else
  {
    [v11 setTextDetectionOptions:0];
  }
  v13 = [v11 textDetectionOptions];
  [v13 setRecognitionLevel:1];

  [v11 setPreferredOutputLocale:v8];
  v14 = VOTLogCommon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v11;
    _os_log_impl(&dword_1C39D1000, v14, OS_LOG_TYPE_DEFAULT, "Starting camera scene detection: %@", buf, 0xCu);
  }

  manager = self->_manager;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __84__AXCameraSceneDescriber_imageDescriptionForCurrentCameraScene_withPreferredLocale___block_invoke;
  v19[3] = &unk_1E649C938;
  v19[4] = self;
  id v20 = v11;
  id v21 = v10;
  id v22 = v6;
  id v16 = v6;
  id v17 = v10;
  id v18 = v11;
  [(AXCameraManager *)manager fetchCurrentCameraSceneBufferWithHandler:v19];
}

void __84__AXCameraSceneDescriber_imageDescriptionForCurrentCameraScene_withPreferredLocale___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v4 = VOTLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = a2;
    _os_log_impl(&dword_1C39D1000, v4, OS_LOG_TYPE_DEFAULT, "Got buffer: %@", buf, 0xCu);
  }

  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 16) imageNode];
  id v6 = [MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:a2];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84__AXCameraSceneDescriber_imageDescriptionForCurrentCameraScene_withPreferredLocale___block_invoke_274;
  v8[3] = &unk_1E649C910;
  uint64_t v7 = *(void *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  [v5 triggerWithImage:v6 options:v7 cacheKey:0 resultHandler:v8];
}

void __84__AXCameraSceneDescriber_imageDescriptionForCurrentCameraScene_withPreferredLocale___block_invoke_274(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = VOTLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = v5;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_1C39D1000, v7, OS_LOG_TYPE_DEFAULT, "Got results: %@ error: %@", buf, 0x16u);
  }

  id v8 = [v5 detectedFeatureDescriptionWithOptions:*(void *)(a1 + 32)];
  id v9 = [v5 detectedTextDescription];
  if ([v9 length])
  {
    id v10 = AXUILocalizedStringForKey(@"DetectedText");
    v11 = AXCFormattedString();
    id v16 = v8;
    id v17 = @"__AXStringForVariablesSentinel";
    uint64_t v12 = __AXStringForVariables();

    id v8 = (void *)v12;
  }
  if (objc_msgSend(v8, "length", v16, v17))
  {
    uint64_t v13 = *(void *)(a1 + 40);
    v14 = [v5 captionTranslationLocale];
    v15 = [v14 localeIdentifier];
    (*(void (**)(uint64_t, void *, void *))(v13 + 16))(v13, v8, v15);
  }
}

- (BOOL)includeTextDetection
{
  return self->_includeTextDetection;
}

- (void)setIncludeTextDetection:(BOOL)a3
{
  self->_includeTextDetection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visionEngine, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

@end