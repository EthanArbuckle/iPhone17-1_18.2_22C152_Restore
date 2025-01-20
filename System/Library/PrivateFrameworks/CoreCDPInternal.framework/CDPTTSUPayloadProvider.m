@interface CDPTTSUPayloadProvider
- (BOOL)isComplete;
- (BOOL)requiresInitialSync;
- (CDPTTSUPayloadProvider)initWithCircleProxy:(id)a3;
- (id)initiatingPayload:(id *)a3;
- (id)processIncomingPayload:(id)a3 error:(id *)a4;
@end

@implementation CDPTTSUPayloadProvider

- (CDPTTSUPayloadProvider)initWithCircleProxy:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDPTTSUPayloadProvider;
  v6 = [(CDPTTSUPayloadProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_circleProxy, a3);
  }

  return v7;
}

- (id)initiatingPayload:(id *)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = _CDPSignpostLogSystem();
  os_signpost_id_t v6 = _CDPSignpostCreate();

  v7 = _CDPSignpostLogSystem();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_218640000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "TTSUInitiatingPayload", " enableTelemetry=YES ", buf, 2u);
  }

  objc_super v9 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v28 = v6;
    _os_log_impl(&dword_218640000, v9, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: TTSUInitiatingPayload  enableTelemetry=YES ", buf, 0xCu);
  }

  if (!self->_pairingChannel)
  {
    v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v10, OS_LOG_TYPE_DEFAULT, "Creating an initiating pairing channel...", buf, 2u);
    }

    v11 = [(CDPDCircleProxy *)self->_circleProxy pairingChannelInitiator];
    pairingChannel = self->_pairingChannel;
    self->_pairingChannel = v11;
  }
  v13 = _CDPLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v13, OS_LOG_TYPE_DEFAULT, "Creating initiating TTSU payload", buf, 2u);
  }

  BOOL v26 = 0;
  v14 = self->_pairingChannel;
  id v25 = 0;
  v15 = [(KCPairingChannel *)v14 exchangePacket:0 complete:&v26 error:&v25];
  id v16 = v25;
  v17 = _CDPLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    os_signpost_id_t v28 = (os_signpost_id_t)v16;
    _os_log_impl(&dword_218640000, v17, OS_LOG_TYPE_DEFAULT, "Created initiating TTSU payload with error: %@", buf, 0xCu);
  }

  self->_complete = v26;
  if (a3) {
    *a3 = v16;
  }
  uint64_t Nanoseconds = _CDPSignpostGetNanoseconds();
  v19 = _CDPSignpostLogSystem();
  v20 = v19;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    int v21 = [v16 code];
    *(_DWORD *)buf = 67240192;
    LODWORD(v28) = v21;
    _os_signpost_emit_with_name_impl(&dword_218640000, v20, OS_SIGNPOST_INTERVAL_END, v6, "TTSUInitiatingPayload", " Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 8u);
  }

  v22 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = [v16 code];
    *(_DWORD *)buf = 134218496;
    os_signpost_id_t v28 = v6;
    __int16 v29 = 2048;
    double v30 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v31 = 1026;
    int v32 = v23;
    _os_log_impl(&dword_218640000, v22, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: TTSUInitiatingPayload  Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 0x1Cu);
  }

  return v15;
}

- (id)processIncomingPayload:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = _CDPSignpostLogSystem();
  os_signpost_id_t v8 = _CDPSignpostCreate();

  objc_super v9 = _CDPSignpostLogSystem();
  v10 = v9;
  unint64_t v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_218640000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "TTSUProcessIncomingPayload", " enableTelemetry=YES ", buf, 2u);
  }

  v12 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v48 = v8;
    _os_log_impl(&dword_218640000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: TTSUProcessIncomingPayload  enableTelemetry=YES ", buf, 0xCu);
  }

  if (!self->_pairingChannel)
  {
    v13 = _CDPLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v13, OS_LOG_TYPE_DEFAULT, "Creating an accepting pairing channel...", buf, 2u);
    }

    v14 = [(CDPDCircleProxy *)self->_circleProxy pairingChannelAcceptor];
    pairingChannel = self->_pairingChannel;
    self->_pairingChannel = v14;
  }
  id v16 = _CDPLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v16, OS_LOG_TYPE_DEFAULT, "Processing incoming TTSU payload", buf, 2u);
  }

  BOOL v46 = 0;
  v17 = self->_pairingChannel;
  id v45 = 0;
  v18 = [(KCPairingChannel *)v17 exchangePacket:v6 complete:&v46 error:&v45];
  id v19 = v45;
  v20 = _CDPLogSystem();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (!v21) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 138412290;
    os_signpost_id_t v48 = (os_signpost_id_t)v19;
    v22 = "Processed incoming TTSU payload with error: %@";
    int v23 = v20;
    uint32_t v24 = 12;
  }
  else
  {
    if (!v21) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    v22 = "Processing the incoming TTSU payload was successful.";
    int v23 = v20;
    uint32_t v24 = 2;
  }
  _os_log_impl(&dword_218640000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
LABEL_18:

  id v25 = [v19 domain];
  if ([v25 isEqualToString:*MEMORY[0x263F50FB0]])
  {
    uint64_t v26 = [v19 code];

    if (v26 != 2) {
      goto LABEL_27;
    }
    os_signpost_id_t v43 = v8;
    unint64_t v27 = v8 - 1;
    os_signpost_id_t v28 = a4;
    __int16 v29 = _CDPLogSystem();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v29, OS_LOG_TYPE_DEFAULT, "Detected a stale channel, re-initializing...", buf, 2u);
    }

    double v30 = [(CDPDCircleProxy *)self->_circleProxy pairingChannelAcceptor];
    __int16 v31 = self->_pairingChannel;
    self->_pairingChannel = v30;

    int v32 = self->_pairingChannel;
    id v44 = v19;
    uint64_t v33 = [(KCPairingChannel *)v32 exchangePacket:v6 complete:&v46 error:&v44];
    id v34 = v44;

    id v25 = _CDPLogSystem();
    BOOL v35 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
    if (v34)
    {
      if (v35)
      {
        *(_DWORD *)buf = 138412290;
        os_signpost_id_t v48 = (os_signpost_id_t)v34;
        _os_log_impl(&dword_218640000, v25, OS_LOG_TYPE_DEFAULT, "After re-initialization, processed incoming TTSU payload with error: %@", buf, 0xCu);
      }
    }
    else
    {
      if (v35)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218640000, v25, OS_LOG_TYPE_DEFAULT, "After re-initialization, processing the incoming TTSU payload was successful.", buf, 2u);
      }
      id v34 = 0;
    }
  }
  else
  {
    os_signpost_id_t v43 = v8;
    unint64_t v27 = v8 - 1;
    os_signpost_id_t v28 = a4;
    id v34 = v19;
    uint64_t v33 = (uint64_t)v18;
  }

  id v19 = v34;
  v18 = (void *)v33;
  a4 = v28;
  unint64_t v11 = v27;
  os_signpost_id_t v8 = v43;
LABEL_27:
  self->_complete = v46;
  if (a4) {
    *a4 = v19;
  }
  uint64_t Nanoseconds = _CDPSignpostGetNanoseconds();
  v37 = _CDPSignpostLogSystem();
  v38 = v37;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
  {
    int v39 = [v19 code];
    *(_DWORD *)buf = 67240192;
    LODWORD(v48) = v39;
    _os_signpost_emit_with_name_impl(&dword_218640000, v38, OS_SIGNPOST_INTERVAL_END, v8, "TTSUProcessIncomingPayload", " Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 8u);
  }

  v40 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    int v41 = [v19 code];
    *(_DWORD *)buf = 134218496;
    os_signpost_id_t v48 = v8;
    __int16 v49 = 2048;
    double v50 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v51 = 1026;
    int v52 = v41;
    _os_log_impl(&dword_218640000, v40, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: TTSUProcessIncomingPayload  Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 0x1Cu);
  }

  return v18;
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (BOOL)requiresInitialSync
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = [(KCPairingChannel *)self->_pairingChannel needInitialSync];
  v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_impl(&dword_218640000, v3, OS_LOG_TYPE_DEFAULT, "Pairing channel indicated initial sync requirement: %{BOOL}d", (uint8_t *)v5, 8u);
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circleProxy, 0);
  objc_storeStrong((id *)&self->_pairingChannel, 0);
}

@end