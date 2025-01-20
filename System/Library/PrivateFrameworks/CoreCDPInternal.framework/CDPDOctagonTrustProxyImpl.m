@interface CDPDOctagonTrustProxyImpl
+ (BOOL)octagonIsSOSFeatureEnabled;
- (BOOL)cacheRecoveryKey:(id)a3 forAltDSID:(id)a4 error:(id *)a5;
- (BOOL)disableRecoveryKey:(id *)a3;
- (BOOL)isRecoveryKeySet:(id)a3 error:(id *)a4;
- (BOOL)registerRecoveryKey:(id)a3 error:(id *)a4;
- (CDPContext)cdpContext;
- (CDPDOctagonTrustProxyImpl)initWithContext:(id)a3;
- (id)tlkRecoverabilityForEscrow:(id)a3 record:(id)a4 error:(id *)a5;
- (id)tlkRecoverabilityForEscrow:(id)a3 record:(id)a4 source:(int64_t)a5 error:(id *)a6;
- (void)fetchAllEscrowRecords:(id)a3 forceFetch:(BOOL)a4 completion:(id)a5;
- (void)fetchAllEscrowRecords:(id)a3 source:(int64_t)a4 completion:(id)a5;
- (void)fetchEscrowRecords:(id)a3 forceFetch:(BOOL)a4 completion:(id)a5;
- (void)fetchEscrowRecords:(id)a3 source:(int64_t)a4 completion:(id)a5;
- (void)setCdpContext:(id)a3;
@end

@implementation CDPDOctagonTrustProxyImpl

- (CDPDOctagonTrustProxyImpl)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDPDOctagonTrustProxyImpl;
  v6 = [(CDPDOctagonTrustProxyImpl *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cdpContext, a3);
  }

  return v7;
}

- (void)fetchEscrowRecords:(id)a3 forceFetch:(BOOL)a4 completion:(id)a5
{
  if (a4) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 0;
  }
  [(CDPDOctagonTrustProxyImpl *)self fetchEscrowRecords:a3 source:v5 completion:a5];
}

- (void)fetchEscrowRecords:(id)a3 source:(int64_t)a4 completion:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a5;
  objc_super v9 = (objc_class *)MEMORY[0x263F16D38];
  id v10 = a3;
  id v11 = objc_alloc_init(v9);
  [v11 setContext:*MEMORY[0x263F16D90]];
  v12 = [(CDPContext *)self->_cdpContext altDSID];
  [v11 setAltDSID:v12];

  v13 = [MEMORY[0x263F5B738] dictionaryToEscrowAuthenticationInfo:v10];

  [v11 setEscrowAuth:v13];
  if (objc_opt_respondsToSelector())
  {
    v14 = [(CDPContext *)self->_cdpContext telemetryFlowID];
    [v11 setFlowID:v14];
  }
  if (objc_opt_respondsToSelector())
  {
    v15 = [(CDPContext *)self->_cdpContext telemetryDeviceSessionID];
    [v11 setDeviceSessionID:v15];
  }
  if (objc_opt_respondsToSelector()) {
    [v11 setEscrowFetchSource:a4];
  }
  v16 = _CDPSignpostLogSystem();
  os_signpost_id_t v17 = _CDPSignpostCreate();
  uint64_t v19 = v18;

  v20 = _CDPSignpostLogSystem();
  v21 = v20;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_218640000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v17, "FetchEscrowRecords", " enableTelemetry=YES ", buf, 2u);
  }

  v22 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v35 = v17;
    _os_log_impl(&dword_218640000, v22, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchEscrowRecords  enableTelemetry=YES ", buf, 0xCu);
  }

  v23 = [MEMORY[0x263F202A8] analyticsEventWithContext:self->_cdpContext eventName:*MEMORY[0x263F34640] category:*MEMORY[0x263F34830]];
  v24 = [NSNumber numberWithInteger:a4];
  [v23 setObject:v24 forKeyedSubscript:*MEMORY[0x263F34628]];

  v25 = objc_alloc_init(_TtC15CoreCDPInternal28CDPExponentialRetryScheduler);
  cdpContext = self->_cdpContext;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __66__CDPDOctagonTrustProxyImpl_fetchEscrowRecords_source_completion___block_invoke;
  v29[3] = &unk_26432F8A8;
  os_signpost_id_t v32 = v17;
  uint64_t v33 = v19;
  id v30 = v23;
  id v31 = v8;
  id v27 = v8;
  id v28 = v23;
  [(CDPExponentialRetryScheduler *)v25 retryFetchEscrowRecord:v11 cdpContext:cdpContext completionHandler:v29];
}

void __66__CDPDOctagonTrustProxyImpl_fetchEscrowRecords_source_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  int v9 = !v8;
  if (v8) {
    uint64_t v10 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v10 = MEMORY[0x263EFFA80];
  }
  [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:*MEMORY[0x263F20330]];
  [*(id *)(a1 + 32) populateUnderlyingErrorsStartingWithRootError:v7];
  id v11 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v11 sendEvent:*(void *)(a1 + 32)];

  uint64_t Nanoseconds = _CDPSignpostGetNanoseconds();
  v13 = _CDPSignpostLogSystem();
  v14 = v13;
  os_signpost_id_t v15 = *(void *)(a1 + 48);
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    int v25 = 67240192;
    LODWORD(v26) = [v7 code];
    _os_signpost_emit_with_name_impl(&dword_218640000, v14, OS_SIGNPOST_INTERVAL_END, v15, "FetchEscrowRecords", " fetchError=%{public,signpost.telemetry:number1,name=fetchError}d ", (uint8_t *)&v25, 8u);
  }

  v16 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    double v17 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    uint64_t v18 = *(void *)(a1 + 48);
    int v19 = [v7 code];
    int v25 = 134218496;
    uint64_t v26 = v18;
    __int16 v27 = 2048;
    double v28 = v17;
    __int16 v29 = 1026;
    int v30 = v19;
    _os_log_impl(&dword_218640000, v16, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchEscrowRecords  fetchError=%{public,signpost.telemetry:number1,name=fetchError}d ", (uint8_t *)&v25, 0x1Cu);
  }

  v20 = _CDPLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    __66__CDPDOctagonTrustProxyImpl_fetchEscrowRecords_source_completion___block_invoke_cold_2();
  }

  if (v9)
  {
    v21 = _CDPLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      __66__CDPDOctagonTrustProxyImpl_fetchEscrowRecords_source_completion___block_invoke_cold_1();
    }

    uint64_t v22 = *(void *)(a1 + 40);
    if (v22)
    {
      v23 = *(void (**)(void))(v22 + 16);
LABEL_24:
      v23();
    }
  }
  else
  {
    uint64_t v24 = *(void *)(a1 + 40);
    if (v24)
    {
      v23 = *(void (**)(void))(v24 + 16);
      goto LABEL_24;
    }
  }
}

- (void)fetchAllEscrowRecords:(id)a3 forceFetch:(BOOL)a4 completion:(id)a5
{
  if (a4) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 0;
  }
  [(CDPDOctagonTrustProxyImpl *)self fetchAllEscrowRecords:a3 source:v5 completion:a5];
}

- (void)fetchAllEscrowRecords:(id)a3 source:(int64_t)a4 completion:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a5;
  int v9 = (objc_class *)MEMORY[0x263F16D38];
  id v10 = a3;
  id v11 = objc_alloc_init(v9);
  [v11 setContext:*MEMORY[0x263F16D90]];
  v12 = [(CDPContext *)self->_cdpContext altDSID];
  [v11 setAltDSID:v12];

  v13 = [MEMORY[0x263F5B738] dictionaryToEscrowAuthenticationInfo:v10];

  [v11 setEscrowAuth:v13];
  if (objc_opt_respondsToSelector())
  {
    v14 = [(CDPContext *)self->_cdpContext telemetryFlowID];
    [v11 setFlowID:v14];
  }
  if (objc_opt_respondsToSelector())
  {
    os_signpost_id_t v15 = [(CDPContext *)self->_cdpContext telemetryDeviceSessionID];
    [v11 setDeviceSessionID:v15];
  }
  if (objc_opt_respondsToSelector()) {
    [v11 setEscrowFetchSource:a4];
  }
  v16 = _CDPSignpostLogSystem();
  os_signpost_id_t v17 = _CDPSignpostCreate();
  uint64_t v19 = v18;

  v20 = _CDPSignpostLogSystem();
  v21 = v20;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_218640000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v17, "FetchEscrowRecords", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v22 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v35 = v17;
    _os_log_impl(&dword_218640000, v22, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchEscrowRecords  enableTelemetry=YES ", buf, 0xCu);
  }

  v23 = [MEMORY[0x263F202A8] analyticsEventWithContext:self->_cdpContext eventName:*MEMORY[0x263F34640] category:*MEMORY[0x263F34830]];
  uint64_t v24 = [NSNumber numberWithInteger:a4];
  [v23 setObject:v24 forKeyedSubscript:*MEMORY[0x263F34628]];

  int v25 = objc_alloc_init(_TtC15CoreCDPInternal28CDPExponentialRetryScheduler);
  cdpContext = self->_cdpContext;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __69__CDPDOctagonTrustProxyImpl_fetchAllEscrowRecords_source_completion___block_invoke;
  v29[3] = &unk_26432F8A8;
  os_signpost_id_t v32 = v17;
  uint64_t v33 = v19;
  id v30 = v23;
  id v31 = v8;
  id v27 = v8;
  id v28 = v23;
  [(CDPExponentialRetryScheduler *)v25 retryFetchAllEscrowRecord:v11 cdpContext:cdpContext completionHandler:v29];
}

void __69__CDPDOctagonTrustProxyImpl_fetchAllEscrowRecords_source_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  int v9 = !v8;
  if (v8) {
    uint64_t v10 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v10 = MEMORY[0x263EFFA80];
  }
  [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:*MEMORY[0x263F20330]];
  [*(id *)(a1 + 32) populateUnderlyingErrorsStartingWithRootError:v7];
  id v11 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v11 sendEvent:*(void *)(a1 + 32)];

  uint64_t Nanoseconds = _CDPSignpostGetNanoseconds();
  v13 = _CDPSignpostLogSystem();
  v14 = v13;
  os_signpost_id_t v15 = *(void *)(a1 + 48);
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    int v25 = 67240192;
    LODWORD(v26) = [v7 code];
    _os_signpost_emit_with_name_impl(&dword_218640000, v14, OS_SIGNPOST_INTERVAL_END, v15, "FetchEscrowRecords", " fetchError=%{public,signpost.telemetry:number1,name=fetchError}d ", (uint8_t *)&v25, 8u);
  }

  v16 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    double v17 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    uint64_t v18 = *(void *)(a1 + 48);
    int v19 = [v7 code];
    int v25 = 134218496;
    uint64_t v26 = v18;
    __int16 v27 = 2048;
    double v28 = v17;
    __int16 v29 = 1026;
    int v30 = v19;
    _os_log_impl(&dword_218640000, v16, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchEscrowRecords  fetchError=%{public,signpost.telemetry:number1,name=fetchError}d ", (uint8_t *)&v25, 0x1Cu);
  }

  v20 = _CDPLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    __69__CDPDOctagonTrustProxyImpl_fetchAllEscrowRecords_source_completion___block_invoke_cold_2();
  }

  if (v9)
  {
    v21 = _CDPLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      __69__CDPDOctagonTrustProxyImpl_fetchAllEscrowRecords_source_completion___block_invoke_cold_1();
    }

    uint64_t v22 = *(void *)(a1 + 40);
    if (v22)
    {
      v23 = *(void (**)(void))(v22 + 16);
LABEL_24:
      v23();
    }
  }
  else
  {
    uint64_t v24 = *(void *)(a1 + 40);
    if (v24)
    {
      v23 = *(void (**)(void))(v24 + 16);
      goto LABEL_24;
    }
  }
}

- (id)tlkRecoverabilityForEscrow:(id)a3 record:(id)a4 error:(id *)a5
{
  return [(CDPDOctagonTrustProxyImpl *)self tlkRecoverabilityForEscrow:a3 record:a4 source:0 error:a5];
}

- (id)tlkRecoverabilityForEscrow:(id)a3 record:(id)a4 source:(int64_t)a5 error:(id *)a6
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  uint64_t v10 = (objc_class *)MEMORY[0x263F16D38];
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc_init(v10);
  [v13 setContext:*MEMORY[0x263F16D90]];
  if (objc_opt_respondsToSelector())
  {
    v14 = [(CDPContext *)self->_cdpContext telemetryFlowID];
    [v13 setFlowID:v14];
  }
  if (objc_opt_respondsToSelector())
  {
    os_signpost_id_t v15 = [(CDPContext *)self->_cdpContext telemetryDeviceSessionID];
    [v13 setDeviceSessionID:v15];
  }
  v16 = [MEMORY[0x263F34328] sharedInstance];
  double v17 = [v16 primaryAccountAltDSID];

  [v13 setAltDSID:v17];
  uint64_t v18 = [MEMORY[0x263F5B738] dictionaryToEscrowAuthenticationInfo:v12];

  [v13 setEscrowAuth:v18];
  if (objc_opt_respondsToSelector()) {
    [v13 setEscrowFetchSource:a5];
  }
  int v19 = _CDPSignpostLogSystem();
  os_signpost_id_t v20 = _CDPSignpostCreate();

  v21 = _CDPSignpostLogSystem();
  uint64_t v22 = v21;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_218640000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "TLKRecoverability", " enableTelemetry=YES ", buf, 2u);
  }

  v23 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v39 = v20;
    _os_log_impl(&dword_218640000, v23, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: TLKRecoverability  enableTelemetry=YES ", buf, 0xCu);
  }

  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x263F16D30]) initWithContextData:v13];
  id v37 = 0;
  int v25 = [v24 tlkRecoverabilityForEscrowRecord:v11 error:&v37];

  id v26 = v37;
  uint64_t Nanoseconds = _CDPSignpostGetNanoseconds();
  double v28 = _CDPSignpostLogSystem();
  __int16 v29 = v28;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    int v30 = [v26 code];
    *(_DWORD *)buf = 67240192;
    LODWORD(v39) = v30;
    _os_signpost_emit_with_name_impl(&dword_218640000, v29, OS_SIGNPOST_INTERVAL_END, v20, "TLKRecoverability", " resultError=%{public,signpost.telemetry:number1,name=resultError}d ", buf, 8u);
  }

  uint64_t v31 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    int v32 = [v26 code];
    *(_DWORD *)buf = 134218496;
    os_signpost_id_t v39 = v20;
    __int16 v40 = 2048;
    double v41 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v42 = 1026;
    int v43 = v32;
    _os_log_impl(&dword_218640000, v31, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: TLKRecoverability  resultError=%{public,signpost.telemetry:number1,name=resultError}d ", buf, 0x1Cu);
  }

  uint64_t v33 = _CDPLogSystem();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
    -[CDPDOctagonTrustProxyImpl tlkRecoverabilityForEscrow:record:source:error:]();
  }

  if (v26 || !v25)
  {
    os_signpost_id_t v35 = _CDPLogSystem();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[CDPDOctagonTrustProxyImpl tlkRecoverabilityForEscrow:record:source:error:]();
    }

    id v34 = 0;
    if (a6) {
      *a6 = v26;
    }
  }
  else
  {
    id v34 = v25;
  }

  return v34;
}

- (BOOL)disableRecoveryKey:(id *)a3
{
  v4 = [(CDPContext *)self->_cdpContext cliqueConfiguration];
  id v5 = (void *)[objc_alloc(MEMORY[0x263F16D30]) initWithContextData:v4];
  LOBYTE(a3) = [v5 removeRecoveryKey:v4 error:a3];

  return (char)a3;
}

- (BOOL)isRecoveryKeySet:(id)a3 error:(id *)a4
{
  return [MEMORY[0x263F16D30] isRecoveryKeySetInOctagon:a3 error:a4];
}

- (BOOL)cacheRecoveryKey:(id)a3 forAltDSID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  BOOL v8 = +[CDPRecoveryKeyCache sharedInstance];
  int v9 = [(CDPContext *)self->_cdpContext altDSID];
  LOBYTE(a5) = [v8 cacheRecoveryKey:v7 forAltDSID:v9 error:a5];

  return (char)a5;
}

+ (BOOL)octagonIsSOSFeatureEnabled
{
  return MEMORY[0x270EFD3D0](a1, a2);
}

- (BOOL)registerRecoveryKey:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  cdpContext = self->_cdpContext;
  id v6 = a3;
  id v7 = [(CDPContext *)cdpContext octagonConfigurationContext];
  [v7 setContext:*MEMORY[0x263F16D90]];
  BOOL v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 141558274;
    uint64_t v14 = 1752392040;
    __int16 v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Registering recovery key with context %{mask.hash}@", (uint8_t *)&v13, 0x16u);
  }

  int v9 = [MEMORY[0x263F16D30] registerRecoveryKeyWithContext:v7 recoveryKey:v6 error:a4];
  if (v9)
  {
    uint64_t v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_218640000, v10, OS_LOG_TYPE_DEFAULT, "Successfully registered recovery key", (uint8_t *)&v13, 2u);
    }
  }
  else
  {
    uint64_t v10 = _CDPLogSystem();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (a4)
    {
      if (v11) {
        -[CDPDOctagonTrustProxyImpl registerRecoveryKey:error:]((uint64_t *)a4, v10);
      }
    }
    else if (v11)
    {
      -[CDPDOctagonTrustProxyImpl registerRecoveryKey:error:](v10);
    }
  }

  return v9;
}

- (CDPContext)cdpContext
{
  return self->_cdpContext;
}

- (void)setCdpContext:(id)a3
{
}

- (void).cxx_destruct
{
}

void __66__CDPDOctagonTrustProxyImpl_fetchEscrowRecords_source_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Fetched escrow records error: %@", v2, v3, v4, v5, v6);
}

void __66__CDPDOctagonTrustProxyImpl_fetchEscrowRecords_source_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "Fetched escrow records: %@", v2, v3, v4, v5, v6);
}

void __69__CDPDOctagonTrustProxyImpl_fetchAllEscrowRecords_source_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "fetchAllEscrowRecords failed, error: %@", v2, v3, v4, v5, v6);
}

void __69__CDPDOctagonTrustProxyImpl_fetchAllEscrowRecords_source_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "Fetched all escrow records: %@", v2, v3, v4, v5, v6);
}

- (void)tlkRecoverabilityForEscrow:record:source:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "checkForRecoverability failed, error: %@", v2, v3, v4, v5, v6);
}

- (void)tlkRecoverabilityForEscrow:record:source:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "Checked for recoverability: %@", v2, v3, v4, v5, v6);
}

- (void)registerRecoveryKey:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_218640000, log, OS_LOG_TYPE_ERROR, "Failed to register recovery key", v1, 2u);
}

- (void)registerRecoveryKey:(uint64_t *)a1 error:(NSObject *)a2 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 141558274;
  uint64_t v4 = 1752392040;
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_218640000, a2, OS_LOG_TYPE_ERROR, "Failed to register recovery key with error: %{mask.hash}@", (uint8_t *)&v3, 0x16u);
}

@end