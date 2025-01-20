@interface ADAttribution
+ (id)sharedInstance;
- (ADAttribution)init;
- (BOOL)hasCompletedResponse;
- (unsigned)numRetries;
- (void)initiateRequestOnConnection:(id)a3 withBlock:(id)a4;
- (void)requestAttributionDetailsWithBlock:(id)a3;
- (void)setHasCompletedResponse:(BOOL)a3;
- (void)setNumRetries:(unsigned __int8)a3;
- (void)setServerToTest:(int64_t)a3;
- (void)setStocksAdEnabled:(BOOL)a3;
@end

@implementation ADAttribution

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance__sharedInstance;

  return v2;
}

- (void)setStocksAdEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = (id)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.ap.adprivacyd.attribution" options:4096];
  v4 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CF77C78];
  [v6 setRemoteObjectInterface:v4];

  [v6 resume];
  v5 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_25];
  [v5 setStocksAdEnabled:v3];

  [v6 invalidate];
}

- (void)setServerToTest:(int64_t)a3
{
  id v6 = (id)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.ap.adprivacyd.attribution" options:4096];
  v4 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CF77C78];
  [v6 setRemoteObjectInterface:v4];

  [v6 resume];
  if ((unint64_t)(a3 - 1) >= 5) {
    a3 = 0;
  }
  v5 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_30];
  [v5 setServerToTest:a3];

  [v6 invalidate];
}

uint64_t __31__ADAttribution_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance = objc_alloc_init(ADAttribution);

  return MEMORY[0x270F9A758]();
}

- (ADAttribution)init
{
  v3.receiver = self;
  v3.super_class = (Class)ADAttribution;
  result = [(ADAttribution *)&v3 init];
  if (result) {
    *(_WORD *)&result->_hasCompletedResponse = 0;
  }
  return result;
}

- (void)initiateRequestOnConnection:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 remoteObjectProxy];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__ADAttribution_initiateRequestOnConnection_withBlock___block_invoke;
  v11[3] = &unk_2644AEEC8;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [v8 requestAttributionDetailsWithBlock:v11];
}

void __55__ADAttribution_initiateRequestOnConnection_withBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  }
  [*(id *)(a1 + 32) setHasCompletedResponse:1];
  objc_sync_exit(v6);

  [*(id *)(a1 + 40) invalidate];
}

- (void)requestAttributionDetailsWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.ap.adprivacyd.attribution" options:4096];
  id v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CF77C78];
  [v5 setRemoteObjectInterface:v6];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__ADAttribution_requestAttributionDetailsWithBlock___block_invoke;
  v10[3] = &unk_2644AEEF0;
  v10[4] = self;
  id v11 = v5;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  id v9 = (void *)MEMORY[0x223C29D60](v10);
  [v8 setInvalidationHandler:v9];
  [v8 setInterruptionHandler:v9];
  [v8 resume];
  [(ADAttribution *)self initiateRequestOnConnection:v8 withBlock:v7];
}

void __52__ADAttribution_requestAttributionDetailsWithBlock___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  if (([*(id *)(a1 + 32) hasCompletedResponse] & 1) == 0)
  {
    unsigned int v3 = [*(id *)(a1 + 32) numRetries];
    if (v3 > 2)
    {
      if (*(void *)(a1 + 48))
      {
        uint64_t v9 = *MEMORY[0x263F08320];
        id v4 = [MEMORY[0x263F086E0] mainBundle];
        id v5 = [v4 localizedStringForKey:@"A serious error occurred. No data was returned from the Attribution Servers." value:&stru_26CF760D8 table:0];
        v10[0] = v5;
        id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];

        uint64_t v7 = *(void *)(a1 + 48);
        id v8 = [MEMORY[0x263F087E8] errorWithDomain:@"ADClientErrorDomain" code:2 userInfo:v6];
        (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
      }
    }
    else
    {
      [*(id *)(a1 + 32) setNumRetries:(v3 + 1)];
      [*(id *)(a1 + 32) initiateRequestOnConnection:*(void *)(a1 + 40) withBlock:*(void *)(a1 + 48)];
    }
  }
  objc_sync_exit(v2);
}

void __36__ADAttribution_setStocksAdEnabled___block_invoke(uint64_t a1, uint64_t a2)
{
}

void __33__ADAttribution_setServerToTest___block_invoke(uint64_t a1, uint64_t a2)
{
}

- (BOOL)hasCompletedResponse
{
  return self->_hasCompletedResponse;
}

- (void)setHasCompletedResponse:(BOOL)a3
{
  self->_hasCompletedResponse = a3;
}

- (unsigned)numRetries
{
  return self->_numRetries;
}

- (void)setNumRetries:(unsigned __int8)a3
{
  self->_numRetries = a3;
}

@end