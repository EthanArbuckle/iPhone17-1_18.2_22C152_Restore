void sub_1BA386E98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getESAccountClass()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getESAccountClass_softClass;
  uint64_t v7 = getESAccountClass_softClass;
  if (!getESAccountClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getESAccountClass_block_invoke;
    v3[3] = &unk_1E6211758;
    v3[4] = &v4;
    __getESAccountClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BA3875D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA38920C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA38B748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va1, 8);
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

void sub_1BA38C9F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ExchangeSyncLibraryCore()
{
  if (!ExchangeSyncLibraryCore_frameworkLibrary) {
    ExchangeSyncLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return ExchangeSyncLibraryCore_frameworkLibrary;
}

uint64_t __ExchangeSyncLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ExchangeSyncLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getESAccountClass_block_invoke(uint64_t a1)
{
  v3 = 0;
  if (!ExchangeSyncLibraryCore()) {
    __getESAccountClass_block_invoke_cold_1(&v3);
  }
  Class result = objc_getClass("ESAccount");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getESAccountClass_block_invoke_cold_2();
  }
  getESAccountClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

__CFString *DAStringFromCalEntityType(int a1)
{
  if (a1 > 99)
  {
    switch(a1)
    {
      case 'd':
        return @"Participant";
      case 'e':
        return @"CalendarItem";
      case 'f':
        return @"Notification";
      default:
        return @"Unknown";
    }
  }
  else
  {
    int v1 = a1 + 1;
    Class result = @"Calendar";
    switch(v1)
    {
      case 0:
        Class result = @"Undefined";
        break;
      case 2:
        return result;
      case 3:
        Class result = @"Event";
        break;
      case 4:
        Class result = @"Reminder";
        break;
      case 5:
        Class result = @"Alarm";
        break;
      case 6:
        Class result = @"Recurrence";
        break;
      case 7:
        Class result = @"Store";
        break;
      case 8:
        Class result = @"Attendee";
        break;
      case 9:
        Class result = @"Organizer";
        break;
      case 10:
        Class result = @"EventAction";
        break;
      case 11:
        Class result = @"ExceptionDate";
        break;
      case 12:
        Class result = @"Attachment";
        break;
      case 13:
        Class result = @"Category";
        break;
      case 14:
        Class result = @"CategoryLink";
        break;
      case 15:
        Class result = @"Location";
        break;
      case 16:
        Class result = @"Sharee";
        break;
      case 17:
        Class result = @"InviteReply";
        break;
      case 18:
        Class result = @"ResourceChangeNotification";
        break;
      case 19:
        Class result = @"ResourceChange";
        break;
      case 20:
        Class result = @"SuggestionNotification";
        break;
      case 21:
        Class result = @"SuggestedEventInfo";
        break;
      case 22:
        Class result = @"Contact";
        break;
      case 24:
        Class result = @"Conference";
        break;
      case 25:
        Class result = @"Error";
        break;
      case 26:
        Class result = @"AttachmentFile";
        break;
      case 27:
        Class result = @"AuxDatabase";
        break;
      case 28:
        Class result = @"AuxDatabaseAccount";
        break;
      case 29:
        Class result = @"Image";
        break;
      case 30:
        Class result = @"Color";
        break;
      default:
        return @"Unknown";
    }
  }
  return result;
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

void sub_1BA393084(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA396974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

void sub_1BA397C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA3A0C30(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA3A0DBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA3A111C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA3A12E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA3A15D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
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

void sub_1BA3A1784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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
    int v1 = (void *)*MEMORY[0x1E4F3BD40];
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
      uint64_t v4 = DALoggingwithCategory();
      os_log_type_t v5 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
      if (os_log_type_enabled(v4, v5))
      {
        *(_DWORD *)buf = 67109120;
        OSStatus v8 = v3;
        _os_log_impl(&dword_1BA384000, v4, v5, "Could not find identity for persistent ref. %d", buf, 8u);
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
    int v1 = (void *)*MEMORY[0x1E4F3BD40];
    values = result;
    keys[0] = v1;
    CFDictionaryRef v2 = CFDictionaryCreate(0, (const void **)keys, (const void **)&values, 1, 0, 0);
    OSStatus v3 = SecItemDelete(v2);
    if (v2) {
      CFRelease(v2);
    }
    if (v3)
    {
      uint64_t v4 = DALoggingwithCategory();
      os_log_type_t v5 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
      if (os_log_type_enabled(v4, v5))
      {
        v6[0] = 67109120;
        v6[1] = v3;
        _os_log_impl(&dword_1BA384000, v4, v5, "Could not delete identity by persistent ref. %d", (uint8_t *)v6, 8u);
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
    uint64_t v4 = 0;
    if (!SecIdentityCopyCertificate(a1, &certificateRef))
    {
      os_log_type_t v5 = [MEMORY[0x1E4F1CA48] arrayWithObject:certificateRef];
      CFRelease(certificateRef);
      SecTrustRef trust = 0;
      uint64_t v4 = 0;
      if (!SecTrustCreateWithCertificates(v5, v3, &trust))
      {
        int v11 = 0;
        if (MEMORY[0x1BA9E9FD0](trust, &v11))
        {
          uint64_t v4 = 0;
        }
        else
        {
          CFIndex CertificateCount = SecTrustGetCertificateCount(trust);
          uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:CertificateCount];
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
    uint64_t v4 = 0;
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
      os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 4);
      if (os_log_type_enabled(v3, v4))
      {
        int v7 = 136315394;
        uint64_t v8 = "NSString *acDataclassForDADataclass(DASingleDataclass)";
        __int16 v9 = 2048;
        uint64_t v10 = a1;
        _os_log_impl(&dword_1BA384000, v3, v4, "%s unhandled dataclass %lx", (uint8_t *)&v7, 0x16u);
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

id sharedDAAccountStore()
{
  if (sharedDAAccountStore_onceToken != -1) {
    dispatch_once(&sharedDAAccountStore_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)sharedDAAccountStore_store;
  return v0;
}

uint64_t __sharedDAAccountStore_block_invoke()
{
  sharedDAAccountStore_store = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

void sub_1BA3A2814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
}

void sub_1BA3A2D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
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

void sub_1BA3A2E5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA3A3138(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA3A3354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA3A3500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA3A3980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_1BA3A3ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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
        [v10 handleFailureInFunction:v11 file:@"DAUtils.m" lineNumber:382 description:@"You can't flock a flocked file.  No ref counting for you"];
      }
      if ((_sDAIsRunningInDataAccessD & 1) == 0)
      {
        getpid();
        uint64_t v6 = (const void *)SBSProcessAssertionCreateForPID();
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
    dispatch_once(&flockWithProcessAssertion_pred, &__block_literal_global_67);
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
    uint64_t v5 = *MEMORY[0x1E4F5E928];
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
      uint64_t v4 = [MEMORY[0x1E4F5E940] isAppleInternalInstall] ^ 1;
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
    uint64_t v11 = [v8 initWithFormat:@"%@/%@ (%@) %@/%@", @"iOS", v6, v7, v10, v4];
    id v12 = (void *)DAUserAgent__sUserAgentString;
    DAUserAgent__sUserAgentString = v11;

    v0 = (void *)DAUserAgent__sUserAgentString;
  }
  return v0;
}

id DAProductString()
{
  if (DAProductString_onceToken != -1) {
    dispatch_once(&DAProductString_onceToken, &__block_literal_global_117);
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
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @" ", &stru_1F13DB4B0, 0, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"-", &stru_1F13DB4B0, 0, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @".", &stru_1F13DB4B0, 0, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @",", @"C", 0, 0, objc_msgSend(v2, "length"));

  return v2;
}

id DAModelString()
{
  if (DAModelString_onceToken != -1) {
    dispatch_once(&DAModelString_onceToken, &__block_literal_global_122);
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
    [v3 addObject:*MEMORY[0x1E4F57868]];
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

id DAGetSyncImageForPerson(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v4 = (void *)ABImageUtilsCopySyncImageForPerson();
  *a3 = 0;
  return v4;
}

id daDeviceID()
{
  if (daDeviceID_onceToken != -1) {
    dispatch_once(&daDeviceID_onceToken, &__block_literal_global_245);
  }
  v0 = (void *)daDeviceID___daDeviceID;
  return v0;
}

void __daDeviceID_block_invoke()
{
  id v0 = [(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"Library/DataAccess/DeviceSpecificInfo.plist"];
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

void sub_1BA3A6964(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int buf, long long a12)
{
  if (a2 == 1)
  {
    id v12 = objc_begin_catch(a1);
    uint64_t v13 = DALoggingwithCategory();
    os_log_type_t v14 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
    if (os_log_type_enabled(v13, v14))
    {
      buf = 138412546;
      WORD2(a12) = 2112;
      *(void *)((char *)&a12 + 6) = v12;
      _os_log_impl(&dword_1BA384000, v13, v14, "Exception when reading dictionary from %@: %@", (uint8_t *)&buf, 0x16u);
    }

    objc_end_catch();
    JUMPOUT(0x1BA3A6894);
  }
  _Unwind_Resume(a1);
}

uint64_t dataaccess_get_global_queue()
{
  uint64_t v0 = MEMORY[0x1E4F14428];
  id v1 = MEMORY[0x1E4F14428];
  return v0;
}

uint64_t ExchangeSyncLibraryCore_0()
{
  if (!ExchangeSyncLibraryCore_frameworkLibrary_0) {
    ExchangeSyncLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  return ExchangeSyncLibraryCore_frameworkLibrary_0;
}

uint64_t __ExchangeSyncLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  ExchangeSyncLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getESAccountClass_block_invoke_0(uint64_t a1)
{
  uint64_t v3 = 0;
  if (!ExchangeSyncLibraryCore_0()) {
    __getESAccountClass_block_invoke_cold_1_0(&v3);
  }
  Class result = objc_getClass("ESAccount");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getESAccountClass_block_invoke_cold_2_0();
  }
  getESAccountClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1BA3A6F98(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA3A7074(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA3A74A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA3A7ED8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA3A835C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA3A878C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA3A8D58(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA3A8F34(_Unwind_Exception *a1)
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

void sub_1BA3AAB00(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA3AB02C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA3AB280(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA3AB358(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1BA3AF79C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA3AF89C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA3AFC14(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA3AFF60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA3B004C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA3B0354(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA3B0684(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t ExchangeSyncLibraryCore_1()
{
  if (!ExchangeSyncLibraryCore_frameworkLibrary_1) {
    ExchangeSyncLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  return ExchangeSyncLibraryCore_frameworkLibrary_1;
}

uint64_t __ExchangeSyncLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  ExchangeSyncLibraryCore_frameworkLibrary_1 = result;
  return result;
}

Class __getESAccountActorClass_block_invoke(uint64_t a1)
{
  uint64_t v3 = 0;
  if (!ExchangeSyncLibraryCore_1()) {
    __getESAccountActorClass_block_invoke_cold_1(&v3);
  }
  Class result = objc_getClass("ESAccountActor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getESAccountActorClass_block_invoke_cold_2();
  }
  getESAccountActorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1BA3B3F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
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

void sub_1BA3B7AA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_1BA3B7FF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA3B8130(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA3B857C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA3B8B14(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA3B8BAC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA3BA170(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA3BA500(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA3BABCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1BA3BAFB4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA3BB208(_Unwind_Exception *a1)
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

void _ReceiveNotificationResponseCallback(const void *a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _InfoForNotification((uint64_t)a1);
  uint64_t v5 = [v4 groupIdentifier];
  if (v5)
  {
    id v6 = +[DAPowerAssertionManager sharedPowerAssertionManager];
    [v6 reattainPowerAssertionsForGroupIdentifier:v5];
  }
  unint64_t v7 = [v4 handler];
  if (v7)
  {
    CFRetain(a1);
    id v8 = [v4 callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___ReceiveNotificationResponseCallback_block_invoke;
    block[3] = &unk_1E6211DB0;
    uint64_t v13 = v7;
    os_log_type_t v14 = a1;
    uint64_t v15 = a2;
    dispatch_async(v8, block);

    uint64_t v9 = v13;
  }
  else
  {
    uint64_t v9 = DALoggingwithCategory();
    os_log_type_t v10 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
    if (os_log_type_enabled(v9, v10))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = a1;
      _os_log_impl(&dword_1BA384000, v9, v10, "No completion block for notification %@", buf, 0xCu);
    }
  }

  uint64_t v11 = _NotificationHandlerMap();
  [v11 removeObjectForKey:a1];
}

id _NotificationHandlerMap()
{
  if (_NotificationHandlerMap_onceToken != -1) {
    dispatch_once(&_NotificationHandlerMap_onceToken, &__block_literal_global_10);
  }
  uint64_t v0 = (void *)_NotificationHandlerMap_sNotificationHandlerMap;
  return v0;
}

uint64_t DAMigrationIsNeeded()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  CFPreferencesAppSynchronize(@"com.apple.dataaccess.dataaccessd");
  uint64_t v0 = (void *)CFPreferencesCopyAppValue(@"kDAMigrationBuildVersionKey", @"com.apple.dataaccess.dataaccessd");
  uint64_t v1 = (void *)MGCopyAnswer();
  int v2 = DALoggingwithCategory();
  os_log_type_t v3 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 5);
  if (os_log_type_enabled(v2, v3))
  {
    int v6 = 138412546;
    unint64_t v7 = v0;
    __int16 v8 = 2112;
    uint64_t v9 = v1;
    _os_log_impl(&dword_1BA384000, v2, v3, "DAMigrationIsNeeded : DataAccess Migrator Comparing Version %@ With %@", (uint8_t *)&v6, 0x16u);
  }

  int v4 = [v0 isEqualToString:v1];
  return v4 ^ 1u;
}

void DAUpdateMigrationVersion()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MGCopyAnswer();
  CFPreferencesSetAppValue(@"kDAMigrationBuildVersionKey", v0, @"com.apple.dataaccess.dataaccessd");
  CFPreferencesAppSynchronize(@"com.apple.dataaccess.dataaccessd");
  uint64_t v1 = DALoggingwithCategory();
  os_log_type_t v2 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 5);
  if (os_log_type_enabled(v1, v2))
  {
    int v3 = 138412290;
    int v4 = v0;
    _os_log_impl(&dword_1BA384000, v1, v2, "DAUpdateMigrationVersion : DataAccess Migrator Current Version %@", (uint8_t *)&v3, 0xCu);
  }
}

void sub_1BA3BD204(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1BA3BE6F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA3BEAF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA3BED4C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BA3BF0E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA3BF210(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA3BF5A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA3BF764(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void *DAWeakLinkSymbol(const char *a1, const void *a2)
{
  Class result = (void *)__HandleForSource(a2);
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
      || ([&stru_1F13DB4B0 stringByAppendingString:@"/AppleInternal/Library/Frameworks/CalendarDiagnostics.framework/CalendarDiagnostics"], (int v6 = objc_claimAutoreleasedReturnValue()) == 0))
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
  int v3 = a1;
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

void sub_1BA3C1D14(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __getESAccountClass_block_invoke_cold_1(void *a1)
{
  os_log_type_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *ExchangeSyncLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"DAAccount.m", 61, @"%s", *a1);

  __break(1u);
}

void __getESAccountClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getESAccountClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"DAAccount.m", 62, @"Unable to find class %s", "ESAccount");

  __break(1u);
}

void __getESAccountClass_block_invoke_cold_1_0(void *a1)
{
  os_log_type_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *ExchangeSyncLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"DAUtils.m", 40, @"%s", *a1);

  __break(1u);
}

void __getESAccountClass_block_invoke_cold_2_0()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getESAccountClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"DAUtils.m", 41, @"Unable to find class %s", "ESAccount");

  __break(1u);
}

void __getESAccountActorClass_block_invoke_cold_1(void *a1)
{
  os_log_type_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *ExchangeSyncLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"ASAccountActor.m", 15, @"%s", *a1);

  __break(1u);
}

void __getESAccountActorClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getESAccountActorClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"ASAccountActor.m", 16, @"Unable to find class %s", "ESAccountActor");

  __break(1u);
  ABAccountCopyIdentifier();
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

uint64_t ABAccountStoreGetAccountTypeForSource()
{
  return MEMORY[0x1F4106AA0]();
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

CFArrayRef ABAddressBookCopyArrayOfAllGroupsInSource(ABAddressBookRef addressBook, ABRecordRef source)
{
  return (CFArrayRef)MEMORY[0x1F4106B10](addressBook, source);
}

CFArrayRef ABAddressBookCopyArrayOfAllPeopleInSource(ABAddressBookRef addressBook, ABRecordRef source)
{
  return (CFArrayRef)MEMORY[0x1F4106B18](addressBook, source);
}

uint64_t ABAddressBookCopyArrayOfAllSourcesIncludingDisabledSources()
{
  return MEMORY[0x1F4106B40]();
}

uint64_t ABAddressBookCopyArrayOfAllSourcesWithAccountIdentifier()
{
  return MEMORY[0x1F4106B48]();
}

ABRecordRef ABAddressBookCopyDefaultSource(ABAddressBookRef addressBook)
{
  return (ABRecordRef)MEMORY[0x1F4106B70](addressBook);
}

uint64_t ABAddressBookCopySourceWithAccountAndExternalIdentifiers()
{
  return MEMORY[0x1F4106BC0]();
}

uint64_t ABAddressBookCopySourcesWithUUIDs()
{
  return MEMORY[0x1F4106BD0]();
}

uint64_t ABAddressBookCreateWithDatabaseDirectory()
{
  return MEMORY[0x1F4106BE8]();
}

ABAddressBookRef ABAddressBookCreateWithOptions(CFDictionaryRef options, CFErrorRef *error)
{
  return (ABAddressBookRef)MEMORY[0x1F4106BF0](options, error);
}

uint64_t ABAddressBookDirectoryOnlyKeepFamilyDatabasesWithDSIDs()
{
  return MEMORY[0x1F4106C00]();
}

uint64_t ABAddressBookGetAccountForSource()
{
  return MEMORY[0x1F4106C28]();
}

uint64_t ABAddressBookGetCountOfRecordsOutsideSource()
{
  return MEMORY[0x1F4106C38]();
}

ABRecordRef ABAddressBookGetPersonWithRecordID(ABAddressBookRef addressBook, ABRecordID recordID)
{
  return (ABRecordRef)MEMORY[0x1F4106C60](addressBook, *(void *)&recordID);
}

uint64_t ABAddressBookMoveAllRecordsInSourceToSource()
{
  return MEMORY[0x1F4106CB0]();
}

uint64_t ABAddressBookProcessAddedRecords()
{
  return MEMORY[0x1F4106CC0]();
}

uint64_t ABAddressBookRegisterYieldBlock()
{
  return MEMORY[0x1F4106CD8]();
}

BOOL ABAddressBookRemoveRecord(ABAddressBookRef addressBook, ABRecordRef record, CFErrorRef *error)
{
  return MEMORY[0x1F4106CE0](addressBook, record, error);
}

BOOL ABAddressBookSave(ABAddressBookRef addressBook, CFErrorRef *error)
{
  return MEMORY[0x1F4106CF8](addressBook, error);
}

uint64_t ABAddressBookSetIsBackgroundProcess()
{
  return MEMORY[0x1F4106D30]();
}

uint64_t ABChangeHistoryInsertUpdatesForRecordsFromBlockWithClientIdentifier()
{
  return MEMORY[0x1F4106DD0]();
}

uint64_t ABChangeHistorySetAddressBookClientIdentifier()
{
  return MEMORY[0x1F4106DE0]();
}

uint64_t ABDatabaseIntegrityCheckWithAddressBook()
{
  return MEMORY[0x1F4106E00]();
}

uint64_t ABImageUtilsCopySyncImageForPerson()
{
  return MEMORY[0x1F4106E80]();
}

uint64_t ABProcessAddedImages()
{
  return MEMORY[0x1F41070F0]();
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

uint64_t ABRecordSetIntValue()
{
  return MEMORY[0x1F4107130]();
}

BOOL ABRecordSetValue(ABRecordRef record, ABPropertyID property, CFTypeRef value, CFErrorRef *error)
{
  return MEMORY[0x1F4107138](record, *(void *)&property, value, error);
}

uint64_t ABSourceCreate()
{
  return MEMORY[0x1F4107168]();
}

uint64_t ABSourceSetShouldIgnoreCapabilitiesRestrictions()
{
  return MEMORY[0x1F41071B0]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

uint64_t CDVExtractValuesFromRedirectString()
{
  return MEMORY[0x1F4113B00]();
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
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

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
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

uint64_t CalAuxDatabaseGetUID()
{
  return MEMORY[0x1F410E088]();
}

uint64_t CalDatabaseCopyClientIdentifier()
{
  return MEMORY[0x1F410E3B0]();
}

uint64_t CalDatabaseCopyDirectoryPath()
{
  return MEMORY[0x1F410E3D0]();
}

uint64_t CalDatabaseCopyDirectoryPathForDatabase()
{
  return MEMORY[0x1F410E3D8]();
}

uint64_t CalDatabaseCopyStoreWithExternalID()
{
  return MEMORY[0x1F410E500]();
}

uint64_t CalDatabaseCreateWithAuxDatabaseRef()
{
  return MEMORY[0x1F410E540]();
}

uint64_t CalDatabaseCreateWithConfigurationForAccountID()
{
  return MEMORY[0x1F410E550]();
}

uint64_t CalDatabaseCreateWithOptionsDatabaseDirectoryURLAndContainerProvider()
{
  return MEMORY[0x1F410E568]();
}

uint64_t CalDatabaseGetSequenceNumber()
{
  return MEMORY[0x1F410E5D8]();
}

uint64_t CalDatabaseRegisterYieldBlock()
{
  return MEMORY[0x1F410E658]();
}

uint64_t CalDatabaseSave()
{
  return MEMORY[0x1F410E6B0]();
}

uint64_t CalDatabaseSaveAndFlushCaches()
{
  return MEMORY[0x1F410E6B8]();
}

uint64_t CalDatabaseSetClientIdentifier()
{
  return MEMORY[0x1F410E6D8]();
}

uint64_t CalDatabaseSetPropertyModificationLoggingEnabled()
{
  return MEMORY[0x1F410E718]();
}

uint64_t CalGetDatabaseForRecord()
{
  return MEMORY[0x1F410EA30]();
}

uint64_t CalRemoveCalendar()
{
  return MEMORY[0x1F410EB98]();
}

uint64_t CalStoreCopyCalendars()
{
  return MEMORY[0x1F410EC78]();
}

uint64_t CalStoreCopyExternalModificationTag()
{
  return MEMORY[0x1F410EC98]();
}

uint64_t CalStoreSetExternalModificationTag()
{
  return MEMORY[0x1F410EDC0]();
}

uint64_t DACPLoggingAddCustomLogFile()
{
  return MEMORY[0x1F4117108]();
}

uint64_t DACPLoggingAppendDataToLogFile()
{
  return MEMORY[0x1F4117110]();
}

uint64_t DACPLoggingSlurpFileIntoLogFile()
{
  return MEMORY[0x1F4117120]();
}

uint64_t DACustomLogDirectory()
{
  return MEMORY[0x1F4117128]();
}

uint64_t DALoggingwithCategory()
{
  return MEMORY[0x1F4117130]();
}

uint64_t DAMigrateLogsIfNeeded()
{
  return MEMORY[0x1F4117138]();
}

uint64_t DMGetPreviousBuildVersion()
{
  return MEMORY[0x1F41173C0]();
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

uint64_t SBGetScreenLockStatus()
{
  return MEMORY[0x1F415C050]();
}

uint64_t SBSProcessAssertionCreateForPID()
{
  return MEMORY[0x1F415C3B8]();
}

uint64_t SBSSpringBoardServerPort()
{
  return MEMORY[0x1F415C450]();
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
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
  return (Class)MEMORY[0x1F4181728](name);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
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

int setpriority(int a1, id_t a2, int a3)
{
  return MEMORY[0x1F40CDF98](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1F40CE978](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE990](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1F40CE9D0](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE9E8](activity);
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1F40CF040](object1, object2);
}