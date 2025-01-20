void _MappedAllocatorDeallocate(uint64_t a1)
{
}

BOOL _UniquingIsEqual(uint64_t a1, __CFString *a2, __CFString *a3)
{
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  CStringPtr = CFStringGetCStringPtr(a2, SystemEncoding);
  v7 = CFStringGetCStringPtr(a3, SystemEncoding);
  v8 = v7;
  if (CStringPtr)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    CStringPtr = (const char *)[(__CFString *)a2 ef_lossyDefaultCStringBytes];
    if (v8)
    {
LABEL_3:
      if (CStringPtr) {
        goto LABEL_4;
      }
LABEL_8:
      v10 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "BOOL _UniquingIsEqual(NSHashTable *, const void *, const void *)"), @"MimePart.m", 327, @"Invalid string table entry %p(%@)", a2, a2 file lineNumber description];
      if (v8) {
        return strcasecmp(CStringPtr, v8) == 0;
      }
LABEL_9:
      v11 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "BOOL _UniquingIsEqual(NSHashTable *, const void *, const void *)"), @"MimePart.m", 328, @"Invalid string table entry %p(%@)", a3, a3 file lineNumber description];
      return strcasecmp(CStringPtr, v8) == 0;
    }
  }
  v8 = (const char *)[(__CFString *)a3 ef_lossyDefaultCStringBytes];
  if (!CStringPtr) {
    goto LABEL_8;
  }
LABEL_4:
  if (!v8) {
    goto LABEL_9;
  }
  return strcasecmp(CStringPtr, v8) == 0;
}

uint64_t _UniquingHash(uint64_t a1, __CFString *a2)
{
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  CStringPtr = CFStringGetCStringPtr(a2, SystemEncoding);
  if (!CStringPtr)
  {
    CStringPtr = (const char *)[(__CFString *)a2 ef_lossyDefaultCStringBytes];
    if (!CStringPtr)
    {
      v14 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "NSUInteger _UniquingHash(NSHashTable *, const void *)"), @"MimePart.m", 281, @"Invalid string table entry %p(%@)", a2, a2 file lineNumber description];
      CStringPtr = 0;
    }
  }
  size_t v5 = strlen(CStringPtr);
  size_t v6 = v5;
  if (v5 >= 0x11)
  {
    uint64_t v10 = 0;
    uint64_t v8 = v5;
    do
      uint64_t v8 = 257 * v8 + __tolower(CStringPtr[v10++]);
    while (v10 != 8);
    uint64_t v11 = 0;
    uint64_t v12 = (uint64_t)&CStringPtr[v6 - 16];
    do
      uint64_t v8 = 257 * v8 + __tolower(*(char *)(v12 + v11++ + v10));
    while (v11 != 8);
  }
  else if (v5)
  {
    size_t v7 = v5;
    uint64_t v8 = v5;
    do
    {
      --v7;
      __darwin_ct_rune_t v9 = *CStringPtr++;
      uint64_t v8 = 257 * v8 + __tolower(v9);
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }
  return (v8 << (v6 & 0x1F)) + v8;
}

void sub_1AFB04BD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB04D5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB04E40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB05590(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB05688(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB05820(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB059DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB05A68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB05B08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB05C20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB05D64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id _MFCreateStringFromHeaderBytes(unsigned int a1, UInt8 *a2, size_t a3)
{
  if (_MFCreateStringFromHeaderBytes_onceToken != -1) {
    dispatch_once(&_MFCreateStringFromHeaderBytes_onceToken, &__block_literal_global_0);
  }
  int v53 = -1;
  id v48 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  v47 = (void *)[[NSString alloc] initWithBytesNoCopy:a2 length:a3 encoding:1 freeWhenDone:0];
  size_t __n = a3;
  if (!a3)
  {
    v39 = 0;
    size_t v7 = 0;
    uint64_t v6 = 0;
    goto LABEL_50;
  }
  unint64_t v5 = 0;
  v51 = 0;
  CFAllocatorRef bytesDeallocator = (const __CFAllocator *)*MEMORY[0x1E4F1CFA0];
  uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  size_t v7 = a3;
  while (1)
  {
    unint64_t v52 = v5;
    uint64_t v8 = [(id)_MFCreateStringFromHeaderBytes_mimeRegex firstMatchInString:v47 options:0 range:bytesDeallocator];
    __darwin_ct_rune_t v9 = v8;
    if (!v8) {
      break;
    }
    uint64_t v10 = [v8 range];
    uint64_t v49 = v11;
    unint64_t v12 = v10;
    uint64_t v13 = [v9 rangeAtIndex:1];
    size_t v15 = v14;
    uint64_t v16 = [v9 rangeAtIndex:2];
    uint64_t v17 = [v9 rangeAtIndex:3];
    size_t v19 = v18;
    if (!v51) {
      v51 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:__n];
    }
    v50 = v9;
    size_t v20 = v7;
    if (v12 > v52)
    {
      if (v6 != v52) {
        goto LABEL_17;
      }
      unint64_t v21 = v52;
      do
      {
        unsigned int v22 = (char)a2[v21];
        if ((v22 & 0x80000000) != 0) {
          int v23 = __maskrune(v22, 0x4000uLL);
        }
        else {
          int v23 = *(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v22 + 60) & 0x4000;
        }
        ++v21;
      }
      while (v21 < v12 && v23);
      if (!v23)
      {
LABEL_17:
        _consumeBuffer(v51, v48, &v53);
        v24 = _createStringFromRawHeaderBytes(a1, &a2[v52], v12 - v52);
        if (v24) {
          [v51 appendString:v24];
        }
      }
    }
    if (!v15) {
      goto LABEL_31;
    }
    _createStringFromRawHeaderBytes(1536, &a2[v13], v15);
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int v26 = MFEncodingForCharsetWithFallback(v25, a1);
    int v27 = v26;
    if (v53 != v26) {
      goto LABEL_29;
    }
    if (v26 > 2351)
    {
      if ((v26 - 2352) <= 0x10 && ((1 << (v26 - 48)) & 0x10003) != 0 || v26 == 2565 || v26 == 134217984) {
        goto LABEL_30;
      }
LABEL_29:
      _consumeBuffer(v51, v48, &v53);
      int v53 = v27;
      goto LABEL_30;
    }
    if ((v26 - 1584) >= 3) {
      goto LABEL_29;
    }
LABEL_30:

LABEL_31:
    v28 = &a2[v17];
    __darwin_ct_rune_t v29 = __tolower((char)a2[v16]);
    UnfoldedData = _createUnfoldedData(&a2[v17], v19);
    Mutable = UnfoldedData;
    if (v29 == 113)
    {
      if (!UnfoldedData)
      {
        Mutable = CFDataCreateMutable(0, v19);
        CFDataAppendBytes(Mutable, v28, v19);
      }
      MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
      CFIndex Length = CFDataGetLength(Mutable);
      if (Length >= 1)
      {
        unint64_t v34 = (unint64_t)&MutableBytePtr[Length];
        do
        {
          v35 = memchr(MutableBytePtr, 95, v34 - (void)MutableBytePtr);
          if (!v35) {
            break;
          }
          unsigned char *v35 = 32;
          MutableBytePtr = v35 + 1;
        }
        while ((unint64_t)(v35 + 1) < v34);
      }
      v36 = [(__CFData *)Mutable mf_decodeQuotedPrintableForText:1];
    }
    else
    {
      if (UnfoldedData) {
        v37 = (void *)CFRetain(UnfoldedData);
      }
      else {
        v37 = CFDataCreateWithBytesNoCopy(0, v28, v19, bytesDeallocator);
      }
      v38 = v37;
      v36 = objc_msgSend(v37, "mf_decodeBase64");
      CFRelease(v38);
    }
    if (Mutable) {
      CFRelease(Mutable);
    }
    [v48 appendData:v36];
    uint64_t v6 = v12 + v49;
    size_t v7 = v52 + v20 - (v12 + v49);

    unint64_t v5 = v12 + v49;
    if (!v7) {
      goto LABEL_49;
    }
  }
  uint64_t v6 = v52;
LABEL_49:
  v39 = v51;
LABEL_50:
  _consumeBuffer(v39, v48, &v53);
  v40 = v39;
  if (v39)
  {
    if (v7)
    {
      v41 = _createStringFromRawHeaderBytes(a1, &a2[v6], v7);
      if (v41) {
        [v39 appendString:v41];
      }
    }
    id v42 = v39;
  }
  else
  {
    _createStringFromRawHeaderBytes(a1, a2, __n);
    id v42 = (id)objc_claimAutoreleasedReturnValue();
    v40 = 0;
  }

  return v42;
}

void sub_1AFB0622C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

__CFString *_createStringFromRawHeaderBytes(uint64_t a1, UInt8 *a2, size_t __n)
{
  UnfoldedData = _createUnfoldedData(a2, __n);
  if (!UnfoldedData) {
    UnfoldedData = CFDataCreateWithBytesNoCopy(0, a2, __n, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  }
  if (a1 != -1 || (size_t v7 = MFCreateStringWithData((__CFString *)UnfoldedData, 1536, 0)) == 0)
  {
    size_t v7 = MFCreateStringWithData((__CFString *)UnfoldedData, a1, 0);
    if (!v7) {
      size_t v7 = (__CFString *)CFStringCreateWithBytes(0, a2, __n, a1, 0);
    }
  }
  if (UnfoldedData) {
    CFRelease(UnfoldedData);
  }
  return v7;
}

void sub_1AFB063D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFData *_createUnfoldedData(UInt8 *a1, size_t __n)
{
  v3 = a1;
  v4 = (char *)memchr(a1, 10, __n);
  if (!v4) {
    return 0;
  }
  unint64_t v5 = v4;
  unint64_t v6 = (unint64_t)&v3[__n];
  Mutable = CFDataCreateMutable(0, __n);
  do
  {
    CFDataAppendBytes(Mutable, v3, v5 - (char *)v3);
    v3 = (UInt8 *)(v5 + 1);
    if ((unint64_t)(v5 + 1) < v6)
    {
      unint64_t v8 = v6 - 1 - (void)v5;
      while (1)
      {
        int v9 = (char)*v3;
        if (v9 != 32 && v9 != 9) {
          break;
        }
        ++v3;
        if (!--v8)
        {
          v3 = (UInt8 *)v6;
          break;
        }
      }
    }
    CFDataAppendBytes(Mutable, (const UInt8 *)" ", 1);
    unint64_t v5 = (char *)memchr(v3, 10, v6 - (void)v3);
  }
  while (v5);
  if ((unint64_t)v3 < v6) {
    CFDataAppendBytes(Mutable, v3, v6 - (void)v3);
  }
  return Mutable;
}

void _consumeBuffer(void *a1, void *a2, _DWORD *a3)
{
  id v7 = a1;
  unint64_t v5 = a2;
  if ([(__CFString *)v5 length])
  {
    unint64_t v6 = MFCreateStringWithData(v5, *a3, 0);
    if (v6) {
      [v7 appendString:v6];
    }
    [(__CFString *)v5 setLength:0];
    *a3 = -1;
  }
}

void sub_1AFB06580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

__CFString *MFCreateStringWithData(__CFString *result, uint64_t a2, CFStringEncoding *a3)
{
  if (result)
  {
    unint64_t v5 = result;
    unint64_t v6 = (const UInt8 *)[(__CFString *)result bytes];
    CFIndex v7 = [(__CFString *)v5 length];
    return MFCreateStringWithBytes(v6, v7, a2, a3);
  }
  return result;
}

__CFString *MFCreateStringWithBytes(const UInt8 *a1, CFIndex a2, uint64_t a3, CFStringEncoding *a4)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v8 = 0;
    CFStringEncoding v9 = a3;
    do
    {
      int v10 = _MFCreateStringWithBytesUsingFilters_FilterItems[v8];
      if (v10 == -1 || v10 == v9)
      {
        uint64_t v12 = (*(uint64_t (**)(const UInt8 *, CFIndex, CFStringEncoding *))&_MFCreateStringWithBytesUsingFilters_FilterItems[v8 + 2])(a1, a2, a4);
        if (v12) {
          return (__CFString *)v12;
        }
        if (v10 == v9) {
          CFStringEncoding v9 = -1;
        }
      }
      v8 += 4;
    }
    while (v8 != 48);
    uint64_t v13 = a3;
    if (v9 != -1)
    {
      CFAllocatorRef v14 = (const __CFAllocator *)MFGetMappedAllocator();
      CFStringRef v15 = _MFCreateStringWithBytes(v14, a1, a2, v9, 0);
      CFStringRef v16 = v15;
      if (a4 && v15)
      {
        *a4 = v9;
        return (__CFString *)v16;
      }
      if (v15) {
        return (__CFString *)v16;
      }
      uint64_t v13 = 0xFFFFFFFFLL;
    }
    *(void *)buf = 0;
    _MFGuessEncodingForBytes((uint64_t)a1, a2, v13, (uint64_t *)buf);
    if (*(void *)buf) {
      ucsdet_close();
    }
    if (a3 != -1 && v9 == -1)
    {
      CFAllocatorRef v18 = (const __CFAllocator *)MFGetMappedAllocator();
      CFStringRef v19 = _MFCreateStringWithBytes(v18, a1, a2, a3, 0);
      CFStringRef v16 = v19;
      if (a4 && v19)
      {
        *a4 = a3;
        return (__CFString *)v16;
      }
      if (v19) {
        return (__CFString *)v16;
      }
    }
    int v20 = objc_msgSend(+[MFMimeCharset preferredMimeCharset](MFMimeCharset, "preferredMimeCharset"), "cfStringEncoding");
    *(_DWORD *)buf = v20;
    uint64_t v21 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "stringArrayForKey:", @"AppleLanguages"), "objectAtIndex:", 0);
    unint64_t v22 = 0;
    do
    {
      if ([(__CFString *)*(&__MFLanguageToEncodingMapping + v22) isEqualToString:v21])int v23 = *((_DWORD *)&__MFLanguageToEncodingMapping + 2 * v22 + 2); {
      else
      }
        int v23 = -1;
      if (v22 > 0xF) {
        break;
      }
      v22 += 2;
    }
    while (v23 == -1);
    *(_DWORD *)&buf[4] = v23;
    *(_OWORD *)&buf[8] = xmmword_1AFB40380;
    if (v20 == -1)
    {
LABEL_44:
      v28 = MFLogGeneral();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v29 = CFStringConvertEncodingToIANACharSetName(a3);
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v29;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = a3;
        _os_log_impl(&dword_1AFB03000, v28, OS_LOG_TYPE_DEFAULT, "#Warning MFCreateStringWithData: failed to decode data with given encoding %@ (%lx)", buf, 0x16u);
      }
      return 0;
    }
    else
    {
      v24 = (CFStringEncoding *)buf;
      while (1)
      {
        CFAllocatorRef v25 = (const __CFAllocator *)MFGetMappedAllocator();
        CFStringRef v26 = _MFCreateStringWithBytes(v25, a1, a2, *v24, 0);
        if (v26) {
          break;
        }
        CFStringEncoding v27 = v24[1];
        ++v24;
        if (v27 == -1) {
          goto LABEL_44;
        }
      }
      CFStringRef v16 = v26;
      if (a4) {
        *a4 = *v24;
      }
    }
    return (__CFString *)v16;
  }
  if (a4) {
    *a4 = a3;
  }
  return &stru_1F08428B0;
}

uint64_t _MappedAllocatorAllocate(uint64_t a1)
{
  if (a1 < 0) {
    return 0;
  }
  v1 = [[MFMutableData alloc] initWithLength:a1 + 8];
  *(void *)[(MFMutableData *)v1 mutableBytes] = v1;
  return (uint64_t)([(MFMutableData *)v1 mutableBytes] + 8);
}

CFStringRef _filter_checkISO2022_JP(unint64_t a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v3 = a1 + a2 - 3;
  if (v3 <= a1) {
    return 0;
  }
  CFIndex v7 = (unsigned char *)a1;
  while (1)
  {
    if (*v7 == 27)
    {
      if (v7[1] != 36)
      {
        ++v7;
        goto LABEL_8;
      }
      int v8 = v7[2];
      v7 += 2;
      if ((v8 | 2) == 0x42) {
        break;
      }
    }
LABEL_8:
    if ((unint64_t)++v7 >= v3) {
      return 0;
    }
  }
  [(__CFString *)(id)CFStringConvertEncodingToIANACharSetName(0x821u) UTF8String];
  CFStringRef result = _MFCreateStringWithBytesViaICU(a1, a2);
  if (a3)
  {
    if (result) {
      *a3 = 2081;
    }
  }
  return result;
}

void sub_1AFB07018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

pthread_t _MFLockGlobalLock()
{
  pthread_mutex_lock(&sMFGlobalLock);
  pthread_t result = pthread_self();
  sThreadWithGlobalLock = (uint64_t)result;
  return result;
}

uint64_t _MFUnlockGlobalLock()
{
  return pthread_mutex_unlock(&sMFGlobalLock);
}

uint64_t _mfUnregisterLockOnThisThread(void *a1)
{
  pthread_mutex_lock(&__threadLockRelationsLock);
  CFDictionaryRef v2 = (const __CFDictionary *)__threadLockRelations;
  pthread_t v3 = pthread_self();
  Value = (void *)CFDictionaryGetValue(v2, v3);
  unint64_t v5 = Value;
  if (!Value)
  {
    if (sMFLockTesting != 1) {
      _mfUnregisterLockOnThisThread_cold_2();
    }
    sMFLockEncounteredError = 1;
  }
  if (([Value containsObject:a1] & 1) == 0)
  {
    if (sMFLockTesting != 1) {
      _mfUnregisterLockOnThisThread_cold_1();
    }
    sMFLockEncounteredError = 1;
  }
  [v5 removeObject:a1];
  if (![v5 count])
  {
    if (v5 && CFArrayGetCount((CFArrayRef)__threadLockEmptySets) <= 19) {
      CFArrayAppendValue((CFMutableArrayRef)__threadLockEmptySets, v5);
    }
    unint64_t v6 = (__CFDictionary *)__threadLockRelations;
    pthread_t v7 = pthread_self();
    CFDictionaryRemoveValue(v6, v7);
  }
  if (_mfCallStackLoggingEnabled())
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    objc_setAssociatedObject(a1, @"MFLock Call Stack Symbols", 0, (void *)0x301);
    [v8 drain];
  }
  return pthread_mutex_unlock(&__threadLockRelationsLock);
}

uint64_t _mfRegisterLockOnThisThread(void *a1)
{
  pthread_mutex_lock(&__threadLockRelationsLock);
  value = 0;
  CFDictionaryRef v2 = (const __CFDictionary *)__threadLockRelations;
  pthread_t v3 = pthread_self();
  if (!CFDictionaryGetValueIfPresent(v2, v3, (const void **)&value))
  {
    if (CFArrayGetCount((CFArrayRef)__threadLockEmptySets) < 1)
    {
      value = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    }
    else
    {
      value = (id)CFArrayGetValueAtIndex((CFArrayRef)__threadLockEmptySets, 0);
      CFArrayRemoveValueAtIndex((CFMutableArrayRef)__threadLockEmptySets, 0);
    }
    v4 = (__CFDictionary *)__threadLockRelations;
    pthread_t v5 = pthread_self();
    CFDictionarySetValue(v4, v5, value);
  }
  [value addObject:a1];
  if (_mfCallStackLoggingEnabled())
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    if (!objc_getAssociatedObject(a1, @"MFLock Call Stack Symbols")) {
      objc_setAssociatedObject(a1, @"MFLock Call Stack Symbols", (id)[MEMORY[0x1E4F29060] callStackSymbols], (void *)0x301);
    }
    [v6 drain];
  }
  return pthread_mutex_unlock(&__threadLockRelationsLock);
}

void *_MFFindObjectLock(uint64_t a1, uint64_t a2)
{
  v4 = (void *)sFirstLock;
  if (sFirstLock)
  {
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = v4[1];
      if (v6 | v5) {
        pthread_t v7 = (void *)v5;
      }
      else {
        pthread_t v7 = v4;
      }
      if (v6 == a1) {
        pthread_t result = v4;
      }
      else {
        pthread_t result = 0;
      }
      if (v6 != a1) {
        uint64_t v5 = (uint64_t)v7;
      }
      v4 = (void *)*v4;
      if (result) {
        BOOL v9 = 1;
      }
      else {
        BOOL v9 = v4 == 0;
      }
    }
    while (!v9);
    if (a2 && !result)
    {
      if (v5)
      {
LABEL_22:
        *(void *)(v5 + 8) = a1;
        *(_WORD *)(v5 + 72) = *(_WORD *)(v5 + 72) & 0x7FFF | ((a2 == 2) << 15);
        return (void *)v5;
      }
LABEL_21:
      uint64_t v5 = (uint64_t)malloc_type_calloc(1uLL, 0x58uLL, 0x10A2040CAED1BC0uLL);
      pthread_cond_init((pthread_cond_t *)(v5 + 24), 0);
      *(void *)uint64_t v5 = sFirstLock;
      sFirstLock = v5;
      goto LABEL_22;
    }
  }
  else
  {
    if (a2) {
      goto LABEL_21;
    }
    return 0;
  }
  return result;
}

uint64_t _MFAcquireObjectLock(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  pthread_t v2 = pthread_self();
  pthread_t v3 = v2;
  int v4 = *(__int16 *)(a1 + 72);
  if ((v4 & 0x80000000) == 0)
  {
    ++*(_WORD *)(a1 + 80);
    uint64_t v5 = *(_opaque_pthread_t **)(a1 + 16);
    if (v5) {
      BOOL v6 = v2 == v5;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      do
      {
        pthread_cond_wait((pthread_cond_t *)(a1 + 24), &sMutex);
        pthread_t v7 = *(_opaque_pthread_t **)(a1 + 16);
        if (v7) {
          BOOL v8 = v3 == v7;
        }
        else {
          BOOL v8 = 1;
        }
      }
      while (!v8);
      LOWORD(v4) = *(_WORD *)(a1 + 72);
    }
    *(_WORD *)(a1 + 72) = v4 & 0x8000 | (v4 + 1) & 0x7FFF;
    *(void *)(a1 + 16) = v3;
    goto LABEL_13;
  }
  if (v2 == *(pthread_t *)(a1 + 16))
  {
    *(_WORD *)(a1 + 72) = v4 & 0x8000 | (v4 + 1) & 0x7FFF;
    goto LABEL_13;
  }
  uint64_t v12 = (void *)[MEMORY[0x1E4F60DF8] currentDesignator];
  if (v12) {
    uint64_t v13 = [v12 priority];
  }
  else {
    uint64_t v13 = -1;
  }
  CFArrayRef Mutable = *(const __CFArray **)(a1 + 80);
  if (!Mutable)
  {
    CFArrayRef Mutable = CFArrayCreateMutable(0, 0, 0);
    *(void *)(a1 + 80) = Mutable;
  }
  v28.length = CFArrayGetCount(Mutable);
  v28.location = 0;
  CFIndex v15 = CFArrayBSearchValues(Mutable, v28, (const void *)v13, (CFComparatorFunction)_comparePriorities, 0);
  CFArrayInsertValueAtIndex(*(CFMutableArrayRef *)(a1 + 80), v15, (const void *)v13);
  while (*(void *)(a1 + 16) || CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 80), 0) != (const void *)v13)
    pthread_cond_wait((pthread_cond_t *)(a1 + 24), &sMutex);
  *(void *)(a1 + 16) = v3;
  *(_WORD *)(a1 + 72) = *(_WORD *)(a1 + 72) & 0x8000 | 1;
  CFArrayRef v16 = *(const __CFArray **)(a1 + 80);
  v29.length = CFArrayGetCount(v16);
  v29.location = 0;
  CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v16, v29, (const void *)v13);
  CFIndex v18 = FirstIndexOfValue;
  if (!FirstIndexOfValue)
  {
LABEL_37:
    CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 80), v18);
    goto LABEL_13;
  }
  if (FirstIndexOfValue != -1)
  {
    uint64_t v21 = (__CFString *)CFCopyDescription(*(CFTypeRef *)(a1 + 80));
    unint64_t v22 = MFLogGeneral();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      int v23 = 67109378;
      int v24 = v13;
      __int16 v25 = 2112;
      CFStringRef v26 = v21;
      _os_log_impl(&dword_1AFB03000, v22, OS_LOG_TYPE_INFO, "*** Expected priority %u at idx 0 in priorities %@", (uint8_t *)&v23, 0x12u);
    }

    goto LABEL_37;
  }
  CFStringRef v19 = (__CFString *)CFCopyDescription(*(CFTypeRef *)(a1 + 80));
  int v20 = MFLogGeneral();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    int v23 = 67109378;
    int v24 = v13;
    __int16 v25 = 2112;
    CFStringRef v26 = v19;
    _os_log_impl(&dword_1AFB03000, v20, OS_LOG_TYPE_INFO, "*** Couldn't find value %u in priorities %@", (uint8_t *)&v23, 0x12u);
  }

LABEL_13:
  BOOL v9 = *(void **)(a1 + 8);
  if (_mfCallStackLoggingEnabled())
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    if (!objc_getAssociatedObject(v9, @"MFLock Call Stack Symbols")) {
      objc_setAssociatedObject(v9, @"MFLock Call Stack Symbols", (id)[MEMORY[0x1E4F29060] callStackSymbols], (void *)0x301);
    }
    [v10 drain];
  }
  return pthread_mutex_unlock(&sMutex);
}

BOOL _mfCallStackLoggingEnabled()
{
  if (_mfCallStackLoggingEnabled_onceToken != -1) {
    dispatch_once(&_mfCallStackLoggingEnabled_onceToken, &__block_literal_global_11);
  }
  if (_mfCallStackLoggingEnabled___isInternal) {
    BOOL v0 = _mfCallStackLoggingEnabled___loggingDefaultEnabled == 0;
  }
  else {
    BOOL v0 = 1;
  }
  return !v0;
}

void _MFRecycleObjectLock(uint64_t a1)
{
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  __int16 v2 = *(_WORD *)(a1 + 72);
  *(_WORD *)(a1 + 72) = v2 & 0x8000;
  if (v2 < 0)
  {
    pthread_t v3 = *(const void **)(a1 + 80);
    if (v3)
    {
      CFRelease(v3);
      __int16 v4 = *(_WORD *)(a1 + 72) & 0x7FFF;
    }
    else
    {
      __int16 v4 = 0;
    }
    *(void *)(a1 + 80) = 0;
    *(_WORD *)(a1 + 72) = v4;
  }
  else
  {
    *(_WORD *)(a1 + 80) = 0;
  }
}

CFStringRef _filter_utf8_trailingSplitCodePoints(const UInt8 *a1, CFIndex a2, _DWORD *a3)
{
  if (!a2) {
    goto LABEL_30;
  }
  BOOL v6 = &a1[a2 - 1];
  if (a2 - 1 < 1)
  {
    CFIndex v7 = a2;
LABEL_11:
    unsigned int v9 = *v6;
  }
  else
  {
    CFIndex v7 = a2;
    while ((*(char *)v6 & 0x80000000) == 0)
    {
      --v6;
      --v7;
      if ((unint64_t)(a2 - v7) > 1 || v6 <= a1) {
        goto LABEL_11;
      }
    }
    unsigned int v9 = *v6;
  }
  if (v9 < 0xC0)
  {
    if ((v9 & 0xC0) == 0x80 && v6 >= a1)
    {
      unint64_t v14 = 0;
      CFIndex v15 = v6;
      while (1)
      {
        unsigned int v16 = *v15;
        if (v16 > 0xBF) {
          break;
        }
        --v15;
        ++v14;
        if (v15 < a1) {
          goto LABEL_30;
        }
      }
      if (v14 <= 5
        && _filter_utf8_trailingSplitCodePoints_checkValues[v14] != (_filter_utf8_trailingSplitCodePoints_masks[v14] & v16))
      {
        CFIndex v10 = v6 - a1 - v14;
        goto LABEL_15;
      }
    }
LABEL_30:
    CFIndex v10 = -1;
    goto LABEL_31;
  }
  CFIndex v10 = v7 - 1;
LABEL_15:
  if (v10 != -1)
  {
    CFAllocatorRef v11 = (const __CFAllocator *)MFGetMappedAllocator();
    CFStringRef result = _MFCreateStringWithBytes(v11, a1, v10, 0x8000100u, 0);
    if (result)
    {
      if (!a3) {
        return result;
      }
      goto LABEL_34;
    }
  }
LABEL_31:
  if (v10 == a2) {
    return 0;
  }
  CFAllocatorRef v17 = (const __CFAllocator *)MFGetMappedAllocator();
  CFStringRef result = _MFCreateStringWithBytes(v17, a1, a2, 0x8000100u, 0);
  if (a3)
  {
LABEL_34:
    if (result) {
      *a3 = 134217984;
    }
  }
  return result;
}

CFStringRef _filter_checkASCII(const UInt8 *a1, CFIndex a2, _DWORD *a3)
{
  BOOL v6 = a1;
  while (v6 < &a1[a2])
  {
    int v7 = *(char *)v6++;
    if (v7 < 0) {
      return 0;
    }
  }
  CFAllocatorRef v9 = (const __CFAllocator *)MFGetMappedAllocator();
  CFStringRef result = _MFCreateStringWithBytes(v9, a1, a2, 0x600u, 0);
  if (a3)
  {
    if (result) {
      *a3 = 1536;
    }
  }
  return result;
}

CFStringRef _MFCreateStringWithBytes(const __CFAllocator *a1, const UInt8 *a2, CFIndex a3, CFStringEncoding a4, Boolean a5)
{
  CFAllocatorRef Default = CFAllocatorGetDefault();
  CFAllocatorSetDefault(a1);
  CFStringRef v11 = CFStringCreateWithBytes(a1, a2, a3, a4, a5);
  CFAllocatorSetDefault(Default);
  return v11;
}

uint64_t MFGetMappedAllocator()
{
  return _MappedAllocator;
}

void sub_1AFB083B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB0841C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB0851C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB085D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB0881C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB08BE8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

BOOL MFMimePartParseContentTypeHeader(void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a5) {
    return 0;
  }
  v18[0] = a3 + a4;
  v18[1] = a3 + a4 + a5;
  int v20 = -1431655766;
  id v21 = 0;
  int v19 = a2;
  CFMutableStringRef MimeToken = _copyNextMimeToken((unsigned int *)v18, (uint64_t)&SLASH_SEPARATOR_MASK, 1);
  CFMutableStringRef v7 = _copyNextMimeToken((unsigned int *)v18, (uint64_t)&SPACE_SEMICOLON_COMMA_SEPARATOR_MASK, 1);
  unsigned int v16 = (__CFString *)0xAAAAAAAAAAAAAAAALL;
  id v17 = (id)0xAAAAAAAAAAAAAAAALL;
  [a1 setType:MimeToken];
  [a1 setSubtype:v7];

  while (_scanMimeKeyValuePair((uint64_t)v18, &v17, &v16))
  {
    if (objc_msgSend((id)objc_msgSend(a1, "type"), "isEqualToString:", @"text")
      && (objc_msgSend((id)objc_msgSend(a1, "subtype"), "isEqualToString:", @"html") & 1) != 0)
    {
      goto LABEL_13;
    }
    int v8 = objc_msgSend(@"charset", "isEqualToString:", objc_msgSend(v17, "lowercaseString"));
    CFAllocatorRef v9 = v16;
    if (!v8) {
      goto LABEL_14;
    }
    CFIndex v10 = (void *)[(__CFString *)v16 lowercaseString];
    if ([v10 isEqualToString:@"iso-8859-8-i"])
    {
      id v11 = v17;
      uint64_t v12 = a1;
      CFAllocatorRef v9 = @"ISO-8859-8";
    }
    else
    {
      if (![v10 isEqualToString:@"iso-8859-6-i"])
      {
        if (([v10 isEqualToString:@"iso-8859-8"] & 1) != 0
          || [v10 isEqualToString:@"iso-8859-6"])
        {
          objc_msgSend(a1, "_setObjectInOtherIvars:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 1), @"x-encoding-is-visual");
        }
LABEL_13:
        CFAllocatorRef v9 = v16;
LABEL_14:
        id v11 = v17;
        uint64_t v12 = a1;
        goto LABEL_15;
      }
      id v11 = v17;
      uint64_t v12 = a1;
      CFAllocatorRef v9 = @"ISO-8859-6";
    }
LABEL_15:
    [v12 setBodyParameter:v9 forKey:v11];
  }
  uint64_t v13 = (void *)a1[3];
  if (v13) {
    objc_msgSend(v13, "mf_fixupRFC2231Values");
  }
  if (v21) {

  }
  if (MimeToken) {
    BOOL v14 = v7 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  return !v14;
}

BOOL _scanMimeKeyValuePair(uint64_t a1, void *a2, void *a3)
{
  if (*(void *)a1 >= *(void *)(a1 + 8)) {
    return 0;
  }
  CFMutableStringRef MimeToken = _copyNextMimeToken((unsigned int *)a1, (uint64_t)&EQUALS_SEPARATOR_MASK, 1);
  if (!MimeToken) {
    return 0;
  }
  CFMutableStringRef v7 = MimeToken;
  CFMutableStringRef v8 = _copyNextMimeToken((unsigned int *)a1, (uint64_t)&SPACE_SEMICOLON_COMMA_SEPARATOR_MASK, 0);
  BOOL v9 = v8 != 0;
  if (v8)
  {
    if (a2) {
      *a2 = v7;
    }
    if (a3) {
      *a3 = v8;
    }
  }

  return v9;
}

CFMutableStringRef _copyNextMimeToken(unsigned int *a1, uint64_t a2, int a3)
{
  CFMutableStringRef v7 = *(char **)a1;
  BOOL v6 = (unsigned __int8 *)*((void *)a1 + 1);
  uint64_t v8 = MEMORY[0x1E4F14390];
  while (v7 < (char *)v6)
  {
    uint64_t v9 = *v7;
    if (*v7 < 0)
    {
      if (!__maskrune(v9, 0x4000uLL))
      {
LABEL_8:
        CFMutableStringRef v7 = *(char **)a1;
        BOOL v6 = (unsigned __int8 *)*((void *)a1 + 1);
        break;
      }
    }
    else if ((*(_DWORD *)(v8 + 4 * v9 + 60) & 0x4000) == 0)
    {
      goto LABEL_8;
    }
    *(void *)a1 = ++v7;
    BOOL v6 = (unsigned __int8 *)*((void *)a1 + 1);
  }
  if (v7 < (char *)v6)
  {
    CFMutableStringRef v10 = 0;
    int v11 = 0;
    while (1)
    {
      uint64_t v12 = *(char **)a1;
      uint64_t v13 = (UInt8 *)(*(void *)a1 + 1);
      uint64_t v14 = **(unsigned __int8 **)a1;
      UInt8 bytes = 0;
      *(void *)a1 = v13;
      if (v11 == 2)
      {
        if ((int)v14 <= 33)
        {
          if (v14 != 10 && v14 != 13) {
            goto LABEL_58;
          }
          char v15 = 0;
          int v19 = 2;
          goto LABEL_35;
        }
        if (v14 != 34)
        {
          if (v14 != 92) {
            goto LABEL_58;
          }
LABEL_42:
          if ((unint64_t)v13 >= *((void *)a1 + 1))
          {
            LODWORD(v14) = 0;
          }
          else
          {
            LODWORD(v14) = *v13;
            UInt8 bytes = *v13;
          }
          *(void *)a1 = v12 + 2;
          goto LABEL_59;
        }
        int v11 = 0;
        char v15 = 1;
      }
      else if (v11 == 1)
      {
        if (v14 == 41)
        {
          char v15 = 0;
          int v11 = 0;
        }
        else
        {
          if (v14 == 92)
          {
            char v15 = 0;
            *(void *)a1 = v12 + 2;
LABEL_34:
            int v19 = 1;
LABEL_35:
            if (*(void *)a1 >= *((void *)a1 + 1)) {
              int v11 = 3;
            }
            else {
              int v11 = v19;
            }
            if (v15) {
              goto LABEL_65;
            }
            goto LABEL_64;
          }
          char v15 = 0;
          int v11 = 1;
        }
      }
      else
      {
        char v15 = 1;
        if (v14 != 34)
        {
          if (v14 == 40) {
            goto LABEL_34;
          }
          if (v14 == 92) {
            goto LABEL_42;
          }
          if ((v14 & 0x80) != 0)
          {
            if (__maskrune(v14, 0x4000uLL)) {
              goto LABEL_55;
            }
LABEL_58:
            UInt8 bytes = v14;
LABEL_59:
            id v21 = *(char **)a1;
            unint64_t v22 = (unsigned __int8 *)*((void *)a1 + 1);
            if (*(void *)a1 >= (unint64_t)v22) {
              int v11 = 3;
            }
            if (v14)
            {
              CFArrayRef Mutable = (__CFData *)*((void *)a1 + 3);
              if (Mutable
                || (BOOL v31 = v22 >= (unsigned __int8 *)v21, v32 = (unsigned __int8 *)(v22 - (unsigned __int8 *)v21), v31)
                && (CFArrayRef Mutable = CFDataCreateMutable(0, (CFIndex)(v32 + 1)), (*((void *)a1 + 3) = Mutable) != 0))
              {
                CFDataAppendBytes(Mutable, &bytes, 1);
              }
            }
            goto LABEL_64;
          }
          if (((*(unsigned __int8 *)(a2 + ((unint64_t)v14 >> 3)) >> (v14 & 7)) & 1) == 0)
          {
            if ((*(_DWORD *)(v8 + 4 * v14 + 60) & 0x4000) == 0) {
              goto LABEL_58;
            }
LABEL_55:
            LODWORD(v14) = bytes;
            goto LABEL_59;
          }
          unsigned int v16 = (unsigned __int8 *)*((void *)a1 + 1);
          if (v13 < v16)
          {
            int64_t v17 = v16 - v13;
            CFIndex v18 = (unsigned __int8 *)(v12 + 2);
            while (((char)*(v18 - 1) & 0x80000000) == 0
                 && ((*(unsigned __int8 *)(a2 + ((unint64_t)*(v18 - 1) >> 3)) >> (*(v18 - 1) & 7)) & 1) != 0)
            {
              char v15 = 0;
              *(void *)a1 = v18++;
              int v19 = 3;
              if (!--v17) {
                goto LABEL_35;
              }
            }
          }
          char v15 = 0;
          int v19 = 3;
          goto LABEL_35;
        }
        int v11 = 2;
      }
      if ((unint64_t)v13 >= *((void *)a1 + 1)) {
        int v11 = 3;
      }
      if (v15)
      {
LABEL_65:
        CFDataRef v24 = (const __CFData *)*((void *)a1 + 3);
        if (!v24) {
          goto LABEL_74;
        }
        CFIndex Length = CFDataGetLength(v24);
        if (Length < 1) {
          goto LABEL_74;
        }
        size_t v26 = Length;
        if (a3)
        {
          unsigned int v27 = a1[4];
          BytePtr = (UInt8 *)CFDataGetBytePtr(*((CFDataRef *)a1 + 3));
          id v29 = _MFCreateStringFromHeaderBytes(v27, BytePtr, v26);
        }
        else
        {
          id v29 = (id)[[NSString alloc] initWithBytes:CFDataGetBytePtr(*((CFDataRef *)a1 + 3)) length:Length encoding:4];
        }
        v30 = v29;
        if (v10)
        {
          if (v29) {
            goto LABEL_72;
          }
        }
        else
        {
          CFMutableStringRef v10 = CFStringCreateMutable(0, 0);
          if (v30)
          {
LABEL_72:
            [(__CFString *)v10 appendString:v30];
          }
        }
        v35.location = 0;
        v35.length = v26;
        CFDataDeleteBytes(*((CFMutableDataRef *)a1 + 3), v35);
        goto LABEL_74;
      }
LABEL_64:
      if (v11 == 3) {
        goto LABEL_65;
      }
LABEL_74:
      if (v11 == 3) {
        return v10;
      }
    }
  }
  return 0;
}

void *_MFSetValueInDictionary(void *a1, void **a2, uint64_t a3, uint64_t a4)
{
  CFStringRef result = *a2;
  if (a4)
  {
    if (!result)
    {
      CFStringRef result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA60], "allocWithZone:", objc_msgSend(a1, "zone")), "initWithCapacity:", 3);
      *a2 = result;
    }
    return (void *)[result setObject:a4 forKey:a3];
  }
  else if (result)
  {
    return objc_msgSend(result, "removeObjectForKey:");
  }
  return result;
}

void sub_1AFB099D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB09B50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *_UniqueString(__CFString *a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  [(id)sFore lock];
  __int16 v2 = NSHashGet((NSHashTable *)sStringsCache, a1);
  [(id)sFore unlock];
  if (v2) {
    return v2;
  }
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  CStringPtr = CFStringGetCStringPtr(a1, SystemEncoding);
  if (CStringPtr)
  {
    uint64_t v5 = CStringPtr;
    uint64_t v6 = MEMORY[0x1E4F14390];
    while (1)
    {
      unsigned int v7 = *v5;
      if (!*v5) {
        break;
      }
      if ((v7 & 0x80000000) != 0) {
        int v8 = __maskrune(v7, 0x8000uLL);
      }
      else {
        int v8 = *(_DWORD *)(v6 + 4 * v7 + 60) & 0x8000;
      }
      ++v5;
      if (v8) {
        goto LABEL_10;
      }
    }
    CFStringRef v14 = a1;
  }
  else
  {
LABEL_10:
    *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v28 = v9;
    long long v29 = v9;
    long long v26 = v9;
    long long v27 = v9;
    long long v24 = v9;
    long long v25 = v9;
    *(_OWORD *)cStr = v9;
    long long v23 = v9;
    CFIndex v21 = 0xAAAAAAAAAAAAAAAALL;
    CFIndex Length = CFStringGetLength(a1);
    v31.location = 0;
    v31.length = Length;
    if (Length == MFStringGetBytes(a1, v31, SystemEncoding, 0x3Fu, 0, (UInt8 *)cStr, 127, &v21))
    {
      CFIndex v11 = v21;
      cStr[v21] = 0;
      CFIndex v12 = v11 - 1;
      CFIndex v21 = v11 - 1;
      if (v11)
      {
        do
        {
          cStr[v12] = __tolower(cStr[v12]);
          CFIndex v13 = v21;
          CFIndex v12 = --v21;
        }
        while (v13);
      }
      CFStringRef v14 = CFStringCreateWithCString(0, cStr, SystemEncoding);
    }
    else
    {
      v32.location = 0;
      v32.length = Length;
      MFStringGetBytes(a1, v32, SystemEncoding, 0x3Fu, 0, 0, 0, &v21);
      char v15 = (UInt8 *)malloc_type_malloc(v21 + 1, 0xBB2FFE80uLL);
      v33.location = 0;
      v33.length = Length;
      MFStringGetBytes(a1, v33, SystemEncoding, 0x3Fu, 0, v15, v21, 0);
      v15[v21] = 0;
      while (1)
      {
        CFIndex v16 = v21;
        CFIndex v17 = --v21;
        if (!v16) {
          break;
        }
        v15[v17] = __tolower(v15[v17]);
      }
      CFStringRef v14 = CFStringCreateWithCStringNoCopy(0, (const char *)v15, SystemEncoding, 0);
    }
  }
  CFIndex v18 = (__CFString *)v14;
  if (!v14) {
    return 0;
  }
  [(id)sFore lock];
  inserted = NSHashInsertIfAbsent((NSHashTable *)sStringsCache, v18);
  [(id)sFore unlock];
  if (inserted) {
    __int16 v2 = inserted;
  }
  else {
    __int16 v2 = v18;
  }

  return v2;
}

void setParent(uint64_t a1, void *a2)
{
  __int16 v4 = (os_unfair_lock_s *)(a1 + 128);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
  id v5 = +[MFWeakReferenceHolder weakReferenceWithObject:a2];
  uint64_t v6 = *(void **)(a1 + 64);
  *(void *)(a1 + 64) = v5;
  uint64_t v7 = *(void *)(a1 + 96);
  if (v7 != [a2 partURL])
  {

    *(void *)(a1 + 96) = (id)[a2 partURL];
  }

  os_unfair_lock_unlock(v4);
}

void sub_1AFB09EB4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1AFB0A9A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{
  _Unwind_Resume(a1);
}

void _getAttachmentsAndAddToCount(void *a1, _DWORD *a2, void *a3)
{
  uint64_t v6 = (void *)[a1 type];
  uint64_t v7 = (void *)[a1 subtype];
  if (![v6 isEqualToString:@"multipart"])
  {
    if ([v6 isEqualToString:@"message"]
      && [v7 isEqualToString:@"rfc822"])
    {
      _getAttachmentsAndAddToCount([a1 firstChildPart], a2, a3);
    }
    goto LABEL_13;
  }
  if (([v7 isEqualToString:@"x-folder"] & 1) != 0
    || ([v7 isEqualToString:@"appledouble"] & 1) != 0)
  {
LABEL_14:
    if (a2) {
      ++*a2;
    }
    if (a3)
    {
      id Attachment = _createAttachment(a1);
      [a3 addObject:Attachment];
    }
    return;
  }
  if ([v7 isEqualToString:@"alternative"] && objc_msgSend(a1, "firstChildPart"))
  {
    uint64_t v8 = [a1 firstChildPart];
    if (v8)
    {
      long long v9 = (void *)v8;
      do
      {
        _getAttachmentsAndAddToCount(v9, a2, a3);
        long long v9 = (void *)[v9 nextSiblingPart];
      }
      while (v9);
    }
    return;
  }
  uint64_t v10 = [a1 firstChildPart];
  if (!v10) {
    goto LABEL_13;
  }
  CFIndex v11 = (void *)v10;
  char v12 = 0;
  do
  {
    if (![a1 hasValidMultipartSignedContentType]
      || objc_msgSend(@"application", "mf_caseInsensitiveCompareExcludingXDash:", objc_msgSend(v11, "type"))
      || objc_msgSend(@"pkcs7-signature", "mf_caseInsensitiveCompareExcludingXDash:", objc_msgSend(v11, "subtype")))
    {
      _getAttachmentsAndAddToCount(v11, a2, a3);
      char v12 = 1;
    }
    CFIndex v11 = (void *)[v11 nextSiblingPart];
  }
  while (v11);
  if ((v12 & 1) == 0)
  {
LABEL_13:
    if (![a1 isAttachment]) {
      return;
    }
    goto LABEL_14;
  }
}

void sub_1AFB0B158(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1AFB0B1FC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void _parseHeaders(uint64_t a1, unsigned int a2, void *a3, void *a4, unsigned int a5)
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [a3 bytes];
  uint64_t v8 = [a3 length];
  uint64_t v110 = 0xAAAAAAAAAAAAAAAALL;
  size_t v111 = 0xAAAAAAAAAAAAAAAALL;
  if (ECGetNextHeaderFromDataInRange())
  {
    MFMimePartParseContentTypeHeader((void *)a1, a2, v7, v110, v111);
    long long v9 = MFLogGeneral();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "mimeBody"), "message"), "ef_publicDescription");
      _os_log_impl(&dword_1AFB03000, v9, OS_LOG_TYPE_DEFAULT, "Mime parsing: No content type header for message = %{public}@", buf, 0xCu);
    }
  }
  if (ECGetNextHeaderFromDataInRange()) {
    MFMimePartParseContentDispositionHeader((void *)a1, a2, v7, v110, v111);
  }
  if (ECGetNextHeaderFromDataInRange())
  {
    id v10 = _MFCreateStringFromHeaderBytes(a2, (UInt8 *)(v7 + v110), v111);
    [(id)a1 setContentTransferEncoding:v10];
  }
  if (ECGetNextHeaderFromDataInRange())
  {
    id v11 = _MFCreateStringFromHeaderBytes(a2, (UInt8 *)(v7 + v110), v111);
    if ([v11 hasPrefix:@"<"]
      && [v11 hasSuffix:@">"])
    {
      id v12 = (id)objc_msgSend(v11, "substringWithRange:", 1, objc_msgSend(v11, "length") - 2);

      id v11 = v12;
    }
    if ([v11 length]) {
      [(id)a1 setContentID:v11];
    }
  }
  if (ECGetNextHeaderFromDataInRange())
  {
    CFIndex v13 = (__CFString *)_MFCreateStringFromHeaderBytes(a2, (UInt8 *)(v7 + v110), v111);
    CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
    memset(buf, 170, 16);
    CFIndex v15 = [(__CFString *)v13 length];
    if (v13)
    {
      uint64_t v16 = v15;
      v117.location = 0;
      v117.length = v15;
      if (CFStringFindCharacterFromSet(v13, Predefined, v117, 0, (CFRange *)buf))
      {
        CFIndex v17 = (__CFString *)[(__CFString *)v13 mutableCopyWithZone:0];
        v18.length = *(void *)&buf[8];
        if (*(uint64_t *)&buf[8] >= 1)
        {
          while (1)
          {
            v18.location = *(void *)buf;
            CFStringReplace(v17, v18, &stru_1F08428B0);
            v19.location = *(void *)buf;
            v16 -= *(void *)&buf[8];
            if (v16 <= *(uint64_t *)buf) {
              break;
            }
            *(void *)&buf[8] = v16 - *(void *)buf;
            v19.length = v16 - *(void *)buf;
            CFStringFindCharacterFromSet(v17, Predefined, v19, 0, (CFRange *)buf);
            v18.length = *(void *)&buf[8];
            if (*(uint64_t *)&buf[8] <= 0) {
              goto LABEL_25;
            }
          }
          *(void *)&buf[8] = 0;
        }
LABEL_25:
      }
      else
      {
        CFIndex v17 = v13;
      }
    }
    else
    {
      CFIndex v17 = 0;
    }
    [(id)a1 setContentLocation:v17];
  }
  if (ECGetNextHeaderFromDataInRange())
  {
    id v20 = _MFCreateStringFromHeaderBytes(a2, (UInt8 *)(v7 + v110), v111);
    [(id)a1 setContentDescription:v20];
  }
  if (([*(id *)(a1 + 8) isEqualToString:@"multipart"] & 1) == 0
    && ECGetNextHeaderFromDataInRange())
  {
    CFIndex v21 = 0;
    unint64_t v22 = v8;
    while (1)
    {
      id v23 = _MFCreateStringFromHeaderBytes(a2, (UInt8 *)(v7 + v110), v111);
      if (v21)
      {
        if ([v21 isEqualToString:v23])
        {

          goto LABEL_39;
        }
        long long v24 = MFLogGeneral();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v21;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v23;
          __int16 v114 = 2112;
          uint64_t v115 = a1;
          _os_log_fault_impl(&dword_1AFB03000, v24, OS_LOG_TYPE_FAULT, "Found conflicting X-Apple-Content-Length headers (%{public}@ and %{public}@) for part %@", buf, 0x20u);
        }
      }
      CFIndex v21 = v23;
LABEL_39:
      BOOL v25 = v22 > v111 + v110;
      v22 -= v111 + v110;
      if (!v25 || !ECGetNextHeaderFromDataInRange())
      {
        if (v21)
        {
          if ([v21 isEqualToString:@"unknown"]) {
            uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v26 = (int)[v21 intValue];
          }
          *(void *)(a1 + 56) = v26;
          long long v27 = MFLogGeneral();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            long long v28 = NSStringFromRange(*(NSRange *)(a1 + 48));
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v28;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = a1;
            _os_log_impl(&dword_1AFB03000, v27, OS_LOG_TYPE_INFO, "Updating range to %{public}@ for part %@", buf, 0x16u);
          }
          if (*(void *)(a1 + 48) && a5) {
            *(void *)(a1 + 48) = 0x7FFFFFFFFFFFFFFFLL;
          }
        }
        break;
      }
    }
  }
  long long v29 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29060], "currentThread"), "threadDictionary"), "objectForKey:", @"PreserveHeaders");
  if (v29)
  {
    uint64_t v30 = v29;
    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    uint64_t v31 = [v29 countByEnumeratingWithState:&v106 objects:v112 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v107;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v107 != v33) {
            objc_enumerationMutation(v30);
          }
          CFRange v35 = *(__CFString **)(*((void *)&v106 + 1) + 8 * i);
          if (ECGetNextHeaderFromDataInRange())
          {
            id v36 = _MFCreateStringFromHeaderBytes(a2, (UInt8 *)(v7 + v110), v111);
            [(id)a1 _setObjectInOtherIvars:v36 forKey:_UniqueString(v35)];
          }
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v106 objects:v112 count:16];
      }
      while (v32);
    }
  }
  uint64_t v37 = a1;
  if ([*(id *)(a1 + 8) isEqualToString:@"multipart"])
  {
    v38 = (void *)[(id)a1 bodyParameterForKey:@"boundary"];
    uint64_t v103 = [a4 bytes];
    if (!v38)
    {
      if (_parseSubparts_onceToken != -1) {
        dispatch_once(&_parseSubparts_onceToken, &__block_literal_global_737);
      }
      v80 = objc_msgSend([NSString alloc], "initWithBytesNoCopy:length:encoding:freeWhenDone:", v103, objc_msgSend(a4, "length"), 1, 0);
      v81 = objc_msgSend((id)_parseSubparts_mimeBoundaryRegex, "firstMatchInString:options:range:", v80, 0, *(void *)(a1 + 48), *(void *)(a1 + 56));

      if (!v81) {
        goto LABEL_154;
      }
      [v81 range];
      uint64_t v83 = v82;
      uint64_t v84 = [v81 rangeAtIndex:1];
      if (!v83 || v84 == 0x7FFFFFFFFFFFFFFFLL || !v85) {
        goto LABEL_154;
      }
      v38 = objc_msgSend(NSString, "mf_stringWithData:encoding:", objc_msgSend(a4, "mf_subdataWithRange:", v84, v85), 1);
      v86 = MFLogGeneral();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v87 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "mimeBody"), "message"), "ef_publicDescription");
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v38;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v87;
        _os_log_impl(&dword_1AFB03000, v86, OS_LOG_TYPE_DEFAULT, "Mime parsing: Missing multipart boundary parameter; using \"%{public}@\", message = %{public}@",
          buf,
          0x16u);
      }
      if (!v38)
      {
LABEL_154:
        v88 = MFLogGeneral();
        if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v89 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "mimeBody"), "message"), "ef_publicDescription");
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v89;
          _os_log_impl(&dword_1AFB03000, v88, OS_LOG_TYPE_DEFAULT, "Mime parsing: No MIME boundary for message = %{public}@", buf, 0xCu);
        }
        goto LABEL_156;
      }
    }
    v39 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithCapacity:", objc_msgSend(v38, "length") + 2);
    uint64_t v102 = [(id)a1 range];
    unint64_t v41 = v40;
    objc_msgSend(v39, "mf_appendCString:", "--");
    v99 = v38;
    v101 = v39;
    objc_msgSend(v39, "appendData:", objc_msgSend(v38, "dataUsingEncoding:", 1));
    if (!v41)
    {
LABEL_156:
      if (![(id)v37 firstChildPart]
        && (objc_msgSend((id)objc_msgSend((id)v37, "subtype"), "isEqualToString:", @"x-folder") & 1) == 0
        && *(void *)(v37 + 56)
        && *(void *)(v37 + 48) != 0x7FFFFFFFFFFFFFFFLL)
      {
        v90 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", objc_msgSend((id)v37, "zone")), "init");
        [v90 setType:@"text"];
        [v90 setSubtype:@"plain"];
        objc_msgSend(v90, "setRange:", *(void *)(v37 + 48), *(void *)(v37 + 56));
        [(id)v37 addSubpart:v90];
      }
      *(_OWORD *)(v37 + 48) = xmmword_1AFB404B0;
      return;
    }
    *(void *)&long long v42 = 134218496;
    long long v98 = v42;
    unint64_t v43 = v102;
    unint64_t v44 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      uint64_t v45 = objc_msgSend(a4, "mf_rangeOfData:options:range:", v101, 0, v43, v41, v98);
      if (v45 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v47 = 0;
        unint64_t v48 = v41 + v43;
        uint64_t v49 = MFLogGeneral();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          uint64_t v50 = *(void *)(a1 + 24);
          uint64_t v51 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "mimeBody"), "message"), "ef_publicDescription");
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v99;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v50;
          uint64_t v37 = a1;
          __int16 v114 = 2114;
          uint64_t v115 = v51;
          _os_log_error_impl(&dword_1AFB03000, v49, OS_LOG_TYPE_ERROR, "Mime parsing: Couldn't find MIME boundary %{public}@ in message, parameters = %{public}@, message = %{public}@", buf, 0x20u);
        }
      }
      else
      {
        unint64_t v48 = v45;
        uint64_t v47 = v46;
      }
      BOOL v52 = v48 > v43 && *(unsigned char *)(v48 + v103 - 1) == 10;
      unint64_t v53 = v41 + v43;
      unint64_t v43 = v47 + v48;
      unint64_t v41 = v53 - (v47 + v48);
      if (v53 == v47 + v48) {
        break;
      }
      if (v41 >= 2)
      {
        BOOL v54 = *(unsigned __int16 *)(v103 + v43) != 11565;
        if (v41 == 2 || *(_WORD *)(v103 + v43) != 11565)
        {
          if (*(_WORD *)(v103 + v43) == 11565) {
            goto LABEL_75;
          }
        }
        else
        {
          int v56 = *(unsigned __int8 *)(v103 + v43 + 2);
          int v55 = 1;
          if (v56 == 10 || v56 == 13) {
            goto LABEL_84;
          }
        }
      }
      int v55 = 0;
      BOOL v54 = *(unsigned __int8 *)(v103 + v43) == 10;
LABEL_84:
      int v57 = v48 == v102 || v52;
      if (v53 == v43) {
        int v58 = 1;
      }
      else {
        int v58 = v55;
      }
      if (v57 == 1 && v58 | v54)
      {
        unint64_t v59 = v48 - v52;
        uint64_t v60 = v47 + v52 + v54;
        if (v44 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_127;
        }
        id v61 = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", objc_msgSend((id)v37, "zone")), "init");
        if ([*(id *)(v37 + 16) isEqualToString:@"digest"]) {
          int v62 = [*(id *)(v37 + 8) isEqualToString:@"multipart"];
        }
        else {
          int v62 = 0;
        }
        if ([*(id *)(v37 + 16) isEqualToString:@"signed"]
          && [*(id *)(v37 + 8) isEqualToString:@"multipart"])
        {
          BOOL v63 = [(id)v37 firstChildPart] == 0;
          if (!v62)
          {
LABEL_102:
            if (v63)
            {
              v64 = objc_alloc_init(MFMutableData);
              [(MFMutableData *)v64 appendBytes:v103 + v44 length:v59 - v44];
              [(id)a1 _setObjectInOtherIvars:v64 forKey:@"x-signed-data"];
            }
            if (v59 == v44)
            {
              v65 = 0;
              goto LABEL_120;
            }
            if (*(unsigned char *)(v103 + v44) == 10)
            {
              unint64_t v66 = v44 + 1;
              if (v62)
              {
                v67 = a4;
                unint64_t v68 = v44;
                uint64_t v69 = 1;
                goto LABEL_118;
              }
              v65 = 0;
LABEL_119:
              unint64_t v44 = v66;
LABEL_120:
              uint64_t v37 = a1;
            }
            else
            {
              if (objc_msgSend(a4, "mf_rangeOfCString:options:range:", "begin", 9, v44, v59 - v44) == 0x7FFFFFFFFFFFFFFFLL) {
                v70 = 0;
              }
              else {
                v70 = _parseUuencodedParts(v61, a2, a4, v44, v59 - v44);
              }
              uint64_t v37 = a1;
              if ([v70 count] == 1)
              {

                id v61 = (id)[v70 lastObject];
                unint64_t v44 = [v61 range];
                v65 = 0;
              }
              else
              {
                uint64_t v71 = objc_msgSend(a4, "mf_rangeOfCString:options:range:", "\n\n", 0, v44, v59 - v44);
                if (v71 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  unint64_t v66 = v71 + v72;
                  uint64_t v69 = v71 + v72 - v44;
                  v67 = a4;
                  unint64_t v68 = v44;
LABEL_118:
                  v65 = objc_msgSend(v67, "mf_subdataWithRange:", v68, v69);
                  goto LABEL_119;
                }
                v65 = 0;
                unint64_t v44 = v59;
              }
            }
            v73 = MFLogGeneral();
            if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v98;
              *(void *)&buf[4] = v44;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v59;
              __int16 v114 = 2048;
              uint64_t v115 = v60;
              _os_log_debug_impl(&dword_1AFB03000, v73, OS_LOG_TYPE_DEBUG, "subRange.location={%lu} matchRange={%lu,%lu}", buf, 0x20u);
            }
            objc_msgSend(v61, "setRange:", v44, v59 - v44);
            [(id)v37 addSubpart:v61];
            if (v65 && [v65 length]) {
              _parseHeaders(v61, a2, v65, a4, a5);
            }

LABEL_127:
            if (v55) {
              goto LABEL_156;
            }
            unint64_t v43 = v60 + v59;
            unint64_t v41 = v53 - v43;
            unint64_t v44 = v43;
            goto LABEL_129;
          }
        }
        else
        {
          BOOL v63 = 0;
          if (!v62) {
            goto LABEL_102;
          }
        }
        [v61 setType:@"message"];
        [v61 setSubtype:@"rfc822"];
        goto LABEL_102;
      }
LABEL_129:
      if (!v41) {
        goto LABEL_156;
      }
    }
    BOOL v54 = 0;
LABEL_75:
    int v55 = 1;
    goto LABEL_84;
  }
  if ((([*(id *)(a1 + 8) isEqualToString:@"multipart"] & 1) != 0
     || [*(id *)(a1 + 8) isEqualToString:@"message"]
     && [*(id *)(a1 + 16) isEqualToString:@"rfc822"])
    && *(void *)(a1 + 48) != 0x7FFFFFFFFFFFFFFFLL
    && (v74 = *(void *)(a1 + 56), BOOL v25 = v74 > [a4 length] - *(void *)(a1 + 48), v37 = a1, !v25))
  {
    uint64_t v91 = [a4 bytes];
    v92 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", objc_msgSend((id)a1, "zone")), "init");
    uint64_t v93 = *(void *)(a1 + 48);
    if (*(void *)(a1 + 56) && *(unsigned char *)(v91 + v93) == 10)
    {
      uint64_t v94 = 1;
    }
    else
    {
      uint64_t v95 = objc_msgSend(a4, "mf_rangeOfCString:options:range:", "\n\n", 0, *(void *)(a1 + 48));
      uint64_t v93 = *(void *)(a1 + 48);
      if (v96) {
        uint64_t v94 = v95 + v96 - v93;
      }
      else {
        uint64_t v94 = *(void *)(a1 + 56);
      }
    }
    v97 = objc_alloc_init(MFMutableData);
    [(MFMutableData *)v97 appendBytes:v91 + v93 length:v94];
    objc_msgSend(v92, "setRange:");
    [(id)a1 addSubpart:v92];
    _parseHeaders(v92, a2, v97, a4, a5);
  }
  else if (![(id)v37 parentPart])
  {
    uint64_t v75 = [a4 bytes];
    if (v75)
    {
      uint64_t v76 = *(void *)(a1 + 48);
      if (v76 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v77 = v75;
        if ([a4 length] >= (unint64_t)(v76 + 2)
          && *(unsigned char *)(v77 + v76) == 45
          && *(unsigned char *)(v77 + v76 + 1) == 45)
        {
          v78 = MFLogGeneral();
          if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v79 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "mimeBody"), "message"), "ef_publicDescription");
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = a1;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v79;
            _os_log_impl(&dword_1AFB03000, v78, OS_LOG_TYPE_DEFAULT, "Mime parsing: Message wasn't marked as multipart but started with '--', self = %{public}@, message = %{public}@", buf, 0x16u);
          }
        }
      }
    }
  }
}

uint64_t _rangeOfBytes(void *a1, char *a2, size_t a3, char a4, uint64_t a5, size_t a6)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v11 = a1;
  if (a5 + a6 > [v11 length]) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C4A8], @"%s: Out of bounds", "NSRange _rangeOfBytes(NSData *__strong, const char *, NSUInteger, NSUInteger, NSRange)");
  }
  id v12 = v11;
  uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  if (![v12 bytes] || a6 < a3) {
    goto LABEL_29;
  }
  if ((a6 & 0x80000000) != 0)
  {
    id v20 = MFLogGeneral();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      size_t v31 = a6;
      _os_log_impl(&dword_1AFB03000, v20, OS_LOG_TYPE_DEFAULT, "#Warning _rangeOfBytes: searchRange.length is invalid (%lu)", buf, 0xCu);
    }

    goto LABEL_29;
  }
  id v14 = v12;
  CFIndex v15 = v14;
  if ((a4 & 4) != 0)
  {
    uint64_t v16 = (char *)([v14 bytes] + a5 + a6 - 1);
    if ((a4 & 8) != 0) {
      CFRange v18 = &v16[-a3];
    }
    else {
      CFRange v18 = (char *)([v15 bytes] + a5);
    }
    uint64_t v19 = -1;
  }
  else
  {
    uint64_t v16 = (char *)([v14 bytes] + a5);
    if ((a4 & 8) != 0) {
      size_t v17 = a3;
    }
    else {
      size_t v17 = a6;
    }
    CFRange v18 = &v16[v17];
    if ((a4 & 1) == 0 && v17 >= a3)
    {
      id v29 = v15;
      int v25 = *a2;
      uint64_t v19 = 1;
      while (1)
      {
        uint64_t v26 = (char *)memchr(v16, v25, v17);
        if (!v26) {
          goto LABEL_27;
        }
        long long v27 = v26;
        if (v18 - v26 < a3) {
          goto LABEL_27;
        }
        if (!memcmp(v26, a2, a3))
        {
          uint64_t v13 = (uint64_t)&v27[-[v29 bytes]];
          goto LABEL_29;
        }
        uint64_t v16 = v27 + 1;
        size_t v17 = v18 - (v27 + 1);
        if (v17 < a3)
        {
          CFIndex v15 = v29;
          goto LABEL_20;
        }
      }
    }
    uint64_t v19 = 1;
  }
LABEL_20:
  if (a4) {
    CFIndex v21 = memcasecmp;
  }
  else {
    CFIndex v21 = (uint64_t (*)(char *, char *, uint64_t))MEMORY[0x1E4F149A8];
  }
  if (v18 - v16 < a3)
  {
LABEL_27:
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_29;
  }
  id v28 = v15;
  uint64_t v22 = 0;
  id v23 = v16;
  while (v21(&v16[v22], a2, a3))
  {
    v23 += v19;
    v22 += v19;
    if (v18 - v23 < a3) {
      goto LABEL_27;
    }
  }
  uint64_t v13 = (uint64_t)&v16[v22 - [v28 bytes]];
LABEL_29:

  return v13;
}

void sub_1AFB0C550(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB0C7A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB0C860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB0C934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t memcasecmp(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = MEMORY[0x1E4F14390];
  while (a3)
  {
    unsigned int v8 = *a1++;
    unsigned int v7 = v8;
    unsigned int v10 = *a2++;
    unsigned int v9 = v10;
    if ((v7 & 0x80000000) == 0)
    {
      if ((*(_DWORD *)(v6 + 4 * v7 + 60) & 0x8000) == 0) {
        goto LABEL_6;
      }
LABEL_5:
      LOBYTE(v7) = __tolower(v7);
      goto LABEL_6;
    }
    if (__maskrune(v7, 0x8000uLL)) {
      goto LABEL_5;
    }
LABEL_6:
    if ((v9 & 0x80000000) != 0)
    {
      if (!__maskrune(v9, 0x8000uLL)) {
        goto LABEL_9;
      }
LABEL_8:
      LOBYTE(v9) = __tolower(v9);
      goto LABEL_9;
    }
    if ((*(_DWORD *)(v6 + 4 * v9 + 60) & 0x8000) != 0) {
      goto LABEL_8;
    }
LABEL_9:
    --a3;
    if (v7 != v9) {
      return ((char)v7 - (char)v9);
    }
  }
  return 0;
}

void sub_1AFB0CC84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB0CD68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB0CE58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ___mfCallStackLoggingEnabled_block_invoke()
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F60D58], "currentDevice"), "isInternal");
  _mfCallStackLoggingEnabled___isInternal = result;
  if (result)
  {
    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"MFLockCallStackLoggingEnabled", (CFStringRef)*MEMORY[0x1E4F1D3D8], &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat) {
      BOOL v2 = AppBooleanValue == 0;
    }
    else {
      BOOL v2 = 1;
    }
    char v3 = !v2;
    _mfCallStackLoggingEnabled___loggingDefaultEnabled = v3;
    __int16 v4 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = ___mfCallStackLoggingEnabled_block_invoke_3;
    v5[3] = &unk_1E5F8A2B8;
    v5[4] = &__block_literal_global_103;
    return [v4 addObserverForName:@"MFLockCallStackLoggingEnabled" object:0 queue:0 usingBlock:v5];
  }
  return result;
}

void sub_1AFB0D07C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB0D2D4(_Unwind_Exception *a1)
{
}

void sub_1AFB0D45C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB0D520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB0D62C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

void sub_1AFB0D7B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB0D890(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB0D978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB0DC38(_Unwind_Exception *exception_object)
{
}

uint64_t MFEncodingForCharsetWithFallback(const __CFString *a1, uint64_t a2)
{
  if (!a1) {
    return a2;
  }
  if (![@"UTF-7" caseInsensitiveCompare:a1]) {
    return 67109120;
  }
  if (![@"UNKNOWN" caseInsensitiveCompare:a1]) {
    return a2;
  }
  if (![@"softbank-sjis" caseInsensitiveCompare:a1]) {
    return 2561;
  }
  return CFStringConvertIANACharSetNameToEncoding(a1);
}

uint64_t MFEncodingForCharset(const __CFString *a1)
{
  return MFEncodingForCharsetWithFallback(a1, 0xFFFFFFFFLL);
}

void sub_1AFB0E198(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB0E268(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _cachedIvarLoadFromHeaders(void *a1, int a2, void *a3)
{
  id v5 = a1;
  uint64_t v6 = a3;
  _MFLockGlobalLock();
  unsigned int v7 = v6[2](v6);
  _MFUnlockGlobalLock();
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = a2 == 0;
  }
  if (!v8)
  {
    unsigned int v9 = [v5 headers];
    [v5 loadCachedHeaderValuesFromHeaders:v9];

    _MFLockGlobalLock();
    unsigned int v7 = v6[2](v6);
    _MFUnlockGlobalLock();
  }

  return v7;
}

void sub_1AFB0E5C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB0E680(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB0E770(_Unwind_Exception *a1)
{
  __int16 v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AFB0E830(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB0E8A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB0EE14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void MFMimePartParseContentDispositionHeader(void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    v10[0] = a3 + a4;
    v10[1] = a3 + a4 + a5;
    int v12 = -1431655766;
    id v13 = 0;
    int v11 = a2;
    CFMutableStringRef MimeToken = _copyNextMimeToken((unsigned int *)v10, (uint64_t)&SPACE_SEMICOLON_COMMA_SEPARATOR_MASK, 1);
    id v8 = (id)0xAAAAAAAAAAAAAAAALL;
    id v9 = (id)0xAAAAAAAAAAAAAAAALL;
    [a1 setDisposition:MimeToken];

    while (_scanMimeKeyValuePair((uint64_t)v10, &v9, &v8))
    {
      [a1 setDispositionParameter:v8 forKey:v9];
    }
    unsigned int v7 = (void *)[a1 _objectInOtherIvarsForKey:@"x-disposition-parameters"];
    if (v7) {
      objc_msgSend(v7, "mf_fixupRFC2231Values");
    }
    if (v13) {
  }
    }
}

void sub_1AFB0F088(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB0F244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB0F2B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB0F358(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *_getSomeCharsetFromPartTree(id *a1)
{
  id v2 = objc_allocWithZone(MEMORY[0x1E4F1CA48]);
  char v3 = a1;
  uint64_t v4 = [a1[8] retainedReference];
  if (v4)
  {
    do
    {
      id v5 = (id *)v4;

      uint64_t v4 = [v5[8] retainedReference];
      char v3 = v5;
    }
    while (v4);
  }
  else
  {
    id v5 = v3;
  }
  uint64_t v6 = objc_msgSend(v2, "initWithObjects:", v5, 0);
  while ([v6 count])
  {
    unsigned int v7 = (void *)[v6 objectAtIndex:0];
    if (objc_msgSend((id)objc_msgSend(v7, "type"), "isEqualToString:", @"text"))
    {
      id v8 = (void *)[v7 bodyParameterForKey:@"charset"];
      if ([v8 isEqualToString:@"us-ascii"]) {
        id v8 = 0;
      }
    }
    else
    {
      for (uint64_t i = [v7 firstChildPart]; ; uint64_t i = objc_msgSend(v8, "nextSiblingPart"))
      {
        id v8 = (void *)i;
        if (!i) {
          break;
        }
        [v6 addObject:i];
      }
    }
    [v6 removeObjectAtIndex:0];
    if (v8) {
      goto LABEL_16;
    }
  }
  id v8 = 0;
LABEL_16:

  return v8;
}

void sub_1AFB0F740(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB0F918(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB0FC7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB0FD14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB10364(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB10524(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB105E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t _MFOffsetFromThreadDictionary(void *a1)
{
  v1 = (void *)[a1 objectForKey:@"__MIME_PART_DECODE_OFFSET"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return [v1 unsignedIntegerValue];
}

void sub_1AFB107C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __getCoreTelephonySubscriptionChangeListener_block_invoke()
{
  getCoreTelephonySubscriptionChangeListener_sharedInstance = objc_alloc_init(_MFCoreTelephonySubscriptionChangeListener);
  return MEMORY[0x1F41817F8]();
}

void sub_1AFB10948(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB11070(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, CFStringEncoding a10, uint64_t a11, long long buf)
{
  if (a2 == 1)
  {
    id v13 = objc_begin_catch(a1);
    a10 = -1431655766;
    id v14 = _MFCopyDecodeText(v12, &a10);
    CFIndex v15 = MFLogGeneral();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v13;
      _os_log_impl(&dword_1AFB03000, v15, OS_LOG_TYPE_INFO, "*** Exception %@ was raised while decoding mime message part. Displaying as text/plain.", (uint8_t *)&buf, 0xCu);
    }
    objc_end_catch();
    JUMPOUT(0x1AFB10FFCLL);
  }
  _Unwind_Resume(a1);
}

void sub_1AFB1112C()
{
}

CFIndex MFStringGetBytes(const __CFString *a1, CFRange a2, CFStringEncoding a3, UInt8 a4, Boolean a5, UInt8 *a6, CFIndex a7, CFIndex *a8)
{
  CFIndex usedBufLen = 0;
  CFIndex result = CFStringGetBytes(a1, a2, a3, a4, a5, a6, a7, &usedBufLen);
  if (a8) {
    *a8 = usedBufLen;
  }
  return result;
}

CFMutableArrayRef _setupThreadLockRelationsDictionary()
{
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  __threadLockRelations = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, MEMORY[0x1E4F1D540]);
  CFMutableArrayRef result = CFArrayCreateMutable(v0, 0, MEMORY[0x1E4F1D510]);
  __threadLockEmptySets = (uint64_t)result;
  return result;
}

void _changeFileAttributes(void *a1, void *a2, void *a3)
{
  unsigned int v10 = a1;
  id v5 = a2;
  id v6 = a3;
  unsigned int v7 = (void *)v10[5];
  if (v6)
  {
    if (!v7)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v9 = (void *)v10[5];
      v10[5] = v8;

      unsigned int v7 = (void *)v10[5];
    }
    [v7 setValue:v6 forKey:v5];
  }
  else
  {
    [v7 removeObjectForKey:v5];
  }
}

void sub_1AFB11AB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB11C44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB11D30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB11DF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t MFInitializeMIME()
{
  return objc_opt_class();
}

uint64_t MFCreateDataWithString(void *a1, CFStringEncoding a2, int a3)
{
  id v5 = a1;
  id v6 = (void *)MEMORY[0x1B3E87F20]();
  if (MFCanUseSoftBankCodePoints())
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    uint64_t v16 = __Block_byref_object_copy__0;
    size_t v17 = __Block_byref_object_dispose__0;
    id v18 = 0;
    unsigned int v7 = telephonyQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __softBankTransform_block_invoke;
    block[3] = &unk_1E5F89B78;
    block[4] = &v13;
    dispatch_sync(v7, block);

    id v8 = (id)v14[5];
    _Block_object_dispose(&v13, 8);

    uint64_t v9 = objc_msgSend(v5, "mf_applyTransform:", v8);

    id v5 = (id)v9;
  }
  uint64_t v10 = [v5 dataUsingEncoding:CFStringConvertEncodingToNSStringEncoding(a2) allowLossyConversion:a3 != 0];

  return v10;
}

void sub_1AFB12044(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t MFCanUseSoftBankCodePoints()
{
  int v0 = atomic_load((unsigned __int8 *)&sCanUseCodePoints);
  if (v0 == 1) {
    return 1;
  }
  if (v0 == 2) {
    return 0;
  }
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  id v2 = telephonyQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __MFCanUseSoftBankCodePoints_block_invoke;
  block[3] = &unk_1E5F89B78;
  block[4] = &v5;
  dispatch_sync(v2, block);

  BOOL v1 = *((unsigned char *)v6 + 24) != 0;
  _Block_object_dispose(&v5, 8);
  return v1;
}

id telephonyQueue()
{
  getCoreTelephonySubscriptionChangeListener();
  int v0 = (id *)objc_claimAutoreleasedReturnValue();
  id v1 = v0[1];

  return v1;
}

void __MFCanUseSoftBankCodePoints_block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (sInnerCanUseCodePoints == 1)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  else if (sInnerCanUseCodePoints)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  else
  {
    uint64_t v2 = MEMORY[0x1B3E87F20]();
    char v3 = (void *)[objc_alloc(MEMORY[0x1E4F23938]) initWithBundleType:1];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v4 = activeContexts();
    uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
    context = (void *)v2;
    if (v5)
    {
      uint64_t v6 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v19 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v9 = sharedCoreTelephonyClient();
          id v17 = 0;
          uint64_t v10 = (void *)[v9 copyBundleIdentifier:v8 bundleType:v3 error:&v17];
          id v11 = v17;

          if (v10)
          {
            if ([v10 isEqualToString:@"com.apple.Softbank_jp"])
            {

              int v13 = 1;
              goto LABEL_19;
            }
          }
          else
          {
            int v12 = MFLogGeneral();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v23 = v11;
              _os_log_error_impl(&dword_1AFB03000, v12, OS_LOG_TYPE_ERROR, "SoftBank: Unable to get bundle ID: %{public}@", buf, 0xCu);
            }
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v5);
    }
    int v13 = 0;
LABEL_19:

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v13;
    id v14 = MFLogGeneral();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long v24 = 67109120;
      int v25 = v13;
      _os_log_impl(&dword_1AFB03000, v14, OS_LOG_TYPE_INFO, "SoftBank: has SoftBank carrier: %{BOOL}d", v24, 8u);
    }

    if (v13) {
      unsigned __int8 v15 = 1;
    }
    else {
      unsigned __int8 v15 = 2;
    }
    sInnerCanUseCodePoints = v15;
    atomic_store(v15, (unsigned __int8 *)&sCanUseCodePoints);
  }
}

void sub_1AFB12434(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id activeContexts()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v0 = sharedCoreTelephonyClient();
  id v8 = 0;
  id v1 = [v0 getActiveContexts:&v8];
  id v2 = v8;

  if (v1)
  {
    char v3 = [v1 subscriptions];
    uint64_t v4 = [v3 ef_compactMap:&__block_literal_global_4];
    uint64_t v5 = MFLogGeneral();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      __int16 v6 = [v4 count];
      *(_DWORD *)buf = 67109120;
      int v10 = v6;
      _os_log_impl(&dword_1AFB03000, v5, OS_LOG_TYPE_INFO, "MFStringTransform: Found %u active contexts.", buf, 8u);
    }
  }
  else
  {
    char v3 = MFLogGeneral();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      activeContexts_cold_1((uint64_t)v2, v3);
    }
    uint64_t v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

void sub_1AFB125E4(_Unwind_Exception *a1)
{
  __int16 v6 = v5;

  _Unwind_Resume(a1);
}

id sharedCoreTelephonyClient()
{
  getCoreTelephonySubscriptionChangeListener();
  int v0 = (id *)objc_claimAutoreleasedReturnValue();
  id v1 = v0[2];

  return v1;
}

id getCoreTelephonySubscriptionChangeListener()
{
  if (getCoreTelephonySubscriptionChangeListener_p != -1) {
    dispatch_once(&getCoreTelephonySubscriptionChangeListener_p, &__block_literal_global_74);
  }
  int v0 = (void *)getCoreTelephonySubscriptionChangeListener_sharedInstance;
  return v0;
}

void sub_1AFB12778(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *_getFilenameEncodingHint(id *a1)
{
  SomeCharsetFromPartTree = (__CFString *)_getSomeCharsetFromPartTree(a1);
  if (SomeCharsetFromPartTree) {
    char v3 = SomeCharsetFromPartTree;
  }
  else {
    char v3 = @"windows-1252";
  }
  uint64_t v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    _getFilenameEncodingHint_cold_1((uint64_t)a1, (uint64_t)v3, v4);
  }
  return v3;
}

uint64_t _getApproximateRawSize(uint64_t a1)
{
  if ((([*(id *)(a1 + 8) isEqualToString:@"multipart"] & 1) != 0
     || [*(id *)(a1 + 8) isEqualToString:@"message"]
     && [*(id *)(a1 + 16) isEqualToString:@"rfc822"])
    && (![*(id *)(a1 + 8) isEqualToString:@"message"]
     || ![*(id *)(a1 + 16) isEqualToString:@"rfc822"]))
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = *(unsigned int *)(a1 + 56);
  }
  uint64_t v3 = [(id)a1 firstChildPart];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    do
    {
      uint64_t v2 = _getApproximateRawSize(v4) + v2;
      uint64_t v4 = (void *)[v4 nextSiblingPart];
    }
    while (v4);
  }
  return v2;
}

CFStringRef _filter_checkUTF32(const UInt8 *a1, unint64_t a2, _DWORD *a3)
{
  if (a2 < 4) {
    return 0;
  }
  if (*a1 != 255)
  {
    if (!*a1 && !a1[1] && a1[2] == 254 && a1[3] == 255) {
      goto LABEL_14;
    }
    return 0;
  }
  if (a1[1] != 254 || a1[2] || a1[3]) {
    return 0;
  }
LABEL_14:
  CFAllocatorRef v7 = (const __CFAllocator *)MFGetMappedAllocator();
  CFStringRef result = _MFCreateStringWithBytes(v7, a1, a2, 0xC000100u, 1u);
  if (a3)
  {
    if (result) {
      *a3 = 201326848;
    }
  }
  return result;
}

CFStringRef _filter_checkUTF16(const UInt8 *a1, unint64_t a2, _DWORD *a3)
{
  if (a2 < 2) {
    return 0;
  }
  int v6 = *a1;
  if (v6 == 255)
  {
    if (a1[1] != 254) {
      return 0;
    }
  }
  else if (v6 != 254 || a1[1] != 255)
  {
    return 0;
  }
  CFAllocatorRef v8 = (const __CFAllocator *)MFGetMappedAllocator();
  CFStringRef result = _MFCreateStringWithBytes(v8, a1, a2, 0x100u, 1u);
  if (a3)
  {
    if (result) {
      *a3 = 256;
    }
  }
  return result;
}

void *_createAttachment(void *a1)
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "attachmentClass"), "allocWithZone:", objc_msgSend(a1, "zone")), "initWithMimePart:", a1);
  objc_msgSend(a1, "configureFileWrapper:", objc_msgSend(v2, "fileWrapperForcingDownload:", 0));
  return v2;
}

uint64_t _MFStringEncodingForMatch(uint64_t a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  Name = (const char *)ucsdet_getName();
  if (!Name) {
    return 0xFFFFFFFFLL;
  }
  CFStringRef v2 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], Name, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  CFStringRef v3 = v2;
  CFStringEncoding v4 = CFStringConvertIANACharSetNameToEncoding(v2);
  CFRelease(v3);
  if (v4 == 2561) {
    return 1056;
  }
  else {
    return v4;
  }
}

uint64_t _MFGuessEncodingForBytes(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5 = ucsdet_open();
  ucsdet_setText();
  ucsdet_enableInputFilter();
  ucsdet_detectAll();
  if (a4)
  {
    *a4 = v5;
  }
  else if (v5)
  {
    ucsdet_close();
  }
  return 0xFFFFFFFFLL;
}

void sub_1AFB136D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1381C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB14078(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB146C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB14754(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1480C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB14918(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB14998(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB149F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB14A5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB14B48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB14BB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  int v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MFMessageFileWrapper;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1AFB15478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AFB157C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB15A78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB15F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB161B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB16300(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t MFGuessEncodingForBytes(uint64_t a1, uint64_t a2)
{
  return _MFGuessEncodingForBytes(a1, a2, 0xFFFFFFFFLL, 0);
}

BOOL MFStringCanBeConvertedLosslessly(void *a1, CFStringEncoding a2)
{
  BOOL v2 = 0;
  if (a1 && a2 != 2081 && a2 != 2096)
  {
    CFStringRef v3 = (void *)MFCreateDataWithString(a1, a2, 0);
    BOOL v2 = v3 != 0;
  }
  return v2;
}

__CFString *MFCharsetForEncoding(CFStringEncoding encoding)
{
  if (encoding == 67109120) {
    return @"UTF-7";
  }
  if (encoding == 1056 && (MFCanUseSoftBankCodePoints() & 1) != 0) {
    return @"Shift_JIS";
  }
  CFStringRef result = (__CFString *)CFStringConvertEncodingToIANACharSetName(encoding);
  if (!result)
  {
    return (__CFString *)CFStringConvertEncodingToIANACharSetName(0x201u);
  }
  return result;
}

uint64_t _filter_invalidEncoding(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (a3) {
    *a3 = -1;
  }
  return 0;
}

CFStringRef _filter_promoteGB18030(const UInt8 *a1, CFIndex a2, _DWORD *a3)
{
  CFAllocatorRef v6 = (const __CFAllocator *)MFGetMappedAllocator();
  CFStringRef result = _MFCreateStringWithBytes(v6, a1, a2, 0x632u, 0);
  if (a3)
  {
    if (result) {
      *a3 = 1586;
    }
  }
  return result;
}

CFStringRef _filter_promoteBig5_HKSCS(const UInt8 *a1, CFIndex a2, _DWORD *a3)
{
  CFAllocatorRef v6 = (const __CFAllocator *)MFGetMappedAllocator();
  CFStringRef result = _MFCreateStringWithBytes(v6, a1, a2, 0xA06u, 0);
  if (a3)
  {
    if (result) {
      *a3 = 2566;
    }
  }
  return result;
}

CFStringRef _filter_softbank(const UInt8 *a1, unint64_t a2, _DWORD *a3)
{
  if (MFCanUseSoftBankCodePoints())
  {
    CFStringRef result = _MFCreateStringWithBytesViaICU((uint64_t)a1, a2);
    if (!a3) {
      return result;
    }
  }
  else
  {
    CFAllocatorRef v7 = (const __CFAllocator *)MFGetMappedAllocator();
    CFStringRef result = _MFCreateStringWithBytes(v7, a1, a2, 0xA01u, 0);
    if (!a3) {
      return result;
    }
  }
  if (result) {
    *a3 = 2561;
  }
  return result;
}

CFStringRef _MFCreateStringWithBytesViaICU(uint64_t a1, unint64_t a2)
{
  if (a2 < 0x2AAAAAAB)
  {
    ucnv_open();
    ucnv_setFallback();
    CFAllocatorRef v6 = (const __CFAllocator *)MFGetMappedAllocator();
    CFAllocatorRef v7 = (const UniChar *)CFAllocatorAllocate(v6, 2 * ((2 * a2) | 1u), 0);
    if (v7)
    {
      CFAllocatorRef v8 = v7;
      int v9 = ucnv_toUChars();
      CFStringRef v4 = CFStringCreateWithCharactersNoCopy(v6, v8, v9, v6);
    }
    else
    {
      CFStringRef v4 = 0;
    }
    ucnv_close();
  }
  else
  {
    CFStringRef v3 = MFLogGeneral();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      _MFCreateStringWithBytesViaICU_cold_1(a2, v3);
    }
    return 0;
  }
  return v4;
}

BOOL MFGetRandomBytes(char *a1, int a2)
{
  v19[3] = *MEMORY[0x1E4F143B8];
  int v4 = open("/dev/urandom", 0);
  if (v4 < 0)
  {
    CFAllocatorRef v8 = MFLogGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = __error();
      int v10 = strerror(*v9);
      MFGetRandomBytes_cold_1((uint64_t)v10, (uint64_t)v19, v8);
    }

    return 0;
  }
  else
  {
    int v5 = v4;
    if (a2 >= 1)
    {
      while (1)
      {
        ssize_t v6 = read(v5, a1, a2);
        uint64_t v7 = v6;
        if (v6 <= 0) {
          break;
        }
        a2 -= v6;
        a1 += v6;
        if (a2 <= 0) {
          goto LABEL_15;
        }
      }
      int v12 = MFLogGeneral();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
      if (v7 < 0)
      {
        if (v13)
        {
          uint64_t v16 = __error();
          id v17 = strerror(*v16);
          MFGetRandomBytes_cold_2((uint64_t)v17, (uint64_t)v19, v12);
        }
      }
      else if (v13)
      {
        id v14 = __error();
        unsigned __int8 v15 = strerror(*v14);
        MFGetRandomBytes_cold_3((uint64_t)v15, (uint64_t)v19, v12);
      }
    }
LABEL_15:
    BOOL v11 = a2 == 0;
    close(v5);
  }
  return v11;
}

void sub_1AFB167F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void MF_MD5HMAC_Init(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 204) = 0u;
  if ((unint64_t)[v3 length] >= 0x41)
  {
    memset(md, 170, sizeof(md));
    CC_MD5_Init((CC_MD5_CTX *)a1);
    id v4 = v3;
    CC_MD5_Update((CC_MD5_CTX *)a1, (const void *)[v4 bytes], objc_msgSend(v4, "length"));
    CC_MD5_Final(md, (CC_MD5_CTX *)a1);
    uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:16];

    id v3 = (id)v5;
  }
  [v3 getBytes:a1 + 92 length:64];
  uint64_t v6 = 0;
  long long v7 = *(_OWORD *)(a1 + 108);
  *(_OWORD *)(a1 + 156) = *(_OWORD *)(a1 + 92);
  *(_OWORD *)(a1 + 172) = v7;
  long long v8 = *(_OWORD *)(a1 + 140);
  *(_OWORD *)(a1 + 188) = *(_OWORD *)(a1 + 124);
  *(_OWORD *)(a1 + 204) = v8;
  v9.i64[0] = 0x3636363636363636;
  v9.i64[1] = 0x3636363636363636;
  v10.i64[0] = 0x5C5C5C5C5C5C5C5CLL;
  v10.i64[1] = 0x5C5C5C5C5C5C5C5CLL;
  do
  {
    uint64_t v11 = a1 + v6;
    *(int8x16_t *)(v11 + 92) = veorq_s8(*(int8x16_t *)(a1 + v6 + 92), v9);
    *(int8x16_t *)(v11 + 156) = veorq_s8(*(int8x16_t *)(a1 + v6 + 156), v10);
    v6 += 16;
  }
  while (v6 != 64);
  CC_MD5_Init((CC_MD5_CTX *)a1);
  CC_MD5_Update((CC_MD5_CTX *)a1, (const void *)(a1 + 92), 0x40u);
}

void sub_1AFB16990(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t MF_MD5HMAC_Output(CC_MD5_CTX *c, unsigned __int8 *md)
{
  CC_MD5_Final(md, c);
  CC_MD5_Init(c);
  CC_MD5_Update(c, &c[1].data[10], 0x40u);
  CC_MD5_Update(c, md, 0x10u);
  return CC_MD5_Final(md, c);
}

void OUTLINED_FUNCTION_0(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

CFAllocatorRef _MappedAllocatorInitialize()
{
  CFAllocatorContext v1 = *(CFAllocatorContext *)byte_1F0842828;
  CFAllocatorRef result = CFAllocatorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &v1);
  _MappedAllocator = (uint64_t)result;
  return result;
}

uint64_t _MappedAllocatorReallocate(uint64_t a1, uint64_t a2)
{
  if (a2 < 0) {
    return 0;
  }
  BOOL v2 = *(void **)(a1 - 8);
  [v2 setLength:a2 + 8];
  return [v2 mutableBytes] + 8;
}

void MFSetUseLegacyMessageIDHashFormat(uint64_t a1)
{
  id v2 = (id)EFAtomicObjectRelease();
  id v4 = [NSNumber numberWithBool:a1];
  id v3 = (id)EFAtomicObjectSetIfNil();
}

void sub_1AFB17008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t MFStringHashForMessageID(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    id v2 = EFAtomicObjectLoad();
    id v3 = v2;
    if (v2)
    {
      int v4 = [v2 BOOLValue];

      if (v4)
      {
LABEL_4:
        uint64_t v5 = (const char *)objc_msgSend(v1, "ef_lossyDefaultCStringBytes");
        uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v5 length:strlen(v5)];
        long long v7 = objc_msgSend(v6, "ef_md5Digest");

        long long v8 = (void *)[objc_alloc(MEMORY[0x1E4F60F40]) initWithMD5Digest:v7];
LABEL_10:
        uint64_t v9 = [v8 int64Value];

        goto LABEL_11;
      }
    }
    else
    {
      if (useLegacyMessageIDHashFormat_onceToken != -1) {
        dispatch_once(&useLegacyMessageIDHashFormat_onceToken, &__block_literal_global);
      }
      int8x16_t v10 = [(id)useLegacyMessageIDHashFormat_userDefaults valueForKey:@"UseLegacyMessageIDHashFormat"];
      char v11 = [v10 BOOLValue];

      if (v11) {
        goto LABEL_4;
      }
    }
    long long v8 = (void *)[objc_alloc(MEMORY[0x1E4F60F40]) initWithString:v1];
    goto LABEL_10;
  }
  uint64_t v9 = 0;
LABEL_11:

  return v9;
}

void sub_1AFB17180(_Unwind_Exception *a1)
{
  int v4 = v3;

  _Unwind_Resume(a1);
}

uint64_t MFStringHashForMessageIDHeader(void *a1)
{
  id v1 = objc_msgSend(a1, "ec_messageIDSubstring");
  uint64_t v2 = MFStringHashForMessageID(v1);

  return v2;
}

void sub_1AFB17200(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t MFUniqueMessageIDHash()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F29128]);
  id v1 = [v0 UUIDString];
  uint64_t v2 = MFStringHashForMessageID(v1);

  return v2;
}

void sub_1AFB17264(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t MFMessageIDHashFromHeaders(void *a1, int a2)
{
  id v3 = [a1 firstHeaderForKey:*MEMORY[0x1E4F606F0]];
  uint64_t v4 = MFStringHashForMessageIDHeader(v3);
  if (v4) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = a2 == 0;
  }
  if (!v5) {
    uint64_t v4 = MFUniqueMessageIDHash();
  }

  return v4;
}

void sub_1AFB172E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB17490(_Unwind_Exception *a1)
{
  long long v8 = v6;

  _Unwind_Resume(a1);
}

void sub_1AFB176C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1773C()
{
}

void sub_1AFB1779C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB17868(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (v10) {

  }
  _Unwind_Resume(exception_object);
}

void sub_1AFB17944(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB179C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB17A2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB17AAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB17C20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB17D5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB17F48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB180DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB181E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB18394(_Unwind_Exception *a1)
{
  uint64_t v6 = v4;

  _Unwind_Resume(a1);
}

void sub_1AFB1847C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB18594(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB18738(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1884C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB18918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB18A04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB18D7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB18E64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB18ED0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB18F7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB18FFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB190F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB19208(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB193B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB19558(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB197D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB19A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB19CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB19DE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB19E48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB19EB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB19F10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1A020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1A2D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1A4AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1A5A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1A6C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1A794(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1A868(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1A918(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1A998(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1AA10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1AA90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1AAEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __useLegacyMessageIDHashFormat_block_invoke()
{
  id v0 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v1 = (id)[v0 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.mail"];

  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"group.com.apple.mail"];
  useLegacyMessageIDHashFormat_userDefaults = v2;
  return MEMORY[0x1F41817F8](v2);
}

void sub_1AFB1ABA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1AD54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1ADA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1AE24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1AE70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1AEF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1AF5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1AFC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _mimeTypeFromFileName(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_alloc_init(MFTypeInfo);
  id v3 = [v1 pathExtension];
  [(MFTypeInfo *)v2 setPathExtension:v3];

  [(MFTypeInfo *)v2 setFilename:v1];
  if (MFGetTypeInfo(v2, 1))
  {
    uint64_t v4 = [(MFTypeInfo *)v2 mimeType];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void sub_1AFB1B080(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AFB1B110(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1B180(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1B1F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1B260(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1B2D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1B338(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1B518(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1B660(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1B894(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _fixSubwrappersAtPath(void *a1, uint64_t a2)
{
  id v14 = a1;
  if ([v14 isDirectory])
  {
    id v3 = [v14 fileWrappers];
    uint64_t v4 = v3;
    if (v3 && [v3 count])
    {
      BOOL v5 = (void *)MEMORY[0x1B3E87F20]();
      size_t v6 = strlen((const char *)a2);
      long long v7 = [v4 keyEnumerator];
      long long v8 = 0;
      uint64_t v9 = (unsigned char *)(a2 + v6);
      uint64_t v10 = a2 + v6 + 1;
      size_t v11 = 1022 - v6;
      while (1)
      {
        int v12 = [v7 nextObject];

        if (!v12) {
          break;
        }
        uint64_t v13 = [v4 objectForKey:v12];
        if ([v12 getFileSystemRepresentation:v10 maxLength:v11])
        {
          *uint64_t v9 = 47;
          *(unsigned char *)(a2 + 1023) = 0;
          _fixSubwrappersAtPath(v13, a2);
        }

        long long v8 = v12;
      }
      *uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
}

void sub_1AFB1BA4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1BB04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1BB7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1BBF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1BC54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1BD84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1BFA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1C038(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1C1A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1C234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
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

void sub_1AFB1C330(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  int v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1AFB1C414(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1C4BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1C528(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1C774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1C82C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1D2E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1D460(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1D4FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1D7C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1D91C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1D9E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1DA50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1E0B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,void *a30)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1E290(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1E474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1E630(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1E720(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1E894(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1E980(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1EA44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1EB0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1EB9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1EC14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1EECC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB1EFCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t MFDataGetDataPath()
{
  return sMFDataPath;
}

uint64_t _MFDataInit()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v1 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier");
  uint64_t v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "processName");
  if (!v2) {
    uint64_t v2 = [NSString stringWithCString:getprogname() encoding:4];
  }
  id v3 = NSHomeDirectory();
  uint64_t v4 = [[(NSString *)v3 stringByAppendingPathComponent:@"Library"] stringByAppendingPathComponent:@"Caches"];
  if (v1) {
    uint64_t v5 = v1;
  }
  else {
    uint64_t v5 = v2;
  }
  sMFDataPath = [[(NSString *)v4 stringByAppendingPathComponent:v5] stringByAppendingPathComponent:@"MFData"];
  if (sMFDataPath)
  {
    size_t v6 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
    if ([v6 fileExistsAtPath:sMFDataPath])
    {
      long long v7 = (void *)[v6 enumeratorAtPath:sMFDataPath];
      uint64_t v8 = [v7 nextObject];
      if (v8)
      {
        uint64_t v9 = v8;
        do
        {
          MFRemoveItemAtPath((void *)[(id)sMFDataPath stringByAppendingPathComponent:v9]);
          uint64_t v9 = [v7 nextObject];
        }
        while (v9);
      }
    }
    else if (([v6 createDirectoryAtPath:sMFDataPath withIntermediateDirectories:1 attributes:0 error:0] & 1) == 0)
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Unable to create %@.  Check the sandbox access.", sMFDataPath format];
    }
    uint64_t v10 = [(NSString *)v3 stringByAppendingPathComponent:@"Library"];
    if ([@"MobileMail" isEqualToString:v2]) {
      size_t v11 = @"Mail";
    }
    else {
      size_t v11 = (__CFString *)v2;
    }
    uint64_t v12 = [[(NSString *)v10 stringByAppendingPathComponent:v11] stringByAppendingPathComponent:@"MFData"];
    if (v12)
    {
      uint64_t v13 = (void *)v12;
      if ([v6 fileExistsAtPath:v12]) {
        MFRemoveItemAtPath(v13);
      }
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Unable to produce a cache path."];
  }
  return [v0 drain];
}

void MFDataConsumerAppendDispatchData(void *a1, NSObject *a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (v3 && a2)
  {
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 3221225472;
    applier[2] = __MFDataConsumerAppendDispatchData_block_invoke;
    applier[3] = &unk_1E5F89898;
    id v6 = v3;
    dispatch_data_apply(a2, applier);
  }
}

uint64_t __MFDataConsumerAppendDispatchData_block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t MFDataConsumerConsumeCompleteData(void *a1, void *a2)
{
  id v3 = a1;
  id v13 = a2;
  uint64_t v4 = [v13 length];
  id v5 = v13;
  uint64_t v6 = [v5 bytes];
  uint64_t v7 = 0;
  for (BOOL i = 0; ; BOOL i = v11 == 0)
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v6 + v7 length:v4 - v7 freeWhenDone:0];
    uint64_t v10 = [v3 appendData:v9];
    uint64_t v11 = v10;
    if (v10 < 0) {
      break;
    }
    if (i && v10 == 0)
    {
      uint64_t v11 = v7;
      break;
    }
    v7 += v10;
    if (v7 == v4)
    {
      uint64_t v11 = v4;
      break;
    }
  }
  return v11;
}

void sub_1AFB2075C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB208E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB20954(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB20A54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB20AB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB20B3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB20C58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB20D58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB20E24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB20EC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB212DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB21398(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB21408(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB21478(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB215E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB216A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB21730(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB2179C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB21814(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB21AF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB21CC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB21DA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1AFB21F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);

  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 80), 8);
  _Block_object_dispose((const void *)(v12 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1AFB22028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1AFB2232C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB2239C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB2265C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB22FCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB2307C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB231EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  uint64_t v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = NSStringFromClass(v8);
  uint64_t v10 = [v7 caseInsensitiveCompare:v9];
  if (!v10)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v10 = [v4 compare:v5];
    }
    else if (v4 < v5)
    {
      uint64_t v10 = -1;
    }
    else
    {
      uint64_t v10 = v4 > v5;
    }
  }

  return v10;
}

void sub_1AFB232FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *copyMutablePlainTextFromPoint(const __CFString *a1, uint64_t a2, unint64_t a3, int a4)
{
  v160[2] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v154 = v8;
  long long v155 = v8;
  long long v152 = v8;
  long long v153 = v8;
  long long v150 = v8;
  long long v151 = v8;
  *(_OWORD *)buffer = v8;
  long long v149 = v8;
  uint64_t v9 = CFStringGetLength(a1) - a2;
  theString[0] = a1;
  *((void *)&v157 + 1) = a2;
  *(void *)&long long v158 = v9;
  theString[1] = (CFStringRef)CFStringGetCharactersPtr(a1);
  if (theString[1]) {
    CStringPtr = 0;
  }
  else {
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  }
  *((void *)&v158 + 1) = 0;
  uint64_t v159 = 0;
  *(void *)&long long v157 = CStringPtr;
  uint64_t v11 = (__CFString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
  appendedString = (__CFString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
  memset(v147, 170, 5);
  if (!a3 || v9 < 1) {
    goto LABEL_251;
  }
  unint64_t v12 = 0;
  BOOL v13 = 0;
  char v133 = 0;
  unsigned int v14 = 0;
  uint64_t v15 = 0;
  int v16 = 0;
  uint64_t v17 = 0;
  int v123 = a4 ^ 1;
  uint64_t v126 = v9 - 7;
  uint64_t v129 = 0;
  uint64_t v18 = MEMORY[0x1E4F14390];
  v127 = v11;
  unint64_t v128 = a3;
  do
  {
    UniChar chars = -21846;
    if (v15 < 0)
    {
      UniChar chars = 0;
      if (!v13)
      {
LABEL_17:
        UniChar v22 = 0;
        BOOL v23 = v17 != 0;
        goto LABEL_18;
      }
      goto LABEL_101;
    }
    uint64_t v19 = v158;
    if ((uint64_t)v158 <= v15)
    {
      UniChar chars = 0;
      if (!v13) {
        goto LABEL_17;
      }
LABEL_32:
      *(_OWORD *)v142 = *(_OWORD *)theString;
      long long v143 = v157;
      long long v144 = v158;
      uint64_t v145 = v159;
      long long v138 = v152;
      long long v139 = v153;
      long long v140 = v154;
      long long v141 = v155;
      *(_OWORD *)v134 = *(_OWORD *)buffer;
      long long v135 = v149;
      long long v136 = v150;
      long long v137 = v151;
      uint64_t v24 = v158;
      if ((uint64_t)v158 <= v15) {
        goto LABEL_101;
      }
      int v25 = (UniChar *)v142[1];
      if (v142[1])
      {
        uint64_t v26 = *((void *)&v143 + 1) + v15;
      }
      else
      {
        if ((void)v143)
        {
          UniChar v27 = *(char *)(v143 + *((void *)&v143 + 1) + v15);
          goto LABEL_50;
        }
        if (v145 <= v15 || (uint64_t v43 = *((void *)&v144 + 1), *((uint64_t *)&v144 + 1) > v15))
        {
          uint64_t v44 = v15 - 4;
          if ((unint64_t)v15 < 4) {
            uint64_t v44 = 0;
          }
          if (v44 + 64 < (uint64_t)v158) {
            uint64_t v24 = v44 + 64;
          }
          *((void *)&v144 + 1) = v44;
          uint64_t v145 = v24;
          uint64_t v45 = v17;
          v162.location = *((void *)&v143 + 1) + v44;
          v162.length = v24 - v44;
          CFStringGetCharacters(v142[0], v162, v134);
          uint64_t v17 = v45;
          uint64_t v18 = MEMORY[0x1E4F14390];
          uint64_t v43 = *((void *)&v144 + 1);
        }
        uint64_t v26 = v15 - v43;
        int v25 = v134;
      }
      UniChar v27 = v25[v26];
LABEL_50:
      if (v27 != 45) {
        goto LABEL_101;
      }
      uint64_t v35 = v15 + 1;
      uint64_t v36 = v144;
      if ((uint64_t)v144 <= v15 + 1) {
        goto LABEL_101;
      }
      uint64_t v37 = (UniChar *)v142[1];
      if (v142[1])
      {
        uint64_t v38 = *((void *)&v143 + 1) + v35;
      }
      else
      {
        if ((void)v143)
        {
          UniChar v39 = *(char *)(v143 + *((void *)&v143 + 1) + v35);
          goto LABEL_96;
        }
        if (v145 <= v35 || (uint64_t v65 = *((void *)&v144 + 1), *((uint64_t *)&v144 + 1) > v35))
        {
          uint64_t v66 = v15 - 3;
          if ((unint64_t)v15 < 3) {
            uint64_t v66 = 0;
          }
          if (v66 + 64 < (uint64_t)v144) {
            uint64_t v36 = v66 + 64;
          }
          *((void *)&v144 + 1) = v66;
          uint64_t v145 = v36;
          uint64_t v67 = v17;
          v164.location = *((void *)&v143 + 1) + v66;
          v164.length = v36 - v66;
          CFStringGetCharacters(v142[0], v164, v134);
          uint64_t v17 = v67;
          uint64_t v18 = MEMORY[0x1E4F14390];
          uint64_t v65 = *((void *)&v144 + 1);
        }
        uint64_t v38 = v35 - v65;
        uint64_t v37 = v134;
      }
      UniChar v39 = v37[v38];
LABEL_96:
      if (v39 == 45)
      {
        uint64_t v51 = v15 + 2;
        uint64_t v52 = v144;
        if ((uint64_t)v144 > v15 + 2)
        {
          unint64_t v53 = (UniChar *)v142[1];
          if (v142[1])
          {
            uint64_t v54 = *((void *)&v143 + 1) + v51;
          }
          else
          {
            if ((void)v143)
            {
              UniChar v55 = *(char *)(v143 + *((void *)&v143 + 1) + v51);
LABEL_143:
              BOOL v13 = v55 != 62;
              if (v55 == 62) {
                v15 += 2;
              }
              goto LABEL_102;
            }
            if (v145 <= v51 || (uint64_t v75 = *((void *)&v144 + 1), *((uint64_t *)&v144 + 1) > v51))
            {
              uint64_t v76 = v15 - 2;
              if ((unint64_t)v15 < 2) {
                uint64_t v76 = 0;
              }
              if (v76 + 64 < (uint64_t)v144) {
                uint64_t v52 = v76 + 64;
              }
              *((void *)&v144 + 1) = v76;
              uint64_t v145 = v52;
              uint64_t v77 = v17;
              v166.location = *((void *)&v143 + 1) + v76;
              v166.length = v52 - v76;
              CFStringGetCharacters(v142[0], v166, v134);
              uint64_t v17 = v77;
              uint64_t v18 = MEMORY[0x1E4F14390];
              uint64_t v75 = *((void *)&v144 + 1);
            }
            uint64_t v54 = v51 - v75;
            unint64_t v53 = v134;
          }
          UniChar v55 = v53[v54];
          goto LABEL_143;
        }
      }
LABEL_101:
      BOOL v13 = 1;
      goto LABEL_102;
    }
    long long v20 = (UniChar *)theString[1];
    if (theString[1])
    {
      uint64_t v21 = *((void *)&v157 + 1) + v15;
LABEL_13:
      UniChar v22 = v20[v21];
      goto LABEL_31;
    }
    if (!(void)v157)
    {
      if (v159 <= v15 || (uint64_t v40 = *((void *)&v158 + 1), *((uint64_t *)&v158 + 1) > v15))
      {
        uint64_t v41 = v15 - 4;
        if ((unint64_t)v15 < 4) {
          uint64_t v41 = 0;
        }
        if (v41 + 64 < (uint64_t)v158) {
          uint64_t v19 = v41 + 64;
        }
        *((void *)&v158 + 1) = v41;
        uint64_t v159 = v19;
        uint64_t v42 = v17;
        v161.location = *((void *)&v157 + 1) + v41;
        v161.length = v19 - v41;
        CFStringGetCharacters(theString[0], v161, buffer);
        uint64_t v17 = v42;
        uint64_t v18 = MEMORY[0x1E4F14390];
        uint64_t v40 = *((void *)&v158 + 1);
      }
      uint64_t v21 = v15 - v40;
      long long v20 = buffer;
      goto LABEL_13;
    }
    UniChar v22 = *(char *)(v157 + *((void *)&v157 + 1) + v15);
LABEL_31:
    UniChar chars = v22;
    if (v13) {
      goto LABEL_32;
    }
    if (v22 != 60)
    {
      BOOL v23 = v17 != 0;
      if (v22 == 62 && v17 != 0)
      {
        if (!v16)
        {
          uint64_t v17 = (v17 - 1);
          if (v14)
          {
            unsigned int v131 = v17;
            if (!strncasecmp(v147, "br", 5uLL)
              || !strncasecmp(v147, "li", 5uLL)
              || !strncasecmp(v147, "/li", 5uLL)
              || !strncasecmp(v147, "div", 5uLL)
              || !strncasecmp(v147, "/div", 5uLL)
              || !strncasecmp(v147, "/p", 5uLL))
            {
              int v56 = HIDWORD(v129);
              CFStringRef v57 = @"\n";
              if (((v123 | HIDWORD(v129)) & 1) == 0
                || (CFStringRef v57 = @" ", ((v129 | HIDWORD(v129)) & 1) == 0))
              {
                CFStringAppend(v11, v57);
                int v56 = (v123 | HIDWORD(v129)) ^ 1;
                LODWORD(v129) = v123 | HIDWORD(v129);
              }
              HIDWORD(v129) = v56;
              int v16 = 0;
              BOOL v13 = 0;
              ++v14;
            }
            else
            {
              int v16 = 0;
              BOOL v13 = 0;
            }
            uint64_t v18 = MEMORY[0x1E4F14390];
            goto LABEL_110;
          }
LABEL_85:
          int v16 = 0;
        }
        goto LABEL_86;
      }
      if (v22 == 62)
      {
        uint64_t v34 = v17;
        CFStringAppendCharacters(v11, &chars, 1);
        uint64_t v17 = v34;
        uint64_t v18 = MEMORY[0x1E4F14390];
        BOOL v13 = 0;
        uint64_t v129 = 0;
        ++v14;
        goto LABEL_102;
      }
LABEL_18:
      if (v23 && !v16)
      {
        if (v12 <= 3)
        {
          int v16 = 0;
          BOOL v13 = 0;
          v147[v12++] = v22;
          goto LABEL_102;
        }
        goto LABEL_85;
      }
      if (!(v17 | v16))
      {
        if (v22 <= 0x26u)
        {
          if (((1 << v22) & 0x100002600) != 0)
          {
            if (v133)
            {
              CFStringAppend(v11, @"&");
              CFStringAppend(v11, appendedString);
              CFStringReplaceAll(appendedString, &stru_1F08428B0);
              uint64_t v18 = MEMORY[0x1E4F14390];
            }
            if (!((v129 | HIDWORD(v129)) & 1 | (v14 == 0)))
            {
              CFStringAppend(v11, @" ");
              uint64_t v18 = MEMORY[0x1E4F14390];
              uint64_t v17 = 0;
              int v16 = 0;
              char v133 = 0;
              BOOL v13 = 0;
              uint64_t v129 = 1;
              goto LABEL_102;
            }
            uint64_t v17 = 0;
            int v16 = 0;
            char v133 = 0;
            goto LABEL_86;
          }
          if (v22 == 38)
          {
            uint64_t v17 = 0;
            int v16 = 0;
            BOOL v13 = 0;
            char v133 = 1;
            goto LABEL_102;
          }
        }
        if ((v133 & (v22 != 59)) != 1)
        {
          if ((v133 & (v22 == 59)) == 1)
          {
            CFStringAppendCharacters(appendedString, &chars, 1);
            CFStringRef v58 = (const __CFString *)[(__CFString *)appendedString ec_parseHTMLEntity];
            int v59 = [(__CFString *)appendedString isEqualToString:@"nbsp;"];
            if (v58
              && (v60 = v59, (CFIndex Length = CFStringGetLength(v58)) != 0)
              && ((int v62 = Length, !v60) || !((v129 | HIDWORD(v129)) & 1 | (v14 == 0))))
            {
              CFStringAppend(v11, v58);
              HIDWORD(v129) = 0;
              v14 += v62;
            }
            else
            {
              int v60 = v129;
            }
            CFStringReplaceAll(appendedString, &stru_1F08428B0);
            uint64_t v17 = 0;
            int v16 = 0;
            char v133 = 0;
            BOOL v13 = 0;
            LODWORD(v129) = v60;
          }
          else
          {
            CFStringAppendCharacters(v11, &chars, 1);
            uint64_t v17 = 0;
            int v16 = 0;
            BOOL v13 = 0;
            uint64_t v129 = 0;
            ++v14;
          }
          uint64_t v18 = MEMORY[0x1E4F14390];
          goto LABEL_102;
        }
        char v133 = 1;
        CFStringAppendCharacters(appendedString, &chars, 1);
        uint64_t v18 = MEMORY[0x1E4F14390];
        uint64_t v17 = 0;
        goto LABEL_85;
      }
LABEL_86:
      BOOL v13 = 0;
      goto LABEL_102;
    }
    unint64_t v28 = v15 + 1;
    *(_OWORD *)v142 = *(_OWORD *)theString;
    long long v143 = v157;
    long long v144 = v158;
    uint64_t v145 = v159;
    long long v138 = v152;
    long long v139 = v153;
    long long v140 = v154;
    long long v141 = v155;
    *(_OWORD *)v134 = *(_OWORD *)buffer;
    long long v135 = v149;
    long long v136 = v150;
    long long v137 = v151;
    uint64_t v29 = v158;
    unsigned int v131 = v17;
    if ((uint64_t)v158 <= v15 + 1) {
      goto LABEL_168;
    }
    uint64_t v30 = (UniChar *)v142[1];
    if (v142[1])
    {
      unint64_t v31 = *((void *)&v143 + 1) + v28;
    }
    else
    {
      if ((void)v143)
      {
        UniChar v32 = *(char *)(v143 + *((void *)&v143 + 1) + v28);
        goto LABEL_89;
      }
      if (v145 <= (uint64_t)v28 || (uint64_t v63 = *((void *)&v144 + 1), *((uint64_t *)&v144 + 1) > (uint64_t)v28))
      {
        uint64_t v64 = v15 - 3;
        if (v28 < 4) {
          uint64_t v64 = 0;
        }
        if (v64 + 64 < (uint64_t)v158) {
          uint64_t v29 = v64 + 64;
        }
        *((void *)&v144 + 1) = v64;
        uint64_t v145 = v29;
        v163.location = *((void *)&v143 + 1) + v64;
        v163.length = v29 - v64;
        CFStringGetCharacters(v142[0], v163, v134);
        uint64_t v18 = MEMORY[0x1E4F14390];
        uint64_t v63 = *((void *)&v144 + 1);
      }
      unint64_t v31 = v28 - v63;
      uint64_t v30 = v134;
    }
    UniChar v32 = v30[v31];
LABEL_89:
    if (v32 != 33) {
      goto LABEL_168;
    }
    uint64_t v46 = v15 + 2;
    uint64_t v47 = v144;
    if ((uint64_t)v144 <= v15 + 2) {
      goto LABEL_168;
    }
    unint64_t v48 = (UniChar *)v142[1];
    if (v142[1])
    {
      uint64_t v49 = *((void *)&v143 + 1) + v46;
    }
    else
    {
      if ((void)v143)
      {
        UniChar v50 = *(char *)(v143 + *((void *)&v143 + 1) + v46);
        goto LABEL_136;
      }
      if (v145 <= v46 || (uint64_t v73 = *((void *)&v144 + 1), *((uint64_t *)&v144 + 1) > v46))
      {
        uint64_t v74 = v15 - 2;
        if (v28 < 3) {
          uint64_t v74 = 0;
        }
        if (v74 + 64 < (uint64_t)v144) {
          uint64_t v47 = v74 + 64;
        }
        *((void *)&v144 + 1) = v74;
        uint64_t v145 = v47;
        v165.location = *((void *)&v143 + 1) + v74;
        v165.length = v47 - v74;
        CFStringGetCharacters(v142[0], v165, v134);
        uint64_t v18 = MEMORY[0x1E4F14390];
        uint64_t v73 = *((void *)&v144 + 1);
      }
      uint64_t v49 = v46 - v73;
      unint64_t v48 = v134;
    }
    UniChar v50 = v48[v49];
LABEL_136:
    if (v50 == 45)
    {
      uint64_t v68 = v15 + 3;
      uint64_t v69 = v144;
      if ((uint64_t)v144 > v15 + 3)
      {
        v70 = (UniChar *)v142[1];
        if (v142[1])
        {
          uint64_t v71 = *((void *)&v143 + 1) + v68;
        }
        else
        {
          if ((void)v143)
          {
            UniChar v72 = *(char *)(v143 + *((void *)&v143 + 1) + v68);
LABEL_166:
            if (v72 == 45)
            {
              BOOL v13 = 1;
              v15 += 3;
LABEL_110:
              uint64_t v17 = v131;
              goto LABEL_102;
            }
            goto LABEL_168;
          }
          if (v145 <= v68 || (uint64_t v120 = *((void *)&v144 + 1), *((uint64_t *)&v144 + 1) > v68))
          {
            uint64_t v121 = v15 - 1;
            if (v28 < 2) {
              uint64_t v121 = 0;
            }
            if (v121 + 64 < (uint64_t)v144) {
              uint64_t v69 = v121 + 64;
            }
            *((void *)&v144 + 1) = v121;
            uint64_t v145 = v69;
            v170.location = *((void *)&v143 + 1) + v121;
            v170.length = v69 - v121;
            CFStringGetCharacters(v142[0], v170, v134);
            uint64_t v18 = MEMORY[0x1E4F14390];
            uint64_t v120 = *((void *)&v144 + 1);
          }
          uint64_t v71 = v68 - v120;
          v70 = v134;
        }
        UniChar v72 = v70[v71];
        goto LABEL_166;
      }
    }
LABEL_168:
    BOOL v78 = v16 == 0;
    v147[4] = 0;
    *(_DWORD *)v147 = 0;
    uint64_t v79 = v15 + 64;
    uint64_t v80 = ~v15;
    uint64_t v81 = v15 + 65;
    uint64_t v82 = v15;
    do
    {
      uint64_t v83 = v82;
      uint64_t v84 = v80;
      uint64_t v85 = v81;
      ++v82;
      if (v83 < -1 || (uint64_t v86 = v158, (uint64_t)v158 <= v82))
      {
        unsigned int v88 = 0;
LABEL_174:
        int v89 = *(_DWORD *)(v18 + 4 * v88 + 60) & 0x4000;
        goto LABEL_175;
      }
      if (theString[1])
      {
        UniChar v87 = *((_WORD *)&theString[1]->isa + v83 + *((void *)&v157 + 1) + 1);
      }
      else if ((void)v157)
      {
        UniChar v87 = *(char *)(v157 + *((void *)&v157 + 1) + v83 + 1);
      }
      else
      {
        if (v159 <= v82 || (uint64_t v90 = *((void *)&v158 + 1), *((uint64_t *)&v158 + 1) > v82))
        {
          uint64_t v91 = v83 - 3;
          if ((unint64_t)v82 < 4) {
            uint64_t v91 = 0;
          }
          if (v91 + 64 < (uint64_t)v158) {
            uint64_t v86 = v91 + 64;
          }
          *((void *)&v158 + 1) = v91;
          uint64_t v159 = v86;
          v167.location = *((void *)&v157 + 1) + v91;
          v167.length = v86 - v91;
          CFStringGetCharacters(theString[0], v167, buffer);
          uint64_t v18 = MEMORY[0x1E4F14390];
          uint64_t v90 = *((void *)&v158 + 1);
        }
        UniChar v87 = buffer[v83 + 1 - v90];
      }
      unsigned int v88 = v87;
      if (v87 <= 0x7Fu) {
        goto LABEL_174;
      }
      int v89 = __maskrune(v87, 0x4000uLL);
      uint64_t v18 = MEMORY[0x1E4F14390];
LABEL_175:
      ++v79;
      uint64_t v80 = v84 - 1;
      uint64_t v81 = v85 + 1;
    }
    while (v89);
    uint64_t v17 = v131 + v78;
    if (v82 >= v126)
    {
      BOOL v13 = 0;
      unint64_t v12 = 0;
      uint64_t v11 = v127;
      a3 = v128;
    }
    else
    {
      *(_OWORD *)v142 = *(_OWORD *)theString;
      long long v143 = v157;
      long long v144 = v158;
      uint64_t v145 = v159;
      long long v138 = v152;
      long long v139 = v153;
      long long v140 = v154;
      long long v141 = v155;
      *(_OWORD *)v134 = *(_OWORD *)buffer;
      long long v135 = v149;
      long long v136 = v150;
      long long v137 = v151;
      if (v83 >= -1)
      {
        uint64_t v93 = v144;
        if ((uint64_t)v144 <= v82)
        {
          uint64_t v92 = 0;
        }
        else if (v142[1])
        {
          uint64_t v92 = *((unsigned __int16 *)&v142[1]->isa + *((void *)&v143 + 1) + v82);
        }
        else if ((void)v143)
        {
          uint64_t v92 = *(char *)(v143 + *((void *)&v143 + 1) + v82);
        }
        else
        {
          if (v145 <= v82 || (uint64_t v116 = *((void *)&v144 + 1), *((uint64_t *)&v144 + 1) > v82))
          {
            if ((unint64_t)v82 >= 4) {
              uint64_t v117 = 4;
            }
            else {
              uint64_t v117 = v82;
            }
            uint64_t v118 = v82 - v117 + 64;
            if (v118 >= (uint64_t)v144) {
              uint64_t v118 = v144;
            }
            *((void *)&v144 + 1) = v82 - v117;
            uint64_t v145 = v118;
            uint64_t v119 = v131 + v78;
            if ((uint64_t)v144 >= v79 - v117) {
              uint64_t v93 = v79 - v117;
            }
            v169.length = v93 + v117 - v82;
            v169.location = v82 - v117 + *((void *)&v143 + 1);
            CFStringGetCharacters(v142[0], v169, v134);
            uint64_t v17 = v119;
            uint64_t v116 = *((void *)&v144 + 1);
          }
          uint64_t v92 = v134[v82 - v116];
        }
      }
      else
      {
        uint64_t v92 = 0;
      }
      uint64_t v94 = 0;
      uint64_t v95 = v82 + 6;
      memset(v160, 170, 14);
      if ((unsigned __int16)v92 == 47) {
        unint64_t v96 = v82 + 1;
      }
      else {
        unint64_t v96 = v82;
      }
      v97 = &v134[v96];
      if ((unsigned __int16)v92 == 47) {
        ++v85;
      }
      uint64_t v98 = v84 - ((unsigned __int16)v92 == 47);
      unint64_t v99 = v96;
      do
      {
        if (v99 >= 4) {
          uint64_t v100 = 4;
        }
        else {
          uint64_t v100 = v99;
        }
        uint64_t v101 = v96 + v94;
        if ((uint64_t)(v96 + v94) < 0 || (uint64_t v102 = v144, (uint64_t)v144 <= v101))
        {
          UniChar v103 = 0;
        }
        else if (v142[1])
        {
          UniChar v103 = *((_WORD *)&v142[1]->isa + v96 + v94 + *((void *)&v143 + 1));
        }
        else if ((void)v143)
        {
          UniChar v103 = *(char *)(v143 + *((void *)&v143 + 1) + v96 + v94);
        }
        else
        {
          if (v145 <= v101 || (uint64_t v104 = *((void *)&v144 + 1), *((uint64_t *)&v144 + 1) > v101))
          {
            unint64_t v105 = v96 - v100;
            uint64_t v106 = -v100;
            uint64_t v107 = v100 + v98;
            uint64_t v108 = v85 - v100;
            uint64_t v109 = v94 + v105;
            uint64_t v110 = v109 + 64;
            if (v109 + 64 >= (uint64_t)v144) {
              uint64_t v110 = v144;
            }
            *((void *)&v144 + 1) = v109;
            uint64_t v145 = v110;
            unsigned int v125 = v14;
            int v132 = v16;
            uint64_t v124 = v9;
            uint64_t v111 = v17;
            if ((uint64_t)v144 >= v108) {
              uint64_t v102 = v108;
            }
            v168.length = v102 + v107;
            uint64_t v112 = v92;
            v113 = v97;
            v168.location = v96 + v94 + v106 + *((void *)&v143 + 1);
            CFStringGetCharacters(v142[0], v168, v134);
            v97 = v113;
            uint64_t v92 = v112;
            uint64_t v17 = v111;
            uint64_t v9 = v124;
            int v16 = v132;
            unsigned int v14 = v125;
            uint64_t v104 = *((void *)&v144 + 1);
          }
          UniChar v103 = v97[v94 - v104];
        }
        *((_WORD *)v160 + v94++) = v103;
        ++v99;
        --v98;
        ++v85;
      }
      while ((uint64_t)(v96 + v94) <= v95);
      uint64_t v114 = v17;
      if ((unsigned __int16)v92 == 47) {
        int v115 = -1;
      }
      else {
        int v115 = 1;
      }
      if (ustrncasecmp((char *)v160, "style", 5) && ustrncasecmp((char *)v160, "script", 6)) {
        int v115 = 0;
      }
      uint64_t v11 = v127;
      a3 = v128;
      uint64_t v18 = MEMORY[0x1E4F14390];
      uint64_t v17 = v114;
      BOOL v13 = 0;
      unint64_t v12 = 0;
      v16 += v115;
    }
LABEL_102:
    if (v14 >= a3) {
      break;
    }
    ++v15;
  }
  while (v15 < v9);
LABEL_251:
  if (appendedString) {
    CFRelease(appendedString);
  }
  return v11;
}

uint64_t ustrncasecmp(char *a1, char *a2, int a3)
{
  if (!a3) {
    return 0;
  }
  int v3 = a3;
  while (1)
  {
    __darwin_ct_rune_t v6 = *a2;
    char v7 = __tolower(*a1);
    char v8 = __tolower(v6);
    if (v7 < v8) {
      return 0xFFFFFFFFLL;
    }
    if (v8 < v7) {
      break;
    }
    a1 += 2;
    ++a2;
    if (!--v3) {
      return 0;
    }
  }
  return 1;
}

void sub_1AFB24680(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB248DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1AFB24A08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB24AD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB24BB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB24C98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB24E28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB252B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB253C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MFStringTransform;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1AFB25574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

__CFString *withMutableCharactersAndPadding(void *a1, void *a2)
{
  v23[5] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v5 = (void *)MEMORY[0x1B3E87F20]();
  unint64_t v6 = [v3 length];
  unint64_t v9 = v6;
  if (!v6)
  {
    int v22 = 166;
    goto LABEL_22;
  }
  if (v6 <= 0x18F)
  {
    unint64_t v10 = v6 + 1;
    MEMORY[0x1F4188790](v6, v7, v8);
    unint64_t v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    memset(v12, 170, 2 * v9 + 2);
    objc_msgSend(v3, "getCharacters:range:", v12, 0, v9);
    unsigned int v13 = v4[2](v4, v12, v9, v9 + 1);
    if ((v13 & 0x80000000) != 0)
    {
      unsigned int v14 = 0;
    }
    else if (v13)
    {
      if (v10 < v13) {
        __assert_rtn("withMutableCharactersAndPadding", "MFStringTransform.m", 178, "0");
      }
      unsigned int v14 = (__CFString *)[[NSString alloc] initWithCharacters:v12 length:v13];
    }
    else
    {
      unsigned int v14 = &stru_1F08428B0;
    }
    goto LABEL_17;
  }
  if (v6 > 0x98967F)
  {
    int v22 = 199;
LABEL_22:
    __assert_rtn("withMutableCharactersAndPadding", "MFStringTransform.m", v22, "0");
  }
  unint64_t v15 = v6 + 1;
  int v16 = [MEMORY[0x1E4F1CA58] dataWithLength:2 * (v6 + 1)];
  uint64_t v17 = [v16 bytes];
  objc_msgSend(v3, "getCharacters:range:", v17, 0, v9);
  unsigned int v18 = v4[2](v4, (char *)v17, v9, v9 + 1);
  unsigned int v19 = v18;
  if ((v18 & 0x80000000) != 0)
  {
    unsigned int v14 = 0;
  }
  else if (v18)
  {
    if (v15 < v18) {
      __assert_rtn("withMutableCharactersAndPadding", "MFStringTransform.m", 196, "0");
    }
    id v20 = [NSString alloc];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __withMutableCharactersAndPadding_block_invoke;
    v23[3] = &unk_1E5F89B00;
    v23[4] = v16;
    unsigned int v14 = (__CFString *)[v20 initWithCharactersNoCopy:v17 length:v19 deallocator:v23];
  }
  else
  {
    unsigned int v14 = &stru_1F08428B0;
  }

LABEL_17:

  return v14;
}

void sub_1AFB25888(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void withMutableCharacters(void *a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v5 = (void *)MEMORY[0x1B3E87F20]();
  unint64_t v6 = [v3 length];
  unint64_t v8 = v6;
  if (!v6)
  {
    int v13 = 143;
    goto LABEL_9;
  }
  if (v6 > 0x18F)
  {
    if (v6 <= 0x98967F)
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA58] dataWithLength:2 * v6];
      uint64_t v12 = [v11 bytes];
      objc_msgSend(v3, "getCharacters:range:", v12, 0, v8);
      v4[2](v4, v12, v8);

      goto LABEL_6;
    }
    int v13 = 154;
LABEL_9:
    __assert_rtn("withMutableCharacters", "MFStringTransform.m", v13, "0");
  }
  MEMORY[0x1F4188790](v6, v7, 2 * v6);
  unint64_t v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  memset(v10, 170, v9);
  objc_msgSend(v3, "getCharacters:range:", v10, 0, v8);
  v4[2](v4, (uint64_t)v10, v8);
LABEL_6:
}

void sub_1AFB25AEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __createTransliterator_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __createTransliterator_block_invoke_2;
  v3[3] = &unk_1E5F89B28;
  int v4 = a3;
  v3[4] = *(void *)(a1 + 32);
  v3[5] = a2;
  withMutableCharacters(@"SoftBankStrip", v3);
}

void __createTransliterator_block_invoke_2(uint64_t a1)
{
  int v4 = 0;
  uint64_t v2 = utrans_openU();
  if (v2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
  }
  else
  {
    id v3 = MFLogGeneral();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __createTransliterator_block_invoke_2_cold_1();
    }
  }
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void MFTestOverrideCanUseSoftBankCodePoints(int a1)
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    int v4 = [NSString stringWithUTF8String:"void MFTestOverrideCanUseSoftBankCodePoints(BOOL)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"MFStringUtils+SoftBank.m", 119, @"%s can only be called from unit tests", "void MFTestOverrideCanUseSoftBankCodePoints(BOOL)");
  }
  if (a1) {
    unsigned __int8 v2 = 1;
  }
  else {
    unsigned __int8 v2 = 2;
  }
  atomic_store(v2, (unsigned __int8 *)&sCanUseCodePoints);
}

void sub_1AFB25D34(_Unwind_Exception *a1)
{
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

void __softBankTransform_block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1 + 32;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), (id)sSoftBankTransform);
  if (!*(void *)(*(void *)(*(void *)v1 + 8) + 40))
  {
    uint64_t v24 = [MFStringTransform alloc];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    activeContexts();
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v2)
    {
      uint64_t v3 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v2; ++i)
        {
          if (*(void *)v34 != v3) {
            objc_enumerationMutation(obj);
          }
          uint64_t v5 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          unint64_t v6 = sharedCoreTelephonyClient();
          id v32 = 0;
          uint64_t v7 = (void *)[v6 copyCarrierBundleLocation:v5 error:&v32];
          id v8 = v32;

          if (!v7)
          {

            continue;
          }
          uint64_t v9 = [MEMORY[0x1E4F28B50] bundleWithPath:v7];
          unint64_t v10 = v9;
          if (!v9)
          {
            uint64_t v11 = MFLogGeneral();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
              __softBankTransform_block_invoke_cold_1(&v30, v31, v11);
            }
LABEL_19:
            int v16 = 3;
            goto LABEL_24;
          }
          uint64_t v11 = [v9 pathForResource:@"hexvalues" ofType:@"plist"];
          if (!v11) {
            goto LABEL_19;
          }
          id v29 = v8;
          uint64_t v12 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v11 options:0 error:&v29];
          id v13 = v29;

          unsigned int v14 = MFLogGeneral();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            int v18 = [v12 length];
            *(_DWORD *)buf = 67109379;
            LODWORD(v38[0]) = v18;
            WORD2(v38[0]) = 2117;
            *(void *)((char *)v38 + 6) = v5;
            _os_log_error_impl(&dword_1AFB03000, v14, OS_LOG_TYPE_ERROR, "MFStringTransform: Read hex values data (%{iec-bytes}u bytes) for %{sensitive}@", buf, 0x12u);
          }

          if (v12)
          {
            unint64_t v15 = MFLogGeneral();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138739971;
              v38[0] = v5;
              _os_log_error_impl(&dword_1AFB03000, v15, OS_LOG_TYPE_ERROR, "MFStringTransform: Found hex values data for %{sensitive}@", buf, 0xCu);
            }

            id v26 = v12;
            int v16 = 1;
          }
          else
          {
            uint64_t v17 = MFLogGeneral();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v38[0] = v13;
              _os_log_error_impl(&dword_1AFB03000, v17, OS_LOG_TYPE_ERROR, "MFStringTransform: Unable to read hex values in bundle: %{public}@", buf, 0xCu);
            }

            int v16 = 3;
          }

          id v8 = v13;
LABEL_24:

          if (v16 != 3) {
            goto LABEL_28;
          }
        }
        uint64_t v2 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v2);
    }
    id v26 = 0;
LABEL_28:

    obja = [(MFStringTransform *)v24 initWithSoftBankHexData:v26];
    if (obja)
    {
      unsigned int v19 = MFLogGeneral();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)UniChar v39 = 0;
        _os_log_impl(&dword_1AFB03000, v19, OS_LOG_TYPE_INFO, "SoftBank: Using SoftBank string transform.", v39, 2u);
      }

      id v20 = obja;
      uint64_t v21 = obja;
    }
    else
    {
      int v22 = MFLogGeneral();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)UniChar v39 = 0;
        _os_log_impl(&dword_1AFB03000, v22, OS_LOG_TYPE_INFO, "SoftBank: Not using SoftBank string transform.", v39, 2u);
      }

      uint64_t v21 = +[MFStringTransform identityTransform];
      id v20 = 0;
    }
    BOOL v23 = v20 == 0;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v21);
    if (v23) {

    }
    objc_storeStrong((id *)&sSoftBankTransform, *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  }
}

void sub_1AFB262F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id __activeContexts_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 context];
  if (!v3)
  {
    int v4 = MFLogGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __activeContexts_block_invoke_cold_1((uint64_t)v2, v4);
    }
  }
  return v3;
}

void sub_1AFB2641C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB26618(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB266C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB2683C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB268A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB26900(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB26B10(_Unwind_Exception *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_1AFB26BEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB26C50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB26D00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB26DB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB26F10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB26FEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB270B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB27228(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB27334(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB2742C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __computeHasEncryptedDescendant_block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  unint64_t v6 = v5;
  if (*(id *)(a1 + 32) != v5)
  {
    [v5 decodeIfNecessary];
    char v8 = 0;
    id v7 = (id)[v6 decryptedMessageBodyIsEncrypted:&v8 isSigned:0];
    if (v8)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a3 = 1;
    }
  }
}

void sub_1AFB27518(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB27AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

id __keyboardsUpdated()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v0 synchronize];

  return +[MFMimeCharset allMimeCharsets:1];
}

void sub_1AFB27C20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB27D24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB27D8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB28034(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB280B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB28150(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB28270(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB28458(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB28730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

uint64_t _indexOfEncodingInCharsets(unsigned int a1, void *a2)
{
  id v3 = a2;
  if ([v3 count] && (uint64_t v4 = objc_msgSend(v3, "count")) != 0)
  {
    uint64_t v5 = 0;
    uint64_t v6 = a1;
    while (1)
    {
      id v7 = [v3 objectAtIndex:v5];
      uint64_t v8 = [v7 encoding];

      if (v8 == v6) {
        break;
      }
      if (v4 == ++v5) {
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

void sub_1AFB28860(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB28900(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _convertKeyboardsArrayToLanguages(void *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v13 = a1;
  id v14 = [MEMORY[0x1E4F1CA48] array];
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v13;
  uint64_t v1 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v1)
  {
    uint64_t v17 = *(void *)v20;
    uint64_t v2 = *MEMORY[0x1E4F1C438];
    uint64_t v3 = *MEMORY[0x1E4F1C470];
    do
    {
      uint64_t v18 = v1;
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:*(void *)(*((void *)&v19 + 1) + 8 * i)];
        uint64_t v6 = [v5 objectForKey:v2];
        id v7 = [v5 objectForKey:v3];
        id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v9 = v8;
        if (v6) {
          [v8 setObject:v6 forKey:v2];
        }
        if (v7) {
          [v9 setObject:v7 forKey:v3];
        }
        unint64_t v10 = [MEMORY[0x1E4F1CA20] localeIdentifierFromComponents:v9];
        uint64_t v11 = [MEMORY[0x1E4F1CA20] canonicalLocaleIdentifierFromString:v10];

        if (v11 && ([v16 containsObject:v11] & 1) == 0)
        {
          [v14 addObject:v11];
          [v16 addObject:v11];
        }
      }
      uint64_t v1 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v1);
  }

  return v14;
}

void sub_1AFB28B64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void ___copyEncodingsForLocaleIdentifier_block_invoke()
{
  id v0 = objc_opt_new();
  CFArrayRef Mutable = CFArrayCreateMutable(0, 0, 0);
  uint64_t v2 = Mutable;
  if (Mutable)
  {
    CFArrayAppendValue(Mutable, (const void *)0x820);
    CFArrayAppendValue(v2, (const void *)0x420);
    [v0 setObject:v2 forKey:@"ja"];
    CFRelease(v2);
  }
  uint64_t v3 = CFArrayCreateMutable(0, 0, 0);
  uint64_t v4 = v3;
  if (v3)
  {
    CFArrayAppendValue(v3, (const void *)0x930);
    CFArrayAppendValue(v4, (const void *)0x830);
    CFArrayAppendValue(v4, (const void *)0xA05);
    [v0 setObject:v4 forKey:@"zh-Hans"];
    CFRelease(v4);
  }
  uint64_t v5 = CFArrayCreateMutable(0, 0, 0);
  uint64_t v6 = v5;
  if (v5)
  {
    CFArrayAppendValue(v5, (const void *)0xA03);
    CFArrayAppendValue(v6, (const void *)0xA06);
    CFArrayAppendValue(v6, (const void *)0x930);
    [v0 setObject:v6 forKey:@"zh-Hant"];
    CFRelease(v6);
  }
  id v7 = CFArrayCreateMutable(0, 0, 0);
  id v8 = v7;
  if (v7)
  {
    CFArrayAppendValue(v7, (const void *)0x632);
    CFArrayAppendValue(v8, (const void *)0x421);
    [v0 setObject:v8 forKey:@"zh"];
    CFRelease(v8);
  }
  uint64_t v9 = CFArrayCreateMutable(0, 0, 0);
  unint64_t v10 = v9;
  if (v9)
  {
    CFArrayAppendValue(v9, (const void *)0x940);
    [v0 setObject:v10 forKey:@"ko"];
    CFRelease(v10);
  }
  uint64_t v11 = CFArrayCreateMutable(0, 0, 0);
  uint64_t v12 = v11;
  if (v11)
  {
    CFArrayAppendValue(v11, (const void *)0xA02);
    CFArrayAppendValue(v12, (const void *)0x205);
    CFArrayAppendValue(v12, (const void *)0x502);
    [v0 setObject:v12 forKey:@"ru"];
    CFRelease(v12);
  }
  uint64_t v13 = [v0 copy];

  id v14 = (void *)_copyEncodingsForLocaleIdentifier_regionEncodingMapping;
  _copyEncodingsForLocaleIdentifier_regionEncodingMapping = v13;
}

void sub_1AFB28E2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB28EE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _EnDecodeData(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  MFDataConsumerConsumeCompleteData(v6, v7);
  [v6 done];
  [v5 done];
  id v8 = [v5 data];

  return v8;
}

void sub_1AFB28F8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _decodeBase64Data(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = objc_alloc_init(MFBufferedDataConsumer);
  id v7 = [(MFBaseFilterDataConsumer *)[MFBase64Decoder alloc] initWithConsumer:v6];
  [(MFBase64Decoder *)v7 setConvertCommas:a2];
  if (a3)
  {
    id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B8]), "initWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v5, "bytes") + *a3, a3[1], 0);
    [(MFBase64Decoder *)v7 setIsBound:1];
  }
  else
  {
    id v8 = 0;
  }
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = v5;
  }
  MFDataConsumerConsumeCompleteData(v7, v9);
  [(MFBase64Decoder *)v7 done];
  [(MFBufferedDataConsumer *)v6 done];
  if (a3)
  {
    uint64_t v10 = a3[1];
    a3[1] = v10 - [(MFBase64Decoder *)v7 unconverted];
  }
  uint64_t v11 = [(MFBufferedDataConsumer *)v6 data];

  return v11;
}

void sub_1AFB290E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _encodeBase64Data(void *a1, int a2, uint64_t a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = objc_alloc_init(MFBufferedDataConsumer);
  uint64_t v9 = [(MFBaseFilterDataConsumer *)[MFBase64Encoder alloc] initWithConsumer:v8];
  uint64_t v10 = v9;
  if (a2) {
    [(MFBase64Encoder *)v9 setStandardLineBreak];
  }
  [(MFBase64Encoder *)v10 setAllowSlash:a3];
  if (a4 != 61) {
    [(MFBase64Encoder *)v10 setPadChar:a4];
  }
  uint64_t v11 = _EnDecodeData(v8, v10, v7);

  return v11;
}

void sub_1AFB29204(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB29D40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1AFB2A450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

uint64_t _UniquingDescribe(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return [v3 stringWithFormat:@"<%@:%p>", NSStringFromClass(v4), a2];
}

void sub_1AFB2ABE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _appendToDescriptionWithIndent(uint64_t a1, void *a2, unsigned int a3)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = (void *)[(id)a1 bodyParameterKeys];
  if (a3)
  {
    id v7 = (__CFString *)[MEMORY[0x1E4F28E78] stringWithCapacity:objc_msgSend(@"|   ", "length") * a3];
    unsigned int v8 = a3;
    do
    {
      [(__CFString *)v7 appendString:@"|   "];
      --v8;
    }
    while (v8);
  }
  else
  {
    id v7 = &stru_1F08428B0;
  }
  [a2 appendFormat:@"\n%@<%@:%p>", v7, objc_opt_class(), a1];
  if (![(__CFString *)v7 length]) {
    [a2 appendFormat:@" (mimeBody=<%@:%p>)", objc_opt_class(), objc_msgSend((id)a1, "mimeBody")];
  }
  [a2 appendString:@"\n"];
  if (*(void *)(a1 + 8) || *(void *)(a1 + 16) || [v6 count])
  {
    [a2 appendString:v7];
    [a2 appendString:@"Content-Type: "];
    if (*(void *)(a1 + 8)) {
      objc_msgSend(a2, "appendString:");
    }
    [a2 appendString:@"/"];
    if (*(void *)(a1 + 16)) {
      objc_msgSend(a2, "appendString:");
    }
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v9 = [v6 countByEnumeratingWithState:&v46 objects:v52 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v47;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v47 != v11) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(a2, "appendFormat:", @";\n%@    %@=%@",
            v7,
            *(void *)(*((void *)&v46 + 1) + 8 * v12),
            [(id)a1 bodyParameterForKey:*(void *)(*((void *)&v46 + 1) + 8 * v12)]);
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v6 countByEnumeratingWithState:&v46 objects:v52 count:16];
      }
      while (v10);
    }
    [a2 appendString:@"\n"];
  }
  if (*(void *)(a1 + 32))
  {
    [a2 appendString:v7];
    [a2 appendString:@"Content-Transfer-Encoding: "];
    [a2 appendString:*(void *)(a1 + 32)];
    [a2 appendString:@"\n"];
  }
  uint64_t v13 = (__CFString *)[(id)a1 disposition];
  id v14 = (void *)[(id)a1 dispositionParameterKeys];
  unint64_t v15 = v14;
  if (v13)
  {
    [a2 appendString:v7];
    [a2 appendString:@"Content-Disposition: "];
  }
  else
  {
    if (![v14 count]) {
      goto LABEL_37;
    }
    [a2 appendString:v7];
    uint64_t v13 = @"Content-Disposition: ";
  }
  [a2 appendString:v13];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v42 objects:v51 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v43;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v43 != v18) {
          objc_enumerationMutation(v15);
        }
        objc_msgSend(a2, "appendFormat:", @";\n%@    %@=%@",
          v7,
          *(void *)(*((void *)&v42 + 1) + 8 * v19),
          [(id)a1 dispositionParameterForKey:*(void *)(*((void *)&v42 + 1) + 8 * v19)]);
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v42 objects:v51 count:16];
    }
    while (v17);
  }
  [a2 appendString:@"\n"];
LABEL_37:
  uint64_t v20 = [(id)a1 contentDescription];
  if (v20)
  {
    uint64_t v21 = v20;
    [a2 appendString:v7];
    [a2 appendString:@"Content-Description: "];
    [a2 appendString:v21];
    [a2 appendString:@"\n"];
  }
  uint64_t v22 = [(id)a1 contentID];
  if (v22)
  {
    uint64_t v23 = v22;
    [a2 appendString:v7];
    [a2 appendString:@"Content-ID: "];
    [a2 appendString:v23];
    [a2 appendString:@"\n"];
  }
  uint64_t v24 = [(id)a1 contentLocation];
  if (v24)
  {
    uint64_t v25 = v24;
    [a2 appendString:v7];
    [a2 appendString:@"Content-Location: "];
    [a2 appendString:v25];
    [a2 appendString:@"\n"];
  }
  uint64_t v26 = [(id)a1 languages];
  if (v26)
  {
    UniChar v27 = (void *)v26;
    [a2 appendString:v7];
    [a2 appendString:@"Content-Language: "];
    objc_msgSend(a2, "appendString:", objc_msgSend(v27, "componentsJoinedByString:", @" "));
    [a2 appendString:@"\n"];
  }
  uint64_t v28 = *(void *)(a1 + 56);
  if (*(void *)(a1 + 48) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v28) {
      [a2 appendFormat:@"%@X-Content-Length: %lu\n", v7, v28, v37];
    }
  }
  else
  {
    [a2 appendFormat:@"%@X-Content-Range: %lu/%lu\n", v7, *(void *)(a1 + 48), v28];
  }
  id v29 = (void *)[(id)a1 _objectInOtherIvarsForKey:@"x-signed-data"];
  if (v29) {
    [a2 appendFormat:@"%@X-Signed-Part: %lu bytes @ %p\n", v7, objc_msgSend(v29, "length"), objc_msgSend(v29, "bytes")];
  }
  uint64_t v30 = [(id)a1 partNumber];
  if (v30) {
    [a2 appendFormat:@"%@X-IMAP-Part-Number: %@\n", v7, v30];
  }
  if (([*(id *)(a1 + 8) isEqualToString:@"multipart"] & 1) != 0
    || (uint64_t result = [*(id *)(a1 + 8) isEqualToString:@"message"], result)
    && (uint64_t result = [*(id *)(a1 + 16) isEqualToString:@"rfc822"], result))
  {
    id v32 = (void *)[(id)a1 subparts];
    [a2 appendFormat:@"%@X-Subpart-Count: %lu\n", v7, objc_msgSend(v32, "count")];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t result = [v32 countByEnumeratingWithState:&v38 objects:v50 count:16];
    if (result)
    {
      uint64_t v33 = result;
      uint64_t v34 = a3 + 1;
      uint64_t v35 = *(void *)v39;
      do
      {
        uint64_t v36 = 0;
        do
        {
          if (*(void *)v39 != v35) {
            objc_enumerationMutation(v32);
          }
          _appendToDescriptionWithIndent(*(void *)(*((void *)&v38 + 1) + 8 * v36++), a2, v34);
        }
        while (v33 != v36);
        uint64_t result = [v32 countByEnumeratingWithState:&v38 objects:v50 count:16];
        uint64_t v33 = result;
      }
      while (result);
    }
  }
  return result;
}

BOOL _isCalendar(void *a1)
{
  uint64_t v2 = (void *)[a1 type];
  uint64_t v3 = [a1 subtype];
  int v4 = [v2 isEqualToString:@"text"];
  BOOL result = 0;
  if (v4)
  {
    if (v3) {
      return [@"calendar" caseInsensitiveCompare:v3] == 0;
    }
  }
  return result;
}

__CFString *_MFDecodeText(void *a1, CFStringEncoding *a2)
{
  uint64_t v2 = _MFCopyDecodeText(a1, a2);
  return v2;
}

uint64_t MFMimePartSetValueForPreservedHeader(void *a1, uint64_t a2, __CFString *a3)
{
  id v5 = _UniqueString(a3);
  return [a1 _setObjectInOtherIvars:a2 forKey:v5];
}

void *_parseUuencodedParts(void *a1, int a2, void *a3, unint64_t a4, size_t a5)
{
  id v7 = a3;
  uint64_t v9 = (const char *)[a3 bytes];
  uint64_t v10 = v9;
  if (a5 >= 7 && strncasecmp(v9, "begin ", 6uLL) && !strnstr(v10, "\nbegin ", a5)) {
    return 0;
  }
  if (_parseUuencodedParts_onceToken != -1) {
    dispatch_once(&_parseUuencodedParts_onceToken, &__block_literal_global_712);
  }
  uint64_t v11 = [[NSString alloc] initWithBytesNoCopy:v10 length:a5 encoding:1 freeWhenDone:0];
  uint64_t v12 = (void *)v11;
  if (!a5)
  {
    uint64_t v13 = 0;
LABEL_31:

    return v13;
  }
  uint64_t v33 = v7;
  uint64_t v34 = v10;
  uint64_t v13 = 0;
  uint64_t v35 = (void *)v11;
  size_t v36 = a4 + a5;
  CFStringEncoding encoding = -1;
  do
  {
    id v14 = objc_msgSend((id)_parseUuencodedParts_uuencodeRegex, "firstMatchInString:options:range:", v12, 16, a4, a5);
    if (!v14) {
      break;
    }
    unint64_t v15 = v14;
    unint64_t v16 = [v14 range];
    uint64_t v18 = v17;
    uint64_t v19 = [v15 rangeAtIndex:1];
    uint64_t v21 = v20;
    uint64_t v22 = objc_msgSend(v7, "mf_rangeOfCString:options:range:", "\nend\n", 1, v16 + v18, a5 + a4 - (v16 + v18));
    if (v22 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v12 = v35;
      break;
    }
    uint64_t v24 = v22;
    uint64_t v25 = v23;
    if (!v13)
    {
      uint64_t v13 = (void *)[MEMORY[0x1E4F1CA48] array];
      if (a2 != -1) {
        CFStringEncoding encoding = MEMORY[0x1B3E87980]();
      }
      int v26 = encoding;
      if (encoding == 256) {
        int v26 = 134217984;
      }
      if (v26 == -1) {
        int v26 = 1280;
      }
      CFStringEncoding encoding = v26;
    }
    if (v16 > a4)
    {
      UniChar v27 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", objc_msgSend(a1, "zone")), "init");
      objc_msgSend(v27, "setRange:", a4, v16 - a4);
      [v13 addObject:v27];

      id v7 = v33;
    }
    if (v21) {
      uint64_t v21 = (__CFString *)CFStringCreateWithBytes(0, (const UInt8 *)&v34[v19], (CFIndex)v21, encoding, 0);
    }
    if (![(__CFString *)v21 length])
    {

      uint64_t v21 = @"mime-attachment";
    }
    uint64_t v28 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", objc_msgSend(a1, "zone")), "init");
    objc_msgSend(v28, "setRange:", v16, v25 - v16 + v24);
    [v28 setContentTransferEncoding:@"x-uuencode"];
    [v28 setType:@"application"];
    [v28 setSubtype:@"octet-stream"];
    [v28 setDisposition:@"attachment"];
    [v28 setDispositionParameter:v21 forKey:@"filename"];

    [v13 addObject:v28];
    a4 = v25 + v24;
    uint64_t v12 = v35;
    a5 = v36 - (v25 + v24);
  }
  while (v36 != v25 + v24);

  if (v13)
  {
    size_t v29 = a5 + a4;
    size_t v30 = v36 - (a5 + a4);
    if (v30)
    {
      uint64_t v12 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", objc_msgSend(a1, "zone")), "init");
      objc_msgSend(v12, "setRange:", v29, v30);
      [v13 addObject:v12];
      goto LABEL_31;
    }
  }
  return v13;
}

uint64_t _setupDictionaryFromArray(void *a1, void **a2, CFArrayRef theArray)
{
  uint64_t result = CFArrayGetCount(theArray);
  if (result >= 2)
  {
    uint64_t v7 = result;
    for (CFIndex i = 1; i < v7; i += 2)
    {
      ValueAtIndex = (__CFString *)CFArrayGetValueAtIndex(theArray, i - 1);
      uint64_t result = (uint64_t)CFArrayGetValueAtIndex(theArray, i);
      if (ValueAtIndex)
      {
        uint64_t v10 = (const void *)result;
        if (result)
        {
          CFTypeID TypeID = CFStringGetTypeID();
          uint64_t result = CFGetTypeID(ValueAtIndex);
          if (TypeID == result)
          {
            CFTypeID v12 = CFStringGetTypeID();
            uint64_t result = CFGetTypeID(v10);
            if (v12 == result)
            {
              uint64_t v13 = _UniqueString(ValueAtIndex);
              uint64_t result = (uint64_t)_MFSetValueInDictionary(a1, a2, (uint64_t)v13, (uint64_t)v10);
            }
          }
        }
      }
    }
  }
  return result;
}

__CFString *_MFCopyDecodeText(void *a1, CFStringEncoding *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29060], "currentThread"), "threadDictionary");
  uint64_t v12 = 0;
  unsigned __int8 v11 = 0;
  id v5 = (__CFString *)objc_msgSend(a1, "copyBodyDataToOffset:resultOffset:downloadIfNecessary:isComplete:", _MFOffsetFromThreadDictionary(v4), &v12, objc_msgSend((id)objc_msgSend(v4, "objectForKey:", @"__MIME_PART_DECODE_DOWNLOAD"), "BOOLValue"), &v11);
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v12), @"__MIME_PART_DECODE_RESULT_OFFSET");
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", v11), @"__MIME_PART_RESULT_IS_COMPLETE");
  if (a2) {
    *a2 = -1;
  }
  if (v5
    && (([(__CFString *)v5 mf_rangeOfCString:"\r\n"], !v6)
     || (uint64_t v7 = (__CFString *)[(__CFString *)v5 mutableCopy],
         v5,
         [(__CFString *)v7 mf_convertNetworkLineEndingsToUnix],
         (id v5 = v7) != 0)))
  {
    unsigned int v8 = MFCreateStringWithData(v5, [a1 textEncoding], a2);
  }
  else
  {
    uint64_t v9 = MFLogGeneral();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      id v14 = a1;
      _os_log_impl(&dword_1AFB03000, v9, OS_LOG_TYPE_INFO, "---self=%p nil data!", buf, 0xCu);
    }
    id v5 = 0;
    unsigned int v8 = 0;
  }

  return v8;
}

uint64_t ___parseUuencodedParts_block_invoke()
{
  uint64_t result = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"^begin +[0-9]+ +(.+)$" options:17 error:0];
  _parseUuencodedParts_uuencodeRegex = result;
  return result;
}

uint64_t ___parseSubparts_block_invoke()
{
  uint64_t result = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"^\\-\\-(.+)[ \t]*$" options:16 error:0];
  _parseSubparts_mimeBoundaryRegex = result;
  return result;
}

void sub_1AFB2DB58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB2DBB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB2DED4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB2DFE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB2E124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB2E1D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB2E268(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB2E3E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB2E4A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB2E548(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB2E5CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB2E734(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL MFGetTypeInfo(void *a1, int a2)
{
  id v3 = a1;
  int v4 = v3;
  if (a2)
  {
    id v5 = v3;
    uint64_t v6 = v5;
    if ((a2 & 2) != 0)
    {
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v7 = [v5 filename];
      unsigned int v8 = [v7 pathExtension];
      uint64_t v9 = [v8 lowercaseString];
    }
    uint64_t v10 = off_1E5F89C98;
    while (1)
    {
      if ((a2 & 1) == 0)
      {
        unsigned __int8 v11 = *(v10 - 4);
        if (v11)
        {
          uint64_t v12 = [v6 mimeType];
          uint64_t v13 = [v11 caseInsensitiveCompare:v12];

          if (!v13) {
            goto LABEL_17;
          }
        }
      }
      if ((a2 & 2) == 0)
      {
        id v14 = *(v10 - 3);
        if (v14)
        {
          uint64_t v15 = [v6 pathExtension];
          uint64_t v16 = [v14 caseInsensitiveCompare:v15];

          if (!v16) {
            break;
          }
          uint64_t v17 = [v6 filename];

          if (v17)
          {
            if ([v9 isEqualToString:v14]) {
              break;
            }
          }
        }
      }
LABEL_20:
      if (a2)
      {
        BOOL v18 = v10 >= MFMIMEErrorDomain;
        v10 += 4;
        if (!v18) {
          continue;
        }
      }

      goto LABEL_24;
    }
    if ((a2 & 1) != 0 && *(v10 - 4))
    {
      objc_msgSend(v6, "setMimeType:");
      a2 &= ~1u;
    }
LABEL_17:
    if (*(v10 - 3) && (a2 & 2) != 0)
    {
      objc_msgSend(v6, "setPathExtension:");
      a2 &= ~2u;
    }
    goto LABEL_20;
  }
LABEL_24:

  return a2 == 0;
}

void sub_1AFB2E970(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB2EA4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB2EBFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB2ED00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB2EE04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB2EF5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB2F018(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB2F1A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB2F450(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB2F5DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB2F84C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB2FA3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB2FF18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_1AFB3016C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB30280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB30418(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB3067C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB30914(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB309D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB30A58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB30AE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB30C24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB30DA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB31430(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB31520(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB316D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB31738()
{
  JUMPOUT(0x1AFB31728);
}

void sub_1AFB31744()
{
}

void sub_1AFB317F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB31860(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB319B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB31B74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB31D24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL MFProtectFileDescriptor(int a1, uint64_t a2)
{
  return (a1 & 0x80000000) == 0 && fcntl(a1, 64, a2) != -1;
}

void sub_1AFB31F34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB32184(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB3243C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

id MFRemoveItemAtURL(void *a1)
{
  uint64_t v1 = [a1 path];
  uint64_t v2 = MFRemoveItemAtPath(v1);

  return v2;
}

void sub_1AFB32520(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id MFRemoveItemAtPath(void *a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1
    && (id v3 = v1,
        (int v4 = removefile((const char *)[v3 fileSystemRepresentation], 0, 1u)) != 0))
  {
    id v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28328];
    v10[0] = v3;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    uint64_t v7 = [v5 errorWithDomain:*MEMORY[0x1E4F28798] code:v4 userInfo:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void sub_1AFB32640(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _mfEnableLockTesting()
{
  sMFLockTesting = 1;
}

uint64_t _mfLockEncounteredError()
{
  uint64_t result = sMFLockEncounteredError;
  sMFLockEncounteredError = 0;
  return result;
}

uint64_t __mfEnableCallStackLogging()
{
  id v0 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
  objc_msgSend(v0, "registerDefaults:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", *MEMORY[0x1E4F1CFD0], @"MFLockCallStackLoggingEnabled"));
  id v1 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  return [v1 postNotificationName:@"MFLockCallStackLoggingEnabled" object:0];
}

uint64_t _MFTryObjectLock(uint64_t a1)
{
  pthread_t v2 = pthread_self();
  pthread_t v3 = v2;
  int v4 = *(__int16 *)(a1 + 72);
  if (v4 < 0)
  {
    if (v2 == *(pthread_t *)(a1 + 16))
    {
      __int16 v13 = v4 & 0x8000 | (v4 + 1) & 0x7FFF;
    }
    else
    {
      uint64_t v10 = (void *)[MEMORY[0x1E4F60DF8] currentDesignator];
      if (v10) {
        uint64_t v11 = [v10 priority];
      }
      else {
        uint64_t v11 = -1;
      }
      CFArrayRef Mutable = *(const __CFArray **)(a1 + 80);
      if (!Mutable)
      {
        CFArrayRef Mutable = CFArrayCreateMutable(0, 0, 0);
        *(void *)(a1 + 80) = Mutable;
      }
      v23.length = CFArrayGetCount(Mutable);
      v23.location = 0;
      CFIndex v15 = CFArrayBSearchValues(Mutable, v23, (const void *)v11, (CFComparatorFunction)_comparePriorities, 0);
      CFArrayInsertValueAtIndex(*(CFMutableArrayRef *)(a1 + 80), v15, (const void *)v11);
      while (*(void *)(a1 + 16) || CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 80), 0) != (const void *)v11)
      {
        v22.tv_sec = 0;
        v22.tv_nsec = 0;
        if (pthread_cond_timedwait((pthread_cond_t *)(a1 + 24), &sMutex, &v22) == 60)
        {
          int v16 = 0;
          goto LABEL_25;
        }
      }
      int v16 = 1;
LABEL_25:
      CFArrayRef v17 = *(const __CFArray **)(a1 + 80);
      v24.length = CFArrayGetCount(v17);
      v24.location = 0;
      CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v17, v24, (const void *)v11);
      if (FirstIndexOfValue != -1) {
        CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 80), FirstIndexOfValue);
      }
      if (!v16)
      {
        uint64_t v12 = 0;
        goto LABEL_35;
      }
      uint64_t v19 = *(void **)(a1 + 8);
      if (_mfCallStackLoggingEnabled())
      {
        id v20 = objc_alloc_init(MEMORY[0x1E4F28B28]);
        if (!objc_getAssociatedObject(v19, @"MFLock Call Stack Symbols")) {
          objc_setAssociatedObject(v19, @"MFLock Call Stack Symbols", (id)[MEMORY[0x1E4F29060] callStackSymbols], (void *)0x301);
        }
        [v20 drain];
      }
      *(void *)(a1 + 16) = v3;
      __int16 v13 = *(_WORD *)(a1 + 72) & 0x8000 | 1;
    }
    *(_WORD *)(a1 + 72) = v13;
    goto LABEL_34;
  }
  __int16 v5 = *(_WORD *)(a1 + 80);
  *(_WORD *)(a1 + 80) = v5 + 1;
  uint64_t v6 = *(_opaque_pthread_t **)(a1 + 16);
  if (v6) {
    BOOL v7 = v2 == v6;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    unsigned int v8 = *(void **)(a1 + 8);
    if (_mfCallStackLoggingEnabled())
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F28B28]);
      if (!objc_getAssociatedObject(v8, @"MFLock Call Stack Symbols")) {
        objc_setAssociatedObject(v8, @"MFLock Call Stack Symbols", (id)[MEMORY[0x1E4F29060] callStackSymbols], (void *)0x301);
      }
      [v9 drain];
    }
    *(_WORD *)(a1 + 72) = *(_WORD *)(a1 + 72) & 0x8000 | (*(_WORD *)(a1 + 72) + 1) & 0x7FFF;
    *(void *)(a1 + 16) = v3;
LABEL_34:
    uint64_t v12 = 1;
    goto LABEL_35;
  }
  uint64_t v12 = 0;
  *(_WORD *)(a1 + 80) = v5;
LABEL_35:
  pthread_mutex_unlock(&sMutex);
  return v12;
}

uint64_t _mfIsLockedOnThisThread(uint64_t a1)
{
  pthread_mutex_lock(&__threadLockRelationsLock);
  CFDictionaryRef v2 = (const __CFDictionary *)__threadLockRelations;
  pthread_t v3 = pthread_self();
  uint64_t v4 = objc_msgSend((id)CFDictionaryGetValue(v2, v3), "containsObject:", a1);
  pthread_mutex_unlock(&__threadLockRelationsLock);
  return v4;
}

uint64_t ___mfCallStackLoggingEnabled_block_invoke_2()
{
  Boolean keyExistsAndHasValidFormat = 0;
  uint64_t result = CFPreferencesGetAppBooleanValue(@"MFLockCallStackLoggingEnabled", (CFStringRef)*MEMORY[0x1E4F1D3D8], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v1 = result == 0;
  }
  else {
    BOOL v1 = 1;
  }
  char v2 = !v1;
  _mfCallStackLoggingEnabled___loggingDefaultEnabled = v2;
  return result;
}

uint64_t ___mfCallStackLoggingEnabled_block_invoke_3(uint64_t a1)
{
  char v2 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
  objc_msgSend(v2, "registerDefaults:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", *MEMORY[0x1E4F1CFD0], @"MFLockCallStackLoggingEnabled"));
  pthread_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

uint64_t _comparePriorities(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 1;
  if (a1 >= a2) {
    uint64_t v2 = -1;
  }
  if (a1 == a2) {
    return 0;
  }
  else {
    return v2;
  }
}

uint64_t OUTLINED_FUNCTION_0_1(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend(a1, "_mf_dumpLockCallStacks:ordering:", a2, a3);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_impl(a1, v9, OS_LOG_TYPE_DEFAULT, a4, &a9, 0x16u);
}

void sub_1AFB33574(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB3376C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB33840(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB33D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB33FA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB343E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFB3454C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFB34768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AFB348F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  TemporaryFile::~TemporaryFile((TemporaryFile *)va);
  _Unwind_Resume(a1);
}

uint64_t DecodeBuffer::parse(DecodeBuffer *a1, uint64_t a2, uint64_t a3)
{
  v9[4] = *MEMORY[0x1E4F143B8];
  if (!DecodeBuffer::parseHeader(a1)) {
    return 0;
  }
  std::__function::__value_func<void ()(unsigned char)>::__value_func[abi:nn180100]((uint64_t)v9, a2);
  std::__function::__value_func<void ()(LineOfOutput const&)>::__value_func[abi:nn180100]((uint64_t)v8, a3);
  uint64_t v6 = DecodeBuffer::parseLines(a1, (uint64_t)v9, (uint64_t)v8);
  std::__function::__value_func<void ()(LineOfOutput const&)>::~__value_func[abi:nn180100](v8);
  std::__function::__value_func<void ()(unsigned char)>::~__value_func[abi:nn180100](v9);
  return v6;
}

void sub_1AFB349E0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, void);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  std::__function::__value_func<void ()(LineOfOutput const&)>::~__value_func[abi:nn180100]((uint64_t *)va);
  std::__function::__value_func<void ()(unsigned char)>::~__value_func[abi:nn180100]((uint64_t *)va1);
  _Unwind_Resume(a1);
}

FILE *TemporaryFile::mappedData(TemporaryFile *this)
{
  uint64_t v2 = (FILE *)*((void *)this + 2);
  if (v2)
  {
    fflush(v2);
    uint64_t v2 = (FILE *)mmap(0, *((void *)this + 3), 1, 1, *(_DWORD *)this, 0);
    if (v2)
    {
      uint64_t v3 = v2;
      id v4 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      uint64_t v2 = (FILE *)[v4 initWithBytesNoCopy:v3 length:*((void *)this + 3) deallocator:*MEMORY[0x1E4F28210]];
    }
  }
  return v2;
}

void OutputBuffer::OutputBuffer(OutputBuffer *this, uint64_t a2)
{
  *(void *)this = 0;
  uint64_t v3 = [MEMORY[0x1E4F1CA58] dataWithLength:a2];
  *((void *)this + 1) = v3;
  uint64_t v4 = [v3 mutableBytes];
  *((void *)this + 2) = v4;
  *((void *)this + 3) = v4 + [*((id *)this + 1) length];
}

void sub_1AFB34AEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void DecodeBuffer::DecodeBuffer(DecodeBuffer *this, NSData *a2)
{
  uint64_t v3 = a2;
  *(void *)this = [(NSData *)v3 bytes];
  uint64_t v4 = v3;
  uint64_t v5 = [(NSData *)v4 bytes];
  *((void *)this + 1) = v5 + [(NSData *)v4 length];
  uint64_t v6 = v4;
  *((void *)this + 2) = [(NSData *)v6 bytes];
}

void sub_1AFB34B7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DecodeBuffer::parseHeader(DecodeBuffer *this)
{
  if (!*(void *)this) {
    return 0;
  }
  uint64_t v2 = *((void *)this + 2);
  unint64_t v3 = *((void *)this + 1) - v2;
  if (v3 < 6) {
    return 0;
  }
  unint64_t v4 = 0;
  if (v3 >= 0x78) {
    unint64_t v3 = 120;
  }
  uint64_t v5 = (unsigned __int8 *)(v2 + v3);
  while (1)
  {
    int v6 = *(unsigned __int8 *)(v2 + v4);
    if (v6 == 10 || v6 == 13) {
      break;
    }
    if (v3 == ++v4) {
      return 0;
    }
  }
  unint64_t v8 = v3 - v4;
  if (v3 == v4 || v4 < 6 || strncmp(*((const char **)this + 2), "begin ", 6uLL)) {
    return 0;
  }
  uint64_t v10 = (unsigned __int8 *)(v2 + v4);
  uint64_t v11 = (unsigned __int8 *)(v2 + v4 + v8);
  while (1)
  {
    int v12 = *v10;
    if (v12 != 13 && v12 != 10) {
      break;
    }
    ++v10;
    if (!--v8)
    {
      uint64_t v10 = v11;
      break;
    }
  }
  if (v10 == v5) {
    return 0;
  }
  *((void *)this + 2) = v10;
  return 1;
}

uint64_t DecodeBuffer::parseLines(DecodeBuffer *a1, uint64_t a2, uint64_t a3)
{
  v10[4] = *MEMORY[0x1E4F143B8];
  do
  {
    std::__function::__value_func<void ()(unsigned char)>::__value_func[abi:nn180100]((uint64_t)v10, a2);
    std::__function::__value_func<void ()(LineOfOutput const&)>::__value_func[abi:nn180100]((uint64_t)v9, a3);
    int v6 = DecodeBuffer::parseSingleLine(a1, (uint64_t)v10, (uint64_t)v9);
    std::__function::__value_func<void ()(LineOfOutput const&)>::~__value_func[abi:nn180100](v9);
    std::__function::__value_func<void ()(unsigned char)>::~__value_func[abi:nn180100](v10);
    if (v6 == 2) {
      int v7 = 3;
    }
    else {
      int v7 = 0;
    }
    if (!v6) {
      int v7 = 1;
    }
  }
  while (!v7);
  if (v7 == 1) {
    return 0;
  }
  else {
    return DecodeBuffer::parseFinalLine(a1);
  }
}

void sub_1AFB34D48(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, void);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  std::__function::__value_func<void ()(LineOfOutput const&)>::~__value_func[abi:nn180100]((uint64_t *)va);
  std::__function::__value_func<void ()(unsigned char)>::~__value_func[abi:nn180100]((uint64_t *)va1);
  _Unwind_Resume(a1);
}

uint64_t DecodeBuffer::parseSingleLine(DecodeBuffer *this, uint64_t a2, uint64_t a3)
{
  v13[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (unsigned __int8 *)*((void *)this + 1);
  unint64_t v4 = (unsigned __int8 *)*((void *)this + 2);
  if (v3 == v4) {
    return 0;
  }
  int v5 = *v4;
  if ((v5 - 97) < 0xFFFFFFBF) {
    return 0;
  }
  unint64_t v8 = v4 + 1;
  *((void *)this + 2) = v8;
  unint64_t v9 = ((_BYTE)v5 + 32) & 0x3F;
  if (v9 == 45)
  {
    if ((unint64_t)(v3 - v8) >= 0x42)
    {
      std::__function::__value_func<void ()(LineOfOutput const&)>::__value_func[abi:nn180100]((uint64_t)v13, a3);
      char v10 = DecodeBuffer::parseLineFast(this, (uint64_t)v13);
      std::__function::__value_func<void ()(LineOfOutput const&)>::~__value_func[abi:nn180100](v13);
      return (v10 & 1) != 0;
    }
LABEL_13:
    std::__function::__value_func<void ()(unsigned char)>::__value_func[abi:nn180100]((uint64_t)v12, a2);
    char v11 = DecodeBuffer::parseLineSlow(this, v9, (uint64_t)v12);
    std::__function::__value_func<void ()(unsigned char)>::~__value_func[abi:nn180100](v12);
    return (v11 & 1) != 0;
  }
  if ((((_BYTE)v5 + 32) & 0x3F) != 0) {
    goto LABEL_13;
  }
  if (DecodeBuffer::parseNewline(this)) {
    return 2;
  }
  else {
    return 0;
  }
}

void sub_1AFB34E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__function::__value_func<void ()(LineOfOutput const&)>::~__value_func[abi:nn180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t DecodeBuffer::parseFinalLine(DecodeBuffer *this)
{
  uint64_t v2 = *((void *)this + 1);
  uint64_t v1 = *((void *)this + 2);
  if ((unint64_t)(v2 - v1) < 3 || strncmp(*((const char **)this + 2), "end", 3uLL)) {
    return 0;
  }
  *((void *)this + 2) = v1 + 3;
  if (v2 == v1 + 3) {
    return 1;
  }
  uint64_t result = DecodeBuffer::parseNewline(this);
  if (result) {
    return 1;
  }
  return result;
}

uint64_t DecodeBuffer::parseNewline(DecodeBuffer *this)
{
  uint64_t v2 = (unsigned __int8 *)*((void *)this + 1);
  uint64_t v1 = (unsigned __int8 *)*((void *)this + 2);
  if (v2 == v1) {
    return 0;
  }
  int v3 = *v1;
  if (v3 != 13 && v3 != 10) {
    return 0;
  }
  *((void *)this + 2) = v1 + 1;
  if (v2 != v1 + 1)
  {
    int v5 = v1[1];
    if (v5 == 13 || v5 == 10) {
      *((void *)this + 2) = v1 + 2;
    }
  }
  return 1;
}

uint64_t DecodeBuffer::parseLineFast(DecodeBuffer *a1, uint64_t a2)
{
  uint64_t v2 = (int8x16_t *)*((void *)a1 + 2);
  if (*((void *)a1 + 1) - (void)v2 <= 0x41uLL) {
    DecodeBuffer::parseLineFast();
  }
  v4.i64[0] = 0x2020202020202020;
  v4.i64[1] = 0x2020202020202020;
  v5.i64[0] = 0x3F3F3F3F3F3F3F3FLL;
  v5.i64[1] = 0x3F3F3F3F3F3F3F3FLL;
  v20.val[0] = vandq_s8(vaddq_s8(*v2, v4), v5);
  *((void *)a1 + 2) = v2 + 1;
  v20.val[1] = vandq_s8(vaddq_s8(v2[1], v4), v5);
  *((void *)a1 + 2) = v2 + 2;
  v21.val[0] = vandq_s8(vaddq_s8(v2[2], v4), v5);
  *((void *)a1 + 2) = v2 + 3;
  v21.val[1] = vandq_s8(vaddq_s8(v2[3], v4), v5);
  *((void *)a1 + 2) = (char *)v2 + 60;
  int8x16_t v6 = vqtbl2q_s8(v21, (int8x16_t)xmmword_1AFB40520);
  v5.i64[0] = vqtbl2q_s8(v20, (int8x16_t)xmmword_1AFB40530).u64[0];
  v5.i64[1] = vextq_s8(v6, v6, 8uLL).u64[0];
  int8x16_t v7 = vqtbl2q_s8(v21, (int8x16_t)xmmword_1AFB40540);
  v8.i64[0] = vqtbl2q_s8(v20, (int8x16_t)xmmword_1AFB40550).u64[0];
  v8.i64[1] = vextq_s8(v7, v7, 8uLL).u64[0];
  int8x16_t v9 = vqtbl2q_s8(v21, (int8x16_t)xmmword_1AFB40560);
  v10.i64[0] = vqtbl2q_s8(v20, (int8x16_t)xmmword_1AFB40570).u64[0];
  v10.i64[1] = vextq_s8(v9, v9, 8uLL).u64[0];
  int8x16_t v11 = vqtbl2q_s8(v21, (int8x16_t)xmmword_1AFB40580);
  v20.val[0].i64[0] = vqtbl2q_s8(v20, (int8x16_t)xmmword_1AFB40590).u64[0];
  v20.val[0].i64[1] = vextq_s8(v11, v11, 8uLL).u64[0];
  v20.val[1] = vorrq_s8(vshlq_n_s8(v5, 2uLL), (int8x16_t)vshrq_n_u8(v8, 4uLL));
  int8x16_t v12 = vorrq_s8(vshlq_n_s8((int8x16_t)v8, 4uLL), (int8x16_t)vshrq_n_u8(v10, 2uLL));
  v21.val[0] = vorrq_s8(vshlq_n_s8((int8x16_t)v10, 6uLL), v20.val[0]);
  int8x16_t v13 = vqtbl2q_s8(*(int8x16x2_t *)((char *)&v20 + 16), (int8x16_t)xmmword_1AFB405A0);
  v20.val[0] = vqtbl2q_s8(v21, (int8x16_t)xmmword_1AFB405B0);
  int8x16_t v14 = vqtbl2q_s8(*(int8x16x2_t *)((char *)&v20 + 16), (int8x16_t)xmmword_1AFB405C0);
  v19[0] = v20.val[0];
  v19[1] = vqtbl2q_s8(v21, (int8x16_t)xmmword_1AFB405D0);
  int8x16_t v15 = vqtbl2q_s8(*(int8x16x2_t *)((char *)&v20 + 16), (int8x16_t)xmmword_1AFB405E0);
  v19[2] = vqtbl2q_s8(v21, (int8x16_t)xmmword_1AFB405F0);
  uint64_t v16 = *(void *)(a2 + 24);
  if (v16)
  {
    (*(void (**)(uint64_t, _OWORD *))(*(void *)v16 + 48))(v16, v19);
    return DecodeBuffer::parseNewline(a1);
  }
  else
  {
    uint64_t v18 = std::__throw_bad_function_call[abi:nn180100]();
    return DecodeBuffer::parseLineSlow(v18);
  }
}

uint64_t DecodeBuffer::parseLineSlow(DecodeBuffer *a1, unint64_t a2, uint64_t a3)
{
  if (a2)
  {
    unint64_t v6 = 0;
    int8x16_t v7 = (unsigned __int8 *)*((void *)a1 + 2);
    while (1)
    {
      unint64_t v8 = *((void *)a1 + 1) - (void)v7;
      if (!v8) {
        return 0;
      }
      if (a2 - v6 >= 3) {
        break;
      }
      if (v8 < 2) {
        return 0;
      }
      unsigned __int8 v13 = *v7;
      if ((*v7 - 97) < 0xBFu) {
        return 0;
      }
      int v14 = v7[1];
      if ((v14 - 32) > 0x40) {
        return 0;
      }
      std::function<void ()(unsigned char)>::operator()(a3, ((4 * v13) | ((v14 + 32) >> 4) & 3) ^ 0x80);
      uint64_t v15 = *((void *)a1 + 2);
      int8x16_t v7 = (unsigned __int8 *)(v15 + 2);
      *((void *)a1 + 2) = v15 + 2;
      unint64_t v16 = v6 + 1;
      if (v6 + 1 < a2)
      {
        if (*((unsigned __int8 **)a1 + 1) == v7) {
          return 0;
        }
        int v17 = *v7;
        if ((v17 - 97) < 0xBFu) {
          return 0;
        }
        unsigned int v10 = ((v17 + 32) >> 2) & 0xF | (16 * *(unsigned __int8 *)(v15 + 1));
        uint64_t v11 = 1;
        uint64_t v12 = 2;
        goto LABEL_18;
      }
LABEL_19:
      unint64_t v6 = v16;
      if (v16 >= a2) {
        goto LABEL_23;
      }
    }
    if (v8 < 4) {
      return 0;
    }
    if ((*v7 - 97) < 0xBFu) {
      return 0;
    }
    int v9 = v7[1];
    if ((v9 - 97) < 0xBFu || v7[2] - 97 < 0xFFFFFFBF || v7[3] - 32 > 0x40) {
      return 0;
    }
    std::function<void ()(unsigned char)>::operator()(a3, ((4 * *v7) | ((v9 + 32) >> 4) & 3) ^ 0x80);
    std::function<void ()(unsigned char)>::operator()(a3, (16 * *(unsigned char *)(*((void *)a1 + 2) + 1)) | ((*(unsigned __int8 *)(*((void *)a1 + 2) + 2) + 32) >> 2) & 0xF);
    LOBYTE(v10) = (*(unsigned char *)(*((void *)a1 + 2) + 3) + 32) & 0x3F | (*(unsigned char *)(*((void *)a1 + 2) + 2) << 6);
    uint64_t v11 = 4;
    uint64_t v12 = 3;
LABEL_18:
    std::function<void ()(unsigned char)>::operator()(a3, v10);
    int8x16_t v7 = (unsigned __int8 *)(*((void *)a1 + 2) + v11);
    *((void *)a1 + 2) = v7;
    unint64_t v16 = v6 + v12;
    goto LABEL_19;
  }
  int8x16_t v7 = (unsigned __int8 *)*((void *)a1 + 2);
LABEL_23:
  uint64_t v19 = (unsigned __int8 *)*((void *)a1 + 1);
  if (v19 != v7 && *v7 == 96) {
    *((void *)a1 + 2) = ++v7;
  }
  if (v19 != v7 && *v7 == 96) {
    *((void *)a1 + 2) = v7 + 1;
  }
  return DecodeBuffer::parseNewline(a1);
}

uint64_t std::__throw_bad_function_call[abi:nn180100]()
{
  return std::function<void ()(unsigned char)>::operator()();
}

uint64_t std::function<void ()(unsigned char)>::operator()(uint64_t a1, char a2)
{
  char v6 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (v2) {
    return (*(uint64_t (**)(uint64_t, char *))(*(void *)v2 + 48))(v2, &v6);
  }
  uint64_t v4 = std::__throw_bad_function_call[abi:nn180100]();
  return std::__function::__value_func<void ()(unsigned char)>::__value_func[abi:nn180100](v4, v5);
}

uint64_t std::__function::__value_func<void ()(unsigned char)>::__value_func[abi:nn180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

uint64_t std::__function::__value_func<void ()(LineOfOutput const&)>::__value_func[abi:nn180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

void TemporaryFile::TemporaryFile(TemporaryFile *this)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)this = -1;
  *((void *)this + 1) = 0;
  uint64_t v2 = (void *)((char *)this + 8);
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v4 = [v3 temporaryDirectory];
  uint64_t v5 = [v4 URLByAppendingPathComponent:@"uudecode.XXXXXXXXXXXXXXXX"];

  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)((char *)v13 + 12) = v6;
  v12[16] = v6;
  v13[0] = v6;
  v12[14] = v6;
  v12[15] = v6;
  v12[12] = v6;
  v12[13] = v6;
  v12[10] = v6;
  v12[11] = v6;
  v12[8] = v6;
  v12[9] = v6;
  v12[6] = v6;
  v12[7] = v6;
  void v12[4] = v6;
  v12[5] = v6;
  v12[2] = v6;
  v12[3] = v6;
  v12[0] = v6;
  v12[1] = v6;
  if ([v5 getFileSystemRepresentation:v12 maxLength:299])
  {
    int v7 = mkstemp((char *)v12);
    *(_DWORD *)this = v7;
    if (v7 >= 1)
    {
      uint64_t v8 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v12 isDirectory:0 relativeToURL:0];
      int v9 = (void *)*((void *)this + 1);
      *((void *)this + 1) = v8;

      int v10 = *(_DWORD *)this;
      if (*((void *)this + 1))
      {
        *((void *)this + 2) = fdopen(v10, "w");
      }
      else
      {
        close(v10);
        *(_DWORD *)this = -1;
      }
      uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v11 removeItemAtURL:*v2 error:0];
    }
  }
}

void sub_1AFB356AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void TemporaryFile::~TemporaryFile(TemporaryFile *this)
{
  uint64_t v2 = (FILE *)*((void *)this + 2);
  if (v2) {
    fclose(v2);
  }
}

void *std::__function::__value_func<void ()(unsigned char)>::~__value_func[abi:nn180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void *std::__function::__value_func<void ()(LineOfOutput const&)>::~__value_func[abi:nn180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

uint64_t OutputBuffer::write(uint64_t this, char a2)
{
  uint64_t v3 = this;
  uint64_t v4 = *(unsigned char **)(this + 16);
  if (*(void *)(this + 24) <= (unint64_t)v4)
  {
    objc_msgSend(*(id *)(this + 8), "setLength:", objc_msgSend(*(id *)(this + 8), "length") + 1000);
    uint64_t v5 = [*(id *)(v3 + 8) mutableBytes];
    long long v6 = *(void **)(v3 + 8);
    uint64_t v7 = v5 + *(void *)v3;
    *(void *)(v3 + 16) = v7;
    this = [v6 length];
    *(void *)(v3 + 24) = v7 + this;
    uint64_t v4 = *(unsigned char **)(v3 + 16);
  }
  unsigned char *v4 = a2;
  ++*(void *)(v3 + 16);
  ++*(void *)v3;
  return this;
}

BOOL std::type_info::operator==[abi:nn180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

__n128 OutputBuffer::write(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (*(void *)(a1 + 24) < (unint64_t)(v4 + 45))
  {
    objc_msgSend(*(id *)(a1 + 8), "setLength:", objc_msgSend(*(id *)(a1 + 8), "length") + 1000);
    uint64_t v5 = [*(id *)(a1 + 8) mutableBytes];
    long long v6 = *(void **)(a1 + 8);
    uint64_t v7 = v5 + *(void *)a1;
    *(void *)(a1 + 16) = v7;
    *(void *)(a1 + 24) = v7 + [v6 length];
    uint64_t v4 = *(void *)(a1 + 16);
  }
  __n128 result = *(__n128 *)a2;
  long long v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v4 + 29) = *(_OWORD *)(a2 + 29);
  *(__n128 *)uint64_t v4 = result;
  *(_OWORD *)(v4 + 16) = v9;
  *(void *)(a1 + 16) += 45;
  *(void *)a1 += 45;
  return result;
}

void _MFCreateStringWithBytesViaICU_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AFB03000, a2, OS_LOG_TYPE_ERROR, "_MFCreateStringWithBytesViaICU: cannot process input buffer of length %lu", (uint8_t *)&v2, 0xCu);
}

void MFGetRandomBytes_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_1AFB03000, a2, a3, "*** Unable to open /dev/urandom: %s", (uint8_t *)a2);
}

void MFGetRandomBytes_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_1AFB03000, a2, a3, "*** Failed to read bytes from /dev/urandom: %s", (uint8_t *)a2);
}

void MFGetRandomBytes_cold_3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_1AFB03000, a2, a3, "*** Unexpected EOF on /dev/urandom: %s", (uint8_t *)a2);
}

void __createTransliterator_block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1AFB03000, v0, v1, "MFStringTransform: utrans_openU() failed.", v2, v3, v4, v5, v6);
}

void __createTransliterator_block_invoke_2_cold_2(int *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1AFB03000, a2, OS_LOG_TYPE_ERROR, "MFStringTransform: utrans_openU() failed (%d).", (uint8_t *)v3, 8u);
}

void __softBankTransform_block_invoke_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1AFB03000, log, OS_LOG_TYPE_ERROR, "MFStringTransform: Unable to read bundle.", buf, 2u);
}

void activeContexts_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AFB03000, a2, OS_LOG_TYPE_ERROR, "MFStringTransform: Failed to get active CTXPCContexts: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __activeContexts_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AFB03000, a2, OS_LOG_TYPE_ERROR, "MFStringTransform: Failed to create request context for CTXPCContextInfo %p.", (uint8_t *)&v2, 0xCu);
}

void _getFilenameEncodingHint_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1AFB03000, log, OS_LOG_TYPE_DEBUG, "*** part=%p result=%@", (uint8_t *)&v3, 0x16u);
}

void _mfUnregisterLockOnThisThread_cold_1()
{
  id v0 = MFLogGeneral();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    pthread_self();
    OUTLINED_FUNCTION_1_0(&dword_1AFB03000, v1, v2, "#Warning Unlocked lock %@ on thread %p that did not own it", v3, v4, v5, v6, 2u);
  }
  CFShow((CFTypeRef)__threadLockRelations);
  __assert_rtn("_mfUnregisterLockOnThisThread", "NSLockAdditions.m", 231, "0");
}

void _mfUnregisterLockOnThisThread_cold_2()
{
  id v0 = MFLogGeneral();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    pthread_self();
    OUTLINED_FUNCTION_1_0(&dword_1AFB03000, v1, v2, "#Warning No thread set for %@ on thread %p", v3, v4, v5, v6, 2u);
  }
  CFShow((CFTypeRef)__threadLockRelations);
  __assert_rtn("_mfUnregisterLockOnThisThread", "NSLockAdditions.m", 221, "threadSet");
}

void DecodeBuffer::parseLineFast()
{
  __assert_rtn("parseLineFast", "uudecoder.mm", 192, "DecodeBuffer::byteCountNeededForSIMD <= remainingCount()");
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9718](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9720](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9728](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1F40D70E8](allocator, size, hint);
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x1F40D70F8](allocator, context);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x1F40D7110]();
}

void CFAllocatorSetDefault(CFAllocatorRef allocator)
{
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
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

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7198](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D71C8](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFCharacterSetAddCharactersInRange(CFMutableCharacterSetRef theSet, CFRange theRange)
{
}

CFCharacterSetRef CFCharacterSetCreateCopy(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7708](alloc, theSet);
}

CFMutableCharacterSetRef CFCharacterSetCreateMutable(CFAllocatorRef alloc)
{
  return (CFMutableCharacterSetRef)MEMORY[0x1F40D7718](alloc);
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7738](alloc, theString);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7740](theSetIdentifier);
}

void CFCharacterSetInvert(CFMutableCharacterSetRef theSet)
{
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x1F40D7770](theSet, theChar);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1F40D77A8](cf);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1F40D7818](allocator, bytes, length, bytesDeallocator);
}

void CFDataDeleteBytes(CFMutableDataRef theData, CFRange range)
{
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1F40D7858](theData);
}

void CFDataIncreaseLength(CFMutableDataRef theData, CFIndex extraLength)
{
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1F40D7A18](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1F40D8128](mode, returnAfterSourceHandled, seconds);
}

void CFShow(CFTypeRef obj)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
}

CFStringRef CFStringConvertEncodingToIANACharSetName(CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D83A0](*(void *)&encoding);
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return MEMORY[0x1F40D83A8](*(void *)&encoding);
}

CFStringEncoding CFStringConvertIANACharSetNameToEncoding(CFStringRef theString)
{
  return MEMORY[0x1F40D83B8](theString);
}

CFStringEncoding CFStringConvertNSStringEncodingToEncoding(unint64_t encoding)
{
  return MEMORY[0x1F40D83C0](encoding);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x1F40D83F8](alloc, theString, *(void *)&encoding, lossByte);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8410](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1F40D8458](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithCharactersNoCopy(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1F40D8470](alloc, chars, numChars, contentsDeallocator);
}

void CFStringDelete(CFMutableStringRef theString, CFRange range)
{
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1F40D84D8](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1F40D8500](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1F40D8540](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFStringEncoding CFStringGetMostCompatibleMacStringEncoding(CFStringEncoding encoding)
{
  return MEMORY[0x1F40D85A8](*(void *)&encoding);
}

CFRange CFStringGetRangeOfComposedCharactersAtIndex(CFStringRef theString, CFIndex theIndex)
{
  CFIndex v2 = MEMORY[0x1F40D85D8](theString, theIndex);
  result.length = v3;
  result.location = v2;
  return result;
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x1F40D85E0]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

Boolean CFStringIsEncodingAvailable(CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8638](*(void *)&encoding);
}

void CFStringReplace(CFMutableStringRef theString, CFRange range, CFStringRef replacement)
{
}

void CFStringReplaceAll(CFMutableStringRef theString, CFStringRef replacement)
{
}

uint64_t ECGetNextHeaderFromDataInRange()
{
  return MEMORY[0x1F4117878]();
}

uint64_t EFAtomicObjectLoad()
{
  return MEMORY[0x1F4117A20]();
}

uint64_t EFAtomicObjectRelease()
{
  return MEMORY[0x1F4117A28]();
}

uint64_t EFAtomicObjectSetIfNil()
{
  return MEMORY[0x1F4117A40]();
}

uint64_t EFIsRunningUnitTests()
{
  return MEMORY[0x1F4117AC8]();
}

uint64_t EFStringWithInt()
{
  return MEMORY[0x1F4117B48]();
}

uint64_t EFStringWithInt64()
{
  return MEMORY[0x1F4117B50]();
}

uint64_t MFLogGeneral()
{
  return MEMORY[0x1F412EFB8]();
}

NSHashTable *__cdecl NSCreateHashTable(NSHashTableCallBacks *callBacks, NSUInteger capacity)
{
  return (NSHashTable *)MEMORY[0x1F40E7048](callBacks, capacity);
}

void NSDeallocateMemoryPages(void *ptr, NSUInteger bytes)
{
}

void *__cdecl NSHashGet(NSHashTable *table, const void *pointer)
{
  return (void *)MEMORY[0x1F40E70E8](table, pointer);
}

void NSHashInsert(NSHashTable *table, const void *pointer)
{
}

void *__cdecl NSHashInsertIfAbsent(NSHashTable *table, const void *pointer)
{
  return (void *)MEMORY[0x1F40E70F8](table, pointer);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E7110]();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E7140](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

NSUInteger NSRoundUpToMultipleOfPageSize(NSUInteger bytes)
{
  return MEMORY[0x1F40E7240](bytes);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
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

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _ECIsNetworkActivityAllowed()
{
  return MEMORY[0x1F4117888]();
}

uint64_t _NSMethodExceptionProem()
{
  return MEMORY[0x1F40E7398]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
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

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

uint64_t __memmove_chk()
{
  return MEMORY[0x1F40C9C30]();
}

uint64_t __memset_chk()
{
  return MEMORY[0x1F40C9C38]();
}

int __snprintf_chk(char *a1, size_t a2, int a3, size_t a4, const char *a5, ...)
{
  return MEMORY[0x1F40C9C98](a1, a2, *(void *)&a3, a4, a5);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9CF8](*(void *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9D00](*(void *)&a1);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
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

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

uint64_t dirstat_np()
{
  return MEMORY[0x1F40CB918]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x1F40CBA00](data, applier);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA20](data1, data2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x1F40CC070](*(void *)&a1, a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1F40CC0C8](a1);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1F40CC2F0](*(void *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1F40CC4C0]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CC590](path, name, value, size, *(void *)&position, *(void *)&options);
}

char *__cdecl index(const char *a1, int a2)
{
  return (char *)MEMORY[0x1F40CC658](a1, *(void *)&a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1F40CC8F8](*(void *)&a1, a2, *(void *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CC900](a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1F40CCE08](a1);
}

char *__cdecl mktemp(char *a1)
{
  return (char *)MEMORY[0x1F40CCE28](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
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
  return (id)MEMORY[0x1F4181718](object, key);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1F4181778](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
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
  return (id)MEMORY[0x1F4181A18](location, obj);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD978](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1F40CD988](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD990](a1);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x1F40CD998](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1F40CD9A8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1F40CDAC8](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40CDB30]();
}

int putc(int a1, FILE *a2)
{
  return MEMORY[0x1F40CDBA0](*(void *)&a1, a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1F40CDC88](__ptr, __size);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x1F40CDD18](path, state, *(void *)&flags);
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x1F40CDD48](path, name, *(void *)&options);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CDFD8](path, name, value, size, *(void *)&position, *(void *)&options);
}

void srandomdev(void)
{
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CE138](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1F40CE1D8](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1F40CE210](__big, __little, __len);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2E0](__str, __endptr, *(void *)&__base);
}

int truncate(const char *a1, off_t a2)
{
  return MEMORY[0x1F40CE5B0](a1, a2);
}

uint64_t ucnv_close()
{
  return MEMORY[0x1F417FC30]();
}

uint64_t ucnv_open()
{
  return MEMORY[0x1F417FCB8]();
}

uint64_t ucnv_setFallback()
{
  return MEMORY[0x1F417FCD8]();
}

uint64_t ucnv_toUChars()
{
  return MEMORY[0x1F417FCF8]();
}

uint64_t ucsdet_close()
{
  return MEMORY[0x1F417FDF0]();
}

uint64_t ucsdet_detectAll()
{
  return MEMORY[0x1F417FE00]();
}

uint64_t ucsdet_enableInputFilter()
{
  return MEMORY[0x1F417FE08]();
}

uint64_t ucsdet_getConfidence()
{
  return MEMORY[0x1F417FE10]();
}

uint64_t ucsdet_getName()
{
  return MEMORY[0x1F417FE18]();
}

uint64_t ucsdet_getUChars()
{
  return MEMORY[0x1F417FE20]();
}

uint64_t ucsdet_open()
{
  return MEMORY[0x1F417FE28]();
}

uint64_t ucsdet_setText()
{
  return MEMORY[0x1F417FE30]();
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

uint64_t utrans_close()
{
  return MEMORY[0x1F41807F0]();
}

uint64_t utrans_openU()
{
  return MEMORY[0x1F41807F8]();
}

uint64_t utrans_transUChars()
{
  return MEMORY[0x1F4180808]();
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}