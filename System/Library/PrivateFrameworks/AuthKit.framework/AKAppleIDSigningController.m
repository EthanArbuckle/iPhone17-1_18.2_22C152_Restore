@interface AKAppleIDSigningController
- (AKAppleIDAuthenticationController)authenticationController;
- (AKAppleIDSigningController)init;
- (AKAppleIDSigningController)initWithDaemonXPCEndpoint:(id)a3;
- (BOOL)isProxy;
- (BOOL)shouldSendAbsintheHeader;
- (NSString)initialURLKey;
- (id)_connection;
- (id)_parseDERCertificatesFromChain:(id)a3 error:(id *)a4;
- (void)_additionalAbsintheHeadersForRequest:(id)a3 completion:(id)a4;
- (void)_additionalAttestationHeadersForRequest:(id)a3 options:(id)a4 completion:(id)a5;
- (void)_connectionInterrupted;
- (void)_connectionInvalidated;
- (void)absintheSignatureForData:(id)a3 completion:(id)a4;
- (void)attestationDataForRequest:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)setAuthenticationController:(id)a3;
- (void)setInitialURLKey:(id)a3;
- (void)setIsProxy:(BOOL)a3;
- (void)setShouldSendAbsintheHeader:(BOOL)a3;
- (void)signWithBAAHeaders:(id)a3 completion:(id)a4;
- (void)signaturesForData:(id)a3 options:(id)a4 completion:(id)a5;
- (void)signingHeadersForRequest:(id)a3 completion:(id)a4;
@end

@implementation AKAppleIDSigningController

- (AKAppleIDSigningController)init
{
  return [(AKAppleIDSigningController *)self initWithDaemonXPCEndpoint:0];
}

- (AKAppleIDSigningController)initWithDaemonXPCEndpoint:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AKAppleIDSigningController;
  v6 = [(AKAppleIDSigningController *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_listenerEndpoint, a3);
    v8 = objc_alloc_init(AKAppleIDAuthenticationController);
    authenticationController = v7->_authenticationController;
    v7->_authenticationController = v8;

    v7->_signerLock._os_unfair_lock_opaque = 0;
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.authkit.signingQ", v10);
    signingQueue = v7->_signingQueue;
    v7->_signingQueue = (OS_dispatch_queue *)v11;
  }
  return v7;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AKAppleIDSigningController;
  [(AKAppleIDSigningController *)&v3 dealloc];
}

- (id)_connection
{
  p_signerLock = &self->_signerLock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__AKAppleIDSigningController__connection__block_invoke;
  v5[3] = &unk_1E575FA90;
  v5[4] = self;
  os_unfair_lock_lock(&self->_signerLock);
  objc_super v3 = __41__AKAppleIDSigningController__connection__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_signerLock);

  return v3;
}

id __41__AKAppleIDSigningController__connection__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  objc_super v3 = (void *)v2[4];
  if (!v3)
  {
    objc_initWeak(&location, v2);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __41__AKAppleIDSigningController__connection__block_invoke_2;
    v20[3] = &unk_1E575FA90;
    v20[4] = *(void *)(a1 + 32);
    v4 = (void (**)(void))MEMORY[0x1996FE880](v20);
    uint64_t v5 = v4[2]();
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 32);
    *(void *)(v6 + 32) = v5;

    v8 = *(void **)(*(void *)(a1 + 32) + 32);
    v9 = +[AKAppleIDSigningDaemonInterface XPCInterface];
    [v8 setRemoteObjectInterface:v9];

    v10 = *(void **)(*(void *)(a1 + 32) + 32);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __41__AKAppleIDSigningController__connection__block_invoke_3;
    v18[3] = &unk_1E575EA98;
    objc_copyWeak(&v19, &location);
    [v10 setInterruptionHandler:v18];
    dispatch_queue_t v11 = *(void **)(*(void *)(a1 + 32) + 32);
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __41__AKAppleIDSigningController__connection__block_invoke_4;
    v16 = &unk_1E575EA98;
    objc_copyWeak(&v17, &location);
    [v11 setInvalidationHandler:&v13];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "resume", v13, v14, v15, v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);

    objc_destroyWeak(&location);
    objc_super v3 = *(void **)(*(void *)(a1 + 32) + 32);
  }

  return v3;
}

id __41__AKAppleIDSigningController__connection__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 24);
  id v3 = objc_alloc(MEMORY[0x1E4F29268]);
  if (v2) {
    v4 = (void *)[v3 initWithListenerEndpoint:*(void *)(*(void *)(a1 + 32) + 24)];
  }
  else {
    v4 = (void *)[v3 initWithMachServiceName:@"com.apple.ak.anisette.xpc" options:0];
  }

  return v4;
}

void __41__AKAppleIDSigningController__connection__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInterrupted];
}

void __41__AKAppleIDSigningController__connection__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInvalidated];
}

- (void)_connectionInterrupted
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Connection to akd signer was interrupted!", v2, v3, v4, v5, v6);
}

void __52__AKAppleIDSigningController__connectionInterrupted__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;
}

- (void)_connectionInvalidated
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Connection to akd signer was invalidated: this is fine.™", v2, v3, v4, v5, v6);
}

void __52__AKAppleIDSigningController__connectionInvalidated__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = 0;
}

- (void)absintheSignatureForData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_193494000, "authkit/absinthe-signature-for-data", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __66__AKAppleIDSigningController_absintheSignatureForData_completion___block_invoke;
  v19[3] = &unk_1E5760738;
  v19[4] = self;
  id v9 = v7;
  id v20 = v9;
  v10 = (void *)MEMORY[0x1996FE880](v19);
  dispatch_queue_t v11 = [(AKAppleIDSigningController *)self _connection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __66__AKAppleIDSigningController_absintheSignatureForData_completion___block_invoke_2;
  v17[3] = &unk_1E575EAC0;
  id v12 = v10;
  id v18 = v12;
  uint64_t v13 = [v11 remoteObjectProxyWithErrorHandler:v17];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__AKAppleIDSigningController_absintheSignatureForData_completion___block_invoke_103;
  v15[3] = &unk_1E5760760;
  id v14 = v12;
  id v16 = v14;
  [v13 absintheSignatureForData:v6 completion:v15];

  os_activity_scope_leave(&state);
}

uint64_t __66__AKAppleIDSigningController_absintheSignatureForData_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __66__AKAppleIDSigningController_absintheSignatureForData_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __66__AKAppleIDSigningController_absintheSignatureForData_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66__AKAppleIDSigningController_absintheSignatureForData_completion___block_invoke_103(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = _AKLogSystem();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __66__AKAppleIDSigningController_absintheSignatureForData_completion___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    __66__AKAppleIDSigningController_absintheSignatureForData_completion___block_invoke_103_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)signaturesForData:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_t v11 = _os_activity_create(&dword_193494000, "authkit/signatures-for-data", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __67__AKAppleIDSigningController_signaturesForData_options_completion___block_invoke;
  v22[3] = &unk_1E5760788;
  v22[4] = self;
  id v12 = v10;
  id v23 = v12;
  uint64_t v13 = (void *)MEMORY[0x1996FE880](v22);
  id v14 = [(AKAppleIDSigningController *)self _connection];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __67__AKAppleIDSigningController_signaturesForData_options_completion___block_invoke_2;
  v20[3] = &unk_1E575EAC0;
  id v15 = v13;
  id v21 = v15;
  id v16 = [v14 remoteObjectProxyWithErrorHandler:v20];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __67__AKAppleIDSigningController_signaturesForData_options_completion___block_invoke_105;
  v18[3] = &unk_1E575F948;
  id v17 = v15;
  id v19 = v17;
  [v16 signaturesForData:v8 options:v9 completion:v18];

  os_activity_scope_leave(&state);
}

uint64_t __67__AKAppleIDSigningController_signaturesForData_options_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __67__AKAppleIDSigningController_signaturesForData_options_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __66__AKAppleIDSigningController_absintheSignatureForData_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__AKAppleIDSigningController_signaturesForData_options_completion___block_invoke_105(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id v10 = _AKLogSystem();
  dispatch_queue_t v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __66__AKAppleIDSigningController_absintheSignatureForData_completion___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    __66__AKAppleIDSigningController_absintheSignatureForData_completion___block_invoke_103_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)attestationDataForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDSigningController attestationDataForRequest:completion:]();
  }

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__AKAppleIDSigningController_attestationDataForRequest_completion___block_invoke;
  v10[3] = &unk_1E575F898;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [(AKAppleIDSigningController *)self signingHeadersForRequest:v6 completion:v10];
}

void __67__AKAppleIDSigningController_attestationDataForRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _AKLogSystem();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __67__AKAppleIDSigningController_attestationDataForRequest_completion___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v12 = 138412546;
    uint64_t v13 = v9;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_193494000, v8, OS_LOG_TYPE_DEFAULT, "%@: Generated additional headers for attestation (%@)", (uint8_t *)&v12, 0x16u);
  }

  id v10 = [[AKAttestationData alloc] initWithDictionary:v5];
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, AKAttestationData *, id))(v11 + 16))(v11, v10, v6);
  }
}

- (BOOL)isProxy
{
  return self->_isProxy;
}

- (void)setIsProxy:(BOOL)a3
{
  self->_isProxy = a3;
}

- (NSString)initialURLKey
{
  return self->_initialURLKey;
}

- (void)setInitialURLKey:(id)a3
{
}

- (AKAppleIDAuthenticationController)authenticationController
{
  return self->_authenticationController;
}

- (void)setAuthenticationController:(id)a3
{
}

- (BOOL)shouldSendAbsintheHeader
{
  return self->_shouldSendAbsintheHeader;
}

- (void)setShouldSendAbsintheHeader:(BOOL)a3
{
  self->_shouldSendAbsintheHeader = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationController, 0);
  objc_storeStrong((id *)&self->_initialURLKey, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);

  objc_storeStrong((id *)&self->_signingQueue, 0);
}

- (void)signingHeadersForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AKAppleIDSigningController *)self authenticationController];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke;
  v11[3] = &unk_1E57608C8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 fetchURLBagForAltDSID:0 completion:v11];
}

void __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    dispatch_group_t v7 = dispatch_group_create();
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objc_initWeak(location, *(id *)(a1 + 32));
    *(void *)buf = 0;
    v54 = buf;
    uint64_t v55 = 0x2020000000;
    char v56 = 0;
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_155;
    v46[3] = &unk_1E5760800;
    v51 = buf;
    id v9 = v7;
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(a1 + 40);
    v47 = v9;
    uint64_t v48 = v10;
    id v49 = v11;
    objc_copyWeak(&v52, location);
    id v12 = v8;
    id v50 = v12;
    id v13 = (void *)MEMORY[0x1996FE880](v46);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_157;
    v38[3] = &unk_1E5760878;
    __int16 v14 = v9;
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(void **)(a1 + 40);
    group = v14;
    v39 = v14;
    uint64_t v40 = v15;
    id v41 = v16;
    objc_copyWeak(&v45, location);
    id v17 = v12;
    id v42 = v17;
    id v43 = v6;
    id v18 = v13;
    id v44 = v18;
    id v19 = (void (**)(void, void))MEMORY[0x1996FE880](v38);
    objc_opt_class();
    id v20 = [v5 objectForKeyedSubscript:@"cfgs"];
    id v33 = v6;
    if (objc_opt_isKindOfClass()) {
      id v21 = v20;
    }
    else {
      id v21 = 0;
    }

    objc_opt_class();
    id v23 = [v21 objectForKeyedSubscript:@"abs-enable"];
    if (objc_opt_isKindOfClass()) {
      id v24 = v23;
    }
    else {
      id v24 = 0;
    }

    if (v24)
    {
      v18[2](v18);
    }
    else
    {
      v25 = _AKLogSystem();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_cold_2();
      }
    }
    objc_opt_class();
    id v26 = [v21 objectForKeyedSubscript:@"baa-interval"];
    if (objc_opt_isKindOfClass()) {
      id v27 = v26;
    }
    else {
      id v27 = 0;
    }

    v28 = [MEMORY[0x1E4F1CA60] dictionary];
    v29 = v28;
    if (v27)
    {
      [v28 setObject:v27 forKeyedSubscript:@"AKAttestationSignerValidity"];
      ((void (**)(void, void *))v19)[2](v19, v29);
    }
    else
    {
      v30 = _AKLogSystem();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_cold_1();
      }

      if (!v24) {
        v18[2](v18);
      }
    }
    v31 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_162;
    block[3] = &unk_1E57608A0;
    id v36 = v17;
    id v37 = *(id *)(a1 + 48);
    id v32 = v17;
    dispatch_group_notify(group, v31, block);

    objc_destroyWeak(&v45);
    objc_destroyWeak(&v52);

    _Block_object_dispose(buf, 8);
    objc_destroyWeak(location);

    id v6 = v33;
  }
  else
  {
    v22 = _AKLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193494000, v22, OS_LOG_TYPE_DEFAULT, "urlBag not present", buf, 2u);
    }

    [*(id *)(a1 + 32) _additionalAbsintheHeadersForRequest:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
}

void __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_155(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 64) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_2;
    v5[3] = &unk_1E57607D8;
    objc_copyWeak(&v8, (id *)(a1 + 72));
    id v6 = *(id *)(a1 + 56);
    id v7 = *(id *)(a1 + 32);
    [v3 _additionalAbsintheHeadersForRequest:v4 completion:v5];

    objc_destroyWeak(&v8);
  }
}

void __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v8 = WeakRetained[2];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_3;
  block[3] = &unk_1E57607B0;
  id v12 = v5;
  id v13 = a1[4];
  id v14 = v6;
  uint64_t v15 = WeakRetained;
  id v16 = a1[5];
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, block);
}

void __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_3_cold_2(a1);
  }

  if (*(void *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "addEntriesFromDictionary:");
  }
  else
  {
    id v3 = _AKLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_3_cold_1();
    }

    uint64_t v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "code"));
    id v5 = [v4 stringValue];
    if (*(unsigned char *)(*(void *)(a1 + 56) + 40)) {
      id v6 = @"X-MMe-Proxied-Nas-E";
    }
    else {
      id v6 = @"X-MMe-Nas-E";
    }
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v6];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_157(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_157_cold_1();
  }

  id v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_158;
  v9[3] = &unk_1E5760850;
  objc_copyWeak(&v15, (id *)(a1 + 80));
  id v10 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 40);
  id v11 = v7;
  uint64_t v12 = v8;
  id v14 = *(id *)(a1 + 72);
  id v13 = *(id *)(a1 + 32);
  [v5 _additionalAttestationHeadersForRequest:v6 options:v3 completion:v9];

  objc_destroyWeak(&v15);
}

void __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_158(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v8 = WeakRetained[2];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_2_159;
  block[3] = &unk_1E5760828;
  id v14 = v5;
  id v15 = *(id *)(a1 + 32);
  id v16 = v6;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  id v17 = v9;
  uint64_t v18 = v10;
  id v20 = *(id *)(a1 + 64);
  id v19 = *(id *)(a1 + 56);
  id v11 = v6;
  id v12 = v5;
  dispatch_async(v8, block);
}

void __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_2_159(uint64_t a1)
{
  uint64_t v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_2_159_cold_2(a1);
  }

  if (*(void *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "addEntriesFromDictionary:");
  }
  else
  {
    id v3 = _AKLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_2_159_cold_1();
    }

    uint64_t v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 56), "code"));
    id v5 = [v4 stringValue];

    id v6 = [*(id *)(a1 + 56) underlyingErrors];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      uint64_t v8 = NSNumber;
      id v9 = [*(id *)(a1 + 56) underlyingErrors];
      uint64_t v10 = [v9 firstObject];
      id v11 = objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v10, "code"));
      uint64_t v12 = [v11 stringValue];

      id v5 = (void *)v12;
    }
    if (*(unsigned char *)(*(void *)(a1 + 64) + 40)) {
      id v13 = @"X-Apple-Proxied-Baa-E";
    }
    else {
      id v13 = @"X-Apple-Baa-E";
    }
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v13];
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_162(uint64_t a1)
{
  uint64_t v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_162_cold_1(a1);
  }

  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = (void *)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, void *, void))(v3 + 16))(v3, v4, 0);
}

- (void)signWithBAAHeaders:(id)a3 completion:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v14 = @"AKAttestationUseDeviceCheckKeychainAccess";
  v15[0] = &unk_1EE43E8F0;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke;
  v11[3] = &unk_1E57608C8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(AKAppleIDSigningController *)self _additionalAttestationHeadersForRequest:v10 options:v8 completion:v11];
}

void __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke_2;
  block[3] = &unk_1E5760918;
  id v13 = v5;
  id v14 = v6;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v15 = v8;
  uint64_t v16 = v9;
  id v17 = *(id *)(a1 + 48);
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

void __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke_2(uint64_t a1)
{
  v79[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = v2;
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(v2, "addEntriesFromDictionary:");
  }
  else
  {
    uint64_t v4 = _AKLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke_2_cold_7();
    }

    id v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "code"));
    id v6 = [v5 stringValue];

    id v7 = [*(id *)(a1 + 40) underlyingErrors];
    BOOL v8 = [v7 count] == 0;

    if (!v8)
    {
      uint64_t v9 = NSNumber;
      id v10 = [*(id *)(a1 + 40) underlyingErrors];
      id v11 = [v10 firstObject];
      id v12 = objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v11, "code"));
      uint64_t v13 = [v12 stringValue];

      id v6 = (void *)v13;
    }
    [v3 setObject:v6 forKeyedSubscript:@"X-Apple-Baa-E"];
    id v14 = objc_msgSend(*(id *)(a1 + 40), "ak_allUnderlyingErrors");
    id v15 = [MEMORY[0x1E4F1CA48] array];
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke_165;
    v67[3] = &unk_1E57608F0;
    id v68 = v15;
    id v16 = v15;
    [v14 enumerateObjectsUsingBlock:v67];
    id v17 = [v16 componentsJoinedByString:@"|"];
    [v3 setObject:v17 forKeyedSubscript:@"X-Apple-Baa-UE"];
  }
  if (SDeviceIdentityIsSupported()) {
    uint64_t v18 = @"1";
  }
  else {
    uint64_t v18 = @"2";
  }
  [v3 setObject:v18 forKeyedSubscript:@"X-Apple-Baa-Avail"];
  id v19 = [*(id *)(a1 + 48) HTTPBody];
  if (v19)
  {
    id v20 = [MEMORY[0x1E4F1C9C8] date];
    v60 = objc_msgSend(v20, "ak_serverFriendlyString");

    v61 = objc_msgSend(v19, "ak_SHA256Data");
    id v21 = objc_msgSend(v61, "aaf_toHexString");
    v59 = [v21 lowercaseString];

    v58 = [NSString stringWithFormat:@"%@%@", v59, v60];
    v57 = [v58 dataUsingEncoding:4];
    if (SDeviceIdentityIsSupported())
    {
      id v65 = 0;
      id v66 = 0;
      id v22 = v57;
      uint64_t v74 = 0;
      v75 = &v74;
      uint64_t v76 = 0x2020000000;
      id v23 = (void (*)(id, void, id *, id *))getDeviceIdentityCreateHostSignatureSymbolLoc_ptr;
      v77 = getDeviceIdentityCreateHostSignatureSymbolLoc_ptr;
      if (!getDeviceIdentityCreateHostSignatureSymbolLoc_ptr)
      {
        uint64_t v69 = MEMORY[0x1E4F143A8];
        uint64_t v70 = 3221225472;
        v71 = __getDeviceIdentityCreateHostSignatureSymbolLoc_block_invoke;
        v72 = &unk_1E575EBF0;
        v73 = &v74;
        id v24 = (void *)DeviceIdentityLibrary_0();
        v25 = dlsym(v24, "DeviceIdentityCreateHostSignature");
        *(void *)(v73[1] + 24) = v25;
        getDeviceIdentityCreateHostSignatureSymbolLoc_ptr = *(_UNKNOWN **)(v73[1] + 24);
        id v23 = (void (*)(id, void, id *, id *))v75[3];
      }
      _Block_object_dispose(&v74, 8);
      if (!v23)
      {
        _BYSetupAssistantNeedsToRun_cold_1();
        __break(1u);
      }
      v62 = v23(v22, 0, &v66, &v65);

      id v26 = v66;
      id v27 = v65;
      if (!v27) {
        goto LABEL_26;
      }
    }
    else
    {
      v28 = _AKLogSystem();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke_2_cold_6();
      }

      objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7066);
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      v62 = 0;
      id v26 = 0;
      if (!v27) {
        goto LABEL_26;
      }
    }
    v29 = _AKLogSystem();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke_2_cold_5();
    }

    v30 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v27, "code"));
    v31 = [v30 stringValue];

    id v32 = [v27 underlyingErrors];
    BOOL v33 = [v32 count] == 0;

    if (!v33)
    {
      v34 = NSNumber;
      v35 = [v27 underlyingErrors];
      id v36 = [v35 firstObject];
      id v37 = objc_msgSend(v34, "numberWithInteger:", objc_msgSend(v36, "code"));
      uint64_t v38 = [v37 stringValue];

      v31 = (void *)v38;
    }
    [v3 setObject:v31 forKeyedSubscript:@"X-Apple-Host-Baa-E"];

LABEL_26:
    if (v62 && v26)
    {
      v39 = _AKLogSystem();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
        __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke_2_cold_4();
      }

      uint64_t v40 = *(void **)(a1 + 56);
      id v64 = 0;
      char v56 = [v40 _parseDERCertificatesFromChain:v26 error:&v64];
      id v41 = v64;
      if (!v41)
      {
        id v55 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v42 = [v56 objectAtIndexedSubscript:0];
        id v43 = [v42 base64EncodedStringWithOptions:0];
        [v55 addObject:v43];

        id v44 = [v56 objectAtIndexedSubscript:1];
        id v45 = [v44 base64EncodedStringWithOptions:0];
        [v55 addObject:v45];

        v46 = _AKLogSystem();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
          __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke_2_cold_3();
        }

        v78 = @"certs";
        v79[0] = v55;
        v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:&v78 count:1];
        id v63 = 0;
        v47 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v54 options:0 error:&v63];
        id v53 = v63;
        if (v47)
        {
          uint64_t v48 = objc_msgSend(v47, "aaf_toCompressedData:", 517);
          id v49 = [v48 base64EncodedStringWithOptions:0];
          [v3 setObject:v49 forKeyedSubscript:@"X-Apple-Host-Baa"];
          id v50 = [v62 base64EncodedStringWithOptions:0];
          [v3 setObject:v50 forKeyedSubscript:@"X-Apple-I-Host-Baa-S"];
        }
        else
        {
          uint64_t v48 = _AKLogSystem();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
            __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke_2_cold_2();
          }
        }
      }
    }
  }
  uint64_t v51 = *(void *)(a1 + 64);
  id v52 = (void *)[v3 copy];
  (*(void (**)(uint64_t, void *, void))(v51 + 16))(v51, v52, *(void *)(a1 + 40));
}

void __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke_165(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = NSString;
  id v4 = a2;
  id v7 = [v4 domain];
  uint64_t v5 = [v4 code];

  id v6 = [v3 stringWithFormat:@"%@:%ld", v7, v5];
  [v2 addObject:v6];
}

- (id)_parseDERCertificatesFromChain:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  memset(v22, 0, sizeof(v22));
  unint64_t v21 = 0;
  id v5 = a3;
  unint64_t v6 = [v5 bytes];
  int v7 = CTParseCertificateSet(v6, v6 + [v5 length], v22, 3, &v21);
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v21 == 0;
  }
  if (v8)
  {
    int v9 = v7;
    id v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[AKAppleIDSigningController(Convenience) _parseDERCertificatesFromChain:error:]((uint64_t *)&v21, v9, v10);
    }

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7066);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      id v12 = 0;
LABEL_20:
      uint64_t v18 = 0;
      *a4 = v11;
      goto LABEL_23;
    }
    id v12 = 0;
  }
  else
  {
    id v13 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v12 = (id)[v13 initWithCapacity:v21];
    if (!v21)
    {
LABEL_15:
      id v12 = v12;
      uint64_t v18 = v12;
      goto LABEL_23;
    }
    uint64_t v14 = 0;
    int v15 = 0;
    while (1)
    {
      unint64_t v16 = (unint64_t)&v22[v14];
      if (!*(void *)v16 || !*(void *)(v16 + 8)) {
        break;
      }
      id v17 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:*(void *)v16 length:*(void *)(v16 | 8)];
      [v12 setObject:v17 atIndexedSubscript:v14];

      uint64_t v14 = ++v15;
      if (v21 <= v15) {
        goto LABEL_15;
      }
    }
    id v19 = _AKLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[AKAppleIDSigningController(Convenience) _parseDERCertificatesFromChain:error:]();
    }

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7066);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
  }
  uint64_t v18 = 0;
LABEL_23:

  return v18;
}

- (void)_additionalAbsintheHeadersForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  BOOL v8 = [v6 HTTPBody];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __91__AKAppleIDSigningController_Convenience___additionalAbsintheHeadersForRequest_completion___block_invoke;
  v10[3] = &unk_1E5760940;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  id v11 = v9;
  [(AKAppleIDSigningController *)self absintheSignatureForData:v8 completion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __91__AKAppleIDSigningController_Convenience___additionalAbsintheHeadersForRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v5)
  {
    BOOL v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __91__AKAppleIDSigningController_Convenience___additionalAbsintheHeadersForRequest_completion___block_invoke_cold_3();
    }

    uint64_t v9 = *(void *)(a1 + 32);
    if (WeakRetained[40]) {
      id v10 = @"X-MMe-Proxied-Nas-Qualify";
    }
    else {
      id v10 = @"X-MMe-Nas-Qualify";
    }
    id v20 = v10;
    v21[0] = v5;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v11, v6);
  }
  else
  {
    id v12 = _AKLogSystem();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v13) {
        __91__AKAppleIDSigningController_Convenience___additionalAbsintheHeadersForRequest_completion___block_invoke_cold_2();
      }

      uint64_t v14 = *(void *)(a1 + 32);
      int v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F28A50];
      id v19 = v6;
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      unint64_t v16 = objc_msgSend(v15, "ak_errorWithCode:userInfo:", -7066, v11);
      (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v16);
    }
    else
    {
      if (v13) {
        __91__AKAppleIDSigningController_Convenience___additionalAbsintheHeadersForRequest_completion___block_invoke_cold_1();
      }

      uint64_t v17 = *(void *)(a1 + 32);
      id v11 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7066);
      (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v11);
    }
  }
}

- (void)_additionalAttestationHeadersForRequest:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v37 = a5;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v12 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v13 = objc_msgSend(v12, "ak_serverFriendlyString");

  uint64_t v14 = [v9 objectForKeyedSubscript:@"AKAttestationUseDeviceCheckKeychainAccess"];
  int v15 = [v14 BOOLValue];

  unint64_t v16 = 0x1E575E000;
  if (v15)
  {
    [v11 setObject:v13 forKeyedSubscript:@"X-Apple-I-Client-Time"];
    uint64_t v17 = [v8 HTTPBody];
    uint64_t v18 = v17;
    id v36 = v8;
    if (v17)
    {
      id v19 = objc_msgSend(v17, "ak_SHA256Data");
      id v20 = objc_msgSend(v19, "aaf_toHexString");
      unint64_t v21 = [v20 lowercaseString];

      [v11 setObject:v21 forKeyedSubscript:@"X-Apple-I-Payload-Hash"];
      id v22 = [NSString stringWithFormat:@"%@%@", v21, v13];
      uint64_t v23 = [v22 dataUsingEncoding:4];
      [v10 setObject:v23 forKeyedSubscript:@"X-Apple-I-Baa-S"];

      unint64_t v16 = 0x1E575E000uLL;
      id v8 = v36;
    }
    id v24 = [*(id *)(v16 + 1120) currentDevice];
    v25 = [v24 uniqueDeviceIdentifier];
    id v26 = [v25 dataUsingEncoding:4];

    if (v26) {
      [v10 setObject:v26 forKeyedSubscript:@"X-Mme-Device-Id-S"];
    }
    unint64_t v16 = 0x1E575E000uLL;
    if (+[AKDevice hasUniqueDeviceIdentifier])
    {
      id v27 = +[AKDevice currentDevice];
      v28 = [v27 provisioningDeviceIdentifier];
      v29 = [v28 dataUsingEncoding:4];

      if (v29) {
        [v10 setObject:v29 forKeyedSubscript:@"X-Apple-I-Provisioning-Device-Id-S"];
      }

      id v8 = v36;
      unint64_t v16 = 0x1E575E000uLL;
    }
  }
  v30 = [*(id *)(v16 + 1120) currentDevice];
  v31 = [v30 serverFriendlyDescription];
  id v32 = [v31 dataUsingEncoding:4];

  if (v32)
  {
    if (self->_isProxy) {
      BOOL v33 = @"X-MMe-Proxied-Client-Info-S";
    }
    else {
      BOOL v33 = @"X-MMe-Client-Info-S";
    }
    [v10 setObject:v32 forKeyedSubscript:v33];
  }
  objc_initWeak(&location, self);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __102__AKAppleIDSigningController_Convenience___additionalAttestationHeadersForRequest_options_completion___block_invoke;
  v38[3] = &unk_1E5760988;
  objc_copyWeak(&v41, &location);
  id v34 = v11;
  id v39 = v34;
  id v35 = v37;
  id v40 = v35;
  [(AKAppleIDSigningController *)self signaturesForData:v10 options:v9 completion:v38];

  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);
}

void __102__AKAppleIDSigningController_Convenience___additionalAttestationHeadersForRequest_options_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v7)
  {
    id v11 = objc_msgSend(v7, "aaf_map:", &__block_literal_global_16);
    id v12 = (void *)[v11 mutableCopy];

    BOOL v13 = [v8 base64EncodedStringWithOptions:0];
    if (v13)
    {
      if (WeakRetained[40]) {
        uint64_t v14 = @"X-Apple-Proxied-Baa";
      }
      else {
        uint64_t v14 = @"X-Apple-Baa";
      }
      [v12 setObject:v13 forKeyedSubscript:v14];
    }
    int v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v12];
    [v15 addEntriesFromDictionary:*(void *)(a1 + 32)];
    unint64_t v16 = _AKLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      __102__AKAppleIDSigningController_Convenience___additionalAttestationHeadersForRequest_options_completion___block_invoke_cold_3(v12);
    }

    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v18 = (void *)[v15 copy];
    (*(void (**)(uint64_t, void *, void))(v17 + 16))(v17, v18, 0);

LABEL_14:
    goto LABEL_15;
  }
  id v19 = _AKLogSystem();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
  if (v9)
  {
    if (v20) {
      __102__AKAppleIDSigningController_Convenience___additionalAttestationHeadersForRequest_options_completion___block_invoke_cold_2();
    }

    uint64_t v21 = *(void *)(a1 + 40);
    id v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28A50];
    v25[0] = v9;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    BOOL v13 = objc_msgSend(v22, "ak_errorWithCode:userInfo:", -7066, v12);
    (*(void (**)(uint64_t, void, void *))(v21 + 16))(v21, 0, v13);
    goto LABEL_14;
  }
  if (v20) {
    __102__AKAppleIDSigningController_Convenience___additionalAttestationHeadersForRequest_options_completion___block_invoke_cold_1();
  }

  uint64_t v23 = *(void *)(a1 + 40);
  id v12 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7066);
  (*(void (**)(uint64_t, void, void *))(v23 + 16))(v23, 0, v12);
LABEL_15:
}

uint64_t __102__AKAppleIDSigningController_Convenience___additionalAttestationHeadersForRequest_options_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 base64EncodedStringWithOptions:0];
}

void __66__AKAppleIDSigningController_absintheSignatureForData_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Remote signing service returned an error: %@", v2, v3, v4, v5, v6);
}

void __66__AKAppleIDSigningController_absintheSignatureForData_completion___block_invoke_103_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Remote signing service successfully signed data.", v2, v3, v4, v5, v6);
}

- (void)attestationDataForRequest:completion:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_193494000, v1, OS_LOG_TYPE_DEBUG, "%@: Generating attestation data for request (%@)", v2, 0x16u);
}

void __67__AKAppleIDSigningController_attestationDataForRequest_completion___block_invoke_cold_1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_193494000, v1, OS_LOG_TYPE_ERROR, "%@: Failed to generate attestation data with error (%@)", v2, 0x16u);
}

void __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "No baaInterval", v2, v3, v4, v5, v6);
}

void __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Absinthe not enabled", v2, v3, v4, v5, v6);
}

void __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to fetch absinthe headers, error: %@", v2, v3, v4, v5, v6);
}

void __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_3_cold_2(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) allKeys];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_193494000, v2, v3, "We have additional absinthe headers %@", v4, v5, v6, v7, v8);
}

void __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_157_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Requesting additional Attestation for header", v2, v3, v4, v5, v6);
}

void __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_2_159_cold_1()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to fetch attestation headers, error: %@", v2, v3, v4, v5, v6);
}

void __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_2_159_cold_2(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) allKeys];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_193494000, v2, v3, "We have attesation headers: %@", v4, v5, v6, v7, v8);
}

void __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_162_cold_1(uint64_t a1)
{
  [*(id *)(a1 + 32) count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_193494000, v1, v2, "returing %lu additional headers", v3, v4, v5, v6, v7);
}

void __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to process host certificate chain, error: %@", v2, v3, v4, v5, v6);
}

void __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke_2_cold_3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_193494000, v0, OS_LOG_TYPE_DEBUG, "hostCertificateChain: %@", v1, 0xCu);
}

void __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke_2_cold_4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Received signed host data and certificate chain", v2, v3, v4, v5, v6);
}

void __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke_2_cold_5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to fetch host attestation headers, error: %@", v2, v3, v4, v5, v6);
}

void __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke_2_cold_6()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "DeviceIdentity not available", v2, v3, v4, v5, v6);
}

void __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke_2_cold_7()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to fetch attestation headers, error: %@", v2, v3, v4, v5, v6);
}

void __91__AKAppleIDSigningController_Convenience___additionalAbsintheHeadersForRequest_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Unknown absinthe error", v2, v3, v4, v5, v6);
}

void __91__AKAppleIDSigningController_Convenience___additionalAbsintheHeadersForRequest_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Absinthe error %@", v2, v3, v4, v5, v6);
}

void __91__AKAppleIDSigningController_Convenience___additionalAbsintheHeadersForRequest_completion___block_invoke_cold_3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_1();
  _os_log_debug_impl(&dword_193494000, v0, OS_LOG_TYPE_DEBUG, "Absinthe data generated for proxy %@", v1, 0xCu);
}

void __102__AKAppleIDSigningController_Convenience___additionalAttestationHeadersForRequest_options_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Unknown attestation error", v2, v3, v4, v5, v6);
}

void __102__AKAppleIDSigningController_Convenience___additionalAttestationHeadersForRequest_options_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Attestation error %@", v2, v3, v4, v5, v6);
}

void __102__AKAppleIDSigningController_Convenience___additionalAttestationHeadersForRequest_options_completion___block_invoke_cold_3(void *a1)
{
  uint64_t v1 = [a1 allKeys];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_193494000, v2, v3, "Attestation signature headers %@", v4, v5, v6, v7, v8);
}

@end