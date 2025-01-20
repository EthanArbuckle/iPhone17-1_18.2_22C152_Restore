@interface AAUIDeviceToDeviceEncryptionHook
- (AAUIDeviceToDeviceEncryptionHook)initWithAltDSID:(id)a3 upgradeContext:(id)a4;
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (NSString)altDSID;
- (NSString)context;
- (RUIServerHookDelegate)delegate;
- (void)_performHSAUpgradeWithAttributes:(id)a3 completion:(id)a4;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setAltDSID:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation AAUIDeviceToDeviceEncryptionHook

- (AAUIDeviceToDeviceEncryptionHook)initWithAltDSID:(id)a3 upgradeContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AAUIDeviceToDeviceEncryptionHook;
  v9 = [(AAUIDeviceToDeviceEncryptionHook *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_altDSID, a3);
    objc_storeStrong((id *)&v10->_context, a4);
  }

  return v10;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 clientInfo];
  [(AAUIDeviceToDeviceEncryptionHook *)self _performHSAUpgradeWithAttributes:v7 completion:v6];
}

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"cdp:upgrade"];

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char v4 = [v3 clientInfo];

  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F63818]];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  char v7 = [v6 isEqualToString:@"cdp:upgrade"];
  return v7;
}

- (void)_performHSAUpgradeWithAttributes:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    id v20 = v6;
    _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "Starting HSA2 upgrade with attributes %@", (uint8_t *)&v19, 0xCu);
  }

  id v9 = objc_alloc(MEMORY[0x263F34A18]);
  v10 = [(AAUIDeviceToDeviceEncryptionHook *)self altDSID];
  v11 = (void *)[v9 initWithAltDSID:v10];

  [v11 setDeviceToDeviceEncryptionUpgradeUIStyle:0];
  objc_opt_class();
  id v12 = [v6 objectForKeyedSubscript:@"featureName"];
  id v13 = 0;
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }

  if (v13) {
    [v11 setFeatureName:v13];
  }
  objc_opt_class();
  id v14 = [v6 objectForKeyedSubscript:@"upgradeType"];
  if (objc_opt_isKindOfClass()) {
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }

  objc_msgSend(v11, "setDeviceToDeviceEncryptionUpgradeType:", objc_msgSend(v15, "isEqualToString:", @"2FA"));
  v16 = [(AAUIDeviceToDeviceEncryptionHook *)self delegate];
  v17 = [v16 presentationContextForHook:self];
  [v11 setPresentingViewController:v17];

  v18 = (void *)[objc_alloc(MEMORY[0x263F34A20]) initWithContext:v11];
  [v18 performDeviceToDeviceEncryptionStateRepairWithCompletion:v7];
}

- (RUIServerHookDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (RUIServerHookDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end