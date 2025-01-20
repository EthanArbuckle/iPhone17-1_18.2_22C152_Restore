@interface ASTRepairSession
+ (void)downloadAsset:(id)a3 fileHandle:(id)a4 completionHandler:(id)a5;
- (ASTRepairProtocol)remoteRepairServer;
- (ASTRepairSession)init;
- (ASTRepairSession)initWithDelegate:(id)a3;
- (BOOL)sendTestResult:(id)a3 error:(id *)a4;
- (BOOL)shouldShowResults;
- (NSSet)suitesAvailable;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)repairAliveCheckQueue;
- (void)cancelSuite;
- (void)completeTestSuite:(id)a3 description:(id)a4;
- (void)dealloc;
- (void)end;
- (void)estimatedTimeRemainingForTest:(id)a3 completion:(id)a4;
- (void)progressForTest:(id)a3 completion:(id)a4;
- (void)requestSuiteStart:(id)a3 completionHandler:(id)a4;
- (void)requestSuiteSummary:(id)a3 completionHandler:(id)a4;
- (void)requestSuitesAvailableWithCompletionHandler:(id)a3;
- (void)setConnection:(id)a3;
- (void)setRemoteRepairServer:(id)a3;
- (void)setRepairAliveCheckQueue:(id)a3;
- (void)setSuitesAvailable:(id)a3;
- (void)showInstructionalPrompt:(id)a3 withConfirmation:(id)a4;
- (void)start;
- (void)startTest:(id)a3 parameters:(id)a4;
- (void)updateTestSuiteImage:(id)a3;
- (void)updateTestSuiteProgress:(id)a3;
@end

@implementation ASTRepairSession

- (ASTRepairSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)ASTRepairSession;
  v2 = [(ASTRepairSession *)&v6 init];
  if (v2)
  {
    v3 = [[ASTRepairSessionProvider alloc] initWithServiceName:@"com.apple.corerepair.diagnostics-controller"];
    v4 = (void *)provider;
    provider = (uint64_t)v3;

    [(id)provider setDelegate:v2];
  }
  return v2;
}

- (ASTRepairSession)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(ASTRepairSession *)self init];
  objc_super v6 = v5;
  if (v5) {
    [(ASTSession *)v5 setDelegate:v4];
  }

  return v6;
}

- (BOOL)shouldShowResults
{
  return 0;
}

- (BOOL)sendTestResult:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_super v6 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[ASTRepairSession sendTestResult:error:]";
    _os_log_impl(&dword_23CA80000, v6, OS_LOG_TYPE_DEFAULT, "[ASTRepairSession] %s", buf, 0xCu);
  }

  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v8 = (void *)provider;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __41__ASTRepairSession_sendTestResult_error___block_invoke;
  v13[3] = &unk_264E7DC18;
  dispatch_semaphore_t v14 = v7;
  v15 = a4;
  v9 = v7;
  [v8 sendTestResult:v5 withCompletion:v13];

  dispatch_time_t v10 = dispatch_time(0, 5000000000);
  BOOL v11 = dispatch_semaphore_wait(v9, v10) == 0;

  return v11;
}

intptr_t __41__ASTRepairSession_sendTestResult_error___block_invoke(uint64_t a1, id a2)
{
  if (a2) {
    **(void **)(a1 + 40) = a2;
  }
  v3 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v3);
}

+ (void)downloadAsset:(id)a3 fileHandle:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!provider)
  {
    v12 = ASTLogHandleForCategory(1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[ASTRepairSession downloadAsset:fileHandle:completionHandler:](v12);
    }

    v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = -1007;
    goto LABEL_11;
  }
  if (([v8 isOpenForUpdating] & 1) == 0)
  {
    v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = -3000;
LABEL_11:
    id v10 = [v13 errorWithDomain:@"ASTErrorDomain" code:v14 userInfo:0];
    goto LABEL_12;
  }
  id v19 = 0;
  [v8 truncateAtOffset:0 error:&v19];
  id v10 = v19;
  if (!v10)
  {
    v15 = (void *)provider;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __63__ASTRepairSession_downloadAsset_fileHandle_completionHandler___block_invoke;
    v16[3] = &unk_264E7DC40;
    id v18 = v9;
    id v17 = v8;
    [v15 requestAsset:v7 withCompletion:v16];

    goto LABEL_13;
  }
  BOOL v11 = ASTLogHandleForCategory(1);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    +[ASTRepairSession downloadAsset:fileHandle:completionHandler:](v10, v11);
  }

LABEL_12:
  (*((void (**)(id, void, id))v9 + 2))(v9, 0, v10);
LABEL_13:
}

void __63__ASTRepairSession_downloadAsset_fileHandle_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  objc_super v6 = v5;
  if (!a2 || v5)
  {
    id v10 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __63__ASTRepairSession_downloadAsset_fileHandle_completionHandler___block_invoke_cold_2((uint64_t)v6, v10);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    id v14 = 0;
    [v7 writeData:a2 error:&v14];
    id v8 = v14;
    if (v14)
    {
      v14;
      id v9 = ASTLogHandleForCategory(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __63__ASTRepairSession_downloadAsset_fileHandle_completionHandler___block_invoke_cold_1(v9);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      uint64_t v11 = *(void *)(a1 + 40);
      v12 = *(void (**)(uint64_t, uint64_t, void))(v11 + 16);
      id v13 = 0;
      v12(v11, 1, 0);
    }
  }
}

- (void)requestSuiteSummary:(id)a3 completionHandler:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  id v7 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    id v9 = "-[ASTRepairSession requestSuiteSummary:completionHandler:]";
    _os_log_impl(&dword_23CA80000, v7, OS_LOG_TYPE_DEFAULT, "[ASTRepairSession] %s", (uint8_t *)&v8, 0xCu);
  }

  [(id)provider requestSuiteResult:v6 withCompletion:v5];
}

- (void)requestSuitesAvailableWithCompletionHandler:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[ASTRepairSession requestSuitesAvailableWithCompletionHandler:]";
    _os_log_impl(&dword_23CA80000, v4, OS_LOG_TYPE_DEFAULT, "[ASTRepairSession] %s", (uint8_t *)&v5, 0xCu);
  }

  [(id)provider requestSuitesAvailableWithCompletionHandler:v3];
}

- (void)start
{
  id v3 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23CA80000, v3, OS_LOG_TYPE_DEFAULT, "[ASTRepairSession] Starting...", buf, 2u);
  }

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __25__ASTRepairSession_start__block_invoke;
  v4[3] = &unk_264E7DC68;
  v4[4] = self;
  [(id)provider establishConnectionWithCompletionHandler:v4];
}

void __25__ASTRepairSession_start__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_23CA80000, v4, OS_LOG_TYPE_DEFAULT, "[ASTRepairSession] Unable to establish the connection: %@", buf, 0xCu);
    }

    int v5 = [*(id *)(a1 + 32) delegate];
    [v5 session:*(void *)(a1 + 32) didEndWithError:v3];
  }
  else
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __25__ASTRepairSession_start__block_invoke_19;
    v6[3] = &unk_264E7DC68;
    v6[4] = *(void *)(a1 + 32);
    [(id)provider startWithCompletionHandler:v6];
  }
}

void __25__ASTRepairSession_start__block_invoke_19(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_23CA80000, v4, OS_LOG_TYPE_DEFAULT, "[ASTRepairSession] Unable to start the connection: %@", (uint8_t *)&v6, 0xCu);
    }

    int v5 = [*(id *)(a1 + 32) delegate];
    [v5 session:*(void *)(a1 + 32) didEndWithError:v3];
  }
  else
  {
    int v5 = [*(id *)(a1 + 32) delegate];
    [v5 sessionDidStart:*(void *)(a1 + 32)];
  }
}

- (void)end
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v6 = "-[ASTRepairSession end]";
    _os_log_impl(&dword_23CA80000, v3, OS_LOG_TYPE_DEFAULT, "[ASTRepairSession] %s", buf, 0xCu);
  }

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __23__ASTRepairSession_end__block_invoke;
  v4[3] = &unk_264E7DC68;
  v4[4] = self;
  [(id)provider endWithCompletionHandler:v4];
}

void __23__ASTRepairSession_end__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegate];
  [v5 session:*(void *)(a1 + 32) didEndWithError:v4];
}

- (void)requestSuiteStart:(id)a3 completionHandler:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[ASTRepairSession requestSuiteStart:completionHandler:]";
    _os_log_impl(&dword_23CA80000, v7, OS_LOG_TYPE_DEFAULT, "[ASTRepairSession] %s", (uint8_t *)&v8, 0xCu);
  }

  [(id)provider requestSuiteStart:v6 withCompletionHandler:v5];
}

- (void)dealloc
{
  id v3 = [(ASTRepairSession *)self connection];

  if (v3)
  {
    id v4 = [(ASTRepairSession *)self connection];
    [v4 suspend];

    id v5 = [(ASTRepairSession *)self connection];
    [v5 invalidate];

    [(ASTRepairSession *)self setConnection:0];
  }
  [(ASTSession *)self setDelegate:0];
  v6.receiver = self;
  v6.super_class = (Class)ASTRepairSession;
  [(ASTSession *)&v6 dealloc];
}

- (void)cancelSuite
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    int v8 = "-[ASTRepairSession cancelSuite]";
    _os_log_impl(&dword_23CA80000, v3, OS_LOG_TYPE_DEFAULT, "[ASTRepairSession] %s", (uint8_t *)&v7, 0xCu);
  }

  id v4 = [(ASTSession *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    objc_super v6 = [(ASTSession *)self delegate];
    [v6 sessionDidCancelSuite:self];
  }
}

- (void)startTest:(id)a3 parameters:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315650;
    id v14 = "-[ASTRepairSession startTest:parameters:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_23CA80000, v8, OS_LOG_TYPE_DEFAULT, "[ASTRepairSession] %s, testId: %@, parameters: %@", (uint8_t *)&v13, 0x20u);
  }

  uint64_t v9 = [(ASTSession *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    uint64_t v11 = +[ASTTestResult resultWithTestId:v6 parameters:v7];
    v12 = [(ASTSession *)self delegate];
    [v12 session:self startTest:v6 parameters:v7 testResult:v11];
  }
}

- (void)progressForTest:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  int v8 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    id v14 = "-[ASTRepairSession progressForTest:completion:]";
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_23CA80000, v8, OS_LOG_TYPE_DEFAULT, "[ASTRepairSession] %s, testId: %@", (uint8_t *)&v13, 0x16u);
  }

  uint64_t v9 = [(ASTSession *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    uint64_t v11 = [(ASTSession *)self delegate];
    v12 = [v11 session:self progressForTest:v6];
    v7[2](v7, v12);
  }
  v7[2](v7, 0);
}

- (void)estimatedTimeRemainingForTest:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  int v8 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    id v14 = "-[ASTRepairSession estimatedTimeRemainingForTest:completion:]";
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_23CA80000, v8, OS_LOG_TYPE_DEFAULT, "[ASTRepairSession] %s, testId: %@", (uint8_t *)&v13, 0x16u);
  }

  uint64_t v9 = [(ASTSession *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    uint64_t v11 = [(ASTSession *)self delegate];
    v12 = [v11 session:self estimatedTimeRemainingForTest:v6];
    v7[2](v7, v12);
  }
  v7[2](v7, 0);
}

- (void)updateTestSuiteProgress:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    char v10 = "-[ASTRepairSession updateTestSuiteProgress:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_23CA80000, v5, OS_LOG_TYPE_DEFAULT, "[ASTRepairSession] %s, progress: %@", (uint8_t *)&v9, 0x16u);
  }

  id v6 = [(ASTSession *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    int v8 = [(ASTSession *)self delegate];
    [v8 session:self didUpdateTestSuiteProgress:v4];
  }
}

- (void)completeTestSuite:(id)a3 description:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    uint64_t v13 = "-[ASTRepairSession completeTestSuite:description:]";
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_23CA80000, v8, OS_LOG_TYPE_DEFAULT, "[ASTRepairSession] %s, suiteName: %@", (uint8_t *)&v12, 0x16u);
  }

  int v9 = [(ASTSession *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    __int16 v11 = [(ASTSession *)self delegate];
    [v11 session:self didCompleteTestSuite:v6 description:v7];
  }
}

- (void)updateTestSuiteImage:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    char v10 = "-[ASTRepairSession updateTestSuiteImage:]";
    _os_log_impl(&dword_23CA80000, v5, OS_LOG_TYPE_DEFAULT, "[ASTRepairSession] %s", (uint8_t *)&v9, 0xCu);
  }

  id v6 = [(ASTSession *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    int v8 = [(ASTSession *)self delegate];
    [v8 session:self didUpdateTestSuiteImage:v4];
  }
}

- (void)showInstructionalPrompt:(id)a3 withConfirmation:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[ASTRepairSession showInstructionalPrompt:withConfirmation:]";
    _os_log_impl(&dword_23CA80000, v8, OS_LOG_TYPE_DEFAULT, "[ASTRepairSession] %s", (uint8_t *)&v12, 0xCu);
  }

  int v9 = [(ASTSession *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    uint64_t v11 = [(ASTSession *)self delegate];
    [v11 session:self didRequestInstructionalPrompt:v6 withConfirmation:v7];
  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)repairAliveCheckQueue
{
  return self->_repairAliveCheckQueue;
}

- (void)setRepairAliveCheckQueue:(id)a3
{
}

- (ASTRepairProtocol)remoteRepairServer
{
  return (ASTRepairProtocol *)objc_getProperty(self, a2, 104, 1);
}

- (void)setRemoteRepairServer:(id)a3
{
}

- (NSSet)suitesAvailable
{
  return self->_suitesAvailable;
}

- (void)setSuitesAvailable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suitesAvailable, 0);
  objc_storeStrong((id *)&self->_remoteRepairServer, 0);
  objc_storeStrong((id *)&self->_repairAliveCheckQueue, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

+ (void)downloadAsset:(os_log_t)log fileHandle:completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23CA80000, log, OS_LOG_TYPE_ERROR, "Provider is nil, make sure to establish a session.", v1, 2u);
}

+ (void)downloadAsset:(void *)a1 fileHandle:(NSObject *)a2 completionHandler:.cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a1 debugDescription];
  int v4 = 138412290;
  char v5 = v3;
  _os_log_error_impl(&dword_23CA80000, a2, OS_LOG_TYPE_ERROR, "Error occurred trying to truncate file: %@", (uint8_t *)&v4, 0xCu);
}

void __63__ASTRepairSession_downloadAsset_fileHandle_completionHandler___block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_23CA80000, log, OS_LOG_TYPE_ERROR, "[ASTRepairSession] Unable to write data: %@", (uint8_t *)&v1, 0xCu);
}

void __63__ASTRepairSession_downloadAsset_fileHandle_completionHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23CA80000, a2, OS_LOG_TYPE_ERROR, "[ASTRepairSession] Unable to retrieve the asset: %@", (uint8_t *)&v2, 0xCu);
}

@end