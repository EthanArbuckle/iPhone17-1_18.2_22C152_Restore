uint64_t AVGestaltGetIntegerAnswerWithDefault(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t vars8;

  if (avgestalt_buildDataBase_onceToken != -1) {
    dispatch_once(&avgestalt_buildDataBase_onceToken, &__block_literal_global_17);
  }
  v4 = (void *)[(id)sAVGestaltIntegerDataBase objectForKeyedSubscript:a1];
  if (!v4) {
    return a2;
  }

  return [v4 integerValue];
}

uint64_t AVCaptureClientIsContinuityCapture()
{
  if (AVCaptureClientIsContinuityCapture_sOnceToken != -1) {
    dispatch_once(&AVCaptureClientIsContinuityCapture_sOnceToken, &__block_literal_global_66);
  }
  return AVCaptureClientIsContinuityCapture_sAnswer;
}

float AVGestaltGetFloatAnswerWithDefault(uint64_t a1, float a2)
{
  if (avgestalt_buildDataBase_onceToken != -1) {
    dispatch_once(&avgestalt_buildDataBase_onceToken, &__block_literal_global_17);
  }
  v4 = (void *)[(id)sAVGestaltFloatDataBase objectForKeyedSubscript:a1];
  if (!v4) {
    return a2;
  }

  [v4 floatValue];
  return result;
}

uint64_t AVMediaTypeForMetadataObjects()
{
  if (AVMediaTypeForMetadataObjects_sCorrectedAVMediaTypeMetadataOnce != -1) {
    dispatch_once(&AVMediaTypeForMetadataObjects_sCorrectedAVMediaTypeMetadataOnce, &__block_literal_global_2);
  }
  return AVMediaTypeForMetadataObjects_sCorrectedAVMediaTypeMetadata;
}

uint64_t AVCaptureSessionIsLaunchPrewarmingEnabled()
{
  if (AVCaptureSessionIsLaunchPrewarmingEnabled_onceToken != -1) {
    dispatch_once(&AVCaptureSessionIsLaunchPrewarmingEnabled_onceToken, &__block_literal_global_827);
  }
  return AVCaptureSessionIsLaunchPrewarmingEnabled_launchPrewarmingEnabled;
}

BOOL AVMediaTypeMetadataObjectAndAVMediaTypeMetadataAreDefined()
{
  if (AVMediaTypeForMetadataObjects_sCorrectedAVMediaTypeMetadataOnce != -1) {
    dispatch_once(&AVMediaTypeForMetadataObjects_sCorrectedAVMediaTypeMetadataOnce, &__block_literal_global_2);
  }
  return AVMediaTypeForMetadataObjects_sCorrectedAVMediaTypeMetadata == *MEMORY[0x1E4F47C58];
}

BOOL AVCapturePlatformMountsCamerasInLandscapeOrientation()
{
  if (AVCaptureClientExpectsCameraMountedInLandscapeOrientation_sOnceToken != -1) {
    dispatch_once(&AVCaptureClientExpectsCameraMountedInLandscapeOrientation_sOnceToken, &__block_literal_global_79);
  }
  return FigCapturePlatformMountsCamerasInLandscapeOrientation() != 0;
}

void sub_1A15329D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A1532AA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A1533474(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A1533594(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A15338D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1A1533C3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

uint64_t AVGestaltGetBoolAnswer(uint64_t a1)
{
  if (avgestalt_buildDataBase_onceToken != -1) {
    dispatch_once(&avgestalt_buildDataBase_onceToken, &__block_literal_global_17);
  }
  v2 = (void *)[(id)sAVGestaltBoolDataBase objectForKeyedSubscript:a1];

  return [v2 BOOLValue];
}

void sub_1A15341B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_1A1534608(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A15346DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A1534928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A1534A28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A1534B30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AVCaptureAudiomxdSupportEnabled()
{
  if (AVCaptureAudiomxdSupportEnabled_sOnceToken != -1) {
    dispatch_once(&AVCaptureAudiomxdSupportEnabled_sOnceToken, &__block_literal_global_24);
  }
  return AVCaptureAudiomxdSupportEnabled_sCaptureAudiomxdSupportEnabled;
}

void sub_1A1535224(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A15353C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _registerVideoDevicesOnce()
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)&sRegisterVideoDevicesLock);
  if (!sRegisteredVideoDevices)
  {
    sSourceInfoArrayChangedNotificationQueue = (uint64_t)dispatch_queue_create("com.apple.avfoundation.capturedevice.source_info_array_changed_queue", 0);
    CStringPtr = CFStringGetCStringPtr((CFStringRef)*MEMORY[0x1E4F51E90], 0x8000100u);
    notify_register_dispatch(CStringPtr, (int *)&sSourceInfoArrayChangedNotificationToken, (dispatch_queue_t)sSourceInfoArrayChangedNotificationQueue, &__block_literal_global_1310);
    id v1 = (id)[NSClassFromString(&cfstr_Avcapturefigvi.isa) _devices];
    sRegisteredVideoDevices = (uint64_t)v1;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v9;
LABEL_4:
      uint64_t v5 = 0;
      while (1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        v6 = *(void **)(*((void *)&v8 + 1) + 8 * v5);
        if ((__CFString *)[v6 deviceType] == @"AVCaptureDeviceTypeBuiltInWideAngleCamera"
          && [v6 position] == 2)
        {
          break;
        }
        if (v3 == ++v5)
        {
          uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
          if (v3) {
            goto LABEL_4;
          }
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sRegisterVideoDevicesLock);
}

void sub_1A1537BDC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t AVCaptureClientHasEntitlement(void *a1)
{
  if ([a1 isEqualToString:AVCaptureEntitlementShutterSoundManipulation])
  {
    uint64_t v2 = &AVCaptureClientHasEntitlement_shutterManipulationAllowed;
    uint64_t v3 = &AVCaptureClientHasEntitlement_checkShutterManipulationOnceToken;
  }
  else if ([a1 isEqualToString:AVCaptureEntitlementOfflineVideoStabilizer])
  {
    uint64_t v2 = &AVCaptureClientHasEntitlement_offlineVideoStabilizerAllowed;
    uint64_t v3 = &AVCaptureClientHasEntitlement_checkOfflineVideoStabilizerOnceToken;
  }
  else if ([a1 isEqualToString:AVCaptureEntitlementFilterRendering])
  {
    uint64_t v2 = &AVCaptureClientHasEntitlement_filterRenderingAllowed;
    uint64_t v3 = &AVCaptureClientHasEntitlement_checkFilterRenderingOnceToken;
  }
  else if ([a1 isEqualToString:AVCaptureEntitlementDeferredPhotoProcessor])
  {
    uint64_t v2 = &AVCaptureClientHasEntitlement_deferredPhotoProcessingAllowed;
    uint64_t v3 = &AVCaptureClientHasEntitlement_checkDeferredPhotoProcessingOnceToken;
  }
  else if ([a1 isEqualToString:AVCaptureEntitlementDeskViewCamera])
  {
    uint64_t v2 = &AVCaptureClientHasEntitlement_overheadCameraAllowed;
    uint64_t v3 = &AVCaptureClientHasEntitlement_checkOverheadCameraOnceToken;
  }
  else if ([a1 isEqualToString:AVCaptureEntitlementMultitaskingCameraAccess])
  {
    uint64_t v2 = &AVCaptureClientHasEntitlement_multitaskingCameraAccessAllowed;
    uint64_t v3 = &AVCaptureClientHasEntitlement_checkMultitaskingCameraAccessOnceToken;
  }
  else if ([a1 isEqualToString:AVCaptureEntitlementSetAnyUserPreferredCamera])
  {
    uint64_t v2 = &AVCaptureClientHasEntitlement_setAnyUserPreferredCameraAllowed;
    uint64_t v3 = &AVCaptureClientHasEntitlement_setAnyUserPreferredCameraOnceToken;
  }
  else if ([a1 isEqualToString:AVCaptureEntitlementMetadataCameras])
  {
    uint64_t v2 = &AVCaptureClientHasEntitlement_metadataCamerasAllowed;
    uint64_t v3 = &AVCaptureClientHasEntitlement_checkMetadataCamerasOnceToken;
  }
  else if ([a1 isEqualToString:AVCaptureEntitlementWebBrowserEngineRendering])
  {
    uint64_t v2 = &AVCaptureClientHasEntitlement_isWebBrowserEngineGPUProcess;
    uint64_t v3 = &AVCaptureClientHasEntitlement_checkWebBrowserEngineRenderingOnceToken;
  }
  else
  {
    uint64_t result = [a1 isEqualToString:AVCaptureEntitlementProxyDevices];
    if (!result) {
      return result;
    }
    uint64_t v2 = &AVCaptureClientHasEntitlement_proxyDevicesAllowed;
    uint64_t v3 = &AVCaptureClientHasEntitlement_checkProxyDevicesOnceToken;
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __AVCaptureClientHasEntitlement_block_invoke;
  v5[3] = &unk_1E5A72F98;
  v5[4] = a1;
  v5[5] = v2;
  if (*v3 != -1) {
    dispatch_once(v3, v5);
  }
  return *v2 != 0;
}

uint64_t AVCaptureClientAllowsDeskViewCamera()
{
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier"), "isEqualToString:", @"com.apple.rapportd"))return 1; {
  id v1 = (void *)AVCaptureEntitlementDeskViewCamera;
  }

  return AVCaptureClientHasEntitlement(v1);
}

BOOL AVCaptureColorSpaceIsHDR(uint64_t a1)
{
  return a1 == 2;
}

void sub_1A1539A28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_1A1539B74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A153B238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Block_object_dispose((const void *)(v17 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A153B35C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

__CFString *AVCaptureBundleIdentifier()
{
  return @"com.apple.AVFCapture";
}

void sub_1A153CFD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Block_object_dispose((const void *)(v31 - 112), 8);
  _Block_object_dispose((const void *)(v31 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A153D068(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void fvd_figCaptureSourceNotificationHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  long long v8 = (void *)MEMORY[0x1A62348E0]();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __fvd_figCaptureSourceNotificationHandler_block_invoke;
  block[3] = &unk_1E5A731E0;
  block[4] = a2;
  block[5] = a3;
  block[6] = a5;
  Main = CFRunLoopGetMain();
  CFRunLoopPerformBlock(Main, (CFTypeRef)*MEMORY[0x1E4F1D410], block);
  long long v10 = CFRunLoopGetMain();
  CFRunLoopWakeUp(v10);
}

uint64_t __di_notificationHandler_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleNotification:*(void *)(a1 + 40) payload:*(void *)(a1 + 48)];
}

void sub_1A153E018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *avcfvd_deviceTypesFromAVCaptureDevices(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [a1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(a1);
        }
        objc_msgSend(v2, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "figCaptureSourceDeviceType")));
      }
      while (v4 != v6);
      uint64_t v4 = [a1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
  return v2;
}

void sub_1A153EC4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A153F2C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

void *ps_formatFourCCForSettingsDictionary(void *result)
{
  if (result)
  {
    id v1 = result;
    uint64_t result = objc_msgSend((id)objc_msgSend(result, "objectForKeyedSubscript:", *MEMORY[0x1E4F24D70]), "intValue");
    if (!result)
    {
      [v1 objectForKeyedSubscript:*MEMORY[0x1E4F47D00]];
      return (void *)AVOSTypeForString();
    }
  }
  return result;
}

uint64_t AVCaptureIsRunningInMacCatalystEnvironment()
{
  if (AVCaptureIsRunningInMacCatalystEnvironment_once != -1) {
    dispatch_once(&AVCaptureIsRunningInMacCatalystEnvironment_once, &__block_literal_global_308);
  }
  return AVCaptureIsRunningInMacCatalystEnvironment_isCatalystApp;
}

uint64_t po_requestingDefaultHighResStillForAVCapturePhotoSettings(void *a1, void *a2, void *a3)
{
  if ([a1 maxPhotoDimensions]
    || (unint64_t)[a1 maxPhotoDimensions] >> 32)
  {
    *a3 = [a1 maxPhotoDimensions];
    uint64_t v6 = [a2 defaultPhotoDimensionsWithHighResolutionCaptureEnabled:1];
    if ([a1 maxPhotoDimensions] != v6) {
      return 0;
    }
  }
  else
  {
    *a3 = objc_msgSend(a2, "defaultPhotoDimensionsWithHighResolutionCaptureEnabled:", objc_msgSend(a1, "isHighResolutionPhotoEnabled"));
    if (![a1 isHighResolutionPhotoEnabled]) {
      return 0;
    }
  }

  return [a2 supportsHighResolutionStillImageOutput];
}

uint64_t __avgestalt_buildDataBase_block_invoke()
{
  sAVGestaltBoolDataBase = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  sAVGestaltIntegerDataBase = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  sAVGestaltFloatDataBase = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  sAVGestaltStringDataBase = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t ModelSpecificName = FigCaptureGetModelSpecificName();
  AVGestaltGetDeviceFeatures(ModelSpecificName, (void *)sAVGestaltBoolDataBase, (void *)sAVGestaltIntegerDataBase, (void *)sAVGestaltFloatDataBase, (void *)sAVGestaltStringDataBase);
  id v1 = NSNumber;
  if (dyld_get_active_platform() == 1) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = dyld_program_sdk_at_least();
  }
  uint64_t v3 = [v1 numberWithInt:v2];
  [(id)sAVGestaltBoolDataBase setObject:v3 forKeyedSubscript:@"AVGQCaptureDepthWithDeepFusionSupported"];
  objc_msgSend((id)sAVGestaltBoolDataBase, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", FigCapturePlatformSupportsExclaves() != 0), @"AVGQCaptureAttentionDetectionSupported");
  [(id)sAVGestaltBoolDataBase setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"AVGQCaptureDefaultDevicePrefersUnsuspendedAndAllowsAnyPosition"];
  uint64_t v4 = NSNumber;
  if (dyld_get_active_platform() == 3)
  {
    uint64_t v5 = 1;
  }
  else if (dyld_get_active_platform() == 1 || dyld_get_active_platform() == 6)
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v5 = objc_msgSend((id)objc_msgSend(v6, "objectForInfoDictionaryKey:", AVCaptureBundleUseContinuityCameraDeviceTypeKey), "BOOLValue");
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v7 = [v4 numberWithInt:v5];
  [(id)sAVGestaltBoolDataBase setObject:v7 forKeyedSubscript:@"AVGQCaptureUseContinuityCameraDeviceType"];
  long long v8 = NSNumber;
  if (dyld_get_active_platform() == 2
    || dyld_get_active_platform() == 11
    || dyld_get_active_platform() == 1)
  {
    uint64_t v9 = 1;
  }
  else if (dyld_get_active_platform() == 6)
  {
    v85 = (void *)[MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v9 = objc_msgSend((id)objc_msgSend(v85, "objectForInfoDictionaryKey:", AVCaptureBundleUseExternalDeviceTypeKey), "BOOLValue");
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = [v8 numberWithInt:v9];
  [(id)sAVGestaltBoolDataBase setObject:v10 forKeyedSubscript:@"AVGQCaptureUseExternalDeviceType"];
  long long v11 = NSNumber;
  if (dyld_get_active_platform() == 1) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = dyld_program_sdk_at_least();
  }
  uint64_t v13 = [v11 numberWithInt:v12];
  [(id)sAVGestaltBoolDataBase setObject:v13 forKeyedSubscript:@"AVGQCaptureMultitaskingCameraAccessVoipAppsSupported"];
  v14 = NSNumber;
  if (dyld_get_active_platform() == 1) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = dyld_program_sdk_at_least();
  }
  uint64_t v16 = [v14 numberWithInt:v15];
  [(id)sAVGestaltBoolDataBase setObject:v16 forKeyedSubscript:@"AVGQCaptureZeroShutterLagAutomaticallyEnabled"];
  uint64_t v17 = NSNumber;
  if (dyld_get_active_platform() == 1) {
    uint64_t v18 = 0;
  }
  else {
    uint64_t v18 = dyld_program_sdk_at_least();
  }
  uint64_t v19 = [v17 numberWithInt:v18];
  [(id)sAVGestaltBoolDataBase setObject:v19 forKeyedSubscript:@"AVGQCaptureCheckIfFileAlreadyExistForMFO"];
  v20 = NSNumber;
  if (dyld_get_active_platform() == 1) {
    uint64_t v21 = 0;
  }
  else {
    uint64_t v21 = dyld_program_sdk_at_least();
  }
  uint64_t v22 = [v20 numberWithInt:v21];
  [(id)sAVGestaltBoolDataBase setObject:v22 forKeyedSubscript:@"AVGQCaptureSimultaneousADOMFOVDOOutputsSupported"];
  v23 = NSNumber;
  if (dyld_get_active_platform() == 1) {
    uint64_t v24 = 0;
  }
  else {
    uint64_t v24 = dyld_program_sdk_at_least();
  }
  uint64_t v25 = [v23 numberWithInt:v24];
  [(id)sAVGestaltBoolDataBase setObject:v25 forKeyedSubscript:@"AVGQCaptureMultipleVideoDataOutputsSupported"];
  v26 = NSNumber;
  if (dyld_get_active_platform() == 1) {
    uint64_t v27 = 0;
  }
  else {
    uint64_t v27 = dyld_program_sdk_at_least();
  }
  uint64_t v28 = [v26 numberWithInt:v27];
  [(id)sAVGestaltBoolDataBase setObject:v28 forKeyedSubscript:@"AVGQCaptureFaceDrivenAEAFOnByDefault"];
  v29 = NSNumber;
  if (dyld_get_active_platform() == 1) {
    uint64_t v30 = 0;
  }
  else {
    uint64_t v30 = dyld_program_sdk_at_least();
  }
  uint64_t v31 = [v29 numberWithInt:v30];
  [(id)sAVGestaltBoolDataBase setObject:v31 forKeyedSubscript:@"AVGQCaptureHighPhotoQualityFrameDropAllowed"];
  v32 = NSNumber;
  if (dyld_get_active_platform() == 1) {
    uint64_t v33 = 0;
  }
  else {
    uint64_t v33 = dyld_program_sdk_at_least();
  }
  uint64_t v34 = [v32 numberWithInt:v33];
  [(id)sAVGestaltBoolDataBase setObject:v34 forKeyedSubscript:@"AVGQCaptureDeviceSupportsCinematicVideoFocusAtPoint"];
  v35 = NSNumber;
  if (dyld_get_active_platform() == 1) {
    uint64_t v36 = 0;
  }
  else {
    uint64_t v36 = dyld_program_sdk_at_least();
  }
  uint64_t v37 = [v35 numberWithInt:v36];
  [(id)sAVGestaltBoolDataBase setObject:v37 forKeyedSubscript:@"AVGQCaptureExtendedCinematicVISSupported"];
  v38 = NSNumber;
  if (dyld_get_active_platform() == 1) {
    uint64_t v39 = 0;
  }
  else {
    uint64_t v39 = dyld_program_sdk_at_least();
  }
  uint64_t v40 = [v38 numberWithInt:v39];
  [(id)sAVGestaltBoolDataBase setObject:v40 forKeyedSubscript:@"AVGQCaptureMFOSupportsPhotoFormats"];
  v41 = NSNumber;
  if (dyld_get_active_platform() == 1) {
    uint64_t v42 = 0;
  }
  else {
    uint64_t v42 = dyld_program_sdk_at_least();
  }
  uint64_t v43 = [v41 numberWithInt:v42];
  [(id)sAVGestaltBoolDataBase setObject:v43 forKeyedSubscript:@"AVGQCaptureMFOVideoSettingsSupportCompressionProperties"];
  v44 = NSNumber;
  if (dyld_get_active_platform() == 1) {
    uint64_t v45 = 0;
  }
  else {
    uint64_t v45 = dyld_program_sdk_at_least();
  }
  uint64_t v46 = [v44 numberWithInt:v45];
  [(id)sAVGestaltBoolDataBase setObject:v46 forKeyedSubscript:@"AVGQCapturePhotoSettingsSupportRawEmbeddedThumbnailFormat"];
  v47 = NSNumber;
  if (dyld_get_active_platform() == 1) {
    uint64_t v48 = 0;
  }
  else {
    uint64_t v48 = dyld_program_sdk_at_least();
  }
  uint64_t v49 = [v47 numberWithInt:v48];
  [(id)sAVGestaltBoolDataBase setObject:v49 forKeyedSubscript:@"AVGQCaptureDevicesShouldBeSortedByDeviceType"];
  v50 = NSNumber;
  if (dyld_get_active_platform() == 1) {
    uint64_t v51 = 0;
  }
  else {
    uint64_t v51 = dyld_program_sdk_at_least();
  }
  uint64_t v52 = [v50 numberWithInt:v51];
  [(id)sAVGestaltBoolDataBase setObject:v52 forKeyedSubscript:@"AVGQCaptureAppsMayUseHEVC"];
  v53 = NSNumber;
  if (dyld_get_active_platform() == 1) {
    uint64_t v54 = 0;
  }
  else {
    uint64_t v54 = dyld_program_sdk_at_least();
  }
  uint64_t v55 = [v53 numberWithInt:v54];
  [(id)sAVGestaltBoolDataBase setObject:v55 forKeyedSubscript:@"AVGQCaptureADOSupportsAudioCaptureWithPhotoFormats"];
  v56 = NSNumber;
  if (dyld_get_active_platform() == 1) {
    uint64_t v57 = 0;
  }
  else {
    uint64_t v57 = dyld_program_sdk_at_least();
  }
  uint64_t v58 = [v56 numberWithInt:v57];
  [(id)sAVGestaltBoolDataBase setObject:v58 forKeyedSubscript:@"AVGQCaptureMicrophoneUsesDecoupledIO"];
  v59 = NSNumber;
  if (dyld_get_active_platform() == 1) {
    uint64_t v60 = 0;
  }
  else {
    uint64_t v60 = dyld_program_sdk_at_least() ^ 1;
  }
  uint64_t v61 = [v59 numberWithInt:v60];
  [(id)sAVGestaltBoolDataBase setObject:v61 forKeyedSubscript:@"AVGQCaptureConnectionAlwaysSelectsStandardVISFor720p30"];
  v62 = NSNumber;
  if (dyld_get_active_platform() == 1) {
    uint64_t v63 = 0;
  }
  else {
    uint64_t v63 = dyld_program_sdk_at_least();
  }
  uint64_t v64 = [v62 numberWithInt:v63];
  [(id)sAVGestaltBoolDataBase setObject:v64 forKeyedSubscript:@"AVGQCaptureConnectionCinematicVISAwareAPIsAreAvailable"];
  v65 = NSNumber;
  if (dyld_get_active_platform() == 1) {
    uint64_t v66 = 0;
  }
  else {
    uint64_t v66 = dyld_program_sdk_at_least();
  }
  uint64_t v67 = [v65 numberWithInt:v66];
  [(id)sAVGestaltBoolDataBase setObject:v67 forKeyedSubscript:@"AVGQCaptureConnectionFrameRatePropertiesAreDeprecated"];
  v68 = NSNumber;
  if (dyld_get_active_platform() == 1) {
    uint64_t v69 = 0;
  }
  else {
    uint64_t v69 = dyld_program_sdk_at_least();
  }
  uint64_t v70 = [v68 numberWithInt:v69];
  [(id)sAVGestaltBoolDataBase setObject:v70 forKeyedSubscript:@"AVGQCaptureSessionUsesAppAudioSessionByDefault"];
  v71 = NSNumber;
  if (dyld_get_active_platform() == 1) {
    uint64_t v72 = 0;
  }
  else {
    uint64_t v72 = dyld_program_sdk_at_least() ^ 1;
  }
  uint64_t v73 = [v71 numberWithInt:v72];
  [(id)sAVGestaltBoolDataBase setObject:v73 forKeyedSubscript:@"AVGQCaptureMetadataOutputCapturesFacesByDefault"];
  v74 = NSNumber;
  if (dyld_get_active_platform() == 1) {
    uint64_t v75 = 0;
  }
  else {
    uint64_t v75 = dyld_program_sdk_at_least();
  }
  uint64_t v76 = [v74 numberWithInt:v75];
  [(id)sAVGestaltBoolDataBase setObject:v76 forKeyedSubscript:@"AVGQCaptureVPLOrientationAndMirroringPropertiesAreDeprecated"];
  v77 = NSNumber;
  if (dyld_get_active_platform() == 1) {
    uint64_t v78 = 0;
  }
  else {
    uint64_t v78 = dyld_program_sdk_at_least() ^ 1;
  }
  uint64_t v79 = [v77 numberWithInt:v78];
  [(id)sAVGestaltBoolDataBase setObject:v79 forKeyedSubscript:@"AVGQCaptureMFOStabilizationIsAlwaysOn"];
  v80 = NSNumber;
  if (dyld_get_active_platform() == 1) {
    uint64_t v81 = 0;
  }
  else {
    uint64_t v81 = dyld_program_sdk_at_least();
  }
  uint64_t v82 = [v80 numberWithInt:v81];
  v83 = (void *)sAVGestaltBoolDataBase;

  return [v83 setObject:v82 forKeyedSubscript:@"AVGQCaptureVDOFrameRatePropertiesAreDeprecated"];
}

void sub_1A1541C90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1542248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t AVCIFilterArrayContainsPortraitFilters(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t result = [a1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)v7;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(a1);
        }
        NSClassFromString(&cfstr_Cideptheffect.isa);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          NSClassFromString(&cfstr_Ciportraiteffe_12.isa);
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
        }
        return 1;
      }
      uint64_t v3 = [a1 countByEnumeratingWithState:&v6 objects:v10 count:16];
      uint64_t result = 0;
      if (v3) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t __vpl_figCaptureSessionNotification_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleNotification:*(void *)(a1 + 40) payload:*(void *)(a1 + 48)];
}

uint64_t vdo_notificationHandler(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a2 _handleNotification:a3 payload:a5];
}

uint64_t mdo_notificationHandler(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a2 _handleNotification:a3 payload:a5];
}

uint64_t ddo_notificationHandler(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a2 _handleNotification:a3 payload:a5];
}

void socvpl_figCaptureSessionNotification(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = __socvpl_figCaptureSessionNotification_block_invoke;
  uint64_t v11 = &unk_1E5A731E0;
  uint64_t v12 = a2;
  uint64_t v13 = a3;
  uint64_t v14 = a5;
  if (objc_msgSend((id)objc_msgSend(a2, "session", MEMORY[0x1E4F143A8], 3221225472), "notifiesOnMainThread"))
  {
    Main = CFRunLoopGetMain();
    uint64_t FigRunLoopMode = AVCaptureGetFigRunLoopMode();
    uint64_t v7 = *MEMORY[0x1E4F1D410];
    v15[0] = FigRunLoopMode;
    v15[1] = v7;
    CFRunLoopPerformBlock(Main, (CFTypeRef)[MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2], &v9);
    long long v8 = CFRunLoopGetMain();
    CFRunLoopWakeUp(v8);
  }
  else
  {
    v10((uint64_t)&v9);
  }
}

void avcaptureFigCaptureSessionNotification(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  v17[2] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = __avcaptureFigCaptureSessionNotification_block_invoke;
  uint64_t v13 = &unk_1E5A731E0;
  uint64_t v14 = a2;
  uint64_t v15 = a3;
  uint64_t v16 = a5;
  int v6 = objc_msgSend(a2, "notifiesOnMainThread", MEMORY[0x1E4F143A8], 3221225472);
  if ([a3 isEqualToString:*MEMORY[0x1E4F517B8]]) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v6 == 0;
  }
  if (v7)
  {
    v12((uint64_t)&v11);
  }
  else
  {
    Main = CFRunLoopGetMain();
    uint64_t v9 = *MEMORY[0x1E4F1D410];
    v17[0] = *MEMORY[0x1E4F20260];
    v17[1] = v9;
    CFRunLoopPerformBlock(Main, (CFTypeRef)[MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2], &v11);
    uint64_t v10 = CFRunLoopGetMain();
    CFRunLoopWakeUp(v10);
  }
}

void vpl_figCaptureSessionNotification(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = __vpl_figCaptureSessionNotification_block_invoke;
  uint64_t v11 = &unk_1E5A731E0;
  uint64_t v12 = a2;
  uint64_t v13 = a3;
  uint64_t v14 = a5;
  if (objc_msgSend((id)objc_msgSend(a2, "session", MEMORY[0x1E4F143A8], 3221225472), "notifiesOnMainThread"))
  {
    Main = CFRunLoopGetMain();
    uint64_t FigRunLoopMode = AVCaptureGetFigRunLoopMode();
    uint64_t v7 = *MEMORY[0x1E4F1D410];
    v15[0] = FigRunLoopMode;
    v15[1] = v7;
    CFRunLoopPerformBlock(Main, (CFTypeRef)[MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2], &v9);
    long long v8 = CFRunLoopGetMain();
    CFRunLoopWakeUp(v8);
  }
  else
  {
    v10((uint64_t)&v9);
  }
}

uint64_t AVCaptureGetFigRunLoopMode()
{
  return *MEMORY[0x1E4F20260];
}

void di_notificationHandler(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v8 = __di_notificationHandler_block_invoke;
  uint64_t v9 = &unk_1E5A731E0;
  uint64_t v10 = a2;
  uint64_t v11 = a3;
  uint64_t v12 = a5;
  if (objc_msgSend((id)objc_msgSend(a2, "session"), "notifiesOnMainThread"))
  {
    Main = CFRunLoopGetMain();
    CFRunLoopPerformBlock(Main, (CFTypeRef)*MEMORY[0x1E4F1D410], block);
    int v6 = CFRunLoopGetMain();
    CFRunLoopWakeUp(v6);
  }
  else
  {
    v8((uint64_t)block);
  }
}

uint64_t __avcaptureFigCaptureSessionNotification_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleNotification:*(void *)(a1 + 40) payload:*(void *)(a1 + 48)];
}

void sub_1A1545C0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A15478AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_1A1547D94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A1548D4C(_Unwind_Exception *exception_object)
{
}

void sub_1A1548DD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t AVCaptureCurrentClientIsFaceTimeVariant()
{
  if (AVCaptureCurrentClientIsFaceTimeVariant_sOnceToken != -1) {
    dispatch_once(&AVCaptureCurrentClientIsFaceTimeVariant_sOnceToken, &__block_literal_global_35);
  }
  return AVCaptureCurrentClientIsFaceTimeVariant_sAnswer;
}

void sub_1A15498D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AVCaptureIsRunningInMediaserverd()
{
  if (AVCaptureIsRunningInMediaserverd_sOnceToken != -1) {
    dispatch_once(&AVCaptureIsRunningInMediaserverd_sOnceToken, &__block_literal_global_30);
  }
  return AVCaptureIsRunningInMediaserverd_sAnswer;
}

void sub_1A154A478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AVControlCenterVideoEffectsReactionsUnavailableReasonsPreferenceKey(void *a1)
{
  id v1 = NSString;
  uint64_t v2 = (__CFString *)AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2) {
    uint64_t v2 = @"unknown";
  }
  uint64_t v3 = [(__CFString *)v2 stringByReplacingOccurrencesOfString:@"." withString:@"-"];
  return [v1 stringWithFormat:@"%@reactions-unavailablereasons", objc_msgSend(NSString, "stringWithFormat:", @"videoeffects/%@/", v3)];
}

uint64_t AVControlCenterVideoEffectsReactionsTriggeredPreferenceKey(void *a1)
{
  return [NSString stringWithFormat:@"%@reaction-trigger", avcc_prefixedSignalPreferenceKeyForBundleID(a1)];
}

uint64_t AVControlCenterVideoEffectsReactionsInProgressPreferenceKey(void *a1)
{
  return [NSString stringWithFormat:@"%@reactions-active", avcc_prefixedSignalPreferenceKeyForBundleID(a1)];
}

uint64_t AVControlCenterVideoEffectsReactionsEnabledPreferenceKey(void *a1)
{
  id v1 = NSString;
  uint64_t v2 = (__CFString *)AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2) {
    uint64_t v2 = @"unknown";
  }
  uint64_t v3 = [(__CFString *)v2 stringByReplacingOccurrencesOfString:@"." withString:@"-"];
  return [v1 stringWithFormat:@"%@reactions-enabled", objc_msgSend(NSString, "stringWithFormat:", @"videoeffects/%@/", v3)];
}

uint64_t AVControlCenterVideoEffectsGesturesEnabledDefaultPreferenceKey(void *a1)
{
  id v1 = NSString;
  uint64_t v2 = (__CFString *)AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2) {
    uint64_t v2 = @"unknown";
  }
  uint64_t v3 = [(__CFString *)v2 stringByReplacingOccurrencesOfString:@"." withString:@"-"];
  return [v1 stringWithFormat:@"%@gestures-enabled-default", objc_msgSend(NSString, "stringWithFormat:", @"videoeffects/%@/", v3)];
}

uint64_t AVControlCenterVideoEffectsBackgroundReplacementUnavailableReasonsPreferenceKey(void *a1)
{
  id v1 = NSString;
  uint64_t v2 = (__CFString *)AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2) {
    uint64_t v2 = @"unknown";
  }
  uint64_t v3 = [(__CFString *)v2 stringByReplacingOccurrencesOfString:@"." withString:@"-"];
  return [v1 stringWithFormat:@"%@background-replacement-unavailablereasons", objc_msgSend(NSString, "stringWithFormat:", @"videoeffects/%@/", v3)];
}

uint64_t AVControlCenterVideoEffectsBackgroundReplacementURLRemovedSignalKey()
{
  return [NSString stringWithFormat:@"%@background-replacement-url-removed", @"signal/"];
}

uint64_t AVControlCenterVideoEffectsBackgroundReplacementURLBookmarkPreferenceKey(void *a1)
{
  id v1 = NSString;
  uint64_t v2 = (__CFString *)AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2) {
    uint64_t v2 = @"unknown";
  }
  uint64_t v3 = [(__CFString *)v2 stringByReplacingOccurrencesOfString:@"." withString:@"-"];
  return [v1 stringWithFormat:@"%@background-replacement-url-bookmark", objc_msgSend(NSString, "stringWithFormat:", @"videoeffects/%@/", v3)];
}

uint64_t AVControlCenterVideoEffectsBackgroundReplacementEnabledPreferenceKey(void *a1)
{
  id v1 = NSString;
  uint64_t v2 = (__CFString *)AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2) {
    uint64_t v2 = @"unknown";
  }
  uint64_t v3 = [(__CFString *)v2 stringByReplacingOccurrencesOfString:@"." withString:@"-"];
  return [v1 stringWithFormat:@"%@background-replacement-enabled", objc_msgSend(NSString, "stringWithFormat:", @"videoeffects/%@/", v3)];
}

CFDictionaryRef fvd_cgRectDictionaryForCenterAndSize(double a1, double a2, double a3, double a4)
{
  double v4 = fmax(a1 - a3 * 0.5, 0.0);
  if (v4 >= 1.0 - a3) {
    double v4 = 1.0 - a3;
  }
  double v5 = fmax(a2 - a4 * 0.5, 0.0);
  if (v5 >= 1.0 - a4) {
    double v5 = 1.0 - a4;
  }
  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(*(CGRect *)(&a3 - 2));

  return DictionaryRepresentation;
}

uint64_t AVGestaltGetDeviceFeatures(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v10 = 0;
  while (1)
  {
    uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(NSString, "stringWithUTF8String:", (&devices)[v10]), "componentsSeparatedByString:", @"-"), "containsObject:", a1);
    if (result) {
      break;
    }
    v10 += 2;
    if (v10 == 90) {
      return result;
    }
  }
  uint64_t v12 = (&devices)[v10 + 1];
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", *v12), @"AVGQCameraCapability");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[1]), @"AVGQCameraFlashCapability");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[2]), @"AVGQCameraFrontFlashCapability");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[3]), @"AVGQCameraHDR2Capability");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[4]), @"AVGQCameraLiveEffectsCapability");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[5]), @"AVGQCaptureSessionSupportsMultiCamCapture");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[6]), @"AVGQDeviceHasAggregateCamera");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[7]), @"AVGQB7LQTMQIRMWVL3QHSIGQY3YFAA");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[8]), @"AVGQDeviceSupportsAutoLowLightVideo");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[9]), @"AVGQDeviceSupportsBravoCamera");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[10]), @"AVGQDeviceSupportsBravoPortrait");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[11]), @"AVGQDeviceSupportsCameraCaptureOnTouchDown");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[12]), @"AVGQDeviceSupportsCameraDeferredProcessing");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[13]), @"AVGQDeviceSupportsCinematicVideo");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[14]), @"AVGQ3FYMJTRW4LUXTNAFCC6XVFTDHA");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[15]), @"AVGQDeviceSupportsContentAwareDistortionCorrection");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[16]), @"AVGQ3J3FEVOOCNOKKTK3XQPUQ47DYY");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[17]), @"AVGQBPMGIAYPLJA32XFRAAWDO5G4G4");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[18]), @"AVGQDeviceSupportsDeferredPortraitRendering");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[19]), @"AVGQDeviceSupportsDepthWithDeepFusion");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[20]), @"AVGQDeviceSupportsExposureBiasWithoutExposureLock");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[21]), @"AVGQN46I2BPHSDKPVN3YSGNPHPTAPE");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[22]), @"AVGQDeviceSupportsFrontFacingCameraMirroredVideo");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[23]), @"AVGQDeviceSupportsFrontFacingCameraNightMode");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[24]), @"AVGQDeviceSupportsFrontFacingCameraSmartHDR");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[25]), @"AVGQDeviceSupportsFrontFacingCameraSuperWide");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[26]), @"AVGQDeviceSupportsFrontFacingCameraZoomToggle");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[27]), @"AVGQDeviceSupportsFrontPortrait");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[28]), @"AVGQDeviceSupportsHDREV0Capture");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[29]), @"AVGQLBZEVZETJU77LU4MEZH4LWJ54M");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[30]), @"AVGQDeviceSupportsLinearDNG");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[31]), @"AVGQDeviceSupportsLivePhotoAuto");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[32]), @"AVGQDeviceSupportsMomentCapture");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[33]), @"AVGQDeviceSupportsP3ColorspaceVideoRecording");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[34]), @"AVGQDeviceSupportsPortraitIntensityAdjustments");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[35]), @"AVGQDeviceSupportsPortraitLightEffectFilters");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[36]), @"AVGQL72SILMBLRSKPL2V4VLPUD2TDU");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[37]), @"AVGQDeviceSupportsProResVideo");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[38]), @"AVGQDeviceSupportsResponsiveShutter");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[39]), @"AVGQIIPQVVOWR6BFMGVVBAM7ZDTIW4");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[40]), @"AVGQDeviceSupportsSemanticDevelopment");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[41]), @"AVGQDeviceSupportsSemanticStyles");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[42]), @"AVGQDeviceSupportsSingleCameraPortrait");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[43]), @"AVGQJQYPVTLPCNY4PHM26XACLZH4PU");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[44]), @"AVGQX3DWIDHL6QYY3OCER3G5UEM2QU");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[45]), @"AVGQDeviceSupportsSpatialOverCapture");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[46]), @"AVGQDeviceSupportsStageLightPortraitPreview");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[47]), @"AVGQDeviceSupportsStereoAudioRecording");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[48]), @"AVGQMZMLNHBX4MFF5QD4PJWZFEVCEI");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[49]), @"AVGQBWQSOG5QWWG276TG2HH4RGJZDA");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[50]), @"AVGQDeviceSupportsStudioLightPortraitPreview");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[51]), @"AVGQDeviceSupportsSuperWideAutoMacro");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[52]), @"AVGQDeviceSupportsTimelapseNightMode");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[53]), @"AVGQDJVGPJA65CJA2ZPQZL4GRPYDYA");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[54]), @"AVGQDeviceSupportsTrueVideo");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[55]), @"AVGQDeviceSupportsVariableFrameRateVideo");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[56]), @"AVGQDeviceSupportsWideBravoCamera");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[57]), @"AVGQDeviceSupportsWideBravoPortrait");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[58]), @"AVGQDeviceSupportsWideBravoPortraitNightMode");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[59]), @"AVGQVNFDPYA37ZIZPRZOSYS4KMQIJ4");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[60]), @"AVGQDeviceSupportsZoomPictureInPicture");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[61]), @"AVGQFrontFacingCameraAutoHDRCapability");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[62]), @"AVGQFrontFacingCameraBurstCapability");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[63]), @"AVGQFrontFacingCameraCapability");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[64]), @"AVGQFrontFacingCameraHDRCapability");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[65]), @"AVGQFrontFacingCameraHDROnCapability");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[66]), @"AVGQFrontFacingCameraHFRCapability");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[67]), @"AVGQFrontFacingCameraPortraitModeCapability");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[68]), @"AVGQFrontFacingCameraSingleCameraPortrait");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[69]), @"AVGQFrontFacingCameraStageLightPortraitCaptureCapability");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[70]), @"AVGQHEVCEncodingCapability");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[71]), @"AVGQHasAppleNeuralEngine");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[72]), @"AVGQMedusaOverlayAppCapability");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[73]), @"AVGQPanoramaCameraCapability");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[74]), @"AVGQPearlCameraCapability");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[75]), @"AVGQPhotosPostEffectsCapability");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[76]), @"AVGQPipelinedStillImageProcessingCapability");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[77]), @"AVGQDINRSVRALL7UYNXKHVSIWKZLRA");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[78]), @"AVGQRearFacingCamera60fpsVideoCaptureCapability");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[79]), @"AVGQRearFacingCameraAutoHDRCapability");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[80]), @"AVGQRearFacingCameraBurstCapability");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[81]), @"AVGQRearFacingCameraCapability");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[82]), @"AVGQRearFacingCameraFocusPixelCalibrationCapability");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[83]), @"AVGQRearFacingCameraHDRCapability");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[84]), @"AVGQRearFacingCameraHDROnCapability");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[85]), @"AVGQRearFacingCameraHFRCapability");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[86]), @"AVGQRearFacingCameraPortraitModeCapability");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[87]), @"AVGQRearFacingCameraStageLightPortraitCaptureCapability");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[88]), @"AVGQRearFacingCameraSuperWideCameraCapability");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[89]), @"AVGQPEABAPB242SGF4J5L26EX5YTKA");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[90]), @"AVGQRearFacingCameraTimeOfFlightCameraCapability");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[91]), @"AVGQQ4PFVIJ6WPTAHHYTAR5J5O7YNA");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[92]), @"AVGQRearFacingLowLightCameraCapability");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[93]), @"AVGQRearFacingTelephotoCameraCapability");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[94]), @"AVGQSphereCapability");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[95]), @"AVGQSupportsIrisCapture");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[96]), @"AVGQVideoCameraCapability");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12[97]), @"AVGQVideoStillsCapability");
  LODWORD(v13) = *((_DWORD *)v12 + 25);
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v13), @"AVGQFrontFacingCameraMaxPhotoZoomFactor");
  LODWORD(v14) = *((_DWORD *)v12 + 26);
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v14), @"AVGQRearFacingAggregateDeviceMaxCinematicZoomFactor");
  LODWORD(v15) = *((_DWORD *)v12 + 27);
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v15), @"AVGQRearFacingAggregateDeviceMaxPortraitZoomFactor");
  LODWORD(v16) = *((_DWORD *)v12 + 28);
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v16), @"AVGQRearFacingCameraMaxPhotoZoomFactor");
  LODWORD(v17) = *((_DWORD *)v12 + 29);
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v17), @"AVGQSN3QUOWTBFYIVAQOVNQEVK6G4M");
  LODWORD(v18) = *((_DWORD *)v12 + 30);
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v18), @"AVGQSuperWideCameraToWideCameraRelativeZoomFactor");
  LODWORD(v19) = *((_DWORD *)v12 + 31);
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v19), @"AVGQTorchMaxBeamWidth");
  LODWORD(v20) = *((_DWORD *)v12 + 32);
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v20), @"AVGQTorchMinBeamWidth");
  LODWORD(v21) = *((_DWORD *)v12 + 33);
  uint64_t result = objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v21), @"AVGQWideCameraToTelephotoCameraRelativeZoomFactor");
  if (*((void *)v12 + 17) != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:"), @"AVGQAggregateDevicePhotoZoomFactor");
  }
  if (*((void *)v12 + 18) != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:"), @"AVGQAggregateDeviceVideoZoomFactor");
  }
  if (*((void *)v12 + 19) != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:"), @"AVGQBravoCameraVideoCapture4kMaxFPS");
  }
  if (*((void *)v12 + 20) != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:"), @"AVGQCameraAppUIVersion");
  }
  if (*((void *)v12 + 21) != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:"), @"AVGQCameraHDR10BitVideoCaptureMaxFPS");
  }
  if (*((void *)v12 + 22) != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:"), @"AVGQCameraHDRVersion");
  }
  if (*((void *)v12 + 23) != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:"), @"AVGQCameraMaxBurstLength");
  }
  if (*((void *)v12 + 24) != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:"), @"AVGQCaptureSessionMaxMultiCamRGBStreamsSupported");
  }
  if (*((void *)v12 + 25) != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:"), @"AVGQDefaultVariableFrameRateVideoMaxFPS");
  }
  if (*((void *)v12 + 26) != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:"), @"AVGQFrontFacingCameraHFRVideoCapture1080pMaxFPS");
  }
  if (*((void *)v12 + 27) != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:"), @"AVGQFrontFacingCameraHFRVideoCapture720pMaxFPS");
  }
  if (*((void *)v12 + 28) != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:"), @"AVGQFrontFacingCameraMaxVideoZoomFactor");
  }
  if (*((void *)v12 + 29) != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:"), @"AVGQFrontFacingCameraStillDurationForBurst");
  }
  if (*((void *)v12 + 30) != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:"), @"AVGQFrontFacingCameraVideoCapture1080pMaxFPS");
  }
  if (*((void *)v12 + 31) != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:"), @"AVGQFrontFacingCameraVideoCapture4kMaxFPS");
  }
  if (*((void *)v12 + 32) != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:"), @"AVGQFrontFacingCameraVideoCapture720pMaxFPS");
  }
  if (*((void *)v12 + 33) != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:"), @"AVGQMinimumDiskSpaceReserved");
  }
  if (*((void *)v12 + 34) != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:"), @"AVGQRearFacingCameraHFRVideoCapture1080pMaxFPS");
  }
  if (*((void *)v12 + 35) != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:"), @"AVGQRearFacingCameraHFRVideoCapture4kMaxFPS");
  }
  if (*((void *)v12 + 36) != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:"), @"AVGQRearFacingCameraHFRVideoCapture720pMaxFPS");
  }
  if (*((void *)v12 + 37) != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:"), @"AVGQRearFacingCameraMaxVideoZoomFactor");
  }
  if (*((void *)v12 + 38) != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:"), @"AVGQRearFacingCameraStillDurationForBurst");
  }
  if (*((void *)v12 + 39) != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:"), @"AVGQRearFacingCameraVideoCapture1080pMaxFPS");
  }
  if (*((void *)v12 + 40) != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:"), @"AVGQRearFacingCameraVideoCapture4kMaxFPS");
  }
  if (*((void *)v12 + 41) != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:"), @"AVGQRearFacingCameraVideoCapture720pMaxFPS");
  }
  if (*((void *)v12 + 42) != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:"), @"AVGQRearFacingSuperWideCameraFocalLengthIn35mm");
  }
  if (*((void *)v12 + 43) != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:"), @"AVGQRearFacingTeleCameraFocalLengthIn35mm");
  }
  if (*((void *)v12 + 44) != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:"), @"AVGQRearFacingWideCameraFocalLengthIn35mm");
  }
  if (*((void *)v12 + 45) != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:"), @"AVGQGYSWMQKMTMQOUYQ2AKUCKEN6AA");
  }
  if (*((void *)v12 + 46) != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:"), @"AVGQSuperBravoCameraVideoCapture1080pMaxFPS");
  }
  if (*((void *)v12 + 47) != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:"), @"AVGQSuperBravoCameraVideoCapture4kMaxFPS");
  }
  if (*((void *)v12 + 48) != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t result = objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:"), @"AVGQWideBravoCameraVideoCapture4kMaxFPS");
  }
  if (*((void *)v12 + 49))
  {
    uint64_t v22 = objc_msgSend(NSString, "stringWithUTF8String:");
    return [a5 setObject:v22 forKeyedSubscript:@"AVGQFirstSupportedReleaseVersion"];
  }
  return result;
}

void avcdpp_NotificationCallback(int a1, uint64_t a2, CFTypeRef cf, int a4, CFTypeRef a5)
{
}

void sub_1A154CF4C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A154D1E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A154D3F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_1A154D6A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A154DE54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_1A154E488(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t AVCaptureOutputConnectionFailureReasonString(uint64_t a1, uint64_t a2, void *a3)
{
  switch(a1)
  {
    case 1:
      double v4 = NSString;
      double v5 = (objc_class *)objc_opt_class();
      uint64_t v22 = NSStringFromClass(v5);
      v23 = a3;
      int v6 = @"<%@: %p> cannot be added because the source and destination media types are incompatible";
      goto LABEL_9;
    case 2:
      long long v8 = NSString;
      uint64_t v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      uint64_t v11 = (objc_class *)objc_opt_class();
      v23 = a3;
      uint64_t v24 = NSStringFromClass(v11);
      uint64_t v22 = v10;
      int v6 = @"<%@: %p> cannot be added because %@ only accepts one connection of this media type at a time, and it is already connected";
      goto LABEL_7;
    case 3:
      long long v8 = NSString;
      uint64_t v12 = (objc_class *)objc_opt_class();
      double v13 = NSStringFromClass(v12);
      double v14 = (objc_class *)objc_opt_class();
      v23 = a3;
      uint64_t v24 = NSStringFromClass(v14);
      uint64_t v22 = v13;
      int v6 = @"<%@: %p> cannot be added because %@ only accepts metadata connections originating from the same AVCaptureInput";
      goto LABEL_7;
    case 4:
      long long v8 = NSString;
      double v15 = (objc_class *)objc_opt_class();
      double v16 = NSStringFromClass(v15);
      double v17 = (objc_class *)objc_opt_class();
      v23 = a3;
      uint64_t v24 = NSStringFromClass(v17);
      uint64_t v22 = v16;
      int v6 = @"<%@: %p> cannot be added because %@ only accepts AVCaptureDeviceInput metadata connections originating from the same AVCaptureDeviceInput";
LABEL_7:
      double v18 = v8;
      goto LABEL_10;
    case 5:
      double v4 = NSString;
      double v19 = (objc_class *)objc_opt_class();
      double v20 = NSStringFromClass(v19);
      objc_msgSend((id)objc_msgSend(a3, "sourceDevice"), "activeFormat");
      double v21 = (objc_class *)objc_opt_class();
      v23 = a3;
      uint64_t v24 = NSStringFromClass(v21);
      uint64_t v22 = v20;
      int v6 = @"<%@: %p> cannot be added because streaming depth is not supported for the source AVCaptureDevice's activeFormat: %@";
LABEL_9:
      double v18 = v4;
LABEL_10:
      uint64_t result = objc_msgSend(v18, "stringWithFormat:", v6, v22, v23, v24);
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

void sub_1A154FFB4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A1550354(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A15505EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1A155096C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_1A1550EE0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A1552CD0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t AVCaptureClientExpectsCameraMountedInLandscapeOrientation()
{
  if (AVCaptureClientExpectsCameraMountedInLandscapeOrientation_sOnceToken != -1) {
    dispatch_once(&AVCaptureClientExpectsCameraMountedInLandscapeOrientation_sOnceToken, &__block_literal_global_79);
  }
  return AVCaptureClientExpectsCameraMountedInLandscapeOrientation_sAnswer;
}

void sub_1A15536F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A1553844(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void *AVSemanticSegmentationCMPhotoURNsForMatteTypes(void *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v3 = [a1 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    uint64_t v16 = *MEMORY[0x1E4F55FC0];
    uint64_t v17 = *MEMORY[0x1E4F55FE0];
    uint64_t v6 = *MEMORY[0x1E4F55FD0];
    uint64_t v7 = *MEMORY[0x1E4F55FC8];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(a1);
        }
        uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        char v10 = objc_msgSend(v9, "isEqual:", @"AVSemanticSegmentationMatteTypeHair", v16);
        uint64_t v11 = v7;
        if ((v10 & 1) == 0)
        {
          char v12 = [v9 isEqual:@"AVSemanticSegmentationMatteTypeSkin"];
          uint64_t v11 = v6;
          if ((v12 & 1) == 0)
          {
            char v13 = [v9 isEqual:@"AVSemanticSegmentationMatteTypeTeeth"];
            uint64_t v11 = v17;
            if ((v13 & 1) == 0)
            {
              int v14 = [v9 isEqual:@"AVSemanticSegmentationMatteTypeGlasses"];
              uint64_t v11 = v16;
              if (!v14) {
                continue;
              }
            }
          }
        }
        [v2 addObject:v11];
      }
      uint64_t v4 = [a1 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }
  return v2;
}

void *getFirstAvailableDeviceFromHistoryWhereWombatsMustBeMagic(void *a1, void *a2, char a3, char a4, void *a5)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t result = (void *)[a1 countByEnumeratingWithState:&v27 objects:v32 count:16];
  id v19 = result;
  if (result)
  {
    uint64_t v9 = *(void *)v28;
    uint64_t v18 = *(void *)v28;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(a1);
        }
        uint64_t v21 = v10;
        uint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8 * v10);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v12 = [a2 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v24;
          while (2)
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v24 != v14) {
                objc_enumerationMutation(a2);
              }
              uint64_t v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && ((a3 & 1) != 0 || ([v16 isSuspended] & 1) == 0)
                && ((a4 & 1) != 0 || [v16 specialDeviceType] != 1)
                && objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", @"DeviceUID"), "isEqualToString:", v16[10])&& (objc_msgSend(v16, "specialDeviceType") != 2&& objc_msgSend(v16, "specialDeviceType") != 3|| (fvd_deviceIsPresentInCameraList((uint64_t)v16, a5) & 1) != 0))
              {
                return v16;
              }
            }
            uint64_t v13 = [a2 countByEnumeratingWithState:&v23 objects:v31 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }
        uint64_t v10 = v21 + 1;
        uint64_t v9 = v18;
      }
      while ((id)(v21 + 1) != v19);
      uint64_t v17 = [a1 countByEnumeratingWithState:&v27 objects:v32 count:16];
      uint64_t result = 0;
      id v19 = (id)v17;
    }
    while (v17);
  }
  return result;
}

void *getFirstAvailableDeviceFromHistory(void *a1, void *a2, char a3, char a4)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t result = (void *)[a1 countByEnumeratingWithState:&v25 objects:v30 count:16];
  id v18 = result;
  if (result)
  {
    uint64_t v8 = *(void *)v26;
    uint64_t v17 = *(void *)v26;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(a1);
        }
        uint64_t v20 = v9;
        uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * v9);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v11 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v21, v29, 16, v17);
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v22;
          while (2)
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v22 != v13) {
                objc_enumerationMutation(a2);
              }
              double v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && ((a3 & 1) != 0 || ([v15 isSuspended] & 1) == 0)
                && ((a4 & 1) != 0 || [v15 specialDeviceType] != 1)
                && (objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", @"DeviceUID"), "isEqualToString:", v15[10]) & 1) != 0)
              {
                return v15;
              }
            }
            uint64_t v12 = [a2 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
        uint64_t v9 = v20 + 1;
        uint64_t v8 = v17;
      }
      while ((id)(v20 + 1) != v18);
      uint64_t v16 = [a1 countByEnumeratingWithState:&v25 objects:v30 count:16];
      uint64_t result = 0;
      id v18 = (id)v16;
    }
    while (v16);
  }
  return result;
}

void sub_1A1558114(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A155823C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A1558354(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 72), 8);
  _Unwind_Resume(a1);
}

uint64_t AVCaptureSessionSetAuthorizedToUseCameraInMultipleForegroundAppLayout(void *a1, const char *a2)
{
  return [a1 _setMultitaskingCameraAccessEnabled:1];
}

uint64_t __socvpl_figCaptureSessionNotification_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSpatialNotification:*(void *)(a1 + 40) payload:*(void *)(a1 + 48)];
}

void __avcdpp_dispatchNotification_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1A62348E0]();
  [*(id *)(a1 + 32) _handleNotification:*(void *)(a1 + 40) payload:*(void *)(a1 + 48)];
  uint64_t v3 = *(const void **)(a1 + 40);
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = *(const void **)(a1 + 48);
  if (v4) {
    CFRelease(v4);
  }
}

uint64_t __fvd_figCaptureSourceNotificationHandler_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleNotification:*(void *)(a1 + 40) payload:*(void *)(a1 + 48)];
}

void sub_1A155B36C(_Unwind_Exception *a1)
{
}

void sub_1A155B52C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A155B720(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A155C404(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A155CBB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A155D0D4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A155D878(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

CGAffineTransform *AVCaptureVideoTransformForCaptureDevice@<X0>(void *a1@<X0>, int a2@<W1>, int a3@<W2>, int a4@<W3>, uint64_t a5@<X4>, uint64_t *a6@<X5>, char a7@<W6>, void *a8@<X7>, uint64_t a9@<X8>, CGFloat a10@<D0>, CGFloat a11@<D1>, CGFloat a12@<D2>, CGFloat a13@<D3>, double a14@<D4>, double a15@<D5>, CGFloat a16@<D6>, CGFloat a17@<D7>, char a18, char a19)
{
  *(_OWORD *)(a9 + 16) = 0u;
  *(_OWORD *)(a9 + 32) = 0u;
  *(_OWORD *)a9 = 0u;
  CGAffineTransformMakeScale((CGAffineTransform *)a9, a10, a11);
  if (a10 != a12 || a11 != a13)
  {
    if ([a1 isEqualToString:*MEMORY[0x1E4F45468]])
    {
      double v37 = fmax(a12 / a10, a13 / a11);
      double v38 = v37;
    }
    else
    {
      int v39 = [a1 isEqualToString:*MEMORY[0x1E4F45458]];
      double v38 = a12 / a10;
      double v37 = a13 / a11;
      double v40 = fmin(a12 / a10, a13 / a11);
      if (v39)
      {
        double v37 = v40;
        double v38 = v40;
      }
    }
    memset(&v143, 0, sizeof(v143));
    CGAffineTransformMakeScale(&v143, v38, v37);
    long long v41 = *(_OWORD *)(a9 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a9;
    *(_OWORD *)&t1.c = v41;
    *(_OWORD *)&t1.tx = *(_OWORD *)(a9 + 32);
    CGAffineTransform t2 = v143;
    CGAffineTransformConcat(&v142, &t1, &t2);
    long long v42 = *(_OWORD *)&v142.c;
    *(_OWORD *)a9 = *(_OWORD *)&v142.a;
    *(_OWORD *)(a9 + 16) = v42;
    *(_OWORD *)(a9 + 32) = *(_OWORD *)&v142.tx;
    CGAffineTransform v142 = v143;
    uint64_t v43 = 0;
    *(void *)&long long v42 = 0;
    CGFloat v44 = a10;
    CGFloat v45 = a11;
    CGRect v144 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v42 - 8), &v142);
    CGAffineTransformMakeTranslation(&v139, (a12 - v144.size.width) * 0.5, (a13 - v144.size.height) * 0.5);
    long long v46 = *(_OWORD *)(a9 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a9;
    *(_OWORD *)&t1.c = v46;
    *(_OWORD *)&t1.tx = *(_OWORD *)(a9 + 32);
    CGAffineTransformConcat(&v142, &t1, &v139);
    long long v47 = *(_OWORD *)&v142.c;
    *(_OWORD *)a9 = *(_OWORD *)&v142.a;
    *(_OWORD *)(a9 + 16) = v47;
    *(_OWORD *)(a9 + 32) = *(_OWORD *)&v142.tx;
  }
  uint64_t v48 = 0;
  if (!a4)
  {
    uint64_t v54 = 0;
    double v55 = a12;
    a12 = a13;
    goto LABEL_45;
  }
  if (AVCapturePlatformMountsCamerasInLandscapeOrientation())
  {
    int v49 = FigCaptureCameraRequires180DegreesRotation();
    switch(a5)
    {
      case 1:
        if (!a3 && ((a2 ^ 1 | v49) & 1) != 0)
        {
          CGAffineTransformMakeRotation(&v136, 1.57079633);
          long long v50 = *(_OWORD *)(a9 + 16);
          *(_OWORD *)&v142.a = *(_OWORD *)a9;
          *(_OWORD *)&v142.c = v50;
          *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
          CGAffineTransformConcat(&v143, &v142, &v136);
          long long v51 = *(_OWORD *)&v143.c;
          *(_OWORD *)a9 = *(_OWORD *)&v143.a;
          *(_OWORD *)(a9 + 16) = v51;
          *(_OWORD *)(a9 + 32) = *(_OWORD *)&v143.tx;
          CGAffineTransformMakeTranslation(&v135, a13, 0.0);
          long long v52 = *(_OWORD *)(a9 + 16);
          *(_OWORD *)&v142.a = *(_OWORD *)a9;
          *(_OWORD *)&v142.c = v52;
          *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
          v53 = &v135;
          goto LABEL_39;
        }
        CGAffineTransformMakeRotation(&v138, 4.71238898);
        long long v79 = *(_OWORD *)(a9 + 16);
        *(_OWORD *)&v142.a = *(_OWORD *)a9;
        *(_OWORD *)&v142.c = v79;
        *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
        CGAffineTransformConcat(&v143, &v142, &v138);
        long long v80 = *(_OWORD *)&v143.c;
        *(_OWORD *)a9 = *(_OWORD *)&v143.a;
        *(_OWORD *)(a9 + 16) = v80;
        *(_OWORD *)(a9 + 32) = *(_OWORD *)&v143.tx;
        CGAffineTransformMakeTranslation(&v137, 0.0, a12);
        long long v81 = *(_OWORD *)(a9 + 16);
        *(_OWORD *)&v142.a = *(_OWORD *)a9;
        *(_OWORD *)&v142.c = v81;
        *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
        uint64_t v63 = &v137;
        goto LABEL_37;
      case 2:
        if (!a3 && ((a2 ^ 1 | v49) & 1) != 0)
        {
          CGAffineTransformMakeRotation(&v132, 4.71238898);
          long long v67 = *(_OWORD *)(a9 + 16);
          *(_OWORD *)&v142.a = *(_OWORD *)a9;
          *(_OWORD *)&v142.c = v67;
          *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
          CGAffineTransformConcat(&v143, &v142, &v132);
          long long v68 = *(_OWORD *)&v143.c;
          *(_OWORD *)a9 = *(_OWORD *)&v143.a;
          *(_OWORD *)(a9 + 16) = v68;
          *(_OWORD *)(a9 + 32) = *(_OWORD *)&v143.tx;
          CGAffineTransformMakeTranslation(&v131, 0.0, a12);
          long long v69 = *(_OWORD *)(a9 + 16);
          *(_OWORD *)&v142.a = *(_OWORD *)a9;
          *(_OWORD *)&v142.c = v69;
          *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
          uint64_t v63 = &v131;
          goto LABEL_37;
        }
        CGAffineTransformMakeRotation(&v134, 1.57079633);
        long long v83 = *(_OWORD *)(a9 + 16);
        *(_OWORD *)&v142.a = *(_OWORD *)a9;
        *(_OWORD *)&v142.c = v83;
        *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
        CGAffineTransformConcat(&v143, &v142, &v134);
        long long v84 = *(_OWORD *)&v143.c;
        *(_OWORD *)a9 = *(_OWORD *)&v143.a;
        *(_OWORD *)(a9 + 16) = v84;
        *(_OWORD *)(a9 + 32) = *(_OWORD *)&v143.tx;
        CGAffineTransformMakeTranslation(&v133, a13, 0.0);
        long long v85 = *(_OWORD *)(a9 + 16);
        *(_OWORD *)&v142.a = *(_OWORD *)a9;
        *(_OWORD *)&v142.c = v85;
        *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
        v53 = &v133;
        break;
      case 3:
        if (a2 & v49) != 1 || (a3) {
          goto LABEL_33;
        }
        CGAffineTransformMakeRotation(&v130, 3.14159265);
        long long v70 = *(_OWORD *)(a9 + 16);
        *(_OWORD *)&v142.a = *(_OWORD *)a9;
        *(_OWORD *)&v142.c = v70;
        *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
        CGAffineTransformConcat(&v143, &v142, &v130);
        long long v71 = *(_OWORD *)&v143.c;
        *(_OWORD *)a9 = *(_OWORD *)&v143.a;
        *(_OWORD *)(a9 + 16) = v71;
        *(_OWORD *)(a9 + 32) = *(_OWORD *)&v143.tx;
        CGAffineTransformMakeTranslation(&v129, a12, a13);
        long long v72 = *(_OWORD *)(a9 + 16);
        *(_OWORD *)&v142.a = *(_OWORD *)a9;
        *(_OWORD *)&v142.c = v72;
        *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
        v59 = &v129;
        goto LABEL_42;
      case 4:
        if ((a2 & v49) == 1 && !a3) {
          goto LABEL_33;
        }
        CGAffineTransformMakeRotation(&v128, 3.14159265);
        long long v87 = *(_OWORD *)(a9 + 16);
        *(_OWORD *)&v142.a = *(_OWORD *)a9;
        *(_OWORD *)&v142.c = v87;
        *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
        CGAffineTransformConcat(&v143, &v142, &v128);
        long long v88 = *(_OWORD *)&v143.c;
        *(_OWORD *)a9 = *(_OWORD *)&v143.a;
        *(_OWORD *)(a9 + 16) = v88;
        *(_OWORD *)(a9 + 32) = *(_OWORD *)&v143.tx;
        CGAffineTransformMakeTranslation(&v127, a12, a13);
        long long v89 = *(_OWORD *)(a9 + 16);
        *(_OWORD *)&v142.a = *(_OWORD *)a9;
        *(_OWORD *)&v142.c = v89;
        *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
        v59 = &v127;
        goto LABEL_42;
      default:
        goto LABEL_33;
    }
    goto LABEL_39;
  }
  if (a5 == 4)
  {
    if ((a2 & 1) == 0)
    {
      CGAffineTransformMakeRotation(&v120, 1.57079633);
      long long v76 = *(_OWORD *)(a9 + 16);
      *(_OWORD *)&v142.a = *(_OWORD *)a9;
      *(_OWORD *)&v142.c = v76;
      *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
      CGAffineTransformConcat(&v143, &v142, &v120);
      long long v77 = *(_OWORD *)&v143.c;
      *(_OWORD *)a9 = *(_OWORD *)&v143.a;
      *(_OWORD *)(a9 + 16) = v77;
      *(_OWORD *)(a9 + 32) = *(_OWORD *)&v143.tx;
      CGAffineTransformMakeTranslation(&v119, a13, 0.0);
      long long v78 = *(_OWORD *)(a9 + 16);
      *(_OWORD *)&v142.a = *(_OWORD *)a9;
      *(_OWORD *)&v142.c = v78;
      *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
      v53 = &v119;
      goto LABEL_39;
    }
    CGAffineTransformMakeRotation(&v118, 4.71238898);
    long long v60 = *(_OWORD *)(a9 + 16);
    *(_OWORD *)&v142.a = *(_OWORD *)a9;
    *(_OWORD *)&v142.c = v60;
    *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
    CGAffineTransformConcat(&v143, &v142, &v118);
    long long v61 = *(_OWORD *)&v143.c;
    *(_OWORD *)a9 = *(_OWORD *)&v143.a;
    *(_OWORD *)(a9 + 16) = v61;
    *(_OWORD *)(a9 + 32) = *(_OWORD *)&v143.tx;
    CGAffineTransformMakeTranslation(&v117, 0.0, a12);
    long long v62 = *(_OWORD *)(a9 + 16);
    *(_OWORD *)&v142.a = *(_OWORD *)a9;
    *(_OWORD *)&v142.c = v62;
    *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
    uint64_t v63 = &v117;
  }
  else
  {
    if (a5 != 3)
    {
      if (a5 == 2)
      {
        CGAffineTransformMakeRotation(&v126, 3.14159265);
        long long v56 = *(_OWORD *)(a9 + 16);
        *(_OWORD *)&v142.a = *(_OWORD *)a9;
        *(_OWORD *)&v142.c = v56;
        *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
        CGAffineTransformConcat(&v143, &v142, &v126);
        long long v57 = *(_OWORD *)&v143.c;
        *(_OWORD *)a9 = *(_OWORD *)&v143.a;
        *(_OWORD *)(a9 + 16) = v57;
        *(_OWORD *)(a9 + 32) = *(_OWORD *)&v143.tx;
        CGAffineTransformMakeTranslation(&v125, a12, a13);
        long long v58 = *(_OWORD *)(a9 + 16);
        *(_OWORD *)&v142.a = *(_OWORD *)a9;
        *(_OWORD *)&v142.c = v58;
        *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
        v59 = &v125;
LABEL_42:
        CGAffineTransformConcat(&v143, &v142, v59);
        long long v90 = *(_OWORD *)&v143.c;
        *(_OWORD *)a9 = *(_OWORD *)&v143.a;
        *(_OWORD *)(a9 + 16) = v90;
        *(_OWORD *)(a9 + 32) = *(_OWORD *)&v143.tx;
        uint64_t v54 = 0x4066800000000000;
      }
      else
      {
LABEL_33:
        uint64_t v54 = 0;
      }
      double v55 = a12;
      a12 = a13;
      goto LABEL_44;
    }
    if (a2)
    {
      CGAffineTransformMakeRotation(&v122, 1.57079633);
      long long v64 = *(_OWORD *)(a9 + 16);
      *(_OWORD *)&v142.a = *(_OWORD *)a9;
      *(_OWORD *)&v142.c = v64;
      *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
      CGAffineTransformConcat(&v143, &v142, &v122);
      long long v65 = *(_OWORD *)&v143.c;
      *(_OWORD *)a9 = *(_OWORD *)&v143.a;
      *(_OWORD *)(a9 + 16) = v65;
      *(_OWORD *)(a9 + 32) = *(_OWORD *)&v143.tx;
      CGAffineTransformMakeTranslation(&v121, a13, 0.0);
      long long v66 = *(_OWORD *)(a9 + 16);
      *(_OWORD *)&v142.a = *(_OWORD *)a9;
      *(_OWORD *)&v142.c = v66;
      *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
      v53 = &v121;
LABEL_39:
      CGAffineTransformConcat(&v143, &v142, v53);
      long long v86 = *(_OWORD *)&v143.c;
      *(_OWORD *)a9 = *(_OWORD *)&v143.a;
      *(_OWORD *)(a9 + 16) = v86;
      *(_OWORD *)(a9 + 32) = *(_OWORD *)&v143.tx;
      uint64_t v54 = 0x4056800000000000;
      goto LABEL_40;
    }
    CGAffineTransformMakeRotation(&v124, 4.71238898);
    long long v73 = *(_OWORD *)(a9 + 16);
    *(_OWORD *)&v142.a = *(_OWORD *)a9;
    *(_OWORD *)&v142.c = v73;
    *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
    CGAffineTransformConcat(&v143, &v142, &v124);
    long long v74 = *(_OWORD *)&v143.c;
    *(_OWORD *)a9 = *(_OWORD *)&v143.a;
    *(_OWORD *)(a9 + 16) = v74;
    *(_OWORD *)(a9 + 32) = *(_OWORD *)&v143.tx;
    CGAffineTransformMakeTranslation(&v123, 0.0, a12);
    long long v75 = *(_OWORD *)(a9 + 16);
    *(_OWORD *)&v142.a = *(_OWORD *)a9;
    *(_OWORD *)&v142.c = v75;
    *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
    uint64_t v63 = &v123;
  }
LABEL_37:
  CGAffineTransformConcat(&v143, &v142, v63);
  long long v82 = *(_OWORD *)&v143.c;
  *(_OWORD *)a9 = *(_OWORD *)&v143.a;
  *(_OWORD *)(a9 + 16) = v82;
  *(_OWORD *)(a9 + 32) = *(_OWORD *)&v143.tx;
  uint64_t v54 = 0x4070E00000000000;
LABEL_40:
  double v55 = a13;
LABEL_44:
  uint64_t v48 = 0;
LABEL_45:
  if (a7) {
    double v91 = a14;
  }
  else {
    double v91 = 0.0;
  }
  if (a7) {
    double v92 = a15;
  }
  else {
    double v92 = 0.0;
  }
  if ((a7 & 1) == 0)
  {
    a16 = v55;
    a17 = a12;
  }
  uint64_t v93 = 0;
  double v94 = v55;
  CGFloat v95 = a12;
  CGFloat v96 = a16;
  CGFloat v97 = a17;
  uint64_t result = (CGAffineTransform *)CGRectEqualToRect(*(CGRect *)&v48, *(CGRect *)&v91);
  if ((result & 1) == 0)
  {
    if ([a8 isEqualToString:*MEMORY[0x1E4F47C28]])
    {
      double v99 = a16 / v55;
      double v100 = a17 / a12;
    }
    else
    {
      int v101 = [a8 isEqualToString:*MEMORY[0x1E4F47C38]];
      double v102 = fmin(a16 / v55, a17 / a12);
      double v100 = fmax(a16 / v55, a17 / a12);
      if (v101) {
        double v99 = v100;
      }
      else {
        double v99 = v102;
      }
      if (!v101) {
        double v100 = v102;
      }
    }
    memset(&v143, 0, sizeof(v143));
    CGAffineTransformMakeScale(&v143, v99, v100);
    long long v103 = *(_OWORD *)(a9 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a9;
    *(_OWORD *)&t1.c = v103;
    *(_OWORD *)&t1.tx = *(_OWORD *)(a9 + 32);
    CGAffineTransform t2 = v143;
    CGAffineTransformConcat(&v142, &t1, &t2);
    long long v104 = *(_OWORD *)&v142.c;
    *(_OWORD *)a9 = *(_OWORD *)&v142.a;
    *(_OWORD *)(a9 + 16) = v104;
    *(_OWORD *)(a9 + 32) = *(_OWORD *)&v142.tx;
    CGAffineTransform v142 = v143;
    uint64_t v105 = 0;
    *(void *)&long long v104 = 0;
    double v106 = v55;
    CGFloat v107 = a12;
    CGRect v145 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v104 - 8), &v142);
    CGAffineTransformMakeTranslation(&v116, (a16 - v145.size.width) * 0.5, (a17 - v145.size.height) * 0.5);
    long long v108 = *(_OWORD *)(a9 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a9;
    *(_OWORD *)&t1.c = v108;
    *(_OWORD *)&t1.tx = *(_OWORD *)(a9 + 32);
    uint64_t result = CGAffineTransformConcat(&v142, &t1, &v116);
    long long v109 = *(_OWORD *)&v142.c;
    *(_OWORD *)a9 = *(_OWORD *)&v142.a;
    *(_OWORD *)(a9 + 16) = v109;
    *(_OWORD *)(a9 + 32) = *(_OWORD *)&v142.tx;
  }
  if (a18 && a19)
  {
    CGAffineTransformMakeScale(&v115, -1.0, 1.0);
    long long v110 = *(_OWORD *)(a9 + 16);
    *(_OWORD *)&v142.a = *(_OWORD *)a9;
    *(_OWORD *)&v142.c = v110;
    *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
    CGAffineTransformConcat(&v143, &v142, &v115);
    long long v111 = *(_OWORD *)&v143.c;
    *(_OWORD *)a9 = *(_OWORD *)&v143.a;
    *(_OWORD *)(a9 + 16) = v111;
    *(_OWORD *)(a9 + 32) = *(_OWORD *)&v143.tx;
    CGAffineTransformMakeTranslation(&v114, a16, 0.0);
    long long v112 = *(_OWORD *)(a9 + 16);
    *(_OWORD *)&v142.a = *(_OWORD *)a9;
    *(_OWORD *)&v142.c = v112;
    *(_OWORD *)&v142.tx = *(_OWORD *)(a9 + 32);
    uint64_t result = CGAffineTransformConcat(&v143, &v142, &v114);
    long long v113 = *(_OWORD *)&v143.c;
    *(_OWORD *)a9 = *(_OWORD *)&v143.a;
    *(_OWORD *)(a9 + 16) = v113;
    *(_OWORD *)(a9 + 32) = *(_OWORD *)&v143.tx;
  }
  if (a6) {
    *a6 = v54;
  }
  return result;
}

void sub_1A1561664(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t AVGestaltGetIntegerAnswer(uint64_t a1)
{
  if (avgestalt_buildDataBase_onceToken != -1) {
    dispatch_once(&avgestalt_buildDataBase_onceToken, &__block_literal_global_17);
  }
  uint64_t v2 = (void *)[(id)sAVGestaltIntegerDataBase objectForKeyedSubscript:a1];
  if (!v2) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }

  return [v2 integerValue];
}

double ps_CGSizeForSettingsDictionary(void *a1)
{
  if (!a1) {
    return *MEMORY[0x1E4F1DB30];
  }
  if ([a1 objectForKeyedSubscript:*MEMORY[0x1E4F24D70]])
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F24D08];
    uint64_t v3 = (void *)MEMORY[0x1E4F24E10];
  }
  else
  {
    if (![a1 objectForKeyedSubscript:*MEMORY[0x1E4F47D00]]) {
      return *MEMORY[0x1E4F1DB30];
    }
    uint64_t v2 = (void *)MEMORY[0x1E4F47D60];
    uint64_t v3 = (void *)MEMORY[0x1E4F47DB0];
  }
  int v4 = objc_msgSend((id)objc_msgSend(a1, "objectForKeyedSubscript:", *v3), "intValue");
  int v5 = objc_msgSend((id)objc_msgSend(a1, "objectForKeyedSubscript:", *v2), "intValue");
  if (v4 >= 1 && v5 >= 1) {
    return (double)v4;
  }
  return *MEMORY[0x1E4F1DB30];
}

uint64_t po_figCaptureStillImageSettingsFileTypeForAVFileType(void *a1)
{
  if ([a1 isEqual:*MEMORY[0x1E4F47BF8]]) {
    return 1785096550;
  }
  uint64_t v2 = 1751476579;
  if (([a1 isEqual:*MEMORY[0x1E4F47BE8]] & 1) == 0)
  {
    if ([a1 isEqual:*MEMORY[0x1E4F47BF0]])
    {
      return 1751476582;
    }
    else if ([a1 isEqual:*MEMORY[0x1E4F47C10]])
    {
      return 1953064550;
    }
    else if ([a1 isEqual:*MEMORY[0x1E4F47BE0]])
    {
      return 1684956519;
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

void *po_deviceArrayToFigCaptureSourceDeviceTypesArray(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v2 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [a1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(a1);
        }
        objc_msgSend(v2, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "figCaptureSourceDeviceType")));
      }
      uint64_t v4 = [a1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
  return v2;
}

void sub_1A15624D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 104), 8);
  _Unwind_Resume(a1);
}

void sub_1A15629BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
}

void sub_1A1562DB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 184), 8);
  _Block_object_dispose((const void *)(v32 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1A15632AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
}

void sub_1A1563678(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t AVMetadataObjectCreateBoxedMetadataFromObjectAndFormatDescription(void *a1, uint64_t a2, uint64_t *a3)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v6 = AVMetadataObjectCreateBoxedMetadataFromFaceObjectAndFormatDescription(a1, a2, &v9);
  uint64_t v7 = v6;
  if (a3 && !v6)
  {
    [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v9 userInfo:0];
    *a3 = AVErrorForClientProgrammingError();
  }
  return v7;
}

void sub_1A1564374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1564A04(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A1564DF4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A156594C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A1565CE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A1567EB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __AVCaptureIsRunningInMacCatalystEnvironment_block_invoke()
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "isMacCatalystApp");
  AVCaptureIsRunningInMacCatalystEnvironment_isCatalystApp = result;
  return result;
}

void __AVCaptureClientExpectsCameraMountedInLandscapeOrientation_block_invoke()
{
  AVCaptureClientExpectsCameraMountedInLandscapeOrientation_sAnswer = 1;
}

void sub_1A1568B44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1569718(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A1569878(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A156994C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A1569DC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A156A264(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A156A9FC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A156AB7C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A156AE98(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void __AVCaptureClientHasEntitlement_block_invoke(uint64_t a1)
{
  uint64_t v2 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  if (v2)
  {
    uint64_t v3 = v2;
    CFBooleanRef v4 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v2, *(CFStringRef *)(a1 + 32), 0);
    if (v4)
    {
      CFBooleanRef v5 = v4;
      CFTypeID v6 = CFGetTypeID(v4);
      if (v6 == CFBooleanGetTypeID()) {
        **(unsigned char **)(a1 + 40) = CFBooleanGetValue(v5) != 0;
      }
      CFRelease(v5);
    }
    CFRelease(v3);
  }
}

void __AVCaptureTemporaryHackToAllowPortraitBlurSeeRadar78740254_block_invoke()
{
  uint64_t v1 = (__CFString *)AVCaptureCopyClientCodeSigningIdentifier();
  if ([(__CFString *)v1 isEqualToString:@"com.apple.camera"]) {
    char v0 = 1;
  }
  else {
    char v0 = [(__CFString *)v1 isEqualToString:@"com.apple.VisionKit.KeyboardCamera"];
  }
  AVCaptureTemporaryHackToAllowPortraitBlurSeeRadar78740254_sAnswer = v0;
}

void __AVCaptureClientIsCameraOrDerivative_block_invoke()
{
  uint64_t v1 = (__CFString *)AVCaptureCopyClientCodeSigningIdentifier();
  if (([(__CFString *)v1 isEqualToString:0x1EF4D53D0] & 1) != 0
    || ([(__CFString *)v1 isEqualToString:0x1EF4D6430] & 1) != 0)
  {
    char v0 = 1;
  }
  else
  {
    char v0 = [(__CFString *)v1 isEqualToString:0x1EF4D6410];
  }
  AVCaptureClientIsCameraOrDerivative_sAnswer = v0;
}

void __AVCaptureClientIsInternalCommandLineTool_block_invoke()
{
  char v0 = (__CFString *)AVCaptureCopyClientCodeSigningIdentifier();
  AVCaptureClientIsInternalCommandLineTool_sAnswer = [(__CFString *)v0 isEqualToString:@"com.apple.avcapture"];
}

void __AVCaptureIsRunningInMediaserverd_block_invoke()
{
  CFStringRef v0 = AVCaptureCopyClientCodeSigningIdentifier();
  if (v0)
  {
    CFStringRef v1 = v0;
    if (CFStringGetLength(v0) == 22)
    {
      CFRange v2 = CFStringFind(v1, @"com.apple.mediaserverd", 0);
      if (v2.location) {
        BOOL v3 = 0;
      }
      else {
        BOOL v3 = v2.length == 22;
      }
      char v4 = v3;
      AVCaptureIsRunningInMediaserverd_sAnswer = v4;
    }
    CFRelease(v1);
  }
}

void __AVCaptureIsRunningInXCTest_block_invoke()
{
  CFStringRef v0 = AVCaptureCopyClientCodeSigningIdentifier();
  if (!v0) {
    return;
  }
  CFStringRef v1 = v0;
  CFIndex Length = CFStringGetLength(v0);
  CFIndex v3 = Length;
  if (Length <= 63)
  {
    if (Length == 16)
    {
      CFStringRef v4 = @"com.apple.xctest";
      goto LABEL_14;
    }
    if (Length == 24)
    {
      CFStringRef v4 = @"com.apple.dt.xctest.tool";
      goto LABEL_14;
    }
  }
  else
  {
    switch(Length)
    {
      case '@':
        CFStringRef v4 = @"com.apple.avfoundation.AVFCaptureTests-Embedded-Runner.xctrunner";
        goto LABEL_14;
      case 'D':
        CFStringRef v4 = @"com.apple.avfoundation.AVFoundation-OSX-Capture-Unit-Tests.xctrunner";
        goto LABEL_14;
      case 'L':
        CFStringRef v4 = @"com.apple.avfoundation.AVFoundation-macCatalyst-Capture-Unit-Tests.xctrunner";
LABEL_14:
        CFRange v5 = CFStringFind(v1, v4, 0);
        if (v5.location) {
          BOOL v6 = 0;
        }
        else {
          BOOL v6 = v5.length == v3;
        }
        char v7 = v6;
        AVCaptureIsRunningInXCTest_sAnswer = v7;
        break;
    }
  }

  CFRelease(v1);
}

void __AVCaptureCurrentClientIsFaceTimeVariant_block_invoke()
{
  CFStringRef v0 = (__CFString *)AVCaptureCopyClientCodeSigningIdentifier();
  AVCaptureCurrentClientIsFaceTimeVariant_sAnswer = AVCaptureClientIsFaceTimeVariant(v0);
}

uint64_t AVControlCenterVideoEffectsRequestGesturesDefaultDisabledNotificationPreferenceKey()
{
  return [NSString stringWithFormat:@"%@request-gestures-default-disabled-notification", @"signal/"];
}

uint64_t AVControlCenterVideoEffectsHaveShownGesturesDefaultDisabledNotificationPreferenceKey(void *a1)
{
  CFStringRef v1 = NSString;
  CFRange v2 = (__CFString *)AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2) {
    CFRange v2 = @"unknown";
  }
  uint64_t v3 = [(__CFString *)v2 stringByReplacingOccurrencesOfString:@"." withString:@"-"];
  return [v1 stringWithFormat:@"%@did-show-gestures-default-disabled-notification", objc_msgSend(NSString, "stringWithFormat:", @"videoeffects/%@/", v3)];
}

uint64_t AVCaptureIsRunningInXCTest()
{
  if (AVCaptureIsRunningInXCTest_sOnceToken != -1) {
    dispatch_once(&AVCaptureIsRunningInXCTest_sOnceToken, &__block_literal_global_289);
  }
  return AVCaptureIsRunningInXCTest_sAnswer;
}

uint64_t AVCaptureClientIsInternalTestTool()
{
  if (AVCaptureClientIsInternalTestTool_sOnceToken != -1) {
    dispatch_once(&AVCaptureClientIsInternalTestTool_sOnceToken, &__block_literal_global_58);
  }
  return AVCaptureClientIsInternalTestTool_sAnswer;
}

uint64_t AVControlCenterMigrateDefaultsForKeys(void *a1, void *a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t result = objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:"), "BOOLValue");
  if (result) {
    return result;
  }
  char v7 = (void *)AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  int v8 = [v7 isEqualToString:0x1EF4D64B0];
  if (v7
    && (int v9 = v8,
        !objc_msgSend(v7, "isEqualToString:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier"))))
  {
    if (!v9)
    {
      uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:a1 allowPlaceholder:1 error:0];
      uint64_t v21 = [v20 dataContainerURL];
      id v11 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) _initWithSuiteName:v7 container:v21];

      goto LABEL_6;
    }
    id v10 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:v7];
  }
  else
  {
    id v10 = (id)[MEMORY[0x1E4F1CB18] standardUserDefaults];
  }
  id v11 = v10;
LABEL_6:
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v12 = [a2 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(a2);
        }
        uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v17 = [a2 objectForKeyedSubscript:v16];
        uint64_t v18 = [v11 objectForKey:v16];
        if (v18) {
          BOOL v19 = v17 == 0;
        }
        else {
          BOOL v19 = 1;
        }
        if (!v19) {
          +[AVCaptureProprietaryDefaultsSingleton setObject:v18 forKey:v17];
        }
      }
      uint64_t v13 = [a2 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }
  return +[AVCaptureProprietaryDefaultsSingleton setObject:MEMORY[0x1E4F1CC38] forKey:a3];
}

__CFString *AVCaptureClientPreferencesDomain()
{
  CFStringRef v0 = (__CFString *)sClientPreferencesDomain;
  if (sClientPreferencesDomain) {
    return v0;
  }
  if (AVCaptureCurrentClientIsFaceTimeVariant_sOnceToken != -1) {
    dispatch_once(&AVCaptureCurrentClientIsFaceTimeVariant_sOnceToken, &__block_literal_global_35);
  }
  if (AVCaptureCurrentClientIsFaceTimeVariant_sAnswer)
  {
    CFStringRef v0 = @"com.apple.facetime";
    BOOL v1 = 1;
  }
  else
  {
    CFStringRef v0 = +[AVCaptureProprietaryDefaultsSingleton proprietaryDefaultsDomainForClient];
    BOOL v1 = v0 != 0;
    if (!v0)
    {
      CFStringRef v0 = @"unknown";
      if (!v1) {
        return v0;
      }
      goto LABEL_12;
    }
  }
  if ([(__CFString *)v0 hasPrefix:@"com.apple.WebKit"]) {
    CFStringRef v0 = @"com.apple.mobilesafari";
  }
  if (v1)
  {
LABEL_12:
    os_unfair_lock_lock((os_unfair_lock_t)&sClientPreferencesDomainLock);
    if (!sClientPreferencesDomain) {
      sClientPreferencesDomain = [[NSString alloc] initWithString:v0];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&sClientPreferencesDomainLock);
  }
  return v0;
}

uint64_t AVControlCenterVideoEffectsStudioLightingUnavailableReasonsPreferenceKey(void *a1)
{
  BOOL v1 = NSString;
  CFRange v2 = (__CFString *)AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2) {
    CFRange v2 = @"unknown";
  }
  uint64_t v3 = [(__CFString *)v2 stringByReplacingOccurrencesOfString:@"." withString:@"-"];
  return [v1 stringWithFormat:@"%@studiolighting-unavailablereasons", objc_msgSend(NSString, "stringWithFormat:", @"videoeffects/%@/", v3)];
}

uint64_t AVControlCenterVideoEffectsStudioLightingIntensityPreferenceKey(void *a1)
{
  BOOL v1 = NSString;
  CFRange v2 = (__CFString *)AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2) {
    CFRange v2 = @"unknown";
  }
  uint64_t v3 = [(__CFString *)v2 stringByReplacingOccurrencesOfString:@"." withString:@"-"];
  return [v1 stringWithFormat:@"%@studiolighting-intensity", objc_msgSend(NSString, "stringWithFormat:", @"videoeffects/%@/", v3)];
}

uint64_t AVControlCenterVideoEffectsStudioLightingEnabledPreferenceKey(void *a1)
{
  BOOL v1 = NSString;
  CFRange v2 = (__CFString *)AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2) {
    CFRange v2 = @"unknown";
  }
  uint64_t v3 = [(__CFString *)v2 stringByReplacingOccurrencesOfString:@"." withString:@"-"];
  return [v1 stringWithFormat:@"%@studiolighting-enabled", objc_msgSend(NSString, "stringWithFormat:", @"videoeffects/%@/", v3)];
}

uint64_t AVControlCenterVideoEffectsStudioLightingControlModePreferenceKey(void *a1)
{
  BOOL v1 = NSString;
  CFRange v2 = (__CFString *)AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2) {
    CFRange v2 = @"unknown";
  }
  uint64_t v3 = [(__CFString *)v2 stringByReplacingOccurrencesOfString:@"." withString:@"-"];
  return [v1 stringWithFormat:@"%@studiolighting-controlmode", objc_msgSend(NSString, "stringWithFormat:", @"videoeffects/%@/", v3)];
}

uint64_t AVControlCenterVideoEffectsPortraitEffectUnavailableReasonsPreferenceKey(void *a1)
{
  BOOL v1 = NSString;
  CFRange v2 = (__CFString *)AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2) {
    CFRange v2 = @"unknown";
  }
  uint64_t v3 = [(__CFString *)v2 stringByReplacingOccurrencesOfString:@"." withString:@"-"];
  return [v1 stringWithFormat:@"%@portraiteffect-unavailablereasons", objc_msgSend(NSString, "stringWithFormat:", @"videoeffects/%@/", v3)];
}

uint64_t AVControlCenterVideoEffectsPortraitEffectMigrationCompletePreferenceKey(void *a1)
{
  BOOL v1 = NSString;
  CFRange v2 = (__CFString *)AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2) {
    CFRange v2 = @"unknown";
  }
  uint64_t v3 = [(__CFString *)v2 stringByReplacingOccurrencesOfString:@"." withString:@"-"];
  return [v1 stringWithFormat:@"%@portraiteffect-migration-complete", objc_msgSend(NSString, "stringWithFormat:", @"videoeffects/%@/", v3)];
}

uint64_t AVControlCenterVideoEffectsPortraitEffectEnabledPreferenceKey(void *a1)
{
  BOOL v1 = NSString;
  CFRange v2 = (__CFString *)AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2) {
    CFRange v2 = @"unknown";
  }
  uint64_t v3 = [(__CFString *)v2 stringByReplacingOccurrencesOfString:@"." withString:@"-"];
  return [v1 stringWithFormat:@"%@portraiteffect-enabled", objc_msgSend(NSString, "stringWithFormat:", @"videoeffects/%@/", v3)];
}

uint64_t AVControlCenterVideoEffectsPortraitEffectControlModePreferenceKey(void *a1)
{
  BOOL v1 = NSString;
  CFRange v2 = (__CFString *)AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2) {
    CFRange v2 = @"unknown";
  }
  uint64_t v3 = [(__CFString *)v2 stringByReplacingOccurrencesOfString:@"." withString:@"-"];
  return [v1 stringWithFormat:@"%@portraiteffect-controlmode", objc_msgSend(NSString, "stringWithFormat:", @"videoeffects/%@/", v3)];
}

uint64_t AVControlCenterVideoEffectsGesturesEnabledPreferenceKey(void *a1)
{
  BOOL v1 = NSString;
  CFRange v2 = (__CFString *)AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2) {
    CFRange v2 = @"unknown";
  }
  uint64_t v3 = [(__CFString *)v2 stringByReplacingOccurrencesOfString:@"." withString:@"-"];
  return [v1 stringWithFormat:@"%@gestures-enabled", objc_msgSend(NSString, "stringWithFormat:", @"videoeffects/%@/", v3)];
}

__CFString *avcc_prefixedSignalPreferenceKeyForBundleID(void *a1)
{
  if (!a1) {
    return @"signal/";
  }
  BOOL v1 = (__CFString *)AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v1) {
    BOOL v1 = @"unknown";
  }
  uint64_t v2 = [(__CFString *)v1 stringByReplacingOccurrencesOfString:@"." withString:@"-"];
  return (__CFString *)[NSString stringWithFormat:@"signal/%@/", v2];
}

uint64_t AVControlCenterModulesShouldBeShownForBundleID(void *a1)
{
  v11[28] = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C9160)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (AVCaptureClientIsFaceTimeVariant(a1)) {
    a1 = @"com.apple.facetime";
  }
  if (objc_msgSend(a1, "hasPrefix:", @"com.apple.WebKit", v7, v9)) {
    a1 = @"com.apple.mobilesafari";
  }
  v11[0] = 0x1EF4D53D0;
  v11[1] = 0x1EF4D6410;
  v11[2] = 0x1EF4D6430;
  v11[3] = 0x1EF4D64D0;
  v11[4] = 0x1EF4D6510;
  v11[5] = @"com.apple.ShazamKit";
  v11[6] = @"com.apple.VisionKit.KeyboardCamera";
  v11[7] = 0x1EF4D6490;
  v11[8] = 0x1EF4D6450;
  v11[9] = @"com.apple.livetranscriptionui";
  v11[10] = @"com.apple.BarcodeScanner";
  v11[11] = @"com.apple.measure";
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v11, 12), "containsObject:", a1))
  {
    if (dword_1EB4C9160)
    {
      BOOL v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return 0;
  }
  else
  {
    id v3 = _AVControlCenterModuleStateForBundleID((uint64_t)a1);
    if (dword_1EB4C9160)
    {
      CFStringRef v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return objc_msgSend(v3, "isActive", v8, v10);
  }
}

uint64_t AVControlCenterPreferencesDomainForPreferencesDomain(void *a1)
{
  uint64_t v2 = 0x1EF4D64B0;
  if (([a1 isEqualToString:0x1EF4D64B0] & 1) == 0)
  {
    if (AVCaptureCurrentClientIsFaceTimeVariant_sOnceToken != -1) {
      dispatch_once(&AVCaptureCurrentClientIsFaceTimeVariant_sOnceToken, &__block_literal_global_35);
    }
    if (!AVCaptureCurrentClientIsFaceTimeVariant_sAnswer)
    {
      if ([a1 hasPrefix:@"com.apple.WebKit"]) {
        return 0x1EF4D64F0;
      }
      else {
        return (uint64_t)a1;
      }
    }
  }
  return v2;
}

uint64_t AVCaptureClientIsFaceTimeVariant(void *a1)
{
  if (([a1 isEqualToString:@"com.apple.mediaserverd"] & 1) != 0
    || ([a1 isEqualToString:0x1EF4D6470] & 1) != 0
    || ([a1 isEqualToString:0x1EF4D64B0] & 1) != 0
    || ([a1 isEqualToString:@"com.apple.avconferenced"] & 1) != 0
    || ([a1 isEqualToString:@"com.apple.TelephonyUtilities"] & 1) != 0
    || ([a1 isEqualToString:@"com.apple.FaceTime.FaceTimeNotificationCenterService"] & 1) != 0
    || ([a1 isEqualToString:@"com.apple.VideoConference.AVConferenceTestRunneriOS"] & 1) != 0
    || ([a1 isEqualToString:@"com.apple.AVConferenceTestRunnertvOS"] & 1) != 0
    || ([a1 isEqualToString:@"com.apple.facetime.legacy"] & 1) != 0)
  {
    return 1;
  }

  return [a1 isEqualToString:@"com.apple.facetime.debug"];
}

uint64_t AVControlCenterVideoEffectsPortraitEffectAperturePreferenceKey(void *a1)
{
  BOOL v1 = NSString;
  uint64_t v2 = (__CFString *)AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2) {
    uint64_t v2 = @"unknown";
  }
  uint64_t v3 = [(__CFString *)v2 stringByReplacingOccurrencesOfString:@"." withString:@"-"];
  return [v1 stringWithFormat:@"%@portraiteffect-aperture", objc_msgSend(NSString, "stringWithFormat:", @"videoeffects/%@/", v3)];
}

uint64_t AVControlCenterVideoEffectsEligibleEffectListPreferenceKey(void *a1)
{
  BOOL v1 = NSString;
  uint64_t v2 = (__CFString *)AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2) {
    uint64_t v2 = @"unknown";
  }
  uint64_t v3 = [(__CFString *)v2 stringByReplacingOccurrencesOfString:@"." withString:@"-"];
  return [v1 stringWithFormat:@"%@eligible-effects-list", objc_msgSend(NSString, "stringWithFormat:", @"videoeffects/%@/", v3)];
}

uint64_t AVControlCenterVideoEffectsCenterStageUnavailableReasonsPreferenceKey(void *a1)
{
  BOOL v1 = NSString;
  uint64_t v2 = (__CFString *)AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2) {
    uint64_t v2 = @"unknown";
  }
  uint64_t v3 = [(__CFString *)v2 stringByReplacingOccurrencesOfString:@"." withString:@"-"];
  return [v1 stringWithFormat:@"%@centerstage-unavailablereasons", objc_msgSend(NSString, "stringWithFormat:", @"videoeffects/%@/", v3)];
}

uint64_t AVControlCenterVideoEffectsCenterStageMigrationCompletePreferenceKey(void *a1)
{
  BOOL v1 = NSString;
  uint64_t v2 = (__CFString *)AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2) {
    uint64_t v2 = @"unknown";
  }
  uint64_t v3 = [(__CFString *)v2 stringByReplacingOccurrencesOfString:@"." withString:@"-"];
  return [v1 stringWithFormat:@"%@centerstage-migration-complete", objc_msgSend(NSString, "stringWithFormat:", @"videoeffects/%@/", v3)];
}

uint64_t AVControlCenterVideoEffectsCenterStageEnabledPreferenceKey(void *a1)
{
  BOOL v1 = NSString;
  uint64_t v2 = (__CFString *)AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2) {
    uint64_t v2 = @"unknown";
  }
  uint64_t v3 = [(__CFString *)v2 stringByReplacingOccurrencesOfString:@"." withString:@"-"];
  return [v1 stringWithFormat:@"%@centerstage-enabled", objc_msgSend(NSString, "stringWithFormat:", @"videoeffects/%@/", v3)];
}

uint64_t AVControlCenterVideoEffectsCenterStageControlModePreferenceKey(void *a1)
{
  BOOL v1 = NSString;
  uint64_t v2 = (__CFString *)AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v2) {
    uint64_t v2 = @"unknown";
  }
  uint64_t v3 = [(__CFString *)v2 stringByReplacingOccurrencesOfString:@"." withString:@"-"];
  return [v1 stringWithFormat:@"%@centerstage-controlmode", objc_msgSend(NSString, "stringWithFormat:", @"videoeffects/%@/", v3)];
}

id _AVControlCenterModuleStateForBundleID(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (AVControlCenterModulesPrewarm_onceToken != -1) {
    dispatch_once(&AVControlCenterModulesPrewarm_onceToken, &__block_literal_global_431);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sModuleStatesLock);
  uint64_t v2 = (void *)[(id)sModuleStatesByBundleID objectForKeyedSubscript:a1];
  if (v2)
  {
    id v3 = v2;
    if ([v2 isDeviceBasedModuleState]
      && ([v3 isDeviceBasedModuleStateUpdateToDate] & 1) == 0)
    {
      if (dword_1EB4C9160)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      objc_msgSend(v3, "setupDeviceBasedModuleStatesIfNeeded", v10, v13);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&sModuleStatesLock);
  }
  else
  {
    if (dword_1EB4C9160)
    {
      CFRange v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    id v3 = +[AVControlCenterModuleState moduleStateForBundleID:](AVControlCenterModuleState, "moduleStateForBundleID:", a1, v10, v13);
    if (dword_1EB4C9160)
    {
      BOOL v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend((id)sModuleStatesByBundleID, "setObject:forKeyedSubscript:", v3, a1, v11, v14);
    os_unfair_lock_unlock((os_unfair_lock_t)&sModuleStatesLock);
    if (dword_1EB4C9160)
    {
      uint64_t v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(v3, "installProprietaryDefaultsHandlers", v12, v15);
    if (dword_1EB4C9160)
    {
      uint64_t v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return v3;
}

uint64_t AVCaptureTemporaryHackToAllowPortraitBlurSeeRadar78740254()
{
  if (AVCaptureTemporaryHackToAllowPortraitBlurSeeRadar78740254_sOnceToken != -1) {
    dispatch_once(&AVCaptureTemporaryHackToAllowPortraitBlurSeeRadar78740254_sOnceToken, &__block_literal_global_81);
  }
  return AVCaptureTemporaryHackToAllowPortraitBlurSeeRadar78740254_sAnswer;
}

uint64_t AVCaptureClientIsInternalCommandLineTool()
{
  if (AVCaptureClientIsInternalCommandLineTool_sOnceToken != -1) {
    dispatch_once(&AVCaptureClientIsInternalCommandLineTool_sOnceToken, &__block_literal_global_306);
  }
  return AVCaptureClientIsInternalCommandLineTool_sAnswer;
}

void __AVCaptureClientIsInternalTestTool_block_invoke()
{
  BOOL v1 = (__CFString *)AVCaptureCopyClientCodeSigningIdentifier();
  if ([(__CFString *)v1 isEqualToString:@"com.apple.avfoundation.figcam"]) {
    char v0 = 1;
  }
  else {
    char v0 = [(__CFString *)v1 isEqualToString:@"com.apple.avcapture"];
  }
  AVCaptureClientIsInternalTestTool_sAnswer = v0;
}

void __AVCaptureClientIsContinuityCapture_block_invoke()
{
  BOOL v1 = (__CFString *)AVCaptureCopyClientCodeSigningIdentifier();
  if ([(__CFString *)v1 isEqualToString:0x1EF4D6490]) {
    char v0 = 1;
  }
  else {
    char v0 = [(__CFString *)v1 isEqualToString:0x1EF4D6450];
  }
  AVCaptureClientIsContinuityCapture_sAnswer = v0;
}

CFStringRef AVCaptureCopyClientCodeSigningIdentifier()
{
  if (AVCaptureCopyClientCodeSigningIdentifier_sOnceToken != -1) {
    dispatch_once(&AVCaptureCopyClientCodeSigningIdentifier_sOnceToken, &__block_literal_global_4);
  }
  CFStringRef v0 = (const __CFString *)AVCaptureCopyClientCodeSigningIdentifier_sClientCodeSigningIdentifier;
  if (!AVCaptureCopyClientCodeSigningIdentifier_sClientCodeSigningIdentifier) {
    return 0;
  }
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];

  return CFStringCreateCopy(v1, v0);
}

BOOL po_photoSettingsAreValid(void *a1, uint64_t a2, void *a3, void *a4, __CFString **a5)
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  uint64_t v105 = 0;
  double v106 = &v105;
  uint64_t v107 = 0x2020000000;
  char v108 = 0;
  uint64_t v101 = 0;
  double v102 = &v101;
  uint64_t v103 = 0x2020000000;
  char v104 = 0;
  uint64_t v97 = 0;
  v98 = &v97;
  uint64_t v99 = 0x2020000000;
  char v100 = 0;
  uint64_t v93 = 0;
  double v94 = &v93;
  uint64_t v95 = 0x2020000000;
  char v96 = 0;
  if (!a3)
  {
    if (a1) {
      goto LABEL_7;
    }
LABEL_271:
    long long v22 = @"Nil settings";
    goto LABEL_268;
  }
  if (!a1) {
    goto LABEL_271;
  }
  if (a3[2])
  {
    uint64_t v83 = a3[2];
    if ([a1 uniqueID] <= *(void *)(v83 + 16))
    {
      long long v22 = @"Settings may not be re-used";
      goto LABEL_268;
    }
    uint64_t v7 = *(NSObject **)(v83 + 264);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    void block[2] = __po_photoSettingsAreValid_block_invoke;
    block[3] = &unk_1E5A79E60;
    block[4] = v83;
    block[5] = a1;
    block[6] = &v105;
    void block[7] = &v101;
    block[8] = &v97;
    block[9] = &v93;
    dispatch_sync(v7, block);
    int v8 = 1;
    goto LABEL_8;
  }
LABEL_7:
  int v8 = 0;
  uint64_t v83 = 0;
LABEL_8:
  uint64_t v9 = [a1 processedFileType];
  char v10 = v8 ^ 1;
  if (!v9) {
    char v10 = 1;
  }
  if ((v10 & 1) == 0
    && !objc_msgSend(*(id *)(v83 + 48), "containsObject:", objc_msgSend(a1, "processedFileType")))
  {
    long long v22 = @"settings.processedFileType must be present in self.availablePhotoFileTypes";
    goto LABEL_268;
  }
  uint64_t v11 = [a1 rawFileType];
  char v12 = v8 ^ 1;
  if (!v11) {
    char v12 = 1;
  }
  if ((v12 & 1) == 0
    && !objc_msgSend(*(id *)(v83 + 56), "containsObject:", objc_msgSend(a1, "rawFileType")))
  {
    long long v22 = @"settings.rawFileType must be present in self.availableRawPhotoFileTypes";
    goto LABEL_268;
  }
  if ([a1 rawPhotoPixelFormatType])
  {
    if (v8)
    {
      if (!objc_msgSend(*(id *)(v83 + 40), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a1, "rawPhotoPixelFormatType"))))
      {
        long long v22 = @"settings.rawPhotoPixelFormatType must be present in self.availableRawPhotoPixelFormatTypes";
        goto LABEL_268;
      }
      if ([a1 rawFileType])
      {
        uint64_t v13 = objc_msgSend(a3, "supportedRawPhotoPixelFormatTypesForFileType:", objc_msgSend(a1, "rawFileType"));
        if (!objc_msgSend(v13, "containsObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a1, "rawPhotoPixelFormatType"))))
        {
          long long v22 = @"settings.rawPhotoPixelFormatType must be present in [self supportedRawPhotoPixelFormatTypesForFileType:settings.rawFileType]";
          goto LABEL_268;
        }
      }
      if ([a1 isConstantColorEnabled])
      {
        long long v22 = @"When capturing a raw photo, settings.constantColorEnabled must be set to NO";
        goto LABEL_268;
      }
    }
    if (+[AVCapturePhotoOutput isBayerRAWPixelFormat:](AVCapturePhotoOutput, "isBayerRAWPixelFormat:", [a1 rawPhotoPixelFormatType]))
    {
      if ([a1 HDRMode])
      {
        long long v22 = @"When specifying Bayer raw capture, settings.HDRMode must be set to AVCaptureHDRModeOff";
        goto LABEL_268;
      }
      if ([a1 photoQualityPrioritization] != 1)
      {
        long long v22 = @"When specifying Bayer raw capture, settings.photoQualityPrioritization must be set to AVCapturePhotoQualityPrioritizationSpeed";
        goto LABEL_268;
      }
      if ([a1 digitalFlashMode])
      {
        long long v22 = @"When specifying Bayer raw capture, settings.digitalFlashMode must be set to AVCaptureDigitalFlashModeOff";
        goto LABEL_268;
      }
      if (a4)
      {
        objc_msgSend((id)objc_msgSend(a4, "sourceDevice"), "videoZoomFactor");
        if (v14 != 1.0)
        {
          long long v22 = @"When specifying Bayer raw capture, the videoZoomFactor of the video device must be set to 1.0";
          goto LABEL_268;
        }
        [a4 videoScaleAndCropFactor];
        if (v15 != 1.0)
        {
          long long v22 = @"When specifying Bayer raw capture, the videoScaleAndCropFactor of the photo output's video connection must be set to 1.0";
          goto LABEL_268;
        }
      }
      if ([a1 isAutoVirtualDeviceFusionEnabled])
      {
        long long v22 = @"When specifying Bayer raw capture, settings.autoVirtualDeviceFusionEnabled must be set to NO";
        goto LABEL_268;
      }
    }
    if (a2 && (objc_opt_respondsToSelector() & 1) == 0 && (objc_opt_respondsToSelector() & 1) == 0)
    {
      long long v22 = @"If you specify a non-nil raw pixel format type in your settings, your delegate must respond to the selector captureOutput:didFinishProcessingPhoto:error: or the deprecated captureOutput:didFinishProcessingRawPhotoSampleBuffer:previewPhotoSampleBuffer:resolvedSettings:bracketSettings:error:";
      goto LABEL_268;
    }
  }
  if ([a1 format])
  {
    uint64_t v16 = (void *)[a1 format];
    uint64_t v17 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F24D70]];
    uint64_t v18 = (void *)[a1 format];
    uint64_t v19 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F47D00]];
    char v20 = v8 ^ 1;
    if (v17) {
      char v21 = v8 ^ 1;
    }
    else {
      char v21 = 1;
    }
    if (v21)
    {
      uint64_t v23 = v19;
      if (!v19) {
        char v20 = 1;
      }
      if ((v20 & 1) == 0)
      {
        if (![*(id *)(v83 + 32) containsObject:v19])
        {
          long long v22 = @"The AVVideoCodecKey format must be present in self.availablePhotoCodecTypes";
          goto LABEL_268;
        }
        if ([a1 processedFileType]
          && !objc_msgSend((id)objc_msgSend(a3, "supportedPhotoCodecTypesForFileType:", objc_msgSend(a1, "processedFileType")), "containsObject:", v23))
        {
          long long v22 = @"The AVVideoCodecKey format must be present in [self supportedPhotoCodecTypesForFileType:settings.processedFileType]";
          goto LABEL_268;
        }
      }
    }
    else
    {
      if (([*(id *)(v83 + 24) containsObject:v17] & 1) == 0)
      {
        long long v22 = @"The CVPixelBufferPixelFormatTypeKey format must be present in self.availablePhotoPixelFormatTypes";
        goto LABEL_268;
      }
      if ([a1 processedFileType]
        && (objc_msgSend((id)objc_msgSend(a3, "supportedPhotoPixelFormatTypesForFileType:", objc_msgSend(a1, "processedFileType")), "containsObject:", v17) & 1) == 0)
      {
        long long v22 = @"The CVPixelBufferFormatTypeKey format must be present in [self supportedPhotoPixelFormatTypesForFileType:settings.processedFileType]";
        goto LABEL_268;
      }
    }
    if (a2)
    {
      long long v24 = (void *)[a1 processedFileType];
      if ([v24 isEqual:*MEMORY[0x1E4F47BE8]]
        || (long long v25 = (void *)[a1 processedFileType],
            [v25 isEqual:*MEMORY[0x1E4F47BF0]]))
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          long long v22 = @"In order to capture HEIF containerized photos, your delegate must respond to the selector captureOutput:didFinishProcessingPhoto:error:";
          goto LABEL_268;
        }
      }
      if ((objc_opt_respondsToSelector() & 1) == 0 && (objc_opt_respondsToSelector() & 1) == 0)
      {
        long long v22 = @"If you specify a non-nil format dictionary in your settings, your delegate must respond to the selector captureOutput:didFinishProcessingPhoto:error:, or the deprecated captureOutput:didFinishProcessingPhotoSampleBuffer:previewPhotoSampleBuffer:resolvedSettings:bracketSettings:error:";
        goto LABEL_268;
      }
    }
  }
  if (v8 && !*((unsigned char *)v102 + 24))
  {
    long long v22 = @"HDRMode must be set to a value present in the supportedHDRModes array";
    goto LABEL_268;
  }
  if ((v8 & [a1 photoQualityPrioritizationIsSetByClient]) == 1)
  {
    uint64_t v26 = *(void *)(v83 + 80);
    if (v26 < [a1 photoQualityPrioritization])
    {
      long long v22 = @"settings.photoQualityPrioritization must not be higher than self.maxPhotoQualityPrioritization";
      goto LABEL_268;
    }
  }
  if ([a1 isEV0PhotoDeliveryEnabled])
  {
    if (v8 && !*((unsigned char *)v98 + 24))
    {
      long long v22 = @"EV0PhotoDeliveryEnabled must not be set to YES when EV0PhotoDeliverySupported is NO";
      goto LABEL_268;
    }
    if (![a1 HDRMode])
    {
      long long v22 = @"EV0PhotoDeliveryEnabled must be set to NO if HDRMode is AVCaptureHDRModeOff";
      goto LABEL_268;
    }
    if (a2 && (objc_opt_respondsToSelector() & 1) == 0)
    {
      long long v22 = @"If you specify EV0PhotoDeliveryEnabled=YES in your settings, your delegate must respond to the selector captureOutput:didFinishProcessingPhoto:error:";
      goto LABEL_268;
    }
  }
  if (v8 && !*((unsigned char *)v106 + 24))
  {
    long long v22 = @"flashMode must be set to a value present in the supportedFlashModes array";
    goto LABEL_268;
  }
  if ([a1 digitalFlashMode])
  {
    if (v8)
    {
      if (!*(unsigned char *)(v83 + 128))
      {
        long long v22 = @"digitalFlashMode must be AVCaptureDigitalFlashModeOff if self.digitalFlashCaptureEnabled is NO";
        goto LABEL_268;
      }
      if (!*((unsigned char *)v94 + 24))
      {
        long long v22 = @"digitalFlashMode must be set to a value present in the supportedDigitalFlashModes array";
        goto LABEL_268;
      }
    }
    if ([a1 digitalFlashMode])
    {
      if ([a1 flashMode] == 1)
      {
        long long v22 = @"Flash mode must not be on when Digital Flash mode is min or max";
        goto LABEL_268;
      }
      if ([a1 HDRMode] == 1)
      {
        long long v22 = @"HDR mode must not be on when Digital Flash mode is min or max";
        goto LABEL_268;
      }
    }
    if ([a1 livePhotoMovieFileURL])
    {
      long long v22 = @"digitalFlashMode must be AVCaptureDigitalFlashModeOff when livePhotoMovieFileURL is non-nil";
      goto LABEL_268;
    }
  }
  if ([a1 livePhotoMovieFileURL])
  {
    if (v8 && !*(unsigned char *)(v83 + 146))
    {
      long long v22 = @"livePhotoMovieFileURL must be nil if self.livePhotoCaptureEnabled is NO";
      goto LABEL_268;
    }
    if (!objc_msgSend((id)objc_msgSend(a1, "livePhotoMovieFileURL"), "isFileURL"))
    {
      long long v22 = @"livePhotoMovieFileURL must be a file url";
      goto LABEL_268;
    }
    if (a2
      && (objc_opt_respondsToSelector() & 1) == 0
      && (objc_opt_respondsToSelector() & 1) == 0
      && (objc_opt_respondsToSelector() & 1) == 0)
    {
      long long v22 = @"If you specify a non-nil livePhotoMovieFileURL, your delegate must respond to the selector captureOutput:didFinishProcessingLivePhotoToMovieFileAtURL:duration:photoDisplayTime:resolvedSettings:error:";
      goto LABEL_268;
    }
    if ([a1 livePhotoMovieFileURLForOriginalPhoto])
    {
      if (objc_msgSend((id)objc_msgSend(a1, "livePhotoMovieFileURL"), "isEqual:", objc_msgSend(a1, "livePhotoMovieFileURLForOriginalPhoto")))
      {
        long long v22 = @"livePhotoMovieFileURLForOriginalPhoto may not be the same as livePhotoMovieFileURL";
        goto LABEL_268;
      }
      if (!objc_msgSend((id)objc_msgSend(a1, "livePhotoMovieFileURLForOriginalPhoto"), "isFileURL"))
      {
        long long v22 = @"livePhotoMovieFileURLForOriginalPhoto must be a file url";
        goto LABEL_268;
      }
    }
    if (v8)
    {
      if (*(unsigned char *)(v83 + 216))
      {
        long long v22 = @"Live Photos may not be captured while livePhotoCaptureSuspended is YES";
        goto LABEL_268;
      }
      if ((objc_msgSend(*(id *)(v83 + 152), "containsObject:", objc_msgSend(a1, "livePhotoVideoCodecType")) & 1) == 0)
      {
        long long v22 = @"livePhotoVideoCodecType must be present in self.availableLivePhotoVideoCodecTypes";
        goto LABEL_268;
      }
    }
  }
  if ([a1 livePhotoMovieFileURLForOriginalPhoto] && !objc_msgSend(a1, "livePhotoMovieFileURL"))
  {
    long long v22 = @"If you specify a non-nil livePhotoMovieFileURLForOriginalPhoto, you must also provide a non-nil livePhotoMovieFileURL";
    goto LABEL_268;
  }
  if ([a1 isAutoSpatialOverCaptureEnabled])
  {
    if (a4 && !objc_msgSend((id)objc_msgSend(a4, "sourceDevice"), "isSpatialOverCaptureEnabled"))
    {
      long long v22 = @"If you set autoSpatialOverCaptureEnabled to YES, the source device's spatialOverCaptureEnabled property must also be set to YES";
      goto LABEL_268;
    }
    uint64_t v27 = [a1 livePhotoMovieFileURL];
    if ((v27 != 0) != ([a1 spatialOverCaptureLivePhotoMovieFileURL] != 0))
    {
      long long v22 = @"If you set autoSpatialOverCaptureEnabled to YES and specify a non-nil livePhotoMovieFileURL, you must also specify a non-nil spatialOverCaptureLivePhotoMovieFileURL";
      goto LABEL_268;
    }
    uint64_t v28 = [a1 livePhotoMovieFileURLForOriginalPhoto];
    if ((v28 != 0) != ([a1 spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto] != 0))
    {
      long long v22 = @"If you set autoSpatialOverCaptureEnabled to YES and specify a non-nil livePhotoMovieFileURLForOriginalPhoto, you must also specify a non-nil spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto";
      goto LABEL_268;
    }
  }
  uint64_t v29 = [a1 HEICSFileURL];
  if (a2 && v29 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    long long v22 = @"If you specify a non-nil HEICSFileURL, your delegate must respond to the selector captureOutput:didFinishProcessingPhotoFileAtURL:resolvedSettings:error:";
    goto LABEL_268;
  }
  uint64_t v30 = [a1 videoFileURL];
  if (a2 && v30 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    long long v22 = @"If you specify a non-nil videoFileURL, your delegate must respond to the selector captureOutput:didFinishProcessingVideoFileAtURL:resolvedSettings:previewPixelBuffer:recordedDuration:error:";
    goto LABEL_268;
  }
  if (v8)
  {
    if ([a1 isHighResolutionPhotoEnabled] && !*(unsigned char *)(v83 + 130))
    {
      long long v22 = @"settings.highResolutionPhotoEnabled may not be YES unless self.highResolutionCaptureEnabled is YES";
      goto LABEL_268;
    }
    if ([a1 maxPhotoDimensions]
      || (unint64_t)[a1 maxPhotoDimensions] >> 32)
    {
      if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "connectionWithMediaType:", *MEMORY[0x1E4F47C68]), "sourceDevice"), "activeFormat"), "validateMaxPhotoDimensions:privateDimensionsEnabled:", objc_msgSend(a1, "maxPhotoDimensions"), objc_msgSend(a3, "arePrivatePhotoDimensionsEnabled")) & 1) == 0)
      {
        long long v22 = @"If you specify a maxPhotoDimensions, it must match one of the supportedMaxPhotoDimensions of the video devices's active format";
        goto LABEL_268;
      }
      if (*(_DWORD *)(v83 + 512) < (int)[a1 maxPhotoDimensions]
        || *(_DWORD *)(v83 + 516) < (int)((unint64_t)[a1 maxPhotoDimensions] >> 32))
      {
        long long v22 = @"If you specify a non-nil maxPhotoDimensions, it must not be larger than the maxPhotoDimensions set on the AVCapturePhotoOutput";
        goto LABEL_268;
      }
    }
  }
  if ([a1 livePhotoMovieFileURL])
  {
    if ([a1 isSquareCropEnabled])
    {
      long long v22 = @"Square crop must be NO when livePhotoMovieFileURL is non-nil";
      goto LABEL_268;
    }
  }
  else if ([a1 flashMode] == 1 && objc_msgSend(a1, "HDRMode") == 1)
  {
    long long v22 = @"HDR mode must not be on when flash mode is on";
    goto LABEL_268;
  }
  if ([a1 shutterSound] != 1108
    && (AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementShutterSoundManipulation) & 1) == 0)
  {
    uint64_t v31 = objc_msgSend((id)objc_msgSend(a3, "session"), "inputs");
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v88 objects:v124 count:16];
    if (!v32)
    {
LABEL_126:
      long long v22 = @"You are not authorized to use custom shutter sounds";
      goto LABEL_268;
    }
    uint64_t v33 = *(void *)v89;
LABEL_118:
    uint64_t v34 = 0;
    while (1)
    {
      if (*(void *)v89 != v33) {
        objc_enumerationMutation(v31);
      }
      v35 = *(void **)(*((void *)&v88 + 1) + 8 * v34);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v35, "device"), "deviceType"), "isEqual:", @"AVCaptureDeviceTypeBuiltInTimeOfFlightCamera")&& objc_msgSend((id)objc_msgSend(v35, "device"), "timeOfFlightProjectorMode") == 6)
      {
        break;
      }
      if (v32 == ++v34)
      {
        uint64_t v32 = [v31 countByEnumeratingWithState:&v88 objects:v124 count:16];
        if (!v32) {
          goto LABEL_126;
        }
        goto LABEL_118;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_126;
    }
  }
  char v36 = [a1 isShutterSoundSuppressionEnabled];
  if (sIsForcedShutterSoundRegion) {
    char v37 = v36;
  }
  else {
    char v37 = 0;
  }
  if (v37)
  {
    long long v22 = @"settings.shutterSoundSuppressionEnabled may not be set to YES unless self.shutterSoundSuppressionSupported is YES";
    goto LABEL_268;
  }
  if ((v8 & [a1 isProcessedPhotoZoomWithoutUpscalingEnabled]) == 1
    && !*(unsigned char *)(v83 + 434))
  {
    long long v22 = @"settings.processedPhotoZoomWithoutUpscalingEnabled may not be set to YES unless self.processedPhotoZoomWithoutUpscalingSupported is YES";
    goto LABEL_268;
  }
  if ((v8 & [a1 isAutoContentAwareDistortionCorrectionEnabled]) == 1
    && !*(unsigned char *)(v83 + 438))
  {
    long long v22 = @"settings.autoContentAwareDistortionCorrectionEnabled may not be set to YES unless self.contentAwareDistortionCorrectionEnabled is YES";
    goto LABEL_268;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_182;
  }
  if (v83)
  {
    if ((unint64_t)objc_msgSend((id)objc_msgSend(a1, "bracketedSettings"), "count") > *(void *)(v83 + 136))
    {
      long long v22 = @"bracketedSettings array exceeds -maxBracketedCapturePhotoCount";
      goto LABEL_268;
    }
    if ([a1 isLensStabilizationEnabled] && !*(unsigned char *)(v83 + 144))
    {
      long long v22 = @"settings.lensStabilizationEnabled may only be set to YES if self.lensStabilizationDuringBracketedCaptureSupported is YES";
      goto LABEL_268;
    }
  }
  if (!a4) {
    goto LABEL_182;
  }
  double v38 = (void *)[a4 sourceDevice];
  int v39 = (void *)[v38 activeFormat];
  double v40 = (void *)[a1 bracketedSettings];
  [v40 objectAtIndexedSubscript:0];
  uint64_t v41 = objc_opt_class();
  if (v41 != objc_opt_class())
  {
    if (v41 == objc_opt_class())
    {
      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      uint64_t v42 = [v40 countByEnumeratingWithState:&v109 objects:v125 count:16];
      if (v42)
      {
        uint64_t v43 = *(void *)v110;
        while (2)
        {
          for (uint64_t i = 0; i != v42; ++i)
          {
            if (*(void *)v110 != v43) {
              objc_enumerationMutation(v40);
            }
            CGFloat v45 = *(void **)(*((void *)&v109 + 1) + 8 * i);
            [v45 exposureTargetBias];
            if (v46 != 3.4028e38)
            {
              [v45 exposureTargetBias];
              float v48 = v47;
              [v38 minExposureTargetBias];
              if (v48 < v49)
              {
                long long v79 = @"%@ contains an out of range exposure target bias. Use AVCaptureDevice -minExposureTargetBias";
                goto LABEL_267;
              }
              [v45 exposureTargetBias];
              float v51 = v50;
              [v38 maxExposureTargetBias];
              if (v51 > v52)
              {
                long long v79 = @"%@ contains an out of range exposure target bias. Use AVCaptureDevice -maxExposureTargetBias";
                goto LABEL_267;
              }
            }
          }
          uint64_t v42 = [v40 countByEnumeratingWithState:&v109 objects:v125 count:16];
          if (v42) {
            continue;
          }
          break;
        }
      }
    }
    goto LABEL_182;
  }
  if (![v38 isExposureModeSupported:3])
  {
    long long v22 = @"Source device does not support manual exposure bracketed capture. Use AVCaptureDevice -isExposureModeSupported: with AVCaptureExposureModeCustom";
    goto LABEL_268;
  }
  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  uint64_t v53 = [v40 countByEnumeratingWithState:&v119 objects:v126 count:16];
  if (!v53) {
    goto LABEL_182;
  }
  uint64_t v54 = *(void *)v120;
  while (2)
  {
    for (uint64_t j = 0; j != v53; ++j)
    {
      if (*(void *)v120 != v54) {
        objc_enumerationMutation(v40);
      }
      CGFloat v45 = *(void **)(*((void *)&v119 + 1) + 8 * j);
      [v45 ISO];
      if (v56 != 3.4028e38)
      {
        [v45 ISO];
        float v58 = v57;
        [v39 minISO];
        if (v58 < v59)
        {
          long long v79 = @"%@ contains an out of range ISO value. Use AVCaptureDeviceFormat -minISO";
          goto LABEL_267;
        }
        [v45 ISO];
        float v61 = v60;
        [v39 maxISO];
        if (v61 > v62)
        {
          long long v79 = @"%@ contains an out of range ISO value. Use AVCaptureDeviceFormat -maxISO";
          goto LABEL_267;
        }
      }
      if (v45) {
        [v45 exposureDuration];
      }
      else {
        memset(&time1, 0, sizeof(time1));
      }
      memset(&time2, 0, sizeof(time2));
      if (CMTimeCompare(&time1, &time2))
      {
        if (v45)
        {
          [v45 exposureDuration];
          if (v39) {
            goto LABEL_170;
          }
LABEL_172:
          memset(&v115, 0, sizeof(v115));
        }
        else
        {
          memset(&v116, 0, sizeof(v116));
          if (!v39) {
            goto LABEL_172;
          }
LABEL_170:
          [v39 minExposureDuration];
        }
        if (CMTimeCompare(&v116, &v115) < 0)
        {
          long long v79 = @"%@ contains an out of range exposure duration. Use AVCaptureDeviceFormat -minExposureDuration";
        }
        else
        {
          if (v45)
          {
            [v45 exposureDuration];
            if (v39) {
              goto LABEL_176;
            }
LABEL_178:
            memset(&v113, 0, sizeof(v113));
          }
          else
          {
            memset(&v114, 0, sizeof(v114));
            if (!v39) {
              goto LABEL_178;
            }
LABEL_176:
            [v39 maxExposureDuration];
          }
          if (CMTimeCompare(&v114, &v113) <= 0) {
            continue;
          }
          long long v79 = @"%@ contains an out of range exposure duration. Use AVCaptureDeviceFormat -maxExposureDuration";
        }
LABEL_267:
        long long v22 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", v79, v45);
        goto LABEL_268;
      }
    }
    uint64_t v53 = [v40 countByEnumeratingWithState:&v119 objects:v126 count:16];
    if (v53) {
      continue;
    }
    break;
  }
LABEL_182:
  if ([a1 isDepthDataDeliveryEnabled])
  {
    if (v8 && !*(unsigned char *)(v83 + 219))
    {
      long long v22 = @"settings.depthDataDeliveryEnabled must be NO if self.isDepthDataDeliveryEnabled is NO";
    }
    else
    {
      if (!a2 || (objc_opt_respondsToSelector() & 1) != 0) {
        goto LABEL_187;
      }
      long long v22 = @"Your delegate must respond to the selector captureOutput:didFinishProcessingPhoto:error: if you set depthDataDeliveryEnabled to YES";
    }
LABEL_268:
    if (a5 && v22) {
      *a5 = v22;
    }
  }
  else
  {
LABEL_187:
    if ([a1 isPortraitEffectsMatteDeliveryEnabled])
    {
      if (v8)
      {
        if (!*(unsigned char *)(v83 + 221))
        {
          long long v22 = @"settings.portraitEffectsMatteDeliveryEnabled must be NO if self.isPortraitEffectsMatteDeliveryEnabled is NO";
          goto LABEL_268;
        }
        if (!*(unsigned char *)(v83 + 219))
        {
          long long v22 = @"settings.depthDataDeliveryEnabled must be YES if settings.portraitEffectsMatteDeliveryEnabled is YES";
          goto LABEL_268;
        }
      }
      if ([a1 embedsPortraitEffectsMatteInPhoto]
        && ![a1 embedsDepthDataInPhoto])
      {
        long long v22 = @"If settings.embedsPortraitEffectsMatteInPhoto is set to YES, settings.embedsDepthDataInPhoto must also be set to YES.";
        goto LABEL_268;
      }
      if (a2 && (objc_opt_respondsToSelector() & 1) == 0)
      {
        long long v22 = @"Your delegate must respond to the selector captureOutput:didFinishProcessingPhoto:error: if you set portraitEffectsMatteDeliveryEnabled to YES";
        goto LABEL_268;
      }
    }
    if (objc_msgSend((id)objc_msgSend(a1, "enabledSemanticSegmentationMatteTypes"), "count"))
    {
      if (v8)
      {
        uint64_t v63 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", objc_msgSend(a1, "enabledSemanticSegmentationMatteTypes"));
        objc_msgSend(v63, "minusSet:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", *(void *)(v83 + 232)));
        if ([v63 count])
        {
          long long v22 = @"You may not set enabledSemanticSegmentationMatteTypes in your AVCapturePhotoSettings that are not present in your AVCapturePhotoOutput.enabledSemanticSegmentationMatteTypes";
          goto LABEL_268;
        }
      }
      if (a2 && (objc_opt_respondsToSelector() & 1) == 0)
      {
        long long v22 = @"Your delegate must respond to the selector captureOutput:didFinishProcessingPhoto:error: if you set enabledSemanticSegmentationMatteTypes";
        goto LABEL_268;
      }
    }
    uint64_t v64 = objc_msgSend((id)objc_msgSend(a1, "photoFilters"), "count");
    char v65 = v8 ^ 1;
    if (!v64) {
      char v65 = 1;
    }
    if ((v65 & 1) == 0 && !*(unsigned char *)(v83 + 240))
    {
      long long v22 = @"settings.photoFilters must be empty if self.isFilterRenderingEnabled is NO";
      goto LABEL_268;
    }
    uint64_t v66 = objc_msgSend((id)objc_msgSend(a1, "adjustedPhotoFilters"), "count");
    char v67 = v8 ^ 1;
    if (!v66) {
      char v67 = 1;
    }
    if ((v67 & 1) == 0 && !*(unsigned char *)(v83 + 240))
    {
      long long v22 = @"settings.adjustedPhotoFilters must be empty if self.isFilterRenderingEnabled is NO";
      goto LABEL_268;
    }
    if (objc_msgSend((id)objc_msgSend(a1, "virtualDeviceConstituentPhotoDeliveryEnabledDevices"), "count"))
    {
      if ((unint64_t)objc_msgSend((id)objc_msgSend(a1, "virtualDeviceConstituentPhotoDeliveryEnabledDevices"), "count") < 2)
      {
        long long v22 = @"settings.virtualDeviceConstituentPhotoDeliveryEnabledDevices must have 2 or more AVCaptureDevices";
        goto LABEL_268;
      }
      if (v8 && !*(unsigned char *)(v83 + 92))
      {
        long long v22 = @"settings.virtualDeviceConstituentPhotoDeliveryEnabledDevices may not be set to a non-empty array unless self.virtualDeviceConstituentPhotoDeliveryEnabled is YES";
        goto LABEL_268;
      }
      if (a4)
      {
        if (!objc_msgSend((id)objc_msgSend(a4, "sourceDevice"), "isVirtualDevice"))
        {
          long long v22 = @"settings.virtualDeviceConstituentPhotoDeliveryEnabledDevices may not be set to a non-empty array unless your photo output is not connected to a virtual device";
          goto LABEL_268;
        }
        long long v68 = objc_msgSend((id)objc_msgSend(a4, "sourceDevice"), "constituentDevices");
        long long v86 = 0u;
        long long v87 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        long long v69 = (void *)[a1 virtualDeviceConstituentPhotoDeliveryEnabledDevices];
        uint64_t v70 = [v69 countByEnumeratingWithState:&v84 objects:v123 count:16];
        if (v70)
        {
          uint64_t v71 = *(void *)v85;
          long long v22 = @"settings.virtualDeviceConstituentPhotoDeliveryEnabledDevices may only include devices present in the source virtual device's constituentDevices array";
LABEL_216:
          uint64_t v72 = 0;
          while (1)
          {
            if (*(void *)v85 != v71) {
              objc_enumerationMutation(v69);
            }
            if (([v68 containsObject:*(void *)(*((void *)&v84 + 1) + 8 * v72)] & 1) == 0) {
              goto LABEL_268;
            }
            if (v70 == ++v72)
            {
              uint64_t v70 = [v69 countByEnumeratingWithState:&v84 objects:v123 count:16];
              if (v70) {
                goto LABEL_216;
              }
              break;
            }
          }
        }
      }
      if (AVCIFilterArrayContainsPortraitFilters((void *)[a1 adjustedPhotoFilters]))
      {
        long long v22 = @"settings.adjustedPhotoFilters must not contain any portrait filters if settings.virtualDeviceConstituentPhotoDeliveryEnabledDevices is a non-empty array";
        goto LABEL_268;
      }
      if ([a1 isConstantColorEnabled])
      {
        long long v22 = @"settings.constantColorEnabled must be NO if settings.virtualDeviceConstituentPhotoDeliveryEnabledDevices is a non-empty array";
        goto LABEL_268;
      }
      if (a2 && (objc_opt_respondsToSelector() & 1) == 0)
      {
        long long v22 = @"Your delegate must respond to the selector captureOutput:didFinishProcessingPhoto:error: if you set settings.virtualDeviceConstituentPhotoDeliveryEnabledDevices to a non-empty array";
        goto LABEL_268;
      }
    }
    if ([a1 isDualCameraDualPhotoDeliveryEnabled])
    {
      if (v8 && !*(unsigned char *)(v83 + 94) && !*(unsigned char *)(v83 + 92))
      {
        long long v22 = @"settings.dualCameraDualPhotoDeliveryEnabled may not be set to YES unless self.dualCameraDualPhotoDeliveryEnabled is YES";
        goto LABEL_268;
      }
      if (AVCIFilterArrayContainsPortraitFilters((void *)[a1 adjustedPhotoFilters]))
      {
        long long v22 = @"settings.adjustedPhotoFilters must not contain any portrait filters if settings.dualCameraDualPhotoDeliveryEnabled is YES";
        goto LABEL_268;
      }
      if (a2 && (objc_opt_respondsToSelector() & 1) == 0)
      {
        long long v22 = @"Your delegate must respond to the selector captureOutput:didFinishProcessingPhoto:error: if you set dualCameraDualPhotoDeliveryEnabled to YES";
        goto LABEL_268;
      }
    }
    if ([a1 isCameraCalibrationDataDeliveryEnabled])
    {
      if (v8 && ![a3 isCameraCalibrationDataDeliverySupported])
      {
        long long v22 = @"settings.cameraCalibrationDataDeliveryEnabled may not be set to YES unless self.cameraCalibrationDataDeliverySupported is YES";
        goto LABEL_268;
      }
      if ((unint64_t)objc_msgSend((id)objc_msgSend(a1, "virtualDeviceConstituentPhotoDeliveryEnabledDevices"), "count") < 2)
      {
        long long v22 = @"settings.cameraCalibrationDataDeliveryEnabled may not be set to YES unless 2 or more AVCaptureDevices are added to settings.virtualDeviceConstituentPhotoDeliveryEnabledDevices";
        goto LABEL_268;
      }
      if (a2 && (objc_opt_respondsToSelector() & 1) == 0)
      {
        long long v22 = @"Your delegate must respond to the selector captureOutput:didFinishProcessingPhoto:error: if you set cameraCalibrationDataDeliveryEnabled to YES";
        goto LABEL_268;
      }
    }
    int v73 = [a3 isAutoDeferredPhotoDeliveryEnabled] ^ 1;
    if (!a2) {
      LOBYTE(v73) = 1;
    }
    if ((v73 & 1) == 0 && (objc_opt_respondsToSelector() & 1) == 0)
    {
      long long v22 = @"Your delegate must respond to the selector captureOutput:didFinishCapturingDeferredPhotoProxy:error: if you set AVCapturePhotoOutput.autoDeferredPhotoDeliveryEnabled to YES";
      goto LABEL_268;
    }
    if ([a1 isConstantColorEnabled])
    {
      if (v8 && !*(unsigned char *)(v83 + 537))
      {
        long long v22 = @"settings.isConstantColorEnabled must be NO if self.isConstantColorEnabled is NO";
        goto LABEL_268;
      }
      if ([a1 flashMode] != 1 && objc_msgSend(a1, "flashMode") != 2)
      {
        long long v22 = @"settings.flashMode must be AVCaptureFlashModeOn or AVCaptureFlashModeAuto if settings.isConstantColorEnabled is YES";
        goto LABEL_268;
      }
    }
    if ([a1 isConstantColorFallbackPhotoDeliveryEnabled]
      && ![a1 isConstantColorEnabled])
    {
      long long v22 = @"settings.isConstantColorEnabled must be YES if settings.isConstantColorFallbackPhotoDeliveryEnabled is YES";
      goto LABEL_268;
    }
    if ([a1 isAutoSpatialPhotoCaptureEnabled])
    {
      if (v8)
      {
        if (!*(unsigned char *)(v83 + 541))
        {
          long long v22 = @"settings.autoSpatialPhotoCaptureEnabled must not be set to YES when self.spatialPhotoCaptureEnabled is NO";
          goto LABEL_268;
        }
        if (!*(unsigned char *)(v83 + 433))
        {
          long long v22 = @"settings.autoSpatialPhotoCaptureEnabled must not be set to YES when self.autoDeferredPhotoDeliveryEnabled is NO";
          goto LABEL_268;
        }
      }
      if ([a1 photoQualityPrioritization] != 3)
      {
        long long v22 = @"settings.autoSpatialPhotoCaptureEnabled must not be set to YES when settings.photoQualityPrioritization is not set to AVCapturePhotoQualityPrioritizationQuality";
        goto LABEL_268;
      }
      if (a4)
      {
        long long v74 = (void *)[a4 sourceDevice];
        if ((unint64_t)objc_msgSend((id)objc_msgSend(v74, "constituentDevices"), "count") < 2)
        {
          long long v22 = @"settings.autoSpatialPhotoCaptureEnabled must not be set to YES when AVCaptureDevice.constituentDevices.count is less than 2";
          goto LABEL_268;
        }
        if ((__CFString *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v74, "constituentDevices"), "objectAtIndex:", 1), "deviceType") != @"AVCaptureDeviceTypeBuiltInWideAngleCamera")
        {
          long long v22 = @"settings.autoSpatialPhotoCaptureEnabled must not be set to YES when AVCaptureDeviceTypeBuiltInWideAngleCamera is not second constituentDevice";
          goto LABEL_268;
        }
        objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "sourceDevice"), "virtualDeviceSwitchOverVideoZoomFactors"), "firstObject"), "floatValue");
        float v76 = v75;
        [v74 videoZoomFactor];
        if (v77 != v76)
        {
          long long v22 = @"settings.autoSpatialPhotoCaptureEnabled must not be set to YES when videoZoomFactor is not equal to Ultra Wide camera to Wide Angle camera switch over zoom factor : videoConnection.sourceDevice.virtualDeviceSwitchOverVideoZoomFactors.firstObject";
          goto LABEL_268;
        }
      }
    }
    long long v22 = 0;
  }
  _Block_object_dispose(&v93, 8);
  _Block_object_dispose(&v97, 8);
  _Block_object_dispose(&v101, 8);
  _Block_object_dispose(&v105, 8);
  return v22 == 0;
}

void sub_1A1571668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

void sub_1A157575C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void avcdpp_dispatchNotification(uint64_t a1, CFTypeRef cf, CFTypeRef a3)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  void block[2] = __avcdpp_dispatchNotification_block_invoke;
  block[3] = &unk_1E5A72F70;
  block[4] = a1;
  block[5] = cf;
  block[6] = a3;
  if (cf) {
    CFRetain(cf);
  }
  if (a3) {
    CFRetain(a3);
  }
  Main = CFRunLoopGetMain();
  CFRunLoopPerformBlock(Main, (CFTypeRef)*MEMORY[0x1E4F1D410], block);
  CFRange v5 = CFRunLoopGetMain();
  CFRunLoopWakeUp(v5);
}

double vpl_valueToRect(void *a1)
{
  long long v1 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  v3[0] = *MEMORY[0x1E4F1DB28];
  v3[1] = v1;
  [a1 getValue:v3];
  return *(double *)v3;
}

uint64_t vpl_rectToValue(double a1, double a2, double a3, double a4)
{
  *(double *)CFRange v5 = a1;
  *(double *)&v5[1] = a2;
  *(double *)&v5[2] = a3;
  *(double *)&v5[3] = a4;
  return [MEMORY[0x1E4F29238] valueWithBytes:v5 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
}

void sub_1A15773A4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A1578534(_Unwind_Exception *a1)
{
}

void sub_1A1578A40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 152), 8);
  _Block_object_dispose((const void *)(v32 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A1578D2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Block_object_dispose((const void *)(v17 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A1578ED0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A157906C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A1579364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A15798F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _registerServerConnectionDiedNotification()
{
  CFStringRef v0 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 addObserverForName:*MEMORY[0x1E4F51E28] object:0 queue:0 usingBlock:&__block_literal_global_1303];

  JUMPOUT(0x1A6234050);
}

void sub_1A157AF0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t AVCaptureClientIsCameraOrDerivative()
{
  if (AVCaptureClientIsCameraOrDerivative_sOnceToken != -1) {
    dispatch_once(&AVCaptureClientIsCameraOrDerivative_sOnceToken, &__block_literal_global_77);
  }
  return AVCaptureClientIsCameraOrDerivative_sAnswer;
}

void sub_1A157B2FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A157C0B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A157C1B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _registerAudioDevicesOnce()
{
  os_unfair_lock_lock((os_unfair_lock_t)&sRegisterAudioDevicesLock);
  if (!sRegisteredAudioDevices)
  {
    if (AVCaptureIsRunningInMediaserverd()) {
      id v0 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    }
    else {
      id v0 = (id)[NSClassFromString(&cfstr_Avcapturefigau.isa) _devices];
    }
    sRegisteredAudioDevices = (uint64_t)v0;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&sRegisterAudioDevicesLock);
}

uint64_t __avcs_platformSupportsDeferredProcessing_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  avcs_platformSupportsDeferredProcessing_answer = result;
  return result;
}

BOOL SettingsArePassthru(void *a1)
{
  return a1 && ![a1 count];
}

id AVIdentifierForObject(uint64_t a1)
{
  id v2 = [NSString alloc];
  id v3 = (objc_class *)objc_opt_class();
  CFStringRef v4 = NSStringFromClass(v3);
  CFRange v5 = (void *)[v2 initWithFormat:@"<%@: %p %lld>", v4, a1, mach_absolute_time()];

  return v5;
}

uint64_t __AVCaptureAudiomxdSupportEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  AVCaptureAudiomxdSupportEnabled_sCaptureAudiomxdSupportEnabled = result;
  return result;
}

void __AVCaptureCopyClientCodeSigningIdentifier_block_invoke()
{
  id v0 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  if (v0)
  {
    uint64_t v1 = v0;
    AVCaptureCopyClientCodeSigningIdentifier_sClientCodeSigningIdentifier = (uint64_t)SecTaskCopySigningIdentifier(v0, 0);
    CFRelease(v1);
  }
}

void sub_1A15817F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A1581964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A15820B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A15829C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A1582CA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t avcmdo_nextTimeForDetector@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = MEMORY[0x1E4F1F9F8];
  *(_OWORD *)a3 = *MEMORY[0x1E4F1F9F8];
  *(void *)(a3 + 16) = *(void *)(v4 + 16);
  CFRange v5 = (void *)[a1 objectForKeyedSubscript:a2];
  if ([v5 count] == 2)
  {
    memset(&v16, 0, sizeof(v16));
    BOOL v6 = (void *)[v5 objectAtIndexedSubscript:1];
    if (v6) {
      [v6 CMTimeValue];
    }
    else {
      memset(&v16, 0, sizeof(v16));
    }
    memset(&v15, 0, sizeof(v15));
    int v8 = (void *)[v5 objectAtIndexedSubscript:0];
    if (v8) {
      [v8 CMTimeValue];
    }
    else {
      memset(&v15, 0, sizeof(v15));
    }
    memset(&v14, 0, sizeof(v14));
    CMTime lhs = v16;
    CMTime rhs = v15;
    CMTimeSubtract(&v14, &lhs, &rhs);
    CMTime rhs = v16;
    CMTime v11 = v14;
    CMTimeAdd(&lhs, &rhs, &v11);
    *(_OWORD *)a3 = *(_OWORD *)&lhs.value;
    CMTimeEpoch epoch = lhs.epoch;
LABEL_14:
    *(void *)(a3 + 16) = epoch;
    return [v5 removeAllObjects];
  }
  if ([v5 count] == 1)
  {
    memset(&v16, 0, sizeof(v16));
    uint64_t v7 = (void *)[v5 objectAtIndexedSubscript:0];
    if (v7)
    {
      [v7 CMTimeValue];
      LODWORD(v7) = v16.timescale;
    }
    else
    {
      memset(&v16, 0, sizeof(v16));
    }
    memset(&v15, 0, sizeof(v15));
    CMTimeMakeWithSeconds(&v15, 0.0333333333, (int32_t)v7);
    CMTime lhs = v16;
    CMTime rhs = v15;
    CMTimeAdd(&v14, &lhs, &rhs);
    *(_OWORD *)a3 = *(_OWORD *)&v14.value;
    CMTimeEpoch epoch = v14.epoch;
    goto LABEL_14;
  }
  return [v5 removeAllObjects];
}

uint64_t __AVCaptureMetadataObjectsOnly_block_invoke()
{
  uint64_t result = dyld_program_sdk_at_least();
  if ((result & 1) == 0) {
    AVCaptureMetadataObjectsOnly_answer = 1;
  }
  return result;
}

void sub_1A1585EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56)
{
}

uint64_t AVGestaltGetStringAnswerWithDefault(uint64_t a1, uint64_t a2)
{
  if (avgestalt_buildDataBase_onceToken != -1) {
    dispatch_once(&avgestalt_buildDataBase_onceToken, &__block_literal_global_17);
  }
  uint64_t result = [(id)sAVGestaltStringDataBase objectForKeyedSubscript:a1];
  if (!result) {
    return a2;
  }
  return result;
}

void sub_1A15867F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void *avcmdo_allMetadataObjectsInCollections(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [a1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(a1);
        }
        objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "metadataObjects"));
      }
      while (v4 != v6);
      uint64_t v4 = [a1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
  return v2;
}

void __AVCaptureMainScreenPixelSize_block_invoke()
{
  uint64_t v0 = MGCopyAnswer();
  if (v0)
  {
    uint64_t v1 = (const void *)v0;
    FigCFDictionaryGetFloatIfPresent();
    FigCFDictionaryGetFloatIfPresent();
    CFRelease(v1);
  }
}

uint64_t __AVCaptureSessionIsLaunchPrewarmingEnabled_block_invoke()
{
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier"), "isEqualToString:", 0x1EF4D53D0))uint64_t result = 1; {
  else
  }
    uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier"), "isEqualToString:", 0x1EF4D6410);
  AVCaptureSessionIsLaunchPrewarmingEnabled_launchPrewarmingEnabled = result;
  return result;
}

void sub_1A15886C8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __avcc_frontCameraPhysicalMirroringFollowsCameraAppPreference_block_invoke()
{
  uint64_t v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier");
  uint64_t result = [v0 isEqualToString:0x1EF4D53D0];
  if ((result & 1) == 0)
  {
    uint64_t result = [v0 isEqualToString:0x1EF4D6410];
    if ((result & 1) == 0)
    {
      return [v0 isEqualToString:0x1EF4D6430];
    }
  }
  return result;
}

void sub_1A158891C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void __AVMediaTypeForMetadataObjects_block_invoke()
{
  if (dyld_get_active_platform() == 1)
  {
    uint64_t v0 = (uint64_t *)MEMORY[0x1E4F47C50];
  }
  else
  {
    int v1 = dyld_program_sdk_at_least();
    uint64_t v0 = (uint64_t *)MEMORY[0x1E4F47C50];
    if (v1)
    {
      if (AVCaptureMetadataObjectsOnly_onceToken != -1)
      {
        dispatch_once(&AVCaptureMetadataObjectsOnly_onceToken, &__block_literal_global_11);
        uint64_t v0 = (uint64_t *)MEMORY[0x1E4F47C50];
      }
      if (!AVCaptureMetadataObjectsOnly_answer) {
        uint64_t v0 = (uint64_t *)MEMORY[0x1E4F47C58];
      }
    }
  }
  AVMediaTypeForMetadataObjects_sCorrectedAVMediaTypeMetadata = *v0;
}

void sub_1A158A3D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A158A4C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void avflashlightNotification(uint64_t a1, void *a2, void *a3, uint64_t a4, const void *a5)
{
  if ([a3 isEqualToString:*MEMORY[0x1E4F52750]])
  {
    [a2 _reconnectToServer];
  }
  else
  {
    if (a3) {
      CFRetain(a3);
    }
    if (a5) {
      CFRetain(a5);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    void block[2] = __avflashlightNotification_block_invoke;
    block[3] = &unk_1E5A72F70;
    block[4] = a2;
    block[5] = a3;
    block[6] = a5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void sub_1A158A7C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A158ADA0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A158AED0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A158B2B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A158BA8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A158BC04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void __avflashlightNotification_block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1A62348E0]();
  [*(id *)(a1 + 32) _handleNotification:*(void *)(a1 + 40) payload:*(void *)(a1 + 48)];
  uint64_t v3 = *(const void **)(a1 + 40);
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = *(const void **)(a1 + 48);
  if (v4) {
    CFRelease(v4);
  }
}

void sub_1A158C094(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double AVCaptureMainScreenPixelSize()
{
  if (AVCaptureMainScreenPixelSize_onceToken != -1) {
    dispatch_once(&AVCaptureMainScreenPixelSize_onceToken, &__block_literal_global_388);
  }
  return *(float *)&AVCaptureMainScreenPixelSize_width;
}

void sub_1A158CBB4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A158D704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1A158D9DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A158DC38(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t AVCapturePrewarmWithOptions(uint64_t a1, void *a2)
{
  v20[31] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if ([a2 objectForKeyedSubscript:@"AVCapturePrewarmUserInteractionAbsoluteTimeKey"])
  {
    uint64_t v4 = [a2 objectForKeyedSubscript:@"AVCapturePrewarmUserInteractionAbsoluteTimeKey"];
    [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F518A0]];
  }
  if ([a2 objectForKeyedSubscript:@"AVCapturePrewarmUserInteractionContinuousTimeKey"])
  {
    uint64_t v5 = [a2 objectForKeyedSubscript:@"AVCapturePrewarmUserInteractionContinuousTimeKey"];
    [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F51890]];
  }
  if ([a2 objectForKeyedSubscript:@"AVCapturePrewarmReasonKey"])
  {
    uint64_t v6 = (void *)[a2 objectForKeyedSubscript:@"AVCapturePrewarmReasonKey"];
    v20[0] = @"HomeScreen";
    v20[1] = @"Spotlight";
    v20[2] = @"AppSwitcher";
    v20[3] = @"NotificationCenter";
    v20[4] = @"ControlCenter";
    v20[5] = @"Banner";
    v20[6] = @"LockScreen";
    v20[7] = @"Siri";
    v20[8] = @"Stark";
    v20[9] = @"Continuity";
    v20[10] = @"SystemGesture";
    v20[11] = @"NonInteractiveSystemGesture";
    v20[12] = @"FBSystemService";
    v20[13] = @"Rotation";
    v20[14] = @"Breadcrumb";
    v20[15] = @"CommandTab";
    v20[16] = @"ExternalDisplay";
    v20[17] = @"Widget";
    v20[18] = @"HomeButton";
    v20[19] = @"Test";
    v20[20] = @"StatusBar";
    v20[21] = @"LockScreenPlugin";
    v20[22] = @"FloatingDock";
    v20[23] = @"FloatingDockSuggestions";
    v20[24] = @"DragAndDrop";
    v20[25] = @"StarkSiri";
    v20[26] = @"Startup";
    v20[27] = @"ActionButton";
    v20[28] = @"CameraCaptureButton";
    v20[29] = @"LockScreenButton";
    v20[30] = @"LockScreenSwipe";
    uint64_t v7 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:31];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          if ([v6 isEqualToString:*(void *)(*((void *)&v15 + 1) + 8 * v11)])
          {
            uint64_t v13 = (__CFString *)[a2 objectForKeyedSubscript:@"AVCapturePrewarmReasonKey"];
            uint64_t v12 = *MEMORY[0x1E4F51898];
            goto LABEL_16;
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    uint64_t v12 = *MEMORY[0x1E4F51898];
    uint64_t v13 = @"Invalid";
LABEL_16:
    [v3 setObject:v13 forKeyedSubscript:v12];
  }
  return FigCaptureSessionRemotePrewarmWithOptions();
}

void sub_1A158F3F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A158F5CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t vto_notificationHandler(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a2 _handleNotification:a3 payload:a5];
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t AVSmartStyleSettingsGetSystemStyle(uint64_t a1)
{
  id v1 = _AVSmartStyleSettingsStateForBundleID(a1);

  return [v1 systemStyle];
}

id _AVSmartStyleSettingsStateForBundleID(uint64_t a1)
{
  if (AVSmartStyleSettingsPrewarm_onceToken != -1) {
    dispatch_once(&AVSmartStyleSettingsPrewarm_onceToken, &__block_literal_global_88);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sSystemStyleSettingsLock);
  uint64_t v2 = [(id)sSmartStyleSettingsStatesByBundleID objectForKeyedSubscript:a1];
  if (v2)
  {
    id v3 = (id)v2;
    os_unfair_lock_unlock((os_unfair_lock_t)&sSystemStyleSettingsLock);
  }
  else
  {
    id v3 = +[AVSmartStyleSettingsState smartStyleSettingsStateForBundleID:a1];
    [(id)sSmartStyleSettingsStatesByBundleID setObject:v3 forKeyedSubscript:a1];
    os_unfair_lock_unlock((os_unfair_lock_t)&sSystemStyleSettingsLock);
    if (v3) {
      [v3 installProprietaryDefaultListeners];
    }
  }
  return v3;
}

uint64_t AVSmartStyleSettingsSetSystemStyle(uint64_t a1, uint64_t a2)
{
  id v3 = _AVSmartStyleSettingsStateForBundleID(a2);

  return [v3 setSystemStyle:a1];
}

AVCaptureSmartStyle *AVSmartStyleSettingsGetSystemStyleFast(void *a1)
{
  CFStringRef v1 = (const __CFString *)AVSmartStyleSettingsSystemStylePreferenceKey(a1);
  CFStringRef v2 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  uint64_t v4 = (void *)CFPreferencesCopyValue(v1, @"com.apple.cameracapture", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  if ((v4
     || (CFStringRef v5 = (const __CFString *)AVSmartStyleSettingsSystemStylePreferenceKey(AVSmartStyleSettingsSystemStyle),
         (uint64_t v4 = (void *)CFPreferencesCopyValue(v5, @"com.apple.cameracapture", v2, v3)) != 0))
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:AVSmartStyleSettingsCastTypeKey];
    objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", AVSmartStyleSettingsCastIntensityKey), "floatValue");
    int v8 = v7;
    objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", AVSmartStyleSettingsToneBiasKey), "floatValue");
    int v10 = v9;
    objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", AVSmartStyleSettingsColorBiasKey), "floatValue");
    LODWORD(v12) = v11;
    LODWORD(v13) = v8;
    LODWORD(v14) = v10;
    long long v15 = +[AVCaptureSmartStyle styleWithCast:v6 intensity:v13 toneBias:v14 colorBias:v12];
  }
  else
  {
    long long v15 = 0;
  }

  return v15;
}

uint64_t AVSmartStyleSettingsGetSystemStyleEnabledForBundleID(uint64_t a1)
{
  id v1 = _AVSmartStyleSettingsStateForBundleID(a1);

  return [v1 systemStyleEnabled];
}

uint64_t AVSmartStyleSettingsSetSystemStyleEnabledForBundleID(uint64_t a1, uint64_t a2)
{
  id v3 = _AVSmartStyleSettingsStateForBundleID(a2);

  return [v3 setSystemStyleEnabled:a1];
}

id AVSmartStyleSettingsGetSystemStyleEnabledStateForCameraApps()
{
  if (AVSmartStyleSettingsPrewarm_onceToken != -1) {
    dispatch_once(&AVSmartStyleSettingsPrewarm_onceToken, &__block_literal_global_88);
  }
  uint64_t v0 = AVSmartStyleSettingsSystemStyleEnabledPreferenceKey();

  return +[AVCaptureProprietaryDefaultsSingleton objectForKey:v0];
}

uint64_t AVSmartStyleSettingsGetSystemStyleSupportedForBundleID()
{
  return 1;
}

uint64_t __AVSmartStyleSettingsPrewarm_block_invoke()
{
  v5[2] = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)&sSystemStyleSettingsLock);
  sSmartStyleSettingsStatesByBundleID = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v0 = objc_alloc(MEMORY[0x1E4F1C978]);
  v5[0] = 0x1EF4D64B0;
  v5[1] = 0x1EF4D63F0;
  sAllowedFirstPartyAppsInSystemStyleEnabledList = objc_msgSend(v0, "initWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v5, 2));
  id v1 = objc_alloc(MEMORY[0x1E4F1C978]);
  uint64_t v4 = 0x1EF4D6450;
  sDisallowedFirstPartyAppsInSystemStyleEnabledList = objc_msgSend(v1, "initWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v4, 1));
  +[AVCaptureProprietaryDefaultsSingleton objectForKey:@"warmup"];
  id v2 = +[AVSmartStyleSettingsState smartStyleSettingsStateForBundleID:AVSmartStyleSettingsSystemStyle];
  [(id)sSmartStyleSettingsStatesByBundleID setObject:v2 forKeyedSubscript:AVSmartStyleSettingsSystemStyle];
  os_unfair_lock_unlock((os_unfair_lock_t)&sSystemStyleSettingsLock);
  return [v2 installProprietaryDefaultListeners];
}

uint64_t avcp_copyFirstAuxiliaryImageOfType()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  uint64_t Container = CMPhotoDecompressionSessionCreate();
  if (Container) {
    return Container;
  }
  uint64_t Container = CMPhotoDecompressionSessionCreateContainer();
  if (Container) {
    return Container;
  }
  else {
    return CMPhotoDecompressionContainerGetImageCount();
  }
}

uint64_t avcp_copyDNGFileDataRepresentationForSushiRawBuffer(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, unint64_t a6)
{
  if (a1)
  {
    if (a2 && a5)
    {
      unint64_t v7 = HIDWORD(a6);
      if ((int)a6 > SHIDWORD(a6)) {
        LODWORD(v7) = a6;
      }
      if (v7) {
        uint64_t v8 = [NSNumber numberWithUnsignedLong:(int)v7];
      }
      else {
        uint64_t v8 = 0;
      }
      objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", &unk_1EF4FA0B8, *MEMORY[0x1E4F560B8], v8, *MEMORY[0x1E4F56120], 0);
      CMPhotoCompressionCreateDataContainerFromImage();
    }
    if (a4)
    {
      [a4 depthDataMap];
      int v9 = (const void *)[a4 copyAuxiliaryMetadata];
      [a4 auxiliaryImageType];
    }
    else
    {
      int v9 = 0;
    }
    CMPhotoDNGCreateDNGFromRAWPixelBufferAndAuxiliaryImage();

    if (v9) {
      CFRelease(v9);
    }
  }
  return 0;
}

__CVBuffer *avcp_copyCGImageForUncompressedBuffer(__CVBuffer *result)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  CGImageRef v1 = 0;
  if (result)
  {
    uint64_t v2 = *MEMORY[0x1E4F447B8];
    v3[0] = MEMORY[0x1E4F1CC38];
    VTCreateCGImageFromCVPixelBuffer(result, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1], &v1);
    return v1;
  }
  return result;
}

CFMutableDataRef avcp_copyTIFFFileDataRepresentationForImage(CGImage *a1, const __CFDictionary *a2, uint64_t a3)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  CFMutableDataRef Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  if (!a1)
  {
    int v11 = 0;
LABEL_8:
    if (Mutable)
    {
      CFRelease(Mutable);
      CFMutableDataRef Mutable = 0;
    }
    goto LABEL_10;
  }
  if (a3) {
    uint64_t v7 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v7 = MEMORY[0x1E4F1CC28];
  }
  uint64_t v13 = *MEMORY[0x1E4F2F418];
  v14[0] = v7;
  BOOL v8 = 1;
  CFDictionaryRef v9 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  int v10 = CGImageDestinationCreateWithData(Mutable, (CFStringRef)*MEMORY[0x1E4F47C10], 1uLL, v9);
  int v11 = v10;
  if (v10)
  {
    CGImageDestinationAddImage(v10, a1, a2);
    BOOL v8 = !CGImageDestinationFinalize(v11);
  }
  if (v8) {
    goto LABEL_8;
  }
LABEL_10:
  if (v11) {
    CFRelease(v11);
  }
  return Mutable;
}

uint64_t _addAuxiliaryImage(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if ((a1 != 0) != (a2 == 0)) {
    goto LABEL_16;
  }
  if (!a1)
  {
    if (a7)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return FigSignalErrorAt();
    }
    uint64_t result = CMPhotoDNGCompressorAddAuxiliaryImage();
    if (!result) {
      return result;
    }
LABEL_16:
    fig_log_get_emitter();
    return FigDebugAssert3();
  }
  int v10 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  int v11 = v10;
  if (a7) {
    [v10 setObject:a7 forKeyedSubscript:*MEMORY[0x1E4F560A0]];
  }
  if (a4 == 4) {
    [v11 setObject:a5 forKeyedSubscript:*MEMORY[0x1E4F56098]];
  }
  uint64_t result = CMPhotoCompressionSessionAddAuxiliaryImage();
  if (result) {
    goto LABEL_16;
  }
  return result;
}

uint64_t esdds_handleStorageDeviceManagerCallback(void *a1, uint64_t a2, uint64_t a3)
{
  v88[16] = *MEMORY[0x1E4F143B8];
  MEMORY[0x1A6234330](*(void *)(a3 + 8));
  if (dword_1E9544D58)
  {
    unsigned int v72 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!objc_msgSend(*(id *)(a3 + 40), "count", v42, v43))
  {
    if ([*(id *)(a3 + 32) count])
    {
      id v27 = (id)[*(id *)(a3 + 32) copy];
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id v44 = v27;
      uint64_t v46 = [v27 countByEnumeratingWithState:&v67 objects:v77 count:16];
      if (v46)
      {
        uint64_t v45 = *(void *)v68;
        uint64_t v49 = *MEMORY[0x1E4F526C8];
        uint64_t v28 = *MEMORY[0x1E4F1CF80];
        do
        {
          for (uint64_t i = 0; i != v46; ++i)
          {
            if (*(void *)v68 != v45) {
              objc_enumerationMutation(v44);
            }
            uint64_t v30 = *(void **)(*((void *)&v67 + 1) + 8 * i);
            long long v63 = 0u;
            long long v64 = 0u;
            long long v65 = 0u;
            long long v66 = 0u;
            uint64_t v31 = [a1 countByEnumeratingWithState:&v63 objects:v76 count:16];
            if (!v31) {
              goto LABEL_62;
            }
            uint64_t v32 = v31;
            char v33 = 0;
            uint64_t v34 = *(void *)v64;
            do
            {
              for (uint64_t j = 0; j != v32; ++j)
              {
                if (*(void *)v64 != v34) {
                  objc_enumerationMutation(a1);
                }
                uint64_t v36 = *(void *)(*((void *)&v63 + 1) + 8 * j);
                [v30 baseURL];
                v88[0] = 0;
                uint64_t v37 = *(void *)(a3 + 24);
                uint64_t v38 = *(void *)(CMBaseObjectGetVTable() + 16);
                if (v38) {
                  uint64_t v39 = v38;
                }
                else {
                  uint64_t v39 = 0;
                }
                double v40 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void *))(v39 + 32);
                if (v40) {
                  v40(v37, v36, v49, v28, v88);
                }
                if (FigCFEqual())
                {
                  [v30 updateExternalStorageDeviceManager:*(void *)(a3 + 24) andFigExternalStorageDeviceUUID:v36];
                  [*(id *)(a3 + 40) addObject:v36];
                  char v33 = 1;
                }
              }
              uint64_t v32 = [a1 countByEnumeratingWithState:&v63 objects:v76 count:16];
            }
            while (v32);
            if ((v33 & 1) == 0)
            {
LABEL_62:
              [(id)a3 willChangeValueForKey:@"externalStorageDevices"];
              [*(id *)(a3 + 32) removeObject:v30];
              [(id)a3 didChangeValueForKey:@"externalStorageDevices"];
            }
          }
          uint64_t v46 = [v44 countByEnumeratingWithState:&v67 objects:v77 count:16];
        }
        while (v46);
      }
    }
  }
  if ([a1 count] || objc_msgSend(*(id *)(a3 + 40), "count"))
  {
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    uint64_t v5 = [a1 countByEnumeratingWithState:&v59 objects:v75 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v60;
      do
      {
        for (uint64_t k = 0; k != v6; ++k)
        {
          if (*(void *)v60 != v7) {
            objc_enumerationMutation(a1);
          }
          uint64_t v9 = *(void *)(*((void *)&v59 + 1) + 8 * k);
          if (([*(id *)(a3 + 40) containsObject:v9] & 1) == 0)
          {
            int v10 = [[AVExternalStorageDevice alloc] initWithExternalStorageDeviceManager:*(void *)(a3 + 24) figExternalStorageDeviceUUID:v9];
            [(AVExternalStorageDevice *)v10 baseURL];
            [(id)a3 willChangeValueForKey:@"externalStorageDevices"];
            [*(id *)(a3 + 32) addObject:v10];
            [(id)a3 didChangeValueForKey:@"externalStorageDevices"];
            [*(id *)(a3 + 40) addObject:v9];
          }
        }
        uint64_t v6 = [a1 countByEnumeratingWithState:&v59 objects:v75 count:16];
      }
      while (v6);
    }
    id v11 = (id)[*(id *)(a3 + 40) copy];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v47 = v11;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v55 objects:v74 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v48 = *(void *)v56;
      do
      {
        for (uint64_t m = 0; m != v13; ++m)
        {
          if (*(void *)v56 != v48) {
            objc_enumerationMutation(v47);
          }
          uint64_t v15 = *(void *)(*((void *)&v55 + 1) + 8 * m);
          if (([a1 containsObject:v15] & 1) == 0)
          {
            if ([*(id *)(a3 + 40) containsObject:v15]) {
              [*(id *)(a3 + 40) removeObject:v15];
            }
            id v16 = (id)[*(id *)(a3 + 32) copy];
            long long v51 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            long long v54 = 0u;
            uint64_t v17 = [v16 countByEnumeratingWithState:&v51 objects:v73 count:16];
            if (v17)
            {
              uint64_t v18 = v17;
              uint64_t v19 = *(void *)v52;
              do
              {
                for (uint64_t n = 0; n != v18; ++n)
                {
                  if (*(void *)v52 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  char v21 = *(void **)(*((void *)&v51 + 1) + 8 * n);
                  if (objc_msgSend((id)objc_msgSend(v21, "figExternalStorageDeviceUUID"), "isEqual:", v15)&& objc_msgSend(*(id *)(a3 + 32), "containsObject:", v21))
                  {
                    [(id)a3 willChangeValueForKey:@"externalStorageDevices"];
                    [*(id *)(a3 + 32) removeObject:v21];
                    [(id)a3 didChangeValueForKey:@"externalStorageDevices"];
                  }
                }
                uint64_t v18 = [v16 countByEnumeratingWithState:&v51 objects:v73 count:16];
              }
              while (v18);
            }
          }
        }
        uint64_t v13 = [v47 countByEnumeratingWithState:&v55 objects:v74 count:16];
      }
      while (v13);
    }
  }
  if (dword_1E9544D58)
  {
    unsigned int v72 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    long long v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v23 = v72;
    if (os_log_type_enabled(v22, type)) {
      unsigned int v24 = v23;
    }
    else {
      unsigned int v24 = v23 & 0xFFFFFFFE;
    }
    if (v24)
    {
      uint64_t v25 = *(void *)(a3 + 32);
      uint64_t v26 = *(void *)(a3 + 40);
      int v78 = 136316162;
      long long v79 = "esdds_handleStorageDeviceManagerCallback";
      __int16 v80 = 2112;
      uint64_t v81 = a3;
      __int16 v82 = 2112;
      uint64_t v83 = v25;
      __int16 v84 = 2112;
      uint64_t v85 = v26;
      __int16 v86 = 2112;
      long long v87 = a1;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return MEMORY[0x1A6234340](*(void *)(a3 + 8));
}

uint64_t avExternalStorageDeviceNotification(uint64_t a1, void *a2, void *a3)
{
  uint64_t result = [a3 isEqualToString:*MEMORY[0x1E4F526C0]];
  if (result)
  {
    return [a2 _reconnectToServer];
  }
  return result;
}

uint64_t getUISSystemReferenceAngleChangedNotification()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getUISSystemReferenceAngleChangedNotificationSymbolLoc_ptr;
  uint64_t v6 = getUISSystemReferenceAngleChangedNotificationSymbolLoc_ptr;
  if (!getUISSystemReferenceAngleChangedNotificationSymbolLoc_ptr)
  {
    CGImageRef v1 = (void *)UIKitServicesLibrary();
    v4[3] = (uint64_t)dlsym(v1, "UISSystemReferenceAngleChangedNotification");
    getUISSystemReferenceAngleChangedNotificationSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0) {
    getUISSystemReferenceAngleChangedNotification_cold_1();
  }
  return *(void *)v0;
}

void sub_1A15989BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t getFBSOrientationObserverClass()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x3052000000;
  uint64_t v6 = __Block_byref_object_copy__0;
  uint64_t v7 = __Block_byref_object_dispose__0;
  uint64_t v0 = getFBSOrientationObserverClass_softClass;
  uint64_t v8 = getFBSOrientationObserverClass_softClass;
  if (!getFBSOrientationObserverClass_softClass)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __getFBSOrientationObserverClass_block_invoke;
    v2[3] = &unk_1E5A72EF8;
    v2[4] = &v3;
    __getFBSOrientationObserverClass_block_invoke((uint64_t)v2);
    uint64_t v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A1598BC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A15991BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1599614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getUISSystemReferenceAngleChangedNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)UIKitServicesLibrary();
  uint64_t result = dlsym(v2, "UISSystemReferenceAngleChangedNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUISSystemReferenceAngleChangedNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t UIKitServicesLibrary()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!UIKitServicesLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __UIKitServicesLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    void v2[5] = v2;
    long long v3 = xmmword_1E5A72F18;
    uint64_t v4 = 0;
    UIKitServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = UIKitServicesLibraryCore_frameworkLibrary;
  if (!UIKitServicesLibraryCore_frameworkLibrary) {
    UIKitServicesLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __UIKitServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  UIKitServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

Class __getFBSOrientationObserverClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!FrontBoardServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    void v3[2] = (void *)3221225472;
    v3[3] = __FrontBoardServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E5A72F50;
    uint64_t v5 = 0;
    FrontBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!FrontBoardServicesLibraryCore_frameworkLibrary) {
    __getFBSOrientationObserverClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("FBSOrientationObserver");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    __getFBSOrientationObserverClass_block_invoke_cold_2();
  }
  getFBSOrientationObserverClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

uint64_t __FrontBoardServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  FrontBoardServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getUISSystemReferenceAngleModeForContextIDSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)UIKitServicesLibrary();
  uint64_t result = dlsym(v2, "UISSystemReferenceAngleModeForContextID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUISSystemReferenceAngleModeForContextIDSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getUISSystemReferenceAngleForContextIDSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)UIKitServicesLibrary();
  uint64_t result = dlsym(v2, "UISSystemReferenceAngleForContextID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUISSystemReferenceAngleForContextIDSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getUISSystemReferenceAngleAffectedContextIDsKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)UIKitServicesLibrary();
  uint64_t result = dlsym(v2, "UISSystemReferenceAngleAffectedContextIDsKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUISSystemReferenceAngleAffectedContextIDsKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  return result;
}

void sub_1A159C748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62)
{
}

void AVAUVoiceIOInitializeListenersForBundleID(uint64_t a1)
{
  v16[16] = *MEMORY[0x1E4F143B8];
  if (vpio_initializeDefaultsOnce_onceToken != -1) {
    dispatch_once(&vpio_initializeDefaultsOnce_onceToken, &__block_literal_global_2);
  }
  context = (void *)MEMORY[0x1A62348E0]();
  uint64_t v12 = (__CFString *)vpio_translatedBundleIDForBundleID(a1);
  if (dword_1E9544D98)
  {
    int v15 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sKeysBeingObservedLock);
  v16[0] = AVControlCenterAudioPreferredMicrophoneModePreferenceKeyForTranslatedBundleID(v12);
  uint64_t IsAutoMicrophoneModeEnabledPreferenceKeyForTranslatedBundleID = AVControlCenterAudioIsAutoMicrophoneModeEnabledPreferenceKeyForTranslatedBundleID(v12);
  uint64_t v4 = 0;
  v16[1] = IsAutoMicrophoneModeEnabledPreferenceKeyForTranslatedBundleID;
  char v5 = 1;
  do
  {
    char v6 = v5;
    uint64_t v7 = v16[v4];
    if ((objc_msgSend((id)sKeysBeingObserved, "containsObject:", v7, v9, v10) & 1) == 0)
    {
      uint64_t v9 = v7;
      uint64_t v8 = [NSString stringWithFormat:@"AVAUVoiceIOChatFlavorObservingKey-%@"];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __AVAUVoiceIOInitializeListenersForBundleID_block_invoke;
      v13[3] = &unk_1E5A72DB8;
      v13[4] = v12;
      +[AVCaptureProprietaryDefaultsSingleton addObserver:v8 forKey:v7 callHandlerForInitialValue:1 defaultChangedHandler:v13];
      [(id)sKeysBeingObserved addObject:v7];
    }
    char v5 = 0;
    uint64_t v4 = 1;
  }
  while ((v6 & 1) != 0);
  os_unfair_lock_unlock((os_unfair_lock_t)&sKeysBeingObservedLock);
}

uint64_t vpio_translatedBundleIDForBundleID(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)&sBundleIDTranslationMapLock);
  id v2 = (id)sBundleIDTranslationMap;
  if (!sBundleIDTranslationMap)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sBundleIDTranslationMap = (uint64_t)v2;
  }
  uint64_t v3 = [v2 objectForKeyedSubscript:a1];
  if (!v3)
  {
    [(id)sBundleIDTranslationMap setObject:a1 forKeyedSubscript:a1];
    uint64_t v3 = a1;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sBundleIDTranslationMapLock);
  return v3;
}

uint64_t __AVAUVoiceIOInitializeListenersForBundleID_block_invoke(uint64_t a1, void *a2)
{
  v24[16] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(__CFString **)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)&sBundleIDTranslationMapLock);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __vpio_bundleIDsForTranslatedBundleID_block_invoke;
  v24[3] = &unk_1E5A73068;
  v24[4] = v3;
  uint64_t v4 = (void *)[(id)sBundleIDTranslationMap keysOfEntriesPassingTest:v24];
  os_unfair_lock_unlock((os_unfair_lock_t)&sBundleIDTranslationMapLock);
  if (dword_1E9544D98)
  {
    LODWORD(v19) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if ([a2 isEqualToString:AVControlCenterAudioPreferredMicrophoneModePreferenceKeyForTranslatedBundleID(v3)])
  {
    char v6 = 0;
    uint64_t v7 = @"AVAUVoiceIOPreferredChatFlavorDidChangeNotification";
  }
  else
  {
    int v8 = [a2 isEqualToString:AVControlCenterAudioIsAutoMicrophoneModeEnabledPreferenceKeyForTranslatedBundleID(v3)];
    char v6 = v8 ^ 1;
    if (v8) {
      uint64_t v7 = @"AVAUVoiceIOAutoChatFlavorEnabledDidChangeNotification";
    }
    else {
      uint64_t v7 = 0;
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = objc_msgSend(v4, "allObjects", v16, v17);
  uint64_t result = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (result)
  {
    uint64_t v11 = result;
    uint64_t v12 = *(void *)v21;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        if ((v6 & 1) == 0)
        {
          uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * v13);
          *(void *)os_log_type_t type = @"AVAUVoiceIONotificationBundleIdentifierKey";
          uint64_t v19 = v14;
          uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:type count:1];
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", v7, 0, v15);
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t result = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      uint64_t v11 = result;
    }
    while (result);
  }
  return result;
}

id AVAUVoiceIOGetSupportedChatFlavorsForBundleID(uint64_t a1)
{
  if (vpio_initializeDefaultsOnce_onceToken != -1) {
    dispatch_once(&vpio_initializeDefaultsOnce_onceToken, &__block_literal_global_2);
  }
  id v2 = (void *)MEMORY[0x1A62348E0]();
  uint64_t v3 = (__CFString *)vpio_translatedBundleIDForBundleID(a1);
  uint64_t v4 = objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", AVControlCenterAudioSupportedMicrophoneModesPreferenceKeyForTranslatedBundleID(v3)), "copy");
  if (!v4)
  {
    uint64_t v4 = (void *)[AVControlCenterAudioDefaultSupportedMicrophoneModesForBundleID(v3) copy];
    if (!dword_1E9544D98) {
      goto LABEL_8;
    }
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (dword_1E9544D98)
  {
    char v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_8:
  return v4;
}

void AVAUVoiceIOSetSupportedChatFlavorsForBundleID(uint64_t a1, uint64_t a2)
{
  if (vpio_initializeDefaultsOnce_onceToken != -1) {
    dispatch_once(&vpio_initializeDefaultsOnce_onceToken, &__block_literal_global_2);
  }
  uint64_t v4 = (void *)MEMORY[0x1A62348E0]();
  char v5 = (__CFString *)vpio_translatedBundleIDForBundleID(a1);
  if (dword_1E9544D98)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  +[AVCaptureProprietaryDefaultsSingleton setObject:a2 forKey:AVControlCenterAudioSupportedMicrophoneModesPreferenceKeyForTranslatedBundleID(v5)];
}

uint64_t AVAUVoiceIOGetPreferredChatFlavorForBundleID(uint64_t a1)
{
  if (vpio_initializeDefaultsOnce_onceToken != -1) {
    dispatch_once(&vpio_initializeDefaultsOnce_onceToken, &__block_literal_global_2);
  }
  id v2 = (void *)MEMORY[0x1A62348E0]();
  uint64_t v3 = (__CFString *)vpio_translatedBundleIDForBundleID(a1);
  uint64_t v4 = objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", AVControlCenterAudioPreferredMicrophoneModePreferenceKeyForTranslatedBundleID(v3)), "intValue");
  if (dword_1E9544D98)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v4;
}

void AVAUVoiceIOSetActiveChatFlavorForBundleID(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (vpio_initializeDefaultsOnce_onceToken != -1) {
    dispatch_once(&vpio_initializeDefaultsOnce_onceToken, &__block_literal_global_2);
  }
  uint64_t v4 = (void *)MEMORY[0x1A62348E0]();
  char v5 = (__CFString *)vpio_translatedBundleIDForBundleID(a1);
  if (dword_1E9544D98)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", a2, v7, v8), AVControlCenterAudioActiveMicrophoneModePreferenceKeyForTranslatedBundleID(v5));
}

void AVAUVoiceIORemoveActiveChatFlavorForBundleID(uint64_t a1)
{
  if (vpio_initializeDefaultsOnce_onceToken != -1) {
    dispatch_once(&vpio_initializeDefaultsOnce_onceToken, &__block_literal_global_2);
  }
  id v2 = (void *)MEMORY[0x1A62348E0]();
  uint64_t v3 = (__CFString *)vpio_translatedBundleIDForBundleID(a1);
  if (dword_1E9544D98)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  +[AVCaptureProprietaryDefaultsSingleton setObject:0 forKey:AVControlCenterAudioActiveMicrophoneModePreferenceKeyForTranslatedBundleID(v3)];
}

void AVAUVoiceIOSetHiddenChatFlavorsForBundleID(uint64_t a1, uint64_t a2)
{
  if (vpio_initializeDefaultsOnce_onceToken != -1) {
    dispatch_once(&vpio_initializeDefaultsOnce_onceToken, &__block_literal_global_2);
  }
  uint64_t v4 = (void *)MEMORY[0x1A62348E0]();
  char v5 = (__CFString *)vpio_translatedBundleIDForBundleID(a1);
  if (dword_1E9544D98)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  +[AVCaptureProprietaryDefaultsSingleton setObject:a2 forKey:AVControlCenterAudioHiddenMicrophoneModesPreferenceKeyForTranslatedBundleID(v5)];
}

void AVAUVoiceIOSetVoiceProcessingBypassedForBundleID(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (vpio_initializeDefaultsOnce_onceToken != -1) {
    dispatch_once(&vpio_initializeDefaultsOnce_onceToken, &__block_literal_global_2);
  }
  uint64_t v4 = (void *)MEMORY[0x1A62348E0]();
  char v5 = (__CFString *)vpio_translatedBundleIDForBundleID(a1);
  if (dword_1E9544D98)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", a2, v7, v8), AVControlCenterAudioVoiceProcessingBypassedPreferenceKeyForTranslatedBundleID(v5));
}

uint64_t AVAUVoiceIOIsAutoChatFlavorEnabledForBundleID(uint64_t a1)
{
  if (vpio_initializeDefaultsOnce_onceToken != -1) {
    dispatch_once(&vpio_initializeDefaultsOnce_onceToken, &__block_literal_global_2);
  }
  id v2 = (void *)MEMORY[0x1A62348E0]();
  uint64_t v3 = (__CFString *)vpio_translatedBundleIDForBundleID(a1);
  id v4 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:AVControlCenterAudioIsAutoMicrophoneModeEnabledPreferenceKeyForTranslatedBundleID(v3)];
  if (v4)
  {
    uint64_t IsAutoMicrophoneEnabledForBundleIDAndMicMode = [v4 BOOLValue];
    goto LABEL_10;
  }
  id v6 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:AVControlCenterAudioPreferredMicrophoneModePreferenceKeyForTranslatedBundleID(v3)];
  if (v6) {
    uint64_t v7 = [v6 integerValue];
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t IsAutoMicrophoneEnabledForBundleIDAndMicMode = AVControlCenterAudioDefaultIsAutoMicrophoneEnabledForBundleIDAndMicMode((uint64_t)v3, v7);
  if (dword_1E9544D98)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_10:
    if (dword_1E9544D98)
    {
      uint64_t v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return IsAutoMicrophoneEnabledForBundleIDAndMicMode;
}

void __vpio_initializeDefaultsOnce_block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1A62348E0]();
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work_cf();
  fig_note_initialize_category_with_default_work_cf();
  sKeysBeingObserved = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA48]);
}

uint64_t __vpio_bundleIDsForTranslatedBundleID_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 isEqualToString:*(void *)(a1 + 32)];
}

CGImageMetadataTag *AVAuxiliaryMetadataArrayTagWithPrefixedKey(const CGImageMetadata *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = (__CFString *)[[NSString alloc] initWithFormat:@"%@:%@", a2, a3];
  char v5 = CGImageMetadataCopyTagWithPath(a1, 0, v4);
  id v6 = v5;
  if (!v5) {
    goto LABEL_21;
  }
  if (CGImageMetadataTagGetType(v5) != kCGImageMetadataTypeArrayOrdered)
  {
    CFRelease(v6);
    goto LABEL_20;
  }
  uint64_t v7 = (void *)CGImageMetadataTagCopyValue(v6);
  CFRelease(v6);
  if (!v7)
  {
LABEL_20:
    id v6 = 0;
    goto LABEL_21;
  }
  id v6 = (CGImageMetadataTag *)objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(CGImageMetadataTag **)(*((void *)&v16 + 1) + 8 * v11);
        if (v12)
        {
          CFTypeID v13 = CFGetTypeID(*(CFTypeRef *)(*((void *)&v16 + 1) + 8 * v11));
          if (v13 == CGImageMetadataTagGetTypeID() && CGImageMetadataTagGetType(v12) == kCGImageMetadataTypeString)
          {
            uint64_t v14 = (void *)CGImageMetadataTagCopyValue(v12);
            [(CGImageMetadataTag *)v6 addObject:v14];
          }
          else if (v13 == CFNumberGetTypeID() || v13 == CFBooleanGetTypeID())
          {
            [(CGImageMetadataTag *)v6 addObject:v12];
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
  CFRelease(v7);
LABEL_21:

  return v6;
}

id AVAuxiliaryMetadataStringTagWithPrefixedKey(const CGImageMetadata *a1, uint64_t a2, uint64_t a3)
{
  id v4 = (__CFString *)[[NSString alloc] initWithFormat:@"%@:%@", a2, a3];
  char v5 = CGImageMetadataCopyTagWithPath(a1, 0, v4);
  if (v5)
  {
    id v6 = v5;
    if (CGImageMetadataTagGetType(v5) == kCGImageMetadataTypeString) {
      uint64_t v7 = (void *)CGImageMetadataTagCopyValue(v6);
    }
    else {
      uint64_t v7 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

BOOL AVAuxiliaryMetadataAddValue(CGImageMetadata *a1, CFStringRef xmlns, CFStringRef prefix, CFStringRef name, const void *a5)
{
  CGImageMetadataTagRef v8 = CGImageMetadataTagCreate(xmlns, prefix, name, kCGImageMetadataTypeDefault, a5);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = (__CFString *)[[NSString alloc] initWithFormat:@"%@:%@", prefix, name];
    BOOL v11 = CGImageMetadataSetTagWithPath(a1, 0, v10, v9);
    if (!v11)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    CFRelease(v9);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v10 = 0;
    BOOL v11 = 0;
  }

  return v11;
}

void avcdds_addValidMultiCamCombinations(void *a1, uint64_t a2, unint64_t a3, void *a4, void *a5, uint64_t a6)
{
  if (a2)
  {
    for (unint64_t i = a3; i <= [a1 count] - a2; avcdds_addValidMultiCamCombinations(a1, a2 - 1, i, a4, a5, a6))
      objc_msgSend(a4, "setObject:atIndexedSubscript:", objc_msgSend(a1, "objectAtIndexedSubscript:", i++), objc_msgSend(a4, "count") - a2);
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2020000000;
    uint64_t v16 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __avcdds_addValidMultiCamCombinations_block_invoke;
    v12[3] = &unk_1E5A73100;
    v12[4] = a4;
    v12[5] = &v13;
    if (!objc_msgSend((id)objc_msgSend(a4, "indexesOfObjectsPassingTest:", v12), "count") && v14[3] <= a6) {
      objc_msgSend(a5, "addObject:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", a4));
    }
    _Block_object_dispose(&v13, 8);
  }
}

void sub_1A15A09E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL __avcdds_addValidMultiCamCombinations_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  unint64_t v7 = a3 + 1;
  while (1)
  {
    unint64_t v8 = v7;
    unint64_t v9 = [*(id *)(a1 + 32) count];
    if (v8 >= v9) {
      break;
    }
    char v10 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v8), "supportsMultiCamCaptureWithDevice:", a2);
    unint64_t v7 = v8 + 1;
    if ((v10 & 1) == 0)
    {
      *a4 = 1;
      return v8 < v9;
    }
  }
  if ([a2 hasMediaType:*MEMORY[0x1E4F47C68]])
  {
    unint64_t v11 = objc_msgSend((id)objc_msgSend(a2, "constituentDevices"), "count");
    if (v11 <= 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = v11;
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v12;
  }
  return v8 < v9;
}

void sub_1A15A0FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

Class __getADJasperPointCloudClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!AppleDepthLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    void v3[2] = (void *)3221225472;
    v3[3] = __AppleDepthLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E5A73120;
    uint64_t v5 = 0;
    AppleDepthLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AppleDepthLibraryCore_frameworkLibrary) {
    __getADJasperPointCloudClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("ADJasperPointCloud");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    __getADJasperPointCloudClass_block_invoke_cold_2();
  }
  getADJasperPointCloudClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

uint64_t __AppleDepthLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppleDepthLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t xy_to_XYZ(uint64_t a1, double a2, double a3)
{
  if (a3 < 1.0e-20) {
    return 0;
  }
  *(double *)a1 = a2 / a3;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x7F0], 8) = 0x3FF0000000000000;
  *(double *)(a1 + 16) = (1.0 - a2) / a3 + -1.0;
  return 1;
}

uint64_t XYZ_to_xy(double *a1, double *a2, double *a3)
{
  double v3 = a1[1];
  if (*a1 >= 1.0e-20 || v3 >= 1.0e-20 || a1[2] >= 1.0e-20)
  {
    *a2 = *a1 / (*a1 + v3 + a1[2]);
    *a3 = a1[1] / (a1[1] + *a1 + a1[2]);
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *a3 = NAN;
    *a2 = NAN;
  }
  return result;
}

double VectorMatrix(double *a1, double *a2, double *a3)
{
  double v3 = *a1;
  double v4 = a1[1];
  double v5 = a1[2];
  *a3 = v4 * a2[1] + *a1 * *a2 + v5 * a2[2];
  a3[1] = v4 * a2[4] + v3 * a2[3] + v5 * a2[5];
  double result = v4 * a2[7] + v3 * a2[6] + v5 * a2[8];
  a3[2] = result;
  return result;
}

double InvertMatrix(double *a1, double *a2)
{
  double result = *a1;
  double v3 = a1[1];
  double v5 = a1[2];
  double v4 = a1[3];
  double v6 = a1[4];
  double v7 = a1[5];
  double v8 = a1[6];
  double v9 = a1[7];
  double v10 = a1[8];
  double v11 = -(*a1 * v7);
  double v12 = v5 * -(v8 * v6) + *a1 * v6 * v10 + v5 * v4 * v9 + -(v4 * v3) * v10 + v3 * v7 * v8 + v11 * v9;
  if (v12 != 0.0)
  {
    *a2 = (v6 * v10 - v9 * v7) / v12;
    a2[1] = (v9 * v5 - v3 * v10) / v12;
    a2[2] = (v3 * v7 - v6 * v5) / v12;
    a2[3] = (v10 * -v4 + v8 * v7) / v12;
    a2[4] = (v5 * -v8 + result * v10) / v12;
    a2[5] = (v11 + v4 * v5) / v12;
    a2[6] = (v4 * v9 - v8 * v6) / v12;
    a2[7] = (v9 * -result + v8 * v3) / v12;
    double result = (result * v6 - v4 * v3) / v12;
    a2[8] = result;
  }
  return result;
}

double xy_to_tempTint(double *a1, double *a2, double a3, double a4)
{
  double v4 = 1.5 - a3 + a4 * 6.0;
  double v5 = (a3 + a3) / v4;
  double v6 = a4 * 3.0 / v4;
  double v7 = 0.0;
  uint64_t v8 = 0x100000000;
  uint64_t v9 = 0x38u;
  double v10 = 0.0;
  double v11 = 0.0;
  do
  {
    double v12 = v11;
    double v13 = v10;
    double v14 = v7;
    double v15 = *(double *)((char *)&kTempTable + v9);
    double v16 = sqrt(v15 * v15 + 1.0);
    double v7 = 1.0 / v16;
    double v10 = v15 / v16;
    double v18 = *(double *)((char *)&kTempTable + v9 - 16);
    double v17 = *(double *)((char *)&kTempTable + v9 - 8);
    double v11 = (v6 - v17) * v7 - (v5 - v18) * v10;
    v8 -= 0x100000000;
    uint64_t v19 = v9 + 32;
    if (v9 == 984) {
      break;
    }
    v9 += 32;
  }
  while (v11 > 0.0);
  if (v8)
  {
    double v20 = 0.0;
    if (v11 <= 0.0) {
      double v20 = (v6 - v17) * v7 - (v5 - v18) * v10;
    }
    double v21 = -v20 / (v12 - v20);
  }
  else
  {
    double v21 = 0.0;
  }
  long long v22 = (double *)((char *)&kTempTable + (-v8 >> 27));
  *a1 = 1000000.0 / ((1.0 - v21) * *(double *)((char *)&kTempTable + v19 - 56) + *v22 * v21);
  double v23 = v14 * v21 + v7 * (1.0 - v21);
  double v24 = v13 * v21 + v10 * (1.0 - v21);
  double v25 = sqrt(v24 * v24 + v23 * v23);
  double result = (v24 / v25 * (v6 - (v17 * (1.0 - v21) + v22[2] * v21))
          + (v5 - (v18 * (1.0 - v21) + v22[1] * v21)) * (v23 / v25))
         * -3000.0;
  *a2 = result;
  return result;
}

double tempTint_to_xy(double *a1, double *a2, double a3, double a4)
{
  uint64_t v4 = 0x20u;
  double v5 = 1000000.0 / a3;
  do
  {
    double v6 = *(double *)((char *)&kTempTable + v4);
    uint64_t v7 = v4 + 32;
    if (v4 == 960) {
      break;
    }
    v4 += 32;
  }
  while (v5 >= v6);
  double v8 = a4 * -0.000333333333;
  uint64_t v9 = (double *)((char *)&kTempTable + v7);
  double v10 = (v6 - v5) / (v6 - *(double *)((char *)&kTempTable + v7 - 64));
  double v11 = *(v9 - 3) * (1.0 - v10) + *(v9 - 7) * v10;
  double v12 = *(double *)((char *)&kTempTable + v7 - 40);
  double v13 = (1.0 - v10) * *(v9 - 2) + *(v9 - 6) * v10;
  double v14 = *(double *)((char *)&kTempTable + v7 - 8);
  double v15 = sqrt(v12 * v12 + 1.0);
  double v16 = sqrt(v14 * v14 + 1.0);
  double v17 = (1.0 - v10) * (1.0 / v16) + 1.0 / v15 * v10;
  double v18 = (1.0 - v10) * (v14 / v16) + v12 / v15 * v10;
  double v19 = sqrt(v18 * v18 + v17 * v17);
  double v20 = v11 + v17 / v19 * v8;
  double v21 = v13 + v18 / v19 * v8;
  double v22 = v20 * 1.5;
  double v23 = v20 + v21 * -4.0 + 2.0;
  *a1 = v22 / v23;
  double result = v21 / v23;
  *a2 = result;
  return result;
}

void sub_1A15A42E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A15A44C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A15A660C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t AVCaptureStillImageOutputPlayShutterSound(void *a1, unsigned int a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v3 = objc_msgSend((id)objc_msgSend(a1, "session"), "outputs");
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(v3);
      }
      double v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v8 isRecording])
        {
          uint64_t result = [v8 isRecordingPaused];
          if (!result) {
            break;
          }
        }
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v16 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    if (a2 > 0x1000)
    {
      uint64_t v14 = *MEMORY[0x1E4F18A18];
      double v15 = &unk_1EF4FA190;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    }
    return AudioServicesPlaySystemSoundWithOptions();
  }
  return result;
}

__CFString *ps_shortStringForFileType(void *a1)
{
  if ([a1 isEqual:*MEMORY[0x1E4F47BF8]]) {
    return @"JFIF";
  }
  if ([a1 isEqual:*MEMORY[0x1E4F47BE0]]) {
    return @"DNG";
  }
  if ([a1 isEqual:*MEMORY[0x1E4F47C10]]) {
    return @"TIFF";
  }
  if ([a1 isEqual:*MEMORY[0x1E4F47BF0]]) {
    return @"HEIF";
  }
  if ([a1 isEqual:*MEMORY[0x1E4F47BE8]]) {
    return @"HEIC";
  }
  return @"Unknown";
}

double AVCaptureGetCurrentProcessAuditToken@<D0>(_OWORD *a1@<X8>)
{
  if (AVCaptureGetCurrentProcessAuditToken_sOnceToken != -1) {
    dispatch_once(&AVCaptureGetCurrentProcessAuditToken_sOnceToken, &__block_literal_global_28);
  }
  double result = *(double *)&AVCaptureGetCurrentProcessAuditToken_currentProcessAuditToken;
  long long v3 = *(_OWORD *)algn_1E9544B10;
  *a1 = AVCaptureGetCurrentProcessAuditToken_currentProcessAuditToken;
  a1[1] = v3;
  return result;
}

uint64_t __AVCaptureGetCurrentProcessAuditToken_block_invoke()
{
  mach_msg_type_number_t task_info_outCnt = 8;
  return task_info(*MEMORY[0x1E4F14960], 0xFu, (task_info_t)&AVCaptureGetCurrentProcessAuditToken_currentProcessAuditToken, &task_info_outCnt);
}

uint64_t AVCaptureClientIsRapport()
{
  if (AVCaptureClientIsRapport_sOnceToken != -1) {
    dispatch_once(&AVCaptureClientIsRapport_sOnceToken, &__block_literal_global_68);
  }
  return AVCaptureClientIsRapport_sAnswer;
}

void __AVCaptureClientIsRapport_block_invoke()
{
  uint64_t v0 = (__CFString *)AVCaptureCopyClientCodeSigningIdentifier();
  AVCaptureClientIsRapport_sAnswer = [(__CFString *)v0 isEqualToString:0x1EF4D5D30];
}

uint64_t AVControlCenterAudioSupportedMicrophoneModesPreferenceKey(void *a1)
{
  CGImageRef v1 = (__CFString *)AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  return [NSString stringWithFormat:@"%@AUVoiceIOSupportedChatFlavors", AVControlCenterAudioPreferencesKeyPrefix(v1)];
}

uint64_t AVControlCenterAudioSupportedMicrophoneModesPreferenceKeyForTranslatedBundleID(__CFString *a1)
{
  return [NSString stringWithFormat:@"%@AUVoiceIOSupportedChatFlavors", AVControlCenterAudioPreferencesKeyPrefix(a1)];
}

uint64_t AVControlCenterAudioHiddenMicrophoneModesPreferenceKey(void *a1)
{
  CGImageRef v1 = (__CFString *)AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  return [NSString stringWithFormat:@"%@AUVoiceIOHiddenChatFlavors", AVControlCenterAudioPreferencesKeyPrefix(v1)];
}

uint64_t AVControlCenterAudioHiddenMicrophoneModesPreferenceKeyForTranslatedBundleID(__CFString *a1)
{
  return [NSString stringWithFormat:@"%@AUVoiceIOHiddenChatFlavors", AVControlCenterAudioPreferencesKeyPrefix(a1)];
}

uint64_t AVControlCenterAudioPreferredMicrophoneModePreferenceKey(void *a1)
{
  CGImageRef v1 = (__CFString *)AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  return [NSString stringWithFormat:@"%@AUVoiceIOChatFlavor", AVControlCenterAudioPreferencesKeyPrefix(v1)];
}

uint64_t AVControlCenterAudioPreferredMicrophoneModePreferenceKeyForTranslatedBundleID(__CFString *a1)
{
  return [NSString stringWithFormat:@"%@AUVoiceIOChatFlavor", AVControlCenterAudioPreferencesKeyPrefix(a1)];
}

uint64_t AVControlCenterAudioActiveMicrophoneModePreferenceKey(void *a1)
{
  CGImageRef v1 = (__CFString *)AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  return [NSString stringWithFormat:@"%@AUVoiceIOActiveChatFlavor", AVControlCenterAudioPreferencesKeyPrefix(v1)];
}

uint64_t AVControlCenterAudioActiveMicrophoneModePreferenceKeyForTranslatedBundleID(__CFString *a1)
{
  return [NSString stringWithFormat:@"%@AUVoiceIOActiveChatFlavor", AVControlCenterAudioPreferencesKeyPrefix(a1)];
}

uint64_t AVControlCenterAudioVoiceProcessingBypassedPreferenceKey(void *a1)
{
  CGImageRef v1 = (__CFString *)AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  return [NSString stringWithFormat:@"%@AUVoiceIOBypassVoiceProcessing", AVControlCenterAudioPreferencesKeyPrefix(v1)];
}

uint64_t AVControlCenterAudioVoiceProcessingBypassedPreferenceKeyForTranslatedBundleID(__CFString *a1)
{
  return [NSString stringWithFormat:@"%@AUVoiceIOBypassVoiceProcessing", AVControlCenterAudioPreferencesKeyPrefix(a1)];
}

uint64_t AVControlCenterAudioIsAutoMicrophoneModeEnabledPreferenceKey(void *a1)
{
  CGImageRef v1 = (__CFString *)AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  return [NSString stringWithFormat:@"%@AUVoiceIOIsAutoChatFlavorEnabled", AVControlCenterAudioPreferencesKeyPrefix(v1)];
}

uint64_t AVControlCenterAudioIsAutoMicrophoneModeEnabledPreferenceKeyForTranslatedBundleID(__CFString *a1)
{
  return [NSString stringWithFormat:@"%@AUVoiceIOIsAutoChatFlavorEnabled", AVControlCenterAudioPreferencesKeyPrefix(a1)];
}

uint64_t AVControlCenterDidOverwriteOrphanedSupportedMicrophoneModesPreferenceKey(void *a1)
{
  CGImageRef v1 = (__CFString *)AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  return [NSString stringWithFormat:@"%@DidOverwriteOrphanedAUVoiceIOSupportedChatFlavors", AVControlCenterAudioPreferencesKeyPrefix(v1)];
}

uint64_t AVControlCenterAudioAreMicrophoneModesSupported()
{
  if (AVControlCenterAudioAreMicrophoneModesSupported_onceToken != -1) {
    dispatch_once(&AVControlCenterAudioAreMicrophoneModesSupported_onceToken, &__block_literal_global_117);
  }
  return AVControlCenterAudioAreMicrophoneModesSupported_sMicModesSupported;
}

uint64_t __AVControlCenterAudioAreMicrophoneModesSupported_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  AVControlCenterAudioAreMicrophoneModesSupported_sMicModesSupported = result;
  return result;
}

void *AVControlCenterAudioDefaultSupportedMicrophoneModesForBundleID(void *a1)
{
  if (AVControlCenterAudioAreMicrophoneModesSupported_onceToken != -1) {
    dispatch_once(&AVControlCenterAudioAreMicrophoneModesSupported_onceToken, &__block_literal_global_117);
  }
  if (AVControlCenterAudioAreMicrophoneModesSupported_sMicModesSupported)
  {
    if ([a1 isEqual:0x1EF4D64B0]) {
      return &unk_1EF4FA950;
    }
    id v2 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:a1 allowPlaceholder:1 error:0];
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "infoDictionary"), "objectForKey:ofClass:", @"NSAlwaysAllowMicrophoneModeControl", objc_opt_class()), "BOOLValue"))
    {

      return &unk_1EF4FA950;
    }
    int v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "infoDictionary"), "objectForKey:ofClass:", @"NSAllowMicModeControlWithoutSensorsActive", objc_opt_class()), "BOOLValue");

    if (v3) {
      return &unk_1EF4FA950;
    }
  }
  return (void *)MEMORY[0x1E4F1CBF0];
}

uint64_t AVControlCenterAudioMicrophoneMGAutoMode()
{
  if (AVControlCenterAudioMicrophoneMGAutoMode_onceToken != -1) {
    dispatch_once(&AVControlCenterAudioMicrophoneMGAutoMode_onceToken, &__block_literal_global_135);
  }
  return AVControlCenterAudioMicrophoneMGAutoMode_sMicMGAutoMode;
}

uint64_t __AVControlCenterAudioMicrophoneMGAutoMode_block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  AVControlCenterAudioMicrophoneMGAutoMode_sMicMGAutoMode = result;
  return result;
}

BOOL AVControlCenterAudioDefaultIsAutoMicrophoneEnabledForBundleIDAndMicMode(uint64_t a1, uint64_t a2)
{
  if (AVControlCenterAudioMicrophoneMGAutoMode_onceToken != -1) {
    dispatch_once(&AVControlCenterAudioMicrophoneMGAutoMode_onceToken, &__block_literal_global_135);
  }
  return (unint64_t)(a2 - 3) < 0xFFFFFFFFFFFFFFFELL
      && AVControlCenterAudioMicrophoneMGAutoMode_sMicMGAutoMode == 1;
}

uint64_t AVControlCenterBlackenFramesPreferenceKey(void *a1, uint64_t a2)
{
  int v3 = NSString;
  uint64_t v4 = (__CFString *)AVControlCenterPreferencesDomainForPreferencesDomain(a1);
  if (!v4) {
    uint64_t v4 = @"unknown";
  }
  uint64_t v5 = [(__CFString *)v4 stringByReplacingOccurrencesOfString:@"." withString:@"-"];
  return [v3 stringWithFormat:@"%@blacken-frames-from-deviceid-%@", objc_msgSend(NSString, "stringWithFormat:", @"%@%@/", @"nonpersisting-global/", v5), a2];
}

uint64_t AVSmartStyleSettingsSystemStylePreferenceKey(void *a1)
{
  return [NSString stringWithFormat:@"%@systemstyle", avsss_prefixedSystemStylePreferenceKeyForBundleID(a1)];
}

uint64_t avsss_prefixedSystemStylePreferenceKeyForBundleID(void *a1)
{
  id v2 = AVSmartStyleSettingsSystemStyle;
  if (([a1 isEqualToString:AVSmartStyleSettingsSystemStyle] & 1) == 0)
  {
    int v3 = (__CFString *)AVControlCenterPreferencesDomainForPreferencesDomain(a1);
    if (!v3) {
      int v3 = @"unknown";
    }
    id v2 = (__CFString *)[(__CFString *)v3 stringByReplacingOccurrencesOfString:@"." withString:@"-"];
  }
  return [NSString stringWithFormat:@"smartStyle/%@/", v2];
}

uint64_t AVSmartStyleSettingsSystemStyleTimestampPreferenceKey(void *a1)
{
  return [NSString stringWithFormat:@"nonpersisting-global/%@systemstyle-backgrounded-timestamp", avsss_prefixedSystemStylePreferenceKeyForBundleID(a1)];
}

uint64_t AVSmartStyleSettingsSystemStyleEnabledPreferenceKey()
{
  return [NSString stringWithFormat:@"systemstyle-enabled"];
}

uint64_t AVSmartStyleSettingsSystemStyleEnabledDefaultPreferenceKey(void *a1)
{
  return [NSString stringWithFormat:@"%@systemstyle-enabled-default", avsss_prefixedSystemStylePreferenceKeyForBundleID(a1)];
}

uint64_t AVSmartStyleSettingsSystemStyleHasShownOptOutMessagePreferenceKey(void *a1)
{
  return [NSString stringWithFormat:@"%@systemstyle-has-shown-opt-out-message", avsss_prefixedSystemStylePreferenceKeyForBundleID(a1)];
}

uint64_t __AVCaptureIsRunningInIOSAppOnMacEnvironment_block_invoke()
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "isiOSAppOnMac");
  AVCaptureIsRunningInIOSAppOnMacEnvironment_isIOSAppOnMac = result;
  return result;
}

uint64_t AVCaptureGetFrameworkRadarComponentName()
{
  return 0;
}

void *AVCIFilterArrayDescription(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:&stru_1EF4D21D0];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [a1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    uint64_t v6 = "";
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(a1);
        }
        [v2 appendFormat:@"%s%@", v6, objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7++), "name")];
        uint64_t v6 = ", ";
      }
      while (v4 != v7);
      uint64_t v4 = [a1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v6 = ", ";
    }
    while (v4);
  }
  return v2;
}

__CFString *AVAppleMakerNoteProcessingFlagsToShortString()
{
  return &stru_1EF4D21D0;
}

BOOL validRectInUnitRectCoordinateSpace(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  if (CGRectIsNull(*(CGRect *)&a1)) {
    return 0;
  }
  v18.origin.x = a1;
  v18.origin.y = a2;
  v18.size.width = a3;
  v18.size.height = a4;
  if (CGRectEqualToRect(v18, *MEMORY[0x1E4F1DB28])) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  double v11 = 1.0;
  double v12 = 1.0;
  CGFloat v13 = a1;
  CGFloat v14 = a2;
  CGFloat v15 = a3;
  CGFloat v16 = a4;

  return CGRectContainsRect(*(CGRect *)&v9, *(CGRect *)&v13);
}

BOOL AVCaptureShouldThrowForAPIViolations()
{
  if (AVCaptureShouldThrowForAPIViolations_onceToken != -1) {
    dispatch_once(&AVCaptureShouldThrowForAPIViolations_onceToken, &__block_literal_global_399);
  }
  return AVCaptureShouldThrowForAPIViolations_pardonAPIViolations == 0;
}

uint64_t __AVCaptureShouldThrowForAPIViolations_block_invoke()
{
  if (AVCaptureIsRunningInIOSAppOnMacEnvironment_onceToken != -1) {
    dispatch_once(&AVCaptureIsRunningInIOSAppOnMacEnvironment_onceToken, &__block_literal_global_311);
  }
  uint64_t result = FigGetCFPreferenceNumberWithDefault();
  AVCaptureShouldThrowForAPIViolations_pardonAPIViolations = result != 0;
  return result;
}

uint64_t AVCaptureGetDiskCapacityInGB()
{
  if (AVCaptureGetDiskCapacityInGB_onceToken != -1) {
    dispatch_once(&AVCaptureGetDiskCapacityInGB_onceToken, &__block_literal_global_407);
  }
  return AVCaptureGetDiskCapacityInGB_sDiskCapacityInGB;
}

void __AVCaptureGetDiskCapacityInGB_block_invoke()
{
  id v0 = (id)MGCopyAnswer();
  AVCaptureGetDiskCapacityInGB_sDiskCapacityInGB = (int)((double)objc_msgSend((id)objc_msgSend(v0, "objectForKeyedSubscript:", *MEMORY[0x1E4FBA0F8]), "longLongValue")/ 1000000000.0);
}

uint64_t AVCaptureMovieFileURLIsValidForConnection(void *a1, double a2, double a3, uint64_t a4, __CFString **a5)
{
  int IsFileOnExternalStorageDevice = FigFileIsFileOnExternalStorageDevice();
  if (!a1) {
    return 1;
  }
  int v10 = IsFileOnExternalStorageDevice;
  double v11 = (void *)[a1 sourceDevice];
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "activeFormat"), "figCaptureSourceVideoFormat"), "format");
  if (!FigCapturePixelFormatIs422()) {
    return 1;
  }
  if (AVCaptureMovieFileURLIsValidForConnection_onceToken == -1)
  {
    if (v11)
    {
LABEL_5:
      [v11 activeVideoMaxFrameDuration];
      [v11 activeVideoMaxFrameDuration];
      double v12 = (double)v24 / (double)v23;
      [v11 activeVideoMinFrameDuration];
      [v11 activeVideoMinFrameDuration];
      double v13 = (double)v22 / (double)v21;
      goto LABEL_8;
    }
  }
  else
  {
    dispatch_once(&AVCaptureMovieFileURLIsValidForConnection_onceToken, &__block_literal_global_412);
    if (v11) {
      goto LABEL_5;
    }
  }
  double v12 = NAN;
  double v13 = NAN;
LABEL_8:
  BOOL v14 = 0;
  if (a2 == 3840.0)
  {
    BOOL v15 = 0;
    BOOL v16 = 0;
    if (a3 == 2160.0)
    {
      BOOL v15 = v12 == v13 && v12 == 120.0;
      BOOL v14 = v12 == v13 && v12 == 60.0;
      BOOL v16 = v12 == v13 && v12 == 30.0;
    }
  }
  else
  {
    BOOL v15 = 0;
    BOOL v16 = 0;
  }
  BOOL v17 = 0;
  if (a2 == 1920.0)
  {
    BOOL v18 = 0;
    if (a3 == 1080.0)
    {
      BOOL v17 = v12 == v13 && v12 == 60.0;
      BOOL v18 = v12 == v13 && v12 == 120.0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }
  if (AVCaptureGetDiskCapacityInGB_onceToken == -1)
  {
    if (!v10) {
      goto LABEL_31;
    }
    return 1;
  }
  dispatch_once(&AVCaptureGetDiskCapacityInGB_onceToken, &__block_literal_global_407);
  if (v10) {
    return 1;
  }
LABEL_31:
  double v19 = @"Capturing 4k120 with ProRes codec on this device is supported only on external storage device.";
  if (v14) {
    double v19 = @"Capturing 4k60 with ProRes codec on this device is supported only on external storage device.";
  }
  if (!v14 && !v15)
  {
    if (AVCaptureGetDiskCapacityInGB_sDiskCapacityInGB > 0xFF) {
      return 1;
    }
    double v19 = @"Capturing 1080p120 with ProRes codec on this device is supported only on external storage device.";
    if (v17) {
      double v19 = @"Capturing 1080p60 with ProRes codec on this device is supported only on external storage device.";
    }
    if (v16) {
      double v19 = @"Capturing 4k30 with ProRes codec on this device is supported only on external storage device.";
    }
    if (!v16 && !v17 && !v18) {
      return 1;
    }
  }
  uint64_t result = 0;
  if (a5) {
    *a5 = v19;
  }
  return result;
}

uint64_t AVCaptureVTRotationFromDegrees(int a1)
{
  uint64_t result = 0;
  if (a1 > 179)
  {
    if (a1 == 180)
    {
      uint64_t v3 = MEMORY[0x1E4F45350];
    }
    else
    {
      if (a1 != 270) {
        return result;
      }
      uint64_t v3 = MEMORY[0x1E4F45358];
    }
  }
  else if (a1)
  {
    if (a1 != 90) {
      return result;
    }
    uint64_t v3 = MEMORY[0x1E4F45360];
  }
  else
  {
    uint64_t v3 = MEMORY[0x1E4F45348];
  }
  return *(void *)v3;
}

CFTypeRef AVCaptureGetTransformedDetectedObjectsInfo(const void *a1, uint64_t a2, void *a3)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)CMGetAttachment(a1, (CFStringRef)*MEMORY[0x1E4F51480], 0);
  CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F523A0];
  double v8 = (const void *)[v6 objectForKeyedSubscript:*MEMORY[0x1E4F523A0]];
  if (v8 || (CFTypeRef result = CMGetAttachment(a1, v7, 0), (v8 = result) != 0))
  {
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v50 = *MEMORY[0x1E4F1DAB8];
    long long v51 = v10;
    long long v52 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    char v49 = 0;
    uint64_t v48 = 0;
    [a3 getTransform:&v50 mirroredOut:&v49 rollAdjustmentOut:&v48 forConnection:a2];
    if (*(double *)&v50 == 0.0) {
      double v11 = *(double *)&v51;
    }
    else {
      double v11 = *(double *)&v50;
    }
    double v12 = fabs(v11);
    double v13 = *(double *)&v50 / v12;
    double v14 = *(double *)&v51 / v12;
    double v15 = *(double *)&v52 / v12;
    if (*((double *)&v51 + 1) == 0.0) {
      double v16 = *((double *)&v50 + 1);
    }
    else {
      double v16 = *((double *)&v51 + 1);
    }
    double v17 = fabs(v16);
    *(double *)&long long v50 = v13;
    *((double *)&v50 + 1) = *((double *)&v50 + 1) / v17;
    *(double *)&long long v51 = v14;
    *((double *)&v51 + 1) = *((double *)&v51 + 1) / v17;
    *(double *)&long long v52 = v15;
    *((double *)&v52 + 1) = *((double *)&v52 + 1) / v17;
    DeepCopy = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v8, 1uLL);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v28 = DeepCopy;
    obuint64_t j = (id)[DeepCopy allValues];
    uint64_t v32 = [obj countByEnumeratingWithState:&v44 objects:v54 count:16];
    if (v32)
    {
      uint64_t v31 = *(void *)v45;
      uint64_t v30 = *MEMORY[0x1E4F52320];
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v45 != v31) {
            objc_enumerationMutation(obj);
          }
          uint64_t v33 = v19;
          double v20 = (void *)[*(id *)(*((void *)&v44 + 1) + 8 * v19) objectForKeyedSubscript:v30];
          if (v20)
          {
            uint64_t v21 = v20;
            long long v42 = 0u;
            long long v43 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            uint64_t v22 = [v20 countByEnumeratingWithState:&v40 objects:v53 count:16];
            if (v22)
            {
              uint64_t v23 = v22;
              uint64_t v24 = *(void *)v41;
              do
              {
                uint64_t v25 = 0;
                do
                {
                  if (*(void *)v41 != v24) {
                    objc_enumerationMutation(v21);
                  }
                  uint64_t v26 = *(void **)(*((void *)&v40 + 1) + 8 * v25);
                  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                  v34[0] = MEMORY[0x1E4F143A8];
                  v34[1] = 3221225472;
                  v34[2] = __AVCaptureGetTransformedDetectedObjectsInfo_block_invoke;
                  v34[3] = &unk_1E5A732C8;
                  long long v35 = v50;
                  long long v36 = v51;
                  long long v37 = v52;
                  v34[4] = v27;
                  uint64_t v38 = v48;
                  char v39 = v49;
                  [v26 enumerateKeysAndObjectsUsingBlock:v34];
                  [v26 addEntriesFromDictionary:v27];

                  ++v25;
                }
                while (v23 != v25);
                uint64_t v23 = [v21 countByEnumeratingWithState:&v40 objects:v53 count:16];
              }
              while (v23);
            }
          }
          uint64_t v19 = v33 + 1;
        }
        while (v33 + 1 != v32);
        uint64_t v32 = [obj countByEnumeratingWithState:&v44 objects:v54 count:16];
      }
      while (v32);
    }
    return v28;
  }
  return result;
}

uint64_t __AVCaptureGetTransformedDetectedObjectsInfo_block_invoke(uint64_t a1, void *a2, const __CFDictionary *a3)
{
  if ([a2 hasSuffix:@"Rect"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CGSize v6 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
      rect.origiuint64_t n = (CGPoint)*MEMORY[0x1E4F1DB20];
      rect.size = v6;
      if (CGRectMakeWithDictionaryRepresentation(a3, &rect))
      {
        long long v7 = *(_OWORD *)(a1 + 56);
        *(_OWORD *)&v14.a = *(_OWORD *)(a1 + 40);
        *(_OWORD *)&v14.c = v7;
        *(_OWORD *)&v14.tx = *(_OWORD *)(a1 + 72);
        CGRect rect = CGRectApplyAffineTransform(rect, &v14);
        CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(rect);
        [*(id *)(a1 + 32) setObject:DictionaryRepresentation forKeyedSubscript:a2];
      }
    }
  }
  if ([a2 hasSuffix:@"Roll"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(__CFDictionary *)a3 doubleValue];
      double v10 = v9 + *(double *)(a1 + 88);
      if (*(unsigned char *)(a1 + 96)) {
        double v10 = -v10;
      }
      double v11 = 360.0;
      if (v10 >= 360.0)
      {
        double v11 = -360.0;
      }
      else if (v10 >= 0.0)
      {
        goto LABEL_14;
      }
      double v10 = v10 + v11;
LABEL_14:
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v10), a2);
    }
  }
  uint64_t result = [a2 hasSuffix:@"Yaw"];
  if (result)
  {
    objc_opt_class();
    uint64_t result = objc_opt_isKindOfClass();
    if (result)
    {
      [(__CFDictionary *)a3 doubleValue];
      if (*(unsigned char *)(a1 + 96))
      {
        if (v13 <= 0.0) {
          double v13 = -v13;
        }
        else {
          double v13 = 360.0 - v13;
        }
      }
      return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v13), a2);
    }
  }
  return result;
}

__CFString *AVCaptureQOSClassToString(uint64_t a1)
{
  if ((int)a1 > 20)
  {
    switch(a1)
    {
      case 0x15:
        return @"QOS_CLASS_DEFAULT";
      case 0x21:
        return @"QOS_CLASS_USER_INTERACTIVE";
      case 0x19:
        return @"QOS_CLASS_USER_INITIATED";
    }
  }
  else
  {
    switch(a1)
    {
      case 0:
        return @"QOS_CLASS_UNSPECIFIED";
      case 9:
        return @"QOS_CLASS_BACKGROUND";
      case 0x11:
        return @"QOS_CLASS_UTILITY";
    }
  }
  return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"Unknown QoS class %d", a1);
}

NSString *__cdecl AVCaptureReactionSystemImageNameForType(AVCaptureReactionType reactionType)
{
  if (AVCaptureReactionSystemImageNameForType_onceToken != -1) {
    dispatch_once(&AVCaptureReactionSystemImageNameForType_onceToken, &__block_literal_global_5);
  }
  id v2 = (void *)AVCaptureReactionSystemImageNameForType_nameForType;

  return (NSString *)[v2 objectForKeyedSubscript:reactionType];
}

id __AVCaptureReactionSystemImageNameForType_block_invoke()
{
  v2[9] = *MEMORY[0x1E4F143B8];
  v1[0] = AVCaptureReactionTypeThumbsUp;
  v1[1] = AVCaptureReactionTypeThumbsDown;
  v2[0] = @"hand.thumbsup.fill";
  v2[1] = @"hand.thumbsdown.fill";
  v1[2] = AVCaptureReactionTypeVictory;
  v1[3] = AVCaptureReactionTypeBalloons;
  v2[2] = @"balloon.2.fill";
  v2[3] = @"balloon.2.fill";
  v1[4] = AVCaptureReactionTypeHeart;
  v1[5] = AVCaptureReactionTypeFireworks;
  v2[4] = @"heart.fill";
  void v2[5] = @"fireworks";
  v1[6] = AVCaptureReactionTypeRain;
  v1[7] = AVCaptureReactionTypeConfetti;
  v2[6] = @"cloud.rain.fill";
  v2[7] = @"party.popper.fill";
  v1[8] = AVCaptureReactionTypeLasers;
  v2[8] = @"laser.burst";
  id result = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v2 forKeys:v1 count:9];
  AVCaptureReactionSystemImageNameForType_nameForType = (uint64_t)result;
  return result;
}

BOOL vdo_dimensionsHaveValidAspectRatio(double a1, double a2)
{
  return a1 * 9.0 == a2 * 16.0 || a1 * 16.0 == a2 * 9.0 || a1 * 3.0 == a2 * 4.0 || a1 == a2 || a1 * 4.0 == a2 * 3.0;
}

void sub_1A15B1A18(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A15B1B58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_1A15B1D88(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A15B1EB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t vsndo_notificationHandler(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a2 _handleNotification:a3 payload:a5];
}

void sub_1A15C29D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *AVCaptureDeviceTypeToString(void *a1)
{
  if ([a1 isEqualToString:@"AVCaptureDeviceTypeBuiltInWideAngleCamera"]) {
    return @"Wide";
  }
  if ([a1 isEqualToString:@"AVCaptureDeviceTypeBuiltInTelephotoCamera"]) {
    return @"Tele";
  }
  if ([a1 isEqualToString:@"AVCaptureDeviceTypeBuiltInDualCamera"]) {
    return @"Dual";
  }
  if ([a1 isEqualToString:@"AVCaptureDeviceTypeBuiltInUltraWideCamera"]) {
    return @"UltraWide";
  }
  if ([a1 isEqualToString:@"AVCaptureDeviceTypeBuiltInDualWideCamera"]) {
    return @"DualWide";
  }
  if ([a1 isEqualToString:@"AVCaptureDeviceTypeBuiltInTripleCamera"]) {
    return @"Triple";
  }
  if ([a1 isEqualToString:@"AVCaptureDeviceTypeBuiltInTimeOfFlightCamera"]) {
    return @"TimeOfFlight";
  }
  if ([a1 isEqualToString:@"AVCaptureDeviceTypeBuiltInLiDARDepthCamera"]) {
    return @"LiDARDepth";
  }
  if ([a1 isEqualToString:@"AVCaptureDeviceTypeDeskViewCamera"]) {
    return @"Overhead";
  }
  if ([a1 isEqualToString:@"AVCaptureDeviceTypeBuiltInTrueDepthCamera"]) {
    return @"TrueDepth";
  }
  if ([a1 isEqualToString:@"AVCaptureDeviceTypeBuiltInWideAngleMetadataCamera"]) {
    return @"WideMetadata";
  }
  if ([a1 isEqualToString:@"AVCaptureDeviceTypeBuiltInUltraWideAngleMetadataCamera"]) {
    return @"UltraWideMetadata";
  }
  if ([a1 isEqualToString:@"AVCaptureDeviceTypeBuiltInInfraredMetadataCamera"]) {
    return @"InfraredMetadata";
  }
  if ([a1 isEqualToString:@"AVCaptureDeviceTypeMicrophone"]) {
    return @"Microphone";
  }
  if ([a1 isEqualToString:@"AVCaptureDeviceTypeExternal"]) {
    return @"External";
  }
  if ([a1 isEqualToString:@"AVCaptureDeviceTypeContinuityCamera"]) {
    return @"ContinuityCamera";
  }
  return 0;
}

__CFString *AVCaptureDeviceTypeToShortString(void *a1)
{
  if ([a1 isEqualToString:@"AVCaptureDeviceTypeBuiltInWideAngleCamera"]) {
    return @"W";
  }
  if ([a1 isEqualToString:@"AVCaptureDeviceTypeBuiltInTelephotoCamera"]) {
    return @"T";
  }
  if ([a1 isEqualToString:@"AVCaptureDeviceTypeBuiltInDualCamera"]) {
    return @"D";
  }
  if ([a1 isEqualToString:@"AVCaptureDeviceTypeBuiltInUltraWideCamera"]) {
    return @"UW";
  }
  if ([a1 isEqualToString:@"AVCaptureDeviceTypeBuiltInDualWideCamera"]) {
    return @"DW";
  }
  if ([a1 isEqualToString:@"AVCaptureDeviceTypeBuiltInTripleCamera"]) {
    return @"3";
  }
  if ([a1 isEqualToString:@"AVCaptureDeviceTypeBuiltInTimeOfFlightCamera"]) {
    return @"TOF";
  }
  if ([a1 isEqualToString:@"AVCaptureDeviceTypeBuiltInLiDARDepthCamera"]) {
    return @"LD";
  }
  if ([a1 isEqualToString:@"AVCaptureDeviceTypeDeskViewCamera"]) {
    return @"OH";
  }
  if ([a1 isEqualToString:@"AVCaptureDeviceTypeBuiltInTrueDepthCamera"]) {
    return @"TD";
  }
  if ([a1 isEqualToString:@"AVCaptureDeviceTypeBuiltInWideAngleMetadataCamera"]) {
    return @"WM";
  }
  if ([a1 isEqualToString:@"AVCaptureDeviceTypeBuiltInUltraWideAngleMetadataCamera"]) {
    return @"UWM";
  }
  if ([a1 isEqualToString:@"AVCaptureDeviceTypeBuiltInInfraredMetadataCamera"]) {
    return @"IRM";
  }
  if ([a1 isEqualToString:@"AVCaptureDeviceTypeMicrophone"]) {
    return @"MIC";
  }
  if ([a1 isEqualToString:@"AVCaptureDeviceTypeExternal"]) {
    return @"EXT";
  }
  if ([a1 isEqualToString:@"AVCaptureDeviceTypeContinuityCamera"]) {
    return @"CC";
  }
  return 0;
}

__CFString *AVCaptureDevicePositionToString(unint64_t a1)
{
  if (a1 > 2) {
    return @"<Unknown>";
  }
  else {
    return off_1E5A73730[a1];
  }
}

__CFString *AVCaptureVideoStabilizationModeToString(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 6) {
    return 0;
  }
  else {
    return off_1E5A73748[a1 + 1];
  }
}

uint64_t ___registerServerConnectionDiedNotification_block_invoke()
{
  os_unfair_lock_lock((os_unfair_lock_t)&sRegisterVideoDevicesLock);
  id v0 = (id)[(id)sRegisteredVideoDevices copy];
  os_unfair_lock_unlock((os_unfair_lock_t)&sRegisterVideoDevicesLock);
  os_unfair_lock_lock((os_unfair_lock_t)&sRegisterAudioDevicesLock);
  id v1 = (id)[(id)sRegisteredAudioDevices copy];
  os_unfair_lock_unlock((os_unfair_lock_t)&sRegisterAudioDevicesLock);
  if ([v0 count]) {
    [NSClassFromString(&cfstr_Avcapturefigvi.isa) _reconnectDevices:v0];
  }
  if ([v1 count]) {
    [NSClassFromString(&cfstr_Avcapturefigau.isa) _reconnectDevices:v1];
  }
  +[AVCaptureProprietaryDefaultsSingleton updateProprietaryDefaultsSource];
  id v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];

  return [v2 postNotificationName:@"AVCaptureDeviceServerConnectionDiedNotification" object:0];
}

void ___registerVideoDevicesOnce_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C92C0)
  {
    v49[0] = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    a1 = fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v3 = (void *)MEMORY[0x1A62348E0](a1, a2);
  id v46 = 0;
  id v47 = 0;
  _refreshRegisteredDevices(@"AVCaptureFigVideoDevice", &v47, &v46);
  if ([v47 count] || objc_msgSend(v46, "count"))
  {
    [NSClassFromString(&cfstr_Avcapturefigvi.isa) _setUpCameraHistoryOnce];
    [NSClassFromString(&cfstr_Avcapturefigvi.isa) _initiateRefreshPreferredCameraProperties:1];
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v4 = v47;
  uint64_t v5 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v42, v51, 16, v26, v27);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v43 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        [v9 _setConnected:1];
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"AVCaptureDeviceWasConnectedNotification", v9);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v42 objects:v51 count:16];
    }
    while (v6);
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v10 = v46;
  uint64_t v11 = [v46 countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v39 != v13) {
          objc_enumerationMutation(v10);
        }
        double v15 = *(void **)(*((void *)&v38 + 1) + 8 * j);
        [v15 _setConnected:0];
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"AVCaptureDeviceWasDisconnectedNotification", v15);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v38 objects:v50 count:16];
    }
    while (v12);
  }
  id v36 = 0;
  id v37 = 0;
  _refreshRegisteredDevices(@"AVCaptureFigAudioDevice", &v37, &v36);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v16 = v37;
  uint64_t v17 = [v37 countByEnumeratingWithState:&v32 objects:v49 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v33;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(v16);
        }
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"AVCaptureDeviceWasConnectedNotification", *(void *)(*((void *)&v32 + 1) + 8 * k));
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v49 count:16];
    }
    while (v18);
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v21 = v36;
  uint64_t v22 = [v36 countByEnumeratingWithState:&v28 objects:type count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v29;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v29 != v24) {
          objc_enumerationMutation(v21);
        }
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"AVCaptureDeviceWasDisconnectedNotification", *(void *)(*((void *)&v28 + 1) + 8 * m));
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v28 objects:type count:16];
    }
    while (v23);
  }
}

void _refreshRegisteredDevices(void *a1, void *a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if ([a1 isEqualToString:@"AVCaptureFigAudioDevice"])
  {
    long long v31 = a2;
    long long v32 = a3;
    uint64_t v6 = (os_unfair_lock_s *)&sRegisterAudioDevicesLock;
  }
  else
  {
    if (![a1 isEqualToString:@"AVCaptureFigVideoDevice"]) {
      return;
    }
    long long v31 = a2;
    long long v32 = a3;
    uint64_t v6 = (os_unfair_lock_s *)&sRegisterVideoDevicesLock;
  }
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  double v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  locuint64_t k = v6;
  os_unfair_lock_lock(v6);
  int v9 = [a1 isEqualToString:@"AVCaptureFigAudioDevice"];
  id v10 = &sRegisteredAudioDevices;
  if (!v9) {
    id v10 = &sRegisteredVideoDevices;
  }
  uint64_t v11 = (void *)*v10;
  long long v28 = a1;
  uint64_t v12 = (void *)[NSClassFromString((NSString *)a1) _devicesWithPriorRegisteredDevices:*v10];
  UniqueIDsForDevices = _getUniqueIDsForDevices(v11);
  CGAffineTransform v14 = _getUniqueIDsForDevices(v12);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v15 = [v12 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v38 != v17) {
          objc_enumerationMutation(v12);
        }
        uint64_t v19 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if ((objc_msgSend(UniqueIDsForDevices, "containsObject:", objc_msgSend(v19, "uniqueID", v28, lock)) & 1) == 0
          && [v19 isConnected])
        {
          [v7 addObject:v19];
        }
      }
      uint64_t v16 = [v12 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v16);
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v20 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v41, 16, v28);
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v34 != v22) {
          objc_enumerationMutation(v11);
        }
        uint64_t v24 = *(void **)(*((void *)&v33 + 1) + 8 * j);
        if ((objc_msgSend(v14, "containsObject:", objc_msgSend(v24, "uniqueID")) & 1) == 0) {
          [v8 addObject:v24];
        }
      }
      uint64_t v21 = [v11 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v21);
  }
  int v25 = [v29 isEqualToString:@"AVCaptureFigAudioDevice"];
  uint64_t v26 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v12];
  uint64_t v27 = &sRegisteredAudioDevices;
  if (!v25) {
    uint64_t v27 = &sRegisteredVideoDevices;
  }
  *uint64_t v27 = v26;

  os_unfair_lock_unlock(lock);
  if (v31) {
    *long long v31 = v7;
  }
  if (v32) {
    void *v32 = v8;
  }
}

void *_getUniqueIDsForDevices(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [a1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(a1);
        }
        uint64_t v7 = [*(id *)(*((void *)&v9 + 1) + 8 * v6) uniqueID];
        if (v7) {
          [v2 addObject:v7];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [a1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  return v2;
}

void __Block_byref_object_copy__3(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

Class __getCMContinuityCaptureCapabilitiesClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CMContinuityCaptureCoreLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    void v3[2] = (void *)3221225472;
    v3[3] = __CMContinuityCaptureCoreLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E5A73718;
    uint64_t v5 = 0;
    CMContinuityCaptureCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CMContinuityCaptureCoreLibraryCore_frameworkLibrary) {
    __getCMContinuityCaptureCapabilitiesClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("CMContinuityCaptureCapabilities");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    __getCMContinuityCaptureCapabilitiesClass_block_invoke_cold_2();
  }
  getCMContinuityCaptureCapabilitiesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

uint64_t __CMContinuityCaptureCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CMContinuityCaptureCoreLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t ccdo_notificationHandler(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a2 _handleNotification:a3 payload:a5];
}

uint64_t pdo_notificationHandler(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a2 _handleNotification:a3 payload:a5];
}

void sub_1A15C73E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A15C85B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A15C87FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A15C8A10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A15C8C5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A15C9050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A15C9318(_Unwind_Exception *exception_object)
{
}

void sub_1A15C95CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A15C9988(_Unwind_Exception *exception_object)
{
}

void sub_1A15CA30C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sioNotificationHandler(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __sioNotificationHandler_block_invoke;
  v6[3] = &unk_1E5A731E0;
  v6[4] = a2;
  v6[5] = a3;
  v6[6] = a5;
  return [a2 performBlockOnSessionNotifyingThread:v6];
}

void sub_1A15CA730(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A15CB2E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

uint64_t __sioNotificationHandler_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleNotification:*(void *)(a1 + 40) payload:*(void *)(a1 + 48)];
}

uint64_t AVCaptureMetadataObjectsOnly()
{
  if (AVCaptureMetadataObjectsOnly_onceToken != -1) {
    dispatch_once(&AVCaptureMetadataObjectsOnly_onceToken, &__block_literal_global_11);
  }
  return AVCaptureMetadataObjectsOnly_answer;
}

uint64_t AVMetadataObjectCreateBoxedMetadataFromFaceObjectAndFormatDescription(void *a1, uint64_t a2, uint64_t *a3)
{
  if (!a2)
  {
    long long v9 = NSString;
    long long v10 = (objc_class *)objc_opt_class();
    uint64_t v8 = [v9 stringWithFormat:@"Metadata value is an instance of %@, but there is no format description", NSStringFromClass(v10)];
    goto LABEL_27;
  }
  if (FigBoxedMetadataCreateForConstruction()) {
    goto LABEL_25;
  }
  uint64_t v6 = NSString;
  uint64_t v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = [v6 stringWithFormat:@"Metadata value is an instance of %@, but format description does not properly describe face data", NSStringFromClass(v7)];
  [(id)AVMetadataItemGetDataTypesForIdentifiersOfFieldsOfDetectedFaces() objectForKey:*MEMORY[0x1E4F217F8]];
  if (!FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors()) {
    goto LABEL_24;
  }
  [a1 faceID];
  if (FigBoxedMetadataAppendSInt32()) {
    goto LABEL_25;
  }
  [(id)AVMetadataItemGetDataTypesForIdentifiersOfFieldsOfDetectedFaces() objectForKey:*MEMORY[0x1E4F217F0]];
  if (!FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors()) {
    goto LABEL_24;
  }
  [a1 bounds];
  CGRectStandardize(v12);
  if (FigBoxedMetadataAppendValue()) {
    goto LABEL_25;
  }
  if ([a1 hasRollAngle])
  {
    [(id)AVMetadataItemGetDataTypesForIdentifiersOfFieldsOfDetectedFaces() objectForKey:*MEMORY[0x1E4F21800]];
    if (!FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors()) {
      goto LABEL_24;
    }
    [a1 rollAngle];
    if (FigBoxedMetadataAppendFloat32()) {
      goto LABEL_25;
    }
  }
  if (![a1 hasYawAngle]) {
    goto LABEL_13;
  }
  if (!AVMetadataItemGetLocalIDForIdentifierInFormatDescription(a2, *MEMORY[0x1E4F21808]))
  {
LABEL_24:
    FigDebugAssert3();
    goto LABEL_27;
  }
  [a1 yawAngle];
  if (!FigBoxedMetadataAppendFloat32())
  {
LABEL_13:
    if (!FigBoxedMetadataEndConstruction()) {
      goto LABEL_26;
    }
  }
LABEL_25:
  FigDebugAssert3();
LABEL_26:
  uint64_t v8 = 0;
LABEL_27:
  if (a3) {
    *a3 = v8;
  }
  return 0;
}

uint64_t AVMetadataItemGetLocalIDForIdentifierInFormatDescription(uint64_t a1, uint64_t a2)
{
  [(id)AVMetadataItemGetDataTypesForIdentifiersOfFieldsOfDetectedFaces() objectForKey:a2];

  return FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
}

AVMetadataSalientObject *AVMetadataMakeMetadataObjectFromBoxedMetadata(uint64_t a1, void *a2, long long *a3, long long *a4)
{
  if ([a2 isEqualToString:*MEMORY[0x1E4F1F090]])
  {
    long long v46 = *a3;
    uint64_t v49 = *((void *)a3 + 2);
    long long v40 = *a4;
    uint64_t v43 = *((void *)a4 + 2);
    CGSize v8 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v56.origiuint64_t n = (CGPoint)*MEMORY[0x1E4F1DB20];
    v56.CGSize size = v8;
    FigBoxedMetadataGetFormatDescription();
    if (FigBoxedMetadataGetNumberOfItems() >= 1)
    {
      uint64_t v9 = 0;
      char v39 = 0;
      char v10 = 0;
      char v11 = 0;
      uint64_t v12 = 0;
      char v13 = 0;
      double v14 = 0.0;
      double v15 = 0.0;
      do
      {
        AVMetadataItemIdentifierForItemIndex();
        if (FigCFEqual())
        {
          while (1)
          {
            LODWORD(v12) = FigBoxedMetadataGetValueOfItemAtIndexAsSInt32();
            if (++v9 >= FigBoxedMetadataGetNumberOfItems()) {
              break;
            }
            AVMetadataItemIdentifierForItemIndex();
            if (!FigCFEqual())
            {
              uint64_t v12 = (int)v12;
              char v13 = 1;
              goto LABEL_8;
            }
          }
          uint64_t v12 = (int)v12;
          goto LABEL_22;
        }
LABEL_8:
        if (FigCFEqual())
        {
          AVMetadataItemBoundsFromBoxedMetadataForItemIndex(a1, v9, &v56);
          char v11 = v16;
        }
        else if (FigCFEqual())
        {
          FigBoxedMetadataGetValueOfItemAtIndexAsFloat32();
          double v15 = v17;
          char v10 = 1;
        }
        else if (FigCFEqual())
        {
          FigBoxedMetadataGetValueOfItemAtIndexAsFloat32();
          double v14 = v18;
          char v39 = 1;
        }
        ++v9;
      }
      while (v9 < FigBoxedMetadataGetNumberOfItems());
      if ((v13 & 1) == 0) {
        goto LABEL_38;
      }
LABEL_22:
      if (v11)
      {
        uint64_t v27 = [AVMetadataFaceObject alloc];
        long long v54 = v46;
        uint64_t v55 = v49;
        long long v52 = v40;
        uint64_t v53 = v43;
        long long v28 = -[AVMetadataFaceObject initWithFaceID:hasRollAngle:rollAngle:hasYawAngle:yawAngle:hasPitchAngle:pitchAngle:time:duration:bounds:](v27, "initWithFaceID:hasRollAngle:rollAngle:hasYawAngle:yawAngle:hasPitchAngle:pitchAngle:time:duration:bounds:", v12, v10 & 1, v39 & 1, 0, &v54, &v52, v15, v14, 0.0, *(_OWORD *)&v56.origin, *(_OWORD *)&v56.size);
        return v28;
      }
    }
    goto LABEL_38;
  }
  if ([a2 isEqualToString:*MEMORY[0x1E4F1F098]])
  {
    long long v47 = *a3;
    uint64_t v50 = *((void *)a3 + 2);
    long long v41 = *a4;
    uint64_t v44 = *((void *)a4 + 2);
    v57[0] = -1;
    CGSize v19 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v56.origiuint64_t n = (CGPoint)*MEMORY[0x1E4F1DB20];
    v56.CGSize size = v19;
    AVMetadataItemIDAndBoundsFromBoxedMetadata(a1, *MEMORY[0x1E4F21810], *MEMORY[0x1E4F21818], v57, &v56);
    uint64_t v20 = v57[0];
    double y = v56.origin.y;
    double x = v56.origin.x;
    double height = v56.size.height;
    double width = v56.size.width;
    BOOL IsNull = CGRectIsNull(v56);
    if ((v20 & 0x8000000000000000) == 0 && !IsNull)
    {
      uint64_t v26 = AVMetadataHumanBodyObject;
LABEL_32:
      long long v54 = v47;
      uint64_t v55 = v50;
      long long v52 = v41;
      uint64_t v53 = v44;
      long long v28 = (AVMetadataSalientObject *)objc_msgSend([v26 alloc], "initWithBodyID:time:duration:bounds:", v20, &v54, &v52, x, y, width, height);
      return v28;
    }
    goto LABEL_38;
  }
  if ([a2 isEqualToString:*MEMORY[0x1E4F1F080]])
  {
    long long v47 = *a3;
    uint64_t v50 = *((void *)a3 + 2);
    long long v41 = *a4;
    uint64_t v44 = *((void *)a4 + 2);
    v57[0] = -1;
    CGSize v29 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v56.origiuint64_t n = (CGPoint)*MEMORY[0x1E4F1DB20];
    v56.CGSize size = v29;
    AVMetadataItemIDAndBoundsFromBoxedMetadata(a1, *MEMORY[0x1E4F217D0], *MEMORY[0x1E4F217D8], v57, &v56);
    uint64_t v20 = v57[0];
    double y = v56.origin.y;
    double x = v56.origin.x;
    double height = v56.size.height;
    double width = v56.size.width;
    BOOL v30 = CGRectIsNull(v56);
    if ((v20 & 0x8000000000000000) == 0 && !v30)
    {
      uint64_t v26 = AVMetadataCatBodyObject;
      goto LABEL_32;
    }
LABEL_38:
    FigDebugAssert3();
    return 0;
  }
  if ([a2 isEqualToString:*MEMORY[0x1E4F1F088]])
  {
    long long v47 = *a3;
    uint64_t v50 = *((void *)a3 + 2);
    long long v41 = *a4;
    uint64_t v44 = *((void *)a4 + 2);
    v57[0] = -1;
    CGSize v31 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v56.origiuint64_t n = (CGPoint)*MEMORY[0x1E4F1DB20];
    v56.CGSize size = v31;
    AVMetadataItemIDAndBoundsFromBoxedMetadata(a1, *MEMORY[0x1E4F217E0], *MEMORY[0x1E4F217E8], v57, &v56);
    uint64_t v20 = v57[0];
    double y = v56.origin.y;
    double x = v56.origin.x;
    double height = v56.size.height;
    double width = v56.size.width;
    BOOL v32 = CGRectIsNull(v56);
    if ((v20 & 0x8000000000000000) == 0 && !v32)
    {
      uint64_t v26 = AVMetadataDogBodyObject;
      goto LABEL_32;
    }
    goto LABEL_38;
  }
  if ([a2 isEqualToString:*MEMORY[0x1E4F1F0A0]])
  {
    long long v48 = *a3;
    uint64_t v51 = *((void *)a3 + 2);
    long long v42 = *a4;
    uint64_t v45 = *((void *)a4 + 2);
    v57[0] = 0;
    CGSize v34 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v56.origiuint64_t n = (CGPoint)*MEMORY[0x1E4F1DB20];
    v56.CGSize size = v34;
    AVMetadataItemIDAndBoundsFromBoxedMetadata(a1, *MEMORY[0x1E4F21890], *MEMORY[0x1E4F21888], v57, &v56);
    uint64_t v35 = v57[0];
    origiuint64_t n = v56.origin;
    CGSize size = v56.size;
    BOOL v38 = CGRectIsNull(v56);
    if ((v35 & 0x8000000000000000) == 0 && !v38)
    {
      long long v54 = v48;
      uint64_t v55 = v51;
      long long v52 = v42;
      uint64_t v53 = v45;
      long long v28 = -[AVMetadataSalientObject initWithObjectID:time:duration:bounds:]([AVMetadataSalientObject alloc], "initWithObjectID:time:duration:bounds:", v35, &v54, &v52, origin, size);
      return v28;
    }
    goto LABEL_38;
  }
  return 0;
}

void *AVMetadataMakeDependentSpecificationsForValue()
{
  v26[2] = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t DataTypesForIdentifiersOfFieldsOfDetectedFaces = AVMetadataItemGetDataTypesForIdentifiersOfFieldsOfDetectedFaces();
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v1 = *MEMORY[0x1E4F21810];
      uint64_t v2 = *MEMORY[0x1E4F1F058];
      uint64_t v3 = (uint64_t *)MEMORY[0x1E4F21818];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v1 = *MEMORY[0x1E4F217D0];
        uint64_t v2 = *MEMORY[0x1E4F1F058];
        uint64_t v3 = (uint64_t *)MEMORY[0x1E4F217D8];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v1 = *MEMORY[0x1E4F217E0];
          uint64_t v2 = *MEMORY[0x1E4F1F058];
          uint64_t v3 = (uint64_t *)MEMORY[0x1E4F217E8];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            return (void *)MEMORY[0x1E4F1CBF0];
          }
          uint64_t v1 = *MEMORY[0x1E4F21890];
          uint64_t v2 = *MEMORY[0x1E4F1F058];
          uint64_t v3 = (uint64_t *)MEMORY[0x1E4F21888];
        }
      }
    }
    uint64_t v4 = *v3;
    v25[0] = v1;
    v25[1] = v4;
    uint64_t v5 = *MEMORY[0x1E4F1F010];
    v26[0] = v2;
    v26[1] = v5;
    uint64_t DataTypesForIdentifiersOfFieldsOfDetectedFaces = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
  }
  uint64_t v6 = (void *)DataTypesForIdentifiersOfFieldsOfDetectedFaces;
  if (!DataTypesForIdentifiersOfFieldsOfDetectedFaces) {
    return (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  CGSize v8 = objc_msgSend(v6, "allKeys", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    uint64_t v12 = *MEMORY[0x1E4F1F108];
    uint64_t v13 = *MEMORY[0x1E4F1F0F8];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v16 = [v6 objectForKey:v15];
        v22[0] = v12;
        v22[1] = v13;
        v23[0] = v15;
        v23[1] = v16;
        objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v23, v22, 2));
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v10);
  }
  return v7;
}

uint64_t AVMetadataItemGetDataTypesForIdentifiersOfFieldsOfDetectedFaces()
{
  v7[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F1F058];
  uint64_t v1 = *MEMORY[0x1E4F217F0];
  v6[0] = *MEMORY[0x1E4F217F8];
  v6[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1F010];
  v7[0] = v0;
  v7[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1EFD0];
  uint64_t v4 = *MEMORY[0x1E4F21808];
  v6[2] = *MEMORY[0x1E4F21800];
  v6[3] = v4;
  v7[2] = v3;
  v7[3] = v3;
  return [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

uint64_t AVMetadataItemIdentifierForItemIndex()
{
  if (!FigBoxedMetadataGetLocalIDOfItemAtIndex()
    || (uint64_t result = FigMetadataFormatDescriptionGetIdentifierForLocalID()) == 0)
  {
    FigDebugAssert3();
    return 0;
  }
  return result;
}

__n128 AVMetadataItemBoundsFromBoxedMetadataForItemIndex(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  FigBoxedMetadataGetValueOfItemAtIndex();
  __n128 result = *(__n128 *)MEMORY[0x1E4F1DB20];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  *a3 = *MEMORY[0x1E4F1DB20];
  a3[1] = v5;
  return result;
}

uint64_t AVMetadataItemIDAndBoundsFromBoxedMetadata(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, _OWORD *a5)
{
  FigBoxedMetadataGetFormatDescription();
  uint64_t result = FigBoxedMetadataGetNumberOfItems();
  if (result >= 1)
  {
    for (uint64_t i = 0; i < result; ++i)
    {
      AVMetadataItemIdentifierForItemIndex();
      if (FigCFEqual())
      {
        *a4 = (int)FigBoxedMetadataGetValueOfItemAtIndexAsSInt32();
      }
      else if (FigCFEqual())
      {
        AVMetadataItemBoundsFromBoxedMetadataForItemIndex(a1, i, a5);
      }
      uint64_t result = FigBoxedMetadataGetNumberOfItems();
    }
  }
  return result;
}

uint64_t mfoNotificationHandler(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a2 handleNotification:a3 payload:a5];
}

void sub_1A15D0814(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A15D0D64(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A15D178C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A15D1ED0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A15D20E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A15D2EF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A15D2FDC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A15D359C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A15D3734(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A15D3BBC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A15D3F8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A15D4118(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A15D42AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A15D48A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A15D5040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_1A15D5EC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A15D5F30(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A15D6074(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A15D61E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL AVMetadataObjectAdjustBaseClassProperties(uint64_t a1, CGRect *a2, double a3, double a4, double a5, double a6)
{
  char v6 = vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f64(*(float64x2_t *)a1), (int8x16_t)vcgezq_f64(*(float64x2_t *)a1)), (int32x4_t)vorrq_s8((int8x16_t)vcltzq_f64(*(float64x2_t *)(a1 + 16)), (int8x16_t)vcgezq_f64(*(float64x2_t *)(a1 + 16)))))));
  if ((v6 & 1) == 0)
  {
    long long v8 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)&v10.a = *(_OWORD *)a1;
    *(_OWORD *)&v10.c = v8;
    *(_OWORD *)&v10.tdouble x = *(_OWORD *)(a1 + 32);
    CGRect v11 = CGRectApplyAffineTransform(*(CGRect *)&a3, &v10);
    if (a2) {
      *a2 = v11;
    }
  }
  return (v6 & 1) == 0;
}

void sub_1A15DCF50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __figBarcodeTypeToAVFMachineReadableCodeType_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t result = objc_msgSend(v0, "initWithObjectsAndKeys:", @"org.gs1.UPC-E", *MEMORY[0x1E4F94440], @"org.iso.Code39", *MEMORY[0x1E4F94380], @"org.iso.Code39Mod43", *MEMORY[0x1E4F94388], @"org.gs1.EAN-13", *MEMORY[0x1E4F943B8], @"org.gs1.EAN-8", *MEMORY[0x1E4F943C0], @"com.intermec.Code93", *MEMORY[0x1E4F943A0], @"org.iso.Code128", *MEMORY[0x1E4F94378], @"org.iso.QRCode", *MEMORY[0x1E4F94438], @"org.iso.Aztec",
             *MEMORY[0x1E4F94368],
             @"org.iso.PDF417",
             *MEMORY[0x1E4F94410],
             @"org.ansi.Interleaved2of5",
             *MEMORY[0x1E4F943E0],
             @"org.gs1.ITF14",
             *MEMORY[0x1E4F943F0],
             @"org.iso.DataMatrix",
             *MEMORY[0x1E4F943B0],
             @"Codabar",
             *MEMORY[0x1E4F94370],
             @"org.gs1.GS1DataBar",
             *MEMORY[0x1E4F943C8],
             @"org.gs1.GS1DataBarExpanded",
             *MEMORY[0x1E4F943D0],
             @"org.gs1.GS1DataBarLimited",
             *MEMORY[0x1E4F943D8],
             @"org.iso.MicroQR",
             *MEMORY[0x1E4F94408],
             @"org.iso.MicroPDF417",
             *MEMORY[0x1E4F94400],
             0);
  figBarcodeTypeToAVFMachineReadableCodeType_sFigBarcodeToAVFMRCTypes = result;
  return result;
}

void __Block_byref_object_copy__4(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_1A15DE524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A15DE78C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A15DEA78(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A15DF07C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A15DF5FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void avpds_proprietaryDefaultsSourceNotificationHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __avpds_proprietaryDefaultsSourceNotificationHandler_block_invoke;
  v7[3] = &unk_1E5A72D70;
  v7[4] = a3;
  void v7[5] = a5;
  Maiuint64_t n = CFRunLoopGetMain();
  CFRunLoopPerformBlock(Main, (CFTypeRef)*MEMORY[0x1E4F1D410], v7);
  char v6 = CFRunLoopGetMain();
  CFRunLoopWakeUp(v6);
}

void sub_1A15DFDFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

uint64_t __avpds_proprietaryDefaultsSourceNotificationHandler_block_invoke(uint64_t a1)
{
  id v2 = +[AVCaptureProprietaryDefaultsSingleton proprietaryDefaultsSingleton];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 _handleNotification:v3 payload:v4];
}

void *avcmcs_constituentDeviceFormatFromVirtualDeviceFormat(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = objc_msgSend(a2, "formats", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v4) {
    return a1;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v12;
LABEL_3:
  uint64_t v7 = 0;
  while (1)
  {
    if (*(void *)v12 != v6) {
      objc_enumerationMutation(v3);
    }
    long long v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
    int v9 = [v8 isVideoBinned];
    if (v9 == [a1 isVideoBinned])
    {
      if (CFEqual((CFTypeRef)[v8 formatDescription], (CFTypeRef)objc_msgSend(a1, "formatDescription"))) {
        return v8;
      }
    }
    if (v5 == ++v7)
    {
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        goto LABEL_3;
      }
      return a1;
    }
  }
}

double __avcmcs_computeSystemPressureCost_block_invoke()
{
  avcmcs_computeSystemPressureCost_allSlopes[0] = (uint64_t)&unk_1EF4FAA40;
  unk_1E95447C8 = xmmword_1A1636950;
  qword_1E95447D8 = 0x451C1000BE8F0D84;
  qword_1E95447E0 = &unk_1EF4FAA58;
  qword_1E95447E8 = 0x457A000000000000;
  qword_1E95447F0 = 0;
  unk_1E95447F8 = 0;
  qword_1E9544800 = &unk_1EF4FAA70;
  qword_1E9544808 = 0x459C400000000000;
  qword_1E9544810 = 0;
  unk_1E9544818 = 0;
  qword_1E9544820 = &unk_1EF4FAA88;
  unk_1E9544828 = xmmword_1A1636960;
  qword_1E9544838 = 0x45825000BFB9999ALL;
  qword_1E9544840 = &unk_1EF4FAAA0;
  unk_1E9544848 = xmmword_1A1636970;
  qword_1E9544858 = 0x45223666BF67F62BLL;
  qword_1E9544860 = &unk_1EF4FAAB8;
  unk_1E9544868 = xmmword_1A1636980;
  qword_1E9544878 = 0x4569D000BF88F5C3;
  qword_1E9544880 = &unk_1EF4FAAD0;
  qword_1E9544888 = 0x453B800000000000;
  double result = 0.0;
  xmmword_1E9544890 = 0u;
  unk_1E95448A0 = 0u;
  xmmword_1E95448B0 = 0u;
  return result;
}

uint64_t fvd_prioritizeUsingCameraHistory(void *a1, void *a2, void *a3, char a4, char a5, int a6, void *a7)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t result = [a1 count];
  if (result)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t result = [a3 countByEnumeratingWithState:&v22 objects:v26 count:16];
    uint64_t v20 = result;
    if (result)
    {
      uint64_t v19 = *(void *)v23;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(a3);
        }
        long long v13 = *(void **)(*((void *)&v22 + 1) + 8 * v12);
        if ([a1 count])
        {
          for (unint64_t i = 0; i < [a1 count]; ++i)
          {
            uint64_t v15 = (void *)[a1 objectAtIndexedSubscript:i];
            uint64_t v16 = v15;
            if (((a4 & 1) != 0 || ([v15 isSuspended] & 1) == 0)
              && ((a5 & 1) != 0 || [v16 specialDeviceType] != 1)
              && objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", @"DeviceUID"), "isEqualToString:", v16[10]))
            {
              if ([v16 specialDeviceType] == 2)
              {
                if (!a6) {
                  goto LABEL_22;
                }
              }
              else if ([v16 specialDeviceType] != 3 || (a6 & 1) == 0)
              {
LABEL_22:
                [a2 addObject:v16];
                [a1 removeObjectAtIndex:i];
                break;
              }
              if (fvd_deviceIsPresentInCameraList((uint64_t)v16, a7)) {
                goto LABEL_22;
              }
            }
          }
        }
        uint64_t result = [a1 count];
        if (!result) {
          break;
        }
        if (++v12 == v20)
        {
          uint64_t result = [a3 countByEnumeratingWithState:&v22 objects:v26 count:16];
          uint64_t v20 = result;
          if (result) {
            goto LABEL_4;
          }
          return result;
        }
      }
    }
  }
  return result;
}

void __Block_byref_object_copy__5(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_1A15E64C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A15E7F48(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A15E8290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A15E8664(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A15E8F90(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 88), 8);
  _Unwind_Resume(a1);
}

void sub_1A15E910C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A15E9638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 192), 8);
  _Block_object_dispose((const void *)(v39 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1A15E9954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Block_object_dispose((const void *)(v15 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A15EA508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A15EA94C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A15EAB10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A15EB45C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A15EBDD4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A15EC634(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A15ECAC0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A15ECF80(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A15ED15C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A15EDFA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52)
{
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose(&a48, 8);
  _Block_object_dispose(&a52, 8);
  _Block_object_dispose((const void *)(v52 - 232), 8);
  _Unwind_Resume(a1);
}

void sub_1A15EE22C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A15EE7D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A15EF26C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A15EFB90(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A15F0A24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A15F0BA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A15F0CC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A15F190C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A15F1E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A15F2C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_1A15F3F28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A15F5194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t fvd_deviceIsPresentInCameraList(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v9;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(a2);
        }
        if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7), "objectForKeyedSubscript:", @"DeviceUID"), "isEqualToString:", *(void *)(a1 + 80)))return 1; {
        ++v7;
        }
      }
      while (v5 != v7);
      uint64_t result = [a2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v5 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

float AVGestaltGetFloatAnswer(uint64_t a1)
{
  if (avgestalt_buildDataBase_onceToken != -1) {
    dispatch_once(&avgestalt_buildDataBase_onceToken, &__block_literal_global_17);
  }
  id v2 = (void *)[(id)sAVGestaltFloatDataBase objectForKeyedSubscript:a1];
  if (!v2) {
    return NAN;
  }

  [v2 floatValue];
  return result;
}

uint64_t AVGestaltGetStringAnswer(uint64_t a1)
{
  if (avgestalt_buildDataBase_onceToken != -1) {
    dispatch_once(&avgestalt_buildDataBase_onceToken, &__block_literal_global_17);
  }
  id v2 = (void *)sAVGestaltStringDataBase;

  return [v2 objectForKeyedSubscript:a1];
}

uint64_t AVGestaltGetBoolAnswerWithError(uint64_t a1, uint64_t *a2)
{
  if (avgestalt_buildDataBase_onceToken != -1) {
    dispatch_once(&avgestalt_buildDataBase_onceToken, &__block_literal_global_17);
  }
  uint64_t v4 = [(id)sAVGestaltBoolDataBase objectForKeyedSubscript:a1];
  uint64_t v5 = (void *)v4;
  if (a2)
  {
    if (v4) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:0];
    }
    *a2 = v6;
  }

  return [v5 BOOLValue];
}

uint64_t AVGestaltGetIntegerAnswerWithError(uint64_t a1, uint64_t *a2)
{
  if (avgestalt_buildDataBase_onceToken != -1) {
    dispatch_once(&avgestalt_buildDataBase_onceToken, &__block_literal_global_17);
  }
  uint64_t v4 = [(id)sAVGestaltIntegerDataBase objectForKeyedSubscript:a1];
  uint64_t v5 = (void *)v4;
  if (a2)
  {
    if (v4) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:0];
    }
    *a2 = v6;
  }

  return [v5 integerValue];
}

uint64_t AVGestaltGetFloatAnswerWithError(uint64_t a1, uint64_t *a2)
{
  if (avgestalt_buildDataBase_onceToken != -1) {
    dispatch_once(&avgestalt_buildDataBase_onceToken, &__block_literal_global_17);
  }
  uint64_t v4 = [(id)sAVGestaltFloatDataBase objectForKeyedSubscript:a1];
  uint64_t v5 = (void *)v4;
  if (a2)
  {
    if (v4) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:0];
    }
    *a2 = v6;
  }

  return [v5 floatValue];
}

uint64_t AVGestaltGetStringAnswerWithError(uint64_t a1, uint64_t *a2)
{
  if (avgestalt_buildDataBase_onceToken != -1) {
    dispatch_once(&avgestalt_buildDataBase_onceToken, &__block_literal_global_17);
  }
  uint64_t v4 = [(id)sAVGestaltStringDataBase objectForKeyedSubscript:a1];
  uint64_t v5 = v4;
  if (a2)
  {
    if (v4) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:0];
    }
    *a2 = v6;
  }
  return v5;
}

uint64_t AVGestaltGetBoolAnswerWithDefault(uint64_t a1, uint64_t a2)
{
  if (avgestalt_buildDataBase_onceToken != -1) {
    dispatch_once(&avgestalt_buildDataBase_onceToken, &__block_literal_global_17);
  }
  uint64_t v4 = (void *)[(id)sAVGestaltBoolDataBase objectForKeyedSubscript:a1];
  if (!v4) {
    return a2;
  }

  return [v4 BOOLValue];
}

BOOL AVGestaltIsQuestionValid(uint64_t a1, int *a2)
{
  if (avgestalt_buildDataBase_onceToken != -1) {
    dispatch_once(&avgestalt_buildDataBase_onceToken, &__block_literal_global_17);
  }
  if ([(id)sAVGestaltBoolDataBase objectForKeyedSubscript:a1])
  {
    int v4 = 0;
    goto LABEL_7;
  }
  if ([(id)sAVGestaltIntegerDataBase objectForKeyedSubscript:a1])
  {
    int v4 = 1;
LABEL_7:
    BOOL result = 1;
    if (!a2) {
      return result;
    }
    goto LABEL_8;
  }
  if ([(id)sAVGestaltFloatDataBase objectForKeyedSubscript:a1])
  {
    BOOL result = 1;
    int v4 = 2;
    if (!a2) {
      return result;
    }
LABEL_8:
    *a2 = v4;
    return result;
  }
  uint64_t v6 = [(id)sAVGestaltStringDataBase objectForKeyedSubscript:a1];
  BOOL v7 = v6 == 0;
  BOOL result = v6 != 0;
  if (v7) {
    int v4 = -1;
  }
  else {
    int v4 = 3;
  }
  if (a2) {
    goto LABEL_8;
  }
  return result;
}

uint64_t AVGestaltGetQuestions()
{
  if (avgestalt_buildDataBase_onceToken != -1) {
    dispatch_once(&avgestalt_buildDataBase_onceToken, &__block_literal_global_17);
  }
  id v0 = (void *)[(id)sAVGestaltBoolDataBase allKeys];
  uint64_t v1 = objc_msgSend(v0, "arrayByAddingObjectsFromArray:", objc_msgSend((id)sAVGestaltIntegerDataBase, "allKeys"));
  id v2 = objc_msgSend(v1, "arrayByAddingObjectsFromArray:", objc_msgSend((id)sAVGestaltFloatDataBase, "allKeys"));
  uint64_t v3 = [(id)sAVGestaltStringDataBase allKeys];

  return [v2 arrayByAddingObjectsFromArray:v3];
}

uint64_t AVCaptureDeferredPhotoIdentifierFromMakerNoteDictionary(void *a1)
{
  __int16 v2 = objc_msgSend((id)objc_msgSend(a1, "objectForKeyedSubscript:", @"25"), "unsignedIntValue");
  uint64_t v3 = [a1 objectForKeyedSubscript:@"32"];
  uint64_t v4 = [a1 objectForKeyedSubscript:@"43"];
  if ((v2 & 0x1000) == 0) {
    return 0;
  }
  if (!v3 || v4 == 0) {
    return 0;
  }
  else {
    return [NSString stringWithFormat:@"%@/%@", v3, v4];
  }
}

void sub_1A15F9668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
}

void __Block_byref_object_copy__6(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_1A15F9E98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

__CFString *avcdpp_failureReasonStringForErrorStatus(int a1)
{
  if (a1 + 16828) <= 8 && ((0x1DFu >> (a1 - 68))) {
    return (__CFString *)[NSString stringWithFormat:@" (reason: %@)", off_1E5A79948[a1 + 16828]];
  }
  else {
    return &stru_1EF4D21D0;
  }
}

void sub_1A15FA684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A15FABC8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A15FB0D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1A15FB8DC(_Unwind_Exception *a1)
{
}

uint64_t ado_notificationHandler(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a2 _handleNotification:a3 payload:a5];
}

void __Block_byref_object_copy__7(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_1A1601870(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A1601990(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A1601AD0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A1601CCC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A1601F48(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A16021A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A16023F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A1602B8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A160304C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A160336C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A1603690(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t vpl_rectToString(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"(%g,%g,%gx%g)", *(void *)&a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

void *avcmdo_allMetadataObjectTypesInCollections(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  __int16 v2 = (void *)[MEMORY[0x1E4F1CA80] set];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [a1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(a1);
        }
        objc_msgSend(v2, "unionSet:", objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "metadataObjectTypes"));
      }
      while (v4 != v6);
      uint64_t v4 = [a1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
  return v2;
}

unint64_t avcmdo_addCMTimeToHistoryForDetector(void *a1, long long *a2, uint64_t a3)
{
  uint64_t v6 = objc_msgSend(a1, "objectForKeyedSubscript:");
  if (!v6)
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA48] array];
    [a1 setObject:v6 forKeyedSubscript:a3];
  }
  long long v8 = *a2;
  uint64_t v9 = *((void *)a2 + 2);
  objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCMTime:", &v8));
  unint64_t result = [v6 count];
  if (result >= 3) {
    return [v6 removeObjectAtIndex:0];
  }
  return result;
}

void sub_1A16081E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A16085D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A1608E50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A1609088(_Unwind_Exception *exception_object)
{
}

void sub_1A1609158(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A16096A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A1609714(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A1609780(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A1609C44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id obj)
{
}

void sub_1A1609EA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A160A084(_Unwind_Exception *exception_object)
{
}

void sub_1A160A860(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A160AAE8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A160AB5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A160DAC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A160DE7C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A160E180(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A160E1E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A160E410(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A160E658(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A160E858(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A160EA20(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A160ECE8(_Unwind_Exception *exception_object)
{
}

void AVCaptureSessionSetXCTestClientAuthorizedToStealDevice(uint64_t a1)
{
  if (AVCaptureIsRunningInXCTest())
  {
    if (a1)
    {
      *(unsigned char *)(*(void *)(a1 + 8) + 225) = 1;
      return;
    }
    __int16 v2 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v3 = *MEMORY[0x1E4F1C3C8];
    uint64_t v4 = @"*** Can't pass a nil AVCaptureSession";
  }
  else
  {
    __int16 v2 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v3 = *MEMORY[0x1E4F1C3C8];
    uint64_t v4 = @"*** Not supported when running outside of xctest";
  }
  uint64_t v5 = (void *)[v2 exceptionWithName:v3 reason:v4 userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v5);
  }
  NSLog(&cfstr_SuppressingExc.isa, v5);
}

void sub_1A160F134(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A160F198(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A160F310(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A160F418(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A160F658(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t AVCapturePrewarm(uint64_t a1)
{
  uint64_t v2 = mach_absolute_time();
  uint64_t v3 = mach_continuous_time();

  return AVCapturePrewarmWithTime(a1, v2, v3);
}

uint64_t AVCapturePrewarmWithTime(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"AVCapturePrewarmUserInteractionAbsoluteTimeKey";
  v6[1] = @"AVCapturePrewarmUserInteractionContinuousTimeKey";
  v7[0] = [NSNumber numberWithUnsignedLongLong:a2];
  v7[1] = [NSNumber numberWithUnsignedLongLong:a3];
  return AVCapturePrewarmWithOptions(a1, (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2]);
}

uint64_t AVCaptureCancelPrewarm()
{
  return MEMORY[0x1F410D320]();
}

void sub_1A160FF80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__8(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_1A1610BD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A1610DD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t po_createPreviewJPEGRepresentationForSampleBuffer(uint64_t a1, uint64_t a2)
{
  return 0;
}

void sub_1A1613038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1613800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1A1613D7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A16140C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t po_notificationHandler(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a2 _handleNotification:a3 payload:a5];
}

void sub_1A1616304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a65, 8);
  _Unwind_Resume(a1);
}

uint64_t po_metadataWithMakerNoteProcessingFlags(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F2FC20];
  uint64_t v2 = @"25";
  uint64_t v3 = [NSNumber numberWithUnsignedInt:a1];
  v5[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v3 forKeys:&v2 count:1];
  return [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
}

BOOL po_allLivePhotoCallbacksHaveFinishedRecordingForRequest(void *a1)
{
  if (!objc_msgSend((id)objc_msgSend(a1, "resolvedSettings"), "livePhotoMovieEnabled")) {
    return 1;
  }
  int v2 = objc_msgSend((id)objc_msgSend(a1, "resolvedSettings"), "isEV0PhotoDeliveryEnabled");
  uint64_t v3 = objc_msgSend((id)objc_msgSend(a1, "resolvedSettings"), "spatialOverCapturePhotoDimensions");
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a1, "unresolvedSettings"), "livePhotoMovieFileURL");
  int v5 = v4 != 0;
  if (v2)
  {
    uint64_t v6 = v4;
    uint64_t v7 = objc_msgSend((id)objc_msgSend(a1, "unresolvedSettings"), "livePhotoMovieFileURLForOriginalPhoto");
    int v8 = v6 ? 2 : 1;
    if (v7) {
      int v5 = v8;
    }
  }
  if (v3)
  {
    if (objc_msgSend((id)objc_msgSend(a1, "unresolvedSettings"), "spatialOverCaptureLivePhotoMovieFileURL")) {
      ++v5;
    }
    if (v2)
    {
      if (objc_msgSend((id)objc_msgSend(a1, "unresolvedSettings"), "spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto"))
      {
        ++v5;
      }
    }
  }
  unsigned int v9 = ([a1 firedCallbackFlags] >> 7) & 1;
  unsigned int v10 = (([a1 firedCallbackFlags] >> 5) & 1) + v9;
  unsigned int v11 = ([a1 firedCallbackFlags] >> 8) & 1;
  return v10 + v11 + (([a1 firedCallbackFlags] >> 6) & 1) == v5;
}

uint64_t __po_photoSettingsAreValid_block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 112), "containsObject:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "flashMode")));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "containsObject:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "HDRMode")));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 104);
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "containsObject:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "digitalFlashMode")));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = result;
  return result;
}

AVCaptureReactionType _AVControlCenterGetAVCaptureReactionTypeForPTEffectReactionType(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      uint64_t v1 = &AVCaptureReactionTypeConfetti;
      goto LABEL_11;
    case 1:
      uint64_t v1 = &AVCaptureReactionTypeThumbsUp;
      goto LABEL_11;
    case 2:
      uint64_t v1 = &AVCaptureReactionTypeThumbsDown;
      goto LABEL_11;
    case 3:
      uint64_t v1 = &AVCaptureReactionTypeBalloons;
      goto LABEL_11;
    case 4:
      uint64_t v1 = &AVCaptureReactionTypeFireworks;
      goto LABEL_11;
    case 5:
      uint64_t v1 = &AVCaptureReactionTypeRain;
      goto LABEL_11;
    case 6:
      uint64_t v1 = &AVCaptureReactionTypeHeart;
      goto LABEL_11;
    case 7:
      uint64_t v1 = &AVCaptureReactionTypeLasers;
LABEL_11:
      AVCaptureReactionType result = *v1;
      break;
    default:
      AVCaptureReactionType result = 0;
      break;
  }
  return result;
}

void AVControlCenterModulesPrewarm()
{
  if (AVControlCenterModulesPrewarm_onceToken != -1) {
    dispatch_once(&AVControlCenterModulesPrewarm_onceToken, &__block_literal_global_431);
  }
}

id __AVControlCenterModulesPrewarm_block_invoke()
{
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work_cf();
  fig_note_initialize_category_with_default_work_cf();
  sModuleStatesByBundleID = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (dword_1EB4C9160)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  sCaptureDeviceWatcher = [[AVControlCenterCaptureDeviceWatcher alloc] initWithSupportedVideoEffectsDidChangeHandler:&__block_literal_global_441];
  return +[AVCaptureProprietaryDefaultsSingleton objectForKey:@"warmup"];
}

void __AVControlCenterModulesPrewarm_block_invoke_438(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)&sModuleStatesLock);
  unsigned int v11 = objc_msgSend((id)objc_msgSend((id)sModuleStatesByBundleID, "allValues"), "copy");
  os_unfair_lock_unlock((os_unfair_lock_t)&sModuleStatesLock);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v15++) updateCenterStageSupported:a2 backgroundBlurSupported:a3 studioLightingSupported:a4 reactionEffectsSupported:a5 backgroundReplacementSupported:a6];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

uint64_t AVControlCenterPreferencesDomainForCurrentProcess()
{
  id v0 = AVCaptureClientPreferencesDomain();

  return AVControlCenterPreferencesDomainForPreferencesDomain(v0);
}

uint64_t AVControlCenterAudioPreferencesKeyPrefix(__CFString *a1)
{
  if (!a1) {
    a1 = @"unknown";
  }
  uint64_t v1 = [(__CFString *)a1 stringByReplacingOccurrencesOfString:@"." withString:@"-"];
  return [NSString stringWithFormat:@"AUVoiceIOClients/%@/", v1];
}

uint64_t AVControlCenterVideoEffectsModuleIsEffectSupportedForBundleID(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [_AVControlCenterModuleStateForBundleID(a2) supportsVideoEffect:a1];
  if (dword_1EB4C9160)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v2;
}

uint64_t AVControlCenterVideoEffectsModuleGetEffectControlModeForBundleID(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [_AVControlCenterModuleStateForBundleID(a2) controlModeForVideoEffect:a1];
  if (dword_1EB4C9160)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v2;
}

uint64_t AVControlCenterVideoEffectsModuleIsEffectEnabledForBundleID(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [_AVControlCenterModuleStateForBundleID(a2) isEnabledForVideoEffect:a1];
  if (dword_1EB4C9160)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v2;
}

uint64_t AVControlCenterVideoEffectsModuleSetEffectEnabledForBundleID(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = [_AVControlCenterModuleStateForBundleID(a3) setEnabled:a2 forVideoEffect:a1];
  if (dword_1EB4C9160)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v3;
}

uint64_t AVControlCenterVideoEffectsModulePerformReactionEffect(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = objc_msgSend(_AVControlCenterModuleStateForBundleID(a2), "performReactionEffect:forCaptureDeviceWithID:", a1, objc_msgSend(a3, "uniqueID"));
  if (dword_1EB4C9160)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t AVControlCenterVideoEffectsModuleUpdateActiveReactions(uint64_t a1, CMTime *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v9 = _AVControlCenterModuleStateForBundleID(a4);
  uint64_t v10 = [a5 uniqueID];
  CMTime time = *a2;
  uint64_t result = [v9 updateActiveReactions:a1 currentRenderPTS:&time requestedTriggers:a3 forCaptureDeviceWithID:v10];
  if (dword_1EB4C9160)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t AVControlCenterVideoEffectsObserveGesturesDefaultDisabled(uint64_t a1)
{
  if (AVControlCenterVideoEffectsObserveGesturesDefaultDisabled_onceToken != -1) {
    dispatch_once(&AVControlCenterVideoEffectsObserveGesturesDefaultDisabled_onceToken, &__block_literal_global_480);
  }
  uint64_t v2 = AVControlCenterVideoEffectsRequestGesturesDefaultDisabledNotificationPreferenceKey();
  uint64_t v3 = AVControlCenterVideoEffectsObserveGesturesDefaultDisabled_sObserver;
  if (a1)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    void v5[2] = __AVControlCenterVideoEffectsObserveGesturesDefaultDisabled_block_invoke_2;
    void v5[3] = &unk_1E5A7A2A0;
    void v5[4] = a1;
    return +[AVCaptureProprietaryDefaultsSingleton addObserver:AVControlCenterVideoEffectsObserveGesturesDefaultDisabled_sObserver forKey:v2 callHandlerForInitialValue:0 defaultChangedHandler:v5];
  }
  else
  {
    return +[AVCaptureProprietaryDefaultsSingleton removeObserver:v3 forKey:v2];
  }
}

id __AVControlCenterVideoEffectsObserveGesturesDefaultDisabled_block_invoke()
{
  id result = objc_alloc_init(MEMORY[0x1E4FBA8A8]);
  AVControlCenterVideoEffectsObserveGesturesDefaultDisabled_sObserver = (uint64_t)result;
  return result;
}

void __AVControlCenterVideoEffectsObserveGesturesDefaultDisabled_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v15[23] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      HaveShownGesturesDefaultDisabledNotificationPreferenceKedouble y = AVControlCenterVideoEffectsHaveShownGesturesDefaultDisabledNotificationPreferenceKey(a3);
      id v6 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:HaveShownGesturesDefaultDisabledNotificationPreferenceKey];
      if (v6
        && (uint64_t v7 = v6, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && [v7 BOOLValue])
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      else
      {
        v15[0] = 0;
        id v9 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:a3 allowPlaceholder:1 error:v15];
        if (!v9)
        {
          uint64_t v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        int v11 = (*(uint64_t (**)(void, void *, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a3, objc_msgSend(v9, "localizedName", v13, v14));
        uint64_t v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        if (v11) {
          +[AVCaptureProprietaryDefaultsSingleton setObject:MEMORY[0x1E4F1CC38] forKey:HaveShownGesturesDefaultDisabledNotificationPreferenceKey];
        }
      }
    }
  }
}

uint64_t AVControlCenterIsManualFramingEnabledForDevice(void *a1)
{
  id v2 = _AVControlCenterModuleStateForBundleID([a1 uniqueID]);

  return [v2 manualFramingEnabledForDevice:a1];
}

uint64_t AVControlCenterStartPanningAtPoint(void *a1, double a2, double a3)
{
  id v5 = _AVControlCenterModuleStateForBundleID([a1 uniqueID]);

  return objc_msgSend(v5, "startPanningAtPoint:", a2, a3);
}

uint64_t AVControlCenterPanWithTranslation(void *a1, double a2, double a3)
{
  id v5 = _AVControlCenterModuleStateForBundleID([a1 uniqueID]);

  return objc_msgSend(v5, "panWithTranslation:", a2, a3);
}

double AVControlCenterManualFramingMaxAvailableVideoZoomFactor(void *a1)
{
  uint64_t v1 = [a1 uniqueID];
  _AVControlCenterModulesGetConvertedManualFramingVideoZoomFactorConstant(v1, *MEMORY[0x1E4F51000]);
  double v3 = v2;
  if (dword_1EB4C9160)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v3;
}

uint64_t _AVControlCenterModulesGetConvertedManualFramingVideoZoomFactorConstant(uint64_t a1, uint64_t a2)
{
  id v3 = _AVControlCenterModuleStateForBundleID(a1);
  uint64_t v4 = (void *)[v3 zoomFactorConstantsByManualFramingDeviceType];
  [(id)objc_msgSend((id)objc_msgSend(v4 objectForKeyedSubscript:objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v3, "manualFramingDeviceType"))), "objectForKeyedSubscript:", a2), "floatValue"];
  return [v3 manualFramingDeviceType];
}

double AVControlCenterManualFramingMinAvailableVideoZoomFactor(void *a1)
{
  uint64_t v1 = [a1 uniqueID];
  _AVControlCenterModulesGetConvertedManualFramingVideoZoomFactorConstant(v1, *MEMORY[0x1E4F51008]);
  double v3 = v2;
  if (dword_1EB4C9160)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v3;
}

uint64_t AVControlCenterManualFramingSetVideoZoomFactor(void *a1, double a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = _AVControlCenterModuleStateForBundleID([a1 uniqueID]);
  double v5 = AVControlCenterManualFramingMinAvailableVideoZoomFactor(a1);
  double v6 = AVControlCenterManualFramingMaxAvailableVideoZoomFactor(a1);
  if (v5 > a2 || v6 < a2)
  {
    uint64_t v11 = [NSString stringWithFormat:@"Invalid videoZoomFactor %.3f. Valid range: [%.3f, %.3f]", *(void *)&a2, *(void *)&v5, *(void *)&v6];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v11 userInfo:0]);
  }
  if (objc_msgSend(v4, "manualFramingDeviceType", v6) == 2) {
    double v8 = a2 + a2;
  }
  else {
    double v8 = a2;
  }
  if (dword_1EB4C9160)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return objc_msgSend(v4, "setManualFramingOriginalZoomFactor:convertedZoomFactor:", a2, v8, v12, v13);
}

double AVControlCenterManualFramingGetVideoZoomFactor(void *a1)
{
  objc_msgSend(_AVControlCenterModuleStateForBundleID(objc_msgSend(a1, "uniqueID")), "manualFramingOriginalVideoZoomFactor");
  double v2 = v1;
  if (dword_1EB4C9160)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v2;
}

uint64_t AVControlCenterPerformOneShotFraming(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C9160)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return objc_msgSend(_AVControlCenterModuleStateForBundleID(objc_msgSend(a1, "uniqueID", v4, v5)), "performOneShotFraming");
}

uint64_t AVControlCenterResetFraming(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C9160)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return objc_msgSend(_AVControlCenterModuleStateForBundleID(objc_msgSend(a1, "uniqueID", v4, v5)), "resetFraming");
}

uint64_t AVControlCenterManualFramingIsAtDefaultForDevice(void *a1)
{
  uint64_t v1 = objc_msgSend(_AVControlCenterModuleStateForBundleID(objc_msgSend(a1, "uniqueID")), "manualFramingIsAtDefault");
  if (dword_1EB4C9160)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v1;
}

uint64_t AVControlCenterCenterStageFieldOfViewRestrictedToWideForDevice(void *a1)
{
  uint64_t v1 = objc_msgSend(_AVControlCenterModuleStateForBundleID(objc_msgSend(a1, "uniqueID")), "centerStageFieldOfViewRestrictedToWide");
  if (dword_1EB4C9160)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v1;
}

uint64_t AVControlCenterCenterStageSetFieldOfViewRestrictedToWideForDevice(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C9160)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return objc_msgSend(_AVControlCenterModuleStateForBundleID(objc_msgSend(a2, "uniqueID", v6, v7)), "setCenterStageFieldOfViewRestrictedToWide:", a1);
}

uint64_t AVControlCenterDeviceHasWideCamera()
{
  return 0;
}

uint64_t AVControlCenterDeviceHasUltraWideCamera()
{
  return 0;
}

uint64_t AVControlCenterGetManualFramingDeviceType(void *a1)
{
  uint64_t v1 = objc_msgSend(_AVControlCenterModuleStateForBundleID(objc_msgSend(a1, "uniqueID")), "manualFramingDeviceType");
  if (dword_1EB4C9160)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v1;
}

uint64_t AVControlCenterSetManualFramingDeviceType(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C9160)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return objc_msgSend(_AVControlCenterModuleStateForBundleID(objc_msgSend(a2, "uniqueID", v6, v7)), "setManualFramingDeviceType:", a1);
}

double AVControlCenterGetManualFramingDefaultZoomFactorForDevice()
{
  return 1.0;
}

uint64_t AVControlCenterVideoEffectsModuleGetUnavailableReasons(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [_AVControlCenterModuleStateForBundleID(a2) unavailableReasonsForVideoEffect:a1];
  if (dword_1EB4C9160)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v2;
}

uint64_t AVControlCenterVideoEffectsModuleIsEffectIntensitySupportedForDevice(void *a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([a1 isEqualToString:@"AVControlCenterVideoEffectBackgroundBlur"]
    && (long long v22 = 0u,
        long long v23 = 0u,
        long long v20 = 0u,
        long long v21 = 0u,
        uint64_t v4 = (void *)[a2 formats],
        (uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16]) != 0))
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v20 + 1) + 8 * i) isBackgroundBlurApertureSupported])
        {
          uint64_t v9 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
      uint64_t v9 = 0;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
LABEL_13:
  if ([a1 isEqualToString:@"AVControlCenterVideoEffectStudioLighting"])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v10 = objc_msgSend(a2, "formats", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      while (2)
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          if ([*(id *)(*((void *)&v16 + 1) + 8 * j) isStudioLightingIntensitySupported]) {
            return 1;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
  }
  return v9;
}

uint64_t AVControlCenterVideoEffectsModuleGetEffectIntensityForBundleID(uint64_t a1, uint64_t a2)
{
  id v3 = _AVControlCenterModuleStateForBundleID(a2);

  return [v3 getEffectIntensityForVideoEffect:a1];
}

uint64_t AVControlCenterVideoEffectsModuleSetEffectIntensityForBundleID(uint64_t a1, uint64_t a2, float a3)
{
  id v5 = _AVControlCenterModuleStateForBundleID(a2);
  *(float *)&double v6 = a3;

  return [v5 setEffectIntensityForVideoEffect:a1 forVideoEffect:v6];
}

uint64_t AVControlCenterVideoEffectsModuleGetEffectIntensityRangeForBundleID(uint64_t a1, uint64_t a2)
{
  id v3 = _AVControlCenterModuleStateForBundleID(a2);

  return [v3 getEffectIntensityRangeForVideoEffect:a1];
}

uint64_t AVControlCenterVideoEffectsModuleGetEffectIntensityDefaultValueForBundleID(uint64_t a1, uint64_t a2)
{
  id v3 = _AVControlCenterModuleStateForBundleID(a2);

  return [v3 getEffectIntensityDefaultForVideoEffect:a1];
}

uint64_t AVControlCenterBlackenFramesFromDeviceForBundleID(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = _AVControlCenterModuleStateForBundleID(a3);
  uint64_t v6 = [a2 uniqueID];

  return [v5 enableBlackenFrames:a1 forDeviceUID:v6];
}

uint64_t AVControlCenterMicrophoneModesModuleGetSupportedMicrophoneModesForBundleID(uint64_t a1)
{
  uint64_t v1 = [_AVControlCenterModuleStateForBundleID(a1) supportedMicrophoneModes];
  if (dword_1EB4C9160)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v1;
}

uint64_t AVControlCenterMicrophoneModesModuleGetMicrophoneModeForBundleID(uint64_t a1)
{
  uint64_t v1 = [_AVControlCenterModuleStateForBundleID(a1) microphoneMode];
  if (dword_1EB4C9160)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v1;
}

uint64_t AVControlCenterMicrophoneModesModuleGetActiveMicrophoneModeForBundleID(uint64_t a1)
{
  uint64_t v1 = [_AVControlCenterModuleStateForBundleID(a1) activeMicrophoneMode];
  if (dword_1EB4C9160)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v1;
}

uint64_t AVControlCenterMicrophoneModesModuleGetHiddenMicrophoneModesForBundleID(uint64_t a1)
{
  uint64_t v1 = [_AVControlCenterModuleStateForBundleID(a1) hiddenMicrophoneModes];
  if (dword_1EB4C9160)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v1;
}

uint64_t AVControlCenterMicrophoneModesModuleSetMicrophoneModeForBundleID(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [_AVControlCenterModuleStateForBundleID(a2) setMicrophoneMode:a1];
  if (dword_1EB4C9160)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v2;
}

uint64_t AVControlCenterMicrophoneModesModuleIsVoiceProcessingBypassedForBundleID(uint64_t a1)
{
  uint64_t v1 = [_AVControlCenterModuleStateForBundleID(a1) voiceProcessingBypassed];
  if (dword_1EB4C9160)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v1;
}

uint64_t AVControlCenterMicrophoneModesModuleIsAutoSupportedForBundleID(uint64_t a1)
{
  uint64_t v1 = [_AVControlCenterModuleStateForBundleID(a1) isAutoMicrophoneModeSupported];
  if (dword_1EB4C9160)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v1;
}

uint64_t AVControlCenterMicrophoneModesModuleIsAutoEnabledForBundleID(uint64_t a1)
{
  uint64_t v1 = [_AVControlCenterModuleStateForBundleID(a1) isAutoMicrophoneModeEnabled];
  if (dword_1EB4C9160)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v1;
}

uint64_t AVControlCenterMicrophoneModesModuleSetAutoEnabledForBundleID(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [_AVControlCenterModuleStateForBundleID(a2) setAutoMicrophoneModeEnabled:a1];
  if (dword_1EB4C9160)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v2;
}

void fad_figCaptureSourceNotificationHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  void block[2] = __fad_figCaptureSourceNotificationHandler_block_invoke;
  block[3] = &unk_1E5A731E0;
  block[4] = a2;
  block[5] = a3;
  block[6] = a5;
  Maiuint64_t n = CFRunLoopGetMain();
  CFRunLoopPerformBlock(Main, (CFTypeRef)*MEMORY[0x1E4F1D410], block);
  uint64_t v6 = CFRunLoopGetMain();
  CFRunLoopWakeUp(v6);
}

void __Block_byref_object_copy__9(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

uint64_t __fad_figCaptureSourceNotificationHandler_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleNotification:*(void *)(a1 + 40) payload:*(void *)(a1 + 48)];
}

void getUISSystemReferenceAngleChangedNotification_cold_1()
{
  id v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "NSString *getUISSystemReferenceAngleChangedNotification(void)"), @"AVCaptureDeviceRotationCoordinator.m", 46, @"%s", dlerror());
  __break(1u);
}

void UIKitServicesLibrary_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *UIKitServicesLibrary(void)"), @"AVCaptureDeviceRotationCoordinator.m", 44, @"%s", *a1);
  __break(1u);
}

void __getFBSOrientationObserverClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *FrontBoardServicesLibrary(void)"), @"AVCaptureDeviceRotationCoordinator.m", 40, @"%s", *a1);
  __break(1u);
}

void __getFBSOrientationObserverClass_block_invoke_cold_2()
{
  id v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getFBSOrientationObserverClass(void)_block_invoke"), @"AVCaptureDeviceRotationCoordinator.m", 41, @"Unable to find class %s", "FBSOrientationObserver");
  __break(1u);
}

void __getADJasperPointCloudClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *AppleDepthLibrary(void)"), @"AVPointCloudData.m", 26, @"%s", *a1);
  __break(1u);
}

void __getADJasperPointCloudClass_block_invoke_cold_2()
{
  id v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getADJasperPointCloudClass(void)_block_invoke"), @"AVPointCloudData.m", 28, @"Unable to find class %s", "ADJasperPointCloud");
  __break(1u);
}

void __getCMContinuityCaptureCapabilitiesClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *CMContinuityCaptureCoreLibrary(void)"), @"AVCaptureDevice.m", 75, @"%s", *a1);
  __break(1u);
}

void __getCMContinuityCaptureCapabilitiesClass_block_invoke_cold_2()
{
  id v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getCMContinuityCaptureCapabilitiesClass(void)_block_invoke"), @"AVCaptureDevice.m", 76, @"Unable to find class %s", "CMContinuityCaptureCapabilities");
  __break(1u);
}

uint64_t AVErrorForClientProgrammingError()
{
  return MEMORY[0x1F4105BF8]();
}

uint64_t AVLocalizedError()
{
  return MEMORY[0x1F4105C00]();
}

uint64_t AVLocalizedErrorWithUnderlyingOSStatus()
{
  return MEMORY[0x1F4105C08]();
}

uint64_t AVLocalizedStringFromTableWithBundleIdentifier()
{
  return MEMORY[0x1F4105C18]();
}

CGRect AVMakeRectWithAspectRatioInsideRect(CGSize aspectRatio, CGRect boundingRect)
{
  MEMORY[0x1F4105C20]((__n128)aspectRatio, *(__n128 *)&aspectRatio.height, (__n128)boundingRect.origin, *(__n128 *)&boundingRect.origin.y, (__n128)boundingRect.size, *(__n128 *)&boundingRect.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

uint64_t AVMethodExceptionReasonWithClassAndSelector()
{
  return MEMORY[0x1F4105C28]();
}

uint64_t AVMethodExceptionReasonWithObjectAndSelector()
{
  return MEMORY[0x1F4105C30]();
}

uint64_t AVOSTypeForString()
{
  return MEMORY[0x1F4105C38]();
}

uint64_t AVRequestConcreteImplementation()
{
  return MEMORY[0x1F4105C40]();
}

uint64_t AVRequireConcreteObject()
{
  return MEMORY[0x1F4105C48]();
}

uint64_t AVStringForOSType()
{
  return MEMORY[0x1F4105C50]();
}

void AudioServicesPlaySystemSoundWithCompletion(SystemSoundID inSystemSoundID, void *inCompletionBlock)
{
}

uint64_t AudioServicesPlaySystemSoundWithOptions()
{
  return MEMORY[0x1F40D4E48]();
}

CATransform3D *__cdecl CATransform3DRotate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1F40F4D48](retstr, t, angle, x, y, z);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1F40D7818](allocator, bytes, length, bytesDeallocator);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F28](allocator, propertyList, mutabilityOption);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1F40D83F0](alloc, theString);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x1F40D84C8](theString, stringToFind, compareOptions);
  result.length = v4;
  result.locatiouint64_t n = v3;
  return result;
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1F40D8A28](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1F40D8A68](userNotification, responseFlags, timeout);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97A8](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

uint64_t CGImageCreateEXIFJPEGData()
{
  return MEMORY[0x1F40E96D0]();
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9738](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

CGImageMetadataTagRef CGImageMetadataCopyTagWithPath(CGImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path)
{
  return (CGImageMetadataTagRef)MEMORY[0x1F40E9798](metadata, parent, path);
}

CGMutableImageMetadataRef CGImageMetadataCreateMutable(void)
{
  return (CGMutableImageMetadataRef)MEMORY[0x1F40E97C8]();
}

BOOL CGImageMetadataRegisterNamespaceForPrefix(CGMutableImageMetadataRef metadata, CFStringRef xmlns, CFStringRef prefix, CFErrorRef *err)
{
  return MEMORY[0x1F40E9810](metadata, xmlns, prefix, err);
}

BOOL CGImageMetadataSetTagWithPath(CGMutableImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path, CGImageMetadataTagRef tag)
{
  return MEMORY[0x1F40E9820](metadata, parent, path, tag);
}

CFTypeRef CGImageMetadataTagCopyValue(CGImageMetadataTagRef tag)
{
  return (CFTypeRef)MEMORY[0x1F40E9850](tag);
}

CGImageMetadataTagRef CGImageMetadataTagCreate(CFStringRef xmlns, CFStringRef prefix, CFStringRef name, CGImageMetadataType type, CFTypeRef value)
{
  return (CGImageMetadataTagRef)MEMORY[0x1F40E9858](xmlns, prefix, name, *(void *)&type, value);
}

CGImageMetadataType CGImageMetadataTagGetType(CGImageMetadataTagRef tag)
{
  return MEMORY[0x1F40E9860](tag);
}

CFTypeID CGImageMetadataTagGetTypeID(void)
{
  return MEMORY[0x1F40E9868]();
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB200]((__n128)point, *(__n128 *)&point.y);
}

BOOL CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGPoint *point)
{
  return MEMORY[0x1F40DB210](dict, point);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB230]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB238]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x1F40DB2E0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x1F40DB2F0](dict, rect);
}

CGRect CGRectStandardize(CGRect rect)
{
  MEMORY[0x1F40DB300]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.double y = v2;
  result.origin.double x = v1;
  return result;
}

CFDictionaryRef CGSizeCreateDictionaryRepresentation(CGSize size)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB4C8]((__n128)size, *(__n128 *)&size.height);
}

BOOL CGSizeMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGSize *size)
{
  return MEMORY[0x1F40DB4E0](dict, size);
}

const AudioChannelLayout *__cdecl CMAudioFormatDescriptionGetChannelLayout(CMAudioFormatDescriptionRef desc, size_t *sizeOut)
{
  return (const AudioChannelLayout *)MEMORY[0x1F40DB8A0](desc, sizeOut);
}

const AudioStreamBasicDescription *__cdecl CMAudioFormatDescriptionGetStreamBasicDescription(CMAudioFormatDescriptionRef desc)
{
  return (const AudioStreamBasicDescription *)MEMORY[0x1F40DB8D8](desc);
}

uint64_t CMBaseObjectGetVTable()
{
  return MEMORY[0x1F40DB920]();
}

OSStatus CMBlockBufferCreateContiguous(CFAllocatorRef structureAllocator, CMBlockBufferRef sourceBuffer, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1F40DB970](structureAllocator, sourceBuffer, blockAllocator, customBlockSource, offsetToData, dataLength, *(void *)&flags, blockBufferOut);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1F40DB988](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(void *)&flags);
}

size_t CMBlockBufferGetDataLength(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x1F40DB998](theBuffer);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x1F40DB9A0](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

CMClockRef CMClockGetHostTimeClock(void)
{
  return (CMClockRef)MEMORY[0x1F40DBB30]();
}

CMTime *__cdecl CMClockGetTime(CMTime *__return_ptr retstr, CMClockRef clock)
{
  return (CMTime *)MEMORY[0x1F40DBB38](retstr, clock);
}

CFDictionaryRef CMCopyDictionaryOfAttachments(CFAllocatorRef allocator, CMAttachmentBearerRef target, CMAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x1F40DBB70](allocator, target, *(void *)&attachmentMode);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1F40DBBC8](desc);
}

CMMediaType CMFormatDescriptionGetMediaType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1F40DBBD0](desc);
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x1F40DBBF0](target, key, attachmentModeOut);
}

OSStatus CMMetadataFormatDescriptionCreateByMergingMetadataFormatDescriptions(CFAllocatorRef allocator, CMMetadataFormatDescriptionRef sourceDescription, CMMetadataFormatDescriptionRef otherSourceDescription, CMMetadataFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DBC60](allocator, sourceDescription, otherSourceDescription, formatDescriptionOut);
}

OSStatus CMMetadataFormatDescriptionCreateWithMetadataSpecifications(CFAllocatorRef allocator, CMMetadataFormatType metadataType, CFArrayRef metadataSpecifications, CMMetadataFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DBC80](allocator, *(void *)&metadataType, metadataSpecifications, formatDescriptionOut);
}

CFArrayRef CMMetadataFormatDescriptionGetIdentifiers(CMMetadataFormatDescriptionRef desc)
{
  return (CFArrayRef)MEMORY[0x1F40DBC88](desc);
}

uint64_t CMNotificationCenterGetDefaultLocalCenter()
{
  return MEMORY[0x1F40DBCB8]();
}

uint64_t CMNotificationCenterPostNotification()
{
  return MEMORY[0x1F40DBCC0]();
}

uint64_t CMPhotoCompressionCreateDataContainerFromImage()
{
  return MEMORY[0x1F410D4F8]();
}

uint64_t CMPhotoCompressionSessionAddAuxiliaryImage()
{
  return MEMORY[0x1F410D510]();
}

uint64_t CMPhotoCompressionSessionAddMetadataFromImageProperties()
{
  return MEMORY[0x1F410D588]();
}

uint64_t CMPhotoCompressionSessionAddThumbnail()
{
  return MEMORY[0x1F410D590]();
}

uint64_t CMPhotoCompressionSessionCloseContainerAndCopyBacking()
{
  return MEMORY[0x1F410D5B0]();
}

uint64_t CMPhotoCompressionSessionCreate()
{
  return MEMORY[0x1F410D5B8]();
}

uint64_t CMPhotoCompressionSessionInvalidate()
{
  return MEMORY[0x1F410D5E0]();
}

uint64_t CMPhotoCompressionSessionOpenExistingContainerForModification()
{
  return MEMORY[0x1F410D600]();
}

uint64_t CMPhotoDNGCompressorAddAuxiliaryImage()
{
  return MEMORY[0x1F410D650]();
}

uint64_t CMPhotoDNGCompressorCreateFromSourceDNGWithModificationHandler()
{
  return MEMORY[0x1F410D668]();
}

uint64_t CMPhotoDNGCompressorFinalizeAndCreateData()
{
  return MEMORY[0x1F410D670]();
}

uint64_t CMPhotoDNGCompressorReplaceMainImageOptions()
{
  return MEMORY[0x1F410D698]();
}

uint64_t CMPhotoDNGCompressorReplaceMainImageProperties()
{
  return MEMORY[0x1F410D6A0]();
}

uint64_t CMPhotoDNGCompressorSetCompressedPreviewImage()
{
  return MEMORY[0x1F410D6A8]();
}

uint64_t CMPhotoDNGCompressorSetPreviewImage()
{
  return MEMORY[0x1F410D6B8]();
}

uint64_t CMPhotoDNGCompressorSetPreviewImageFromRAW()
{
  return MEMORY[0x1F410D6C0]();
}

uint64_t CMPhotoDNGCreateDNGFromRAWPixelBuffer()
{
  return MEMORY[0x1F410D6E0]();
}

uint64_t CMPhotoDNGCreateDNGFromRAWPixelBufferAndAuxiliaryImage()
{
  return MEMORY[0x1F410D6E8]();
}

uint64_t CMPhotoDNGUnpack()
{
  return MEMORY[0x1F410D700]();
}

uint64_t CMPhotoDecompressionContainerCopyAuxiliaryImageMetadataForIndex()
{
  return MEMORY[0x1F410D730]();
}

uint64_t CMPhotoDecompressionContainerCopyAuxiliaryImageTypeURNForIndex()
{
  return MEMORY[0x1F410D748]();
}

uint64_t CMPhotoDecompressionContainerCreateAuxiliaryImageForIndex()
{
  return MEMORY[0x1F410D7C0]();
}

uint64_t CMPhotoDecompressionContainerGetAuxiliaryImageCountForIndex()
{
  return MEMORY[0x1F410D850]();
}

uint64_t CMPhotoDecompressionContainerGetAuxiliaryImageTypeForIndex()
{
  return MEMORY[0x1F410D878]();
}

uint64_t CMPhotoDecompressionContainerGetImageCount()
{
  return MEMORY[0x1F410D8A0]();
}

uint64_t CMPhotoDecompressionSessionCreate()
{
  return MEMORY[0x1F410D960]();
}

uint64_t CMPhotoDecompressionSessionCreateContainer()
{
  return MEMORY[0x1F410D968]();
}

uint64_t CMPhotoDetermineMIAFCompliantThumbnailMaxPixelSize()
{
  return MEMORY[0x1F410DA10]();
}

uint64_t CMPointCloudFormatDescriptionGetNumberOfPoints()
{
  return MEMORY[0x1F40DBCF0]();
}

void CMRemoveAttachment(CMAttachmentBearerRef target, CFStringRef key)
{
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1F40DBD30](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
}

OSStatus CMSampleBufferCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMVideoFormatDescriptionRef formatDescription, const CMSampleTimingInfo *sampleTiming, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1F40DBD48](allocator, imageBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, sampleTiming, sampleBufferOut);
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return (CMBlockBufferRef)MEMORY[0x1F40DBDA0](sbuf);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x1F40DBDC0](sbuf);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x1F40DBDC8](sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1F40DBDF8](retstr, sbuf);
}

CFTypeID CMSampleBufferGetTypeID(void)
{
  return MEMORY[0x1F40DBE38]();
}

void CMSetAttachment(CMAttachmentBearerRef target, CFStringRef key, CFTypeRef value, CMAttachmentMode attachmentMode)
{
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC088](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1F40DC0C8](time1, time2);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1F40DC0E0](time, allocator);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x1F40DC100](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1F40DC108](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x1F40DC110](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1F40DC120](retstr, *(void *)&preferredTimescale, seconds);
}

CMTimeRange *__cdecl CMTimeRangeMakeFromDictionary(CMTimeRange *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1E0](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC1F0](retstr, lhs, rhs);
}

OSStatus CMVideoFormatDescriptionCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DC308](allocator, imageBuffer, formatDescriptionOut);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x1F40DC338](videoDesc);
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x1F40DFB48](buffer, key, attachmentMode);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFCE0](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFD08](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1F40DFD28](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD40](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD68](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD80](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD98](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1F40DFDB8](pixelBuffer, lockFlags);
}

CFDictionaryRef CVPixelBufferPoolGetPixelBufferAttributes(CVPixelBufferPoolRef pool)
{
  return (CFDictionaryRef)MEMORY[0x1F40DFDF0](pool);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x1F40DFE40](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1F40DFE48](pixelBuffer, unlockFlags);
}

uint64_t ErrorIsAVFoundationError()
{
  return MEMORY[0x1F4105C58]();
}

uint64_t FigAudioSessionClockCreateForAVAudioSession()
{
  return MEMORY[0x1F40ED300]();
}

uint64_t FigBoxedMetadataAppendCFTypedValue()
{
  return MEMORY[0x1F40DC678]();
}

uint64_t FigBoxedMetadataAppendFloat32()
{
  return MEMORY[0x1F40DC698]();
}

uint64_t FigBoxedMetadataAppendSInt32()
{
  return MEMORY[0x1F40DC6A0]();
}

uint64_t FigBoxedMetadataAppendValue()
{
  return MEMORY[0x1F40DC6A8]();
}

uint64_t FigBoxedMetadataCreateForConstruction()
{
  return MEMORY[0x1F40DC6B8]();
}

uint64_t FigBoxedMetadataEndConstruction()
{
  return MEMORY[0x1F40DC6C8]();
}

uint64_t FigBoxedMetadataGetBlockBuffer()
{
  return MEMORY[0x1F40DC6D0]();
}

uint64_t FigBoxedMetadataGetFormatDescription()
{
  return MEMORY[0x1F40DC6D8]();
}

uint64_t FigBoxedMetadataGetLocalIDOfItemAtIndex()
{
  return MEMORY[0x1F40DC6E0]();
}

uint64_t FigBoxedMetadataGetNumberOfItems()
{
  return MEMORY[0x1F40DC6E8]();
}

uint64_t FigBoxedMetadataGetValueOfItemAtIndex()
{
  return MEMORY[0x1F40DC700]();
}

uint64_t FigBoxedMetadataGetValueOfItemAtIndexAsFloat32()
{
  return MEMORY[0x1F40DC708]();
}

uint64_t FigBoxedMetadataGetValueOfItemAtIndexAsSInt32()
{
  return MEMORY[0x1F40DC710]();
}

uint64_t FigCFDictionaryGetFloatIfPresent()
{
  return MEMORY[0x1F40DC9F0]();
}

uint64_t FigCFEqual()
{
  return MEMORY[0x1F40DCAF8]();
}

uint64_t FigCFNumberGetSInt64()
{
  return MEMORY[0x1F40DCB80]();
}

uint64_t FigCaptureCameraRequires180DegreesRotation()
{
  return MEMORY[0x1F410D290]();
}

uint64_t FigCaptureCompressedPixelFormatForPixelFormat()
{
  return MEMORY[0x1F410D298]();
}

uint64_t FigCaptureDeferredPhotoProcessorIsAllowedToPrewarm()
{
  return MEMORY[0x1F410D2A0]();
}

uint64_t FigCaptureDeferredPhotoProcessorRemoteCopyPhotoProcessor()
{
  return MEMORY[0x1F410D2A8]();
}

uint64_t FigCaptureFirmwareToNVMExtrinsicMatrixTransform()
{
  return MEMORY[0x1F410D2B0]();
}

uint64_t FigCaptureGetModelSpecificName()
{
  return MEMORY[0x1F410D2B8]();
}

uint64_t FigCaptureGetTCCServer()
{
  return MEMORY[0x1F410D2C0]();
}

uint64_t FigCapturePixelFormatBytesPerPixel()
{
  return MEMORY[0x1F410D2C8]();
}

uint64_t FigCapturePixelFormatIs420()
{
  return MEMORY[0x1F410D2D0]();
}

uint64_t FigCapturePixelFormatIs422()
{
  return MEMORY[0x1F410D2D8]();
}

uint64_t FigCapturePixelFormatIsTenBit()
{
  return MEMORY[0x1F410D2E0]();
}

uint64_t FigCapturePlatformIdentifier()
{
  return MEMORY[0x1F410D2E8]();
}

uint64_t FigCapturePlatformMountsCamerasInLandscapeOrientation()
{
  return MEMORY[0x1F410D2F0]();
}

uint64_t FigCapturePlatformSupportsExclaves()
{
  return MEMORY[0x1F410D2F8]();
}

uint64_t FigCapturePlatformSupportsHTPC16x8Compression()
{
  return MEMORY[0x1F410D300]();
}

uint64_t FigCapturePlatformSupportsUniversalCompression()
{
  return MEMORY[0x1F410D308]();
}

uint64_t FigCapturePlatformSupportsUniversalLossyCompression()
{
  return MEMORY[0x1F410D310]();
}

uint64_t FigCaptureSessionCreate()
{
  return MEMORY[0x1F410D318]();
}

uint64_t FigCaptureSessionRemoteCreate()
{
  return MEMORY[0x1F410D328]();
}

uint64_t FigCaptureSessionRemotePrewarmWithOptions()
{
  return MEMORY[0x1F410D330]();
}

uint64_t FigCaptureSourceCopySources()
{
  return MEMORY[0x1F410D338]();
}

uint64_t FigCaptureSourceGetMediaTypeForUniqueID()
{
  return MEMORY[0x1F410D340]();
}

uint64_t FigCaptureSourceRemoteBeginGeneratingConnectionDiedNotifications()
{
  return MEMORY[0x1F410D348]();
}

uint64_t FigCaptureSourceRemoteCopyCaptureSources()
{
  return MEMORY[0x1F410D350]();
}

uint64_t FigCaptureSourceRemoteCopyProxySource()
{
  return MEMORY[0x1F410D358]();
}

uint64_t FigCaptureSourceRemoteMaxStillImageJPEGDataSize()
{
  return MEMORY[0x1F410D360]();
}

uint64_t FigCaptureTCCAccessPreflight()
{
  return MEMORY[0x1F410D380]();
}

uint64_t FigCaptureTCCAccessRequest()
{
  return MEMORY[0x1F410D388]();
}

uint64_t FigCaptureTransformExtrinsicMatrix()
{
  return MEMORY[0x1F410D390]();
}

uint64_t FigCaptureUncompressedPixelFormatForPixelFormat()
{
  return MEMORY[0x1F410D398]();
}

uint64_t FigCaptureVideoStabilizationStrengthToString()
{
  return MEMORY[0x1F410D3A0]();
}

uint64_t FigConsolidateMovieFragments()
{
  return MEMORY[0x1F40ED448]();
}

uint64_t FigCopyBacktrace()
{
  return MEMORY[0x1F40DCF98]();
}

uint64_t FigDebugAssert3()
{
  return MEMORY[0x1F40DD2C8]();
}

uint64_t FigDepthConvertBuffer()
{
  return MEMORY[0x1F410D3A8]();
}

uint64_t FigDepthRotateBuffer()
{
  return MEMORY[0x1F410D3B0]();
}

uint64_t FigDepthRotateCalibrationData()
{
  return MEMORY[0x1F410D3B8]();
}

uint64_t FigExternalStorageDeviceManagerRemoteCreate()
{
  return MEMORY[0x1F410D3C0]();
}

uint64_t FigExternalStorageDeviceManagerRemoteSupported()
{
  return MEMORY[0x1F410D3C8]();
}

uint64_t FigFileIsFileOnExternalStorageDevice()
{
  return MEMORY[0x1F40DD6B0]();
}

uint64_t FigFlashlightCreate()
{
  return MEMORY[0x1F410D3D0]();
}

uint64_t FigFlashlightRemoteCreate()
{
  return MEMORY[0x1F410D3D8]();
}

uint64_t FigFlatDictionaryGetMakerNoteKeySpace()
{
  return MEMORY[0x1F410D3E0]();
}

uint64_t FigGetCFPreferenceBooleanWithDefault()
{
  return MEMORY[0x1F40DD840]();
}

uint64_t FigGetCFPreferenceNumberWithDefault()
{
  return MEMORY[0x1F40DD858]();
}

uint64_t FigGetUpTime()
{
  return MEMORY[0x1F40DD8C8]();
}

uint64_t FigGetUpTimeNanoseconds()
{
  return MEMORY[0x1F40DD8D0]();
}

uint64_t FigHostTimeToNanoseconds()
{
  return MEMORY[0x1F40DDAB8]();
}

uint64_t FigLocalQueueSetReceiverHandler()
{
  return MEMORY[0x1F410D400]();
}

uint64_t FigLocalQueueUnsetReceiverHandler()
{
  return MEMORY[0x1F410D408]();
}

uint64_t FigMetadataFormatDescriptionGetIdentifierForLocalID()
{
  return MEMORY[0x1F40DDC48]();
}

uint64_t FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors()
{
  return MEMORY[0x1F40DDC58]();
}

uint64_t FigMetadataRewriterDictionaryCreateFromFigMetadataPropertyArray()
{
  return MEMORY[0x1F40ED710]();
}

uint64_t FigNote_AllowInternalDefaultLogs()
{
  return MEMORY[0x1F40DDD50]();
}

uint64_t FigOSTransactionCreate()
{
  return MEMORY[0x1F40DDDF8]();
}

uint64_t FigReentrantMutexCreate()
{
  return MEMORY[0x1F40DDFA0]();
}

uint64_t FigReentrantMutexDestroy()
{
  return MEMORY[0x1F40DDFA8]();
}

uint64_t FigReentrantMutexLock()
{
  return MEMORY[0x1F40DDFB0]();
}

uint64_t FigReentrantMutexUnlock()
{
  return MEMORY[0x1F40DDFC0]();
}

uint64_t FigRemoteOperationReceiverCreateMessageReceiver()
{
  return MEMORY[0x1F410D410]();
}

uint64_t FigRemoteQueueReceiverSetHandler()
{
  return MEMORY[0x1F410D428]();
}

uint64_t FigRemoteQueueReceiverUnsetHandler()
{
  return MEMORY[0x1F410D430]();
}

uint64_t FigRewriteMetadata()
{
  return MEMORY[0x1F40EDAE0]();
}

uint64_t FigSignalErrorAt()
{
  return MEMORY[0x1F40DE320]();
}

uint64_t FigSimpleMutexCheckIsLockedOnThisThread()
{
  return MEMORY[0x1F40DE330]();
}

uint64_t FigSimpleMutexCreate()
{
  return MEMORY[0x1F40DE340]();
}

uint64_t FigSimpleMutexDestroy()
{
  return MEMORY[0x1F40DE348]();
}

uint64_t FigSimpleMutexLock()
{
  return MEMORY[0x1F40DE350]();
}

uint64_t FigSimpleMutexUnlock()
{
  return MEMORY[0x1F40DE360]();
}

uint64_t FigThreadRunOnce()
{
  return MEMORY[0x1F40DE5F0]();
}

uint64_t FigVirtualCaptureCardGetCMBaseObject()
{
  return MEMORY[0x1F40DE870]();
}

uint64_t FigVirtualCaptureCardRemoteCreate()
{
  return MEMORY[0x1F40DE880]();
}

uint64_t FigVirtualCaptureCardRemoteSupported()
{
  return MEMORY[0x1F40DE888]();
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1F40E9358](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9540](buffer, *(void *)&options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9630](buffer, *(void *)&options, seed);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

uint64_t MRCDescriptorCreateWithAttributes()
{
  return MEMORY[0x1F4147640]();
}

uint64_t MRCDescriptorDecodePayload()
{
  return MEMORY[0x1F4147648]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1F40F7128](task, error);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

uint64_t TCCAccessRestricted()
{
  return MEMORY[0x1F415CC18]();
}

OSStatus VTCreateCGImageFromCVPixelBuffer(CVPixelBufferRef pixelBuffer, CFDictionaryRef options, CGImageRef *imageOut)
{
  return MEMORY[0x1F4103190](pixelBuffer, options, imageOut);
}

OSStatus VTPixelRotationSessionCreate(CFAllocatorRef allocator, VTPixelRotationSessionRef *pixelRotationSessionOut)
{
  return MEMORY[0x1F4103490](allocator, pixelRotationSessionOut);
}

OSStatus VTPixelRotationSessionRotateImage(VTPixelRotationSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1F41034A8](session, sourceBuffer, destinationBuffer);
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x1F41034D0](allocator, pixelTransferSessionOut);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1F41034F0](session, sourceBuffer, destinationBuffer);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x1F4103538](session, propertyKey, propertyValue);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _FigIsCurrentDispatchQueue()
{
  return MEMORY[0x1F40DED38]();
}

uint64_t _FigIsNotCurrentDispatchQueue()
{
  return MEMORY[0x1F40DED40]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1F40C9FF8]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t ct_green_tea_logger_create()
{
  return MEMORY[0x1F417A378]();
}

uint64_t ct_green_tea_logger_destroy()
{
  return MEMORY[0x1F417A388]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1F40CBBD8](queue);
}

dispatch_qos_class_t dispatch_queue_get_qos_class(dispatch_queue_t queue, int *relative_priority_ptr)
{
  return MEMORY[0x1F40CBBE0](queue, relative_priority_ptr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t dyld_get_active_platform()
{
  return MEMORY[0x1F40CBE10]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1F40CBEC8]();
}

uint64_t fig_log_call_emit_and_clean_up_after_send_and_compose()
{
  return MEMORY[0x1F40DED58]();
}

uint64_t fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type()
{
  return MEMORY[0x1F40DED60]();
}

uint64_t fig_log_get_emitter()
{
  return MEMORY[0x1F40DED68]();
}

uint64_t fig_note_initialize_category_with_default_work_cf()
{
  return MEMORY[0x1F40DED80]();
}

void free(void *a1)
{
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x1F417A398]();
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_main_np(void)
{
  return MEMORY[0x1F40CDA68]();
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40CDB30]();
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1F40CDBD8]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

long double tan(long double __x)
{
  MEMORY[0x1F40CE420](__x);
  return result;
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1F40CE470](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}