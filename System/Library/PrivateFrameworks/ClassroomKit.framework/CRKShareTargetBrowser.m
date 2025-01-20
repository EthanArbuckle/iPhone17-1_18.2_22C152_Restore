@interface CRKShareTargetBrowser
- (BOOL)isClientInvalidationError:(id)a3;
- (CATTaskClient)instructorClient;
- (CATTaskClient)studentClient;
- (CRKShareTargetBrowser)initWithDelegate:(id)a3;
- (CRKShareTargetBrowser)initWithDelegate:(id)a3 queue:(id)a4;
- (CRKShareTargetBrowserTransportFactory)transportFactory;
- (CRKShareTargetCollector)shareTargetCollector;
- (id)makeShareTargetsWithDictionaries:(id)a3 taskClient:(id)a4;
- (void)acquireStudentActivityAssertion;
- (void)acquireStudentActivityAssertionOperationDidFail:(id)a3;
- (void)browseForInstructorTargetsOperationDidFail:(id)a3;
- (void)browseForStudentTargetsOperationDidFail:(id)a3;
- (void)client:(id)a3 didInterruptWithError:(id)a4;
- (void)clientDidConnect:(id)a3;
- (void)connectToInstructord;
- (void)connectToStudentd;
- (void)dealloc;
- (void)delegateDidFindTargets:(id)a3;
- (void)delegateDidInterruptWithError:(id)a3;
- (void)delegateDidRemoveTargets:(id)a3;
- (void)invalidate;
- (void)invalidateClient:(id)a3;
- (void)resume;
- (void)setInstructorClient:(id)a3;
- (void)setStudentClient:(id)a3;
- (void)shareTargetCollector:(id)a3 didFindTargets:(id)a4;
- (void)shareTargetCollector:(id)a3 didRemoveTargets:(id)a4;
- (void)startBrowsingForInstructorTargets;
- (void)startBrowsingForStudentTargets;
- (void)suspend;
- (void)taskOperation:(id)a3 didPostNotificationWithName:(id)a4 userInfo:(id)a5;
- (void)tearDownInstructorClient;
- (void)tearDownStudentClient;
@end

@implementation CRKShareTargetBrowser

- (void)dealloc
{
  [(CRKShareTargetBrowser *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CRKShareTargetBrowser;
  [(CRKShareTargetBrowser *)&v3 dealloc];
}

- (CRKShareTargetBrowser)initWithDelegate:(id)a3
{
  return [(CRKShareTargetBrowser *)self initWithDelegate:a3 queue:MEMORY[0x263EF83A0]];
}

- (CRKShareTargetBrowser)initWithDelegate:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"CRKShareTargetBrowser.m", 48, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v20 = [MEMORY[0x263F08690] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"CRKShareTargetBrowser.m", 49, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

LABEL_3:
  v21.receiver = self;
  v21.super_class = (Class)CRKShareTargetBrowser;
  v10 = [(CRKShareTargetBrowser *)&v21 init];
  v11 = v10;
  if (v10)
  {
    v10->mIsValid = 1;
    objc_storeWeak((id *)&v10->mDelegate, v7);
    objc_storeStrong((id *)&v11->mDelegateQueue, a4);
    uint64_t v12 = objc_opt_new();
    mOperationQueue = v11->mOperationQueue;
    v11->mOperationQueue = (CATOperationQueue *)v12;

    uint64_t v14 = objc_opt_new();
    transportFactory = v11->_transportFactory;
    v11->_transportFactory = (CRKShareTargetBrowserTransportFactory *)v14;

    uint64_t v16 = objc_opt_new();
    shareTargetCollector = v11->_shareTargetCollector;
    v11->_shareTargetCollector = (CRKShareTargetCollector *)v16;

    [(CRKShareTargetCollector *)v11->_shareTargetCollector setDelegate:v11];
  }

  return v11;
}

- (void)resume
{
  if (!self->mIsValid)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"CRKShareTargetBrowser.m" lineNumber:67 description:@"Browser has already been invalidated"];
  }
  if (!self->mBrowsing)
  {
    self->mBrowsing = 1;
    objc_super v3 = objc_opt_new();
    [(CRKShareTargetBrowser *)self setStudentClient:v3];

    v4 = [(CRKShareTargetBrowser *)self studentClient];
    [v4 setDelegate:self];

    v5 = objc_opt_new();
    [(CRKShareTargetBrowser *)self setInstructorClient:v5];

    v6 = [(CRKShareTargetBrowser *)self instructorClient];
    [v6 setDelegate:self];

    [(CRKShareTargetBrowser *)self connectToStudentd];
    [(CRKShareTargetBrowser *)self connectToInstructord];
  }
}

- (void)suspend
{
  self->mBrowsing = 0;
  [(CRKShareTargetBrowser *)self tearDownStudentClient];

  [(CRKShareTargetBrowser *)self tearDownInstructorClient];
}

- (void)invalidate
{
  self->mIsValid = 0;
  [(CRKShareTargetBrowser *)self suspend];
}

- (void)connectToStudentd
{
  v4 = _CRKLogGeneral_5();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224C00000, v4, OS_LOG_TYPE_DEFAULT, "Share target browser requesting studentd transport", buf, 2u);
  }

  v5 = [(CRKShareTargetBrowser *)self studentClient];
  if (!v5)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"CRKShareTargetBrowser.m" lineNumber:107 description:@"Attempting to fetch a transport without a student task client"];
  }
  v6 = [(CRKShareTargetBrowser *)self transportFactory];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __42__CRKShareTargetBrowser_connectToStudentd__block_invoke;
  v9[3] = &unk_2646F48C8;
  id v10 = v5;
  v11 = self;
  id v7 = v5;
  [v6 makeStudentdTransportWithCompletion:v9];
}

void __42__CRKShareTargetBrowser_connectToStudentd__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) studentClient];

  if (v7 == v8)
  {
    if (v6)
    {
      v9 = [v6 domain];
      if ([v9 isEqualToString:@"ClassroomKit.error"])
      {
        uint64_t v10 = [v6 code];

        if (v10 == 202) {
          goto LABEL_12;
        }
      }
      else
      {
      }
      uint64_t v12 = _CRKLogGeneral_5();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __42__CRKShareTargetBrowser_connectToStudentd__block_invoke_cold_1(v6);
      }

      [*(id *)(a1 + 40) delegateDidInterruptWithError:v6];
    }
    else
    {
      v11 = [*(id *)(a1 + 40) studentClient];
      [v11 connectWithTransport:v5];
    }
  }
  else
  {
    [v5 invalidate];
  }
LABEL_12:
}

- (void)acquireStudentActivityAssertion
{
  objc_super v3 = [(CRKShareTargetBrowser *)self studentClient];
  v4 = objc_opt_new();
  id v5 = [v3 prepareTaskOperationForRequest:v4];

  [v5 addTarget:self selector:sel_acquireStudentActivityAssertionOperationDidFail_ forOperationEvents:4];
  [(CATOperationQueue *)self->mOperationQueue addOperation:v5];
}

- (void)acquireStudentActivityAssertionOperationDidFail:(id)a3
{
  v4 = [a3 error];
  if (![(CRKShareTargetBrowser *)self isClientInvalidationError:v4])
  {
    id v5 = _CRKLogGeneral_5();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CRKShareTargetBrowser acquireStudentActivityAssertionOperationDidFail:](v4);
    }

    [(CRKShareTargetBrowser *)self delegateDidInterruptWithError:v4];
  }
}

- (void)startBrowsingForStudentTargets
{
  objc_super v3 = _CRKLogGeneral_5();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_224C00000, v3, OS_LOG_TYPE_DEFAULT, "Classroom: Share target browser starting to browse for student targets", v7, 2u);
  }

  v4 = [(CRKShareTargetBrowser *)self studentClient];
  id v5 = objc_opt_new();
  id v6 = [v4 prepareTaskOperationForRequest:v5];

  [v6 addTarget:self selector:sel_browseForStudentTargetsOperationDidFail_ forOperationEvents:4];
  [v6 setNotificationDelegate:self];
  [(CATOperationQueue *)self->mOperationQueue addOperation:v6];
}

- (void)browseForStudentTargetsOperationDidFail:(id)a3
{
  v4 = [a3 error];
  if (![(CRKShareTargetBrowser *)self isClientInvalidationError:v4])
  {
    id v5 = _CRKLogGeneral_5();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CRKShareTargetBrowser browseForStudentTargetsOperationDidFail:](v4);
    }

    [(CRKShareTargetBrowser *)self delegateDidInterruptWithError:v4];
  }
}

- (void)connectToInstructord
{
  v4 = _CRKLogGeneral_5();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224C00000, v4, OS_LOG_TYPE_DEFAULT, "Classroom: Share target browser requesting instructord transport", buf, 2u);
  }

  id v5 = [(CRKShareTargetBrowser *)self instructorClient];
  if (!v5)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"CRKShareTargetBrowser.m" lineNumber:181 description:@"Attempting to fetch a transport without an instructor task client"];
  }
  id v6 = [(CRKShareTargetBrowser *)self transportFactory];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__CRKShareTargetBrowser_connectToInstructord__block_invoke;
  v9[3] = &unk_2646F48C8;
  id v10 = v5;
  v11 = self;
  id v7 = v5;
  [v6 makeInstructordTransportWithCompletion:v9];
}

void __45__CRKShareTargetBrowser_connectToInstructord__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) instructorClient];

  if (v7 == v8)
  {
    if (v6)
    {
      v9 = [v6 domain];
      if ([v9 isEqualToString:@"ClassroomKit.error"])
      {
        uint64_t v10 = [v6 code];

        if (v10 == 101) {
          goto LABEL_12;
        }
      }
      else
      {
      }
      uint64_t v12 = _CRKLogGeneral_5();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __45__CRKShareTargetBrowser_connectToInstructord__block_invoke_cold_1(v6);
      }

      [*(id *)(a1 + 40) delegateDidInterruptWithError:v6];
    }
    else
    {
      v11 = [*(id *)(a1 + 40) instructorClient];
      [v11 connectWithTransport:v5];
    }
  }
  else
  {
    [v5 invalidate];
  }
LABEL_12:
}

- (void)startBrowsingForInstructorTargets
{
  objc_super v3 = _CRKLogGeneral_5();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_224C00000, v3, OS_LOG_TYPE_DEFAULT, "Classroom: Share target browser starting to browse for instructor targets", v7, 2u);
  }

  v4 = [(CRKShareTargetBrowser *)self instructorClient];
  id v5 = objc_opt_new();
  id v6 = [v4 prepareTaskOperationForRequest:v5];

  [v6 addTarget:self selector:sel_browseForInstructorTargetsOperationDidFail_ forOperationEvents:4];
  [v6 setNotificationDelegate:self];
  [(CATOperationQueue *)self->mOperationQueue addOperation:v6];
}

- (void)browseForInstructorTargetsOperationDidFail:(id)a3
{
  v4 = [a3 error];
  if (![(CRKShareTargetBrowser *)self isClientInvalidationError:v4])
  {
    id v5 = _CRKLogGeneral_5();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CRKShareTargetBrowser browseForInstructorTargetsOperationDidFail:](v4);
    }

    [(CRKShareTargetBrowser *)self delegateDidInterruptWithError:v4];
  }
}

- (void)clientDidConnect:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKShareTargetBrowser *)self studentClient];

  if (v5 == v4)
  {
    id v8 = _CRKLogGeneral_5();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224C00000, v8, OS_LOG_TYPE_DEFAULT, "Classroom: Share target browser did connect to studentd", buf, 2u);
    }

    [(CRKShareTargetBrowser *)self acquireStudentActivityAssertion];
    [(CRKShareTargetBrowser *)self startBrowsingForStudentTargets];
  }
  else
  {
    id v6 = [(CRKShareTargetBrowser *)self instructorClient];

    if (v6 == v4)
    {
      id v7 = _CRKLogGeneral_5();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_224C00000, v7, OS_LOG_TYPE_DEFAULT, "Classroom: Share target browser did connect to instructord", v9, 2u);
      }

      [(CRKShareTargetBrowser *)self startBrowsingForInstructorTargets];
    }
  }
}

- (void)client:(id)a3 didInterruptWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 domain];
  if (![v8 isEqualToString:*MEMORY[0x263F399F0]])
  {

    goto LABEL_6;
  }
  uint64_t v9 = [v7 code];

  if (v9 != 302
    || ([v7 userInfo],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        [v10 objectForKeyedSubscript:@"kCATErrorMessageNameKey"],
        v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v11 isEqualToString:@"CATTaskMessageProgressUpdate"],
        v11,
        v10,
        (v12 & 1) == 0))
  {
LABEL_6:
    id v13 = [(CRKShareTargetBrowser *)self studentClient];

    if (v13 == v6)
    {
      uint64_t v16 = _CRKLogGeneral_5();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[CRKShareTargetBrowser client:didInterruptWithError:](v7);
      }

      [(CRKShareTargetBrowser *)self tearDownStudentClient];
    }
    else
    {
      id v14 = [(CRKShareTargetBrowser *)self instructorClient];

      if (v14 != v6) {
        goto LABEL_15;
      }
      v15 = _CRKLogGeneral_5();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[CRKShareTargetBrowser client:didInterruptWithError:](v7);
      }

      [(CRKShareTargetBrowser *)self tearDownInstructorClient];
    }
    [(CRKShareTargetBrowser *)self delegateDidInterruptWithError:v7];
  }
LABEL_15:
}

- (void)tearDownStudentClient
{
  objc_super v3 = [(CRKShareTargetBrowser *)self studentClient];

  if (v3)
  {
    id v4 = _CRKLogGeneral_5();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_224C00000, v4, OS_LOG_TYPE_DEFAULT, "Classroom: Share target browser is tearing down studentd task client", v7, 2u);
    }

    id v5 = [(CRKShareTargetBrowser *)self shareTargetCollector];
    [v5 studentTargetsDidChange:MEMORY[0x263EFFA68]];

    id v6 = [(CRKShareTargetBrowser *)self studentClient];
    [(CRKShareTargetBrowser *)self setStudentClient:0];
    [(CRKShareTargetBrowser *)self invalidateClient:v6];
  }
}

- (void)tearDownInstructorClient
{
  objc_super v3 = [(CRKShareTargetBrowser *)self instructorClient];

  if (v3)
  {
    id v4 = _CRKLogGeneral_5();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_224C00000, v4, OS_LOG_TYPE_DEFAULT, "Classroom: Share target browser is tearing down instructord task client", v7, 2u);
    }

    id v5 = [(CRKShareTargetBrowser *)self shareTargetCollector];
    [v5 instructorTargetsDidChange:MEMORY[0x263EFFA68]];

    id v6 = [(CRKShareTargetBrowser *)self instructorClient];
    [(CRKShareTargetBrowser *)self setInstructorClient:0];
    [(CRKShareTargetBrowser *)self invalidateClient:v6];
  }
}

- (void)invalidateClient:(id)a3
{
  id v3 = a3;
  [v3 setDelegate:0];
  [v3 invalidate];
}

- (void)taskOperation:(id)a3 didPostNotificationWithName:(id)a4 userInfo:(id)a5
{
  id v15 = a3;
  id v8 = a5;
  if ([a4 isEqualToString:@"CRKShareTargetsDidChangeNotificationName"])
  {
    uint64_t v9 = [v15 client];
    uint64_t v10 = [v8 objectForKeyedSubscript:@"ShareTargets"];
    v11 = [(CRKShareTargetBrowser *)self makeShareTargetsWithDictionaries:v10 taskClient:v9];
    char v12 = [(CRKShareTargetBrowser *)self studentClient];

    if (v9 == v12)
    {
      id v14 = [(CRKShareTargetBrowser *)self shareTargetCollector];
      [v14 studentTargetsDidChange:v11];
    }
    else
    {
      id v13 = [(CRKShareTargetBrowser *)self instructorClient];

      if (v9 != v13)
      {
LABEL_7:

        goto LABEL_8;
      }
      id v14 = [(CRKShareTargetBrowser *)self shareTargetCollector];
      [v14 instructorTargetsDidChange:v11];
    }

    goto LABEL_7;
  }
LABEL_8:
}

- (void)shareTargetCollector:(id)a3 didFindTargets:(id)a4
{
}

- (void)shareTargetCollector:(id)a3 didRemoveTargets:(id)a4
{
}

- (id)makeShareTargetsWithDictionaries:(id)a3 taskClient:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __69__CRKShareTargetBrowser_makeShareTargetsWithDictionaries_taskClient___block_invoke;
  v9[3] = &unk_2646F48F0;
  id v10 = v5;
  id v6 = v5;
  id v7 = objc_msgSend(a3, "crk_mapUsingBlock:", v9);

  return v7;
}

CRKShareTarget *__69__CRKShareTargetBrowser_makeShareTargetsWithDictionaries_taskClient___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[CRKShareTarget alloc] initWithDictionary:v3];

  [(CRKShareTarget *)v4 setTaskClient:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)isClientInvalidationError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x263F399F0]]) {
    BOOL v5 = [v3 code] == 503;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)delegateDidInterruptWithError:(id)a3
{
  id v4 = a3;
  mDelegateQueue = self->mDelegateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__CRKShareTargetBrowser_delegateDidInterruptWithError___block_invoke;
  v7[3] = &unk_2646F37F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(mDelegateQueue, v7);
}

void __55__CRKShareTargetBrowser_delegateDidInterruptWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained shareTargetBrowser:*(void *)(a1 + 32) didInterruptWithError:*(void *)(a1 + 40)];
}

- (void)delegateDidFindTargets:(id)a3
{
  id v4 = a3;
  mDelegateQueue = self->mDelegateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__CRKShareTargetBrowser_delegateDidFindTargets___block_invoke;
  v7[3] = &unk_2646F37F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(mDelegateQueue, v7);
}

void __48__CRKShareTargetBrowser_delegateDidFindTargets___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained shareTargetBrowser:*(void *)(a1 + 32) didFindTargets:*(void *)(a1 + 40)];
}

- (void)delegateDidRemoveTargets:(id)a3
{
  id v4 = a3;
  mDelegateQueue = self->mDelegateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__CRKShareTargetBrowser_delegateDidRemoveTargets___block_invoke;
  v7[3] = &unk_2646F37F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(mDelegateQueue, v7);
}

void __50__CRKShareTargetBrowser_delegateDidRemoveTargets___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained shareTargetBrowser:*(void *)(a1 + 32) didRemoveTargets:*(void *)(a1 + 40)];
}

- (CATTaskClient)studentClient
{
  return self->_studentClient;
}

- (void)setStudentClient:(id)a3
{
}

- (CATTaskClient)instructorClient
{
  return self->_instructorClient;
}

- (void)setInstructorClient:(id)a3
{
}

- (CRKShareTargetBrowserTransportFactory)transportFactory
{
  return self->_transportFactory;
}

- (CRKShareTargetCollector)shareTargetCollector
{
  return self->_shareTargetCollector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareTargetCollector, 0);
  objc_storeStrong((id *)&self->_transportFactory, 0);
  objc_storeStrong((id *)&self->_instructorClient, 0);
  objc_storeStrong((id *)&self->_studentClient, 0);
  objc_storeStrong((id *)&self->mOperationQueue, 0);
  objc_destroyWeak((id *)&self->mDelegate);

  objc_storeStrong((id *)&self->mDelegateQueue, 0);
}

void __42__CRKShareTargetBrowser_connectToStudentd__block_invoke_cold_1(void *a1)
{
  v1 = [a1 verboseDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_224C00000, v2, v3, "Share target browser failed to fetch studentd endpoint: %{public}@", v4, v5, v6, v7, v8);
}

- (void)acquireStudentActivityAssertionOperationDidFail:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 verboseDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_224C00000, v2, v3, "Classroom: Share target browser student activity assertion failed: %{public}@", v4, v5, v6, v7, v8);
}

- (void)browseForStudentTargetsOperationDidFail:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 verboseDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_224C00000, v2, v3, "Classroom: Share target browser failed to fetch student targets: %{public}@", v4, v5, v6, v7, v8);
}

void __45__CRKShareTargetBrowser_connectToInstructord__block_invoke_cold_1(void *a1)
{
  v1 = [a1 verboseDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_224C00000, v2, v3, "Classroom: Share target browser failed to fetch instructor transport: %{public}@", v4, v5, v6, v7, v8);
}

- (void)browseForInstructorTargetsOperationDidFail:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 verboseDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_224C00000, v2, v3, "Classroom: Share target browser failed to fetch instructor targets: %{public}@", v4, v5, v6, v7, v8);
}

- (void)client:(void *)a1 didInterruptWithError:.cold.1(void *a1)
{
  v1 = [a1 verboseDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_224C00000, v2, v3, "Classroom: Share target browser student connection interrupted: %{public}@", v4, v5, v6, v7, v8);
}

- (void)client:(void *)a1 didInterruptWithError:.cold.2(void *a1)
{
  v1 = [a1 verboseDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_224C00000, v2, v3, "Classroom: Share target browser instructor connection interrupted: %{public}@", v4, v5, v6, v7, v8);
}

@end