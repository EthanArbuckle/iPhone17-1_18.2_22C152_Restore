@interface ADAttributionRequester
- (ADAttributionRequester)initWithConnection:(id)a3 bundleID:(id)a4 transactionID:(id)a5;
- (BOOL)_isAppTrackingAuthorized;
- (NSNumber)transactionToken;
- (NSString)bundleID;
- (NSXPCConnection)connection;
- (void)beginAttributionRequest:(id)a3 reason:(id)a4 completionHandler:(id)a5;
- (void)requestAttributionDetails:(id)a3;
- (void)requestAttributionDetailsWithBlock:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setConnection:(id)a3;
- (void)setServerToTest:(int64_t)a3;
- (void)setStocksAdEnabled:(BOOL)a3;
- (void)setTransactionToken:(id)a3;
@end

@implementation ADAttributionRequester

void __45__ADAttributionRequester_setStocksAdEnabled___block_invoke()
{
  id v0 = [NSString stringWithFormat:@"IDs have been set by request of Stock's enablement call."];
  _ADLog();
}

- (void)setStocksAdEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(NSXPCConnection *)self->_connection valueForEntitlement:@"com.apple.private.iad.news-client"];
  char v5 = [v4 BOOLValue];

  if ((v5 & 1) == 0)
  {
    id v11 = [NSString stringWithFormat:@"ERROR: A request to change Stocks Ad enablement was made from a non-entitled caller."];
    _ADLog();
    goto LABEL_7;
  }
  v6 = @"disable";
  if (v3) {
    v6 = @"enable";
  }
  v7 = [NSString stringWithFormat:@"Received request to %@ Ads in Stocks.", v6];
  _ADLog();

  v8 = [MEMORY[0x263F241B8] sharedInstance];
  [v8 setBool:v3 forKey:@"StocksEnabled"];

  if (v3)
  {
    id v11 = [MEMORY[0x263F241D8] sharedInstance];
    v9 = [MEMORY[0x263F241C0] sharedInstance];
    v10 = [v9 iTunesAccountDSID];
    [v11 setDSID:v10 completionHandler:&__block_literal_global];

LABEL_7:
  }
}

- (void)setServerToTest:(int64_t)a3
{
  v4 = [(NSXPCConnection *)self->_connection valueForEntitlement:@"com.apple.private.iad.news-client"];
  char v5 = [v4 BOOLValue];

  if (v5)
  {
    v6 = [NSString stringWithFormat:@"Received request to change AdServer environment."];
    _ADLog();

    switch(a3)
    {
      case 1:
        v7 = [MEMORY[0x263F241B8] sharedInstance];
        [v7 setString:@"https://iad2v1-iadsdk.iad.apple.com/adserver" forKey:@"AdServerURL"];

        v8 = [MEMORY[0x263F241B8] sharedInstance];
        v9 = v8;
        v10 = @"https://iad2v1-cf.iad.apple.com/adserver";
        break;
      case 2:
        v12 = [MEMORY[0x263F241B8] sharedInstance];
        [v12 setString:@"https://iad2v2-iadsdk.iad.apple.com/adserver" forKey:@"AdServerURL"];

        v8 = [MEMORY[0x263F241B8] sharedInstance];
        v9 = v8;
        v10 = @"https://iad2v2-cf.iad.apple.com/adserver";
        break;
      case 3:
        v13 = [MEMORY[0x263F241B8] sharedInstance];
        [v13 setString:@"https://iad2v3-iadsdk.iad.apple.com/adserver" forKey:@"AdServerURL"];

        v8 = [MEMORY[0x263F241B8] sharedInstance];
        v9 = v8;
        v10 = @"https://iad2v3-cf.iad.apple.com/adserver";
        break;
      case 4:
        v14 = [MEMORY[0x263F241B8] sharedInstance];
        [v14 setString:@"https://iad2v4-iadsdk.iad.apple.com/adserver" forKey:@"AdServerURL"];

        v8 = [MEMORY[0x263F241B8] sharedInstance];
        v9 = v8;
        v10 = @"https://iad2v4-cf.iad.apple.com/adserver";
        break;
      case 5:
        v15 = [MEMORY[0x263F241B8] sharedInstance];
        [v15 setString:@"https://iad2v5-iadsdk.iad.apple.com/adserver" forKey:@"AdServerURL"];

        v8 = [MEMORY[0x263F241B8] sharedInstance];
        v9 = v8;
        v10 = @"https://iad2v5-cf.iad.apple.com/adserver";
        break;
      default:
        id v11 = [MEMORY[0x263F241B8] sharedInstance];
        [v11 setString:@"https://iadsdk.apple.com/adserver" forKey:@"AdServerURL"];

        v8 = [MEMORY[0x263F241B8] sharedInstance];
        v9 = v8;
        v10 = @"https://cf.iadsdk.apple.com/adserver";
        break;
    }
    [v8 setString:v10 forKey:@"ConfigurationAdServerURL"];

    v16 = [MEMORY[0x263F241B8] sharedInstance];
    [v16 setBool:1 forKey:@"ForceExpireConfiguration"];

    v17 = [MEMORY[0x263F24230] sharedInstance];
    [v17 setConfigurationExpirationTime:0];

    id v18 = [MEMORY[0x263F087C8] defaultCenter];
    [v18 postNotificationName:@"ForceExpireConfiguration" object:@"com.apple.AdLib" userInfo:0];
  }
  else
  {
    id v18 = [NSString stringWithFormat:@"ERROR: A request to change AdServer environment was made from a non-entitled caller."];
    _ADLog();
  }
}

- (ADAttributionRequester)initWithConnection:(id)a3 bundleID:(id)a4 transactionID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)ADAttributionRequester;
  v12 = [(ADAttributionRequester *)&v23 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bundleID, a4);
    objc_storeStrong((id *)&v13->_transactionToken, a5);
    objc_storeStrong((id *)&v13->_connection, a3);
    [(NSXPCConnection *)v13->_connection setExportedObject:v13];
    v14 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D51FA38];
    [(NSXPCConnection *)v13->_connection setExportedInterface:v14];

    v15 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D51FA38];
    [(NSXPCConnection *)v13->_connection setRemoteObjectInterface:v15];

    objc_initWeak(&location, v13);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __68__ADAttributionRequester_initWithConnection_bundleID_transactionID___block_invoke;
    v20[3] = &unk_264637D58;
    objc_copyWeak(&v21, &location);
    [(NSXPCConnection *)v13->_connection setInvalidationHandler:v20];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __68__ADAttributionRequester_initWithConnection_bundleID_transactionID___block_invoke_2;
    v18[3] = &unk_264637D58;
    objc_copyWeak(&v19, &location);
    [(NSXPCConnection *)v13->_connection setInterruptionHandler:v18];
    v16 = [NSString stringWithFormat:@"Accepted connection from Attribution Client."];
    _ADLog();

    [(NSXPCConnection *)v13->_connection resume];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __68__ADAttributionRequester_initWithConnection_bundleID_transactionID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = NSString;
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v3 = [WeakRetained bundleID];
    v4 = [v2 stringWithFormat:@"XPC connection invalidated for %@. Lost connection from Attribution Client.", v3];
    _ADLog();
  }
  else
  {
    BOOL v3 = [NSString stringWithFormat:@"XPC connection invalidated with nil ADAttributionRequester. Lost connection from Attribution Client."];
    _ADLog();
  }
}

- (NSString)bundleID
{
  return self->_bundleID;
}

void __68__ADAttributionRequester_initWithConnection_bundleID_transactionID___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = NSString;
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v3 = [WeakRetained bundleID];
    v4 = [v2 stringWithFormat:@"XPC connection interrupted for %@. Lost connection from Attribution Client.", v3];
    _ADLog();
  }
  else
  {
    BOOL v3 = [NSString stringWithFormat:@"XPC connection interrupted with nil ADAttributionRequester. Lost connection from Attribution Client."];
    _ADLog();
  }
}

- (BOOL)_isAppTrackingAuthorized
{
  v2 = [(ADAttributionRequester *)self connection];
  BOOL v3 = v2;
  if (v2) {
    [v2 auditToken];
  }
  int v4 = TCCAccessPreflightWithAuditToken();

  return v4 == 0;
}

- (void)requestAttributionDetails:(id)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  int v4 = (void (**)(id, void *, void))a3;
  id v5 = [MEMORY[0x263F241C0] sharedInstance];
  char v6 = [v5 isAccountRestricted];

  v7 = [MEMORY[0x263F53C50] sharedConnection];
  int v8 = [v7 isBoolSettingLockedDownByRestrictions:*MEMORY[0x263F53940]];

  if ((v6 & 1) != 0 || v8)
  {
    uint64_t v23 = *MEMORY[0x263F08320];
    v12 = [MEMORY[0x263F086E0] mainBundle];
    v13 = [v12 localizedStringForKey:@"The app is not authorized for ad tracking" value:&stru_26D51D5E0 table:0];
    v24[0] = v13;
    v14 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];

    v15 = [MEMORY[0x263F087E8] errorWithDomain:@"ADClientErrorDomain" code:1 userInfo:v14];
    v16 = NSString;
    v17 = @"The app's TCC tracking status is restricted. Attribution can not be provided.";
  }
  else
  {
    if ([(ADAttributionRequester *)self _isAppTrackingAuthorized])
    {
      if (v4)
      {
        id v9 = NSString;
        id v10 = objc_msgSend(&unk_26D51E198, "AD_jsonString");
        id v11 = [v9 stringWithFormat:@"Sanitized attribution response: %@", v10];
        _ADLog();

        v4[2](v4, &unk_26D51E198, 0);
      }
      goto LABEL_11;
    }
    uint64_t v21 = *MEMORY[0x263F08320];
    id v18 = [MEMORY[0x263F086E0] mainBundle];
    id v19 = [v18 localizedStringForKey:@"The app is not authorized for ad tracking" value:&stru_26D51D5E0 table:0];
    v22 = v19;
    v14 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];

    v15 = [MEMORY[0x263F087E8] errorWithDomain:@"ADClientErrorDomain" code:1 userInfo:v14];
    v16 = NSString;
    v17 = @"The app's TCC tracking status is denied. Attribution can not be provided.";
  }
  v20 = [v16 stringWithFormat:v17];
  _ADLog();

  if (v4) {
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v15);
  }

LABEL_11:
}

- (void)beginAttributionRequest:(id)a3 reason:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __75__ADAttributionRequester_beginAttributionRequest_reason_completionHandler___block_invoke;
  v14[3] = &unk_264637D80;
  id v15 = v8;
  id v16 = v9;
  v17 = self;
  id v18 = v10;
  id v11 = v9;
  id v12 = v10;
  id v13 = v8;
  [(ADAttributionRequester *)self requestAttributionDetails:v14];
}

void __75__ADAttributionRequester_beginAttributionRequest_reason_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  char v6 = [MEMORY[0x263F24260] sharedInstance];
  [v6 removeWatchdogWithToken:*(void *)(a1 + 32)];

  uint64_t v7 = *(void *)(a1 + 56);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v10, v5);
  }
  releaseXPCTransaction();
  id v8 = +[ADAttributionService sharedInstance];
  id v9 = [*(id *)(a1 + 48) transactionToken];
  [v8 removeClientForToken:v9];
}

- (void)requestAttributionDetailsWithBlock:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [NSString stringWithFormat:@"Handling Attribution Request."];
  _ADLog();

  id v16 = @"AttributingBundleID";
  char v6 = [(ADAttributionRequester *)self bundleID];
  v17[0] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  AnalyticsSendEvent();

  if (v4)
  {
    takeXPCTransaction();
    id v8 = [MEMORY[0x263F24260] sharedInstance];
    id v9 = [v8 createNewWatchdog:@"Attribution Request in progress" withTimer:1800];

    id v10 = [MEMORY[0x263F24230] workQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __61__ADAttributionRequester_requestAttributionDetailsWithBlock___block_invoke;
    v12[3] = &unk_264637DA8;
    v12[4] = self;
    id v13 = v9;
    v14 = @"com.apple.adprivacyd Attribution Request in Progress";
    id v15 = v4;
    id v11 = v9;
    [v10 addOperationWithBlock:v12];
  }
  else
  {
    id v11 = [NSString stringWithFormat:@"ERROR: A completionHandler was not passed in on the attribution request."];
    _ADLog();
  }
}

void __61__ADAttributionRequester_requestAttributionDetailsWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __61__ADAttributionRequester_requestAttributionDetailsWithBlock___block_invoke_2;
  id v11 = &unk_264637DA8;
  v2 = *(void **)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = v2;
  id v14 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  BOOL v3 = (void (**)(void))MEMORY[0x223CA1880](&v8);
  id v4 = objc_msgSend(MEMORY[0x263F241D8], "sharedInstance", v8, v9, v10, v11, v12);
  int v5 = [v4 reconcileInProgress];

  if (v5)
  {
    char v6 = [NSString stringWithFormat:@"Attribution Request made while reconcile is in progress. Postponing."];
    _ADLog();

    uint64_t v7 = [MEMORY[0x263F241D8] sharedInstance];
    [v7 performOperationAfterReconcile:v3];
  }
  else
  {
    v3[2](v3);
  }
}

void __61__ADAttributionRequester_requestAttributionDetailsWithBlock___block_invoke_2(void *a1)
{
  v2 = [MEMORY[0x263F241D8] sharedInstance];
  BOOL v3 = [v2 activeDSIDRecord];

  if (v3)
  {
    id v4 = (void *)a1[4];
    uint64_t v5 = a1[5];
    uint64_t v6 = a1[6];
    uint64_t v7 = a1[7];
    [v4 beginAttributionRequest:v5 reason:v6 completionHandler:v7];
  }
  else
  {
    uint64_t v8 = [NSString stringWithFormat:@"No Active DSID Record. Set the DSID for the current user."];
    _ADLog();

    uint64_t v9 = [MEMORY[0x263F241D8] sharedInstance];
    id v10 = [MEMORY[0x263F241C0] sharedInstance];
    id v11 = [v10 iTunesAccountDSID];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __61__ADAttributionRequester_requestAttributionDetailsWithBlock___block_invoke_3;
    v13[3] = &unk_264637DA8;
    uint64_t v12 = (void *)a1[5];
    v13[4] = a1[4];
    id v14 = v12;
    id v15 = (id)a1[6];
    id v16 = (id)a1[7];
    [v9 setDSID:v11 completionHandler:v13];
  }
}

uint64_t __61__ADAttributionRequester_requestAttributionDetailsWithBlock___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) beginAttributionRequest:*(void *)(a1 + 40) reason:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSNumber)transactionToken
{
  return self->_transactionToken;
}

- (void)setTransactionToken:(id)a3
{
}

- (void)setBundleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_transactionToken, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end