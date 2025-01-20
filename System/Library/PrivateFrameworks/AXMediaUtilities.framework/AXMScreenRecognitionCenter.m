@interface AXMScreenRecognitionCenter
+ (id)sharedInstance;
- ($436BAF7D86476205E6C1D891D6FE0A3A)processFeatures:(SEL)a3;
- (id)_processVisionResult:(id)a3 options:(id)a4 coagulator:(id)a5;
@end

@implementation AXMScreenRecognitionCenter

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_16);
  }
  v2 = (void *)sharedInstance_Center;

  return v2;
}

void __44__AXMScreenRecognitionCenter_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance_Center;
  sharedInstance_Center = v0;
}

- (id)_processVisionResult:(id)a3 options:(id)a4 coagulator:(id)a5
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_opt_new();
  v11 = AXMediaLogMLElement();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[AXMScreenRecognitionCenter _processVisionResult:options:coagulator:].cold.5(v7, v8);
  }

  v12 = [v7 equivalenceToken];
  v13 = [v8 equivalenceToken];
  int v14 = [v12 isEqual:v13];

  v15 = [v7 equivalenceToken];
  [v10 setScreenEquivalenceToken:v15];

  if (v14)
  {
    [v10 setSameScreenCapResult:1];
    v16 = AXMediaLogMLElement();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[AXMScreenRecognitionCenter _processVisionResult:options:coagulator:](v16, v17, v18, v19, v20, v21, v22, v23);
    }
LABEL_33:

    goto LABEL_34;
  }
  v59 = v9;
  v60 = v8;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v61 = v7;
  v24 = [v7 features];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v66 objects:v73 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v67;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v67 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v66 + 1) + 8 * v28);
        v30 = AXMediaLogMLElement();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v72 = v29;
          _os_log_debug_impl(&dword_1B57D5000, v30, OS_LOG_TYPE_DEBUG, "\tFeature results: %@", buf, 0xCu);
        }

        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = [v24 countByEnumeratingWithState:&v66 objects:v73 count:16];
    }
    while (v26);
  }

  if ([v60 disableCoagulator])
  {
    v31 = [v61 features];
    [v10 setSortedFeatures:v31];
  }
  else
  {
    CFAbsoluteTimeGetCurrent();
    v32 = [v61 features];
    v33 = [v59 coagulateElements:v32];
    [v10 setSortedFeatures:v33];

    v31 = AXMediaLogMLElement();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      -[AXMScreenRecognitionCenter _processVisionResult:options:coagulator:].cold.4();
    }
  }

  v34 = AXMediaLogMLElement();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
    -[AXMScreenRecognitionCenter _processVisionResult:options:coagulator:](v34, v35, v36, v37, v38, v39, v40, v41);
  }

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  v42 = [v10 sortedFeatures];
  uint64_t v43 = [v42 countByEnumeratingWithState:&v62 objects:v70 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v63;
    do
    {
      uint64_t v46 = 0;
      do
      {
        if (*(void *)v63 != v45) {
          objc_enumerationMutation(v42);
        }
        uint64_t v47 = *(void *)(*((void *)&v62 + 1) + 8 * v46);
        v48 = AXMediaLogMLElement();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v72 = v47;
          _os_log_debug_impl(&dword_1B57D5000, v48, OS_LOG_TYPE_DEBUG, "\tSorted results: %@", buf, 0xCu);
        }

        ++v46;
      }
      while (v44 != v46);
      uint64_t v44 = [v42 countByEnumeratingWithState:&v62 objects:v70 count:16];
    }
    while (v44);
  }

  v49 = [v10 sortedFeatures];
  uint64_t v50 = [v49 count];

  id v8 = v60;
  id v7 = v61;
  id v9 = v59;
  if (!v50)
  {
    v16 = AXMediaLogMLElement();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[AXMScreenRecognitionCenter _processVisionResult:options:coagulator:](v16, v51, v52, v53, v54, v55, v56, v57);
    }
    goto LABEL_33;
  }
LABEL_34:

  return v10;
}

- ($436BAF7D86476205E6C1D891D6FE0A3A)processFeatures:(SEL)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (processFeatures__onceToken != -1) {
    dispatch_once(&processFeatures__onceToken, &__block_literal_global_86);
  }
  id v7 = [(id)processFeatures____displayManager coreAnimationMainDisplay];
  [v7 scale];
  double v9 = v8;

  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  v11 = [v6 testingImage];

  if (v11) {
    double v9 = 1.0;
  }
  v12 = +[AXMLElementCoagulation sharedInstance];
  [v6 fullRect];
  objc_msgSend(v12, "setAppFrame:");
  objc_msgSend(v12, "setAppOrientation:", objc_msgSend(v6, "orientation"));
  [v12 setScreenScale:v9];
  objc_msgSend(v12, "setIsRTL:", objc_msgSend(v6, "isRTL"));
  v13 = AXMediaLogMLElement();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[AXMScreenRecognitionCenter processFeatures:](v6, v50);
  }

  uint64_t v44 = 0;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x3032000000;
  uint64_t v47 = __Block_byref_object_copy__7;
  v48 = __Block_byref_object_dispose__7;
  id v49 = 0;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __46__AXMScreenRecognitionCenter_processFeatures___block_invoke_96;
  v39[3] = &unk_1E6117E68;
  uint64_t v43 = &v44;
  v39[4] = self;
  id v14 = v6;
  id v40 = v14;
  id v15 = v12;
  id v41 = v15;
  v16 = v10;
  v42 = v16;
  uint64_t v17 = (void *)MEMORY[0x1BA9A1340](v39);
  uint64_t v18 = [v14 testingImage];
  BOOL v19 = v18 == 0;

  if (v19)
  {
    uint64_t v20 = [(id)processFeatures____engine captureNode];
    [v14 fullRect];
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    uint64_t v31 = [v14 orientation];
    uint64_t v21 = [MEMORY[0x1E4F1C9B8] data];
    objc_msgSend(v20, "triggerWithScreenCaptureRegion:interfaceOrientation:options:cacheKey:resultHandler:", v31, v14, v21, v17, v24, v26, v28, v30);
  }
  else
  {
    uint64_t v20 = [(id)processFeatures____engine imageNode];
    uint64_t v21 = [v14 testingImage];
    uint64_t v22 = [MEMORY[0x1E4F1C9B8] data];
    [v20 triggerWithImage:v21 options:v14 cacheKey:v22 resultHandler:v17];
  }
  dispatch_time_t v32 = dispatch_time(0, 15000000000);
  dispatch_semaphore_wait(v16, v32);
  int v33 = [(id)v45[5] sameScreenCapResult];
  v34 = [(id)v45[5] screenEquivalenceToken];
  uint64_t v35 = [(id)v45[5] sortedFeatures];
  uint64_t v36 = AXMediaLogMLElement();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    uint64_t buf = 67109120;
    _os_log_impl(&dword_1B57D5000, v36, OS_LOG_TYPE_INFO, "Handling results for ML detection for gen: %d", (uint8_t *)&buf, 8u);
  }

  if (v33)
  {
    uint64_t v37 = AXMediaLogMLElement();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1B57D5000, v37, OS_LOG_TYPE_INFO, "ML Elements same screen capture - ignoring results", (uint8_t *)&buf, 2u);
    }

    retstr->var1 = 0;
    retstr->var2 = 0;
    retstr->var0 = v34;
  }
  else
  {
    retstr->var0 = v34;
    retstr->var1 = v35;
    retstr->var2 = 0;
  }

  _Block_object_dispose(&v44, 8);
  return result;
}

void __46__AXMScreenRecognitionCenter_processFeatures___block_invoke()
{
  dispatch_semaphore_t v0 = dispatch_semaphore_create(0);
  v1 = [[AXMAXElementVisionEngine alloc] initWithIdentifier:@"AXElementVision"];
  v2 = (void *)processFeatures____engine;
  processFeatures____engine = (uint64_t)v1;

  v3 = [AXMDisplayManager alloc];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __46__AXMScreenRecognitionCenter_processFeatures___block_invoke_2;
  v15[3] = &unk_1E6117090;
  dispatch_semaphore_t v16 = v0;
  v4 = v0;
  uint64_t v5 = [(AXMDisplayManager *)v3 initWithCompletion:v15];
  id v6 = (void *)processFeatures____displayManager;
  processFeatures____displayManager = v5;

  dispatch_time_t v7 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v4, v7);
  double v8 = [(id)processFeatures____displayManager coreAnimationMainDisplay];
  [v8 size];
  processFeatures__ScaledScreenSize_0 = v9;
  processFeatures__ScaledScreenSize_1 = v10;

  v11 = [(id)processFeatures____displayManager coreAnimationMainDisplay];
  [v11 scale];
  *(double *)&processFeatures__ScaledScreenSize_0 = *(double *)&processFeatures__ScaledScreenSize_0 / v12;

  v13 = [(id)processFeatures____displayManager coreAnimationMainDisplay];
  [v13 scale];
  *(double *)&processFeatures__ScaledScreenSize_1 = *(double *)&processFeatures__ScaledScreenSize_1 / v14;
}

intptr_t __46__AXMScreenRecognitionCenter_processFeatures___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __46__AXMScreenRecognitionCenter_processFeatures___block_invoke_96(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_time_t v7 = AXMediaLogMLElement();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __46__AXMScreenRecognitionCenter_processFeatures___block_invoke_96_cold_1((uint64_t)v5, (uint64_t)v6, v7);
  }

  uint64_t v8 = [*(id *)(a1 + 32) _processVisionResult:v5 options:*(void *)(a1 + 40) coagulator:*(void *)(a1 + 48)];
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

- (void)_processVisionResult:(uint64_t)a3 options:(uint64_t)a4 coagulator:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_processVisionResult:(uint64_t)a3 options:(uint64_t)a4 coagulator:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_processVisionResult:(uint64_t)a3 options:(uint64_t)a4 coagulator:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_processVisionResult:options:coagulator:.cold.4()
{
  CFAbsoluteTimeGetCurrent();
  OUTLINED_FUNCTION_1_4();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0xCu);
}

- (void)_processVisionResult:(void *)a1 options:(void *)a2 coagulator:.cold.5(void *a1, void *a2)
{
  v3 = [a1 equivalenceToken];
  uint64_t v9 = [a2 equivalenceToken];
  OUTLINED_FUNCTION_1_4();
  _os_log_debug_impl(v4, v5, v6, v7, v8, 0x16u);
}

- (void)processFeatures:(void *)a1 .cold.1(void *a1, void *a2)
{
  v4 = (void *)MEMORY[0x1E4F29238];
  [a1 fullRect];
  *a2 = v5;
  a2[1] = v6;
  a2[2] = v7;
  a2[3] = v8;
  uint64_t v9 = [v4 valueWithBytes:a2 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "orientation"));
  dispatch_semaphore_t v16 = [NSNumber numberWithUnsignedLongLong:0];
  OUTLINED_FUNCTION_1_4();
  _os_log_debug_impl(v11, v12, v13, v14, v15, 0x20u);
}

void __46__AXMScreenRecognitionCenter_processFeatures___block_invoke_96_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109634;
  v3[1] = 0;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_1B57D5000, log, OS_LOG_TYPE_DEBUG, "ML Gen: %d Receieved remote handler reply %@/%@", (uint8_t *)v3, 0x1Cu);
}

@end