@interface AAInheritanceController
- (AAFXPCSession)remoteService;
- (AAInheritanceController)init;
- (void)configureRemoteInterface:(id)a3;
- (void)dealloc;
- (void)fetchAllHealthInfoWithCompletion:(id)a3;
- (void)fetchBenefactorsWithCompletion:(id)a3;
- (void)fetchBeneficiariesWithCompletion:(id)a3;
- (void)fetchInvitationWithBeneficiaryID:(id)a3 completion:(id)a4;
- (void)fetchInvitationsWithCompletion:(id)a3;
- (void)fetchManifestOptionsForContact:(id)a3 completion:(id)a4;
- (void)fetchSuggestedBeneficiariesWithCompletion:(id)a3;
- (void)isRecipient:(id)a3 capableOf:(id)a4 completion:(id)a5;
- (void)presentInheritanceInvitationUIWithBeneficiaryID:(id)a3 completion:(id)a4;
- (void)removeAccessCodeForContactInfo:(id)a3 completion:(id)a4;
- (void)removeBenefactor:(id)a3 completion:(id)a4;
- (void)removeBeneficiary:(id)a3 manifest:(id)a4 completion:(id)a5;
- (void)removeInvitation:(id)a3 completion:(id)a4;
- (void)respondToInvitation:(id)a3 accepted:(BOOL)a4 completion:(id)a5;
- (void)sendInvitationToContact:(id)a3 completion:(id)a4;
- (void)setRemoteService:(id)a3;
- (void)setupBeneficiaryAliasWithAccessKey:(id)a3 password:(id)a4 firstName:(id)a5 lastName:(id)a6 authToken:(id)a7 completion:(id)a8;
- (void)setupBeneficiaryManifest:(id)a3 contactInfo:(id)a4 setupAuthToken:(id)a5 completion:(id)a6;
- (void)updateAccessCodeForContactInfo:(id)a3 completion:(id)a4;
- (void)updateBeneficiaryManifest:(id)a3 contactInfo:(id)a4 completion:(id)a5;
@end

@implementation AAInheritanceController

- (AAInheritanceController)init
{
  v7.receiver = self;
  v7.super_class = (Class)AAInheritanceController;
  v2 = [(AAInheritanceController *)&v7 init];
  if (v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F47010]) initWithServiceName:@"com.apple.aa.inheritance.xpc" remoteProtocol:&unk_1EF48FD08 options:0];
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F47008]) initWithRemoteServiceConfig:v3 delegate:v2];
    remoteService = v2->_remoteService;
    v2->_remoteService = (AAFXPCSession *)v4;

    [(AAFXPCSession *)v2->_remoteService resume];
  }
  return v2;
}

- (void)dealloc
{
  v3 = _AALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(AATrustedContactFlowPresenter *)(uint64_t)self dealloc];
  }

  [(AAFXPCSession *)self->_remoteService invalidate];
  remoteService = self->_remoteService;
  self->_remoteService = 0;

  v5.receiver = self;
  v5.super_class = (Class)AAInheritanceController;
  [(AAInheritanceController *)&v5 dealloc];
}

- (void)fetchManifestOptionsForContact:(id)a3 completion:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 46, @"Invalid parameter not satisfying: %@", @"contact" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_10:
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 47, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_10;
  }
LABEL_3:
  v10 = _os_activity_create(&dword_1A11D8000, "inheritance-appleaccount/fetch-dataclass-rules", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  v11 = _AASignpostLogSystem();
  os_signpost_id_t v12 = _AASignpostCreate(v11);
  uint64_t v14 = v13;

  v15 = _AASignpostLogSystem();
  v16 = v15;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FetchContactManifestOptions", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  v17 = _AASignpostLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_1A11D8000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchContactManifestOptions  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__8;
  v37 = __Block_byref_object_dispose__8;
  v18 = self;
  v38 = v18;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __69__AAInheritanceController_fetchManifestOptionsForContact_completion___block_invoke;
  v28[3] = &unk_1E5A49F70;
  p_long long buf = &buf;
  os_signpost_id_t v31 = v12;
  uint64_t v32 = v14;
  id v19 = v9;
  id v29 = v19;
  v20 = (void *)MEMORY[0x1A622F430](v28);
  remoteService = v18->_remoteService;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __69__AAInheritanceController_fetchManifestOptionsForContact_completion___block_invoke_80;
  v26[3] = &unk_1E5A48680;
  id v22 = v20;
  id v27 = v22;
  v23 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v26];
  [v23 fetchManifestOptionsForContact:v7 completion:v22];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __69__AAInheritanceController_fetchManifestOptionsForContact_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *(void *)(a1[5] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
  id v8 = a2;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  v10 = _AASignpostLogSystem();
  v11 = v10;
  os_signpost_id_t v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    uint64_t v13 = _AAErrorUnderlyingError(v5);
    int v19 = 67240192;
    LODWORD(v20) = [v13 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v11, OS_SIGNPOST_INTERVAL_END, v12, "FetchContactManifestOptions", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 8u);
  }
  uint64_t v14 = _AASignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = (double)Nanoseconds / 1000000000.0;
    uint64_t v16 = a1[6];
    v17 = _AAErrorUnderlyingError(v5);
    int v18 = [v17 code];
    int v19 = 134218496;
    uint64_t v20 = v16;
    __int16 v21 = 2048;
    double v22 = v15;
    __int16 v23 = 1026;
    int v24 = v18;
    _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchContactManifestOptions  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 0x1Cu);
  }
  (*(void (**)(void))(a1[4] + 16))();
}

void __69__AAInheritanceController_fetchManifestOptionsForContact_completion___block_invoke_80(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__AAInheritanceController_fetchManifestOptionsForContact_completion___block_invoke_80_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)isRecipient:(id)a3 capableOf:(id)a4 completion:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_11:
    id v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 69, @"Invalid parameter not satisfying: %@", @"capability" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
LABEL_12:
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 70, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    goto LABEL_4;
  }
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 68, @"Invalid parameter not satisfying: %@", @"handle" object file lineNumber description];

  if (!v10) {
    goto LABEL_11;
  }
LABEL_3:
  if (!v11) {
    goto LABEL_12;
  }
LABEL_4:
  os_signpost_id_t v12 = _os_activity_create(&dword_1A11D8000, "inheritance-appleaccount/is-recipient-capable", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  uint64_t v13 = _AASignpostLogSystem();
  os_signpost_id_t v14 = _AASignpostCreate(v13);
  uint64_t v16 = v15;

  v17 = _AASignpostLogSystem();
  int v18 = v17;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v14, "BeneficiaryIsRecipientCapable", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  int v19 = _AASignpostLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v14;
    _os_log_impl(&dword_1A11D8000, v19, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: BeneficiaryIsRecipientCapable  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = __Block_byref_object_copy__8;
  v40 = __Block_byref_object_dispose__8;
  uint64_t v20 = self;
  v41 = v20;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __60__AAInheritanceController_isRecipient_capableOf_completion___block_invoke;
  v31[3] = &unk_1E5A49F98;
  p_long long buf = &buf;
  os_signpost_id_t v34 = v14;
  uint64_t v35 = v16;
  id v21 = v11;
  id v32 = v21;
  double v22 = (void *)MEMORY[0x1A622F430](v31);
  remoteService = v20->_remoteService;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __60__AAInheritanceController_isRecipient_capableOf_completion___block_invoke_89;
  v29[3] = &unk_1E5A48680;
  id v24 = v22;
  id v30 = v24;
  uint64_t v25 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v29];
  [v25 isRecipient:v9 capableOf:v10 completion:v24];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

uint64_t __60__AAInheritanceController_isRecipient_capableOf_completion___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  id v7 = _AASignpostLogSystem();
  id v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v12 = 67240192;
    LODWORD(v13) = a2;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v8, OS_SIGNPOST_INTERVAL_END, v9, "BeneficiaryIsRecipientCapable", " isSupported=%{public,signpost.telemetry:number2,name=isSupported}d ", (uint8_t *)&v12, 8u);
  }

  id v10 = _AASignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134218496;
    uint64_t v13 = a1[6];
    __int16 v14 = 2048;
    double v15 = (double)Nanoseconds / 1000000000.0;
    __int16 v16 = 1026;
    int v17 = a2;
    _os_log_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: BeneficiaryIsRecipientCapable  isSupported=%{public,signpost.telemetry:number2,name=isSupported}d ", (uint8_t *)&v12, 0x1Cu);
  }

  uint64_t result = a1[4];
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

void __60__AAInheritanceController_isRecipient_capableOf_completion___block_invoke_89(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__AAInheritanceController_isRecipient_capableOf_completion___block_invoke_89_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setupBeneficiaryManifest:(id)a3 contactInfo:(id)a4 setupAuthToken:(id)a5 completion:(id)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    id v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 95, @"Invalid parameter not satisfying: %@", @"manifest" object file lineNumber description];

    if (v12)
    {
LABEL_3:
      if (v13) {
        goto LABEL_4;
      }
LABEL_13:
      os_signpost_id_t v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 97, @"Invalid parameter not satisfying: %@", @"beneficiarySetupAuthToken" object file lineNumber description];

      if (v14) {
        goto LABEL_5;
      }
LABEL_14:
      id v32 = [MEMORY[0x1E4F28B00] currentHandler];
      [v32 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 98, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

      goto LABEL_5;
    }
  }
  id v30 = [MEMORY[0x1E4F28B00] currentHandler];
  [v30 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 96, @"Invalid parameter not satisfying: %@", @"contactInfo" object file lineNumber description];

  if (!v13) {
    goto LABEL_13;
  }
LABEL_4:
  if (!v14) {
    goto LABEL_14;
  }
LABEL_5:
  double v15 = _os_activity_create(&dword_1A11D8000, "inheritance-appleaccount/setup-beneficiary-manifest", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v15, &state);
  __int16 v16 = _AASignpostLogSystem();
  os_signpost_id_t v17 = _AASignpostCreate(v16);
  uint64_t v19 = v18;

  uint64_t v20 = _AASignpostLogSystem();
  id v21 = v20;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v17, "SetupBeneficiaryManifest", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  double v22 = _AASignpostLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v17;
    _os_log_impl(&dword_1A11D8000, v22, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SetupBeneficiaryManifest  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__8;
  v44 = __Block_byref_object_dispose__8;
  __int16 v23 = self;
  v45 = v23;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __90__AAInheritanceController_setupBeneficiaryManifest_contactInfo_setupAuthToken_completion___block_invoke;
  v35[3] = &unk_1E5A49FC0;
  p_long long buf = &buf;
  os_signpost_id_t v38 = v17;
  uint64_t v39 = v19;
  id v24 = v14;
  id v36 = v24;
  uint64_t v25 = (void *)MEMORY[0x1A622F430](v35);
  remoteService = v23->_remoteService;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __90__AAInheritanceController_setupBeneficiaryManifest_contactInfo_setupAuthToken_completion___block_invoke_100;
  v33[3] = &unk_1E5A48680;
  id v27 = v25;
  id v34 = v27;
  v28 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v33];
  [v28 setupBeneficiaryManifest:v11 contactInfo:v12 setupAuthToken:v13 completion:v27];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __90__AAInheritanceController_setupBeneficiaryManifest_contactInfo_setupAuthToken_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *(void *)(a1[5] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
  id v8 = a2;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  id v10 = _AASignpostLogSystem();
  id v11 = v10;
  os_signpost_id_t v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    id v13 = _AAErrorUnderlyingError(v5);
    int v19 = 67240192;
    LODWORD(v20) = [v13 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v11, OS_SIGNPOST_INTERVAL_END, v12, "SetupBeneficiaryManifest", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 8u);
  }
  id v14 = _AASignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = (double)Nanoseconds / 1000000000.0;
    uint64_t v16 = a1[6];
    os_signpost_id_t v17 = _AAErrorUnderlyingError(v5);
    int v18 = [v17 code];
    int v19 = 134218496;
    uint64_t v20 = v16;
    __int16 v21 = 2048;
    double v22 = v15;
    __int16 v23 = 1026;
    int v24 = v18;
    _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SetupBeneficiaryManifest  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 0x1Cu);
  }
  (*(void (**)(void))(a1[4] + 16))();
}

void __90__AAInheritanceController_setupBeneficiaryManifest_contactInfo_setupAuthToken_completion___block_invoke_100(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __90__AAInheritanceController_setupBeneficiaryManifest_contactInfo_setupAuthToken_completion___block_invoke_100_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeAccessCodeForContactInfo:(id)a3 completion:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  os_signpost_id_t v9 = v8;
  if (!v7)
  {
    int v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 122, @"Invalid parameter not satisfying: %@", @"contactInfo" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_10:
    uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 123, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_10;
  }
LABEL_3:
  id v10 = _os_activity_create(&dword_1A11D8000, "inheritance-appleaccount/update-access-code", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  id v11 = _AASignpostLogSystem();
  os_signpost_id_t v12 = _AASignpostCreate(v11);
  uint64_t v14 = v13;

  double v15 = _AASignpostLogSystem();
  uint64_t v16 = v15;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v12, "RemoveAccessCode", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  os_signpost_id_t v17 = _AASignpostLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_1A11D8000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RemoveAccessCode  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy__8;
  v37 = __Block_byref_object_dispose__8;
  int v18 = self;
  os_signpost_id_t v38 = v18;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __69__AAInheritanceController_removeAccessCodeForContactInfo_completion___block_invoke;
  v28[3] = &unk_1E5A49FE8;
  p_long long buf = &buf;
  os_signpost_id_t v31 = v12;
  uint64_t v32 = v14;
  id v19 = v9;
  id v29 = v19;
  uint64_t v20 = (void *)MEMORY[0x1A622F430](v28);
  remoteService = v18->_remoteService;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __69__AAInheritanceController_removeAccessCodeForContactInfo_completion___block_invoke_101;
  v26[3] = &unk_1E5A48680;
  id v22 = v20;
  id v27 = v22;
  __int16 v23 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v26];
  [v23 removeAccessCodeForContactInfo:v7 completion:v22];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __69__AAInheritanceController_removeAccessCodeForContactInfo_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  id v7 = _AASignpostLogSystem();
  id v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    id v10 = _AAErrorUnderlyingError(v3);
    int v16 = 67240192;
    LODWORD(v17) = [v10 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RemoveAccessCode", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 8u);
  }
  id v11 = _AASignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (double)Nanoseconds / 1000000000.0;
    uint64_t v13 = a1[6];
    uint64_t v14 = _AAErrorUnderlyingError(v3);
    int v15 = [v14 code];
    int v16 = 134218496;
    uint64_t v17 = v13;
    __int16 v18 = 2048;
    double v19 = v12;
    __int16 v20 = 1026;
    int v21 = v15;
    _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RemoveAccessCode  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 0x1Cu);
  }
  (*(void (**)(void))(a1[4] + 16))();
}

void __69__AAInheritanceController_removeAccessCodeForContactInfo_completion___block_invoke_101(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__AAInheritanceController_removeAccessCodeForContactInfo_completion___block_invoke_101_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeBeneficiary:(id)a3 manifest:(id)a4 completion:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  double v12 = v11;
  if (!v9)
  {
    id v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 146, @"Invalid parameter not satisfying: %@", @"beneficiary" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
LABEL_10:
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 147, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v11) {
    goto LABEL_10;
  }
LABEL_3:
  uint64_t v13 = _os_activity_create(&dword_1A11D8000, "inheritance-appleaccount/remove-beneficiary", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  uint64_t v14 = _AASignpostLogSystem();
  os_signpost_id_t v15 = _AASignpostCreate(v14);
  uint64_t v17 = v16;

  __int16 v18 = _AASignpostLogSystem();
  double v19 = v18;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v15, "RemoveBeneficiary", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  __int16 v20 = _AASignpostLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v15;
    _os_log_impl(&dword_1A11D8000, v20, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RemoveBeneficiary  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = __Block_byref_object_copy__8;
  v40 = __Block_byref_object_dispose__8;
  int v21 = self;
  v41 = v21;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __65__AAInheritanceController_removeBeneficiary_manifest_completion___block_invoke;
  v31[3] = &unk_1E5A49FE8;
  p_long long buf = &buf;
  os_signpost_id_t v34 = v15;
  uint64_t v35 = v17;
  id v22 = v12;
  id v32 = v22;
  __int16 v23 = (void *)MEMORY[0x1A622F430](v31);
  remoteService = v21->_remoteService;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __65__AAInheritanceController_removeBeneficiary_manifest_completion___block_invoke_105;
  v29[3] = &unk_1E5A48680;
  id v25 = v23;
  id v30 = v25;
  v26 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v29];
  [v26 removeBeneficiary:v9 manifest:v10 completion:v25];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __65__AAInheritanceController_removeBeneficiary_manifest_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  id v7 = _AASignpostLogSystem();
  id v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    id v10 = _AAErrorUnderlyingError(v3);
    int v16 = 67240192;
    LODWORD(v17) = [v10 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RemoveBeneficiary", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 8u);
  }
  id v11 = _AASignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (double)Nanoseconds / 1000000000.0;
    uint64_t v13 = a1[6];
    uint64_t v14 = _AAErrorUnderlyingError(v3);
    int v15 = [v14 code];
    int v16 = 134218496;
    uint64_t v17 = v13;
    __int16 v18 = 2048;
    double v19 = v12;
    __int16 v20 = 1026;
    int v21 = v15;
    _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RemoveBeneficiary  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 0x1Cu);
  }
  (*(void (**)(void))(a1[4] + 16))();
}

void __65__AAInheritanceController_removeBeneficiary_manifest_completion___block_invoke_105(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __65__AAInheritanceController_removeBeneficiary_manifest_completion___block_invoke_105_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeBenefactor:(id)a3 completion:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  os_signpost_id_t v9 = v8;
  if (!v7)
  {
    int v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 170, @"Invalid parameter not satisfying: %@", @"benefactor" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_10:
    id v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 171, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_10;
  }
LABEL_3:
  id v10 = _os_activity_create(&dword_1A11D8000, "inheritance-appleaccount/remove-benefactor", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  id v11 = _AASignpostLogSystem();
  os_signpost_id_t v12 = _AASignpostCreate(v11);
  uint64_t v14 = v13;

  int v15 = _AASignpostLogSystem();
  int v16 = v15;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v12, "RemoveBenefactor", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  uint64_t v17 = _AASignpostLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_1A11D8000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RemoveBenefactor  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy__8;
  v37 = __Block_byref_object_dispose__8;
  __int16 v18 = self;
  uint64_t v38 = v18;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __55__AAInheritanceController_removeBenefactor_completion___block_invoke;
  v28[3] = &unk_1E5A49FE8;
  p_long long buf = &buf;
  os_signpost_id_t v31 = v12;
  uint64_t v32 = v14;
  id v19 = v9;
  id v29 = v19;
  __int16 v20 = (void *)MEMORY[0x1A622F430](v28);
  remoteService = v18->_remoteService;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __55__AAInheritanceController_removeBenefactor_completion___block_invoke_109;
  v26[3] = &unk_1E5A48680;
  id v22 = v20;
  id v27 = v22;
  __int16 v23 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v26];
  [v23 removeBenefactor:v7 completion:v22];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __55__AAInheritanceController_removeBenefactor_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  id v7 = _AASignpostLogSystem();
  id v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    id v10 = _AAErrorUnderlyingError(v3);
    int v16 = 67240192;
    LODWORD(v17) = [v10 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RemoveBenefactor", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 8u);
  }
  id v11 = _AASignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (double)Nanoseconds / 1000000000.0;
    uint64_t v13 = a1[6];
    uint64_t v14 = _AAErrorUnderlyingError(v3);
    int v15 = [v14 code];
    int v16 = 134218496;
    uint64_t v17 = v13;
    __int16 v18 = 2048;
    double v19 = v12;
    __int16 v20 = 1026;
    int v21 = v15;
    _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RemoveBenefactor  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 0x1Cu);
  }
  (*(void (**)(void))(a1[4] + 16))();
}

void __55__AAInheritanceController_removeBenefactor_completion___block_invoke_109(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __55__AAInheritanceController_removeBenefactor_completion___block_invoke_109_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateAccessCodeForContactInfo:(id)a3 completion:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  os_signpost_id_t v9 = v8;
  if (!v7)
  {
    int v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 193, @"Invalid parameter not satisfying: %@", @"contactInfo" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_10:
    id v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 194, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_10;
  }
LABEL_3:
  id v10 = _os_activity_create(&dword_1A11D8000, "inheritance-appleaccount/remove-access-code", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  id v11 = _AASignpostLogSystem();
  os_signpost_id_t v12 = _AASignpostCreate(v11);
  uint64_t v14 = v13;

  int v15 = _AASignpostLogSystem();
  int v16 = v15;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v12, "UpdateAccessCode enableTelemetry=YES ", (const char *)&unk_1A12BB323, (uint8_t *)&buf, 2u);
  }

  uint64_t v17 = _AASignpostLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_1A11D8000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: UpdateAccessCode enableTelemetry=YES  ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy__8;
  v37 = __Block_byref_object_dispose__8;
  __int16 v18 = self;
  uint64_t v38 = v18;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __69__AAInheritanceController_updateAccessCodeForContactInfo_completion___block_invoke;
  v28[3] = &unk_1E5A49FE8;
  p_long long buf = &buf;
  os_signpost_id_t v31 = v12;
  uint64_t v32 = v14;
  id v19 = v9;
  id v29 = v19;
  __int16 v20 = (void *)MEMORY[0x1A622F430](v28);
  remoteService = v18->_remoteService;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __69__AAInheritanceController_updateAccessCodeForContactInfo_completion___block_invoke_110;
  v26[3] = &unk_1E5A48680;
  id v22 = v20;
  id v27 = v22;
  __int16 v23 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v26];
  [v23 updateAccessCodeForContactInfo:v7 completion:v22];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __69__AAInheritanceController_updateAccessCodeForContactInfo_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  id v7 = _AASignpostLogSystem();
  id v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    id v10 = _AAErrorUnderlyingError(v3);
    int v16 = 67240192;
    LODWORD(v17) = [v10 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v8, OS_SIGNPOST_INTERVAL_END, v9, "UpdateAccessCode", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 8u);
  }
  id v11 = _AASignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (double)Nanoseconds / 1000000000.0;
    uint64_t v13 = a1[6];
    uint64_t v14 = _AAErrorUnderlyingError(v3);
    int v15 = [v14 code];
    int v16 = 134218496;
    uint64_t v17 = v13;
    __int16 v18 = 2048;
    double v19 = v12;
    __int16 v20 = 1026;
    int v21 = v15;
    _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: UpdateAccessCode  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 0x1Cu);
  }
  (*(void (**)(void))(a1[4] + 16))();
}

void __69__AAInheritanceController_updateAccessCodeForContactInfo_completion___block_invoke_110(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__AAInheritanceController_updateAccessCodeForContactInfo_completion___block_invoke_110_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateBeneficiaryManifest:(id)a3 contactInfo:(id)a4 completion:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_11:
    id v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 218, @"Invalid parameter not satisfying: %@", @"contactInfo" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
LABEL_12:
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 219, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    goto LABEL_4;
  }
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 217, @"Invalid parameter not satisfying: %@", @"manifest" object file lineNumber description];

  if (!v10) {
    goto LABEL_11;
  }
LABEL_3:
  if (!v11) {
    goto LABEL_12;
  }
LABEL_4:
  double v12 = _os_activity_create(&dword_1A11D8000, "inheritance-appleaccount/remove-manifest", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  uint64_t v13 = _AASignpostLogSystem();
  os_signpost_id_t v14 = _AASignpostCreate(v13);
  uint64_t v16 = v15;

  uint64_t v17 = _AASignpostLogSystem();
  __int16 v18 = v17;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v14, "UpdateBeneficiaryManifest enableTelemetry=YES ", (const char *)&unk_1A12BB323, (uint8_t *)&buf, 2u);
  }

  double v19 = _AASignpostLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v14;
    _os_log_impl(&dword_1A11D8000, v19, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: UpdateBeneficiaryManifest enableTelemetry=YES  ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = __Block_byref_object_copy__8;
  v40 = __Block_byref_object_dispose__8;
  __int16 v20 = self;
  v41 = v20;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __76__AAInheritanceController_updateBeneficiaryManifest_contactInfo_completion___block_invoke;
  v31[3] = &unk_1E5A49FE8;
  p_long long buf = &buf;
  os_signpost_id_t v34 = v14;
  uint64_t v35 = v16;
  id v21 = v11;
  id v32 = v21;
  uint64_t v22 = (void *)MEMORY[0x1A622F430](v31);
  remoteService = v20->_remoteService;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __76__AAInheritanceController_updateBeneficiaryManifest_contactInfo_completion___block_invoke_111;
  v29[3] = &unk_1E5A48680;
  id v24 = v22;
  id v30 = v24;
  id v25 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v29];
  [v25 updateBeneficiaryManifest:v9 contactInfo:v10 completion:v24];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __76__AAInheritanceController_updateBeneficiaryManifest_contactInfo_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  id v7 = _AASignpostLogSystem();
  id v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    id v10 = _AAErrorUnderlyingError(v3);
    int v16 = 67240192;
    LODWORD(v17) = [v10 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v8, OS_SIGNPOST_INTERVAL_END, v9, "UpdateBeneficiaryManifest", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 8u);
  }
  id v11 = _AASignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (double)Nanoseconds / 1000000000.0;
    uint64_t v13 = a1[6];
    os_signpost_id_t v14 = _AAErrorUnderlyingError(v3);
    int v15 = [v14 code];
    int v16 = 134218496;
    uint64_t v17 = v13;
    __int16 v18 = 2048;
    double v19 = v12;
    __int16 v20 = 1026;
    int v21 = v15;
    _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: UpdateBeneficiaryManifest  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 0x1Cu);
  }
  (*(void (**)(void))(a1[4] + 16))();
}

void __76__AAInheritanceController_updateBeneficiaryManifest_contactInfo_completion___block_invoke_111(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__AAInheritanceController_updateBeneficiaryManifest_contactInfo_completion___block_invoke_111_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchBeneficiariesWithCompletion:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    __int16 v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 241, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  uint64_t v6 = _os_activity_create(&dword_1A11D8000, "inheritance-appleaccount/fetch-beneficiaries", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  id v7 = _AASignpostLogSystem();
  os_signpost_id_t v8 = _AASignpostCreate(v7);
  uint64_t v10 = v9;

  id v11 = _AASignpostLogSystem();
  double v12 = v11;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "FetchBeneficiaries enableTelemetry=YES ", (const char *)&unk_1A12BB323, (uint8_t *)&buf, 2u);
  }

  uint64_t v13 = _AASignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1A11D8000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchBeneficiaries enableTelemetry=YES  ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v30 = 0x3032000000;
  os_signpost_id_t v31 = __Block_byref_object_copy__8;
  id v32 = __Block_byref_object_dispose__8;
  os_signpost_id_t v14 = self;
  v33 = v14;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __60__AAInheritanceController_fetchBeneficiariesWithCompletion___block_invoke;
  v23[3] = &unk_1E5A4A010;
  p_long long buf = &buf;
  os_signpost_id_t v26 = v8;
  uint64_t v27 = v10;
  id v15 = v5;
  id v24 = v15;
  int v16 = (void *)MEMORY[0x1A622F430](v23);
  remoteService = v14->_remoteService;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __60__AAInheritanceController_fetchBeneficiariesWithCompletion___block_invoke_113;
  v21[3] = &unk_1E5A48680;
  id v18 = v16;
  id v22 = v18;
  double v19 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v21];
  [v19 fetchBeneficiariesWithCompletion:v18];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __60__AAInheritanceController_fetchBeneficiariesWithCompletion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[5] + 8);
  os_signpost_id_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  uint64_t v10 = _AASignpostLogSystem();
  id v11 = v10;
  os_signpost_id_t v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    uint64_t v13 = _AAErrorUnderlyingError(v6);
    int v20 = 67240192;
    LODWORD(v21) = [v13 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v11, OS_SIGNPOST_INTERVAL_END, v12, "FetchBeneficiaries", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 8u);
  }
  os_signpost_id_t v14 = _AASignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = (double)Nanoseconds / 1000000000.0;
    int v16 = (void *)a1[6];
    uint64_t v17 = _AAErrorUnderlyingError(v6);
    int v18 = [v17 code];
    int v20 = 134218496;
    id v21 = v16;
    __int16 v22 = 2048;
    double v23 = v15;
    __int16 v24 = 1026;
    int v25 = v18;
    _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchBeneficiaries  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 0x1Cu);
  }
  if (a1[4])
  {
    double v19 = _AALogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      id v21 = v5;
      _os_log_impl(&dword_1A11D8000, v19, OS_LOG_TYPE_DEFAULT, "Fetched Beneficiaries: %@", (uint8_t *)&v20, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }
}

void __60__AAInheritanceController_fetchBeneficiariesWithCompletion___block_invoke_113(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__AAInheritanceController_fetchBeneficiariesWithCompletion___block_invoke_113_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchBenefactorsWithCompletion:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    int v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 264, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v6 = _os_activity_create(&dword_1A11D8000, "inheritance-appleaccount/fetch-benefactors", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  uint64_t v7 = _AASignpostLogSystem();
  os_signpost_id_t v8 = _AASignpostCreate(v7);
  uint64_t v10 = v9;

  id v11 = _AASignpostLogSystem();
  os_signpost_id_t v12 = v11;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "FetchBenefactors enableTelemetry=YES ", (const char *)&unk_1A12BB323, (uint8_t *)&buf, 2u);
  }

  uint64_t v13 = _AASignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1A11D8000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchBenefactors enableTelemetry=YES  ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v30 = 0x3032000000;
  os_signpost_id_t v31 = __Block_byref_object_copy__8;
  id v32 = __Block_byref_object_dispose__8;
  os_signpost_id_t v14 = self;
  v33 = v14;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __58__AAInheritanceController_fetchBenefactorsWithCompletion___block_invoke;
  v23[3] = &unk_1E5A4A010;
  p_long long buf = &buf;
  os_signpost_id_t v26 = v8;
  uint64_t v27 = v10;
  id v15 = v5;
  id v24 = v15;
  int v16 = (void *)MEMORY[0x1A622F430](v23);
  remoteService = v14->_remoteService;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __58__AAInheritanceController_fetchBenefactorsWithCompletion___block_invoke_114;
  v21[3] = &unk_1E5A48680;
  id v18 = v16;
  id v22 = v18;
  double v19 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v21];
  [v19 fetchBenefactorsWithCompletion:v18];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __58__AAInheritanceController_fetchBenefactorsWithCompletion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[5] + 8);
  os_signpost_id_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  uint64_t v10 = _AASignpostLogSystem();
  id v11 = v10;
  os_signpost_id_t v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    uint64_t v13 = _AAErrorUnderlyingError(v6);
    int v20 = 67240192;
    LODWORD(v21) = [v13 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v11, OS_SIGNPOST_INTERVAL_END, v12, "FetchBenefactors", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 8u);
  }
  os_signpost_id_t v14 = _AASignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = (double)Nanoseconds / 1000000000.0;
    int v16 = (void *)a1[6];
    uint64_t v17 = _AAErrorUnderlyingError(v6);
    int v18 = [v17 code];
    int v20 = 134218496;
    id v21 = v16;
    __int16 v22 = 2048;
    double v23 = v15;
    __int16 v24 = 1026;
    int v25 = v18;
    _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchBenefactors  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 0x1Cu);
  }
  if (a1[4])
  {
    double v19 = _AALogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      id v21 = v5;
      _os_log_impl(&dword_1A11D8000, v19, OS_LOG_TYPE_DEFAULT, "Fetched Benefactors: %@", (uint8_t *)&v20, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }
}

void __58__AAInheritanceController_fetchBenefactorsWithCompletion___block_invoke_114(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __58__AAInheritanceController_fetchBenefactorsWithCompletion___block_invoke_114_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchSuggestedBeneficiariesWithCompletion:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    int v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 287, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v6 = _os_activity_create(&dword_1A11D8000, "inheritance-appleaccount/fetch-suugested-beneficiaries", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  uint64_t v7 = _AASignpostLogSystem();
  os_signpost_id_t v8 = _AASignpostCreate(v7);
  uint64_t v10 = v9;

  id v11 = _AASignpostLogSystem();
  os_signpost_id_t v12 = v11;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "FetchSuggestedBeneficiaries enableTelemetry=YES ", (const char *)&unk_1A12BB323, (uint8_t *)&buf, 2u);
  }

  uint64_t v13 = _AASignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1A11D8000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchSuggestedBeneficiaries enableTelemetry=YES  ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v30 = 0x3032000000;
  os_signpost_id_t v31 = __Block_byref_object_copy__8;
  id v32 = __Block_byref_object_dispose__8;
  os_signpost_id_t v14 = self;
  v33 = v14;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __69__AAInheritanceController_fetchSuggestedBeneficiariesWithCompletion___block_invoke;
  v23[3] = &unk_1E5A4A010;
  p_long long buf = &buf;
  os_signpost_id_t v26 = v8;
  uint64_t v27 = v10;
  id v15 = v5;
  id v24 = v15;
  int v16 = (void *)MEMORY[0x1A622F430](v23);
  remoteService = v14->_remoteService;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __69__AAInheritanceController_fetchSuggestedBeneficiariesWithCompletion___block_invoke_115;
  v21[3] = &unk_1E5A48680;
  id v18 = v16;
  id v22 = v18;
  double v19 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v21];
  [v19 fetchSuggestedBeneficiariesWithCompletion:v18];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __69__AAInheritanceController_fetchSuggestedBeneficiariesWithCompletion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[5] + 8);
  os_signpost_id_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  uint64_t v10 = _AASignpostLogSystem();
  id v11 = v10;
  os_signpost_id_t v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    uint64_t v13 = _AAErrorUnderlyingError(v6);
    int v20 = 67240192;
    LODWORD(v21) = [v13 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v11, OS_SIGNPOST_INTERVAL_END, v12, "FetchSuggestedBeneficiaries", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 8u);
  }
  os_signpost_id_t v14 = _AASignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = (double)Nanoseconds / 1000000000.0;
    int v16 = (void *)a1[6];
    uint64_t v17 = _AAErrorUnderlyingError(v6);
    int v18 = [v17 code];
    int v20 = 134218496;
    id v21 = v16;
    __int16 v22 = 2048;
    double v23 = v15;
    __int16 v24 = 1026;
    int v25 = v18;
    _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchSuggestedBeneficiaries  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 0x1Cu);
  }
  if (a1[4])
  {
    double v19 = _AALogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      id v21 = v5;
      _os_log_impl(&dword_1A11D8000, v19, OS_LOG_TYPE_DEFAULT, "Suggested Beneficiaries: %@", (uint8_t *)&v20, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }
}

void __69__AAInheritanceController_fetchSuggestedBeneficiariesWithCompletion___block_invoke_115(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__AAInheritanceController_fetchSuggestedBeneficiariesWithCompletion___block_invoke_115_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendInvitationToContact:(id)a3 completion:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (!v7)
  {
    __int16 v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 310, @"Invalid parameter not satisfying: %@", @"contactInfo" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_10:
    int v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 311, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_10;
  }
LABEL_3:
  uint64_t v10 = _os_activity_create(&dword_1A11D8000, "inheritance-appleaccount/send-invitation", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  id v11 = _AASignpostLogSystem();
  os_signpost_id_t v12 = _AASignpostCreate(v11);
  uint64_t v14 = v13;

  double v15 = _AASignpostLogSystem();
  int v16 = v15;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v12, "SendInvitationToContact enableTelemetry=YES ", (const char *)&unk_1A12BB323, (uint8_t *)&buf, 2u);
  }

  uint64_t v17 = _AASignpostLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_1A11D8000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SendInvitationToContact enableTelemetry=YES  ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy__8;
  v37 = __Block_byref_object_dispose__8;
  int v18 = self;
  uint64_t v38 = v18;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __62__AAInheritanceController_sendInvitationToContact_completion___block_invoke;
  v28[3] = &unk_1E5A49FE8;
  p_long long buf = &buf;
  os_signpost_id_t v31 = v12;
  uint64_t v32 = v14;
  id v19 = v9;
  id v29 = v19;
  int v20 = (void *)MEMORY[0x1A622F430](v28);
  remoteService = v18->_remoteService;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __62__AAInheritanceController_sendInvitationToContact_completion___block_invoke_116;
  v26[3] = &unk_1E5A48680;
  id v22 = v20;
  id v27 = v22;
  double v23 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v26];
  [v23 sendInvitationToContact:v7 completion:v22];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __62__AAInheritanceController_sendInvitationToContact_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  id v7 = _AASignpostLogSystem();
  id v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    uint64_t v10 = _AAErrorUnderlyingError(v3);
    int v17 = 67240192;
    LODWORD(v18) = [v10 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SendInvitationToContact", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }
  id v11 = _AASignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (double)Nanoseconds / 1000000000.0;
    uint64_t v13 = a1[6];
    uint64_t v14 = _AAErrorUnderlyingError(v3);
    int v15 = [v14 code];
    int v17 = 134218496;
    uint64_t v18 = v13;
    __int16 v19 = 2048;
    double v20 = v12;
    __int16 v21 = 1026;
    int v22 = v15;
    _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SendInvitationToContact  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }
  if (a1[4])
  {
    int v16 = _AALogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1A11D8000, v16, OS_LOG_TYPE_DEFAULT, "Sent Invitation.", (uint8_t *)&v17, 2u);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }
}

void __62__AAInheritanceController_sendInvitationToContact_completion___block_invoke_116(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__AAInheritanceController_sendInvitationToContact_completion___block_invoke_116_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchInvitationsWithCompletion:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    double v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 334, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v6 = _os_activity_create(&dword_1A11D8000, "inheritance-appleaccount/fetch-invitations", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  id v7 = _AASignpostLogSystem();
  os_signpost_id_t v8 = _AASignpostCreate(v7);
  uint64_t v10 = v9;

  id v11 = _AASignpostLogSystem();
  double v12 = v11;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "FetchInvitations enableTelemetry=YES ", (const char *)&unk_1A12BB323, (uint8_t *)&buf, 2u);
  }

  uint64_t v13 = _AASignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1A11D8000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchInvitations enableTelemetry=YES  ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v30 = 0x3032000000;
  os_signpost_id_t v31 = __Block_byref_object_copy__8;
  uint64_t v32 = __Block_byref_object_dispose__8;
  uint64_t v14 = self;
  v33 = v14;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __58__AAInheritanceController_fetchInvitationsWithCompletion___block_invoke;
  v23[3] = &unk_1E5A4A010;
  p_long long buf = &buf;
  os_signpost_id_t v26 = v8;
  uint64_t v27 = v10;
  id v15 = v5;
  id v24 = v15;
  int v16 = (void *)MEMORY[0x1A622F430](v23);
  remoteService = v14->_remoteService;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __58__AAInheritanceController_fetchInvitationsWithCompletion___block_invoke_117;
  v21[3] = &unk_1E5A48680;
  id v18 = v16;
  id v22 = v18;
  __int16 v19 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v21];
  [v19 fetchInvitationsWithCompletion:v18];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __58__AAInheritanceController_fetchInvitationsWithCompletion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[5] + 8);
  os_signpost_id_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  uint64_t v10 = _AASignpostLogSystem();
  id v11 = v10;
  os_signpost_id_t v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    uint64_t v13 = _AAErrorUnderlyingError(v6);
    int v20 = 67240192;
    LODWORD(v21) = [v13 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v11, OS_SIGNPOST_INTERVAL_END, v12, "FetchInvitations", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 8u);
  }
  uint64_t v14 = _AASignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = (double)Nanoseconds / 1000000000.0;
    int v16 = (void *)a1[6];
    int v17 = _AAErrorUnderlyingError(v6);
    int v18 = [v17 code];
    int v20 = 134218496;
    id v21 = v16;
    __int16 v22 = 2048;
    double v23 = v15;
    __int16 v24 = 1026;
    int v25 = v18;
    _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchInvitations  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 0x1Cu);
  }
  if (a1[4])
  {
    __int16 v19 = _AALogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      id v21 = v5;
      _os_log_impl(&dword_1A11D8000, v19, OS_LOG_TYPE_DEFAULT, "Fetched Invitations: %@", (uint8_t *)&v20, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }
}

void __58__AAInheritanceController_fetchInvitationsWithCompletion___block_invoke_117(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __58__AAInheritanceController_fetchInvitationsWithCompletion___block_invoke_117_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchInvitationWithBeneficiaryID:(id)a3 completion:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    double v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 357, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  uint64_t v9 = _os_activity_create(&dword_1A11D8000, "inheritance-appleaccount/fetch-invitation", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  uint64_t v10 = _AASignpostLogSystem();
  os_signpost_id_t v11 = _AASignpostCreate(v10);
  uint64_t v13 = v12;

  uint64_t v14 = _AASignpostLogSystem();
  double v15 = v14;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "BeneficiaryInvitation enableTelemetry=YES ", (const char *)&unk_1A12BB323, (uint8_t *)&buf, 2u);
  }

  int v16 = _AASignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_1A11D8000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: BeneficiaryInvitation enableTelemetry=YES  ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__8;
  uint64_t v35 = __Block_byref_object_dispose__8;
  int v17 = self;
  id v36 = v17;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __71__AAInheritanceController_fetchInvitationWithBeneficiaryID_completion___block_invoke;
  v26[3] = &unk_1E5A4A038;
  p_long long buf = &buf;
  os_signpost_id_t v29 = v11;
  uint64_t v30 = v13;
  id v18 = v8;
  id v27 = v18;
  __int16 v19 = (void *)MEMORY[0x1A622F430](v26);
  remoteService = v17->_remoteService;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __71__AAInheritanceController_fetchInvitationWithBeneficiaryID_completion___block_invoke_119;
  v24[3] = &unk_1E5A48680;
  id v21 = v19;
  id v25 = v21;
  __int16 v22 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v24];
  [v22 fetchInvitationWithBeneficiaryID:v7 completion:v21];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __71__AAInheritanceController_fetchInvitationWithBeneficiaryID_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[5] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  uint64_t v10 = _AASignpostLogSystem();
  os_signpost_id_t v11 = v10;
  os_signpost_id_t v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    uint64_t v13 = _AAErrorUnderlyingError(v6);
    int v20 = 67240192;
    LODWORD(v21) = [v13 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v11, OS_SIGNPOST_INTERVAL_END, v12, "BeneficiaryInvitation", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 8u);
  }
  uint64_t v14 = _AASignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = (double)Nanoseconds / 1000000000.0;
    int v16 = (void *)a1[6];
    int v17 = _AAErrorUnderlyingError(v6);
    int v18 = [v17 code];
    int v20 = 134218496;
    id v21 = v16;
    __int16 v22 = 2048;
    double v23 = v15;
    __int16 v24 = 1026;
    int v25 = v18;
    _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: BeneficiaryInvitation  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 0x1Cu);
  }
  if (a1[4])
  {
    __int16 v19 = _AALogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      id v21 = v5;
      _os_log_impl(&dword_1A11D8000, v19, OS_LOG_TYPE_DEFAULT, "Fetched Invitation: %@", (uint8_t *)&v20, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }
}

void __71__AAInheritanceController_fetchInvitationWithBeneficiaryID_completion___block_invoke_119(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __71__AAInheritanceController_fetchInvitationWithBeneficiaryID_completion___block_invoke_119_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeInvitation:(id)a3 completion:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    double v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 381, @"Invalid parameter not satisfying: %@", @"invitation" object file lineNumber description];
  }
  uint64_t v9 = _os_activity_create(&dword_1A11D8000, "inheritance-appleaccount/remove-invitation", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  uint64_t v10 = _AASignpostLogSystem();
  os_signpost_id_t v11 = _AASignpostCreate(v10);
  uint64_t v13 = v12;

  uint64_t v14 = _AASignpostLogSystem();
  double v15 = v14;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "RemoveInvitation enableTelemetry=YES ", (const char *)&unk_1A12BB323, (uint8_t *)&buf, 2u);
  }

  int v16 = _AASignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_1A11D8000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RemoveInvitation enableTelemetry=YES  ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__8;
  uint64_t v35 = __Block_byref_object_dispose__8;
  int v17 = self;
  id v36 = v17;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __55__AAInheritanceController_removeInvitation_completion___block_invoke;
  v26[3] = &unk_1E5A49FE8;
  p_long long buf = &buf;
  os_signpost_id_t v29 = v11;
  uint64_t v30 = v13;
  id v18 = v8;
  id v27 = v18;
  __int16 v19 = (void *)MEMORY[0x1A622F430](v26);
  remoteService = v17->_remoteService;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __55__AAInheritanceController_removeInvitation_completion___block_invoke_123;
  v24[3] = &unk_1E5A48680;
  id v21 = v19;
  id v25 = v21;
  __int16 v22 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v24];
  [v22 removeInvitation:v7 completion:v21];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __55__AAInheritanceController_removeInvitation_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  id v7 = _AASignpostLogSystem();
  id v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    uint64_t v10 = _AAErrorUnderlyingError(v3);
    int v17 = 67240192;
    LODWORD(v18) = [v10 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RemoveInvitation", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }
  os_signpost_id_t v11 = _AASignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (double)Nanoseconds / 1000000000.0;
    uint64_t v13 = a1[6];
    uint64_t v14 = _AAErrorUnderlyingError(v3);
    int v15 = [v14 code];
    int v17 = 134218496;
    uint64_t v18 = v13;
    __int16 v19 = 2048;
    double v20 = v12;
    __int16 v21 = 1026;
    int v22 = v15;
    _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RemoveInvitation  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }
  if (a1[4])
  {
    int v16 = _AALogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1A11D8000, v16, OS_LOG_TYPE_DEFAULT, "Removed Invitation.", (uint8_t *)&v17, 2u);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }
}

void __55__AAInheritanceController_removeInvitation_completion___block_invoke_123(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __55__AAInheritanceController_removeInvitation_completion___block_invoke_123_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)respondToInvitation:(id)a3 accepted:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    id v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 406, @"Invalid parameter not satisfying: %@", @"beneficiaryID" object file lineNumber description];
  }
  os_signpost_id_t v11 = _os_activity_create(&dword_1A11D8000, "inheritance-appleaccount/respond-invitation", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  double v12 = _AASignpostLogSystem();
  os_signpost_id_t v13 = _AASignpostCreate(v12);
  uint64_t v15 = v14;

  int v16 = _AASignpostLogSystem();
  int v17 = v16;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v13, "RespondToInvitation enableTelemetry=YES ", (const char *)&unk_1A12BB323, (uint8_t *)&buf, 2u);
  }

  uint64_t v18 = _AASignpostLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_1A11D8000, v18, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RespondToInvitation enableTelemetry=YES  ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy__8;
  uint64_t v37 = __Block_byref_object_dispose__8;
  __int16 v19 = self;
  uint64_t v38 = v19;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __67__AAInheritanceController_respondToInvitation_accepted_completion___block_invoke;
  v28[3] = &unk_1E5A49FE8;
  p_long long buf = &buf;
  os_signpost_id_t v31 = v13;
  uint64_t v32 = v15;
  id v20 = v10;
  id v29 = v20;
  __int16 v21 = (void *)MEMORY[0x1A622F430](v28);
  remoteService = v19->_remoteService;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __67__AAInheritanceController_respondToInvitation_accepted_completion___block_invoke_127;
  v26[3] = &unk_1E5A48680;
  id v23 = v21;
  id v27 = v23;
  __int16 v24 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v26];
  [v24 respondToInvitation:v9 accepted:v6 completion:v23];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __67__AAInheritanceController_respondToInvitation_accepted_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  id v7 = _AASignpostLogSystem();
  id v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    id v10 = _AAErrorUnderlyingError(v3);
    int v16 = 67240192;
    LODWORD(v17) = [v10 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RespondToInvitation", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 8u);
  }
  os_signpost_id_t v11 = _AASignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (double)Nanoseconds / 1000000000.0;
    uint64_t v13 = a1[6];
    uint64_t v14 = _AAErrorUnderlyingError(v3);
    int v15 = [v14 code];
    int v16 = 134218496;
    uint64_t v17 = v13;
    __int16 v18 = 2048;
    double v19 = v12;
    __int16 v20 = 1026;
    int v21 = v15;
    _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RespondToInvitation  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 0x1Cu);
  }
  (*(void (**)(void))(a1[4] + 16))();
}

void __67__AAInheritanceController_respondToInvitation_accepted_completion___block_invoke_127(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __67__AAInheritanceController_respondToInvitation_accepted_completion___block_invoke_127_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAllHealthInfoWithCompletion:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    __int16 v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 428, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  BOOL v6 = _os_activity_create(&dword_1A11D8000, "inheritance-appleaccount/fetch-inheritance-health-info", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  id v7 = _AASignpostLogSystem();
  os_signpost_id_t v8 = _AASignpostCreate(v7);
  uint64_t v10 = v9;

  os_signpost_id_t v11 = _AASignpostLogSystem();
  double v12 = v11;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "FetchAllHealthInfo enableTelemetry=YES ", (const char *)&unk_1A12BB323, (uint8_t *)&buf, 2u);
  }

  uint64_t v13 = _AASignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1A11D8000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchAllHealthInfo enableTelemetry=YES  ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v30 = 0x3032000000;
  os_signpost_id_t v31 = __Block_byref_object_copy__8;
  uint64_t v32 = __Block_byref_object_dispose__8;
  uint64_t v14 = self;
  uint64_t v33 = v14;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __60__AAInheritanceController_fetchAllHealthInfoWithCompletion___block_invoke;
  v23[3] = &unk_1E5A4A010;
  p_long long buf = &buf;
  os_signpost_id_t v26 = v8;
  uint64_t v27 = v10;
  id v15 = v5;
  id v24 = v15;
  int v16 = (void *)MEMORY[0x1A622F430](v23);
  remoteService = v14->_remoteService;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __60__AAInheritanceController_fetchAllHealthInfoWithCompletion___block_invoke_128;
  v21[3] = &unk_1E5A48680;
  id v18 = v16;
  id v22 = v18;
  double v19 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v21];
  [v19 fetchAllHealthInfoWithCompletion:v18];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __60__AAInheritanceController_fetchAllHealthInfoWithCompletion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[5] + 8);
  os_signpost_id_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  uint64_t v10 = _AASignpostLogSystem();
  os_signpost_id_t v11 = v10;
  os_signpost_id_t v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    uint64_t v13 = _AAErrorUnderlyingError(v6);
    int v20 = 67240192;
    LODWORD(v21) = [v13 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v11, OS_SIGNPOST_INTERVAL_END, v12, "FetchAllHealthInfo", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 8u);
  }
  uint64_t v14 = _AASignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = (double)Nanoseconds / 1000000000.0;
    int v16 = (void *)a1[6];
    uint64_t v17 = _AAErrorUnderlyingError(v6);
    int v18 = [v17 code];
    int v20 = 134218496;
    id v21 = v16;
    __int16 v22 = 2048;
    double v23 = v15;
    __int16 v24 = 1026;
    int v25 = v18;
    _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchAllHealthInfo  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 0x1Cu);
  }
  if (a1[4])
  {
    double v19 = _AALogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      id v21 = v5;
      _os_log_impl(&dword_1A11D8000, v19, OS_LOG_TYPE_DEFAULT, "Fetched Health Records: %@", (uint8_t *)&v20, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }
}

void __60__AAInheritanceController_fetchAllHealthInfoWithCompletion___block_invoke_128(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__AAInheritanceController_fetchAllHealthInfoWithCompletion___block_invoke_128_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)presentInheritanceInvitationUIWithBeneficiaryID:(id)a3 completion:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (!v7)
  {
    __int16 v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 452, @"Invalid parameter not satisfying: %@", @"beneficiaryID" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_10:
    int v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 453, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_10;
  }
LABEL_3:
  uint64_t v10 = _os_activity_create(&dword_1A11D8000, "inheritance-appleaccount/present-invitation-ui", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  os_signpost_id_t v11 = _AASignpostLogSystem();
  os_signpost_id_t v12 = _AASignpostCreate(v11);
  uint64_t v14 = v13;

  double v15 = _AASignpostLogSystem();
  int v16 = v15;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PresentInheritanceInvitationUI enableTelemetry=YES ", (const char *)&unk_1A12BB323, (uint8_t *)&buf, 2u);
  }

  uint64_t v17 = _AASignpostLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_1A11D8000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PresentInheritanceInvitationUI enableTelemetry=YES  ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy__8;
  uint64_t v37 = __Block_byref_object_dispose__8;
  int v18 = self;
  uint64_t v38 = v18;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __86__AAInheritanceController_presentInheritanceInvitationUIWithBeneficiaryID_completion___block_invoke;
  v28[3] = &unk_1E5A49FE8;
  p_long long buf = &buf;
  os_signpost_id_t v31 = v12;
  uint64_t v32 = v14;
  id v19 = v9;
  id v29 = v19;
  int v20 = (void *)MEMORY[0x1A622F430](v28);
  remoteService = v18->_remoteService;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __86__AAInheritanceController_presentInheritanceInvitationUIWithBeneficiaryID_completion___block_invoke_129;
  v26[3] = &unk_1E5A48680;
  id v22 = v20;
  id v27 = v22;
  double v23 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v26];
  [v23 presentInheritanceInvitationUIWithBeneficiaryID:v7 completion:v22];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __86__AAInheritanceController_presentInheritanceInvitationUIWithBeneficiaryID_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  id v7 = _AASignpostLogSystem();
  id v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    uint64_t v10 = _AAErrorUnderlyingError(v3);
    int v17 = 67240192;
    LODWORD(v18) = [v10 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v8, OS_SIGNPOST_INTERVAL_END, v9, "PresentInheritanceInvitationUI", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }
  os_signpost_id_t v11 = _AASignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (double)Nanoseconds / 1000000000.0;
    uint64_t v13 = a1[6];
    uint64_t v14 = _AAErrorUnderlyingError(v3);
    int v15 = [v14 code];
    int v17 = 134218496;
    uint64_t v18 = v13;
    __int16 v19 = 2048;
    double v20 = v12;
    __int16 v21 = 1026;
    int v22 = v15;
    _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PresentInheritanceInvitationUI  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }
  if (a1[4])
  {
    int v16 = _AALogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1A11D8000, v16, OS_LOG_TYPE_DEFAULT, "Initiated invitation UI flow.", (uint8_t *)&v17, 2u);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }
}

void __86__AAInheritanceController_presentInheritanceInvitationUIWithBeneficiaryID_completion___block_invoke_129(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __86__AAInheritanceController_presentInheritanceInvitationUIWithBeneficiaryID_completion___block_invoke_129_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setupBeneficiaryAliasWithAccessKey:(id)a3 password:(id)a4 firstName:(id)a5 lastName:(id)a6 authToken:(id)a7 completion:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 481, @"Invalid parameter not satisfying: %@", @"accessKey" object file lineNumber description];

    if (v16)
    {
LABEL_3:
      if (v19) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v30 = [MEMORY[0x1E4F28B00] currentHandler];
      [v30 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 483, @"Invalid parameter not satisfying: %@", @"authToken" object file lineNumber description];

      if (v20) {
        goto LABEL_5;
      }
LABEL_9:
      os_signpost_id_t v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 484, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

      goto LABEL_5;
    }
  }
  id v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"AAInheritanceController.m", 482, @"Invalid parameter not satisfying: %@", @"password" object file lineNumber description];

  if (!v19) {
    goto LABEL_8;
  }
LABEL_4:
  if (!v20) {
    goto LABEL_9;
  }
LABEL_5:
  __int16 v21 = _os_activity_create(&dword_1A11D8000, "inheritance-appleaccount/setup-beneficiary-alias", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v21, &state);
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__8;
  v37[4] = __Block_byref_object_dispose__8;
  int v22 = self;
  uint64_t v38 = v22;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __111__AAInheritanceController_setupBeneficiaryAliasWithAccessKey_password_firstName_lastName_authToken_completion___block_invoke;
  v34[3] = &unk_1E5A4A060;
  id v36 = v37;
  id v23 = v20;
  id v35 = v23;
  __int16 v24 = (void *)MEMORY[0x1A622F430](v34);
  remoteService = v22->_remoteService;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __111__AAInheritanceController_setupBeneficiaryAliasWithAccessKey_password_firstName_lastName_authToken_completion___block_invoke_140;
  v32[3] = &unk_1E5A48680;
  id v26 = v24;
  id v33 = v26;
  id v27 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v32];
  [v27 setupBeneficiaryAliasWithAccessKey:v15 password:v16 firstName:v17 lastName:v18 authToken:v19 completion:v26];

  _Block_object_dispose(v37, 8);
  os_activity_scope_leave(&state);
}

void __111__AAInheritanceController_setupBeneficiaryAliasWithAccessKey_password_firstName_lastName_authToken_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  os_signpost_id_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;

  if (*(void *)(a1 + 32))
  {
    double v12 = _AALogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "Setup Beneficiary Alias", v13, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __111__AAInheritanceController_setupBeneficiaryAliasWithAccessKey_password_firstName_lastName_authToken_completion___block_invoke_140(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __111__AAInheritanceController_setupBeneficiaryAliasWithAccessKey_password_firstName_lastName_authToken_completion___block_invoke_140_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)configureRemoteInterface:(id)a3
{
  v27[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  v27[2] = objc_opt_class();
  v27[3] = objc_opt_class();
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
  uint64_t v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v19];
  [v3 setClasses:v4 forSelector:sel_setupBeneficiaryManifest_contactInfo_setupAuthToken_completion_ argumentIndex:0 ofReply:1];

  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  v26[2] = objc_opt_class();
  v26[3] = objc_opt_class();
  void v26[4] = objc_opt_class();
  v26[5] = objc_opt_class();
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:6];
  id v5 = [MEMORY[0x1E4F1CAD0] setWithArray:v18];
  [v3 setClasses:v5 forSelector:sel_fetchManifestOptionsForContact_completion_ argumentIndex:0 ofReply:1];

  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  v25[2] = objc_opt_class();
  v25[3] = objc_opt_class();
  v25[4] = objc_opt_class();
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:5];
  id v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v17];
  [v3 setClasses:v6 forSelector:sel_fetchBeneficiariesWithCompletion_ argumentIndex:0 ofReply:1];

  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  v24[2] = objc_opt_class();
  v24[3] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
  id v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
  [v3 setClasses:v8 forSelector:sel_fetchBenefactorsWithCompletion_ argumentIndex:0 ofReply:1];

  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  v23[2] = objc_opt_class();
  v23[3] = objc_opt_class();
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
  uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
  [v3 setClasses:v10 forSelector:sel_fetchSuggestedBeneficiariesWithCompletion_ argumentIndex:0 ofReply:1];

  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  v22[2] = objc_opt_class();
  v22[3] = objc_opt_class();
  os_signpost_id_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];
  double v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
  [v3 setClasses:v12 forSelector:sel_fetchInvitationsWithCompletion_ argumentIndex:0 ofReply:1];

  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  v21[2] = objc_opt_class();
  v21[3] = objc_opt_class();
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];
  uint64_t v14 = [MEMORY[0x1E4F1CAD0] setWithArray:v13];
  [v3 setClasses:v14 forSelector:sel_fetchInvitationWithBeneficiaryID_completion_ argumentIndex:0 ofReply:1];

  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  v20[2] = objc_opt_class();
  v20[3] = objc_opt_class();
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
  id v16 = [MEMORY[0x1E4F1CAD0] setWithArray:v15];
  [v3 setClasses:v16 forSelector:sel_fetchAllHealthInfoWithCompletion_ argumentIndex:0 ofReply:1];
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
}

void __69__AAInheritanceController_fetchManifestOptionsForContact_completion___block_invoke_80_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_1A11D8000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
}

void __60__AAInheritanceController_isRecipient_capableOf_completion___block_invoke_89_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_1A11D8000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
}

void __90__AAInheritanceController_setupBeneficiaryManifest_contactInfo_setupAuthToken_completion___block_invoke_100_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_1A11D8000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
}

void __69__AAInheritanceController_removeAccessCodeForContactInfo_completion___block_invoke_101_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_1A11D8000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
}

void __65__AAInheritanceController_removeBeneficiary_manifest_completion___block_invoke_105_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_1A11D8000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
}

void __55__AAInheritanceController_removeBenefactor_completion___block_invoke_109_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_1A11D8000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
}

void __69__AAInheritanceController_updateAccessCodeForContactInfo_completion___block_invoke_110_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_1A11D8000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
}

void __76__AAInheritanceController_updateBeneficiaryManifest_contactInfo_completion___block_invoke_111_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_1A11D8000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
}

void __60__AAInheritanceController_fetchBeneficiariesWithCompletion___block_invoke_113_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_1A11D8000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
}

void __58__AAInheritanceController_fetchBenefactorsWithCompletion___block_invoke_114_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_1A11D8000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
}

void __69__AAInheritanceController_fetchSuggestedBeneficiariesWithCompletion___block_invoke_115_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_1A11D8000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
}

void __62__AAInheritanceController_sendInvitationToContact_completion___block_invoke_116_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_1A11D8000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
}

void __58__AAInheritanceController_fetchInvitationsWithCompletion___block_invoke_117_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_1A11D8000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
}

void __71__AAInheritanceController_fetchInvitationWithBeneficiaryID_completion___block_invoke_119_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_1A11D8000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
}

void __55__AAInheritanceController_removeInvitation_completion___block_invoke_123_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_1A11D8000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
}

void __67__AAInheritanceController_respondToInvitation_accepted_completion___block_invoke_127_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_1A11D8000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
}

void __60__AAInheritanceController_fetchAllHealthInfoWithCompletion___block_invoke_128_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_1A11D8000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
}

void __86__AAInheritanceController_presentInheritanceInvitationUIWithBeneficiaryID_completion___block_invoke_129_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_1A11D8000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
}

void __111__AAInheritanceController_setupBeneficiaryAliasWithAccessKey_password_firstName_lastName_authToken_completion___block_invoke_140_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_1A11D8000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
}

@end