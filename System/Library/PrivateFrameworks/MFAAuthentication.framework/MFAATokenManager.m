@interface MFAATokenManager
+ (BOOL)isTokenValidForFeatures:(unint64_t)a3 token:(id)a4;
+ (id)sharedManager;
- (MFAATokenManager)init;
- (NSXPCConnection)xpcConnection;
- (id)_init;
- (void)_init;
- (void)confirmActivationForAuthToken:(id)a3 withUUID:(id)a4 completionHandler:(id)a5;
- (void)requestActivationForAuthToken:(id)a3 withUUID:(id)a4 completionHandler:(id)a5;
- (void)requestMetadataForAuthToken:(id)a3 withUUID:(id)a4 requestedLocale:(id)a5 requestInfo:(id)a6 completionHandler:(id)a7;
- (void)setXpcConnection:(id)a3;
@end

@implementation MFAATokenManager

- (MFAATokenManager)init
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
    BOOL v3 = gNumLogObjects < 3;
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
    uint64_t v5 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(MFAATokenManager *)(uint64_t)self _init];
  }

  v11.receiver = self;
  v11.super_class = (Class)MFAATokenManager;
  v6 = [(MFAATokenManager *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.MFAAuthentication.MFAANetwork"];
    xpcConnection = v6->_xpcConnection;
    v6->_xpcConnection = (NSXPCConnection *)v7;

    v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CE94008];
    [(NSXPCConnection *)v6->_xpcConnection setRemoteObjectInterface:v9];

    [(NSXPCConnection *)v6->_xpcConnection resume];
  }
  return v6;
}

- (void)requestMetadataForAuthToken:(id)a3 withUUID:(id)a4 requestedLocale:(id)a5 requestInfo:(id)a6 completionHandler:(id)a7
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (gLogObjects) {
    BOOL v17 = gNumLogObjects < 3;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    v19 = MEMORY[0x263EF8438];
    id v18 = MEMORY[0x263EF8438];
  }
  else
  {
    v19 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DC52000, v19, OS_LOG_TYPE_DEFAULT, "Processing request for token metadata...", buf, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 3)
  {
    v20 = *(id *)(gLogObjects + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    v20 = MEMORY[0x263EF8438];
    id v21 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = [v12 length];
    uint64_t v23 = [v14 localeIdentifier];
    v24 = (void *)v23;
    *(_DWORD *)buf = 138479107;
    v25 = "YES";
    __int16 v35 = 2048;
    id v34 = v12;
    if (!v16) {
      v25 = "NO";
    }
    uint64_t v36 = v22;
    __int16 v37 = 2112;
    id v38 = v13;
    __int16 v39 = 2112;
    uint64_t v40 = v23;
    __int16 v41 = 2113;
    id v42 = v15;
    __int16 v43 = 2080;
    v44 = v25;
    _os_log_impl(&dword_21DC52000, v20, OS_LOG_TYPE_DEFAULT, "token: %{private}@, token.length: %lu, uuid: %@, requestedLocale: %@, requestInfo: %{private}@, completionHandler: %s", buf, 0x3Eu);
  }
  if (v16)
  {
    v26 = [(MFAATokenManager *)self xpcConnection];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __103__MFAATokenManager_requestMetadataForAuthToken_withUUID_requestedLocale_requestInfo_completionHandler___block_invoke;
    v31[3] = &unk_264478B18;
    id v27 = v16;
    id v32 = v27;
    v28 = [v26 remoteObjectProxyWithErrorHandler:v31];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __103__MFAATokenManager_requestMetadataForAuthToken_withUUID_requestedLocale_requestInfo_completionHandler___block_invoke_32;
    v29[3] = &unk_264478B40;
    id v30 = v27;
    [v28 requestMetadataForToken:v12 withUUID:v13 requestedLocale:v14 requestInfo:v15 withReply:v29];
  }
}

void __103__MFAATokenManager_requestMetadataForAuthToken_withUUID_requestedLocale_requestInfo_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 3;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __103__MFAATokenManager_requestMetadataForAuthToken_withUUID_requestedLocale_requestInfo_completionHandler___block_invoke_cold_1();
  }

  uint64_t v7 = *(void *)(a1 + 32);
  v8 = objc_msgSend(MEMORY[0x263F087E8], "MFAA_errorWithDomain:code:", @"MFAATokenManagerErrorDomain", -4);
  (*(void (**)(uint64_t, void, void, void, void *))(v7 + 16))(v7, 0, 0, 0, v8);
}

uint64_t __103__MFAATokenManager_requestMetadataForAuthToken_withUUID_requestedLocale_requestInfo_completionHandler___block_invoke_32(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestActivationForAuthToken:(id)a3 withUUID:(id)a4 completionHandler:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 3;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    id v13 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  else
  {
    id v13 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DC52000, v13, OS_LOG_TYPE_DEFAULT, "Processing request for token activation...", buf, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 3)
  {
    id v14 = *(id *)(gLogObjects + 16);
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
    id v16 = "YES";
    *(_DWORD *)buf = 138478339;
    id v25 = v8;
    if (!v10) {
      id v16 = "NO";
    }
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2080;
    v29 = v16;
    _os_log_impl(&dword_21DC52000, v14, OS_LOG_TYPE_DEFAULT, "token: %{private}@, uuid: %@, completionHandler: %s", buf, 0x20u);
  }

  if (v10)
  {
    BOOL v17 = [(MFAATokenManager *)self xpcConnection];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __77__MFAATokenManager_requestActivationForAuthToken_withUUID_completionHandler___block_invoke;
    v22[3] = &unk_264478B18;
    id v18 = v10;
    id v23 = v18;
    v19 = [v17 remoteObjectProxyWithErrorHandler:v22];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __77__MFAATokenManager_requestActivationForAuthToken_withUUID_completionHandler___block_invoke_34;
    v20[3] = &unk_264478B68;
    id v21 = v18;
    [v19 requestActivationForToken:v8 withUUID:v9 withReply:v20];
  }
}

void __77__MFAATokenManager_requestActivationForAuthToken_withUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 3;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __103__MFAATokenManager_requestMetadataForAuthToken_withUUID_requestedLocale_requestInfo_completionHandler___block_invoke_cold_1();
  }

  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = objc_msgSend(MEMORY[0x263F087E8], "MFAA_errorWithDomain:code:", @"MFAATokenManagerErrorDomain", -4);
  (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
}

uint64_t __77__MFAATokenManager_requestActivationForAuthToken_withUUID_completionHandler___block_invoke_34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)confirmActivationForAuthToken:(id)a3 withUUID:(id)a4 completionHandler:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 3;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    id v13 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  else
  {
    id v13 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DC52000, v13, OS_LOG_TYPE_DEFAULT, "Processing token confirmation...", buf, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 3)
  {
    id v14 = *(id *)(gLogObjects + 16);
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
    id v16 = "YES";
    *(_DWORD *)buf = 138478339;
    id v25 = v8;
    if (!v10) {
      id v16 = "NO";
    }
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2080;
    v29 = v16;
    _os_log_impl(&dword_21DC52000, v14, OS_LOG_TYPE_DEFAULT, "token: %{private}@, uuid: %@, completionHandler: %s", buf, 0x20u);
  }

  if (v10)
  {
    BOOL v17 = [(MFAATokenManager *)self xpcConnection];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __77__MFAATokenManager_confirmActivationForAuthToken_withUUID_completionHandler___block_invoke;
    v22[3] = &unk_264478B18;
    id v18 = v10;
    id v23 = v18;
    v19 = [v17 remoteObjectProxyWithErrorHandler:v22];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __77__MFAATokenManager_confirmActivationForAuthToken_withUUID_completionHandler___block_invoke_36;
    v20[3] = &unk_264478B18;
    id v21 = v18;
    [v19 confirmActivationForToken:v8 withUUID:v9 withReply:v20];
  }
}

void __77__MFAATokenManager_confirmActivationForAuthToken_withUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 3;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __103__MFAATokenManager_requestMetadataForAuthToken_withUUID_requestedLocale_requestInfo_completionHandler___block_invoke_cold_1();
  }

  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = objc_msgSend(MEMORY[0x263F087E8], "MFAA_errorWithDomain:code:", @"MFAATokenManagerErrorDomain", -4);
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
}

uint64_t __77__MFAATokenManager_confirmActivationForAuthToken_withUUID_completionHandler___block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__MFAATokenManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once != -1) {
    dispatch_once(&sharedManager_once, block);
  }
  v2 = (void *)sharedManager_sharedInstance;
  return v2;
}

uint64_t __33__MFAATokenManager_sharedManager__block_invoke(uint64_t a1)
{
  sharedManager_sharedInstance = [objc_alloc(*(Class *)(a1 + 32)) _init];
  return MEMORY[0x270F9A758]();
}

+ (BOOL)isTokenValidForFeatures:(unint64_t)a3 token:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    v18[0] = [v6 bytes];
    v18[1] = [v6 length];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __50__MFAATokenManager_isTokenValidForFeatures_token___block_invoke;
    v17[3] = &unk_264478BB0;
    v17[4] = &v19;
    v17[5] = &v23;
    DERDecodeSequenceWithBlock((uint64_t)v18, (uint64_t)v17);
    if (gLogObjects && gNumLogObjects >= 3)
    {
      uint64_t v7 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAATokenManager _init]();
      }
      uint64_t v7 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v28 = a3;
      _os_log_impl(&dword_21DC52000, v7, OS_LOG_TYPE_DEFAULT, "features: 0x%016lX", buf, 0xCu);
    }

    if (gLogObjects && gNumLogObjects >= 3)
    {
      id v9 = *(id *)(gLogObjects + 16);
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
      if (*((unsigned char *)v20 + 24)) {
        BOOL v11 = "YES";
      }
      else {
        BOOL v11 = "NO";
      }
      *(_DWORD *)buf = 136315138;
      unint64_t v28 = (unint64_t)v11;
      _os_log_impl(&dword_21DC52000, v9, OS_LOG_TYPE_DEFAULT, "foundProductCapabilities: %s", buf, 0xCu);
    }

    if (*((unsigned char *)v20 + 24)) {
      BOOL v12 = (a3 & ~v24[3]) == 0;
    }
    else {
      BOOL v12 = a3 < 2;
    }
    if (gLogObjects && gNumLogObjects >= 3)
    {
      id v13 = *(id *)(gLogObjects + 16);
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
      id v15 = "NO";
      if (v12) {
        id v15 = "YES";
      }
      *(_DWORD *)buf = 136315138;
      unint64_t v28 = (unint64_t)v15;
      _os_log_impl(&dword_21DC52000, v13, OS_LOG_TYPE_DEFAULT, "tokenValidForFeatures: %s", buf, 0xCu);
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v12;
}

uint64_t __50__MFAATokenManager_isTokenValidForFeatures_token___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (*a2 != 0x2000000000000010) {
    return 3;
  }
  int v16 = -1431655766;
  memset(v15, 170, sizeof(v15));
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  if (DERDecodeSeqContentInit(a2 + 1, (unint64_t *)&v15[2])) {
    return 3;
  }
  int v3 = DERDecodeSeqNext((unint64_t *)&v15[2], &v14);
  uint64_t result = 3;
  if (v3 || v14 != 2) {
    return result;
  }
  if (DERParseInteger(v15, &v16)) {
    return 3;
  }
  if (v16 != 2) {
    return 0;
  }
  if (gLogObjects && gNumLogObjects >= 3)
  {
    id v5 = *(id *)(gLogObjects + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    id v5 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __50__MFAATokenManager_isTokenValidForFeatures_token___block_invoke_cold_2(v5);
  }

  int v7 = DERDecodeSeqNext((unint64_t *)&v15[2], &v14);
  uint64_t result = 3;
  if (!v7 && v14 == 2)
  {
    if (!DERParseInteger(v15, &v16))
    {
      if (gLogObjects && gNumLogObjects >= 3)
      {
        id v8 = *(id *)(gLogObjects + 16);
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
        *(_DWORD *)buf = 67109120;
        int v18 = v16;
        _os_log_impl(&dword_21DC52000, v8, OS_LOG_TYPE_INFO, "SMFiTokenPayload version: %u", buf, 8u);
      }

      if (v16 == 1)
      {
        int v10 = DERDecodeSeqNext((unint64_t *)&v15[2], &v14);
        uint64_t result = 3;
        if (!v10 && v14 == 4)
        {
          int v11 = DERDecodeItem((uint64_t)v15, &v14);
          uint64_t result = 3;
          if (!v11 && v14 == 0x2000000000000011)
          {
            v12[0] = MEMORY[0x263EF8330];
            v12[1] = 3221225472;
            v12[2] = __50__MFAATokenManager_isTokenValidForFeatures_token___block_invoke_40;
            v12[3] = &unk_264478BB0;
            long long v13 = *(_OWORD *)(a1 + 32);
            DERDecodeSequenceContentWithBlock((unint64_t *)v15, (uint64_t)v12);
            return 0;
          }
        }
        return result;
      }
    }
    return 3;
  }
  return result;
}

uint64_t __50__MFAATokenManager_isTokenValidForFeatures_token___block_invoke_40(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (*a2 != 0x2000000000000010) {
    return 3;
  }
  int v18 = -1431655766;
  memset(v17, 170, sizeof(v17));
  unint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
  if (DERDecodeSeqContentInit(a2 + 1, (unint64_t *)&v17[2])) {
    return 3;
  }
  int v5 = DERDecodeSeqNext((unint64_t *)&v17[2], &v16);
  uint64_t result = 3;
  if (v5 || v16 != 2) {
    return result;
  }
  if (DERParseInteger(v17, &v18)) {
    return 3;
  }
  if (v18 != 202) {
    return 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  *a3 = 1;
  if (gLogObjects && gNumLogObjects >= 3)
  {
    int v7 = *(id *)(gLogObjects + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    int v7 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __50__MFAATokenManager_isTokenValidForFeatures_token___block_invoke_40_cold_3(v7);
  }

  int v9 = DERDecodeSeqNext((unint64_t *)&v17[2], &v16);
  uint64_t result = 3;
  if (!v9 && v16 == 2)
  {
    if (!DERParseInteger(v17, &v18))
    {
      if (gLogObjects && gNumLogObjects >= 3)
      {
        int v10 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[MFAATokenManager _init]();
        }
        int v10 = MEMORY[0x263EF8438];
        id v11 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v20) = v18;
        _os_log_impl(&dword_21DC52000, v10, OS_LOG_TYPE_INFO, "SMFiProductCapabilities version: %u", buf, 8u);
      }

      if (v18 == 1)
      {
        int v12 = DERDecodeSeqNext((unint64_t *)&v17[2], &v16);
        uint64_t result = 3;
        if (!v12 && v16 == 4 && v17[1] == (char *)8)
        {
          *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)v17[0];
          *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = bswap64(*(void *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                                          + 24));
          if (gLogObjects && gNumLogObjects >= 3)
          {
            long long v13 = *(id *)(gLogObjects + 16);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[MFAATokenManager _init]();
            }
            long long v13 = MEMORY[0x263EF8438];
            id v14 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
            *(_DWORD *)buf = 134217984;
            uint64_t v20 = v15;
            _os_log_impl(&dword_21DC52000, v13, OS_LOG_TYPE_DEFAULT, "productCapabilities: 0x%016llX", buf, 0xCu);
          }

          return 0;
        }
        return result;
      }
    }
    return 3;
  }
  return result;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_init
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21DC52000, MEMORY[0x263EF8438], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

void __103__MFAATokenManager_requestMetadataForAuthToken_withUUID_requestedLocale_requestInfo_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21DC52000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

void __50__MFAATokenManager_isTokenValidForFeatures_token___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_21DC52000, log, OS_LOG_TYPE_DEBUG, "Found SMFiTokenPayload!", v1, 2u);
}

void __50__MFAATokenManager_isTokenValidForFeatures_token___block_invoke_40_cold_3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_21DC52000, log, OS_LOG_TYPE_DEBUG, "Found SMFiProductCapabilities!", v1, 2u);
}

@end