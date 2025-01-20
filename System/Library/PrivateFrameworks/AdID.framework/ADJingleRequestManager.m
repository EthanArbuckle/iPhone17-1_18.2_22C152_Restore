@interface ADJingleRequestManager
+ (id)sharedInstance;
- (ADJingleRequestManager)init;
- (BOOL)canMakeJingleRequest;
- (BOOL)jingleRequestInProgress;
- (NSMutableDictionary)pendingJingleRequests;
- (id)makeSegmentRequest:(id)a3 forceSegments:(BOOL)a4 withCompletion:(id)a5;
- (void)authenticateUser:(id)a3;
- (void)jingleRequestCompleted:(id)a3;
- (void)setJingleRequestInProgress:(BOOL)a3;
- (void)setPendingJingleRequests:(id)a3;
- (void)startJingleRequest:(id)a3;
@end

@implementation ADJingleRequestManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__ADJingleRequestManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__onceToken_5 != -1) {
    dispatch_once(&sharedInstance__onceToken_5, block);
  }
  v2 = (void *)sharedInstance__instance_5;

  return v2;
}

uint64_t __40__ADJingleRequestManager_sharedInstance__block_invoke()
{
  sharedInstance__instance_5 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return MEMORY[0x270F9A758]();
}

- (ADJingleRequestManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)ADJingleRequestManager;
  v2 = [(ADJingleRequestManager *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    pendingJingleRequests = v2->_pendingJingleRequests;
    v2->_pendingJingleRequests = v3;
  }
  return v2;
}

- (void)startJingleRequest:(id)a3
{
  id v4 = a3;
  pendingJingleRequests = self->_pendingJingleRequests;
  objc_super v6 = [v4 token];
  [(NSMutableDictionary *)pendingJingleRequests setObject:v4 forKeyedSubscript:v6];

  v7 = [MEMORY[0x263F24230] workQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__ADJingleRequestManager_startJingleRequest___block_invoke;
  v9[3] = &unk_2646696C0;
  id v10 = v4;
  id v8 = v4;
  [v7 addOperationWithBlock:v9];
}

uint64_t __45__ADJingleRequestManager_startJingleRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) send];
}

- (id)makeSegmentRequest:(id)a3 forceSegments:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (v8 && [(ADJingleRequestManager *)self canMakeJingleRequest])
  {
    id v10 = [ADJingleSegmentRequest alloc];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __74__ADJingleRequestManager_makeSegmentRequest_forceSegments_withCompletion___block_invoke;
    v19[3] = &unk_26466A0C8;
    v19[4] = self;
    id v20 = v9;
    id v11 = [(ADJingleSegmentRequest *)v10 init:v8 forceSegments:v6 withCompletion:v19];
    [(ADJingleRequestManager *)self startJingleRequest:v11];
    v12 = [v11 token];
    v13 = (void *)[v12 copy];
  }
  else
  {
    v14 = NSString;
    BOOL v15 = [(ADJingleRequestManager *)self canMakeJingleRequest];
    v16 = @"NO";
    if (v15) {
      v16 = @"YES";
    }
    v17 = [v14 stringWithFormat:@"Unable to make Segment Request for DSID %@. Has activeDSIDRecord and Network Connection: %@", v8, v16];
    _ADLog();

    if (v9) {
      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }
    v13 = 0;
  }

  return v13;
}

void __74__ADJingleRequestManager_makeSegmentRequest_forceSegments_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x263F24230] workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__ADJingleRequestManager_makeSegmentRequest_forceSegments_withCompletion___block_invoke_2;
  v7[3] = &unk_264669760;
  v5 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 addOperationWithBlock:v7];
}

uint64_t __74__ADJingleRequestManager_makeSegmentRequest_forceSegments_withCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) jingleRequestCompleted:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (BOOL)canMakeJingleRequest
{
  v2 = [MEMORY[0x263F241D8] sharedInstance];
  id v3 = [v2 activeDSIDRecord];

  if (!v3)
  {
    id v4 = [NSString stringWithFormat:@"[%@] There is no active DSID Record.", objc_opt_class()];
    _ADLog();
  }
  v5 = [MEMORY[0x263F241D8] sharedInstance];
  id v6 = [v5 activeDSIDRecord];
  BOOL v7 = v6 != 0;

  return v7;
}

- (void)jingleRequestCompleted:(id)a3
{
  pendingJingleRequests = self->_pendingJingleRequests;
  id v5 = a3;
  id v6 = [v5 token];
  BOOL v7 = [(NSMutableDictionary *)pendingJingleRequests objectForKey:v6];

  if (v7)
  {
    id v8 = self->_pendingJingleRequests;
    id v11 = [v5 token];

    [(NSMutableDictionary *)v8 removeObjectForKey:v11];
  }
  else
  {
    id v9 = NSString;
    id v11 = [v5 token];

    objc_msgSend(v9, "stringWithFormat:", @"Received a response to Jingle request %@, but the request has already timed out; this response will be ignored.",
    id v10 = v11);
    _ADLog();
  }
}

- (void)authenticateUser:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F24230] workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__ADJingleRequestManager_authenticateUser___block_invoke;
  v7[3] = &unk_264669738;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

void __43__ADJingleRequestManager_authenticateUser___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F241C0] sharedInstance];
  if ([v2 educationModeEnabled])
  {

    goto LABEL_4;
  }
  id v3 = [MEMORY[0x263F241C0] sharedInstance];
  int v4 = [v3 isManagedAppleID];

  if (v4)
  {
LABEL_4:
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      id v6 = *(void (**)(void))(v5 + 16);
      v6();
    }
    return;
  }
  BOOL v7 = [MEMORY[0x263F241C0] sharedInstance];
  id v23 = [v7 iTunesStoreAccount];

  id v8 = NSString;
  uint64_t v9 = objc_opt_class();
  if (v23)
  {
    id v10 = [v8 stringWithFormat:@"[%@]: Initiating Jingle authentication request.", v9];
    _ADLog();

    id v11 = +[ADAMSBagManager sharedInstance];
    int v12 = [v11 authenticateAccountThroughAMSOperation:v23];

    v13 = NSString;
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = v14;
    if (v12)
    {
      v16 = objc_msgSend(v23, "ams_DSID");
      v17 = [v16 stringValue];
      v18 = [v13 stringWithFormat:@"[%@]: Successfully authenticated account. The account is: %@", v15, v17];
      _ADLog();

      uint64_t v19 = *(void *)(a1 + 40);
      if (v19)
      {
        id v20 = *(void (**)(void))(v19 + 16);
LABEL_17:
        v20();
        goto LABEL_18;
      }
      goto LABEL_18;
    }
    [v13 stringWithFormat:@"[%@]: FILE A RADAR IMMEDIATELY: We have an active account but could not authenticate it.", v14];
  }
  else
  {
    [v8 stringWithFormat:@"[%@]: Jingle authentication request failed, ACAccount is (null).", v9];
  v21 = };
  _ADLog();

  uint64_t v22 = *(void *)(a1 + 40);
  if (v22)
  {
    id v20 = *(void (**)(void))(v22 + 16);
    goto LABEL_17;
  }
LABEL_18:
}

- (BOOL)jingleRequestInProgress
{
  return self->_jingleRequestInProgress;
}

- (void)setJingleRequestInProgress:(BOOL)a3
{
  self->_jingleRequestInProgress = a3;
}

- (NSMutableDictionary)pendingJingleRequests
{
  return self->_pendingJingleRequests;
}

- (void)setPendingJingleRequests:(id)a3
{
}

- (void).cxx_destruct
{
}

@end