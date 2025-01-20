id CalGenerateRandomDispatchQueueName(__CFString *a1)
{
  __CFString *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  uint64_t vars8;

  v2 = @"Unknown";
  if (a1) {
    v2 = a1;
  }
  v3 = NSString;
  v4 = v2;
  v5 = a1;
  v6 = CalGenerateUUID();
  v7 = [v3 stringWithFormat:@"%@-%@", v4, v6];

  return v7;
}

__CFString *CalGenerateUUID()
{
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFUUIDRef v1 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  v2 = (__CFString *)CFUUIDCreateString(v0, v1);
  CFRelease(v1);

  return v2;
}

void sub_190D8BEF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190D8C184(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id CalCachedObjectForKeyWithCalculateBlock(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  v7 = a3;
  v8 = [v5 objectForKey:v6];
  if (!v8)
  {
    v9 = v7[2](v7);
    v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [MEMORY[0x1E4F1CA98] null];
    }
    v8 = v11;
    [v5 setObject:v11 forKey:v6];
  }
  v12 = [MEMORY[0x1E4F1CA98] null];
  int v13 = [v8 isEqual:v12];

  if (v13)
  {

    v8 = 0;
  }

  return v8;
}

void sub_190D8C340(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t timezonesAreEquivalent(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  uint64_t v6 = 0;
  if (v3 && v4)
  {
    if ([v3 isEqualToTimeZone:v4])
    {
      uint64_t v6 = 1;
    }
    else
    {
      v7 = [v3 name];
      unint64_t v8 = [v7 length];
      if (v8 >= 0x3F) {
        uint64_t v9 = 63;
      }
      else {
        uint64_t v9 = v8;
      }
      objc_msgSend(v7, "getCharacters:range:", v16, 0, v9);
      v16[v9] = 0;

      v10 = [v5 name];
      unint64_t v11 = [v10 length];
      if (v11 >= 0x3F) {
        uint64_t v12 = 63;
      }
      else {
        uint64_t v12 = v11;
      }
      objc_msgSend(v10, "getCharacters:range:", v15, 0, v12);
      v15[v12] = 0;

      *(_DWORD *)s2 = 0;
      ucal_getCanonicalTimeZoneID();
      ucal_getCanonicalTimeZoneID();
      uint64_t v6 = 0;
    }
  }

  return v6;
}

void sub_190D90BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_190D90E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_190D91E20(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190D91EC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _EKSharedGregorianCalendarLock()
{
  if (_EKSharedGregorianCalendarLock_onceToken != -1) {
    dispatch_once(&_EKSharedGregorianCalendarLock_onceToken, &__block_literal_global_13_1);
  }
  CFAllocatorRef v0 = (void *)_EKSharedGregorianCalendarLock_sharedGregorianCalendarLock;

  return v0;
}

id _EKSharedGregorianCalendarForTimeZone(void *a1)
{
  id v1 = a1;
  v2 = [v1 name];
  id v3 = v2;
  if (v1)
  {
    if (!v2)
    {
      id v4 = 0;
      goto LABEL_13;
    }
  }
  else
  {

    id v3 = @"floating";
  }
  id v5 = (void *)_EKSharedGregorianCalendarForTimeZone___calendarCache;
  if (!_EKSharedGregorianCalendarForTimeZone___calendarCache)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    v7 = (void *)_EKSharedGregorianCalendarForTimeZone___calendarCache;
    _EKSharedGregorianCalendarForTimeZone___calendarCache = v6;

    id v5 = (void *)_EKSharedGregorianCalendarForTimeZone___calendarCache;
  }
  uint64_t v8 = [v5 objectForKeyedSubscript:v3];
  if (v8)
  {
    id v4 = (void *)v8;
    if ([(__CFString *)v3 isEqualToString:@"floating"])
    {
      uint64_t v9 = [v4 timeZone];
      v10 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
      char v11 = [v9 isEquivalentTo:v10];

      if ((v11 & 1) == 0)
      {
        uint64_t v12 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
        [v4 setTimeZone:v12];
      }
    }
  }
  else
  {
    id v13 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    v14 = (void *)[v13 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    id v4 = v14;
    if (v14)
    {
      [v14 setTimeZone:v1];
      [(id)_EKSharedGregorianCalendarForTimeZone___calendarCache setObject:v4 forKeyedSubscript:v3];
    }
  }
LABEL_13:

  return v4;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
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

void sub_190D94C60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
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

id EKDateGetDateComponents(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  id v22 = 0;
  v7 = _EKSharedGregorianCalendarLock();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __EKDateGetDateComponents_block_invoke;
  v12[3] = &unk_1E56CDAB8;
  id v13 = v5;
  id v14 = v6;
  v15 = &v17;
  uint64_t v16 = a2;
  id v8 = v6;
  id v9 = v5;
  dispatch_sync(v7, v12);

  id v10 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v10;
}

uint64_t __EKDateGetDateComponents_block_invoke(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    id v1 = (void *)result;
    v2 = _EKSharedGregorianCalendarForTimeZone(*(void **)(result + 40));
    uint64_t v3 = [v2 components:v1[7] fromDate:v1[4]];
    uint64_t v4 = *(void *)(v1[6] + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    uint64_t v6 = v1[5];
    v7 = *(void **)(*(void *)(v1[6] + 8) + 40);
    return [v7 setTimeZone:v6];
  }
  return result;
}

void sub_190D980A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _phoneNumberDetector()
{
  if (_phoneNumberDetector_onceToken != -1) {
    dispatch_once(&_phoneNumberDetector_onceToken, &__block_literal_global_207);
  }
  CFAllocatorRef v0 = (void *)_sPhoneNumberDetector;

  return v0;
}

void sub_190D99A18(_Unwind_Exception *a1)
{
}

void sub_190D99F24(_Unwind_Exception *a1)
{
}

uint64_t ___phoneNumberDetector_block_invoke()
{
  _sPhoneNumberDetector = [objc_alloc(MEMORY[0x1E4F28BE8]) initWithTypes:2080 error:0];

  return MEMORY[0x1F41817F8]();
}

double _CalRecurrenceByDayItemCopy(uint64_t a1, double *a2)
{
  uint64_t v3 = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  if (v3)
  {
    double result = *a2;
    *uint64_t v3 = *(void *)a2;
  }
  return result;
}

void _CalRecurrenceByDayItemFree(int a1, void *a2)
{
  if (a2) {
    free(a2);
  }
}

CFStringRef _CalRecurrenceByDayItemCopyStringRepresentation(unsigned int *a1)
{
  id v1 = &stru_1EE0C39E0;
  if ((int)*a1 > 0) {
    id v1 = @"+";
  }
  return CFStringCreateWithFormat(0, 0, @"%@%d%s", v1, *a1, kCalDayStrings[a1[1]]);
}

BOOL _CalRecurrenceByDayItemEqual(_DWORD *a1, _DWORD *a2)
{
  BOOL result = a1 == a2;
  if (a2 && a1 && a1 != a2) {
    return a1[1] == a2[1] && *a1 == *a2;
  }
  return result;
}

__CFString *CalDescriptionForCalVirtualConferenceSource(uint64_t a1)
{
  if (a1) {
    return @"Google";
  }
  else {
    return @"Apple";
  }
}

void sub_190D9C75C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ChronoServicesLibraryCore()
{
  if (!ChronoServicesLibraryCore_frameworkLibrary) {
    ChronoServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return ChronoServicesLibraryCore_frameworkLibrary;
}

uint64_t __ChronoServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ChronoServicesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCHSTimelineControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v3 = 0;
  if (!ChronoServicesLibraryCore()) {
    __getCHSTimelineControllerClass_block_invoke_cold_1(&v3);
  }
  Class result = objc_getClass("CHSTimelineController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCHSTimelineControllerClass_block_invoke_cold_2();
  }
  getCHSTimelineControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_190D9D300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

id anonString_block_invoke()
{
  CFAllocatorRef v0 = NSString;
  ++anonString_block_invoke_count;
  id v1 = objc_msgSend(NSNumber, "numberWithInteger:");
  v2 = [v0 stringWithFormat:@"SomeString-%@", v1];

  return v2;
}

id anonSummary_block_invoke_2()
{
  CFAllocatorRef v0 = NSString;
  ++anonSummary_block_invoke_2_count;
  id v1 = objc_msgSend(NSNumber, "numberWithInteger:");
  v2 = [v0 stringWithFormat:@"SomeSummary-%@", v1];

  return v2;
}

id anonDescription_block_invoke_3()
{
  CFAllocatorRef v0 = NSString;
  ++anonDescription_block_invoke_3_count;
  id v1 = objc_msgSend(NSNumber, "numberWithInteger:");
  v2 = [v0 stringWithFormat:@"SomeDescription-%@", v1];

  return v2;
}

id anonUID_block_invoke_4()
{
  CFAllocatorRef v0 = CalGenerateUUID();
  id v1 = [NSString stringWithFormat:@"SomeUID-%@", v0];

  return v1;
}

id anonURNUID_block_invoke_5()
{
  CFAllocatorRef v0 = CalGenerateUUID();
  id v1 = [NSString stringWithFormat:@"uuid:SomeURNUID-%@", v0];

  return v1;
}

id anonName_block_invoke_6()
{
  CFAllocatorRef v0 = NSString;
  ++anonName_block_invoke_6_count;
  id v1 = objc_msgSend(NSNumber, "numberWithInteger:");
  v2 = [v0 stringWithFormat:@"Somebody-%@", v1];

  return v2;
}

id anonEmail_block_invoke_7()
{
  CFAllocatorRef v0 = NSString;
  ++anonEmail_block_invoke_7_count;
  id v1 = objc_msgSend(NSNumber, "numberWithInteger:");
  v2 = +[CaliCalendarAnonymizer sharedAnonymizedDomainName];
  uint64_t v3 = [v0 stringWithFormat:@"SomeMr-%@@%@", v1, v2];

  return v3;
}

id anonLocation_block_invoke_8()
{
  CFAllocatorRef v0 = NSString;
  ++anonLocation_block_invoke_8_count;
  id v1 = objc_msgSend(NSNumber, "numberWithInteger:");
  v2 = [v0 stringWithFormat:@"SomeLoc-%@", v1];

  return v2;
}

id anonPhoneNumber_block_invoke_9()
{
  CFAllocatorRef v0 = NSString;
  ++anonPhoneNumber_block_invoke_9_count;
  id v1 = objc_msgSend(NSNumber, "numberWithInteger:");
  v2 = [v0 stringWithFormat:@"SomePhone-%@", v1];

  return v2;
}

id anonWebURL_block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if ([v2 rangeOfString:@"//"] != 0x7FFFFFFFFFFFFFFFLL) {
    [v3 appendString:@"//"];
  }
  uint64_t v4 = random();
  if (v4 <= 0) {
    uint64_t v5 = -(uint64_t)-(char)v4;
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t v6 = random();
  if (v6 <= 0) {
    uint64_t v7 = -(uint64_t)-(char)v6;
  }
  else {
    uint64_t v7 = v6;
  }
  uint64_t v8 = random();
  if (v8 <= 0) {
    uint64_t v9 = -(uint64_t)-(char)v8;
  }
  else {
    uint64_t v9 = v8;
  }
  uint64_t v10 = random();
  if (v10 <= 0) {
    uint64_t v11 = -(uint64_t)-(char)v10;
  }
  else {
    uint64_t v11 = v10;
  }
  objc_msgSend(v3, "appendFormat:", @"%ld.%ld.%ld.%ld", v5, v7, v9, v11);
  if ([v2 rangeOfString:@".html"] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v12 = ((int)random() % 26 + 97);
    uint64_t v13 = ((int)random() % 26 + 97);
    uint64_t v14 = ((int)random() % 26 + 97);
    v15 = objc_msgSend(NSString, "stringWithFormat:", @"%c%c%c%c", v12, v13, v14, ((int)random() % 26 + 97));
    [v3 appendString:@"/"];
    [v3 appendString:v15];
    [v3 appendString:@".html"];
  }

  return v3;
}

void sub_190D9E3EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190D9E818(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *CalXPCErrorTypeAsString(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1 == (id)MEMORY[0x1E4F14528])
  {
    uint64_t v6 = @"XPC_ERROR_CONNECTION_INVALID";
  }
  else if (v1 == (id)MEMORY[0x1E4F14520])
  {
    uint64_t v6 = @"XPC_ERROR_CONNECTION_INTERRUPTED";
  }
  else if (v1 == (id)MEMORY[0x1E4F14550])
  {
    uint64_t v6 = @"XPC_ERROR_TERMINATION_IMMINENT";
  }
  else if (v1 && (string = xpc_dictionary_get_string(v1, (const char *)*MEMORY[0x1E4F14530])) != 0)
  {
    uint64_t v4 = [NSString stringWithUTF8String:string];
    uint64_t v5 = v4;
    if (v4) {
      uint64_t v6 = v4;
    }
    else {
      uint64_t v6 = @"UNKNOWN";
    }
  }
  else
  {
    uint64_t v6 = @"UNKNOWN";
  }

  return v6;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_7(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

double EKAbsoluteTimeGetAbsoluteTimeInTimeZone(void *a1, void *a2, double a3)
{
  id v5 = a2;
  unint64_t GregorianDate = EKAbsoluteTimeGetGregorianDate(a1, a3);
  double AbsoluteTime = EKGregorianDateGetAbsoluteTime(GregorianDate, v7, v5);

  return AbsoluteTime;
}

uint64_t EKAbsoluteTimeGetGregorianDate(void *a1, double a2)
{
  if (a1) {
    [a1 secondsFromGMTForAbsoluteTime:a2];
  }
  else {
    double v3 = 0.0;
  }
  v5[0] = 0;
  v5[1] = 0;
  AbsoluteToYMDHMS((uint64_t)v5, v3 + a2);
  return v5[0];
}

double EKGregorianDateGetAbsoluteTime(unint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  double v6 = __EKAbsoluteFromYMD((int)a1, (int)(a1 >> 8) >> 24, (int)(a1 >> 16) >> 24);
  double v7 = v6;
  if (v5)
  {
    double v8 = v6 + -1.0;
    [v5 secondsFromGMTForAbsoluteTime:v6 + -1.0];
    double v10 = v9;
    double v11 = v7 - v9;
    [v5 secondsFromGMTForAbsoluteTime:v7 - v9];
    if (v10 >= v12)
    {
      double v14 = v12;
      [v5 secondsFromGMTForAbsoluteTime:v8];
      double v10 = v15;
    }
    else
    {
      [v5 secondsFromGMTForAbsoluteTime:v11 + -1.0];
      double v14 = v13;
    }
    double v7 = v11 + v10 - v14;
  }
  double v16 = (double)((uint64_t)a1 >> 56) * 60.0 + (double)((int)(a1 >> 24) >> 24) * 3600.0 + *(double *)&a2 + v7;
  if (v5)
  {
    double v17 = v7 + -1.0;
    [v5 nextDaylightSavingTimeTransitionAfterAbsoluteTime:v7 + -1.0];
    if (v16 > v18)
    {
      double v19 = v18;
      [v5 secondsFromGMTForAbsoluteTime:v17];
      double v21 = v20;
      [v5 secondsFromGMTForAbsoluteTime:v16];
      double v23 = v16 + v21 - v22;
      if (v23 >= v19) {
        double v16 = v23;
      }
    }
  }

  return v16;
}

double EKGregorianDateGetAbsoluteTimeWithCFTimeZone(unint64_t a1, uint64_t a2)
{
  uint64_t v4 = +[EKTimeZone timeZoneWithNSTimeZone:](EKTimeZone, "timeZoneWithNSTimeZone:");
  double AbsoluteTime = EKGregorianDateGetAbsoluteTime(a1, a2, v4);

  return AbsoluteTime;
}

double __EKAbsoluteFromYMD(unint64_t a1, int a2, int a3)
{
  if (a1 - 1801 > 0x12A)
  {
    signed int v7 = ((10923 * (a2 - 14)) >> 17) + ((10923 * (a2 - 14)) >> 31);
    unint64_t v8 = a1 + v7;
    uint64_t v9 = 1461 * v8 + 7012803;
    if ((uint64_t)(1461 * v8 + 7012800) >= 0) {
      uint64_t v9 = 1461 * v8 + 7012800;
    }
    uint64_t v10 = 715827883 * (367 * (a2 - 12 * v7) - 734);
    double v6 = (double)((v9 >> 2)
                + a3
                - 3 * ((uint64_t)(v8 + 4900) / 100) / 4
                + (int)((v10 >> 33) + ((unint64_t)v10 >> 63))
                - 32075);
    double v5 = -0.5;
  }
  else
  {
    int64_t v3 = 367 * a1
       + a3
       + 275 * a2 / 9
       - ((7 * (a1 + (int)(((10923 * (a2 + 9)) >> 17) + ((10923 * (a2 + 9)) >> 31)))) >> 2);
    if (a1 > 0x76C)
    {
      double v6 = (double)v3;
      double v5 = 1721013.5;
    }
    else
    {
      double v4 = -0.5;
      double v5 = 0.5;
      if ((double)(uint64_t)(100 * a1 + a2) + -190002.5 >= 0.0) {
        double v4 = 0.5;
      }
      double v6 = (double)v3 + 1721013.5 - v4;
    }
  }
  return (v6 + v5 + -2451910.5) * *(double *)&CalTimeInterval_OneDayInSeconds;
}

double EKGregorianComponentsGetAbsoluteTime(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  double v5 = __EKAbsoluteFromYMD([v4 year], (char)objc_msgSend(v4, "month"), (char)objc_msgSend(v4, "day"));
  double v6 = (double)[v4 hour];
  double v7 = (double)[v4 minute] * 60.0 + v6 * 3600.0;
  uint64_t v8 = [v4 second];

  double v9 = v5 + v7 + (double)v8;
  if (v3)
  {
    [v3 secondsFromGMTForAbsoluteTime:v9];
    [v3 secondsFromGMTForAbsoluteTime:v9 - v10];
    double v9 = v9 - v11;
  }

  return v9;
}

uint64_t AbsoluteToYMDHMS(uint64_t result, double a2)
{
  double v2 = a2 / *(double *)&CalTimeInterval_OneDayInSeconds + 2451910.5 + 0.5;
  double v3 = (double)(uint64_t)v2;
  uint64_t v4 = (uint64_t)((v3 + -1867216.25) / 36524.25);
  unint64_t v5 = v4 + 3;
  if (v4 >= 0) {
    unint64_t v5 = (uint64_t)((v3 + -1867216.25) / 36524.25);
  }
  uint64_t v6 = (uint64_t)v2 + v4 - (int)(v5 >> 2) + 1525;
  uint64_t v7 = (uint64_t)(((double)v6 + -122.1) / 365.25);
  double v8 = v2 - v3;
  uint64_t v9 = v6 - (uint64_t)((double)v7 * 365.25);
  uint64_t v10 = (uint64_t)((double)v9 / 30.6001);
  uint64_t v11 = -13;
  if (v10 < 14) {
    uint64_t v11 = -1;
  }
  uint64_t v12 = v11 + v10;
  if (v12 >= 3) {
    int v13 = -4716;
  }
  else {
    int v13 = -4715;
  }
  *(_DWORD *)Class result = v13 + v7;
  *(unsigned char *)(result + 4) = v12;
  *(unsigned char *)(result + 5) = (uint64_t)(v8 + (double)(v9 - (int)((double)(uint64_t)((double)v9 / 30.6001) * 30.6001)));
  _Q1 = vrndmq_f64(vdivq_f64((float64x2_t)vdupq_lane_s64(*(uint64_t *)&a2, 0), (float64x2_t)xmmword_190DEEFA0));
  _D4 = 0x404E000000000000;
  __asm { FMLS            D0, D4, V1.D[1] }
  *(int32x2_t *)&_Q1.f64[0] = vcvt_s32_f32(vcvt_f32_f64(vrndmq_f64(vmlsq_f64(_Q1, (float64x2_t)xmmword_190DEEFB0, vrndmq_f64(vdivq_f64(_Q1, (float64x2_t)xmmword_190DEEFB0))))));
  *(int32x2_t *)&_Q1.f64[0] = vadd_s32((int32x2_t)vand_s8((int8x8_t)vcltz_s32(*(int32x2_t *)&_Q1.f64[0]), (int8x8_t)0x3C00000018), *(int32x2_t *)&_Q1.f64[0]);
  *(unsigned char *)(result + 7) = BYTE4(_Q1.f64[0]);
  *(unsigned char *)(result + 6) = LOBYTE(_Q1.f64[0]);
  if (_D0 < 0.0) {
    _D0 = _D0 + 60.0;
  }
  if (_D0 == 0.0) {
    _D0 = 0.0;
  }
  *(double *)(result + 8) = _D0;
  return result;
}

uint64_t EKAbsoluteTimeGetDayOfWeek(void *a1, double a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (v3) {
    [v3 secondsFromGMTForAbsoluteTime:a2];
  }
  else {
    double v5 = 0.0;
  }
  uint64_t v6 = vcvtmd_s64_f64((v5 + a2) / *(double *)&CalTimeInterval_OneDayInSeconds);
  uint64_t v7 = ((unint64_t)~v6 * (unsigned __int128)0x2492492492492493uLL) >> 64;
  uint64_t v8 = (~v6 - 7 * ((v7 + ((unint64_t)(~v6 - v7) >> 1)) >> 2)) ^ 7;
  if (v6 >= 0) {
    unint64_t v9 = v6 % 7uLL + 1;
  }
  else {
    LODWORD(v9) = v8;
  }
  if (v9 <= 6) {
    uint64_t v10 = (v9 + 1);
  }
  else {
    uint64_t v10 = 1;
  }

  return v10;
}

uint64_t EKAbsoluteTimeGetDayOfYear(void *a1, double a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (v3) {
    [v3 secondsFromGMTForAbsoluteTime:a2];
  }
  else {
    double v5 = 0.0;
  }
  v11[0] = 0;
  v11[1] = 0;
  AbsoluteToYMDHMS((uint64_t)v11, (double)(uint64_t)(v5 + a2));
  BOOL v6 = 0;
  if ((v11[0] & 3) == 0)
  {
    HIDWORD(v7) = -1030792151 * LODWORD(v11[0]) + 85899344;
    LODWORD(v7) = HIDWORD(v7);
    if ((v7 >> 2) <= 0x28F5C28)
    {
      HIDWORD(v8) = -1030792151 * LODWORD(v11[0]) + 85899344;
      LODWORD(v8) = HIDWORD(v8);
      BOOL v6 = (v8 >> 4) < 0xA3D70B;
    }
    else
    {
      BOOL v6 = 1;
    }
  }
  uint64_t v9 = SBYTE5(v11[0]) + daysBeforeMonth[16 * v6 + SBYTE4(v11[0])];

  return v9;
}

uint64_t EKAbsoluteTimeGetWeekOfYear(void *a1, double a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (v3) {
    [v3 secondsFromGMTForAbsoluteTime:a2];
  }
  else {
    double v5 = 0.0;
  }
  v20[0] = 0;
  v20[1] = 0;
  AbsoluteToYMDHMS((uint64_t)v20, (double)(uint64_t)floor((v5 + a2) / *(double *)&CalTimeInterval_OneDayInSeconds));
  uint64_t v6 = SLODWORD(v20[0]);
  double v7 = __EKAbsoluteFromYMD(SLODWORD(v20[0]), 1, 1);
  *(float *)&double v7 = floor(v7 - floor(v7 / 7.0) * 7.0);
  int v8 = (((int)*(float *)&v7 >> 31) & 7) + (int)*(float *)&v7;
  uint64_t v9 = SBYTE4(v20[0]);
  unsigned int v10 = SBYTE5(v20[0]);
  if (SBYTE4(v20[0]) == 1 && SBYTE5(v20[0]) <= 3)
  {
    if (v8 == 4 || SBYTE5(v20[0]) <= 2 && v8 == 5 || SBYTE5(v20[0]) < 2 && v8 == 6)
    {
      uint64_t v11 = 53;
      goto LABEL_24;
    }
  }
  else if (SBYTE4(v20[0]) == 12 && SBYTE5(v20[0]) >= 29)
  {
    uint64_t v11 = 1;
    double v12 = __EKAbsoluteFromYMD(v6 + 1, 1, 1);
    float v13 = floor(v12 - floor(v12 / 7.0) * 7.0);
    int v14 = ((int)v13 >> 31) & 7;
    if ((int)v13 + v14 == 3 || v10 >= 0x1E && (int)v13 + v14 == 2) {
      goto LABEL_24;
    }
    if (v10 >= 0x1F && (int)v13 + v14 == 1) {
      goto LABEL_24;
    }
  }
  HIDWORD(v16) = -1030792151 * v6 + 85899344;
  LODWORD(v16) = HIDWORD(v16);
  unsigned int v15 = v16 >> 2;
  LODWORD(v16) = HIDWORD(v16);
  BOOL v17 = (v16 >> 4) < 0xA3D70B;
  if (v15 > 0x28F5C28) {
    BOOL v17 = 1;
  }
  if ((v6 & 3) != 0) {
    BOOL v17 = 0;
  }
  int v18 = (unint64_t)(2454267027 * (int)(v8 - 10 + v10 + daysBeforeMonth[16 * v17 + v9] - 7 * ((v8 - 10) / 7) + 2)) >> 32;
  uint64_t v11 = (v18 >> 2) + (v18 >> 31) + 1;
LABEL_24:

  return v11;
}

uint64_t EKAbsoluteTimeGetGregorianDateForWeekStart(void *a1, uint64_t a2, void *a3, double a4)
{
  id v7 = a1;
  uint64_t v8 = EKAbsoluteTimeGetDayOfWeek(v7, a4) - 1;
  int v9 = 7;
  if (a2 - 1 <= v8) {
    int v9 = 0;
  }
  int v10 = v8 - a2 + v9 + 1;
  if (a3) {
    *a3 = v10;
  }
  uint64_t v16 = 0;
  int v15 = 0;
  int v17 = 0;
  *(void *)&long long v14 = 0;
  *((void *)&v14 + 1) = -v10;
  double v11 = EKAbsoluteTimeAddGregorianDuration(v7, &v14, a4);
  uint64_t GregorianDate = EKAbsoluteTimeGetGregorianDate(v7, v11);

  return GregorianDate & 0xFFFFFFFFFFFFLL;
}

double EKAbsoluteTimeAddGregorianDuration(void *a1, _OWORD *a2, double a3)
{
  id v5 = a1;
  unint64_t GregorianDate = EKAbsoluteTimeGetGregorianDate(v5, a3);
  long long v7 = a2[1];
  *(_OWORD *)&v22.years = *a2;
  *(_OWORD *)&v22.minutes = v7;
  unint64_t v9 = EKAddGregorianUnits(GregorianDate, v8, (double *)&v22.years);
  double v11 = *(double *)&v10;
  double AbsoluteTime = EKGregorianDateGetAbsoluteTime(v9, v10, v5);
  long long v13 = a2[1];
  *(_OWORD *)&v22.years = *a2;
  *(_OWORD *)&v22.minutes = v13;
  double v14 = CFAbsoluteTimeAddGregorianUnits(0.0, 0, &v22);
  if (v14 < 0.0)
  {
    double v15 = v14 + a3;
    [v5 nextDaylightSavingTimeTransitionAfterAbsoluteTime:v14 + a3];
    if (v16 <= a3 && v16 > v15)
    {
      unint64_t v18 = EKAbsoluteTimeGetGregorianDate(v5, AbsoluteTime);
      double v20 = v19
          - v11
          + (float)((float)(((int)(v18 >> 24) >> 24) - ((int)(v9 >> 24) >> 24)) * 3600.0)
          + (double)((SHIDWORD(v18) >> 24) - (SHIDWORD(v9) >> 24)) * 60.0;
      if (v20 <= 0.1) {
        double v20 = 0.0;
      }
      double AbsoluteTime = AbsoluteTime - v20;
    }
  }

  return AbsoluteTime;
}

unint64_t EKAddGregorianUnits(unint64_t a1, uint64_t a2, double *a3)
{
  int v3 = *((_DWORD *)a3 + 3) + ((int)(a1 >> 24) >> 24);
  uint64_t v4 = *((_DWORD *)a3 + 4) + ((uint64_t)a1 >> 56);
  double v5 = a3[3] + *(double *)&a2;
  if (v5 > 59.0 || v5 < 0.0) {
    uint64_t v4 = ((int)v5 / 60 + v4);
  }
  int v6 = (int)(a1 >> 16) >> 24;
  if (v4 >= 0x3C)
  {
    v3 += (int)v4 / 60;
    uint64_t v4 = ((int)v4 % 60);
  }
  int v7 = *((_DWORD *)a3 + 1) + ((int)(a1 >> 8) >> 24);
  if (v3 >= 0x18)
  {
    *((_DWORD *)a3 + 2) += v3 / 24;
    v3 %= 24;
    v6 += v3 >> 31;
    if (v3 < 0) {
      LOBYTE(v3) = v3 + 24;
    }
  }
  int v8 = *(_DWORD *)a3;
  if (v7 < 13)
  {
    unsigned int v11 = v8 + a1;
  }
  else
  {
    if (v7 >= 24) {
      int v9 = 24;
    }
    else {
      int v9 = v7;
    }
    unsigned int v10 = (v7 - v9 + 11) / 0xCu;
    int v7 = v7 - 12 * v10 - 12;
    unsigned int v11 = v8 + a1 + v10 + 1;
  }
  if (v7 <= 0)
  {
    if (v7 <= -11) {
      int v12 = -11;
    }
    else {
      int v12 = v7;
    }
    if (v7 >= -11) {
      int v13 = v7;
    }
    else {
      int v13 = v7 + 1;
    }
    unsigned int v14 = (v12 - v13) / 0xCu;
    if (v7 < -11) {
      ++v14;
    }
    v7 += 12 * v14 + 12;
    v11 += ~v14;
  }
  if ((v11 & 3) != 0)
  {
    BOOL v15 = 0;
  }
  else
  {
    HIDWORD(v16) = -1030792151 * v11 + 85899344;
    LODWORD(v16) = HIDWORD(v16);
    if ((v16 >> 2) <= 0x28F5C28)
    {
      HIDWORD(v17) = -1030792151 * v11 + 85899344;
      LODWORD(v17) = HIDWORD(v17);
      BOOL v15 = (v17 >> 4) < 0xA3D70B;
    }
    else
    {
      BOOL v15 = 1;
    }
  }
  int v18 = daysInMonth[16 * v15 + v7];
  if (v6 >= v18) {
    int v6 = v18;
  }
  for (i = v6 + *((_DWORD *)a3 + 2); i > v18; int v18 = daysInMonth[16 * v20 + v7])
  {
    if (v7 <= 11)
    {
      ++v7;
    }
    else
    {
      ++v11;
      int v7 = 1;
    }
    if ((v11 & 3) != 0)
    {
      BOOL v20 = 0;
    }
    else
    {
      HIDWORD(v22) = 85899344 - 1030792151 * v11;
      LODWORD(v22) = HIDWORD(v22);
      unsigned int v21 = v22 >> 2;
      LODWORD(v22) = HIDWORD(v22);
      BOOL v20 = (v22 >> 4) < 0xA3D70B;
      if (v21 > 0x28F5C28) {
        BOOL v20 = 1;
      }
    }
    i -= v18;
  }
  if (i <= 0)
  {
    do
    {
      int v23 = v7 < 2;
      if (v7 >= 2) {
        --v7;
      }
      else {
        int v7 = 12;
      }
      v11 -= v23;
      if ((v11 & 3) != 0)
      {
        BOOL v24 = 0;
      }
      else
      {
        HIDWORD(v26) = 85899344 - 1030792151 * v11;
        LODWORD(v26) = HIDWORD(v26);
        unsigned int v25 = v26 >> 2;
        LODWORD(v26) = HIDWORD(v26);
        BOOL v24 = (v26 >> 4) < 0xA3D70B;
        if (v25 > 0x28F5C28) {
          BOOL v24 = 1;
        }
      }
      i += daysInMonth[16 * v24 + v7];
    }
    while (i < 1);
  }
  return (v4 << 56) | ((unint64_t)v3 << 48) | ((unint64_t)i << 40) | ((unint64_t)v7 << 32) | v11;
}

double EKAbsoluteTimeAddGregorianUnits(void *a1, uint64_t a2, double a3)
{
  id v5 = a1;
  unint64_t GregorianDate = EKAbsoluteTimeGetGregorianDate(v5, a3);
  unsigned int v8 = *(_DWORD *)a2 + GregorianDate;
  int v9 = *(_DWORD *)(a2 + 4) + ((int)(GregorianDate >> 8) >> 24);
  if (v9 >= 13)
  {
    if (v9 >= 24) {
      int v10 = 24;
    }
    else {
      int v10 = *(_DWORD *)(a2 + 4) + ((int)(GregorianDate >> 8) >> 24);
    }
    unsigned int v11 = (v9 - v10 + 11) / 0xCu;
    int v9 = v9 - 12 * v11 - 12;
    v8 += v11 + 1;
  }
  if (v9 <= 0)
  {
    if (v9 <= -11) {
      int v12 = -11;
    }
    else {
      int v12 = v9;
    }
    if (v9 >= -11) {
      int v13 = v9;
    }
    else {
      int v13 = v9 + 1;
    }
    unsigned int v14 = (v12 - v13) / 0xCu;
    if (v9 < -11) {
      ++v14;
    }
    v9 += 12 * v14 + 12;
    v8 += ~v14;
  }
  int v15 = (int)(GregorianDate >> 16) >> 24;
  if ((v8 & 3) != 0)
  {
    BOOL v16 = 0;
  }
  else
  {
    HIDWORD(v17) = -1030792151 * v8 + 85899344;
    LODWORD(v17) = HIDWORD(v17);
    if ((v17 >> 2) <= 0x28F5C28)
    {
      HIDWORD(v18) = -1030792151 * v8 + 85899344;
      LODWORD(v18) = HIDWORD(v18);
      BOOL v16 = (v18 >> 4) < 0xA3D70B;
    }
    else
    {
      BOOL v16 = 1;
    }
  }
  int v19 = daysInMonth[16 * v16 + v9];
  if (v15 >= v19) {
    int v15 = v19;
  }
  for (i = v15 + *(_DWORD *)(a2 + 8); i > v19; int v19 = daysInMonth[16 * v21 + v9])
  {
    if (v9 <= 11)
    {
      ++v9;
    }
    else
    {
      ++v8;
      int v9 = 1;
    }
    if ((v8 & 3) != 0)
    {
      BOOL v21 = 0;
    }
    else
    {
      HIDWORD(v23) = 85899344 - 1030792151 * v8;
      LODWORD(v23) = HIDWORD(v23);
      unsigned int v22 = v23 >> 2;
      LODWORD(v23) = HIDWORD(v23);
      BOOL v21 = (v23 >> 4) < 0xA3D70B;
      if (v22 > 0x28F5C28) {
        BOOL v21 = 1;
      }
    }
    i -= v19;
  }
  if (i <= 0)
  {
    do
    {
      int v24 = v9 < 2;
      if (v9 >= 2) {
        --v9;
      }
      else {
        int v9 = 12;
      }
      v8 -= v24;
      if ((v8 & 3) != 0)
      {
        BOOL v25 = 0;
      }
      else
      {
        HIDWORD(v27) = 85899344 - 1030792151 * v8;
        LODWORD(v27) = HIDWORD(v27);
        unsigned int v26 = v27 >> 2;
        LODWORD(v27) = HIDWORD(v27);
        BOOL v25 = (v27 >> 4) < 0xA3D70B;
        if (v26 > 0x28F5C28) {
          BOOL v25 = 1;
        }
      }
      i += daysInMonth[16 * v25 + v9];
    }
    while (i < 1);
  }
  double v28 = *(double *)(a2 + 24)
      + EKGregorianDateGetAbsoluteTime(GregorianDate & 0xFFFF000000000000 | ((unint64_t)i << 40) | ((unint64_t)v9 << 32) | v8, v7, v5)+ (double)*(int *)(a2 + 12) * 3600.0+ (double)*(int *)(a2 + 16) * 60.0;

  return v28;
}

void EKAbsoluteTimeGetDifferenceAsGregorianUnits(void *a1@<X0>, int a2@<W1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  id v9 = a1;
  uint64_t v10 = 0;
  if (a5 < a4) {
    int v11 = 1;
  }
  else {
    int v11 = -1;
  }
  *(_OWORD *)a3 = 0uLL;
  *(_OWORD *)(a3 + 16) = 0uLL;
  double v12 = a5;
  id v18 = v9;
  do
  {
    if (((1 << v10) & a2) != 0)
    {
      int v13 = (int)((a4 - v12) / (double)dword_190DEF020[v10]);
      *(_DWORD *)(a3 + 4 * v10) = -3 * v11 + v13;
      do
      {
        double v14 = v12;
        *(_DWORD *)(a3 + 4 * v10) = -2 * v11 + v13;
        long long v15 = *(_OWORD *)(a3 + 16);
        v19[0] = *(_OWORD *)a3;
        v19[1] = v15;
        double v12 = EKAbsoluteTimeAddGregorianUnits(v18, (uint64_t)v19, a5);
        id v9 = v18;
        BOOL v16 = v12 <= a4;
        if (a5 >= a4) {
          BOOL v16 = v12 >= a4;
        }
        v13 += v11;
      }
      while (v16);
      *(_DWORD *)(a3 + 4 * v10) = -4 * v11 + v13;
      double v12 = v14;
    }
    ++v10;
  }
  while (v10 != 5);
  if ((a2 & 0x20) == 0 || (double v17 = a4 - v12, *(double *)(a3 + 24) = v17, v17 == 0.0)) {
    *(void *)(a3 + 24) = 0;
  }
}

id EKCachedTimeZoneWithName(void *a1)
{
  id v1 = a1;
  if (EKCachedTimeZoneWithName_onceToken != -1) {
    dispatch_once(&EKCachedTimeZoneWithName_onceToken, &__block_literal_global_6);
  }
  uint64_t v2 = [(id)EKCachedTimeZoneWithName_timeZoneCache objectForKey:v1];
  if (v2)
  {
    int v3 = (void *)v2;
    uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
    int v5 = [v4 isEqual:v3];

    if (!v5) {
      goto LABEL_10;
    }

    goto LABEL_6;
  }
  int v3 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v1];
  if (!v3)
  {
    int v3 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:v1];
    if (!v3)
    {
      uint64_t v7 = (void *)EKCachedTimeZoneWithName_timeZoneCache;
      unsigned int v8 = [MEMORY[0x1E4F1CA98] null];
      [v7 setObject:v8 forKey:v1];

LABEL_6:
      int v3 = 0;
      goto LABEL_10;
    }
  }
  [(id)EKCachedTimeZoneWithName_timeZoneCache setObject:v3 forKey:v1];
LABEL_10:

  return v3;
}

uint64_t __EKCachedTimeZoneWithName_block_invoke()
{
  EKCachedTimeZoneWithName_timeZoneCache = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

id EKDateComponentsGetDate(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3032000000;
  double v17 = __Block_byref_object_copy__2;
  id v18 = __Block_byref_object_dispose__2;
  id v19 = 0;
  int v5 = _EKSharedGregorianCalendarLock();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __EKDateComponentsGetDate_block_invoke;
  block[3] = &unk_1E56CDAE0;
  id v12 = v4;
  int v13 = &v14;
  id v11 = v3;
  id v6 = v4;
  id v7 = v3;
  dispatch_sync(v5, block);

  id v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __EKDateComponentsGetDate_block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    _EKSharedGregorianCalendarForTimeZone(*(void **)(a1 + 40));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = [v5 dateFromComponents:*(void *)(a1 + 32)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

void sub_190DA1F1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_190DA2884(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v4 = objc_begin_catch(exception_object);
    id v5 = [v3 logHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[CalSubscribedCalendarExternalRepresentation dictionaryWithExternalRepresentationData:]((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
    }

    objc_end_catch();
    if (!v2) {
      JUMPOUT(0x190DA2824);
    }
    JUMPOUT(0x190DA2838);
  }
  _Unwind_Resume(exception_object);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_190DA651C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return v0;
}

void sub_190DA7610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *CalRedactURLString(void *a1)
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = v1;
  if (!v1)
  {
    uint64_t v3 = 0;
    goto LABEL_109;
  }
  if ([v1 hasPrefix:@"tel:"])
  {
    uint64_t v3 = @"tel:<private>";
    goto LABEL_109;
  }
  if ([v2 hasPrefix:@"mailto:"])
  {
    uint64_t v3 = @"mailto:<private>";
    goto LABEL_109;
  }
  unint64_t v4 = 0x1E4F28000uLL;
  v61 = v2;
  if ([v2 hasPrefix:@"urn:"])
  {
    id v5 = v2;
    uint64_t v3 = (__CFString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    uint64_t v6 = [v5 componentsSeparatedByString:@":"];
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v72 objects:v78 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v73;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v73 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v72 + 1) + 8 * v10);
          if (([v11 isEqualToString:@"urn"] & 1) != 0
            || ([v11 isEqualToString:@"x-uid"] & 1) != 0
            || [v11 isEqualToString:@"uuid"])
          {
            id v12 = v11;
          }
          else
          {
            uuidWithUnknownExtensionsRedacted(v11);
            id v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          if (v12) {
            int v13 = v12;
          }
          else {
            int v13 = @"<private>";
          }
          [(__CFString *)v3 appendString:v13];
          [(__CFString *)v3 appendString:@":"];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v14 = [v6 countByEnumeratingWithState:&v72 objects:v78 count:16];
        uint64_t v8 = v14;
      }
      while (v14);
    }
    if ([(__CFString *)v3 length]) {
      -[__CFString deleteCharactersInRange:](v3, "deleteCharactersInRange:", [(__CFString *)v3 length] - 1, 1);
    }

    goto LABEL_108;
  }
  long long v15 = [v2 componentsSeparatedByString:@"/"];
  id v16 = [v15 lastObject];
  if (getPublicURLParts_onceToken != -1) {
    dispatch_once(&getPublicURLParts_onceToken, &__block_literal_global_11);
  }
  id v67 = (id)getPublicURLParts_publicURLParts;
  uint64_t v3 = (__CFString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v17 = v15;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v68 objects:v76 count:16];
  if (!v18)
  {

    v34 = 0;
LABEL_51:
    if ([(__CFString *)v3 length]) {
      -[__CFString deleteCharactersInRange:](v3, "deleteCharactersInRange:", [(__CFString *)v3 length] - 1, 1);
    }
    if (!v34) {
      goto LABEL_107;
    }
    goto LABEL_54;
  }
  uint64_t v19 = v18;
  v63 = 0;
  BOOL v20 = 0;
  uint64_t v21 = *(void *)v69;
  do
  {
    unsigned int v22 = v17;
    uint64_t v23 = 0;
    BOOL v24 = v20;
    do
    {
      if (*(void *)v69 != v21) {
        objc_enumerationMutation(v22);
      }
      id v25 = *(id *)(*((void *)&v68 + 1) + 8 * v23);
      if (v16 == v25)
      {
        uint64_t v27 = [v16 rangeOfString:@"?"];
        if (v27 == 0x7FFFFFFFFFFFFFFFLL)
        {
          unsigned int v26 = v16;
        }
        else
        {
          uint64_t v28 = v27;
          uint64_t v29 = [v16 substringFromIndex:v27 + 1];

          unsigned int v26 = [v16 substringToIndex:v28];

          v63 = (void *)v29;
        }
      }
      else
      {
        unsigned int v26 = v25;
      }
      v30 = [v26 lowercaseString];
      int v31 = [v67 containsObject:v30];

      if (v31)
      {
        id v32 = v26;
      }
      else
      {
        uuidWithUnknownExtensionsRedacted(v26);
        id v32 = (id)objc_claimAutoreleasedReturnValue();
      }
      v33 = v32;
      BOOL v20 = v32 == 0;
      if (v32)
      {
        if (v24) {
          [(__CFString *)v3 appendString:@"<private>/"];
        }
        [(__CFString *)v3 appendFormat:@"%@/", v33];
      }

      ++v23;
      BOOL v24 = v20;
    }
    while (v19 != v23);
    id v17 = v22;
    uint64_t v19 = [v22 countByEnumeratingWithState:&v68 objects:v76 count:16];
  }
  while (v19);

  if (v33)
  {
    v34 = v63;
    unint64_t v4 = 0x1E4F28000;
    goto LABEL_51;
  }
  [(__CFString *)v3 appendString:@"<private>"];
  v34 = v63;
  unint64_t v4 = 0x1E4F28000;
  if (!v63) {
    goto LABEL_107;
  }
LABEL_54:
  id v35 = v34;
  v36 = objc_msgSend(objc_alloc(*(Class *)(v4 + 3704)), "initWithCapacity:", objc_msgSend(v35, "length"));
  v37 = [v35 componentsSeparatedByString:@"&"];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id obj = v37;
  uint64_t v38 = [v37 countByEnumeratingWithState:&v72 objects:v78 count:16];
  if (!v38)
  {
LABEL_101:
    if ([v36 length]) {
      objc_msgSend(v36, "deleteCharactersInRange:", objc_msgSend(v36, "length") - 1, 1);
    }
    goto LABEL_106;
  }
  uint64_t v39 = v38;
  v64 = v34;
  v65 = v36;
  id v60 = v17;
  BOOL v40 = 0;
  uint64_t v66 = *(void *)v73;
  do
  {
    uint64_t v41 = 0;
    BOOL v42 = v40;
    do
    {
      if (*(void *)v73 != v66) {
        objc_enumerationMutation(obj);
      }
      v43 = *(void **)(*((void *)&v72 + 1) + 8 * v41);
      v44 = [v43 lowercaseString];
      if ([v44 isEqualToString:@"action=split"]) {
        v45 = v43;
      }
      else {
        v45 = 0;
      }
      if (![v44 hasPrefix:@"rid="]) {
        goto LABEL_89;
      }
      unint64_t v46 = [v44 length];
      if (v46 > 0x14 || ((1 << v46) & 0x181000) == 0)
      {
LABEL_87:
        [NSString stringWithFormat:@"rid=<malformed date or not-a-date, %lu characters>", objc_msgSend(v43, "length") - 4];
        v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_88;
      }
      unint64_t v48 = v46 - 4;
      objc_msgSend(v44, "getCharacters:range:", v77, 4, v46 - 4);
      unint64_t v49 = 0;
      v77[v48] = 0;
      BOOL v50 = 1;
      while (1)
      {
        int v51 = (unsigned __int16)v77[v49];
        if ((v51 - 48) < 0xA) {
          goto LABEL_74;
        }
        if (v49 != 15) {
          break;
        }
        if (v51 != 122)
        {
LABEL_76:
          if (v77[v49]) {
            goto LABEL_87;
          }
LABEL_77:
          BOOL v52 = 1;
          if (!v50) {
            goto LABEL_87;
          }
          goto LABEL_78;
        }
LABEL_74:
        BOOL v50 = v49++ < 0x10;
        if (v49 == 17) {
          goto LABEL_77;
        }
      }
      if (v49 == 8)
      {
        if (v51 != 116) {
          goto LABEL_76;
        }
        goto LABEL_74;
      }
      BOOL v52 = v49 == 16 && v51 == 0;
      if (!v50) {
        goto LABEL_87;
      }
LABEL_78:
      if (!v52) {
        goto LABEL_87;
      }
      v53 = v43;
LABEL_88:
      v55 = v53;

      v45 = v55;
LABEL_89:
      if ([v44 hasPrefix:@"uid="])
      {
        v56 = [v43 substringFromIndex:4];
        v57 = uuidWithUnknownExtensionsRedacted(v56);

        if (v57)
        {
          [NSString stringWithFormat:@"uid=%@", v57];
          v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v58 = @"uid=<private>";
        }

        v45 = v58;
      }
      BOOL v40 = v45 == 0;
      if (v45)
      {
        if (v42) {
          [v65 appendString:@"<private>&"];
        }
        [v65 appendFormat:@"%@&", v45];
      }

      ++v41;
      BOOL v42 = v45 == 0;
    }
    while (v41 != v39);
    uint64_t v39 = [obj countByEnumeratingWithState:&v72 objects:v78 count:16];
  }
  while (v39);
  id v17 = v60;
  v34 = v64;
  v36 = v65;
  if (v45) {
    goto LABEL_101;
  }
  [v65 appendString:@"<private>"];
LABEL_106:

  [(__CFString *)v3 appendFormat:@"?%@", v36];
LABEL_107:

LABEL_108:
  uint64_t v2 = v61;
LABEL_109:

  return v3;
}

id uuidWithUnknownExtensionsRedacted(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [v1 componentsSeparatedByString:@"."];
  uint64_t v3 = [v2 count];
  if ((unint64_t)(v3 - 3) < 0xFFFFFFFFFFFFFFFELL)
  {
    unint64_t v4 = 0;
    goto LABEL_28;
  }
  if (v3 != 2)
  {
    uint64_t v6 = 0;
LABEL_8:
    BOOL v7 = 0;
    goto LABEL_9;
  }
  id v5 = [v2 objectAtIndexedSubscript:1];
  uint64_t v6 = v5;
  if (!v5 || ![v5 compare:@"xml" options:1]) {
    goto LABEL_8;
  }
  BOOL v7 = [v6 compare:@"ics" options:1] != 0;
LABEL_9:
  uint64_t v8 = [v2 objectAtIndexedSubscript:0];
  uint64_t v9 = [v8 length];
  unint64_t v4 = 0;
  if ((unint64_t)(v9 - 71) >= 0xFFFFFFFFFFFFFFD9)
  {
    uint64_t v10 = v9;
    [v8 getCharacters:v17];
    uint64_t v11 = 0;
    do
    {
      int v12 = (unsigned __int16)v17[v11];
      if (((v12 - 65) > 0x25 || ((1 << (v12 - 65)) & 0x3F0000003FLL) == 0)
        && v12 != 45
        && (v12 - 48) > 9)
      {
        unint64_t v4 = 0;
        goto LABEL_27;
      }
      ++v11;
    }
    while (v10 != v11);
    if (v7)
    {
      id v15 = [NSString stringWithFormat:@"%@.<private>", v8];
    }
    else
    {
      id v15 = v1;
    }
    unint64_t v4 = v15;
  }
LABEL_27:

LABEL_28:

  return v4;
}

uint64_t __getPublicURLParts_block_invoke()
{
  getPublicURLParts_publicURLParts = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EE0D4570];

  return MEMORY[0x1F41817F8]();
}

BOOL UnzipArchive(void *a1, void *a2)
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = a1;
  BOMCopierNew();
  id v5 = v4;
  [v5 fileSystemRepresentation];

  id v6 = v3;
  [v6 fileSystemRepresentation];

  uint64_t v7 = *MEMORY[0x1E4F1CFD0];
  v10[0] = @"extractPKZip";
  v10[1] = @"sequesterResources";
  v11[0] = v7;
  v11[1] = v7;
  v10[2] = @"copyResources";
  void v11[2] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  LODWORD(v5) = BOMCopierCopyWithOptions();
  BOMCopierFree();

  return v5 == 0;
}

id CalTemporaryDirectory()
{
  uint64_t v0 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v1 = [v0 CalTemporaryDirectoryAppropriateForURL:0];
  uint64_t v2 = [v1 path];

  return v2;
}

void fatalBomError(uint64_t a1, uint64_t a2)
{
  id v2 = [NSString stringWithUTF8String:a2];
  NSLog(&cfstr_CouldnTCreateA.isa, v2);
}

void fatalBomFileError(uint64_t a1, uint64_t a2)
{
  objc_msgSend(NSString, "stringWithUTF8String:", "void fatalBomFileError(BOMCopier, const char *, int)");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [NSString stringWithUTF8String:a2];
  id v4 = NSString;
  id v5 = __error();
  id v6 = [v4 stringWithUTF8String:strerror(*v5)];
  NSLog(&cfstr_CouldnTCreateA_0.isa, v7, v3, v6);
}

id GetStaticAutoUpdatingCurrentLocale()
{
  if (GetStaticAutoUpdatingCurrentLocale_onceToken != -1) {
    dispatch_once(&GetStaticAutoUpdatingCurrentLocale_onceToken, &__block_literal_global_12);
  }
  uint64_t v0 = (void *)GetStaticAutoUpdatingCurrentLocale_sLocale;

  return v0;
}

uint64_t __GetStaticAutoUpdatingCurrentLocale_block_invoke()
{
  GetStaticAutoUpdatingCurrentLocale_sLocale = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];

  return MEMORY[0x1F41817F8]();
}

uint64_t CurrentLocaleExpectsSurnameFirst()
{
  if (CurrentLocaleExpectsSurnameFirst_onceToken != -1) {
    dispatch_once(&CurrentLocaleExpectsSurnameFirst_onceToken, &__block_literal_global_2_0);
  }
  uint64_t v0 = (void *)CurrentLocaleExpectsSurnameFirst_sSurnameFirstCountries;
  id v1 = GetStaticAutoUpdatingCurrentLocale();
  id v2 = [v1 objectForKey:*MEMORY[0x1E4F1C400]];
  uint64_t v3 = [v0 containsObject:v2];

  return v3;
}

uint64_t __CurrentLocaleExpectsSurnameFirst_block_invoke()
{
  CurrentLocaleExpectsSurnameFirst_sSurnameFirstCountries = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"CN", @"JP", @"KP", @"KR", @"VN", @"HU", 0);

  return MEMORY[0x1F41817F8]();
}

uint64_t CurrentLocaleExpectsMultipleFamilyNames()
{
  if (!CurrentLocaleExpectsMultipleFamilyNames_sMultipleFamilyNameLanguages)
  {
    uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"ca", @"es", 0);
    id v1 = (void *)CurrentLocaleExpectsMultipleFamilyNames_sMultipleFamilyNameLanguages;
    CurrentLocaleExpectsMultipleFamilyNames_sMultipleFamilyNameLanguages = v0;
  }
  if (CurrentLocaleExpectsSurnameFirst()) {
    return 0;
  }
  uint64_t v3 = (void *)CurrentLocaleExpectsMultipleFamilyNames_sMultipleFamilyNameLanguages;
  id v4 = GetStaticAutoUpdatingCurrentLocale();
  id v5 = [v4 objectForKey:*MEMORY[0x1E4F1C438]];
  uint64_t v6 = [v3 containsObject:v5];

  return v6;
}

id DisplayNameStringForIdentityWithProperties(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 length] && objc_msgSend(v4, "length"))
  {
    if (CurrentLocaleExpectsSurnameFirst()) {
      [NSString stringWithFormat:@"%@ %@", v4, v3];
    }
    else {
    id v6 = [NSString stringWithFormat:@"%@ %@", v3, v4];
    }
  }
  else if ([v3 length] && !objc_msgSend(v4, "length"))
  {
    id v6 = v3;
  }
  else
  {
    if (![v4 length] || objc_msgSend(v3, "length"))
    {
      id v5 = 0;
      goto LABEL_15;
    }
    id v6 = v4;
  }
  id v5 = v6;
LABEL_15:

  return v5;
}

void sub_190DAC510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_190DACB38(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, int a11)
{
  if (v11) {
    objc_end_catch();
  }
  _Unwind_Resume(exception_object);
}

BOOL __canFetchPersonas_block_invoke()
{
  BOOL result = +[CalEntitlementsVerifier currentProcessHasBooleanEntitlement:@"com.apple.usermanagerd.persona.fetch"];
  canFetchPersonas_canFetchPersonas = result;
  return result;
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_190DAD088(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190DAD200(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190DAD344(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _acquireArrayFromDictionary(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = *a1;
  if (!*a1)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    id v6 = *a1;
    *a1 = (id)v5;

    id v4 = *a1;
  }
  id v7 = [v4 objectForKeyedSubscript:v3];
  if (!v7)
  {
    id v7 = [MEMORY[0x1E4F1CA48] array];
    [*a1 setObject:v7 forKeyedSubscript:v3];
  }

  return v7;
}

id _acquireSetFromDictionary(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = *a1;
  if (!*a1)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    id v6 = *a1;
    *a1 = (id)v5;

    id v4 = *a1;
  }
  id v7 = [v4 objectForKeyedSubscript:v3];
  if (!v7)
  {
    id v7 = [MEMORY[0x1E4F1CA80] set];
    [*a1 setObject:v7 forKeyedSubscript:v3];
  }

  return v7;
}

id _acquireArrayFromTable(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = *a1;
  if (!*a1)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    id v6 = *a1;
    *a1 = (id)v5;

    id v4 = *a1;
  }
  id v7 = [v4 objectForKey:v3];
  if (!v7)
  {
    id v7 = [MEMORY[0x1E4F1CA48] array];
    [*a1 setObject:v7 forKey:v3];
  }

  return v7;
}

void sub_190DADF88(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190DAE0B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_190DAE208(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190DAE48C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void CalAnalyticsSendEvent(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [@"com.apple.calendar." stringByAppendingString:a1];
  AnalyticsSendEvent();
}

uint64_t CalAnalyticsSendEventLazy(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [@"com.apple.calendar." stringByAppendingString:a1];
  uint64_t v8 = v3;
  id v5 = v3;
  uint64_t v6 = AnalyticsSendEventLazy();

  return v6;
}

id __CalAnalyticsSendEventLazy_block_invoke(uint64_t a1)
{
  id v2 = objc_opt_new();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v2);
  }

  return v2;
}

uint64_t CalAnalyticsIsEventUsed(uint64_t a1)
{
  id v1 = [@"com.apple.calendar." stringByAppendingString:a1];
  uint64_t IsEventUsed = AnalyticsIsEventUsed();

  return IsEventUsed;
}

double CalAnalyticsTimeIntervalFromMachTimes(uint64_t a1, uint64_t a2)
{
  if (CalAnalyticsTimeIntervalFromMachTimes_onceToken != -1) {
    dispatch_once(&CalAnalyticsTimeIntervalFromMachTimes_onceToken, &__block_literal_global_15);
  }
  return *(double *)&CalAnalyticsTimeIntervalFromMachTimes_timebaseFactor * (double)(unint64_t)(a2 - a1);
}

double __CalAnalyticsTimeIntervalFromMachTimes_block_invoke()
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  LODWORD(v1) = info.denom;
  LODWORD(v0) = info.numer;
  double result = (double)v0 / (double)v1 / 1000000000.0;
  CalAnalyticsTimeIntervalFromMachTimes_timebaseFactor = *(void *)&result;
  return result;
}

void sub_190DAFBFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void CalendarFoundationPerformBlockOnSharedContactStore(void *a1)
{
  id v1 = a1;
  id v2 = +[CalContactsProvider defaultProvider];
  uint64_t v3 = [v2 store];

  if (CalendarFoundationPerformBlockOnSharedContactStore_onceToken != -1) {
    dispatch_once(&CalendarFoundationPerformBlockOnSharedContactStore_onceToken, &__block_literal_global_17);
  }
  id v4 = CalendarFoundationPerformBlockOnSharedContactStore__contactStoreQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __CalendarFoundationPerformBlockOnSharedContactStore_block_invoke_2;
  v7[3] = &unk_1E56CDCF8;
  id v8 = v3;
  id v9 = v1;
  id v5 = v3;
  id v6 = v1;
  dispatch_sync(v4, v7);
}

uint64_t __CalendarFoundationPerformBlockOnSharedContactStore_block_invoke()
{
  CalendarFoundationPerformBlockOnSharedContactStore__contactStoreQueue = (uint64_t)dispatch_queue_create("com.apple.eventkit.contactstore", 0);

  return MEMORY[0x1F41817F8]();
}

uint64_t __CalendarFoundationPerformBlockOnSharedContactStore_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_190DB0AD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_190DB0C70(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190DB0CF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190DB2188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_190DB2408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_190DB266C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_190DB2F3C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_190DB3978(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190DB3A84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190DB3BD4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190DB3D38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_190DB3F50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMGGetBoolAnswerSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  id v2 = (void *)libMobileGestaltLibraryCore_frameworkLibrary;
  uint64_t v10 = libMobileGestaltLibraryCore_frameworkLibrary;
  if (!libMobileGestaltLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __libMobileGestaltLibraryCore_block_invoke;
    v4[4] = &unk_1E56CDF28;
    id v5 = &v7;
    id v6 = v4;
    long long v11 = xmmword_1E56CDF08;
    uint64_t v12 = 0;
    v8[3] = _sl_dlopen();
    libMobileGestaltLibraryCore_frameworkLibrary = *(void *)(v5[1] + 24);
    id v2 = (void *)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2) {
    __getMGGetBoolAnswerSymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  double result = dlsym(v2, "MGGetBoolAnswer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMGGetBoolAnswerSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_190DB53E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __libMobileGestaltLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  libMobileGestaltLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_4_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_8_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_9_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_190DB6458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_190DB8288(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void CalDateTimeSetTimeZone(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef v3 = *(CFTypeRef *)(a1 + 8);
  if (v3 != cf)
  {
    if (v3) {
      CFRelease(v3);
    }
    if (cf) {
      CFRetain(cf);
    }
    *(void *)(a1 + 8) = cf;
  }
}

uint64_t CalGetFloatingTimeZone()
{
  return *MEMORY[0x1E4F1D260];
}

void CalSetSystemTimeZone(void *a1, int a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock(&__GlobalLock);
  if (!__SystemTimeZone)
  {
    uint64_t v7 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      CalSetSystemTimeZone_cold_2(a1);
    }

    __SystemTimeZone = (uint64_t)CFRetain(a1);
    goto LABEL_9;
  }
  int v4 = CFEqual((CFTypeRef)__SystemTimeZone, a1);
  id v5 = +[CalFoundationLogSubsystem defaultCategory];
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6) {
      CalSetSystemTimeZone_cold_4(a1);
    }

LABEL_9:
    int v8 = 1;
    goto LABEL_13;
  }
  if (v6) {
    CalSetSystemTimeZone_cold_3(a1);
  }

  CFRelease((CFTypeRef)__SystemTimeZone);
  int v8 = 0;
  __SystemTimeZone = (uint64_t)CFRetain(a1);
LABEL_13:
  if (__TimeZone)
  {
    CFTimeZoneRef v9 = _CalCopyDefaultTimeZone(1);
    BOOL v10 = _CalSetTimeZone(v9);
    CFRelease(v9);
    if (v10) {
      CFIndex v11 = 2;
    }
    else {
      CFIndex v11 = 1;
    }
  }
  else
  {
    CFIndex v11 = 1;
  }
  uint64_t v12 = (void *)__Calendar;
  if (__Calendar)
  {
    __Calendar = 0;
  }
  pthread_mutex_unlock(&__GlobalLock);
  if (((v8 | a2 ^ 1) & 1) == 0)
  {
    uint64_t v13 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      CalSetSystemTimeZone_cold_1();
    }

    *(_OWORD *)keys = xmmword_1E56CE080;
    v16[0] = (const void *)__SystemTimeZone;
    v16[1] = (const void *)__TimeZone;
    CFDictionaryRef v14 = CFDictionaryCreate(0, (const void **)keys, v16, v11, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(LocalCenter, @"CalTimeZoneChangedNotification", 0, v14, 1u);
    CFRelease(v14);
  }
}

CFTimeZoneRef _CalCopyDefaultTimeZone(int a1)
{
  Boolean keyExistsAndHasValidFormat = 0;
  uint64_t AppBooleanValue = CFPreferencesGetAppBooleanValue(@"ViewedTimeZoneAutomatic", @"com.apple.mobilecal", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3)
  {
    CFStringRef v5 = (const __CFString *)CFPreferencesCopyAppValue(@"ViewedTimeZone", @"com.apple.mobilecal");
    if (!v5)
    {
      BOOL v6 = +[CalFoundationLogSubsystem defaultCategory];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        _CalCopyDefaultTimeZone_cold_5();
      }

      CFStringRef v5 = (const __CFString *)CFPreferencesCopyAppValue(@"CalTimeZoneKey", @"com.apple.mobilecal");
      if (!v5) {
        goto LABEL_14;
      }
    }
    uint64_t v7 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      _CalCopyDefaultTimeZone_cold_4();
    }

    CFTimeZoneRef v4 = _CalTimeZoneCopyCFTimeZone(v5);
    CFRelease(v5);
    if (!v4)
    {
LABEL_14:
      int v8 = +[CalFoundationLogSubsystem defaultCategory];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        _CalCopyDefaultTimeZone_cold_3();
      }

      CFTimeZoneRef v4 = (CFTimeZoneRef)((uint64_t (*)(void))_CalCopySystemTimeZone)();
    }
    CFTimeZoneRef v9 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      _CalCopyDefaultTimeZone_cold_2();
    }
  }
  else
  {
    if (a1) {
      CFTimeZoneRef v4 = (CFTimeZoneRef)_CalCopySystemTimeZone(AppBooleanValue);
    }
    else {
      CFTimeZoneRef v4 = 0;
    }
    CFTimeZoneRef v9 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      _CalCopyDefaultTimeZone_cold_6(v4);
    }
  }

  if (!__SystemTimeZone)
  {
    BOOL v10 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      _CalCopyDefaultTimeZone_cold_1();
    }

    uint64_t v12 = (const void *)_CalCopySystemTimeZone(v11);
    CFRelease(v12);
  }
  return v4;
}

BOOL _CalSetTimeZone(void *a1)
{
  uint64_t v2 = __TimeZone;
  BOOL v3 = __TimeZone != 0;
  CFTimeZoneRef v4 = +[CalFoundationLogSubsystem defaultCategory];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (!v2)
  {
    if (v5) {
      _CalSetTimeZone_cold_2(a1);
    }

    goto LABEL_10;
  }
  if (v5) {
    _CalSetTimeZone_cold_1(a1);
  }

  if (!CFEqual(a1, (CFTypeRef)__TimeZone))
  {
    CFRelease((CFTypeRef)__TimeZone);
LABEL_10:
    __TimeZone = (uint64_t)CFRetain(a1);
    return v3;
  }
  return 0;
}

CFTypeRef CalCopySystemTimeZone()
{
  pthread_mutex_lock(&__GlobalLock);
  CFTypeRef v0 = _CalCopySystemTimeZone();
  pthread_mutex_unlock(&__GlobalLock);
  return v0;
}

CFTypeRef _CalCopySystemTimeZone()
{
  CFTypeRef v0 = (const void *)__SystemTimeZone;
  if (!__SystemTimeZone)
  {
    __SystemTimeZone = (uint64_t)CFTimeZoneCopySystem();
    uint64_t v1 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
      _CalCopySystemTimeZone_cold_1();
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_significantTimeChange, @"SignificantTimeChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFTypeRef v0 = (const void *)__SystemTimeZone;
  }
  return CFRetain(v0);
}

CFTimeZoneRef CalCopyDefaultTimeZone()
{
  pthread_mutex_lock(&__GlobalLock);
  CFTimeZoneRef v0 = _CalCopyDefaultTimeZone(1);
  pthread_mutex_unlock(&__GlobalLock);
  return v0;
}

CFTimeZoneRef CalCopyDefaultTimeZoneSetting()
{
  pthread_mutex_lock(&__GlobalLock);
  CFPreferencesAppSynchronize(@"com.apple.mobilecal");
  CFTimeZoneRef v0 = _CalCopyDefaultTimeZone(0);
  pthread_mutex_unlock(&__GlobalLock);
  return v0;
}

BOOL CalDefaultTimeZoneSettingIsImplicit()
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"ViewedTimeZoneAutomatic", @"com.apple.mobilecal", &keyExistsAndHasValidFormat);
  BOOL result = 0;
  if (AppBooleanValue) {
    BOOL v2 = keyExistsAndHasValidFormat == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2) {
    return !CFPreferencesGetAppBooleanValue(@"ViewedTimeZoneChosen", @"com.apple.mobilecal", &keyExistsAndHasValidFormat)|| keyExistsAndHasValidFormat == 0;
  }
  return result;
}

BOOL CalDefaultTimeZoneSettingIsAutomatic()
{
  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(@"ViewedTimeZoneAutomatic", @"com.apple.mobilecal", &keyExistsAndHasValidFormat))
  {
    BOOL v0 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    BOOL v0 = 1;
  }
  return !v0;
}

void CalSetDefaultTimeZone(void *a1)
{
  pthread_mutex_lock(&__GlobalLock);
  BOOL v2 = +[CalFoundationLogSubsystem defaultCategory];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    CalSetDefaultTimeZone_cold_1(a1);
  }

  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(@"ViewedTimeZoneAutomatic", @"com.apple.mobilecal", &keyExistsAndHasValidFormat))
  {
    BOOL v3 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    BOOL v3 = 1;
  }
  int v4 = !v3;
  if ((a1 == 0) == v4)
  {
    if (!a1)
    {
      BOOL v6 = (const void *)*MEMORY[0x1E4F1CFD0];
      CFPreferencesSetAppValue(@"ViewedTimeZoneAutomatic", (CFPropertyListRef)*MEMORY[0x1E4F1CFD0], @"com.apple.mobilecal");
      goto LABEL_21;
    }
    BOOL v5 = @"UserChangedDefaultTimezone";
  }
  else if (a1)
  {
    BOOL v5 = @"UserEnabledTimezoneSupport";
  }
  else
  {
    BOOL v5 = @"UserDisabledTimezoneSupport";
  }
  CalAnalyticsSendEvent((uint64_t)v5, 0);
  BOOL v6 = (const void *)*MEMORY[0x1E4F1CFD0];
  if (a1) {
    uint64_t v7 = (const void *)*MEMORY[0x1E4F1CFC8];
  }
  else {
    uint64_t v7 = (const void *)*MEMORY[0x1E4F1CFD0];
  }
  CFPreferencesSetAppValue(@"ViewedTimeZoneAutomatic", v7, @"com.apple.mobilecal");
  if (a1)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    CFStringRef v9 = CalCFTimeZoneCopyCalTimeZone((const __CFTimeZone *)a1, Current);
    CFPreferencesSetAppValue(@"ViewedTimeZone", v9, @"com.apple.mobilecal");
    CFRelease(v9);
  }
LABEL_21:
  CFPreferencesSetAppValue(@"ViewedTimeZoneChosen", v6, @"com.apple.mobilecal");
  CFPreferencesAppSynchronize(@"com.apple.mobilecal");
  ++__TimeZoneNotificationEchoCount;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mobilecal.timezonechanged", 0, 0, 1u);
  pthread_mutex_unlock(&__GlobalLock);
  _CalDefaultTimeZoneSettingsChanged();
}

CFStringRef CalCFTimeZoneCopyCalTimeZone(const __CFTimeZone *a1, CFAbsoluteTime a2)
{
  if ((const __CFTimeZone *)*MEMORY[0x1E4F1D260] == a1)
  {
    return (CFStringRef)CFRetain(@"_float");
  }
  else
  {
    int v4 = (const void *)MEMORY[0x192FD7FC0]();
    if (v4)
    {
      BOOL v5 = v4;
      CFRetain(v4);
      return (CFStringRef)v5;
    }
    else
    {
      return CFTimeZoneCopyAbbreviation(a1, a2);
    }
  }
}

void _CalDefaultTimeZoneSettingsChanged()
{
  pthread_mutex_lock(&__GlobalLock);
  if (!__TimeZone)
  {
    uint64_t v1 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
      _CalDefaultTimeZoneSettingsChanged_cold_1();
    }

    goto LABEL_7;
  }
  CFTimeZoneRef v0 = _CalCopyDefaultTimeZone(1);
  if (CFEqual(v0, (CFTypeRef)__TimeZone))
  {
    CFRelease(v0);
LABEL_7:
    pthread_mutex_unlock(&__GlobalLock);
    return;
  }
  BOOL v2 = +[CalFoundationLogSubsystem defaultCategory];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    _CalDefaultTimeZoneSettingsChanged_cold_3(v0);
  }

  CFRelease((CFTypeRef)__TimeZone);
  __TimeZone = (uint64_t)v0;
  BOOL v3 = (void *)__Calendar;
  __Calendar = 0;

  CFTypeRef v4 = CFRetain(v0);
  pthread_mutex_unlock(&__GlobalLock);
  BOOL v5 = +[CalFoundationLogSubsystem defaultCategory];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    _CalDefaultTimeZoneSettingsChanged_cold_2();
  }

  int v8 = v4;
  keys = @"CalTimeZoneKey";
  CFDictionaryRef v6 = CFDictionaryCreate(0, (const void **)&keys, &v8, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, @"CalTimeZoneChangedNotification", 0, v6, 1u);
  CFRelease(v6);
  CFRelease(v4);
}

void _CalTimeZoneForceUpdate()
{
  pthread_mutex_lock(&__GlobalLock);
  if (__PAIR128__(__TimeZone, __SystemTimeZone) != 0)
  {
    pthread_mutex_unlock(&__GlobalLock);
LABEL_4:
    uint64_t v1 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
      _CalTimeZoneForceUpdate_cold_1();
    }

    _significantTimeChange();
    _CalTimeZonePrefChanged();
    return;
  }
  uint64_t v0 = __Calendar;
  pthread_mutex_unlock(&__GlobalLock);
  if (v0) {
    goto LABEL_4;
  }
  BOOL v2 = +[CalFoundationLogSubsystem defaultCategory];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    _CalTimeZoneForceUpdate_cold_2();
  }
}

void _significantTimeChange()
{
  uint64_t v0 = +[CalFoundationLogSubsystem defaultCategory];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    _significantTimeChange_cold_1();
  }

  CFTimeZoneResetSystem();
  CFTimeZoneRef v1 = CFTimeZoneCopySystem();
  CalSetSystemTimeZone(v1, 1);
  CFRelease(v1);
}

void _CalTimeZonePrefChanged()
{
  int v0 = __TimeZoneNotificationEchoCount;
  CFTimeZoneRef v1 = +[CalFoundationLogSubsystem defaultCategory];
  BOOL v2 = os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG);
  if (v0)
  {
    if (v2) {
      _CalTimeZonePrefChanged_cold_2(v1);
    }

    --__TimeZoneNotificationEchoCount;
  }
  else
  {
    if (v2) {
      _CalTimeZonePrefChanged_cold_1();
    }

    CFPreferencesAppSynchronize(@"com.apple.mobilecal");
    _CalDefaultTimeZoneSettingsChanged();
  }
}

CFTimeZoneRef _CalCopyTimeZone()
{
  int v0 = (const void *)__TimeZone;
  if (__TimeZone)
  {
    return (CFTimeZoneRef)CFRetain(v0);
  }
  else
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_CalTimeZonePrefChanged, @"com.apple.mobilecal.timezonechanged", 0, CFNotificationSuspensionBehaviorDrop);
    CFTimeZoneRef v3 = _CalCopyDefaultTimeZone(1);
    CFTypeRef v4 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      _CalCopyTimeZone_cold_1(v3);
    }

    _CalSetTimeZone(v3);
    return v3;
  }
}

CFTimeZoneRef CalCopyTimeZone()
{
  pthread_mutex_lock(&__GlobalLock);
  CFTimeZoneRef v0 = _CalCopyTimeZone();
  pthread_mutex_unlock(&__GlobalLock);
  return v0;
}

id CalCopyCalendar()
{
  pthread_mutex_lock(&__GlobalLock);
  CFTimeZoneRef v0 = _CalCopyCalendar();
  pthread_mutex_unlock(&__GlobalLock);

  return v0;
}

id _CalCopyCalendar()
{
  CFTimeZoneRef v0 = (void *)__Calendar;
  if (!__Calendar)
  {
    uint64_t v1 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    BOOL v2 = (void *)__Calendar;
    __Calendar = v1;

    CFTimeZoneRef v3 = _CalCopyTimeZone();
    if (v3) {
      [(id)__Calendar setTimeZone:v3];
    }

    CFTimeZoneRef v0 = (void *)__Calendar;
  }
  CFTypeRef v4 = (void *)[v0 copy];

  return v4;
}

CFTimeZoneRef CalTimeZoneCopyCFTimeZone(const __CFString *a1)
{
  pthread_mutex_lock(&__GlobalLock);
  CFTimeZoneRef v2 = _CalTimeZoneCopyCFTimeZone(a1);
  pthread_mutex_unlock(&__GlobalLock);
  return v2;
}

CFTimeZoneRef _CalTimeZoneCopyCFTimeZone(const __CFString *key)
{
  if (_CalTimeZoneCopyCFTimeZone___TimeZoneCache)
  {
    CFTimeZoneRef Value = (const __CFTimeZone *)CFDictionaryGetValue((CFDictionaryRef)_CalTimeZoneCopyCFTimeZone___TimeZoneCache, key);
    if (Value)
    {
      CFTimeZoneRef v3 = Value;
      CFRetain(Value);
      return v3;
    }
  }
  else
  {
    _CalTimeZoneCopyCFTimeZone___TimeZoneCache = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  }
  CFTimeZoneRef v3 = CFTimeZoneCreateWithName(0, key, 1u);
  if (v3) {
    CFDictionarySetValue((CFMutableDictionaryRef)_CalTimeZoneCopyCFTimeZone___TimeZoneCache, key, v3);
  }
  return v3;
}

void CalDateTimeRelease(int a1, CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

uint64_t CalDateTimeGetGregorianDate(uint64_t a1, const __CFString *a2, const __CFTimeZone *a3)
{
  double AbsoluteTime = CalDateTimeGetAbsoluteTime(a1, a2, a3);

  return CalAbsoluteTimeGetGregorianDateWithFallbackToDefaultTimeZone(a3, AbsoluteTime);
}

double CalDateTimeGetAbsoluteTime(uint64_t AbsoluteTime, CFStringRef theString1, const __CFTimeZone *a3)
{
  if (theString1 && CFStringCompare(theString1, @"_float", 0)) {
    return *(double *)&AbsoluteTime;
  }
  pthread_mutex_lock(&__GlobalLock);
  CFTimeZoneRef v5 = _CalTimeZoneCopyCFTimeZone(@"GMT");
  pthread_mutex_unlock(&__GlobalLock);
  CFTimeZoneRef v6 = a3;
  if (!a3)
  {
    pthread_mutex_lock(&__GlobalLock);
    CFTimeZoneRef v6 = _CalCopyTimeZone();
    pthread_mutex_unlock(&__GlobalLock);
  }
  if (CFEqual(v5, v6))
  {
    if (!v5) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  CFGregorianDate GregorianDate = CFAbsoluteTimeGetGregorianDate(*(CFAbsoluteTime *)&AbsoluteTime, v5);
  double AbsoluteTime = CFGregorianDateGetAbsoluteTime(GregorianDate, v6);
  if (v5) {
LABEL_7:
  }
    CFRelease(v5);
LABEL_8:
  if (!a3) {
    CFRelease(v6);
  }
  return *(double *)&AbsoluteTime;
}

uint64_t CalAbsoluteTimeGetGregorianDateWithFallbackToDefaultTimeZone(const __CFTimeZone *a1, CFAbsoluteTime a2)
{
  if (a1)
  {
    return *(_OWORD *)&CFAbsoluteTimeGetGregorianDate(a2, a1);
  }
  else
  {
    pthread_mutex_lock(&__GlobalLock);
    CFTimeZoneRef v4 = _CalCopyTimeZone();
    pthread_mutex_unlock(&__GlobalLock);
    uint64_t v5 = *(_OWORD *)&CFAbsoluteTimeGetGregorianDate(a2, v4);
    CFRelease(v4);
    return v5;
  }
}

uint64_t CalGregorianDateCopyDateTime(CFGregorianDate gdate, CFTimeZoneRef tz)
{
  double second = gdate.second;
  uint64_t v4 = *(void *)&gdate.year;
  v8[1] = 0.0;
  CFTimeZoneRef v5 = tz;
  if (!tz)
  {
    pthread_mutex_lock(&__GlobalLock);
    CFTimeZoneRef v5 = _CalCopyTimeZone();
    pthread_mutex_unlock(&__GlobalLock);
  }
  *(void *)&v9.year = v4;
  v9.double second = second;
  v8[0] = CFGregorianDateGetAbsoluteTime(v9, v5);
  CFStringRef v6 = CalCFTimeZoneCopyCalTimeZone(v5, v8[0]);
  CalDateTimeSetTimeZone((uint64_t)v8, v6);
  if (v6) {
    CFRelease(v6);
  }
  if (!tz) {
    CFRelease(v5);
  }
  return *(void *)&v8[0];
}

CFAbsoluteTime CalGregorianDateGetAbsoluteTimeWithFallbackToDefaultTimeZone(CFGregorianDate gdate, const __CFTimeZone *a2)
{
  double second = gdate.second;
  uint64_t v3 = *(void *)&gdate.year;
  if (a2)
  {
    return CFGregorianDateGetAbsoluteTime(gdate, a2);
  }
  else
  {
    pthread_mutex_lock(&__GlobalLock);
    CFTimeZoneRef v5 = _CalCopyTimeZone();
    pthread_mutex_unlock(&__GlobalLock);
    *(void *)&v8.year = v3;
    v8.double second = second;
    double AbsoluteTime = CFGregorianDateGetAbsoluteTime(v8, v5);
    CFRelease(v5);
    return AbsoluteTime;
  }
}

uint64_t CalAbsoluteTimeGetDayOfWeek(const __CFTimeZone *a1, CFAbsoluteTime a2)
{
  if (a1)
  {
    unsigned int DayOfWeek = CFAbsoluteTimeGetDayOfWeek(a2, a1);
  }
  else
  {
    pthread_mutex_lock(&__GlobalLock);
    CFTimeZoneRef v4 = _CalCopyTimeZone();
    pthread_mutex_unlock(&__GlobalLock);
    unsigned int DayOfWeek = CFAbsoluteTimeGetDayOfWeek(a2, v4);
    CFRelease(v4);
  }
  if (DayOfWeek == 7) {
    return 0;
  }
  else {
    return DayOfWeek;
  }
}

uint64_t CalGregorianDateGetDayOfWeek(CFGregorianDate gdate, const __CFTimeZone *a2)
{
  double second = gdate.second;
  uint64_t v4 = *(void *)&gdate.year;
  CFTimeZoneRef v5 = a2;
  if (!a2)
  {
    pthread_mutex_lock(&__GlobalLock);
    CFTimeZoneRef v5 = _CalCopyTimeZone();
    pthread_mutex_unlock(&__GlobalLock);
  }
  *(void *)&v9.year = v4;
  v9.double second = second;
  CFAbsoluteTime AbsoluteTimeWithFallbackToDefaultTimeZone = CalGregorianDateGetAbsoluteTimeWithFallbackToDefaultTimeZone(v9, v5);
  uint64_t DayOfWeek = CalAbsoluteTimeGetDayOfWeek(v5, AbsoluteTimeWithFallbackToDefaultTimeZone);
  if (!a2) {
    CFRelease(v5);
  }
  return DayOfWeek;
}

double CalAbsoluteTimeGetAbsoluteTimeInTimeZone(CFTimeZoneRef tz, const __CFTimeZone *a2, CFAbsoluteTime a3)
{
  CFTimeZoneRef v6 = tz;
  if (!tz)
  {
    pthread_mutex_lock(&__GlobalLock);
    CFTimeZoneRef v6 = _CalCopyTimeZone();
    pthread_mutex_unlock(&__GlobalLock);
  }
  CFTimeZoneRef v7 = a2;
  if (!a2)
  {
    pthread_mutex_lock(&__GlobalLock);
    CFTimeZoneRef v7 = _CalCopyTimeZone();
    pthread_mutex_unlock(&__GlobalLock);
  }
  CFGregorianDate GregorianDate = CFAbsoluteTimeGetGregorianDate(a3, v6);
  double AbsoluteTime = CFGregorianDateGetAbsoluteTime(GregorianDate, v7);
  if (!tz)
  {
    CFRelease(v6);
    if (a2) {
      return AbsoluteTime;
    }
LABEL_9:
    CFRelease(v7);
    return AbsoluteTime;
  }
  if (!a2) {
    goto LABEL_9;
  }
  return AbsoluteTime;
}

double CalAbsoluteTimeGetTimeForStartOfDay(const void *a1, CFAbsoluteTime a2)
{
  if (a1)
  {
    CFTimeZoneRef v3 = (const __CFTimeZone *)CFRetain(a1);
  }
  else
  {
    pthread_mutex_lock(&__GlobalLock);
    CFTimeZoneRef v3 = _CalTimeZoneCopyCFTimeZone(@"GMT");
    pthread_mutex_unlock(&__GlobalLock);
  }
  *(void *)&v6.year = CalAbsoluteTimeGetGregorianDateWithFallbackToDefaultTimeZone(v3, a2) & 0xFFFFFFFFFFFFLL;
  v6.double second = 0.0;
  double AbsoluteTimeWithFallbackToDefaultTimeZone = CalGregorianDateGetAbsoluteTimeWithFallbackToDefaultTimeZone(v6, v3);
  CFRelease(v3);
  return AbsoluteTimeWithFallbackToDefaultTimeZone;
}

uint64_t CalGregorianDateGetGregorianDateForDay(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL;
}

uint64_t CalGregorianDateGetNull()
{
  return 0;
}

BOOL CalGregorianDateEqualToGregorianDate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a3 ^ a1;
  if (((a3 ^ a1) & 0xFF0000000000) != 0) {
    return 0;
  }
  int v6 = a1;
  BOOL result = 0;
  if (v6 == a3 && (v4 & 0xFFFF00FF00000000) == 0) {
    return vabdd_f64(*(double *)&a2, *(double *)&a4) < 2.22044605e-16;
  }
  return result;
}

uint64_t CalGregorianDateGetGregorianDateForEndOfDay(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0x3B17000000000000;
}

uint64_t CalGregorianDateGetGregorianDateForMonth(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFLL | 0x10000000000;
}

uint64_t CalGregorianDateGetGregorianDateForYear(unsigned int a1)
{
  return a1 | 0x10100000000;
}

uint64_t CalAbsoluteTimeGetGregorianDateForWeek(const __CFTimeZone *a1, unsigned int a2, _DWORD *a3, CFAbsoluteTime a4)
{
  CFTimeZoneRef v8 = a1;
  if (!a1)
  {
    pthread_mutex_lock(&__GlobalLock);
    CFTimeZoneRef v8 = _CalCopyTimeZone();
    pthread_mutex_unlock(&__GlobalLock);
  }
  unsigned int DayOfWeek = CalAbsoluteTimeGetDayOfWeek(v8, a4);
  int v10 = DayOfWeek % 7 - a2;
  if (DayOfWeek % 7 >= a2) {
    int v11 = 0;
  }
  else {
    int v11 = 7;
  }
  *(void *)(&v16.minutes + 1) = 0;
  int v12 = v10 + v11;
  v16.minutes = 0;
  HIDWORD(v16.seconds) = 0;
  *(void *)&v16.years = 0;
  *(void *)&v16.days = -(v10 + v11);
  CFAbsoluteTime v13 = CFAbsoluteTimeAddGregorianUnits(a4, v8, &v16);
  uint64_t v14 = *(_OWORD *)&CFAbsoluteTimeGetGregorianDate(v13, v8);
  if (!a1)
  {
    CFRelease(v8);
    if (!a3) {
      return v14 & 0xFFFFFFFFFFFFLL;
    }
    goto LABEL_8;
  }
  if (a3) {
LABEL_8:
  }
    *a3 = v12;
  return v14 & 0xFFFFFFFFFFFFLL;
}

double CalAbsoluteTimeGetAbsoluteTimeInCalTimeZone(const __CFString *a1, CFAbsoluteTime a2)
{
  pthread_mutex_lock(&__GlobalLock);
  CFTimeZoneRef v4 = _CalTimeZoneCopyCFTimeZone(@"GMT");
  pthread_mutex_unlock(&__GlobalLock);
  CFGregorianDate GregorianDate = CFAbsoluteTimeGetGregorianDate(a2, v4);
  CFComparisonResult v6 = CFStringCompare(a1, @"_float", 0);
  pthread_mutex_lock(&__GlobalLock);
  if (v6) {
    CFTimeZoneRef v7 = _CalTimeZoneCopyCFTimeZone(a1);
  }
  else {
    CFTimeZoneRef v7 = _CalCopyTimeZone();
  }
  CFTimeZoneRef v8 = v7;
  pthread_mutex_unlock(&__GlobalLock);
  double AbsoluteTime = CFGregorianDateGetAbsoluteTime(GregorianDate, v8);
  if (v4) {
    CFRelease(v4);
  }
  if (v8) {
    CFRelease(v8);
  }
  return AbsoluteTime;
}

uint64_t CalGregorianDateAddUnits(CFGregorianDate gdate, _OWORD *a2, CFTimeZoneRef tz)
{
  double second = gdate.second;
  uint64_t v6 = *(void *)&gdate.year;
  CFTimeZoneRef v7 = tz;
  if (!tz)
  {
    pthread_mutex_lock(&__GlobalLock);
    CFTimeZoneRef v7 = _CalCopyTimeZone();
    pthread_mutex_unlock(&__GlobalLock);
  }
  *(void *)&v14.year = v6;
  v14.double second = second;
  CFAbsoluteTime AbsoluteTime = CFGregorianDateGetAbsoluteTime(v14, v7);
  long long v9 = a2[1];
  *(_OWORD *)&v13.years = *a2;
  *(_OWORD *)&v13.minutes = v9;
  CFAbsoluteTime v10 = CFAbsoluteTimeAddGregorianUnits(AbsoluteTime, v7, &v13);
  uint64_t v11 = *(_OWORD *)&CFAbsoluteTimeGetGregorianDate(v10, v7);
  if (!tz) {
    CFRelease(v7);
  }
  return v11;
}

unint64_t CalGregorianDateAddDays(unint64_t a1, uint64_t a2, int a3)
{
  unsigned int v3 = (int)(a1 >> 8) >> 24;
  unsigned int v4 = a3 + ((int)(a1 >> 16) >> 24);
  if (v3 - 1 > 0xB)
  {
    unsigned int v5 = 0;
  }
  else
  {
    unsigned int v5 = __DaysInMonths[v3];
    if (v3 == 2)
    {
      int v6 = ((int)a1 - 2000) % 400;
      if (v6 == 300) {
        unsigned int v7 = __DaysInMonths[v3];
      }
      else {
        unsigned int v7 = v5 + 1;
      }
      if (v6 == 200) {
        unsigned int v7 = __DaysInMonths[v3];
      }
      if (v6 == 100) {
        unsigned int v7 = __DaysInMonths[v3];
      }
      if ((v6 & 3) == 0) {
        unsigned int v5 = v7;
      }
    }
  }
  if (v5 >= v4)
  {
    unsigned int v8 = a1;
  }
  else
  {
    unsigned int v8 = a1;
    do
    {
      if (v3 + 1 <= 0xC)
      {
        ++v3;
      }
      else
      {
        ++v8;
        unsigned int v3 = 1;
      }
      if (v3 - 1 > 0xB)
      {
        unsigned int v9 = 0;
      }
      else
      {
        unsigned int v9 = __DaysInMonths[v3];
        if (v3 == 2)
        {
          int v10 = (int)(v8 - 2000) % 400;
          if ((v10 & 3) == 0 && v10 != 100 && v10 != 200 && v10 != 300) {
            ++v9;
          }
        }
      }
      v4 -= v5;
      unsigned int v5 = v9;
    }
    while (v9 < v4);
  }
  return a1 & 0xFFFF000000000000 | ((unint64_t)v4 << 40) | ((unint64_t)v3 << 32) | v8;
}

CFIndex CalAbsoluteTimeGetDaysInMonth(const __CFTimeZone *a1, CFAbsoluteTime a2)
{
  return _CalAbsoluteTimeGetRangeOfUnit(a1, 0x10uLL, 8uLL, a2);
}

CFIndex _CalAbsoluteTimeGetRangeOfUnit(const __CFTimeZone *a1, CFCalendarUnit a2, CFCalendarUnit a3, CFAbsoluteTime a4)
{
  pthread_mutex_lock(&__GlobalLock);
  unsigned int v8 = (__CFCalendar *)_CalCopyCalendar();
  unsigned int v9 = v8;
  if (a1) {
    CFCalendarSetTimeZone(v8, a1);
  }
  CFIndex length = CFCalendarGetRangeOfUnit(v9, a2, a3, a4).length;
  pthread_mutex_unlock(&__GlobalLock);
  return length;
}

uint64_t CalGregorianDateGetDaysInMonth(unint64_t a1)
{
  int v1 = (int)(a1 >> 8) >> 24;
  if ((v1 - 1) > 0xB) {
    return 0;
  }
  int v2 = a1;
  uint64_t result = __DaysInMonths[v1];
  if (v1 == 2)
  {
    int v4 = (v2 - 2000) % 400;
    if ((v4 & 3) == 0 && v4 != 100 && v4 != 200 && v4 != 300) {
      return (result + 1);
    }
  }
  return result;
}

CFIndex CalAbsoluteTimeGetWeeksInYear(CFAbsoluteTime a1, uint64_t a2, const __CFTimeZone *a3)
{
  return _CalAbsoluteTimeGetRangeOfUnit(a3, 0x100uLL, 4uLL, a1);
}

uint64_t CalAbsoluteTimeGetDaysInYear(CFTimeZoneRef tz, CFAbsoluteTime a2)
{
  CFTimeZoneRef v4 = tz;
  if (!tz)
  {
    pthread_mutex_lock(&__GlobalLock);
    CFTimeZoneRef v4 = _CalCopyTimeZone();
    pthread_mutex_unlock(&__GlobalLock);
  }
  *(void *)&v8.years = 1;
  memset(&v8.days, 0, 24);
  CFAbsoluteTime v5 = CFAbsoluteTimeAddGregorianUnits(a2, v4, &v8);
  CFAbsoluteTimeGetDifferenceAsGregorianUnits(&v8, v5, a2, v4, 4uLL);
  uint64_t days = v8.days;
  if (!tz) {
    CFRelease(v4);
  }
  return days;
}

uint64_t CalAbsoluteTimeGetWeekOfYear(int a1, CFTimeZoneRef tz, CFAbsoluteTime a3)
{
  CFTimeZoneRef v3 = tz;
  if (a1 == 1)
  {
    if (!tz)
    {
      pthread_mutex_lock(&__GlobalLock);
      CFTimeZoneRef v5 = _CalCopyTimeZone();
      pthread_mutex_unlock(&__GlobalLock);
      CFTimeZoneRef v3 = (const __CFTimeZone *)CFAutorelease(v5);
    }
    return CFAbsoluteTimeGetWeekOfYear(a3, v3);
  }
  else
  {
    pthread_mutex_lock(&__GlobalLock);
    CFGregorianUnits v8 = (__CFCalendar *)_CalCopyCalendar();
    unsigned int v9 = v8;
    if (v3) {
      CFCalendarSetTimeZone(v8, v3);
    }
    unsigned int v10 = 0;
    CFCalendarSetFirstWeekday(v9, (a1 + 1));
    CFCalendarSetMinimumDaysInFirstWeek(v9, 4);
    if (!CFCalendarDecomposeAbsoluteTime(v9, a3, "w", &v10)) {
      unsigned int v10 = 0;
    }
    pthread_mutex_unlock(&__GlobalLock);
    return v10;
  }
}

BOOL CalGregorianDateIsExtreme(int a1)
{
  return (a1 - 2069) < 0xFFFFFF78;
}

uint64_t CalGregorianDateGetExtremities(uint64_t result, uint64_t a2)
{
  if (result)
  {
    *(void *)uint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)uint64_t result = 1933;
    *(_WORD *)(result + 4) = 257;
  }
  if (a2)
  {
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(_DWORD *)a2 = 2067;
    *(_WORD *)(a2 + 4) = 7948;
  }
  return result;
}

double CalAbsoluteTimeAddGregorianUnits(uint64_t a1, _OWORD *a2, double a3)
{
  CFTimeZoneRef v5 = +[EKTimeZone timeZoneWithNSTimeZone:a1];
  long long v6 = a2[1];
  v9[0] = *a2;
  v9[1] = v6;
  double v7 = EKAbsoluteTimeAddGregorianDuration(v5, v9, a3);

  return v7;
}

uint64_t _CalCompareDates(unint64_t a1, unint64_t a2)
{
  if (a1 < a2) {
    return -1;
  }
  else {
    return a1 > a2;
  }
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t EKSymbolicColorToRGBMapping()
{
  if (EKSymbolicColorToRGBMapping_onceToken != -1) {
    dispatch_once(&EKSymbolicColorToRGBMapping_onceToken, &__block_literal_global_20);
  }
  return EKSymbolicColorToRGBMapping___symbolicColorNamesToRGB;
}

CFIndex __EKSymbolicColorToRGBMapping_block_invoke()
{
  EKSymbolicColorToRGBMapping___symbolicColorNamesToRGB = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFArrayRef v0 = (const __CFArray *)EKGetDefaultCalendarColors();
  CFIndex result = CFArrayGetCount(v0);
  if (result >= 1)
  {
    for (CFIndex i = 0; i < result; ++i)
    {
      CFTimeZoneRef v3 = (__CFDictionary *)EKSymbolicColorToRGBMapping___symbolicColorNamesToRGB;
      CFTimeZoneRef v4 = *(&off_1E56CE098 + i);
      ValueAtIndex = CFArrayGetValueAtIndex(v0, i);
      CFDictionarySetValue(v3, v4, ValueAtIndex);
      CFIndex result = CFArrayGetCount(v0);
    }
  }
  return result;
}

uint64_t EKGetDefaultCalendarColors()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  uint64_t result = EKGetDefaultCalendarColors___DefaultColors;
  if (!EKGetDefaultCalendarColors___DefaultColors)
  {
    pthread_mutex_lock(&EKGetDefaultCalendarColors___DefaultColorsLock);
    if (!EKGetDefaultCalendarColors___DefaultColors)
    {
      v1[0] = xmmword_1E56CE0D0;
      v1[1] = *(_OWORD *)&off_1E56CE0E0;
      v1[2] = xmmword_1E56CE0F0;
      int v2 = @"#A2845E";
      EKGetDefaultCalendarColors___DefaultColors = (uint64_t)CFArrayCreate(0, (const void **)v1, 7, MEMORY[0x1E4F1D510]);
    }
    pthread_mutex_unlock(&EKGetDefaultCalendarColors___DefaultColorsLock);
    return EKGetDefaultCalendarColors___DefaultColors;
  }
  return result;
}

uint64_t EKGetBrightonCalendarColors()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  uint64_t result = EKGetBrightonCalendarColors___DefaultColors;
  if (!EKGetBrightonCalendarColors___DefaultColors)
  {
    pthread_mutex_lock(&EKGetBrightonCalendarColors___DefaultColorsLock);
    if (!EKGetBrightonCalendarColors___DefaultColors)
    {
      v1[0] = xmmword_1E56CE108;
      v1[1] = *(_OWORD *)&off_1E56CE118;
      v1[2] = xmmword_1E56CE128;
      int v2 = @"#882F00";
      EKGetBrightonCalendarColors___DefaultColors = (uint64_t)CFArrayCreate(0, (const void **)v1, 7, MEMORY[0x1E4F1D510]);
    }
    pthread_mutex_unlock(&EKGetBrightonCalendarColors___DefaultColorsLock);
    return EKGetBrightonCalendarColors___DefaultColors;
  }
  return result;
}

uint64_t EKGetWildcatDefaultCalendarColors()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  uint64_t result = EKGetWildcatDefaultCalendarColors___WildcatDefaultColors;
  if (!EKGetWildcatDefaultCalendarColors___WildcatDefaultColors)
  {
    pthread_mutex_lock(&EKGetWildcatDefaultCalendarColors___WildcatDefaultColorsLock);
    if (!EKGetWildcatDefaultCalendarColors___WildcatDefaultColors)
    {
      v1[0] = xmmword_1E56CE140;
      v1[1] = *(_OWORD *)&off_1E56CE150;
      int v2 = @"#B90E28";
      EKGetWildcatDefaultCalendarColors___WildcatDefaultColors = (uint64_t)CFArrayCreate(0, (const void **)v1, 5, MEMORY[0x1E4F1D510]);
    }
    pthread_mutex_unlock(&EKGetWildcatDefaultCalendarColors___WildcatDefaultColorsLock);
    return EKGetWildcatDefaultCalendarColors___WildcatDefaultColors;
  }
  return result;
}

uint64_t EKGetApexDefaultCalendarColors()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  uint64_t result = EKGetApexDefaultCalendarColors___ApexDefaultColors;
  if (!EKGetApexDefaultCalendarColors___ApexDefaultColors)
  {
    pthread_mutex_lock(&EKGetApexDefaultCalendarColors___ApexDefaultColorsLock);
    if (!EKGetApexDefaultCalendarColors___ApexDefaultColors)
    {
      v1[0] = xmmword_1E56CE168;
      v1[1] = *(_OWORD *)&off_1E56CE178;
      int v2 = @"#B5000D";
      EKGetApexDefaultCalendarColors___ApexDefaultColors = (uint64_t)CFArrayCreate(0, (const void **)v1, 5, MEMORY[0x1E4F1D510]);
    }
    pthread_mutex_unlock(&EKGetApexDefaultCalendarColors___ApexDefaultColorsLock);
    return EKGetApexDefaultCalendarColors___ApexDefaultColors;
  }
  return result;
}

uint64_t EKGetSnowLeopardDefaultCalendarColors()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  uint64_t result = EKGetSnowLeopardDefaultCalendarColors___SnowLeopardDefaultColors;
  if (!EKGetSnowLeopardDefaultCalendarColors___SnowLeopardDefaultColors)
  {
    pthread_mutex_lock(&EKGetSnowLeopardDefaultCalendarColors___SnowLeopardDefaultColorsLock);
    if (!EKGetSnowLeopardDefaultCalendarColors___SnowLeopardDefaultColors)
    {
      v1[0] = xmmword_1E56CE190;
      v1[1] = *(_OWORD *)off_1E56CE1A0;
      int v2 = @"#E51717";
      EKGetSnowLeopardDefaultCalendarColors___SnowLeopardDefaultColors = (uint64_t)CFArrayCreate(0, (const void **)v1, 5, MEMORY[0x1E4F1D510]);
    }
    pthread_mutex_unlock(&EKGetSnowLeopardDefaultCalendarColors___SnowLeopardDefaultColorsLock);
    return EKGetSnowLeopardDefaultCalendarColors___SnowLeopardDefaultColors;
  }
  return result;
}

__CFString *EKGetFacebookCalendarColor()
{
  return @"#3064B6";
}

void sub_190DBAC5C(_Unwind_Exception *a1)
{
}

id NSDateFromICSValueInTimeZone(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFGregorianUnits v8 = objc_opt_new();
    objc_msgSend(v8, "setYear:", objc_msgSend(v5, "year"));
    objc_msgSend(v8, "setMonth:", objc_msgSend(v5, "month"));
    objc_msgSend(v8, "setDay:", objc_msgSend(v5, "day"));
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v5;
      objc_msgSend(v8, "setHour:", objc_msgSend(v9, "hour"));
      objc_msgSend(v8, "setMinute:", objc_msgSend(v9, "minute"));
      uint64_t v10 = [v9 second];

      [v8 setSecond:v10];
    }
    [v6 setTimeZone:v7];
    uint64_t v11 = [v6 dateFromComponents:v8];
  }
  else
  {
    int v12 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      NSDateFromICSValueInTimeZone_cold_1(v12);
    }

    uint64_t v11 = 0;
  }

  return v11;
}

void sub_190DBB260(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_190DBDC4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_190DBDE34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void CalRoundWithSigFigs(unsigned int a1, double a2)
{
  if (fabs(a2) >= 2.22044605e-16)
  {
    double v4 = -a2;
    if (a2 >= 0.0) {
      double v4 = a2;
    }
    double v5 = log10(v4);
    __exp10((double)(uint64_t)(a1 - vcvtpd_s64_f64(v5)));
  }
}

uint64_t CalRoundToNearestMultiple(int a1, float a2)
{
  float v2 = a2 / (float)a1;
  float v3 = ceilf(v2 + -0.5);
  float v4 = floorf(v2 + 0.5);
  if (a2 >= 0.0) {
    float v5 = v4;
  }
  else {
    float v5 = v3;
  }
  return (int)(float)(v5 * (float)a1);
}

double CalRoundDoubleToNearestMultiple(double a1, double a2)
{
  double v4 = fabs(a2);
  if (v4 >= 2.22044605e-16) {
    return v4 * round(a1 / v4);
  }
  float v5 = +[CalFoundationLogSubsystem defaultCategory];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    CalRoundDoubleToNearestMultiple_cold_1(v5, a2, a1);
  }

  return a1;
}

id CalGenerateQualifiedIdentifierWithClassAndSubdomain(objc_class *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    double v4 = [MEMORY[0x1E4F28B50] bundleForClass:a1];
    float v5 = [v4 bundleIdentifier];
    id v6 = NSStringFromClass(a1);
    if (v3 && [v3 length]) {
      uint64_t v7 = [[NSString alloc] initWithFormat:@"%@.%@.%@", v5, v6, v3];
    }
    else {
      uint64_t v7 = [[NSString alloc] initWithFormat:@"%@.%@", v5, v6, v10];
    }
    CFGregorianUnits v8 = (void *)v7;
  }
  else
  {
    CFGregorianUnits v8 = 0;
  }

  return v8;
}

uint64_t doURLsEmailsPhoneNumbersMatch(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if ([v11 isEqual:v14])
  {
    uint64_t v17 = 1;
  }
  else
  {
    uint64_t v18 = [v11 stringRemovingMailto];
    uint64_t v19 = [v14 stringRemovingMailto];
    if (([v12 isEqualToString:v15] & 1) != 0
      || ([v12 isEqualToString:v19] & 1) != 0
      || ([v18 isEqualToString:v15] & 1) != 0
      || ([v18 isEqualToString:v19] & 1) != 0)
    {
      uint64_t v17 = 1;
    }
    else
    {
      uint64_t v21 = [v11 stringRemovingTel];
      uint64_t v22 = [v14 stringRemovingTel];
      BOOL v24 = (void *)v22;
      if (([v13 isEqualToString:v16] & 1) != 0
        || ([v13 isEqualToString:v22] & 1) != 0
        || ([v21 isEqualToString:v16] & 1) != 0)
      {
        uint64_t v23 = v21;
        uint64_t v17 = 1;
      }
      else
      {
        uint64_t v23 = v21;
        uint64_t v17 = [v21 isEqualToString:v24];
      }
    }
  }

  return v17;
}

uint64_t CALPreferenceMajorVersion()
{
  CFArrayRef v0 = +[CalDefaults shared];
  int v1 = [v0 objectForKey:@"iCal version"];

  uint64_t v2 = [v1 integerValue] >> 24;
  return v2;
}

uint64_t CALMajorVersionNumberFromVersion(void *a1)
{
  return [a1 integerValue] >> 24;
}

uint64_t _notificationCallback()
{
  return +[CalDistributedNotificationCenter _handleNotification:](CalDistributedNotificationCenter, "_handleNotification:");
}

void sub_190DC07EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190DC0948(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t CalEqualObjects(void *a1, void *a2)
{
  if (a1 && a2) {
    return [a1 isEqual:a2];
  }
  else {
    return a1 == a2;
  }
}

uint64_t CalEqualStrings(void *a1, void *a2)
{
  if (a1 && a2) {
    return [a1 isEqualToString:a2];
  }
  else {
    return a1 == a2;
  }
}

void sub_190DC11D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_190DC1260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_190DC1428(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190DC1548(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190DC1618(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190DC1768(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190DC1928(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190DC19F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _GetFormatAnd_d_FieldRangeFor_EEEd(void *a1, uint64_t *a2)
{
  id v3 = a1;
  double v4 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"EEEd" options:0 locale:v3];
  float v5 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"d" options:0 locale:v3];
  id v6 = _GetModifiedFormatFromFormat(v4);
  uint64_t v7 = _GetModifiedFormatFromFormat(v5);
  uint64_t v8 = [v6 rangeOfString:v7];
  *a2 = v8;
  a2[1] = v9;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL
    && (uint64_t v8 = [v6 rangeOfString:@"dd"], *a2 = v8, a2[1] = v9, v8 == 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v10 = [v6 rangeOfString:@"d"];
    *a2 = v10;
    a2[1] = v9;
    if (v10 < 0) {
      goto LABEL_34;
    }
  }
  else
  {
    uint64_t v10 = v8;
    if (v8 < 0) {
      goto LABEL_34;
    }
  }
  unint64_t v11 = v9 + v10;
  unint64_t v12 = [v6 length];
  if (v11 < v12 && [v6 characterAtIndex:v11] == 100) {
    ++v11;
  }
  if (v11 < v12
    && [v6 characterAtIndex:v11 - 1] == 100
    && [v6 characterAtIndex:v11] == 46)
  {
    ++v11;
  }
  uint64_t v18 = v4;
  if (v10)
  {
    if ([v6 characterAtIndex:v10 - 1] == 100) {
      *a2 = --v10;
    }
    if ((unint64_t)v10 >= 2)
    {
      int v13 = [v6 characterAtIndex:v10 - 1];
      if (v13 == 8208 || v13 == 45) {
        --v10;
      }
    }
  }
  char v14 = 0;
  while (1)
  {
    uint64_t v15 = v10 - 1;
    if (v10 < 1) {
      break;
    }
    UChar32 v16 = [v6 characterAtIndex:v10 - 1];
    if (u_isUWhiteSpace(v16) || u_ispunct(v16))
    {
      if ((v14 & 1) == 0) {
        goto LABEL_33;
      }
      goto LABEL_32;
    }
    if (u_isUAlphabetic(v16))
    {
      char v14 = 1;
      --v10;
      if ((v16 - 65) > 0x39) {
        continue;
      }
      uint64_t v10 = v15;
      if ((v16 - 97) >= 0xFFFFFFFA) {
        continue;
      }
    }
    goto LABEL_33;
  }
  if ((v14 & 1) == 0) {
    goto LABEL_33;
  }
  uint64_t v10 = 0;
LABEL_32:
  *a2 = v10;
LABEL_33:
  a2[1] = v11 - *a2;
  double v4 = v18;
LABEL_34:

  return v4;
}

void sub_190DC34F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _GetModifiedFormatFromFormat(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x1E4F28E78] stringWithCapacity:15];
  [v2 insertString:v1 atIndex:0];
  uint64_t v3 = [v2 length];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    int v6 = 0;
    do
    {
      __int16 v12 = 0;
      int v7 = [v2 characterAtIndex:v5];
      if (v7 == 39)
      {
        v6 ^= 1u;
      }
      else
      {
        BOOL v9 = (v7 - 65) < 0x3A && (v7 - 97) < 0xFFFFFFFA;
        if ((v6 & v9) == 1)
        {
          __int16 v12 = v7 - 8257;
          int v6 = 1;
          uint64_t v10 = [NSString stringWithCharacters:&v12 length:1];
          objc_msgSend(v2, "replaceCharactersInRange:withString:", v5, 1, v10);
        }
      }
      ++v5;
    }
    while (v4 != v5);
  }

  return v2;
}

void sub_190DC39EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t CalGetRGBAFromString(void *a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, int *a5)
{
  id v9 = a1;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  if ([v9 length])
  {
    if ([v9 characterAtIndex:0] == 35)
    {
      uint64_t v10 = [v9 length];
      if (v10 == 9 || [v9 length] == 7)
      {
        unint64_t v11 = objc_msgSend(v9, "substringWithRange:", 1, 2);
        __int16 v12 = [MEMORY[0x1E4F28FE8] scannerWithString:v11];
        [v12 scanHexInt:(char *)&v23 + 4];

        if (HIDWORD(v23) <= 0xFF)
        {
          char v14 = objc_msgSend(v9, "substringWithRange:", 3, 2);
          uint64_t v15 = [MEMORY[0x1E4F28FE8] scannerWithString:v14];
          [v15 scanHexInt:&v23];

          if (v23 <= 0xFF)
          {
            UChar32 v16 = objc_msgSend(v9, "substringWithRange:", 5, 2);
            uint64_t v19 = [MEMORY[0x1E4F28FE8] scannerWithString:v16];
            [v19 scanHexInt:(char *)&v22 + 4];

            if (HIDWORD(v22) <= 0xFF)
            {
              if (v10 == 9)
              {
                uint64_t v17 = objc_msgSend(v9, "substringWithRange:", 7, 2);
                BOOL v20 = [MEMORY[0x1E4F28FE8] scannerWithString:v17];
                [v20 scanHexInt:&v22];

                int v21 = v22;
                if (v22 > 0xFF)
                {
                  uint64_t v13 = 0;
                  goto LABEL_12;
                }
              }
              else
              {
                uint64_t v17 = 0;
                int v21 = 255;
                LODWORD(v22) = 255;
              }
              if (a2) {
                *a2 = HIDWORD(v23);
              }
              if (a3) {
                *a3 = v23;
              }
              if (a4) {
                *a4 = HIDWORD(v22);
              }
              if (a5) {
                *a5 = v21;
              }
              uint64_t v13 = 1;
              goto LABEL_12;
            }
            uint64_t v13 = 0;
LABEL_11:
            uint64_t v17 = 0;
LABEL_12:

            goto LABEL_13;
          }
          uint64_t v13 = 0;
        }
        else
        {
          uint64_t v13 = 0;
          char v14 = 0;
        }
        UChar32 v16 = 0;
        goto LABEL_11;
      }
    }
  }
  uint64_t v13 = 0;
LABEL_13:

  return v13;
}

uint64_t CalUnsignedIntDiff(unsigned int a1, unsigned int a2)
{
  if (a1 <= a2) {
    return a2 - a1;
  }
  else {
    return a1 - a2;
  }
}

BOOL CalColorsAreAlmostEqual(void *a1, void *a2)
{
  id v3 = a2;
  unsigned int v13 = 0;
  unsigned int v12 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  int RGBAFromString = CalGetRGBAFromString(a1, &v13, &v12, (_DWORD *)&v11 + 1, 0);
  BOOL v5 = 0;
  if (RGBAFromString)
  {
    if (!CalGetRGBAFromString(v3, &v11, (_DWORD *)&v10 + 1, &v10, 0)) {
      goto LABEL_12;
    }
    unsigned int v6 = v13 - v11;
    if (v13 <= v11) {
      unsigned int v6 = v11 - v13;
    }
    if (v6 > 1) {
      goto LABEL_12;
    }
    unsigned int v7 = v12 - HIDWORD(v10);
    if (v12 <= HIDWORD(v10)) {
      unsigned int v7 = HIDWORD(v10) - v12;
    }
    if (v7 <= 1)
    {
      unsigned int v8 = HIDWORD(v11) - v10;
      if (HIDWORD(v11) <= v10) {
        unsigned int v8 = v10 - HIDWORD(v11);
      }
      BOOL v5 = v8 < 2;
    }
    else
    {
LABEL_12:
      BOOL v5 = 0;
    }
  }

  return v5;
}

uint64_t CalColorStringRepresentation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"#%02X%02X%02X%02X", a1, a2, a3, a4);
}

void CalFlagForProfilingStart(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    BOOL v5 = _startTimes();
    unsigned int v6 = [MEMORY[0x1E4F1C9C8] date];
    [v5 setObject:v6 forKey:v4];

    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      CalFlagForProfilingStart_cold_1();
    }
  }
}

id _startTimes()
{
  if (_startTimes_onceToken != -1) {
    dispatch_once(&_startTimes_onceToken, &__block_literal_global_29);
  }
  CFArrayRef v0 = (void *)_startTimes_startTimes;

  return v0;
}

void CalFlagForProfilingEnd(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    BOOL v5 = _startTimes();
    unsigned int v6 = [v5 objectForKey:v4];

    if (v6)
    {
      unsigned int v7 = NSString;
      unsigned int v8 = [MEMORY[0x1E4F1C9C8] date];
      [v8 timeIntervalSinceDate:v6];
      objc_msgSend(v7, "stringWithFormat:", @" (%g s)", v9);
      uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v10 = &stru_1EE0C39E0;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      CalFlagForProfilingEnd_cold_1();
    }
  }
}

void CalFlagForProfilingPoint(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    BOOL v5 = _startTimes();
    unsigned int v6 = [v5 objectForKey:v4];

    if (v6)
    {
      unsigned int v7 = NSString;
      unsigned int v8 = [MEMORY[0x1E4F1C9C8] date];
      [v8 timeIntervalSinceDate:v6];
      objc_msgSend(v7, "stringWithFormat:", @" (%g s)", v9);
      uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v10 = &stru_1EE0C39E0;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      CalFlagForProfilingPoint_cold_1();
    }
  }
}

void CalPerfLogStart(NSObject *a1)
{
  if (os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG)) {
    CalPerfLogStart_cold_1();
  }
}

void CalPerfLogEnd(NSObject *a1)
{
  if (os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG)) {
    CalPerfLogEnd_cold_1();
  }
}

void CalPerfLogPoint(NSObject *a1)
{
  if (os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG)) {
    CalPerfLogPoint_cold_1();
  }
}

uint64_t ___startTimes_block_invoke()
{
  _startTimes_startTimes = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

uint64_t sub_190DC9368()
{
  uint64_t v1 = ;

  return v1;
}

void sub_190DC98D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location,char a25)
{
  objc_sync_exit(v25);
  _Unwind_Resume(a1);
}

void sub_190DC9A70(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t CalDarwinNotificationListener_ObservationCallback(uint64_t a1, void *a2)
{
  if (a2) {
    return objc_msgSend(a2, "_notificationWithNameReceived:");
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_4(uint64_t a1)
{
  return *(void *)(a1 + 40);
}

void sub_190DCDAAC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190DCDB54(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void *EKWeakLinkSymbol(const char *a1, unint64_t a2)
{
  uint64_t result = (void *)__HandleForSource(a2);
  if (result)
  {
    return dlsym(result, a1);
  }
  return result;
}

const void *__HandleForSource(unint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)&__HandlesLock);
  CFDictionaryRef Mutable = (const __CFDictionary *)__Handles;
  if (!__Handles)
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
    __Handles = (uint64_t)Mutable;
  }
  CFTimeZoneRef Value = CFDictionaryGetValue(Mutable, (const void *)a1);
  if (!Value)
  {
    if (a1 <= 0x15
      && ([&stru_1EE0C39E0 stringByAppendingString:off_1E56CE710[a1]],
          (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v5 = v4;
      unsigned int v6 = dlopen((const char *)[v5 UTF8String], 1);
      if (v6)
      {
        CFTimeZoneRef Value = v6;
        CFDictionarySetValue((CFMutableDictionaryRef)__Handles, (const void *)a1, v6);
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
      id v5 = 0;
    }
    unsigned int v7 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __HandleForSource_cold_1(a1, v7);
    }

    CFTimeZoneRef Value = 0;
    goto LABEL_12;
  }
LABEL_13:
  os_unfair_lock_unlock((os_unfair_lock_t)&__HandlesLock);
  return Value;
}

id EKWeakLinkClass(void *a1, unint64_t a2)
{
  id v3 = a1;
  if (__HandleForSource(a2))
  {
    id v4 = NSClassFromString(v3);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

id *EKWeakLinkStringConstant(const char *a1, unint64_t a2)
{
  id v3 = (id *)__HandleForSource(a2);
  if (v3)
  {
    id v3 = (id *)dlsym(v3, a1);
    if (v3) {
      id v3 = (id *)*v3;
    }
  }

  return v3;
}

__CFString *__CalSystemRootDirectory()
{
  return &stru_1EE0C39E0;
}

void sub_190DD1160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void CalAddStateCaptureBlock(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v3 = v4;
  os_state_add_handler();
}

_DWORD *__CalAddStateCaptureBlock_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (*(_DWORD *)(a2 + 16) == 3)
    {
      uint64_t v3 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      if (v3)
      {
        id v4 = (void *)v3;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_18;
        }
        id v5 = v4;
        if ([v5 canBeConvertedToEncoding:1])
        {
          if ((unint64_t)[v5 length] > 0x7F09)
          {
            unsigned int v6 = +[CalFoundationLogSubsystem defaultCategory];
            if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
              __CalAddStateCaptureBlock_block_invoke_cold_3(v5, v6);
            }

            id v7 = [v5 substringToIndex:32522];
            goto LABEL_17;
          }
        }
        else
        {
          unint64_t v10 = [v5 lengthOfBytesUsingEncoding:2483028224];
          if (v10 > 0x7F09)
          {
            uint64_t v11 = v10;
            unsigned int v12 = +[CalFoundationLogSubsystem defaultCategory];
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
              __CalAddStateCaptureBlock_block_invoke_cold_4(v11, v12);
            }

            unsigned int v13 = malloc_type_malloc(0x7F0AuLL, 0x1459434CuLL);
            uint64_t v21 = 0;
            objc_msgSend(v5, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v13, 32522, &v21, 2483028224, 1, 0, objc_msgSend(v5, "length"), 0);
            id v14 = [NSString alloc];
            id v7 = (id)[v14 initWithBytesNoCopy:v13 length:v21 encoding:2483028224 freeWhenDone:1];
            goto LABEL_17;
          }
        }
        id v7 = v5;
LABEL_17:
        id v4 = v7;

LABEL_18:
        id v20 = 0;
        uint64_t v15 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v4 format:200 options:0 error:&v20];
        id v16 = v20;
        if (v15)
        {
          unsigned int v17 = [v15 length];
          uint64_t v18 = malloc_type_calloc(1uLL, v17 + 200, 0xD0761611uLL);
          if (v18)
          {
            unsigned int v8 = v18;
            __strlcpy_chk();
            _DWORD *v8 = 1;
            v8[1] = v17;
            objc_msgSend(v15, "getBytes:range:", v8 + 50, 0, v17);
LABEL_26:

            return v8;
          }
          uint64_t v19 = +[CalFoundationLogSubsystem defaultCategory];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            __CalAddStateCaptureBlock_block_invoke_cold_2(a1, v19);
          }
        }
        else
        {
          uint64_t v19 = +[CalFoundationLogSubsystem defaultCategory];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            __CalAddStateCaptureBlock_block_invoke_cold_1(a1, (uint64_t)v16, v19);
          }
        }

        unsigned int v8 = 0;
        goto LABEL_26;
      }
    }
  }
  return 0;
}

uint64_t _EKRecurrenceByMonthFilter(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = a1;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "unsignedIntegerValue", (void)v10);
        if (v8 == [v3 month])
        {
          uint64_t v5 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

BOOL _EKRecurrenceByMonthDayFilterPinned(void *a1, void *a2)
{
  return _EKRecurrenceByMonthDayFilterInternal(a1, a2, 1);
}

BOOL _EKRecurrenceByMonthDayFilter(void *a1, void *a2)
{
  return _EKRecurrenceByMonthDayFilterInternal(a1, a2, 0);
}

BOOL _EKRecurrenceByDayMaskFilter(unint64_t a1, void *a2)
{
  return ((1 << ([a2 dayOfWeek] - 1)) & a1) != 0;
}

uint64_t _EKRecurrenceByDayMaskFromArrayByDayItems(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 count];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    for (uint64_t i = 0; i != v3; ++i)
    {
      uint64_t v6 = [v1 objectAtIndex:i];
      if (![v6 weekNumber] || objc_msgSend(v6, "weekNumber") == 1) {
        v4 |= 1 << ([v6 dayOfTheWeek] - 1);
      }
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t _EKRecurrenceApplyFiltersToSingleDate(void *a1, uint64_t a2, unint64_t a3, void *a4, char a5)
{
  id v9 = a1;
  id v10 = a4;
  if (a5)
  {
    if (!a3)
    {
      uint64_t v11 = 1;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v11 = 1;
    if (([v9 isEqual:v10] & 1) != 0 || !a3) {
      goto LABEL_9;
    }
  }
  long long v12 = (void *)(a2 + 8);
  unint64_t v13 = 1;
  do
  {
    uint64_t v14 = ((uint64_t (*)(void, id))*(v12 - 1))(*v12, v9);
    uint64_t v11 = v14;
    if (v13 >= a3) {
      break;
    }
    ++v13;
    v12 += 2;
  }
  while ((v14 & 1) != 0);
LABEL_9:

  return v11;
}

BOOL _EKRecurrenceRangeFilter(uint64_t a1, void *a2)
{
  [a2 absoluteTime];
  double v4 = v3;
  [*(id *)a1 absoluteTime];
  double v6 = v5;
  [*(id *)(a1 + 8) absoluteTime];
  if (v4 < v6) {
    return 0;
  }
  double v9 = fabs(v7);
  return v4 < v7 || v9 < 2.22044605e-16 || *(void *)(a1 + 16) != 0;
}

void _InsertAbsoluteTimeIntoArrayAtIndex(void *a1, CFAbsoluteTime a2)
{
  theArray = a1;
  CFDateRef v3 = CFDateCreate(0, a2);
  if (v3)
  {
    CFDateRef v4 = v3;
    CFArrayInsertValueAtIndex(theArray, 0, v3);
    CFRelease(v4);
  }
}

void _EKRecurrenceApplyBySetPosToRange(void *a1, void *a2, CFIndex *a3, void *a4, void *a5, void *a6, uint64_t a7, void *a8)
{
  CFArrayRef theArray = a1;
  id v13 = a2;
  id v34 = a4;
  id v38 = a5;
  id v35 = a6;
  CFIndex v32 = a3[1];
  uint64_t v14 = [v13 count];
  if (a3[1] >= 1)
  {
    uint64_t v15 = v14;
    uint64_t v16 = 0;
    for (CFIndex i = *a3; i < *a3 + v29; ++i)
    {
      if (!v38 && !a7) {
        goto LABEL_17;
      }
      ValueAtIndex = CFArrayGetValueAtIndex(theArray, i);
      double v19 = MEMORY[0x192FD7DD0](ValueAtIndex);
      [v35 absoluteTime];
      if (vabdd_f64(v19, v20) < 2.22044605e-16) {
        goto LABEL_17;
      }
      [v34 absoluteTime];
      if (v38 && v19 >= v21)
      {
        [v38 absoluteTime];
        if (v19 >= v22 && !*a8) {
          goto LABEL_17;
        }
      }
      else if (v19 < v21)
      {
        goto LABEL_17;
      }
      if (v15 >= 1)
      {
        uint64_t v23 = 0;
        CFIndex v24 = i - *a3 + v16;
        CFIndex v25 = v24 + 1;
        CFIndex v26 = v24 - v32;
        while (1)
        {
          uint64_t v27 = [v13 objectAtIndex:v23];
          int v28 = [v27 intValue];

          if (v25 == v28 || v26 == v28) {
            break;
          }
          if (v15 == ++v23) {
            goto LABEL_17;
          }
        }
        if (v38)
        {
          if (*a8)
          {
            [v38 absoluteTime];
            if (v19 >= v30) {
              --*a8;
            }
          }
        }
        uint64_t v31 = a7 - 1;
        if (!a7) {
          uint64_t v31 = 0;
        }
        a7 = v31;
        uint64_t v29 = a3[1];
        continue;
      }
LABEL_17:
      CFArrayRemoveValueAtIndex(theArray, i);
      uint64_t v29 = a3[1] - 1;
      a3[1] = v29;
      --i;
      ++v16;
    }
  }
}

void _EKRecurrenceByDayGenerator(void *a1, CFRange *a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7, void *a8, void *a9, uint64_t a10, unint64_t a11, char a12)
{
  id v74 = a1;
  id v17 = a3;
  id v18 = a7;
  id v19 = a8;
  id v68 = a9;
  id v20 = a6;
  id v21 = a4;
  v77 = v20;
  uint64_t v78 = [v20 count];
  id v22 = v17;
  uint64_t v23 = [v21 calendarDateByAddingDays:-1];

  [v22 absoluteTime];
  double v25 = v24;
  [v23 absoluteTime];
  if (v25 >= v26)
  {
    uint64_t v66 = 0;
    int v28 = 0;
    BOOL v52 = v22;
  }
  else
  {
    id v67 = v19;
    uint64_t v27 = 0;
    int v28 = 0;
    uint64_t v75 = 0;
    unint64_t v71 = 2;
    long long v72 = v18;
    long long v69 = v22;
    long long v70 = v23;
    do
    {
      uint64_t v29 = v27;
      uint64_t v30 = objc_msgSend(v22, "dayOfWeek", v67, v68);
      unint64_t v31 = v30;
      unint64_t v32 = v71;
      if (!v27) {
        unint64_t v32 = v30;
      }
      unint64_t v71 = v32;
      v33 = [v22 calendarDateByAddingMonths:1];
      uint64_t v27 = [v33 calendarDateByAddingDays:-1];

      uint64_t v34 = [v27 dayOfWeek];
      if (v78)
      {
        unint64_t v35 = v34;
        for (uint64_t i = 0; i != v78; ++i)
        {
          v37 = [v77 objectAtIndex:i];
          if ([v37 weekNumber])
          {
            uint64_t v38 = [v37 weekNumber];
            unint64_t v39 = [v37 dayOfTheWeek];
            uint64_t v40 = [v37 dayOfTheWeek];
            uint64_t v41 = 7 * [v37 weekNumber];
            uint64_t v42 = v40 - v31;
            if (v39 >= v31) {
              uint64_t v42 = v40 - v31 - 7;
            }
            uint64_t v43 = v40 - v35;
            if (v39 <= v35) {
              uint64_t v43 = v40 - v35 + 7;
            }
            if (v38 >= 0)
            {
              v44 = v22;
            }
            else
            {
              uint64_t v42 = v43;
              v44 = v27;
            }
            v45 = [v44 calendarDateByAddingDays:v42 + v41];

            [v45 absoluteTime];
            double v47 = v46;
            [v22 absoluteTime];
            if (v47 >= v48)
            {
              [v45 absoluteTime];
              double v50 = v49;
              [v27 absoluteTime];
              if (v50 <= v51) {
                _EKRecurrenceResultsAddValueIfNotPresent(v74, a2, v45, a10, a11, v72, a12);
              }
            }
            int v28 = v45;
          }
          else
          {
            v75 |= 1 << ([v37 dayOfTheWeek] - 1);
          }
        }
      }
      BOOL v52 = [v22 calendarDateByAddingMonths:1];

      [v52 absoluteTime];
      double v54 = v53;
      uint64_t v23 = v70;
      [v70 absoluteTime];
      id v22 = v52;
    }
    while (v54 < v55);
    uint64_t v79 = v27;
    uint64_t v56 = v75;
    if (v75)
    {
      unint64_t v57 = 1;
      id v18 = v72;
      do
      {
        unint64_t v76 = v56;
        if (v56)
        {
          uint64_t v58 = 7;
          if (v57 >= v71) {
            uint64_t v58 = 0;
          }
          v59 = [v69 calendarDateByAddingDays:v57 - v71 + v58];

          [v59 absoluteTime];
          double v61 = v60;
          [v70 absoluteTime];
          if (v61 <= v62)
          {
            do
            {
              _EKRecurrenceResultsAddValueIfNotPresent(v74, a2, v59, a10, a11, v72, a12);
              int v28 = [v59 calendarDateByAddingDays:7];

              [v28 absoluteTime];
              double v64 = v63;
              [v70 absoluteTime];
              v59 = v28;
            }
            while (v64 <= v65);
          }
          else
          {
            int v28 = v59;
          }
        }
        ++v57;
        v56 >>= 1;
      }
      while (v76 > 1);
      id v22 = v69;
      uint64_t v23 = v70;
      uint64_t v66 = v27;
      id v19 = v67;
    }
    else
    {
      id v18 = v72;
      id v19 = v67;
      id v22 = v69;
      uint64_t v66 = v79;
    }
  }
}

void _EKRecurrenceByMonthDayGeneratorPinned(void *a1, CFRange *a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7, void *a8, void *a9, uint64_t a10, unint64_t a11, char a12)
{
}

void _EKRecurrenceByMonthDayGenerator(void *a1, CFRange *a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7, void *a8, void *a9, uint64_t a10, unint64_t a11, char a12)
{
}

uint64_t _EKRecurrenceApplyGenerator(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, unsigned int a9, unint64_t *a10, void *a11, char a12)
{
  id v17 = a1;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  uint64_t v41 = [v17 count];
  uint64_t v42 = 0;
  if (a9 == 4) {
    [v21 calendarDateByAddingYears:1];
  }
  else {
  id v22 = [v21 calendarDateByAddingMonths:1];
  }
  double v24 = *(void (**)(id, uint64_t *, id, void *, void, uint64_t, id, id, id, uint64_t, uint64_t, char))a2;
  uint64_t v23 = *(void *)(a2 + 8);
  double v25 = v18;
  v24(v17, &v41, v21, v22, a9, v23, v18, v19, v20, a3, a4, a12);
  if (a10)
  {
    unint64_t v26 = *a10;
    if (*a10)
    {
      uint64_t v27 = v42;
      if (v42 <= v26
        || (v43.location = v26 + v41,
            v43.CFIndex length = v42 - v26,
            CFArrayReplaceValues((CFMutableArrayRef)v17, v43, 0, 0),
            unint64_t v26 = *a10,
            uint64_t v42 = v26,
            (uint64_t v27 = v26) != 0))
      {
        *a10 = v26 - v27;
      }
    }
  }
  if (a11 && *a11 && v42 >= 1)
  {
    uint64_t v28 = v41 + 1;
    while (1)
    {
      uint64_t v29 = [v17 objectAtIndexedSubscript:v28 - 1];
      [v29 timeIntervalSinceReferenceDate];
      double v31 = v30;
      unint64_t v32 = [v20 date];
      [v32 timeIntervalSinceReferenceDate];
      double v34 = v33;

      if (v31 >= v34 && (*a11)-- == 1) {
        break;
      }

      if (v28++ >= v42 + v41) {
        goto LABEL_18;
      }
    }
    objc_msgSend(v17, "removeObjectsInRange:", v28, v42 + v41 - v28);
  }
LABEL_18:
  uint64_t v37 = v42;

  return v37;
}

void _AppendAbsoluteTimeToArray(void *a1, double a2)
{
  CFArrayRef theArray = a1;
  CFDateRef v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:a2];
  if (v3) {
    CFArrayAppendValue(theArray, v3);
  }
}

void _EKRecurrenceByYearDayGenerator(void *a1, CFRange *a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7, void *a8, void *a9, uint64_t a10, unint64_t a11, char a12)
{
  id v37 = a1;
  id v17 = a3;
  id v35 = a4;
  id v18 = a7;
  id v34 = a8;
  id v33 = a9;
  id v19 = a6;
  uint64_t v20 = [v19 count];
  id v21 = v17;
  uint64_t v22 = [v21 daysInYear];
  uint64_t v23 = v21;
  if (v20)
  {
    uint64_t v24 = v22;
    uint64_t v25 = 0;
    uint64_t v26 = v22 + 1;
    uint64_t v23 = v21;
    do
    {
      uint64_t v27 = objc_msgSend(v19, "objectAtIndex:", v25, v33, v34, v35);
      int v28 = [v27 intValue];

      if (v28 >= 0) {
        uint64_t v29 = 0;
      }
      else {
        uint64_t v29 = v26;
      }
      uint64_t v30 = v29 + v28;
      if (v30 >= 1 && v30 <= v24)
      {
        unint64_t v32 = [v21 calendarDateByAddingDays:v30 - 1];

        _EKRecurrenceResultsAddValueIfNotPresent(v37, a2, v32, a10, a11, v18, a12);
        uint64_t v23 = v32;
      }
      ++v25;
    }
    while (v20 != v25);
  }
}

uint64_t _EKRecurrenceByDayFilter(void *a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [a1 count];
  uint64_t v5 = [v3 dayOfWeek];
  if (v4)
  {
    unint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    unint64_t v9 = 1;
    while (1)
    {
      id v10 = [a1 objectAtIndex:v9 - 1];
      if ([v10 dayOfTheWeek] == v6)
      {
        if (![v10 weekNumber])
        {

          uint64_t v16 = 1;
          goto LABEL_25;
        }
        if ([v10 weekNumber] < 1)
        {
          if (!v8)
          {
            id v17 = [v3 calendarDateForEndOfMonth];
            unint64_t v18 = [v17 dayOfWeek];
            uint64_t v19 = 7;
            if (v18 >= v6) {
              uint64_t v19 = 0;
            }
            uint64_t v20 = [v17 calendarDateByAddingDays:v18 - v6 + v19];

            uint64_t v8 = [v20 differenceInDays:v3] / 7 + 1;
          }
          BOOL v15 = [v10 weekNumber] + v8 == 0;
        }
        else
        {
          if (!v7)
          {
            uint64_t v11 = [v3 calendarDateForMonth];
            unint64_t v12 = [v11 dayOfWeek];
            uint64_t v13 = 7;
            if (v6 >= v12) {
              uint64_t v13 = 0;
            }
            uint64_t v14 = [v11 calendarDateByAddingDays:v6 - v12 + v13];

            uint64_t v7 = [v3 differenceInDays:v14] / 7 + 1;
          }
          BOOL v15 = [v10 weekNumber] == v7;
        }
        uint64_t v16 = v15;
      }
      else
      {
        uint64_t v16 = 0;
      }

      if (v9 < v4)
      {
        ++v9;
        if (!v16) {
          continue;
        }
      }
      goto LABEL_25;
    }
  }
  uint64_t v16 = 0;
LABEL_25:

  return v16;
}

BOOL _EKRecurrenceByWeekNoFilter(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 weekOfYear];
  uint64_t v5 = [*(id *)(a1 + 8) count];
  if (v5)
  {
    unint64_t v6 = v5;
    uint64_t v7 = 0;
    unint64_t v8 = 1;
    do
    {
      unint64_t ValueAtIndex = (unint64_t)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 8), v8 - 1);
      if ((ValueAtIndex & 0x8000000000000000) != 0)
      {
        if (!v7) {
          uint64_t v7 = [v3 weeksInYear];
        }
        ValueAtIndex += v7 + 1;
      }
      BOOL v10 = ValueAtIndex == v4;
      if (v8 >= v6) {
        break;
      }
      ++v8;
    }
    while (ValueAtIndex != v4);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

BOOL _EKRecurrenceByMonthDayFilterInternal(void *a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = [a1 count];
  if (v6)
  {
    unint64_t v7 = v6;
    uint64_t v8 = 0;
    unint64_t v9 = 1;
    while (1)
    {
      BOOL v10 = [a1 objectAtIndex:v9 - 1];
      int v11 = [v10 intValue];
      uint64_t v12 = v11;
      if (v11 < 0) {
        break;
      }
      if (a3) {
        goto LABEL_9;
      }
LABEL_13:
      uint64_t v13 = [v5 day];
      BOOL v14 = v12 == v13;

      if (v9 < v7)
      {
        ++v9;
        if (v12 != v13) {
          continue;
        }
      }
      goto LABEL_17;
    }
    if (!v8) {
      uint64_t v8 = [v5 daysInMonth];
    }
    v12 += v8 + 1;
    if (!a3) {
      goto LABEL_13;
    }
LABEL_9:
    if (!v8) {
      uint64_t v8 = [v5 daysInMonth];
    }
    if (v12 >= v8) {
      uint64_t v12 = v8;
    }
    goto LABEL_13;
  }
  BOOL v14 = 0;
LABEL_17:

  return v14;
}

void _EKRecurrenceResultsAddValueIfNotPresent(void *a1, CFRange *a2, void *a3, uint64_t a4, unint64_t a5, void *a6, char a7)
{
  CFArrayRef theArray = a1;
  id v13 = a3;
  id v14 = a6;
  if ((a7 & 1) != 0 || ([v13 isEqual:v14] & 1) == 0)
  {
    CFIndex location = a2->location;
    CFIndex length = a2->length;
    if (!a5 || _EKRecurrenceApplyFiltersToSingleDate(v13, a4, a5, v14, a7))
    {
      [v13 absoluteTime];
      CFDateRef v18 = CFDateCreate(0, v17);
      CFIndex v19 = CFArrayBSearchValues(theArray, *a2, v18, MEMORY[0x1E4F1C228], 0);
      CFIndex v20 = v19;
      if (v19 >= length + location
        || v19 < 0
        || (unint64_t ValueAtIndex = CFArrayGetValueAtIndex(theArray, v19), !CFEqual(ValueAtIndex, v18)))
      {
        if (v20 >= length + location) {
          CFIndex v22 = length + location;
        }
        else {
          CFIndex v22 = v20;
        }
        CFArrayInsertValueAtIndex(theArray, v22, v18);
        ++a2->length;
      }
      CFRelease(v18);
    }
  }
}

void _EKRecurrenceByMonthDayGeneratorInternal(void *a1, CFRange *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, uint64_t a9, unint64_t a10, unsigned __int8 a11, char a12)
{
  id v47 = a1;
  id v18 = a3;
  id v19 = a4;
  id v46 = a6;
  id v43 = a7;
  id v42 = a8;
  id v20 = a5;
  uint64_t v21 = [v20 count];
  id v22 = v18;
  [v22 absoluteTime];
  double v24 = v23;
  v44 = v19;
  [v19 absoluteTime];
  uint64_t v41 = v22;
  uint64_t v25 = 0;
  if (v24 < v26)
  {
    uint64_t v27 = v22;
    do
    {
      uint64_t v28 = objc_msgSend(v27, "daysInMonth", v41, v42, v43);
      if (v21)
      {
        uint64_t v29 = v28;
        uint64_t v30 = 0;
        uint64_t v31 = v28 + 1;
        do
        {
          unint64_t v32 = [v20 objectAtIndex:v30];
          int v33 = [v32 intValue];

          if (v33 >= 0) {
            uint64_t v34 = 0;
          }
          else {
            uint64_t v34 = v31;
          }
          uint64_t v35 = v34 + v33;
          if ((a11 & (v35 > v29)) != 0) {
            uint64_t v35 = v29;
          }
          if (v35 >= 1 && v35 <= v29)
          {
            id v37 = [v27 calendarDateByAddingDays:v35 - 1];

            _EKRecurrenceResultsAddValueIfNotPresent(v47, a2, v37, a9, a10, v46, a12);
            uint64_t v25 = v37;
          }
          ++v30;
        }
        while (v21 != v30);
      }
      id v22 = [v27 calendarDateByAddingMonths:1];

      [v22 absoluteTime];
      double v39 = v38;
      [v44 absoluteTime];
      uint64_t v27 = v22;
    }
    while (v39 < v40);
  }
}

void sub_190DD5E70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_190DD60B8(_Unwind_Exception *a1)
{
}

void sub_190DD60D8(void *a1)
{
}

double CalTimeIntervalConvertToNanoSeconds()
{
  return 0.0;
}

void sub_190DD707C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190DD87B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_190DD8994(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_190DD9010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void CalDoNotCallThisInitializer()
{
  id v0 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Usage of this initializer is forbidden." userInfo:0];
  objc_exception_throw(v0);
}

void CalSubclassShouldImplement()
{
  id v0 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"It is intended for this code to be implemented by subclasses." userInfo:0];
  objc_exception_throw(v0);
}

void CalUnimplemented()
{
  id v0 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"This code has been left unimplemented." userInfo:0];
  objc_exception_throw(v0);
}

__CFString *CalBooleanAsString(int a1)
{
  if (a1) {
    return @"YES";
  }
  else {
    return @"NO";
  }
}

uint64_t CalConvertNSIntegerToNSUInteger(uint64_t a1)
{
  uint64_t v1 = a1;
  if (a1 < 0)
  {
    uint64_t v2 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      CalConvertNSIntegerToNSUInteger_cold_1(v1, v2);
    }

    return 0;
  }
  return v1;
}

uint64_t CalConvertNSUIntegerToNSInteger(uint64_t a1)
{
  uint64_t v1 = a1;
  if (a1 < 0)
  {
    uint64_t v2 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      CalConvertNSUIntegerToNSInteger_cold_1(v1, v2);
    }

    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v1;
}

uint64_t CalSetForceReminderBridgeEnabled(uint64_t result)
{
  _forceReminderBridgeEnabled = result;
  return result;
}

BOOL CalIsReminderBridgeEnabled()
{
  return _forceReminderBridgeEnabled != 2;
}

uint64_t CalMonotonicTime()
{
  uint64_t result = override;
  if (!override) {
    return mach_absolute_time();
  }
  return result;
}

uint64_t CalTimeSetOverride(uint64_t result)
{
  override = result;
  return result;
}

uint64_t CalContinuousTime()
{
  uint64_t result = override;
  if (!override) {
    return mach_continuous_time();
  }
  return result;
}

uint64_t CalApproximateContinuousTime()
{
  uint64_t result = override;
  if (!override) {
    return mach_continuous_approximate_time();
  }
  return result;
}

double CalContinuousIntervalToNSTimeInterval(unint64_t a1)
{
  if (override) {
    return (double)a1 * 0.5;
  }
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  LODWORD(v4) = info.denom;
  LODWORD(v3) = info.numer;
  return (double)a1 * (double)v3 / (double)v4 / 1000000000.0;
}

unint64_t CalNSTimeIntervalToContinuousInterval(double a1)
{
  if (override)
  {
    return (unint64_t)(a1 + a1);
  }
  else
  {
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    LODWORD(v3) = info.denom;
    LODWORD(v4) = info.numer;
    return (unint64_t)(a1 * 1000000000.0 * (double)v3 / (double)v4);
  }
}

const char *CalendarFeatureFlags.domain.getter()
{
  return "Calendar";
}

const char *CalendarFeatureFlags.feature.getter()
{
  uint64_t result = "all_on";
  switch(*v0)
  {
    case 1:
      uint64_t result = "quick_feature_toggle";
      break;
    case 2:
      uint64_t result = "app_intents";
      break;
    case 3:
      uint64_t result = "app_entity_observation";
      break;
    default:
      return result;
  }
  return result;
}

BOOL static CalendarFeatureFlags.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t CalendarFeatureFlags.hash(into:)()
{
  return sub_190DE2470();
}

uint64_t CalendarFeatureFlags.hashValue.getter()
{
  return sub_190DE2480();
}

BOOL sub_190DDBF98(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_190DDBFAC()
{
  return sub_190DE2480();
}

uint64_t sub_190DDBFF4()
{
  return sub_190DE2470();
}

uint64_t sub_190DDC020()
{
  return sub_190DE2480();
}

unint64_t sub_190DDC068()
{
  unint64_t result = qword_1E92B3DD0;
  if (!qword_1E92B3DD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E92B3DD0);
  }
  return result;
}

const char *sub_190DDC0BC()
{
  return "Calendar";
}

const char *sub_190DDC0D0()
{
  unint64_t result = "all_on";
  switch(*v0)
  {
    case 1:
      unint64_t result = "quick_feature_toggle";
      break;
    case 2:
      unint64_t result = "app_intents";
      break;
    case 3:
      unint64_t result = "app_entity_observation";
      break;
    default:
      return result;
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CalendarFeatureFlags(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CalendarFeatureFlags(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x190DDC2B8);
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

uint64_t sub_190DDC2E0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_190DDC2EC(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CalendarFeatureFlags()
{
  return &type metadata for CalendarFeatureFlags;
}

uint64_t sub_190DDC304()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void __getCHSTimelineControllerClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *ChronoServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CalWidgetUtils.m", 16, @"%s", *a1);

  __break(1u);
}

void __getCHSTimelineControllerClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCHSTimelineControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CalWidgetUtils.m", 17, @"Unable to find class %s", "CHSTimelineController");

  __break(1u);
}

void __getMGGetBoolAnswerSymbolLoc_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *libMobileGestaltLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CalContactsProvider.m", 38, @"%s", *a1);

  __break(1u);
}

void CalSetSystemTimeZone_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_190D88000, v0, v1, "CalSetSystemTimeZone: Posting kCalTimeZoneChangedNotification", v2, v3, v4, v5, v6);
}

void CalSetSystemTimeZone_cold_2(void *a1)
{
  uint64_t v1 = [a1 name];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_3(&dword_190D88000, v2, v3, "CalSetSystemTimeZone: setting __SystemTimeZone to %@", v4, v5, v6, v7, v8);
}

void CalSetSystemTimeZone_cold_3(void *a1)
{
  uint64_t v2 = [(id)__SystemTimeZone name];
  uint64_t v3 = [a1 name];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_190D88000, v4, v5, "CalSetSystemTimeZone: updating __SystemTimeZone from %@ to %@", v6, v7, v8, v9, v10);
}

void CalSetSystemTimeZone_cold_4(void *a1)
{
  uint64_t v1 = [a1 name];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_3(&dword_190D88000, v2, v3, "CalSetSystemTimeZone: __SystemTimeZone is the same (%@)", v4, v5, v6, v7, v8);
}

void _CalCopyDefaultTimeZone_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_190D88000, v0, v1, "_CalCopyDefaultTimeZone: No __SystemTimeZone", v2, v3, v4, v5, v6);
}

void _CalCopyDefaultTimeZone_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_190D88000, v0, OS_LOG_TYPE_DEBUG, "_CalCopyDefaultTimeZone: returning %@", v1, 0xCu);
}

void _CalCopyDefaultTimeZone_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_190D88000, v0, v1, "_CalCopyDefaultTimeZone: no value from cache", v2, v3, v4, v5, v6);
}

void _CalCopyDefaultTimeZone_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_190D88000, v0, v1, "_CalCopyDefaultTimeZone: no value for kCalTimeZoneKey", v2, v3, v4, v5, v6);
}

void _CalCopyDefaultTimeZone_cold_5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_190D88000, v0, v1, "_CalCopyDefaultTimeZone: no value for kCalTimeZonePrefKey", v2, v3, v4, v5, v6);
}

void _CalCopyDefaultTimeZone_cold_6(void *a1)
{
  uint64_t v1 = [a1 name];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_3(&dword_190D88000, v2, v3, "_CalCopyDefaultTimeZone: autoTimeZone %@", v4, v5, v6, v7, v8);
}

void _CalSetTimeZone_cold_1(void *a1)
{
  uint64_t v2 = [(id)__TimeZone name];
  uint64_t v3 = [a1 name];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_190D88000, v4, v5, "_CalSetTimeZone: updating __TimeZone from %@ to %@", v6, v7, v8, v9, v10);
}

void _CalSetTimeZone_cold_2(void *a1)
{
  uint64_t v1 = [a1 name];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_3(&dword_190D88000, v2, v3, "_CalSetTimeZone: setting __TimeZone to %@", v4, v5, v6, v7, v8);
}

void _CalCopySystemTimeZone_cold_1()
{
  os_log_t v0 = [(id)__SystemTimeZone name];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_3(&dword_190D88000, v1, v2, "_CalCopySystemTimeZone: No __SystemTimeZone, setting to %@", v3, v4, v5, v6, v7);
}

void CalSetDefaultTimeZone_cold_1(void *a1)
{
  uint64_t v1 = [a1 name];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_3(&dword_190D88000, v2, v3, "CalSetDefaultTimeZone to %@", v4, v5, v6, v7, v8);
}

void _CalDefaultTimeZoneSettingsChanged_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_190D88000, v0, v1, "_CalDefaultTimeZoneSettingsChanged: __TimeZone hasn't been set", v2, v3, v4, v5, v6);
}

void _CalDefaultTimeZoneSettingsChanged_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_190D88000, v0, v1, "_CalDefaultTimeZoneSettingsChanged: Posting kCalTimeZoneChangedNotification", v2, v3, v4, v5, v6);
}

void _CalDefaultTimeZoneSettingsChanged_cold_3(void *a1)
{
  uint64_t v2 = [(id)__TimeZone name];
  uint64_t v3 = [a1 name];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_190D88000, v4, v5, "_CalDefaultTimeZoneSettingsChanged: updating __TimeZone from %@ to %@", v6, v7, v8, v9, v10);
}

void _CalTimeZoneForceUpdate_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_190D88000, v0, v1, "_CalTimeZoneForceUpdate", v2, v3, v4, v5, v6);
}

void _CalTimeZoneForceUpdate_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_190D88000, v0, v1, "_CalTimeZoneForceUpdate: update ignored because __SystemTimeZone and __TimeZone are null", v2, v3, v4, v5, v6);
}

void _significantTimeChange_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_190D88000, v0, v1, "_significantTimeChange", v2, v3, v4, v5, v6);
}

void _CalTimeZonePrefChanged_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_190D88000, v0, v1, "_CalTimeZonePrefChanged: echo count 0", v2, v3, v4, v5, v6);
}

void _CalTimeZonePrefChanged_cold_2(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = __TimeZoneNotificationEchoCount;
  _os_log_debug_impl(&dword_190D88000, log, OS_LOG_TYPE_DEBUG, "_CalTimeZonePrefChanged: echo count %i", (uint8_t *)v1, 8u);
}

void _CalCopyTimeZone_cold_1(void *a1)
{
  uint64_t v1 = [a1 name];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_3(&dword_190D88000, v2, v3, "CalCopyTimeZone: __TimeZone not set yet, setting to %@", v4, v5, v6, v7, v8);
}

void NSDateFromICSValueInTimeZone_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_190D88000, log, OS_LOG_TYPE_ERROR, "Invalid value passed to NSDateFromICSValueInTimeZone. Supported types: ICSDateTimeValue, ICSDateValue", v1, 2u);
}

void CalRoundDoubleToNearestMultiple_cold_1(NSObject *a1, double a2, double a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithDouble:");
  uint64_t v6 = [NSNumber numberWithDouble:a3];
  int v7 = 138412546;
  uint8_t v8 = v5;
  __int16 v9 = 2112;
  uint8_t v10 = v6;
  _os_log_error_impl(&dword_190D88000, a1, OS_LOG_TYPE_ERROR, "Passed in a 'multiple' value of [%@].  Will not attempt to round value [%@] to the nearest multiple of that number.", (uint8_t *)&v7, 0x16u);
}

void CalFlagForProfilingStart_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_190D88000, v0, v1, "Starting profile of %@", v2, v3, v4, v5, v6);
}

void CalFlagForProfilingEnd_cold_1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_9(&dword_190D88000, v0, v1, "Ending profile of %@%@");
}

void CalFlagForProfilingPoint_cold_1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_9(&dword_190D88000, v0, v1, "Point flagged for %@%@");
}

void CalPerfLogStart_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_190D88000, v0, v1, "Perf starting %@", v2, v3, v4, v5, v6);
}

void CalPerfLogEnd_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_190D88000, v0, v1, "Perf ending %@", v2, v3, v4, v5, v6);
}

void CalPerfLogPoint_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_190D88000, v0, v1, "Perf point %@", v2, v3, v4, v5, v6);
}

void __HandleForSource_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  uint64_t v4 = a1;
  __int16 v5 = 2080;
  uint8_t v6 = dlerror();
  _os_log_error_impl(&dword_190D88000, a2, OS_LOG_TYPE_ERROR, "Error loading source %li: %s", (uint8_t *)&v3, 0x16u);
}

void __CalAddStateCaptureBlock_block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 136315394;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_190D88000, log, OS_LOG_TYPE_ERROR, "Failed to serialize state capture payload (%s): %@", (uint8_t *)&v4, 0x16u);
}

void __CalAddStateCaptureBlock_block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 136315138;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_190D88000, a2, OS_LOG_TYPE_ERROR, "Failed to allocate state capture data (%s)", (uint8_t *)&v3, 0xCu);
}

void __CalAddStateCaptureBlock_block_invoke_cold_3(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  uint64_t v4 = [a1 length];
  __int16 v5 = 1024;
  int v6 = 32522;
  _os_log_error_impl(&dword_190D88000, a2, OS_LOG_TYPE_ERROR, "State dump is %lu ascii characters, truncating to %i", (uint8_t *)&v3, 0x12u);
}

void __CalAddStateCaptureBlock_block_invoke_cold_4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_190D88000, a2, OS_LOG_TYPE_ERROR, "State dump is %lu bytes in UTF-16; truncating",
    (uint8_t *)&v2,
    0xCu);
}

void CalConvertNSIntegerToNSUInteger_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_190D88000, a2, OS_LOG_TYPE_ERROR, "Cannot convert a negative integer [%ld] to an unsigned integer.", (uint8_t *)&v2, 0xCu);
}

void CalConvertNSUIntegerToNSInteger_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 2048;
  uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  _os_log_error_impl(&dword_190D88000, a2, OS_LOG_TYPE_ERROR, "Cannot convert an unsigned integer [%lu], which is greater than [%ld], to an integer.", (uint8_t *)&v2, 0x16u);
}

uint64_t sub_190DE2460()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_190DE2470()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_190DE2480()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t AnalyticsIsEventUsed()
{
  return MEMORY[0x1F4113888]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

uint64_t BOMCopierCopyWithOptions()
{
  return MEMORY[0x1F410CFC8]();
}

uint64_t BOMCopierFree()
{
  return MEMORY[0x1F410CFD8]();
}

uint64_t BOMCopierNew()
{
  return MEMORY[0x1F410CFE0]();
}

uint64_t BOMCopierSetFatalErrorHandler()
{
  return MEMORY[0x1F410D008]();
}

uint64_t BOMCopierSetFatalFileErrorHandler()
{
  return MEMORY[0x1F410D010]();
}

uint64_t BOMCopierSetUserData()
{
  return MEMORY[0x1F410D028]();
}

CFAbsoluteTime CFAbsoluteTimeAddGregorianUnits(CFAbsoluteTime at, CFTimeZoneRef tz, CFGregorianUnits *units)
{
  MEMORY[0x1F40D70A0](tz, units, at);
  return result;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

SInt32 CFAbsoluteTimeGetDayOfWeek(CFAbsoluteTime at, CFTimeZoneRef tz)
{
  return MEMORY[0x1F40D70B8](tz, at);
}

CFGregorianUnits *__cdecl CFAbsoluteTimeGetDifferenceAsGregorianUnits(CFGregorianUnits *__return_ptr retstr, CFAbsoluteTime at1, CFAbsoluteTime at2, CFTimeZoneRef tz, CFOptionFlags unitFlags)
{
  return (CFGregorianUnits *)MEMORY[0x1F40D70C8](retstr, tz, unitFlags, at1, at2);
}

CFGregorianDate CFAbsoluteTimeGetGregorianDate(CFAbsoluteTime at, CFTimeZoneRef tz)
{
  uint64_t v2 = MEMORY[0x1F40D70D8](tz, at);
  result.double second = v3;
  result.year = v2;
  result.month = BYTE4(v2);
  result.day = BYTE5(v2);
  result.hour = BYTE6(v2);
  result.minute = HIBYTE(v2);
  return result;
}

SInt32 CFAbsoluteTimeGetWeekOfYear(CFAbsoluteTime at, CFTimeZoneRef tz)
{
  return MEMORY[0x1F40D70E0](tz, at);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFIndex CFArrayBSearchValues(CFArrayRef theArray, CFRange range, const void *value, CFComparatorFunction comparator, void *context)
{
  return MEMORY[0x1F40D7158](theArray, range.location, range.length, value, comparator, context);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArrayReplaceValues(CFMutableArrayRef theArray, CFRange range, const void **newValues, CFIndex newCount)
{
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

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1F40D7598]();
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  va_start(va, componentDesc);
  uint64_t v3 = va_arg(va, void);
  return MEMORY[0x1F40D7698](calendar, v3, at);
}

CFRange CFCalendarGetRangeOfUnit(CFCalendarRef calendar, CFCalendarUnit smallerUnit, CFCalendarUnit biggerUnit, CFAbsoluteTime at)
{
  CFIndex v4 = MEMORY[0x1F40D76C0](calendar, smallerUnit, biggerUnit, at);
  result.CFIndex length = v5;
  result.CFIndex location = v4;
  return result;
}

void CFCalendarSetFirstWeekday(CFCalendarRef calendar, CFIndex wkdy)
{
}

void CFCalendarSetMinimumDaysInFirstWeek(CFCalendarRef calendar, CFIndex mwd)
{
}

void CFCalendarSetTimeZone(CFCalendarRef calendar, CFTimeZoneRef tz)
{
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1F40D7898](allocator, at);
}

CFTypeRef CFDateFormatterCopyProperty(CFDateFormatterRef formatter, CFDateFormatterKey key)
{
  return (CFTypeRef)MEMORY[0x1F40D78A8](formatter, key);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x1F40D78B0](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateDateFormatFromTemplate(CFAllocatorRef allocator, CFStringRef tmplate, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringRef)MEMORY[0x1F40D78B8](allocator, tmplate, options, locale);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x1F40D78E0](allocator, formatter, date);
}

CFStringRef CFDateFormatterGetFormat(CFDateFormatterRef formatter)
{
  return (CFStringRef)MEMORY[0x1F40D78F8](formatter);
}

CFLocaleRef CFDateFormatterGetLocale(CFDateFormatterRef formatter)
{
  return (CFLocaleRef)MEMORY[0x1F40D7900](formatter);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
}

void CFDateFormatterSetProperty(CFDateFormatterRef formatter, CFStringRef key, CFTypeRef value)
{
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  MEMORY[0x1F40D7928](theDate);
  return result;
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
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

CFAbsoluteTime CFGregorianDateGetAbsoluteTime(CFGregorianDate gdate, CFTimeZoneRef tz)
{
  MEMORY[0x1F40D7B90](*(void *)&gdate.year, *(void *)&gdate.second, tz);
  return result;
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x1F40D7BE0](allocator, localeIdentifier);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D20]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE8](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
}

CFStringRef CFTimeZoneCopyAbbreviation(CFTimeZoneRef tz, CFAbsoluteTime at)
{
  return (CFStringRef)MEMORY[0x1F40D86E0](tz, at);
}

CFTimeZoneRef CFTimeZoneCopySystem(void)
{
  return (CFTimeZoneRef)MEMORY[0x1F40D86F8]();
}

CFTimeZoneRef CFTimeZoneCreateWithName(CFAllocatorRef allocator, CFStringRef name, Boolean tryAbbrev)
{
  return (CFTimeZoneRef)MEMORY[0x1F40D8700](allocator, name, tryAbbrev);
}

CFStringRef CFTimeZoneGetName(CFTimeZoneRef tz)
{
  return (CFStringRef)MEMORY[0x1F40D8710](tz);
}

void CFTimeZoneResetSystem(void)
{
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1F40D8790](anURL);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D87F8](allocator, url, pathComponent, isDirectory);
}

CFStringRef CFURLCreateStringByReplacingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x1F40D8878](allocator, originalString, charactersToLeaveEscaped);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D88A0](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1F40D88C0](allocator, URLString, baseURL);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1F40D8988](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1F40D89B0](alloc, uuid);
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x1F40D8A90](stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator)
{
  return (CFWriteStreamRef)MEMORY[0x1F40D8AA0](alloc, bufferAllocator);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x1F40D8AD0](stream);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1F40D9A00](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1F40D9A18](color);
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1F41096C8]();
}

uint64_t ICSDefaultPRODID()
{
  return MEMORY[0x1F4177BD0]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1F412F958]();
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

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E72E0](range1.location, range1.length, range2.location, range2.length);
  result.CFIndex length = v3;
  result.CFIndex location = v2;
  return result;
}

void NSZoneFree(NSZone *zone, void *ptr)
{
}

void *__cdecl NSZoneMalloc(NSZone *zone, NSUInteger size)
{
  return (void *)MEMORY[0x1F40E7310](zone, size);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

const char *__cdecl _Block_signature(void *aBlock)
{
  return (const char *)MEMORY[0x1F40C9AB0](aBlock);
}

uint64_t _CFCopyServerVersionDictionary()
{
  return MEMORY[0x1F40D8D00]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1F40D8D10]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1F40C9CD0]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
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
  return MEMORY[0x1F415B160]();
}

void abort(void)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

void bzero(void *a1, size_t a2)
{
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1F4181548](cls);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1F40CB3D8](*(void *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

void dispatch_activate(dispatch_object_t object)
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

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
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

void dispatch_resume(dispatch_object_t object)
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1F40CBCA0](source);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
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

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1F40CC4E8](*(void *)&a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

uint64_t mach_continuous_approximate_time(void)
{
  return MEMORY[0x1F40CC928]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1F40CCDE0](a1);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
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

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
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

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

uint64_t random(void)
{
  return MEMORY[0x1F40CDC18]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1F4181B28](sel);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

void srandom(unsigned int a1)
{
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1F40CE118](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

UBool u_isUAlphabetic(UChar32 c)
{
  return MEMORY[0x1F417F790](*(void *)&c);
}

UBool u_isUWhiteSpace(UChar32 c)
{
  return MEMORY[0x1F417F7A0](*(void *)&c);
}

UBool u_ispunct(UChar32 c)
{
  return MEMORY[0x1F417F7E0](*(void *)&c);
}

int32_t u_strcmp(const UChar *s1, const UChar *s2)
{
  return MEMORY[0x1F417F878](s1, s2);
}

uint64_t ucal_close()
{
  return MEMORY[0x1F417FAC8]();
}

uint64_t ucal_getCanonicalTimeZoneID()
{
  return MEMORY[0x1F417FAE0]();
}

uint64_t ucal_getDayOfWeekType()
{
  return MEMORY[0x1F417FAF0]();
}

uint64_t ucal_open()
{
  return MEMORY[0x1F417FB70]();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}