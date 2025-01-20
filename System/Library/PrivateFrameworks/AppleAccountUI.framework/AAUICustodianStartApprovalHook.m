@interface AAUICustodianStartApprovalHook
- (AAUICustodianStartApprovalHook)initWithTelemetryFlowID:(id)a3;
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (void)_startApprovalWithServerAttributes:(id)a3 objectModel:(id)a4 completion:(id)a5;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation AAUICustodianStartApprovalHook

- (AAUICustodianStartApprovalHook)initWithTelemetryFlowID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUICustodianStartApprovalHook;
  v6 = [(AAUICustodianStartApprovalHook *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_telemetryFlowID, a3);
  }

  return v7;
}

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"custodian:startApproval"];

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  v3 = [a3 clientInfo];
  char v4 = [v3 objectForKey:@"action"];
  char v5 = [v4 isEqualToString:@"custodian:startApproval"];

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 clientInfo];
  [(AAUICustodianStartApprovalHook *)self _startApprovalWithServerAttributes:v8 objectModel:v7 completion:v6];
}

- (void)_startApprovalWithServerAttributes:(id)a3 objectModel:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = [v10 objectForKeyedSubscript:@"sessionId"];
  v12 = [v10 objectForKeyedSubscript:@"resetEligible"];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v14 = [WeakRetained presentationContextForHook:self];

  v15 = +[AAUICustodianRecoveryApprovalController approvalControllerWithPresenter:v14 recoverySessionID:v11 telemetryFlowID:self->_telemetryFlowID];
  [v15 setIsResetEligible:v12 != 0];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __92__AAUICustodianStartApprovalHook__startApprovalWithServerAttributes_objectModel_completion___block_invoke;
  v18[3] = &unk_263F94708;
  id v19 = v8;
  id v20 = v9;
  id v16 = v8;
  id v17 = v9;
  [v15 validateRecoveryCodeWithCompletion:v18];
}

void __92__AAUICustodianStartApprovalHook__startApprovalWithServerAttributes_objectModel_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  id v6 = [v14 custodianUUID];

  if (v5 || !v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) serverInfo];
    id v8 = (void *)[v7 mutableCopy];

    id v9 = [v14 custodianUUID];
    id v10 = [v9 UUIDString];
    [v8 setObject:v10 forKeyedSubscript:@"custodianUUID"];

    v11 = [v14 custodianRecoveryToken];
    [v8 setObject:v11 forKeyedSubscript:@"custodianRecoveryToken"];

    v12 = [v14 recoverySessionID];
    [v8 setObject:v12 forKeyedSubscript:@"sessionId"];

    v13 = (void *)[v8 copy];
    [*(id *)(a1 + 32) setServerInfo:v13];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (RUIServerHookDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RUIServerHookDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_telemetryFlowID, 0);
}

@end