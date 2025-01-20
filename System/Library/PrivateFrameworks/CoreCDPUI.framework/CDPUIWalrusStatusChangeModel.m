@interface CDPUIWalrusStatusChangeModel
- (BOOL)_hasLocalSecret;
- (CDPContext)authenticatedContext;
- (CDPContext)cdpContext;
- (CDPStateUIProvider)uiProvider;
- (CDPUIWalrusStatusChangeModel)initWithTargetStatus:(unint64_t)a3 statusProvider:(id)a4 statusUpdater:(id)a5;
- (CDPUIWalrusStatusChangeModel)initWithTargetStatus:(unint64_t)a3 statusProvider:(id)a4 statusUpdater:(id)a5 context:(id)a6;
- (NSString)cancelButtonText;
- (NSString)messageText;
- (NSString)primaryButtonText;
- (NSString)titleText;
- (unint64_t)targetStatus;
- (void)_checkCurrentStatus:(id)a3;
- (void)_reportUserChoice:(unint64_t)a3 error:(id)a4;
- (void)_updateUnderlyingValue:(id)a3;
- (void)setAuthenticatedContext:(id)a3;
@end

@implementation CDPUIWalrusStatusChangeModel

- (CDPUIWalrusStatusChangeModel)initWithTargetStatus:(unint64_t)a3 statusProvider:(id)a4 statusUpdater:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CDPUIWalrusStatusChangeModel;
  v11 = [(CDPUIWalrusStatusChangeModel *)&v17 init];
  v12 = v11;
  if (v11)
  {
    v11->_targetStatus = a3;
    objc_storeStrong((id *)&v11->_walrusStatusProvider, a4);
    objc_storeStrong((id *)&v12->_walrusStatusUpdater, a5);
    v13 = [MEMORY[0x263F34370] sharedInstance];
    [v13 fetchConfig];

    v14 = objc_alloc_init(CDPUIController);
    uiProvider = v12->_uiProvider;
    v12->_uiProvider = (CDPStateUIProvider *)v14;
  }
  return v12;
}

- (CDPUIWalrusStatusChangeModel)initWithTargetStatus:(unint64_t)a3 statusProvider:(id)a4 statusUpdater:(id)a5 context:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CDPUIWalrusStatusChangeModel;
  v14 = [(CDPUIWalrusStatusChangeModel *)&v19 init];
  v15 = v14;
  if (v14)
  {
    v14->_targetStatus = a3;
    objc_storeStrong((id *)&v14->_walrusStatusProvider, a4);
    objc_storeStrong((id *)&v15->_walrusStatusUpdater, a5);
    objc_storeStrong((id *)&v15->_cdpContext, a6);
    v16 = objc_alloc_init(CDPUIController);
    uiProvider = v15->_uiProvider;
    v15->_uiProvider = (CDPStateUIProvider *)v16;
  }
  return v15;
}

- (void)_checkCurrentStatus:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void (**)(void, void))v4;
  if (self->_targetStatus)
  {
    walrusStatusProvider = self->_walrusStatusProvider;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __52__CDPUIWalrusStatusChangeModel__checkCurrentStatus___block_invoke;
    v10[3] = &unk_26433DB90;
    v10[4] = self;
    id v11 = v4;
    [(CDPWalrusStatusProvider *)walrusStatusProvider combinedWalrusStatusWithCompletion:v10];
  }
  else
  {
    v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138412290;
      id v13 = v9;
      _os_log_impl(&dword_2187CF000, v7, OS_LOG_TYPE_DEFAULT, "%@: Skipping user prompt because the target status is CDPWalrusStatusUnknown.", buf, 0xCu);
    }
    v5[2](v5, 0);
  }
}

void __52__CDPUIWalrusStatusChangeModel__checkCurrentStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__CDPUIWalrusStatusChangeModel__checkCurrentStatus___block_invoke_2;
  block[3] = &unk_26433CD18;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void *__52__CDPUIWalrusStatusChangeModel__checkCurrentStatus___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 40) + 48) == [*(id *)(a1 + 32) octagonWalrusStatus]) {
    int v2 = [*(id *)(a1 + 32) mismatchDetected];
  }
  else {
    int v2 = 1;
  }
  id v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 48);
    int v7 = [*(id *)(a1 + 32) mismatchDetected];
    int v13 = 138413058;
    uint64_t v14 = v5;
    __int16 v15 = 2048;
    uint64_t v16 = v6;
    __int16 v17 = 1024;
    int v18 = v2;
    __int16 v19 = 1024;
    int v20 = v7;
    _os_log_impl(&dword_2187CF000, v3, OS_LOG_TYPE_DEFAULT, "%@: target state %ld, needs change: %{BOOL}d, mismatchDetected: %{BOOL}d", (uint8_t *)&v13, 0x22u);
  }
  if (v2)
  {
    result = *(void **)(a1 + 40);
    uint64_t v9 = result[6];
    if (v9)
    {
      if (v9 == 1)
      {
        if (![MEMORY[0x263F34400] isGuitarfishEnabled]) {
          goto LABEL_18;
        }
      }
      else
      {
        if (v9 != 2) {
          return result;
        }
        int v10 = [result _hasLocalSecret];
        int v11 = [MEMORY[0x263F34400] isGuitarfishEnabled];
        if (!v10)
        {
          if (v11 && [*(id *)(*(void *)(a1 + 40) + 24) edpState] == 2) {
            id v12 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
          }
          else {
            id v12 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
          }
          return (void *)v12();
        }
        if (!v11) {
          goto LABEL_18;
        }
      }
      if ([*(id *)(*(void *)(a1 + 40) + 24) edpState] == 2)
      {
        id v12 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
        return (void *)v12();
      }
LABEL_18:
      id v12 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
      return (void *)v12();
    }
    id v12 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    id v12 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  }
  return (void *)v12();
}

- (NSString)titleText
{
  unint64_t targetStatus = self->_targetStatus;
  if (targetStatus == 1)
  {
    uint64_t v4 = (void *)MEMORY[0x263F343B8];
    v5 = @"ADVANCED_DATA_PROTECTION_ENABLE";
  }
  else
  {
    if (targetStatus != 2)
    {
      int v11 = 0;
      goto LABEL_10;
    }
    BOOL v3 = [(CDPUIWalrusStatusChangeModel *)self _hasLocalSecret];
    uint64_t v4 = (void *)MEMORY[0x263F343B8];
    if (!v3)
    {
      uint64_t v6 = [MEMORY[0x263F343B8] builderForKey:@"ADVANCED_DATA_PROTECTION_DISABLE_NO_PASSCODE_ALERT_TITLE" inTable:@"Localizable-Walrus"];
      int v11 = [v6 localizedString];
      goto LABEL_9;
    }
    v5 = @"ADVANCED_DATA_PROTECTION_DISABLE";
  }
  uint64_t v6 = [v4 builderForKey:v5 inTable:@"Localizable-Walrus"];
  int v7 = [v6 addSecretType:1];
  id v8 = [MEMORY[0x263F343A8] sharedInstance];
  uint64_t v9 = [v8 deviceClass];
  int v10 = [v7 addDeviceClass:v9];
  int v11 = [v10 localizedString];

LABEL_9:
LABEL_10:

  return (NSString *)v11;
}

- (NSString)messageText
{
  if (self->_targetStatus == 2 && ![(CDPUIWalrusStatusChangeModel *)self _hasLocalSecret])
  {
    BOOL v3 = [MEMORY[0x263F343B8] builderForKey:@"ADVANCED_DATA_PROTECTION_DISABLE_NO_PASSCODE_ALERT_MESSAGE" inTable:@"Localizable-Walrus"];
    int v2 = [v3 localizedString];
  }
  else
  {
    int v2 = 0;
  }

  return (NSString *)v2;
}

- (NSString)primaryButtonText
{
  if (self->_targetStatus == 2 && ![(CDPUIWalrusStatusChangeModel *)self _hasLocalSecret])
  {
    BOOL v3 = [MEMORY[0x263F343B8] builderForKey:@"ADVANCED_DATA_PROTECTION_DISABLE_NO_PASSCODE_ALERT_PRIMARY_BUTTON" inTable:@"Localizable-Walrus"];
    int v2 = [v3 localizedString];
  }
  else
  {
    int v2 = 0;
  }

  return (NSString *)v2;
}

- (NSString)cancelButtonText
{
  int v2 = [MEMORY[0x263F343B8] builderForKey:@"GENERIC_CANCEL_BUTTON"];
  BOOL v3 = [v2 localizedString];

  return (NSString *)v3;
}

- (void)_updateUnderlyingValue:(id)a3
{
  walrusStatusUpdater = self->_walrusStatusUpdater;
  unint64_t targetStatus = self->_targetStatus;
  id v6 = a3;
  id v7 = [(CDPUIWalrusStatusChangeModel *)self authenticatedContext];
  [(CDPWalrusStatusUpdater *)walrusStatusUpdater updateWalrusStatus:targetStatus authenticatedContext:v7 completion:v6];
}

- (BOOL)_hasLocalSecret
{
  int v2 = [MEMORY[0x263F343A8] sharedInstance];
  char v3 = [v2 hasLocalSecret];

  return v3;
}

- (void)_reportUserChoice:(unint64_t)a3 error:(id)a4
{
  v5 = (void *)MEMORY[0x263F202A8];
  cdpContext = self->_cdpContext;
  uint64_t v7 = *MEMORY[0x263F347D0];
  uint64_t v8 = *MEMORY[0x263F34830];
  id v9 = a4;
  int v10 = [v5 analyticsEventWithContext:cdpContext eventName:v7 category:v8];
  id v13 = v10;
  if (a3 - 1 >= 2) {
    uint64_t v11 = MEMORY[0x263EFFA80];
  }
  else {
    uint64_t v11 = MEMORY[0x263EFFA88];
  }
  [v10 setObject:v11 forKeyedSubscript:*MEMORY[0x263F20330]];
  [v13 populateUnderlyingErrorsStartingWithRootError:v9];

  id v12 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v12 sendEvent:v13];
}

- (CDPContext)cdpContext
{
  return self->_cdpContext;
}

- (CDPContext)authenticatedContext
{
  return self->authenticatedContext;
}

- (void)setAuthenticatedContext:(id)a3
{
}

- (CDPStateUIProvider)uiProvider
{
  return self->_uiProvider;
}

- (unint64_t)targetStatus
{
  return self->_targetStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->authenticatedContext, 0);
  objc_storeStrong((id *)&self->_uiProvider, 0);
  objc_storeStrong((id *)&self->_cdpContext, 0);
  objc_storeStrong((id *)&self->_walrusStatusUpdater, 0);

  objc_storeStrong((id *)&self->_walrusStatusProvider, 0);
}

@end