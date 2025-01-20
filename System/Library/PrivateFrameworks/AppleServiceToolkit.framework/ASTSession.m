@interface ASTSession
+ (id)sessionWithContext:(id)a3;
+ (id)sessionWithIdentity:(id)a3;
+ (id)sessionWithSerialNumber:(id)a3;
+ (void)requestAsset:(id)a3 completionHandler:(id)a4;
+ (void)requestAsset:(id)a3 serverURL:(id)a4 endpoint:(id)a5 completionHandler:(id)a6;
+ (void)sessionExistsForIdentities:(id)a3 ticketNumber:(id)a4 completion:(id)a5;
+ (void)sessionExistsForIdentities:(id)a3 ticketNumber:(id)a4 completionHandler:(id)a5;
+ (void)sessionExistsForIdentities:(id)a3 ticketNumber:(id)a4 timeout:(double)a5 completion:(id)a6;
+ (void)sessionExistsForIdentities:(id)a3 ticketNumber:(id)a4 timeout:(double)a5 completionHandler:(id)a6;
+ (void)sessionExistsForSerialNumbers:(id)a3 ticketNumber:(id)a4 completionHandler:(id)a5;
+ (void)sessionExistsForSerialNumbers:(id)a3 ticketNumber:(id)a4 timeout:(double)a5 completionHandler:(id)a6;
+ (void)sessionStatusForIdentities:(id)a3 ticketNumber:(id)a4 completionHandler:(id)a5;
+ (void)sessionStatusForIdentities:(id)a3 ticketNumber:(id)a4 timeout:(double)a5 completionHandler:(id)a6;
+ (void)sessionStatusForIdentities:(id)a3 ticketNumber:(id)a4 timeout:(double)a5 requestQueuedSuiteInfo:(BOOL)a6 completionHandler:(id)a7;
- (ASTContext)context;
- (ASTRemoteServerSession)serverSession;
- (ASTRepairSession)repairSession;
- (ASTSession)activeSession;
- (ASTSession)initWithContext:(id)a3;
- (ASTSession)initWithIdentity:(id)a3;
- (ASTSession)initWithSerialNumber:(id)a3;
- (ASTSessionDelegate)delegate;
- (BOOL)sendAuthInfoResult:(id)a3 error:(id *)a4;
- (BOOL)sendProfileResult:(id)a3 error:(id *)a4;
- (BOOL)sendTestResult:(id)a3 error:(id *)a4;
- (BOOL)shouldEvictCachedAssetForName:(id)a3;
- (BOOL)shouldShowResults;
- (NSMutableArray)destinations;
- (NSMutableSet)startedSessions;
- (OS_dispatch_group)sessionStartDispatchGroup;
- (id)destinationAssetDirectory;
- (id)destinationURLForAsset:(id)a3;
- (id)readContentsOfFileHandle:(id)a3 error:(id *)a4;
- (int64_t)sessionEndReason;
- (unint64_t)allowCellularSizeThreshold;
- (void)archive;
- (void)dealloc;
- (void)end;
- (void)fetchAsset:(id)a3 sessionClass:(Class)a4 serverURL:(id)a5 endpoint:(id)a6 completionHandler:(id)a7;
- (void)idle;
- (void)invalidate;
- (void)removeDownloadedAssets;
- (void)requestAsset:(id)a3 completionHandler:(id)a4;
- (void)requestAsset:(id)a3 serverURL:(id)a4 endpoint:(id)a5 completionHandler:(id)a6;
- (void)requestSuiteStart:(id)a3 completionHandler:(id)a4;
- (void)requestSuiteSummary:(id)a3 completionHandler:(id)a4;
- (void)requestSuitesAvailableWithCompletionHandler:(id)a3;
- (void)session:(id)a3 cancelTest:(id)a4;
- (void)session:(id)a3 didEndWithError:(id)a4;
- (void)session:(id)a3 didPauseWithError:(id)a4;
- (void)session:(id)a3 generateAuthInfoWithNonce:(id)a4;
- (void)session:(id)a3 profile:(id)a4 filteredByComponents:(id)a5;
- (void)session:(id)a3 signFile:(id)a4 completionHandler:(id)a5;
- (void)session:(id)a3 signPayload:(id)a4 completionHandler:(id)a5;
- (void)session:(id)a3 startTest:(id)a4 parameters:(id)a5 testResult:(id)a6;
- (void)sessionDidResume:(id)a3;
- (void)sessionDidStart:(id)a3;
- (void)setActiveSession:(id)a3;
- (void)setAllowCellularSizeThreshold:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDestinations:(id)a3;
- (void)setRepairSession:(id)a3;
- (void)setServerSession:(id)a3;
- (void)setSessionStartDispatchGroup:(id)a3;
- (void)setStartedSessions:(id)a3;
- (void)start;
- (void)startWithMode:(int)a3;
- (void)updateAction:(id)a3;
@end

@implementation ASTSession

+ (id)sessionWithSerialNumber:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithSerialNumber:v4];

  return v5;
}

+ (id)sessionWithIdentity:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithIdentity:v4];

  return v5;
}

+ (id)sessionWithContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithContext:v4];

  return v5;
}

- (ASTSession)initWithSerialNumber:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASTSession;
  v5 = [(ASTSession *)&v15 init];
  if (v5)
  {
    v6 = [[ASTRemoteServerSession alloc] initWithSerialNumber:v4];
    serverSession = v5->_serverSession;
    v5->_serverSession = v6;

    v8 = objc_alloc_init(ASTRepairSession);
    repairSession = v5->_repairSession;
    v5->_repairSession = v8;

    uint64_t v10 = [MEMORY[0x263EFF9C0] set];
    startedSessions = v5->_startedSessions;
    v5->_startedSessions = (NSMutableSet *)v10;

    uint64_t v12 = [MEMORY[0x263EFF980] array];
    destinations = v5->_destinations;
    v5->_destinations = (NSMutableArray *)v12;
  }
  return v5;
}

- (ASTSession)initWithIdentity:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASTSession;
  v5 = [(ASTSession *)&v15 init];
  if (v5)
  {
    v6 = [[ASTRemoteServerSession alloc] initWithIdentity:v4];
    serverSession = v5->_serverSession;
    v5->_serverSession = v6;

    v8 = objc_alloc_init(ASTRepairSession);
    repairSession = v5->_repairSession;
    v5->_repairSession = v8;

    uint64_t v10 = [MEMORY[0x263EFF9C0] set];
    startedSessions = v5->_startedSessions;
    v5->_startedSessions = (NSMutableSet *)v10;

    uint64_t v12 = [MEMORY[0x263EFF980] array];
    destinations = v5->_destinations;
    v5->_destinations = (NSMutableArray *)v12;
  }
  return v5;
}

- (ASTSession)initWithContext:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASTSession;
  v5 = [(ASTSession *)&v15 init];
  if (v5)
  {
    v6 = [[ASTRemoteServerSession alloc] initWithContext:v4];
    serverSession = v5->_serverSession;
    v5->_serverSession = v6;

    v8 = objc_alloc_init(ASTRepairSession);
    repairSession = v5->_repairSession;
    v5->_repairSession = v8;

    uint64_t v10 = [MEMORY[0x263EFF9C0] set];
    startedSessions = v5->_startedSessions;
    v5->_startedSessions = (NSMutableSet *)v10;

    uint64_t v12 = [MEMORY[0x263EFF980] array];
    destinations = v5->_destinations;
    v5->_destinations = (NSMutableArray *)v12;
  }
  return v5;
}

- (void)setActiveSession:(id)a3
{
  id v4 = (ASTSession *)a3;
  [(ASTSession *)self->_activeSession setDelegate:0];
  activeSession = self->_activeSession;
  self->_activeSession = v4;
  v6 = v4;

  id v7 = [(ASTSession *)self delegate];
  [(ASTSession *)self->_activeSession setDelegate:v7];
}

- (BOOL)shouldShowResults
{
  v2 = [(ASTSession *)self activeSession];
  char v3 = [v2 shouldShowResults];

  return v3;
}

+ (void)sessionExistsForSerialNumbers:(id)a3 ticketNumber:(id)a4 completionHandler:(id)a5
{
}

+ (void)sessionExistsForSerialNumbers:(id)a3 ticketNumber:(id)a4 timeout:(double)a5 completionHandler:(id)a6
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = +[ASTIdentity identityWithSerialNumber:](ASTIdentity, "identityWithSerialNumber:", *(void *)(*((void *)&v19 + 1) + 8 * v17), (void)v19);
        [v12 addObject:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v15);
  }

  [(id)objc_opt_class() sessionExistsForIdentities:v12 ticketNumber:v10 timeout:v11 completionHandler:a5];
}

+ (void)sessionExistsForIdentities:(id)a3 ticketNumber:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__ASTSession_sessionExistsForIdentities_ticketNumber_completionHandler___block_invoke;
  v10[3] = &unk_264E7D6D0;
  id v11 = v8;
  id v9 = v8;
  [a1 sessionStatusForIdentities:a3 ticketNumber:a4 timeout:v10 completionHandler:15.0];
}

uint64_t __72__ASTSession_sessionExistsForIdentities_ticketNumber_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)sessionExistsForIdentities:(id)a3 ticketNumber:(id)a4 timeout:(double)a5 completionHandler:(id)a6
{
  id v10 = a6;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __80__ASTSession_sessionExistsForIdentities_ticketNumber_timeout_completionHandler___block_invoke;
  v12[3] = &unk_264E7D6D0;
  id v13 = v10;
  id v11 = v10;
  [a1 sessionStatusForIdentities:a3 ticketNumber:a4 timeout:v12 completionHandler:a5];
}

uint64_t __80__ASTSession_sessionExistsForIdentities_ticketNumber_timeout_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)sessionExistsForIdentities:(id)a3 ticketNumber:(id)a4 completion:(id)a5
{
}

+ (void)sessionExistsForIdentities:(id)a3 ticketNumber:(id)a4 timeout:(double)a5 completion:(id)a6
{
  id v10 = a6;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __73__ASTSession_sessionExistsForIdentities_ticketNumber_timeout_completion___block_invoke;
  v12[3] = &unk_264E7D6D0;
  id v13 = v10;
  id v11 = v10;
  [a1 sessionStatusForIdentities:a3 ticketNumber:a4 timeout:0 requestQueuedSuiteInfo:v12 completionHandler:a5];
}

void __73__ASTSession_sessionExistsForIdentities_ticketNumber_timeout_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v10 = a4;
  id v7 = a3;
  isASTGuidedSession = [v7 isGuided];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = [v7 isGuided];

  (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v9, v10);
}

+ (void)sessionStatusForIdentities:(id)a3 ticketNumber:(id)a4 completionHandler:(id)a5
{
}

+ (void)sessionStatusForIdentities:(id)a3 ticketNumber:(id)a4 timeout:(double)a5 completionHandler:(id)a6
{
}

+ (void)sessionStatusForIdentities:(id)a3 ticketNumber:(id)a4 timeout:(double)a5 requestQueuedSuiteInfo:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v7 = a6;
  id v11 = a7;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __103__ASTSession_sessionStatusForIdentities_ticketNumber_timeout_requestQueuedSuiteInfo_completionHandler___block_invoke;
  v13[3] = &unk_264E7D6D0;
  id v14 = v11;
  id v12 = v11;
  +[ASTRemoteServerSession sessionStatusForIdentities:a3 ticketNumber:a4 timeout:v7 requestQueuedSuiteInfo:v13 completionHandler:a5];
}

void __103__ASTSession_sessionStatusForIdentities_ticketNumber_timeout_requestQueuedSuiteInfo_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  isASTGuidedSession = [v7 isGuided];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)start
{
}

- (void)startWithMode:(int)a3
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  v5 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v73 = a3;
    _os_log_impl(&dword_23CA80000, v5, OS_LOG_TYPE_DEFAULT, "Starting ASTSession in mode %d", buf, 8u);
  }

  id v6 = [(ASTSession *)self destinations];
  id v7 = [ASTSelfServiceDestination alloc];
  uint64_t v8 = [(ASTSelfServiceDestination *)v7 initWithEndpoint:1 suites:MEMORY[0x263EFFA68]];
  v71[0] = v8;
  uint64_t v9 = [ASTSelfServiceDestination alloc];
  id v10 = [(ASTSelfServiceDestination *)v9 initWithEndpoint:2 suites:MEMORY[0x263EFFA68]];
  v71[1] = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v71 count:2];
  int v12 = [v6 isEqualToArray:v11];

  if (v12)
  {
    id v13 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23CA80000, v13, OS_LOG_TYPE_DEFAULT, "ASTSession has already been started and all destinations were loaded", buf, 2u);
    }
  }
  else if (a3 == 2 || !isASTGuidedSession)
  {
    dispatch_group_t v17 = dispatch_group_create();
    [(ASTSession *)self setSessionStartDispatchGroup:v17];

    if (a3 == 2) {
      goto LABEL_19;
    }
    v18 = [(ASTSession *)self startedSessions];
    long long v19 = [(ASTSession *)self serverSession];
    int v20 = [v18 containsObject:v19];

    if (v20)
    {
      long long v21 = ASTLogHandleForCategory(0);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23CA80000, v21, OS_LOG_TYPE_DEFAULT, "Skipping starting a server session as it has already been started", buf, 2u);
      }
    }
    else
    {
      long long v22 = [(ASTSession *)self sessionStartDispatchGroup];
      dispatch_group_enter(v22);

      v23 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __28__ASTSession_startWithMode___block_invoke;
      block[3] = &unk_264E7D638;
      block[4] = self;
      dispatch_async(v23, block);
    }
    if (a3 != 1)
    {
LABEL_19:
      uint64_t v24 = [(ASTSession *)self startedSessions];
      v25 = [(ASTSession *)self repairSession];
      int v26 = [v24 containsObject:v25];

      if (v26)
      {
        v27 = ASTLogHandleForCategory(0);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_23CA80000, v27, OS_LOG_TYPE_DEFAULT, "Skipping starting a repair session as it has already been started", buf, 2u);
        }
      }
      else
      {
        v28 = [(ASTSession *)self sessionStartDispatchGroup];
        dispatch_group_enter(v28);

        v29 = dispatch_get_global_queue(0, 0);
        v68[0] = MEMORY[0x263EF8330];
        v68[1] = 3221225472;
        v68[2] = __28__ASTSession_startWithMode___block_invoke_21;
        v68[3] = &unk_264E7D638;
        v68[4] = self;
        dispatch_async(v29, v68);
      }
    }
    v30 = [(ASTSession *)self sessionStartDispatchGroup];
    dispatch_time_t v31 = dispatch_time(0, 30000000000);
    dispatch_group_wait(v30, v31);

    [(ASTSession *)self setSessionStartDispatchGroup:0];
    v32 = dispatch_group_create();
    v33 = [(ASTSession *)self repairSession];
    if (v33)
    {
      v34 = [(ASTSession *)self startedSessions];
      v35 = [(ASTSession *)self repairSession];
      int v36 = [v34 containsObject:v35];

      if (v36)
      {
        v37 = [(ASTSession *)self destinations];
        v38 = [ASTSelfServiceDestination alloc];
        v39 = [(ASTSelfServiceDestination *)v38 initWithEndpoint:2 suites:MEMORY[0x263EFFA68]];
        int v40 = [v37 containsObject:v39];

        if (v40)
        {
          v41 = ASTLogHandleForCategory(0);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_23CA80000, v41, OS_LOG_TYPE_DEFAULT, "Skipping getting suites for repair destination as they have already been obtained", buf, 2u);
          }
        }
        else
        {
          dispatch_group_enter(v32);
          v42 = [(ASTSession *)self repairSession];
          v65[0] = MEMORY[0x263EF8330];
          v65[1] = 3221225472;
          v65[2] = __28__ASTSession_startWithMode___block_invoke_22;
          v65[3] = &unk_264E7D6F8;
          objc_copyWeak(&v67, &location);
          v65[4] = self;
          v66 = v32;
          [v42 requestSuitesAvailableWithCompletionHandler:v65];

          objc_destroyWeak(&v67);
        }
      }
    }
    v43 = [(ASTSession *)self serverSession];
    if (v43)
    {
      v44 = [(ASTSession *)self startedSessions];
      v45 = [(ASTSession *)self serverSession];
      int v46 = [v44 containsObject:v45];

      if (v46)
      {
        v47 = [(ASTSession *)self destinations];
        v48 = [ASTSelfServiceDestination alloc];
        v49 = [(ASTSelfServiceDestination *)v48 initWithEndpoint:1 suites:MEMORY[0x263EFFA68]];
        int v50 = [v47 containsObject:v49];

        if (v50)
        {
          v51 = ASTLogHandleForCategory(0);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_23CA80000, v51, OS_LOG_TYPE_DEFAULT, "Skipping getting suites for AST2 destination as they have already been obtained", buf, 2u);
          }
        }
        else
        {
          dispatch_group_enter(v32);
          v52 = [(ASTSession *)self serverSession];
          v62[0] = MEMORY[0x263EF8330];
          v62[1] = 3221225472;
          v62[2] = __28__ASTSession_startWithMode___block_invoke_24;
          v62[3] = &unk_264E7D6F8;
          objc_copyWeak(&v64, &location);
          v62[4] = self;
          v63 = v32;
          [v52 requestSuitesAvailableWithCompletionHandler:v62];

          objc_destroyWeak(&v64);
        }
      }
    }
    dispatch_time_t v53 = dispatch_time(0, 5000000000);
    dispatch_group_wait(v32, v53);

    v54 = [(ASTSession *)self delegate];
    char v55 = objc_opt_respondsToSelector();

    if (v55)
    {
      v56 = [(ASTSession *)self delegate];
      v57 = [(ASTSession *)self destinations];
      v60[0] = MEMORY[0x263EF8330];
      v60[1] = 3221225472;
      v60[2] = __28__ASTSession_startWithMode___block_invoke_27;
      v60[3] = &unk_264E7D720;
      objc_copyWeak(&v61, &location);
      [v56 session:self didRequestSuiteRunWithDestinations:v57 confirmation:v60];

      objc_destroyWeak(&v61);
    }
    else
    {
      v58 = [(ASTSession *)self serverSession];
      [(ASTSession *)self setActiveSession:v58];

      v59 = [(ASTSession *)self repairSession];
      [v59 end];

      [(ASTSession *)self setRepairSession:0];
    }
  }
  else
  {
    id v14 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23CA80000, v14, OS_LOG_TYPE_DEFAULT, "Guided session was detected.", buf, 2u);
    }

    uint64_t v15 = [(ASTSession *)self serverSession];
    [v15 start];

    uint64_t v16 = [(ASTSession *)self serverSession];
    [(ASTSession *)self setActiveSession:v16];

    [(ASTSession *)self setRepairSession:0];
  }
  objc_destroyWeak(&location);
}

void __28__ASTSession_startWithMode___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  char v3 = [v2 serverSession];
  [v3 setDelegate:v2];

  id v4 = [*(id *)(a1 + 32) serverSession];
  [v4 start];
}

void __28__ASTSession_startWithMode___block_invoke_21(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  char v3 = [v2 repairSession];
  [v3 setDelegate:v2];

  id v4 = [*(id *)(a1 + 32) repairSession];
  [v4 start];
}

void __28__ASTSession_startWithMode___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([v5 count])
  {
    uint64_t v8 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v5;
      _os_log_impl(&dword_23CA80000, v8, OS_LOG_TYPE_DEFAULT, "Repaird returned suites to run: %@", (uint8_t *)&v16, 0xCu);
    }

    uint64_t v9 = [[ASTSelfServiceDestination alloc] initWithEndpoint:2 suites:v5];
    id v10 = *(id *)(a1 + 32);
    objc_sync_enter(v10);
    id v11 = [WeakRetained destinations];
    [v11 addObject:v9];

    objc_sync_exit(v10);
    int v12 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [WeakRetained destinations];
      int v16 = 138412290;
      id v17 = v13;
      _os_log_impl(&dword_23CA80000, v12, OS_LOG_TYPE_DEFAULT, "Destinations available: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    ASTLogHandleForCategory(0);
    uint64_t v9 = (ASTSelfServiceDestination *)objc_claimAutoreleasedReturnValue();
    BOOL v15 = os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v15) {
        __28__ASTSession_startWithMode___block_invoke_22_cold_2();
      }
    }
    else if (v15)
    {
      __28__ASTSession_startWithMode___block_invoke_22_cold_1();
    }
  }

  id v14 = *(NSObject **)(a1 + 40);
  if (v14) {
    dispatch_group_leave(v14);
  }
}

void __28__ASTSession_startWithMode___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([v5 count])
  {
    uint64_t v8 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v5;
      _os_log_impl(&dword_23CA80000, v8, OS_LOG_TYPE_DEFAULT, "AST returned suites to run: %@", (uint8_t *)&v16, 0xCu);
    }

    uint64_t v9 = [[ASTSelfServiceDestination alloc] initWithEndpoint:1 suites:v5];
    id v10 = *(id *)(a1 + 32);
    objc_sync_enter(v10);
    id v11 = [WeakRetained destinations];
    [v11 addObject:v9];

    objc_sync_exit(v10);
    int v12 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [WeakRetained destinations];
      int v16 = 138412290;
      id v17 = v13;
      _os_log_impl(&dword_23CA80000, v12, OS_LOG_TYPE_DEFAULT, "Destinations available: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    ASTLogHandleForCategory(0);
    uint64_t v9 = (ASTSelfServiceDestination *)objc_claimAutoreleasedReturnValue();
    BOOL v15 = os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v15) {
        __28__ASTSession_startWithMode___block_invoke_24_cold_2();
      }
    }
    else if (v15)
    {
      __28__ASTSession_startWithMode___block_invoke_24_cold_1();
    }
  }

  id v14 = *(NSObject **)(a1 + 40);
  if (v14) {
    dispatch_group_leave(v14);
  }
}

void __28__ASTSession_startWithMode___block_invoke_27(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2 == 1)
  {
    id v6 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_23CA80000, v6, OS_LOG_TYPE_DEFAULT, "Switching to the server session", v10, 2u);
    }

    uint64_t v5 = [WeakRetained serverSession];
    goto LABEL_9;
  }
  if (a2 == 2)
  {
    id v4 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23CA80000, v4, OS_LOG_TYPE_DEFAULT, "Switching to the repair session", buf, 2u);
    }

    uint64_t v5 = [WeakRetained repairSession];
LABEL_9:
    id v7 = (void *)v5;
    [WeakRetained setActiveSession:v5];

    goto LABEL_13;
  }
  uint64_t v8 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_23CA80000, v8, OS_LOG_TYPE_DEFAULT, "Invalidating the active session", v9, 2u);
  }

  [WeakRetained setActiveSession:0];
LABEL_13:
}

- (void)idle
{
  id v2 = [(ASTSession *)self activeSession];
  [v2 idle];
}

- (void)end
{
  id v2 = [(ASTSession *)self activeSession];
  [v2 end];
}

- (void)invalidate
{
  id v2 = [(ASTSession *)self activeSession];
  [v2 invalidate];
}

- (void)archive
{
  char v3 = [(ASTSession *)self serverSession];

  if (v3)
  {
    id v4 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_23CA80000, v4, OS_LOG_TYPE_DEFAULT, "Archiving AST2 session", v6, 2u);
    }

    uint64_t v5 = [(ASTSession *)self serverSession];
    [v5 archive];
  }
}

- (BOOL)sendAuthInfoResult:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(ASTSession *)self activeSession];
  LOBYTE(a4) = [v7 sendAuthInfoResult:v6 error:a4];

  return (char)a4;
}

- (BOOL)sendProfileResult:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(ASTSession *)self activeSession];
  LOBYTE(a4) = [v7 sendProfileResult:v6 error:a4];

  return (char)a4;
}

- (BOOL)sendTestResult:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(ASTSession *)self activeSession];
  LOBYTE(a4) = [v7 sendTestResult:v6 error:a4];

  return (char)a4;
}

- (void)updateAction:(id)a3
{
  id v4 = a3;
  id v5 = [(ASTSession *)self activeSession];
  [v5 updateAction:v4];
}

- (void)requestSuitesAvailableWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ASTSession *)self activeSession];
  [v5 requestSuitesAvailableWithCompletionHandler:v4];
}

- (void)requestSuiteStart:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ASTSession *)self activeSession];
  [v8 requestSuiteStart:v7 completionHandler:v6];
}

- (void)requestSuiteSummary:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    id v8 = [(ASTSession *)self activeSession];
    [v8 requestSuiteSummary:v6 completionHandler:v7];
  }
  else
  {
    id v8 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_23CA80000, v8, OS_LOG_TYPE_DEFAULT, "Not requesting suite summary because diagnostic event id is nil", v9, 2u);
    }
  }
}

- (void)session:(id)a3 startTest:(id)a4 parameters:(id)a5 testResult:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(ASTSession *)self activeSession];

  if (v13 == v15)
  {
    id v14 = [(ASTSession *)self delegate];
    [v14 session:v15 startTest:v10 parameters:v11 testResult:v12];
  }
}

- (void)session:(id)a3 cancelTest:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(ASTSession *)self activeSession];

  if (v7 == v9)
  {
    id v8 = [(ASTSession *)self delegate];
    [v8 session:v9 cancelTest:v6];
  }
}

- (void)session:(id)a3 profile:(id)a4 filteredByComponents:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(ASTSession *)self delegate];
  [v11 session:v10 profile:v9 filteredByComponents:v8];
}

- (void)session:(id)a3 didPauseWithError:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(ASTSession *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(ASTSession *)self delegate];
    [v9 session:v10 didPauseWithError:v6];
  }
}

- (void)sessionDidResume:(id)a3
{
  id v7 = a3;
  id v4 = [(ASTSession *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ASTSession *)self delegate];
    [v6 sessionDidResume:v7];
  }
}

- (void)session:(id)a3 didEndWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ASTSession *)self serverSession];

  if (v8 != v6)
  {
    id v9 = [(ASTSession *)self repairSession];

    if (v9 == v6)
    {
      id v13 = [(ASTSession *)self sessionStartDispatchGroup];

      if (v13)
      {
        id v14 = [(ASTSession *)self sessionStartDispatchGroup];
        dispatch_group_leave(v14);
      }
      id v15 = [(ASTSession *)self startedSessions];
      int v16 = [(ASTSession *)self repairSession];
      int v17 = [v15 containsObject:v16];

      if (v17)
      {
        uint64_t v18 = self;
        objc_sync_enter(v18);
        long long v19 = [(ASTSession *)v18 startedSessions];
        int v20 = [(ASTSession *)v18 repairSession];
        [v19 removeObject:v20];

        objc_sync_exit(v18);
      }
      [(ASTSession *)self setRepairSession:0];
    }
    else
    {
      id v10 = ASTLogHandleForCategory(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[ASTSession session:didEndWithError:]();
      }
    }
    goto LABEL_19;
  }
  id v11 = [(ASTSession *)self sessionStartDispatchGroup];

  if (v11)
  {
    id v12 = [(ASTSession *)self sessionStartDispatchGroup];
    dispatch_group_leave(v12);
LABEL_15:

    goto LABEL_16;
  }
  id v21 = [(ASTSession *)self activeSession];

  if (v21 != v6)
  {
    id v12 = [(ASTSession *)self delegate];
    [v12 session:v6 didEndWithError:v7];
    goto LABEL_15;
  }
LABEL_16:
  long long v22 = [(ASTSession *)self startedSessions];
  v23 = [(ASTSession *)self serverSession];
  int v24 = [v22 containsObject:v23];

  if (v24)
  {
    v25 = self;
    objc_sync_enter(v25);
    int v26 = [(ASTSession *)v25 startedSessions];
    v27 = [(ASTSession *)v25 serverSession];
    [v26 removeObject:v27];

    objc_sync_exit(v25);
  }
  [(ASTSession *)self setServerSession:0];
LABEL_19:
}

- (void)sessionDidStart:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(ASTSession *)self serverSession];
  if (v5 == v4)
  {
  }
  else
  {
    id v6 = [(ASTSession *)self repairSession];

    if (v6 != v4)
    {
      id v7 = ASTLogHandleForCategory(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[ASTSession session:didEndWithError:]();
      }
      goto LABEL_10;
    }
  }
  id v8 = [(ASTSession *)self sessionStartDispatchGroup];

  if (v8)
  {
    id v9 = [(ASTSession *)self sessionStartDispatchGroup];
    dispatch_group_leave(v9);
  }
  id v10 = self;
  objc_sync_enter(v10);
  id v11 = [(ASTSession *)v10 startedSessions];
  [v11 addObject:v4];

  objc_sync_exit(v10);
  id v7 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [(ASTSession *)v10 startedSessions];
    int v13 = 138412290;
    id v14 = v12;
    _os_log_impl(&dword_23CA80000, v7, OS_LOG_TYPE_DEFAULT, "Started sessions: %@", (uint8_t *)&v13, 0xCu);
  }
LABEL_10:
}

- (void)session:(id)a3 generateAuthInfoWithNonce:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(ASTSession *)self delegate];
  int v8 = [v7 conformsToProtocol:&unk_26F0B78A8];

  if (v8)
  {
    id v9 = (void *)MEMORY[0x23ECF0310]();
    id v10 = [(ASTSession *)self delegate];
    [v10 session:v11 generateAuthInfoWithNonce:v6];
  }
}

- (void)session:(id)a3 signPayload:(id)a4 completionHandler:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(ASTSession *)self delegate];
  int v11 = [v10 conformsToProtocol:&unk_26F0B78A8];

  if (v11)
  {
    id v12 = (void *)MEMORY[0x23ECF0310]();
    int v13 = [(ASTSession *)self delegate];
    [v13 session:v14 signPayload:v8 completionHandler:v9];
  }
}

- (void)session:(id)a3 signFile:(id)a4 completionHandler:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(ASTSession *)self delegate];
  int v11 = [v10 conformsToProtocol:&unk_26F0B78A8];

  if (v11)
  {
    id v12 = (void *)MEMORY[0x23ECF0310]();
    int v13 = [(ASTSession *)self delegate];
    [v13 session:v14 signFile:v8 completionHandler:v9];
  }
}

+ (void)requestAsset:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = +[ASTEnvironment currentEnvironment];
  id v8 = [v9 assetURL];
  [a1 requestAsset:v7 serverURL:v8 endpoint:0 completionHandler:v6];
}

+ (void)requestAsset:(id)a3 serverURL:(id)a4 endpoint:(id)a5 completionHandler:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  int v13 = objc_alloc_init(ASTSession);
  [(ASTSession *)v13 requestAsset:v12 serverURL:v11 endpoint:v10 completionHandler:v9];
}

- (void)requestAsset:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = +[ASTEnvironment currentEnvironment];
  id v8 = [v9 assetURL];
  [(ASTSession *)self requestAsset:v7 serverURL:v8 endpoint:0 completionHandler:v6];
}

- (void)requestAsset:(id)a3 serverURL:(id)a4 endpoint:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(ASTSession *)self activeSession];
  [(ASTSession *)self fetchAsset:v13 sessionClass:objc_opt_class() serverURL:v12 endpoint:v11 completionHandler:v10];
}

- (void)fetchAsset:(id)a3 sessionClass:(Class)a4 serverURL:(id)a5 endpoint:(id)a6 completionHandler:(id)a7
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v32 = a5;
  id v33 = a6;
  id v13 = (void (**)(id, id, id))a7;
  if (!a4) {
    a4 = (Class)objc_opt_class();
  }
  if (a4 == (Class)objc_opt_class() || a4 == (Class)objc_opt_class())
  {
    uint64_t v15 = [(ASTSession *)self destinationURLForAsset:v12];
    int v16 = [v15 path];
    int v17 = self;
    objc_sync_enter(v17);
    if ([(ASTSession *)v17 shouldEvictCachedAssetForName:v12]
      && ([MEMORY[0x263F08850] defaultManager],
          uint64_t v18 = objc_claimAutoreleasedReturnValue(),
          int v19 = [v18 fileExistsAtPath:v16],
          v18,
          v19))
    {
      int v20 = [MEMORY[0x263F08850] defaultManager];
      id v41 = 0;
      int v21 = [v20 removeItemAtPath:v16 error:&v41];
      id v22 = v41;

      if (v21)
      {
        v23 = ASTLogHandleForCategory(1);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v43 = v12;
          _os_log_impl(&dword_23CA80000, v23, OS_LOG_TYPE_DEFAULT, "Eviction of stale asset [%@] from disk was successful", buf, 0xCu);
        }
      }
      else
      {
        v23 = ASTLogHandleForCategory(1);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[ASTSession fetchAsset:sessionClass:serverURL:endpoint:completionHandler:]((uint64_t)v12);
        }
      }
    }
    else
    {
      id v22 = 0;
    }
    int v24 = [MEMORY[0x263F08850] defaultManager];
    char v25 = [v24 fileExistsAtPath:v16];

    if (v25)
    {
      int v26 = ASTLogHandleForCategory(1);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v43 = v12;
        _os_log_impl(&dword_23CA80000, v26, OS_LOG_TYPE_DEFAULT, "Using cached version of asset [%@] on disk", buf, 0xCu);
      }

      id v27 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v16];
      v13[2](v13, v27, v22);
      id v28 = v22;
    }
    else
    {
      id v40 = v22;
      id v27 = +[ASTFileManagement unprotectedFileHandleForFileURL:v15 error:&v40];
      id v28 = v40;

      if (v27)
      {
        v34[0] = MEMORY[0x263EF8330];
        v34[1] = 3221225472;
        v34[2] = __75__ASTSession_fetchAsset_sessionClass_serverURL_endpoint_completionHandler___block_invoke;
        v34[3] = &unk_264E7D748;
        id v29 = v12;
        id v35 = v29;
        int v36 = v17;
        id v27 = v27;
        id v37 = v27;
        id v38 = v16;
        v39 = v13;
        v30 = (void *)MEMORY[0x23ECF0530](v34);
        if (a4 == (Class)objc_opt_class())
        {
          +[ASTRemoteServerSession downloadAsset:v29 serverURL:v32 endpoint:v33 fileHandle:v27 completionHandler:v30];
        }
        else if (a4 == (Class)objc_opt_class())
        {
          +[ASTRepairSession downloadAsset:v29 fileHandle:v27 completionHandler:v30];
        }
      }
      else
      {
        dispatch_time_t v31 = ASTLogHandleForCategory(1);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          -[ASTSession fetchAsset:sessionClass:serverURL:endpoint:completionHandler:]((uint64_t)v15);
        }

        v13[2](v13, 0, v28);
      }
    }

    objc_sync_exit(v17);
  }
  else
  {
    id v14 = ASTLogHandleForCategory(1);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ASTSession fetchAsset:sessionClass:serverURL:endpoint:completionHandler:]();
    }

    uint64_t v15 = [MEMORY[0x263F087E8] errorWithDomain:@"ASTErrorDomain" code:-1002 userInfo:0];
    v13[2](v13, 0, v15);
  }
}

void __75__ASTSession_fetchAsset_sessionClass_serverURL_endpoint_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = ASTLogHandleForCategory(1);
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v8;
      _os_log_impl(&dword_23CA80000, v7, OS_LOG_TYPE_DEFAULT, "Download of asset [%@] was successful", buf, 0xCu);
    }

    id v9 = *(void **)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    id v20 = v5;
    id v11 = [v9 readContentsOfFileHandle:v10 error:&v20];
    id v12 = v20;

    [*(id *)(a1 + 48) closeFile];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __75__ASTSession_fetchAsset_sessionClass_serverURL_endpoint_completionHandler___block_invoke_cold_1(a1);
    }

    id v13 = [MEMORY[0x263F08850] defaultManager];
    int v14 = [v13 fileExistsAtPath:*(void *)(a1 + 56)];

    if (!v14)
    {
      id v11 = 0;
      goto LABEL_13;
    }
    uint64_t v15 = ASTLogHandleForCategory(1);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v16;
      _os_log_impl(&dword_23CA80000, v15, OS_LOG_TYPE_DEFAULT, "Removing empty asset file [%@]", buf, 0xCu);
    }

    [*(id *)(a1 + 48) closeFile];
    int v17 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v18 = *(void *)(a1 + 56);
    id v19 = v5;
    [v17 removeItemAtPath:v18 error:&v19];
    id v12 = v19;

    id v11 = 0;
  }
  id v5 = v12;
LABEL_13:
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (id)destinationURLForAsset:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(ASTSession *)self destinationAssetDirectory];
  uint64_t v6 = +[ASTEncodingUtilities SHA256HashForString:v4];
  if (v6) {
    id v7 = (__CFString *)v6;
  }
  else {
    id v7 = @"unknown";
  }
  uint64_t v8 = [v5 URLByAppendingPathComponent:v7];
  id v9 = ASTLogHandleForCategory(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_23CA80000, v9, OS_LOG_TYPE_DEFAULT, "Using [%@] as path for asset [%@]", (uint8_t *)&v11, 0x16u);
  }

  return v8;
}

- (id)destinationAssetDirectory
{
  v7[3] = *MEMORY[0x263EF8340];
  id v2 = NSTemporaryDirectory();
  if (!v2)
  {
    id v2 = [NSString string];
  }
  char v3 = NSURL;
  v7[0] = v2;
  v7[1] = @"com.apple.AppleServiceToolkit";
  v7[2] = @"assets";
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:3];
  id v5 = [v3 fileURLWithPathComponents:v4];

  return v5;
}

- (id)readContentsOfFileHandle:(id)a3 error:(id *)a4
{
  id v4 = a3;
  [v4 seekToFileOffset:0];
  id v5 = [v4 readDataToEndOfFile];

  return v5;
}

- (void)removeDownloadedAssets
{
  id v4 = [MEMORY[0x263F08850] defaultManager];
  char v3 = [(ASTSession *)self destinationAssetDirectory];
  [v4 removeItemAtURL:v3 error:0];
}

- (BOOL)shouldEvictCachedAssetForName:(id)a3
{
  id v4 = a3;
  id v5 = [(ASTSession *)self destinationURLForAsset:v4];
  uint64_t v6 = [v5 path];
  id v7 = [MEMORY[0x263F08850] defaultManager];
  int v8 = [v7 fileExistsAtPath:v6];

  id v9 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v6];
  uint64_t v10 = v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11 || [v9 length])
  {
    id v12 = (void *)shouldEvictCachedAssetForName__evictCacheForAssets;
    if (!shouldEvictCachedAssetForName__evictCacheForAssets)
    {
      uint64_t v13 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"strings", 0);
      id v14 = (void *)shouldEvictCachedAssetForName__evictCacheForAssets;
      shouldEvictCachedAssetForName__evictCacheForAssets = v13;

      id v12 = (void *)shouldEvictCachedAssetForName__evictCacheForAssets;
    }
    char v15 = [v12 containsObject:v4];
  }
  else
  {
    char v15 = 1;
  }

  return v15;
}

- (void)dealloc
{
  [(ASTSession *)self removeDownloadedAssets];
  v3.receiver = self;
  v3.super_class = (Class)ASTSession;
  [(ASTSession *)&v3 dealloc];
}

- (ASTSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ASTSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)allowCellularSizeThreshold
{
  return self->_allowCellularSizeThreshold;
}

- (void)setAllowCellularSizeThreshold:(unint64_t)a3
{
  self->_allowCellularSizeThreshold = a3;
}

- (ASTContext)context
{
  return self->_context;
}

- (int64_t)sessionEndReason
{
  return self->_sessionEndReason;
}

- (ASTRemoteServerSession)serverSession
{
  return self->_serverSession;
}

- (void)setServerSession:(id)a3
{
}

- (ASTRepairSession)repairSession
{
  return self->_repairSession;
}

- (void)setRepairSession:(id)a3
{
}

- (NSMutableArray)destinations
{
  return self->_destinations;
}

- (void)setDestinations:(id)a3
{
}

- (NSMutableSet)startedSessions
{
  return self->_startedSessions;
}

- (void)setStartedSessions:(id)a3
{
}

- (ASTSession)activeSession
{
  return self->_activeSession;
}

- (OS_dispatch_group)sessionStartDispatchGroup
{
  return self->_sessionStartDispatchGroup;
}

- (void)setSessionStartDispatchGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionStartDispatchGroup, 0);
  objc_storeStrong((id *)&self->_activeSession, 0);
  objc_storeStrong((id *)&self->_startedSessions, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_repairSession, 0);
  objc_storeStrong((id *)&self->_serverSession, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_context, 0);
}

void __28__ASTSession_startWithMode___block_invoke_22_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23CA80000, v0, v1, "Repaird has no suites to run", v2, v3, v4, v5, v6);
}

void __28__ASTSession_startWithMode___block_invoke_22_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23CA80000, v0, v1, "Error requesting the repair suites available: %@", v2, v3, v4, v5, v6);
}

void __28__ASTSession_startWithMode___block_invoke_24_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23CA80000, v0, v1, "AST2 has no suites to run", v2, v3, v4, v5, v6);
}

void __28__ASTSession_startWithMode___block_invoke_24_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23CA80000, v0, v1, "Error requesting the AST2 suites available: %@", v2, v3, v4, v5, v6);
}

- (void)session:didEndWithError:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23CA80000, v0, v1, "Unknown session did end!", v2, v3, v4, v5, v6);
}

- (void)fetchAsset:(uint64_t)a1 sessionClass:serverURL:endpoint:completionHandler:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23CA80000, v1, v2, "Could not open file handle for [%@]: %@", (void)v3, DWORD2(v3));
}

- (void)fetchAsset:(uint64_t)a1 sessionClass:serverURL:endpoint:completionHandler:.cold.2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23CA80000, v1, v2, "Eviction of stale asset [%@] from disk was NOT successful: %@", (void)v3, DWORD2(v3));
}

- (void)fetchAsset:sessionClass:serverURL:endpoint:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23CA80000, v0, v1, "Unknown session class %@", v2, v3, v4, v5, v6);
}

void __75__ASTSession_fetchAsset_sessionClass_serverURL_endpoint_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23CA80000, v1, v2, "Download of asset [%@] was NOT successful: %@", (void)v3, DWORD2(v3));
}

- (void)readContentsOfFileHandle:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23CA80000, v0, v1, "Could not read asset file: %@", v2, v3, v4, v5, v6);
}

@end