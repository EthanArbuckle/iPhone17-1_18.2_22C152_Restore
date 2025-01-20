void sub_1BC5824A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BC584820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BC586BC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BC586E38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__214(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__215(uint64_t a1)
{
}

void sub_1BC589448(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void CarPlayServicesLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!CarPlayServicesLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __CarPlayServicesLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E62BB230;
    uint64_t v3 = 0;
    CarPlayServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    v0 = (void *)v1[0];
    if (CarPlayServicesLibraryCore_frameworkLibrary)
    {
      if (!v1[0]) {
        return;
      }
    }
    else
    {
      v0 = (void *)abort_report_np();
    }
    free(v0);
  }
}

uint64_t __CarPlayServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CarPlayServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1BC589900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__347(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__348(uint64_t a1)
{
}

void sub_1BC589E48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *INCExtensionTransactionStateTypeGetName(unint64_t a1)
{
  if (a1 > 5) {
    return 0;
  }
  else {
    return off_1E62BB248[a1];
  }
}

void sub_1BC58A3B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BC58BC9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCARSessionStatusClass()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getCARSessionStatusClass_softClass;
  uint64_t v7 = getCARSessionStatusClass_softClass;
  if (!getCARSessionStatusClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCARSessionStatusClass_block_invoke;
    v3[3] = &unk_1E62BBC68;
    v3[4] = &v4;
    __getCARSessionStatusClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BC58BD88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getTUCallCenterClass_block_invoke(uint64_t a1)
{
  TelephonyUtilitiesLibrary();
  Class result = objc_getClass("TUCallCenter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getTUCallCenterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__112__INCAppProxy_launchAppInBackground_restrictAppsToCarPlay_userActivityIdentifier_retainsSiri_completionHandler___block_invoke(v3);
  }
  return result;
}

void TelephonyUtilitiesLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!TelephonyUtilitiesLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __TelephonyUtilitiesLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E62BB520;
    uint64_t v3 = 0;
    TelephonyUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
    v0 = (void *)v1[0];
    if (TelephonyUtilitiesLibraryCore_frameworkLibrary)
    {
      if (!v1[0]) {
        return;
      }
    }
    else
    {
      v0 = (void *)abort_report_np();
    }
    free(v0);
  }
}

uint64_t __TelephonyUtilitiesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  TelephonyUtilitiesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCARSessionStatusClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CarKitLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __CarKitLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E62BB508;
    uint64_t v6 = 0;
    CarKitLibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!CarKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("CARSessionStatus");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  getCARSessionStatusClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CarKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CarKitLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __AssistantServicesLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E62BB4F0;
    uint64_t v7 = 0;
    AssistantServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    long long v2 = (void *)AssistantServicesLibraryCore_frameworkLibrary;
    if (AssistantServicesLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  long long v2 = (void *)AssistantServicesLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "AFDeviceSupportsSystemAssistantExperience");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  return result;
}

uint64_t __AssistantServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AssistantServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1BC58CB00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getTUCallProviderManagerClass_block_invoke(uint64_t a1)
{
  TelephonyUtilitiesLibrary();
  Class result = objc_getClass("TUCallProviderManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getTUCallProviderManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__68__INCAppProxy_shouldLaunchAppInBackgroundWithIntent_intentResponse___block_invoke(v3);
  }
  return result;
}

void INCRouteAudioToAirplayOutputDevices(void *a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  int v5 = [v3 count];
  long long v6 = (id *)MEMORY[0x1E4F30240];
  os_signpost_id_t v7 = os_signpost_id_generate((os_log_t)*MEMORY[0x1E4F30240]);
  uint64_t v8 = *v6;
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&buf[4] = v5;
    _os_signpost_emit_with_name_impl(&dword_1BC57D000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "INSignpostSiriAirPlaySetAudioSessionCategory", " deviceIdCount=%{public,signpost.telemetry:number1}d  enableTelemetry=YES ", buf, 8u);
  }

  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2050000000;
  v10 = (void *)getAVAudioSessionClass_softClass;
  uint64_t v27 = getAVAudioSessionClass_softClass;
  if (!getAVAudioSessionClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getAVAudioSessionClass_block_invoke;
    v29 = &unk_1E62BBC68;
    v30 = &v24;
    __getAVAudioSessionClass_block_invoke((uint64_t)buf);
    v10 = (void *)v25[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v24, 8);
  v12 = [v11 auxiliarySession];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  v13 = (void **)getAVAudioSessionCategoryPlaybackSymbolLoc_ptr;
  uint64_t v27 = getAVAudioSessionCategoryPlaybackSymbolLoc_ptr;
  if (!getAVAudioSessionCategoryPlaybackSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getAVAudioSessionCategoryPlaybackSymbolLoc_block_invoke;
    v29 = &unk_1E62BBC68;
    v30 = &v24;
    v14 = (void *)AVFoundationLibrary();
    v15 = dlsym(v14, "AVAudioSessionCategoryPlayback");
    *(void *)(v30[1] + 24) = v15;
    getAVAudioSessionCategoryPlaybackSymbolLoc_ptr = *(void *)(v30[1] + 24);
    v13 = (void **)v25[3];
  }
  _Block_object_dispose(&v24, 8);
  if (!v13)
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
  v16 = *v13;
  id v23 = 0;
  id v17 = v16;
  char v18 = [v12 setCategory:v17 error:&v23];
  id v19 = v23;

  v20 = *v6;
  if ((v18 & 1) == 0 && os_log_type_enabled((os_log_t)*v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "INCRouteAudioToAirplayOutputDevices";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v19;
    _os_log_error_impl(&dword_1BC57D000, v20, OS_LOG_TYPE_ERROR, "%s Failed to select playback category on auxiliary context. %{public}@", buf, 0x16u);
    v20 = *v6;
  }
  v21 = v20;
  v22 = v21;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&buf[4] = v5;
    _os_signpost_emit_with_name_impl(&dword_1BC57D000, v22, OS_SIGNPOST_INTERVAL_END, v7, "INSignpostSiriAirPlaySetAudioSessionCategory", " deviceIdCount=%{public,signpost.telemetry:number1}d  enableTelemetry=YES ", buf, 8u);
  }

  INCRouteAudioToAirplayOutputDevicesForAudioSession(v3, v12, v4);
}

void sub_1BC58CFC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAVAudioSessionClass_block_invoke(uint64_t a1)
{
  AVFoundationLibrary();
  Class result = objc_getClass("AVAudioSession");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAVAudioSessionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__getAVAudioSessionCategoryPlaybackSymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getAVAudioSessionCategoryPlaybackSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)AVFoundationLibrary();
  Class result = dlsym(v2, "AVAudioSessionCategoryPlayback");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVAudioSessionCategoryPlaybackSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AVFoundationLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!AVFoundationLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __AVFoundationLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E62BB5F8;
    uint64_t v5 = 0;
    AVFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
    id v1 = (void *)v3[0];
    uint64_t v0 = AVFoundationLibraryCore_frameworkLibrary;
    if (AVFoundationLibraryCore_frameworkLibrary)
    {
      if (!v3[0]) {
        return v0;
      }
    }
    else
    {
      id v1 = (void *)abort_report_np();
    }
    free(v1);
    return v0;
  }
  return AVFoundationLibraryCore_frameworkLibrary;
}

void INCRouteAudioToAirplayOutputDevicesForAudioSession(void *a1, void *a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = (os_log_t *)MEMORY[0x1E4F30240];
  v9 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "INCRouteAudioToAirplayOutputDevicesForAudioSession";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v5;
    _os_log_debug_impl(&dword_1BC57D000, v9, OS_LOG_TYPE_DEBUG, "%s creating reconnaissance session for airplay ids: %@", buf, 0x16u);
  }
  uint64_t v10 = [v5 count];
  os_signpost_id_t v11 = os_signpost_id_generate(*v8);
  v12 = *v8;
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&buf[4] = v10;
    _os_signpost_emit_with_name_impl(&dword_1BC57D000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "INSignpostSiriAirPlayReconnaissanceSessionCreateWithEndpointFeatures", " deviceIdCount=%{public,signpost.telemetry:number1}d  enableTelemetry=YES ", buf, 8u);
  }

  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  v14 = (uint64_t (*)(id, uint64_t))getMRAVReconnaissanceSessionCreateWithEndpointFeaturesSymbolLoc_ptr;
  v39 = getMRAVReconnaissanceSessionCreateWithEndpointFeaturesSymbolLoc_ptr;
  if (!getMRAVReconnaissanceSessionCreateWithEndpointFeaturesSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getMRAVReconnaissanceSessionCreateWithEndpointFeaturesSymbolLoc_block_invoke;
    v41 = &unk_1E62BBC68;
    v42 = &v36;
    v15 = (void *)MediaRemoteLibrary();
    v16 = dlsym(v15, "MRAVReconnaissanceSessionCreateWithEndpointFeatures");
    *(void *)(v42[1] + 24) = v16;
    getMRAVReconnaissanceSessionCreateWithEndpointFeaturesSymbolLoc_ptr = *(_UNKNOWN **)(v42[1] + 24);
    v14 = (uint64_t (*)(id, uint64_t))v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v14) {
    goto LABEL_22;
  }
  uint64_t v17 = v14(v5, 1);
  char v18 = *v8;
  id v19 = v18;
  if (v11 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v18))
  {
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&buf[4] = v10;
    _os_signpost_emit_with_name_impl(&dword_1BC57D000, v19, OS_SIGNPOST_INTERVAL_END, v11, "INSignpostSiriAirPlayReconnaissanceSessionCreateWithEndpointFeatures", " deviceIdCount=%{public,signpost.telemetry:number1}d  enableTelemetry=YES ", buf, 8u);
  }

  uint64_t v20 = [v6 opaqueSessionID];
  os_signpost_id_t v21 = os_signpost_id_generate(*v8);
  v22 = *v8;
  id v23 = v22;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&buf[4] = v10;
    _os_signpost_emit_with_name_impl(&dword_1BC57D000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "INSignpostSiriAirPlayReconnaissanceSessionSetTargetAudioSessionID", " deviceIdCount=%{public,signpost.telemetry:number1}d  enableTelemetry=YES ", buf, 8u);
  }

  soft_MRAVReconnaissanceSessionSetTargetAudioSessionID(v17, v20);
  uint64_t v24 = *v8;
  v25 = v24;
  if (v21 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v24))
  {
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&buf[4] = v10;
    _os_signpost_emit_with_name_impl(&dword_1BC57D000, v25, OS_SIGNPOST_INTERVAL_END, v21, "INSignpostSiriAirPlayReconnaissanceSessionSetTargetAudioSessionID", " deviceIdCount=%{public,signpost.telemetry:number1}d  enableTelemetry=YES ", buf, 8u);
  }

  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v26 = (void (*)(uint64_t, void))getMRAVReconnaissanceSessionSetWaitForUnanimousEndpointsSymbolLoc_ptr;
  v39 = getMRAVReconnaissanceSessionSetWaitForUnanimousEndpointsSymbolLoc_ptr;
  if (!getMRAVReconnaissanceSessionSetWaitForUnanimousEndpointsSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getMRAVReconnaissanceSessionSetWaitForUnanimousEndpointsSymbolLoc_block_invoke;
    v41 = &unk_1E62BBC68;
    v42 = &v36;
    uint64_t v27 = (void *)MediaRemoteLibrary();
    v28 = dlsym(v27, "MRAVReconnaissanceSessionSetWaitForUnanimousEndpoints");
    *(void *)(v42[1] + 24) = v28;
    getMRAVReconnaissanceSessionSetWaitForUnanimousEndpointsSymbolLoc_ptr = *(_UNKNOWN **)(v42[1] + 24);
    uint64_t v26 = (void (*)(uint64_t, void))v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v26)
  {
LABEL_22:
    dlerror();
    abort_report_np();
    __break(1u);
  }
  v26(v17, 0);
  soft_MRAVReconnaissanceSessionSetReturnPartialResults(v17, 1);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __INCRouteAudioToAirplayOutputDevicesForAudioSession_block_invoke;
  v31[3] = &unk_1E62BB588;
  id v33 = v7;
  uint64_t v34 = v10;
  id v32 = v6;
  int v35 = v20;
  id v29 = v7;
  id v30 = v6;
  soft_MRAVReconnaissanceSessionBeginSearch(v17, v31);
}

void sub_1BC58D6D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMRAVReconnaissanceSessionCreateWithEndpointFeaturesSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)MediaRemoteLibrary();
  Class result = dlsym(v2, "MRAVReconnaissanceSessionCreateWithEndpointFeatures");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMRAVReconnaissanceSessionCreateWithEndpointFeaturesSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32)
                                                                                                 + 8)
                                                                                     + 24);
  return result;
}

uint64_t MediaRemoteLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!MediaRemoteLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __MediaRemoteLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E62BB610;
    uint64_t v5 = 0;
    MediaRemoteLibraryCore_frameworkLibrary = _sl_dlopen();
    id v1 = (void *)v3[0];
    uint64_t v0 = MediaRemoteLibraryCore_frameworkLibrary;
    if (MediaRemoteLibraryCore_frameworkLibrary)
    {
      if (!v3[0]) {
        return v0;
      }
    }
    else
    {
      id v1 = (void *)abort_report_np();
    }
    free(v1);
    return v0;
  }
  return MediaRemoteLibraryCore_frameworkLibrary;
}

uint64_t soft_MRAVReconnaissanceSessionSetTargetAudioSessionID(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  long long v4 = (uint64_t (*)(uint64_t, uint64_t))getMRAVReconnaissanceSessionSetTargetAudioSessionIDSymbolLoc_ptr;
  os_signpost_id_t v11 = getMRAVReconnaissanceSessionSetTargetAudioSessionIDSymbolLoc_ptr;
  if (!getMRAVReconnaissanceSessionSetTargetAudioSessionIDSymbolLoc_ptr)
  {
    uint64_t v5 = (void *)MediaRemoteLibrary();
    v9[3] = (uint64_t)dlsym(v5, "MRAVReconnaissanceSessionSetTargetAudioSessionID");
    getMRAVReconnaissanceSessionSetTargetAudioSessionIDSymbolLoc_ptr = (_UNKNOWN *)v9[3];
    long long v4 = (uint64_t (*)(uint64_t, uint64_t))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v4)
  {
    dlerror();
    id v7 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  return v4(a1, a2);
}

void *__getMRAVReconnaissanceSessionSetWaitForUnanimousEndpointsSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)MediaRemoteLibrary();
  Class result = dlsym(v2, "MRAVReconnaissanceSessionSetWaitForUnanimousEndpoints");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMRAVReconnaissanceSessionSetWaitForUnanimousEndpointsSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                       + 24);
  return result;
}

uint64_t soft_MRAVReconnaissanceSessionSetReturnPartialResults(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  long long v4 = (uint64_t (*)(uint64_t, uint64_t))getMRAVReconnaissanceSessionSetReturnPartialResultsSymbolLoc_ptr;
  os_signpost_id_t v11 = getMRAVReconnaissanceSessionSetReturnPartialResultsSymbolLoc_ptr;
  if (!getMRAVReconnaissanceSessionSetReturnPartialResultsSymbolLoc_ptr)
  {
    uint64_t v5 = (void *)MediaRemoteLibrary();
    v9[3] = (uint64_t)dlsym(v5, "MRAVReconnaissanceSessionSetReturnPartialResults");
    getMRAVReconnaissanceSessionSetReturnPartialResultsSymbolLoc_ptr = (_UNKNOWN *)v9[3];
    long long v4 = (uint64_t (*)(uint64_t, uint64_t))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v4)
  {
    dlerror();
    id v7 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  return v4(a1, a2);
}

void __INCRouteAudioToAirplayOutputDevicesForAudioSession_block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v7 = *(id *)(a1 + 32);
  if (!a4)
  {
LABEL_10:
    uint64_t v17 = (os_log_t *)MEMORY[0x1E4F30240];
    char v18 = *MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "INCRouteAudioToAirplayOutputDevicesForAudioSession_block_invoke";
      _os_log_debug_impl(&dword_1BC57D000, v18, OS_LOG_TYPE_DEBUG, "%s Checking for audio pairs", buf, 0xCu);
    }
    objc_msgSend(a2, "if_compactMap:", &__block_literal_global_583);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [v8 count];
    uint64_t v20 = *v17;
    if (v19)
    {
      os_signpost_id_t v21 = os_signpost_id_generate(*v17);
      v22 = *v17;
      id v23 = v22;
      if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        int v24 = *(_DWORD *)(a1 + 48);
        int v25 = [v8 count];
        *(_DWORD *)buf = 67240448;
        *(_DWORD *)&buf[4] = v24;
        *(_WORD *)&buf[8] = 1026;
        *(_DWORD *)&buf[10] = v25;
        _os_signpost_emit_with_name_impl(&dword_1BC57D000, v23, OS_SIGNPOST_EVENT, v21, "INSignpostSiriAirPlayAudioPairPath", " deviceIdCount=%{public,signpost.telemetry:number1}d  logicalDeviceCount=%{public,signpost.telemetry:number2}d  enableTelemetry=YES ", buf, 0xEu);
      }

      uint64_t v46 = 0;
      v47 = &v46;
      uint64_t v48 = 0x2020000000;
      uint64_t v26 = (uint64_t (*)(id))getMRAVReconnaissanceSessionCreateWithMatchingLogicalDeviceIDsSymbolLoc_ptr;
      v49 = getMRAVReconnaissanceSessionCreateWithMatchingLogicalDeviceIDsSymbolLoc_ptr;
      if (!getMRAVReconnaissanceSessionCreateWithMatchingLogicalDeviceIDsSymbolLoc_ptr)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getMRAVReconnaissanceSessionCreateWithMatchingLogicalDeviceIDsSymbolLoc_block_invoke;
        *(void *)&unsigned char buf[24] = &unk_1E62BBC68;
        v51 = &v46;
        uint64_t v27 = (void *)MediaRemoteLibrary();
        v28 = dlsym(v27, "MRAVReconnaissanceSessionCreateWithMatchingLogicalDeviceIDs");
        *(void *)(v51[1] + 24) = v28;
        getMRAVReconnaissanceSessionCreateWithMatchingLogicalDeviceIDsSymbolLoc_ptr = *(_UNKNOWN **)(v51[1] + 24);
        uint64_t v26 = (uint64_t (*)(id))v47[3];
      }
      _Block_object_dispose(&v46, 8);
      if (!v26) {
        goto LABEL_33;
      }
      uint64_t v29 = v26(v8);
      soft_MRAVReconnaissanceSessionSetTargetAudioSessionID(v29, *(unsigned int *)(a1 + 56));
      soft_MRAVReconnaissanceSessionSetReturnPartialResults(v29, 0);
      uint64_t v30 = [v8 count];
      uint64_t v46 = 0;
      v47 = &v46;
      uint64_t v48 = 0x2020000000;
      uint64_t v31 = (void (*)(uint64_t, uint64_t))getMRAVReconnaissanceSessionSetExpectedLogicalDevicesSymbolLoc_ptr;
      v49 = getMRAVReconnaissanceSessionSetExpectedLogicalDevicesSymbolLoc_ptr;
      if (!getMRAVReconnaissanceSessionSetExpectedLogicalDevicesSymbolLoc_ptr)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getMRAVReconnaissanceSessionSetExpectedLogicalDevicesSymbolLoc_block_invoke;
        *(void *)&unsigned char buf[24] = &unk_1E62BBC68;
        v51 = &v46;
        id v32 = (void *)MediaRemoteLibrary();
        id v33 = dlsym(v32, "MRAVReconnaissanceSessionSetExpectedLogicalDevices");
        *(void *)(v51[1] + 24) = v33;
        getMRAVReconnaissanceSessionSetExpectedLogicalDevicesSymbolLoc_ptr = *(_UNKNOWN **)(v51[1] + 24);
        uint64_t v31 = (void (*)(uint64_t, uint64_t))v47[3];
      }
      _Block_object_dispose(&v46, 8);
      if (!v31)
      {
LABEL_33:
        dlerror();
        abort_report_np();
        __break(1u);
      }
      v31(v29, v30);
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __INCRouteAudioToAirplayOutputDevicesForAudioSession_block_invoke_4;
      v43[3] = &unk_1E62BB560;
      v45 = a2;
      id v44 = *(id *)(a1 + 40);
      soft_MRAVReconnaissanceSessionBeginSearch(v29, v43);
    }
    else
    {
      if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = "INCRouteAudioToAirplayOutputDevicesForAudioSession_block_invoke_2";
        _os_log_debug_impl(&dword_1BC57D000, v20, OS_LOG_TYPE_DEBUG, "%s No audio pairs detected", buf, 0xCu);
      }
      INCMRAVSetOutputDevicesForAudioContext(a2, *(void **)(a1 + 40));
    }
    goto LABEL_32;
  }
  id v8 = a4;
  int v9 = [a2 count];
  if (INCMRAVDiscoveryErrorIsPartialDiscoveryError(v8) && [a2 count])
  {
    uint64_t v10 = (id *)MEMORY[0x1E4F30240];
    os_signpost_id_t v11 = os_signpost_id_generate((os_log_t)*MEMORY[0x1E4F30240]);
    v12 = *v10;
    v13 = v12;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      int v42 = *(_DWORD *)(a1 + 48);
      int v14 = [v8 code];
      v15 = [v8 domain];
      *(_DWORD *)buf = 67240962;
      *(_DWORD *)&buf[4] = v42;
      *(_WORD *)&buf[8] = 1026;
      *(_DWORD *)&buf[10] = v9;
      *(_WORD *)&buf[14] = 1026;
      *(_DWORD *)&buf[16] = v14;
      *(_WORD *)&buf[20] = 2114;
      *(void *)&buf[22] = v15;
      _os_signpost_emit_with_name_impl(&dword_1BC57D000, v13, OS_SIGNPOST_EVENT, v11, "INSignpostSiriAirPlayDeviceSearchPartialError", " deviceIdCount=%{public,signpost.telemetry:number1}d  deviceCount=%{public,signpost.telemetry:number2}d  errorCode=%{public,signpost.telemetry:number3}d  errorDomain=%{public,signpost.telemetry:string1}@  enableTelemetry=YES ", buf, 0x1Eu);
    }
    v16 = *v10;
    if (os_log_type_enabled((os_log_t)*v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "INCRouteAudioToAirplayOutputDevicesForAudioSession_block_invoke";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = a2;
      _os_log_error_impl(&dword_1BC57D000, v16, OS_LOG_TYPE_ERROR, "%s Timed out with partial discovery. Found devices: %{public}@", buf, 0x16u);
    }

    goto LABEL_10;
  }
  uint64_t v34 = (id *)MEMORY[0x1E4F30240];
  os_signpost_id_t v35 = os_signpost_id_generate((os_log_t)*MEMORY[0x1E4F30240]);
  uint64_t v36 = *v34;
  v37 = v36;
  if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
  {
    int v38 = *(_DWORD *)(a1 + 48);
    int v39 = [v8 code];
    v40 = [v8 domain];
    *(_DWORD *)buf = 67240962;
    *(_DWORD *)&buf[4] = v38;
    *(_WORD *)&buf[8] = 1026;
    *(_DWORD *)&buf[10] = v9;
    *(_WORD *)&buf[14] = 1026;
    *(_DWORD *)&buf[16] = v39;
    *(_WORD *)&buf[20] = 2114;
    *(void *)&buf[22] = v40;
    _os_signpost_emit_with_name_impl(&dword_1BC57D000, v37, OS_SIGNPOST_EVENT, v35, "INSignpostSiriAirPlayDeviceSearchError", " deviceIdCount=%{public,signpost.telemetry:number1}d  deviceCount=%{public,signpost.telemetry:number2}d  errorCode=%{public,signpost.telemetry:number3}d  errorDomain=%{public,signpost.telemetry:string1}@  enableTelemetry=YES ", buf, 0x1Eu);
  }
  v41 = *v34;
  if (os_log_type_enabled((os_log_t)*v34, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "INCRouteAudioToAirplayOutputDevicesForAudioSession_block_invoke";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v8;
    _os_log_error_impl(&dword_1BC57D000, v41, OS_LOG_TYPE_ERROR, "%s Failed to search for output devices: %{public}@", buf, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_32:
}

void sub_1BC58E1B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void soft_MRAVReconnaissanceSessionBeginSearch(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  long long v4 = (void (*)(uint64_t, id, double))getMRAVReconnaissanceSessionBeginSearchSymbolLoc_ptr;
  uint64_t v10 = getMRAVReconnaissanceSessionBeginSearchSymbolLoc_ptr;
  if (!getMRAVReconnaissanceSessionBeginSearchSymbolLoc_ptr)
  {
    uint64_t v5 = (void *)MediaRemoteLibrary();
    v8[3] = (uint64_t)dlsym(v5, "MRAVReconnaissanceSessionBeginSearch");
    getMRAVReconnaissanceSessionBeginSearchSymbolLoc_ptr = (_UNKNOWN *)v8[3];
    long long v4 = (void (*)(uint64_t, id, double))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v4)
  {
    dlerror();
    uint64_t v6 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v6);
  }
  v4(a1, v3, 5.0);
}

void *__getMRAVReconnaissanceSessionBeginSearchSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)MediaRemoteLibrary();
  Class result = dlsym(v2, "MRAVReconnaissanceSessionBeginSearch");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMRAVReconnaissanceSessionBeginSearchSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t INCMRAVDiscoveryErrorIsPartialDiscoveryError(void *a1)
{
  id v1 = a1;
  if ([v1 code] == 26)
  {
    long long v2 = [v1 domain];
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x2020000000;
    id v3 = (void *)getkMRMediaRemoteFrameworkErrorDomainSymbolLoc_ptr;
    uint64_t v11 = getkMRMediaRemoteFrameworkErrorDomainSymbolLoc_ptr;
    if (!getkMRMediaRemoteFrameworkErrorDomainSymbolLoc_ptr)
    {
      long long v4 = (void *)MediaRemoteLibrary();
      v9[3] = (uint64_t)dlsym(v4, "kMRMediaRemoteFrameworkErrorDomain");
      getkMRMediaRemoteFrameworkErrorDomainSymbolLoc_ptr = v9[3];
      id v3 = (void *)v9[3];
    }
    _Block_object_dispose(&v8, 8);
    if (!v3)
    {
      dlerror();
      uint64_t v7 = (_Unwind_Exception *)abort_report_np();
      _Block_object_dispose(&v8, 8);
      _Unwind_Resume(v7);
    }
    uint64_t v5 = [v2 isEqualToString:*v3];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void INCMRAVSetOutputDevicesForAudioContext(void *a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = (os_log_t *)MEMORY[0x1E4F30240];
  uint64_t v6 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "INCMRAVSetOutputDevicesForAudioContext";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v3;
    _os_log_debug_impl(&dword_1BC57D000, v6, OS_LOG_TYPE_DEBUG, "%s Setting output devices on the shared audio presentation context: %@", buf, 0x16u);
  }
  uint64_t v7 = dispatch_get_global_queue(0, 0);
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v8 = (uint64_t (*)(void))getMRAVOutputContextGetSharedAudioPresentationContextSymbolLoc_ptr;
  uint64_t v29 = getMRAVOutputContextGetSharedAudioPresentationContextSymbolLoc_ptr;
  if (!getMRAVOutputContextGetSharedAudioPresentationContextSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getMRAVOutputContextGetSharedAudioPresentationContextSymbolLoc_block_invoke;
    uint64_t v31 = &unk_1E62BBC68;
    id v32 = &v26;
    uint64_t v9 = (void *)MediaRemoteLibrary();
    uint64_t v10 = dlsym(v9, "MRAVOutputContextGetSharedAudioPresentationContext");
    *(void *)(v32[1] + 24) = v10;
    getMRAVOutputContextGetSharedAudioPresentationContextSymbolLoc_ptr = *(_UNKNOWN **)(v32[1] + 24);
    uint64_t v8 = (uint64_t (*)(void))v27[3];
  }
  _Block_object_dispose(&v26, 8);
  if (!v8)
  {
    dlerror();
    abort_report_np();
    goto LABEL_15;
  }
  uint64_t v11 = v8();
  uint64_t v12 = [v3 count];
  os_signpost_id_t v13 = os_signpost_id_generate(*v5);
  int v14 = *v5;
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&buf[4] = v12;
    _os_signpost_emit_with_name_impl(&dword_1BC57D000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "INSignpostSiriAirPlaySetOutputDevices", " deviceCount=%{public,signpost.telemetry:number1}d  enableTelemetry=YES ", buf, 8u);
  }

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __INCMRAVSetOutputDevicesForAudioContext_block_invoke;
  v22[3] = &unk_1E62BB630;
  os_signpost_id_t v24 = v13;
  uint64_t v25 = v12;
  id v16 = v4;
  id v23 = v16;
  id v17 = v7;
  char v18 = v22;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v19 = (void (*)(uint64_t, id, id, void *))getMRAVOutputContextSetOutputDevicesSymbolLoc_ptr;
  uint64_t v29 = getMRAVOutputContextSetOutputDevicesSymbolLoc_ptr;
  if (!getMRAVOutputContextSetOutputDevicesSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getMRAVOutputContextSetOutputDevicesSymbolLoc_block_invoke;
    uint64_t v31 = &unk_1E62BBC68;
    id v32 = &v26;
    uint64_t v20 = (void *)MediaRemoteLibrary();
    os_signpost_id_t v21 = dlsym(v20, "MRAVOutputContextSetOutputDevices");
    *(void *)(v32[1] + 24) = v21;
    getMRAVOutputContextSetOutputDevicesSymbolLoc_ptr = *(_UNKNOWN **)(v32[1] + 24);
    uint64_t v19 = (void (*)(uint64_t, id, id, void *))v27[3];
  }
  _Block_object_dispose(&v26, 8);
  if (!v19)
  {
    dlerror();
    abort_report_np();
LABEL_15:
    __break(1u);
  }
  v19(v11, v3, v17, v18);
}

void sub_1BC58E848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMRAVReconnaissanceSessionCreateWithMatchingLogicalDeviceIDsSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)MediaRemoteLibrary();
  Class result = dlsym(v2, "MRAVReconnaissanceSessionCreateWithMatchingLogicalDeviceIDs");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMRAVReconnaissanceSessionCreateWithMatchingLogicalDeviceIDsSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                             + 24);
  return result;
}

void *__getMRAVReconnaissanceSessionSetExpectedLogicalDevicesSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)MediaRemoteLibrary();
  Class result = dlsym(v2, "MRAVReconnaissanceSessionSetExpectedLogicalDevices");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMRAVReconnaissanceSessionSetExpectedLogicalDevicesSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32)
                                                                                                + 8)
                                                                                    + 24);
  return result;
}

void __INCRouteAudioToAirplayOutputDevicesForAudioSession_block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    if (INCMRAVDiscoveryErrorIsPartialDiscoveryError(a4) && [a2 count])
    {
      uint64_t v7 = *MEMORY[0x1E4F30240];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      *(_DWORD *)id v16 = 136315394;
      *(void *)&v16[4] = "INCRouteAudioToAirplayOutputDevicesForAudioSession_block_invoke";
      *(_WORD *)&v16[12] = 2114;
      *(void *)&v16[14] = a2;
      uint64_t v8 = "%s Timed out with partial discovery while finding audio pairs. Found devices: %{public}@";
      uint64_t v9 = v7;
    }
    else
    {
      uint64_t v10 = *MEMORY[0x1E4F30240];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      *(_DWORD *)id v16 = 136315394;
      *(void *)&v16[4] = "INCRouteAudioToAirplayOutputDevicesForAudioSession_block_invoke";
      *(_WORD *)&v16[12] = 2114;
      *(void *)&v16[14] = a4;
      uint64_t v8 = "%s Failed to search for output devices while finding audio pairs: %{public}@";
      uint64_t v9 = v10;
    }
    _os_log_error_impl(&dword_1BC57D000, v9, OS_LOG_TYPE_ERROR, v8, v16, 0x16u);
  }
  else
  {
    uint64_t v11 = *MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)id v16 = 136315138;
      *(void *)&v16[4] = "INCRouteAudioToAirplayOutputDevicesForAudioSession_block_invoke";
      _os_log_debug_impl(&dword_1BC57D000, v11, OS_LOG_TYPE_DEBUG, "%s Audio pairs detected", v16, 0xCu);
    }
  }
LABEL_11:
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", *(void *)(a1 + 40), *(_OWORD *)v16, *(void *)&v16[16], v17);
  os_signpost_id_t v13 = v12;
  if (a2)
  {
    uint64_t v14 = [v12 setByAddingObjectsFromArray:a2];

    os_signpost_id_t v13 = (void *)v14;
  }
  v15 = [v13 allObjects];
  INCMRAVSetOutputDevicesForAudioContext(v15, *(void **)(a1 + 32));
}

void *__getMRAVOutputContextGetSharedAudioPresentationContextSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)MediaRemoteLibrary();
  Class result = dlsym(v2, "MRAVOutputContextGetSharedAudioPresentationContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMRAVOutputContextGetSharedAudioPresentationContextSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32)
                                                                                                + 8)
                                                                                    + 24);
  return result;
}

void __INCMRAVSetOutputDevicesForAudioContext_block_invoke(void *a1, void *a2)
{
  *(void *)&v24[5] = *MEMORY[0x1E4F143B8];
  id v4 = (os_log_t *)MEMORY[0x1E4F30240];
  uint64_t v5 = (id)*MEMORY[0x1E4F30240];
  uint64_t v6 = v5;
  os_signpost_id_t v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    uint64_t v8 = a1[6];
    int v22 = 67240192;
    *(_DWORD *)id v23 = v8;
    _os_signpost_emit_with_name_impl(&dword_1BC57D000, v6, OS_SIGNPOST_INTERVAL_END, v7, "INSignpostSiriAirPlaySetOutputDevices", " deviceCount=%{public,signpost.telemetry:number1}d  enableTelemetry=YES ", (uint8_t *)&v22, 8u);
  }

  if (a2)
  {
    id v9 = a2;
    os_signpost_id_t v10 = os_signpost_id_generate(*v4);
    uint64_t v11 = *v4;
    uint64_t v12 = v11;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      uint64_t v13 = a1[6];
      int v14 = [v9 code];
      v15 = [v9 domain];
      int v22 = 67240706;
      *(_DWORD *)id v23 = v13;
      *(_WORD *)&v23[4] = 1026;
      *(_DWORD *)&v23[6] = v14;
      v24[0] = 2114;
      *(void *)&v24[1] = v15;
      _os_signpost_emit_with_name_impl(&dword_1BC57D000, v12, OS_SIGNPOST_EVENT, v10, "INSignpostSiriAirPlaySetOutputDeviceError", " deviceCount=%{public,signpost.telemetry:number1}d  errorCode=%{public,signpost.telemetry:number2}d  errorDomain=%{public,signpost.telemetry:string1}@  enableTelemetry=YES ", (uint8_t *)&v22, 0x18u);
    }
    id v16 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      int v22 = 136315394;
      *(void *)id v23 = "INCMRAVSetOutputDevicesForAudioContext_block_invoke";
      *(_WORD *)&v23[8] = 2114;
      *(void *)os_signpost_id_t v24 = v9;
      _os_log_error_impl(&dword_1BC57D000, v16, OS_LOG_TYPE_ERROR, "%s Failed to set output devices on the shared audio presentation context: %{public}@", (uint8_t *)&v22, 0x16u);
    }
    (*(void (**)(void))(a1[4] + 16))();
  }
  else
  {
    uint64_t v17 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG))
    {
      int v22 = 136315138;
      *(void *)id v23 = "INCMRAVSetOutputDevicesForAudioContext_block_invoke";
      _os_log_debug_impl(&dword_1BC57D000, v17, OS_LOG_TYPE_DEBUG, "%s Set output devices on the shared audio presentation context", (uint8_t *)&v22, 0xCu);
      uint64_t v17 = *v4;
    }
    os_signpost_id_t v18 = os_signpost_id_generate(v17);
    uint64_t v19 = *v4;
    uint64_t v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      uint64_t v21 = a1[6];
      int v22 = 67240192;
      *(_DWORD *)id v23 = v21;
      _os_signpost_emit_with_name_impl(&dword_1BC57D000, v20, OS_SIGNPOST_EVENT, v18, "INSignpostSiriAirPlaySetOutputDeviceSuccess", " deviceCount=%{public,signpost.telemetry:number1}d  enableTelemetry=YES ", (uint8_t *)&v22, 8u);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }
}

void *__getMRAVOutputContextSetOutputDevicesSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)MediaRemoteLibrary();
  Class result = dlsym(v2, "MRAVOutputContextSetOutputDevices");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMRAVOutputContextSetOutputDevicesSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __INCRouteAudioToAirplayOutputDevicesForAudioSession_block_invoke_1(uint64_t a1, void *a2)
{
  return [a2 logicalDeviceID];
}

void *__getkMRMediaRemoteFrameworkErrorDomainSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)MediaRemoteLibrary();
  Class result = dlsym(v2, "kMRMediaRemoteFrameworkErrorDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkMRMediaRemoteFrameworkErrorDomainSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMRAVReconnaissanceSessionSetReturnPartialResultsSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)MediaRemoteLibrary();
  Class result = dlsym(v2, "MRAVReconnaissanceSessionSetReturnPartialResults");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMRAVReconnaissanceSessionSetReturnPartialResultsSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32)
                                                                                              + 8)
                                                                                  + 24);
  return result;
}

void *__getMRAVReconnaissanceSessionSetTargetAudioSessionIDSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)MediaRemoteLibrary();
  Class result = dlsym(v2, "MRAVReconnaissanceSessionSetTargetAudioSessionID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMRAVReconnaissanceSessionSetTargetAudioSessionIDSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32)
                                                                                              + 8)
                                                                                  + 24);
  return result;
}

uint64_t __MediaRemoteLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MediaRemoteLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __AVFoundationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AVFoundationLibraryCore_frameworkLibrary = result;
  return result;
}

void INCDecodeHashedRouteUIDs(void *a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v22 = a1;
  id v3 = a2;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  os_signpost_id_t v35 = __Block_byref_object_copy__588;
  uint64_t v36 = __Block_byref_object_dispose__589;
  id v37 = 0;
  if (INThisProcessIsAssistantd() && (INThisProcessIsRunningAsInstance() & 1) == 0)
  {
    uint64_t v4 = [(objc_class *)objc_getClass("ADSecurityService") sharedService];
    uint64_t v5 = (void *)v33[5];
    v33[5] = v4;
  }
  if (v33[5]
    || (uint64_t v6 = [[(objc_class *)objc_getClass("AFSecurityConnection") alloc] init],
        os_signpost_id_t v7 = (void *)v33[5],
        v33[5] = (uint64_t)v6,
        v7,
        v33[5]))
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v22];
    if ([v8 containsObject:@"LOCAL_DEVICE"])
    {
      id v9 = *MEMORY[0x1E4F30240];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        int v39 = "INCDecodeHashedRouteUIDs";
        _os_log_error_impl(&dword_1BC57D000, v9, OS_LOG_TYPE_ERROR, "%s Unexpected LOCAL_DEVICE identifier.", buf, 0xCu);
      }
      objc_msgSend(v8, "removeObject:", @"LOCAL_DEVICE", v22);
    }
    if (objc_msgSend(v8, "count", v22))
    {
      os_signpost_id_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v8, "count"));
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v11 = v8;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v42 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v29;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v29 != v13) {
              objc_enumerationMutation(v11);
            }
            uint64_t v15 = *(void *)(*((void *)&v28 + 1) + 8 * i);
            id v16 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v15 options:0];
            if (!v16)
            {
              os_signpost_id_t v18 = *MEMORY[0x1E4F30240];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                int v39 = "INCDecodeHashedRouteUIDs";
                __int16 v40 = 2112;
                uint64_t v41 = v15;
                _os_log_error_impl(&dword_1BC57D000, v18, OS_LOG_TYPE_ERROR, "%s Failed to decode %@ as base64 data", buf, 0x16u);
              }
              uint64_t v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"INCExtensionErrorDomain" code:1317 userInfo:0];
              v3[2](v3, 0, v19);

              goto LABEL_24;
            }
            [v10 setObject:v16 forKey:v15];
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v42 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      uint64_t v17 = (void *)v33[5];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __INCDecodeHashedRouteUIDs_block_invoke;
      v24[3] = &unk_1E62BB5D8;
      uint64_t v26 = v3;
      id v25 = v11;
      uint64_t v27 = &v32;
      [v17 processDataMap:v10 usingProcedure:2 completion:v24];
    }
    else
    {
      uint64_t v20 = [MEMORY[0x1E4F1C978] array];
      ((void (**)(id, void *, void *))v3)[2](v3, v20, 0);

      os_signpost_id_t v10 = (void *)v33[5];
      v33[5] = 0;
    }
LABEL_24:
  }
  else
  {
    uint64_t v21 = *MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      int v39 = "INCDecodeHashedRouteUIDs";
      _os_log_error_impl(&dword_1BC57D000, v21, OS_LOG_TYPE_ERROR, "%s Unable to get security service", buf, 0xCu);
    }
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"INCExtensionErrorDomain", 1317, 0, v22);
    v3[2](v3, 0, v8);
  }

  _Block_object_dispose(&v32, 8);
}

void sub_1BC58F58C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__588(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__589(uint64_t a1)
{
}

void __INCDecodeHashedRouteUIDs_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v6 count])
  {
    os_signpost_id_t v7 = *MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v21 = "INCDecodeHashedRouteUIDs_block_invoke";
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_error_impl(&dword_1BC57D000, v7, OS_LOG_TYPE_ERROR, "%s Decoding error: %@", buf, 0x16u);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"INCExtensionErrorDomain" code:1317 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v9);
  }
  else
  {
    os_signpost_id_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __INCDecodeHashedRouteUIDs_block_invoke_16;
    v18[3] = &unk_1E62BB5B0;
    id v9 = v10;
    id v19 = v9;
    [v5 enumerateKeysAndObjectsUsingBlock:v18];
    uint64_t v11 = [*(id *)(a1 + 32) count];
    if (v11 == [v9 count])
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      uint64_t v12 = *MEMORY[0x1E4F30240];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 136315650;
        uint64_t v21 = "INCDecodeHashedRouteUIDs_block_invoke";
        __int16 v22 = 2112;
        id v23 = v17;
        __int16 v24 = 2114;
        id v25 = v9;
        _os_log_error_impl(&dword_1BC57D000, v12, OS_LOG_TYPE_ERROR, "%s Decoding error. Hashed route UIDs = %@, decoded route UIDs = %{public}@", buf, 0x20u);
      }
      uint64_t v13 = *(void *)(a1 + 40);
      int v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"INCExtensionErrorDomain" code:1317 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v14);
    }
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = 0;
}

void __INCDecodeHashedRouteUIDs_block_invoke_16(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
  os_signpost_id_t v10 = *MEMORY[0x1E4F30240];
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_DEBUG))
    {
      int v11 = 136315650;
      uint64_t v12 = "INCDecodeHashedRouteUIDs_block_invoke";
      __int16 v13 = 2112;
      id v14 = v7;
      __int16 v15 = 2114;
      id v16 = v9;
      _os_log_debug_impl(&dword_1BC57D000, v10, OS_LOG_TYPE_DEBUG, "%s %@ => %{public}@", (uint8_t *)&v11, 0x20u);
    }
    [*(id *)(a1 + 32) addObject:v9];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315650;
      uint64_t v12 = "INCDecodeHashedRouteUIDs_block_invoke";
      __int16 v13 = 2112;
      id v14 = v8;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_error_impl(&dword_1BC57D000, v10, OS_LOG_TYPE_ERROR, "%s Failed to convert decoded data %@ to a string for hashed route UID %@", (uint8_t *)&v11, 0x20u);
    }
    *a4 = 1;
  }
}

uint64_t INCGetCurrentGroupDeviceUIDs(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a1 + 16))(a1, 0, 0);
}

void sub_1BC590118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

uint64_t __Block_byref_object_copy__634(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__635(uint64_t a1)
{
}

void sub_1BC590618(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location,char a31)
{
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_1BC594ABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__849(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__850(uint64_t a1)
{
}

id getCARSessionStatusClass_851()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCARSessionStatusClass_softClass_852;
  uint64_t v7 = getCARSessionStatusClass_softClass_852;
  if (!getCARSessionStatusClass_softClass_852)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCARSessionStatusClass_block_invoke_853;
    v3[3] = &unk_1E62BBC68;
    v3[4] = &v4;
    __getCARSessionStatusClass_block_invoke_853((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BC594DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getCARSessionStatusClass_block_invoke_853(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CARSessionStatus");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCARSessionStatusClass_softClass_852 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    CarKitLibrary();
  }
}

void CarKitLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!CarKitLibraryCore_frameworkLibrary_854)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __CarKitLibraryCore_block_invoke_855;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E62BBBA0;
    uint64_t v3 = 0;
    CarKitLibraryCore_frameworkLibrary_854 = _sl_dlopen();
    uint64_t v0 = (void *)v1[0];
    if (CarKitLibraryCore_frameworkLibrary_854)
    {
      if (!v1[0]) {
        return;
      }
    }
    else
    {
      uint64_t v0 = (void *)abort_report_np();
    }
    free(v0);
  }
}

uint64_t __CarKitLibraryCore_block_invoke_855()
{
  uint64_t result = _sl_dlopen();
  CarKitLibraryCore_frameworkLibrary_854 = result;
  return result;
}

void sub_1BC5953F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id INCSerializeNSUserActivity(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__849;
  uint64_t v17 = __Block_byref_object_dispose__850;
  id v18 = 0;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  os_signpost_id_t v10 = __Block_byref_object_copy__849;
  int v11 = __Block_byref_object_dispose__850;
  id v12 = 0;
  [v3 setNeedsSave:0];
  [v3 _intentsPrepareForEncoding];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __INCSerializeNSUserActivity_block_invoke;
  v6[3] = &unk_1E62BBAD8;
  v6[4] = &v13;
  v6[5] = &v7;
  [v3 _createUserActivityDataWithOptions:0 completionHandler:v6];
  if (a2) {
    *a2 = (id) v8[5];
  }
  id v4 = (id)v14[5];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  return v4;
}

void sub_1BC595584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

Class __getUIActivityContinuationActionClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!UIKitLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __UIKitLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E62BBBD0;
    uint64_t v6 = 0;
    UIKitLibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!UIKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("UIActivityContinuationAction");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  getUIActivityContinuationActionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __UIKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  UIKitLibraryCore_frameworkLibrary = result;
  return result;
}

void __INCSerializeNSUserActivity_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  os_signpost_id_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

uint64_t __CarPlayServicesLibraryCore_block_invoke_859()
{
  uint64_t result = _sl_dlopen();
  CarPlayServicesLibraryCore_frameworkLibrary_858 = result;
  return result;
}

void sub_1BC595EC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

Class __getGEOCountryConfigurationClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!GeoServicesLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __GeoServicesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E62BBB88;
    uint64_t v6 = 0;
    GeoServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!GeoServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("GEOCountryConfiguration");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  getGEOCountryConfigurationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCRCarPlayAppPolicyEvaluatorClass_block_invoke(uint64_t a1)
{
  CarKitLibrary();
  Class result = objc_getClass("CRCarPlayAppPolicyEvaluator");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCRCarPlayAppPolicyEvaluatorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__getCRCarPlayAppDeclarationClass_block_invoke(v3);
  }
  return result;
}

Class __getCRCarPlayAppDeclarationClass_block_invoke(uint64_t a1)
{
  CarKitLibrary();
  Class result = objc_getClass("CRCarPlayAppDeclaration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCRCarPlayAppDeclarationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    return (Class)__GeoServicesLibraryCore_block_invoke();
  }
  return result;
}

uint64_t __GeoServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  GeoServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_block_invoke_866(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!AssistantServicesLibraryCore_frameworkLibrary_867)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __AssistantServicesLibraryCore_block_invoke_868;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E62BBB70;
    uint64_t v7 = 0;
    AssistantServicesLibraryCore_frameworkLibrary_867 = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    long long v2 = (void *)AssistantServicesLibraryCore_frameworkLibrary_867;
    if (AssistantServicesLibraryCore_frameworkLibrary_867)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  long long v2 = (void *)AssistantServicesLibraryCore_frameworkLibrary_867;
LABEL_5:
  uint64_t result = dlsym(v2, "AFDeviceSupportsSystemAssistantExperience");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_ptr_865 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                               + 24);
  return result;
}

uint64_t __AssistantServicesLibraryCore_block_invoke_868()
{
  uint64_t result = _sl_dlopen();
  AssistantServicesLibraryCore_frameworkLibrary_867 = result;
  return result;
}

id INCUnderlyingInteractionFromInteraction(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  long long v6 = [v5 intentResponse];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v7 = v6;
    uint64_t v8 = [v7 underlyingIntent];
    id v9 = [v7 underlyingIntentResponse];

    if (v8)
    {
      id v9 = v9;
      id v10 = v8;
      id v11 = [v10 typeName];
      id v12 = [v10 messageData];

      uint64_t v13 = INIntentCreate();

      if (v13)
      {
        if (v9)
        {
          id v14 = [v9 typeName];
          uint64_t v15 = [v9 messageData];
          id v16 = INIntentResponseCreate();
        }
        else
        {
          id v16 = 0;
        }
        uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F30508]) initWithIntent:v13 response:v16];
      }
      else
      {
        uint64_t v20 = 0;
      }

      if (v20)
      {
        uint64_t v21 = [v20 intentResponse];
        __int16 v22 = [v21 userActivity];

        if (!v22)
        {
          id v23 = objc_alloc(MEMORY[0x1E4F22488]);
          __int16 v24 = [v20 intent];
          id v25 = [v24 _className];
          __int16 v22 = (void *)[v23 initWithActivityType:v25];
        }
        id v26 = v22;
        *a2 = v26;
        objc_msgSend(v20, "setIntentHandlingStatus:", objc_msgSend(v5, "intentHandlingStatus"));
        uint64_t v27 = [v20 intent];
        long long v28 = objc_msgSend(v27, "_intents_bundleIdForLaunching");

        if (a3 && v28)
        {
          *a3 = [v20 intent];
        }
        INCUnderlyingInteractionFromInteraction(v20, a2, a3);
        id v19 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v19 = v5;
      }
    }
    else
    {
      uint64_t v17 = [v5 intent];
      id v18 = objc_msgSend(v17, "_intents_bundleIdForLaunching");

      id v10 = 0;
      if (a3 && v18)
      {
        [v5 intent];
        id v10 = 0;
        id v19 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v19 = 0;
      }
    }
  }
  else
  {
    id v19 = v5;
    id v9 = 0;
    id v10 = 0;
  }

  return v19;
}

id INCDeserializeNSUserActivityData(void *a1)
{
  if (a1)
  {
    id v1 = (objc_class *)MEMORY[0x1E4F22488];
    id v2 = a1;
    uint64_t v3 = (void *)[[v1 alloc] _initWithUserActivityData:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

void sub_1BC59874C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLNFullyQualifiedActionIdentifierClass_block_invoke(uint64_t a1)
{
  LinkServicesLibrary();
  Class result = objc_getClass("LNFullyQualifiedActionIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getLNFullyQualifiedActionIdentifierClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__getLNActionDefaultValueProviderClass_block_invoke(v3);
  }
  return result;
}

Class __getLNActionDefaultValueProviderClass_block_invoke(uint64_t a1)
{
  LinkServicesLibrary();
  Class result = objc_getClass("LNActionDefaultValueProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getLNActionDefaultValueProviderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__74__INCWidgetIntentProvider__provideAppIntentWithOptions_completionHandler___block_invoke(v3);
  }
  return result;
}

uint64_t WorkflowKitLibraryCore()
{
  if (!WorkflowKitLibraryCore_frameworkLibrary) {
    WorkflowKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return WorkflowKitLibraryCore_frameworkLibrary;
}

uint64_t getWFLinkActionSerializedParametersForLNActionSymbolLoc()
{
  uint64_t v3 = 0;
  id v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getWFLinkActionSerializedParametersForLNActionSymbolLoc_ptr;
  uint64_t v6 = getWFLinkActionSerializedParametersForLNActionSymbolLoc_ptr;
  if (!getWFLinkActionSerializedParametersForLNActionSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __getWFLinkActionSerializedParametersForLNActionSymbolLoc_block_invoke;
    v2[3] = &unk_1E62BBC68;
    v2[4] = &v3;
    __getWFLinkActionSerializedParametersForLNActionSymbolLoc_block_invoke((uint64_t)v2);
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BC598CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getWFLinkActionSerializedParametersForLNActionSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)WorkflowKitLibraryCore();
  if (!v2)
  {
    id v4 = (void *)abort_report_np();
    free(v4);
  }
  Class result = dlsym(v2, "WFLinkActionSerializedParametersForLNAction");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getWFLinkActionSerializedParametersForLNActionSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

uint64_t __WorkflowKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  WorkflowKitLibraryCore_frameworkLibrary = result;
  return result;
}

void LinkServicesLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!LinkServicesLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __LinkServicesLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E62BBC88;
    uint64_t v3 = 0;
    LinkServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v0 = (void *)v1[0];
    if (LinkServicesLibraryCore_frameworkLibrary)
    {
      if (!v1[0]) {
        return;
      }
    }
    else
    {
      uint64_t v0 = (void *)abort_report_np();
    }
    free(v0);
  }
}

uint64_t __LinkServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  LinkServicesLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t INCExtensionPlugInBundleManagerPath()
{
  return MEMORY[0x1F40E9A98]();
}

uint64_t INExtractAppInfoFromSiriLaunchId()
{
  return MEMORY[0x1F40E9AA8]();
}

uint64_t INFileURLSetAssociatedAuditToken()
{
  return MEMORY[0x1F40E9AB8]();
}

uint64_t INIntentCreate()
{
  return MEMORY[0x1F40E9AD0]();
}

uint64_t INIntentResponseCreate()
{
  return MEMORY[0x1F40E9AE8]();
}

uint64_t INIsDeviceLocked()
{
  return MEMORY[0x1F40E9B18]();
}

uint64_t INIsHomepod()
{
  return MEMORY[0x1F40E9B20]();
}

uint64_t INIssueSandboxExtensionsForFileURLEnumerableToProcess()
{
  return MEMORY[0x1F40E9B30]();
}

uint64_t INLocalAppBundleIdentifierForIntentBundleIdentifier()
{
  return MEMORY[0x1F40E9B38]();
}

uint64_t INLogInitIfNeeded()
{
  return MEMORY[0x1F40E9B40]();
}

uint64_t INProcessHasEntitlement()
{
  return MEMORY[0x1F40E9B60]();
}

uint64_t INThisProcessIsAssistantd()
{
  return MEMORY[0x1F40E9B90]();
}

uint64_t INThisProcessIsRunningAsInstance()
{
  return MEMORY[0x1F40E9B98]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1F412F958]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t SBSCreateLayoutServiceEndpointForExternalDisplay()
{
  return MEMORY[0x1F415C328]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _INExtensionValidateClass()
{
  return MEMORY[0x1F40E9BC8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
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

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t sandbox_check()
{
  return MEMORY[0x1F40CDDD0]();
}