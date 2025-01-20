@interface MFAACertificateManager
+ (BOOL)isBAAUserCertInfo:(id)a3;
+ (BOOL)isBAAUserPolicy:(unint64_t)a3;
+ (BOOL)isComponentCertInfo:(id)a3;
+ (BOOL)isComponentPolicy:(unint64_t)a3;
+ (BOOL)isMFi2_3CertInfo:(id)a3;
+ (BOOL)isMFi2_3Policy:(unint64_t)a3;
+ (id)_anchorCertificatesDataForTypes:(int)a3;
+ (id)anchorCertificatesForTypes:(int)a3;
+ (id)sharedManager;
+ (int)_anchorType2CertType:(int)a3;
- (BOOL)verifyCertificateChainInfoSerialNumber:(id)a3;
- (BOOL)verifyCertificateSerialNumber:(id)a3 authVer:(int)a4;
- (BOOL)verifyCertificateSerialNumberBySerialNumber:(id)a3 authVer:(int)a4;
- (BOOL)verifyNonceSignature:(id)a3 nonce:(id)a4 signature:(id)a5;
- (MFAACertificateManager)init;
- (NSUserDefaults)userDefaults;
- (NSXPCConnection)xpcConnection;
- (id)_getAnchorCertsForPolicy:(unint64_t)a3;
- (id)_init;
- (id)copyCertificateSerialNumber:(id)a3 authVer:(int)a4;
- (id)copyEvaluatedCertificateChainInfo:(id)a3;
- (id)copyEvaluatedCertificateChainInfo:(id)a3 forSpecificType:(int)a4;
- (id)copyLeafCertificateSerialNumber:(id)a3;
- (id)copyParsedCertificateChainInfo:(id)a3;
- (id)copyParsedCertificateChainInfo:(id)a3 assumeType:(int)a4;
- (id)copyParsedCertificateChainInfoFromCerts:(id)a3 assumeType:(int)a4;
- (id)createVeridianNonce:(id)a3 withChallenge:(id)a4;
- (int)_getCachedCertStatus:(id)a3 issuerSeq:(id)a4 ppid:(id)a5;
- (int)_validateBAACertificateChain:(id)a3 error:(id *)a4;
- (int)_validateCertificateChain:(id)a3 realtime:(BOOL)a4 error:(id *)a5;
- (int)_validateCertificateWithServer:(id)a3 issuerSeq:(id)a4 ppid:(id)a5 error:(id *)a6;
- (int)_validateX509CertificateChain:(id)a3 anchorCerts:(id)a4 error:(id *)a5;
- (int)authVersionFromCertificateChainInfo:(id)a3;
- (int)validateCertificate:(id)a3 realtime:(BOOL)a4 error:(id *)a5;
- (int)validateCertificateChain:(id)a3 realtime:(BOOL)a4 error:(id *)a5;
- (int)validateCertificateChain:(id)a3 type:(int)a4 realtime:(BOOL)a5 error:(id *)a6;
- (void)requestMetadataForCertificate:(id)a3 requestedLocale:(id)a4 requestInfo:(id)a5 completionHandler:(id)a6;
- (void)setUserDefaults:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)validateCertificate:(id)a3 realtime:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation MFAACertificateManager

- (MFAACertificateManager)init
{
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF498];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = NSStringFromSelector(sel_sharedManager);
  v9 = NSStringFromSelector(a2);
  [v4 raise:v5, @"Use +[%@ %@] instead of -%@.", v7, v8, v9 format];

  return 0;
}

- (id)_init
{
  init_logging();
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 2;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    uint64_t v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v5 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(MFAATokenManager *)(uint64_t)self _init];
  }

  v13.receiver = self;
  v13.super_class = (Class)MFAACertificateManager;
  v6 = [(MFAACertificateManager *)&v13 init];
  if (v6)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.MFAAuthentication.MFAANetwork"];
    xpcConnection = v6->_xpcConnection;
    v6->_xpcConnection = (NSXPCConnection *)v7;

    v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CE94008];
    [(NSXPCConnection *)v6->_xpcConnection setRemoteObjectInterface:v9];

    [(NSXPCConnection *)v6->_xpcConnection resume];
    uint64_t v10 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.MFAAuthentication"];
    userDefaults = v6->_userDefaults;
    v6->_userDefaults = (NSUserDefaults *)v10;
  }
  return v6;
}

- (void)validateCertificate:(id)a3 realtime:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects < 2;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    v12 = MEMORY[0x263EF8438];
    id v11 = MEMORY[0x263EF8438];
  }
  else
  {
    v12 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v13 = "YES";
    if (!v9) {
      objc_super v13 = "NO";
    }
    *(_DWORD *)buf = 136315138;
    v23 = v13;
    _os_log_impl(&dword_21DC52000, v12, OS_LOG_TYPE_DEFAULT, "Validating certificate... (completionHandler: %s)", buf, 0xCu);
  }

  if (v9)
  {
    if (v6)
    {
      v14 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __73__MFAACertificateManager_validateCertificate_realtime_completionHandler___block_invoke;
      block[3] = &unk_2644794E0;
      block[4] = self;
      id v19 = v8;
      BOOL v21 = v6;
      id v20 = v9;
      dispatch_async(v14, block);
    }
    else
    {
      id v17 = 0;
      uint64_t v15 = [(MFAACertificateManager *)self validateCertificate:v8 realtime:0 error:&v17];
      id v16 = v17;
      (*((void (**)(id, uint64_t, id))v9 + 2))(v9, v15, v16);
    }
  }
}

void __73__MFAACertificateManager_validateCertificate_realtime_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
  id v6 = 0;
  [v2 validateCertificate:v3 realtime:v4 error:&v6];
  id v5 = v6;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (int)validateCertificate:(id)a3 realtime:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (gLogObjects) {
    BOOL v9 = gNumLogObjects < 2;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    id v11 = MEMORY[0x263EF8438];
    id v10 = MEMORY[0x263EF8438];
  }
  else
  {
    id v11 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v21) = 0;
    _os_log_impl(&dword_21DC52000, v11, OS_LOG_TYPE_DEFAULT, "Validating certificate...", (uint8_t *)&v21, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 2)
  {
    v12 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    v12 = MEMORY[0x263EF8438];
    id v13 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [v8 length];
    uint64_t v15 = "NO";
    if (v6) {
      uint64_t v15 = "YES";
    }
    int v21 = 134218242;
    uint64_t v22 = v14;
    __int16 v23 = 2080;
    uint64_t v24 = v15;
    _os_log_impl(&dword_21DC52000, v12, OS_LOG_TYPE_DEFAULT, "certificate.length: %lu, realtime: %s", (uint8_t *)&v21, 0x16u);
  }

  if (v8)
  {
    CertificateRefWithData = (const void *)createCertificateRefWithData(v8, 1);
    id v17 = _createCertificateArrayForCert(CertificateRefWithData);
    int v18 = [(MFAACertificateManager *)self _validateCertificateChain:v17 realtime:v6 error:a5];
    if (CertificateRefWithData) {
      CFRelease(CertificateRefWithData);
    }
  }
  else
  {
    id v20 = logObjectForModule(1);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[MFAACertificateManager validateCertificate:realtime:error:]();
    }

    int v18 = 0;
    id v17 = 0;
  }

  return v18;
}

- (int)validateCertificateChain:(id)a3 realtime:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (gLogObjects) {
    BOOL v9 = gNumLogObjects < 2;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    id v11 = MEMORY[0x263EF8438];
    id v10 = MEMORY[0x263EF8438];
  }
  else
  {
    id v11 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DC52000, v11, OS_LOG_TYPE_DEFAULT, "Validating certificates...", buf, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 2)
  {
    v12 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    v12 = MEMORY[0x263EF8438];
    id v13 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [v8 count];
    uint64_t v15 = "NO";
    if (v6) {
      uint64_t v15 = "YES";
    }
    *(_DWORD *)buf = 134218242;
    uint64_t v34 = v14;
    __int16 v35 = 2080;
    v36 = v15;
    _os_log_impl(&dword_21DC52000, v12, OS_LOG_TYPE_DEFAULT, "certificates.count: %lu, realtime: %s", buf, 0x16u);
  }

  id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v17 = v16;
  if (!v8)
  {
    v27 = logObjectForModule(1);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[MFAACertificateManager validateCertificateChain:realtime:error:]();
    }
    goto LABEL_38;
  }
  if (!v16)
  {
    v27 = logObjectForModule(1);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[MFAACertificateManager validateCertificateChain:realtime:error:]();
    }
LABEL_38:

    int v25 = 0;
    goto LABEL_33;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v18 = v8;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t CertificateRefWithData = createCertificateRefWithData(*(void **)(*((void *)&v28 + 1) + 8 * i), 1);
        if (!CertificateRefWithData)
        {

          int v25 = 2;
          goto LABEL_33;
        }
        uint64_t v24 = (void *)CertificateRefWithData;
        objc_msgSend(v17, "addObject:", CertificateRefWithData, (void)v28);
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }

  int v25 = [(MFAACertificateManager *)self _validateCertificateChain:v17 realtime:v6 error:a5];
LABEL_33:

  return v25;
}

- (int)validateCertificateChain:(id)a3 type:(int)a4 realtime:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v106 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = v10;
  switch(a4)
  {
    case 0:
      CFAllocatorRef v35 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
      CFDataRef v37 = [v11 objectAtIndex:0];
      SecCertificateRef v38 = SecCertificateCreateWithData(v35, v37);

      if (v38)
      {
        CFArrayAppendValue(Mutable, v38);
        CFRelease(v38);
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v54 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[MFAATokenManager _init]();
          }
          v54 = MEMORY[0x263EF8438];
          id v82 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v100 = 0;
          _os_log_impl(&dword_21DC52000, v54, OS_LOG_TYPE_DEFAULT, "validateCertificateChain: Cannot get leafCert for type %d", buf, 8u);
        }
      }
      CFDataRef v83 = [v11 objectAtIndex:1];
      SecCertificateRef v84 = SecCertificateCreateWithData(v35, v83);

      if (v84)
      {
        CFArrayAppendValue(Mutable, v84);
        CFRelease(v84);
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v85 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[MFAATokenManager _init]();
          }
          v85 = MEMORY[0x263EF8438];
          id v86 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v100 = 0;
          _os_log_impl(&dword_21DC52000, v85, OS_LOG_TYPE_DEFAULT, "validateCertificateChain: Cannot get intermediateCert for type %d", buf, 8u);
        }
      }
      int v44 = [(MFAACertificateManager *)self _validateBAACertificateChain:Mutable error:a6];
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v87 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[MFAATokenManager _init]();
        }
        v87 = MEMORY[0x263EF8438];
        id v88 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v100 = 0;
        *(_WORD *)&v100[4] = 1024;
        *(_DWORD *)&v100[6] = v44;
        _os_log_impl(&dword_21DC52000, v87, OS_LOG_TYPE_DEFAULT, "validateCertificateChain: type=%d, status = %d", buf, 0xEu);
      }

      if (Mutable) {
        CFRelease(Mutable);
      }
      goto LABEL_168;
    case 1:
    case 6:
      SecTrustRef trust = 0;
      int v97 = 0;
      if (!v10 || ![v10 count]) {
        goto LABEL_208;
      }
      [v11 objectAtIndexedSubscript:0];

      uint64_t v12 = SecPolicyCreateiAP();
      if (!v12)
      {
        v89 = logObjectForModule(-1);
        if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR)) {
          -[MFAACertificateManager validateCertificateChain:type:realtime:error:]();
        }
LABEL_207:

LABEL_208:
        int v44 = 0;
        CFArrayRef v52 = 0;
        goto LABEL_67;
      }
      id v13 = (const void *)v12;
      CFIndex v14 = [v11 count];
      CFMutableArrayRef v15 = CFArrayCreateMutable(0, v14, MEMORY[0x263EFFF70]);
      if (!v15)
      {
        v89 = logObjectForModule(-1);
        if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR)) {
          -[MFAACertificateManager validateCertificateChain:type:realtime:error:]();
        }
        goto LABEL_207;
      }
      id v16 = v15;
      id v17 = v11;
      BOOL v18 = v7;
      long long v95 = 0u;
      long long v96 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      v92 = v17;
      id v19 = v17;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v93 objects:v105 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v94;
        CFAllocatorRef v23 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v94 != v22) {
              objc_enumerationMutation(v19);
            }
            SecCertificateRef v25 = SecCertificateCreateWithData(v23, *(CFDataRef *)(*((void *)&v93 + 1) + 8 * i));
            if (v25)
            {
              SecCertificateRef v26 = v25;
              CFArrayAppendValue(v16, v25);
              CFRelease(v26);
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v93 objects:v105 count:16];
        }
        while (v21);
      }

      SecTrustCreateWithCertificates(v16, v13, &trust);
      if (!trust)
      {
        v90 = logObjectForModule(-1);
        BOOL v7 = v18;
        if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR)) {
          -[MFAACertificateManager validateCertificateChain:type:realtime:error:].cold.4();
        }

        int v44 = 0;
        CFArrayRef v52 = 0;
        id v11 = v92;
        goto LABEL_67;
      }
      BOOL v7 = v18;
      if (a4 == 1)
      {
        id v11 = v92;
        if (_anchorCertsForMFi3_onceToken != -1) {
          dispatch_once(&_anchorCertsForMFi3_onceToken, &__block_literal_global_206);
        }
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v27 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[MFAATokenManager _init]();
          }
          v27 = MEMORY[0x263EF8438];
          id v45 = MEMORY[0x263EF8438];
        }
        v46 = &_anchorCertsForMFi3_anchorCerts;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          uint64_t v47 = [(id)_anchorCertsForMFi3_anchorCerts count];
          *(_DWORD *)buf = 134217984;
          *(void *)v100 = v47;
          v48 = "%lu anchor cert(s) returned for MFi3";
LABEL_59:
          _os_log_impl(&dword_21DC52000, v27, OS_LOG_TYPE_INFO, v48, buf, 0xCu);
        }
      }
      else
      {
        id v11 = v92;
        if (_anchorCertsForMFi2_onceToken != -1) {
          dispatch_once(&_anchorCertsForMFi2_onceToken, &__block_literal_global_0);
        }
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v27 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[MFAATokenManager _init]();
          }
          v27 = MEMORY[0x263EF8438];
          id v49 = MEMORY[0x263EF8438];
        }
        v46 = &_anchorCertsForMFi2_anchorCerts;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          uint64_t v50 = [(id)_anchorCertsForMFi2_anchorCerts count];
          *(_DWORD *)buf = 134217984;
          *(void *)v100 = v50;
          v48 = "%lu anchor cert(s) returned for MFi2";
          goto LABEL_59;
        }
      }

      CFArrayRef v51 = (const __CFArray *)(id)*v46;
      if (!v51)
      {
        v89 = logObjectForModule(-1);
        if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR)) {
          -[MFAACertificateManager validateCertificateChain:type:realtime:error:].cold.5();
        }
        goto LABEL_207;
      }
      CFArrayRef v52 = v51;
      SecTrustSetAnchorCertificates(trust, v51);
      if (MEMORY[0x223C170E0](trust, &v97))
      {
        v91 = logObjectForModule(-1);
        if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR)) {
          -[MFAACertificateManager validateCertificateChain:type:realtime:error:].cold.7();
        }

        goto LABEL_66;
      }
      int v44 = 1;
      if (v97 != 1 && v97 != 4)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[MFAACertificateManager validateCertificateChain:type:realtime:error:].cold.6();
        }
LABEL_66:
        int v44 = 0;
      }
LABEL_67:

LABEL_168:
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v100 = v44;
        *(_WORD *)&v100[4] = 1024;
        *(_DWORD *)&v100[6] = a4;
        __int16 v101 = 1024;
        BOOL v102 = v7;
        __int16 v103 = 2112;
        v104 = v11;
        _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "validateCertificateChain: status %d, type %d, realtime %d, certificates %@", buf, 0x1Eu);
      }

      return v44;
    case 3:
    case 5:
      long long v28 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
      long long v29 = [v11 objectAtIndexedSubscript:0];
      uint64_t CertificateRefWithData = (const void *)createCertificateRefWithData(v29, 1);

      if (CertificateRefWithData)
      {
        CFArrayAppendValue(v28, CertificateRefWithData);
        CFRelease(CertificateRefWithData);
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v42 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[MFAATokenManager _init]();
          }
          v42 = MEMORY[0x263EF8438];
          id v56 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v100 = a4;
          _os_log_impl(&dword_21DC52000, v42, OS_LOG_TYPE_DEFAULT, "validateCertificateChain: Cannot get leafCert for type %d", buf, 8u);
        }
      }
      if (a4 == 5)
      {
        _anchorCertsForComponentAuth();
        id v57 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (_anchorCertsForDEVN_onceToken != -1) {
          dispatch_once(&_anchorCertsForDEVN_onceToken, &__block_literal_global_214);
        }
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v58 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[MFAATokenManager _init]();
          }
          v58 = MEMORY[0x263EF8438];
          id v59 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          uint64_t v60 = [(id)_anchorCertsForDEVN_anchorCerts count];
          *(_DWORD *)buf = 134217984;
          *(void *)v100 = v60;
          _os_log_impl(&dword_21DC52000, v58, OS_LOG_TYPE_INFO, "%lu anchor cert(s) returned for DEVN", buf, 0xCu);
        }

        id v57 = (id)_anchorCertsForDEVN_anchorCerts;
      }
      id v61 = v57;
      int v44 = [(MFAACertificateManager *)self _validateX509CertificateChain:v28 anchorCerts:v57 error:a6];
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v62 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[MFAATokenManager _init]();
        }
        v62 = MEMORY[0x263EF8438];
        id v63 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_165;
      }
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v100 = a4;
      *(_WORD *)&v100[4] = 1024;
      *(_DWORD *)&v100[6] = v44;
      v64 = "validateCertificateChain: type=%d, status = %d";
      v65 = v62;
      uint32_t v66 = 14;
      goto LABEL_164;
    case 4:
      long long v28 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
      v33 = [v11 objectAtIndexedSubscript:0];
      uint64_t v34 = (const void *)createCertificateRefWithData(v33, 1);

      if (v34)
      {
        CFArrayAppendValue(v28, v34);
        CFRelease(v34);
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v53 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[MFAATokenManager _init]();
          }
          v53 = MEMORY[0x263EF8438];
          id v67 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v100 = 4;
          _os_log_impl(&dword_21DC52000, v53, OS_LOG_TYPE_DEFAULT, "validateCertificateChain: Cannot get leafCert for type %d", buf, 8u);
        }
      }
      if (_anchorCertsForProvenance_onceToken != -1) {
        dispatch_once(&_anchorCertsForProvenance_onceToken, &__block_literal_global_216);
      }
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v68 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[MFAATokenManager _init]();
        }
        v68 = MEMORY[0x263EF8438];
        id v69 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
      {
        uint64_t v70 = [(id)_anchorCertsForProvenance_anchorCerts count];
        *(_DWORD *)buf = 134217984;
        *(void *)v100 = v70;
        _os_log_impl(&dword_21DC52000, v68, OS_LOG_TYPE_INFO, "%lu anchor cert(s) returned for Provenance", buf, 0xCu);
      }

      id v61 = (id)_anchorCertsForProvenance_anchorCerts;
      int v44 = [(MFAACertificateManager *)self _validateX509CertificateChain:v28 anchorCerts:v61 error:a6];
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v62 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[MFAATokenManager _init]();
        }
        v62 = MEMORY[0x263EF8438];
        id v71 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_165;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v100 = v44;
      v64 = "validateCertificateChain: Provenance status = %d";
      goto LABEL_163;
    case 7:
      CFAllocatorRef v39 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      long long v28 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
      CFDataRef v40 = [v11 objectAtIndex:0];
      SecCertificateRef v41 = SecCertificateCreateWithData(v39, v40);

      if (v41)
      {
        CFArrayAppendValue(v28, v41);
        CFRelease(v41);
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v55 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[MFAATokenManager _init]();
          }
          v55 = MEMORY[0x263EF8438];
          id v72 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v100 = 7;
          _os_log_impl(&dword_21DC52000, v55, OS_LOG_TYPE_DEFAULT, "validateCertificateChain: Cannot get leafCert for type %d", buf, 8u);
        }
      }
      CFDataRef v73 = [v11 objectAtIndex:1];
      SecCertificateRef v74 = SecCertificateCreateWithData(v39, v73);

      if (v74)
      {
        CFArrayAppendValue(v28, v74);
        CFRelease(v74);
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v75 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[MFAATokenManager _init]();
          }
          v75 = MEMORY[0x263EF8438];
          id v76 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v100 = 7;
          _os_log_impl(&dword_21DC52000, v75, OS_LOG_TYPE_DEFAULT, "validateCertificateChain: Cannot get intermediateCert for type %d", buf, 8u);
        }
      }
      if (_anchorCertsForWPC_onceToken != -1) {
        dispatch_once(&_anchorCertsForWPC_onceToken, &__block_literal_global_218);
      }
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v77 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[MFAATokenManager _init]();
        }
        v77 = MEMORY[0x263EF8438];
        id v78 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
      {
        uint64_t v79 = [(id)_anchorCertsForWPC_anchorCerts count];
        *(_DWORD *)buf = 134217984;
        *(void *)v100 = v79;
        _os_log_impl(&dword_21DC52000, v77, OS_LOG_TYPE_INFO, "%lu anchor cert(s) returned for WPC", buf, 0xCu);
      }

      id v61 = (id)_anchorCertsForWPC_anchorCerts;
      int v44 = [(MFAACertificateManager *)self _validateX509CertificateChain:v28 anchorCerts:v61 error:a6];
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v62 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[MFAATokenManager _init]();
        }
        v62 = MEMORY[0x263EF8438];
        id v80 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_165;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v100 = v44;
      v64 = "validateCertificateChain: WPC status = %d";
LABEL_163:
      v65 = v62;
      uint32_t v66 = 8;
LABEL_164:
      _os_log_impl(&dword_21DC52000, v65, OS_LOG_TYPE_DEFAULT, v64, buf, v66);
LABEL_165:

      if (v28) {
        CFRelease(v28);
      }

      goto LABEL_168;
    default:
      if (gLogObjects) {
        BOOL v31 = gNumLogObjects < 2;
      }
      else {
        BOOL v31 = 1;
      }
      if (v31)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[MFAATokenManager _init]();
        }
        v43 = MEMORY[0x263EF8438];
        id v32 = MEMORY[0x263EF8438];
      }
      else
      {
        v43 = *(id *)(gLogObjects + 8);
      }
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v100 = a4;
        _os_log_impl(&dword_21DC52000, v43, OS_LOG_TYPE_DEFAULT, "validateCertificateChain: Unrecognized cert type %d for cert validation, likely not supported by this API yet", buf, 8u);
      }

      int v44 = 0;
      goto LABEL_168;
  }
}

- (void)requestMetadataForCertificate:(id)a3 requestedLocale:(id)a4 requestInfo:(id)a5 completionHandler:(id)a6
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (gLogObjects) {
    BOOL v14 = gNumLogObjects < 2;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    id v16 = MEMORY[0x263EF8438];
    id v15 = MEMORY[0x263EF8438];
  }
  else
  {
    id v16 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DC52000, v16, OS_LOG_TYPE_DEFAULT, "Processing request for certificate metadata...", buf, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 2)
  {
    id v17 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    id v17 = MEMORY[0x263EF8438];
    id v18 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = [v10 length];
    uint64_t v20 = [v11 localeIdentifier];
    uint64_t v21 = (void *)v20;
    uint64_t v22 = "YES";
    *(_DWORD *)buf = 134218755;
    uint64_t v43 = v19;
    __int16 v44 = 2112;
    if (!v13) {
      uint64_t v22 = "NO";
    }
    uint64_t v45 = v20;
    __int16 v46 = 2113;
    id v47 = v12;
    __int16 v48 = 2080;
    id v49 = v22;
    _os_log_impl(&dword_21DC52000, v17, OS_LOG_TYPE_DEFAULT, "certificate.length: %lu, requestedLocale: %@, requestInfo: %{private}@, completionHandler: %s", buf, 0x2Au);
  }
  if (v13)
  {
    if (systemInfo_isInternalBuild()
      && ([(MFAACertificateManager *)self userDefaults],
          CFAllocatorRef v23 = objc_claimAutoreleasedReturnValue(),
          int v24 = [v23 BOOLForKey:@"SpoofPPIDMetadata"],
          v23,
          v24))
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        SecCertificateRef v25 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[MFAATokenManager _init]();
        }
        SecCertificateRef v25 = MEMORY[0x263EF8438];
        id v29 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DC52000, v25, OS_LOG_TYPE_DEFAULT, "Spoofing PPID metadata...", buf, 2u);
      }

      if (gLogObjects && gNumLogObjects >= 2)
      {
        long long v30 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[MFAATokenManager _init]();
        }
        long long v30 = MEMORY[0x263EF8438];
        id v31 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v43) = 1000;
        _os_log_impl(&dword_21DC52000, v30, OS_LOG_TYPE_INFO, "Sleeping %dms...", buf, 8u);
      }

      dispatch_time_t v32 = dispatch_time(0, 1000000000);
      v33 = dispatch_get_global_queue(0, 0);
      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke;
      v39[3] = &unk_264479508;
      v27 = &v41;
      id v41 = v13;
      id v40 = v11;
      dispatch_after(v32, v33, v39);

      long long v28 = v40;
    }
    else
    {
      SecCertificateRef v26 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_74;
      block[3] = &unk_264479530;
      v27 = (id *)v35;
      v35[0] = v10;
      v35[1] = self;
      id v36 = v11;
      id v38 = v13;
      id v37 = v12;
      dispatch_async(v26, block);

      long long v28 = v36;
    }
  }
}

uint64_t __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, __CFString *, void, void *, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), @"000000-0000", *(void *)(a1 + 32), &unk_26CE91E60, 0);
}

void __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_74(void **a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t CertificateRefWithData = (void *)createCertificateRefWithData(a1[4], 1);
  if (SecCertificateGetiAuthVersion() == 4)
  {
    uint64_t v3 = _createCertificateArrayForCert(CertificateRefWithData);
    uint64_t v4 = a1[5];
    id v31 = 0;
    int v5 = [v4 _validateCertificateChain:v3 realtime:1 error:&v31];
    id v6 = v31;
    if (v5 == 1)
    {
      CFDataRef v7 = SecCertificateCopySerialNumberData((SecCertificateRef)CertificateRefWithData, 0);
      if (v7)
      {
        id v8 = (void *)SecCertificateCopyIssuerSequence();
        if (gLogObjects && gNumLogObjects >= 2)
        {
          BOOL v9 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[MFAATokenManager _init]();
          }
          BOOL v9 = MEMORY[0x263EF8438];
          id v10 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_74_cold_4();
        }

        if (v8)
        {
          v27 = (void *)SecCertificateCopyIssuerSummary();
          if (v27)
          {
            SecCertificateRef v26 = v3;
            id v11 = (void *)SecCertificateCopyOrganization();
            id v12 = v11;
            if (v11
              && [v11 count]
              && ([v12 objectAtIndexedSubscript:0], (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              BOOL v14 = (void *)v13;
              SecCertificateRef v25 = v8;
              if (gLogObjects && gNumLogObjects >= 2)
              {
                id v15 = *(id *)(gLogObjects + 8);
              }
              else
              {
                if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
                  -[MFAATokenManager _init]();
                }
                id v15 = MEMORY[0x263EF8438];
                id v16 = MEMORY[0x263EF8438];
              }
              id v17 = v6;
              if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
              {
                uint64_t v18 = [(__CFData *)v7 length];
                uint64_t v19 = [a1[6] localeIdentifier];
                *(_DWORD *)buf = 138478851;
                CFDataRef v33 = v7;
                __int16 v34 = 2048;
                uint64_t v35 = v18;
                __int16 v36 = 2112;
                id v37 = v27;
                __int16 v38 = 2113;
                CFAllocatorRef v39 = v14;
                __int16 v40 = 2112;
                id v41 = v19;
                _os_log_impl(&dword_21DC52000, v15, OS_LOG_TYPE_INFO, "certSerial: %{private}@, certSerial.length: %lu, issuer: %@, ppid: %{private}@, requestedLocale: %@", buf, 0x34u);
              }
              uint64_t v20 = [a1[5] xpcConnection];
              v29[0] = MEMORY[0x263EF8330];
              v29[1] = 3221225472;
              v29[2] = __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_79;
              v29[3] = &unk_264478B18;
              id v30 = a1[8];
              uint64_t v21 = [v20 remoteObjectProxyWithErrorHandler:v29];
              id v28 = a1[8];
              id v8 = v25;
              objc_msgSend(v21, "requestMetadataForCertSerial:issuerSeq:ppid:requestedLocale:requestInfo:withReply:", v7);
            }
            else
            {
              id v17 = objc_msgSend(MEMORY[0x263F087E8], "MFAA_errorWithDomain:code:", @"MFAACertificateManagerErrorDomain", -4);
              BOOL v14 = v6;
            }

            uint64_t v3 = v26;
          }
          else
          {
            id v17 = objc_msgSend(MEMORY[0x263F087E8], "MFAA_errorWithDomain:code:", @"MFAACertificateManagerErrorDomain", -4);
            id v12 = v6;
          }
        }
        else
        {
          id v17 = objc_msgSend(MEMORY[0x263F087E8], "MFAA_errorWithDomain:code:", @"MFAACertificateManagerErrorDomain", -4);
        }
      }
      else
      {
        id v17 = objc_msgSend(MEMORY[0x263F087E8], "MFAA_errorWithDomain:code:", @"MFAACertificateManagerErrorDomain", -4);
        id v8 = v6;
      }
    }
    else
    {
      id v17 = objc_msgSend(MEMORY[0x263F087E8], "MFAA_errorWithDomain:code:description:", @"MFAACertificateManagerErrorDomain", -3, @"The provided certificate is not valid.");
    }
    if (CertificateRefWithData) {
LABEL_30:
    }
      CFRelease(CertificateRefWithData);
  }
  else
  {
    int v24 = logObjectForModule(1);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_74_cold_6();
    }

    id v17 = objc_msgSend(MEMORY[0x263F087E8], "MFAA_errorWithDomain:code:", @"MFAACertificateManagerErrorDomain", -3);
    if (CertificateRefWithData) {
      goto LABEL_30;
    }
  }
  if (v17)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      uint64_t v22 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAATokenManager _init]();
      }
      uint64_t v22 = MEMORY[0x263EF8438];
      id v23 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_74_cold_1();
    }

    (*((void (**)(void))a1[8] + 2))();
  }
}

void __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_79(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 2;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    id v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    id v6 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_79_cold_3();
  }

  CFDataRef v7 = objc_msgSend(MEMORY[0x263F087E8], "MFAA_errorWithDomain:code:", @"MFAACertificateManagerErrorDomain", -4);
  if (gLogObjects && gNumLogObjects >= 2)
  {
    id v8 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    id v8 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_79_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_81(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)copyParsedCertificateChainInfo:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 2;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    id v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    id v6 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v31 = (uint64_t)v3;
    _os_log_impl(&dword_21DC52000, v6, OS_LOG_TYPE_DEFAULT, "copyParsedCertificateChainInfo: certificateData %@", buf, 0xCu);
  }

  if (!v3)
  {
    uint64_t v19 = logObjectForModule(1);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MFAACertificateManager copyParsedCertificateChainInfo:]();
    }
    goto LABEL_32;
  }
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (!v7)
  {
    uint64_t v19 = logObjectForModule(1);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MFAACertificateManager copyParsedCertificateChainInfo:]();
    }
LABEL_32:

    id v8 = 0;
LABEL_36:
    id v15 = 0;
    goto LABEL_37;
  }
  id v8 = v7;
  id v9 = v3;
  id v10 = (unsigned __int8 *)[v9 bytes];
  uint64_t v11 = [v9 length];
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  unint64_t v26 = 0;
  v27 = 0;
  uint64_t v25 = 0;
  int v12 = CTParseAccessoryCerts(v10, v11, &v29, &v28, &v27, &v26, &v25);
  if (gLogObjects && gNumLogObjects >= 2)
  {
    uint64_t v13 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    uint64_t v13 = MEMORY[0x263EF8438];
    id v14 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219008;
    uint64_t v31 = v11;
    __int16 v32 = 2048;
    uint64_t v33 = v28;
    __int16 v34 = 2048;
    unint64_t v35 = v26;
    __int16 v36 = 2048;
    uint64_t v37 = v25;
    __int16 v38 = 1024;
    int v39 = v12;
    _os_log_impl(&dword_21DC52000, v13, OS_LOG_TYPE_DEFAULT, "copyParsedCertificateChainInfo: certData(%zu bytes), leafCertData(%zu bytes), subCACertData(%zu bytes), ctPolicyFlags 0x%llx, ret %x", buf, 0x30u);
  }

  if (v12)
  {
    uint64_t v20 = logObjectForModule(1);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[MFAACertificateManager copyParsedCertificateChainInfo:].cold.4();
    }

    goto LABEL_36;
  }
  id v15 = [MEMORY[0x263EFF8F8] dataWithBytes:v29 length:v28];
  if (!v15)
  {
LABEL_37:
    id v16 = 0;
    uint64_t v18 = 0;
    goto LABEL_38;
  }
  [v8 setObject:v15 forKey:@"LeafCertData"];
  [v8 setObject:v9 forKey:@"FullCertData"];
  if (v27)
  {
    id v16 = [MEMORY[0x263EFF8F8] dataWithBytes:v27 length:v26];
    if (v16) {
      [v8 setObject:v16 forKey:@"SubCACertData"];
    }
  }
  else
  {
    id v16 = 0;
  }
  id v17 = [NSNumber numberWithUnsignedLongLong:v25];
  [v8 setObject:v17 forKey:@"PolicyFlags"];

  uint64_t v18 = (void *)[v8 copy];
LABEL_38:
  if (gLogObjects && gNumLogObjects >= 2)
  {
    uint64_t v21 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    uint64_t v21 = MEMORY[0x263EF8438];
    id v22 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v31 = (uint64_t)v18;
    _os_log_impl(&dword_21DC52000, v21, OS_LOG_TYPE_DEFAULT, "copyParsedCertificateChainInfo: result %@", buf, 0xCu);
  }

  id v23 = v18;
  return v23;
}

- (id)copyParsedCertificateChainInfo:(id)a3 assumeType:(int)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 2;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    id v9 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  else
  {
    id v9 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 67109378;
    int v20 = a4;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_21DC52000, v9, OS_LOG_TYPE_DEFAULT, "copyParsedCertificateChainInfo:assumeType: %d, certificateData %@", (uint8_t *)&v19, 0x12u);
  }

  if (!v6)
  {
    id v17 = logObjectForModule(1);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[MFAACertificateManager copyParsedCertificateChainInfo:]();
    }
    goto LABEL_35;
  }
  if ((a4 + 1) > 7)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      id v17 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAATokenManager _init]();
      }
      id v17 = MEMORY[0x263EF8438];
      id v18 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[MFAACertificateManager copyParsedCertificateChainInfo:assumeType:]();
    }
LABEL_35:

    id v10 = 0;
    goto LABEL_15;
  }
  if (((1 << (a4 + 1)) & 0xCF) == 0)
  {
    id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    if (v12)
    {
      uint64_t v11 = v12;
      [v12 setObject:v6 forKey:@"LeafCertData"];
      [v11 setObject:v6 forKey:@"FullCertData"];
      uint64_t v13 = [NSNumber numberWithUnsignedLongLong:0];
      [v11 setObject:v13 forKey:@"PolicyFlags"];

      id v10 = (id)[v11 copy];
      goto LABEL_18;
    }
    id v17 = logObjectForModule(1);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[MFAACertificateManager copyParsedCertificateChainInfo:]();
    }
    goto LABEL_35;
  }
  id v10 = [(MFAACertificateManager *)self copyParsedCertificateChainInfo:v6];
LABEL_15:
  uint64_t v11 = 0;
LABEL_18:
  if (gLogObjects && gNumLogObjects >= 2)
  {
    id v14 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    id v14 = MEMORY[0x263EF8438];
    id v15 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 67109378;
    int v20 = a4;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl(&dword_21DC52000, v14, OS_LOG_TYPE_DEFAULT, "copyParsedCertificateChainInfo:assumeType: %d, result %@", (uint8_t *)&v19, 0x12u);
  }

  return v10;
}

- (id)copyParsedCertificateChainInfoFromCerts:(id)a3 assumeType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 2;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    id v9 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  else
  {
    id v9 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v28 = v4;
    __int16 v29 = 2112;
    id v30 = v6;
    _os_log_impl(&dword_21DC52000, v9, OS_LOG_TYPE_DEFAULT, "copyParsedCertificateChainInfoFromCerts:assumeType: %d, certificateList %@", buf, 0x12u);
  }

  if (!v6 || ![v6 count])
  {
    __int16 v21 = logObjectForModule(1);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[MFAACertificateManager copyParsedCertificateChainInfoFromCerts:assumeType:]();
    }
    goto LABEL_35;
  }
  id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
  if (!v10)
  {
    __int16 v21 = logObjectForModule(1);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[MFAACertificateManager copyParsedCertificateChainInfoFromCerts:assumeType:]();
    }
LABEL_35:

    uint64_t v11 = 0;
    id v17 = 0;
    goto LABEL_22;
  }
  uint64_t v11 = v10;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(v11, "appendData:", *(void *)(*((void *)&v22 + 1) + 8 * i), (void)v22);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v14);
  }

  id v17 = [(MFAACertificateManager *)self copyParsedCertificateChainInfo:v11 assumeType:v4];
LABEL_22:
  if (gLogObjects && gNumLogObjects >= 2)
  {
    id v18 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    id v18 = MEMORY[0x263EF8438];
    id v19 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v28 = v4;
    __int16 v29 = 2112;
    id v30 = v17;
    _os_log_impl(&dword_21DC52000, v18, OS_LOG_TYPE_DEFAULT, "copyParsedCertificateChainInfo:assumeType: %d, result %@", buf, 0x12u);
  }

  return v17;
}

- (id)copyEvaluatedCertificateChainInfo:(id)a3
{
  return [(MFAACertificateManager *)self copyEvaluatedCertificateChainInfo:a3 forSpecificType:0];
}

- (id)copyEvaluatedCertificateChainInfo:(id)a3 forSpecificType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v109 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 2;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    id v9 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  else
  {
    id v9 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v4;
    _os_log_impl(&dword_21DC52000, v9, OS_LOG_TYPE_DEFAULT, "copyEvaluatedCertificateChainInfo: certificateInfo %@, forSpecificType: 0x%02x", buf, 0x12u);
  }

  if (!v6)
  {
    v81 = logObjectForModule(1);
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
      -[MFAACertificateManager copyEvaluatedCertificateChainInfo:forSpecificType:]();
    }
    goto LABEL_193;
  }
  id v10 = (void *)[v6 mutableCopy];
  if (!v10)
  {
    v81 = logObjectForModule(1);
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
      -[MFAACertificateManager copyEvaluatedCertificateChainInfo:forSpecificType:]();
    }
LABEL_193:

    id v61 = 0;
    id v64 = 0;
    uint32_t v66 = 0;
    v89 = 0;
    uint64_t v13 = 0;
    id v67 = 0;
    uint64_t v11 = 0;
    v65 = 0;
    goto LABEL_180;
  }
  uint64_t v11 = v10;
  id v12 = [v10 objectForKey:@"LeafCertData"];
  uint64_t v13 = [v11 objectForKey:@"SubCACertData"];
  id v88 = [v11 objectForKey:@"PolicyFlags"];
  uint64_t v93 = [v88 unsignedLongLongValue];
  if (v12)
  {
    if (v4) {
      +[MFAACertificateManager _anchorCertificatesDataForTypes:v4];
    }
    else {
    uint64_t v14 = [(MFAACertificateManager *)self _getAnchorCertsForPolicy:v93];
    }
    unsigned int v86 = v4;
    id v15 = v12;
    unint64_t v91 = [v15 bytes];
    id v87 = v15;
    uint64_t v90 = [v15 length];
    if (v13)
    {
      id v16 = v13;
      unint64_t v92 = [v16 bytes];
      uint64_t v17 = [v16 length];
    }
    else
    {
      unint64_t v92 = 0;
      uint64_t v17 = 0;
    }
    uint64_t v103 = 0;
    uint64_t v104 = 0;
    uint64_t v101 = 0;
    uint64_t v102 = 0;
    if (gLogObjects && gNumLogObjects >= 2)
    {
      id v18 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAATokenManager _init]();
      }
      id v18 = MEMORY[0x263EF8438];
      id v19 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = [v14 count];
      *(_DWORD *)buf = 134218496;
      *(void *)&uint8_t buf[4] = v20;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v93;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = v17;
      _os_log_impl(&dword_21DC52000, v18, OS_LOG_TYPE_INFO, "copyEvaluatedCertificateChainInfo: %lu anchorCerts, policy 0x%llx, subCACertLen %lu", buf, 0x20u);
    }

    v89 = v14;
    if (v14)
    {
      SecCertificateRef v84 = v11;
      id v85 = v6;
      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      id v21 = v14;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v97 objects:v107 count:16];
      CFDataRef v83 = v13;
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v98;
        long long v25 = MEMORY[0x263EF8438];
LABEL_31:
        uint64_t v26 = 0;
        while (1)
        {
          if (*(void *)v98 != v24) {
            objc_enumerationMutation(v21);
          }
          v27 = *(void **)(*((void *)&v97 + 1) + 8 * v26);
          uint64_t v28 = gLogObjects;
          int v29 = gNumLogObjects;
          if (!gLogObjects || gNumLogObjects < 2)
          {
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              *(void *)&uint8_t buf[4] = v28;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v29;
              _os_log_error_impl(&dword_21DC52000, v25, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            uint64_t v31 = v25;
            __int16 v32 = v25;
          }
          else
          {
            __int16 v32 = *(id *)(gLogObjects + 8);
          }
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218242;
            *(void *)&uint8_t buf[4] = v93;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v27;
            _os_log_impl(&dword_21DC52000, v32, OS_LOG_TYPE_INFO, "copyEvaluatedCertificateChainInfo: try CTEvaluateAccessoryCert for policy 0x%llx, anchorCert %@", buf, 0x16u);
          }

          id v33 = v27;
          int v34 = CTEvaluateAccessoryCert(v91, v90, v92, v17, [v33 bytes], objc_msgSend(v33, "length"), v93, &v104, &v103, &v102, &v101);
          uint64_t v35 = gLogObjects;
          int v36 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 2)
          {
            uint64_t v37 = *(id *)(gLogObjects + 8);
          }
          else
          {
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              *(void *)&uint8_t buf[4] = v35;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v36;
              _os_log_error_impl(&dword_21DC52000, v25, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            __int16 v38 = v25;
            uint64_t v37 = v25;
          }
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)&uint8_t buf[4] = v34;
            *(_WORD *)&buf[8] = 2048;
            *(void *)&buf[10] = v93;
            *(_WORD *)&buf[18] = 2112;
            *(void *)&buf[20] = v33;
            _os_log_impl(&dword_21DC52000, v37, OS_LOG_TYPE_INFO, "copyEvaluatedCertificateChainInfo: ctRet %d after try CTEvaluateAccessoryCert for policy 0x%llx, anchorCert %@", buf, 0x1Cu);
          }

          if (!v34) {
            break;
          }
          uint64_t v39 = gLogObjects;
          int v40 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 2)
          {
            id v41 = *(id *)(gLogObjects + 8);
          }
          else
          {
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              *(void *)&uint8_t buf[4] = v39;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v40;
              _os_log_error_impl(&dword_21DC52000, v25, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            uint64_t v42 = v25;
            id v41 = v25;
          }
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)&uint8_t buf[4] = v34;
            *(_WORD *)&buf[8] = 2048;
            *(void *)&buf[10] = v93;
            *(_WORD *)&buf[18] = 2112;
            *(void *)&buf[20] = v33;
            _os_log_debug_impl(&dword_21DC52000, v41, OS_LOG_TYPE_DEBUG, "copyEvaluatedCertificateChainInfo: ctRet %d after try CTEvaluateAccessoryCert for policy 0x%llx, anchorCert %@", buf, 0x1Cu);
          }

          if (v23 == ++v26)
          {
            uint64_t v23 = [v21 countByEnumeratingWithState:&v97 objects:v107 count:16];
            if (v23) {
              goto LABEL_31;
            }
            break;
          }
        }
      }
      else
      {
        int v34 = -1;
      }

      uint64_t v11 = v84;
      id v6 = v85;
      uint64_t v13 = v83;
    }
    else
    {
      int v34 = CTEvaluateAccessoryCert(v91, v90, v92, v17, 0, 0, v93, &v104, &v103, &v102, &v101);
    }
    if (gLogObjects && gNumLogObjects >= 2)
    {
      uint64_t v43 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAATokenManager _init]();
      }
      uint64_t v43 = MEMORY[0x263EF8438];
      id v44 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      if (v104) {
        BOOL v45 = v103 == 0;
      }
      else {
        BOOL v45 = 1;
      }
      int v46 = !v45;
      if (v45)
      {
        id v47 = 0;
      }
      else
      {
        id v47 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:");
      }
      if (v102) {
        BOOL v48 = v101 == 0;
      }
      else {
        BOOL v48 = 1;
      }
      int v49 = !v48;
      if (v48)
      {
        uint64_t v50 = 0;
      }
      else
      {
        uint64_t v50 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:");
      }
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v47;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v50;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = v34;
      _os_log_impl(&dword_21DC52000, v43, OS_LOG_TYPE_INFO, "copyEvaluatedCertificateChainInfo: leafKey %@, extensionValue %@, ctRet %d", buf, 0x1Cu);
      if (v49) {

      }
      if (v46) {
    }
      }

    if (!v34)
    {
LABEL_126:
      if (v104
        && v103
        && (objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:"),
            id v61 = (id)objc_claimAutoreleasedReturnValue(),
            v61,
            v61))
      {
        [v11 setObject:v61 forKey:@"PublicKey"];
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v62 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[MFAATokenManager _init]();
          }
          v62 = MEMORY[0x263EF8438];
          id v68 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21DC52000, v62, OS_LOG_TYPE_DEFAULT, "copyEvaluatedCertificateChainInfo: no leafKey", buf, 2u);
        }

        id v61 = 0;
      }
      if (v102
        && v101
        && (objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:"),
            id v64 = (id)objc_claimAutoreleasedReturnValue(),
            v64,
            v64))
      {
        [v11 setObject:v64 forKey:@"ExtensionValue"];
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 2)
        {
          id v69 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[MFAATokenManager _init]();
          }
          id v69 = MEMORY[0x263EF8438];
          id v70 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21DC52000, v69, OS_LOG_TYPE_DEFAULT, "copyEvaluatedCertificateChainInfo: no extensionValue", buf, 2u);
        }

        id v64 = 0;
      }
      if (v92 && v17)
      {
        uint64_t v94 = 0;
        uint64_t v95 = 0;
        uint64_t v105 = 0xB6463F78648862ALL;
        char v106 = 1;
        *(void *)buf = 0x66463F78648862ALL;
        *(_WORD *)&buf[8] = 327;
        id v71 = &v105;
        uint64_t v72 = 9;
        if (v93 != 0x40000000)
        {
          id v71 = 0;
          uint64_t v72 = 0;
        }
        if (v93 == 0x400000000) {
          CFDataRef v73 = (uint64_t *)buf;
        }
        else {
          CFDataRef v73 = v71;
        }
        if (v93 == 0x400000000) {
          size_t v74 = 10;
        }
        else {
          size_t v74 = v72;
        }
        CTParseExtensionValue(v92, v17, v73, v74, &v95, &v94);
        if (v95 && v94)
        {
          objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:");
          id v75 = (id)objc_claimAutoreleasedReturnValue();

          if (v75)
          {
            [v11 setObject:v75 forKey:@"SubCAExtensionValue"];
            id v64 = v75;
            goto LABEL_171;
          }
        }
        else
        {
        }
        id v64 = 0;
      }
LABEL_171:
      if (v93 == 0x40000000)
      {
        buf[8] = 2;
        *(void *)buf = 0xB6463F78648862ALL;
        uint64_t v105 = 0;
        uint64_t v95 = 0;
        CTParseExtensionValue(v91, v90, buf, 9uLL, &v105, &v95);
        id v67 = v87;
        uint32_t v66 = v88;
        if (v105 && v95)
        {
          objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:");
          id v76 = (id)objc_claimAutoreleasedReturnValue();

          if (v76)
          {
            [v11 setObject:v76 forKey:@"PartNumber"];
            id v64 = v76;
LABEL_179:
            v65 = (void *)[v11 copy];
            goto LABEL_180;
          }
        }
        else
        {
        }
        id v64 = 0;
        goto LABEL_179;
      }
      id v67 = v87;
      uint32_t v66 = v88;
      goto LABEL_179;
    }
    if (gLogObjects && gNumLogObjects >= 2)
    {
      CFArrayRef v51 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAATokenManager _init]();
      }
      CFArrayRef v51 = MEMORY[0x263EF8438];
      id v52 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21DC52000, v51, OS_LOG_TYPE_DEFAULT, "copyEvaluatedCertificateChainInfo: try validateCertificateChain:type:...", buf, 2u);
    }

    id v53 = objc_alloc_init(MEMORY[0x263EFF980]);
    if (v91 && v90)
    {
      v54 = [MEMORY[0x263EFF8F8] dataWithBytes:v91 length:v90];
      [v53 addObject:v54];
    }
    if (v92 && v17)
    {
      v55 = [MEMORY[0x263EFF8F8] dataWithBytes:v92 length:v17];
      [v53 addObject:v55];
    }
    if (v89) {
      objc_msgSend(v53, "addObjectsFromArray:");
    }
    if ([v53 count])
    {
      uint64_t v56 = +[MFAACertificateManager _anchorType2CertType:v86];
      id v57 = +[MFAACertificateManager sharedManager];
      id v96 = 0;
      LODWORD(v56) = [v57 validateCertificateChain:v53 type:v56 realtime:0 error:&v96];
      id v58 = v96;

      if (v56 == 1) {
        goto LABEL_125;
      }
    }
    if ([v53 count])
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        id v59 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[MFAATokenManager _init]();
        }
        id v59 = MEMORY[0x263EF8438];
        id v60 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DC52000, v59, OS_LOG_TYPE_DEFAULT, "copyEvaluatedCertificateChainInfo: try MFAAVerifyPublicCertificateChain", buf, 2u);
      }

      if (MFAAVerifyPublicCertificateChain((const __CFArray *)v53))
      {
LABEL_125:

        goto LABEL_126;
      }
    }

    id v63 = logObjectForModule(1);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
      -[MFAACertificateManager copyEvaluatedCertificateChainInfo:forSpecificType:].cold.7();
    }

    id v61 = 0;
    id v64 = 0;
    v65 = 0;
    id v67 = v87;
    uint32_t v66 = v88;
  }
  else
  {
    id v82 = logObjectForModule(1);
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
      -[MFAACertificateManager copyEvaluatedCertificateChainInfo:forSpecificType:].cold.4();
    }

    id v61 = 0;
    id v64 = 0;
    v89 = 0;
    id v67 = 0;
    v65 = 0;
    uint32_t v66 = v88;
  }
LABEL_180:
  if (gLogObjects && gNumLogObjects >= 2)
  {
    v77 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    v77 = MEMORY[0x263EF8438];
    id v78 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v65;
    _os_log_impl(&dword_21DC52000, v77, OS_LOG_TYPE_DEFAULT, "copyEvaluatedCertificateChainInfo: result %@", buf, 0xCu);
  }

  id v79 = v65;
  return v79;
}

- (int)authVersionFromCertificateChainInfo:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectForKey:@"PolicyFlags"];
    id v6 = v5;
    if (v5)
    {
      if (([v5 unsignedLongLongValue] & 0x8000000) != 0)
      {
        int v7 = 2;
      }
      else if (([v6 unsignedLongLongValue] & 4) != 0)
      {
        int v7 = 3;
      }
      else if (([v6 unsignedLongLongValue] & 0x40000000) != 0)
      {
        int v7 = 4;
      }
      else if (([v6 unsignedLongLongValue] & 0x41C00000000) != 0)
      {
        int v7 = 5;
      }
      else
      {
        int v7 = 0;
      }
    }
    else
    {
      int v7 = 0;
    }
  }
  else
  {
    id v12 = logObjectForModule(1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MFAACertificateManager copyEvaluatedCertificateChainInfo:forSpecificType:]();
    }

    int v7 = 0;
    id v6 = 0;
  }
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 2;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    id v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    id v10 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    [(MFAACertificateManager *)(uint64_t)v4 authVersionFromCertificateChainInfo:v10];
  }

  return v7;
}

- (id)copyCertificateSerialNumber:(id)a3 authVer:(int)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = v5;
  CFErrorRef error = 0;
  if (!v5)
  {
    uint64_t v20 = logObjectForModule(1);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[MFAACertificateManager copyCertificateSerialNumber:authVer:]();
    }
    goto LABEL_37;
  }
  id v7 = v5;
  [v7 bytes];
  [v7 length];
  BOOL v8 = (__SecCertificate *)SecCertificateCreateWithBytes();
  if (!v8)
  {
    uint64_t v20 = logObjectForModule(1);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[MFAACertificateManager copyCertificateSerialNumber:authVer:].cold.4();
    }
LABEL_37:

    CFDataRef v11 = 0;
    goto LABEL_18;
  }
  id v9 = v8;
  CFDataRef v10 = SecCertificateCopySerialNumberData(v8, &error);
  CFDataRef v11 = v10;
  if (v10) {
    BOOL v12 = error == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    if (a4 != 2) {
      goto LABEL_17;
    }
    BytePtr = CFDataGetBytePtr(v10);
    CFIndex Length = CFDataGetLength(v11);
    BOOL v15 = BytePtr && Length == 15;
    if (!v15
      || ((char)BytePtr[7] & 0x80000000) == 0
      || (!MFAAIsInternalBuild() || (MFAAIsDevelopmentHW() & 1) == 0)
      && !MFAAIsDeveloperBuild())
    {
      goto LABEL_17;
    }
    uint64_t v19 = *(void *)BytePtr;
    *(void *)&buf[7] = *(void *)(BytePtr + 7);
    *(void *)buf = v19;
    buf[7] = HIBYTE(v19) & 0x7F;
    CFRelease(v11);
    CFDataRef v11 = CFDataCreate(0, buf, 15);
    if (v11) {
      goto LABEL_17;
    }
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAACertificateManager copyCertificateSerialNumber:authVer:].cold.5();
    }
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[MFAACertificateManager copyCertificateSerialNumber:authVer:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1072;
    __int16 v23 = 2112;
    CFDataRef v24 = v11;
    __int16 v25 = 2112;
    CFErrorRef v26 = error;
    _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s:%d WARNING: pkSerNumData = %@, pCFError = %@", buf, 0x26u);
  }
  CFDataRef v11 = 0;
LABEL_17:
  CFRelease(v9);
LABEL_18:
  if (gLogObjects && gNumLogObjects >= 2)
  {
    id v16 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    id v16 = MEMORY[0x263EF8438];
    id v17 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[MFAACertificateManager copyCertificateSerialNumber:authVer:]();
  }

  return v11;
}

- (id)copyLeafCertificateSerialNumber:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    BOOL v12 = logObjectForModule(1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MFAACertificateManager copyLeafCertificateSerialNumber:]();
    }
    goto LABEL_17;
  }
  uint64_t v6 = [v4 objectForKey:@"LeafCertData"];
  if (!v6)
  {
    BOOL v12 = logObjectForModule(1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MFAACertificateManager copyLeafCertificateSerialNumber:]();
    }
LABEL_17:

    id v7 = 0;
    id v8 = 0;
    goto LABEL_4;
  }
  id v7 = (void *)v6;
  id v8 = [(MFAACertificateManager *)self copyCertificateSerialNumber:v6 authVer:[(MFAACertificateManager *)self authVersionFromCertificateChainInfo:v5]];
LABEL_4:
  if (gLogObjects && gNumLogObjects >= 2)
  {
    id v9 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    id v9 = MEMORY[0x263EF8438];
    id v10 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_21DC52000, v9, OS_LOG_TYPE_DEFAULT, "copyLeafCertificateSerialNumber: certSerial %@, certificateInfo %@", (uint8_t *)&v13, 0x16u);
  }

  return v8;
}

- (BOOL)verifyCertificateSerialNumberBySerialNumber:(id)a3 authVer:(int)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (!v5)
  {
    BOOL v24 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v24) {
      -[MFAACertificateManager verifyCertificateSerialNumberBySerialNumber:authVer:](v24, v25, v26, v27, v28, v29, v30, v31);
    }
    goto LABEL_26;
  }
  id v7 = v5;
  id v8 = (unsigned __int8 *)[v7 bytes];
  uint64_t v9 = [v7 length];
  if (!v8)
  {
    BOOL v32 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v32) {
      -[MFAACertificateManager verifyCertificateSerialNumberBySerialNumber:authVer:](v32, v33, v34, v35, v36, v37, v38, v39);
    }
    goto LABEL_26;
  }
  if (a4 == 2 && v9 == 15)
  {
    unint64_t v10 = (((unint64_t)*v8 << 56) | ((unint64_t)v8[1] << 48) | ((unint64_t)v8[3] << 40) | ((unint64_t)v8[4] << 32) | ((unint64_t)v8[5] << 24) | ((unint64_t)v8[7] << 16) | ((unint64_t)v8[9] << 8))
        + v8[10];
    int v11 = v8[12];
    int v12 = v8[13];
    int v13 = v8[14];
    int NumRevokedAuthICBatches = getNumRevokedAuthICBatches();
    RevokedAuthICBatches = getRevokedAuthICBatches();
    int v16 = MFAAPrefixesBinarySearch((uint64_t)RevokedAuthICBatches, v10, NumRevokedAuthICBatches);
    if (v16 != -1
      && MFAABatchBinarySearch(RevokedAuthICBatches[3 * v16 + 2], (v11 << 16) | (v12 << 8) | v13, RevokedAuthICBatches[3 * v16 + 1]))
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAACertificateManager verifyCertificateSerialNumberBySerialNumber:authVer:].cold.4();
      }
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAACertificateManager verifyCertificateSerialNumberBySerialNumber:authVer:]((uint64_t)v8, v17, v18, v19, v20, v21, v22, v23);
      }
LABEL_26:
      BOOL v43 = 0;
      goto LABEL_27;
    }
  }
  else
  {
    if (a4 != 3 || v9 != 16)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAACertificateManager verifyCertificateSerialNumberBySerialNumber:authVer:].cold.7();
      }
      goto LABEL_26;
    }
    if ((char)*v8 < 0)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAACertificateManager verifyCertificateSerialNumberBySerialNumber:authVer:].cold.6((uint64_t)v8, v44, v45, v46, v47, v48, v49, v50);
      }
      goto LABEL_26;
    }
    unint64_t v40 = ((unint64_t)*v8 << 40) | ((unint64_t)v8[1] << 32) | ((unint64_t)v8[2] << 24) | ((unint64_t)v8[3] << 16) | ((unint64_t)v8[4] << 8) | v8[5];
    int NumRevokedAuth3Wafers = getNumRevokedAuth3Wafers();
    RevokedAuth3Wafers = getRevokedAuth3Wafers();
    if (MFAAWaferBinarySearch((uint64_t)RevokedAuth3Wafers, v40, NumRevokedAuth3Wafers))
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAACertificateManager verifyCertificateSerialNumberBySerialNumber:authVer:].cold.5();
      }
      goto LABEL_26;
    }
  }
  BOOL v43 = 1;
LABEL_27:

  return v43;
}

- (BOOL)verifyCertificateSerialNumber:(id)a3 authVer:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (!v6)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
      -[MFAACertificateManager verifyCertificateSerialNumber:authVer:]();
    }
    goto LABEL_9;
  }
  id v7 = [(MFAACertificateManager *)self copyCertificateSerialNumber:v6 authVer:v4];
  if (!v7)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
      -[MFAACertificateManager verifyCertificateSerialNumber:authVer:]();
    }
LABEL_9:
    id v8 = 0;
    goto LABEL_10;
  }
  id v8 = v7;
  if ([(MFAACertificateManager *)self verifyCertificateSerialNumberBySerialNumber:v7 authVer:v4])
  {
    BOOL v9 = 1;
    goto LABEL_13;
  }
LABEL_10:
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    -[MFAACertificateManager verifyCertificateSerialNumber:authVer:](v8);
  }
  BOOL v9 = 0;
LABEL_13:

  return v9;
}

- (BOOL)verifyCertificateChainInfoSerialNumber:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    id v7 = logObjectForModule(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MFAACertificateManager copyEvaluatedCertificateChainInfo:forSpecificType:]();
    }
    goto LABEL_27;
  }
  uint64_t v6 = [v4 objectForKey:@"LeafCertData"];
  if (!v6)
  {
    id v7 = logObjectForModule(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MFAACertificateManager verifyCertificateChainInfoSerialNumber:]();
    }
LABEL_27:
    BOOL v9 = 0;
    goto LABEL_14;
  }
  id v7 = v6;
  uint64_t v8 = [(MFAACertificateManager *)self authVersionFromCertificateChainInfo:v5];
  if ((v8 & 0xFFFFFFFE) == 2)
  {
    BOOL v9 = [(MFAACertificateManager *)self verifyCertificateSerialNumber:v7 authVer:v8];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      unint64_t v10 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAATokenManager _init]();
      }
      unint64_t v10 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 67109120;
      BOOL v16 = v8;
      _os_log_impl(&dword_21DC52000, v10, OS_LOG_TYPE_DEFAULT, "No certSerial support for auth type %d, skip", (uint8_t *)&v15, 8u);
    }

    BOOL v9 = 1;
  }
LABEL_14:

  if (gLogObjects && gNumLogObjects >= 2)
  {
    int v12 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    int v12 = MEMORY[0x263EF8438];
    id v13 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 67109378;
    BOOL v16 = v9;
    __int16 v17 = 2112;
    uint64_t v18 = v5;
    _os_log_impl(&dword_21DC52000, v12, OS_LOG_TYPE_DEFAULT, "verifyCertificateLeafSerialNumber: bSerNumValid %d, certificateInfo %@", (uint8_t *)&v15, 0x12u);
  }

  return v9;
}

- (BOOL)verifyNonceSignature:(id)a3 nonce:(id)a4 signature:(id)a5
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v8 = a3;
  CFDataRef v9 = (const __CFData *)a4;
  CFDataRef v10 = (const __CFData *)a5;
  CFDataRef v11 = v10;
  CFErrorRef error = 0;
  SecTrustRef trust = 0;
  CFDataRef v92 = v9;
  if (!v8)
  {
    id v80 = logObjectForModule(1);
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
      -[MFAACertificateManager copyEvaluatedCertificateChainInfo:forSpecificType:]();
    }
    goto LABEL_99;
  }
  if (!v9)
  {
    id v80 = logObjectForModule(1);
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
      -[MFAACertificateManager verifyNonceSignature:nonce:signature:]();
    }
    goto LABEL_99;
  }
  if (!v10)
  {
    id v80 = logObjectForModule(1);
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
      -[MFAACertificateManager verifyNonceSignature:nonce:signature:].cold.4();
    }
    goto LABEL_99;
  }
  uint64_t v12 = [v8 objectForKey:@"LeafCertData"];
  if (!v12)
  {
    id v80 = logObjectForModule(1);
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
      -[MFAACertificateManager verifyCertificateChainInfoSerialNumber:]();
    }
LABEL_99:

    id v13 = 0;
LABEL_100:
    unint64_t v91 = 0;
    uint64_t v27 = 0;
    uint64_t v30 = 0;
    BOOL v49 = 0;
    goto LABEL_65;
  }
  id v13 = (void *)v12;
  uint64_t v14 = [v8 objectForKey:@"FullCertData"];
  if (!v14)
  {
    v81 = logObjectForModule(1);
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
      -[MFAACertificateManager verifyNonceSignature:nonce:signature:].cold.6();
    }

    goto LABEL_100;
  }
  int v15 = (void *)v14;
  int v16 = [(MFAACertificateManager *)self authVersionFromCertificateChainInfo:v8];
  unint64_t v91 = v15;
  if ((v16 - 4) <= 0xFFFFFFFD)
  {
    __int16 v17 = self;
    id v18 = v13;
    [v18 bytes];
    [v18 length];
    uint64_t v19 = (__SecCertificate *)SecCertificateCreateWithBytes();
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = SecCertificateCopyKey(v19);
      if (v21)
      {
        uint64_t v22 = v21;
        int v23 = SecKeyVerifySignature(v21, (SecKeyAlgorithm)*MEMORY[0x263F172E8], v9, v11, &error);
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)id v96 = v23 != 0;
          *(_WORD *)&v96[4] = 2112;
          *(void *)&v96[6] = error;
          _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "signatureValidNoCertCheck for kSecKeyAlgorithmECDSASignatureMessageX962SHA256 = %d, error %@", buf, 0x12u);
        }
        if (error)
        {
          CFRelease(error);
          CFErrorRef error = 0;
        }
        if (v23)
        {
          BOOL v24 = 1;
          self = v17;
        }
        else
        {
          int v40 = SecKeyVerifySignature(v22, (SecKeyAlgorithm)*MEMORY[0x263F17300], v9, v11, &error);
          BOOL v24 = v40 != 0;
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)id v96 = v40 != 0;
            *(_WORD *)&v96[4] = 2112;
            *(void *)&v96[6] = error;
            _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "signatureValidNoCertCheck for kSecKeyAlgorithmECDSASignatureRFC4754 = %d, error %@", buf, 0x12u);
          }
          self = v17;
          if (error)
          {
            CFRelease(error);
            CFErrorRef error = 0;
          }
        }
        CFRelease(v22);
        uint64_t v27 = 0;
      }
      else
      {
        SecCertificateRef v84 = logObjectForModule(1);
        if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
          -[MFAACertificateManager verifyNonceSignature:nonce:signature:].cold.8();
        }

        uint64_t v27 = 0;
        BOOL v24 = 0;
        self = v17;
      }
      goto LABEL_35;
    }
    id v82 = logObjectForModule(1);
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
      -[MFAACertificateManager verifyNonceSignature:nonce:signature:].cold.7();
    }

    uint64_t v27 = 0;
    uint64_t v30 = 0;
    BOOL v49 = 0;
    BOOL v24 = 0;
    id v13 = v18;
    goto LABEL_110;
  }
  SecCertificateRef v25 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFDataRef)v13);
  if (v25)
  {
    uint64_t v20 = v25;
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
    if (Mutable)
    {
      uint64_t v27 = Mutable;
      CFArrayAppendValue(Mutable, v20);
      uint64_t v28 = (const void *)SecPolicyCreateiAP();
      if (v28)
      {
        uint64_t v29 = v28;
        SecTrustCreateWithCertificates(v27, v28, &trust);
        if (!trust)
        {
          BOOL v55 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
          if (v55) {
            -[MFAACertificateManager verifyNonceSignature:nonce:signature:]2(v55, v56, v57, v58, v59, v60, v61, v62);
          }
          uint64_t v30 = 0;
          BOOL v49 = 0;
          goto LABEL_64;
        }
        *(_DWORD *)buf = 0;
        uint64_t v30 = MFAACreateAnchorCertificateAuthorityArray(v16);
        if (v30)
        {
          uint64_t v90 = self;
          SecTrustSetAnchorCertificates(trust, v30);
          if (MEMORY[0x223C170E0](trust, buf))
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[MFAACertificateManager verifyNonceSignature:nonce:signature:]9();
            }
LABEL_23:
            int v31 = 0;
LABEL_63:
            BOOL v49 = v31 != 0;
LABEL_64:
            CFRelease(v20);
            CFRelease(v29);
LABEL_65:
            BOOL v24 = 0;
            goto LABEL_36;
          }
          if (*(_DWORD *)buf == 4 || *(_DWORD *)buf == 1)
          {
            uint64_t v71 = MEMORY[0x223C170C0](trust);
            if (!v71)
            {
              id v78 = logObjectForModule(-1);
              if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
                -[MFAACertificateManager verifyNonceSignature:nonce:signature:]5();
              }

              goto LABEL_23;
            }
            uint64_t v72 = (__SecKey *)v71;
            CFDataRef v73 = v92;
            cf = (const uint8_t *)[(__CFData *)v73 bytes];
            size_t v86 = [(__CFData *)v73 length];
            CFDataRef v74 = v11;
            sig = (uint8_t *)[(__CFData *)v74 bytes];
            size_t v75 = [(__CFData *)v74 length];
            if (v16 == 2)
            {
              SecPadding v76 = 32770;
            }
            else
            {
              if (v16 != 3)
              {
                cfa = v72;
                id v79 = logObjectForModule(-1);
                if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
                  -[MFAACertificateManager verifyNonceSignature:nonce:signature:]6();
                }
                int v31 = 1;
                goto LABEL_88;
              }
              SecPadding v76 = 0x4000;
            }
            if (!SecKeyRawVerify(v72, v76, cf, v86, sig, v75))
            {
              int v31 = 1;
              self = v90;
              goto LABEL_90;
            }
            id v87 = logObjectForModule(-1);
            if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
              -[MFAACertificateManager verifyNonceSignature:nonce:signature:]8();
            }
            cfa = v72;

            id v79 = logObjectForModule(-1);
            if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
              -[MFAACertificateManager verifyNonceSignature:nonce:signature:]7();
            }
            int v31 = 0;
LABEL_88:
            self = v90;

            uint64_t v72 = cfa;
LABEL_90:
            CFRelease(v72);
            goto LABEL_63;
          }
          v77 = logObjectForModule(-1);
          if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
            -[MFAACertificateManager verifyNonceSignature:nonce:signature:]4();
          }
        }
        else
        {
          BOOL v63 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
          if (v63) {
            -[MFAACertificateManager verifyNonceSignature:nonce:signature:]3(v63, v64, v65, v66, v67, v68, v69, v70);
          }
        }
        int v31 = 0;
        goto LABEL_63;
      }
      BOOL v41 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (v41) {
        -[MFAACertificateManager verifyNonceSignature:nonce:signature:]1(v41, v42, v43, v44, v45, v46, v47, v48);
      }
    }
    else
    {
      BOOL v32 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (v32) {
        -[MFAACertificateManager verifyNonceSignature:nonce:signature:]0(v32, v33, v34, v35, v36, v37, v38, v39);
      }
      uint64_t v27 = 0;
    }
    BOOL v24 = 0;
LABEL_35:
    CFRelease(v20);
    uint64_t v30 = 0;
    BOOL v49 = 0;
    goto LABEL_36;
  }
  __int16 v17 = self;
  CFDataRef v83 = logObjectForModule(1);
  if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
    -[MFAACertificateManager verifyNonceSignature:nonce:signature:].cold.7();
  }

  uint64_t v27 = 0;
  uint64_t v30 = 0;
  BOOL v49 = 0;
  BOOL v24 = 0;
LABEL_110:
  self = v17;
LABEL_36:
  if (trust)
  {
    CFRelease(trust);
    SecTrustRef trust = 0;
  }
  if (v30) {
    CFRelease(v30);
  }
  if (v27) {
    CFRelease(v27);
  }
  if (v49)
  {
    LOBYTE(v24) = 1;
  }
  else
  {
    id v50 = [(MFAACertificateManager *)self copyLeafCertificateSerialNumber:v8];
    if (gLogObjects && gNumLogObjects >= 2)
    {
      CFArrayRef v51 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAATokenManager _init]();
      }
      CFArrayRef v51 = MEMORY[0x263EF8438];
      id v52 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      uint64_t v53 = [v50 length];
      *(_DWORD *)buf = 138478083;
      *(void *)id v96 = v50;
      *(_WORD *)&v96[8] = 2048;
      *(void *)&v96[10] = v53;
      _os_log_impl(&dword_21DC52000, v51, OS_LOG_TYPE_INFO, "certSerial: %{private}@, certSerial.length: %lu", buf, 0x16u);
    }

    if (v24 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "auth cert validity check failed, but signature was signed by certificate ... treating as success", buf, 2u);
    }
  }
  return v24;
}

- (id)createVeridianNonce:(id)a3 withChallenge:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF990] dataWithData:v6];
  [v7 appendData:v5];
  id v8 = (void *)SecSHA256DigestCreateFromData();
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138413058;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    int v15 = v7;
    __int16 v16 = 2112;
    __int16 v17 = v8;
    _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "createVeridianNonce: %@ + %@ -> %@ -> %@", (uint8_t *)&v10, 0x2Au);
  }

  return v8;
}

- (int)_validateCertificateChain:(id)a3 realtime:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v130[4] = *MEMORY[0x263EF8340];
  id v8 = a3;
  unint64_t v9 = 0x26AC05000uLL;
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects < 2;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    __int16 v12 = MEMORY[0x263EF8438];
    id v11 = MEMORY[0x263EF8438];
  }
  else
  {
    __int16 v12 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DC52000, v12, OS_LOG_TYPE_DEFAULT, "Validating certificate... (internal)", buf, 2u);
  }

  if (systemInfo_isInternalBuild())
  {
    id v13 = [(MFAACertificateManager *)self userDefaults];
    __int16 v14 = [v13 stringForKey:@"SpoofCertificateStatus"];

    if (v14)
    {
      v129[0] = @"default";
      v129[1] = @"valid";
      v130[0] = &unk_26CE91DE8;
      v130[1] = &unk_26CE91E00;
      v129[2] = @"invalid";
      v129[3] = @"revoked";
      v130[2] = &unk_26CE91E18;
      v130[3] = &unk_26CE91E30;
      int v15 = [NSDictionary dictionaryWithObjects:v130 forKeys:v129 count:4];
      __int16 v16 = [v15 objectForKeyedSubscript:v14];

      if (v16)
      {
        __int16 v17 = [v15 objectForKeyedSubscript:v14];
        unsigned int v18 = [v17 intValue];

        if (v18)
        {
          if (gLogObjects && gNumLogObjects >= 2)
          {
            uint64_t v19 = *(id *)(gLogObjects + 8);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[MFAATokenManager _init]();
            }
            uint64_t v19 = MEMORY[0x263EF8438];
            id v21 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v18;
            _os_log_impl(&dword_21DC52000, v19, OS_LOG_TYPE_DEFAULT, "Spoofing certificate status: %{coreacc:MFAACertificateManager_CertStatus_t}d", buf, 8u);
          }

          id v22 = 0;
          goto LABEL_251;
        }
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 2)
        {
          uint64_t v20 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[MFAATokenManager _init]();
          }
          uint64_t v20 = MEMORY[0x263EF8438];
          id v23 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[MFAACertificateManager _validateCertificateChain:realtime:error:]6((uint64_t)v14, v20, v24, v25, v26, v27, v28, v29);
        }
      }
    }
  }
  id v30 = [v8 objectAtIndex:0];

  if (v30)
  {
    CFDataRef v31 = SecCertificateCopySerialNumberData((SecCertificateRef)v30, 0);
    if (gLogObjects && gNumLogObjects >= 2)
    {
      BOOL v32 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAATokenManager _init]();
      }
      BOOL v32 = MEMORY[0x263EF8438];
      id v34 = MEMORY[0x263EF8438];
    }
    BOOL v111 = v6;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v31;
      _os_log_impl(&dword_21DC52000, v32, OS_LOG_TYPE_DEFAULT, "certSerial: %@", buf, 0xCu);
    }

    uint64_t v35 = SecCertificateCopyIssuerSummary();
    if (gLogObjects && gNumLogObjects >= 2)
    {
      uint64_t v36 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAATokenManager _init]();
      }
      uint64_t v36 = MEMORY[0x263EF8438];
      id v37 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v35;
      _os_log_impl(&dword_21DC52000, v36, OS_LOG_TYPE_DEFAULT, "certIssuer: %@", buf, 0xCu);
    }

    uint64_t v38 = (void *)MEMORY[0x263EFF910];
    SecCertificateNotValidBefore();
    v117 = objc_msgSend(v38, "dateWithTimeIntervalSinceReferenceDate:");
    uint64_t v39 = (void *)MEMORY[0x263EFF910];
    SecCertificateNotValidAfter();
    v116 = objc_msgSend(v39, "dateWithTimeIntervalSinceReferenceDate:");
    if (gLogObjects && gNumLogObjects >= 2)
    {
      int v40 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAATokenManager _init]();
      }
      int v40 = MEMORY[0x263EF8438];
      id v41 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v116;
      *(_WORD *)&buf[12] = 2112;
      uint64_t v125 = (uint64_t)v117;
      _os_log_impl(&dword_21DC52000, v40, OS_LOG_TYPE_DEFAULT, "expirationDate: %@, issueDate: %@", buf, 0x16u);
    }

    v115 = (void *)SecCertificateCopySubjectString();
    if (gLogObjects && gNumLogObjects >= 2)
    {
      uint64_t v42 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAATokenManager _init]();
      }
      uint64_t v42 = MEMORY[0x263EF8438];
      id v43 = MEMORY[0x263EF8438];
    }
    v112 = (void *)v35;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v115;
      _os_log_impl(&dword_21DC52000, v42, OS_LOG_TYPE_DEFAULT, "certSubject: %@", buf, 0xCu);
    }

    int v44 = SecCertificateGetiAuthVersion();
    if (gLogObjects && gNumLogObjects >= 2)
    {
      uint64_t v45 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAATokenManager _init]();
      }
      uint64_t v45 = MEMORY[0x263EF8438];
      id v46 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v44;
      _os_log_impl(&dword_21DC52000, v45, OS_LOG_TYPE_DEFAULT, "authVersion: %{coreacc:SeciAuthVersion}d", buf, 8u);
    }

    v113 = (void *)SecCertificateCopyComponentType();
    CFDataRef v114 = v31;
    if (!v113)
    {
      if (v44 == 4) {
        goto LABEL_92;
      }
      uint64_t v48 = v112;
      if (!v44)
      {
        if (gLogObjects && gNumLogObjects >= 2)
        {
          BOOL v49 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[MFAATokenManager _init]();
          }
          BOOL v49 = MEMORY[0x263EF8438];
          id v101 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
          -[MFAACertificateManager _validateCertificateChain:realtime:error:].cold.6();
        }

        objc_msgSend(MEMORY[0x263F087E8], "MFAA_errorWithDomain:code:", @"MFAACertificateManagerErrorDomain", -3);
        id v22 = (id)objc_claimAutoreleasedReturnValue();
        unsigned int v18 = 2;
        goto LABEL_250;
      }
      uint64_t v65 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
      if (v65)
      {
        if ([v8 count])
        {
          unint64_t v66 = 0;
          do
          {
            CFDataRef v67 = SecCertificateCopyData((SecCertificateRef)[v8 objectAtIndex:v66]);
            [v65 addObject:v67];

            ++v66;
          }
          while ([v8 count] > v66);
        }
        if (MFAAVerifyPublicCertificateChain((const __CFArray *)v65)) {
          unsigned int v18 = 1;
        }
        else {
          unsigned int v18 = 2;
        }
        uint64_t v48 = v112;
      }
      else
      {
        unsigned int v18 = 0;
      }

LABEL_249:
      id v22 = 0;
LABEL_250:
      CFRelease(v30);

      goto LABEL_251;
    }
    if (gLogObjects && gNumLogObjects >= 2)
    {
      uint64_t v47 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAATokenManager _init]();
      }
      uint64_t v47 = MEMORY[0x263EF8438];
      id v50 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v113;
      _os_log_impl(&dword_21DC52000, v47, OS_LOG_TYPE_DEFAULT, "componentType is present in certificate, value is %@", buf, 0xCu);
    }

    if (v44 == 4)
    {
LABEL_92:
      v110 = a5;
      *(void *)v128 = 0;
      int v51 = mfaa_certificateManager_SWAuthCertType((uint64_t)v30);
      if ((systemInfo_isInternalBuild() & 1) == 0 && (systemInfo_isDeveloperBuild() & 1) == 0 && v51 != 1)
      {
        uint64_t v109 = logObjectForModule(1);
        if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR)) {
          -[MFAACertificateManager _validateCertificateChain:realtime:error:]7();
        }

        id v22 = 0;
        unsigned int v18 = 2;
        goto LABEL_234;
      }
      id v52 = [(MFAACertificateManager *)self userDefaults];
      int v53 = [v52 BOOLForKey:@"BypassCertificateExpirationCheck"];

      if (gLogObjects) {
        BOOL v54 = gNumLogObjects <= 1;
      }
      else {
        BOOL v54 = 1;
      }
      int v55 = !v54;
      if (v53)
      {
        if (v55)
        {
          uint64_t v56 = *(id *)(gLogObjects + 8);
          unint64_t v9 = 0x26AC05000;
        }
        else
        {
          unint64_t v9 = 0x26AC05000;
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[MFAATokenManager _init]();
          }
          uint64_t v56 = MEMORY[0x263EF8438];
          id v68 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = "NO";
          _os_log_impl(&dword_21DC52000, v56, OS_LOG_TYPE_DEFAULT, "enforceExpiration: %s (overridden by internal setting)", buf, 0xCu);
        }
      }
      else
      {
        if (v55)
        {
          uint64_t v56 = *(id *)(gLogObjects + 8);
          unint64_t v9 = 0x26AC05000;
        }
        else
        {
          unint64_t v9 = 0x26AC05000uLL;
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[MFAATokenManager _init]();
          }
          uint64_t v56 = MEMORY[0x263EF8438];
          id v69 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v70 = "NO";
          if (v51 == 2) {
            uint64_t v70 = "YES";
          }
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = v70;
          _os_log_impl(&dword_21DC52000, v56, OS_LOG_TYPE_DEFAULT, "enforceExpiration: %s", buf, 0xCu);
        }
      }

      uint64_t v71 = (const void *)SecPolicyCreateiAPSWAuthWithExpiration();
      if (!v71)
      {
        unsigned int v18 = 0;
        id v22 = 0;
LABEL_234:
        uint64_t v48 = v112;
        if (*(void *)v128) {
          CFRelease(*(CFTypeRef *)v128);
        }
        goto LABEL_250;
      }
      uint64_t v72 = v71;
      if (SecTrustCreateWithCertificates(v30, v71, (SecTrustRef *)v128)) {
        goto LABEL_272;
      }
      CFDataRef v73 = *(__SecTrust **)v128;
      if (_anchorCertsForSWAuth_onceToken != -1) {
        dispatch_once(&_anchorCertsForSWAuth_onceToken, &__block_literal_global_208);
      }
      uint64_t v74 = *(void *)(v9 + 1688);
      if (v74 && gNumLogObjects >= 2)
      {
        size_t v75 = *(id *)(v74 + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[MFAATokenManager _init]();
        }
        size_t v75 = MEMORY[0x263EF8438];
        id v76 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
      {
        uint64_t v77 = [(id)_anchorCertsForSWAuth_anchorCerts count];
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v77;
        _os_log_impl(&dword_21DC52000, v75, OS_LOG_TYPE_INFO, "%lu anchor cert(s) returned for SW Auth", buf, 0xCu);
      }

      SecTrustSetAnchorCertificates(v73, (CFArrayRef) (id) _anchorCertsForSWAuth_anchorCerts);
      int v123 = 0;
      if (MEMORY[0x223C170E0](*(void *)v128, &v123))
      {
LABEL_272:
        id v22 = 0;
        unsigned int v18 = 0;
      }
      else
      {
        uint64_t v78 = *(void *)(v9 + 1688);
        if (v78 && gNumLogObjects >= 2)
        {
          id v79 = *(id *)(v78 + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[MFAATokenManager _init]();
          }
          id v79 = MEMORY[0x263EF8438];
          id v80 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v123;
          _os_log_impl(&dword_21DC52000, v79, OS_LOG_TYPE_DEFAULT, "trustResult: %d", buf, 8u);
        }

        int v81 = v123;
        if (v123 == 4)
        {
          unsigned int v18 = 1;
        }
        else if (v123 == 6)
        {
          unsigned int v18 = 3;
        }
        else
        {
          *(void *)buf = 0;
          SecTrustEvaluateWithError(*(SecTrustRef *)v128, (CFErrorRef *)buf);
          if (*(void *)buf)
          {
            id v82 = logObjectForModule(1);
            if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
              -[MFAACertificateManager _validateCertificateChain:realtime:error:]2();
            }

            if (*(void *)buf) {
              CFRelease(*(CFTypeRef *)buf);
            }
          }
          unsigned int v18 = 2;
        }
        uint64_t v83 = *(void *)(v9 + 1688);
        if (v83 && gNumLogObjects >= 2)
        {
          SecCertificateRef v84 = *(id *)(v83 + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[MFAATokenManager _init]();
          }
          SecCertificateRef v84 = MEMORY[0x263EF8438];
          id v85 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v18;
          _os_log_impl(&dword_21DC52000, v84, OS_LOG_TYPE_DEFAULT, "certStatus (local): %{coreacc:MFAACertificateManager_CertStatus_t}d", buf, 8u);
        }

        if (v81 == 4)
        {
          size_t v86 = (void *)SecCertificateCopyIssuerSequence();
          uint64_t v87 = *(void *)(v9 + 1688);
          if (v87 && gNumLogObjects >= 2)
          {
            id v88 = *(id *)(v87 + 8);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[MFAATokenManager _init]();
            }
            id v88 = MEMORY[0x263EF8438];
            id v89 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG)) {
            __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_74_cold_4();
          }

          if (v86)
          {
            uint64_t v90 = (void *)SecCertificateCopyOrganization();
            unint64_t v91 = v90;
            if (v90
              && [v90 count]
              && ([v91 objectAtIndexedSubscript:0], (uint64_t v92 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              uint64_t v93 = (void *)v92;
              if (gLogObjects && gNumLogObjects >= 2)
              {
                uint64_t v94 = *(id *)(gLogObjects + 8);
              }
              else
              {
                if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
                  -[MFAATokenManager _init]();
                }
                uint64_t v94 = MEMORY[0x263EF8438];
                id v95 = MEMORY[0x263EF8438];
              }
              if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
              {
                uint64_t v96 = [(__CFData *)v114 length];
                *(_DWORD *)buf = 138478339;
                *(void *)&uint8_t buf[4] = v114;
                *(_WORD *)&buf[12] = 2048;
                uint64_t v125 = v96;
                __int16 v126 = 2113;
                v127 = v93;
                _os_log_impl(&dword_21DC52000, v94, OS_LOG_TYPE_INFO, "certSerial: %{private}@, certSerial.length: %lu, ppid: %{private}@", buf, 0x20u);
              }

              if (v111)
              {
                id v122 = 0;
                unsigned int v18 = [(MFAACertificateManager *)self _validateCertificateWithServer:v114 issuerSeq:v86 ppid:v93 error:&v122];
                id v22 = v122;
                uint64_t v97 = logObjectForModule(1);
                if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_21DC52000, v97, OS_LOG_TYPE_DEFAULT, "Finished sync server query!", buf, 2u);
                }

                long long v98 = logObjectForModule(1);
                if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)&uint8_t buf[4] = v18;
                  _os_log_impl(&dword_21DC52000, v98, OS_LOG_TYPE_DEFAULT, "certStatus (remote): %{coreacc:MFAACertificateManager_CertStatus_t}d", buf, 8u);
                }
              }
              else
              {
                unsigned int v18 = [(MFAACertificateManager *)self _getCachedCertStatus:v114 issuerSeq:v86 ppid:v93];
                long long v99 = logObjectForModule(1);
                if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&uint8_t buf[4] = 1;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v18;
                  _os_log_impl(&dword_21DC52000, v99, OS_LOG_TYPE_INFO, "certStatus: %{coreacc:MFAACertificateManager_CertStatus_t}d, cachedCertStatus: %{coreacc:MFAACertificateManager_CertStatus_t}d", buf, 0xEu);
                }

                if (v18 <= 1) {
                  unsigned int v18 = 1;
                }
                long long v100 = dispatch_get_global_queue(-32768, 0);
                block[0] = MEMORY[0x263EF8330];
                block[1] = 3221225472;
                block[2] = __67__MFAACertificateManager__validateCertificateChain_realtime_error___block_invoke;
                block[3] = &unk_264479558;
                void block[4] = self;
                CFDataRef v119 = v114;
                id v120 = v86;
                id v121 = v93;
                dispatch_async(v100, block);

                id v22 = 0;
              }
            }
            else
            {
              id v22 = 0;
              unsigned int v18 = 2;
            }
          }
          else
          {
            id v22 = 0;
            unsigned int v18 = 2;
          }

          a5 = v110;
          unint64_t v9 = 0x26AC05000;
          goto LABEL_233;
        }
        id v22 = 0;
      }
      a5 = v110;
LABEL_233:
      CFRelease(v72);
      goto LABEL_234;
    }
    *(void *)buf = 0;
    if (MFAAIsDevelopmentHW())
    {
      NSLog(&cfstr_UseBasicx509Po.isa);
      BasicX509 = SecPolicyCreateBasicX509();
    }
    else
    {
      BasicX509 = (const void *)SecPolicyCreateAppleComponentCertificate();
    }
    uint64_t v59 = BasicX509;
    if (!BasicX509)
    {
      unsigned int v18 = 0;
      uint64_t v48 = v112;
LABEL_239:
      if (*(void *)buf) {
        CFRelease(*(CFTypeRef *)buf);
      }
      goto LABEL_249;
    }
    if (SecTrustCreateWithCertificates(v8, BasicX509, (SecTrustRef *)buf)
      || (uint64_t v60 = *(__SecTrust **)buf,
          CFArrayRef v61 = (const __CFArray *)_anchorCertsForComponentAuth(),
          SecTrustSetAnchorCertificates(v60, v61),
          int v123 = 0,
          MEMORY[0x223C170E0](*(void *)buf, &v123)))
    {
      unsigned int v18 = 0;
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        uint64_t v62 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[MFAATokenManager _init]();
        }
        uint64_t v62 = MEMORY[0x263EF8438];
        id v63 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v128 = 67109120;
        *(_DWORD *)&v128[4] = v123;
        _os_log_impl(&dword_21DC52000, v62, OS_LOG_TYPE_DEFAULT, "trustResult: %d", v128, 8u);
      }

      if (v123 != 4)
      {
        uint64_t v48 = v112;
        if (v123 == 5 && SecTrustIsExpiredOnly())
        {
          unsigned int v18 = 1;
        }
        else
        {
          *(void *)v128 = 0;
          SecTrustEvaluateWithError(*(SecTrustRef *)buf, (CFErrorRef *)v128);
          if (*(void *)v128)
          {
            uint64_t v64 = logObjectForModule(1);
            if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
              -[MFAACertificateManager _validateCertificateChain:realtime:error:]2();
            }

            if (*(void *)v128) {
              CFRelease(*(CFTypeRef *)v128);
            }
          }
          unsigned int v18 = 2;
        }
        goto LABEL_238;
      }
      unsigned int v18 = 1;
    }
    uint64_t v48 = v112;
LABEL_238:
    CFRelease(v59);
    goto LABEL_239;
  }
  if (gLogObjects && gNumLogObjects >= 2)
  {
    uint64_t v33 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    uint64_t v33 = MEMORY[0x263EF8438];
    id v58 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
    -[MFAACertificateManager _validateCertificateChain:realtime:error:].cold.4();
  }

  objc_msgSend(MEMORY[0x263F087E8], "MFAA_errorWithDomain:code:", @"MFAACertificateManagerErrorDomain", -3);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  unsigned int v18 = 2;
LABEL_251:
  uint64_t v102 = *(void *)(v9 + 1688);
  if (v102 && gNumLogObjects >= 2)
  {
    uint64_t v103 = *(id *)(v102 + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    uint64_t v103 = MEMORY[0x263EF8438];
    id v104 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v18;
    _os_log_impl(&dword_21DC52000, v103, OS_LOG_TYPE_DEFAULT, "Returning certStatus: %{coreacc:MFAACertificateManager_CertStatus_t}d", buf, 8u);
  }

  if (v22)
  {
    uint64_t v105 = *(void *)(v9 + 1688);
    if (v105 && gNumLogObjects >= 2)
    {
      char v106 = *(id *)(v105 + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAATokenManager _init]();
      }
      char v106 = MEMORY[0x263EF8438];
      id v107 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR)) {
      __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_79_cold_1();
    }
  }
  if (a5) {
    *a5 = v22;
  }

  return v18;
}

void __67__MFAACertificateManager__validateCertificateChain_realtime_error___block_invoke(void *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  uint64_t v3 = a1[6];
  uint64_t v4 = a1[7];
  id v15 = 0;
  int v5 = [v2 _validateCertificateWithServer:v1 issuerSeq:v3 ppid:v4 error:&v15];
  id v6 = v15;
  if (v6)
  {
    if (gLogObjects) {
      BOOL v7 = gNumLogObjects < 2;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAATokenManager _init]();
      }
      unint64_t v9 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    else
    {
      unint64_t v9 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_74_cold_1();
    }
  }
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects < 2;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    __int16 v12 = MEMORY[0x263EF8438];
    id v11 = MEMORY[0x263EF8438];
  }
  else
  {
    __int16 v12 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DC52000, v12, OS_LOG_TYPE_DEFAULT, "Finished async server query!", buf, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 2)
  {
    id v13 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    id v13 = MEMORY[0x263EF8438];
    id v14 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v17 = v5;
    _os_log_impl(&dword_21DC52000, v13, OS_LOG_TYPE_DEFAULT, "certStatus (remote): %{coreacc:MFAACertificateManager_CertStatus_t}d)", buf, 8u);
  }
}

- (int)_validateBAACertificateChain:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  SecTrustRef trust = 0;
  AppleBasicAttestationUser = (const void *)SecPolicyCreateAppleBasicAttestationUser();
  if (AppleBasicAttestationUser)
  {
    id v6 = AppleBasicAttestationUser;
    if (SecTrustCreateWithCertificates(v4, AppleBasicAttestationUser, &trust)) {
      goto LABEL_50;
    }
    BOOL v7 = trust;
    if (_anchorCertsForBAAUser_onceToken != -1) {
      dispatch_once(&_anchorCertsForBAAUser_onceToken, &__block_literal_global_212);
    }
    if (gLogObjects && gNumLogObjects >= 2)
    {
      id v8 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAATokenManager _init]();
      }
      id v8 = MEMORY[0x263EF8438];
      id v9 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [(id)_anchorCertsForBAAUser_anchorCerts count];
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v10;
      _os_log_impl(&dword_21DC52000, v8, OS_LOG_TYPE_INFO, "%lu anchor cert(s) returned for BAA User", buf, 0xCu);
    }

    SecTrustSetAnchorCertificates(v7, (CFArrayRef) (id) _anchorCertsForBAAUser_anchorCerts);
    int v19 = 0;
    if (MEMORY[0x223C170E0](trust, &v19))
    {
LABEL_50:
      int v13 = 0;
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        id v11 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[MFAATokenManager _init]();
        }
        id v11 = MEMORY[0x263EF8438];
        id v12 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v19;
        _os_log_impl(&dword_21DC52000, v11, OS_LOG_TYPE_DEFAULT, "BAA trustResult: %d", buf, 8u);
      }

      if (v19 == 4 || v19 == 5 && SecTrustIsExpiredOnly())
      {
        int v13 = 1;
      }
      else
      {
        *(void *)buf = 0;
        SecTrustEvaluateWithError(trust, (CFErrorRef *)buf);
        if (*(void *)buf)
        {
          if (gLogObjects && gNumLogObjects >= 2)
          {
            id v14 = *(id *)(gLogObjects + 8);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[MFAATokenManager _init]();
            }
            id v14 = MEMORY[0x263EF8438];
            id v15 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            -[MFAACertificateManager _validateCertificateChain:realtime:error:]2();
          }

          if (*(void *)buf) {
            CFRelease(*(CFTypeRef *)buf);
          }
        }
        int v13 = 2;
      }
      if (gLogObjects && gNumLogObjects >= 2)
      {
        __int16 v16 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[MFAATokenManager _init]();
        }
        __int16 v16 = MEMORY[0x263EF8438];
        id v17 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v13;
        _os_log_impl(&dword_21DC52000, v16, OS_LOG_TYPE_DEFAULT, "after verifying BAA cert chain, certStatus = %d", buf, 8u);
      }
    }
    CFRelease(v6);
    if (trust) {
      CFRelease(trust);
    }
  }
  else
  {
    int v13 = 2;
  }

  return v13;
}

- (int)_validateX509CertificateChain:(id)a3 anchorCerts:(id)a4 error:(id *)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  CFArrayRef v7 = (const __CFArray *)a4;
  SecTrustRef trust = 0;
  SecPolicyRef BasicX509 = SecPolicyCreateBasicX509();
  if (BasicX509)
  {
    SecPolicyRef v9 = BasicX509;
    if (SecTrustCreateWithCertificates(v6, BasicX509, &trust)
      || (SecTrustSetAnchorCertificates(trust, v7), int v18 = 0, MEMORY[0x223C170E0](trust, &v18)))
    {
      int v12 = 0;
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        uint64_t v10 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[MFAATokenManager _init]();
        }
        uint64_t v10 = MEMORY[0x263EF8438];
        id v11 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v18;
        _os_log_impl(&dword_21DC52000, v10, OS_LOG_TYPE_DEFAULT, "X509 trustResult: %d", buf, 8u);
      }

      if (v18 == 4 || v18 == 5 && SecTrustIsExpiredOnly())
      {
        int v12 = 1;
      }
      else
      {
        *(void *)buf = 0;
        SecTrustEvaluateWithError(trust, (CFErrorRef *)buf);
        if (*(void *)buf)
        {
          if (gLogObjects && gNumLogObjects >= 2)
          {
            int v13 = *(id *)(gLogObjects + 8);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[MFAATokenManager _init]();
            }
            int v13 = MEMORY[0x263EF8438];
            id v14 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            -[MFAACertificateManager _validateCertificateChain:realtime:error:]2();
          }

          if (*(void *)buf) {
            CFRelease(*(CFTypeRef *)buf);
          }
        }
        int v12 = 2;
      }
      if (gLogObjects && gNumLogObjects >= 2)
      {
        id v15 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[MFAATokenManager _init]();
        }
        id v15 = MEMORY[0x263EF8438];
        id v16 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v12;
        _os_log_impl(&dword_21DC52000, v15, OS_LOG_TYPE_DEFAULT, "after verifying standard X509 cert chain, certStatus = %d", buf, 8u);
      }
    }
    CFRelease(v9);
    if (trust) {
      CFRelease(trust);
    }
  }
  else
  {
    int v12 = 2;
  }

  return v12;
}

- (int)_validateCertificateWithServer:(id)a3 issuerSeq:(id)a4 ppid:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x2020000000;
  int v44 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = __Block_byref_object_copy_;
  uint64_t v39 = __Block_byref_object_dispose_;
  id v40 = 0;
  if (gLogObjects && gNumLogObjects >= 2)
  {
    int v13 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    int v13 = MEMORY[0x263EF8438];
    id v14 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DC52000, v13, OS_LOG_TYPE_DEFAULT, "Validating certificate with server...", buf, 2u);
  }

  dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
  id v16 = [(MFAACertificateManager *)self xpcConnection];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __78__MFAACertificateManager__validateCertificateWithServer_issuerSeq_ppid_error___block_invoke;
  v31[3] = &unk_264479580;
  uint64_t v33 = &v35;
  id v17 = v15;
  BOOL v32 = v17;
  int v18 = [v16 remoteObjectProxyWithErrorHandler:v31];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __78__MFAACertificateManager__validateCertificateWithServer_issuerSeq_ppid_error___block_invoke_128;
  v27[3] = &unk_2644795A8;
  uint64_t v29 = &v41;
  id v30 = &v35;
  int v19 = v17;
  uint64_t v28 = v19;
  [v18 validateCertSerial:v10 issuerSeq:v11 ppid:v12 withReply:v27];

  dispatch_time_t v20 = dispatch_time(0, 65000000000);
  if (dispatch_semaphore_wait(v19, v20))
  {
    uint64_t v21 = objc_msgSend(MEMORY[0x263F087E8], "MFAA_errorWithDomain:code:description:", @"MFAACertificateManagerErrorDomain", -4, @"Timed out waiting for XPC reply!");
    uint64_t v22 = (void *)v36[5];
    v36[5] = v21;
  }
  if (v36[5])
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      id v23 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAATokenManager _init]();
      }
      id v23 = MEMORY[0x263EF8438];
      id v24 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[MFAACertificateManager _validateCertificateWithServer:issuerSeq:ppid:error:]();
    }
  }
  if (a6) {
    *a6 = (id) v36[5];
  }
  int v25 = *((_DWORD *)v42 + 6);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  return v25;
}

void __78__MFAACertificateManager__validateCertificateWithServer_issuerSeq_ppid_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 2;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    id v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    id v6 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_79_cold_3();
  }

  CFArrayRef v7 = (void *)MEMORY[0x263F087E8];
  id v8 = [v3 description];
  uint64_t v9 = objc_msgSend(v7, "MFAA_errorWithDomain:code:description:", @"MFAACertificateManagerErrorDomain", -4, v8);
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __78__MFAACertificateManager__validateCertificateWithServer_issuerSeq_ppid_error___block_invoke_128(uint64_t a1, int a2, id obj)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (int)_getCachedCertStatus:(id)a3 issuerSeq:(id)a4 ppid:(id)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x2020000000;
  int v41 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy_;
  uint64_t v36 = __Block_byref_object_dispose_;
  id v37 = 0;
  if (gLogObjects && gNumLogObjects >= 2)
  {
    id v11 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    id v11 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v43 = v8;
    _os_log_impl(&dword_21DC52000, v11, OS_LOG_TYPE_DEFAULT, "Checking cached cert status... (certSerial: %{private}@)", buf, 0xCu);
  }

  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  id v14 = [(MFAACertificateManager *)self xpcConnection];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __62__MFAACertificateManager__getCachedCertStatus_issuerSeq_ppid___block_invoke;
  v29[3] = &unk_264479580;
  CFDataRef v31 = &v32;
  dispatch_semaphore_t v15 = v13;
  id v30 = v15;
  id v16 = [v14 remoteObjectProxyWithErrorHandler:v29];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __62__MFAACertificateManager__getCachedCertStatus_issuerSeq_ppid___block_invoke_133;
  v25[3] = &unk_2644795A8;
  uint64_t v27 = &v38;
  uint64_t v28 = &v32;
  id v17 = v15;
  uint64_t v26 = v17;
  [v16 getCachedStatusForCertSerial:v8 issuerSeq:v9 ppid:v10 withReply:v25];

  dispatch_time_t v18 = dispatch_time(0, 65000000000);
  if (dispatch_semaphore_wait(v17, v18))
  {
    uint64_t v19 = objc_msgSend(MEMORY[0x263F087E8], "MFAA_errorWithDomain:code:description:", @"MFAACertificateManagerErrorDomain", -4, @"Timed out waiting for XPC reply!");
    dispatch_time_t v20 = (void *)v33[5];
    v33[5] = v19;
  }
  if (v33[5])
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      uint64_t v21 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAATokenManager _init]();
      }
      uint64_t v21 = MEMORY[0x263EF8438];
      id v22 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[MFAACertificateManager _validateCertificateWithServer:issuerSeq:ppid:error:]();
    }
  }
  int v23 = *((_DWORD *)v39 + 6);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v23;
}

void __62__MFAACertificateManager__getCachedCertStatus_issuerSeq_ppid___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 2;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    id v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    id v6 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_79_cold_3();
  }

  CFArrayRef v7 = (void *)MEMORY[0x263F087E8];
  id v8 = [v3 description];
  uint64_t v9 = objc_msgSend(v7, "MFAA_errorWithDomain:code:description:", @"MFAACertificateManagerErrorDomain", -4, v8);
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __62__MFAACertificateManager__getCachedCertStatus_issuerSeq_ppid___block_invoke_133(uint64_t a1, int a2, id obj)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)_anchorCertificatesDataForTypes:(int)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  BOOL v4 = [MEMORY[0x263EFF980] array];
  init_logging();
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 2;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    CFArrayRef v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    CFArrayRef v7 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v34 = 67109120;
    LODWORD(v35) = a3;
    _os_log_impl(&dword_21DC52000, v7, OS_LOG_TYPE_INFO, "Generating anchor cert(s) for types: 0x%02X", (uint8_t *)&v34, 8u);
  }

  if (a3)
  {
    id v8 = [MEMORY[0x263EFF8F8] dataWithBytes:&kiPodAccessoryCA1 length:1091];
    [v4 addObject:v8];

    uint64_t v9 = [MEMORY[0x263EFF8F8] dataWithBytes:&kiPodAccessoryCA2 length:1026];
    [v4 addObject:v9];
  }
  if ((a3 & 2) != 0)
  {
    uint64_t v10 = [MEMORY[0x263EFF8F8] dataWithBytes:kAuth3ECSSubCAProd length:667];
    [v4 addObject:v10];

    id v11 = [MEMORY[0x263EFF8F8] dataWithBytes:kAuth3ECSSubCADev length:667];
    [v4 addObject:v11];

    id v12 = [MEMORY[0x263EFF8F8] dataWithBytes:kiPodAccessoryTestAuth3CA length:667];
    [v4 addObject:v12];

    if (systemInfo_isInternalBuild())
    {
      dispatch_semaphore_t v13 = [MEMORY[0x263EFF8F8] dataWithBytes:kiPodAccessoryTestCAProto length:637];
      [v4 addObject:v13];

      id v14 = [MEMORY[0x263EFF8F8] dataWithBytes:kAuth3ECSSubCASimu length:667];
      [v4 addObject:v14];

      dispatch_semaphore_t v15 = [MEMORY[0x263EFF8F8] dataWithBytes:kAuth3ECSSubCADev0 length:667];
      [v4 addObject:v15];
    }
  }
  if ((a3 & 4) != 0)
  {
    id v16 = [MEMORY[0x263EFF8F8] dataWithBytes:&kCertDER_SWAuth_ProdRoot length:573];
    [v4 addObject:v16];

    if (systemInfo_isInternalBuild())
    {
      id v17 = [MEMORY[0x263EFF8F8] dataWithBytes:&kCertDER_SWAuth_TestRoot length:584];
      [v4 addObject:v17];
    }
  }
  if ((a3 & 8) != 0)
  {
    if (systemInfo_isInternalBuild())
    {
      dispatch_time_t v18 = [MEMORY[0x263EFF8F8] dataWithBytes:&kCertDER_VeridianAuth_SoftCA length:512];
      [v4 addObject:v18];
    }
    uint64_t v19 = [MEMORY[0x263EFF8F8] dataWithBytes:&kCertDER_ComponentAuth_ComponentRoot length:517];
    [v4 addObject:v19];
  }
  if ((a3 & 0x10) != 0)
  {
    dispatch_time_t v20 = [MEMORY[0x263EFF8F8] dataWithBytes:&kCertDER_BAAAuth_UserRoot length:542];
    [v4 addObject:v20];
  }
  if ((a3 & 0x20) != 0)
  {
    uint64_t v21 = [MEMORY[0x263EFF8F8] dataWithBytes:&kCertDER_DEVN_Root length:467];
    [v4 addObject:v21];
  }
  if ((a3 & 0x40) != 0)
  {
    id v22 = [MEMORY[0x263EFF8F8] dataWithBytes:&kCertDER_Prov_Root length:1500];
    [v4 addObject:v22];
  }
  if ((a3 & 0x80) != 0)
  {
    int v23 = [MEMORY[0x263EFF8F8] dataWithBytes:&kCertDER_WPCCA1 length:304];
    [v4 addObject:v23];

    if (systemInfo_isInternalBuild())
    {
      id v24 = [MEMORY[0x263EFF8F8] dataWithBytes:&kCertDER_TSTWPC1 length:305];
      [v4 addObject:v24];

      int v25 = [MEMORY[0x263EFF8F8] dataWithBytes:&kCertDER_WPCDevCACert length:328];
      [v4 addObject:v25];

      uint64_t v26 = [MEMORY[0x263EFF8F8] dataWithBytes:&kCertDER_WPCCAX length:304];
      [v4 addObject:v26];

      uint64_t v27 = [MEMORY[0x263EFF8F8] dataWithBytes:&kCertDER_WPCDUMCA1 length:306];
      [v4 addObject:v27];
    }
  }
  if (gLogObjects && gNumLogObjects >= 2)
  {
    uint64_t v28 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    uint64_t v28 = MEMORY[0x263EF8438];
    id v29 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v30 = [v4 count];
    int v34 = 134218240;
    uint64_t v35 = v30;
    __int16 v36 = 1024;
    int v37 = a3;
    _os_log_impl(&dword_21DC52000, v28, OS_LOG_TYPE_DEFAULT, "Returning %lu anchor cert(s) for types: 0x%02X", (uint8_t *)&v34, 0x12u);
  }

  if (gLogObjects && gNumLogObjects >= 2)
  {
    CFDataRef v31 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    CFDataRef v31 = MEMORY[0x263EF8438];
    id v32 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    int v34 = 138412290;
    uint64_t v35 = (uint64_t)v4;
    _os_log_impl(&dword_21DC52000, v31, OS_LOG_TYPE_INFO, "anchorCerts: %@", (uint8_t *)&v34, 0xCu);
  }

  return v4;
}

+ (int)_anchorType2CertType:(int)a3
{
  if (a3 > 15)
  {
    if (a3 > 63)
    {
      if (a3 == 64) {
        return 4;
      }
      if (a3 == 128) {
        return 7;
      }
    }
    else
    {
      if (a3 == 16) {
        return 0;
      }
      if (a3 == 32) {
        return 3;
      }
    }
    return -1;
  }
  if (a3 == 1) {
    return 6;
  }
  if (a3 != 2)
  {
    if (a3 == 8) {
      return 5;
    }
    return -1;
  }
  return 1;
}

- (id)_getAnchorCertsForPolicy:(unint64_t)a3
{
  if (+[MFAACertificateManager isMFi2_3Policy:](MFAACertificateManager, "isMFi2_3Policy:")) {
    int v4 = 3;
  }
  else {
    int v4 = 0;
  }
  unsigned int v5 = (a3 >> 27) & 8 | (a3 >> 38) & 0x10 | v4;
  if ((a3 & 0x30000000) != 0) {
    uint64_t v6 = v5 | 4;
  }
  else {
    uint64_t v6 = v5;
  }
  CFArrayRef v7 = +[MFAACertificateManager _anchorCertificatesDataForTypes:v6];
  if ([v7 count]) {
    id v8 = (void *)[v7 copy];
  }
  else {
    id v8 = 0;
  }

  return v8;
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__MFAACertificateManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedManager_once_1 != -1) {
    dispatch_once(&sharedManager_once_1, block);
  }
  v2 = (void *)sharedManager_sharedInstance_1;
  return v2;
}

uint64_t __39__MFAACertificateManager_sharedManager__block_invoke(uint64_t a1)
{
  sharedManager_sharedInstance_1 = [objc_alloc(*(Class *)(a1 + 32)) _init];
  return MEMORY[0x270F9A758]();
}

+ (id)anchorCertificatesForTypes:(int)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  int v4 = [MEMORY[0x263EFF980] array];
  init_logging();
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 2;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    CFArrayRef v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    CFArrayRef v7 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v55 = 67109120;
    LODWORD(v56) = a3;
    _os_log_impl(&dword_21DC52000, v7, OS_LOG_TYPE_INFO, "Generating anchor cert(s) for types: 0x%02X", (uint8_t *)&v55, 8u);
  }

  if (a3)
  {
    uint64_t CertificateRefWithBytes = createCertificateRefWithBytes((uint64_t)&kiPodAccessoryCA1, 1091, 1);
    if (CertificateRefWithBytes)
    {
      uint64_t v9 = (void *)CertificateRefWithBytes;
      [v4 addObject:CertificateRefWithBytes];
    }
    uint64_t v10 = createCertificateRefWithBytes((uint64_t)&kiPodAccessoryCA2, 1026, 1);
    if (v10)
    {
      id v11 = (void *)v10;
      [v4 addObject:v10];
    }
  }
  if ((a3 & 2) != 0)
  {
    uint64_t v12 = createCertificateRefWithBytes((uint64_t)kAuth3ECSSubCAProd, 667, 1);
    if (v12)
    {
      dispatch_semaphore_t v13 = (void *)v12;
      [v4 addObject:v12];
    }
    uint64_t v14 = createCertificateRefWithBytes((uint64_t)kAuth3ECSSubCADev, 667, 1);
    if (v14)
    {
      dispatch_semaphore_t v15 = (void *)v14;
      [v4 addObject:v14];
    }
    uint64_t v16 = createCertificateRefWithBytes((uint64_t)kiPodAccessoryTestAuth3CA, 667, 1);
    if (v16)
    {
      id v17 = (void *)v16;
      [v4 addObject:v16];
    }
    if (systemInfo_isInternalBuild())
    {
      uint64_t v18 = createCertificateRefWithBytes((uint64_t)kiPodAccessoryTestCAProto, 637, 1);
      if (v18)
      {
        uint64_t v19 = (void *)v18;
        [v4 addObject:v18];
      }
      uint64_t v20 = createCertificateRefWithBytes((uint64_t)kAuth3ECSSubCASimu, 667, 1);
      if (v20)
      {
        uint64_t v21 = (void *)v20;
        [v4 addObject:v20];
      }
      uint64_t v22 = createCertificateRefWithBytes((uint64_t)kAuth3ECSSubCADev0, 667, 1);
      if (v22)
      {
        int v23 = (void *)v22;
        [v4 addObject:v22];
      }
    }
  }
  if ((a3 & 4) != 0)
  {
    uint64_t v24 = createCertificateRefWithBytes((uint64_t)&kCertDER_SWAuth_ProdRoot, 573, 1);
    if (v24)
    {
      int v25 = (void *)v24;
      [v4 addObject:v24];
    }
    if (systemInfo_isInternalBuild())
    {
      uint64_t v26 = createCertificateRefWithBytes((uint64_t)&kCertDER_SWAuth_TestRoot, 584, 1);
      if (v26)
      {
        uint64_t v27 = (void *)v26;
        [v4 addObject:v26];
      }
    }
  }
  if ((a3 & 8) != 0)
  {
    if (systemInfo_isInternalBuild())
    {
      uint64_t v28 = createCertificateRefWithBytes((uint64_t)&kCertDER_VeridianAuth_SoftCA, 512, 1);
      if (v28)
      {
        id v29 = (void *)v28;
        [v4 addObject:v28];
      }
    }
    uint64_t v30 = createCertificateRefWithBytes((uint64_t)&kCertDER_ComponentAuth_ComponentRoot, 517, 1);
    if (v30)
    {
      CFDataRef v31 = (void *)v30;
      [v4 addObject:v30];
    }
  }
  if ((a3 & 0x10) != 0)
  {
    uint64_t v32 = createCertificateRefWithBytes((uint64_t)&kCertDER_BAAAuth_UserRoot, 542, 1);
    if (v32)
    {
      uint64_t v33 = (void *)v32;
      [v4 addObject:v32];
    }
  }
  if ((a3 & 0x20) != 0)
  {
    uint64_t v34 = createCertificateRefWithBytes((uint64_t)&kCertDER_DEVN_Root, 467, 1);
    if (v34)
    {
      uint64_t v35 = (void *)v34;
      [v4 addObject:v34];
    }
  }
  if ((a3 & 0x40) != 0)
  {
    uint64_t v36 = createCertificateRefWithBytes((uint64_t)&kCertDER_Prov_Root, 1500, 1);
    if (v36)
    {
      int v37 = (void *)v36;
      [v4 addObject:v36];
    }
  }
  if ((a3 & 0x80) != 0)
  {
    uint64_t v38 = createCertificateRefWithBytes((uint64_t)&kCertDER_WPCCA1, 304, 1);
    if (v38)
    {
      uint64_t v39 = (void *)v38;
      [v4 addObject:v38];
    }
    if (systemInfo_isInternalBuild())
    {
      uint64_t v40 = createCertificateRefWithBytes((uint64_t)&kCertDER_TSTWPC1, 305, 1);
      if (v40)
      {
        int v41 = (void *)v40;
        [v4 addObject:v40];
      }
      uint64_t v42 = createCertificateRefWithBytes((uint64_t)&kCertDER_WPCDevCACert, 328, 1);
      if (v42)
      {
        id v43 = (void *)v42;
        [v4 addObject:v42];
      }
      uint64_t v44 = createCertificateRefWithBytes((uint64_t)&kCertDER_WPCCAX, 304, 1);
      if (v44)
      {
        uint64_t v45 = (void *)v44;
        [v4 addObject:v44];
      }
      uint64_t v46 = createCertificateRefWithBytes((uint64_t)&kCertDER_WPCDUMCA1, 306, 1);
      if (v46)
      {
        uint64_t v47 = (void *)v46;
        [v4 addObject:v46];
      }
    }
  }
  if (gLogObjects && gNumLogObjects >= 2)
  {
    uint64_t v48 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    uint64_t v48 = MEMORY[0x263EF8438];
    id v49 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v50 = [v4 count];
    int v55 = 134218240;
    uint64_t v56 = v50;
    __int16 v57 = 1024;
    int v58 = a3;
    _os_log_impl(&dword_21DC52000, v48, OS_LOG_TYPE_DEFAULT, "Returning %lu anchor cert(s) for types: 0x%02X", (uint8_t *)&v55, 0x12u);
  }

  if (gLogObjects && gNumLogObjects >= 2)
  {
    int v51 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    int v51 = MEMORY[0x263EF8438];
    id v52 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
  {
    int v55 = 138412290;
    uint64_t v56 = (uint64_t)v4;
    _os_log_impl(&dword_21DC52000, v51, OS_LOG_TYPE_INFO, "anchorCerts: %@", (uint8_t *)&v55, 0xCu);
  }

  id v53 = v4;
  return v53;
}

+ (BOOL)isMFi2_3Policy:(unint64_t)a3
{
  int v3 = a3;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 2;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    id v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    id v6 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    +[MFAACertificateManager isMFi2_3Policy:]();
  }

  return (v3 & 0x8000004) != 0;
}

+ (BOOL)isMFi2_3CertInfo:(id)a3
{
  int v3 = [a3 objectForKey:@"PolicyFlags"];
  BOOL v4 = v3;
  if (v3) {
    BOOL v5 = +[MFAACertificateManager isMFi2_3Policy:](MFAACertificateManager, "isMFi2_3Policy:", [v3 unsignedLongLongValue]);
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)isBAAUserPolicy:(unint64_t)a3
{
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 2;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    id v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    id v6 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    +[MFAACertificateManager isBAAUserPolicy:]();
  }

  return (a3 & 0x40000000000) != 0;
}

+ (BOOL)isBAAUserCertInfo:(id)a3
{
  int v3 = [a3 objectForKey:@"PolicyFlags"];
  BOOL v4 = v3;
  if (v3) {
    BOOL v5 = +[MFAACertificateManager isBAAUserPolicy:](MFAACertificateManager, "isBAAUserPolicy:", [v3 unsignedLongLongValue]);
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)isComponentPolicy:(unint64_t)a3
{
  int v3 = a3;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 2;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    id v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    id v6 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    +[MFAACertificateManager isComponentPolicy:]();
  }

  return (v3 & 0x40000000) != 0;
}

+ (BOOL)isComponentCertInfo:(id)a3
{
  int v3 = [a3 objectForKey:@"PolicyFlags"];
  BOOL v4 = v3;
  if (v3) {
    BOOL v5 = +[MFAACertificateManager isComponentPolicy:](MFAACertificateManager, "isComponentPolicy:", [v3 unsignedLongLongValue]);
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)validateCertificate:realtime:error:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, v0, v1, "certificate is nil!", v2, v3, v4, v5, v6);
}

- (void)validateCertificateChain:realtime:error:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, v0, v1, "certificates are nil!", v2, v3, v4, v5, v6);
}

- (void)validateCertificateChain:realtime:error:.cold.2()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, v0, v1, "failed array allocation", v2, v3, v4, v5, v6);
}

- (void)validateCertificateChain:type:realtime:error:.cold.2()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, v0, v1, "validateCertificateChain: SecPolicyCreate pSecPolicyRef = NULL\n", v2, v3, v4, v5, v6);
}

- (void)validateCertificateChain:type:realtime:error:.cold.3()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, v0, v1, "validateCertificateChain: pArrayAccCert = NULL\n", v2, v3, v4, v5, v6);
}

- (void)validateCertificateChain:type:realtime:error:.cold.4()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, v0, v1, "validateCertificateChain: SecTrustCreateWithCertificates pSecTrustRef = NULL\n", v2, v3, v4, v5, v6);
}

- (void)validateCertificateChain:type:realtime:error:.cold.5()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, v0, v1, "validateCertificateChain: anchorCerts = NULL\n", v2, v3, v4, v5, v6);
}

- (void)validateCertificateChain:type:realtime:error:.cold.6()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_10();
  _os_log_error_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "validateCertificateChain: SecTrustEvaluate wrong result, expect:%02X or %02X, actual:%02X\n", v0, 0x14u);
}

- (void)validateCertificateChain:type:realtime:error:.cold.7()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_0(&dword_21DC52000, v0, v1, "validateCertificateChain: SecTrustEvaluate failed osStatus:%02X\n", v2, v3, v4, v5, v6);
}

void __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_74_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21DC52000, v0, v1, "error: %@", v2, v3, v4, v5, v6);
}

void __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_74_cold_4()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_21DC52000, v0, OS_LOG_TYPE_DEBUG, "issuerSeq: %@", v1, 0xCu);
}

void __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_74_cold_6()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_0(&dword_21DC52000, v0, v1, "Certificate is not valid for SW Auth! (authVersion: %{coreacc:SeciAuthVersion}d)", v2, v3, v4, v5, v6);
}

void __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_79_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21DC52000, v0, v1, "error_int: %@", v2, v3, v4, v5, v6);
}

void __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_79_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_13(&dword_21DC52000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

- (void)copyParsedCertificateChainInfo:.cold.2()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, v0, v1, "Invalid parameter certificateData = NULL", v2, v3, v4, v5, v6);
}

- (void)copyParsedCertificateChainInfo:.cold.3()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, v0, v1, "Failed to allocate certListDict!", v2, v3, v4, v5, v6);
}

- (void)copyParsedCertificateChainInfo:.cold.4()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_0(&dword_21DC52000, v0, v1, "Failed to parse accessory cert chain: %x", v2, v3, v4, v5, v6);
}

- (void)copyParsedCertificateChainInfo:assumeType:.cold.3()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_0(&dword_21DC52000, v0, v1, "Unrecognized certType: %d", v2, v3, v4, v5, v6);
}

- (void)copyParsedCertificateChainInfoFromCerts:assumeType:.cold.2()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, v0, v1, "Invalid parameter certificateList!", v2, v3, v4, v5, v6);
}

- (void)copyParsedCertificateChainInfoFromCerts:assumeType:.cold.3()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, v0, v1, "Failed to allocate certData", v2, v3, v4, v5, v6);
}

- (void)copyEvaluatedCertificateChainInfo:forSpecificType:.cold.2()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, v0, v1, "Invalid parameter certficateInfo = NULL!", v2, v3, v4, v5, v6);
}

- (void)copyEvaluatedCertificateChainInfo:forSpecificType:.cold.3()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, v0, v1, "Unable to create mutable copy of certficateInfo!", v2, v3, v4, v5, v6);
}

- (void)copyEvaluatedCertificateChainInfo:forSpecificType:.cold.4()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, v0, v1, "No leafCertData in certficateInfo!", v2, v3, v4, v5, v6);
}

- (void)copyEvaluatedCertificateChainInfo:forSpecificType:.cold.7()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_0(&dword_21DC52000, v0, v1, "Failed to evaluate accessory cert chain: %x", v2, v3, v4, v5, v6);
}

- (void)authVersionFromCertificateChainInfo:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_21DC52000, log, OS_LOG_TYPE_DEBUG, "authVersionFromCertificateChainInfo: authVerMajor %d, certificateInfo %@", (uint8_t *)v3, 0x12u);
}

- (void)copyCertificateSerialNumber:authVer:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_21DC52000, v1, OS_LOG_TYPE_DEBUG, "copyCertificateSerialNumber: certSerial %@, certificateData %@", v2, 0x16u);
}

- (void)copyCertificateSerialNumber:authVer:.cold.3()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, v0, v1, "copyCertificateSerialNumber: Invalid parameter certificateData = NULL!", v2, v3, v4, v5, v6);
}

- (void)copyCertificateSerialNumber:authVer:.cold.4()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, v0, v1, "copyCertificateSerialNumber: Invalid pkSecCertRef = NULL!", v2, v3, v4, v5, v6);
}

- (void)copyCertificateSerialNumber:authVer:.cold.5()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1(&dword_21DC52000, MEMORY[0x263EF8438], v0, "%s:%d pkSerNumData == NULL!", v1, v2, v3, v4, v5);
}

- (void)copyLeafCertificateSerialNumber:.cold.2()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, v0, v1, "copyLeafCertificateSerialNumber: Invalid parameter certficateInfo = NULL!", v2, v3, v4, v5, v6);
}

- (void)copyLeafCertificateSerialNumber:.cold.3()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, v0, v1, "copyLeafCertificateSerialNumber: Invalid leafCert == NULL!", v2, v3, v4, v5, v6);
}

- (void)verifyCertificateSerialNumberBySerialNumber:(uint64_t)a3 authVer:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)verifyCertificateSerialNumberBySerialNumber:(uint64_t)a3 authVer:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)verifyCertificateSerialNumberBySerialNumber:(uint64_t)a3 authVer:(uint64_t)a4 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)verifyCertificateSerialNumberBySerialNumber:authVer:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21DC52000, MEMORY[0x263EF8438], v0, "AuthV2 Found match revoked batchNum:%08llX", v1, v2, v3, v4, v5);
}

- (void)verifyCertificateSerialNumberBySerialNumber:authVer:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21DC52000, MEMORY[0x263EF8438], v0, "AuthV3 found match revoked certWaferID:%08llX!", v1, v2, v3, v4, v5);
}

- (void)verifyCertificateSerialNumberBySerialNumber:(uint64_t)a3 authVer:(uint64_t)a4 .cold.6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)verifyCertificateSerialNumberBySerialNumber:authVer:.cold.7()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_21DC52000, MEMORY[0x263EF8438], v0, "Unsupported authVerMajor:%02X, serNumLen:%02lX", v1, v2, v3, v4, v5);
}

- (void)verifyCertificateSerialNumber:(void *)a1 authVer:.cold.1(void *a1)
{
  [a1 length];
  [a1 bytes];
  OUTLINED_FUNCTION_1(&dword_21DC52000, MEMORY[0x263EF8438], v2, "Certificate serial number: <%{coreacc:bytes}.*P>\n", v3, v4, v5, v6, 2u);
}

- (void)verifyCertificateSerialNumber:authVer:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_8();
  int v1 = 1238;
  _os_log_debug_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "%s:%d pkCertData = NULL!!", v0, 0x12u);
}

- (void)verifyCertificateSerialNumber:authVer:.cold.3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_8();
  int v1 = 1233;
  _os_log_debug_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "%s:%d pkCertSerNum = NULL!!", v0, 0x12u);
}

- (void)verifyCertificateChainInfoSerialNumber:.cold.3()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, v0, v1, "Invalid parameter certficateInfo, no leafCert!", v2, v3, v4, v5, v6);
}

- (void)verifyNonceSignature:nonce:signature:.cold.3()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, v0, v1, "Invalid parameter nonceData = NULL!", v2, v3, v4, v5, v6);
}

- (void)verifyNonceSignature:nonce:signature:.cold.4()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, v0, v1, "Invalid parameter signatureData = NULL!", v2, v3, v4, v5, v6);
}

- (void)verifyNonceSignature:nonce:signature:.cold.6()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, v0, v1, "Invalid parameter certficateInfo, no fullCert!", v2, v3, v4, v5, v6);
}

- (void)verifyNonceSignature:nonce:signature:.cold.7()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_0(&dword_21DC52000, v0, v1, "Failed to create CertRef = NULL! (%d)", v2, v3, v4, v5, v6);
}

- (void)verifyNonceSignature:nonce:signature:.cold.8()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, v0, v1, "Failed to get publicKeyRef = NULL!", v2, v3, v4, v5, v6);
}

- (void)verifyNonceSignature:(uint64_t)a3 nonce:(uint64_t)a4 signature:(uint64_t)a5 .cold.10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, MEMORY[0x263EF8438], a3, "CFArrayCreateMutable pArrayAccCert = NULL\n", a5, a6, a7, a8, 0);
}

- (void)verifyNonceSignature:(uint64_t)a3 nonce:(uint64_t)a4 signature:(uint64_t)a5 .cold.11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, MEMORY[0x263EF8438], a3, "SecPolicyCreateXxx pSecPolicyRef = NULL\n", a5, a6, a7, a8, 0);
}

- (void)verifyNonceSignature:(uint64_t)a3 nonce:(uint64_t)a4 signature:(uint64_t)a5 .cold.12(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, MEMORY[0x263EF8438], a3, "SecTrustCreateWithCertificates pSecTrustRef = NULL\n", a5, a6, a7, a8, 0);
}

- (void)verifyNonceSignature:(uint64_t)a3 nonce:(uint64_t)a4 signature:(uint64_t)a5 .cold.13(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, MEMORY[0x263EF8438], a3, "CreateAnchorCertificateAuthorityArray pArrayAnchorCA = NULL\n", a5, a6, a7, a8, 0);
}

- (void)verifyNonceSignature:nonce:signature:.cold.14()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_10();
  _os_log_error_impl(&dword_21DC52000, v0, OS_LOG_TYPE_ERROR, "SecTrustEvaluate wrong result, expect:%02X or %02X, actual:%02X\n", v1, 0x14u);
}

- (void)verifyNonceSignature:nonce:signature:.cold.15()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, v0, v1, "SecTrustCopyPublicKey pSecKeyRef = NULL\n", v2, v3, v4, v5, v6);
}

- (void)verifyNonceSignature:nonce:signature:.cold.16()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_0(&dword_21DC52000, v0, v1, "Unsupported authVerMajor %d", v2, v3, v4, v5, v6);
}

- (void)verifyNonceSignature:nonce:signature:.cold.17()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_0(&dword_21DC52000, v0, v1, "Sec signature verification failed authVerMajor:%02X\n", v2, v3, v4, v5, v6);
}

- (void)verifyNonceSignature:nonce:signature:.cold.18()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_7();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl(&dword_21DC52000, v1, OS_LOG_TYPE_ERROR, "SecKeyRawVerify osStatus:%02X, authVerMajor:%02X\n", v2, 0xEu);
}

- (void)verifyNonceSignature:nonce:signature:.cold.19()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_0(&dword_21DC52000, MEMORY[0x263EF8438], v0, "SecTrustSetAnchorCertificates fail osStatus:%02X\n", v1, v2, v3, v4, v5);
}

- (void)_validateCertificateChain:realtime:error:.cold.4()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, v0, v1, "certRef is NULL!", v2, v3, v4, v5, v6);
}

- (void)_validateCertificateChain:realtime:error:.cold.6()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, v0, v1, "Unable to extract auth version from certificate!", v2, v3, v4, v5, v6);
}

- (void)_validateCertificateChain:realtime:error:.cold.12()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2(&dword_21DC52000, v0, v1, "trustError: %@", v2, v3, v4, v5, v6);
}

- (void)_validateCertificateChain:realtime:error:.cold.17()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, v0, v1, "Only production certs are valid on production builds!", v2, v3, v4, v5, v6);
}

- (void)_validateCertificateChain:(uint64_t)a3 realtime:(uint64_t)a4 error:(uint64_t)a5 .cold.26(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_validateCertificateWithServer:issuerSeq:ppid:error:.cold.1()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2(&dword_21DC52000, v0, v1, "error_int: %@", v2, v3, v4, v5, v6);
}

+ (void)isMFi2_3Policy:.cold.1()
{
  LODWORD(v2) = 136316162;
  *(void *)((char *)&v2 + 4) = "+[MFAACertificateManager isMFi2_3Policy:]";
  OUTLINED_FUNCTION_9();
  HIWORD(v4) = 4;
  OUTLINED_FUNCTION_11(&dword_21DC52000, v0, v1, "%s:%d policyFlags 0x%llx, check 0x%llx, result %d", (const char *)v2, (unint64_t)"+[MFAACertificateManager isMFi2_3Policy:]" >> 32, v3, v4, 2048);
}

+ (void)isBAAUserPolicy:.cold.1()
{
  LODWORD(v2) = 136316162;
  *(void *)((char *)&v2 + 4) = "+[MFAACertificateManager isBAAUserPolicy:]";
  OUTLINED_FUNCTION_9();
  HIWORD(v4) = 0;
  OUTLINED_FUNCTION_11(&dword_21DC52000, v0, v1, "%s:%d policyFlags 0x%llx, check 0x%llx, result %d", (const char *)v2, (unint64_t)"+[MFAACertificateManager isBAAUserPolicy:]" >> 32, v3, v4, 0x4000000);
}

+ (void)isComponentPolicy:.cold.1()
{
  LODWORD(v2) = 136316162;
  *(void *)((char *)&v2 + 4) = "+[MFAACertificateManager isComponentPolicy:]";
  OUTLINED_FUNCTION_9();
  HIWORD(v4) = 0;
  OUTLINED_FUNCTION_11(&dword_21DC52000, v0, v1, "%s:%d policyFlags 0x%llx, check 0x%llx, result %d", (const char *)v2, (unint64_t)"+[MFAACertificateManager isComponentPolicy:]" >> 32, v3, v4, 0x4000);
}

@end