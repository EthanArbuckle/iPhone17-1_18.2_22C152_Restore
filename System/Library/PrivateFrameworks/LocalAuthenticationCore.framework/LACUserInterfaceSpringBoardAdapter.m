@interface LACUserInterfaceSpringBoardAdapter
+ (id)_targetPredicateWithAuditTokenData:(id)a3;
+ (id)_targetPredicateWithLSApplicationInfoData:(id)a3;
+ (id)activationContextWithAuditToken:(id)a3 isAuditTokenApplicationIdentity:(BOOL)a4 isForSiri:(BOOL)a5;
- (LACUserInterfaceSpringBoardAdapter)initWithBundleId:(id)a3 configurationId:(id)a4;
- (id)_activationContextForRequest:(id)a3;
- (void)_finishWithError:(id)a3;
- (void)_processRequest:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)terminateWithReason:(id)a3;
@end

@implementation LACUserInterfaceSpringBoardAdapter

- (LACUserInterfaceSpringBoardAdapter)initWithBundleId:(id)a3 configurationId:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LACUserInterfaceSpringBoardAdapter;
  v9 = [(LACUserInterfaceSpringBoardAdapter *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleId, a3);
    objc_storeStrong((id *)&v10->_configurationId, a4);
  }

  return v10;
}

- (void)dealloc
{
  v3 = [NSString stringWithFormat:@"%@ instance was deallocated", self];
  v4 = +[LACError errorWithCode:-1000 debugDescription:v3];
  [(LACUserInterfaceSpringBoardAdapter *)self _finishWithError:v4];

  if ([(SBSRemoteAlertHandle *)self->_alertHandle isValid]) {
    [(SBSRemoteAlertHandle *)self->_alertHandle invalidate];
  }

  v5.receiver = self;
  v5.super_class = (Class)LACUserInterfaceSpringBoardAdapter;
  [(LACUserInterfaceSpringBoardAdapter *)&v5 dealloc];
}

- (void)terminateWithReason:(id)a3
{
  id v4 = a3;
  objc_super v5 = LACLogUI();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[LACUserInterfaceSpringBoardAdapter terminateWithReason:]();
  }

  [(SBSRemoteAlertHandle *)self->_alertHandle invalidate];
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = (SBSRemoteAlertHandle *)a3;
  objc_super v5 = LACLogUI();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[LACUserInterfaceSpringBoardAdapter remoteAlertHandleDidActivate:]";
    _os_log_impl(&dword_254F14000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  if (self->_alertHandle != v4)
  {
    v6 = LACLogUI();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[LACUserInterfaceSpringBoardAdapter remoteAlertHandleDidActivate:]();
    }
  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = (SBSRemoteAlertHandle *)a3;
  objc_super v5 = LACLogUI();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[LACUserInterfaceSpringBoardAdapter remoteAlertHandleDidDeactivate:]";
    _os_log_impl(&dword_254F14000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  if (self->_alertHandle == v4)
  {
    [(LACUserInterfaceSpringBoardAdapter *)self _finishWithError:0];
  }
  else
  {
    v6 = LACLogUI();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[LACUserInterfaceSpringBoardAdapter remoteAlertHandleDidActivate:]();
    }
  }
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  objc_super v5 = (SBSRemoteAlertHandle *)a3;
  v6 = LACLogUI();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[LACUserInterfaceSpringBoardAdapter remoteAlertHandle:didInvalidateWithError:]";
    _os_log_impl(&dword_254F14000, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  if (self->_alertHandle == v5)
  {
    [(LACUserInterfaceSpringBoardAdapter *)self _finishWithError:0];
  }
  else
  {
    int v7 = LACLogUI();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[LACUserInterfaceSpringBoardAdapter remoteAlertHandleDidActivate:]();
    }
  }
}

+ (id)activationContextWithAuditToken:(id)a3 isAuditTokenApplicationIdentity:(BOOL)a4 isForSiri:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  uint64_t v9 = objc_opt_new();
  [v9 setActivatingForSiri:v5];
  if (v8)
  {
    if (a4) {
      [a1 _targetPredicateWithLSApplicationInfoData:v8];
    }
    else {
    uint64_t v10 = [a1 _targetPredicateWithAuditTokenData:v8];
    }
    v11 = (void *)[objc_alloc(MEMORY[0x263F79430]) initWithTargetPredicate:v10];
    [v11 setShouldDismissOnUILock:1];
    if (objc_opt_class()) {
      BOOL v12 = +[LACMobileGestalt isIdiomPad];
    }
    else {
      BOOL v12 = 0;
    }
    [v11 setRequiresFullscreenPresentation:v12];
    [v9 setPresentationTarget:v11];
  }
  return v9;
}

+ (id)_targetPredicateWithAuditTokenData:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x263F08D40], "valueWithBytes:objCType:", objc_msgSend(objc_retainAutorelease(a3), "bytes"), "{?=[8I]}");
  id v4 = v3;
  if (v3)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    [v3 getValue:&v10 size:32];
    v9[0] = v10;
    v9[1] = v11;
    BOOL v5 = [MEMORY[0x263F29BE8] tokenFromAuditToken:v9];
    v6 = [MEMORY[0x263F29CC0] processHandleForAuditToken:v5];
    int v7 = [MEMORY[0x263F79448] predicateForProcess:v6];
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

+ (id)_targetPredicateWithLSApplicationInfoData:(id)a3
{
  v3 = (void *)MEMORY[0x263F08928];
  id v4 = a3;
  id v10 = 0;
  BOOL v5 = [v3 unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v10];

  id v6 = v10;
  if (v5)
  {
    int v7 = [MEMORY[0x263F79448] predicateForLaunchingApplicationIdentity:v5];
  }
  else
  {
    id v8 = LACLogUI();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[LACUserInterfaceSpringBoardAdapter _targetPredicateWithLSApplicationInfoData:]();
    }

    int v7 = 0;
  }

  return v7;
}

- (id)_activationContextForRequest:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_class();
  BOOL v5 = [v3 clientAuditTokenData];
  uint64_t v6 = [v3 isAuditTokenApplicationIdentity];
  uint64_t v7 = [v3 isForSiri];

  id v8 = [v4 activationContextWithAuditToken:v5 isAuditTokenApplicationIdentity:v6 isForSiri:v7];

  return v8;
}

- (void)_processRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  if (self->_handler)
  {
    uint64_t v7 = [NSString stringWithFormat:@"%@ instance is already in use", self];
    id v8 = +[LACError errorWithCode:-1000 debugDescription:v7];
    [(LACUserInterfaceSpringBoardAdapter *)self _finishWithError:v8];
  }
  else
  {
    uint64_t v9 = _Block_copy(a4);
    id handler = self->_handler;
    self->_id handler = v9;

    uint64_t v7 = [MEMORY[0x263F64590] identityForApplicationJobLabel:self->_bundleId];
    id v8 = (void *)[objc_alloc(MEMORY[0x263F79418]) initWithSceneProvidingProcess:v7 configurationIdentifier:self->_configurationId];
    id v11 = objc_alloc_init(MEMORY[0x263F79400]);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __65__LACUserInterfaceSpringBoardAdapter__processRequest_completion___block_invoke;
    v17[3] = &unk_2653B6AA0;
    id v12 = v6;
    id v18 = v12;
    v13 = __65__LACUserInterfaceSpringBoardAdapter__processRequest_completion___block_invoke((uint64_t)v17);
    [v11 setUserInfo:v13];

    v14 = [(LACUserInterfaceSpringBoardAdapter *)self _activationContextForRequest:v12];
    v15 = (void *)[MEMORY[0x263F79420] newHandleWithDefinition:v8 configurationContext:v11];
    if (v15)
    {
      objc_storeStrong((id *)&self->_alertHandle, v15);
      [(SBSRemoteAlertHandle *)self->_alertHandle registerObserver:self];
      [(SBSRemoteAlertHandle *)self->_alertHandle activateWithContext:v14];
    }
    else
    {
      v16 = +[LACError errorWithCode:-4 debugDescription:@"Could not start remote alert"];
      [(LACUserInterfaceSpringBoardAdapter *)self _finishWithError:v16];
    }
  }
}

id __65__LACUserInterfaceSpringBoardAdapter__processRequest_completion___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(LACUserInterfaceRequestCoder);
  id v3 = [(LACUserInterfaceRequestCoder *)v2 encode:*(void *)(a1 + 32)];

  return v3;
}

- (void)_finishWithError:(id)a3
{
  id v4 = a3;
  id handler = self->_handler;
  if (handler)
  {
    id v6 = (void (**)(void, void))[handler copy];
    id v7 = self->_handler;
    self->_id handler = 0;

    ((void (**)(void, id))v6)[2](v6, v4);
  }
  else
  {
    id v8 = LACLogDTOSensor();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[LACUserInterfaceSpringBoardAdapter _finishWithError:]();
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_alertHandle, 0);
  objc_storeStrong((id *)&self->_configurationId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (void)terminateWithReason:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_254F14000, v0, v1, "Terminating user interface with reason: '%{public}@'", v2, v3, v4, v5, v6);
}

- (void)remoteAlertHandleDidActivate:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_254F14000, v0, v1, "Ignoring activation callback from unknown handle: %@", v2, v3, v4, v5, v6);
}

+ (void)_targetPredicateWithLSApplicationInfoData:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_254F14000, v0, v1, "Failed to decode LSApplicationIdentity: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_finishWithError:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_2();
  _os_log_debug_impl(&dword_254F14000, v0, OS_LOG_TYPE_DEBUG, "Ignoring redundant finish request (%{public}@)", v1, 0xCu);
}

@end