@interface CXChannelServiceClient
- (BOOL)isPermittedToUsePublicAPI;
- (CXChannelServiceClient)initWithConnection:(id)a3;
- (CXChannelServiceClientDelegate)delegate;
- (id)_createSandboxURLAccessValidatedUpdate:(id)a3;
- (void)actionCompleted:(id)a3 completionHandler:(id)a4;
- (void)commitTransaction:(id)a3;
- (void)handleActionTimeout:(id)a3;
- (void)handleAudioSessionActivationStateChangedTo:(id)a3;
- (void)registerWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)reportAudioFinishedForChannelWithUUID:(id)a3 completionHandler:(id)a4;
- (void)reportChannelWithUUID:(id)a3 connectedAtDate:(id)a4 completionHandler:(id)a5;
- (void)reportChannelWithUUID:(id)a3 disconnectedAtDate:(id)a4 disconnectedReason:(id)a5 completionHandler:(id)a6;
- (void)reportChannelWithUUID:(id)a3 startedConnectingAtDate:(id)a4 completionHandler:(id)a5;
- (void)reportChannelWithUUID:(id)a3 updated:(id)a4 completionHandler:(id)a5;
- (void)reportIncomingTransmissionEndedForChannelWithUUID:(id)a3 reason:(id)a4 completionHandler:(id)a5;
- (void)reportIncomingTransmissionStartedForChannelWithUUID:(id)a3 update:(id)a4 shouldReplaceOutgoingTransmission:(id)a5 completionHandler:(id)a6;
- (void)requestTransaction:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation CXChannelServiceClient

- (CXChannelServiceClient)initWithConnection:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CXChannelServiceClient;
  v5 = [(CXServiceClient *)&v9 initWithConnection:v4];
  v6 = v5;
  if (v5 && ![(CXChannelServiceClient *)v5 isPermittedToUsePublicAPI])
  {
    v7 = CXDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(CXChannelServiceClient *)(uint64_t)v6 initWithConnection:v7];
    }

    v6 = 0;
  }

  return v6;
}

- (BOOL)isPermittedToUsePublicAPI
{
  v5.receiver = self;
  v5.super_class = (Class)CXChannelServiceClient;
  if ([(CXServiceClient *)&v5 isPermittedToUsePublicAPI]) {
    LOBYTE(v3) = 1;
  }
  else {
    return ((unint64_t)[(CXServiceClient *)self backgroundModeOptions] >> 1) & 1;
  }
  return v3;
}

- (void)actionCompleted:(id)a3 completionHandler:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  v8 = CXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[CXChannelServiceClient actionCompleted:completionHandler:]";
    __int16 v34 = 2112;
    id v35 = v6;
    _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "Received %s with action: %@", buf, 0x16u);
  }

  if (v7)
  {
    if (v6)
    {
      if ([(CXChannelServiceClient *)self isPermittedToUsePublicAPI])
      {
        if (![(CXServiceClient *)self isPermittedToUsePrivateAPI])
        {
          uint64_t v9 = [v6 sanitizedCopy];

          id v6 = (id)v9;
        }
        v10 = [(CXChannelServiceClient *)self delegate];
        [v10 serviceClient:self actionCompleted:v6];

        v7[2](v7, 0);
      }
      else
      {
        v27 = CXDefaultLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.4();
        }

        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __60__CXChannelServiceClient_actionCompleted_completionHandler___block_invoke_11;
        v28[3] = &unk_1E5CAE408;
        v29 = v7;
        __60__CXChannelServiceClient_actionCompleted_completionHandler___block_invoke_11((uint64_t)v28);
      }
    }
    else
    {
      v19 = CXDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[CXCallSource actionCompleted:completionHandler:](v19, v20, v21, v22, v23, v24, v25, v26);
      }

      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __60__CXChannelServiceClient_actionCompleted_completionHandler___block_invoke_10;
      v30[3] = &unk_1E5CAE408;
      v31 = v7;
      __60__CXChannelServiceClient_actionCompleted_completionHandler___block_invoke_10((uint64_t)v30);
      id v6 = v31;
    }
  }
  else
  {
    v11 = CXDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CXCallSource requestTransaction:completionHandler:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
}

void __60__CXChannelServiceClient_actionCompleted_completionHandler___block_invoke_10(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __60__CXChannelServiceClient_actionCompleted_completionHandler___block_invoke_11(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)registerWithConfiguration:(id)a3 completionHandler:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  v8 = CXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "-[CXChannelServiceClient registerWithConfiguration:completionHandler:]";
    __int16 v31 = 2112;
    id v32 = v6;
    _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "Received %s with configuration: %@", buf, 0x16u);
  }

  if (v7)
  {
    if (v6)
    {
      if (![(CXServiceClient *)self isPermittedToUsePrivateAPI])
      {
        uint64_t v9 = [v6 sanitizedCopy];

        id v6 = (id)v9;
      }
      v10 = [(CXChannelServiceClient *)self delegate];
      [v10 serviceClient:self registeredWithConfiguration:v6];

      v7[2](v7, 0);
    }
    else
    {
      v19 = CXDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[CXChannelServiceClient registerWithConfiguration:completionHandler:](v19, v20, v21, v22, v23, v24, v25, v26);
      }

      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __70__CXChannelServiceClient_registerWithConfiguration_completionHandler___block_invoke_17;
      v27[3] = &unk_1E5CAE408;
      v28 = v7;
      __70__CXChannelServiceClient_registerWithConfiguration_completionHandler___block_invoke_17((uint64_t)v27);
      id v6 = v28;
    }
  }
  else
  {
    v11 = CXDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CXCallSource requestTransaction:completionHandler:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
}

void __70__CXChannelServiceClient_registerWithConfiguration_completionHandler___block_invoke_17(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)reportAudioFinishedForChannelWithUUID:(id)a3 completionHandler:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  v8 = CXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v6 UUIDString];
    *(_DWORD *)buf = 136315394;
    __int16 v34 = "-[CXChannelServiceClient reportAudioFinishedForChannelWithUUID:completionHandler:]";
    __int16 v35 = 2112;
    uint64_t v36 = v9;
    _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "Received %s with UUID: %@", buf, 0x16u);
  }
  if (v7)
  {
    if (v6)
    {
      if ([(CXServiceClient *)self isPermittedToUsePrivateAPI])
      {
        v10 = [(CXChannelServiceClient *)self delegate];
        [v10 serviceClient:self reportedAudioFinishedForChannelWithUUID:v6];

        v7[2](v7, 0);
        goto LABEL_17;
      }
      v28 = CXDefaultLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[CXCallSource reportAudioFinishedForCallWithUUID:reply:]();
      }

      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __82__CXChannelServiceClient_reportAudioFinishedForChannelWithUUID_completionHandler___block_invoke_24;
      v29[3] = &unk_1E5CAE408;
      v30 = v7;
      __82__CXChannelServiceClient_reportAudioFinishedForChannelWithUUID_completionHandler___block_invoke_24((uint64_t)v29);
      v27 = v30;
    }
    else
    {
      v19 = CXDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:](v19, v20, v21, v22, v23, v24, v25, v26);
      }

      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __82__CXChannelServiceClient_reportAudioFinishedForChannelWithUUID_completionHandler___block_invoke_23;
      v31[3] = &unk_1E5CAE408;
      id v32 = v7;
      __82__CXChannelServiceClient_reportAudioFinishedForChannelWithUUID_completionHandler___block_invoke_23((uint64_t)v31);
      v27 = v32;
    }

    goto LABEL_17;
  }
  v11 = CXDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[CXCallSource requestTransaction:completionHandler:](v11, v12, v13, v14, v15, v16, v17, v18);
  }

LABEL_17:
}

void __82__CXChannelServiceClient_reportAudioFinishedForChannelWithUUID_completionHandler___block_invoke_23(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __82__CXChannelServiceClient_reportAudioFinishedForChannelWithUUID_completionHandler___block_invoke_24(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)reportChannelWithUUID:(id)a3 connectedAtDate:(id)a4 completionHandler:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void))a5;
  v11 = CXDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v8 UUIDString];
    *(_DWORD *)buf = 136315650;
    uint64_t v37 = "-[CXChannelServiceClient reportChannelWithUUID:connectedAtDate:completionHandler:]";
    __int16 v38 = 2112;
    v39 = v12;
    __int16 v40 = 2112;
    id v41 = v9;
    _os_log_impl(&dword_1A6E3A000, v11, OS_LOG_TYPE_DEFAULT, "Received %s with UUID: %@ connectedAtDate: %@", buf, 0x20u);
  }
  if (v10)
  {
    if (v8)
    {
      if ([(CXChannelServiceClient *)self isPermittedToUsePublicAPI])
      {
        uint64_t v13 = [(CXChannelServiceClient *)self delegate];
        [v13 serviceClient:self reportedChannelWithUUID:v8 connectedAtDate:v9];

        v10[2](v10, 0);
        goto LABEL_17;
      }
      __int16 v31 = CXDefaultLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.4();
      }

      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __82__CXChannelServiceClient_reportChannelWithUUID_connectedAtDate_completionHandler___block_invoke_28;
      v32[3] = &unk_1E5CAE408;
      uint64_t v33 = v10;
      __82__CXChannelServiceClient_reportChannelWithUUID_connectedAtDate_completionHandler___block_invoke_28((uint64_t)v32);
      v30 = v33;
    }
    else
    {
      uint64_t v22 = CXDefaultLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:](v22, v23, v24, v25, v26, v27, v28, v29);
      }

      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __82__CXChannelServiceClient_reportChannelWithUUID_connectedAtDate_completionHandler___block_invoke_27;
      v34[3] = &unk_1E5CAE408;
      __int16 v35 = v10;
      __82__CXChannelServiceClient_reportChannelWithUUID_connectedAtDate_completionHandler___block_invoke_27((uint64_t)v34);
      v30 = v35;
    }

    goto LABEL_17;
  }
  uint64_t v14 = CXDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[CXCallSource requestTransaction:completionHandler:](v14, v15, v16, v17, v18, v19, v20, v21);
  }

LABEL_17:
}

void __82__CXChannelServiceClient_reportChannelWithUUID_connectedAtDate_completionHandler___block_invoke_27(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __82__CXChannelServiceClient_reportChannelWithUUID_connectedAtDate_completionHandler___block_invoke_28(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)reportChannelWithUUID:(id)a3 disconnectedAtDate:(id)a4 disconnectedReason:(id)a5 completionHandler:(id)a6
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void))a6;
  uint64_t v14 = CXDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [v10 UUIDString];
    *(_DWORD *)buf = 136315906;
    v50 = "-[CXChannelServiceClient reportChannelWithUUID:disconnectedAtDate:disconnectedReason:completionHandler:]";
    __int16 v51 = 2112;
    v52 = v15;
    __int16 v53 = 2112;
    id v54 = v11;
    __int16 v55 = 2112;
    id v56 = v12;
    _os_log_impl(&dword_1A6E3A000, v14, OS_LOG_TYPE_DEFAULT, "Received %s with UUID: %@ disconnectedAtDate: %@ disconnectedReason: %@", buf, 0x2Au);
  }
  if (v13)
  {
    if (v10)
    {
      if (v12)
      {
        if ([(CXChannelServiceClient *)self isPermittedToUsePublicAPI])
        {
          uint64_t v16 = [(CXChannelServiceClient *)self delegate];
          objc_msgSend(v16, "serviceClient:reportedChannelWithUUID:disconnectedAtDate:disconnectedReason:", self, v10, v11, objc_msgSend(v12, "integerValue"));

          v13[2](v13, 0);
          goto LABEL_21;
        }
        uint64_t v42 = CXDefaultLog();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.4();
        }

        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __104__CXChannelServiceClient_reportChannelWithUUID_disconnectedAtDate_disconnectedReason_completionHandler___block_invoke_36;
        v43[3] = &unk_1E5CAE408;
        v44 = v13;
        __104__CXChannelServiceClient_reportChannelWithUUID_disconnectedAtDate_disconnectedReason_completionHandler___block_invoke_36((uint64_t)v43);
        uint64_t v33 = v44;
      }
      else
      {
        __int16 v34 = CXDefaultLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          -[CXChannelServiceClient reportChannelWithUUID:disconnectedAtDate:disconnectedReason:completionHandler:](v34, v35, v36, v37, v38, v39, v40, v41);
        }

        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __104__CXChannelServiceClient_reportChannelWithUUID_disconnectedAtDate_disconnectedReason_completionHandler___block_invoke_35;
        v45[3] = &unk_1E5CAE408;
        v46 = v13;
        __104__CXChannelServiceClient_reportChannelWithUUID_disconnectedAtDate_disconnectedReason_completionHandler___block_invoke_35((uint64_t)v45);
        uint64_t v33 = v46;
      }
    }
    else
    {
      uint64_t v25 = CXDefaultLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:](v25, v26, v27, v28, v29, v30, v31, v32);
      }

      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __104__CXChannelServiceClient_reportChannelWithUUID_disconnectedAtDate_disconnectedReason_completionHandler___block_invoke_31;
      v47[3] = &unk_1E5CAE408;
      v48 = v13;
      __104__CXChannelServiceClient_reportChannelWithUUID_disconnectedAtDate_disconnectedReason_completionHandler___block_invoke_31((uint64_t)v47);
      uint64_t v33 = v48;
    }

    goto LABEL_21;
  }
  uint64_t v17 = CXDefaultLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[CXCallSource requestTransaction:completionHandler:](v17, v18, v19, v20, v21, v22, v23, v24);
  }

LABEL_21:
}

void __104__CXChannelServiceClient_reportChannelWithUUID_disconnectedAtDate_disconnectedReason_completionHandler___block_invoke_31(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __104__CXChannelServiceClient_reportChannelWithUUID_disconnectedAtDate_disconnectedReason_completionHandler___block_invoke_35(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __104__CXChannelServiceClient_reportChannelWithUUID_disconnectedAtDate_disconnectedReason_completionHandler___block_invoke_36(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)reportChannelWithUUID:(id)a3 startedConnectingAtDate:(id)a4 completionHandler:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id v11 = CXDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v8 UUIDString];
    *(_DWORD *)buf = 136315650;
    uint64_t v37 = "-[CXChannelServiceClient reportChannelWithUUID:startedConnectingAtDate:completionHandler:]";
    __int16 v38 = 2112;
    uint64_t v39 = v12;
    __int16 v40 = 2112;
    id v41 = v9;
    _os_log_impl(&dword_1A6E3A000, v11, OS_LOG_TYPE_DEFAULT, "Received %s with UUID: %@ startedConnectingAtDate: %@", buf, 0x20u);
  }
  if (v10)
  {
    if (v8)
    {
      if ([(CXChannelServiceClient *)self isPermittedToUsePublicAPI])
      {
        uint64_t v13 = [(CXChannelServiceClient *)self delegate];
        [v13 serviceClient:self reportedChannelWithUUID:v8 startedConnectingAtDate:v9];

        v10[2](v10, 0);
        goto LABEL_17;
      }
      uint64_t v31 = CXDefaultLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.4();
      }

      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __90__CXChannelServiceClient_reportChannelWithUUID_startedConnectingAtDate_completionHandler___block_invoke_40;
      v32[3] = &unk_1E5CAE408;
      uint64_t v33 = v10;
      __90__CXChannelServiceClient_reportChannelWithUUID_startedConnectingAtDate_completionHandler___block_invoke_40((uint64_t)v32);
      uint64_t v30 = v33;
    }
    else
    {
      uint64_t v22 = CXDefaultLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:](v22, v23, v24, v25, v26, v27, v28, v29);
      }

      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __90__CXChannelServiceClient_reportChannelWithUUID_startedConnectingAtDate_completionHandler___block_invoke_39;
      v34[3] = &unk_1E5CAE408;
      uint64_t v35 = v10;
      __90__CXChannelServiceClient_reportChannelWithUUID_startedConnectingAtDate_completionHandler___block_invoke_39((uint64_t)v34);
      uint64_t v30 = v35;
    }

    goto LABEL_17;
  }
  uint64_t v14 = CXDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[CXCallSource requestTransaction:completionHandler:](v14, v15, v16, v17, v18, v19, v20, v21);
  }

LABEL_17:
}

void __90__CXChannelServiceClient_reportChannelWithUUID_startedConnectingAtDate_completionHandler___block_invoke_39(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __90__CXChannelServiceClient_reportChannelWithUUID_startedConnectingAtDate_completionHandler___block_invoke_40(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)reportChannelWithUUID:(id)a3 updated:(id)a4 completionHandler:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = CXDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v8 UUIDString];
    *(_DWORD *)buf = 136315650;
    v49 = "-[CXChannelServiceClient reportChannelWithUUID:updated:completionHandler:]";
    __int16 v50 = 2112;
    __int16 v51 = v12;
    __int16 v52 = 2112;
    id v53 = v9;
    _os_log_impl(&dword_1A6E3A000, v11, OS_LOG_TYPE_DEFAULT, "Received %s with UUID: %@ update: %@", buf, 0x20u);
  }
  if (v10)
  {
    if (!v8)
    {
      uint64_t v24 = CXDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:](v24, v25, v26, v27, v28, v29, v30, v31);
      }

      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __74__CXChannelServiceClient_reportChannelWithUUID_updated_completionHandler___block_invoke_43;
      v46[3] = &unk_1E5CAE408;
      id v47 = v10;
      __74__CXChannelServiceClient_reportChannelWithUUID_updated_completionHandler___block_invoke_43((uint64_t)v46);
      uint64_t v32 = v47;
      goto LABEL_22;
    }
    if (v9)
    {
      if ([(CXChannelServiceClient *)self isPermittedToUsePublicAPI])
      {
        if (![(CXServiceClient *)self isPermittedToUsePrivateAPI])
        {
          uint64_t v13 = [v9 sanitizedCopy];

          id v9 = (id)v13;
        }
        uint64_t v14 = [(CXChannelServiceClient *)self _createSandboxURLAccessValidatedUpdate:v9];
        uint64_t v15 = [(CXChannelServiceClient *)self delegate];
        [v15 serviceClient:self reportedChannelWithUUID:v8 updated:v14];

        (*((void (**)(id, void))v10 + 2))(v10, 0);
        goto LABEL_23;
      }
      id v41 = CXDefaultLog();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.4();
      }

      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __74__CXChannelServiceClient_reportChannelWithUUID_updated_completionHandler___block_invoke_48;
      v42[3] = &unk_1E5CAE408;
      id v43 = v10;
      __74__CXChannelServiceClient_reportChannelWithUUID_updated_completionHandler___block_invoke_48((uint64_t)v42);
      uint64_t v32 = v43;
LABEL_22:

      goto LABEL_23;
    }
    uint64_t v33 = CXDefaultLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      -[CXCallSource reportNewIncomingCallWithUUID:update:reply:](v33, v34, v35, v36, v37, v38, v39, v40);
    }

    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __74__CXChannelServiceClient_reportChannelWithUUID_updated_completionHandler___block_invoke_47;
    v44[3] = &unk_1E5CAE408;
    id v45 = v10;
    __74__CXChannelServiceClient_reportChannelWithUUID_updated_completionHandler___block_invoke_47((uint64_t)v44);
    id v9 = v45;
  }
  else
  {
    uint64_t v16 = CXDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[CXCallSource requestTransaction:completionHandler:](v16, v17, v18, v19, v20, v21, v22, v23);
    }
  }
LABEL_23:
}

void __74__CXChannelServiceClient_reportChannelWithUUID_updated_completionHandler___block_invoke_43(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __74__CXChannelServiceClient_reportChannelWithUUID_updated_completionHandler___block_invoke_47(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __74__CXChannelServiceClient_reportChannelWithUUID_updated_completionHandler___block_invoke_48(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)reportIncomingTransmissionEndedForChannelWithUUID:(id)a3 reason:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (v8)
    {
      if (v9)
      {
        if ([(CXChannelServiceClient *)self isPermittedToUsePublicAPI])
        {
          id v11 = [(CXChannelServiceClient *)self delegate];
          objc_msgSend(v11, "serviceClient:reportedIncomingTransmissionEndedForChannelWithUUID:reason:completionHandler:", self, v8, objc_msgSend(v9, "integerValue"), v10);

          goto LABEL_19;
        }
        uint64_t v37 = CXDefaultLog();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.4();
        }

        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __101__CXChannelServiceClient_reportIncomingTransmissionEndedForChannelWithUUID_reason_completionHandler___block_invoke_56;
        v38[3] = &unk_1E5CAE408;
        id v39 = v10;
        __101__CXChannelServiceClient_reportIncomingTransmissionEndedForChannelWithUUID_reason_completionHandler___block_invoke_56((uint64_t)v38);
        uint64_t v28 = v39;
      }
      else
      {
        uint64_t v29 = CXDefaultLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          -[CXChannelServiceClient reportIncomingTransmissionEndedForChannelWithUUID:reason:completionHandler:](v29, v30, v31, v32, v33, v34, v35, v36);
        }

        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __101__CXChannelServiceClient_reportIncomingTransmissionEndedForChannelWithUUID_reason_completionHandler___block_invoke_55;
        v40[3] = &unk_1E5CAE408;
        id v41 = v10;
        __101__CXChannelServiceClient_reportIncomingTransmissionEndedForChannelWithUUID_reason_completionHandler___block_invoke_55((uint64_t)v40);
        uint64_t v28 = v41;
      }
    }
    else
    {
      uint64_t v20 = CXDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:](v20, v21, v22, v23, v24, v25, v26, v27);
      }

      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __101__CXChannelServiceClient_reportIncomingTransmissionEndedForChannelWithUUID_reason_completionHandler___block_invoke_51;
      v42[3] = &unk_1E5CAE408;
      id v43 = v10;
      __101__CXChannelServiceClient_reportIncomingTransmissionEndedForChannelWithUUID_reason_completionHandler___block_invoke_51((uint64_t)v42);
      uint64_t v28 = v43;
    }

    goto LABEL_19;
  }
  id v12 = CXDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[CXCallSource requestTransaction:completionHandler:](v12, v13, v14, v15, v16, v17, v18, v19);
  }

LABEL_19:
}

void __101__CXChannelServiceClient_reportIncomingTransmissionEndedForChannelWithUUID_reason_completionHandler___block_invoke_51(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __101__CXChannelServiceClient_reportIncomingTransmissionEndedForChannelWithUUID_reason_completionHandler___block_invoke_55(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __101__CXChannelServiceClient_reportIncomingTransmissionEndedForChannelWithUUID_reason_completionHandler___block_invoke_56(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)reportIncomingTransmissionStartedForChannelWithUUID:(id)a3 update:(id)a4 shouldReplaceOutgoingTransmission:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    if (v10)
    {
      if (v11)
      {
        if ([(CXChannelServiceClient *)self isPermittedToUsePublicAPI])
        {
          uint64_t v14 = [(CXChannelServiceClient *)self _createSandboxURLAccessValidatedUpdate:v11];
          uint64_t v15 = [(CXChannelServiceClient *)self delegate];
          objc_msgSend(v15, "serviceClient:reportedIncomingTransmissionStartedForChannelWithUUID:update:shouldReplaceOutgoingTransmission:completionHandler:", self, v10, v14, objc_msgSend(v12, "BOOLValue"), v13);

          goto LABEL_19;
        }
        id v41 = CXDefaultLog();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
          -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.4();
        }

        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __137__CXChannelServiceClient_reportIncomingTransmissionStartedForChannelWithUUID_update_shouldReplaceOutgoingTransmission_completionHandler___block_invoke_61;
        v42[3] = &unk_1E5CAE408;
        id v43 = v13;
        __137__CXChannelServiceClient_reportIncomingTransmissionStartedForChannelWithUUID_update_shouldReplaceOutgoingTransmission_completionHandler___block_invoke_61((uint64_t)v42);
        uint64_t v32 = v43;
      }
      else
      {
        uint64_t v33 = CXDefaultLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          -[CXCallSource reportNewIncomingCallWithUUID:update:reply:](v33, v34, v35, v36, v37, v38, v39, v40);
        }

        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __137__CXChannelServiceClient_reportIncomingTransmissionStartedForChannelWithUUID_update_shouldReplaceOutgoingTransmission_completionHandler___block_invoke_60;
        v44[3] = &unk_1E5CAE408;
        id v45 = v13;
        __137__CXChannelServiceClient_reportIncomingTransmissionStartedForChannelWithUUID_update_shouldReplaceOutgoingTransmission_completionHandler___block_invoke_60((uint64_t)v44);
        uint64_t v32 = v45;
      }
    }
    else
    {
      uint64_t v24 = CXDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:](v24, v25, v26, v27, v28, v29, v30, v31);
      }

      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __137__CXChannelServiceClient_reportIncomingTransmissionStartedForChannelWithUUID_update_shouldReplaceOutgoingTransmission_completionHandler___block_invoke_59;
      v46[3] = &unk_1E5CAE408;
      id v47 = v13;
      __137__CXChannelServiceClient_reportIncomingTransmissionStartedForChannelWithUUID_update_shouldReplaceOutgoingTransmission_completionHandler___block_invoke_59((uint64_t)v46);
      uint64_t v32 = v47;
    }

    goto LABEL_19;
  }
  uint64_t v16 = CXDefaultLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[CXCallSource requestTransaction:completionHandler:](v16, v17, v18, v19, v20, v21, v22, v23);
  }

LABEL_19:
}

void __137__CXChannelServiceClient_reportIncomingTransmissionStartedForChannelWithUUID_update_shouldReplaceOutgoingTransmission_completionHandler___block_invoke_59(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __137__CXChannelServiceClient_reportIncomingTransmissionStartedForChannelWithUUID_update_shouldReplaceOutgoingTransmission_completionHandler___block_invoke_60(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __137__CXChannelServiceClient_reportIncomingTransmissionStartedForChannelWithUUID_update_shouldReplaceOutgoingTransmission_completionHandler___block_invoke_61(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)requestTransaction:(id)a3 completionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = CXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v31 = "-[CXChannelServiceClient requestTransaction:completionHandler:]";
    __int16 v32 = 2112;
    id v33 = v6;
    _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "Received %s with transaction: %@", buf, 0x16u);
  }

  if (v7)
  {
    if (v6)
    {
      if ([(CXServiceClient *)self isPermittedToUsePrivateAPI])
      {
        id v9 = [(CXChannelServiceClient *)self delegate];
        [v9 serviceClient:self requestedTransaction:v6 completionHandler:v7];
      }
      else
      {
        uint64_t v25 = CXDefaultLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[CXCallSource reportAudioFinishedForCallWithUUID:reply:]();
        }

        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __63__CXChannelServiceClient_requestTransaction_completionHandler___block_invoke_68;
        v26[3] = &unk_1E5CAE408;
        uint64_t v27 = v7;
        __63__CXChannelServiceClient_requestTransaction_completionHandler___block_invoke_68((uint64_t)v26);
        id v9 = v27;
      }
    }
    else
    {
      uint64_t v17 = CXDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[CXCallSource requestTransaction:completionHandler:](v17, v18, v19, v20, v21, v22, v23, v24);
      }

      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __63__CXChannelServiceClient_requestTransaction_completionHandler___block_invoke_67;
      v28[3] = &unk_1E5CAE408;
      uint64_t v29 = v7;
      __63__CXChannelServiceClient_requestTransaction_completionHandler___block_invoke_67((uint64_t)v28);
      id v9 = v29;
    }
  }
  else
  {
    id v9 = CXDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CXCallSource requestTransaction:completionHandler:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

void __63__CXChannelServiceClient_requestTransaction_completionHandler___block_invoke_67(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __63__CXChannelServiceClient_requestTransaction_completionHandler___block_invoke_68(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)_createSandboxURLAccessValidatedUpdate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)[a3 copy];
  objc_super v5 = [v4 sandboxExtendedImageURL];
  id v6 = [v5 URL];

  if (v6 && ![(CXServiceClient *)self clientCanAccessSandboxFileURL:v6])
  {
    id v7 = CXDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      uint64_t v14 = v6;
      _os_log_impl(&dword_1A6E3A000, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Client does not have permission to access channel update url: %@", (uint8_t *)&v13, 0xCu);
    }

    [v4 setSandboxExtendedImageURL:0];
  }
  id v8 = [v4 activeRemoteParticipant];
  id v9 = [v8 imageURL];

  if (v9 && ![(CXServiceClient *)self clientCanAccessSandboxFileURL:v9])
  {
    uint64_t v10 = CXDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      uint64_t v14 = v9;
      _os_log_impl(&dword_1A6E3A000, v10, OS_LOG_TYPE_DEFAULT, "[WARN] Client does not have permission to access active remote participant url: %@", (uint8_t *)&v13, 0xCu);
    }

    uint64_t v11 = [v4 activeRemoteParticipant];
    [v11 setImageURL:0];
  }

  return v4;
}

- (void)commitTransaction:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = CXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, "Sending commit for transaction %@", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [(CXServiceClient *)self connection];
  id v7 = [v6 remoteTarget];
  [v7 commitTransaction:v4];
}

- (void)handleActionTimeout:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = CXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, "Sending handle timeout for action %@", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [(CXServiceClient *)self connection];
  id v7 = [v6 remoteTarget];
  [v7 handleActionTimeout:v4];
}

- (void)handleAudioSessionActivationStateChangedTo:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = CXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = [v4 BOOLValue];
    _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, "Sending handleAudioSessionActivationStateChangedTo %d", (uint8_t *)v8, 8u);
  }

  id v6 = [(CXServiceClient *)self connection];
  id v7 = [v6 remoteTarget];
  [v7 handleAudioSessionActivationStateChangedTo:v4];
}

- (CXChannelServiceClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CXChannelServiceClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithConnection:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  OUTLINED_FUNCTION_1_1();
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  id v6 = v5;
  _os_log_error_impl(&dword_1A6E3A000, a3, OS_LOG_TYPE_ERROR, "Failed to initialize %@; expected background mode not found on connection %@.",
    v7,
    0x16u);
}

- (void)registerWithConfiguration:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)reportChannelWithUUID:(uint64_t)a3 disconnectedAtDate:(uint64_t)a4 disconnectedReason:(uint64_t)a5 completionHandler:(uint64_t)a6 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)reportIncomingTransmissionEndedForChannelWithUUID:(uint64_t)a3 reason:(uint64_t)a4 completionHandler:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end