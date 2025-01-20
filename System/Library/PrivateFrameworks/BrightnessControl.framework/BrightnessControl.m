uint64_t BCBrtControlSetNits(void *a1, const char *a2)
{
  return objc_msgSend(a1, "setNits:error:", a2);
}

void sub_238364E64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_238366D88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_238367560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL _isIOKitCompatible(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 1;
  }
  inited = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT) {
    inited = init_default_corebrightness_log();
  }
  BOOL result = os_log_type_enabled(inited, OS_LOG_TYPE_ERROR);
  if (result)
  {
    _isIOKitCompatible_cold_1(a1, inited, v4, v5, v6, v7, v8, v9);
    return 0;
  }
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_238369010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_238369530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_238369B98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_238369E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_238369FCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void BoostFactorUpdateNotificationCallback(void *a1, int a2, int a3, uint64_t a4)
{
  if ([a1 logHandle])
  {
    os_log_t inited = (os_log_t)[a1 logHandle];
LABEL_3:
    uint64_t v9 = inited;
    goto LABEL_5;
  }
  uint64_t v9 = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT)
  {
    os_log_t inited = init_default_corebrightness_log();
    goto LABEL_3;
  }
LABEL_5:
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    BoostFactorUpdateNotificationCallback_cold_1(a3, a2, v9);
  }
  if (a3 == -536788733)
  {
    [a1 boostFactorFromIOFixed:a4];
    objc_msgSend(a1, "setBoostFactor:");
  }
}

id _copyMatchingDict()
{
  v4[3] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x23EC8DDF0]();
  v4[0] = @"IOHIDDevice";
  v3[0] = @"IOProviderClass";
  v3[1] = @"DeviceUsagePage";
  v4[1] = [NSNumber numberWithUnsignedInteger:128];
  v3[2] = @"DeviceUsage";
  v4[2] = [NSNumber numberWithUnsignedInteger:1];
  id v1 = (id)[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
  return v1;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

double getUserForNits(double a1)
{
  double v1 = 0.0;
  if (a1 <= 0.0) {
    return v1;
  }
  double v1 = 1.0;
  if (a1 >= 728.274) {
    return v1;
  }
  uint64_t v2 = 0;
  unint64_t v3 = 1001;
  uint64_t v4 = 1001;
  do
  {
    uint64_t v5 = v2 + (v3 >> 1);
    if (*((double *)&table + 2 * v5) >= a1) {
      uint64_t v4 = v5;
    }
    else {
      uint64_t v2 = v5;
    }
    unint64_t v3 = v4 - v2;
  }
  while ((unint64_t)(v4 - v2) > 1);
  return *((double *)&table + 2 * v2 + 1)
       + (a1 - *((double *)&table + 2 * v2))
       / (*((double *)&table + 2 * v4) - *((double *)&table + 2 * v2))
       * (*((double *)&table + 2 * v4 + 1) - *((double *)&table + 2 * v2 + 1));
}

uint64_t copyNitsToUserMapping()
{
  v0 = (void *)MEMORY[0x23EC8DDF0]();
  double v1 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:1002];
  uint64_t v2 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:1002];
  uint64_t v3 = 0;
  uint64_t v4 = &qword_23836F510;
  do
  {
    objc_msgSend(v1, "setObject:atIndexedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", *((double *)v4 - 1)), v3);
    double v5 = *(double *)v4;
    v4 += 2;
    objc_msgSend(v2, "setObject:atIndexedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v5), v3++);
  }
  while (v3 != 1002);
  id v6 = objc_alloc(MEMORY[0x263EFF8C0]);
  uint64_t v7 = [objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v1];
  uint64_t v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithArray:", v2), 0);
  return v8;
}

float clamp(float a1, float a2, float a3)
{
  if (a1 <= a3) {
    a3 = a1;
  }
  if (a1 >= a2) {
    return a3;
  }
  else {
    return a2;
  }
}

BOOL float_equal(float a1, float a2)
{
  return vabds_f32(a1, a2) <= (float)(fmaxf(fabsf(a1), fabsf(a2)) * 0.00000011921);
}

float linear_interpolation(float a1, float a2, float a3, float a4, float a5)
{
  return a3 + (float)((float)((float)(a5 - a3) / (float)(a4 - a2)) * (float)(a1 - a2));
}

float *find_bound(float *result, unint64_t a2, float a3, unint64_t *a4, unint64_t *a5)
{
  unint64_t v5 = 0;
  unint64_t v6 = 0;
  if (!result || !a2) {
    goto LABEL_13;
  }
  if (*result > a3)
  {
    unint64_t v5 = 0;
    unint64_t v6 = 1;
LABEL_13:
    *a4 = v5;
    *a5 = v6;
    return result;
  }
  unint64_t v6 = a2 - 1;
  if (result[a2 - 1] <= a3)
  {
    unint64_t v5 = a2 - 2;
    goto LABEL_13;
  }
  if (a2 >= 2)
  {
    unint64_t v5 = 0;
    while (result[v5] > a3 || result[v5 + 1] <= a3)
    {
      if (v6 == ++v5) {
        return result;
      }
    }
    unint64_t v6 = v5 + 1;
    goto LABEL_13;
  }
  return result;
}

float matrix_element(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return *(float *)(a1 + 4 * (a3 + a4 * a2));
}

float *two_dimensional_interpolation(float *result, unint64_t a2, float *a3, unint64_t a4, uint64_t a5, float a6, float a7)
{
  if (a4 >= 2 && a2 >= 2 && result && a3 && a5)
  {
    float v9 = result[a2 - 1];
    if (v9 >= a6) {
      float v9 = a6;
    }
    if (*result <= a6) {
      float v10 = v9;
    }
    else {
      float v10 = *result;
    }
    float v11 = a3[a4 - 1];
    if (v11 >= a7) {
      float v11 = a7;
    }
    if (*a3 <= a7) {
      float v12 = v11;
    }
    else {
      float v12 = *a3;
    }
    unint64_t v15 = 0;
    unint64_t v16 = 0;
    find_bound(result, a2, v10, &v16, &v15);
    unint64_t v13 = 0;
    unint64_t v14 = 0;
    return find_bound(a3, a4, v12, &v14, &v13);
  }
  return result;
}

float mach_time_to_nanoseconds(unint64_t a1)
{
  if (mach_time_to_nanoseconds::token != -1) {
    dispatch_once(&mach_time_to_nanoseconds::token, &__block_literal_global);
  }
  return *(float *)&mach_time_to_nanoseconds::machTimeBaseFactor * (float)a1;
}

float __mach_time_to_nanoseconds_block_invoke()
{
  mach_timebase_info(&info);
  float result = (float)info.numer / (float)info.denom;
  *(float *)&mach_time_to_nanoseconds::machTimeBaseFactor = result;
  return result;
}

float mach_time_to_milliseconds(unint64_t a1)
{
  if (mach_time_to_nanoseconds::token != -1) {
    dispatch_once(&mach_time_to_nanoseconds::token, &__block_literal_global);
  }
  return (float)(*(float *)&mach_time_to_nanoseconds::machTimeBaseFactor * (float)a1) / 1000000.0;
}

float mach_time_to_seconds(unint64_t a1)
{
  if (mach_time_to_nanoseconds::token != -1) {
    dispatch_once(&mach_time_to_nanoseconds::token, &__block_literal_global);
  }
  return (float)(*(float *)&mach_time_to_nanoseconds::machTimeBaseFactor * (float)a1) / 1000000000.0;
}

float mach_time_now_in_nanoseconds()
{
  uint64_t v0 = mach_absolute_time();
  if (mach_time_to_nanoseconds::token != -1) {
    dispatch_once(&mach_time_to_nanoseconds::token, &__block_literal_global);
  }
  return *(float *)&mach_time_to_nanoseconds::machTimeBaseFactor * (float)v0;
}

float mach_time_now_in_milliseconds()
{
  uint64_t v0 = mach_absolute_time();
  if (mach_time_to_nanoseconds::token != -1) {
    dispatch_once(&mach_time_to_nanoseconds::token, &__block_literal_global);
  }
  return (float)(*(float *)&mach_time_to_nanoseconds::machTimeBaseFactor * (float)v0) / 1000000.0;
}

float mach_time_now_in_seconds()
{
  uint64_t v0 = mach_absolute_time();
  if (mach_time_to_nanoseconds::token != -1) {
    dispatch_once(&mach_time_to_nanoseconds::token, &__block_literal_global);
  }
  return (float)(*(float *)&mach_time_to_nanoseconds::machTimeBaseFactor * (float)v0) / 1000000000.0;
}

unint64_t create_integer_array_from_cfdata(const void *a1, UInt8 **a2)
{
  if (!a1 || (CFTypeID v4 = CFGetTypeID(a1), v4 != CFDataGetTypeID()))
  {
    uint64_t v7 = 0;
    goto LABEL_6;
  }
  unint64_t Length = CFDataGetLength((CFDataRef)a1);
  unint64_t v6 = Length >> 2;
  uint64_t v7 = (UInt8 *)malloc_type_calloc(Length >> 2, 4uLL, 0x100004052888210uLL);
  if (!v7)
  {
LABEL_6:
    unint64_t v6 = 0;
    goto LABEL_7;
  }
  v9.length = Length & 0xFFFFFFFFFFFFFFFCLL;
  v9.location = 0;
  CFDataGetBytes((CFDataRef)a1, v9, v7);
LABEL_7:
  *a2 = v7;
  return v6;
}

uint64_t get_integer_from_cfdata(uint64_t result, _DWORD *a2)
{
  *(_DWORD *)buffer = 0;
  if (result)
  {
    CFDataRef v3 = (const __CFData *)result;
    CFTypeID v4 = CFGetTypeID((CFTypeRef)result);
    if (v4 == CFDataGetTypeID() && CFDataGetLength(v3) == 4)
    {
      v7.location = 0;
      v7.length = 4;
      CFDataGetBytes(v3, v7, buffer);
      float result = 1;
      int v5 = *(_DWORD *)buffer;
    }
    else
    {
      int v5 = 0;
      float result = 0;
    }
  }
  else
  {
    int v5 = 0;
  }
  *a2 = v5;
  return result;
}

BOOL get_uint32_from_cfdata(const void *a1, unsigned int *a2)
{
  if (!a1) {
    return 0;
  }
  CFTypeID v4 = CFGetTypeID(a1);
  if (v4 != CFDataGetTypeID()) {
    return 0;
  }
  *(_DWORD *)buffer = 0;
  CFIndex Length = CFDataGetLength((CFDataRef)a1);
  BOOL v6 = Length == 4;
  if (Length == 4)
  {
    v9.location = 0;
    v9.length = 4;
    CFDataGetBytes((CFDataRef)a1, v9, buffer);
    *a2 = *(_DWORD *)buffer;
  }
  return v6;
}

uint64_t get_float_from_cfdata(uint64_t result, int *a2)
{
  *(_DWORD *)buffer = 2143289344;
  if (!result) {
    goto LABEL_6;
  }
  CFDataRef v3 = (const __CFData *)result;
  CFTypeID v4 = CFGetTypeID((CFTypeRef)result);
  if (v4 != CFDataGetTypeID() || CFDataGetLength(v3) != 4)
  {
    float result = 0;
LABEL_6:
    int v5 = 2143289344;
    goto LABEL_7;
  }
  v7.location = 0;
  v7.length = 4;
  CFDataGetBytes(v3, v7, buffer);
  float result = 1;
  int v5 = *(_DWORD *)buffer;
LABEL_7:
  *a2 = v5;
  return result;
}

CFTypeRef load_integer_array_from_edt(io_registry_entry_t a1, CFStringRef key, UInt8 **a3)
{
  CFTypeRef result = IORegistryEntrySearchCFProperty(a1, "IOService", key, (CFAllocatorRef)*MEMORY[0x263EFFB08], 3u);
  if (result)
  {
    CFTypeRef v5 = result;
    unint64_t integer_array_from_cfdata = create_integer_array_from_cfdata(result, a3);
    CFRelease(v5);
    return (CFTypeRef)integer_array_from_cfdata;
  }
  else
  {
    *a3 = 0;
  }
  return result;
}

unint64_t load_float_array_from_edt(io_registry_entry_t a1, CFStringRef key, void *a3)
{
  CFTypeRef v4 = IORegistryEntrySearchCFProperty(a1, "IOService", key, (CFAllocatorRef)*MEMORY[0x263EFFB08], 3u);
  if (v4)
  {
    CFTypeRef v5 = v4;
    uint64_t v8 = 0;
    unint64_t v6 = create_integer_array_from_cfdata(v4, &v8);
    *a3 = v8;
    CFRelease(v5);
  }
  else
  {
    unint64_t v6 = 0;
    *a3 = 0;
  }
  return v6;
}

float load_float_from_edt(io_registry_entry_t a1, CFStringRef key)
{
  float v5 = NAN;
  CFTypeRef v2 = IORegistryEntrySearchCFProperty(a1, "IOService", key, (CFAllocatorRef)*MEMORY[0x263EFFB08], 3u);
  if (!v2) {
    return NAN;
  }
  CFDataRef v3 = v2;
  get_float_from_cfdata((uint64_t)v2, (int *)&v5);
  CFRelease(v3);
  return v5;
}

CFTypeRef load_int_from_edt(io_registry_entry_t a1, CFStringRef key, _DWORD *a3)
{
  CFTypeRef result = IORegistryEntrySearchCFProperty(a1, "IOService", key, (CFAllocatorRef)*MEMORY[0x263EFFB08], 3u);
  if (result)
  {
    CFTypeRef v5 = result;
    uint64_t integer_from_cfdata = get_integer_from_cfdata((uint64_t)result, a3);
    CFRelease(v5);
    return (CFTypeRef)integer_from_cfdata;
  }
  return result;
}

CFTypeRef load_uint_from_edt(io_registry_entry_t a1, CFStringRef key, unsigned int *a3)
{
  CFTypeRef result = IORegistryEntrySearchCFProperty(a1, "IOService", key, (CFAllocatorRef)*MEMORY[0x263EFFB08], 3u);
  if (result)
  {
    CFTypeRef v5 = result;
    BOOL uint32_from_cfdata = get_uint32_from_cfdata(result, a3);
    CFRelease(v5);
    return (CFTypeRef)uint32_from_cfdata;
  }
  return result;
}

float load_fixed_float_from_edt(io_registry_entry_t a1, CFStringRef key)
{
  CFTypeRef v2 = IORegistryEntrySearchCFProperty(a1, "IOService", key, (CFAllocatorRef)*MEMORY[0x263EFFB08], 3u);
  if (!v2) {
    return NAN;
  }
  CFDataRef v3 = v2;
  int v6 = 0;
  if (get_integer_from_cfdata((uint64_t)v2, &v6)) {
    float v4 = (float)v6 * 0.000015259;
  }
  else {
    float v4 = NAN;
  }
  CFRelease(v3);
  return v4;
}

double scaleForExponent(int a1)
{
  double result = 1.0;
  if (a1 >= 8)
  {
    if (a1 <= 0xF)
    {
      for (int i = 16; i > a1; --i)
        double result = result * 10.0;
    }
  }
  else
  {
    double v2 = 1.0;
    if (a1 >= 1)
    {
      do
      {
        double v2 = v2 * 10.0;
        --a1;
      }
      while (a1);
    }
    return 1.0 / v2;
  }
  return result;
}

float LuminanceToPerceptual(float a1, float a2, float a3)
{
  float v5 = logf(fmaxf(a1, a2) / a3);
  return (float)(v5 / logf(a3 / a2)) + 1.0;
}

float PerceptualToLuminance(float a1, float a2, float a3)
{
  return powf(a3 / a2, a1 + -1.0) * a3;
}

char *get_int_from_bootarg(const char *a1, _DWORD *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  bzero(__s1, 0x400uLL);
  size_t v7 = 1024;
  if (sysctlbyname("kern.bootargs", __s1, &v7, 0, 0)) {
    return 0;
  }
  double result = strstr(__s1, a1);
  if (result)
  {
    float v5 = result;
    size_t v6 = strlen(a1);
    *a2 = strtol(&v5[v6 + 1], 0, 0);
    return (char *)1;
  }
  return result;
}

os_log_t init_default_corebrightness_log()
{
  os_log_t v0 = os_log_create("com.apple.CoreBrightness", "default");
  _COREBRIGHTNESS_LOG_DEFAULT = (uint64_t)v0;
  if (!v0)
  {
    os_log_t v0 = (os_log_t)&_os_log_internal;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      init_default_corebrightness_log_cold_1();
    }
    _COREBRIGHTNESS_LOG_DEFAULT = (uint64_t)v0;
  }
  return v0;
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  displays = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v3 = +[BCBrtControl copyAllAvailableControls];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_msgSend((id)displays, "setObject:forKeyedSubscript:", v8, objc_msgSend(v8, "ID"));
        [v8 setDisplayInvalidHandler:&__block_literal_global_0];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __main_block_invoke_2;
  v10[3] = &unk_264D102F0;
  v10[4] = &__block_literal_global_0;
  objc_msgSend(+[BCBrtControl newMonitorForAllControlsWithHandler:error:](BCBrtControl, "newMonitorForAllControlsWithHandler:error:", v10, 0), "cancel");
  return 0;
}

uint64_t __main_block_invoke(uint64_t a1, void *a2)
{
  double v2 = (void *)displays;
  uint64_t v3 = [a2 ID];
  return [v2 removeObjectForKey:v3];
}

void __main_block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = objc_msgSend((id)displays, "objectForKey:", objc_msgSend(a2, "ID"));
    if (v3)
    {
      if (([v3 isEqual:a2] & 1) == 0) {
        __main_block_invoke_2_cold_1();
      }
    }
    else
    {
      objc_msgSend((id)displays, "setObject:forKeyedSubscript:", a2, objc_msgSend(a2, "ID"));
      objc_msgSend(a2, "setCallbackQueue:", dispatch_get_global_queue(0, 0));
      uint64_t v4 = *(void *)(a1 + 32);
      [a2 setDisplayInvalidHandler:v4];
    }
  }
}

uint64_t setBrightnessOnAllDisplays(double a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v2 = (void *)displays;
  uint64_t result = [(id)displays countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        size_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        uint64_t v8 = 0;
        [v7 setNits:&v8 error:a1];
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

void sub_23836D5F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _iokitCallback(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 16))();
}

void *_newBlockWrapper(const void *a1)
{
  if (!a1) {
    _newBlockWrapper_cold_1();
  }
  double v2 = malloc_type_malloc(8uLL, 0x80040B8603338uLL);
  *double v2 = _Block_copy(a1);
  return v2;
}

void _freeBlockWrapper(const void **a1)
{
  _Block_release(*a1);
  free(a1);
}

void sub_23836D830(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id BCBrtControlNewMonitorForAllDisplaysWithHandler(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __BCBrtControlNewMonitorForAllDisplaysWithHandler_block_invoke;
  v4[3] = &__block_descriptor_48_e22_v16__0__BCBrtControl_8l;
  void v4[4] = a1;
  v4[5] = a2;
  return +[BCBrtControl newMonitorForAllControlsWithHandler:v4 error:a3];
}

uint64_t __BCBrtControlNewMonitorForAllDisplaysWithHandler_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))(*(void *)(a1 + 40));
}

id BCBrtControlCopyAvailableDisplays()
{
  return +[BCBrtControl copyAllAvailableControls];
}

uint64_t BCBrtControlSetMultipleControlEnabled(void *a1, const char *a2)
{
  return [a1 setMultipleControlEnabled:a2];
}

uint64_t BCBrtControlSetDisplayInvalidHandler(void *a1, uint64_t a2, uint64_t a3)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __BCBrtControlSetDisplayInvalidHandler_block_invoke;
  v4[3] = &__block_descriptor_48_e22_v16__0__BCBrtControl_8l;
  void v4[4] = a2;
  v4[5] = a3;
  return [a1 setDisplayInvalidHandler:v4];
}

uint64_t __BCBrtControlSetDisplayInvalidHandler_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))(*(void *)(a1 + 40));
}

uint64_t BCBrtControlSetCallbackQueue(void *a1, const char *a2)
{
  return [a1 setCallbackQueue:a2];
}

uint64_t BCBrtControlIsEqual(void *a1, const char *a2)
{
  return [a1 isEqual:a2];
}

uint64_t BCBrtControlSetNitsAsync(void *a1, uint64_t a2, uint64_t a3)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __BCBrtControlSetNitsAsync_block_invoke;
  v4[3] = &__block_descriptor_48_e17_v16__0__NSError_8l;
  void v4[4] = a2;
  v4[5] = a3;
  return objc_msgSend(a1, "setNitsAsync:completionHandler:", v4);
}

uint64_t __BCBrtControlSetNitsAsync_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))(*(void *)(a1 + 40));
}

uint64_t BCBrtControlGetNits(void *a1, const char *a2)
{
  return [a1 getNitsWithError:a2];
}

uint64_t BCBrtControlSetProperty(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return [a1 setProperty:a2 value:a3 error:a4];
}

uint64_t BCBrtControlSetPropertyAync(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __BCBrtControlSetPropertyAync_block_invoke;
  v6[3] = &__block_descriptor_48_e17_v16__0__NSError_8l;
  v6[4] = a4;
  v6[5] = a5;
  return [a1 setPropertyAync:a2 value:a3 completionHandler:v6];
}

uint64_t __BCBrtControlSetPropertyAync_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))(*(void *)(a1 + 40));
}

uint64_t BCBrtControlCopyProperty(void *a1, const char *a2, uint64_t a3)
{
  return [a1 copyProperty:a2 error:a3];
}

uint64_t BCBrtControlSetDisplayService(void *a1, const char *a2)
{
  return [a1 setDisplayService:a2];
}

void _isIOKitCompatible_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void BoostFactorUpdateNotificationCallback_cold_1(int a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_debug_impl(&dword_238363000, log, OS_LOG_TYPE_DEBUG, "display service message type 0x%X from service 0x%X", (uint8_t *)v3, 0xEu);
}

void init_default_corebrightness_log_cold_1()
{
  *(_WORD *)os_log_t v0 = 0;
  _os_log_error_impl(&dword_238363000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to create CoreBrightness default log", v0, 2u);
}

void __main_block_invoke_2_cold_1()
{
}

void _newBlockWrapper_cold_1()
{
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x270EE5478](alloc, uuidStr);
}

CFDataRef IOCFSerialize(CFTypeRef object, CFOptionFlags options)
{
  return (CFDataRef)MEMORY[0x270EF3EF0](object, options);
}

CFTypeRef IOCFUnserializeBinary(const char *buffer, size_t bufferSize, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return (CFTypeRef)MEMORY[0x270EF3F00](buffer, bufferSize, allocator, options, errorString);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x270EF47B8](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x270EF4828](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x270EF4A38](*(void *)&entry, entryID);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF4A50](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntrySetCFProperties(io_registry_entry_t entry, CFTypeRef properties)
{
  return MEMORY[0x270EF4A58](*(void *)&entry, properties);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x270EF4A60](*(void *)&entry, propertyName, property);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x270EF4A80](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x270EF4A88](notifyPort, notificationType, matching, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x270EF4AB8](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
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

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
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

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

float logf(float a1)
{
  MEMORY[0x270EDA0F8](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
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

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
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

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD00](a1, a2);
  return result;
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB6A0](__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}