@interface CDPRecoveryController
- (id)_sanitizedRecoveryErrorWithError:(id)a3;
- (void)performRecovery:(id)a3;
@end

@implementation CDPRecoveryController

- (void)performRecovery:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _os_activity_create(&dword_2182AE000, "cdp: recovery flow", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v6 = _CDPSignpostLogSystem();
  os_signpost_id_t v7 = _CDPSignpostCreate(v6);
  uint64_t v9 = v8;

  v10 = _CDPSignpostLogSystem();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "NativeAccountRecovery", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  v12 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_2182AE000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: NativeAccountRecovery  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__4;
  v45 = __Block_byref_object_dispose__4;
  v13 = self;
  v46 = v13;
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __41__CDPRecoveryController_performRecovery___block_invoke;
  v32[3] = &unk_264317E48;
  os_signpost_id_t v35 = v7;
  uint64_t v36 = v9;
  p_long long buf = &buf;
  id v14 = v4;
  id v33 = v14;
  v15 = (void *)MEMORY[0x21D4671C0](v32);
  v16 = [(CDPController *)v13 daemonConn];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __41__CDPRecoveryController_performRecovery___block_invoke_2;
  v30[3] = &unk_264316F68;
  v30[4] = v13;
  id v17 = v15;
  id v31 = v17;
  v18 = [v16 daemonWithErrorHandler:v30];

  v19 = _CDPLogSystemAnalytics();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v26 = [(CDPController *)v13 context];
    v27 = [v26 telemetryFlowID];
    *(_DWORD *)v38 = 138412546;
    v39 = v13;
    __int16 v40 = 2112;
    v41 = v27;
    _os_log_debug_impl(&dword_2182AE000, v19, OS_LOG_TYPE_DEBUG, "%@: setting context type to be CDPContextTypeAccountRecovery with flowID=%@", v38, 0x16u);
  }
  v20 = [(CDPController *)v13 context];
  [v20 setType:11];

  v21 = [(CDPController *)v13 context];
  v22 = [(CDPController *)v13 uiProviderProxy];
  v23 = [(CDPController *)v13 authProvider];
  v24 = +[CDPAuthProviderProxy proxyWithAuthProvider:v23];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __41__CDPRecoveryController_performRecovery___block_invoke_29;
  v28[3] = &unk_264317350;
  v28[4] = v13;
  id v25 = v17;
  id v29 = v25;
  [v18 performRecoveryWithContext:v21 uiProvider:v22 authProvider:v24 completion:v28];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __41__CDPRecoveryController_performRecovery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  unint64_t Nanoseconds = _CDPSignpostGetNanoseconds(*(void *)(a1 + 48), *(void *)(a1 + 56));
  uint64_t v8 = _CDPSignpostLogSystem();
  uint64_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 48);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_DWORD *)long long buf = 67240448;
    *(_DWORD *)v24 = v5 != 0;
    *(_WORD *)&v24[4] = 1026;
    *(_DWORD *)&v24[6] = [v6 code];
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v9, OS_SIGNPOST_INTERVAL_END, v10, "NativeAccountRecovery", " result != nil=%{public,signpost.telemetry:number1,name=result != nil}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0xEu);
  }

  v11 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (double)Nanoseconds / 1000000000.0;
    uint64_t v13 = *(void *)(a1 + 48);
    int v14 = [v6 code];
    *(_DWORD *)long long buf = 134218752;
    *(void *)v24 = v13;
    *(_WORD *)&v24[8] = 2048;
    double v25 = v12;
    __int16 v26 = 1026;
    BOOL v27 = v5 != 0;
    __int16 v28 = 1026;
    int v29 = v14;
    _os_log_impl(&dword_2182AE000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: NativeAccountRecovery  result != nil=%{public,signpost.telemetry:number1,name=result != nil}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x22u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__CDPRecoveryController_performRecovery___block_invoke_25;
  block[3] = &unk_264317E20;
  long long v18 = *(_OWORD *)(a1 + 32);
  id v15 = (id)v18;
  long long v22 = v18;
  id v20 = v5;
  id v21 = v6;
  id v16 = v6;
  id v17 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __41__CDPRecoveryController_performRecovery___block_invoke_25(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __41__CDPRecoveryController_performRecovery___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _sanitizedRecoveryErrorWithError:v3];
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __41__CDPRecoveryController_performRecovery___block_invoke_2_cold_1((uint64_t)v3, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __41__CDPRecoveryController_performRecovery___block_invoke_29(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 _sanitizedRecoveryErrorWithError:a3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_sanitizedRecoveryErrorWithError:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = v3;
  if (v3
    && ([v3 domain],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isEqualToString:@"CDPStateError"],
        v5,
        !v6))
  {
    uint64_t v10 = *MEMORY[0x263F08608];
    v11[0] = v4;
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    _CDPStateError(-5200, (uint64_t)v8);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = v4;
  }

  return v7;
}

void __41__CDPRecoveryController_performRecovery___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2182AE000, a2, OS_LOG_TYPE_ERROR, "XPC Error while recovering data: %@", (uint8_t *)&v2, 0xCu);
}

@end