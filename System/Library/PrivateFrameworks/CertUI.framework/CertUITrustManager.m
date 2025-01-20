@interface CertUITrustManager
+ (id)defaultTrustManager;
- (BOOL)_hasExceptionsForSMIMETrust:(__SecTrust *)a3 sender:(id)a4;
- (CertUITrustManager)init;
- (CertUITrustManager)initWithAccessGroup:(id)a3;
- (id)_getExceptionsForSSLTrust:(__SecTrust *)a3 hostname:(id)a4 service:(id)a5;
- (int)_actionForTrust:(__SecTrust *)a3 exceptions:(id)a4;
- (int)actionForSMIMETrust:(__SecTrust *)a3 sender:(id)a4;
- (int)actionForSSLTrust:(__SecTrust *)a3 hostname:(id)a4 service:(id)a5;
- (unsigned)_rawTrustResultForTrust:(__SecTrust *)a3 exceptions:(id)a4;
- (unsigned)rawTrustResultForSSLTrust:(__SecTrust *)a3 hostname:(id)a4 service:(id)a5;
- (void)addSMIMETrust:(__SecTrust *)a3 sender:(id)a4;
- (void)addSSLTrust:(__SecTrust *)a3 hostname:(id)a4 service:(id)a5;
- (void)removeAllTrusts;
- (void)removeSMIMETrust:(__SecTrust *)a3 sender:(id)a4;
- (void)removeSSLTrust:(__SecTrust *)a3 hostname:(id)a4 service:(id)a5;
@end

@implementation CertUITrustManager

uint64_t __41__CertUITrustManager_defaultTrustManager__block_invoke()
{
  defaultTrustManager_sDefaultManager = objc_alloc_init(CertUITrustManager);

  return MEMORY[0x270F9A758]();
}

- (CertUITrustManager)initWithAccessGroup:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CertUITrustManager;
  v5 = [(CertUITrustManager *)&v9 init];
  if (v5)
  {
    CertUILoggingInitialize();
    uint64_t v6 = [v4 copy];
    access = v5->_access;
    v5->_access = (NSString *)v6;
  }
  return v5;
}

- (int)actionForSSLTrust:(__SecTrust *)a3 hostname:(id)a4 service:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  if (a3 && v9 && SecTrustGetCertificateCount(a3) > 0)
  {
    v11 = [(CertUITrustManager *)self _getExceptionsForSSLTrust:a3 hostname:v9 service:v10];
    int v12 = [(CertUITrustManager *)self _actionForTrust:a3 exceptions:v11];
  }
  else
  {
    v13 = (void *)_CertUILogObjects;
    if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
    {
      v14 = v13;
      v15 = NSStringFromSelector(a2);
      int v17 = 138412802;
      v18 = v15;
      __int16 v19 = 2112;
      id v20 = v9;
      __int16 v21 = 2112;
      v22 = a3;
      _os_log_impl(&dword_2152BF000, v14, OS_LOG_TYPE_ERROR, "%@ Invalid arguments host: %@ trust: %@", (uint8_t *)&v17, 0x20u);
    }
    int v12 = 0;
  }

  return v12;
}

- (int)_actionForTrust:(__SecTrust *)a3 exceptions:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  SecTrustSetExceptions(a3, (CFDataRef)a4);
  int v15 = 0;
  int v5 = MEMORY[0x2166B7180](a3, &v15);
  int v6 = 0;
  if (!v5)
  {
    switch(v15)
    {
      case 1:
      case 4:
        v8 = _CertUILogObjects;
        int v6 = 1;
        if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          int v17 = v15;
          _os_log_impl(&dword_2152BF000, v8, OS_LOG_TYPE_INFO, "Got SecTrustEvaluate result %u. Allowing.", buf, 8u);
        }
        break;
      case 3:
        uint64_t v13 = _CertUILogObjects;
        if (!os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_INFO)) {
          goto LABEL_11;
        }
        *(_DWORD *)buf = 67109120;
        int v17 = v15;
        id v10 = "Got SecTrustEvaluate result %u. Denying.";
        v11 = v13;
        os_log_type_t v12 = OS_LOG_TYPE_INFO;
        goto LABEL_10;
      case 5:
        v14 = _CertUILogObjects;
        if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          int v17 = v15;
          _os_log_impl(&dword_2152BF000, v14, OS_LOG_TYPE_INFO, "Got SecTrustEvaluate result %u. Need to prompt.", buf, 8u);
        }
        int v6 = 2;
        break;
      default:
        uint64_t v9 = _CertUILogObjects;
        if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          int v17 = v15;
          id v10 = "Don't know how to handle SecTrustEvaluate result %u. Denying";
          v11 = v9;
          os_log_type_t v12 = OS_LOG_TYPE_ERROR;
LABEL_10:
          _os_log_impl(&dword_2152BF000, v11, v12, v10, buf, 8u);
        }
LABEL_11:
        int v6 = 0;
        break;
    }
  }
  return v6;
}

+ (id)defaultTrustManager
{
  if (defaultTrustManager_onceToken != -1) {
    dispatch_once(&defaultTrustManager_onceToken, &__block_literal_global);
  }
  v2 = (void *)defaultTrustManager_sDefaultManager;

  return v2;
}

- (CertUITrustManager)init
{
  return [(CertUITrustManager *)self initWithAccessGroup:0];
}

- (unsigned)_rawTrustResultForTrust:(__SecTrust *)a3 exceptions:(id)a4
{
  SecTrustSetExceptions(a3, (CFDataRef)a4);
  unsigned int v6 = 3;
  if (MEMORY[0x2166B7180](a3, &v6)) {
    return 3;
  }
  else {
    return v6;
  }
}

- (id)_getExceptionsForSSLTrust:(__SecTrust *)a3 hostname:(id)a4 service:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = (__CFString *)a5;
  if (!a3 || !v9 || SecTrustGetCertificateCount(a3) <= 0)
  {
    int v17 = (void *)_CertUILogObjects;
    if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = v17;
      __int16 v19 = NSStringFromSelector(a2);
      int v21 = 138412802;
      v22 = v19;
      __int16 v23 = 2112;
      id v24 = v9;
      __int16 v25 = 2112;
      v26 = a3;
      _os_log_impl(&dword_2152BF000, v18, OS_LOG_TYPE_ERROR, "%@ Invalid arguments host: %@ trust: %@", (uint8_t *)&v21, 0x20u);
    }
LABEL_10:
    v14 = 0;
    goto LABEL_11;
  }
  SecTrustGetCertificateAtIndex(a3, 0);
  SHA1Digest = (void *)SecCertificateGetSHA1Digest();
  DictionaryForDigestHostService = _CopyVersion2QueryDictionaryForDigestHostService(self->_access, SHA1Digest, v9, v10);
  if (!DictionaryForDigestHostService
    || (uint64_t v13 = DictionaryForDigestHostService,
        v14 = (void *)_CopyExceptionsForMutableQuery(DictionaryForDigestHostService),
        CFRelease(v13),
        !v14))
  {
    int v15 = _CopyVersion2QueryDictionaryForDigestHostService(self->_access, SHA1Digest, v9, 0);
    if (v15)
    {
      v16 = v15;
      v14 = (void *)_CopyExceptionsForMutableQuery(v15);
      CFRelease(v16);
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_11:

  return v14;
}

- (unsigned)rawTrustResultForSSLTrust:(__SecTrust *)a3 hostname:(id)a4 service:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  if (a3 && v9 && SecTrustGetCertificateCount(a3) > 0)
  {
    v11 = [(CertUITrustManager *)self _getExceptionsForSSLTrust:a3 hostname:v9 service:v10];
    unsigned int v12 = [(CertUITrustManager *)self _rawTrustResultForTrust:a3 exceptions:v11];
  }
  else
  {
    uint64_t v13 = (void *)_CertUILogObjects;
    if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
    {
      v14 = v13;
      int v15 = NSStringFromSelector(a2);
      int v17 = 138412802;
      uint64_t v18 = v15;
      __int16 v19 = 2112;
      id v20 = v9;
      __int16 v21 = 2112;
      v22 = a3;
      _os_log_impl(&dword_2152BF000, v14, OS_LOG_TYPE_ERROR, "%@ Invalid arguments host: %@ trust: %@", (uint8_t *)&v17, 0x20u);
    }
    unsigned int v12 = 3;
  }

  return v12;
}

- (int)actionForSMIMETrust:(__SecTrust *)a3 sender:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v8 = v7;
  if (a3 && v7 && SecTrustGetCertificateCount(a3) > 0)
  {
    SecTrustGetCertificateAtIndex(a3, 0);
    SHA1Digest = (void *)SecCertificateGetSHA1Digest();
    DictionaryForDigestSender = _CopyVersion2QueryDictionaryForDigestSender(self->_access, SHA1Digest, v8);
    if (DictionaryForDigestSender)
    {
      v11 = DictionaryForDigestSender;
      unsigned int v12 = (void *)_CopyExceptionsForMutableQuery(DictionaryForDigestSender);
      CFRelease(v11);
    }
    else
    {
      unsigned int v12 = 0;
    }
    int v16 = [(CertUITrustManager *)self _actionForTrust:a3 exceptions:v12];
  }
  else
  {
    uint64_t v13 = (void *)_CertUILogObjects;
    if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
    {
      v14 = v13;
      int v15 = NSStringFromSelector(a2);
      int v18 = 138412802;
      __int16 v19 = v15;
      __int16 v20 = 2112;
      __int16 v21 = v8;
      __int16 v22 = 2112;
      uint64_t v23 = a3;
      _os_log_impl(&dword_2152BF000, v14, OS_LOG_TYPE_ERROR, "%@ Invalid arguments sender: %@ trust: %@", (uint8_t *)&v18, 0x20u);
    }
    int v16 = 0;
  }

  return v16;
}

- (void)addSSLTrust:(__SecTrust *)a3 hostname:(id)a4 service:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = (__CFString *)a5;
  if (a3 && v9 && SecTrustGetCertificateCount(a3) > 0)
  {
    CFDataRef v11 = SecTrustCopyExceptions(a3);
    SecTrustGetCertificateAtIndex(a3, 0);
    SHA1Digest = (void *)SecCertificateGetSHA1Digest();
    DictionaryForDigestHostService = _CopyVersion2QueryDictionaryForDigestHostService(self->_access, SHA1Digest, v9, v10);
    if (DictionaryForDigestHostService)
    {
      v14 = DictionaryForDigestHostService;
      _SaveExceptionsForMutableQuery(DictionaryForDigestHostService, v11, (const void *)*MEMORY[0x263F16EA8]);
      CFRelease(v14);
    }
    if (v11) {
      CFRelease(v11);
    }
  }
  else
  {
    int v15 = (void *)_CertUILogObjects;
    if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
    {
      int v16 = v15;
      int v17 = NSStringFromSelector(a2);
      int v18 = 138412802;
      __int16 v19 = v17;
      __int16 v20 = 2112;
      id v21 = v9;
      __int16 v22 = 2112;
      uint64_t v23 = a3;
      _os_log_impl(&dword_2152BF000, v16, OS_LOG_TYPE_ERROR, "%@ Invalid arguments host: %@ trust: %@", (uint8_t *)&v18, 0x20u);
    }
  }
}

- (void)addSMIMETrust:(__SecTrust *)a3 sender:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v8 = v7;
  if (a3 && v7 && SecTrustGetCertificateCount(a3) > 0)
  {
    CFDataRef v9 = SecTrustCopyExceptions(a3);
    SecTrustGetCertificateAtIndex(a3, 0);
    SHA1Digest = (void *)SecCertificateGetSHA1Digest();
    DictionaryForDigestSender = _CopyVersion2QueryDictionaryForDigestSender(self->_access, SHA1Digest, v8);
    if (DictionaryForDigestSender)
    {
      unsigned int v12 = DictionaryForDigestSender;
      _SaveExceptionsForMutableQuery(DictionaryForDigestSender, v9, 0);
      CFRelease(v12);
    }
    if (v9) {
      CFRelease(v9);
    }
  }
  else
  {
    uint64_t v13 = (void *)_CertUILogObjects;
    if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
    {
      v14 = v13;
      int v15 = NSStringFromSelector(a2);
      int v16 = 138412802;
      int v17 = v15;
      __int16 v18 = 2112;
      __int16 v19 = v8;
      __int16 v20 = 2112;
      id v21 = a3;
      _os_log_impl(&dword_2152BF000, v14, OS_LOG_TYPE_ERROR, "%@ Invalid arguments sender: %@ trust: %@", (uint8_t *)&v16, 0x20u);
    }
  }
}

- (void)removeSSLTrust:(__SecTrust *)a3 hostname:(id)a4 service:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = (__CFString *)a5;
  if (a3 && v9 && SecTrustGetCertificateCount(a3) > 0)
  {
    SecTrustGetCertificateAtIndex(a3, 0);
    SHA1Digest = (void *)SecCertificateGetSHA1Digest();
    DictionaryForDigestHostService = _CopyVersion2QueryDictionaryForDigestHostService(self->_access, SHA1Digest, v9, v10);
    _DeleteExceptionsForQuery(DictionaryForDigestHostService);
    if (DictionaryForDigestHostService) {
      CFRelease(DictionaryForDigestHostService);
    }
  }
  else
  {
    uint64_t v13 = (void *)_CertUILogObjects;
    if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
    {
      v14 = v13;
      int v15 = NSStringFromSelector(a2);
      int v16 = 138412802;
      int v17 = v15;
      __int16 v18 = 2112;
      id v19 = v9;
      __int16 v20 = 2112;
      id v21 = a3;
      _os_log_impl(&dword_2152BF000, v14, OS_LOG_TYPE_ERROR, "%@ Invalid arguments host: %@ trust: %@", (uint8_t *)&v16, 0x20u);
    }
  }
}

- (void)removeSMIMETrust:(__SecTrust *)a3 sender:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v8 = v7;
  if (a3 && v7 && SecTrustGetCertificateCount(a3) > 0)
  {
    SecTrustGetCertificateAtIndex(a3, 0);
    SHA1Digest = (void *)SecCertificateGetSHA1Digest();
    DictionaryForDigestSender = _CopyVersion2QueryDictionaryForDigestSender(self->_access, SHA1Digest, v8);
    _DeleteExceptionsForQuery(DictionaryForDigestSender);
    if (DictionaryForDigestSender) {
      CFRelease(DictionaryForDigestSender);
    }
  }
  else
  {
    CFDataRef v11 = (void *)_CertUILogObjects;
    if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
    {
      unsigned int v12 = v11;
      uint64_t v13 = NSStringFromSelector(a2);
      int v14 = 138412802;
      int v15 = v13;
      __int16 v16 = 2112;
      int v17 = v8;
      __int16 v18 = 2112;
      id v19 = a3;
      _os_log_impl(&dword_2152BF000, v12, OS_LOG_TYPE_ERROR, "%@ Invalid arguments sender: %@ trust: %@", (uint8_t *)&v14, 0x20u);
    }
  }
}

- (void)removeAllTrusts
{
  DictionaryForDigest = _CopyVersion2QueryDictionaryForDigest(self->_access, 0);
  _DeleteExceptionsForQuery(DictionaryForDigest);
  if (DictionaryForDigest)
  {
    CFRelease(DictionaryForDigest);
  }
}

- (void).cxx_destruct
{
}

- (BOOL)_hasExceptionsForSMIMETrust:(__SecTrust *)a3 sender:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v7 = (__CFString *)a4;
  v8 = v7;
  if (!a3 || !v7 || SecTrustGetCertificateCount(a3) <= 0)
  {
    uint64_t v24 = (void *)_CertUILogObjects;
    if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
    {
      __int16 v25 = v24;
      v26 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v39 = v26;
      __int16 v40 = 2112;
      v41 = v8;
      __int16 v42 = 2112;
      v43 = a3;
      _os_log_impl(&dword_2152BF000, v25, OS_LOG_TYPE_ERROR, "%@ Invalid arguments sender: %@ trust: %@", buf, 0x20u);
    }
    goto LABEL_19;
  }
  SecTrustGetCertificateAtIndex(a3, 0);
  SHA1Digest = (void *)SecCertificateGetSHA1Digest();
  DictionaryForDigestSender = _CopyVersion2QueryDictionaryForDigestSender(self->_access, SHA1Digest, v8);
  CFDataRef v11 = (void *)_CertUILogObjects;
  if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_INFO))
  {
    unsigned int v12 = (const void *)*MEMORY[0x263F16ED8];
    uint64_t v13 = v11;
    Value = (void *)CFDictionaryGetValue(DictionaryForDigestSender, v12);
    int v15 = (const void *)*MEMORY[0x263F16E80];
    id v16 = Value;
    int v17 = (__CFString *)CFDictionaryGetValue(DictionaryForDigestSender, v15);
    __int16 v18 = @"global";
    if (v17) {
      __int16 v18 = v17;
    }
    *(_DWORD *)buf = 138412546;
    v39 = Value;
    __int16 v40 = 2112;
    v41 = v18;
    _os_log_impl(&dword_2152BF000, v13, OS_LOG_TYPE_INFO, "Finding exceptions for %@ in %@ access group", buf, 0x16u);
  }
  MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, DictionaryForDigestSender);
  CFDictionaryAddValue(MutableCopy, (const void *)*MEMORY[0x263F17400], (const void *)*MEMORY[0x263F17408]);
  CFTypeRef result = 0;
  OSStatus v20 = SecItemCopyMatching(MutableCopy, &result);
  CFRelease(MutableCopy);
  if (v20 != -25300 && v20 != 0)
  {
    v28 = (void *)_CertUILogObjects;
    if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
    {
      v30 = (const void *)*MEMORY[0x263F16ED8];
      v31 = v28;
      v32 = (void *)CFDictionaryGetValue(DictionaryForDigestSender, v30);
      v33 = (const void *)*MEMORY[0x263F16E80];
      id v34 = v32;
      v35 = (__CFString *)CFDictionaryGetValue(DictionaryForDigestSender, v33);
      v36 = @"global";
      *(_DWORD *)buf = 138412802;
      v39 = v32;
      if (v35) {
        v36 = v35;
      }
      __int16 v40 = 2112;
      v41 = v36;
      __int16 v42 = 1024;
      LODWORD(v43) = v20;
      _os_log_impl(&dword_2152BF000, v31, OS_LOG_TYPE_ERROR, "Couldn't find trust settings for %@ in %@ access group (%d)", buf, 0x1Cu);
    }
  }
  CFTypeRef v22 = result;
  if (DictionaryForDigestSender) {
    CFRelease(DictionaryForDigestSender);
  }
  if (!v22)
  {
LABEL_19:
    BOOL v23 = 0;
    goto LABEL_20;
  }
  CFRelease(v22);
  BOOL v23 = 1;
LABEL_20:

  return v23;
}

@end