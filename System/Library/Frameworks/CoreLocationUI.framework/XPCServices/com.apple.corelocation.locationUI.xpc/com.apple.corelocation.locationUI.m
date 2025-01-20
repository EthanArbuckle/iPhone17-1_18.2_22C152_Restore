int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  void *v4;

  v3 = objc_opt_new();
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

void sub_100004B5C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id sub_100004B78(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) tintColor];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) tintColor];
    Components = CGColorGetComponents((CGColorRef)[v3 CGColor]);

    float v5 = *Components * 255.0;
    unint64_t v6 = llroundf(v5);
    float v7 = Components[1] * 255.0;
    unint64_t v8 = llroundf(v7);
    float v9 = Components[2] * 255.0;
    unint64_t v10 = llroundf(v9);
    float v11 = Components[3] * 255.0;
    v12 = +[NSString stringWithFormat:@"#%02lX%02lX%02lX%02lX", v6, v8, v10, llroundf(v11)];
  }
  else
  {
    v12 = @"Invalid";
  }
  v13 = [*(id *)(a1 + 32) backgroundColor];

  if (v13)
  {
    id v14 = [*(id *)(a1 + 32) backgroundColor];
    v15 = CGColorGetComponents((CGColorRef)[v14 CGColor]);

    float v16 = *v15 * 255.0;
    unint64_t v17 = llroundf(v16);
    float v18 = v15[1] * 255.0;
    unint64_t v19 = llroundf(v18);
    float v20 = v15[2] * 255.0;
    unint64_t v21 = llroundf(v20);
    float v22 = v15[3] * 255.0;
    v23 = +[NSString stringWithFormat:@"#%02lX%02lX%02lX%02lX", v17, v19, v21, llroundf(v22)];
  }
  else
  {
    v23 = @"Invalid";
  }
  v33[0] = @"ClientKey";
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v34[0] = WeakRetained;
  v33[1] = @"Icon";
  v25 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [*(id *)(a1 + 32) icon]);
  v34[1] = v25;
  v33[2] = @"Label";
  v26 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [*(id *)(a1 + 32) label]);
  v34[2] = v26;
  v33[3] = @"CornerRadius";
  [*(id *)(a1 + 32) cornerRadius];
  v27 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v34[3] = v27;
  v33[4] = @"Width";
  [*(id *)(a1 + 32) buttonWidth];
  v28 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v34[4] = v28;
  v33[5] = @"Height";
  [*(id *)(a1 + 32) buttonHeight];
  v29 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v34[5] = v29;
  v33[6] = @"FontSize";
  [*(id *)(a1 + 32) fontSize];
  v30 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v34[6] = v30;
  v34[7] = v12;
  v33[7] = @"TintColor";
  v33[8] = @"BackgroundColor";
  v34[8] = v23;
  v31 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:9];

  return v31;
}

uint64_t sub_1000051EC@<X0>(uint64_t result@<X0>, uint64_t a2@<X5>, uint64_t a3@<X8>)
{
  *(void *)(a3 + 134) = a2;
  *(void *)(a3 + 154) = result;
  return result;
}

void sub_100005228(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100005244(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_100005260(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10000527C(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t CLCommonCalculateGcd(uint64_t a1, uint64_t a2)
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

double CLCommonConvertTicksToSeconds(unint64_t a1)
{
  double v2 = *(double *)&qword_10000CF20;
  if (*(double *)&qword_10000CF20 == 0.0)
  {
    mach_timebase_info(&info);
    if (info.denom)
    {
      uint32_t denom = info.denom;
      uint32_t numer = info.numer;
      do
      {
        uint32_t v5 = denom;
        uint32_t denom = numer % denom;
        uint32_t numer = v5;
      }
      while (denom);
    }
    else
    {
      uint32_t v5 = info.numer;
    }
    unsigned int v6 = 1000000000;
    uint32_t v7 = info.numer / v5;
    do
    {
      uint32_t v8 = v7;
      uint32_t v7 = v6;
      unsigned int v6 = v8 % v6;
    }
    while (v6);
    double v2 = (double)(info.numer / v5 / v7) / (double)(0x3B9ACA00 / v7 * (unint64_t)(info.denom / v5));
    *(double *)&qword_10000CF20 = v2;
  }
  return v2 * (double)a1;
}

double CLCommonGetMachTime()
{
  uint64_t v0 = mach_absolute_time();

  return CLCommonConvertTicksToSeconds(v0);
}

double CLCommonGetMachContinuousTime()
{
  uint64_t v0 = mach_continuous_time();

  return CLCommonConvertTicksToSeconds(v0);
}

void sub_10000540C(void *a1)
{
  v1[0] = 67109120;
  v1[1] = [a1 pid];
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Error : #locationButton process-bundle is nil for pid: %d", (uint8_t *)v1, 8u);
}

void sub_100005490(void *a1)
{
  uint64_t v1 = [a1 debugDescription];
  sub_1000052B4();
  sub_100005260((void *)&_mh_execute_header, &_os_log_default, v2, "#locationButton unable to get process-handle. Error: %@", v3, v4, v5, v6, v7);
}

void sub_100005518(void *a1)
{
  [a1 timestamp];
  sub_10000529C();
  sub_100005244((void *)&_mh_execute_header, &_os_log_default, v1, "Error: #locationButton authMessage has a time-stamp in future. current-ts:%lld authMessage-ts:%lld", v2, v3, v4, v5, v6);
}

void sub_100005598(void *a1, double a2)
{
  [a1 timestamp];
  sub_10000529C();
  __int16 v5 = v3;
  double v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Error: #locationButton authMessage is too old. current-ts:%lld authMessage-ts:%lld authMessageAgeInSec:%lf", v4, 0x20u);
}

float sub_100005638()
{
  v1[0] = 67109888;
  v1[1] = _AXFeatureSupportsNonSightedUsage();
  __int16 v2 = 1024;
  int v3 = _AXSCommandAndControlEnabled();
  __int16 v4 = 1024;
  int v5 = _AXSFullKeyboardAccessEnabled();
  __int16 v6 = 1024;
  int v7 = _AXSAutomationEnabled();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "#locationButton VoiceInteraction enabled. NonSightedUsage:%d, CControlEnabled:%d, FKAEnabled:%d, Authomation:%d", (uint8_t *)v1, 0x1Au);
  return result;
}

void sub_1000056FC(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 16) identifier];
  sub_1000052B4();
  sub_100005260((void *)&_mh_execute_header, &_os_log_default, v2, "#locationButton granting temporary authorization. client: %@", v3, v4, v5, v6, v7);
}

void sub_100005788(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000057C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005800(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000583C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005878(void *a1, void *a2)
{
  [a1 slotId];
  [a2 targetSlotID];
  sub_100005244((void *)&_mh_execute_header, &_os_log_default, v3, "Error: #locationButton invalid slotId. Expected: %lu hitTestSlotId: %lu", v4, v5, v6, v7, 0);
}

void sub_100005918(void *a1)
{
  [a1 context];
  sub_1000052B4();
  sub_100005260((void *)&_mh_execute_header, &_os_log_default, v1, "Error: #locationButton invalid authMessageContext: %lu", v2, v3, v4, v5, v6);
}

void sub_10000598C(void *a1)
{
  [a1 versionedPID];
  sub_1000052C0();
  sub_100005244((void *)&_mh_execute_header, &_os_log_default, v1, "Error: #locationButton authMessage vpid: %lld does not matches auditToken vpid: %lld ", v2, v3, v4, v5, v6);
}

void sub_100005A10(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Error: #locationButton AuthenticationStatus for message not valid. Status : %d", (uint8_t *)v1, 8u);
}

void sub_100005A90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005ACC()
{
  sub_1000052C0();
  sub_100005244((void *)&_mh_execute_header, &_os_log_default, v0, "#locationButton layerStatus: %lu contentStatus: %lu", v1, v2, v3, v4, v5);
}

void sub_100005B40()
{
  sub_10000527C(__stack_chk_guard);
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v2 = *(void *)(v0 + 120);
  int v13 = 134221824;
  uint64_t v14 = v3;
  __int16 v15 = 2048;
  uint64_t v16 = v4;
  __int16 v17 = 2048;
  uint64_t v18 = v5;
  __int16 v19 = 2048;
  uint64_t v20 = v6;
  __int16 v21 = 2048;
  uint64_t v22 = v7;
  __int16 v23 = 2048;
  uint64_t v24 = v8;
  __int16 v25 = 2048;
  uint64_t v26 = v9;
  __int16 v27 = 2048;
  uint64_t v28 = v10;
  __int16 v29 = 2048;
  uint64_t v30 = v11;
  sub_1000051EC(v2, v1, v12);
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "#locationButton cumulativeLayerTransform - [%f, %f, %f, %f] [%f, %f, %f, %f] [%f, %f, %f, %f] [%f, %f, %f, %f]", (uint8_t *)&v13, 0xA2u);
}

void sub_100005C14()
{
  sub_10000527C(__stack_chk_guard);
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v2 = *(void *)(v0 + 120);
  int v13 = 134221824;
  uint64_t v14 = v3;
  __int16 v15 = 2048;
  uint64_t v16 = v4;
  __int16 v17 = 2048;
  uint64_t v18 = v5;
  __int16 v19 = 2048;
  uint64_t v20 = v6;
  __int16 v21 = 2048;
  uint64_t v22 = v7;
  __int16 v23 = 2048;
  uint64_t v24 = v8;
  __int16 v25 = 2048;
  uint64_t v26 = v9;
  __int16 v27 = 2048;
  uint64_t v28 = v10;
  __int16 v29 = 2048;
  uint64_t v30 = v11;
  sub_1000051EC(v2, v1, v12);
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "#locationButton cumulativeContentsTransform - [%f, %f, %f, %f] [%f, %f, %f, %f] [%f, %f, %f, %f] [%f, %f, %f, %f]", (uint8_t *)&v13, 0xA2u);
}

void sub_100005CE8(void *a1)
{
  uint64_t v1 = [a1 debugDescription];
  sub_1000052B4();
  sub_100005260((void *)&_mh_execute_header, &_os_log_default, v2, "#locationButton error in getting the LSApplicationRecord %@", v3, v4, v5, v6, v7);
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t BSVersionedPIDForAuditToken()
{
  return _BSVersionedPIDForAuditToken();
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return _CGColorGetComponents(color);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGIsDeviceOneOfType()
{
  return _MGIsDeviceOneOfType();
}

uint64_t _AXFeatureSupportsNonSightedUsage()
{
  return __AXFeatureSupportsNonSightedUsage();
}

uint64_t _AXSAutomationEnabled()
{
  return __AXSAutomationEnabled();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return __AXSCommandAndControlEnabled();
}

uint64_t _AXSFullKeyboardAccessEnabled()
{
  return __AXSFullKeyboardAccessEnabled();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return [a1 backgroundColor];
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return [a1 bundle];
}

id objc_msgSend_buttonHeight(void *a1, const char *a2, ...)
{
  return [a1 buttonHeight];
}

id objc_msgSend_buttonWidth(void *a1, const char *a2, ...)
{
  return [a1 buttonWidth];
}

id objc_msgSend_compatibilityObject(void *a1, const char *a2, ...)
{
  return [a1 compatibilityObject];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_cornerRadius(void *a1, const char *a2, ...)
{
  return [a1 cornerRadius];
}

id objc_msgSend_cumulativeContentsTransform(void *a1, const char *a2, ...)
{
  return [a1 cumulativeContentsTransform];
}

id objc_msgSend_cumulativeLayerTransform(void *a1, const char *a2, ...)
{
  return [a1 cumulativeLayerTransform];
}

id objc_msgSend_cumulativeOpacity(void *a1, const char *a2, ...)
{
  return [a1 cumulativeOpacity];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_detectedOcclusion(void *a1, const char *a2, ...)
{
  return [a1 detectedOcclusion];
}

id objc_msgSend_fontSize(void *a1, const char *a2, ...)
{
  return [a1 fontSize];
}

id objc_msgSend_hasInsecureFilter(void *a1, const char *a2, ...)
{
  return [a1 hasInsecureFilter];
}

id objc_msgSend_hitTestInformationFromEndEvent(void *a1, const char *a2, ...)
{
  return [a1 hitTestInformationFromEndEvent];
}

id objc_msgSend_hitTestInformationFromStartEvent(void *a1, const char *a2, ...)
{
  return [a1 hitTestInformationFromStartEvent];
}

id objc_msgSend_icon(void *a1, const char *a2, ...)
{
  return [a1 icon];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_imagedTag(void *a1, const char *a2, ...)
{
  return [a1 imagedTag];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return [a1 pid];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_renderedSuccessfully(void *a1, const char *a2, ...)
{
  return [a1 renderedSuccessfully];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_sdkVersion(void *a1, const char *a2, ...)
{
  return [a1 sdkVersion];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_slotId(void *a1, const char *a2, ...)
{
  return [a1 slotId];
}

id objc_msgSend_targetSlotID(void *a1, const char *a2, ...)
{
  return [a1 targetSlotID];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return [a1 tintColor];
}

id objc_msgSend_versionedPID(void *a1, const char *a2, ...)
{
  return [a1 versionedPID];
}