uint64_t GetConnectionToAuthDaemon()
{
  _xpc_connection_s *mach_service;

  if (!__iapauthd_connection)
  {
    mach_service = xpc_connection_create_mach_service("com.apple.iapauthd.xpc", 0, 0);
    __iapauthd_connection = (uint64_t)mach_service;
    if (mach_service)
    {
      xpc_connection_set_event_handler(mach_service, &__block_literal_global);
      xpc_connection_resume((xpc_connection_t)__iapauthd_connection);
    }
    else
    {
      syslog(4, "No connection made!\n");
    }
  }
  return __iapauthd_connection;
}

void __GetConnectionToAuthDaemon_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = MEMORY[0x23ECA9E00](a2);
  uint64_t v4 = MEMORY[0x263EF8720];
  if (v3 == MEMORY[0x263EF8720])
  {
    xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
    syslog(4, "Got unexpected error: %s");
  }
  else if (MEMORY[0x23ECA9E00](a2) == v4)
  {
    syslog(4, "%s:%s-%d xpc error\n", "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAPAuthentication/IAPSecurity.c", "_xpc_auth_handle_message", 107);
    if ((a2 == (void *)MEMORY[0x263EF86A8] || a2 == (void *)MEMORY[0x263EF86A0]) && __iapauthd_connection != 0)
    {
      xpc_connection_cancel((xpc_connection_t)__iapauthd_connection);
      xpc_release((xpc_object_t)__iapauthd_connection);
      __iapauthd_connection = 0;
    }
  }
  else if (a2)
  {
    syslog(4, "%s:%s-%d getting data from authd\n", "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAPAuthentication/IAPSecurity.c", "_xpc_auth_handle_message", 124);
    size_t length = 0;
    if (xpc_dictionary_get_data(a2, "certData", &length) && length) {
      syslog(4, "%s:%s-%d got data from authd, len=%d\n");
    }
    else {
      syslog(4, "len is 0!\n");
    }
  }
}

_DWORD *InitSigningContext(int a1)
{
  v2 = (char *)malloc_type_malloc(0x64uLL, 0x100004093FC706DuLL);
  uint64_t v3 = v2;
  if (v2)
  {
    CC_SHA1_Init((CC_SHA1_CTX *)(v2 + 4));
    *uint64_t v3 = a1;
  }
  return v3;
}

void EraseSigningContext(void *a1)
{
  if (a1) {
    free(a1);
  }
}

BOOL UpdateSigningContext(uint64_t a1, void *data, unint64_t len)
{
  if (a1)
  {
    CC_LONG v4 = len;
    if (HIDWORD(len)) {
      syslog(3, "%s:%s-%d losing integer precision on inLen 0x08%lx", "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAPAuthentication/IAPSecurity.c", "UpdateSigningContext", 190, len);
    }
    CC_SHA1_Update((CC_SHA1_CTX *)(a1 + 4), data, v4);
  }
  return a1 != 0;
}

uint64_t FinalizeSigningContext()
{
  return 0;
}

uint64_t IapAuthGetAppCert(unsigned int a1, UInt8 **a2, CFIndex *a3)
{
  if (a2 && a3)
  {
    CertForApplicationSync = (__SecCertificate *)GetCertForApplicationSync(a1);
    if (CertForApplicationSync)
    {
      v6 = CertForApplicationSync;
      CFDataRef v7 = SecCertificateCopyData(CertForApplicationSync);
      if (v7)
      {
        CFDataRef v8 = v7;
        size_t Length = CFDataGetLength(v7);
        CFIndex v10 = Length;
        v11 = *a2;
        if (*a2)
        {
          if (*a3 < Length)
          {
            syslog(3, "%s ERROR: Cert serial number output buffer size too small, outLen:%04lX < certSerLen:%04lX\n");
LABEL_16:
            uint64_t v12 = 0;
            goto LABEL_17;
          }
        }
        else
        {
          v11 = (UInt8 *)malloc_type_malloc(Length, 0x4B1B48BDuLL);
          *a2 = v11;
          if (!v11)
          {
            syslog(3, "%s Application auth cert output buffer malloc fail *ppOutBuf:NULL\n");
            goto LABEL_16;
          }
        }
        v14.location = 0;
        v14.size_t length = v10;
        CFDataGetBytes(v8, v14, v11);
        *a3 = v10;
        uint64_t v12 = 1;
LABEL_17:
        CFRelease(v6);
        CFRelease(v8);
        return v12;
      }
      syslog(3, "%s SecCertificateCopyData returned pCertData:NULL\n", "IapAuthGetAppCert");
      CFRelease(v6);
    }
    else
    {
      syslog(3, "%s GetCertForApplicationSync for appID:%02X returned pCertApp:NULL\n");
    }
  }
  else
  {
    syslog(3, "%s ERROR: Bad input parameter(s): ppOutbuf:%hhx, pOutLen:%hhx\n");
  }
  return 0;
}

uint64_t GetCertForApplicationSync(unsigned int a1)
{
  uint64_t ConnectionToAuthDaemon = GetConnectionToAuthDaemon();
  if (ConnectionToAuthDaemon)
  {
    uint64_t v3 = (_xpc_connection_s *)ConnectionToAuthDaemon;
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v4, "application", a1);
    xpc_dictionary_set_string(v4, "requestType", "cert");
    xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(v3, v4);
    if (!v5)
    {
      uint64_t v7 = 0;
LABEL_14:
      xpc_release(v4);
      return v7;
    }
    v6 = v5;
    if (xpc_dictionary_get_BOOL(v5, "isValid"))
    {
      size_t length = 0;
      xpc_dictionary_get_data(v6, "certData", &length);
      if (length)
      {
        syslog(4, "%s:%s-%d got data from authd, len=%d\n", "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAPAuthentication/IAPSecurity.c", "GetCertForApplicationSync", 245, length);
        uint64_t v7 = SecCertificateCreateWithBytes();
        if (v7) {
          syslog(4, "cert created!\n");
        }
        else {
          syslog(4, "cert FAILED!\n");
        }
        goto LABEL_13;
      }
      syslog(4, "%s:%s-%d len is 0!\n");
    }
    else
    {
      syslog(4, "cert FAILED!\n");
    }
    uint64_t v7 = 0;
LABEL_13:
    xpc_release(v6);
    goto LABEL_14;
  }
  return 0;
}

uint64_t IapAuthGetAppCertP7Sync(unsigned int a1, UInt8 **a2, CFIndex *a3)
{
  if (a2 && a3)
  {
    uint64_t CertForApplicationSync = GetCertForApplicationSync(a1);
    if (CertForApplicationSync)
    {
      v6 = (const void *)CertForApplicationSync;
      CFDataRef v7 = (const __CFData *)SecCMSCreateCertificatesOnlyMessageIAP();
      if (v7)
      {
        CFDataRef v8 = v7;
        size_t Length = CFDataGetLength(v7);
        CFIndex v10 = Length;
        v11 = *a2;
        if (*a2)
        {
          if (*a3 < Length)
          {
            syslog(3, "%s ERROR: Application P7 cert output buffer size too small, outLen:%04lX < certAppLen:%04lX\n");
LABEL_16:
            uint64_t v12 = 0;
            goto LABEL_17;
          }
        }
        else
        {
          v11 = (UInt8 *)malloc_type_malloc(Length, 0xDFF7986AuLL);
          *a2 = v11;
          if (!v11)
          {
            syslog(3, "%s Application auth P7 cert output buffer malloc fail *ppOutBuf:NULL\n");
            goto LABEL_16;
          }
        }
        v14.location = 0;
        v14.size_t length = v10;
        CFDataGetBytes(v8, v14, v11);
        *a3 = v10;
        uint64_t v12 = 1;
LABEL_17:
        CFRelease(v6);
        CFRelease(v8);
        return v12;
      }
      syslog(3, "%s SecCMSCreateCertificatesOnlyMessageIAP returned pCertData:NULL\n", "IapAuthGetAppCertP7Sync");
      CFRelease(v6);
    }
    else
    {
      syslog(3, "%s GetCertForApplicationSync for appID:%02X returned pCertApp:NULL\n");
    }
  }
  else
  {
    syslog(3, "%s ERROR: Bad input parameter(s): ppOutbuf:%hhx, pOutLen:%hhx\n");
  }
  return 0;
}

void IapAuthGetAppCertP7(unsigned int a1, NSObject *a2, uint64_t a3)
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 0x40000000;
  v8[2] = __IapAuthGetAppCertP7_block_invoke;
  v8[3] = &unk_264DB51A8;
  v8[4] = a3;
  v8[5] = a2;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2000000000;
  v10[3] = 0;
  uint64_t ConnectionToAuthDaemon = GetConnectionToAuthDaemon();
  if (ConnectionToAuthDaemon)
  {
    v6 = (_xpc_connection_s *)ConnectionToAuthDaemon;
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v7, "application", a1);
    xpc_dictionary_set_string(v7, "requestType", "cert");
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 0x40000000;
    handler[2] = ___GetCertForApplication_block_invoke;
    handler[3] = &unk_264DB5248;
    handler[4] = v8;
    handler[5] = v10;
    handler[6] = a2;
    handler[7] = v7;
    xpc_connection_send_message_with_reply(v6, v7, a2, handler);
  }
  _Block_object_dispose(v10, 8);
}

void __IapAuthGetAppCertP7_block_invoke(uint64_t a1, uint64_t a2)
{
  syslog(4, "%s:%s-%d got reply from authd\n", "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAPAuthentication/IAPSecurity.c", "IapAuthGetAppCertP7_block_invoke", 472);
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2000000000;
  uint64_t v11 = 0;
  if (a2)
  {
    xpc_object_t v4 = (const void *)SecCMSCreateCertificatesOnlyMessageIAP();
    v9[3] = (uint64_t)v4;
    CFRetain(v4);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __IapAuthGetAppCertP7_block_invoke_2;
  block[3] = &unk_264DB5180;
  xpc_object_t v5 = *(NSObject **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  block[5] = &v8;
  dispatch_async(v5, block);
  v6 = (const void *)v9[3];
  if (v6) {
    CFRelease(v6);
  }
  _Block_object_dispose(&v8, 8);
}

void __IapAuthGetAppCertP7_block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v2)
  {
    CFRelease(v2);
  }
}

uint64_t IapAuthChallengeRespondSync(const void *a1, size_t a2, void **a3, size_t *a4)
{
  uint64_t ConnectionToAuthDaemon = 0;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          uint64_t ConnectionToAuthDaemon = GetConnectionToAuthDaemon();
          if (ConnectionToAuthDaemon)
          {
            xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
            xpc_dictionary_set_string(v9, "requestType", "key");
            xpc_dictionary_set_data(v9, "inData", a1, a2);
            xpc_object_t v10 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)ConnectionToAuthDaemon, v9);
            if (!v10)
            {
              uint64_t ConnectionToAuthDaemon = 0;
LABEL_17:
              xpc_release(v9);
              return ConnectionToAuthDaemon;
            }
            uint64_t v11 = v10;
            size_t length = 0;
            if (xpc_dictionary_get_BOOL(v10, "isValid"))
            {
              syslog(6, "%s:%s-%d got valid key output from authd\n", "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAPAuthentication/IAPSecurity.c", "GetAuthChallengeResponseSync", 515);
              data = xpc_dictionary_get_data(v11, "outData", &length);
              v13 = *a3;
              if (*a3)
              {
                size_t v14 = length;
                if (*a4 >= length) {
                  goto LABEL_15;
                }
              }
              else
              {
                v13 = malloc_type_malloc(length, 0x7CD8F046uLL);
                *a3 = v13;
                size_t v14 = length;
                *a4 = length;
                if (v13)
                {
LABEL_15:
                  memcpy(v13, data, v14);
                  *a4 = length;
                  uint64_t ConnectionToAuthDaemon = 1;
                  goto LABEL_16;
                }
              }
            }
            else
            {
              syslog(4, "%s:%s-%d isValid from authd is false!\n", "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAPAuthentication/IAPSecurity.c", "GetAuthChallengeResponseSync", 533);
            }
            uint64_t ConnectionToAuthDaemon = 0;
LABEL_16:
            xpc_release(v11);
            goto LABEL_17;
          }
        }
      }
    }
  }
  return ConnectionToAuthDaemon;
}

void IapAuthChallengeRespond(const void *a1, size_t a2, NSObject *a3, uint64_t a4)
{
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 0x40000000;
  v10[2] = __IapAuthChallengeRespond_block_invoke;
  v10[3] = &unk_264DB51F8;
  void v10[4] = a4;
  v10[5] = a3;
  uint64_t ConnectionToAuthDaemon = GetConnectionToAuthDaemon();
  if (ConnectionToAuthDaemon)
  {
    uint64_t v8 = (_xpc_connection_s *)ConnectionToAuthDaemon;
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v9, "requestType", "key");
    xpc_dictionary_set_data(v9, "inData", a1, a2);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 0x40000000;
    handler[2] = ___GetAuthChallengeResponse_block_invoke;
    handler[3] = &unk_264DB5298;
    handler[4] = v10;
    handler[5] = a3;
    handler[6] = v9;
    xpc_connection_send_message_with_reply(v8, v9, a3, handler);
  }
}

void __IapAuthChallengeRespond_block_invoke(uint64_t a1, const void *a2)
{
  syslog(4, "%s:%s-%d got reply from authd\n", "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAPAuthentication/IAPSecurity.c", "IapAuthChallengeRespond_block_invoke", 627);
  if (a2) {
    CFRetain(a2);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __IapAuthChallengeRespond_block_invoke_2;
  block[3] = &unk_264DB51D0;
  xpc_object_t v4 = *(NSObject **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  block[5] = a2;
  dispatch_async(v4, block);
}

void __IapAuthChallengeRespond_block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    CFRelease(v2);
  }
}

uint64_t IapAuthRandomNumber(int *a1)
{
  unsigned int bytes = -1431655766;
  int v2 = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x263F17510], 4uLL, &bytes);
  if (a1) {
    *a1 = v2;
  }
  return bytes;
}

uint64_t IapAuthChallengeVerify(UInt8 *a1, CFIndex a2, const UInt8 *a3, CFIndex a4, const UInt8 *a5, CFIndex a6, int a7)
{
  SecTrustRef trust = 0;
  int v41 = -1431655766;
  CertRef = GetCertRef(a1, a2);
  if (!CertRef)
  {
    syslog(3, "%s ERROR: GetCertRef returned pCertRef:NULL\n", "IapAuthChallengeVerify");
    CFDataRef v19 = 0;
    CFDataRef v20 = 0;
    v17 = 0;
    v18 = 0;
    v16 = 0;
LABEL_14:
    uint64_t v21 = 0;
    goto LABEL_45;
  }
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  v16 = Mutable;
  if (!Mutable)
  {
    syslog(3, "%s ERROR: CFArrayCreateMutable returned pCertArray:NULL\n");
LABEL_13:
    CFDataRef v19 = 0;
    CFDataRef v20 = 0;
    v17 = 0;
    v18 = 0;
    goto LABEL_14;
  }
  CFArrayAppendValue(Mutable, CertRef);
  CFRelease(CertRef);
  CertRef = (const void *)SecPolicyCreateiAP();
  if (!CertRef)
  {
    syslog(3, "%s ERROR: SecPolicyCreateiAP returned piAPPolicy:NULL\n");
    goto LABEL_13;
  }
  SecTrustCreateWithCertificates(v16, CertRef, &trust);
  if (!trust)
  {
    syslog(3, "%s ERROR: SecTrustCreateWithCertificates returned piAPTrust:NULL\n");
    goto LABEL_41;
  }
  v17 = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  if (v17)
  {
    int v39 = a7;
    if (a7 == 2)
    {
      v18 = (void *)SecCertificateCreateWithBytes();
      if (!v18)
      {
        syslog(3, "%s ERROR: SecCertificateCreateWithBytes returned pCertSubCA1:NULL\n");
        goto LABEL_21;
      }
      CFArrayAppendValue(v17, v18);
      CFRelease(v18);
      v18 = (void *)SecCertificateCreateWithBytes();
      if (!v18)
      {
        syslog(3, "%s ERROR: SecCertificateCreateWithBytes returned pCertSubCA2:NULL\n");
LABEL_21:
        uint64_t v21 = 0;
        goto LABEL_43;
      }
    }
    else
    {
      if (a7 != 3) {
        goto LABEL_39;
      }
      v22 = GetCertRef(kiPodAccessoryTestAuth3CA, 667);
      if (v22)
      {
        v23 = v22;
        CFArrayAppendValue(v17, v22);
        CFRelease(v23);
      }
      else
      {
        syslog(3, "%s ERROR: GetCertRef returned rcert:NULL for kiPodAccessoryTestAuth3CA\n", "IapAuthChallengeVerify");
      }
      v24 = GetCertRef(kAuth3ECSSubCADev, 667);
      if (v24)
      {
        v25 = v24;
        CFArrayAppendValue(v17, v24);
        CFRelease(v25);
      }
      else
      {
        syslog(3, "%s ERROR: GetCertRef returned rcert:NULL for kAuth3ECSSubCADev\n", "IapAuthChallengeVerify");
      }
      v26 = GetCertRef(kAuth3ECSSubCAProd, 667);
      if (v26)
      {
        v27 = v26;
        CFArrayAppendValue(v17, v26);
        CFRelease(v27);
      }
      else
      {
        syslog(3, "%s ERROR: GetCertRef returned rcert:NULL for kAuth3ECSSubCAProd\n", "IapAuthChallengeVerify");
      }
      if (_findDeviceProperties_onceToken != -1) {
        dispatch_once(&_findDeviceProperties_onceToken, &__block_literal_global_73);
      }
      if (!(__isInternalBuild | __isDesenseBuild) || !__isInternalDeveloperDevice) {
        goto LABEL_39;
      }
      v28 = GetCertRef(kiPodAccessoryTestCAProto, 637);
      if (v28)
      {
        v29 = v28;
        CFArrayAppendValue(v17, v28);
        CFRelease(v29);
      }
      else
      {
        syslog(3, "%s ERROR: GetCertRef returned rcert:NULL for kiPodAccessoryTestCAProto\n", "IapAuthChallengeVerify");
      }
      v30 = (void *)GetCertRef(kAuth3ECSSubCASimu, 667);
      if (!v30)
      {
        syslog(3, "%s ERROR: GetCertRef returned rcert:NULL for kAuth3ECSSubCASimu\n", "IapAuthChallengeVerify");
        goto LABEL_39;
      }
      v18 = v30;
    }
    CFArrayAppendValue(v17, v18);
    CFRelease(v18);
LABEL_39:
    SecTrustSetAnchorCertificates(trust, v17);
    CFRelease(v17);
    if (!MEMORY[0x23ECA9C50](trust, &v41))
    {
      if (v41 != 1 && v41 != 4)
      {
        if (v41 != 5)
        {
          syslog(3, "%s ERROR: SecTrustEvaluate wrong result, expect:%02X or %02X, actual:%02X\n");
          goto LABEL_41;
        }
        syslog(3, "%s ERROR: SecTrustEvaluate wrong result, expect:%02X or %02X, actual:%02X, ignore\n", "IapAuthChallengeVerify", 4, 1, 5);
      }
      v18 = (void *)MEMORY[0x23ECA9C30](trust);
      if (v18)
      {
        v38 = CertRef;
        CFErrorRef error = 0;
        CFAllocatorRef v32 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        CFAllocatorRef v33 = (const __CFAllocator *)*MEMORY[0x263EFFB28];
        CFDataRef v20 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], a3, a4, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
        CFDataRef v34 = CFDataCreateWithBytesNoCopy(v32, a5, a6, v33);
        CFDataRef v19 = v34;
        if (!v20)
        {
          syslog(3, "%s ERROR: Unable to create CFDataRef for challenge", "IapAuthChallengeVerify");
          uint64_t v21 = 0;
          v17 = 0;
          CertRef = v38;
          goto LABEL_44;
        }
        CertRef = v38;
        if (v34)
        {
          if ((v39 & 0xFFFFFFFE) == 2)
          {
            v35 = (SecKeyAlgorithm *)MEMORY[0x263F17360];
            if (v39 != 2) {
              v35 = (SecKeyAlgorithm *)MEMORY[0x263F17300];
            }
            if (SecKeyVerifySignature((SecKeyRef)v18, *v35, v20, v34, &error))
            {
              v17 = 0;
              uint64_t v21 = 1;
              goto LABEL_44;
            }
            if (error && (CFStringRef v36 = CFCopyDescription(error)) != 0)
            {
              CFStringRef v37 = v36;
              CFStringGetCStringPtr(v36, 0x8000100u);
              syslog(3, "%s ERROR: SecKeyVerifySignature returned false for auth version %d\n", "IapAuthChallengeVerify", v39);
              CFRelease(v37);
            }
            else
            {
              syslog(3, "%s ERROR: SecKeyVerifySignature returned false for auth version %d\n");
            }
          }
          else
          {
            syslog(3, "%s ERROR: Unsupported authVersion %d");
          }
        }
        else
        {
          syslog(3, "%s ERROR: Unable to create CFDataRef for response");
        }
        uint64_t v21 = 0;
        v17 = 0;
        goto LABEL_44;
      }
      syslog(3, "%s ERROR: SecTrustCopyPublicKey returned pAccCertKey:NULL\n", "IapAuthChallengeVerify");
      uint64_t v21 = 0;
      goto LABEL_42;
    }
    syslog(3, "%s ERROR: SecTrustEvaluate returned status rcOS:%02X\n");
LABEL_41:
    uint64_t v21 = 0;
    v18 = 0;
LABEL_42:
    v17 = 0;
    goto LABEL_43;
  }
  syslog(3, "%s ERROR: CFArrayCreateMutable returned pCertAnchors:NULL\n", "IapAuthChallengeVerify");
  uint64_t v21 = 0;
  v18 = 0;
LABEL_43:
  CFDataRef v20 = 0;
  CFDataRef v19 = 0;
LABEL_44:
  CFRelease(CertRef);
  CertRef = 0;
LABEL_45:
  if (trust) {
    CFRelease(trust);
  }
  if (v18) {
    CFRelease(v18);
  }
  if (CertRef) {
    CFRelease(CertRef);
  }
  if (v17) {
    CFRelease(v17);
  }
  if (v16) {
    CFRelease(v16);
  }
  if (v20) {
    CFRelease(v20);
  }
  if (v19) {
    CFRelease(v19);
  }
  if ((v21 & 1) == 0) {
    PrintCertSerialNumber(a1, a2);
  }
  return v21;
}

const void *GetCertRef(UInt8 *bytes, CFIndex length)
{
  CFDataRef v2 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, length, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
  if (!v2) {
    return 0;
  }
  CFDataRef v3 = v2;
  CFArrayRef v4 = (const __CFArray *)SecCMSCertificatesOnlyMessageCopyCertificates();
  if (v4)
  {
    CFArrayRef v5 = v4;
    if (CFArrayGetCount(v4) < 1)
    {
      xpc_object_t v7 = 0;
    }
    else
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v5, 0);
      xpc_object_t v7 = ValueAtIndex;
      if (ValueAtIndex) {
        CFRetain(ValueAtIndex);
      }
    }
    CFRelease(v5);
  }
  else
  {
    xpc_object_t v7 = 0;
  }
  CFRelease(v3);
  return v7;
}

void PrintCertSerialNumber(UInt8 *a1, CFIndex a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v5[0] = v2;
  v5[1] = v2;
  unint64_t v4 = 32;
  CFDataRef v3 = (unsigned __int8 *)v5;
  if (IapAuthCertSerial(a1, a2, (uint64_t)&v3, &v4)) {
    PrintSerialNumberBytes(v3, v4);
  }
}

uint64_t IapAuthCertVerifyAuthVersion(UInt8 *a1, CFIndex a2, int a3)
{
  SecTrustRef trust = 0;
  int v21 = -1431655766;
  CertRef = GetCertRef(a1, a2);
  if (!CertRef)
  {
    syslog(3, "%s ERROR: GetCertRef returned pCertRef:NULL\n", "IapAuthCertVerifyAuthVersion");
    xpc_object_t v9 = 0;
    uint64_t v8 = 0;
LABEL_15:
    uint64_t v10 = 0;
    goto LABEL_44;
  }
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  uint64_t v8 = Mutable;
  if (!Mutable)
  {
    syslog(3, "%s ERROR: CFArrayCreateMutable returned pCertArray:NULL\n");
LABEL_14:
    xpc_object_t v9 = 0;
    goto LABEL_15;
  }
  CFArrayAppendValue(Mutable, CertRef);
  CFRelease(CertRef);
  CertRef = (const void *)SecPolicyCreateiAP();
  if (!CertRef)
  {
    syslog(3, "%s ERROR: SecPolicyCreateiAP returned piAPPolicy:NULL\n");
    goto LABEL_14;
  }
  SecTrustCreateWithCertificates(v8, CertRef, &trust);
  if (!trust)
  {
    syslog(3, "%s ERROR: SecTrustCreateWithCertificates returned piAPTrust:NULL\n");
    goto LABEL_41;
  }
  xpc_object_t v9 = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  if (!v9)
  {
    syslog(3, "%s ERROR: CFArrayCreateMutable returned pCertAnchors:NULL\n", "IapAuthCertVerifyAuthVersion");
    uint64_t v10 = 0;
    goto LABEL_43;
  }
  if (a3 == 3)
  {
    uint64_t v11 = GetCertRef(kiPodAccessoryTestAuth3CA, 667);
    if (v11)
    {
      uint64_t v12 = v11;
      CFArrayAppendValue(v9, v11);
      CFRelease(v12);
    }
    else
    {
      syslog(3, "%s ERROR: GetCertRef returned rcert:NULL for kiPodAccessoryTestAuth3CA\n", "IapAuthCertVerifyAuthVersion");
    }
    v13 = GetCertRef(kAuth3ECSSubCADev, 667);
    if (v13)
    {
      size_t v14 = v13;
      CFArrayAppendValue(v9, v13);
      CFRelease(v14);
    }
    else
    {
      syslog(3, "%s ERROR: GetCertRef returned rcert:NULL for kAuth3ECSSubCADev\n", "IapAuthCertVerifyAuthVersion");
    }
    v15 = GetCertRef(kAuth3ECSSubCAProd, 667);
    if (v15)
    {
      v16 = v15;
      CFArrayAppendValue(v9, v15);
      CFRelease(v16);
    }
    else
    {
      syslog(3, "%s ERROR: GetCertRef returned rcert:NULL for kAuth3ECSSubCAProd\n", "IapAuthCertVerifyAuthVersion");
    }
    if (_findDeviceProperties_onceToken != -1) {
      dispatch_once(&_findDeviceProperties_onceToken, &__block_literal_global_73);
    }
    if (__isInternalBuild | __isDesenseBuild && __isInternalDeveloperDevice)
    {
      v17 = GetCertRef(kiPodAccessoryTestCAProto, 637);
      if (v17)
      {
        v18 = v17;
        CFArrayAppendValue(v9, v17);
        CFRelease(v18);
      }
      else
      {
        syslog(3, "%s ERROR: GetCertRef returned rcert:NULL for kiPodAccessoryTestCAProto\n", "IapAuthCertVerifyAuthVersion");
      }
      CFDataRef v19 = GetCertRef(kAuth3ECSSubCASimu, 667);
      if (v19)
      {
        uint64_t v10 = (uint64_t)v19;
LABEL_37:
        CFArrayAppendValue(v9, (const void *)v10);
        CFRelease((CFTypeRef)v10);
        goto LABEL_39;
      }
      syslog(3, "%s ERROR: GetCertRef returned rcert:NULL for kAuth3ECSSubCASimu\n", "IapAuthCertVerifyAuthVersion");
    }
LABEL_39:
    SecTrustSetAnchorCertificates(trust, v9);
    CFRelease(v9);
    if (MEMORY[0x23ECA9C50](trust, &v21))
    {
      syslog(3, "%s ERROR: SecTrustEvaluate returned status rcOS:%02X\n");
    }
    else
    {
      xpc_object_t v9 = 0;
      uint64_t v10 = 1;
      if (v21 == 1 || v21 == 4) {
        goto LABEL_43;
      }
      if (v21 == 5)
      {
        uint64_t v10 = 1;
        syslog(3, "%s ERROR: SecTrustEvaluate wrong result, expect:%02X or %02X, actual:%02X, ignore\n", "IapAuthCertVerifyAuthVersion", 4, 1, 5);
        goto LABEL_42;
      }
      syslog(3, "%s ERROR: SecTrustEvaluate wrong result, expect:%02X or %02X, actual:%02X\n");
    }
LABEL_41:
    uint64_t v10 = 0;
LABEL_42:
    xpc_object_t v9 = 0;
    goto LABEL_43;
  }
  if (a3 != 2) {
    goto LABEL_39;
  }
  uint64_t v10 = SecCertificateCreateWithBytes();
  if (!v10)
  {
    syslog(3, "%s ERROR: SecCertificateCreateWithBytes returned pCertSubCA1:NULL\n");
    goto LABEL_43;
  }
  CFArrayAppendValue(v9, (const void *)v10);
  CFRelease((CFTypeRef)v10);
  uint64_t v10 = SecCertificateCreateWithBytes();
  if (v10) {
    goto LABEL_37;
  }
  syslog(3, "%s ERROR: SecCertificateCreateWithBytes returned pCertSubCA2:NULL\n");
LABEL_43:
  CFRelease(CertRef);
  CertRef = 0;
LABEL_44:
  if (trust) {
    CFRelease(trust);
  }
  if (CertRef) {
    CFRelease(CertRef);
  }
  if (v8) {
    CFRelease(v8);
  }
  if (v9) {
    CFRelease(v9);
  }
  if ((v10 & 1) == 0) {
    PrintCertSerialNumber(a1, a2);
  }
  return v10;
}

uint64_t IapAuthCertSerial(UInt8 *a1, CFIndex a2, uint64_t a3, unint64_t *a4)
{
  if (!a1 || !a2 || !a3 || !a4)
  {
    syslog(3, "%s ERROR: Invalid parameter(s) pCert:%hhx, certLen:%04lX, ppOutBuf:%hhx, pOutLen:%hhx\n");
    return 0;
  }
  CertRef = (__SecCertificate *)GetCertRef(a1, a2);
  if (!CertRef)
  {
    syslog(3, "%s ERROR: GetCertRef returned pCertRef:NULL\n");
    return 0;
  }
  xpc_object_t v7 = CertRef;
  CFDataRef v8 = SecCertificateCopySerialNumber(CertRef);
  if (!v8)
  {
    syslog(3, "%s ERROR: SecCertificateCopySerialNumber returned certificate pSerialNum:NULL\n", "IapAuthCertSerial");
    CFRelease(v7);
    return 0;
  }
  CFDataRef v9 = v8;
  unint64_t Length = CFDataGetLength(v8);
  unint64_t v11 = Length;
  if (*a4 < Length)
  {
    syslog(3, "%s ERROR: Cert serial number output buffer size too small, outLen:%04lX < certSerLen:%04lX\n", "IapAuthCertSerial", *a4, Length);
LABEL_9:
    BytePtr = (unsigned __int8 *)CFDataGetBytePtr(v9);
    PrintSerialNumberBytes(BytePtr, v11);
    goto LABEL_10;
  }
  v15 = *(void **)a3;
  if (*(void *)a3)
  {
    v16 = CFDataGetBytePtr(v9);
    memcpy(v15, v16, v11);
    *a4 = v11;
    if (_findDeviceProperties_onceToken != -1) {
      dispatch_once(&_findDeviceProperties_onceToken, &__block_literal_global_73);
    }
    if (__isInternalDeveloperDevice) {
      BOOL v17 = __isInternalBuild == 0;
    }
    else {
      BOOL v17 = 1;
    }
    if (!v17 || __isDeveloperBuild)
    {
      int v18 = SecCertificateGetiAuthVersion();
      uint64_t v13 = 1;
      if (v11 == 15 && v18 == 2) {
        *(unsigned char *)(*(void *)a3 + 7) &= ~0x80u;
      }
    }
    else
    {
      uint64_t v13 = 1;
    }
    goto LABEL_11;
  }
  syslog(3, "%s ERROR: *outBuf pointer is NULL\n", "IapAuthCertSerial");
  if (v11) {
    goto LABEL_9;
  }
LABEL_10:
  uint64_t v13 = 0;
LABEL_11:
  CFRelease(v7);
  CFRelease(v9);
  return v13;
}

void PrintSerialNumberBytes(unsigned __int8 *a1, unint64_t a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  memset(v20, 0, sizeof(v20));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  *(_OWORD *)uint64_t v6 = 0u;
  if (a2 > 0x7D) {
    PrintSerialNumberBytes_cold_1();
  }
  unint64_t v2 = a2;
  if (a2)
  {
    unint64_t v4 = v6;
    while (1)
    {
      int v5 = sprintf(v4, "%02X", *a1);
      if (v5 < 1) {
        break;
      }
      ++a1;
      v4 += v5;
      if (!--v2) {
        goto LABEL_8;
      }
    }
    syslog(3, "%s ERROR: sprintf status:%02X\n", "PrintSerialNumberBytes", v5);
  }
LABEL_8:
  syslog(3, "Certificate serial number: [%s]\n", v6);
}

BOOL IapAuthVerifyCertSerialNumber(UInt8 *a1, CFIndex a2, int a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v8[0] = v3;
  v8[1] = v3;
  long long v7 = (unsigned __int8 *)v8;
  unint64_t v6 = 32;
  if (a3 == 2) {
    uint64_t v4 = 15;
  }
  else {
    uint64_t v4 = 16;
  }
  if (IapAuthCertSerial(a1, a2, (uint64_t)&v7, &v6))
  {
    if (v6 == v4) {
      return MFiVerifyCertificateSerialNumber(v7, v4) == 0;
    }
    syslog(3, "%s AuthVer:%1X serial number wrong length, expect:%02lX, actual:%02lX\n");
  }
  else
  {
    syslog(3, "%s AuthVer:%1X IapAuthCertSerial call fail bSerNumValid:%d\n");
  }
  return 0;
}

uint64_t MFiVerifyCertificateSerialNumber(unsigned __int8 *a1, uint64_t a2)
{
  if (!a1)
  {
    syslog(3, "%s:%d ERROR NULL serial number pointer\n");
    return 4294967246;
  }
  if (a2 != 16)
  {
    if (a2 == 15)
    {
      uint64_t v3 = *a1;
      uint64_t v4 = a1[1];
      uint64_t v5 = a1[3];
      uint64_t v6 = a1[4];
      uint64_t v7 = a1[5];
      uint64_t v8 = a1[7];
      uint64_t v9 = a1[9];
      uint64_t v10 = a1[10];
      int v39 = a1[13];
      int v40 = a1[12];
      int v38 = a1[14];
      int NumRevokedAuthICBatches = getNumRevokedAuthICBatches();
      RevokedAuthICBatches = getRevokedAuthICBatches();
      int v13 = NumRevokedAuthICBatches - 1;
      if (NumRevokedAuthICBatches < 1) {
        return 0;
      }
      int v14 = 0;
      unint64_t v15 = ((v3 << 56) | (v4 << 48) | (v5 << 40) | (v6 << 32) | (v7 << 24) | (v8 << 16) | (v9 << 8)) + v10;
      while (1)
      {
        int v16 = v13 + v14;
        if (v13 + v14 >= 0) {
          int v17 = v13 + v14;
        }
        else {
          int v17 = v16 + 1;
        }
        int v18 = v17 >> 1;
        uint64_t v19 = (uint64_t)v17 >> 1;
        unint64_t v20 = RevokedAuthICBatches[3 * v18];
        if (v20 <= v15)
        {
          if (v20 >= v15)
          {
            if ((v16 + 3) >= 2)
            {
              int v31 = 0;
              unsigned int v32 = (v40 << 16) | (v39 << 8) | v38;
              CFAllocatorRef v33 = (char *)&RevokedAuthICBatches[3 * (int)v19];
              uint64_t v34 = *((void *)v33 + 2);
              int v35 = *((_DWORD *)v33 + 2);
              while (v31 < v35)
              {
                int v36 = (v35 - 1 + v31) / 2;
                unsigned int v37 = (*(unsigned __int8 *)(v34 + 3 * v36) << 16) | (*(unsigned __int8 *)(v34 + 3 * v36 + 1) << 8) | *(unsigned __int8 *)(v34 + 3 * v36 + 2);
                if (v37 > v32)
                {
                  int v35 = (v35 - 1 + v31) / 2;
                }
                else
                {
                  int v31 = v36 + 1;
                  if (v37 >= v32)
                  {
                    uint64_t v21 = 4294899610;
                    syslog(3, "%s:%d ERROR: Auth:%02X Revoked certificate match found !\n", "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAPAuthentication/IAPSecurity.c", 1403, 2);
                    v29 = a1;
                    unint64_t v30 = 15;
                    goto LABEL_27;
                  }
                }
              }
            }
            return 0;
          }
          int v14 = v19 + 1;
        }
        else
        {
          int v13 = v19 - 1;
        }
        if (v14 > v13) {
          return 0;
        }
      }
    }
    syslog(3, "%s:%d ERROR Unsupported serial number length: %02X\n");
    return 4294967246;
  }
  if ((char)*a1 < 0)
  {
    syslog(3, "%s:%d ERROR Invalid WaferID MSB byte:%02X\n");
    return 4294967246;
  }
  unint64_t v22 = ((unint64_t)*a1 << 40) | ((unint64_t)a1[1] << 32) | ((unint64_t)a1[2] << 24) | ((unint64_t)a1[3] << 16) | ((unint64_t)a1[4] << 8) | a1[5];
  int NumRevokedAuth3Wafers = getNumRevokedAuth3Wafers();
  RevokedAuth3Wafers = getRevokedAuth3Wafers();
  int v25 = 0;
  do
  {
    while (1)
    {
      if (v25 >= NumRevokedAuth3Wafers) {
        return 0;
      }
      int v26 = (NumRevokedAuth3Wafers - 1 + v25) / 2;
      unint64_t v27 = RevokedAuth3Wafers[v26];
      if (v27 <= v22) {
        break;
      }
      int NumRevokedAuth3Wafers = (NumRevokedAuth3Wafers - 1 + v25) / 2;
    }
    int v25 = v26 + 1;
  }
  while (v27 < v22);
  uint64_t v21 = 4294899610;
  syslog(3, "%s:%d ERROR: Revoked wafer match found !\n", "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAPAuthentication/IAPSecurity.c", 1429);
  v29 = a1;
  unint64_t v30 = 16;
LABEL_27:
  PrintSerialNumberBytes(v29, v30);
  return v21;
}

uint64_t IapAuthGetCertClassAuthV2(UInt8 *a1, CFIndex a2)
{
  _OWORD v5[2] = *MEMORY[0x263EF8340];
  v5[0] = 0xAAAAAAAAAAAAAAAALL;
  v5[1] = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v4 = 16;
  uint64_t v3 = (unsigned __int8 *)v5;
  if (!IapAuthCertSerial(a1, a2, (uint64_t)&v3, &v4) || v4 != 15)
  {
    if (v4 != 15)
    {
      syslog(3, "%s:%d ERROR (if auth v2, not v3): Certificate serial number size invalid, expect:%02lX, actual:%02lX\n");
      goto LABEL_9;
    }
    if (v3[7] < 0x11u) {
      return 0x7FFFFFFFLL;
    }
LABEL_7:
    syslog(3, "%s:%d ERROR (if auth v2, not v3): Certificate serial number class invalid, actual:%02X > maximum:%02X\n");
LABEL_9:
    PrintSerialNumberBytes(v3, v4);
    return 0x7FFFFFFFLL;
  }
  uint64_t result = v3[7];
  if (result > 0x10) {
    goto LABEL_7;
  }
  return result;
}

void ___findDeviceProperties_block_invoke()
{
  __isInternalBuild = 0;
  __isDesenseBuild = 0;
  __isDeveloperBuild = 0;
  __isInternalDeveloperDevice = 0;
  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    __isInternalBuild = CFEqual(v0, @"Internal") != 0;
    __isDesenseBuild = CFEqual(v1, @"Desense") != 0;
    __isDeveloperBuild = CFEqual(v1, @"Beta") != 0;
    CFRelease(v1);
  }
  else
  {
    __isInternalBuild = 0;
    __isDesenseBuild = 0;
    __isDeveloperBuild = 0;
  }
  CFBooleanRef v2 = (const __CFBoolean *)MGCopyAnswer();
  __isInternalDeveloperDevice = CFBooleanGetValue(v2) == 0;

  CFRelease(v2);
}

uint64_t getNumRevokedAuth3Wafers()
{
  return 26;
}

void *getRevokedAuth3Wafers()
{
  return &wafers;
}

uint64_t getNumRevokedAuthICBatches()
{
  return 65;
}

void *getRevokedAuthICBatches()
{
  return &prefix;
}

BOOL VerifyCertSerialNumber(const void *a1)
{
  CFRetain(a1);
  BytePtr = (UInt8 *)CFDataGetBytePtr((CFDataRef)a1);
  CFIndex Length = CFDataGetLength((CFDataRef)a1);
  SecCertRef = GetSecCertRef(BytePtr, Length);
  if (SecCertRef)
  {
    uint64_t v5 = SecCertRef;
    unsigned __int16 v6 = SecCertificateGetiAuthVersion();
    CFRelease(v5);
  }
  else
  {
    unsigned __int16 v6 = 0;
  }
  BOOL v7 = IapAuthVerifyCertSerialNumber(BytePtr, Length, v6);
  CFRelease(a1);
  return v7;
}

const void *GetSecCertRef(UInt8 *bytes, CFIndex length)
{
  CFDataRef v2 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, length, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
  if (!v2) {
    return 0;
  }
  CFDataRef v3 = v2;
  CFArrayRef v4 = (const __CFArray *)SecCMSCertificatesOnlyMessageCopyCertificates();
  if (v4)
  {
    CFArrayRef v5 = v4;
    if (CFArrayGetCount(v4) < 1)
    {
      BOOL v7 = 0;
    }
    else
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v5, 0);
      BOOL v7 = ValueAtIndex;
      if (ValueAtIndex) {
        CFRetain(ValueAtIndex);
      }
    }
    CFRelease(v5);
  }
  else
  {
    BOOL v7 = 0;
  }
  CFRelease(v3);
  return v7;
}

uint64_t VerifyCertAuthority(const void *a1)
{
  CFRetain(a1);
  BytePtr = (UInt8 *)CFDataGetBytePtr((CFDataRef)a1);
  CFIndex Length = CFDataGetLength((CFDataRef)a1);
  SecCertRef = GetSecCertRef(BytePtr, Length);
  if (SecCertRef)
  {
    CFArrayRef v5 = SecCertRef;
    int v6 = SecCertificateGetiAuthVersion();
    CFRelease(v5);
  }
  else
  {
    int v6 = 0;
  }
  uint64_t v7 = IapAuthCertVerifyAuthVersion(BytePtr, Length, v6);
  CFRelease(a1);
  return v7;
}

CFDataRef VerifyCertAuthorityDictionary(const void *a1)
{
  CFRetain(a1);
  CFDataRef Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a1, @"kAuthCertBufferKey");
  if (Value)
  {
    CFNumberRef v3 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a1, @"kAuthVersionKey");
    int v4 = 2;
    if (v3)
    {
      char valuePtr = 2;
      int v5 = CFNumberGetValue(v3, kCFNumberCharType, &valuePtr);
      unsigned __int8 v6 = valuePtr;
      if (!v5) {
        unsigned __int8 v6 = 2;
      }
      int v4 = v6;
    }
    BytePtr = (UInt8 *)CFDataGetBytePtr(Value);
    CFIndex Length = CFDataGetLength(Value);
    if (IapAuthCertVerifyAuthVersion(BytePtr, Length, v4)) {
      CFDataRef Value = (const __CFData *)VerifyCertSerialNumber(Value);
    }
    else {
      CFDataRef Value = 0;
    }
  }
  CFRelease(a1);
  return Value;
}

uint64_t VerifyNonceSigned(const void *a1)
{
  CFRetain(a1);
  CFDataRef Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a1, @"kAuthCertBufferKey");
  if (Value
    && (CFDataRef v3 = Value,
        (CFDataRef v4 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a1, @"kAuthNonceBufferKey")) != 0))
  {
    CFDataRef v5 = v4;
    CFNumberRef v6 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a1, @"kAuthVersionKey");
    int v7 = 2;
    if (v6)
    {
      char valuePtr = 2;
      int v8 = CFNumberGetValue(v6, kCFNumberCharType, &valuePtr);
      unsigned __int8 v9 = valuePtr;
      if (!v8) {
        unsigned __int8 v9 = 2;
      }
      int v7 = v9;
    }
    CFDataRef v10 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a1, @"kAuthResponseBufferKey");
    BytePtr = (UInt8 *)CFDataGetBytePtr(v3);
    CFIndex Length = CFDataGetLength(v3);
    int v13 = CFDataGetBytePtr(v5);
    CFIndex v14 = CFDataGetLength(v5);
    unint64_t v15 = CFDataGetBytePtr(v10);
    CFIndex v16 = CFDataGetLength(v10);
    uint64_t v17 = IapAuthChallengeVerify(BytePtr, Length, v13, v14, v15, v16, v7);
  }
  else
  {
    uint64_t v17 = 0;
  }
  CFRelease(a1);
  return v17;
}

uint64_t GetCertClass(const void *a1)
{
  CFRetain(a1);
  BytePtr = (UInt8 *)CFDataGetBytePtr((CFDataRef)a1);
  CFIndex Length = CFDataGetLength((CFDataRef)a1);
  uint64_t CertClassAuthV2 = IapAuthGetCertClassAuthV2(BytePtr, Length);
  CFRelease(a1);
  return CertClassAuthV2;
}

void GetRandomDigest(size_t a1, CFDataRef *a2)
{
  CFDataRef v4 = malloc_type_malloc(a1, 0x5B49ACD2uLL);
  arc4random_buf(v4, a1);
  *a2 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)v4, a1);

  free(v4);
}

unint64_t *AllocCapsFromAuthCert(const __CFData *a1, int a2, uint64_t *a3)
{
  CFNumberRef v6 = (unint64_t *)malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
  int v7 = v6;
  if (v6)
  {
    *(_OWORD *)CFNumberRef v6 = 0u;
    *((_OWORD *)v6 + 1) = 0u;
    if (a1)
    {
      CFIndex Length = CFDataGetLength(a1);
      BytePtr = (UInt8 *)CFDataGetBytePtr(a1);
      SecCertRef = GetSecCertRef(BytePtr, Length);
      if (SecCertRef)
      {
        long long v11 = SecCertRef;
        if (!a2) {
          a2 = SecCertificateGetiAuthVersion();
        }
        if (a2 == 3)
        {
          CFDataRef v13 = (const __CFData *)SecCertificateCopyiAPAuthCapabilities();
          if (v13)
          {
            CFDataRef v14 = v13;
            unint64_t v15 = (unint64_t *)CFDataGetBytePtr(v13);
            if (CFDataGetLength(v14) == 32)
            {
              unint64_t v16 = bswap64(*v15);
              unint64_t v17 = bswap64(v15[1]);
              unint64_t v18 = bswap64(v15[2]);
              unint64_t v19 = bswap64(v15[3]);
              unint64_t v20 = v19 & 0xFFFFFFFFFFFFFFFELL;
              if ((v19 & 4) != 0) {
                unint64_t v20 = v19 & 0xFFFFFFFFFFFFF0FELL | 0xF00;
              }
              if ((v19 & 2) != 0) {
                unint64_t v21 = v19 & 0xFFFFFFFFFFFFF0FELL | 0xF00;
              }
              else {
                unint64_t v21 = v20;
              }
              CFRelease(v14);
              *int v7 = v21;
              v7[1] = v18;
              v7[2] = v17;
              v7[3] = v16;
              syslog(4, "%s AuthV3 orig authCertCaps0:%08llX -> final authCertCaps0:%08llX\n");
LABEL_21:
              CFRelease(v11);
              uint64_t v22 = 32;
              if (!a3) {
                return v7;
              }
              goto LABEL_28;
            }
            CFRelease(v14);
          }
          else
          {
            syslog(3, "%s No AuthV3 Caps found in cert !\n");
          }
        }
        else if (a2 == 2)
        {
          unsigned int CertClass = GetCertClass(a1);
          if (CertClass < 0xD)
          {
            *int v7 = GetAccessoryCaps_kCertAccessoryCaps[CertClass];
            v7[2] = 0;
            v7[3] = 0;
            v7[1] = 0;
            syslog(4, "%s AuthV2 authCertClass:%02X -> authCertCaps0:%08llX\n");
            goto LABEL_21;
          }
        }
        else
        {
          syslog(3, "%s Unrecognized/unsupported authVerMajor:%02X (pSecCertRef:%04X)\n");
        }
        CFRelease(v11);
      }
      else
      {
        syslog(3, "%s NULL cert reference\n");
      }
    }
    else
    {
      syslog(3, "%s NULL cert data\n");
    }
    syslog(3, "%s GetAccessoryCaps failed bStatus:%d\n", "AllocCapsFromAuthCert", 0);
    free(v7);
    int v7 = 0;
  }
  else
  {
    syslog(3, "%s Object allocation failed pAccCaps:%hhx\n", "AllocCapsFromAuthCert", 0);
  }
  uint64_t v22 = 0;
  if (a3) {
LABEL_28:
  }
    *a3 = v22;
  return v7;
}

unsigned __int8 *IsAppleHWModule(unsigned __int8 *result)
{
  if (result) {
    return (unsigned __int8 *)((*result >> 3) & 1);
  }
  return result;
}

unsigned __int8 *IsAppleMFiAccessory(unsigned __int8 *result)
{
  if (result) {
    return (unsigned __int8 *)((*result >> 4) & 1);
  }
  return result;
}

uint64_t CanChargeHighVoltage(uint64_t result)
{
  if (result) {
    return *(unsigned char *)(result + 1) & 1;
  }
  return result;
}

uint64_t CanChargeInductive(uint64_t result)
{
  if (result) {
    return (*(unsigned __int8 *)(result + 1) >> 1) & 1;
  }
  return result;
}

uint64_t CanUseAccPwrUHPM(uint64_t result)
{
  if (result) {
    return (*(unsigned __int8 *)(result + 1) >> 2) & 1;
  }
  return result;
}

uint64_t CanUseAccPwrLoV(uint64_t result)
{
  if (result) {
    return (*(unsigned __int8 *)(result + 1) >> 3) & 1;
  }
  return result;
}

unsigned char *IsAppleAccessory(unsigned char *result)
{
  if (result) {
    return (unsigned char *)((*result & 0x18) == 0);
  }
  return result;
}

void PrintSerialNumberBytes_cold_1()
{
  _os_assert_log();
  v0 = (CC_SHA1_CTX *)_os_crash();
  __break(1u);
  CC_SHA1_Init(v0);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x270ED7B00](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B08](c, data, *(void *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x270EE4788](cf);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x270EE47F0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t SecCMSCertificatesOnlyMessageCopyCertificates()
{
  return MEMORY[0x270EFD6C0]();
}

uint64_t SecCMSCreateCertificatesOnlyMessageIAP()
{
  return MEMORY[0x270EFD6C8]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x270EFD710](certificate);
}

CFDataRef SecCertificateCopySerialNumber(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x270EFD7A0](certificate);
}

uint64_t SecCertificateCopyiAPAuthCapabilities()
{
  return MEMORY[0x270EFD7C8]();
}

uint64_t SecCertificateCreateWithBytes()
{
  return MEMORY[0x270EFD7D8]();
}

uint64_t SecCertificateGetiAuthVersion()
{
  return MEMORY[0x270EFD830]();
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x270EFDAC8](key, algorithm, signedData, signature, error);
}

uint64_t SecPolicyCreateiAP()
{
  return MEMORY[0x270EFDBC8]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x270EFDC20](rnd, count, bytes);
}

SecKeyRef SecTrustCopyPublicKey(SecTrustRef trust)
{
  return (SecKeyRef)MEMORY[0x270EFDD30](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x270EFDD40](certificates, policies, trust);
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x270EFDD50](trust, result);
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return MEMORY[0x270EFDDA8](trust, anchorCertificates);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _os_assert_log()
{
  return MEMORY[0x270ED8050]();
}

uint64_t _os_crash()
{
  return MEMORY[0x270ED8060]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB530](a1, a2);
}

void syslog(int a1, const char *a2, ...)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x270EDBED0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x270EDC060](xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}