@interface AKAuthorizationController
+ (BOOL)_matchURLProcessingSet:(id)a3 url:(id)a4;
+ (BOOL)canPerformAuthorization;
+ (BOOL)isURLFromAppleOwnedDomain:(id)a3;
+ (BOOL)shouldProcessURL:(id)a3;
+ (id)appleOwnedDomains;
+ (id)sharedController;
+ (unint64_t)appSSORequestTypeForURL:(id)a3;
+ (void)shouldProcessURL:(id)a3 completion:(id)a4;
- (AKAuthorizationController)init;
- (AKAuthorizationController)initWithDaemonXPCEndpoint:(id)a3;
- (AKAuthorizationUIProvider)uiProvider;
- (BOOL)_shouldOverrideProxiedBundleIDForContext:(id)a3;
- (id)_appleOwnedDomains;
- (id)_nativeTakeoverURLs;
- (id)primaryApplicationInformationForWebServiceWithInfo:(id)a3 error:(id *)a4;
- (void)_appleOwnedDomains;
- (void)_nativeTakeoverEndpointsWithCompletionHandler:(id)a3;
- (void)_nativeTakeoverURLs;
- (void)beginAuthorizationWithContext:(id)a3 completion:(id)a4;
- (void)cancelAuthorizationWithContext:(id)a3 completion:(id)a4;
- (void)continueAuthorizationWithContext:(id)a3 completion:(id)a4;
- (void)continueFetchingIconForRequestContext:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)establishConnectionWithNotificationHandlerEndpoint:(id)a3 completion:(id)a4;
- (void)establishConnectionWithStateBroadcastHandlerEndpoint:(id)a3 completion:(id)a4;
- (void)fetchAppleIDAuthorizeHTMLResponseTemplateWithCompletion:(id)a3;
- (void)getCredentialStateForClientID:(id)a3 completion:(id)a4;
- (void)getCredentialStateForRequest:(id)a3 completion:(id)a4;
- (void)getPresentationContextForRequestContext:(id)a3 completion:(id)a4;
- (void)performAuthorizationWithContext:(id)a3 completion:(id)a4;
- (void)performAuthorizationWithContext:(id)a3 withUserProvidedInformation:(id)a4 completion:(id)a5;
- (void)revokeAuthorizationWithContext:(id)a3 completion:(id)a4;
- (void)setUiProvider:(id)a3;
- (void)storeAuthorization:(id)a3 forProxiedRequest:(id)a4 completion:(id)a5;
@end

@implementation AKAuthorizationController

- (AKAuthorizationController)init
{
  return [(AKAuthorizationController *)self initWithDaemonXPCEndpoint:0];
}

- (AKAuthorizationController)initWithDaemonXPCEndpoint:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKAuthorizationController;
  v5 = [(AKAuthorizationController *)&v11 init];
  if (v5)
  {
    v6 = objc_alloc_init(AKAuthorizationClientImpl);
    clientImpl = v5->_clientImpl;
    v5->_clientImpl = v6;

    v8 = [[AKAuthorizationDaemonConnection alloc] initWithListenerEndpoint:v4 exportedInterface:v5->_clientImpl];
    daemonConnection = v5->_daemonConnection;
    v5->_daemonConnection = v8;
  }
  return v5;
}

- (void)dealloc
{
  v3 = _AKLogSiwa();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationController dealloc]();
  }

  daemonConnection = self->_daemonConnection;
  if (daemonConnection)
  {
    self->_daemonConnection = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)AKAuthorizationController;
  [(AKAuthorizationController *)&v5 dealloc];
}

- (AKAuthorizationUIProvider)uiProvider
{
  return [(AKAuthorizationClientImpl *)self->_clientImpl uiProvider];
}

- (void)setUiProvider:(id)a3
{
}

- (void)performAuthorizationWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_193494000, "authkit/authorize", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v9 = _AKLogSiwa();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_193494000, v9, OS_LOG_TYPE_DEFAULT, "Authorization controller performAuthorizationWithContext called", buf, 2u);
  }

  *(void *)buf = 0;
  v22 = buf;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__16;
  v25 = __Block_byref_object_dispose__16;
  v10 = self;
  v26 = v10;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __72__AKAuthorizationController_performAuthorizationWithContext_completion___block_invoke;
  v18[3] = &unk_1E5762860;
  v20 = buf;
  id v11 = v7;
  id v19 = v11;
  v12 = (void *)MEMORY[0x1996FE880](v18);
  daemonConnection = v10->_daemonConnection;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72__AKAuthorizationController_performAuthorizationWithContext_completion___block_invoke_4;
  v16[3] = &unk_1E575EAC0;
  id v14 = v12;
  id v17 = v14;
  v15 = [(AKAuthorizationDaemonConnection *)daemonConnection remoteObjectProxyWithErrorHandler:v16];
  [v15 performAuthorization:v6 completion:v14];

  _Block_object_dispose(buf, 8);
  os_activity_scope_leave(&state);
}

void __72__AKAuthorizationController_performAuthorizationWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _AKLogSiwa();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_193494000, v8, OS_LOG_TYPE_DEFAULT, "Authorization completed with authorization: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __72__AKAuthorizationController_performAuthorizationWithContext_completion___block_invoke_cold_1();
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __72__AKAuthorizationController_performAuthorizationWithContext_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)beginAuthorizationWithContext:(id)a3 completion:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_193494000, "authkit/begin-authorize", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  uint64_t v9 = _AKSignpostLogSystem();
  os_signpost_id_t v10 = _AKSignpostCreate(v9);
  uint64_t v12 = v11;

  uint64_t v13 = _AKSignpostLogSystem();
  id v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "AuthorizationExternalAuthBegin", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  v15 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: AuthorizationExternalAuthBegin  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__16;
  v33 = __Block_byref_object_dispose__16;
  v16 = self;
  v34 = v16;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __70__AKAuthorizationController_beginAuthorizationWithContext_completion___block_invoke;
  v24[3] = &unk_1E5762888;
  os_signpost_id_t v27 = v10;
  uint64_t v28 = v12;
  p_long long buf = &buf;
  id v17 = v7;
  id v25 = v17;
  v18 = (void *)MEMORY[0x1996FE880](v24);
  daemonConnection = v16->_daemonConnection;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __70__AKAuthorizationController_beginAuthorizationWithContext_completion___block_invoke_7;
  v22[3] = &unk_1E575EAC0;
  id v20 = v18;
  id v23 = v20;
  v21 = [(AKAuthorizationDaemonConnection *)daemonConnection remoteObjectProxyWithErrorHandler:v22];
  [v21 beginAuthorizationWithContext:v6 completion:v20];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __70__AKAuthorizationController_beginAuthorizationWithContext_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  v8 = _AKSignpostLogSystem();
  uint64_t v9 = v8;
  os_signpost_id_t v10 = a1[6];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    int v19 = 67240192;
    LODWORD(v20) = [v6 code];
    _os_signpost_emit_with_name_impl(&dword_193494000, v9, OS_SIGNPOST_INTERVAL_END, v10, "AuthorizationExternalAuthBegin", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 8u);
  }

  uint64_t v11 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (double)Nanoseconds / 1000000000.0;
    uint64_t v13 = (void *)a1[6];
    int v14 = [v6 code];
    int v19 = 134218496;
    id v20 = v13;
    __int16 v21 = 2048;
    double v22 = v12;
    __int16 v23 = 1026;
    int v24 = v14;
    _os_log_impl(&dword_193494000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:AuthorizationExternalAuthBegin  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 0x1Cu);
  }

  v15 = _AKLogSiwa();
  v16 = v15;
  if (v5)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v5;
      _os_log_impl(&dword_193494000, v16, OS_LOG_TYPE_DEFAULT, "Begin Authorization completed with userResponse: %@", (uint8_t *)&v19, 0xCu);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    __70__AKAuthorizationController_beginAuthorizationWithContext_completion___block_invoke_cold_1();
  }

  uint64_t v17 = *(void *)(a1[5] + 8);
  v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = 0;

  (*(void (**)(void))(a1[4] + 16))();
}

uint64_t __70__AKAuthorizationController_beginAuthorizationWithContext_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)continueAuthorizationWithContext:(id)a3 completion:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_193494000, "authkit/continue-authorize", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  uint64_t v9 = _AKSignpostLogSystem();
  os_signpost_id_t v10 = _AKSignpostCreate(v9);
  uint64_t v12 = v11;

  uint64_t v13 = _AKSignpostLogSystem();
  int v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "AuthorizationExternalAuthContinue", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  v15 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: AuthorizationExternalAuthContinue  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__16;
  v33 = __Block_byref_object_dispose__16;
  v16 = self;
  v34 = v16;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __73__AKAuthorizationController_continueAuthorizationWithContext_completion___block_invoke;
  v24[3] = &unk_1E57628B0;
  os_signpost_id_t v27 = v10;
  uint64_t v28 = v12;
  p_long long buf = &buf;
  id v17 = v7;
  id v25 = v17;
  v18 = (void *)MEMORY[0x1996FE880](v24);
  daemonConnection = v16->_daemonConnection;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __73__AKAuthorizationController_continueAuthorizationWithContext_completion___block_invoke_8;
  v22[3] = &unk_1E575EAC0;
  id v20 = v18;
  id v23 = v20;
  __int16 v21 = [(AKAuthorizationDaemonConnection *)daemonConnection remoteObjectProxyWithErrorHandler:v22];
  [v21 continueAuthorizationWithContext:v6 completion:v20];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __73__AKAuthorizationController_continueAuthorizationWithContext_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  v8 = _AKSignpostLogSystem();
  uint64_t v9 = v8;
  os_signpost_id_t v10 = a1[6];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    int v19 = 67240192;
    LODWORD(v20) = [v6 code];
    _os_signpost_emit_with_name_impl(&dword_193494000, v9, OS_SIGNPOST_INTERVAL_END, v10, "AuthorizationExternalAuthContinue", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 8u);
  }

  uint64_t v11 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (double)Nanoseconds / 1000000000.0;
    uint64_t v13 = (void *)a1[6];
    int v14 = [v6 code];
    int v19 = 134218496;
    id v20 = v13;
    __int16 v21 = 2048;
    double v22 = v12;
    __int16 v23 = 1026;
    int v24 = v14;
    _os_log_impl(&dword_193494000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:AuthorizationExternalAuthContinue  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 0x1Cu);
  }

  v15 = _AKLogSiwa();
  v16 = v15;
  if (v5)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v5;
      _os_log_impl(&dword_193494000, v16, OS_LOG_TYPE_DEFAULT, "Continue Authorization completed with authorization: %@", (uint8_t *)&v19, 0xCu);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    __73__AKAuthorizationController_continueAuthorizationWithContext_completion___block_invoke_cold_1();
  }

  uint64_t v17 = *(void *)(a1[5] + 8);
  v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = 0;

  (*(void (**)(void))(a1[4] + 16))();
}

uint64_t __73__AKAuthorizationController_continueAuthorizationWithContext_completion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancelAuthorizationWithContext:(id)a3 completion:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_193494000, "authkit/cancel-authorize", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  uint64_t v9 = _AKSignpostLogSystem();
  os_signpost_id_t v10 = _AKSignpostCreate(v9);
  uint64_t v12 = v11;

  uint64_t v13 = _AKSignpostLogSystem();
  int v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "AuthorizationExternalAuthCancel", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  v15 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: AuthorizationExternalAuthCancel  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__16;
  v33 = __Block_byref_object_dispose__16;
  v16 = self;
  v34 = v16;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __71__AKAuthorizationController_cancelAuthorizationWithContext_completion___block_invoke;
  v24[3] = &unk_1E5760E68;
  os_signpost_id_t v27 = v10;
  uint64_t v28 = v12;
  p_long long buf = &buf;
  id v17 = v7;
  id v25 = v17;
  v18 = (void *)MEMORY[0x1996FE880](v24);
  daemonConnection = v16->_daemonConnection;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __71__AKAuthorizationController_cancelAuthorizationWithContext_completion___block_invoke_9;
  v22[3] = &unk_1E575EAC0;
  id v20 = v18;
  id v23 = v20;
  __int16 v21 = [(AKAuthorizationDaemonConnection *)daemonConnection remoteObjectProxyWithErrorHandler:v22];
  [v21 cancelAuthorizationWithContext:v6 completion:v20];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __71__AKAuthorizationController_cancelAuthorizationWithContext_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  id v5 = _AKSignpostLogSystem();
  id v6 = v5;
  os_signpost_id_t v7 = a1[6];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v16 = 67240192;
    LODWORD(v17) = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_193494000, v6, OS_SIGNPOST_INTERVAL_END, v7, "AuthorizationExternalAuthCancel", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 8u);
  }

  v8 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = (double)Nanoseconds / 1000000000.0;
    uint64_t v10 = a1[6];
    int v11 = [v3 code];
    int v16 = 134218496;
    uint64_t v17 = v10;
    __int16 v18 = 2048;
    double v19 = v9;
    __int16 v20 = 1026;
    int v21 = v11;
    _os_log_impl(&dword_193494000, v8, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:AuthorizationExternalAuthCancel  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 0x1Cu);
  }

  uint64_t v12 = _AKLogSiwa();
  uint64_t v13 = v12;
  if (v3)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __71__AKAuthorizationController_cancelAuthorizationWithContext_completion___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_193494000, v13, OS_LOG_TYPE_DEFAULT, "Cancel Authorization completed successfully", (uint8_t *)&v16, 2u);
  }

  uint64_t v14 = *(void *)(a1[5] + 8);
  v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = 0;

  (*(void (**)(void))(a1[4] + 16))();
}

uint64_t __71__AKAuthorizationController_cancelAuthorizationWithContext_completion___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)revokeAuthorizationWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_193494000, "authkit/revokeUpgrade", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__16;
  v20[4] = __Block_byref_object_dispose__16;
  double v9 = self;
  int v21 = v9;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __71__AKAuthorizationController_revokeAuthorizationWithContext_completion___block_invoke;
  v17[3] = &unk_1E575EF68;
  double v19 = v20;
  id v10 = v7;
  id v18 = v10;
  int v11 = (void *)MEMORY[0x1996FE880](v17);
  daemonConnection = v9->_daemonConnection;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__AKAuthorizationController_revokeAuthorizationWithContext_completion___block_invoke_11;
  v15[3] = &unk_1E575EAC0;
  id v13 = v11;
  id v16 = v13;
  uint64_t v14 = [(AKAuthorizationDaemonConnection *)daemonConnection remoteObjectProxyWithErrorHandler:v15];
  [v14 revokeUpgradeWithContext:v6 completion:v13];

  _Block_object_dispose(v20, 8);
  os_activity_scope_leave(&state);
}

void __71__AKAuthorizationController_revokeAuthorizationWithContext_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _AKLogSiwa();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Revoke completed successfully", v10, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __71__AKAuthorizationController_revokeAuthorizationWithContext_completion___block_invoke_cold_1();
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  double v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __71__AKAuthorizationController_revokeAuthorizationWithContext_completion___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getCredentialStateForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create(&dword_193494000, "authkit/credentialState", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__16;
  v20[4] = __Block_byref_object_dispose__16;
  double v9 = self;
  int v21 = v9;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__AKAuthorizationController_getCredentialStateForRequest_completion___block_invoke;
  v17[3] = &unk_1E57628D8;
  double v19 = v20;
  id v10 = v7;
  id v18 = v10;
  int v11 = (void *)MEMORY[0x1996FE880](v17);
  daemonConnection = v9->_daemonConnection;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__AKAuthorizationController_getCredentialStateForRequest_completion___block_invoke_14;
  v15[3] = &unk_1E575EAC0;
  id v13 = v11;
  id v16 = v13;
  uint64_t v14 = [(AKAuthorizationDaemonConnection *)daemonConnection remoteObjectProxyWithErrorHandler:v15];
  [v14 getCredentialStateForRequest:v6 completion:v13];

  _Block_object_dispose(v20, 8);
  os_activity_scope_leave(&state);
}

void __69__AKAuthorizationController_getCredentialStateForRequest_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = _AKLogSiwa();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __69__AKAuthorizationController_getCredentialStateForRequest_completion___block_invoke_cold_2();
    }
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  double v9 = _AKLogSiwa();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __69__AKAuthorizationController_getCredentialStateForRequest_completion___block_invoke_cold_1(a2);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __69__AKAuthorizationController_getCredentialStateForRequest_completion___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getCredentialStateForClientID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create(&dword_193494000, "authkit/credentialStateForClientID", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__16;
  v20[4] = __Block_byref_object_dispose__16;
  double v9 = self;
  int v21 = v9;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__AKAuthorizationController_getCredentialStateForClientID_completion___block_invoke;
  v17[3] = &unk_1E57628D8;
  double v19 = v20;
  id v10 = v7;
  id v18 = v10;
  int v11 = (void *)MEMORY[0x1996FE880](v17);
  daemonConnection = v9->_daemonConnection;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__AKAuthorizationController_getCredentialStateForClientID_completion___block_invoke_15;
  v15[3] = &unk_1E575EAC0;
  id v13 = v11;
  id v16 = v13;
  uint64_t v14 = [(AKAuthorizationDaemonConnection *)daemonConnection remoteObjectProxyWithErrorHandler:v15];
  [v14 getCredentialStateForClientID:v6 completion:v13];

  _Block_object_dispose(v20, 8);
  os_activity_scope_leave(&state);
}

void __70__AKAuthorizationController_getCredentialStateForClientID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = _AKLogSiwa();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __69__AKAuthorizationController_getCredentialStateForRequest_completion___block_invoke_cold_2();
    }
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  double v9 = _AKLogSiwa();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __69__AKAuthorizationController_getCredentialStateForRequest_completion___block_invoke_cold_1(a2);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __70__AKAuthorizationController_getCredentialStateForClientID_completion___block_invoke_15(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getPresentationContextForRequestContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create(&dword_193494000, "authkit/presentationContext", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__16;
  v20[4] = __Block_byref_object_dispose__16;
  double v9 = self;
  int v21 = v9;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __80__AKAuthorizationController_getPresentationContextForRequestContext_completion___block_invoke;
  v17[3] = &unk_1E5762900;
  id v10 = v7;
  id v18 = v10;
  double v19 = v20;
  int v11 = (void *)MEMORY[0x1996FE880](v17);
  daemonConnection = v9->_daemonConnection;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__AKAuthorizationController_getPresentationContextForRequestContext_completion___block_invoke_17;
  v15[3] = &unk_1E575EAC0;
  id v13 = v11;
  id v16 = v13;
  uint64_t v14 = [(AKAuthorizationDaemonConnection *)daemonConnection remoteObjectProxyWithErrorHandler:v15];
  [v14 getPresentationContextForRequestContext:v6 completion:v13];

  _Block_object_dispose(v20, 8);
  os_activity_scope_leave(&state);
}

void __80__AKAuthorizationController_getPresentationContextForRequestContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _AKLogSiwa();
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_193494000, v8, OS_LOG_TYPE_DEFAULT, "getPresentationContext completed with presentation context: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __72__AKAuthorizationController_performAuthorizationWithContext_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0;
}

uint64_t __80__AKAuthorizationController_getPresentationContextForRequestContext_completion___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performAuthorizationWithContext:(id)a3 withUserProvidedInformation:(id)a4 completion:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = _os_activity_create(&dword_193494000, "authkit/performRequestWithSelection", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  if ([(AKAuthorizationController *)self _shouldOverrideProxiedBundleIDForContext:v8])
  {
    id v12 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v13 = [v12 bundleIdentifier];

    objc_msgSend(v8, "set_proxiedClientBundleID:", v13);
  }
  uint64_t v14 = [v8 authorizationRequest];
  v15 = [v8 requestIdentifier];
  [v14 setRequestIdentifier:v15];

  id v16 = [v8 passwordRequest];
  uint64_t v17 = [v8 requestIdentifier];
  [v16 setRequestIdentifier:v17];

  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__16;
  v33[4] = __Block_byref_object_dispose__16;
  id v18 = self;
  v34 = v18;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __100__AKAuthorizationController_performAuthorizationWithContext_withUserProvidedInformation_completion___block_invoke;
  v30[3] = &unk_1E5762928;
  v30[4] = v18;
  id v19 = v10;
  id v31 = v19;
  v32 = v33;
  __int16 v20 = (void *)MEMORY[0x1996FE880](v30);
  daemonConnection = v18->_daemonConnection;
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  os_signpost_id_t v27 = __100__AKAuthorizationController_performAuthorizationWithContext_withUserProvidedInformation_completion___block_invoke_19;
  uint64_t v28 = &unk_1E575EAC0;
  id v22 = v20;
  id v29 = v22;
  id v23 = [(AKAuthorizationDaemonConnection *)daemonConnection remoteObjectProxyWithErrorHandler:&v25];
  int v24 = _AKLogSiwa();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v37 = v8;
    _os_log_impl(&dword_193494000, v24, OS_LOG_TYPE_DEFAULT, "Attempting proxy auth with context: %@", buf, 0xCu);
  }

  objc_msgSend(v23, "performAuthorizationWithContext:withUserProvidedInformation:completion:", v8, v9, v22, v25, v26, v27, v28);
  _Block_object_dispose(v33, 8);

  os_activity_scope_leave(&state);
}

void __100__AKAuthorizationController_performAuthorizationWithContext_withUserProvidedInformation_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _AKLogSiwa();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_193494000, v8, OS_LOG_TYPE_DEFAULT, "performAuthorizationWithContext completed with presentation context: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __100__AKAuthorizationController_performAuthorizationWithContext_withUserProvidedInformation_completion___block_invoke_cold_1(a1, (uint64_t)v6, v8);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0;
}

uint64_t __100__AKAuthorizationController_performAuthorizationWithContext_withUserProvidedInformation_completion___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_nativeTakeoverURLs
{
  id v3 = _AKLogSiwa();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_193494000, v3, OS_LOG_TYPE_DEFAULT, "Fetching native takeover URLs", buf, 2u);
  }

  *(void *)long long buf = 0;
  v16[0] = buf;
  v16[1] = 0x3032000000;
  v16[2] = __Block_byref_object_copy__16;
  v16[3] = __Block_byref_object_dispose__16;
  id v17 = 0;
  id v4 = [(AKAuthorizationDaemonConnection *)self->_daemonConnection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_55];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__AKAuthorizationController__nativeTakeoverURLs__block_invoke_20;
  v14[3] = &unk_1E5762950;
  v14[4] = buf;
  [v4 fetchNativeTakeoverURLSetWithCompletion:v14];
  id v5 = _AKLogSiwa();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(AKAuthorizationController *)(uint64_t)v16 _nativeTakeoverURLs];
  }

  id v12 = *(id *)(v16[0] + 40);
  _Block_object_dispose(buf, 8);

  return v12;
}

void __48__AKAuthorizationController__nativeTakeoverURLs__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _AKLogSiwa();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __48__AKAuthorizationController__nativeTakeoverURLs__block_invoke_cold_1();
  }
}

void __48__AKAuthorizationController__nativeTakeoverURLs__block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _AKLogSiwa();
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_193494000, v8, OS_LOG_TYPE_DEFAULT, "Native takeover URLs fetched", v11, 2u);
    }

    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    id v10 = v5;
    uint64_t v8 = *(NSObject **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __48__AKAuthorizationController__nativeTakeoverURLs__block_invoke_20_cold_1();
  }
}

- (void)_nativeTakeoverEndpointsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = _AKLogSiwa();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_193494000, v5, OS_LOG_TYPE_DEFAULT, "Fetching native takeover URLs", buf, 2u);
  }

  daemonConnection = self->_daemonConnection;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__AKAuthorizationController__nativeTakeoverEndpointsWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E575EAC0;
  id v7 = v4;
  id v13 = v7;
  uint64_t v8 = [(AKAuthorizationDaemonConnection *)daemonConnection remoteObjectProxyWithErrorHandler:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__AKAuthorizationController__nativeTakeoverEndpointsWithCompletionHandler___block_invoke_22;
  v10[3] = &unk_1E5762978;
  id v11 = v7;
  id v9 = v7;
  [v8 fetchNativeTakeoverURLSetWithCompletion:v10];
}

void __75__AKAuthorizationController__nativeTakeoverEndpointsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSiwa();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __48__AKAuthorizationController__nativeTakeoverURLs__block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __75__AKAuthorizationController__nativeTakeoverEndpointsWithCompletionHandler___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _AKLogSiwa();
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __75__AKAuthorizationController__nativeTakeoverEndpointsWithCompletionHandler___block_invoke_22_cold_2();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __48__AKAuthorizationController__nativeTakeoverURLs__block_invoke_20_cold_1();
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
}

- (id)_appleOwnedDomains
{
  id v3 = _AKLogSiwa();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_193494000, v3, OS_LOG_TYPE_DEFAULT, "Fetching apple owned domains...", buf, 2u);
  }

  *(void *)long long buf = 0;
  v16[0] = buf;
  v16[1] = 0x3032000000;
  v16[2] = __Block_byref_object_copy__16;
  v16[3] = __Block_byref_object_dispose__16;
  id v17 = 0;
  id v4 = [(AKAuthorizationDaemonConnection *)self->_daemonConnection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_24];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__AKAuthorizationController__appleOwnedDomains__block_invoke_25;
  v14[3] = &unk_1E5762950;
  v14[4] = buf;
  [v4 fetchAppleOwnedDomainSetWithCompletion:v14];
  id v5 = _AKLogSiwa();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(AKAuthorizationController *)(uint64_t)v16 _appleOwnedDomains];
  }

  id v12 = *(id *)(v16[0] + 40);
  _Block_object_dispose(buf, 8);

  return v12;
}

void __47__AKAuthorizationController__appleOwnedDomains__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _AKLogSiwa();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __47__AKAuthorizationController__appleOwnedDomains__block_invoke_cold_1();
  }
}

void __47__AKAuthorizationController__appleOwnedDomains__block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _AKLogSiwa();
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_193494000, v8, OS_LOG_TYPE_DEFAULT, "Apple owned domains fetched", v11, 2u);
    }

    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    id v10 = v5;
    uint64_t v8 = *(NSObject **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __47__AKAuthorizationController__appleOwnedDomains__block_invoke_25_cold_1();
  }
}

- (void)fetchAppleIDAuthorizeHTMLResponseTemplateWithCompletion:(id)a3
{
  id v4 = a3;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__16;
  void v16[4] = __Block_byref_object_dispose__16;
  id v5 = self;
  id v17 = v5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __85__AKAuthorizationController_fetchAppleIDAuthorizeHTMLResponseTemplateWithCompletion___block_invoke;
  v13[3] = &unk_1E57629A0;
  v15 = v16;
  id v6 = v4;
  id v14 = v6;
  uint64_t v7 = (void *)MEMORY[0x1996FE880](v13);
  daemonConnection = v5->_daemonConnection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__AKAuthorizationController_fetchAppleIDAuthorizeHTMLResponseTemplateWithCompletion___block_invoke_27;
  v11[3] = &unk_1E575EAC0;
  id v9 = v7;
  id v12 = v9;
  id v10 = [(AKAuthorizationDaemonConnection *)daemonConnection remoteObjectProxyWithErrorHandler:v11];
  [v10 fetchAppleIDAuthorizeHTMLResponseTemplateWithCompletion:v9];

  _Block_object_dispose(v16, 8);
}

void __85__AKAuthorizationController_fetchAppleIDAuthorizeHTMLResponseTemplateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [v6 length];
  uint64_t v8 = _AKLogSiwa();
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_193494000, v9, OS_LOG_TYPE_DEFAULT, "fetchAppleIDAuthorizeHTMLResponseTemplate completed with result.", v12, 2u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    __85__AKAuthorizationController_fetchAppleIDAuthorizeHTMLResponseTemplateWithCompletion___block_invoke_cold_1();
  }

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __85__AKAuthorizationController_fetchAppleIDAuthorizeHTMLResponseTemplateWithCompletion___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)continueFetchingIconForRequestContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__16;
  v19[4] = __Block_byref_object_dispose__16;
  uint64_t v8 = self;
  __int16 v20 = v8;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __78__AKAuthorizationController_continueFetchingIconForRequestContext_completion___block_invoke;
  v16[3] = &unk_1E57629C8;
  id v18 = v19;
  id v9 = v7;
  id v17 = v9;
  uint64_t v10 = (void *)MEMORY[0x1996FE880](v16);
  daemonConnection = v8->_daemonConnection;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__AKAuthorizationController_continueFetchingIconForRequestContext_completion___block_invoke_29;
  v14[3] = &unk_1E575EAC0;
  id v12 = v10;
  id v15 = v12;
  id v13 = [(AKAuthorizationDaemonConnection *)daemonConnection remoteObjectProxyWithErrorHandler:v14];
  [v13 continueFetchingIconForRequestContext:v6 completion:v12];

  _Block_object_dispose(v19, 8);
}

void __78__AKAuthorizationController_continueFetchingIconForRequestContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [v6 length];
  uint64_t v8 = _AKLogSiwa();
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_193494000, v9, OS_LOG_TYPE_DEFAULT, "continueFetchingIconWithCompletion completed with result.", v12, 2u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    __78__AKAuthorizationController_continueFetchingIconForRequestContext_completion___block_invoke_cold_1();
  }

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __78__AKAuthorizationController_continueFetchingIconForRequestContext_completion___block_invoke_29(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)primaryApplicationInformationForWebServiceWithInfo:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = _os_activity_create(&dword_193494000, "authkit/fetch-primary-bundleid", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__16;
  uint64_t v26 = __Block_byref_object_dispose__16;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__16;
  __int16 v20 = __Block_byref_object_dispose__16;
  id v21 = 0;
  daemonConnection = self->_daemonConnection;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__AKAuthorizationController_primaryApplicationInformationForWebServiceWithInfo_error___block_invoke;
  v15[3] = &unk_1E575F080;
  void v15[4] = &v16;
  id v9 = [(AKAuthorizationDaemonConnection *)daemonConnection synchronousRemoteObjectProxyWithErrorHandler:v15];
  uint64_t v10 = _AKLogSiwa();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v6 objectForKeyedSubscript:@"client_id"];
    *(_DWORD *)long long buf = 138412290;
    v30 = v11;
    _os_log_impl(&dword_193494000, v10, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service to fetch primary bundle ID for service: %@", buf, 0xCu);
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __86__AKAuthorizationController_primaryApplicationInformationForWebServiceWithInfo_error___block_invoke_31;
  v14[3] = &unk_1E575F328;
  void v14[4] = &v22;
  void v14[5] = &v16;
  [v9 fetchPrimaryApplicationInformationForWebServiceWithInfo:v6 completion:v14];
  if (a4) {
    *a4 = (id) v17[5];
  }
  id v12 = (id)v23[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  os_activity_scope_leave(&state);

  return v12;
}

void __86__AKAuthorizationController_primaryApplicationInformationForWebServiceWithInfo_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSiwa();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __86__AKAuthorizationController_primaryApplicationInformationForWebServiceWithInfo_error___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Result of remote call: %@. Error: %@", (uint8_t *)&v13, 0x16u);
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
}

- (void)storeAuthorization:(id)a3 forProxiedRequest:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _os_activity_create(&dword_193494000, "authkit/store-proxied-authorization", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__16;
  v23[4] = __Block_byref_object_dispose__16;
  id v12 = self;
  uint64_t v24 = v12;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __77__AKAuthorizationController_storeAuthorization_forProxiedRequest_completion___block_invoke;
  v20[3] = &unk_1E575EF68;
  uint64_t v22 = v23;
  id v13 = v10;
  id v21 = v13;
  id v14 = (void *)MEMORY[0x1996FE880](v20);
  daemonConnection = v12->_daemonConnection;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __77__AKAuthorizationController_storeAuthorization_forProxiedRequest_completion___block_invoke_33;
  v18[3] = &unk_1E575EAC0;
  id v16 = v14;
  id v19 = v16;
  uint64_t v17 = [(AKAuthorizationDaemonConnection *)daemonConnection remoteObjectProxyWithErrorHandler:v18];
  [v17 storeAuthorization:v8 forProxiedRequest:v9 completion:v16];

  _Block_object_dispose(v23, 8);
  os_activity_scope_leave(&state);
}

void __77__AKAuthorizationController_storeAuthorization_forProxiedRequest_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _AKLogSiwa();
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Store proxied authorization completed", v10, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __77__AKAuthorizationController_storeAuthorization_forProxiedRequest_completion___block_invoke_cold_1();
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __77__AKAuthorizationController_storeAuthorization_forProxiedRequest_completion___block_invoke_33(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)canPerformAuthorization
{
  return 1;
}

+ (id)sharedController
{
  if (sharedController_onceToken_0 != -1) {
    dispatch_once(&sharedController_onceToken_0, &__block_literal_global_36);
  }
  id v2 = (void *)sharedController_sharedController;

  return v2;
}

uint64_t __45__AKAuthorizationController_sharedController__block_invoke()
{
  sharedController_sharedController = objc_alloc_init(AKAuthorizationController);

  return MEMORY[0x1F41817F8]();
}

+ (BOOL)_matchURLProcessingSet:(id)a3 url:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = _AKLogSiwa();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    +[AKAuthorizationController _matchURLProcessingSet:url:]();
  }

  if ([v5 count])
  {
    unint64_t v8 = 0x1E4F29000uLL;
    id v36 = v6;
    id v9 = [MEMORY[0x1E4F29088] componentsWithURL:v6 resolvingAgainstBaseURL:0];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v37 = v5;
    id v10 = v5;
    uint64_t v44 = [v10 countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v44)
    {
      uint64_t v11 = *(void *)v47;
      uint64_t v43 = *(void *)v47;
      uint64_t v38 = v9;
LABEL_6:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v47 != v11) {
          objc_enumerationMutation(v10);
        }
        id v13 = *(void **)(v8 + 136);
        id v14 = [MEMORY[0x1E4F1CB10] URLWithString:*(void *)(*((void *)&v46 + 1) + 8 * v12)];
        __int16 v15 = [v13 componentsWithURL:v14 resolvingAgainstBaseURL:0];

        id v16 = [v15 scheme];
        uint64_t v17 = [v9 scheme];
        if (![v16 caseInsensitiveCompare:v17])
        {
          uint64_t v18 = v10;
          id v19 = [v15 host];
          __int16 v20 = v9;
          id v21 = [v9 host];
          if (![v19 caseInsensitiveCompare:v21])
          {
            uint64_t v22 = [v15 path];
            id v23 = [v20 path];
            if (![v22 caseInsensitiveCompare:v23])
            {
              v41 = v23;
              v42 = v22;
              uint64_t v24 = [v15 password];
              uint64_t v25 = v20;
              uint64_t v26 = [v20 password];
              v40 = (void *)v24;
              id v27 = (void *)v24;
              uint64_t v28 = (void *)v26;
              if (![v27 caseInsensitiveCompare:v26])
              {
                id v29 = [v15 port];
                v30 = [v25 port];
                uint64_t v39 = [v29 compare:v30];

                id v10 = v18;
                unint64_t v8 = 0x1E4F29000;
                id v9 = v38;
                uint64_t v11 = v43;
                if (!v39)
                {
                  v33 = _AKLogSiwa();
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)long long buf = 0;
                    _os_log_impl(&dword_193494000, v33, OS_LOG_TYPE_DEFAULT, "Authorization controller should process URL", buf, 2u);
                  }

                  BOOL v32 = 1;
                  goto LABEL_31;
                }
                goto LABEL_17;
              }

              id v23 = v41;
              uint64_t v22 = v42;
            }
          }
          id v10 = v18;
          unint64_t v8 = 0x1E4F29000;
          id v9 = v20;
          uint64_t v11 = v43;
        }

LABEL_17:
        if (v44 == ++v12)
        {
          uint64_t v31 = [v10 countByEnumeratingWithState:&v46 objects:v50 count:16];
          uint64_t v44 = v31;
          if (v31) {
            goto LABEL_6;
          }
          break;
        }
      }
    }

    id v10 = _AKLogSiwa();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_193494000, v10, OS_LOG_TYPE_DEFAULT, "URL shouldn't be processed", buf, 2u);
    }
    BOOL v32 = 0;
LABEL_31:
    id v6 = v36;
    id v5 = v37;
  }
  else
  {
    id v9 = _AKLogSiwa();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[AKAuthorizationController _matchURLProcessingSet:url:](v9);
    }
    BOOL v32 = 0;
  }

  return v32;
}

+ (BOOL)shouldProcessURL:(id)a3
{
  id v4 = a3;
  id v5 = _AKLogSiwa();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_193494000, v5, OS_LOG_TYPE_DEFAULT, "Should process URL called", v10, 2u);
  }

  id v6 = [a1 sharedController];
  uint64_t v7 = [v6 _nativeTakeoverURLs];

  char v8 = [a1 _matchURLProcessingSet:v7 url:v4];
  return v8;
}

+ (void)shouldProcessURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [a1 sharedController];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__AKAuthorizationController_shouldProcessURL_completion___block_invoke;
  v11[3] = &unk_1E57629F0;
  id v13 = v7;
  id v14 = a1;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  [v8 _nativeTakeoverEndpointsWithCompletionHandler:v11];
}

void __57__AKAuthorizationController_shouldProcessURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v9)
  {
    [*(id *)(a1 + 48) _matchURLProcessingSet:v9 url:*(void *)(a1 + 32)];
    uint64_t v6 = *(void *)(a1 + 40);
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = *(void (**)(void))(v6 + 16);
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    if (!v8) {
      goto LABEL_7;
    }
    id v7 = *(void (**)(void))(v8 + 16);
  }
  v7();
LABEL_7:
}

+ (id)appleOwnedDomains
{
  id v2 = [a1 sharedController];
  id v3 = [v2 _appleOwnedDomains];

  return v3;
}

+ (BOOL)isURLFromAppleOwnedDomain:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _AKLogSiwa();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_193494000, v5, OS_LOG_TYPE_DEFAULT, "Checking if url is apple owned", buf, 2u);
  }

  uint64_t v6 = [a1 sharedController];
  id v7 = [v6 _appleOwnedDomains];

  if ([v7 count])
  {
    uint64_t v8 = [v4 host];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          unint64_t v15 = [v8 length];
          if (v15 >= [v14 length])
          {
            uint64_t v16 = [v8 length];
            uint64_t v17 = v16 - [v14 length];
            if (!-[NSObject compare:options:range:](v8, "compare:options:range:", v14, 1, v17, [v14 length]))
            {
              uint64_t v18 = [v8 length];
              if (v18 == [v14 length]
                || [v8 characterAtIndex:v17 - 1] == 46)
              {
                BOOL v19 = 1;
                goto LABEL_22;
              }
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    id v9 = _AKLogSiwa();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_193494000, v9, OS_LOG_TYPE_DEFAULT, "URL is not apple owned", buf, 2u);
    }
    BOOL v19 = 0;
LABEL_22:
  }
  else
  {
    uint64_t v8 = _AKLogSiwa();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[AKAuthorizationController _matchURLProcessingSet:url:](v8);
    }
    BOOL v19 = 0;
  }

  return v19;
}

+ (unint64_t)appSSORequestTypeForURL:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _AKLogSiwa();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_193494000, v5, OS_LOG_TYPE_DEFAULT, "Checking app SSO request type", (uint8_t *)&v16, 2u);
  }

  uint64_t v6 = +[AKFeatureManager sharedManager];
  int v7 = [v6 isForgotPasswordNativeTakeoverEnabled];

  if (!v7) {
    goto LABEL_6;
  }
  uint64_t v8 = +[AKURLBag sharedBag];
  id v9 = [v8 iForgotWebURLToIntercept];

  uint64_t v10 = [v9 host];
  uint64_t v11 = [v4 host];
  char v12 = [v10 isEqualToString:v11];

  if (v12)
  {
    a1 = (id)2;
  }
  else
  {
LABEL_6:
    LODWORD(a1) = [a1 isURLFromAppleOwnedDomain:v4];
    id v13 = _AKLogSiwa();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = @"NO";
      if (a1) {
        id v14 = @"YES";
      }
      int v16 = 138412290;
      uint64_t v17 = v14;
      _os_log_impl(&dword_193494000, v13, OS_LOG_TYPE_DEFAULT, "Should show authorization flow: %@", (uint8_t *)&v16, 0xCu);
    }

    a1 = (id)a1;
  }

  return (unint64_t)a1;
}

- (void)establishConnectionWithNotificationHandlerEndpoint:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__16;
  v19[4] = __Block_byref_object_dispose__16;
  uint64_t v8 = self;
  __int16 v20 = v8;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __91__AKAuthorizationController_establishConnectionWithNotificationHandlerEndpoint_completion___block_invoke;
  v16[3] = &unk_1E575EF68;
  uint64_t v18 = v19;
  id v9 = v7;
  id v17 = v9;
  uint64_t v10 = (void *)MEMORY[0x1996FE880](v16);
  daemonConnection = v8->_daemonConnection;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __91__AKAuthorizationController_establishConnectionWithNotificationHandlerEndpoint_completion___block_invoke_48;
  v14[3] = &unk_1E575EAC0;
  id v12 = v10;
  id v15 = v12;
  id v13 = [(AKAuthorizationDaemonConnection *)daemonConnection remoteObjectProxyWithErrorHandler:v14];
  [v13 establishConnectionWithNotificationHandlerEndpoint:v6 completion:v12];

  _Block_object_dispose(v19, 8);
}

void __91__AKAuthorizationController_establishConnectionWithNotificationHandlerEndpoint_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    id v7 = _AKLogSiwa();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Established connection between notification center endpoint and daemon service.", v11, 2u);
    }
  }
  else
  {
    if (objc_msgSend(v5, "ak_isAuthenticationErrorWithCode:", -7026)) {
      goto LABEL_8;
    }
    id v7 = _AKLogSiwa();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __91__AKAuthorizationController_establishConnectionWithNotificationHandlerEndpoint_completion___block_invoke_cold_1();
    }
  }

LABEL_8:
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, void *))(v10 + 16))(v10, a2, v6);
  }
}

uint64_t __91__AKAuthorizationController_establishConnectionWithNotificationHandlerEndpoint_completion___block_invoke_48(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)establishConnectionWithStateBroadcastHandlerEndpoint:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__16;
  v19[4] = __Block_byref_object_dispose__16;
  uint64_t v8 = self;
  __int16 v20 = v8;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __93__AKAuthorizationController_establishConnectionWithStateBroadcastHandlerEndpoint_completion___block_invoke;
  v16[3] = &unk_1E575EF68;
  uint64_t v18 = v19;
  id v9 = v7;
  id v17 = v9;
  uint64_t v10 = (void *)MEMORY[0x1996FE880](v16);
  daemonConnection = v8->_daemonConnection;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __93__AKAuthorizationController_establishConnectionWithStateBroadcastHandlerEndpoint_completion___block_invoke_49;
  v14[3] = &unk_1E575EAC0;
  id v12 = v10;
  id v15 = v12;
  id v13 = [(AKAuthorizationDaemonConnection *)daemonConnection remoteObjectProxyWithErrorHandler:v14];
  [v13 establishConnectionWithStateBroadcastHandlerEndpoint:v6 completion:v12];

  _Block_object_dispose(v19, 8);
}

void __93__AKAuthorizationController_establishConnectionWithStateBroadcastHandlerEndpoint_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    id v7 = _AKLogSiwa();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Established connection between state broadcast handler endpoint and daemon service.", v11, 2u);
    }
  }
  else
  {
    if (objc_msgSend(v5, "ak_isAuthenticationErrorWithCode:", -7026)) {
      goto LABEL_8;
    }
    id v7 = _AKLogSiwa();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __93__AKAuthorizationController_establishConnectionWithStateBroadcastHandlerEndpoint_completion___block_invoke_cold_1();
    }
  }

LABEL_8:
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, void *))(v10 + 16))(v10, a2, v6);
  }
}

uint64_t __93__AKAuthorizationController_establishConnectionWithStateBroadcastHandlerEndpoint_completion___block_invoke_49(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_shouldOverrideProxiedBundleIDForContext:(id)a3
{
  id v3 = a3;
  if ([v3 _isWebLogin]
    && [v3 _isEligibleForUpgradeFromPassword])
  {
    if ([v3 _isEligibleForUpgradeFromPassword])
    {
      id v4 = [v3 _proxiedClientBundleID];
      if (v4) {
        LOBYTE(v5) = 0;
      }
      else {
        int v5 = [v3 _isSubscriptionLogin] ^ 1;
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    int v5 = [v3 _isSubscriptionLogin] ^ 1;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonConnection, 0);

  objc_storeStrong((id *)&self->_clientImpl, 0);
}

void __72__AKAuthorizationController_performAuthorizationWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Authorization failed: %@", v2, v3, v4, v5, v6);
}

void __70__AKAuthorizationController_beginAuthorizationWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Begin Authorization failed: %@", v2, v3, v4, v5, v6);
}

void __73__AKAuthorizationController_continueAuthorizationWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Continue Authorization failed: %@", v2, v3, v4, v5, v6);
}

void __71__AKAuthorizationController_cancelAuthorizationWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Cancel Authorization failed: %@", v2, v3, v4, v5, v6);
}

void __71__AKAuthorizationController_revokeAuthorizationWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Revoke failed: %@", v2, v3, v4, v5, v6);
}

void __69__AKAuthorizationController_getCredentialStateForRequest_completion___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [NSNumber numberWithInteger:a1];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_193494000, v2, v3, "Credential State returned with state: %@", v4, v5, v6, v7, v8);
}

void __69__AKAuthorizationController_getCredentialStateForRequest_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Credential State request returned with error: %@", v2, v3, v4, v5, v6);
}

void __100__AKAuthorizationController_performAuthorizationWithContext_withUserProvidedInformation_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_193494000, log, OS_LOG_TYPE_ERROR, "%@: Authorization failed: %@", (uint8_t *)&v4, 0x16u);
}

- (void)_nativeTakeoverURLs
{
}

void __48__AKAuthorizationController__nativeTakeoverURLs__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to fetch authorized URLs with XPC error: %@", v2, v3, v4, v5, v6);
}

void __48__AKAuthorizationController__nativeTakeoverURLs__block_invoke_20_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to fetch authorized URLs with error: %@", v2, v3, v4, v5, v6);
}

void __75__AKAuthorizationController__nativeTakeoverEndpointsWithCompletionHandler___block_invoke_22_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_193494000, v0, v1, "Native takeover URLs: %@", v2, v3, v4, v5, v6);
}

- (void)_appleOwnedDomains
{
}

void __47__AKAuthorizationController__appleOwnedDomains__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to fetch apple owned domains with XPC error: %@", v2, v3, v4, v5, v6);
}

void __47__AKAuthorizationController__appleOwnedDomains__block_invoke_25_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to fetch apple owned domains with error: %@", v2, v3, v4, v5, v6);
}

void __85__AKAuthorizationController_fetchAppleIDAuthorizeHTMLResponseTemplateWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to fetch authorization HTML response template with error: %@", v2, v3, v4, v5, v6);
}

void __78__AKAuthorizationController_continueFetchingIconForRequestContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to continue fetching icon with error: %@", v2, v3, v4, v5, v6);
}

void __77__AKAuthorizationController_storeAuthorization_forProxiedRequest_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Store proxied authorization failed: %@", v2, v3, v4, v5, v6);
}

+ (void)_matchURLProcessingSet:(os_log_t)log url:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_193494000, log, OS_LOG_TYPE_ERROR, "No URL for Apple ID Authorization", v1, 2u);
}

+ (void)_matchURLProcessingSet:url:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_193494000, v0, v1, "Authorize URLs: %@", v2, v3, v4, v5, v6);
}

void __91__AKAuthorizationController_establishConnectionWithNotificationHandlerEndpoint_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to establish connection between notification center endpoint and daemon service with error: %@", v2, v3, v4, v5, v6);
}

void __93__AKAuthorizationController_establishConnectionWithStateBroadcastHandlerEndpoint_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to establish connection between state broadcast handler endpoint and daemon service with error: %@", v2, v3, v4, v5, v6);
}

@end