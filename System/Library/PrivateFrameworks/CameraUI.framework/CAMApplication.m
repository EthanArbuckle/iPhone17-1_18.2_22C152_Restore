@interface CAMApplication
+ (BOOL)isAppOrPlugInSuspended;
+ (int64_t)appOrPlugInInterfaceOrientation;
+ (int64_t)appOrPlugInState;
- (BOOL)runLibrarySelectionWithTestPlan:(id)a3 options:(id)a4;
- (BOOL)runNewPPTUICaptureTestWithTestPlan:(id)a3 options:(id)a4;
- (BOOL)runPresentCameraRollWithTestPlan:(id)a3 options:(id)a4;
- (BOOL)runSwitchCamerasTestWithTestPlan:(id)a3 options:(id)a4;
- (BOOL)runSwitchModesWithTestPlan:(id)a3 options:(id)a4 userPreferencesOverrides:(id)a5;
- (BOOL)runSwitchToPortraitFrontWithTestPlan:(id)a3 options:(id)a4;
- (BOOL)runTakePictureFrontCameraWithTestPlan:(id)a3 options:(id)a4 prototype:(id)a5 forCaptureMode:(int64_t)a6;
- (BOOL)runTakePictureFrontPortraitWithTestPlan:(id)a3 options:(id)a4 prototype:(id)a5;
- (BOOL)runTakePicturePortraitWithTestPlan:(id)a3 options:(id)a4 prototype:(id)a5;
- (BOOL)runTakePictureTestWithTestPlan:(id)a3 options:(id)a4 prototype:(id)a5 forCaptureMode:(int64_t)a6;
- (BOOL)runTakeVideoTestWithTestPlan:(id)a3 options:(id)a4 userPreferencesOverrides:(id)a5;
- (BOOL)runTest:(id)a3 options:(id)a4;
- (CAMPerformanceTestPlan)currentTestPlan;
- (id)_extendLaunchTest;
- (unint64_t)supportedInterfaceOrientationsForWindow:(id)a3;
- (void)_configureExtendedLaunchTestIfNeeded;
- (void)_registerPreviewStartBlock:(id)a3;
- (void)didChangeToMode:(int64_t)a3 device:(int64_t)a4;
- (void)didCloseViewfinderForReason:(int64_t)a3;
- (void)didOpenViewfinderForReason:(int64_t)a3;
- (void)prepareForDefaultImageSnapshotForScreen:(id)a3;
- (void)setCurrentTestPlan:(id)a3;
- (void)willCloseViewfinderForReason:(int64_t)a3;
- (void)willOpenViewfinderForReason:(int64_t)a3;
@end

@implementation CAMApplication

- (void)_configureExtendedLaunchTestIfNeeded
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __63__CAMApplication_Testing___configureExtendedLaunchTestIfNeeded__block_invoke;
  v2[3] = &unk_263FA0208;
  v2[4] = self;
  [(CAMApplication *)self _registerPreviewStartBlock:v2];
}

- (void)_registerPreviewStartBlock:(id)a3
{
  id v3 = a3;
  uint64_t v12 = 0;
  v13 = (id *)&v12;
  uint64_t v14 = 0x3042000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  v5 = [MEMORY[0x263F08A48] mainQueue];
  uint64_t v6 = *MEMORY[0x263EF97C8];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__CAMApplication_Testing___registerPreviewStartBlock___block_invoke;
  v9[3] = &unk_263FA0560;
  id v7 = v3;
  id v10 = v7;
  v11 = &v12;
  v8 = [v4 addObserverForName:v6 object:0 queue:v5 usingBlock:v9];
  objc_storeWeak(v13 + 5, v8);

  _Block_object_dispose(&v12, 8);
  objc_destroyWeak(&v17);
}

- (unint64_t)supportedInterfaceOrientationsForWindow:(id)a3
{
  return 30;
}

- (id)_extendLaunchTest
{
  return @"previewStarted";
}

- (void)didChangeToMode:(int64_t)a3 device:(int64_t)a4
{
  v12[2] = *MEMORY[0x263EF8340];
  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  v11[0] = @"mode";
  v8 = [NSNumber numberWithInteger:a3];
  v11[1] = @"device";
  v12[0] = v8;
  v9 = [NSNumber numberWithInteger:a4];
  v12[1] = v9;
  id v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  [v7 postNotificationName:@"CAMPerformanceDidChangeToModeNotification" object:self userInfo:v10];
}

void __54__CAMApplication_Testing___registerPreviewStartBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  [v3 removeObserver:WeakRetained name:*MEMORY[0x263EF97C8] object:0];
}

void __63__CAMApplication_Testing___configureExtendedLaunchTestIfNeeded__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 _launchTestName];
  [v1 finishedTest:v2 extraResults:0];
}

- (void)willCloseViewfinderForReason:(int64_t)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  v5 = [(CAMApplication *)self currentTestPlan];
  [v5 startSubtestWithName:@"closingViewfinder" withMetrics:0];

  uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
  v9 = @"reason";
  id v7 = [NSNumber numberWithInteger:a3];
  v10[0] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v6 postNotificationName:@"CAMPerformanceWillCloseViewfinderNotification" object:self userInfo:v8];
}

- (void)didCloseViewfinderForReason:(int64_t)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  v5 = [(CAMApplication *)self currentTestPlan];
  [v5 startSubtestWithName:@"closingViewfinder" withMetrics:0];

  uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
  v9 = @"reason";
  id v7 = [NSNumber numberWithInteger:a3];
  v10[0] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v6 postNotificationName:@"CAMPerformanceDidCloseViewfinderNotification" object:self userInfo:v8];
}

- (void)prepareForDefaultImageSnapshotForScreen:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMApplication *)self delegate];
  [v5 prepareForDefaultImageSnapshotForScreen:v4];
}

- (void)willOpenViewfinderForReason:(int64_t)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v5 = [(CAMApplication *)self currentTestPlan];
  [v5 startSubtestWithName:@"openingViewfinder" withMetrics:0];

  uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
  v9 = @"reason";
  id v7 = [NSNumber numberWithInteger:a3];
  v10[0] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v6 postNotificationName:@"CAMPerformanceWillOpenViewfinderNotification" object:self userInfo:v8];
}

- (void)didOpenViewfinderForReason:(int64_t)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v5 = [(CAMApplication *)self currentTestPlan];
  [v5 stopSubtestWithName:@"openingViewfinder"];

  uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
  v9 = @"reason";
  id v7 = [NSNumber numberWithInteger:a3];
  v10[0] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v6 postNotificationName:@"CAMPerformanceDidOpenViewfinderNotification" object:self userInfo:v8];
}

- (BOOL)runTakeVideoTestWithTestPlan:(id)a3 options:(id)a4 userPreferencesOverrides:(id)a5
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(CAMApplication *)self delegate];
  uint64_t v12 = [v11 viewfinderViewController];
  v13 = [v9 objectForKeyedSubscript:@"videoDurationInSeconds"];
  [v13 doubleValue];
  double v15 = v14;

  v16 = [v9 objectForKeyedSubscript:@"captureMode"];
  unint64_t v17 = [v16 integerValue];

  v78 = v11;
  v79 = v10;
  v77 = self;
  switch(v17)
  {
    case 0uLL:
    case 9uLL:
      uint64_t v21 = 0;
      uint64_t v22 = 1;
      goto LABEL_92;
    case 1uLL:
      v25 = [v10 videoConfiguration];

      if (!v25) {
        goto LABEL_7;
      }
      v26 = [v10 videoConfiguration];
      uint64_t v21 = [v26 integerValue];

      v27 = os_log_create("com.apple.camera", "Camera");
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_91;
      }
      uint64_t v28 = [v8 testName];
      v29 = (void *)v28;
      switch(v21)
      {
        case 0:
          v30 = @"Auto";
          break;
        case 1:
          v30 = @"1080p60";
          break;
        case 2:
          v30 = @"720p120";
          break;
        case 3:
          v30 = @"720p240";
          break;
        case 4:
          v30 = @"1080p120";
          break;
        case 5:
          v30 = @"4k30";
          break;
        case 6:
          v30 = @"720p30";
          break;
        case 7:
          v30 = @"1080p30";
          break;
        case 8:
          v30 = @"1080p240";
          break;
        case 9:
          v30 = @"4k60";
          break;
        case 10:
          v30 = @"4k24";
          break;
        case 11:
          v30 = @"1080p25";
          break;
        case 12:
          v30 = @"4k25";
          break;
        case 13:
          v30 = @"4k120";
          break;
        case 14:
          v30 = @"4k100";
          break;
        default:
          switch(v21)
          {
            case 10000:
              v30 = @"ImagePickerHigh";
              break;
            case 10001:
              v30 = @"ImagePickerMedium";
              break;
            case 10002:
              v30 = @"ImagePickerLow";
              break;
            case 10003:
              v30 = @"ImagePickerVGA";
              break;
            case 10004:
              v30 = @"ImagePickeriFrame720p";
              break;
            case 10005:
              v30 = @"ImagePickeriFrame540p";
              break;
            default:
              v30 = 0;
              break;
          }
          break;
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v87 = v28;
      __int16 v88 = 2114;
      v89 = v30;
      v39 = "%{public}@ will override Video format to %{public}@";
      break;
    case 2uLL:
      v31 = [v10 slomoConfiguration];

      if (!v31) {
        goto LABEL_7;
      }
      v32 = [v10 slomoConfiguration];
      uint64_t v21 = [v32 integerValue];

      v27 = os_log_create("com.apple.camera", "Camera");
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_91;
      }
      uint64_t v33 = [v8 testName];
      v29 = (void *)v33;
      switch(v21)
      {
        case 0:
          v34 = @"Auto";
          break;
        case 1:
          v34 = @"1080p60";
          break;
        case 2:
          v34 = @"720p120";
          break;
        case 3:
          v34 = @"720p240";
          break;
        case 4:
          v34 = @"1080p120";
          break;
        case 5:
          v34 = @"4k30";
          break;
        case 6:
          v34 = @"720p30";
          break;
        case 7:
          v34 = @"1080p30";
          break;
        case 8:
          v34 = @"1080p240";
          break;
        case 9:
          v34 = @"4k60";
          break;
        case 10:
          v34 = @"4k24";
          break;
        case 11:
          v34 = @"1080p25";
          break;
        case 12:
          v34 = @"4k25";
          break;
        case 13:
          v34 = @"4k120";
          break;
        case 14:
          v34 = @"4k100";
          break;
        default:
          switch(v21)
          {
            case 10000:
              v34 = @"ImagePickerHigh";
              break;
            case 10001:
              v34 = @"ImagePickerMedium";
              break;
            case 10002:
              v34 = @"ImagePickerLow";
              break;
            case 10003:
              v34 = @"ImagePickerVGA";
              break;
            case 10004:
              v34 = @"ImagePickeriFrame720p";
              break;
            case 10005:
              v34 = @"ImagePickeriFrame540p";
              break;
            default:
              v34 = 0;
              break;
          }
          break;
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v87 = v33;
      __int16 v88 = 2114;
      v89 = v34;
      v39 = "%{public}@ will override SloMo format to %{public}@";
      break;
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
      v18 = [v8 testName];
      v19 = NSString;
      if (v17 - 3 > 3) {
        v20 = 0;
      }
      else {
        v20 = off_263FA0580[v17 - 3];
      }
      v23 = [v8 testName];
      v24 = [v19 stringWithFormat:@"%@ is not a supported mode for %@", v20, v23];
      [(CAMApplication *)self failedTest:v18 withFailure:v24];

      goto LABEL_7;
    case 7uLL:
      v35 = [v10 cinematicConfiguration];

      if (!v35) {
        goto LABEL_7;
      }
      v36 = [v10 cinematicConfiguration];
      uint64_t v21 = [v36 integerValue];

      v27 = os_log_create("com.apple.camera", "Camera");
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_91;
      }
      uint64_t v37 = [v8 testName];
      v29 = (void *)v37;
      switch(v21)
      {
        case 0:
          v38 = @"Auto";
          break;
        case 1:
          v38 = @"1080p60";
          break;
        case 2:
          v38 = @"720p120";
          break;
        case 3:
          v38 = @"720p240";
          break;
        case 4:
          v38 = @"1080p120";
          break;
        case 5:
          v38 = @"4k30";
          break;
        case 6:
          v38 = @"720p30";
          break;
        case 7:
          v38 = @"1080p30";
          break;
        case 8:
          v38 = @"1080p240";
          break;
        case 9:
          v38 = @"4k60";
          break;
        case 10:
          v38 = @"4k24";
          break;
        case 11:
          v38 = @"1080p25";
          break;
        case 12:
          v38 = @"4k25";
          break;
        case 13:
          v38 = @"4k120";
          break;
        case 14:
          v38 = @"4k100";
          break;
        default:
          switch(v21)
          {
            case 10000:
              v38 = @"ImagePickerHigh";
              break;
            case 10001:
              v38 = @"ImagePickerMedium";
              break;
            case 10002:
              v38 = @"ImagePickerLow";
              break;
            case 10003:
              v38 = @"ImagePickerVGA";
              break;
            case 10004:
              v38 = @"ImagePickeriFrame720p";
              break;
            case 10005:
              v38 = @"ImagePickeriFrame540p";
              break;
            default:
              v38 = 0;
              break;
          }
          break;
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v87 = v37;
      __int16 v88 = 2114;
      v89 = v38;
      v39 = "%{public}@ will override Cinematic format to %{public}@";
      break;
    case 8uLL:
      uint64_t v22 = 0;
      uint64_t v21 = 7;
      goto LABEL_92;
    default:
LABEL_7:
      uint64_t v22 = 0;
      uint64_t v21 = 0;
      goto LABEL_92;
  }
  _os_log_impl(&dword_2099F8000, v27, OS_LOG_TYPE_DEFAULT, v39, buf, 0x16u);

LABEL_91:
  uint64_t v22 = 0;
LABEL_92:
  v40 = [v9 objectForKeyedSubscript:@"devicePosition"];
  uint64_t v41 = [v40 integerValue];

  BOOL v42 = v41 == 1;
  v43 = +[CAMCaptureCapabilities capabilities];
  if (v17 > 9) {
    v44 = 0;
  }
  else {
    v44 = off_263FA05A0[v17];
  }
  v45 = @"BackAuto";
  if (v41 == 1) {
    v45 = @"FrontAuto";
  }
  switch(v21)
  {
    case 0:
      v46 = @"Auto";
      break;
    case 1:
      v46 = @"1080p60";
      break;
    case 2:
      v46 = @"720p120";
      break;
    case 3:
      v46 = @"720p240";
      break;
    case 4:
      v46 = @"1080p120";
      break;
    case 5:
      v46 = @"4k30";
      break;
    case 6:
      v46 = @"720p30";
      break;
    case 7:
      v46 = @"1080p30";
      break;
    case 8:
      v46 = @"1080p240";
      break;
    case 9:
      v46 = @"4k60";
      break;
    case 10:
      v46 = @"4k24";
      break;
    case 11:
      v46 = @"1080p25";
      break;
    case 12:
      v46 = @"4k25";
      break;
    case 13:
      v46 = @"4k120";
      break;
    case 14:
      v46 = @"4k100";
      break;
    default:
      switch(v21)
      {
        case 10000:
          v46 = @"ImagePickerHigh";
          break;
        case 10001:
          v46 = @"ImagePickerMedium";
          break;
        case 10002:
          v46 = @"ImagePickerLow";
          break;
        case 10003:
          v46 = @"ImagePickerVGA";
          break;
        case 10004:
          v46 = @"ImagePickeriFrame720p";
          break;
        case 10005:
          v46 = @"ImagePickeriFrame540p";
          break;
        default:
          v46 = 0;
          break;
      }
      break;
  }
  v47 = [NSString stringWithFormat:@"mode: %@ device: %@ format: %@", v44, v45, v46];
  if (!v22)
  {
    if ([v43 isSupportedVideoConfiguration:v21 forMode:v17 device:v42]) {
      goto LABEL_128;
    }
    v48 = [v8 testName];
    [NSString stringWithFormat:@"%@ is not supported", v47];
    goto LABEL_127;
  }
  if (([v43 isCTMVideoCaptureSupportedForMode:v17] & 1) == 0
    && ([v43 isTrueVideoSupportedForMode:v17] & 1) == 0)
  {
    v48 = [v8 testName];
    [NSString stringWithFormat:@"%@ ctmVideo is not supported", v47];
    v49 = LABEL_127:;
    [(CAMApplication *)v77 failedTest:v48 withFailure:v49];
  }
LABEL_128:
  v50 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    v51 = [v8 testName];
    *(_DWORD *)buf = 138543618;
    uint64_t v87 = (uint64_t)v51;
    __int16 v88 = 2114;
    v89 = v47;
    _os_log_impl(&dword_2099F8000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@ configured with %{public}@", buf, 0x16u);
  }
  v52 = v79;
  if ([v79 hasOverrides]) {
    [v12 readUserPreferencesAndHandleChangesWithOverrides:v79];
  }
  [v12 changeToMode:v17 device:v42];
  [v12 setTorchMode:0];
  v53 = [v9 objectForKeyedSubscript:@"initialDelayInSeconds"];
  [v53 doubleValue];
  double v55 = v54;

  v56 = [CAMViewfinderVideoCaptureTestHarness alloc];
  v57 = [v8 testName];
  v58 = [(CAMViewfinderVideoCaptureTestHarness *)v56 initWithTestName:v57 viewfinderViewController:v12 videoDurationInSeconds:v22 initialDelayInSeconds:v15 captureCTMVideo:v55];

  [v12 setVideoCaptureTestDelegate:v58];
  [v8 queueHarness:v58];
  v59 = [v9 objectForKeyedSubscript:@"captureStillsDuringVideo"];
  LODWORD(v57) = [v59 BOOLValue];

  if (v57)
  {
    v60 = [v9 valueForKey:@"pictureCount"];
    uint64_t v61 = [v60 integerValue];

    v62 = [v9 objectForKeyedSubscript:@"delayBetweenCaptures"];
    [v62 doubleValue];
    double v64 = v63;

    v65 = [v9 objectForKeyedSubscript:@"initialDelayInSeconds"];
    [v65 doubleValue];

    v66 = [CAMViewfinderStillImageCaptureTestHarness alloc];
    v67 = [v8 testName];
    LOBYTE(v76) = 0;
    v68 = [(CAMViewfinderStillImageCaptureTestHarness *)v66 initWithTestName:v67 maxStillImageCount:v61 expectedNumberOfCapturesPerRequest:1 viewfinderViewController:v12 performingWarmupCapture:0 forCaptureMode:v17 delayBetweenCaptures:v64 capturesOnTouchDown:v76];

    v69 = [CAMViewfinderActionIntervalometer alloc];
    v70 = [v9 valueForKey:@"repeatDelayInSeconds"];
    [v70 doubleValue];
    v71 = -[CAMViewfinderActionIntervalometer initWithDelegate:interval:delay:maximumCount:viewfinderViewController:](v69, "initWithDelegate:interval:delay:maximumCount:viewfinderViewController:", v68, v61, v12);

    [(CAMViewfinderStillImageCaptureTestHarness *)v68 setStillDuringVideo:1];
    [(CAMViewfinderStillImageCaptureTestHarness *)v68 setTestIntervalometer:v71];
    [v12 setStillImageCaptureTestDelegate:v68];
    [v8 queueHarness:v68];
    v83[0] = MEMORY[0x263EF8330];
    v83[1] = 3221225472;
    v83[2] = __89__CAMApplication_Testing__runTakeVideoTestWithTestPlan_options_userPreferencesOverrides___block_invoke;
    v83[3] = &unk_263FA0408;
    id v84 = v8;
    v72 = v68;
    v85 = v72;
    [(CAMViewfinderVideoCaptureTestHarness *)v58 setStartVideoHandler:v83];
    v80[0] = MEMORY[0x263EF8330];
    v80[1] = 3221225472;
    v80[2] = __89__CAMApplication_Testing__runTakeVideoTestWithTestPlan_options_userPreferencesOverrides___block_invoke_2;
    v80[3] = &unk_263FA0408;
    v52 = v79;
    v81 = v72;
    v82 = v71;
    v73 = v71;
    v74 = v72;
    [(CAMViewfinderVideoCaptureTestHarness *)v58 setEndVideoHandler:v80];
  }
  [v8 runWithSecondsDelay:2];

  return 1;
}

uint64_t __89__CAMApplication_Testing__runTakeVideoTestWithTestPlan_options_userPreferencesOverrides___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) runHarness:*(void *)(a1 + 40)];
}

uint64_t __89__CAMApplication_Testing__runTakeVideoTestWithTestPlan_options_userPreferencesOverrides___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isRunningTest];
  if (result)
  {
    [*(id *)(a1 + 40) stopAttemptingActions];
    id v3 = *(void **)(a1 + 32);
    return [v3 cancelTesting];
  }
  return result;
}

- (BOOL)runNewPPTUICaptureTestWithTestPlan:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CAMApplication *)self delegate];
  id v9 = [v8 viewfinderViewController];
  id v10 = +[CAMCaptureCapabilities capabilities];
  v11 = [v6 testName];
  char v12 = [v10 captureOnTouchDown];
  if ([v11 rangeOfString:@"Portrait"] != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_4;
  }
  v13 = [v7 objectForKeyedSubscript:@"captureMode"];

  if (!v13)
  {
    uint64_t v15 = 0;
    goto LABEL_6;
  }
  double v14 = [v7 objectForKeyedSubscript:@"captureMode"];
  uint64_t v15 = [v14 integerValue];

  if (v15 == 6)
  {
LABEL_4:
    [v7 setValue:&unk_26BDDD950 forKey:@"expectedNumberOfCapturesPerRequest"];
    char v12 = 1;
    uint64_t v15 = 6;
  }
LABEL_6:
  v67 = v10;
  if ([v11 rangeOfString:@"Front"] != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_10;
  }
  v16 = [v7 objectForKeyedSubscript:@"devicePosition"];

  if (!v16) {
    goto LABEL_11;
  }
  unint64_t v17 = [v7 objectForKeyedSubscript:@"devicePosition"];
  double v64 = v9;
  v18 = v8;
  v19 = v11;
  id v20 = v6;
  uint64_t v21 = v15;
  uint64_t v22 = self;
  char v23 = v12;
  uint64_t v24 = [v17 integerValue];

  BOOL v25 = v24 == 1;
  char v12 = v23;
  self = v22;
  uint64_t v15 = v21;
  id v6 = v20;
  v11 = v19;
  id v8 = v18;
  id v9 = v64;
  if (v25)
  {
LABEL_10:
    int v26 = [v10 isFrontAutomaticHDRSupported];
    uint64_t v27 = 1;
  }
  else
  {
LABEL_11:
    int v26 = [v10 isBackAutomaticHDRSupported];
    uint64_t v27 = 0;
  }
  if (v26) {
    uint64_t v28 = 2;
  }
  else {
    uint64_t v28 = 0;
  }
  [v9 setHDRMode:v28];
  v29 = [v7 objectForKeyedSubscript:@"flashMode"];

  char v65 = v12;
  if (v29)
  {
    v30 = [v7 objectForKeyedSubscript:@"flashMode"];
    v29 = (void *)[v30 integerValue];
  }
  v31 = [v7 objectForKeyedSubscript:@"livePhotoMode"];

  v66 = v8;
  if (v31)
  {
    v32 = [v7 objectForKeyedSubscript:@"livePhotoMode"];
    uint64_t v33 = [v32 integerValue];
  }
  else
  {
    uint64_t v33 = 1;
  }
  [v9 setFlashMode:v29];
  [v9 setLivePhotoMode:v33];
  uint64_t v34 = [v7 objectForKeyedSubscript:@"rawMode"];

  if (v34)
  {
    v35 = [v7 objectForKeyedSubscript:@"rawMode"];
    uint64_t v34 = [v35 integerValue];
  }
  if ([v11 rangeOfString:@"RAW"] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v36 = +[CAMUserPreferences preferences];
    if ([v36 rawControlEnabled])
    {
      char v37 = [v67 isLinearDNGSupported];

      if (v37)
      {
        uint64_t v34 = 1;
        goto LABEL_28;
      }
    }
    else
    {
    }
    [(CAMApplication *)self failedTest:v11 withFailure:@"RAW Control must be enabled for RAW PPT tests!"];
  }
LABEL_28:
  v38 = [v7 objectForKeyedSubscript:@"photoResolution"];

  if (v38)
  {
    v39 = [v7 objectForKeyedSubscript:@"photoResolution"];
    uint64_t v40 = [v39 integerValue];
  }
  else
  {
    uint64_t v40 = 0;
  }
  [v9 setPhotoResolution:v40];
  [v9 setRawMode:v34];
  [v9 changeToMode:v15 device:v27 animated:1];
  sleep(2u);
  BOOL v41 = [v11 rangeOfString:@"Warm"] != 0x7FFFFFFFFFFFFFFFLL;
  BOOL v42 = [v7 objectForKeyedSubscript:@"expectedNumberOfCapturesPerRequest"];
  uint64_t v43 = [v42 unsignedIntegerValue];

  v44 = [v7 valueForKey:@"pictureCount"];
  uint64_t v45 = [v44 integerValue];

  v46 = [v7 objectForKeyedSubscript:@"delayBetweenCaptures"];
  [v46 doubleValue];
  double v48 = v47;

  v49 = [v7 objectForKeyedSubscript:@"initialDelayInSeconds"];
  [v49 doubleValue];

  LOBYTE(v63) = v65;
  v50 = [[CAMViewfinderStillImageCaptureTestHarness alloc] initWithTestName:v11 maxStillImageCount:v45 expectedNumberOfCapturesPerRequest:v43 viewfinderViewController:v9 performingWarmupCapture:v41 forCaptureMode:v15 delayBetweenCaptures:v48 capturesOnTouchDown:v63];
  v51 = [CAMViewfinderActionIntervalometer alloc];
  v52 = [v7 valueForKey:@"repeatDelayInSeconds"];
  [v52 doubleValue];
  v53 = -[CAMViewfinderActionIntervalometer initWithDelegate:interval:delay:maximumCount:viewfinderViewController:](v51, "initWithDelegate:interval:delay:maximumCount:viewfinderViewController:", v50, v45, v9);

  [(CAMViewfinderStillImageCaptureTestHarness *)v50 setTestIntervalometer:v53];
  [v9 setStillImageCaptureTestDelegate:v50];
  [v6 queueHarness:v50];
  [v6 setSettlingDelaySeconds:5];
  double v54 = [v7 objectForKeyedSubscript:@"presentCameraRoll"];
  LODWORD(v51) = [v54 BOOLValue];

  double v55 = [v7 objectForKeyedSubscript:@"presentCameraRollDelay"];
  [v55 doubleValue];
  double v57 = v56;

  if (v51)
  {
    v58 = [CAMCameraRollTestHarness alloc];
    double v59 = 0.5;
    if (v57 > 0.0) {
      double v59 = v57;
    }
    v60 = [(CAMCameraRollTestHarness *)v58 initWithTestName:v11 viewfinderViewController:v9 testingAnimation:1 testingWarmPresentation:0 awaitPreload:0 settlingDelay:v59];
    [v6 queueHarness:v60];
    v68[0] = MEMORY[0x263EF8330];
    v68[1] = 3221225472;
    v68[2] = __70__CAMApplication_Testing__runNewPPTUICaptureTestWithTestPlan_options___block_invoke;
    v68[3] = &unk_263FA0408;
    id v69 = v6;
    v70 = v60;
    uint64_t v61 = v60;
    [(CAMViewfinderStillImageCaptureTestHarness *)v50 setDidUpdateFinalThumbnailHandler:v68];
  }
  [v6 run];

  return 1;
}

uint64_t __70__CAMApplication_Testing__runNewPPTUICaptureTestWithTestPlan_options___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) runHarness:*(void *)(a1 + 40)];
}

- (BOOL)runTakePictureTestWithTestPlan:(id)a3 options:(id)a4 prototype:(id)a5 forCaptureMode:(int64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [(CAMApplication *)self delegate];
  double v14 = [v12 testName];
  BOOL v15 = [v14 rangeOfString:@"Warm"] != 0x7FFFFFFFFFFFFFFFLL;
  v16 = [v11 objectForKeyedSubscript:@"expectedNumberOfCapturesPerRequest"];
  uint64_t v17 = [v16 unsignedIntegerValue];

  v18 = [v11 objectForKeyedSubscript:@"delayBetweenCaptures"];
  [v18 doubleValue];
  double v20 = v19;

  uint64_t v21 = [v11 objectForKeyedSubscript:@"initialDelayInSeconds"];
  [v21 doubleValue];
  double v23 = v22;

  uint64_t v24 = [v13 captureController];
  BOOL v25 = [[CAMIntervalometerTestHarness alloc] initWithTestName:v14 expectedNumberOfCapturesPerRequest:v17 captureController:v24 performingWarmupCapture:v15 forCaptureMode:a6 delayBetweenCaptures:v20];
  [v10 setDelegate:v25];
  int v26 = [CAMCaptureRequestIntervalometer alloc];
  uint64_t v27 = [v11 valueForKey:@"repeatDelayInSeconds"];
  [v27 doubleValue];
  double v29 = v28;
  v30 = [v11 valueForKey:@"pictureCount"];

  v31 = -[CAMCaptureRequestIntervalometer initWithDelegate:interval:delay:maximumCount:](v26, "initWithDelegate:interval:delay:maximumCount:", v25, [v30 integerValue], v29, v23);
  [(CAMCaptureRequestIntervalometer *)v31 setPrototypeRequest:v10];

  [(CAMIntervalometerTestHarness *)v25 setTestIntervalometer:v31];
  [v12 queueHarness:v25];
  [v12 setSettlingDelaySeconds:5];
  [v12 run];

  return 1;
}

- (BOOL)runTakePictureFrontCameraWithTestPlan:(id)a3 options:(id)a4 prototype:(id)a5 forCaptureMode:(int64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [(CAMApplication *)self delegate];
  double v14 = [v13 viewfinderViewController];
  BOOL v15 = [CAMDeviceAndModeTestHarness alloc];
  v16 = [v12 testName];
  uint64_t v17 = [(CAMDeviceAndModeTestHarness *)v15 initWithTestName:v16 devicePosition:1 captureMode:0 viewFinderViewControl:v14];

  [(CAMPerformanceTestHarness *)v17 setIsSetupHarness:1];
  [v12 queueHarness:v17];
  v18 = [CAMDelayTestHarness alloc];
  double v19 = [v12 testName];
  double v20 = [(CAMDelayTestHarness *)v18 initWithTestName:v19 secondsDelay:2];

  [(CAMPerformanceTestHarness *)v20 setIsSetupHarness:1];
  [v12 queueHarness:v20];
  LOBYTE(a6) = [(CAMApplication *)self runTakePictureTestWithTestPlan:v12 options:v11 prototype:v10 forCaptureMode:a6];

  return a6;
}

- (BOOL)runTakePicturePortraitWithTestPlan:(id)a3 options:(id)a4 prototype:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CAMApplication *)self delegate];
  id v12 = [v11 viewfinderViewController];
  v13 = [CAMDeviceAndModeTestHarness alloc];
  double v14 = [v10 testName];
  BOOL v15 = [(CAMDeviceAndModeTestHarness *)v13 initWithTestName:v14 devicePosition:0 captureMode:6 viewFinderViewControl:v12];

  [v10 queueHarness:v15];
  v16 = [CAMDelayTestHarness alloc];
  uint64_t v17 = [v10 testName];
  v18 = [(CAMDelayTestHarness *)v16 initWithTestName:v17 secondsDelay:2];

  [(CAMPerformanceTestHarness *)v18 setIsSetupHarness:1];
  [v10 queueHarness:v18];
  LOBYTE(self) = [(CAMApplication *)self runTakePictureTestWithTestPlan:v10 options:v9 prototype:v8 forCaptureMode:6];

  return (char)self;
}

- (BOOL)runTakePictureFrontPortraitWithTestPlan:(id)a3 options:(id)a4 prototype:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CAMApplication *)self delegate];
  id v12 = [v11 viewfinderViewController];
  v13 = [CAMDeviceAndModeTestHarness alloc];
  double v14 = [v10 testName];
  BOOL v15 = [(CAMDeviceAndModeTestHarness *)v13 initWithTestName:v14 devicePosition:1 captureMode:6 viewFinderViewControl:v12];

  [v10 queueHarness:v15];
  v16 = [CAMDelayTestHarness alloc];
  uint64_t v17 = [v10 testName];
  v18 = [(CAMDelayTestHarness *)v16 initWithTestName:v17 secondsDelay:2];

  [(CAMPerformanceTestHarness *)v18 setIsSetupHarness:1];
  [v10 queueHarness:v18];
  LOBYTE(self) = [(CAMApplication *)self runTakePictureTestWithTestPlan:v10 options:v9 prototype:v8 forCaptureMode:6];

  return (char)self;
}

- (BOOL)runSwitchToPortraitFrontWithTestPlan:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CAMApplication *)self delegate];
  id v9 = [v6 testName];
  id v10 = [v8 viewfinderViewController];
  uint64_t v11 = [v9 rangeOfString:@"Animation"];
  id v12 = +[CAMCaptureCapabilities capabilities];
  v13 = [v7 objectForKeyedSubscript:@"testExtensionSeconds"];

  [v13 doubleValue];
  double v15 = v14;

  if ([v12 isPortraitModeSupportedForDevicePosition:1]
    && [v12 isPortraitModeSupportedForDevicePosition:0])
  {
    v16 = [[CAMDeviceSwitchTestHarness alloc] initWithTestName:v9 viewfinderViewController:v10 devicePosition:1 testingAnimation:v11 != 0x7FFFFFFFFFFFFFFFLL startingCaptureMode:6 testExtensionSeconds:v15];
  }
  else
  {
    v16 = [[CAMModeSwitchTestHarness alloc] initWithTestName:v9 viewfinderViewController:v10 mode:6 testingAnimation:v11 != 0x7FFFFFFFFFFFFFFFLL testExtensionSeconds:v15];
  }
  uint64_t v17 = v16;
  [v6 queueHarness:v16];
  [v6 run];

  return 1;
}

- (BOOL)runSwitchCamerasTestWithTestPlan:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 testName];
  id v9 = [(CAMApplication *)self delegate];
  id v10 = [v9 viewfinderViewController];
  BOOL v11 = [v8 rangeOfString:@"Front"] != 0x7FFFFFFFFFFFFFFFLL;
  BOOL v12 = [v8 rangeOfString:@"Animation"] != 0x7FFFFFFFFFFFFFFFLL;
  v13 = [v6 objectForKeyedSubscript:@"testExtensionSeconds"];

  [v13 doubleValue];
  double v15 = v14;

  v16 = [[CAMDeviceSwitchTestHarness alloc] initWithTestName:v8 viewfinderViewController:v10 devicePosition:v11 testingAnimation:v12 startingCaptureMode:0 testExtensionSeconds:v15];
  [v7 queueHarness:v16];
  [v7 run];

  return 1;
}

- (BOOL)runSwitchModesWithTestPlan:(id)a3 options:(id)a4 userPreferencesOverrides:(id)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [v8 testName];
  if ([v11 rangeOfString:@"SwitchToPano"] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v14 = 3;
    goto LABEL_18;
  }
  if ([v11 rangeOfString:@"SwitchToStill"] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v14 = 0;
    goto LABEL_18;
  }
  if ([v11 rangeOfString:@"SwitchToVideo"] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v14 = 1;
    goto LABEL_18;
  }
  if ([v11 rangeOfString:@"SwitchToTimeLapse"] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v14 = 5;
    goto LABEL_18;
  }
  if ([v11 rangeOfString:@"SwitchToSquare"] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v14 = 4;
    goto LABEL_18;
  }
  if ([v11 rangeOfString:@"SwitchToSloMo"] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v14 = 2;
    goto LABEL_18;
  }
  if ([v11 rangeOfString:@"SwitchToPortrait"] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v14 = 6;
    goto LABEL_18;
  }
  if ([v11 rangeOfString:@"SwitchToMode"] == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_92:
    BOOL v41 = 0;
    goto LABEL_90;
  }
  BOOL v12 = [v9 objectForKeyedSubscript:@"captureMode"];
  if (!v12)
  {
    uint64_t v43 = [NSString stringWithFormat:@"Missing defaults write for %@", @"PPTMode"];
    [(CAMApplication *)self failedTest:v11 withFailure:v43];

    goto LABEL_92;
  }
  v13 = v12;
  uint64_t v14 = [v12 integerValue];

LABEL_18:
  double v15 = [(CAMApplication *)self delegate];
  v16 = [v15 viewfinderViewController];
  uint64_t v17 = [v11 rangeOfString:@"Animation"];
  if (v14 == 7 || v14 == 1)
  {
    uint64_t v45 = v17;
    v46 = v15;
    v18 = [v10 videoConfiguration];

    unint64_t v19 = v14 - 1;
    v44 = self;
    if (v14 == 1 && v18)
    {
      double v20 = [v10 videoConfiguration];
    }
    else
    {
      uint64_t v21 = [v10 cinematicConfiguration];

      uint64_t v22 = 0;
      if (v14 != 7 || !v21)
      {
LABEL_53:
        id v47 = v9;
        int v26 = [v9 objectForKeyedSubscript:@"devicePosition"];
        uint64_t v27 = [v26 integerValue];

        BOOL v28 = v27 == 1;
        double v29 = +[CAMCaptureCapabilities capabilities];
        if (v19 > 6) {
          v30 = 0;
        }
        else {
          v30 = off_263FA05F0[v19];
        }
        double v15 = v46;
        v31 = @"BackAuto";
        if (v27 == 1) {
          v31 = @"FrontAuto";
        }
        switch(v22)
        {
          case 0:
            v32 = @"Auto";
            break;
          case 1:
            v32 = @"1080p60";
            break;
          case 2:
            v32 = @"720p120";
            break;
          case 3:
            v32 = @"720p240";
            break;
          case 4:
            v32 = @"1080p120";
            break;
          case 5:
            v32 = @"4k30";
            break;
          case 6:
            v32 = @"720p30";
            break;
          case 7:
            v32 = @"1080p30";
            break;
          case 8:
            v32 = @"1080p240";
            break;
          case 9:
            v32 = @"4k60";
            break;
          case 10:
            v32 = @"4k24";
            break;
          case 11:
            v32 = @"1080p25";
            break;
          case 12:
            v32 = @"4k25";
            break;
          case 13:
            v32 = @"4k120";
            break;
          case 14:
            v32 = @"4k100";
            break;
          default:
            switch(v22)
            {
              case 10000:
                v32 = @"ImagePickerHigh";
                break;
              case 10001:
                v32 = @"ImagePickerMedium";
                break;
              case 10002:
                v32 = @"ImagePickerLow";
                break;
              case 10003:
                v32 = @"ImagePickerVGA";
                break;
              case 10004:
                v32 = @"ImagePickeriFrame720p";
                break;
              case 10005:
                v32 = @"ImagePickeriFrame540p";
                break;
              default:
                v32 = 0;
                break;
            }
            break;
        }
        uint64_t v33 = [NSString stringWithFormat:@"mode: %@ device: %@ format: %@", v30, v31, v32];
        if (([v29 isSupportedVideoConfiguration:v22 forMode:v14 device:v28] & 1) == 0)
        {
          uint64_t v34 = [NSString stringWithFormat:@"%@ is not supported", v33];
          [(CAMApplication *)v44 failedTest:v11 withFailure:v34];
        }
        v35 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v49 = v11;
          __int16 v50 = 2114;
          v51 = v33;
          _os_log_impl(&dword_2099F8000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ configured with %{public}@", buf, 0x16u);
        }

        if ([v10 hasOverrides]) {
          [v16 readUserPreferencesAndHandleChangesWithOverrides:v10];
        }

        id v9 = v47;
        uint64_t v17 = v45;
        goto LABEL_89;
      }
      double v20 = [v10 cinematicConfiguration];
    }
    double v23 = v20;
    uint64_t v22 = [v20 integerValue];

    uint64_t v24 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      switch(v22)
      {
        case 0:
          BOOL v25 = @"Auto";
          break;
        case 1:
          BOOL v25 = @"1080p60";
          break;
        case 2:
          BOOL v25 = @"720p120";
          break;
        case 3:
          BOOL v25 = @"720p240";
          break;
        case 4:
          BOOL v25 = @"1080p120";
          break;
        case 5:
          BOOL v25 = @"4k30";
          break;
        case 6:
          BOOL v25 = @"720p30";
          break;
        case 7:
          BOOL v25 = @"1080p30";
          break;
        case 8:
          BOOL v25 = @"1080p240";
          break;
        case 9:
          BOOL v25 = @"4k60";
          break;
        case 10:
          BOOL v25 = @"4k24";
          break;
        case 11:
          BOOL v25 = @"1080p25";
          break;
        case 12:
          BOOL v25 = @"4k25";
          break;
        case 13:
          BOOL v25 = @"4k120";
          break;
        case 14:
          BOOL v25 = @"4k100";
          break;
        default:
          switch(v22)
          {
            case 10000:
              BOOL v25 = @"ImagePickerHigh";
              break;
            case 10001:
              BOOL v25 = @"ImagePickerMedium";
              break;
            case 10002:
              BOOL v25 = @"ImagePickerLow";
              break;
            case 10003:
              BOOL v25 = @"ImagePickerVGA";
              break;
            case 10004:
              BOOL v25 = @"ImagePickeriFrame720p";
              break;
            case 10005:
              BOOL v25 = @"ImagePickeriFrame540p";
              break;
            default:
              BOOL v25 = 0;
              break;
          }
          break;
      }
      *(_DWORD *)buf = 138543618;
      v49 = v11;
      __int16 v50 = 2114;
      v51 = v25;
      _os_log_impl(&dword_2099F8000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ will override Video format to %{public}@", buf, 0x16u);
    }

    goto LABEL_53;
  }
LABEL_89:
  BOOL v36 = v17 != 0x7FFFFFFFFFFFFFFFLL;
  char v37 = [v9 objectForKeyedSubscript:@"testExtensionSeconds"];
  [v37 doubleValue];
  double v39 = v38;

  uint64_t v40 = [[CAMModeSwitchTestHarness alloc] initWithTestName:v11 viewfinderViewController:v16 mode:v14 testingAnimation:v36 testExtensionSeconds:v39];
  [v8 queueHarness:v40];
  [v8 run];

  BOOL v41 = 1;
LABEL_90:

  return v41;
}

- (BOOL)runPresentCameraRollWithTestPlan:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 testName];
  id v9 = [v6 objectForKeyedSubscript:@"presentCameraRollDelay"];

  [v9 doubleValue];
  double v11 = v10;

  uint64_t v12 = [v8 rangeOfString:@"AfterDelay"];
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v8 rangeOfString:@"SecondTime"] == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v13 = 0;
      BOOL v14 = [v8 rangeOfString:@"Animation"] != 0x7FFFFFFFFFFFFFFFLL;
      double v11 = 0.0;
    }
    else
    {
      BOOL v14 = 0;
      double v11 = 3.0;
      uint64_t v13 = 1;
    }
  }
  else
  {
    uint64_t v13 = 0;
    BOOL v14 = 0;
    if (v11 <= 0.0) {
      double v11 = 6.0;
    }
  }
  double v15 = [(CAMApplication *)self delegate];
  v16 = [v15 viewfinderViewController];
  uint64_t v17 = [[CAMCameraRollTestHarness alloc] initWithTestName:v8 viewfinderViewController:v16 testingAnimation:v14 testingWarmPresentation:v13 awaitPreload:v12 != 0x7FFFFFFFFFFFFFFFLL settlingDelay:v11];
  [v7 queueHarness:v17];
  [v7 run];

  return 1;
}

- (BOOL)runLibrarySelectionWithTestPlan:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = [(CAMApplication *)self delegate];
  id v7 = [v6 viewfinderViewController];

  id v8 = [v7 _librarySelectionController];
  id v9 = [CAMLibrarySelectionTestHarness alloc];
  double v10 = [v5 testName];
  double v11 = [(CAMLibrarySelectionTestHarness *)v9 initWithTestName:v10 librarySelectionController:v8];

  [v5 queueHarness:v11];
  [v5 run];

  return 1;
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (objc_class *)MEMORY[0x263EFF9A0];
  id v8 = a4;
  id v9 = (void *)[[v7 alloc] initWithDictionary:v8];

  double v10 = objc_alloc_init(CAMUserPreferenceOverrides);
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"PPTDelayBetweenCapturesMilliseconds", @"com.apple.camera", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    uint64_t v12 = [NSNumber numberWithDouble:(double)AppIntegerValue / 1000.0];
    [v9 setObject:v12 forKeyedSubscript:@"delayBetweenCaptures"];
  }
  Boolean v86 = 0;
  CFIndex v13 = CFPreferencesGetAppIntegerValue(@"PPTInitialDelayMilliseconds", @"com.apple.camera", &v86);
  if (v86)
  {
    BOOL v14 = [NSNumber numberWithDouble:(double)v13 / 1000.0];
    [v9 setObject:v14 forKeyedSubscript:@"initialDelayInSeconds"];
  }
  Boolean v85 = 0;
  CFIndex v15 = CFPreferencesGetAppIntegerValue(@"PPTPhotoCount", @"com.apple.camera", &v85);
  if (v85)
  {
    v16 = [NSNumber numberWithLong:v15];
    [v9 setObject:v16 forKeyedSubscript:@"pictureCount"];
  }
  Boolean v84 = 0;
  CFIndex v17 = CFPreferencesGetAppIntegerValue(@"PPTPresentCameraRoll", @"com.apple.camera", &v84);
  if (v84)
  {
    v18 = [NSNumber numberWithLong:v17];
    [v9 setObject:v18 forKeyedSubscript:@"presentCameraRoll"];
  }
  Boolean v83 = 0;
  CFIndex v19 = CFPreferencesGetAppIntegerValue(@"PPTCaptureStillsDuringVideo", @"com.apple.camera", &v83);
  if (v83)
  {
    double v20 = [NSNumber numberWithLong:v19];
    [v9 setObject:v20 forKeyedSubscript:@"captureStillsDuringVideo"];
  }
  Boolean v82 = 0;
  CFIndex v21 = CFPreferencesGetAppIntegerValue(@"PPTVideoRecordDurationInSeconds", @"com.apple.camera", &v82);
  if (v82)
  {
    uint64_t v22 = [NSNumber numberWithLong:v21];
    [v9 setObject:v22 forKeyedSubscript:@"videoDurationInSeconds"];
  }
  Boolean v81 = 0;
  CFIndex v23 = CFPreferencesGetAppIntegerValue(@"PPTMode", @"com.apple.camera", &v81);
  if (v81)
  {
    uint64_t v24 = [NSNumber numberWithLong:v23];
    [v9 setObject:v24 forKeyedSubscript:@"captureMode"];
  }
  Boolean v80 = 0;
  CFIndex v25 = CFPreferencesGetAppIntegerValue(@"PPTDevicePosition", @"com.apple.camera", &v80);
  if (v80)
  {
    int v26 = [NSNumber numberWithLong:v25];
    [v9 setObject:v26 forKeyedSubscript:@"devicePosition"];
  }
  Boolean v79 = 0;
  CFIndex v27 = CFPreferencesGetAppIntegerValue(@"PPTVideoConfiguration", @"com.apple.camera", &v79);
  if (v79)
  {
    BOOL v28 = [NSNumber numberWithLong:v27];
    [(CAMUserPreferenceOverrides *)v10 setVideoConfiguration:v28];
  }
  Boolean v78 = 0;
  CFIndex v29 = CFPreferencesGetAppIntegerValue(@"PPTSloMoConfiguration", @"com.apple.camera", &v78);
  if (v78)
  {
    v30 = [NSNumber numberWithLong:v29];
    [(CAMUserPreferenceOverrides *)v10 setSlomoConfiguration:v30];
  }
  Boolean v77 = 0;
  CFIndex v31 = CFPreferencesGetAppIntegerValue(@"PPTCinematicConfiguration", @"com.apple.camera", &v77);
  if (v77)
  {
    v32 = [NSNumber numberWithLong:v31];
    [(CAMUserPreferenceOverrides *)v10 setCinematicConfiguration:v32];
  }
  char v76 = 0;
  +[CAMPreferencesUtilities doubleForKey:@"PPTTestExtensionSeconds" applicationID:@"com.apple.camera" keyIsValidAndExists:&v76];
  if (v76)
  {
    uint64_t v33 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v9 setObject:v33 forKeyedSubscript:@"testExtensionSeconds"];
  }
  Boolean v75 = 0;
  CFIndex v34 = CFPreferencesGetAppIntegerValue(@"PPTFlashMode", @"com.apple.camera", &v75);
  if (v75)
  {
    v35 = [NSNumber numberWithLong:v34];
    [v9 setObject:v35 forKeyedSubscript:@"flashMode"];
  }
  Boolean v74 = 0;
  CFIndex v36 = CFPreferencesGetAppIntegerValue(@"PPTLivePhotoMode", @"com.apple.camera", &v74);
  if (v74)
  {
    char v37 = [NSNumber numberWithLong:v36];
    [v9 setObject:v37 forKeyedSubscript:@"livePhotoMode"];
  }
  Boolean v73 = 0;
  CFIndex v38 = CFPreferencesGetAppIntegerValue(@"PPTPhotoResolution", @"com.apple.camera", &v73);
  if (v73)
  {
    double v39 = [NSNumber numberWithLong:v38];
    [v9 setObject:v39 forKeyedSubscript:@"photoResolution"];
  }
  Boolean v72 = 0;
  CFIndex v40 = CFPreferencesGetAppIntegerValue(@"PPTRAWMode", @"com.apple.camera", &v72);
  if (v72)
  {
    BOOL v41 = [NSNumber numberWithLong:v40];
    [v9 setObject:v41 forKeyedSubscript:@"rawMode"];
  }
  Boolean v71 = 0;
  CFIndex v42 = CFPreferencesGetAppIntegerValue(@"PPTPresentCameraRollDelayMilliseconds", @"com.apple.camera", &v71);
  if (v71)
  {
    uint64_t v43 = [NSNumber numberWithDouble:(double)v42 / 1000.0];
    [v9 setObject:v43 forKeyedSubscript:@"presentCameraRollDelay"];
  }
  v44 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v89 = v6;
    __int16 v90 = 2114;
    v91 = v9;
    _os_log_impl(&dword_2099F8000, v44, OS_LOG_TYPE_DEFAULT, "Running PPT test %{public}@ with options %{public}@", buf, 0x16u);
  }

  uint64_t v45 = [[CAMPerformanceTestPlan alloc] initWithTestName:v6];
  [(CAMApplication *)self setCurrentTestPlan:v45];
  v70[0] = MEMORY[0x263EF8330];
  v70[1] = 3221225472;
  v70[2] = __43__CAMApplication_Testing__runTest_options___block_invoke;
  v70[3] = &unk_263FA0208;
  v70[4] = self;
  [(CAMPerformanceTestPlan *)v45 setCompletionHandler:v70];
  if ([v6 rangeOfString:@"UI"] != 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v6 rangeOfString:@"Video"] == 0x7FFFFFFFFFFFFFFFLL) {
      unsigned __int8 v46 = [(CAMApplication *)self runNewPPTUICaptureTestWithTestPlan:v45 options:v9];
    }
    else {
      unsigned __int8 v46 = [(CAMApplication *)self runTakeVideoTestWithTestPlan:v45 options:v9 userPreferencesOverrides:v10];
    }
LABEL_93:
    BOOL v66 = v46;
    goto LABEL_94;
  }
  [v9 setValue:&unk_26BDDD968 forKey:@"expectedNumberOfCapturesPerRequest"];
  if ([v6 rangeOfString:@"TakePicture"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v6 rangeOfString:@"PresentCameraRoll"] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v6 rangeOfString:@"SwitchTo"] == 0x7FFFFFFFFFFFFFFFLL)
      {
        if ([v6 rangeOfString:@"LibrarySelection"] == 0x7FFFFFFFFFFFFFFFLL)
        {
          v69.receiver = self;
          v69.super_class = (Class)CAMApplication;
          unsigned __int8 v46 = [(CAMApplication *)&v69 runTest:v6 options:v9];
        }
        else
        {
          unsigned __int8 v46 = [(CAMApplication *)self runLibrarySelectionWithTestPlan:v45 options:v9];
        }
      }
      else if ([v6 rangeOfString:@"FrontPortrait"] == 0x7FFFFFFFFFFFFFFFLL)
      {
        if ([v6 rangeOfString:@"FrontCamera"] == 0x7FFFFFFFFFFFFFFFLL
          && [v6 rangeOfString:@"RearCamera"] == 0x7FFFFFFFFFFFFFFFLL)
        {
          unsigned __int8 v46 = [(CAMApplication *)self runSwitchModesWithTestPlan:v45 options:v9 userPreferencesOverrides:v10];
        }
        else
        {
          unsigned __int8 v46 = [(CAMApplication *)self runSwitchCamerasTestWithTestPlan:v45 options:v9];
        }
      }
      else
      {
        unsigned __int8 v46 = [(CAMApplication *)self runSwitchToPortraitFrontWithTestPlan:v45 options:v9];
      }
    }
    else
    {
      unsigned __int8 v46 = [(CAMApplication *)self runPresentCameraRollWithTestPlan:v45 options:v9];
    }
    goto LABEL_93;
  }
  v68 = v10;
  id v47 = objc_alloc_init(CAMMutableStillImageCaptureRequest);
  double v48 = +[CAMUserPreferences preferences];
  if ([v6 rangeOfString:@"Default"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v6 rangeOfString:@"HDR"] == 0x7FFFFFFFFFFFFFFFLL)
    {
      [(CAMMutableStillImageCaptureRequest *)v47 setHdrMode:0];
    }
    else
    {
      [(CAMMutableStillImageCaptureRequest *)v47 setHdrMode:1];
      if ([v48 shouldCaptureHDREV0]) {
        v51 = &unk_26BDDD950;
      }
      else {
        v51 = &unk_26BDDD968;
      }
      [v9 setValue:v51 forKey:@"expectedNumberOfCapturesPerRequest"];
    }
  }
  else
  {
    v49 = +[CAMCaptureCapabilities capabilities];
    if ([v6 rangeOfString:@"Front"] == 0x7FFFFFFFFFFFFFFFLL) {
      int v50 = [v49 isBackAutomaticHDRSupported];
    }
    else {
      int v50 = [v49 isFrontAutomaticHDRSupported];
    }
    if (v50) {
      uint64_t v52 = 2;
    }
    else {
      uint64_t v52 = 0;
    }
    [(CAMMutableStillImageCaptureRequest *)v47 setHdrMode:v52];
    if ([v48 shouldCaptureHDREV0]) {
      [(CAMApplication *)self failedTest:v6 withFailure:@"Keep Normal Photo should be off for default photo capture tests"];
    }
    -[CAMMutableStillImageCaptureRequest setWantsSemanticSceneFilter:](v47, "setWantsSemanticSceneFilter:", [v48 semanticDevelopmentEnabled]);
  }
  BOOL v53 = [v6 rangeOfString:@"Iris"] != 0x7FFFFFFFFFFFFFFFLL
     || [v6 rangeOfString:@"Default"] != 0x7FFFFFFFFFFFFFFFLL;
  [(CAMMutableStillImageCaptureRequest *)v47 setIrisMode:v53];
  if ([v6 rangeOfString:@"Stabilization"] == 0x7FFFFFFFFFFFFFFFLL
    && [v6 rangeOfString:@"Default"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(CAMMutableStillImageCaptureRequest *)v47 setPhotoQualityPrioritization:0];
  }
  else
  {
    double v54 = [(CAMApplication *)self delegate];
    double v55 = [v54 viewfinderViewController];
    uint64_t v56 = [v55 currentCaptureMode];
    double v57 = +[CAMCaptureCapabilities capabilities];
    unint64_t v58 = [v55 currentCaptureDevice] - 1;
    if (v58 > 0xA) {
      uint64_t v59 = 0;
    }
    else {
      uint64_t v59 = qword_209C78D48[v58];
    }
    -[CAMMutableStillImageCaptureRequest setPhotoQualityPrioritization:](v47, "setPhotoQualityPrioritization:", [v57 maxSupportedPhotoQualityPrioritizationForMode:v56 devicePosition:v59]);
  }
  if ([v6 rangeOfString:@"Portrait"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(CAMMutableStillImageCaptureRequest *)v47 setWantsDepthData:0];
  }
  else
  {
    [(CAMMutableStillImageCaptureRequest *)v47 setWantsDepthData:1];
    [(CAMMutableStillImageCaptureRequest *)v47 setHdrMode:2];
    uint64_t v60 = objc_msgSend(v48, "ppt_readPortraitLightingType");
    [(CAMMutableStillImageCaptureRequest *)v47 setLightingEffectType:v60];
    uint64_t v61 = +[CAMEffectFilterManager filtersForFilterType:16 lightingType:v60 applyDepthEffect:1];
    [(CAMMutableStillImageCaptureRequest *)v47 setAdjustmentFilters:v61];
    [v9 setValue:&unk_26BDDD950 forKey:@"expectedNumberOfCapturesPerRequest"];
  }
  [(CAMMutableStillImageCaptureRequest *)v47 setFlashMode:0];
  [(CAMMutableStillImageCaptureRequest *)v47 setWantsAudioForCapture:1];
  uint64_t v62 = [v48 photoEncodingBehavior];
  uint64_t v63 = [v48 captureConfiguration];
  uint64_t v64 = objc_msgSend(v48, "videoEncodingBehaviorForConfiguration:mode:desiredProResVideoMode:outputToExternalStorage:spatialVideoEnabled:", 0, 0, objc_msgSend(v63, "proResVideoMode"), 0, 0);

  [(CAMMutableStillImageCaptureRequest *)v47 setPhotoEncodingBehavior:v62];
  [(CAMMutableStillImageCaptureRequest *)v47 setVideoEncodingBehavior:v64];
  if ([v6 rangeOfString:@"Front"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v6 rangeOfString:@"Portrait"] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v6 rangeOfString:@"Flash"] != 0x7FFFFFFFFFFFFFFFLL) {
        [(CAMMutableStillImageCaptureRequest *)v47 setFlashMode:1];
      }
      BOOL v65 = [(CAMApplication *)self runTakePictureTestWithTestPlan:v45 options:v9 prototype:v47 forCaptureMode:0];
    }
    else
    {
      BOOL v65 = [(CAMApplication *)self runTakePicturePortraitWithTestPlan:v45 options:v9 prototype:v47];
    }
  }
  else if ([v6 rangeOfString:@"FrontPortrait"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v65 = [(CAMApplication *)self runTakePictureFrontCameraWithTestPlan:v45 options:v9 prototype:v47 forCaptureMode:0];
  }
  else
  {
    BOOL v65 = [(CAMApplication *)self runTakePictureFrontPortraitWithTestPlan:v45 options:v9 prototype:v47];
  }
  BOOL v66 = v65;

  double v10 = v68;
LABEL_94:

  return v66;
}

uint64_t __43__CAMApplication_Testing__runTest_options___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCurrentTestPlan:0];
}

+ (int64_t)appOrPlugInInterfaceOrientation
{
  id v2 = +[CAMCaptureCapabilities capabilities];
  id v3 = (id *)MEMORY[0x263F83300];
  int64_t v4 = [(id)*MEMORY[0x263F83300] statusBarOrientation];
  unint64_t v5 = [v2 hostProcess];
  if (v5 > 5)
  {
    int64_t v4 = 0;
  }
  else if (((1 << v5) & 0x1B) == 0)
  {
    if (v5 != 2
      || ([MEMORY[0x263F82670] currentDevice],
          id v6 = objc_claimAutoreleasedReturnValue(),
          uint64_t v7 = [v6 userInterfaceIdiom],
          v6,
          v7 == 1))
    {
      int64_t v4 = [*v3 activeInterfaceOrientation];
    }
  }

  return v4;
}

+ (BOOL)isAppOrPlugInSuspended
{
  char v2 = [(id)*MEMORY[0x263F83300] isSuspended];
  id v3 = +[CAMCaptureCapabilities capabilities];
  uint64_t v4 = [v3 hostProcess];

  if (v4 == 4 || v4 == 2) {
    return 0;
  }
  else {
    return v2;
  }
}

+ (int64_t)appOrPlugInState
{
  int64_t v2 = [(id)*MEMORY[0x263F83300] applicationState];
  id v3 = +[CAMCaptureCapabilities capabilities];
  uint64_t v4 = [v3 hostProcess];

  if (v4 == 4 || v4 == 2) {
    return 0;
  }
  else {
    return v2;
  }
}

- (CAMPerformanceTestPlan)currentTestPlan
{
  return self->_currentTestPlan;
}

- (void)setCurrentTestPlan:(id)a3
{
}

- (void).cxx_destruct
{
}

@end