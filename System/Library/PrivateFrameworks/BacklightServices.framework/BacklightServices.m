void sub_1B55DF5A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id bls_scenes_log()
{
  if (bls_scenes_log_onceToken != -1) {
    dispatch_once(&bls_scenes_log_onceToken, &__block_literal_global_19);
  }
  v0 = (void *)bls_scenes_log___logger;

  return v0;
}

void sub_1B55E05DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __bls_scenes_log_block_invoke()
{
  bls_scenes_log___logger = (uint64_t)os_log_create("com.apple.BacklightServices", "scenes");

  return MEMORY[0x1F41817F8]();
}

uint64_t BLSDeviceSupports1HzFlipbook()
{
  uint64_t v0 = MGGetBoolAnswer();
  if (!os_variant_has_internal_diagnostics() || (v0 & 1) != 0) {
    return v0;
  }

  return MEMORY[0x1F40C9FB0]("NanoTimeKitExtras", "aod_vibrancy_override");
}

uint64_t BLSBacklightFBSSceneEnvironmentDeltaDescription(unsigned int a1)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"{ visualState:%u date:%u active:%u blanked:%u seed:%u }", (a1 >> 3) & 1, (a1 >> 4) & 1, (a1 >> 1) & 1, (a1 >> 2) & 1, (a1 >> 5) & 1);
}

_DWORD *BLSStateDataWithTitleDescriptionAndHints(void *a1, void *a2)
{
  v3 = a1;
  id v4 = a2;
  if (!v3 || ![(__CFString *)v3 length])
  {

    v3 = @"<nil title>";
  }
  if (!v4
    || ![v4 length]
    || ![MEMORY[0x1E4F28F98] propertyList:v4 isValidForFormat:200])
  {
    v8 = [NSString stringWithFormat:@"no descriptive state data or state data is not in property list format, please file a radar, description = %@", v4];
    id v11 = 0;
    v5 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v8 format:200 options:0 error:&v11];
    id v6 = v11;

    if (!v5) {
      goto LABEL_8;
    }
LABEL_10:
    size_t v9 = [v5 length];
    v7 = malloc_type_calloc(1uLL, v9 + 200, 0x3693A2F2uLL);
    _DWORD *v7 = 1;
    v7[1] = v9;
    [(__CFString *)v3 UTF8String];
    __strlcpy_chk();
    memcpy(v7 + 50, (const void *)[v5 bytes], v9);
    goto LABEL_11;
  }
  id v12 = 0;
  v5 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v4 format:200 options:0 error:&v12];
  id v6 = v12;
  if (v5) {
    goto LABEL_10;
  }
LABEL_8:
  v7 = malloc_type_calloc(1uLL, 0xC8uLL, 0xA1CF3351uLL);
LABEL_11:

  return v7;
}

BOOL BLSBacklightStateIsActive(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

__CFString *NSStringFromBLSBacklightState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"Off";
  }
  else {
    return off_1E61071C0[a1 - 1];
  }
}

__CFString *NSStringFromBLSFlipbookState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4) {
    return @"Off";
  }
  else {
    return off_1E6107198[a1 - 1];
  }
}

__CFString *NSStringFromBLSBacklightChangeEvents(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 count];
  uint64_t v6 = [v4 count];
  uint64_t v7 = v6;
  if (v5)
  {
    v8 = [v3 firstObject];
    uint64_t v9 = [v8 previousState];
    uint64_t v10 = [v8 state];
    id v11 = objc_opt_new();
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __NSStringFromBLSBacklightChangeEvents_block_invoke;
    v19[3] = &unk_1E6107128;
    uint64_t v22 = v5;
    uint64_t v23 = v9;
    uint64_t v24 = v10;
    id v12 = v11;
    id v20 = v12;
    id v21 = v3;
    [v12 appendCustomFormatWithName:0 block:v19];
    if (v7)
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"aborted:(%u){", v7);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __NSStringFromBLSBacklightChangeEvents_block_invoke_3;
      v16[3] = &unk_1E6106FA8;
      id v17 = v4;
      id v18 = v12;
      [v18 appendBodySectionWithOpenDelimiter:v13 closeDelimiter:@"} " block:v16];
    }
    v14 = [v12 description];

LABEL_9:
    goto LABEL_10;
  }
  if (v6)
  {
    v8 = bls_backlight_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      NSStringFromBLSBacklightChangeEvents_cold_1((uint64_t)v3, (uint64_t)v4, v8);
    }
    v14 = @"<NULL>";
    goto LABEL_9;
  }
  v14 = @"<NULL>";
LABEL_10:

  return v14;
}

void __NSStringFromBLSBacklightChangeEvents_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(v3, "appendFormat:", @"(%u){ ", *(void *)(a1 + 48));
  uint64_t v4 = *(void *)(a1 + 56);
  if (v4 == *(void *)(a1 + 64))
  {
    uint64_t v5 = @"<->";
  }
  else
  {
    unint64_t v6 = v4 - 1;
    if (v6 > 2) {
      uint64_t v7 = @"Off";
    }
    else {
      uint64_t v7 = off_1E61071C0[v6];
    }
    [v3 appendString:v7];
    uint64_t v5 = @"->";
  }
  [v3 appendString:v5];
  unint64_t v8 = *(void *)(a1 + 64) - 1;
  if (v8 > 2) {
    uint64_t v9 = @"Off";
  }
  else {
    uint64_t v9 = off_1E61071C0[v8];
  }
  [v3 appendString:v9];
  [v3 appendString:@": "];
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  char v15 = 1;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __NSStringFromBLSBacklightChangeEvents_block_invoke_2;
  v11[3] = &unk_1E6107100;
  uint64_t v10 = *(void **)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  v13 = v14;
  [v10 appendCustomFormatWithName:0 block:v11];
  [v3 appendString:@" } "];

  _Block_object_dispose(v14, 8);
}

void sub_1B55E5654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __NSStringFromBLSBacklightChangeEvents_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(obj);
        }
        unint64_t v8 = [*(id *)(*((void *)&v13 + 1) + 8 * v7) changeRequest];
        uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
        if (*(unsigned char *)(v9 + 24)) {
          *(unsigned char *)(v9 + 24) = 0;
        }
        else {
          [v3 appendString:@", "];
        }
        [v3 appendString:@"\""];
        uint64_t v10 = [v8 explanation];
        [v3 appendString:v10];

        objc_msgSend(v3, "appendString:", @"\"(");
        id v11 = NSStringFromBLSBacklightChangeSourceEvent([v8 sourceEvent]);
        [v3 appendString:v11];

        [v3 appendString:@""]);
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

void __NSStringFromBLSBacklightChangeEvents_block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) objectEnumerator];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  long long v13 = __Block_byref_object_copy_;
  long long v14 = __Block_byref_object_dispose_;
  id v15 = [v2 nextObject];
  if (v11[5])
  {
    uint64_t v3 = MEMORY[0x1E4F143A8];
    do
    {
      uint64_t v4 = *(void **)(a1 + 40);
      v6[0] = v3;
      v6[1] = 3221225472;
      v6[2] = __NSStringFromBLSBacklightChangeEvents_block_invoke_63;
      v6[3] = &unk_1E6107178;
      uint64_t v9 = &v10;
      id v5 = v4;
      id v7 = v5;
      id v8 = v2;
      [v5 appendCustomFormatWithName:0 block:v6];
    }
    while (v11[5]);
  }
  _Block_object_dispose(&v10, 8);
}

void sub_1B55E5988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void __NSStringFromBLSBacklightChangeEvents_block_invoke_63(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) previousState];
  uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) state];
  if (v4 == v5)
  {
    uint64_t v6 = @"<->";
  }
  else
  {
    if ((unint64_t)(v4 - 1) > 2) {
      id v7 = @"Off";
    }
    else {
      id v7 = off_1E61071C0[v4 - 1];
    }
    [v3 appendString:v7];
    uint64_t v6 = @"->";
  }
  [v3 appendString:v6];
  if ((unint64_t)(v5 - 1) > 2) {
    id v8 = @"Off";
  }
  else {
    id v8 = off_1E61071C0[v5 - 1];
  }
  [v3 appendString:v8];
  [v3 appendString:@": "];
  uint64_t v9 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __NSStringFromBLSBacklightChangeEvents_block_invoke_2_64;
  v12[3] = &unk_1E6107150;
  long long v11 = *(_OWORD *)(a1 + 40);
  id v10 = (id)v11;
  long long v13 = v11;
  uint64_t v14 = v5;
  [v9 appendCustomFormatWithName:0 block:v12];
}

void __NSStringFromBLSBacklightChangeEvents_block_invoke_2_64(uint64_t a1, void *a2)
{
  id v12 = a2;
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v3)
  {
    char v4 = 1;
    while (1)
    {
      uint64_t v5 = [v3 changeRequest];
      if ((v4 & 1) == 0) {
        [v12 appendString:@", "];
      }
      [v12 appendString:@"\""];
      uint64_t v6 = [v5 explanation];
      [v12 appendString:v6];

      objc_msgSend(v12, "appendString:", @"\"(");
      id v7 = NSStringFromBLSBacklightChangeSourceEvent([v5 sourceEvent]);
      [v12 appendString:v7];

      [v12 appendString:@""]);
      uint64_t v8 = [*(id *)(a1 + 32) nextObject];
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      long long v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      if (!v11 || [v11 state] != *(void *)(a1 + 48)) {
        break;
      }

      char v4 = 0;
      id v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      if (!v3) {
        goto LABEL_10;
      }
    }
  }
LABEL_10:
}

unint64_t BLSUInt64Distance(unint64_t a1, unint64_t a2)
{
  if (a1 <= a2) {
    return a2 - a1;
  }
  else {
    return a1 - a2;
  }
}

BOOL BLSUInt64ApproximatelyEqualToUInt64(unint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v3 = a2 - a1;
  if (a1 > a2) {
    unint64_t v3 = a1 - a2;
  }
  return v3 < a3;
}

uint64_t BLSCompareUInt64(unint64_t a1, unint64_t a2)
{
  if (a1 < a2) {
    return -1;
  }
  else {
    return a2 < a1;
  }
}

uint64_t BLSCompareUInt64WithTolerance(unint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a3 + a1 < a2) {
    return -1;
  }
  else {
    return a3 + a2 < a1;
  }
}

void sub_1B55E69CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B55E6AF0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B55E6F04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state)
{
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

unint64_t BLSMachTimeFromNSTimeInterval(double a1)
{
  if (BLSMachTimeFromNSTimeInterval_onceToken != -1) {
    dispatch_once(&BLSMachTimeFromNSTimeInterval_onceToken, &__block_literal_global_78);
  }
  return (unint64_t)(a1 / *(double *)&BLSMachTimeFromNSTimeInterval___TimeScale);
}

id BLSLoggingStringForContinuousMachTime(double a1)
{
  v2 = NSString;
  id v3 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  char v4 = objc_msgSend(v3, "bls_initWithMachContinuousTime:", (unint64_t)a1);
  uint64_t v5 = objc_msgSend(v4, "bls_loggingString");
  uint64_t v6 = [v2 stringWithFormat:@"%lf approx:%@", *(void *)&a1, v5];

  return v6;
}

id BLSShortLoggingStringForContinuousMachTime(double a1)
{
  v2 = NSString;
  id v3 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  char v4 = objc_msgSend(v3, "bls_initWithMachContinuousTime:", (unint64_t)a1);
  uint64_t v5 = objc_msgSend(v4, "bls_shortLoggingString");
  uint64_t v6 = [v2 stringWithFormat:@"%lf approx:%@", *(void *)&a1, v5];

  return v6;
}

id BLSLoggingStringForMachTime(uint64_t a1)
{
  v2 = NSString;
  id v3 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  char v4 = objc_msgSend(v3, "bls_initWithMachContinuousTime:", a1);
  uint64_t v5 = objc_msgSend(v4, "bls_loggingString");
  uint64_t v6 = [v2 stringWithFormat:@"%llu approx:%@", a1, v5];

  return v6;
}

id BLSShortLoggingStringForMachTime(uint64_t a1)
{
  v2 = NSString;
  id v3 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  char v4 = objc_msgSend(v3, "bls_initWithMachContinuousTime:", a1);
  uint64_t v5 = objc_msgSend(v4, "bls_shortLoggingString");
  uint64_t v6 = [v2 stringWithFormat:@"%llu approx:%@", a1, v5];

  return v6;
}

id BLSLoggingStringForMachInterval(unint64_t a1, unint64_t a2)
{
  char v4 = NSString;
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%llu->%llu (%llu∆)", a1, a2, BLSUInt64Distance(a2, a1));
  id v6 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v7 = objc_msgSend(v6, "bls_initWithStartMachContinuousTime:endMachContinuousTime:", a1, a2);
  uint64_t v8 = objc_msgSend(v7, "bls_shortLoggingString");
  uint64_t v9 = [v4 stringWithFormat:@"%@ approx:%@", v5, v8];

  return v9;
}

uint64_t BLSShortLoggingStringForMachInterval(unint64_t a1, unint64_t a2)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"%llu->%llu (%llu∆)", a1, a2, BLSUInt64Distance(a2, a1));
}

double __BLSMachTimeFromNSTimeInterval_block_invoke()
{
  mach_timebase_info info = 0;
  if (!mach_timebase_info(&info))
  {
    LODWORD(result) = info.numer;
    LODWORD(v1) = info.denom;
    double result = (double)*(unint64_t *)&result / (double)v1 / 1000000000.0;
    BLSMachTimeFromNSTimeInterval___TimeScale = *(void *)&result;
  }
  return result;
}

uint64_t BLSMachContinuousTimeFromMachAbsoluteTime(uint64_t a1)
{
  return a1;
}

void sub_1B55EA458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1B55EA69C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_1B55ED314(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B55ED39C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B55ED424(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B55ED4CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B55ED568(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B55ED640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1B55ED768(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B55ED904(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B55EDC38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1B55EDEDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B55EE3D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void **a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id a35,uint64_t a36,id a37)
{
  BLSTimelineEntryBookkeeper::~BLSTimelineEntryBookkeeper(&a37);

  std::vector<BLSTimelineEntryBookkeeper>::__destroy_vector::operator()[abi:ne180100](&a18);
  _Unwind_Resume(a1);
}

void BLSTimelineEntryBookkeeper::~BLSTimelineEntryBookkeeper(id *this)
{
}

void sub_1B55EE968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_1B55EED04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1B55EF028(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BLSTimelineEntriesCombiner::constructFrameSpecifiers(BLSTimelineEntriesCombiner *this)
{
  v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = 0;
  while (1)
  {
    char v4 = BLSTimelineEntriesCombiner::nextSpecifier(this);

    if (!v4) {
      break;
    }
    uint64_t v5 = (void *)*((void *)this + 4);
    id v6 = [v4 presentationInterval];
    id v7 = [v6 startDate];
    uint64_t v8 = [v5 compare:v7];

    if (v8 == -1) {
      break;
    }
    id v3 = v4;
    [v2 addObject:v4];
  }

  return v2;
}

void sub_1B55EF178(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void BLSTimelineEntriesCombiner::~BLSTimelineEntriesCombiner(id *this)
{
  v2 = this;
  std::vector<BLSTimelineEntryIterator>::__destroy_vector::operator()[abi:ne180100](&v2);
}

void sub_1B55EF32C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B55EF49C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B55EF578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1B55EF618(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B55EFBE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,void *a42,void *a43,void *a44,void *a45,void *a46)
{
  _Unwind_Resume(a1);
}

void sub_1B55EFE84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B55F0018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B55F00E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1B55F01C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B55F052C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B55F063C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B55F0724(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B55F0808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1B55F0994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B55F0BA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1B55F0E88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B55F0F5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

uint64_t std::vector<BLSTimelineEntryBookkeeper>::push_back[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= v6)
  {
    unint64_t v10 = 0x8E38E38E38E38E39 * ((uint64_t)(v7 - *a1) >> 3);
    if (v10 + 1 > 0x38E38E38E38E38ELL) {
      std::vector<BLSTimelineEntryBookkeeper>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v11 = 0x8E38E38E38E38E39 * ((uint64_t)(v5 - *a1) >> 3);
    uint64_t v12 = 2 * v11;
    if (2 * v11 <= v10 + 1) {
      uint64_t v12 = v10 + 1;
    }
    if (v11 >= 0x1C71C71C71C71C7) {
      unint64_t v13 = 0x38E38E38E38E38ELL;
    }
    else {
      unint64_t v13 = v12;
    }
    uint64_t v19 = v4;
    if (v13) {
      uint64_t v14 = (char *)std::allocator<BLSTimelineEntryBookkeeper>::allocate_at_least[abi:ne180100](v4, v13);
    }
    else {
      uint64_t v14 = 0;
    }
    id v15 = v14;
    long long v16 = &v14[72 * v10];
    uint64_t v18 = &v14[72 * v13];
    std::construct_at[abi:ne180100]<BLSTimelineEntryBookkeeper,BLSTimelineEntryBookkeeper const&,BLSTimelineEntryBookkeeper*>((uint64_t)v16, a2);
    id v17 = v16 + 72;
    std::vector<BLSTimelineEntryBookkeeper>::__swap_out_circular_buffer(a1, &v15);
    uint64_t v9 = a1[1];
    uint64_t result = std::__split_buffer<BLSTimelineEntryBookkeeper>::~__split_buffer((uint64_t)&v15);
  }
  else
  {
    uint64_t result = std::construct_at[abi:ne180100]<BLSTimelineEntryBookkeeper,BLSTimelineEntryBookkeeper const&,BLSTimelineEntryBookkeeper*>(*(void *)(v4 - 8), a2);
    uint64_t v9 = v7 + 72;
    a1[1] = v7 + 72;
  }
  a1[1] = v9;
  return result;
}

void sub_1B55F10BC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<BLSTimelineEntryBookkeeper>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void BLSTimelineEntryBookkeeper::BLSTimelineEntryBookkeeper(BLSTimelineEntryBookkeeper *this, BLSAlwaysOnTimelineEntry *a2, BLSAlwaysOnTimelineEntry *a3, double a4)
{
  unint64_t v7 = a2;
  uint64_t v8 = a3;
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  uint64_t v9 = v7;
  *((void *)this + 2) = v9;
  unint64_t v10 = v8;
  *((void *)this + 3) = v10;
  *((void *)this + 4) = 0;
  *((double *)this + 5) = 1.0 / a4;
  *((void *)this + 6) = 0;
  *((void *)this + 7) = 0;
  *((unsigned char *)this + 64) = 0;
  if ([(BLSAlwaysOnTimelineEntry *)v9 isAnimated]
    && ([(BLSAlwaysOnTimelineEntry *)v9 duration], unint64_t v12 = vcvtad_u64_f64(v11 * a4), v12 >= 2))
  {
    *((unsigned char *)this + 64) = 1;
    *((void *)this + 6) = v12;
    *((void *)this + 7) = 1;
    uint64_t v13 = BLSTimelineEntryBookkeeper::presentationTimeForIndex((id *)this, 1uLL);
    uint64_t v14 = *(void **)this;
    *(void *)this = v13;

    uint64_t v15 = BLSTimelineEntryBookkeeper::presentationTimeForIndex((id *)this, 2uLL);
  }
  else
  {
    uint64_t v16 = [*((id *)this + 2) presentationTime];
    id v17 = *(void **)this;
    *(void *)this = v16;

    uint64_t v15 = 0;
  }
  uint64_t v18 = (void *)*((void *)this + 1);
  *((void *)this + 1) = v15;
}

void sub_1B55F11DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BLSTimelineEntryBookkeeper::presentationTimeForIndex(id *this, unint64_t a2)
{
  uint64_t v4 = [this[2] presentationTime];
  unint64_t v5 = v4;
  if (*((unsigned char *)this + 64))
  {
    id v6 = this[6];
    BOOL v7 = (unint64_t)v6 > a2;
    unint64_t v8 = (unint64_t)v6 - a2;
    if (v7)
    {
      uint64_t v9 = [v4 dateByAddingTimeInterval:-(*((double *)this + 5) * (double)v8)];

      unint64_t v5 = (void *)v9;
    }
  }
  if ((unint64_t)this[6] >= a2) {
    unint64_t v10 = v5;
  }
  else {
    unint64_t v10 = 0;
  }
  id v11 = v10;

  return v11;
}

void sub_1B55F12A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t std::construct_at[abi:ne180100]<BLSTimelineEntryBookkeeper,BLSTimelineEntryBookkeeper const&,BLSTimelineEntryBookkeeper*>(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(id *)a2;
  *(void *)(a1 + 8) = *(id *)(a2 + 8);
  *(void *)(a1 + 16) = *(id *)(a2 + 16);
  *(void *)(a1 + 24) = *(id *)(a2 + 24);
  *(void *)(a1 + 32) = *(id *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 49);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 49) = v4;
  return a1;
}

uint64_t std::vector<BLSTimelineEntryBookkeeper>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<BLSTimelineEntryBookkeeper>,std::reverse_iterator<BLSTimelineEntryBookkeeper*>,std::reverse_iterator<BLSTimelineEntryBookkeeper*>,std::reverse_iterator<BLSTimelineEntryBookkeeper*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void std::vector<BLSTimelineEntryBookkeeper>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E6106F08, MEMORY[0x1E4FBA1C8]);
}

void sub_1B55F1404(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void *std::allocator<BLSTimelineEntryBookkeeper>::allocate_at_least[abi:ne180100](uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x38E38E38E38E38FLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(72 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  unint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<BLSTimelineEntryBookkeeper>,std::reverse_iterator<BLSTimelineEntryBookkeeper*>,std::reverse_iterator<BLSTimelineEntryBookkeeper*>,std::reverse_iterator<BLSTimelineEntryBookkeeper*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  uint64_t result = a6;
  if (a3 != a5)
  {
    uint64_t v9 = (_OWORD *)(a7 - 32);
    do
    {
      long long v10 = *(_OWORD *)(a3 - 72);
      a3 -= 72;
      *(_OWORD *)a3 = 0uLL;
      *(_OWORD *)((char *)v9 - 40) = v10;
      long long v11 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)(a3 + 16) = 0uLL;
      *(_OWORD *)((char *)v9 - 24) = v11;
      uint64_t v12 = *(void *)(a3 + 32);
      *(void *)(a3 + 32) = 0;
      *((void *)v9 - 1) = v12;
      long long v13 = *(_OWORD *)(a3 + 40);
      *(_OWORD *)((char *)v9 + 9) = *(_OWORD *)(a3 + 49);
      *uint64_t v9 = v13;
      uint64_t v9 = (_OWORD *)((char *)v9 - 72);
      v7 -= 72;
    }
    while (a3 != a5);
  }
  return result;
}

void std::__destroy_at[abi:ne180100]<BLSTimelineEntryBookkeeper,0>(void **a1)
{
  v2 = *a1;
}

uint64_t std::__split_buffer<BLSTimelineEntryBookkeeper>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 72;
    std::__destroy_at[abi:ne180100]<BLSTimelineEntryBookkeeper,0>((void **)(i - 72));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t std::vector<BLSTimelineEntryBookkeeper>::__push_back_slow_path<BLSTimelineEntryBookkeeper>(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0x8E38E38E38E38E39 * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x38E38E38E38E38ELL) {
    std::vector<BLSTimelineEntryBookkeeper>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0x8E38E38E38E38E39 * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x1C71C71C71C71C7) {
    unint64_t v9 = 0x38E38E38E38E38ELL;
  }
  else {
    unint64_t v9 = v5;
  }
  v18[4] = a1 + 2;
  if (v9) {
    long long v10 = (char *)std::allocator<BLSTimelineEntryBookkeeper>::allocate_at_least[abi:ne180100](v7, v9);
  }
  else {
    long long v10 = 0;
  }
  long long v11 = &v10[72 * v4];
  v18[0] = v10;
  v18[1] = v11;
  v18[3] = &v10[72 * v9];
  long long v12 = *a2;
  *a2 = 0u;
  *(_OWORD *)long long v11 = v12;
  long long v13 = a2[1];
  a2[1] = 0u;
  *((_OWORD *)v11 + 1) = v13;
  uint64_t v14 = *((void *)a2 + 4);
  *((void *)a2 + 4) = 0;
  *((void *)v11 + 4) = v14;
  long long v15 = *(long long *)((char *)a2 + 40);
  *(_OWORD *)(v11 + 49) = *(long long *)((char *)a2 + 49);
  *(_OWORD *)(v11 + 40) = v15;
  v18[2] = v11 + 72;
  std::vector<BLSTimelineEntryBookkeeper>::__swap_out_circular_buffer(a1, v18);
  uint64_t v16 = a1[1];
  std::__split_buffer<BLSTimelineEntryBookkeeper>::~__split_buffer((uint64_t)v18);
  return v16;
}

void sub_1B55F1700(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<BLSTimelineEntryBookkeeper>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void BLSTimelineEntryBookkeeper::BLSTimelineEntryBookkeeper(BLSTimelineEntryBookkeeper *this, BLSAlwaysOnTimelineEntrySpecifier *a2)
{
  uint64_t v3 = a2;
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = [(BLSAlwaysOnTimelineEntrySpecifier *)v3 timelineEntry];
  *((void *)this + 3) = [(BLSAlwaysOnTimelineEntrySpecifier *)v3 previousTimelineEntry];
  unint64_t v4 = v3;
  *((void *)this + 4) = v4;
  *((void *)this + 5) = 0;
  *((void *)this + 6) = 0;
  *((void *)this + 7) = 0;
  *((unsigned char *)this + 64) = 0;
  uint64_t v5 = [*((id *)this + 2) presentationTime];
  uint64_t v6 = *(void **)this;
  *(void *)this = v5;

  uint64_t v7 = (void *)*((void *)this + 1);
  *((void *)this + 1) = 0;
}

void sub_1B55F17A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B55F18AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZZ115__BLSAlwaysOnTimeline_entryBookkeepersForDateInterval_shouldConstructStartEntry_framesPerSecond_previousSpecifier__ENK3__2clEP36BLSAlwaysOnTimelineUnconfiguredEntry_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentationTime];
}

id BLSTimelineEntryBookkeeper::entryFirstFramePresentationTime(BLSTimelineEntryBookkeeper *this, BLSAlwaysOnTimelineEntry *a2, double a3)
{
  unint64_t v4 = this;
  uint64_t v5 = [(BLSTimelineEntryBookkeeper *)v4 presentationTime];
  if ([(BLSTimelineEntryBookkeeper *)v4 isAnimated])
  {
    [(BLSTimelineEntryBookkeeper *)v4 duration];
    uint64_t v7 = [v5 dateByAddingTimeInterval:-1.0 / a3 * (double)(vcvtad_u64_f64(v6 * a3) - 1)];

    uint64_t v5 = (void *)v7;
  }

  return v5;
}

void sub_1B55F1988(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ___ZZ115__BLSAlwaysOnTimeline_entryBookkeepersForDateInterval_shouldConstructStartEntry_framesPerSecond_previousSpecifier__ENK3__2clEP36BLSAlwaysOnTimelineUnconfiguredEntry_block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 48) != -1)
  {
    unint64_t v1 = *(void **)(a1 + 40);
LABEL_5:
    v2 = [v1 presentationTime];
    goto LABEL_6;
  }
  if (*(void *)(a1 + 32))
  {
    unint64_t v1 = *(void **)(a1 + 32);
    goto LABEL_5;
  }
  v2 = [**(id **)(a1 + 56) endDate];
LABEL_6:

  return v2;
}

void std::vector<BLSTimelineEntryBookkeeper>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  unint64_t v1 = *a1;
  v2 = (void **)**a1;
  if (v2)
  {
    unint64_t v4 = (void **)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 9;
        std::__destroy_at[abi:ne180100]<BLSTimelineEntryBookkeeper,0>(v4);
      }
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::vector<BLSTimelineEntryIterator>::__push_back_slow_path<BLSTimelineEntryIterator>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xCCCCCCCCCCCCCCCDLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x666666666666666) {
    std::vector<BLSTimelineEntryBookkeeper>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xCCCCCCCCCCCCCCCDLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x333333333333333) {
    unint64_t v9 = 0x666666666666666;
  }
  else {
    unint64_t v9 = v5;
  }
  v15[4] = a1 + 2;
  long long v10 = (char *)std::allocator<BLSTimelineEntryIterator>::allocate_at_least[abi:ne180100](v7, v9);
  long long v11 = &v10[40 * v4];
  v15[0] = v10;
  v15[1] = v11;
  v15[3] = &v10[40 * v12];
  *long long v11 = *(unsigned char *)a2;
  *((void *)v11 + 2) = 0;
  *((void *)v11 + 3) = 0;
  *((void *)v11 + 1) = 0;
  *(_OWORD *)(v11 + 8) = *(_OWORD *)(a2 + 8);
  *((void *)v11 + 3) = *(void *)(a2 + 24);
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 8) = 0;
  *((void *)v11 + 4) = *(void *)(a2 + 32);
  v15[2] = v11 + 40;
  std::vector<BLSTimelineEntryIterator>::__swap_out_circular_buffer(a1, v15);
  uint64_t v13 = a1[1];
  std::__split_buffer<BLSTimelineEntryIterator>::~__split_buffer(v15);
  return v13;
}

void sub_1B55F1B98(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<BLSTimelineEntryIterator>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<BLSTimelineEntryIterator>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<BLSTimelineEntryIterator>,std::reverse_iterator<BLSTimelineEntryIterator*>,std::reverse_iterator<BLSTimelineEntryIterator*>,std::reverse_iterator<BLSTimelineEntryIterator*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::allocator<BLSTimelineEntryIterator>::allocate_at_least[abi:ne180100](uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(40 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<BLSTimelineEntryIterator>,std::reverse_iterator<BLSTimelineEntryIterator*>,std::reverse_iterator<BLSTimelineEntryIterator*>,std::reverse_iterator<BLSTimelineEntryIterator*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
  long long v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }
  else
  {
    do
    {
      char v8 = *(unsigned char *)(a3 - 40);
      a3 -= 40;
      *(unsigned char *)(v7 - 40) = v8;
      *(void *)(v7 - 24) = 0;
      *(void *)(v7 - 16) = 0;
      *(void *)(v7 - 32) = 0;
      *(_OWORD *)(v7 - 32) = *(_OWORD *)(a3 + 8);
      *(void *)(v7 - 16) = *(void *)(a3 + 24);
      *(void *)(a3 + 8) = 0;
      *(void *)(a3 + 16) = 0;
      *(void *)(a3 + 24) = 0;
      *(void *)(v7 - 8) = *(void *)(a3 + 32);
      uint64_t v7 = *((void *)&v14 + 1) - 40;
      *((void *)&v14 + 1) -= 40;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<BLSTimelineEntryIterator>,std::reverse_iterator<BLSTimelineEntryIterator*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<BLSTimelineEntryIterator>,std::reverse_iterator<BLSTimelineEntryIterator*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<BLSTimelineEntryIterator>,std::reverse_iterator<BLSTimelineEntryIterator*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<BLSTimelineEntryIterator>,std::reverse_iterator<BLSTimelineEntryIterator*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    uint64_t v3 = (void **)(v1 + 8);
    std::vector<BLSTimelineEntryBookkeeper>::__destroy_vector::operator()[abi:ne180100](&v3);
    v1 += 40;
  }
}

void **std::__split_buffer<BLSTimelineEntryIterator>::~__split_buffer(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void std::__split_buffer<BLSTimelineEntryIterator>::clear[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v2; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 40;
    unint64_t v4 = (void **)(i - 32);
    std::vector<BLSTimelineEntryBookkeeper>::__destroy_vector::operator()[abi:ne180100](&v4);
  }
}

uint64_t BLSTimelineEntriesCombiner::BLSTimelineEntriesCombiner(uint64_t a1, uint64_t a2, void *a3, double a4)
{
  id v7 = a3;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = 0;
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a1 + 24) = [v7 startDate];
  *(void *)(a1 + 32) = [v7 endDate];
  *(double *)(a1 + 40) = 0.9 / a4;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  BLSTimelineEntriesCombiner::computeNextEntry((BLSTimelineEntriesCombiner *)a1);

  return a1;
}

void sub_1B55F1EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
  a10 = v11;
  std::vector<BLSTimelineEntryIterator>::__destroy_vector::operator()[abi:ne180100](&a10);

  _Unwind_Resume(a1);
}

void BLSTimelineEntriesCombiner::computeNextEntry(BLSTimelineEntriesCombiner *this)
{
  uint64_t v1 = *(void *)this;
  uint64_t v2 = *((void *)this + 1);
  *((void *)this + 6) = *(void *)this;
  *((void *)this + 7) = v2;
  uint64_t v3 = v1 + 40;
  if (v1 + 40 != v2)
  {
    uint64_t v5 = (BLSTimelineEntryIterator *)(v1 + 40);
    while (1)
    {
      uint64_t v6 = BLSTimelineEntryIterator::nextPresentationTime(v5);
      id v7 = BLSTimelineEntryIterator::nextPresentationTime(*((BLSTimelineEntryIterator **)this + 6));
      if (v7)
      {
        if (![v6 isBeforeDate:v7]) {
          break;
        }
      }
      uint64_t v8 = *((void *)this + 6);
      *((void *)this + 6) = v3;
      *((void *)this + 7) = v8;
LABEL_13:

      uint64_t v5 = (BLSTimelineEntryIterator *)((char *)v5 + 40);
      v3 += 40;
      if (v5 == *((BLSTimelineEntryIterator **)this + 1)) {
        return;
      }
    }
    uint64_t v9 = (BLSTimelineEntryIterator *)*((void *)this + 7);
    if (v9 == *((BLSTimelineEntryIterator **)this + 1))
    {
      long long v10 = 0;
    }
    else
    {
      long long v10 = BLSTimelineEntryIterator::nextPresentationTime(v9);
      if (v10 && ![v6 isBeforeDate:v10]) {
        goto LABEL_12;
      }
    }
    *((void *)this + 7) = v3;
LABEL_12:

    goto LABEL_13;
  }
}

void sub_1B55F1FFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BLSTimelineEntryIterator::nextPresentationTime(BLSTimelineEntryIterator *this)
{
  uint64_t v1 = *((void *)this + 4);
  if (v1 == *((void *)this + 2)) {
    goto LABEL_5;
  }
  id v3 = *(id *)(v1 + 8);
  if (v3) {
    goto LABEL_6;
  }
  unint64_t v4 = (id *)(*((void *)this + 4) + 72);
  if (v4 == *((id **)this + 2)) {
LABEL_5:
  }
    id v3 = 0;
  else {
    id v3 = *v4;
  }
LABEL_6:

  return v3;
}

void std::vector<BLSTimelineEntryIterator>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    unint64_t v4 = (char *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        uint64_t v6 = v4 - 40;
        id v7 = (void **)(v4 - 32);
        std::vector<BLSTimelineEntryBookkeeper>::__destroy_vector::operator()[abi:ne180100](&v7);
        unint64_t v4 = v6;
      }
      while (v6 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

BLSAlwaysOnFrameSpecifier *BLSTimelineEntriesCombiner::nextSpecifier(BLSTimelineEntriesCombiner *this)
{
  uint64_t v1 = (unsigned char *)*((void *)this + 1);
  if (*((unsigned char **)this + 6) == v1)
  {
    long long v14 = 0;
    goto LABEL_31;
  }
  for (uint64_t i = *(unsigned char **)this; i != v1; i += 40)
    *uint64_t i = 0;
  id v4 = *((id *)this + 4);
  uint64_t v5 = 0;
  while (1)
  {
    uint64_t v6 = BLSTimelineEntryIterator::nextPresentationTime(*((BLSTimelineEntryIterator **)this + 6));
    id v7 = (id)v6;
    if (!v5) {
      break;
    }
    if (!v6) {
      goto LABEL_10;
    }
    uint64_t v8 = (BLSTimelineEntryIterator *)*((void *)this + 1);
    uint64_t v9 = (BLSTimelineEntryIterator *)*((void *)this + 7);
    if (v9 != v8)
    {
      long long v10 = BLSTimelineEntryIterator::nextPresentationTime(v9);
      int v11 = [v7 isAfterDate:v10];

      if (v11)
      {
LABEL_10:
        BLSTimelineEntriesCombiner::computeNextEntry(this);
        uint64_t v12 = BLSTimelineEntryIterator::nextPresentationTime(*((BLSTimelineEntryIterator **)this + 6));

        id v7 = (id)v12;
        break;
      }
      uint64_t v8 = (BLSTimelineEntryIterator *)*((void *)this + 1);
    }
    if (*((BLSTimelineEntryIterator **)this + 6) == v8)
    {
      long long v15 = v7;
      id v7 = v4;
LABEL_27:

      id v4 = v7;
      goto LABEL_28;
    }
LABEL_17:
    if ([*((id *)this + 3) compare:v7] != -1)
    {
LABEL_18:
      id v7 = v7;

      uint64_t v5 = v7;
      goto LABEL_20;
    }
    [v7 timeIntervalSinceDate:v5];
    if (v13 >= *((double *)this + 5))
    {
      long long v15 = v4;
      goto LABEL_27;
    }
LABEL_20:
    if (!BLSTimelineEntryIterator::advance(*((id ***)this + 6))) {
      __assert_rtn("nextSpecifier", "BLSTimelineEntriesCombiner_Project.hpp", 271, "success == true");
    }
  }
  if (v7 && *((void *)this + 6) != *((void *)this + 1))
  {
    if (!v5) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }

  if (!v5)
  {
    long long v14 = 0;
    goto LABEL_30;
  }
LABEL_28:
  id v16 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v17 = [v4 laterDate:v5];
  uint64_t v18 = (void *)[v16 initWithStartDate:v5 endDate:v17];

  uint64_t v19 = BLSTimelineEntriesCombiner::entrySpecifiers(this);
  if (![v19 count]) {
    __assert_rtn("nextSpecifier", "BLSTimelineEntriesCombiner_Project.hpp", 285, "[specifiers count] > 0");
  }
  long long v14 = [[BLSAlwaysOnFrameSpecifier alloc] initWithTimelineEntrySpecifiers:v19 presentationInterval:v18];

LABEL_30:
LABEL_31:

  return v14;
}

void sub_1B55F2364(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL BLSTimelineEntryIterator::advance(id **this)
{
  if (BLSTimelineEntryBookkeeper::advance(this[4]))
  {
    BOOL v2 = 1;
    *(unsigned char *)this = 1;
  }
  else
  {
    id v3 = *this[4];
    id v4 = v3;
    uint64_t v5 = this[4] + 9;
    this[4] = v5;
    uint64_t v6 = this[2];
    BOOL v2 = v5 != v6;
    if (v5 != v6) {
      *(unsigned char *)this = [v3 isEqual:*v5] ^ 1;
    }
  }
  return v2;
}

void sub_1B55F2438(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BLSTimelineEntriesCombiner::entrySpecifiers(BLSTimelineEntriesCombiner *this)
{
  BOOL v2 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((void *)this + 1) - *(void *)this) >> 3)];
  for (uint64_t i = *(BLSTimelineEntryIterator **)this;
        i != *((BLSTimelineEntryIterator **)this + 1);
        uint64_t i = (BLSTimelineEntryIterator *)((char *)i + 40))
  {
    id v4 = BLSTimelineEntryIterator::entrySpecifier(i);
    if (v4)
    {
      uint64_t v5 = BLSTimelineEntryIterator::entrySpecifier(i);
      [v2 addObject:v5];
    }
  }

  return v2;
}

void sub_1B55F2508(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL BLSTimelineEntryBookkeeper::advance(id *location)
{
  id v1 = location[1];
  if (v1)
  {
    id v3 = (char *)location[6];
    id v4 = (char *)location[7] + 1;
    location[7] = v4;
    if (v4 >= v3) {
      *((unsigned char *)location + 64) = 0;
    }
    objc_storeStrong(location, v1);
    uint64_t v5 = BLSTimelineEntryBookkeeper::presentationTimeForIndex(location, (unint64_t)location[7] + 1);
    id v6 = location[1];
    location[1] = v5;
  }
  return v1 != 0;
}

BLSAlwaysOnTimelineEntrySpecifier *BLSTimelineEntryIterator::entrySpecifier(BLSTimelineEntryIterator *this)
{
  uint64_t v1 = *((void *)this + 4);
  if (v1 == *((void *)this + 2))
  {
    id v3 = 0;
  }
  else
  {
    id v3 = (BLSAlwaysOnTimelineEntrySpecifier *)*(id *)(v1 + 32);
    if (!v3)
    {
      id v4 = *(id *)(*((void *)this + 4) + 16);
      if (v4)
      {
        uint64_t v5 = [BLSAlwaysOnTimelineEntrySpecifier alloc];
        uint64_t v6 = *((void *)this + 4);
        if (*(unsigned char *)(v6 + 64)) {
          double v7 = (double)*(unint64_t *)(v6 + 56) / (double)*(unint64_t *)(v6 + 48);
        }
        else {
          double v7 = 1.0;
        }
        id v3 = [(BLSAlwaysOnTimelineEntrySpecifier *)v5 initWithTimelineEntry:v4 percentComplete:*(void *)(v6 + 24) previousTimelineEntry:*(unsigned __int8 *)this didChange:v7];
      }
      else
      {
        id v3 = 0;
      }
    }
  }

  return v3;
}

void sub_1B55F266C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *NSStringFromBLSAssertionAcquisitionState(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_1E6107670[a1];
  }
}

id NSStringFromBLSAssertingObject(void *a1)
{
  id v1 = a1;
  BOOL v2 = objc_opt_new();
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __NSStringFromBLSAssertingObject_block_invoke;
  long long v10 = &unk_1E6106FA8;
  id v11 = v1;
  id v12 = v2;
  id v3 = v2;
  id v4 = v1;
  [v3 appendProem:v4 block:&v7];
  uint64_t v5 = objc_msgSend(v3, "description", v7, v8, v9, v10);

  return v5;
}

void __NSStringFromBLSAssertingObject_block_invoke(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) descriptor];
  BOOL v2 = *(void **)(a1 + 40);
  id v3 = [v9 explanation];
  id v4 = (id)[v2 appendObject:v3 withName:@"explanation"];

  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v6 = [v9 attributes];
  id v7 = (id)objc_msgSend(v5, "appendInteger:withName:", objc_msgSend(v6, "count"), @"attributes");

  id v8 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 32), "isAcquired"), @"isAcquired");
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

__CFString *NSStringFromBLSBacklightActivityState(uint64_t a1)
{
  id v1 = @"Off/Inactive";
  if (a1 == 1) {
    id v1 = @"On/Active";
  }
  if (a1 == 2) {
    return @"Dimmed";
  }
  else {
    return v1;
  }
}

__CFString *NSStringFromBLSBacklightChangeSourceEvent(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xF) {
    return @"Unknown";
  }
  else {
    return off_1E61076D0[a1 - 1];
  }
}

__CFString *NSStringFromBLSDirection(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"Unknown";
  }
  else {
    return off_1E6107750[a1 - 1];
  }
}

__CFString *NSStringFromBLSAlwaysOnSuppressionType(uint64_t a1)
{
  if (a1 == 1) {
    return @"Suppress";
  }
  else {
    return @"Unsuppress";
  }
}

__CFString *NSStringFromBLSAlwaysOnSuppressionReason(uint64_t a1)
{
  if (!a1)
  {
    uint64_t v5 = @"Unknown";
    goto LABEL_12;
  }
  BOOL v2 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  id v3 = v2;
  if (a1)
  {
    [v2 addObject:@"ViewObstructed"];
    if ((a1 & 2) == 0)
    {
LABEL_4:
      if ((a1 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_17;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_4;
  }
  [v3 addObject:@"SmartPowerNap"];
  if ((a1 & 4) == 0)
  {
LABEL_5:
    if ((a1 & 0x80000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_17:
  [v3 addObject:@"DevicePresence"];
  if ((a1 & 0x80000000) != 0) {
LABEL_6:
  }
    [v3 addObject:@"ServiceStopped"];
LABEL_7:
  if ((a1 & 0xFFFFFFFF7FFFFFF8) != 0)
  {
    id v4 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown(0x%lx)", a1 & 0xFFFFFFFF7FFFFFF8);
    [v3 addObject:v4];
  }
  if ([v3 count])
  {
    uint64_t v5 = [v3 componentsJoinedByString:@","];

LABEL_12:
    return v5;
  }
  id v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[reasons count] > 0"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    NSStringFromBLSAlwaysOnSuppressionReason_cold_1((uint64_t)v7);
  }
  [v7 UTF8String];
  uint64_t result = (__CFString *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

uint64_t BLSEncode4Chars(void *a1, int a2)
{
  if ((int)(strlen((const char *)[a1 UTF8String]) - a2) < 1) {
    return 0;
  }
  __memcpy_chk();
  return bswap32(0);
}

void sub_1B55F8F74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B55F909C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B55F9270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1B55F992C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

uint64_t BLSBacklightStateForBacklightActivityStateAlwaysOnAvailable(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = 2;
  if (!a1) {
    uint64_t v2 = a2;
  }
  if (a1 == 2) {
    return 3;
  }
  else {
    return v2;
  }
}

uint64_t BLSBacklightActivityStateForBLSBacklightState(uint64_t a1)
{
  if (a1 == 3) {
    return 2;
  }
  else {
    return a1 == 2;
  }
}

id bls_assertions_log()
{
  if (bls_assertions_log_onceToken != -1) {
    dispatch_once(&bls_assertions_log_onceToken, &__block_literal_global_13);
  }
  uint64_t v0 = (void *)bls_assertions_log___logger;

  return v0;
}

uint64_t __bls_assertions_log_block_invoke()
{
  bls_assertions_log___logger = (uint64_t)os_log_create("com.apple.BacklightServices", "assertions");

  return MEMORY[0x1F41817F8]();
}

id bls_backlight_log()
{
  if (bls_backlight_log_onceToken != -1) {
    dispatch_once(&bls_backlight_log_onceToken, &__block_literal_global_4);
  }
  uint64_t v0 = (void *)bls_backlight_log___logger;

  return v0;
}

uint64_t __bls_backlight_log_block_invoke()
{
  bls_backlight_log___logger = (uint64_t)os_log_create("com.apple.BacklightServices", "backlight");

  return MEMORY[0x1F41817F8]();
}

id bls_budget_log()
{
  if (bls_budget_log_onceToken != -1) {
    dispatch_once(&bls_budget_log_onceToken, &__block_literal_global_7);
  }
  uint64_t v0 = (void *)bls_budget_log___logger;

  return v0;
}

uint64_t __bls_budget_log_block_invoke()
{
  bls_budget_log___logger = (uint64_t)os_log_create("com.apple.BacklightServices", "budget");

  return MEMORY[0x1F41817F8]();
}

id bls_diagnostics_log()
{
  if (bls_diagnostics_log_onceToken != -1) {
    dispatch_once(&bls_diagnostics_log_onceToken, &__block_literal_global_10);
  }
  uint64_t v0 = (void *)bls_diagnostics_log___logger;

  return v0;
}

uint64_t __bls_diagnostics_log_block_invoke()
{
  bls_diagnostics_log___logger = (uint64_t)os_log_create("com.apple.BacklightServices", "diagnostics");

  return MEMORY[0x1F41817F8]();
}

id bls_environment_log()
{
  if (bls_environment_log_onceToken != -1) {
    dispatch_once(&bls_environment_log_onceToken, &__block_literal_global_13);
  }
  uint64_t v0 = (void *)bls_environment_log___logger;

  return v0;
}

uint64_t __bls_environment_log_block_invoke()
{
  bls_environment_log___logger = (uint64_t)os_log_create("com.apple.BacklightServices", "environment");

  return MEMORY[0x1F41817F8]();
}

id bls_flipbook_log()
{
  if (bls_flipbook_log_onceToken != -1) {
    dispatch_once(&bls_flipbook_log_onceToken, &__block_literal_global_16_0);
  }
  uint64_t v0 = (void *)bls_flipbook_log___logger;

  return v0;
}

uint64_t __bls_flipbook_log_block_invoke()
{
  bls_flipbook_log___logger = (uint64_t)os_log_create("com.apple.BacklightServices", "flipbook");

  return MEMORY[0x1F41817F8]();
}

id bls_timelines_log()
{
  if (bls_timelines_log_onceToken != -1) {
    dispatch_once(&bls_timelines_log_onceToken, &__block_literal_global_22_0);
  }
  uint64_t v0 = (void *)bls_timelines_log___logger;

  return v0;
}

uint64_t __bls_timelines_log_block_invoke()
{
  bls_timelines_log___logger = (uint64_t)os_log_create("com.apple.BacklightServices", "timelines");

  return MEMORY[0x1F41817F8]();
}

__CFString *NSStringFromBLSAdjustedLuminance(uint64_t a1)
{
  id v1 = @"Off";
  if (a1 == 1) {
    id v1 = @"Low";
  }
  if (a1 == 2) {
    return @"Full";
  }
  else {
    return v1;
  }
}

uint64_t BLSBacklightStateForVisuaState(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 adjustedLuminance];
  if (v2 == 2)
  {
    if ([v1 isDimmed]) {
      uint64_t v3 = 3;
    }
    else {
      uint64_t v3 = 2;
    }
  }
  else
  {
    uint64_t v3 = v2 == 1;
  }

  return v3;
}

void OUTLINED_FUNCTION_2_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1B5601C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose((const void *)(v40 - 216), 8);
  _Block_object_dispose((const void *)(v40 - 184), 8);
  _Block_object_dispose((const void *)(v40 - 152), 8);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromBLSUpdateFidelity(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unexpected fidelity value:%ld", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E6107B98[a1 + 1];
  }

  return v1;
}

__CFString *NSStringAbbreviatedFromBLSUpdateFidelity(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"??%ld??", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E6107BC0[a1 + 1];
  }

  return v1;
}

void OUTLINED_FUNCTION_0_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void NSStringFromBLSBacklightChangeEvents_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_1B55DE000, log, OS_LOG_TYPE_FAULT, "empty events array but abortedEventArray non-empty — events:%{public}@ abortedEvents:%{public}@", (uint8_t *)&v3, 0x16u);
}

void NSStringFromBLSAlwaysOnSuppressionReason_cold_1(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [NSString stringWithUTF8String:"NSString * _Nonnull NSStringFromBLSAlwaysOnSuppressionReason(BLSAlwaysOnSuppressionReason)"];
  int v3 = 138544130;
  uint64_t v4 = v2;
  __int16 v5 = 2114;
  uint64_t v6 = @"BLSBacklightChangeRequest.m";
  __int16 v7 = 1024;
  int v8 = 571;
  __int16 v9 = 2114;
  uint64_t v10 = a1;
  _os_log_error_impl(&dword_1B55DE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v3, 0x26u);
}

uint64_t BSContinuousMachTimeNow()
{
  return MEMORY[0x1F410C1B0]();
}

uint64_t BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionary()
{
  return MEMORY[0x1F410C1C0]();
}

uint64_t BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C1C8]();
}

uint64_t BSCreateSerializedBSXPCEncodableObject()
{
  return MEMORY[0x1F410C1E0]();
}

uint64_t BSDeserializeCGPointFromXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C220]();
}

uint64_t BSDeserializeCGRectFromXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C228]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x1F410C2A0]();
}

uint64_t BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C568]();
}

uint64_t BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C578]();
}

uint64_t BSSerializeCGPointToXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C590]();
}

uint64_t BSSerializeCGRectToXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C598]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x1F410C5E0]();
}

uint64_t BSTimeDifferenceFromMachTimeToMachTime()
{
  return MEMORY[0x1F410C698]();
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  return (IOSurfaceRef)MEMORY[0x1F40E9560](xobj);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSEndMapTableEnumeration(NSMapEnumerator *enumerator)
{
}

NSMapEnumerator *__cdecl NSEnumerateMapTable(NSMapEnumerator *__return_ptr retstr, NSMapTable *table)
{
  return (NSMapEnumerator *)MEMORY[0x1F40E70B0](retstr, table);
}

BOOL NSNextMapEnumeratorPair(NSMapEnumerator *enumerator, void **key, void **value)
{
  return MEMORY[0x1F40E71B0](enumerator, key, value);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _NSIsNSSet()
{
  return MEMORY[0x1F40D94D8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x1F410C6F0]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1F40CBD50](label);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x1F40CC948]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1F40CD570]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1F40CD578]();
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
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

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1F40CEA18](xarray, applier);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1F40CEA38]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1F40CEAA8](xarray, index);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEE68](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEEA8](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  MEMORY[0x1F40CEEB8](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEF8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

xpc_object_t xpc_uuid_create(const unsigned __int8 *uuid)
{
  return (xpc_object_t)MEMORY[0x1F40CF360](uuid);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1F40CF368](xuuid);
}