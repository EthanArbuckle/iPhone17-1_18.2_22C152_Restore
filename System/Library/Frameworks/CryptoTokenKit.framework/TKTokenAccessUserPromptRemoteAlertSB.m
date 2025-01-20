@interface TKTokenAccessUserPromptRemoteAlertSB
+ (BOOL)isAvailable;
+ (void)isAvailable;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (int64_t)preflightStatus;
- (int64_t)promptUserToEvaluateRequest:(id)a3 error:(id *)a4;
- (void)registerTokenAccessRequestCorrelationID:(id)a3 access:(int64_t)a4 reply:(id)a5;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
@end

@implementation TKTokenAccessUserPromptRemoteAlertSB

+ (BOOL)isAvailable
{
  if (getBSAuditTokenClass() && getBSProcessHandleClass())
  {
    if (getSBSRemoteAlertConfigurationContextClass()
      && getSBSRemoteAlertDefinitionClass()
      && getSBSRemoteAlertHandleClass()
      && getSBSRemoteAlertPresentationTargetClass()
      && getSBSRemoteAlertActivationContextClass())
    {
      return 1;
    }
    v3 = TK_LOG_user_prompt();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      +[TKTokenAccessUserPromptRemoteAlertSB isAvailable](v3);
    }
  }
  else
  {
    v3 = TK_LOG_user_prompt();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      +[TKTokenAccessUserPromptRemoteAlertSB isAvailable](v3);
    }
  }

  return 0;
}

- (int64_t)preflightStatus
{
  return 2;
}

- (int64_t)promptUserToEvaluateRequest:(id)a3 error:(id *)a4
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  self->_int64_t grantedAccess = 0;
  objc_storeStrong((id *)&self->_accessRequest, a3);
  if (self->_remoteAlertHandle)
  {
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2 object:self file:@"TKTokenAccessUserPromptRemoteAlertSB.m" lineNumber:78 description:@"Concurrent remote alerts are not yet supported"];
  }
  v7 = [MEMORY[0x1E4F29290] anonymousListener];
  [v7 setDelegate:self];
  [v7 resume];
  id v8 = objc_alloc_init((Class)getSBSRemoteAlertConfigurationContextClass());
  v9 = [v7 endpoint];
  v10 = [v9 _endpoint];
  [v8 setXpcEndpoint:v10];

  v37 = (void *)[objc_alloc((Class)getSBSRemoteAlertDefinitionClass()) initWithServiceName:@"com.apple.ctkui" viewControllerClassName:@"TKUITokenAccessPromptVC"];
  v11 = (SBSRemoteAlertHandle *)[getSBSRemoteAlertHandleClass() newHandleWithDefinition:v37 configurationContext:v8];
  remoteAlertHandle = self->_remoteAlertHandle;
  self->_remoteAlertHandle = v11;

  [(SBSRemoteAlertHandle *)self->_remoteAlertHandle registerObserver:self];
  id BSAuditTokenClass = getBSAuditTokenClass();
  v14 = [v40 clientConnection];
  v15 = v14;
  if (v14) {
    [v14 auditToken];
  }
  else {
    memset(v42, 0, sizeof(v42));
  }
  v39 = [BSAuditTokenClass tokenFromAuditToken:v42];

  v16 = [getBSProcessHandleClass() processHandleForAuditToken:v39];
  v17 = (void *)[objc_alloc((Class)getSBSRemoteAlertPresentationTargetClass()) initWithTargetProcess:v16];
  [v17 setShouldDismissOnUILock:1];
  id v18 = objc_alloc_init((Class)getSBSRemoteAlertActivationContextClass());
  [v18 setPresentationTarget:v17];
  v19 = [[TKTokenAccessUserPromptInfo alloc] initWithTokenAccessRequest:v40];
  v20 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v19 requiringSecureCoding:1 error:0];
  v45 = @"kTKTokenAccessUserPromptInfo";
  v46[0] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
  [v18 setUserInfo:v21];

  [(SBSRemoteAlertHandle *)self->_remoteAlertHandle activateWithContext:v18];
  v22 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  remoteAlertSemaphore = self->_remoteAlertSemaphore;
  self->_remoteAlertSemaphore = v22;

  objc_initWeak(&location, self);
  v24 = self->_remoteAlertSemaphore;
  dispatch_time_t v25 = dispatch_time(0, 600000000000);
  intptr_t v26 = dispatch_semaphore_wait(v24, v25);
  if (v26 && (id v27 = objc_loadWeakRetained(&location), v28 = v27 == 0, v27, v28))
  {
    int64_t v34 = 0;
  }
  else
  {
    if (a4)
    {
      int64_t grantedAccess = self->_grantedAccess;
      if (grantedAccess != 1)
      {
        if (v26) {
          v30 = @"Access request timed out";
        }
        else {
          v30 = @"Access request was cancelled";
        }
        if (grantedAccess == 2) {
          v31 = @"User denied access";
        }
        else {
          v31 = v30;
        }
        v32 = v31;
        uint64_t v43 = *MEMORY[0x1E4F28228];
        v44 = v32;
        v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
        *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-7 userInfo:v33];
      }
    }
    [v7 suspend];
    [v7 invalidate];
    int64_t v34 = self->_grantedAccess;
  }
  objc_destroyWeak(&location);

  return v34;
}

__CFString *__74__TKTokenAccessUserPromptRemoteAlertSB_promptUserToEvaluateRequest_error___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 32) == 2) {
    return @"User denied access";
  }
  if (*(unsigned char *)(a1 + 40)) {
    return @"Access request timed out";
  }
  return @"Access request was cancelled";
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F29280];
  id v6 = a4;
  v7 = [v5 interfaceWithProtocol:&unk_1F19FF218];
  [v6 setExportedInterface:v7];

  [v6 setExportedObject:self];
  [v6 resume];

  return 1;
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  remoteAlertHandle = self->_remoteAlertHandle;
  if (remoteAlertHandle) {
    BOOL v5 = remoteAlertHandle == a3;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
    [v7 handleFailureInMethod:a2 object:self file:@"TKTokenAccessUserPromptRemoteAlertSB.m" lineNumber:150 description:@"Received message for unexpected alert handle"];
  }
  self->_int64_t grantedAccess = 0;
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  remoteAlertHandle = self->_remoteAlertHandle;
  if (remoteAlertHandle) {
    BOOL v5 = remoteAlertHandle == a3;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
    [v7 handleFailureInMethod:a2 object:self file:@"TKTokenAccessUserPromptRemoteAlertSB.m" lineNumber:156 description:@"Received message for unexpected alert handle"];

    remoteAlertHandle = self->_remoteAlertHandle;
  }

  [(SBSRemoteAlertHandle *)remoteAlertHandle invalidate];
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  remoteAlertHandle = self->_remoteAlertHandle;
  if (remoteAlertHandle) {
    BOOL v6 = remoteAlertHandle == a3;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    v9 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
    [v9 handleFailureInMethod:a2 object:self file:@"TKTokenAccessUserPromptRemoteAlertSB.m" lineNumber:162 description:@"Received message for unexpected alert handle"];

    remoteAlertHandle = self->_remoteAlertHandle;
  }
  self->_remoteAlertHandle = 0;

  remoteAlertSemaphore = self->_remoteAlertSemaphore;

  dispatch_semaphore_signal(remoteAlertSemaphore);
}

- (void)registerTokenAccessRequestCorrelationID:(id)a3 access:(int64_t)a4 reply:(id)a5
{
  id v9 = a3;
  v10 = (void (**)(void))a5;
  v11 = [(TKTokenAccessRequest *)self->_accessRequest correlationID];
  char v12 = [v9 isEqual:v11];

  if ((v12 & 1) == 0)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"TKTokenAccessUserPromptRemoteAlertSB.m" lineNumber:173 description:@"Received user response for an unexpected request"];
  }
  v13 = [(TKTokenAccessRequest *)self->_accessRequest correlationID];
  int v14 = [v9 isEqual:v13];

  if (v14)
  {
    self->_int64_t grantedAccess = a4;
    v15 = [[TKTokenAccessUserPromptInfo alloc] initWithTokenAccessRequest:self->_accessRequest];
    v16 = TK_LOG_user_prompt();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[TKTokenAccessUserPromptRemoteAlertSB registerTokenAccessRequestCorrelationID:access:reply:](v15, &self->_grantedAccess, v16);
    }
  }
  v10[2](v10);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_remoteAlertSemaphore);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAlertSemaphore, 0);
  objc_storeStrong((id *)&self->_remoteAlertHandle, 0);

  objc_storeStrong((id *)&self->_accessRequest, 0);
}

+ (void)isAvailable
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1BED55000, log, OS_LOG_TYPE_FAULT, "TKTokenAccessUserPrompt creation failure. Missing framework: 'SpringBoardServices.framework'", v1, 2u);
}

- (void)registerTokenAccessRequestCorrelationID:(void *)a1 access:(uint64_t *)a2 reply:(NSObject *)a3 .cold.1(void *a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v6 = [a1 clientDisplayName];
  uint64_t v7 = [a1 providerDisplayName];
  id v8 = (void *)v7;
  id v9 = @"unknown";
  uint64_t v10 = *a2;
  if (*a2 == 2) {
    id v9 = @"denied";
  }
  int v11 = 138412802;
  char v12 = v6;
  __int16 v13 = 2112;
  uint64_t v14 = v7;
  if (v10 == 1) {
    id v9 = @"granted";
  }
  __int16 v15 = 2112;
  v16 = v9;
  _os_log_debug_impl(&dword_1BED55000, a3, OS_LOG_TYPE_DEBUG, "Request to allow '%@' access to token provided by '%@' was '%@'", (uint8_t *)&v11, 0x20u);
}

@end