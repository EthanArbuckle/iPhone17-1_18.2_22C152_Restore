void vsetError(const void **a1, CFIndex a2, const __CFDictionary *a3, __CFError *a4, void *a5, CFStringRef format, va_list arguments)
{
  const void *v14;
  CFStringRef v15;
  __CFString *v16;
  CFErrorDomain Domain;
  CFStringRef v18;
  void *v19;
  void *Value;
  BOOL v21;
  CFIndex v22;
  const void *v23;
  NSObject *v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  __CFString *v28;
  void *userInfoValues[2];
  long long v30;
  uint64_t v31;
  void *userInfoKeys[2];
  long long v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x263EF8340];
  if (!a1) {
    return;
  }
  v14 = *a1;
  if (v14)
  {
    CFRelease(v14);
    *a1 = 0;
  }
  v15 = CFStringCreateWithFormatAndArguments(0, 0, format, arguments);
  v16 = (__CFString *)v15;
  if (a4)
  {
    if (v15)
    {
      Domain = CFErrorGetDomain(a4);
      if (CFEqual(Domain, @"com.apple.AppleIDAuthSupport"))
      {
        if (CFErrorGetCode(a4) == 8)
        {
          v18 = CFStringCreateWithFormat(0, 0, @"%@: server is not matching pinning data", v16);
          CFRelease(v16);
          v16 = (__CFString *)v18;
        }
      }
    }
  }
  *(_OWORD *)userInfoKeys = 0u;
  v33 = 0u;
  *(_OWORD *)userInfoValues = 0u;
  v30 = 0u;
  if (!v16) {
    v16 = @"out of memory";
  }
  v19 = (void *)*MEMORY[0x263EFFC48];
  v34 = 0;
  userInfoKeys[0] = v19;
  v31 = 0;
  userInfoValues[0] = v16;
  if (isCFDictionary((BOOL)a3))
  {
    Value = (void *)CFDictionaryGetValue(a3, @"Status");
    v21 = isCFDictionary((BOOL)Value);
    v22 = 1;
    if (Value && v21)
    {
      userInfoKeys[1] = @"Status";
      userInfoValues[1] = Value;
      v23 = CFDictionaryGetValue((CFDictionaryRef)Value, @"ad");
      if (v23)
      {
        *(void *)&v33 = @"ActionData";
        *(void *)&v30 = v23;
        v22 = 3;
        if (!a4) {
          goto LABEL_20;
        }
      }
      else
      {
        v22 = 2;
        if (!a4) {
          goto LABEL_20;
        }
      }
      goto LABEL_19;
    }
  }
  else
  {
    v22 = 1;
  }
  if (a4)
  {
LABEL_19:
    userInfoKeys[v22] = (void *)*MEMORY[0x263EFFC88];
    userInfoValues[v22++] = a4;
  }
LABEL_20:
  if (a5)
  {
    userInfoKeys[v22] = @"NetworkTask";
    userInfoValues[v22++] = a5;
  }
  *a1 = CFErrorCreateWithUserInfoKeysAndValues(0, @"com.apple.AppleIDAuthSupport", a2, (const void *const *)userInfoKeys, (const void *const *)userInfoValues, v22);
  v24 = _AIDASOSLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v26 = a2;
    v27 = 2114;
    v28 = v16;
    _os_log_impl(&dword_210AA1000, v24, OS_LOG_TYPE_DEFAULT, "AppleIDAuthSupport: setError: %d:%{public}@", buf, 0x12u);
  }
  CFRelease(v16);
}

void setError(const void **a1, CFIndex a2, const __CFDictionary *a3, __CFError *a4, CFStringRef format, ...)
{
  va_start(va, format);
  if (a1) {
    vsetError(a1, a2, a3, a4, 0, format, va);
  }
}

void setErrorNetwork(const void **a1, CFIndex a2, const __CFDictionary *a3, __CFError *a4, void *a5, const __CFString *a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1) {
    vsetError(a1, a2, a3, a4, a5, a6, &a9);
  }
}

void setErrorOOM(const void **a1)
{
}

void errorNetworkProtocol(const __CFDictionary *a1, const void **a2, CFIndex a3, CFStringRef format, ...)
{
  va_start(va, format);
  vsetError(a2, a3, a1, 0, 0, format, va);
}

void sub_210AA3094(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_210AA32A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t checkChannelBindings(__SecTrust *a1, CFDictionaryRef *a2)
{
  v13[1] = *MEMORY[0x263EF8340];
  if (SecTrustGetCertificateCount(a1) < 1) {
    return 0;
  }
  CertificateAtIndex = SecTrustGetCertificateAtIndex(a1, 0);
  if (!CertificateAtIndex) {
    return 0;
  }
  CFDataRef v5 = SecCertificateCopyData(CertificateAtIndex);
  if (!v5) {
    return 0;
  }
  CFDataRef v6 = v5;
  CFIndex v7 = *(void *)ccsha256_di();
  MEMORY[0x270FA5388]();
  CFDataGetLength(v6);
  CFDataGetBytePtr(v6);
  ccdigest();
  CFRelease(v6);
  CFDataRef v8 = CFDataCreate(0, (const UInt8 *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  if (!v8) {
    return 0;
  }
  CFDataRef v9 = v8;
  Option = AppleIDAuthSupportGetOption(a2, @"sc");
  if (Option && !CFEqual(Option, v9))
  {
    uint64_t v11 = 0;
  }
  else
  {
    AppleIDAuthSupportSetOption((uint64_t)a2, @"sc", v9);
    uint64_t v11 = 1;
  }
  CFRelease(v9);
  return v11;
}

void sub_210AA3BAC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_210AA3C44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

BOOL AppleIDAuthSupportAuthenticate(CFDictionaryRef *a1, void *a2, const void **a3)
{
  *(void *)CFDataRef v9 = 0;
  CFTypeRef cf = 0;
  if (!AppleIDAuthSupportIsDone((uint64_t)a1))
  {
    Response = 0;
    while (AppleIDAuthSupportStep((uint64_t)a1, (int)Response, (uint64_t)&cf, a3))
    {
      if (Response) {
        CFRelease(Response);
      }
      if (!cf) {
        return AppleIDAuthSupportSuccess((uint64_t)a1);
      }
      Response = (__CFError *)SendRequestAndCreateResponse(a1, 0, a2, (void *)cf, (const void **)v9);
      CFRelease(cf);
      CFTypeRef cf = 0;
      if (!Response)
      {
        setError(a3, 6, 0, *(__CFError **)v9, @"Failed to get response from server");
        Response = *(__CFError **)v9;
        break;
      }
      Value = CFDictionaryGetValue(Response, @"Status");
      if (isCFDictionary((BOOL)Value)) {
        _AppleIDAuthSupportSetStatus((uint64_t)a1, Value);
      }
      if (AppleIDAuthSupportIsDone((uint64_t)a1)) {
        goto LABEL_14;
      }
    }
    if (!Response) {
      return AppleIDAuthSupportSuccess((uint64_t)a1);
    }
LABEL_14:
    CFRelease(Response);
  }
  return AppleIDAuthSupportSuccess((uint64_t)a1);
}

id SendRequestAndCreateResponse(CFDictionaryRef *a1, const __CFDictionary *a2, void *a3, void *a4, const void **a5)
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  v10 = _AIDASOSLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446722;
    v62 = "SendRequestAndCreateResponse";
    __int16 v63 = 2112;
    v64 = a4;
    __int16 v65 = 2112;
    v66 = a3;
    _os_log_impl(&dword_210AA1000, v10, OS_LOG_TYPE_INFO, "%{public}s: sending request %@ to server %@", buf, 0x20u);
  }

  v58 = a4;
  v59 = a5;
  v57 = a3;
  if (a1 && !a2)
  {
    Option = AppleIDAuthSupportGetOption(a1, @"kAppleIDAuthSupportClientInfo");
    Value = AppleIDAuthSupportGetOption(a1, @"kAppleIDAuthSupportProxiedClientInfo");
    v13 = AppleIDAuthSupportGetOption(a1, @"kAppleIDAuthSupportCompanionClientInfo");
    v56 = AppleIDAuthSupportGetOption(a1, @"kAppleIDAuthSupportAppleITeamID");
    char v55 = AppleIDAuthSupportGetOption(a1, @"kAppleIDAuthSupportAppleIClientID");
    CFDictionaryRef v14 = (const __CFDictionary *)AppleIDAuthSupportGetOption(a1, @"kAppleIDAuthSupportAdditionalHeaders");
LABEL_8:
    a2 = v14;
    goto LABEL_9;
  }
  if (a2)
  {
    Option = (void *)CFDictionaryGetValue(a2, @"kAppleIDAuthSupportClientInfo");
    Value = (void *)CFDictionaryGetValue(a2, @"kAppleIDAuthSupportProxiedClientInfo");
    v13 = (void *)CFDictionaryGetValue(a2, @"kAppleIDAuthSupportCompanionClientInfo");
    v56 = (void *)CFDictionaryGetValue(a2, @"kAppleIDAuthSupportAppleITeamID");
    char v55 = CFDictionaryGetValue(a2, @"kAppleIDAuthSupportAppleIClientID");
    CFDictionaryRef v14 = (const __CFDictionary *)CFDictionaryGetValue(a2, @"kAppleIDAuthSupportAdditionalHeaders");
    goto LABEL_8;
  }
  char v55 = 0;
  v56 = 0;
  v13 = 0;
  Value = 0;
  Option = 0;
LABEL_9:
  v15 = _AIDASOSLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136447234;
    v62 = "SendRequestAndCreateResponse";
    __int16 v63 = 2112;
    v64 = Option;
    __int16 v65 = 2112;
    v66 = Value;
    __int16 v67 = 2112;
    v68 = v13;
    __int16 v69 = 2112;
    CFDictionaryRef v70 = a2;
    _os_log_impl(&dword_210AA1000, v15, OS_LOG_TYPE_INFO, "%{public}s: CI: %@ PCI: %@ CCI: %@ AH: %@", buf, 0x34u);
  }

  v16 = objc_alloc_init(AIASSession);
  v17 = [MEMORY[0x263EFC648] ephemeralSessionConfiguration];
  v18 = (void *)[v17 copy];

  [v18 setWaitsForConnectivity:1];
  v19 = AppleIDAuthSupportGetOption(a1, @"kAppleIDAuthSupportOptionTimeoutIntervalForRequest");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (int)[v19 intValue] >= 1) {
    objc_msgSend(v18, "setTimeoutIntervalForRequest:", (double)(int)objc_msgSend(v19, "intValue"));
  }
  v20 = AppleIDAuthSupportGetOption(a1, @"kAppleIDAuthSupportOptionTimeoutIntervalForResource");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (int)[v20 intValue] >= 1) {
    double v21 = (double)(int)[v20 intValue];
  }
  else {
    double v21 = 60.0;
  }
  [v18 setTimeoutIntervalForResource:v21];
  v22 = AppleIDAuthSupportGetOption(a1, @"kAppleIDAuthSupportSourceApplicationAuditTokenData");
  if (v22)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v18, "set_sourceApplicationAuditTokenData:", v22);
    }
  }
  v23 = [MEMORY[0x263EFC640] sessionWithConfiguration:v18 delegate:v16 delegateQueue:0];
  [(AIASSession *)v16 setURLSession:v23];

  v24 = -[AIASSession requestWithURL:data:clientInfo:proxiedClientInfo:companionClientInfo:appleITeamId:appleIClientId:additionalHeaders:](v16, "requestWithURL:data:clientInfo:proxiedClientInfo:companionClientInfo:appleITeamId:appleIClientId:additionalHeaders:", v57, v58, Option, Value, v13, v56);
  v25 = _AIDASOSLog();
  BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
  if (!v24)
  {
    if (v26)
    {
      *(_DWORD *)buf = 136446210;
      v62 = "SendRequestAndCreateResponse";
      _os_log_impl(&dword_210AA1000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s: failed getting session", buf, 0xCu);
    }

    errorNetworkProtocol(0, v59, 6, @"Failed getting sessionWithConfiguration");
    goto LABEL_56;
  }
  if (v26)
  {
    *(_DWORD *)buf = 136446466;
    v62 = "SendRequestAndCreateResponse";
    __int16 v63 = 2112;
    v64 = v24;
    _os_log_impl(&dword_210AA1000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s: submissing a request to: %@", buf, 0x16u);
  }

  [v24 resume];
  v27 = [v24 sema];
  intptr_t v28 = dispatch_semaphore_wait(v27, 0xFFFFFFFFFFFFFFFFLL);

  if (v28)
  {
    v29 = _AIDASOSLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v62 = "SendRequestAndCreateResponse";
      __int16 v63 = 2112;
      v64 = v24;
      _os_log_impl(&dword_210AA1000, v29, OS_LOG_TYPE_DEFAULT, "%{public}s: request %@ timed out", buf, 0x16u);
    }

    v30 = [v24 task];
    [v30 cancel];

    [(AIASSession *)v16 invalidateAndCancel];
    v31 = [v24 networkTaskDescription];
    setErrorNetwork(v59, 6, 0, 0, v31, @"Time out, see underlying network error", v32, v33, v55);
    goto LABEL_28;
  }
  int v34 = [v24 success];
  v35 = _AIDASOSLog();
  v36 = v35;
  if (!v34)
  {
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v45 = [v24 error];
      *(_DWORD *)buf = 136446722;
      v62 = "SendRequestAndCreateResponse";
      __int16 v63 = 2112;
      v64 = v24;
      __int16 v65 = 2112;
      v66 = v45;
      _os_log_impl(&dword_210AA1000, v36, OS_LOG_TYPE_DEFAULT, "%{public}s: failed to fetch request %@: %@", buf, 0x20u);
    }
    v46 = [v24 error];

    if (v46)
    {
      v47 = [v24 error];
      v48 = [v24 networkTaskDescription];
      setErrorNetwork(v59, 6, 0, v47, v48, @"Request failed, see underlying network error", v49, v50, v55);
    }
    else
    {
      setError(v59, 10, 0, 0, @"%s: failed, but no error from NSURLSession", "SendRequestAndCreateResponse");
    }
    [(AIASSession *)v16 invalidateAndCancel];
    goto LABEL_56;
  }
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
    SendRequestAndCreateResponse_cold_1(v36);
  }

  if (v59 && *v59)
  {
    CFRelease(*v59);
    *v59 = 0;
  }
  [(AIASSession *)v16 invalidateAndCancel];
  v37 = [v24 data];
  uint64_t v38 = [v37 length];

  if (!v38)
  {
    v51 = _AIDASOSLog();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v62 = "SendRequestAndCreateResponse";
      __int16 v63 = 2112;
      v64 = v24;
      _os_log_impl(&dword_210AA1000, v51, OS_LOG_TYPE_DEFAULT, "%{public}s: no data returned in request %@", buf, 0x16u);
    }

    v31 = [v24 networkTaskDescription];
    setErrorNetwork(v59, 10, 0, 0, v31, @"%s: success with no data, no error from NSURLSession", v52, v53, (char)"SendRequestAndCreateResponse");
    goto LABEL_28;
  }
  v39 = (void *)MEMORY[0x263F08AC0];
  v40 = [v24 data];
  id v60 = 0;
  v31 = [v39 propertyListWithData:v40 options:0 format:0 error:&v60];
  v41 = (__CFError *)v60;

  if (!v31)
  {
    setError(v59, 6, 0, v41, @"%s: Failed to parse the response", "SendRequestAndCreateResponse");

    goto LABEL_56;
  }
  v42 = _AIDASOSLog();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v62 = "SendRequestAndCreateResponse";
    __int16 v63 = 2112;
    v64 = v31;
    _os_log_impl(&dword_210AA1000, v42, OS_LOG_TYPE_DEFAULT, "%{public}s: completed request %@", buf, 0x16u);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    errorNetworkProtocol(0, v59, 2, @"Not a dictionary");

LABEL_28:
LABEL_56:
    id v44 = 0;
    goto LABEL_57;
  }
  v43 = [v31 objectForKey:@"Response"];
  if (!v43 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    errorNetworkProtocol((const __CFDictionary *)v31, v59, 2, @"could not find Response key");

    goto LABEL_28;
  }
  id v44 = v43;

LABEL_57:
  return v44;
}

__CFDictionary *AppleIDAuthSupportCopyAppToken(uint64_t a1, void *a2, int a3, const __CFString *a4, const void **a5)
{
  return AppleIDAuthSupportCopyAppTokensOptions(a1, a2, a4, 0, a5);
}

__CFDictionary *AppleIDAuthSupportCopyAppTokens(uint64_t a1, void *a2, const __CFString *a3, const void **a4)
{
  return AppleIDAuthSupportCopyAppTokensOptions(a1, a2, a3, 0, a4);
}

CFDataRef _AppleIDAuthSupportCreateEncryptedData(const __CFData *a1, const char *a2, const void *a3)
{
  ccaes_gcm_encrypt_mode();
  ccgcm_context_size();
  MEMORY[0x270FA5388]();
  if (!allowSkipSettingOnInternalHardware(@"AppleIDAuthSupportNoEncryption", 0))
  {
    if (a2)
    {
      DerivedKey = CreateDerivedKey(a1, a2);
      CFDataRef v8 = DerivedKey;
      if (!DerivedKey) {
        return v8;
      }
      CFDataGetLength(DerivedKey);
      CFDataGetBytePtr(v8);
      ccgcm_init();
      MutableBytePtr = CFDataGetMutableBytePtr(v8);
      rsize_t Length = CFDataGetLength(v8);
      rsize_t v11 = CFDataGetLength(v8);
      memset_s(MutableBytePtr, Length, 0, v11);
      CFRelease(v8);
    }
    else
    {
      CFDataGetLength(a1);
      CFDataGetBytePtr(a1);
      ccgcm_init();
    }
    CFDataRef Data = CFPropertyListCreateData(0, a3, kCFPropertyListXMLFormat_v1_0, 0, 0);
    if (!Data) {
      return 0;
    }
    CFDataRef v13 = Data;
    CFIndex v14 = CFDataGetLength(Data) + 35;
    Mutable = CFDataCreateMutable(0, v14);
    CFDataRef v8 = Mutable;
    if (Mutable)
    {
      CFDataSetLength(Mutable, v14);
      v16 = CFDataGetMutableBytePtr(v8);
      *(_WORD *)v16 = 22872;
      v16[2] = 90;
      if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x263F17510], 0x10uLL, v16 + 3)) {
        abort();
      }
      ccgcm_set_iv();
      ccgcm_aad();
      CFDataGetLength(v13);
      CFDataGetBytePtr(v13);
      ccgcm_update();
      CFDataGetLength(v13);
      ccgcm_finalize();
    }
    CFRelease(v13);
    return v8;
  }
  return CFPropertyListCreateData(0, a3, kCFPropertyListXMLFormat_v1_0, 0, 0);
}

__CFData *CreateDerivedKey(const __CFData *a1, const char *a2)
{
  v13[1] = *MEMORY[0x263EF8340];
  v4 = (rsize_t *)ccsha256_di();
  if (CFDataGetLength(a1) > *v4) {
    return 0;
  }
  CFIndex Length = CFDataGetLength(a1);
  Mutable = CFDataCreateMutable(0, Length);
  if (Mutable)
  {
    CFIndex v7 = CFDataGetLength(a1);
    CFDataSetLength(Mutable, v7);
    MEMORY[0x270FA5388]();
    CFDataRef v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    CFDataGetLength(a1);
    CFDataGetBytePtr(a1);
    strlen(a2);
    cchmac();
    MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
    size_t v11 = CFDataGetLength(a1);
    memcpy(MutableBytePtr, v9, v11);
    memset_s(v9, *v4, 0, *v4);
  }
  return Mutable;
}

CFPropertyListRef _AppleIDAuthSupportCreateDecryptedData(const __CFData *a1, const char *a2, const __CFData *a3, const void **a4)
{
  error[3] = *(CFErrorRef *)MEMORY[0x263EF8340];
  ccaes_gcm_decrypt_mode();
  error[0] = 0;
  ccgcm_context_size();
  MEMORY[0x270FA5388]();
  if (!allowSkipSettingOnInternalHardware(@"AppleIDAuthSupportNoEncryption", 0))
  {
    if (a2)
    {
      DerivedKey = CreateDerivedKey(a1, a2);
      if (!DerivedKey) {
        return 0;
      }
      CFDataRef v10 = DerivedKey;
      CFDataGetLength(DerivedKey);
      CFDataGetBytePtr(v10);
      ccgcm_init();
      MutableBytePtr = CFDataGetMutableBytePtr(v10);
      size_t Length = CFDataGetLength(v10);
      bzero(MutableBytePtr, Length);
      CFRelease(v10);
    }
    else
    {
      CFDataGetLength(a1);
      CFDataGetBytePtr(a1);
      ccgcm_init();
    }
    CFIndex v13 = CFDataGetLength(a3);
    CFDataGetBytePtr(a3);
    if (v13 > 34)
    {
      if (cc_cmp_safe())
      {
        setError(a4, 5, 0, 0, @"encrypted token wrong version", error[0]);
      }
      else
      {
        CFIndex v15 = v13 - 35;
        ccgcm_set_iv();
        ccgcm_aad();
        Mutable = CFDataCreateMutable(0, v15);
        CFDataSetLength(Mutable, v15);
        CFDataGetMutableBytePtr(Mutable);
        ccgcm_update();
        ccgcm_finalize();
        if (cc_cmp_safe())
        {
          setError(a4, 5, 0, 0, @"tag version");
          CFErrorRef v17 = Mutable;
        }
        else
        {
          CFPropertyListRef v8 = CFPropertyListCreateWithData(0, Mutable, 0, 0, error);
          CFRelease(Mutable);
          if (v8) {
            return v8;
          }
          setError(a4, 5, 0, error[0], @"failed to decode decrypted data");
          CFErrorRef v17 = error[0];
          if (!error[0]) {
            return 0;
          }
        }
        CFRelease(v17);
      }
    }
    else
    {
      setError(a4, 5, 0, 0, @"encrypted token too short", error[0]);
    }
    return 0;
  }
  return CFPropertyListCreateWithData(0, a3, 0, 0, (CFErrorRef *)a4);
}

__CFDictionary *AppleIDAuthSupportCopyAppTokensOptions(uint64_t a1, void *a2, const __CFString *a3, const __CFDictionary *a4, const void **a5)
{
  *(void *)v27 = 0;
  if (!a1)
  {
    setError(a5, 7, 0, 0, @"Caller passed a NULL token to CopyAppTokens");
    return 0;
  }
  if (!isCFArray((BOOL)a3))
  {
    setError(a5, 7, 0, 0, @"Caller passed a non array as apps to CopyAppTokens: %@", a3);
    return 0;
  }
  if (a4)
  {
    Value = CFDictionaryGetValue(a4, @"cpd");
    size_t v11 = Value;
    if (Value)
    {
      CFTypeID v12 = CFGetTypeID(Value);
      if (v12 != CFDictionaryGetTypeID()) {
        return 0;
      }
    }
    CFIndex v13 = CFDictionaryGetValue(a4, @"aa");
  }
  else
  {
    size_t v11 = 0;
    CFIndex v13 = 0;
  }
  AppTokensChecksum = CreateAppTokensChecksum(a1, a3, a5);
  if (!AppTokensChecksum) {
    return 0;
  }
  CFErrorRef v17 = AppTokensChecksum;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable)
  {
    v25 = v17;
LABEL_38:
    CFRelease(v25);
    return 0;
  }
  v19 = Mutable;
  CFDictionarySetValue(Mutable, @"o", @"apptokens");
  CFDictionarySetValue(v19, @"u", *(const void **)(a1 + 40));
  CFDictionarySetValue(v19, @"app", a3);
  CFDictionarySetValue(v19, @"t", *(const void **)(a1 + 16));
  CFDictionarySetValue(v19, @"c", *(const void **)(a1 + 32));
  CFDictionarySetValue(v19, @"checksum", v17);
  CFRelease(v17);
  if (v11) {
    CFDictionarySetValue(v19, @"cpd", v11);
  }
  if (v13) {
    CFDictionarySetValue(v19, @"aa", v13);
  }
  CFDictionaryRef Response = (const __CFDictionary *)SendRequestAndCreateResponse(0, a4, a2, v19, (const void **)v27);
  CFRelease(v19);
  if (!Response)
  {
    setError(a5, 6, 0, *(__CFError **)v27, @"Failed to get response from server");
    v25 = *(__CFError **)v27;
    if (!*(void *)v27) {
      return 0;
    }
    goto LABEL_38;
  }
  CFDataRef v21 = (const __CFData *)CFDictionaryGetValue(Response, @"et");
  if (!v21)
  {
    errorNetworkProtocol(Response, a5, 2, @"Could not find encrypted token key");
    v25 = Response;
    goto LABEL_38;
  }
  DecryptedCFDataRef Data = (const __CFDictionary *)_AppleIDAuthSupportCreateDecryptedData(*(const __CFData **)(a1 + 24), 0, v21, a5);
  if (!isCFDictionary((BOOL)DecryptedData))
  {
    errorNetworkProtocol(Response, a5, 5, @"Failed to decrypt EncryptedToken (et)");
    CFRelease(Response);
    if (!DecryptedData) {
      return 0;
    }
    goto LABEL_37;
  }
  CFDictionaryRef v23 = (const __CFDictionary *)CFDictionaryGetValue(DecryptedData, @"t");
  if (v23)
  {
    CFDictionaryRef v24 = v23;
    if (isCFDictionary((BOOL)v23))
    {
      MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v24);
      goto LABEL_31;
    }
    errorNetworkProtocol(Response, a5, 2, @"Could not find token data");
    CFRelease(Response);
LABEL_37:
    v25 = DecryptedData;
    goto LABEL_38;
  }
  MutableCopy = 0;
LABEL_31:
  BOOL v26 = CFDictionaryGetValue(Response, @"Status");
  if (isCFDictionary((BOOL)v26)
    && (MutableCopy
     || (MutableCopy = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90])) != 0))
  {
    CFDictionarySetValue(MutableCopy, @"Status", v26);
  }
  CFRelease(Response);
  CFRelease(DecryptedData);
  return MutableCopy;
}

__CFData *CreateAppTokensChecksum(uint64_t a1, const __CFString *a2, const void **a3)
{
  v12[1] = *MEMORY[0x263EF8340];
  CFDataRef v6 = (CFIndex *)ccsha256_di();
  MEMORY[0x270FA5388]();
  CFPropertyListRef v8 = (char *)v12 - v7;
  CFDataGetLength(*(CFDataRef *)(a1 + 24));
  CFDataGetBytePtr(*(CFDataRef *)(a1 + 24));
  cchmac_init();
  cchmac_update();
  CFDataRef v9 = AppleIDAuthSupportCopyString(*(const __CFString **)(a1 + 40), 1);
  strlen(v9);
  cchmac_update();
  free(v9);
  if (!cfHMAC((uint64_t)v6, (uint64_t)v8, a2, a3)) {
    return 0;
  }
  Mutable = CFDataCreateMutable(0, *v6);
  CFDataSetLength(Mutable, *v6);
  CFDataGetMutableBytePtr(Mutable);
  cchmac_final();
  return Mutable;
}

void *AppleIDAuthSupportCopyAppNewAppTokensWithAuthAttribute(void *a1, void *a2, const __CFString *a3, CFDictionaryRef theDict, const void **a5)
{
  DecryptedCFDataRef Data = a1;
  *(void *)CFDataRef v21 = 0;
  if (a1)
  {
    if (a3)
    {
      if (theDict)
      {
        Value = CFDictionaryGetValue(theDict, @"cpd");
        size_t v11 = Value;
        if (Value)
        {
          CFTypeID v12 = CFGetTypeID(Value);
          if (v12 != CFDictionaryGetTypeID()) {
            return 0;
          }
        }
      }
      else
      {
        size_t v11 = 0;
      }
      AppTokensChecksum = CreateAppTokensChecksum((uint64_t)DecryptedData, a3, a5);
      if (AppTokensChecksum)
      {
        CFIndex v14 = AppTokensChecksum;
        Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        if (Mutable)
        {
          v16 = Mutable;
          CFDictionarySetValue(Mutable, @"o", @"apptokens");
          CFDictionarySetValue(v16, @"u", *((const void **)DecryptedData + 5));
          CFDictionarySetValue(v16, @"aa", a3);
          CFDictionarySetValue(v16, @"t", *((const void **)DecryptedData + 2));
          CFDictionarySetValue(v16, @"c", *((const void **)DecryptedData + 4));
          CFDictionarySetValue(v16, @"checksum", v14);
          CFRelease(v14);
          if (v11) {
            CFDictionarySetValue(v16, @"cpd", v11);
          }
          CFDictionaryRef Response = (const __CFDictionary *)SendRequestAndCreateResponse(0, theDict, a2, v16, (const void **)v21);
          CFRelease(v16);
          if (Response)
          {
            CFDataRef v18 = (const __CFData *)CFDictionaryGetValue(Response, @"et");
            if (v18)
            {
              DecryptedCFDataRef Data = (void *)_AppleIDAuthSupportCreateDecryptedData(*((const __CFData **)DecryptedData + 3), 0, v18, a5);
              if (isCFDictionary((BOOL)DecryptedData))
              {
                CFRelease(Response);
                return DecryptedData;
              }
              errorNetworkProtocol(Response, a5, 5, @"Failed to decrypt EncryptedToken (et)");
              CFRelease(Response);
              if (!DecryptedData) {
                return DecryptedData;
              }
              v19 = (__CFError *)DecryptedData;
            }
            else
            {
              errorNetworkProtocol(Response, a5, 2, @"Could not find encrypted token key");
              v19 = Response;
            }
          }
          else
          {
            setError(a5, 6, 0, *(__CFError **)v21, @"Failed to get response from server");
            v19 = *(__CFError **)v21;
            if (!*(void *)v21) {
              return 0;
            }
          }
        }
        else
        {
          v19 = v14;
        }
        CFRelease(v19);
      }
    }
    else
    {
      setError(a5, 7, 0, 0, @"Caller passed a NULL authAttribtue to CopyAppTokensWithAA");
    }
    return 0;
  }
  setError(a5, 7, 0, 0, @"Caller passed a NULL token to CopyAppTokensWithAA");
  return DecryptedData;
}

uint64_t AppleIDAuthSupportGSGetID()
{
  if (AppleIDAuthSupportGSGetID_inited != -1) {
    dispatch_once(&AppleIDAuthSupportGSGetID_inited, &__block_literal_global);
  }
  return GSid;
}

uint64_t __AppleIDAuthSupportGSGetID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  GSid = result;
  return result;
}

void GSRelease(void *a1)
{
  v2 = (const void *)a1[3];
  if (v2) {
    CFRelease(v2);
  }
  v3 = (const void *)a1[4];
  if (v3) {
    CFRelease(v3);
  }
  v4 = (const void *)a1[5];
  if (v4) {
    CFRelease(v4);
  }
  CFDataRef v5 = (const void *)a1[6];
  if (v5) {
    CFRelease(v5);
  }
  CFDataRef v6 = (const void *)a1[7];
  if (v6) {
    CFRelease(v6);
  }
  uint64_t v7 = (const void *)a1[8];
  if (v7)
  {
    CFRelease(v7);
  }
}

uint64_t AppleIDAuthSupportGSCreateContext(const void *a1, const void *a2, const void *a3, const void **a4)
{
  if (AppleIDAuthSupportGSGetID_inited != -1) {
    dispatch_once(&AppleIDAuthSupportGSGetID_inited, &__block_literal_global);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    if (a1) {
      *(void *)(Instance + 24) = CFRetain(a1);
    }
    *(void *)(Instance + 56) = CFRetain(a2);
    if (isCFDictionary((BOOL)a3)) {
      *(void *)(Instance + 48) = CFRetain(a3);
    }
    *(void *)(Instance + 72) = SendRequestAndCreateResponse;
    *(unsigned char *)(Instance + 16) = 0;
    if (a3 && CFDictionaryGetValue((CFDictionaryRef)a3, @"maybeSkipEncrypt")) {
      *(unsigned char *)(Instance + 16) = 1;
    }
  }
  else
  {
    setErrorOOM(a4);
  }
  return Instance;
}

uint64_t _AppleIDAuthSupportGSSetRPC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 72) = a2;
  return result;
}

const void *AppleIDAuthSupportGSRequestCopyResponse(void *a1, const __CFDictionary *cf, const void **a3)
{
  if (!a1[4])
  {
    CFDictionaryRef v6 = GSRequestCopyResponse((uint64_t)a1, "2SV-c2s", "2SV-s2c", @"2sv-auth", cf, a3);
    if (!v6) {
      return 0;
    }
    CFDictionaryRef v7 = v6;
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v6, @"new-t");
    if (!isCFDictionary((BOOL)Value)) {
      goto LABEL_9;
    }
    CFDataRef v9 = (const void *)a1[4];
    if (v9) {
      CFRelease(v9);
    }
    Token = _AppleIDAuthSupportCreateToken(Value, *(const void **)(a1[3] + 48), *(const void **)(a1[3] + 40));
    a1[4] = Token;
    if (!Token)
    {
      setErrorOOM(a3);
    }
    else
    {
LABEL_9:
      size_t v11 = CFDictionaryGetValue(v7, @"new-app-tokens");
      if (isCFDictionary((BOOL)v11))
      {
        CFTypeID v12 = (const void *)a1[5];
        if (v12) {
          CFRelease(v12);
        }
        a1[5] = CFRetain(v11);
      }
      CFIndex v13 = (const void *)a1[8];
      if (v13) {
        CFRelease(v13);
      }
      v4 = CFDictionaryGetValue(v7, @"BML");
      if (isCFDictionary((BOOL)v4))
      {
        CFRetain(v4);
LABEL_19:
        CFRelease(v7);
        return v4;
      }
    }
    v4 = 0;
    goto LABEL_19;
  }
  setError(a3, 5, 0, 0, @"Already have a new token");
  return 0;
}

CFDictionaryRef GSRequestCopyResponse(uint64_t a1, const char *a2, const char *a3, const void *a4, const __CFDictionary *cf, const void **a6)
{
  CFDictionaryRef v7 = cf;
  CFErrorRef error = 0;
  if (*(void *)(a1 + 64))
  {
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, cf);
    if (!MutableCopy)
    {
LABEL_32:
      setErrorOOM(a6);
      CFDataRef Data = 0;
      goto LABEL_20;
    }
    CFIndex v13 = MutableCopy;
    CFDictionarySetValue(MutableCopy, @"ServerState", *(const void **)(a1 + 64));
    CFDictionaryRef v7 = v13;
  }
  else
  {
    CFRetain(cf);
  }
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable) {
    goto LABEL_32;
  }
  CFIndex v15 = Mutable;
  CFDictionarySetValue(Mutable, @"o", a4);
  if ((allowSkipSettingOnInternalHardware(@"AppleIDAuthSupportNoEncryption", *(unsigned char *)(a1 + 16)) & 1) != 0
    || (uint64_t v16 = *(void *)(a1 + 24)) == 0)
  {
    CFDataRef Data = CFPropertyListCreateData(0, v7, kCFPropertyListXMLFormat_v1_0, 0, 0);
    if (!Data)
    {
      setErrorOOM(a6);
      goto LABEL_20;
    }
    int v18 = 1;
    v19 = kAppleIDAuthSupportClearData;
  }
  else
  {
    CFDataRef Data = _AppleIDAuthSupportCreateEncryptedData(*(const __CFData **)(v16 + 24), a2, v7);
    if (!Data)
    {
LABEL_20:
      DecryptedCFDataRef Data = 0;
      goto LABEL_25;
    }
    int v18 = 0;
    v19 = kAppleIDAuthSupportData;
  }
  CFDictionarySetValue(v15, *v19, Data);
  uint64_t v20 = *(void *)(a1 + 24);
  if (v20)
  {
    CFDictionarySetValue(v15, @"t", *(const void **)(v20 + 16));
    CFDictionarySetValue(v15, @"c", *(const void **)(*(void *)(a1 + 24) + 32));
  }
  CFRelease(Data);
  CFDataRef Data = (CFDataRef)(*(uint64_t (**)(void, void, void, __CFDictionary *, CFErrorRef *))(a1 + 72))(0, 0, *(void *)(a1 + 56), v15, &error);
  CFRelease(v15);
  if (!Data)
  {
    setError(a6, 6, 0, error, @"Failed to get response from server");
    goto LABEL_20;
  }
  if (!v18)
  {
    CFDataRef Value = (const __CFData *)CFDictionaryGetValue(Data, @"data");
    if (isCFData((BOOL)Value))
    {
      DecryptedCFDataRef Data = (const __CFDictionary *)_AppleIDAuthSupportCreateDecryptedData(*(const __CFData **)(*(void *)(a1 + 24) + 24), a3, Value, a6);
      if (!DecryptedData) {
        goto LABEL_25;
      }
      goto LABEL_23;
    }
    goto LABEL_34;
  }
  CFDataRef v21 = (const __CFData *)CFDictionaryGetValue(Data, @"clearData");
  if (!isCFData((BOOL)v21))
  {
LABEL_34:
    setError(a6, 2, 0, 0, @"data missing for server request");
    goto LABEL_20;
  }
  DecryptedCFDataRef Data = (const __CFDictionary *)CFPropertyListCreateWithData(0, v21, 0, 0, &error);
  if (!DecryptedData)
  {
    setError(a6, 5, 0, error, @"failed to decode data");
    goto LABEL_25;
  }
LABEL_23:
  CFDictionaryRef v24 = CFDictionaryGetValue(DecryptedData, @"ServerState");
  *(void *)(a1 + 64) = v24;
  if (v24) {
    CFRetain(v24);
  }
LABEL_25:
  if (v7) {
    CFRelease(v7);
  }
  if (Data) {
    CFRelease(Data);
  }
  if (error) {
    CFRelease(error);
  }
  return DecryptedData;
}

CFTypeRef AppleIDAuthSupportGSCopyNewIdentityToken(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(a1 + 32);
  if (result) {
    return CFRetain(result);
  }
  return result;
}

CFTypeRef AppleIDAuthSupportGSCopyAppTokens(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(a1 + 40);
  if (result) {
    return CFRetain(result);
  }
  return result;
}

CFDictionaryRef AppleIDAuthSupportGSRPC(uint64_t a1, const void *a2, const __CFDictionary *cf, const void **a4)
{
  return GSRequestCopyResponse(a1, "gs-operation-c2s", "gs-operation-s2c", a2, cf, a4);
}

uint64_t AppleIDAuthSupportGSOperation(const void *a1, const void *a2, const __CFDictionary *a3, const void *a4, const void *a5, const void **a6)
{
  uint64_t result = AppleIDAuthSupportGSCreateContext(a1, a4, a5, a6);
  if (result)
  {
    CFDataRef v10 = (const void *)result;
    CFDictionaryRef v11 = GSRequestCopyResponse(result, "gs-operation-c2s", "gs-operation-s2c", a2, a3, a6);
    CFRelease(v10);
    return (uint64_t)v11;
  }
  return result;
}

uint64_t allowSkipSettingOnInternalHardware(const __CFString *a1, char a2)
{
  if ((a2 & 1) == 0 && !CFPreferencesGetAppBooleanValue(a1, @".GlobalPreferences", 0)) {
    return 0;
  }
  uint64_t v2 = os_variant_allows_internal_security_policies();
  v3 = _AIDASOSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    allowSkipSettingOnInternalHardware_cold_1(v2, v3);
  }

  return v2;
}

uint64_t cfHMAC(uint64_t a1, uint64_t a2, const __CFString *a3, const void **a4)
{
  CFTypeID v8 = CFGetTypeID(a3);
  if (v8 != CFArrayGetTypeID())
  {
    if (v8 == CFStringGetTypeID())
    {
      CFIndex v15 = AppleIDAuthSupportCopyString(a3, 0);
      strlen(v15);
      cchmac_update();
      free(v15);
    }
    else
    {
      if (v8 != CFDataGetTypeID())
      {
        setError(a4, 7, 0, 0, @"Caller passed a app name as a non string: %@", a3);
        return 0;
      }
      CFDataGetLength((CFDataRef)a3);
      CFDataGetBytePtr((CFDataRef)a3);
      cchmac_update();
    }
    return 1;
  }
  CFIndex Count = CFArrayGetCount((CFArrayRef)a3);
  CFIndex v10 = Count - 1;
  if (Count < 1) {
    return 1;
  }
  CFIndex v11 = 0;
  do
  {
    ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a3, v11);
    uint64_t result = cfHMAC(a1, a2, ValueAtIndex, a4);
    if (!result) {
      break;
    }
  }
  while (v10 != v11++);
  return result;
}

uint64_t AppleIDAuthSupportGetClientInfo()
{
  if (AppleIDAuthSupportGetClientInfo_onceToken != -1) {
    dispatch_once(&AppleIDAuthSupportGetClientInfo_onceToken, &__block_literal_global_0);
  }
  return AppleIDAuthSupportGetClientInfo_clientInfo;
}

void __AppleIDAuthSupportGetClientInfo_block_invoke()
{
  CFDictionaryRef v0 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  if (v0)
  {
    CFDictionaryRef v1 = v0;
    CFDataRef Value = CFDictionaryGetValue(v0, (const void *)*MEMORY[0x263EFFAB0]);
    v3 = CFDictionaryGetValue(v1, (const void *)*MEMORY[0x263EFFAC0]);
    v4 = CFDictionaryGetValue(v1, (const void *)*MEMORY[0x263EFFAB8]);
    if (Value) {
      BOOL v5 = v3 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5 || v4 == 0) {
      CFStringRef v7 = 0;
    }
    else {
      CFStringRef v7 = CFStringCreateWithFormat(0, 0, @"%@;%@;%@", v4, v3, Value);
    }
    CFRelease(v1);
  }
  else
  {
    CFStringRef v7 = 0;
  }
  AppleIDAuthSupportGetClientInfo_clientInfo = (uint64_t)CFStringCreateWithFormat(0, 0, @"<%@> <%@> <%@>", @"iOS", v7, @"AppleIDAuthSupport");
  CFRelease(@"iOS");
  CFRelease(v7);
  CFRelease(@"AppleIDAuthSupport");
}

BOOL isCFArray(BOOL result)
{
  if (result)
  {
    CFDictionaryRef v1 = (const void *)result;
    CFTypeID TypeID = CFArrayGetTypeID();
    return TypeID == CFGetTypeID(v1);
  }
  return result;
}

BOOL isCFString(BOOL result)
{
  if (result)
  {
    CFDictionaryRef v1 = (const void *)result;
    CFTypeID TypeID = CFStringGetTypeID();
    return TypeID == CFGetTypeID(v1);
  }
  return result;
}

BOOL isCFData(BOOL result)
{
  if (result)
  {
    CFDictionaryRef v1 = (const void *)result;
    CFTypeID TypeID = CFDataGetTypeID();
    return TypeID == CFGetTypeID(v1);
  }
  return result;
}

BOOL isCFDictionary(BOOL result)
{
  if (result)
  {
    CFDictionaryRef v1 = (const void *)result;
    CFTypeID TypeID = CFDictionaryGetTypeID();
    return TypeID == CFGetTypeID(v1);
  }
  return result;
}

uint64_t _AIDASOSLog()
{
  if (_AIDASOSLog_onceToken != -1) {
    dispatch_once(&_AIDASOSLog_onceToken, &__block_literal_global_1);
  }
  return _AIDASOSLog_log;
}

char *AppleIDAuthSupportCopyString(const __CFString *a1, int a2)
{
  CFIndex Length = CFStringGetLength(a1);
  CFIndex v5 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  CFDictionaryRef v6 = (char *)malloc_type_malloc(v5, 0x67FA95C4uLL);
  if (!v6) {
    return v6;
  }
  if (!CFStringGetCString(a1, v6, v5, 0x8000100u))
  {
LABEL_23:
    v19 = v6;
LABEL_24:
    free(v19);
    return 0;
  }
  if (a2 == 1)
  {
    __darwin_ct_rune_t v15 = *v6;
    if (*v6)
    {
      uint64_t v16 = (unsigned __int8 *)(v6 + 1);
      do
      {
        *(v16 - 1) = __tolower(v15);
        __darwin_ct_rune_t v17 = *v16++;
        __darwin_ct_rune_t v15 = v17;
      }
      while (v17);
    }
    return v6;
  }
  if (a2 != 2) {
    return v6;
  }
  int v7 = strlen(v6);
  pDestCFIndex Length = 0;
  if (AppleIDAuthSupportCopyString_onceToken != -1) {
    dispatch_once(&AppleIDAuthSupportCopyString_onceToken, &__block_literal_global_189);
  }
  if (!AppleIDAuthSupportCopyString_profile) {
    goto LABEL_23;
  }
  int32_t v8 = v7 + 1;
  CFDataRef v9 = (UChar *)malloc_type_malloc(2 * (v7 + 1), 0x1000040BDFB0063uLL);
  if (!v9) {
    goto LABEL_23;
  }
  CFIndex v10 = v9;
  UErrorCode pErrorCode = U_ZERO_ERROR;
  u_strFromUTF8(v9, v8, &pDestLength, v6, -1, &pErrorCode);
  free(v6);
  if (pErrorCode)
  {
LABEL_27:
    v19 = (char *)v10;
    goto LABEL_24;
  }
  int v11 = 2 * pDestLength;
  while (1)
  {
    CFTypeID v12 = malloc_type_malloc(2 * v11, 0x1000040BDFB0063uLL);
    UErrorCode pErrorCode = U_ZERO_ERROR;
    int32_t v13 = usprep_prepare();
    if (pErrorCode != U_STRING_NOT_TERMINATED_WARNING && pErrorCode != U_BUFFER_OVERFLOW_ERROR) {
      break;
    }
    v11 += pDestLength;
    free(v12);
  }
  if (pErrorCode)
  {
    free(v12);
    goto LABEL_27;
  }
  int32_t v18 = v13;
  free(v10);
  u_strToUTF8(0, 0, &pDestLength, (const UChar *)v12, v18, &pErrorCode);
  CFDictionaryRef v6 = (char *)malloc_type_malloc(pDestLength + 1, 0x80205F31uLL);
  UErrorCode pErrorCode = U_ZERO_ERROR;
  u_strToUTF8(v6, pDestLength + 1, 0, (const UChar *)v12, v18, &pErrorCode);
  free(v12);
  v6[pDestLength] = 0;
  if (pErrorCode) {
    goto LABEL_23;
  }
  return v6;
}

uint64_t __AppleIDAuthSupportCopyString_block_invoke()
{
  uint64_t result = usprep_openByType();
  AppleIDAuthSupportCopyString_profile = result;
  return result;
}

uint64_t AppleIDAuthSupportDeterministicRandomCreate(const __CFString *a1)
{
  if (AppleIDAuthSupportRandomGetTypeID_inited != -1) {
    dispatch_once(&AppleIDAuthSupportRandomGetTypeID_inited, &__block_literal_global_250);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  *(void *)(Instance + 16) = malloc_type_calloc(1uLL, 0x1010uLL, 0x10800408508BC16uLL);
  v3 = AppleIDAuthSupportCopyString(a1, 0);
  *(void *)(Instance + 24) = v3;
  strlen(v3);
  ccrng_pbkdf2_prng_init();
  return Instance;
}

uint64_t AppleIDAuthSupportRandomGet(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t AppleIDAuthSupportGetTypeID()
{
  if (AppleIDAuthSupportGetTypeID_inited != -1) {
    dispatch_once(&AppleIDAuthSupportGetTypeID_inited, &__block_literal_global_193);
  }
  return haid;
}

uint64_t __AppleIDAuthSupportGetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  haid = result;
  return result;
}

void GSRelease_0(void *a1)
{
  uint64_t v2 = (void *)a1[13];
  if (v2) {
    free(v2);
  }
  v3 = (void *)a1[17];
  if (v3) {
    free(v3);
  }
  v4 = (const void *)a1[11];
  if (v4) {
    CFRelease(v4);
  }
  CFIndex v5 = (const void *)a1[6];
  if (v5) {
    CFRelease(v5);
  }
  CFDictionaryRef v6 = (const void *)a1[8];
  if (v6) {
    CFRelease(v6);
  }
  int v7 = (const void *)a1[7];
  if (v7) {
    CFRelease(v7);
  }
  int32_t v8 = (const void *)a1[2];
  if (v8) {
    CFRelease(v8);
  }
  CFDataRef v9 = (const void *)a1[9];
  if (v9)
  {
    CFRelease(v9);
  }
}

__CFDictionary *_PIICreateClearedOptions(CFDictionaryRef theDict)
{
  if (!theDict) {
    return 0;
  }
  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, theDict);
  uint64_t v2 = MutableCopy;
  if (MutableCopy)
  {
    _HideKeyValue(MutableCopy, @"Password");
    _HideKeyValue(v2, @"adsid");
    _HideKeyValue(v2, @"kAppleIDAuthSupportSRPRandomSource");
  }
  return v2;
}

void _HideKeyValue(__CFDictionary *a1, const void *a2)
{
  if (CFDictionaryGetValue(a1, a2))
  {
    CFDictionarySetValue(a1, a2, @"<<VALUE>>");
  }
}

uint64_t AppleIDAuthSupportCreate(char a1, const __CFDictionary *a2, const void **a3)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  if (_AIDASOSLog_onceToken != -1) {
    dispatch_once(&_AIDASOSLog_onceToken, &__block_literal_global_1);
  }
  if (os_log_type_enabled((os_log_t)_AIDASOSLog_log, OS_LOG_TYPE_INFO))
  {
    CFDictionaryRef v6 = _PIICreateClearedOptions(a2);
    if (_AIDASOSLog_onceToken != -1) {
      dispatch_once(&_AIDASOSLog_onceToken, &__block_literal_global_1);
    }
    int v7 = _AIDASOSLog_log;
    if (os_log_type_enabled((os_log_t)_AIDASOSLog_log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      v35 = "AppleIDAuthSupportCreate";
      __int16 v36 = 2112;
      v37 = v6;
      _os_log_impl(&dword_210AA1000, v7, OS_LOG_TYPE_INFO, "%{public}s: %@", buf, 0x16u);
    }
    if (v6) {
      CFRelease(v6);
    }
  }
  if (AppleIDAuthSupportGetTypeID_inited != -1) {
    dispatch_once(&AppleIDAuthSupportGetTypeID_inited, &__block_literal_global_193);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (!Instance)
  {
    setErrorOOM(a3);
    return Instance;
  }
  if (a2)
  {
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (TypeID != CFGetTypeID(a2))
    {
      CFRelease((CFTypeRef)Instance);
      setError(a3, 7, 0, 0, @"Options argument is not a dictionary");
      return 0;
    }
    *(void *)(Instance + 16) = CFDictionaryCreateMutableCopy(0, 0, a2);
  }
  else
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    *(void *)(Instance + 16) = Mutable;
    if (!Mutable)
    {
LABEL_47:
      CFRelease((CFTypeRef)Instance);
      setErrorOOM(a3);
      return 0;
    }
  }
  if (a1)
  {
    *(void *)(Instance + 96) = stateServerNeg1;
    if (stateServerNeg1 != stateClientNeg1) {
      goto LABEL_37;
    }
  }
  else
  {
    *(void *)(Instance + 96) = stateClientNeg1;
  }
  CFDataRef Value = CFDictionaryGetValue(a2, @"u");
  if (Value)
  {
    CFTypeID v12 = Value;
    CFTypeID v13 = CFStringGetTypeID();
    if (v13 != CFGetTypeID(v12))
    {
      CFRelease((CFTypeRef)Instance);
      setError(a3, 2, 0, 0, @"Create function for client passed invalid username key");
      return 0;
    }
    *(void *)(Instance + 24) = CFRetain(v12);
  }
  CFIndex v14 = CFDictionaryGetValue(a2, @"adsid");
  if (v14)
  {
    __darwin_ct_rune_t v15 = v14;
    CFTypeID v16 = CFStringGetTypeID();
    if (v16 != CFGetTypeID(v15))
    {
      CFRelease((CFTypeRef)Instance);
      setError(a3, 2, 0, 0, @"Create function for client passed invalid altDSID key");
      return 0;
    }
    *(void *)(Instance + 32) = CFRetain(v15);
  }
  if (!*(void *)(Instance + 24))
  {
    __darwin_ct_rune_t v17 = *(const void **)(Instance + 32);
    if (!v17)
    {
      CFRelease((CFTypeRef)Instance);
      setError(a3, 2, 0, 0, @"Create function for client have no username nor dsid");
      return 0;
    }
    *(void *)(Instance + 24) = CFRetain(v17);
  }
  CFStringRef v18 = (const __CFString *)CFDictionaryGetValue(a2, @"Protocol");
  if (v18)
  {
    CFStringRef v19 = v18;
    CFTypeID v20 = CFStringGetTypeID();
    if (v20 == CFGetTypeID(v19))
    {
      CFDataRef v21 = @"s2k";
      if (CFEqual(v19, @"s2k")
        || (CFDataRef v21 = @"s2k_fo", CFEqual(v19, @"s2k_fo")))
      {
        char v23 = 0;
        goto LABEL_38;
      }
      CFRelease((CFTypeRef)Instance);
      CFStringRef v22 = @"Protocol selected %@ is not supported";
    }
    else
    {
      CFRelease((CFTypeRef)Instance);
      CFStringRef v22 = @"Protocol selected for client was not a string: %@";
    }
    setError(a3, 2, 0, 0, v22, v19);
    return 0;
  }
LABEL_37:
  CFDataRef v21 = 0;
  char v23 = 1;
LABEL_38:
  *(void *)(Instance + 112) = ccsha256_di();
  *(void *)(Instance + 120) = ccsrp_gp_rfc5054_2048();
  uint64_t v24 = ccsha256_di();
  *(void *)(Instance + 128) = v24;
  v25 = malloc_type_calloc(1uLL, *(void *)(v24 + 8) + *(void *)(v24 + 16) + 12, 0x56E25510uLL);
  *(void *)(Instance + 136) = v25;
  if (!v25) {
    goto LABEL_47;
  }
  CFNumberRef v26 = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(Instance + 16), @"dch");
  if (v26) {
    *(_DWORD *)(Instance + 80) = getIntValue(v26);
  }
  v27 = CFDictionaryGetValue(*(CFDictionaryRef *)(Instance + 16), @"cpd");
  *(void *)(Instance + 56) = v27;
  if (v27)
  {
    intptr_t v28 = v27;
    CFTypeID v29 = CFDictionaryGetTypeID();
    if (v29 != CFGetTypeID(v28))
    {
      CFRelease((CFTypeRef)Instance);
      setError(a3, 2, 0, 0, @"client provided data is no a dictionary");
      return 0;
    }
    CFRetain(*(CFTypeRef *)(Instance + 56));
  }
  ccdigest_init();
  v30 = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  if (!v30) {
    goto LABEL_47;
  }
  v31 = v30;
  *(void *)(Instance + 88) = v30;
  if (v23)
  {
    CFArrayAppendValue(v30, @"s2k");
    uint64_t v32 = @"s2k_fo";
    v30 = v31;
  }
  else
  {
    uint64_t v32 = v21;
  }
  CFArrayAppendValue(v30, v32);
  return Instance;
}

uint64_t stateServerNeg1(uint64_t a1, const __CFDictionary *a2, __CFDictionary **a3, const void **a4)
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  if (_AIDASOSLog_onceToken != -1) {
    dispatch_once(&_AIDASOSLog_onceToken, &__block_literal_global_1);
  }
  int32_t v8 = _AIDASOSLog_log;
  if (os_log_type_enabled((os_log_t)_AIDASOSLog_log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446466;
    v61 = "stateServerNeg1";
    __int16 v62 = 2112;
    CFDictionaryRef v63 = a2;
    _os_log_impl(&dword_210AA1000, v8, OS_LOG_TYPE_INFO, "%{public}s: %@", buf, 0x16u);
  }
  if (!a2)
  {
    CFStringRef v31 = @"server neg1: input dict missing";
    goto LABEL_29;
  }
  CFDataRef Value = CFDictionaryGetValue(a2, @"ps");
  if (!Value || (CFIndex v10 = Value, TypeID = CFArrayGetTypeID(), TypeID != CFGetTypeID(v10)))
  {
    CFStringRef v31 = @"key Protocols missing";
    goto LABEL_29;
  }
  v59 = a3;
  CFIndex Count = CFArrayGetCount((CFArrayRef)v10);
  CFIndex v13 = Count - 1;
  if (Count >= 1)
  {
    CFIndex v14 = Count;
    CFIndex v15 = 0;
    while (1)
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v10, v15);
      if (!ValueAtIndex) {
        break;
      }
      CFStringRef v17 = ValueAtIndex;
      CFTypeID v18 = CFStringGetTypeID();
      if (v18 != CFGetTypeID(v17)) {
        break;
      }
      uint64_t result = validateProtocolName(a1, v17, a4);
      if (!result) {
        return result;
      }
      addStringToNegProt(a1, v17);
      if (v13 != v15) {
        addStringToNegProt(a1, @",");
      }
      if (v14 == ++v15) {
        goto LABEL_16;
      }
    }
    CFStringRef v31 = @"protocol not a string";
    goto LABEL_35;
  }
LABEL_16:
  addStringToNegProt(a1, @"|");
  CFTypeID v20 = CFDictionaryGetValue(a2, @"dch");
  if (v20)
  {
    CFDataRef v21 = v20;
    CFTypeID v22 = CFNumberGetTypeID();
    if (v22 == CFGetTypeID(v21))
    {
      addStringToNegProt(a1, @"DisregardChannelBindings");
      *(_DWORD *)(a1 + 80) = 1;
    }
  }
  CFStringRef v23 = (const __CFString *)CFDictionaryGetValue(a2, @"u");
  if (!v23 || (CFStringRef v24 = v23, v25 = CFStringGetTypeID(), v25 != CFGetTypeID(v24)))
  {
    CFStringRef v31 = @"username missing";
    goto LABEL_29;
  }
  if (!*(void *)(a1 + 144))
  {
    CFStringRef v31 = @"no callback set by server";
    goto LABEL_37;
  }
  CFIndex v26 = CFArrayGetCount((CFArrayRef)v10);
  if (v26 < 1)
  {
LABEL_26:
    CFStringRef v31 = @"server callback failed";
LABEL_37:
    uint64_t v32 = a4;
    CFIndex v33 = 4;
    goto LABEL_30;
  }
  CFIndex v27 = v26;
  CFIndex v28 = 0;
  while (1)
  {
    CFStringRef v29 = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v10, v28);
    uint64_t v30 = (*(uint64_t (**)(const __CFString *, const __CFString *, void))(a1 + 144))(v29, v24, *(void *)(a1 + 152));
    if (v30) {
      break;
    }
    if (v27 == ++v28) {
      goto LABEL_26;
    }
  }
  CFDictionaryRef v34 = (const __CFDictionary *)v30;
  addStringToNegProt(a1, @"|");
  addStringToNegProt(a1, v29);
  v35 = CFDictionaryGetValue(a2, @"cpd");
  *(void *)(a1 + 56) = v35;
  if (v35)
  {
    CFRetain(v35);
    if (!isCFDictionary(*(void *)(a1 + 56)))
    {
      CFStringRef v31 = @"Client provided data not a dictionary";
LABEL_35:
      uint64_t v32 = a4;
      CFIndex v33 = 3;
      goto LABEL_30;
    }
  }
  uint64_t v36 = ccdh_ccn_size();
  *(void *)(a1 + 104) = malloc_type_calloc(1uLL, 4 * (**(void **)(a1 + 112) + v36) + 48, 0x116A27C4uLL);
  ccsrp_ctx_init();
  if (*(void *)(a1 + 24)) {
    abort();
  }
  *(void *)(a1 + 24) = v24;
  CFRetain(v24);
  CFDataRef v37 = (const __CFData *)CFDictionaryGetValue(v34, @"s");
  uint64_t v38 = CFDictionaryGetValue(v34, @"i");
  CFDataRef v39 = (const __CFData *)CFDictionaryGetValue(v34, @"SRP2KVerifier");
  CFRelease(v34);
  v65.length = CFArrayGetCount((CFArrayRef)v10);
  v65.location = 0;
  if (CFArrayContainsValue((CFArrayRef)v10, v65, v29))
  {
    if (isCFData((BOOL)v37) && isCFNumber((BOOL)v38) && isCFData((BOOL)v39))
    {
      if (isCFData((BOOL)v39)
        && (CFIndex v40 = CFDataGetLength(v39), v40 == 8 * MEMORY[0x2166799C0](*(void *)(*(void *)(a1 + 104) + 8))))
      {
        CFDataRef v41 = (const __CFData *)CFDictionaryGetValue(a2, @"A2k");
        if (isCFData((BOOL)v41))
        {
          CFIndex Length = CFDataGetLength(v41);
          if (Length == 8 * MEMORY[0x2166799C0](*(void *)(*(void *)(a1 + 104) + 8)))
          {
            v43 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"kAppleIDAuthSupportSRPRandomSource");
            if (!v43) {
              goto LABEL_59;
            }
            id v44 = v43;
            CFTypeID v45 = CFGetTypeID(v43);
            if (AppleIDAuthSupportRandomGetTypeID_inited != -1) {
              dispatch_once(&AppleIDAuthSupportRandomGetTypeID_inited, &__block_literal_global_250);
            }
            if (v45 == AppleIDAuthSupportRandomGetTypeID_type) {
              uint64_t v58 = v44[2];
            }
            else {
LABEL_59:
            }
              uint64_t v58 = ccDRBGGetRngState();
            v46 = AppleIDAuthSupportCopyString(v24, 1);
            if (!v46)
            {
              setErrorOOM(a4);
              goto LABEL_31;
            }
            v47 = v46;
            uint64_t v48 = MEMORY[0x2166799C0](*(void *)(*(void *)(a1 + 104) + 8));
            v57[3] = (CFIndex)v57;
            MEMORY[0x270FA5388](v48);
            v57[0] = v49;
            uint64_t v50 = (UInt8 *)v57 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
            v57[2] = *(void *)(a1 + 104);
            v57[1] = CFDataGetLength(v37);
            CFDataGetBytePtr(v37);
            CFDataGetBytePtr(v39);
            CFDataGetBytePtr(v41);
            int started = ccsrp_server_start_authentication();
            free(v47);
            if (started || (size_t v53 = v57[0], v54 = CFDataCreate(0, v50, v57[0]), bzero(v50, v53), !v54))
            {
              setErrorOOM(a4);
            }
            else
            {
              CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
              if (Mutable)
              {
                v56 = Mutable;
                CFDictionarySetValue(Mutable, @"sp", v29);
                CFDictionarySetValue(v56, @"B", v54);
                CFDictionarySetValue(v56, @"s", v37);
                CFDictionarySetValue(v56, @"i", v38);
                CFRelease(v54);
                *v59 = v56;
                uint64_t result = 1;
                uint64_t v52 = stateServerNeg2;
                goto LABEL_64;
              }
              setErrorOOM(a4);
              CFRelease(v54);
            }
            uint64_t result = 0;
            uint64_t v52 = stateInvalid;
LABEL_64:
            *(void *)(a1 + 96) = v52;
            return result;
          }
        }
        CFStringRef v31 = @"A wrong size";
      }
      else
      {
        CFStringRef v31 = @"verifier wrong size";
      }
    }
    else
    {
      CFStringRef v31 = @"PBKDF or verifier missing";
    }
  }
  else
  {
    CFStringRef v31 = @"proto not supported";
  }
LABEL_29:
  uint64_t v32 = a4;
  CFIndex v33 = 2;
LABEL_30:
  setError(v32, v33, 0, 0, v31);
LABEL_31:
  uint64_t result = 0;
  *(void *)(a1 + 96) = stateInvalid;
  return result;
}

uint64_t stateClientNeg1(uint64_t a1, const __CFDictionary *a2, __CFDictionary **a3, const void **a4)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (_AIDASOSLog_onceToken != -1) {
    dispatch_once(&_AIDASOSLog_onceToken, &__block_literal_global_1);
  }
  int32_t v8 = _AIDASOSLog_log;
  if (os_log_type_enabled((os_log_t)_AIDASOSLog_log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446466;
    CFIndex v33 = "stateClientNeg1";
    __int16 v34 = 2112;
    CFDictionaryRef v35 = a2;
    _os_log_impl(&dword_210AA1000, v8, OS_LOG_TYPE_INFO, "%{public}s: %@", buf, 0x16u);
  }
  if (a2)
  {
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (TypeID != CFGetTypeID(a2))
    {
      if (CFDictionaryGetCount(a2))
      {
        setError(a4, 2, 0, 0, @"client neg1: input dict with content");
        uint64_t result = 0;
        *(void *)(a1 + 96) = stateInvalid;
        return result;
      }
    }
  }
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 88));
  CFIndex v12 = Count - 1;
  if (Count >= 1)
  {
    CFIndex v13 = Count;
    for (CFIndex i = 0; i != v13; ++i)
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 88), i);
      if (!ValueAtIndex || (v16 = ValueAtIndex, CFTypeID v17 = CFStringGetTypeID(), v17 != CFGetTypeID(v16))) {
        abort();
      }
      addStringToNegProt(a1, v16);
      if (v12 != i) {
        addStringToNegProt(a1, @",");
      }
    }
  }
  CFDataRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"kAppleIDAuthSupportSRPRandomSource");
  if (!Value) {
    goto LABEL_20;
  }
  CFTypeID v19 = CFGetTypeID(Value);
  if (AppleIDAuthSupportRandomGetTypeID_inited != -1) {
    dispatch_once(&AppleIDAuthSupportRandomGetTypeID_inited, &__block_literal_global_250);
  }
  if (v19 != AppleIDAuthSupportRandomGetTypeID_type) {
LABEL_20:
  }
    ccDRBGGetRngState();
  uint64_t v20 = ccdh_ccn_size();
  *(void *)(a1 + 104) = malloc_type_calloc(1uLL, 4 * (**(void **)(a1 + 112) + v20) + 48, 0x608695D1uLL);
  ccsrp_ctx_init();
  ccsrp_client_set_noUsernameInX();
  uint64_t v21 = MEMORY[0x2166799C0](*(void *)(*(void *)(a1 + 104) + 8));
  CFIndex v22 = 8 * v21;
  MEMORY[0x270FA5388](v21);
  ccsrp_client_start_authentication();
  CFDataRef v23 = CFDataCreate(0, &buf[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)], v22);
  if (v23)
  {
    CFDataRef v24 = v23;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (Mutable)
    {
      CFIndex v26 = Mutable;
      addStringToNegProt(a1, @"|");
      if (*(_DWORD *)(a1 + 80))
      {
        *(_DWORD *)buf = 1;
        CFNumberRef v27 = CFNumberCreate(0, kCFNumberIntType, buf);
        CFDictionarySetValue(v26, @"dch", v27);
        addStringToNegProt(a1, @"DisregardChannelBindings");
        CFRelease(v27);
      }
      CFIndex v28 = *(const void **)(a1 + 56);
      if (v28) {
        CFDictionarySetValue(v26, @"cpd", v28);
      }
      CFDictionarySetValue(v26, @"A2k", v24);
      CFDictionarySetValue(v26, @"ps", *(const void **)(a1 + 88));
      CFRelease(v24);
      CFStringRef v29 = *(const void **)(a1 + 24);
      if (v29) {
        CFDictionarySetValue(v26, @"u", v29);
      }
      uint64_t v30 = *(const void **)(a1 + 32);
      if (v30) {
        CFDictionarySetValue(v26, @"u", v30);
      }
      CFDictionarySetValue(v26, @"o", @"init");
      *a3 = v26;
      uint64_t result = 1;
      CFStringRef v31 = stateClientNeg2;
      goto LABEL_35;
    }
    setErrorOOM(a4);
    CFRelease(v24);
  }
  else
  {
    setErrorOOM(a4);
  }
  uint64_t result = 0;
  CFStringRef v31 = stateInvalid;
LABEL_35:
  *(void *)(a1 + 96) = v31;
  return result;
}

CFNumberRef getIntValue(const __CFNumber *result)
{
  unsigned int valuePtr = 0;
  if (result)
  {
    CFNumberRef v1 = result;
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(v1))
    {
      if (CFNumberGetValue(v1, kCFNumberIntType, &valuePtr)) {
        return (const __CFNumber *)valuePtr;
      }
      else {
        return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void AppleIDAuthSupportSetOption(uint64_t a1, const void *a2, const void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (_AIDASOSLog_onceToken != -1) {
    dispatch_once(&_AIDASOSLog_onceToken, &__block_literal_global_1);
  }
  CFDictionaryRef v6 = _AIDASOSLog_log;
  if (os_log_type_enabled((os_log_t)_AIDASOSLog_log, OS_LOG_TYPE_INFO))
  {
    int v7 = 136446722;
    int32_t v8 = "AppleIDAuthSupportSetOption";
    __int16 v9 = 2112;
    CFIndex v10 = a2;
    __int16 v11 = 2112;
    CFIndex v12 = a3;
    _os_log_impl(&dword_210AA1000, v6, OS_LOG_TYPE_INFO, "%{public}s: %@ : %@", (uint8_t *)&v7, 0x20u);
  }
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), a2, a3);
}

CFDictionaryRef *AppleIDAuthSupportGetOption(CFDictionaryRef *result, const void *a2)
{
  if (result) {
    return (CFDictionaryRef *)CFDictionaryGetValue(result[2], a2);
  }
  return result;
}

uint64_t AppleIDAuthSupportServerSetCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 144) = a2;
  *(void *)(result + 152) = a3;
  return result;
}

uint64_t AppleIDAuthSupportServerSetServerDataCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 160) = a2;
  *(void *)(result + 168) = a3;
  return result;
}

__CFData *AppleIDAuthSupportPBKDF2SRP(CFIndex *a1, int a2, const __CFString *a3, const __CFData *a4, const __CFNumber *a5, const void **a6)
{
  return _AppleIDAuthSupportPBKDF2SRP(a1, a2, a3, a4, a5, 2, a6);
}

__CFData *_AppleIDAuthSupportPBKDF2SRP(CFIndex *a1, int a2, const __CFString *a3, const __CFData *a4, const __CFNumber *a5, int a6, const void **a7)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  ccsha256_di();
  valuePtr[0] = 0;
  if (!CFNumberGetValue(a5, kCFNumberLongType, valuePtr))
  {
    setError(a7, 2, 0, 0, @"Could not get iteration: %@", a5);
    return 0;
  }
  if (!a2)
  {
    if (valuePtr[0] <= 998)
    {
      setError(a7, 2, 0, 0, @"iteration too few, server sent %ld", valuePtr[0]);
      return 0;
    }
    if (CFDataGetLength(a4) <= 7)
    {
      CFIndex Length = CFDataGetLength(a4);
      setError(a7, 2, 0, 0, @"salt too short: %ld", Length);
      return 0;
    }
    CFTypeID v25 = AppleIDAuthSupportCopyString(a3, a6);
    if (v25)
    {
      CFIndex v15 = v25;
      strlen(v25);
      ccdigest();
      size_t v26 = strlen(v15);
      bzero(v15, v26);
      goto LABEL_7;
    }
LABEL_19:
    setErrorOOM(a7);
    return 0;
  }
  CFIndex v14 = AppleIDAuthSupportCopyString(a3, a6);
  if (!v14) {
    goto LABEL_19;
  }
  CFIndex v15 = v14;
  strlen(v14);
  ccdigest();
  size_t v16 = strlen(v15);
  bzero(v15, v16);
  uint64_t v17 = 0;
  CFTypeID v18 = v29;
  do
  {
    unint64_t v19 = *((unsigned __int8 *)&valuePtr[1] + v17 + 7);
    *(v18 - 1) = hexchar[v19 >> 4];
    unsigned char *v18 = hexchar[v19 & 0xF];
    v18 += 2;
    ++v17;
  }
  while (v17 != 32);
  v29[63] = 0;
LABEL_7:
  CFMutableDictionaryRef Mutable = CFDataCreateMutable(0, *a1);
  uint64_t v21 = Mutable;
  if (Mutable)
  {
    CFDataSetLength(Mutable, *a1);
    CFDataGetLength(a4);
    CFDataGetBytePtr(a4);
    CFDataGetMutableBytePtr(v21);
    int v22 = ccpbkdf2_hmac();
    __memset_chk();
    free(v15);
    if (v22)
    {
      setErrorOOM(a7);
      CFRelease(v21);
      return 0;
    }
  }
  else
  {
    setErrorOOM(a7);
    size_t v24 = strlen(v15);
    bzero(v15, v24);
    free(v15);
  }
  return v21;
}

CFDataRef AppleIDAuthSupportCreateVerifier(const __CFString *a1, uint64_t a2, const __CFData *a3, const __CFNumber *a4, const __CFString *a5, const void **a6)
{
  v26[1] = *MEMORY[0x263EF8340];
  if (CFStringCompare(a1, @"s2k", 0))
  {
    if (CFEqual(a1, @"s2k_fo"))
    {
      __int16 v11 = (CFIndex *)ccsha256_di();
      int v12 = 1;
      ccsrp_gp_rfc5054_2048();
      goto LABEL_9;
    }
    if (CFStringCompare(a1, @"s4k", 0))
    {
      setError(a6, 3, 0, 0, @"Unsupported protocol: %@", a1);
      return 0;
    }
    __int16 v11 = (CFIndex *)ccsha256_di();
    ccsrp_gp_rfc5054_4096();
  }
  else
  {
    __int16 v11 = (CFIndex *)ccsha256_di();
    ccsrp_gp_rfc5054_2048();
  }
  int v12 = 0;
LABEL_9:
  if (!getIntValue(a4))
  {
    setError(a6, 2, 0, 0, @"iteration count invalid %@", a4);
    return 0;
  }
  uint64_t v13 = _AppleIDAuthSupportPBKDF2SRP(v11, v12, a5, a3, a4, 2, a6);
  if (!v13) {
    return 0;
  }
  CFDataRef v14 = v13;
  uint64_t v15 = ccdh_ccn_size();
  v26[0] = v26;
  size_t v16 = 48 * ((4 * (*v11 + v15) + 95) / 0x30uLL);
  MEMORY[0x270FA5388](v15);
  CFTypeID v18 = &v26[-2 * v17];
  ccsrp_ctx_init();
  uint64_t v19 = MEMORY[0x2166799C0](v18[1]);
  uint64_t v20 = 8 * v19;
  MEMORY[0x270FA5388](v19);
  int v22 = (UInt8 *)v26 - v21;
  CFDataGetLength(v14);
  CFDataGetBytePtr(v14);
  CFDataGetLength(a3);
  CFDataGetBytePtr(a3);
  int verifier = ccsrp_generate_verifier();
  CFRelease(v14);
  bzero(v18, v16);
  if (verifier || (CFDataRef v24 = CFDataCreate(0, v22, v20), bzero(v22, v20), !v24))
  {
    setErrorOOM(a6);
    return 0;
  }
  return v24;
}

CFDataRef SRPCreateSessionKey(uint64_t a1, const char *a2)
{
  v10[1] = *MEMORY[0x263EF8340];
  if (!ccsrp_is_authenticated()) {
    return 0;
  }
  if (!*(void *)(a1 + 48))
  {
    v10[0] = 0;
    session_key = (const UInt8 *)ccsrp_get_session_key();
    CFDataRef v5 = CFDataCreate(0, session_key, 0);
    *(void *)(a1 + 48) = v5;
    if (!v5) {
      return 0;
    }
  }
  CFDictionaryRef v6 = (size_t *)ccsha256_di();
  CFIndex v7 = *v6;
  MEMORY[0x270FA5388]();
  CFDataGetLength(*(CFDataRef *)(a1 + 48));
  CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  strlen(a2);
  cchmac();
  CFDataRef v8 = CFDataCreate(0, (const UInt8 *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  bzero((char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), *v6);
  return v8;
}

__CFData *CreateEncryptedData(uint64_t a1, CFDataRef theData, const void **a3)
{
  CFIndex Length = CFDataGetLength(theData);
  unint64_t v7 = *(void *)(ccaes_cbc_encrypt_mode() + 8);
  CFDataRef v8 = SRPCreateSessionKey(a1, "extra data key:");
  if (!v8) {
    goto LABEL_8;
  }
  CFDataRef v9 = v8;
  if ((unint64_t)CFDataGetLength(v8) <= 0x1F || (CFDataRef v10 = SRPCreateSessionKey(a1, "extra data iv:")) == 0)
  {
    CFDataRef v16 = v9;
LABEL_7:
    CFRelease(v16);
LABEL_8:
    setErrorOOM(a3);
    CFDataRef v14 = 0;
    *(void *)(a1 + 96) = stateInvalid;
    return v14;
  }
  CFDataRef v11 = v10;
  CFIndex v12 = (v7 + Length - 1) / v7 * v7;
  CFMutableDictionaryRef Mutable = CFDataCreateMutable(0, v12);
  if (!theData)
  {
    CFRelease(v9);
    CFDataRef v16 = v11;
    goto LABEL_7;
  }
  CFDataRef v14 = Mutable;
  CFDataSetLength(Mutable, v12);
  ((void (*)(void))MEMORY[0x270FA5388])();
  CFDataGetBytePtr(v11);
  uint64_t v15 = cccbc_set_iv();
  MEMORY[0x270FA5388](v15);
  CFDataGetBytePtr(v9);
  cccbc_init();
  CFDataGetLength(theData);
  CFDataGetBytePtr(theData);
  CFDataGetMutableBytePtr(v14);
  ccpad_pkcs7_encrypt();
  CFRelease(v9);
  CFRelease(v11);
  return v14;
}

uint64_t stateInvalid(int a1, int a2, int a3, const void **a4)
{
  return 0;
}

uint64_t AppleIDAuthSupportStep(uint64_t a1, int a2, uint64_t a3, const void **a4)
{
  if (a3)
  {
    v4 = *(uint64_t (**)(void))(a1 + 96);
    return v4();
  }
  else
  {
    setError(a4, 2, 0, 0, @"Missing output data ptr");
    return 0;
  }
}

BOOL AppleIDAuthSupportIsDone(uint64_t a1)
{
  CFNumberRef v1 = *(uint64_t (**)(uint64_t, int, int, const void **))(a1 + 96);
  return (char *)v1 == (char *)stateInvalid || v1 == stateDone;
}

uint64_t stateDone(uint64_t a1, int a2, int a3, const void **a4)
{
  *(void *)(a1 + 96) = stateInvalid;
  setError(a4, 5, 0, 0, @"Called Step function one too many times (at done)");
  return 0;
}

BOOL AppleIDAuthSupportSuccess(uint64_t a1)
{
  return *(void *)(a1 + 96) == (void)stateDone;
}

uint64_t AppleIDAuthSupportCopyProvidedData(uint64_t a1, int a2)
{
  uint64_t v2 = 56;
  if (a2) {
    uint64_t v2 = 64;
  }
  uint64_t v3 = *(void *)(a1 + v2);
  if (v3) {
    CFRetain(*(CFTypeRef *)(a1 + v2));
  }
  return v3;
}

CFTypeRef AppleIDAuthSupportCopyContextAppTokens(uint64_t a1)
{
  CFDictionaryRef v1 = *(const __CFDictionary **)(a1 + 64);
  if (!v1) {
    return 0;
  }
  CFDataRef Value = CFDictionaryGetValue(v1, @"t");
  if (!Value) {
    return 0;
  }
  uint64_t v3 = Value;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (TypeID != CFGetTypeID(v3)) {
    return 0;
  }
  return CFRetain(v3);
}

CFDataRef AppleIDAuthSupportCopySessionKey(uint64_t a1)
{
  return SRPCreateSessionKey(a1, "user session key:");
}

CFTypeRef _AppleIDAuthSupportSetStatus(uint64_t a1, CFTypeRef cf)
{
  v4 = *(const void **)(a1 + 72);
  if (v4) {
    CFRelease(v4);
  }
  CFTypeRef result = CFRetain(cf);
  *(void *)(a1 + 72) = result;
  return result;
}

uint64_t AppleIDAuthSupportGetStatus(uint64_t a1)
{
  return *(void *)(a1 + 72);
}

uint64_t AppleIDAuthSupportTokenGetTypeID()
{
  if (AppleIDAuthSupportTokenGetTypeID_inited != -1) {
    dispatch_once(&AppleIDAuthSupportTokenGetTypeID_inited, &__block_literal_global_228);
  }
  return tokenid;
}

uint64_t __AppleIDAuthSupportTokenGetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  tokenid = result;
  return result;
}

void GSTokenRelease(void *a1)
{
  uint64_t v2 = (const void *)a1[3];
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = (const void *)a1[2];
  if (v3) {
    CFRelease(v3);
  }
  v4 = (const void *)a1[4];
  if (v4) {
    CFRelease(v4);
  }
  CFDataRef v5 = (const void *)a1[5];
  if (v5) {
    CFRelease(v5);
  }
  CFDictionaryRef v6 = (const void *)a1[6];
  if (v6)
  {
    CFRelease(v6);
  }
}

void *_AppleIDAuthSupportCreateToken(const __CFDictionary *a1, const void *a2, const void *a3)
{
  CFDataRef Value = CFDictionaryGetValue(a1, @"GsIdmsToken");
  if (!Value) {
    return 0;
  }
  unint64_t v7 = Value;
  CFDataRef v8 = CFDictionaryGetValue(a1, @"sk");
  if (!v8) {
    return 0;
  }
  CFDataRef v9 = v8;
  CFDataRef v10 = CFDictionaryGetValue(a1, @"c");
  if (!v10) {
    return 0;
  }
  CFDataRef v11 = v10;
  CFIndex v12 = CFDictionaryGetValue(a1, @"adsid");
  if (v12) {
    a3 = v12;
  }
  if (AppleIDAuthSupportTokenGetTypeID_inited != -1) {
    dispatch_once(&AppleIDAuthSupportTokenGetTypeID_inited, &__block_literal_global_228);
  }
  uint64_t Instance = (void *)_CFRuntimeCreateInstance();
  if (Instance)
  {
    Instance[2] = CFRetain(v7);
    Instance[4] = CFRetain(v11);
    Instance[3] = CFRetain(v9);
    Instance[5] = CFRetain(a3);
    Instance[6] = CFRetain(a2);
  }
  return Instance;
}

CFDictionaryRef AppleIDAuthSupportCopyToken(uint64_t a1)
{
  CFDictionaryRef result = *(const __CFDictionary **)(a1 + 64);
  if (result) {
    return (const __CFDictionary *)_AppleIDAuthSupportCreateToken(result, *(const void **)(a1 + 24), *(const void **)(a1 + 24));
  }
  return result;
}

uint64_t AppleIDAuthSupportTokenUpdate(CFTypeRef *a1, CFDictionaryRef theDict)
{
  CFDataRef Value = CFDictionaryGetValue(theDict, @"GsIdmsToken");
  if (Value)
  {
    CFDataRef v5 = Value;
    CFRelease(a1[2]);
    a1[2] = CFRetain(v5);
  }
  CFDictionaryRef v6 = CFDictionaryGetValue(theDict, @"sk");
  if (v6)
  {
    unint64_t v7 = v6;
    CFTypeID TypeID = CFDataGetTypeID();
    if (TypeID == CFGetTypeID(v7))
    {
      CFRelease(a1[3]);
      a1[3] = CFRetain(v7);
    }
  }
  CFDataRef v9 = CFDictionaryGetValue(theDict, @"c");
  if (v9)
  {
    CFDataRef v10 = v9;
    CFTypeID v11 = CFDataGetTypeID();
    if (v11 == CFGetTypeID(v10))
    {
      CFRelease(a1[4]);
      a1[4] = CFRetain(v10);
    }
  }
  return 1;
}

CFDataRef AppleIDAuthSupportTokenCopyExternalizedVersion(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  CFIndex v12 = @"adsid";
  uint64_t v2 = *(void *)(a1 + 40);
  CFDictionaryRef v1 = *(void **)(a1 + 48);
  values[0] = *(void **)(a1 + 16);
  values[1] = v1;
  *(_OWORD *)keys = xmmword_264189A50;
  long long v11 = *(_OWORD *)off_264189A60;
  long long v8 = *(_OWORD *)(a1 + 24);
  uint64_t v9 = v2;
  CFDictionaryRef v3 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 5, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!v3) {
    return 0;
  }
  CFDictionaryRef v4 = v3;
  CFDataRef Data = CFPropertyListCreateData(0, v3, kCFPropertyListXMLFormat_v1_0, 0, 0);
  CFRelease(v4);
  return Data;
}

void *AppleIDAuthSupportTokenCreateWithExternalizedVersion(CFDataRef data, CFErrorRef *error)
{
  CFDictionaryRef v3 = (const __CFDictionary *)CFPropertyListCreateWithData(0, data, 0, 0, error);
  if (!v3) {
    return 0;
  }
  CFDictionaryRef v4 = v3;
  CFTypeID v5 = CFGetTypeID(v3);
  if (v5 == CFDictionaryGetTypeID())
  {
    CFDataRef Value = CFDictionaryGetValue(v4, @"GsIdmsToken");
    if (Value)
    {
      unint64_t v7 = Value;
      long long v8 = CFDictionaryGetValue(v4, @"sk");
      if (v8)
      {
        uint64_t v9 = v8;
        CFDataRef v10 = CFDictionaryGetValue(v4, @"c");
        if (v10)
        {
          long long v11 = v10;
          CFIndex v12 = CFDictionaryGetValue(v4, @"adsid");
          if (v12)
          {
            uint64_t v13 = v12;
            CFDataRef v14 = CFDictionaryGetValue(v4, @"u");
            if (v14)
            {
              uint64_t v15 = v14;
              if (AppleIDAuthSupportTokenGetTypeID_inited != -1) {
                dispatch_once(&AppleIDAuthSupportTokenGetTypeID_inited, &__block_literal_global_228);
              }
              uint64_t Instance = (void *)_CFRuntimeCreateInstance();
              if (Instance)
              {
                Instance[2] = CFRetain(v7);
                Instance[4] = CFRetain(v11);
                Instance[3] = CFRetain(v9);
                Instance[5] = CFRetain(v13);
                Instance[6] = CFRetain(v15);
              }
              else
              {
                setErrorOOM((const void **)error);
              }
              goto LABEL_12;
            }
            setError((const void **)error, 2, 0, 0, @"Missing username key");
          }
          else
          {
            setError((const void **)error, 2, 0, 0, @"Missing aDSID key");
          }
        }
        else
        {
          setError((const void **)error, 2, 0, 0, @"Missing cookie key");
        }
      }
      else
      {
        setError((const void **)error, 2, 0, 0, @"Missing session key");
      }
    }
    else
    {
      setError((const void **)error, 2, 0, 0, @"Missing GS iDMS key");
    }
  }
  else
  {
    setError((const void **)error, 2, 0, 0, @"token is not a property list");
  }
  uint64_t Instance = 0;
LABEL_12:
  CFRelease(v4);
  return Instance;
}

uint64_t __AppleIDAuthSupportRandomGetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  AppleIDAuthSupportRandomGetTypeID_type = result;
  return result;
}

void RandomRelease(uint64_t a1)
{
  free(*(void **)(a1 + 16));
  uint64_t v2 = *(void **)(a1 + 24);
  free(v2);
}

void addStringToNegProt(uint64_t a1, const __CFString *a2)
{
  uint64_t v2 = AppleIDAuthSupportCopyString(a2, 0);
  if (v2)
  {
    CFDictionaryRef v3 = v2;
    strlen(v2);
    ccdigest_update();
    free(v3);
  }
}

uint64_t stateClientNeg2(uint64_t a1, const __CFDictionary *a2, __CFDictionary **a3, const void **a4)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  uint64_t session_key_length = ccsrp_get_session_key_length();
  uint64_t v9 = (UInt8 *)&BytePtr - ((MEMORY[0x270FA5388](session_key_length) + 15) & 0xFFFFFFFFFFFFFFF0);
  if (_AIDASOSLog_onceToken != -1) {
    dispatch_once(&_AIDASOSLog_onceToken, &__block_literal_global_1);
  }
  CFDataRef v10 = _AIDASOSLog_log;
  if (os_log_type_enabled((os_log_t)_AIDASOSLog_log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446466;
    v56 = "stateClientNeg2";
    __int16 v57 = 2112;
    CFDictionaryRef v58 = a2;
    _os_log_impl(&dword_210AA1000, v10, OS_LOG_TYPE_INFO, "%{public}s: %@", buf, 0x16u);
  }
  if (!a2)
  {
    CFStringRef v14 = @"client neg2: input dict missing";
    goto LABEL_14;
  }
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a2, @"sp");
  if (!Value || (CFStringRef v12 = Value, TypeID = CFStringGetTypeID(), TypeID != CFGetTypeID(v12)))
  {
    CFStringRef v14 = @"selected protocol key missing";
    goto LABEL_12;
  }
  if (CFStringCompare(v12, @"s2k", 0))
  {
    if (CFStringCompare(v12, @"s2k_fo", 0))
    {
      setError(a4, 3, a2, 0, @"unknown protocol: %@", v12);
      goto LABEL_16;
    }
    int v19 = 1;
  }
  else
  {
    int v19 = 0;
  }
  uint64_t result = validateProtocolName(a1, v12, a4);
  if (result)
  {
    addStringToNegProt(a1, @"|");
    addStringToNegProt(a1, v12);
    uint64_t v20 = CFDictionaryGetValue(a2, @"c");
    if (v20)
    {
      CFTypeID v21 = CFStringGetTypeID();
      if (v21 != CFGetTypeID(v20))
      {
        CFTypeID v22 = CFDataGetTypeID();
        if (v22 != CFGetTypeID(v20))
        {
          CFStringRef v14 = @"cookie not a data object";
          goto LABEL_12;
        }
      }
    }
    CFStringRef v23 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"Password");
    if (v23)
    {
      CFStringRef v24 = v23;
      CFTypeID v25 = CFStringGetTypeID();
      if (v25 == CFGetTypeID(v24))
      {
        LODWORD(v54) = v19;
        CFDataRef v26 = (const __CFData *)CFDictionaryGetValue(a2, @"s");
        if (v26 && (v27 = v26, CFTypeID v28 = CFDataGetTypeID(), v28 == CFGetTypeID(v27)))
        {
          CFDataRef v53 = v27;
          CFNumberRef v29 = (const __CFNumber *)CFDictionaryGetValue(a2, @"i");
          if (v29 && (CFNumberRef v30 = v29, v31 = CFNumberGetTypeID(), v31 == CFGetTypeID(v30)))
          {
            CFNumberRef v52 = v30;
            CFDataRef v32 = (const __CFData *)CFDictionaryGetValue(a2, @"B");
            if (isCFData((BOOL)v32))
            {
              CFIndex v33 = CFDictionaryGetValue(a2, @"p");
              BOOL v34 = v33 != 0;
              if (v33) {
                int v35 = 2;
              }
              else {
                int v35 = 1;
              }
              CFDataRef v51 = v32;
              unint64_t Length = CFDataGetLength(v32);
              if (Length >= ccsrp_get_session_key_length())
              {
                CFStringRef v37 = *(const __CFString **)(a1 + 32);
                if (!v37) {
                  CFStringRef v37 = *(const __CFString **)(a1 + 24);
                }
                CFStringRef v50 = v37;
                uint64_t v38 = AppleIDAuthSupportCopyString(v37, v35);
                CFDataRef v39 = v53;
                if (!v38) {
                  goto LABEL_47;
                }
                CFIndex v40 = v38;
                CFDataRef v41 = _AppleIDAuthSupportPBKDF2SRP(*(CFIndex **)(a1 + 112), v54, v24, v53, v52, 2 * v34, a4);
                if (!v41)
                {
                  free(v40);
                  goto LABEL_16;
                }
                CFDataRef v42 = v41;
                uint64_t v54 = *(void *)(a1 + 104);
                CFNumberRef v52 = (const __CFNumber *)CFDataGetLength(v41);
                BytePtr = CFDataGetBytePtr(v42);
                CFDataGetLength(v39);
                CFDataGetBytePtr(v39);
                CFDataGetBytePtr(v51);
                int v43 = ccsrp_client_process_challenge();
                CFRelease(v42);
                free(v40);
                if (v43) {
                  goto LABEL_47;
                }
                CFDataRef v44 = CFDataCreate(0, v9, session_key_length);
                bzero(v9, session_key_length);
                if (v44)
                {
                  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                  if (Mutable)
                  {
                    v46 = Mutable;
                    CFDictionarySetValue(Mutable, @"u", v50);
                    CFDictionarySetValue(v46, @"M1", v44);
                    CFDictionarySetValue(v46, @"o", @"complete");
                    if (v20) {
                      CFDictionarySetValue(v46, @"c", v20);
                    }
                    v47 = *(const void **)(a1 + 56);
                    if (v47) {
                      CFDictionarySetValue(v46, @"cpd", v47);
                    }
                    uint64_t v48 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"sc");
                    if (isCFData((BOOL)v48)) {
                      CFDictionarySetValue(v46, @"sc", v48);
                    }
                    CFRelease(v44);
                    *a3 = v46;
                    uint64_t result = 1;
                    CFTypeID v18 = stateClientNeg3;
                    goto LABEL_17;
                  }
                  setErrorOOM(a4);
                  CFRelease(v44);
                }
                else
                {
LABEL_47:
                  setErrorOOM(a4);
                }
LABEL_16:
                uint64_t result = 0;
                CFTypeID v18 = stateInvalid;
LABEL_17:
                *(void *)(a1 + 96) = v18;
                return result;
              }
              CFStringRef v14 = @"B wrong size";
              goto LABEL_14;
            }
            CFStringRef v14 = @"B missing from server";
          }
          else
          {
            CFStringRef v14 = @"iteration missing from server";
          }
        }
        else
        {
          CFStringRef v14 = @"salt missing from server";
        }
LABEL_12:
        uint64_t v15 = a4;
        CFDictionaryRef v16 = a2;
LABEL_15:
        setError(v15, 2, v16, 0, v14);
        goto LABEL_16;
      }
    }
    CFStringRef v14 = @"password missing in options";
LABEL_14:
    uint64_t v15 = a4;
    CFDictionaryRef v16 = 0;
    goto LABEL_15;
  }
  return result;
}

uint64_t validateProtocolName(uint64_t a1, CFStringRef theString, const void **a3)
{
  if (CFStringFind(theString, @",", 0).location != -1)
  {
    setError(a3, 3, 0, 0, @"protocol with , not supporteted");
LABEL_5:
    uint64_t result = 0;
    *(void *)(a1 + 96) = stateInvalid;
    return result;
  }
  if (CFStringFind(theString, @"|", 0).location != -1)
  {
    setError(a3, 3, 0, 0, @"protocol with | not supporteted");
    goto LABEL_5;
  }
  return 1;
}

BOOL isCFNumber(BOOL result)
{
  if (result)
  {
    CFDictionaryRef v1 = (const void *)result;
    CFTypeID TypeID = CFNumberGetTypeID();
    return TypeID == CFGetTypeID(v1);
  }
  return result;
}

CFDataRef stateClientNeg3(uint64_t a1, const __CFDictionary *a2, uint64_t a3, const void **a4)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v7 = **(void **)(a1 + 128);
  uint64_t v8 = MEMORY[0x270FA5388](a1);
  MEMORY[0x270FA5388](v8);
  if (_AIDASOSLog_onceToken != -1) {
    dispatch_once(&_AIDASOSLog_onceToken, &__block_literal_global_1);
  }
  uint64_t v9 = _AIDASOSLog_log;
  if (os_log_type_enabled((os_log_t)_AIDASOSLog_log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446466;
    int v35 = "stateClientNeg3";
    __int16 v36 = 2112;
    CFDictionaryRef v37 = a2;
    _os_log_impl(&dword_210AA1000, v9, OS_LOG_TYPE_INFO, "%{public}s: %@", buf, 0x16u);
  }
  if (!a2)
  {
    CFStringRef v26 = @"client neg3: input dict missing";
LABEL_26:
    CFDataRef v27 = a4;
    CFIndex v28 = 2;
LABEL_27:
    CFDictionaryRef v29 = 0;
    goto LABEL_28;
  }
  CFStringRef Value = CFDictionaryGetValue(a2, @"M2");
  if (!Value || (long long v11 = Value, TypeID = CFDataGetTypeID(), TypeID != CFGetTypeID(v11)))
  {
    CFStringRef v26 = @"M2 missing (bad password)";
    goto LABEL_23;
  }
  CFIndex Length = CFDataGetLength((CFDataRef)v11);
  if (Length != ccsrp_get_session_key_length())
  {
    CFStringRef v26 = @"M2 wrong size";
    goto LABEL_26;
  }
  CFDataGetBytePtr((CFDataRef)v11);
  if ((ccsrp_client_verify_session() & 1) == 0)
  {
    CFStringRef v26 = @"server passed bad M2";
    goto LABEL_32;
  }
  addStringToNegProt(a1, @"|");
  CFDataRef v14 = (const __CFData *)CFDictionaryGetValue(a2, @"spd");
  if (v14)
  {
    CFTypeID v15 = CFDataGetTypeID();
    if (v15 == CFGetTypeID(v14)) {
      addDataToNegProt(a1, v14);
    }
  }
  addStringToNegProt(a1, @"|");
  CFDataRef v16 = (const __CFData *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"sc");
  if (v16)
  {
    CFDataRef v17 = v16;
    CFTypeID v18 = CFDataGetTypeID();
    if (v18 == CFGetTypeID(v17)) {
      addDataToNegProt(a1, v17);
    }
  }
  addStringToNegProt(a1, @"|");
  CFDataRef v19 = (const __CFData *)CFDictionaryGetValue(a2, @"np");
  if (v19)
  {
    CFDataRef v20 = v19;
    CFTypeID v21 = CFDataGetTypeID();
    if (v21 == CFGetTypeID(v20))
    {
      CFIndex v22 = CFDataGetLength(v20);
      uint64_t v23 = *(void *)(a1 + 128);
      if (v22 != *(void *)v23)
      {
        CFIndex v33 = CFDataGetLength(v20);
        setError(a4, 2, 0, 0, @"NegProto hash too short: %d", v33);
        goto LABEL_29;
      }
      (*(void (**)(uint64_t, void, uint8_t *))(v23 + 56))(v23, *(void *)(a1 + 136), &buf[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)]);
      CFDataRef v24 = SRPCreateSessionKey(a1, "HMAC key:");
      if (!v24)
      {
        setErrorOOM(a4);
        goto LABEL_29;
      }
      CFDataRef v25 = v24;
      CFDataGetLength(v24);
      CFDataGetBytePtr(v25);
      cchmac();
      CFRelease(v25);
      CFDataGetBytePtr(v20);
      if (cc_cmp_safe())
      {
        CFStringRef v26 = @"NegotationProtection HMAC invalid";
LABEL_32:
        CFDataRef v27 = a4;
        CFIndex v28 = 5;
        goto LABEL_27;
      }
      goto LABEL_33;
    }
    CFStringRef v26 = @"neg proto field missing";
LABEL_23:
    CFDataRef v27 = a4;
    CFIndex v28 = 2;
    CFDictionaryRef v29 = a2;
LABEL_28:
    setError(v27, v28, v29, 0, v26);
LABEL_29:
    CFDataRef result = 0;
    CFTypeID v31 = stateInvalid;
    goto LABEL_30;
  }
LABEL_33:
  if (!v14
    || (CFDataRef result = CreateDecryptedData(a1, v14, a4), v31 = stateInvalid, result)
    && (CFDataRef v32 = result,
        *(void *)(a1 + 64) = CFPropertyListCreateWithData(0, result, 0, 0, (CFErrorRef *)a4),
        CFRelease(v32),
        CFDataRef result = (const __CFData *)isCFDictionary(*(void *)(a1 + 64)),
        CFTypeID v31 = stateInvalid,
        result))
  {
    CFDataRef result = (const __CFData *)1;
    CFTypeID v31 = stateDone;
  }
LABEL_30:
  *(void *)(a1 + 96) = v31;
  return result;
}

uint64_t addDataToNegProt(int a1, CFDataRef theData)
{
  return ccdigest_update();
}

__CFData *CreateDecryptedData(uint64_t a1, const __CFData *a2, const void **a3)
{
  uint64_t v6 = ccaes_cbc_decrypt_mode();
  if ((unint64_t)CFDataGetLength(a2) % *(void *)(v6 + 8))
  {
    setError(a3, 5, 0, 0, @"Encrypted PKCS7 padded data not on block aligned");
LABEL_11:
    CFMutableDictionaryRef Mutable = 0;
LABEL_12:
    *(void *)(a1 + 96) = stateInvalid;
    return Mutable;
  }
  CFDataRef v7 = SRPCreateSessionKey(a1, "extra data key:");
  if (!v7)
  {
LABEL_10:
    setErrorOOM(a3);
    goto LABEL_11;
  }
  CFDataRef v8 = v7;
  if ((unint64_t)CFDataGetLength(v7) <= 0x1F || (CFDataRef v9 = SRPCreateSessionKey(a1, "extra data iv:")) == 0)
  {
    CFRelease(v8);
    goto LABEL_10;
  }
  CFDataRef v10 = v9;
  CFIndex Length = CFDataGetLength(a2);
  CFMutableDictionaryRef Mutable = CFDataCreateMutable(0, Length);
  if (!Mutable)
  {
    CFRelease(v8);
    CFRelease(v10);
    setErrorOOM(a3);
    goto LABEL_12;
  }
  CFIndex v13 = CFDataGetLength(a2);
  CFDataSetLength(Mutable, v13);
  MEMORY[0x270FA5388](v14);
  CFDataGetBytePtr(v10);
  uint64_t v15 = cccbc_set_iv();
  MEMORY[0x270FA5388](v15);
  CFDataGetBytePtr(v8);
  cccbc_init();
  CFDataGetLength(a2);
  CFDataGetBytePtr(a2);
  CFDataGetMutableBytePtr(Mutable);
  unint64_t v16 = ccpad_pkcs7_decrypt();
  if (v16 >= CFDataGetLength(a2)) {
    CreateDecryptedData_cold_1();
  }
  CFDataSetLength(Mutable, v16);
  CFRelease(v10);
  CFRelease(v8);
  return Mutable;
}

uint64_t stateServerNeg2(uint64_t a1, const __CFDictionary *a2, __CFDictionary **a3, const void **a4)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t session_key_length = ccsrp_get_session_key_length();
  uint64_t v9 = MEMORY[0x270FA5388](session_key_length);
  CFDataRef v10 = (UInt8 *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  CFIndex v11 = **(void **)(a1 + 128);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (const UInt8 *)&v39 - v13;
  if (_AIDASOSLog_onceToken != -1) {
    dispatch_once(&_AIDASOSLog_onceToken, &__block_literal_global_1);
  }
  uint64_t v15 = _AIDASOSLog_log;
  if (os_log_type_enabled((os_log_t)_AIDASOSLog_log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446466;
    CFDataRef v42 = "stateServerNeg2";
    __int16 v43 = 2112;
    CFDictionaryRef v44 = a2;
    _os_log_impl(&dword_210AA1000, v15, OS_LOG_TYPE_INFO, "%{public}s: %@", buf, 0x16u);
  }
  if (!a2)
  {
    setError(a4, 2, 0, 0, @"server neg2: input dict missing");
    goto LABEL_21;
  }
  CFIndex v40 = a3;
  CFStringRef Value = CFDictionaryGetValue(a2, @"M1");
  if (!Value || (CFDataRef v17 = Value, TypeID = CFDataGetTypeID(), TypeID != CFGetTypeID(v17)))
  {
    setError(a4, 2, 0, 0, @"M1 missing");
    goto LABEL_21;
  }
  CFIndex Length = CFDataGetLength((CFDataRef)v17);
  if (Length != ccsrp_get_session_key_length())
  {
    setError(a4, 2, 0, 0, @"M1 wrong size");
    goto LABEL_21;
  }
  CFDataGetBytePtr((CFDataRef)v17);
  if ((ccsrp_server_verify_session() & 1) == 0)
  {
    setError(a4, 2, 0, 0, @"session bad");
    goto LABEL_21;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable)
  {
LABEL_23:
    setErrorOOM(a4);
    goto LABEL_21;
  }
  CFTypeID v21 = Mutable;
  CFDataRef v22 = CFDataCreate(0, v10, session_key_length);
  bzero(v10, session_key_length);
  if (!v22) {
    goto LABEL_22;
  }
  CFDictionarySetValue(v21, @"M2", v22);
  CFRelease(v22);
  addStringToNegProt(a1, @"|");
  uint64_t v23 = *(uint64_t (**)(void, void))(a1 + 160);
  if (!v23) {
    goto LABEL_26;
  }
  EncryptedCFDataRef Data = (__CFData *)v23(*(void *)(a1 + 24), *(void *)(a1 + 168));
  if (!isCFDictionary((BOOL)EncryptedData))
  {
    if (!EncryptedData) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  CFDataRef Data = CFPropertyListCreateData(0, EncryptedData, kCFPropertyListXMLFormat_v1_0, 0, 0);
  *(void *)(a1 + 64) = EncryptedData;
  if (!Data)
  {
LABEL_22:
    CFRelease(v21);
    goto LABEL_23;
  }
  CFDataRef v26 = Data;
  EncryptedCFDataRef Data = CreateEncryptedData(a1, Data, a4);
  CFRelease(v26);
  if (!EncryptedData)
  {
    CFRelease(v21);
    return 0;
  }
  CFDictionarySetValue(v21, @"spd", EncryptedData);
  addDataToNegProt(a1, EncryptedData);
LABEL_25:
  CFRelease(EncryptedData);
LABEL_26:
  CFIndex v28 = v21;
  addStringToNegProt(a1, @"|");
  CFDictionaryRef v29 = CFDictionaryGetValue(a2, @"sc");
  CFNumberRef v30 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"sc");
  CFTypeID v31 = v30;
  if (!v29)
  {
    if (!v30) {
      goto LABEL_34;
    }
    CFRelease(v21);
    setError(a4, 2, 0, 0, @"server certificate field is missing from client");
LABEL_21:
    uint64_t result = 0;
    *(void *)(a1 + 96) = stateInvalid;
    return result;
  }
  CFTypeID v32 = CFDataGetTypeID();
  if (v32 != CFGetTypeID(v29))
  {
    CFRelease(v28);
    setError(a4, 2, 0, 0, @"server certificate field is not a data element");
    goto LABEL_21;
  }
  CFTypeID v21 = v28;
  if (isCFData((BOOL)v31) && !CFEqual(v31, v29) && !*(_DWORD *)(a1 + 80))
  {
    CFRelease(v28);
    setError(a4, 2, 0, 0, @"server certificate field is not a same");
    goto LABEL_21;
  }
  addDataToNegProt(a1, (CFDataRef)v29);
LABEL_34:
  addStringToNegProt(a1, @"|");
  (*(void (**)(void))(*(void *)(a1 + 128) + 56))();
  CFDataRef v33 = SRPCreateSessionKey(a1, "HMAC key:");
  if (!v33)
  {
    setErrorOOM(a4);
    uint64_t v38 = v21;
LABEL_44:
    CFRelease(v38);
    goto LABEL_21;
  }
  CFDataRef v34 = v33;
  CFDataGetLength(v33);
  CFDataGetBytePtr(v34);
  cchmac();
  CFRelease(v34);
  CFDataRef v35 = CFDataCreate(0, v14, v11);
  if (!v35)
  {
    setErrorOOM(a4);
    uint64_t v38 = v28;
    goto LABEL_44;
  }
  CFDataRef v36 = v35;
  CFDictionarySetValue(v28, @"np", v35);
  CFRelease(v36);
  char *v40 = v28;
  if (_AIDASOSLog_onceToken != -1) {
    dispatch_once(&_AIDASOSLog_onceToken, &__block_literal_global_1);
  }
  CFDictionaryRef v37 = _AIDASOSLog_log;
  if (os_log_type_enabled((os_log_t)_AIDASOSLog_log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    CFDataRef v42 = "stateServerNeg2";
    _os_log_impl(&dword_210AA1000, v37, OS_LOG_TYPE_INFO, "%{public}s: auth done", buf, 0xCu);
  }
  *(void *)(a1 + 96) = stateDone;
  return 1;
}

void SendRequestAndCreateResponse_cold_1(os_log_t log)
{
  *(_WORD *)CFDictionaryRef v1 = 0;
  _os_log_debug_impl(&dword_210AA1000, log, OS_LOG_TYPE_DEBUG, "success", v1, 2u);
}

void allowSkipSettingOnInternalHardware_cold_1(char a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136446466;
  CFDictionaryRef v3 = "allowSkipSettingOnInternalHardware";
  __int16 v4 = 1024;
  int v5 = a1 & 1;
  _os_log_debug_impl(&dword_210AA1000, a2, OS_LOG_TYPE_DEBUG, "%{public}s: isInternal: %d", (uint8_t *)&v2, 0x12u);
}

void CreateDecryptedData_cold_1()
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x270EE42E8](theArray, range.location, range.length, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x270EE4830](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x270EE49C8](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x270EE49D0](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x270EE49D8](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EE4D10](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D40](allocator, data, options, format, error);
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

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x270EE5118](alloc, formatOptions, format, arguments);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x270EE5148](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x270EFD710](certificate);
}

uint64_t SecPolicyCreateAppleGSService()
{
  return MEMORY[0x270EFDB28]();
}

SecPolicyRef SecPolicyCreateSSL(Boolean server, CFStringRef hostname)
{
  return (SecPolicyRef)MEMORY[0x270EFDBB0](server, hostname);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x270EFDC20](rnd, count, bytes);
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x270EFDD50](trust, result);
}

SecCertificateRef SecTrustGetCertificateAtIndex(SecTrustRef trust, CFIndex ix)
{
  return (SecCertificateRef)MEMORY[0x270EFDD70](trust, ix);
}

CFIndex SecTrustGetCertificateCount(SecTrustRef trust)
{
  return MEMORY[0x270EFDD78](trust);
}

OSStatus SecTrustSetPolicies(SecTrustRef trust, CFTypeRef policies)
{
  return MEMORY[0x270EFDDE0](trust, policies);
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x270EE55F0]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x270EE56F0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t __memset_chk()
{
  return MEMORY[0x270ED7E48]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F00](*(void *)&a1);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

uint64_t ccDRBGGetRngState()
{
  return MEMORY[0x270ED87C8]();
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x270ED87D8]();
}

uint64_t ccaes_cbc_decrypt_mode()
{
  return MEMORY[0x270ED87E0]();
}

uint64_t ccaes_cbc_encrypt_mode()
{
  return MEMORY[0x270ED87E8]();
}

uint64_t ccaes_gcm_decrypt_mode()
{
  return MEMORY[0x270ED8800]();
}

uint64_t ccaes_gcm_encrypt_mode()
{
  return MEMORY[0x270ED8808]();
}

uint64_t cccbc_init()
{
  return MEMORY[0x270ED8828]();
}

uint64_t cccbc_set_iv()
{
  return MEMORY[0x270ED8838]();
}

uint64_t ccdh_ccn_size()
{
  return MEMORY[0x270ED89D8]();
}

uint64_t ccdh_gp_n()
{
  return MEMORY[0x270ED8A10]();
}

uint64_t ccdigest()
{
  return MEMORY[0x270ED8A40]();
}

uint64_t ccdigest_init()
{
  return MEMORY[0x270ED8A48]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x270ED8A50]();
}

uint64_t ccgcm_aad()
{
  return MEMORY[0x270ED8B50]();
}

uint64_t ccgcm_context_size()
{
  return MEMORY[0x270ED8B58]();
}

uint64_t ccgcm_finalize()
{
  return MEMORY[0x270ED8B60]();
}

uint64_t ccgcm_init()
{
  return MEMORY[0x270ED8B78]();
}

uint64_t ccgcm_set_iv()
{
  return MEMORY[0x270ED8B98]();
}

uint64_t ccgcm_update()
{
  return MEMORY[0x270ED8BA0]();
}

uint64_t cchmac()
{
  return MEMORY[0x270ED8BC0]();
}

uint64_t cchmac_final()
{
  return MEMORY[0x270ED8BC8]();
}

uint64_t cchmac_init()
{
  return MEMORY[0x270ED8BD0]();
}

uint64_t cchmac_update()
{
  return MEMORY[0x270ED8BD8]();
}

uint64_t ccpad_pkcs7_decrypt()
{
  return MEMORY[0x270ED8C78]();
}

uint64_t ccpad_pkcs7_encrypt()
{
  return MEMORY[0x270ED8C80]();
}

uint64_t ccpbkdf2_hmac()
{
  return MEMORY[0x270ED8C88]();
}

uint64_t ccrng_pbkdf2_prng_init()
{
  return MEMORY[0x270ED8C98]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x270ED8D70]();
}

uint64_t ccsrp_client_process_challenge()
{
  return MEMORY[0x270ED8D98]();
}

uint64_t ccsrp_client_set_noUsernameInX()
{
  return MEMORY[0x270ED8DA0]();
}

uint64_t ccsrp_client_start_authentication()
{
  return MEMORY[0x270ED8DA8]();
}

uint64_t ccsrp_client_verify_session()
{
  return MEMORY[0x270ED8DB0]();
}

uint64_t ccsrp_ctx_init()
{
  return MEMORY[0x270ED8DB8]();
}

uint64_t ccsrp_generate_verifier()
{
  return MEMORY[0x270ED8DD8]();
}

uint64_t ccsrp_get_session_key()
{
  return MEMORY[0x270ED8DE0]();
}

uint64_t ccsrp_get_session_key_length()
{
  return MEMORY[0x270ED8DE8]();
}

uint64_t ccsrp_gp_rfc5054_2048()
{
  return MEMORY[0x270ED8DF8]();
}

uint64_t ccsrp_gp_rfc5054_4096()
{
  return MEMORY[0x270ED8E08]();
}

uint64_t ccsrp_is_authenticated()
{
  return MEMORY[0x270ED8E18]();
}

uint64_t ccsrp_server_start_authentication()
{
  return MEMORY[0x270ED8E20]();
}

uint64_t ccsrp_server_verify_session()
{
  return MEMORY[0x270ED8E28]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

void free(void *a1)
{
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

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x270EDA4B8](__s, __smax, *(void *)&__c, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

void objc_storeStrong(id *location, id obj)
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

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x270EDAB10]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

UChar *__cdecl u_strFromUTF8(UChar *dest, int32_t destCapacity, int32_t *pDestLength, const char *src, int32_t srcLength, UErrorCode *pErrorCode)
{
  return (UChar *)MEMORY[0x270F99588](dest, *(void *)&destCapacity, pDestLength, src, *(void *)&srcLength, pErrorCode);
}

char *__cdecl u_strToUTF8(char *dest, int32_t destCapacity, int32_t *pDestLength, const UChar *src, int32_t srcLength, UErrorCode *pErrorCode)
{
  return (char *)MEMORY[0x270F995A0](dest, *(void *)&destCapacity, pDestLength, src, *(void *)&srcLength, pErrorCode);
}

uint64_t usprep_openByType()
{
  return MEMORY[0x270F999B8]();
}

uint64_t usprep_prepare()
{
  return MEMORY[0x270F999C0]();
}