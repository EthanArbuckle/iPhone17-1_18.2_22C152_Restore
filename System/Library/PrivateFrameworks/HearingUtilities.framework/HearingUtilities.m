void sub_20CC897F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AXSettingsReturnBoolValue(void *a1)
{
  id v1 = a1;
  v2 = +[HUNoiseSettings sharedInstance];
  v3 = [v2 _valueForPreferenceKey:v1];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = [v3 BOOLValue];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

void sub_20CC8B088(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CC8B44C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _automationPlayAutomationAudioSamples(uint64_t a1, void *a2)
{
  if ([MEMORY[0x263F472B0] isInternalInstall])
  {
    if (_AXSAutomationEnabled())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        _AXSLiveHeadphoneLevelAutomationSampleData();
        id v3 = (id)objc_claimAutoreleasedReturnValue();
        [a2 _automationStartPlayingSampleData:v3];
      }
    }
  }
}

void sub_20CC8B964(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

id getADAFMetadataKeyHAEDataForGauge()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getADAFMetadataKeyHAEDataForGaugeSymbolLoc_ptr;
  uint64_t v8 = getADAFMetadataKeyHAEDataForGaugeSymbolLoc_ptr;
  if (!getADAFMetadataKeyHAEDataForGaugeSymbolLoc_ptr)
  {
    id v1 = (void *)AudioDataAnalysisLibrary();
    v6[3] = (uint64_t)dlsym(v1, "ADAFMetadataKeyHAEDataForGauge");
    getADAFMetadataKeyHAEDataForGaugeSymbolLoc_ptr = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    ADAFMetadataKeyHAEDataForGauge_cold_1 = (_Unwind_Exception *)getADAFMetadataKeyHAEDataForGauge_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(ADAFMetadataKeyHAEDataForGauge_cold_1);
  }
  uint64_t v2 = *v0;

  return v2;
}

id getAXIDSServicesClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getAXIDSServicesClass_softClass;
  uint64_t v7 = getAXIDSServicesClass_softClass;
  if (!getAXIDSServicesClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAXIDSServicesClass_block_invoke;
    v3[3] = &unk_2640FC9B0;
    v3[4] = &v4;
    __getAXIDSServicesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_20CC8C74C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CC8DE60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getADAMAudioDataReceiverClass_block_invoke(uint64_t a1)
{
  AudioDataAnalysisLibrary();
  Class result = objc_getClass("ADAMAudioDataReceiver");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getADAMAudioDataReceiverClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getADAMAudioDataReceiverClass_block_invoke_cold_1();
    return (Class)AudioDataAnalysisLibrary();
  }
  return result;
}

uint64_t AudioDataAnalysisLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!AudioDataAnalysisLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __AudioDataAnalysisLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_2640FC9D0;
    uint64_t v5 = 0;
    AudioDataAnalysisLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = AudioDataAnalysisLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!AudioDataAnalysisLibraryCore_frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __AudioDataAnalysisLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AudioDataAnalysisLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getADAFMetadataKeyHAEDataForGaugeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AudioDataAnalysisLibrary();
  uint64_t result = dlsym(v2, "ADAFMetadataKeyHAEDataForGauge");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getADAFMetadataKeyHAEDataForGaugeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AXIDSServicesLibraryCore()
{
  if (!AXIDSServicesLibraryCore_frameworkLibrary) {
    AXIDSServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return AXIDSServicesLibraryCore_frameworkLibrary;
}

uint64_t __AXIDSServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AXIDSServicesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getAXIDSServicesClass_block_invoke(uint64_t a1)
{
  AXIDSServicesLibrary();
  Class result = objc_getClass("AXIDSServices");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAXIDSServicesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAXIDSServicesClass_block_invoke_cold_1();
    return (Class)AXIDSServicesLibrary();
  }
  return result;
}

uint64_t AXIDSServicesLibrary()
{
  uint64_t v0 = AXIDSServicesLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t getAXIDSServiceMessageKeySymbolLoc()
{
  uint64_t v3 = 0;
  long long v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getAXIDSServiceMessageKeySymbolLoc_ptr;
  uint64_t v6 = getAXIDSServiceMessageKeySymbolLoc_ptr;
  if (!getAXIDSServiceMessageKeySymbolLoc_ptr)
  {
    id v1 = (void *)AXIDSServicesLibrary();
    v4[3] = (uint64_t)dlsym(v1, "AXIDSServiceMessageKey");
    getAXIDSServiceMessageKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_20CC8E4C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAXIDSServiceMessageKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AXIDSServicesLibrary();
  Class result = dlsym(v2, "AXIDSServiceMessageKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXIDSServiceMessageKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

HUComfortSoundsAssetManager *__getADAMAudioDataAnalysisSampleClass_block_invoke(uint64_t a1)
{
  AudioDataAnalysisLibrary();
  Class result = (HUComfortSoundsAssetManager *)objc_getClass("ADAMAudioDataAnalysisSample");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getADAMAudioDataAnalysisSampleClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (HUComfortSoundsAssetManager *)__getADAMAudioDataAnalysisSampleClass_block_invoke_cold_1();
    return [(HUComfortSoundsAssetManager *)v3 init];
  }
  return result;
}

void sub_20CC8E7F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20CC8F00C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20CC8F3C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t libAccessibilityLibrary()
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v0 = libAccessibilityLibraryCore_frameworkLibrary;
  uint64_t v9 = libAccessibilityLibraryCore_frameworkLibrary;
  if (!libAccessibilityLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __libAccessibilityLibraryCore_block_invoke;
    v3[4] = &unk_2640FCAD0;
    SEL v4 = &v6;
    uint64_t v5 = v3;
    long long v10 = xmmword_2640FCAB0;
    uint64_t v11 = 0;
    v7[3] = _sl_dlopen();
    libAccessibilityLibraryCore_frameworkLibrary = *(void *)(v4[1] + 24);
    uint64_t v0 = v7[3];
  }
  _Block_object_dispose(&v6, 8);
  id v1 = v3[0];
  if (!v0)
  {
    id v1 = (void *)abort_report_np();
    __break(1u);
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void sub_20CC90E8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __libAccessibilityLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  libAccessibilityLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_20CC91508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
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

void UserRequestedAudioTransferNotification()
{
  uint64_t v0 = HCLogHearingHandoff();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_20CC86000, v0, OS_LOG_TYPE_DEFAULT, "User requested handoff", v2, 2u);
  }

  id v1 = +[HUNearbyHearingAidController sharedInstance];
  [v1 requestConnectionForReason:5];
}

void sub_20CC92F78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_20CC944A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va2, a9);
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v16 = va_arg(va2, void);
  uint64_t v18 = va_arg(va2, void);
  uint64_t v19 = va_arg(va2, void);
  uint64_t v20 = va_arg(va2, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va2, 8);
  _Block_object_dispose((const void *)(v9 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_20CC95B3C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 80));
  _Unwind_Resume(a1);
}

void sub_20CC99ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 112), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_2()
{
  return v0;
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void shouldHandleServerStarting()
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  HAInitializeLogging();
  uint64_t v0 = [NSString stringWithFormat:@"HA server is ready."];
  id v1 = [NSString stringWithFormat:@"%s:%d %@", "void shouldHandleServerStarting(CFNotificationCenterRef, void *, CFStringRef, const void *, CFDictionaryRef)", 85, v0];
  uint64_t v2 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v3 = v1;
    SEL v4 = v2;
    *(_DWORD *)buf = 136446210;
    uint64_t v11 = [v3 UTF8String];
    _os_log_impl(&dword_20CC86000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  uint64_t v5 = +[AXHAServer sharedInstance];
  uint64_t v6 = [v5 delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v8 = +[AXHAServer sharedInstance];
    uint64_t v9 = [v8 delegate];
    [v9 hearingServerIsReady];
  }
}

void sub_20CC9D0C4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_20CC9DC24(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_20CC9E8F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20CC9E980(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20CC9EB80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_20CCA2F98(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 96));
  _Unwind_Resume(a1);
}

void sub_20CCA3F54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_20CCA4BE4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_20CCA54CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CCA570C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_20CCA5984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CCA5B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CCA6474(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_20CCA73A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_20CCA8C3C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_20CCB1A30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose((const void *)(v51 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_20CCB411C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_20CCB5280(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20CCB5304(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20CCB6478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CCB6828(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 88));
  _Unwind_Resume(a1);
}

void sub_20CCB6CC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CCB71DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CCB74D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CCB7B78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CCB82D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CCB86D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CCB89F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CCB8C14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CCB90F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getUMUserManagerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getUMUserManagerClass_softClass;
  uint64_t v7 = getUMUserManagerClass_softClass;
  if (!getUMUserManagerClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getUMUserManagerClass_block_invoke;
    v3[3] = &unk_2640FC9B0;
    v3[4] = &v4;
    __getUMUserManagerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_20CCB93CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CCBB09C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

Class __getUMUserManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!UserManagementLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __UserManagementLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2640FDC58;
    uint64_t v6 = 0;
    UserManagementLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!UserManagementLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("UMUserManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getUMUserManagerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getUMUserManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __UserManagementLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  UserManagementLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t AXHACHearingAidComplianceEnabled()
{
  return MEMORY[0x270F907D8]();
}

void AXHACHearingAidComplianceSetEnabled()
{
  _AXSHearingAidComplianceSetEnabled();
  id v0 = +[HUUtilities sharedUtilities];
  [v0 updateHearingFeatureUsage];
}

id _accessibilityHWModel()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  size_t v4 = 128;
  v5[0] = 0;
  id v0 = 0;
  if (sysctlbyname("hw.model", v5, &v4, 0, 0)) {
    BOOL v1 = 1;
  }
  else {
    BOOL v1 = v5[0] == 0;
  }
  if (!v1)
  {
    uint64_t v2 = [NSString stringWithUTF8String:v5];
    id v0 = [v2 lowercaseString];
  }

  return v0;
}

uint64_t AXHACHearingAidCapabilities()
{
  if (AXHACHearingAidCapabilities_onceToken != -1) {
    dispatch_once(&AXHACHearingAidCapabilities_onceToken, &__block_literal_global_9);
  }
  return AXHACHearingAidCapabilities__kAXDeviceHearingAidCapabilitiesCache;
}

uint64_t __AXHACHearingAidCapabilities_block_invoke()
{
  if (MGGetBoolAnswer())
  {
    id v0 = _accessibilityHWModel();
    char v1 = [v0 hasPrefix:@"n92"];

    if (v1) {
      goto LABEL_7;
    }
    int v2 = 2;
  }
  else
  {
    if (!MGGetBoolAnswer()) {
      goto LABEL_7;
    }
    int v2 = 4;
  }
  AXHACHearingAidCapabilities__kAXDeviceHearingAidCapabilitiesCache = v2;
LABEL_7:
  uint64_t result = MGGetBoolAnswer();
  if (result) {
    AXHACHearingAidCapabilities__kAXDeviceHearingAidCapabilitiesCache |= 0x10u;
  }
  return result;
}

void sub_20CCBE254(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_20CCC04AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

id getAFPreferencesClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getAFPreferencesClass_softClass;
  uint64_t v7 = getAFPreferencesClass_softClass;
  if (!getAFPreferencesClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAFPreferencesClass_block_invoke;
    v3[3] = &unk_2640FC9B0;
    v3[4] = &v4;
    __getAFPreferencesClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_20CCC0EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFPreferencesClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __AssistantServicesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2640FDD08;
    uint64_t v6 = 0;
    AssistantServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!AssistantServicesLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("AFPreferences");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getAFPreferencesClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getAFPreferencesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AssistantServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AssistantServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_20CCC26E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id location, id a12)
{
}

id HUNoiseLocString(void *a1)
{
  id v1 = (void *)MEMORY[0x263F086E0];
  id v2 = a1;
  uint64_t v3 = [v1 bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:v2 value:v2 table:@"HearingUtilities_Noise"];

  return v4;
}

id hearingLocString(void *a1)
{
  id v1 = a1;
  id v2 = accessibilityHearingAidSupportBundle();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:v1 table:@"HearingAidSupport"];

  return v3;
}

id accessibilityHearingAidSupportBundle()
{
  id v0 = (void *)accessibilityHearingAidSupportBundle_AXBundle;
  if (!accessibilityHearingAidSupportBundle_AXBundle)
  {
    uint64_t v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v2 = (void *)accessibilityHearingAidSupportBundle_AXBundle;
    accessibilityHearingAidSupportBundle_AXBundle = v1;

    id v0 = (void *)accessibilityHearingAidSupportBundle_AXBundle;
  }

  return v0;
}

id hearingInputRouteStringForOption(uint64_t a1)
{
  id v2 = hearingLocString(@"HearingAidInputOptionsLeft");
  if (a1)
  {
    if (a1 == 3)
    {
      uint64_t v3 = @"HearingAidInputOptionsNeither";
    }
    else
    {
      if (a1 != 2) {
        goto LABEL_10;
      }
      uint64_t v3 = @"HearingAidInputOptionsRight";
    }
  }
  else if ([MEMORY[0x263F472B0] deviceIsWatch])
  {
    uint64_t v3 = @"HearingAidInputOptionsWrist";
  }
  else
  {
    uint64_t v3 = @"HearingAidInputOptionsAutomatic";
  }
  uint64_t v4 = hearingLocString(v3);

  id v2 = (void *)v4;
LABEL_10:

  return v2;
}

uint64_t headphoneStreamSelected()
{
  id v0 = +[HUUtilities sharedUtilities];
  uint64_t v1 = [v0 headphoneStreamSelected];

  return v1;
}

uint64_t liveListenStreamSelected()
{
  id v0 = +[HUUtilities sharedUtilities];
  uint64_t v1 = [v0 liveListenRouteSelected];

  return v1;
}

void liveListenStreamSelectedAsync(void *a1)
{
  id v1 = a1;
  id v2 = +[HUUtilities sharedUtilities];
  [v2 liveListenRouteSelectedAsync:v1];
}

uint64_t hearingEarFromInputOption(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return dword_20CD0F600[a1];
  }
}

uint64_t inputOptionFromHearingEar(int a1)
{
  if ((a1 - 2) > 4) {
    return 3;
  }
  else {
    return qword_20CD0F610[a1 - 2];
  }
}

uint64_t hearingAidStreamAvailable()
{
  id v0 = +[HUUtilities sharedUtilities];
  uint64_t v1 = [v0 hearingAidRouteAvailable];

  return v1;
}

void hearingAidStreamAvailableAsync(void *a1)
{
  id v1 = a1;
  id v2 = +[HUUtilities sharedUtilities];
  [v2 hearingAidRouteAvailableAsync:v1];
}

uint64_t hearingAidStreamSelected()
{
  id v0 = +[HUUtilities sharedUtilities];
  uint64_t v1 = [v0 hearingAidStreamSelected];

  return v1;
}

void hearingAidStreamSelectedAsync(void *a1)
{
  id v1 = a1;
  id v2 = +[HUUtilities sharedUtilities];
  [v2 hearingAidStreamSelectedAsync:v1];
}

uint64_t hearingAidReceivingAudio()
{
  id v0 = [MEMORY[0x263F544E0] sharedAVSystemController];
  id v1 = [v0 attributeForKey:*MEMORY[0x263F54400]];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v1 count])
  {
    id v2 = +[HUUtilities sharedUtilities];
    uint64_t v3 = [v2 hearingAidStreamSelected];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t supportsBinauralStreamingForHearingAid(void *a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v1 = a1;
  size_t v8 = 128;
  v9[0] = 0;
  uint64_t v2 = 0;
  if (sysctlbyname("hw.model", v9, &v8, 0, 0)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = v9[0] == 0;
  }
  if (!v3)
  {
    uint64_t v4 = [NSString stringWithUTF8String:v9];
    long long v5 = [v4 lowercaseString];
    char v6 = [v5 hasPrefix:@"n94"];

    if (v6) {
      uint64_t v2 = 0;
    }
    else {
      uint64_t v2 = [v1 supportsBinauralStreaming];
    }
  }

  return v2;
}

id nameOfHearingDeviceReachableForAudioHandoff()
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v0 = +[HUUtilities sharedUtilities];
  [v0 clearAudioRoutes];

  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__3;
  v26 = __Block_byref_object_dispose__3;
  id v27 = 0;
  dispatch_semaphore_t v1 = dispatch_semaphore_create(0);
  uint64_t v2 = +[HUUtilities sharedUtilities];
  BOOL v3 = [v2 routingQueue];
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __nameOfHearingDeviceReachableForAudioHandoff_block_invoke;
  uint64_t v19 = &unk_2640FD6A0;
  v21 = &v22;
  uint64_t v4 = v1;
  uint64_t v20 = v4;
  dispatch_async(v3, &v16);

  dispatch_time_t v5 = dispatch_time(0, 500000000);
  dispatch_semaphore_wait(v4, v5);
  int v6 = hearingAidStreamAvailable();
  uint64_t v7 = +[HUUtilities sharedUtilities];
  int v8 = [v7 takingConnection];

  if ((v6 ^ 1 | v8) == 1 && [(id)v23[5] length]) {
    id v9 = (id)v23[5];
  }
  else {
    id v9 = 0;
  }
  uint64_t v10 = @"Reachable";
  if (!v9) {
    uint64_t v10 = @"Not Reachable";
  }
  uint64_t v11 = v10;
  uint64_t v12 = HCLogHearingHandoff();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = v23[5];
    *(_DWORD *)buf = 138413058;
    uint64_t v29 = v13;
    __int16 v30 = 1024;
    int v31 = v6;
    __int16 v32 = 1024;
    int v33 = v8;
    __int16 v34 = 2112;
    v35 = v11;
    _os_log_impl(&dword_20CC86000, v12, OS_LOG_TYPE_DEFAULT, "Hearing Aids for handoff: name %@, HA route available: %d, taking connection: %d, result: %@", buf, 0x22u);
  }

  id v14 = v9;
  _Block_object_dispose(&v22, 8);

  return v14;
}

void sub_20CCC302C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

intptr_t __nameOfHearingDeviceReachableForAudioHandoff_block_invoke(uint64_t a1)
{
  uint64_t v2 = +[HUHearingAidSettings sharedInstance];
  uint64_t v3 = [v2 availableHearingDeviceName];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_time_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  int v6 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v6);
}

BOOL propertyContainsProperty(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

id subPropertiesOfProperty(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263EFF980] array];
  for (uint64_t i = 0; i != 64; ++i)
  {
    if (((1 << i) & a1) != 0)
    {
      uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
      [v2 addObject:v4];
    }
  }

  return v2;
}

BOOL propertyIsDependentOnProperty(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1024 || a1 == 0x800000000;
  return a2 == 256 && v3;
}

id hearingPropertyDescription(uint64_t a1)
{
  uint64_t v2 = NSString;
  BOOL v3 = [NSNumber numberWithUnsignedLongLong:a1];
  uint64_t v4 = [v2 stringWithFormat:@"Unknown: %@", v3];

  if (a1 < 0x200000)
  {
    if (a1 <= 1023)
    {
      if (a1 <= 31)
      {
        if (a1 > 7)
        {
          if (a1 == 8)
          {
            dispatch_time_t v5 = @"Left/Right";
            goto LABEL_98;
          }
          if (a1 == 16)
          {
            dispatch_time_t v5 = @"HA ID";
            goto LABEL_98;
          }
        }
        else
        {
          if (a1 == 2) {
            goto LABEL_99;
          }
          if (a1 == 4)
          {
            dispatch_time_t v5 = @"Battery";
            goto LABEL_98;
          }
        }
      }
      else if (a1 <= 127)
      {
        if (a1 == 32)
        {
          dispatch_time_t v5 = @"Other HA ID";
          goto LABEL_98;
        }
        if (a1 == 64)
        {
          dispatch_time_t v5 = @"Mic Attenuation";
          goto LABEL_98;
        }
      }
      else
      {
        switch(a1)
        {
          case 128:
            dispatch_time_t v5 = @"Stream Attenuation";
            goto LABEL_98;
          case 256:
            dispatch_time_t v5 = @"Available Programs";
            goto LABEL_98;
          case 512:
            dispatch_time_t v5 = @"Manufacturer Model";
            goto LABEL_98;
        }
      }
    }
    else if (a1 >= 0x10000)
    {
      if (a1 < 0x40000)
      {
        if (a1 == 0x10000)
        {
          dispatch_time_t v5 = @"Characteristics";
          goto LABEL_98;
        }
        if (a1 == 0x20000)
        {
          dispatch_time_t v5 = @"Program Update";
          goto LABEL_98;
        }
      }
      else
      {
        switch(a1)
        {
          case 0x40000:
            dispatch_time_t v5 = @"Name";
            goto LABEL_98;
          case 0x80000:
            dispatch_time_t v5 = @"Manufacturer";
            goto LABEL_98;
          case 0x100000:
            dispatch_time_t v5 = @"Model";
            goto LABEL_98;
        }
      }
    }
    else if (a1 < 0x2000)
    {
      if (a1 == 1024)
      {
        dispatch_time_t v5 = @"Active Program";
        goto LABEL_98;
      }
      if (a1 == 4096)
      {
        dispatch_time_t v5 = @"Program Name Selector";
        goto LABEL_98;
      }
    }
    else
    {
      switch(a1)
      {
        case 0x2000:
          dispatch_time_t v5 = @"Program Name";
          goto LABEL_98;
        case 0x4000:
          dispatch_time_t v5 = @"Program Category";
          goto LABEL_98;
        case 0x8000:
          dispatch_time_t v5 = @"Services";
          goto LABEL_98;
      }
    }
LABEL_93:
    int v6 = [MEMORY[0x263EFF980] array];
    for (uint64_t i = 0; i != 64; ++i)
    {
      if (((1 << i) & a1) != 0)
      {
        int v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
        [v6 addObject:v8];
      }
    }
    id v9 = NSString;
    uint64_t v10 = [v6 componentsJoinedByString:@" and "];
    dispatch_time_t v5 = [v9 stringWithFormat:@"Properties %@", v10];

    uint64_t v4 = v6;
    goto LABEL_98;
  }
  if (a1 > 0xFFFFFFFFLL)
  {
    if (a1 > 0x1FFFFFFFFFLL)
    {
      if (a1 <= 0x7FFFFFFFFFLL)
      {
        if (a1 == 0x2000000000)
        {
          dispatch_time_t v5 = @"Treble";
          goto LABEL_98;
        }
        if (a1 == 0x4000000000)
        {
          dispatch_time_t v5 = @"Mixed Volume";
          goto LABEL_98;
        }
      }
      else
      {
        switch(a1)
        {
          case 0x8000000000:
            dispatch_time_t v5 = @"Mixed Volume Step Size";
            goto LABEL_98;
          case 0x20000000000:
            dispatch_time_t v5 = @"Device Type";
            goto LABEL_98;
          case 0x80000000000:
            dispatch_time_t v5 = @"Substantially Similar";
            goto LABEL_98;
        }
      }
    }
    else if (a1 <= 0x3FFFFFFFFLL)
    {
      if (a1 == 0x100000000)
      {
        dispatch_time_t v5 = @"Microphone Step Size";
        goto LABEL_98;
      }
      if (a1 == 0x200000000)
      {
        dispatch_time_t v5 = @"Stream Step Size";
        goto LABEL_98;
      }
    }
    else
    {
      switch(a1)
      {
        case 0x400000000:
          dispatch_time_t v5 = @"Sensitivity Step Size";
          goto LABEL_98;
        case 0x800000000:
          dispatch_time_t v5 = @"Active Streaming Program";
          goto LABEL_98;
        case 0x1000000000:
          dispatch_time_t v5 = @"Bass";
          goto LABEL_98;
      }
    }
    goto LABEL_93;
  }
  if (a1 > 0x3FFFFFF)
  {
    if (a1 <= 0x1FFFFFFF)
    {
      if (a1 == 0x4000000)
      {
        dispatch_time_t v5 = @"Paired Status";
        goto LABEL_98;
      }
      if (a1 == 0x10000000)
      {
        dispatch_time_t v5 = @"Spec Version";
        goto LABEL_98;
      }
    }
    else
    {
      switch(a1)
      {
        case 0x20000000:
          dispatch_time_t v5 = @"Bluetooth Pairing";
          goto LABEL_98;
        case 0x40000000:
          dispatch_time_t v5 = @"Substantially Different";
          goto LABEL_98;
        case 0x80000000:
          dispatch_time_t v5 = @"Sensitivity";
          goto LABEL_98;
      }
    }
    goto LABEL_93;
  }
  if (a1 < 0x800000)
  {
    if (a1 == 0x200000)
    {
      dispatch_time_t v5 = @"Connection Status";
      goto LABEL_98;
    }
    if (a1 == 0x400000)
    {
      dispatch_time_t v5 = @"Firmware";
      goto LABEL_98;
    }
    goto LABEL_93;
  }
  if (a1 == 0x800000)
  {
    dispatch_time_t v5 = @"Hardware";
    goto LABEL_98;
  }
  if (a1 == 0x1000000)
  {
    dispatch_time_t v5 = @"Device ID";
    goto LABEL_98;
  }
  if (a1 != 0x2000000) {
    goto LABEL_93;
  }
  dispatch_time_t v5 = @"Device Description";
LABEL_98:

  uint64_t v4 = v5;
LABEL_99:

  return v4;
}

id nameForComplicationPreferredDisplayMode(uint64_t a1)
{
  dispatch_semaphore_t v1 = @"complication.preferred.display.program";
  if (a1 != 1) {
    dispatch_semaphore_t v1 = 0;
  }
  if (a1) {
    return hearingLocString(v1);
  }
  else {
    return hearingLocString(@"complication.preferred.display.mic.volume");
  }
}

id cloudHearingAidDescriptionForDescription(void *a1)
{
  dispatch_semaphore_t v1 = (void *)MEMORY[0x263EFF9A0];
  id v2 = a1;
  BOOL v3 = [v1 dictionaryWithDictionary:v2];
  uint64_t v4 = (void *)MEMORY[0x263EFF9A0];
  dispatch_time_t v5 = [v2 objectForKey:@"ax_hearing_device_left_peripheral_key"];
  int v6 = [v4 dictionaryWithDictionary:v5];

  uint64_t v7 = (void *)MEMORY[0x263EFF9A0];
  int v8 = [v2 objectForKey:@"ax_hearing_device_right_peripheral_key"];

  id v9 = [v7 dictionaryWithDictionary:v8];

  uint64_t v10 = [v6 objectForKey:@"ax_hearing_device_uuid_key"];
  uint64_t v11 = *MEMORY[0x263F47278];
  char v12 = [v10 hasPrefix:*MEMORY[0x263F47278]];

  if ((v12 & 1) == 0)
  {
    uint64_t v13 = NSString;
    id v14 = [v6 objectForKey:@"ax_hearing_device_uuid_key"];
    uint64_t v15 = [v13 stringWithFormat:@"%@%@", v11, v14];
    [v6 setObject:v15 forKey:@"ax_hearing_device_uuid_key"];

    [v3 setObject:v6 forKey:@"ax_hearing_device_left_peripheral_key"];
  }
  uint64_t v16 = [v9 objectForKey:@"ax_hearing_device_uuid_key"];
  char v17 = [v16 hasPrefix:v11];

  if ((v17 & 1) == 0)
  {
    uint64_t v18 = NSString;
    uint64_t v19 = [v9 objectForKey:@"ax_hearing_device_uuid_key"];
    uint64_t v20 = [v18 stringWithFormat:@"%@%@", v11, v19];
    [v9 setObject:v20 forKey:@"ax_hearing_device_uuid_key"];

    [v3 setObject:v9 forKey:@"ax_hearing_device_right_peripheral_key"];
  }

  return v3;
}

BOOL compoundAttributeContainsAttribute(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

uint64_t compoundAttributeByAddingAttribute(uint64_t a1, uint64_t a2)
{
  return a2 | a1;
}

uint64_t compoundAttributeByRemovingAttribute(uint64_t a1, uint64_t a2)
{
  return a1 & ~a2;
}

void iteratePairedBluetoothDevicesOnQueueCBv1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v4)
  {
    dispatch_time_t v5 = [MEMORY[0x263F2B998] sharedInstance];
    int v6 = [v5 bluetoothState];

    if (v3 && v6 == 3)
    {
      uint64_t v7 = [MEMORY[0x263F472B0] bluetoothManagerQueue];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __iteratePairedBluetoothDevicesOnQueueCBv1_block_invoke;
      v8[3] = &unk_2640FDF00;
      id v9 = v3;
      id v10 = v4;
      dispatch_async(v7, v8);
    }
    else
    {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
}

void __iteratePairedBluetoothDevicesOnQueueCBv1_block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F2B998] sharedInstance];
  id v3 = [v2 pairedDevices];
  id v4 = (void *)[v3 copy];

  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __iteratePairedBluetoothDevicesOnQueueCBv1_block_invoke_2;
  v7[3] = &unk_2640FDED8;
  id v9 = &v10;
  id v8 = *(id *)(a1 + 32);
  [v4 enumerateObjectsUsingBlock:v7];
  (*(void (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *((unsigned __int8 *)v11 + 24), v5, v6);

  _Block_object_dispose(&v10, 8);
}

void sub_20CCC3B18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __iteratePairedBluetoothDevicesOnQueueCBv1_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
  return result;
}

void iteratePairedBluetoothDevicesOnQueue(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  if (v4)
  {
    if (v3)
    {
      uint64_t v6 = [MEMORY[0x263F472B0] bluetoothManagerQueue];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __iteratePairedBluetoothDevicesOnQueue_block_invoke;
      v7[3] = &unk_2640FDF00;
      id v8 = v3;
      id v9 = v5;
      dispatch_async(v6, v7);
    }
    else
    {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
}

void __iteratePairedBluetoothDevicesOnQueue_block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263EFEF30] devicesWithDiscoveryFlags:0x80000800000 error:0];
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __iteratePairedBluetoothDevicesOnQueue_block_invoke_2;
  v5[3] = &unk_2640FDF28;
  uint64_t v7 = &v8;
  id v6 = *(id *)(a1 + 32);
  [v2 enumerateObjectsUsingBlock:v5];
  (*(void (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *((unsigned __int8 *)v9 + 24), v3, v4);

  _Block_object_dispose(&v8, 8);
}

void sub_20CCC3D68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __iteratePairedBluetoothDevicesOnQueue_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
  return result;
}

void iterateConnectedBluetoothDevicesOnQueue(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263F2B998] sharedInstance];
    int v6 = [v5 bluetoothState];

    if (v3 && v6 == 3)
    {
      uint64_t v7 = [MEMORY[0x263F472B0] bluetoothManagerQueue];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __iterateConnectedBluetoothDevicesOnQueue_block_invoke;
      v8[3] = &unk_2640FDF00;
      id v9 = v3;
      id v10 = v4;
      dispatch_async(v7, v8);
    }
    else
    {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
}

void __iterateConnectedBluetoothDevicesOnQueue_block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263EFEF30] devicesWithDiscoveryFlags:0x80000200000 error:0];
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __iterateConnectedBluetoothDevicesOnQueue_block_invoke_2;
  v5[3] = &unk_2640FDF28;
  uint64_t v7 = &v8;
  id v6 = *(id *)(a1 + 32);
  [v2 enumerateObjectsUsingBlock:v5];
  (*(void (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *((unsigned __int8 *)v9 + 24), v3, v4);

  _Block_object_dispose(&v8, 8);
}

void sub_20CCC3FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __iterateConnectedBluetoothDevicesOnQueue_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
  return result;
}

void pairedWithDevicesSupportingListeningModes(void *a1)
{
  id v1 = a1;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __pairedWithDevicesSupportingListeningModes_block_invoke_2;
  v3[3] = &unk_2640FCEC8;
  id v4 = v1;
  id v2 = v1;
  iteratePairedBluetoothDevicesOnQueue(&__block_literal_global_11, v3);
}

unint64_t __pairedWithDevicesSupportingListeningModes_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (([v2 deviceFlags] & 0x4000000) != 0) {
    unint64_t v3 = 1;
  }
  else {
    unint64_t v3 = ((unint64_t)[v2 deviceFlags] >> 27) & 1;
  }

  return v3;
}

uint64_t __pairedWithDevicesSupportingListeningModes_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  HAInitializeLogging();
  id v4 = NSString;
  uint64_t v5 = [NSNumber numberWithBool:a2];
  id v6 = [v4 stringWithFormat:@"Paired devices with listening modes: %@", v5];

  uint64_t v7 = [NSString stringWithFormat:@"%s:%d %@", "void pairedWithDevicesSupportingListeningModes(__strong AXBoolBlock _Nonnull)_block_invoke_2", 712, v6];
  uint64_t v8 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v7;
    uint64_t v10 = v8;
    *(_DWORD *)buf = 136446210;
    uint64_t v13 = [v9 UTF8String];
    _os_log_impl(&dword_20CC86000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void getCallStatus(void *a1)
{
  id v1 = a1;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  char v15 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  char v13 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  char v11 = 0;
  id RTTTelephonyUtilitiesClass = getRTTTelephonyUtilitiesClass();
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __getCallStatus_block_invoke;
  v4[3] = &unk_2640FDF90;
  id v6 = v16;
  uint64_t v7 = v14;
  uint64_t v8 = v10;
  id v9 = v12;
  id v3 = v1;
  id v5 = v3;
  [RTTTelephonyUtilitiesClass performCallCenterTask:v4];

  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);
}

void sub_20CCC43C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

id getRTTTelephonyUtilitiesClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getRTTTelephonyUtilitiesClass_softClass;
  uint64_t v7 = getRTTTelephonyUtilitiesClass_softClass;
  if (!getRTTTelephonyUtilitiesClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getRTTTelephonyUtilitiesClass_block_invoke;
    v3[3] = &unk_2640FC9B0;
    void v3[4] = &v4;
    __getRTTTelephonyUtilitiesClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_20CCC44CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getCallStatus_block_invoke(void *a1)
{
  id v5 = [getRTTTelephonyUtilitiesClass() sharedCallCenter];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = [v5 anyCallIsEndpointOnCurrentDevice];
  id v2 = [v5 callsWithStatus:1];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v2 count] != 0;

  id v3 = [v5 callsPassingTest:&__block_literal_global_194];
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = [v3 count] != 0;

  uint64_t v4 = [v5 audioAndVideoCallsWithStatus:1];
  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = [v4 count] != 0;

  (*(void (**)(void))(a1[4] + 16))();
}

BOOL __getCallStatus_block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 status] == 4
    || [v2 status] == 3
    || [v2 status] == 2;

  return v3;
}

void hearingDeamonShouldBeRunning(void *a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = +[HUHearingAidSettings sharedInstance];
  BOOL v3 = [v2 pairedHearingAids];

  if (v3)
  {
    uint64_t v4 = HCLogHearingXPC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v5 = "heard will be running for Hearing Aids";
LABEL_15:
      _os_log_impl(&dword_20CC86000, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 2u);
    }
  }
  else
  {
    uint64_t v6 = [getPASettingsClass() sharedInstance];
    uint64_t v7 = [v6 personalMediaConfiguration];

    if (v7)
    {
      uint64_t v4 = HCLogHearingXPC();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v5 = "heard will be running for PME";
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v8 = +[HUComfortSoundsSettings sharedInstance];
      int v9 = [v8 comfortSoundsEnabled];

      if (v9)
      {
        uint64_t v4 = HCLogHearingXPC();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          id v5 = "heard will be running for Background Sounds";
          goto LABEL_15;
        }
      }
      else
      {
        uint64_t v10 = [getRTTSettingsClass() sharedInstance];
        if ([v10 TTYSoftwareEnabled])
        {
        }
        else
        {
          uint64_t v11 = [getRTTSettingsClass() sharedInstance];
          int v12 = [v11 TTYHardwareEnabled];

          if (!v12)
          {
            if (([MEMORY[0x263F472B0] currentProcessIsSystemApp] & 1) != 0
              || ([MEMORY[0x263F472B0] currentProcessIsPreferences] & 1) != 0
              || [MEMORY[0x263F472B0] currentProcessIsHeard])
            {
              v21[0] = MEMORY[0x263EF8330];
              v21[1] = 3221225472;
              v21[2] = __hearingDeamonShouldBeRunning_block_invoke;
              v21[3] = &unk_2640FCEC8;
              id v22 = v1;
              pairedWithDevicesSupportingListeningModes(v21);
            }
            else
            {
              (*((void (**)(id, void))v1 + 2))(v1, 0);
            }
            goto LABEL_19;
          }
        }
        uint64_t v4 = HCLogHearingXPC();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          id v5 = "heard will be running for RTT";
          goto LABEL_15;
        }
      }
    }
  }

  HAInitializeLogging();
  uint64_t v13 = NSString;
  uint64_t v14 = [NSNumber numberWithBool:1];
  uint64_t v15 = [v13 stringWithFormat:@"heard should be running: %@", v14];

  uint64_t v16 = [NSString stringWithFormat:@"%s:%d %@", "void hearingDeamonShouldBeRunning(__strong AXBoolBlock _Nonnull)", 793, v15];
  uint64_t v17 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v18 = v16;
    uint64_t v19 = v17;
    uint64_t v20 = [v18 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v24 = v20;
    _os_log_impl(&dword_20CC86000, v19, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  (*((void (**)(id, uint64_t))v1 + 2))(v1, 1);
LABEL_19:
}

id getPASettingsClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getPASettingsClass_softClass;
  uint64_t v7 = getPASettingsClass_softClass;
  if (!getPASettingsClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getPASettingsClass_block_invoke;
    v3[3] = &unk_2640FC9B0;
    void v3[4] = &v4;
    __getPASettingsClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_20CCC4ACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getRTTSettingsClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getRTTSettingsClass_softClass;
  uint64_t v7 = getRTTSettingsClass_softClass;
  if (!getRTTSettingsClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getRTTSettingsClass_block_invoke;
    v3[3] = &unk_2640FC9B0;
    void v3[4] = &v4;
    __getRTTSettingsClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_20CCC4BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __hearingDeamonShouldBeRunning_block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t __hearingDeamonShouldBeRunning_block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = HCLogHearingXPC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_20CC86000, v2, OS_LOG_TYPE_DEFAULT, "heard will be running for device that supports listening mode: %@", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL hearingUIShouldBeAvailable()
{
  id v0 = +[HUHearingAidSettings sharedInstance];
  id v1 = [v0 pairedHearingAids];
  if (v1)
  {
    BOOL v2 = 1;
  }
  else
  {
    BOOL v3 = [getPASettingsClass() sharedInstance];
    uint64_t v4 = [v3 personalMediaConfiguration];
    BOOL v2 = v4 != 0;
  }
  return v2;
}

void __getRTTTelephonyUtilitiesClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("RTTTelephonyUtilities");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getRTTTelephonyUtilitiesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getRTTTelephonyUtilitiesClass_block_invoke_cold_1();
    RTTUtilitiesLibrary();
  }
}

void RTTUtilitiesLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!RTTUtilitiesLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __RTTUtilitiesLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_2640FDFD8;
    uint64_t v3 = 0;
    RTTUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  id v0 = (void *)v1[0];
  if (!RTTUtilitiesLibraryCore_frameworkLibrary)
  {
    id v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __RTTUtilitiesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  RTTUtilitiesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getPASettingsClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!PersonalAudioLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __PersonalAudioLibraryCore_block_invoke;
    void v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2640FDFF0;
    uint64_t v6 = 0;
    PersonalAudioLibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!PersonalAudioLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("PASettings");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getPASettingsClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getPASettingsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PersonalAudioLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PersonalAudioLibraryCore_frameworkLibrary = result;
  return result;
}

HUNearbyListenerHelper *__getRTTSettingsClass_block_invoke(uint64_t a1)
{
  RTTUtilitiesLibrary();
  uint64_t result = (HUNearbyListenerHelper *)objc_getClass("RTTSettings");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getRTTSettingsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (HUNearbyListenerHelper *)__getRTTSettingsClass_block_invoke_cold_1();
    return [(HUNearbyListenerHelper *)v3 initWithListenerAddress:v5 andDelegate:v6];
  }
  return result;
}

void sub_20CCC5224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

void sub_20CCC5A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_20CCC6624(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20CCC6B78(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_20CCC70F4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_20CCC76B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20CCC7A44(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_20CCC9314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_20CCC9A34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20CCCA004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20CCCA808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20CCCAA70(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20CCCACCC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  _Unwind_Resume(a1);
}

void sub_20CCCB20C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_20CCCD544(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_20CCCEBE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20CCCEDA4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_20CCCEE98(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20CCCEFCC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20CCD1580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  objc_sync_exit(v21);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_20CCD18B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  objc_sync_exit(v15);
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_20CCD1A3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  objc_sync_exit(v15);
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_20CCD1BC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  objc_sync_exit(v15);
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_20CCD1E34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  objc_sync_exit(v15);
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_20CCD2160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_20CCD24E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  objc_sync_exit(v17);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_20CCD2718(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  objc_sync_exit(v15);
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_20CCD2930(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20CCD2ABC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_20CCD2C5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20CCD2CF4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20CCD2D74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_20CCD2E18(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20CCD2EA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20CCD2F20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_20CCD2FC8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20CCD3058(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20CCD30D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_20CCD454C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CCD4F6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CCD5694(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_20CCD8854(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void UserRequestedAudioTransferCompleteNotification()
{
  id v0 = HCLogHearingHandoff();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_20CC86000, v0, OS_LOG_TYPE_DEFAULT, "User requested handoff complete", v2, 2u);
  }

  uint64_t v1 = +[HUUtilities sharedUtilities];
  [v1 setTakingConnection:0];
}

void UserRequestedAudioTransferNotification_0()
{
  id v0 = HCLogHearingHandoff();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_20CC86000, v0, OS_LOG_TYPE_DEFAULT, "User requested handoff", v2, 2u);
  }

  uint64_t v1 = +[HUUtilities sharedUtilities];
  [v1 setTakingConnection:1];
}

void sub_20CCD99C4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_20CCD9FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_20CCDA424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getRTTSettingsClass_0()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getRTTSettingsClass_softClass_0;
  uint64_t v7 = getRTTSettingsClass_softClass_0;
  if (!getRTTSettingsClass_softClass_0)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getRTTSettingsClass_block_invoke_0;
    v3[3] = &unk_2640FC9B0;
    void v3[4] = &v4;
    __getRTTSettingsClass_block_invoke_0((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_20CCDA508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CCDA734(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_20CCDB1AC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_20CCDB4E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getRTTSettingsClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!RTTUtilitiesLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __RTTUtilitiesLibraryCore_block_invoke_0;
    void v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2640FEA08;
    uint64_t v6 = 0;
    RTTUtilitiesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!RTTUtilitiesLibraryCore_frameworkLibrary_0)
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
    Class result = objc_getClass("RTTSettings");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getRTTSettingsClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getRTTSettingsClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __RTTUtilitiesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  RTTUtilitiesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getPASettingsClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!PersonalAudioLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __PersonalAudioLibraryCore_block_invoke_0;
    void v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2640FEA20;
    uint64_t v6 = 0;
    PersonalAudioLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!PersonalAudioLibraryCore_frameworkLibrary_0)
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
    Class result = objc_getClass("PASettings");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getPASettingsClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getPASettingsClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PersonalAudioLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  PersonalAudioLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_20CCDDD88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_20CCDE288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CCE625C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

void AccessibilitySettingsChangedOnCompanion()
{
  v1[5] = *MEMORY[0x263EF8340];
  v1[0] = @"NoiseEnabled";
  v1[1] = @"OnboardingCompleted";
  v1[2] = @"NotificationsEnabled";
  v1[3] = @"NotificationsThreshold";
  v1[4] = @"NotificationsMuteDate";
  id v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v1 count:5];
  [v0 enumerateObjectsUsingBlock:&__block_literal_global_342];
}

void _axSettingsHandlePreferenceChanged(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = +[HUNoiseSettings sharedInstance];
  [v4 _handlePreferenceChanged:a3];
}

uint64_t AXSettingsReturnUnsignedIntegerValue(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = +[HUNoiseSettings sharedInstance];
  long long v5 = [v4 _valueForPreferenceKey:v3];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    a2 = [v5 unsignedIntegerValue];
  }

  return a2;
}

double AXSettingsReturnDoubleValue(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[HUNoiseSettings sharedInstance];
  id v3 = [v2 _valueForPreferenceKey:v1];

  objc_opt_class();
  double v4 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    [v3 doubleValue];
    double v4 = v5;
  }

  return v4;
}

void __AccessibilitySettingsChangedOnCompanion_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[HUNoiseSettings sharedInstance];
  name = [v3 notificationForPreferenceKey:v2];

  if (name)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, name, 0, 0, 1u);
  }
}

uint64_t HearingDevicesDidChangeNotification(uint64_t a1, void *a2)
{
  return [a2 hearingAidReachabilityDidChange];
}

id AXLogHearingHalPlugin()
{
  if (AXLogHearingHalPlugin_onceToken != -1) {
    dispatch_once(&AXLogHearingHalPlugin_onceToken, &__block_literal_global_18);
  }
  id v0 = (void *)AXLogHearingHalPlugin___logObj;

  return v0;
}

uint64_t __AXLogHearingHalPlugin_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x263F21258], "AXHearingHalPlugin");
  uint64_t v1 = AXLogHearingHalPlugin___logObj;
  AXLogHearingHalPlugin___logObj = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

void UserLevelHearingSetupAvailable()
{
  id v0 = +[AXHeardController sharedServer];
  [v0 continueSetup];
}

void sub_20CCE99C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCCSControlCenterServiceClass()
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getCCSControlCenterServiceClass_softClass;
  uint64_t v7 = getCCSControlCenterServiceClass_softClass;
  if (!getCCSControlCenterServiceClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getCCSControlCenterServiceClass_block_invoke;
    v3[3] = &unk_2640FC9B0;
    void v3[4] = &v4;
    __getCCSControlCenterServiceClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_20CCE9AAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CCEA588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  objc_destroyWeak(v30);
  objc_destroyWeak(v29);
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getPASettingsClass_0()
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getPASettingsClass_softClass_1;
  uint64_t v7 = getPASettingsClass_softClass_1;
  if (!getPASettingsClass_softClass_1)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getPASettingsClass_block_invoke_1;
    v3[3] = &unk_2640FC9B0;
    void v3[4] = &v4;
    __getPASettingsClass_block_invoke_1((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_20CCEA8E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPADatabaseManagerClass()
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getPADatabaseManagerClass_softClass;
  uint64_t v7 = getPADatabaseManagerClass_softClass;
  if (!getPADatabaseManagerClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getPADatabaseManagerClass_block_invoke;
    v3[3] = &unk_2640FC9B0;
    void v3[4] = &v4;
    __getPADatabaseManagerClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_20CCEA9C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPAAccessoryManagerClass()
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getPAAccessoryManagerClass_softClass;
  uint64_t v7 = getPAAccessoryManagerClass_softClass;
  if (!getPAAccessoryManagerClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getPAAccessoryManagerClass_block_invoke;
    v3[3] = &unk_2640FC9B0;
    void v3[4] = &v4;
    __getPAAccessoryManagerClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_20CCEAD30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getRTTSettingsClass_1()
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getRTTSettingsClass_softClass_1;
  uint64_t v7 = getRTTSettingsClass_softClass_1;
  if (!getRTTSettingsClass_softClass_1)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getRTTSettingsClass_block_invoke_1;
    v3[3] = &unk_2640FC9B0;
    void v3[4] = &v4;
    __getRTTSettingsClass_block_invoke_1((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_20CCEB2F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CCEB82C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_20CCEBC70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CCECEE4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

id getRTTControllerClass()
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getRTTControllerClass_softClass;
  uint64_t v7 = getRTTControllerClass_softClass;
  if (!getRTTControllerClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getRTTControllerClass_block_invoke;
    v3[3] = &unk_2640FC9B0;
    void v3[4] = &v4;
    __getRTTControllerClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_20CCECFE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CCED5FC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_20CCED828(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20CCED8AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20CCED914(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20CCED998(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20CCEDBC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18, id a19)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v19);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  objc_destroyWeak(&a19);
  _Unwind_Resume(a1);
}

void sub_20CCEE2E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20CCEE49C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getCCSIconElementRequestClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CCSIconElementRequest");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCCSIconElementRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCCSIconElementRequestClass_block_invoke_cold_1();
    ControlCenterServicesLibrary();
  }
}

void ControlCenterServicesLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!ControlCenterServicesLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __ControlCenterServicesLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_2640FED88;
    uint64_t v3 = 0;
    ControlCenterServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  id v0 = (void *)v1[0];
  if (!ControlCenterServicesLibraryCore_frameworkLibrary)
  {
    id v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __ControlCenterServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ControlCenterServicesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCCSControlCenterServiceClass_block_invoke(uint64_t a1)
{
  ControlCenterServicesLibrary();
  Class result = objc_getClass("CCSControlCenterService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCCSControlCenterServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getCCSControlCenterServiceClass_block_invoke_cold_1();
    return (Class)__getPASettingsClass_block_invoke_1(v3);
  }
  return result;
}

Class __getPASettingsClass_block_invoke_1(uint64_t a1)
{
  PersonalAudioLibrary();
  Class result = objc_getClass("PASettings");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPASettingsClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPASettingsClass_block_invoke_cold_1();
    return (Class)PersonalAudioLibrary();
  }
  return result;
}

uint64_t PersonalAudioLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!PersonalAudioLibraryCore_frameworkLibrary_1)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __PersonalAudioLibraryCore_block_invoke_1;
    void v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_2640FEDA0;
    uint64_t v5 = 0;
    PersonalAudioLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  uint64_t v0 = PersonalAudioLibraryCore_frameworkLibrary_1;
  uint64_t v1 = (void *)v3[0];
  if (!PersonalAudioLibraryCore_frameworkLibrary_1)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __PersonalAudioLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  PersonalAudioLibraryCore_frameworkLibrary_1 = result;
  return result;
}

Class __getPADatabaseManagerClass_block_invoke(uint64_t a1)
{
  PersonalAudioLibrary();
  Class result = objc_getClass("PADatabaseManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPADatabaseManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getPADatabaseManagerClass_block_invoke_cold_1();
    return (Class)__getPAAccessoryManagerClass_block_invoke(v3);
  }
  return result;
}

Class __getPAAccessoryManagerClass_block_invoke(uint64_t a1)
{
  PersonalAudioLibrary();
  Class result = objc_getClass("PAAccessoryManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPAAccessoryManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getPAAccessoryManagerClass_block_invoke_cold_1();
    return (Class)__getRTTSettingsClass_block_invoke_1(v3);
  }
  return result;
}

void __getRTTSettingsClass_block_invoke_1(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("RTTSettings");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getRTTSettingsClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getRTTSettingsClass_block_invoke_cold_1();
    RTTUtilitiesLibrary_0();
  }
}

void RTTUtilitiesLibrary_0()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!RTTUtilitiesLibraryCore_frameworkLibrary_1)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __RTTUtilitiesLibraryCore_block_invoke_1;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_2640FEDB8;
    uint64_t v3 = 0;
    RTTUtilitiesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!RTTUtilitiesLibraryCore_frameworkLibrary_1)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __RTTUtilitiesLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  RTTUtilitiesLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void *__getpaCurrentBluetoothDeviceSupportingTransparencyAccommodationsAsyncSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)PersonalAudioLibrary();
  uint64_t result = dlsym(v2, "paCurrentBluetoothDeviceSupportingTransparencyAccommodationsAsync");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getpaCurrentBluetoothDeviceSupportingTransparencyAccommodationsAsyncSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getRTTControllerClass_block_invoke(uint64_t a1)
{
  RTTUtilitiesLibrary_0();
  Class result = objc_getClass("RTTController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getRTTControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getRTTControllerClass_block_invoke_cold_1();
    return (Class)[(HURoutesManager *)v3 currentPickableAudioRoutes];
  }
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_20CCF0378(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20CCF0C64(_Unwind_Exception *a1)
{
  objc_destroyWeak(v6);
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v7 - 160));
  _Unwind_Resume(a1);
}

void sub_20CCF1028(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void _hearingTestStarted()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CSInitializeLogging();
    uint64_t v0 = [NSString stringWithFormat:@"Hearing test started. Stopping Background Sounds"];
    uint64_t v1 = [NSString stringWithFormat:@"%s:%d %@", "void _hearingTestStarted(CFNotificationCenterRef, void *, CFStringRef, const void *, CFDictionaryRef)", 49, v0];
    long long v2 = (void *)*MEMORY[0x263F47288];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
    {
      id v3 = v1;
      SEL v4 = v2;
      *(_DWORD *)buf = 136446210;
      uint64_t v7 = [v3 UTF8String];
      _os_log_impl(&dword_20CC86000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    uint64_t v5 = +[HUComfortSoundsSettings sharedInstance];
    [v5 setComfortSoundsEnabled:0];
  }
}

void sub_20CCF2BF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  objc_destroyWeak(v29);
  objc_destroyWeak(v28);
  objc_destroyWeak(location);
  objc_destroyWeak(&a28);
  _Unwind_Resume(a1);
}

void sub_20CCF408C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CCF48E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_20CCF6224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20CCF6754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CCF84E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void userChangedAudioRoute(uint64_t a1, uint64_t a2)
{
  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  SEL v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __userChangedAudioRoute_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  dispatch_after(v3, v4, block);
}

uint64_t _hearingTestStarted_0(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    HAInitializeLogging();
    SEL v4 = [NSString stringWithFormat:@"Hearing test started. Stopping Live Listen"];
    uint64_t v5 = [NSString stringWithFormat:@"%s:%d %@", "void _hearingTestStarted(CFNotificationCenterRef, void *, CFStringRef, const void *, CFDictionaryRef)", 54, v4];
    uint64_t v6 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v5;
      uint64_t v8 = v6;
      *(_DWORD *)buf = 136446210;
      uint64_t v10 = [v7 UTF8String];
      _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    return [a2 stopListeningWithCompletion:0];
  }
  return result;
}

uint64_t RenderAudio(void *a1, AudioUnitRenderActionFlags *a2, const AudioTimeStamp *a3, uint64_t a4, UInt32 a5, AudioBufferList *a6)
{
  uint64_t v10 = a1;
  uint64_t v11 = v10;
  if (!v10)
  {
LABEL_5:
    uint64_t v12 = 0;
    goto LABEL_6;
  }
  uint64_t v12 = AudioUnitRender(v10[6], a2, a3, 1u, a5, a6);
  if (!v12)
  {
    if (*((unsigned char *)v11 + 32)) {
      ExtAudioFileWriteAsync(v11[3], a5, a6);
    }
    goto LABEL_5;
  }
LABEL_6:

  return v12;
}

uint64_t __userChangedAudioRoute_block_invoke(uint64_t a1)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    dispatch_time_t v3 = *(void **)(a1 + 32);
    return [v3 audioRouteDidChange:0];
  }
  return result;
}

void sub_20CCFB500(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,uint64_t a23,uint64_t a24,char a25)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20CCFBFD4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_20CCFC708(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_20CCFCCFC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20CCFD480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CCFD580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CCFE988(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_20CCFFE88(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_20CD008C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CD00F84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHKQuantityClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getHKQuantityClass_softClass;
  uint64_t v7 = getHKQuantityClass_softClass;
  if (!getHKQuantityClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getHKQuantityClass_block_invoke;
    v3[3] = &unk_2640FC9B0;
    void v3[4] = &v4;
    __getHKQuantityClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_20CD01080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHKUnitClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getHKUnitClass_softClass;
  uint64_t v7 = getHKUnitClass_softClass;
  if (!getHKUnitClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getHKUnitClass_block_invoke;
    v3[3] = &unk_2640FC9B0;
    void v3[4] = &v4;
    __getHKUnitClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_20CD01164(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHKDeviceClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getHKDeviceClass_softClass;
  uint64_t v7 = getHKDeviceClass_softClass;
  if (!getHKDeviceClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getHKDeviceClass_block_invoke;
    v3[3] = &unk_2640FC9B0;
    void v3[4] = &v4;
    __getHKDeviceClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_20CD01248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CD01708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CD01B88(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

Class __getHKHealthStoreClass_block_invoke(uint64_t a1)
{
  HealthKitLibrary();
  Class result = objc_getClass("HKHealthStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKHealthStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getHKHealthStoreClass_block_invoke_cold_1();
    return (Class)HealthKitLibrary();
  }
  return result;
}

uint64_t HealthKitLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!HealthKitLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __HealthKitLibraryCore_block_invoke;
    void v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_2640FF0B8;
    uint64_t v5 = 0;
    HealthKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = HealthKitLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!HealthKitLibraryCore_frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __HealthKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  HealthKitLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getHKQuantityTypeClass_block_invoke(uint64_t a1)
{
  HealthKitLibrary();
  Class result = objc_getClass("HKQuantityType");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKQuantityTypeClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getHKQuantityTypeClass_block_invoke_cold_1();
    return (Class)__getHKQuantityTypeIdentifierEnvironmentalSoundReductionSymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getHKQuantityTypeIdentifierEnvironmentalSoundReductionSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)HealthKitLibrary();
  Class result = dlsym(v2, "HKQuantityTypeIdentifierEnvironmentalSoundReduction");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHKQuantityTypeIdentifierEnvironmentalSoundReductionSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                              + 8)
                                                                                  + 24);
  return result;
}

Class __getHKDataCollectorClass_block_invoke(uint64_t a1)
{
  HealthKitLibrary();
  Class result = objc_getClass("HKDataCollector");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKDataCollectorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getHKDataCollectorClass_block_invoke_cold_1();
    return (Class)__getADAMAudioDataReceiverClass_block_invoke_0(v3);
  }
  return result;
}

Class __getADAMAudioDataReceiverClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!AudioDataAnalysisLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __AudioDataAnalysisLibraryCore_block_invoke_0;
    void v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2640FF0D0;
    uint64_t v6 = 0;
    AudioDataAnalysisLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!AudioDataAnalysisLibraryCore_frameworkLibrary_0)
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
    Class result = objc_getClass("ADAMAudioDataReceiver");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getADAMAudioDataReceiverClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getADAMAudioDataReceiverClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AudioDataAnalysisLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  AudioDataAnalysisLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getPLLogRegisteredEventSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!PowerLogLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __PowerLogLibraryCore_block_invoke;
    void v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_2640FF0E8;
    uint64_t v7 = 0;
    PowerLogLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    uint64_t v2 = (void *)PowerLogLibraryCore_frameworkLibrary;
    if (PowerLogLibraryCore_frameworkLibrary)
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
  uint64_t v2 = (void *)PowerLogLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "PLLogRegisteredEvent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPLLogRegisteredEventSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PowerLogLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PowerLogLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getHKQuantityClass_block_invoke(uint64_t a1)
{
  HealthKitLibrary();
  Class result = objc_getClass("HKQuantity");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKQuantityClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getHKQuantityClass_block_invoke_cold_1();
    return (Class)__getHKUnitClass_block_invoke(v3);
  }
  return result;
}

Class __getHKUnitClass_block_invoke(uint64_t a1)
{
  HealthKitLibrary();
  Class result = objc_getClass("HKUnit");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKUnitClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getHKUnitClass_block_invoke_cold_1();
    return (Class)__getHKMetadataKeyAudioExposureLevelSymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getHKMetadataKeyAudioExposureLevelSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)HealthKitLibrary();
  Class result = dlsym(v2, "HKMetadataKeyAudioExposureLevel");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHKMetadataKeyAudioExposureLevelSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getHKCategorySampleClass_block_invoke(uint64_t a1)
{
  HealthKitLibrary();
  Class result = objc_getClass("HKCategorySample");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKCategorySampleClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getHKCategorySampleClass_block_invoke_cold_1();
    return (Class)__getHKObjectTypeClass_block_invoke(v3);
  }
  return result;
}

Class __getHKObjectTypeClass_block_invoke(uint64_t a1)
{
  HealthKitLibrary();
  Class result = objc_getClass("HKObjectType");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKObjectTypeClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getHKObjectTypeClass_block_invoke_cold_1();
    return (Class)__getHKCategoryTypeIdentifierEnvironmentalAudioExposureEventSymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getHKCategoryTypeIdentifierEnvironmentalAudioExposureEventSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)HealthKitLibrary();
  Class result = dlsym(v2, "HKCategoryTypeIdentifierEnvironmentalAudioExposureEvent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHKCategoryTypeIdentifierEnvironmentalAudioExposureEventSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                                  + 8)
                                                                                      + 24);
  return result;
}

Class __getHKDeviceClass_block_invoke(uint64_t a1)
{
  HealthKitLibrary();
  Class result = objc_getClass("HKDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKDeviceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getHKDeviceClass_block_invoke_cold_1();
    return (Class)__getHKQuantityDatumClass_block_invoke(v3);
  }
  return result;
}

AXFakeHearingAidDevice *__getHKQuantityDatumClass_block_invoke(uint64_t a1)
{
  HealthKitLibrary();
  Class result = (AXFakeHearingAidDevice *)objc_getClass("HKQuantityDatum");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKQuantityDatumClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (AXFakeHearingAidDevice *)__getHKQuantityDatumClass_block_invoke_cold_1();
    return [(AXFakeHearingAidDevice *)v3 initWithDeviceType:v5];
  }
  return result;
}

void sub_20CD04678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va1, a6);
  va_start(va, a6);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_20CD0484C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CD04C94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CD0771C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t getADAFMetadataKeyHAEDataForGauge_cold_1()
{
  return __getADAMAudioDataReceiverClass_block_invoke_cold_1();
}

uint64_t __getADAMAudioDataReceiverClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAXIDSServicesClass_block_invoke_cold_1(v0);
}

uint64_t __getAXIDSServicesClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getADAMAudioDataAnalysisSampleClass_block_invoke_cold_1(v0);
}

uint64_t __getADAMAudioDataAnalysisSampleClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[HUComfortSound nextFilePath](v0);
}

uint64_t __getUMUserManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAFPreferencesClass_block_invoke_cold_1(v0);
}

uint64_t __getAFPreferencesClass_block_invoke_cold_1()
{
  return __getRTTTelephonyUtilitiesClass_block_invoke_cold_1();
}

uint64_t __getRTTTelephonyUtilitiesClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPASettingsClass_block_invoke_cold_1(v0);
}

uint64_t __getPASettingsClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getRTTSettingsClass_block_invoke_cold_1(v0);
}

uint64_t __getRTTSettingsClass_block_invoke_cold_1()
{
  int v0 = abort_report_np();
  return [(HUAccessoryHearingSyncManager *)v0 shouldUpdateWatchesWithListeningModes:v2];
}

uint64_t __getCCSIconElementRequestClass_block_invoke_cold_1()
{
  return __getCCSControlCenterServiceClass_block_invoke_cold_1();
}

uint64_t __getCCSControlCenterServiceClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPADatabaseManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getPADatabaseManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPAAccessoryManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getPAAccessoryManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getRTTControllerClass_block_invoke_cold_1(v0);
}

void __getRTTControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __48__HURoutesManager_pickableAudioRoutesDidChange___block_invoke_cold_1(v0, v1, v2);
}

uint64_t __getHKHealthStoreClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getHKQuantityTypeClass_block_invoke_cold_1(v0);
}

uint64_t __getHKQuantityTypeClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getHKDataCollectorClass_block_invoke_cold_1(v0);
}

uint64_t __getHKDataCollectorClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getHKQuantityClass_block_invoke_cold_1(v0);
}

uint64_t __getHKQuantityClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getHKUnitClass_block_invoke_cold_1(v0);
}

uint64_t __getHKUnitClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getHKCategorySampleClass_block_invoke_cold_1(v0);
}

uint64_t __getHKCategorySampleClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getHKObjectTypeClass_block_invoke_cold_1(v0);
}

uint64_t __getHKObjectTypeClass_block_invoke_cold_1()
{
  return __getHKDeviceClass_block_invoke_cold_1();
}

uint64_t __getHKDeviceClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getHKQuantityDatumClass_block_invoke_cold_1(v0);
}

uint64_t __getHKQuantityDatumClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return +[HUNearbySettings isTimeStampExpired:](v0);
}

uint64_t AXCFormattedString()
{
  return MEMORY[0x270F09160]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x270F092D8]();
}

uint64_t AXLogIDS()
{
  return MEMORY[0x270F09310]();
}

uint64_t AXLogRTT()
{
  return MEMORY[0x270F09358]();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return MEMORY[0x270F09428]();
}

uint64_t AXPerformBlockOnMainThread()
{
  return MEMORY[0x270F09430]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x270F09440]();
}

uint64_t AXPerformBlockSynchronouslyOnMainThread()
{
  return MEMORY[0x270F09458]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x270F09460]();
}

uint64_t AXSDSoundDetectionHandleNotificationsForResponse()
{
  return MEMORY[0x270F09A00]();
}

uint64_t AX_PERFORM_WITH_LOCK()
{
  return MEMORY[0x270F09570]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

AudioComponent AudioComponentFindNext(AudioComponent inComponent, const AudioComponentDescription *inDesc)
{
  return (AudioComponent)MEMORY[0x270EE2048](inComponent, inDesc);
}

OSStatus AudioComponentInstanceDispose(AudioComponentInstance inInstance)
{
  return MEMORY[0x270EE2058](inInstance);
}

OSStatus AudioComponentInstanceNew(AudioComponent inComponent, AudioComponentInstance *outInstance)
{
  return MEMORY[0x270EE2068](inComponent, outInstance);
}

OSStatus AudioOutputUnitStart(AudioUnit ci)
{
  return MEMORY[0x270EE2158](ci);
}

OSStatus AudioOutputUnitStop(AudioUnit ci)
{
  return MEMORY[0x270EE2160](ci);
}

OSStatus AudioUnitGetParameter(AudioUnit inUnit, AudioUnitParameterID inID, AudioUnitScope inScope, AudioUnitElement inElement, AudioUnitParameterValue *outValue)
{
  return MEMORY[0x270EE22A0](inUnit, *(void *)&inID, *(void *)&inScope, *(void *)&inElement, outValue);
}

OSStatus AudioUnitInitialize(AudioUnit inUnit)
{
  return MEMORY[0x270EE22B8](inUnit);
}

OSStatus AudioUnitRender(AudioUnit inUnit, AudioUnitRenderActionFlags *ioActionFlags, const AudioTimeStamp *inTimeStamp, UInt32 inOutputBusNumber, UInt32 inNumberFrames, AudioBufferList *ioData)
{
  return MEMORY[0x270EE22D0](inUnit, ioActionFlags, inTimeStamp, *(void *)&inOutputBusNumber, *(void *)&inNumberFrames, ioData);
}

OSStatus AudioUnitSetParameter(AudioUnit inUnit, AudioUnitParameterID inID, AudioUnitScope inScope, AudioUnitElement inElement, AudioUnitParameterValue inValue, UInt32 inBufferOffsetInFrames)
{
  return MEMORY[0x270EE22E0](inUnit, *(void *)&inID, *(void *)&inScope, *(void *)&inElement, *(void *)&inBufferOffsetInFrames, inValue);
}

OSStatus AudioUnitSetProperty(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, const void *inData, UInt32 inDataSize)
{
  return MEMORY[0x270EE22E8](inUnit, *(void *)&inID, *(void *)&inScope, *(void *)&inElement, inData, *(void *)&inDataSize);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

uint64_t CSInitializeLogging()
{
  return MEMORY[0x270F39070]();
}

uint64_t CUPrintNSDataAddress()
{
  return MEMORY[0x270F23FC0]();
}

OSStatus ExtAudioFileCreateWithURL(CFURLRef inURL, AudioFileTypeID inFileType, const AudioStreamBasicDescription *inStreamDesc, const AudioChannelLayout *inChannelLayout, UInt32 inFlags, ExtAudioFileRef *outExtAudioFile)
{
  return MEMORY[0x270EE2358](inURL, *(void *)&inFileType, inStreamDesc, inChannelLayout, *(void *)&inFlags, outExtAudioFile);
}

OSStatus ExtAudioFileDispose(ExtAudioFileRef inExtAudioFile)
{
  return MEMORY[0x270EE2368](inExtAudioFile);
}

OSStatus ExtAudioFileSetProperty(ExtAudioFileRef inExtAudioFile, ExtAudioFilePropertyID inPropertyID, UInt32 inPropertyDataSize, const void *inPropertyData)
{
  return MEMORY[0x270EE23B8](inExtAudioFile, *(void *)&inPropertyID, *(void *)&inPropertyDataSize, inPropertyData);
}

OSStatus ExtAudioFileWriteAsync(ExtAudioFileRef inExtAudioFile, UInt32 inNumberFrames, const AudioBufferList *ioData)
{
  return MEMORY[0x270EE23E0](inExtAudioFile, *(void *)&inNumberFrames, ioData);
}

uint64_t HAInitializeLogging()
{
  return MEMORY[0x270F39078]();
}

uint64_t HCHPInitializeLogging()
{
  return MEMORY[0x270F39080]();
}

uint64_t HCLogHearingHandoff()
{
  return MEMORY[0x270F39088]();
}

uint64_t HCLogHearingNearby()
{
  return MEMORY[0x270F39090]();
}

uint64_t HCLogHearingNearbyIDS()
{
  return MEMORY[0x270F39098]();
}

uint64_t HCLogHearingXPC()
{
  return MEMORY[0x270F390A0]();
}

uint64_t HCLogSoundMeter()
{
  return MEMORY[0x270F390A8]();
}

uint64_t HCPerformSafeBlock()
{
  return MEMORY[0x270F390B0]();
}

uint64_t HearingInitializeLogging()
{
  return MEMORY[0x270F390B8]();
}

uint64_t IDSCopyIDForDevice()
{
  return MEMORY[0x270F3C978]();
}

uint64_t IOPSCreatePowerSource()
{
  return MEMORY[0x270EF4920]();
}

uint64_t IOPSReleasePowerSource()
{
  return MEMORY[0x270EF4998]();
}

uint64_t IOPSSetPowerSourceDetails()
{
  return MEMORY[0x270EF49A8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MKBDeviceFormattedForContentProtection()
{
  return MEMORY[0x270F4AE00]();
}

uint64_t MRMediaRemoteCopyPickableRoutes()
{
  return MEMORY[0x270F49F00]();
}

uint64_t MRMediaRemoteGetLocalOrigin()
{
  return MEMORY[0x270F49F68]();
}

uint64_t MRMediaRemoteGetNowPlayingApplicationPlaybackStateForOrigin()
{
  return MEMORY[0x270F49F90]();
}

uint64_t MRMediaRemoteSendCommandToApp()
{
  return MEMORY[0x270F4A050]();
}

uint64_t MRMediaRemoteSetWantsNowPlayingNotifications()
{
  return MEMORY[0x270F4A090]();
}

uint64_t MRMediaRemoteSetWantsRouteChangeNotifications()
{
  return MEMORY[0x270F4A098]();
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t PAInitializeLogging()
{
  return MEMORY[0x270F390C0]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x270EFDCD0](allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x270EFDCE0](allocator, token);
}

uint64_t _AXSAccessibilityPreferenceDomain()
{
  return MEMORY[0x270F90540]();
}

uint64_t _AXSAutomationEnabled()
{
  return MEMORY[0x270F90600]();
}

uint64_t _AXSClosedCaptionsEnabled()
{
  return MEMORY[0x270F90690]();
}

uint64_t _AXSEarpieceNoiseCancellationEnabled()
{
  return MEMORY[0x270F90730]();
}

uint64_t _AXSHearingAidComplianceSetEnabled()
{
  return MEMORY[0x270F907E0]();
}

uint64_t _AXSHearingAidsSetPaired()
{
  return MEMORY[0x270F907F0]();
}

uint64_t _AXSHearingDevicePairedEars()
{
  return MEMORY[0x270F907F8]();
}

uint64_t _AXSHearingSetDevicePairedEars()
{
  return MEMORY[0x270F90810]();
}

uint64_t _AXSHearingSetDevicePairedUUIDs()
{
  return MEMORY[0x270F90818]();
}

uint64_t _AXSInUnitTestMode()
{
  return MEMORY[0x270F90870]();
}

uint64_t _AXSLeftRightAudioBalance()
{
  return MEMORY[0x270F908A8]();
}

uint64_t _AXSLiveHeadphoneLevelAutomationSampleData()
{
  return MEMORY[0x270F908B8]();
}

uint64_t _AXSMonoAudioEnabled()
{
  return MEMORY[0x270F908E0]();
}

uint64_t _AXSSetAccessibilityEnabled()
{
  return MEMORY[0x270F909C0]();
}

uint64_t _AXSSetTripleClickOptions()
{
  return MEMORY[0x270F90A90]();
}

uint64_t _AXSTripleClickContainsOption()
{
  return MEMORY[0x270F90B18]();
}

uint64_t _AXSTripleClickCopyOptions()
{
  return MEMORY[0x270F90B20]();
}

uint64_t _AXSVisualAlertEnabled()
{
  return MEMORY[0x270F90B58]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x270F90B78]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

double __exp10(double a1)
{
  MEMORY[0x270ED7DC8](a1);
  return result;
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

long double cos(long double __x)
{
  MEMORY[0x270ED9128](__x);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9278](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void exit(int a1)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

long double log10(long double __x)
{
  MEMORY[0x270EDA0B0](__x);
  return result;
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

uint64_t messageIdentifierDescription()
{
  return MEMORY[0x270F390C8]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

long double sin(long double __x)
{
  MEMORY[0x270EDB4E8](__x);
  return result;
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB718](__str, __endptr, *(void *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x270EDBE70]();
}

const char *__cdecl xpc_connection_get_name(xpc_connection_t connection)
{
  return (const char *)MEMORY[0x270EDBE90](connection);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x270EDBEA0](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}