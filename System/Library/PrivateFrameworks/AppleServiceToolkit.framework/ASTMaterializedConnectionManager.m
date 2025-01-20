@interface ASTMaterializedConnectionManager
- (ASTConnectionManagerDelegate)delegate;
- (ASTIdentity)identity;
- (ASTMaterializedConnectionManager)init;
- (ASTMaterializedConnectionManager)initWithSOCKSProxyServer:(id)a3 port:(id)a4;
- (ASTNetworking)networking;
- (BOOL)isValidUUID:(id)a3;
- (BOOL)postAuthInfo:(id)a3 allowsCellularAccess:(BOOL)a4;
- (BOOL)postProfile:(id)a3 allowsCellularAccess:(BOOL)a4;
- (NSString)sessionId;
- (id)postEnrollAllowingCellularAccess:(BOOL)a3;
- (id)postRequest:(id)a3 allowsCellularAccess:(BOOL)a4;
- (void)cancelAllTestResults;
- (void)connection:(id)a3 connectionStateChanged:(int64_t)a4;
- (void)connection:(id)a3 didSendBodyData:(int64_t)a4 totalBytesSent:(int64_t)a5 totalBytesExpected:(int64_t)a6;
- (void)dealloc;
- (void)downloadAsset:(id)a3 serverURL:(id)a4 endpoint:(id)a5 destinationFileHandle:(id)a6 allowsCellularAccess:(BOOL)a7 completion:(id)a8;
- (void)postSealableFile:(id)a3 fileSequence:(id)a4 totalFiles:(id)a5 testId:(id)a6 dataId:(id)a7 allowsCellularAccess:(BOOL)a8 completion:(id)a9;
- (void)postSelectSelfServiceSuite:(id)a3 withPayloadSigner:(id)a4 allowsCellularAccess:(BOOL)a5 completionHandler:(id)a6;
- (void)postSessionStatusForIdentities:(id)a3 ticket:(id)a4 timeout:(double)a5 allowsCellularAccess:(BOOL)a6 requestQueuedSuiteInfo:(BOOL)a7 completion:(id)a8;
- (void)postTestResult:(id)a3 allowsCellularAccess:(BOOL)a4 completion:(id)a5;
- (void)requestInstructionalPromptDetailsWithInstructionID:(id)a3 type:(id)a4 withPayloadSigner:(id)a5 language:(id)a6 locale:(id)a7 allowsCellularAccess:(BOOL)a8 completionHandler:(id)a9;
- (void)requestSelfServiceSuiteResultsWithDiagnosticEventID:(id)a3 withPayloadSigner:(id)a4 allowsCellularAccess:(BOOL)a5 completionHandler:(id)a6;
- (void)requestSelfServiceSuitesAvailableWithConfigCode:(id)a3 withPayloadSigner:(id)a4 allowsCellularAccess:(BOOL)a5 completionHandler:(id)a6;
- (void)requestSessionArchiveWithSessionID:(id)a3 withPayloadSigner:(id)a4 allowsCellularAccess:(BOOL)a5 completionHandler:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setIdentity:(id)a3;
- (void)setNetworking:(id)a3;
- (void)setSessionId:(id)a3;
@end

@implementation ASTMaterializedConnectionManager

- (ASTMaterializedConnectionManager)initWithSOCKSProxyServer:(id)a3 port:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASTMaterializedConnectionManager;
  v8 = [(ASTMaterializedConnectionManager *)&v12 init];
  if (v8)
  {
    v9 = [[ASTNetworking alloc] initWithSOCKSProxyServer:v6 port:v7];
    networking = v8->_networking;
    v8->_networking = v9;
  }
  return v8;
}

- (ASTMaterializedConnectionManager)init
{
  return [(ASTMaterializedConnectionManager *)self initWithSOCKSProxyServer:0 port:0];
}

- (void)postSessionStatusForIdentities:(id)a3 ticket:(id)a4 timeout:(double)a5 allowsCellularAccess:(BOOL)a6 requestQueuedSuiteInfo:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  v17 = ASTLogHandleForCategory(1);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v25 = v14;
    __int16 v26 = 2112;
    id v27 = v15;
    _os_log_impl(&dword_23CA80000, v17, OS_LOG_TYPE_DEFAULT, "[Session] > Identities: %@, Ticket: %@", buf, 0x16u);
  }

  v18 = [[ASTConnectionSession alloc] initWithIdentities:v14 ticket:v15 requestQueuedSuiteInfo:v9];
  [(ASTMaterializedConnection *)v18 setTimeout:a5];
  v19 = [v14 firstObject];
  [(ASTMaterializedConnection *)v18 setIdentity:v19];

  [(ASTMaterializedConnection *)v18 setAllowsCellularAccess:v10];
  [(ASTMaterializedConnection *)v18 setDelegate:self];
  [(ASTMaterializedConnection *)v18 setRetryOnNetworkDisconnected:0];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __137__ASTMaterializedConnectionManager_postSessionStatusForIdentities_ticket_timeout_allowsCellularAccess_requestQueuedSuiteInfo_completion___block_invoke;
  v22[3] = &unk_264E7DA38;
  id v23 = v16;
  id v20 = v16;
  [(ASTMaterializedConnection *)v18 setDidReceiveResponse:v22];
  v21 = [(ASTMaterializedConnectionManager *)self networking];
  [v21 addConnection:v18];
}

void __137__ASTMaterializedConnectionManager_postSessionStatusForIdentities_ticket_timeout_allowsCellularAccess_requestQueuedSuiteInfo_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = ASTLogHandleForCategory(1);
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v31) = 0;
      _os_log_impl(&dword_23CA80000, v8, OS_LOG_TYPE_DEFAULT, "[Session] < Session Successful", (uint8_t *)&v31, 2u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __137__ASTMaterializedConnectionManager_postSessionStatusForIdentities_ticket_timeout_allowsCellularAccess_requestQueuedSuiteInfo_completion___block_invoke_cold_1();
  }

  BOOL v9 = [v5 objectForKeyedSubscript:@"diagsChannel"];
  if (v9)
  {
    BOOL v10 = [v5 objectForKeyedSubscript:@"diagsChannel"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      BOOL v9 = [v5 objectForKeyedSubscript:@"diagsChannel"];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  objc_super v12 = [v5 objectForKeyedSubscript:@"configCode"];
  if (v12)
  {
    v13 = [v5 objectForKeyedSubscript:@"configCode"];
    objc_opt_class();
    char v14 = objc_opt_isKindOfClass();

    if (v14)
    {
      objc_super v12 = [v5 objectForKeyedSubscript:@"configCode"];
    }
    else
    {
      objc_super v12 = 0;
    }
  }
  uint64_t v15 = [v5 objectForKeyedSubscript:@"guided"];
  if (v15)
  {
    id v16 = (void *)v15;
    v17 = [v5 objectForKeyedSubscript:@"guided"];
    objc_opt_class();
    char v18 = objc_opt_isKindOfClass();

    if ((v18 & 1) == 0)
    {
      v19 = [v5 objectForKeyedSubscript:@"guided"];
      [v19 BOOLValue];
    }
  }
  uint64_t v20 = [v5 objectForKeyedSubscript:@"queuedSuiteType"];
  if (v20)
  {
    v21 = (void *)v20;
    v22 = [v5 objectForKeyedSubscript:@"queuedSuiteType"];
    objc_opt_class();
    char v23 = objc_opt_isKindOfClass();

    if (v23)
    {
      v24 = [v5 objectForKeyedSubscript:@"queuedSuiteType"];
      if (([v24 isEqualToString:@"None"] & 1) == 0) {
        [v24 isEqualToString:@"Logging"];
      }
    }
  }
  id v25 = [v5 objectForKeyedSubscript:@"assetURL"];
  if (v25)
  {
    __int16 v26 = [v5 objectForKeyedSubscript:@"assetURL"];
    objc_opt_class();
    char v27 = objc_opt_isKindOfClass();

    if (v27)
    {
      uint64_t v28 = NSURL;
      v29 = [v5 objectForKeyedSubscript:@"assetURL"];
      id v25 = [v28 URLWithString:v29];
    }
    else
    {
      id v25 = 0;
    }
  }
  v30 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    int v31 = 138412290;
    v32 = v9;
    _os_log_impl(&dword_23CA80000, v30, OS_LOG_TYPE_DEFAULT, "[Session] Received diags channel: %@", (uint8_t *)&v31, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)downloadAsset:(id)a3 serverURL:(id)a4 endpoint:(id)a5 destinationFileHandle:(id)a6 allowsCellularAccess:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a8;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  v19 = ASTLogHandleForCategory(1);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v14;
    _os_log_impl(&dword_23CA80000, v19, OS_LOG_TYPE_DEFAULT, "[Asset] > %@", buf, 0xCu);
  }

  uint64_t v20 = [[ASTConnectionAsset alloc] initWithServerURL:v18 endpoint:v17 assetName:v14 destinationFileHandle:v16];
  v21 = [(ASTMaterializedConnectionManager *)self identity];
  [(ASTMaterializedConnection *)v20 setIdentity:v21];

  v22 = [(ASTMaterializedConnectionManager *)self sessionId];
  [(ASTMaterializedConnection *)v20 setSessionId:v22];

  [(ASTMaterializedConnection *)v20 setAllowsCellularAccess:v9];
  [(ASTMaterializedConnection *)v20 setDelegate:self];
  [(ASTMaterializedConnection *)v20 setRetryOnNetworkDisconnected:1];
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  uint64_t v28 = __123__ASTMaterializedConnectionManager_downloadAsset_serverURL_endpoint_destinationFileHandle_allowsCellularAccess_completion___block_invoke;
  v29 = &unk_264E7DA60;
  id v30 = v14;
  id v31 = v15;
  id v23 = v15;
  id v24 = v14;
  [(ASTMaterializedConnection *)v20 setDidReceiveResponse:&v26];
  id v25 = [(ASTMaterializedConnectionManager *)self networking];
  [v25 addConnection:v20];
}

void __123__ASTMaterializedConnectionManager_downloadAsset_serverURL_endpoint_destinationFileHandle_allowsCellularAccess_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = ASTLogHandleForCategory(1);
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_23CA80000, v7, OS_LOG_TYPE_DEFAULT, "[Asset] < %@ Download Successful", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __123__ASTMaterializedConnectionManager_downloadAsset_serverURL_endpoint_destinationFileHandle_allowsCellularAccess_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)postEnrollAllowingCellularAccess:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = ASTLogHandleForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(ASTMaterializedConnectionManager *)self identity];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_23CA80000, v5, OS_LOG_TYPE_DEFAULT, "[Enroll] > Identity: %@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  id v23 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v8 = [ASTConnectionEnroll alloc];
  int v9 = [(ASTMaterializedConnectionManager *)self identity];
  uint64_t v10 = [(ASTConnectionEnroll *)v8 initWithIdentity:v9];

  uint64_t v11 = [(ASTMaterializedConnectionManager *)self identity];
  [(ASTMaterializedConnection *)v10 setIdentity:v11];

  [(ASTMaterializedConnection *)v10 setAllowsCellularAccess:v3];
  [(ASTMaterializedConnection *)v10 setDelegate:self];
  [(ASTMaterializedConnection *)v10 setRetryOnNetworkDisconnected:1];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __69__ASTMaterializedConnectionManager_postEnrollAllowingCellularAccess___block_invoke;
  v16[3] = &unk_264E7DA88;
  p_long long buf = &buf;
  v16[4] = self;
  objc_super v12 = v7;
  id v17 = v12;
  [(ASTMaterializedConnection *)v10 setDidReceiveResponse:v16];
  v13 = [(ASTMaterializedConnectionManager *)self networking];
  [v13 addConnection:v10];

  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  [(ASTMaterializedConnectionManager *)self setSessionId:*(void *)(*((void *)&buf + 1) + 40)];
  id v14 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);

  return v14;
}

void __69__ASTMaterializedConnectionManager_postEnrollAllowingCellularAccess___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5
    && ([v5 objectForKeyedSubscript:@"sessionId"],
        dispatch_semaphore_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    uint64_t v8 = [v5 objectForKeyedSubscript:@"sessionId"];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else
  {
    uint64_t v11 = ASTLogHandleForCategory(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __69__ASTMaterializedConnectionManager_postEnrollAllowingCellularAccess___block_invoke_cold_1();
    }
  }
  objc_super v12 = ASTLogHandleForCategory(1);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [*(id *)(a1 + 32) identity];
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v15 = 138412546;
    id v16 = v13;
    __int16 v17 = 2112;
    uint64_t v18 = v14;
    _os_log_impl(&dword_23CA80000, v12, OS_LOG_TYPE_DEFAULT, "[Enroll] < Identity: %@, Session: %@", (uint8_t *)&v15, 0x16u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)postAuthInfo:(id)a3 allowsCellularAccess:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  dispatch_semaphore_t v7 = ASTLogHandleForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_23CA80000, v7, OS_LOG_TYPE_DEFAULT, "[AuthInfo] > Auth info: %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  uint64_t v9 = [[ASTConnectionAuthInfo alloc] initWithAuthInfo:v6];
  uint64_t v10 = [(ASTMaterializedConnectionManager *)self identity];
  [(ASTMaterializedConnection *)v9 setIdentity:v10];

  uint64_t v11 = [(ASTMaterializedConnectionManager *)self sessionId];
  [(ASTMaterializedConnection *)v9 setSessionId:v11];

  [(ASTMaterializedConnection *)v9 setAllowsCellularAccess:v4];
  [(ASTMaterializedConnection *)v9 setDelegate:self];
  [(ASTMaterializedConnection *)v9 setRetryOnNetworkDisconnected:1];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  __int16 v17 = __70__ASTMaterializedConnectionManager_postAuthInfo_allowsCellularAccess___block_invoke;
  uint64_t v18 = &unk_264E7DAB0;
  p_long long buf = &buf;
  objc_super v12 = v8;
  uint64_t v19 = v12;
  [(ASTMaterializedConnection *)v9 setDidReceiveResponse:&v15];
  v13 = [(ASTMaterializedConnectionManager *)self networking];
  [v13 addConnection:v9];

  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v13) = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
  return (char)v13;
}

void __70__ASTMaterializedConnectionManager_postAuthInfo_allowsCellularAccess___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = ASTLogHandleForCategory(1);
  dispatch_semaphore_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_semaphore_t v8 = 0;
      _os_log_impl(&dword_23CA80000, v7, OS_LOG_TYPE_DEFAULT, "[AuthInfo] < Auth Info Successful", v8, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __70__ASTMaterializedConnectionManager_postAuthInfo_allowsCellularAccess___block_invoke_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)postProfile:(id)a3 allowsCellularAccess:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  dispatch_semaphore_t v7 = ASTLogHandleForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_23CA80000, v7, OS_LOG_TYPE_DEFAULT, "[Profile] > Profile: %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  uint64_t v9 = [[ASTConnectionProfile alloc] initWithProfile:v6];
  uint64_t v10 = [(ASTMaterializedConnectionManager *)self identity];
  [(ASTMaterializedConnection *)v9 setIdentity:v10];

  uint64_t v11 = [(ASTMaterializedConnectionManager *)self sessionId];
  [(ASTMaterializedConnection *)v9 setSessionId:v11];

  [(ASTMaterializedConnection *)v9 setAllowsCellularAccess:v4];
  [(ASTMaterializedConnection *)v9 setDelegate:self];
  [(ASTMaterializedConnection *)v9 setRetryOnNetworkDisconnected:1];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  __int16 v17 = __69__ASTMaterializedConnectionManager_postProfile_allowsCellularAccess___block_invoke;
  uint64_t v18 = &unk_264E7DAB0;
  p_long long buf = &buf;
  objc_super v12 = v8;
  uint64_t v19 = v12;
  [(ASTMaterializedConnection *)v9 setDidReceiveResponse:&v15];
  v13 = [(ASTMaterializedConnectionManager *)self networking];
  [v13 addConnection:v9];

  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v13) = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
  return (char)v13;
}

void __69__ASTMaterializedConnectionManager_postProfile_allowsCellularAccess___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = ASTLogHandleForCategory(1);
  dispatch_semaphore_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_semaphore_t v8 = 0;
      _os_log_impl(&dword_23CA80000, v7, OS_LOG_TYPE_DEFAULT, "[Profile] < Profile Successful", v8, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __69__ASTMaterializedConnectionManager_postProfile_allowsCellularAccess___block_invoke_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)postRequest:(id)a3 allowsCellularAccess:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  dispatch_semaphore_t v7 = ASTLogHandleForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_23CA80000, v7, OS_LOG_TYPE_DEFAULT, "[Status] > %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000;
  char v23 = __Block_byref_object_copy__0;
  uint64_t v24 = __Block_byref_object_dispose__0;
  id v25 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  uint64_t v9 = [[ASTConnectionClientStatus alloc] initWithClientStatus:v6];
  uint64_t v10 = [(ASTMaterializedConnectionManager *)self identity];
  [(ASTMaterializedConnection *)v9 setIdentity:v10];

  uint64_t v11 = [(ASTMaterializedConnectionManager *)self sessionId];
  [(ASTMaterializedConnection *)v9 setSessionId:v11];

  [(ASTMaterializedConnection *)v9 setAllowsCellularAccess:v4];
  [(ASTMaterializedConnection *)v9 setDelegate:self];
  -[ASTMaterializedConnection setRetryOnNetworkDisconnected:](v9, "setRetryOnNetworkDisconnected:", [v6 clientStatus] != 9);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __69__ASTMaterializedConnectionManager_postRequest_allowsCellularAccess___block_invoke;
  v17[3] = &unk_264E7DA88;
  p_long long buf = &buf;
  objc_super v12 = v8;
  uint64_t v18 = v12;
  id v13 = v6;
  id v19 = v13;
  [(ASTMaterializedConnection *)v9 setDidReceiveResponse:v17];
  uint64_t v14 = [(ASTMaterializedConnectionManager *)self networking];
  [v14 addConnection:v9];

  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  id v15 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);

  return v15;
}

void __69__ASTMaterializedConnectionManager_postRequest_allowsCellularAccess___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  dispatch_semaphore_t v7 = ASTLogHandleForCategory(1);
  dispatch_semaphore_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412546;
      id v18 = v5;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl(&dword_23CA80000, v8, OS_LOG_TYPE_DEFAULT, "Response: %@, error: %@", (uint8_t *)&v17, 0x16u);
    }

    uint64_t v9 = +[ASTResponse responseWithDictionary:v5];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v13 = ASTLogHandleForCategory(1);
    dispatch_semaphore_t v8 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        int v17 = 138412290;
        id v18 = v14;
        _os_log_impl(&dword_23CA80000, v8, OS_LOG_TYPE_DEFAULT, "[Status] < %@", (uint8_t *)&v17, 0xCu);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __69__ASTMaterializedConnectionManager_postRequest_allowsCellularAccess___block_invoke_cold_2();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __69__ASTMaterializedConnectionManager_postRequest_allowsCellularAccess___block_invoke_cold_1();
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  id v15 = [*(id *)(a1 + 40) completion];

  if (v15)
  {
    uint64_t v16 = [*(id *)(a1 + 40) completion];
    v16[2]();
  }
}

- (void)postTestResult:(id)a3 allowsCellularAccess:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = ASTLogHandleForCategory(1);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_23CA80000, v10, OS_LOG_TYPE_DEFAULT, "[Test Results] > Results: %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  uint64_t v11 = [[ASTConnectionTestResult alloc] initWithTestResults:v8];
  uint64_t v12 = [(ASTMaterializedConnectionManager *)self identity];
  [(ASTMaterializedConnection *)v11 setIdentity:v12];

  id v13 = [(ASTMaterializedConnectionManager *)self sessionId];
  [(ASTMaterializedConnection *)v11 setSessionId:v13];

  [(ASTMaterializedConnection *)v11 setAllowsCellularAccess:v6];
  [(ASTMaterializedConnection *)v11 setDelegate:self];
  [(ASTMaterializedConnection *)v11 setRetryOnNetworkDisconnected:1];
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  id v18 = __83__ASTMaterializedConnectionManager_postTestResult_allowsCellularAccess_completion___block_invoke;
  __int16 v19 = &unk_264E7DAD8;
  p_long long buf = &buf;
  id v14 = v9;
  id v20 = v14;
  [(ASTMaterializedConnection *)v11 setDidReceiveResponse:&v16];
  id v15 = [(ASTMaterializedConnectionManager *)self networking];
  [v15 addConnection:v11];

  _Block_object_dispose(&buf, 8);
}

void __83__ASTMaterializedConnectionManager_postTestResult_allowsCellularAccess_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  BOOL v6 = ASTLogHandleForCategory(1);
  dispatch_semaphore_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_23CA80000, v7, OS_LOG_TYPE_DEFAULT, "[Test Results] < Test Results Successful", v8, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __83__ASTMaterializedConnectionManager_postTestResult_allowsCellularAccess_completion___block_invoke_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)postSealableFile:(id)a3 fileSequence:(id)a4 totalFiles:(id)a5 testId:(id)a6 dataId:(id)a7 allowsCellularAccess:(BOOL)a8 completion:(id)a9
{
  BOOL v34 = a8;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v35 = a9;
  id v15 = (void *)MEMORY[0x263F08850];
  id v33 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  __int16 v19 = [v15 defaultManager];
  id v20 = [v14 fileURL];
  uint64_t v21 = [v20 path];
  uint64_t v22 = [v19 attributesOfItemAtPath:v21 error:0];
  uint64_t v23 = [v22 fileSize];

  char v24 = ASTLogHandleForCategory(1);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = [v14 fileURL];
    uint64_t v26 = [v25 path];
    *(_DWORD *)long long buf = 138412546;
    v40 = v26;
    __int16 v41 = 2048;
    uint64_t v42 = v23;
    _os_log_impl(&dword_23CA80000, v24, OS_LOG_TYPE_DEFAULT, "[File Upload] > File: %@, File Size: %llu bytes", buf, 0x16u);
  }
  uint64_t v27 = [[ASTConnectionTestResultBinary alloc] initWithSealableFile:v14 fileSequence:v18 totalFiles:v17 testId:v16 dataId:v33];

  uint64_t v28 = [(ASTMaterializedConnectionManager *)self identity];
  [(ASTMaterializedConnection *)v27 setIdentity:v28];

  v29 = [(ASTMaterializedConnectionManager *)self sessionId];
  [(ASTMaterializedConnection *)v27 setSessionId:v29];

  [(ASTMaterializedConnection *)v27 setAllowsCellularAccess:v34];
  [(ASTMaterializedConnection *)v27 setDelegate:self];
  [(ASTMaterializedConnection *)v27 setRetryOnNetworkDisconnected:1];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __123__ASTMaterializedConnectionManager_postSealableFile_fileSequence_totalFiles_testId_dataId_allowsCellularAccess_completion___block_invoke;
  v36[3] = &unk_264E7DA60;
  id v37 = v14;
  id v38 = v35;
  id v30 = v35;
  id v31 = v14;
  [(ASTMaterializedConnection *)v27 setDidReceiveResponse:v36];
  v32 = [(ASTMaterializedConnectionManager *)self networking];
  [v32 addConnection:v27];
}

void __123__ASTMaterializedConnectionManager_postSealableFile_fileSequence_totalFiles_testId_dataId_allowsCellularAccess_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_semaphore_t v7 = ASTLogHandleForCategory(1);
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_23CA80000, v8, OS_LOG_TYPE_DEFAULT, "[File Upload] < File Upload Successful", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __123__ASTMaterializedConnectionManager_postSealableFile_fileSequence_totalFiles_testId_dataId_allowsCellularAccess_completion___block_invoke_cold_2(a1);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v9 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v11 = *(void **)(a1 + 32);
  uint64_t v10 = (id *)(a1 + 32);
  uint64_t v12 = [v11 fileURL];
  id v16 = 0;
  char v13 = [v9 removeItemAtURL:v12 error:&v16];
  id v14 = v16;

  if ((v13 & 1) == 0)
  {
    id v15 = ASTLogHandleForCategory(1);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __123__ASTMaterializedConnectionManager_postSealableFile_fileSequence_totalFiles_testId_dataId_allowsCellularAccess_completion___block_invoke_cold_1(v10);
    }
  }
}

- (void)cancelAllTestResults
{
  BOOL v3 = [(ASTMaterializedConnectionManager *)self networking];
  [v3 cancelConnectionsOfClass:objc_opt_class()];

  id v4 = [(ASTMaterializedConnectionManager *)self networking];
  [v4 cancelConnectionsOfClass:objc_opt_class()];
}

- (void)requestSessionArchiveWithSessionID:(id)a3 withPayloadSigner:(id)a4 allowsCellularAccess:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  char v13 = ASTLogHandleForCategory(1);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v28 = "-[ASTMaterializedConnectionManager requestSessionArchiveWithSessionID:withPayloadSigner:allowsCellularAccess:c"
          "ompletionHandler:]";
    _os_log_impl(&dword_23CA80000, v13, OS_LOG_TYPE_DEFAULT, "[ASTConnectionManager] %s", buf, 0xCu);
  }

  dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
  id v15 = objc_alloc_init(ASTConnectionArchiveSelfServiceSession);
  id v16 = [(ASTMaterializedConnectionManager *)self identity];
  [(ASTMaterializedConnection *)v15 setIdentity:v16];

  [(ASTConnectionArchiveSelfServiceSession *)v15 setSessionId:v12];
  [(ASTMaterializedConnection *)v15 setAllowsCellularAccess:v6];
  [(ASTMaterializedConnection *)v15 setDelegate:self];
  [(ASTMaterializedConnection *)v15 setRetryOnNetworkDisconnected:1];
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  uint64_t v23 = __128__ASTMaterializedConnectionManager_requestSessionArchiveWithSessionID_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke;
  char v24 = &unk_264E7DB00;
  dispatch_semaphore_t v25 = v14;
  id v26 = v10;
  id v17 = v14;
  id v18 = v10;
  [(ASTMaterializedConnection *)v15 setDidReceiveResponse:&v21];
  -[ASTMaterializedConnection signBodyWithPayloadSigner:](v15, "signBodyWithPayloadSigner:", v11, v21, v22, v23, v24);

  __int16 v19 = [(ASTMaterializedConnectionManager *)self networking];
  [v19 addConnection:v15];

  dispatch_time_t v20 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v17, v20);
}

void __128__ASTMaterializedConnectionManager_requestSessionArchiveWithSessionID_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v9 = ASTLogHandleForCategory(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __128__ASTMaterializedConnectionManager_requestSessionArchiveWithSessionID_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke_cold_1();
    }

    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = -7000;
    goto LABEL_10;
  }
  dispatch_semaphore_t v7 = [v5 objectForKeyedSubscript:@"archived"];
  char v8 = [v7 BOOLValue];

  if ((v8 & 1) == 0)
  {
    char v13 = ASTLogHandleForCategory(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __128__ASTMaterializedConnectionManager_requestSessionArchiveWithSessionID_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke_cold_2();
    }

    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = -1008;
LABEL_10:
    dispatch_semaphore_t v14 = [v11 errorWithDomain:@"ASTErrorDomain" code:v12 userInfo:0];
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v14);

    goto LABEL_11;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_11:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)requestSelfServiceSuitesAvailableWithConfigCode:(id)a3 withPayloadSigner:(id)a4 allowsCellularAccess:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a6;
  id v11 = ASTLogHandleForCategory(1);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    dispatch_semaphore_t v25 = "-[ASTMaterializedConnectionManager requestSelfServiceSuitesAvailableWithConfigCode:withPayloadSigner:allowsCel"
          "lularAccess:completionHandler:]";
    _os_log_impl(&dword_23CA80000, v11, OS_LOG_TYPE_DEFAULT, "[ASTConnectionManager] %s", buf, 0xCu);
  }

  uint64_t v12 = [[ASTConnectionRetrieveSelfServiceSuites alloc] initWithConfigCode:v9];
  char v13 = [(ASTMaterializedConnectionManager *)self identity];
  [(ASTMaterializedConnection *)v12 setIdentity:v13];

  dispatch_semaphore_t v14 = [(ASTMaterializedConnectionManager *)self sessionId];
  [(ASTMaterializedConnection *)v12 setSessionId:v14];

  [(ASTMaterializedConnection *)v12 setAllowsCellularAccess:v7];
  [(ASTMaterializedConnection *)v12 setDelegate:self];
  [(ASTMaterializedConnection *)v12 setRetryOnNetworkDisconnected:1];
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  dispatch_time_t v20 = __141__ASTMaterializedConnectionManager_requestSelfServiceSuitesAvailableWithConfigCode_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke;
  uint64_t v21 = &unk_264E7DA60;
  id v22 = v9;
  id v23 = v10;
  id v15 = v10;
  id v16 = v9;
  [(ASTMaterializedConnection *)v12 setDidReceiveResponse:&v18];
  id v17 = [(ASTMaterializedConnectionManager *)self networking];
  [v17 addConnection:v12];
}

void __141__ASTMaterializedConnectionManager_requestSelfServiceSuitesAvailableWithConfigCode_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    BOOL v7 = [MEMORY[0x263EFF980] array];
    char v8 = [v5 objectForKeyedSubscript:@"suites"];
    id v9 = [v8 arrayDroppingNSNullValues];

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __141__ASTMaterializedConnectionManager_requestSelfServiceSuitesAvailableWithConfigCode_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke_79;
    v13[3] = &unk_264E7DB28;
    id v14 = v7;
    id v10 = v7;
    [v9 enumerateObjectsUsingBlock:v13];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v11 = ASTLogHandleForCategory(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __141__ASTMaterializedConnectionManager_requestSelfServiceSuitesAvailableWithConfigCode_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke_cold_1();
    }

    uint64_t v12 = *(void *)(a1 + 40);
    id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"ASTErrorDomain" code:-7000 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v9);
  }
}

void __141__ASTMaterializedConnectionManager_requestSelfServiceSuitesAvailableWithConfigCode_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke_79(uint64_t a1, void *a2)
{
  id v12 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v3 = [v12 objectForKeyedSubscript:@"id"];
    id v4 = [v12 objectForKeyedSubscript:@"name"];
    id v5 = [v12 objectForKeyedSubscript:@"description"];
    id v6 = [v12 objectForKeyedSubscript:@"timeEstimateStr"];
    BOOL v7 = [v12 objectForKeyedSubscript:@"assets"];
    char v8 = [ASTSuite alloc];
    id v9 = [v7 objectForKeyedSubscript:@"primary"];
    id v10 = [v7 objectForKeyedSubscript:@"secondary"];
    id v11 = [(ASTSuite *)v8 initWithId:v3 suiteNameLocalizedString:v4 suiteDescriptionLocalizedString:v5 estimatedCompletionTimeLocalizedString:v6 primaryAssetLocator:v9 secondaryAssetLocator:v10];

    [*(id *)(a1 + 32) addObject:v11];
  }
}

- (void)postSelectSelfServiceSuite:(id)a3 withPayloadSigner:(id)a4 allowsCellularAccess:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  id v12 = a4;
  char v13 = ASTLogHandleForCategory(1);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    dispatch_semaphore_t v25 = "-[ASTMaterializedConnectionManager postSelectSelfServiceSuite:withPayloadSigner:allowsCellularAccess:completionHandler:]";
    _os_log_impl(&dword_23CA80000, v13, OS_LOG_TYPE_DEFAULT, "[ASTConnectionManager] %s", buf, 0xCu);
  }

  id v14 = [[ASTConnectionSelectSelfServiceSuite alloc] initWithSuiteID:v10];
  id v15 = [(ASTMaterializedConnectionManager *)self identity];
  [(ASTMaterializedConnection *)v14 setIdentity:v15];

  id v16 = [(ASTMaterializedConnectionManager *)self sessionId];
  [(ASTMaterializedConnection *)v14 setSessionId:v16];

  [(ASTMaterializedConnection *)v14 setAllowsCellularAccess:v7];
  [(ASTMaterializedConnection *)v14 setDelegate:self];
  [(ASTMaterializedConnection *)v14 setRetryOnNetworkDisconnected:1];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __120__ASTMaterializedConnectionManager_postSelectSelfServiceSuite_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke;
  v20[3] = &unk_264E7DB50;
  id v22 = self;
  id v23 = v11;
  id v21 = v10;
  id v17 = v11;
  id v18 = v10;
  [(ASTMaterializedConnection *)v14 setDidReceiveResponse:v20];
  [(ASTMaterializedConnection *)v14 signBodyWithPayloadSigner:v12];

  uint64_t v19 = [(ASTMaterializedConnectionManager *)self networking];
  [v19 addConnection:v14];
}

void __120__ASTMaterializedConnectionManager_postSelectSelfServiceSuite_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (!a2)
  {
    char v8 = ASTLogHandleForCategory(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __120__ASTMaterializedConnectionManager_postSelectSelfServiceSuite_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke_cold_1();
    }

    uint64_t v9 = *(void *)(a1 + 48);
    id v6 = [MEMORY[0x263F087E8] errorWithDomain:@"ASTErrorDomain" code:-7000 userInfo:0];
    BOOL v7 = *(void (**)(void))(v9 + 16);
    goto LABEL_7;
  }
  id v6 = [a2 objectForKeyedSubscript:@"diagnosticEventId"];
  if ([*(id *)(a1 + 40) isValidUUID:v6])
  {
    BOOL v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_7:
    v7();
    goto LABEL_11;
  }
  id v10 = ASTLogHandleForCategory(1);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    __120__ASTMaterializedConnectionManager_postSelectSelfServiceSuite_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke_cold_2();
  }

  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 32);
  char v13 = [MEMORY[0x263F087E8] errorWithDomain:@"ASTErrorDomain" code:-7000 userInfo:0];
  (*(void (**)(uint64_t, uint64_t, void, void, void *))(v11 + 16))(v11, v12, 0, 0, v13);

LABEL_11:
}

- (void)requestSelfServiceSuiteResultsWithDiagnosticEventID:(id)a3 withPayloadSigner:(id)a4 allowsCellularAccess:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  id v12 = a4;
  char v13 = ASTLogHandleForCategory(1);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v27 = "-[ASTMaterializedConnectionManager requestSelfServiceSuiteResultsWithDiagnosticEventID:withPayloadSigner:allow"
          "sCellularAccess:completionHandler:]";
    _os_log_impl(&dword_23CA80000, v13, OS_LOG_TYPE_DEFAULT, "[ASTConnectionManager] %s", buf, 0xCu);
  }

  id v14 = [[ASTConnectionRetrieveSelfServiceSuiteResults alloc] initWithDiagnosticEventID:v10];
  id v15 = [(ASTMaterializedConnectionManager *)self identity];
  [(ASTMaterializedConnection *)v14 setIdentity:v15];

  id v16 = [(ASTMaterializedConnectionManager *)self sessionId];
  [(ASTMaterializedConnection *)v14 setSessionId:v16];

  [(ASTMaterializedConnection *)v14 setAllowsCellularAccess:v7];
  [(ASTMaterializedConnection *)v14 setDelegate:self];
  [(ASTMaterializedConnection *)v14 setRetryOnNetworkDisconnected:1];
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  id v22 = __145__ASTMaterializedConnectionManager_requestSelfServiceSuiteResultsWithDiagnosticEventID_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke;
  id v23 = &unk_264E7DA60;
  id v24 = v10;
  id v25 = v11;
  id v17 = v11;
  id v18 = v10;
  [(ASTMaterializedConnection *)v14 setDidReceiveResponse:&v20];
  -[ASTMaterializedConnection signBodyWithPayloadSigner:](v14, "signBodyWithPayloadSigner:", v12, v20, v21, v22, v23);

  uint64_t v19 = [(ASTMaterializedConnectionManager *)self networking];
  [v19 addConnection:v14];
}

void __145__ASTMaterializedConnectionManager_requestSelfServiceSuiteResultsWithDiagnosticEventID_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = [a2 dictionaryDroppingNSNullValues];
    id v11 = 0;
    BOOL v7 = [[ASTSuiteResult alloc] initWithDictionary:v6 error:&v11];
    id v8 = v11;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v9 = ASTLogHandleForCategory(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __145__ASTMaterializedConnectionManager_requestSelfServiceSuiteResultsWithDiagnosticEventID_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke_cold_1();
    }

    uint64_t v10 = *(void *)(a1 + 40);
    id v8 = [MEMORY[0x263F087E8] errorWithDomain:@"ASTErrorDomain" code:-7000 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, 0, v8);
  }
}

- (void)requestInstructionalPromptDetailsWithInstructionID:(id)a3 type:(id)a4 withPayloadSigner:(id)a5 language:(id)a6 locale:(id)a7 allowsCellularAccess:(BOOL)a8 completionHandler:(id)a9
{
  BOOL v9 = a8;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v16 = a9;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  id v22 = ASTLogHandleForCategory(1);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v31 = "-[ASTMaterializedConnectionManager requestInstructionalPromptDetailsWithInstructionID:type:withPayloadSigner:l"
          "anguage:locale:allowsCellularAccess:completionHandler:]";
    _os_log_impl(&dword_23CA80000, v22, OS_LOG_TYPE_DEFAULT, "[ASTConnectionManager] %s", buf, 0xCu);
  }

  id v23 = [[ASTConnectionRetrieveInstructionalPromptDetails alloc] initWithInstructionID:v21 type:v20 language:v18 locale:v17];
  id v24 = [(ASTMaterializedConnectionManager *)self identity];
  [(ASTMaterializedConnection *)v23 setIdentity:v24];

  id v25 = [(ASTMaterializedConnectionManager *)self sessionId];
  [(ASTMaterializedConnection *)v23 setSessionId:v25];

  [(ASTMaterializedConnection *)v23 setAllowsCellularAccess:v9];
  [(ASTMaterializedConnection *)v23 setDelegate:self];
  [(ASTMaterializedConnection *)v23 setRetryOnNetworkDisconnected:1];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __165__ASTMaterializedConnectionManager_requestInstructionalPromptDetailsWithInstructionID_type_withPayloadSigner_language_locale_allowsCellularAccess_completionHandler___block_invoke;
  v28[3] = &unk_264E7DA38;
  id v29 = v16;
  id v26 = v16;
  [(ASTMaterializedConnection *)v23 setDidReceiveResponse:v28];
  [(ASTMaterializedConnection *)v23 signBodyWithPayloadSigner:v19];

  uint64_t v27 = [(ASTMaterializedConnectionManager *)self networking];
  [v27 addConnection:v23];
}

void __165__ASTMaterializedConnectionManager_requestInstructionalPromptDetailsWithInstructionID_type_withPayloadSigner_language_locale_allowsCellularAccess_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    BOOL v7 = [v5 objectForKeyedSubscript:@"messages"];
    id v8 = [v5 objectForKeyedSubscript:@"options"];
    uint64_t v9 = [v5 objectForKeyedSubscript:@"images"];
    uint64_t v10 = (void *)v9;
    if (v7) {
      BOOL v11 = v8 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11 || v9 == 0)
    {
      char v13 = ASTLogHandleForCategory(1);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __165__ASTMaterializedConnectionManager_requestInstructionalPromptDetailsWithInstructionID_type_withPayloadSigner_language_locale_allowsCellularAccess_completionHandler___block_invoke_cold_2();
      }

      uint64_t v14 = *(void *)(a1 + 32);
      id v15 = [MEMORY[0x263F087E8] errorWithDomain:@"ASTErrorDomain" code:-7000 userInfo:0];
      (*(void (**)(uint64_t, void, void, void, void *))(v14 + 16))(v14, 0, 0, 0, v15);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {
    id v16 = ASTLogHandleForCategory(1);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __165__ASTMaterializedConnectionManager_requestInstructionalPromptDetailsWithInstructionID_type_withPayloadSigner_language_locale_allowsCellularAccess_completionHandler___block_invoke_cold_1();
    }

    uint64_t v17 = *(void *)(a1 + 32);
    BOOL v7 = [MEMORY[0x263F087E8] errorWithDomain:@"ASTErrorDomain" code:-7000 userInfo:0];
    (*(void (**)(uint64_t, void, void, void, void *))(v17 + 16))(v17, 0, 0, 0, v7);
  }
}

- (void)connection:(id)a3 connectionStateChanged:(int64_t)a4
{
  id v11 = a3;
  if ([v11 conformsToProtocol:&unk_26F0B9E40])
  {
    id v6 = [v11 testId];
    if (a4 == 1)
    {
      BOOL v7 = [v11 request];
      int v8 = [v7 allowsCellularAccess];

      uint64_t v9 = [(ASTMaterializedConnectionManager *)self delegate];
      [v9 connectionManager:self pausedSendingResultForTest:v6 reason:v8 == 0];
    }
    else
    {
      uint64_t v9 = [(ASTMaterializedConnectionManager *)self delegate];
      [v9 connectionManager:self resumedSendingResultForTest:v6];
    }
  }
  else
  {
    uint64_t v10 = [(ASTMaterializedConnectionManager *)self delegate];
    id v6 = v10;
    if (a4 == 1) {
      [v10 connectionManagerRequestPaused:self];
    }
    else {
      [v10 connectionManagerRequestResumed:self];
    }
  }
}

- (void)connection:(id)a3 didSendBodyData:(int64_t)a4 totalBytesSent:(int64_t)a5 totalBytesExpected:(int64_t)a6
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v9 = ASTLogHandleForCategory(1);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (a6 < 1)
  {
    if (v10)
    {
      int v15 = 134218240;
      int64_t v16 = a4;
      __int16 v17 = 2048;
      int64_t v18 = a5;
      id v12 = "bytes sent: %lld, total bytes sent: %lld";
      char v13 = v9;
      uint32_t v14 = 22;
      goto LABEL_6;
    }
  }
  else if (v10)
  {
    float v11 = (double)a5 / (double)a6;
    int v15 = 134218752;
    int64_t v16 = a4;
    __int16 v17 = 2048;
    int64_t v18 = a5;
    __int16 v19 = 2048;
    int64_t v20 = a6;
    __int16 v21 = 2048;
    double v22 = (float)(v11 * 100.0);
    id v12 = "bytes sent: %lld, total bytes sent: %lld, expected: %lld, complete: %0.1f%%";
    char v13 = v9;
    uint32_t v14 = 42;
LABEL_6:
    _os_log_impl(&dword_23CA80000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v15, v14);
  }
}

- (void)dealloc
{
  BOOL v3 = [(ASTMaterializedConnectionManager *)self networking];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)ASTMaterializedConnectionManager;
  [(ASTMaterializedConnectionManager *)&v4 dealloc];
}

- (BOOL)isValidUUID:(id)a3
{
  BOOL v3 = (objc_class *)MEMORY[0x263F08C38];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithUUIDString:v4];

  return v5 != 0;
}

- (ASTConnectionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ASTConnectionManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ASTIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (ASTNetworking)networking
{
  return self->_networking;
}

- (void)setNetworking:(id)a3
{
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_networking, 0);
  objc_storeStrong((id *)&self->_identity, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __137__ASTMaterializedConnectionManager_postSessionStatusForIdentities_ticket_timeout_allowsCellularAccess_requestQueuedSuiteInfo_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23CA80000, v0, v1, "[Session] <ERROR> %@", v2, v3, v4, v5, v6);
}

void __123__ASTMaterializedConnectionManager_downloadAsset_serverURL_endpoint_destinationFileHandle_allowsCellularAccess_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_23CA80000, v0, v1, "[Asset] <ERROR> %@, %@");
}

void __69__ASTMaterializedConnectionManager_postEnrollAllowingCellularAccess___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23CA80000, v0, v1, "[Enroll] <ERROR> %@", v2, v3, v4, v5, v6);
}

void __70__ASTMaterializedConnectionManager_postAuthInfo_allowsCellularAccess___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23CA80000, v0, v1, "[AuthInfo] <ERROR> %@", v2, v3, v4, v5, v6);
}

void __69__ASTMaterializedConnectionManager_postProfile_allowsCellularAccess___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23CA80000, v0, v1, "[Profile] <ERROR> %@", v2, v3, v4, v5, v6);
}

void __69__ASTMaterializedConnectionManager_postRequest_allowsCellularAccess___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23CA80000, v0, v1, "[Status] <ERROR> %@", v2, v3, v4, v5, v6);
}

void __69__ASTMaterializedConnectionManager_postRequest_allowsCellularAccess___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23CA80000, v0, v1, "[Status] <ERROR> Could not interpret response.", v2, v3, v4, v5, v6);
}

void __83__ASTMaterializedConnectionManager_postTestResult_allowsCellularAccess_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23CA80000, v0, v1, "[Test Results] <ERROR> %@", v2, v3, v4, v5, v6);
}

void __123__ASTMaterializedConnectionManager_postSealableFile_fileSequence_totalFiles_testId_dataId_allowsCellularAccess_completion___block_invoke_cold_1(id *a1)
{
  uint64_t v1 = [*a1 fileURL];
  uint64_t v2 = [v1 path];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8(&dword_23CA80000, v3, v4, "[File Upload] <ERROR> Could not remove file: %@, Error %@", v5, v6, v7, v8, v9);
}

void __123__ASTMaterializedConnectionManager_postSealableFile_fileSequence_totalFiles_testId_dataId_allowsCellularAccess_completion___block_invoke_cold_2(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) fileURL];
  uint64_t v2 = [v1 path];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8(&dword_23CA80000, v3, v4, "[File Upload] <ERROR> File: %@, Error %@", v5, v6, v7, v8, v9);
}

void __128__ASTMaterializedConnectionManager_requestSessionArchiveWithSessionID_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23CA80000, v0, v1, "[ASTConnectionManager] Self service session failed to archive with error %@", v2, v3, v4, v5, v6);
}

void __128__ASTMaterializedConnectionManager_requestSessionArchiveWithSessionID_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23CA80000, v0, v1, "[ASTConnectionManager] Self service session failed to archive", v2, v3, v4, v5, v6);
}

void __141__ASTMaterializedConnectionManager_requestSelfServiceSuitesAvailableWithConfigCode_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_23CA80000, v0, v1, "[ASTConnectionManager] Self service session failed to retrieve the suites available for config: %@, error: %@");
}

void __120__ASTMaterializedConnectionManager_postSelectSelfServiceSuite_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_23CA80000, v0, v1, "[ASTConnectionManager] Failed to select suite with ID: %@, error %@");
}

void __120__ASTMaterializedConnectionManager_postSelectSelfServiceSuite_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23CA80000, v0, v1, "[ASTConnectionManager] Diagnostic event ID has a wrong format", v2, v3, v4, v5, v6);
}

void __145__ASTMaterializedConnectionManager_requestSelfServiceSuiteResultsWithDiagnosticEventID_withPayloadSigner_allowsCellularAccess_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_23CA80000, v0, v1, "[ASTConnectionManager] Failed to retrieve suite run results, deid: %@, error %@");
}

void __165__ASTMaterializedConnectionManager_requestInstructionalPromptDetailsWithInstructionID_type_withPayloadSigner_language_locale_allowsCellularAccess_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23CA80000, v0, v1, "[ASTConnectionManager] Failed to retrieve prompt details results, error %@", v2, v3, v4, v5, v6);
}

void __165__ASTMaterializedConnectionManager_requestInstructionalPromptDetailsWithInstructionID_type_withPayloadSigner_language_locale_allowsCellularAccess_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23CA80000, v0, v1, "[ASTConnectionManager] Bad instructional prompt details response", v2, v3, v4, v5, v6);
}

@end