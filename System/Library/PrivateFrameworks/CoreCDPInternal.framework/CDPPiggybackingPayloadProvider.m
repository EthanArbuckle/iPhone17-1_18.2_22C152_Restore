@interface CDPPiggybackingPayloadProvider
+ (id)proxyWithSession:(id)a3 error:(id *)a4;
- (BOOL)isComplete;
- (BOOL)requiresInitialSync;
- (id)initiatingPayload:(id *)a3;
- (id)processIncomingPayload:(id)a3 error:(id *)a4;
@end

@implementation CDPPiggybackingPayloadProvider

+ (id)proxyWithSession:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v5;
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "Creating a piggybacking data provider with session: %@", buf, 0xCu);
  }

  v7 = objc_alloc_init(CDPPiggybackingPayloadProvider);
  v8 = (KCJoiningRequestAccountCircleDelegate *)objc_alloc_init(MEMORY[0x263F50F90]);
  delegate = v7->_delegate;
  v7->_delegate = v8;

  v10 = v7->_delegate;
  id v16 = 0;
  uint64_t v11 = [MEMORY[0x263F50F98] sessionWithCircleDelegate:v10 session:v5 error:&v16];
  id v12 = v16;
  session = v7->_session;
  v7->_session = (KCJoiningRequestCircleSession *)v11;

  if (v12)
  {
    v14 = 0;
    if (a4) {
      *a4 = v12;
    }
  }
  else
  {
    v14 = v7;
  }

  return v14;
}

- (id)initiatingPayload:(id *)a3
{
  return (id)[(KCJoiningRequestCircleSession *)self->_session initialMessage:a3];
}

- (id)processIncomingPayload:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = _CDPSignpostLogSystem();
  os_signpost_id_t v8 = _CDPSignpostCreate();

  v9 = _CDPSignpostLogSystem();
  v10 = v9;
  unint64_t v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v27) = 0;
    _os_signpost_emit_with_name_impl(&dword_218640000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "KCJoiningRequestProcessMessage", " enableTelemetry=YES ", (uint8_t *)&v27, 2u);
  }

  id v12 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 134217984;
    os_signpost_id_t v28 = v8;
    _os_log_impl(&dword_218640000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: KCJoiningRequestProcessMessage  enableTelemetry=YES ", (uint8_t *)&v27, 0xCu);
  }

  v13 = [(KCJoiningRequestCircleSession *)self->_session processMessage:v6 error:a4];

  if (a4 && *a4)
  {
    uint64_t Nanoseconds = _CDPSignpostGetNanoseconds();
    v15 = _CDPSignpostLogSystem();
    id v16 = v15;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      int v17 = [*a4 code];
      int v27 = 67240192;
      LODWORD(v28) = v17;
      _os_signpost_emit_with_name_impl(&dword_218640000, v16, OS_SIGNPOST_INTERVAL_END, v8, "KCJoiningRequestProcessMessage", " Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v27, 8u);
    }

    id v18 = _CDPSignpostLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = [*a4 code];
      int v27 = 134218496;
      os_signpost_id_t v28 = v8;
      __int16 v29 = 2048;
      double v30 = (double)(unint64_t)Nanoseconds / 1000000000.0;
      __int16 v31 = 1026;
      int v32 = v19;
      v20 = "END [%lld] %fs: KCJoiningRequestProcessMessage  Error=%{public,signpost.telemetry:number1,name=Error}d ";
      v21 = v18;
      uint32_t v22 = 28;
LABEL_18:
      _os_log_impl(&dword_218640000, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v27, v22);
    }
  }
  else
  {
    uint64_t v23 = _CDPSignpostGetNanoseconds();
    v24 = _CDPSignpostLogSystem();
    v25 = v24;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      LOWORD(v27) = 0;
      _os_signpost_emit_with_name_impl(&dword_218640000, v25, OS_SIGNPOST_INTERVAL_END, v8, "KCJoiningRequestProcessMessage", "", (uint8_t *)&v27, 2u);
    }

    id v18 = _CDPSignpostLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 134218240;
      os_signpost_id_t v28 = v8;
      __int16 v29 = 2048;
      double v30 = (double)(unint64_t)v23 / 1000000000.0;
      v20 = "END [%lld] %fs: KCJoiningRequestProcessMessage ";
      v21 = v18;
      uint32_t v22 = 22;
      goto LABEL_18;
    }
  }

  return v13;
}

- (BOOL)isComplete
{
  return [(KCJoiningRequestCircleSession *)self->_session isDone];
}

- (BOOL)requiresInitialSync
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end