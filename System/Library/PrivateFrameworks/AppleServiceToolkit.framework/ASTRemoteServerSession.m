@interface ASTRemoteServerSession
+ (ASTRemoteServerSession)sessionWithContext:(id)a3;
+ (ASTRemoteServerSession)sessionWithIdentity:(id)a3;
+ (ASTRemoteServerSession)sessionWithSerialNumber:(id)a3;
+ (BOOL)auditToken:(id *)a3 hasEntitlement:(id)a4;
+ (BOOL)currentProcessHasEntitlement;
+ (void)downloadAsset:(id)a3 serverURL:(id)a4 endpoint:(id)a5 fileHandle:(id)a6 completionHandler:(id)a7;
+ (void)sessionStatusForIdentities:(id)a3 ticketNumber:(id)a4 timeout:(double)a5 requestQueuedSuiteInfo:(BOOL)a6 completionHandler:(id)a7;
- (ASTAuthInfoResult)pendingAuthInfoResult;
- (ASTConnectionManager)connectionManager;
- (ASTProfileResult)pendingProfileResult;
- (ASTRemoteServerSession)initWithContext:(id)a3;
- (ASTRemoteServerSession)initWithIdentity:(id)a3;
- (ASTRemoteServerSession)initWithSerialNumber:(id)a3;
- (ASTRequest)pendingPropertiesResult;
- (BOOL)_authInfoIfNecessary;
- (BOOL)_profile;
- (BOOL)_shouldAllowCellularForSealedSealablePayload:(id)a3;
- (BOOL)_shouldAllowCellularForSealedTestResult:(id)a3;
- (BOOL)_validateCommand:(int64_t)a3 clientStatus:(int64_t)a4;
- (BOOL)sendAuthInfoResult:(id)a3 error:(id *)a4;
- (BOOL)sendProfileResult:(id)a3 error:(id *)a4;
- (BOOL)sendTestResult:(id)a3 error:(id *)a4;
- (BOOL)shouldAbort;
- (BOOL)shouldContinueRequestLoop;
- (BOOL)shouldShowResults;
- (BOOL)shouldUnenroll;
- (NSError)clientStatusLoopError;
- (NSMutableDictionary)pendingTestResults;
- (NSMutableDictionary)runningTests;
- (NSString)sessionId;
- (OS_dispatch_queue)clientStatusQueue;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_semaphore)backoffTimer;
- (OS_dispatch_semaphore)pendingAuthInfoSemaphore;
- (OS_dispatch_semaphore)pendingProfileSemaphore;
- (OS_dispatch_semaphore)pendingPropertiesSemaphore;
- (id)_abort;
- (id)_clientAbort;
- (id)_continueWithLastRequest:(id)a3;
- (id)_idle;
- (id)_retryRequest;
- (id)_sendPropertiesWithData:(id)a3;
- (id)_sendRequest:(id)a3;
- (id)_sendTestResults:(id)a3;
- (id)_showInstructionalPromptWithData:(id)a3;
- (id)_signFile:(id)a3 error:(id *)a4;
- (id)_signPayload:(id)a3 error:(id *)a4;
- (id)_startNewTest:(id)a3 data:(id)a4;
- (id)_updateSessionSettingsWithData:(id)a3;
- (id)_updateUIWithData:(id)a3;
- (id)fileSigner;
- (id)payloadSigner;
- (id)sessionTeardownCompletion;
- (int64_t)backoffCounter;
- (int64_t)phase;
- (int64_t)retryCounter;
- (void)_abortRunningProcedures;
- (void)_archive;
- (void)_backoff;
- (void)_cancelControlExecution;
- (void)_cancelRunningTests;
- (void)_cancelSendingTestResults;
- (void)_endAndUnenrollIfNecessary:(BOOL)a3;
- (void)_protocolError;
- (void)_rebootWithData:(id)a3;
- (void)_setup;
- (void)_shutdownWithData:(id)a3;
- (void)_startClientStatusLoop;
- (void)_teardown;
- (void)_updateProgress:(id)a3;
- (void)archive;
- (void)connectionManager:(id)a3 pausedSendingResultForTest:(id)a4 reason:(int64_t)a5;
- (void)connectionManager:(id)a3 resumedSendingResultForTest:(id)a4;
- (void)connectionManagerRequestPaused:(id)a3;
- (void)connectionManagerRequestResumed:(id)a3;
- (void)dealloc;
- (void)end;
- (void)idle;
- (void)invalidate;
- (void)requestSuiteStart:(id)a3 completionHandler:(id)a4;
- (void)requestSuiteSummary:(id)a3 completionHandler:(id)a4;
- (void)requestSuitesAvailableWithCompletionHandler:(id)a3;
- (void)setBackoffCounter:(int64_t)a3;
- (void)setBackoffTimer:(id)a3;
- (void)setClientStatusLoopError:(id)a3;
- (void)setClientStatusQueue:(id)a3;
- (void)setConnectionManager:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setPendingAuthInfoResult:(id)a3;
- (void)setPendingAuthInfoSemaphore:(id)a3;
- (void)setPendingProfileResult:(id)a3;
- (void)setPendingProfileSemaphore:(id)a3;
- (void)setPendingPropertiesResult:(id)a3;
- (void)setPendingPropertiesSemaphore:(id)a3;
- (void)setPendingTestResults:(id)a3;
- (void)setPhase:(int64_t)a3;
- (void)setRetryCounter:(int64_t)a3;
- (void)setRunningTests:(id)a3;
- (void)setSessionEndReason:(int64_t)a3;
- (void)setSessionId:(id)a3;
- (void)setSessionTeardownCompletion:(id)a3;
- (void)setShouldAbort:(BOOL)a3;
- (void)setShouldContinueRequestLoop:(BOOL)a3;
- (void)setShouldUnenroll:(BOOL)a3;
- (void)start;
- (void)updateAction:(id)a3;
@end

@implementation ASTRemoteServerSession

- (ASTRemoteServerSession)initWithSerialNumber:(id)a3
{
  v4 = +[ASTIdentity identityWithSerialNumber:a3];
  v5 = [(ASTRemoteServerSession *)self initWithIdentity:v4];

  return v5;
}

+ (ASTRemoteServerSession)sessionWithSerialNumber:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithSerialNumber:v4];

  return (ASTRemoteServerSession *)v5;
}

- (ASTRemoteServerSession)initWithIdentity:(id)a3
{
  id v4 = a3;
  v5 = [[ASTContext alloc] initWithIdentity:v4];

  v6 = [(ASTRemoteServerSession *)self initWithContext:v5];
  return v6;
}

+ (ASTRemoteServerSession)sessionWithIdentity:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithIdentity:v4];

  return (ASTRemoteServerSession *)v5;
}

- (ASTRemoteServerSession)initWithContext:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)ASTRemoteServerSession;
  v6 = [(ASTRemoteServerSession *)&v28 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->super._context, a3);
    v8 = +[ASTEnvironment currentEnvironment];
    v9 = [v8 SOCKSProxyServer];
    v10 = [v8 SOCKSProxyPort];
    v11 = [[ASTMaterializedConnectionManager alloc] initWithSOCKSProxyServer:v9 port:v10];
    connectionManager = v7->_connectionManager;
    v7->_connectionManager = (ASTConnectionManager *)v11;

    [(ASTConnectionManager *)v7->_connectionManager setDelegate:v7];
    v13 = [(ASTContext *)v7->super._context identity];
    [(ASTConnectionManager *)v7->_connectionManager setIdentity:v13];

    v7->super._sessionEndReason = 0;
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.AppleServiceToolkit.delegateQueue", 0);
    delegateQueue = v7->_delegateQueue;
    v7->_delegateQueue = (OS_dispatch_queue *)v14;

    dispatch_queue_t v16 = dispatch_queue_create("com.apple.AppleServiceToolkit.clientStatusLoop", 0);
    clientStatusQueue = v7->_clientStatusQueue;
    v7->_clientStatusQueue = (OS_dispatch_queue *)v16;

    v7->super._allowCellularSizeThreshold = +[ASTConnectionUtilities allowCellularSizeThreshold];
    objc_initWeak(&location, v7);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __42__ASTRemoteServerSession_initWithContext___block_invoke;
    v25[3] = &unk_264E7DD38;
    objc_copyWeak(&v26, &location);
    uint64_t v18 = MEMORY[0x23ECF0530](v25);
    id payloadSigner = v7->_payloadSigner;
    v7->_id payloadSigner = (id)v18;

    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __42__ASTRemoteServerSession_initWithContext___block_invoke_2;
    v23[3] = &unk_264E7DD60;
    objc_copyWeak(&v24, &location);
    uint64_t v20 = MEMORY[0x23ECF0530](v23);
    id fileSigner = v7->_fileSigner;
    v7->_id fileSigner = (id)v20;

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  return v7;
}

id __42__ASTRemoteServerSession_initWithContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  v7 = [WeakRetained _signPayload:v5 error:a3];

  return v7;
}

id __42__ASTRemoteServerSession_initWithContext___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  v7 = [WeakRetained _signFile:v5 error:a3];

  return v7;
}

+ (ASTRemoteServerSession)sessionWithContext:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithContext:v4];

  return (ASTRemoteServerSession *)v5;
}

- (BOOL)shouldShowResults
{
  return 1;
}

- (void)setSessionEndReason:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  if (!obj->super._sessionEndReason) {
    obj->super._sessionEndReason = a3;
  }
  objc_sync_exit(obj);
}

+ (void)sessionStatusForIdentities:(id)a3 ticketNumber:(id)a4 timeout:(double)a5 requestQueuedSuiteInfo:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v7 = a6;
  id v11 = a7;
  id v12 = a4;
  id v13 = a3;
  dispatch_queue_t v14 = +[ASTEnvironment currentEnvironment];
  v15 = [v14 SOCKSProxyServer];
  dispatch_queue_t v16 = [v14 SOCKSProxyPort];
  v17 = [[ASTMaterializedConnectionManager alloc] initWithSOCKSProxyServer:v15 port:v16];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __115__ASTRemoteServerSession_sessionStatusForIdentities_ticketNumber_timeout_requestQueuedSuiteInfo_completionHandler___block_invoke;
  v19[3] = &unk_264E7DD88;
  id v20 = v11;
  id v18 = v11;
  [(ASTMaterializedConnectionManager *)v17 postSessionStatusForIdentities:v13 ticket:v12 timeout:1 allowsCellularAccess:v7 requestQueuedSuiteInfo:v19 completion:a5];
}

void __115__ASTRemoteServerSession_sessionStatusForIdentities_ticketNumber_timeout_requestQueuedSuiteInfo_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8)
{
  v27[1] = *MEMORY[0x263EF8340];
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = v17;
  if (v17)
  {
    v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F08608];
    v27[0] = v17;
    id v20 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
    v21 = [v19 errorWithDomain:@"ASTErrorDomain" code:-1002 userInfo:v20];
  }
  else
  {
    v22 = +[ASTEnvironment currentEnvironment];
    [v22 setDiagsChannel:v14];

    v23 = +[ASTEnvironment currentEnvironment];
    [v23 setConfigCode:v15];

    id v24 = +[ASTEnvironment currentEnvironment];
    [v24 setAssetURL:v16];

    v21 = 0;
  }
  v25 = [[ASTSessionInfo alloc] initWithQueuedSuiteType:a4 isGuided:a3];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)start
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23CA80000, v0, v1, "Ignored call to -[ASTSession start] while a session was already running.", v2, v3, v4, v5, v6);
}

void __31__ASTRemoteServerSession_start__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained connectionManager];
  uint64_t v3 = [v2 postEnrollAllowingCellularAccess:1];
  [WeakRetained setSessionId:v3];

  uint64_t v4 = [WeakRetained sessionId];

  if (!v4)
  {
    v10 = [MEMORY[0x263F087E8] errorWithDomain:@"ASTErrorDomain" code:-1000 userInfo:0];
    [WeakRetained setClientStatusLoopError:v10];

    id v11 = [WeakRetained clientStatusLoopError];
    +[ASTAnalytics sendAnalyticsWithEvent:0 error:v11];

    id v12 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __31__ASTRemoteServerSession_start__block_invoke_cold_1();
    }
    goto LABEL_13;
  }
  if (([WeakRetained _authInfoIfNecessary] & 1) == 0)
  {
    id v13 = [MEMORY[0x263F087E8] errorWithDomain:@"ASTErrorDomain" code:-1005 userInfo:0];
    [WeakRetained setClientStatusLoopError:v13];

    id v14 = [WeakRetained clientStatusLoopError];
    +[ASTAnalytics sendAnalyticsWithEvent:1 error:v14];

    id v12 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __31__ASTRemoteServerSession_start__block_invoke_cold_3();
    }
    goto LABEL_13;
  }
  if (([WeakRetained _profile] & 1) == 0)
  {
    id v15 = [MEMORY[0x263F087E8] errorWithDomain:@"ASTErrorDomain" code:-1001 userInfo:0];
    [WeakRetained setClientStatusLoopError:v15];

    id v16 = [WeakRetained clientStatusLoopError];
    +[ASTAnalytics sendAnalyticsWithEvent:2 error:v16];

    id v12 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __31__ASTRemoteServerSession_start__block_invoke_cold_2();
    }
LABEL_13:

    [WeakRetained _teardown];
    goto LABEL_14;
  }
  uint64_t v5 = [WeakRetained context];
  uint8_t v6 = [v5 controlCommand];

  if (v6)
  {
    BOOL v7 = [WeakRetained context];
    v8 = [v7 controlCommand];
    v9 = [WeakRetained delegateQueue];
    [v8 performActionsWithSession:WeakRetained queue:v9];
  }
  [WeakRetained _startClientStatusLoop];
LABEL_14:
}

void __31__ASTRemoteServerSession_start__block_invoke_33(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [MEMORY[0x263F087E8] errorWithDomain:@"ASTErrorDomain" code:-2000 userInfo:0];
  uint64_t v2 = [WeakRetained delegate];
  [v2 session:WeakRetained didEndWithError:v1];

  +[ASTAnalytics sendAnalyticsWithEvent:0 error:v1];
}

- (void)idle
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(ASTRemoteServerSession *)self sessionId];
    int v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_23CA80000, v3, OS_LOG_TYPE_DEFAULT, "[IDLE] (%@)", (uint8_t *)&v7, 0xCu);
  }
  [(ASTRemoteServerSession *)self setShouldAbort:1];
  uint64_t v5 = [(ASTRemoteServerSession *)self backoffTimer];

  if (v5)
  {
    uint8_t v6 = [(ASTRemoteServerSession *)self backoffTimer];
    dispatch_semaphore_signal(v6);
  }
}

- (void)end
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(ASTRemoteServerSession *)self sessionId];
    int v5 = 138412290;
    uint8_t v6 = v4;
    _os_log_impl(&dword_23CA80000, v3, OS_LOG_TYPE_DEFAULT, "[END] (%@)", (uint8_t *)&v5, 0xCu);
  }
  [(ASTRemoteServerSession *)self _endAndUnenrollIfNecessary:1];
}

- (void)invalidate
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(ASTRemoteServerSession *)self sessionId];
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v4;
    _os_log_impl(&dword_23CA80000, v3, OS_LOG_TYPE_DEFAULT, "[INVALIDATE] (%@)", buf, 0xCu);
  }
  int v5 = self;
  objc_sync_enter(v5);
  [(ASTRemoteServerSession *)v5 setPhase:3];
  objc_sync_exit(v5);

  objc_initWeak((id *)buf, v5);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__ASTRemoteServerSession_invalidate__block_invoke;
  v6[3] = &unk_264E7DDB0;
  objc_copyWeak(&v7, (id *)buf);
  [(ASTRemoteServerSession *)v5 setSessionTeardownCompletion:v6];
  [(ASTRemoteServerSession *)v5 _endAndUnenrollIfNecessary:0];
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __36__ASTRemoteServerSession_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v1);
    uint8_t v6 = [v5 delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __36__ASTRemoteServerSession_invalidate__block_invoke_2;
    block[3] = &unk_264E7DDB0;
    objc_copyWeak(&v8, v1);
    dispatch_async(v6, block);

    objc_destroyWeak(&v8);
  }
}

void __36__ASTRemoteServerSession_invalidate__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained delegate];
  id v3 = objc_loadWeakRetained(v1);
  [v2 sessionDidInvalidate:v3];
}

- (void)archive
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23CA80000, v0, v1, "Failed to archive the session, session id is nil", v2, v3, v4, v5, v6);
}

void __33__ASTRemoteServerSession_archive__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __33__ASTRemoteServerSession_archive__block_invoke_cold_1(a1, v3);
    }
  }
}

- (void)_endAndUnenrollIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(ASTRemoteServerSession *)v4 phase];
  if ((unint64_t)(v5 - 1) >= 3)
  {
    if (v5)
    {
      objc_sync_exit(v4);

      id v11 = ASTLogHandleForCategory(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[ASTRemoteServerSession _endAndUnenrollIfNecessary:]();
      }
    }
    else
    {
      objc_sync_exit(v4);

      [(ASTRemoteServerSession *)v4 _teardown];
    }
    uint8_t v6 = 0;
    id v7 = 0;
  }
  else
  {
    if ([(ASTRemoteServerSession *)v4 phase] != 3) {
      [(ASTRemoteServerSession *)v4 setPhase:4];
    }
    uint8_t v6 = [(ASTRemoteServerSession *)v4 pendingProfileSemaphore];
    [(ASTRemoteServerSession *)v4 setPendingProfileResult:0];
    [(ASTRemoteServerSession *)v4 setPendingProfileSemaphore:0];
    id v7 = [(ASTRemoteServerSession *)v4 pendingPropertiesSemaphore];
    [(ASTRemoteServerSession *)v4 setPendingPropertiesResult:0];
    [(ASTRemoteServerSession *)v4 setPendingPropertiesSemaphore:0];
    id v8 = [(ASTRemoteServerSession *)v4 pendingAuthInfoSemaphore];
    [(ASTRemoteServerSession *)v4 setPendingAuthInfoResult:0];
    [(ASTRemoteServerSession *)v4 setPendingAuthInfoSemaphore:0];
    objc_sync_exit(v4);

    [(ASTRemoteServerSession *)v4 setShouldUnenroll:v3];
    [(ASTRemoteServerSession *)v4 setShouldContinueRequestLoop:0];
    [(ASTRemoteServerSession *)v4 _cancelRunningTests];
    uint64_t v9 = [(ASTRemoteServerSession *)v4 backoffTimer];

    if (v9)
    {
      uint64_t v10 = [(ASTRemoteServerSession *)v4 backoffTimer];
      dispatch_semaphore_signal(v10);
    }
    if (v6) {
      dispatch_semaphore_signal(v6);
    }
    if (v7) {
      dispatch_semaphore_signal(v7);
    }
    if (v8)
    {
      dispatch_semaphore_signal(v8);
    }
  }
}

- (void)_startClientStatusLoop
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  [(ASTRemoteServerSession *)v2 setPhase:2];
  objc_sync_exit(v2);

  objc_initWeak(&location, v2);
  BOOL v3 = [(ASTSession *)v2 delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(ASTRemoteServerSession *)v2 delegateQueue];
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v53 = 3221225472;
    v54 = __48__ASTRemoteServerSession__startClientStatusLoop__block_invoke;
    v55 = &unk_264E7DDB0;
    objc_copyWeak(&v56, &location);
    dispatch_async(v5, &block);

    objc_destroyWeak(&v56);
  }
  uint8_t v6 = objc_alloc_init(ASTRequest);
  id v7 = [MEMORY[0x263EFF910] date];
  id v8 = [(ASTSession *)v2 context];
  uint64_t v9 = [v8 clientStatus];

  if ((unint64_t)(v9 - 13) < 2)
  {
    uint64_t v10 = [(ASTSession *)v2 context];
    id v11 = [v10 controlCommand];
    id v12 = [v11 requestData];
    [(ASTRequest *)v6 setData:v12];

LABEL_7:
    id v14 = [(ASTSession *)v2 context];
    -[ASTRequest setClientStatus:](v6, "setClientStatus:", [v14 clientStatus]);

    goto LABEL_8;
  }
  if (v9) {
    goto LABEL_7;
  }
  [(ASTRequest *)v6 setClientStatus:1];
LABEL_8:
  *(void *)&long long v13 = 138412290;
  long long v51 = v13;
  while ([(ASTRemoteServerSession *)v2 shouldContinueRequestLoop])
  {
    id v15 = (void *)MEMORY[0x23ECF0310]();
    if ([(ASTRemoteServerSession *)v2 shouldAbort])
    {
      [(ASTRemoteServerSession *)v2 setShouldAbort:0];
      uint64_t v16 = [(ASTRemoteServerSession *)v2 _clientAbort];

      uint8_t v6 = (ASTRequest *)v16;
    }
    uint64_t v17 = [(ASTRequest *)v6 clientStatus];
    id v18 = [(ASTSession *)v2 context];
    [v18 setClientStatus:v17];

    v19 = [(ASTRemoteServerSession *)v2 _sendRequest:v6];
    id v20 = v19;
    if (!v19)
    {
      uint64_t v26 = [(ASTRemoteServerSession *)v2 _retryRequest];
      goto LABEL_20;
    }
    v21 = [v19 progress];
    [(ASTRemoteServerSession *)v2 _updateProgress:v21];

    uint64_t v22 = [v20 command];
    if (![(ASTRemoteServerSession *)v2 _validateCommand:v22 clientStatus:[(ASTRequest *)v6 clientStatus]])
    {
      [(ASTRemoteServerSession *)v2 _protocolError];
      uint64_t v26 = [(ASTRemoteServerSession *)v2 _retryRequest];
LABEL_20:
      v27 = v6;
      uint8_t v6 = (ASTRequest *)v26;
LABEL_21:

      goto LABEL_22;
    }
    uint64_t v23 = [v20 command];
    id v24 = [(ASTSession *)v2 context];
    [v24 setCommand:v23];

    if (v22 != 7) {
      [(ASTRemoteServerSession *)v2 setBackoffCounter:0];
    }
    [(ASTRemoteServerSession *)v2 setRetryCounter:0];
    switch(v22)
    {
      case 1:
        uint64_t v25 = [(ASTRemoteServerSession *)v2 _idle];
        goto LABEL_38;
      case 2:
        objc_super v28 = [v20 data];
        uint64_t v29 = [(ASTRemoteServerSession *)v2 _updateUIWithData:v28];
        goto LABEL_35;
      case 3:
        objc_super v28 = [v20 testId];
        v30 = [v20 data];
        uint64_t v31 = [(ASTRemoteServerSession *)v2 _startNewTest:v28 data:v30];
        goto LABEL_32;
      case 4:
        objc_super v28 = [v20 testId];
        uint64_t v29 = [(ASTRemoteServerSession *)v2 _sendTestResults:v28];
        goto LABEL_35;
      case 5:
        objc_super v28 = [v20 data];
        uint64_t v29 = [(ASTRemoteServerSession *)v2 _sendPropertiesWithData:v28];
        goto LABEL_35;
      case 6:
        objc_super v28 = [v20 data];
        uint64_t v29 = [(ASTRemoteServerSession *)v2 _updateSessionSettingsWithData:v28];
        goto LABEL_35;
      case 7:
        uint64_t v25 = [(ASTRemoteServerSession *)v2 _continueWithLastRequest:v6];
        goto LABEL_38;
      case 8:
        uint64_t v25 = [(ASTRemoteServerSession *)v2 _abort];
LABEL_38:
        uint64_t v31 = v25;
        goto LABEL_39;
      case 9:
        [(ASTRemoteServerSession *)v2 _archive];
        uint64_t v37 = 1;
        goto LABEL_43;
      case 10:
        v32 = ASTLogHandleForCategory(0);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v33 = [(ASTRemoteServerSession *)v2 sessionId];
          *(_DWORD *)buf = v51;
          v61 = v33;
          _os_log_impl(&dword_23CA80000, v32, OS_LOG_TYPE_DEFAULT, "[CONTROL] (%@)", buf, 0xCu);
        }
        objc_super v28 = [(ASTSession *)v2 context];
        v30 = [(ASTRequest *)v28 controlCommand];
        uint64_t v34 = [v20 data];
        v35 = [(ASTRemoteServerSession *)v2 delegateQueue];
        uint64_t v31 = [(ASTRequest *)v30 requestWithData:v34 session:v2 queue:v35];

        uint8_t v6 = (ASTRequest *)v34;
LABEL_32:

        uint8_t v6 = v30;
        goto LABEL_36;
      case 11:
        v36 = [v20 data];
        [(ASTRemoteServerSession *)v2 _rebootWithData:v36];
        uint64_t v37 = 2;
        goto LABEL_42;
      case 12:
        v36 = [v20 data];
        [(ASTRemoteServerSession *)v2 _shutdownWithData:v36];
        uint64_t v37 = 3;
LABEL_42:

LABEL_43:
        [(ASTRemoteServerSession *)v2 setSessionEndReason:v37];
        [(ASTRemoteServerSession *)v2 setShouldContinueRequestLoop:0];
        break;
      case 13:
        objc_super v28 = [v20 data];
        uint64_t v29 = [(ASTRemoteServerSession *)v2 _showInstructionalPromptWithData:v28];
LABEL_35:
        uint64_t v31 = v29;
LABEL_36:

        uint8_t v6 = v28;
LABEL_39:

        uint8_t v6 = (ASTRequest *)v31;
        break;
      default:
        break;
    }
    if ([(ASTRequest *)v6 clientStatus] != 13 && [(ASTRequest *)v6 clientStatus] != 14)
    {
      v38 = [(ASTSession *)v2 context];
      BOOL v39 = [v38 clientStatus] == 14;

      if (v39)
      {
        v27 = [(ASTSession *)v2 context];
        v40 = [v27 controlCommand];
        [v40 reset];

        goto LABEL_21;
      }
    }
LABEL_22:
  }
  if ([(ASTRemoteServerSession *)v2 shouldUnenroll])
  {
    v41 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = [(ASTRemoteServerSession *)v2 sessionId];
      *(_DWORD *)buf = v51;
      v61 = v42;
      _os_log_impl(&dword_23CA80000, v41, OS_LOG_TYPE_DEFAULT, "[UNENROLL] (%@)", buf, 0xCu);
    }
    v43 = +[ASTRequest request];
    [v43 setClientStatus:9];
    [(ASTRemoteServerSession *)v2 setSessionEndReason:4];
    v44 = [(ASTRemoteServerSession *)v2 payloadSigner];
    [v43 sealWithPayloadSigner:v44 error:0];

    uint64_t v45 = [(ASTRemoteServerSession *)v2 _shouldAllowCellularForSealedSealablePayload:v43];
    v46 = [(ASTRemoteServerSession *)v2 connectionManager];
    id v47 = (id)[v46 postRequest:v43 allowsCellularAccess:v45];

    v48 = [MEMORY[0x263EFF910] date];
    [v48 timeIntervalSinceDate:v7];
    v58 = @"sessionDuration";
    v49 = objc_msgSend(NSNumber, "numberWithDouble:");
    v59 = v49;
    v50 = [NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
    +[ASTAnalytics sendAnalyticsWithEvent:3 payloadDict:v50];
  }
  [(ASTRemoteServerSession *)v2 _teardown];

  objc_destroyWeak(&location);
}

void __48__ASTRemoteServerSession__startClientStatusLoop__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained delegate];
  [v1 sessionDidStart:WeakRetained];
}

- (void)_setup
{
  [(ASTRemoteServerSession *)self setShouldContinueRequestLoop:1];
  [(ASTRemoteServerSession *)self setShouldUnenroll:0];
  [(ASTRemoteServerSession *)self setShouldAbort:0];
  [(ASTRemoteServerSession *)self setRetryCounter:0];
  [(ASTRemoteServerSession *)self setBackoffCounter:0];
  BOOL v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(ASTRemoteServerSession *)self setRunningTests:v3];

  char v4 = [MEMORY[0x263EFF9A0] dictionary];
  [(ASTRemoteServerSession *)self setPendingTestResults:v4];

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __32__ASTRemoteServerSession__setup__block_invoke;
  v5[3] = &unk_264E7DDB0;
  objc_copyWeak(&v6, &location);
  [(ASTRemoteServerSession *)self setSessionTeardownCompletion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __32__ASTRemoteServerSession__setup__block_invoke(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = [WeakRetained delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v1);
    id v6 = [v5 delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __32__ASTRemoteServerSession__setup__block_invoke_2;
    block[3] = &unk_264E7DDB0;
    objc_copyWeak(&v8, v1);
    dispatch_async(v6, block);

    objc_destroyWeak(&v8);
  }
}

void __32__ASTRemoteServerSession__setup__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained delegate];
  id v3 = objc_loadWeakRetained(v1);
  char v4 = [v3 clientStatusLoopError];
  [v2 session:v3 didEndWithError:v4];
}

- (void)_teardown
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(ASTRemoteServerSession *)v2 phase];
  objc_sync_exit(v2);

  if (v3 != 3) {
    [(ASTRemoteServerSession *)v2 _cancelControlExecution];
  }
  [(ASTRemoteServerSession *)v2 _cancelRunningTests];
  char v4 = v2;
  objc_sync_enter(v4);
  [(ASTRemoteServerSession *)v4 setPhase:0];
  objc_sync_exit(v4);

  id v5 = [(ASTRemoteServerSession *)v4 sessionTeardownCompletion];
  v5[2]();
}

- (BOOL)_authInfoIfNecessary
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  char v4 = self;
  objc_sync_enter(v4);
  [(ASTRemoteServerSession *)v4 setPendingAuthInfoSemaphore:v3];
  objc_sync_exit(v4);

  objc_initWeak(&location, v4);
  id v5 = [(ASTRemoteServerSession *)v4 delegateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__ASTRemoteServerSession__authInfoIfNecessary__block_invoke;
  block[3] = &unk_264E7DDD8;
  objc_copyWeak(&v15, &location);
  id v6 = v3;
  id v14 = v6;
  dispatch_async(v5, block);

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id v7 = v4;
  objc_sync_enter(v7);
  id v8 = [(ASTRemoteServerSession *)v7 pendingAuthInfoResult];
  [(ASTRemoteServerSession *)v7 setPendingAuthInfoResult:0];
  [(ASTRemoteServerSession *)v7 setPendingAuthInfoSemaphore:0];
  objc_sync_exit(v7);

  if (v8)
  {
    uint64_t v9 = [(ASTRemoteServerSession *)v7 _shouldAllowCellularForSealedSealablePayload:v8];
    uint64_t v10 = [(ASTRemoteServerSession *)v7 connectionManager];
    char v11 = [(ASTRemoteServerSession *)v10 postAuthInfo:v8 allowsCellularAccess:v9];
  }
  else
  {
    uint64_t v10 = v7;
    objc_sync_enter(v10);
    char v11 = [(ASTRemoteServerSession *)v10 phase] == 1;
    objc_sync_exit(v10);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v11;
}

void __46__ASTRemoteServerSession__authInfoIfNecessary__block_invoke(uint64_t a1)
{
  v11[2] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_semaphore_t v3 = [WeakRetained delegate];
  int v4 = [v3 conformsToProtocol:&unk_26F0B78A8];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x23ECF0310]();
    id v6 = [WeakRetained delegate];
    id v7 = objc_alloc(MEMORY[0x263F08C38]);
    id v8 = [WeakRetained sessionId];
    uint64_t v9 = (void *)[v7 initWithUUIDString:v8];

    v11[0] = 0;
    v11[1] = 0;
    [v9 getUUIDBytes:v11];
    uint64_t v10 = [MEMORY[0x263EFF8F8] dataWithBytes:v11 length:16];
    [v6 session:WeakRetained generateAuthInfoWithNonce:v10];
  }
  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

- (BOOL)_profile
{
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__4;
  v17[4] = __Block_byref_object_dispose__4;
  dispatch_semaphore_t v3 = [(ASTSession *)self context];
  int v4 = [v3 identity];
  id v18 = +[ASTProfileResult resultWithIdentity:v4];

  id v5 = dispatch_semaphore_create(0);
  id v6 = self;
  objc_sync_enter(v6);
  [(ASTRemoteServerSession *)v6 setPendingProfileSemaphore:v5];
  objc_sync_exit(v6);

  objc_initWeak(&location, v6);
  id v7 = [(ASTRemoteServerSession *)v6 delegateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__ASTRemoteServerSession__profile__block_invoke;
  block[3] = &unk_264E7DE00;
  objc_copyWeak(&v15, &location);
  void block[4] = v17;
  dispatch_async(v7, block);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  id v8 = v6;
  objc_sync_enter(v8);
  uint64_t v9 = [(ASTRemoteServerSession *)v8 pendingProfileResult];
  [(ASTRemoteServerSession *)v8 setPendingProfileSemaphore:0];
  [(ASTRemoteServerSession *)v8 setPendingProfileResult:0];
  objc_sync_exit(v8);

  if (v9)
  {
    uint64_t v10 = [(ASTRemoteServerSession *)v8 _shouldAllowCellularForSealedSealablePayload:v9];
    char v11 = [(ASTRemoteServerSession *)v8 connectionManager];
    char v12 = [v11 postProfile:v9 allowsCellularAccess:v10];
  }
  else
  {
    char v12 = 0;
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  _Block_object_dispose(v17, 8);
  return v12;
}

void __34__ASTRemoteServerSession__profile__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x23ECF0310]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v4 = [WeakRetained delegate];
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v6 = [MEMORY[0x263EFF8C0] array];
  [v4 session:WeakRetained profile:v5 filteredByComponents:v6];
}

- (id)_sendRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ASTRemoteServerSession *)self runningTests];
  objc_sync_enter(v5);
  id v6 = [(ASTRemoteServerSession *)self runningTests];
  id v7 = [v6 allKeys];

  objc_sync_exit(v5);
  id v8 = [(ASTRemoteServerSession *)self pendingTestResults];
  uint64_t v9 = [v8 allKeys];

  if (v7 && ([v7 count] || objc_msgSend(v9, "count")))
  {
    uint64_t v10 = [(ASTRemoteServerSession *)self runningTests];
    char v11 = [v10 allKeys];
    char v12 = [v11 firstObject];

    long long v13 = [(ASTRemoteServerSession *)self pendingTestResults];
    id v14 = [v13 allKeys];
    id v15 = [v14 firstObject];

    if (v12) {
      uint64_t v16 = v12;
    }
    else {
      uint64_t v16 = v15;
    }
    id v17 = v16;
    [v4 setCurrentTest:v17];
    if (v12)
    {
      id v18 = [(ASTSession *)self delegate];
      char v19 = objc_opt_respondsToSelector();

      if (v19)
      {
        id v20 = [(ASTRemoteServerSession *)self delegateQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __39__ASTRemoteServerSession__sendRequest___block_invoke;
        block[3] = &unk_264E7D6A8;
        void block[4] = self;
        id v37 = v12;
        id v38 = v4;
        dispatch_sync(v20, block);
      }
      if (+[ASTRequest isEstimatedTimeRemainingFeatureEnabled])
      {
        v21 = [(ASTSession *)self delegate];
        char v22 = objc_opt_respondsToSelector();

        if (v22)
        {
          uint64_t v23 = [(ASTRemoteServerSession *)self delegateQueue];
          uint64_t v29 = MEMORY[0x263EF8330];
          uint64_t v30 = 3221225472;
          uint64_t v31 = __39__ASTRemoteServerSession__sendRequest___block_invoke_2;
          v32 = &unk_264E7D6A8;
          v33 = self;
          id v34 = v12;
          id v35 = v4;
          dispatch_sync(v23, &v29);
        }
      }
    }
    else if ([v4 clientStatus] == 4)
    {
      [v4 setProgress:&unk_26F0B5A48];
      [v4 setEstimatedTimeRemaining:&unk_26F0B5A60];
    }
  }
  id v24 = [(ASTRemoteServerSession *)self payloadSigner];
  [v4 sealWithPayloadSigner:v24 error:0];

  BOOL v25 = [(ASTRemoteServerSession *)self _shouldAllowCellularForSealedSealablePayload:v4];
  uint64_t v26 = [(ASTRemoteServerSession *)self connectionManager];
  v27 = [v26 postRequest:v4 allowsCellularAccess:v25];

  return v27;
}

void __39__ASTRemoteServerSession__sendRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  id v7 = [v2 session:*(void *)(a1 + 32) progressForTest:*(void *)(a1 + 40)];

  dispatch_semaphore_t v3 = v7;
  if (v7)
  {
    id v4 = NSNumber;
    [v7 doubleValue];
    id v6 = [v4 numberWithDouble:round(v5)];
    [*(id *)(a1 + 48) setProgress:v6];

    dispatch_semaphore_t v3 = v7;
  }
}

void __39__ASTRemoteServerSession__sendRequest___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  id v7 = [v2 session:*(void *)(a1 + 32) estimatedTimeRemainingForTest:*(void *)(a1 + 40)];

  dispatch_semaphore_t v3 = v7;
  if (v7)
  {
    id v4 = NSNumber;
    [v7 doubleValue];
    id v6 = [v4 numberWithDouble:round(v5)];
    [*(id *)(a1 + 48) setEstimatedTimeRemaining:v6];

    dispatch_semaphore_t v3 = v7;
  }
}

- (void)_updateProgress:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = [(ASTSession *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      objc_initWeak(&location, self);
      id v7 = [(ASTRemoteServerSession *)self delegateQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __42__ASTRemoteServerSession__updateProgress___block_invoke;
      block[3] = &unk_264E7DDD8;
      objc_copyWeak(&v10, &location);
      id v9 = v4;
      dispatch_async(v7, block);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __42__ASTRemoteServerSession__updateProgress___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained delegate];
  [v2 session:WeakRetained didUpdateTestSuiteProgress:*(void *)(a1 + 32)];
}

- (id)_idle
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  dispatch_semaphore_t v3 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(ASTRemoteServerSession *)self sessionId];
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_23CA80000, v3, OS_LOG_TYPE_DEFAULT, "[IDLE] (%@)", (uint8_t *)&v7, 0xCu);
  }
  [(ASTRemoteServerSession *)self _backoff];
  double v5 = +[ASTRequest request];
  [v5 setClientStatus:1];

  return v5;
}

- (id)_updateUIWithData:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = [(ASTRemoteServerSession *)self sessionId];
    *(_DWORD *)buf = 138412290;
    objc_super v28 = v6;
    _os_log_impl(&dword_23CA80000, v5, OS_LOG_TYPE_DEFAULT, "[UPDATE UI] (%@)", buf, 0xCu);
  }
  int v7 = +[ASTRequest request];
  [v7 setClientStatus:2];
  id v8 = [v4 objectForKeyedSubscript:@"action"];
  if ([v8 isEqualToString:@"TestSuiteStarting"])
  {
    uint64_t v9 = [(ASTSession *)self context];
    [v9 setTestSuiteRunning:1];

    id v10 = [(ASTSession *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0) {
      goto LABEL_19;
    }
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __44__ASTRemoteServerSession__updateUIWithData___block_invoke;
    v24[3] = &unk_264E7DE50;
    id v25 = v4;
    uint64_t v26 = self;
    +[ASTLocalization prepareLocalizedStringsWithCompletionHandler:v24];
    char v12 = v25;
    goto LABEL_8;
  }
  if ([v8 isEqualToString:@"TestSuiteComplete"])
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __44__ASTRemoteServerSession__updateUIWithData___block_invoke_3;
    v22[3] = &unk_264E7D680;
    v22[4] = self;
    id v23 = v4;
    [v7 setCompletion:v22];
    char v12 = v23;
LABEL_8:

    goto LABEL_19;
  }
  if ([v8 isEqualToString:@"TestSuiteImage"])
  {
    long long v13 = [v4 objectForKeyedSubscript:@"imageName"];
    id v14 = v13;
    if (v13)
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __44__ASTRemoteServerSession__updateUIWithData___block_invoke_6;
      v20[3] = &unk_264E7DE78;
      v20[4] = self;
      id v21 = v13;
      [(ASTSession *)self requestAsset:v21 completionHandler:v20];
    }
    else
    {
      id v17 = ASTLogHandleForCategory(0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[ASTRemoteServerSession _updateUIWithData:]();
      }

      uint64_t v18 = [(ASTRemoteServerSession *)self _retryRequest];

      int v7 = (void *)v18;
    }
  }
  else
  {
    id v15 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[ASTRemoteServerSession _updateUIWithData:]();
    }

    uint64_t v16 = [(ASTRemoteServerSession *)self _retryRequest];

    int v7 = (void *)v16;
  }
LABEL_19:

  return v7;
}

void __44__ASTRemoteServerSession__updateUIWithData___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  double v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"viewTitle"];
  char v6 = +[ASTLocalization localizedStringForKey:v5];

  int v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"suiteName"];
  id v8 = +[ASTLocalization localizedStringForKey:v7];

  objc_initWeak(&location, *(id *)(a1 + 40));
  uint64_t v9 = [*(id *)(a1 + 40) delegateQueue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__ASTRemoteServerSession__updateUIWithData___block_invoke_2;
  v12[3] = &unk_264E7DE28;
  objc_copyWeak(&v15, &location);
  id v13 = v8;
  id v14 = v6;
  id v10 = v6;
  id v11 = v8;
  dispatch_async(v9, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __44__ASTRemoteServerSession__updateUIWithData___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained delegate];
  [v2 session:WeakRetained didStartTestSuite:*(void *)(a1 + 32) description:*(void *)(a1 + 40)];
}

void __44__ASTRemoteServerSession__updateUIWithData___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  [v2 setTestSuiteRunning:0];

  dispatch_semaphore_t v3 = [*(id *)(a1 + 32) delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __44__ASTRemoteServerSession__updateUIWithData___block_invoke_4;
    v7[3] = &unk_264E7DE50;
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 32);
    id v8 = v5;
    uint64_t v9 = v6;
    +[ASTLocalization prepareLocalizedStringsWithCompletionHandler:v7];
  }
}

void __44__ASTRemoteServerSession__updateUIWithData___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"viewTitle"];
  uint64_t v6 = +[ASTLocalization localizedStringForKey:v5];

  int v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"suiteName"];
  id v8 = +[ASTLocalization localizedStringForKey:v7];

  objc_initWeak(&location, *(id *)(a1 + 40));
  uint64_t v9 = [*(id *)(a1 + 40) delegateQueue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__ASTRemoteServerSession__updateUIWithData___block_invoke_5;
  v12[3] = &unk_264E7DE28;
  objc_copyWeak(&v15, &location);
  id v13 = v8;
  id v14 = v6;
  id v10 = v6;
  id v11 = v8;
  dispatch_async(v9, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __44__ASTRemoteServerSession__updateUIWithData___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained delegate];
  [v2 session:WeakRetained didCompleteTestSuite:*(void *)(a1 + 32) description:*(void *)(a1 + 40)];
}

void __44__ASTRemoteServerSession__updateUIWithData___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    int v7 = [*(id *)(a1 + 32) delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      objc_initWeak(&location, *(id *)(a1 + 32));
      uint64_t v9 = [*(id *)(a1 + 32) delegateQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __44__ASTRemoteServerSession__updateUIWithData___block_invoke_7;
      block[3] = &unk_264E7DDD8;
      objc_copyWeak(&v13, &location);
      id v12 = v5;
      dispatch_async(v9, block);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    id v10 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __44__ASTRemoteServerSession__updateUIWithData___block_invoke_6_cold_1(a1, (uint64_t)v6, v10);
    }
  }
}

void __44__ASTRemoteServerSession__updateUIWithData___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained delegate];
  [v2 session:WeakRetained didUpdateTestSuiteImage:*(void *)(a1 + 32)];
}

- (id)_startNewTest:(id)a3 data:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(ASTRemoteServerSession *)self sessionId];
    *(_DWORD *)buf = 138412290;
    uint64_t v30 = v9;
    _os_log_impl(&dword_23CA80000, v8, OS_LOG_TYPE_DEFAULT, "[START NEW TEST] (%@)", buf, 0xCu);
  }
  id v10 = +[ASTRequest request];
  [v10 setClientStatus:4];
  id v11 = [(ASTSession *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = +[ASTTestResult resultWithTestId:v6 parameters:v7];
    id v14 = dispatch_semaphore_create(0);
    id v15 = [(ASTRemoteServerSession *)self runningTests];
    objc_sync_enter(v15);
    uint64_t v16 = [(ASTRemoteServerSession *)self runningTests];
    [v16 setObject:v14 forKeyedSubscript:v6];

    objc_sync_exit(v15);
    objc_initWeak((id *)buf, self);
    id v17 = [(ASTRemoteServerSession *)self delegateQueue];
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    id v23 = __45__ASTRemoteServerSession__startNewTest_data___block_invoke;
    id v24 = &unk_264E7DEA0;
    objc_copyWeak(&v28, (id *)buf);
    id v25 = v6;
    id v26 = v7;
    id v18 = v13;
    id v27 = v18;
    dispatch_async(v17, &v21);

    dispatch_time_t v19 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v14, v19)) {
      objc_msgSend(v10, "setClientStatus:", 3, v21, v22, v23, v24, v25, v26);
    }

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }

  return v10;
}

void __45__ASTRemoteServerSession__startNewTest_data___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v2 = [WeakRetained delegate];
  [v2 session:WeakRetained startTest:*(void *)(a1 + 32) parameters:*(void *)(a1 + 40) testResult:*(void *)(a1 + 48)];
}

- (id)_sendTestResults:(id)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(ASTRemoteServerSession *)self sessionId];
    *(_DWORD *)buf = 138412290;
    uint64_t v62 = v6;
    _os_log_impl(&dword_23CA80000, v5, OS_LOG_TYPE_DEFAULT, "[SEND TEST RESULTS] (%@)", buf, 0xCu);
  }
  id v7 = [(ASTRemoteServerSession *)self pendingTestResults];
  char v8 = [v7 objectForKeyedSubscript:v4];

  uint64_t v9 = +[ASTRequest request];
  id v10 = v9;
  if (v8)
  {
    BOOL v47 = [(ASTRemoteServerSession *)self _shouldAllowCellularForSealedTestResult:v8];
    dispatch_group_t v11 = dispatch_group_create();
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __43__ASTRemoteServerSession__sendTestResults___block_invoke;
    v55[3] = &unk_264E7DEC8;
    v55[4] = self;
    id v46 = v4;
    id v56 = v46;
    char v12 = v11;
    v57 = v12;
    v48 = (void *)MEMORY[0x23ECF0530](v55);
    uint64_t v13 = [v8 files];
    if (v13
      && (id v14 = (void *)v13,
          [v8 files],
          id v15 = objc_claimAutoreleasedReturnValue(),
          uint64_t v16 = [v15 count],
          v15,
          v14,
          v16))
    {
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v17 = [v8 files];
      uint64_t v49 = [v17 countByEnumeratingWithState:&v51 objects:v60 count:16];
      if (v49)
      {
        id v41 = v4;
        id obj = v17;
        v40 = v10;
        uint64_t v43 = *(void *)v52;
        v44 = v12;
        uint64_t v50 = 1;
        do
        {
          for (uint64_t i = 0; i != v49; ++i)
          {
            if (*(void *)v52 != v43) {
              objc_enumerationMutation(obj);
            }
            dispatch_time_t v19 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            dispatch_group_enter(v12);
            id v20 = [(ASTRemoteServerSession *)self connectionManager];
            uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v50 + i);
            uint64_t v22 = NSString;
            id v23 = [v8 files];
            id v24 = objc_msgSend(v22, "stringWithFormat:", @"%lu", objc_msgSend(v23, "count"));
            [v19 fileURL];
            id v26 = v25 = self;
            [v26 lastPathComponent];
            id v28 = v27 = v8;
            [v20 postSealableFile:v19 fileSequence:v21 totalFiles:v24 testId:v46 dataId:v28 allowsCellularAccess:v47 completion:v48];

            char v8 = v27;
            self = v25;

            char v12 = v44;
          }
          uint64_t v49 = [obj countByEnumeratingWithState:&v51 objects:v60 count:16];
          v50 += i;
        }
        while (v49);
        id v10 = v40;
        id v4 = v41;
        id v17 = obj;
      }
    }
    else
    {
      dispatch_group_enter(v12);
      id v17 = [(ASTRemoteServerSession *)self connectionManager];
      [v17 postTestResult:v8 allowsCellularAccess:v47 completion:v48];
    }

    dispatch_time_t v29 = dispatch_time(0, 5000000000);
    if (dispatch_group_wait(v12, v29))
    {
      [v10 setClientStatus:5];
    }
    else
    {
      [v10 setClientStatus:6];
      v58[0] = @"testID";
      uint64_t v45 = v12;
      uint64_t v30 = NSString;
      uint64_t v31 = [v8 testId];
      v32 = [v30 stringWithFormat:@"%@", v31];
      v59[0] = v32;
      v58[1] = @"statusCode";
      v33 = [v8 statusCode];
      v59[1] = v33;
      v58[2] = @"statusCodeStr";
      id v34 = NSString;
      [v8 statusCode];
      v36 = id v35 = v8;
      id v37 = [v34 stringWithFormat:@"%@", v36];
      v59[2] = v37;
      id v38 = [NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:3];
      +[ASTAnalytics sendAnalyticsWithEvent:4 payloadDict:v38];

      char v12 = v45;
      char v8 = v35;
    }
  }
  else
  {
    [v9 setClientStatus:8];
  }

  return v10;
}

void __43__ASTRemoteServerSession__sendTestResults___block_invoke(uint64_t a1, char a2)
{
  id v4 = [*(id *)(a1 + 32) pendingTestResults];
  [v4 removeObjectForKey:*(void *)(a1 + 40)];

  if ((a2 & 1) == 0)
  {
    id v5 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __43__ASTRemoteServerSession__sendTestResults___block_invoke_cold_1();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  id v6 = [*(id *)(a1 + 32) backoffTimer];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) backoffTimer];
    dispatch_semaphore_signal(v7);
  }
  char v8 = [*(id *)(a1 + 32) delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v10 = [*(id *)(a1 + 32) delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__ASTRemoteServerSession__sendTestResults___block_invoke_154;
    block[3] = &unk_264E7DDD8;
    objc_copyWeak(&v13, &location);
    id v12 = *(id *)(a1 + 40);
    dispatch_async(v10, block);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __43__ASTRemoteServerSession__sendTestResults___block_invoke_154(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained delegate];
  [v2 session:WeakRetained didFinishSendingResultForTest:*(void *)(a1 + 32)];
}

- (id)_continueWithLastRequest:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(ASTRemoteServerSession *)self sessionId];
    int v23 = 138412290;
    id v24 = v6;
    _os_log_impl(&dword_23CA80000, v5, OS_LOG_TYPE_DEFAULT, "[CONTINUE] (%@)", (uint8_t *)&v23, 0xCu);
  }
  id v7 = v4;
  if ([v7 clientStatus] == 3)
  {
    char v8 = [(ASTRemoteServerSession *)self runningTests];
    uint64_t v9 = [v8 count];

    if (!v9)
    {
      id v12 = +[ASTRequest request];

      id v20 = v12;
      uint64_t v21 = 4;
LABEL_15:
      [v20 setClientStatus:v21];
      goto LABEL_16;
    }
  }
  if ([v7 clientStatus] == 5)
  {
    id v10 = [(ASTRemoteServerSession *)self pendingTestResults];
    uint64_t v11 = [v10 count];

    if (!v11)
    {
      id v12 = +[ASTRequest request];

      id v20 = v12;
      uint64_t v21 = 6;
      goto LABEL_15;
    }
  }
  id v12 = v7;
  if ([v7 clientStatus] != 13) {
    goto LABEL_12;
  }
  id v12 = +[ASTRequest request];

  id v13 = [(ASTSession *)self context];
  id v14 = [v13 controlCommand];
  int v15 = [v14 allActionsFinished];

  uint64_t v16 = v15 ? 14 : 13;
  [v12 setClientStatus:v16];
  id v17 = [(ASTSession *)self context];
  id v18 = [v17 controlCommand];
  dispatch_time_t v19 = [v18 requestData];
  [v12 setData:v19];

  if ((v15 & 1) == 0) {
LABEL_12:
  }
    [(ASTRemoteServerSession *)self _backoff];
LABEL_16:

  return v12;
}

- (id)_sendPropertiesWithData:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(ASTRemoteServerSession *)self sessionId];
    *(_DWORD *)buf = 138412290;
    id v26 = v6;
    _os_log_impl(&dword_23CA80000, v5, OS_LOG_TYPE_DEFAULT, "[SEND PROPERTIES] (%@)", buf, 0xCu);
  }
  id v7 = [v4 objectForKeyedSubscript:@"propertyItems"];

  if (!v7) {
    goto LABEL_5;
  }
  char v8 = [v4 objectForKeyedSubscript:@"propertyItems"];
  uint64_t v9 = [(ASTSession *)self context];
  id v10 = [v9 identity];
  uint64_t v11 = +[ASTProfileResult resultWithIdentity:v10];

  id v12 = dispatch_semaphore_create(0);
  id v13 = self;
  objc_sync_enter(v13);
  [(ASTRemoteServerSession *)v13 setPendingPropertiesSemaphore:v12];
  objc_sync_exit(v13);

  objc_initWeak((id *)buf, v13);
  id v14 = [(ASTRemoteServerSession *)v13 delegateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__ASTRemoteServerSession__sendPropertiesWithData___block_invoke;
  block[3] = &unk_264E7DE28;
  objc_copyWeak(&v24, (id *)buf);
  id v15 = v11;
  id v22 = v15;
  id v16 = v8;
  id v23 = v16;
  dispatch_async(v14, block);

  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  id v17 = v13;
  objc_sync_enter(v17);
  id v18 = [(ASTRemoteServerSession *)v17 pendingPropertiesResult];
  [(ASTRemoteServerSession *)v17 setPendingPropertiesSemaphore:0];
  [(ASTRemoteServerSession *)v17 setPendingPropertiesResult:0];
  objc_sync_exit(v17);

  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);

  if (!v18)
  {
LABEL_5:
    id v18 = +[ASTRequest request];
    dispatch_time_t v19 = +[ASTErrorStatus errorStatusWithCode:-2];
    [v18 setError:v19];

    [v18 setClientStatus:10];
  }

  return v18;
}

void __50__ASTRemoteServerSession__sendPropertiesWithData___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained delegate];
  [v2 session:WeakRetained profile:*(void *)(a1 + 32) filteredByComponents:*(void *)(a1 + 40)];
}

- (id)_updateSessionSettingsWithData:(id)a3
{
  id v4 = a3;
  id v5 = +[ASTRequest request];
  id v6 = [(ASTSession *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    objc_initWeak(&location, self);
    uint64_t v9 = [(ASTRemoteServerSession *)self delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__ASTRemoteServerSession__updateSessionSettingsWithData___block_invoke;
    block[3] = &unk_264E7DEA0;
    objc_copyWeak(&v16, &location);
    id v13 = v4;
    id v14 = v5;
    dispatch_semaphore_t v15 = v8;
    id v10 = v8;
    dispatch_async(v9, block);

    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  [v5 setClientStatus:11];

  return v5;
}

void __57__ASTRemoteServerSession__updateSessionSettingsWithData___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  dispatch_semaphore_t v3 = [WeakRetained delegate];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__ASTRemoteServerSession__updateSessionSettingsWithData___block_invoke_2;
  v5[3] = &unk_264E7DEF0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  [v3 session:WeakRetained didUpdateSettings:v4 completionHandler:v5];
}

void __57__ASTRemoteServerSession__updateSessionSettingsWithData___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7) {
    [*(id *)(a1 + 32) setData:v7];
  }
  if (v5)
  {
    id v6 = +[ASTErrorStatus errorStatusWithCode:](ASTErrorStatus, "errorStatusWithCode:", [v5 code]);
    [*(id *)(a1 + 32) setError:v6];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)_abort
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  dispatch_semaphore_t v3 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(ASTRemoteServerSession *)self sessionId];
    int v7 = 138412290;
    dispatch_semaphore_t v8 = v4;
    _os_log_impl(&dword_23CA80000, v3, OS_LOG_TYPE_DEFAULT, "[ABORT] (%@)", (uint8_t *)&v7, 0xCu);
  }
  [(ASTRemoteServerSession *)self _abortRunningProcedures];
  id v5 = +[ASTRequest request];
  [v5 setClientStatus:1];

  return v5;
}

- (id)_clientAbort
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  dispatch_semaphore_t v3 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(ASTRemoteServerSession *)self sessionId];
    int v7 = 138412290;
    dispatch_semaphore_t v8 = v4;
    _os_log_impl(&dword_23CA80000, v3, OS_LOG_TYPE_DEFAULT, "[CLIENT ABORT] (%@)", (uint8_t *)&v7, 0xCu);
  }
  [(ASTRemoteServerSession *)self _abortRunningProcedures];
  id v5 = +[ASTRequest request];
  [v5 setClientStatus:12];

  return v5;
}

- (void)_archive
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  dispatch_semaphore_t v3 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(ASTRemoteServerSession *)self sessionId];
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl(&dword_23CA80000, v3, OS_LOG_TYPE_DEFAULT, "[ARCHIVE] (%@)", (uint8_t *)&v5, 0xCu);
  }
  [(ASTRemoteServerSession *)self _abortRunningProcedures];
}

- (void)_rebootWithData:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(ASTRemoteServerSession *)self sessionId];
    *(_DWORD *)buf = 138412290;
    dispatch_time_t v19 = v6;
    _os_log_impl(&dword_23CA80000, v5, OS_LOG_TYPE_DEFAULT, "[REBOOT] (%@)", buf, 0xCu);
  }
  [(ASTRemoteServerSession *)self _abortRunningProcedures];
  uint64_t v7 = [(ASTSession *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    objc_initWeak((id *)buf, self);
    uint64_t v9 = [(ASTRemoteServerSession *)self delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__ASTRemoteServerSession__rebootWithData___block_invoke;
    block[3] = &unk_264E7DDD8;
    objc_copyWeak(&v17, (id *)buf);
    id v16 = v4;
    dispatch_async(v9, block);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v10 = [(ASTSession *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      objc_initWeak((id *)buf, self);
      id v12 = [(ASTRemoteServerSession *)self delegateQueue];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __42__ASTRemoteServerSession__rebootWithData___block_invoke_2;
      v13[3] = &unk_264E7DDB0;
      objc_copyWeak(&v14, (id *)buf);
      dispatch_async(v12, v13);

      objc_destroyWeak(&v14);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __42__ASTRemoteServerSession__rebootWithData___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained delegate];
  [v2 sessionDidReboot:WeakRetained withParameters:*(void *)(a1 + 32)];
}

void __42__ASTRemoteServerSession__rebootWithData___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained delegate];
  [v1 sessionDidReboot:WeakRetained];
}

- (void)_shutdownWithData:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(ASTRemoteServerSession *)self sessionId];
    *(_DWORD *)buf = 138412290;
    id v14 = v6;
    _os_log_impl(&dword_23CA80000, v5, OS_LOG_TYPE_DEFAULT, "[SHUTDOWN] (%@)", buf, 0xCu);
  }
  [(ASTRemoteServerSession *)self _abortRunningProcedures];
  uint64_t v7 = [(ASTSession *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    objc_initWeak((id *)buf, self);
    uint64_t v9 = [(ASTRemoteServerSession *)self delegateQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __44__ASTRemoteServerSession__shutdownWithData___block_invoke;
    v10[3] = &unk_264E7DDD8;
    objc_copyWeak(&v12, (id *)buf);
    id v11 = v4;
    dispatch_async(v9, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
}

void __44__ASTRemoteServerSession__shutdownWithData___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained delegate];
  [v2 sessionDidShutDown:WeakRetained withParameters:*(void *)(a1 + 32)];
}

- (id)_showInstructionalPromptWithData:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(ASTRemoteServerSession *)self sessionId];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_23CA80000, v5, OS_LOG_TYPE_DEFAULT, "[SHOW INSTRUCTIONS] (%@)", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v46 = 0x3032000000;
  BOOL v47 = __Block_byref_object_copy__4;
  v48 = __Block_byref_object_dispose__4;
  id v49 = 0;
  uint64_t v7 = [v4 objectForKeyedSubscript:@"instructionId"];
  char v8 = [v4 objectForKeyedSubscript:@"reference"];
  uint64_t v9 = [v4 objectForKeyedSubscript:@"type"];
  id v10 = v9;
  if (v7) {
    BOOL v11 = v8 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11 || v9 == 0)
  {
    uint64_t v13 = [(ASTRemoteServerSession *)self _retryRequest];
    id v14 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v13;

    uint64_t v15 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)BOOL v39 = 138412802;
      v40 = v7;
      __int16 v41 = 2112;
      v42 = v8;
      __int16 v43 = 2112;
      v44 = v10;
      _os_log_error_impl(&dword_23CA80000, v15, OS_LOG_TYPE_ERROR, "Bad instructional prompt data, identifier: %@, reference: %@, type: %@", v39, 0x20u);
    }

    id v16 = *(id *)(*((void *)&buf + 1) + 40);
  }
  else
  {
    char v17 = [v9 isEqualToString:@"Alert"];
    if (v17)
    {
      uint64_t v18 = 1;
LABEL_18:
      dispatch_time_t v19 = [MEMORY[0x263EFF960] preferredLanguages];
      v32 = [v19 firstObject];

      uint64_t v20 = [MEMORY[0x263EFF960] currentLocale];
      uint64_t v21 = [v20 localeIdentifier];

      id v22 = [(ASTRemoteServerSession *)self connectionManager];
      LODWORD(v20) = v22 == 0;

      if (v20)
      {
        uint64_t v27 = [(ASTRemoteServerSession *)self _retryRequest];
        id v28 = *(void **)(*((void *)&buf + 1) + 40);
        *(void *)(*((void *)&buf + 1) + 40) = v27;

        dispatch_time_t v29 = ASTLogHandleForCategory(0);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          -[ASTRemoteServerSession _showInstructionalPromptWithData:]();
        }

        id v16 = *(id *)(*((void *)&buf + 1) + 40);
      }
      else
      {
        dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
        id v24 = [(ASTRemoteServerSession *)self connectionManager];
        uint64_t v25 = [(ASTRemoteServerSession *)self payloadSigner];
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __59__ASTRemoteServerSession__showInstructionalPromptWithData___block_invoke;
        v33[3] = &unk_264E7DF40;
        p_long long buf = &buf;
        v33[4] = self;
        id v26 = v23;
        id v34 = v26;
        id v35 = v7;
        uint64_t v38 = v18;
        id v36 = v8;
        [v24 requestInstructionalPromptDetailsWithInstructionID:v35 type:v10 withPayloadSigner:v25 language:v32 locale:v21 allowsCellularAccess:1 completionHandler:v33];

        dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
        id v16 = *(id *)(*((void *)&buf + 1) + 40);
      }
      goto LABEL_27;
    }
    if ([v10 isEqualToString:@"Query"])
    {
      uint64_t v18 = 0;
      goto LABEL_18;
    }
    uint64_t v30 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[ASTRemoteServerSession _showInstructionalPromptWithData:]();
    }

    id v16 = 0;
  }
LABEL_27:

  _Block_object_dispose(&buf, 8);

  return v16;
}

void __59__ASTRemoteServerSession__showInstructionalPromptWithData___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (a5)
  {
    uint64_t v12 = [*(id *)(a1 + 32) _retryRequest];
    uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  else
  {
    uint64_t v15 = [[ASTInstructionalPrompt alloc] initWithID:*(void *)(a1 + 48) type:*(void *)(a1 + 72) imageLocators:v11 instructions:v9 options:v10];
    id v16 = [*(id *)(a1 + 32) delegate];
    uint64_t v17 = *(void *)(a1 + 32);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __59__ASTRemoteServerSession__showInstructionalPromptWithData___block_invoke_2;
    v21[3] = &unk_264E7DF18;
    id v18 = *(id *)(a1 + 56);
    uint64_t v25 = *(void *)(a1 + 64);
    uint64_t v19 = *(void *)(a1 + 32);
    uint64_t v20 = *(void **)(a1 + 40);
    id v22 = v18;
    uint64_t v23 = v19;
    id v24 = v20;
    [v16 session:v17 didRequestInstructionalPrompt:v15 withConfirmation:v21];
  }
}

void __59__ASTRemoteServerSession__showInstructionalPromptWithData___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5 && v6 && *(void *)(a1 + 32))
  {
    uint64_t v8 = +[ASTRequest request];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    v18[0] = @"instructionId";
    v18[1] = @"reference";
    uint64_t v11 = *(void *)(a1 + 32);
    v19[0] = v5;
    v19[1] = v11;
    v18[2] = @"queryResponse";
    v19[2] = v7;
    uint64_t v12 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setData:v12];

    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setClientStatus:15];
  }
  else
  {
    uint64_t v13 = [*(id *)(a1 + 40) _retryRequest];
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    id v16 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412802;
      id v21 = v5;
      __int16 v22 = 2112;
      uint64_t v23 = v17;
      __int16 v24 = 2112;
      uint64_t v25 = v7;
      _os_log_error_impl(&dword_23CA80000, v16, OS_LOG_TYPE_ERROR, "Bad instructional prompt instructionID: %@, reference: %@ or answer: %@", buf, 0x20u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)_abortRunningProcedures
{
  dispatch_semaphore_t v3 = [(ASTSession *)self context];
  int v4 = [v3 testSuiteRunning];

  if (v4)
  {
    [(ASTRemoteServerSession *)self _cancelRunningTests];
    [(ASTRemoteServerSession *)self _cancelSendingTestResults];
    id v5 = [(ASTSession *)self context];
    [v5 setTestSuiteRunning:0];

    id v6 = [(ASTSession *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      objc_initWeak(&location, self);
      uint64_t v8 = [(ASTRemoteServerSession *)self delegateQueue];
      uint64_t v9 = MEMORY[0x263EF8330];
      uint64_t v10 = 3221225472;
      uint64_t v11 = __49__ASTRemoteServerSession__abortRunningProcedures__block_invoke;
      uint64_t v12 = &unk_264E7DDB0;
      objc_copyWeak(&v13, &location);
      dispatch_async(v8, &v9);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
  [(ASTRemoteServerSession *)self _cancelControlExecution];
}

void __49__ASTRemoteServerSession__abortRunningProcedures__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained delegate];
  [v1 sessionDidCancelSuite:WeakRetained];
}

- (void)_cancelRunningTests
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  dispatch_semaphore_t v3 = [(ASTRemoteServerSession *)self runningTests];
  objc_sync_enter(v3);
  int v4 = [(ASTRemoteServerSession *)self runningTests];
  id v5 = (void *)[v4 copy];

  objc_sync_exit(v3);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v20;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * v8);
        uint64_t v10 = [(ASTSession *)self delegate];
        char v11 = objc_opt_respondsToSelector();

        if (v11)
        {
          objc_initWeak(&location, self);
          uint64_t v12 = [(ASTRemoteServerSession *)self delegateQueue];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __45__ASTRemoteServerSession__cancelRunningTests__block_invoke;
          block[3] = &unk_264E7DDD8;
          objc_copyWeak(&v17, &location);
          void block[4] = v9;
          dispatch_async(v12, block);

          objc_destroyWeak(&v17);
          objc_destroyWeak(&location);
        }
        id v13 = [(ASTRemoteServerSession *)self runningTests];
        objc_sync_enter(v13);
        uint64_t v14 = [(ASTRemoteServerSession *)self runningTests];
        [v14 removeObjectForKey:v9];

        objc_sync_exit(v13);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }
}

void __45__ASTRemoteServerSession__cancelRunningTests__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained delegate];
  [v2 session:WeakRetained cancelTest:*(void *)(a1 + 32)];
}

- (BOOL)sendAuthInfoResult:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  if ([(ASTRemoteServerSession *)v7 phase] == 1)
  {
    uint64_t v8 = [(ASTRemoteServerSession *)v7 pendingAuthInfoSemaphore];
  }
  else
  {
    uint64_t v8 = 0;
  }
  objc_sync_exit(v7);

  if (!v8)
  {
    if (a4)
    {
      [MEMORY[0x263F087E8] errorWithDomain:@"ASTErrorDomain" code:-1007 userInfo:0];
      BOOL v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
LABEL_10:
    BOOL v12 = 0;
    goto LABEL_11;
  }
  if (v6)
  {
    uint64_t v9 = [(ASTRemoteServerSession *)v7 payloadSigner];
    int v10 = [v6 sealWithPayloadSigner:v9 error:a4];

    if (!v10) {
      goto LABEL_10;
    }
  }
  char v11 = v7;
  objc_sync_enter(v11);
  [(ASTRemoteServerSession *)v11 setPendingAuthInfoResult:v6];
  objc_sync_exit(v11);

  dispatch_semaphore_signal(v8);
  BOOL v12 = 1;
LABEL_11:

  return v12;
}

- (BOOL)sendProfileResult:(id)a3 error:(id *)a4
{
  v26[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  uint64_t v8 = [(ASTRemoteServerSession *)v7 phase];
  if (v8 == 1)
  {
    int v10 = [(ASTRemoteServerSession *)v7 pendingProfileSemaphore];
  }
  else
  {
    if (v8 == 2)
    {
      uint64_t v9 = [(ASTRemoteServerSession *)v7 pendingPropertiesSemaphore];
      int v10 = 0;
      goto LABEL_7;
    }
    int v10 = 0;
  }
  uint64_t v9 = 0;
LABEL_7:
  objc_sync_exit(v7);

  if (!v10)
  {
    if (!v9)
    {
      if (a4)
      {
        [MEMORY[0x263F087E8] errorWithDomain:@"ASTErrorDomain" code:-1007 userInfo:0];
        BOOL v14 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      }
LABEL_17:
      BOOL v14 = 0;
      goto LABEL_26;
    }
    if (v6)
    {
      uint64_t v15 = +[ASTRequest request];
      [v15 setClientStatus:10];
      if ([v6 isSealed])
      {
        [v15 setData:MEMORY[0x263EFFA78]];
        id v16 = +[ASTErrorStatus errorStatusWithCode:-3];
        [v15 setError:v16];

        if (a4)
        {
          *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"ASTErrorDomain" code:-4002 userInfo:0];
        }
      }
      else
      {
        id v17 = [v6 properties];
        uint64_t v18 = [v17 count];

        if (v18)
        {
          uint64_t v25 = @"propertyItems";
          long long v19 = [v6 properties];
          v26[0] = v19;
          long long v20 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
          [v15 setData:v20];
        }
      }
      if (v15)
      {
        long long v21 = [(ASTRemoteServerSession *)v7 payloadSigner];
        int v22 = [v15 sealWithPayloadSigner:v21 error:a4];

        if (v22)
        {
          uint64_t v23 = v7;
          objc_sync_enter(v23);
          [(ASTRemoteServerSession *)v23 setPendingPropertiesResult:v15];
          objc_sync_exit(v23);

          dispatch_semaphore_signal(v9);
          BOOL v14 = 1;
LABEL_25:

          goto LABEL_26;
        }
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
    BOOL v14 = 0;
    goto LABEL_25;
  }
  char v11 = [(ASTRemoteServerSession *)v7 payloadSigner];
  int v12 = [v6 sealWithPayloadSigner:v11 error:a4];

  if (!v12) {
    goto LABEL_17;
  }
  id v13 = v7;
  objc_sync_enter(v13);
  [(ASTRemoteServerSession *)v13 setPendingProfileResult:v6];
  objc_sync_exit(v13);

  dispatch_semaphore_signal(v10);
  BOOL v14 = 1;
LABEL_26:

  return v14;
}

- (BOOL)sendTestResult:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(ASTRemoteServerSession *)self runningTests];
  objc_sync_enter(v7);
  if ([(ASTRemoteServerSession *)self phase] == 2)
  {
    uint64_t v8 = [(ASTRemoteServerSession *)self runningTests];
    uint64_t v9 = [v6 testId];
    int v10 = [v8 objectForKeyedSubscript:v9];
  }
  else
  {
    int v10 = 0;
  }
  char v11 = [(ASTRemoteServerSession *)self runningTests];
  int v12 = [v6 testId];
  [v11 removeObjectForKey:v12];

  objc_sync_exit(v7);
  if (!v10)
  {
    if (a4)
    {
      [MEMORY[0x263F087E8] errorWithDomain:@"ASTErrorDomain" code:-1007 userInfo:0];
      BOOL v25 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  uint64_t v13 = [v6 files];
  if (v13)
  {
    BOOL v14 = (void *)v13;
    uint64_t v15 = [v6 files];
    uint64_t v16 = [v15 count];

    if (v16)
    {
      id v17 = [(ASTRemoteServerSession *)self fileSigner];
      char v18 = [v6 sealWithFileSigner:v17 error:a4];

      if ((v18 & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_10;
    }
  }
  long long v19 = [(ASTRemoteServerSession *)self payloadSigner];
  int v20 = [v6 sealWithPayloadSigner:v19 error:a4];

  if (!v20)
  {
LABEL_15:
    BOOL v25 = 0;
    goto LABEL_16;
  }
LABEL_10:
  long long v21 = [(ASTRemoteServerSession *)self pendingTestResults];
  int v22 = [v6 testId];
  [v21 setObject:v6 forKeyedSubscript:v22];

  dispatch_semaphore_signal(v10);
  uint64_t v23 = [(ASTRemoteServerSession *)self backoffTimer];

  if (v23)
  {
    uint64_t v24 = [(ASTRemoteServerSession *)self backoffTimer];
    dispatch_semaphore_signal(v24);
  }
  BOOL v25 = 1;
LABEL_16:

  return v25;
}

- (void)_cancelSendingTestResults
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  dispatch_semaphore_t v3 = [(ASTRemoteServerSession *)self connectionManager];
  [v3 cancelAllTestResults];

  int v4 = [(ASTRemoteServerSession *)self pendingTestResults];
  id v5 = [v4 allKeys];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        int v12 = [(ASTRemoteServerSession *)self pendingTestResults];
        [v12 removeObjectForKey:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)updateAction:(id)a3
{
  id v4 = a3;
  id v5 = [(ASTSession *)self context];
  id v6 = [v5 controlCommand];
  [v6 updateAction:v4];

  uint64_t v7 = [(ASTRemoteServerSession *)self backoffTimer];

  if (v7)
  {
    uint64_t v8 = [(ASTRemoteServerSession *)self backoffTimer];
    dispatch_semaphore_signal(v8);
  }
}

+ (void)downloadAsset:(id)a3 serverURL:(id)a4 endpoint:(id)a5 fileHandle:(id)a6 completionHandler:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v19 = +[ASTEnvironment currentEnvironment];
  long long v16 = [v19 SOCKSProxyServer];
  id v17 = [v19 SOCKSProxyPort];
  uint64_t v18 = [[ASTMaterializedConnectionManager alloc] initWithSOCKSProxyServer:v16 port:v17];
  [(ASTMaterializedConnectionManager *)v18 downloadAsset:v15 serverURL:v14 endpoint:v13 destinationFileHandle:v12 allowsCellularAccess:1 completion:v11];
}

- (void)_backoff
{
  int64_t v3 = 1000000000;
  id v4 = [(ASTRemoteServerSession *)self runningTests];
  if ([v4 count])
  {
  }
  else
  {
    id v5 = [(ASTRemoteServerSession *)self pendingTestResults];
    uint64_t v6 = [v5 count];

    if (!v6) {
      goto LABEL_7;
    }
  }
  if ([(ASTRemoteServerSession *)self backoffCounter] >= 7) {
    [(ASTRemoteServerSession *)self setBackoffCounter:6];
  }
  int v7 = kASTBackoffValues[[(ASTRemoteServerSession *)self backoffCounter]];
  [(ASTRemoteServerSession *)self setBackoffCounter:[(ASTRemoteServerSession *)self backoffCounter] + 1];
  int64_t v3 = 1000000000 * v7;
LABEL_7:
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  [(ASTRemoteServerSession *)self setBackoffTimer:v8];

  dsema = [(ASTRemoteServerSession *)self backoffTimer];
  dispatch_time_t v9 = dispatch_time(0, v3);
  dispatch_semaphore_wait(dsema, v9);
}

- (id)_retryRequest
{
  [(ASTRemoteServerSession *)self setRetryCounter:[(ASTRemoteServerSession *)self retryCounter] + 1];
  if ([(ASTRemoteServerSession *)self retryCounter] > 2
    || (int64_t v3 = objc_alloc_init(ASTRequest), [(ASTRequest *)v3 setClientStatus:8], !v3))
  {
    id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"ASTErrorDomain" code:-1 userInfo:0];
    [(ASTRemoteServerSession *)self setClientStatusLoopError:v4];

    [(ASTRemoteServerSession *)self setShouldContinueRequestLoop:0];
    int64_t v3 = 0;
  }

  return v3;
}

- (void)_protocolError
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int64_t v3 = +[ASTRequest stringFromClientStatus:a1];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_23CA80000, a2, v4, "--------------- PROTOCOL ERROR DETECTED; clientStatus = %@ ---------------",
    v5);
}

- (void)_cancelControlExecution
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int64_t v3 = [(ASTSession *)self context];
  uint64_t v4 = [v3 controlCommand];
  int v5 = [v4 reset];

  uint64_t v6 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v5;
    _os_log_impl(&dword_23CA80000, v6, OS_LOG_TYPE_DEFAULT, "Reset control command: %d", (uint8_t *)&buf, 8u);
  }

  if (v5)
  {
    objc_initWeak(&buf, self);
    int v7 = [(ASTRemoteServerSession *)self delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__ASTRemoteServerSession__cancelControlExecution__block_invoke;
    block[3] = &unk_264E7DDB0;
    objc_copyWeak(&v9, &buf);
    dispatch_async(v7, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&buf);
  }
}

void __49__ASTRemoteServerSession__cancelControlExecution__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained delegate];
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    int64_t v3 = [WeakRetained delegate];
    [v3 sessionDidAbortWhilePerformingActions:WeakRetained];
  }
}

- (BOOL)_validateCommand:(int64_t)a3 clientStatus:(int64_t)a4
{
  BOOL result = 1;
  switch(a3)
  {
    case 1:
      char v7 = a4 - 1;
      if ((unint64_t)(a4 - 1) >= 0xF) {
        goto LABEL_9;
      }
      unsigned int v8 = 28323;
      goto LABEL_4;
    case 2:
    case 3:
    case 5:
    case 10:
      char v7 = a4 - 1;
      if ((unint64_t)(a4 - 1) < 0xF)
      {
        unsigned int v8 = 28195;
LABEL_4:
        if ((v8 >> v7)) {
          return result;
        }
      }
      goto LABEL_9;
    case 4:
      if (((a4 - 4) & 0xFFFFFFFFFFFFFFF7) != 0) {
        goto LABEL_9;
      }
      return result;
    case 6:
    case 7:
    case 8:
    case 9:
    case 11:
    case 12:
    case 13:
      return result;
    default:
LABEL_9:
      id v9 = ASTLogHandleForCategory(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[ASTRemoteServerSession _validateCommand:clientStatus:](a3, a4);
      }

      return 0;
  }
}

- (void)connectionManagerRequestPaused:(id)a3
{
  id v4 = a3;
  int v5 = [(ASTSession *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [MEMORY[0x263F087E8] errorWithDomain:@"ASTErrorDomain" code:-1004 userInfo:0];
    objc_initWeak(&location, self);
    unsigned int v8 = [(ASTRemoteServerSession *)self delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__ASTRemoteServerSession_connectionManagerRequestPaused___block_invoke;
    block[3] = &unk_264E7DDD8;
    objc_copyWeak(&v12, &location);
    id v11 = v7;
    id v9 = v7;
    dispatch_async(v8, block);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __57__ASTRemoteServerSession_connectionManagerRequestPaused___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v2 = [WeakRetained delegate];
  [v2 session:WeakRetained didPauseWithError:*(void *)(a1 + 32)];
}

- (void)connectionManagerRequestResumed:(id)a3
{
  id v4 = a3;
  int v5 = [(ASTSession *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    objc_initWeak(&location, self);
    char v7 = [(ASTRemoteServerSession *)self delegateQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __58__ASTRemoteServerSession_connectionManagerRequestResumed___block_invoke;
    v8[3] = &unk_264E7DDB0;
    objc_copyWeak(&v9, &location);
    dispatch_async(v7, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __58__ASTRemoteServerSession_connectionManagerRequestResumed___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained delegate];
  [v1 sessionDidResume:WeakRetained];
}

- (void)connectionManager:(id)a3 pausedSendingResultForTest:(id)a4 reason:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(ASTSession *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    if (a5) {
      uint64_t v12 = -1003;
    }
    else {
      uint64_t v12 = -1004;
    }
    id v13 = [MEMORY[0x263F087E8] errorWithDomain:@"ASTErrorDomain" code:v12 userInfo:0];
    objc_initWeak(&location, self);
    id v14 = [(ASTRemoteServerSession *)self delegateQueue];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __78__ASTRemoteServerSession_connectionManager_pausedSendingResultForTest_reason___block_invoke;
    v16[3] = &unk_264E7DE28;
    objc_copyWeak(&v19, &location);
    id v17 = v9;
    id v18 = v13;
    id v15 = v13;
    dispatch_async(v14, v16);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

void __78__ASTRemoteServerSession_connectionManager_pausedSendingResultForTest_reason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  char v2 = [WeakRetained delegate];
  [v2 session:WeakRetained didPauseSendingResultForTest:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

- (void)connectionManager:(id)a3 resumedSendingResultForTest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ASTSession *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    objc_initWeak(&location, self);
    uint64_t v10 = [(ASTRemoteServerSession *)self delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__ASTRemoteServerSession_connectionManager_resumedSendingResultForTest___block_invoke;
    block[3] = &unk_264E7DDD8;
    objc_copyWeak(&v13, &location);
    id v12 = v7;
    dispatch_async(v10, block);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __72__ASTRemoteServerSession_connectionManager_resumedSendingResultForTest___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v2 = [WeakRetained delegate];
  [v2 session:WeakRetained didResumeSendingResultForTest:*(void *)(a1 + 32)];
}

- (id)_signPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = __Block_byref_object_copy__4;
  int v22 = __Block_byref_object_dispose__4;
  id v23 = 0;
  id v7 = [(ASTSession *)self delegate];
  if ([v7 conformsToProtocol:&unk_26F0B78A8])
  {
    id v8 = [(ASTSession *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) == 0) {
      goto LABEL_5;
    }
    id v7 = [(ASTSession *)self delegate];
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __45__ASTRemoteServerSession__signPayload_error___block_invoke;
    v14[3] = &unk_264E7DF68;
    long long v16 = &v18;
    id v17 = a4;
    char v11 = v10;
    id v15 = v11;
    [v7 session:self signPayload:v6 completionHandler:v14];
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  }
LABEL_5:
  id v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

void __45__ASTRemoteServerSession__signPayload_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v6 = a3;
  id v7 = v6;
  if (*(void *)(a1 + 48)) {
    **(void **)(a1 + 48) = v6;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_signFile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = __Block_byref_object_copy__4;
  int v22 = __Block_byref_object_dispose__4;
  id v23 = 0;
  id v7 = [(ASTSession *)self delegate];
  if ([v7 conformsToProtocol:&unk_26F0B78A8])
  {
    id v8 = [(ASTSession *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) == 0) {
      goto LABEL_5;
    }
    id v7 = [(ASTSession *)self delegate];
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __42__ASTRemoteServerSession__signFile_error___block_invoke;
    v14[3] = &unk_264E7DF68;
    long long v16 = &v18;
    id v17 = a4;
    char v11 = v10;
    id v15 = v11;
    [v7 session:self signFile:v6 completionHandler:v14];
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  }
LABEL_5:
  id v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

void __42__ASTRemoteServerSession__signFile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v6 = a3;
  id v7 = v6;
  if (*(void *)(a1 + 48)) {
    **(void **)(a1 + 48) = v6;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_shouldAllowCellularForSealedTestResult:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [(ASTSession *)self allowCellularSizeThreshold];
  id v6 = [v4 allowCellularSizeThreshold];
  int v7 = [v6 BOOLValue];

  if (v7)
  {
    id v8 = [v4 allowCellularSizeThreshold];
    unint64_t v5 = [v8 unsignedIntegerValue];

    char v9 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 134217984;
      unint64_t v35 = v5;
      _os_log_impl(&dword_23CA80000, v9, OS_LOG_TYPE_DEFAULT, "Using cellular size threshold from test result: %lu", buf, 0xCu);
    }
  }
  if (v5 == -1)
  {
    BOOL v10 = 1;
  }
  else
  {
    uint64_t v11 = [v4 files];
    if (v11
      && (id v12 = (void *)v11,
          [v4 files],
          id v13 = objc_claimAutoreleasedReturnValue(),
          uint64_t v14 = [v13 count],
          v13,
          v12,
          v14))
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v15 = [v4 files];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        unint64_t v28 = v5;
        id v29 = v4;
        unint64_t v18 = 0;
        uint64_t v19 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v31 != v19) {
              objc_enumerationMutation(v15);
            }
            long long v21 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            int v22 = objc_msgSend(MEMORY[0x263F08850], "defaultManager", v28, v29);
            id v23 = [v21 fileURL];
            uint64_t v24 = [v23 path];
            BOOL v25 = [v22 attributesOfItemAtPath:v24 error:0];
            v18 += [v25 fileSize];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v38 count:16];
        }
        while (v17);
        unint64_t v5 = v28;
        id v4 = v29;
      }
      else
      {
        unint64_t v18 = 0;
      }
    }
    else
    {
      id v15 = [v4 payload];
      unint64_t v18 = [v15 length];
    }

    uint64_t v26 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 134218240;
      unint64_t v35 = v18;
      __int16 v36 = 2048;
      unint64_t v37 = v5;
      _os_log_impl(&dword_23CA80000, v26, OS_LOG_TYPE_DEFAULT, "Payload size: %llu, threshold: %lu", buf, 0x16u);
    }

    BOOL v10 = v18 <= v5;
  }

  return v10;
}

- (BOOL)_shouldAllowCellularForSealedSealablePayload:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [(ASTSession *)self allowCellularSizeThreshold];
  if (v5 == -1)
  {
    BOOL v6 = 1;
  }
  else
  {
    unint64_t v7 = v5;
    id v8 = [v4 payload];
    unint64_t v9 = [v8 length];

    BOOL v10 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134218240;
      unint64_t v13 = v9;
      __int16 v14 = 2048;
      unint64_t v15 = v7;
      _os_log_impl(&dword_23CA80000, v10, OS_LOG_TYPE_DEFAULT, "Payload size: %llu, threshold: %lu", (uint8_t *)&v12, 0x16u);
    }

    BOOL v6 = v9 <= v7;
  }

  return v6;
}

+ (BOOL)currentProcessHasEntitlement
{
  return 1;
}

+ (BOOL)auditToken:(id *)a3 hasEntitlement:(id)a4
{
  [a4 UTF8String];
  id v4 = (void *)xpc_copy_entitlement_for_token();
  unint64_t v5 = v4;
  if (v4)
  {
    BOOL value = xpc_BOOL_get_value(v4);
  }
  else
  {
    unint64_t v7 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[ASTRemoteServerSession auditToken:hasEntitlement:]();
    }

    BOOL value = 0;
  }

  return value;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int64_t v3 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 136315138;
    BOOL v6 = "-[ASTRemoteServerSession dealloc]";
    _os_log_impl(&dword_23CA80000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  +[ASTEnvironment resetEnvironment];
  v4.receiver = self;
  v4.super_class = (Class)ASTRemoteServerSession;
  [(ASTSession *)&v4 dealloc];
}

- (void)requestSuitesAvailableWithCompletionHandler:(id)a3
{
  objc_super v4 = (void (**)(id, void *, void *))a3;
  if ([(ASTRemoteServerSession *)self phase] != 2)
  {
    unint64_t v9 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ASTRemoteServerSession requestSuitesAvailableWithCompletionHandler:](self, v9);
    }

    BOOL v6 = [MEMORY[0x263EFF8C0] array];
    BOOL v10 = [(ASTRemoteServerSession *)self clientStatusLoopError];
    v4[2](v4, v6, v10);
    goto LABEL_10;
  }
  unint64_t v5 = +[ASTEnvironment currentEnvironment];
  BOOL v6 = [v5 configCode];

  if (!v6)
  {
    uint64_t v11 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ASTRemoteServerSession requestSuitesAvailableWithCompletionHandler:]();
    }

    BOOL v10 = [MEMORY[0x263EFF8C0] array];
    int v12 = [MEMORY[0x263F087E8] errorWithDomain:@"ASTErrorDomain" code:-4003 userInfo:0];
    v4[2](v4, v10, v12);

LABEL_10:
    goto LABEL_11;
  }
  uint64_t v7 = [(ASTRemoteServerSession *)self connectionManager];
  id v8 = [(ASTRemoteServerSession *)self payloadSigner];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __70__ASTRemoteServerSession_requestSuitesAvailableWithCompletionHandler___block_invoke;
  v13[3] = &unk_264E7DF90;
  void v13[4] = self;
  __int16 v14 = v4;
  [v7 requestSelfServiceSuitesAvailableWithConfigCode:v6 withPayloadSigner:v8 allowsCellularAccess:1 completionHandler:v13];

LABEL_11:
}

void __70__ASTRemoteServerSession_requestSuitesAvailableWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) phase];
  uint64_t v7 = *(void *)(a1 + 40);
  if (v6 == 2)
  {
    (*(void (**)(void, id, id))(v7 + 16))(*(void *)(a1 + 40), v10, v5);
  }
  else
  {
    id v8 = [MEMORY[0x263EFF8C0] array];
    unint64_t v9 = [*(id *)(a1 + 32) clientStatusLoopError];
    (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v8, v9);
  }
}

- (void)requestSuiteStart:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([(ASTRemoteServerSession *)self phase] == 2)
  {
    id v8 = [(ASTRemoteServerSession *)self connectionManager];
    unint64_t v9 = [(ASTRemoteServerSession *)self payloadSigner];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __62__ASTRemoteServerSession_requestSuiteStart_completionHandler___block_invoke;
    void v11[3] = &unk_264E7DFB8;
    id v12 = v6;
    [v8 postSelectSelfServiceSuite:v7 withPayloadSigner:v9 allowsCellularAccess:1 completionHandler:v11];
  }
  else
  {
    id v10 = [(ASTRemoteServerSession *)self clientStatusLoopError];
    (*((void (**)(id, id, void, void, void *))v6 + 2))(v6, v7, 0, 0, v10);
  }
}

uint64_t __62__ASTRemoteServerSession_requestSuiteStart_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestSuiteSummary:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, uint64_t))a4;
  if ([(ASTRemoteServerSession *)self phase] != 2)
  {
    uint64_t v10 = [(ASTRemoteServerSession *)self clientStatusLoopError];
LABEL_8:
    id v12 = (void *)v10;
    v7[2](v7, 0, v10);

    goto LABEL_9;
  }
  if (![v6 length])
  {
    uint64_t v11 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ASTRemoteServerSession requestSuiteSummary:completionHandler:]();
    }

    uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:@"ASTErrorDomain" code:-4004 userInfo:0];
    goto LABEL_8;
  }
  id v8 = [(ASTRemoteServerSession *)self connectionManager];
  unint64_t v9 = [(ASTRemoteServerSession *)self payloadSigner];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __64__ASTRemoteServerSession_requestSuiteSummary_completionHandler___block_invoke;
  v13[3] = &unk_264E7DFE0;
  __int16 v14 = v7;
  [v8 requestSelfServiceSuiteResultsWithDiagnosticEventID:v6 withPayloadSigner:v9 allowsCellularAccess:1 completionHandler:v13];

LABEL_9:
}

uint64_t __64__ASTRemoteServerSession_requestSuiteSummary_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
}

- (ASTConnectionManager)connectionManager
{
  return self->_connectionManager;
}

- (void)setConnectionManager:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (OS_dispatch_queue)clientStatusQueue
{
  return self->_clientStatusQueue;
}

- (void)setClientStatusQueue:(id)a3
{
}

- (int64_t)retryCounter
{
  return self->_retryCounter;
}

- (void)setRetryCounter:(int64_t)a3
{
  self->_retryCounter = a3;
}

- (int64_t)backoffCounter
{
  return self->_backoffCounter;
}

- (void)setBackoffCounter:(int64_t)a3
{
  self->_backoffCounter = a3;
}

- (OS_dispatch_semaphore)backoffTimer
{
  return self->_backoffTimer;
}

- (void)setBackoffTimer:(id)a3
{
}

- (NSMutableDictionary)runningTests
{
  return self->_runningTests;
}

- (void)setRunningTests:(id)a3
{
}

- (NSMutableDictionary)pendingTestResults
{
  return self->_pendingTestResults;
}

- (void)setPendingTestResults:(id)a3
{
}

- (ASTProfileResult)pendingProfileResult
{
  return self->_pendingProfileResult;
}

- (void)setPendingProfileResult:(id)a3
{
}

- (OS_dispatch_semaphore)pendingProfileSemaphore
{
  return self->_pendingProfileSemaphore;
}

- (void)setPendingProfileSemaphore:(id)a3
{
}

- (ASTRequest)pendingPropertiesResult
{
  return self->_pendingPropertiesResult;
}

- (void)setPendingPropertiesResult:(id)a3
{
}

- (OS_dispatch_semaphore)pendingPropertiesSemaphore
{
  return self->_pendingPropertiesSemaphore;
}

- (void)setPendingPropertiesSemaphore:(id)a3
{
}

- (ASTAuthInfoResult)pendingAuthInfoResult
{
  return self->_pendingAuthInfoResult;
}

- (void)setPendingAuthInfoResult:(id)a3
{
}

- (OS_dispatch_semaphore)pendingAuthInfoSemaphore
{
  return self->_pendingAuthInfoSemaphore;
}

- (void)setPendingAuthInfoSemaphore:(id)a3
{
}

- (int64_t)phase
{
  return self->_phase;
}

- (void)setPhase:(int64_t)a3
{
  self->_phase = a3;
}

- (BOOL)shouldContinueRequestLoop
{
  return self->_shouldContinueRequestLoop;
}

- (void)setShouldContinueRequestLoop:(BOOL)a3
{
  self->_shouldContinueRequestLoop = a3;
}

- (BOOL)shouldUnenroll
{
  return self->_shouldUnenroll;
}

- (void)setShouldUnenroll:(BOOL)a3
{
  self->_shouldUnenroll = a3;
}

- (BOOL)shouldAbort
{
  return self->_shouldAbort;
}

- (void)setShouldAbort:(BOOL)a3
{
  self->_shouldAbort = a3;
}

- (id)sessionTeardownCompletion
{
  return self->_sessionTeardownCompletion;
}

- (void)setSessionTeardownCompletion:(id)a3
{
}

- (NSError)clientStatusLoopError
{
  return self->_clientStatusLoopError;
}

- (void)setClientStatusLoopError:(id)a3
{
}

- (id)payloadSigner
{
  return self->_payloadSigner;
}

- (id)fileSigner
{
  return self->_fileSigner;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fileSigner, 0);
  objc_storeStrong(&self->_payloadSigner, 0);
  objc_storeStrong((id *)&self->_clientStatusLoopError, 0);
  objc_storeStrong(&self->_sessionTeardownCompletion, 0);
  objc_storeStrong((id *)&self->_pendingAuthInfoSemaphore, 0);
  objc_storeStrong((id *)&self->_pendingAuthInfoResult, 0);
  objc_storeStrong((id *)&self->_pendingPropertiesSemaphore, 0);
  objc_storeStrong((id *)&self->_pendingPropertiesResult, 0);
  objc_storeStrong((id *)&self->_pendingProfileSemaphore, 0);
  objc_storeStrong((id *)&self->_pendingProfileResult, 0);
  objc_storeStrong((id *)&self->_pendingTestResults, 0);
  objc_storeStrong((id *)&self->_runningTests, 0);
  objc_storeStrong((id *)&self->_backoffTimer, 0);
  objc_storeStrong((id *)&self->_clientStatusQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_connectionManager, 0);

  objc_storeStrong((id *)&self->_sessionId, 0);
}

void __31__ASTRemoteServerSession_start__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23CA80000, v0, v1, "[Enroll] failed", v2, v3, v4, v5, v6);
}

void __31__ASTRemoteServerSession_start__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23CA80000, v0, v1, "[Profile] failed", v2, v3, v4, v5, v6);
}

void __31__ASTRemoteServerSession_start__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23CA80000, v0, v1, "[AuthInfo] failed", v2, v3, v4, v5, v6);
}

void __33__ASTRemoteServerSession_archive__block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) sessionId];
  uint64_t v4 = [a2 debugDescription];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_8(&dword_23CA80000, v5, v6, "Failed to archive the session %@, error: %@", v7, v8, v9, v10, v11);
}

- (void)_endAndUnenrollIfNecessary:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23CA80000, v0, v1, "Ignored call to -[ASTSession end] while a session was already ending.", v2, v3, v4, v5, v6);
}

- (void)_updateUIWithData:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23CA80000, v0, v1, "No imageName provided", v2, v3, v4, v5, v6);
}

- (void)_updateUIWithData:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_23CA80000, v0, v1, "Invalid action: %@", v2);
}

void __44__ASTRemoteServerSession__updateUIWithData___block_invoke_6_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_23CA80000, log, OS_LOG_TYPE_ERROR, "Failed to download test suite image: %@, error: %@", (uint8_t *)&v4, 0x16u);
}

void __43__ASTRemoteServerSession__sendTestResults___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23CA80000, v0, v1, "Failed to send test results", v2, v3, v4, v5, v6);
}

- (void)_showInstructionalPromptWithData:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23CA80000, v0, v1, "Connection manager is nil", v2, v3, v4, v5, v6);
}

- (void)_showInstructionalPromptWithData:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_23CA80000, v0, v1, "Unexpected instructional prompt type: %@", v2);
}

- (void)_validateCommand:(uint64_t)a1 clientStatus:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = +[ASTResponse stringFromCommand:a1];
  uint64_t v4 = +[ASTRequest stringFromClientStatus:a2];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_8(&dword_23CA80000, v5, v6, "Unexpected command from server: command = %@, clientStatus = %@", v7, v8, v9, v10, v11);
}

+ (void)auditToken:hasEntitlement:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23CA80000, v0, v1, "Unable to find entitlement", v2, v3, v4, v5, v6);
}

- (void)requestSuitesAvailableWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23CA80000, v0, v1, "Requesting suites with a bad config code", v2, v3, v4, v5, v6);
}

- (void)requestSuitesAvailableWithCompletionHandler:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  [a1 phase];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_23CA80000, a2, v3, "Wrong session phase (%ld), skipping requesting the suites", v4);
}

- (void)requestSuiteSummary:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23CA80000, v0, v1, "Requesting suite summary with a bad diagnostic event id", v2, v3, v4, v5, v6);
}

@end