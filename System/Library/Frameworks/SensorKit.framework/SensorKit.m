double SRPhotoplethysmogramOpticalSample.NoiseTerms.whiteNoise.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

double SRPhotoplethysmogramOpticalSample.NoiseTerms.pinkNoise.getter()
{
  return *(double *)(v0 + 8);
}

double SRPhotoplethysmogramOpticalSample.NoiseTerms.backgroundNoise.getter()
{
  return *(double *)(v0 + 16);
}

double SRPhotoplethysmogramOpticalSample.NoiseTerms.backgroundNoiseOffset.getter()
{
  return *(double *)(v0 + 24);
}

void SRPhotoplethysmogramOpticalSample.noiseTerms.getter(uint64_t a1@<X8>)
{
  id v3 = objc_msgSend(v1, sel_whiteNoise);
  if (!v3) {
    goto LABEL_6;
  }
  v4 = v3;
  objc_msgSend(v3, sel_doubleValue);
  uint64_t v6 = v5;

  id v7 = objc_msgSend(v1, sel_pinkNoise);
  if (!v7) {
    goto LABEL_6;
  }
  v8 = v7;
  objc_msgSend(v7, sel_doubleValue);
  uint64_t v10 = v9;

  id v11 = objc_msgSend(v1, sel_backgroundNoise);
  if (!v11) {
    goto LABEL_6;
  }
  v12 = v11;
  objc_msgSend(v11, sel_doubleValue);
  uint64_t v14 = v13;

  id v15 = objc_msgSend(v1, sel_backgroundNoiseOffset);
  if (v15)
  {
    v16 = v15;
    objc_msgSend(v15, sel_doubleValue);
    uint64_t v18 = v17;

    *(void *)a1 = v6;
    *(void *)(a1 + 8) = v10;
    *(void *)(a1 + 16) = v14;
    *(void *)(a1 + 24) = v18;
    *(unsigned char *)(a1 + 32) = 0;
  }
  else
  {
LABEL_6:
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(unsigned char *)(a1 + 32) = 1;
  }
}

id SRPhotoplethysmogramOpticalSample.normalizedReflectance.getter()
{
  id result = objc_msgSend(v0, sel_normalizedReflectance);
  v2 = result;
  if (result)
  {
    objc_msgSend(result, sel_doubleValue);
    uint64_t v4 = v3;

    return (id)v4;
  }
  return result;
}

uint64_t _s10NoiseTermsVwCP(uint64_t *a1, uint64_t *a2)
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

uint64_t _s10NoiseTermsVwet(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t _s10NoiseTermsVwst(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
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

ValueMetadata *type metadata accessor for SRPhotoplethysmogramOpticalSample.NoiseTerms()
{
  return &type metadata for SRPhotoplethysmogramOpticalSample.NoiseTerms;
}

id SRWristTemperatureSession.temperatures.getter@<X0>(void *a1@<X8>)
{
  id result = objc_msgSend(v1, sel_temperatures);
  *a1 = result;
  a1[1] = sub_21FCA5EE8;
  a1[2] = 0;
  return result;
}

uint64_t sub_21FCA5EE8(uint64_t a1)
{
  sub_21FCA5FE8(a1, (uint64_t)&v2);
  sub_21FCA6044();
  return swift_dynamicCast();
}

unint64_t sub_21FCA5F44()
{
  unint64_t result = qword_267EF8950;
  if (!qword_267EF8950)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EF8958);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EF8950);
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

uint64_t sub_21FCA5FE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_21FCA6044()
{
  unint64_t result = qword_267EF8960;
  if (!qword_267EF8960)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267EF8960);
  }
  return result;
}

void sub_21FCA6414(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

os_log_t __SRLogReaderExport_block_invoke()
{
  os_log_t result = os_log_create("com.apple.SensorKit", "SRLogReaderExport");
  _MergedGlobals_0 = (uint64_t)result;
  return result;
}

void sub_21FCA7F50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FCA81DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FCA83D4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_21FCA8E28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  objc_destroyWeak(v52);
  objc_destroyWeak(v51);
  objc_destroyWeak((id *)(v53 - 128));
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose((const void *)(v53 - 240), 8);
  _Block_object_dispose((const void *)(v53 - 208), 8);
  _Block_object_dispose((const void *)(v53 - 160), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t getUIDeviceClass()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x3052000000;
  uint64_t v6 = __Block_byref_object_copy__0;
  id v7 = __Block_byref_object_dispose__0;
  uint64_t v0 = qword_26AB1A0A0;
  uint64_t v8 = qword_26AB1A0A0;
  if (!qword_26AB1A0A0)
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __getUIDeviceClass_block_invoke;
    v2[3] = &unk_26452E210;
    v2[4] = &v3;
    __getUIDeviceClass_block_invoke((uint64_t)v2);
    uint64_t v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_21FCAB9F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

Class __getUIDeviceClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v6[0] = 0;
  if (!qword_26AB1A0A8)
  {
    v6[1] = (void *)MEMORY[0x263EF8330];
    v6[2] = (void *)3221225472;
    v6[3] = __UIKitLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_26452E230;
    uint64_t v8 = 0;
    qword_26AB1A0A8 = _sl_dlopen();
  }
  if (!qword_26AB1A0A8)
  {
    uint64_t v3 = (void *)[MEMORY[0x263F08690] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *UIKitLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"SRDevice.m", 17, @"%s", v6[0]);
    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("UIDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v5 = (void *)[MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getUIDeviceClass(void)_block_invoke"), @"SRDevice.m", 18, @"Unable to find class %s", "UIDevice");
LABEL_10:
    __break(1u);
  }
  qword_26AB1A0A0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

uint64_t __UIKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_26AB1A0A8 = result;
  return result;
}

void sub_21FCABF1C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 88));
  _Unwind_Resume(a1);
}

void SRRegisterForDarwinNotification(void *a1, int *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v6 = SRLogDaemonNotification;
  if (os_log_type_enabled((os_log_t)SRLogDaemonNotification, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138543362;
    v12 = a1;
    _os_log_debug_impl(&dword_21FCA3000, v6, OS_LOG_TYPE_DEBUG, "Registering for darwin notification on %{public}@", (uint8_t *)&v11, 0xCu);
  }
  *a2 = -1;
  long long v7 = (const char *)[a1 UTF8String];
  uint32_t v8 = notify_register_dispatch(v7, a2, MEMORY[0x263EF83A0], a3);
  if (v8 || *a2 == -1)
  {
    uint64_t v9 = SRLogDaemonNotification;
    if (os_log_type_enabled((os_log_t)SRLogDaemonNotification, OS_LOG_TYPE_ERROR))
    {
      int v10 = *a2;
      int v11 = 138543874;
      v12 = a1;
      __int16 v13 = 1026;
      uint32_t v14 = v8;
      __int16 v15 = 1026;
      int v16 = v10;
      _os_log_error_impl(&dword_21FCA3000, v9, OS_LOG_TYPE_ERROR, "Failed to register for darwin notification %{public}@, status %{public}d, registration token %{public}d", (uint8_t *)&v11, 0x18u);
    }
  }
}

void SRUnregisterForNotification(uint64_t a1, int *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v2 = *a2;
  if (*a2 != -1)
  {
    uint64_t v5 = SRLogDaemonNotification;
    if (os_log_type_enabled((os_log_t)SRLogDaemonNotification, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 138543362;
      uint64_t v9 = a1;
      _os_log_debug_impl(&dword_21FCA3000, v5, OS_LOG_TYPE_DEBUG, "Unregistering for darwin notification on %{public}@", (uint8_t *)&v8, 0xCu);
      int v2 = *a2;
    }
    if (notify_cancel(v2))
    {
      uint64_t v6 = SRLogDaemonNotification;
      if (os_log_type_enabled((os_log_t)SRLogDaemonNotification, OS_LOG_TYPE_ERROR))
      {
        int v7 = *a2;
        int v8 = 138543618;
        uint64_t v9 = a1;
        __int16 v10 = 1026;
        int v11 = v7;
        _os_log_error_impl(&dword_21FCA3000, v6, OS_LOG_TYPE_ERROR, "Failed to cancel notification %{public}@. status %{public}d", (uint8_t *)&v8, 0x12u);
      }
    }
    *a2 = -1;
  }
}

void sub_21FCADEAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id location)
{
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FCAEEF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_21FCAF560(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FCAF5E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FCAF698(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FCAF718(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FCB08E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FCB0E8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
}

void sub_21FCB1610(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FCB8040(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 64));
  _Unwind_Resume(a1);
}

void sub_21FCB86B8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21FCB87EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21FCB8A94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  objc_destroyWeak(v23);
  objc_destroyWeak((id *)(v24 - 96));
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

void sub_21FCB8BFC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21FCB8F30(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_21FCB90D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t __legacyExtendedReasonBehavior_block_invoke()
{
  uint64_t result = dyld_program_sdk_at_least();
  _MergedGlobals_3 = result ^ 1;
  return result;
}

void __getVerticesForGenericFaceShape_block_invoke()
{
}

void sub_21FCC16E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_21FCC2628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FCC27E4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21FCC31F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FCC3390(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21FCC3AA4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_21FCC3DBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FCC43A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  v20 = v18;
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v19 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21FCC45A4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t SRBundleIdentifiersWithPendingAuthorizations()
{
  if (_MergedGlobals_5 != -1) {
    dispatch_once(&_MergedGlobals_5, &__block_literal_global_6);
  }
  uint64_t v0 = qword_26AB1A0F0;
  if (os_log_type_enabled((os_log_t)qword_26AB1A0F0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_error_impl(&dword_21FCA3000, v0, OS_LOG_TYPE_ERROR, "SRBundleIdentifiersWithPendingAuthorizations() should no longer be called. The functionality has been removed.", v2, 2u);
  }
  return MEMORY[0x263EFFA78];
}

void SRAddBundleToPendingAuthorizations()
{
  if (_MergedGlobals_5 != -1) {
    dispatch_once(&_MergedGlobals_5, &__block_literal_global_6);
  }
  uint64_t v0 = qword_26AB1A0F0;
  if (os_log_type_enabled((os_log_t)qword_26AB1A0F0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl(&dword_21FCA3000, v0, OS_LOG_TYPE_ERROR, "SRAddBundleToPendingAuthorizations() should no longer be called. The functionality has been removed.", v1, 2u);
  }
}

void SRRemoveBundleFromPendingAuthorizations()
{
  if (_MergedGlobals_5 != -1) {
    dispatch_once(&_MergedGlobals_5, &__block_literal_global_6);
  }
  uint64_t v0 = qword_26AB1A0F0;
  if (os_log_type_enabled((os_log_t)qword_26AB1A0F0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl(&dword_21FCA3000, v0, OS_LOG_TYPE_ERROR, "SRRemoveBundleFromPendingAuthorizations() should no longer be called. The functionality has been removed.", v1, 2u);
  }
}

uint64_t SRResetAuthorizationsForBundleWithCompletionHandler(void *a1, uint64_t a2)
{
  if (_MergedGlobals_5 != -1) {
    dispatch_once(&_MergedGlobals_5, &__block_literal_global_6);
  }
  uint64_t v4 = qword_26AB1A0F0;
  if (os_log_type_enabled((os_log_t)qword_26AB1A0F0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_error_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_ERROR, "SRResetAuthorizationsForBundleWithCompletionHandler() should no longer be called. Please call SRAuthorizationResetWithCompletionHandler() instead", v6, 2u);
  }
  return SRAuthorizationResetWithCompletionHandler(a1, a2);
}

uint64_t SRBundleIdentifiersAuthorizedToUseSensorKit(uint64_t a1)
{
  if (_MergedGlobals_5 != -1) {
    dispatch_once(&_MergedGlobals_5, &__block_literal_global_6);
  }
  uint64_t v2 = qword_26AB1A0F0;
  if (os_log_type_enabled((os_log_t)qword_26AB1A0F0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_21FCA3000, v2, OS_LOG_TYPE_ERROR, "SRResetAuthorizationsForBundleWithCompletionHandler() should no longer be called. Please call SRAuthorizationFetchSnapshot() instead", buf, 2u);
  }
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __SRBundleIdentifiersAuthorizedToUseSensorKit_block_invoke;
  v4[3] = &unk_26452E760;
  v4[4] = a1;
  return SRAuthorizationSnapshot((uint64_t)v4);
}

uint64_t __SRBundleIdentifiersAuthorizedToUseSensorKit_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:", objc_msgSend(a2, "allKeys"));
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);

  return v6(v4, v5, a3);
}

uint64_t SRGetAuthorizationStatusForBundleIdentifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (_MergedGlobals_5 != -1) {
    dispatch_once(&_MergedGlobals_5, &__block_literal_global_6);
  }
  uint64_t v6 = qword_26AB1A0F0;
  if (os_log_type_enabled((os_log_t)qword_26AB1A0F0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)int v8 = 0;
    _os_log_error_impl(&dword_21FCA3000, v6, OS_LOG_TYPE_ERROR, "SRGetAuthorizationStatusForBundleIdentifier() should no longer be called. Please use -[SRSensorReaderDelegate sensorReader:didChangeAuthorizationStatus:] after requesting authorization instead", v8, 2u);
  }
  return SRAuthorizationStatusForBundleIdentifier(a1, a2, a3);
}

void SRSetRequiredOnboardingCompleted()
{
  if (_MergedGlobals_5 != -1) {
    dispatch_once(&_MergedGlobals_5, &__block_literal_global_6);
  }
  uint64_t v0 = qword_26AB1A0F0;
  if (os_log_type_enabled((os_log_t)qword_26AB1A0F0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl(&dword_21FCA3000, v0, OS_LOG_TYPE_ERROR, "SRSetRequiredOnboardingCompleted() is no longer functional.", v1, 2u);
  }
}

BOOL SRIsRequiredOnboardingCompleted()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (_MergedGlobals_5 != -1) {
    dispatch_once(&_MergedGlobals_5, &__block_literal_global_6);
  }
  uint64_t v0 = qword_26AB1A0F0;
  if (os_log_type_enabled((os_log_t)qword_26AB1A0F0, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v4[0]) = 0;
    _os_log_error_impl(&dword_21FCA3000, v0, OS_LOG_TYPE_ERROR, "SRIsRequiredOnboardingCompleted() should no longer be called.", (uint8_t *)v4, 2u);
  }
  BOOL v1 = [+[SRAuthorizationClient sharedInstance] firstRunOnboardingCompleted];
  if (_MergedGlobals_5 != -1) {
    dispatch_once(&_MergedGlobals_5, &__block_literal_global_6);
  }
  uint64_t v2 = qword_26AB1A0F0;
  if (os_log_type_enabled((os_log_t)qword_26AB1A0F0, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67240192;
    v4[1] = v1;
    _os_log_impl(&dword_21FCA3000, v2, OS_LOG_TYPE_DEFAULT, "SRIsRequiredOnboardingCompleted() returning %{public, BOOL}d", (uint8_t *)v4, 8u);
  }
  return v1;
}

void SRSetDataCollectionEnabled()
{
  if (_MergedGlobals_5 != -1) {
    dispatch_once(&_MergedGlobals_5, &__block_literal_global_6);
  }
  uint64_t v0 = qword_26AB1A0F0;
  if (os_log_type_enabled((os_log_t)qword_26AB1A0F0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)BOOL v1 = 0;
    _os_log_error_impl(&dword_21FCA3000, v0, OS_LOG_TYPE_ERROR, "SRSetDataCollectionEnabled() is no longer functional. This should be enabled in Settings.", v1, 2u);
  }
}

BOOL SRIsDataCollectionEnabled()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (_MergedGlobals_5 != -1) {
    dispatch_once(&_MergedGlobals_5, &__block_literal_global_6);
  }
  uint64_t v0 = qword_26AB1A0F0;
  if (os_log_type_enabled((os_log_t)qword_26AB1A0F0, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v4[0]) = 0;
    _os_log_error_impl(&dword_21FCA3000, v0, OS_LOG_TYPE_ERROR, "SRIsDataCollectionEnabled() should no longer be called.", (uint8_t *)v4, 2u);
  }
  BOOL v1 = [+[SRAuthorizationClient sharedInstance] dataCollectionEnabled];
  if (_MergedGlobals_5 != -1) {
    dispatch_once(&_MergedGlobals_5, &__block_literal_global_6);
  }
  uint64_t v2 = qword_26AB1A0F0;
  if (os_log_type_enabled((os_log_t)qword_26AB1A0F0, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67240192;
    v4[1] = v1;
    _os_log_impl(&dword_21FCA3000, v2, OS_LOG_TYPE_DEFAULT, "SRIsDataCollectionEnabled() returning %{public, BOOL}d", (uint8_t *)v4, 8u);
  }
  return v1;
}

uint64_t SRRequiredAppIdentifier()
{
  if (_MergedGlobals_5 != -1) {
    dispatch_once(&_MergedGlobals_5, &__block_literal_global_6);
  }
  uint64_t v0 = qword_26AB1A0F0;
  if (os_log_type_enabled((os_log_t)qword_26AB1A0F0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_error_impl(&dword_21FCA3000, v0, OS_LOG_TYPE_ERROR, "SRRequiredAppIdentifier() should no longer be called.", v2, 2u);
  }
  return objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "bundleIdentifier");
}

__CFString *SRStudyBundleIdPrefix()
{
  if (_MergedGlobals_5 != -1) {
    dispatch_once(&_MergedGlobals_5, &__block_literal_global_6);
  }
  uint64_t v0 = qword_26AB1A0F0;
  if (os_log_type_enabled((os_log_t)qword_26AB1A0F0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_error_impl(&dword_21FCA3000, v0, OS_LOG_TYPE_ERROR, "SRStudyBundleIdPrefix() should no longer be called.", v2, 2u);
  }
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "bundleIdentifier"), "isEqualToString:", @"com.appleinternal.health.Lime"))return @"com.appleinternal.health.Lime"; {
  else
  }
    return @"com.apple.Research.study";
}

os_log_t __SRLogLegacyPartnerApp_block_invoke()
{
  os_log_t result = os_log_create("com.apple.SensorKit", "SRLegacyPartnerApp");
  qword_26AB1A0F0 = (uint64_t)result;
  return result;
}

BOOL isValidString(void *a1)
{
  return (objc_opt_isKindOfClass() & 1) != 0
      && objc_msgSend((id)objc_msgSend(a1, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x263F08708], "whitespaceAndNewlineCharacterSet")), "length") != 0;
}

os_log_t __SRLogNSBundle_block_invoke()
{
  os_log_t result = os_log_create("com.apple.SensorKit", "SRLogNSBundle");
  qword_26AB1A100 = (uint64_t)result;
  return result;
}

uint64_t SRRequestAuthorizationForServices(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v12 = 0;
  if (verifyRequestedClassesWithError(&v12))
  {
    SRRemoteAuthorizationPromptViewControllerClass = (void *)getSRRemoteAuthorizationPromptViewControllerClass();
    uint64_t SRAuthorizationPromptPresentationControllerClass = getSRAuthorizationPromptPresentationControllerClass();
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __SRRequestAuthorizationForServices_block_invoke;
    v11[3] = &unk_26452E7D8;
    v11[4] = SRAuthorizationPromptPresentationControllerClass;
    v11[5] = a2;
    v11[6] = a1;
    v11[7] = a3;
    return [SRRemoteAuthorizationPromptViewControllerClass requestViewControllerWithCompletionHandler:v11];
  }
  else
  {
    uint64_t v9 = v12;
    __int16 v10 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 16);
    return v10(a3, v9);
  }
}

uint64_t verifyRequestedClassesWithError(uint64_t *a1)
{
  if (!NSClassFromString(&cfstr_Uiviewcontroll.isa))
  {
    if (qword_26AB1A110 != -1) {
      dispatch_once(&qword_26AB1A110, &__block_literal_global_8);
    }
    uint64_t v5 = _MergedGlobals_7;
    if (!os_log_type_enabled((os_log_t)_MergedGlobals_7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    __int16 v10 = 0;
    uint64_t v6 = "Requested prompt while running in a non-UI process";
    int v7 = (uint8_t *)&v10;
    goto LABEL_16;
  }
  uint64_t SRRemoteAuthorizationPromptViewControllerClass = getSRRemoteAuthorizationPromptViewControllerClass();
  uint64_t SRAuthorizationPromptPresentationControllerClass = getSRAuthorizationPromptPresentationControllerClass();
  if (SRRemoteAuthorizationPromptViewControllerClass && SRAuthorizationPromptPresentationControllerClass) {
    return 1;
  }
  if (qword_26AB1A110 != -1) {
    dispatch_once(&qword_26AB1A110, &__block_literal_global_8);
  }
  uint64_t v5 = _MergedGlobals_7;
  if (os_log_type_enabled((os_log_t)_MergedGlobals_7, OS_LOG_TYPE_ERROR))
  {
    __int16 v9 = 0;
    uint64_t v6 = "Failed to find required classes";
    int v7 = (uint8_t *)&v9;
LABEL_16:
    _os_log_error_impl(&dword_21FCA3000, v5, OS_LOG_TYPE_ERROR, v6, v7, 2u);
  }
LABEL_12:
  if (!*a1) {
    return 0;
  }
  uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:SRErrorDomain code:8194 userInfo:0];
  uint64_t result = 0;
  *a1 = v8;
  return result;
}

uint64_t getSRRemoteAuthorizationPromptViewControllerClass()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x3052000000;
  uint64_t v6 = __Block_byref_object_copy__1;
  int v7 = __Block_byref_object_dispose__1;
  uint64_t v0 = getSRRemoteAuthorizationPromptViewControllerClass_softClass;
  uint64_t v8 = getSRRemoteAuthorizationPromptViewControllerClass_softClass;
  if (!getSRRemoteAuthorizationPromptViewControllerClass_softClass)
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __getSRRemoteAuthorizationPromptViewControllerClass_block_invoke;
    v2[3] = &unk_26452E210;
    v2[4] = &v3;
    __getSRRemoteAuthorizationPromptViewControllerClass_block_invoke((uint64_t)v2);
    uint64_t v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_21FCC6CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t getSRAuthorizationPromptPresentationControllerClass()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x3052000000;
  uint64_t v6 = __Block_byref_object_copy__1;
  int v7 = __Block_byref_object_dispose__1;
  uint64_t v0 = getSRAuthorizationPromptPresentationControllerClass_softClass;
  uint64_t v8 = getSRAuthorizationPromptPresentationControllerClass_softClass;
  if (!getSRAuthorizationPromptPresentationControllerClass_softClass)
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __getSRAuthorizationPromptPresentationControllerClass_block_invoke;
    v2[3] = &unk_26452E210;
    v2[4] = &v3;
    __getSRAuthorizationPromptPresentationControllerClass_block_invoke((uint64_t)v2);
    uint64_t v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_21FCC6DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __SRRequestAuthorizationForServices_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v4 = (void *)[*(id *)(a1 + 32) sharedInstance];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __SRRequestAuthorizationForServices_block_invoke_2;
    v11[3] = &unk_26452E1D0;
    v11[4] = *(void *)(a1 + 56);
    return [v4 presentPromptViewController:a2 withDesiredServices:v5 bundleIdentifier:v6 completionHandler:v11];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:SRErrorDomain code:8194 userInfo:0];
    __int16 v10 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 16);
    return v10(v8, v9);
  }
}

uint64_t __SRRequestAuthorizationForServices_block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = (void *)[a2 domain];
    if (([v3 isEqualToString:SRErrorDomain] & 1) == 0) {
      [MEMORY[0x263F087E8] errorWithDomain:SRErrorDomain code:8194 userInfo:0];
    }
  }
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v4();
}

uint64_t SRRequestAuthorizationForServicesWithBundle(void *a1, uint64_t a2, uint64_t a3)
{
  if (qword_26AB1A110 != -1) {
    dispatch_once(&qword_26AB1A110, &__block_literal_global_8);
  }
  uint64_t v6 = _MergedGlobals_7;
  if (os_log_type_enabled((os_log_t)_MergedGlobals_7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_21FCA3000, v6, OS_LOG_TYPE_ERROR, "Please call +[SRSensorReader requestAuthorizationForBundle:services] instead", buf, 2u);
  }
  verifyPlist(a1, a2);
  uint64_t v7 = [a1 bundleIdentifier];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __SRRequestAuthorizationForServicesWithBundle_block_invoke;
  v9[3] = &unk_26452E1D0;
  v9[4] = a3;
  return SRRequestAuthorizationForServices(v7, a2, (uint64_t)v9);
}

uint64_t verifyPlist(void *a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v5 = 0;
  uint64_t result = objc_msgSend(a1, "_sr_validateRequiredFieldsForSensors:error:", a2, &v5);
  if ((result & 1) == 0)
  {
    uint64_t v3 = (void *)[v5 description];
    if (qword_26AB1A110 != -1) {
      dispatch_once(&qword_26AB1A110, &__block_literal_global_8);
    }
    uint64_t v4 = _MergedGlobals_7;
    if (os_log_type_enabled((os_log_t)_MergedGlobals_7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v7 = v3;
      _os_log_fault_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_FAULT, "%{public}@", buf, 0xCu);
    }
    [v3 UTF8String];
    _os_crash();
    __break(1u);
  }
  return result;
}

uint64_t __SRRequestAuthorizationForServicesWithBundle_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)[a2 domain];
  if ([v4 isEqualToString:SRErrorDomain]) {
    [a2 code];
  }
  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v5();
}

uint64_t SRRequestAuthorizationWithBundleForServices(void *a1, uint64_t a2, uint64_t a3)
{
  verifyPlist(a1, a2);
  uint64_t v6 = [a1 bundleIdentifier];

  return SRRequestAuthorizationForServices(v6, a2, a3);
}

uint64_t SRShowAppsAndStudiesUsingSensorKit(uint64_t a1)
{
  uint64_t v8 = 0;
  if (verifyRequestedClassesWithError(&v8))
  {
    uint64_t SRRemoteAuthorizationPromptViewControllerClass = (void *)getSRRemoteAuthorizationPromptViewControllerClass();
    uint64_t SRAuthorizationPromptPresentationControllerClass = getSRAuthorizationPromptPresentationControllerClass();
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __SRShowAppsAndStudiesUsingSensorKit_block_invoke;
    v7[3] = &unk_26452E800;
    v7[4] = SRAuthorizationPromptPresentationControllerClass;
    v7[5] = a1;
    return [SRRemoteAuthorizationPromptViewControllerClass requestViewControllerWithCompletionHandler:v7];
  }
  else
  {
    uint64_t v5 = v8;
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 16);
    return v6(a1, v5);
  }
}

uint64_t __SRShowAppsAndStudiesUsingSensorKit_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v4 = (void *)[*(id *)(a1 + 32) sharedInstance];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __SRShowAppsAndStudiesUsingSensorKit_block_invoke_2;
    v9[3] = &unk_26452E1D0;
    v9[4] = *(void *)(a1 + 40);
    return [v4 presentAppsAndStudiesPromptViewController:a2 completionHandler:v9];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = [MEMORY[0x263F087E8] errorWithDomain:SRErrorDomain code:8194 userInfo:0];
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 16);
    return v8(v6, v7);
  }
}

uint64_t __SRShowAppsAndStudiesUsingSensorKit_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a2)
  {
    if (qword_26AB1A110 != -1) {
      dispatch_once(&qword_26AB1A110, &__block_literal_global_8);
    }
    uint64_t v4 = _MergedGlobals_7;
    if (os_log_type_enabled((os_log_t)_MergedGlobals_7, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      uint64_t v7 = a2;
      _os_log_error_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_ERROR, "Error presenting apps and studies view because %{public}@", (uint8_t *)&v6, 0xCu);
    }
    [MEMORY[0x263F087E8] errorWithDomain:SRErrorDomain code:8194 userInfo:0];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t SRShowStudyAuthorization(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = 0;
  if (verifyRequestedClassesWithError(&v10))
  {
    uint64_t SRRemoteAuthorizationPromptViewControllerClass = (void *)getSRRemoteAuthorizationPromptViewControllerClass();
    uint64_t SRAuthorizationPromptPresentationControllerClass = getSRAuthorizationPromptPresentationControllerClass();
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __SRShowStudyAuthorization_block_invoke;
    v9[3] = &unk_26452E828;
    void v9[5] = a1;
    v9[6] = a2;
    v9[4] = SRAuthorizationPromptPresentationControllerClass;
    return [SRRemoteAuthorizationPromptViewControllerClass requestViewControllerWithCompletionHandler:v9];
  }
  else
  {
    uint64_t v7 = v10;
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 16);
    return v8(a2, v7);
  }
}

uint64_t __SRShowStudyAuthorization_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v4 = (void *)[*(id *)(a1 + 32) sharedInstance];
    uint64_t v5 = [*(id *)(a1 + 40) bundlePath];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __SRShowStudyAuthorization_block_invoke_2;
    v10[3] = &unk_26452E1D0;
    v10[4] = *(void *)(a1 + 48);
    return [v4 presentStudyAuthorizationPromptViewController:a2 bundlePath:v5 completionHandler:v10];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:SRErrorDomain code:8194 userInfo:0];
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 16);
    return v9(v7, v8);
  }
}

uint64_t __SRShowStudyAuthorization_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a2)
  {
    if (qword_26AB1A110 != -1) {
      dispatch_once(&qword_26AB1A110, &__block_literal_global_8);
    }
    uint64_t v4 = _MergedGlobals_7;
    if (os_log_type_enabled((os_log_t)_MergedGlobals_7, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      uint64_t v7 = a2;
      _os_log_error_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_ERROR, "Error presenting app's authorization view because %{public}@", (uint8_t *)&v6, 0xCu);
    }
    [MEMORY[0x263F087E8] errorWithDomain:SRErrorDomain code:8194 userInfo:0];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t SRShowResearchData(uint64_t a1)
{
  uint64_t v8 = 0;
  if (verifyRequestedClassesWithError(&v8))
  {
    uint64_t SRRemoteAuthorizationPromptViewControllerClass = (void *)getSRRemoteAuthorizationPromptViewControllerClass();
    uint64_t SRAuthorizationPromptPresentationControllerClass = getSRAuthorizationPromptPresentationControllerClass();
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __SRShowResearchData_block_invoke;
    v7[3] = &unk_26452E800;
    v7[4] = SRAuthorizationPromptPresentationControllerClass;
    v7[5] = a1;
    return [SRRemoteAuthorizationPromptViewControllerClass requestViewControllerWithCompletionHandler:v7];
  }
  else
  {
    uint64_t v5 = v8;
    int v6 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 16);
    return v6(a1, v5);
  }
}

uint64_t __SRShowResearchData_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v4 = (void *)[*(id *)(a1 + 32) sharedInstance];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __SRShowResearchData_block_invoke_2;
    v9[3] = &unk_26452E1D0;
    v9[4] = *(void *)(a1 + 40);
    return [v4 presentResearchDataViewController:a2 completionHandler:v9];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = [MEMORY[0x263F087E8] errorWithDomain:SRErrorDomain code:8194 userInfo:0];
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 16);
    return v8(v6, v7);
  }
}

uint64_t __SRShowResearchData_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a2)
  {
    if (qword_26AB1A110 != -1) {
      dispatch_once(&qword_26AB1A110, &__block_literal_global_8);
    }
    uint64_t v4 = _MergedGlobals_7;
    if (os_log_type_enabled((os_log_t)_MergedGlobals_7, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      uint64_t v7 = a2;
      _os_log_error_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_ERROR, "Error presenting Research Data view because %{public}@", (uint8_t *)&v6, 0xCu);
    }
    [MEMORY[0x263F087E8] errorWithDomain:SRErrorDomain code:8194 userInfo:0];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t SRRequestFirstRunOnBoarding(uint64_t a1)
{
  uint64_t v8 = 0;
  if (verifyRequestedClassesWithError(&v8))
  {
    uint64_t SRRemoteAuthorizationPromptViewControllerClass = (void *)getSRRemoteAuthorizationPromptViewControllerClass();
    uint64_t SRAuthorizationPromptPresentationControllerClass = getSRAuthorizationPromptPresentationControllerClass();
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __SRRequestFirstRunOnBoarding_block_invoke;
    v7[3] = &unk_26452E800;
    v7[4] = SRAuthorizationPromptPresentationControllerClass;
    v7[5] = a1;
    return [SRRemoteAuthorizationPromptViewControllerClass requestViewControllerWithCompletionHandler:v7];
  }
  else
  {
    uint64_t v5 = v8;
    int v6 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 16);
    return v6(a1, v5);
  }
}

uint64_t __SRRequestFirstRunOnBoarding_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v4 = (void *)[*(id *)(a1 + 32) sharedInstance];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __SRRequestFirstRunOnBoarding_block_invoke_2;
    v9[3] = &unk_26452E1D0;
    v9[4] = *(void *)(a1 + 40);
    return [v4 presentFirstRunOnboardingViewController:a2 completionHandler:v9];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = [MEMORY[0x263F087E8] errorWithDomain:SRErrorDomain code:8194 userInfo:0];
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 16);
    return v8(v6, v7);
  }
}

uint64_t __SRRequestFirstRunOnBoarding_block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = (void *)[a2 domain];
    if (([v3 isEqualToString:SRErrorDomain] & 1) == 0) {
      [MEMORY[0x263F087E8] errorWithDomain:SRErrorDomain code:8194 userInfo:0];
    }
  }
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v4();
}

uint64_t SRRequestAuthorizationMigrationForServices(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v12 = 0;
  if (verifyRequestedClassesWithError(&v12))
  {
    verifyPlist(a1, a2);
    uint64_t SRRemoteAuthorizationPromptViewControllerClass = (void *)getSRRemoteAuthorizationPromptViewControllerClass();
    uint64_t SRAuthorizationPromptPresentationControllerClass = getSRAuthorizationPromptPresentationControllerClass();
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __SRRequestAuthorizationMigrationForServices_block_invoke;
    v11[3] = &unk_26452E7D8;
    v11[4] = SRAuthorizationPromptPresentationControllerClass;
    void v11[5] = a2;
    v11[6] = a1;
    v11[7] = a3;
    return [SRRemoteAuthorizationPromptViewControllerClass requestViewControllerWithCompletionHandler:v11];
  }
  else
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 16);
    return v10(a3, v9);
  }
}

uint64_t __SRRequestAuthorizationMigrationForServices_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v4 = (void *)[*(id *)(a1 + 32) sharedInstance];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = [*(id *)(a1 + 48) bundleIdentifier];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __SRRequestAuthorizationMigrationForServices_block_invoke_2;
    v11[3] = &unk_26452E1D0;
    v11[4] = *(void *)(a1 + 56);
    return [v4 presentMigrationPromptViewController:a2 withDesiredServices:v5 bundleIdentifier:v6 completionHandler:v11];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:SRErrorDomain code:8194 userInfo:0];
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 16);
    return v10(v8, v9);
  }
}

uint64_t __SRRequestAuthorizationMigrationForServices_block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = (void *)[a2 domain];
    if (([v3 isEqualToString:SRErrorDomain] & 1) == 0) {
      [MEMORY[0x263F087E8] errorWithDomain:SRErrorDomain code:8194 userInfo:0];
    }
  }
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v4();
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

Class __getSRRemoteAuthorizationPromptViewControllerClass_block_invoke(uint64_t a1)
{
  SensorKitUILibrary();
  Class result = objc_getClass("SRRemoteAuthorizationPromptViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    getSRRemoteAuthorizationPromptViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 40);
  }
  else
  {
    uint64_t v3 = (void *)[MEMORY[0x263F08690] currentHandler];
    Class result = (Class)objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getSRRemoteAuthorizationPromptViewControllerClass(void)_block_invoke"), @"SRAuthorizationPrompt.m", 24, @"Unable to find class %s", "SRRemoteAuthorizationPromptViewController");
    __break(1u);
  }
  return result;
}

void SensorKitUILibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!SensorKitUILibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __SensorKitUILibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_26452E848;
    uint64_t v5 = 0;
    SensorKitUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SensorKitUILibraryCore_frameworkLibrary)
  {
    BOOL v1 = (void *)[MEMORY[0x263F08690] currentHandler];
    uint64_t v2 = [NSString stringWithUTF8String:"void *SensorKitUILibrary(void)"];
    uint64_t v0 = objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"SRAuthorizationPrompt.m", 22, @"%s", v3[0]);
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v0 = v3[0];
  if (v3[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __SensorKitUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SensorKitUILibraryCore_frameworkLibrary = result;
  return result;
}

Class __getSRAuthorizationPromptPresentationControllerClass_block_invoke(uint64_t a1)
{
  SensorKitUILibrary();
  Class result = objc_getClass("SRAuthorizationPromptPresentationController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    getSRAuthorizationPromptPresentationControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                              + 40);
  }
  else
  {
    uint64_t v3 = (void *)[MEMORY[0x263F08690] currentHandler];
    Class result = (Class)objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getSRAuthorizationPromptPresentationControllerClass(void)_block_invoke"), @"SRAuthorizationPrompt.m", 25, @"Unable to find class %s", "SRAuthorizationPromptPresentationController");
    __break(1u);
  }
  return result;
}

os_log_t __SRLogAuthorizationPrompt_block_invoke()
{
  os_log_t result = os_log_create("com.apple.SensorKit", "AuthorizationPrompt");
  _MergedGlobals_7 = (uint64_t)result;
  return result;
}

SRAbsoluteTime SRAbsoluteTimeGetCurrent(void)
{
  uint64_t v0 = mach_continuous_time();

  return SRAbsoluteTimeFromContinuousTime(v0);
}

SRAbsoluteTime SRAbsoluteTimeFromContinuousTime(uint64_t cont)
{
  if (_syncToken != -1) {
    dispatch_once(&_syncToken, &__block_literal_global_9);
  }
  if (_contStart >= cont) {
    double v2 = -1.0;
  }
  else {
    double v2 = 1.0;
  }
  double v3 = *(double *)&_rtcStart + *(double *)&_remoteRTCOffset;
  TMConvertTicksToSeconds();
  return v3 + v4 * v2;
}

uint64_t __SRAbsoluteTimeFromContinuousTime_block_invoke()
{
  uint64_t v0 = mach_continuous_time();
  _rtcStart = MEMORY[0x223C5D430]();
  uint64_t result = mach_continuous_time();
  _contStart = v0 + ((result - v0) >> 1);
  return result;
}

uint64_t SRAbsoluteTimeGetOffsets(uint64_t result, void *a2)
{
  if (result)
  {
    double v3 = (double *)result;
    double v4 = *(double *)&_rtcStart;
    uint64_t result = TMConvertTicksToSeconds();
    *double v3 = v4 - v5;
  }
  if (a2)
  {
    uint64_t result = mach_get_times();
    *a2 = 0;
  }
  return result;
}

CFAbsoluteTime SRAbsoluteTimeToCFAbsoluteTime(SRAbsoluteTime sr)
{
  return (double)0 / 1000000000.0 + (double)0 - *MEMORY[0x263EFFAF8] - SRAbsoluteTimeFromContinuousTime(0) + sr;
}

SRAbsoluteTime SRAbsoluteTimeFromCFAbsoluteTime(CFAbsoluteTime cf)
{
  mach_get_times();
  double v2 = (double)0 / 1000000000.0 + (double)0 - *MEMORY[0x263EFFAF8];
  return cf - (v2 - SRAbsoluteTimeFromContinuousTime(0));
}

BOOL SRAbsoluteTimeSetSyntheticStartFromRemoteTime(unint64_t a1, unint64_t a2, double a3, uint64_t a4, double *a5)
{
  mach_get_times();
  double v9 = 1.0;
  if (a2 >= a1) {
    double v10 = 1.0;
  }
  else {
    double v10 = -1.0;
  }
  TMConvertTicksToSeconds();
  double v12 = v11 + a3;
  TMConvertTicksToSeconds();
  double v14 = v12 + v10 * v13;
  TMConvertTicksToSeconds();
  double v16 = v14 - v15;
  TMConvertTicksToSeconds();
  double v18 = v16 + v17;
  if (a1 <= _contStart) {
    double v9 = -1.0;
  }
  double v19 = *(double *)&_rtcStart;
  TMConvertTicksToSeconds();
  double v21 = v19 + v20 * v9;
  double v22 = v18 - v21;
  double v23 = v21 + v18 - v21;
  if (v23 > 0.0)
  {
    _remoteRTCOffset = *(void *)&v22;
    if (a5) {
      *a5 = v22;
    }
  }
  return v23 > 0.0;
}

void SRAbsoluteTimeInitWithRemoteRTCOffset(double a1)
{
  _remoteRTCOffset = *(void *)&a1;
}

double SRAbsoluteTimeRoundedDownToNearestInterval(SRAbsoluteTime a1, double a2)
{
  if (a2 == 0.0) {
    double v2 = 1.0;
  }
  else {
    double v2 = a2;
  }
  double v3 = v2 * floor(SRAbsoluteTimeToCFAbsoluteTime(a1) / v2);

  return SRAbsoluteTimeFromCFAbsoluteTime(v3);
}

void sub_21FCCE494(_Unwind_Exception *a1)
{
}

id __sessionUUIDFromSessionIdentifier_block_invoke()
{
  qword_26AB1A130 = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);
  id result = objc_alloc_init(MEMORY[0x263EFF9A0]);
  qword_26AB1A138 = (uint64_t)result;
  _MergedGlobals_8 = 0;
  return result;
}

uint64_t __cullOldSessions_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend((id)objc_msgSend((id)qword_26AB1A130, "objectForKeyedSubscript:", a2), "doubleValue");
  double v5 = v4;
  objc_msgSend((id)objc_msgSend((id)qword_26AB1A130, "objectForKeyedSubscript:", a3), "doubleValue");
  if (v6 >= v5) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = -1;
  }
  if (v5 < v6) {
    return 1;
  }
  else {
    return v7;
  }
}

uint64_t __SRAuthorizationStatusForBundleIdentifierWithConnection_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (qword_26AB1A148 != -1) {
    dispatch_once(&qword_26AB1A148, &__block_literal_global_11);
  }
  double v4 = _MergedGlobals_9;
  if (os_log_type_enabled((os_log_t)_MergedGlobals_9, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    uint64_t v7 = a2;
    _os_log_error_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_ERROR, "Couldn't connect to com.apple.SensorKitAppHelper because %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __SRAuthorizationStatusForBundleIdentifierWithConnection_block_invoke_1(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t SRAuthorizationStatusForBundleIdentifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.SensorKitAppHelper"];
  objc_msgSend(v6, "setRemoteObjectInterface:", objc_msgSend(MEMORY[0x263F08D80], "interfaceWithProtocol:", &unk_26D1815F8));
  [v6 resume];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __SRAuthorizationStatusForBundleIdentifierWithConnection_block_invoke;
  v11[3] = &unk_26452E1D0;
  v11[4] = &v9;
  uint64_t v7 = objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v11, MEMORY[0x263EF8330], 3221225472, __SRAuthorizationStatusForBundleIdentifier_block_invoke, &unk_26452ECF0, v6, a3);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __SRAuthorizationStatusForBundleIdentifierWithConnection_block_invoke_1;
  v10[3] = &unk_26452ECC8;
  v10[4] = &v9;
  return [v7 authorizationRequestStatusForBundleId:a1 sensors:a2 reply:v10];
}

void __SRAuthorizationStatusForBundleIdentifier_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
  double v2 = *(void **)(a1 + 32);
}

uint64_t __SRAuthorizationResetWithConnection_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (qword_26AB1A148 != -1) {
    dispatch_once(&qword_26AB1A148, &__block_literal_global_11);
  }
  double v4 = _MergedGlobals_9;
  if (os_log_type_enabled((os_log_t)_MergedGlobals_9, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    uint64_t v7 = a2;
    _os_log_error_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_ERROR, "Couldn't connect to com.apple.SensorKitAppHelper because %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __SRAuthorizationResetWithConnection_block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t SRAuthorizationResetWithCompletionHandler(void *a1, uint64_t a2)
{
  double v4 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.SensorKitAppHelper"];
  objc_msgSend(v4, "setRemoteObjectInterface:", objc_msgSend(MEMORY[0x263F08D80], "interfaceWithProtocol:", &unk_26D1815F8));
  [v4 resume];
  uint64_t v5 = [a1 bundleIdentifier];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __SRAuthorizationResetWithConnection_block_invoke;
  v10[3] = &unk_26452E1D0;
  v10[4] = &v8;
  int v6 = objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v10, MEMORY[0x263EF8330], 3221225472, __SRAuthorizationResetWithCompletionHandler_block_invoke, &unk_26452E040, v4, a2);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __SRAuthorizationResetWithConnection_block_invoke_11;
  v9[3] = &unk_26452E1D0;
  v9[4] = &v8;
  return [v6 resetAuthorizationsForBundleId:v5 reply:v9];
}

void __SRAuthorizationResetWithCompletionHandler_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
  double v2 = *(void **)(a1 + 32);
}

uint64_t __SRAuthorizationFetchSnapshotWithProxy_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t SRAuthorizationFetchSnapshot(uint64_t a1)
{
  double v2 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.SensorKitAppHelper"];
  objc_msgSend(v2, "setRemoteObjectInterface:", objc_msgSend(MEMORY[0x263F08D80], "interfaceWithProtocol:", &unk_26D1815F8));
  [v2 resume];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __SRAuthorizationFetchSnapshot_block_invoke;
  v6[3] = &unk_26452E040;
  v6[4] = v2;
  v6[5] = a1;
  double v3 = (void *)[v2 remoteObjectProxyWithErrorHandler:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __SRAuthorizationFetchSnapshot_block_invoke_13;
  v5[3] = &unk_26452ED18;
  v5[4] = v2;
  v5[5] = a1;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __SRAuthorizationFetchSnapshotWithProxy_block_invoke;
  v7[3] = &unk_26452E760;
  v7[4] = v5;
  return [v3 authorizationSnapshotWithReply:v7];
}

void __SRAuthorizationFetchSnapshot_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (qword_26AB1A148 != -1) {
    dispatch_once(&qword_26AB1A148, &__block_literal_global_11);
  }
  double v4 = _MergedGlobals_9;
  if (os_log_type_enabled((os_log_t)_MergedGlobals_9, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    uint64_t v6 = a2;
    _os_log_error_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_ERROR, "Couldn't connect to com.apple.SensorKitAppHelper because %{public}@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
}

void __SRAuthorizationFetchSnapshot_block_invoke_13(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
  double v2 = *(void **)(a1 + 32);
}

uint64_t SRAuthorizationSnapshot(uint64_t a1)
{
  double v2 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.SensorKitAppHelper"];
  objc_msgSend(v2, "setRemoteObjectInterface:", objc_msgSend(MEMORY[0x263F08D80], "interfaceWithProtocol:", &unk_26D1815F8));
  [v2 resume];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __SRAuthorizationSnapshot_block_invoke;
  v6[3] = &unk_26452E040;
  v6[4] = v2;
  v6[5] = a1;
  double v3 = (void *)[v2 synchronousRemoteObjectProxyWithErrorHandler:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __SRAuthorizationSnapshot_block_invoke_14;
  v5[3] = &unk_26452ED18;
  v5[4] = v2;
  v5[5] = a1;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __SRAuthorizationFetchSnapshotWithProxy_block_invoke;
  v7[3] = &unk_26452E760;
  v7[4] = v5;
  return [v3 authorizationSnapshotWithReply:v7];
}

void __SRAuthorizationSnapshot_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (qword_26AB1A148 != -1) {
    dispatch_once(&qword_26AB1A148, &__block_literal_global_11);
  }
  double v4 = _MergedGlobals_9;
  if (os_log_type_enabled((os_log_t)_MergedGlobals_9, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    uint64_t v6 = a2;
    _os_log_error_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_ERROR, "Couldn't connect to com.apple.SensorKitAppHelper because %{public}@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
}

void __SRAuthorizationSnapshot_block_invoke_14(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
  double v2 = *(void **)(a1 + 32);
}

uint64_t SRResetAllAuthorizations()
{
  uint64_t v0 = +[SRAuthorizationStore allSensorsStore];

  return [(SRAuthorizationStore *)v0 resetAllAuthorizations];
}

os_log_t __SRLogAuthorizationSPI_block_invoke()
{
  os_log_t result = os_log_create("com.apple.SensorKit", "AuthorizationSPI");
  _MergedGlobals_9 = (uint64_t)result;
  return result;
}

void sub_21FCD0A04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  objc_destroyWeak(v24);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_21FCD0C38(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FCD10A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FCD154C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_21FCD16A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_21FCD1A28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FCD1B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FCD1D40(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FCD1DFC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FCD1EB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FCD1FE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FCD2070(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FCD24B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *descriptionFromErrorCode(uint64_t a1)
{
  if (a1 >= 4096)
  {
    if (os_variant_has_internal_content())
    {
      if (a1 >= 12288)
      {
        switch(a1)
        {
          case 12288:
            os_log_t result = @"Writer Not Monitoring";
            break;
          case 12289:
            os_log_t result = @"Writer Not Authorized";
            break;
          case 12290:
            os_log_t result = @"Writer Input was invalid";
            break;
          case 12291:
            os_log_t result = @"No available memory mapped to write sample";
            break;
          case 12292:
            os_log_t result = @"Provided sample is out of order from previous samples";
            break;
          case 12293:
            os_log_t result = @"Provided sample is too large";
            break;
          case 12294:
            os_log_t result = @"Framework datastore state is invalid";
            break;
          case 12295:
            os_log_t result = @"Writer does not have explicit authorization";
            break;
          case 12296:
            os_log_t result = @"Provided sample is from the future";
            break;
          default:
            if ((unint64_t)(a1 - 20480) < 5 || a1 != 0x4000) {
              return 0;
            }
            os_log_t result = @"Sensor Configuration is invalid";
            break;
        }
        return result;
      }
      if (a1 >= 0x2000)
      {
        switch(a1)
        {
          case 8192:
            os_log_t result = @"No space available to write samples";
            break;
          case 8193:
            os_log_t result = @"Connection Not Found";
            break;
          case 8194:
            os_log_t result = @"Internal Error";
            break;
          case 8195:
            os_log_t result = @"Prompt Busy";
            break;
          case 8196:
            os_log_t result = @"Prompt is cancelled";
            break;
          case 8198:
            os_log_t result = @"No device identifier could be found";
            break;
          case 8199:
            os_log_t result = @"Time synchronization state is invalid";
            break;
          case 8200:
            os_log_t result = @"The requested bundle authorization is being requested for could not be found";
            break;
          case 8201:
            os_log_t result = @"No new authorization groups were requested";
            break;
          default:
            return 0;
        }
        return result;
      }
      switch(a1)
      {
        case 4096:
          return @"Required app is not installed";
        case 4097:
          return @"Required onboarding not completed";
        case 4098:
          return @"Global setting not enabled";
      }
    }
    return 0;
  }
  switch(a1)
  {
    case 0:
      double v3 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      double v4 = @"SRErrorInvalidEntitlement";
      break;
    case 1:
      double v3 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      double v4 = @"SRErrorNoAuthorization";
      break;
    case 2:
      double v3 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      double v4 = @"SRErrorDataInaccessible";
      break;
    case 3:
      double v3 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      double v4 = @"SRErrorFetchRequestInvalid";
      break;
    case 4:
      double v3 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      double v4 = @"SRErrorPromptDeclined";
      break;
    default:
      return 0;
  }

  return (__CFString *)[v3 localizedStringForKey:v4 value:&stru_26D165EC8 table:0];
}

uint64_t recoverySuggestionFromErrorCode(uint64_t a1)
{
  if (a1 == 1)
  {
    BOOL v1 = @"SRErrorNoAuthorizationRecovery";
  }
  else
  {
    if (a1 != 2) {
      return 0;
    }
    BOOL v1 = @"SRErrorDataInaccessibleRecovery";
  }
  double v2 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];

  return [v2 localizedStringForKey:v1 value:&stru_26D165EC8 table:0];
}

void sub_21FCD581C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FCD65D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FCD6810(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_21FCD6A1C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_21FCD6C24(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t __legacyAuthorizationStatusBehavior_block_invoke()
{
  uint64_t result = dyld_program_sdk_at_least();
  _MergedGlobals_11 = result ^ 1;
  return result;
}

uint64_t writeMetadataBytesForFrameStore(SRFramesStoreOffsetEnumerator *a1, const void *a2, size_t a3, SRError **a4, double a5)
{
  if (a1) {
    double v10 = *(double *)&a1[2].super.isa;
  }
  else {
    double v10 = 0.0;
  }
  ClosestMetadataObjectInFrameStore = findClosestMetadataObjectInFrameStore(a1, v10);
  if (ClosestMetadataObjectInFrameStore)
  {
    uint64_t v12 = *((unsigned int *)ClosestMetadataObjectInFrameStore + 4);
    BOOL v13 = v12 && v12 == a3;
    if (v13 && !memcmp(a2, (char *)ClosestMetadataObjectInFrameStore + 20, a3)) {
      return 1;
    }
  }
  if (a1)
  {
    Class isa = a1[1].super.isa;
    if (isa && (uint64_t v15 = *((void *)isa + 2)) != 0)
    {
      uint64_t v16 = *(void *)(v15 + 4);
    }
    else
    {
      unint64_t offset = a1->_offset;
      if (offset) {
        uint64_t v16 = *(void *)(offset + 24) - *(void *)(offset + 16) + 56;
      }
      else {
        uint64_t v16 = 56;
      }
    }
    uint64_t v17 = -[SRFrameStore writeFrameForBytes:length:timestamp:error:]((uint64_t)a1, (const Bytef *)a2, a3, a4, a5);
    Class v19 = a1[1].super.isa;
    if (v19 && (uint64_t v20 = *((void *)v19 + 2)) != 0)
    {
      unint64_t v21 = *(void *)(v20 + 4);
    }
    else
    {
      unint64_t v22 = a1->_offset;
      if (v22) {
        unint64_t v21 = *(void *)(v22 + 24) - *(void *)(v22 + 16) + 56;
      }
      else {
        unint64_t v21 = 56;
      }
    }
    if (v21 >= v16 + a3) {
      -[SRFrameStore sync]((uint64_t *)a1);
    }
  }
  else
  {
    uint64_t v17 = 0;
    if (a4) {
      *a4 = +[SRError errorWithCode:12294];
    }
  }
  return v17;
}

uint64_t fetchMetadataFromFrameStore(SRFramesStoreOffsetEnumerator *a1, uint64_t *a2, uint64_t *a3, double a4)
{
  uint64_t result = (uint64_t)findClosestMetadataObjectInFrameStore(a1, a4);
  uint64_t v9 = 0;
  *a2 = result;
  if (!a1 || !result) {
    goto LABEL_13;
  }
  uint64_t v10 = result + *(unsigned int *)(result + 16) + 20;
  uint64_t result = -[SRFrameStore isValidFrame:]((uint64_t)a1, v10);
  if (!result)
  {
    uint64_t v9 = 0;
LABEL_13:
    *a3 = v9;
    return result;
  }
  *a3 = v10;
  if (v10)
  {
    if (*(double *)v10 != -1.0 && *(double *)v10 <= a4)
    {
      *a2 = v10;
      uint64_t v12 = v10 + *(unsigned int *)(v10 + 16) + 20;
      uint64_t result = -[SRFrameStore isValidFrame:]((uint64_t)a1, v12);
      if (result) {
        uint64_t v9 = v12;
      }
      else {
        uint64_t v9 = 0;
      }
      goto LABEL_13;
    }
  }
  return result;
}

double *findClosestMetadataObjectInFrameStore(SRFramesStoreOffsetEnumerator *a1, double a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v4 = -[SRFrameStore enumerateFromOffset:](a1, 0);
  uint64_t v5 = [(SRFramesStoreOffsetEnumerator *)v4 countByEnumeratingWithState:&v16 objects:v28 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = 0;
  uint64_t v8 = *(void *)v17;
LABEL_3:
  uint64_t v9 = 0;
  uint64_t v10 = v7;
  while (1)
  {
    if (*(void *)v17 != v8) {
      objc_enumerationMutation(v4);
    }
    uint64_t v7 = *(double **)(*((void *)&v16 + 1) + 8 * v9);
    double v11 = SRLogDatastore;
    if (os_log_type_enabled((os_log_t)SRLogDatastore, OS_LOG_TYPE_DEBUG))
    {
      if (a1) {
        unint64_t offset = a1[1]._offset;
      }
      else {
        unint64_t offset = 0;
      }
      double v13 = *v7;
      *(_DWORD *)buf = 138413058;
      unint64_t v21 = offset;
      __int16 v22 = 2048;
      double v23 = v13;
      __int16 v24 = 2048;
      double v25 = a2;
      __int16 v26 = 2048;
      v27 = v10;
      _os_log_debug_impl(&dword_21FCA3000, v11, OS_LOG_TYPE_DEBUG, "metadata segment: %@, metadata frame time: %f, sample time: %f, current metadata object: %p", buf, 0x2Au);
    }
    if (*v7 > a2) {
      return v10;
    }
    ++v9;
    uint64_t v10 = v7;
    if (v6 == v9)
    {
      uint64_t v14 = -[SRFramesStoreOffsetEnumerator countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v28, 16, *v7);
      uint64_t v6 = v14;
      uint64_t v10 = v7;
      if (v14) {
        goto LABEL_3;
      }
      return v10;
    }
  }
}

void SRMakeSegmentHeader(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  *(_OWORD *)(a1 + 40) = 0u;
  *(_DWORD *)a1 = 1195725633;
  *(void *)(a1 + 4) = a2;
  *(void *)(a1 + 12) = 0;
  *(_DWORD *)(a1 + 20) = a4;
  *(_OWORD *)(a1 + 24) = 0u;
  double v4 = (_OWORD *)(a1 + 24);
  if (a3)
  {
    uint64_t v5 = [a3 UTF8String];
    size_t v6 = strlen((const char *)v5);
    if (v6 >= 0x21)
    {
      size_t v7 = v6;
      uint64_t v8 = SRLogFrameStore;
      if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_ERROR))
      {
        int v11 = 134349312;
        size_t v12 = v7;
        __int16 v13 = 2050;
        uint64_t v14 = 32;
        _os_log_error_impl(&dword_21FCA3000, v8, OS_LOG_TYPE_ERROR, "Segment name is too large to store in the segment header. Truncating the segment name of %{public}zu to %{public}lu", (uint8_t *)&v11, 0x16u);
      }
    }
    long long v9 = *(_OWORD *)(v5 + 16);
    _OWORD *v4 = *(_OWORD *)v5;
    v4[1] = v9;
  }
  else
  {
    uint64_t v10 = SRLogFrameStore;
    if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_21FCA3000, v10, OS_LOG_TYPE_INFO, "No segment name provided for the segment header", (uint8_t *)&v11, 2u);
    }
  }
}

uint64_t memoryMappingsForPermission(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a4;
  v16[1] = *MEMORY[0x263EF8340];
  switch(a1)
  {
    case 2:
      id v6 = -[SRMemoryMapping initWithSize:protection:advice:offset:]([SRMemoryMapping alloc], a4 - 56, 2, 1, 56);
      id v15 = v6;
      size_t v7 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v8 = &v15;
      goto LABEL_6;
    case 1:
      id v11 = -[SRMemoryMapping initWithSize:protection:advice:offset:]([SRMemoryMapping alloc], 56, 2, 1, 0);
      uint64_t v12 = a3 - v5;
      if (!*(void *)(a2 + 4)) {
        uint64_t v5 = 56;
      }
      id v6 = -[SRMemoryMapping initWithSize:protection:advice:offset:]([SRMemoryMapping alloc], v12, 2, 2, v5);
      v14[0] = v11;
      v14[1] = v6;
      uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];

      goto LABEL_10;
    case 0:
      id v6 = -[SRMemoryMapping initWithSize:protection:advice:offset:]([SRMemoryMapping alloc], a4 - 56, 1, 1, 56);
      v16[0] = v6;
      size_t v7 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v8 = (id *)v16;
LABEL_6:
      uint64_t v4 = [v7 arrayWithObjects:v8 count:1];
LABEL_10:

      break;
  }
  return v4;
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CMTimeRangeCopyDescription(CFAllocatorRef allocator, CMTimeRange *range)
{
  return (CFStringRef)MEMORY[0x270EE7EA0](allocator, range);
}

uint64_t CVAFaceTrackingCopySemantics()
{
  return MEMORY[0x270F0CED8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSUInteger NSPageSize(void)
{
  return MEMORY[0x270EF2B78]();
}

NSUInteger NSRoundDownToMultipleOfPageSize(NSUInteger bytes)
{
  return MEMORY[0x270EF2BC8](bytes);
}

NSUInteger NSRoundUpToMultipleOfPageSize(NSUInteger bytes)
{
  return MEMORY[0x270EF2BD0](bytes);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t TCCAccessCheckAuditToken()
{
  return MEMORY[0x270F795A8]();
}

uint64_t TCCAccessCopyBundleIdentifiersDisabledForService()
{
  return MEMORY[0x270F795B0]();
}

uint64_t TCCAccessCopyBundleIdentifiersForService()
{
  return MEMORY[0x270F795B8]();
}

uint64_t TCCAccessCopyInformationForBundleId()
{
  return MEMORY[0x270F795D8]();
}

uint64_t TCCAccessGetOverride()
{
  return MEMORY[0x270F795E8]();
}

uint64_t TCCAccessPreflight()
{
  return MEMORY[0x270F79600]();
}

uint64_t TCCAccessReset()
{
  return MEMORY[0x270F79628]();
}

uint64_t TCCAccessResetForBundleId()
{
  return MEMORY[0x270F79638]();
}

uint64_t TCCAccessSetForBundleId()
{
  return MEMORY[0x270F79660]();
}

uint64_t TCCAccessSetOverride()
{
  return MEMORY[0x270F79670]();
}

uint64_t TMConvertTicksToSeconds()
{
  return MEMORY[0x270F23978]();
}

uint64_t TMGetKernelMonotonicClock()
{
  return MEMORY[0x270F23988]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
}

uint64_t _os_crash()
{
  return MEMORY[0x270ED8060]();
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

void abort(void)
{
}

uLong adler32(uLong adler, const Bytef *buf, uInt len)
{
  return MEMORY[0x270F9C668](adler, buf, *(void *)&len);
}

uLong adler32_z(uLong adler, const Bytef *buf, z_size_t len)
{
  return MEMORY[0x270F9C670](adler, buf, len);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x270ED9718]();
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x270EDA170]();
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x270EDA320](a1, a2, *(void *)&a3);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x270EDA4B8](__s, __smax, *(void *)&__c, __n);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int msync(void *a1, size_t a2, int a3)
{
  return MEMORY[0x270EDA5E0](a1, a2, *(void *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

double nan(const char *a1)
{
  MEMORY[0x270EDA600](a1);
  return result;
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
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

void objc_end_catch(void)
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

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x270F9A6A0](location);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
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

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

int uname(utsname *a1)
{
  return MEMORY[0x270EDB998](a1);
}