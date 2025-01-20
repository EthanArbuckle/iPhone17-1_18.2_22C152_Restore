uint64_t CAMApplicationMain(int a1, char **a2)
{
  objc_class *v4;
  NSString *v5;
  objc_class *v6;
  NSString *v7;
  uint64_t v8;

  CAMSignpostWithIDAndArgs(1, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  +[CAMCaptureEngine preheatCaptureResources];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = UIApplicationMain(a1, a2, v5, v7);

  return v8;
}

id _prewarmAVCaptureSession()
{
  if (_prewarmAVCaptureSession_onceToken != -1) {
    dispatch_once(&_prewarmAVCaptureSession_onceToken, &__block_literal_global_47);
  }
  v0 = (void *)prewarmedAVCaptureSession;
  return v0;
}

void ___prewarmAVCaptureSession_block_invoke()
{
  CAMSignpostWithIDAndArgs(93, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  id v0 = objc_alloc_init(MEMORY[0x263EFA638]);
  v1 = (void *)prewarmedAVCaptureSession;
  prewarmedAVCaptureSession = (uint64_t)v0;

  CAMSignpostWithIDAndArgs(94, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
}

void sub_2099FFA68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209A00860(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void ___prewarmAudioVideoDeviceTypes_block_invoke()
{
  CAMSignpostWithIDAndArgs(91, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  id v0 = [MEMORY[0x263F086E0] mainBundle];
  id v10 = [v0 bundleIdentifier];

  int BoolAnswer = AVGestaltGetBoolAnswer();
  int v2 = AVGestaltGetBoolAnswer();
  int v3 = AVGestaltGetBoolAnswer();
  int v4 = AVGestaltGetBoolAnswer();
  uint64_t v5 = 6;
  if ((v2 & v3) != 0) {
    uint64_t v5 = 7;
  }
  uint64_t v6 = 8;
  if (BoolAnswer) {
    uint64_t v6 = 2;
  }
  if (v2) {
    uint64_t v6 = 4;
  }
  if (v3) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = v6;
  }
  prewarmedVideoDevicePosition = +[CAMCaptureConversions AVDevicePositionForCAMDevicePosition:BoolAnswer ^ 1u];
  uint64_t v8 = +[CAMCaptureConversions AVCaptureDeviceTypeForCAMCaptureDevice:v7];
  v9 = (void *)prewarmedVideoDeviceType;
  prewarmedVideoDeviceType = v8;

  if (!prewarmedVideoDeviceType) {
    objc_storeStrong((id *)&prewarmedVideoDeviceType, (id)*MEMORY[0x263EF9670]);
  }
  if (([v10 isEqualToString:@"com.apple.camera"] & 1) != 0
    || ([v10 isEqualToString:@"com.apple.camera.lockscreen"] & 1) != 0)
  {
    if (!v4) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if ([v10 isEqualToString:@"com.apple.camera.CameraMessagesApp"] & v4) {
LABEL_15:
  }
    objc_storeStrong((id *)&prewarmedAudioDeviceType, (id)*MEMORY[0x263EF9690]);
LABEL_16:
  CAMSignpostWithIDAndArgs(92, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
}

void ___prewarmAudioVideoDevices_block_invoke()
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  CAMSignpostWithIDAndArgs(87, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  id v0 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v1 = v0;
  if (prewarmedVideoDeviceType) {
    objc_msgSend(v0, "addObject:");
  }
  if (prewarmedAudioDeviceType) {
    objc_msgSend(v1, "addObject:");
  }
  v18 = v1;
  [MEMORY[0x263EFA5A8] discoverySessionWithDeviceTypes:v1 mediaType:0 position:0];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v17 = long long v22 = 0u;
  int v2 = [v17 devices];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v19 + 1) + 8 * v6);
        if (prewarmedVideoDeviceType)
        {
          uint64_t v8 = [*(id *)(*((void *)&v19 + 1) + 8 * v6) deviceType];
          if ([v8 isEqualToString:prewarmedVideoDeviceType])
          {
            uint64_t v9 = [v7 position];
            uint64_t v10 = prewarmedVideoDevicePosition;

            if (v9 == v10)
            {
              v11 = &prewarmedVideoDevice;
              v12 = &prewarmedVideoDeviceInput;
LABEL_18:
              objc_storeStrong((id *)v11, v7);
              uint64_t v15 = [MEMORY[0x263EFA5B8] deviceInputWithDevice:v7 error:0];
              v16 = (void *)*v12;
              uint64_t *v12 = v15;

              goto LABEL_19;
            }
          }
          else
          {
          }
        }
        if (prewarmedAudioDeviceType)
        {
          v13 = [v7 deviceType];
          int v14 = [v13 isEqualToString:prewarmedAudioDeviceType];

          if (v14)
          {
            v11 = &prewarmedAudioDevice;
            v12 = &prewarmedAudioDeviceInput;
            goto LABEL_18;
          }
        }
LABEL_19:
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v4);
  }

  CAMSignpostWithIDAndArgs(88, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
}

void sub_209A01430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209A017D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209A022D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CAMIsSmallPhone()
{
  if (CAMIsSmallPhone_onceToken != -1) {
    dispatch_once(&CAMIsSmallPhone_onceToken, &__block_literal_global_51);
  }
  return CAMIsSmallPhone_isSmallPhone;
}

void __CAMIsSmallPhone_block_invoke()
{
  id v3 = [MEMORY[0x263F82B60] mainScreen];
  [v3 _referenceBounds];
  BOOL v1 = v0 == 568.0;
  if (v2 != 320.0) {
    BOOL v1 = 0;
  }
  CAMIsSmallPhone_isSmallPhone = v1;
}

void sub_209A04274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v7);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__18(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__19(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__20(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__21(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__22(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__23(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__24(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__25(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__26(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__27(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__28(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__29(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__30(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__31(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__32(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__33(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__34(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

BOOL CAMIsTallScreen(void *a1)
{
  BOOL v1 = [a1 currentMode];
  double v2 = v1;
  if (v1)
  {
    [v1 size];
    BOOL v5 = v4 / v3 >= 1.70000005;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

void CAMShutterButtonSpecForLayoutStyle(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 + 32) = 0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  double v4 = [MEMORY[0x263F82B60] mainScreen];
  [v4 scale];
  double v6 = v5;

  long long v7 = xmmword_209C7AB10;
  long long v8 = xmmword_209C7AB20;
  double v9 = 2.0;
  double v10 = 1.0 / v6;
  switch(a1)
  {
    case 0:
    case 1:
    case 3:
      goto LABEL_4;
    case 2:
      double v9 = v10 + 1.0;
      long long v7 = xmmword_209C7AB30;
      long long v8 = xmmword_209C7AB40;
      goto LABEL_4;
    case 4:
      double v9 = v10 + 2.0;
      long long v7 = xmmword_209C7AB50;
      long long v8 = xmmword_209C7AB60;
LABEL_4:
      *(_OWORD *)a2 = v8;
      *(_OWORD *)(a2 + 16) = v7;
      *(double *)(a2 + 32) = v9;
      break;
    default:
      return;
  }
}

id CAMCameraUIFrameworkBundle()
{
  double v0 = (void *)__CAMCameraUIFrameworkBundle;
  if (!__CAMCameraUIFrameworkBundle)
  {
    uint64_t v1 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Camviewfinderv.isa)];
    double v2 = (void *)__CAMCameraUIFrameworkBundle;
    __CAMCameraUIFrameworkBundle = v1;

    double v0 = (void *)__CAMCameraUIFrameworkBundle;
  }
  return v0;
}

void sub_209A08050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209A0991C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v21 - 72));
  _Unwind_Resume(a1);
}

void sub_209A0A214(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

id CAMLocalizedFrameworkString(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  int v14 = __Block_byref_object_copy__27;
  uint64_t v15 = __Block_byref_object_dispose__27;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __CAMLocalizedFrameworkString_block_invoke;
  v8[3] = &unk_263FA4D68;
  double v10 = &v11;
  id v5 = v3;
  id v9 = v5;
  [&unk_26BDE04D8 enumerateObjectsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void sub_209A0A35C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209A0B1D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CAMTimerDurationFormatter()
{
  if (CAMTimerDurationFormatter_onceToken != -1) {
    dispatch_once(&CAMTimerDurationFormatter_onceToken, &__block_literal_global_21);
  }
  double v0 = (void *)CAMTimerDurationFormatter_sharedCountFormatter;
  return v0;
}

uint64_t __CAMTimerDurationFormatter_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  uint64_t v1 = (void *)CAMTimerDurationFormatter_sharedCountFormatter;
  CAMTimerDurationFormatter_sharedCountFormatter = (uint64_t)v0;

  [(id)CAMTimerDurationFormatter_sharedCountFormatter setGeneratesDecimalNumbers:1];
  [(id)CAMTimerDurationFormatter_sharedCountFormatter setNumberStyle:1];
  double v2 = (void *)CAMTimerDurationFormatter_sharedCountFormatter;
  return [v2 setMinimumFractionDigits:0];
}

id CAMTimerCountdownFormatter()
{
  if (CAMTimerCountdownFormatter_onceToken != -1) {
    dispatch_once(&CAMTimerCountdownFormatter_onceToken, &__block_literal_global_12);
  }
  id v0 = (void *)CAMTimerCountdownFormatter_sharedCountFormatter;
  return v0;
}

uint64_t __CAMTimerCountdownFormatter_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  uint64_t v1 = (void *)CAMTimerCountdownFormatter_sharedCountFormatter;
  CAMTimerCountdownFormatter_sharedCountFormatter = (uint64_t)v0;

  [(id)CAMTimerCountdownFormatter_sharedCountFormatter setGeneratesDecimalNumbers:1];
  [(id)CAMTimerCountdownFormatter_sharedCountFormatter setNumberStyle:1];
  double v2 = (void *)CAMTimerCountdownFormatter_sharedCountFormatter;
  return [v2 setMinimumFractionDigits:0];
}

id camSoftLinkQueue()
{
  if (camSoftLinkQueue_camSoftLinkQueueOnceToken != -1) {
    dispatch_once(&camSoftLinkQueue_camSoftLinkQueueOnceToken, &__block_literal_global_8);
  }
  id v0 = (void *)camSoftLinkQueue_camSoftLinkQueue;
  return v0;
}

void __camSoftLinkQueue_block_invoke()
{
  double v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.camera.softlink", v2);
  uint64_t v1 = (void *)camSoftLinkQueue_camSoftLinkQueue;
  camSoftLinkQueue_camSoftLinkQueue = (uint64_t)v0;
}

void sub_209A22998(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_209A23008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_209A28B10(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_209A292B8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_209A2A104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209A2C7B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209A2DF98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209A30720(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_209A352A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

uint64_t __CAMDebugStringForPreviewConfiguration_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (a3) {
    [v4 stringByAppendingFormat:@"/%@", a2];
  }
  else {
  uint64_t v5 = [v4 stringByAppendingFormat:@"%@", a2];
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void *)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  return MEMORY[0x270F9A758](v5, v7);
}

void sub_209A36B14(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_209A36F40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_209A372C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v28 - 96), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
}

void __Block_byref_object_dispose__15(uint64_t a1)
{
}

void __Block_byref_object_dispose__16(uint64_t a1)
{
}

void __Block_byref_object_dispose__17(uint64_t a1)
{
}

void __Block_byref_object_dispose__18(uint64_t a1)
{
}

void __Block_byref_object_dispose__19(uint64_t a1)
{
}

void __Block_byref_object_dispose__20(uint64_t a1)
{
}

void __Block_byref_object_dispose__21(uint64_t a1)
{
}

void __Block_byref_object_dispose__22(uint64_t a1)
{
}

void __Block_byref_object_dispose__23(uint64_t a1)
{
}

void __Block_byref_object_dispose__24(uint64_t a1)
{
}

void __Block_byref_object_dispose__25(uint64_t a1)
{
}

void __Block_byref_object_dispose__26(uint64_t a1)
{
}

void __Block_byref_object_dispose__27(uint64_t a1)
{
}

void __Block_byref_object_dispose__28(uint64_t a1)
{
}

void __Block_byref_object_dispose__29(uint64_t a1)
{
}

void __Block_byref_object_dispose__30(uint64_t a1)
{
}

void __Block_byref_object_dispose__31(uint64_t a1)
{
}

void __Block_byref_object_dispose__32(uint64_t a1)
{
}

void __Block_byref_object_dispose__33(uint64_t a1)
{
}

void __Block_byref_object_dispose__34(uint64_t a1)
{
}

void sub_209A38208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209A3850C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_209A3A0A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209A3A2DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209A3BAC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209A3EC14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209A3F77C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209A40CF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209A416C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209A44A7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209A4693C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209A46D6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209A47290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209A4B84C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209A4BBC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209A4DBB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209A4EA30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209A4F978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209A5E7B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209A5E988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209A62530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209A625F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_209A62B8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

int64_t CAMInterfaceOrientationForWindow(void *a1)
{
  id v1 = a1;
  if ([v1 isRotating]) {
    uint64_t v2 = [v1 _toWindowOrientation];
  }
  else {
    uint64_t v2 = [v1 _windowInterfaceOrientation];
  }
  uint64_t v3 = v2;

  int64_t result = +[CAMApplication appOrPlugInInterfaceOrientation];
  if (v3) {
    BOOL v5 = v1 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5) {
    return v3;
  }
  return result;
}

void sub_209A6D05C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *CAMDebugStringForCaptureDevice(unint64_t a1)
{
  if (a1 > 0xB) {
    return 0;
  }
  else {
    return off_263FA0800[a1];
  }
}

void sub_209A71464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209A71B10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_209A724D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void cam_perform_on_main_asap(void *a1)
{
  id v1 = (void *)MEMORY[0x263F08B88];
  uint64_t v2 = a1;
  if ([v1 isMainThread]) {
    v2[2]();
  }
  else {
    pl_dispatch_async();
  }
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id getBCSDetectedCodeClass()
{
  uint64_t v4 = 0;
  BOOL v5 = &v4;
  uint64_t v6 = 0x2050000000;
  dispatch_queue_t v0 = (void *)getBCSDetectedCodeClass_softClass;
  uint64_t v7 = getBCSDetectedCodeClass_softClass;
  if (!getBCSDetectedCodeClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getBCSDetectedCodeClass_block_invoke;
    v3[3] = &unk_263FA0AB0;
    v3[4] = &v4;
    __getBCSDetectedCodeClass_block_invoke((uint64_t)v3);
    dispatch_queue_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_209A782A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBCSDetectedCodeClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!BarcodeSupportLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __BarcodeSupportLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_263FA0AD0;
    uint64_t v6 = 0;
    BarcodeSupportLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!BarcodeSupportLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("BCSDetectedCode");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    __getBCSDetectedCodeClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getBCSDetectedCodeClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __BarcodeSupportLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  BarcodeSupportLibraryCore_frameworkLibrary = result;
  return result;
}

id NSStringFromCAMPowerAssertionReasonBitfield(unsigned int a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (a1)
  {
    int v3 = 1;
    do
    {
      if (a1)
      {
        uint64_t v4 = NSStringFromCAMPowerAssertionReason(v3);
        [v2 addObject:v4];
      }
      v3 *= 2;
      BOOL v5 = a1 > 1;
      a1 >>= 1;
    }
    while (v5);
  }
  uint64_t v6 = [v2 componentsJoinedByString:@", "];

  return v6;
}

__CFString *NSStringFromCAMPowerAssertionReason(int a1)
{
  if (a1 <= 4095)
  {
    if (a1 > 63)
    {
      if (a1 > 511)
      {
        switch(a1)
        {
          case 512:
            id v1 = @"CAMPowerAssertionReasonPersistenceStillImageRemote";
            break;
          case 1024:
            id v1 = @"CAMPowerAssertionReasonPersistenceStillImageRemoteHDR";
            break;
          case 2048:
            id v1 = @"CAMPowerAssertionReasonPersistenceStillImageRemoteFiltered";
            break;
          default:
            goto LABEL_53;
        }
      }
      else
      {
        switch(a1)
        {
          case 64:
            id v1 = @"CAMPowerAssertionReasonPersistenceStillImageLocalHDR";
            break;
          case 128:
            id v1 = @"CAMPowerAssertionReasonPersistenceStillImageLocalFiltered";
            break;
          case 256:
            id v1 = @"CAMPowerAssertionReasonPersistenceStillImageLocalFilteredHDR";
            break;
          default:
            goto LABEL_53;
        }
      }
    }
    else
    {
      switch(a1)
      {
        case 1:
          id v1 = @"CAMPowerAssertionReasonCaptureStillImage";
          goto LABEL_51;
        case 2:
          id v1 = @"CAMPowerAssertionReasonCaptureVideo";
          goto LABEL_51;
        case 3:
        case 5:
        case 6:
        case 7:
          goto LABEL_53;
        case 4:
          id v1 = @"CAMPowerAssertionReasonCapturePanorama";
          goto LABEL_51;
        case 8:
          id v1 = @"CAMPowerAssertionReasonCapturePanoramaTeardown";
          goto LABEL_51;
        default:
          if (a1 == 16)
          {
            id v1 = @"CAMPowerAssertionReasonBurstAnalysis";
          }
          else
          {
            if (a1 != 32) {
              goto LABEL_53;
            }
            id v1 = @"CAMPowerAssertionReasonPersistenceStillImageLocal";
          }
          break;
      }
    }
    goto LABEL_51;
  }
  if (a1 < 0x20000)
  {
    if (a1 < 0x4000)
    {
      if (a1 == 4096)
      {
        id v1 = @"CAMPowerAssertionReasonPersistenceStillImageRemoteFilteredHDR";
      }
      else
      {
        if (a1 != 0x2000) {
          goto LABEL_53;
        }
        id v1 = @"CAMPowerAssertionReasonPersistenceVideoLocal";
      }
    }
    else
    {
      switch(a1)
      {
        case 0x4000:
          id v1 = @"CAMPowerAssertionReasonPersistenceVideoLocalHDR";
          break;
        case 0x8000:
          id v1 = @"CAMPowerAssertionReasonPersistenceVideoLocalFiltered";
          break;
        case 0x10000:
          id v1 = @"CAMPowerAssertionReasonPersistenceVideoLocalFilteredHDR";
          break;
        default:
          goto LABEL_53;
      }
    }
LABEL_51:
    if (([(__CFString *)v1 hasPrefix:@"CAMPowerAssertionReason"] & 1) == 0) {
      goto LABEL_53;
    }
    goto LABEL_52;
  }
  if (a1 < 0x100000)
  {
    switch(a1)
    {
      case 0x20000:
        id v1 = @"CAMPowerAssertionReasonPersistenceVideoRemote";
        break;
      case 0x40000:
        id v1 = @"CAMPowerAssertionReasonPersistenceVideoRemoteHDR";
        break;
      case 0x80000:
        id v1 = @"CAMPowerAssertionReasonPersistenceVideoRemoteFiltered";
        break;
      default:
        goto LABEL_53;
    }
    goto LABEL_51;
  }
  switch(a1)
  {
    case 0x100000:
      id v1 = @"CAMPowerAssertionReasonPersistenceVideoRemoteFilteredHDR";
      goto LABEL_51;
    case 0x200000:
      id v1 = @"CAMPowerAssertionReasonPersistenceBurstRemote";
      goto LABEL_51;
    case 0x400000:
      id v1 = @"CAMPowerAssertionReasonPersistenceRemoteTimelapsePlaceholder";
      if ([@"CAMPowerAssertionReasonPersistenceRemoteTimelapsePlaceholder" hasPrefix:@"CAMPowerAssertionReason"])
      {
LABEL_52:
        -[__CFString substringFromIndex:](v1, "substringFromIndex:", [@"CAMPowerAssertionReason" length]);
        id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
LABEL_53:
  return v1;
}

void sub_209A7A94C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_209A7E720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209A7E8FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209A80234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209A805D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_209A83714(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_209A83784()
{
}

void sub_209A8378C()
{
}

void sub_209A83D04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

Class __getRPPeopleDiscoveryClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!RapportLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __RapportLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_263FA1060;
    uint64_t v6 = 0;
    RapportLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!RapportLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("RPPeopleDiscovery");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getRPPeopleDiscoveryClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getRPPeopleDiscoveryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __RapportLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  RapportLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_209A85A54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209A87358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CAMSharedLibraryModeIsOn(unint64_t a1)
{
  return (a1 < 5) & (0x16u >> a1);
}

BOOL CAMSharedLibraryModeIsAutoState(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFELL) == 4;
}

uint64_t CAMSharedLibraryModeIsUserState(unint64_t a1)
{
  return (a1 < 6) & (0xCu >> a1);
}

__CFString *CAMSharedLibraryModeDescription(unint64_t a1)
{
  if (a1 > 5) {
    return @"unknown";
  }
  else {
    return off_263FA11C8[a1];
  }
}

void sub_209A89F94(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_209A8A704(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_209A8AFBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id CAMPortraitModeInstructionLabelMeasurementFormatter()
{
  if (CAMPortraitModeInstructionLabelMeasurementFormatter_onceToken != -1) {
    dispatch_once(&CAMPortraitModeInstructionLabelMeasurementFormatter_onceToken, &__block_literal_global_7);
  }
  dispatch_queue_t v0 = (void *)CAMPortraitModeInstructionLabelMeasurementFormatter_sharedFormatter;
  return v0;
}

void __CAMPortraitModeInstructionLabelMeasurementFormatter_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08988]);
  uint64_t v1 = (void *)CAMPortraitModeInstructionLabelMeasurementFormatter_sharedFormatter;
  CAMPortraitModeInstructionLabelMeasurementFormatter_sharedFormatter = (uint64_t)v0;

  [(id)CAMPortraitModeInstructionLabelMeasurementFormatter_sharedFormatter setUnitOptions:1];
  [(id)CAMPortraitModeInstructionLabelMeasurementFormatter_sharedFormatter setUnitStyle:3];
  id v2 = [(id)CAMPortraitModeInstructionLabelMeasurementFormatter_sharedFormatter numberFormatter];
  [v2 setMinimumFractionDigits:0];
  [v2 setMaximumFractionDigits:1];
  [v2 setRoundingMode:2];
  [v2 setRoundingIncrement:&unk_26BDDF218];
}

double PLScaledSize(int a1, int a2, int a3, uint64_t a4, double a5, double a6, double a7, double a8)
{
  if (a5 > a6) {
    int v8 = a1;
  }
  else {
    int v8 = 0;
  }
  BOOL v9 = a7 < a8;
  if ((v8 & v9) != 0) {
    double v10 = a8;
  }
  else {
    double v10 = a7;
  }
  if ((v8 & v9) == 0) {
    a7 = a8;
  }
  double v11 = rint(a5 * a7 / a6);
  double v12 = rint(a6 * v10 / a5);
  if (a6 * v10 <= a5 * a7 == a3) {
    double v10 = v11;
  }
  else {
    a7 = v12;
  }
  if (a2)
  {
    BOOL v13 = a7 > a6;
    if (v10 > a5) {
      BOOL v13 = 1;
    }
    if (v13)
    {
      a7 = a6;
      double v10 = a5;
    }
  }
  if (a4 < 1) {
    return v10;
  }
  double v14 = (double)a4;
  if (a7 <= (double)a4 && v10 <= v14) {
    return v10;
  }
  if (v10 <= a7) {
    return rint(a5 * v14 / a6);
  }
  return v14;
}

double PLScaledSizeToFitSize(int a1, int a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  return PLScaledSize(a1, a2, 0, a3, a4, a5, a6, a7);
}

double PLScaledSizeToFillSize(int a1, int a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  return PLScaledSize(a1, a2, 1, a3, a4, a5, a6, a7);
}

id CAMImageWithTextColorFont(void *a1, void *a2, void *a3)
{
  v20[2] = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263F81500];
  v19[0] = *MEMORY[0x263F814F0];
  v19[1] = v5;
  v20[0] = a3;
  v20[1] = a2;
  uint64_t v6 = NSDictionary;
  id v7 = a3;
  id v8 = a2;
  id v9 = a1;
  double v10 = [v6 dictionaryWithObjects:v20 forKeys:v19 count:2];

  double v11 = *MEMORY[0x263F001A8];
  double v12 = *(double *)(MEMORY[0x263F001A8] + 8);
  [v9 sizeWithAttributes:v10];
  UICeilToScale();
  double v14 = v13;
  UICeilToScale();
  double v16 = v15;
  v22.width = v14;
  v22.height = v16;
  UIGraphicsBeginImageContextWithOptions(v22, 0, 0.0);
  objc_msgSend(v9, "drawInRect:withAttributes:", v10, v11, v12, v14, v16);

  v17 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v17;
}

id CAMImageWithColor(void *a1)
{
  id v1 = a1;
  v8.width = 1.0;
  v8.height = 1.0;
  UIGraphicsBeginImageContext(v8);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v3 = v1;
  uint64_t v4 = (CGColor *)[v3 CGColor];

  CGContextSetFillColorWithColor(CurrentContext, v4);
  v9.origin.x = 0.0;
  v9.origin.y = 0.0;
  v9.size.width = 1.0;
  v9.size.height = 1.0;
  CGContextFillRect(CurrentContext, v9);
  uint64_t v5 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v5;
}

void sub_209A8D078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209A8DF20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209A94DBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_209A959FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209A96E74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __CAMDebugStringForCaptureResultSpecifiersSet_block_invoke(uint64_t a1, void *a2)
{
  char v3 = [a2 integerValue];
  if ((v3 & 2) != 0)
  {
    uint64_t v4 = [&stru_26BD78BA0 stringByAppendingString:@"Filtered"];
    if ((v3 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v4 = &stru_26BD78BA0;
  if (v3)
  {
LABEL_5:
    uint64_t v13 = v4;
    uint64_t v5 = [(__CFString *)v4 stringByAppendingString:@"HDR"];

    uint64_t v4 = (__CFString *)v5;
  }
LABEL_6:
  uint64_t v14 = v4;
  if ([(__CFString *)v4 length])
  {
    uint64_t v6 = v14;
  }
  else
  {

    uint64_t v6 = @"None";
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void *)(v7 + 40);
  double v15 = v6;
  if (v8)
  {
    uint64_t v9 = [NSString stringWithFormat:@"%@, %@", v8, v6];
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    double v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  else
  {
    uint64_t v12 = v6;
    double v11 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v12;
  }
}

uint64_t CAMPhotoFormatForPhotoFormatPreference(uint64_t a1, unsigned int a2)
{
  uint64_t result = a2;
  switch(a2)
  {
    case 0u:
    case 1u:
    case 2u:
      return result;
    case 3u:
      uint64_t result = 2;
      break;
    case 4u:
      uint64_t result = 2;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_209AA5114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_209AA96FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209AA9870(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_209AAA390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_209AAB5A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_209AAB66C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_209AAB9A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209AADFE8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 112));
  _Unwind_Resume(a1);
}

void sub_209AB8774(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209ABAD88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id CAMDebugStringForControlDisableReasons(unint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (a1)
  {
    uint64_t v3 = 1;
    do
    {
      if (a1)
      {
        if (v3 > 15)
        {
          if (v3 == 128) {
            uint64_t v5 = @"PurgingDiskSpace";
          }
          else {
            uint64_t v5 = @"UNKNOWN";
          }
          if (v3 == 64) {
            uint64_t v5 = @"ViewfinderOpening";
          }
          if (v3 == 32) {
            uint64_t v6 = @"PhysicalButtonDown";
          }
          else {
            uint64_t v6 = @"UNKNOWN";
          }
          if (v3 == 16) {
            uint64_t v6 = @"ModeDisabled";
          }
          if (v3 <= 63) {
            uint64_t v4 = v6;
          }
          else {
            uint64_t v4 = v5;
          }
        }
        else
        {
          uint64_t v4 = @"UNKNOWN";
          switch(v3)
          {
            case 0:
              uint64_t v4 = @"Enabled";
              break;
            case 1:
              uint64_t v4 = @"CaptureUnavailable";
              break;
            case 2:
              uint64_t v4 = @"OutOfDiskSpace";
              break;
            case 4:
              uint64_t v4 = @"ViewfinderClosed";
              break;
            case 8:
              uint64_t v4 = @"PreventingAdditionalCaptures";
              break;
            default:
              break;
          }
        }
        [v2 addObject:v4];
      }
      v3 *= 2;
      BOOL v7 = a1 > 1;
      a1 >>= 1;
    }
    while (v7);
  }
  uint64_t v8 = [v2 componentsJoinedByString:@", "];

  return v8;
}

void sub_209AC27E4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_209AC5A28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209AC5E44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_209AC5FA8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_209ACBAB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_209AD34BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209AD3950(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_209AD836C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209AD8820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209AD8A80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getBCSAVParsingSessionClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("BCSAVParsingSession");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBCSAVParsingSessionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getBCSAVParsingSessionClass_block_invoke_cold_1();
    BarcodeSupportLibrary();
  }
}

void BarcodeSupportLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!BarcodeSupportLibraryCore_frameworkLibrary_0)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __BarcodeSupportLibraryCore_block_invoke_0;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_263FA23D8;
    uint64_t v3 = 0;
    BarcodeSupportLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  id v0 = (void *)v1[0];
  if (!BarcodeSupportLibraryCore_frameworkLibrary_0)
  {
    id v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __BarcodeSupportLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  BarcodeSupportLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void __getBCSActionClass_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  BarcodeSupportLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("BCSAction");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBCSActionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v10 = (void *)__getBCSActionClass_block_invoke_cold_1();
    OUTLINED_FUNCTION_0_1(v10, v11, v12, v13, v14, v15, v16, v17, a9);
  }
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_209ADE0A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *CAMDebugStringForCaptureResultSpecifiers(char a1)
{
  if ((a1 & 2) != 0)
  {
    long long v2 = [&stru_26BD78BA0 stringByAppendingString:@"Filtered"];
    if ((a1 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  long long v2 = &stru_26BD78BA0;
  if (a1)
  {
LABEL_5:
    uint64_t v3 = [(__CFString *)v2 stringByAppendingString:@"HDR"];

    long long v2 = (__CFString *)v3;
  }
LABEL_6:
  if (![(__CFString *)v2 length])
  {

    long long v2 = @"None";
  }
  return v2;
}

void sub_209ADFD14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209AE0914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209AE11E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CAMLibrarySelectionIdentityMatch(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 phoneNumber];
  uint64_t v6 = [v4 phoneNumber];
  char v7 = [v5 isEqual:v6];

  if ((v7 & 1) != 0
    || ([v3 emailAddress],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 emailAddress],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v8 isEqual:v9],
        v9,
        v8,
        (v10 & 1) != 0))
  {
    uint64_t v11 = 1;
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v12 = objc_msgSend(v3, "contactIdentifiers", 0);
    uint64_t v11 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v13 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v12);
          }
          uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v16 = [v4 contactIdentifiers];
          LOBYTE(v15) = [v16 containsObject:v15];

          if (v15)
          {
            uint64_t v11 = 1;
            goto LABEL_14;
          }
        }
        uint64_t v11 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  return v11;
}

id CAMLibrarySelectionIdentityDescription(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v3 = [v1 phoneNumber];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    uint64_t v5 = [v1 phoneNumber];
    [v2 addObject:v5];
  }
  uint64_t v6 = [v1 emailAddress];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    uint64_t v8 = [v1 emailAddress];
    [v2 addObject:v8];
  }
  if (![v2 count]) {
    [v2 addObject:@"no handle"];
  }
  uint64_t v9 = NSString;
  char v10 = [v2 componentsJoinedByString:@" - "];
  uint64_t v11 = [v1 contactIdentifiers];
  uint64_t v12 = [v11 componentsJoinedByString:@", "];
  uint64_t v13 = [v9 stringWithFormat:@"%@ (%@)", v10, v12];

  return v13;
}

id CAMLibrarySelectionIdentityContactIdentifiersForIdentities(void *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "contactIdentifiers", (void)v14);
        uint64_t v10 = [v9 count];

        if (v10)
        {
          uint64_t v11 = [v8 contactIdentifiers];
          [v2 addObjectsFromArray:v11];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  uint64_t v12 = [v2 allObjects];

  return v12;
}

void sub_209AE2CCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209AE63B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location)
{
  objc_destroyWeak(v30);
  objc_destroyWeak((id *)(v31 - 144));
  _Unwind_Resume(a1);
}

void sub_209AE67D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

BOOL CAMLocationAccessPendingOrNotDeterminedWithAuthorizationStatus(int a1)
{
  return !a1 || a1 == -1;
}

BOOL CAMCanAccessLocationWithAuthorizationStatus(int a1)
{
  return (a1 - 3) < 2;
}

void sub_209AF0484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose((const void *)(v57 - 240), 8);
  _Block_object_dispose((const void *)(v57 - 192), 8);
  _Unwind_Resume(a1);
}

id CAMTelemetrySignpostsLog()
{
  if (CAMTelemetrySignpostsLog_onceToken != -1) {
    dispatch_once(&CAMTelemetrySignpostsLog_onceToken, &__block_literal_global_13);
  }
  id v0 = (void *)CAMTelemetrySignpostsLog_cameraLogHandle;
  return v0;
}

uint64_t __CAMTelemetrySignpostsLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.camera.signposts", "TelemetrySignposts");
  uint64_t v1 = CAMTelemetrySignpostsLog_cameraLogHandle;
  CAMTelemetrySignpostsLog_cameraLogHandle = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void CAMSignpostWithIDAndArgs(int a1, os_signpost_id_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  kdebug_trace();
  uint64_t v12 = CAMTelemetrySignpostsLog();
  uint64_t v13 = v12;
  switch(a1)
  {
    case 9:
      long long v14 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v15 = v14;
      if (!os_signpost_enabled(v14)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "modeChange";
      goto LABEL_119;
    case 10:
      long long v17 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v18 = v17;
      if (!os_signpost_enabled(v17)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "modeChange";
      goto LABEL_123;
    case 35:
      uint64_t v19 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v15 = v19;
      if (!os_signpost_enabled(v19)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "beginCapturePhoto";
      goto LABEL_119;
    case 36:
      long long v20 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v18 = v20;
      if (!os_signpost_enabled(v20)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "beginCapturePhoto";
      goto LABEL_123;
    case 37:
      long long v21 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v15 = v21;
      if (!os_signpost_enabled(v21)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "willCapturePhoto";
      goto LABEL_119;
    case 38:
      CGSize v22 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v18 = v22;
      if (!os_signpost_enabled(v22)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "willCapturePhoto";
      goto LABEL_123;
    case 39:
      uint64_t v23 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v15 = v23;
      if (!os_signpost_enabled(v23)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "didCapturePhoto";
      goto LABEL_119;
    case 40:
      uint64_t v24 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v18 = v24;
      if (!os_signpost_enabled(v24)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "didCapturePhoto";
      goto LABEL_123;
    case 41:
      v25 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v15 = v25;
      if (!os_signpost_enabled(v25)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "didFinishProcessingPhoto";
      goto LABEL_119;
    case 42:
      v26 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v18 = v26;
      if (!os_signpost_enabled(v26)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "didFinishProcessingPhoto";
      goto LABEL_123;
    case 43:
      v27 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v15 = v27;
      if (!os_signpost_enabled(v27)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "didFinishRecordingLivePhoto";
      goto LABEL_119;
    case 44:
      uint64_t v28 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v18 = v28;
      if (!os_signpost_enabled(v28)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "didFinishRecordingLivePhoto";
      goto LABEL_123;
    case 45:
      v29 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v15 = v29;
      if (!os_signpost_enabled(v29)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "didFinishProcessingLivePhoto";
      goto LABEL_119;
    case 46:
      v30 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v18 = v30;
      if (!os_signpost_enabled(v30)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "didFinishProcessingLivePhoto";
      goto LABEL_123;
    case 47:
      uint64_t v31 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v15 = v31;
      if (!os_signpost_enabled(v31)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "finishCapturePhoto";
      goto LABEL_119;
    case 48:
      v32 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v18 = v32;
      if (!os_signpost_enabled(v32)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "finishCapturePhoto";
      goto LABEL_123;
    case 61:
      v33 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v15 = v33;
      if (!os_signpost_enabled(v33)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "didCaptureDeferredPhoto";
      goto LABEL_119;
    case 62:
      v34 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v18 = v34;
      if (!os_signpost_enabled(v34)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "didCaptureDeferredPhoto";
      goto LABEL_123;
    case 66:
      v35 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v15 = v35;
      if (!os_signpost_enabled(v35)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "captureInterval";
      goto LABEL_119;
    case 67:
      v36 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v18 = v36;
      if (!os_signpost_enabled(v36)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "captureInterval";
      goto LABEL_123;
    case 70:
      v37 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v15 = v37;
      if (!os_signpost_enabled(v37)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "photoCapture";
      goto LABEL_119;
    case 71:
      v38 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v18 = v38;
      if (!os_signpost_enabled(v38)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "photoCapture";
      goto LABEL_123;
    case 72:
      v39 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v15 = v39;
      if (!os_signpost_enabled(v39)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "photoCaptureAndProcessing";
      goto LABEL_119;
    case 73:
      v40 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v18 = v40;
      if (!os_signpost_enabled(v40)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "photoCaptureAndProcessing";
      goto LABEL_123;
    case 74:
      v41 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v15 = v41;
      if (!os_signpost_enabled(v41)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "captureToImageWellProcessing";
      goto LABEL_119;
    case 75:
      v42 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v18 = v42;
      if (!os_signpost_enabled(v42)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "captureToImageWellProcessing";
      goto LABEL_123;
    case 76:
      v43 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v15 = v43;
      if (!os_signpost_enabled(v43)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "beginCaptureBeforeResolvingSettingsPhoto";
      goto LABEL_119;
    case 77:
      v44 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v18 = v44;
      if (!os_signpost_enabled(v44)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "beginCaptureBeforeResolvingSettingsPhoto";
      goto LABEL_123;
    case 78:
      v45 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v15 = v45;
      if (!os_signpost_enabled(v45)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "peopleProximityScanActivate";
      goto LABEL_119;
    case 79:
      v46 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v18 = v46;
      if (!os_signpost_enabled(v46)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "peopleProximityScanActivate";
      goto LABEL_123;
    case 80:
      v47 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v15 = v47;
      if (!os_signpost_enabled(v47)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "peopleProximityDiscoverPerson";
      goto LABEL_119;
    case 81:
      v48 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v18 = v48;
      if (!os_signpost_enabled(v48)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "peopleProximityDiscoverPerson";
      goto LABEL_123;
    case 87:
      v49 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v15 = v49;
      if (!os_signpost_enabled(v49)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "prewarmAudioVideoDevices";
      goto LABEL_119;
    case 88:
      v50 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v18 = v50;
      if (!os_signpost_enabled(v50)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "prewarmAudioVideoDevices";
      goto LABEL_123;
    case 89:
      v51 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v15 = v51;
      if (!os_signpost_enabled(v51)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "CAMCaptureCabilities init";
      goto LABEL_119;
    case 90:
      v52 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v18 = v52;
      if (!os_signpost_enabled(v52)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "CAMCaptureCabilities init";
      goto LABEL_123;
    case 91:
      v53 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v15 = v53;
      if (!os_signpost_enabled(v53)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "prewarmAudioVideoDeviceTypes";
      goto LABEL_119;
    case 92:
      v54 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v18 = v54;
      if (!os_signpost_enabled(v54)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "prewarmAudioVideoDeviceTypes";
      goto LABEL_123;
    case 93:
      v55 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v15 = v55;
      if (!os_signpost_enabled(v55)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "prewarmCaptureSession";
LABEL_119:
      v56 = v15;
      os_signpost_type_t v57 = OS_SIGNPOST_INTERVAL_BEGIN;
      break;
    case 94:
      v58 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_125;
      }
      long long v18 = v58;
      if (!os_signpost_enabled(v58)) {
        goto LABEL_125;
      }
      int v59 = 134218752;
      uint64_t v60 = a3;
      __int16 v61 = 2048;
      uint64_t v62 = a4;
      __int16 v63 = 2048;
      uint64_t v64 = a5;
      __int16 v65 = 2048;
      uint64_t v66 = a6;
      long long v16 = "prewarmCaptureSession";
LABEL_123:
      v56 = v18;
      os_signpost_type_t v57 = OS_SIGNPOST_INTERVAL_END;
      break;
    default:
      goto LABEL_126;
  }
  _os_signpost_emit_with_name_impl(&dword_2099F8000, v56, v57, a2, v16, " enableTelemetry=YES (%llu, %llu, %llu, %llu)", (uint8_t *)&v59, 0x2Au);
LABEL_125:

LABEL_126:
}

void CAMSignpostsDiscoverPersonBegin()
{
  kdebug_trace();
  os_log_t v0 = CAMTelemetrySignpostsLog();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_2099F8000, v0, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "peopleProximityDiscoverPerson", " enableTelemetry=YES ", v1, 2u);
  }
}

void CAMSignpostsDiscoverPersonEnd(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  kdebug_trace();
  uint64_t v5 = CAMTelemetrySignpostsLog();
  if (os_signpost_enabled(v5))
  {
    int v6 = 134349312;
    uint64_t v7 = a2;
    __int16 v8 = 2050;
    uint64_t v9 = a3;
    _os_signpost_emit_with_name_impl(&dword_2099F8000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "peopleProximityDiscoverPerson", " enableTelemetry=YES distance=%{signpost.telemetry:number1,public}lu rssi=%{signpost.telemetry:number2,public}ld", (uint8_t *)&v6, 0x16u);
  }
}

void CAMSignpostsDiscoverPersonNearbyBegin()
{
  kdebug_trace();
  os_log_t v0 = CAMTelemetrySignpostsLog();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_2099F8000, v0, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "peopleProximityDiscoverPersonNearby", " enableTelemetry=YES ", v1, 2u);
  }
}

void CAMSignpostsDiscoverPersonNearbyEnd(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  kdebug_trace();
  uint64_t v5 = CAMTelemetrySignpostsLog();
  if (os_signpost_enabled(v5))
  {
    int v6 = 134349312;
    uint64_t v7 = a2;
    __int16 v8 = 2050;
    uint64_t v9 = a3;
    _os_signpost_emit_with_name_impl(&dword_2099F8000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "peopleProximityDiscoverPersonNearby", " enableTelemetry=YES distance=%{signpost.telemetry:number1,public}lu rssi=%{signpost.telemetry:number2,public}ld", (uint8_t *)&v6, 0x16u);
  }
}

void CAMSignpostsSmartSharingAutoDecisionBegin()
{
  kdebug_trace();
  os_log_t v0 = CAMTelemetrySignpostsLog();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_2099F8000, v0, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "smartSharingAutoDecision", " enableTelemetry=YES ", v1, 2u);
  }
}

void CAMSignpostsSmartSharingAutoDecisionEnd(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  kdebug_trace();
  uint64_t v5 = CAMTelemetrySignpostsLog();
  if (os_signpost_enabled(v5))
  {
    int v6 = 134349312;
    uint64_t v7 = a2;
    __int16 v8 = 2050;
    uint64_t v9 = a3;
    _os_signpost_emit_with_name_impl(&dword_2099F8000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "smartSharingAutoDecision", " enableTelemetry=YES initialState=%{signpost.telemetry:number1,public}ld inferredState=%{signpost.telemetry:number2,public}ld", (uint8_t *)&v6, 0x16u);
  }
}

void CAMSignpostsUserManualOverrideBegin()
{
  kdebug_trace();
  os_log_t v0 = CAMTelemetrySignpostsLog();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_2099F8000, v0, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "userManualOverride", " enableTelemetry=YES ", v1, 2u);
  }
}

void CAMSignpostsUserManualOverrideEnd(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  kdebug_trace();
  uint64_t v5 = CAMTelemetrySignpostsLog();
  if (os_signpost_enabled(v5))
  {
    int v6 = 134349312;
    uint64_t v7 = a2;
    __int16 v8 = 2050;
    uint64_t v9 = a3;
    _os_signpost_emit_with_name_impl(&dword_2099F8000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "userManualOverride", " enableTelemetry=YES initialState=%{signpost.telemetry:number1,public}ld overiddenState=%{signpost.telemetry:number2,public}ld", (uint8_t *)&v6, 0x16u);
  }
}

void sub_209AF5BC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v16 - 136));
  _Unwind_Resume(a1);
}

void sub_209AF6A2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void sub_209AF8B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPLPhotoTileViewControllerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getPLPhotoTileViewControllerClass_softClass;
  uint64_t v7 = getPLPhotoTileViewControllerClass_softClass;
  if (!getPLPhotoTileViewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getPLPhotoTileViewControllerClass_block_invoke;
    v3[3] = &unk_263FA0AB0;
    v3[4] = &v4;
    __getPLPhotoTileViewControllerClass_block_invoke((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_209AF9094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209AF9528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPLCropOverlayClass_block_invoke(uint64_t a1)
{
  PhotoLibraryLibrary();
  Class result = objc_getClass("PLCropOverlay");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPLCropOverlayClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPLCropOverlayClass_block_invoke_cold_1();
    return (Class)PhotoLibraryLibrary();
  }
  return result;
}

uint64_t PhotoLibraryLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!PhotoLibraryLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __PhotoLibraryLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_263FA2E50;
    uint64_t v5 = 0;
    PhotoLibraryLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = PhotoLibraryLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!PhotoLibraryLibraryCore_frameworkLibrary)
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

uint64_t __PhotoLibraryLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PhotoLibraryLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getPLPhotoTileViewControllerClass_block_invoke(uint64_t a1)
{
  PhotoLibraryLibrary();
  Class result = objc_getClass("PLPhotoTileViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPLPhotoTileViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getPLPhotoTileViewControllerClass_block_invoke_cold_1();
    return (Class)__getPLVideoViewClass_block_invoke(v3);
  }
  return result;
}

Class __getPLVideoViewClass_block_invoke(uint64_t a1)
{
  PhotoLibraryLibrary();
  Class result = objc_getClass("PLVideoView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPLVideoViewClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getPLVideoViewClass_block_invoke_cold_1();
    return (Class)__getPLNotifyImagePickerOfImageAvailabilitySymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getPLNotifyImagePickerOfImageAvailabilitySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)PhotoLibraryLibrary();
  Class result = dlsym(v2, "PLNotifyImagePickerOfImageAvailability");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPLNotifyImagePickerOfImageAvailabilitySymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getPLNotifyImagePickerOfVideoAvailabilitySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)PhotoLibraryLibrary();
  Class result = dlsym(v2, "PLNotifyImagePickerOfVideoAvailability");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPLNotifyImagePickerOfVideoAvailabilitySymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_209AFBB48(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_209AFBC04(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_209AFC598(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_209AFD968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_209B03000(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id CAMVideoCaptureRequestError(uint64_t a1, void *a2)
{
  v20[2] = *MEMORY[0x263EF8340];
  if ((unint64_t)(a1 + 28003) > 3) {
    long long v4 = 0;
  }
  else {
    long long v4 = off_263FA3338[a1 + 28003];
  }
  if (a2)
  {
    uint64_t v5 = *MEMORY[0x263F08608];
    v19[0] = *MEMORY[0x263F08320];
    v19[1] = v5;
    v20[0] = v4;
    v20[1] = a2;
    uint64_t v6 = NSDictionary;
    id v7 = a2;
    __int16 v8 = (__CFString **)v20;
    uint64_t v9 = v19;
    uint64_t v10 = v6;
    uint64_t v11 = 2;
  }
  else
  {
    uint64_t v17 = *MEMORY[0x263F08320];
    long long v18 = v4;
    uint64_t v12 = NSDictionary;
    id v13 = 0;
    __int16 v8 = &v18;
    uint64_t v9 = &v17;
    uint64_t v10 = v12;
    uint64_t v11 = 1;
  }
  long long v14 = [v10 dictionaryWithObjects:v8 forKeys:v9 count:v11];
  long long v15 = [MEMORY[0x263F087E8] errorWithDomain:@"CAMVideoCaptureRequestErrorDomain" code:a1 userInfo:v14];

  return v15;
}

uint64_t CAMErrorIsVideoCaptureRequestError(void *a1, uint64_t a2)
{
  id v3 = a1;
  if ([v3 code] == a2)
  {
    long long v4 = [v3 domain];
    uint64_t v5 = [v4 isEqual:@"CAMVideoCaptureRequestErrorDomain"];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t CAMInitialLayoutStyle(uint64_t result, double a2, double a3, double a4, double a5)
{
  if (result != 1)
  {
    if (CAMIsModernAspectScreenSize(a4, a5)) {
      return 4;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t CAMLayoutStyleForView(void *a1)
{
  id v1 = a1;
  id v2 = [v1 window];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  if (v4 * v6 == 0.0)
  {
    id v7 = objc_msgSend(MEMORY[0x263F82B60], "mainScreen", v4 * v6);
    [v7 _referenceBounds];
    double v9 = v8;
    double v11 = v10;
    uint64_t v12 = [MEMORY[0x263F82670] currentDevice];
    if ([v12 userInterfaceIdiom] == 1)
    {
      uint64_t v13 = 1;
    }
    else if (CAMIsModernAspectScreenSize(v9, v11))
    {
      uint64_t v13 = 4;
    }
    else
    {
      uint64_t v13 = 0;
    }

LABEL_10:
    goto LABEL_11;
  }
  char v14 = CEKIsPadLayoutForView();
  long long v15 = [v1 traitCollection];
  uint64_t v16 = [v15 userInterfaceIdiom];

  uint64_t v17 = [v1 window];
  [v17 bounds];
  CEKPortraitOrientedSize();

  if ((v14 & 1) == 0)
  {
    if (v16 == 1)
    {
      uint64_t v13 = 0;
      goto LABEL_11;
    }
    CEKRectWithSize();
    double v20 = v19;
    double v22 = v21;
    id v7 = [v1 traitCollection];
    if ([v7 userInterfaceIdiom] == 1)
    {
      uint64_t v13 = 1;
    }
    else if (CAMIsModernAspectScreenSize(v20, v22))
    {
      uint64_t v13 = 4;
    }
    else
    {
      uint64_t v13 = 0;
    }
    goto LABEL_10;
  }
  uint64_t v13 = 1;
LABEL_11:

  return v13;
}

uint64_t CAMLayoutStyleAllowingTinyForView(void *a1)
{
  id v1 = a1;
  id v2 = [v1 window];
  [v2 bounds];

  uint64_t v3 = CAMLayoutStyleForView(v1);
  CEKPortraitOrientedSize();
  if (v3 == 1)
  {
    if (v5 >= 768.0) {
      return 1;
    }
    else {
      return 2;
    }
  }
  else if (v5 < 568.0 || v4 < 320.0)
  {
    return 2;
  }
  else
  {
    return v3;
  }
}

void sub_209B0F610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209B0F7E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209B0F970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209B10BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209B10F40(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void CAMShutterButtonSpecMake(double *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, double a6@<D4>)
{
  *a1 = a2;
  a1[1] = a3;
  a1[2] = a4;
  a1[3] = a5;
  a1[4] = a6;
}

double CAMShutterButtonSpecGetInnerCircleDiameter(double *a1)
{
  return *a1 + (a1[1] + a1[4]) * -2.0;
}

void sub_209B15A88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_209B15E34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_209B1750C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_209B1A78C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void __PanoramaProcessorOutputCallback(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  id v7 = [v5 delegate];
  double v6 = [v5 request];
  [v7 panoramaProcessor:v5 didProcessSampleBuffer:a3 withStatus:a2 forRequest:v6];
}

void sub_209B2047C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209B231D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209B23AC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209B23D08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209B335A8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Unwind_Resume(a1);
}

void sub_209B35158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209B3575C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209B35948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209B36A98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

float CMAccelerationZAxisRotation(long double a1, double a2)
{
  return atan2(a1, -a2);
}

void sub_209B40444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209B40C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
}

void sub_209B40F90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_209B42804(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209B42E6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209B44A04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209B4C1C8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_209B4C238()
{
}

void sub_209B4C240()
{
}

Class __getSFDeviceDiscoveryClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!SharingLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __SharingLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_263FA4220;
    uint64_t v6 = 0;
    SharingLibraryCore_frameworkLibrary = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!SharingLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("SFDeviceDiscovery");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    __getSFDeviceDiscoveryClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSFDeviceDiscoveryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SharingLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SharingLibraryCore_frameworkLibrary = result;
  return result;
}

void CAMShowStorageUsageInSettings()
{
  uint64_t v0 = [NSURL URLWithString:@"prefs:root=General&path=STORAGE_MGMT"];
  uint64_t v1 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_2099F8000, v1, OS_LOG_TYPE_DEFAULT, "Opening Storage Settings", v3, 2u);
  }

  if ((CAMOpenSensitiveURLWithUnlockRequest(v0, 1) & 1) == 0)
  {
    id v2 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      CAMShowStorageUsageInSettings_cold_1((uint64_t)v0, v2);
    }
  }
}

id CAMStorageAlertDismissTitle(unint64_t a1)
{
  if (a1 > 2)
  {
    id v2 = 0;
  }
  else
  {
    id v2 = CAMLocalizedFrameworkString(off_263FA4248[a1], 0);
  }
  return v2;
}

id CAMStorageAlertResolveTitle(uint64_t a1)
{
  if (a1 == 1)
  {
    id v2 = @"LOW_DISK_SPACE_ICPL_OFF_ALERT_MANAGE_TITLE";
LABEL_5:
    uint64_t v3 = CAMLocalizedFrameworkString(v2, 0);
    return v3;
  }
  if (!a1)
  {
    id v2 = @"LOW_DISK_SPACE_ICPL_ON_ALERT_OPTIMIZE_TITLE";
    goto LABEL_5;
  }
  uint64_t v3 = 0;
  return v3;
}

uint64_t CAMStorageAlertIsPhotoMode(unint64_t a1)
{
  return (a1 < 0xA) & (0x279u >> a1);
}

id CAMStorageAlertTitle(uint64_t a1)
{
  id v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = [v2 model];

  switch(a1)
  {
    case 2:
      double v4 = @"LOW_DISK_SPACE_TITLE_EXTERNAL";
      goto LABEL_9;
    case 1:
      [NSString stringWithFormat:@"LOW_DISK_SPACE_ICPL_OFF_TITLE_%@", v3];
      goto LABEL_7;
    case 0:
      [NSString stringWithFormat:@"LOW_DISK_SPACE_ICPL_ON_TITLE_%@", v3];
LABEL_7:
      double v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
  }
  double v4 = 0;
LABEL_9:
  long long v5 = CAMLocalizedFrameworkString(v4, 0);

  return v5;
}

id CAMStorageAlertMessage(uint64_t a1, unint64_t a2)
{
  if (a2 > 9)
  {
LABEL_12:
    uint64_t v6 = 0;
    goto LABEL_17;
  }
  if (((1 << a2) & 0x279) != 0)
  {
    switch(a1)
    {
      case 2:
        uint64_t v6 = @"LOW_DISK_SPACE_PHOTO_BODY_EXTERNAL";
        break;
      case 1:
        uint64_t v6 = @"LOW_DISK_SPACE_ICPL_OFF_PHOTO_BODY";
        break;
      case 0:
        id v2 = NSString;
        uint64_t v3 = [MEMORY[0x263F82670] currentDevice];
        double v4 = [v3 model];
        [v2 stringWithFormat:@"LOW_DISK_SPACE_ICPL_ON_PHOTO_BODY_%@", v4];
LABEL_11:
        uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

        break;
      default:
        goto LABEL_12;
    }
  }
  else
  {
    switch(a1)
    {
      case 2:
        uint64_t v6 = @"LOW_DISK_SPACE_VIDEO_BODY_EXTERNAL";
        break;
      case 1:
        uint64_t v6 = @"LOW_DISK_SPACE_ICPL_OFF_VIDEO_BODY";
        break;
      case 0:
        long long v5 = NSString;
        uint64_t v3 = [MEMORY[0x263F82670] currentDevice];
        double v4 = [v3 model];
        [v5 stringWithFormat:@"LOW_DISK_SPACE_ICPL_ON_VIDEO_BODY_%@", v4];
        goto LABEL_11;
      default:
        goto LABEL_12;
    }
  }
LABEL_17:
  uint64_t v7 = CAMLocalizedFrameworkString(v6, 0);

  return v7;
}

void sub_209B4EBA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209B519E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id a27)
{
}

void sub_209B51DA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209B59F34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209B5A5DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_209B5A67C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_209B5DA50(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_209B5FE40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

__CFString *CAMDebugStringForCaptureDevice_0(unint64_t a1)
{
  if (a1 > 0xB) {
    return 0;
  }
  else {
    return off_263FA4600[a1];
  }
}

double CAMMGGetCGRectAnswer(uint64_t a1, double a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  double v4 = (void *)MGCopyAnswer();
  long long v5 = v4;
  if (v4)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x263F08D40], "valueWithBytes:objCType:", objc_msgSend(objc_retainAutorelease(v4), "bytes"), "{CGRect={CGPoint=dd}{CGSize=dd}}");
    [v6 CGRectValue];
    a2 = v7;
  }
  else
  {
    uint64_t v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      uint64_t v10 = a1;
      _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEFAULT, "No data found for MG query %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }

  return a2;
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id CAMCaptureControllerError(uint64_t a1, void *a2)
{
  v20[2] = *MEMORY[0x263EF8340];
  if ((unint64_t)(a1 + 22103) > 3) {
    double v4 = 0;
  }
  else {
    double v4 = off_263FA4900[a1 + 22103];
  }
  if (a2)
  {
    uint64_t v5 = *MEMORY[0x263F08608];
    v19[0] = *MEMORY[0x263F08320];
    v19[1] = v5;
    v20[0] = v4;
    v20[1] = a2;
    uint64_t v6 = NSDictionary;
    id v7 = a2;
    double v8 = (__CFString **)v20;
    int v9 = v19;
    uint64_t v10 = v6;
    uint64_t v11 = 2;
  }
  else
  {
    uint64_t v17 = *MEMORY[0x263F08320];
    long long v18 = v4;
    uint64_t v12 = NSDictionary;
    id v13 = 0;
    double v8 = &v18;
    int v9 = &v17;
    uint64_t v10 = v12;
    uint64_t v11 = 1;
  }
  char v14 = [v10 dictionaryWithObjects:v8 forKeys:v9 count:v11];
  long long v15 = [MEMORY[0x263F087E8] errorWithDomain:@"CAMCaptureControllerErrorDomain" code:a1 userInfo:v14];

  return v15;
}

void sub_209B78F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209B851A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209B85738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209B85A4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double CAMSizeForPhotoMetadata(void *a1)
{
  uint64_t v1 = *MEMORY[0x263F0F248];
  id v2 = a1;
  uint64_t v3 = [v2 objectForKeyedSubscript:v1];
  double v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F0F2E8]];
  uint64_t v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263F0F2F0]];
  uint64_t v6 = [v2 objectForKeyedSubscript:*MEMORY[0x263F0F4C8]];

  [v4 doubleValue];
  double v8 = v7;
  [v5 doubleValue];
  double v10 = v9;
  [v6 intValue];
  if (PLExifOrientationSwapsWidthAndHeight()) {
    double v12 = v10;
  }
  else {
    double v12 = v8;
  }

  return v12;
}

uint64_t CAMSizeForDimensions()
{
  return PLExifOrientationSwapsWidthAndHeight();
}

void sub_209B8BA20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209B90E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209B90F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209B91124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209B92344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___loadThumbnailForBurstResult_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v6 = *(id *)(a1 + 32);
  id v5 = v4;
  pl_dispatch_async();
}

uint64_t ___loadThumbnailForBurstResult_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

__n128 CAMViewGeometryMake@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>, double a7@<D4>, double a8@<D5>)
{
  *(double *)a2 = a5;
  *(double *)(a2 + 8) = a6;
  *(double *)(a2 + 16) = a7;
  *(double *)(a2 + 24) = a8;
  *(double *)(a2 + 32) = a3;
  *(double *)(a2 + 40) = a4;
  long long v8 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 48) = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 64) = v8;
  __n128 result = *(__n128 *)(a1 + 32);
  *(__n128 *)(a2 + 80) = result;
  return result;
}

uint64_t CAMFrameForGeometry(uint64_t a1)
{
  CGRect v4 = *(CGRect *)a1;
  long long v1 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&v3.a = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&v3.c = v1;
  *(_OWORD *)&v3.tx = *(_OWORD *)(a1 + 80);
  CGRectApplyAffineTransform(v4, &v3);
  return UIRectCenteredAboutPoint();
}

__n128 CAMViewGeometryForFrame@<Q0>(uint64_t a1@<X8>, double a2@<D2>, double a3@<D3>)
{
  UIRectGetCenter();
  *(_OWORD *)a1 = *MEMORY[0x263F00148];
  *(double *)(a1 + 16) = a2;
  *(double *)(a1 + 24) = a3;
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  long long v8 = (__n128 *)MEMORY[0x263F000D0];
  long long v9 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)(a1 + 48) = *MEMORY[0x263F000D0];
  *(_OWORD *)(a1 + 64) = v9;
  __n128 result = v8[2];
  *(__n128 *)(a1 + 80) = result;
  return result;
}

__n128 CAMViewGeometryForOrientedFrame@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>)
{
  memset(&v17, 0, sizeof(v17));
  CAMOrientationTransform(a1, (uint64_t)&v17);
  UIRectGetCenter();
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  CGAffineTransform v16 = v17;
  v18.origin.x = a3;
  v18.origin.y = a4;
  v18.size.width = a5;
  v18.size.height = a6;
  CGRect v19 = CGRectApplyAffineTransform(v18, &v16);
  *(_OWORD *)&v19.origin.y = *(_OWORD *)&v17.c;
  *(_OWORD *)(a2 + 48) = *(_OWORD *)&v17.a;
  *(_OWORD *)(a2 + 64) = *(_OWORD *)&v19.origin.y;
  *(_OWORD *)(a2 + 80) = *(_OWORD *)&v17.tx;
  __n128 result = *(__n128 *)MEMORY[0x263F00148];
  *(_OWORD *)a2 = *MEMORY[0x263F00148];
  *(CGFloat *)(a2 + 16) = v19.size.width;
  *(CGFloat *)(a2 + 24) = v19.size.height;
  *(void *)(a2 + 32) = v12;
  *(void *)(a2 + 40) = v14;
  return result;
}

uint64_t CAMOrientationTransform@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  switch(result)
  {
    case 0:
    case 1:
      uint64_t v3 = MEMORY[0x263F000D0];
      long long v4 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      *(_OWORD *)a2 = *MEMORY[0x263F000D0];
      *(_OWORD *)(a2 + 16) = v4;
      long long v5 = *(_OWORD *)(v3 + 32);
      goto LABEL_7;
    case 2:
      CGFloat v6 = 3.14159265;
      goto LABEL_6;
    case 3:
      CGFloat v6 = 1.57079633;
      goto LABEL_6;
    case 4:
      CGFloat v6 = -1.57079633;
LABEL_6:
      CGAffineTransformMakeRotation((CGAffineTransform *)a2, v6);
      __n128 result = UIIntegralTransform();
      *(_OWORD *)a2 = v7;
      *(_OWORD *)(a2 + 16) = v8;
      long long v5 = v9;
LABEL_7:
      *(_OWORD *)(a2 + 32) = v5;
      break;
    default:
      return result;
  }
  return result;
}

void CAMViewSetGeometry(void *a1, uint64_t a2)
{
  double v3 = *(double *)(a2 + 32);
  double v4 = *(double *)(a2 + 40);
  id v5 = a1;
  objc_msgSend(v5, "setCenter:", v3, v4);
  objc_msgSend(v5, "setBounds:", *(double *)a2, *(double *)(a2 + 8), *(double *)(a2 + 16), *(double *)(a2 + 24));
  long long v6 = *(_OWORD *)(a2 + 64);
  v7[0] = *(_OWORD *)(a2 + 48);
  v7[1] = v6;
  v7[2] = *(_OWORD *)(a2 + 80);
  [v5 setTransform:v7];
}

void CAMViewGetGeometry(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = a1;
  [v3 center];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  [v3 bounds];
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  if (v3)
  {
    [v3 transform];
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v16 = 0u;
  }
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v11;
  *(void *)(a2 + 16) = v13;
  *(void *)(a2 + 24) = v15;
  *(void *)(a2 + 32) = v5;
  *(void *)(a2 + 40) = v7;
  *(_OWORD *)(a2 + 48) = v16;
  *(_OWORD *)(a2 + 64) = v17;
  *(_OWORD *)(a2 + 80) = v18;
}

void CAMApplyAnimationSensitiveGeometryToView(double *a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(v3, "setCenter:", a1[4], a1[5]);
  uint64_t v4 = (void *)MEMORY[0x263F82E00];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  long long v5 = *((_OWORD *)a1 + 3);
  long long v13 = *((_OWORD *)a1 + 2);
  long long v14 = v5;
  long long v6 = *((_OWORD *)a1 + 5);
  long long v15 = *((_OWORD *)a1 + 4);
  long long v16 = v6;
  long long v7 = *((_OWORD *)a1 + 1);
  long long v11 = *(_OWORD *)a1;
  long long v12 = v7;
  v9[2] = __CAMApplyAnimationSensitiveGeometryToView_block_invoke;
  v9[3] = &unk_263FA4F90;
  id v10 = v3;
  id v8 = v3;
  [v4 performWithoutAnimation:v9];
}

uint64_t __CAMApplyAnimationSensitiveGeometryToView_block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  long long v2 = *(_OWORD *)(a1 + 104);
  v4[0] = *(_OWORD *)(a1 + 88);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 120);
  return [*(id *)(a1 + 32) setTransform:v4];
}

BOOL CAMViewGeometryIsEqualToViewGeometry(uint64_t a1, uint64_t a2)
{
  BOOL result = CGRectEqualToRect(*(CGRect *)a1, *(CGRect *)a2);
  if (result)
  {
    if (*(double *)(a1 + 32) == *(double *)(a2 + 32) && *(double *)(a1 + 40) == *(double *)(a2 + 40))
    {
      long long v6 = *(_OWORD *)(a1 + 64);
      *(_OWORD *)&t1.a = *(_OWORD *)(a1 + 48);
      *(_OWORD *)&t1.c = v6;
      *(_OWORD *)&t1.tx = *(_OWORD *)(a1 + 80);
      long long v7 = *(_OWORD *)(a2 + 64);
      *(_OWORD *)&v8.a = *(_OWORD *)(a2 + 48);
      *(_OWORD *)&v8.c = v7;
      *(_OWORD *)&v8.tx = *(_OWORD *)(a2 + 80);
      return CGAffineTransformEqualToTransform(&t1, &v8);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void CAMViewSetBoundsAndCenterForFrame(void *a1, double a2, double a3, double a4, double a5)
{
  id v7 = a1;
  UIRectGetCenter();
  objc_msgSend(v7, "setCenter:");
  objc_msgSend(v7, "setBounds:", 0.0, 0.0, a4, a5);
}

double CAMViewAlignmentSize(void *a1)
{
  id v1 = a1;
  [v1 intrinsicContentSize];
  CEKRectWithSize();
  objc_msgSend(v1, "frameForAlignmentRect:");
  double v3 = v2;

  return v3;
}

void sub_209B93F58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209B943D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_209B945E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209B96D3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

void sub_209B9736C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_209B985DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_209B9CA1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209B9D390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209B9D858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_209B9E1C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

unsigned char *OUTLINED_FUNCTION_4_0(unsigned char *result, unsigned char *a2)
{
  *BOOL result = 0;
  *a2 = 0;
  return result;
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_14(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_16(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

void OUTLINED_FUNCTION_17(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_209BA0DC4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_209BA0FEC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_209BA7DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_209BAA0C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209BAD430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double _nearestRangeValue(double a1, double a2, double a3)
{
  double v3 = a3 + (a3 - a2) * -0.5;
  if (v3 <= a1 || a1 < a2) {
    a2 = a1;
  }
  if (v3 >= a1 || a1 > a3) {
    return a2;
  }
  else {
    return a3;
  }
}

double _nearestRoundedAngleForAngle(double result)
{
  float64x2_t v1 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&result, 0);
  if (vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v1, (float64x2_t)xmmword_209C7B7B0), (int32x4_t)vceqq_f64(v1, (float64x2_t)xmmword_209C7B7C0)))))return result; {
  double v2 = 270.0;
  }
  if (result > 270.0)
  {
    if (result >= 315.0 || result < 270.0) {
      double v2 = result;
    }
    BOOL v4 = result == 315.0;
    BOOL v5 = result < 315.0;
    double v6 = 360.0;
LABEL_28:
    if (v5 || v4)
    {
      BOOL v11 = 1;
      BOOL v12 = 0;
    }
    else
    {
      BOOL v12 = result == v6;
      BOOL v11 = result >= v6;
    }
    if (!v12 && v11) {
      return v2;
    }
    else {
      return v6;
    }
  }
  double v6 = 180.0;
  if (result <= 180.0)
  {
    double v2 = 90.0;
    if (result > 90.0)
    {
      if (result >= 135.0 || result < 90.0) {
        double v2 = result;
      }
      BOOL v4 = result == 135.0;
      BOOL v5 = result < 135.0;
      goto LABEL_28;
    }
    double v13 = 0.0;
    if (result >= 45.0 || result < 0.0) {
      double v13 = result;
    }
    if (result > 45.0)
    {
      BOOL v16 = result == 90.0;
      BOOL v15 = result >= 90.0;
    }
    else
    {
      BOOL v15 = 1;
      BOOL v16 = 0;
    }
    if (!v16 && v15) {
      return v13;
    }
    else {
      return 90.0;
    }
  }
  else
  {
    if (result >= 225.0 || result < 180.0) {
      double v6 = result;
    }
    if (result > 225.0)
    {
      BOOL v9 = result == 270.0;
      BOOL v8 = result >= 270.0;
    }
    else
    {
      BOOL v8 = 1;
      BOOL v9 = 0;
    }
    if (!v9 && v8) {
      return v6;
    }
    else {
      return 270.0;
    }
  }
}

void sub_209BB07F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a16, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_209BB704C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
}

void sub_209BB78D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

id CAMDebugStringForCaptureResultSpecifiersSet(void *a1)
{
  id v1 = a1;
  uint64_t v5 = 0;
  double v6 = &v5;
  uint64_t v7 = 0x3032000000;
  BOOL v8 = __Block_byref_object_copy__22;
  BOOL v9 = __Block_byref_object_dispose__22;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __CAMDebugStringForCaptureResultSpecifiersSet_block_invoke_0;
  _OWORD v4[3] = &unk_263FA1428;
  v4[4] = &v5;
  [v1 enumerateObjectsUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void sub_209BB88B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __CAMDebugStringForCaptureResultSpecifiersSet_block_invoke_0(uint64_t a1, void *a2)
{
  char v3 = [a2 integerValue];
  if ((v3 & 2) != 0)
  {
    BOOL v4 = [&stru_26BD78BA0 stringByAppendingString:@"Filtered"];
    if ((v3 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  BOOL v4 = &stru_26BD78BA0;
  if (v3)
  {
LABEL_5:
    double v13 = v4;
    uint64_t v5 = [(__CFString *)v4 stringByAppendingString:@"HDR"];

    BOOL v4 = (__CFString *)v5;
  }
LABEL_6:
  uint64_t v14 = v4;
  if ([(__CFString *)v4 length])
  {
    double v6 = v14;
  }
  else
  {

    double v6 = @"None";
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void *)(v7 + 40);
  uint64_t v15 = v6;
  if (v8)
  {
    uint64_t v9 = [NSString stringWithFormat:@"%@, %@", v8, v6];
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    BOOL v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  else
  {
    BOOL v12 = v6;
    BOOL v11 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v12;
  }
}

void sub_209BBACFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209BBB148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209BBB390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209BBB674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209BBB85C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _prewarmAudioVideoDeviceTypes()
{
  if (_prewarmAudioVideoDeviceTypes_onceToken != -1) {
    dispatch_once(&_prewarmAudioVideoDeviceTypes_onceToken, &__block_literal_global_37);
  }
}

void _prewarmAudioVideoDevices()
{
  if (_prewarmAudioVideoDevices_onceToken != -1) {
    dispatch_once(&_prewarmAudioVideoDevices_onceToken, &__block_literal_global_41);
  }
}

void sub_209BBDE88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209BBE980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209BBEF84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209BBF934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_209BC06DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209BC08C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209BC0D10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_209BC69AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209BC8CC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t _PanoramaNotificationCallback(uint64_t a1, void *a2, const void *a3, uint64_t a4)
{
  id v9 = a2;
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x263F20810]))
  {
    uint64_t v6 = [v9 _subgraphQueueHandlePanoramaStatusNotification:a4];
  }
  else if (CFEqual(a3, (CFTypeRef)*MEMORY[0x263F20828]))
  {
    uint64_t v6 = [v9 _subgraphQueueHandlePanoramaWarningNotification:a4];
  }
  else
  {
    uint64_t v6 = CFEqual(a3, (CFTypeRef)*MEMORY[0x263F20788]);
    id v7 = v9;
    if (!v6) {
      goto LABEL_8;
    }
    uint64_t v6 = [v9 _subgraphQueueHandlePanoramaErrorNotification:a4];
  }
  id v7 = v9;
LABEL_8:
  return MEMORY[0x270F9A758](v6, v7);
}

void sub_209BC9238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209BC9674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209BC99A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_209BC9FAC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void didInsertImageQueueImage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    if (a3) {
      MEMORY[0x270EFB838](a3);
    }
  }
}

void sub_209BCA874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209BCB794(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209BCB998(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209BCBB98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209BCBD98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209BCC184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_6_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_8_0@<X0>(uint64_t result@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>, float a4@<S0>)
{
  *(float *)a2 = a4;
  *(void *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 2048;
  *(void *)(a2 + 14) = a3;
  return result;
}

void OUTLINED_FUNCTION_10(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_209BCFF74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_209BD0454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_209BD05C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209BD09A4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

double CAMPixelWidthForView(void *a1)
{
  uint64_t v1 = [a1 traitCollection];
  [v1 displayScale];
  double v3 = 1.0 / v2;

  return v3;
}

BOOL CAMIsModernAspectScreenSize(double a1, double a2)
{
  return a1 > 0.0 && a2 / a1 >= 2.16;
}

BOOL CAMProcessHasEntitlement(uint64_t a1)
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  double v2 = (uint64_t (*)(void))getSecTaskCreateFromSelfSymbolLoc_ptr;
  uint64_t v17 = getSecTaskCreateFromSelfSymbolLoc_ptr;
  if (!getSecTaskCreateFromSelfSymbolLoc_ptr)
  {
    double v3 = (void *)SecurityLibrary();
    v15[3] = (uint64_t)dlsym(v3, "SecTaskCreateFromSelf");
    getSecTaskCreateFromSelfSymbolLoc_ptr = (_UNKNOWN *)v15[3];
    double v2 = (uint64_t (*)(void))v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (!v2)
  {
    -[CAMImagePickerCameraViewController _handleCapturedImagePickerPhotoWithCropOverlayOutput:]();
    goto LABEL_18;
  }
  uint64_t v4 = v2(*MEMORY[0x263EFFB08]);
  if (!v4) {
    return 0;
  }
  uint64_t v5 = (const void *)v4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v6 = (uint64_t (*)(const void *, uint64_t, void))getSecTaskCopyValueForEntitlementSymbolLoc_ptr;
  uint64_t v17 = getSecTaskCopyValueForEntitlementSymbolLoc_ptr;
  if (!getSecTaskCopyValueForEntitlementSymbolLoc_ptr)
  {
    id v7 = (void *)SecurityLibrary();
    v15[3] = (uint64_t)dlsym(v7, "SecTaskCopyValueForEntitlement");
    getSecTaskCopyValueForEntitlementSymbolLoc_ptr = (_UNKNOWN *)v15[3];
    uint64_t v6 = (uint64_t (*)(const void *, uint64_t, void))v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (!v6)
  {
LABEL_18:
    uint64_t v13 = (_Unwind_Exception *)-[CAMImagePickerCameraViewController _handleCapturedImagePickerPhotoWithCropOverlayOutput:]();
    _Block_object_dispose(&v14, 8);
    _Unwind_Resume(v13);
  }
  CFBooleanRef v8 = (const __CFBoolean *)v6(v5, a1, 0);
  if (v8)
  {
    CFBooleanRef v9 = v8;
    CFTypeID v10 = CFGetTypeID(v8);
    BOOL v11 = v10 == CFBooleanGetTypeID() && CFBooleanGetValue(v9) != 0;
    CFRelease(v9);
  }
  else
  {
    BOOL v11 = 0;
  }
  CFRelease(v5);
  return v11;
}

uint64_t CAMIsEntitledToOpenSensitiveURLs()
{
  if (CAMIsEntitledToOpenSensitiveURLs_didCheck != -1) {
    dispatch_once(&CAMIsEntitledToOpenSensitiveURLs_didCheck, &__block_literal_global_2);
  }
  return CAMIsEntitledToOpenSensitiveURLs_isEntitledToOpenSensitiveURLs;
}

BOOL __CAMIsEntitledToOpenSensitiveURLs_block_invoke()
{
  BOOL result = CAMProcessHasEntitlement(@"com.apple.springboard.opensensitiveurl");
  CAMIsEntitledToOpenSensitiveURLs_isEntitledToOpenSensitiveURLs = result;
  return result;
}

uint64_t __CAMLocalizedFrameworkString_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = CAMCameraUIFrameworkBundle();
  uint64_t v8 = [v7 localizedStringForKey:*(void *)(a1 + 32) value:&stru_26BD78BA0 table:v6];

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  CFTypeID v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isEqualToString:*(void *)(a1 + 32)];
  if ((result & 1) == 0) {
    *a4 = 1;
  }
  return result;
}

BOOL CAMIsDeviceOrientationLocked()
{
  if (byte_26AAFEC1C) {
    goto LABEL_2;
  }
  if (!notify_register_check("com.apple.backboardd.orientationlock", &CAMIsDeviceOrientationLocked_notifyToken))
  {
    byte_26AAFEC1C = 1;
LABEL_2:
    uint64_t state64 = 0;
    goto LABEL_3;
  }
  uint64_t state64 = 0;
  if (!byte_26AAFEC1C) {
    return 0;
  }
LABEL_3:
  notify_get_state(CAMIsDeviceOrientationLocked_notifyToken, &state64);
  return state64 != 0;
}

double CAMTransformCorrectingForOrientation@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  CGFloat v3 = 0.0;
  if ((unint64_t)(a1 - 2) <= 2) {
    CGFloat v3 = dbl_209C7B9D0[a1 - 2];
  }
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  CGAffineTransformMakeRotation((CGAffineTransform *)a2, v3);
  UIIntegralTransform();
  *(_OWORD *)a2 = v5;
  *(_OWORD *)(a2 + 16) = v6;
  double result = *(double *)&v7;
  *(_OWORD *)(a2 + 32) = v7;
  return result;
}

uint64_t CAMNormalizeOrientationToOrientation(uint64_t a1, uint64_t a2)
{
  if (a1 == 2) {
    __int16 v2 = 630;
  }
  else {
    __int16 v2 = 450;
  }
  if (a1 == 4) {
    __int16 v2 = 360;
  }
  if (a1 == 3) {
    __int16 v3 = 540;
  }
  else {
    __int16 v3 = v2;
  }
  if (a1 == 1) {
    __int16 v4 = 450;
  }
  else {
    __int16 v4 = v3;
  }
  if (a2 == 2) {
    __int16 v5 = -180;
  }
  else {
    __int16 v5 = 0;
  }
  if (a2 == 4) {
    __int16 v6 = 90;
  }
  else {
    __int16 v6 = v5;
  }
  if (a2 == 3) {
    __int16 v7 = -90;
  }
  else {
    __int16 v7 = v6;
  }
  if (a2 == 1) {
    __int16 v7 = 0;
  }
  __int16 v8 = (unsigned __int16)(v4 + v7) % 0x168u;
  uint64_t v9 = 1;
  if (v8 == 270) {
    uint64_t v9 = 2;
  }
  uint64_t v10 = 3;
  if (v8 != 180) {
    uint64_t v10 = v9;
  }
  if (v8) {
    return v10;
  }
  else {
    return 4;
  }
}

id CAMYellowColor()
{
  uint64_t v0 = [MEMORY[0x263F825C8] systemYellowColor];
  uint64_t v1 = [MEMORY[0x263F82DA0] traitCollectionWithUserInterfaceStyle:2];
  __int16 v2 = [v0 resolvedColorWithTraitCollection:v1];

  return v2;
}

id CAMDarkYellowColor()
{
  uint64_t v0 = [MEMORY[0x263F825C8] systemDarkYellowColor];
  uint64_t v1 = [MEMORY[0x263F82DA0] traitCollectionWithUserInterfaceStyle:2];
  __int16 v2 = [v0 resolvedColorWithTraitCollection:v1];

  return v2;
}

id CAMRedColor()
{
  uint64_t v0 = [MEMORY[0x263F825C8] systemRedColor];
  uint64_t v1 = [MEMORY[0x263F82DA0] traitCollectionWithUserInterfaceStyle:1];
  __int16 v2 = [v0 resolvedColorWithTraitCollection:v1];

  return v2;
}

id CAMMixColor(void *a1, void *a2, double a3)
{
  double v17 = 0.0;
  double v15 = 0.0;
  double v16 = 0.0;
  double v13 = 0.0;
  double v14 = 0.0;
  double v11 = 0.0;
  double v12 = 0.0;
  double v10 = 0.0;
  id v5 = a2;
  [a1 getRed:&v17 green:&v16 blue:&v15 alpha:&v14];
  [v5 getRed:&v13 green:&v12 blue:&v11 alpha:&v10];

  double v6 = fmax(a3, 0.0);
  if (v6 <= 1.0) {
    double v7 = v6;
  }
  else {
    double v7 = 1.0;
  }
  __int16 v8 = objc_msgSend(MEMORY[0x263F825C8], "colorWithRed:green:blue:alpha:", v7 * v13 + v17 * (1.0 - v7), v7 * v12 + v16 * (1.0 - v7), v7 * v11 + v15 * (1.0 - v7), v7 * v10 + v14 * (1.0 - v7), *(void *)&v10, *(void *)&v11, *(void *)&v12, *(void *)&v13, *(void *)&v14, *(void *)&v15, *(void *)&v16, *(void *)&v17);
  return v8;
}

uint64_t CAMOpenURL(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [getLSApplicationWorkspaceClass() defaultWorkspace];
  id v10 = 0;
  uint64_t v6 = [v5 openURL:v3 withOptions:v4 error:&v10];

  id v7 = v10;
  if ((v6 & 1) == 0)
  {
    __int16 v8 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      CAMOpenURL_cold_1((uint64_t)v3, (uint64_t)v7, v8);
    }
  }
  return v6;
}

id getLSApplicationWorkspaceClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getLSApplicationWorkspaceClass_softClass;
  uint64_t v7 = getLSApplicationWorkspaceClass_softClass;
  if (!getLSApplicationWorkspaceClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getLSApplicationWorkspaceClass_block_invoke;
    v3[3] = &unk_263FA0AB0;
    v3[4] = &v4;
    __getLSApplicationWorkspaceClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_209BD2110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CAMOpenSensitiveURLWithUnlockRequest(void *a1, int a2)
{
  v22[2] = *MEMORY[0x263EF8340];
  id v3 = a1;
  if (a2)
  {
    uint64_t v16 = 0;
    double v17 = &v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v4 = (id *)getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr;
    uint64_t v19 = getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr;
    if (!getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr)
    {
      id v5 = (void *)FrontBoardServicesLibrary();
      v17[3] = (uint64_t)dlsym(v5, "FBSOpenApplicationOptionKeyUnlockDevice");
      getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr = v17[3];
      uint64_t v4 = (id *)v17[3];
    }
    _Block_object_dispose(&v16, 8);
    if (!v4) {
      goto LABEL_11;
    }
    id v6 = *v4;
    id v20 = v6;
    uint64_t v7 = MEMORY[0x263EFFA88];
    v22[0] = MEMORY[0x263EFFA88];
    uint64_t v16 = 0;
    double v17 = &v16;
    uint64_t v18 = 0x2020000000;
    __int16 v8 = (id *)getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr;
    uint64_t v19 = getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr;
    if (!getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr)
    {
      uint64_t v9 = (void *)FrontBoardServicesLibrary();
      v17[3] = (uint64_t)dlsym(v9, "FBSOpenApplicationOptionKeyPromptUnlockDevice");
      getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr = v17[3];
      __int16 v8 = (id *)v17[3];
    }
    _Block_object_dispose(&v16, 8);
    if (!v8)
    {
LABEL_11:
      -[CAMImagePickerCameraViewController _handleCapturedImagePickerPhotoWithCropOverlayOutput:]();
      __break(1u);
    }
    id v21 = *v8;
    v22[1] = v7;
    id v10 = NSDictionary;
    id v11 = v21;
    double v12 = [v10 dictionaryWithObjects:v22 forKeys:&v20 count:2];
  }
  else
  {
    double v12 = 0;
  }
  double v13 = [getLSApplicationWorkspaceClass() defaultWorkspace];
  uint64_t v14 = [v13 openSensitiveURL:v3 withOptions:v12];

  return v14;
}

void sub_209BD23A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CAMSnapshotForFadingOrientationTransition(uint64_t a1, int a2)
{
  double v2 = 0.3;
  double v3 = 0.2;
  if (a2) {
    double v2 = 0.2;
  }
  double v4 = 0.1;
  if (!a2) {
    double v4 = 0.0;
  }
  double v5 = 0.25;
  if (a2)
  {
    double v5 = 0.2;
    double v3 = 0.0;
  }
  return +[CAMFrameworkUtilities snapshotForCrossFadingView:a1 fadeOutDuration:0 fadeOutDelay:v2 fadeInDuration:v4 fadeInDelay:v5 embedSnapshot:v3];
}

id CAMPreferredLocale()
{
  if (CAMPreferredLocale_onceToken != -1) {
    dispatch_once(&CAMPreferredLocale_onceToken, &__block_literal_global_42);
  }
  uint64_t v0 = (void *)CAMPreferredLocale___CAMPreferredLocale;
  return v0;
}

void __CAMPreferredLocale_block_invoke()
{
  uint64_t v0 = CAMCameraUIFrameworkBundle();
  id v1 = [v0 preferredLocalizations];
  id v4 = [v1 firstObject];

  uint64_t v2 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v4];
  double v3 = (void *)CAMPreferredLocale___CAMPreferredLocale;
  CAMPreferredLocale___CAMPreferredLocale = v2;
}

void *__getSecTaskCreateFromSelfSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SecurityLibrary();
  double result = dlsym(v2, "SecTaskCreateFromSelf");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSecTaskCreateFromSelfSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SecurityLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!SecurityLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __SecurityLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_263FA6088;
    uint64_t v5 = 0;
    SecurityLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = SecurityLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!SecurityLibraryCore_frameworkLibrary)
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

uint64_t __SecurityLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SecurityLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getSecTaskCopyValueForEntitlementSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SecurityLibrary();
  uint64_t result = dlsym(v2, "SecTaskCopyValueForEntitlement");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSecTaskCopyValueForEntitlementSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getLSApplicationWorkspaceClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!MobileCoreServicesLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    _OWORD v4[3] = __MobileCoreServicesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_263FA60A0;
    uint64_t v6 = 0;
    MobileCoreServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!MobileCoreServicesLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("LSApplicationWorkspace");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getLSApplicationWorkspaceClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getLSApplicationWorkspaceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MobileCoreServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MobileCoreServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)FrontBoardServicesLibrary();
  uint64_t result = dlsym(v2, "FBSOpenApplicationOptionKeyUnlockDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t FrontBoardServicesLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!FrontBoardServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __FrontBoardServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_263FA60B8;
    uint64_t v5 = 0;
    FrontBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = FrontBoardServicesLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!FrontBoardServicesLibraryCore_frameworkLibrary)
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

uint64_t __FrontBoardServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  FrontBoardServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)FrontBoardServicesLibrary();
  uint64_t result = dlsym(v2, "FBSOpenApplicationOptionKeyPromptUnlockDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24);
  return result;
}

void sub_209BD4298(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_209BD6D64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_209BDF4BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id *location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id a38)
{
}

double CAMLiquidShutterColorForShutterColor(uint64_t a1)
{
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = [MEMORY[0x263F086E0] mainBundle];
  double v3 = [v2 bundleIdentifier];

  int v4 = [v3 isEqualToString:@"com.apple.camera.lockscreen"];
  uint64_t v5 = +[CAMCaptureCapabilities capabilities];
  int v6 = [v5 featureDevelopmentShowLockIndicator];

  if (v6) {
    _ZF = v4 == 0;
  }
  else {
    _ZF = 1;
  }
  if (!_ZF)
  {
    long long v14 = 0uLL;
LABEL_10:
    *(void *)&long long v15 = 0x3FF0000000000000;
    goto LABEL_11;
  }
  if (!a1)
  {
    __asm { FMOV            V0.2D, #1.0 }
    long long v14 = _Q0;
    goto LABEL_10;
  }
  if (a1 == 1)
  {
    __int16 v8 = CAMRedColor();
    [v8 getRed:&v14 green:(char *)&v14 + 8 blue:&v15 alpha:0];
  }
LABEL_11:
  *((void *)&v15 + 1) = 0x3FF0000000000000;

  return *(double *)&v14;
}

void sub_209BE9C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_209BEB9A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209BEBB14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209BEBD40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209BEC0F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209BED9D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209BEED98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209BEEEBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209BEF03C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209BEF1C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209BEF344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209BF5744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

id CAMNUStringForTypeCode(int a1)
{
  v3[0] = HIBYTE(a1);
  v3[1] = BYTE2(a1);
  v3[2] = BYTE1(a1);
  v3[3] = a1;
  v3[4] = 0;
  id v1 = (void *)[[NSString alloc] initWithCString:v3 encoding:30];
  return v1;
}

void sub_209BF7124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209BF83D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209BF86DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL CAMAvailableSpaceIsEqualToSpace(void *a1, void *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

void sub_209BF91E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_209BF9694(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_209BF9C7C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 152));
  _Unwind_Resume(a1);
}

void sub_209BFA0C4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 32));
  _Unwind_Resume(a1);
}

void sub_209BFA714(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_209BFBBC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209BFC0D4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_209BFCF28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209C008A8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_209C00D50(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

id CAMMicaDescriptionForPath(const CGPath *a1)
{
  uint64_t v2 = [MEMORY[0x263F089D8] string];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CAMMicaDescriptionForPath_block_invoke;
  block[3] = &unk_263FA6EB0;
  id v3 = v2;
  id v6 = v3;
  CGPathApplyWithBlock(a1, block);

  return v3;
}

uint64_t __CAMMicaDescriptionForPath_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void **)(a2 + 8);
  switch(*(_DWORD *)a2)
  {
    case 0:
      uint64_t result = objc_msgSend(*(id *)(result + 32), "appendFormat:", @"%f %f m ", *v2, v2[1], v4, v5, v6, v7);
      break;
    case 1:
      uint64_t result = objc_msgSend(*(id *)(result + 32), "appendFormat:", @"%f %f l ", *v2, v2[1], v4, v5, v6, v7);
      break;
    case 3:
      uint64_t result = objc_msgSend(*(id *)(result + 32), "appendFormat:", @"%f %f %f %f %f %f c ", *v2, v2[1], v2[2], v2[3], v2[4], v2[5]);
      break;
    case 4:
      id v3 = *(void **)(result + 32);
      uint64_t result = [v3 appendString:@"h "];
      break;
    default:
      return result;
  }
  return result;
}

void sub_209C01F70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209C02CFC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_209C0364C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209C03A50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_209C040D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209C05A7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209C05C20(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_209C093B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209C0A2FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_209C0BA80(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_209C0BB4C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_209C0BCC0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_209C0BD8C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_209C0C6EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getPAMediaConversionServicePixelWidthKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getPAMediaConversionServicePixelWidthKeySymbolLoc_ptr;
  uint64_t v8 = getPAMediaConversionServicePixelWidthKeySymbolLoc_ptr;
  if (!getPAMediaConversionServicePixelWidthKeySymbolLoc_ptr)
  {
    uint64_t v1 = (void *)MediaConversionServiceLibrary();
    v6[3] = (uint64_t)dlsym(v1, "PAMediaConversionServicePixelWidthKey");
    getPAMediaConversionServicePixelWidthKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)-[CAMImagePickerCameraViewController _handleCapturedImagePickerPhotoWithCropOverlayOutput:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  uint64_t v2 = *v0;
  return v2;
}

id getPAMediaConversionServicePixelHeightKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getPAMediaConversionServicePixelHeightKeySymbolLoc_ptr;
  uint64_t v8 = getPAMediaConversionServicePixelHeightKeySymbolLoc_ptr;
  if (!getPAMediaConversionServicePixelHeightKeySymbolLoc_ptr)
  {
    uint64_t v1 = (void *)MediaConversionServiceLibrary();
    v6[3] = (uint64_t)dlsym(v1, "PAMediaConversionServicePixelHeightKey");
    getPAMediaConversionServicePixelHeightKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)-[CAMImagePickerCameraViewController _handleCapturedImagePickerPhotoWithCropOverlayOutput:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  uint64_t v2 = *v0;
  return v2;
}

id getPAMediaConversionServiceResourceURLCollectionClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPAMediaConversionServiceResourceURLCollectionClass_softClass;
  uint64_t v7 = getPAMediaConversionServiceResourceURLCollectionClass_softClass;
  if (!getPAMediaConversionServiceResourceURLCollectionClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getPAMediaConversionServiceResourceURLCollectionClass_block_invoke;
    v3[3] = &unk_263FA0AB0;
    v3[4] = &v4;
    __getPAMediaConversionServiceResourceURLCollectionClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_209C0E20C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CAMPAMediaConversionNameForJobStatus(uint64_t a1)
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v2 = (void (*)(uint64_t))getPAMediaConversionNameForJobStatusSymbolLoc_ptr;
  id v10 = getPAMediaConversionNameForJobStatusSymbolLoc_ptr;
  if (!getPAMediaConversionNameForJobStatusSymbolLoc_ptr)
  {
    id v3 = (void *)MediaConversionServiceLibrary();
    v8[3] = (uint64_t)dlsym(v3, "PAMediaConversionNameForJobStatus");
    getPAMediaConversionNameForJobStatusSymbolLoc_ptr = (_UNKNOWN *)v8[3];
    uint64_t v2 = (void (*)(uint64_t))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    uint64_t v6 = (_Unwind_Exception *)-[CAMImagePickerCameraViewController _handleCapturedImagePickerPhotoWithCropOverlayOutput:]();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v6);
  }
  uint64_t v4 = v2(a1);
  return v4;
}

void sub_209C10554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209C10668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209C10D6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPAMediaConversionServiceOptionAdjustmentInformationKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getPAMediaConversionServiceOptionAdjustmentInformationKeySymbolLoc_ptr;
  uint64_t v8 = getPAMediaConversionServiceOptionAdjustmentInformationKeySymbolLoc_ptr;
  if (!getPAMediaConversionServiceOptionAdjustmentInformationKeySymbolLoc_ptr)
  {
    id v1 = (void *)MediaConversionServiceLibrary();
    v6[3] = (uint64_t)dlsym(v1, "PAMediaConversionServiceOptionAdjustmentInformationKey");
    getPAMediaConversionServiceOptionAdjustmentInformationKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)-[CAMImagePickerCameraViewController _handleCapturedImagePickerPhotoWithCropOverlayOutput:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  uint64_t v2 = *v0;
  return v2;
}

id getPAMediaConversionServiceOptionApplyOrientationTransformKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getPAMediaConversionServiceOptionApplyOrientationTransformKeySymbolLoc_ptr;
  uint64_t v8 = getPAMediaConversionServiceOptionApplyOrientationTransformKeySymbolLoc_ptr;
  if (!getPAMediaConversionServiceOptionApplyOrientationTransformKeySymbolLoc_ptr)
  {
    id v1 = (void *)MediaConversionServiceLibrary();
    v6[3] = (uint64_t)dlsym(v1, "PAMediaConversionServiceOptionApplyOrientationTransformKey");
    getPAMediaConversionServiceOptionApplyOrientationTransformKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)-[CAMImagePickerCameraViewController _handleCapturedImagePickerPhotoWithCropOverlayOutput:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  uint64_t v2 = *v0;
  return v2;
}

id getPAMediaConversionServiceOptionRequestReasonKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getPAMediaConversionServiceOptionRequestReasonKeySymbolLoc_ptr;
  uint64_t v8 = getPAMediaConversionServiceOptionRequestReasonKeySymbolLoc_ptr;
  if (!getPAMediaConversionServiceOptionRequestReasonKeySymbolLoc_ptr)
  {
    id v1 = (void *)MediaConversionServiceLibrary();
    v6[3] = (uint64_t)dlsym(v1, "PAMediaConversionServiceOptionRequestReasonKey");
    getPAMediaConversionServiceOptionRequestReasonKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)-[CAMImagePickerCameraViewController _handleCapturedImagePickerPhotoWithCropOverlayOutput:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  uint64_t v2 = *v0;
  return v2;
}

id getPAMediaConversionServiceOptionJobPriorityKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getPAMediaConversionServiceOptionJobPriorityKeySymbolLoc_ptr;
  uint64_t v8 = getPAMediaConversionServiceOptionJobPriorityKeySymbolLoc_ptr;
  if (!getPAMediaConversionServiceOptionJobPriorityKeySymbolLoc_ptr)
  {
    id v1 = (void *)MediaConversionServiceLibrary();
    v6[3] = (uint64_t)dlsym(v1, "PAMediaConversionServiceOptionJobPriorityKey");
    getPAMediaConversionServiceOptionJobPriorityKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)-[CAMImagePickerCameraViewController _handleCapturedImagePickerPhotoWithCropOverlayOutput:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  uint64_t v2 = *v0;
  return v2;
}

id getPAMediaConversionServiceOptionScaleFactorKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getPAMediaConversionServiceOptionScaleFactorKeySymbolLoc_ptr;
  uint64_t v8 = getPAMediaConversionServiceOptionScaleFactorKeySymbolLoc_ptr;
  if (!getPAMediaConversionServiceOptionScaleFactorKeySymbolLoc_ptr)
  {
    id v1 = (void *)MediaConversionServiceLibrary();
    v6[3] = (uint64_t)dlsym(v1, "PAMediaConversionServiceOptionScaleFactorKey");
    getPAMediaConversionServiceOptionScaleFactorKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)-[CAMImagePickerCameraViewController _handleCapturedImagePickerPhotoWithCropOverlayOutput:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  uint64_t v2 = *v0;
  return v2;
}

id getPAMediaConversionResourceRoleVideoComplement()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getPAMediaConversionResourceRoleVideoComplementSymbolLoc_ptr;
  uint64_t v8 = getPAMediaConversionResourceRoleVideoComplementSymbolLoc_ptr;
  if (!getPAMediaConversionResourceRoleVideoComplementSymbolLoc_ptr)
  {
    id v1 = (void *)MediaConversionServiceLibrary();
    v6[3] = (uint64_t)dlsym(v1, "PAMediaConversionResourceRoleVideoComplement");
    getPAMediaConversionResourceRoleVideoComplementSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)-[CAMImagePickerCameraViewController _handleCapturedImagePickerPhotoWithCropOverlayOutput:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  uint64_t v2 = *v0;
  return v2;
}

void *__getPAMediaConversionServicePixelWidthKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MediaConversionServiceLibrary();
  uint64_t result = dlsym(v2, "PAMediaConversionServicePixelWidthKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPAMediaConversionServicePixelWidthKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t MediaConversionServiceLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!MediaConversionServiceLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __MediaConversionServiceLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_263FA7348;
    uint64_t v5 = 0;
    MediaConversionServiceLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = MediaConversionServiceLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!MediaConversionServiceLibraryCore_frameworkLibrary)
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

uint64_t __MediaConversionServiceLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MediaConversionServiceLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getPAMediaConversionServicePixelHeightKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MediaConversionServiceLibrary();
  uint64_t result = dlsym(v2, "PAMediaConversionServicePixelHeightKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPAMediaConversionServicePixelHeightKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPAMediaConversionServiceResourceURLCollectionClass_block_invoke(uint64_t a1)
{
  MediaConversionServiceLibrary();
  Class result = objc_getClass("PAMediaConversionServiceResourceURLCollection");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPAMediaConversionServiceResourceURLCollectionClass_block_invoke_cold_1();
  }
  getPAMediaConversionServiceResourceURLCollectionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                              + 24);
  return result;
}

void *__getPAMediaConversionNameForJobStatusSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MediaConversionServiceLibrary();
  Class result = dlsym(v2, "PAMediaConversionNameForJobStatus");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPAMediaConversionNameForJobStatusSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPAImageConversionServiceClientClass_block_invoke(uint64_t a1)
{
  MediaConversionServiceLibrary();
  Class result = objc_getClass("PAImageConversionServiceClient");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPAImageConversionServiceClientClass_block_invoke_cold_1();
  }
  getPAImageConversionServiceClientClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPAVideoConversionServiceClientClass_block_invoke(uint64_t a1)
{
  MediaConversionServiceLibrary();
  Class result = objc_getClass("PAVideoConversionServiceClient");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPAVideoConversionServiceClientClass_block_invoke_cold_1();
  }
  getPAVideoConversionServiceClientClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getPAMediaConversionServiceAdjustmentDataKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MediaConversionServiceLibrary();
  Class result = dlsym(v2, "PAMediaConversionServiceAdjustmentDataKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPAMediaConversionServiceAdjustmentDataKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getPAMediaConversionServiceAdjustmentFormatIdentifierKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MediaConversionServiceLibrary();
  Class result = dlsym(v2, "PAMediaConversionServiceAdjustmentFormatIdentifierKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPAMediaConversionServiceAdjustmentFormatIdentifierKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                                + 8)
                                                                                    + 24);
  return result;
}

void *__getPAMediaConversionServiceAdjustmentFormatVersionKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MediaConversionServiceLibrary();
  Class result = dlsym(v2, "PAMediaConversionServiceAdjustmentFormatVersionKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPAMediaConversionServiceAdjustmentFormatVersionKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                 + 24);
  return result;
}

void *__getPAMediaConversionServiceOptionAdjustmentInformationKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MediaConversionServiceLibrary();
  Class result = dlsym(v2, "PAMediaConversionServiceOptionAdjustmentInformationKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPAMediaConversionServiceOptionAdjustmentInformationKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                                 + 8)
                                                                                     + 24);
  return result;
}

void *__getPAMediaConversionServiceOptionApplyOrientationTransformKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MediaConversionServiceLibrary();
  Class result = dlsym(v2, "PAMediaConversionServiceOptionApplyOrientationTransformKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPAMediaConversionServiceOptionApplyOrientationTransformKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                         + 24);
  return result;
}

void *__getPAMediaConversionServiceOptionRequestReasonKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MediaConversionServiceLibrary();
  Class result = dlsym(v2, "PAMediaConversionServiceOptionRequestReasonKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPAMediaConversionServiceOptionRequestReasonKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                             + 24);
  return result;
}

void *__getPAMediaConversionServiceOptionJobPriorityKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MediaConversionServiceLibrary();
  Class result = dlsym(v2, "PAMediaConversionServiceOptionJobPriorityKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPAMediaConversionServiceOptionJobPriorityKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  return result;
}

void *__getPAMediaConversionServiceOptionScaleFactorKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MediaConversionServiceLibrary();
  Class result = dlsym(v2, "PAMediaConversionServiceOptionScaleFactorKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPAMediaConversionServiceOptionScaleFactorKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  return result;
}

Class __getPAMediaConversionServiceImageMetadataPolicyClass_block_invoke(uint64_t a1)
{
  MediaConversionServiceLibrary();
  Class result = objc_getClass("PAMediaConversionServiceImageMetadataPolicy");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPAMediaConversionServiceImageMetadataPolicyClass_block_invoke_cold_1();
  }
  getPAMediaConversionServiceImageMetadataPolicyClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24);
  return result;
}

void *__getPAMediaConversionServiceOptionMetadataPolicyKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MediaConversionServiceLibrary();
  Class result = dlsym(v2, "PAMediaConversionServiceOptionMetadataPolicyKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPAMediaConversionServiceOptionMetadataPolicyKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                              + 24);
  return result;
}

void *__getPAMediaConversionResourceRoleVideoComplementSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MediaConversionServiceLibrary();
  Class result = dlsym(v2, "PAMediaConversionResourceRoleVideoComplement");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPAMediaConversionResourceRoleVideoComplementSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  return result;
}

void OUTLINED_FUNCTION_1_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

uint64_t Subsystems.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = objc_msgSend(objc_allocWithZone((Class)CAMSubsystems), sel_init);
  return v0;
}

uint64_t Subsystems.init()()
{
  *(void *)(v0 + 16) = objc_msgSend(objc_allocWithZone((Class)CAMSubsystems), sel_init);
  return v0;
}

uint64_t Subsystems.deinit()
{
  return v0;
}

uint64_t Subsystems.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

id Subsystems.viewfinderViewController.getter()
{
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_viewfinderViewController);
  return v1;
}

id sub_209C13968()
{
  id v1 = objc_msgSend(*(id *)(*(void *)v0 + 16), sel_viewfinderViewController);
  return v1;
}

uint64_t variable initialization expression of LaunchAppIntent._target()
{
  uint64_t v0 = sub_209C4C788();
  uint64_t v23 = *(void *)(v0 - 8);
  uint64_t v24 = v0;
  ((void (*)(void))MEMORY[0x270FA5388])();
  double v22 = (char *)v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE858);
  uint64_t v2 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  id v21 = (char *)v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  id v20 = (char *)v19 - v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE860);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_209C4C878();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_209C4C8F8();
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v13 = sub_209C4D1F8();
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v14 = sub_209C4C888();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  v19[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE868);
  sub_209C4D1E8();
  sub_209C4C8E8();
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F06D18], v8);
  sub_209C4C898();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v7, 1, 1, v14);
  char v25 = 0;
  uint64_t v16 = sub_209C4C548();
  double v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v20, 1, 1, v16);
  v17(v21, 1, 1, v16);
  (*(void (**)(char *, void, uint64_t))(v23 + 104))(v22, *MEMORY[0x263EFBDC8], v24);
  sub_209C13E50();
  return sub_209C4C638();
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

unint64_t sub_209C13E50()
{
  unint64_t result = qword_26AAFE870;
  if (!qword_26AAFE870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFE870);
  }
  return result;
}

unint64_t sub_209C13EA8()
{
  unint64_t result = qword_26AAFE880;
  if (!qword_26AAFE880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFE880);
  }
  return result;
}

unint64_t sub_209C13EFC()
{
  unint64_t result = qword_26AAFE888;
  if (!qword_26AAFE888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFE888);
  }
  return result;
}

uint64_t variable initialization expression of ChangeCameraDeviceIntent._device()
{
  uint64_t v0 = sub_209C4C788();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = &v17[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE858);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = &v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = &v17[-v8];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE860);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = &v17[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE890);
  uint64_t v13 = sub_209C4C888();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  v17[15] = 2;
  uint64_t v14 = sub_209C4C548();
  uint64_t v15 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v9, 1, 1, v14);
  v15(v7, 1, 1, v14);
  (*(void (**)(unsigned char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263EFBDC8], v0);
  sub_209C141C4();
  return sub_209C4C628();
}

unint64_t sub_209C141C4()
{
  unint64_t result = qword_26AAFE898;
  if (!qword_26AAFE898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFE898);
  }
  return result;
}

uint64_t _s8CameraUI21OpenCaptureModeIntentV7_target33_7009AF8035CA8C74707A789786011F7CLL10AppIntents0F9ParameterCyAA0dE0OGvpfi_0()
{
  uint64_t v0 = sub_209C4C788();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = &v17[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE858);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = &v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = &v17[-v8];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE860);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = &v17[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE878);
  uint64_t v13 = sub_209C4C888();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  v17[15] = 11;
  uint64_t v14 = sub_209C4C548();
  uint64_t v15 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v9, 1, 1, v14);
  v15(v7, 1, 1, v14);
  (*(void (**)(unsigned char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263EFBDC8], v0);
  sub_209C13EA8();
  sub_209C13EFC();
  return sub_209C4C618();
}

uint64_t variable initialization expression of StartCaptureIntent._timerDuration()
{
  uint64_t v0 = sub_209C4C788();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE858);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v17 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE860);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE8A0);
  uint64_t v13 = sub_209C4C888();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  char v18 = 4;
  uint64_t v14 = sub_209C4C548();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v9, 1, 1, v14);
  v15(v7, 1, 1, v14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE8A8);
  swift_getKeyPath();
  uint64_t v17 = sub_209C4C7C8();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263EFBDC8], v0);
  sub_209C14A30();
  sub_209C14A84();
  return sub_209C4C618();
}

uint64_t variable initialization expression of StartCaptureIntent._device()
{
  uint64_t v0 = sub_209C4C788();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE858);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v17 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE860);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE8C0);
  uint64_t v13 = sub_209C4C888();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  char v18 = 2;
  uint64_t v14 = sub_209C4C548();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v9, 1, 1, v14);
  v15(v7, 1, 1, v14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE8A8);
  swift_getKeyPath();
  uint64_t v17 = sub_209C4C7C8();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263EFBDC8], v0);
  sub_209C14AD8();
  sub_209C141C4();
  return sub_209C4C618();
}

uint64_t sub_209C14A04@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_209C4C608();
  *a1 = result;
  return result;
}

unint64_t sub_209C14A30()
{
  unint64_t result = qword_26AAFE8B0;
  if (!qword_26AAFE8B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFE8B0);
  }
  return result;
}

unint64_t sub_209C14A84()
{
  unint64_t result = qword_26AAFE8B8;
  if (!qword_26AAFE8B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFE8B8);
  }
  return result;
}

unint64_t sub_209C14AD8()
{
  unint64_t result = qword_26AAFE8C8;
  if (!qword_26AAFE8C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFE8C8);
  }
  return result;
}

uint64_t variable initialization expression of ViewfinderViewController._hasHandleURLs()
{
  return 0;
}

uint64_t type metadata accessor for Subsystems()
{
  return self;
}

void type metadata accessor for CaptureButtonStage(uint64_t a1)
{
}

void type metadata accessor for OverlaySliderAlignment(uint64_t a1)
{
}

void type metadata accessor for UIInterfaceOrientation(uint64_t a1)
{
}

void *sub_209C14B94@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

BOOL sub_209C14BA4(void *a1, void *a2)
{
  return *a1 == *a2;
}

void sub_209C14BB8(void *a1@<X8>)
{
  *a1 = *v1;
}

void type metadata accessor for CGColor(uint64_t a1)
{
}

void type metadata accessor for PXUnlockDeviceActionType(uint64_t a1)
{
}

void sub_209C14BEC(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t static ViewfinderLockScreenExtensionHelper.beginDelayingAppearance()()
{
  return sub_209C14D10(MEMORY[0x263F10550]);
}

uint64_t static ViewfinderLockScreenExtensionHelper.endDelayingAppearance()()
{
  return sub_209C14D10(MEMORY[0x263F10540]);
}

uint64_t static ViewfinderLockScreenExtensionHelper.notifyCompleteTransition()()
{
  return sub_209C14D10(MEMORY[0x263F10558]);
}

uint64_t sub_209C14D10(void (*a1)(void))
{
  sub_209C4CA78();
  sub_209C4CA68();
  a1();
  return swift_release();
}

uint64_t sub_209C14D78(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  sub_209C4CA78();
  sub_209C4CA68();
  a3();
  return swift_release();
}

uint64_t static ViewfinderLockScreenExtensionHelper.transitionToApplication(for:session:)(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_209C14E64;
  return MEMORY[0x270EF5640](a1);
}

uint64_t sub_209C14E64()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

id ViewfinderLockScreenExtensionHelper.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id ViewfinderLockScreenExtensionHelper.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id ViewfinderLockScreenExtensionHelper.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id _s8CameraUI35ViewfinderLockScreenExtensionHelperC24executeUnlockOneUpAction_2onySo014PXUnlockDeviceL4TypeV_So05PUOneK14ViewControllerCSgtFZ_0(id result, id a2)
{
  if (a2)
  {
    id v2 = result;
    unint64_t result = objc_msgSend(a2, sel_actionsController);
    if (result)
    {
      switch((unint64_t)v2)
      {
        case 1uLL:
          objc_msgSend(result, sel_performSimpleActionWithActionType_, 15);
          break;
        case 2uLL:
          objc_msgSend(result, sel_performSimpleActionWithActionType_, 63);
          break;
        case 3uLL:
          objc_msgSend(result, sel_performShareAction);
          break;
        case 4uLL:
          objc_msgSend(result, sel_performSimpleActionWithActionType_, 40);
          break;
        default:
          break;
      }
      return (id)swift_unknownObjectRelease();
    }
  }
  return result;
}

uint64_t type metadata accessor for ViewfinderLockScreenExtensionHelper()
{
  return self;
}

uint64_t sub_209C15188()
{
  if (!*(void *)(v0 + OBJC_IVAR___CAMOnboardingBuddyViewManager_viewModel)) {
    return 0;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_209C4C718();
  sub_209C4CD68();
  swift_release();
  swift_release();
  swift_release();
  return v2;
}

uint64_t sub_209C15220(uint64_t (*a1)(uint64_t), uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = OBJC_IVAR___CAMOnboardingBuddyViewManager_viewModel;
  if (!*(void *)(v2 + OBJC_IVAR___CAMOnboardingBuddyViewManager_viewModel)) {
    goto LABEL_9;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_209C4C718();
  sub_209C4CD68();
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  if (v12 != 2)
  {
    if (v12 == 1)
    {
      uint64_t v8 = *(void *)(v2 + v6);
      if (v8)
      {
        uint64_t v9 = (uint64_t *)(v8 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_assetLoadingComplete);
        uint64_t v10 = *v9;
        uint64_t *v9 = (uint64_t)a1;
        v9[1] = a2;
        sub_209C179D8((uint64_t)a1);
        return sub_209C17974(v10);
      }
      return result;
    }
    if (v12)
    {
      uint64_t result = sub_209C4D598();
      __break(1u);
      return result;
    }
LABEL_9:
    type metadata accessor for OnboardingBuddySetupViewModel();
    swift_allocObject();
    sub_209C179D8((uint64_t)a1);
    uint64_t v11 = sub_209C41CC4((uint64_t)a1, a2);
    sub_209C17974((uint64_t)a1);
    *(void *)(v3 + v6) = v11;
    return swift_release();
  }
  if (a1) {
    return a1(2);
  }
  return result;
}

uint64_t sub_209C1545C()
{
  uint64_t v1 = OBJC_IVAR___CAMOnboardingBuddyViewManager_viewModel;
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR___CAMOnboardingBuddyViewManager_viewModel);
  if (!v2)
  {
    type metadata accessor for OnboardingBuddySetupViewModel();
    swift_allocObject();
    uint64_t v2 = sub_209C41CC4(0, 0);
  }
  *(void *)(v0 + v1) = v2;
  sub_209C4C718();
  uint64_t result = swift_release();
  uint64_t v4 = *(void *)(v0 + v1);
  if (v4)
  {
    swift_unknownObjectWeakInit();
    swift_unknownObjectWeakAssign();
    v7[1] = sub_209C17898;
    v7[2] = v4;
    char v8 = 0;
    sub_209C178A0((uint64_t)v7, (uint64_t)v9);
    sub_209C178E4((uint64_t)v9, (uint64_t)v7);
    id v5 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_2676007A0));
    sub_209C4C718();
    uint64_t v6 = sub_209C4CEA8();
    sub_209C17940((uint64_t)v9);
    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_209C15628()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for OnboardingBuddyViewManager()
{
  return self;
}

uint64_t sub_209C15694@<X0>(uint64_t a1@<X8>)
{
  uint64_t v29 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676007A8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (uint64_t *)((char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676007B0);
  uint64_t v6 = v5 - 8;
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676007B8);
  uint64_t v10 = v9 - 8;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *uint64_t v4 = sub_209C4D0F8();
  v4[1] = v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676007C0);
  sub_209C159D4(v1, (uint64_t)v4 + *(int *)(v14 + 44));
  uint64_t v15 = sub_209C4D088();
  char v16 = sub_209C4CF98();
  sub_209C18060((uint64_t)v4, (uint64_t)v8, &qword_2676007A8);
  uint64_t v17 = &v8[*(int *)(v6 + 44)];
  *(void *)uint64_t v17 = v15;
  v17[8] = v16;
  sub_209C1815C((uint64_t)v4, &qword_2676007A8);
  uint64_t v18 = sub_209C4D108();
  type metadata accessor for OnboardingBuddySetupViewModel();
  sub_209C17F8C(&qword_2676007C8, (void (*)(uint64_t))type metadata accessor for OnboardingBuddySetupViewModel);
  sub_209C4CDA8();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_209C4CD68();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v19 = v30;
  uint64_t v20 = v31;
  sub_209C18060((uint64_t)v8, (uint64_t)v12, &qword_2676007B0);
  id v21 = (uint64_t *)&v12[*(int *)(v10 + 44)];
  *id v21 = v18;
  v21[1] = v19;
  v21[2] = v20;
  sub_209C1815C((uint64_t)v8, &qword_2676007B0);
  uint64_t v22 = sub_209C4D108();
  sub_209C4CDA8();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_209C4CD68();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v23 = v30;
  uint64_t v24 = v31;
  uint64_t v25 = v29;
  sub_209C18060((uint64_t)v12, v29, &qword_2676007B8);
  v26 = (uint64_t *)(v25 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2676007D0) + 36));
  uint64_t *v26 = v22;
  v26[1] = v23;
  v26[2] = v24;
  return sub_209C1815C((uint64_t)v12, &qword_2676007B8);
}

uint64_t sub_209C159D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676007D8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = &v32[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676007E0);
  uint64_t v8 = v7 - 8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = &v32[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v9);
  v40 = &v32[-v12];
  uint64_t v38 = sub_209C4CE98();
  *(void *)&long long v34 = a1;
  type metadata accessor for OnboardingBuddySetupViewModel();
  sub_209C17F8C(&qword_2676007C8, (void (*)(uint64_t))type metadata accessor for OnboardingBuddySetupViewModel);
  sub_209C4CDA8();
  uint64_t v13 = sub_209C4CDD8();
  uint64_t v15 = v14;
  sub_209C4D0F8();
  sub_209C4CDB8();
  uint64_t v16 = v42;
  int v41 = v43;
  uint64_t v36 = v46;
  uint64_t v37 = v44;
  uint64_t v35 = v47;
  char v54 = 1;
  char v53 = 1;
  unsigned __int8 v52 = v43;
  unsigned __int8 v51 = v45;
  unsigned __int8 v17 = v45;
  int v33 = v45;
  int v39 = sub_209C4CF98();
  *(void *)uint64_t v6 = sub_209C4CE98();
  *((void *)v6 + 1) = 0;
  v6[16] = 0;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676007E8);
  sub_209C15DBC(v34, &v6[*(int *)(v18 + 44)]);
  sub_209C4D0E8();
  sub_209C4CDB8();
  sub_209C18060((uint64_t)v6, (uint64_t)v11, &qword_2676007D8);
  uint64_t v19 = &v11[*(int *)(v8 + 44)];
  long long v20 = v49;
  *uint64_t v19 = v48;
  v19[1] = v20;
  void v19[2] = v50;
  sub_209C1815C((uint64_t)v6, &qword_2676007D8);
  id v21 = v40;
  sub_209C17FFC((uint64_t)v11, (uint64_t)v40, &qword_2676007E0);
  sub_209C18060((uint64_t)v21, (uint64_t)v11, &qword_2676007E0);
  uint64_t v22 = v37;
  uint64_t v23 = v38;
  long long v55 = (unint64_t)v38;
  LOBYTE(v56) = 1;
  *((void *)&v56 + 1) = v13;
  *(void *)&long long v57 = v15;
  BYTE8(v57) = 0;
  long long v34 = xmmword_209C7C0B0;
  long long v58 = xmmword_209C7C0B0;
  *(void *)&long long v59 = 0;
  BYTE8(v59) = 1;
  *(void *)&long long v60 = v16;
  BYTE8(v60) = v41;
  *(void *)&long long v61 = v37;
  BYTE8(v61) = v17;
  uint64_t v25 = v35;
  uint64_t v24 = v36;
  *(void *)&long long v62 = v36;
  *((void *)&v62 + 1) = v35;
  char v63 = v39;
  *(unsigned char *)(a2 + 128) = v39;
  long long v26 = v62;
  *(_OWORD *)(a2 + 96) = v61;
  *(_OWORD *)(a2 + 112) = v26;
  long long v27 = v58;
  *(_OWORD *)(a2 + 32) = v57;
  *(_OWORD *)(a2 + 48) = v27;
  long long v28 = v60;
  *(_OWORD *)(a2 + 64) = v59;
  *(_OWORD *)(a2 + 80) = v28;
  long long v29 = v56;
  *(_OWORD *)a2 = v55;
  *(_OWORD *)(a2 + 16) = v29;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676007F0);
  sub_209C18060((uint64_t)v11, a2 + *(int *)(v30 + 48), &qword_2676007E0);
  sub_209C17C68((uint64_t)&v55);
  sub_209C1815C((uint64_t)v40, &qword_2676007E0);
  sub_209C1815C((uint64_t)v11, &qword_2676007E0);
  v64[0] = v23;
  v64[1] = 0;
  char v65 = 1;
  uint64_t v66 = v13;
  uint64_t v67 = v15;
  char v68 = 0;
  long long v69 = v34;
  uint64_t v70 = 0;
  char v71 = 1;
  uint64_t v72 = v16;
  char v73 = v41;
  uint64_t v74 = v22;
  char v75 = v33;
  uint64_t v76 = v24;
  uint64_t v77 = v25;
  char v78 = v39;
  return sub_209C17C94((uint64_t)v64);
}

uint64_t sub_209C15DBC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  v149 = a2;
  uint64_t v3 = sub_209C4CE08();
  uint64_t v147 = *(void *)(v3 - 8);
  uint64_t v148 = v3;
  MEMORY[0x270FA5388](v3);
  v146 = (char *)v118 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v141 = sub_209C4CEC8();
  uint64_t v143 = *(void *)(v141 - 8);
  MEMORY[0x270FA5388](v141);
  v136 = (char *)v118 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676007F8);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v138 = v6;
  uint64_t v139 = v7;
  MEMORY[0x270FA5388](v6);
  v133 = (char *)v118 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600800);
  uint64_t v144 = *(void *)(v9 - 8);
  uint64_t v145 = v9;
  MEMORY[0x270FA5388](v9);
  v134 = (char *)v118 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600808) - 8;
  MEMORY[0x270FA5388](v137);
  v135 = (char *)v118 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v142 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600810) - 8;
  uint64_t v12 = MEMORY[0x270FA5388](v142);
  uint64_t v140 = (uint64_t)v118 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v160 = (uint64_t)v118 - v14;
  uint64_t v152 = sub_209C4CE88();
  uint64_t v161 = *(void *)(v152 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v152);
  v153 = (char *)v118 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v150 = a1;
  v151 = (char *)v118 - v17;
  uint64_t v156 = type metadata accessor for OnboardingBuddySetupViewModel();
  uint64_t v155 = sub_209C17F8C(&qword_2676007C8, (void (*)(uint64_t))type metadata accessor for OnboardingBuddySetupViewModel);
  sub_209C4CDA8();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_209C4CD68();
  swift_release();
  swift_release();
  swift_release();
  unint64_t v157 = sub_209C17CC0();
  uint64_t v18 = sub_209C4D038();
  uint64_t v20 = v19;
  char v22 = v21 & 1;
  sub_209C4CFC8();
  uint64_t v23 = sub_209C4D028();
  uint64_t v25 = v24;
  char v27 = v26;
  swift_release();
  sub_209C17D14(v18, v20, v22);
  swift_bridgeObjectRelease();
  sub_209C4CFE8();
  uint64_t v28 = sub_209C4D008();
  uint64_t v30 = v29;
  char v32 = v31 & 1;
  sub_209C17D14(v23, v25, v27 & 1);
  swift_bridgeObjectRelease();
  sub_209C4D098();
  uint64_t v33 = sub_209C4D018();
  uint64_t v130 = v34;
  uint64_t v131 = v33;
  LOBYTE(v20) = v35;
  uint64_t v132 = v36;
  swift_release();
  sub_209C17D14(v28, v30, v32);
  swift_bridgeObjectRelease();
  *((void *)&v129 + 1) = swift_getKeyPath();
  sub_209C4CDA8();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_209C4CD68();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v158 = *((void *)&v245 + 1);
  *(void *)&long long v129 = v245;
  uint64_t v37 = v151;
  sub_209C4CE78();
  uint64_t v38 = v161;
  int v39 = *(void (**)(char *, char *, uint64_t))(v161 + 16);
  uint64_t v119 = v161 + 16;
  v120 = v39;
  uint64_t v40 = v152;
  v39(v153, v37, v152);
  v118[1] = sub_209C17F8C(&qword_267600820, MEMORY[0x263F196B8]);
  uint64_t v159 = sub_209C4CDC8();
  LOBYTE(v245) = v20 & 1;
  int v41 = *(void (**)(char *, uint64_t))(v38 + 8);
  uint64_t v161 = v38 + 8;
  v121 = v41;
  v41(v37, v40);
  int v128 = v245;
  sub_209C4D0F8();
  sub_209C4CDB8();
  uint64_t v127 = v163;
  int v126 = v164;
  uint64_t v125 = v165;
  int v124 = v166;
  uint64_t v122 = v168;
  uint64_t v123 = v167;
  sub_209C4CDA8();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_209C4CD68();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v42 = sub_209C4D038();
  uint64_t v44 = v43;
  LOBYTE(v20) = v45 & 1;
  sub_209C4CFB8();
  uint64_t v46 = sub_209C4D028();
  uint64_t v48 = v47;
  LOBYTE(v37) = v49;
  swift_release();
  sub_209C17D14(v42, v44, v20);
  swift_bridgeObjectRelease();
  sub_209C4CFD8();
  uint64_t v50 = sub_209C4D008();
  uint64_t v52 = v51;
  uint64_t v54 = v53;
  LOBYTE(v30) = v55 & 1;
  sub_209C17D14(v46, v48, v37 & 1);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v57 = sub_209C4D098();
  uint64_t v58 = swift_getKeyPath();
  uint64_t v181 = v50;
  uint64_t v182 = v52;
  char v183 = v30;
  uint64_t v184 = v54;
  uint64_t v185 = KeyPath;
  char v186 = 1;
  uint64_t v187 = v58;
  uint64_t v188 = v57;
  uint64_t v189 = 0x3FE3333333333333;
  sub_209C4D0F8();
  sub_209C1709C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)&v245, 0.0, 1, 0.0, 1);
  sub_209C17D14(v50, v52, v30);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  long long v200 = v253;
  long long v201 = v254;
  long long v202 = v255;
  uint64_t v203 = v256;
  long long v196 = v249;
  long long v197 = v250;
  long long v198 = v251;
  long long v199 = v252;
  long long v192 = v245;
  long long v193 = v246;
  long long v194 = v247;
  long long v195 = v248;
  LODWORD(v157) = sub_209C4CF88();
  sub_209C4CD98();
  uint64_t v60 = v59;
  uint64_t v62 = v61;
  uint64_t v64 = v63;
  uint64_t v66 = v65;
  unsigned __int8 v190 = 0;
  uint64_t v67 = v150;
  sub_209C4CDA8();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_209C4CD68();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v155 = *((void *)&v245 + 1);
  uint64_t v156 = v245;
  long long v214 = v200;
  long long v215 = v201;
  long long v216 = v202;
  uint64_t v217 = v203;
  long long v210 = v196;
  long long v211 = v197;
  long long v212 = v198;
  long long v213 = v199;
  long long v206 = v192;
  long long v207 = v193;
  long long v208 = v194;
  long long v209 = v195;
  v205[0] = *(_DWORD *)v191;
  *(_DWORD *)((char *)v205 + 3) = *(_DWORD *)&v191[3];
  int v154 = v190;
  char v68 = v151;
  sub_209C4CE78();
  uint64_t v69 = v152;
  v120(v153, v68, v152);
  v153 = (char *)sub_209C4CDC8();
  long long v253 = v214;
  long long v254 = v215;
  long long v255 = v216;
  uint64_t v256 = v217;
  long long v249 = v210;
  long long v250 = v211;
  long long v251 = v212;
  long long v252 = v213;
  long long v245 = v206;
  long long v246 = v207;
  long long v247 = v208;
  long long v248 = v209;
  LODWORD(v232[0]) = v205[0];
  *(_DWORD *)((char *)v232 + 3) = *(_DWORD *)((char *)v205 + 3);
  LODWORD(v175) = *(_DWORD *)v204;
  *(_DWORD *)((char *)&v175 + 3) = *(_DWORD *)&v204[3];
  v121(v68, v69);
  long long v228 = v253;
  long long v229 = v254;
  long long v230 = v255;
  uint64_t v231 = v256;
  long long v224 = v249;
  long long v225 = v250;
  long long v226 = v251;
  long long v227 = v252;
  long long v220 = v245;
  long long v221 = v246;
  long long v222 = v247;
  long long v223 = v248;
  v219[0] = v232[0];
  *(_DWORD *)((char *)v219 + 3) = *(_DWORD *)((char *)v232 + 3);
  v218[0] = v175;
  *(_DWORD *)((char *)v218 + 3) = *(_DWORD *)((char *)&v175 + 3);
  sub_209C4D0F8();
  sub_209C4CDB8();
  uint64_t v161 = v169;
  LODWORD(v152) = v170;
  v151 = v171;
  LODWORD(v121) = v172;
  uint64_t v119 = v174;
  v120 = v173;
  sub_209C178E4(v67, (uint64_t)&v245);
  uint64_t v70 = swift_allocObject();
  sub_209C178A0((uint64_t)&v245, v70 + 16);
  uint64_t v162 = v67;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267600828);
  sub_209C17E9C(&qword_267600830, &qword_267600828, (void (*)(void))sub_209C17E6C);
  char v71 = v133;
  sub_209C4D0D8();
  uint64_t v72 = v136;
  sub_209C4CEB8();
  sub_209C184B8(&qword_267600858, &qword_2676007F8);
  sub_209C17F8C(&qword_267600860, MEMORY[0x263F1A3B8]);
  char v73 = v134;
  uint64_t v74 = v138;
  uint64_t v75 = v141;
  sub_209C4D068();
  (*(void (**)(char *, uint64_t))(v143 + 8))(v72, v75);
  (*(void (**)(char *, uint64_t))(v139 + 8))(v71, v74);
  uint64_t v76 = v146;
  sub_209C4CDF8();
  uint64_t v77 = swift_getKeyPath();
  uint64_t v78 = (uint64_t)v135;
  v79 = (uint64_t *)&v135[*(int *)(v137 + 44)];
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600868);
  uint64_t v82 = v147;
  uint64_t v81 = v148;
  (*(void (**)(char *, char *, uint64_t))(v147 + 16))((char *)v79 + *(int *)(v80 + 28), v76, v148);
  uint64_t *v79 = v77;
  uint64_t v84 = v144;
  uint64_t v83 = v145;
  (*(void (**)(uint64_t, char *, uint64_t))(v144 + 16))(v78, v73, v145);
  (*(void (**)(char *, uint64_t))(v82 + 8))(v76, v81);
  (*(void (**)(char *, uint64_t))(v84 + 8))(v73, v83);
  LOBYTE(v83) = sub_209C4CF88();
  sub_209C4CD98();
  uint64_t v86 = v85;
  uint64_t v88 = v87;
  uint64_t v90 = v89;
  uint64_t v92 = v91;
  uint64_t v93 = v140;
  sub_209C18060(v78, v140, &qword_267600808);
  uint64_t v94 = v93 + *(int *)(v142 + 44);
  *(unsigned char *)uint64_t v94 = v83;
  *(void *)(v94 + 8) = v86;
  *(void *)(v94 + 16) = v88;
  *(void *)(v94 + 24) = v90;
  *(void *)(v94 + 32) = v92;
  *(unsigned char *)(v94 + 40) = 0;
  sub_209C1815C(v78, &qword_267600808);
  uint64_t v95 = v160;
  sub_209C17FFC(v93, v160, &qword_267600810);
  sub_209C4D0F8();
  sub_209C4CDB8();
  uint64_t v150 = v175;
  LODWORD(v148) = v176;
  uint64_t v147 = v177;
  LODWORD(v146) = v178;
  uint64_t v144 = v180;
  uint64_t v145 = v179;
  sub_209C18060(v95, v93, &qword_267600810);
  v96 = v149;
  void *v149 = 0;
  *((unsigned char *)v96 + 8) = 1;
  uint64_t v98 = v130;
  uint64_t v97 = v131;
  v96[2] = v131;
  v96[3] = v98;
  LOBYTE(v37) = v128;
  *((unsigned char *)v96 + 32) = v128;
  long long v99 = v129;
  v96[5] = v132;
  v96[6] = *((void *)&v99 + 1);
  *((unsigned char *)v96 + 56) = 1;
  uint64_t v100 = v158;
  v96[8] = v99;
  v96[9] = v100;
  v96[10] = v159;
  v96[11] = 0;
  *((unsigned char *)v96 + 96) = 1;
  v96[13] = v127;
  *((unsigned char *)v96 + 112) = v126;
  v96[15] = v125;
  *((unsigned char *)v96 + 128) = v124;
  uint64_t v101 = v122;
  v96[17] = v123;
  v96[18] = v101;
  long long v237 = v228;
  long long v238 = v229;
  long long v239 = v230;
  *(void *)&long long v240 = v231;
  long long v233 = v224;
  long long v234 = v225;
  long long v235 = v226;
  long long v236 = v227;
  v232[0] = v220;
  v232[1] = v221;
  v232[2] = v222;
  v232[3] = v223;
  BYTE8(v240) = v157;
  HIDWORD(v240) = *(_DWORD *)((char *)v219 + 3);
  *(_DWORD *)((char *)&v240 + 9) = v219[0];
  *(void *)&long long v241 = v60;
  *((void *)&v241 + 1) = v62;
  *(void *)&long long v242 = v64;
  *((void *)&v242 + 1) = v66;
  LOBYTE(v243) = v154;
  *(_DWORD *)((char *)&v243 + 1) = v218[0];
  DWORD1(v243) = *(_DWORD *)((char *)v218 + 3);
  *((void *)&v243 + 1) = v156;
  *(void *)&long long v244 = v155;
  *((void *)&v244 + 1) = v153;
  long long v102 = v220;
  long long v103 = v221;
  long long v104 = v222;
  *(_OWORD *)(v96 + 25) = v223;
  *(_OWORD *)(v96 + 23) = v104;
  *(_OWORD *)(v96 + 21) = v103;
  *(_OWORD *)(v96 + 19) = v102;
  long long v105 = v233;
  long long v106 = v234;
  long long v107 = v236;
  *(_OWORD *)(v96 + 31) = v235;
  *(_OWORD *)(v96 + 29) = v106;
  *(_OWORD *)(v96 + 27) = v105;
  long long v108 = v237;
  long long v109 = v239;
  long long v110 = v240;
  *(_OWORD *)(v96 + 37) = v238;
  *(_OWORD *)(v96 + 39) = v109;
  *(_OWORD *)(v96 + 33) = v107;
  *(_OWORD *)(v96 + 35) = v108;
  long long v111 = v244;
  *(_OWORD *)(v96 + 47) = v243;
  *(_OWORD *)(v96 + 49) = v111;
  long long v112 = v242;
  *(_OWORD *)(v96 + 43) = v241;
  *(_OWORD *)(v96 + 45) = v112;
  *(_OWORD *)(v96 + 41) = v110;
  v96[51] = 0;
  *((unsigned char *)v96 + 416) = 1;
  v96[53] = v161;
  *((unsigned char *)v96 + 432) = v152;
  v96[55] = v151;
  *((unsigned char *)v96 + 448) = (_BYTE)v121;
  uint64_t v113 = v119;
  v96[57] = v120;
  v96[58] = v113;
  uint64_t v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600870);
  sub_209C18060(v93, (uint64_t)v96 + *(int *)(v114 + 112), &qword_267600810);
  v115 = (char *)v96 + *(int *)(v114 + 128);
  *(void *)v115 = 0;
  v115[8] = 1;
  *((void *)v115 + 2) = v150;
  v115[24] = v148;
  *((void *)v115 + 4) = v147;
  v115[40] = (char)v146;
  uint64_t v116 = v144;
  *((void *)v115 + 6) = v145;
  *((void *)v115 + 7) = v116;
  sub_209C180C4(v97, v98, (char)v37);
  sub_209C4C708();
  sub_209C4C718();
  sub_209C4C708();
  sub_209C4C718();
  sub_209C180D4((uint64_t)v232);
  sub_209C1815C(v160, &qword_267600810);
  sub_209C1815C(v93, &qword_267600810);
  long long v253 = v228;
  long long v254 = v229;
  long long v255 = v230;
  uint64_t v256 = v231;
  long long v249 = v224;
  long long v250 = v225;
  long long v251 = v226;
  long long v252 = v227;
  long long v245 = v220;
  long long v246 = v221;
  long long v247 = v222;
  long long v248 = v223;
  char v257 = v157;
  *(_DWORD *)v258 = v219[0];
  *(_DWORD *)&v258[3] = *(_DWORD *)((char *)v219 + 3);
  uint64_t v259 = v60;
  uint64_t v260 = v62;
  uint64_t v261 = v64;
  uint64_t v262 = v66;
  char v263 = v154;
  *(_DWORD *)v264 = v218[0];
  *(_DWORD *)&v264[3] = *(_DWORD *)((char *)v218 + 3);
  uint64_t v265 = v156;
  uint64_t v266 = v155;
  v267 = v153;
  sub_209C181B8((uint64_t)&v245);
  sub_209C17D14(v97, v98, (char)v37);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_209C1709C@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_209C4D388();
    uint64_t v23 = (void *)sub_209C4CF78();
    sub_209C4CAA8();
  }
  sub_209C4CDE8();
  long long v24 = *(_OWORD *)(v13 + 48);
  *(_OWORD *)(a9 + 32) = *(_OWORD *)(v13 + 32);
  *(_OWORD *)(a9 + 48) = v24;
  long long v25 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)a9 = *(_OWORD *)v13;
  *(_OWORD *)(a9 + 16) = v25;
  *(_OWORD *)(a9 + 120) = v30;
  *(_OWORD *)(a9 + 136) = v31;
  *(_OWORD *)(a9 + 152) = v32;
  *(_OWORD *)(a9 + 168) = v33;
  *(_OWORD *)(a9 + 72) = v27;
  *(_OWORD *)(a9 + 88) = v28;
  *(void *)(a9 + 64) = *(void *)(v13 + 64);
  *(_OWORD *)(a9 + 104) = v29;
  return sub_209C18280(v13);
}

uint64_t sub_209C17268@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_209C4D388();
    uint64_t v23 = (void *)sub_209C4CF78();
    sub_209C4CAA8();
  }
  sub_209C4CDE8();
  long long v24 = v13[1];
  *a9 = *v13;
  a9[1] = v24;
  long long v25 = v13[3];
  a9[2] = v13[2];
  a9[3] = v25;
  a9[8] = v31;
  a9[9] = v32;
  a9[10] = v33;
  a9[4] = v27;
  a9[5] = v28;
  a9[6] = v29;
  a9[7] = v30;
  return sub_209C18240((uint64_t)v13);
}

uint64_t sub_209C17420(uint64_t a1)
{
  uint64_t result = MEMORY[0x21050C5A0]();
  if (result)
  {
    uint64_t v3 = (void *)result;
    sub_209C178E4(a1, (uint64_t)&v4);
    objc_msgSend(v3, sel_cameraButtonBuddyViewControllerDidFinish_, sub_209C4D5A8());
    swift_unknownObjectRelease();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_209C17498@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for OnboardingBuddySetupViewModel();
  sub_209C17F8C(&qword_2676007C8, (void (*)(uint64_t))type metadata accessor for OnboardingBuddySetupViewModel);
  sub_209C4CDA8();
  uint64_t v2 = (void *)sub_209C4D208();
  id v3 = CAMLocalizedFrameworkString(v2, 0);

  uint64_t v4 = sub_209C4D218();
  uint64_t v6 = v5;
  swift_release();

  *(void *)&long long v45 = v4;
  *((void *)&v45 + 1) = v6;
  sub_209C17CC0();
  uint64_t v7 = sub_209C4D038();
  uint64_t v9 = v8;
  LOBYTE(v6) = v10 & 1;
  sub_209C4CFF8();
  uint64_t v11 = sub_209C4D028();
  uint64_t v13 = v12;
  char v15 = v14;
  swift_release();
  char v16 = v15 & 1;
  sub_209C17D14(v7, v9, v6);
  swift_bridgeObjectRelease();
  sub_209C4CFE8();
  uint64_t v17 = sub_209C4D008();
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  char v23 = v22 & 1;
  sub_209C17D14(v11, v13, v16);
  swift_bridgeObjectRelease();
  sub_209C4D118();
  uint64_t v37 = v17;
  uint64_t v38 = v19;
  char v39 = v23;
  uint64_t v40 = v21;
  int64x2_t v41 = vdupq_n_s64(0x3FEC28F5C28F5C29uLL);
  uint64_t v42 = v24;
  uint64_t v43 = v25;
  sub_209C4D0F8();
  sub_209C17268(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v36, 0.0, 1, 0.0, 1);
  sub_209C17D14(v17, v19, v23);
  swift_bridgeObjectRelease();
  long long v53 = v36[8];
  long long v54 = v36[9];
  long long v55 = v36[10];
  long long v49 = v36[4];
  long long v50 = v36[5];
  long long v51 = v36[6];
  long long v52 = v36[7];
  long long v45 = v36[0];
  long long v46 = v36[1];
  long long v47 = v36[2];
  long long v48 = v36[3];
  LOBYTE(v7) = sub_209C4CFA8();
  uint64_t result = sub_209C4CD98();
  char v44 = 0;
  long long v27 = v54;
  *(_OWORD *)(a1 + 128) = v53;
  *(_OWORD *)(a1 + 144) = v27;
  *(_OWORD *)(a1 + 160) = v55;
  long long v28 = v50;
  *(_OWORD *)(a1 + 64) = v49;
  *(_OWORD *)(a1 + 80) = v28;
  long long v29 = v52;
  *(_OWORD *)(a1 + 96) = v51;
  *(_OWORD *)(a1 + 112) = v29;
  long long v30 = v46;
  *(_OWORD *)a1 = v45;
  *(_OWORD *)(a1 + 16) = v30;
  long long v31 = v48;
  *(_OWORD *)(a1 + 32) = v47;
  *(_OWORD *)(a1 + 48) = v31;
  *(unsigned char *)(a1 + 176) = v7;
  *(_DWORD *)(a1 + 177) = v36[0];
  *(_DWORD *)(a1 + 180) = *(_DWORD *)((char *)v36 + 3);
  *(void *)(a1 + 184) = v32;
  *(void *)(a1 + 192) = v33;
  *(void *)(a1 + 200) = v34;
  *(void *)(a1 + 208) = v35;
  *(unsigned char *)(a1 + 216) = v44;
  return result;
}

uint64_t sub_209C177B0()
{
  return sub_209C4D078();
}

uint64_t sub_209C177D0(uint64_t a1)
{
  uint64_t v2 = sub_209C4CE08();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_209C4CE48();
}

uint64_t sub_209C17898()
{
  return sub_209C4C718();
}

uint64_t sub_209C178A0(uint64_t a1, uint64_t a2)
{
  swift_unknownObjectWeakTakeInit();
  long long v4 = *(_OWORD *)(a1 + 8);
  *(unsigned char *)(a2 + 24) = *(unsigned char *)(a1 + 24);
  *(_OWORD *)(a2 + 8) = v4;
  return a2;
}

uint64_t sub_209C178E4(uint64_t a1, uint64_t a2)
{
  swift_unknownObjectWeakCopyInit();
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  LOBYTE(a1) = *(unsigned char *)(a1 + 24);
  sub_209C17A1C();
  *(void *)(a2 + 8) = v4;
  *(void *)(a2 + 16) = v5;
  *(unsigned char *)(a2 + 24) = a1;
  return a2;
}

uint64_t sub_209C17940(uint64_t a1)
{
  return a1;
}

uint64_t sub_209C17974(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_209C17984()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_209C179BC()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_209C179D8(uint64_t result)
{
  if (result) {
    return sub_209C4C718();
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for OnboardingBuddySetupView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  sub_209C4C718();
  return v3;
}

uint64_t sub_209C17A1C()
{
  return sub_209C4C718();
}

uint64_t destroy for OnboardingBuddySetupView()
{
  swift_unknownObjectWeakDestroy();
  return sub_209C17A60();
}

uint64_t sub_209C17A60()
{
  return swift_release();
}

uint64_t initializeWithCopy for OnboardingBuddySetupView(uint64_t a1, uint64_t a2)
{
  swift_unknownObjectWeakCopyInit();
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  LOBYTE(a2) = *(unsigned char *)(a2 + 24);
  sub_209C17A1C();
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = a2;
  return a1;
}

uint64_t assignWithCopy for OnboardingBuddySetupView(uint64_t a1, uint64_t a2)
{
  swift_unknownObjectWeakCopyAssign();
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  LOBYTE(a2) = *(unsigned char *)(a2 + 24);
  sub_209C17A1C();
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = a2;
  sub_209C17A60();
  return a1;
}

__n128 initializeWithTake for OnboardingBuddySetupView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = swift_unknownObjectWeakTakeInit();
  __n128 result = *(__n128 *)(a2 + 8);
  *(__n128 *)(v3 + 8) = result;
  *(unsigned char *)(v3 + 24) = *(unsigned char *)(a2 + 24);
  return result;
}

uint64_t assignWithTake for OnboardingBuddySetupView(uint64_t a1, uint64_t a2)
{
  swift_unknownObjectWeakTakeAssign();
  char v4 = *(unsigned char *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 24) = v4;
  sub_209C17A60();
  return a1;
}

uint64_t getEnumTagSinglePayload for OnboardingBuddySetupView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for OnboardingBuddySetupView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OnboardingBuddySetupView()
{
  return &type metadata for OnboardingBuddySetupView;
}

uint64_t sub_209C17C3C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_209C17C68(uint64_t a1)
{
  return a1;
}

uint64_t sub_209C17C94(uint64_t a1)
{
  return a1;
}

unint64_t sub_209C17CC0()
{
  unint64_t result = qword_267600818;
  if (!qword_267600818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267600818);
  }
  return result;
}

uint64_t sub_209C17D14(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_209C17D24@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_209C4CE58();
  *a1 = result;
  return result;
}

uint64_t sub_209C17D50()
{
  return sub_209C4CE68();
}

uint64_t sub_209C17D78@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_209C4CE18();
  *a1 = result;
  return result;
}

uint64_t sub_209C17DA4()
{
  return sub_209C4CE28();
}

uint64_t sub_209C17DD0()
{
  swift_unknownObjectWeakDestroy();
  sub_209C17A60();
  return MEMORY[0x270FA0238](v0, 41, 7);
}

uint64_t sub_209C17E14()
{
  return sub_209C17420(v0 + 16);
}

uint64_t sub_209C17E1C@<X0>(uint64_t a1@<X8>)
{
  return sub_209C17498(a1);
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

uint64_t sub_209C17E6C()
{
  return sub_209C17E9C(&qword_267600838, &qword_267600840, (void (*)(void))sub_209C17F18);
}

uint64_t sub_209C17E9C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_209C17F18()
{
  unint64_t result = qword_267600848;
  if (!qword_267600848)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267600850);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267600848);
  }
  return result;
}

uint64_t sub_209C17F8C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_209C17FD4()
{
  return sub_209C4CE38();
}

uint64_t sub_209C17FFC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_209C18060(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_209C180C4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return sub_209C4C718();
  }
  else {
    return sub_209C4C708();
  }
}

uint64_t sub_209C180D4(uint64_t a1)
{
  return a1;
}

uint64_t sub_209C1815C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_209C181B8(uint64_t a1)
{
  return a1;
}

uint64_t sub_209C18240(uint64_t a1)
{
  return a1;
}

uint64_t sub_209C18280(uint64_t a1)
{
  return a1;
}

uint64_t sub_209C182EC()
{
  return sub_209C18350(&qword_267600878, &qword_2676007D0, (void (*)(void))sub_209C18328);
}

uint64_t sub_209C18328()
{
  return sub_209C18350(&qword_267600880, &qword_2676007B8, (void (*)(void))sub_209C183F4);
}

uint64_t sub_209C18350(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    sub_209C184B8(&qword_2676008A8, (uint64_t *)&unk_2676008B0);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_209C183F4()
{
  unint64_t result = qword_267600888;
  if (!qword_267600888)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2676007B0);
    sub_209C184B8(&qword_267600890, &qword_2676007A8);
    sub_209C184B8(&qword_267600898, &qword_2676008A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267600888);
  }
  return result;
}

uint64_t sub_209C184B8(unint64_t *a1, uint64_t *a2)
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

void sub_209C18580(uint64_t a1, char a2)
{
  if (a2)
  {
    id v4 = objc_msgSend(self, sel_functionWithName_, *MEMORY[0x263F15EB8]);
    double v5 = 0.25;
  }
  else
  {
    id v4 = 0;
    double v5 = 0.0;
  }
  uint64_t v6 = *(void **)(v2 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_discreteSlider);
  id v8 = v4;
  objc_msgSend(v6, sel_setSelectedIndex_animatedDuration_animatedCurve_completion_, a1, v5);
  uint64_t v7 = (void *)MEMORY[0x21050C5A0](v2 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_delegate);
  if (v7)
  {
    objc_msgSend(v7, sel_overlayMenuSlider_didSelectControlAt_, v2, objc_msgSend(v6, sel_selectedIndex));

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

uint64_t sub_209C187CC(void *a1)
{
  uint64_t v2 = OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_imageNames;
  uint64_t v3 = *(void **)&v1[OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_imageNames];
  uint64_t result = sub_209C19DBC(v3, a1);
  if ((result & 1) == 0)
  {
    double v5 = *(void **)&v1[OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_discreteSlider];
    objc_msgSend(v5, sel_setIndexCount_, v3[2]);
    id v6 = objc_msgSend(v5, sel_imageDataConfiguration);
    if (v6)
    {
      objc_msgSend(v6, sel_reloadContent);
      swift_unknownObjectRelease();
    }
    uint64_t v7 = *(void *)(*(void *)&v1[v2] + 16);
    id v8 = v1;
    sub_209C19E84(0, v7, (uint64_t)v8, 0.0);
    double v10 = v9;

    if (v10 >= *(double *)&v8[OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_maximumSliderGlyphDimension]) {
      double v10 = *(double *)&v8[OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_maximumSliderGlyphDimension];
    }
    objc_msgSend(objc_msgSend(v5, sel_tickMarksConfiguration), sel_setTickMarkWidth_, v10);
    swift_unknownObjectRelease();
    return (uint64_t)objc_msgSend(v5, sel_setLevelIndicatorHeight_, v10);
  }
  return result;
}

void sub_209C18920(unint64_t a1)
{
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (*(void *)(*(void *)(v1 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_imageNames) + 16) <= a1)
  {
LABEL_12:
    __break(1u);
    return;
  }
  uint64_t v2 = self;
  sub_209C4C708();
  id v3 = objc_msgSend(v2, sel_configurationWithScale_, 3);
  id v4 = (void *)sub_209C4D208();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(self, sel__systemImageNamed_withConfiguration_, v4, v3);

  if (v5)
  {
    double v6 = *(double *)(v1 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_maximumSliderGlyphDimension);
    objc_msgSend(v5, sel_size);
    double v8 = v6 / v7;
    objc_msgSend(v5, sel_size);
    double v10 = v6 / v9;
    if (v6 / v9 >= v8) {
      double v10 = v8;
    }
    if (v10 <= 0.9) {
      double v11 = v10;
    }
    else {
      double v11 = 0.9;
    }
    objc_msgSend(v5, sel_size);
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGAffineTransformMakeScale(&v16, v11, v11);
    v17.width = v13;
    v17.height = v15;
    CGSizeApplyAffineTransform(v17, &v16);
  }
}

uint64_t sub_209C18C84(unsigned char *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_209C4C948();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  double v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  double v10 = &v16[-v9];
  uint64_t v11 = v2 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_disabledMenuItemsIndices;
  swift_beginAccess();
  double v12 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16);
  v12(v10, v11, v4);
  swift_beginAccess();
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v5 + 24))(v11, a1, v4);
  swift_endAccess();
  v12(v8, v11, v4);
  sub_209C1A198();
  LOBYTE(v11) = sub_209C4D1D8();
  CGFloat v13 = *(void (**)(unsigned char *, uint64_t))(v5 + 8);
  v13(v8, v4);
  if ((v11 & 1) == 0)
  {
    id v14 = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_discreteSlider), sel_imageDataConfiguration);
    if (v14)
    {
      objc_msgSend(v14, sel_reloadContent);
      swift_unknownObjectRelease();
    }
  }
  v13(a1, v4);
  return ((uint64_t (*)(unsigned char *, uint64_t))v13)(v10, v4);
}

char *sub_209C18FA4(double a1, double a2, double a3, double a4)
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  uint64_t v10 = OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_discreteSlider;
  id v11 = objc_allocWithZone(MEMORY[0x263F306A0]);
  double v12 = v4;
  *(void *)&v4[v10] = objc_msgSend(v11, sel_initWithTickMarkStyle_, 1);
  *(void *)&v12[OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_maximumSliderGlyphDimension] = 0x4039000000000000;
  *(void *)&v12[OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_imageNames] = MEMORY[0x263F8EE78];
  sub_209C4C938();
  *(void *)&v12[OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider__orientation] = 1;
  *(void *)&v12[OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_alignment] = 1;

  v22.receiver = v12;
  v22.super_class = ObjectType;
  CGFloat v13 = (char *)objc_msgSendSuper2(&v22, sel_initWithFrame_, a1, a2, a3, a4);
  uint64_t v14 = OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_discreteSlider;
  CGFloat v15 = *(void **)&v13[OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_discreteSlider];
  CGAffineTransform v16 = v13;
  objc_msgSend(v15, sel_setDelegate_, v16);
  objc_msgSend(v15, sel_setSliderVerticalAlignment_, 1);
  id v17 = objc_msgSend(v15, sel_imageDataConfiguration);
  if (v17)
  {
    objc_msgSend(v17, sel_setImageDataProvider_, v16);
    swift_unknownObjectRelease();
  }
  objc_msgSend(objc_msgSend(*(id *)&v13[v14], sel_tickMarksConfiguration), sel_setMainTickMarkInterval_, 1);
  swift_unknownObjectRelease();
  id v18 = objc_msgSend(*(id *)&v13[v14], sel_tickMarksConfiguration);
  id v19 = objc_msgSend(self, sel_whiteColor);
  objc_msgSend(v18, sel_setMainTickMarkColor_, v19);
  swift_unknownObjectRelease();

  objc_msgSend(objc_msgSend(*(id *)&v13[v14], sel_tickMarksConfiguration), sel_setTickMarkSpacing_, 50.0);
  swift_unknownObjectRelease();
  uint64_t v20 = *(void **)&v13[v14];
  objc_msgSend(v20, sel_setBiasScrollingToCurrentSelection_, 0);
  objc_msgSend(v20, sel_setTransparentGradients);
  objc_msgSend(v20, sel_setGradientInsets_, 20.0, 20.0);
  objc_msgSend(v20, sel_addTarget_action_forControlEvents_, v16, sel_discreteSliderDidChangeValue_, 4096);
  objc_msgSend(v16, sel_addSubview_, v20);

  return v16;
}

id sub_209C192A8()
{
  objc_msgSend(v0, sel_bounds);
  fmin(CGRectGetWidth(v23) + -50.0, 0.0);
  objc_msgSend(v0, sel_bounds);
  uint64_t v1 = OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_alignment;
  UIRectInsetEdges();
  if (*(void *)&v0[v1]) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 3;
  }
  CAMViewGeometryForOrientedFrame(v6, (uint64_t)&v21, v2, v3, v4, v5);
  double a = v21.a;
  double b = v21.b;
  double c = v21.c;
  double d = v21.d;
  double tx = v21.tx;
  double ty = v21.ty;
  CGAffineTransform v21 = v22;
  CGAffineTransformScale(&v20, &v21, -1.0, 1.0);
  long long v18 = *(_OWORD *)&v20.c;
  long long v19 = *(_OWORD *)&v20.a;
  CGFloat v14 = v20.tx;
  CGFloat v13 = v20.ty;
  CGFloat v15 = *(void **)&v0[OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_discreteSlider];
  objc_msgSend(v15, sel_setCenter_, tx + 2.0, ty);
  objc_msgSend(v15, sel_setBounds_, a, b, c, d);
  *(_OWORD *)&v21.double a = v19;
  *(_OWORD *)&v21.double c = v18;
  v21.double tx = v14;
  v21.double ty = v13;
  objc_msgSend(v15, sel_setTransform_, &v21);
  UIEdgeInsetsMakeWithEdges();
  objc_msgSend(v0, sel_setHitTestInsets_);
  id result = objc_msgSend(v15, sel_imageDataConfiguration);
  if (result)
  {
    id v17 = result;
    sub_209C19494(&v21);
    CGAffineTransform v20 = v21;
    objc_msgSend(v17, sel_setContentTransform_, &v20);
    return (id)swift_unknownObjectRelease();
  }
  return result;
}

CGFloat sub_209C19494@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider__orientation);
  if (v3 == 2)
  {
    BOOL v5 = *(void *)(v1 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_alignment) == 0;
    uint64_t v6 = (double *)&unk_209C7C2E0;
    goto LABEL_12;
  }
  if (v3 != 4)
  {
    if (v3 == 3)
    {
      double v4 = -3.14159265;
      if (!*(void *)(v1 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_alignment)) {
        double v4 = 0.0;
      }
      goto LABEL_13;
    }
    BOOL v5 = *(void *)(v1 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_alignment) == 0;
    uint64_t v6 = dbl_209C7B260;
LABEL_12:
    double v4 = v6[v5];
    goto LABEL_13;
  }
  double v4 = 3.14159265;
  if (*(void *)(v1 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_alignment)) {
    double v4 = 0.0;
  }
LABEL_13:
  CGAffineTransformMakeRotation(&v11, v4);
  CGAffineTransformScale(&v10, &v11, -1.0, 1.0);
  CGAffineTransform v11 = v10;
  UIIntegralTransform();
  CGFloat result = v10.a;
  long long v8 = *(_OWORD *)&v10.c;
  long long v9 = *(_OWORD *)&v10.tx;
  *a1 = *(_OWORD *)&v10.a;
  a1[1] = v8;
  a1[2] = v9;
  return result;
}

unint64_t sub_209C19630(unint64_t result)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)(*(void *)(v1 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_imageNames) + 16) > result)
  {
    CGFloat v2 = self;
    sub_209C4C708();
    id v3 = objc_msgSend(v2, sel_configurationWithScale_, 3);
    double v4 = (void *)sub_209C4D208();
    swift_bridgeObjectRelease();
    id v5 = objc_msgSend(self, sel__systemImageNamed_withConfiguration_, v4, v3);

    return (unint64_t)v5;
  }
  __break(1u);
  return result;
}

uint64_t sub_209C198E4(char *a1, uint64_t a2, void *a3, SEL *a4)
{
  uint64_t result = MEMORY[0x21050C5A0](&a1[OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_delegate]);
  if (result)
  {
    long long v8 = (void *)result;
    id v9 = a3;
    CGAffineTransform v10 = a1;
    objc_msgSend(v8, *a4, v10);

    return swift_unknownObjectRelease();
  }
  return result;
}

id sub_209C199DC(id result)
{
  if (*(id *)(v1 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider__orientation) != result)
  {
    *(void *)(v1 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider__orientation) = result;
    uint64_t result = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_discreteSlider), sel_imageDataConfiguration);
    if (result)
    {
      CGFloat v2 = result;
      sub_209C19494(v4);
      v3[0] = v4[0];
      v3[1] = v4[1];
      v3[2] = v4[2];
      objc_msgSend(v2, sel_setContentTransform_animated_, v3, 0);
      return (id)swift_unknownObjectRelease();
    }
  }
  return result;
}

id sub_209C19A78(id result, char a2)
{
  if (*(id *)(v2 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider__orientation) != result)
  {
    *(void *)(v2 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider__orientation) = result;
    uint64_t result = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_discreteSlider), sel_imageDataConfiguration);
    if (result)
    {
      double v4 = result;
      sub_209C19494(v6);
      v5[0] = v6[0];
      v5[1] = v6[1];
      v5[2] = v6[2];
      objc_msgSend(v4, sel_setContentTransform_animated_, v5, a2 & 1);
      return (id)swift_unknownObjectRelease();
    }
  }
  return result;
}

uint64_t sub_209C19CA0()
{
  return type metadata accessor for OverlayMenuSlider();
}

uint64_t type metadata accessor for OverlayMenuSlider()
{
  uint64_t result = qword_2676009B0;
  if (!qword_2676009B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_209C19CF4()
{
  uint64_t result = sub_209C4C948();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_209C19DBC(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  BOOL v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (char v6 = sub_209C4D588(), result = 0, (v6 & 1) != 0))
  {
    uint64_t v8 = v2 - 1;
    if (!v8) {
      return 1;
    }
    id v9 = a1 + 7;
    for (uint64_t i = a2 + 7; ; i += 2)
    {
      BOOL v11 = *(v9 - 1) == *(i - 1) && *v9 == *i;
      if (!v11 && (sub_209C4D588() & 1) == 0) {
        break;
      }
      v9 += 2;
      if (!--v8) {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

void sub_209C19E84(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  if (a1 != a2)
  {
    if (a2 >= a1)
    {
      id v30 = self;
      uint64_t v8 = self;
      uint64_t v31 = OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_imageNames;
      uint64_t v28 = OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_maximumSliderGlyphDimension;
      id v29 = (id)v8;
      uint64_t v9 = 16 * a1;
      unint64_t v10 = a1;
      while ((uint64_t)v10 < a2)
      {
        if (a1 < 0) {
          goto LABEL_24;
        }
        if (v10 >= *(void *)(*(void *)(a3 + v31) + 16)) {
          goto LABEL_25;
        }
        sub_209C4C708();
        id v25 = objc_msgSend(v30, sel_configurationWithScale_, 3);
        char v26 = (void *)sub_209C4D208();
        swift_bridgeObjectRelease();
        id v27 = objc_msgSend(v29, sel__systemImageNamed_withConfiguration_, v26, v25);

        if (v27)
        {
          double v11 = *(double *)(a3 + v28);
          objc_msgSend(v27, sel_size);
          double v13 = v11 / v12;
          objc_msgSend(v27, sel_size);
          double v15 = v11 / v14;
          if (v11 / v14 >= v13) {
            double v15 = v13;
          }
          if (v15 <= 0.9) {
            double v16 = v15;
          }
          else {
            double v16 = 0.9;
          }
          objc_msgSend(v27, sel_size);
          CGFloat v18 = v17;
          CGFloat v20 = v19;
          CGAffineTransformMakeScale(&v32, v16, v16);
          v33.double width = v18;
          v33.double height = v20;
          CGSize v21 = CGSizeApplyAffineTransform(v33, &v32);
          double width = v21.width;
          double height = v21.height;
        }
        else
        {
          double width = 0.0;
          double height = 0.0;
        }
        ++v10;
        if (a4 > width) {
          double v24 = a4;
        }
        else {
          double v24 = width;
        }
        if (v24 > height) {
          a4 = v24;
        }
        else {
          a4 = height;
        }
        v9 += 16;
        if (a2 == v10) {
          return;
        }
      }
      __break(1u);
LABEL_24:
      __break(1u);
LABEL_25:
      __break(1u);
    }
    __break(1u);
  }
}

void sub_209C1A0B4()
{
  swift_unknownObjectWeakInit();
  uint64_t v1 = OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_discreteSlider;
  *(void *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F306A0]), sel_initWithTickMarkStyle_, 1);
  *(void *)&v0[OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_maximumSliderGlyphDimension] = 0x4039000000000000;
  *(void *)&v0[OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_imageNames] = MEMORY[0x263F8EE78];
  sub_209C4C938();
  *(void *)&v0[OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider__orientation] = 1;
  *(void *)&v0[OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_alignment] = 1;

  sub_209C4D518();
  __break(1u);
}

unint64_t sub_209C1A198()
{
  unint64_t result = qword_2676009C0;
  if (!qword_2676009C0)
  {
    sub_209C4C948();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2676009C0);
  }
  return result;
}

uint64_t sub_209C1A1F0(uint64_t a1)
{
  return a1;
}

uint64_t sub_209C1A218()
{
  uint64_t v0 = sub_209C4C8F8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_209C4C878();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  double v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_209C4D1F8();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_209C4C888();
  __swift_allocate_value_buffer(v6, static LaunchAppIntent.title);
  __swift_project_value_buffer(v6, (uint64_t)static LaunchAppIntent.title);
  sub_209C4D1E8();
  if (qword_26AAFE848 != -1) {
    swift_once();
  }
  uint64_t v7 = __swift_project_value_buffer(v1, (uint64_t)qword_26AB01638);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v7, v1);
  sub_209C4C8E8();
  return sub_209C4C898();
}

uint64_t LaunchAppIntent.title.unsafeMutableAddressor()
{
  if (qword_26AAFE820 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_209C4C888();
  return __swift_project_value_buffer(v0, (uint64_t)static LaunchAppIntent.title);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t static LaunchAppIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26AAFE820 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_209C4C888();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static LaunchAppIntent.title);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static LaunchAppIntent.title.setter(uint64_t a1)
{
  if (qword_26AAFE820 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_209C4C888();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static LaunchAppIntent.title);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static LaunchAppIntent.title.modify())()
{
  if (qword_26AAFE820 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_209C4C888();
  __swift_project_value_buffer(v0, (uint64_t)static LaunchAppIntent.title);
  swift_beginAccess();
  return j__swift_endAccess;
}

void *LaunchAppIntent.isDiscoverable.unsafeMutableAddressor()
{
  return &static LaunchAppIntent.isDiscoverable;
}

uint64_t static LaunchAppIntent.isDiscoverable.getter()
{
  return 0;
}

uint64_t sub_209C1A73C@<X0>(uint64_t a1@<X8>)
{
  if (qword_26AAFE820 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_209C4C888();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static LaunchAppIntent.title);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_209C1A804()
{
  return 0;
}

uint64_t sub_209C1A814(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_209C4D2C8();
  *(void *)(v1 + 24) = sub_209C4D2B8();
  uint64_t v3 = sub_209C4D298();
  return MEMORY[0x270FA2498](sub_209C1A8AC, v3, v2);
}

uint64_t sub_209C1A8AC()
{
  swift_release();
  sub_209C29268();
  uint64_t v2 = v1;
  if (objc_msgSend(v1, sel_isInCameraRollView)) {
    objc_msgSend(v2, sel_navigateToViewfinderView);
  }
  sub_209C4C558();

  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_209C1A964@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = _s8CameraUI15LaunchAppIntentVACycfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_209C1A98C(uint64_t a1)
{
  unint64_t v2 = sub_209C1B854();
  return MEMORY[0x270EE0D28](a1, v2);
}

uint64_t sub_209C1A9C8()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE860);
  MEMORY[0x270FA5388](v0 - 8);
  unint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_209C4C878();
  uint64_t v3 = *(void *)(v12[0] - 8);
  MEMORY[0x270FA5388](v12[0]);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_209C4C8F8();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = sub_209C4D1F8();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v8 = sub_209C4C888();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = sub_209C4C7E8();
  __swift_allocate_value_buffer(v10, qword_267602EC0);
  __swift_project_value_buffer(v10, (uint64_t)qword_267602EC0);
  sub_209C4D1E8();
  sub_209C4C8E8();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, *MEMORY[0x263F06D18], v12[0]);
  sub_209C4C898();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_209C4C7D8();
}

unint64_t sub_209C1ACB0()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE948);
  MEMORY[0x270FA5388](v0 - 8);
  double v17 = (char *)&v15 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE860);
  MEMORY[0x270FA5388](v2 - 8);
  double v16 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_209C4C878();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_209C4C8F8();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v9 = sub_209C4D1F8();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v10 = sub_209C4C888();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2676009E8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267600BF0);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_209C791C0;
  sub_209C4D1E8();
  sub_209C4C8E8();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F06D18], v4);
  sub_209C4C898();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v16, 1, 1, v10);
  uint64_t v13 = sub_209C4C6A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v17, 1, 1, v13);
  sub_209C4C6C8();
  unint64_t result = sub_209C1BFEC(v12);
  qword_267602ED8 = result;
  return result;
}

uint64_t sub_209C1B0A4()
{
  return 1;
}

uint64_t sub_209C1B0AC()
{
  return sub_209C4D628();
}

uint64_t sub_209C1B0FC()
{
  return sub_209C4D238();
}

uint64_t sub_209C1B110()
{
  return sub_209C4D628();
}

uint64_t sub_209C1B15C@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_209C4D568();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_209C1B1B0(void *a1@<X8>)
{
  *a1 = 0x68636E75616CLL;
  a1[1] = 0xE600000000000000;
}

uint64_t sub_209C1B1CC@<X0>(uint64_t a1@<X8>)
{
  if (qword_2676005C8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_209C4C7E8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_267602EC0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_209C1B274(uint64_t a1)
{
  unint64_t v2 = sub_209C13E50();
  return MEMORY[0x270EE0C40](a1, v2);
}

uint64_t sub_209C1B2C0()
{
  if (qword_2676005D0 != -1) {
    swift_once();
  }
  return sub_209C4C708();
}

uint64_t sub_209C1B31C(uint64_t a1)
{
  unint64_t v2 = sub_209C1BC18();
  return MEMORY[0x270EE1C28](a1, v2);
}

void sub_209C1B368(void *a1@<X8>)
{
  *a1 = &unk_26BD77240;
}

uint64_t _s8CameraUI15LaunchAppIntentVACycfC_0()
{
  uint64_t v0 = sub_209C4C788();
  uint64_t v24 = *(void *)(v0 - 8);
  uint64_t v25 = v0;
  MEMORY[0x270FA5388](v0);
  CGRect v23 = (char *)v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE858);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  CGAffineTransform v22 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  CGSize v21 = (char *)v20 - v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE860);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_209C4C878();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_209C4C8F8();
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v14 = sub_209C4D1F8();
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v15 = sub_209C4C888();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  v20[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE868);
  sub_209C4D1E8();
  sub_209C4C8E8();
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x263F06D18], v9);
  sub_209C4C898();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v8, 1, 1, v15);
  char v26 = 0;
  uint64_t v17 = sub_209C4C548();
  CGFloat v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
  v18(v21, 1, 1, v17);
  v18(v22, 1, 1, v17);
  (*(void (**)(char *, void, uint64_t))(v24 + 104))(v23, *MEMORY[0x263EFBDC8], v25);
  sub_209C13E50();
  return sub_209C4C638();
}

unint64_t sub_209C1B7E4()
{
  unint64_t result = qword_26AAFE8D0;
  if (!qword_26AAFE8D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFE8D0);
  }
  return result;
}

uint64_t sub_209C1B838()
{
  return MEMORY[0x263F8E650];
}

uint64_t sub_209C1B844()
{
  return MEMORY[0x263F8E630];
}

unint64_t sub_209C1B854()
{
  unint64_t result = qword_26AAFE8D8;
  if (!qword_26AAFE8D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFE8D8);
  }
  return result;
}

unint64_t sub_209C1B8AC()
{
  unint64_t result = qword_26AAFE8E0;
  if (!qword_26AAFE8E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFE8E0);
  }
  return result;
}

unint64_t sub_209C1B904()
{
  unint64_t result = qword_26AAFE8E8;
  if (!qword_26AAFE8E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFE8E8);
  }
  return result;
}

uint64_t sub_209C1B958()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_209C1B974(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_209C1BC98(a1, a2, a3, (void (*)(void))sub_209C1B854);
}

unint64_t sub_209C1B9A4()
{
  unint64_t result = qword_26AAFE8F0;
  if (!qword_26AAFE8F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFE8F0);
  }
  return result;
}

unint64_t sub_209C1B9FC()
{
  unint64_t result = qword_26AAFE8F8;
  if (!qword_26AAFE8F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFE8F8);
  }
  return result;
}

unint64_t sub_209C1BA54()
{
  unint64_t result = qword_26AAFE900;
  if (!qword_26AAFE900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFE900);
  }
  return result;
}

unint64_t sub_209C1BAAC()
{
  unint64_t result = qword_26AAFE908;
  if (!qword_26AAFE908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFE908);
  }
  return result;
}

uint64_t sub_209C1BB00()
{
  return MEMORY[0x263F8D380];
}

unint64_t sub_209C1BB10()
{
  unint64_t result = qword_26AAFE910;
  if (!qword_26AAFE910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFE910);
  }
  return result;
}

unint64_t sub_209C1BB68()
{
  unint64_t result = qword_26AAFE918;
  if (!qword_26AAFE918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFE918);
  }
  return result;
}

unint64_t sub_209C1BBC0()
{
  unint64_t result = qword_26AAFE920;
  if (!qword_26AAFE920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFE920);
  }
  return result;
}

unint64_t sub_209C1BC18()
{
  unint64_t result = qword_26AAFE928;
  if (!qword_26AAFE928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFE928);
  }
  return result;
}

uint64_t sub_209C1BC6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_209C1BC98(a1, a2, a3, (void (*)(void))sub_209C13E50);
}

uint64_t sub_209C1BC98(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_209C1BCE4()
{
  unint64_t result = qword_26AAFE930;
  if (!qword_26AAFE930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFE930);
  }
  return result;
}

unint64_t sub_209C1BD3C()
{
  unint64_t result = qword_26AAFE938;
  if (!qword_26AAFE938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFE938);
  }
  return result;
}

unint64_t sub_209C1BD94()
{
  unint64_t result = qword_26AAFE940;
  if (!qword_26AAFE940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFE940);
  }
  return result;
}

unint64_t sub_209C1BDEC()
{
  unint64_t result = qword_2676009D8;
  if (!qword_2676009D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2676009E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2676009D8);
  }
  return result;
}

ValueMetadata *type metadata accessor for LaunchAppIntent()
{
  return &type metadata for LaunchAppIntent;
}

uint64_t getEnumTagSinglePayload for LaunchAppEnum(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for LaunchAppEnum(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x209C1BF4CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for LaunchAppEnum()
{
  return &type metadata for LaunchAppEnum;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_209C1BFEC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600BF0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267600BF8);
  uint64_t v6 = sub_209C4D548();
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return v7;
  }
  uint64_t v9 = v6 + 64;
  unint64_t v10 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v21[1] = a1;
  uint64_t v11 = a1 + v10;
  uint64_t v12 = *(void *)(v3 + 72);
  sub_209C4C718();
  while (1)
  {
    sub_209C18060(v11, (uint64_t)v5, &qword_267600BF0);
    unint64_t result = sub_209C384D0();
    if (v14) {
      break;
    }
    unint64_t v15 = result;
    *(void *)(v9 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v16 = *(void *)(v7 + 56);
    uint64_t v17 = sub_209C4C6D8();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v16 + *(void *)(*(void *)(v17 - 8) + 72) * v15, v5, v17);
    uint64_t v18 = *(void *)(v7 + 16);
    BOOL v19 = __OFADD__(v18, 1);
    uint64_t v20 = v18 + 1;
    if (v19) {
      goto LABEL_11;
    }
    *(void *)(v7 + 16) = v20;
    v11 += v12;
    if (!--v8)
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

unint64_t sub_209C1C1C8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267600BE0);
  uint64_t v2 = (void *)sub_209C4D548();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  sub_209C4C718();
  uint64_t v4 = (id *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *((unsigned __int8 *)v4 - 8);
    id v6 = *v4;
    unint64_t result = sub_209C368D8(v5);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(unsigned char *)(v2[6] + result) = v5;
    *(void *)(v2[7] + 8 * result) = v6;
    uint64_t v9 = v2[2];
    BOOL v10 = __OFADD__(v9, 1);
    uint64_t v11 = v9 + 1;
    if (v10) {
      goto LABEL_11;
    }
    v2[2] = v11;
    v4 += 2;
    if (!--v3)
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

unint64_t sub_209C1C2CC(uint64_t a1)
{
  return sub_209C1C31C(a1, &qword_26AAFE960, &qword_26AAFE968, sub_209C36904);
}

unint64_t sub_209C1C2F4(uint64_t a1)
{
  return sub_209C1C31C(a1, &qword_267600C00, &qword_267600C08, (uint64_t (*)(void))sub_209C369CC);
}

unint64_t sub_209C1C31C(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(void))
{
  id v29 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  BOOL v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v12 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v11 = sub_209C4D548();
  uint64_t v12 = (void *)v11;
  uint64_t v13 = *(void *)(a1 + 16);
  if (!v13)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v12;
  }
  char v14 = &v10[*(int *)(v7 + 48)];
  uint64_t v15 = v11 + 64;
  unint64_t v16 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v28 = a1;
  uint64_t v17 = a1 + v16;
  uint64_t v18 = *(void *)(v8 + 72);
  sub_209C4C718();
  while (1)
  {
    sub_209C18060(v17, (uint64_t)v10, a2);
    char v19 = *v10;
    unint64_t result = v29(*v10);
    if (v21) {
      break;
    }
    unint64_t v22 = result;
    *(void *)(v15 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v12[6] + result) = v19;
    uint64_t v23 = v12[7];
    uint64_t v24 = sub_209C4C6D8();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v24 - 8) + 32))(v23 + *(void *)(*(void *)(v24 - 8) + 72) * v22, v14, v24);
    uint64_t v25 = v12[2];
    BOOL v26 = __OFADD__(v25, 1);
    uint64_t v27 = v25 + 1;
    if (v26) {
      goto LABEL_11;
    }
    void v12[2] = v27;
    v17 += v18;
    if (!--v13)
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

unint64_t sub_209C1C518(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE950);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE958);
  uint64_t v6 = sub_209C4D548();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  sub_209C4C718();
  while (1)
  {
    sub_209C18060(v12, (uint64_t)v5, &qword_26AAFE950);
    char v14 = *v5;
    unint64_t result = sub_209C36AB0(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_209C4C6D8();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v9, v19);
    uint64_t v20 = v7[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_11;
    }
    v7[2] = v22;
    v12 += v13;
    if (!--v8)
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

uint64_t sub_209C1C710()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_209C4D128();
  uint64_t v49 = *(void *)(v2 - 8);
  uint64_t v50 = v2;
  MEMORY[0x270FA5388](v2);
  long long v47 = (char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_209C4D148();
  uint64_t v46 = *(void *)(v48 - 8);
  MEMORY[0x270FA5388](v48);
  long long v45 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_209C4D178();
  uint64_t v43 = *(void *)(v5 - 8);
  uint64_t v44 = v5;
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v42 = (char *)&v42 - v9;
  id v10 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_sceneView), sel_scene);

  if (v10)
  {
    unint64_t v11 = self;
    objc_msgSend(v11, sel_begin);
    objc_msgSend(v11, sel_setAnimationDuration_, 2.0);
    id v12 = objc_msgSend(self, sel_functionWithName_, *MEMORY[0x263F15EB8]);
    objc_msgSend(v11, sel_setAnimationTimingFunction_, v12);

    uint64_t v13 = *(void **)(v1 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_deviceModelNode);
    swift_getKeyPath();
    swift_getKeyPath();
    id v14 = v13;
    sub_209C4C718();
    sub_209C4CD68();
    swift_release();
    swift_release();
    if (LOBYTE(aBlock[0])) {
      float v15 = -0.7854;
    }
    else {
      float v15 = 0.0;
    }
    char v16 = self;
    *(float *)&double v17 = v15;
    id v18 = objc_msgSend(v16, sel_valueWithSCNVector3_, 0.0, v17, 0.0);
    swift_release();
    objc_msgSend(v18, sel_SCNVector3Value);
    int v20 = v19;
    int v22 = v21;
    int v24 = v23;

    LODWORD(v25) = v20;
    LODWORD(v26) = v22;
    LODWORD(v27) = v24;
    objc_msgSend(v14, sel_setEulerAngles_, v25, v26, v27);

    uint64_t v28 = *(void **)(v1 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_cameraNode);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_209C4C718();
    sub_209C4CD68();
    swift_release();
    swift_release();
    swift_release();
    LODWORD(v31) = 0.5;
    if (LOBYTE(aBlock[0])) {
      *(float *)&double v29 = 0.5;
    }
    else {
      *(float *)&double v29 = 0.0;
    }
    if (LOBYTE(aBlock[0])) {
      *(float *)&double v31 = -2.9;
    }
    LODWORD(v30) = 19.0;
    if (LOBYTE(aBlock[0])) {
      *(float *)&double v30 = 14.0;
    }
    objc_msgSend(v28, sel_setPosition_, v29, v31, v30);
    objc_msgSend(v11, sel_commit);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_209C4C718();
    sub_209C4CD68();
    swift_release();
    swift_release();
    uint64_t result = swift_release();
    if (LOBYTE(aBlock[0]) == 1
      && (*(unsigned char *)(v1 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_demoLoopHasStarted) & 1) == 0)
    {
      sub_209C23638(0, &qword_267600B90);
      CGSize v33 = (void *)sub_209C4D3B8();
      sub_209C4D168();
      uint64_t v34 = v42;
      MEMORY[0x210509B20](v8, 1.75);
      uint64_t v43 = *(void *)(v43 + 8);
      uint64_t v35 = v8;
      uint64_t v36 = v44;
      ((void (*)(char *, uint64_t))v43)(v35, v44);
      uint64_t v37 = swift_allocObject();
      swift_unknownObjectWeakInit();
      aBlock[4] = sub_209C23828;
      aBlock[5] = v37;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_209C1DB88;
      aBlock[3] = &block_descriptor_54;
      uint64_t v38 = _Block_copy(aBlock);
      swift_release();
      char v39 = v45;
      sub_209C4D138();
      aBlock[0] = MEMORY[0x263F8EE78];
      sub_209C234C8();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267600BA0);
      sub_209C23520();
      uint64_t v40 = v47;
      uint64_t v41 = v50;
      sub_209C4D418();
      MEMORY[0x210509D40](v34, v39, v40, v38);
      _Block_release(v38);

      (*(void (**)(char *, uint64_t))(v49 + 8))(v40, v41);
      (*(void (**)(char *, uint64_t))(v46 + 8))(v39, v48);
      return ((uint64_t (*)(char *, uint64_t))v43)(v34, v36);
    }
  }
  else
  {
    uint64_t result = sub_209C4D518();
    __break(1u);
  }
  return result;
}

id sub_209C1CDC4()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for OnboardingBuddyDeviceSceneViewController());
  uint64_t v1 = sub_209C4C718();
  id v2 = sub_209C22938(v1);
  swift_release();
  return v2;
}

uint64_t sub_209C1CE0C()
{
  return sub_209C1C710();
}

uint64_t sub_209C1CE3C()
{
  return sub_209C4CEF8();
}

uint64_t sub_209C1CE78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_209C23830();
  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_209C1CEDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_209C23830();
  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

void sub_209C1CF40()
{
}

void sub_209C1CF68()
{
  off_2676009F0 = &unk_26BD77308;
}

void sub_209C1CF7C()
{
  off_2676009F8 = &unk_26BD77338;
}

void sub_209C1CF90()
{
  off_267600A00 = &unk_26BD77360;
}

unint64_t sub_209C1CFA4(char a1)
{
  unint64_t result = 0x6772616843657250;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x746F6F6853;
      break;
    case 2:
      unint64_t result = 0x6B63696C43;
      break;
    case 3:
      unint64_t result = 0x6946206B63696C43;
      break;
    case 4:
      unint64_t result = 0x7373696D736944;
      break;
    case 5:
      unint64_t result = 0x6C426F5465646146;
      break;
    case 6:
      unint64_t result = 0xD000000000000012;
      break;
    case 7:
      unint64_t result = 0x6D6154746F6F6853;
      break;
    case 8:
      unint64_t result = 0x656C616D6154;
      break;
    case 9:
      unint64_t result = 0x73656C6863756F54;
      break;
    case 10:
      unint64_t result = 0x776F446863756F54;
      break;
    case 11:
      unint64_t result = 0x70556863756F54;
      break;
    case 12:
      unint64_t result = 0x746E6574614CLL;
      break;
    case 13:
      unint64_t result = 2003790919;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_209C1D15C(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_209C1CFA4(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_209C1CFA4(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_209C4D588();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_209C1D1E8()
{
  char v1 = *v0;
  sub_209C4D608();
  sub_209C1CFA4(v1);
  sub_209C4D238();
  swift_bridgeObjectRelease();
  return sub_209C4D628();
}

uint64_t sub_209C1D24C()
{
  sub_209C1CFA4(*v0);
  sub_209C4D238();
  return swift_bridgeObjectRelease();
}

uint64_t sub_209C1D2A0()
{
  char v1 = *v0;
  sub_209C4D608();
  sub_209C1CFA4(v1);
  sub_209C4D238();
  swift_bridgeObjectRelease();
  return sub_209C4D628();
}

uint64_t sub_209C1D300@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_209C22B6C();
  *a1 = result;
  return result;
}

unint64_t sub_209C1D330@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_209C1CFA4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_209C1D35C()
{
  off_267600A08 = &unk_26BD77268;
}

id sub_209C1D370()
{
  id v0 = objc_msgSend(self, sel_planeWithWidth_height_, 2.75, 2.75);
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F16A80]), sel_init);
  objc_msgSend(v1, sel_setLightingModelName_, *MEMORY[0x263F16B98]);
  objc_msgSend(v1, sel_setLitPerPixel_, 1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267600BB8);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_209C791B0;
  *(void *)(v2 + 32) = v1;
  sub_209C4D278();
  sub_209C23638(0, &qword_267600BE8);
  id v3 = v0;
  id v4 = v1;
  uint64_t v5 = (void *)sub_209C4D258();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_setMaterials_, v5);

  id v6 = objc_msgSend(self, sel_nodeWithGeometry_, v3);
  return v6;
}

uint64_t sub_209C1D4E4(char a1)
{
  uint64_t v2 = v1;
  int v3 = a1 & 1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600B88);
  uint64_t result = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_hasInitialRenderOccurred;
  if (v2[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_hasInitialRenderOccurred] != v3)
  {
    uint64_t v9 = *(void *)&v2[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_renderStopwatch];
    sub_209C4D168();
    uint64_t v10 = sub_209C4D178();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 0, 1, v10);
    uint64_t v11 = v9 + OBJC_IVAR____TtC8CameraUI9Stopwatch_endTime;
    swift_beginAccess();
    sub_209C22C40((uint64_t)v7, v11);
    swift_endAccess();
    if (qword_2676005F8 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_209C4CAD8();
    __swift_project_value_buffer(v12, (uint64_t)qword_267602EE0);
    os_log_type_t v13 = sub_209C4D368();
    id v14 = v2;
    float v15 = sub_209C4CAB8();
    if (os_log_type_enabled(v15, v13))
    {
      char v16 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)char v16 = 134217984;
      sub_209C1D834();
      aBlock[0] = v17;
      sub_209C4D3E8();

      _os_log_impl(&dword_2099F8000, v15, v13, "Buddy - time to render scene: %f seconds", v16, 0xCu);
      MEMORY[0x21050C4E0](v16, -1, -1);
    }
    else
    {

      float v15 = v14;
    }

    id v18 = self;
    uint64_t v19 = swift_allocObject();
    swift_unknownObjectWeakInit();
    aBlock[4] = sub_209C22CE0;
    aBlock[5] = v19;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_209C1DB88;
    aBlock[3] = &block_descriptor_14;
    int v20 = _Block_copy(aBlock);
    swift_release();
    objc_msgSend(v18, sel_animateWithDuration_delay_options_animations_completion_, 0, v20, 0, 0.5, 0.25);
    _Block_release(v20);
    LOBYTE(v20) = v2[v8];
    swift_getKeyPath();
    swift_getKeyPath();
    LOBYTE(aBlock[0]) = (_BYTE)v20;
    sub_209C4C718();
    return sub_209C4CD78();
  }
  return result;
}

unint64_t sub_209C1D834()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600B88);
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  uint64_t v4 = &v23[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = &v23[-v5];
  uint64_t v7 = sub_209C4D178();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = &v23[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v9);
  os_log_type_t v13 = &v23[-v12];
  uint64_t v14 = v0 + OBJC_IVAR____TtC8CameraUI9Stopwatch_endTime;
  swift_beginAccess();
  sub_209C18060(v14, (uint64_t)v6, &qword_267600B88);
  float v15 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48);
  if (v15(v6, 1, v7) == 1)
  {
    uint64_t v16 = (uint64_t)v6;
    return sub_209C1815C(v16, &qword_267600B88);
  }
  uint64_t v17 = v6;
  id v18 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 32);
  v18(v13, v17, v7);
  uint64_t v19 = v0 + OBJC_IVAR____TtC8CameraUI9Stopwatch_startTime;
  swift_beginAccess();
  sub_209C18060(v19, (uint64_t)v4, &qword_267600B88);
  if (v15(v4, 1, v7) == 1)
  {
    (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v13, v7);
    uint64_t v16 = (uint64_t)v4;
    return sub_209C1815C(v16, &qword_267600B88);
  }
  v18(v11, v4, v7);
  unint64_t v21 = sub_209C4D158();
  unint64_t result = sub_209C4D158();
  if (v21 < result)
  {
    __break(1u);
  }
  else
  {
    int v22 = *(void (**)(unsigned char *, uint64_t))(v8 + 8);
    v22(v11, v7);
    return ((uint64_t (*)(unsigned char *, uint64_t))v22)(v13, v7);
  }
  return result;
}

void sub_209C1DB0C(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x21050C5A0](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    id v4 = *(id *)(v2 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_sceneView);

    objc_msgSend(v4, sel_setAlpha_, 1.0);
  }
}

void sub_209C1DBB4(char a1)
{
  uint64_t v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600B88);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56.receiver = v2;
  v56.super_class = ObjectType;
  objc_msgSendSuper2(&v56, sel_viewDidAppear_, a1 & 1);
  uint64_t v8 = *(void *)&v2[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_renderStopwatch];
  sub_209C4D168();
  uint64_t v9 = sub_209C4D178();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 0, 1, v9);
  uint64_t v10 = v8 + OBJC_IVAR____TtC8CameraUI9Stopwatch_startTime;
  swift_beginAccess();
  sub_209C22C40((uint64_t)v7, v10);
  swift_endAccess();
  uint64_t v11 = *(void **)&v2[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_demoLoopAnimationStateController];
  if (v11
    && (uint64_t v12 = *(void *)&v2[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_viewModel],
        (os_log_type_t v13 = *(void **)(v12 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_demoLoopAnimationPackage)) != 0)
    && (uint64_t v14 = *(void **)(v12 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_buttonAccentAnimationPackage)) != 0
    && (float v15 = *(void **)(v12 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_buttonHighlightAnimationPackage)) != 0)
  {
    uint64_t v16 = &v2[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_paused];
    if (v2[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_paused] == 1)
    {
      uint64_t v17 = *(void **)&v2[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_sceneView];
      id v18 = v11;
      id v19 = v13;
      id v20 = v14;
      id v21 = v15;
      objc_msgSend(v17, sel_play_, 0);
      id v22 = objc_msgSend(v19, sel_rootLayer);
      objc_msgSend(v18, sel_setInitialStatesOfLayer_, v22);

      int v23 = &v2[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_animationStates];
      swift_beginAccess();
      uint64_t v24 = *(void *)v23;
      if (*(void *)(*(void *)v23 + 16) && (uint64_t v25 = sub_209C368D8(4), (v26 & 1) != 0)) {
        id v27 = *(id *)(*(void *)(v24 + 56) + 8 * v25);
      }
      else {
        id v27 = 0;
      }
      swift_endAccess();
      id v28 = objc_msgSend(v19, sel_rootLayer);
      objc_msgSend(v18, sel_setState_ofLayer_, v27, v28);

      uint64_t v29 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonHighlightStateController;
      double v30 = *(void **)&v2[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonHighlightStateController];
      if (v30)
      {
        id v31 = v30;
        id v32 = objc_msgSend(v21, sel_rootLayer);
        objc_msgSend(v31, sel_setInitialStatesOfLayer_, v32);

        CGSize v33 = *(void **)&v2[v29];
        if (v33)
        {
          swift_beginAccess();
          uint64_t v34 = *(void *)v23;
          uint64_t v35 = *(void *)(*(void *)v23 + 16);
          id v36 = v33;
          if (v35 && (uint64_t v37 = sub_209C368D8(9), (v38 & 1) != 0)) {
            id v39 = *(id *)(*(void *)(v34 + 56) + 8 * v37);
          }
          else {
            id v39 = 0;
          }
          swift_endAccess();
          id v40 = objc_msgSend(v21, sel_rootLayer);
          LODWORD(v41) = 1.0;
          objc_msgSend(v36, sel_setState_ofLayer_transitionSpeed_, v39, v40, v41);
        }
      }
      uint64_t v42 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonGlowAccentAnimationStateController;
      uint64_t v43 = *(void **)&v2[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonGlowAccentAnimationStateController];
      if (v43)
      {
        id v44 = v43;
        id v45 = objc_msgSend(v20, sel_rootLayer);
        objc_msgSend(v44, sel_setInitialStatesOfLayer_, v45);

        uint64_t v46 = *(void **)&v2[v42];
        if (v46)
        {
          swift_beginAccess();
          uint64_t v47 = *(void *)v23;
          uint64_t v48 = *(void *)(*(void *)v23 + 16);
          id v49 = v46;
          if (v48 && (uint64_t v50 = sub_209C368D8(12), (v51 & 1) != 0)) {
            id v52 = *(id *)(*(void *)(v47 + 56) + 8 * v50);
          }
          else {
            id v52 = 0;
          }
          swift_endAccess();
          id v53 = objc_msgSend(v20, sel_rootLayer);
          LODWORD(v54) = 1.0;
          objc_msgSend(v49, sel_setState_ofLayer_transitionSpeed_, v52, v53, v54);
        }
      }
      sub_209C1E078();
    }
  }
  else
  {
    uint64_t v16 = &v2[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_paused];
  }
  char *v16 = 0;
}

void sub_209C1E078()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_209C4D128();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_209C4D148();
  uint64_t v31 = *(void *)(v6 - 8);
  uint64_t v32 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_209C4D178();
  uint64_t v9 = *(void *)(v30 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v30);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v27 - v13;
  id v15 = objc_msgSend(v0, sel_viewIfLoaded);
  id v16 = objc_msgSend(v15, sel_window);

  if (v16)
  {
    uint64_t v28 = v2;
    uint64_t v29 = v3;
    v1[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_demoLoopHasStarted] = 1;
    uint64_t v17 = *(void **)&v1[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_demoLoopAnimationStateController];
    if (v17)
    {
      id v18 = *(void **)(*(void *)&v1[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_viewModel]
                     + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_demoLoopAnimationPackage);
      if (!v18)
      {
        __break(1u);
        return;
      }
      id v19 = v17;
      id v20 = objc_msgSend(v18, sel_rootLayer);
      objc_msgSend(v19, sel_setInitialStatesOfLayer_, v20);
    }
    sub_209C23638(0, &qword_267600B90);
    id v21 = (void *)sub_209C4D3B8();
    sub_209C4D168();
    MEMORY[0x210509B20](v12, 0.1);
    id v27 = *(void (**)(char *, uint64_t))(v9 + 8);
    uint64_t v22 = v30;
    v27(v12, v30);
    uint64_t v23 = swift_allocObject();
    swift_unknownObjectWeakInit();
    aBlock[4] = sub_209C23594;
    aBlock[5] = v23;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_209C1DB88;
    aBlock[3] = &block_descriptor_40;
    uint64_t v24 = _Block_copy(aBlock);
    swift_release();
    uint64_t v25 = v8;
    sub_209C4D138();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_209C234C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267600BA0);
    sub_209C23520();
    uint64_t v26 = v28;
    sub_209C4D418();
    MEMORY[0x210509D40](v14, v25, v5, v24);
    _Block_release(v24);

    (*(void (**)(char *, uint64_t))(v29 + 8))(v5, v26);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v25, v32);
    v27(v14, v22);
  }
}

void sub_209C1E518()
{
  uint64_t v1 = v0;
  v27.receiver = v0;
  v27.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v27, sel_viewDidLoad);
  sub_209C4C718();
  sub_209C3E224();
  swift_release();
  sub_209C1E8B8();
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_sceneView];
  id v3 = objc_msgSend(v1, sel_view);
  if (!v3)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v4 = v3;
  objc_msgSend(v3, sel_bounds);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  id v13 = objc_msgSend(v1, sel_view);
  if (!v13)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v14 = v13;
  objc_msgSend(v13, sel_safeAreaInsets);
  double v16 = v15;

  objc_msgSend(v2, sel_setFrame_, UIEdgeInsetsInsetRect(v6, v8, v10, v12, v16, 0.0));
  id v17 = objc_msgSend(self, sel_blackColor);
  objc_msgSend(v2, sel_setBackgroundColor_, v17);

  objc_msgSend(v2, sel_setAutoenablesDefaultLighting_, 1);
  objc_msgSend(v2, sel_setAllowsCameraControl_, 1);
  objc_msgSend(v2, sel_setJitteringEnabled_, 1);
  objc_msgSend(v2, sel_setPreferredFramesPerSecond_, 60);
  objc_msgSend(v2, sel_setAntialiasingMode_, 1);
  objc_msgSend(v2, sel_setDelegate_, v1);
  objc_msgSend(v2, sel_setAlpha_, 0.0);
  id v18 = objc_msgSend(v1, sel_view);
  if (!v18)
  {
LABEL_13:
    __break(1u);
    return;
  }
  id v19 = v18;
  objc_msgSend(v18, sel_insertSubview_atIndex_, v2, 0);

  id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F16AD8]), sel_init);
  objc_msgSend(v2, sel_setScene_, v20);

  swift_getKeyPath();
  swift_getKeyPath();
  sub_209C4C718();
  sub_209C4CD68();
  swift_release();
  swift_release();
  swift_release();
  if (v26 == 2)
  {
    sub_209C1EC8C();
  }
  else
  {
    if (qword_2676005F8 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_209C4CAD8();
    __swift_project_value_buffer(v21, (uint64_t)qword_267602EE0);
    os_log_type_t v22 = sub_209C4D378();
    uint64_t v23 = sub_209C4CAB8();
    os_log_type_t v24 = v22;
    if (os_log_type_enabled(v23, v22))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_2099F8000, v23, v24, "The OnboardingBuddySetupViewModel are not loaded into memory", v25, 2u);
      MEMORY[0x21050C4E0](v25, -1, -1);
    }
  }
}

void sub_209C1E8B8()
{
  unint64_t v1 = (unint64_t)v0;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_graduatedNeutralDensityLayer];
  id v3 = &selRef_stopDiscovery;
  id v4 = objc_msgSend(v0, sel_view);
  if (!v4)
  {
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  double v5 = v4;
  objc_msgSend(v4, sel_bounds);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  objc_msgSend(v2, sel_setFrame_, v7, v9, v11, v13);
  if (qword_2676005F0 != -1) {
    goto LABEL_18;
  }
  while (1)
  {
    uint64_t v14 = off_267600A08;
    int64_t v15 = *((void *)off_267600A08 + 2);
    if (!v15) {
      break;
    }
    unint64_t v37 = v1;
    uint64_t v40 = MEMORY[0x263F8EE78];
    sub_209C4C708();
    sub_209C2813C(0, v15, 0);
    uint64_t v16 = v40;
    id v17 = self;
    int64_t v18 = v15 + 3;
    id v3 = &selRef_changeToPortraitAperture_;
    while (v18 != 3)
    {
      if ((unint64_t)(v18 - 4) >= v14[2]) {
        goto LABEL_17;
      }
      double v19 = *(double *)&v14[v18];
      id v20 = objc_msgSend(v17, sel_blackColor);
      id v21 = objc_msgSend(v20, sel_colorWithAlphaComponent_, v19);

      id v22 = objc_msgSend(v21, sel_CGColor);
      type metadata accessor for CGColor(0);
      uint64_t v39 = v23;
      uint64_t v40 = v16;
      *(void *)&long long v38 = v22;
      unint64_t v1 = *(void *)(v16 + 16);
      unint64_t v24 = *(void *)(v16 + 24);
      if (v1 >= v24 >> 1)
      {
        sub_209C2813C(v24 > 1, v1 + 1, 1);
        uint64_t v16 = v40;
      }
      *(void *)(v16 + 16) = v1 + 1;
      sub_209C23628(&v38, (_OWORD *)(v16 + 32 * v1 + 32));
      if (--v18 == 3)
      {
        swift_bridgeObjectRelease();
        unint64_t v1 = v37;
        id v3 = &selRef_stopDiscovery;
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    swift_once();
  }
LABEL_11:
  uint64_t v25 = (void *)sub_209C4D258();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setColors_, v25);

  objc_msgSend(v2, sel_setStartPoint_, 0.5, 0.0);
  objc_msgSend(v2, sel_setEndPoint_, 0.5, 1.0);
  id v26 = [(id)v1 v3[472]];
  if (!v26) {
    goto LABEL_20;
  }
  objc_super v27 = v26;
  id v28 = objc_msgSend(v26, sel_layer);

  objc_msgSend(v28, sel_addSublayer_, v2);
  uint64_t v29 = *(void **)(v1 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_progressiveBlurFilter);
  if (!v29) {
    return;
  }
  id v30 = v29;
  id v31 = [(id)v1 v3[472]];
  if (!v31)
  {
LABEL_21:
    __break(1u);
    return;
  }
  uint64_t v32 = v31;
  id v33 = objc_msgSend(v31, sel_layer);

  __swift_instantiateConcreteTypeFromMangledName(&qword_267600DF0);
  uint64_t v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_209C791C0;
  *(void *)(v34 + 56) = sub_209C23638(0, &qword_267600BD0);
  *(void *)(v34 + 32) = v30;
  id v35 = v30;
  id v36 = (void *)sub_209C4D258();
  swift_bridgeObjectRelease();
  objc_msgSend(v33, sel_setFilters_, v36);
}

void sub_209C1EC8C()
{
  uint64_t v1 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_viewModel;
  uint64_t v2 = *(void **)(*(void *)(v0 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_viewModel)
                + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_modelAsset);
  if (v2)
  {
    uint64_t v3 = v0;
    id v4 = objc_msgSend(v2, sel_objectAtIndex_, 0);
    if (v4)
    {
      uint64_t v5 = *(void *)(v0 + v1);
      double v6 = *(void **)(v5 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_demoLoopAnimationPackage);
      if (v6
        && (double v7 = *(void **)(v5 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_buttonHighlightAnimationPackage)) != 0
        && (double v8 = *(void **)(v5 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_buttonAccentAnimationPackage)) != 0)
      {
        id v215 = v4;
        double v9 = self;
        id v217 = v6;
        id v218 = v7;
        id v216 = v8;
        id v10 = objc_msgSend(v9, sel_nodeWithMDLObject_, v215);
        double v11 = (uint64_t *)OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_deviceModelNode;
        double v12 = *(void **)(v3 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_deviceModelNode);
        *(void *)(v3 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_deviceModelNode) = v10;

        double v13 = *(void **)((char *)v11 + v3);
        swift_getKeyPath();
        swift_getKeyPath();
        id v14 = v13;
        sub_209C4C718();
        sub_209C4CD68();
        swift_release();
        swift_release();
        if (v225) {
          float v15 = -0.7854;
        }
        else {
          float v15 = 0.0;
        }
        uint64_t v16 = self;
        *(float *)&double v17 = v15;
        id v18 = objc_msgSend(v16, sel_valueWithSCNVector3_, 0.0, v17, 0.0);
        swift_release();
        objc_msgSend(v18, sel_SCNVector3Value);
        int v20 = v19;
        int v22 = v21;
        int v24 = v23;

        LODWORD(v25) = v20;
        LODWORD(v26) = v22;
        LODWORD(v27) = v24;
        objc_msgSend(v14, sel_setEulerAngles_, v25, v26, v27);

        id v214 = *(id *)(v3 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_sceneView);
        id v28 = objc_msgSend(v214, sel_scene);
        if (v28)
        {
          uint64_t v29 = v28;
          id v30 = objc_msgSend(v28, sel_rootNode);

          objc_msgSend(v30, sel_addChildNode_, *(uint64_t *)((char *)v11 + v3));
        }
        id v31 = *(void **)(v3
                       + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonRippleEffectOverlayNode);
        id v32 = objc_msgSend(v31, sel_geometry);
        unint64_t v36 = (unint64_t)&selRef_imageForTickMarkAtIndex_;
        if (v32)
        {
          unint64_t v37 = v32;
          id v38 = objc_msgSend(v32, sel_firstMaterial);

          if (v38)
          {
            id v39 = objc_msgSend(v38, sel_diffuse);

            id v40 = objc_msgSend(v218, sel_rootLayer);
            objc_msgSend(v39, sel_setContents_, v40);
          }
        }
        LODWORD(v33) = 1082235290;
        LODWORD(v34) = -1069589463;
        LODWORD(v35) = 0.25;
        objc_msgSend(v31, sel_setPosition_, v33, v34, v35);
        objc_msgSend(v31, sel_eulerAngles);
        objc_msgSend(v31, sel_setEulerAngles_);
        objc_msgSend(*(id *)((char *)v11 + v3), sel_addChildNode_, v31);
        double v41 = (void *)sub_209C4D208();
        id v42 = objc_msgSend(self, sel_filterWithName_, v41);

        if (!v42)
        {
          __break(1u);
LABEL_154:
          sub_209C4D5B8();
          __break(1u);
          JUMPOUT(0x209C20654);
        }
        uint64_t v43 = (void *)sub_209C4D328();
        objc_msgSend(v42, sel_setValue_forKey_, v43, *MEMORY[0x263F00980]);

        __swift_instantiateConcreteTypeFromMangledName(&qword_267600BB8);
        uint64_t v44 = swift_allocObject();
        *(_OWORD *)(v44 + 16) = xmmword_209C791B0;
        *(void *)(v44 + 32) = v42;
        char v226 = v44;
        sub_209C4D278();
        sub_209C23638(0, (unint64_t *)&unk_267600BC0);
        id v210 = v42;
        id v45 = (void *)sub_209C4D258();
        swift_bridgeObjectRelease();
        objc_msgSend(v31, sel_setFilters_, v45);

        id v46 = objc_msgSend(v218, sel_rootLayer);
        id v47 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F158B0]), sel_initWithLayer_, v46);

        uint64_t v48 = *(void **)(v3
                       + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonHighlightStateController);
        long long v212 = (char *)OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonHighlightStateController;
        *(void *)(v3
                  + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonHighlightStateController) = v47;

        if (qword_2676005E0 != -1) {
          goto LABEL_152;
        }
        while (1)
        {
          id v49 = (unsigned __int8 *)off_2676009F8;
          uint64_t v50 = *((void *)off_2676009F8 + 2);
          uint64_t v213 = v3;
          long long v211 = v11;
          if (!v50) {
            break;
          }
          double v11 = (uint64_t *)(v3 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_animationStates);
          sub_209C4C708();
          uint64_t v3 = 0;
          long long v207 = "ck Finished";
          while (1)
          {
            uint64_t v53 = v49[v3 + 32];
            id v54 = objc_msgSend(v218, *(SEL *)(v36 + 2016), v207, v210);
            if (!v54)
            {
              swift_beginAccess();
LABEL_30:
              sub_209C4C708();
              unint64_t v68 = sub_209C368D8(v53);
              char v70 = v69;
              swift_bridgeObjectRelease();
              if (v70)
              {
                int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                uint64_t v72 = *v11;
                uint64_t v220 = *v11;
                uint64_t *v11 = 0x8000000000000000;
                if (!isUniquelyReferenced_nonNull_native)
                {
                  sub_209C38130();
                  uint64_t v72 = v220;
                }
                char v73 = *(void **)(*(void *)(v72 + 56) + 8 * v68);
                sub_209C225B4(v68, v72);
                uint64_t *v11 = v72;

                swift_bridgeObjectRelease();
              }
              goto LABEL_20;
            }
            uint64_t v55 = v54;
            objc_super v56 = (void *)sub_209C4D208();
            swift_bridgeObjectRelease();
            id v57 = objc_msgSend(v55, sel_stateWithName_, v56);

            swift_beginAccess();
            if (!v57) {
              goto LABEL_30;
            }
            char v58 = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v59 = *v11;
            v219 = (void *)*v11;
            uint64_t *v11 = 0x8000000000000000;
            unint64_t v36 = sub_209C368D8(v53);
            uint64_t v61 = *(void *)(v59 + 16);
            BOOL v62 = (v60 & 1) == 0;
            uint64_t v63 = v61 + v62;
            if (__OFADD__(v61, v62)) {
              break;
            }
            char v64 = v60;
            if (*(void *)(v59 + 24) >= v63)
            {
              if (v58)
              {
                uint64_t v67 = v219;
                if ((v60 & 1) == 0) {
                  goto LABEL_36;
                }
              }
              else
              {
                sub_209C38130();
                uint64_t v67 = v219;
                if ((v64 & 1) == 0) {
                  goto LABEL_36;
                }
              }
            }
            else
            {
              sub_209C377C4(v63, v58);
              uint64_t v65 = sub_209C368D8(v53);
              if ((v64 & 1) != (v66 & 1)) {
                goto LABEL_154;
              }
              unint64_t v36 = v65;
              uint64_t v67 = v219;
              if ((v64 & 1) == 0)
              {
LABEL_36:
                v67[(v36 >> 6) + 8] |= 1 << v36;
                *(unsigned char *)(v67[6] + v36) = v53;
                *(void *)(v67[7] + 8 * v36) = v57;
                uint64_t v74 = v67[2];
                BOOL v75 = __OFADD__(v74, 1);
                uint64_t v76 = v74 + 1;
                if (v75) {
                  goto LABEL_149;
                }
                v67[2] = v76;
                goto LABEL_19;
              }
            }
            uint64_t v51 = v67[7];
            id v52 = *(void **)(v51 + 8 * v36);
            *(void *)(v51 + 8 * v36) = v57;

LABEL_19:
            uint64_t *v11 = (uint64_t)v67;
            swift_bridgeObjectRelease();
            unint64_t v36 = (unint64_t)&selRef_imageForTickMarkAtIndex_;
LABEL_20:
            ++v3;
            swift_endAccess();
            if (v50 == v3)
            {
              swift_bridgeObjectRelease();
              uint64_t v3 = v213;
              goto LABEL_44;
            }
          }
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          swift_once();
        }
LABEL_44:
        uint64_t v77 = *(void **)&v212[v3];
        if (v77)
        {
          id v78 = v77;
          id v79 = [v218 *(SEL *)(v36 + 2016)];
          objc_msgSend(v78, sel_setInitialStatesOfLayer_, v79);

          uint64_t v80 = *(void **)&v212[v3];
          if (v80)
          {
            uint64_t v81 = (uint64_t *)(v3 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_animationStates);
            swift_beginAccess();
            uint64_t v82 = *v81;
            id v83 = *(id *)(*v81 + 16);
            id v84 = v80;
            if (v83)
            {
              uint64_t v85 = sub_209C368D8(9);
              if (v86) {
                id v83 = *(id *)(*(void *)(v82 + 56) + 8 * v85);
              }
              else {
                id v83 = 0;
              }
            }
            swift_endAccess();
            id v87 = [v218 *(SEL *)(v36 + 2016)];
            LODWORD(v88) = 1.0;
            objc_msgSend(v84, sel_setState_ofLayer_transitionSpeed_, v83, v87, v88);
          }
        }
        id v89 = [v217 *(SEL *)(v36 + 2016)];
        id v90 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F158B0]), sel_initWithLayer_, v89);

        uint64_t v91 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_demoLoopAnimationStateController;
        uint64_t v92 = *(void **)(v3
                       + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_demoLoopAnimationStateController);
        *(void *)(v3
                  + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_demoLoopAnimationStateController) = v90;

        uint64_t v93 = *(void **)(v3 + v91);
        if (v93) {
          objc_msgSend(v93, sel_setDelegate_, v3);
        }
        if (qword_2676005D8 != -1) {
          swift_once();
        }
        uint64_t v94 = (unsigned __int8 *)off_2676009F0;
        uint64_t v95 = *((void *)off_2676009F0 + 2);
        if (v95)
        {
          uint64_t v208 = v91;
          double v11 = (uint64_t *)(v3 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_animationStates);
          sub_209C4C708();
          uint64_t v3 = 0;
          long long v212 = "ck Finished";
          while (1)
          {
            uint64_t v98 = v94[v3 + 32];
            id v99 = objc_msgSend(v217, *(SEL *)(v36 + 2016), v208);
            if (!v99)
            {
              swift_beginAccess();
LABEL_69:
              sub_209C4C708();
              unint64_t v113 = sub_209C368D8(v98);
              char v115 = v114;
              swift_bridgeObjectRelease();
              if (v115)
              {
                int v116 = swift_isUniquelyReferenced_nonNull_native();
                uint64_t v117 = *v11;
                uint64_t v222 = *v11;
                uint64_t *v11 = 0x8000000000000000;
                if (!v116)
                {
                  sub_209C38130();
                  uint64_t v117 = v222;
                }
                v118 = *(void **)(*(void *)(v117 + 56) + 8 * v113);
                sub_209C225B4(v113, v117);
                uint64_t *v11 = v117;

                swift_bridgeObjectRelease();
              }
              goto LABEL_59;
            }
            uint64_t v100 = v99;
            uint64_t v101 = (void *)sub_209C4D208();
            swift_bridgeObjectRelease();
            id v102 = objc_msgSend(v100, sel_stateWithName_, v101);

            swift_beginAccess();
            if (!v102) {
              goto LABEL_69;
            }
            char v103 = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v104 = *v11;
            long long v221 = (void *)*v11;
            uint64_t *v11 = 0x8000000000000000;
            unint64_t v36 = sub_209C368D8(v98);
            uint64_t v106 = *(void *)(v104 + 16);
            BOOL v107 = (v105 & 1) == 0;
            uint64_t v108 = v106 + v107;
            if (__OFADD__(v106, v107)) {
              goto LABEL_147;
            }
            char v109 = v105;
            if (*(void *)(v104 + 24) >= v108)
            {
              if (v103)
              {
                long long v112 = v221;
                if ((v105 & 1) == 0) {
                  goto LABEL_75;
                }
              }
              else
              {
                sub_209C38130();
                long long v112 = v221;
                if ((v109 & 1) == 0) {
                  goto LABEL_75;
                }
              }
            }
            else
            {
              sub_209C377C4(v108, v103);
              uint64_t v110 = sub_209C368D8(v98);
              if ((v109 & 1) != (v111 & 1)) {
                goto LABEL_154;
              }
              unint64_t v36 = v110;
              long long v112 = v221;
              if ((v109 & 1) == 0)
              {
LABEL_75:
                v112[(v36 >> 6) + 8] |= 1 << v36;
                *(unsigned char *)(v112[6] + v36) = v98;
                *(void *)(v112[7] + 8 * v36) = v102;
                uint64_t v119 = v112[2];
                BOOL v75 = __OFADD__(v119, 1);
                uint64_t v120 = v119 + 1;
                if (v75) {
                  goto LABEL_150;
                }
                v112[2] = v120;
                goto LABEL_58;
              }
            }
            uint64_t v96 = v112[7];
            uint64_t v97 = *(void **)(v96 + 8 * v36);
            *(void *)(v96 + 8 * v36) = v102;

LABEL_58:
            uint64_t *v11 = (uint64_t)v112;
            swift_bridgeObjectRelease();
            unint64_t v36 = (unint64_t)&selRef_imageForTickMarkAtIndex_;
LABEL_59:
            ++v3;
            swift_endAccess();
            if (v95 == v3)
            {
              swift_bridgeObjectRelease();
              uint64_t v3 = v213;
              uint64_t v91 = v208;
              break;
            }
          }
        }
        v121 = *(void **)(v3 + v91);
        if (v121)
        {
          id v122 = v121;
          id v123 = [v217 *(SEL *)(v36 + 2016)];
          objc_msgSend(v122, sel_setInitialStatesOfLayer_, v123);

          int v124 = *(void **)(v3 + v91);
          if (v124)
          {
            uint64_t v125 = (uint64_t *)(v3 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_animationStates);
            swift_beginAccess();
            uint64_t v126 = *v125;
            id v127 = *(id *)(*v125 + 16);
            id v128 = v124;
            if (v127)
            {
              uint64_t v129 = sub_209C368D8(4);
              if (v130) {
                id v127 = *(id *)(*(void *)(v126 + 56) + 8 * v129);
              }
              else {
                id v127 = 0;
              }
            }
            swift_endAccess();
            id v131 = [v217 *(SEL *)(v36 + 2016)];
            objc_msgSend(v128, sel_setState_ofLayer_, v127, v131);
          }
        }
        id v132 = [v216 *(SEL *)(v36 + 2016)];
        id v133 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F158B0]), sel_initWithLayer_, v132);

        uint64_t v134 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonGlowAccentAnimationStateController;
        v135 = *(void **)(v3
                        + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonGlowAccentAnimationStateController);
        *(void *)(v3
                  + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonGlowAccentAnimationStateController) = v133;

        v136 = *(void **)(v3 + v134);
        if (v136) {
          objc_msgSend(v136, sel_setDelegate_, v3);
        }
        long long v212 = (char *)v134;
        if (qword_2676005E8 != -1) {
          swift_once();
        }
        uint64_t v137 = (unsigned __int8 *)off_267600A00;
        uint64_t v138 = *((void *)off_267600A00 + 2);
        if (v138)
        {
          double v11 = (uint64_t *)(v3 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_animationStates);
          sub_209C4C708();
          uint64_t v3 = 0;
          long long v209 = "ck Finished";
          while (1)
          {
            uint64_t v141 = v137[v3 + 32];
            id v142 = objc_msgSend(v216, *(SEL *)(v36 + 2016), v209);
            if (!v142)
            {
              swift_beginAccess();
LABEL_105:
              sub_209C4C708();
              unint64_t v156 = sub_209C368D8(v141);
              char v158 = v157;
              swift_bridgeObjectRelease();
              if (v158)
              {
                int v159 = swift_isUniquelyReferenced_nonNull_native();
                uint64_t v160 = *v11;
                uint64_t v224 = *v11;
                uint64_t *v11 = 0x8000000000000000;
                if (!v159)
                {
                  sub_209C38130();
                  uint64_t v160 = v224;
                }
                uint64_t v161 = *(void **)(*(void *)(v160 + 56) + 8 * v156);
                sub_209C225B4(v156, v160);
                uint64_t *v11 = v160;

                swift_bridgeObjectRelease();
              }
              goto LABEL_95;
            }
            uint64_t v143 = v142;
            uint64_t v144 = (void *)sub_209C4D208();
            swift_bridgeObjectRelease();
            id v145 = objc_msgSend(v143, sel_stateWithName_, v144);

            swift_beginAccess();
            if (!v145) {
              goto LABEL_105;
            }
            char v146 = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v147 = *v11;
            long long v223 = (void *)*v11;
            uint64_t *v11 = 0x8000000000000000;
            unint64_t v36 = sub_209C368D8(v141);
            uint64_t v149 = *(void *)(v147 + 16);
            BOOL v150 = (v148 & 1) == 0;
            uint64_t v151 = v149 + v150;
            if (__OFADD__(v149, v150)) {
              goto LABEL_148;
            }
            char v152 = v148;
            if (*(void *)(v147 + 24) >= v151)
            {
              if (v146)
              {
                uint64_t v155 = v223;
                if ((v148 & 1) == 0) {
                  goto LABEL_111;
                }
              }
              else
              {
                sub_209C38130();
                uint64_t v155 = v223;
                if ((v152 & 1) == 0) {
                  goto LABEL_111;
                }
              }
            }
            else
            {
              sub_209C377C4(v151, v146);
              uint64_t v153 = sub_209C368D8(v141);
              if ((v152 & 1) != (v154 & 1)) {
                goto LABEL_154;
              }
              unint64_t v36 = v153;
              uint64_t v155 = v223;
              if ((v152 & 1) == 0)
              {
LABEL_111:
                v155[(v36 >> 6) + 8] |= 1 << v36;
                *(unsigned char *)(v155[6] + v36) = v141;
                *(void *)(v155[7] + 8 * v36) = v145;
                uint64_t v162 = v155[2];
                BOOL v75 = __OFADD__(v162, 1);
                uint64_t v163 = v162 + 1;
                if (v75) {
                  goto LABEL_151;
                }
                v155[2] = v163;
                goto LABEL_94;
              }
            }
            uint64_t v139 = v155[7];
            uint64_t v140 = *(void **)(v139 + 8 * v36);
            *(void *)(v139 + 8 * v36) = v145;

LABEL_94:
            uint64_t *v11 = (uint64_t)v155;
            swift_bridgeObjectRelease();
            unint64_t v36 = (unint64_t)&selRef_imageForTickMarkAtIndex_;
LABEL_95:
            ++v3;
            swift_endAccess();
            if (v138 == v3)
            {
              swift_bridgeObjectRelease();
              uint64_t v3 = v213;
              break;
            }
          }
        }
        unsigned __int8 v164 = *(void **)&v212[v3];
        if (v164)
        {
          id v165 = v164;
          id v166 = objc_msgSend(v216, sel_rootLayer);
          objc_msgSend(v165, sel_setInitialStatesOfLayer_, v166);

          uint64_t v167 = *(void **)&v212[v3];
          if (v167)
          {
            uint64_t v168 = (uint64_t *)(v3 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_animationStates);
            swift_beginAccess();
            uint64_t v169 = *v168;
            id v170 = *(id *)(*v168 + 16);
            id v171 = v167;
            if (v170)
            {
              uint64_t v172 = sub_209C368D8(12);
              if (v173) {
                id v170 = *(id *)(*(void *)(v169 + 56) + 8 * v172);
              }
              else {
                id v170 = 0;
              }
            }
            swift_endAccess();
            id v174 = objc_msgSend(v216, sel_rootLayer);
            LODWORD(v175) = 1.0;
            objc_msgSend(v171, sel_setState_ofLayer_transitionSpeed_, v170, v174, v175);
          }
        }
        id v176 = *(id *)((char *)v211 + v3);
        uint64_t v177 = (void *)sub_209C4D208();
        id v178 = objc_msgSend(v176, sel_childNodeWithName_recursively_, v177, 1);

        if (v178)
        {
          id v179 = objc_msgSend(v178, sel_geometry);

          if (v179)
          {
            id v180 = objc_msgSend(v179, sel_firstMaterial);

            if (v180)
            {
              id v181 = objc_msgSend(v180, sel_emission);

              id v182 = objc_msgSend(v216, sel_rootLayer);
              objc_msgSend(v181, sel_setContents_, v182);
            }
          }
        }
        id v183 = *(id *)((char *)v211 + v3);
        uint64_t v184 = (void *)sub_209C4D208();
        id v185 = objc_msgSend(v183, sel_childNodeWithName_recursively_, v184, 1);

        if (v185)
        {
          id v186 = objc_msgSend(v185, sel_geometry);

          if (v186)
          {
            id v187 = objc_msgSend(v186, sel_firstMaterial);

            if (v187)
            {
              id v188 = objc_msgSend(v187, sel_emission);

              id v189 = objc_msgSend(v217, sel_rootLayer);
              objc_msgSend(v188, sel_setContents_, v189);
            }
          }
        }
        id v190 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F16A98]), sel_init);
        id v191 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F16A70]), sel_init);
        objc_msgSend(v190, sel_setLight_, v191);

        id v192 = objc_msgSend(v190, sel_light);
        if (v192)
        {
          long long v195 = v192;
          objc_msgSend(v192, sel_setType_, *MEMORY[0x263F16B80]);
        }
        LODWORD(v193) = 10.0;
        LODWORD(v194) = 10.0;
        objc_msgSend(v190, sel_setPosition_, 0.0, v193, v194);
        id v196 = objc_msgSend(v214, sel_scene);
        if (v196)
        {
          long long v197 = v196;
          id v198 = objc_msgSend(v196, sel_rootNode);

          objc_msgSend(v198, sel_addChildNode_, v190);
        }
        long long v199 = *(void **)(v3 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_cameraNode);
        id v200 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F169F0]), sel_init);
        objc_msgSend(v199, sel_setCamera_, v200);

        swift_getKeyPath();
        swift_getKeyPath();
        sub_209C4C718();
        sub_209C4CD68();
        swift_release();
        swift_release();
        swift_release();
        LODWORD(v203) = 0.5;
        if (v226) {
          *(float *)&double v201 = 0.5;
        }
        else {
          *(float *)&double v201 = 0.0;
        }
        if (v226) {
          *(float *)&double v203 = -2.9;
        }
        LODWORD(v202) = 19.0;
        if (v226) {
          *(float *)&double v202 = 14.0;
        }
        objc_msgSend(v199, sel_setPosition_, v201, v203, v202);
        id v204 = objc_msgSend(v214, sel_scene);
        if (v204)
        {
          v205 = v204;
          id v206 = objc_msgSend(v204, sel_rootNode);

          objc_msgSend(v206, sel_addChildNode_, v199);
        }
      }
      else
      {
      }
    }
  }
}

id sub_209C20744(char a1)
{
  v11.receiver = v1;
  v11.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v11, sel_viewDidDisappear_, a1 & 1);
  uint64_t v3 = *(void **)&v1[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_demoLoopAnimationStateController];
  if (v3)
  {
    if (objc_msgSend(v3, sel_removeAllStateChanges))
    {
      sub_209C4D408();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v7 = 0u;
      long long v8 = 0u;
    }
    sub_209C2359C((uint64_t)&v7, (uint64_t)&v9);
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
  }
  sub_209C1815C((uint64_t)&v9, &qword_267600BB0);
  id v4 = *(void **)&v1[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonGlowAccentAnimationStateController];
  if (v4)
  {
    if (objc_msgSend(v4, sel_removeAllStateChanges))
    {
      sub_209C4D408();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v7 = 0u;
      long long v8 = 0u;
    }
    sub_209C2359C((uint64_t)&v7, (uint64_t)&v9);
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
  }
  sub_209C1815C((uint64_t)&v9, &qword_267600BB0);
  uint64_t v5 = *(void **)&v1[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonHighlightStateController];
  if (v5)
  {
    if (objc_msgSend(v5, sel_removeAllStateChanges))
    {
      sub_209C4D408();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v7 = 0u;
      long long v8 = 0u;
    }
    sub_209C2359C((uint64_t)&v7, (uint64_t)&v9);
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
  }
  sub_209C1815C((uint64_t)&v9, &qword_267600BB0);
  id result = objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_sceneView], sel_stop_, 0);
  v1[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_paused] = 1;
  return result;
}

uint64_t sub_209C2095C()
{
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  CGContextRef v1 = CGBitmapContextCreate(0, 1uLL, 0x20uLL, 8uLL, 0, DeviceRGB, 1u);
  if (!v1)
  {

    return 0;
  }
  CGContextRef v2 = v1;
  if (qword_2676005F0 != -1) {
    goto LABEL_40;
  }
  while (1)
  {
    uint64_t v3 = off_267600A08;
    size_t v4 = *((void *)off_267600A08 + 2);
    uint64_t v42 = MEMORY[0x263F8EE78];
    sub_209C2811C(0, v4, 0);
    if (v4)
    {
      uint64_t v5 = 0;
      while (v4 != v5)
      {
        unint64_t v7 = *(void *)(v42 + 16);
        unint64_t v6 = *(void *)(v42 + 24);
        if (v7 >= v6 >> 1) {
          sub_209C2811C(v6 > 1, v7 + 1, 1);
        }
        *(void *)(v42 + 16) = v7 + 1;
        *(double *)(v42 + 8 * v7 + 32) = (double)v5++ / (double)(uint64_t)(v4 - 1);
        if (v4 == v5) {
          goto LABEL_9;
        }
      }
      __break(1u);
      goto LABEL_37;
    }
LABEL_9:
    CGContextRef v8 = (CGContextRef)v3[2];
    if (!v8) {
      break;
    }
    id v40 = v2;
    double v41 = DeviceRGB;
    sub_209C4C708();
    CGContextRef v2 = 0;
    long long v9 = (CGFloat *)MEMORY[0x263F8EE78];
    while (1)
    {
      uint64_t v10 = v3[(void)v2 + 4];
      __swift_instantiateConcreteTypeFromMangledName(&qword_267600BD8);
      initedouble d = (CGFloat *)swift_initStackObject();
      inited[4] = 0.0;
      double v12 = inited + 4;
      inited[5] = 0.0;
      inited[6] = 0.0;
      *((void *)inited + 7) = v10;
      DeviceRGB = (CGColorSpace *)*((void *)v9 + 2);
      double v13 = (CGColorSpace *)((char *)DeviceRGB + 4);
      if (__OFADD__(DeviceRGB, 4)) {
        break;
      }
      id v14 = inited;
      int isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || (uint64_t v16 = *((void *)v9 + 3) >> 1, v16 < (uint64_t)v13))
      {
        if ((uint64_t)DeviceRGB <= (uint64_t)v13) {
          int64_t v17 = (int64_t)DeviceRGB + 4;
        }
        else {
          int64_t v17 = (int64_t)DeviceRGB;
        }
        long long v9 = (CGFloat *)sub_209C27EFC(isUniquelyReferenced_nonNull_native, v17, 1, v9);
        uint64_t v16 = *((void *)v9 + 3) >> 1;
      }
      uint64_t v18 = *((void *)v9 + 2);
      if (v16 - v18 < 4) {
        goto LABEL_38;
      }
      int v19 = &v9[v18 + 4];
      if (v12 < &v9[v18 + 8] && v19 < v14 + 8)
      {
        uint64_t result = sub_209C4D558();
        __break(1u);
        return result;
      }
      long long v21 = *((_OWORD *)v12 + 1);
      *(_OWORD *)int v19 = *(_OWORD *)v12;
      *(_OWORD *)&v9[v18 + 6] = v21;
      BOOL v22 = __OFADD__(v18, 4);
      uint64_t v23 = v18 + 4;
      if (v22) {
        goto LABEL_39;
      }
      CGContextRef v2 = (CGContextRef)((char *)v2 + 1);
      *((void *)v9 + 2) = v23;
      swift_setDeallocating();
      if (v8 == v2)
      {
        swift_bridgeObjectRelease();
        CGContextRef v2 = v40;
        DeviceRGB = v41;
        goto LABEL_29;
      }
    }
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    swift_once();
  }
  long long v9 = (CGFloat *)MEMORY[0x263F8EE78];
LABEL_29:
  int v24 = CGGradientCreateWithColorComponents(DeviceRGB, v9 + 4, (const CGFloat *)(v42 + 32), v4);
  swift_bridgeObjectRelease();
  swift_release();
  if (!v24)
  {

    return 0;
  }
  v44.y = 32.0;
  v43.x = 0.0;
  v43.y = 0.0;
  v44.x = 0.0;
  CGContextDrawLinearGradient(v2, v24, v43, v44, 0);
  CGImageRef Image = CGBitmapContextCreateImage(v2);
  if (!Image)
  {

    return 0;
  }
  CGImageRef v26 = Image;
  id v27 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, 2.0);
  sub_209C4D218();
  id v28 = objc_allocWithZone(MEMORY[0x263F157C8]);
  uint64_t v29 = (void *)sub_209C4D208();
  swift_bridgeObjectRelease();
  id v30 = objc_msgSend(v28, sel_initWithType_, v29);

  id v31 = v26;
  id v32 = (void *)sub_209C4D208();
  objc_msgSend(v30, sel_setValue_forKey_, v31, v32);

  objc_msgSend(v30, sel_setValue_forKey_, v27, *MEMORY[0x263F15C80]);
  double v33 = (void *)sub_209C4D288();
  double v34 = (void *)sub_209C4D208();
  objc_msgSend(v30, sel_setValue_forKey_, v33, v34);

  double v35 = (void *)sub_209C4D208();
  unint64_t v36 = (void *)sub_209C4D208();
  objc_msgSend(v30, sel_setValue_forKey_, v35, v36);

  unint64_t v37 = (void *)sub_209C4D208();
  id v38 = (void *)sub_209C4D208();
  objc_msgSend(v30, sel_setValue_forKey_, v37, v38);

  return (uint64_t)v30;
}

void sub_209C20EAC(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x21050C5A0](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    if ((*(unsigned char *)(v2 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_demoLoopHasStarted) & 1) == 0) {
      sub_209C1E078();
    }
  }
}

void sub_209C20F10(char a1, char a2)
{
  uint64_t v3 = v2;
  unint64_t v6 = self;
  objc_msgSend(v6, sel_begin);
  objc_msgSend(v6, sel_setAnimationDuration_, 0.2);
  unint64_t v7 = *(void **)&v2[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonGlowAccentAnimationStateController];
  if (v7)
  {
    CGContextRef v8 = &v2[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_animationStates];
    swift_beginAccess();
    uint64_t v9 = *(void *)v8;
    uint64_t v10 = *(void *)(v9 + 16);
    id v11 = v7;
    if (v10 && (uint64_t v12 = sub_209C368D8(13), (v13 & 1) != 0)) {
      id v14 = *(id *)(*(void *)(v9 + 56) + 8 * v12);
    }
    else {
      id v14 = 0;
    }
    swift_endAccess();
    float v15 = *(void **)(*(void *)&v3[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_viewModel]
                   + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_buttonAccentAnimationPackage);
    if (!v15)
    {
      __break(1u);
LABEL_32:
      __break(1u);
      goto LABEL_33;
    }
    id v16 = objc_msgSend(v15, sel_rootLayer);
    LODWORD(v17) = 1.0;
    objc_msgSend(v11, sel_setState_ofLayer_transitionSpeed_, v14, v16, v17);
  }
  uint64_t v18 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_deviceModelNode;
  id v19 = *(id *)&v3[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_deviceModelNode];
  int v20 = (void *)sub_209C4D208();
  id v21 = objc_msgSend(v19, sel_childNodeWithName_recursively_, v20, 1);

  if (v21)
  {
    LODWORD(v22) = -1127428915;
    if ((a1 & 1) == 0) {
      *(float *)&double v22 = -0.01;
    }
    objc_msgSend(v21, sel_setPosition_, v22, 0.0, 0.0);
  }
  id v23 = *(id *)&v3[v18];
  int v24 = (void *)sub_209C4D208();
  id v25 = objc_msgSend(v23, sel_childNodeWithName_recursively_, v24, 1);

  if (v25)
  {
    LODWORD(v26) = -1127428915;
    if ((a1 & 1) == 0) {
      *(float *)&double v26 = -0.01;
    }
    objc_msgSend(v25, sel_setPosition_, v26, 0.0, 0.0);
  }
  uint64_t v27 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonHighlightStateController;
  if (a2)
  {
    id v28 = &selRef_imageForTickMarkAtIndex_;
    uint64_t v29 = &selRef_imageForTickMarkAtIndex_;
  }
  else
  {
    id v30 = *(void **)&v3[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonHighlightStateController];
    id v28 = &selRef_imageForTickMarkAtIndex_;
    uint64_t v29 = &selRef_imageForTickMarkAtIndex_;
    if (v30)
    {
      id v31 = *(void **)(*(void *)&v3[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_viewModel]
                     + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_buttonHighlightAnimationPackage);
      if (!v31)
      {
LABEL_33:
        __break(1u);
        return;
      }
      id v32 = v30;
      id v33 = objc_msgSend(v31, sel_rootLayer);
      objc_msgSend(v32, sel_setInitialStatesOfLayer_, v33);

      uint64_t v27 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonHighlightStateController;
    }
  }
  double v34 = *(void **)&v3[v27];
  if (v34)
  {
    double v35 = &v3[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_animationStates];
    swift_beginAccess();
    uint64_t v36 = *(void *)v35;
    uint64_t v37 = *(void *)(v36 + 16);
    id v38 = v34;
    if (v37 && (uint64_t v39 = sub_209C368D8(10), (v40 & 1) != 0)) {
      id v41 = *(id *)(*(void *)(v36 + 56) + 8 * v39);
    }
    else {
      id v41 = 0;
    }
    swift_endAccess();
    uint64_t v42 = *(void **)(*(void *)&v3[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_viewModel]
                   + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_buttonHighlightAnimationPackage);
    if (v42)
    {
      id v43 = [v42 v29[252]];
      LODWORD(v44) = 1.0;
      objc_msgSend(v38, v28[253], v41, v43, v44);

      goto LABEL_28;
    }
    goto LABEL_32;
  }
LABEL_28:
  if (a2)
  {
    uint64_t v45 = swift_allocObject();
    *(void *)(v45 + 16) = v3;
    v48[4] = sub_209C23584;
    v48[5] = v45;
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 1107296256;
    v48[2] = sub_209C1DB88;
    v48[3] = &block_descriptor_32;
    id v46 = _Block_copy(v48);
    id v47 = v3;
    swift_release();
    objc_msgSend(v6, sel_setCompletionBlock_, v46);
    _Block_release(v46);
  }
  objc_msgSend(v6, sel_commit);
}

uint64_t sub_209C213B0(uint64_t a1)
{
  uint64_t v21 = a1;
  uint64_t v1 = sub_209C4D128();
  uint64_t v24 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_209C4D148();
  uint64_t v22 = *(void *)(v4 - 8);
  uint64_t v23 = v4;
  MEMORY[0x270FA5388](v4);
  unint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_209C4D178();
  uint64_t v20 = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  id v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  char v13 = (char *)&v19 - v12;
  sub_209C23638(0, &qword_267600B90);
  id v14 = (void *)sub_209C4D3B8();
  sub_209C4D168();
  MEMORY[0x210509B20](v11, 0.1);
  float v15 = *(void (**)(char *, uint64_t))(v8 + 8);
  v15(v11, v7);
  uint64_t v16 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_209C2358C;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_209C1DB88;
  aBlock[3] = &block_descriptor_36;
  double v17 = _Block_copy(aBlock);
  swift_release();
  sub_209C4D138();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_209C234C8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267600BA0);
  sub_209C23520();
  sub_209C4D418();
  MEMORY[0x210509D40](v13, v6, v3, v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v24 + 8))(v3, v1);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v6, v23);
  return ((uint64_t (*)(char *, uint64_t))v15)(v13, v20);
}

void sub_209C21724(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x21050C5A0](v1);
  if (!v2) {
    return;
  }
  uint64_t v3 = (char *)v2;
  uint64_t v4 = *(void **)(v2
                + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonGlowAccentAnimationStateController);
  if (v4)
  {
    uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_animationStates);
    swift_beginAccess();
    uint64_t v6 = *v5;
    uint64_t v7 = *(void *)(v6 + 16);
    id v8 = v4;
    if (v7 && (uint64_t v9 = sub_209C368D8(12), (v10 & 1) != 0)) {
      id v11 = *(id *)(*(void *)(v6 + 56) + 8 * v9);
    }
    else {
      id v11 = 0;
    }
    swift_endAccess();
    uint64_t v12 = *(void **)(*(void *)&v3[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_viewModel]
                   + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_buttonAccentAnimationPackage);
    if (!v12)
    {
      __break(1u);
      goto LABEL_23;
    }
    id v13 = objc_msgSend(v12, sel_rootLayer);
    LODWORD(v14) = 1.0;
    objc_msgSend(v8, sel_setState_ofLayer_transitionSpeed_, v11, v13, v14);
  }
  float v15 = *(void **)&v3[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonHighlightStateController];
  if (v15)
  {
    uint64_t v16 = &v3[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_animationStates];
    swift_beginAccess();
    uint64_t v17 = *(void *)v16;
    uint64_t v18 = *(void *)(v17 + 16);
    id v19 = v15;
    if (v18 && (uint64_t v20 = sub_209C368D8(11), (v21 & 1) != 0)) {
      id v22 = *(id *)(*(void *)(v17 + 56) + 8 * v20);
    }
    else {
      id v22 = 0;
    }
    swift_endAccess();
    uint64_t v23 = *(void **)(*(void *)&v3[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_viewModel]
                   + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_buttonHighlightAnimationPackage);
    if (v23)
    {
      id v24 = objc_msgSend(v23, sel_rootLayer);
      LODWORD(v25) = 1.0;
      objc_msgSend(v19, sel_setState_ofLayer_transitionSpeed_, v22, v24, v25);

      goto LABEL_16;
    }
LABEL_23:
    __break(1u);
    return;
  }
LABEL_16:
  double v26 = self;
  objc_msgSend(v26, sel_begin);
  objc_msgSend(v26, sel_setAnimationDuration_, 0.3);
  uint64_t v27 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_deviceModelNode;
  id v28 = *(id *)&v3[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_deviceModelNode];
  uint64_t v29 = (void *)sub_209C4D208();
  id v30 = objc_msgSend(v28, sel_childNodeWithName_recursively_, v29, 1);

  if (v30)
  {
    objc_msgSend(v30, sel_setPosition_, 0.0, 0.0, 0.0);
  }
  id v31 = *(id *)&v3[v27];
  id v32 = (void *)sub_209C4D208();
  id v33 = objc_msgSend(v31, sel_childNodeWithName_recursively_, v32, 1);

  if (v33)
  {
    objc_msgSend(v33, sel_setPosition_, 0.0, 0.0, 0.0);
  }
  objc_msgSend(v26, sel_commit);
}

void sub_209C21A74(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x21050C5A0](v1);
  if (v2)
  {
    uint64_t v3 = (char *)v2;
    uint64_t v4 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_viewModel;
    uint64_t v5 = *(void *)(v2 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_viewModel);
    if (*(unsigned char *)(v5 + 24) == 1)
    {
      uint64_t v6 = *(void **)(v2
                    + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_demoLoopAnimationStateController);
      if (v6)
      {
        uint64_t v7 = (uint64_t *)(v2 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_animationStates);
        swift_beginAccess();
        uint64_t v8 = *v7;
        uint64_t v9 = *(void *)(v8 + 16);
        char v10 = v6;
        if (v9 && (uint64_t v11 = sub_209C368D8(7), (v12 & 1) != 0)) {
          id v13 = *(id *)(*(void *)(v8 + 56) + 8 * v11);
        }
        else {
          id v13 = 0;
        }
        swift_endAccess();
        uint64_t v20 = *(void **)(*(void *)&v3[v4]
                       + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_demoLoopAnimationPackage);
        if (v20)
        {
LABEL_16:
          id v21 = objc_msgSend(v20, sel_rootLayer);
          LODWORD(v22) = 1.0;
          objc_msgSend(v10, sel_setState_ofLayer_transitionSpeed_, v13, v21, v22);

          uint64_t v3 = v10;
          goto LABEL_17;
        }
        __break(1u);
LABEL_20:
        __break(1u);
        return;
      }
    }
    else
    {
      *(unsigned char *)(v5 + 25) = 0;
      sub_209C4C718();
      sub_209C3F2E0();
      swift_release();
      double v14 = *(void **)&v3[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_demoLoopAnimationStateController];
      if (v14)
      {
        float v15 = &v3[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_animationStates];
        swift_beginAccess();
        uint64_t v16 = *(void *)v15;
        uint64_t v17 = *(void *)(v16 + 16);
        char v10 = v14;
        if (v17 && (uint64_t v18 = sub_209C368D8(0), (v19 & 1) != 0)) {
          id v13 = *(id *)(*(void *)(v16 + 56) + 8 * v18);
        }
        else {
          id v13 = 0;
        }
        swift_endAccess();
        uint64_t v20 = *(void **)(*(void *)&v3[v4]
                       + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_demoLoopAnimationPackage);
        if (v20) {
          goto LABEL_16;
        }
        goto LABEL_20;
      }
    }
LABEL_17:
  }
}

void sub_209C21C74(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_viewModel);
  if (*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 25) = 1;
    sub_209C4C718();
    sub_209C3F2E0();
    swift_release();
  }
  else
  {
    sub_209C1E078();
  }
}

void sub_209C21CE0(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x21050C5A0](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    sub_209C1E078();
  }
}

uint64_t type metadata accessor for OnboardingBuddyDeviceSceneViewController()
{
  return self;
}

uint64_t sub_209C21EF0(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = sub_209C4C718();
  v1(v2);
  return swift_release();
}

NSObject *sub_209C22078()
{
  uint64_t v0 = sub_209C4CAD8();
  __swift_allocate_value_buffer(v0, qword_267602EE0);
  __swift_project_value_buffer(v0, (uint64_t)qword_267602EE0);
  uint64_t result = os_log_create("com.apple.camera", "Camera");
  if (result) {
    return sub_209C4CAE8();
  }
  __break(1u);
  return result;
}

uint64_t sub_209C220F0()
{
  sub_209C1815C(v0 + OBJC_IVAR____TtC8CameraUI9Stopwatch_startTime, &qword_267600B88);
  sub_209C1815C(v0 + OBJC_IVAR____TtC8CameraUI9Stopwatch_endTime, &qword_267600B88);
  return swift_deallocClassInstance();
}

uint64_t sub_209C2217C()
{
  return type metadata accessor for Stopwatch();
}

uint64_t type metadata accessor for Stopwatch()
{
  uint64_t result = qword_267600B68;
  if (!qword_267600B68) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_209C221D0()
{
  sub_209C22260();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_209C22260()
{
  if (!qword_267600B78)
  {
    sub_209C4D178();
    unint64_t v0 = sub_209C4D3D8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267600B78);
    }
  }
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for OnboardingBuddyDeviceSceneViewController.AnimationStateDescription(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF3) {
    goto LABEL_17;
  }
  if (a2 + 13 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 13) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 13;
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
      return (*a1 | (v4 << 8)) - 13;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 13;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xE;
  int v8 = v6 - 14;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for OnboardingBuddyDeviceSceneViewController.AnimationStateDescription(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 13 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 13) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF2)
  {
    unsigned int v6 = ((a2 - 243) >> 8) + 1;
    *uint64_t result = a2 + 13;
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
        JUMPOUT(0x209C22420);
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
          *uint64_t result = a2 + 13;
        break;
    }
  }
  return result;
}

uint64_t sub_209C22448(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_209C22450(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for OnboardingBuddyDeviceSceneViewController.AnimationStateDescription()
{
  return &type metadata for OnboardingBuddyDeviceSceneViewController.AnimationStateDescription;
}

unint64_t sub_209C2246C()
{
  unint64_t result = qword_267600B80;
  if (!qword_267600B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267600B80);
  }
  return result;
}

uint64_t sub_209C224C0@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_209C4CD68();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_209C22540()
{
  return sub_209C4CD78();
}

unint64_t sub_209C225B4(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_209C4D428();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_209C4D608();
        sub_209C4D238();
        swift_bridgeObjectRelease();
        uint64_t result = sub_209C4D628();
        unint64_t v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 < v8) {
            goto LABEL_5;
          }
        }
        else if (v9 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v9)
        {
LABEL_11:
          uint64_t v10 = *(void *)(a2 + 48);
          uint64_t v11 = (unsigned char *)(v10 + v3);
          char v12 = (unsigned char *)(v10 + v6);
          if (v3 != v6 || v11 >= v12 + 1) {
            unsigned char *v11 = *v12;
          }
          uint64_t v13 = *(void *)(a2 + 56);
          double v14 = (void *)(v13 + 8 * v3);
          float v15 = (void *)(v13 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v14 >= v15 + 1))
          {
            *double v14 = *v15;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v16 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v17 = *v16;
    uint64_t v18 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v16 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v18 = *v16;
    uint64_t v17 = (-1 << result) - 1;
  }
  uint64_t *v16 = v18 & v17;
  uint64_t v19 = *(void *)(a2 + 16);
  BOOL v20 = __OFSUB__(v19, 1);
  uint64_t v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
    JUMPOUT(0x209C22900);
  }
  *(void *)(a2 + 16) = v21;
  ++*(_DWORD *)(a2 + 36);
  return result;
}

id sub_209C22938(uint64_t a1)
{
  int v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_renderStopwatch;
  type metadata accessor for Stopwatch();
  uint64_t v6 = swift_allocObject();
  uint64_t v7 = v6 + OBJC_IVAR____TtC8CameraUI9Stopwatch_startTime;
  uint64_t v8 = sub_209C4D178();
  unint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
  v9(v7, 1, 1, v8);
  v9(v6 + OBJC_IVAR____TtC8CameraUI9Stopwatch_endTime, 1, 1, v8);
  *(void *)&v2[v5] = v6;
  uint64_t v10 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_sceneView;
  id v11 = objc_allocWithZone(MEMORY[0x263F16B10]);
  char v12 = v2;
  *(void *)&v2[v10] = objc_msgSend(v11, sel_init);
  uint64_t v13 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_cameraNode;
  *(void *)&v12[v13] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F16A98]), sel_init);
  uint64_t v14 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_deviceModelNode;
  *(void *)&v12[v14] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F16A98]), sel_init);
  uint64_t v15 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonRippleEffectOverlayNode;
  *(void *)&v12[v15] = sub_209C1D370();
  uint64_t v16 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_animationStates;
  *(void *)&v12[v16] = sub_209C1C1C8(MEMORY[0x263F8EE78]);
  *(void *)&v12[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonHighlightStateController] = 0;
  *(void *)&v12[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_demoLoopAnimationStateController] = 0;
  *(void *)&v12[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonGlowAccentAnimationStateController] = 0;
  uint64_t v17 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_graduatedNeutralDensityLayer;
  *(void *)&v12[v17] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F157D0]), sel_init);
  v12[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_hasInitialRenderOccurred] = 0;
  v12[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_demoLoopHasStarted] = 0;
  v12[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_paused] = 0;
  uint64_t v18 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_progressiveBlurFilter;
  *(void *)&v12[v18] = sub_209C2095C();
  *(void *)&v12[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_viewModel] = a1;
  sub_209C4C718();

  v20.receiver = v12;
  v20.super_class = ObjectType;
  return objc_msgSendSuper2(&v20, sel_initWithNibName_bundle_, 0, 0);
}

uint64_t sub_209C22B6C()
{
  unint64_t v0 = sub_209C4D568();
  swift_bridgeObjectRelease();
  if (v0 >= 0xE) {
    return 14;
  }
  else {
    return v0;
  }
}

uint64_t sub_209C22BB8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_209C22BF0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  char v2 = *(unsigned char *)(v1 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_hasInitialRenderOccurred);
  *(unsigned char *)(v1 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_hasInitialRenderOccurred) = 1;
  return sub_209C1D4E4(v2);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return sub_209C4C718();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_209C22C40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600B88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_209C22CA8()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_209C22CE0()
{
  sub_209C1DB0C(v0);
}

void sub_209C22CF0()
{
  uint64_t v1 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_renderStopwatch;
  type metadata accessor for Stopwatch();
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = v2 + OBJC_IVAR____TtC8CameraUI9Stopwatch_startTime;
  uint64_t v4 = sub_209C4D178();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  v5(v3, 1, 1, v4);
  v5(v2 + OBJC_IVAR____TtC8CameraUI9Stopwatch_endTime, 1, 1, v4);
  *(void *)&v0[v1] = v2;
  uint64_t v6 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_sceneView;
  *(void *)&v0[v6] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F16B10]), sel_init);
  uint64_t v7 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_cameraNode;
  *(void *)&v0[v7] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F16A98]), sel_init);
  uint64_t v8 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_deviceModelNode;
  *(void *)&v0[v8] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F16A98]), sel_init);
  uint64_t v9 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonRippleEffectOverlayNode;
  *(void *)&v0[v9] = sub_209C1D370();
  uint64_t v10 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_animationStates;
  *(void *)&v0[v10] = sub_209C1C1C8(MEMORY[0x263F8EE78]);
  *(void *)&v0[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonHighlightStateController] = 0;
  *(void *)&v0[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_demoLoopAnimationStateController] = 0;
  *(void *)&v0[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonGlowAccentAnimationStateController] = 0;
  uint64_t v11 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_graduatedNeutralDensityLayer;
  *(void *)&v0[v11] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F157D0]), sel_init);
  v0[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_hasInitialRenderOccurred] = 0;
  v0[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_demoLoopHasStarted] = 0;
  v0[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_paused] = 0;
  uint64_t v12 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_progressiveBlurFilter;
  *(void *)&v0[v12] = sub_209C2095C();

  sub_209C4D518();
  __break(1u);
}

void sub_209C22EF8(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_209C4D178();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v34 - v9;
  uint64_t v39 = sub_209C4D128();
  uint64_t v11 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_209C4D148();
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v36 = v16;
  uint64_t v37 = v15;
  uint64_t v38 = v11;
  id v19 = objc_msgSend(a1, sel_toState);
  if (!v19)
  {
LABEL_13:
    __break(1u);
    JUMPOUT(0x209C234A0);
  }
  objc_super v20 = v19;
  sub_209C4D218();

  switch(sub_209C22B6C())
  {
    case 0u:
      char v21 = 0;
      char v22 = 0;
      goto LABEL_6;
    case 1u:
    case 2u:
      char v21 = 1;
      char v22 = 1;
LABEL_6:
      sub_209C20F10(v21, v22);
      break;
    case 5u:
      sub_209C23638(0, &qword_267600B90);
      uint64_t v23 = (void *)sub_209C4D3B8();
      uint64_t v24 = swift_allocObject();
      *(void *)(v24 + 16) = v2;
      double v44 = sub_209C2357C;
      uint64_t v45 = v24;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v41 = 1107296256;
      uint64_t v42 = sub_209C1DB88;
      id v43 = &block_descriptor_26;
      double v25 = _Block_copy(&aBlock);
      id v26 = v2;
      swift_release();
      sub_209C4D138();
      uint64_t aBlock = MEMORY[0x263F8EE78];
      sub_209C234C8();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267600BA0);
      sub_209C23520();
      uint64_t v27 = v39;
      sub_209C4D418();
      MEMORY[0x210509D60](0, v18, v13, v25);
      _Block_release(v25);

      (*(void (**)(char *, uint64_t))(v38 + 8))(v13, v27);
      (*(void (**)(char *, uint64_t))(v36 + 8))(v18, v37);
      break;
    case 7u:
      sub_209C23638(0, &qword_267600B90);
      uint64_t v34 = sub_209C4D3B8();
      sub_209C4D168();
      MEMORY[0x210509B20](v8, 5.0);
      double v35 = *(void (**)(char *, uint64_t))(v5 + 8);
      id v28 = v8;
      uint64_t v29 = v4;
      v35(v28, v4);
      uint64_t v30 = swift_allocObject();
      swift_unknownObjectWeakInit();
      double v44 = sub_209C234C0;
      uint64_t v45 = v30;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v41 = 1107296256;
      uint64_t v42 = sub_209C1DB88;
      id v43 = &block_descriptor_20;
      id v31 = _Block_copy(&aBlock);
      swift_release();
      sub_209C4D138();
      uint64_t aBlock = MEMORY[0x263F8EE78];
      sub_209C234C8();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267600BA0);
      sub_209C23520();
      uint64_t v32 = v39;
      sub_209C4D418();
      id v33 = (void *)v34;
      MEMORY[0x210509D40](v10, v18, v13, v31);
      _Block_release(v31);

      (*(void (**)(char *, uint64_t))(v38 + 8))(v13, v32);
      (*(void (**)(char *, uint64_t))(v36 + 8))(v18, v37);
      v35(v10, v29);
      break;
    default:
      return;
  }
}

void sub_209C234C0()
{
  sub_209C21CE0(v0);
}

unint64_t sub_209C234C8()
{
  unint64_t result = qword_267600B98;
  if (!qword_267600B98)
  {
    sub_209C4D128();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267600B98);
  }
  return result;
}

unint64_t sub_209C23520()
{
  unint64_t result = qword_267600BA8;
  if (!qword_267600BA8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267600BA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267600BA8);
  }
  return result;
}

void sub_209C2357C()
{
  sub_209C21C74(*(void *)(v0 + 16));
}

uint64_t sub_209C23584()
{
  return sub_209C213B0(*(void *)(v0 + 16));
}

void sub_209C2358C()
{
  sub_209C21724(v0);
}

void sub_209C23594()
{
  sub_209C21A74(v0);
}

uint64_t sub_209C2359C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600BB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

double UIEdgeInsetsInsetRect(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

_OWORD *sub_209C23628(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_209C23638(uint64_t a1, unint64_t *a2)
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

void *initializeBufferWithCopyOfBuffer for OnboardingBuddyDeviceSceneView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  sub_209C4C718();
  return a1;
}

uint64_t destroy for OnboardingBuddyDeviceSceneView()
{
  return swift_release();
}

void *assignWithCopy for OnboardingBuddyDeviceSceneView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  sub_209C4C718();
  swift_release();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for OnboardingBuddyDeviceSceneView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for OnboardingBuddyDeviceSceneView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for OnboardingBuddyDeviceSceneView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OnboardingBuddyDeviceSceneView()
{
  return &type metadata for OnboardingBuddyDeviceSceneView;
}

uint64_t sub_209C237C4()
{
  return MEMORY[0x263F1BB58];
}

unint64_t sub_209C237D4()
{
  unint64_t result = qword_267600C10;
  if (!qword_267600C10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267600C10);
  }
  return result;
}

void sub_209C23828()
{
  sub_209C20EAC(v0);
}

unint64_t sub_209C23830()
{
  unint64_t result = qword_267600C18;
  if (!qword_267600C18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267600C18);
  }
  return result;
}

uint64_t sub_209C238C8()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600C60);
  __swift_allocate_value_buffer(v0, qword_267602EF8);
  __swift_project_value_buffer(v0, (uint64_t)qword_267602EF8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267600CB0);
  sub_209C4CC18();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_209C791C0;
  sub_209C4CC08();
  return sub_209C4CD28();
}

void sub_209C23A0C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600CC8);
  MEMORY[0x270FA5388](v0 - 8);
  unint64_t v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_209C4C8C8();
  uint64_t v3 = sub_209C4C8D8();
  uint64_t v4 = *(void *)(v3 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v5 = (void *)sub_209C4C8A8();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v2, v3);
    CAMOpenSensitiveURLWithUnlockRequest(v5, 1);
  }
}

uint64_t sub_209C23B30@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600C70);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = &v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600C78);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = &v11[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_209C184B8(&qword_267600C80, &qword_267600C78);
  sub_209C4C848();
  v11[15] = 1;
  sub_209C4C838();
  a1[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_267600C88);
  a1[4] = sub_209C25C34();
  __swift_allocate_boxed_opaque_existential_1(a1);
  sub_209C184B8(&qword_267600CA8, &qword_267600C70);
  sub_209C4C7F8();
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_209C23D74()
{
  uint64_t v1 = *v0;
  sub_209C4C708();
  return v1;
}

uint64_t sub_209C23DA4()
{
  uint64_t v0 = (void *)sub_209C4D208();
  uint64_t v1 = (void *)sub_209C4D208();
  id v2 = CAMLocalizedFrameworkString(v0, v1);

  sub_209C4D218();
  sub_209C17CC0();
  return sub_209C4D038();
}

uint64_t sub_209C23E60()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600C60);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267600C68);
  sub_209C4CC78();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_209C791C0;
  if (qword_267600600 != -1) {
    swift_once();
  }
  uint64_t v4 = __swift_project_value_buffer(v0, (uint64_t)qword_267602EF8);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  sub_209C4CC98();
  sub_209C4C708();
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_209C4C708();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_209C24070()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600C50);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_209C4CBE8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600C58);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_209C4CBF8();
  uint64_t v12 = MEMORY[0x263F1C008];
  MEMORY[0x210509540](v7, v4, MEMORY[0x263F1C008]);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v16 = v4;
  uint64_t v17 = v12;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  MEMORY[0x210509560](v11, v8, OpaqueTypeConformance2);
  uint64_t v16 = v8;
  uint64_t v17 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v14 = sub_209C4CBB8();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v14;
}

uint64_t sub_209C2430C@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return sub_209C4C708();
}

uint64_t sub_209C244E4()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600CD8);
  uint64_t result = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = OBJC_IVAR___CAMViewfinderTipManager_tipObservationTask;
  if (!*(void *)(v0 + OBJC_IVAR___CAMViewfinderTipManager_tipObservationTask))
  {
    swift_unknownObjectWeakAssign();
    swift_unknownObjectWeakAssign();
    uint64_t v7 = sub_209C4D2F8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v5, 1, 1, v7);
    uint64_t v8 = swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_209C4D2C8();
    sub_209C4C718();
    uint64_t v9 = sub_209C4D2B8();
    uint64_t v10 = (void *)swift_allocObject();
    uint64_t v11 = MEMORY[0x263F8F500];
    v10[2] = v9;
    v10[3] = v11;
    v10[4] = v8;
    swift_release();
    *(void *)(v1 + v6) = sub_209C3A47C((uint64_t)v5, (uint64_t)&unk_267600CE8, (uint64_t)v10);
    return swift_release();
  }
  return result;
}

uint64_t sub_209C24680(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[16] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267600CF0);
  v4[17] = swift_task_alloc();
  uint64_t v5 = sub_209C4CD08();
  v4[18] = v5;
  v4[19] = *(void *)(v5 - 8);
  v4[20] = swift_task_alloc();
  v4[21] = __swift_instantiateConcreteTypeFromMangledName(&qword_267600CF8);
  v4[22] = swift_task_alloc();
  v4[23] = __swift_instantiateConcreteTypeFromMangledName(&qword_267600D00);
  v4[24] = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600D08);
  v4[25] = v6;
  v4[26] = *(void *)(v6 - 8);
  v4[27] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600D10);
  v4[28] = v7;
  v4[29] = *(void *)(v7 - 8);
  v4[30] = swift_task_alloc();
  v4[31] = swift_task_alloc();
  v4[32] = sub_209C4D2C8();
  v4[33] = sub_209C4D2B8();
  uint64_t v9 = sub_209C4D298();
  v4[34] = v9;
  v4[35] = v8;
  return MEMORY[0x270FA2498](sub_209C248E0, v9, v8);
}

uint64_t sub_209C248E0()
{
  uint64_t v1 = v0[16] + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x21050C5A0](v1);
  v0[36] = v2;
  if (v2)
  {
    uint64_t v3 = OBJC_IVAR___CAMViewfinderTipManager_stylesTip;
    v0[37] = OBJC_IVAR___CAMViewfinderTipManager_stylesTip;
    uint64_t v4 = (uint64_t *)(v2 + v3);
    uint64_t v6 = *v4;
    uint64_t v5 = v4[1];
    v0[14] = v6;
    uint64_t v7 = v0[26];
    uint64_t v8 = v0[27];
    uint64_t v9 = v0[25];
    v0[15] = v5;
    v0[38] = sub_209C265CC();
    sub_209C4CB08();
    MEMORY[0x210509E50](v9);
    sub_209C184B8(&qword_267600D18, &qword_267600CF8);
    sub_209C4D318();
    sub_209C4D4D8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
    sub_209C4D4E8();
    uint64_t v10 = OBJC_IVAR___CAMViewfinderTipManager_sourceItem;
    v0[39] = OBJC_IVAR___CAMViewfinderTipManager_viewController;
    v0[40] = v10;
    v0[41] = OBJC_IVAR___CAMViewfinderTipManager_isPortraitOrientation;
    uint64_t v11 = sub_209C4D2B8();
    v0[42] = v11;
    if (v11)
    {
      swift_getObjectType();
      uint64_t v12 = sub_209C4D298();
      uint64_t v14 = v13;
    }
    else
    {
      uint64_t v12 = 0;
      uint64_t v14 = 0;
    }
    v0[43] = v12;
    v0[44] = v14;
    return MEMORY[0x270FA2498](sub_209C24B70, v12, v14);
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v15 = (uint64_t (*)(void))v0[1];
    return v15();
  }
}

uint64_t sub_209C24B70()
{
  uint64_t v1 = v0[42];
  v0[45] = sub_209C4D4C8();
  sub_209C184B8(&qword_267600D20, &qword_267600D00);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[46] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_209C24C6C;
  uint64_t v3 = v0[17];
  uint64_t v4 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v3, v1, v4);
}

uint64_t sub_209C24C6C()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 344);
    uint64_t v4 = *(void *)(v2 + 352);
    uint64_t v5 = sub_209C24F90;
  }
  else
  {
    (*(void (**)(void))(v2 + 360))();
    uint64_t v3 = *(void *)(v2 + 344);
    uint64_t v4 = *(void *)(v2 + 352);
    uint64_t v5 = sub_209C24D94;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_209C24D94()
{
  uint64_t v1 = v0[18];
  uint64_t v2 = v0[19];
  uint64_t v3 = v0[17];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_209C1815C(v3, &qword_267600CF0);
    swift_release();
    uint64_t v4 = v0[34];
    uint64_t v5 = v0[35];
    return MEMORY[0x270FA2498](sub_209C253D4, v4, v5);
  }
  else
  {
    uint64_t v7 = v0[30];
    uint64_t v6 = v0[31];
    uint64_t v8 = v0[28];
    uint64_t v9 = v0[29];
    (*(void (**)(void, uint64_t, uint64_t))(v2 + 32))(v0[20], v3, v1);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v7, v6, v8);
    uint64_t v10 = (int *)sub_209C4D4D8();
    v0[47] = v11;
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    uint64_t v15 = (int *)((char *)v10 + *v10);
    uint64_t v12 = (void *)swift_task_alloc();
    v0[48] = v12;
    void *v12 = v0;
    v12[1] = sub_209C24FA8;
    uint64_t v13 = v0[20];
    return ((uint64_t (*)(void *, uint64_t))v15)(v0 + 49, v13);
  }
}

uint64_t sub_209C24F90()
{
  return (*(uint64_t (**)(void))(v0 + 360))();
}

uint64_t sub_209C24FA8()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 160);
  uint64_t v3 = *(void *)(*v0 + 152);
  uint64_t v4 = *(void *)(*v0 + 144);
  swift_task_dealloc();
  swift_release();
  *(unsigned char *)(v1 + 393) = *(unsigned char *)(v1 + 392);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  uint64_t v5 = *(void *)(v1 + 352);
  uint64_t v6 = *(void *)(v1 + 344);
  return MEMORY[0x270FA2498](sub_209C25154, v6, v5);
}

uint64_t sub_209C25154()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 272);
  uint64_t v2 = *(void *)(v0 + 280);
  return MEMORY[0x270FA2498](sub_209C251B8, v1, v2);
}

uint64_t sub_209C251B8()
{
  uint64_t v1 = MEMORY[0x21050C5A0](*(void *)(v0 + 288) + *(void *)(v0 + 312));
  if (v1)
  {
    uint64_t v2 = (void *)v1;
    uint64_t v3 = MEMORY[0x21050C5A0](*(void *)(v0 + 288) + *(void *)(v0 + 320));
    if (v3)
    {
      uint64_t v4 = (void *)v3;
      if ((*(unsigned char *)(v0 + 393) & 1) != 0 && (uint64_t v5 = *(void *)(v0 + 288), *(unsigned char *)(v5 + *(void *)(v0 + 328)) == 1))
      {
        uint64_t v6 = *(void *)(v0 + 304);
        uint64_t v7 = (uint64_t *)(v5 + *(void *)(v0 + 296));
        sub_209C4CB58();
        uint64_t v9 = *v7;
        uint64_t v8 = v7[1];
        *(void *)(v0 + 40) = &type metadata for StylesSetupTip;
        *(void *)(v0 + 48) = v6;
        *(void *)(v0 + 16) = v9;
        *(void *)(v0 + 24) = v8;
        sub_209C4C708();
        id v10 = v4;
        uint64_t v11 = (void *)sub_209C4CB68();
        objc_msgSend(v11, sel_setOverrideUserInterfaceStyle_, objc_msgSend(v2, sel_overrideUserInterfaceStyle));
        uint64_t v12 = (void *)sub_209C4CB48();
        if (v12)
        {
          uint64_t v13 = v12;
          objc_msgSend(v12, sel_setPermittedArrowDirections_, 0);
        }
        objc_msgSend(v2, sel_presentViewController_animated_completion_, v11, 1, 0);
      }
      else
      {
        id v14 = objc_msgSend(v2, sel_presentedViewController);
        if (v14)
        {
          uint64_t v15 = v14;
          sub_209C4CB58();
          uint64_t v16 = swift_dynamicCastClass();

          if (v16) {
            objc_msgSend(v2, sel_dismissViewControllerAnimated_completion_, 1, 0);
          }
        }
      }
    }
  }
  uint64_t v17 = sub_209C4D2B8();
  *(void *)(v0 + 336) = v17;
  if (v17)
  {
    swift_getObjectType();
    uint64_t v18 = sub_209C4D298();
    uint64_t v20 = v19;
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v20 = 0;
  }
  *(void *)(v0 + 344) = v18;
  *(void *)(v0 + 352) = v20;
  return MEMORY[0x270FA2498](sub_209C24B70, v18, v20);
}

uint64_t sub_209C253D4()
{
  uint64_t v1 = (void *)v0[36];
  (*(void (**)(void, void))(v0[29] + 8))(v0[31], v0[28]);

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_209C25538()
{
  uint64_t v1 = OBJC_IVAR___CAMViewfinderTipManager_tipObservationTask;
  if (*(void *)(v0 + OBJC_IVAR___CAMViewfinderTipManager_tipObservationTask))
  {
    sub_209C4C718();
    sub_209C4D308();
    swift_release();
  }
  *(void *)(v0 + v1) = 0;
  swift_release();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectWeakAssign();
}

uint64_t type metadata accessor for ViewfinderTipManager()
{
  return self;
}

void *initializeBufferWithCopyOfBuffer for StylesSetupTip(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  sub_209C4C708();
  return a1;
}

uint64_t destroy for StylesSetupTip()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for StylesSetupTip(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  sub_209C4C708();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for StylesSetupTip(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for StylesSetupTip()
{
  return &type metadata for StylesSetupTip;
}

uint64_t sub_209C25BD0()
{
  return MEMORY[0x263F8D320];
}

unint64_t sub_209C25BE0()
{
  unint64_t result = qword_267600C48;
  if (!qword_267600C48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267600C48);
  }
  return result;
}

unint64_t sub_209C25C34()
{
  unint64_t result = qword_267600C90;
  if (!qword_267600C90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267600C88);
    sub_209C184B8(&qword_267600C98, &qword_267600C78);
    sub_209C25CD4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267600C90);
  }
  return result;
}

unint64_t sub_209C25CD4()
{
  unint64_t result = qword_267600CA0;
  if (!qword_267600CA0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267600C70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267600CA0);
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_209C25DAC(uint64_t a1)
{
  uint64_t v2 = sub_209C4CCF8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v42 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600CC0);
  uint64_t v5 = MEMORY[0x270FA5388](v41);
  char v40 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v39 = (uint64_t *)((char *)&v30 - v8);
  MEMORY[0x270FA5388](v7);
  uint64_t v37 = (uint64_t)&v30 - v9;
  uint64_t v43 = MEMORY[0x263F8EE78];
  sub_209C260BC(0, 0, 0);
  uint64_t v10 = v43;
  uint64_t v11 = *(void *)(a1 + 16);
  sub_209C4C708();
  uint64_t v38 = v11;
  uint64_t v30 = a1;
  if (v11)
  {
    uint64_t v12 = 0;
    id v14 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v13 = v3 + 16;
    uint64_t v15 = *(void *)(v13 + 56);
    unint64_t v33 = (*(unsigned __int8 *)(v13 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 64);
    uint64_t v34 = v14;
    uint64_t v16 = a1 + v33;
    uint64_t v17 = (void (**)(char *, char *, uint64_t))(v13 + 16);
    uint64_t v35 = v13;
    uint64_t v36 = v2;
    uint64_t v18 = v41;
    id v31 = (void (**)(char *, char *, uint64_t))(v13 + 16);
    uint64_t v32 = v15;
    do
    {
      uint64_t v19 = &v40[*(int *)(v18 + 48)];
      v34(v19, v16, v2);
      uint64_t v20 = v39;
      char v21 = (char *)v39 + *(int *)(v18 + 48);
      void *v39 = v12;
      uint64_t v22 = *v17;
      (*v17)(v21, v19, v2);
      uint64_t v23 = (uint64_t)v20;
      uint64_t v24 = v37;
      sub_209C26560(v23, v37);
      sub_209C4CCE8();
      sub_209C1815C(v24, &qword_267600CC0);
      uint64_t v10 = v43;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_209C260BC(0, *(void *)(v10 + 16) + 1, 1);
        uint64_t v10 = v43;
      }
      unint64_t v26 = *(void *)(v10 + 16);
      unint64_t v25 = *(void *)(v10 + 24);
      uint64_t v17 = v31;
      if (v26 >= v25 >> 1)
      {
        sub_209C260BC(v25 > 1, v26 + 1, 1);
        uint64_t v10 = v43;
      }
      ++v12;
      *(void *)(v10 + 16) = v26 + 1;
      uint64_t v27 = v32;
      unint64_t v28 = v10 + v33 + v26 * v32;
      uint64_t v2 = v36;
      v22((char *)v28, v42, v36);
      uint64_t v43 = v10;
      v16 += v27;
    }
    while (v38 != v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

size_t sub_209C260BC(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_209C260DC(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

size_t sub_209C260DC(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267600CB8);
  uint64_t v10 = *(void *)(sub_209C4CCF8() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_209C4CCF8() - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

uint64_t sub_209C262B0()
{
  uint64_t v0 = (void *)sub_209C4D208();
  uint64_t v1 = (void *)sub_209C4D208();
  id v2 = CAMLocalizedFrameworkString(v0, v1);

  sub_209C4D218();
  sub_209C17CC0();
  return sub_209C4D038();
}

uint64_t sub_209C26360()
{
  uint64_t v0 = sub_209C4CCF8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = &v14[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = (void *)sub_209C4D208();
  char v5 = (void *)sub_209C4D208();
  id v6 = CAMLocalizedFrameworkString(v4, v5);

  uint64_t v7 = sub_209C4D218();
  uint64_t v9 = v8;

  uint64_t v15 = v7;
  uint64_t v16 = v9;
  sub_209C17CC0();
  sub_209C4CCD8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267600CB8);
  unint64_t v10 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_209C791C0;
  (*(void (**)(unint64_t, unsigned char *, uint64_t))(v1 + 32))(v11 + v10, v3, v0);
  uint64_t v12 = sub_209C25DAC(v11);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  return v12;
}

uint64_t sub_209C26560(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600CC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_209C265CC()
{
  unint64_t result = qword_267600CD0;
  if (!qword_267600CD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267600CD0);
  }
  return result;
}

uint64_t sub_209C26620()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_209C26658()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_209C26698(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_209C14E64;
  return sub_209C24680(a1, v4, v5, v6);
}

uint64_t sub_209C268E8()
{
  uint64_t v0 = sub_209C4CAD8();
  __swift_allocate_value_buffer(v0, qword_267602F10);
  __swift_project_value_buffer(v0, (uint64_t)qword_267602F10);
  return sub_209C4CAC8();
}

void sub_209C2695C()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  uint64_t v1 = (void *)sub_209C4D208();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  qword_267602F28 = (uint64_t)v2;
}

char *sub_209C269CC()
{
  uint64_t v1 = OBJC_IVAR___CAMSystemOverlayStateMachine_visibility;
  id v2 = objc_allocWithZone((Class)CAMSystemOverlayVisibility);
  uint64_t v3 = v0;
  *(void *)&v0[v1] = objc_msgSend(v2, sel_init);
  swift_unknownObjectWeakInit();
  v3[OBJC_IVAR___CAMSystemOverlayStateMachine_wantsOverlayHint] = 0;
  v3[OBJC_IVAR___CAMSystemOverlayStateMachine_halfPressEnabled] = 1;
  *(void *)&v3[OBJC_IVAR___CAMSystemOverlayStateMachine_stageStack] = MEMORY[0x263F8EE78];
  v3[OBJC_IVAR___CAMSystemOverlayStateMachine__wantsOverlayVisible] = 0;
  *(void *)&v3[OBJC_IVAR___CAMSystemOverlayStateMachine_lastOverlayVisibleTime] = 0;

  v14.receiver = v3;
  v14.super_class = (Class)type metadata accessor for OverlayStateMachine();
  uint64_t v4 = (char *)objc_msgSendSuper2(&v14, sel_init);
  uint64_t v5 = OBJC_IVAR___CAMSystemOverlayStateMachine_visibility;
  uint64_t v6 = *(void **)&v4[OBJC_IVAR___CAMSystemOverlayStateMachine_visibility];
  uint64_t v7 = v4;
  objc_msgSend(v6, sel_setDelegate_, v7);
  if (qword_267600610 != -1) {
    swift_once();
  }
  uint64_t v8 = (void *)qword_267602F28;
  if (!qword_267602F28
    || (uint64_t v9 = (void *)sub_209C4D208(), objc_msgSend(v8, sel_doubleForKey_, v9), v11 = v10, v9, v11 <= 0.0))
  {
    double v11 = 1250.0;
  }
  id v12 = *(id *)&v4[v5];
  objc_msgSend(v12, sel_setDelayedHideDuration_, v11 / 1000.0);

  return v7;
}

void *sub_209C26E6C(void *a1, uint64_t a2)
{
  if (objc_msgSend(a1, sel_isVisible)) {
    *(CFAbsoluteTime *)(v2 + OBJC_IVAR___CAMSystemOverlayStateMachine_lastOverlayVisibleTime) = CFAbsoluteTimeGetCurrent();
  }
  unint64_t result = (void *)MEMORY[0x21050C5A0](v2 + OBJC_IVAR___CAMSystemOverlayStateMachine_delegate);
  if (result)
  {
    objc_msgSend(result, sel_systemOverlayVisibility_changedForReason_, v2, a2);
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_209C26F94(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  uint64_t result = MEMORY[0x21050C5A0](&a1[OBJC_IVAR___CAMSystemOverlayStateMachine_delegate]);
  if (result)
  {
    uint64_t v7 = (void *)result;
    swift_unknownObjectRetain();
    uint64_t v8 = a1;
    objc_msgSend(v7, *a4, v8);
    swift_unknownObjectRelease();

    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_209C27060()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR___CAMSystemOverlayStateMachine__wantsOverlayVisible)) {
    return 1;
  }
  uint64_t v2 = v0 + OBJC_IVAR___CAMSystemOverlayStateMachine_stageStack;
  swift_beginAccess();
  uint64_t v3 = *(void *)(*(void *)v2 + 16);
  if (v3 && *(void *)(*(void *)v2 + 8 * v3 + 24)) {
    return (uint64_t)objc_msgSend(*(id *)(v0 + OBJC_IVAR___CAMSystemOverlayStateMachine_visibility), sel_isVisible);
  }
  else {
    return 0;
  }
}

void sub_209C27154()
{
  uint64_t v1 = v0 + OBJC_IVAR___CAMSystemOverlayStateMachine_stageStack;
  swift_beginAccess();
  while (1)
  {
    uint64_t v2 = *(void *)(*(void *)v1 + 16);
    if (!v2) {
      break;
    }
    uint64_t v3 = *(void *)(*(void *)v1 + 8 * v2 + 24);
    if (!v3) {
      break;
    }
    sub_209C27204(v3, 2);
  }
}

void sub_209C27204(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2;
  uint64_t v7 = sub_209C4CAD8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (uint64_t)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1) {
    return;
  }
  if ((unint64_t)(a2 - 2) >= 2)
  {
LABEL_9:
    if (a2 == 1)
    {
      uint64_t v13 = &v4[OBJC_IVAR___CAMSystemOverlayStateMachine_stageStack];
      swift_beginAccess();
      uint64_t v14 = *(void *)v13;
      uint64_t v15 = *(void *)(*(void *)v13 + 16);
      if (v15)
      {
        if (*(void *)(v14 + 32) == a1) {
          return;
        }
        if (v15 != 1)
        {
          uint64_t v16 = 5;
          while (1)
          {
            uint64_t v17 = v16 - 3;
            if (__OFADD__(v16 - 4, 1)) {
              break;
            }
            if (*(void *)(v14 + 8 * v16) == a1) {
              return;
            }
            ++v16;
            if (v17 == v15) {
              goto LABEL_56;
            }
          }
LABEL_66:
          __break(1u);
          goto LABEL_67;
        }
      }
    }
    else
    {
      if (a2) {
        goto LABEL_69;
      }
      if ((unint64_t)(a1 - 2) < 3)
      {
        uint64_t v18 = (uint64_t *)&v4[OBJC_IVAR___CAMSystemOverlayStateMachine_stageStack];
        swift_beginAccess();
        if ((sub_209C27880(1, *v18) & 1) == 0)
        {
          swift_beginAccess();
          sub_209C2897C(0, 0, 1);
          swift_endAccess();
        }
        goto LABEL_56;
      }
      if (a1 != 1)
      {
LABEL_69:
        sub_209C4D518();
        __break(1u);
        return;
      }
    }
LABEL_56:
    sub_209C27940(a1);
    return;
  }
  uint64_t v3 = &v4[OBJC_IVAR___CAMSystemOverlayStateMachine_stageStack];
  swift_beginAccess();
  double v11 = *(void **)v3;
  unint64_t v12 = *(void *)(*(void *)v3 + 16);
  if (!v12)
  {
    a2 = 0;
    goto LABEL_42;
  }
  if (v11[4] == a1)
  {
    uint64_t v55 = v10;
    uint64_t v56 = v8;
    a2 = 0;
    uint64_t v10 = 1;
  }
  else
  {
    if (v12 == 1)
    {
      a2 = 1;
      goto LABEL_42;
    }
    uint64_t v24 = 5;
    while (1)
    {
      a2 = v24 - 4;
      if (v11[v24] == a1) {
        break;
      }
      uint64_t v25 = v24 - 3;
      if (__OFADD__(a2, 1)) {
        goto LABEL_64;
      }
      ++v24;
      if (v25 == v12)
      {
        a2 = *(void *)(*(void *)v3 + 16);
        goto LABEL_42;
      }
    }
    uint64_t v55 = v10;
    uint64_t v56 = v8;
    uint64_t v10 = v24 - 3;
    if (__OFADD__(a2, 1))
    {
      __break(1u);
      goto LABEL_61;
    }
  }
  if (v10 != v12)
  {
    uint64_t v19 = a2 + 5;
    while ((v10 & 0x8000000000000000) == 0)
    {
      if (v19 - 4 >= v12) {
        goto LABEL_62;
      }
      uint64_t v21 = v11[v19];
      if (v21 != a1)
      {
        if (v19 - 4 != a2)
        {
          if (a2 >= v12) {
            goto LABEL_65;
          }
          uint64_t v8 = v11[a2 + 4];
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          *(void *)uint64_t v3 = v11;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            double v11 = sub_209C28AE0(v11);
            *(void *)uint64_t v3 = v11;
          }
          v11[a2 + 4] = v21;
          *(void *)(*(void *)v3 + 8 * v19) = v8;
          double v11 = *(void **)v3;
        }
        if (__OFADD__(a2++, 1)) {
          goto LABEL_63;
        }
        unint64_t v12 = v11[2];
      }
      uint64_t v20 = v19 - 3;
      ++v19;
      if (v20 == v12) {
        goto LABEL_7;
      }
    }
LABEL_61:
    __break(1u);
LABEL_62:
    __break(1u);
LABEL_63:
    __break(1u);
LABEL_64:
    __break(1u);
LABEL_65:
    __break(1u);
    goto LABEL_66;
  }
LABEL_7:
  uint64_t v10 = v55;
  uint64_t v8 = v56;
  if ((uint64_t)v12 < a2)
  {
    __break(1u);
    goto LABEL_9;
  }
LABEL_42:
  sub_209C28BE0(a2, v12);
  swift_endAccess();
  if (qword_267600608 != -1) {
LABEL_67:
  }
    swift_once();
  uint64_t v26 = __swift_project_value_buffer(v7, (uint64_t)qword_267602F10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v10, v26, v7);
  uint64_t v27 = v4;
  unint64_t v28 = sub_209C4CAB8();
  int v29 = sub_209C4D398();
  if (os_log_type_enabled(v28, (os_log_type_t)v29))
  {
    int v50 = v29;
    os_log_t v52 = v28;
    uint64_t v53 = v7;
    id v54 = v27;
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    uint64_t v49 = swift_slowAlloc();
    v58[0] = v49;
    uint64_t v51 = v30;
    *(_DWORD *)uint64_t v30 = 136446210;
    uint64_t v31 = *(void *)v3;
    int64_t v32 = *(void *)(*(void *)v3 + 16);
    uint64_t v33 = MEMORY[0x263F8EE78];
    if (v32)
    {
      uint64_t v55 = v10;
      uint64_t v56 = v8;
      uint64_t v57 = MEMORY[0x263F8EE78];
      sub_209C4C708();
      sub_209C2815C(0, v32, 0);
      uint64_t v34 = 0;
      uint64_t v33 = v57;
      while (1)
      {
        uint64_t v35 = CAMDebugStringForCaptureButtonStage(*(void *)(v31 + 8 * v34 + 32));
        if (!v35) {
          break;
        }
        uint64_t v36 = v35;
        uint64_t v37 = sub_209C4D218();
        uint64_t v39 = v38;

        uint64_t v57 = v33;
        unint64_t v41 = *(void *)(v33 + 16);
        unint64_t v40 = *(void *)(v33 + 24);
        if (v41 >= v40 >> 1)
        {
          sub_209C2815C(v40 > 1, v41 + 1, 1);
          uint64_t v33 = v57;
        }
        ++v34;
        *(void *)(v33 + 16) = v41 + 1;
        unint64_t v42 = v33 + 16 * v41;
        *(void *)(v42 + 32) = v37;
        *(void *)(v42 + 40) = v39;
        if (v32 == v34)
        {
          swift_bridgeObjectRelease();
          uint64_t v10 = v55;
          uint64_t v8 = v56;
          goto LABEL_52;
        }
      }

      __break(1u);
      goto LABEL_69;
    }
LABEL_52:
    uint64_t v43 = v51;
    uint64_t v57 = v33;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267600DD0);
    sub_209C281D8();
    uint64_t v44 = sub_209C4D1C8();
    unint64_t v46 = v45;
    swift_bridgeObjectRelease();
    uint64_t v57 = sub_209C305B8(v44, v46, v58);
    sub_209C4D3E8();
    uint64_t v27 = v54;

    swift_bridgeObjectRelease();
    os_log_t v47 = v52;
    _os_log_impl(&dword_2099F8000, v52, (os_log_type_t)v50, "ButtonStages: [%{public}s]", v43, 0xCu);
    uint64_t v48 = v49;
    swift_arrayDestroy();
    MEMORY[0x21050C4E0](v48, -1, -1);
    MEMORY[0x21050C4E0](v43, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v10, v53);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v10, v7);
  }
  if (a1 == 2) {
    v27[OBJC_IVAR___CAMSystemOverlayStateMachine__wantsOverlayVisible] = 0;
  }
}

uint64_t sub_209C27880(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  if (*(void *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 5; ; ++i)
  {
    uint64_t v4 = i - 3;
    if (__OFADD__(i - 4, 1)) {
      break;
    }
    BOOL v6 = *(void *)(a2 + 8 * i) == result;
    BOOL v5 = v6;
    BOOL v6 = v6 || v4 == v2;
    if (v6) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

void sub_209C27940(uint64_t a1)
{
  uint64_t v3 = sub_209C4CAD8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  BOOL v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = &v1[OBJC_IVAR___CAMSystemOverlayStateMachine_stageStack];
  swift_beginAccess();
  uint64_t v8 = *(void **)v7;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)uint64_t v7 = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v8 = sub_209C2800C(0, v8[2] + 1, 1, v8);
    *(void *)uint64_t v7 = v8;
  }
  unint64_t v11 = v8[2];
  unint64_t v10 = v8[3];
  if (v11 >= v10 >> 1)
  {
    uint64_t v8 = sub_209C2800C((void *)(v10 > 1), v11 + 1, 1, v8);
    *(void *)uint64_t v7 = v8;
  }
  v8[2] = v11 + 1;
  v8[v11 + 4] = a1;
  swift_endAccess();
  if (qword_267600608 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v3, (uint64_t)qword_267602F10);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v12, v3);
  uint64_t v13 = v1;
  uint64_t v14 = sub_209C4CAB8();
  int v15 = sub_209C4D398();
  if (!os_log_type_enabled(v14, (os_log_type_t)v15))
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    if (a1 == 4)
    {
LABEL_20:
      uint64_t v34 = *(void **)&v13[OBJC_IVAR___CAMSystemOverlayStateMachine_visibility];
      if (objc_msgSend(v34, sel_isVisible)
        && CFAbsoluteTimeGetCurrent() - *(double *)&v13[OBJC_IVAR___CAMSystemOverlayStateMachine_lastOverlayVisibleTime] < 0.3)
      {
        v13[OBJC_IVAR___CAMSystemOverlayStateMachine__wantsOverlayVisible] = 0;
        objc_msgSend(v34, sel_hideImmediately);
        uint64_t v35 = (void *)MEMORY[0x21050C5A0](&v13[OBJC_IVAR___CAMSystemOverlayStateMachine_delegate]);
        if (v35)
        {
          objc_msgSend(v35, sel_systemOverlayVisibility_changedForReason_, v13, 0);
          swift_unknownObjectRelease();
        }
      }
      return;
    }
LABEL_16:
    if (a1 == 2 && v13[OBJC_IVAR___CAMSystemOverlayStateMachine_halfPressEnabled] == 1) {
      v13[OBJC_IVAR___CAMSystemOverlayStateMachine__wantsOverlayVisible] = 1;
    }
    return;
  }
  int v40 = v15;
  unint64_t v42 = v6;
  uint64_t v43 = v4;
  uint64_t v16 = (uint8_t *)swift_slowAlloc();
  uint64_t v39 = swift_slowAlloc();
  v45[0] = v39;
  unint64_t v41 = v16;
  *(_DWORD *)uint64_t v16 = 136446210;
  uint64_t v17 = *(void **)v7;
  int64_t v18 = *(void *)(*(void *)v7 + 16);
  uint64_t v19 = MEMORY[0x263F8EE78];
  if (!v18)
  {
LABEL_19:
    int v29 = v41;
    uint64_t v44 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267600DD0);
    sub_209C281D8();
    uint64_t v30 = sub_209C4D1C8();
    unint64_t v32 = v31;
    swift_bridgeObjectRelease();
    uint64_t v44 = sub_209C305B8(v30, v32, v45);
    sub_209C4D3E8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2099F8000, v14, (os_log_type_t)v40, "ButtonStages: [%{public}s]", v29, 0xCu);
    uint64_t v33 = v39;
    swift_arrayDestroy();
    MEMORY[0x21050C4E0](v33, -1, -1);
    MEMORY[0x21050C4E0](v29, -1, -1);

    (*(void (**)(char *, uint64_t))(v43 + 8))(v42, v3);
    if (a1 == 4) {
      goto LABEL_20;
    }
    goto LABEL_16;
  }
  uint64_t v37 = a1;
  uint64_t v38 = v13;
  uint64_t v36 = v3;
  uint64_t v44 = MEMORY[0x263F8EE78];
  sub_209C4C708();
  sub_209C2815C(0, v18, 0);
  uint64_t v20 = 0;
  uint64_t v19 = v44;
  while (1)
  {
    uint64_t v21 = CAMDebugStringForCaptureButtonStage(v17[v20 + 4]);
    if (!v21) {
      break;
    }
    uint64_t v22 = v21;
    uint64_t v23 = sub_209C4D218();
    uint64_t v25 = v24;

    uint64_t v44 = v19;
    unint64_t v27 = *(void *)(v19 + 16);
    unint64_t v26 = *(void *)(v19 + 24);
    if (v27 >= v26 >> 1)
    {
      sub_209C2815C(v26 > 1, v27 + 1, 1);
      uint64_t v19 = v44;
    }
    ++v20;
    *(void *)(v19 + 16) = v27 + 1;
    unint64_t v28 = v19 + 16 * v27;
    *(void *)(v28 + 32) = v23;
    *(void *)(v28 + 40) = v25;
    if (v18 == v20)
    {
      swift_bridgeObjectRelease();
      uint64_t v3 = v36;
      a1 = v37;
      uint64_t v13 = v38;
      goto LABEL_19;
    }
  }

  __break(1u);
}

id sub_209C27E48()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for OverlayStateMachine();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for OverlayStateMachine()
{
  return self;
}

void *sub_209C27EFC(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_267600BD8);
      unint64_t v10 = (void *)swift_allocObject();
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
      unint64_t v10 = (void *)MEMORY[0x263F8EE78];
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
    sub_209C28AF4(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_209C2800C(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_267600DE8);
      unint64_t v10 = (void *)swift_allocObject();
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
      unint64_t v10 = (void *)MEMORY[0x263F8EE78];
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
    sub_209C28AF4(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_209C2811C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_209C282A4(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_209C2813C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_209C28404(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_209C2815C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_209C28574(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

__CFString *CAMDebugStringForCaptureButtonStage(unint64_t a1)
{
  if (a1 > 4)
  {
    uint64_t v1 = 0;
  }
  else
  {
    uint64_t v1 = off_263FA74D0[a1];
    objc_super v2 = off_263FA74A8[a1];
  }
  return v1;
}

unint64_t sub_209C281D8()
{
  unint64_t result = qword_267600DD8;
  if (!qword_267600DD8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267600DD0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267600DD8);
  }
  return result;
}

uint64_t sub_209C28234(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_209C286E0(a1, a2, a3, *v3, (uint64_t *)&unk_26AAFE980);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_209C2825C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_209C286E0(a1, a2, a3, *v3, &qword_26AAFE978);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_209C28284(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_209C2882C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_209C282A4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267600BD8);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_209C4D558();
  __break(1u);
  return result;
}

uint64_t sub_209C28404(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267600DF0);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_209C4D558();
  __break(1u);
  return result;
}

uint64_t sub_209C28574(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267600DE0);
    unint64_t v10 = (char *)swift_allocObject();
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
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_209C4D558();
  __break(1u);
  return result;
}

uint64_t sub_209C286E0(char a1, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  if (a3)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v8 = a2;
      }
    }
  }
  else
  {
    int64_t v8 = a2;
  }
  int64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    int64_t v10 = *((void *)a4 + 2);
  }
  else {
    int64_t v10 = v8;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    int64_t v11 = (char *)swift_allocObject();
    size_t v12 = _swift_stdlib_malloc_size(v11);
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    int64_t v11 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v11 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v11 != a4 || v13 >= &v14[v9]) {
      memmove(v13, v14, v9);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v9] || v13 >= &v14[v9])
  {
    memcpy(v13, v14, v9);
LABEL_28:
    swift_release();
    return (uint64_t)v11;
  }
LABEL_30:
  uint64_t result = sub_209C4D558();
  __break(1u);
  return result;
}

uint64_t sub_209C2882C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE970);
    int64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  size_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
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
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_209C4D558();
  __break(1u);
  return result;
}

void *sub_209C2897C(uint64_t a1, int64_t a2, uint64_t a3)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  char v5 = *(void **)v3;
  int64_t v6 = *(void *)(*(void *)v3 + 16);
  if (v6 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v8 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v9 = 1 - v8;
  if (__OFSUB__(1, v8))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  int64_t v10 = v6 + v9;
  if (__OFADD__(v6, v9))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t result = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!result || v10 > v5[3] >> 1)
  {
    if (v6 <= v10) {
      int64_t v13 = v6 + v9;
    }
    else {
      int64_t v13 = v6;
    }
    uint64_t result = sub_209C2800C(result, v13, 1, v5);
    char v5 = result;
  }
  uint64_t v14 = &v5[a1 + 4];
  if (!v9) {
    goto LABEL_20;
  }
  uint64_t v15 = v5[2];
  BOOL v16 = __OFSUB__(v15, a2);
  uint64_t v17 = v15 - a2;
  if (v16) {
    goto LABEL_26;
  }
  if ((v17 & 0x8000000000000000) == 0)
  {
    uint64_t result = v14 + 1;
    int64_t v18 = &v5[a2 + 4];
    if (v14 + 1 != v18 || result >= &v18[v17]) {
      uint64_t result = memmove(result, v18, 8 * v17);
    }
    uint64_t v19 = v5[2];
    BOOL v16 = __OFADD__(v19, v9);
    uint64_t v20 = v19 + v9;
    if (!v16)
    {
      v5[2] = v20;
LABEL_20:
      *uint64_t v14 = a3;
      *(void *)uint64_t v3 = v5;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  uint64_t result = (void *)sub_209C4D558();
  __break(1u);
  return result;
}

void *sub_209C28AE0(void *a1)
{
  return sub_209C2800C(0, a1[2], 0, a1);
}

char *sub_209C28AF4(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
  uint64_t result = (char *)sub_209C4D558();
  __break(1u);
  return result;
}

char *sub_209C28BE0(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v4 = *v2;
  int64_t v5 = *((void *)*v2 + 2);
  if (v5 < a2)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (result && v9 <= *((void *)v4 + 3) >> 1)
  {
    if (!v8) {
      goto LABEL_21;
    }
  }
  else
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    uint64_t result = (char *)sub_209C2800C(result, v11, 1, v4);
    uint64_t v4 = result;
    if (!v8) {
      goto LABEL_21;
    }
  }
  uint64_t v12 = *((void *)v4 + 2);
  BOOL v13 = __OFSUB__(v12, a2);
  uint64_t v14 = v12 - a2;
  if (v13) {
    goto LABEL_27;
  }
  if ((v14 & 0x8000000000000000) == 0)
  {
    uint64_t result = &v4[8 * a1 + 32];
    uint64_t v15 = &v4[8 * a2 + 32];
    if (a1 != a2 || result >= &v15[8 * v14]) {
      uint64_t result = (char *)memmove(result, v15, 8 * v14);
    }
    uint64_t v16 = *((void *)v4 + 2);
    BOOL v13 = __OFADD__(v16, v8);
    uint64_t v17 = v16 + v8;
    if (!v13)
    {
      *((void *)v4 + 2) = v17;
LABEL_21:
      *objc_super v2 = v4;
      return result;
    }
    goto LABEL_28;
  }
LABEL_29:
  uint64_t result = (char *)sub_209C4D558();
  __break(1u);
  return result;
}

uint64_t LaunchAppIntent.perform()(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_209C4D2C8();
  *(void *)(v1 + 24) = sub_209C4D2B8();
  uint64_t v3 = sub_209C4D298();
  return MEMORY[0x270FA2498](sub_209C28DD4, v3, v2);
}

uint64_t sub_209C28DD4()
{
  swift_release();
  sub_209C29268();
  uint64_t v2 = v1;
  if (objc_msgSend(v1, sel_isInCameraRollView)) {
    objc_msgSend(v2, sel_navigateToViewfinderView);
  }
  sub_209C4C558();

  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

NSObject *sub_209C28E8C()
{
  uint64_t v0 = sub_209C4CAD8();
  __swift_allocate_value_buffer(v0, qword_267602F30);
  __swift_project_value_buffer(v0, (uint64_t)qword_267602F30);
  uint64_t result = os_log_create("com.apple.camera", "Camera");
  if (result) {
    return sub_209C4CAE8();
  }
  __break(1u);
  return result;
}

void sub_209C28F04()
{
  id v0 = objc_msgSend(self, sel_sharedApplication);
  id v1 = objc_msgSend(v0, sel_connectedScenes);

  sub_209C33FC4();
  sub_209C34004();
  uint64_t v2 = sub_209C4D338();

  if ((v2 & 0xC000000000000001) != 0)
  {
    sub_209C4D438();
    sub_209C4D358();
    uint64_t v2 = v25;
    uint64_t v23 = v26;
    uint64_t v3 = v27;
    uint64_t v4 = v28;
    unint64_t v5 = v29;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = -1 << *(unsigned char *)(v2 + 32);
    uint64_t v23 = v2 + 56;
    uint64_t v3 = ~v6;
    uint64_t v7 = -v6;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v5 = v8 & *(void *)(v2 + 56);
  }
  int64_t v9 = (unint64_t)(v3 + 64) >> 6;
  if (v2 < 0) {
    goto LABEL_10;
  }
LABEL_8:
  if (v5)
  {
    uint64_t v10 = (v5 - 1) & v5;
    unint64_t v11 = __clz(__rbit64(v5)) | (v4 << 6);
    uint64_t v12 = v4;
    goto LABEL_27;
  }
  int64_t v14 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
    return;
  }
  if (v14 >= v9) {
    goto LABEL_35;
  }
  unint64_t v15 = *(void *)(v23 + 8 * v14);
  uint64_t v12 = v4 + 1;
  if (!v15)
  {
    uint64_t v12 = v4 + 2;
    if (v4 + 2 >= v9) {
      goto LABEL_35;
    }
    unint64_t v15 = *(void *)(v23 + 8 * v12);
    if (!v15)
    {
      uint64_t v12 = v4 + 3;
      if (v4 + 3 >= v9) {
        goto LABEL_35;
      }
      unint64_t v15 = *(void *)(v23 + 8 * v12);
      if (!v15)
      {
        uint64_t v12 = v4 + 4;
        if (v4 + 4 < v9)
        {
          unint64_t v15 = *(void *)(v23 + 8 * v12);
          if (!v15)
          {
            uint64_t v16 = v4 + 5;
            while (v9 != v16)
            {
              unint64_t v15 = *(void *)(v23 + 8 * v16++);
              if (v15)
              {
                uint64_t v12 = v16 - 1;
                goto LABEL_26;
              }
            }
            goto LABEL_35;
          }
          goto LABEL_26;
        }
LABEL_35:
        sub_209C3405C();
        return;
      }
    }
  }
LABEL_26:
  uint64_t v10 = (v15 - 1) & v15;
  unint64_t v11 = __clz(__rbit64(v15)) + (v12 << 6);
LABEL_27:
  id v13 = *(id *)(*(void *)(v2 + 48) + 8 * v11);
  if (!v13) {
    goto LABEL_35;
  }
  while (1)
  {
    self;
    uint64_t v17 = swift_dynamicCastObjCClass();
    if (v17) {
      break;
    }

    uint64_t v4 = v12;
    unint64_t v5 = v10;
    if ((v2 & 0x8000000000000000) == 0) {
      goto LABEL_8;
    }
LABEL_10:
    if (sub_209C4D448())
    {
      swift_unknownObjectRetain();
      swift_dynamicCast();
      id v13 = v24;
      swift_unknownObjectRelease();
      uint64_t v12 = v4;
      uint64_t v10 = v5;
      if (v24) {
        continue;
      }
    }
    goto LABEL_35;
  }
  int64_t v18 = (void *)v17;
  id v19 = v13;
  id v20 = objc_msgSend(v18, sel_keyWindow);
  if (v20)
  {
    uint64_t v21 = v20;
    id v22 = objc_msgSend(v20, sel_rootViewController);

    sub_209C3405C();
    if (v22)
    {
      self;
      if (!swift_dynamicCastObjCClass()) {
    }
      }
  }
  else
  {
    sub_209C3405C();
  }
}

void sub_209C29268()
{
  sub_209C28F04();
  if (!v0)
  {
    if (qword_267600618 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_209C4CAD8();
    __swift_project_value_buffer(v1, (uint64_t)qword_267602F30);
    uint64_t v2 = sub_209C4CAB8();
    os_log_type_t v3 = sub_209C4D378();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_2099F8000, v2, v3, "Failed to get CAMViewfinderViewController", v4, 2u);
      MEMORY[0x21050C4E0](v4, -1, -1);
    }

    sub_209C31110();
    swift_allocError();
    *unint64_t v5 = 0;
    swift_willThrow();
  }
}

id CaptureMode.isAvailable.getter(char a1)
{
  id result = objc_msgSend(self, sel_capabilities);
  if (result)
  {
    os_log_type_t v3 = result;
    uint64_t v4 = sub_209C293F4(a1);
    id v6 = objc_msgSend(v3, sel_isSupportedMode_withDevice_, v5, v4);

    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_209C293F4(char a1)
{
  return qword_209C7DF70[a1];
}

id CaptureMode.supportsTimer.getter(char a1)
{
  id result = objc_msgSend(self, sel_capabilities);
  if (result)
  {
    os_log_type_t v3 = result;
    sub_209C293F4(a1);
    id v5 = objc_msgSend(v3, sel_isTimerSupportedForMode_, v4);

    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_209C29488(char a1, char a2)
{
  uint64_t v2 = a1 & 1;
  if (a2 == 3 || a2 == 0)
  {
    if ((a1 & 1) == 0)
    {
      int v4 = sub_209C4D588();
      swift_bridgeObjectRelease();
      return v4 & 1;
    }
    swift_bridgeObjectRelease();
    return 1;
  }
  uint64_t result = (uint64_t)objc_msgSend(self, sel_capabilities);
  if (result)
  {
    uint64_t v8 = (void *)result;
    sub_209C293F4(a2);
    id v5 = objc_msgSend(v8, sel_isSupportedMode_withDevice_, v9, v2);

    return (uint64_t)v5;
  }
  __break(1u);
  return result;
}

unint64_t sub_209C29568()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE948);
  MEMORY[0x270FA5388](v0 - 8);
  char v103 = (char *)&v89 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE860);
  MEMORY[0x270FA5388](v2 - 8);
  int v4 = (char *)&v89 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_209C4C8F8();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v89 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_209C4C878();
  uint64_t v116 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v89 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_209C4D1F8();
  MEMORY[0x270FA5388](v11 - 8);
  id v13 = (char *)&v89 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_209C4C888();
  uint64_t v114 = *(void *)(v14 - 8);
  uint64_t v115 = v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v89 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFEBE8);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE960);
  unint64_t v18 = (*(unsigned __int8 *)(*(void *)(v17 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v17 - 8) + 80);
  uint64_t v111 = *(void *)(*(void *)(v17 - 8) + 72);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_209C7CAC0;
  uint64_t v96 = v19;
  uint64_t v106 = v17;
  unint64_t v20 = v19 + v18;
  *(unsigned char *)(v19 + v18) = 4;
  uint64_t v21 = v13;
  uint64_t v95 = 0xD00000000000001ELL;
  sub_209C4D1E8();
  if (qword_26AAFE848 != -1) {
    swift_once();
  }
  unint64_t v110 = v20;
  uint64_t v107 = v8;
  uint64_t v22 = __swift_project_value_buffer(v8, (uint64_t)qword_26AB01638);
  uint64_t v108 = *(void (**)(char *))(v116 + 16);
  v116 += 16;
  uint64_t v23 = v10;
  uint64_t v24 = v22;
  v108(v10);
  sub_209C4C8E8();
  sub_209C4C898();
  uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v114 + 56);
  v114 += 56;
  char v105 = v25;
  uint64_t v26 = v4;
  v25(v4, 1, 1, v115);
  uint64_t v27 = v103;
  sub_209C4C698();
  uint64_t v28 = sub_209C4C6A8();
  uint64_t v29 = *(void *)(v28 - 8);
  unint64_t v113 = *(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56);
  uint64_t v109 = v29 + 56;
  uint64_t v104 = v28;
  v113(v27, 0, 1, v28);
  sub_209C4C6C8();
  unint64_t v30 = v110;
  uint64_t v94 = v110 + v111 + *(int *)(v106 + 48);
  *(unsigned char *)(v110 + v111) = 0;
  uint64_t v98 = 0xD00000000000001FLL;
  sub_209C4D1E8();
  uint64_t v31 = v24;
  uint64_t v32 = v24;
  uint64_t v33 = v107;
  ((void (*)(char *, uint64_t, uint64_t))v108)(v23, v32, v107);
  sub_209C4C8E8();
  sub_209C4C898();
  v105(v26, 1, 1, v115);
  sub_209C4C698();
  uint64_t v34 = v28;
  uint64_t v35 = v113;
  v113(v27, 0, 1, v34);
  sub_209C4C6C8();
  uint64_t v94 = 2 * v111;
  uint64_t v36 = (unsigned char *)(v30 + 2 * v111);
  uint64_t v37 = v23;
  uint64_t v38 = v106;
  uint64_t v93 = (uint64_t)&v36[*(int *)(v106 + 48)];
  unsigned char *v36 = 1;
  sub_209C4D1E8();
  uint64_t v100 = v37;
  ((void (*)(char *, uint64_t, uint64_t))v108)(v37, v31, v33);
  long long v112 = v7;
  sub_209C4C8E8();
  sub_209C4C898();
  uint64_t v39 = v105;
  v105(v26, 1, 1, v115);
  sub_209C4C698();
  v35(v27, 0, 1, v104);
  int v40 = v26;
  sub_209C4C6C8();
  unint64_t v41 = (unsigned char *)(v110 + v94 + v111);
  uint64_t v95 = (uint64_t)&v41[*(int *)(v38 + 48)];
  unsigned char *v41 = 2;
  sub_209C4D1E8();
  unint64_t v42 = v100;
  uint64_t v102 = v31;
  uint64_t v43 = (void (*)(char *, uint64_t, uint64_t))v108;
  ((void (*)(char *, uint64_t, uint64_t))v108)(v100, v31, v107);
  sub_209C4C8E8();
  uint64_t v44 = v16;
  unint64_t v45 = v21;
  unint64_t v46 = v42;
  sub_209C4C898();
  uint64_t v101 = v40;
  v39(v40, 1, 1, v115);
  os_log_t v47 = v103;
  sub_209C4C698();
  uint64_t v48 = v104;
  v113(v47, 0, 1, v104);
  sub_209C4C6C8();
  uint64_t v49 = v111;
  uint64_t v95 = 4 * v111;
  int v50 = (unsigned char *)(v110 + 4 * v111);
  uint64_t v51 = v106;
  uint64_t v94 = (uint64_t)&v50[*(int *)(v106 + 48)];
  unsigned char *v50 = 3;
  id v99 = v45;
  sub_209C4D1E8();
  v43(v46, v31, v107);
  sub_209C4C8E8();
  os_log_t v52 = v44;
  sub_209C4C898();
  uint64_t v53 = v101;
  uint64_t v54 = v115;
  uint64_t v55 = v105;
  v105(v101, 1, 1, v115);
  uint64_t v56 = v103;
  sub_209C4C698();
  v113(v56, 0, 1, v48);
  uint64_t v57 = v52;
  sub_209C4C6C8();
  char v58 = (unsigned char *)(v110 + v95 + v49);
  uint64_t v95 = (uint64_t)&v58[*(int *)(v51 + 48)];
  unsigned char *v58 = 5;
  sub_209C4D1E8();
  uint64_t v59 = v100;
  uint64_t v60 = v102;
  uint64_t v61 = v107;
  ((void (*)(char *, uint64_t, uint64_t))v108)(v100, v102, v107);
  sub_209C4C8E8();
  BOOL v62 = v59;
  sub_209C4C898();
  v55(v53, 1, 1, v54);
  sub_209C4C698();
  uint64_t v63 = v104;
  v113(v56, 0, 1, v104);
  uint64_t v97 = v57;
  sub_209C4C6C8();
  char v64 = (unsigned char *)(v110 + 6 * v111);
  id v90 = &v64[*(int *)(v106 + 48)];
  *char v64 = 6;
  sub_209C4D1E8();
  ((void (*)(char *, uint64_t, uint64_t))v108)(v59, v60, v61);
  sub_209C4C8E8();
  sub_209C4C898();
  uint64_t v65 = v114;
  v105(v53, 1, 1, v115);
  sub_209C4C698();
  v113(v56, 0, 1, v63);
  uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AAFEBF0);
  uint64_t v66 = *(unsigned __int8 *)(v65 + 24);
  uint64_t v94 = ((v66 + 32) & ~v66) + *(void *)(v65 + 16);
  uint64_t v92 = (v66 + 32) & ~v66;
  uint64_t v93 = v66 | 7;
  uint64_t v67 = swift_allocObject();
  long long v91 = xmmword_209C791C0;
  *(_OWORD *)(v67 + 16) = xmmword_209C791C0;
  sub_209C4D1E8();
  uint64_t v69 = v107;
  unint64_t v68 = v108;
  ((void (*)(char *, uint64_t, uint64_t))v108)(v62, v102, v107);
  sub_209C4C8E8();
  sub_209C4C898();
  char v70 = v101;
  char v71 = v103;
  sub_209C4C6B8();
  unint64_t v72 = v110;
  uint64_t v98 = 8 * v111;
  char v73 = (unsigned char *)(v110 + 7 * v111);
  uint64_t v74 = v106;
  id v90 = &v73[*(int *)(v106 + 48)];
  *char v73 = 7;
  sub_209C4D1E8();
  uint64_t v75 = v69;
  uint64_t v76 = (void (*)(char *, uint64_t, uint64_t))v68;
  ((void (*)(char *, uint64_t, uint64_t))v68)(v62, v102, v75);
  sub_209C4C8E8();
  sub_209C4C898();
  uint64_t v77 = v105;
  v105(v70, 1, 1, v115);
  sub_209C4C698();
  v113(v71, 0, 1, v104);
  sub_209C4C6C8();
  id v90 = (unsigned char *)(v72 + v98 + *(int *)(v74 + 48));
  *(unsigned char *)(v72 + v98) = 8;
  sub_209C4D1E8();
  id v78 = v100;
  uint64_t v79 = v102;
  v76(v100, v102, v107);
  sub_209C4C8E8();
  sub_209C4C898();
  v77(v101, 1, 1, v115);
  sub_209C4C698();
  v113(v71, 0, 1, v104);
  *(_OWORD *)(swift_allocObject() + 16) = v91;
  sub_209C4D1E8();
  uint64_t v80 = v79;
  uint64_t v81 = v79;
  uint64_t v83 = v107;
  uint64_t v82 = (void (*)(char *, uint64_t, uint64_t))v108;
  ((void (*)(char *, uint64_t, uint64_t))v108)(v78, v80, v107);
  sub_209C4C8E8();
  sub_209C4C898();
  id v84 = v101;
  sub_209C4C6B8();
  *(unsigned char *)(v110 + v98 + v111) = 9;
  uint64_t v98 = 0xD000000000000026;
  sub_209C4D1E8();
  v82(v78, v81, v83);
  sub_209C4C8E8();
  uint64_t v95 = 0x8000000209C963B0;
  sub_209C4C898();
  uint64_t v85 = v105;
  v105(v84, 1, 1, v115);
  char v86 = v103;
  sub_209C4C698();
  uint64_t v87 = v104;
  v113(v86, 0, 1, v104);
  sub_209C4C6C8();
  *(unsigned char *)(v110 + 10 * v111) = 10;
  sub_209C4D1E8();
  ((void (*)(char *, uint64_t, uint64_t))v108)(v78, v102, v107);
  sub_209C4C8E8();
  sub_209C4C898();
  v85(v84, 1, 1, v115);
  sub_209C4C698();
  v113(v86, 0, 1, v87);
  sub_209C4C6C8();
  unint64_t result = sub_209C1C2CC(v96);
  static CaptureMode.caseDisplayRepresentations = result;
  return result;
}

uint64_t *CaptureMode.caseDisplayRepresentations.unsafeMutableAddressor()
{
  if (qword_26AAFE830 != -1) {
    swift_once();
  }
  return &static CaptureMode.caseDisplayRepresentations;
}

uint64_t static CaptureMode.caseDisplayRepresentations.getter()
{
  return sub_209C2B8B0(&qword_26AAFE830);
}

uint64_t static CaptureMode.caseDisplayRepresentations.setter(uint64_t a1)
{
  return sub_209C2B930(a1, &qword_26AAFE830, &static CaptureMode.caseDisplayRepresentations);
}

uint64_t (*static CaptureMode.caseDisplayRepresentations.modify())()
{
  if (qword_26AAFE830 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_209C2A954(char a1)
{
  uint64_t result = 0x6569666C6573;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6F65646976;
      break;
    case 2:
    case 3:
      uint64_t result = 0x7469617274726F70;
      break;
    case 4:
      uint64_t result = 0x6F746F6870;
      break;
    case 5:
      uint64_t result = 0x6974616D656E6963;
      break;
    case 6:
      uint64_t result = 0x6F6D2D6F6C73;
      break;
    case 7:
      uint64_t result = 0x70616C2D656D6974;
      break;
    case 8:
      uint64_t result = 1869504880;
      break;
    case 9:
      uint64_t result = 0x566C616974617073;
      break;
    case 10:
      uint64_t result = 0x506C616974617073;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t CaptureMode.rawValue.getter(char a1)
{
  uint64_t result = 0x6569666C6573;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6F65646976;
      break;
    case 2:
    case 3:
      uint64_t result = 0x7469617274726F70;
      break;
    case 4:
      uint64_t result = 0x6F746F6870;
      break;
    case 5:
      uint64_t result = 0x6974616D656E6963;
      break;
    case 6:
      uint64_t result = 0x6F6D2D6F6C73;
      break;
    case 7:
      uint64_t result = 0x70616C2D656D6974;
      break;
    case 8:
      uint64_t result = 1869504880;
      break;
    case 9:
      uint64_t result = 0x566C616974617073;
      break;
    case 10:
      uint64_t result = 0x506C616974617073;
      break;
    default:
      return result;
  }
  return result;
}

void *static CaptureMode.allCases.getter()
{
  return &unk_26BD77560;
}

uint64_t sub_209C2AC00(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_209C2AC20, 0, 0);
}

uint64_t sub_209C2AC20()
{
  uint64_t v1 = *(void **)(v0 + 16);
  sub_209C30C10((uint64_t)&unk_26BD77560);
  void *v1 = v2;
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_209C2AC9C(unsigned char *a1)
{
  *a1 = 4;
  return sub_209C33EB8(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_209C2ACE0(char *a1, char *a2)
{
  char v2 = *a2;
  uint64_t v3 = CaptureMode.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == CaptureMode.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_209C4D588();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_209C2AD6C()
{
  char v1 = *v0;
  sub_209C4D608();
  CaptureMode.rawValue.getter(v1);
  sub_209C4D238();
  swift_bridgeObjectRelease();
  return sub_209C4D628();
}

uint64_t sub_209C2ADD0()
{
  CaptureMode.rawValue.getter(*v0);
  sub_209C4D238();
  return swift_bridgeObjectRelease();
}

uint64_t sub_209C2AE24()
{
  char v1 = *v0;
  sub_209C4D608();
  CaptureMode.rawValue.getter(v1);
  sub_209C4D238();
  swift_bridgeObjectRelease();
  return sub_209C4D628();
}

uint64_t sub_209C2AE84@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s8CameraUI11CaptureModeO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_209C2AEB4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CaptureMode.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_209C2AEE0(uint64_t a1)
{
  unint64_t v2 = sub_209C33E64();
  return MEMORY[0x270EE1690](a1, v2);
}

uint64_t sub_209C2AF2C(uint64_t a1)
{
  unint64_t v2 = sub_209C13EFC();
  return MEMORY[0x270EE0C40](a1, v2);
}

uint64_t sub_209C2AF78(uint64_t a1, uint64_t a2)
{
  return sub_209C2C27C(a1, a2, &qword_26AAFE830);
}

uint64_t sub_209C2AF9C(uint64_t a1)
{
  unint64_t v2 = sub_209C31C6C();
  return MEMORY[0x270EE1C28](a1, v2);
}

void sub_209C2AFE8(void *a1@<X8>)
{
  *a1 = &unk_26BD77560;
}

Swift::Bool __swiftcall TimerDuration.isAvailableFor(mode:)(CameraUI::CaptureMode mode)
{
  if (v1)
  {
    id v3 = objc_msgSend(self, sel_capabilities);
    if (!v3)
    {
      __break(1u);
      return (char)v3;
    }
    uint64_t v4 = v3;
    sub_209C293F4(mode);
    unsigned __int8 v6 = objc_msgSend(v4, sel_isTimerSupportedForMode_, v5);
  }
  else
  {
    unsigned __int8 v6 = 1;
  }
  LOBYTE(v3) = v6;
  return (char)v3;
}

unint64_t sub_209C2B07C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE948);
  MEMORY[0x270FA5388](v0 - 8);
  unint64_t v2 = (char *)&v31 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE860);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v34 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_209C4C8F8();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_209C4C878();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_209C4D1F8();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v11 = sub_209C4C888();
  uint64_t v46 = *(void *)(v11 - 8);
  uint64_t v47 = v11;
  MEMORY[0x270FA5388](v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267600FF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600C00);
  unint64_t v13 = (*(unsigned __int8 *)(*(void *)(v12 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v12 - 8) + 80);
  uint64_t v44 = *(void *)(*(void *)(v12 - 8) + 72);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_209C7CAD0;
  uint64_t v33 = v14;
  uint64_t v15 = (unsigned char *)(v14 + v13);
  unint64_t v45 = (unsigned char *)v12;
  uint64_t v16 = *(int *)(v12 + 48);
  *uint64_t v15 = 0;
  sub_209C4D1E8();
  if (qword_26AAFE848 != -1) {
    swift_once();
  }
  uint64_t v32 = (uint64_t)&v15[v16];
  uint64_t v17 = __swift_project_value_buffer(v6, (uint64_t)qword_26AB01638);
  uint64_t v35 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v36 = v17;
  uint64_t v37 = v7 + 16;
  v35(v9, v17, v6);
  unint64_t v42 = v15;
  sub_209C4C8E8();
  sub_209C4C898();
  unint64_t v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v46 + 56);
  v46 += 56;
  uint64_t v43 = v18;
  uint64_t v41 = v6;
  uint64_t v19 = v34;
  v18(v34, 1, 1, v47);
  sub_209C4C698();
  uint64_t v38 = sub_209C4C6A8();
  uint64_t v20 = *(void *)(v38 - 8);
  uint64_t v39 = *(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56);
  uint64_t v40 = v20 + 56;
  v39(v2, 0, 1, v38);
  sub_209C4C6C8();
  uint64_t v32 = (uint64_t)&v15[v44 + *((int *)v45 + 12)];
  v15[v44] = 1;
  sub_209C4D1E8();
  uint64_t v21 = v9;
  uint64_t v22 = v36;
  uint64_t v23 = v9;
  uint64_t v24 = v35;
  v35(v21, v36, v6);
  sub_209C4C8E8();
  sub_209C4C898();
  v43(v19, 1, 1, v47);
  sub_209C4C698();
  v39(v2, 0, 1, v38);
  sub_209C4C6C8();
  uint64_t v32 = 2 * v44;
  uint64_t v25 = &v42[2 * v44];
  uint64_t v31 = &v25[*((int *)v45 + 12)];
  unsigned char *v25 = 2;
  sub_209C4D1E8();
  v24(v23, v22, v41);
  sub_209C4C8E8();
  sub_209C4C898();
  uint64_t v26 = v43;
  v43(v19, 1, 1, v47);
  sub_209C4C698();
  uint64_t v28 = v38;
  uint64_t v27 = v39;
  v39(v2, 0, 1, v38);
  sub_209C4C6C8();
  uint64_t v29 = &v42[v32 + v44];
  unint64_t v45 = &v29[*((int *)v45 + 12)];
  unsigned char *v29 = 3;
  sub_209C4D1E8();
  v35(v23, v36, v41);
  sub_209C4C8E8();
  sub_209C4C898();
  v26(v19, 1, 1, v47);
  sub_209C4C698();
  v27(v2, 0, 1, v28);
  sub_209C4C6C8();
  unint64_t result = sub_209C1C2F4(v33);
  static TimerDuration.caseDisplayRepresentations = result;
  return result;
}

uint64_t *TimerDuration.caseDisplayRepresentations.unsafeMutableAddressor()
{
  if (qword_267600628 != -1) {
    swift_once();
  }
  return &static TimerDuration.caseDisplayRepresentations;
}

uint64_t static TimerDuration.caseDisplayRepresentations.getter()
{
  return sub_209C2B8B0(&qword_267600628);
}

uint64_t sub_209C2B8B0(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return sub_209C4C708();
}

uint64_t static TimerDuration.caseDisplayRepresentations.setter(uint64_t a1)
{
  return sub_209C2B930(a1, &qword_267600628, &static TimerDuration.caseDisplayRepresentations);
}

uint64_t sub_209C2B930(uint64_t a1, void *a2, void *a3)
{
  if (*a2 != -1) {
    swift_once();
  }
  swift_beginAccess();
  *a3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static TimerDuration.caseDisplayRepresentations.modify())()
{
  if (qword_267600628 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t TimerDuration.rawValue.getter(char a1)
{
  uint64_t result = 1701736302;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x74726F6873;
      break;
    case 2:
      uint64_t result = 0x6D756964656DLL;
      break;
    case 3:
      uint64_t result = 1735290732;
      break;
    default:
      return result;
  }
  return result;
}

id static TimerDuration.defaultTimerForMode(mode:)(char a1)
{
  id result = objc_msgSend(self, sel_capabilities);
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = sub_209C293F4(a1);
    unsigned int v6 = objc_msgSend(v3, sel_isTimerSupportedForMode_, v5);

    if (v4 == 1) {
      return (id)v6;
    }
    else {
      return 0;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_209C2BB1C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_209C2BB3C, 0, 0);
}

id sub_209C2BB3C()
{
  if (sub_209C4C7B8())
  {
    swift_getKeyPath();
    sub_209C319C8();
    sub_209C4C648();
    swift_release();
    swift_release();
    uint64_t v1 = 0;
    unint64_t v2 = (void *)MEMORY[0x263F8EE78];
    uint64_t v11 = v0;
    uint64_t v3 = *(char *)(v0 + 24);
    while (1)
    {
      char v6 = byte_26BD776B8[v1 + 32];
      if (!v6) {
        goto LABEL_10;
      }
      id result = objc_msgSend(self, sel_capabilities);
      if (!result)
      {
        __break(1u);
        return result;
      }
      uint64_t v8 = result;
      unsigned int v9 = objc_msgSend(result, sel_isTimerSupportedForMode_, qword_209C7DF18[v3]);

      if (v9)
      {
LABEL_10:
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_209C2825C(0, v2[2] + 1, 1);
        }
        unint64_t v5 = v2[2];
        unint64_t v4 = v2[3];
        if (v5 >= v4 >> 1) {
          sub_209C2825C(v4 > 1, v5 + 1, 1);
        }
        v2[2] = v5 + 1;
        *((unsigned char *)v2 + v5 + 32) = v6;
      }
      if (++v1 == 4)
      {
        uint64_t v0 = v11;
        goto LABEL_14;
      }
    }
  }
  unint64_t v2 = &unk_26BD776E0;
LABEL_14:
  uint64_t v10 = *(uint64_t (**)(void *))(v0 + 8);
  return (id)v10(v2);
}

uint64_t StartCaptureIntent.captureMode.getter()
{
  sub_209C4C5E8();
  return v1;
}

uint64_t StartCaptureIntent.captureMode.setter()
{
  return sub_209C4C5F8();
}

void *static TimerDuration.allCases.getter()
{
  return &unk_26BD77708;
}

uint64_t sub_209C2BD7C(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v3 = *v1;
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  *unint64_t v4 = v2;
  v4[1] = sub_209C34068;
  v4[2] = v3;
  return MEMORY[0x270FA2498](sub_209C2BB3C, 0, 0);
}

uint64_t sub_209C2BE28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_209C3407C;
  return MEMORY[0x270EE1A10](a1, a2, a3);
}

uint64_t sub_209C2BEE0(unsigned __int8 *a1, char *a2)
{
  return sub_209C3DEEC(*a1, *a2);
}

uint64_t sub_209C2BEEC()
{
  return sub_209C4D628();
}

uint64_t sub_209C2BFAC()
{
  sub_209C4D238();
  return swift_bridgeObjectRelease();
}

uint64_t sub_209C2C054()
{
  return sub_209C4D628();
}

uint64_t sub_209C2C110@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s8CameraUI13TimerDurationO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

void sub_209C2C140(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE400000000000000;
  uint64_t v3 = 1701736302;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE500000000000000;
      uint64_t v3 = 0x74726F6873;
      goto LABEL_3;
    case 2:
      *a1 = 0x6D756964656DLL;
      a1[1] = 0xE600000000000000;
      break;
    case 3:
      *a1 = 1735290732;
      a1[1] = 0xE400000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_209C2C1C0(uint64_t a1)
{
  unint64_t v2 = sub_209C33E10();
  return MEMORY[0x270EE1690](a1, v2);
}

uint64_t sub_209C2C20C(uint64_t a1)
{
  unint64_t v2 = sub_209C14A84();
  return MEMORY[0x270EE0C40](a1, v2);
}

uint64_t sub_209C2C258(uint64_t a1, uint64_t a2)
{
  return sub_209C2C27C(a1, a2, &qword_267600628);
}

uint64_t sub_209C2C27C(uint64_t a1, uint64_t a2, void *a3)
{
  if (*a3 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return sub_209C4C708();
}

uint64_t sub_209C2C2DC(uint64_t a1)
{
  unint64_t v2 = sub_209C32134();
  return MEMORY[0x270EE1C28](a1, v2);
}

void sub_209C2C328(void *a1@<X8>)
{
  *a1 = &unk_26BD777B0;
}

uint64_t OpenCaptureModeIntent.target.getter()
{
  sub_209C4C5E8();
  return v1;
}

uint64_t OpenCaptureModeIntent.target.setter()
{
  return sub_209C4C5F8();
}

uint64_t (*OpenCaptureModeIntent.target.modify(void *a1))()
{
  unint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_209C4C5D8();
  return sub_209C2C3FC;
}

uint64_t static OpenCaptureModeIntent.parameterSummary.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600E00);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600E08);
  MEMORY[0x270FA5388](v1);
  sub_209C30E08();
  sub_209C4C768();
  sub_209C4C758();
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267600E10);
  sub_209C4C748();
  swift_release();
  sub_209C4C758();
  sub_209C4C778();
  return sub_209C4C728();
}

uint64_t OpenCaptureModeIntent.perform()(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_209C4D2C8();
  v2[4] = sub_209C4D2B8();
  uint64_t v4 = sub_209C4D298();
  return MEMORY[0x270FA2498](sub_209C2C638, v4, v3);
}

id sub_209C2C638()
{
  swift_release();
  sub_209C4C5E8();
  char v1 = *(unsigned char *)(v0 + 40);
  id result = objc_msgSend(self, sel_capabilities);
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = sub_209C293F4(v1);
    unsigned int v6 = objc_msgSend(v3, sel_isSupportedMode_withDevice_, v5, v4);

    if (v6)
    {
      sub_209C29268();
      uint64_t v8 = v7;
      id v9 = objc_msgSend(v7, sel_currentCaptureMode);
      uint64_t v10 = CAMCaptureDevicePositionForDevice((uint64_t)objc_msgSend(v8, sel_currentCaptureDevice));
      sub_209C4C5E8();
      sub_209C293F4(*(unsigned char *)(v0 + 40));
      id v12 = v11;
      sub_209C4C5E8();
      uint64_t v13 = sub_209C293F4(*(unsigned char *)(v0 + 40));
      uint64_t v14 = CAMCaptureDevicePositionForDevice(v13);
      if (v9 != v12 || v10 != v14) {
        objc_msgSend(v8, sel_changeToMode_device_animated_, v12, v13, 1);
      }
      sub_209C4C558();

      uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
    }
    else
    {
      sub_209C31110();
      swift_allocError();
      unsigned char *v16 = 4;
      swift_willThrow();
      uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
    }
    return (id)v15();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_209C2C7FC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_209C4C5E8();
  *a1 = v3;
  return result;
}

uint64_t sub_209C2C838()
{
  return sub_209C4C5F8();
}

uint64_t (*sub_209C2C870(void *a1))()
{
  unint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_209C4C5D8();
  return sub_209C2C3FC;
}

uint64_t sub_209C2C8CC(uint64_t a1)
{
  unint64_t v2 = sub_209C33DBC();
  return MEMORY[0x270EE1890](a1, v2);
}

uint64_t sub_209C2C918(uint64_t a1)
{
  unint64_t v2 = sub_209C33D68();
  return MEMORY[0x270EE0E18](a1, v2);
}

uint64_t sub_209C2C95C(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_209C3407C;
  return OpenCaptureModeIntent.perform()(a1, v4);
}

uint64_t sub_209C2C9FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = _s8CameraUI21OpenCaptureModeIntentVACycfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_209C2CA24(uint64_t a1)
{
  unint64_t v2 = sub_209C30E08();
  return MEMORY[0x270EE0D28](a1, v2);
}

unint64_t sub_209C2CA60()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE948);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v39 = (char *)&v26 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE860);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v37 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_209C4C8F8();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = sub_209C4C878();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_209C4D1F8();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v40 = sub_209C4C888();
  uint64_t v10 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  id v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFEBE0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE950);
  unint64_t v14 = (*(unsigned __int8 *)(*(void *)(v13 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v13 - 8) + 80);
  uint64_t v35 = *(void *)(*(void *)(v13 - 8) + 72);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_209C7CAE0;
  uint64_t v38 = v15;
  uint64_t v16 = (unsigned char *)(v15 + v14);
  uint64_t v36 = v13;
  uint64_t v17 = *(int *)(v13 + 48);
  unsigned char *v16 = 0;
  sub_209C4D1E8();
  if (qword_26AAFE848 != -1) {
    swift_once();
  }
  uint64_t v31 = &v16[v17];
  uint64_t v18 = __swift_project_value_buffer(v5, (uint64_t)qword_26AB01638);
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v28 = v6 + 16;
  uint64_t v33 = v19;
  uint64_t v34 = v18;
  v19(v8, v18, v5);
  sub_209C4C8E8();
  uint64_t v29 = v12;
  sub_209C4C898();
  uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
  uint64_t v20 = v37;
  v32(v37, 1, 1, v40);
  uint64_t v27 = v16;
  uint64_t v21 = v39;
  sub_209C4C698();
  uint64_t v22 = sub_209C4C6A8();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56);
  uint64_t v30 = v23 + 56;
  v24(v21, 0, 1, v22);
  sub_209C4C6C8();
  uint64_t v36 = (uint64_t)&v27[v35 + *(int *)(v36 + 48)];
  v27[v35] = 1;
  sub_209C4D1E8();
  v33(v8, v34, v5);
  sub_209C4C8E8();
  sub_209C4C898();
  v32(v20, 1, 1, v40);
  sub_209C4C698();
  v24(v21, 0, 1, v22);
  sub_209C4C6C8();
  unint64_t result = sub_209C1C518(v38);
  static CaptureDevice.caseDisplayRepresentations = result;
  return result;
}

uint64_t *CaptureDevice.caseDisplayRepresentations.unsafeMutableAddressor()
{
  if (qword_26AAFE840 != -1) {
    swift_once();
  }
  return &static CaptureDevice.caseDisplayRepresentations;
}

uint64_t static CaptureDevice.caseDisplayRepresentations.getter()
{
  if (qword_26AAFE840 != -1) {
    swift_once();
  }
  return sub_209C4C708();
}

uint64_t sub_209C2D0C0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_209C2D0E0, 0, 0);
}

id sub_209C2D0E0()
{
  uint64_t v1 = sub_209C4C7B8();
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (!v1) {
    goto LABEL_28;
  }
  swift_getKeyPath();
  sub_209C319C8();
  sub_209C4C648();
  swift_release();
  swift_release();
  int v3 = *(unsigned __int8 *)(v0 + 24);
  uint64_t v4 = (char)v3;
  uint64_t v5 = byte_26BD777F8;
  if (*(unsigned char *)(v0 + 24) && v3 != 3)
  {
    id result = objc_msgSend(self, sel_capabilities);
    if (!result) {
      goto LABEL_31;
    }
    uint64_t v7 = result;
    unsigned int v8 = objc_msgSend(result, sel_isSupportedMode_withDevice_, qword_209C7DEC0[v4], v5);

    if (!v8) {
      goto LABEL_15;
    }
  }
  else if (byte_26BD777F8)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v9 = sub_209C4D588();
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0) {
      goto LABEL_15;
    }
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    sub_209C28284(0, *(void *)(v2 + 16) + 1, 1);
  }
  unint64_t v11 = *(void *)(v2 + 16);
  unint64_t v10 = *(void *)(v2 + 24);
  if (v11 >= v10 >> 1) {
    sub_209C28284(v10 > 1, v11 + 1, 1);
  }
  *(void *)(v2 + 16) = v11 + 1;
  *(unsigned char *)(v2 + v11 + 32) = v5;
LABEL_15:
  uint64_t v12 = byte_26BD777F9;
  if (v4 != 3 && (_BYTE)v4)
  {
    id result = objc_msgSend(self, sel_capabilities);
    if (result)
    {
      uint64_t v13 = result;
      unsigned int v14 = objc_msgSend(result, sel_isSupportedMode_withDevice_, qword_209C7DEC0[v4], v12);

      if (v14) {
        goto LABEL_23;
      }
      goto LABEL_28;
    }
LABEL_31:
    __break(1u);
    return result;
  }
  if (byte_26BD777F9)
  {
    swift_bridgeObjectRelease();
LABEL_23:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      sub_209C28284(0, *(void *)(v2 + 16) + 1, 1);
    }
    unint64_t v17 = *(void *)(v2 + 16);
    unint64_t v16 = *(void *)(v2 + 24);
    if (v17 >= v16 >> 1) {
      sub_209C28284(v16 > 1, v17 + 1, 1);
    }
    *(void *)(v2 + 16) = v17 + 1;
    *(unsigned char *)(v2 + v17 + 32) = v12;
    goto LABEL_28;
  }
  char v15 = sub_209C4D588();
  swift_bridgeObjectRelease();
  if (v15) {
    goto LABEL_23;
  }
LABEL_28:
  uint64_t v18 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return (id)v18(v2);
}

void *static CaptureDevice.allCases.getter()
{
  return &unk_26BD77800;
}

uint64_t sub_209C2D3EC(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v3 = *v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_209C2D498;
  v4[2] = v3;
  return MEMORY[0x270FA2498](sub_209C2D0E0, 0, 0);
}

uint64_t sub_209C2D498(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (!v1) {
    **(void **)(v4 + 16) = a1;
  }
  uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
  return v6();
}

uint64_t sub_209C2D5A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_209C14E64;
  return MEMORY[0x270EE1A10](a1, a2, a3);
}

CameraUI::CaptureDevice_optional __swiftcall CaptureDevice.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1 = sub_209C4D568();
  swift_bridgeObjectRelease();
  if (v1 == 1) {
    v2.value = CameraUI_CaptureDevice_front;
  }
  else {
    v2.value = CameraUI_CaptureDevice_unknownDefault;
  }
  if (v1) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t CaptureDevice.rawValue.getter(char a1)
{
  if (a1) {
    return 0x746E6F7266;
  }
  else {
    return 1801675106;
  }
}

uint64_t sub_209C2D6DC(char *a1, char *a2)
{
  return sub_209C3E044(*a1, *a2);
}

uint64_t sub_209C2D6E8()
{
  return sub_209C4D628();
}

uint64_t sub_209C2D760()
{
  sub_209C4D238();
  return swift_bridgeObjectRelease();
}

uint64_t sub_209C2D7C4()
{
  return sub_209C4D628();
}

uint64_t sub_209C2D838@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_209C4D568();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

void sub_209C2D898(uint64_t *a1@<X8>)
{
  uint64_t v2 = 1801675106;
  if (*v1) {
    uint64_t v2 = 0x746E6F7266;
  }
  unint64_t v3 = 0xE400000000000000;
  if (*v1) {
    unint64_t v3 = 0xE500000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_209C2D8CC(uint64_t a1)
{
  unint64_t v2 = sub_209C33CA0();
  return MEMORY[0x270EE1690](a1, v2);
}

uint64_t sub_209C2D918(uint64_t a1)
{
  unint64_t v2 = sub_209C141C4();
  return MEMORY[0x270EE0C40](a1, v2);
}

uint64_t sub_209C2D964()
{
  if (qword_26AAFE840 != -1) {
    swift_once();
  }
  return sub_209C4C708();
}

uint64_t sub_209C2D9C0(uint64_t a1)
{
  unint64_t v2 = sub_209C327B8();
  return MEMORY[0x270EE1C28](a1, v2);
}

void sub_209C2DA0C(void *a1@<X8>)
{
  *a1 = &unk_26BD77878;
}

uint64_t ChangeCameraDeviceIntent.device.getter()
{
  sub_209C4C5E8();
  return v1;
}

uint64_t ChangeCameraDeviceIntent.device.setter()
{
  return sub_209C4C5F8();
}

uint64_t (*ChangeCameraDeviceIntent.device.modify(void *a1))()
{
  unint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_209C4C5D8();
  return sub_209C2C3FC;
}

uint64_t ChangeCameraDeviceIntent.$device.getter()
{
  return sub_209C4C608();
}

void *ChangeCameraDeviceIntent.openAppWhenRun.unsafeMutableAddressor()
{
  return &static ChangeCameraDeviceIntent.openAppWhenRun;
}

uint64_t static ChangeCameraDeviceIntent.openAppWhenRun.getter()
{
  return 1;
}

uint64_t static ChangeCameraDeviceIntent.parameterSummary.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600E28);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600E30);
  MEMORY[0x270FA5388](v1);
  sub_209C31188();
  sub_209C4C768();
  sub_209C4C758();
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267600E38);
  sub_209C4C748();
  swift_release();
  sub_209C4C758();
  sub_209C4C778();
  return sub_209C4C728();
}

uint64_t ChangeCameraDeviceIntent.perform()(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_209C4D2C8();
  v2[4] = sub_209C4D2B8();
  uint64_t v4 = sub_209C4D298();
  return MEMORY[0x270FA2498](sub_209C2DD54, v4, v3);
}

uint64_t sub_209C2DD54()
{
  swift_release();
  sub_209C29268();
  unint64_t v2 = v1;
  id v3 = objc_msgSend(v1, sel_currentCaptureMode);
  sub_209C4C5E8();
  objc_msgSend(v2, sel_changeToMode_device_animated_, v3, *(unsigned __int8 *)(v0 + 40), 1);
  sub_209C4C558();

  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_209C2DE30(uint64_t a1)
{
  unint64_t v2 = sub_209C33C4C();
  return MEMORY[0x270EE1890](a1, v2);
}

uint64_t sub_209C2DE80(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_209C3407C;
  return ChangeCameraDeviceIntent.perform()(a1, v4);
}

uint64_t sub_209C2DF20@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = _s8CameraUI06ChangeA12DeviceIntentVACycfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_209C2DF48(uint64_t a1)
{
  unint64_t v2 = sub_209C31188();
  return MEMORY[0x270EE0D28](a1, v2);
}

void *FlipCameraDeviceIntent.openAppWhenRun.unsafeMutableAddressor()
{
  return &static FlipCameraDeviceIntent.openAppWhenRun;
}

uint64_t static FlipCameraDeviceIntent.openAppWhenRun.getter()
{
  return 1;
}

uint64_t FlipCameraDeviceIntent.perform()(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_209C4D2C8();
  *(void *)(v1 + 24) = sub_209C4D2B8();
  uint64_t v3 = sub_209C4D298();
  return MEMORY[0x270FA2498](sub_209C2E034, v3, v2);
}

uint64_t sub_209C2E034()
{
  swift_release();
  sub_209C29268();
  uint64_t v2 = v1;
  uint64_t v3 = CAMCaptureDevicePositionForDevice((uint64_t)objc_msgSend(v1, sel_currentCaptureDevice));
  objc_msgSend(v2, sel_changeToMode_device_animated_, objc_msgSend(v2, sel_currentCaptureMode), CAMDefaultCaptureDeviceForDevicePosition(v3 ^ 1), 1);
  sub_209C4C558();

  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_209C2E118(uint64_t a1)
{
  unint64_t v2 = sub_209C33BF8();
  return MEMORY[0x270EE1890](a1, v2);
}

uint64_t sub_209C2E164(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_209C14E64;
  return FlipCameraDeviceIntent.perform()(a1);
}

uint64_t sub_209C2E1FC(uint64_t a1)
{
  unint64_t v2 = sub_209C32B5C();
  return MEMORY[0x270EE0D28](a1, v2);
}

uint64_t sub_209C2E238()
{
  uint64_t v0 = sub_209C4C8F8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_209C4C878();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_209C4D1F8();
  MEMORY[0x270FA5388](v5 - 8);
  sub_209C4D1E8();
  if (qword_26AAFE848 != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_project_value_buffer(v1, (uint64_t)qword_26AB01638);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v6, v1);
  sub_209C4C8E8();
  return sub_209C4C898();
}

BOOL sub_209C2E4EC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_209C2E500()
{
  return sub_209C4D628();
}

uint64_t sub_209C2E548()
{
  return sub_209C4D618();
}

uint64_t sub_209C2E574()
{
  return sub_209C4D628();
}

uint64_t sub_209C2E5C8()
{
  return sub_209C2E238();
}

void *StartCaptureIntent.openAppWhenRun.unsafeMutableAddressor()
{
  return &static StartCaptureIntent.openAppWhenRun;
}

uint64_t static StartCaptureIntent.openAppWhenRun.getter()
{
  return 1;
}

uint64_t (*StartCaptureIntent.captureMode.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_209C4C5D8();
  return sub_209C2C3FC;
}

uint64_t StartCaptureIntent.$captureMode.getter()
{
  return sub_209C4C608();
}

uint64_t StartCaptureIntent.timerDuration.getter()
{
  sub_209C4C5E8();
  return v1;
}

uint64_t StartCaptureIntent.timerDuration.setter()
{
  return sub_209C4C5F8();
}

uint64_t (*StartCaptureIntent.timerDuration.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_209C4C5D8();
  return sub_209C2C3FC;
}

uint64_t StartCaptureIntent.$timerDuration.getter()
{
  return sub_209C4C608();
}

uint64_t StartCaptureIntent.device.getter()
{
  sub_209C4C5E8();
  return v1;
}

uint64_t StartCaptureIntent.device.setter()
{
  return sub_209C4C5F8();
}

uint64_t (*StartCaptureIntent.device.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_209C4C5D8();
  return sub_209C2C3FC;
}

void sub_209C2E810(void *a1)
{
  unsigned __int8 v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);
  free(v1);
}

uint64_t StartCaptureIntent.$device.getter()
{
  return sub_209C4C608();
}

uint64_t static StartCaptureIntent.parameterSummary.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600E50);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600E58);
  MEMORY[0x270FA5388](v1);
  sub_209C3145C();
  sub_209C4C768();
  sub_209C4C758();
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267600E60);
  sub_209C4C748();
  swift_release();
  sub_209C4C758();
  sub_209C4C778();
  return sub_209C4C738();
}

uint64_t sub_209C2EA34()
{
  swift_getKeyPath();
  sub_209C3145C();
  uint64_t v0 = sub_209C4C718();
  swift_release();
  swift_getKeyPath();
  sub_209C4C718();
  uint64_t v1 = sub_209C4C718();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267600BB8);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_209C7CAF0;
  *(void *)(v2 + 32) = v0;
  *(void *)(v2 + 40) = v1;
  sub_209C4D278();
  sub_209C4C718();
  uint64_t v3 = sub_209C4C708();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return v3;
}

uint64_t StartCaptureIntent.perform()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void v4[5] = a3;
  void v4[6] = a4;
  _OWORD v4[3] = a1;
  v4[4] = a2;
  sub_209C4D2C8();
  v4[7] = sub_209C4D2B8();
  uint64_t v6 = sub_209C4D298();
  return MEMORY[0x270FA2498](sub_209C2EBD4, v6, v5);
}

id sub_209C2EBD4()
{
  uint64_t v50 = v0;
  swift_release();
  sub_209C4C5E8();
  char v1 = *(unsigned char *)(v0 + 16);
  uint64_t v2 = self;
  id result = objc_msgSend(v2, sel_capabilities);
  if (!result)
  {
    __break(1u);
    goto LABEL_45;
  }
  uint64_t v4 = result;
  uint64_t v5 = sub_209C293F4(v1);
  unsigned int v7 = objc_msgSend(v4, sel_isSupportedMode_withDevice_, v6, v5);

  if (v7)
  {
    sub_209C29268();
    uint64_t v9 = v8;
    unsigned __int8 v10 = objc_msgSend(v8, sel_isInCameraRollView);
    if (qword_267600618 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_209C4CAD8();
    __swift_project_value_buffer(v11, (uint64_t)qword_267602F30);
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    uint64_t v12 = sub_209C4CAB8();
    os_log_type_t type = sub_209C4D368();
    if (os_log_type_enabled(v12, type))
    {
      uint64_t v47 = v9;
      uint64_t v13 = swift_slowAlloc();
      uint64_t v46 = swift_slowAlloc();
      v49[0] = v46;
      *(_DWORD *)uint64_t v13 = 136446466;
      os_log_t log = v12;
      sub_209C4C5E8();
      uint64_t v14 = sub_209C2A954(*(unsigned char *)(v0 + 16));
      *(void *)(v0 + 16) = sub_209C305B8(v14, v15, v49);
      sub_209C4D3E8();
      swift_bridgeObjectRelease();
      swift_release_n();
      swift_release_n();
      swift_release_n();
      *(_WORD *)(v13 + 12) = 2082;
      sub_209C4C5E8();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267600E70);
      uint64_t v16 = sub_209C4D228();
      *(void *)(v0 + 16) = sub_209C305B8(v16, v17, v49);
      sub_209C4D3E8();
      swift_bridgeObjectRelease();
      swift_release_n();
      swift_release_n();
      swift_release_n();
      _os_log_impl(&dword_2099F8000, v12, type, "Performing CapturePhotoIntent with captureMode=%{public}s), device=%{public}s)", (uint8_t *)v13, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x21050C4E0](v46, -1, -1);
      uint64_t v18 = v13;
      uint64_t v9 = v47;
      MEMORY[0x21050C4E0](v18, -1, -1);
    }
    else
    {
      swift_release_n();
      swift_release_n();
      swift_release_n();
    }

    if (!objc_msgSend(v9, sel_navigateToViewfinderView))
    {
      sub_209C31110();
      swift_allocError();
      *uint64_t v22 = 0;
LABEL_16:
      swift_willThrow();

      goto LABEL_17;
    }
    if (objc_msgSend(v9, sel_isRecording))
    {
      sub_209C31110();
      swift_allocError();
      char v21 = 2;
LABEL_15:
      char *v20 = v21;
      goto LABEL_16;
    }
    if (objc_msgSend(v9, sel_isCapturingFromTimer))
    {
      sub_209C31110();
      swift_allocError();
      char v21 = 3;
      goto LABEL_15;
    }
    sub_209C4C5E8();
    int v24 = *(unsigned __int8 *)(v0 + 16);
    if (v24 != 2)
    {
      char v25 = v24 & 1;
      sub_209C4C5E8();
      if ((sub_209C29488(v25, *(unsigned char *)(v0 + 16)) & 1) == 0)
      {
        sub_209C31110();
        swift_allocError();
        char v21 = 5;
        goto LABEL_15;
      }
    }
    id v26 = objc_msgSend(v9, sel_currentCaptureMode, log);
    uint64_t v27 = CAMCaptureDevicePositionForDevice((uint64_t)objc_msgSend(v9, sel_currentCaptureDevice));
    sub_209C4C5E8();
    sub_209C293F4(*(unsigned char *)(v0 + 16));
    id v29 = v28;
    sub_209C4C5E8();
    int v30 = *(unsigned __int8 *)(v0 + 16);
    if (v30 == 2)
    {
      sub_209C4C5E8();
      uint64_t v31 = sub_209C293F4(*(unsigned char *)(v0 + 16));
    }
    else
    {
      uint64_t v31 = v30 & 1;
    }
    uint64_t v32 = CAMCaptureDevicePositionForDevice(v31);
    if (v26 == v29 && v27 == v32)
    {
      if ((v10 & 1) == 0)
      {
        if (objc_msgSend(v9, sel_currentCaptureMode) != v26)
        {
          unint64_t v42 = sub_209C4CAB8();
          os_log_type_t v43 = sub_209C4D378();
          if (os_log_type_enabled(v42, v43))
          {
            uint64_t v44 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v44 = 0;
            _os_log_impl(&dword_2099F8000, v42, v43, "Camera is in an unexpected capture mode, bailing.", v44, 2u);
            MEMORY[0x21050C4E0](v44, -1, -1);
          }

          goto LABEL_39;
        }
        sub_209C4C5E8();
        unsigned int v33 = *(unsigned __int8 *)(v0 + 16);
        if (v33 == 4)
        {
          sub_209C4C5E8();
          char v34 = *(unsigned char *)(v0 + 16);
          id result = objc_msgSend(v2, sel_capabilities);
          if (!result)
          {
LABEL_46:
            __break(1u);
            return result;
          }
          uint64_t v35 = result;
          uint64_t v36 = sub_209C293F4(v34);
          unsigned int v33 = objc_msgSend(v35, sel_isTimerSupportedForMode_, v37);

          if (v36 != 1) {
            unsigned int v33 = 0;
          }
        }
        sub_209C4C5E8();
        char v38 = *(unsigned char *)(v0 + 16);
        id result = objc_msgSend(v2, sel_capabilities);
        if (result)
        {
          uint64_t v39 = result;
          sub_209C293F4(v38);
          unsigned int v41 = objc_msgSend(v39, sel_isTimerSupportedForMode_, v40);

          if (v41) {
            objc_msgSend(v9, sel_setSingleUseTimerWithDuration_, v33);
          }
          objc_msgSend(v9, sel_pressShutterForRemoteShutter);
          goto LABEL_39;
        }
LABEL_45:
        __break(1u);
        goto LABEL_46;
      }
    }
    else
    {
      objc_msgSend(v9, sel_changeToMode_device_animated_, v29, v31, 1);
    }
LABEL_39:
    sub_209C4C558();

    uint64_t v23 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_18;
  }
  sub_209C31110();
  swift_allocError();
  *uint64_t v19 = 4;
  swift_willThrow();
LABEL_17:
  uint64_t v23 = *(uint64_t (**)(void))(v0 + 8);
LABEL_18:
  return (id)v23();
}

uint64_t sub_209C2F2F4(uint64_t a1)
{
  unint64_t v2 = sub_209C33BA4();
  return MEMORY[0x270EE1890](a1, v2);
}

uint64_t sub_209C2F344(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = v1[1];
  uint64_t v6 = v1[2];
  unsigned int v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *unsigned int v7 = v2;
  v7[1] = sub_209C3407C;
  return StartCaptureIntent.perform()(a1, v4, v5, v6);
}

uint64_t sub_209C2F3F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = _s8CameraUI18StartCaptureIntentVACycfC_0();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

uint64_t sub_209C2F424(uint64_t a1)
{
  unint64_t v2 = sub_209C3145C();
  return MEMORY[0x270EE0D28](a1, v2);
}

void *StopCaptureIntent.openAppWhenRun.unsafeMutableAddressor()
{
  return &static StopCaptureIntent.openAppWhenRun;
}

uint64_t static StopCaptureIntent.openAppWhenRun.getter()
{
  return 1;
}

uint64_t StopCaptureIntent.perform()(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_209C4D2C8();
  *(void *)(v1 + 24) = sub_209C4D2B8();
  uint64_t v3 = sub_209C4D298();
  return MEMORY[0x270FA2498](sub_209C2F510, v3, v2);
}

uint64_t sub_209C2F510()
{
  swift_release();
  sub_209C29268();
  uint64_t v2 = v1;
  if (objc_msgSend(v1, sel_isRecording))
  {
    objc_msgSend(v2, sel_stopRecording);
    sub_209C4C558();
  }
  else
  {
    sub_209C31110();
    swift_allocError();
    *uint64_t v4 = 1;
    swift_willThrow();
  }

  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_209C2F604(uint64_t a1)
{
  unint64_t v2 = sub_209C33B50();
  return MEMORY[0x270EE1890](a1, v2);
}

uint64_t sub_209C2F650(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_209C3407C;
  return StopCaptureIntent.perform()(a1);
}

uint64_t sub_209C2F6E8(uint64_t a1)
{
  unint64_t v2 = sub_209C32DD8();
  return MEMORY[0x270EE0D28](a1, v2);
}

uint64_t sub_209C2F724()
{
  uint64_t v0 = sub_209C4C878();
  __swift_allocate_value_buffer(v0, qword_26AB01638);
  uint64_t v1 = (void *)__swift_project_value_buffer(v0, (uint64_t)qword_26AB01638);
  void *v1 = type metadata accessor for _CameraUIBundleClass();
  uint64_t v2 = *MEMORY[0x263F06D30];
  uint64_t v3 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v3(v1, v2, v0);
}

uint64_t sub_209C2F7C0()
{
  return swift_deallocClassInstance();
}

uint64_t sub_209C2F7D0()
{
  uint64_t v0 = sub_209C4C568();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v7 - v3;
  uint64_t v5 = sub_209C4C5A8();
  __swift_allocate_value_buffer(v5, static CaptureDevice.__assistantSchemaEnum);
  __swift_project_value_buffer(v5, (uint64_t)static CaptureDevice.__assistantSchemaEnum);
  sub_209C4C578();
  sub_209C4C578();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  return sub_209C4C5B8();
}

uint64_t CaptureDevice.__assistantSchemaEnum.unsafeMutableAddressor()
{
  return sub_209C304A8(&qword_267600630, (uint64_t)static CaptureDevice.__assistantSchemaEnum);
}

uint64_t static CaptureDevice.__assistantSchemaEnum.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_209C30520(&qword_267600630, (uint64_t)static CaptureDevice.__assistantSchemaEnum, a1);
}

uint64_t sub_209C2F978()
{
  uint64_t v0 = sub_209C4C568();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v7 - v3;
  uint64_t v5 = sub_209C4C5A8();
  __swift_allocate_value_buffer(v5, static CaptureMode.__assistantSchemaEnum);
  __swift_project_value_buffer(v5, (uint64_t)static CaptureMode.__assistantSchemaEnum);
  sub_209C4C578();
  sub_209C4C578();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  return sub_209C4C5B8();
}

uint64_t CaptureMode.__assistantSchemaEnum.unsafeMutableAddressor()
{
  return sub_209C304A8(&qword_267600638, (uint64_t)static CaptureMode.__assistantSchemaEnum);
}

uint64_t static CaptureMode.__assistantSchemaEnum.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_209C30520(&qword_267600638, (uint64_t)static CaptureMode.__assistantSchemaEnum, a1);
}

uint64_t sub_209C2FB18()
{
  uint64_t v0 = sub_209C4C568();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v7 - v3;
  uint64_t v5 = sub_209C4C5A8();
  __swift_allocate_value_buffer(v5, static TimerDuration.__assistantSchemaEnum);
  __swift_project_value_buffer(v5, (uint64_t)static TimerDuration.__assistantSchemaEnum);
  sub_209C4C578();
  sub_209C4C578();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  return sub_209C4C5B8();
}

uint64_t TimerDuration.__assistantSchemaEnum.unsafeMutableAddressor()
{
  return sub_209C304A8(&qword_267600640, (uint64_t)static TimerDuration.__assistantSchemaEnum);
}

uint64_t static TimerDuration.__assistantSchemaEnum.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_209C30520(&qword_267600640, (uint64_t)static TimerDuration.__assistantSchemaEnum, a1);
}

uint64_t sub_209C2FCBC()
{
  uint64_t v0 = sub_209C4C588();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v7 - v3;
  uint64_t v5 = sub_209C4C5A8();
  __swift_allocate_value_buffer(v5, static StartCaptureIntent.__assistantSchemaIntent);
  __swift_project_value_buffer(v5, (uint64_t)static StartCaptureIntent.__assistantSchemaIntent);
  sub_209C4C598();
  sub_209C4C598();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  return sub_209C4C5C8();
}

uint64_t StartCaptureIntent.__assistantSchemaIntent.unsafeMutableAddressor()
{
  return sub_209C304A8(&qword_267600648, (uint64_t)static StartCaptureIntent.__assistantSchemaIntent);
}

uint64_t static StartCaptureIntent.__assistantSchemaIntent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_209C30520(&qword_267600648, (uint64_t)static StartCaptureIntent.__assistantSchemaIntent, a1);
}

uint64_t sub_209C2FE5C()
{
  uint64_t v0 = sub_209C4C588();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v7 - v3;
  uint64_t v5 = sub_209C4C5A8();
  __swift_allocate_value_buffer(v5, static OpenCaptureModeIntent.__assistantSchemaIntent);
  __swift_project_value_buffer(v5, (uint64_t)static OpenCaptureModeIntent.__assistantSchemaIntent);
  sub_209C4C598();
  sub_209C4C598();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  return sub_209C4C5C8();
}

uint64_t OpenCaptureModeIntent.__assistantSchemaIntent.unsafeMutableAddressor()
{
  return sub_209C304A8(&qword_267600650, (uint64_t)static OpenCaptureModeIntent.__assistantSchemaIntent);
}

uint64_t static OpenCaptureModeIntent.__assistantSchemaIntent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_209C30520(&qword_267600650, (uint64_t)static OpenCaptureModeIntent.__assistantSchemaIntent, a1);
}

uint64_t sub_209C2FFF8()
{
  uint64_t v0 = sub_209C4C588();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v7 - v3;
  uint64_t v5 = sub_209C4C5A8();
  __swift_allocate_value_buffer(v5, static ChangeCameraDeviceIntent.__assistantSchemaIntent);
  __swift_project_value_buffer(v5, (uint64_t)static ChangeCameraDeviceIntent.__assistantSchemaIntent);
  sub_209C4C598();
  sub_209C4C598();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  return sub_209C4C5C8();
}

uint64_t ChangeCameraDeviceIntent.__assistantSchemaIntent.unsafeMutableAddressor()
{
  return sub_209C304A8(&qword_267600658, (uint64_t)static ChangeCameraDeviceIntent.__assistantSchemaIntent);
}

uint64_t static ChangeCameraDeviceIntent.__assistantSchemaIntent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_209C30520(&qword_267600658, (uint64_t)static ChangeCameraDeviceIntent.__assistantSchemaIntent, a1);
}

uint64_t sub_209C30194()
{
  uint64_t v0 = sub_209C4C588();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v7 - v3;
  uint64_t v5 = sub_209C4C5A8();
  __swift_allocate_value_buffer(v5, static FlipCameraDeviceIntent.__assistantSchemaIntent);
  __swift_project_value_buffer(v5, (uint64_t)static FlipCameraDeviceIntent.__assistantSchemaIntent);
  sub_209C4C598();
  sub_209C4C598();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  return sub_209C4C5C8();
}

uint64_t FlipCameraDeviceIntent.__assistantSchemaIntent.unsafeMutableAddressor()
{
  return sub_209C304A8(&qword_267600660, (uint64_t)static FlipCameraDeviceIntent.__assistantSchemaIntent);
}

uint64_t static FlipCameraDeviceIntent.__assistantSchemaIntent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_209C30520(&qword_267600660, (uint64_t)static FlipCameraDeviceIntent.__assistantSchemaIntent, a1);
}

uint64_t sub_209C30330()
{
  uint64_t v0 = sub_209C4C588();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v7 - v3;
  uint64_t v5 = sub_209C4C5A8();
  __swift_allocate_value_buffer(v5, static StopCaptureIntent.__assistantSchemaIntent);
  __swift_project_value_buffer(v5, (uint64_t)static StopCaptureIntent.__assistantSchemaIntent);
  sub_209C4C598();
  sub_209C4C598();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  return sub_209C4C5C8();
}

uint64_t StopCaptureIntent.__assistantSchemaIntent.unsafeMutableAddressor()
{
  return sub_209C304A8(&qword_267600668, (uint64_t)static StopCaptureIntent.__assistantSchemaIntent);
}

uint64_t sub_209C304A8(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_209C4C5A8();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static StopCaptureIntent.__assistantSchemaIntent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_209C30520(&qword_267600668, (uint64_t)static StopCaptureIntent.__assistantSchemaIntent, a1);
}

uint64_t sub_209C30520@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_209C4C5A8();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

uint64_t sub_209C305B8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_209C3068C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_209C33F10((uint64_t)v12, *a3);
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
      sub_209C33F10((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    sub_209C4C708();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_209C3068C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_209C4D3F8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_209C30848(a5, a6);
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
  uint64_t v8 = sub_209C4D498();
  if (!v8)
  {
    sub_209C4D508();
    __break(1u);
LABEL_17:
    uint64_t result = sub_209C4D558();
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

uint64_t sub_209C30848(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_209C308E0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_209C30AC0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_209C30AC0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_209C308E0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_209C30A58(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_209C4D488();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_209C4D508();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_209C4D248();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_209C4D558();
    __break(1u);
LABEL_14:
    uint64_t result = sub_209C4D508();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_209C30A58(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_267600FE8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  _OWORD v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_209C30AC0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267600FE8);
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
  uint64_t v13 = a4 + 32;
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
  uint64_t result = sub_209C4D558();
  __break(1u);
  return result;
}

void sub_209C30C10(uint64_t a1)
{
  unint64_t v1 = 0;
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = a1 + 32;
  uint64_t v12 = MEMORY[0x263F8EE78];
LABEL_2:
  if (v1 <= v2) {
    unint64_t v4 = v2;
  }
  else {
    unint64_t v4 = v1;
  }
  while (v2 != v1)
  {
    if (v4 == v1)
    {
      __break(1u);
LABEL_16:
      __break(1u);
      return;
    }
    uint64_t v5 = *(char *)(v3 + v1);
    id v6 = objc_msgSend(self, sel_capabilities);
    if (!v6) {
      goto LABEL_16;
    }
    int64_t v7 = v6;
    ++v1;
    unsigned int v8 = objc_msgSend(v6, sel_isSupportedMode_withDevice_, qword_209C7DF18[v5], qword_209C7DF70[v5]);

    if (v8)
    {
      uint64_t v9 = v12;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_209C28234(0, *(void *)(v12 + 16) + 1, 1);
        uint64_t v9 = v12;
      }
      unint64_t v11 = *(void *)(v9 + 16);
      unint64_t v10 = *(void *)(v9 + 24);
      if (v11 >= v10 >> 1)
      {
        sub_209C28234(v10 > 1, v11 + 1, 1);
        uint64_t v9 = v12;
      }
      *(void *)(v9 + 16) = v11 + 1;
      uint64_t v12 = v9;
      *(unsigned char *)(v9 + v11 + 32) = v5;
      goto LABEL_2;
    }
  }
}

uint64_t _s8CameraUI11CaptureModeO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_209C4D568();
  swift_bridgeObjectRelease();
  if (v0 >= 0xB) {
    return 11;
  }
  else {
    return v0;
  }
}

uint64_t _s8CameraUI13TimerDurationO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_209C4D568();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

unint64_t sub_209C30E08()
{
  unint64_t result = qword_26AAFE990;
  if (!qword_26AAFE990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFE990);
  }
  return result;
}

uint64_t sub_209C30E5C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_209C4C608();
  *a1 = result;
  return result;
}

uint64_t _s8CameraUI21OpenCaptureModeIntentVACycfC_0()
{
  uint64_t v0 = sub_209C4C788();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = &v17[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE858);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  int64_t v7 = &v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = &v17[-v8];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE860);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = &v17[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE878);
  uint64_t v13 = sub_209C4C888();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  v17[15] = 11;
  uint64_t v14 = sub_209C4C548();
  unint64_t v15 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v9, 1, 1, v14);
  v15(v7, 1, 1, v14);
  (*(void (**)(unsigned char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263EFBDC8], v0);
  sub_209C13EA8();
  sub_209C13EFC();
  return sub_209C4C618();
}

unint64_t sub_209C31110()
{
  unint64_t result = qword_267600E20;
  if (!qword_267600E20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267600E20);
  }
  return result;
}

uint64_t CAMCaptureDevicePositionForDevice(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xA) {
    return 0;
  }
  else {
    return qword_209C7DFC8[a1 - 1];
  }
}

unint64_t sub_209C31188()
{
  unint64_t result = qword_26AAFE998;
  if (!qword_26AAFE998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFE998);
  }
  return result;
}

uint64_t _s8CameraUI06ChangeA12DeviceIntentVACycfC_0()
{
  uint64_t v0 = sub_209C4C788();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = &v17[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE858);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  int64_t v7 = &v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = &v17[-v8];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE860);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = &v17[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE890);
  uint64_t v13 = sub_209C4C888();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  v17[15] = 2;
  uint64_t v14 = sub_209C4C548();
  unint64_t v15 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v9, 1, 1, v14);
  v15(v7, 1, 1, v14);
  (*(void (**)(unsigned char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263EFBDC8], v0);
  sub_209C141C4();
  return sub_209C4C628();
}

BOOL CAMDefaultCaptureDeviceForDevicePosition(uint64_t a1)
{
  return a1 == 1;
}

unint64_t sub_209C3145C()
{
  unint64_t result = qword_26AAFE9A0;
  if (!qword_26AAFE9A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFE9A0);
  }
  return result;
}

uint64_t _s8CameraUI18StartCaptureIntentVACycfC_0()
{
  uint64_t v31 = sub_209C4C788();
  uint64_t v0 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  uint64_t v28 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE858);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  int64_t v7 = (char *)&v21 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE860);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE878);
  uint64_t v34 = sub_209C4C888();
  uint64_t v11 = *(void *)(v34 - 8);
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
  uint64_t v30 = v11 + 56;
  v12(v10, 1, 1, v34);
  uint64_t v27 = v12;
  LOBYTE(v35) = 11;
  uint64_t v13 = sub_209C4C548();
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(v7, 1, 1, v13);
  v14(v5, 1, 1, v13);
  unsigned int v33 = *MEMORY[0x263EFBDC8];
  unint64_t v15 = *(void (**)(void))(v0 + 104);
  uint64_t v26 = v0 + 104;
  uint64_t v32 = (void (*)(char *, void, uint64_t))v15;
  uint64_t v16 = v28;
  v15(v28);
  sub_209C13EA8();
  sub_209C13EFC();
  uint64_t v22 = v7;
  uint64_t v29 = sub_209C4C618();
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE8A0);
  v12(v10, 1, 1, v34);
  char v36 = 4;
  v14(v7, 1, 1, v13);
  v14(v5, 1, 1, v13);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE8A8);
  swift_getKeyPath();
  uint64_t v35 = sub_209C4C7C8();
  unint64_t v17 = v16;
  uint64_t v18 = v31;
  v32(v16, v33, v31);
  sub_209C14A30();
  sub_209C14A84();
  uint64_t v19 = v22;
  uint64_t v25 = sub_209C4C618();
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAFE8C0);
  v27(v10, 1, 1, v34);
  char v36 = 2;
  v14(v19, 1, 1, v13);
  v14(v5, 1, 1, v13);
  swift_getKeyPath();
  uint64_t v35 = sub_209C4C7C8();
  v32(v17, v33, v18);
  sub_209C14AD8();
  sub_209C141C4();
  sub_209C4C618();
  return v29;
}

unint64_t sub_209C31970()
{
  unint64_t result = qword_26AAFE9A8;
  if (!qword_26AAFE9A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFE9A8);
  }
  return result;
}

unint64_t sub_209C319C8()
{
  unint64_t result = qword_26AAFE9B0;
  if (!qword_26AAFE9B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFE9B0);
  }
  return result;
}

uint64_t sub_209C31A1C()
{
  return sub_209C3252C(&qword_26AAFE9B8, &qword_26AAFE9C0, (void (*)(void))sub_209C319C8);
}

unint64_t sub_209C31A5C()
{
  unint64_t result = qword_26AAFE9C8;
  if (!qword_26AAFE9C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFE9C8);
  }
  return result;
}

unint64_t sub_209C31AB4()
{
  unint64_t result = qword_26AAFE9D0;
  if (!qword_26AAFE9D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFE9D0);
  }
  return result;
}

unint64_t sub_209C31B0C()
{
  unint64_t result = qword_26AAFE9D8;
  if (!qword_26AAFE9D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFE9D8);
  }
  return result;
}

unint64_t sub_209C31B64()
{
  unint64_t result = qword_26AAFE9E0;
  if (!qword_26AAFE9E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFE9E0);
  }
  return result;
}

unint64_t sub_209C31BBC()
{
  unint64_t result = qword_26AAFE9E8;
  if (!qword_26AAFE9E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFE9E8);
  }
  return result;
}

unint64_t sub_209C31C14()
{
  unint64_t result = qword_26AAFE9F0;
  if (!qword_26AAFE9F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFE9F0);
  }
  return result;
}

unint64_t sub_209C31C6C()
{
  unint64_t result = qword_26AAFE9F8;
  if (!qword_26AAFE9F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFE9F8);
  }
  return result;
}

uint64_t sub_209C31CC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_209C32D90(a1, a2, a3, (void (*)(void))sub_209C13EFC);
}

unint64_t sub_209C31CF0()
{
  unint64_t result = qword_26AAFEA00;
  if (!qword_26AAFEA00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEA00);
  }
  return result;
}

unint64_t sub_209C31D48()
{
  unint64_t result = qword_26AAFEA08;
  if (!qword_26AAFEA08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEA08);
  }
  return result;
}

unint64_t sub_209C31DA0()
{
  unint64_t result = qword_26AAFEA10;
  if (!qword_26AAFEA10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEA10);
  }
  return result;
}

uint64_t sub_209C31DF4()
{
  return sub_209C184B8(&qword_267600E90, &qword_26AAFE9C0);
}

unint64_t sub_209C31E34()
{
  unint64_t result = qword_26AAFEA18;
  if (!qword_26AAFEA18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEA18);
  }
  return result;
}

unint64_t sub_209C31E8C()
{
  unint64_t result = qword_26AAFEA20;
  if (!qword_26AAFEA20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEA20);
  }
  return result;
}

uint64_t sub_209C31EE0()
{
  return sub_209C3252C(&qword_267600E98, qword_267600EA0, (void (*)(void))sub_209C31E8C);
}

unint64_t sub_209C31F20()
{
  unint64_t result = qword_26AAFEA28;
  if (!qword_26AAFEA28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEA28);
  }
  return result;
}

unint64_t sub_209C31F78()
{
  unint64_t result = qword_26AAFEA30;
  if (!qword_26AAFEA30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEA30);
  }
  return result;
}

unint64_t sub_209C31FD0()
{
  unint64_t result = qword_26AAFEA38;
  if (!qword_26AAFEA38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEA38);
  }
  return result;
}

unint64_t sub_209C32028()
{
  unint64_t result = qword_26AAFEA40;
  if (!qword_26AAFEA40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEA40);
  }
  return result;
}

unint64_t sub_209C32080()
{
  unint64_t result = qword_26AAFEA48;
  if (!qword_26AAFEA48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEA48);
  }
  return result;
}

unint64_t sub_209C320D8()
{
  unint64_t result = qword_26AAFEA50;
  if (!qword_26AAFEA50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEA50);
  }
  return result;
}

unint64_t sub_209C32134()
{
  unint64_t result = qword_26AAFEA58;
  if (!qword_26AAFEA58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEA58);
  }
  return result;
}

uint64_t sub_209C32188(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_209C32D90(a1, a2, a3, (void (*)(void))sub_209C14A84);
}

unint64_t sub_209C321B8()
{
  unint64_t result = qword_26AAFEA60;
  if (!qword_26AAFEA60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEA60);
  }
  return result;
}

unint64_t sub_209C32210()
{
  unint64_t result = qword_26AAFEA68;
  if (!qword_26AAFEA68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEA68);
  }
  return result;
}

unint64_t sub_209C32268()
{
  unint64_t result = qword_26AAFEA70;
  if (!qword_26AAFEA70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEA70);
  }
  return result;
}

uint64_t sub_209C322BC()
{
  return sub_209C184B8(&qword_267600EB8, qword_267600EA0);
}

unint64_t sub_209C322FC()
{
  unint64_t result = qword_267600EC0;
  if (!qword_267600EC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267600EC0);
  }
  return result;
}

unint64_t sub_209C3235C()
{
  unint64_t result = qword_26AAFEA78;
  if (!qword_26AAFEA78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEA78);
  }
  return result;
}

unint64_t sub_209C323B4()
{
  unint64_t result = qword_26AAFEA80;
  if (!qword_26AAFEA80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEA80);
  }
  return result;
}

uint64_t sub_209C32408()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_209C32424()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_209C32444()
{
  unint64_t result = qword_26AAFEA88;
  if (!qword_26AAFEA88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEA88);
  }
  return result;
}

unint64_t sub_209C3249C()
{
  unint64_t result = qword_26AAFEA90;
  if (!qword_26AAFEA90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEA90);
  }
  return result;
}

uint64_t sub_209C324F0()
{
  return sub_209C3252C(&qword_267600ED0, qword_267600ED8, (void (*)(void))sub_209C3249C);
}

uint64_t sub_209C3252C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_209C325A8()
{
  unint64_t result = qword_26AAFEA98;
  if (!qword_26AAFEA98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEA98);
  }
  return result;
}

unint64_t sub_209C32600()
{
  unint64_t result = qword_26AAFEAA0;
  if (!qword_26AAFEAA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEAA0);
  }
  return result;
}

unint64_t sub_209C32658()
{
  unint64_t result = qword_26AAFEAA8;
  if (!qword_26AAFEAA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEAA8);
  }
  return result;
}

unint64_t sub_209C326B0()
{
  unint64_t result = qword_26AAFEAB0;
  if (!qword_26AAFEAB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEAB0);
  }
  return result;
}

unint64_t sub_209C32708()
{
  unint64_t result = qword_26AAFEAB8;
  if (!qword_26AAFEAB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEAB8);
  }
  return result;
}

unint64_t sub_209C32760()
{
  unint64_t result = qword_26AAFEAC0;
  if (!qword_26AAFEAC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEAC0);
  }
  return result;
}

unint64_t sub_209C327B8()
{
  unint64_t result = qword_26AAFEAC8;
  if (!qword_26AAFEAC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEAC8);
  }
  return result;
}

uint64_t sub_209C3280C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_209C32D90(a1, a2, a3, (void (*)(void))sub_209C141C4);
}

unint64_t sub_209C3283C()
{
  unint64_t result = qword_26AAFEAD0;
  if (!qword_26AAFEAD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEAD0);
  }
  return result;
}

unint64_t sub_209C32894()
{
  unint64_t result = qword_26AAFEAD8;
  if (!qword_26AAFEAD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEAD8);
  }
  return result;
}

unint64_t sub_209C328EC()
{
  unint64_t result = qword_26AAFEAE0;
  if (!qword_26AAFEAE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEAE0);
  }
  return result;
}

uint64_t sub_209C32940()
{
  return sub_209C184B8(qword_267600EF0, qword_267600ED8);
}

unint64_t sub_209C32980()
{
  unint64_t result = qword_26AAFEAE8;
  if (!qword_26AAFEAE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEAE8);
  }
  return result;
}

unint64_t sub_209C329D8()
{
  unint64_t result = qword_26AAFEAF0;
  if (!qword_26AAFEAF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEAF0);
  }
  return result;
}

uint64_t sub_209C32A2C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_209C32A48()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_209C32A68()
{
  unint64_t result = qword_26AAFEAF8;
  if (!qword_26AAFEAF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEAF8);
  }
  return result;
}

unint64_t sub_209C32AC0()
{
  unint64_t result = qword_26AAFEB00;
  if (!qword_26AAFEB00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEB00);
  }
  return result;
}

uint64_t sub_209C32B14()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_209C32B30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_209C32D90(a1, a2, a3, (void (*)(void))sub_209C32B5C);
}

unint64_t sub_209C32B5C()
{
  unint64_t result = qword_26AAFEB08;
  if (!qword_26AAFEB08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEB08);
  }
  return result;
}

unint64_t sub_209C32BB4()
{
  unint64_t result = qword_26AAFEB10;
  if (!qword_26AAFEB10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEB10);
  }
  return result;
}

unint64_t sub_209C32C0C()
{
  unint64_t result = qword_26AAFEB18;
  if (!qword_26AAFEB18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEB18);
  }
  return result;
}

uint64_t sub_209C32C60()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_209C32C7C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_209C32C9C()
{
  unint64_t result = qword_26AAFEB20;
  if (!qword_26AAFEB20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEB20);
  }
  return result;
}

unint64_t sub_209C32CF4()
{
  unint64_t result = qword_26AAFEB28;
  if (!qword_26AAFEB28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEB28);
  }
  return result;
}

uint64_t sub_209C32D48()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_209C32D64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_209C32D90(a1, a2, a3, (void (*)(void))sub_209C32DD8);
}

uint64_t sub_209C32D90(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_209C32DD8()
{
  unint64_t result = qword_26AAFEB30;
  if (!qword_26AAFEB30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAFEB30);
  }
  return result;
}

unint64_t sub_209C32E30()
{
  unint64_t result = qword_267600F18;
  if (!qword_267600F18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267600F18);
  }
  return result;
}

unint64_t sub_209C32E8C()
{
  unint64_t result = qword_267600F20;
  if (!qword_267600F20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267600F20);
  }
  return result;
}

unint64_t sub_209C32EE8()
{
  unint64_t result = qword_267600F28;
  if (!qword_267600F28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267600F28);
  }
  return result;
}

unint64_t sub_209C32F44()
{
  unint64_t result = qword_267600F30;
  if (!qword_267600F30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267600F30);
  }
  return result;
}

unint64_t sub_209C32FA0()
{
  unint64_t result = qword_267600F38;
  if (!qword_267600F38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267600F38);
  }
  return result;
}

unint64_t sub_209C32FFC()
{
  unint64_t result = qword_267600F40;
  if (!qword_267600F40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267600F40);
  }
  return result;
}

unint64_t sub_209C33058()
{
  unint64_t result = qword_267600F48;
  if (!qword_267600F48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267600F48);
  }
  return result;
}

unint64_t sub_209C330B4()
{
  unint64_t result = qword_267600F50;
  if (!qword_267600F50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267600F50);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for CaptureMode(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF6) {
    goto LABEL_17;
  }
  if (a2 + 10 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 10) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 10;
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
      return (*a1 | (v4 << 8)) - 10;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 10;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xB;
  int v8 = v6 - 11;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CaptureMode(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 10 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 10) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF6) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF5)
  {
    unsigned int v6 = ((a2 - 246) >> 8) + 1;
    *unint64_t result = a2 + 10;
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
        JUMPOUT(0x209C33268);
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
          *unint64_t result = a2 + 10;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CaptureMode()
{
  return &type metadata for CaptureMode;
}

uint64_t getEnumTagSinglePayload for TimerDuration(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TimerDuration(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x209C333FCLL);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TimerDuration()
{
  return &type metadata for TimerDuration;
}

ValueMetadata *type metadata accessor for OpenCaptureModeIntent()
{
  return &type metadata for OpenCaptureModeIntent;
}

uint64_t getEnumTagSinglePayload for BuddyAnimationLoopState(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CaptureDevice(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x209C335A0);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_209C335C8(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CaptureDevice()
{
  return &type metadata for CaptureDevice;
}

ValueMetadata *type metadata accessor for ChangeCameraDeviceIntent()
{
  return &type metadata for ChangeCameraDeviceIntent;
}

ValueMetadata *type metadata accessor for FlipCameraDeviceIntent()
{
  return &type metadata for FlipCameraDeviceIntent;
}

uint64_t destroy for StartCaptureIntent()
{
  swift_release();
  swift_release();
  return swift_release();
}

void *_s8CameraUI18StartCaptureIntentVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  sub_209C4C718();
  sub_209C4C718();
  sub_209C4C718();
  return a1;
}

void *assignWithCopy for StartCaptureIntent(void *a1, void *a2)
{
  *a1 = *a2;
  sub_209C4C718();
  swift_release();
  a1[1] = a2[1];
  sub_209C4C718();
  swift_release();
  a1[2] = a2[2];
  sub_209C4C718();
  swift_release();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for StartCaptureIntent(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for StartCaptureIntent(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StartCaptureIntent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StartCaptureIntent()
{
  return &type metadata for StartCaptureIntent;
}

ValueMetadata *type metadata accessor for StopCaptureIntent()
{
  return &type metadata for StopCaptureIntent;
}

uint64_t type metadata accessor for _CameraUIBundleClass()
{
  return self;
}

uint64_t sub_209C33844()
{
  return sub_209C184B8(&qword_267600F58, &qword_267600F60);
}

uint64_t sub_209C33880()
{
  return sub_209C184B8(&qword_26AAFEBD0, &qword_26AAFEBD8);
}

uint64_t sub_209C338BC()
{
  return sub_209C184B8(&qword_267600F68, &qword_267600F70);
}

uint64_t sub_209C338F8()
{
  return sub_209C184B8(&qword_267600F78, &qword_267600F80);
}

ValueMetadata *type metadata accessor for CaptureDevice.AvailableDeviceProvider()
{
  return &type metadata for CaptureDevice.AvailableDeviceProvider;
}

ValueMetadata *type metadata accessor for TimerDuration.AvailableTimerProvider()
{
  return &type metadata for TimerDuration.AvailableTimerProvider;
}

uint64_t getEnumTagSinglePayload for CaptureErrors(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CaptureErrors(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *__n128 result = a2 + 5;
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
        JUMPOUT(0x209C33AB0);
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
          *__n128 result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CaptureErrors()
{
  return &type metadata for CaptureErrors;
}

ValueMetadata *type metadata accessor for CaptureMode.AvailableModesProvider()
{
  return &type metadata for CaptureMode.AvailableModesProvider;
}

unint64_t sub_209C33AFC()
{
  unint64_t result = qword_267600F88;
  if (!qword_267600F88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267600F88);
  }
  return result;
}

unint64_t sub_209C33B50()
{
  unint64_t result = qword_267600F90;
  if (!qword_267600F90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267600F90);
  }
  return result;
}

unint64_t sub_209C33BA4()
{
  unint64_t result = qword_267600F98;
  if (!qword_267600F98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267600F98);
  }
  return result;
}

unint64_t sub_209C33BF8()
{
  unint64_t result = qword_267600FA0;
  if (!qword_267600FA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267600FA0);
  }
  return result;
}

unint64_t sub_209C33C4C()
{
  unint64_t result = qword_267600FA8;
  if (!qword_267600FA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267600FA8);
  }
  return result;
}

unint64_t sub_209C33CA0()
{
  unint64_t result = qword_267600FB0;
  if (!qword_267600FB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_267600FB0);
  }
  return result;
}

uint64_t sub_209C33CF4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_209C4C5E8();
  *a1 = v3;
  return result;
}

uint64_t sub_209C33D30()
{
  return sub_209C4C5F8();
}

unint64_t sub_209C33D68()
{
  unint64_t result = qword_267600FC0;
  if (!qword_267600FC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267600FC0);
  }
  return result;
}

unint64_t sub_209C33DBC()
{
  unint64_t result = qword_267600FC8;
  if (!qword_267600FC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267600FC8);
  }
  return result;
}

unint64_t sub_209C33E10()
{
  unint64_t result = qword_267600FD0;
  if (!qword_267600FD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_267600FD0);
  }
  return result;
}

unint64_t sub_209C33E64()
{
  unint64_t result = qword_267600FE0;
  if (!qword_267600FE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267600FE0);
  }
  return result;
}

uint64_t sub_209C33EB8(uint64_t (*a1)(void))
{
  return a1();
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

uint64_t sub_209C33F10(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_209C33F6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_209C4C608();
  *a1 = result;
  return result;
}

uint64_t sub_209C33F98@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_209C4C608();
  *a1 = result;
  return result;
}

unint64_t sub_209C33FC4()
{
  unint64_t result = qword_267600FF8;
  if (!qword_267600FF8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267600FF8);
  }
  return result;
}

unint64_t sub_209C34004()
{
  unint64_t result = qword_267601000;
  if (!qword_267601000)
  {
    sub_209C33FC4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267601000);
  }
  return result;
}

uint64_t sub_209C3405C()
{
  return swift_release();
}

ValueMetadata *type metadata accessor for CameraUIAppIntents()
{
  return &type metadata for CameraUIAppIntents;
}

id ViewfinderViewController.Coordinator.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id ViewfinderViewController.Coordinator.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ViewfinderViewController.Coordinator();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for ViewfinderViewController.Coordinator()
{
  return self;
}

id ViewfinderViewController.Coordinator.__deallocating_deinit(uint64_t a1)
{
  return sub_209C34AF4(a1, type metadata accessor for ViewfinderViewController.Coordinator);
}

uint64_t sub_209C3430C(void *a1, void *a2, uint64_t a3, void *aBlock, void *a5)
{
  _OWORD v5[3] = a2;
  v5[4] = a5;
  v5[2] = a1;
  v5[5] = _Block_copy(aBlock);
  id v10 = a1;
  id v11 = a2;
  id v12 = a5;
  uint64_t v13 = (void *)swift_task_alloc();
  v5[6] = v13;
  void *v13 = v5;
  v13[1] = sub_209C34400;
  v13[48] = a3;
  v13[49] = v12;
  v13[47] = a2;
  return MEMORY[0x270FA2498](sub_209C390F4, 0, 0);
}

uint64_t sub_209C34400()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 40);
  unsigned int v4 = *(void **)(*v1 + 32);
  uint64_t v5 = *(void **)(*v1 + 24);
  unsigned int v6 = *(void **)(*v1 + 16);
  uint64_t v7 = *v1;
  swift_task_dealloc();

  if (v0)
  {
    if (v3)
    {
      int v8 = *(void (***)(void, void))(v2 + 40);
      uint64_t v9 = (void *)sub_209C4C858();

      ((void (**)(void, void *))v8)[2](v8, v9);
      _Block_release(v8);
    }
    else
    {
    }
  }
  else if (v3)
  {
    id v10 = *(void (***)(void, void))(v2 + 40);
    v10[2](v10, 0);
    _Block_release(v10);
  }
  id v11 = *(uint64_t (**)(void))(v7 + 8);
  return v11();
}

uint64_t sub_209C34750(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  _OWORD v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  id v7 = a3;
  int v8 = (void *)swift_task_alloc();
  void v3[5] = v8;
  *int v8 = v3;
  v8[1] = sub_209C34828;
  v8[17] = v7;
  return MEMORY[0x270FA2498](sub_209C39B50, 0, 0);
}

uint64_t sub_209C34828()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 32);
  unsigned int v4 = *(void **)(*v1 + 24);
  uint64_t v5 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();

  if (v0)
  {
    if (v3)
    {
      id v7 = *(void (***)(void, void))(v2 + 32);
      int v8 = (void *)sub_209C4C858();

      ((void (**)(void, void *))v7)[2](v7, v8);
      _Block_release(v7);
    }
    else
    {
    }
  }
  else if (v3)
  {
    uint64_t v9 = *(void (***)(void, void))(v2 + 32);
    v9[2](v9, 0);
    _Block_release(v9);
  }
  uint64_t v10 = *(uint64_t (**)(void))(v6 + 8);
  return v10();
}

uint64_t sub_209C349E4(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267601108);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    **(unsigned char **)(*(void *)(v3 + 64) + 40) = a2;
    return MEMORY[0x270FA2408](v3);
  }
}

uint64_t sub_209C34AC8()
{
  return sub_209C35118(v0+ OBJC_IVAR____TtCV8CameraUI24ViewfinderViewControllerP33_97E8248984EBD43B1770A42696E06CCA12_Coordinator__viewfinderViewController);
}

id sub_209C34AD8()
{
  return sub_209C34AF4(0, type metadata accessor for ViewfinderViewController._Coordinator);
}

id sub_209C34AF4(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t property wrapper backing initializer of ViewfinderViewController.hasHandleURLs()
{
  sub_209C4D0A8();
  return v1;
}

void *ViewfinderViewController.makeUIViewController(context:)()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  __swift_project_boxed_opaque_existential_1(v0, v1);
  uint64_t v3 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267601008);
  sub_209C4CF68();
  type metadata accessor for ViewfinderViewController._Coordinator();
  objc_msgSend(v3, sel_setUnlockDelegate_, swift_dynamicCastClassUnconditional());

  return v3;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t type metadata accessor for ViewfinderViewController._Coordinator()
{
  return self;
}

void ViewfinderViewController.updateUIViewController(_:context:)()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  __swift_project_boxed_opaque_existential_1(v0, v1);
  uint64_t v3 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267601008);
  sub_209C4CF68();
  type metadata accessor for ViewfinderViewController._Coordinator();
  objc_msgSend(v3, sel_setUnlockDelegate_, swift_dynamicCastClassUnconditional());

  sub_209C34D6C();
}

uint64_t sub_209C34D6C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600CD8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v26 = (uint64_t)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267601118);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  id v7 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v24 - v8;
  char v10 = *(unsigned char *)(v0 + 48);
  uint64_t v11 = *(void *)(v0 + 56);
  char v27 = v10;
  uint64_t v28 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267601120);
  uint64_t result = sub_209C4D0B8();
  if ((v29 & 1) == 0)
  {
    uint64_t v25 = v3;
    char v27 = v10;
    uint64_t v28 = v11;
    char v29 = 1;
    sub_209C4D0C8();
    sub_209C4CA88();
    uint64_t v13 = *(void *)(v0 + 24);
    uint64_t v14 = *(void *)(v0 + 32);
    __swift_project_boxed_opaque_existential_1((void *)v0, v13);
    uint64_t v15 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(v13, v14);
    uint64_t v16 = sub_209C4D2F8();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v26, 1, 1, v16);
    uint64_t v17 = v25;
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v25);
    sub_209C4D2C8();
    id v18 = v15;
    uint64_t v19 = sub_209C4D2B8();
    unint64_t v20 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    unint64_t v21 = (v5 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v22 = swift_allocObject();
    uint64_t v23 = MEMORY[0x263F8F500];
    *(void *)(v22 + 16) = v19;
    *(void *)(v22 + 24) = v23;
    (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v22 + v20, v7, v17);
    *(void *)(v22 + v21) = v18;
    sub_209C3A47C(v26, (uint64_t)&unk_267601130, v22);

    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v9, v17);
  }
  return result;
}

id ViewfinderViewController.makeCoordinator()()
{
  sub_209C350E0(v0, (uint64_t)v6);
  uint64_t v1 = (objc_class *)type metadata accessor for ViewfinderViewController._Coordinator();
  id v2 = objc_allocWithZone(v1);
  sub_209C350E0((uint64_t)v6, (uint64_t)v2+ OBJC_IVAR____TtCV8CameraUI24ViewfinderViewControllerP33_97E8248984EBD43B1770A42696E06CCA12_Coordinator__viewfinderViewController);
  v5.receiver = v2;
  v5.super_class = v1;
  id v3 = objc_msgSendSuper2(&v5, sel_init);
  sub_209C35118((uint64_t)v6);
  return v3;
}

uint64_t sub_209C350E0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_209C35118(uint64_t a1)
{
  return a1;
}

uint64_t ViewfinderViewController.init(provider:session:)@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_209C4D0A8();
  *(unsigned char *)(a3 + 48) = v7;
  *(void *)(a3 + 56) = v8;
  uint64_t result = sub_209C351B8(a1, a3);
  *(void *)(a3 + 40) = a2;
  return result;
}

uint64_t sub_209C351B8(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

unint64_t sub_209C351D4()
{
  unint64_t result = qword_267601018;
  if (!qword_267601018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267601018);
  }
  return result;
}

uint64_t sub_209C35228(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  _OWORD v5[3] = a5;
  uint64_t v6 = sub_209C4C8D8();
  v5[4] = v6;
  v5[5] = *(void *)(v6 - 8);
  v5[6] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267600CC8);
  v5[7] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267601118);
  v5[8] = v7;
  v5[9] = *(void *)(v7 - 8);
  v5[10] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267601138);
  v5[11] = v8;
  v5[12] = *(void *)(v8 - 8);
  v5[13] = swift_task_alloc();
  v5[14] = sub_209C4D2C8();
  v5[15] = sub_209C4D2B8();
  uint64_t v10 = sub_209C4D298();
  v5[16] = v10;
  v5[17] = v9;
  return MEMORY[0x270FA2498](sub_209C35410, v10, v9);
}

uint64_t sub_209C35410()
{
  (*(void (**)(void, void, void))(v0[9] + 16))(v0[10], v0[2], v0[8]);
  v0[18] = swift_getOpaqueTypeConformance2();
  sub_209C4D318();
  uint64_t v1 = sub_209C4D2B8();
  v0[19] = v1;
  swift_getAssociatedConformanceWitness();
  long long v2 = (void *)swift_task_alloc();
  v0[20] = v2;
  *long long v2 = v0;
  v2[1] = sub_209C3556C;
  uint64_t v3 = v0[7];
  uint64_t v4 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v3, v1, v4);
}

uint64_t sub_209C3556C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 136);
  uint64_t v3 = *(void *)(v1 + 128);
  return MEMORY[0x270FA2498](sub_209C356B0, v3, v2);
}

uint64_t sub_209C356B0()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(void, void))(v0[12] + 8))(v0[13], v0[11]);
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  else
  {
    uint64_t v6 = v0[6];
    uint64_t v7 = (void *)v0[3];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v6, v1, v2);
    uint64_t v8 = (void *)sub_209C4C8A8();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v2);
    objc_msgSend(v7, sel_handleURLIfNeeded_, v8);

    uint64_t v9 = sub_209C4D2B8();
    v0[19] = v9;
    swift_getAssociatedConformanceWitness();
    uint64_t v10 = (void *)swift_task_alloc();
    v0[20] = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_209C3556C;
    uint64_t v11 = v0[7];
    uint64_t v12 = MEMORY[0x263F8F500];
    return MEMORY[0x270FA1E88](v11, v9, v12);
  }
}

void *sub_209C358C8()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  __swift_project_boxed_opaque_existential_1(v0, v1);
  uint64_t v3 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267601008);
  sub_209C4CF68();
  type metadata accessor for ViewfinderViewController._Coordinator();
  objc_msgSend(v3, sel_setUnlockDelegate_, swift_dynamicCastClassUnconditional());

  return v3;
}

void sub_209C35984()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  __swift_project_boxed_opaque_existential_1(v0, v1);
  uint64_t v3 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267601008);
  sub_209C4CF68();
  type metadata accessor for ViewfinderViewController._Coordinator();
  objc_msgSend(v3, sel_setUnlockDelegate_, swift_dynamicCastClassUnconditional());

  sub_209C34D6C();
}

uint64_t sub_209C35A54@<X0>(void *a1@<X8>)
{
  sub_209C350E0(v1, (uint64_t)v8);
  uint64_t v3 = (objc_class *)type metadata accessor for ViewfinderViewController._Coordinator();
  id v4 = objc_allocWithZone(v3);
  sub_209C350E0((uint64_t)v8, (uint64_t)v4+ OBJC_IVAR____TtCV8CameraUI24ViewfinderViewControllerP33_97E8248984EBD43B1770A42696E06CCA12_Coordinator__viewfinderViewController);
  v7.receiver = v4;
  v7.super_class = v3;
  id v5 = objc_msgSendSuper2(&v7, sel_init);
  uint64_t result = sub_209C35118((uint64_t)v8);
  *a1 = v5;
  return result;
}

uint64_t sub_209C35ADC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_209C3A214();
  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_209C35B40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_209C3A214();
  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

void sub_209C35BA4()
{
}

uint64_t destroy for ViewfinderViewController(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_0(a1);
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for ViewfinderViewController(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  sub_209C4C718();
  sub_209C4C718();
  return a1;
}

uint64_t assignWithCopy for ViewfinderViewController(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  sub_209C4C718();
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  sub_209C4C718();
  swift_release();
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        sub_209C4C718();
        uint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          sub_209C4C718();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          sub_209C4C718();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ViewfinderViewController(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_0(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ViewfinderViewController(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ViewfinderViewController(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ViewfinderViewController()
{
  return &type metadata for ViewfinderViewController;
}

uint64_t sub_209C36040()
{
  _Block_release(*(const void **)(v0 + 24));
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_209C36088()
{
  unint64_t v2 = (void *)v0[2];
  long long v3 = (void *)v0[3];
  long long v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_209C3407C;
  uint64_t v6 = (uint64_t (*)(void *, void *, void *))((char *)&dword_267601080 + dword_267601080);
  return v6(v2, v3, v4);
}

uint64_t sub_209C3613C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  long long v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *long long v4 = v3;
  v4[1] = sub_209C3407C;
  return v6();
}

uint64_t sub_209C3620C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  long long v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_209C3407C;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_267601090 + dword_267601090);
  return v6(v2, v3, v4);
}

uint64_t sub_209C362CC(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_209C3407C;
  return v7();
}

uint64_t sub_209C3639C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_209C3407C;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2676010A0 + dword_2676010A0);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_209C36468(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_209C4D2F8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_209C4D2E8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_209C1815C(a1, &qword_267600CD8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_209C4D298();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_209C36614(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_209C366F0;
  return v6(a1);
}

uint64_t sub_209C366F0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_209C367E8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_209C36820(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_209C14E64;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2676010B0 + dword_2676010B0);
  return v6(a1, v4);
}

uint64_t sub_209C368D8(uint64_t a1)
{
  return sub_209C36930(a1, (void (*)(uint64_t))sub_209C1CFA4, (uint64_t (*)(uint64_t, uint64_t))sub_209C36B90);
}

uint64_t sub_209C36904(uint64_t a1)
{
  return sub_209C36930(a1, (void (*)(uint64_t))CaptureMode.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_209C37028);
}

uint64_t sub_209C36930(uint64_t a1, void (*a2)(uint64_t), uint64_t (*a3)(uint64_t, uint64_t))
{
  sub_209C4D608();
  a2(a1);
  sub_209C4D238();
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_209C4D628();
  return a3(a1, v5);
}

unint64_t sub_209C369CC(unsigned __int8 a1)
{
  sub_209C4D608();
  sub_209C4D238();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_209C4D628();
  return sub_209C373FC(a1, v2);
}

unint64_t sub_209C36AB0(char a1)
{
  sub_209C4D608();
  sub_209C4D238();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_209C4D628();
  return sub_209C375CC(a1 & 1, v2);
}

unint64_t sub_209C36B4C(uint64_t a1)
{
  uint64_t v2 = sub_209C4D458();
  return sub_209C376FC(a1, v2);
}

unint64_t sub_209C36B90(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0xE900000000000065;
      unint64_t v8 = 0x6772616843657250;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          unint64_t v7 = 0xE500000000000000;
          unint64_t v8 = 0x746F6F6853;
          break;
        case 2:
          unint64_t v7 = 0xE500000000000000;
          unint64_t v8 = 0x6B63696C43;
          break;
        case 3:
          unint64_t v8 = 0x6946206B63696C43;
          unint64_t v7 = 0xEE0064656873696ELL;
          break;
        case 4:
          unint64_t v7 = 0xE700000000000000;
          unint64_t v8 = 0x7373696D736944;
          break;
        case 5:
          unint64_t v8 = 0x6C426F5465646146;
          unint64_t v7 = 0xEB000000006B6361;
          break;
        case 6:
          unint64_t v7 = 0x8000000209C94CD0;
          unint64_t v8 = 0xD000000000000012;
          break;
        case 7:
          unint64_t v8 = 0x6D6154746F6F6853;
          unint64_t v7 = 0xEB00000000656C61;
          break;
        case 8:
          unint64_t v7 = 0xE600000000000000;
          unint64_t v8 = 0x656C616D6154;
          break;
        case 9:
          unint64_t v7 = 0xE900000000000073;
          unint64_t v8 = 0x73656C6863756F54;
          break;
        case 0xA:
          unint64_t v7 = 0xE90000000000006ELL;
          unint64_t v8 = 0x776F446863756F54;
          break;
        case 0xB:
          unint64_t v7 = 0xE700000000000000;
          unint64_t v8 = 0x70556863756F54;
          break;
        case 0xC:
          unint64_t v7 = 0xE600000000000000;
          unint64_t v8 = 0x746E6574614CLL;
          break;
        case 0xD:
          unint64_t v7 = 0xE400000000000000;
          unint64_t v8 = 2003790919;
          break;
        default:
          break;
      }
      uint64_t v9 = 0x6772616843657250;
      unint64_t v10 = 0xE900000000000065;
      switch(v6)
      {
        case 1:
          unint64_t v10 = 0xE500000000000000;
          if (v8 == 0x746F6F6853) {
            goto LABEL_42;
          }
          goto LABEL_43;
        case 2:
          unint64_t v10 = 0xE500000000000000;
          if (v8 != 0x6B63696C43) {
            goto LABEL_43;
          }
          goto LABEL_42;
        case 3:
          unint64_t v10 = 0xEE0064656873696ELL;
          if (v8 != 0x6946206B63696C43) {
            goto LABEL_43;
          }
          goto LABEL_42;
        case 4:
          unint64_t v10 = 0xE700000000000000;
          if (v8 != 0x7373696D736944) {
            goto LABEL_43;
          }
          goto LABEL_42;
        case 5:
          uint64_t v11 = 0x6C426F5465646146;
          uint64_t v12 = 7037793;
          goto LABEL_30;
        case 6:
          unint64_t v10 = 0x8000000209C94CD0;
          if (v8 != 0xD000000000000012) {
            goto LABEL_43;
          }
          goto LABEL_42;
        case 7:
          uint64_t v11 = 0x6D6154746F6F6853;
          uint64_t v12 = 6646881;
LABEL_30:
          unint64_t v10 = v12 & 0xFFFFFFFFFFFFLL | 0xEB00000000000000;
          if (v8 != v11) {
            goto LABEL_43;
          }
          goto LABEL_42;
        case 8:
          unint64_t v10 = 0xE600000000000000;
          if (v8 != 0x656C616D6154) {
            goto LABEL_43;
          }
          goto LABEL_42;
        case 9:
          unint64_t v10 = 0xE900000000000073;
          if (v8 != 0x73656C6863756F54) {
            goto LABEL_43;
          }
          goto LABEL_42;
        case 10:
          unint64_t v10 = 0xE90000000000006ELL;
          if (v8 != 0x776F446863756F54) {
            goto LABEL_43;
          }
          goto LABEL_42;
        case 11:
          unint64_t v10 = 0xE700000000000000;
          if (v8 != 0x70556863756F54) {
            goto LABEL_43;
          }
          goto LABEL_42;
        case 12:
          unint64_t v10 = 0xE600000000000000;
          uint64_t v9 = 0x746E6574614CLL;
          goto LABEL_41;
        case 13:
          unint64_t v10 = 0xE400000000000000;
          if (v8 != 2003790919) {
            goto LABEL_43;
          }
          goto LABEL_42;
        default:
LABEL_41:
          if (v8 != v9) {
            goto LABEL_43;
          }
LABEL_42:
          if (v7 == v10)
          {
            swift_bridgeObjectRelease_n();
            return v4;
          }
LABEL_43:
          char v13 = sub_209C4D588();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v13) {
            return v4;
          }
          unint64_t v4 = (v4 + 1) & v5;
          if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
            return v4;
          }
          break;
      }
    }
  }
  return v4;
}

unint64_t sub_209C37028(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0xE600000000000000;
      uint64_t v8 = 0x6569666C6573;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          unint64_t v7 = 0xE500000000000000;
          uint64_t v8 = 0x6F65646976;
          break;
        case 2:
          unint64_t v7 = 0xE800000000000000;
          uint64_t v8 = 0x7469617274726F70;
          break;
        case 3:
          uint64_t v8 = 0x7469617274726F70;
          unint64_t v7 = 0xEF6569666C65732DLL;
          break;
        case 4:
          unint64_t v7 = 0xE500000000000000;
          uint64_t v8 = 0x6F746F6870;
          break;
        case 5:
          uint64_t v8 = 0x6974616D656E6963;
          unint64_t v7 = 0xE900000000000063;
          break;
        case 6:
          uint64_t v8 = 0x6F6D2D6F6C73;
          break;
        case 7:
          uint64_t v8 = 0x70616C2D656D6974;
          unint64_t v7 = 0xEA00000000006573;
          break;
        case 8:
          unint64_t v7 = 0xE400000000000000;
          uint64_t v8 = 1869504880;
          break;
        case 9:
          uint64_t v8 = 0x566C616974617073;
          uint64_t v9 = 1868915817;
          goto LABEL_14;
        case 0xA:
          uint64_t v8 = 0x506C616974617073;
          uint64_t v9 = 1869901672;
LABEL_14:
          unint64_t v7 = v9 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
          break;
        default:
          break;
      }
      unint64_t v10 = 0xE600000000000000;
      switch(v6)
      {
        case 1:
          unint64_t v10 = 0xE500000000000000;
          uint64_t v12 = 1701079414;
          goto LABEL_27;
        case 2:
          unint64_t v10 = 0xE800000000000000;
          if (v8 != 0x7469617274726F70) {
            goto LABEL_18;
          }
          goto LABEL_17;
        case 3:
          unint64_t v10 = 0xEF6569666C65732DLL;
          if (v8 != 0x7469617274726F70) {
            goto LABEL_18;
          }
          goto LABEL_17;
        case 4:
          unint64_t v10 = 0xE500000000000000;
          uint64_t v12 = 1953458288;
LABEL_27:
          if (v8 != (v12 & 0xFFFF0000FFFFFFFFLL | 0x6F00000000)) {
            goto LABEL_18;
          }
          goto LABEL_17;
        case 5:
          unint64_t v10 = 0xE900000000000063;
          if (v8 != 0x6974616D656E6963) {
            goto LABEL_18;
          }
          goto LABEL_17;
        case 6:
          if (v8 != 0x6F6D2D6F6C73) {
            goto LABEL_18;
          }
          goto LABEL_17;
        case 7:
          unint64_t v10 = 0xEA00000000006573;
          if (v8 != 0x70616C2D656D6974) {
            goto LABEL_18;
          }
          goto LABEL_17;
        case 8:
          unint64_t v10 = 0xE400000000000000;
          if (v8 != 1869504880) {
            goto LABEL_18;
          }
          goto LABEL_17;
        case 9:
          unint64_t v10 = 0xEC0000006F656469;
          if (v8 != 0x566C616974617073) {
            goto LABEL_18;
          }
          goto LABEL_17;
        case 10:
          unint64_t v10 = 0xEC0000006F746F68;
          if (v8 != 0x506C616974617073) {
            goto LABEL_18;
          }
          goto LABEL_17;
        default:
          if (v8 != 0x6569666C6573) {
            goto LABEL_18;
          }
LABEL_17:
          if (v7 == v10)
          {
            swift_bridgeObjectRelease_n();
            return v4;
          }
LABEL_18:
          char v11 = sub_209C4D588();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v11) {
            return v4;
          }
          unint64_t v4 = (v4 + 1) & v5;
          if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
            return v4;
          }
          break;
      }
    }
  }
  return v4;
}

unint64_t sub_209C373FC(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0xE400000000000000;
      uint64_t v8 = 1701736302;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          unint64_t v7 = 0xE500000000000000;
          uint64_t v8 = 0x74726F6873;
          break;
        case 2:
          unint64_t v7 = 0xE600000000000000;
          uint64_t v8 = 0x6D756964656DLL;
          break;
        case 3:
          uint64_t v8 = 1735290732;
          break;
        default:
          break;
      }
      unint64_t v9 = 0xE400000000000000;
      uint64_t v10 = 1701736302;
      switch(v6)
      {
        case 1:
          unint64_t v9 = 0xE500000000000000;
          if (v8 == 0x74726F6873) {
            goto LABEL_14;
          }
          goto LABEL_15;
        case 2:
          unint64_t v9 = 0xE600000000000000;
          uint64_t v10 = 0x6D756964656DLL;
          goto LABEL_11;
        case 3:
          if (v8 == 1735290732) {
            goto LABEL_14;
          }
          goto LABEL_15;
        default:
LABEL_11:
          if (v8 != v10) {
            goto LABEL_15;
          }
LABEL_14:
          if (v7 == v9)
          {
            swift_bridgeObjectRelease_n();
            return v4;
          }
LABEL_15:
          char v11 = sub_209C4D588();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v11) {
            return v4;
          }
          unint64_t v4 = (v4 + 1) & v5;
          if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
            return v4;
          }
          break;
      }
    }
  }
  return v4;
}

unint64_t sub_209C375CC(char a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    if (a1) {
      uint64_t v6 = 0x746E6F7266;
    }
    else {
      uint64_t v6 = 1801675106;
    }
    if (a1) {
      unint64_t v7 = 0xE500000000000000;
    }
    else {
      unint64_t v7 = 0xE400000000000000;
    }
    while (1)
    {
      uint64_t v8 = *(unsigned char *)(*(void *)(v2 + 48) + v4) ? 0x746E6F7266 : 1801675106;
      unint64_t v9 = *(unsigned char *)(*(void *)(v2 + 48) + v4) ? 0xE500000000000000 : 0xE400000000000000;
      if (v8 == v6 && v9 == v7) {
        break;
      }
      char v11 = sub_209C4D588();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v5;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
    swift_bridgeObjectRelease_n();
  }
  return v4;
}

unint64_t sub_209C376FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_209C39FF0(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x210509E00](v9, a1);
      sub_209C39F9C((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_209C377C4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267600BE0);
  char v34 = a2;
  uint64_t v6 = sub_209C4D538();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_37;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  unint64_t v9 = (void *)(v5 + 64);
  if (v8 < 64) {
    uint64_t v10 = ~(-1 << v8);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v5 + 64);
  int64_t v12 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v13 = v6 + 64;
  sub_209C4C718();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_21;
    }
    if (__OFADD__(v14++, 1)) {
      goto LABEL_39;
    }
    if (v14 >= v12) {
      break;
    }
    unint64_t v23 = v9[v14];
    if (!v23)
    {
      int64_t v24 = v14 + 1;
      if (v14 + 1 >= v12) {
        break;
      }
      unint64_t v23 = v9[v24];
      if (!v23)
      {
        while (1)
        {
          int64_t v14 = v24 + 1;
          if (__OFADD__(v24, 1)) {
            goto LABEL_38;
          }
          if (v14 >= v12) {
            goto LABEL_32;
          }
          unint64_t v23 = v9[v14];
          ++v24;
          if (v23) {
            goto LABEL_20;
          }
        }
      }
      ++v14;
    }
LABEL_20:
    unint64_t v11 = (v23 - 1) & v23;
    unint64_t v21 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_21:
    char v25 = *(unsigned char *)(*(void *)(v5 + 48) + v21);
    uint64_t v26 = *(void **)(*(void *)(v5 + 56) + 8 * v21);
    if ((v34 & 1) == 0) {
      id v27 = v26;
    }
    sub_209C4D608();
    sub_209C4D238();
    swift_bridgeObjectRelease();
    uint64_t v15 = sub_209C4D628();
    uint64_t v16 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v17 = v15 & ~v16;
    unint64_t v18 = v17 >> 6;
    if (((-1 << v17) & ~*(void *)(v13 + 8 * (v17 >> 6))) != 0)
    {
      unint64_t v19 = __clz(__rbit64((-1 << v17) & ~*(void *)(v13 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
      goto LABEL_8;
    }
    char v28 = 0;
    unint64_t v29 = (unint64_t)(63 - v16) >> 6;
    do
    {
      if (++v18 == v29 && (v28 & 1) != 0)
      {
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x209C37C18);
      }
      BOOL v30 = v18 == v29;
      if (v18 == v29) {
        unint64_t v18 = 0;
      }
      v28 |= v30;
      uint64_t v31 = *(void *)(v13 + 8 * v18);
    }
    while (v31 == -1);
    unint64_t v19 = __clz(__rbit64(~v31)) + (v18 << 6);
LABEL_8:
    *(void *)(v13 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    *(unsigned char *)(*(void *)(v7 + 48) + v19) = v25;
    *(void *)(*(void *)(v7 + 56) + 8 * v19) = v26;
    ++*(void *)(v7 + 16);
  }
LABEL_32:
  swift_release();
  uint64_t v3 = v2;
  if (v34)
  {
    uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
    if (v32 >= 64) {
      bzero((void *)(v5 + 64), ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
    }
    else {
      void *v9 = -1 << v32;
    }
    *(void *)(v5 + 16) = 0;
  }
LABEL_37:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_209C37C50(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2676010C8);
  uint64_t v6 = sub_209C4D538();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = sub_209C4C718();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v21 + 1;
      if (v21 + 1 >= v11) {
        goto LABEL_34;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v14);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v14 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v14 >= v11) {
              goto LABEL_34;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v14);
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v14 = v24;
      }
    }
LABEL_21:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    uint64_t v25 = *(void *)(v5 + 48) + 40 * v20;
    if (a2)
    {
      long long v26 = *(_OWORD *)v25;
      long long v27 = *(_OWORD *)(v25 + 16);
      uint64_t v40 = *(void *)(v25 + 32);
      long long v38 = v26;
      long long v39 = v27;
      sub_209C23628((_OWORD *)(*(void *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_209C39FF0(v25, (uint64_t)&v38);
      sub_209C33F10(*(void *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    uint64_t result = sub_209C4D458();
    uint64_t v28 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v29 = result & ~v28;
    unint64_t v30 = v29 >> 6;
    if (((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v33 = v30 == v32;
        if (v30 == v32) {
          unint64_t v30 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      unint64_t v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t v16 = *(void *)(v7 + 48) + 40 * v15;
    long long v17 = v38;
    long long v18 = v39;
    *(void *)(v16 + 32) = v40;
    *(_OWORD *)uint64_t v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    uint64_t result = (uint64_t)sub_209C23628(v37, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

_OWORD *sub_209C37F68(_OWORD *a1, uint64_t a2, char a3)
{
  unint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_209C36B4C(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_209C382BC();
      goto LABEL_7;
    }
    sub_209C37C50(v13, a3 & 1);
    unint64_t v19 = sub_209C36B4C(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      uint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
LABEL_13:
      sub_209C39FF0(a2, (uint64_t)v21);
      return sub_209C380B4(v10, (uint64_t)v21, a1, v16);
    }
LABEL_15:
    uint64_t result = (_OWORD *)sub_209C4D5B8();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v16 = *v4;
  if ((v14 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  long long v17 = (_OWORD *)(v16[7] + 32 * v10);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
  return sub_209C23628(a1, v17);
}

_OWORD *sub_209C380B4(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  uint64_t result = sub_209C23628(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v8 = a4[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a4[2] = v10;
  }
  return result;
}

id sub_209C38130()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267600BE0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_209C4D528();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_24:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    if (__OFADD__(v9++, 1)) {
      goto LABEL_26;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    if (!v18) {
      break;
    }
LABEL_23:
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = *(void **)(*(void *)(v2 + 56) + 8 * v15);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    *(void *)(*(void *)(v4 + 56) + 8 * v15) = v16;
    id result = v16;
  }
  int64_t v19 = v9 + 1;
  if (v9 + 1 >= v13) {
    goto LABEL_24;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

void *sub_209C382BC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2676010C8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_209C4D528();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    sub_209C39FF0(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    uint64_t v17 = 32 * v15;
    sub_209C33F10(*(void *)(v2 + 56) + v17, (uint64_t)v24);
    uint64_t v18 = *(void *)(v4 + 48) + v16;
    long long v19 = v25[0];
    long long v20 = v25[1];
    *(void *)(v18 + 32) = v26;
    *(_OWORD *)uint64_t v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    id result = sub_209C23628(v24, (_OWORD *)(*(void *)(v4 + 56) + v17));
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_209C384A4(uint64_t a1)
{
  return a1 & ~(-1 << *(unsigned char *)(v1 + 32));
}

uint64_t sub_209C384D0()
{
  sub_209C4D608();
  sub_209C4D238();
  uint64_t v0 = sub_209C4D628();
  return sub_209C384A4(v0);
}

uint64_t sub_209C38534(uint64_t a1, uint64_t a2)
{
  v2[20] = a1;
  v2[21] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267601100);
  v2[22] = swift_task_alloc();
  v2[23] = swift_task_alloc();
  uint64_t v3 = sub_209C4C9A8();
  v2[24] = v3;
  v2[25] = *(void *)(v3 - 8);
  v2[26] = swift_task_alloc();
  v2[27] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_209C38644, 0, 0);
}

uint64_t sub_209C38644()
{
  uint64_t v1 = (uint64_t (*)())objc_msgSend(*(id *)(v0 + 168), sel_oneUpViewController);
  *(void *)(v0 + 224) = v1;
  if (v1)
  {
    *(void *)(v0 + 232) = sub_209C4D2C8();
    *(void *)(v0 + 240) = sub_209C4D2B8();
    uint64_t v4 = sub_209C4D298();
    uint64_t v6 = v5;
    uint64_t v1 = sub_209C38700;
    uint64_t v2 = v4;
    uint64_t v3 = v6;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA2498](v1, v2, v3);
}

uint64_t sub_209C38700()
{
  uint64_t v1 = *(void **)(v0 + 224);
  swift_release();
  *(void *)(v0 + 248) = objc_msgSend(v1, sel_browsingSession);

  return MEMORY[0x270FA2498](sub_209C3878C, 0, 0);
}

uint64_t sub_209C3878C()
{
  id v1 = objc_msgSend(*(id *)(v0 + 248), sel_viewModel);
  *(void *)(v0 + 144) = 0;
  *(void *)(v0 + 256) = v1;
  if (!v1 || (uint64_t v2 = v1, (v3 = objc_msgSend(v1, sel_assetsDataSource)) == 0))
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 200) + 56))(*(void *)(v0 + 184), 1, 1, *(void *)(v0 + 192));
LABEL_8:
    sub_209C1815C(*(void *)(v0 + 184), &qword_267601100);
    uint64_t v11 = 0;
    goto LABEL_9;
  }
  uint64_t v4 = v3;
  id v5 = objc_msgSend(v3, sel_lastItemIndexPath);

  if (v5)
  {
    sub_209C4C968();

    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = 1;
  }
  uint64_t v7 = *(void *)(v0 + 192);
  uint64_t v8 = *(void *)(v0 + 200);
  uint64_t v10 = *(void *)(v0 + 176);
  uint64_t v9 = *(void *)(v0 + 184);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56))(v10, v6, 1, v7);
  sub_209C3A1AC(v10, v9);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v9, 1, v7) == 1) {
    goto LABEL_8;
  }
  uint64_t v18 = *(void *)(v0 + 160);
  (*(void (**)(void, void, void))(*(void *)(v0 + 200) + 32))(*(void *)(v0 + 216), *(void *)(v0 + 184), *(void *)(v0 + 192));
  unint64_t v15 = (char *)sub_209C4C988();
  BOOL v19 = __OFSUB__(v15, v18);
  long long v20 = &v15[-v18];
  if (v19)
  {
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v21 = sub_209C4C998();
  MEMORY[0x210509310](v20, v21);
  id v22 = objc_msgSend(v2, sel_assetsDataSource);
  if (!v22
    || (int64_t v23 = v22,
        int64_t v24 = (void *)sub_209C4C958(),
        id v25 = objc_msgSend(v23, sel_assetReferenceAtIndexPath_, v24),
        v24,
        v23,
        !v25))
  {
    uint64_t v33 = *(void *)(v0 + 216);
    uint64_t v34 = *(void *)(v0 + 192);
    uint64_t v35 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 200) + 8);
    v35(*(void *)(v0 + 208), v34);
    v35(v33, v34);
    goto LABEL_20;
  }
  unint64_t v15 = (char *)objc_msgSend(v25, sel_pxAssetReference);
  if (!v15)
  {
LABEL_23:
    __break(1u);
    return MEMORY[0x270FA2498](v15, v16, v17);
  }
  uint64_t v26 = v15;
  uint64_t v28 = *(void *)(v0 + 208);
  uint64_t v27 = *(void *)(v0 + 216);
  uint64_t v29 = *(void *)(v0 + 192);
  uint64_t v30 = *(void *)(v0 + 200);
  id v31 = objc_msgSend(v15, sel_asset);

  unint64_t v32 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
  v32(v28, v29);
  v32(v27, v29);
  if (!v31)
  {
LABEL_20:
    uint64_t v11 = 0;
    goto LABEL_21;
  }
  self;
  uint64_t v11 = swift_dynamicCastObjCClass();
  if (!v11)
  {
    swift_unknownObjectRelease();
    goto LABEL_20;
  }
LABEL_21:
  *(void *)(v0 + 144) = v11;
LABEL_9:
  *(void *)(v0 + 264) = v11;
  *(void *)(v0 + 272) = sub_209C4CA78();
  sub_209C4CA68();
  sub_209C4CA48();
  swift_release();
  *(void *)(v0 + 280) = self;
  *(void *)(v0 + 288) = sub_209C4D2B8();
  uint64_t v12 = sub_209C4D298();
  uint64_t v14 = v13;
  unint64_t v15 = (char *)sub_209C38AFC;
  uint64_t v16 = v12;
  uint64_t v17 = v14;
  return MEMORY[0x270FA2498](v15, v16, v17);
}

uint64_t sub_209C38AFC()
{
  id v1 = *(void **)(v0 + 280);
  swift_release();
  *(void *)(v0 + 296) = objc_msgSend(v1, sel_px_sharedApplication);
  return MEMORY[0x270FA2498](sub_209C38B80, 0, 0);
}

uint64_t sub_209C38B80()
{
  id v1 = (void *)v0[37];
  uint64_t v2 = (void *)v0[33];
  v0[2] = v0;
  v0[7] = v0 + 39;
  v0[3] = sub_209C38C88;
  uint64_t v3 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_209C349E4;
  v0[13] = &block_descriptor;
  v0[14] = v3;
  objc_msgSend(v1, sel_px_navigateToMomentsViewRevealingAsset_completionHandler_, v2, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_209C38C88()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 304) = v1;
  if (v1) {
    uint64_t v2 = sub_209C39008;
  }
  else {
    uint64_t v2 = sub_209C38D98;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_209C38D98()
{
  uint64_t v19 = v0;
  uint64_t v1 = *(void **)(v0 + 264);
  char v2 = *(unsigned char *)(v0 + 312);

  if ((v2 & 1) == 0)
  {
    if (qword_2676005F8 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_209C4CAD8();
    __swift_project_value_buffer(v3, (uint64_t)qword_267602EE0);
    uint64_t v4 = sub_209C4CAB8();
    os_log_type_t v5 = sub_209C4D378();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      uint64_t v18 = v7;
      *(_DWORD *)uint64_t v6 = 136315138;
      swift_beginAccess();
      uint64_t v8 = *(void **)(v0 + 144);
      if (v8)
      {
        id v9 = objc_msgSend(v8, sel_localIdentifier);
        uint64_t v10 = sub_209C4D218();
        unint64_t v12 = v11;
      }
      else
      {
        uint64_t v10 = 0;
        unint64_t v12 = 0xE000000000000000;
      }
      *(void *)(v0 + 152) = sub_209C305B8(v10, v12, &v18);
      sub_209C4D3E8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2099F8000, v4, v5, "Failed to navigate to Photos App for asset %s", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21050C4E0](v7, -1, -1);
      MEMORY[0x21050C4E0](v6, -1, -1);
    }
  }
  uint64_t v14 = *(void **)(v0 + 248);
  uint64_t v13 = *(void **)(v0 + 256);
  sub_209C4CA68();
  sub_209C4CA58();
  swift_release();
  unint64_t v15 = *(void **)(v0 + 144);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
  return v16();
}

uint64_t sub_209C39008()
{
  uint64_t v1 = (void *)v0[37];
  uint64_t v3 = (void *)v0[32];
  char v2 = (void *)v0[33];
  uint64_t v4 = (void *)v0[31];
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  os_log_type_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_209C390D0(uint64_t a1, uint64_t a2)
{
  v3[48] = a2;
  v3[49] = v2;
  v3[47] = a1;
  return MEMORY[0x270FA2498](sub_209C390F4, 0, 0);
}

uint64_t sub_209C390F4()
{
  uint64_t v1 = *(void **)(v0 + 376);
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 384);
    id v3 = v1;
    id v4 = objc_msgSend(v3, sel_currentAssetIndexFromEnd);
    uint64_t v5 = (uint64_t)v4;
    if (v2 == 4)
    {
      uint64_t v6 = (void *)swift_task_alloc();
      *(void *)(v0 + 400) = v6;
      *uint64_t v6 = v0;
      v6[1] = sub_209C39768;
      return sub_209C38534(v5, (uint64_t)v3);
    }
    else
    {
      id v33 = v4;
      id v9 = objc_allocWithZone(MEMORY[0x263F08D38]);
      uint64_t v10 = (void *)sub_209C4D208();
      id v11 = objc_msgSend(v9, sel_initWithActivityType_, v10);
      *(void *)(v0 + 416) = v11;

      id v12 = objc_msgSend(v11, sel_userInfo);
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = MEMORY[0x263F8D310];
        uint64_t v15 = sub_209C4D1A8();

        *(void *)(v0 + 328) = 0x6974634172657375;
        *(void *)(v0 + 336) = 0xEA00000000006E6FLL;
        sub_209C4D478();
        *(void *)(v0 + 224) = v14;
        *(void *)(v0 + 200) = 0x6F526172656D6163;
        *(void *)(v0 + 208) = 0xEA00000000006C6CLL;
        sub_209C23628((_OWORD *)(v0 + 200), (_OWORD *)(v0 + 296));
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        sub_209C37F68((_OWORD *)(v0 + 296), v0 + 56, isUniquelyReferenced_nonNull_native);
        swift_bridgeObjectRelease();
        sub_209C39F9C(v0 + 56);
        if (v15)
        {
          uint64_t v17 = (void *)sub_209C4D198();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v17 = 0;
        }
        objc_msgSend(v11, sel_setUserInfo_, v17);
      }
      else
      {
        objc_msgSend(v11, sel_setUserInfo_, 0);
        swift_bridgeObjectRelease();
      }
      id v18 = objc_msgSend(v11, sel_userInfo);
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = sub_209C4D1A8();

        *(void *)(v0 + 344) = 0x6F526172656D6163;
        *(void *)(v0 + 352) = 0xEF7865646E496C6CLL;
        sub_209C4D478();
        *(void *)(v0 + 256) = MEMORY[0x263F8D6C8];
        *(void *)(v0 + 232) = v33;
        sub_209C23628((_OWORD *)(v0 + 232), (_OWORD *)(v0 + 264));
        char v21 = swift_isUniquelyReferenced_nonNull_native();
        sub_209C37F68((_OWORD *)(v0 + 264), v0 + 96, v21);
        swift_bridgeObjectRelease();
        sub_209C39F9C(v0 + 96);
        if (v20)
        {
          id v22 = (void *)sub_209C4D198();
          swift_bridgeObjectRelease();
        }
        else
        {
          id v22 = 0;
        }
        objc_msgSend(v11, sel_setUserInfo_, v22);
      }
      else
      {
        objc_msgSend(v11, sel_setUserInfo_, 0);
        swift_bridgeObjectRelease();
      }
      id v23 = objc_msgSend(v11, sel_userInfo);
      if (v23)
      {
        int64_t v24 = v23;
        uint64_t v25 = *(void *)(v0 + 384);
        uint64_t v26 = sub_209C4D1A8();

        *(void *)(v0 + 360) = 0xD000000000000014;
        *(void *)(v0 + 368) = 0x8000000209C965D0;
        uint64_t v27 = MEMORY[0x263F8D310];
        sub_209C4D478();
        switch(v25)
        {
          case 3:
            unint64_t v28 = 0xE500000000000000;
            uint64_t v29 = 0x6572616873;
            break;
          case 2:
            unint64_t v28 = 0xE400000000000000;
            uint64_t v29 = 1970169197;
            break;
          case 1:
            unint64_t v28 = 0xE400000000000000;
            uint64_t v29 = 1953064037;
            break;
          default:
            uint64_t v29 = 0;
            unint64_t v28 = 0xE000000000000000;
            break;
        }
        *(void *)(v0 + 192) = v27;
        *(void *)(v0 + 168) = v29;
        *(void *)(v0 + 176) = v28;
        sub_209C23628((_OWORD *)(v0 + 168), (_OWORD *)(v0 + 136));
        char v30 = swift_isUniquelyReferenced_nonNull_native();
        sub_209C37F68((_OWORD *)(v0 + 136), v0 + 16, v30);
        swift_bridgeObjectRelease();
        sub_209C39F9C(v0 + 16);
        if (v26)
        {
          id v31 = (void *)sub_209C4D198();
          swift_bridgeObjectRelease();
        }
        else
        {
          id v31 = 0;
        }
        objc_msgSend(v11, sel_setUserInfo_, v31);
      }
      else
      {
        objc_msgSend(v11, sel_setUserInfo_, 0);
        swift_bridgeObjectRelease();
      }
      unint64_t v32 = (void *)swift_task_alloc();
      *(void *)(v0 + 424) = v32;
      void *v32 = v0;
      v32[1] = sub_209C39944;
      return MEMORY[0x270EF5640](v11);
    }
  }
  else
  {
    uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
    return v8();
  }
}

uint64_t sub_209C39768()
{
  *(void *)(*(void *)v1 + 408) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_209C398E0;
  }
  else {
    uint64_t v2 = sub_209C3987C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_209C3987C()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_209C398E0()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_209C39944()
{
  *(void *)(*(void *)v1 + 432) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_209C39AC4;
  }
  else {
    uint64_t v2 = sub_209C39A58;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_209C39A58()
{
  uint64_t v1 = *(void **)(v0 + 376);

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_209C39AC4()
{
  uint64_t v1 = *(void **)(v0 + 376);

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_209C39B30()
{
  *(void *)(v1 + 136) = v0;
  return MEMORY[0x270FA2498](sub_209C39B50, 0, 0);
}

uint64_t sub_209C39B50()
{
  id v1 = objc_allocWithZone(MEMORY[0x263F08D38]);
  uint64_t v2 = (void *)sub_209C4D208();
  id v3 = objc_msgSend(v1, sel_initWithActivityType_, v2);
  *(void *)(v0 + 144) = v3;

  id v4 = objc_msgSend(v3, sel_userInfo);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = sub_209C4D1A8();

    *(void *)(v0 + 120) = 0x6974634172657375;
    *(void *)(v0 + 128) = 0xEA00000000006E6FLL;
    uint64_t v7 = MEMORY[0x263F8D310];
    sub_209C4D478();
    *(void *)(v0 + 56) = 0xD000000000000010;
    *(void *)(v0 + 80) = v7;
    *(void *)(v0 + 64) = 0x8000000209C965B0;
    sub_209C23628((_OWORD *)(v0 + 56), (_OWORD *)(v0 + 88));
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_209C37F68((_OWORD *)(v0 + 88), v0 + 16, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    sub_209C39F9C(v0 + 16);
    if (v6)
    {
      id v9 = (void *)sub_209C4D198();
      swift_bridgeObjectRelease();
    }
    else
    {
      id v9 = 0;
    }
    objc_msgSend(v3, sel_setUserInfo_, v9);
  }
  else
  {
    objc_msgSend(v3, sel_setUserInfo_, 0);
    swift_bridgeObjectRelease();
  }
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_209C39DC0;
  return MEMORY[0x270EF5640](v3);
}

uint64_t sub_209C39DC0()
{
  *(void *)(*(void *)v1 + 160) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_209C39F38;
  }
  else {
    uint64_t v2 = sub_209C39ED4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_209C39ED4()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_209C39F38()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_209C39F9C(uint64_t a1)
{
  return a1;
}

uint64_t sub_209C39FF0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_209C3A04C()
{
  _Block_release(*(const void **)(v0 + 40));
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_209C3A09C()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)v0[5];
  uint64_t v6 = (void *)v0[6];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_209C14E64;
  uint64_t v8 = (uint64_t (*)(void *, void *, uint64_t, void *, void *))((char *)&dword_2676010D0 + dword_2676010D0);
  return v8(v2, v3, v4, v5, v6);
}

uint64_t objectdestroy_10Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_209C3A1AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267601100);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_209C3A214()
{
  unint64_t result = qword_267601110;
  if (!qword_267601110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267601110);
  }
  return result;
}

uint64_t sub_209C3A268()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267601118);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v6 + 8, v5);
}

uint64_t sub_209C3A354(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267601118) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  uint64_t v9 = *(void *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_209C3407C;
  return sub_209C35228(a1, v6, v7, v8, v9);
}

uint64_t sub_209C3A47C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_209C4D2F8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_209C4D2E8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_209C1815C(a1, &qword_267600CD8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_209C4D298();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_209C3A628()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267601178);
  __swift_allocate_value_buffer(v0, qword_267603010);
  __swift_project_value_buffer(v0, (uint64_t)qword_267603010);
  return sub_209C4CCB8();
}

uint64_t sub_209C3A690(uint64_t a1)
{
  return sub_209C3A7B0(a1, qword_267603028);
}

uint64_t sub_209C3A6BC(uint64_t a1)
{
  return sub_209C3A7B0(a1, qword_267603040);
}

uint64_t sub_209C3A6E0()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267601170);
  __swift_allocate_value_buffer(v0, qword_267603058);
  __swift_project_value_buffer(v0, (uint64_t)qword_267603058);
  return sub_209C4CD28();
}

uint64_t sub_209C3A790(uint64_t a1)
{
  return sub_209C3A7B0(a1, qword_267603070);
}

uint64_t sub_209C3A7B0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600C60);
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_209C4CD28();
}

uint64_t sub_209C3A854@<X0>(uint64_t *a1@<X8>)
{
  id v33 = a1;
  uint64_t v1 = sub_209C4C828();
  uint64_t v31 = *(void *)(v1 - 8);
  uint64_t v32 = v1;
  MEMORY[0x270FA5388](v1);
  char v30 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676011D0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v34 = v3;
  uint64_t v35 = v4;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676011D8);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676011E0);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676011E8);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v28 = v15;
  uint64_t v29 = v16;
  MEMORY[0x270FA5388](v15);
  id v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_209C184B8(&qword_2676011F0, &qword_2676011D8);
  sub_209C4C848();
  swift_getKeyPath();
  sub_209C4C808();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_getKeyPath();
  sub_209C184B8(&qword_2676011F8, &qword_2676011E0);
  sub_209C4C808();
  swift_release();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  uint64_t v36 = 5;
  sub_209C4C838();
  uint64_t v20 = v30;
  uint64_t v19 = v31;
  uint64_t v21 = v32;
  (*(void (**)(char *, void, uint64_t))(v31 + 104))(v30, *MEMORY[0x263F06BA0], v32);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_267601200);
  id v23 = v33;
  v33[3] = v22;
  v23[4] = sub_209C3D7B0();
  __swift_allocate_boxed_opaque_existential_1(v23);
  sub_209C184B8(&qword_267601230, &qword_2676011E8);
  sub_209C184B8(&qword_267601238, &qword_2676011D0);
  uint64_t v24 = v28;
  uint64_t v25 = v34;
  sub_209C4C818();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v21);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v6, v25);
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v18, v24);
}

uint64_t sub_209C3AD40@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600C70);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = &v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600C78);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = &v11[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_209C184B8(&qword_267600C80, &qword_267600C78);
  sub_209C4C848();
  v11[15] = 0;
  sub_209C4C838();
  a1[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_267600C88);
  a1[4] = sub_209C25C34();
  __swift_allocate_boxed_opaque_existential_1(a1);
  sub_209C184B8(&qword_267600CA8, &qword_267600C70);
  sub_209C4C7F8();
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_209C3AF80@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  v16[1] = a1;
  uint64_t v3 = sub_209C4C828();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267601190);
  uint64_t v7 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267601198);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_209C184B8(&qword_2676011A0, &qword_267601198);
  sub_209C4C848();
  uint64_t v18 = 1;
  sub_209C4C838();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F06BA0], v3);
  a2[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_2676011A8);
  a2[4] = sub_209C3D5D0();
  __swift_allocate_boxed_opaque_existential_1(a2);
  sub_209C184B8(&qword_2676011C8, &qword_267601190);
  uint64_t v14 = v17;
  sub_209C4C818();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v14);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t sub_209C3B284()
{
  uint64_t v0 = (void *)sub_209C4D208();
  uint64_t v1 = (void *)sub_209C4D208();
  id v2 = CAMLocalizedFrameworkString(v0, v1);

  sub_209C4D218();
  sub_209C17CC0();
  return sub_209C4D038();
}

uint64_t sub_209C3B340()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600C50);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_209C4CBE8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600C58);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_209C4CBF8();
  uint64_t v12 = MEMORY[0x263F1C008];
  MEMORY[0x210509540](v7, v4, MEMORY[0x263F1C008]);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v16 = v4;
  uint64_t v17 = v12;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  MEMORY[0x210509560](v11, v8, OpaqueTypeConformance2);
  uint64_t v16 = v8;
  uint64_t v17 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v14 = sub_209C4CBB8();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v14;
}

uint64_t sub_209C3B7F8()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600CD8);
  uint64_t result = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = OBJC_IVAR___CAMSystemOverlayTipManager_tipObservationTask;
  if (!*(void *)(v0 + OBJC_IVAR___CAMSystemOverlayTipManager_tipObservationTask))
  {
    swift_unknownObjectWeakAssign();
    swift_unknownObjectWeakAssign();
    uint64_t v7 = sub_209C4D2F8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v5, 1, 1, v7);
    uint64_t v8 = swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_209C4D2C8();
    sub_209C4C718();
    uint64_t v9 = sub_209C4D2B8();
    uint64_t v10 = (void *)swift_allocObject();
    uint64_t v11 = MEMORY[0x263F8F500];
    v10[2] = v9;
    v10[3] = v11;
    v10[4] = v8;
    swift_release();
    *(void *)(v1 + v6) = sub_209C3A47C((uint64_t)v5, (uint64_t)&unk_267601250, (uint64_t)v10);
    return swift_release();
  }
  return result;
}

uint64_t sub_209C3B994(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[16] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267600CF0);
  v4[17] = swift_task_alloc();
  uint64_t v5 = sub_209C4CD08();
  v4[18] = v5;
  v4[19] = *(void *)(v5 - 8);
  v4[20] = swift_task_alloc();
  v4[21] = __swift_instantiateConcreteTypeFromMangledName(&qword_267600CF8);
  v4[22] = swift_task_alloc();
  v4[23] = __swift_instantiateConcreteTypeFromMangledName(&qword_267600D00);
  v4[24] = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600D08);
  v4[25] = v6;
  v4[26] = *(void *)(v6 - 8);
  v4[27] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600D10);
  v4[28] = v7;
  v4[29] = *(void *)(v7 - 8);
  v4[30] = swift_task_alloc();
  v4[31] = swift_task_alloc();
  v4[32] = sub_209C4D2C8();
  v4[33] = sub_209C4D2B8();
  uint64_t v9 = sub_209C4D298();
  v4[34] = v9;
  v4[35] = v8;
  return MEMORY[0x270FA2498](sub_209C3BBF4, v9, v8);
}

uint64_t sub_209C3BBF4()
{
  uint64_t v1 = v0[16] + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x21050C5A0](v1);
  v0[36] = v2;
  if (v2)
  {
    uint64_t v3 = OBJC_IVAR___CAMSystemOverlayTipManager_menuTip;
    v0[37] = OBJC_IVAR___CAMSystemOverlayTipManager_menuTip;
    uint64_t v4 = (uint64_t *)(v2 + v3);
    uint64_t v6 = *v4;
    uint64_t v5 = v4[1];
    v0[14] = v6;
    uint64_t v7 = v0[26];
    uint64_t v8 = v0[27];
    uint64_t v9 = v0[25];
    v0[15] = v5;
    v0[38] = sub_209C3DA7C();
    sub_209C4CB08();
    MEMORY[0x210509E50](v9);
    sub_209C184B8(&qword_267600D18, &qword_267600CF8);
    sub_209C4D318();
    sub_209C4D4D8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
    sub_209C4D4E8();
    uint64_t v10 = OBJC_IVAR___CAMSystemOverlayTipManager_sourceItem;
    v0[39] = OBJC_IVAR___CAMSystemOverlayTipManager_viewController;
    v0[40] = v10;
    v0[41] = OBJC_IVAR___CAMSystemOverlayTipManager_isPortraitOrientation;
    uint64_t v11 = sub_209C4D2B8();
    v0[42] = v11;
    if (v11)
    {
      swift_getObjectType();
      uint64_t v12 = sub_209C4D298();
      uint64_t v14 = v13;
    }
    else
    {
      uint64_t v12 = 0;
      uint64_t v14 = 0;
    }
    v0[43] = v12;
    v0[44] = v14;
    return MEMORY[0x270FA2498](sub_209C3BE84, v12, v14);
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v15 = (uint64_t (*)(void))v0[1];
    return v15();
  }
}

uint64_t sub_209C3BE84()
{
  uint64_t v1 = v0[42];
  v0[45] = sub_209C4D4C8();
  sub_209C184B8(&qword_267600D20, &qword_267600D00);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[46] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_209C3BF80;
  uint64_t v3 = v0[17];
  uint64_t v4 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v3, v1, v4);
}

uint64_t sub_209C3BF80()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 344);
    uint64_t v4 = *(void *)(v2 + 352);
    uint64_t v5 = sub_209C24F90;
  }
  else
  {
    (*(void (**)(void))(v2 + 360))();
    uint64_t v3 = *(void *)(v2 + 344);
    uint64_t v4 = *(void *)(v2 + 352);
    uint64_t v5 = sub_209C3C0A8;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_209C3C0A8()
{
  uint64_t v1 = v0[18];
  uint64_t v2 = v0[19];
  uint64_t v3 = v0[17];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_209C1815C(v3, &qword_267600CF0);
    swift_release();
    uint64_t v4 = v0[34];
    uint64_t v5 = v0[35];
    return MEMORY[0x270FA2498](sub_209C253D4, v4, v5);
  }
  else
  {
    uint64_t v7 = v0[30];
    uint64_t v6 = v0[31];
    uint64_t v8 = v0[28];
    uint64_t v9 = v0[29];
    (*(void (**)(void, uint64_t, uint64_t))(v2 + 32))(v0[20], v3, v1);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v7, v6, v8);
    uint64_t v10 = (int *)sub_209C4D4D8();
    v0[47] = v11;
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    uint64_t v15 = (int *)((char *)v10 + *v10);
    uint64_t v12 = (void *)swift_task_alloc();
    v0[48] = v12;
    void *v12 = v0;
    v12[1] = sub_209C3C2A4;
    uint64_t v13 = v0[20];
    return ((uint64_t (*)(void *, uint64_t))v15)(v0 + 49, v13);
  }
}

uint64_t sub_209C3C2A4()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 160);
  uint64_t v3 = *(void *)(*v0 + 152);
  uint64_t v4 = *(void *)(*v0 + 144);
  swift_task_dealloc();
  swift_release();
  *(unsigned char *)(v1 + 393) = *(unsigned char *)(v1 + 392);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  uint64_t v5 = *(void *)(v1 + 352);
  uint64_t v6 = *(void *)(v1 + 344);
  return MEMORY[0x270FA2498](sub_209C3C450, v6, v5);
}

uint64_t sub_209C3C450()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 272);
  uint64_t v2 = *(void *)(v0 + 280);
  return MEMORY[0x270FA2498](sub_209C3C4B4, v1, v2);
}

uint64_t sub_209C3C4B4()
{
  uint64_t v1 = MEMORY[0x21050C5A0](*(void *)(v0 + 288) + *(void *)(v0 + 312));
  if (v1)
  {
    uint64_t v2 = (void *)v1;
    uint64_t v3 = MEMORY[0x21050C5A0](*(void *)(v0 + 288) + *(void *)(v0 + 320));
    if (v3)
    {
      uint64_t v4 = (void *)v3;
      if ((*(unsigned char *)(v0 + 393) & 1) != 0 && (uint64_t v5 = *(void *)(v0 + 288), *(unsigned char *)(v5 + *(void *)(v0 + 328)) == 1))
      {
        uint64_t v6 = *(void *)(v0 + 304);
        uint64_t v7 = (uint64_t *)(v5 + *(void *)(v0 + 296));
        sub_209C4CB58();
        uint64_t v9 = *v7;
        uint64_t v8 = v7[1];
        *(void *)(v0 + 40) = &type metadata for MenuTip;
        *(void *)(v0 + 48) = v6;
        *(void *)(v0 + 16) = v9;
        *(void *)(v0 + 24) = v8;
        sub_209C4C708();
        id v10 = v4;
        uint64_t v11 = (void *)sub_209C4CB68();
        objc_msgSend(v2, sel_presentViewController_animated_completion_, v11, 1, 0);
      }
      else
      {
        id v12 = objc_msgSend(v2, sel_presentedViewController);
        if (v12)
        {
          uint64_t v13 = v12;
          sub_209C4CB58();
          uint64_t v14 = swift_dynamicCastClass();

          if (v14) {
            objc_msgSend(v2, sel_dismissViewControllerAnimated_completion_, 1, 0);
          }
        }
      }
    }
  }
  uint64_t v15 = sub_209C4D2B8();
  *(void *)(v0 + 336) = v15;
  if (v15)
  {
    swift_getObjectType();
    uint64_t v16 = sub_209C4D298();
    uint64_t v18 = v17;
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v18 = 0;
  }
  *(void *)(v0 + 344) = v16;
  *(void *)(v0 + 352) = v18;
  return MEMORY[0x270FA2498](sub_209C3BE84, v16, v18);
}

uint64_t sub_209C3C708()
{
  uint64_t v1 = OBJC_IVAR___CAMSystemOverlayTipManager_tipObservationTask;
  if (*(void *)(v0 + OBJC_IVAR___CAMSystemOverlayTipManager_tipObservationTask))
  {
    sub_209C4C718();
    sub_209C4D308();
    swift_release();
  }
  *(void *)(v0 + v1) = 0;
  swift_release();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectWeakAssign();
}

void sub_209C3C894()
{
  uint64_t v1 = sub_209C4CC28();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void *)(v0 + OBJC_IVAR___CAMSystemOverlayTipManager_menuTip);
  uint64_t v6 = *(void *)(v0 + OBJC_IVAR___CAMSystemOverlayTipManager_menuTip + 8);
  v13[0] = v5;
  v13[1] = v6;
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F1C018], v1);
  sub_209C3DA7C();
  sub_209C4C708();
  sub_209C4CAF8();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend((id)BiomeLibrary(), sel_Discoverability);
  swift_unknownObjectRelease();
  id v8 = objc_msgSend(v7, sel_Signals);
  swift_unknownObjectRelease();
  id v9 = objc_allocWithZone(MEMORY[0x263F2A0D8]);
  id v10 = (void *)sub_209C4D208();
  id v11 = objc_msgSend(v9, sel_initWithContentIdentifier_context_osBuild_userInfo_, v10, 0, 0, 0);

  id v12 = objc_msgSend(v8, sel_source);
  objc_msgSend(v12, sel_sendEvent_, v11);
}

void sub_209C3CC14(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  uint64_t v6 = *a4;
  id v7 = a1;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600C60);
  __swift_project_value_buffer(v8, a5);
  swift_beginAccess();
  sub_209C4CD18();
  swift_endAccess();
}

uint64_t type metadata accessor for SystemOverlayTipManager()
{
  return self;
}

ValueMetadata *type metadata accessor for MenuTip()
{
  return &type metadata for MenuTip;
}

unint64_t sub_209C3CE74()
{
  unint64_t result = qword_267601168;
  if (!qword_267601168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267601168);
  }
  return result;
}

uint64_t sub_209C3CEC8()
{
  uint64_t v0 = (void *)sub_209C4D208();
  uint64_t v1 = (void *)sub_209C4D208();
  id v2 = CAMLocalizedFrameworkString(v0, v1);

  sub_209C4D218();
  sub_209C17CC0();
  return sub_209C4D038();
}

uint64_t sub_209C3CF78()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267601170);
  uint64_t v21 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v20 = (char *)v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600C60);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267601178);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267600C68);
  sub_209C4CC78();
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_209C7E1A0;
  v19[1] = v10;
  if (qword_267600670 != -1) {
    swift_once();
  }
  uint64_t v11 = __swift_project_value_buffer(v6, (uint64_t)qword_267603010);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v11, v6);
  sub_209C4CB98();
  sub_209C3D58C(&qword_267601180);
  sub_209C3D58C(&qword_267601188);
  sub_209C4CC88();
  if (qword_267600678 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v2, (uint64_t)qword_267603028);
  swift_beginAccess();
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v13(v5, v12, v2);
  sub_209C4CC98();
  if (qword_267600680 != -1) {
    swift_once();
  }
  uint64_t v14 = __swift_project_value_buffer(v2, (uint64_t)qword_267603040);
  swift_beginAccess();
  v13(v5, v14, v2);
  sub_209C4CC98();
  if (qword_267600688 != -1) {
    swift_once();
  }
  uint64_t v15 = __swift_project_value_buffer(v0, (uint64_t)qword_267603058);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v20, v15, v0);
  sub_209C4CC98();
  if (qword_267600690 != -1) {
    swift_once();
  }
  uint64_t v16 = __swift_project_value_buffer(v2, (uint64_t)qword_267603070);
  swift_beginAccess();
  v13(v5, v16, v2);
  sub_209C4CC98();
  sub_209C4C708();
  swift_bridgeObjectRelease();
  uint64_t v17 = sub_209C4C708();
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_209C3D58C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_209C4CB98();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_209C3D5D0()
{
  unint64_t result = qword_2676011B0;
  if (!qword_2676011B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2676011A8);
    sub_209C184B8(&qword_2676011B8, &qword_267601198);
    sub_209C3D690(&qword_2676011C0, &qword_267601190);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2676011B0);
  }
  return result;
}

uint64_t sub_209C3D690(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_209C3D700()
{
  return sub_209C3D58C(&qword_267601180);
}

uint64_t sub_209C3D734()
{
  return sub_209C3D58C(&qword_267601188);
}

uint64_t sub_209C3D768@<X0>(uint64_t *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267601178);
  uint64_t result = sub_209C4CCC8();
  *a1 = result;
  return result;
}

uint64_t sub_209C3D7A0@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(*(void *)result + 16);
  return result;
}

unint64_t sub_209C3D7B0()
{
  unint64_t result = qword_267601208;
  if (!qword_267601208)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267601200);
    sub_209C3D850();
    sub_209C184B8(&qword_267601228, &qword_2676011D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267601208);
  }
  return result;
}

unint64_t sub_209C3D850()
{
  unint64_t result = qword_267601210;
  if (!qword_267601210)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2676011E8);
    sub_209C3D8C4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267601210);
  }
  return result;
}

unint64_t sub_209C3D8C4()
{
  unint64_t result = qword_267601218;
  if (!qword_267601218)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2676011E0);
    sub_209C184B8(&qword_267601220, &qword_2676011D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267601218);
  }
  return result;
}

unint64_t sub_209C3DA7C()
{
  unint64_t result = qword_267601240;
  if (!qword_267601240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_267601240);
  }
  return result;
}

uint64_t sub_209C3DAD0()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_209C3DB08()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_209C3DB48(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_209C14E64;
  return sub_209C3B994(a1, v4, v5, v6);
}

uint64_t sub_209C3DBFC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_209C3DC34(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_209C14E64;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_267601258 + dword_267601258);
  return v6(a1, v4);
}

uint64_t sub_209C3DCEC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_209C4CD68();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_209C3DD60()
{
  return sub_209C3DD88();
}

uint64_t sub_209C3DD74()
{
  return sub_209C3DD88();
}

uint64_t sub_209C3DD88()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_209C4CD68();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_209C3DDF4(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xD000000000000011;
  unint64_t v3 = 0x8000000209C94D20;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v5 = 0xD000000000000016;
    }
    else {
      unint64_t v5 = 7105633;
    }
    if (v4 == 1) {
      unint64_t v6 = 0x8000000209C94D40;
    }
    else {
      unint64_t v6 = 0xE300000000000000;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  unint64_t v5 = 0xD000000000000011;
  unint64_t v6 = 0x8000000209C94D20;
  int v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1) {
      unint64_t v2 = 0xD000000000000016;
    }
    else {
      unint64_t v2 = 7105633;
    }
    if (v7 == 1) {
      unint64_t v3 = 0x8000000209C94D40;
    }
    else {
      unint64_t v3 = 0xE300000000000000;
    }
  }
LABEL_15:
  if (v5 == v2 && v6 == v3) {
    char v8 = 1;
  }
  else {
    char v8 = sub_209C4D588();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_209C3DEEC(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 1701736302;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 1701736302;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x74726F6873;
      break;
    case 2:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x6D756964656DLL;
      break;
    case 3:
      uint64_t v5 = 1735290732;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE500000000000000;
      if (v5 == 0x74726F6873) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v6 = 0xE600000000000000;
      uint64_t v2 = 0x6D756964656DLL;
      goto LABEL_9;
    case 3:
      if (v5 == 1735290732) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_209C4D588();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_209C3E044(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x746E6F7266;
  }
  else {
    uint64_t v3 = 1801675106;
  }
  if (v2) {
    unint64_t v4 = 0xE400000000000000;
  }
  else {
    unint64_t v4 = 0xE500000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x746E6F7266;
  }
  else {
    uint64_t v5 = 1801675106;
  }
  if (a2) {
    unint64_t v6 = 0xE500000000000000;
  }
  else {
    unint64_t v6 = 0xE400000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_209C4D588();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_209C3E0E0()
{
  return sub_209C4D628();
}

uint64_t sub_209C3E184()
{
  return sub_209C4D628();
}

uint64_t sub_209C3E224()
{
  uint64_t v101 = sub_209C4C9B8();
  uint64_t v0 = *(void *)(v101 - 8);
  MEMORY[0x270FA5388](v101);
  id v99 = (char *)&v95 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = (uint8_t *)sub_209C4C9D8();
  uint64_t v2 = *((void *)v100 - 1);
  uint64_t v3 = MEMORY[0x270FA5388](v100);
  uint64_t v97 = (char *)&v95 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v98 = (char *)&v95 - v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v104 = (char *)&v95 - v7;
  uint64_t v102 = (void *)sub_209C4C9E8();
  uint64_t v8 = *(v102 - 1);
  uint64_t v9 = MEMORY[0x270FA5388](v102);
  uint64_t v95 = (void (*)(char *, char *, uint8_t *))((char *)&v95 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v95 - v11;
  uint64_t v13 = sub_209C4CA08();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v95 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = sub_209C4CA38();
  uint64_t v103 = *(void *)(v105 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v105);
  uint64_t v96 = (char *)&v95 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v107 = (char *)&v95 - v19;
  uint64_t v20 = (__CFString *)sub_209C4D208();
  uint64_t v21 = (__CFString *)sub_209C4D208();
  CFPropertyListRef v22 = CFPreferencesCopyAppValue(v20, v21);

  if (v22)
  {
    uint64_t v109 = (uint64_t)v22;
    if (swift_dynamicCast())
    {
      unint64_t v23 = sub_209C4D568();
      swift_bridgeObjectRelease();
      if (v23 <= 2)
      {
        uint64_t v24 = v106;
        *(unsigned char *)(v106 + 24) = v23;
        goto LABEL_43;
      }
    }
  }
  sub_209C4C9F8();
  uint64_t v25 = v107;
  sub_209C4CA28();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  sub_209C4CA18();
  uint64_t v26 = v102;
  int v27 = (*(uint64_t (**)(char *, void *))(v8 + 88))(v12, v102);
  if (v27 == *MEMORY[0x263F40F98])
  {
    (*(void (**)(char *, void *))(v8 + 96))(v12, v26);
    uint64_t v28 = v104;
    uint64_t v29 = v12;
    char v30 = v100;
    (*(void (**)(char *, char *, uint8_t *))(v2 + 32))(v104, v29, v100);
    uint64_t v31 = sub_209C4C9C8();
    uint64_t v32 = *MEMORY[0x263F40FC0];
    uint64_t v33 = (uint64_t)v99;
    uint64_t v34 = v2;
    uint64_t v35 = v101;
    uint64_t v102 = *(void **)(v0 + 104);
    ((void (*)(char *, uint64_t, uint64_t))v102)(v99, v32, v101);
    char v36 = sub_209C3FEC8(v33, v31);
    uint64_t v37 = v33;
    swift_bridgeObjectRelease();
    long long v38 = *(void (**)(uint64_t, uint64_t))(v0 + 8);
    uint64_t v96 = (char *)(v0 + 8);
    v38(v37, v35);
    long long v39 = v98;
    uint64_t v95 = *(void (**)(char *, char *, uint8_t *))(v34 + 16);
    v95(v98, v28, v30);
    if (v36)
    {
      uint64_t v40 = *(void (**)(char *, uint8_t *))(v34 + 8);
      v40(v39, v30);
      unsigned int v41 = v104;
LABEL_16:
      int HasCompletedInitialRun = BYSetupAssistantHasCompletedInitialRun();
      uint64_t v52 = v105;
      if (qword_2676005F8 != -1) {
        swift_once();
      }
      uint64_t v53 = sub_209C4CAD8();
      __swift_project_value_buffer(v53, (uint64_t)qword_267602EE0);
      os_log_type_t v54 = sub_209C4D398();
      uint64_t v55 = sub_209C4CAB8();
      if (os_log_type_enabled(v55, v54))
      {
        uint64_t v56 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v56 = 67109120;
        LODWORD(v108) = HasCompletedInitialRun;
        sub_209C4D3E8();
        _os_log_impl(&dword_2099F8000, v55, v54, "Buddy - generative model assets not ready, initial run completed: %{BOOL}d", v56, 8u);
        MEMORY[0x21050C4E0](v56, -1, -1);
      }

      v40(v41, v30);
      (*(void (**)(char *, uint64_t))(v103 + 8))(v107, v52);
LABEL_27:
      if (HasCompletedInitialRun) {
        char v62 = 1;
      }
      else {
        char v62 = 2;
      }
      uint64_t v24 = v106;
      *(unsigned char *)(v106 + 24) = v62;
      goto LABEL_43;
    }
    uint64_t v48 = v37;
    uint64_t v49 = sub_209C4C9C8();
    ((void (*)(uint64_t, void, uint64_t))v102)(v48, *MEMORY[0x263F40FE0], v35);
    char v50 = sub_209C3FEC8(v48, v49);
    swift_bridgeObjectRelease();
    v38(v48, v35);
    uint64_t v40 = *(void (**)(char *, uint8_t *))(v34 + 8);
    v40(v39, v30);
    if (v50)
    {
      unsigned int v41 = v104;
      goto LABEL_16;
    }
    uint64_t v63 = v104;
    if (qword_2676005F8 != -1) {
      swift_once();
    }
    uint64_t v64 = sub_209C4CAD8();
    __swift_project_value_buffer(v64, (uint64_t)qword_267602EE0);
    os_log_type_t v65 = sub_209C4D398();
    uint64_t v66 = v97;
    v95(v97, v63, v30);
    uint64_t v67 = sub_209C4CAB8();
    os_log_type_t v68 = v65;
    if (os_log_type_enabled(v67, v65))
    {
      uint64_t v69 = (uint8_t *)swift_slowAlloc();
      uint64_t v102 = (void *)swift_slowAlloc();
      uint64_t v108 = v102;
      *(_DWORD *)uint64_t v69 = 136315138;
      id v99 = (char *)(v69 + 4);
      sub_209C4C9C8();
      sub_209C4215C(&qword_2676012F0, MEMORY[0x263F40FE8]);
      char v70 = v30;
      uint64_t v71 = sub_209C4D348();
      unint64_t v73 = v72;
      swift_bridgeObjectRelease();
      uint64_t v109 = sub_209C305B8(v71, v73, (uint64_t *)&v108);
      sub_209C4D3E8();
      swift_bridgeObjectRelease();
      v40(v97, v70);
      _os_log_impl(&dword_2099F8000, v67, v68, "Buddy - generative model restricted for reasons: %s", v69, 0xCu);
      uint64_t v74 = v102;
      swift_arrayDestroy();
      MEMORY[0x21050C4E0](v74, -1, -1);
      MEMORY[0x21050C4E0](v69, -1, -1);

      uint64_t v75 = v104;
      uint64_t v76 = v70;
    }
    else
    {

      v40(v66, v30);
      uint64_t v75 = v63;
      uint64_t v76 = v30;
    }
    v40(v75, v76);
    (*(void (**)(char *, uint64_t))(v103 + 8))(v107, v105);
    uint64_t v24 = v106;
    *(unsigned char *)(v106 + 24) = 0;
  }
  else if (v27 == *MEMORY[0x263F40FA8])
  {
    uint64_t v42 = v105;
    if (qword_2676005F8 != -1) {
      swift_once();
    }
    uint64_t v43 = sub_209C4CAD8();
    __swift_project_value_buffer(v43, (uint64_t)qword_267602EE0);
    os_log_type_t v44 = sub_209C4D398();
    unint64_t v45 = sub_209C4CAB8();
    os_log_type_t v46 = v44;
    if (os_log_type_enabled(v45, v44))
    {
      uint64_t v47 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v47 = 0;
      _os_log_impl(&dword_2099F8000, v45, v46, "Buddy - generative model unavailable", v47, 2u);
      MEMORY[0x21050C4E0](v47, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v103 + 8))(v25, v42);
    uint64_t v24 = v106;
    *(unsigned char *)(v106 + 24) = 0;
    (*(void (**)(char *, void *))(v8 + 8))(v12, v26);
  }
  else
  {
    uint64_t v57 = v105;
    if (v27 == *MEMORY[0x263F41150])
    {
      int HasCompletedInitialRun = BYSetupAssistantHasCompletedInitialRun();
      if (qword_2676005F8 != -1) {
        swift_once();
      }
      uint64_t v58 = sub_209C4CAD8();
      __swift_project_value_buffer(v58, (uint64_t)qword_267602EE0);
      os_log_type_t v59 = sub_209C4D398();
      uint64_t v60 = sub_209C4CAB8();
      if (os_log_type_enabled(v60, v59))
      {
        uint64_t v61 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v61 = 67109120;
        LODWORD(v108) = HasCompletedInitialRun;
        sub_209C4D3E8();
        _os_log_impl(&dword_2099F8000, v60, v59, "Buddy - generative model available, initial run completed: %{BOOL}d", v61, 8u);
        MEMORY[0x21050C4E0](v61, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v103 + 8))(v25, v57);
      goto LABEL_27;
    }
    if (qword_2676005F8 != -1) {
      swift_once();
    }
    uint64_t v77 = sub_209C4CAD8();
    __swift_project_value_buffer(v77, (uint64_t)qword_267602EE0);
    os_log_type_t v78 = sub_209C4D398();
    uint64_t v79 = v103;
    uint64_t v80 = v96;
    (*(void (**)(char *, char *, uint64_t))(v103 + 16))(v96, v25, v57);
    uint64_t v81 = sub_209C4CAB8();
    if (os_log_type_enabled(v81, v78))
    {
      LODWORD(v104) = v78;
      uint64_t v82 = (uint8_t *)swift_slowAlloc();
      uint64_t v101 = swift_slowAlloc();
      uint64_t v108 = (void *)v101;
      uint64_t v100 = v82;
      *(_DWORD *)uint64_t v82 = 136315138;
      id v99 = (char *)(v82 + 4);
      uint64_t v83 = (char *)v95;
      sub_209C4CA18();
      sub_209C4215C(&qword_2676012E8, MEMORY[0x263F41158]);
      uint64_t v84 = sub_209C4D578();
      unint64_t v86 = v85;
      uint64_t v87 = v83;
      double v88 = *(void (**)(char *, void *))(v8 + 8);
      v88(v87, v26);
      uint64_t v109 = sub_209C305B8(v84, v86, (uint64_t *)&v108);
      sub_209C4D3E8();
      swift_bridgeObjectRelease();
      uint64_t v89 = *(void (**)(char *, uint64_t))(v79 + 8);
      uint64_t v90 = v105;
      v89(v96, v105);
      long long v91 = v100;
      _os_log_impl(&dword_2099F8000, v81, (os_log_type_t)v104, "Buddy - generative model state unknown: %s", v100, 0xCu);
      uint64_t v92 = v101;
      swift_arrayDestroy();
      MEMORY[0x21050C4E0](v92, -1, -1);
      MEMORY[0x21050C4E0](v91, -1, -1);

      v89(v107, v90);
    }
    else
    {

      uint64_t v93 = *(void (**)(char *, uint64_t))(v79 + 8);
      v93(v80, v57);
      v93(v25, v57);
      double v88 = *(void (**)(char *, void *))(v8 + 8);
    }
    uint64_t v24 = v106;
    *(unsigned char *)(v106 + 24) = 0;
    v88(v12, v26);
  }
LABEL_43:
  *(unsigned char *)(v24 + 25) = *(unsigned char *)(v24 + 24) == 1;
  return sub_209C3F2E0();
}

uint64_t sub_209C3F04C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_209C4CD68();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_209C3F0C0()
{
  return sub_209C4D628();
}

uint64_t sub_209C3F108()
{
  return sub_209C4D618();
}

uint64_t sub_209C3F134()
{
  return sub_209C4D628();
}

uint64_t *sub_209C3F178@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  BOOL v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2) {
    uint64_t v2 = 0;
  }
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = v3;
  return result;
}

uint64_t sub_209C3F194(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_209C3DDF4(*a1, *a2);
}

uint64_t sub_209C3F1A0()
{
  return sub_209C3E0E0();
}

uint64_t sub_209C3F1A8()
{
  sub_209C4D238();
  return swift_bridgeObjectRelease();
}

uint64_t sub_209C3F234()
{
  return sub_209C3E184();
}

uint64_t sub_209C3F23C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_209C42060();
  *a1 = result;
  return result;
}

void sub_209C3F26C(unint64_t *a1@<X8>)
{
  unint64_t v2 = 0xD000000000000011;
  unint64_t v3 = 0xD000000000000016;
  unint64_t v4 = 0x8000000209C94D40;
  if (*v1 != 1)
  {
    unint64_t v3 = 7105633;
    unint64_t v4 = 0xE300000000000000;
  }
  if (*v1)
  {
    unint64_t v2 = v3;
    unint64_t v5 = v4;
  }
  else
  {
    unint64_t v5 = 0x8000000209C94D20;
  }
  *a1 = v2;
  a1[1] = v5;
}

BOOL sub_209C3F2C8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_209C3F2E0()
{
  uint64_t v0 = (void *)sub_209C4D208();
  id v1 = CAMLocalizedFrameworkString(v0, 0);

  sub_209C4D218();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_209C4C718();
  sub_209C4CD78();
  unint64_t v2 = (void *)sub_209C4D208();
  id v3 = CAMLocalizedFrameworkString(v2, 0);

  sub_209C4D218();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_209C4C718();
  return sub_209C4CD78();
}

uint64_t sub_209C3F4EC@<X0>(void *a1@<X8>)
{
  return sub_209C3F528(a1);
}

uint64_t sub_209C3F500()
{
  return sub_209C3F5B8();
}

uint64_t sub_209C3F514@<X0>(void *a1@<X8>)
{
  return sub_209C3F528(a1);
}

uint64_t sub_209C3F528@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_209C4CD68();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_209C3F5A4()
{
  return sub_209C3F5B8();
}

uint64_t sub_209C3F5B8()
{
  return sub_209C4CD78();
}

void sub_209C3F794(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600B88);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_209C4CD68();
  swift_release();
  swift_release();
  if (v20 != a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_209C4CD68();
    swift_release();
    swift_release();
    if (v20)
    {
      if (v20 == 2)
      {
        uint64_t v7 = *(void *)(v2 + 16);
        sub_209C4D168();
        uint64_t v8 = sub_209C4D178();
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 0, 1, v8);
        uint64_t v9 = v7 + OBJC_IVAR____TtC8CameraUI9Stopwatch_endTime;
        swift_beginAccess();
        sub_209C22C40((uint64_t)v6, v9);
        swift_endAccess();
        if (qword_2676005F8 != -1) {
          swift_once();
        }
        uint64_t v10 = sub_209C4CAD8();
        __swift_project_value_buffer(v10, (uint64_t)qword_267602EE0);
        os_log_type_t v11 = sub_209C4D368();
        sub_209C4C718();
        uint64_t v12 = sub_209C4CAB8();
        if (os_log_type_enabled(v12, v11))
        {
          uint64_t v13 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)uint64_t v13 = 134217984;
          sub_209C1D834();
          uint64_t v20 = v14;
          sub_209C4D3E8();
          swift_release();
          _os_log_impl(&dword_2099F8000, v12, v11, "Buddy - loading completed in: %f", v13, 0xCu);
          MEMORY[0x21050C4E0](v13, -1, -1);
        }
        else
        {

          swift_release();
        }
      }
      else
      {
        if (v20 != 1)
        {
          sub_209C4D598();
          __break(1u);
          return;
        }
        uint64_t v15 = *(void *)(v2 + 16);
        sub_209C4D168();
        uint64_t v16 = sub_209C4D178();
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v6, 0, 1, v16);
        uint64_t v17 = v15 + OBJC_IVAR____TtC8CameraUI9Stopwatch_startTime;
        swift_beginAccess();
        sub_209C22C40((uint64_t)v6, v17);
        swift_endAccess();
      }
    }
    uint64_t v18 = *(void (**)(uint64_t))(v2
                                         + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_assetLoadingComplete);
    if (v18)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      sub_209C4C718();
      sub_209C4CD68();
      swift_release();
      swift_release();
      v18(v20);
      sub_209C17974((uint64_t)v18);
    }
  }
}

uint64_t sub_209C3FB7C@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_209C4CD68();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

void sub_209C3FBFC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_209C4CD68();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_209C4C718();
  sub_209C4CD78();
  sub_209C3F794(v0);
}

uint64_t sub_209C3FCC8()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600CD8);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v8 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_209C4CD68();
  swift_release();
  uint64_t result = swift_release();
  if (!v9)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_209C4CD68();
    swift_release();
    swift_release();
    uint64_t v4 = v9;
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v9 = 1;
    sub_209C4C718();
    sub_209C4CD78();
    sub_209C3F794(v4);
    uint64_t v5 = sub_209C4D2F8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v2, 1, 1, v5);
    uint64_t v6 = swift_allocObject();
    swift_weakInit();
    uint64_t v7 = (void *)swift_allocObject();
    v7[2] = 0;
    void v7[3] = 0;
    v7[4] = v6;
    sub_209C3A47C((uint64_t)v2, (uint64_t)&unk_267601308, (uint64_t)v7);
    return swift_release();
  }
  return result;
}

uint64_t sub_209C3FEC8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_209C4C9B8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a2 + 16)
    && (sub_209C4215C(&qword_2676012F0, MEMORY[0x263F40FE8]),
        uint64_t v7 = sub_209C4D1B8(),
        uint64_t v8 = -1 << *(unsigned char *)(a2 + 32),
        unint64_t v9 = v7 & ~v8,
        uint64_t v10 = a2 + 56,
        ((*(void *)(a2 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0))
  {
    uint64_t v17 = ~v8;
    uint64_t v18 = a2;
    uint64_t v11 = v4 + 16;
    uint64_t v12 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
    uint64_t v13 = *(void *)(v11 + 56);
    uint64_t v14 = (void (**)(char *, uint64_t))(v11 - 8);
    do
    {
      v12(v6, *(void *)(v18 + 48) + v13 * v9, v3);
      sub_209C4215C(&qword_2676012F8, MEMORY[0x263F40FE8]);
      char v15 = sub_209C4D1D8();
      (*v14)(v6, v3);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v17;
    }
    while (((*(void *)(v10 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  else
  {
    char v15 = 0;
  }
  return v15 & 1;
}

uint64_t sub_209C400DC()
{
  uint64_t v1 = OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_demoLoopAnimationPackage;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_demoLoopAnimationPackage);
  *(void *)(v0 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_demoLoopAnimationPackage) = 0;

  uint64_t v3 = OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_buttonHighlightAnimationPackage;
  uint64_t v4 = *(void **)(v0 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_buttonHighlightAnimationPackage);
  *(void *)(v0 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_buttonHighlightAnimationPackage) = 0;

  uint64_t v5 = OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_modelAsset;
  uint64_t v6 = *(void **)(v0 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_modelAsset);
  *(void *)(v0 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_modelAsset) = 0;

  uint64_t v7 = (uint64_t *)(v0 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_assetLoadingComplete);
  uint64_t v8 = *(void *)(v0 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_assetLoadingComplete);
  *uint64_t v7 = 0;
  v7[1] = 0;
  sub_209C17974(v8);
  swift_release();
  uint64_t v9 = v0 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel__sceneHasRendered;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676012D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  uint64_t v11 = v0 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel__title;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676012D8);
  uint64_t v13 = *(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8);
  v13(v11, v12);
  v13(v0 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel__content, v12);
  uint64_t v14 = v0 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel__loadingStatus;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676012E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);

  sub_209C17974(*v7);
  return v0;
}

uint64_t sub_209C402B0()
{
  sub_209C400DC();
  return swift_deallocClassInstance();
}

uint64_t sub_209C40308()
{
  return type metadata accessor for OnboardingBuddySetupViewModel();
}

uint64_t type metadata accessor for OnboardingBuddySetupViewModel()
{
  uint64_t result = qword_267601290;
  if (!qword_267601290) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_209C4035C()
{
  sub_209C404D0(319, &qword_2676012A0);
  if (v0 <= 0x3F)
  {
    sub_209C404D0(319, &qword_2676012A8);
    if (v1 <= 0x3F)
    {
      sub_209C404D0(319, &qword_2676012B0);
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

void sub_209C404D0(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_209C4CD88();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

unsigned char *storeEnumTagSinglePayload for BuddyAnimationLoopState(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x209C405E4);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BuddyAnimationLoopState()
{
  return &type metadata for BuddyAnimationLoopState;
}

uint64_t getEnumTagSinglePayload for BuddyAnimationLoopType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for BuddyAnimationLoopType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x209C40778);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BuddyAnimationLoopType()
{
  return &type metadata for BuddyAnimationLoopType;
}

ValueMetadata *type metadata accessor for OnboardingBuddyAssetLoadingStatus()
{
  return &type metadata for OnboardingBuddyAssetLoadingStatus;
}

unint64_t sub_209C407C4()
{
  unint64_t result = qword_2676012B8;
  if (!qword_2676012B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2676012B8);
  }
  return result;
}

unint64_t sub_209C4081C()
{
  unint64_t result = qword_2676012C0;
  if (!qword_2676012C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2676012C0);
  }
  return result;
}

unint64_t sub_209C40874()
{
  unint64_t result = qword_2676012C8;
  if (!qword_2676012C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2676012C8);
  }
  return result;
}

uint64_t sub_209C408C8()
{
  return MEMORY[0x263EFDDD8];
}

id sub_209C408D4()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600CC8);
  MEMORY[0x270FA5388](v0 - 8);
  int v2 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_209C4C8D8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  BOOL v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v22 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v22 - v11;
  ObjCClassFromMetadatdouble a = swift_getObjCClassFromMetadata();
  id v14 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v23 = sub_209C4D218();
  uint64_t v24 = v15;
  uint64_t v16 = (void *)sub_209C4D208();
  uint64_t v17 = (void *)sub_209C4D208();
  id v18 = objc_msgSend(v14, sel_URLForResource_withExtension_, v16, v17);

  if (!v18)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
    goto LABEL_5;
  }
  sub_209C4C8B8();

  uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
  v19(v2, v10, v3);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v2, 0, 1, v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
LABEL_5:
    swift_bridgeObjectRelease();

    sub_209C1815C((uint64_t)v2, &qword_267600CC8);
    return 0;
  }
  v19(v12, v2, v3);
  sub_209C42338();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v12, v3);
  id v21 = sub_209C40C44((uint64_t)v7, v23, v24, 0);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v12, v3);

  return v21;
}

id sub_209C40C44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v17[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v6 = (void *)sub_209C4C8A8();
  BOOL v7 = (void *)sub_209C4D208();
  swift_bridgeObjectRelease();
  if (a4)
  {
    uint64_t v8 = (void *)sub_209C4D198();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }
  v17[0] = 0;
  id v9 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_packageWithContentsOfURL_type_options_error_, v6, v7, v8, v17);

  id v10 = v17[0];
  if (v9)
  {
    uint64_t v11 = sub_209C4C8D8();
    uint64_t v12 = *(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8);
    id v13 = v10;
    v12(a1, v11);
  }
  else
  {
    id v14 = v17[0];
    sub_209C4C868();

    swift_willThrow();
    uint64_t v15 = sub_209C4C8D8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(a1, v15);
  }
  return v9;
}

uint64_t sub_209C40E0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 56) = a4;
  return MEMORY[0x270FA2498](sub_209C40E2C, 0, 0);
}

uint64_t sub_209C40E2C()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  v0[8] = Strong;
  if (Strong)
  {
    int v2 = (void *)swift_task_alloc();
    v0[9] = v2;
    *int v2 = v0;
    v2[1] = sub_209C40F58;
    return MEMORY[0x270FA2158]();
  }
  else
  {
    uint64_t v3 = (uint64_t (*)(void))v0[1];
    return v3();
  }
}

uint64_t sub_209C40F58()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_209C41054, 0, 0);
}

uint64_t sub_209C41054()
{
  sub_209C4D2C8();
  *(void *)(v0 + 80) = sub_209C4D2B8();
  uint64_t v2 = sub_209C4D298();
  return MEMORY[0x270FA2498](sub_209C410E8, v2, v1);
}

uint64_t sub_209C410E8()
{
  swift_release();
  sub_209C41BC0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_209C4CD68();
  swift_release();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 40);
  swift_getKeyPath();
  swift_getKeyPath();
  *(void *)(v0 + 48) = 2;
  sub_209C4C718();
  sub_209C4CD78();
  sub_209C3F794(v1);
  return MEMORY[0x270FA2498](sub_209C41204, 0, 0);
}

uint64_t sub_209C41204()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_209C41264(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[2] = a2;
  _OWORD v3[3] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267600CD8);
  v3[4] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_209C412F8, 0, 0);
}

uint64_t sub_209C412F8()
{
  uint64_t v2 = v0[3];
  uint64_t v1 = v0[4];
  sub_209C4D2D8();
  uint64_t v3 = sub_209C4D2F8();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v1, 0, 1, v3);
  uint64_t v4 = (void *)swift_allocObject();
  v4[2] = 0;
  _OWORD v4[3] = 0;
  v4[4] = v2;
  sub_209C4C718();
  sub_209C419C0(v1, (uint64_t)&unk_267601330, (uint64_t)v4);
  sub_209C1815C(v1, &qword_267600CD8);
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_209C41408()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_209C3407C;
  return sub_209C41498();
}

uint64_t sub_209C41498()
{
  v1[2] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267600CC8);
  v1[3] = swift_task_alloc();
  uint64_t v2 = sub_209C4C8D8();
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  void v1[6] = swift_task_alloc();
  v1[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_209C41598, 0, 0);
}

uint64_t sub_209C41598()
{
  ObjCClassFromMetadatdouble a = swift_getObjCClassFromMetadata();
  id v2 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v3 = (void *)sub_209C4D208();
  uint64_t v4 = (void *)sub_209C4D208();
  id v5 = objc_msgSend(v2, sel_URLForResource_withExtension_, v3, v4);

  if (!v5)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0[5] + 56))(v0[3], 1, 1, v0[4]);
    goto LABEL_7;
  }
  uint64_t v7 = v0[5];
  uint64_t v6 = v0[6];
  uint64_t v9 = v0[3];
  uint64_t v8 = v0[4];
  sub_209C4C8B8();

  id v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32);
  v10(v9, v6, v8);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v9, 0, 1, v8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v9, 1, v8) == 1)
  {
LABEL_7:
    sub_209C1815C(v0[3], &qword_267600CC8);
    return sub_209C4D518();
  }
  v10(v0[7], v0[3], v0[4]);
  id v11 = objc_allocWithZone(MEMORY[0x263F135E8]);
  uint64_t v12 = (void *)sub_209C4C8A8();
  id v13 = objc_msgSend(v11, sel_initWithURL_, v12);
  v0[8] = (uint64_t)v13;

  objc_msgSend(v13, sel_loadTextures);
  sub_209C4D2C8();
  v0[9] = sub_209C4D2B8();
  uint64_t v15 = sub_209C4D298();
  return MEMORY[0x270FA2498](sub_209C4188C, v15, v14);
}

uint64_t sub_209C4188C()
{
  uint64_t v1 = *(void **)(v0 + 64);
  uint64_t v2 = *(void *)(v0 + 16);
  swift_release();
  uint64_t v3 = *(void **)(v2 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_modelAsset);
  *(void *)(v2 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_modelAsset) = v1;
  id v4 = v1;

  return MEMORY[0x270FA2498](sub_209C41918, 0, 0);
}

uint64_t sub_209C41918()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 32);

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_209C419C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600CD8);
  MEMORY[0x270FA5388](v8 - 8);
  id v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_209C42490(a1, (uint64_t)v10);
  uint64_t v11 = sub_209C4D2F8();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_209C1815C((uint64_t)v10, &qword_267600CD8);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v13 = sub_209C4D298();
      uint64_t v15 = v14;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_209C4D2E8();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = 0;
  uint64_t v15 = 0;
LABEL_6:
  uint64_t v16 = *v4;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a2;
  *(void *)(v17 + 24) = a3;
  id v18 = (void *)(v15 | v13);
  if (v15 | v13)
  {
    v21[0] = 0;
    v21[1] = 0;
    id v18 = v21;
    void v21[2] = v13;
    v21[3] = v15;
  }
  v20[1] = 1;
  void v20[2] = v18;
  void v20[3] = v16;
  swift_task_create();
  return swift_release();
}

uint64_t sub_209C41BC0()
{
  id v1 = sub_209C408D4();
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_demoLoopAnimationPackage);
  *(void *)(v0 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_demoLoopAnimationPackage) = v1;

  id v3 = sub_209C408D4();
  id v4 = *(void **)(v0 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_buttonHighlightAnimationPackage);
  *(void *)(v0 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_buttonHighlightAnimationPackage) = v3;

  id v5 = sub_209C408D4();
  uint64_t v6 = *(void *)(v0 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_buttonAccentAnimationPackage);
  *(void *)(v0 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_buttonAccentAnimationPackage) = v5;
  return MEMORY[0x270F9A758](v5, v6);
}

uint64_t sub_209C41C74@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_209C4CD48();
  *a1 = result;
  return result;
}

uint64_t sub_209C41CC4(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = a1;
  uint64_t v27 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676012E0);
  uint64_t v24 = *(void *)(v3 - 8);
  uint64_t v25 = v3;
  MEMORY[0x270FA5388](v3);
  id v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676012D0);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Stopwatch();
  uint64_t v10 = swift_allocObject();
  uint64_t v11 = v10 + OBJC_IVAR____TtC8CameraUI9Stopwatch_startTime;
  uint64_t v12 = sub_209C4D178();
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
  v13(v11, 1, 1, v12);
  v13(v10 + OBJC_IVAR____TtC8CameraUI9Stopwatch_endTime, 1, 1, v12);
  *(void *)(v2 + 16) = v10;
  uint64_t v14 = v2 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel__sceneHasRendered;
  LOBYTE(v30) = 0;
  sub_209C4CD58();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v14, v9, v6);
  uint64_t v15 = v2 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel__loadingStatus;
  uint64_t v30 = 0;
  sub_209C4CD58();
  (*(void (**)(uint64_t, char *, uint64_t))(v24 + 32))(v15, v5, v25);
  uint64_t v16 = (NSString *)sub_209C4D208();
  Class v17 = NSClassFromString(v16);

  if (v17) {
    id v18 = objc_msgSend(self, sel_bundleForClass_, v17);
  }
  else {
    id v18 = 0;
  }
  *(void *)(v2 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_cameraButtonBundle) = v18;
  *(void *)(v2 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_demoLoopAnimationPackage) = 0;
  *(void *)(v2 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_buttonAccentAnimationPackage) = 0;
  *(void *)(v2 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_buttonHighlightAnimationPackage) = 0;
  *(void *)(v2 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_modelAsset) = 0;
  uint64_t v19 = (uint64_t *)(v2 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_assetLoadingComplete);
  uint64_t v20 = v26;
  uint64_t v21 = v27;
  *uint64_t v19 = v26;
  v19[1] = v21;
  sub_209C179D8(v20);
  sub_209C17974(0);
  swift_beginAccess();
  uint64_t v28 = 0;
  unint64_t v29 = 0xE000000000000000;
  sub_209C4CD58();
  swift_endAccess();
  swift_beginAccess();
  uint64_t v28 = 0;
  unint64_t v29 = 0xE000000000000000;
  sub_209C4CD58();
  swift_endAccess();
  *(_WORD *)(v2 + 24) = 0;
  sub_209C3F2E0();
  sub_209C3FCC8();
  return v2;
}

uint64_t sub_209C42060()
{
  unint64_t v0 = sub_209C4D568();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_209C420BC@<X0>(void *a1@<X8>)
{
  return sub_209C3F528(a1);
}

uint64_t sub_209C420E4()
{
  return sub_209C3F5B8();
}

uint64_t sub_209C4210C@<X0>(void *a1@<X8>)
{
  return sub_209C3F528(a1);
}

uint64_t sub_209C42134()
{
  return sub_209C3F5B8();
}

uint64_t sub_209C4215C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_209C421A4()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_209C421E0()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_209C14E64;
  v3[7] = v2;
  return MEMORY[0x270FA2498](sub_209C40E2C, 0, 0);
}

uint64_t sub_209C4228C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_209C3407C;
  return sub_209C41264(a1, a2, v2);
}

unint64_t sub_209C42338()
{
  unint64_t result = qword_267601320;
  if (!qword_267601320)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_267601320);
  }
  return result;
}

uint64_t objectdestroy_34Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_209C423BC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_209C3407C;
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_209C3407C;
  return sub_209C41498();
}

uint64_t sub_209C42490(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600CD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_209C424F8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_209C42530(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_209C14E64;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_267601338 + dword_267601338);
  return v6(a1, v4);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void __getBCSDetectedCodeClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  -[CAMStillImageCaptureCommand executeWithContext:](v0);
}

uint64_t __getRPPeopleDiscoveryClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[CAMLibrarySelectionController userDidPickSharedLibraryMode:](v0);
}

uint64_t __getBCSAVParsingSessionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getBCSActionClass_block_invoke_cold_1(v0);
}

uint64_t __getBCSActionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[CAMSmartStylePreviewGridView updateGridIndex:withResourceLoadResult:](v0);
}

uint64_t __getPLCropOverlayClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPLPhotoTileViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getPLPhotoTileViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPLVideoViewClass_block_invoke_cold_1(v0);
}

uint64_t __getPLVideoViewClass_block_invoke_cold_1()
{
  int v0 = abort_report_np();
  return [(CAMCallStatusMonitor *)v0 _accessQueue_subscribeToAVSystemControllerNotificationsWithCompletion:v2];
}

void __getSFDeviceDiscoveryClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  [(CAMExposureCommand *)v0 executeWithContext:v2];
}

void CAMShowStorageUsageInSettings_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Failed to opening Storage Settings url: %{public}@", (uint8_t *)&v2, 0xCu);
}

void CAMOpenURL_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "Failed to open URL %{public}@: %{public}@", (uint8_t *)&v3, 0x16u);
}

uint64_t __getLSApplicationWorkspaceClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[CAMPreviewViewController _focusOnPoint:shouldShowFocusAndExposureIndicator:](v0);
}

void __getPAMediaConversionServiceResourceURLCollectionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getPAImageConversionServiceClientClass_block_invoke_cold_1(v0);
}

void __getPAImageConversionServiceClientClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getPAVideoConversionServiceClientClass_block_invoke_cold_1(v0);
}

void __getPAVideoConversionServiceClientClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getPAMediaConversionServiceImageMetadataPolicyClass_block_invoke_cold_1(v0);
}

void __getPAMediaConversionServiceImageMetadataPolicyClass_block_invoke_cold_1()
{
}

uint64_t sub_209C4C4C8()
{
  return MEMORY[0x270EE0C80]();
}

uint64_t sub_209C4C4D8()
{
  return MEMORY[0x270EE0CB0]();
}

uint64_t sub_209C4C4E8()
{
  return MEMORY[0x270EE0CC0]();
}

uint64_t sub_209C4C4F8()
{
  return MEMORY[0x270EE0CD0]();
}

uint64_t sub_209C4C508()
{
  return MEMORY[0x270EE0D18]();
}

uint64_t sub_209C4C528()
{
  return MEMORY[0x270EE0DA0]();
}

uint64_t sub_209C4C548()
{
  return MEMORY[0x270EE0E88]();
}

uint64_t sub_209C4C558()
{
  return MEMORY[0x270EE0FB0]();
}

uint64_t sub_209C4C568()
{
  return MEMORY[0x270EE1170]();
}

uint64_t sub_209C4C578()
{
  return MEMORY[0x270EE1178]();
}

uint64_t sub_209C4C588()
{
  return MEMORY[0x270EE1180]();
}

uint64_t sub_209C4C598()
{
  return MEMORY[0x270EE1188]();
}

uint64_t sub_209C4C5A8()
{
  return MEMORY[0x270EE1190]();
}

uint64_t sub_209C4C5B8()
{
  return MEMORY[0x270EE1198]();
}

uint64_t sub_209C4C5C8()
{
  return MEMORY[0x270EE11A0]();
}

uint64_t sub_209C4C5D8()
{
  return MEMORY[0x270EE11C0]();
}

uint64_t sub_209C4C5E8()
{
  return MEMORY[0x270EE11D8]();
}

uint64_t sub_209C4C5F8()
{
  return MEMORY[0x270EE11E0]();
}

uint64_t sub_209C4C608()
{
  return MEMORY[0x270EE11F8]();
}

uint64_t sub_209C4C618()
{
  return MEMORY[0x270EE1230]();
}

uint64_t sub_209C4C628()
{
  return MEMORY[0x270EE1238]();
}

uint64_t sub_209C4C638()
{
  return MEMORY[0x270EE1250]();
}

uint64_t sub_209C4C648()
{
  return MEMORY[0x270EE13C8]();
}

uint64_t sub_209C4C658()
{
  return MEMORY[0x270EE1688]();
}

uint64_t sub_209C4C678()
{
  return MEMORY[0x270EE1888]();
}

uint64_t sub_209C4C698()
{
  return MEMORY[0x270EE18D8]();
}

uint64_t sub_209C4C6A8()
{
  return MEMORY[0x270EE1918]();
}

uint64_t sub_209C4C6B8()
{
  return MEMORY[0x270EE1930]();
}

uint64_t sub_209C4C6C8()
{
  return MEMORY[0x270EE1938]();
}

uint64_t sub_209C4C6D8()
{
  return MEMORY[0x270EE1958]();
}

uint64_t sub_209C4C6F8()
{
  return MEMORY[0x270EE1A20]();
}

uint64_t sub_209C4C708()
{
  return MEMORY[0x270EE1A40]();
}

uint64_t sub_209C4C718()
{
  return MEMORY[0x270EE1A48]();
}

uint64_t sub_209C4C728()
{
  return MEMORY[0x270EE1A50]();
}

uint64_t sub_209C4C738()
{
  return MEMORY[0x270EE1A58]();
}

uint64_t sub_209C4C748()
{
  return MEMORY[0x270EE1AB0]();
}

uint64_t sub_209C4C758()
{
  return MEMORY[0x270EE1AB8]();
}

uint64_t sub_209C4C768()
{
  return MEMORY[0x270EE1AC0]();
}

uint64_t sub_209C4C778()
{
  return MEMORY[0x270EE1AD0]();
}

uint64_t sub_209C4C788()
{
  return MEMORY[0x270EE1B80]();
}

uint64_t sub_209C4C7A8()
{
  return MEMORY[0x270EE1C48]();
}

uint64_t sub_209C4C7B8()
{
  return MEMORY[0x270EE1C78]();
}

uint64_t sub_209C4C7C8()
{
  return MEMORY[0x270EE1C90]();
}

uint64_t sub_209C4C7D8()
{
  return MEMORY[0x270EE1CB0]();
}

uint64_t sub_209C4C7E8()
{
  return MEMORY[0x270EE1CC0]();
}

uint64_t sub_209C4C7F8()
{
  return MEMORY[0x270EEF518]();
}

uint64_t sub_209C4C808()
{
  return MEMORY[0x270EEF548]();
}

uint64_t sub_209C4C818()
{
  return MEMORY[0x270EEF5C0]();
}

uint64_t sub_209C4C828()
{
  return MEMORY[0x270EEF600]();
}

uint64_t sub_209C4C838()
{
  return MEMORY[0x270EEF740]();
}

uint64_t sub_209C4C848()
{
  return MEMORY[0x270EEF750]();
}

uint64_t sub_209C4C858()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_209C4C868()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_209C4C878()
{
  return MEMORY[0x270EEF870]();
}

uint64_t sub_209C4C888()
{
  return MEMORY[0x270EEF8C0]();
}

uint64_t sub_209C4C898()
{
  return MEMORY[0x270EEF8D8]();
}

uint64_t sub_209C4C8A8()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_209C4C8B8()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_209C4C8C8()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_209C4C8D8()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_209C4C8E8()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_209C4C8F8()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_209C4C908()
{
  return MEMORY[0x270EF1490]();
}

uint64_t sub_209C4C918()
{
  return MEMORY[0x270EF14A0]();
}

uint64_t sub_209C4C928()
{
  return MEMORY[0x270EF1510]();
}

uint64_t sub_209C4C938()
{
  return MEMORY[0x270EF1538]();
}

uint64_t sub_209C4C948()
{
  return MEMORY[0x270EF1550]();
}

uint64_t sub_209C4C958()
{
  return MEMORY[0x270EF16E0]();
}

uint64_t sub_209C4C968()
{
  return MEMORY[0x270EF1700]();
}

uint64_t sub_209C4C978()
{
  return MEMORY[0x270F816E8]();
}

uint64_t sub_209C4C988()
{
  return MEMORY[0x270F816F8]();
}

uint64_t sub_209C4C998()
{
  return MEMORY[0x270F81740]();
}

uint64_t sub_209C4C9A8()
{
  return MEMORY[0x270EF1738]();
}

uint64_t sub_209C4C9B8()
{
  return MEMORY[0x270F2F860]();
}

uint64_t sub_209C4C9C8()
{
  return MEMORY[0x270F2F898]();
}

uint64_t sub_209C4C9D8()
{
  return MEMORY[0x270F2F8B0]();
}

uint64_t sub_209C4C9E8()
{
  return MEMORY[0x270F2F948]();
}

uint64_t sub_209C4C9F8()
{
  return MEMORY[0x270F2F960]();
}

uint64_t sub_209C4CA08()
{
  return MEMORY[0x270F2F990]();
}

uint64_t sub_209C4CA18()
{
  return MEMORY[0x270F2F9A8]();
}

uint64_t sub_209C4CA28()
{
  return MEMORY[0x270F2FA88]();
}

uint64_t sub_209C4CA38()
{
  return MEMORY[0x270F2FA98]();
}

uint64_t sub_209C4CA48()
{
  return MEMORY[0x270EF5618]();
}

uint64_t sub_209C4CA58()
{
  return MEMORY[0x270EF5620]();
}

uint64_t sub_209C4CA68()
{
  return MEMORY[0x270EF5628]();
}

uint64_t sub_209C4CA78()
{
  return MEMORY[0x270EF5630]();
}

uint64_t sub_209C4CA88()
{
  return MEMORY[0x270EF5638]();
}

uint64_t sub_209C4CAA8()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_209C4CAB8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_209C4CAC8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_209C4CAD8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_209C4CAE8()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_209C4CAF8()
{
  return MEMORY[0x270F05B40]();
}

uint64_t sub_209C4CB08()
{
  return MEMORY[0x270F05B50]();
}

uint64_t sub_209C4CB18()
{
  return MEMORY[0x270F05B60]();
}

uint64_t sub_209C4CB28()
{
  return MEMORY[0x270F05B78]();
}

uint64_t sub_209C4CB38()
{
  return MEMORY[0x270F05B80]();
}

uint64_t sub_209C4CB48()
{
  return MEMORY[0x270F05B98]();
}

uint64_t sub_209C4CB58()
{
  return MEMORY[0x270F05BA8]();
}

uint64_t sub_209C4CB68()
{
  return MEMORY[0x270F05BB0]();
}

uint64_t sub_209C4CB78()
{
  return MEMORY[0x270F05BE8]();
}

uint64_t sub_209C4CB88()
{
  return MEMORY[0x270F05BF0]();
}

uint64_t sub_209C4CB98()
{
  return MEMORY[0x270F05C10]();
}

uint64_t sub_209C4CBA8()
{
  return MEMORY[0x270F05C30]();
}

uint64_t sub_209C4CBB8()
{
  return MEMORY[0x270F05C38]();
}

uint64_t sub_209C4CBC8()
{
  return MEMORY[0x270F05C48]();
}

uint64_t sub_209C4CBD8()
{
  return MEMORY[0x270F05C50]();
}

uint64_t sub_209C4CBE8()
{
  return MEMORY[0x270F05C58]();
}

uint64_t sub_209C4CBF8()
{
  return MEMORY[0x270F05C60]();
}

uint64_t sub_209C4CC08()
{
  return MEMORY[0x270F05C68]();
}

uint64_t sub_209C4CC18()
{
  return MEMORY[0x270F05C70]();
}

uint64_t sub_209C4CC28()
{
  return MEMORY[0x270F05C88]();
}

uint64_t sub_209C4CC38()
{
  return MEMORY[0x270F05CD0]();
}

uint64_t sub_209C4CC48()
{
  return MEMORY[0x270F05CD8]();
}

uint64_t sub_209C4CC58()
{
  return MEMORY[0x270F05CE0]();
}

uint64_t sub_209C4CC68()
{
  return MEMORY[0x270F05CE8]();
}

uint64_t sub_209C4CC78()
{
  return MEMORY[0x270F05D00]();
}

uint64_t sub_209C4CC88()
{
  return MEMORY[0x270F05D08]();
}

uint64_t sub_209C4CC98()
{
  return MEMORY[0x270F05D10]();
}

uint64_t sub_209C4CCA8()
{
  return MEMORY[0x270F05D18]();
}

uint64_t sub_209C4CCB8()
{
  return MEMORY[0x270F05D20]();
}

uint64_t sub_209C4CCC8()
{
  return MEMORY[0x270F05D30]();
}

uint64_t sub_209C4CCD8()
{
  return MEMORY[0x270F05D38]();
}

uint64_t sub_209C4CCE8()
{
  return MEMORY[0x270F05D48]();
}

uint64_t sub_209C4CCF8()
{
  return MEMORY[0x270F05D50]();
}

uint64_t sub_209C4CD08()
{
  return MEMORY[0x270F05D60]();
}

uint64_t sub_209C4CD18()
{
  return MEMORY[0x270F05D70]();
}

uint64_t sub_209C4CD28()
{
  return MEMORY[0x270F05D78]();
}

uint64_t sub_209C4CD38()
{
  return MEMORY[0x270F05D80]();
}

uint64_t sub_209C4CD48()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_209C4CD58()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_209C4CD68()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_209C4CD78()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_209C4CD88()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_209C4CD98()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_209C4CDA8()
{
  return MEMORY[0x270EFF108]();
}

uint64_t sub_209C4CDB8()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_209C4CDC8()
{
  return MEMORY[0x270EFF648]();
}

uint64_t sub_209C4CDD8()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_209C4CDE8()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_209C4CDF8()
{
  return MEMORY[0x270F006C0]();
}

uint64_t sub_209C4CE08()
{
  return MEMORY[0x270F006F0]();
}

uint64_t sub_209C4CE18()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_209C4CE28()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_209C4CE38()
{
  return MEMORY[0x270F00B28]();
}

uint64_t sub_209C4CE48()
{
  return MEMORY[0x270F00B30]();
}

uint64_t sub_209C4CE58()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_209C4CE68()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_209C4CE78()
{
  return MEMORY[0x270F00FA0]();
}

uint64_t sub_209C4CE88()
{
  return MEMORY[0x270F00FA8]();
}

uint64_t sub_209C4CE98()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_209C4CEA8()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_209C4CEB8()
{
  return MEMORY[0x270F025C8]();
}

uint64_t sub_209C4CEC8()
{
  return MEMORY[0x270F025E0]();
}

uint64_t sub_209C4CED8()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_209C4CEE8()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_209C4CEF8()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_209C4CF18()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_209C4CF28()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_209C4CF38()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_209C4CF58()
{
  return MEMORY[0x270F02728]();
}

uint64_t sub_209C4CF68()
{
  return MEMORY[0x270F02988]();
}

uint64_t sub_209C4CF78()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_209C4CF88()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_209C4CF98()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_209C4CFA8()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_209C4CFB8()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_209C4CFC8()
{
  return MEMORY[0x270F02B90]();
}

uint64_t sub_209C4CFD8()
{
  return MEMORY[0x270F02BF8]();
}

uint64_t sub_209C4CFE8()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_209C4CFF8()
{
  return MEMORY[0x270F02C88]();
}

uint64_t sub_209C4D008()
{
  return MEMORY[0x270F02F28]();
}

uint64_t sub_209C4D018()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_209C4D028()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_209C4D038()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_209C4D048()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_209C4D058()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_209C4D068()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_209C4D078()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_209C4D088()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_209C4D098()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_209C4D0A8()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_209C4D0B8()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_209C4D0C8()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_209C4D0D8()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_209C4D0E8()
{
  return MEMORY[0x270F05068]();
}

uint64_t sub_209C4D0F8()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_209C4D108()
{
  return MEMORY[0x270F05160]();
}

uint64_t sub_209C4D118()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_209C4D128()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_209C4D138()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_209C4D148()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_209C4D158()
{
  return MEMORY[0x270FA0A98]();
}

uint64_t sub_209C4D168()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_209C4D178()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_209C4D188()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_209C4D198()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_209C4D1A8()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_209C4D1B8()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_209C4D1C8()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_209C4D1D8()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_209C4D1E8()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_209C4D1F8()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_209C4D208()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_209C4D218()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_209C4D228()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_209C4D238()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_209C4D248()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_209C4D258()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_209C4D268()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_209C4D278()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_209C4D288()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_209C4D298()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_209C4D2B8()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_209C4D2C8()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_209C4D2D8()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_209C4D2E8()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_209C4D2F8()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_209C4D308()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_209C4D318()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_209C4D328()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_209C4D338()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_209C4D348()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_209C4D358()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_209C4D368()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_209C4D378()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_209C4D388()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_209C4D398()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_209C4D3A8()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_209C4D3B8()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_209C4D3C8()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_209C4D3D8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_209C4D3E8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_209C4D3F8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_209C4D408()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_209C4D418()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_209C4D428()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_209C4D438()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_209C4D448()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_209C4D458()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_209C4D468()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_209C4D478()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_209C4D488()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_209C4D498()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_209C4D4B8()
{
  return MEMORY[0x270FA2210]();
}

uint64_t sub_209C4D4C8()
{
  return MEMORY[0x270FA2218]();
}

uint64_t sub_209C4D4D8()
{
  return MEMORY[0x270FA2220]();
}

uint64_t sub_209C4D4E8()
{
  return MEMORY[0x270FA2228]();
}

uint64_t sub_209C4D4F8()
{
  return MEMORY[0x270FA2230]();
}

uint64_t sub_209C4D508()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_209C4D518()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_209C4D528()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_209C4D538()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_209C4D548()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_209C4D558()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_209C4D568()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_209C4D578()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_209C4D588()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_209C4D598()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_209C4D5A8()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_209C4D5B8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_209C4D5C8()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_209C4D5D8()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_209C4D5E8()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_209C4D5F8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_209C4D608()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_209C4D618()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_209C4D628()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t ACT_CopyDefaultConfigurationForPanorama()
{
  return MEMORY[0x270F08518]();
}

uint64_t ACT_FigSampleBufferProcessorCreateForPanoramaWithOptionsAndPreviewSize()
{
  return MEMORY[0x270F08520]();
}

uint64_t ACT_FigSampleBufferProcessorStartPanoramaCapture()
{
  return MEMORY[0x270F08528]();
}

uint64_t ACT_FigSampleBufferProcessorStartPanoramaCaptureWithMetadata()
{
  return MEMORY[0x270F08530]();
}

uint64_t ACT_FigSampleBufferProcessorStopPanoramaCapture()
{
  return MEMORY[0x270F08538]();
}

uint64_t AVCaptureSessionSetAuthorizedToUseCameraInMultipleForegroundAppLayout()
{
  return MEMORY[0x270EDDF98]();
}

uint64_t AVGestaltGetBoolAnswer()
{
  return MEMORY[0x270EDDFA0]();
}

uint64_t AVGestaltGetFloatAnswerWithDefault()
{
  return MEMORY[0x270EDDFA8]();
}

uint64_t AVGestaltGetIntegerAnswer()
{
  return MEMORY[0x270EDDFB0]();
}

uint64_t AVGestaltGetIntegerAnswerWithDefault()
{
  return MEMORY[0x270EDDFB8]();
}

uint64_t AVGestaltGetStringAnswerWithDefault()
{
  return MEMORY[0x270EDDFC0]();
}

uint64_t AVSmartStyleSettingsGetSystemStyle()
{
  return MEMORY[0x270EDDFD0]();
}

uint64_t AVSmartStyleSettingsGetSystemStyleFast()
{
  return MEMORY[0x270EDDFD8]();
}

uint64_t AVSmartStyleSettingsSetSystemStyle()
{
  return MEMORY[0x270EDDFE0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

void AudioServicesPlaySystemSound(SystemSoundID inSystemSoundID)
{
}

void AudioServicesPlaySystemSoundWithCompletion(SystemSoundID inSystemSoundID, void *inCompletionBlock)
{
}

uint64_t AudioServicesStartSystemSound()
{
  return MEMORY[0x270EE2240]();
}

uint64_t AudioServicesStopSystemSound()
{
  return MEMORY[0x270EE2248]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x270F107E8]();
}

uint64_t BYSetupAssistantHasCompletedInitialRun()
{
  return MEMORY[0x270F5D210]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  MEMORY[0x270EFB7B0](minimum, maximum, preferred);
  result.preferredouble d = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

uint64_t CAImageQueueCollect()
{
  return MEMORY[0x270EFB7C0]();
}

uint64_t CAImageQueueCreate()
{
  return MEMORY[0x270EFB7D0]();
}

uint64_t CAImageQueueInsertImage()
{
  return MEMORY[0x270EFB808]();
}

uint64_t CAImageQueueRegisterIOSurfaceBuffer()
{
  return MEMORY[0x270EFB820]();
}

uint64_t CAMIsCameraButtonAvailable()
{
  return MEMORY[0x270F14FE0]();
}

uint64_t CAMStringForOverlayServiceConnectionStatus()
{
  return MEMORY[0x270F14FE8]();
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x270EFB8F0](retstr, a, b);
}

BOOL CATransform3DEqualToTransform(CATransform3D *a, CATransform3D *b)
{
  return MEMORY[0x270EFB900](a, b);
}

CATransform3D *__cdecl CATransform3DInvert(CATransform3D *__return_ptr retstr, CATransform3D *t)
{
  return (CATransform3D *)MEMORY[0x270EFB918](retstr, t);
}

CATransform3D *__cdecl CATransform3DMakeAffineTransform(CATransform3D *__return_ptr retstr, CGAffineTransform *m)
{
  return (CATransform3D *)MEMORY[0x270EFB930](retstr, m);
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x270EFB938](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB948](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DTranslate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x270EFB978](retstr, t, tx, ty, tz);
}

uint64_t CEKClamp()
{
  return MEMORY[0x270F14EF8]();
}

uint64_t CEKDebugStringForSmartStylePresetType()
{
  return MEMORY[0x270F14F00]();
}

uint64_t CEKDisplayStringForSemanticStyleMakerPreset()
{
  return MEMORY[0x270F14F08]();
}

uint64_t CEKEdgeInsetsEqualToInsets()
{
  return MEMORY[0x270F14F10]();
}

uint64_t CEKExpandNormalizedContactPoint()
{
  return MEMORY[0x270F14F18]();
}

uint64_t CEKExpandNormalizedPoint()
{
  return MEMORY[0x270F14F20]();
}

uint64_t CEKExpandNormalizedRect()
{
  return MEMORY[0x270F14F28]();
}

uint64_t CEKFontOfSizeAndStyle()
{
  return MEMORY[0x270F14F30]();
}

uint64_t CEKFontOfSizeWeightStyle()
{
  return MEMORY[0x270F14F38]();
}

uint64_t CEKInterpolate()
{
  return MEMORY[0x270F14F40]();
}

uint64_t CEKInterpolateClamped()
{
  return MEMORY[0x270F14F48]();
}

uint64_t CEKIsPadLayoutForView()
{
  return MEMORY[0x270F14F50]();
}

uint64_t CEKIsSFCameraSupportedForLocale()
{
  return MEMORY[0x270F14F58]();
}

uint64_t CEKIsViewInMultitask()
{
  return MEMORY[0x270F14F60]();
}

uint64_t CEKMonospacedStylisticNumeralFontOfSizeAndStyle()
{
  return MEMORY[0x270F14F68]();
}

uint64_t CEKNormalizeRect()
{
  return MEMORY[0x270F14F70]();
}

uint64_t CEKPixelWidthForView()
{
  return MEMORY[0x270F14F78]();
}

uint64_t CEKPortraitOrientedSize()
{
  return MEMORY[0x270F14F80]();
}

uint64_t CEKProgress()
{
  return MEMORY[0x270F14F88]();
}

uint64_t CEKProgressClamped()
{
  return MEMORY[0x270F14F90]();
}

uint64_t CEKRectInsetsInRect()
{
  return MEMORY[0x270F14F98]();
}

uint64_t CEKRectWithSize()
{
  return MEMORY[0x270F14FA0]();
}

uint64_t CEKSizeCeilToScale()
{
  return MEMORY[0x270F14FA8]();
}

uint64_t CEKSizeMax()
{
  return MEMORY[0x270F14FB0]();
}

uint64_t CEKSizeScale()
{
  return MEMORY[0x270F14FB8]();
}

uint64_t CEKSmartStyleAllPresetTypes()
{
  return MEMORY[0x270F14FC0]();
}

uint64_t CEKSmartStyleIntensitySliderGradientColorsForCastType()
{
  return MEMORY[0x270F14FC8]();
}

uint64_t CEKSmartStyleRepresentativeColorForCastType()
{
  return MEMORY[0x270F14FD0]();
}

uint64_t CEKSmartStyleSystemStylePresetTypes()
{
  return MEMORY[0x270F14FD8]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

CFAttributedStringRef CFAttributedStringCreate(CFAllocatorRef alloc, CFStringRef str, CFDictionaryRef attributes)
{
  return (CFAttributedStringRef)MEMORY[0x270EE43B0](alloc, str, attributes);
}

CFIndex CFAttributedStringGetLength(CFAttributedStringRef aStr)
{
  return MEMORY[0x270EE4400](aStr);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x270EE4440](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B98]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFErrorRef CFWriteStreamCopyError(CFWriteStreamRef stream)
{
  return (CFErrorRef)MEMORY[0x270EE5520](stream);
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x270EE5528](stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x270EE5538](alloc, fileURL);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x270EE5558](stream);
}

CFIndex CFWriteStreamWrite(CFWriteStreamRef stream, const UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x270EE5590](stream, buffer, bufferLength);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x270EE5970](t1, t2);
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

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B88](red, green, blue, alpha);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5BC8](color);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x270EE5C20](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
{
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextBeginPath(CGContextRef c)
{
}

void CGContextBeginTransparencyLayer(CGContextRef c, CFDictionaryRef auxiliaryInfo)
{
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextClip(CGContextRef c)
{
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
}

void CGContextClosePath(CGContextRef c)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
}

void CGContextEndTransparencyLayer(CGContextRef c)
{
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextRelease(CGContextRef c)
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

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextStrokeEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextStrokeRectWithWidth(CGContextRef c, CGRect rect, CGFloat width)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGGradientRef CGGradientCreateWithColorComponents(CGColorSpaceRef space, const CGFloat *components, const CGFloat *locations, size_t count)
{
  return (CGGradientRef)MEMORY[0x270EE6680](space, components, locations, count);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x270EE6690](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
}

uint64_t CGImageCreateEXIFJPEGData()
{
  return MEMORY[0x270EF4EC8]();
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x270EE6750](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x270EE6790](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x270EE67A0](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x270EE67C0](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x270EE67E8](image);
}

const CGFloat *__cdecl CGImageGetDecode(CGImageRef image)
{
  return (const CGFloat *)MEMORY[0x270EE67F0](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

BOOL CGImageGetShouldInterpolate(CGImageRef image)
{
  return MEMORY[0x270EE6848](image);
}

uint64_t CGImageGetSizeAfterOrientation()
{
  return MEMORY[0x270EE6850]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

CGImageRef CGImageMaskCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate)
{
  return (CGImageRef)MEMORY[0x270EE6888](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, provider, decode, shouldInterpolate);
}

CGMutableImageMetadataRef CGImageMetadataCreateMutable(void)
{
  return (CGMutableImageMetadataRef)MEMORY[0x270EF4F80]();
}

CFDataRef CGImageMetadataCreateXMPData(CGImageMetadataRef metadata, CFDictionaryRef options)
{
  return (CFDataRef)MEMORY[0x270EF4F90](metadata, options);
}

BOOL CGImageMetadataRegisterNamespaceForPrefix(CGMutableImageMetadataRef metadata, CFStringRef xmlns, CFStringRef prefix, CFErrorRef *err)
{
  return MEMORY[0x270EF4FA0](metadata, xmlns, prefix, err);
}

BOOL CGImageMetadataSetValueWithPath(CGMutableImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path, CFTypeRef value)
{
  return MEMORY[0x270EF4FC0](metadata, parent, path, value);
}

void CGImageRelease(CGImageRef image)
{
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x270EF5000](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5030](data, options);
}

uint64_t CGImageWriteEXIFJPEGToPath()
{
  return MEMORY[0x270EF5090]();
}

uint64_t CGImageWriteEXIFJPEGWithMetadata()
{
  return MEMORY[0x270EF5098]();
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathAddPath(CGMutablePathRef path1, const CGAffineTransform *m, CGPathRef path2)
{
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

void CGPathApplyWithBlock(CGPathRef path, CGPathApplyBlock block)
{
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7008](path, transform);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7050](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7058](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  MEMORY[0x270EE7070](path);
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point)
{
  return (CFDictionaryRef)MEMORY[0x270EE7150]((__n128)point, *(__n128 *)&point.y);
}

BOOL CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGPoint *point)
{
  return MEMORY[0x270EE7160](dict, point);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
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
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
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

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x270EE7268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x270EE7278](dict, rect);
}

CGRect CGRectStandardize(CGRect rect)
{
  MEMORY[0x270EE7288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGSize CGSizeApplyAffineTransform(CGSize size, CGAffineTransform *t)
{
  MEMORY[0x270EE7330](t, (__n128)size, *(__n128 *)&size.height);
  result.double height = v3;
  result.double width = v2;
  return result;
}

uint64_t CLLocationCoordinate2DGetDistanceFrom()
{
  return MEMORY[0x270EE7458]();
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x270EE7460]((__n128)coord, *(__n128 *)&coord.longitude);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  MEMORY[0x270EE7470](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t CMBaseObjectGetVTable()
{
  return MEMORY[0x270EE79D0]();
}

CMClockRef CMClockGetHostTimeClock(void)
{
  return (CMClockRef)MEMORY[0x270EE7AA0]();
}

CMTime *__cdecl CMClockGetTime(CMTime *__return_ptr retstr, CMClockRef clock)
{
  return (CMTime *)MEMORY[0x270EE7AA8](retstr, clock);
}

CFDictionaryRef CMCopyDictionaryOfAttachments(CFAllocatorRef allocator, CMAttachmentBearerRef target, CMAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x270EE7AC8](allocator, target, *(void *)&attachmentMode);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x270EE7B10](desc);
}

CMMediaType CMFormatDescriptionGetMediaType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x270EE7B20](desc);
}

CFArrayRef CMMetadataFormatDescriptionGetIdentifiers(CMMetadataFormatDescriptionRef desc)
{
  return (CFArrayRef)MEMORY[0x270EE7B70](desc);
}

uint64_t CMPhotoCompressionSessionAddAuxiliaryImageFromDictionaryRepresentation()
{
  return MEMORY[0x270F12E30]();
}

uint64_t CMPhotoCompressionSessionAddImage()
{
  return MEMORY[0x270F12E48]();
}

uint64_t CMPhotoCompressionSessionCloseContainerAndCopyBacking()
{
  return MEMORY[0x270F12E78]();
}

uint64_t CMPhotoCompressionSessionCreate()
{
  return MEMORY[0x270F12E80]();
}

uint64_t CMPhotoCompressionSessionOpenEmptyContainer()
{
  return MEMORY[0x270F12EA8]();
}

uint64_t CMPhotoDecompressionCreateCVPixelBufferForIndex()
{
  return MEMORY[0x270F12F70]();
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x270EE7C48](sbuf);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x270EE7DD0](time1, time2);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x270EE7DE0](time, allocator);
}

CFStringRef CMTimeCopyDescription(CFAllocatorRef allocator, CMTime *time)
{
  return (CFStringRef)MEMORY[0x270EE7DF0](allocator, time);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E08](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x270EE7E10](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x270EE7E20](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x270EE7E38](retstr, *(void *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x270EE7F08](retstr, lhs, rhs);
}

OSStatus CMVideoFormatDescriptionCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x270EE7FB8](allocator, imageBuffer, formatDescriptionOut);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x270EE7FD0](videoDesc);
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken()
{
  return MEMORY[0x270F0CD10]();
}

uint64_t CPPowerAssertionCreate()
{
  return MEMORY[0x270F0CDC0]();
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x270F0CDD0]();
}

CGPathRef CTFontCreatePathForGlyph(CTFontRef font, CGGlyph glyph, const CGAffineTransform *matrix)
{
  return (CGPathRef)MEMORY[0x270EE9AD0](font, glyph, matrix);
}

void CTFrameGetLineOrigins(CTFrameRef frame, CFRange range, CGPoint *origins)
{
}

CFArrayRef CTFrameGetLines(CTFrameRef frame)
{
  return (CFArrayRef)MEMORY[0x270EE9D18](frame);
}

CTFrameRef CTFramesetterCreateFrame(CTFramesetterRef framesetter, CFRange stringRange, CGPathRef path, CFDictionaryRef frameAttributes)
{
  return (CTFrameRef)MEMORY[0x270EE9D38](framesetter, stringRange.location, stringRange.length, path, frameAttributes);
}

CTFramesetterRef CTFramesetterCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTFramesetterRef)MEMORY[0x270EE9D40](attrString);
}

CGSize CTFramesetterSuggestFrameSizeWithConstraints(CTFramesetterRef framesetter, CFRange stringRange, CFDictionaryRef frameAttributes, CGSize constraints, CFRange *fitRange)
{
  MEMORY[0x270EE9D48](framesetter, stringRange.location, stringRange.length, frameAttributes, fitRange, (__n128)constraints, *(__n128 *)&constraints.height);
  result.double height = v6;
  result.double width = v5;
  return result;
}

CFArrayRef CTLineGetGlyphRuns(CTLineRef line)
{
  return (CFArrayRef)MEMORY[0x270EE9DC0](line);
}

CTParagraphStyleRef CTParagraphStyleCreate(const CTParagraphStyleSetting *settings, size_t settingCount)
{
  return (CTParagraphStyleRef)MEMORY[0x270EE9E18](settings, settingCount);
}

CFDictionaryRef CTRunGetAttributes(CTRunRef run)
{
  return (CFDictionaryRef)MEMORY[0x270EE9E50](run);
}

CFIndex CTRunGetGlyphCount(CTRunRef run)
{
  return MEMORY[0x270EE9E68](run);
}

void CTRunGetGlyphs(CTRunRef run, CFRange range, CGGlyph *buffer)
{
}

void CTRunGetPositions(CTRunRef run, CFRange range, CGPoint *buffer)
{
}

uint64_t CTRunGetStretchFactors()
{
  return MEMORY[0x270EE9EA0]();
}

CFTypeRef CVBufferGetAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x270EE9FD0](buffer, key, attachmentMode);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA150](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA170](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

uint64_t CVPixelBufferGetAttributes()
{
  return MEMORY[0x270EEA188]();
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x270EEA200](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA218](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA288](allocator, pixelBufferPool, pixelBufferOut);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x270EEA320](texture);
}

uint64_t CacheDeleteCancelPurge()
{
  return MEMORY[0x270F13078]();
}

uint64_t CacheDeleteCopyAvailableSpaceForVolume()
{
  return MEMORY[0x270F13080]();
}

uint64_t CacheDeleteCopyItemizedPurgeableSpaceWithInfo()
{
  return MEMORY[0x270F13088]();
}

uint64_t CacheDeletePurgeSpaceWithInfo()
{
  return MEMORY[0x270F130A8]();
}

uint64_t CacheDeleteRegisterLowDiskFailure()
{
  return MEMORY[0x270F130C0]();
}

uint64_t FigCaptureGetModelSpecificName()
{
  return MEMORY[0x270F12C68]();
}

uint64_t FigCreateIOSurfaceBackedCVPixelBuffer()
{
  return MEMORY[0x270F065F8]();
}

uint64_t FigCreateIOSurfaceBackedCVPixelBufferWithAttributes()
{
  return MEMORY[0x270F06600]();
}

uint64_t FigSampleBufferProcessorGetFigBaseObject()
{
  return MEMORY[0x270EF5D70]();
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4C50](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x270EF4C58](buffer);
}

uint64_t IOSurfaceGetBulkAttachments()
{
  return MEMORY[0x270EF4C90]();
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D68](buffer);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D80](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x270EF4E18](buffer, *(void *)&options, seed);
}

uint64_t IOSurfaceSetBulkAttachments2()
{
  return MEMORY[0x270EF4E40]();
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x270EF4E88](buffer, *(void *)&options, seed);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x270EF5E20]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2AD0]();
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x270F82BC0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F82BC8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F82BD0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x270EF2C18](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t NUOrientationTransformRect()
{
  return MEMORY[0x270F4E468]();
}

uint64_t PFFigCreateCGImageFromImageData()
{
  return MEMORY[0x270F53AB8]();
}

uint64_t PFFigCreateCVPixelBufferFromImageData()
{
  return MEMORY[0x270F53AC0]();
}

uint64_t PFFigJPEGDataFromImage()
{
  return MEMORY[0x270F53AC8]();
}

uint64_t PFReadImageDisplayTimeFromVideoFileAtPath()
{
  return MEMORY[0x270F53AE8]();
}

uint64_t PFReadPairingIdentifierFromVideoAtPath()
{
  return MEMORY[0x270F53AF0]();
}

uint64_t PLCloudPhotoLibraryKeepOriginalsIsEnabled()
{
  return MEMORY[0x270F53728]();
}

uint64_t PLCreateImageFromPreviewImageSurface()
{
  return MEMORY[0x270F537E8]();
}

uint64_t PLDebugEnableCoreDataMultithreadedAsserts()
{
  return MEMORY[0x270F537F0]();
}

uint64_t PLDegreesForImageOrientation()
{
  return MEMORY[0x270F537F8]();
}

uint64_t PLExifOrientationFromImageOrientation()
{
  return MEMORY[0x270F53800]();
}

uint64_t PLExifOrientationSwapsWidthAndHeight()
{
  return MEMORY[0x270F53808]();
}

uint64_t PLImageOrientationFromDeviceOrientation()
{
  return MEMORY[0x270F53818]();
}

uint64_t PLImageOrientationFromExifOrientation()
{
  return MEMORY[0x270F53820]();
}

uint64_t PLImageOrientationIsMirrored()
{
  return MEMORY[0x270F53828]();
}

uint64_t PLIsCPLDataclassEnabled()
{
  return MEMORY[0x270F53758]();
}

uint64_t PLIsCamera()
{
  return MEMORY[0x270F53830]();
}

uint64_t PLPreviewImageAndDurationForVideoAtPath()
{
  return MEMORY[0x270F53770]();
}

uint64_t PLSensorOrientationFromCaptureOrientation()
{
  return MEMORY[0x270F538C8]();
}

uint64_t PPSCreateTelemetryIdentifier()
{
  return MEMORY[0x270F55168]();
}

uint64_t PPSSendTelemetry()
{
  return MEMORY[0x270F55170]();
}

uint64_t PXPreferencesIsCameraAutoShareEnabled()
{
  return MEMORY[0x270F53D08]();
}

uint64_t SBSRequestPasscodeUnlockUI()
{
  return MEMORY[0x270F771C0]();
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x270F82CA0]();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return MEMORY[0x270F82CA8](*(void *)&argc, argv, principalClassName, delegateClassName);
}

uint64_t UICeilToScale()
{
  return MEMORY[0x270F82CB8]();
}

uint64_t UICeilToViewScale()
{
  return MEMORY[0x270F82CC0]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x270F82CD0](category);
}

uint64_t UICreateCGImageFromIOSurface()
{
  return MEMORY[0x270F82CD8]();
}

uint64_t UIDistanceBetweenPointAndRect()
{
  return MEMORY[0x270F82CE8]();
}

uint64_t UIDistanceBetweenPoints()
{
  return MEMORY[0x270F82CF0]();
}

uint64_t UIEdgeInsetsAdd()
{
  return MEMORY[0x270F82CF8]();
}

uint64_t UIEdgeInsetsMakeWithEdges()
{
  return MEMORY[0x270F82D00]();
}

uint64_t UIEdgeInsetsMax()
{
  return MEMORY[0x270F82D08]();
}

uint64_t UIFloorToViewScale()
{
  return MEMORY[0x270F82D28]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
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

uint64_t UIIntegralTransform()
{
  return MEMORY[0x270F82DE8]();
}

uint64_t UIPointRoundToViewScale()
{
  return MEMORY[0x270F82E50]();
}

uint64_t UIRectCenteredAboutPoint()
{
  return MEMORY[0x270F82E58]();
}

uint64_t UIRectCenteredAboutPointScale()
{
  return MEMORY[0x270F82E60]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x270F82E68]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x270F82E70]();
}

uint64_t UIRectCenteredRect()
{
  return MEMORY[0x270F82E78]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x270F82E88]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x270F82E90]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x270F82E98]();
}

void UIRectFill(CGRect rect)
{
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x270F82EB8]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x270F82EC0]();
}

uint64_t UIRectInsetEdges()
{
  return MEMORY[0x270F82EC8]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x270F82ED0]();
}

uint64_t UIRectRoundToScale()
{
  return MEMORY[0x270F82EE0]();
}

uint64_t UIRectRoundToViewScale()
{
  return MEMORY[0x270F82EE8]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x270F82EF0]();
}

uint64_t UIRoundToScreenScale()
{
  return MEMORY[0x270F82EF8]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x270F82F00]();
}

uint64_t UISizeCeilToScale()
{
  return MEMORY[0x270F82F10]();
}

uint64_t UISizeRoundToScale()
{
  return MEMORY[0x270F82F18]();
}

uint64_t VTImageRotationSessionCreate()
{
  return MEMORY[0x270F06758]();
}

uint64_t VTImageRotationSessionInvalidate()
{
  return MEMORY[0x270F06760]();
}

uint64_t VTImageRotationSessionTransferImage()
{
  return MEMORY[0x270F06778]();
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x270F067E0](allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x270F067F0](session, sourceBuffer, destinationBuffer);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x270F06820](session, propertyKey, propertyValue);
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

uint64_t _NSStringFromUIPhysicalButton()
{
  return MEMORY[0x270F82F38]();
}

uint64_t _NSStringFromUIPhysicalButtonState()
{
  return MEMORY[0x270F82F40]();
}

uint64_t _NSStringFromUITouchSenstiveButtonPositionHint()
{
  return MEMORY[0x270F82F48]();
}

uint64_t _UIScaleTransformForAspectFitOfSizeInTargetSize()
{
  return MEMORY[0x270F82FD8]();
}

uint64_t _UIWindowConvertRectFromOrientationToOrientation()
{
  return MEMORY[0x270F83040]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
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

void abort(void)
{
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

long double atan(long double __x)
{
  MEMORY[0x270ED86A0](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

float atanf(float a1)
{
  MEMORY[0x270ED86C0](a1);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

uint64_t ct_green_tea_logger_create()
{
  return MEMORY[0x270F91820]();
}

uint64_t ct_green_tea_logger_destroy()
{
  return MEMORY[0x270F91838]();
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

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x270ED9320](key);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
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

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_resume(dispatch_object_t object)
{
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

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
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

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x270ED9718]();
}

long double exp2(long double __x)
{
  MEMORY[0x270ED9860](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

int fileno(FILE *a1)
{
  return MEMORY[0x270ED9978](a1);
}

int flock(int a1, int a2)
{
  return MEMORY[0x270ED9998](*(void *)&a1, *(void *)&a2);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x270ED9AB8](a1, a2, a3, *(void *)&a4);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x270ED9AC0](a1, a2, *(void *)&a3);
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x270ED9AC8](__stream, a2, *(void *)&__whence);
}

off_t ftello(FILE *__stream)
{
  return MEMORY[0x270ED9B20](__stream);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x270ED9B30](*(void *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x270F91848]();
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

uint64_t ledger()
{
  return MEMORY[0x270EDA040]();
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x270EDA0D8](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
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

void objc_moveWeak(id *to, id *from)
{
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

uint64_t pl_dispatch_after()
{
  return MEMORY[0x270F538F0]();
}

uint64_t pl_dispatch_async()
{
  return MEMORY[0x270F538F8]();
}

uint64_t pl_dispatch_group_notify()
{
  return MEMORY[0x270F53908]();
}

uint64_t pl_dispatch_sync()
{
  return MEMORY[0x270F53910]();
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x270EDAD60](*(void *)&pid, buffer, *(void *)&buffersize);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  double v4 = (const char *)MEMORY[0x270F9AAC8](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

int rand(void)
{
  return MEMORY[0x270EDB0D8]();
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270EDB460](path, name, value, size, *(void *)&position, *(void *)&options);
}

long double sin(long double __x)
{
  MEMORY[0x270EDB4E8](__x);
  return result;
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x270EDB508](*(void *)&a1);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x270EDB570](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x270FA0270]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
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

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
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

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x270FA05D8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x270FA05E0]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x270FA0600]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x270FA0608]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}