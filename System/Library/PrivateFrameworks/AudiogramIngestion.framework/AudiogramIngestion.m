id aiBundle()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t vars8;

  v0 = (void *)aiBundle_AIBundle;
  if (!aiBundle_AIBundle)
  {
    v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v2 = (void *)aiBundle_AIBundle;
    aiBundle_AIBundle = v1;

    v0 = (void *)aiBundle_AIBundle;
  }
  return v0;
}

id audiogramIngestionImageNamed(void *a1)
{
  v1 = (void *)MEMORY[0x263F827E8];
  id v2 = a1;
  v3 = aiBundle();
  v4 = [v1 imageNamed:v2 inBundle:v3];

  return v4;
}

id aiLocString(void *a1)
{
  id v1 = a1;
  id v2 = aiBundle();
  v3 = [v2 localizedStringForKey:v1 value:v1 table:@"AudiogramIngestion"];

  return v3;
}

id aiYodelLocString(void *a1)
{
  id v1 = a1;
  id v2 = aiBundle();
  v3 = [v2 localizedStringForKey:v1 value:v1 table:@"AudiogramIngestion-Yodel"];

  return v3;
}

id validateHearingLevel(void *a1)
{
  id v1 = a1;
  [v1 doubleValue];
  if (v2 > 120.0 || ([v1 doubleValue], v3 < -20.0))
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithDouble:");

    id v1 = (id)v4;
LABEL_4:
    id v5 = v1;
    id v1 = v5;
    goto LABEL_5;
  }
  if (!v1) {
    goto LABEL_4;
  }
  [v1 doubleValue];
  if (v7 != 0.0) {
    goto LABEL_4;
  }
  id v5 = &unk_26F2DB148;
LABEL_5:

  return v5;
}

id snapToValidFrequency(void *a1)
{
  id v1 = a1;
  if ([(id)AIAudiogramValidFrequencies containsObject:v1])
  {
    id v2 = 0;
  }
  else
  {
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x3032000000;
    v10 = __Block_byref_object_copy_;
    v11 = __Block_byref_object_dispose_;
    id v12 = 0;
    int v3 = [v1 intValue];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __snapToValidFrequency_block_invoke;
    v5[3] = &unk_265058560;
    int v6 = v3;
    v5[4] = &v7;
    [(id)AIAudiogramValidFrequencies enumerateObjectsUsingBlock:v5];
    id v2 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }
  return v2;
}

void sub_23F0D9A5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void __snapToValidFrequency_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = a2;
  int v8 = *(_DWORD *)(a1 + 40);
  int v9 = v8 - [v7 intValue];
  if (v9 < 0) {
    int v9 = -v9;
  }
  if ((double)(int)[v7 intValue] * 0.125 >= (double)v9)
  {
    v11 = AXLogAudiogram();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = *(_DWORD *)(a1 + 40);
      v13[0] = 67109378;
      v13[1] = v12;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl(&dword_23F0D7000, v11, OS_LOG_TYPE_INFO, "Shifting frequency %i -> %@", (uint8_t *)v13, 0x12u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  else
  {
    int v10 = *(_DWORD *)(a1 + 40);
    if (v10 >= (int)[v7 intValue]) {
      goto LABEL_10;
    }
  }
  *a4 = 1;
LABEL_10:
}

id labelForSymbolType(uint64_t a1)
{
  id v2 = 0;
  switch(a1)
  {
    case 4:
      int v3 = @"AudiogramIngestionSymbolCircleTitle";
      goto LABEL_7;
    case 8:
      uint64_t v4 = @"AudiogramIngestionSymbolSquareTitle";
      goto LABEL_5;
    case 9:
      uint64_t v4 = @"AudiogramIngestionSymbolTriangleTitle";
LABEL_5:
      id v2 = aiYodelLocString(v4);
      break;
    case 11:
      int v3 = @"AudiogramIngestionSymbolCrossTitle";
LABEL_7:
      id v2 = aiLocString(v3);
      break;
    default:
      break;
  }
  return v2;
}

id filledImageForSymbolType(uint64_t a1)
{
  uint64_t v3 = a1 - 4;
  if (unint64_t)(a1 - 4) <= 7 && ((0xB1u >> v3))
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x263F827E8], "systemImageNamed:", off_2650585E0[v3], v1);
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

id unfilledImageForSymbolType(uint64_t a1)
{
  uint64_t v3 = a1 - 4;
  if (unint64_t)(a1 - 4) <= 7 && ((0xB1u >> v3))
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x263F827E8], "systemImageNamed:", off_265058620[v3], v1);
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

id metadataForHKAudiogramSample()
{
  v16[2] = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  v0 = (id *)getHKMetadataKeyWasUserEnteredSymbolLoc_ptr;
  uint64_t v13 = getHKMetadataKeyWasUserEnteredSymbolLoc_ptr;
  if (!getHKMetadataKeyWasUserEnteredSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)HealthKitLibrary();
    v11[3] = (uint64_t)dlsym(v1, "HKMetadataKeyWasUserEntered");
    getHKMetadataKeyWasUserEnteredSymbolLoc_ptr = v11[3];
    v0 = (id *)v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (!v0) {
    goto LABEL_10;
  }
  id v2 = *v0;
  id v14 = v2;
  uint64_t v3 = MEMORY[0x263EFFA88];
  v16[0] = MEMORY[0x263EFFA88];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v4 = (id *)get_HKPrivateMetadataKeyAudiogramManualIngestionFromFirstPartySymbolLoc_ptr;
  uint64_t v13 = get_HKPrivateMetadataKeyAudiogramManualIngestionFromFirstPartySymbolLoc_ptr;
  if (!get_HKPrivateMetadataKeyAudiogramManualIngestionFromFirstPartySymbolLoc_ptr)
  {
    id v5 = (void *)HealthKitLibrary();
    v11[3] = (uint64_t)dlsym(v5, "_HKPrivateMetadataKeyAudiogramManualIngestionFromFirstParty");
    get_HKPrivateMetadataKeyAudiogramManualIngestionFromFirstPartySymbolLoc_ptr = v11[3];
    uint64_t v4 = (id *)v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (!v4)
  {
LABEL_10:
    metadataForHKAudiogramSample_cold_1();
    __break(1u);
  }
  id v15 = *v4;
  v16[1] = v3;
  int v6 = NSDictionary;
  id v7 = v15;
  int v8 = [v6 dictionaryWithObjects:v16 forKeys:&v14 count:2];

  return v8;
}

void sub_23F0D9FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getHKMetadataKeyWasUserEnteredSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)HealthKitLibrary();
  result = dlsym(v2, "HKMetadataKeyWasUserEntered");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHKMetadataKeyWasUserEnteredSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
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
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2650585A8;
    uint64_t v5 = 0;
    HealthKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = HealthKitLibraryCore_frameworkLibrary;
  uint64_t v1 = (void *)v3[0];
  if (!HealthKitLibraryCore_frameworkLibrary)
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

uint64_t __HealthKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  HealthKitLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_23F0DAA98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F0DC42C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F0DCA68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
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
    v3[3] = &unk_265058588;
    v3[4] = &v4;
    __getHKUnitClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_23F0DCD80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F0DD224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F0DD368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F0DD878(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 120), 8);
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
    v3[3] = &unk_265058588;
    v3[4] = &v4;
    __getHKQuantityClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_23F0DD95C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHKAudiogramSensitivityTestClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getHKAudiogramSensitivityTestClass_softClass;
  uint64_t v7 = getHKAudiogramSensitivityTestClass_softClass;
  if (!getHKAudiogramSensitivityTestClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getHKAudiogramSensitivityTestClass_block_invoke;
    v3[3] = &unk_265058588;
    v3[4] = &v4;
    __getHKAudiogramSensitivityTestClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_23F0DDA40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getHKHealthStoreClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("HKHealthStore");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKHealthStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getHKHealthStoreClass_block_invoke_cold_1();
    HealthKitLibrary_0();
  }
}

void HealthKitLibrary_0()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!HealthKitLibraryCore_frameworkLibrary_0)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __HealthKitLibraryCore_block_invoke_0;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_265058770;
    uint64_t v3 = 0;
    HealthKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!HealthKitLibraryCore_frameworkLibrary_0)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __HealthKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  HealthKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getHKSingleAudiogramChartViewControllerClass_block_invoke(uint64_t a1)
{
  HealthUILibrary();
  Class result = objc_getClass("HKSingleAudiogramChartViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKSingleAudiogramChartViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getHKSingleAudiogramChartViewControllerClass_block_invoke_cold_1();
    return (Class)HealthUILibrary();
  }
  return result;
}

uint64_t HealthUILibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!HealthUILibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __HealthUILibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_265058788;
    uint64_t v5 = 0;
    HealthUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = HealthUILibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!HealthUILibraryCore_frameworkLibrary)
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

uint64_t __HealthUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  HealthUILibraryCore_frameworkLibrary = result;
  return result;
}

Class __getHKAudiogramSampleClass_block_invoke(uint64_t a1)
{
  HealthKitLibrary_0();
  Class result = objc_getClass("HKAudiogramSample");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKAudiogramSampleClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getHKAudiogramSampleClass_block_invoke_cold_1();
    return (Class)__getHKUnitClass_block_invoke(v3);
  }
  return result;
}

Class __getHKUnitClass_block_invoke(uint64_t a1)
{
  HealthKitLibrary_0();
  Class result = objc_getClass("HKUnit");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKUnitClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getHKUnitClass_block_invoke_cold_1();
    return (Class)__getHKAudiogramEarLocalizedDisplayNameForEarSymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getHKAudiogramEarLocalizedDisplayNameForEarSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)HealthUILibrary();
  Class result = dlsym(v2, "HKAudiogramEarLocalizedDisplayNameForEar");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHKAudiogramEarLocalizedDisplayNameForEarSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

Class __getHKQuantityClass_block_invoke(uint64_t a1)
{
  HealthKitLibrary_0();
  Class result = objc_getClass("HKQuantity");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKQuantityClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getHKQuantityClass_block_invoke_cold_1();
    return (Class)__getHKAudiogramSensitivityTestClass_block_invoke(v3);
  }
  return result;
}

Class __getHKAudiogramSensitivityTestClass_block_invoke(uint64_t a1)
{
  HealthKitLibrary_0();
  Class result = objc_getClass("HKAudiogramSensitivityTest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKAudiogramSensitivityTestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getHKAudiogramSensitivityTestClass_block_invoke_cold_1();
    return (Class)__getHKAudiogramSensitivityPointClass_block_invoke(v3);
  }
  return result;
}

void __getHKAudiogramSensitivityPointClass_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  HealthKitLibrary_0();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("HKAudiogramSensitivityPoint");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKAudiogramSensitivityPointClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v10 = (void *)__getHKAudiogramSensitivityPointClass_block_invoke_cold_1();
    OUTLINED_FUNCTION_0(v10, v11, v12, v13, v14, v15, v16, v17, a9);
  }
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_23F0DECA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHKUnitClass_0()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getHKUnitClass_softClass_0;
  uint64_t v7 = getHKUnitClass_softClass_0;
  if (!getHKUnitClass_softClass_0)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getHKUnitClass_block_invoke_0;
    v3[3] = &unk_265058588;
    v3[4] = &v4;
    __getHKUnitClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_23F0E07D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F0E0B8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
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

void __getHKHealthStoreClass_block_invoke_0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("HKHealthStore");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKHealthStoreClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getHKHealthStoreClass_block_invoke_cold_1();
    HealthKitLibrary_1();
  }
}

void HealthKitLibrary_1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!HealthKitLibraryCore_frameworkLibrary_1)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __HealthKitLibraryCore_block_invoke_1;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_265058818;
    uint64_t v3 = 0;
    HealthKitLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!HealthKitLibraryCore_frameworkLibrary_1)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __HealthKitLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  HealthKitLibraryCore_frameworkLibrary_1 = result;
  return result;
}

Class __getHKSingleAudiogramChartViewControllerClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!HealthUILibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __HealthUILibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_265058830;
    uint64_t v6 = 0;
    HealthUILibraryCore_frameworkLibrary_0 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!HealthUILibraryCore_frameworkLibrary_0)
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
    Class result = objc_getClass("HKSingleAudiogramChartViewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getHKSingleAudiogramChartViewControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getHKSingleAudiogramChartViewControllerClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __HealthUILibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  HealthUILibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getHKUnitClass_block_invoke_0(uint64_t a1)
{
  HealthKitLibrary_1();
  Class result = objc_getClass("HKUnit");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKUnitClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (AIAudiogramCropResult *)__getHKUnitClass_block_invoke_cold_1();
    return (Class)[(AIAudiogramCropResult *)v3 description];
  }
  return result;
}

void sub_23F0E4664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t soft_AX_CGRectGetCenter(double a1, double a2, double a3, double a4)
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v8 = (uint64_t (*)(double, double, double, double))getAX_CGRectGetCenterSymbolLoc_ptr;
  uint64_t v15 = getAX_CGRectGetCenterSymbolLoc_ptr;
  if (!getAX_CGRectGetCenterSymbolLoc_ptr)
  {
    uint64_t v9 = (void *)AccessibilityUtilitiesLibrary();
    v13[3] = (uint64_t)dlsym(v9, "AX_CGRectGetCenter");
    getAX_CGRectGetCenterSymbolLoc_ptr = (_UNKNOWN *)v13[3];
    int v8 = (uint64_t (*)(double, double, double, double))v13[3];
  }
  _Block_object_dispose(&v12, 8);
  if (!v8)
  {
    v11 = (_Unwind_Exception *)metadataForHKAudiogramSample_cold_1();
    _Block_object_dispose(&v12, 8);
    _Unwind_Resume(v11);
  }
  return v8(a1, a2, a3, a4);
}

uint64_t soft_AX_CGPointGetDistanceToPoint(double a1, double a2, double a3, double a4)
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v8 = (uint64_t (*)(double, double, double, double))getAX_CGPointGetDistanceToPointSymbolLoc_ptr;
  uint64_t v15 = getAX_CGPointGetDistanceToPointSymbolLoc_ptr;
  if (!getAX_CGPointGetDistanceToPointSymbolLoc_ptr)
  {
    uint64_t v9 = (void *)AccessibilityUtilitiesLibrary();
    v13[3] = (uint64_t)dlsym(v9, "AX_CGPointGetDistanceToPoint");
    getAX_CGPointGetDistanceToPointSymbolLoc_ptr = (_UNKNOWN *)v13[3];
    int v8 = (uint64_t (*)(double, double, double, double))v13[3];
  }
  _Block_object_dispose(&v12, 8);
  if (!v8)
  {
    v11 = (_Unwind_Exception *)metadataForHKAudiogramSample_cold_1();
    _Block_object_dispose(&v12, 8);
    _Unwind_Resume(v11);
  }
  return v8(a1, a2, a3, a4);
}

void sub_23F0E53DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
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

void sub_23F0E5B40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_23F0E6470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 200), 8);
  _Unwind_Resume(a1);
}

void sub_23F0E6A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F0E6D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F0E6FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F0E70CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHKUnitClass_1()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getHKUnitClass_softClass_1;
  uint64_t v7 = getHKUnitClass_softClass_1;
  if (!getHKUnitClass_softClass_1)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getHKUnitClass_block_invoke_1;
    v3[3] = &unk_265058588;
    v3[4] = &v4;
    __getHKUnitClass_block_invoke_1((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_23F0E820C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHKQuantityClass_0()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getHKQuantityClass_softClass_0;
  uint64_t v7 = getHKQuantityClass_softClass_0;
  if (!getHKQuantityClass_softClass_0)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getHKQuantityClass_block_invoke_0;
    v3[3] = &unk_265058588;
    v3[4] = &v4;
    __getHKQuantityClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_23F0E8AA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHKAudiogramSensitivityPointClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getHKAudiogramSensitivityPointClass_softClass_0;
  uint64_t v7 = getHKAudiogramSensitivityPointClass_softClass_0;
  if (!getHKAudiogramSensitivityPointClass_softClass_0)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getHKAudiogramSensitivityPointClass_block_invoke_0;
    v3[3] = &unk_265058588;
    v3[4] = &v4;
    __getHKAudiogramSensitivityPointClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_23F0E8CB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHKAudiogramSampleClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getHKAudiogramSampleClass_softClass_0;
  uint64_t v7 = getHKAudiogramSampleClass_softClass_0;
  if (!getHKAudiogramSampleClass_softClass_0)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getHKAudiogramSampleClass_block_invoke_0;
    v3[3] = &unk_265058588;
    v3[4] = &v4;
    __getHKAudiogramSampleClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_23F0E8D9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F0EA120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

id getHKAudiogramSensitivityTestClass_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2050000000;
  uint64_t v8 = (void *)getHKAudiogramSensitivityTestClass_softClass_0;
  uint64_t v16 = getHKAudiogramSensitivityTestClass_softClass_0;
  if (!getHKAudiogramSensitivityTestClass_softClass_0)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __getHKAudiogramSensitivityTestClass_block_invoke_0;
    v12[3] = &unk_265058588;
    v12[4] = &v13;
    __getHKAudiogramSensitivityTestClass_block_invoke_0((uint64_t)v12, a2, a3, a4, a5, a6, a7, a8, v11);
    uint64_t v8 = (void *)v14[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v13, 8);
  return v9;
}

void sub_23F0EBAC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F0EC460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t AccessibilityUtilitiesLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __AccessibilityUtilitiesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_265058EB8;
    uint64_t v5 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = AccessibilityUtilitiesLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
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

uint64_t __AccessibilityUtilitiesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUtilitiesLibraryCore_frameworkLibrary = result;
  return result;
}

void __getHKUnitClass_block_invoke_1(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("HKUnit");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKUnitClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getHKUnitClass_block_invoke_cold_1();
    HealthKitLibrary_2();
  }
}

void HealthKitLibrary_2()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!HealthKitLibraryCore_frameworkLibrary_2)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __HealthKitLibraryCore_block_invoke_2;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_265058ED0;
    uint64_t v3 = 0;
    HealthKitLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!HealthKitLibraryCore_frameworkLibrary_2)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __HealthKitLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  HealthKitLibraryCore_frameworkLibrary_2 = result;
  return result;
}

Class __getHKQuantityClass_block_invoke_0(uint64_t a1)
{
  HealthKitLibrary_2();
  Class result = objc_getClass("HKQuantity");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKQuantityClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getHKQuantityClass_block_invoke_cold_1();
    return (Class)__getHKAudiogramSensitivityPointClass_block_invoke_0(v3);
  }
  return result;
}

Class __getHKAudiogramSensitivityPointClass_block_invoke_0(uint64_t a1)
{
  HealthKitLibrary_2();
  Class result = objc_getClass("HKAudiogramSensitivityPoint");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKAudiogramSensitivityPointClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getHKAudiogramSensitivityPointClass_block_invoke_cold_1();
    return (Class)__getHKAudiogramSampleClass_block_invoke_0(v3);
  }
  return result;
}

Class __getHKAudiogramSampleClass_block_invoke_0(uint64_t a1)
{
  HealthKitLibrary_2();
  Class result = objc_getClass("HKAudiogramSample");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKAudiogramSampleClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getHKAudiogramSampleClass_block_invoke_cold_1();
    return (Class)__getHKAudiogramSensitivityTestClass_block_invoke_0(v3);
  }
  return result;
}

void __getHKAudiogramSensitivityTestClass_block_invoke_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  HealthKitLibrary_2();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("HKAudiogramSensitivityTest");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKAudiogramSensitivityTestClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v10 = (void *)__getHKAudiogramSensitivityTestClass_block_invoke_cold_1();
    OUTLINED_FUNCTION_0_0(v10, v11, v12, v13, v14, v15, v16, v17, a9);
  }
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_23F0F02A4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_23F0F03B8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_23F0F0528(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

Class __getHKHealthStoreClass_block_invoke_1(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!HealthKitLibraryCore_frameworkLibrary_3)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __HealthKitLibraryCore_block_invoke_3;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_265058F50;
    uint64_t v6 = 0;
    HealthKitLibraryCore_frameworkLibrary_3 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!HealthKitLibraryCore_frameworkLibrary_3)
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
    Class result = objc_getClass("HKHealthStore");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getHKHealthStoreClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getHKHealthStoreClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __HealthKitLibraryCore_block_invoke_3()
{
  uint64_t result = _sl_dlopen();
  HealthKitLibraryCore_frameworkLibrary_3 = result;
  return result;
}

void __getHKUnitPreferenceControllerClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("HKUnitPreferenceController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKUnitPreferenceControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getHKUnitPreferenceControllerClass_block_invoke_cold_1();
    HealthUILibrary_0();
  }
}

void HealthUILibrary_0()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!HealthUILibraryCore_frameworkLibrary_1)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __HealthUILibraryCore_block_invoke_1;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_265058F68;
    uint64_t v3 = 0;
    HealthUILibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!HealthUILibraryCore_frameworkLibrary_1)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __HealthUILibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  HealthUILibraryCore_frameworkLibrary_1 = result;
  return result;
}

Class __getHKSampleTypeUpdateControllerClass_block_invoke(uint64_t a1)
{
  HealthUILibrary_0();
  Class result = objc_getClass("HKSampleTypeUpdateController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKSampleTypeUpdateControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getHKSampleTypeUpdateControllerClass_block_invoke_cold_1();
    return (Class)__getHKAudiogramChartViewControllerClass_block_invoke(v3);
  }
  return result;
}

AIAudiogramLoadingViewController *__getHKAudiogramChartViewControllerClass_block_invoke(uint64_t a1)
{
  HealthUILibrary_0();
  Class result = (AIAudiogramLoadingViewController *)objc_getClass("HKAudiogramChartViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKAudiogramChartViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (AIAudiogramLoadingViewController *)__getHKAudiogramChartViewControllerClass_block_invoke_cold_1();
    return [(AIAudiogramLoadingViewController *)v3 initWithTitle:v5 style:v6];
  }
  return result;
}

void sub_23F0F2048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  _Block_object_dispose((const void *)(v21 - 128), 8);
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

id getHKUnitClass_2()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getHKUnitClass_softClass_2;
  uint64_t v7 = getHKUnitClass_softClass_2;
  if (!getHKUnitClass_softClass_2)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getHKUnitClass_block_invoke_2;
    v3[3] = &unk_265058588;
    v3[4] = &v4;
    __getHKUnitClass_block_invoke_2((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_23F0F227C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F0F2F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F0F4AB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id Soft_HKAudiogramEarLocalizedDisplayNameForEar(uint64_t a1)
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  long long v2 = (void (*)(uint64_t, void))getHKAudiogramEarLocalizedDisplayNameForEarSymbolLoc_ptr_0;
  uint64_t v10 = getHKAudiogramEarLocalizedDisplayNameForEarSymbolLoc_ptr_0;
  if (!getHKAudiogramEarLocalizedDisplayNameForEarSymbolLoc_ptr_0)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getHKAudiogramEarLocalizedDisplayNameForEarSymbolLoc_block_invoke_0;
    v6[3] = &unk_265058588;
    v6[4] = &v7;
    __getHKAudiogramEarLocalizedDisplayNameForEarSymbolLoc_block_invoke_0((uint64_t)v6);
    long long v2 = (void (*)(uint64_t, void))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    id v5 = (_Unwind_Exception *)metadataForHKAudiogramSample_cold_1();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v5);
  }
  uint64_t v3 = v2(a1, 0);
  return v3;
}

void sub_23F0F5B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

id getHKQuantityClass_1()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getHKQuantityClass_softClass_1;
  uint64_t v7 = getHKQuantityClass_softClass_1;
  if (!getHKQuantityClass_softClass_1)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getHKQuantityClass_block_invoke_1;
    v3[3] = &unk_265058588;
    v3[4] = &v4;
    __getHKQuantityClass_block_invoke_1((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_23F0F5D18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getHKUnitClass_block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("HKUnit");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKUnitClass_softClass_2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getHKUnitClass_block_invoke_cold_1();
    HealthKitLibrary_3();
  }
}

void HealthKitLibrary_3()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!HealthKitLibraryCore_frameworkLibrary_4)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __HealthKitLibraryCore_block_invoke_4;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_265059070;
    uint64_t v3 = 0;
    HealthKitLibraryCore_frameworkLibrary_4 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!HealthKitLibraryCore_frameworkLibrary_4)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __HealthKitLibraryCore_block_invoke_4()
{
  uint64_t result = _sl_dlopen();
  HealthKitLibraryCore_frameworkLibrary_4 = result;
  return result;
}

Class __getHKAudiogramSampleClass_block_invoke_1(uint64_t a1)
{
  HealthKitLibrary_3();
  Class result = objc_getClass("HKAudiogramSample");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKAudiogramSampleClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getHKAudiogramSampleClass_block_invoke_cold_1();
    return (Class)__getHKAudiogramEarLocalizedDisplayNameForEarSymbolLoc_block_invoke_0(v3);
  }
  return result;
}

void *__getHKAudiogramEarLocalizedDisplayNameForEarSymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!HealthUILibraryCore_frameworkLibrary_2)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __HealthUILibraryCore_block_invoke_2;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    void v5[5] = v5;
    long long v6 = xmmword_265059088;
    uint64_t v7 = 0;
    HealthUILibraryCore_frameworkLibrary_2 = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    long long v2 = (void *)HealthUILibraryCore_frameworkLibrary_2;
    if (HealthUILibraryCore_frameworkLibrary_2)
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
  long long v2 = (void *)HealthUILibraryCore_frameworkLibrary_2;
LABEL_5:
  Class result = dlsym(v2, "HKAudiogramEarLocalizedDisplayNameForEar");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHKAudiogramEarLocalizedDisplayNameForEarSymbolLoc_ptr_0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24);
  return result;
}

uint64_t __HealthUILibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  HealthUILibraryCore_frameworkLibrary_2 = result;
  return result;
}

Class __getHKQuantityClass_block_invoke_1(uint64_t a1)
{
  HealthKitLibrary_3();
  Class result = objc_getClass("HKQuantity");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKQuantityClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getHKQuantityClass_block_invoke_cold_1();
    return (Class)__getHKAudiogramSensitivityPointClass_block_invoke_1(v3);
  }
  return result;
}

AIAudiogramAxis *__getHKAudiogramSensitivityPointClass_block_invoke_1(uint64_t a1)
{
  HealthKitLibrary_3();
  Class result = (AIAudiogramAxis *)objc_getClass("HKAudiogramSensitivityPoint");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKAudiogramSensitivityPointClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (AIAudiogramAxis *)__getHKAudiogramSensitivityPointClass_block_invoke_cold_1();
    return [(AIAudiogramAxis *)v3 initWithAxis:v5 values:v6];
  }
  return result;
}

void sub_23F0F6AE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
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

void sub_23F0F72B0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_23F0F74B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F0FBBC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,id a43)
{
}

void sub_23F0FC688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
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

Class __getHKHealthStoreClass_block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!HealthKitLibraryCore_frameworkLibrary_5)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __HealthKitLibraryCore_block_invoke_5;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_265059198;
    uint64_t v6 = 0;
    HealthKitLibraryCore_frameworkLibrary_5 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!HealthKitLibraryCore_frameworkLibrary_5)
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
    Class result = objc_getClass("HKHealthStore");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getHKHealthStoreClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getHKHealthStoreClass_softClass_2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __HealthKitLibraryCore_block_invoke_5()
{
  uint64_t result = _sl_dlopen();
  HealthKitLibraryCore_frameworkLibrary_5 = result;
  return result;
}

void __getHKSampleTypeUpdateControllerClass_block_invoke_0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("HKSampleTypeUpdateController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKSampleTypeUpdateControllerClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getHKSampleTypeUpdateControllerClass_block_invoke_cold_1();
    HealthUILibrary_1();
  }
}

void HealthUILibrary_1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!HealthUILibraryCore_frameworkLibrary_3)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __HealthUILibraryCore_block_invoke_3;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_2650591B0;
    uint64_t v3 = 0;
    HealthUILibraryCore_frameworkLibrary_3 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!HealthUILibraryCore_frameworkLibrary_3)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __HealthUILibraryCore_block_invoke_3()
{
  uint64_t result = _sl_dlopen();
  HealthUILibraryCore_frameworkLibrary_3 = result;
  return result;
}

Class __getHKUnitPreferenceControllerClass_block_invoke_0(uint64_t a1)
{
  HealthUILibrary_1();
  Class result = objc_getClass("HKUnitPreferenceController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKUnitPreferenceControllerClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getHKUnitPreferenceControllerClass_block_invoke_cold_1();
    return (Class)__getHKAudiogramChartViewControllerClass_block_invoke_0(v3);
  }
  return result;
}

Class __getHKAudiogramChartViewControllerClass_block_invoke_0(uint64_t a1)
{
  HealthUILibrary_1();
  Class result = objc_getClass("HKAudiogramChartViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKAudiogramChartViewControllerClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getHKAudiogramChartViewControllerClass_block_invoke_cold_1();
    return (Class)__getAXPerformSafeBlockSymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getAXPerformSafeBlockSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_0)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __AccessibilityUtilitiesLibraryCore_block_invoke_0;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    void v5[5] = v5;
    long long v6 = xmmword_2650591C8;
    uint64_t v7 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    long long v2 = (void *)AccessibilityUtilitiesLibraryCore_frameworkLibrary_0;
    if (AccessibilityUtilitiesLibraryCore_frameworkLibrary_0)
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
  long long v2 = (void *)AccessibilityUtilitiesLibraryCore_frameworkLibrary_0;
LABEL_5:
  Class result = dlsym(v2, "AXPerformSafeBlock");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXPerformSafeBlockSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AccessibilityUtilitiesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUtilitiesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_23F0FFC74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

void sub_23F100300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F103500(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Block_object_dispose((const void *)(v1 - 96), 8);
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

id getHKUnitClass_3()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getHKUnitClass_softClass_3;
  uint64_t v7 = getHKUnitClass_softClass_3;
  if (!getHKUnitClass_softClass_3)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getHKUnitClass_block_invoke_3;
    v3[3] = &unk_265058588;
    v3[4] = &v4;
    __getHKUnitClass_block_invoke_3((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_23F1038A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F103C14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

void sub_23F104574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F105458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHKAudiogramSampleClass_0()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getHKAudiogramSampleClass_softClass_2;
  uint64_t v7 = getHKAudiogramSampleClass_softClass_2;
  if (!getHKAudiogramSampleClass_softClass_2)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getHKAudiogramSampleClass_block_invoke_2;
    v3[3] = &unk_265058588;
    v3[4] = &v4;
    __getHKAudiogramSampleClass_block_invoke_2((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_23F107A58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F1085D0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

id getHKQuantityClass_2()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getHKQuantityClass_softClass_2;
  uint64_t v7 = getHKQuantityClass_softClass_2;
  if (!getHKQuantityClass_softClass_2)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getHKQuantityClass_block_invoke_2;
    v3[3] = &unk_265058588;
    v3[4] = &v4;
    __getHKQuantityClass_block_invoke_2((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_23F1086B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHKAudiogramSensitivityTestClass_1()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getHKAudiogramSensitivityTestClass_softClass_1;
  uint64_t v7 = getHKAudiogramSensitivityTestClass_softClass_1;
  if (!getHKAudiogramSensitivityTestClass_softClass_1)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getHKAudiogramSensitivityTestClass_block_invoke_1;
    v3[3] = &unk_265058588;
    v3[4] = &v4;
    __getHKAudiogramSensitivityTestClass_block_invoke_1((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_23F108810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getHKUnitClass_block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("HKUnit");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKUnitClass_softClass_3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getHKUnitClass_block_invoke_cold_1();
    HealthKitLibrary_4();
  }
}

void HealthKitLibrary_4()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!HealthKitLibraryCore_frameworkLibrary_6)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __HealthKitLibraryCore_block_invoke_6;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_265059518;
    uint64_t v3 = 0;
    HealthKitLibraryCore_frameworkLibrary_6 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!HealthKitLibraryCore_frameworkLibrary_6)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __HealthKitLibraryCore_block_invoke_6()
{
  uint64_t result = _sl_dlopen();
  HealthKitLibraryCore_frameworkLibrary_6 = result;
  return result;
}

void __getPHPickerConfigurationClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PHPickerConfiguration");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPHPickerConfigurationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPHPickerConfigurationClass_block_invoke_cold_1();
    PhotosUILibrary();
  }
}

void PhotosUILibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!PhotosUILibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __PhotosUILibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_265059530;
    uint64_t v3 = 0;
    PhotosUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!PhotosUILibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __PhotosUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PhotosUILibraryCore_frameworkLibrary = result;
  return result;
}

Class __getPHPickerFilterClass_block_invoke(uint64_t a1)
{
  PhotosUILibrary();
  Class result = objc_getClass("PHPickerFilter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPHPickerFilterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getPHPickerFilterClass_block_invoke_cold_1();
    return (Class)__getPHPickerViewControllerClass_block_invoke(v3);
  }
  return result;
}

Class __getPHPickerViewControllerClass_block_invoke(uint64_t a1)
{
  PhotosUILibrary();
  Class result = objc_getClass("PHPickerViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPHPickerViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getPHPickerViewControllerClass_block_invoke_cold_1();
    return (Class)__getHKAudiogramSampleClass_block_invoke_2(v3);
  }
  return result;
}

Class __getHKAudiogramSampleClass_block_invoke_2(uint64_t a1)
{
  HealthKitLibrary_4();
  Class result = objc_getClass("HKAudiogramSample");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKAudiogramSampleClass_softClass_2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getHKAudiogramSampleClass_block_invoke_cold_1();
    return (Class)__getHKQuantityClass_block_invoke_2(v3);
  }
  return result;
}

Class __getHKQuantityClass_block_invoke_2(uint64_t a1)
{
  HealthKitLibrary_4();
  Class result = objc_getClass("HKQuantity");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKQuantityClass_softClass_2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getHKQuantityClass_block_invoke_cold_1();
    return (Class)__getHKAudiogramSensitivityTestClass_block_invoke_1(v3);
  }
  return result;
}

Class __getHKAudiogramSensitivityTestClass_block_invoke_1(uint64_t a1)
{
  HealthKitLibrary_4();
  Class result = objc_getClass("HKAudiogramSensitivityTest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKAudiogramSensitivityTestClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getHKAudiogramSensitivityTestClass_block_invoke_cold_1();
    return (Class)__getHKAudiogramSensitivityPointClass_block_invoke_2(v3);
  }
  return result;
}

AIAudiogramAssetManager *__getHKAudiogramSensitivityPointClass_block_invoke_2(uint64_t a1)
{
  HealthKitLibrary_4();
  Class result = (AIAudiogramAssetManager *)objc_getClass("HKAudiogramSensitivityPoint");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKAudiogramSensitivityPointClass_softClass_2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (AIAudiogramAssetManager *)__getHKAudiogramSensitivityPointClass_block_invoke_cold_1();
    return [(AIAudiogramAssetManager *)v3 initWithDelegate:v5];
  }
  return result;
}

void sub_23F109AF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

Class __getAXSettingsClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_1)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __AccessibilityUtilitiesLibraryCore_block_invoke_1;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_265059590;
    uint64_t v5 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
LABEL_8:
      __getAXSettingsClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("AXSettings");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getAXSettingsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AccessibilityUtilitiesLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUtilitiesLibraryCore_frameworkLibrary_1 = result;
  return result;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_23F10A5FC(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_23F10A61C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + _Block_object_dispose(&a9, 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

uint64_t sub_23F10A658(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_23F10A698(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_23F10A6B8(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + _Block_object_dispose(&a9, 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

id sub_23F10A6F8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_23F121010();
    long long v4 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v5 = *v4++;
      objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v5);
      sub_23F120FF0();
      sub_23F121020();
      sub_23F121030();
      sub_23F121000();
      --v2;
    }
    while (v2);
  }
  sub_23F10B0D4();
  uint64_t v6 = (void *)sub_23F120E40();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v1, sel_objectForKeyedSubscript_, v6);

  return v7;
}

CGFloat sub_23F10A80C(int a1, double a2, double a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  long long v12 = xmmword_23F124700;
  long long v13 = xmmword_23F124710;
  long long v14 = 0uLL;
  switch(a1)
  {
    case 1:
      goto LABEL_12;
    case 2:
      CGFloat v15 = -1.0;
      CGFloat v16 = 1.0;
      goto LABEL_7;
    case 3:
      CGFloat v17 = 3.14159265;
      goto LABEL_10;
    case 4:
      CGFloat v15 = 1.0;
      goto LABEL_6;
    case 5:
      CGFloat v15 = -1.0;
LABEL_6:
      CGFloat v16 = -1.0;
LABEL_7:
      CGAffineTransformMakeScale(&v33, v15, v16);
      goto LABEL_11;
    case 6:
      CGFloat v17 = -1.57079633;
      goto LABEL_10;
    case 7:
      CGAffineTransformMakeRotation(&v33, 3.14159265);
      CGAffineTransformScale(&v32, &v33, -1.0, -1.0);
      long long v13 = *(_OWORD *)&v32.a;
      long long v12 = *(_OWORD *)&v32.c;
      long long v14 = *(_OWORD *)&v32.tx;
      goto LABEL_12;
    case 8:
      CGFloat v17 = 1.57079633;
LABEL_10:
      CGAffineTransformMakeRotation(&v33, v17);
LABEL_11:
      long long v13 = *(_OWORD *)&v33.a;
      long long v12 = *(_OWORD *)&v33.c;
      long long v14 = *(_OWORD *)&v33.tx;
LABEL_12:
      long long v29 = v14;
      long long v30 = v12;
      long long v31 = v13;
      CGAffineTransformMakeTranslation(&v33, -0.5, -0.5);
      v34.origin.CGFloat x = a4;
      v34.origin.CGFloat y = a5;
      v34.size.CGFloat width = a6;
      v34.size.CGFloat height = a7;
      CGRect v35 = CGRectApplyAffineTransform(v34, &v33);
      *(_OWORD *)&v33.a = v31;
      *(_OWORD *)&v33.c = v30;
      *(_OWORD *)&v33.tCGFloat x = v29;
      CGRect v36 = CGRectApplyAffineTransform(v35, &v33);
      CGFloat x = v36.origin.x;
      CGFloat y = v36.origin.y;
      CGFloat width = v36.size.width;
      CGFloat height = v36.size.height;
      CGAffineTransformMakeTranslation(&v33, 0.5, 0.5);
      v37.origin.CGFloat x = x;
      v37.origin.CGFloat y = y;
      v37.size.CGFloat width = width;
      v37.size.CGFloat height = height;
      CGRect v38 = CGRectApplyAffineTransform(v37, &v33);
      CGFloat v22 = v38.origin.x;
      CGFloat v23 = v38.origin.y;
      CGFloat v24 = v38.size.width;
      CGFloat v25 = v38.size.height;
      CGFloat v26 = CGRectGetMinX(v38) * a2;
      v39.origin.CGFloat x = v22;
      v39.origin.CGFloat y = v23;
      v39.size.CGFloat width = v24;
      v39.size.CGFloat height = v25;
      CGRectGetMinY(v39);
      v40.origin.CGFloat x = v22;
      v40.origin.CGFloat y = v23;
      v40.size.CGFloat width = v24;
      v40.size.CGFloat height = v25;
      CGRectGetWidth(v40);
      v41.origin.CGFloat x = v22;
      v41.origin.CGFloat y = v23;
      v41.size.CGFloat width = v24;
      v41.size.CGFloat height = v25;
      CGRectGetHeight(v41);
      return v26;
    default:
      type metadata accessor for CGImagePropertyOrientation(0);
      LODWORD(v33.a) = a1;
      sub_23F121170();
      __break(1u);
      JUMPOUT(0x23F10AA80);
  }
}

void sub_23F10AAA0(double a1, double a2)
{
  if (a1 <= -9.22337204e18)
  {
    __break(1u);
    goto LABEL_19;
  }
  if (a1 >= 9.22337204e18)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if ((*(void *)&a1 & 0x7FF0000000000000) == 0x7FF0000000000000
    || (*(void *)&a2 & 0x7FF0000000000000) == 0x7FF0000000000000)
  {
    goto LABEL_20;
  }
  if (a2 <= -9.22337204e18)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (a2 >= 9.22337204e18)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  size_t BitsPerComponent = CGImageGetBitsPerComponent(v2);
  int64_t BitsPerPixel = CGImageGetBitsPerPixel(v2);
  uint64_t v7 = (uint64_t)a1 * BitsPerPixel;
  if ((unsigned __int128)((uint64_t)a1 * (__int128)BitsPerPixel) >> 64 != v7 >> 63)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  size_t v8 = CGImageGetBitsPerComponent(v2);
  if (!v8)
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    return;
  }
  uint64_t v9 = v8;
  if (v7 == 0x8000000000000000 && v8 == -1) {
    goto LABEL_25;
  }
  uint64_t v11 = CGImageGetColorSpace(v2);
  if (!v11)
  {
    uint64_t v11 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
    if (!v11) {
      goto LABEL_26;
    }
  }
  uint32_t BitmapInfo = CGImageGetBitmapInfo(v2);
  long long v13 = CGBitmapContextCreate(0, (uint64_t)a1, (uint64_t)a2, BitsPerComponent, v7 / v9, v11, BitmapInfo);

  if (v13)
  {
    CGContextSetInterpolationQuality(v13, kCGInterpolationHigh);
    long long v14 = v13;
    sub_23F120F00();

    CGBitmapContextCreateImage(v14);
  }
}

uint64_t sub_23F10AC74(uint64_t a1, uint64_t a2)
{
  return sub_23F10ADE0(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_23F10AC8C(uint64_t a1, id *a2)
{
  uint64_t result = sub_23F120DA0();
  *a2 = 0;
  return result;
}

uint64_t sub_23F10AD04(uint64_t a1, id *a2)
{
  char v3 = sub_23F120DB0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_23F10AD84@<X0>(uint64_t *a1@<X8>)
{
  sub_23F120DC0();
  uint64_t v2 = sub_23F120D90();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_23F10ADC8(uint64_t a1, uint64_t a2)
{
  return sub_23F10ADE0(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_23F10ADE0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_23F120DC0();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_23F10AE24()
{
  sub_23F120DC0();
  sub_23F120DF0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F10AE78()
{
  sub_23F120DC0();
  sub_23F121180();
  sub_23F120DF0();
  uint64_t v0 = sub_23F1211A0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23F10AEEC()
{
  uint64_t v0 = sub_23F120DC0();
  uint64_t v2 = v1;
  if (v0 == sub_23F120DC0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_23F121160();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_23F10AF78@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_23F120D90();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_23F10AFC0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23F120DC0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23F10AFEC(uint64_t a1)
{
  uint64_t v2 = sub_23F10B200((unint64_t *)&qword_268C35350);
  uint64_t v3 = sub_23F10B200(&qword_268C35358);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

double sub_23F10B084(double a1, double a2, double a3)
{
  double v3 = a1 - a3 * 0.5;
  if (v3 < 0.0) {
    double v3 = 0.0;
  }
  return fmin(v3, 1.0);
}

unint64_t sub_23F10B0D4()
{
  unint64_t result = qword_268C353C0;
  if (!qword_268C353C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268C353C0);
  }
  return result;
}

void type metadata accessor for CGImagePropertyOrientation(uint64_t a1)
{
}

void type metadata accessor for Key(uint64_t a1)
{
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_23F10B150(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_23F10B198()
{
  return sub_23F10B200(&qword_268C35338);
}

uint64_t sub_23F10B1CC()
{
  return sub_23F10B200(&qword_268C35340);
}

uint64_t sub_23F10B200(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Key(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23F10B244()
{
  return sub_23F10B200(&qword_268C35348);
}

void sub_23F10B280()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC18AudiogramIngestion31AudiogramFrequencySelectionCell_frequency];
  if (!v1)
  {
    id v8 = objc_msgSend(v0, sel_textLabel);
    if (!v8) {
      return;
    }
    id v35 = v8;
    objc_msgSend(v8, sel_setText_, 0);
    goto LABEL_9;
  }
  id v35 = v1;
  if (sub_23F120ED0() >= 1000)
  {
    uint64_t v9 = (void *)sub_23F120D90();
    id v10 = aiLocString(v9);

    uint64_t v5 = sub_23F120DC0();
    uint64_t v7 = v11;

    if (__ROR8__(0x1CAC083126E978D5 * sub_23F120ED0() + 0x10624DD2F1A9FB8, 3) < 0x4189374BC6A7EFuLL)
    {
      uint64_t v27 = (uint64_t)objc_msgSend(v35, sel_integerValue) / 1000;
      id v2 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v27);
      goto LABEL_12;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C35370);
    uint64_t v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_23F124900;
    objc_msgSend(v35, sel_doubleValue);
    uint64_t v13 = MEMORY[0x263F8D5B8];
    *(void *)(v12 + 56) = MEMORY[0x263F8D538];
    *(void *)(v12 + 64) = v13;
    *(double *)(v12 + 32) = v14 / 1000.0;
    uint64_t v15 = sub_23F120DE0();
    uint64_t v17 = v16;
    id v18 = objc_msgSend(v0, sel_textLabel);
    if (!v18)
    {
      swift_bridgeObjectRelease();

      goto LABEL_19;
    }
    v19 = v18;
    v20 = (void *)sub_23F120D90();
    id v21 = aiLocString(v20);

    sub_23F120DC0();
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_23F124910;
    uint64_t v23 = MEMORY[0x263F8D310];
    *(void *)(v22 + 56) = MEMORY[0x263F8D310];
    unint64_t v24 = sub_23F10B944();
    *(void *)(v22 + 32) = v15;
    *(void *)(v22 + 40) = v17;
    *(void *)(v22 + 96) = v23;
    *(void *)(v22 + 104) = v24;
    *(void *)(v22 + 64) = v24;
    *(void *)(v22 + 72) = v5;
    *(void *)(v22 + 80) = v7;
    sub_23F120DE0();
    swift_bridgeObjectRelease();
    CGFloat v25 = (void *)sub_23F120D90();
    swift_bridgeObjectRelease();
    objc_msgSend(v19, sel_setText_, v25);

LABEL_9:
    CGFloat v26 = v35;
LABEL_14:

    return;
  }
  id v2 = v35;
  double v3 = (void *)sub_23F120D90();
  id v4 = aiLocString(v3);

  uint64_t v5 = sub_23F120DC0();
  uint64_t v7 = v6;

LABEL_12:
  id v28 = objc_msgSend(v0, sel_textLabel);
  if (v28)
  {
    long long v29 = v28;
    long long v30 = (void *)sub_23F120D90();
    id v31 = aiLocString(v30);

    sub_23F120DC0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C35370);
    uint64_t v32 = swift_allocObject();
    *(_OWORD *)(v32 + 16) = xmmword_23F124910;
    *(void *)(v32 + 56) = sub_23F10B0D4();
    *(void *)(v32 + 64) = sub_23F10B998();
    *(void *)(v32 + 32) = v2;
    *(void *)(v32 + 96) = MEMORY[0x263F8D310];
    *(void *)(v32 + 104) = sub_23F10B944();
    *(void *)(v32 + 72) = v5;
    *(void *)(v32 + 80) = v7;
    id v34 = v2;
    sub_23F120DE0();
    swift_bridgeObjectRelease();
    CGAffineTransform v33 = (void *)sub_23F120D90();
    swift_bridgeObjectRelease();
    objc_msgSend(v29, sel_setText_, v33);

    CGFloat v26 = v34;
    goto LABEL_14;
  }

LABEL_19:
  swift_bridgeObjectRelease();
}

id sub_23F10B898()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AudiogramFrequencySelectionCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AudiogramFrequencySelectionCell()
{
  return self;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_23F10B944()
{
  unint64_t result = qword_268C35378;
  if (!qword_268C35378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C35378);
  }
  return result;
}

unint64_t sub_23F10B998()
{
  unint64_t result = qword_268C353D0;
  if (!qword_268C353D0)
  {
    sub_23F10B0D4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C353D0);
  }
  return result;
}

char *AudiogramFrequencySelectionViewController.__allocating_init(title:detailText:selectedFrequencies:delegate:isModal:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  id v15 = objc_allocWithZone(v7);
  return AudiogramFrequencySelectionViewController.init(title:detailText:selectedFrequencies:delegate:isModal:)(a1, a2, a3, a4, a5, a6, a7);
}

char *AudiogramFrequencySelectionViewController.init(title:detailText:selectedFrequencies:delegate:isModal:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  swift_unknownObjectWeakInit();
  *(void *)&v7[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_tableViewHeightConstraint] = 0;
  *(void *)&v7[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_audiogram] = 0;
  uint64_t v9 = MEMORY[0x263F8EE78];
  *(void *)&v7[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_frequencies] = MEMORY[0x263F8EE78];
  *(void *)&v7[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_selectedFrequencies] = v9;
  uint64_t v10 = OBJC_IVAR___AIAudiogramFrequencySelectionViewController_continueButton;
  uint64_t v11 = self;
  uint64_t v12 = v7;
  *(void *)&v7[v10] = objc_msgSend(v11, sel_boldButton);
  *(void *)&v12[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_doneButton] = 0;
  v12[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_isModal] = a7;

  uint64_t v13 = (void *)sub_23F120D90();
  swift_bridgeObjectRelease();
  double v14 = (void *)sub_23F120D90();
  swift_bridgeObjectRelease();
  v36.receiver = v12;
  v36.super_class = (Class)type metadata accessor for AudiogramFrequencySelectionViewController();
  id v15 = (char *)objc_msgSendSuper2(&v36, sel_initWithTitle_detailText_symbolName_adoptTableViewScrollView_, v13, v14, 0, 1);

  swift_unknownObjectWeakAssign();
  uint64_t v16 = &v15[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_selectedFrequencies];
  swift_beginAccess();
  *(void *)uint64_t v16 = a5;
  uint64_t v17 = v15;
  swift_bridgeObjectRelease();
  id v18 = (void *)AIAudiogramValidFrequencies;
  sub_23F10B0D4();
  id v19 = v18;
  sub_23F120E50();

  id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F824A8]), sel_initWithBarButtonSystemItem_target_action_, 1, v17, sel_cancelTapped_);
  if (a7)
  {
    id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F824A8]), sel_initWithBarButtonSystemItem_target_action_, 0, v17, sel_doneTapped_);
    uint64_t v22 = OBJC_IVAR___AIAudiogramFrequencySelectionViewController_doneButton;
    uint64_t v23 = *(void **)&v17[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_doneButton];
    *(void *)&v17[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_doneButton] = v21;

    id v24 = objc_msgSend(v17, sel_navigationItem);
    id v25 = *(id *)&v17[v22];
    objc_msgSend(v24, sel_setRightBarButtonItem_, v25);

    objc_msgSend(v17, sel_setModalInPresentation_, 1);
  }
  else
  {
    id v26 = objc_msgSend(v17, sel_navigationItem);
    objc_msgSend(v26, sel_setRightBarButtonItem_, v20);

    uint64_t v27 = OBJC_IVAR___AIAudiogramFrequencySelectionViewController_continueButton;
    id v28 = *(id *)&v17[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_continueButton];
    long long v29 = (void *)sub_23F120D90();
    id v30 = aiLocString(v29);

    sub_23F120DC0();
    id v31 = (void *)sub_23F120D90();
    swift_bridgeObjectRelease();
    objc_msgSend(v28, sel_setTitle_forState_, v31, 0);

    objc_msgSend(*(id *)&v17[v27], sel_addTarget_action_forControlEvents_, v17, sel_continueToIndividualSensitivityPointInput_, 64);
    id v32 = objc_msgSend(v17, sel_buttonTray);
    objc_msgSend(v32, sel_addButton_, *(void *)&v17[v27]);

    sub_23F10C698();
  }
  id v33 = objc_msgSend(v17, sel_navigationItem);
  objc_msgSend(v33, sel_setBackButtonDisplayMode_, 1);

  swift_unknownObjectRelease();
  return v17;
}

uint64_t type metadata accessor for AudiogramFrequencySelectionViewController()
{
  return self;
}

void AudiogramFrequencySelectionViewController.__allocating_init(coder:)()
{
  uint64_t v1 = (char *)objc_allocWithZone(v0);
  swift_unknownObjectWeakInit();
  *(void *)&v1[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_tableViewHeightConstraint] = 0;
  *(void *)&v1[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_audiogram] = 0;
  uint64_t v2 = MEMORY[0x263F8EE78];
  *(void *)&v1[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_frequencies] = MEMORY[0x263F8EE78];
  *(void *)&v1[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_selectedFrequencies] = v2;
  uint64_t v3 = OBJC_IVAR___AIAudiogramFrequencySelectionViewController_continueButton;
  *(void *)&v1[v3] = objc_msgSend(self, sel_boldButton);
  *(void *)&v1[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_doneButton] = 0;

  sub_23F121060();
  __break(1u);
}

void AudiogramFrequencySelectionViewController.init(coder:)()
{
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_tableViewHeightConstraint] = 0;
  *(void *)&v0[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_audiogram] = 0;
  uint64_t v1 = MEMORY[0x263F8EE78];
  *(void *)&v0[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_frequencies] = MEMORY[0x263F8EE78];
  *(void *)&v0[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_selectedFrequencies] = v1;
  uint64_t v2 = OBJC_IVAR___AIAudiogramFrequencySelectionViewController_continueButton;
  *(void *)&v0[v2] = objc_msgSend(self, sel_boldButton);
  *(void *)&v0[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_doneButton] = 0;

  sub_23F121060();
  __break(1u);
}

void sub_23F10C13C(char a1)
{
  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for AudiogramFrequencySelectionViewController();
  objc_msgSendSuper2(&v9, sel_viewWillAppear_, a1 & 1);
  uint64_t v3 = (void *)MEMORY[0x2455C57F0](&v1[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_delegate]);
  if (v3)
  {
    id v4 = objc_msgSend(v3, sel_getCurrentSelectedFrequencies);
    swift_unknownObjectRelease();
    sub_23F10B0D4();
    uint64_t v5 = sub_23F120E60();
  }
  else
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
  }
  uint64_t v6 = (uint64_t *)&v1[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_selectedFrequencies];
  swift_beginAccess();
  *uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v1, sel_tableView);
  if (v7)
  {
    id v8 = v7;
    objc_msgSend(v7, sel_reloadData);

    sub_23F10C698();
  }
  else
  {
    __break(1u);
  }
}

void sub_23F10C2A0()
{
  v18.receiver = v0;
  v18.super_class = (Class)type metadata accessor for AudiogramFrequencySelectionViewController();
  objc_msgSendSuper2(&v18, sel_viewDidLoad);
  id v1 = objc_msgSend(v0, sel_headerView);
  LODWORD(v2) = 1036831949;
  objc_msgSend(v1, sel_setTitleHyphenationFactor_, v2);

  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82C78]), sel_initWithFrame_style_, 2, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v0, sel_setTableView_, v3);

  id v4 = objc_msgSend(v0, sel_tableView);
  if (!v4)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v5 = v4;
  objc_msgSend(v4, sel_setDataSource_, v0);

  id v6 = objc_msgSend(v0, sel_tableView);
  if (!v6)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  id v7 = v6;
  objc_msgSend(v6, sel_setDelegate_, v0);

  id v8 = objc_msgSend(v0, sel_tableView);
  if (!v8)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  objc_super v9 = v8;
  objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  id v10 = objc_msgSend(v0, sel_view);
  if (!v10)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v11 = v10;
  id v12 = objc_msgSend(self, sel_systemGroupedBackgroundColor);
  objc_msgSend(v11, sel_setBackgroundColor_, v12);

  id v13 = objc_msgSend(v0, sel_tableView);
  if (v13)
  {
    double v14 = v13;
    type metadata accessor for AudiogramFrequencySelectionCell();
    ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
    uint64_t v16 = NSStringFromClass(ObjCClassFromMetadata);
    sub_23F120DC0();

    uint64_t v17 = (void *)sub_23F120D90();
    swift_bridgeObjectRelease();
    objc_msgSend(v14, sel_registerClass_forCellReuseIdentifier_, ObjCClassFromMetadata, v17);

    return;
  }
LABEL_11:
  __break(1u);
}

void sub_23F10C698()
{
  id v1 = *(void **)(v0 + OBJC_IVAR___AIAudiogramFrequencySelectionViewController_continueButton);
  double v2 = (unint64_t *)(v0 + OBJC_IVAR___AIAudiogramFrequencySelectionViewController_selectedFrequencies);
  swift_beginAccess();
  if (*v2 >> 62)
  {
    id v9 = v1;
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_23F121070();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id v4 = v1;
  }
  objc_msgSend(v1, sel_setEnabled_, v3 > 0);

  uint64_t v5 = *(void **)(v0 + OBJC_IVAR___AIAudiogramFrequencySelectionViewController_doneButton);
  if (v5)
  {
    unint64_t v6 = *v2;
    if (v6 >> 62)
    {
      id v10 = v5;
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_23F121070();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
      id v8 = v5;
    }
    objc_msgSend(v5, sel_setEnabled_, v7 > 0);
  }
}

unint64_t sub_23F10C7CC(void *a1)
{
  uint64_t v2 = v1;
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82C80]), sel_init);
  unint64_t result = sub_23F120CF0();
  unint64_t v6 = result;
  uint64_t v7 = *(void *)(v1 + OBJC_IVAR___AIAudiogramFrequencySelectionViewController_frequencies);
  if ((v7 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    id v8 = (id)MEMORY[0x2455C4A50](v6, v7);
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (result >= *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_14:
    __break(1u);
    return result;
  }
  id v8 = *(id *)(v7 + 8 * result + 32);
LABEL_5:
  type metadata accessor for AudiogramFrequencySelectionCell();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  id v10 = NSStringFromClass(ObjCClassFromMetadata);
  sub_23F120DC0();

  uint64_t v11 = (void *)sub_23F120D90();
  swift_bridgeObjectRelease();
  id v12 = (void *)sub_23F120CD0();
  id v13 = objc_msgSend(a1, sel_dequeueReusableCellWithIdentifier_forIndexPath_, v11, v12);

  uint64_t v14 = swift_dynamicCastClass();
  if (v14)
  {
    id v15 = (void *)v14;
    uint64_t v16 = *(void **)(v14 + OBJC_IVAR____TtC18AudiogramIngestion31AudiogramFrequencySelectionCell_frequency);
    *(void *)(v14 + OBJC_IVAR____TtC18AudiogramIngestion31AudiogramFrequencySelectionCell_frequency) = v8;
    id v17 = v8;

    sub_23F10B280();
    objc_super v18 = (unint64_t *)(v2 + OBJC_IVAR___AIAudiogramFrequencySelectionViewController_selectedFrequencies);
    swift_beginAccess();
    unint64_t v19 = *v18;
    swift_bridgeObjectRetain();
    LOBYTE(v16) = sub_23F10C9EC((uint64_t)v17, v19);
    swift_bridgeObjectRelease();
    if (v16) {
      uint64_t v20 = 3;
    }
    else {
      uint64_t v20 = 0;
    }
    id v21 = v13;
    objc_msgSend(v15, sel_setAccessoryType_, v20);

    return (unint64_t)v15;
  }
  else
  {
  }
  return (unint64_t)v4;
}

uint64_t sub_23F10C9EC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_23F121070())
  {
    unint64_t v4 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      id v5 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      id v5 = (id)MEMORY[0x2455C4A50](0, a2);
LABEL_5:
      unint64_t v6 = v5;
      sub_23F10B0D4();
      char v7 = sub_23F120F50();

      if (v7)
      {
LABEL_6:
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v3 == 1) {
        goto LABEL_18;
      }
      if (v4) {
        break;
      }
      unint64_t v4 = 5;
      while (1)
      {
        unint64_t v12 = v4 - 3;
        if (__OFADD__(v4 - 4, 1)) {
          break;
        }
        id v13 = *(id *)(a2 + 8 * v4);
        char v14 = sub_23F120F50();

        if (v14) {
          goto LABEL_6;
        }
        ++v4;
        if (v12 == v3) {
          goto LABEL_18;
        }
      }
      __break(1u);
    }
    uint64_t v9 = 1;
    while (1)
    {
      MEMORY[0x2455C4A50](v9, a2);
      uint64_t v10 = v9 + 1;
      if (__OFADD__(v9, 1)) {
        break;
      }
      char v11 = sub_23F120F50();
      swift_unknownObjectRelease();
      if (v11) {
        goto LABEL_6;
      }
      ++v9;
      if (v10 == v3) {
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_23F10CC78()
{
  unint64_t v1 = *(void *)(v0 + OBJC_IVAR___AIAudiogramFrequencySelectionViewController_frequencies);
  if (!(v1 >> 62)) {
    return *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_23F121070();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_23F10CD6C()
{
  return 1;
}

void sub_23F10CD7C(void *a1)
{
  uint64_t v2 = v1;
  unint64_t v4 = (void *)sub_23F120CD0();
  objc_msgSend(a1, sel_deselectRowAtIndexPath_animated_, v4, 1);

  id v5 = (void *)sub_23F120CD0();
  id v49 = objc_msgSend(a1, sel_cellForRowAtIndexPath_, v5);

  if (v49)
  {
    type metadata accessor for AudiogramFrequencySelectionCell();
    uint64_t v6 = swift_dynamicCastClass();
    if (v6
      && (char v7 = (void *)v6,
          (id v8 = *(void **)(v6 + OBJC_IVAR____TtC18AudiogramIngestion31AudiogramFrequencySelectionCell_frequency)) != 0))
    {
      uint64_t v9 = (unint64_t *)&v2[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_selectedFrequencies];
      swift_beginAccess();
      unint64_t v10 = *v9;
      id v11 = v8;
      swift_bridgeObjectRetain();
      char v12 = sub_23F10C9EC((uint64_t)v11, v10);
      swift_bridgeObjectRelease();
      id v13 = &OBJC_PROTOCOL___UITextFieldDelegate;
      if (v12)
      {
        unint64_t v14 = *v9;
        swift_bridgeObjectRetain();
        sub_23F10D4B0((uint64_t)v11, v14);
        unint64_t v16 = v15;
        char v18 = v17;
        swift_bridgeObjectRelease();
        if ((v18 & 1) == 0)
        {
          if (v2[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_isModal] == 1)
          {
            unint64_t v19 = (void *)sub_23F120D90();
            id v20 = aiLocString(v19);

            sub_23F120DC0();
            __swift_instantiateConcreteTypeFromMangledName(&qword_268C35370);
            uint64_t v21 = swift_allocObject();
            *(_OWORD *)(v21 + 16) = xmmword_23F124900;
            *(void *)(v21 + 56) = sub_23F10B0D4();
            *(void *)(v21 + 64) = sub_23F10B998();
            *(void *)(v21 + 32) = v11;
            id v22 = v11;
            sub_23F120DE0();
            swift_bridgeObjectRelease();
            uint64_t v23 = (void *)sub_23F120D90();
            id v24 = aiLocString(v23);

            sub_23F120DC0();
            id v25 = (void *)sub_23F120D90();
            swift_bridgeObjectRelease();
            id v26 = (void *)sub_23F120D90();
            swift_bridgeObjectRelease();
            id v48 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, v25, v26, 0);

            uint64_t v27 = (void *)sub_23F120D90();
            id v28 = aiLocString(v27);

            sub_23F120DC0();
            long long v29 = (void *)sub_23F120D90();
            swift_bridgeObjectRelease();
            v54 = (uint64_t (*)(uint64_t))nullsub_1;
            v55 = 0;
            uint64_t aBlock = MEMORY[0x263EF8330];
            uint64_t v51 = 1107296256;
            v52 = sub_23F10D640;
            v53 = &block_descriptor;
            id v30 = _Block_copy(&aBlock);
            swift_release();
            id v31 = self;
            id v32 = objc_msgSend(v31, sel_actionWithTitle_style_handler_, v29, 1, v30);
            _Block_release(v30);

            objc_msgSend(v48, sel_addAction_, v32);
            id v33 = (void *)sub_23F120D90();
            id v34 = aiLocString(v33);

            sub_23F120DC0();
            id v35 = (void *)swift_allocObject();
            v35[2] = v2;
            v35[3] = v16;
            v35[4] = v7;
            objc_super v36 = v2;
            id v37 = v49;
            CGRect v38 = (void *)sub_23F120D90();
            swift_bridgeObjectRelease();
            v54 = sub_23F10D8D8;
            v55 = v35;
            uint64_t aBlock = MEMORY[0x263EF8330];
            uint64_t v51 = 1107296256;
            v52 = sub_23F10D640;
            v53 = &block_descriptor_3;
            CGRect v39 = _Block_copy(&aBlock);
            swift_release();
            id v40 = objc_msgSend(v31, sel_actionWithTitle_style_handler_, v38, 0, v39);
            CGRect v41 = v39;
            id v13 = &OBJC_PROTOCOL___UITextFieldDelegate;
            _Block_release(v41);

            objc_msgSend(v48, sel_addAction_, v40);
            objc_msgSend(v36, sel_presentViewController_animated_completion_, v48, 1, 0);
          }
          else
          {
            swift_beginAccess();
            v44 = (void *)sub_23F10D79C(v16);
            swift_endAccess();

            objc_msgSend(v7, sel_setAccessoryType_, 0);
          }
        }
      }
      else
      {
        swift_beginAccess();
        id v42 = v11;
        MEMORY[0x2455C48C0]();
        if (*(void *)((*v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_23F120E80();
        }
        sub_23F120EA0();
        sub_23F120E70();
        swift_endAccess();
        objc_msgSend(v7, sel_setAccessoryType_, 3);
        if (v2[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_isModal] == 1)
        {
          v43 = (void *)MEMORY[0x2455C57F0](&v2[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_delegate]);
          if (v43)
          {
            objc_msgSend(v43, sel_didSelectNodeToAddWithSelectedFrequency_, v42);
            swift_unknownObjectRelease();
          }
        }
      }
      sub_23F10C698();
      uint64_t v45 = MEMORY[0x2455C57F0](&v2[(unint64_t)v13[12].class_meths]);
      if (v45)
      {
        v46 = (void *)v45;
        sub_23F10B0D4();
        swift_bridgeObjectRetain();
        v47 = (void *)sub_23F120E40();
        swift_bridgeObjectRelease();
        objc_msgSend(v46, sel_updateSelectedFrequenciesWithSelectedFrequencies_, v47);

        swift_unknownObjectRelease();
      }
      else
      {
      }
    }
    else
    {
    }
  }
}

void sub_23F10D4B0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      if ((a2 & 0xC000000000000001) != 0)
      {
        id v4 = (id)MEMORY[0x2455C4A50](0, a2);
      }
      else
      {
        if (!*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return;
        }
        id v4 = *(id *)(a2 + 32);
      }
      id v5 = v4;
      sub_23F10B0D4();
      char v6 = sub_23F120F50();

      if ((v6 & 1) == 0)
      {
        for (uint64_t i = 0; ; ++i)
        {
          unint64_t v11 = i + 1;
          if (__OFADD__(i, 1)) {
            break;
          }
          if (v11 == v3) {
            return;
          }
          if ((a2 & 0xC000000000000001) != 0)
          {
            id v8 = (id)MEMORY[0x2455C4A50](i + 1, a2);
          }
          else
          {
            if ((v11 & 0x8000000000000000) != 0) {
              goto LABEL_18;
            }
            if (v11 >= *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_19;
            }
            id v8 = *(id *)(a2 + 32 + 8 * v11);
          }
          uint64_t v9 = v8;
          char v10 = sub_23F120F50();

          if (v10) {
            return;
          }
        }
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        swift_bridgeObjectRetain();
        uint64_t v3 = sub_23F121070();
        swift_bridgeObjectRelease();
        if (v3) {
          continue;
        }
      }
      return;
    }
  }
}

void sub_23F10D640(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_23F10D6A8(uint64_t a1, uint64_t a2, unint64_t a3, void *a4)
{
  swift_beginAccess();
  char v7 = (void *)sub_23F10D79C(a3);
  swift_endAccess();

  objc_msgSend(a4, sel_setAccessoryType_, 0);
  sub_23F10C698();
  uint64_t result = MEMORY[0x2455C57F0](a2 + OBJC_IVAR___AIAudiogramFrequencySelectionViewController_delegate);
  if (result)
  {
    uint64_t v9 = (void *)result;
    sub_23F10B0D4();
    swift_bridgeObjectRetain();
    char v10 = (void *)sub_23F120E40();
    swift_bridgeObjectRelease();
    objc_msgSend(v9, sel_updateSelectedFrequenciesWithSelectedFrequencies_, v10);

    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_23F10D79C(unint64_t a1)
{
  uint64_t v3 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  uint64_t *v1 = v3;
  if (!isUniquelyReferenced_nonNull_bridgeObject || v3 < 0 || (v3 & 0x4000000000000000) != 0)
  {
    uint64_t v3 = sub_23F11016C(v3);
    uint64_t *v1 = v3;
  }
  uint64_t v5 = v3 & 0xFFFFFFFFFFFFFF8;
  unint64_t v6 = *(void *)(v5 + 16);
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v7 = v6 - 1;
    uint64_t v8 = v6 - 1 - a1;
    if (v8 >= 0)
    {
      uint64_t v9 = v5 + 8 * a1;
      uint64_t v10 = *(void *)(v9 + 32);
      memmove((void *)(v9 + 32), (const void *)(v9 + 40), 8 * v8);
      *(void *)(v5 + 16) = v7;
      sub_23F120E70();
      return v10;
    }
  }
  uint64_t result = sub_23F121090();
  __break(1u);
  return result;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_23F10D898()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_23F10D8D8(uint64_t a1)
{
  return sub_23F10D6A8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32));
}

id sub_23F10D9E0()
{
  if (v0[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_isModal] == 1)
  {
    return objc_msgSend(v0, sel_dismissViewControllerAnimated_completion_, 1, 0);
  }
  else
  {
    id result = (id)MEMORY[0x2455C57F0](&v0[OBJC_IVAR___AIAudiogramFrequencySelectionViewController_delegate]);
    if (result)
    {
      objc_msgSend(result, sel_showIndividualFirstSensitivityPointInputViewController);
      return (id)swift_unknownObjectRelease();
    }
  }
  return result;
}

id AudiogramFrequencySelectionViewController.__allocating_init(title:detailText:symbolName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = (void *)sub_23F120D90();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    uint64_t v10 = 0;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v11 = 0;
    goto LABEL_6;
  }
  uint64_t v10 = (void *)sub_23F120D90();
  swift_bridgeObjectRelease();
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v11 = (void *)sub_23F120D90();
  swift_bridgeObjectRelease();
LABEL_6:
  id v12 = objc_msgSend(objc_allocWithZone(v6), sel_initWithTitle_detailText_symbolName_, v9, v10, v11);

  return v12;
}

void AudiogramFrequencySelectionViewController.init(title:detailText:symbolName:)()
{
}

id AudiogramFrequencySelectionViewController.__allocating_init(title:detailText:icon:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  unint64_t v6 = v5;
  uint64_t v9 = (void *)sub_23F120D90();
  swift_bridgeObjectRelease();
  if (a4)
  {
    uint64_t v10 = (void *)sub_23F120D90();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = objc_msgSend(objc_allocWithZone(v6), sel_initWithTitle_detailText_icon_, v9, v10, a5);

  return v11;
}

void AudiogramFrequencySelectionViewController.init(title:detailText:icon:)()
{
}

id AudiogramFrequencySelectionViewController.__allocating_init(title:detailText:symbolName:adoptTableViewScrollView:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t v8 = v7;
  id v12 = (void *)sub_23F120D90();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    id v13 = 0;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v14 = 0;
    goto LABEL_6;
  }
  id v13 = (void *)sub_23F120D90();
  swift_bridgeObjectRelease();
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v14 = (void *)sub_23F120D90();
  swift_bridgeObjectRelease();
LABEL_6:
  id v15 = objc_msgSend(objc_allocWithZone(v8), sel_initWithTitle_detailText_symbolName_adoptTableViewScrollView_, v12, v13, v14, a7 & 1);

  return v15;
}

void AudiogramFrequencySelectionViewController.init(title:detailText:symbolName:adoptTableViewScrollView:)()
{
}

id AudiogramFrequencySelectionViewController.__allocating_init(title:detailText:icon:adoptTableViewScrollView:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, char a6)
{
  unint64_t v7 = v6;
  id v11 = (void *)sub_23F120D90();
  swift_bridgeObjectRelease();
  if (a4)
  {
    id v12 = (void *)sub_23F120D90();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v12 = 0;
  }
  id v13 = objc_msgSend(objc_allocWithZone(v7), sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v11, v12, a5, a6 & 1);

  return v13;
}

void AudiogramFrequencySelectionViewController.init(title:detailText:icon:adoptTableViewScrollView:)()
{
}

id AudiogramFrequencySelectionViewController.__deallocating_deinit()
{
  return sub_23F10DF8C((SEL *)&selRef_dealloc);
}

id sub_23F10DF8C(SEL *a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for AudiogramFrequencySelectionViewController();
  return objc_msgSendSuper2(&v4, *a1);
}

uint64_t method lookup function for AudiogramFrequencySelectionViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AudiogramFrequencySelectionViewController);
}

uint64_t dispatch thunk of AudiogramFrequencySelectionViewController.__allocating_init(title:detailText:selectedFrequencies:delegate:isModal:)()
{
  return (*(uint64_t (**)(void))(v0 + 336))();
}

uint64_t dispatch thunk of AudiogramFrequencySelectionViewController.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 344))();
}

uint64_t dispatch thunk of AudiogramFrequencySelectionViewController.tableView(_:cellForRowAt:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of AudiogramFrequencySelectionViewController.tableView(_:numberOfRowsInSection:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of AudiogramFrequencySelectionViewController.numberOfSections(in:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of AudiogramFrequencySelectionViewController.tableView(_:didSelectRowAt:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x190))();
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_23F10E1E4(uint64_t a1)
{
  return a1;
}

id AudiogramDetectorResult.graph.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC18AudiogramIngestion23AudiogramDetectorResult_graph);
}

uint64_t AudiogramDetectorResult.symbols.getter()
{
  return swift_bridgeObjectRetain();
}

id AudiogramDetectorResult.__allocating_init(graph:symbols:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (char *)objc_allocWithZone(v2);
  *(void *)&v5[OBJC_IVAR____TtC18AudiogramIngestion23AudiogramDetectorResult_graph] = a1;
  *(void *)&v5[OBJC_IVAR____TtC18AudiogramIngestion23AudiogramDetectorResult_symbols] = a2;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_init);
}

id AudiogramDetectorResult.init(graph:symbols:)(uint64_t a1, uint64_t a2)
{
  *(void *)&v2[OBJC_IVAR____TtC18AudiogramIngestion23AudiogramDetectorResult_graph] = a1;
  *(void *)&v2[OBJC_IVAR____TtC18AudiogramIngestion23AudiogramDetectorResult_symbols] = a2;
  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for AudiogramDetectorResult();
  return objc_msgSendSuper2(&v4, sel_init);
}

uint64_t type metadata accessor for AudiogramDetectorResult()
{
  return self;
}

id AudiogramDetectorResult.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void AudiogramDetectorResult.init()()
{
}

id AudiogramDetectorResult.__deallocating_deinit()
{
  return sub_23F10FBCC(type metadata accessor for AudiogramDetectorResult);
}

double AudiogramSymbolDetectorResult.box.getter()
{
  return *(double *)(v0 + OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box);
}

uint64_t AudiogramSymbolDetectorResult.labelName.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_labelName);
  swift_bridgeObjectRetain();
  return v1;
}

double AudiogramSymbolDetectorResult.confidence.getter()
{
  return *(double *)(v0 + OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_confidence);
}

uint64_t sub_23F10E5F8()
{
  return 0;
}

void sub_23F10E758(double a1, double a2, CGFloat a3, CGFloat a4)
{
  CGFloat v7 = *(double *)(v4 + OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box);
  CGFloat v8 = *(double *)(v4 + OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box + 8);
  CGFloat v9 = *(double *)(v4 + OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box + 16);
  CGFloat v10 = *(double *)(v4 + OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box + 24);
  CGAffineTransformMakeTranslation(&v24, -0.5, -0.5);
  v25.origin.CGFloat x = v7;
  v25.origin.CGFloat y = v8;
  v25.size.CGFloat width = v9;
  v25.size.CGFloat height = v10;
  CGRect v26 = CGRectApplyAffineTransform(v25, &v24);
  v24.a = 1.0;
  v24.b = 0.0;
  v24.c = 0.0;
  v24.d = 1.0;
  v24.tCGFloat x = 0.0;
  v24.tCGFloat y = 0.0;
  CGRect v27 = CGRectApplyAffineTransform(v26, &v24);
  CGFloat x = v27.origin.x;
  CGFloat y = v27.origin.y;
  CGFloat width = v27.size.width;
  CGFloat height = v27.size.height;
  CGAffineTransformMakeTranslation(&v24, 0.5, 0.5);
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  CGRect v29 = CGRectApplyAffineTransform(v28, &v24);
  CGFloat v15 = v29.origin.x;
  CGFloat v16 = v29.origin.y;
  CGFloat v17 = v29.size.width;
  CGFloat v18 = v29.size.height;
  CGFloat v19 = CGRectGetMinX(v29) * a1;
  v30.origin.CGFloat x = v15;
  v30.origin.CGFloat y = v16;
  v30.size.CGFloat width = v17;
  v30.size.CGFloat height = v18;
  CGFloat v20 = CGRectGetMinY(v30) * a2;
  v31.origin.CGFloat x = v15;
  v31.origin.CGFloat y = v16;
  v31.size.CGFloat width = v17;
  v31.size.CGFloat height = v18;
  CGFloat v21 = CGRectGetWidth(v31) * a1;
  v32.origin.CGFloat x = v15;
  v32.origin.CGFloat y = v16;
  v32.size.CGFloat width = v17;
  v32.size.CGFloat height = v18;
  v33.size.CGFloat height = CGRectGetHeight(v32) * a2;
  v33.origin.CGFloat x = v19;
  v33.origin.CGFloat y = v20;
  v33.size.CGFloat width = v21;
  CGRectOffset(v33, a3, a4);
}

void AudiogramSymbolDetectorResult.init()()
{
}

uint64_t sub_23F10EB44(char a1)
{
  return qword_23F124D80[a1];
}

BOOL sub_23F10EB64(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23F10EB78()
{
  return sub_23F1211A0();
}

uint64_t sub_23F10EBC0()
{
  return sub_23F121190();
}

uint64_t sub_23F10EBEC()
{
  return sub_23F1211A0();
}

uint64_t sub_23F10EC30()
{
  return sub_23F10EB44(*v0);
}

uint64_t sub_23F10EC38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_23F111CFC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23F10EC60()
{
  return 0;
}

void sub_23F10EC6C(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_23F10EC78(uint64_t a1)
{
  unint64_t v2 = sub_23F1113EC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_23F10ECB4(uint64_t a1)
{
  unint64_t v2 = sub_23F1113EC();
  return MEMORY[0x270FA00B8](a1, v2);
}

id AudiogramSymbolDetectorResult.__deallocating_deinit()
{
  return sub_23F10FBCC(type metadata accessor for AudiogramSymbolDetectorResult);
}

uint64_t sub_23F10ED1C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C35590);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  CGFloat v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23F1113EC();
  sub_23F1211C0();
  long long v9 = *(_OWORD *)(v3 + OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box + 16);
  long long v12 = *(_OWORD *)(v3 + OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box);
  long long v13 = v9;
  v11[15] = 0;
  type metadata accessor for CGRect(0);
  sub_23F111440(&qword_268C355A0);
  sub_23F121120();
  if (!v2)
  {
    LOBYTE(v12) = 1;
    sub_23F1210F0();
    LOBYTE(v12) = 2;
    sub_23F121100();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

id AudiogramSymbolDetectorResult.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return AudiogramSymbolDetectorResult.init(from:)(a1);
}

id AudiogramSymbolDetectorResult.init(from:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C355A8);
  uint64_t v19 = *(void *)(v4 - 8);
  uint64_t v20 = v4;
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23F1113EC();
  CGFloat v8 = v1;
  id v9 = v7;
  sub_23F1211B0();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);

    type metadata accessor for AudiogramSymbolDetectorResult();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v10 = v19;
    type metadata accessor for CGRect(0);
    char v24 = 0;
    sub_23F111440(&qword_268C355B0);
    uint64_t v11 = v20;
    sub_23F1210E0();
    long long v12 = &v8[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box];
    *(_OWORD *)long long v12 = v22;
    *((_OWORD *)v12 + 1) = v23;
    LOBYTE(v22) = 1;
    uint64_t v13 = sub_23F1210B0();
    CGFloat v15 = (uint64_t *)&v8[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_labelName];
    *CGFloat v15 = v13;
    v15[1] = v16;
    LOBYTE(v22) = 2;
    sub_23F1210C0();
    *(void *)&v8[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_confidence] = v17;

    CGFloat v18 = (objc_class *)type metadata accessor for AudiogramSymbolDetectorResult();
    v21.receiver = v8;
    v21.super_class = v18;
    id v9 = objc_msgSendSuper2(&v21, sel_init);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v6, v11);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  return v9;
}

uint64_t sub_23F10F1FC@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AudiogramSymbolDetectorResult();
  uint64_t result = sub_23F120FB0();
  *a1 = result;
  return result;
}

uint64_t sub_23F10F23C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_23F1100E8(a1, type metadata accessor for AudiogramSymbolDetectorResult, (uint64_t (*)(uint64_t))AudiogramSymbolDetectorResult.init(from:), a2);
}

uint64_t sub_23F10F27C(void *a1)
{
  return sub_23F10ED1C(a1);
}

double sub_23F10F2EC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_box;
  swift_beginAccess();
  return *(double *)v1;
}

id sub_23F10F3BC(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();

  uint64_t v5 = (void *)sub_23F120D90();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_23F10F42C()
{
  return 0;
}

CGFloat sub_23F10F540(double a1)
{
  id v3 = (CGFloat *)(v1 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_box);
  swift_beginAccess();
  CGFloat v4 = *v3;
  CGFloat v5 = v3[1];
  CGFloat v6 = v3[2];
  CGFloat v7 = v3[3];
  CGAffineTransformMakeTranslation(&v18, -0.5, -0.5);
  v19.origin.CGFloat x = v4;
  v19.origin.CGFloat y = v5;
  v19.size.CGFloat width = v6;
  v19.size.CGFloat height = v7;
  CGRect v20 = CGRectApplyAffineTransform(v19, &v18);
  *(_OWORD *)&v18.a = 0x3FF0000000000000uLL;
  v18.c = 0.0;
  v18.d = 1.0;
  *(_OWORD *)&v18.tCGFloat x = 0uLL;
  CGRect v21 = CGRectApplyAffineTransform(v20, &v18);
  CGFloat x = v21.origin.x;
  CGFloat y = v21.origin.y;
  CGFloat width = v21.size.width;
  CGFloat height = v21.size.height;
  CGAffineTransformMakeTranslation(&v18, 0.5, 0.5);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  CGRect v23 = CGRectApplyAffineTransform(v22, &v18);
  CGFloat v12 = v23.origin.x;
  CGFloat v13 = v23.origin.y;
  CGFloat v14 = v23.size.width;
  CGFloat v15 = v23.size.height;
  CGFloat v16 = CGRectGetMinX(v23) * a1;
  v24.origin.CGFloat x = v12;
  v24.origin.CGFloat y = v13;
  v24.size.CGFloat width = v14;
  v24.size.CGFloat height = v15;
  CGRectGetMinY(v24);
  v25.origin.CGFloat x = v12;
  v25.origin.CGFloat y = v13;
  v25.size.CGFloat width = v14;
  v25.size.CGFloat height = v15;
  CGRectGetWidth(v25);
  v26.origin.CGFloat x = v12;
  v26.origin.CGFloat y = v13;
  v26.size.CGFloat width = v14;
  v26.size.CGFloat height = v15;
  CGRectGetHeight(v26);
  return v16;
}

void sub_23F10F724()
{
  uint64_t v0 = sub_23F120CC0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  id v3 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23F120CB0();
  CGFloat v4 = (objc_class *)type metadata accessor for MindNetModelBoundingBox();
  CGFloat v5 = (char *)objc_allocWithZone(v4);
  CGFloat v6 = &v5[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_id];
  CGFloat v7 = v5;
  sub_23F120CB0();
  uint64_t v8 = OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_confidence;
  *(_DWORD *)&v7[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_confidence] = 0;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v1 + 24))(v6, v3, v0);
  swift_endAccess();
  *(_DWORD *)&v7[v8] = 0;
  id v9 = &v7[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect];
  *(void *)id v9 = 0;
  *((void *)v9 + 1) = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *((_OWORD *)v9 + 1) = _Q0;
  CGFloat v15 = &v7[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_className];
  *(void *)CGFloat v15 = 0x6870617267;
  *((void *)v15 + 1) = 0xE500000000000000;

  v33.receiver = v7;
  v33.super_class = v4;
  CGFloat v16 = (char *)objc_msgSendSuper2(&v33, sel_init);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  uint64_t v17 = (objc_class *)type metadata accessor for AudiogramGraphDetectorResult();
  id v18 = objc_allocWithZone(v17);
  CGRect v19 = (CGRect *)&v16[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect];
  CGFloat v20 = *(double *)&v16[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect];
  CGFloat v21 = *(double *)&v16[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect + 8];
  CGFloat v22 = *(double *)&v16[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect + 16];
  CGFloat v23 = *(double *)&v16[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect + 24];
  CGRect v24 = (char *)v18;
  v34.origin.CGFloat x = v20;
  v34.origin.CGFloat y = v21;
  v34.size.CGFloat width = v22;
  v34.size.CGFloat height = v23;
  CGFloat MinX = CGRectGetMinX(v34);
  CGFloat MinY = CGRectGetMinY(*v19);
  CGFloat Width = CGRectGetWidth(*v19);
  CGFloat Height = CGRectGetHeight(*v19);
  CGRect v29 = (CGFloat *)&v24[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_box];
  *CGRect v29 = MinX;
  v29[1] = MinY;
  v29[2] = Width;
  v29[3] = Height;
  *(double *)&v24[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_confidence] = *(float *)&v16[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_confidence];

  v32.receiver = v24;
  v32.super_class = v17;
  id v30 = objc_msgSendSuper2(&v32, sel_init);

  qword_268C35560 = (uint64_t)v30;
}

id static AudiogramGraphDetectorResult.defaultResult.getter()
{
  if (qword_268C35308 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_268C35560;
  return v0;
}

void AudiogramGraphDetectorResult.init()()
{
}

uint64_t sub_23F10FAB4(char a1)
{
  if (a1) {
    return 0x6E656469666E6F63;
  }
  else {
    return 7892834;
  }
}

BOOL sub_23F10FAE8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23F10FB00()
{
  return sub_23F10FAB4(*v0);
}

uint64_t sub_23F10FB08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_23F112414(a1, a2);
  *a3 = result;
  return result;
}

void sub_23F10FB30(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_23F10FB3C(uint64_t a1)
{
  unint64_t v2 = sub_23F1114A8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_23F10FB78(uint64_t a1)
{
  unint64_t v2 = sub_23F1114A8();
  return MEMORY[0x270FA00B8](a1, v2);
}

id AudiogramGraphDetectorResult.__deallocating_deinit()
{
  return sub_23F10FBCC(type metadata accessor for AudiogramGraphDetectorResult);
}

id sub_23F10FBCC(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_23F10FC08(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C355C8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = &v12[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23F1114A8();
  sub_23F1211C0();
  id v9 = (long long *)(v3 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_box);
  swift_beginAccess();
  long long v10 = v9[1];
  long long v13 = *v9;
  long long v14 = v10;
  v12[15] = 0;
  type metadata accessor for CGRect(0);
  sub_23F111440(&qword_268C355A0);
  sub_23F121120();
  if (!v2)
  {
    LOBYTE(v13) = 1;
    sub_23F121100();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

id AudiogramGraphDetectorResult.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return AudiogramGraphDetectorResult.init(from:)(a1);
}

id AudiogramGraphDetectorResult.init(from:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C355D8);
  uint64_t v16 = *(void *)(v4 - 8);
  uint64_t v17 = v4;
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23F1114A8();
  uint64_t v8 = v1;
  id v9 = v7;
  sub_23F1211B0();
  if (v2)
  {

    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    type metadata accessor for AudiogramGraphDetectorResult();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v10 = v16;
    type metadata accessor for CGRect(0);
    char v21 = 0;
    sub_23F111440(&qword_268C355B0);
    uint64_t v11 = v17;
    sub_23F1210E0();
    CGFloat v12 = &v8[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_box];
    *(_OWORD *)CGFloat v12 = v19;
    *((_OWORD *)v12 + 1) = v20;
    LOBYTE(v19) = 1;
    sub_23F1210C0();
    *(void *)&v8[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_confidence] = v14;

    CGFloat v15 = (objc_class *)type metadata accessor for AudiogramGraphDetectorResult();
    v18.receiver = v8;
    v18.super_class = v15;
    id v9 = objc_msgSendSuper2(&v18, sel_init);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v6, v11);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  return v9;
}

uint64_t sub_23F110068@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AudiogramGraphDetectorResult();
  uint64_t result = sub_23F120FB0();
  *a1 = result;
  return result;
}

uint64_t sub_23F1100A8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_23F1100E8(a1, type metadata accessor for AudiogramGraphDetectorResult, (uint64_t (*)(uint64_t))AudiogramGraphDetectorResult.init(from:), a2);
}

uint64_t sub_23F1100E8@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(void)@<X3>, uint64_t (*a3)(uint64_t)@<X4>, uint64_t *a4@<X8>)
{
  id v8 = objc_allocWithZone((Class)a2());
  uint64_t result = a3(a1);
  if (!v4) {
    *a4 = result;
  }
  return result;
}

uint64_t sub_23F110148(void *a1)
{
  return sub_23F10FC08(a1);
}

void sub_23F110170(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_23F121070();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x2455C4A60);
}

uint64_t sub_23F1101EC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    sub_23F1111E4();
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_23F110360(v6);
  return sub_23F121000();
}

void *sub_23F110268(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  while (1)
  {
    if (v2 <= 0)
    {
      id v3 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268C35610);
      id v3 = (void *)swift_allocObject();
      int64_t v4 = _swift_stdlib_malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_23F110FE4((unint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_23F121070();
    swift_bridgeObjectRelease();
    if (!v2) {
      return (void *)MEMORY[0x263F8EE78];
    }
  }
  return v3;
}

uint64_t sub_23F110360(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = a1[1];
  uint64_t result = sub_23F121140();
  if (result >= v4)
  {
    if (v4 < 0) {
      goto LABEL_129;
    }
    if (v4) {
      return sub_23F1109E0(0, v4, 1, a1);
    }
    return result;
  }
  if (v4 >= 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = v4 + 1;
  }
  if (v4 < -1) {
    goto LABEL_137;
  }
  uint64_t v7 = result;
  v89 = a1;
  if (v4 < 2)
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
    uint64_t v95 = MEMORY[0x263F8EE78];
    __dst = (char *)((MEMORY[0x263F8EE78] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v4 != 1)
    {
      unint64_t v13 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_95:
      v81 = v10;
      if (v13 >= 2)
      {
        uint64_t v82 = *v89;
        do
        {
          unint64_t v83 = v13 - 2;
          if (v13 < 2) {
            goto LABEL_124;
          }
          if (!v82) {
            goto LABEL_136;
          }
          v84 = v81;
          uint64_t v85 = *(void *)&v81[16 * v83 + 32];
          uint64_t v86 = *(void *)&v81[16 * v13 + 24];
          sub_23F110A50((char *)(v82 + 8 * v85), (char *)(v82 + 8 * *(void *)&v81[16 * v13 + 16]), v82 + 8 * v86, __dst);
          if (v2) {
            break;
          }
          if (v86 < v85) {
            goto LABEL_125;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v84 = sub_23F110E98((uint64_t)v84);
          }
          if (v83 >= *((void *)v84 + 2)) {
            goto LABEL_126;
          }
          v87 = &v84[16 * v83 + 32];
          *(void *)v87 = v85;
          *((void *)v87 + 1) = v86;
          unint64_t v88 = *((void *)v84 + 2);
          if (v13 > v88) {
            goto LABEL_127;
          }
          memmove(&v84[16 * v13 + 16], &v84[16 * v13 + 32], 16 * (v88 - v13));
          v81 = v84;
          *((void *)v84 + 2) = v88 - 1;
          unint64_t v13 = v88 - 1;
        }
        while (v88 > 2);
      }
LABEL_92:
      swift_bridgeObjectRelease();
      *(void *)((v95 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_23F120E70();
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v8 = v6 >> 1;
    type metadata accessor for AudiogramGraphDetectorResult();
    uint64_t v9 = sub_23F120E90();
    *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) = v8;
    __dst = (char *)((v9 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v95 = v9;
  }
  uint64_t v11 = 0;
  uint64_t v12 = *a1;
  uint64_t v90 = *a1 - 8;
  uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  uint64_t v91 = v7;
  uint64_t v92 = v4;
  uint64_t v93 = *a1;
  while (1)
  {
    uint64_t v14 = v11++;
    if (v11 < v4)
    {
      double v15 = *(double *)(*(void *)(v12 + 8 * v11)
                      + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_confidence);
      double v16 = *(double *)(*(void *)(v12 + 8 * v14)
                      + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_confidence);
      uint64_t v11 = v14 + 2;
      if (v14 + 2 < v4)
      {
        double v17 = v15;
        while (1)
        {
          double v18 = v17;
          double v17 = *(double *)(*(void *)(v12 + 8 * v11)
                          + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_confidence);
          if (v16 < v15 == v18 >= v17) {
            break;
          }
          if (v4 == ++v11)
          {
            uint64_t v11 = v4;
            break;
          }
        }
      }
      if (v16 < v15)
      {
        if (v11 < v14) {
          goto LABEL_130;
        }
        if (v14 < v11)
        {
          long long v19 = (uint64_t *)(v90 + 8 * v11);
          uint64_t v20 = v11;
          uint64_t v21 = v14;
          CGFloat v22 = (uint64_t *)(v12 + 8 * v14);
          do
          {
            if (v21 != --v20)
            {
              if (!v12) {
                goto LABEL_135;
              }
              uint64_t v23 = *v22;
              *CGFloat v22 = *v19;
              uint64_t *v19 = v23;
            }
            ++v21;
            --v19;
            ++v22;
          }
          while (v21 < v20);
        }
      }
    }
    if (v11 >= v4) {
      goto LABEL_45;
    }
    if (__OFSUB__(v11, v14)) {
      goto LABEL_128;
    }
    if (v11 - v14 >= v7) {
      goto LABEL_45;
    }
    uint64_t v24 = v14 + v7;
    if (__OFADD__(v14, v7)) {
      goto LABEL_131;
    }
    if (v24 >= v4) {
      uint64_t v24 = v4;
    }
    if (v24 < v14) {
      break;
    }
    if (v11 != v24)
    {
      CGRect v25 = (uint64_t *)(v90 + 8 * v11);
      do
      {
        uint64_t v26 = *(void *)(v12 + 8 * v11);
        uint64_t v27 = v14;
        CGRect v28 = v25;
        do
        {
          uint64_t v29 = *v28;
          if (*(double *)(*v28 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_confidence) >= *(double *)(v26 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_confidence)) {
            break;
          }
          if (!v12) {
            goto LABEL_133;
          }
          *CGRect v28 = v26;
          v28[1] = v29;
          --v28;
          ++v27;
        }
        while (v11 != v27);
        ++v11;
        ++v25;
      }
      while (v11 != v24);
      uint64_t v11 = v24;
    }
LABEL_45:
    if (v11 < v14) {
      goto LABEL_123;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v10 = sub_23F110CE0(0, *((void *)v10 + 2) + 1, 1, v10);
    }
    unint64_t v31 = *((void *)v10 + 2);
    unint64_t v30 = *((void *)v10 + 3);
    unint64_t v13 = v31 + 1;
    uint64_t v12 = v93;
    if (v31 >= v30 >> 1)
    {
      v80 = sub_23F110CE0((char *)(v30 > 1), v31 + 1, 1, v10);
      uint64_t v12 = v93;
      uint64_t v10 = v80;
    }
    *((void *)v10 + 2) = v13;
    objc_super v32 = v10 + 32;
    objc_super v33 = &v10[16 * v31 + 32];
    *(void *)objc_super v33 = v14;
    *((void *)v33 + 1) = v11;
    if (v31)
    {
      while (1)
      {
        unint64_t v34 = v13 - 1;
        if (v13 >= 4)
        {
          CGRect v39 = &v32[16 * v13];
          uint64_t v40 = *((void *)v39 - 8);
          uint64_t v41 = *((void *)v39 - 7);
          BOOL v45 = __OFSUB__(v41, v40);
          uint64_t v42 = v41 - v40;
          if (v45) {
            goto LABEL_112;
          }
          uint64_t v44 = *((void *)v39 - 6);
          uint64_t v43 = *((void *)v39 - 5);
          BOOL v45 = __OFSUB__(v43, v44);
          uint64_t v37 = v43 - v44;
          char v38 = v45;
          if (v45) {
            goto LABEL_113;
          }
          unint64_t v46 = v13 - 2;
          v47 = &v32[16 * v13 - 32];
          uint64_t v49 = *(void *)v47;
          uint64_t v48 = *((void *)v47 + 1);
          BOOL v45 = __OFSUB__(v48, v49);
          uint64_t v50 = v48 - v49;
          if (v45) {
            goto LABEL_115;
          }
          BOOL v45 = __OFADD__(v37, v50);
          uint64_t v51 = v37 + v50;
          if (v45) {
            goto LABEL_118;
          }
          if (v51 >= v42)
          {
            v69 = &v32[16 * v34];
            uint64_t v71 = *(void *)v69;
            uint64_t v70 = *((void *)v69 + 1);
            BOOL v45 = __OFSUB__(v70, v71);
            uint64_t v72 = v70 - v71;
            if (v45) {
              goto LABEL_122;
            }
            BOOL v62 = v37 < v72;
            goto LABEL_82;
          }
        }
        else
        {
          if (v13 != 3)
          {
            uint64_t v63 = *((void *)v10 + 4);
            uint64_t v64 = *((void *)v10 + 5);
            BOOL v45 = __OFSUB__(v64, v63);
            uint64_t v56 = v64 - v63;
            char v57 = v45;
            goto LABEL_76;
          }
          uint64_t v36 = *((void *)v10 + 4);
          uint64_t v35 = *((void *)v10 + 5);
          BOOL v45 = __OFSUB__(v35, v36);
          uint64_t v37 = v35 - v36;
          char v38 = v45;
        }
        if (v38) {
          goto LABEL_114;
        }
        unint64_t v46 = v13 - 2;
        v52 = &v32[16 * v13 - 32];
        uint64_t v54 = *(void *)v52;
        uint64_t v53 = *((void *)v52 + 1);
        BOOL v55 = __OFSUB__(v53, v54);
        uint64_t v56 = v53 - v54;
        char v57 = v55;
        if (v55) {
          goto LABEL_117;
        }
        v58 = &v32[16 * v34];
        uint64_t v60 = *(void *)v58;
        uint64_t v59 = *((void *)v58 + 1);
        BOOL v45 = __OFSUB__(v59, v60);
        uint64_t v61 = v59 - v60;
        if (v45) {
          goto LABEL_120;
        }
        if (__OFADD__(v56, v61)) {
          goto LABEL_121;
        }
        if (v56 + v61 >= v37)
        {
          BOOL v62 = v37 < v61;
LABEL_82:
          if (v62) {
            unint64_t v34 = v46;
          }
          goto LABEL_84;
        }
LABEL_76:
        if (v57) {
          goto LABEL_116;
        }
        v65 = &v32[16 * v34];
        uint64_t v67 = *(void *)v65;
        uint64_t v66 = *((void *)v65 + 1);
        BOOL v45 = __OFSUB__(v66, v67);
        uint64_t v68 = v66 - v67;
        if (v45) {
          goto LABEL_119;
        }
        if (v68 < v56) {
          goto LABEL_14;
        }
LABEL_84:
        unint64_t v73 = v34 - 1;
        if (v34 - 1 >= v13)
        {
          __break(1u);
LABEL_109:
          __break(1u);
LABEL_110:
          __break(1u);
LABEL_111:
          __break(1u);
LABEL_112:
          __break(1u);
LABEL_113:
          __break(1u);
LABEL_114:
          __break(1u);
LABEL_115:
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
          goto LABEL_132;
        }
        if (!v12) {
          goto LABEL_134;
        }
        v74 = v10;
        v75 = &v32[16 * v73];
        uint64_t v76 = *(void *)v75;
        v77 = &v32[16 * v34];
        uint64_t v78 = *((void *)v77 + 1);
        sub_23F110A50((char *)(v12 + 8 * *(void *)v75), (char *)(v12 + 8 * *(void *)v77), v12 + 8 * v78, __dst);
        if (v1) {
          goto LABEL_92;
        }
        if (v78 < v76) {
          goto LABEL_109;
        }
        if (v34 > *((void *)v74 + 2)) {
          goto LABEL_110;
        }
        *(void *)v75 = v76;
        *(void *)&v32[16 * v73 + 8] = v78;
        unint64_t v79 = *((void *)v74 + 2);
        if (v34 >= v79) {
          goto LABEL_111;
        }
        uint64_t v10 = v74;
        unint64_t v13 = v79 - 1;
        memmove(&v32[16 * v34], v77 + 16, 16 * (v79 - 1 - v34));
        *((void *)v74 + 2) = v79 - 1;
        uint64_t v12 = v93;
        if (v79 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v13 = 1;
LABEL_14:
    uint64_t v7 = v91;
    uint64_t v4 = v92;
    if (v11 >= v92)
    {
      uint64_t v2 = v1;
      goto LABEL_95;
    }
  }
LABEL_132:
  __break(1u);
LABEL_133:
  __break(1u);
LABEL_134:
  __break(1u);
LABEL_135:
  __break(1u);
LABEL_136:
  __break(1u);
LABEL_137:
  uint64_t result = sub_23F121050();
  __break(1u);
  return result;
}

uint64_t sub_23F1109E0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = *a4;
    uint64_t v5 = *a4 + 8 * a3 - 8;
LABEL_5:
    uint64_t v6 = *(void *)(v4 + 8 * a3);
    uint64_t v7 = result;
    uint64_t v8 = (uint64_t *)v5;
    while (1)
    {
      uint64_t v9 = *v8;
      if (*(double *)(*v8 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_confidence) >= *(double *)(v6 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_confidence))
      {
LABEL_4:
        ++a3;
        v5 += 8;
        if (a3 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v4) {
        break;
      }
      uint64_t *v8 = v6;
      v8[1] = v9;
      --v8;
      if (a3 == ++v7) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_23F110A50(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 7;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 3;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 3;
  uint64_t v24 = __src;
  uint64_t v23 = __dst;
  if (v10 >= v12 >> 3)
  {
    if (v11 >= -7)
    {
      if (__dst != a2 || &a2[8 * v13] <= __dst) {
        memmove(__dst, a2, 8 * v13);
      }
      double v16 = &v4[8 * v13];
      CGFloat v22 = v16;
      uint64_t v24 = v6;
      if (v7 < v6 && v11 >= 8)
      {
        double v17 = (char *)(a3 - 8);
        while (1)
        {
          double v18 = v17 + 8;
          long long v19 = v6 - 8;
          uint64_t v20 = *((void *)v6 - 1);
          if (*(double *)(v20 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_confidence) >= *(double *)(*((void *)v16 - 1) + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_confidence))
          {
            CGFloat v22 = v16 - 8;
            if (v18 < v16 || v17 >= v16 || v18 != v16) {
              *(void *)double v17 = *((void *)v16 - 1);
            }
            v16 -= 8;
            if (v6 <= v7) {
              goto LABEL_42;
            }
          }
          else
          {
            if (v18 != v6 || v17 >= v6) {
              *(void *)double v17 = v20;
            }
            uint64_t v24 = v6 - 8;
            v6 -= 8;
            if (v19 <= v7) {
              goto LABEL_42;
            }
          }
          v17 -= 8;
          if (v16 <= v4) {
            goto LABEL_42;
          }
        }
      }
      goto LABEL_42;
    }
  }
  else if (v8 >= -7)
  {
    if (__dst != __src || &__src[8 * v10] <= __dst) {
      memmove(__dst, __src, 8 * v10);
    }
    uint64_t v14 = &v4[8 * v10];
    CGFloat v22 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 8)
    {
      do
      {
        if (*(double *)(*(void *)v4 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_confidence) >= *(double *)(*(void *)v6 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_confidence))
        {
          if (v7 != v4) {
            *(void *)uint64_t v7 = *(void *)v4;
          }
          v4 += 8;
          uint64_t v23 = v4;
          double v15 = v6;
        }
        else
        {
          double v15 = v6 + 8;
          if (v7 < v6 || v7 >= v15 || v7 != v6) {
            *(void *)uint64_t v7 = *(void *)v6;
          }
        }
        v7 += 8;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v15;
      }
      while ((unint64_t)v15 < a3);
      uint64_t v24 = v7;
    }
LABEL_42:
    sub_23F110DDC((void **)&v24, (const void **)&v23, &v22);
    return 1;
  }
  uint64_t result = sub_23F121090();
  __break(1u);
  return result;
}

char *sub_23F110CE0(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C35628);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_23F110DDC(void **a1, const void **a2, void *a3)
{
  id v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_23F121090();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

char *sub_23F110E98(uint64_t a1)
{
  return sub_23F110CE0(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void (*sub_23F110EAC(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_23F110F5C(v6, a2, a3);
  return sub_23F110F14;
}

void sub_23F110F14(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_23F110F5C(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  id v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x2455C4A50](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)id v3 = v4;
    return sub_23F110FDC;
  }
  __break(1u);
  return result;
}

void sub_23F110FDC(id *a1)
{
}

uint64_t sub_23F110FE4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_23F121070();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_23F121070();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_23F1124FC();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_268C35618);
          uint64_t v12 = sub_23F110EAC(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for AudiogramGraphDetectorResult();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_23F121090();
  __break(1u);
  return result;
}

void sub_23F1111E4()
{
}

uint64_t _s18AudiogramIngestion0A20SymbolDetectorResultC21boundingBoxForSymbolsySo6CGRectVSayACGFZ_0(unint64_t a1)
{
  if (!(a1 >> 62))
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_23F121070();
  uint64_t v2 = result;
  if (!result) {
    return swift_bridgeObjectRelease();
  }
LABEL_3:
  if ((a1 & 0xC000000000000001) != 0)
  {
    id v4 = (char *)MEMORY[0x2455C4A50](0, a1);
  }
  else
  {
    if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_17;
    }
    id v4 = (char *)*(id *)(a1 + 32);
  }
  uint64_t v5 = v4;
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 >= 1)
  {
    CGFloat width = *(double *)&v5[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box + 16];
    CGFloat height = *(double *)&v5[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box + 24];
    CGFloat x = *(double *)&v5[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box];
    CGFloat y = *(double *)&v5[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box + 8];
    swift_bridgeObjectRetain();
    uint64_t v10 = 0;
    do
    {
      if ((a1 & 0xC000000000000001) != 0) {
        int64_t v11 = (char *)MEMORY[0x2455C4A50](v10, a1);
      }
      else {
        int64_t v11 = (char *)*(id *)(a1 + 8 * v10 + 32);
      }
      uint64_t v12 = v11;
      ++v10;
      v13.origin.CGFloat x = x;
      v13.origin.CGFloat y = y;
      v13.size.CGFloat width = width;
      v13.size.CGFloat height = height;
      CGRect v14 = CGRectUnion(v13, *(CGRect *)&v11[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box]);
      CGFloat x = v14.origin.x;
      CGFloat y = v14.origin.y;
      CGFloat width = v14.size.width;
      CGFloat height = v14.size.height;
    }
    while (v2 != v10);

    return swift_bridgeObjectRelease();
  }
LABEL_17:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for AudiogramSymbolDetectorResult()
{
  return self;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_23F1113EC()
{
  unint64_t result = qword_268C35598;
  if (!qword_268C35598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C35598);
  }
  return result;
}

uint64_t sub_23F111440(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CGRect(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for AudiogramGraphDetectorResult()
{
  return self;
}

unint64_t sub_23F1114A8()
{
  unint64_t result = qword_268C355D0;
  if (!qword_268C355D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C355D0);
  }
  return result;
}

uint64_t sub_23F1114FC()
{
  return MEMORY[0x263F8D1F8];
}

__n128 sub_23F111508@<Q0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_box;
  swift_beginAccess();
  __n128 result = *(__n128 *)v3;
  long long v5 = *(_OWORD *)(v3 + 16);
  *a2 = *(_OWORD *)v3;
  a2[1] = v5;
  return result;
}

__n128 sub_23F11155C(__n128 *a1, void *a2)
{
  __n128 v6 = *a1;
  unint64_t v2 = a1[1].n128_u64[0];
  unint64_t v3 = a1[1].n128_u64[1];
  uint64_t v4 = *a2 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_box;
  swift_beginAccess();
  __n128 result = v6;
  *(__n128 *)uint64_t v4 = v6;
  *(void *)(v4 + 16) = v2;
  *(void *)(v4 + 24) = v3;
  return result;
}

uint64_t method lookup function for AudiogramDetectorResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AudiogramDetectorResult);
}

uint64_t dispatch thunk of AudiogramDetectorResult.__allocating_init(graph:symbols:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t method lookup function for AudiogramSymbolDetectorResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AudiogramSymbolDetectorResult);
}

uint64_t dispatch thunk of AudiogramSymbolDetectorResult.scaledBox(size:offset:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of AudiogramSymbolDetectorResult.encode(to:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of AudiogramSymbolDetectorResult.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t method lookup function for AudiogramGraphDetectorResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AudiogramGraphDetectorResult);
}

uint64_t dispatch thunk of AudiogramGraphDetectorResult.box.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of AudiogramGraphDetectorResult.scaledBox(size:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of AudiogramGraphDetectorResult.encode(to:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of AudiogramGraphDetectorResult.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  char *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AudiogramGraphDetectorResult.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AudiogramGraphDetectorResult.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    char *result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x23F111904);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          char *result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_23F11192C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_23F111934(unsigned char *result, char a2)
{
  char *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AudiogramGraphDetectorResult.CodingKeys()
{
  return &type metadata for AudiogramGraphDetectorResult.CodingKeys;
}

uint64_t getEnumTagSinglePayload for AudiogramSymbolDetectorResult.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AudiogramSymbolDetectorResult.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    char *result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x23F111AACLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          char *result = a2 + 2;
        break;
    }
  }
  return result;
}

unsigned char *sub_23F111AD4(unsigned char *result, char a2)
{
  char *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AudiogramSymbolDetectorResult.CodingKeys()
{
  return &type metadata for AudiogramSymbolDetectorResult.CodingKeys;
}

unint64_t sub_23F111AF0()
{
  unint64_t result = qword_268C355E0;
  if (!qword_268C355E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C355E0);
  }
  return result;
}

unint64_t sub_23F111B48()
{
  unint64_t result = qword_268C355E8;
  if (!qword_268C355E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C355E8);
  }
  return result;
}

unint64_t sub_23F111BA0()
{
  unint64_t result = qword_268C355F0;
  if (!qword_268C355F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C355F0);
  }
  return result;
}

unint64_t sub_23F111BF8()
{
  unint64_t result = qword_268C355F8;
  if (!qword_268C355F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C355F8);
  }
  return result;
}

unint64_t sub_23F111C50()
{
  unint64_t result = qword_268C35600;
  if (!qword_268C35600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C35600);
  }
  return result;
}

unint64_t sub_23F111CA8()
{
  unint64_t result = qword_268C35608;
  if (!qword_268C35608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C35608);
  }
  return result;
}

uint64_t sub_23F111CFC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 7892834 && a2 == 0xE300000000000000;
  if (v3 || (sub_23F121160() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6D614E6C6562616CLL && a2 == 0xE900000000000065 || (sub_23F121160() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E656469666E6F63 && a2 == 0xEA00000000006563)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_23F121160();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_23F111E44(unint64_t a1, double *a2, double a3)
{
  uint64_t v41 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_31;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_3:
  char v6 = (CGRect *)((char *)a2 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_box);
  swift_beginAccess();
  if (v5)
  {
    for (unint64_t i = 0; ; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        uint64_t v9 = (char *)MEMORY[0x2455C4A50](i, a1);
      }
      else
      {
        if (i >= *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
LABEL_30:
          __break(1u);
LABEL_31:
          uint64_t v5 = sub_23F121070();
          goto LABEL_3;
        }
        uint64_t v9 = (char *)*(id *)(a1 + 8 * i + 32);
      }
      uint64_t v10 = v9;
      unint64_t v8 = i + 1;
      if (__OFADD__(i, 1)) {
        goto LABEL_30;
      }
      a2 = (double *)&v9[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_box];
      swift_beginAccess();
      v42.origin.CGFloat x = *a2;
      CGFloat v11 = a2[1];
      CGFloat v12 = a2[2];
      CGFloat v13 = a2[3];
      CGRect v53 = *v6;
      CGFloat y = v53.origin.y;
      CGFloat x = v6->origin.x;
      CGFloat width = v53.size.width;
      CGFloat v36 = *a2;
      CGFloat height = v53.size.height;
      v42.origin.CGFloat y = v11;
      v42.size.CGFloat width = v12;
      v42.size.CGFloat height = v13;
      CGRect v43 = CGRectIntersection(v42, *v6);
      CGFloat v14 = v43.origin.x;
      CGFloat v15 = v43.origin.y;
      CGFloat v16 = v43.size.width;
      CGFloat v17 = v43.size.height;
      double v18 = CGRectGetHeight(v43);
      v44.origin.CGFloat x = v14;
      v44.origin.CGFloat y = v15;
      v44.size.CGFloat width = v16;
      v44.size.CGFloat height = v17;
      double v19 = v18 * CGRectGetWidth(v44);
      v45.origin.CGFloat x = v36;
      v45.origin.CGFloat y = v11;
      v45.size.CGFloat width = v12;
      v45.size.CGFloat height = v13;
      double v20 = CGRectGetHeight(v45);
      v46.origin.CGFloat x = v36;
      v46.origin.CGFloat y = v11;
      v46.size.CGFloat width = v12;
      v46.size.CGFloat height = v13;
      double v21 = v20 * CGRectGetWidth(v46);
      v47.origin.CGFloat x = x;
      v47.origin.CGFloat y = y;
      v47.size.CGFloat width = width;
      v47.size.CGFloat height = height;
      double v22 = CGRectGetHeight(v47);
      v48.origin.CGFloat x = x;
      v48.origin.CGFloat y = y;
      v48.size.CGFloat width = width;
      v48.size.CGFloat height = height;
      if (v19 / (v21 + v22 * CGRectGetWidth(v48) - v19) <= a3)
      {
        a2 = (double *)&v41;
        sub_23F120FF0();
        sub_23F121020();
        unint64_t v8 = i + 1;
        sub_23F121030();
        sub_23F121000();
      }
      else
      {
        CGRect v49 = CGRectUnion(*v6, *(CGRect *)a2);
        CGFloat v23 = v49.origin.x;
        CGFloat v24 = v49.origin.y;
        CGFloat v25 = v49.size.width;
        CGFloat v26 = v49.size.height;
        double MinX = CGRectGetMinX(v49);
        if (MinX < 0.0) {
          double MinX = 0.0;
        }
        double v28 = fmin(MinX, 1.0);
        v50.origin.CGFloat x = v23;
        v50.origin.CGFloat y = v24;
        v50.size.CGFloat width = v25;
        v50.size.CGFloat height = v26;
        double MinY = CGRectGetMinY(v50);
        if (MinY < 0.0) {
          double MinY = 0.0;
        }
        double v30 = fmin(MinY, 1.0);
        v51.origin.CGFloat x = v23;
        v51.origin.CGFloat y = v24;
        v51.size.CGFloat width = v25;
        v51.size.CGFloat height = v26;
        double v31 = CGRectGetWidth(v51);
        if (v31 < 0.0) {
          double v31 = 0.0;
        }
        if (v31 >= 1.0 - v28) {
          double v32 = 1.0 - v28;
        }
        else {
          double v32 = v31;
        }
        v52.origin.CGFloat x = v23;
        v52.origin.CGFloat y = v24;
        v52.size.CGFloat width = v25;
        v52.size.CGFloat height = v26;
        double v33 = CGRectGetHeight(v52);
        if (v33 < 0.0) {
          double v33 = 0.0;
        }
        v6->origin.CGFloat x = v28;
        v6->origin.CGFloat y = v30;
        if (v33 >= 1.0 - v30) {
          double v33 = 1.0 - v30;
        }
        v6->size.CGFloat width = v32;
        v6->size.CGFloat height = v33;
      }
      if (v8 == v5) {
        return v41;
      }
    }
  }
  return MEMORY[0x263F8EE78];
}

uint64_t sub_23F1121A0(unint64_t a1, double a2)
{
  uint64_t v3 = a1;
  uint64_t v20 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_20;
  }
  uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8;
  if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    swift_bridgeObjectRetain();
    while (1)
    {
      uint64_t v18 = v4;
      sub_23F1101EC(&v18);
      unint64_t v5 = v18;
      uint64_t v19 = v18;
      if (v18 < 0 || (v18 & 0x4000000000000000) != 0) {
        break;
      }
      if (*(uint64_t *)(v18 + 16) < 1) {
        goto LABEL_24;
      }
      while (1)
      {
LABEL_7:
        if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
          || (v5 & 0x8000000000000000) != 0
          || (v5 & 0x4000000000000000) != 0)
        {
          sub_23F110170(v5);
          unint64_t v5 = v6;
          uint64_t v19 = v6;
        }
        uint64_t v3 = v5 & 0xFFFFFFFFFFFFFF8;
        uint64_t v7 = *(void *)(v3 + 16);
        if (!v7) {
          break;
        }
        uint64_t v8 = v7 - 1;
        uint64_t v10 = *(void **)(v3 + 32);
        uint64_t v9 = v3 + 32;
        memmove((void *)v9, (const void *)(v9 + 8), 8 * (v7 - 1));
        *(void *)(v9 - 16) = v8;
        sub_23F120E70();
        CGFloat v11 = v10;
        MEMORY[0x2455C48C0]();
        if (*(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_23F120E80();
        }
        sub_23F120EA0();
        sub_23F120E70();
        unint64_t v12 = swift_bridgeObjectRetain();
        unint64_t v5 = sub_23F111E44(v12, v11, a2);
        swift_bridgeObjectRelease_n();

        uint64_t v19 = v5;
        if (v5 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v13 = sub_23F121070();
          swift_bridgeObjectRelease();
          if (v13 <= 0)
          {
LABEL_18:
            swift_bridgeObjectRelease();
            return v20;
          }
        }
        else if (*(uint64_t *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10) <= 0)
        {
          goto LABEL_18;
        }
      }
      __break(1u);
LABEL_20:
      swift_bridgeObjectRetain();
      uint64_t v14 = sub_23F121070();
      swift_bridgeObjectRelease();
      if (v14 < 1) {
        goto LABEL_22;
      }
      unint64_t v15 = swift_bridgeObjectRetain();
      uint64_t v4 = (uint64_t)sub_23F110268(v15);
      swift_bridgeObjectRelease();
    }
    swift_retain();
    uint64_t v16 = sub_23F121070();
    swift_release();
    if (v16 >= 1) {
      goto LABEL_7;
    }
LABEL_24:
    swift_release();
    return MEMORY[0x263F8EE78];
  }
  else
  {
LABEL_22:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
  }
  return v3;
}

uint64_t sub_23F112414(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 7892834 && a2 == 0xE300000000000000;
  if (v3 || (sub_23F121160() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E656469666E6F63 && a2 == 0xEA00000000006563)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_23F121160();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

unint64_t sub_23F1124FC()
{
  unint64_t result = qword_268C35620;
  if (!qword_268C35620)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C35618);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C35620);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t AudiogramSymbolType.init(rawValue:)(unint64_t a1)
{
  return sub_23F1126F0(a1);
}

void *static AudiogramSymbolType.allCases.getter()
{
  return &unk_26F2D3548;
}

BOOL sub_23F1125D4(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23F1125E8()
{
  return sub_23F1211A0();
}

uint64_t sub_23F112630()
{
  return sub_23F121190();
}

uint64_t sub_23F11265C()
{
  return sub_23F1211A0();
}

void sub_23F1126A0(void *a1@<X8>)
{
  *a1 = &unk_26F2D3548;
}

unint64_t sub_23F1126B0@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_23F1126F0(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + _Block_object_dispose(&a9, 8) = v4 & 1;
  return result;
}

void sub_23F1126E4(void *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_23F1126F0(unint64_t result)
{
  if (result > 0xB) {
    return 0;
  }
  return result;
}

unint64_t sub_23F112704()
{
  unint64_t result = qword_268C35630;
  if (!qword_268C35630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C35630);
  }
  return result;
}

unint64_t sub_23F11275C()
{
  unint64_t result = qword_268C35638;
  if (!qword_268C35638)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C35640);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C35638);
  }
  return result;
}

ValueMetadata *type metadata accessor for AudiogramSymbolType()
{
  return &type metadata for AudiogramSymbolType;
}

uint64_t sub_23F1127C8(uint64_t a1)
{
  uint64_t result = sub_23F115F60(a1);
  if (v4) {
    goto LABEL_8;
  }
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == 1 << *(unsigned char *)(a1 + 32)) {
    return 0;
  }
  uint64_t v5 = sub_23F116010(result, v3, 0, a1);
  swift_bridgeObjectRetain();
  return v5;
}

id AudiogramDetectorModel.__allocating_init(modelUrl:modelInputSize:confidenceThreshold:)(uint64_t a1, double a2, double a3, float a4)
{
  id v9 = objc_allocWithZone(v4);
  return AudiogramDetectorModel.init(modelUrl:modelInputSize:confidenceThreshold:)(a1, a2, a3, a4);
}

id AudiogramDetectorModel.init(modelUrl:modelInputSize:confidenceThreshold:)(uint64_t a1, double a2, double a3, float a4)
{
  uint64_t v9 = sub_23F120D30();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v4[OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_model] = 0;
  uint64_t v13 = &v4[OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_url];
  uint64_t v14 = sub_23F120CA0();
  uint64_t v15 = *(void *)(v14 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v13, a1, v14);
  uint64_t v16 = v4;
  sub_23F120D20();
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v16[OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_logger], v12, v9);
  CGFloat v17 = (double *)&v16[OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_modelInputSize];
  *CGFloat v17 = a2;
  v17[1] = a3;
  *(float *)&v16[OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_confidenceThreshold] = a4;

  uint64_t v18 = (objc_class *)type metadata accessor for AudiogramDetectorModel(0);
  v21.receiver = v16;
  v21.super_class = v18;
  id v19 = objc_msgSendSuper2(&v21, sel_init);
  sub_23F112C44();

  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a1, v14);
  return v19;
}

uint64_t type metadata accessor for AudiogramDetectorModel(uint64_t a1)
{
  return sub_23F116204(a1, (uint64_t *)&unk_268C35678);
}

void sub_23F112C44()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_23F120CA0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00D98]), sel_init);
  sub_23F11656C(0, &qword_268C356D0);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, &v1[OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_url], v2);
  id v7 = sub_23F116064((uint64_t)v5, (uint64_t)v6);
  if (v7)
  {
    CGFloat v17 = *(void **)&v1[OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_model];
    *(void *)&v1[OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_model] = v7;
  }
  else
  {
    os_log_type_t v8 = sub_23F120F30();
    uint64_t v9 = v1;
    uint64_t v10 = sub_23F120D10();
    os_log_type_t v11 = v8;
    if (os_log_type_enabled(v10, v8))
    {
      unint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      v18[0] = v6;
      uint64_t v14 = v13;
      uint64_t v19 = v13;
      *(_DWORD *)unint64_t v12 = 136315138;
      sub_23F1165A8();
      uint64_t v15 = sub_23F121150();
      v18[1] = (id)sub_23F1155A0(v15, v16, &v19);
      sub_23F120F60();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23F0D7000, v10, v11, "Failed to load model from url %s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2455C5790](v14, -1, -1);
      MEMORY[0x2455C5790](v12, -1, -1);
    }
    else
    {
    }
  }
}

id AudiogramDetectorModel.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void AudiogramDetectorModel.init()()
{
}

id AudiogramDetectorModel.__deallocating_deinit()
{
  return sub_23F114688(type metadata accessor for AudiogramDetectorModel);
}

id AudiogramSymbolDetectorModel.__allocating_init(modelUrl:modelInputSize:confidenceThreshold:classNames:collisionMitigationClassNames:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, float a6)
{
  uint64_t v13 = sub_23F120CA0();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v16 = (char *)&v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  CGFloat v17 = (char *)objc_allocWithZone(v6);
  *(void *)&v17[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramSymbolDetectorModel_classNames] = a2;
  *(void *)&v17[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramSymbolDetectorModel_collisionMitigationClassNames] = a3;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a1, v13);
  id v18 = AudiogramDetectorModel.init(modelUrl:modelInputSize:confidenceThreshold:)((uint64_t)v16, a4, a5, a6);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(a1, v13);
  return v18;
}

id AudiogramSymbolDetectorModel.init(modelUrl:modelInputSize:confidenceThreshold:classNames:collisionMitigationClassNames:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, float a6)
{
  uint64_t v13 = sub_23F120CA0();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v16 = (char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v6 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramSymbolDetectorModel_classNames) = a2;
  *(void *)(v6 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramSymbolDetectorModel_collisionMitigationClassNames) = a3;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a1, v13);
  id v17 = AudiogramDetectorModel.init(modelUrl:modelInputSize:confidenceThreshold:)((uint64_t)v16, a4, a5, a6);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(a1, v13);
  return v17;
}

uint64_t sub_23F113480(CGImage *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  v104[4] = *(id *)MEMORY[0x263EF8340];
  uint64_t v8 = OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_model;
  uint64_t v9 = *(void **)&v3[OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_model];
  if (!v9)
  {
    sub_23F112C44();
    uint64_t v9 = *(void **)&v3[v8];
    if (!v9)
    {
      os_log_type_t v53 = sub_23F120F30();
      uint64_t v10 = sub_23F120D10();
      os_log_type_t v54 = v53;
      if (os_log_type_enabled(v10, v53))
      {
        BOOL v55 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)BOOL v55 = 0;
        _os_log_impl(&dword_23F0D7000, v10, v54, "Failed to find symbols, model is nil", v55, 2u);
        MEMORY[0x2455C5790](v55, -1, -1);
      }
      goto LABEL_21;
    }
  }
  uint64_t v10 = v9;
  id v11 = [v10 modelDescription];
  id v12 = objc_msgSend(v11, sel_inputDescriptionsByName);

  sub_23F11656C(0, &qword_268C35660);
  uint64_t v13 = sub_23F120D80();

  uint64_t v14 = sub_23F1127C8(v13);
  unint64_t v16 = v15;
  swift_bridgeObjectRelease();
  if (!v16)
  {
    os_log_type_t v41 = sub_23F120F30();
    CGRect v42 = sub_23F120D10();
    if (os_log_type_enabled(v42, v41))
    {
      CGRect v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)CGRect v43 = 0;
      _os_log_impl(&dword_23F0D7000, v42, v41, "Failed to find symbols, no input key names found", v43, 2u);
      CGRect v44 = v43;
LABEL_19:
      MEMORY[0x2455C5790](v44, -1, -1);
    }
LABEL_20:

LABEL_21:
    return 0;
  }
  id v17 = (double *)(a3 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_box);
  swift_beginAccess();
  CGFloat v18 = *v17;
  CGFloat v19 = v17[1];
  CGFloat v20 = v17[2];
  CGFloat v21 = v17[3];
  int64_t Width = CGImageGetWidth(a1);
  int64_t Height = CGImageGetHeight(a1);
  v105.origin.CGFloat x = sub_23F10A80C(a2, (double)Width, (double)Height, v18, v19, v20, v21);
  CGImageRef v24 = CGImageCreateWithImageInRect(a1, v105);
  if (!v24)
  {
    swift_bridgeObjectRelease();
    os_log_type_t v45 = sub_23F120F30();
    CGRect v42 = sub_23F120D10();
    os_log_type_t v46 = v45;
    if (os_log_type_enabled(v42, v45))
    {
      CGRect v47 = (uint8_t *)swift_slowAlloc();
      CGRect v48 = (void *)swift_slowAlloc();
      v104[0] = v48;
      *(_DWORD *)CGRect v47 = 136315138;
      uint64_t v49 = sub_23F120F40();
      sub_23F1155A0(v49, v50, (uint64_t *)v104);
      sub_23F120F60();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23F0D7000, v42, v46, "Failed to find symbols, unable to crop image to graph rect %s", v47, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2455C5790](v48, -1, -1);
      CGRect v44 = v47;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  CGImageRef v25 = v24;
  double v27 = *(double *)&v4[OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_modelInputSize];
  double v26 = *(double *)&v4[OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_modelInputSize + 8];
  sub_23F10AAA0(v27, v26);
  if (!v28)
  {
    swift_bridgeObjectRelease();
    os_log_type_t v56 = sub_23F120F30();
    char v57 = sub_23F120D10();
    if (os_log_type_enabled(v57, v56))
    {
      v58 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v58 = 0;
      _os_log_impl(&dword_23F0D7000, v57, v56, "Failed to find symbols, unable to resize image", v58, 2u);
      MEMORY[0x2455C5790](v58, -1, -1);
    }

    return 0;
  }
  if (v27 <= -9.22337204e18)
  {
    __break(1u);
    goto LABEL_74;
  }
  if (v27 >= 9.22337204e18)
  {
LABEL_74:
    __break(1u);
LABEL_75:
    __break(1u);
    goto LABEL_76;
  }
  if ((*(void *)&v27 & 0x7FF0000000000000) == 0x7FF0000000000000
    || (*(void *)&v26 & 0x7FF0000000000000) == 0x7FF0000000000000)
  {
    goto LABEL_75;
  }
  if (v26 <= -9.22337204e18)
  {
LABEL_76:
    __break(1u);
LABEL_77:
    __break(1u);
LABEL_78:
    __break(1u);
LABEL_79:
    __break(1u);
  }
  if (v26 >= 9.22337204e18) {
    goto LABEL_77;
  }
  uint64_t v29 = v28;
  double v30 = self;
  v104[0] = 0;
  id v31 = v29;
  id v32 = objc_msgSend(v30, sel_featureValueWithCGImage_orientation_pixelsWide_pixelsHigh_pixelFormatType_options_error_, v31, a2, (uint64_t)v27, (uint64_t)v26, 32, 0, v104);
  if (!v32)
  {
    id v59 = v104[0];
    uint64_t v60 = (void *)sub_23F120C70();

    swift_willThrow();
    goto LABEL_30;
  }
  double v33 = v32;
  id v34 = v104[0];

  id v35 = objc_msgSend(v33, sel_imageBufferValue);
  if (!v35)
  {
LABEL_30:
    id v37 = 0;
LABEL_31:
    os_log_type_t v61 = sub_23F120F30();
    swift_bridgeObjectRetain();
    BOOL v62 = sub_23F120D10();
    if (os_log_type_enabled(v62, v61))
    {
      v102 = v31;
      v100 = v37;
      uint64_t v63 = (uint8_t *)swift_slowAlloc();
      uint64_t v64 = (void *)swift_slowAlloc();
      v104[0] = v64;
      *(_DWORD *)uint64_t v63 = 136315138;
      swift_bridgeObjectRetain();
      sub_23F1155A0(v14, v16, (uint64_t *)v104);
      sub_23F120F60();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23F0D7000, v62, v61, "Failed to find symbols, unable to create model input with input name %s", v63, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2455C5790](v64, -1, -1);
      MEMORY[0x2455C5790](v63, -1, -1);

LABEL_33:
      return 0;
    }
    swift_bridgeObjectRelease_n();

LABEL_35:
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C35668);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23F124900;
  *(void *)(inited + 32) = v14;
  *(void *)(inited + 40) = v16;
  id v37 = v35;
  swift_bridgeObjectRetain();
  id v38 = objc_msgSend(v30, sel_featureValueWithPixelBuffer_, v37);
  *(void *)(inited + 72) = sub_23F11656C(0, &qword_268C35670);
  *(void *)(inited + 4_Block_object_dispose(&a9, 8) = v38;
  sub_23F1140F8(inited);
  id v39 = objc_allocWithZone(MEMORY[0x263F00D38]);
  id v40 = sub_23F1154B8();
  id v65 = v40;
  if (!v40)
  {

    goto LABEL_31;
  }
  swift_bridgeObjectRelease();
  v104[0] = 0;
  v99 = v65;
  id v66 = [v10 predictionFromFeatures:v65 error:v104];
  if (!v66)
  {
    id v92 = v104[0];
    uint64_t v93 = (void *)sub_23F120C70();

    swift_willThrow();
    os_log_type_t v94 = sub_23F120F30();
    uint64_t v95 = sub_23F120D10();
    if (os_log_type_enabled(v95, v94))
    {
      v96 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v96 = 0;
      _os_log_impl(&dword_23F0D7000, v95, v94, "Failed to find symbols, model output is nil", v96, 2u);
      MEMORY[0x2455C5790](v96, -1, -1);
    }

    goto LABEL_35;
  }
  uint64_t v67 = v66;
  v101 = v37;
  v102 = v31;
  id v68 = v104[0];
  id v103 = v67;
  id v69 = objc_msgSend(v67, sel_featureNames);
  uint64_t v70 = sub_23F120EC0();

  v98 = 0;
  int64_t v71 = 0;
  uint64_t v72 = v70 + 56;
  uint64_t v73 = 1 << *(unsigned char *)(v70 + 32);
  uint64_t v74 = -1;
  if (v73 < 64) {
    uint64_t v74 = ~(-1 << v73);
  }
  uint64_t v75 = v74 & *(void *)(v70 + 56);
  int64_t v76 = (unint64_t)(v73 + 63) >> 6;
  while (1)
  {
    if (v75)
    {
      v75 &= v75 - 1;
      goto LABEL_55;
    }
    if (__OFADD__(v71++, 1)) {
      goto LABEL_78;
    }
    if (v71 >= v76) {
      break;
    }
    uint64_t v78 = *(void *)(v72 + 8 * v71);
    if (!v78)
    {
      int64_t v79 = v71 + 1;
      if (v71 + 1 >= v76) {
        break;
      }
      uint64_t v78 = *(void *)(v72 + 8 * v79);
      if (!v78)
      {
        int64_t v79 = v71 + 2;
        if (v71 + 2 >= v76) {
          break;
        }
        uint64_t v78 = *(void *)(v72 + 8 * v79);
        if (!v78)
        {
          int64_t v79 = v71 + 3;
          if (v71 + 3 >= v76) {
            break;
          }
          uint64_t v78 = *(void *)(v72 + 8 * v79);
          if (!v78)
          {
            while (1)
            {
              int64_t v71 = v79 + 1;
              if (__OFADD__(v79, 1)) {
                goto LABEL_79;
              }
              if (v71 >= v76) {
                goto LABEL_63;
              }
              uint64_t v78 = *(void *)(v72 + 8 * v71);
              ++v79;
              if (v78) {
                goto LABEL_54;
              }
            }
          }
        }
      }
      int64_t v71 = v79;
    }
LABEL_54:
    uint64_t v75 = (v78 - 1) & v78;
LABEL_55:
    swift_bridgeObjectRetain();
    if (sub_23F114360())
    {
      v80 = (void *)sub_23F120D90();
      swift_bridgeObjectRelease();
      id v81 = objc_msgSend(v103, sel_featureValueForName_, v80);

      if (v81)
      {
        id v82 = objc_msgSend(v81, sel_multiArrayValue);

        if (v82)
        {

          v98 = v82;
        }
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
LABEL_63:
  swift_release();
  if (!v98)
  {
    swift_unknownObjectRelease();

    goto LABEL_33;
  }
  id v83 = v98;
  os_log_type_t v84 = sub_23F120F20();
  uint64_t v85 = v4;
  uint64_t v86 = sub_23F120D10();
  os_log_type_t v87 = v84;
  unint64_t v88 = &OBJC_PROTOCOL___UITextFieldDelegate;
  if (os_log_type_enabled(v86, v84))
  {
    uint64_t v89 = swift_slowAlloc();
    *(_DWORD *)uint64_t v89 = 134218240;
    v104[0] = *(id *)(*(void *)&v85[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramSymbolDetectorModel_classNames]
                    + 16);
    sub_23F120F60();
    *(_WORD *)(v89 + 12) = 2048;
    id v90 = v83;
    uint64_t v91 = *(void **)(*(void *)&v85[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramSymbolDetectorModel_collisionMitigationClassNames]
                   + 16);

    v104[0] = v91;
    id v83 = v90;
    unint64_t v88 = &OBJC_PROTOCOL___UITextFieldDelegate;
    sub_23F120F60();

    _os_log_impl(&dword_23F0D7000, v86, v87, "Got symbol prediction matrix, processing predictions for %ld classes, %ld collision mitigation classes", (uint8_t *)v89, 0x16u);
    MEMORY[0x2455C5790](v89, -1, -1);
  }
  else
  {
  }
  sub_23F11EB70(v83, *(char ***)&v85[(unint64_t)v88[22].class_meths], *(void *)&v85[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramSymbolDetectorModel_collisionMitigationClassNames], *(float *)&v85[OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_confidenceThreshold]);
  uint64_t v51 = v97;
  swift_unknownObjectRelease();

  return v51;
}

unint64_t sub_23F1140F8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C356B8);
  uint64_t v2 = sub_23F121080();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_23F1164AC(v6, (uint64_t)&v15, &qword_268C356C0);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_23F115BF8(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    id v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_23F11649C(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_23F114230(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C356A8);
  uint64_t v2 = sub_23F121080();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_23F1164AC(v6, (uint64_t)&v13, &qword_268C356B0);
    uint64_t v7 = v13;
    unint64_t result = sub_23F115C70(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_23F11649C(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_23F114360()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v0 = sub_23F120E10();
  if (v1)
  {
    uint64_t v2 = v0;
    uint64_t v3 = v1;
    do
    {
      uint64_t v6 = sub_23F120E10();
      if (!v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v2 == v6 && v3 == v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        char v4 = sub_23F121160();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v4 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return 0;
        }
      }
      uint64_t v2 = sub_23F120E10();
      uint64_t v3 = v5;
    }
    while (v5);
  }
  swift_bridgeObjectRelease();
  sub_23F120E10();
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  BOOL v10 = v9 == 0;
  swift_bridgeObjectRelease();
  return v10;
}

void AudiogramSymbolDetectorModel.__allocating_init(modelUrl:modelInputSize:confidenceThreshold:)()
{
}

uint64_t sub_23F114630()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

id AudiogramSymbolDetectorModel.__deallocating_deinit()
{
  return sub_23F114688(type metadata accessor for AudiogramSymbolDetectorModel);
}

id sub_23F114688(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1(0);
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_23F114714(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  v73[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_model;
  uint64_t v6 = *(void **)(v2 + OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_model);
  if (!v6)
  {
    sub_23F112C44();
    uint64_t v6 = *(void **)(v2 + v5);
    if (!v6)
    {
      os_log_type_t v35 = sub_23F120F30();
      uint64_t v7 = sub_23F120D10();
      os_log_type_t v36 = v35;
      if (os_log_type_enabled(v7, v35))
      {
        id v37 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v37 = 0;
        _os_log_impl(&dword_23F0D7000, v7, v36, "Failed to find graphs, model is nil", v37, 2u);
        MEMORY[0x2455C5790](v37, -1, -1);
      }
      goto LABEL_20;
    }
  }
  uint64_t v7 = v6;
  id v8 = [v7 modelDescription];
  id v9 = objc_msgSend(v8, sel_inputDescriptionsByName);

  sub_23F11656C(0, &qword_268C35660);
  uint64_t v10 = sub_23F120D80();

  uint64_t v11 = sub_23F1127C8(v10);
  unint64_t v13 = v12;
  swift_bridgeObjectRelease();
  if (!v13)
  {
    os_log_type_t v29 = sub_23F120F30();
    double v30 = sub_23F120D10();
    if (os_log_type_enabled(v30, v29))
    {
      id v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v31 = 0;
      id v32 = "Failed to find graphs, no input key names found";
LABEL_18:
      _os_log_impl(&dword_23F0D7000, v30, v29, v32, v31, 2u);
      MEMORY[0x2455C5790](v31, -1, -1);
    }
LABEL_19:

LABEL_20:
    return 0;
  }
  double v15 = *(double *)(v3 + OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_modelInputSize);
  double v14 = *(double *)(v3 + OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_modelInputSize + 8);
  sub_23F10AAA0(v15, v14);
  if (!v16)
  {
    swift_bridgeObjectRelease();
    os_log_type_t v29 = sub_23F120F30();
    double v30 = sub_23F120D10();
    if (os_log_type_enabled(v30, v29))
    {
      id v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v31 = 0;
      id v32 = "Failed to find graphs, unable to resize image";
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if (v15 <= -9.22337204e18)
  {
    __break(1u);
    goto LABEL_67;
  }
  if (v15 >= 9.22337204e18)
  {
LABEL_67:
    __break(1u);
LABEL_68:
    __break(1u);
    goto LABEL_69;
  }
  if ((*(void *)&v15 & 0x7FF0000000000000) == 0x7FF0000000000000
    || (*(void *)&v14 & 0x7FF0000000000000) == 0x7FF0000000000000)
  {
    goto LABEL_68;
  }
  if (v14 <= -9.22337204e18)
  {
LABEL_69:
    __break(1u);
LABEL_70:
    __break(1u);
LABEL_71:
    __break(1u);
LABEL_72:
    __break(1u);
  }
  if (v14 >= 9.22337204e18) {
    goto LABEL_70;
  }
  long long v17 = v16;
  CGFloat v18 = self;
  v73[0] = 0;
  id v19 = v17;
  id v20 = objc_msgSend(v18, sel_featureValueWithCGImage_orientation_pixelsWide_pixelsHigh_pixelFormatType_options_error_, v19, a2, (uint64_t)v15, (uint64_t)v14, 32, 0, v73);
  if (!v20)
  {
    id v38 = v73[0];
    id v39 = (void *)sub_23F120C70();

    swift_willThrow();
    goto LABEL_26;
  }
  CGFloat v21 = v20;
  id v22 = v73[0];

  id v23 = objc_msgSend(v21, sel_imageBufferValue);
  if (!v23)
  {
LABEL_26:
    id v25 = 0;
LABEL_27:
    os_log_type_t v40 = sub_23F120F30();
    swift_bridgeObjectRetain();
    os_log_type_t v41 = sub_23F120D10();
    os_log_type_t v42 = v40;
    if (os_log_type_enabled(v41, v40))
    {
      CGRect v43 = (uint8_t *)swift_slowAlloc();
      CGRect v44 = (void *)swift_slowAlloc();
      v73[0] = v44;
      *(_DWORD *)CGRect v43 = 136315138;
      swift_bridgeObjectRetain();
      sub_23F1155A0(v11, v13, (uint64_t *)v73);
      sub_23F120F60();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23F0D7000, v41, v42, "Failed to find graphs, unable to create model input with input name %s", v43, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2455C5790](v44, -1, -1);
      MEMORY[0x2455C5790](v43, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C35668);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23F124900;
  *(void *)(inited + 32) = v11;
  *(void *)(inited + 40) = v13;
  id v25 = v23;
  swift_bridgeObjectRetain();
  id v26 = objc_msgSend(v18, sel_featureValueWithPixelBuffer_, v25);
  *(void *)(inited + 72) = sub_23F11656C(0, &qword_268C35670);
  *(void *)(inited + 4_Block_object_dispose(&a9, 8) = v26;
  sub_23F1140F8(inited);
  id v27 = objc_allocWithZone(MEMORY[0x263F00D38]);
  id v28 = sub_23F1154B8();
  os_log_type_t v45 = v28;
  if (!v28)
  {

    goto LABEL_27;
  }
  int64_t v71 = v25;
  swift_bridgeObjectRelease();
  v73[0] = 0;
  id v72 = [v7 predictionFromFeatures:v45 error:v73];
  if (!v72)
  {
    id v64 = v73[0];
    id v65 = (void *)sub_23F120C70();

    swift_willThrow();
    os_log_type_t v66 = sub_23F120F30();
    uint64_t v67 = sub_23F120D10();
    if (os_log_type_enabled(v67, v66))
    {
      id v68 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v68 = 0;
      _os_log_impl(&dword_23F0D7000, v67, v66, "Failed to find graphs, model output is nil", v68, 2u);
      MEMORY[0x2455C5790](v68, -1, -1);
    }

    goto LABEL_65;
  }
  id v69 = v45;
  id v46 = v19;
  id v47 = v73[0];
  id v48 = objc_msgSend(v72, sel_featureNames);
  uint64_t v49 = sub_23F120EC0();

  uint64_t v70 = 0;
  int64_t v50 = 0;
  uint64_t v51 = v49 + 56;
  uint64_t v52 = 1 << *(unsigned char *)(v49 + 32);
  uint64_t v53 = -1;
  if (v52 < 64) {
    uint64_t v53 = ~(-1 << v52);
  }
  uint64_t v54 = v53 & *(void *)(v49 + 56);
  int64_t v55 = (unint64_t)(v52 + 63) >> 6;
  while (1)
  {
    if (v54)
    {
      v54 &= v54 - 1;
      goto LABEL_50;
    }
    if (__OFADD__(v50++, 1)) {
      goto LABEL_71;
    }
    id v19 = v46;
    if (v50 >= v55) {
      break;
    }
    uint64_t v57 = *(void *)(v51 + 8 * v50);
    if (!v57)
    {
      int64_t v58 = v50 + 1;
      if (v50 + 1 >= v55) {
        break;
      }
      uint64_t v57 = *(void *)(v51 + 8 * v58);
      if (!v57)
      {
        int64_t v58 = v50 + 2;
        if (v50 + 2 >= v55) {
          break;
        }
        uint64_t v57 = *(void *)(v51 + 8 * v58);
        if (!v57)
        {
          int64_t v58 = v50 + 3;
          if (v50 + 3 >= v55) {
            break;
          }
          uint64_t v57 = *(void *)(v51 + 8 * v58);
          if (!v57)
          {
            while (1)
            {
              int64_t v50 = v58 + 1;
              if (__OFADD__(v58, 1)) {
                goto LABEL_72;
              }
              if (v50 >= v55) {
                goto LABEL_58;
              }
              uint64_t v57 = *(void *)(v51 + 8 * v50);
              ++v58;
              if (v57) {
                goto LABEL_49;
              }
            }
          }
        }
      }
      int64_t v50 = v58;
    }
LABEL_49:
    uint64_t v54 = (v57 - 1) & v57;
LABEL_50:
    swift_bridgeObjectRetain();
    if (sub_23F114360())
    {
      id v59 = (void *)sub_23F120D90();
      swift_bridgeObjectRelease();
      id v60 = objc_msgSend(v72, sel_featureValueForName_, v59);

      if (v60)
      {
        id v61 = objc_msgSend(v60, sel_multiArrayValue);

        if (v61)
        {

          uint64_t v70 = v61;
        }
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
LABEL_58:
  swift_release();
  if (v70)
  {
    float v62 = *(float *)(v3 + OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_confidenceThreshold);
    id v63 = v70;
    uint64_t v33 = sub_23F11EEC8(v63, v62);
    swift_unknownObjectRelease();

    return v33;
  }
  swift_unknownObjectRelease();

LABEL_65:
  return 0;
}

id AudiogramGraphDetectorModel.__allocating_init(modelUrl:modelInputSize:confidenceThreshold:)(uint64_t a1, double a2, double a3, float a4)
{
  uint64_t v9 = sub_23F120CA0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  unint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = objc_allocWithZone(v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  id v14 = AudiogramDetectorModel.init(modelUrl:modelInputSize:confidenceThreshold:)((uint64_t)v12, a2, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  return v14;
}

id AudiogramGraphDetectorModel.init(modelUrl:modelInputSize:confidenceThreshold:)(uint64_t a1, double a2, double a3, float a4)
{
  uint64_t v8 = sub_23F120CA0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  id v12 = AudiogramDetectorModel.init(modelUrl:modelInputSize:confidenceThreshold:)((uint64_t)v11, a2, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
  return v12;
}

id AudiogramGraphDetectorModel.__deallocating_deinit()
{
  return sub_23F114688(type metadata accessor for AudiogramGraphDetectorModel);
}

id sub_23F1154B8()
{
  v6[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = (void *)sub_23F120D70();
  swift_bridgeObjectRelease();
  v6[0] = 0;
  id v2 = objc_msgSend(v0, sel_initWithDictionary_error_, v1, v6);

  if (v2)
  {
    id v3 = v6[0];
  }
  else
  {
    id v4 = v6[0];
    sub_23F120C70();

    swift_willThrow();
  }
  return v2;
}

uint64_t sub_23F1155A0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_23F115674(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_23F116510((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_23F116510((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_23F115674(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_23F120F70();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_23F115830(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_23F120FE0();
  if (!v8)
  {
    sub_23F121050();
    __break(1u);
LABEL_17:
    uint64_t result = sub_23F121090();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_23F115830(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_23F1158C8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_23F115AA8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_23F115AA8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23F1158C8(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_23F115A40(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_23F120FA0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_23F121050();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_23F120E20();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_23F121090();
    __break(1u);
LABEL_14:
    uint64_t result = sub_23F121050();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_23F115A40(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C356C8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23F115AA8(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C356C8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  id v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_23F121090();
  __break(1u);
  return result;
}

unint64_t sub_23F115BF8(uint64_t a1, uint64_t a2)
{
  sub_23F121180();
  sub_23F120DF0();
  uint64_t v4 = sub_23F1211A0();
  return sub_23F115D04(a1, a2, v4);
}

unint64_t sub_23F115C70(uint64_t a1)
{
  sub_23F120DC0();
  sub_23F121180();
  sub_23F120DF0();
  uint64_t v2 = sub_23F1211A0();
  swift_bridgeObjectRelease();
  return sub_23F115DE8(a1, v2);
}

unint64_t sub_23F115D04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_23F121160() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        id v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_23F121160() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_23F115DE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_23F120DC0();
    uint64_t v8 = v7;
    if (v6 == sub_23F120DC0() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_23F121160();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_23F120DC0();
          uint64_t v15 = v14;
          if (v13 == sub_23F120DC0() && v15 == v16) {
            break;
          }
          char v18 = sub_23F121160();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_23F115F60(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 80);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v1 = *(void *)(a1 + 88);
  if (v1)
  {
    uint64_t v2 = 192;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 4) {
    unint64_t v7 = 4;
  }
  unint64_t v8 = v7 - 4;
  uint64_t v9 = (unint64_t *)(a1 + 96);
  uint64_t v2 = 192;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_23F116010(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(unsigned char *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)result >> 6) + 64) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    return *(void *)(*(void *)(a4 + 48) + 16 * result);
  }
LABEL_8:
  __break(1u);
  return result;
}

id sub_23F116064(uint64_t a1, uint64_t a2)
{
  v13[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = (void *)sub_23F120C80();
  v13[0] = 0;
  id v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_modelWithContentsOfURL_configuration_error_, v4, a2, v13);

  id v6 = v13[0];
  if (v5)
  {
    uint64_t v7 = sub_23F120CA0();
    unint64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    id v9 = v6;
    v8(a1, v7);
  }
  else
  {
    id v10 = v13[0];
    sub_23F120C70();

    swift_willThrow();
    uint64_t v11 = sub_23F120CA0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(a1, v11);
  }
  return v5;
}

uint64_t type metadata accessor for AudiogramSymbolDetectorModel(uint64_t a1)
{
  return sub_23F116204(a1, (uint64_t *)&unk_268C35688);
}

uint64_t type metadata accessor for AudiogramGraphDetectorModel(uint64_t a1)
{
  return sub_23F116204(a1, (uint64_t *)&unk_268C35698);
}

uint64_t sub_23F116204(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_23F11623C()
{
  return type metadata accessor for AudiogramDetectorModel(0);
}

uint64_t sub_23F116244()
{
  uint64_t result = sub_23F120CA0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_23F120D30();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t method lookup function for AudiogramDetectorModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AudiogramDetectorModel);
}

uint64_t dispatch thunk of AudiogramDetectorModel.__allocating_init(modelUrl:modelInputSize:confidenceThreshold:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t sub_23F116360()
{
  return type metadata accessor for AudiogramSymbolDetectorModel(0);
}

uint64_t sub_23F116368()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for AudiogramSymbolDetectorModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AudiogramSymbolDetectorModel);
}

uint64_t dispatch thunk of AudiogramSymbolDetectorModel.__allocating_init(modelUrl:modelInputSize:confidenceThreshold:classNames:collisionMitigationClassNames:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of AudiogramSymbolDetectorModel.getSymbolDetectorResult(_:orientation:in:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t sub_23F116410()
{
  return type metadata accessor for AudiogramGraphDetectorModel(0);
}

uint64_t sub_23F116418()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for AudiogramGraphDetectorModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AudiogramGraphDetectorModel);
}

uint64_t dispatch thunk of AudiogramGraphDetectorModel.getGraphDetectorResult(_:orientation:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

_OWORD *sub_23F11649C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_23F1164AC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23F116510(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23F11656C(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_23F1165A8()
{
  unint64_t result = qword_268C356D8;
  if (!qword_268C356D8)
  {
    sub_23F120CA0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C356D8);
  }
  return result;
}

void AudiogramSymbolDetectorModel.init(modelUrl:modelInputSize:confidenceThreshold:)()
{
}

id sub_23F116610(uint64_t a1, unint64_t a2)
{
  *(void *)&v2[OBJC_IVAR____TtC18AudiogramIngestion29AIAudiogramSymbolChoiceButton_percentageOfSymbolSize] = 0x3FC999999999999ALL;
  uint64_t v5 = OBJC_IVAR____TtC18AudiogramIngestion29AIAudiogramSymbolChoiceButton_labelForSymbol;
  id v6 = objc_allocWithZone(MEMORY[0x263F828E0]);
  uint64_t v7 = v2;
  *(void *)&v2[v5] = objc_msgSend(v6, sel_init);
  id v8 = unfilledImageForSymbolType(a1);
  *(void *)&v7[OBJC_IVAR____TtC18AudiogramIngestion29AIAudiogramSymbolChoiceButton_symbolImage] = v8;
  id v9 = labelForSymbolType(a1);
  uint64_t v10 = sub_23F120DC0();
  uint64_t v12 = v11;

  uint64_t v13 = (uint64_t *)&v7[OBJC_IVAR____TtC18AudiogramIngestion29AIAudiogramSymbolChoiceButton_symbolTitle];
  *uint64_t v13 = v10;
  v13[1] = v12;
  *(void *)&v7[OBJC_IVAR____TtC18AudiogramIngestion29AIAudiogramSymbolChoiceButton_symbol] = a1;

  v21.receiver = v7;
  v21.super_class = (Class)type metadata accessor for AIAudiogramSymbolChoiceButton();
  id v14 = objc_msgSendSuper2(&v21, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  id v15 = objc_allocWithZone(NSNumber);
  id v16 = v14;
  id v17 = objc_msgSend(v15, sel_initWithInteger_, a1);
  id v18 = v16;
  LOBYTE(a1) = sub_23F10C9EC((uint64_t)v17, a2);
  swift_bridgeObjectRelease();
  objc_msgSend(v18, sel_setSelected_, a1 & 1);

  sub_23F1168A4();
  sub_23F116BBC();
  swift_bridgeObjectRetain();
  id v19 = (void *)sub_23F120D90();
  swift_bridgeObjectRelease();
  objc_msgSend(v18, sel_setAccessibilityLabel_, v19);

  return v18;
}

void sub_23F1168A4()
{
  unint64_t v1 = v0;
  id v2 = objc_msgSend(self, sel_systemBackgroundColor);
  objc_msgSend(v1, sel_setBackgroundColor_, v2);

  id v3 = objc_msgSend(v1, sel_layer);
  objc_msgSend(v3, sel_setCornerRadius_, 20.0);

  id v4 = objc_msgSend(v1, sel_layer);
  objc_msgSend(v4, sel_setBorderWidth_, 3.0);

  unsigned int v5 = objc_msgSend(self, sel_deviceIsPad);
  id v6 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C35610);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_23F124F70;
  if (v5)
  {
    id v8 = objc_msgSend(v1, sel_heightAnchor);
    id v9 = objc_msgSend(v1, sel_widthAnchor);
    id v10 = objc_msgSend(v8, sel_constraintGreaterThanOrEqualToAnchor_multiplier_, v9, 0.6);
  }
  else
  {
    id v8 = objc_msgSend(v1, sel_widthAnchor);
    id v9 = objc_msgSend(v1, sel_heightAnchor);
    id v10 = objc_msgSend(v8, sel_constraintEqualToAnchor_, v9);
  }
  id v11 = v10;

  *(void *)(v7 + 32) = v11;
  sub_23F120E70();
  sub_23F1172DC();
  uint64_t v12 = (void *)sub_23F120E40();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_activateConstraints_, v12);

  sub_23F116AE8();
}

void sub_23F116AE8()
{
  id v1 = objc_msgSend(v0, sel_layer);
  unsigned int v2 = objc_msgSend(v0, sel_isSelected);
  id v3 = self;
  id v4 = &selRef_systemBlueColor;
  if (!v2) {
    id v4 = &selRef_clearColor;
  }
  id v5 = [v3 *v4];
  id v6 = objc_msgSend(v5, sel_CGColor);

  objc_msgSend(v1, sel_setBorderColor_, v6);
}

void sub_23F116BBC()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithImage_, *(void *)&v0[OBJC_IVAR____TtC18AudiogramIngestion29AIAudiogramSymbolChoiceButton_symbolImage]);
  objc_msgSend(v1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v43 = objc_msgSend(self, sel_configurationWithWeight_, 8);
  objc_msgSend(v1, sel_setPreferredSymbolConfiguration_, v43);
  uint64_t v2 = OBJC_IVAR____TtC18AudiogramIngestion29AIAudiogramSymbolChoiceButton_labelForSymbol;
  id v3 = *(id *)&v0[OBJC_IVAR____TtC18AudiogramIngestion29AIAudiogramSymbolChoiceButton_labelForSymbol];
  swift_bridgeObjectRetain();
  id v4 = (void *)sub_23F120D90();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_setText_, v4);

  objc_msgSend(*(id *)&v0[v2], sel_setTextAlignment_, 1);
  id v5 = *(void **)&v0[v2];
  id v6 = self;
  id v7 = v5;
  id v8 = objc_msgSend(v6, sel_secondaryLabelColor);
  objc_msgSend(v7, sel_setTextColor_, v8);

  id v9 = *(void **)&v0[v2];
  id v10 = self;
  uint64_t v11 = *MEMORY[0x263F835F0];
  id v12 = v9;
  id v13 = objc_msgSend(v10, sel_preferredFontForTextStyle_, v11);
  objc_msgSend(v12, sel_setFont_, v13);

  objc_msgSend(*(id *)&v0[v2], sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(*(id *)&v0[v2], sel_setAdjustsFontForContentSizeCategory_, 1);
  objc_msgSend(*(id *)&v0[v2], sel_setNumberOfLines_, 0);
  objc_msgSend(v0, sel_addSubview_, v1);
  objc_msgSend(v0, sel_addSubview_, *(void *)&v0[v2]);
  id v42 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C35610);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_23F124F80;
  id v15 = objc_msgSend(v1, sel_widthAnchor);
  id v16 = objc_msgSend(v0, sel_widthAnchor);
  id v17 = objc_msgSend(v15, sel_constraintEqualToAnchor_multiplier_, v16, 0.2);

  *(void *)(v14 + 32) = v17;
  id v18 = objc_msgSend(v1, sel_heightAnchor);
  id v19 = objc_msgSend(v1, sel_widthAnchor);
  id v20 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v19);

  *(void *)(v14 + 40) = v20;
  id v21 = objc_msgSend(v1, sel_centerXAnchor);
  id v22 = objc_msgSend(v0, sel_centerXAnchor);
  id v23 = objc_msgSend(v21, sel_constraintEqualToAnchor_, v22);

  *(void *)(v14 + 4_Block_object_dispose(&a9, 8) = v23;
  id v24 = objc_msgSend(v1, sel_centerYAnchor);
  id v25 = objc_msgSend(v0, sel_centerYAnchor);
  id v26 = objc_msgSend(v24, sel_constraintEqualToAnchor_, v25);

  *(void *)(v14 + 56) = v26;
  id v27 = objc_msgSend(*(id *)&v0[v2], sel_topAnchor);
  id v28 = objc_msgSend(v1, sel_bottomAnchor);
  id v29 = objc_msgSend(v27, sel_constraintGreaterThanOrEqualToAnchor_constant_, v28, 10.0);

  *(void *)(v14 + 64) = v29;
  id v30 = objc_msgSend(*(id *)&v0[v2], sel_bottomAnchor);
  id v31 = objc_msgSend(v0, sel_bottomAnchor);
  id v32 = objc_msgSend(v30, sel_constraintEqualToAnchor_constant_, v31, -10.0);

  *(void *)(v14 + 72) = v32;
  id v33 = objc_msgSend(*(id *)&v0[v2], sel_centerXAnchor);
  id v34 = objc_msgSend(v0, sel_centerXAnchor);
  id v35 = objc_msgSend(v33, sel_constraintEqualToAnchor_, v34);

  *(void *)(v14 + 80) = v35;
  id v36 = objc_msgSend(*(id *)&v0[v2], sel_leadingAnchor);
  id v37 = objc_msgSend(v0, sel_leadingAnchor);
  id v38 = objc_msgSend(v36, sel_constraintEqualToAnchor_, v37);

  *(void *)(v14 + 8_Block_object_dispose(&a9, 8) = v38;
  id v39 = objc_msgSend(*(id *)&v0[v2], sel_trailingAnchor);
  id v40 = objc_msgSend(v0, sel_trailingAnchor);
  id v41 = objc_msgSend(v39, sel_constraintEqualToAnchor_, v40);

  *(void *)(v14 + 96) = v41;
  sub_23F120E70();
  sub_23F1172DC();
  id v44 = (id)sub_23F120E40();
  swift_bridgeObjectRelease();
  objc_msgSend(v42, sel_activateConstraints_, v44);
}

id sub_23F117224()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AIAudiogramSymbolChoiceButton();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AIAudiogramSymbolChoiceButton()
{
  return self;
}

unint64_t sub_23F1172DC()
{
  unint64_t result = qword_268C35750;
  if (!qword_268C35750)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268C35750);
  }
  return result;
}

id AudiogramDebugViewController.__allocating_init(image:debugInfo:)(uint64_t a1, uint64_t a2)
{
  id v5 = (char *)objc_allocWithZone(v2);
  *(void *)&v5[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_imageView] = 0;
  *(void *)&v5[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_scrollView] = 0;
  *(void *)&v5[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_confidenceSlider] = 0;
  *(void *)&v5[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_confidenceLabel] = 0;
  *(void *)&v5[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_image] = a1;
  *(void *)&v5[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_debugInfo] = a2;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_initWithNibName_bundle_, 0, 0);
}

id AudiogramDebugViewController.init(image:debugInfo:)(uint64_t a1, uint64_t a2)
{
  *(void *)&v2[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_imageView] = 0;
  *(void *)&v2[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_scrollView] = 0;
  *(void *)&v2[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_confidenceSlider] = 0;
  *(void *)&v2[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_confidenceLabel] = 0;
  *(void *)&v2[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_image] = a1;
  *(void *)&v2[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_debugInfo] = a2;
  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for AudiogramDebugViewController();
  return objc_msgSendSuper2(&v4, sel_initWithNibName_bundle_, 0, 0);
}

uint64_t type metadata accessor for AudiogramDebugViewController()
{
  return self;
}

void sub_23F117558()
{
  v34.receiver = v0;
  v34.super_class = (Class)type metadata accessor for AudiogramDebugViewController();
  objc_msgSendSuper2(&v34, sel_viewDidLoad);
  id v1 = (void *)sub_23F120D90();
  objc_msgSend(v0, sel_setTitle_, v1);

  id v2 = objc_msgSend(v0, sel_navigationController);
  if (v2)
  {
    id v3 = v2;
    id v4 = objc_msgSend(v2, sel_navigationBar);

    objc_msgSend(v4, sel_setPrefersLargeTitles_, 0);
  }
  id v5 = objc_msgSend(v0, sel_view);
  if (!v5)
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  id v6 = v5;
  id v7 = objc_msgSend(self, sel_whiteColor);
  objc_msgSend(v6, sel_setBackgroundColor_, v7);

  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F829A8]), sel_init);
  objc_msgSend(v8, sel_configureWithOpaqueBackground);
  id v9 = objc_msgSend(v0, sel_navigationController);
  if (v9)
  {
    id v10 = v9;
    id v11 = objc_msgSend(v9, sel_navigationBar);

    objc_msgSend(v11, sel_setScrollEdgeAppearance_, v8);
  }
  id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82B88]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v13 = OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_scrollView;
  uint64_t v14 = *(void **)&v0[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_scrollView];
  *(void *)&v0[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_scrollView] = v12;

  id v15 = *(void **)&v0[v13];
  if (!v15) {
    goto LABEL_25;
  }
  objc_msgSend(v15, sel_setDelegate_, v0);
  id v16 = objc_msgSend(v0, sel_view);
  if (!v16)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (!*(void *)&v0[v13])
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  id v17 = v16;
  objc_msgSend(v16, sel_addSubview_);

  id v18 = *(void **)&v0[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_image];
  id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithImage_, v18);
  uint64_t v20 = OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_imageView;
  id v21 = *(void **)&v0[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_imageView];
  *(void *)&v0[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_imageView] = v19;

  id v22 = *(void **)&v0[v20];
  if (!v22)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  id v23 = v22;
  objc_msgSend(v18, sel_size);
  objc_msgSend(v23, sel_setFrame_, 0.0, 0.0, v24, v25);

  id v26 = *(void **)&v0[v13];
  if (!v26)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (!*(void *)&v0[v20])
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  objc_msgSend(v26, sel_addSubview_);
  id v27 = *(void **)&v0[v13];
  if (v27)
  {
    id v28 = v27;
    objc_msgSend(v18, sel_size);
    objc_msgSend(v28, sel_setContentSize_);

    sub_23F1181B0();
    unint64_t v29 = *(void *)&v0[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_debugInfo];
    if (v29 >> 62)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v30 = sub_23F121070();
      if (v30) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v30 = *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain_n();
      if (v30)
      {
LABEL_15:
        if (v30 >= 1)
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if ((v29 & 0xC000000000000001) != 0) {
              id v32 = (id)MEMORY[0x2455C4A50](i, v29);
            }
            else {
              id v32 = *(id *)(v29 + 8 * i + 32);
            }
            id v33 = v32;
            sub_23F117B60((uint64_t)v32);
          }
          goto LABEL_22;
        }
        __break(1u);
        goto LABEL_24;
      }
    }
LABEL_22:

    swift_bridgeObjectRelease_n();
    return;
  }
LABEL_31:
  __break(1u);
}

id sub_23F11797C(char a1)
{
  v24.receiver = v1;
  v24.super_class = (Class)type metadata accessor for AudiogramDebugViewController();
  id result = objc_msgSendSuper2(&v24, sel_viewWillAppear_, a1 & 1);
  uint64_t v4 = OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_scrollView;
  id v5 = *(void **)&v1[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_scrollView];
  if (!v5)
  {
    __break(1u);
    goto LABEL_14;
  }
  id v6 = v5;
  id result = objc_msgSend(v1, sel_view);
  if (!result)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  id v7 = result;
  objc_msgSend(result, sel_bounds);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  objc_msgSend(v6, sel_setFrame_, v9, v11, v13, v15);
  id result = *(id *)&v1[v4];
  if (!result)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  objc_msgSend(result, sel_frame);
  id result = *(id *)&v1[v4];
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  double v18 = v16;
  double v19 = v17;
  objc_msgSend(result, sel_contentSize);
  id result = *(id *)&v1[v4];
  if (!result)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  double v21 = v18 / v20;
  objc_msgSend(result, sel_contentSize);
  if (v19 / v22 >= v21) {
    double v23 = v21;
  }
  else {
    double v23 = v19 / v22;
  }
  id result = *(id *)&v1[v4];
  if (!result) {
    goto LABEL_18;
  }
  objc_msgSend(result, sel_setMinimumZoomScale_, v23);
  id result = *(id *)&v1[v4];
  if (!result)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  objc_msgSend(result, sel_setMaximumZoomScale_, 1.0);
  id result = *(id *)&v1[v4];
  if (result) {
    return objc_msgSend(result, sel_setZoomScale_, v23);
  }
LABEL_20:
  __break(1u);
  return result;
}

void sub_23F117B60(uint64_t a1)
{
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_image), sel_size);
  double v4 = v3;
  double v6 = v5;
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  uint64_t v8 = *(void *)(a1 + OBJC_IVAR____TtC18AudiogramIngestion23AudiogramDetectorResult_graph)
     + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_box;
  swift_beginAccess();
  CGFloat v9 = *(double *)v8;
  CGFloat v10 = *(double *)(v8 + 8);
  CGFloat v11 = *(double *)(v8 + 16);
  CGFloat v12 = *(double *)(v8 + 24);
  CGAffineTransformMakeTranslation(&v69, -0.5, -0.5);
  v70.origin.CGFloat x = v9;
  v70.origin.CGFloat y = v10;
  v70.size.CGFloat width = v11;
  v70.size.CGFloat height = v12;
  CGRect v71 = CGRectApplyAffineTransform(v70, &v69);
  v69.a = 1.0;
  v69.b = 0.0;
  v69.c = 0.0;
  v69.d = 1.0;
  v69.tCGFloat x = 0.0;
  v69.tCGFloat y = 0.0;
  CGRect v72 = CGRectApplyAffineTransform(v71, &v69);
  CGFloat x = v72.origin.x;
  CGFloat y = v72.origin.y;
  CGFloat width = v72.size.width;
  CGFloat height = v72.size.height;
  CGAffineTransformMakeTranslation(&v69, 0.5, 0.5);
  v73.origin.CGFloat x = x;
  v73.origin.CGFloat y = y;
  v73.size.CGFloat width = width;
  v73.size.CGFloat height = height;
  CGRect v74 = CGRectApplyAffineTransform(v73, &v69);
  CGFloat v17 = v74.origin.x;
  CGFloat v18 = v74.origin.y;
  CGFloat v19 = v74.size.width;
  CGFloat v20 = v74.size.height;
  double v21 = v4 * CGRectGetMinX(v74);
  v75.origin.CGFloat x = v17;
  v75.origin.CGFloat y = v18;
  v75.size.CGFloat width = v19;
  v75.size.CGFloat height = v20;
  double v22 = v6 * CGRectGetMinY(v75);
  v76.origin.CGFloat x = v17;
  v76.origin.CGFloat y = v18;
  v76.size.CGFloat width = v19;
  v76.size.CGFloat height = v20;
  double v23 = v4 * CGRectGetWidth(v76);
  v77.origin.CGFloat x = v17;
  v77.origin.CGFloat y = v18;
  v77.size.CGFloat width = v19;
  v77.size.CGFloat height = v20;
  double v24 = v6 * CGRectGetHeight(v77);
  double v67 = v23;
  objc_msgSend(v7, sel_setFrame_, v21, v22, v23, v24);
  id v25 = objc_msgSend(v7, sel_layer);
  objc_msgSend(v25, sel_setBorderWidth_, 4.0);

  id v26 = v7;
  id v27 = objc_msgSend(v7, sel_layer);
  id v28 = objc_msgSend(self, sel_blackColor);
  id v29 = objc_msgSend(v28, sel_CGColor);

  objc_msgSend(v27, sel_setBorderColor_, v29);
  uint64_t v30 = *(void **)(v1 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_imageView);
  if (v30)
  {
    objc_msgSend(v30, sel_addSubview_, v26);
    double v31 = 8.0;
    if (v6 < 1000.0) {
      double v31 = 4.0;
    }
    if (v6 < 400.0) {
      double v31 = 2.0;
    }
    double v66 = v31;
    unint64_t v68 = *(void *)(a1 + OBJC_IVAR____TtC18AudiogramIngestion23AudiogramDetectorResult_symbols);
    if (v68 >> 62) {
      goto LABEL_20;
    }
    uint64_t v32 = *(void *)((v68 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    for (; v32; uint64_t v32 = sub_23F121070())
    {
      uint64_t v33 = OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_confidenceSlider;
      unint64_t v34 = v68 & 0xC000000000000001;
      uint64_t v35 = 4;
      uint64_t v65 = OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_confidenceSlider;
      uint64_t v36 = 0;
      if ((v68 & 0xC000000000000001) != 0)
      {
LABEL_9:
        id v37 = (char *)MEMORY[0x2455C4A50](v36, v68);
        goto LABEL_11;
      }
      while (1)
      {
        id v37 = (char *)*(id *)(v68 + 8 * v35);
LABEL_11:
        id v38 = v37;
        uint64_t v39 = v36 + 1;
        if (__OFADD__(v36, 1)) {
          break;
        }
        id v40 = *(void **)(v1 + v33);
        if (!v40)
        {
          __break(1u);
          goto LABEL_23;
        }
        float v41 = *(double *)&v38[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_confidence];
        objc_msgSend(v40, sel_value);
        if (v42 <= v41)
        {
          id v43 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
          CGFloat v44 = *(double *)&v38[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box];
          CGFloat v45 = *(double *)&v38[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box + 8];
          CGFloat v46 = *(double *)&v38[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box + 16];
          CGFloat v47 = *(double *)&v38[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box + 24];
          CGAffineTransformMakeTranslation(&v69, -0.5, -0.5);
          v78.origin.CGFloat x = v44;
          v78.origin.CGFloat y = v45;
          v78.size.CGFloat width = v46;
          v78.size.CGFloat height = v47;
          CGRect v79 = CGRectApplyAffineTransform(v78, &v69);
          v69.b = 0.0;
          v69.c = 0.0;
          v69.a = 1.0;
          v69.d = 1.0;
          v69.tCGFloat x = 0.0;
          v69.tCGFloat y = 0.0;
          CGRect v80 = CGRectApplyAffineTransform(v79, &v69);
          CGFloat v48 = v80.origin.x;
          CGFloat v49 = v80.origin.y;
          CGFloat v50 = v80.size.width;
          CGFloat v51 = v80.size.height;
          CGAffineTransformMakeTranslation(&v69, 0.5, 0.5);
          v81.origin.CGFloat x = v48;
          v81.origin.CGFloat y = v49;
          v81.size.CGFloat width = v50;
          v81.size.CGFloat height = v51;
          CGRect v82 = CGRectApplyAffineTransform(v81, &v69);
          CGFloat v52 = v82.origin.x;
          CGFloat v53 = v82.origin.y;
          CGFloat v54 = v82.size.width;
          CGFloat v55 = v82.size.height;
          double v56 = v67 * CGRectGetMinX(v82);
          v83.origin.CGFloat x = v52;
          v83.origin.CGFloat y = v53;
          v83.size.CGFloat width = v54;
          v83.size.CGFloat height = v55;
          double v57 = v24 * CGRectGetMinY(v83);
          v84.origin.CGFloat x = v52;
          v84.origin.CGFloat y = v53;
          v84.size.CGFloat width = v54;
          v84.size.CGFloat height = v55;
          double v58 = v67 * CGRectGetWidth(v84);
          v85.origin.CGFloat x = v52;
          v85.origin.CGFloat y = v53;
          v85.size.CGFloat width = v54;
          v85.size.CGFloat height = v55;
          objc_msgSend(v43, sel_setFrame_, v56, v57, v58, v24 * CGRectGetHeight(v85));
          id v59 = v26;
          id v60 = objc_msgSend(v43, sel_layer);
          objc_msgSend(v60, sel_setBorderWidth_, v66);

          id v61 = objc_msgSend(v43, sel_layer);
          id v62 = sub_23F1193AC(*(void *)&v38[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_labelName], *(void *)&v38[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_labelName + 8]);
          uint64_t v63 = v35;
          id v64 = objc_msgSend(v62, sel_CGColor);

          unint64_t v34 = v68 & 0xC000000000000001;
          objc_msgSend(v61, sel_setBorderColor_, v64);

          uint64_t v33 = v65;
          uint64_t v35 = v63;
          id v26 = v59;
          objc_msgSend(v59, sel_addSubview_, v43);

          if (v39 == v32) {
            goto LABEL_21;
          }
        }
        else
        {

          if (v39 == v32) {
            goto LABEL_21;
          }
        }
        uint64_t v36 = ++v35 - 4;
        if (v34) {
          goto LABEL_9;
        }
      }
      __break(1u);
LABEL_20:
      swift_bridgeObjectRetain_n();
    }
LABEL_21:
    swift_bridgeObjectRelease_n();
  }
  else
  {
LABEL_23:
    __break(1u);
  }
}

void sub_23F1181B0()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82BF8]), sel_init);
  objc_msgSend(v1, sel_setAxis_, 1);
  objc_msgSend(v1, sel_setSpacing_, 8.0);
  objc_msgSend(v1, sel_setLayoutMarginsRelativeArrangement_, 1);
  objc_msgSend(v1, sel_setLayoutMargins_, 10.0, 10.0, 20.0, 10.0);
  id v2 = self;
  id v3 = v1;
  id v4 = objc_msgSend(v2, sel_systemBackgroundColor);
  objc_msgSend(v3, sel_setBackgroundColor_, v4);
  CGRect v81 = v3;

  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82BF8]), sel_init);
  objc_msgSend(v5, sel_setAxis_, 0);
  objc_msgSend(v5, sel_setSpacing_, 4.0);
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  id v7 = (void *)sub_23F120D90();
  objc_msgSend(v6, sel_setText_, v7);

  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  uint64_t v9 = OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_confidenceLabel;
  CGFloat v10 = *(void **)&v0[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_confidenceLabel];
  *(void *)&v0[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_confidenceLabel] = v8;

  CGFloat v11 = *(void **)&v0[v9];
  if (!v11)
  {
    __break(1u);
    goto LABEL_40;
  }
  id v12 = v11;
  double v13 = (void *)sub_23F120D90();
  objc_msgSend(v12, sel_setText_, v13);

  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82BD8]), sel_init);
  uint64_t v15 = OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_confidenceSlider;
  double v16 = *(void **)&v0[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_confidenceSlider];
  *(void *)&v0[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_confidenceSlider] = v14;

  CGFloat v18 = *(void **)&v0[v15];
  if (!v18)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  LODWORD(v17) = 1050253722;
  objc_msgSend(v18, sel_setValue_, v17);
  CGFloat v20 = *(void **)&v0[v15];
  if (!v20)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  LODWORD(v19) = 1045220557;
  objc_msgSend(v20, sel_setMinimumValue_, v19);
  double v22 = *(void **)&v0[v15];
  if (!v22)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  LODWORD(v21) = 1.0;
  objc_msgSend(v22, sel_setMaximumValue_, v21);
  double v23 = *(void **)&v0[v15];
  if (!v23)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  objc_msgSend(v23, sel_addTarget_action_forControlEvents_, v0, sel_sliderValueChanged_, 4096);
  double v24 = *(void **)&v0[v15];
  if (!v24)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  id v25 = *(void **)&v0[v9];
  if (!v25)
  {
LABEL_45:
    __break(1u);
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  CGRect v80 = v0;
  id v26 = v5;
  id v27 = v6;
  id v28 = v24;
  id v29 = v25;
  objc_msgSend(v26, sel_addArrangedSubview_, v27);
  objc_msgSend(v26, sel_addArrangedSubview_, v28);
  objc_msgSend(v26, sel_addArrangedSubview_, v29);

  CGRect v79 = v27;
  id v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82BF8]), sel_init);
  objc_msgSend(v30, sel_setAxis_, 0);
  objc_msgSend(v30, sel_setSpacing_, 4.0);
  objc_msgSend(v30, sel_setDistribution_, 1);
  id v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82BF8]), sel_init);
  objc_msgSend(v31, sel_setAxis_, 1);
  objc_msgSend(v31, sel_setSpacing_, 4.0);
  id v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82BF8]), sel_init);
  objc_msgSend(v32, sel_setAxis_, 1);
  objc_msgSend(v32, sel_setSpacing_, 4.0);
  id v33 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  unint64_t v34 = (void *)sub_23F120D90();
  objc_msgSend(v33, sel_setText_, v34);

  id v35 = objc_msgSend(v33, sel_layer);
  objc_msgSend(v35, sel_setBorderWidth_, 2.0);

  id v36 = objc_msgSend(v33, sel_layer);
  id v37 = objc_msgSend(v2, sel_blackColor);
  id v38 = objc_msgSend(v37, sel_CGColor);

  objc_msgSend(v36, sel_setBorderColor_, v38);
  id v85 = v31;
  CGRect v78 = v33;
  objc_msgSend(v31, sel_addArrangedSubview_, v33);
  if (qword_26F2D3558)
  {
    id v83 = v32;
    id v77 = v26;
    uint64_t v39 = 0;
    uint64_t v40 = qword_26F2D3558 - 1;
    while (2)
    {
      unint64_t v41 = *((void *)&unk_26F2D3548 + v39 + 4);
      id v42 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
      switch(v41)
      {
        case 0uLL:
        case 1uLL:
        case 2uLL:
        case 3uLL:
        case 4uLL:
        case 5uLL:
        case 6uLL:
        case 7uLL:
        case 8uLL:
        case 9uLL:
        case 0xAuLL:
        case 0xBuLL:
          sub_23F120E00();
          swift_bridgeObjectRelease();
          id v43 = (void *)sub_23F120D90();
          swift_bridgeObjectRelease();
          objc_msgSend(v42, sel_setText_, v43);

          uint64_t v44 = 0xE100000000000000;
          uint64_t v45 = 118;
          switch(v41)
          {
            case 0uLL:
              uint64_t v44 = 0xE500000000000000;
              uint64_t v45 = 0x7465726163;
              goto LABEL_23;
            case 1uLL:
              uint64_t v45 = 0x625F6465736F6C63;
              uint64_t v44 = 0xEE0074656B636172;
              goto LABEL_23;
            case 2uLL:
              uint64_t v45 = 0x635F6465736F6C63;
              uint64_t v44 = 0xEB000000006C6965;
              goto LABEL_23;
            case 3uLL:
              uint64_t v45 = 0x635F6465736F6C63;
              uint64_t v44 = 0xEE006E6F72766568;
              goto LABEL_23;
            case 4uLL:
              uint64_t v45 = 111;
              goto LABEL_23;
            case 5uLL:
              uint64_t v45 = 0x6172625F6E65706FLL;
              uint64_t v44 = 0xEC00000074656B63;
              goto LABEL_23;
            case 6uLL:
              uint64_t v45 = 0x6965635F6E65706FLL;
              uint64_t v44 = 0xE90000000000006CLL;
              goto LABEL_23;
            case 7uLL:
              uint64_t v45 = 0x6568635F6E65706FLL;
              uint64_t v44 = 0xEC0000006E6F7276;
              goto LABEL_23;
            case 8uLL:
              uint64_t v44 = 0xE600000000000000;
              uint64_t v45 = 0x657261757173;
              goto LABEL_23;
            case 9uLL:
              uint64_t v44 = 0xE800000000000000;
              uint64_t v45 = 0x656C676E61697274;
              goto LABEL_23;
            case 0xAuLL:
              goto LABEL_23;
            case 0xBuLL:
              uint64_t v45 = 120;
LABEL_23:
              id v46 = sub_23F1193AC(v45, v44);
              swift_bridgeObjectRelease();
              objc_msgSend(v42, sel_setTextColor_, v46);
              id v47 = objc_msgSend(v42, sel_layer);
              objc_msgSend(v47, sel_setBorderWidth_, 2.0);

              id v48 = objc_msgSend(v42, sel_layer);
              id v49 = objc_msgSend(v46, sel_CGColor);
              objc_msgSend(v48, sel_setBorderColor_, v49);

              if (v41 >= (unint64_t)qword_26F2D3558 >> 1) {
                CGFloat v50 = v83;
              }
              else {
                CGFloat v50 = v85;
              }
              objc_msgSend(v50, sel_addArrangedSubview_, v42, v77);

              if (v40 == v39) {
                goto LABEL_30;
              }
              if (!__OFADD__(++v39, 1)) {
                continue;
              }
              __break(1u);
LABEL_30:
              id v26 = v77;
              id v32 = v83;
              if ((qword_26F2D3558 & 1) == 0) {
                goto LABEL_31;
              }
              goto LABEL_32;
            default:
              goto LABEL_50;
          }
        default:
          goto LABEL_50;
      }
    }
LABEL_50:
    sub_23F121170();
    __break(1u);
    JUMPOUT(0x23F118E44);
  }
LABEL_31:
  id v51 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  objc_msgSend(v32, sel_addArrangedSubview_, v51);

LABEL_32:
  id v52 = v30;
  id v53 = v85;
  id v54 = v32;
  objc_msgSend(v52, sel_addArrangedSubview_, v53);
  objc_msgSend(v52, sel_addArrangedSubview_, v54);

  id v55 = v81;
  id v56 = v26;
  id v57 = v52;
  objc_msgSend(v55, sel_addArrangedSubview_, v56);
  objc_msgSend(v55, sel_addArrangedSubview_, v57);

  objc_msgSend(v55, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v58 = objc_msgSend(v80, sel_view);
  if (!v58) {
    goto LABEL_46;
  }
  id v59 = v58;
  CGRect v82 = v54;
  id v84 = v53;
  objc_msgSend(v58, sel_addSubview_, v55);

  __swift_instantiateConcreteTypeFromMangledName(&qword_268C35610);
  uint64_t v60 = swift_allocObject();
  *(_OWORD *)(v60 + 16) = xmmword_23F124FB0;
  id v61 = objc_msgSend(v55, sel_leadingAnchor);
  id v62 = objc_msgSend(v80, sel_view);
  if (!v62)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  uint64_t v63 = v62;
  id v64 = objc_msgSend(v62, sel_leadingAnchor);

  id v65 = objc_msgSend(v61, sel_constraintEqualToAnchor_, v64);
  *(void *)(v60 + 32) = v65;
  id v66 = objc_msgSend(v55, sel_trailingAnchor);
  id v67 = objc_msgSend(v80, sel_view);
  if (!v67)
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  unint64_t v68 = v67;
  id v69 = objc_msgSend(v67, sel_trailingAnchor);

  id v70 = objc_msgSend(v66, sel_constraintEqualToAnchor_, v69);
  *(void *)(v60 + 40) = v70;
  id v71 = objc_msgSend(v55, sel_bottomAnchor);
  id v72 = objc_msgSend(v80, sel_view);
  if (!v72)
  {
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  CGRect v73 = v72;
  CGRect v74 = self;
  id v75 = objc_msgSend(v73, sel_bottomAnchor);

  id v76 = objc_msgSend(v71, sel_constraintEqualToAnchor_, v75);
  *(void *)(v60 + 4_Block_object_dispose(&a9, 8) = v76;
  sub_23F120E70();
  sub_23F11656C(0, (unint64_t *)&qword_268C35750);
  id v86 = (id)sub_23F120E40();
  swift_bridgeObjectRelease();
  objc_msgSend(v74, sel_activateConstraints_, v86);
}

id sub_23F118EA4(void *a1)
{
  id result = objc_msgSend(a1, sel_value);
  id v4 = *(void **)(v1 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_confidenceLabel);
  if (!v4) {
    goto LABEL_24;
  }
  int v5 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C35370);
  uint64_t v6 = swift_allocObject();
  uint64_t v7 = MEMORY[0x263F8D5C8];
  *(_OWORD *)(v6 + 16) = xmmword_23F124900;
  uint64_t v8 = MEMORY[0x263F8D648];
  *(void *)(v6 + 56) = v7;
  *(void *)(v6 + 64) = v8;
  *(_DWORD *)(v6 + 32) = v5;
  id v9 = v4;
  sub_23F120DE0();
  CGFloat v10 = (void *)sub_23F120D90();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_setText_, v10);

  id result = *(id *)(v1 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_imageView);
  if (result)
  {
    id v11 = objc_msgSend(result, sel_subviews);
    sub_23F11656C(0, (unint64_t *)&unk_268C35740);
    unint64_t v12 = sub_23F120E60();

    if (v12 >> 62)
    {
      swift_bridgeObjectRetain();
      id result = (id)sub_23F121070();
      uint64_t v13 = (uint64_t)result;
      if (!result) {
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
      id result = (id)swift_bridgeObjectRetain();
      if (!v13) {
        goto LABEL_12;
      }
    }
    if (v13 < 1)
    {
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    for (uint64_t i = 0; i != v13; ++i)
    {
      if ((v12 & 0xC000000000000001) != 0) {
        id v15 = (id)MEMORY[0x2455C4A50](i, v12);
      }
      else {
        id v15 = *(id *)(v12 + 8 * i + 32);
      }
      double v16 = v15;
      objc_msgSend(v15, sel_removeFromSuperview);
    }
LABEL_12:
    swift_bridgeObjectRelease_n();
    unint64_t v17 = *(void *)(v1 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_debugInfo);
    if (v17 >> 62)
    {
      swift_bridgeObjectRetain_n();
      id result = (id)sub_23F121070();
      uint64_t v18 = (uint64_t)result;
      if (result)
      {
LABEL_14:
        if (v18 >= 1)
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if ((v17 & 0xC000000000000001) != 0) {
              id v20 = (id)MEMORY[0x2455C4A50](j, v17);
            }
            else {
              id v20 = *(id *)(v17 + 8 * j + 32);
            }
            double v21 = v20;
            sub_23F117B60((uint64_t)v20);
          }
          return (id)swift_bridgeObjectRelease_n();
        }
        goto LABEL_23;
      }
    }
    else
    {
      uint64_t v18 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
      id result = (id)swift_bridgeObjectRetain_n();
      if (v18) {
        goto LABEL_14;
      }
    }
    return (id)swift_bridgeObjectRelease_n();
  }
LABEL_25:
  __break(1u);
  return result;
}

id AudiogramDebugViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_23F120D90();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void AudiogramDebugViewController.init(nibName:bundle:)()
{
}

id AudiogramDebugViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AudiogramDebugViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void __swiftcall AudiogramDebugViewController.viewForZooming(in:)(UIView_optional *__return_ptr retstr, UIScrollView *in)
{
  id v3 = *(id *)(v2 + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramDebugViewController_imageView);
}

uint64_t method lookup function for AudiogramDebugViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AudiogramDebugViewController);
}

uint64_t dispatch thunk of AudiogramDebugViewController.__allocating_init(image:debugInfo:)()
{
  return (*(uint64_t (**)(void))(v0 + 224))();
}

id sub_23F1193AC(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x7465726163 && a2 == 0xE500000000000000 || (sub_23F121160() & 1) != 0)
  {
    id v4 = &selRef_systemBrownColor;
  }
  else if (a1 == 0x625F6465736F6C63 && a2 == 0xEE0074656B636172 || (sub_23F121160() & 1) != 0)
  {
    id v4 = &selRef_systemIndigoColor;
  }
  else if (a1 == 0x635F6465736F6C63 && a2 == 0xEB000000006C6965 || (sub_23F121160() & 1) != 0)
  {
    id v4 = &selRef_systemOrangeColor;
  }
  else if (a1 == 0x635F6465736F6C63 && a2 == 0xEE006E6F72766568 || (sub_23F121160() & 1) != 0)
  {
    id v4 = &selRef_systemGreenColor;
  }
  else if (a1 == 111 && a2 == 0xE100000000000000 || (sub_23F121160() & 1) != 0)
  {
    id v4 = &selRef_systemRedColor;
  }
  else if (a1 == 0x6172625F6E65706FLL && a2 == 0xEC00000074656B63 || (sub_23F121160() & 1) != 0)
  {
    id v4 = &selRef_systemMintColor;
  }
  else if (a1 == 0x6965635F6E65706FLL && a2 == 0xE90000000000006CLL || (sub_23F121160() & 1) != 0)
  {
    id v4 = &selRef_systemYellowColor;
  }
  else if (a1 == 0x6568635F6E65706FLL && a2 == 0xEC0000006E6F7276 || (sub_23F121160() & 1) != 0)
  {
    id v4 = &selRef_systemTealColor;
  }
  else if (a1 == 0x657261757173 && a2 == 0xE600000000000000 || (sub_23F121160() & 1) != 0)
  {
    id v4 = &selRef_systemCyanColor;
  }
  else if (a1 == 0x656C676E61697274 && a2 == 0xE800000000000000 || (sub_23F121160() & 1) != 0)
  {
    id v4 = &selRef_systemPurpleColor;
  }
  else if (a1 == 118 && a2 == 0xE100000000000000 || (sub_23F121160() & 1) != 0)
  {
    id v4 = &selRef_systemDarkGrayColor;
  }
  else
  {
    id v4 = &selRef_systemBlueColor;
    if ((a1 != 120 || a2 != 0xE100000000000000) && (sub_23F121160() & 1) == 0) {
      id v4 = &selRef_systemLightGrayColor;
    }
  }
  id v5 = [self *v4];
  return v5;
}

id sub_23F11981C()
{
  return sub_23F11987C(&OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController____lazy_storage___leftEarXButton, 11, &selRef_leftEarXButtonTapped_);
}

id sub_23F119834()
{
  return sub_23F11987C(&OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController____lazy_storage___rightEarCircleButton, 4, &selRef_rightEarCircleButtonTapped_);
}

id sub_23F11984C()
{
  return sub_23F11987C(&OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController____lazy_storage___leftEarSquareButton, 8, &selRef_leftEarSquareButtonTapped_);
}

id sub_23F119864()
{
  return sub_23F11987C(&OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController____lazy_storage___rightEarTriangleButton, 9, &selRef_rightEarTriangleButtonTapped_);
}

id sub_23F11987C(uint64_t *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *a1;
  id v5 = *(void **)(v3 + *a1);
  if (v5)
  {
    id v6 = *(id *)(v3 + *a1);
  }
  else
  {
    uint64_t v9 = v3;
    CGFloat v10 = (unint64_t *)(v3
                             + OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController_selectedSymbols);
    swift_beginAccess();
    unint64_t v11 = *v10;
    objc_allocWithZone((Class)type metadata accessor for AIAudiogramSymbolChoiceButton());
    swift_bridgeObjectRetain();
    id v12 = sub_23F116610(a2, v11);
    id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82CB0]), sel_initWithTarget_action_, v9, *a3);
    objc_msgSend(v12, sel_addGestureRecognizer_, v13);

    id v14 = *(void **)(v9 + v4);
    *(void *)(v9 + v4) = v12;
    id v6 = v12;

    id v5 = 0;
  }
  id v15 = v5;
  return v6;
}

char *AIAudiogramSymbolsSelectionViewController.__allocating_init(title:delegate:selectedSymbols:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v9 = objc_allocWithZone(v4);
  return AIAudiogramSymbolsSelectionViewController.init(title:delegate:selectedSymbols:)(a1, a2, a3, a4);
}

char *AIAudiogramSymbolsSelectionViewController.init(title:delegate:selectedSymbols:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_unknownObjectWeakInit();
  *(void *)&v4[OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController_selectedSymbols] = MEMORY[0x263F8EE78];
  *(void *)&v4[OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController_spacingBetweenButtons] = 0x4024000000000000;
  *(void *)&v4[OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController_percentageOfStackViewSize] = 0x3FE4CCCCCCCCCCCDLL;
  uint64_t v6 = OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController_continueButton;
  id v7 = self;
  uint64_t v8 = v4;
  *(void *)&v4[v6] = objc_msgSend(v7, sel_boldButton);
  uint64_t v9 = OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController_firstRowButtons;
  *(void *)&v8[v9] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82BF8]), sel_init);
  uint64_t v10 = OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController_secondRowButtons;
  *(void *)&v8[v10] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82BF8]), sel_init);
  unint64_t v11 = &v8[OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController_learnMoreURL];
  *(void *)unint64_t v11 = 0xD00000000000004ALL;
  *((void *)v11 + 1) = 0x800000023F1292A0;
  *(void *)&v8[OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController____lazy_storage___leftEarXButton] = 0;
  *(void *)&v8[OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController____lazy_storage___rightEarCircleButton] = 0;
  *(void *)&v8[OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController____lazy_storage___leftEarSquareButton] = 0;
  *(void *)&v8[OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController____lazy_storage___rightEarTriangleButton] = 0;

  id v12 = (void *)sub_23F120D90();
  swift_bridgeObjectRelease();
  v32.receiver = v8;
  v32.super_class = (Class)type metadata accessor for AIAudiogramSymbolsSelectionViewController();
  id v13 = (char *)objc_msgSendSuper2(&v32, sel_initWithTitle_detailText_icon_contentLayout_, v12, 0, 0, 2);

  swift_unknownObjectWeakAssign();
  id v14 = &v13[OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController_selectedSymbols];
  swift_beginAccess();
  *(void *)id v14 = a4;
  id v15 = v13;
  swift_bridgeObjectRelease();
  id v16 = objc_msgSend(v7, sel_boldButton);
  uint64_t v17 = OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController_continueButton;
  uint64_t v18 = *(void **)&v15[OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController_continueButton];
  *(void *)&v15[OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController_continueButton] = v16;

  id v19 = *(id *)&v15[v17];
  id v20 = (void *)sub_23F120D90();
  id v21 = aiLocString(v20);

  if (!v21)
  {
    sub_23F120DC0();
    id v21 = (id)sub_23F120D90();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v19, sel_setTitle_forState_, v21, 0);

  objc_msgSend(*(id *)&v15[v17], sel_addTarget_action_forControlEvents_, v15, sel_selectFrequencies_, 64);
  id v22 = objc_msgSend(v15, sel_buttonTray);
  objc_msgSend(v22, sel_addButton_, *(void *)&v15[v17]);

  double v23 = *(void **)&v15[v17];
  unint64_t v24 = *(void *)v14;
  if (v24 >> 62)
  {
    id v31 = v23;
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_23F121070();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v25 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id v26 = v23;
  }
  objc_msgSend(v23, sel_setEnabled_, v25 > 0);

  id v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F824A8]), sel_initWithBarButtonSystemItem_target_action_, 1, v15, sel_cancelTapped_);
  id v28 = objc_msgSend(v15, sel_navigationItem);
  id v29 = v27;
  objc_msgSend(v28, sel_setRightBarButtonItem_, v29);

  swift_unknownObjectRelease();
  return v15;
}

uint64_t type metadata accessor for AIAudiogramSymbolsSelectionViewController()
{
  return self;
}

void sub_23F119FA8()
{
  uint64_t v1 = v0;
  v71.receiver = v0;
  v71.super_class = (Class)type metadata accessor for AIAudiogramSymbolsSelectionViewController();
  objc_msgSendSuper2(&v71, sel_viewDidLoad);
  id v2 = objc_msgSend(v0, sel_headerView);
  LODWORD(v3) = 1036831949;
  objc_msgSend(v2, sel_setTitleHyphenationFactor_, v3);

  id v4 = objc_msgSend(self, sel_defaultCenter);
  objc_msgSend(v4, sel_addObserver_selector_name_object_, v1, sel_contentSizeCategoryDidChange_, *MEMORY[0x263F83428], 0);

  uint64_t v5 = OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController_firstRowButtons;
  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController_firstRowButtons], sel_setAxis_, 0);
  objc_msgSend(*(id *)&v1[v5], sel_setDistribution_, 1);
  objc_msgSend(*(id *)&v1[v5], sel_setAlignment_, 0);
  double v6 = *(double *)&v1[OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController_spacingBetweenButtons];
  objc_msgSend(*(id *)&v1[v5], sel_setSpacing_, v6);
  id v7 = *(id *)&v1[v5];
  id v8 = sub_23F11981C();
  objc_msgSend(v7, sel_addArrangedSubview_, v8);

  id v9 = *(id *)&v1[v5];
  id v10 = sub_23F119834();
  objc_msgSend(v9, sel_addArrangedSubview_, v10);

  uint64_t v11 = OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController_secondRowButtons;
  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController_secondRowButtons], sel_setAxis_, 0);
  objc_msgSend(*(id *)&v1[v11], sel_setDistribution_, 1);
  objc_msgSend(*(id *)&v1[v11], sel_setAlignment_, 0);
  objc_msgSend(*(id *)&v1[v11], sel_setSpacing_, v6);
  id v12 = *(id *)&v1[v11];
  id v13 = sub_23F11984C();
  objc_msgSend(v12, sel_addArrangedSubview_, v13);

  id v14 = *(id *)&v1[v11];
  id v15 = sub_23F119864();
  objc_msgSend(v14, sel_addArrangedSubview_, v15);

  id v16 = (void *)sub_23F120D90();
  id v17 = aiYodelLocString(v16);

  sub_23F120DC0();
  sub_23F120E00();
  uint64_t v18 = (void *)sub_23F120D90();
  id v19 = aiYodelLocString(v18);

  sub_23F120DC0();
  sub_23F120E00();
  swift_bridgeObjectRelease();
  id v20 = objc_allocWithZone(MEMORY[0x263F089B8]);
  id v21 = (void *)sub_23F120D90();
  id v22 = objc_msgSend(v20, sel_initWithString_, v21);

  double v23 = (void *)sub_23F120D90();
  swift_bridgeObjectRelease();
  unint64_t v24 = (void *)sub_23F120D90();
  id v25 = aiYodelLocString(v24);

  if (!v25)
  {
    sub_23F120DC0();
    id v25 = (id)sub_23F120D90();
    swift_bridgeObjectRelease();
  }
  id v26 = objc_msgSend(v23, sel_rangeOfString_, v25);
  uint64_t v28 = v27;

  uint64_t v29 = *MEMORY[0x263F82298];
  id v30 = (void *)sub_23F120D90();
  objc_msgSend(v22, sel_addAttribute_value_range_, v29, v30, v26, v28);

  id v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82D60]), sel_init);
  objc_msgSend(v31, sel_setScrollEnabled_, 0);
  objc_msgSend(v31, sel_setEditable_, 0);
  objc_msgSend(v31, sel_setSelectable_, 1);
  id v70 = v22;
  objc_msgSend(v31, sel_setAttributedText_, v22);
  id v32 = objc_msgSend(self, sel_preferredFontForTextStyle_, *MEMORY[0x263F835B8]);
  objc_msgSend(v31, sel_setFont_, v32);

  id v33 = self;
  id v34 = v31;
  id v35 = objc_msgSend(v33, sel_clearColor);
  objc_msgSend(v34, sel_setBackgroundColor_, v35);

  id v36 = objc_msgSend(v33, sel_secondaryLabelColor);
  objc_msgSend(v34, sel_setTextColor_, v36);

  objc_msgSend(v34, sel_setAdjustsFontForContentSizeCategory_, 1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C35610);
  uint64_t v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_23F124FB0;
  id v38 = *(void **)&v1[v5];
  uint64_t v39 = *(void **)&v1[v11];
  *(void *)(v37 + 32) = v38;
  *(void *)(v37 + 40) = v39;
  *(void *)(v37 + 4_Block_object_dispose(&a9, 8) = v34;
  sub_23F120E70();
  id v40 = objc_allocWithZone(MEMORY[0x263F82BF8]);
  sub_23F11656C(0, (unint64_t *)&unk_268C35740);
  id v69 = v34;
  id v41 = v38;
  id v42 = v39;
  id v43 = (void *)sub_23F120E40();
  swift_bridgeObjectRelease();
  id v44 = objc_msgSend(v40, sel_initWithArrangedSubviews_, v43);

  objc_msgSend(v44, sel_setAxis_, 1);
  objc_msgSend(v44, sel_setDistribution_, 0);
  objc_msgSend(v44, sel_setAlignment_, 0);
  objc_msgSend(v44, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v44, sel_setSpacing_, v6);
  objc_msgSend(v44, sel_setCustomSpacing_afterView_, *(void *)&v1[v11], v6 * 3.0);
  id v45 = objc_msgSend(v1, sel_contentView);
  objc_msgSend(v45, sel_addSubview_, v44);

  uint64_t v46 = swift_allocObject();
  *(_OWORD *)(v46 + 16) = xmmword_23F125010;
  id v47 = objc_msgSend(v44, sel_topAnchor);
  id v48 = objc_msgSend(v1, sel_contentView);
  id v49 = objc_msgSend(v48, sel_topAnchor);

  id v50 = objc_msgSend(v47, sel_constraintEqualToAnchor_constant_, v49, 20.0);
  *(void *)(v46 + 32) = v50;
  id v51 = objc_msgSend(v44, sel_bottomAnchor);
  id v52 = objc_msgSend(v1, sel_contentView);
  id v53 = objc_msgSend(v52, sel_bottomAnchor);

  id v54 = objc_msgSend(v51, sel_constraintEqualToAnchor_, v53);
  *(void *)(v46 + 40) = v54;
  id v55 = objc_msgSend(v44, sel_centerXAnchor);
  id v56 = objc_msgSend(v1, sel_contentView);
  id v57 = objc_msgSend(v56, sel_centerXAnchor);

  id v58 = objc_msgSend(v55, sel_constraintEqualToAnchor_, v57);
  *(void *)(v46 + 4_Block_object_dispose(&a9, 8) = v58;
  id v59 = objc_msgSend(v44, sel_widthAnchor);
  id v60 = objc_msgSend(v1, sel_view);
  if (v60)
  {
    id v61 = v60;
    id v62 = self;
    id v63 = objc_msgSend(v61, sel_widthAnchor);

    id v64 = objc_msgSend(v59, sel_constraintEqualToAnchor_multiplier_, v63, 0.65);
    *(void *)(v46 + 56) = v64;
    sub_23F120E70();
    sub_23F11656C(0, (unint64_t *)&qword_268C35750);
    id v65 = (void *)sub_23F120E40();
    swift_bridgeObjectRelease();
    objc_msgSend(v62, sel_activateConstraints_, v65);

    id v66 = objc_msgSend(v1, sel_view);
    if (v66)
    {
      id v67 = v66;
      id v68 = objc_msgSend(v33, sel_secondarySystemBackgroundColor);
      objc_msgSend(v67, sel_setBackgroundColor_, v68);

      sub_23F11AAAC();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_23F11AAAC()
{
  uint64_t v1 = (char *)sub_23F11981C();
  uint64_t v2 = OBJC_IVAR____TtC18AudiogramIngestion29AIAudiogramSymbolChoiceButton_labelForSymbol;
  id v3 = objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC18AudiogramIngestion29AIAudiogramSymbolChoiceButton_labelForSymbol], sel_text);
  if (v3)
  {
    id v4 = v3;
    id v5 = objc_msgSend(*(id *)&v1[v2], sel_font);
    if (v5)
    {
      double v6 = v5;
      objc_msgSend(v1, sel_frame);
      double v8 = v7;
      double v10 = v9;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268C357C0);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_23F124900;
      id v12 = (void *)*MEMORY[0x263F82270];
      *(void *)(inited + 32) = *MEMORY[0x263F82270];
      *(void *)(inited + 64) = sub_23F11656C(0, &qword_268C357C8);
      *(void *)(inited + 40) = v6;
      id v13 = v12;
      id v14 = v6;
      sub_23F114230(inited);
      type metadata accessor for Key(0);
      sub_23F11B968();
      id v15 = (void *)sub_23F120D70();
      swift_bridgeObjectRelease();
      objc_msgSend(v4, sel_boundingRectWithSize_options_attributes_context_, 32, v15, 0, v8, v10);
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;

      v105.origin.CGFloat x = v17;
      v105.origin.CGFloat y = v19;
      v105.size.CGFloat width = v21;
      v105.size.CGFloat height = v23;
      double Width = CGRectGetWidth(v105);

      goto LABEL_7;
    }
  }
  else
  {
  }
  double Width = 0.0;
LABEL_7:
  id v25 = (char *)sub_23F119834();
  uint64_t v26 = OBJC_IVAR____TtC18AudiogramIngestion29AIAudiogramSymbolChoiceButton_labelForSymbol;
  uint64_t v27 = (char *)objc_msgSend(*(id *)&v25[OBJC_IVAR____TtC18AudiogramIngestion29AIAudiogramSymbolChoiceButton_labelForSymbol], sel_text);
  double v28 = 0.0;
  if (v27)
  {
    uint64_t v29 = v27;
    id v30 = objc_msgSend(*(id *)&v25[v26], sel_font);
    if (v30)
    {
      id v31 = v30;
      objc_msgSend(v25, sel_frame);
      double v33 = v32;
      double v35 = v34;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268C357C0);
      uint64_t v36 = swift_initStackObject();
      *(_OWORD *)(v36 + 16) = xmmword_23F124900;
      uint64_t v37 = (void *)*MEMORY[0x263F82270];
      *(void *)(v36 + 32) = *MEMORY[0x263F82270];
      *(void *)(v36 + 64) = sub_23F11656C(0, &qword_268C357C8);
      *(void *)(v36 + 40) = v31;
      id v38 = v37;
      uint64_t v39 = v31;
      sub_23F114230(v36);
      type metadata accessor for Key(0);
      sub_23F11B968();
      id v40 = (void *)sub_23F120D70();
      swift_bridgeObjectRelease();
      objc_msgSend(v29, sel_boundingRectWithSize_options_attributes_context_, 32, v40, 0, v33, v35);
      CGFloat v42 = v41;
      CGFloat v44 = v43;
      CGFloat v46 = v45;
      CGFloat v48 = v47;

      v106.origin.CGFloat x = v42;
      v106.origin.CGFloat y = v44;
      v106.size.CGFloat width = v46;
      v106.size.CGFloat height = v48;
      double v49 = CGRectGetWidth(v106);
      uint64_t v29 = v39;
    }
    else
    {
      double v49 = 0.0;
    }

    id v25 = v29;
  }
  else
  {
    double v49 = 0.0;
  }

  id v50 = (char *)sub_23F11984C();
  uint64_t v51 = OBJC_IVAR____TtC18AudiogramIngestion29AIAudiogramSymbolChoiceButton_labelForSymbol;
  id v52 = (char *)objc_msgSend(*(id *)&v50[OBJC_IVAR____TtC18AudiogramIngestion29AIAudiogramSymbolChoiceButton_labelForSymbol], sel_text);
  if (v52)
  {
    id v53 = v52;
    id v54 = objc_msgSend(*(id *)&v50[v51], sel_font);
    if (v54)
    {
      id v55 = v54;
      objc_msgSend(v50, sel_frame);
      double v57 = v56;
      double v59 = v58;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268C357C0);
      uint64_t v60 = swift_initStackObject();
      *(_OWORD *)(v60 + 16) = xmmword_23F124900;
      id v61 = (void *)*MEMORY[0x263F82270];
      *(void *)(v60 + 32) = *MEMORY[0x263F82270];
      *(void *)(v60 + 64) = sub_23F11656C(0, &qword_268C357C8);
      *(void *)(v60 + 40) = v55;
      id v62 = v61;
      id v63 = v55;
      sub_23F114230(v60);
      type metadata accessor for Key(0);
      sub_23F11B968();
      id v64 = (void *)sub_23F120D70();
      swift_bridgeObjectRelease();
      objc_msgSend(v53, sel_boundingRectWithSize_options_attributes_context_, 32, v64, 0, v57, v59);
      CGFloat v66 = v65;
      CGFloat v68 = v67;
      CGFloat v70 = v69;
      CGFloat v72 = v71;

      v107.origin.CGFloat x = v66;
      v107.origin.CGFloat y = v68;
      v107.size.CGFloat width = v70;
      v107.size.CGFloat height = v72;
      double v28 = CGRectGetWidth(v107);
      id v53 = v63;
    }

    id v50 = v53;
  }

  CGRect v73 = (char *)sub_23F119864();
  uint64_t v74 = OBJC_IVAR____TtC18AudiogramIngestion29AIAudiogramSymbolChoiceButton_labelForSymbol;
  id v75 = objc_msgSend(*(id *)&v73[OBJC_IVAR____TtC18AudiogramIngestion29AIAudiogramSymbolChoiceButton_labelForSymbol], sel_text);
  if (!v75)
  {
    id v76 = v73;
    goto LABEL_28;
  }
  id v76 = v75;
  id v77 = objc_msgSend(*(id *)&v73[v74], sel_font);
  if (!v77)
  {

LABEL_28:
    if (Width <= v49)
    {
      if (v49 > v28)
      {
        if (v49 > 0.0) {
          double v96 = v49;
        }
        else {
          double v96 = 0.0;
        }
        goto LABEL_40;
      }
    }
    else if (Width > v28)
    {
      if (Width > 0.0) {
        double v96 = Width;
      }
      else {
        double v96 = 0.0;
      }
      goto LABEL_40;
    }
    if (v28 > 0.0) {
      double v96 = v28;
    }
    else {
      double v96 = 0.0;
    }
    goto LABEL_40;
  }
  CGRect v78 = v77;
  objc_msgSend(v73, sel_frame);
  double v80 = v79;
  double v82 = v81;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C357C0);
  uint64_t v83 = swift_initStackObject();
  *(_OWORD *)(v83 + 16) = xmmword_23F124900;
  id v84 = (void *)*MEMORY[0x263F82270];
  *(void *)(v83 + 32) = *MEMORY[0x263F82270];
  *(void *)(v83 + 64) = sub_23F11656C(0, &qword_268C357C8);
  *(void *)(v83 + 40) = v78;
  id v85 = v84;
  id v86 = v78;
  sub_23F114230(v83);
  type metadata accessor for Key(0);
  sub_23F11B968();
  os_log_type_t v87 = (void *)sub_23F120D70();
  swift_bridgeObjectRelease();
  objc_msgSend(v76, sel_boundingRectWithSize_options_attributes_context_, 32, v87, 0, v80, v82);
  CGFloat v89 = v88;
  CGFloat v91 = v90;
  CGFloat v93 = v92;
  CGFloat v95 = v94;

  v108.origin.CGFloat x = v89;
  v108.origin.CGFloat y = v91;
  v108.size.CGFloat width = v93;
  v108.size.CGFloat height = v95;
  double v96 = CGRectGetWidth(v108);

  if (Width > v49) {
    double v97 = Width;
  }
  else {
    double v97 = v49;
  }
  if (v97 <= v28) {
    double v97 = v28;
  }
  if (v97 > v96) {
    double v96 = v97;
  }
LABEL_40:
  id v98 = objc_msgSend(v0, sel_view);
  if (v98)
  {
    v99 = v98;
    objc_msgSend(v98, sel_frame);
    double v101 = v100;

    BOOL v102 = (v101 * 0.65
          - *(double *)&v0[OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController_spacingBetweenButtons])
         * 0.5
         * 0.7 < v96;
    objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController_firstRowButtons], sel_setAxis_, v102);
    objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController_secondRowButtons], sel_setAxis_, v102);
    id v103 = objc_msgSend(v0, sel_view);
    if (v103)
    {
      v104 = v103;
      objc_msgSend(v103, sel_layoutIfNeeded);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

id AIAudiogramSymbolsSelectionViewController.__allocating_init(title:detailText:symbolName:contentLayout:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  double v8 = v7;
  id v12 = (void *)sub_23F120D90();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    id v13 = 0;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    id v14 = 0;
    goto LABEL_6;
  }
  id v13 = (void *)sub_23F120D90();
  swift_bridgeObjectRelease();
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  id v14 = (void *)sub_23F120D90();
  swift_bridgeObjectRelease();
LABEL_6:
  id v15 = objc_msgSend(objc_allocWithZone(v8), sel_initWithTitle_detailText_symbolName_contentLayout_, v12, v13, v14, a7);

  return v15;
}

void AIAudiogramSymbolsSelectionViewController.init(title:detailText:symbolName:contentLayout:)()
{
}

id AIAudiogramSymbolsSelectionViewController.__allocating_init(title:detailText:icon:contentLayout:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  double v7 = v6;
  uint64_t v11 = (void *)sub_23F120D90();
  swift_bridgeObjectRelease();
  if (a4)
  {
    id v12 = (void *)sub_23F120D90();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v12 = 0;
  }
  id v13 = objc_msgSend(objc_allocWithZone(v7), sel_initWithTitle_detailText_icon_contentLayout_, v11, v12, a5, a6);

  return v13;
}

void AIAudiogramSymbolsSelectionViewController.init(title:detailText:icon:contentLayout:)()
{
}

id AIAudiogramSymbolsSelectionViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AIAudiogramSymbolsSelectionViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for AIAudiogramSymbolsSelectionViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AIAudiogramSymbolsSelectionViewController);
}

uint64_t dispatch thunk of AIAudiogramSymbolsSelectionViewController.__allocating_init(title:delegate:selectedSymbols:)()
{
  return (*(uint64_t (**)(void))(v0 + 392))();
}

void sub_23F11B640(char *a1)
{
  uint64_t v2 = v1;
  objc_msgSend(a1, sel_setSelected_, objc_msgSend(a1, sel_isSelected) ^ 1);
  id v4 = objc_msgSend(a1, sel_layer);
  unsigned int v5 = objc_msgSend(a1, sel_isSelected);
  double v6 = self;
  double v7 = &selRef_blueColor;
  if (!v5) {
    double v7 = &selRef_lightGrayColor;
  }
  id v8 = [v6 *v7];
  id v9 = objc_msgSend(v8, sel_CGColor);

  objc_msgSend(v4, sel_setBorderColor_, v9);
  id v10 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, *(void *)&a1[OBJC_IVAR____TtC18AudiogramIngestion29AIAudiogramSymbolChoiceButton_symbol]);
  unsigned int v11 = objc_msgSend(a1, sel_isSelected);
  id v12 = (unint64_t *)(v2
                           + OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController_selectedSymbols);
  if (v11)
  {
    swift_beginAccess();
    id v13 = v10;
    MEMORY[0x2455C48C0]();
    if (*(void *)((*v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_23F120E80();
    }
    sub_23F120EA0();
    sub_23F120E70();
    swift_endAccess();
  }
  else
  {
    swift_beginAccess();
    unint64_t v14 = *v12;
    swift_bridgeObjectRetain();
    sub_23F10D4B0((uint64_t)v10, v14);
    unint64_t v16 = v15;
    char v18 = v17;
    swift_bridgeObjectRelease();
    if ((v18 & 1) == 0)
    {
      swift_beginAccess();
      CGFloat v19 = (void *)sub_23F10D79C(v16);
      swift_endAccess();
    }
  }
  sub_23F116AE8();
  double v20 = *(void **)(v2 + OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController_continueButton);
  CGFloat v21 = (void *)(v2 + OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController_selectedSymbols);
  swift_beginAccess();
  if (*v21 >> 62)
  {
    id v27 = v20;
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_23F121070();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v22 = *(void *)((*v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id v23 = v20;
  }
  objc_msgSend(v20, sel_setEnabled_, v22 > 0);

  uint64_t v24 = MEMORY[0x2455C57F0](v2 + OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController_delegate);
  if (v24)
  {
    id v25 = (void *)v24;
    sub_23F11656C(0, (unint64_t *)&qword_268C353C0);
    swift_bridgeObjectRetain();
    uint64_t v26 = (void *)sub_23F120E40();
    swift_bridgeObjectRelease();
    objc_msgSend(v25, sel_updateSelectedSymbolsWithSelectedSymbols_, v26);

    swift_unknownObjectRelease();
  }
}

unint64_t sub_23F11B968()
{
  unint64_t result = qword_268C35350;
  if (!qword_268C35350)
  {
    type metadata accessor for Key(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C35350);
  }
  return result;
}

unint64_t sub_23F11B9C0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    float v2 = *(float *)(a1 + 32);
    uint64_t v3 = v1 - 1;
    if (v1 != 1)
    {
      id v4 = (float *)(a1 + 36);
      do
      {
        float v5 = *v4++;
        float v6 = v5;
        if (v2 < v5) {
          float v2 = v6;
        }
        --v3;
      }
      while (v3);
    }
    uint64_t v7 = LODWORD(v2);
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7 | ((unint64_t)(v1 == 0) << 32);
}

uint64_t sub_23F11BA18(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = a4[2];
  if (!v4) {
    return 0;
  }
  if (a4[4] == a2 && a4[5] == a3) {
    return a1;
  }
  uint64_t result = sub_23F121160();
  if (result) {
    return a1;
  }
  if (v4 == 1) {
    return 0;
  }
  unsigned int v11 = a4 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v13 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v14 = *(v11 - 1) == a2 && *v11 == a3;
    if (v14 || (sub_23F121160() & 1) != 0) {
      return a1;
    }
    uint64_t result = 0;
    v11 += 2;
    if (v13 == v4) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_23F11BAF8()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for AudiogramIngestionInferenceRunner()
{
  return self;
}

uint64_t sub_23F11BB94()
{
  uint64_t v1 = v0;
  sub_23F120F90();
  sub_23F120E00();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C35370);
  uint64_t v2 = swift_allocObject();
  int v3 = *(_DWORD *)(v0 + OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_confidence);
  uint64_t v4 = MEMORY[0x263F8D5C8];
  *(_OWORD *)(v2 + 16) = xmmword_23F124900;
  uint64_t v5 = MEMORY[0x263F8D648];
  *(void *)(v2 + 56) = v4;
  *(void *)(v2 + 64) = v5;
  *(_DWORD *)(v2 + 32) = v3;
  sub_23F120DD0();
  swift_bridgeObjectRelease();
  sub_23F120E00();
  swift_bridgeObjectRelease();
  sub_23F120E00();
  swift_bridgeObjectRetain();
  sub_23F120E00();
  swift_bridgeObjectRelease();
  sub_23F120E00();
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_23F124910;
  uint64_t v7 = v1 + OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect;
  CGFloat MidX = CGRectGetMidX(*(CGRect *)(v1 + OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect));
  CGRectGetMidY(*(CGRect *)v7);
  uint64_t v9 = MEMORY[0x263F8EF38];
  *(void *)(v6 + 56) = MEMORY[0x263F8EF38];
  unint64_t v10 = sub_23F11CB14();
  *(void *)(v6 + 64) = v10;
  *(CGFloat *)(v6 + 32) = MidX;
  CGRectGetMidX(*(CGRect *)v7);
  CGFloat MidY = CGRectGetMidY(*(CGRect *)v7);
  *(void *)(v6 + 96) = v9;
  *(void *)(v6 + 104) = v10;
  *(CGFloat *)(v6 + 72) = MidY;
  sub_23F120DD0();
  swift_bridgeObjectRelease();
  sub_23F120E00();
  swift_bridgeObjectRelease();
  sub_23F120E00();
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_23F124910;
  *(void *)(v12 + 56) = v9;
  *(void *)(v12 + 64) = v10;
  uint64_t v13 = *(void *)(v7 + 24);
  *(void *)(v12 + 32) = *(void *)(v7 + 16);
  *(void *)(v12 + 96) = v9;
  *(void *)(v12 + 104) = v10;
  *(void *)(v12 + 72) = v13;
  sub_23F120DD0();
  swift_bridgeObjectRelease();
  sub_23F120E00();
  swift_bridgeObjectRelease();
  sub_23F120E00();
  return 0;
}

uint64_t sub_23F11BEB4(char a1)
{
  return qword_23F125298[a1];
}

uint64_t sub_23F11BED4()
{
  return sub_23F11BEB4(*v0);
}

uint64_t sub_23F11BEDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_23F11F550(a1, a2);
  *a3 = result;
  return result;
}

void sub_23F11BF04(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_23F11BF10(uint64_t a1)
{
  unint64_t v2 = sub_23F11CA78();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_23F11BF4C(uint64_t a1)
{
  unint64_t v2 = sub_23F11CA78();
  return MEMORY[0x270FA00B8](a1, v2);
}

id sub_23F11BF88()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MindNetModelBoundingBox();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23F11C044()
{
  return type metadata accessor for MindNetModelBoundingBox();
}

uint64_t type metadata accessor for MindNetModelBoundingBox()
{
  uint64_t result = qword_268C357D0;
  if (!qword_268C357D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_23F11C098()
{
  uint64_t result = sub_23F120CC0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_23F11C148(void *a1)
{
  uint64_t v2 = sub_23F120CC0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C35800);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23F11CA78();
  uint64_t v10 = v15[0];
  sub_23F1211C0();
  uint64_t v11 = v10 + OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_id;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v11, v2);
  LOBYTE(v16) = 0;
  sub_23F11CACC(&qword_268C35808, MEMORY[0x263F07508]);
  uint64_t v12 = v15[1];
  sub_23F121120();
  if (v12)
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    LOBYTE(v16) = 1;
    sub_23F121110();
    long long v13 = *(_OWORD *)(v10 + OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect + 16);
    long long v16 = *(_OWORD *)(v10 + OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect);
    long long v17 = v13;
    char v18 = 2;
    type metadata accessor for CGRect(0);
    sub_23F11CACC(&qword_268C355A0, type metadata accessor for CGRect);
    sub_23F121120();
    LOBYTE(v16) = 3;
    swift_bridgeObjectRetain();
    sub_23F1210F0();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return swift_bridgeObjectRelease();
  }
}

id sub_23F11C4D0(void *a1)
{
  uint64_t v4 = sub_23F120CC0();
  uint64_t v35 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  double v32 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C357E8);
  uint64_t v31 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = &v1[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_id];
  uint64_t v9 = v1;
  uint64_t v36 = v8;
  sub_23F120CB0();
  uint64_t v10 = OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_confidence;
  *(_DWORD *)&v9[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_confidence] = 0;
  uint64_t v11 = a1[3];
  double v34 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v11);
  sub_23F11CA78();
  uint64_t v12 = v7;
  sub_23F1211B0();
  if (v2)
  {
    uint64_t v13 = v4;
    uint64_t v18 = v35;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v34);
    double v20 = *(void (**)(char *, uint64_t))(v18 + 8);
    id v19 = (id)(v18 + 8);
    v20(v36, v13);

    type metadata accessor for MindNetModelBoundingBox();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v30 = v10;
    uint64_t v14 = v31;
    LOBYTE(v3_Block_object_dispose(&a9, 8) = 0;
    sub_23F11CACC(&qword_268C357F8, MEMORY[0x263F07508]);
    long long v16 = v32;
    uint64_t v15 = v33;
    long long v17 = v12;
    sub_23F1210E0();
    uint64_t v22 = v36;
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v35 + 40))(v22, v16, v4);
    swift_endAccess();
    LOBYTE(v3_Block_object_dispose(&a9, 8) = 1;
    sub_23F1210D0();
    *(_DWORD *)&v9[v30] = v23;
    type metadata accessor for CGRect(0);
    char v40 = 2;
    sub_23F11CACC(&qword_268C355B0, type metadata accessor for CGRect);
    sub_23F1210E0();
    uint64_t v24 = &v9[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect];
    *(_OWORD *)uint64_t v24 = v38;
    *((_OWORD *)v24 + 1) = v39;
    LOBYTE(v3_Block_object_dispose(&a9, 8) = 3;
    uint64_t v25 = sub_23F1210B0();
    uint64_t v26 = (uint64_t *)&v9[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_className];
    *uint64_t v26 = v25;
    v26[1] = v27;

    double v28 = (objc_class *)type metadata accessor for MindNetModelBoundingBox();
    v37.receiver = v9;
    v37.super_class = v28;
    id v19 = objc_msgSendSuper2(&v37, sel_init);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v15);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v34);
  }
  return v19;
}

uint64_t sub_23F11C92C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_id;
  swift_beginAccess();
  uint64_t v4 = sub_23F120CC0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

id sub_23F11C9B4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v5 = objc_allocWithZone((Class)type metadata accessor for MindNetModelBoundingBox());
  id result = sub_23F11C4D0(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_23F11CA0C(void *a1)
{
  return sub_23F11C148(a1);
}

uint64_t sub_23F11CA30()
{
  return sub_23F11CACC(&qword_268C357E0, MEMORY[0x263F07508]);
}

unint64_t sub_23F11CA78()
{
  unint64_t result = qword_268C357F0;
  if (!qword_268C357F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C357F0);
  }
  return result;
}

uint64_t sub_23F11CACC(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23F11CB14()
{
  unint64_t result = qword_268C35810;
  if (!qword_268C35810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C35810);
  }
  return result;
}

void *sub_23F11CB68(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268C35850);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_23F11CF08(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_23F11CC78(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268C35858);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 29;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 2);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
      uint64_t v13 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32]) {
          memmove(v13, a4 + 32, 4 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_23F11D130(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_23F11CD88(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_23F11CDA8(a1, a2, a3, *v3);
  objc_class *v3 = (char *)result;
  return result;
}

uint64_t sub_23F11CDA8(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C35858);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[4 * v8] || v13 >= &v14[4 * v8])
  {
    memcpy(v13, v14, 4 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_23F121090();
  __break(1u);
  return result;
}

char *sub_23F11CF08(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    int64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_23F121090();
  __break(1u);
  return result;
}

void *sub_23F11CFF4(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v4 = 0;
  char v5 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
  size_t v6 = (void *)MEMORY[0x263F8EE78];
  do
  {
    uint64_t v7 = *(v5 - 1);
    uint64_t v8 = *v5;
    swift_bridgeObjectRetain();
    uint64_t v9 = a2(v4, v7, v8);
    char v11 = v10;
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        size_t v6 = sub_23F11CB68(0, v6[2] + 1, 1, v6);
      }
      unint64_t v13 = v6[2];
      unint64_t v12 = v6[3];
      if (v13 >= v12 >> 1) {
        size_t v6 = sub_23F11CB68((void *)(v12 > 1), v13 + 1, 1, v6);
      }
      id v6[2] = v13 + 1;
      v6[v13 + 4] = v9;
    }
    ++v4;
    v5 += 2;
  }
  while (v2 != v4);
  swift_bridgeObjectRelease();
  return v6;
}

char *sub_23F11D130(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + 4 * a1 + 32);
    size_t v6 = 4 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_23F121090();
  __break(1u);
  return result;
}

void sub_23F11D21C(void *a1, uint64_t a2, char **a3, unint64_t a4)
{
  size_t v6 = &selRef_side;
  uint64_t v7 = (uint64_t)objc_msgSend(a1, sel_shape);
  sub_23F11656C(0, (unint64_t *)&qword_268C353C0);
  uint64_t v8 = sub_23F120E60();

  if ((v8 & 0xC000000000000001) != 0)
  {
LABEL_34:
    id v9 = (id)MEMORY[0x2455C4A50](1, v8);
  }
  else
  {
    if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2uLL)
    {
      __break(1u);
      goto LABEL_36;
    }
    id v9 = *(id *)(v8 + 40);
  }
  char v10 = v9;
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_23F120ED0();

  id v11 = [a1 v6[238]];
  uint64_t v7 = sub_23F120E60();

  if ((v7 & 0xC000000000000001) != 0)
  {
LABEL_36:
    id v12 = (id)MEMORY[0x2455C4A50](2, v7);
    goto LABEL_7;
  }
  if (*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) < 3uLL)
  {
    __break(1u);
    goto LABEL_38;
  }
  id v12 = *(id *)(v7 + 48);
LABEL_7:
  unint64_t v13 = v12;
  swift_bridgeObjectRelease();
  uint64_t v14 = sub_23F120ED0();

  if (__OFSUB__(a3, 1))
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  uint64_t v15 = (char *)(v8 - 1);
  if (__OFSUB__(v8, 1))
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  if (__OFADD__(a3, 1))
  {
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if ((uint64_t)((char *)a3 + 1) < (uint64_t)v15) {
    uint64_t v15 = (char *)a3 + 1;
  }
  uint64_t v33 = v15;
  if (__OFSUB__(a4, 1)) {
    goto LABEL_41;
  }
  uint64_t v16 = v14 - 1;
  if (__OFSUB__(v14, 1))
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  if (__OFADD__(a4, 1))
  {
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
    return;
  }
  uint64_t v17 = ((unint64_t)a3 - 1) & ~(((uint64_t)a3 - 1) >> 63);
  if ((uint64_t)(a4 + 1) >= v16) {
    uint64_t v18 = v16;
  }
  else {
    uint64_t v18 = a4 + 1;
  }
  if ((uint64_t)v15 < v17) {
    goto LABEL_44;
  }
  uint64_t v32 = (a4 - 1) & ~((uint64_t)(a4 - 1) >> 63);
  if (v18 < v32) {
    goto LABEL_44;
  }
  uint64_t v30 = a3;
  unint64_t v31 = a4;
  id v19 = (char *)MEMORY[0x263F8EE78];
  size_t v6 = (char **)0x263F08000;
  a3 = &selRef_side;
  for (uint64_t i = (a4 - 1) & ~((uint64_t)(a4 - 1) >> 63); ; uint64_t i = v32)
  {
    while (1)
    {
      sub_23F121010();
      objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, a2);
      sub_23F120FF0();
      sub_23F121020();
      sub_23F121030();
      sub_23F121000();
      objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v17);
      sub_23F120FF0();
      sub_23F121020();
      sub_23F121030();
      sub_23F121000();
      objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, i);
      sub_23F120FF0();
      sub_23F121020();
      sub_23F121030();
      sub_23F121000();
      uint64_t v22 = (void *)sub_23F120E40();
      swift_release();
      id v23 = objc_msgSend(a1, sel_objectForKeyedSubscript_, v22);

      objc_msgSend(v23, sel_floatValue);
      int v25 = v24;

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        id v19 = sub_23F11CC78(0, *((void *)v19 + 2) + 1, 1, v19);
      }
      a4 = *((void *)v19 + 2);
      unint64_t v26 = *((void *)v19 + 3);
      uint64_t v8 = a4 + 1;
      if (a4 >= v26 >> 1) {
        id v19 = sub_23F11CC78((char *)(v26 > 1), a4 + 1, 1, v19);
      }
      *((void *)v19 + 2) = v8;
      *(_DWORD *)&v19[4 * a4 + 32] = v25;
      if (v18 == i) {
        break;
      }
      BOOL v21 = __OFADD__(i++, 1);
      if (v21)
      {
        __break(1u);
LABEL_33:
        __break(1u);
        goto LABEL_34;
      }
    }
    if ((char *)v17 == v33) {
      break;
    }
    BOOL v21 = __OFADD__(v17++, 1);
    if (v21) {
      goto LABEL_33;
    }
  }
  unint64_t v27 = sub_23F11B9C0((uint64_t)v19);
  swift_bridgeObjectRelease();
  if ((v27 & 0x100000000) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C35850);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_23F125070;
    *(void *)(inited + 32) = a2;
    *(void *)(inited + 40) = v30;
    *(void *)(inited + 4_Block_object_dispose(&a9, 8) = v31;
    id v29 = sub_23F10A6F8(inited);
    objc_msgSend(v29, sel_floatValue);

    swift_setDeallocating();
  }
}

void sub_23F11D694(float a1, uint64_t a2, char **a3, uint64_t a4)
{
  uint64_t v187 = sub_23F120CC0();
  unint64_t v7 = *(void *)(v187 - 8);
  MEMORY[0x270FA5388](v187);
  v186 = (char *)&v167 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C35830);
  uint64_t v178 = *(void *)(v9 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  id v12 = (char *)&v167 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  v177 = (char *)&v167 - v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C35818);
  sub_23F11F270(&qword_268C35838, &qword_268C35818);
  sub_23F120EE0();
  sub_23F120EF0();
  if (v201 == (unint64_t *)v203) {
    return;
  }
  uint64_t v14 = *(void *)(sub_23F120D40() + 16);
  uint64_t v15 = swift_bridgeObjectRelease();
  if (v14 != 4) {
    return;
  }
  v197 = a3[2];
  MEMORY[0x270FA5388](v15);
  *(&v167 - 2) = a4;
  uint64_t v16 = swift_bridgeObjectRetain();
  uint64_t v17 = (id *)sub_23F11CFF4(v16, sub_23F11F268);
  uint64_t v167 = 0;
  swift_bridgeObjectRelease();
  uint64_t v18 = v177;
  sub_23F120D50();
  sub_23F11656C(0, &qword_268C35840);
  (*(void (**)(char *, char *, uint64_t))(v178 + 16))(v12, v18, v9);
  sub_23F11F270(&qword_268C35848, &qword_268C35830);
  uint64_t v168 = v9;
  id v19 = (void *)sub_23F120F10();
  double v20 = v19;
  unint64_t v21 = (unint64_t)&selRef_side;
  uint64_t v22 = &selRef_dictionaryWithObjects_forKeys_count_;
  id v192 = v17[2];
  v193 = v17;
  if (!v192) {
    goto LABEL_10;
  }
  id v23 = objc_msgSend(v19, sel_shape);
  uint64_t v195 = sub_23F11656C(0, (unint64_t *)&qword_268C353C0);
  unint64_t v24 = sub_23F120E60();

  if ((v24 & 0xC000000000000001) != 0) {
    goto LABEL_146;
  }
  if (!*(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_148;
  }
  for (id i = *(id *)(v24 + 32); ; id i = (id)MEMORY[0x2455C4A50](0, v24))
  {
    unint64_t v26 = i;
    swift_bridgeObjectRelease();
    unint64_t v24 = (unint64_t)[v26 v22[137]];

    if (__OFADD__(v197, 8))
    {
LABEL_148:
      __break(1u);
      goto LABEL_149;
    }
    if ((char *)v24 == v197 + 8)
    {
      int v190 = 1;
      uint64_t v17 = (id *)MEMORY[0x263F8EE78];
      goto LABEL_16;
    }
LABEL_10:
    id v27 = [v20 *(SEL *)(v21 + 1904)];
    uint64_t v195 = sub_23F11656C(0, (unint64_t *)&qword_268C353C0);
    unint64_t v24 = sub_23F120E60();

    if ((v24 & 0xC000000000000001) != 0) {
      break;
    }
    uint64_t v17 = (id *)MEMORY[0x263F8EE78];
    if (*(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v28 = *(id *)(v24 + 32);
      goto LABEL_13;
    }
    __break(1u);
LABEL_145:
    __break(1u);
LABEL_146:
    ;
  }
  while (2)
  {
    id v28 = (id)MEMORY[0x2455C4A50](0, v24);
    uint64_t v17 = (id *)MEMORY[0x263F8EE78];
LABEL_13:
    swift_bridgeObjectRelease();
    unint64_t v24 = (unint64_t)[v28 v22[137]];

    if (__OFADD__(v197, 4)) {
      goto LABEL_145;
    }
    if ((char *)v24 != v197 + 4)
    {

      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v178 + 8))(v177, v168);
      return;
    }
    int v190 = 0;
LABEL_16:
    id v29 = [v20 *(SEL *)(v21 + 1904)];
    sub_23F11656C(0, (unint64_t *)&qword_268C353C0);
    unint64_t v24 = sub_23F120E60();

    if ((v24 & 0xC000000000000001) == 0)
    {
      if (*(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
      {
        id v30 = *(id *)(v24 + 40);
        goto LABEL_19;
      }
      __break(1u);
LABEL_151:
      id v33 = (id)MEMORY[0x2455C4A50](2, v24);
      goto LABEL_22;
    }
LABEL_149:
    id v30 = (id)MEMORY[0x2455C4A50](1, v24);
LABEL_19:
    unint64_t v31 = v30;
    swift_bridgeObjectRelease();
    uint64_t v169 = sub_23F120ED0();

    id v32 = [v20 *(SEL *)(v21 + 1904)];
    unint64_t v24 = sub_23F120E60();

    if ((v24 & 0xC000000000000001) != 0) {
      goto LABEL_151;
    }
    if (*(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10) < 3uLL)
    {
      __break(1u);
LABEL_153:
      __break(1u);
LABEL_154:
      __break(1u);
      return;
    }
    id v33 = *(id *)(v24 + 48);
LABEL_22:
    double v34 = v33;
    id v196 = v20;
    swift_bridgeObjectRelease();
    uint64_t v189 = sub_23F120ED0();

    unint64_t v203 = (unint64_t)v17;
    if (v169 < 0) {
      goto LABEL_153;
    }
    double v20 = (void *)MEMORY[0x263F8EE78];
    int64_t v35 = (int64_t)v197;
    unint64_t v24 = (unint64_t)v193;
    if (!v169) {
      goto LABEL_132;
    }
    uint64_t v36 = (char **)v189;
    if (v189 < 0) {
      goto LABEL_154;
    }
    objc_super v37 = 0;
    v185 = a3 + 4;
    double v184 = (double)v189;
    v180 = v197 + 2;
    v181 = v197 + 1;
    v179 = v197 + 3;
    v183 = (void (**)(char *, char *, uint64_t))(v7 + 24);
    long long v38 = (char **)v169;
    double v39 = (double)v169;
    v182 = (void (**)(char *, unint64_t))(v7 + 8);
    v176 = v197 + 4;
    v174 = v197 + 5;
    BOOL v40 = __OFADD__(v197, 5);
    BOOL v175 = v40;
    v172 = v197 + 6;
    BOOL v41 = __OFADD__(v197, 6);
    BOOL v173 = v41;
    v170 = v197 + 7;
    BOOL v42 = __OFADD__(v197, 7);
    BOOL v171 = v42;
    a3 = &selRef_dictionaryWithObjects_forKeys_count_;
    long long v191 = xmmword_23F125070;
    while (1)
    {
      v198 = v37;
      if (v37 == v38) {
        goto LABEL_142;
      }
      if (v36) {
        break;
      }
LABEL_35:
      objc_super v37 = (char **)((char *)v198 + 1);
      long long v38 = (char **)v169;
      if ((char **)((char *)v198 + 1) == (char **)v169) {
        goto LABEL_132;
      }
    }
    uint64_t v22 = 0;
    double v43 = (double)(uint64_t)v198;
LABEL_41:
    if (v22 == v36)
    {
      __break(1u);
LABEL_135:
      __break(1u);
LABEL_136:
      __break(1u);
LABEL_137:
      __break(1u);
LABEL_138:
      __break(1u);
LABEL_139:
      __break(1u);
LABEL_140:
      __break(1u);
LABEL_141:
      __break(1u);
LABEL_142:
      __break(1u);
      continue;
    }
    break;
  }
  uint64_t v194 = (uint64_t)v22;
  if ((v190 & 1) == 0)
  {
    if (v35)
    {
      v201 = (unint64_t *)v20;
      sub_23F11CD88(0, v35, 0);
      uint64_t v61 = 0;
      CGFloat v46 = v201;
      do
      {
        v202 = v20;
        sub_23F121010();
        objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v61);
        sub_23F120FF0();
        sub_23F121020();
        sub_23F121030();
        sub_23F121000();
        id v62 = objc_allocWithZone(NSNumber);
        id v63 = v198;
        objc_msgSend(v62, sel_initWithInteger_, v198);
        sub_23F120FF0();
        sub_23F121020();
        sub_23F121030();
        sub_23F121000();
        id v64 = objc_allocWithZone(NSNumber);
        uint64_t v22 = (char **)v194;
        objc_msgSend(v64, sel_initWithInteger_, v194);
        sub_23F120FF0();
        sub_23F121020();
        sub_23F121030();
        sub_23F121000();
        double v65 = (void *)sub_23F120E40();
        swift_release();
        id v66 = v196;
        id v67 = objc_msgSend(v196, sel_objectForKeyedSubscript_, v65);

        objc_msgSend(v67, sel_floatValue);
        float v69 = v68;

        float v70 = 0.0;
        if (v69 >= a1)
        {
          sub_23F11D21C(v66, v61, v63, (unint64_t)v22);
          if (v69 == v71) {
            float v70 = v69;
          }
        }
        v201 = v46;
        unint64_t v73 = v46[2];
        unint64_t v72 = v46[3];
        int64_t v74 = (int64_t)v197;
        if (v73 >= v72 >> 1)
        {
          sub_23F11CD88(v72 > 1, v73 + 1, 1);
          int64_t v74 = (int64_t)v197;
          CGFloat v46 = v201;
        }
        ++v61;
        v46[2] = v73 + 1;
        *((float *)v46 + v73 + _Block_object_dispose(&a9, 8) = v70;
      }
      while (v74 != v61);
      unint64_t v7 = (unint64_t)v20;
      int64_t v35 = (int64_t)v197;
      a3 = &selRef_dictionaryWithObjects_forKeys_count_;
LABEL_73:
      unint64_t v24 = v46[2];
      if (v24)
      {
        unint64_t v75 = 0;
        unint64_t v21 = 0;
        do
        {
          if (v21 >= v24)
          {
            __break(1u);
            goto LABEL_129;
          }
          if (*((float *)v46 + v21 + 8) < *((float *)v46 + v75 + 8)) {
            unint64_t v21 = v75;
          }
          ++v75;
        }
        while (v24 != v75);
        if ((uint64_t)v21 < v35) {
          goto LABEL_82;
        }
      }
      else
      {
        unint64_t v21 = 0;
        if (v35)
        {
LABEL_82:
          if (v21 >= v35) {
            goto LABEL_136;
          }
          CGRect v78 = (uint64_t *)&v185[2 * v21];
          uint64_t v77 = *v78;
          unint64_t v76 = v78[1];
          swift_bridgeObjectRetain();
          goto LABEL_84;
        }
      }
      unint64_t v76 = 0xE700000000000000;
      uint64_t v77 = 0x6E776F6E6B6E75;
LABEL_84:
      if (v21 >= v24) {
        goto LABEL_135;
      }
      float v79 = *((float *)v46 + v21 + 8);
      swift_bridgeObjectRelease();
      if (v79 >= a1)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_268C35850);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = v191;
        double v81 = v198;
        *(void *)(inited + 32) = v197;
        *(void *)(inited + 40) = v81;
        *(void *)(inited + 4_Block_object_dispose(&a9, 8) = v194;
        id v82 = sub_23F10A6F8(inited);
        uint64_t v188 = v77;
        uint64_t v83 = v82;
        [v82 a3[37]];
        float v85 = v84;

        swift_setDeallocating();
        uint64_t v86 = swift_initStackObject();
        *(_OWORD *)(v86 + 16) = v191;
        *(void *)(v86 + 32) = v181;
        *(void *)(v86 + 40) = v81;
        *(void *)(v86 + 4_Block_object_dispose(&a9, 8) = v194;
        id v87 = sub_23F10A6F8(v86);
        [v87 a3[37]];
        float v89 = v88;

        swift_setDeallocating();
        double v90 = ((double)v194 + v89) / v184;
        uint64_t v91 = swift_initStackObject();
        *(_OWORD *)(v91 + 16) = v191;
        *(void *)(v91 + 32) = v180;
        *(void *)(v91 + 40) = v81;
        *(void *)(v91 + 4_Block_object_dispose(&a9, 8) = v194;
        id v92 = sub_23F10A6F8(v91);
        [v92 a3[37]];

        swift_setDeallocating();
        uint64_t v93 = swift_initStackObject();
        *(_OWORD *)(v93 + 16) = v191;
        *(void *)(v93 + 32) = v179;
        *(void *)(v93 + 40) = v81;
        uint64_t v22 = (char **)v194;
        *(void *)(v93 + 4_Block_object_dispose(&a9, 8) = v194;
        id v94 = sub_23F10A6F8(v93);
        [v94 a3[37]];
        float v96 = v95;

        swift_setDeallocating();
        double v97 = sub_23F10B084(v90, (v43 + v85) / v39, v96);
        uint64_t v99 = v98;
        uint64_t v101 = v100;
        uint64_t v103 = v102;
        v104 = v186;
        sub_23F120CB0();
        CGRect v105 = (objc_class *)type metadata accessor for MindNetModelBoundingBox();
        CGRect v106 = (char *)objc_allocWithZone(v105);
        CGRect v107 = &v106[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_id];
        CGRect v108 = v106;
        sub_23F120CB0();
        uint64_t v109 = OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_confidence;
        *(_DWORD *)&v108[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_confidence] = 0;
        swift_beginAccess();
        v110 = v107;
        unint64_t v21 = v187;
        (*v183)(v110, v104, v187);
        swift_endAccess();
        *(float *)&v108[v109] = v79;
        v111 = (double *)&v108[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect];
        double *v111 = v97;
        *((void *)v111 + 1) = v99;
        *((void *)v111 + 2) = v101;
        *((void *)v111 + 3) = v103;
        v112 = (uint64_t *)&v108[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_className];
        uint64_t *v112 = v188;
        v112[1] = v76;

        v199.receiver = v108;
        v199.super_class = v105;
        id v113 = objc_msgSendSuper2(&v199, sel_init);
        (*v182)(v104, v21);
        id v114 = v113;
        MEMORY[0x2455C48C0]();
        if (*(void *)((v203 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v203 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_23F120E80();
        }
        sub_23F120EA0();
        sub_23F120E70();

        double v20 = (void *)MEMORY[0x263F8EE78];
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      unint64_t v24 = (unint64_t)v193;
      if (v190)
      {
        unint64_t v115 = *(void *)(v7 + 16);
        if (v115)
        {
          unint64_t v116 = 0;
          unint64_t v24 = 0;
          unint64_t v21 = v7 + 32;
          while (v24 < v115)
          {
            if (*(float *)(v21 + 4 * v24) < *(float *)(v7 + 4 * v116 + 32)) {
              unint64_t v24 = v116;
            }
            if (v115 == ++v116)
            {
              if ((uint64_t)v24 >= (uint64_t)v197)
              {
                unint64_t v118 = 0xE700000000000000;
                uint64_t v119 = 0x6E776F6E6B6E75;
              }
              else
              {
                if ((v24 & 0x8000000000000000) != 0) {
                  goto LABEL_138;
                }
                v117 = (uint64_t *)&v185[2 * v24];
                uint64_t v119 = *v117;
                unint64_t v118 = v117[1];
                swift_bridgeObjectRetain();
              }
              if (v24 >= v115) {
                goto LABEL_137;
              }
              float v135 = *(float *)(v21 + 4 * v24);
              swift_bridgeObjectRelease();
              if (v135 < a1)
              {
                swift_bridgeObjectRelease();
                unint64_t v24 = (unint64_t)v193;
                goto LABEL_40;
              }
              uint64_t v194 = v119;
              unint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C35850);
              unint64_t v21 = swift_initStackObject();
              *(_OWORD *)(v21 + 16) = v191;
              uint64_t v136 = (uint64_t)v22;
              uint64_t v22 = v198;
              *(void *)(v21 + 32) = v176;
              *(void *)(v21 + 40) = v22;
              *(void *)(v21 + 4_Block_object_dispose(&a9, 8) = v136;
              unint64_t v24 = (unint64_t)v196;
              id v137 = sub_23F10A6F8(v21);
              [v137 a3[37]];
              float v139 = v138;

              swift_setDeallocating();
              uint64_t v140 = swift_initStackObject();
              *(_OWORD *)(v140 + 16) = v191;
              if (!v175)
              {
                *(void *)(v140 + 32) = v174;
                *(void *)(v140 + 40) = v22;
                *(void *)(v140 + 4_Block_object_dispose(&a9, 8) = v136;
                unint64_t v21 = (unint64_t)sub_23F10A6F8(v140);
                [(id)v21 a3[37]];
                float v142 = v141;

                swift_setDeallocating();
                uint64_t v143 = swift_initStackObject();
                *(_OWORD *)(v143 + 16) = v191;
                if (v173) {
                  goto LABEL_140;
                }
                *(void *)(v143 + 32) = v172;
                *(void *)(v143 + 40) = v22;
                *(void *)(v143 + 4_Block_object_dispose(&a9, 8) = v136;
                unint64_t v21 = (unint64_t)sub_23F10A6F8(v143);
                [(id)v21 a3[37]];

                swift_setDeallocating();
                uint64_t v144 = swift_initStackObject();
                *(_OWORD *)(v144 + 16) = v191;
                if (!v171)
                {
                  double v145 = ((double)v136 + v142) / v184;
                  *(void *)(v144 + 32) = v170;
                  *(void *)(v144 + 40) = v22;
                  *(void *)(v144 + 4_Block_object_dispose(&a9, 8) = v136;
                  id v146 = sub_23F10A6F8(v144);
                  [v146 a3[37]];
                  float v148 = v147;

                  swift_setDeallocating();
                  double v149 = sub_23F10B084(v145, (v43 + v139) / v39, v148);
                  uint64_t v151 = v150;
                  uint64_t v153 = v152;
                  uint64_t v155 = v154;
                  v156 = v186;
                  sub_23F120CB0();
                  v157 = (objc_class *)type metadata accessor for MindNetModelBoundingBox();
                  v158 = (char *)objc_allocWithZone(v157);
                  v159 = &v158[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_id];
                  v160 = v158;
                  sub_23F120CB0();
                  uint64_t v161 = OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_confidence;
                  *(_DWORD *)&v160[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_confidence] = 0;
                  swift_beginAccess();
                  v162 = v159;
                  unint64_t v21 = v187;
                  (*v183)(v162, v156, v187);
                  swift_endAccess();
                  *(float *)&v160[v161] = v135;
                  v163 = (double *)&v160[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect];
                  double *v163 = v149;
                  *((void *)v163 + 1) = v151;
                  *((void *)v163 + 2) = v153;
                  *((void *)v163 + 3) = v155;
                  v164 = (uint64_t *)&v160[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_className];
                  uint64_t *v164 = v194;
                  v164[1] = v118;

                  v200.receiver = v160;
                  v200.super_class = v157;
                  id v165 = objc_msgSendSuper2(&v200, sel_init);
                  (*v182)(v156, v21);
                  id v166 = v165;
                  MEMORY[0x2455C48C0]();
                  unint64_t v7 = *(void *)((v203 & 0xFFFFFFFFFFFFFF8) + 0x10);
                  uint64_t v22 = (char **)v136;
                  if (v7 >= *(void *)((v203 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                    sub_23F120E80();
                  }
                  sub_23F120EA0();
                  sub_23F120E70();

                  double v20 = (void *)MEMORY[0x263F8EE78];
                  unint64_t v24 = (unint64_t)v193;
                  goto LABEL_40;
                }
                goto LABEL_141;
              }
              goto LABEL_139;
            }
          }
LABEL_129:
          __break(1u);
          goto LABEL_130;
        }
      }
      swift_bridgeObjectRelease();
LABEL_40:
      uint64_t v36 = (char **)v189;
      uint64_t v22 = (char **)((char *)v22 + 1);
      int64_t v35 = (int64_t)v197;
      if (v22 == (char **)v189) {
        goto LABEL_35;
      }
      goto LABEL_41;
    }
LABEL_72:
    unint64_t v7 = (unint64_t)v20;
    CGFloat v46 = (unint64_t *)v20;
    goto LABEL_73;
  }
  if (!v35) {
    goto LABEL_72;
  }
  v201 = (unint64_t *)v20;
  sub_23F11CD88(0, (int64_t)v197, 0);
  int64_t v44 = (int64_t)v197;
  uint64_t v45 = 0;
  CGFloat v46 = v201;
  id v48 = v192;
  double v47 = v193;
  do
  {
    float v49 = 0.0;
    if (!v48) {
      goto LABEL_52;
    }
    if (v47[4] == (id)v45) {
      goto LABEL_47;
    }
    if (v48 == (id)1) {
      goto LABEL_52;
    }
    if (v47[5] == (id)v45)
    {
LABEL_47:
      v202 = v20;
      sub_23F121010();
      objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v45);
      sub_23F120FF0();
      sub_23F121020();
      sub_23F121030();
      sub_23F121000();
      id v50 = objc_allocWithZone(NSNumber);
      objc_msgSend(v50, sel_initWithInteger_, v198);
      sub_23F120FF0();
      sub_23F121020();
      sub_23F121030();
      sub_23F121000();
      objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v22);
      sub_23F120FF0();
      sub_23F121020();
      sub_23F121030();
      sub_23F121000();
      uint64_t v51 = (void *)sub_23F120E40();
      swift_release();
      id v52 = v196;
      id v53 = objc_msgSend(v196, sel_objectForKeyedSubscript_, v51);

      [v53 a3[37]];
      float v55 = v54;

      if (v55 >= a1)
      {
        sub_23F11D21C(v52, v45, v198, (unint64_t)v22);
        if (v55 == v56) {
          float v49 = v55;
        }
      }
      double v20 = (void *)MEMORY[0x263F8EE78];
      int64_t v44 = (int64_t)v197;
      id v48 = v192;
      double v47 = v193;
    }
    else if (v48 != (id)2)
    {
      uint64_t v59 = 6;
      while (1)
      {
        uint64_t v60 = v59 - 3;
        if (__OFADD__(v59 - 4, 1)) {
          break;
        }
        if (v47[v59] == (id)v45) {
          goto LABEL_47;
        }
        ++v59;
        if ((id)v60 == v48) {
          goto LABEL_52;
        }
      }
LABEL_130:
      __break(1u);
      goto LABEL_131;
    }
LABEL_52:
    v201 = v46;
    unint64_t v58 = v46[2];
    unint64_t v57 = v46[3];
    if (v58 >= v57 >> 1)
    {
      sub_23F11CD88(v57 > 1, v58 + 1, 1);
      id v48 = v192;
      double v47 = v193;
      int64_t v44 = (int64_t)v197;
      CGFloat v46 = v201;
    }
    ++v45;
    v46[2] = v58 + 1;
    *((float *)v46 + v58 + _Block_object_dispose(&a9, 8) = v49;
  }
  while (v45 != v44);
  v201 = (unint64_t *)v20;
  sub_23F11CD88(0, (int64_t)v197, 0);
  id v121 = v192;
  v120 = v193;
  int64_t v35 = (int64_t)v197;
  uint64_t v122 = 0;
  unint64_t v7 = (unint64_t)v201;
  while (1)
  {
    if (!v121) {
      goto LABEL_109;
    }
    float v123 = 0.0;
    if (v120[4] != (id)v122)
    {
      if (v121 == (id)1) {
        goto LABEL_109;
      }
      if (v120[5] != (id)v122) {
        break;
      }
    }
LABEL_113:
    v201 = (unint64_t *)v7;
    unint64_t v134 = *(void *)(v7 + 16);
    unint64_t v133 = *(void *)(v7 + 24);
    if (v134 >= v133 >> 1)
    {
      sub_23F11CD88(v133 > 1, v134 + 1, 1);
      id v121 = v192;
      v120 = v193;
      int64_t v35 = (int64_t)v197;
      unint64_t v7 = (unint64_t)v201;
    }
    ++v122;
    *(void *)(v7 + 16) = v134 + 1;
    *(float *)(v7 + 4 * v134 + 32) = v123;
    double v20 = (void *)MEMORY[0x263F8EE78];
    if (v122 == v35) {
      goto LABEL_73;
    }
  }
  if (v121 == (id)2)
  {
LABEL_109:
    v202 = v20;
    sub_23F121010();
    objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v122);
    sub_23F120FF0();
    sub_23F121020();
    sub_23F121030();
    sub_23F121000();
    id v126 = objc_allocWithZone(NSNumber);
    objc_msgSend(v126, sel_initWithInteger_, v198);
    sub_23F120FF0();
    sub_23F121020();
    sub_23F121030();
    sub_23F121000();
    id v127 = objc_allocWithZone(NSNumber);
    uint64_t v22 = (char **)v194;
    objc_msgSend(v127, sel_initWithInteger_, v194);
    sub_23F120FF0();
    sub_23F121020();
    sub_23F121030();
    sub_23F121000();
    v128 = (void *)sub_23F120E40();
    swift_release();
    id v129 = v196;
    id v130 = objc_msgSend(v196, sel_objectForKeyedSubscript_, v128);

    [v130 a3[37]];
    float v123 = v131;

    if (v123 < a1 || (sub_23F11D21C(v129, v122, v198, (unint64_t)v22), v123 != v132)) {
      float v123 = 0.0;
    }
    int64_t v35 = (int64_t)v197;
    id v121 = v192;
    v120 = v193;
    goto LABEL_113;
  }
  uint64_t v124 = 6;
  while (1)
  {
    uint64_t v125 = v124 - 3;
    if (__OFADD__(v124 - 4, 1)) {
      break;
    }
    if (v120[v124] == (id)v122) {
      goto LABEL_113;
    }
    ++v124;
    if ((id)v125 == v121) {
      goto LABEL_109;
    }
  }
LABEL_131:
  __break(1u);
LABEL_132:
  (*(void (**)(char *, uint64_t))(v178 + 8))(v177, v168);
  swift_bridgeObjectRelease();
}

void sub_23F11EB70(void *a1, char **a2, uint64_t a3, float a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C35818);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23F11F270(&qword_268C35820, &qword_268C35818);
  id v12 = a1;
  sub_23F120D60();
  sub_23F11D694(a4, (uint64_t)v11, a2, a3);
  unint64_t v14 = v13;
  uint64_t v41 = MEMORY[0x263F8EE78];
  if (!(v13 >> 62))
  {
    uint64_t v15 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v15) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
LABEL_14:
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return;
  }
  uint64_t v15 = sub_23F121070();
  if (!v15) {
    goto LABEL_13;
  }
LABEL_3:
  if (v15 >= 1)
  {
    objc_super v37 = v11;
    uint64_t v38 = v9;
    uint64_t v39 = v8;
    uint64_t v16 = 0;
    do
    {
      if ((v14 & 0xC000000000000001) != 0) {
        uint64_t v17 = (char *)MEMORY[0x2455C4A50](v16, v14);
      }
      else {
        uint64_t v17 = (char *)*(id *)(v14 + 8 * v16 + 32);
      }
      uint64_t v18 = v17;
      id v19 = (objc_class *)type metadata accessor for AudiogramSymbolDetectorResult();
      id v20 = objc_allocWithZone(v19);
      unint64_t v21 = (CGRect *)&v18[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect];
      CGFloat v22 = *(double *)&v18[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect];
      CGFloat v23 = *(double *)&v18[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect + 8];
      CGFloat v24 = *(double *)&v18[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect + 16];
      CGFloat v25 = *(double *)&v18[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect + 24];
      unint64_t v26 = v18;
      id v27 = (char *)v20;
      v42.origin.CGFloat x = v22;
      v42.origin.CGFloat y = v23;
      v42.size.CGFloat width = v24;
      v42.size.CGFloat height = v25;
      CGFloat MinX = CGRectGetMinX(v42);
      CGFloat MinY = CGRectGetMinY(*v21);
      CGFloat Width = CGRectGetWidth(*v21);
      CGFloat Height = CGRectGetHeight(*v21);
      id v32 = (CGFloat *)&v27[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box];
      *id v32 = MinX;
      v32[1] = MinY;
      v32[2] = Width;
      v32[3] = Height;
      *(double *)&v27[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_confidence] = *(float *)&v26[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_confidence];
      uint64_t v33 = *(void *)&v26[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_className + 8];
      double v34 = &v27[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_labelName];
      *(void *)double v34 = *(void *)&v26[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_className];
      *((void *)v34 + 1) = v33;
      swift_bridgeObjectRetain();

      v40.receiver = v27;
      v40.super_class = v19;
      id v35 = objc_msgSendSuper2(&v40, sel_init);

      id v36 = v35;
      MEMORY[0x2455C48C0]();
      if (*(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_23F120E80();
      }
      ++v16;
      sub_23F120EA0();
      sub_23F120E70();
    }
    while (v15 != v16);
    swift_bridgeObjectRelease();
    uint64_t v9 = v38;
    uint64_t v8 = v39;
    uint64_t v11 = v37;
    goto LABEL_14;
  }
  __break(1u);
}

uint64_t sub_23F11EEC8(void *a1, float a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C35818);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23F11F270(&qword_268C35820, &qword_268C35818);
  id v8 = a1;
  sub_23F120D60();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C35828);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23F124900;
  *(void *)(inited + 32) = 0x6870617267;
  *(void *)(inited + 40) = 0xE500000000000000;
  unint64_t v10 = MEMORY[0x263F8EE78];
  sub_23F11D694(a2, (uint64_t)v7, (char **)inited, MEMORY[0x263F8EE78]);
  unint64_t v12 = v11;
  swift_setDeallocating();
  uint64_t result = swift_arrayDestroy();
  unint64_t v38 = v10;
  if (!(v12 >> 62))
  {
    uint64_t v14 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v14) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    unint64_t v32 = MEMORY[0x263F8EE78];
LABEL_14:
    uint64_t v33 = sub_23F1121A0(v32, 0.5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v33;
  }
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_23F121070();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v14) {
    goto LABEL_13;
  }
LABEL_3:
  if (v14 >= 1)
  {
    double v34 = v7;
    uint64_t v35 = v5;
    uint64_t v36 = v4;
    uint64_t v15 = 0;
    do
    {
      if ((v12 & 0xC000000000000001) != 0) {
        uint64_t v16 = (char *)MEMORY[0x2455C4A50](v15, v12);
      }
      else {
        uint64_t v16 = (char *)*(id *)(v12 + 8 * v15 + 32);
      }
      uint64_t v17 = v16;
      uint64_t v18 = (objc_class *)type metadata accessor for AudiogramGraphDetectorResult();
      id v19 = objc_allocWithZone(v18);
      id v20 = (CGRect *)&v17[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect];
      CGFloat v21 = *(double *)&v17[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect];
      CGFloat v22 = *(double *)&v17[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect + 8];
      CGFloat v23 = *(double *)&v17[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect + 16];
      CGFloat v24 = *(double *)&v17[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_rect + 24];
      CGFloat v25 = (char *)v19;
      v39.origin.CGFloat x = v21;
      v39.origin.CGFloat y = v22;
      v39.size.CGFloat width = v23;
      v39.size.CGFloat height = v24;
      CGFloat MinX = CGRectGetMinX(v39);
      CGFloat MinY = CGRectGetMinY(*v20);
      CGFloat Width = CGRectGetWidth(*v20);
      CGFloat Height = CGRectGetHeight(*v20);
      id v30 = (CGFloat *)&v25[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_box];
      *id v30 = MinX;
      v30[1] = MinY;
      v30[2] = Width;
      v30[3] = Height;
      *(double *)&v25[OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_confidence] = *(float *)&v17[OBJC_IVAR____TtC18AudiogramIngestion23MindNetModelBoundingBox_confidence];

      v37.receiver = v25;
      v37.super_class = v18;
      id v31 = objc_msgSendSuper2(&v37, sel_init);
      MEMORY[0x2455C48C0]();
      if (*(void *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_23F120E80();
      }
      ++v15;
      sub_23F120EA0();
      sub_23F120E70();
    }
    while (v14 != v15);
    swift_bridgeObjectRelease();
    unint64_t v32 = v38;
    uint64_t v5 = v35;
    uint64_t v4 = v36;
    unint64_t v7 = v34;
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

uint64_t sub_23F11F268(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23F11BA18(a1, a2, a3, *(void **)(v3 + 16));
}

uint64_t sub_23F11F270(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MindNetModelBoundingBox.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for MindNetModelBoundingBox.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    char *result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x23F11F410);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          char *result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MindNetModelBoundingBox.CodingKeys()
{
  return &type metadata for MindNetModelBoundingBox.CodingKeys;
}

unint64_t sub_23F11F44C()
{
  unint64_t result = qword_268C35860;
  if (!qword_268C35860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C35860);
  }
  return result;
}

unint64_t sub_23F11F4A4()
{
  unint64_t result = qword_268C35868;
  if (!qword_268C35868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C35868);
  }
  return result;
}

unint64_t sub_23F11F4FC()
{
  unint64_t result = qword_268C35870;
  if (!qword_268C35870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C35870);
  }
  return result;
}

uint64_t sub_23F11F550(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_23F121160() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E656469666E6F63 && a2 == 0xEA00000000006563 || (sub_23F121160() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1952671090 && a2 == 0xE400000000000000 || (sub_23F121160() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6D614E7373616C63 && a2 == 0xE900000000000065)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_23F121160();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t metadataForHKAudiogramSample_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return -[AIAudiogramIndividualFrequencyInputViewController tableView:cellForRowAtIndexPath:](v0);
}

uint64_t __getHKHealthStoreClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getHKSingleAudiogramChartViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getHKSingleAudiogramChartViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getHKAudiogramSampleClass_block_invoke_cold_1(v0);
}

uint64_t __getHKAudiogramSampleClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getHKUnitClass_block_invoke_cold_1(v0);
}

uint64_t __getHKUnitClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getHKQuantityClass_block_invoke_cold_1(v0);
}

uint64_t __getHKQuantityClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getHKAudiogramSensitivityTestClass_block_invoke_cold_1(v0);
}

uint64_t __getHKAudiogramSensitivityTestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getHKAudiogramSensitivityPointClass_block_invoke_cold_1(v0);
}

uint64_t __getHKAudiogramSensitivityPointClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __54__AIAudiogramFinalResultViewController__saveToHealth___block_invoke_cold_1(v0);
}

uint64_t __getHKUnitPreferenceControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getHKSampleTypeUpdateControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getHKSampleTypeUpdateControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getHKAudiogramChartViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getHKAudiogramChartViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AIAudiogramResultsViewController _setCellActive:indexPath:scroll:](v0);
}

uint64_t __getPHPickerConfigurationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPHPickerFilterClass_block_invoke_cold_1(v0);
}

uint64_t __getPHPickerFilterClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPHPickerViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getPHPickerViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __89__AIAudiogramAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke_cold_1(v0);
}

void __getAXSettingsClass_block_invoke_cold_1()
{
}

uint64_t sub_23F120C50()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_23F120C60()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_23F120C70()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_23F120C80()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_23F120C90()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_23F120CA0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_23F120CB0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_23F120CC0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_23F120CD0()
{
  return MEMORY[0x270EF16E0]();
}

uint64_t sub_23F120CE0()
{
  return MEMORY[0x270EF1700]();
}

uint64_t sub_23F120CF0()
{
  return MEMORY[0x270F816F8]();
}

uint64_t sub_23F120D00()
{
  return MEMORY[0x270EF1738]();
}

uint64_t sub_23F120D10()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_23F120D20()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_23F120D30()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_23F120D40()
{
  return MEMORY[0x270EE7530]();
}

uint64_t sub_23F120D50()
{
  return MEMORY[0x270EE7588]();
}

uint64_t sub_23F120D60()
{
  return MEMORY[0x270EE7620]();
}

uint64_t sub_23F120D70()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_23F120D80()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_23F120D90()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_23F120DA0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_23F120DB0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_23F120DC0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_23F120DD0()
{
  return MEMORY[0x270EF1A38]();
}

uint64_t sub_23F120DE0()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_23F120DF0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_23F120E00()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_23F120E10()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_23F120E20()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_23F120E30()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_23F120E40()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_23F120E50()
{
  return MEMORY[0x270EF1BA8]();
}

uint64_t sub_23F120E60()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_23F120E70()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_23F120E80()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_23F120E90()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_23F120EA0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_23F120EB0()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_23F120EC0()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_23F120ED0()
{
  return MEMORY[0x270EF1CD8]();
}

uint64_t sub_23F120EE0()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_23F120EF0()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_23F120F00()
{
  return MEMORY[0x270EE5848]();
}

uint64_t sub_23F120F10()
{
  return MEMORY[0x270EE7918]();
}

uint64_t sub_23F120F20()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_23F120F30()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_23F120F40()
{
  return MEMORY[0x270EE5908]();
}

uint64_t sub_23F120F50()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_23F120F60()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_23F120F70()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_23F120F80()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_23F120F90()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_23F120FA0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_23F120FB0()
{
  return MEMORY[0x270F9E9D8]();
}

uint64_t sub_23F120FC0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_23F120FD0()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_23F120FE0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_23F120FF0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_23F121000()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_23F121010()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_23F121020()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_23F121030()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_23F121040()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_23F121050()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_23F121060()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_23F121070()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_23F121080()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_23F121090()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_23F1210B0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_23F1210C0()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_23F1210D0()
{
  return MEMORY[0x270F9F300]();
}

uint64_t sub_23F1210E0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_23F1210F0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_23F121100()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_23F121110()
{
  return MEMORY[0x270F9F440]();
}

uint64_t sub_23F121120()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_23F121130()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_23F121140()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_23F121150()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_23F121160()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_23F121170()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_23F121180()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_23F121190()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_23F1211A0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_23F1211B0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_23F1211C0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t AXCFormattedString()
{
  return MEMORY[0x270F09160]();
}

uint64_t AXLogAggregate()
{
  return MEMORY[0x270F09298]();
}

uint64_t AXLogAudiogram()
{
  return MEMORY[0x270F092B8]();
}

uint64_t AXPerformBlockOnMainThread()
{
  return MEMORY[0x270F09430]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x270F09440]();
}

uint64_t AXRequestingClient()
{
  return MEMORY[0x270F09860]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

void CGContextDrawPDFPage(CGContextRef c, CGPDFPageRef page)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x270EE6750](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x270EE6780](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x270EE6790](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x270EE67A0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

CGPDFDocumentRef CGPDFDocumentCreateWithURL(CFURLRef url)
{
  return (CGPDFDocumentRef)MEMORY[0x270EE6B98](url);
}

size_t CGPDFDocumentGetNumberOfPages(CGPDFDocumentRef document)
{
  return MEMORY[0x270EE6BF8](document);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return (CGPDFPageRef)MEMORY[0x270EE6C00](document, pageNumber);
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  MEMORY[0x270EE6D80](page, *(void *)&box);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

int CGPDFPageGetRotationAngle(CGPDFPageRef page)
{
  return MEMORY[0x270EE6DA8](page);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x270F82BC0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F82BC8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F82D70]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F82D80]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x270F82DD0](image, compressionQuality);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

long double atan(long double __x)
{
  MEMORY[0x270ED86A0](__x);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
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

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

long double tan(long double __x)
{
  MEMORY[0x270EDB810](__x);
  return result;
}