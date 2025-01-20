void sub_1C8702C7C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C8708DB8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C870BE20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1C870CE1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C8711598(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C8711724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C8711A84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C8711C4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C8711F38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
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

void sub_1C87120EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CFTypeRef _DASecCopyIdentityFromPersist(CFTypeRef a1)
{
  keys[2] = *(void **)MEMORY[0x1E4F143B8];
  if (a1)
  {
    v1 = (void *)*MEMORY[0x1E4F3BD40];
    keys[0] = *(void **)MEMORY[0x1E4F3BC80];
    keys[1] = v1;
    values[0] = *(void **)MEMORY[0x1E4F1CFD0];
    values[1] = (void *)a1;
    CFDictionaryRef v2 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, 0, 0);
    CFTypeRef result = 0;
    OSStatus v3 = SecItemCopyMatching(v2, &result);
    if (v2) {
      CFRelease(v2);
    }
    if (v3)
    {
      v4 = DALoggingwithCategory();
      os_log_type_t v5 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 3);
      if (os_log_type_enabled(v4, v5))
      {
        *(_DWORD *)buf = 67109120;
        OSStatus v8 = v3;
        _os_log_impl(&dword_1C86FF000, v4, v5, "Could not find identity for persistent ref. %d", buf, 8u);
      }
    }
    return result;
  }
  return a1;
}

void *_DASecDeleteIdentityByPersistentRef(void *result)
{
  keys[1] = *(void **)MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = (void *)*MEMORY[0x1E4F3BD40];
    values = result;
    keys[0] = v1;
    CFDictionaryRef v2 = CFDictionaryCreate(0, (const void **)keys, (const void **)&values, 1, 0, 0);
    OSStatus v3 = SecItemDelete(v2);
    if (v2) {
      CFRelease(v2);
    }
    if (v3)
    {
      v4 = DALoggingwithCategory();
      os_log_type_t v5 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 3);
      if (os_log_type_enabled(v4, v5))
      {
        v6[0] = 67109120;
        v6[1] = v3;
        _os_log_impl(&dword_1C86FF000, v4, v5, "Could not delete identity by persistent ref. %d", (uint8_t *)v6, 8u);
      }
    }
    return (void *)(v3 == 0);
  }
  return result;
}

id _DASecIdentityCopySSLClientAuthenticationChain(__SecIdentity *a1)
{
  SecPolicyRef SSL = SecPolicyCreateSSL(0, 0);
  if (SSL)
  {
    SecPolicyRef v3 = SSL;
    SecCertificateRef certificateRef = 0;
    v4 = 0;
    if (!SecIdentityCopyCertificate(a1, &certificateRef))
    {
      os_log_type_t v5 = [MEMORY[0x1E4F1CA48] arrayWithObject:certificateRef];
      CFRelease(certificateRef);
      SecTrustRef trust = 0;
      v4 = 0;
      if (!SecTrustCreateWithCertificates(v5, v3, &trust))
      {
        int v11 = 0;
        if (MEMORY[0x1C87CC8A0](trust, &v11))
        {
          v4 = 0;
        }
        else
        {
          CFIndex CertificateCount = SecTrustGetCertificateCount(trust);
          v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:CertificateCount];
          [v4 addObject:a1];
          CFIndex v7 = CertificateCount - 2;
          if (CertificateCount >= 2)
          {
            uint64_t v8 = 0;
            CFIndex v9 = CertificateCount - 1;
            do
            {
              if (v7 != v8 || v11 != 4) {
                objc_msgSend(v4, "addObject:", SecTrustGetCertificateAtIndex(trust, v8 + 1));
              }
              ++v8;
            }
            while (v9 != v8);
          }
        }
        CFRelease(trust);
      }
    }
    CFRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

uint64_t DAIsRunningInDataAccessD()
{
  return _sDAIsRunningInDataAccessD;
}

void setDAIsRunningInDataAccessD()
{
  _sDAIsRunningInDataAccessD = 1;
}

id acDataclassForDADataclass(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  switch(a1)
  {
    case 1:
      CFDictionaryRef v2 = (id *)MEMORY[0x1E4F17AD8];
      goto LABEL_13;
    case 2:
      CFDictionaryRef v2 = (id *)MEMORY[0x1E4F17A90];
      goto LABEL_13;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_6;
    case 4:
      CFDictionaryRef v2 = (id *)MEMORY[0x1E4F17A80];
      goto LABEL_13;
    case 8:
      CFDictionaryRef v2 = (id *)MEMORY[0x1E4F17A98];
      goto LABEL_13;
    default:
      if (a1 == 16)
      {
        CFDictionaryRef v2 = (id *)MEMORY[0x1E4F17B08];
        goto LABEL_13;
      }
      if (a1 == 32)
      {
        CFDictionaryRef v2 = (id *)MEMORY[0x1E4F17B00];
LABEL_13:
        id v5 = *v2;
        goto LABEL_14;
      }
LABEL_6:
      SecPolicyRef v3 = DALoggingwithCategory();
      os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 4);
      if (os_log_type_enabled(v3, v4))
      {
        int v7 = 136315394;
        uint64_t v8 = "NSString *acDataclassForDADataclass(DASingleDataclass)";
        __int16 v9 = 2048;
        uint64_t v10 = a1;
        _os_log_impl(&dword_1C86FF000, v3, v4, "%s unhandled dataclass %lx", (uint8_t *)&v7, 0x16u);
      }

      id v5 = 0;
LABEL_14:
      return v5;
  }
}

uint64_t daDataclassForACDataclass(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:*MEMORY[0x1E4F17A90]])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4F17A80]])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4F17B08]])
  {
    uint64_t v2 = 16;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4F17B00]])
  {
    uint64_t v2 = 32;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4F17AD8]])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4F17A98]])
  {
    uint64_t v2 = 8;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id acDataclassesForDADataclasses(char a1)
{
  uint64_t v2 = objc_opt_new();
  SecPolicyRef v3 = v2;
  if ((a1 & 2) != 0)
  {
    [v2 addObject:*MEMORY[0x1E4F17A90]];
    if ((a1 & 4) == 0)
    {
LABEL_3:
      if ((a1 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((a1 & 4) == 0)
  {
    goto LABEL_3;
  }
  [v3 addObject:*MEMORY[0x1E4F17A80]];
  if ((a1 & 0x10) == 0)
  {
LABEL_4:
    if ((a1 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  [v3 addObject:*MEMORY[0x1E4F17B08]];
  if ((a1 & 0x20) == 0)
  {
LABEL_5:
    if ((a1 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  [v3 addObject:*MEMORY[0x1E4F17B00]];
  if ((a1 & 1) == 0)
  {
LABEL_6:
    if ((a1 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  [v3 addObject:*MEMORY[0x1E4F17AD8]];
  if ((a1 & 8) != 0) {
LABEL_7:
  }
    [v3 addObject:*MEMORY[0x1E4F17A98]];
LABEL_8:
  return v3;
}

uint64_t daDataclassesForACDataclasses(void *a1)
{
  uint64_t v1 = *MEMORY[0x1E4F17A90];
  id v2 = a1;
  if ([v2 containsObject:v1]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 0;
  }
  if ([v2 containsObject:*MEMORY[0x1E4F17A80]]) {
    v3 |= 4uLL;
  }
  if ([v2 containsObject:*MEMORY[0x1E4F17B08]]) {
    v3 |= 0x10uLL;
  }
  if ([v2 containsObject:*MEMORY[0x1E4F17B00]]) {
    v3 |= 0x20uLL;
  }
  uint64_t v4 = v3 | [v2 containsObject:*MEMORY[0x1E4F17AD8]];
  int v5 = [v2 containsObject:*MEMORY[0x1E4F17A98]];

  if (v5) {
    return v4 | 8;
  }
  else {
    return v4;
  }
}

uint64_t sharedDAAccountStore()
{
  return [MEMORY[0x1E4F179C8] defaultStore];
}

void sub_1C87130D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
}

void sub_1C8713638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
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

void sub_1C8713744(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C8713A20(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C8713CD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C8713E74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C8714020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C8714404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t flockWithProcessAssertion(int a1, int a2, void *a3)
{
  id v5 = a3;
  if (flockWithProcessAssertion_pred == -1)
  {
    if (a2)
    {
LABEL_3:
      if (CFDictionaryGetValue((CFDictionaryRef)flockWithProcessAssertion_fdToProcessAssertions, (const void *)a1))
      {
        uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v11 = objc_msgSend(NSString, "stringWithUTF8String:", "int flockWithProcessAssertion(int, BOOL, NSString *__strong)");
        [v10 handleFailureInFunction:v11 file:@"DAUtils.m" lineNumber:378 description:@"You can't flock a flocked file.  No ref counting for you"];
      }
      if ((_sDAIsRunningInDataAccessD & 1) == 0)
      {
        getpid();
        v6 = (const void *)SBSProcessAssertionCreateForPID();
        if (v6)
        {
          int v7 = v6;
          CFDictionarySetValue((CFMutableDictionaryRef)flockWithProcessAssertion_fdToProcessAssertions, (const void *)a1, v6);
          CFRelease(v7);
        }
      }
      uint64_t v8 = flock(a1, 2);
      goto LABEL_12;
    }
  }
  else
  {
    dispatch_once(&flockWithProcessAssertion_pred, &__block_literal_global_61);
    if (a2) {
      goto LABEL_3;
    }
  }
  uint64_t v8 = flock(a1, 8);
  if ((_sDAIsRunningInDataAccessD & 1) == 0)
  {
    CFDictionaryGetValue((CFDictionaryRef)flockWithProcessAssertion_fdToProcessAssertions, (const void *)a1);
    CFDictionaryRemoveValue((CFMutableDictionaryRef)flockWithProcessAssertion_fdToProcessAssertions, (const void *)a1);
  }
LABEL_12:

  return v8;
}

CFMutableDictionaryRef __flockWithProcessAssertion_block_invoke()
{
  CFMutableDictionaryRef result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, MEMORY[0x1E4F1D540]);
  flockWithProcessAssertion_fdToProcessAssertions = (uint64_t)result;
  return result;
}

void addNullRunLoopSourceForRunLoopAndModes(__CFRunLoop *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = malloc_type_malloc(0x10uLL, 0x1020040D5A9D86FuLL);
  context.version = 0;
  context.info = v4;
  memset(&context.retain, 0, 40);
  context.schedule = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))_nullSourceSchedule;
  context.cancel = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))_nullSourceCancel;
  context.perform = (void (__cdecl *)(void *))_nullSourcePerform;
  id v5 = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &context);
  *(_DWORD *)uint64_t v4 = 0;
  v4[1] = v5;
  if (v5)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          CFRunLoopAddSource(a1, v5, *(CFRunLoopMode *)(*((void *)&v11 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v8);
    }

    if (*(_DWORD *)v4)
    {
      CFRunLoopSourceSignal(v5);
      if (!v5) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  free(v4);
  if (v5) {
LABEL_13:
  }
    CFRelease(v5);
LABEL_14:
}

_DWORD *_nullSourceSchedule(_DWORD *result)
{
  return result;
}

void _nullSourceCancel(void *a1)
{
  if ((*(_DWORD *)a1)-- == 1) {
    free(a1);
  }
}

void _nullSourcePerform(uint64_t a1)
{
}

uint64_t walkUpDAErrorChain(id *a1, void *a2)
{
  if (a1 && a2)
  {
    uint64_t v4 = *MEMORY[0x1E4F28A50];
    uint64_t v5 = *MEMORY[0x1E4F50E28];
    while (1)
    {
      id v6 = [*a1 userInfo];
      uint64_t v7 = [v6 objectForKeyedSubscript:v4];
      uint64_t v8 = [v6 objectForKeyedSubscript:v5];
      uint64_t v9 = v8;
      if (!v7 || v8 == 0) {
        break;
      }
      id v11 = v7;
      *a1 = v11;
      *a2 = [v9 integerValue];
    }
  }
  return 1;
}

BOOL statusAndErrorIndicateWeShouldTurnOnReachability(uint64_t a1, void *a2)
{
  id v12 = a2;
  uint64_t v13 = a1;
  id v2 = a2;
  walkUpDAErrorChain(&v12, &v13);
  id v3 = v12;

  if (!v13)
  {
    id v6 = [v3 domain];
    int v7 = [v6 isEqualToString:*MEMORY[0x1E4F289A0]];

    if (v7)
    {
      uint64_t v8 = [v3 code];
      BOOL v10 = (unint64_t)(v8 + 1020) <= 0x11 && ((1 << (v8 - 4)) & 0x3C805) != 0 || v8 == -1;
      if (v10 || v8 == -2000)
      {
        BOOL v4 = 1;
        goto LABEL_3;
      }
    }
    else
    {
      id v11 = [v3 domain];
      if ([v11 isEqualToString:@"DAAccountValidationDomain"])
      {
        BOOL v4 = [v3 code] == 101;

        goto LABEL_3;
      }
    }
  }
  BOOL v4 = 0;
LABEL_3:

  return v4;
}

uint64_t statusAndErrorIndicatePersistentFolderSyncFailure(unint64_t a1, void *a2)
{
  id v6 = a2;
  unint64_t v7 = a1;
  id v2 = a2;
  walkUpDAErrorChain(&v6, &v7);
  id v3 = v6;

  uint64_t v4 = 0;
  if (v7 <= 0x22)
  {
    if (((1 << v7) & 0x6C0200620) != 0)
    {
      uint64_t v4 = 1;
    }
    else if (v7 == 1)
    {
      uint64_t v4 = [MEMORY[0x1E4F50E38] isAppleInternalInstall] ^ 1;
    }
  }

  return v4;
}

id runLoopModesToPerformDelayedSelectorsIn()
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  uint64_t v1 = [v0 currentMode];

  uint64_t v2 = *MEMORY[0x1E4F1C3A0];
  if (v1 && ![v1 isEqualToString:*MEMORY[0x1E4F1C3A0]])
  {
    uint64_t v8 = v2;
    uint64_t v9 = v1;
    id v3 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v4 = &v8;
    uint64_t v5 = 2;
  }
  else
  {
    v10[0] = v2;
    id v3 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v4 = v10;
    uint64_t v5 = 1;
  }
  id v6 = objc_msgSend(v3, "arrayWithObjects:count:", v4, v5, v8, v9, v10[0]);

  return v6;
}

id DAUserAgent()
{
  v0 = (void *)DAUserAgent__sUserAgentString;
  if (!DAUserAgent__sUserAgentString)
  {
    uint64_t v1 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v2 = [v1 infoDictionary];
    uint64_t v3 = [v2 objectForKeyedSubscript:@"CFBundleVersion"];

    if (v3) {
      uint64_t v4 = (__CFString *)v3;
    }
    else {
      uint64_t v4 = @"1.0";
    }
    uint64_t v5 = (void *)_CFCopyServerVersionDictionary();
    if (!v5) {
      uint64_t v5 = (void *)_CFCopySystemVersionDictionary();
    }
    id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F1CD30]];
    unint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F1CD10]];
    id v8 = [NSString alloc];
    uint64_t v9 = [MEMORY[0x1E4F28F80] processInfo];
    BOOL v10 = [v9 processName];
    uint64_t v11 = [v8 initWithFormat:@"iOS/%@ (%@) %@/%@", v6, v7, v10, v4];
    id v12 = (void *)DAUserAgent__sUserAgentString;
    DAUserAgent__sUserAgentString = v11;

    v0 = (void *)DAUserAgent__sUserAgentString;
  }
  return v0;
}

id DAProductString()
{
  if (DAProductString_onceToken != -1) {
    dispatch_once(&DAProductString_onceToken, &__block_literal_global_112);
  }
  v0 = (void *)DAProductString_sProduct;
  return v0;
}

uint64_t __DAProductString_block_invoke()
{
  DAProductString_sProduct = _MGStringForKey();
  return MEMORY[0x1F41817F8]();
}

id _MGStringForKey()
{
  v0 = (__CFString *)MGCopyAnswer();
  if (v0) {
    uint64_t v1 = v0;
  }
  else {
    uint64_t v1 = @"iPhone";
  }
  uint64_t v2 = [MEMORY[0x1E4F28E78] stringWithString:v1];
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @" ", &stru_1F231BAB0, 0, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"-", &stru_1F231BAB0, 0, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @".", &stru_1F231BAB0, 0, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @",", @"C", 0, 0, objc_msgSend(v2, "length"));

  return v2;
}

id DAModelString()
{
  if (DAModelString_onceToken != -1) {
    dispatch_once(&DAModelString_onceToken, &__block_literal_global_117);
  }
  v0 = (void *)DAModelString_sModel;
  return v0;
}

uint64_t __DAModelString_block_invoke()
{
  DAModelString_sModel = _MGStringForKey();
  return MEMORY[0x1F41817F8]();
}

id appBundleIDsForDADataclasses(char a1)
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = v2;
  if ((a1 & 0xA) != 0)
  {
    [v2 addObject:@"com.apple.MobileAddressBook"];
    [v3 addObject:@"com.apple.mobilephone"];
  }
  if ((a1 & 4) != 0)
  {
    [v3 addObject:@"com.apple.mobilecal"];
    if ((a1 & 0x10) == 0)
    {
LABEL_5:
      if ((a1 & 0x20) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((a1 & 0x10) == 0)
  {
    goto LABEL_5;
  }
  [v3 addObject:@"com.apple.reminders"];
  if ((a1 & 0x20) == 0)
  {
LABEL_6:
    if ((a1 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  [v3 addObject:@"com.apple.mobilenotes"];
  if (a1) {
LABEL_7:
  }
    [v3 addObject:@"com.apple.mobilemail"];
LABEL_8:
  return v3;
}

uint64_t areDADiagnosticsEnabled()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v1 = [v0 BOOLForKey:@"DADiagnosticsEnabled"];

  return v1;
}

id daDeviceID()
{
  if (daDeviceID_onceToken != -1) {
    dispatch_once(&daDeviceID_onceToken, &__block_literal_global_258);
  }
  v0 = (void *)daDeviceID___daDeviceID;
  return v0;
}

void __daDeviceID_block_invoke()
{
  id v0 = [(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"Library/Reminders/DataAccess/DeviceSpecificInfo.plist"];
  int v1 = open((const char *)[v0 fileSystemRepresentation], 514, 384);
  int v2 = v1;
  if (v1 < 0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    flockWithProcessAssertion(v1, 1, @"com.apple.dataaccess.deviceid");
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v0];
    uint64_t v4 = v3;
    if (v3)
    {
      uint64_t v5 = [v3 objectForKeyedSubscript:@"DAGlobalDeviceSpecificIdentifier"];
      if (v5)
      {
LABEL_9:
        flockWithProcessAssertion(v2, 0, @"com.apple.dataaccess.deviceid");
        close(v2);
        goto LABEL_10;
      }
    }
  }
  uint64_t v5 = objc_msgSend(NSString, "da_newGUID");
  id v6 = (void *)[v4 mutableCopy];
  if (!v6) {
    id v6 = objc_opt_new();
  }
  [v6 setObject:v5 forKeyedSubscript:@"DAGlobalDeviceSpecificIdentifier"];
  [v6 writeToFile:v0 atomically:1];

  if (v2 >= 0) {
    goto LABEL_9;
  }
LABEL_10:
  unint64_t v7 = (void *)daDeviceID___daDeviceID;
  daDeviceID___daDeviceID = v5;
}

void sub_1C8717A1C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int buf, long long a12)
{
  if (a2 == 1)
  {
    id v12 = objc_begin_catch(a1);
    uint64_t v13 = DALoggingwithCategory();
    os_log_type_t v14 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 6);
    if (os_log_type_enabled(v13, v14))
    {
      buf = 138412546;
      WORD2(a12) = 2112;
      *(void *)((char *)&a12 + 6) = v12;
      _os_log_impl(&dword_1C86FF000, v13, v14, "Exception when reading dictionary from %@: %@", (uint8_t *)&buf, 0x16u);
    }

    objc_end_catch();
    JUMPOUT(0x1C871794CLL);
  }
  _Unwind_Resume(a1);
}

uint64_t dataaccess_get_global_queue()
{
  uint64_t v0 = MEMORY[0x1E4F14428];
  id v1 = MEMORY[0x1E4F14428];
  return v0;
}

void sub_1C8717E78(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C8717F4C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C8718324(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C8718D5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C8719168(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C8719598(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C8719B14(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C8719CE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *getStateName(unsigned int a1)
{
  if (a1 > 5)
  {
    int v2 = @"Out of bounds";
  }
  else
  {
    int v2 = getStateName_stateNames[a1];
  }
  return v2;
}

void sub_1C871B7D4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C871BCF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C871BF44(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C871C01C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C871E0E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C871E1E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C871E558(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C871E8A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C871E990(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C871EC98(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C871EFC8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C8722364(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,os_activity_scope_state_s state)
{
  objc_sync_exit(v21);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1C872265C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C8722A40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1C8722C98(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C8722E38(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _InfoForNotification(uint64_t a1)
{
  int v2 = _NotificationHandlerMap();
  uint64_t v3 = [v2 objectForKey:a1];

  return v3;
}

void _ReceiveNotificationResponseCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _InfoForNotification(a1);
  uint64_t v5 = [v4 groupIdentifier];
  if (v5)
  {
    id v6 = +[DAPowerAssertionManager sharedPowerAssertionManager];
    [v6 reattainPowerAssertionsForGroupIdentifier:v5];
  }
  unint64_t v7 = [v4 handler];
  if (v7)
  {
    id v8 = [v4 callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___ReceiveNotificationResponseCallback_block_invoke;
    block[3] = &unk_1E65713C0;
    uint64_t v13 = v7;
    uint64_t v14 = a1;
    uint64_t v15 = a2;
    dispatch_async(v8, block);

    uint64_t v9 = v13;
  }
  else
  {
    uint64_t v9 = DALoggingwithCategory();
    os_log_type_t v10 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 3);
    if (os_log_type_enabled(v9, v10))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = a1;
      _os_log_impl(&dword_1C86FF000, v9, v10, "No completion block for notification %@", buf, 0xCu);
    }
  }

  uint64_t v11 = _NotificationHandlerMap();
  [v11 removeObjectForKey:a1];
}

id _NotificationHandlerMap()
{
  if (_NotificationHandlerMap_onceToken != -1) {
    dispatch_once(&_NotificationHandlerMap_onceToken, &__block_literal_global_5);
  }
  uint64_t v0 = (void *)_NotificationHandlerMap_sNotificationHandlerMap;
  return v0;
}

void sub_1C8724AB8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void *DAWeakLinkSymbol(const char *a1, const void *a2)
{
  CFMutableDictionaryRef result = (void *)__HandleForSource(a2);
  if (result)
  {
    return dlsym(result, a1);
  }
  return result;
}

const void *__HandleForSource(const void *a1)
{
  _os_nospin_lock_lock();
  CFDictionaryRef Mutable = (const __CFDictionary *)__Handles;
  if (!__Handles)
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
    __Handles = (uint64_t)Mutable;
  }
  Value = CFDictionaryGetValue(Mutable, a1);
  if (!Value)
  {
    if (a1
      || ([&stru_1F231BAB0 stringByAppendingString:@"/AppleInternal/Library/Frameworks/CalendarDiagnostics.framework/CalendarDiagnostics"], (id v6 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      Value = 0;
      id v4 = 0;
    }
    else
    {
      id v4 = v6;
      Value = dlopen((const char *)[v4 UTF8String], 1);
      if (Value) {
        CFDictionarySetValue((CFMutableDictionaryRef)__Handles, 0, Value);
      }
    }
  }
  _os_nospin_lock_unlock();
  return Value;
}

id DAWeakLinkClass(void *a1, const void *a2)
{
  uint64_t v3 = a1;
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

uint64_t _reloadBabysitterProperties(uint64_t a1, void *a2)
{
  return [a2 _reloadBabysitterProperties];
}

uint64_t ABAccountCopyIdentifier()
{
  return MEMORY[0x1F4106A78]();
}

uint64_t ABAccountCopyInternalUUID()
{
  return MEMORY[0x1F4106A80]();
}

uint64_t ABAccountCreate()
{
  return MEMORY[0x1F4106A88]();
}

uint64_t ABAccountSetIdentifier()
{
  return MEMORY[0x1F4106A90]();
}

BOOL ABAddressBookAddRecord(ABAddressBookRef addressBook, ABRecordRef record, CFErrorRef *error)
{
  return MEMORY[0x1F4106AB8](addressBook, record, error);
}

uint64_t ABAddressBookCopyAccountWithIdentifier()
{
  return MEMORY[0x1F4106AD8]();
}

uint64_t ABAddressBookCopyArrayOfAllAccounts()
{
  return MEMORY[0x1F4106B00]();
}

uint64_t ABAddressBookCopySourcesWithUUIDs()
{
  return MEMORY[0x1F4106BD0]();
}

uint64_t ABAddressBookGetAccountForSource()
{
  return MEMORY[0x1F4106C28]();
}

ABRecordRef ABAddressBookGetPersonWithRecordID(ABAddressBookRef addressBook, ABRecordID recordID)
{
  return (ABRecordRef)MEMORY[0x1F4106C60](addressBook, *(void *)&recordID);
}

uint64_t ABAddressBookProcessAddedRecords()
{
  return MEMORY[0x1F4106CC0]();
}

BOOL ABAddressBookRemoveRecord(ABAddressBookRef addressBook, ABRecordRef record, CFErrorRef *error)
{
  return MEMORY[0x1F4106CE0](addressBook, record, error);
}

uint64_t ABDatabaseIntegrityCheckWithAddressBook()
{
  return MEMORY[0x1F4106E00]();
}

CFTypeRef ABRecordCopyValue(ABRecordRef record, ABPropertyID property)
{
  return (CFTypeRef)MEMORY[0x1F4107110](record, *(void *)&property);
}

uint64_t ABRecordGetAddressBook()
{
  return MEMORY[0x1F4107118]();
}

uint64_t ABRecordGetIntValue()
{
  return MEMORY[0x1F4107120]();
}

ABRecordID ABRecordGetRecordID(ABRecordRef record)
{
  return MEMORY[0x1F4107128](record);
}

BOOL ABRecordSetValue(ABRecordRef record, ABPropertyID property, CFTypeRef value, CFErrorRef *error)
{
  return MEMORY[0x1F4107138](record, *(void *)&property, value, error);
}

uint64_t ABSourceSetShouldIgnoreCapabilitiesRestrictions()
{
  return MEMORY[0x1F41071B0]();
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x1F41071E0]();
}

uint64_t CDVExtractValuesFromRedirectString()
{
  return MEMORY[0x1F4113B00]();
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
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

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

uint64_t CFHTTPCookieStorageDeleteAllCookies()
{
  return MEMORY[0x1F40D5248]();
}

uint64_t CFHTTPCookieStorageSetCookieAcceptPolicy()
{
  return MEMORY[0x1F40D5270]();
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

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
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

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopMode CFRunLoopCopyCurrentMode(CFRunLoopRef rl)
{
  return (CFRunLoopMode)MEMORY[0x1F40D80A0](rl);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8140](allocator, order, context);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1F40D83F0](alloc, theString);
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
}

uint64_t CFURLCacheCopySharedURLCache()
{
  return MEMORY[0x1F40D53A0]();
}

uint64_t CFURLCacheRemoveAllCachedResponses()
{
  return MEMORY[0x1F40D53B0]();
}

uint64_t CFURLCacheSetDiskCapacity()
{
  return MEMORY[0x1F40D53B8]();
}

uint64_t CFURLCacheSetMemoryCapacity()
{
  return MEMORY[0x1F40D53C0]();
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1F40D8790](anURL);
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8870](allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, *(void *)&encoding);
}

CFStringRef CFURLCreateStringByReplacingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x1F40D8878](allocator, originalString, charactersToLeaveEscaped);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1F40D88C0](allocator, URLString, baseURL);
}

uint64_t CFURLRequestCreateMutableCopy()
{
  return MEMORY[0x1F40D5460]();
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1F40D8988](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1F40D89B0](alloc, uuid);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x1F40D8A20](userNotification);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8A40](allocator, userNotification, callout, order);
}

uint64_t CPPowerAssertionCreate()
{
  return MEMORY[0x1F41093B8]();
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1F41096C8]();
}

uint64_t DACPLoggingAddCustomLogFile()
{
  return MEMORY[0x1F410D240]();
}

uint64_t DACPLoggingAppendDataToLogFile()
{
  return MEMORY[0x1F410D248]();
}

uint64_t DACPLoggingSlurpFileIntoLogFile()
{
  return MEMORY[0x1F410D250]();
}

uint64_t DACustomLogDirectory()
{
  return MEMORY[0x1F410D258]();
}

uint64_t DALoggingwithCategory()
{
  return MEMORY[0x1F410D260]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1F412F958]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1F412F980]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x1F4145D90]();
}

uint64_t PLShouldLogRegisteredEvent()
{
  return MEMORY[0x1F4145DA8]();
}

uint64_t SBSProcessAssertionCreateForPID()
{
  return MEMORY[0x1F415C3B8]();
}

uint64_t SecCertificateGetSHA1Digest()
{
  return MEMORY[0x1F40F6BA8]();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x1F40F6DB8](identityRef, certificateRef);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DD8](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DE0](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1F40F6DE8](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x1F40F6E20](query, attributesToUpdate);
}

SecPolicyRef SecPolicyCreateSSL(Boolean server, CFStringRef hostname)
{
  return (SecPolicyRef)MEMORY[0x1F40F7088](server, hostname);
}

CFDataRef SecTrustCopyExceptions(SecTrustRef trust)
{
  return (CFDataRef)MEMORY[0x1F40F71A0](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x1F40F71E0](certificates, policies, trust);
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x1F40F71F0](trust, result);
}

SecCertificateRef SecTrustGetCertificateAtIndex(SecTrustRef trust, CFIndex ix)
{
  return (SecCertificateRef)MEMORY[0x1F40F7220](trust, ix);
}

CFIndex SecTrustGetCertificateCount(SecTrustRef trust)
{
  return MEMORY[0x1F40F7228](trust);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopyServerVersionDictionary()
{
  return MEMORY[0x1F40D8D00]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1F40D8D10]();
}

uint64_t _CFURLRequestSetStorageSession()
{
  return MEMORY[0x1F40D5768]();
}

uint64_t _CFURLStorageSessionCopyCache()
{
  return MEMORY[0x1F40D5780]();
}

uint64_t _CFURLStorageSessionCopyCookieStorage()
{
  return MEMORY[0x1F40D5788]();
}

uint64_t _CFURLStorageSessionCreate()
{
  return MEMORY[0x1F40D5790]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_nospin_lock_lock()
{
  return MEMORY[0x1F40CA010]();
}

uint64_t _os_nospin_lock_unlock()
{
  return MEMORY[0x1F40CA020]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

int flock(int a1, int a2)
{
  return MEMORY[0x1F40CC160](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
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

void objc_exception_throw(id exception)
{
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1F4181B28](sel);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1F40CE9D0](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE9E8](activity);
}

void xpc_transaction_begin(void)
{
}

void xpc_transaction_end(void)
{
}