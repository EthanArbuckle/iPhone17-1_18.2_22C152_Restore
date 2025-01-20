@interface AKAnisetteProvisioningController
- (AKAnisetteProvisioningController)init;
- (AKAnisetteProvisioningController)initWithDaemonXPCEndpoint:(id)a3;
- (AKAnisetteServiceProtocol)anisetteDataProvider;
- (AKDevice)targetDevice;
- (id)_anisetteServiceConnection;
- (id)_attestationDataForRequest:(id)a3 error:(id *)a4;
- (id)_fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 error:(id *)a4;
- (id)anisetteDataForURLRequest:(id)a3 error:(id *)a4;
- (id)anisetteDataWithError:(id *)a3;
- (id)attestationDataForRequest:(id)a3 error:(id *)a4;
- (id)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 error:(id *)a4;
- (id)initForDevice:(id)a3 provider:(id)a4;
- (void)_attestationDataForRequest:(id)a3 completion:(id)a4;
- (void)_fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4;
- (void)_tearDownConnection;
- (void)anisetteDataForURLRequest:(id)a3 completion:(id)a4;
- (void)anisetteDataWithCompletion:(id)a3;
- (void)attestationDataForRequest:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)eraseWithCompletion:(id)a3;
- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4;
- (void)fetchPeerAttestationDataForRequest:(id)a3 completion:(id)a4;
- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4;
- (void)postAttestationAnalytics:(id)a3 completion:(id)a4;
- (void)provisionWithCompletion:(id)a3;
- (void)resetDeviceIdentityWithCompletion:(id)a3;
- (void)setAnisetteDataProvider:(id)a3;
- (void)setTargetDevice:(id)a3;
- (void)setTimeAdjustmentWithServerTime:(id)a3 completion:(id)a4;
- (void)syncWithSIMData:(id)a3 completion:(id)a4;
@end

@implementation AKAnisetteProvisioningController

- (id)_attestationDataForRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__14;
  v28 = __Block_byref_object_dispose__14;
  id v29 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__14;
  v22 = __Block_byref_object_dispose__14;
  id v23 = 0;
  v7 = [(AKAnisetteProvisioningController *)self _anisetteServiceConnection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__AKAnisetteProvisioningController__attestationDataForRequest_error___block_invoke;
  v17[3] = &unk_1E575F080;
  v17[4] = &v18;
  v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v17];

  v9 = [[AKAttestationRequestData alloc] initWithRequest:v6 requiredHeaders:0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__AKAnisetteProvisioningController__attestationDataForRequest_error___block_invoke_24;
  v13[3] = &unk_1E5762258;
  id v10 = v6;
  id v14 = v10;
  v15 = &v18;
  v16 = &v24;
  [v8 attestationDataForRequestData:v9 completion:v13];
  if (a4) {
    *a4 = (id) v19[5];
  }
  id v11 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

- (id)_anisetteServiceConnection
{
  p_unfairLock = &self->_unfairLock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__AKAnisetteProvisioningController__anisetteServiceConnection__block_invoke;
  v5[3] = &unk_1E575FA90;
  v5[4] = self;
  os_unfair_lock_lock(&self->_unfairLock);
  v3 = __62__AKAnisetteProvisioningController__anisetteServiceConnection__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_unfairLock);

  return v3;
}

id __62__AKAnisetteProvisioningController__anisetteServiceConnection__block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 24);
    id v4 = objc_alloc(MEMORY[0x1E4F29268]);
    if (v3) {
      uint64_t v5 = [v4 initWithListenerEndpoint:*(void *)(*(void *)(a1 + 32) + 24)];
    }
    else {
      uint64_t v5 = [v4 initWithMachServiceName:@"com.apple.ak.anisette.xpc" options:0];
    }
    id v2 = (id)v5;
    id v6 = +[AKAnisetteProvisioningDaemonInterface XPCInterface];
    [v2 setRemoteObjectInterface:v6];

    v7 = [[_AKAnisetteProviderProxy alloc] initWithProvider:*(void *)(*(void *)(a1 + 32) + 40)];
    [v2 setExportedObject:v7];

    v8 = +[AKAnisetteProvisioningClientInterface XPCInterface];
    [v2 setExportedInterface:v8];

    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_initWeak(&from, v2);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __62__AKAnisetteProvisioningController__anisetteServiceConnection__block_invoke_2;
    v16[3] = &unk_1E57622F8;
    objc_copyWeak(&v17, &location);
    objc_copyWeak(&v18, &from);
    [v2 setInterruptionHandler:v16];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __62__AKAnisetteProvisioningController__anisetteServiceConnection__block_invoke_2_36;
    v13 = &unk_1E57622F8;
    objc_copyWeak(&v14, &location);
    objc_copyWeak(&v15, &from);
    [v2 setInvalidationHandler:&v10];
    objc_msgSend(v2, "resume", v10, v11, v12, v13);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), v2);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return v2;
}

void __69__AKAnisetteProvisioningController__attestationDataForRequest_error___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = +[AKConfiguration sharedConfiguration];
  uint64_t v8 = [v7 shouldEnableAttestationLogging];

  if (v8 == 1)
  {
    v9 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v14 = [*(id *)(a1 + 32) URL];
      id v15 = [v5 attestationHeaders];
      int v16 = 138412802;
      id v17 = v14;
      __int16 v18 = 2112;
      v19 = v15;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_debug_impl(&dword_193494000, v9, OS_LOG_TYPE_DEBUG, "Attestation for request [%@] - headers [%@], error - [%@]", (uint8_t *)&v16, 0x20u);
    }
  }
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    uint64_t v10 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_4_cold_1();
    }
  }
  else
  {
    uint64_t v11 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __82__AKAnisetteProvisioningController_fetchPeerAttestationDataForRequest_completion___block_invoke_21_cold_1();
    }

    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    id v13 = v5;
    uint64_t v10 = *(NSObject **)(v12 + 40);
    *(void *)(v12 + 40) = v13;
  }
}

- (id)attestationDataForRequest:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = _os_activity_create(&dword_193494000, "authkit/fetch-attestation-data-sync", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  uint64_t v8 = _AKSignpostLogSystem();
  os_signpost_id_t v9 = _AKSignpostCreate(v8);
  uint64_t v11 = v10;

  uint64_t v12 = _AKSignpostLogSystem();
  id v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "FetchAttestation", (const char *)&unk_19357E265, buf, 2u);
  }

  id v14 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v28 = v9;
    _os_log_impl(&dword_193494000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchAttestation ", buf, 0xCu);
  }

  id v25 = 0;
  id v15 = [(AKAnisetteProvisioningController *)self _attestationDataForRequest:v6 error:&v25];
  id v16 = v25;
  if (objc_msgSend(v16, "ak_isXPCServiceError"))
  {
    id v17 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[AKAnisetteProvisioningController attestationDataForRequest:error:]();
    }

    [(AKAnisetteProvisioningController *)self _tearDownConnection];
    id v24 = 0;
    uint64_t v18 = [(AKAnisetteProvisioningController *)self _attestationDataForRequest:v6 error:&v24];
    id v16 = v24;

    id v15 = (void *)v18;
  }
  if (a4) {
    *a4 = v16;
  }
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(v9, v11);
  __int16 v20 = _AKSignpostLogSystem();
  id v21 = v20;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v21, OS_SIGNPOST_INTERVAL_END, v9, "FetchAttestation", (const char *)&unk_19357E265, buf, 2u);
  }

  uint64_t v22 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    os_signpost_id_t v28 = v9;
    __int16 v29 = 2048;
    double v30 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_193494000, v22, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:FetchAttestation ", buf, 0x16u);
  }

  os_activity_scope_leave(&state);

  return v15;
}

- (AKAnisetteProvisioningController)init
{
  v3.receiver = self;
  v3.super_class = (Class)AKAnisetteProvisioningController;
  result = [(AKAnisetteProvisioningController *)&v3 init];
  if (result) {
    result->_unfairLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (AKAnisetteProvisioningController)initWithDaemonXPCEndpoint:(id)a3
{
  id v5 = a3;
  id v6 = [(AKAnisetteProvisioningController *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_daemonXPCEndpoint, a3);
  }

  return v7;
}

- (id)initForDevice:(id)a3 provider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  os_signpost_id_t v9 = [(AKAnisetteProvisioningController *)self init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_targetDevice, a3);
    objc_storeStrong(p_isa + 5, a4);
  }

  return p_isa;
}

- (void)dealloc
{
  [(AKAnisetteProvisioningController *)self _tearDownConnection];
  v3.receiver = self;
  v3.super_class = (Class)AKAnisetteProvisioningController;
  [(AKAnisetteProvisioningController *)&v3 dealloc];
}

- (void)provisionWithCompletion:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__14;
  v34[4] = __Block_byref_object_dispose__14;
  id v5 = self;
  v35 = v5;
  id v6 = _os_activity_create(&dword_193494000, "authkit/anisette-provision", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  id v7 = (void *)os_transaction_create();
  id v8 = _AKSignpostLogSystem();
  os_signpost_id_t v9 = _AKSignpostCreate(v8);
  uint64_t v11 = v10;

  uint64_t v12 = _AKSignpostLogSystem();
  id v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ProvisionAnisette", " enableTelemetry=YES ", buf, 2u);
  }

  id v14 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v37 = v9;
    _os_log_impl(&dword_193494000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: ProvisionAnisette  enableTelemetry=YES ", buf, 0xCu);
  }

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke;
  v27[3] = &unk_1E5762118;
  os_signpost_id_t v31 = v9;
  uint64_t v32 = v11;
  double v30 = v34;
  id v15 = v4;
  id v29 = v15;
  id v16 = v7;
  id v28 = v16;
  id v17 = (void *)MEMORY[0x1996FE880](v27);
  uint64_t v18 = [(AKAnisetteProvisioningController *)v5 _anisetteServiceConnection];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_4;
  v25[3] = &unk_1E575EAC0;
  id v19 = v17;
  id v26 = v19;
  __int16 v20 = [v18 remoteObjectProxyWithErrorHandler:v25];

  targetDevice = v5->_targetDevice;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_6;
  v23[3] = &unk_1E575EF90;
  id v22 = v19;
  id v24 = v22;
  [v20 provisionAnisetteForDevice:targetDevice completion:v23];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v34, 8);
}

void __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[7], a1[8]);
  id v7 = _AKSignpostLogSystem();
  id v8 = v7;
  os_signpost_id_t v9 = a1[7];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v8, OS_SIGNPOST_INTERVAL_END, v9, "ProvisionAnisette", (const char *)&unk_19357E265, (uint8_t *)&v15, 2u);
  }

  uint64_t v10 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = a1[7];
    int v15 = 134218240;
    uint64_t v16 = v11;
    __int16 v17 = 2048;
    double v18 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_193494000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:ProvisionAnisette ", (uint8_t *)&v15, 0x16u);
  }

  uint64_t v12 = *(void *)(a1[6] + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = 0;

  uint64_t v14 = a1[5];
  if (v14) {
    (*(void (**)(uint64_t, uint64_t, id))(v14 + 16))(v14, a2, v5);
  }
}

void __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_4_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = _AKLogSystem();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_4_cold_1();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_6_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)syncWithSIMData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__14;
  v28[4] = __Block_byref_object_dispose__14;
  id v8 = self;
  id v29 = v8;
  os_signpost_id_t v9 = _os_activity_create(&dword_193494000, "authkit/sync-sim", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  uint64_t v10 = (void *)os_transaction_create();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __63__AKAnisetteProvisioningController_syncWithSIMData_completion___block_invoke;
  v23[3] = &unk_1E5762140;
  id v26 = v28;
  id v11 = v7;
  id v25 = v11;
  id v12 = v10;
  id v24 = v12;
  id v13 = (void *)MEMORY[0x1996FE880](v23);
  uint64_t v14 = [(AKAnisetteProvisioningController *)v8 _anisetteServiceConnection];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __63__AKAnisetteProvisioningController_syncWithSIMData_completion___block_invoke_2;
  v21[3] = &unk_1E575EAC0;
  id v15 = v13;
  id v22 = v15;
  uint64_t v16 = [v14 remoteObjectProxyWithErrorHandler:v21];

  targetDevice = v8->_targetDevice;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __63__AKAnisetteProvisioningController_syncWithSIMData_completion___block_invoke_8;
  v19[3] = &unk_1E575EF90;
  id v18 = v15;
  id v20 = v18;
  [v16 syncAnisetteWithSIMData:v6 device:targetDevice completion:v19];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v28, 8);
}

void __63__AKAnisetteProvisioningController_syncWithSIMData_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

void __63__AKAnisetteProvisioningController_syncWithSIMData_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_4_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__AKAnisetteProvisioningController_syncWithSIMData_completion___block_invoke_8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = _AKLogSystem();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_4_cold_1();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    __63__AKAnisetteProvisioningController_syncWithSIMData_completion___block_invoke_8_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)eraseWithCompletion:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__14;
  v34[4] = __Block_byref_object_dispose__14;
  uint64_t v5 = self;
  v35 = v5;
  id v6 = _os_activity_create(&dword_193494000, "authkit/anisette-erase", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  uint64_t v7 = (void *)os_transaction_create();
  id v8 = _AKSignpostLogSystem();
  os_signpost_id_t v9 = _AKSignpostCreate(v8);
  uint64_t v11 = v10;

  id v12 = _AKSignpostLogSystem();
  id v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "EraseAnisette", (const char *)&unk_19357E265, buf, 2u);
  }

  uint64_t v14 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v37 = v9;
    _os_log_impl(&dword_193494000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: EraseAnisette ", buf, 0xCu);
  }

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __56__AKAnisetteProvisioningController_eraseWithCompletion___block_invoke;
  v27[3] = &unk_1E5762118;
  os_signpost_id_t v31 = v9;
  uint64_t v32 = v11;
  double v30 = v34;
  id v15 = v4;
  id v29 = v15;
  id v16 = v7;
  id v28 = v16;
  __int16 v17 = (void *)MEMORY[0x1996FE880](v27);
  id v18 = [(AKAnisetteProvisioningController *)v5 _anisetteServiceConnection];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __56__AKAnisetteProvisioningController_eraseWithCompletion___block_invoke_10;
  v25[3] = &unk_1E575EAC0;
  id v19 = v17;
  id v26 = v19;
  id v20 = [v18 remoteObjectProxyWithErrorHandler:v25];

  targetDevice = v5->_targetDevice;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __56__AKAnisetteProvisioningController_eraseWithCompletion___block_invoke_11;
  v23[3] = &unk_1E575EF90;
  id v22 = v19;
  id v24 = v22;
  [v20 eraseAnisetteForDevice:targetDevice completion:v23];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v34, 8);
}

void __56__AKAnisetteProvisioningController_eraseWithCompletion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[7], a1[8]);
  uint64_t v7 = _AKSignpostLogSystem();
  id v8 = v7;
  os_signpost_id_t v9 = a1[7];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v8, OS_SIGNPOST_INTERVAL_END, v9, "EraseAnisette", (const char *)&unk_19357E265, (uint8_t *)&v15, 2u);
  }

  uint64_t v10 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = a1[7];
    int v15 = 134218240;
    uint64_t v16 = v11;
    __int16 v17 = 2048;
    double v18 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_193494000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:EraseAnisette ", (uint8_t *)&v15, 0x16u);
  }

  uint64_t v12 = *(void *)(a1[6] + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = 0;

  uint64_t v14 = a1[5];
  if (v14) {
    (*(void (**)(uint64_t, uint64_t, id))(v14 + 16))(v14, a2, v5);
  }
}

void __56__AKAnisetteProvisioningController_eraseWithCompletion___block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_4_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__AKAnisetteProvisioningController_eraseWithCompletion___block_invoke_11(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = _AKLogSystem();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_4_cold_1();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    __56__AKAnisetteProvisioningController_eraseWithCompletion___block_invoke_11_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)anisetteDataWithError:(id *)a3
{
  return [(AKAnisetteProvisioningController *)self fetchAnisetteDataAndProvisionIfNecessary:1 error:a3];
}

- (id)anisetteDataForURLRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6 && !objc_msgSend(v6, "ak_usesHTTPSScheme"))
  {
    if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"AKAnisetteError" code:-8012 userInfo:0];
      id v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = [(AKAnisetteProvisioningController *)self fetchAnisetteDataAndProvisionIfNecessary:1 error:a4];
  }

  return v8;
}

- (void)anisetteDataWithCompletion:(id)a3
{
}

- (void)anisetteDataForURLRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  id v8 = _os_activity_create(&dword_193494000, "authkit/anisette-for-request", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v8, &v11);
  if (v6 && (objc_msgSend(v6, "ak_usesHTTPSScheme") & 1) == 0)
  {
    os_signpost_id_t v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[AKAnisetteProvisioningController anisetteDataForURLRequest:completion:]();
    }

    if (v7)
    {
      uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AKAnisetteError" code:-8012 userInfo:0];
      v7[2](v7, 0, v10);
    }
  }
  else
  {
    [(AKAnisetteProvisioningController *)self fetchAnisetteDataAndProvisionIfNecessary:1 withCompletion:v7];
  }
  os_activity_scope_leave(&v11);
}

- (id)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = _os_activity_create(&dword_193494000, "authkit/fetch-anisette", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  id v8 = _AKSignpostLogSystem();
  os_signpost_id_t v9 = _AKSignpostCreate(v8);
  uint64_t v11 = v10;

  uint64_t v12 = _AKSignpostLogSystem();
  id v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "FetchAnisette", (const char *)&unk_19357E265, buf, 2u);
  }

  uint64_t v14 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v28 = v9;
    _os_log_impl(&dword_193494000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchAnisette ", buf, 0xCu);
  }

  id v25 = 0;
  int v15 = [(AKAnisetteProvisioningController *)self _fetchAnisetteDataAndProvisionIfNecessary:v5 error:&v25];
  id v16 = v25;
  if (objc_msgSend(v16, "ak_isXPCServiceError"))
  {
    __int16 v17 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[AKAnisetteProvisioningController fetchAnisetteDataAndProvisionIfNecessary:error:]();
    }

    id v24 = 0;
    uint64_t v18 = [(AKAnisetteProvisioningController *)self _fetchAnisetteDataAndProvisionIfNecessary:v5 error:&v24];
    id v16 = v24;

    int v15 = (void *)v18;
  }
  if (a4) {
    *a4 = v16;
  }
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(v9, v11);
  id v20 = _AKSignpostLogSystem();
  id v21 = v20;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v21, OS_SIGNPOST_INTERVAL_END, v9, "FetchAnisette", (const char *)&unk_19357E265, buf, 2u);
  }

  id v22 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    os_signpost_id_t v28 = v9;
    __int16 v29 = 2048;
    double v30 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_193494000, v22, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:FetchAnisette ", buf, 0x16u);
  }

  os_activity_scope_leave(&state);

  return v15;
}

- (id)_fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__14;
  os_signpost_id_t v28 = __Block_byref_object_dispose__14;
  id v29 = 0;
  uint64_t v21 = 0;
  v22[0] = &v21;
  v22[1] = 0x3032000000;
  v22[2] = __Block_byref_object_copy__14;
  v22[3] = __Block_byref_object_dispose__14;
  id v23 = 0;
  uint64_t v7 = [(AKAnisetteProvisioningController *)self _anisetteServiceConnection];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __84__AKAnisetteProvisioningController__fetchAnisetteDataAndProvisionIfNecessary_error___block_invoke;
  v20[3] = &unk_1E575F080;
  v20[4] = &v21;
  id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v20];

  targetDevice = self->_targetDevice;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __84__AKAnisetteProvisioningController__fetchAnisetteDataAndProvisionIfNecessary_error___block_invoke_12;
  v19[3] = &unk_1E5762168;
  void v19[4] = &v24;
  v19[5] = &v21;
  [v8 fetchAnisetteDataAndProvisionIfNecessary:v5 device:targetDevice completion:v19];
  if (a4) {
    *a4 = *(id *)(v22[0] + 40);
  }
  if (*(void *)(v22[0] + 40))
  {
    uint64_t v10 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[AKAnisetteProvisioningController _fetchAnisetteDataAndProvisionIfNecessary:error:]((uint64_t)v22, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  id v17 = (id)v25[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v24, 8);

  return v17;
}

void __84__AKAnisetteProvisioningController__fetchAnisetteDataAndProvisionIfNecessary_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKTrafficLogSubsystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_4_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __84__AKAnisetteProvisioningController__fetchAnisetteDataAndProvisionIfNecessary_error___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(void *)(v7 + 40))
  {
    id v8 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __84__AKAnisetteProvisioningController__fetchAnisetteDataAndProvisionIfNecessary_error___block_invoke_12_cold_1();
    }

    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  os_signpost_id_t v9 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v10 = v5;

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
}

- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = _os_activity_create(&dword_193494000, "authkit/fetch-anisette", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  id v8 = _AKSignpostLogSystem();
  os_signpost_id_t v9 = _AKSignpostCreate(v8);
  uint64_t v11 = v10;

  uint64_t v12 = _AKSignpostLogSystem();
  uint64_t v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "FetchAnisette", (const char *)&unk_19357E265, buf, 2u);
  }

  uint64_t v14 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v24 = v9;
    _os_log_impl(&dword_193494000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchAnisette ", buf, 0xCu);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __92__AKAnisetteProvisioningController_fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke;
  v17[3] = &unk_1E57621B8;
  BOOL v21 = v4;
  v17[4] = self;
  os_signpost_id_t v19 = v9;
  uint64_t v20 = v11;
  id v15 = v6;
  id v18 = v15;
  uint64_t v16 = (void *)MEMORY[0x1996FE880](v17);
  [(AKAnisetteProvisioningController *)self _fetchAnisetteDataAndProvisionIfNecessary:v4 withCompletion:v16];

  os_activity_scope_leave(&state);
}

void __92__AKAnisetteProvisioningController_fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (objc_msgSend(v6, "ak_isXPCServiceError"))
  {
    uint64_t v7 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[AKAnisetteProvisioningController fetchAnisetteDataAndProvisionIfNecessary:error:]();
    }

    [*(id *)(a1 + 32) _tearDownConnection];
    uint64_t v8 = *(unsigned __int8 *)(a1 + 64);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __92__AKAnisetteProvisioningController_fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke_14;
    v17[3] = &unk_1E5762190;
    long long v19 = *(_OWORD *)(a1 + 48);
    os_signpost_id_t v9 = *(void **)(a1 + 32);
    id v18 = *(id *)(a1 + 40);
    [v9 _fetchAnisetteDataAndProvisionIfNecessary:v8 withCompletion:v17];
  }
  else
  {
    unint64_t Nanoseconds = _AKSignpostGetNanoseconds(*(void *)(a1 + 48), *(void *)(a1 + 56));
    uint64_t v11 = _AKSignpostLogSystem();
    uint64_t v12 = v11;
    os_signpost_id_t v13 = *(void *)(a1 + 48);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_193494000, v12, OS_SIGNPOST_INTERVAL_END, v13, "FetchAnisette", (const char *)&unk_19357E265, buf, 2u);
    }

    uint64_t v14 = _AKSignpostLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 134218240;
      uint64_t v21 = v15;
      __int16 v22 = 2048;
      double v23 = (double)Nanoseconds / 1000000000.0;
      _os_log_impl(&dword_193494000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:FetchAnisette ", buf, 0x16u);
    }

    uint64_t v16 = *(void *)(a1 + 40);
    if (v16) {
      (*(void (**)(uint64_t, id, id))(v16 + 16))(v16, v5, v6);
    }
  }
}

void __92__AKAnisetteProvisioningController_fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke_14(void *a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[5], a1[6]);
  uint64_t v8 = _AKSignpostLogSystem();
  os_signpost_id_t v9 = v8;
  os_signpost_id_t v10 = a1[5];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v14) = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v9, OS_SIGNPOST_INTERVAL_END, v10, "FetchAnisette", (const char *)&unk_19357E265, (uint8_t *)&v14, 2u);
  }

  uint64_t v11 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = a1[5];
    int v14 = 134218240;
    uint64_t v15 = v12;
    __int16 v16 = 2048;
    double v17 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_193494000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:FetchAnisette ", (uint8_t *)&v14, 0x16u);
  }

  uint64_t v13 = a1[4];
  if (v13) {
    (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v5, v6);
  }
}

- (void)_fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__14;
  v18[4] = __Block_byref_object_dispose__14;
  uint64_t v7 = self;
  long long v19 = v7;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __93__AKAnisetteProvisioningController__fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke;
  v15[3] = &unk_1E57621E0;
  double v17 = v18;
  id v8 = v6;
  id v16 = v8;
  os_signpost_id_t v9 = (void *)MEMORY[0x1996FE880](v15);
  os_signpost_id_t v10 = [(AKAnisetteProvisioningController *)v7 _anisetteServiceConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __93__AKAnisetteProvisioningController__fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke_15;
  v13[3] = &unk_1E575EAC0;
  id v11 = v9;
  id v14 = v11;
  uint64_t v12 = [v10 remoteObjectProxyWithErrorHandler:v13];

  [v12 fetchAnisetteDataAndProvisionIfNecessary:v4 device:v7->_targetDevice completion:v11];
  _Block_object_dispose(v18, 8);
}

void __93__AKAnisetteProvisioningController__fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  os_signpost_id_t v9 = _AKTrafficLogSubsystem();
  os_signpost_id_t v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_4_cold_1();
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    __84__AKAnisetteProvisioningController__fetchAnisetteDataAndProvisionIfNecessary_error___block_invoke_12_cold_1();
  }

  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v5, v6);
  }
}

uint64_t __93__AKAnisetteProvisioningController__fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke_15(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    id v8 = (id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"No DSID was provided!" userInfo:0];
  }
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__14;
  v26[4] = __Block_byref_object_dispose__14;
  os_signpost_id_t v9 = self;
  v27 = v9;
  os_signpost_id_t v10 = _os_activity_create(&dword_193494000, "authkit/legacy-anisette", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __77__AKAnisetteProvisioningController_legacyAnisetteDataForDSID_withCompletion___block_invoke;
  v22[3] = &unk_1E57621E0;
  uint64_t v24 = v26;
  id v11 = v7;
  id v23 = v11;
  uint64_t v12 = (void *)MEMORY[0x1996FE880](v22);
  uint64_t v13 = [(AKAnisetteProvisioningController *)v9 _anisetteServiceConnection];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __77__AKAnisetteProvisioningController_legacyAnisetteDataForDSID_withCompletion___block_invoke_2;
  v20[3] = &unk_1E575EAC0;
  id v14 = v12;
  id v21 = v14;
  uint64_t v15 = [v13 remoteObjectProxyWithErrorHandler:v20];

  targetDevice = v9->_targetDevice;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __77__AKAnisetteProvisioningController_legacyAnisetteDataForDSID_withCompletion___block_invoke_18;
  v18[3] = &unk_1E5762208;
  id v17 = v14;
  id v19 = v17;
  [v15 legacyAnisetteDataForDSID:v6 device:targetDevice completion:v18];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v26, 8);
}

void __77__AKAnisetteProvisioningController_legacyAnisetteDataForDSID_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);
  }
}

void __77__AKAnisetteProvisioningController_legacyAnisetteDataForDSID_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_4_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__AKAnisetteProvisioningController_legacyAnisetteDataForDSID_withCompletion___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = _AKLogSystem();
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_4_cold_1();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    __77__AKAnisetteProvisioningController_legacyAnisetteDataForDSID_withCompletion___block_invoke_18_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchPeerAttestationDataForRequest:(id)a3 completion:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__14;
  v36[4] = __Block_byref_object_dispose__14;
  uint64_t v8 = self;
  os_signpost_id_t v37 = v8;
  id v9 = _os_activity_create(&dword_193494000, "authkit/fetch-peer-attestation-data", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  os_signpost_id_t v10 = _AKSignpostLogSystem();
  os_signpost_id_t v11 = _AKSignpostCreate(v10);
  uint64_t v13 = v12;

  id v14 = _AKSignpostLogSystem();
  uint64_t v15 = v14;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "FetchAttestation", (const char *)&unk_19357E265, buf, 2u);
  }

  id v16 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v39 = v11;
    _os_log_impl(&dword_193494000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchAttestation ", buf, 0xCu);
  }

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __82__AKAnisetteProvisioningController_fetchPeerAttestationDataForRequest_completion___block_invoke;
  v30[3] = &unk_1E5762230;
  os_signpost_id_t v33 = v11;
  uint64_t v34 = v13;
  uint64_t v32 = v36;
  id v17 = v7;
  id v31 = v17;
  uint64_t v18 = (void *)MEMORY[0x1996FE880](v30);
  id v19 = [(AKAnisetteProvisioningController *)v8 _anisetteServiceConnection];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __82__AKAnisetteProvisioningController_fetchPeerAttestationDataForRequest_completion___block_invoke_20;
  v28[3] = &unk_1E575EAC0;
  id v20 = v18;
  id v29 = v20;
  id v21 = [v19 remoteObjectProxyWithErrorHandler:v28];

  targetDevice = v8->_targetDevice;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __82__AKAnisetteProvisioningController_fetchPeerAttestationDataForRequest_completion___block_invoke_21;
  v25[3] = &unk_1E5760F78;
  id v23 = v6;
  id v26 = v23;
  id v24 = v20;
  id v27 = v24;
  [v21 attestationDataForDevice:targetDevice withRequest:v23 completion:v25];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v36, 8);
}

void __82__AKAnisetteProvisioningController_fetchPeerAttestationDataForRequest_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  uint64_t v8 = _AKSignpostLogSystem();
  id v9 = v8;
  os_signpost_id_t v10 = a1[6];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v9, OS_SIGNPOST_INTERVAL_END, v10, "FetchAttestation", (const char *)&unk_19357E265, (uint8_t *)&v16, 2u);
  }

  os_signpost_id_t v11 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = a1[6];
    int v16 = 134218240;
    uint64_t v17 = v12;
    __int16 v18 = 2048;
    double v19 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_193494000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:FetchAttestation ", (uint8_t *)&v16, 0x16u);
  }

  uint64_t v13 = *(void *)(a1[5] + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = 0;

  uint64_t v15 = a1[4];
  if (v15) {
    (*(void (**)(uint64_t, id, id))(v15 + 16))(v15, v5, v6);
  }
}

void __82__AKAnisetteProvisioningController_fetchPeerAttestationDataForRequest_completion___block_invoke_20(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = _AKTrafficLogSubsystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_4_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __82__AKAnisetteProvisioningController_fetchPeerAttestationDataForRequest_completion___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _AKTrafficLogSubsystem();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_4_cold_1();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    __82__AKAnisetteProvisioningController_fetchPeerAttestationDataForRequest_completion___block_invoke_21_cold_1();
  }

  id v9 = +[AKConfiguration sharedConfiguration];
  uint64_t v10 = [v9 shouldEnableAttestationLogging];

  if (v10 == 1)
  {
    os_signpost_id_t v11 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = [*(id *)(a1 + 32) URL];
      uint64_t v13 = [v5 attestationHeaders];
      int v14 = 138412802;
      uint64_t v15 = v12;
      __int16 v16 = 2112;
      uint64_t v17 = v13;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_debug_impl(&dword_193494000, v11, OS_LOG_TYPE_DEBUG, "Attestation for request [%@] - headers [%@], error - [%@]", (uint8_t *)&v14, 0x20u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __69__AKAnisetteProvisioningController__attestationDataForRequest_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = _AKTrafficLogSubsystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_4_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (void)attestationDataForRequest:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create(&dword_193494000, "authkit/fetch-attestation-data-async", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  id v9 = _AKSignpostLogSystem();
  os_signpost_id_t v10 = _AKSignpostCreate(v9);
  uint64_t v12 = v11;

  uint64_t v13 = _AKSignpostLogSystem();
  int v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "FetchAttestation", (const char *)&unk_19357E265, buf, 2u);
  }

  uint64_t v15 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v26 = v10;
    _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchAttestation ", buf, 0xCu);
  }

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __73__AKAnisetteProvisioningController_attestationDataForRequest_completion___block_invoke;
  v19[3] = &unk_1E57622A8;
  void v19[4] = self;
  id v16 = v6;
  id v20 = v16;
  os_signpost_id_t v22 = v10;
  uint64_t v23 = v12;
  id v17 = v7;
  id v21 = v17;
  __int16 v18 = (void *)MEMORY[0x1996FE880](v19);
  [(AKAnisetteProvisioningController *)self _attestationDataForRequest:v16 completion:v18];

  os_activity_scope_leave(&state);
}

void __73__AKAnisetteProvisioningController_attestationDataForRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (objc_msgSend(v6, "ak_isXPCServiceError"))
  {
    id v7 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[AKAnisetteProvisioningController attestationDataForRequest:error:]();
    }

    [*(id *)(a1 + 32) _tearDownConnection];
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __73__AKAnisetteProvisioningController_attestationDataForRequest_completion___block_invoke_25;
    v17[3] = &unk_1E5762280;
    long long v19 = *(_OWORD *)(a1 + 56);
    id v18 = *(id *)(a1 + 48);
    [v8 _attestationDataForRequest:v9 completion:v17];
  }
  else
  {
    unint64_t Nanoseconds = _AKSignpostGetNanoseconds(*(void *)(a1 + 56), *(void *)(a1 + 64));
    uint64_t v11 = _AKSignpostLogSystem();
    uint64_t v12 = v11;
    os_signpost_id_t v13 = *(void *)(a1 + 56);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_193494000, v12, OS_SIGNPOST_INTERVAL_END, v13, "FetchAttestation", (const char *)&unk_19357E265, buf, 2u);
    }

    int v14 = _AKSignpostLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 134218240;
      uint64_t v21 = v15;
      __int16 v22 = 2048;
      double v23 = (double)Nanoseconds / 1000000000.0;
      _os_log_impl(&dword_193494000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:FetchAttestation ", buf, 0x16u);
    }

    uint64_t v16 = *(void *)(a1 + 48);
    if (v16) {
      (*(void (**)(uint64_t, id, id))(v16 + 16))(v16, v5, v6);
    }
  }
}

void __73__AKAnisetteProvisioningController_attestationDataForRequest_completion___block_invoke_25(void *a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[5], a1[6]);
  uint64_t v8 = _AKSignpostLogSystem();
  uint64_t v9 = v8;
  os_signpost_id_t v10 = a1[5];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v14) = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v9, OS_SIGNPOST_INTERVAL_END, v10, "FetchAttestation", (const char *)&unk_19357E265, (uint8_t *)&v14, 2u);
  }

  uint64_t v11 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = a1[5];
    int v14 = 134218240;
    uint64_t v15 = v12;
    __int16 v16 = 2048;
    double v17 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_193494000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:FetchAttestation ", (uint8_t *)&v14, 0x16u);
  }

  uint64_t v13 = a1[4];
  if (v13) {
    (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v5, v6);
  }
}

- (void)_attestationDataForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__14;
  v26[4] = __Block_byref_object_dispose__14;
  uint64_t v8 = self;
  uint64_t v27 = v8;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __74__AKAnisetteProvisioningController__attestationDataForRequest_completion___block_invoke;
  v22[3] = &unk_1E57622D0;
  uint64_t v25 = v26;
  id v9 = v6;
  id v23 = v9;
  id v10 = v7;
  id v24 = v10;
  uint64_t v11 = (void *)MEMORY[0x1996FE880](v22);
  uint64_t v12 = [(AKAnisetteProvisioningController *)v8 _anisetteServiceConnection];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  long long v19 = __74__AKAnisetteProvisioningController__attestationDataForRequest_completion___block_invoke_26;
  id v20 = &unk_1E575EAC0;
  id v13 = v11;
  id v21 = v13;
  int v14 = [v12 remoteObjectProxyWithErrorHandler:&v17];

  uint64_t v15 = [AKAttestationRequestData alloc];
  __int16 v16 = -[AKAttestationRequestData initWithRequest:requiredHeaders:](v15, "initWithRequest:requiredHeaders:", v9, 0, v17, v18, v19, v20);
  [v14 attestationDataForRequestData:v16 completion:v13];

  _Block_object_dispose(v26, 8);
}

void __74__AKAnisetteProvisioningController__attestationDataForRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  id v9 = _AKTrafficLogSubsystem();
  id v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_4_cold_1();
    }
LABEL_9:

    goto LABEL_10;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __82__AKAnisetteProvisioningController_fetchPeerAttestationDataForRequest_completion___block_invoke_21_cold_1();
  }

  uint64_t v11 = +[AKConfiguration sharedConfiguration];
  uint64_t v12 = [v11 shouldEnableAttestationLogging];

  if (v12 == 1)
  {
    id v10 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __74__AKAnisetteProvisioningController__attestationDataForRequest_completion___block_invoke_cold_1(a1, v5, v10);
    }
    goto LABEL_9;
  }
LABEL_10:
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v5, v6);
  }
}

uint64_t __74__AKAnisetteProvisioningController__attestationDataForRequest_completion___block_invoke_26(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetDeviceIdentityWithCompletion:(id)a3
{
  id v4 = a3;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__14;
  void v21[4] = __Block_byref_object_dispose__14;
  id v5 = self;
  __int16 v22 = v5;
  id v6 = _os_activity_create(&dword_193494000, "authkit/reset-baa-certs", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__AKAnisetteProvisioningController_resetDeviceIdentityWithCompletion___block_invoke;
  v17[3] = &unk_1E575F1E8;
  long long v19 = v21;
  id v7 = v4;
  id v18 = v7;
  uint64_t v8 = (void *)MEMORY[0x1996FE880](v17);
  id v9 = [(AKAnisetteProvisioningController *)v5 _anisetteServiceConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__AKAnisetteProvisioningController_resetDeviceIdentityWithCompletion___block_invoke_2;
  v15[3] = &unk_1E575EAC0;
  id v10 = v8;
  id v16 = v10;
  uint64_t v11 = [v9 remoteObjectProxyWithErrorHandler:v15];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__AKAnisetteProvisioningController_resetDeviceIdentityWithCompletion___block_invoke_27;
  v13[3] = &unk_1E575EAC0;
  id v12 = v10;
  id v14 = v12;
  [v11 resetDeviceIdentityWithCompletion:v13];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v21, 8);
}

void __70__AKAnisetteProvisioningController_resetDeviceIdentityWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

void __70__AKAnisetteProvisioningController_resetDeviceIdentityWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKTrafficLogSubsystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_4_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__AKAnisetteProvisioningController_resetDeviceIdentityWithCompletion___block_invoke_27(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKTrafficLogSubsystem();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __70__AKAnisetteProvisioningController_resetDeviceIdentityWithCompletion___block_invoke_27_cold_2();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __70__AKAnisetteProvisioningController_resetDeviceIdentityWithCompletion___block_invoke_27_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setTimeAdjustmentWithServerTime:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__14;
  v24[4] = __Block_byref_object_dispose__14;
  uint64_t v8 = self;
  uint64_t v25 = v8;
  id v9 = _os_activity_create(&dword_193494000, "authkit/resync-server-time", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __79__AKAnisetteProvisioningController_setTimeAdjustmentWithServerTime_completion___block_invoke;
  v20[3] = &unk_1E575F1E8;
  __int16 v22 = v24;
  id v10 = v7;
  id v21 = v10;
  uint64_t v11 = (void *)MEMORY[0x1996FE880](v20);
  id v12 = [(AKAnisetteProvisioningController *)v8 _anisetteServiceConnection];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __79__AKAnisetteProvisioningController_setTimeAdjustmentWithServerTime_completion___block_invoke_2;
  v18[3] = &unk_1E575EAC0;
  id v13 = v11;
  id v19 = v13;
  id v14 = [v12 remoteObjectProxyWithErrorHandler:v18];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__AKAnisetteProvisioningController_setTimeAdjustmentWithServerTime_completion___block_invoke_28;
  v16[3] = &unk_1E575EAC0;
  id v15 = v13;
  id v17 = v15;
  [v14 setTimeAdjustmentWithServerTime:v6 completion:v16];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v24, 8);
}

void __79__AKAnisetteProvisioningController_setTimeAdjustmentWithServerTime_completion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

void __79__AKAnisetteProvisioningController_setTimeAdjustmentWithServerTime_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKTrafficLogSubsystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_4_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79__AKAnisetteProvisioningController_setTimeAdjustmentWithServerTime_completion___block_invoke_28(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKTrafficLogSubsystem();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_4_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __79__AKAnisetteProvisioningController_setTimeAdjustmentWithServerTime_completion___block_invoke_28_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)postAttestationAnalytics:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__14;
  void v22[4] = __Block_byref_object_dispose__14;
  uint64_t v8 = self;
  id v23 = v8;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __72__AKAnisetteProvisioningController_postAttestationAnalytics_completion___block_invoke;
  v19[3] = &unk_1E575F1E8;
  id v21 = v22;
  id v9 = v7;
  id v20 = v9;
  id v10 = (void *)MEMORY[0x1996FE880](v19);
  uint64_t v11 = [(AKAnisetteProvisioningController *)v8 _anisetteServiceConnection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__AKAnisetteProvisioningController_postAttestationAnalytics_completion___block_invoke_2;
  v17[3] = &unk_1E575EAC0;
  id v12 = v10;
  id v18 = v12;
  id v13 = [v11 remoteObjectProxyWithErrorHandler:v17];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__AKAnisetteProvisioningController_postAttestationAnalytics_completion___block_invoke_29;
  v15[3] = &unk_1E575EAC0;
  id v14 = v12;
  id v16 = v14;
  [v13 postAttestationAnalyticsWithData:v6 completion:v15];

  _Block_object_dispose(v22, 8);
}

void __72__AKAnisetteProvisioningController_postAttestationAnalytics_completion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

void __72__AKAnisetteProvisioningController_postAttestationAnalytics_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKTrafficLogSubsystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_4_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__AKAnisetteProvisioningController_postAttestationAnalytics_completion___block_invoke_29(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKTrafficLogSubsystem();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_4_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __72__AKAnisetteProvisioningController_postAttestationAnalytics_completion___block_invoke_29_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_tearDownConnection
{
  p_unfairLock = &self->_unfairLock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__AKAnisetteProvisioningController__tearDownConnection__block_invoke;
  v3[3] = &unk_1E575EA70;
  v3[4] = self;
  os_unfair_lock_lock(&self->_unfairLock);
  __55__AKAnisetteProvisioningController__tearDownConnection__block_invoke((uint64_t)v3);
  os_unfair_lock_unlock(p_unfairLock);
}

void __55__AKAnisetteProvisioningController__tearDownConnection__block_invoke(uint64_t a1)
{
  id v2 = _AKTrafficLogSubsystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __55__AKAnisetteProvisioningController__tearDownConnection__block_invoke_cold_1();
  }

  id v3 = *(void **)(*(void *)(a1 + 32) + 16);
  if (v3)
  {
    [v3 setInvalidationHandler:0];
    [*(id *)(*(void *)(a1 + 32) + 16) setInterruptionHandler:0];
    [*(id *)(*(void *)(a1 + 32) + 16) invalidate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = 0;
  }
}

void __62__AKAnisetteProvisioningController__anisetteServiceConnection__block_invoke_2(uint64_t a1)
{
  id v2 = _AKTrafficLogSubsystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __62__AKAnisetteProvisioningController__anisetteServiceConnection__block_invoke_2_cold_1();
  }

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    id v6 = __62__AKAnisetteProvisioningController__anisetteServiceConnection__block_invoke_35;
    id v7 = &unk_1E575EB58;
    objc_copyWeak(&v9, (id *)(a1 + 40));
    uint64_t v8 = WeakRetained;
    uint64_t v4 = v5;
    os_unfair_lock_lock(WeakRetained + 2);
    v6((uint64_t)v4);

    os_unfair_lock_unlock(WeakRetained + 2);
    objc_destroyWeak(&v9);
  }
}

void __62__AKAnisetteProvisioningController__anisetteServiceConnection__block_invoke_35(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained setInvalidationHandler:0];
    [v4 invalidate];
    id WeakRetained = v4;
    uint64_t v3 = *(void *)(a1 + 32);
    if (v4 == *(id *)(v3 + 16))
    {
      *(void *)(v3 + 16) = 0;

      id WeakRetained = v4;
    }
  }
}

void __62__AKAnisetteProvisioningController__anisetteServiceConnection__block_invoke_2_36(uint64_t a1)
{
  id v2 = _AKTrafficLogSubsystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __62__AKAnisetteProvisioningController__anisetteServiceConnection__block_invoke_2_36_cold_1();
  }

  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    id v6 = __62__AKAnisetteProvisioningController__anisetteServiceConnection__block_invoke_37;
    id v7 = &unk_1E575EB58;
    objc_copyWeak(&v9, (id *)(a1 + 40));
    uint64_t v8 = WeakRetained;
    id v4 = v5;
    os_unfair_lock_lock(WeakRetained + 2);
    v6((uint64_t)v4);

    os_unfair_lock_unlock(WeakRetained + 2);
    objc_destroyWeak(&v9);
  }
}

void __62__AKAnisetteProvisioningController__anisetteServiceConnection__block_invoke_37(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (WeakRetained == *(id *)(v3 + 16))
    {
      *(void *)(v3 + 16) = 0;
      id v4 = WeakRetained;

      id WeakRetained = v4;
    }
  }
}

- (AKDevice)targetDevice
{
  return self->_targetDevice;
}

- (void)setTargetDevice:(id)a3
{
}

- (AKAnisetteServiceProtocol)anisetteDataProvider
{
  return self->_anisetteDataProvider;
}

- (void)setAnisetteDataProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anisetteDataProvider, 0);
  objc_storeStrong((id *)&self->_targetDevice, 0);
  objc_storeStrong((id *)&self->_daemonXPCEndpoint, 0);

  objc_storeStrong((id *)&self->_anisetteServiceConnection, 0);
}

void __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Remote Anisette service returned an error: %@", v2, v3, v4, v5, v6);
}

void __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_6_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Remote Anisette service successfuly provisioned.", v2, v3, v4, v5, v6);
}

void __63__AKAnisetteProvisioningController_syncWithSIMData_completion___block_invoke_8_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Remote Anisette service successfuly resynced provisioning data.", v2, v3, v4, v5, v6);
}

void __56__AKAnisetteProvisioningController_eraseWithCompletion___block_invoke_11_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Remote Anisette service successfuly erased provisioning data.", v2, v3, v4, v5, v6);
}

- (void)anisetteDataForURLRequest:completion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Not allowed to use Anisette data with non-HTTPS URLs.", v2, v3, v4, v5, v6);
}

- (void)fetchAnisetteDataAndProvisionIfNecessary:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Anisette fetch failed with XPC error, retrying...", v2, v3, v4, v5, v6);
}

- (void)_fetchAnisetteDataAndProvisionIfNecessary:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_193494000, a2, a3, "Remote Anisette service returned an error: %@", a5, a6, a7, a8, 2u);
}

void __84__AKAnisetteProvisioningController__fetchAnisetteDataAndProvisionIfNecessary_error___block_invoke_12_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Remote Anisette service returned Anisette data.", v2, v3, v4, v5, v6);
}

void __77__AKAnisetteProvisioningController_legacyAnisetteDataForDSID_withCompletion___block_invoke_18_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Remote Anisette service returned legacy Anisette data.", v2, v3, v4, v5, v6);
}

void __82__AKAnisetteProvisioningController_fetchPeerAttestationDataForRequest_completion___block_invoke_21_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Remote Anisette service returned Attestation data.", v2, v3, v4, v5, v6);
}

- (void)attestationDataForRequest:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Attestation fetch failed with XPC error, retrying...", v2, v3, v4, v5, v6);
}

void __74__AKAnisetteProvisioningController__attestationDataForRequest_completion___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*(id *)(a1 + 32) URL];
  uint8_t v6 = [a2 attestationHeaders];
  int v7 = 138412802;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  id v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = 0;
  _os_log_debug_impl(&dword_193494000, a3, OS_LOG_TYPE_DEBUG, "Attestation for request [%@] - headers [%@], error - [%@]", (uint8_t *)&v7, 0x20u);
}

void __70__AKAnisetteProvisioningController_resetDeviceIdentityWithCompletion___block_invoke_27_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Remote Anisette service reset BAA certs successfully.", v2, v3, v4, v5, v6);
}

void __70__AKAnisetteProvisioningController_resetDeviceIdentityWithCompletion___block_invoke_27_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Remote Anisette service returned an error during resetting device identity: %@", v2, v3, v4, v5, v6);
}

void __79__AKAnisetteProvisioningController_setTimeAdjustmentWithServerTime_completion___block_invoke_28_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Successfully set server time adjustment.", v2, v3, v4, v5, v6);
}

void __72__AKAnisetteProvisioningController_postAttestationAnalytics_completion___block_invoke_29_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Successfully posted analytics.", v2, v3, v4, v5, v6);
}

void __55__AKAnisetteProvisioningController__tearDownConnection__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Tearing down connection to akd...", v2, v3, v4, v5, v6);
}

void __62__AKAnisetteProvisioningController__anisetteServiceConnection__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Connection to akd was interrupted!", v2, v3, v4, v5, v6);
}

void __62__AKAnisetteProvisioningController__anisetteServiceConnection__block_invoke_2_36_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Connection to akd was invalidated.", v2, v3, v4, v5, v6);
}

@end