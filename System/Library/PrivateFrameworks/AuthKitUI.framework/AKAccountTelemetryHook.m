@interface AKAccountTelemetryHook
- (ACAccount)account;
- (AKAccountTelemetryHook)initWithAccount:(id)a3;
- (AKAccountTelemetryHook)initWithAltDSID:(id)a3;
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (void)_setAccountAccessTelemetryOptIn:(id)a3;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setAccount:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation AKAccountTelemetryHook

- (AKAccountTelemetryHook)initWithAltDSID:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AKAccountTelemetryHook;
  v5 = [(AKAccountTelemetryHook *)&v10 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F4EF40] sharedInstance];
    uint64_t v7 = [v6 authKitAccountWithAltDSID:v4 error:0];
    account = v5->_account;
    v5->_account = (ACAccount *)v7;
  }
  return v5;
}

- (AKAccountTelemetryHook)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKAccountTelemetryHook;
  v6 = [(AKAccountTelemetryHook *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
}

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"account:telemetry"];

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  v3 = [a3 clientInfo];
  char v4 = [v3 objectForKey:@"action"];

  LOBYTE(v3) = [v4 isEqualToString:@"account:telemetry"];
  return (char)v3;
}

- (void)_setAccountAccessTelemetryOptIn:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(25, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__AKAccountTelemetryHook__setAccountAccessTelemetryOptIn___block_invoke;
  v7[3] = &unk_1E648F2A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __58__AKAccountTelemetryHook__setAccountAccessTelemetryOptIn___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F4EF40] sharedInstance];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
  id v5 = 0;
  [v2 setAccountAccessTelemetryOptIn:1 forAccount:v3 error:&v5];
  id v4 = v5;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (RUIServerHookDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RUIServerHookDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end