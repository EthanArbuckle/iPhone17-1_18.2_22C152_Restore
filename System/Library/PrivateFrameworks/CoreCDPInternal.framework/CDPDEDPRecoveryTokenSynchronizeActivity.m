@interface CDPDEDPRecoveryTokenSynchronizeActivity
+ (id)sharedActivity;
- (void)_synchronizeTokenWithCompletion:(id)a3;
- (void)synchronize;
@end

@implementation CDPDEDPRecoveryTokenSynchronizeActivity

+ (id)sharedActivity
{
  if (sharedActivity_onceToken != -1) {
    dispatch_once(&sharedActivity_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)sharedActivity_sharedActivity;
  return v2;
}

uint64_t __57__CDPDEDPRecoveryTokenSynchronizeActivity_sharedActivity__block_invoke()
{
  sharedActivity_sharedActivity = objc_alloc_init(CDPDEDPRecoveryTokenSynchronizeActivity);
  return MEMORY[0x270F9A758]();
}

- (void)synchronize
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F34400] isGuitarfishEnabled])
  {
    v3 = _CDPLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "com.apple.cdp.dbr.tokenSync";
      _os_log_impl(&dword_218640000, v3, OS_LOG_TYPE_DEFAULT, "CDPDEDPRecoveryTokenSynchronizeActivity: Registering for XPC activity: %s...", buf, 0xCu);
    }

    v4 = (void *)*MEMORY[0x263EF8188];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __54__CDPDEDPRecoveryTokenSynchronizeActivity_synchronize__block_invoke;
    handler[3] = &unk_264330700;
    handler[4] = self;
    xpc_activity_register("com.apple.cdp.dbr.tokenSync", v4, handler);
  }
}

void __54__CDPDEDPRecoveryTokenSynchronizeActivity_synchronize__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  v5 = _CDPLogSystem();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (state != 2)
  {
    if (v6)
    {
      v9 = [NSNumber numberWithLong:state];
      *(_DWORD *)buf = 136315394;
      v14 = "com.apple.cdp.dbr.tokenSync";
      __int16 v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "CDPDEDPRecoveryTokenSynchronizeActivity: XPC activity %s registration complete. State: %@.", buf, 0x16u);
    }
    goto LABEL_8;
  }
  if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "CDPDEDPRecoveryTokenSynchronizeActivity: Running EDP Token Synchronizer XPC Activity...", buf, 2u);
  }

  if (xpc_activity_set_state(v3, 4))
  {
    v7 = (void *)os_transaction_create();
    uint64_t v8 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __54__CDPDEDPRecoveryTokenSynchronizeActivity_synchronize__block_invoke_18;
    v10[3] = &unk_264330800;
    v11 = v3;
    id v12 = v7;
    v5 = v7;
    [v8 _synchronizeTokenWithCompletion:v10];

LABEL_8:
  }
}

void __54__CDPDEDPRecoveryTokenSynchronizeActivity_synchronize__block_invoke_18(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5);
  BOOL v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "CDPDEDPRecoveryTokenSynchronizeActivity: EDP Token Sync Activity uploaded token: %{BOOL}d. Error: %@", (uint8_t *)v7, 0x12u);
  }
}

- (void)_synchronizeTokenWithCompletion:(id)a3
{
  v3 = (void *)MEMORY[0x263F34350];
  id v4 = a3;
  id v9 = [v3 contextForPrimaryAccount];
  id v5 = objc_alloc_init(CDPDAuthProxyImpl);
  id v6 = objc_alloc_init(MEMORY[0x263F343D0]);
  v7 = [[CDPDPCSController alloc] initWithContext:v9 pcsProxy:v6];
  __int16 v8 = [[CDPDEDPRecoveryController alloc] initWithContext:v9 uiProvider:0 authProvider:v5 pcsController:v7];
  [(CDPDEDPRecoveryController *)v8 uploadEDPRecoveryTokenForReason:4 completion:v4];
}

@end