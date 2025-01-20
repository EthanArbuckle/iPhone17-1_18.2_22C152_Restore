@interface CDPTTSUChannel
- (BOOL)approverBackupRecordsExist;
- (CDPTTSUChannel)initWithContext:(id)a3;
- (CUMessageSession)sharingSession;
- (NSString)telemetryFlowIDFromRequester;
- (unint64_t)approveriCloudKeychainState;
- (void)listenForPayloadsWithHandler:(id)a3;
- (void)sendPayload:(id)a3 completion:(id)a4;
- (void)setApproverBackupRecordsExist:(BOOL)a3;
- (void)setApproveriCloudKeychainState:(unint64_t)a3;
- (void)setSharingSession:(id)a3;
@end

@implementation CDPTTSUChannel

- (CDPTTSUChannel)initWithContext:(id)a3
{
  id v5 = a3;
  v6 = [(CDPTTSUChannel *)self init];
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x263F38568]);
    v8 = [v5 sharingChannel];
    uint64_t v9 = [v7 initWithTemplate:v8];
    sharingSession = v6->_sharingSession;
    v6->_sharingSession = (CUMessageSession *)v9;

    v6->_sentInitialResponse = 0;
    objc_storeStrong((id *)&v6->_cdpContext, a3);
  }

  return v6;
}

- (void)sendPayload:(id)a3 completion:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = _CDPSignpostLogSystem();
  os_signpost_id_t v9 = _CDPSignpostCreate();
  uint64_t v11 = v10;

  v12 = _CDPSignpostLogSystem();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_218640000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SecureChannelSendPayload", " enableTelemetry=YES ", buf, 2u);
  }

  v14 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v30 = v9;
    _os_log_impl(&dword_218640000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SecureChannelSendPayload  enableTelemetry=YES ", buf, 0xCu);
  }

  v15 = (void *)MEMORY[0x263EFF9A0];
  v27 = @"CDPChannelTTSUPayloadKey";
  id v28 = v6;
  v16 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  v17 = [v15 dictionaryWithDictionary:v16];

  v18 = [(CDPContext *)self->_cdpContext telemetryFlowID];
  v19 = [(CDPContext *)self->_cdpContext telemetryDeviceSessionID];
  if (v18)
  {
    v20 = _CDPLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v20, OS_LOG_TYPE_DEFAULT, "CDPTTSUChannel: Flow ID exists on the requesting proxy, attaching to payload.", buf, 2u);
    }

    [v17 setObject:v18 forKeyedSubscript:@"CDPChannelTTSUTelemetryFlowId"];
  }
  sharingSession = self->_sharingSession;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __41__CDPTTSUChannel_sendPayload_completion___block_invoke;
  v23[3] = &unk_26432F928;
  os_signpost_id_t v25 = v9;
  uint64_t v26 = v11;
  v23[4] = self;
  id v24 = v7;
  id v22 = v7;
  [(CUMessageSession *)sharingSession sendRequestID:@"CDPChannelTTSURequestID" options:MEMORY[0x263EFFA78] request:v17 responseHandler:v23];
}

void __41__CDPTTSUChannel_sendPayload_completion___block_invoke(void *a1, int a2, uint64_t a3, void *a4)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 138412290;
    id v34 = v6;
    _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "Response received: %@", (uint8_t *)&v33, 0xCu);
  }

  v8 = [v6 objectForKeyedSubscript:@"CDPChannelTTSUPayloadBackupRecordsExistKey"];
  os_signpost_id_t v9 = v8;
  if (v8)
  {
    char v10 = [v8 BOOLValue];
    uint64_t v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __41__CDPTTSUChannel_sendPayload_completion___block_invoke_cold_5(v10, v11);
    }

    *(unsigned char *)(a1[4] + 8) = v10;
  }
  v12 = [v6 objectForKeyedSubscript:@"CDPChannelTTSUPayloadiCloudKeychainEnabledKey"];

  if (v12)
  {
    uint64_t v13 = [v12 integerValue];
    v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      __41__CDPTTSUChannel_sendPayload_completion___block_invoke_cold_4(v13, v14);
    }

    *(void *)(a1[4] + 16) = v13;
  }
  v15 = [v6 objectForKeyedSubscript:@"CDPChannelTTSUPayloadKey"];
  if (!v15)
  {
    v16 = _CDPLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v33) = 0;
    }
  }
  uint64_t Nanoseconds = _CDPSignpostGetNanoseconds();
  v18 = _CDPSignpostLogSystem();
  v19 = v18;
  os_signpost_id_t v20 = a1[6];
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    LOWORD(v33) = 0;
    _os_signpost_emit_with_name_impl(&dword_218640000, v19, OS_SIGNPOST_INTERVAL_END, v20, "SecureChannelSendPayload", "", (uint8_t *)&v33, 2u);
  }

  v21 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = (void *)a1[6];
    int v33 = 134218240;
    id v34 = v22;
    __int16 v35 = 2048;
    double v36 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_218640000, v21, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SecureChannelSendPayload ", (uint8_t *)&v33, 0x16u);
  }

  if (a2)
  {
    v23 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:a2 userInfo:0];
  }
  else
  {
    v23 = 0;
  }
  id v24 = [v6 objectForKeyedSubscript:@"CDPChannelTTSUPayloadKey"];
  if (v23)
  {
    os_signpost_id_t v25 = _CDPLogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      __41__CDPTTSUChannel_sendPayload_completion___block_invoke_cold_3(v23, v25);
    }

    uint64_t v26 = a1[5];
    if (v26)
    {
      v27 = *(void (**)(void))(v26 + 16);
LABEL_33:
      v27();
    }
  }
  else
  {
    id v28 = _CDPLogSystem();
    v29 = v28;
    if (v24)
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        __41__CDPTTSUChannel_sendPayload_completion___block_invoke_cold_2((uint64_t)v24, v29);
      }

      uint64_t v30 = a1[5];
      if (v30)
      {
        v27 = *(void (**)(void))(v30 + 16);
        goto LABEL_33;
      }
    }
    else
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
        __41__CDPTTSUChannel_sendPayload_completion___block_invoke_cold_1(v29);
      }

      uint64_t v31 = a1[5];
      if (v31)
      {
        v32 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5320);
        (*(void (**)(uint64_t, void, void *))(v31 + 16))(v31, 0, v32);
      }
    }
  }
}

- (BOOL)approverBackupRecordsExist
{
  return self->_approverBackupRecordsExist;
}

- (unint64_t)approveriCloudKeychainState
{
  return self->_approveriCloudKeychainState;
}

- (void)listenForPayloadsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "Starting to listen for initiating payload...", buf, 2u);
  }

  sharingSession = self->_sharingSession;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  char v10 = __47__CDPTTSUChannel_listenForPayloadsWithHandler___block_invoke;
  uint64_t v11 = &unk_26432F950;
  v12 = self;
  id v13 = v4;
  id v7 = v4;
  [(CUMessageSession *)sharingSession registerRequestID:@"CDPChannelTTSURequestID" options:MEMORY[0x263EFFA78] handler:&v8];
  [(CUMessageSession *)self->_sharingSession activate];
}

void __47__CDPTTSUChannel_listenForPayloadsWithHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v6;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Payload received from requestor: %@", buf, 0xCu);
  }

  uint64_t v9 = [v6 objectForKeyedSubscript:@"CDPChannelTTSUPayloadKey"];
  char v10 = [v6 objectForKeyedSubscript:@"CDPChannelTTSUTelemetryFlowId"];

  if (v10)
  {
    uint64_t v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v11, OS_LOG_TYPE_DEFAULT, "Flow ID was received from the requesting proxy, setting on the approving proxy.", buf, 2u);
    }

    uint64_t v12 = [v6 objectForKeyedSubscript:@"CDPChannelTTSUTelemetryFlowId"];
    uint64_t v13 = *(void *)(a1 + 32);
    v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
  uint64_t v15 = *(void *)(a1 + 40);
  id v24 = 0;
  id v25 = 0;
  (*(void (**)(void))(v15 + 16))();
  id v16 = v25;
  id v17 = v24;
  if (v16)
  {
    uint64_t v18 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v18 + 24))
    {
      uint64_t v26 = @"CDPChannelTTSUPayloadKey";
      id v27 = v16;
      v19 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    }
    else
    {
      v29[0] = v16;
      v28[0] = @"CDPChannelTTSUPayloadKey";
      v28[1] = @"CDPChannelTTSUPayloadBackupRecordsExistKey";
      os_signpost_id_t v20 = [NSNumber numberWithBool:*(unsigned __int8 *)(v18 + 8)];
      v29[1] = v20;
      v28[2] = @"CDPChannelTTSUPayloadiCloudKeychainEnabledKey";
      v21 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1 + 32) + 16)];
      v29[2] = v21;
      v19 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];

      *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x263EFFA78];
  }
  id v22 = _CDPLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v19;
    _os_log_impl(&dword_218640000, v22, OS_LOG_TYPE_DEFAULT, "Sending response to requestor: %@", buf, 0xCu);
  }

  if (v17) {
    uint64_t v23 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v23 = 0;
  }
  v7[2](v7, v23, MEMORY[0x263EFFA78], v19);
}

- (void)setApproverBackupRecordsExist:(BOOL)a3
{
  self->_approverBackupRecordsExist = a3;
}

- (void)setApproveriCloudKeychainState:(unint64_t)a3
{
  self->_approveriCloudKeychainState = a3;
}

- (NSString)telemetryFlowIDFromRequester
{
  return self->_telemetryFlowIDFromRequester;
}

- (CUMessageSession)sharingSession
{
  return self->_sharingSession;
}

- (void)setSharingSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingSession, 0);
  objc_storeStrong((id *)&self->_telemetryFlowIDFromRequester, 0);
  objc_storeStrong((id *)&self->_cdpContext, 0);
}

void __41__CDPTTSUChannel_sendPayload_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_218640000, log, OS_LOG_TYPE_FAULT, "CDPTTSUChannel: No response data or error receieved", v1, 2u);
}

void __41__CDPTTSUChannel_sendPayload_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_218640000, a2, OS_LOG_TYPE_DEBUG, "CDPTTSUChannel: Recieved reply: %@", (uint8_t *)&v2, 0xCu);
}

void __41__CDPTTSUChannel_sendPayload_completion___block_invoke_cold_3(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 localizedDescription];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_debug_impl(&dword_218640000, a2, OS_LOG_TYPE_DEBUG, "CDPTTSUChannel: Received error: %@", (uint8_t *)&v4, 0xCu);
}

void __41__CDPTTSUChannel_sendPayload_completion___block_invoke_cold_4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_218640000, a2, OS_LOG_TYPE_DEBUG, "Setting _approveriCloudKeychainState = %ld", (uint8_t *)&v2, 0xCu);
}

void __41__CDPTTSUChannel_sendPayload_completion___block_invoke_cold_5(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_218640000, a2, OS_LOG_TYPE_DEBUG, "Setting _approverBackupRecordsExist = %{BOOL}d", (uint8_t *)v2, 8u);
}

@end