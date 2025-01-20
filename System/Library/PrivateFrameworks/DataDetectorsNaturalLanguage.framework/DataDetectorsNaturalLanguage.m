void __IPDebuggingModeEnabled_block_invoke()
{
  id v0;
  uint64_t vars8;

  v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  IPDebuggingModeEnabled_sEnabled = [v0 BOOLForKey:@"IPFeatureManagerLog"];
}

void __IPDebuggingModeEnabled_block_invoke_0()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  IPDebuggingModeEnabled_sEnabled_0 = [v0 BOOLForKey:@"IPFeatureManagerLog"];
}

void __IPDebuggingModeEnabled_block_invoke_1()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  IPDebuggingModeEnabled_sEnabled_1 = [v0 BOOLForKey:@"IPFeatureManagerLog"];
}

void __IPDebuggingModeEnabled_block_invoke_2()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  IPDebuggingModeEnabled_sEnabled_2 = [v0 BOOLForKey:@"IPFeatureManagerLog"];
}

void sub_2256872B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

void sub_225687CD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_225688310(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_2256883C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_225688444(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2256884C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2256885C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_225688858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(v9);
  _Unwind_Resume(a1);
}

void sub_225688AF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_225688D88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_225689020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_22568A174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48)
{
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

id _PASValidatedFormat(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v20[1] = *MEMORY[0x263EF8340];
  v18[1] = &a9;
  v9 = (objc_class *)NSString;
  id v10 = a1;
  v18[0] = 0;
  v11 = (void *)[[v9 alloc] initWithValidatedFormat:v10 validFormatSpecifiers:@"%@%@" locale:0 arguments:&a9 error:v18];

  id v12 = v18[0];
  if (!v11)
  {
    id v13 = objc_alloc(MEMORY[0x263EFF940]);
    uint64_t v14 = *MEMORY[0x263EFF4A0];
    uint64_t v19 = *MEMORY[0x263F08608];
    v20[0] = v12;
    v15 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    v16 = (void *)[v13 initWithName:v14 reason:@"An error occurred while formatting the string." userInfo:v15];

    [v16 raise];
  }

  return v11;
}

void sub_22568FF1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_2256911AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22569473C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2256947D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __IPGregorianCalendar_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263EFF8F0]);
  IPGregorianCalendar_calendar = [v0 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  return MEMORY[0x270F9A758]();
}

id IPSOSLogHandle()
{
  id v0 = (void *)_IPLogHandle;
  if (!_IPLogHandle)
  {
    IPInitLogging();
    id v0 = (void *)_IPLogHandle;
  }
  return v0;
}

uint64_t __IPLocalizedString_block_invoke()
{
  IPLocalizedString_bundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return MEMORY[0x270F9A758]();
}

void sub_225699A34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  objc_sync_exit(v22);
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

__CFString *humanReadableFeatureType(unint64_t a1)
{
  if (a1 > 0xD) {
    return @"Unknown Data";
  }
  else {
    return off_264722E68[a1];
  }
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

uint64_t IPDDResultRangeCompare()
{
  uint64_t Range = DDResultGetRange();
  uint64_t v2 = v1;
  uint64_t v3 = DDResultGetRange();
  uint64_t v5 = 1;
  if (v2 < v4) {
    uint64_t v6 = -1;
  }
  else {
    uint64_t v6 = 1;
  }
  if (v2 == v4) {
    uint64_t v6 = 0;
  }
  if (Range == v3) {
    uint64_t v5 = v6;
  }
  if (Range >= v3) {
    return v5;
  }
  else {
    return -1;
  }
}

uint64_t __IPGregorianCalendar_block_invoke_0()
{
  id v0 = objc_alloc(MEMORY[0x263EFF8F0]);
  IPGregorianCalendar_calendar_0 = [v0 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  return MEMORY[0x270F9A758]();
}

uint64_t lengthOfPatternAfterUncapturing(void *a1, unsigned char *a2, uint64_t a3)
{
  uint64_t v19 = a2;
  id v4 = a1;
  uint64_t v5 = [v4 length];
  char v20 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = v5;
  while (1)
  {
    uint64_t v9 = objc_msgSend(v4, "rangeOfString:options:range:", @"("), 2, v6, v8, v19;
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    if (v9 != 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v8 = v9 - v6;
    }
    if (a3) {
      objc_msgSend(v4, "getCharacters:range:", a3 + 2 * v7, v6, v8);
    }
    v7 += v8;
    if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    uint64_t v6 = v10 + v12;
    uint64_t v8 = v5 - (v10 + v12);
    if (v10 - 1 >= 0)
    {
      char v13 = 0;
      char v14 = v10 & 1;
      while ([v4 characterAtIndex:--v10] == 92)
      {
        v13 ^= 1u;
        if (v10 <= 0)
        {
          char v13 = v14;
          break;
        }
      }
      if (v13) {
        continue;
      }
    }
    if (!v8) {
      goto LABEL_24;
    }
    int v15 = [v4 characterAtIndex:v6];
    if (v15 == 63)
    {
      if (a3) {
        *(_WORD *)(a3 + 2 * v7) = 40;
      }
      ++v7;
    }
    else if (v15 == 41 {
           && (v8 == 1
    }
            || ((int v16 = [v4 characterAtIndex:v6 + 1], (v16 - 63) > 0x3D)
             || ((1 << (v16 - 63)) & 0x3000000000000001) == 0)
            && v16 != 42))
    {
      char v20 = 1;
      --v8;
      ++v6;
    }
    else
    {
LABEL_24:
      if (a3)
      {
        uint64_t v17 = a3 + 2 * v7;
        *(_DWORD *)uint64_t v17 = 4128808;
        *(_WORD *)(v17 + 4) = 58;
      }
      v7 += 3;
      char v20 = 1;
    }
  }
  if (v19) {
    *uint64_t v19 = v20 & 1;
  }

  return v7;
}

void sub_22569F328(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(exception_object);
    NSLog(&cfstr_ErrorIpregexto.isa);

    objc_end_catch();
    JUMPOUT(0x22569F2ECLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_22569FB64(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22569FCD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v7);
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

void sub_22569FE2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_22569FEB4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2256A01A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2256A0888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id obj)
{
}

void sub_2256A0A34(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2256A0AC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void IPInitLogging()
{
  if (IPInitLogging_once != -1) {
    dispatch_once(&IPInitLogging_once, &__block_literal_global_6);
  }
}

uint64_t __IPInitLogging_block_invoke()
{
  _IPLogHandle = (uint64_t)os_log_create("com.apple.DataDetectorsNaturalLanguage", "default");
  return MEMORY[0x270F9A758]();
}

void sub_2256A32D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
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

void sub_2256A3B74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

uint64_t __IPLocalizedString_block_invoke_0()
{
  IPLocalizedString_bundle_0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return MEMORY[0x270F9A758]();
}

void sub_2256A4468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va1, a12);
  va_start(va, a12);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_2256A46B4()
{
}

void sub_2256A4C28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2256A4E4C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2256A4ED0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2256A4F4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_2256A5118(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id getCalendar()
{
  if (getCalendar__onceToken != -1) {
    dispatch_once(&getCalendar__onceToken, &__block_literal_global_555);
  }
  id v0 = (void *)getCalendar__ipExprOnceResult;
  return v0;
}

void sub_2256A78D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2256A97FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void __getCalendar_block_invoke()
{
  id v0 = (void *)MEMORY[0x22A632550]();
  uint64_t v1 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v2 = (void *)getCalendar__ipExprOnceResult;
  getCalendar__ipExprOnceResult = v1;
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

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x270EE4440](arg);
}

CFMutableBitVectorRef CFBitVectorCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableBitVectorRef)MEMORY[0x270EE44F0](allocator, capacity);
}

CFBit CFBitVectorGetBitAtIndex(CFBitVectorRef bv, CFIndex idx)
{
  return MEMORY[0x270EE44F8](bv, idx);
}

CFIndex CFBitVectorGetCountOfBit(CFBitVectorRef bv, CFRange range, CFBit value)
{
  return MEMORY[0x270EE4508](bv, range.location, range.length, *(void *)&value);
}

void CFBitVectorSetBitAtIndex(CFMutableBitVectorRef bv, CFIndex idx, CFBit value)
{
}

void CFBitVectorSetCount(CFMutableBitVectorRef bv, CFIndex count)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFComparisonResult CFStringCompareWithOptions(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5058](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x270EE51A0](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFStringRef CFStringTokenizerCopyBestStringLanguage(CFStringRef string, CFRange range)
{
  return (CFStringRef)MEMORY[0x270EE5280](string, range.location, range.length);
}

uint64_t DDResultCopyExtractedDateFromReferenceDate()
{
  return MEMORY[0x270F25170]();
}

uint64_t DDResultCopyExtractedStartDateEndDate()
{
  return MEMORY[0x270F25178]();
}

uint64_t DDResultCopyExtractedURLWithOptions()
{
  return MEMORY[0x270F25188]();
}

uint64_t DDResultCopyFullAddressComponents()
{
  return MEMORY[0x270F25190]();
}

uint64_t DDResultCopyPhoneValue()
{
  return MEMORY[0x270F25198]();
}

uint64_t DDResultCreateFromDateTimeResults()
{
  return MEMORY[0x270F251A8]();
}

uint64_t DDResultDateExtractionDependsOnContextTense()
{
  return MEMORY[0x270F251B8]();
}

uint64_t DDResultGetCategory()
{
  return MEMORY[0x270F251C0]();
}

uint64_t DDResultGetMatchedString()
{
  return MEMORY[0x270F251C8]();
}

uint64_t DDResultGetParsecDomain()
{
  return MEMORY[0x270F251D0]();
}

uint64_t DDResultGetRange()
{
  return MEMORY[0x270F251E0]();
}

uint64_t DDResultGetSubresultWithType()
{
  return MEMORY[0x270F251F8]();
}

uint64_t DDResultGetType()
{
  return MEMORY[0x270F25200]();
}

uint64_t DDResultHasType()
{
  return MEMORY[0x270F25210]();
}

uint64_t DDResultIsPartialDateRangeOrTimeRange()
{
  return MEMORY[0x270F25218]();
}

uint64_t DDResultNeedsMeridianGuess()
{
  return MEMORY[0x270F25228]();
}

uint64_t DDResultTimeIsApprox()
{
  return MEMORY[0x270F25230]();
}

uint64_t DDScannerCopyResultsWithOptions()
{
  return MEMORY[0x270F25238]();
}

uint64_t DDScannerCreate()
{
  return MEMORY[0x270F25240]();
}

uint64_t DDScannerEnableOptionalSource()
{
  return MEMORY[0x270F25258]();
}

uint64_t DDScannerScanString()
{
  return MEMORY[0x270F25260]();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2AF8](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _MDPlainTextFromHTMLData()
{
  return MEMORY[0x270EE8608]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
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