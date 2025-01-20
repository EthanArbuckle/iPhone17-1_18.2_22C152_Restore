@interface AKPrivateEmailController
- (AAFXPCSession)remoteService;
- (AKPrivateEmailController)init;
- (AKPrivateEmailController)initWithXPCSession:(id)a3;
- (AKPrivateEmailUIProvider)uiProvider;
- (id)exportedObject;
- (void)configureRemoteInterface:(id)a3;
- (void)deletePrivateEmailDatabaseWithCompletion:(id)a3;
- (void)fetchPrivateEmailForAltDSID:(id)a3 withKey:(id)a4 completion:(id)a5;
- (void)fetchPrivateEmailWithContext:(id)a3 completion:(id)a4;
- (void)fetchSignInWithApplePrivateEmailWithContext:(id)a3 completion:(id)a4;
- (void)getContextForRequestContext:(id)a3 completion:(id)a4;
- (void)listAllPrivateEmailsForAltDSID:(id)a3 completion:(id)a4;
- (void)lookupPrivateEmailForAltDSID:(id)a3 withKey:(id)a4 completion:(id)a5;
- (void)lookupPrivateEmailWithContext:(id)a3 completion:(id)a4;
- (void)privateEmailListVersionWithCompletion:(id)a3;
- (void)registerPrivateEmailForAltDSID:(id)a3 withKey:(id)a4 completion:(id)a5;
- (void)registerPrivateEmailWithContext:(id)a3 completion:(id)a4;
- (void)removePrivateEmailKey:(id)a3 completion:(id)a4;
- (void)setRemoteService:(id)a3;
- (void)setUiProvider:(id)a3;
@end

@implementation AKPrivateEmailController

- (AKPrivateEmailController)init
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F47010]) initWithServiceName:@"com.apple.ak.privateemail.xpc" remoteProtocol:&unk_1EE44A9A0 exportedProtocol:&unk_1EE458520 options:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F47008]) initWithRemoteServiceConfig:v3 delegate:self];
  v5 = [(AKPrivateEmailController *)self initWithXPCSession:v4];

  return v5;
}

- (AKPrivateEmailController)initWithXPCSession:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AKPrivateEmailController;
  v6 = [(AKPrivateEmailController *)&v10 init];
  if (v6)
  {
    v7 = objc_alloc_init(AKPrivateEmailClientImpl);
    clientImpl = v6->_clientImpl;
    v6->_clientImpl = v7;

    objc_storeStrong((id *)&v6->_remoteService, a3);
    [(AAFXPCSession *)v6->_remoteService resume];
  }

  return v6;
}

- (void)configureRemoteInterface:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v5, v6, v7, objc_opt_class(), 0);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setClasses:v8 forSelector:sel_lookupPrivateEmailForAltDSID_withKey_completion_ argumentIndex:0 ofReply:1];
  [v4 setClasses:v8 forSelector:sel_registerPrivateEmailForAltDSID_withKey_completion_ argumentIndex:0 ofReply:1];
  [v4 setClasses:v8 forSelector:sel_registerPrivateEmailWithContext_completion_ argumentIndex:0 ofReply:1];
  [v4 setClasses:v8 forSelector:sel_listAllPrivateEmailsForAltDSID_completion_ argumentIndex:0 ofReply:1];
  [v4 setClasses:v8 forSelector:sel_fetchSignInWithApplePrivateEmailWithContext_completion_ argumentIndex:0 ofReply:1];
}

- (id)exportedObject
{
  return self->_clientImpl;
}

- (AKPrivateEmailUIProvider)uiProvider
{
  return [(AKPrivateEmailClientImpl *)self->_clientImpl uiProvider];
}

- (void)setUiProvider:(id)a3
{
}

- (void)lookupPrivateEmailForAltDSID:(id)a3 withKey:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[AKPrivateEmailContext alloc] initWithKey:v9 altDSID:v10];

  [(AKPrivateEmailController *)self lookupPrivateEmailWithContext:v11 completion:v8];
}

- (void)lookupPrivateEmailWithContext:(id)a3 completion:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__7;
  v30[4] = __Block_byref_object_dispose__7;
  id v8 = self;
  v31 = v8;
  id v9 = _os_activity_create(&dword_193494000, "private-email-authkit/lookup-email", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  id v10 = _AKSignpostLogSystem();
  os_signpost_id_t v11 = _AKSignpostCreate(v10);
  uint64_t v13 = v12;

  v14 = _AKSignpostLogSystem();
  v15 = v14;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PrivateEmailLocalLookup", " enableTelemetry=YES ", buf, 2u);
  }

  v16 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v33 = v11;
    _os_log_impl(&dword_193494000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PrivateEmailLocalLookup  enableTelemetry=YES ", buf, 0xCu);
  }

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __69__AKPrivateEmailController_lookupPrivateEmailWithContext_completion___block_invoke;
  v24[3] = &unk_1E5760DC8;
  v26 = v30;
  os_signpost_id_t v27 = v11;
  uint64_t v28 = v13;
  id v17 = v7;
  id v25 = v17;
  v18 = (void *)MEMORY[0x1996FE880](v24);
  remoteService = v8->_remoteService;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __69__AKPrivateEmailController_lookupPrivateEmailWithContext_completion___block_invoke_98;
  v22[3] = &unk_1E575EAC0;
  id v20 = v18;
  id v23 = v20;
  v21 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v22];
  [v21 lookupPrivateEmailWithContext:v6 completion:v20];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v30, 8);
}

void __69__AKPrivateEmailController_lookupPrivateEmailWithContext_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[5] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  id v10 = _AKSignpostLogSystem();
  os_signpost_id_t v11 = v10;
  os_signpost_id_t v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    int v18 = 67240192;
    LODWORD(v19) = [v6 code];
    _os_signpost_emit_with_name_impl(&dword_193494000, v11, OS_SIGNPOST_INTERVAL_END, v12, "PrivateEmailLocalLookup", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 8u);
  }

  uint64_t v13 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    double v14 = (double)Nanoseconds / 1000000000.0;
    v15 = (void *)a1[6];
    int v16 = [v6 code];
    int v18 = 134218496;
    id v19 = v15;
    __int16 v20 = 2048;
    double v21 = v14;
    __int16 v22 = 1026;
    int v23 = v16;
    _os_log_impl(&dword_193494000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:PrivateEmailLocalLookup  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 0x1Cu);
  }

  if (a1[4])
  {
    id v17 = _AKLogHme();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v6;
      _os_log_impl(&dword_193494000, v17, OS_LOG_TYPE_DEFAULT, "Completed Private Email lookup, error:%@", (uint8_t *)&v18, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }
}

void __69__AKPrivateEmailController_lookupPrivateEmailWithContext_completion___block_invoke_98(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogHme();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__AKPrivateEmailController_lookupPrivateEmailWithContext_completion___block_invoke_98_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchPrivateEmailForAltDSID:(id)a3 withKey:(id)a4 completion:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__7;
  v33[4] = __Block_byref_object_dispose__7;
  os_signpost_id_t v11 = self;
  uint64_t v34 = v11;
  os_signpost_id_t v12 = _os_activity_create(&dword_193494000, "private-email-authkit/fetch-email", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  uint64_t v13 = _AKSignpostLogSystem();
  os_signpost_id_t v14 = _AKSignpostCreate(v13);
  uint64_t v16 = v15;

  id v17 = _AKSignpostLogSystem();
  int v18 = v17;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PrivateEmailRemoteFetch", " enableTelemetry=YES ", buf, 2u);
  }

  id v19 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v36 = v14;
    _os_log_impl(&dword_193494000, v19, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PrivateEmailRemoteFetch  enableTelemetry=YES ", buf, 0xCu);
  }

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __75__AKPrivateEmailController_fetchPrivateEmailForAltDSID_withKey_completion___block_invoke;
  v27[3] = &unk_1E5760DC8;
  v29 = v33;
  os_signpost_id_t v30 = v14;
  uint64_t v31 = v16;
  id v20 = v10;
  id v28 = v20;
  double v21 = (void *)MEMORY[0x1996FE880](v27);
  remoteService = v11->_remoteService;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __75__AKPrivateEmailController_fetchPrivateEmailForAltDSID_withKey_completion___block_invoke_100;
  v25[3] = &unk_1E575EAC0;
  id v23 = v21;
  id v26 = v23;
  uint64_t v24 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v25];
  [v24 fetchPrivateEmailForAltDSID:v8 withKey:v9 completion:v23];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v33, 8);
}

void __75__AKPrivateEmailController_fetchPrivateEmailForAltDSID_withKey_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[5] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  id v10 = _AKSignpostLogSystem();
  os_signpost_id_t v11 = v10;
  os_signpost_id_t v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    int v18 = 67240192;
    LODWORD(v19) = [v6 code];
    _os_signpost_emit_with_name_impl(&dword_193494000, v11, OS_SIGNPOST_INTERVAL_END, v12, "PrivateEmailRemoteFetch", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 8u);
  }

  uint64_t v13 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    double v14 = (double)Nanoseconds / 1000000000.0;
    uint64_t v15 = (void *)a1[6];
    int v16 = [v6 code];
    int v18 = 134218496;
    id v19 = v15;
    __int16 v20 = 2048;
    double v21 = v14;
    __int16 v22 = 1026;
    int v23 = v16;
    _os_log_impl(&dword_193494000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:PrivateEmailRemoteFetch  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 0x1Cu);
  }

  if (a1[4])
  {
    id v17 = _AKLogHme();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v6;
      _os_log_impl(&dword_193494000, v17, OS_LOG_TYPE_DEFAULT, "Completed Private Email fetch, error:%@", (uint8_t *)&v18, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }
}

void __75__AKPrivateEmailController_fetchPrivateEmailForAltDSID_withKey_completion___block_invoke_100(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogHme();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __75__AKPrivateEmailController_fetchPrivateEmailForAltDSID_withKey_completion___block_invoke_100_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)registerPrivateEmailForAltDSID:(id)a3 withKey:(id)a4 completion:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__7;
  v33[4] = __Block_byref_object_dispose__7;
  os_signpost_id_t v11 = self;
  uint64_t v34 = v11;
  os_signpost_id_t v12 = _os_activity_create(&dword_193494000, "private-email-authkit/register-email", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  uint64_t v13 = _AKSignpostLogSystem();
  os_signpost_id_t v14 = _AKSignpostCreate(v13);
  uint64_t v16 = v15;

  id v17 = _AKSignpostLogSystem();
  int v18 = v17;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PrivateEmailRemoteRegister", " enableTelemetry=YES ", buf, 2u);
  }

  id v19 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v36 = v14;
    _os_log_impl(&dword_193494000, v19, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PrivateEmailRemoteRegister  enableTelemetry=YES ", buf, 0xCu);
  }

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __78__AKPrivateEmailController_registerPrivateEmailForAltDSID_withKey_completion___block_invoke;
  v27[3] = &unk_1E5760DC8;
  v29 = v33;
  os_signpost_id_t v30 = v14;
  uint64_t v31 = v16;
  id v20 = v10;
  id v28 = v20;
  double v21 = (void *)MEMORY[0x1996FE880](v27);
  remoteService = v11->_remoteService;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __78__AKPrivateEmailController_registerPrivateEmailForAltDSID_withKey_completion___block_invoke_101;
  v25[3] = &unk_1E575EAC0;
  id v23 = v21;
  id v26 = v23;
  uint64_t v24 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v25];
  [v24 registerPrivateEmailForAltDSID:v8 withKey:v9 completion:v23];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v33, 8);
}

void __78__AKPrivateEmailController_registerPrivateEmailForAltDSID_withKey_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[5] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  id v10 = _AKSignpostLogSystem();
  os_signpost_id_t v11 = v10;
  os_signpost_id_t v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    int v19 = 67240192;
    LODWORD(v20) = [v6 code];
    _os_signpost_emit_with_name_impl(&dword_193494000, v11, OS_SIGNPOST_INTERVAL_END, v12, "PrivateEmailRemoteRegister", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 8u);
  }

  uint64_t v13 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    double v14 = (double)Nanoseconds / 1000000000.0;
    uint64_t v15 = (void *)a1[6];
    int v16 = [v6 code];
    int v19 = 134218496;
    id v20 = v15;
    __int16 v21 = 2048;
    double v22 = v14;
    __int16 v23 = 1026;
    int v24 = v16;
    _os_log_impl(&dword_193494000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:PrivateEmailRemoteRegister  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 0x1Cu);
  }

  id v17 = _AKLogHme();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    id v20 = v6;
    _os_log_impl(&dword_193494000, v17, OS_LOG_TYPE_DEFAULT, "Completed Private Email fetch in background, error:%@", (uint8_t *)&v19, 0xCu);
  }

  uint64_t v18 = a1[4];
  if (v18) {
    (*(void (**)(uint64_t, id, id))(v18 + 16))(v18, v5, v6);
  }
}

void __78__AKPrivateEmailController_registerPrivateEmailForAltDSID_withKey_completion___block_invoke_101(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogHme();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __78__AKPrivateEmailController_registerPrivateEmailForAltDSID_withKey_completion___block_invoke_101_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)registerPrivateEmailWithContext:(id)a3 completion:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__7;
  v30[4] = __Block_byref_object_dispose__7;
  id v8 = self;
  uint64_t v31 = v8;
  id v9 = _os_activity_create(&dword_193494000, "private-email-authkit/register-email", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  id v10 = _AKSignpostLogSystem();
  os_signpost_id_t v11 = _AKSignpostCreate(v10);
  uint64_t v13 = v12;

  double v14 = _AKSignpostLogSystem();
  uint64_t v15 = v14;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PrivateEmailRemoteRegister", " enableTelemetry=YES ", buf, 2u);
  }

  int v16 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v33 = v11;
    _os_log_impl(&dword_193494000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PrivateEmailRemoteRegister  enableTelemetry=YES ", buf, 0xCu);
  }

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __71__AKPrivateEmailController_registerPrivateEmailWithContext_completion___block_invoke;
  v24[3] = &unk_1E5760DC8;
  id v26 = v30;
  os_signpost_id_t v27 = v11;
  uint64_t v28 = v13;
  id v17 = v7;
  id v25 = v17;
  uint64_t v18 = (void *)MEMORY[0x1996FE880](v24);
  remoteService = v8->_remoteService;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __71__AKPrivateEmailController_registerPrivateEmailWithContext_completion___block_invoke_102;
  v22[3] = &unk_1E575EAC0;
  id v20 = v18;
  id v23 = v20;
  __int16 v21 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v22];
  [v21 registerPrivateEmailWithContext:v6 completion:v20];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v30, 8);
}

void __71__AKPrivateEmailController_registerPrivateEmailWithContext_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[5] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  id v10 = _AKSignpostLogSystem();
  os_signpost_id_t v11 = v10;
  os_signpost_id_t v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    int v19 = 67240192;
    LODWORD(v20) = [v6 code];
    _os_signpost_emit_with_name_impl(&dword_193494000, v11, OS_SIGNPOST_INTERVAL_END, v12, "PrivateEmailRemoteRegister", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 8u);
  }

  uint64_t v13 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    double v14 = (double)Nanoseconds / 1000000000.0;
    uint64_t v15 = (void *)a1[6];
    int v16 = [v6 code];
    int v19 = 134218496;
    id v20 = v15;
    __int16 v21 = 2048;
    double v22 = v14;
    __int16 v23 = 1026;
    int v24 = v16;
    _os_log_impl(&dword_193494000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:PrivateEmailRemoteRegister  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 0x1Cu);
  }

  id v17 = _AKLogHme();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    id v20 = v6;
    _os_log_impl(&dword_193494000, v17, OS_LOG_TYPE_DEFAULT, "Completed Private Email fetch in background, error:%@", (uint8_t *)&v19, 0xCu);
  }

  uint64_t v18 = a1[4];
  if (v18) {
    (*(void (**)(uint64_t, id, id))(v18 + 16))(v18, v5, v6);
  }
}

void __71__AKPrivateEmailController_registerPrivateEmailWithContext_completion___block_invoke_102(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogHme();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __71__AKPrivateEmailController_registerPrivateEmailWithContext_completion___block_invoke_102_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchPrivateEmailWithContext:(id)a3 completion:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__7;
  v30[4] = __Block_byref_object_dispose__7;
  id v8 = self;
  uint64_t v31 = v8;
  id v9 = _os_activity_create(&dword_193494000, "private-email-authkit/fetch-with-context", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  id v10 = _AKSignpostLogSystem();
  os_signpost_id_t v11 = _AKSignpostCreate(v10);
  uint64_t v13 = v12;

  double v14 = _AKSignpostLogSystem();
  uint64_t v15 = v14;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PrivateEmailContextFetch", " enableTelemetry=YES ", buf, 2u);
  }

  int v16 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v33 = v11;
    _os_log_impl(&dword_193494000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PrivateEmailContextFetch  enableTelemetry=YES ", buf, 0xCu);
  }

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __68__AKPrivateEmailController_fetchPrivateEmailWithContext_completion___block_invoke;
  v24[3] = &unk_1E5760DC8;
  id v26 = v30;
  os_signpost_id_t v27 = v11;
  uint64_t v28 = v13;
  id v17 = v7;
  id v25 = v17;
  uint64_t v18 = (void *)MEMORY[0x1996FE880](v24);
  remoteService = v8->_remoteService;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __68__AKPrivateEmailController_fetchPrivateEmailWithContext_completion___block_invoke_103;
  v22[3] = &unk_1E575EAC0;
  id v20 = v18;
  id v23 = v20;
  __int16 v21 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v22];
  [v21 fetchPrivateEmailWithContext:v6 completion:v20];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v30, 8);
}

void __68__AKPrivateEmailController_fetchPrivateEmailWithContext_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[5] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  id v10 = _AKSignpostLogSystem();
  os_signpost_id_t v11 = v10;
  os_signpost_id_t v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    int v18 = 67240192;
    LODWORD(v19) = [v6 code];
    _os_signpost_emit_with_name_impl(&dword_193494000, v11, OS_SIGNPOST_INTERVAL_END, v12, "PrivateEmailContextFetch", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 8u);
  }

  uint64_t v13 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    double v14 = (double)Nanoseconds / 1000000000.0;
    uint64_t v15 = (void *)a1[6];
    int v16 = [v6 code];
    int v18 = 134218496;
    id v19 = v15;
    __int16 v20 = 2048;
    double v21 = v14;
    __int16 v22 = 1026;
    int v23 = v16;
    _os_log_impl(&dword_193494000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:PrivateEmailContextFetch  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 0x1Cu);
  }

  if (a1[4])
  {
    id v17 = _AKLogHme();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v6;
      _os_log_impl(&dword_193494000, v17, OS_LOG_TYPE_DEFAULT, "Completed Private Email context fetch, error:%@", (uint8_t *)&v18, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }
}

void __68__AKPrivateEmailController_fetchPrivateEmailWithContext_completion___block_invoke_103(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogHme();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __68__AKPrivateEmailController_fetchPrivateEmailWithContext_completion___block_invoke_103_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getContextForRequestContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_193494000, "authkit/PrivateEmailContext", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__7;
  v20[4] = __Block_byref_object_dispose__7;
  id v9 = self;
  double v21 = v9;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__AKPrivateEmailController_getContextForRequestContext_completion___block_invoke;
  v17[3] = &unk_1E5760DF0;
  id v10 = v7;
  id v18 = v10;
  id v19 = v20;
  os_signpost_id_t v11 = (void *)MEMORY[0x1996FE880](v17);
  remoteService = v9->_remoteService;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__AKPrivateEmailController_getContextForRequestContext_completion___block_invoke_105;
  v15[3] = &unk_1E575EAC0;
  id v13 = v11;
  id v16 = v13;
  double v14 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v15];
  [v14 getContextForRequestContext:v6 completion:v13];

  _Block_object_dispose(v20, 8);
  os_activity_scope_leave(&state);
}

void __67__AKPrivateEmailController_getContextForRequestContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _AKLogHme();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_193494000, v8, OS_LOG_TYPE_DEFAULT, "getContext completed with context: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __67__AKPrivateEmailController_getContextForRequestContext_completion___block_invoke_cold_1((uint64_t)v6, v8);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0;
}

void __67__AKPrivateEmailController_getContextForRequestContext_completion___block_invoke_105(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogHme();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __67__AKPrivateEmailController_getContextForRequestContext_completion___block_invoke_105_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deletePrivateEmailDatabaseWithCompletion:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__7;
  void v27[4] = __Block_byref_object_dispose__7;
  id v5 = self;
  uint64_t v28 = v5;
  id v6 = _os_activity_create(&dword_193494000, "private-email-authkit/delete-db", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  id v7 = _AKSignpostLogSystem();
  os_signpost_id_t v8 = _AKSignpostCreate(v7);
  uint64_t v10 = v9;

  int v11 = _AKSignpostLogSystem();
  id v12 = v11;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PrivateEmailDeleteDatabase", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v13 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v30 = v8;
    _os_log_impl(&dword_193494000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PrivateEmailDeleteDatabase  enableTelemetry=YES ", buf, 0xCu);
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __69__AKPrivateEmailController_deletePrivateEmailDatabaseWithCompletion___block_invoke;
  v21[3] = &unk_1E5760E18;
  int v23 = v27;
  os_signpost_id_t v24 = v8;
  uint64_t v25 = v10;
  id v14 = v4;
  id v22 = v14;
  uint64_t v15 = (void *)MEMORY[0x1996FE880](v21);
  remoteService = v5->_remoteService;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __69__AKPrivateEmailController_deletePrivateEmailDatabaseWithCompletion___block_invoke_107;
  v19[3] = &unk_1E575EAC0;
  id v17 = v15;
  id v20 = v17;
  id v18 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v19];
  [v18 deletePrivateEmailDatabaseWithCompletion:v17];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v27, 8);
}

void __69__AKPrivateEmailController_deletePrivateEmailDatabaseWithCompletion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *(void *)(a1[5] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  uint64_t v9 = _AKSignpostLogSystem();
  uint64_t v10 = v9;
  os_signpost_id_t v11 = a1[6];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v17 = 67240192;
    LODWORD(v18) = [v5 code];
    _os_signpost_emit_with_name_impl(&dword_193494000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PrivateEmailDeleteDatabase", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }

  id v12 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    double v13 = (double)Nanoseconds / 1000000000.0;
    uint64_t v14 = a1[6];
    int v15 = [v5 code];
    int v17 = 134218496;
    uint64_t v18 = v14;
    __int16 v19 = 2048;
    double v20 = v13;
    __int16 v21 = 1026;
    int v22 = v15;
    _os_log_impl(&dword_193494000, v12, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:PrivateEmailDeleteDatabase  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }

  uint64_t v16 = a1[4];
  if (v16) {
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);
  }
}

void __69__AKPrivateEmailController_deletePrivateEmailDatabaseWithCompletion___block_invoke_107(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogHme();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__AKPrivateEmailController_deletePrivateEmailDatabaseWithCompletion___block_invoke_107_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)privateEmailListVersionWithCompletion:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__7;
  void v27[4] = __Block_byref_object_dispose__7;
  id v5 = self;
  uint64_t v28 = v5;
  uint64_t v6 = _os_activity_create(&dword_193494000, "private-email-authkit/list-version", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  id v7 = _AKSignpostLogSystem();
  os_signpost_id_t v8 = _AKSignpostCreate(v7);
  uint64_t v10 = v9;

  os_signpost_id_t v11 = _AKSignpostLogSystem();
  id v12 = v11;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PrivateEmailListVersion", " enableTelemetry=YES ", buf, 2u);
  }

  double v13 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v30 = v8;
    _os_log_impl(&dword_193494000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PrivateEmailListVersion  enableTelemetry=YES ", buf, 0xCu);
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __66__AKPrivateEmailController_privateEmailListVersionWithCompletion___block_invoke;
  v21[3] = &unk_1E5760E40;
  uint64_t v23 = v27;
  os_signpost_id_t v24 = v8;
  uint64_t v25 = v10;
  id v14 = v4;
  id v22 = v14;
  int v15 = (void *)MEMORY[0x1996FE880](v21);
  remoteService = v5->_remoteService;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __66__AKPrivateEmailController_privateEmailListVersionWithCompletion___block_invoke_109;
  v19[3] = &unk_1E575EAC0;
  id v17 = v15;
  id v20 = v17;
  uint64_t v18 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v19];
  [v18 privateEmailListVersionWithCompletion:v17];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v27, 8);
}

void __66__AKPrivateEmailController_privateEmailListVersionWithCompletion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[5] + 8);
  os_signpost_id_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  uint64_t v10 = _AKSignpostLogSystem();
  os_signpost_id_t v11 = v10;
  os_signpost_id_t v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    int v18 = 67240192;
    LODWORD(v19) = [v6 code];
    _os_signpost_emit_with_name_impl(&dword_193494000, v11, OS_SIGNPOST_INTERVAL_END, v12, "PrivateEmailListVersion", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 8u);
  }

  double v13 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    double v14 = (double)Nanoseconds / 1000000000.0;
    uint64_t v15 = a1[6];
    int v16 = [v6 code];
    int v18 = 134218496;
    uint64_t v19 = v15;
    __int16 v20 = 2048;
    double v21 = v14;
    __int16 v22 = 1026;
    int v23 = v16;
    _os_log_impl(&dword_193494000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:PrivateEmailListVersion  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 0x1Cu);
  }

  uint64_t v17 = a1[4];
  if (v17) {
    (*(void (**)(uint64_t, id, id))(v17 + 16))(v17, v5, v6);
  }
}

void __66__AKPrivateEmailController_privateEmailListVersionWithCompletion___block_invoke_109(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogHme();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __66__AKPrivateEmailController_privateEmailListVersionWithCompletion___block_invoke_109_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removePrivateEmailKey:(id)a3 completion:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__7;
  v30[4] = __Block_byref_object_dispose__7;
  os_signpost_id_t v8 = self;
  uint64_t v31 = v8;
  uint64_t v9 = _os_activity_create(&dword_193494000, "private-email-authkit/remove-key", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  uint64_t v10 = _AKSignpostLogSystem();
  os_signpost_id_t v11 = _AKSignpostCreate(v10);
  uint64_t v13 = v12;

  double v14 = _AKSignpostLogSystem();
  uint64_t v15 = v14;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PrivateEmailRemoveKey", " enableTelemetry=YES ", buf, 2u);
  }

  int v16 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v33 = v11;
    _os_log_impl(&dword_193494000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PrivateEmailRemoveKey  enableTelemetry=YES ", buf, 0xCu);
  }

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __61__AKPrivateEmailController_removePrivateEmailKey_completion___block_invoke;
  v24[3] = &unk_1E5760E68;
  id v26 = v30;
  os_signpost_id_t v27 = v11;
  uint64_t v28 = v13;
  id v17 = v7;
  id v25 = v17;
  int v18 = (void *)MEMORY[0x1996FE880](v24);
  remoteService = v8->_remoteService;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __61__AKPrivateEmailController_removePrivateEmailKey_completion___block_invoke_110;
  v22[3] = &unk_1E575EAC0;
  id v20 = v18;
  id v23 = v20;
  double v21 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v22];
  [v21 removePrivateEmailKey:v6 completion:v20];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v30, 8);
}

void __61__AKPrivateEmailController_removePrivateEmailKey_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  id v7 = _AKSignpostLogSystem();
  os_signpost_id_t v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v15 = 67240192;
    LODWORD(v16) = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_193494000, v8, OS_SIGNPOST_INTERVAL_END, v9, "PrivateEmailRemoveKey", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v15, 8u);
  }

  uint64_t v10 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = (double)Nanoseconds / 1000000000.0;
    uint64_t v12 = a1[6];
    int v13 = [v3 code];
    int v15 = 134218496;
    uint64_t v16 = v12;
    __int16 v17 = 2048;
    double v18 = v11;
    __int16 v19 = 1026;
    int v20 = v13;
    _os_log_impl(&dword_193494000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:PrivateEmailRemoveKey  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v15, 0x1Cu);
  }

  uint64_t v14 = a1[4];
  if (v14) {
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v3);
  }
}

void __61__AKPrivateEmailController_removePrivateEmailKey_completion___block_invoke_110(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AKLogHme();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61__AKPrivateEmailController_removePrivateEmailKey_completion___block_invoke_110_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)listAllPrivateEmailsForAltDSID:(id)a3 completion:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__7;
  v30[4] = __Block_byref_object_dispose__7;
  os_signpost_id_t v8 = self;
  uint64_t v31 = v8;
  os_signpost_id_t v9 = _os_activity_create(&dword_193494000, "private-email-authkit/fetch-email-list", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  uint64_t v10 = _AKSignpostLogSystem();
  os_signpost_id_t v11 = _AKSignpostCreate(v10);
  uint64_t v13 = v12;

  uint64_t v14 = _AKSignpostLogSystem();
  int v15 = v14;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PrivateEmailLocalFetchAll", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v16 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v33 = v11;
    _os_log_impl(&dword_193494000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PrivateEmailLocalFetchAll  enableTelemetry=YES ", buf, 0xCu);
  }

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __70__AKPrivateEmailController_listAllPrivateEmailsForAltDSID_completion___block_invoke;
  v24[3] = &unk_1E5760E90;
  id v26 = v30;
  os_signpost_id_t v27 = v11;
  uint64_t v28 = v13;
  id v17 = v7;
  id v25 = v17;
  double v18 = (void *)MEMORY[0x1996FE880](v24);
  remoteService = v8->_remoteService;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __70__AKPrivateEmailController_listAllPrivateEmailsForAltDSID_completion___block_invoke_112;
  v22[3] = &unk_1E575EAC0;
  id v20 = v18;
  id v23 = v20;
  uint64_t v21 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v22];
  [v21 listAllPrivateEmailsForAltDSID:v6 completion:v20];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v30, 8);
}

void __70__AKPrivateEmailController_listAllPrivateEmailsForAltDSID_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[5] + 8);
  os_signpost_id_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  uint64_t v10 = _AKSignpostLogSystem();
  os_signpost_id_t v11 = v10;
  os_signpost_id_t v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    int v20 = 67240192;
    LODWORD(v21) = [v6 code];
    _os_signpost_emit_with_name_impl(&dword_193494000, v11, OS_SIGNPOST_INTERVAL_END, v12, "PrivateEmailLocalFetchAll", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 8u);
  }

  uint64_t v13 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    double v14 = (double)Nanoseconds / 1000000000.0;
    uint64_t v15 = a1[6];
    int v16 = [v6 code];
    int v20 = 134218496;
    uint64_t v21 = v15;
    __int16 v22 = 2048;
    double v23 = v14;
    __int16 v24 = 1026;
    int v25 = v16;
    _os_log_impl(&dword_193494000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:PrivateEmailLocalFetchAll  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 0x1Cu);
  }

  id v17 = _AKLogHme();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = [v5 count];
    int v20 = 134218242;
    uint64_t v21 = v18;
    __int16 v22 = 2112;
    double v23 = *(double *)&v6;
    _os_log_impl(&dword_193494000, v17, OS_LOG_TYPE_DEFAULT, "Completed Fetch Private Email list with %lu addresses, error:%@", (uint8_t *)&v20, 0x16u);
  }

  uint64_t v19 = a1[4];
  if (v19) {
    (*(void (**)(uint64_t, id, id))(v19 + 16))(v19, v5, v6);
  }
}

void __70__AKPrivateEmailController_listAllPrivateEmailsForAltDSID_completion___block_invoke_112(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AKLogHme();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __70__AKPrivateEmailController_listAllPrivateEmailsForAltDSID_completion___block_invoke_112_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchSignInWithApplePrivateEmailWithContext:(id)a3 completion:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__7;
  v30[4] = __Block_byref_object_dispose__7;
  os_signpost_id_t v8 = self;
  uint64_t v31 = v8;
  os_signpost_id_t v9 = _os_activity_create(&dword_193494000, "private-email-authkit/fetch-siwahme-with-context", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  uint64_t v10 = _AKSignpostLogSystem();
  os_signpost_id_t v11 = _AKSignpostCreate(v10);
  uint64_t v13 = v12;

  double v14 = _AKSignpostLogSystem();
  uint64_t v15 = v14;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PrivateEmailFetchSiwaHme", " enableTelemetry=YES ", buf, 2u);
  }

  int v16 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v33 = v11;
    _os_log_impl(&dword_193494000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PrivateEmailFetchSiwaHme  enableTelemetry=YES ", buf, 0xCu);
  }

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __83__AKPrivateEmailController_fetchSignInWithApplePrivateEmailWithContext_completion___block_invoke;
  v24[3] = &unk_1E5760DC8;
  uint64_t v26 = v30;
  os_signpost_id_t v27 = v11;
  uint64_t v28 = v13;
  id v17 = v7;
  id v25 = v17;
  uint64_t v18 = (void *)MEMORY[0x1996FE880](v24);
  remoteService = v8->_remoteService;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __83__AKPrivateEmailController_fetchSignInWithApplePrivateEmailWithContext_completion___block_invoke_113;
  v22[3] = &unk_1E575EAC0;
  id v20 = v18;
  id v23 = v20;
  uint64_t v21 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v22];
  [v21 fetchSignInWithApplePrivateEmailWithContext:v6 completion:v20];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v30, 8);
}

void __83__AKPrivateEmailController_fetchSignInWithApplePrivateEmailWithContext_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[5] + 8);
  os_signpost_id_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  uint64_t v10 = _AKSignpostLogSystem();
  os_signpost_id_t v11 = v10;
  os_signpost_id_t v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    int v18 = 67240192;
    LODWORD(v19) = [v6 code];
    _os_signpost_emit_with_name_impl(&dword_193494000, v11, OS_SIGNPOST_INTERVAL_END, v12, "PrivateEmailFetchSiwaHme", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 8u);
  }

  uint64_t v13 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    double v14 = (double)Nanoseconds / 1000000000.0;
    uint64_t v15 = (void *)a1[6];
    int v16 = [v6 code];
    int v18 = 134218496;
    id v19 = v15;
    __int16 v20 = 2048;
    double v21 = v14;
    __int16 v22 = 1026;
    int v23 = v16;
    _os_log_impl(&dword_193494000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:PrivateEmailFetchSiwaHme  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 0x1Cu);
  }

  if (a1[4])
  {
    id v17 = _AKLogHme();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v6;
      _os_log_impl(&dword_193494000, v17, OS_LOG_TYPE_DEFAULT, "Completed fetch SiWA Private Email, error:%@", (uint8_t *)&v18, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }
}

void __83__AKPrivateEmailController_fetchSignInWithApplePrivateEmailWithContext_completion___block_invoke_113(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AKLogHme();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __83__AKPrivateEmailController_fetchSignInWithApplePrivateEmailWithContext_completion___block_invoke_113_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (AAFXPCSession)remoteService
{
  return self->_remoteService;
}

- (void)setRemoteService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteService, 0);

  objc_storeStrong((id *)&self->_clientImpl, 0);
}

void __69__AKPrivateEmailController_lookupPrivateEmailWithContext_completion___block_invoke_98_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_193494000, v0, v1, "Connection to private email service to %s returned an error: %@", v2, v3, v4, v5, 2u);
}

void __75__AKPrivateEmailController_fetchPrivateEmailForAltDSID_withKey_completion___block_invoke_100_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_193494000, v0, v1, "Connection to private email service to %s returned an error: %@", v2, v3, v4, v5, 2u);
}

void __78__AKPrivateEmailController_registerPrivateEmailForAltDSID_withKey_completion___block_invoke_101_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_193494000, v0, v1, "Connection to private email service to %s returned an error: %@", v2, v3, v4, v5, 2u);
}

void __71__AKPrivateEmailController_registerPrivateEmailWithContext_completion___block_invoke_102_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_193494000, v0, v1, "Connection to private email service to %s returned an error: %@", v2, v3, v4, v5, 2u);
}

void __68__AKPrivateEmailController_fetchPrivateEmailWithContext_completion___block_invoke_103_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_193494000, v0, v1, "Connection to private email service to %s returned an error: %@", v2, v3, v4, v5, 2u);
}

void __67__AKPrivateEmailController_getContextForRequestContext_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_193494000, a2, OS_LOG_TYPE_ERROR, "getContext failed: %@", (uint8_t *)&v2, 0xCu);
}

void __67__AKPrivateEmailController_getContextForRequestContext_completion___block_invoke_105_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_193494000, v0, v1, "Connection to private email service to %s returned an error: %@", v2, v3, v4, v5, 2u);
}

void __69__AKPrivateEmailController_deletePrivateEmailDatabaseWithCompletion___block_invoke_107_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_193494000, v0, v1, "Connection to private email service to %s returned an error: %@", v2, v3, v4, v5, 2u);
}

void __66__AKPrivateEmailController_privateEmailListVersionWithCompletion___block_invoke_109_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_193494000, v0, v1, "Connection to private email service to %s returned an error: %@", v2, v3, v4, v5, 2u);
}

void __61__AKPrivateEmailController_removePrivateEmailKey_completion___block_invoke_110_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_193494000, v0, v1, "Connection to private email service to %s returned an error: %@", v2, v3, v4, v5, 2u);
}

void __70__AKPrivateEmailController_listAllPrivateEmailsForAltDSID_completion___block_invoke_112_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_193494000, v0, v1, "Connection to private email service to %s returned an error: %@", v2, v3, v4, v5, 2u);
}

void __83__AKPrivateEmailController_fetchSignInWithApplePrivateEmailWithContext_completion___block_invoke_113_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_193494000, v0, v1, "Connection to private email service to %s returned an error: %@", v2, v3, v4, v5, 2u);
}

@end