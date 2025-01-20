@interface AEAssessmentModeRestrictionEnforcementSession
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)initWithRestrictionEnforcer:(void *)a3 machServiceName:;
- (void)dealloc;
- (void)invalidate;
@end

@implementation AEAssessmentModeRestrictionEnforcementSession

- (void)dealloc
{
  [(AEAssessmentModeRestrictionEnforcementSession *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AEAssessmentModeRestrictionEnforcementSession;
  [(AEAssessmentModeRestrictionEnforcementSession *)&v3 dealloc];
}

- (id)initWithRestrictionEnforcer:(void *)a3 machServiceName:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)AEAssessmentModeRestrictionEnforcementSession;
    v7 = (id *)objc_msgSendSuper2(&v11, sel_init);
    a1 = v7;
    if (v7)
    {
      objc_storeStrong(v7 + 1, a3);
      objc_storeWeak(a1 + 2, v5);
      uint64_t v8 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:v6];
      id v9 = a1[3];
      a1[3] = (id)v8;

      [a1[3] setDelegate:a1];
      [a1[3] activate];
    }
  }

  return a1;
}

- (void)invalidate
{
  if (self) {
    self = (AEAssessmentModeRestrictionEnforcementSession *)self->_xpcListener;
  }
  [(AEAssessmentModeRestrictionEnforcementSession *)self invalidate];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 valueForEntitlement:@"com.apple.private.automatic-assessment-configuration.restrictor"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v8 BOOLValue] & 1) == 0)
  {
    [v7 invalidate];
    BOOL v10 = 0;
  }
  else
  {
    objc_initWeak(&location, v7);
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    v14 = __84__AEAssessmentModeRestrictionEnforcementSession_listener_shouldAcceptNewConnection___block_invoke;
    v15 = &unk_264EA37A8;
    objc_copyWeak(&v16, &location);
    [v7 setInterruptionHandler:&v12];
    if (self) {
      self = (AEAssessmentModeRestrictionEnforcementSession *)objc_loadWeakRetained((id *)&self->_enforcer);
    }
    objc_msgSend(v7, "setExportedObject:", self, v12, v13, v14, v15);

    id v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F1455A8];
    [v7 setExportedInterface:v9];

    [v7 activate];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    BOOL v10 = 1;
  }

  return v10;
}

void __84__AEAssessmentModeRestrictionEnforcementSession_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  v2 = AECoreLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __84__AEAssessmentModeRestrictionEnforcementSession_listener_shouldAcceptNewConnection___block_invoke_cold_1(v2);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_destroyWeak((id *)&self->_enforcer);
  objc_storeStrong((id *)&self->_machServiceName, 0);
}

void __84__AEAssessmentModeRestrictionEnforcementSession_listener_shouldAcceptNewConnection___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23D508000, log, OS_LOG_TYPE_ERROR, "Assessment Mode restriction enforcment session connection interrupted", v1, 2u);
}

@end