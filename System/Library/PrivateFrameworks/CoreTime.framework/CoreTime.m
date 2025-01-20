void TMSetSourceTimeZone(void *a1, void *a2)
{
  double v4;
  id v5;
  NSObject *v6;
  xpc_object_t v7;
  _xpc_connection_s *v8;
  void *v9;
  os_activity_scope_state_s v10;

  v4 = _TMGetKernelMonotonicClock();
  v5 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  v6 = _os_activity_create(&dword_1B87DB000, "TMSetSourceTimeZone", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v6, &v10);
  v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v7, "TMCommand", "TMSetSourceTimeZone");
  xpc_dictionary_set_string(v7, "TMSource", (const char *)[a1 UTF8String]);
  xpc_dictionary_set_string(v7, "TMTimeZone", (const char *)[a2 UTF8String]);
  xpc_dictionary_set_double(v7, "TMRtcTime", v4);
  if (xpc_dictionary_get_value(v7, "TMRtcTime") && xpc_dictionary_get_double(v7, "TMRtcTime") <= 0.5)
  {
    v9 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void TMSetSourceTimeZone(CFStringRef, CFStringRef)"), @"TMClient.m", 268, @"Invalid RTC bear trap.");
  }
  v8 = (_xpc_connection_s *)_TMCopyConnection(0);
  xpc_connection_send_message(v8, v7);
  xpc_release(v7);
  _TMReleaseConnection(v8);
  os_activity_scope_leave(&v10);
}

double _TMGetKernelMonotonicClock()
{
  if (TMDeviceHasPMU_token != -1) {
    dispatch_once(&TMDeviceHasPMU_token, &__block_literal_global_264);
  }
  if (TMDeviceHasPMU_hasPMU)
  {
    unint64_t v12 = 0;
    if ((_TMGetKernelMonotonicClock_init & 1) == 0)
    {
      if (sysctlnametomib("kern.monotonicclock_usecs", _TMGetKernelMonotonicClock_mib, (size_t *)&_TMGetKernelMonotonicClock_miblen))
      {
        BOOL v0 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        double v8 = -1.0;
        if (v0) {
          _TMGetKernelMonotonicClock_cold_2(v0, v1, v2, v3, v4, v5, v6, v7);
        }
        return v8;
      }
      if (TMGetKernelMonotonicClockResolution_onceToken != -1) {
        dispatch_once(&TMGetKernelMonotonicClockResolution_onceToken, &__block_literal_global_267);
      }
      *(double *)&_TMGetKernelMonotonicClock_halfResolution = *(double *)&TMGetKernelMonotonicClockResolution_sInterval
                                                            * 0.5;
      _TMGetKernelMonotonicClock_readScale = 0x412E848000000000;
      _TMGetKernelMonotonicClock_init = 1;
    }
    size_t v11 = 8;
    if (!sysctl(_TMGetKernelMonotonicClock_mib, _TMGetKernelMonotonicClock_miblen, &v12, &v11, 0, 0)) {
      return (double)v12 / *(double *)&_TMGetKernelMonotonicClock_readScale
    }
           + *(double *)&_TMGetKernelMonotonicClock_halfResolution;
    double v8 = -1.0;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      _TMGetKernelMonotonicClock_cold_1();
    }
    return v8;
  }
  uint64_t v9 = mach_continuous_time();

  return TMConvertTicksToSeconds(v9);
}

BOOL TMGetReferenceTime(double *a1, double *a2, _DWORD *a3)
{
  if (a1) {
    *a1 = NAN;
  }
  if (a2) {
    *a2 = NAN;
  }
  if (a3) {
    *a3 = -1;
  }
  uint64_t v6 = _os_activity_create(&dword_1B87DB000, "TMGetReferenceTime", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v6, &v12);
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v7, "TMCommand", "TMGetReferenceTime");
  double v8 = (_xpc_connection_s *)_TMCopyConnection(0);
  xpc_object_t v9 = xpc_connection_send_message_with_reply_sync(v8, v7);
  xpc_release(v7);
  _TMReleaseConnection(v8);
  os_activity_scope_leave(&v12);

  if (!v9) {
    return 0;
  }
  if (MEMORY[0x1BA9C2250](v9) != MEMORY[0x1E4F14590]) {
    goto LABEL_9;
  }
  if (a1) {
    *a1 = xpc_dictionary_get_double(v9, "TMCurrentTime");
  }
  if (a2) {
    *a2 = xpc_dictionary_get_double(v9, "TMTimeError");
  }
  if (a3) {
    *a3 = xpc_dictionary_get_BOOL(v9, "TMReliability");
  }
  if (xpc_dictionary_get_value(v9, "TMCurrentTime") && xpc_dictionary_get_value(v9, "TMTimeError")) {
    BOOL v10 = xpc_dictionary_get_value(v9, "TMReliability") != 0;
  }
  else {
LABEL_9:
  }
    BOOL v10 = 0;
  xpc_release(v9);
  return v10;
}

BOOL TMGetTrustedInterval(double *a1, double *a2)
{
  uint64_t v4 = _os_activity_create(&dword_1B87DB000, "TMGetTrustedInterval", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v4, &v12);
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "TMCommand", "TMGetTrustedInterval");
  uint64_t v6 = (_xpc_connection_s *)_TMCopyConnection(0);
  xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(v6, v5);
  xpc_release(v5);
  _TMReleaseConnection(v6);
  os_activity_scope_leave(&v12);

  if (v7)
  {
    if (MEMORY[0x1BA9C2250](v7) == MEMORY[0x1E4F14590])
    {
      double v10 = xpc_dictionary_get_double(v7, "TMCurrentTime");
      double v9 = xpc_dictionary_get_double(v7, "TMTimeError");
      if (xpc_dictionary_get_value(v7, "TMCurrentTime")) {
        BOOL v8 = xpc_dictionary_get_value(v7, "TMTimeError") != 0;
      }
      else {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
      double v9 = NAN;
      double v10 = NAN;
    }
    xpc_release(v7);
    if (!a1) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  BOOL v8 = 0;
  double v9 = NAN;
  double v10 = NAN;
  if (a1) {
LABEL_10:
  }
    *a1 = v10;
LABEL_11:
  if (a2) {
    *a2 = v9;
  }
  return v8;
}

uint64_t _TMCopyConnection(uint64_t a1)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  BOOL v8 = __Block_byref_object_copy_;
  double v9 = __Block_byref_object_dispose_;
  uint64_t v10 = 0;
  if (_TMConnectionQueue_sPred != -1) {
    dispatch_once(&_TMConnectionQueue_sPred, &__block_literal_global_1);
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = ___TMCopyConnection_block_invoke;
  v4[3] = &unk_1E617BAE0;
  v4[4] = a1;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)_TMConnectionQueue_sConnectionQueue, v4);
  uint64_t v2 = v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

double TMConvertTicksToSeconds(unint64_t a1)
{
  double v2 = *(double *)&TMConvertTicksToSeconds_ticksPerSecond;
  if (*(double *)&TMConvertTicksToSeconds_ticksPerSecond == 0.0)
  {
    uint64_t v7 = 0;
    TMGetMachTimebase((uint32_t *)&v7 + 1, (uint32_t *)&v7);
    unsigned int v3 = 1000000000;
    unsigned int v4 = HIDWORD(v7);
    do
    {
      unsigned int v5 = v4;
      unsigned int v4 = v3;
      unsigned int v3 = v5 % v3;
    }
    while (v3);
    double v2 = (double)(HIDWORD(v7) / v4) / (double)(v7 * (unint64_t)(0x3B9ACA00 / v4));
    *(double *)&TMConvertTicksToSeconds_ticksPerSecond = v2;
  }
  return v2 * (double)a1;
}

uint64_t __TMDeviceHasPMU_block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  size_t v1 = 8;
  uint64_t result = sysctlnametomib("kern.monotonicclock_usecs", v2, &v1);
  TMDeviceHasPMU_hasPMU = result == 0;
  return result;
}

double __TMGetKernelMonotonicClockResolution_block_invoke()
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  size_t v10 = 8;
  unint64_t v11 = 0;
  *(void *)double v9 = 8;
  if (sysctlnametomib("kern.monotonicclock_rate_usecs", v12, (size_t *)v9))
  {
    BOOL v0 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v0) {
      __TMGetKernelMonotonicClockResolution_block_invoke_cold_2(v0, v1, v2, v3, v4, v5, v6, v7);
    }
  }
  else if (sysctl(v12, v9[0], &v11, &v10, 0, 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __TMGetKernelMonotonicClockResolution_block_invoke_cold_1();
    }
  }
  else
  {
    double result = (double)v11 / 1000000.0;
    *(double *)&TMGetKernelMonotonicClockResolution_sInterval = result;
  }
  return result;
}

void TMSetSourceTime(void *a1, double a2, double a3)
{
  uint64_t v6 = mach_absolute_time();
  double v7 = _TMGetKernelMonotonicClock();
  if ((v6 & 0x8000000000000000) != 0)
  {
    v17 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "void TMSetSourceTime(CFStringRef, CFAbsoluteTime, CFTimeInterval)"), @"TMClient.m", 147, @"Invalid parameter not satisfying: %@", @"machTimestamp <= INT64_MAX" file lineNumber description];
  }
  if (a3 <= 0.0)
  {
    v18 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "void TMSetSourceTime(CFStringRef, CFAbsoluteTime, CFTimeInterval)"), @"TMClient.m", 148, @"Invalid parameter not satisfying: %@", @"uncertainty > 0.0" file lineNumber description];
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  if (a1)
  {
    uint64_t v9 = 0x40D5180000000000;
    if (([a1 isEqualToString:@"LocationServer"] & 1) != 0
      || ([a1 isEqualToString:@"HarvestServer"] & 1) != 0
      || ([a1 isEqualToString:@"iTunesStoreServer"] & 1) != 0
      || ([a1 isEqualToString:@"GPS"] & 1) != 0
      || (uint64_t v9 = 0x40AC200000000000, ([a1 isEqualToString:@"NITZ"] & 1) != 0)
      || ([a1 isEqualToString:@"CDMA"] & 1) != 0)
    {
      double __y = 0.0;
      p_y = &__y;
      uint64_t v35 = 0x2020000000;
      char v36 = 0;
      size_t v10 = _TMConnectionQueue();
      block.opaque[0] = MEMORY[0x1E4F143A8];
      block.opaque[1] = 3221225472;
      v25 = ___shouldThrottle_block_invoke;
      v26 = &unk_1E617B6F8;
      double v29 = v7;
      double v30 = a2;
      double v31 = a3;
      uint64_t v32 = v9;
      v27 = a1;
      v28 = &__y;
      dispatch_sync(v10, &block);
      int v11 = *((unsigned __int8 *)p_y + 24);
      _Block_object_dispose(&__y, 8);
      if (v11) {
        goto LABEL_25;
      }
    }
    else
    {
      double __y = 0.0;
      p_y = &__y;
      uint64_t v35 = 0x2020000000;
      char v36 = 0;
      _Block_object_dispose(&__y, 8);
    }
    os_activity_scope_state_s v12 = _os_activity_create(&dword_1B87DB000, "TMSetSourceTime", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    block.opaque[0] = 0;
    block.opaque[1] = 0;
    os_activity_scope_enter(v12, &block);
    xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v13, "TMCommand", "TMSetSourceTime");
    xpc_dictionary_set_string(v13, "TMSource", (const char *)[a1 UTF8String]);
    xpc_dictionary_set_double(v13, "TMCurrentTime", a2);
    xpc_dictionary_set_double(v13, "TMTimeError", a3);
    xpc_dictionary_set_int64(v13, "TMMachTime", v6);
    if (a2 >= 9223372040.0)
    {
      v19 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), @"TMUtilities_Private.h", 56, @"CFTimeInterval too large for TMNanoTimeInterval: %lf", *(void *)&a2);
    }
    if (a2 <= -9223372040.0)
    {
      v20 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), @"TMUtilities_Private.h", 57, @"CFTimeInterval too small for TMNanoTimeInterval: %lf", *(void *)&a2);
    }
    double __y = 0.0;
    long double v14 = modf(a2, &__y);
    xpc_dictionary_set_int64(v13, "TMAbsoluteNanoTime", llround(v14 * 1000000000.0) + 1000000000 * (uint64_t)__y);
    if (a3 >= 9223372040.0)
    {
      v21 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), @"TMUtilities_Private.h", 56, @"CFTimeInterval too large for TMNanoTimeInterval: %lf", *(void *)&a3);
    }
    if (a3 <= -9223372040.0)
    {
      v22 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), @"TMUtilities_Private.h", 57, @"CFTimeInterval too small for TMNanoTimeInterval: %lf", *(void *)&a3);
    }
    double __y = 0.0;
    long double v15 = modf(a3, &__y);
    xpc_dictionary_set_int64(v13, "TMNanoTimeError", llround(v15 * 1000000000.0) + 1000000000 * (uint64_t)__y);
    if (xpc_dictionary_get_value(v13, "TMRtcTime") && xpc_dictionary_get_double(v13, "TMRtcTime") <= 0.5)
    {
      v23 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void TMSetSourceTime(CFStringRef, CFAbsoluteTime, CFTimeInterval)"), @"TMClient.m", 169, @"Invalid RTC bear trap.");
    }
    v16 = (_xpc_connection_s *)_TMCopyConnection(0);
    xpc_connection_send_message(v16, v13);
    xpc_release(v13);
    _TMReleaseConnection(v16);
    os_activity_scope_leave(&block);
  }
LABEL_25:
}

void sub_1B87DCFC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void TMSetAuthenticatedSourceTime(__CFString *a1, double a2, double a3)
{
  if (CFEqual(a1, @"APNS")) {
    a3 = a3 + 5.0;
  }
  uint64_t v6 = _os_activity_create(&dword_1B87DB000, "TMSetAuthenticatedSourceTime", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v7, "TMCommand", "TMSetAuthenticatedSourceTime");
  xpc_dictionary_set_string(v7, "TMSource", (const char *)[(__CFString *)a1 UTF8String]);
  xpc_dictionary_set_double(v7, "TMCurrentTime", a2);
  xpc_dictionary_set_double(v7, "TMTimeError", a3);
  uint64_t v8 = mach_absolute_time();
  xpc_dictionary_set_int64(v7, "TMMachTime", v8);
  if (a2 >= 9223372040.0)
  {
    os_activity_scope_state_s v12 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), @"TMUtilities_Private.h", 56, @"CFTimeInterval too large for TMNanoTimeInterval: %lf", *(void *)&a2);
  }
  if (a2 <= -9223372040.0)
  {
    xpc_object_t v13 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), @"TMUtilities_Private.h", 57, @"CFTimeInterval too small for TMNanoTimeInterval: %lf", *(void *)&a2);
  }
  double __y = 0.0;
  long double v9 = modf(a2, &__y);
  xpc_dictionary_set_int64(v7, "TMAbsoluteNanoTime", llround(v9 * 1000000000.0) + 1000000000 * (uint64_t)__y);
  if (a3 >= 9223372040.0)
  {
    long double v14 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), @"TMUtilities_Private.h", 56, @"CFTimeInterval too large for TMNanoTimeInterval: %lf", *(void *)&a3);
  }
  if (a3 <= -9223372040.0)
  {
    long double v15 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), @"TMUtilities_Private.h", 57, @"CFTimeInterval too small for TMNanoTimeInterval: %lf", *(void *)&a3);
  }
  double __y = 0.0;
  long double v10 = modf(a3, &__y);
  xpc_dictionary_set_int64(v7, "TMNanoTimeError", llround(v10 * 1000000000.0) + 1000000000 * (uint64_t)__y);
  if (xpc_dictionary_get_value(v7, "TMRtcTime") && xpc_dictionary_get_double(v7, "TMRtcTime") <= 0.5)
  {
    v16 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void TMSetAuthenticatedSourceTime(CFStringRef, CFAbsoluteTime, CFTimeInterval)"), @"TMClient.m", 188, @"Invalid RTC bear trap.");
  }
  int v11 = (_xpc_connection_s *)_TMCopyConnection(0);
  xpc_connection_send_message(v11, v7);
  xpc_release(v7);
  _TMReleaseConnection(v11);
  os_activity_scope_leave(&state);
}

void TMSetTestSourceTime(void *a1, double a2, double a3, double a4)
{
  uint64_t v8 = mach_absolute_time();
  double v9 = _TMGetKernelMonotonicClock();
  if ((v8 & 0x8000000000000000) != 0)
  {
    v16 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "void TMSetTestSourceTime(CFStringRef, CFAbsoluteTime, CFTimeInterval, CFTimeInterval)"), @"TMClient.m", 196, @"Invalid parameter not satisfying: %@", @"machTimestamp <= INT64_MAX" file lineNumber description];
  }
  if (a3 <= 0.0)
  {
    v17 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "void TMSetTestSourceTime(CFStringRef, CFAbsoluteTime, CFTimeInterval, CFTimeInterval)"), @"TMClient.m", 197, @"Invalid parameter not satisfying: %@", @"uncertainty > 0.0" file lineNumber description];
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  int v11 = _os_activity_create(&dword_1B87DB000, "TMSetSourceTime", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v12, "TMCommand", "TMSetSourceTime");
  xpc_dictionary_set_string(v12, "TMSource", (const char *)[a1 UTF8String]);
  xpc_dictionary_set_double(v12, "TMCurrentTime", a2);
  xpc_dictionary_set_double(v12, "TMTimeError", a3);
  xpc_dictionary_set_double(v12, "TMRtcTime", v9 + a4);
  if (a2 >= 9223372040.0)
  {
    v18 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), @"TMUtilities_Private.h", 56, @"CFTimeInterval too large for TMNanoTimeInterval: %lf", *(void *)&a2);
  }
  if (a2 <= -9223372040.0)
  {
    v19 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), @"TMUtilities_Private.h", 57, @"CFTimeInterval too small for TMNanoTimeInterval: %lf", *(void *)&a2);
  }
  double __y = 0.0;
  long double v13 = modf(a2, &__y);
  xpc_dictionary_set_int64(v12, "TMAbsoluteNanoTime", llround(v13 * 1000000000.0) + 1000000000 * (uint64_t)__y);
  if (a3 >= 9223372040.0)
  {
    v20 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), @"TMUtilities_Private.h", 56, @"CFTimeInterval too large for TMNanoTimeInterval: %lf", *(void *)&a3);
  }
  if (a3 <= -9223372040.0)
  {
    v21 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), @"TMUtilities_Private.h", 57, @"CFTimeInterval too small for TMNanoTimeInterval: %lf", *(void *)&a3);
  }
  double __y = 0.0;
  long double v14 = modf(a3, &__y);
  xpc_dictionary_set_int64(v12, "TMNanoTimeError", llround(v14 * 1000000000.0) + 1000000000 * (uint64_t)__y);
  if (xpc_dictionary_get_value(v12, "TMRtcTime") && xpc_dictionary_get_double(v12, "TMRtcTime") <= 0.5)
  {
    v22 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void TMSetTestSourceTime(CFStringRef, CFAbsoluteTime, CFTimeInterval, CFTimeInterval)"), @"TMClient.m", 212, @"Invalid RTC bear trap.");
  }
  long double v15 = (_xpc_connection_s *)_TMCopyConnection(0);
  xpc_connection_send_message(v15, v12);
  xpc_release(v12);
  _TMReleaseConnection(v15);
  os_activity_scope_leave(&state);
}

void TMSetSourceAvailable(void *a1)
{
  double v2 = _TMGetKernelMonotonicClock();
  id v3 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v4 = _TMConnectionQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __TMSetSourceAvailable_block_invoke;
  block[3] = &unk_1E617B5A0;
  block[4] = a1;
  dispatch_sync(v4, block);
  uint64_t v5 = _os_activity_create(&dword_1B87DB000, "TMSetSourceAvailable", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "TMCommand", "TMSetSourceAvailable");
  xpc_dictionary_set_string(v6, "TMSource", (const char *)[a1 UTF8String]);
  xpc_dictionary_set_double(v6, "TMRtcTime", v2);
  if (xpc_dictionary_get_value(v6, "TMRtcTime") && xpc_dictionary_get_double(v6, "TMRtcTime") <= 0.5)
  {
    uint64_t v8 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void TMSetSourceAvailable(CFStringRef)"), @"TMClient.m", 232, @"Invalid RTC bear trap.");
  }
  xpc_object_t v7 = (_xpc_connection_s *)_TMCopyConnection(0);
  xpc_connection_send_message(v7, v6);
  xpc_release(v6);
  _TMReleaseConnection(v7);
  os_activity_scope_leave(&state);
}

uint64_t __TMSetSourceAvailable_block_invoke(uint64_t result)
{
  if (_lastMessages) {
    return [(id)_lastMessages removeObjectForKey:*(void *)(result + 32)];
  }
  return result;
}

void TMSetSourceUnavailable(void *a1)
{
  double v2 = _TMGetKernelMonotonicClock();
  id v3 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v4 = _TMConnectionQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __TMSetSourceUnavailable_block_invoke;
  block[3] = &unk_1E617B5A0;
  block[4] = a1;
  dispatch_sync(v4, block);
  uint64_t v5 = _os_activity_create(&dword_1B87DB000, "TMSetSourceUnavailable", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "TMCommand", "TMSetSourceUnavailable");
  xpc_dictionary_set_string(v6, "TMSource", (const char *)[a1 UTF8String]);
  xpc_dictionary_set_double(v6, "TMRtcTime", v2);
  if (xpc_dictionary_get_value(v6, "TMRtcTime") && xpc_dictionary_get_double(v6, "TMRtcTime") <= 0.5)
  {
    uint64_t v8 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void TMSetSourceUnavailable(CFStringRef)"), @"TMClient.m", 253, @"Invalid RTC bear trap.");
  }
  xpc_object_t v7 = (_xpc_connection_s *)_TMCopyConnection(0);
  xpc_connection_send_message(v7, v6);
  xpc_release(v6);
  _TMReleaseConnection(v7);
  os_activity_scope_leave(&state);
}

uint64_t __TMSetSourceUnavailable_block_invoke(uint64_t result)
{
  if (_lastMessages) {
    return [(id)_lastMessages removeObjectForKey:*(void *)(result + 32)];
  }
  return result;
}

void TMSetManualTime(double a1)
{
  uint64_t v2 = mach_absolute_time();
  id v3 = _os_activity_create(&dword_1B87DB000, "TMSetManualTime", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "TMCommand", "TMSetManualTime");
  xpc_dictionary_set_double(v4, "TMCurrentTime", a1);
  xpc_dictionary_set_int64(v4, "TMMachTime", v2);
  if (a1 >= 9223372040.0)
  {
    xpc_object_t v7 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), @"TMUtilities_Private.h", 56, @"CFTimeInterval too large for TMNanoTimeInterval: %lf", *(void *)&a1);
  }
  if (a1 <= -9223372040.0)
  {
    uint64_t v8 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), @"TMUtilities_Private.h", 57, @"CFTimeInterval too small for TMNanoTimeInterval: %lf", *(void *)&a1);
  }
  double __y = 0.0;
  long double v5 = modf(a1, &__y);
  xpc_dictionary_set_int64(v4, "TMAbsoluteNanoTime", llround(v5 * 1000000000.0) + 1000000000 * (uint64_t)__y);
  if (xpc_dictionary_get_value(v4, "TMRtcTime") && xpc_dictionary_get_double(v4, "TMRtcTime") <= 0.5)
  {
    double v9 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void TMSetManualTime(CFAbsoluteTime)"), @"TMClient.m", 279, @"Invalid RTC bear trap.");
  }
  xpc_object_t v6 = (_xpc_connection_s *)_TMCopyConnection(0);
  xpc_connection_send_message(v6, v4);
  xpc_release(v4);
  _TMReleaseConnection(v6);
  os_activity_scope_leave(&state);
}

void TMSetAutomaticTimeEnabled(int a1)
{
  double v2 = _TMGetKernelMonotonicClock();
  id v3 = _os_activity_create(&dword_1B87DB000, "TMSetAutomaticTimeEnabled", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v3, &v7);
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "TMCommand", "TMSetAutomaticTimeEnabled");
  xpc_dictionary_set_BOOL(v4, "TMAutomaticTimeEnabled", a1 != 0);
  xpc_dictionary_set_double(v4, "TMRtcTime", v2);
  if (xpc_dictionary_get_value(v4, "TMRtcTime") && xpc_dictionary_get_double(v4, "TMRtcTime") <= 0.5)
  {
    xpc_object_t v6 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void TMSetAutomaticTimeEnabled(Boolean)"), @"TMClient.m", 289, @"Invalid RTC bear trap.");
  }
  long double v5 = (_xpc_connection_s *)_TMCopyConnection(0);
  xpc_connection_send_message(v5, v4);
  xpc_release(v4);
  _TMReleaseConnection(v5);
  os_activity_scope_leave(&v7);
}

void TMFetchNTP()
{
  BOOL v0 = _os_activity_create(&dword_1B87DB000, "TMFetchNTP", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(v0, &v4);
  xpc_object_t v1 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v1, "TMCommand", "TMFetchNTP");
  if (xpc_dictionary_get_value(v1, "TMRtcTime") && xpc_dictionary_get_double(v1, "TMRtcTime") <= 0.5)
  {
    id v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void TMFetchNTP(void)"), @"TMClient.m", 293, @"Invalid RTC bear trap.");
  }
  double v2 = (_xpc_connection_s *)_TMCopyConnection(0);
  xpc_connection_send_message(v2, v1);
  xpc_release(v1);
  _TMReleaseConnection(v2);
  os_activity_scope_leave(&v4);
}

BOOL TMIsAutomaticTimeEnabled()
{
  BOOL v0 = _os_activity_create(&dword_1B87DB000, "TMIsAutomaticTimeEnabled", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v0, &v6);
  xpc_object_t v1 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v1, "TMCommand", "TMIsAutomaticTimeEnabled");
  double v2 = (_xpc_connection_s *)_TMCopyConnection(0);
  xpc_object_t v3 = xpc_connection_send_message_with_reply_sync(v2, v1);
  xpc_release(v1);
  _TMReleaseConnection(v2);
  os_activity_scope_leave(&v6);

  if (!v3) {
    return 0;
  }
  BOOL v4 = MEMORY[0x1BA9C2250](v3) == MEMORY[0x1E4F14590] && xpc_dictionary_get_BOOL(v3, "TMAutomaticTimeEnabled");
  xpc_release(v3);
  return v4;
}

void TMSetAutomaticTimeZoneEnabled(int a1)
{
  double v2 = _TMGetKernelMonotonicClock();
  xpc_object_t v3 = _os_activity_create(&dword_1B87DB000, "TMSetAutomaticTimeZoneEnabled", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v3, &v7);
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "TMCommand", "TMSetAutomaticTimeZoneEnabled");
  xpc_dictionary_set_BOOL(v4, "TMAutomaticTimeZoneEnabled", a1 != 0);
  xpc_dictionary_set_double(v4, "TMRtcTime", v2);
  if (xpc_dictionary_get_value(v4, "TMRtcTime") && xpc_dictionary_get_double(v4, "TMRtcTime") <= 0.5)
  {
    os_activity_scope_state_s v6 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void TMSetAutomaticTimeZoneEnabled(Boolean)"), @"TMClient.m", 317, @"Invalid RTC bear trap.");
  }
  long double v5 = (_xpc_connection_s *)_TMCopyConnection(0);
  xpc_connection_send_message(v5, v4);
  xpc_release(v4);
  _TMReleaseConnection(v5);
  os_activity_scope_leave(&v7);
}

BOOL TMIsAutomaticTimeZoneEnabled()
{
  BOOL v0 = _os_activity_create(&dword_1B87DB000, "TMIsAutomaticTimeZoneEnabled", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v0, &v6);
  xpc_object_t v1 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v1, "TMCommand", "TMIsAutomaticTimeZoneEnabled");
  double v2 = (_xpc_connection_s *)_TMCopyConnection(0);
  xpc_object_t v3 = xpc_connection_send_message_with_reply_sync(v2, v1);
  xpc_release(v1);
  _TMReleaseConnection(v2);
  os_activity_scope_leave(&v6);

  if (!v3) {
    return 0;
  }
  BOOL v4 = MEMORY[0x1BA9C2250](v3) == MEMORY[0x1E4F14590] && xpc_dictionary_get_BOOL(v3, "TMAutomaticTimeZoneEnabled");
  xpc_release(v3);
  return v4;
}

BOOL TMIsTimeZoneConfirmed()
{
  BOOL v0 = _os_activity_create(&dword_1B87DB000, "TMIsTimeZoneConfirmed", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v0, &v6);
  xpc_object_t v1 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v1, "TMCommand", "TMIsTimeZoneConfirmed");
  double v2 = (_xpc_connection_s *)_TMCopyConnection(0);
  xpc_object_t v3 = xpc_connection_send_message_with_reply_sync(v2, v1);
  xpc_release(v1);
  _TMReleaseConnection(v2);
  os_activity_scope_leave(&v6);

  if (!v3) {
    return 0;
  }
  BOOL v4 = MEMORY[0x1BA9C2250](v3) == MEMORY[0x1E4F14590] && xpc_dictionary_get_BOOL(v3, "TMTimeZoneConfirmed");
  xpc_release(v3);
  return v4;
}

void TMConfirmTimeZone()
{
  double v0 = _TMGetKernelMonotonicClock();
  xpc_object_t v1 = _os_activity_create(&dword_1B87DB000, "TMConfirmTimeZone", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v1, &v5);
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "TMCommand", "TMConfirmTimeZone");
  xpc_dictionary_set_double(v2, "TMRtcTime", v0);
  if (xpc_dictionary_get_value(v2, "TMRtcTime") && xpc_dictionary_get_double(v2, "TMRtcTime") <= 0.5)
  {
    BOOL v4 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void TMConfirmTimeZone(void)"), @"TMClient.m", 357, @"Invalid RTC bear trap.");
  }
  xpc_object_t v3 = (_xpc_connection_s *)_TMCopyConnection(0);
  xpc_connection_send_message(v3, v2);
  xpc_release(v2);
  _TMReleaseConnection(v3);
  os_activity_scope_leave(&v5);
}

double TMGetBAFinderTime()
{
  double v0 = 0.0;
  if (!TMIsAutomaticTimeEnabled())
  {
    xpc_object_t v1 = _os_activity_create(&dword_1B87DB000, "TMGetBAFinderTime", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v6.opaque[0] = 0;
    v6.opaque[1] = 0;
    os_activity_scope_enter(v1, &v6);
    xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v2, "TMCommand", "TMGetBAFinderTime");
    xpc_object_t v3 = (_xpc_connection_s *)_TMCopyConnection(0);
    xpc_object_t v4 = xpc_connection_send_message_with_reply_sync(v3, v2);
    xpc_release(v2);
    _TMReleaseConnection(v3);
    os_activity_scope_leave(&v6);

    if (v4)
    {
      if (MEMORY[0x1BA9C2250](v4) == MEMORY[0x1E4F14590]) {
        double v0 = xpc_dictionary_get_double(v4, "TMCurrentTime");
      }
      xpc_release(v4);
    }
  }
  return v0;
}

uint64_t TMGetRTCResetCount()
{
  double v0 = _os_activity_create(&dword_1B87DB000, "TMGetRTCResetCount", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v0, &v6);
  xpc_object_t v1 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v1, "TMCommand", "TMGetRTCResetCount");
  xpc_object_t v2 = (_xpc_connection_s *)_TMCopyConnection(0);
  xpc_object_t v3 = xpc_connection_send_message_with_reply_sync(v2, v1);
  xpc_release(v1);
  _TMReleaseConnection(v2);
  os_activity_scope_leave(&v6);

  if (!v3) {
    return 0;
  }
  if (MEMORY[0x1BA9C2250](v3) == MEMORY[0x1E4F14590]) {
    uint64_t uint64 = xpc_dictionary_get_uint64(v3, "TMRTCResetCount");
  }
  else {
    uint64_t uint64 = 0;
  }
  xpc_release(v3);
  return uint64;
}

BOOL TMIsBBTimeActive()
{
  double v0 = _os_activity_create(&dword_1B87DB000, "TMIsBBTimeActive", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v0, &v6);
  xpc_object_t v1 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v1, "TMCommand", "TMIsBBTimeActive");
  xpc_object_t v2 = (_xpc_connection_s *)_TMCopyConnection(0);
  xpc_object_t v3 = xpc_connection_send_message_with_reply_sync(v2, v1);
  xpc_release(v1);
  _TMReleaseConnection(v2);
  os_activity_scope_leave(&v6);

  if (!v3) {
    return 0;
  }
  BOOL v4 = MEMORY[0x1BA9C2250](v3) == MEMORY[0x1E4F14590] && xpc_dictionary_get_BOOL(v3, "TMBBTimeActive");
  xpc_release(v3);
  return v4;
}

void TMProvideBBTime(unint64_t a1, uint64_t a2, int64_t a3, int64_t a4, void *a5)
{
  id v10 = (void *)MEMORY[0x1BA9C2000]();
  if (a1 > a2)
  {
    long double v14 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "void TMProvideBBTime(TMMachTime, TMMachTime, TMAbsoluteNanoTime, TMNanoTimeInterval, CFStringRef)"), @"TMClient.m", 481, @"Invalid parameter not satisfying: %@", @"apMachTimeBefore <= apMachTimeAfter" file lineNumber description];
  }
  if (mach_absolute_time() < a2)
  {
    long double v15 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "void TMProvideBBTime(TMMachTime, TMMachTime, TMAbsoluteNanoTime, TMNanoTimeInterval, CFStringRef)"), @"TMClient.m", 482, @"Invalid parameter not satisfying: %@", @"apMachTimeAfter <= mach_absolute_time()" file lineNumber description];
    if ((a2 & 0x8000000000000000) == 0) {
      goto LABEL_5;
    }
LABEL_10:
    v16 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "void TMProvideBBTime(TMMachTime, TMMachTime, TMAbsoluteNanoTime, TMNanoTimeInterval, CFStringRef)"), @"TMClient.m", 483, @"Invalid parameter not satisfying: %@", @"apMachTimeAfter <= INT64_MAX" file lineNumber description];
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0) {
    goto LABEL_10;
  }
LABEL_5:
  int v11 = _os_activity_create(&dword_1B87DB000, "TMProvideBBTime", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v12, "TMCommand", "TMProvideBBTime");
  xpc_dictionary_set_string(v12, "TMSource", (const char *)[a5 UTF8String]);
  xpc_dictionary_set_int64(v12, "TMAbsoluteNanoTime", a3);
  xpc_dictionary_set_int64(v12, "TMNanoTimeError", a4);
  xpc_dictionary_set_int64(v12, "TMMachTime", a1);
  xpc_dictionary_set_int64(v12, "TMMachTimeAfter", a2);
  xpc_dictionary_set_double(v12, "TMCurrentTime", (double)(a3 % 1000000000) / 1000000000.0 + (double)(a3 / 1000000000));
  xpc_dictionary_set_double(v12, "TMTimeError", (double)(a4 % 1000000000) / 1000000000.0 + (double)(a4 / 1000000000));
  if (xpc_dictionary_get_value(v12, "TMRtcTime") && xpc_dictionary_get_double(v12, "TMRtcTime") <= 0.5)
  {
    v17 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void TMProvideBBTime(TMMachTime, TMMachTime, TMAbsoluteNanoTime, TMNanoTimeInterval, CFStringRef)"), @"TMClient.m", 498, @"Invalid RTC bear trap.");
  }
  long double v13 = (_xpc_connection_s *)_TMCopyConnection(0);
  xpc_connection_send_message(v13, v12);
  xpc_release(v12);
  _TMReleaseConnection(v13);
  os_activity_scope_leave(&state);
}

void TMSetupTime(NSObject *a1, uint64_t a2, double a3)
{
  os_activity_scope_state_s v6 = (_xpc_connection_s *)_TMCopyConnection(0);
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v7, "TMCommand", "TMSetupTime");
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  char v14 = 0;
  dispatch_retain(a1);
  uint64_t v8 = _TMConnectionQueue();
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __TMSetupTime_block_invoke;
  handler[3] = &unk_1E617B5F0;
  handler[6] = a2;
  handler[7] = v13;
  handler[4] = a1;
  handler[5] = v6;
  xpc_connection_send_message_with_reply(v6, v7, v8, handler);
  xpc_release(v7);
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  id v10 = _TMConnectionQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __TMSetupTime_block_invoke_3;
  block[3] = &unk_1E617B640;
  void block[5] = a2;
  block[6] = v13;
  block[4] = a1;
  dispatch_after(v9, v10, block);
  _Block_object_dispose(v13, 8);
}

void sub_1B87DEE84(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void __TMSetupTime_block_invoke(uint64_t a1, xpc_object_t object)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    xpc_retain(object);
    BOOL v4 = *(NSObject **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __TMSetupTime_block_invoke_2;
    v6[3] = &unk_1E617B5C8;
    uint64_t v5 = *(void *)(a1 + 48);
    v6[4] = object;
    v6[5] = v5;
    dispatch_async(v4, v6);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    dispatch_release(*(dispatch_object_t *)(a1 + 32));
  }
  _TMReleaseConnection(*(xpc_object_t *)(a1 + 40));
}

void __TMSetupTime_block_invoke_2(uint64_t a1)
{
  if (MEMORY[0x1BA9C2250](*(void *)(a1 + 32)) == MEMORY[0x1E4F14590])
  {
    if (xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 32), "TMSetupSuccessful"))
    {
      os_activity_scope_state_s v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      goto LABEL_7;
    }
    xpc_object_t v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"Error from timed" forKey:*MEMORY[0x1E4F28568]];
    BOOL v4 = v7;
    uint64_t v5 = 1;
  }
  else
  {
    xpc_object_t v2 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"Framework developer error" forKey:*MEMORY[0x1E4F28568]];
    BOOL v4 = v2;
    uint64_t v5 = 2;
  }
  [v4 errorWithDomain:@"com.apple.time" code:v5 userInfo:v3];
  os_activity_scope_state_s v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_7:
  v6();
  uint64_t v8 = *(void **)(a1 + 32);

  xpc_release(v8);
}

void __TMSetupTime_block_invoke_3(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    xpc_object_t v2 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __TMSetupTime_block_invoke_4;
    block[3] = &unk_1E617B618;
    block[4] = *(void *)(a1 + 40);
    dispatch_async(v2, block);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    dispatch_release(*(dispatch_object_t *)(a1 + 32));
  }
}

uint64_t __TMSetupTime_block_invoke_4(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"com.apple.time", 3, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"Client timeout error", *MEMORY[0x1E4F28568]));
  xpc_object_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v2();
}

void TMSetupTimeZone(NSObject *a1, uint64_t a2, double a3)
{
  os_activity_scope_state_s v6 = (_xpc_connection_s *)_TMCopyConnection(0);
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v7, "TMCommand", "TMSetupTimeZone");
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  char v14 = 0;
  dispatch_retain(a1);
  uint64_t v8 = _TMConnectionQueue();
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __TMSetupTimeZone_block_invoke;
  handler[3] = &unk_1E617B5F0;
  handler[6] = a2;
  handler[7] = v13;
  handler[4] = a1;
  handler[5] = v6;
  xpc_connection_send_message_with_reply(v6, v7, v8, handler);
  xpc_release(v7);
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  id v10 = _TMConnectionQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __TMSetupTimeZone_block_invoke_3;
  block[3] = &unk_1E617B640;
  void block[5] = a2;
  block[6] = v13;
  block[4] = a1;
  dispatch_after(v9, v10, block);
  _Block_object_dispose(v13, 8);
}

void sub_1B87DF314(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void __TMSetupTimeZone_block_invoke(uint64_t a1, xpc_object_t object)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    xpc_retain(object);
    BOOL v4 = *(NSObject **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __TMSetupTimeZone_block_invoke_2;
    v6[3] = &unk_1E617B5C8;
    uint64_t v5 = *(void *)(a1 + 48);
    v6[4] = object;
    v6[5] = v5;
    dispatch_async(v4, v6);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    dispatch_release(*(dispatch_object_t *)(a1 + 32));
  }
  _TMReleaseConnection(*(xpc_object_t *)(a1 + 40));
}

void __TMSetupTimeZone_block_invoke_2(uint64_t a1)
{
  if (MEMORY[0x1BA9C2250](*(void *)(a1 + 32)) == MEMORY[0x1E4F14590])
  {
    if (xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 32), "TMSetupSuccessful"))
    {
      os_activity_scope_state_s v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      goto LABEL_7;
    }
    xpc_object_t v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"Error from timed" forKey:*MEMORY[0x1E4F28568]];
    BOOL v4 = v7;
    uint64_t v5 = 1;
  }
  else
  {
    xpc_object_t v2 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"Framework developer error" forKey:*MEMORY[0x1E4F28568]];
    BOOL v4 = v2;
    uint64_t v5 = 2;
  }
  [v4 errorWithDomain:@"com.apple.time" code:v5 userInfo:v3];
  os_activity_scope_state_s v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_7:
  v6();
  uint64_t v8 = *(void **)(a1 + 32);

  xpc_release(v8);
}

void __TMSetupTimeZone_block_invoke_3(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    xpc_object_t v2 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __TMSetupTimeZone_block_invoke_4;
    block[3] = &unk_1E617B618;
    block[4] = *(void *)(a1 + 40);
    dispatch_async(v2, block);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    dispatch_release(*(dispatch_object_t *)(a1 + 32));
  }
}

uint64_t __TMSetupTimeZone_block_invoke_4(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"com.apple.time", 3, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"Client timeout error", *MEMORY[0x1E4F28568]));
  xpc_object_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v2();
}

void TMProvideCellularTimeZone(void *a1, int a2, int a3, unsigned int a4, unsigned int a5, double a6)
{
  if (a4 <= 2)
  {
    __y[1] = v9;
    __y[2] = v8;
    __y[11] = v6;
    __y[12] = v7;
    if (a5 <= 0x3E7)
    {
      double v16 = _TMGetKernelMonotonicClock();
      id v17 = objc_alloc_init(MEMORY[0x1E4F28B28]);
      v18 = _os_activity_create(&dword_1B87DB000, "TMProvideCellularTimeZone", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v18, &state);
      xpc_object_t v19 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v19, "TMCommand", "TMProvideCellularTimeZone");
      xpc_dictionary_set_string(v19, "TMSource", (const char *)[a1 UTF8String]);
      xpc_dictionary_set_double(v19, "TMCurrentTime", a6);
      if (a6 >= 9223372040.0)
      {
        v22 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), @"TMUtilities_Private.h", 56, @"CFTimeInterval too large for TMNanoTimeInterval: %lf", *(void *)&a6);
      }
      if (a6 <= -9223372040.0)
      {
        v23 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), @"TMUtilities_Private.h", 57, @"CFTimeInterval too small for TMNanoTimeInterval: %lf", *(void *)&a6);
      }
      __y[0] = 0.0;
      long double v20 = modf(a6, __y);
      xpc_dictionary_set_int64(v19, "TMAbsoluteNanoTime", llround(v20 * 1000000000.0) + 1000000000 * (uint64_t)__y[0]);
      xpc_dictionary_set_int64(v19, "TMTzOffset", a3);
      xpc_dictionary_set_int64(v19, "TMDstActive", a4);
      xpc_dictionary_set_int64(v19, "TMMcc", a5);
      xpc_dictionary_set_int64(v19, "TMCellSlot", a2);
      xpc_dictionary_set_double(v19, "TMRtcTime", v16);
      if (xpc_dictionary_get_value(v19, "TMRtcTime"))
      {
        if (xpc_dictionary_get_double(v19, "TMRtcTime") <= 0.5)
        {
          v24 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
          objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void TMProvideCellularTimeZone(CFStringRef, int, CFAbsoluteTime, int, int, int)"), @"TMClient.m", 638, @"Invalid RTC bear trap.");
        }
      }
      v21 = (_xpc_connection_s *)_TMCopyConnection(0);
      xpc_connection_send_message(v21, v19);
      xpc_release(v19);
      _TMReleaseConnection(v21);
      os_activity_scope_leave(&state);
    }
  }
}

CFStringRef TMCopyComputedTimeZone()
{
  double v0 = _os_activity_create(&dword_1B87DB000, "TMGetComputedTimeZone", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v0, &v7);
  xpc_object_t v1 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v1, "TMCommand", "TMGetComputedTimeZone");
  xpc_object_t v2 = (_xpc_connection_s *)_TMCopyConnection(0);
  xpc_object_t v3 = xpc_connection_send_message_with_reply_sync(v2, v1);
  xpc_release(v1);
  _TMReleaseConnection(v2);
  os_activity_scope_leave(&v7);

  if (!v3) {
    return 0;
  }
  if (MEMORY[0x1BA9C2250](v3) == MEMORY[0x1E4F14590] && (string = xpc_dictionary_get_string(v3, "TMTimeZone")) != 0) {
    CFStringRef v4 = CFStringCreateWithCString(0, string, 0x8000100u);
  }
  else {
    CFStringRef v4 = 0;
  }
  xpc_release(v3);
  return v4;
}

uint64_t TMResetToFirstLaunch()
{
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 0;
  uint64_t v12 = 0;
  long double v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v8 = 0;
  long double v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  double v0 = _TMConnectionQueue();
  mach_service = xpc_connection_create_mach_service("com.apple.timed.xpc", v0, 0);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __TMResetToFirstLaunch_block_invoke;
  handler[3] = &unk_1E617B668;
  handler[4] = &v8;
  handler[5] = &v12;
  handler[6] = v16;
  xpc_connection_set_event_handler(mach_service, handler);
  xpc_connection_resume(mach_service);
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "TMCommand", "TMResetToFirstLaunch");
  xpc_object_t v3 = _TMConnectionQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __TMResetToFirstLaunch_block_invoke_2;
  v6[3] = &unk_1E617B690;
  v6[4] = mach_service;
  v6[5] = v2;
  void v6[6] = v16;
  dispatch_async(v3, v6);
  while (!*((unsigned char *)v9 + 24) && !*((unsigned char *)v13 + 24))
    sleep(1u);
  xpc_release(mach_service);
  uint64_t v4 = *((unsigned __int8 *)v13 + 24) ^ 1u;
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(v16, 8);
  return v4;
}

void sub_1B87DFC1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Block_object_dispose((const void *)(v15 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __TMResetToFirstLaunch_block_invoke(void *a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1BA9C2250](a2);
  if (result != MEMORY[0x1E4F145A8]) {
    goto LABEL_2;
  }
  if (a2 == MEMORY[0x1E4F14528])
  {
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
    goto LABEL_2;
  }
  if (a2 != MEMORY[0x1E4F14520])
  {
LABEL_2:
    uint64_t v5 = a1[5];
    goto LABEL_3;
  }
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  }
  uint64_t v5 = a1[4];
LABEL_3:
  *(unsigned char *)(*(void *)(v5 + 8) + 24) = 1;
  return result;
}

void __TMResetToFirstLaunch_block_invoke_2(uint64_t a1)
{
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  xpc_object_t v2 = *(void **)(a1 + 40);

  xpc_release(v2);
}

void ___shouldThrottle_block_invoke(uint64_t a1)
{
  if (_lastMessages)
  {
    xpc_object_t v2 = (void *)[(id)_lastMessages objectForKey:*(void *)(a1 + 32)];
    if (v2)
    {
      long long v14 = 0uLL;
      double v15 = 0.0;
      [v2 getValue:&v14];
      double v3 = *(double *)(a1 + 48) - *(double *)&v14;
      double v4 = TMPropagateError(v15, v3);
      double v5 = *((double *)&v14 + 1);
      double v6 = TMGetKernelMonotonicClockResolution();
      if (*(double *)(a1 + 48) >= *(double *)&v14)
      {
        double v7 = *(double *)(a1 + 64);
        BOOL v8 = v7 < v4 + -0.1 || v7 > v4 + 0.1;
        if (!v8 && v3 <= *(double *)(a1 + 72))
        {
          double v9 = *(double *)(a1 + 56);
          double v10 = vabdd_f64(v9, *((double *)&v14 + 1));
          BOOL v11 = v9 > v3 + v5 + v6 || v9 < v3 + v5 - v6;
          if (!v11 || v10 < 2.22044605e-16) {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
          }
        }
      }
    }
  }
  else
  {
    _lastMessages = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    TMCFNotificationCenterAddObserver(DarwinNotifyCenter, @"TimedResetNotification", 0, (CFNotificationSuspensionBehavior)0, &__block_literal_global);
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    long long v14 = *(_OWORD *)(a1 + 48);
    double v15 = *(double *)(a1 + 64);
    objc_msgSend((id)_lastMessages, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F29238], "value:withObjCType:", &v14, "{?=ddd}"), *(void *)(a1 + 32));
  }
}

uint64_t ___shouldThrottle_block_invoke_2()
{
  double v0 = _TMConnectionQueue();
  dispatch_async(v0, &__block_literal_global_89);
  return 1;
}

uint64_t ___shouldThrottle_block_invoke_3()
{
  return [(id)_lastMessages removeAllObjects];
}

uint64_t type metadata for __ObjC(unint64_t a1)
{
  if (a1 >= 0x1C) {
    TMSourceNameFromSrc_cold_1();
  }
  return (uint64_t)*off_1E617B7F8[a1];
}

uint64_t type metadata for UnsafeMutableBufferPointer(uint64_t a1)
{
  if (TMSrcFromName_onceToken != -1) {
    dispatch_once(&TMSrcFromName_onceToken, &__block_literal_global_0);
  }
  xpc_object_t v2 = (void *)[(id)TMSrcFromName_sMap objectForKeyedSubscript:a1];
  if (!v2) {
    return 27;
  }

  return [v2 unsignedIntegerValue];
}

id __TMSrcFromName_block_invoke()
{
  v2[28] = *MEMORY[0x1E4F143B8];
  v1[0] = @"NITZ";
  v1[1] = @"CDMA";
  v2[0] = &unk_1F11F1BF8;
  v2[1] = &unk_1F11F1C10;
  v1[2] = @"GPS";
  v1[3] = @"LocationServer";
  v2[2] = &unk_1F11F1C28;
  v2[3] = &unk_1F11F1C40;
  v1[4] = @"HarvestServer";
  v1[5] = @"NTP";
  v2[4] = &unk_1F11F1C58;
  v2[5] = &unk_1F11F1C70;
  v1[6] = @"NTPLowConfidence";
  v1[7] = @"NTPPacket";
  v2[6] = &unk_1F11F1C88;
  v2[7] = &unk_1F11F1CA0;
  v1[8] = @"MobileLockdown";
  v1[9] = @"iTunesStoreServer";
  int v2[8] = &unk_1F11F1CB8;
  v2[9] = &unk_1F11F1CD0;
  v1[10] = @"Location";
  v1[11] = @"Computed";
  v2[10] = &unk_1F11F1CE8;
  v2[11] = &unk_1F11F1D00;
  v1[12] = @"LocationAndNetwork";
  v1[13] = @"TimeSourceGnssValidPos";
  v2[12] = &unk_1F11F1D18;
  v2[13] = &unk_1F11F1D30;
  v1[14] = @"TimeSourceGnss";
  v1[15] = @"TimeSourceBBTimeTransfer";
  v2[14] = &unk_1F11F1D48;
  v2[15] = &unk_1F11F1D60;
  v1[16] = @"TimeSourceBBTimeTagging";
  v1[17] = @"TimeSourceUnknown";
  v2[16] = &unk_1F11F1D78;
  v2[17] = &unk_1F11F1D90;
  v1[18] = @"TMLSSourceComputed";
  v1[19] = @"TMLSSourceComputedReliable";
  v2[18] = &unk_1F11F1DA8;
  v2[19] = &unk_1F11F1DC0;
  v1[20] = @"TMLSSourceUser";
  v1[21] = @"TMLSSourceDevice";
  v2[20] = &unk_1F11F1DD8;
  v2[21] = &unk_1F11F1DF0;
  v1[22] = @"FilesystemTimestamp";
  v1[23] = @"AirPlaySendingDeviceTime";
  v2[22] = &unk_1F11F1E08;
  v2[23] = &unk_1F11F1E20;
  v1[24] = @"ProxBuddy";
  v1[25] = @"APNS";
  v2[24] = &unk_1F11F1E38;
  v2[25] = &unk_1F11F1E50;
  v1[26] = @"Accessory";
  v1[27] = @"Unknown";
  v2[26] = &unk_1F11F1E68;
  v2[27] = &unk_1F11F1E80;
  id result = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v2 forKeys:v1 count:28];
  TMSrcFromName_sMap = (uint64_t)result;
  return result;
}

uint64_t TMCmdFromName(uint64_t a1)
{
  if (TMCmdFromName_onceToken != -1) {
    dispatch_once(&TMCmdFromName_onceToken, &__block_literal_global_141);
  }
  xpc_object_t v2 = (void *)[(id)TMCmdFromName_sMap objectForKeyedSubscript:a1];
  if (v2) {
    return [v2 unsignedIntegerValue];
  }
  else {
    return 23;
  }
}

id __TMCmdFromName_block_invoke()
{
  v2[24] = *MEMORY[0x1E4F143B8];
  v1[0] = @"TMSetSourceTime";
  v1[1] = @"TMSetSourceAvailable";
  v2[0] = &unk_1F11F1E98;
  v2[1] = &unk_1F11F1EB0;
  v1[2] = @"TMSetSourceUnavailable";
  v1[3] = @"TMSetSourceTimeZone";
  v2[2] = &unk_1F11F1EC8;
  v2[3] = &unk_1F11F1EE0;
  v1[4] = @"TMSetAutomaticTimeEnabled";
  v1[5] = @"TMIsAutomaticTimeEnabled";
  v2[4] = &unk_1F11F1EF8;
  v2[5] = &unk_1F11F1F10;
  v1[6] = @"TMSetAutomaticTimeZoneEnabled";
  v1[7] = @"TMIsAutomaticTimeZoneEnabled";
  v2[6] = &unk_1F11F1F28;
  v2[7] = &unk_1F11F1F40;
  v1[8] = @"TMIsTimeZoneConfirmed";
  v1[9] = @"TMConfirmTimeZone";
  int v2[8] = &unk_1F11F1F58;
  v2[9] = &unk_1F11F1F70;
  v1[10] = @"TMGetReferenceTime";
  v1[11] = @"TMSetReferenceUnreliable";
  v2[10] = &unk_1F11F1F88;
  v2[11] = &unk_1F11F1FA0;
  v1[12] = @"TMIsLocationTimeZoneActive";
  v1[13] = @"TMIsBBTimeActive";
  v2[12] = &unk_1F11F1FB8;
  v2[13] = &unk_1F11F1FD0;
  v1[14] = @"TMProvideBBTime";
  v1[15] = @"TMReceiveNtpPacket";
  v2[14] = &unk_1F11F1FE8;
  v2[15] = &unk_1F11F2000;
  v1[16] = @"TMSetupTime";
  v1[17] = @"TMSetupTimeZone";
  v2[16] = &unk_1F11F2018;
  v2[17] = &unk_1F11F2030;
  v1[18] = @"TMProvideCellularTimeZone";
  v1[19] = @"TMResetTimeZone";
  v2[18] = &unk_1F11F2048;
  v2[19] = &unk_1F11F2060;
  v1[20] = @"TMSystemWillWake";
  v1[21] = @"TMFetchNTP";
  v2[20] = &unk_1F11F2078;
  v2[21] = &unk_1F11F2090;
  v1[22] = @"TMResetToFirstLaunch";
  v1[23] = @"TMUnknown";
  v2[22] = &unk_1F11F20A8;
  v2[23] = &unk_1F11F20C0;
  id result = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v2 forKeys:v1 count:24];
  TMCmdFromName_sMap = (uint64_t)result;
  return result;
}

uint64_t TMDeviceHasPMU()
{
  if (TMDeviceHasPMU_token != -1) {
    dispatch_once(&TMDeviceHasPMU_token, &__block_literal_global_264);
  }
  return TMDeviceHasPMU_hasPMU;
}

double TMGetKernelMonotonicClockResolution()
{
  if (TMGetKernelMonotonicClockResolution_onceToken != -1) {
    dispatch_once(&TMGetKernelMonotonicClockResolution_onceToken, &__block_literal_global_267);
  }
  return *(double *)&TMGetKernelMonotonicClockResolution_sInterval;
}

double _TMSyncKernelMonotonicClock(uint64_t *a1, double *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (TMDeviceHasPMU_token != -1) {
    dispatch_once(&TMDeviceHasPMU_token, &__block_literal_global_264);
  }
  if (TMDeviceHasPMU_hasPMU)
  {
    if (_TMSyncKernelMonotonicClock_onceToken != -1) {
      dispatch_once(&_TMSyncKernelMonotonicClock_onceToken, &__block_literal_global_270);
    }
    size_t v4 = 16;
    if (!a1) {
      size_t v4 = 8;
    }
    size_t v14 = v4;
    int v5 = 3;
    double v6 = MEMORY[0x1E4F14500];
    while (sysctl((int *)&_TMSyncKernelMonotonicClock_mib, _TMSyncKernelMonotonicClock_miblen, &v18, &v14, 0, 0))
    {
      double v7 = __error();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v8 = *v7;
        double v9 = strerror(v8);
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = v9;
        __int16 v16 = 1024;
        int v17 = v8;
        _os_log_error_impl(&dword_1B87DB000, v6, OS_LOG_TYPE_ERROR, "CoreTime: Could not get kern.monotonicclock_usecs: %s(%d)\n", buf, 0x12u);
      }
      if (!--v5)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          _TMSyncKernelMonotonicClock_cold_1();
          if (a1) {
LABEL_26:
          }
            *a1 = 0;
        }
        else if (a1)
        {
          goto LABEL_26;
        }
        double v10 = -1.0;
        if (a2) {
          *a2 = -1.0;
        }
        return v10;
      }
    }
    double v11 = (double)v18;
    if (a2) {
      *a2 = 0.0005;
    }
    double v10 = v11 / 1000000.0;
    if (v14 != 16)
    {
      uint64_t v19 = mach_absolute_time();
      double v10 = v10 + *(double *)&_TMSyncKernelMonotonicClock_halfResolution;
      if (a2) {
        *a2 = *(double *)&_TMSyncKernelMonotonicClock_halfResolution + *a2;
      }
    }
    if (a1) {
      *a1 = v19;
    }
  }
  else
  {
    *(void *)buf = 0;
    unint64_t v18 = 0;
    mach_get_times();
    if (a1) {
      *a1 = *(void *)buf;
    }
    return TMConvertTicksToSeconds(v18);
  }
  return v10;
}

uint64_t _TMKernelMonotonicClockOffset(uint64_t a1)
{
  if (TMDeviceHasPMU_token != -1) {
    dispatch_once(&TMDeviceHasPMU_token, &__block_literal_global_264);
  }
  if (!TMDeviceHasPMU_hasPMU)
  {
    mach_get_times();
    return -(uint64_t)TMConvertTicksToNanoTime(0);
  }
  if (a1 < 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    _TMKernelMonotonicClockOffset_cold_3(a1);
  }
  uint64_t v6 = a1 / 1000;
  if (_TMKernelMonotonicClockOffset_onceToken != -1) {
    dispatch_once(&_TMKernelMonotonicClockOffset_onceToken, &__block_literal_global_272);
  }
  uint64_t v7 = 0;
  uint64_t v5 = 8;
  if ((unint64_t)(a1 + 999) >= 0x7CF) {
    xpc_object_t v2 = &v6;
  }
  else {
    xpc_object_t v2 = 0;
  }
  if (sysctl((int *)&_TMKernelMonotonicClockOffset_mib, _TMKernelMonotonicClockOffset_miblen, &v7, (size_t *)&v5, v2, 8 * ((unint64_t)(a1 + 999) > 0x7CE)))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      _TMKernelMonotonicClockOffset_cold_2();
    }
  }
  else
  {
    uint64_t v4 = v5;
    if (v5 == 8) {
      return 1000 * v7;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      _TMKernelMonotonicClockOffset_cold_1(v4);
    }
  }
  return 0;
}

unint64_t TMConvertTicksToNanoTime(unint64_t a1)
{
  unsigned int v2 = TMConvertTicksToNanoTime_numer;
  if (!TMConvertTicksToNanoTime_numer)
  {
    TMGetMachTimebase((uint32_t *)&TMConvertTicksToNanoTime_numer, (uint32_t *)&TMConvertTicksToNanoTime_denom);
    unsigned int v2 = TMConvertTicksToNanoTime_numer;
    if (!TMConvertTicksToNanoTime_numer) {
      TMConvertTicksToNanoTime_cold_1();
    }
    if (!TMConvertTicksToNanoTime_denom) {
      TMConvertTicksToNanoTime_cold_2();
    }
  }
  if (is_mul_ok(v2, a1))
  {
    unint64_t v3 = v2 * a1 / TMConvertTicksToNanoTime_denom;
    if ((v3 & 0x8000000000000000) != 0) {
      panic("TMConvertTicksToNanoTime not possible due to signed overflow");
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1B87DB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Overflow during TMConvertTicksToNanoTime conversion, falling back to reciprocal ratio", v5, 2u);
      unsigned int v2 = TMConvertTicksToNanoTime_numer;
    }
    return a1 / (TMConvertTicksToNanoTime_denom / v2);
  }
  return v3;
}

BOOL TMIsValidTime(double a1)
{
  if (a1 >= -1.0 && a1 <= 1.0) {
    return 0;
  }
  BOOL v2 = -1.0 - *MEMORY[0x1E4F1CF78] > a1 || 1.0 - *MEMORY[0x1E4F1CF78] < a1;
  if (!v2 || a1 >= -6.31456128e10 && a1 <= -6.31456128e10) {
    return 0;
  }
  if (1.0 - *MEMORY[0x1E4F1CF68] < a1) {
    return 1;
  }
  return -1.0 - *MEMORY[0x1E4F1CF68] > a1;
}

BOOL TMIsValidNetworkOffset(int a1)
{
  return (a1 + 960) < 0x781;
}

BOOL TMIsValidMcc(unsigned int a1)
{
  return a1 < 0x3E8;
}

double TMCFAbsoluteTimeToTimeval(uint64_t *a1, long double a2)
{
  TMCFTimeIntervalToTimeval((uint64_t)a1, a2);
  double result = *MEMORY[0x1E4F1CF78] + (double)*a1;
  *a1 = (uint64_t)result;
  return result;
}

uint64_t TMCFTimeIntervalToTimeval(uint64_t a1, long double a2)
{
  double __y = 0.0;
  double v3 = modf(a2, &__y);
  uint64_t result = 0;
  if (fabs(__y) != INFINITY)
  {
    if (__y < 9.22337204e18)
    {
      BOOL v6 = __y == -9.22337204e18;
      BOOL v5 = __y >= -9.22337204e18;
    }
    else
    {
      BOOL v5 = 0;
      BOOL v6 = 0;
    }
    if (!v6 && v5)
    {
      *(void *)a1 = (uint64_t)__y;
      *(_DWORD *)(a1 + 8) = (int)(v3 * 1000000.0);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

double TMTimevalToCFAbsoluteTime(uint64_t a1, int a2)
{
  return (double)a2 / 1000000.0 + (double)(a1 - (uint64_t)*MEMORY[0x1E4F1CF78]);
}

double TMPropagateError(double a1, double a2)
{
  if (a2 < 0.0) {
    a2 = -a2;
  }
  return a1 + a2 * 0.00002;
}

uint64_t TMCalculateGCD(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return a1;
  }
  do
  {
    uint64_t v2 = a2;
    a2 = a1 % a2;
    LODWORD(a1) = v2;
  }
  while (a2);
  return v2;
}

uint64_t TMGetMachTimebase(uint32_t *a1, uint32_t *a2)
{
  mach_timebase_info info = 0;
  uint64_t result = mach_timebase_info(&info);
  if (result) {
    TMGetMachTimebase_cold_1();
  }
  uint32_t denom = info.denom;
  if (info.denom)
  {
    uint32_t v6 = info.denom;
    uint32_t numer = info.numer;
    do
    {
      uint32_t v8 = v6;
      uint32_t v6 = numer % v6;
      uint32_t numer = v8;
    }
    while (v6);
  }
  else
  {
    uint32_t v8 = info.numer;
  }
  *a1 = info.numer / v8;
  *a2 = denom / v8;
  return result;
}

double TMElapsedIntervalInSeconds(unint64_t a1, unint64_t a2)
{
  if (a2 < a1) {
    return -TMConvertTicksToSeconds(a1 - a2);
  }
  unint64_t v4 = a2 - a1;
  return TMConvertTicksToSeconds(v4);
}

double TMCalculateMachTimeIntervalInSeconds(unint64_t a1, unint64_t a2)
{
  if (a2 <= a1) {
    return TMConvertTicksToSeconds(a1 - a2);
  }
  else {
    return TMConvertTicksToSeconds(a2 - a1);
  }
}

void TMCFNotificationCenterAddObserver(__CFNotificationCenter *a1, const __CFString *a2, const void *a3, CFNotificationSuspensionBehavior a4, void *aBlock)
{
  double v9 = _Block_copy(aBlock);
  double v10 = _Block_copy(v9);

  CFNotificationCenterAddObserver(a1, v10, (CFNotificationCallback)_notificationHandlerCallback, a2, a3, a4);
}

void _notificationHandlerCallback(__CFNotificationCenter *a1, uint64_t (**a2)(void, void), const __CFString *a3, const void *a4)
{
  if ((((uint64_t (**)(void, __CFNotificationCenter *))a2)[2](a2, a1) & 1) == 0)
  {
    CFNotificationCenterRemoveObserver(a1, a2, a3, a4);
    _Block_release(a2);
  }
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t _TMConnectionQueue()
{
  if (_TMConnectionQueue_sPred != -1) {
    dispatch_once(&_TMConnectionQueue_sPred, &__block_literal_global_1);
  }
  return _TMConnectionQueue_sConnectionQueue;
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void TMSourceNameFromSrc_cold_1()
{
}

void __TMGetKernelMonotonicClockResolution_block_invoke_cold_1()
{
  __error();
  double v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1B87DB000, MEMORY[0x1E4F14500], v1, "CoreTime: Error occurred %d %s\n", v2, v3, v4, v5, v6);
}

void __TMGetKernelMonotonicClockResolution_block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _TMGetKernelMonotonicClock_cold_1()
{
  __error();
  double v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1B87DB000, MEMORY[0x1E4F14500], v1, "Error occurred %d %s\n", v2, v3, v4, v5, v6);
}

void _TMGetKernelMonotonicClock_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _TMSyncKernelMonotonicClock_cold_1()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  v0[0] = 67109120;
  v0[1] = 3;
  _os_log_error_impl(&dword_1B87DB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "CoreTime: ERROR: Could not get kern.monotonicclock_usecs after %d attempts\n", (uint8_t *)v0, 8u);
}

void _TMKernelMonotonicClockOffset_cold_1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 134218240;
  uint64_t v2 = 8;
  __int16 v3 = 2048;
  uint64_t v4 = a1;
  _os_log_error_impl(&dword_1B87DB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "CoreTime: ERROR: Expected %lld bytes from kern.monotoniclock_offset_usecs but got %lld\n", (uint8_t *)&v1, 0x16u);
}

void _TMKernelMonotonicClockOffset_cold_2()
{
  __error();
  double v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1B87DB000, MEMORY[0x1E4F14500], v1, "CoreTime: ERROR: Could not get/set kern.monotoniclock_offset_usecs %d %s\n", v2, v3, v4, v5, v6);
}

void _TMKernelMonotonicClockOffset_cold_3(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 134217984;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1B87DB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Applying unlikely time offset: %lld", (uint8_t *)&v1, 0xCu);
}

void TMConvertTicksToNanoTime_cold_1()
{
  __assert_rtn("TMConvertTicksToNanoTime", "TMUtilities.m", 515, "numer != 0");
}

void TMConvertTicksToNanoTime_cold_2()
{
  __assert_rtn("TMConvertTicksToNanoTime", "TMUtilities.m", 516, "denom != 0");
}

void TMGetMachTimebase_cold_1()
{
  __assert_rtn("TMGetMachTimebase", "TMUtilities.m", 494, "timebaseResult == KERN_SUCCESS");
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
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

long double modf(long double __x, long double *__y)
{
  MEMORY[0x1F40CCE48](__y, __x);
  return result;
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void panic(const char *a1, ...)
{
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlnametomib(const char *a1, int *a2, size_t *a3)
{
  return MEMORY[0x1F40CE3E0](a1, a2, a3);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1F40CEC68](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  MEMORY[0x1F40CEEB8](xdict, key);
  return result;
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

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1F40CF248](object);
}