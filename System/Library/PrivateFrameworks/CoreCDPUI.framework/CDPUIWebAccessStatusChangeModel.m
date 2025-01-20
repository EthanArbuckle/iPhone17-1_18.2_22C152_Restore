@interface CDPUIWebAccessStatusChangeModel
- (CDPUIWebAccessStatusChangeModel)initWithTargetStatus:(unint64_t)a3 statusProvider:(id)a4 statusUpdater:(id)a5 walrusStatusProvider:(id)a6;
- (NSString)cancelButtonText;
- (NSString)messageText;
- (NSString)primaryButtonText;
- (NSString)titleText;
- (unint64_t)targetStatus;
- (void)_checkCurrentStatus:(id)a3;
- (void)_updateUnderlyingValue:(id)a3;
@end

@implementation CDPUIWebAccessStatusChangeModel

- (CDPUIWebAccessStatusChangeModel)initWithTargetStatus:(unint64_t)a3 statusProvider:(id)a4 statusUpdater:(id)a5 walrusStatusProvider:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CDPUIWebAccessStatusChangeModel;
  v14 = [(CDPUIWebAccessStatusChangeModel *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_targetStatus = a3;
    objc_storeStrong((id *)&v14->_webAccessStatusProvider, a4);
    objc_storeStrong((id *)&v15->_webAccessStatusUpdater, a5);
    objc_storeStrong((id *)&v15->_walrusStatusProvider, a6);
  }

  return v15;
}

- (void)_checkCurrentStatus:(id)a3
{
  id v4 = a3;
  if (self->_targetStatus)
  {
    v5 = dispatch_group_create();
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    v22[3] = 0;
    dispatch_group_enter(v5);
    webAccessStatusProvider = self->_webAccessStatusProvider;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __55__CDPUIWebAccessStatusChangeModel__checkCurrentStatus___block_invoke;
    v19[3] = &unk_26433DAA8;
    v21 = v22;
    v7 = v5;
    v20 = v7;
    [(CDPWebAccessStatusProvider *)webAccessStatusProvider webAccessStatusWithCompletion:v19];
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    v18[3] = 0;
    dispatch_group_enter(v7);
    walrusStatusProvider = self->_walrusStatusProvider;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __55__CDPUIWebAccessStatusChangeModel__checkCurrentStatus___block_invoke_2;
    v15[3] = &unk_26433DAA8;
    objc_super v17 = v18;
    v9 = v7;
    v16 = v9;
    [(CDPWalrusStatusProvider *)walrusStatusProvider walrusStatusWithCompletion:v15];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __55__CDPUIWebAccessStatusChangeModel__checkCurrentStatus___block_invoke_3;
    v11[3] = &unk_26433DAD0;
    v11[4] = self;
    id v13 = v22;
    id v12 = v4;
    v14 = v18;
    dispatch_group_notify(v9, MEMORY[0x263EF83A0], v11);

    _Block_object_dispose(v18, 8);
    _Block_object_dispose(v22, 8);
  }
  else
  {
    v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CDPUIWebAccessStatusChangeModel _checkCurrentStatus:]((uint64_t)self, v10);
    }

    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __55__CDPUIWebAccessStatusChangeModel__checkCurrentStatus___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __55__CDPUIWebAccessStatusChangeModel__checkCurrentStatus___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void *__55__CDPUIWebAccessStatusChangeModel__checkCurrentStatus___block_invoke_3(void *result)
{
  uint64_t v1 = *(void *)(result[4] + 32);
  if (v1 == *(void *)(*(void *)(result[6] + 8) + 24)) {
    return (void *)(*(uint64_t (**)(void))(result[5] + 16))();
  }
  BOOL v2 = !v1 || v1 == 2;
  if (v2 || v1 == 1) {
    return (void *)(*(uint64_t (**)(void))(result[5] + 16))();
  }
  return result;
}

- (NSString)titleText
{
  if (self->_targetStatus == 1)
  {
    BOOL v2 = [MEMORY[0x263F343B8] builderForKey:@"ENABLE_WEB_ACCESS_PROMPT_TITLE" inTable:@"Localizable-Walrus"];
    v3 = [v2 localizedString];
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)messageText
{
  if (self->_targetStatus == 1)
  {
    BOOL v2 = [MEMORY[0x263F343B8] builderForKey:@"ENABLE_WEB_ACCESS_PROMPT_MESSAGE" inTable:@"Localizable-Walrus"];
    v3 = [v2 localizedString];
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)primaryButtonText
{
  if (self->_targetStatus == 1)
  {
    BOOL v2 = [MEMORY[0x263F343B8] builderForKey:@"ENABLE_WEB_ACCESS_PROMPT_PRIMARY_BUTTON" inTable:@"Localizable-Walrus"];
    v3 = [v2 localizedString];
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)cancelButtonText
{
  BOOL v2 = [MEMORY[0x263F343B8] builderForKey:@"GENERIC_CANCEL_BUTTON"];
  v3 = [v2 localizedString];

  return (NSString *)v3;
}

- (void)_updateUnderlyingValue:(id)a3
{
}

- (unint64_t)targetStatus
{
  return self->_targetStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walrusStatusProvider, 0);
  objc_storeStrong((id *)&self->_webAccessStatusUpdater, 0);

  objc_storeStrong((id *)&self->_webAccessStatusProvider, 0);
}

- (void)_checkCurrentStatus:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2187CF000, a2, OS_LOG_TYPE_ERROR, "Skipping user prompt for %@ because the target status is CDPWebAccessStatusUnknown.", (uint8_t *)&v2, 0xCu);
}

@end