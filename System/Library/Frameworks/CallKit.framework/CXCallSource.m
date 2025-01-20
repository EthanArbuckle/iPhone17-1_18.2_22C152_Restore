@interface CXCallSource
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)isConnected;
- (BOOL)isPermittedToUseBluetoothAccessories;
- (BOOL)isPermittedToUsePrivateAPI;
- (BOOL)isPermittedToUsePublicAPI;
- (CXCallSource)initWithIdentifier:(id)a3;
- (CXCallSourceDelegate)delegate;
- (CXProviderVendorProtocol)vendorProtocolDelegate;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)identifier;
- (NSString)localizedName;
- (NSURL)bundleURL;
- (OS_dispatch_queue)queue;
- (int)processIdentifier;
- (void)actionCompleted:(id)a3 completionHandler:(id)a4;
- (void)beginWithCompletionHandler:(id)a3;
- (void)commitTransaction:(id)a3;
- (void)handleActionTimeout:(id)a3;
- (void)handleAudioSessionActivationStateChangedTo:(id)a3;
- (void)registerWithConfiguration:(id)a3;
- (void)reportAudioFinishedForCallWithUUID:(id)a3;
- (void)reportAudioFinishedForCallWithUUID:(id)a3 reply:(id)a4;
- (void)reportCallWithUUID:(id)a3 changedFrequencyData:(id)a4 forDirection:(int64_t)a5;
- (void)reportCallWithUUID:(id)a3 changedFrequencyData:(id)a4 forDirection:(int64_t)a5 reply:(id)a6;
- (void)reportCallWithUUID:(id)a3 changedMeterLevel:(float)a4 forDirection:(int64_t)a5;
- (void)reportCallWithUUID:(id)a3 changedMeterLevel:(float)a4 forDirection:(int64_t)a5 reply:(id)a6;
- (void)reportCallWithUUID:(id)a3 crossDeviceIdentifier:(id)a4 changedBytesOfDataUsed:(int64_t)a5;
- (void)reportCallWithUUID:(id)a3 crossDeviceIdentifier:(id)a4 changedBytesOfDataUsed:(int64_t)a5 reply:(id)a6;
- (void)reportCallWithUUID:(id)a3 endedAtDate:(id)a4 privateReason:(int64_t)a5 failureContext:(id)a6;
- (void)reportCallWithUUID:(id)a3 endedAtDate:(id)a4 privateReason:(int64_t)a5 failureContext:(id)a6 reply:(id)a7;
- (void)reportCallWithUUID:(id)a3 receivedDTMFUpdate:(id)a4;
- (void)reportCallWithUUID:(id)a3 receivedDTMFUpdate:(id)a4 reply:(id)a5;
- (void)reportCallWithUUID:(id)a3 updated:(id)a4;
- (void)reportCallWithUUID:(id)a3 updated:(id)a4 reply:(id)a5;
- (void)reportNewIncomingCallWithUUID:(id)a3 update:(id)a4 reply:(id)a5;
- (void)reportNewOutgoingCallWithUUID:(id)a3 update:(id)a4;
- (void)reportOutgoingCallWithUUID:(id)a3 connectedAtDate:(id)a4;
- (void)reportOutgoingCallWithUUID:(id)a3 connectedAtDate:(id)a4 reply:(id)a5;
- (void)reportOutgoingCallWithUUID:(id)a3 sentInvitationAtDate:(id)a4;
- (void)reportOutgoingCallWithUUID:(id)a3 sentInvitationAtDate:(id)a4 reply:(id)a5;
- (void)reportOutgoingCallWithUUID:(id)a3 startedConnectingAtDate:(id)a4;
- (void)reportOutgoingCallWithUUID:(id)a3 startedConnectingAtDate:(id)a4 reply:(id)a5;
- (void)requestTransaction:(id)a3 completionHandler:(id)a4;
- (void)setConnected:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CXCallSource

- (CXCallSource)initWithIdentifier:(id)a3
{
  id v5 = a3;
  if ([v5 length])
  {
    v12.receiver = self;
    v12.super_class = (Class)CXCallSource;
    v6 = [(CXCallSource *)&v12 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_identifier, a3);
      dispatch_queue_t v8 = dispatch_queue_create("com.apple.callkit.callsource", 0);
      queue = v7->_queue;
      v7->_queue = (OS_dispatch_queue *)v8;
    }
    self = v7;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(CXCallSource *)self identifier];
  v6 = [v3 stringWithFormat:@"<%@ %p identifier=%@ isConnected=%d processIdentifier=%d isPermittedToUsePublicAPI=%d isPermittedToUsePrivateAPI=%d>", v4, self, v5, -[CXCallSource isConnected](self, "isConnected"), -[CXCallSource processIdentifier](self, "processIdentifier"), -[CXCallSource isPermittedToUsePublicAPI](self, "isPermittedToUsePublicAPI"), -[CXCallSource isPermittedToUsePrivateAPI](self, "isPermittedToUsePrivateAPI")];

  return (NSString *)v6;
}

- (CXProviderVendorProtocol)vendorProtocolDelegate
{
  return 0;
}

- (NSString)bundleIdentifier
{
  return 0;
}

- (NSURL)bundleURL
{
  return 0;
}

- (NSString)localizedName
{
  return 0;
}

- (int)processIdentifier
{
  return -1;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  *(void *)&long long v3 = -1;
  *((void *)&v3 + 1) = -1;
  *(_OWORD *)retstr->var0 = v3;
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (BOOL)isPermittedToUsePublicAPI
{
  return 0;
}

- (BOOL)isPermittedToUsePrivateAPI
{
  return 0;
}

- (BOOL)isPermittedToUseBluetoothAccessories
{
  return 0;
}

- (void)setConnected:(BOOL)a3
{
  if (self->_connected != a3)
  {
    BOOL v3 = a3;
    self->_connected = a3;
    id v5 = [(CXCallSource *)self delegate];
    id v6 = v5;
    if (v3) {
      [v5 callSourceConnectionStarted:self];
    }
    else {
      [v5 callSourceConnectionEnded:self];
    }
  }
}

- (void)beginWithCompletionHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (void)registerWithConfiguration:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = CXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    v9 = "-[CXCallSource registerWithConfiguration:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, "Received %s with configuration: %@", (uint8_t *)&v8, 0x16u);
  }

  if (![(CXCallSource *)self isPermittedToUsePrivateAPI])
  {
    uint64_t v6 = [v4 sanitizedCopy];

    id v4 = (id)v6;
  }
  v7 = [(CXCallSource *)self delegate];
  [v7 callSource:self registeredWithConfiguration:v4];
}

- (void)reportNewIncomingCallWithUUID:(id)a3 update:(id)a4 reply:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = CXDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v8 UUIDString];
    *(_DWORD *)buf = 136315650;
    v48 = "-[CXCallSource reportNewIncomingCallWithUUID:update:reply:]";
    __int16 v49 = 2112;
    v50 = v12;
    __int16 v51 = 2112;
    id v52 = v9;
    _os_log_impl(&dword_1A6E3A000, v11, OS_LOG_TYPE_DEFAULT, "Received %s with UUID: %@ update: %@", buf, 0x20u);
  }
  if (v10)
  {
    if (!v8)
    {
      v23 = CXDefaultLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:](v23, v24, v25, v26, v27, v28, v29, v30);
      }

      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __59__CXCallSource_reportNewIncomingCallWithUUID_update_reply___block_invoke_9;
      v45[3] = &unk_1E5CAE408;
      id v46 = v10;
      __59__CXCallSource_reportNewIncomingCallWithUUID_update_reply___block_invoke_9((uint64_t)v45);
      v31 = v46;
      goto LABEL_22;
    }
    if (v9)
    {
      if ([(CXCallSource *)self isPermittedToUsePublicAPI])
      {
        if (![(CXCallSource *)self isPermittedToUsePrivateAPI])
        {
          uint64_t v13 = [v9 sanitizedCopy];

          id v9 = (id)v13;
        }
        v14 = [(CXCallSource *)self delegate];
        [v14 callSource:self reportedNewIncomingCallWithUUID:v8 update:v9 completion:v10];

        goto LABEL_23;
      }
      v40 = CXDefaultLog();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.4();
      }

      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __59__CXCallSource_reportNewIncomingCallWithUUID_update_reply___block_invoke_15;
      v41[3] = &unk_1E5CAE408;
      id v42 = v10;
      __59__CXCallSource_reportNewIncomingCallWithUUID_update_reply___block_invoke_15((uint64_t)v41);
      v31 = v42;
LABEL_22:

      goto LABEL_23;
    }
    v32 = CXDefaultLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[CXCallSource reportNewIncomingCallWithUUID:update:reply:](v32, v33, v34, v35, v36, v37, v38, v39);
    }

    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __59__CXCallSource_reportNewIncomingCallWithUUID_update_reply___block_invoke_14;
    v43[3] = &unk_1E5CAE408;
    id v44 = v10;
    __59__CXCallSource_reportNewIncomingCallWithUUID_update_reply___block_invoke_14((uint64_t)v43);
    id v9 = v44;
  }
  else
  {
    v15 = CXDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CXCallSource reportNewIncomingCallWithUUID:update:reply:](v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
LABEL_23:
}

void __59__CXCallSource_reportNewIncomingCallWithUUID_update_reply___block_invoke_9(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __59__CXCallSource_reportNewIncomingCallWithUUID_update_reply___block_invoke_14(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __59__CXCallSource_reportNewIncomingCallWithUUID_update_reply___block_invoke_15(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_incomingCallErrorWithCode:", 1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)reportCallWithUUID:(id)a3 updated:(id)a4
{
}

- (void)reportCallWithUUID:(id)a3 updated:(id)a4 reply:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = CXDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v8 UUIDString];
    *(_DWORD *)buf = 136315650;
    v48 = "-[CXCallSource reportCallWithUUID:updated:reply:]";
    __int16 v49 = 2112;
    v50 = v12;
    __int16 v51 = 2112;
    id v52 = v9;
    _os_log_impl(&dword_1A6E3A000, v11, OS_LOG_TYPE_DEFAULT, "Received %s with UUID: %@ update: %@", buf, 0x20u);
  }
  if (v10)
  {
    if (!v8)
    {
      v23 = CXDefaultLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:](v23, v24, v25, v26, v27, v28, v29, v30);
      }

      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __49__CXCallSource_reportCallWithUUID_updated_reply___block_invoke_21;
      v45[3] = &unk_1E5CAE408;
      id v46 = v10;
      __49__CXCallSource_reportCallWithUUID_updated_reply___block_invoke_21((uint64_t)v45);
      v31 = v46;
      goto LABEL_22;
    }
    if (v9)
    {
      if ([(CXCallSource *)self isPermittedToUsePublicAPI])
      {
        if (![(CXCallSource *)self isPermittedToUsePrivateAPI])
        {
          uint64_t v13 = [v9 sanitizedCopy];

          id v9 = (id)v13;
        }
        v14 = [(CXCallSource *)self delegate];
        [v14 callSource:self reportedCallWithUUID:v8 updated:v9];

        (*((void (**)(id, void))v10 + 2))(v10, 0);
        goto LABEL_23;
      }
      v40 = CXDefaultLog();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.4();
      }

      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __49__CXCallSource_reportCallWithUUID_updated_reply___block_invoke_23;
      v41[3] = &unk_1E5CAE408;
      id v42 = v10;
      __49__CXCallSource_reportCallWithUUID_updated_reply___block_invoke_23((uint64_t)v41);
      v31 = v42;
LABEL_22:

      goto LABEL_23;
    }
    v32 = CXDefaultLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[CXCallSource reportNewIncomingCallWithUUID:update:reply:](v32, v33, v34, v35, v36, v37, v38, v39);
    }

    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __49__CXCallSource_reportCallWithUUID_updated_reply___block_invoke_22;
    v43[3] = &unk_1E5CAE408;
    id v44 = v10;
    __49__CXCallSource_reportCallWithUUID_updated_reply___block_invoke_22((uint64_t)v43);
    id v9 = v44;
  }
  else
  {
    v15 = CXDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CXCallSource reportNewIncomingCallWithUUID:update:reply:](v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
LABEL_23:
}

void __49__CXCallSource_reportCallWithUUID_updated_reply___block_invoke_21(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __49__CXCallSource_reportCallWithUUID_updated_reply___block_invoke_22(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __49__CXCallSource_reportCallWithUUID_updated_reply___block_invoke_23(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)reportCallWithUUID:(id)a3 receivedDTMFUpdate:(id)a4
{
}

- (void)reportCallWithUUID:(id)a3 receivedDTMFUpdate:(id)a4 reply:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = CXDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v8 UUIDString];
    *(_DWORD *)buf = 136315650;
    v48 = "-[CXCallSource reportCallWithUUID:receivedDTMFUpdate:reply:]";
    __int16 v49 = 2112;
    v50 = v12;
    __int16 v51 = 2112;
    id v52 = v9;
    _os_log_impl(&dword_1A6E3A000, v11, OS_LOG_TYPE_DEFAULT, "Received %s with UUID: %@ dtmfUpdate: %@", buf, 0x20u);
  }
  if (v10)
  {
    if (!v8)
    {
      v23 = CXDefaultLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:](v23, v24, v25, v26, v27, v28, v29, v30);
      }

      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __60__CXCallSource_reportCallWithUUID_receivedDTMFUpdate_reply___block_invoke_28;
      v45[3] = &unk_1E5CAE408;
      id v46 = v10;
      __60__CXCallSource_reportCallWithUUID_receivedDTMFUpdate_reply___block_invoke_28((uint64_t)v45);
      v31 = v46;
      goto LABEL_22;
    }
    if (v9)
    {
      if ([(CXCallSource *)self isPermittedToUsePublicAPI])
      {
        if (![(CXCallSource *)self isPermittedToUsePrivateAPI])
        {
          uint64_t v13 = [v9 sanitizedCopy];

          id v9 = (id)v13;
        }
        v14 = [(CXCallSource *)self delegate];
        [v14 callSource:self reportedCallWithUUID:v8 receivedDTMFUpdate:v9];

        (*((void (**)(id, void))v10 + 2))(v10, 0);
        goto LABEL_23;
      }
      v40 = CXDefaultLog();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.4();
      }

      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __60__CXCallSource_reportCallWithUUID_receivedDTMFUpdate_reply___block_invoke_33;
      v41[3] = &unk_1E5CAE408;
      id v42 = v10;
      __60__CXCallSource_reportCallWithUUID_receivedDTMFUpdate_reply___block_invoke_33((uint64_t)v41);
      v31 = v42;
LABEL_22:

      goto LABEL_23;
    }
    v32 = CXDefaultLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[CXCallSource reportCallWithUUID:receivedDTMFUpdate:reply:](v32, v33, v34, v35, v36, v37, v38, v39);
    }

    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __60__CXCallSource_reportCallWithUUID_receivedDTMFUpdate_reply___block_invoke_32;
    v43[3] = &unk_1E5CAE408;
    id v44 = v10;
    __60__CXCallSource_reportCallWithUUID_receivedDTMFUpdate_reply___block_invoke_32((uint64_t)v43);
    id v9 = v44;
  }
  else
  {
    v15 = CXDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CXCallSource reportNewIncomingCallWithUUID:update:reply:](v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
LABEL_23:
}

void __60__CXCallSource_reportCallWithUUID_receivedDTMFUpdate_reply___block_invoke_28(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __60__CXCallSource_reportCallWithUUID_receivedDTMFUpdate_reply___block_invoke_32(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __60__CXCallSource_reportCallWithUUID_receivedDTMFUpdate_reply___block_invoke_33(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)reportCallWithUUID:(id)a3 endedAtDate:(id)a4 privateReason:(int64_t)a5 failureContext:(id)a6
{
}

- (void)reportCallWithUUID:(id)a3 endedAtDate:(id)a4 privateReason:(int64_t)a5 failureContext:(id)a6 reply:(id)a7
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v15 = (void (**)(id, void))a7;
  uint64_t v16 = CXDefaultLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = [v12 UUIDString];
    *(_DWORD *)buf = 136316162;
    v43 = "-[CXCallSource reportCallWithUUID:endedAtDate:privateReason:failureContext:reply:]";
    __int16 v44 = 2112;
    v45 = v17;
    __int16 v46 = 2112;
    id v47 = v13;
    __int16 v48 = 2048;
    int64_t v49 = a5;
    __int16 v50 = 2112;
    id v51 = v14;
    _os_log_impl(&dword_1A6E3A000, v16, OS_LOG_TYPE_DEFAULT, "Received %s with UUID: %@ dateEnded: %@ privateEndedReason: %ld failureContext: %@", buf, 0x34u);
  }
  if (v15)
  {
    if (v12)
    {
      if ([(CXCallSource *)self isPermittedToUsePublicAPI])
      {
        if (![(CXCallSource *)self isPermittedToUsePrivateAPI])
        {
          uint64_t v18 = [v14 sanitizedCopy];

          id v14 = (id)v18;
        }
        uint64_t v19 = [(CXCallSource *)self delegate];
        [v19 callSource:self reportedCallWithUUID:v12 endedAtDate:v13 privateReason:a5 failureContext:v14];

        v15[2](v15, 0);
        goto LABEL_19;
      }
      uint64_t v37 = CXDefaultLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.4();
      }

      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __82__CXCallSource_reportCallWithUUID_endedAtDate_privateReason_failureContext_reply___block_invoke_39;
      v38[3] = &unk_1E5CAE408;
      uint64_t v39 = v15;
      __82__CXCallSource_reportCallWithUUID_endedAtDate_privateReason_failureContext_reply___block_invoke_39((uint64_t)v38);
      uint64_t v36 = v39;
    }
    else
    {
      uint64_t v28 = CXDefaultLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:](v28, v29, v30, v31, v32, v33, v34, v35);
      }

      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __82__CXCallSource_reportCallWithUUID_endedAtDate_privateReason_failureContext_reply___block_invoke_38;
      v40[3] = &unk_1E5CAE408;
      v41 = v15;
      __82__CXCallSource_reportCallWithUUID_endedAtDate_privateReason_failureContext_reply___block_invoke_38((uint64_t)v40);
      uint64_t v36 = v41;
    }

    goto LABEL_19;
  }
  uint64_t v20 = CXDefaultLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    -[CXCallSource reportNewIncomingCallWithUUID:update:reply:](v20, v21, v22, v23, v24, v25, v26, v27);
  }

LABEL_19:
}

void __82__CXCallSource_reportCallWithUUID_endedAtDate_privateReason_failureContext_reply___block_invoke_38(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __82__CXCallSource_reportCallWithUUID_endedAtDate_privateReason_failureContext_reply___block_invoke_39(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)reportOutgoingCallWithUUID:(id)a3 sentInvitationAtDate:(id)a4
{
}

- (void)reportOutgoingCallWithUUID:(id)a3 sentInvitationAtDate:(id)a4 reply:(id)a5
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
    uint64_t v37 = "-[CXCallSource reportOutgoingCallWithUUID:sentInvitationAtDate:reply:]";
    __int16 v38 = 2112;
    uint64_t v39 = v12;
    __int16 v40 = 2112;
    id v41 = v9;
    _os_log_impl(&dword_1A6E3A000, v11, OS_LOG_TYPE_DEFAULT, "Received %s with UUID: %@ dateSentInvitation: %@", buf, 0x20u);
  }
  if (v10)
  {
    if (v8)
    {
      if ([(CXCallSource *)self isPermittedToUsePublicAPI])
      {
        id v13 = [(CXCallSource *)self delegate];
        [v13 callSource:self reportedOutgoingCallWithUUID:v8 sentInvitationAtDate:v9];

        v10[2](v10, 0);
        goto LABEL_17;
      }
      uint64_t v31 = CXDefaultLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.4();
      }

      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __70__CXCallSource_reportOutgoingCallWithUUID_sentInvitationAtDate_reply___block_invoke_45;
      v32[3] = &unk_1E5CAE408;
      uint64_t v33 = v10;
      __70__CXCallSource_reportOutgoingCallWithUUID_sentInvitationAtDate_reply___block_invoke_45((uint64_t)v32);
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
      v34[2] = __70__CXCallSource_reportOutgoingCallWithUUID_sentInvitationAtDate_reply___block_invoke_44;
      v34[3] = &unk_1E5CAE408;
      uint64_t v35 = v10;
      __70__CXCallSource_reportOutgoingCallWithUUID_sentInvitationAtDate_reply___block_invoke_44((uint64_t)v34);
      uint64_t v30 = v35;
    }

    goto LABEL_17;
  }
  id v14 = CXDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[CXCallSource reportNewIncomingCallWithUUID:update:reply:](v14, v15, v16, v17, v18, v19, v20, v21);
  }

LABEL_17:
}

void __70__CXCallSource_reportOutgoingCallWithUUID_sentInvitationAtDate_reply___block_invoke_44(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __70__CXCallSource_reportOutgoingCallWithUUID_sentInvitationAtDate_reply___block_invoke_45(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)reportOutgoingCallWithUUID:(id)a3 startedConnectingAtDate:(id)a4
{
}

- (void)reportOutgoingCallWithUUID:(id)a3 startedConnectingAtDate:(id)a4 reply:(id)a5
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
    uint64_t v37 = "-[CXCallSource reportOutgoingCallWithUUID:startedConnectingAtDate:reply:]";
    __int16 v38 = 2112;
    uint64_t v39 = v12;
    __int16 v40 = 2112;
    id v41 = v9;
    _os_log_impl(&dword_1A6E3A000, v11, OS_LOG_TYPE_DEFAULT, "Received %s with UUID: %@ dateStartedConnecting: %@", buf, 0x20u);
  }
  if (v10)
  {
    if (v8)
    {
      if ([(CXCallSource *)self isPermittedToUsePublicAPI])
      {
        id v13 = [(CXCallSource *)self delegate];
        [v13 callSource:self reportedOutgoingCallWithUUID:v8 startedConnectingAtDate:v9];

        v10[2](v10, 0);
        goto LABEL_17;
      }
      uint64_t v31 = CXDefaultLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.4();
      }

      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __73__CXCallSource_reportOutgoingCallWithUUID_startedConnectingAtDate_reply___block_invoke_51;
      v32[3] = &unk_1E5CAE408;
      uint64_t v33 = v10;
      __73__CXCallSource_reportOutgoingCallWithUUID_startedConnectingAtDate_reply___block_invoke_51((uint64_t)v32);
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
      v34[2] = __73__CXCallSource_reportOutgoingCallWithUUID_startedConnectingAtDate_reply___block_invoke_50;
      v34[3] = &unk_1E5CAE408;
      uint64_t v35 = v10;
      __73__CXCallSource_reportOutgoingCallWithUUID_startedConnectingAtDate_reply___block_invoke_50((uint64_t)v34);
      uint64_t v30 = v35;
    }

    goto LABEL_17;
  }
  id v14 = CXDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[CXCallSource reportNewIncomingCallWithUUID:update:reply:](v14, v15, v16, v17, v18, v19, v20, v21);
  }

LABEL_17:
}

void __73__CXCallSource_reportOutgoingCallWithUUID_startedConnectingAtDate_reply___block_invoke_50(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __73__CXCallSource_reportOutgoingCallWithUUID_startedConnectingAtDate_reply___block_invoke_51(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)reportNewOutgoingCallWithUUID:(id)a3 update:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = CXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 UUIDString];
    int v11 = 136315394;
    id v12 = "-[CXCallSource reportNewOutgoingCallWithUUID:update:]";
    __int16 v13 = 2112;
    id v14 = v9;
    _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "Received %s with UUID: %@", (uint8_t *)&v11, 0x16u);
  }
  id v10 = [(CXCallSource *)self delegate];
  [v10 callSource:self reportedNewOutgoingCallWithUUID:v6 update:v7];
}

- (void)reportOutgoingCallWithUUID:(id)a3 connectedAtDate:(id)a4
{
}

- (void)reportOutgoingCallWithUUID:(id)a3 connectedAtDate:(id)a4 reply:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  int v11 = CXDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v8 UUIDString];
    *(_DWORD *)buf = 136315650;
    uint64_t v37 = "-[CXCallSource reportOutgoingCallWithUUID:connectedAtDate:reply:]";
    __int16 v38 = 2112;
    uint64_t v39 = v12;
    __int16 v40 = 2112;
    id v41 = v9;
    _os_log_impl(&dword_1A6E3A000, v11, OS_LOG_TYPE_DEFAULT, "Received %s with UUID: %@ dateConnected: %@", buf, 0x20u);
  }
  if (v10)
  {
    if (v8)
    {
      if ([(CXCallSource *)self isPermittedToUsePublicAPI])
      {
        __int16 v13 = [(CXCallSource *)self delegate];
        [v13 callSource:self reportedOutgoingCallWithUUID:v8 connectedAtDate:v9];

        v10[2](v10, 0);
        goto LABEL_17;
      }
      uint64_t v31 = CXDefaultLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.4();
      }

      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __65__CXCallSource_reportOutgoingCallWithUUID_connectedAtDate_reply___block_invoke_57;
      v32[3] = &unk_1E5CAE408;
      uint64_t v33 = v10;
      __65__CXCallSource_reportOutgoingCallWithUUID_connectedAtDate_reply___block_invoke_57((uint64_t)v32);
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
      v34[2] = __65__CXCallSource_reportOutgoingCallWithUUID_connectedAtDate_reply___block_invoke_56;
      v34[3] = &unk_1E5CAE408;
      uint64_t v35 = v10;
      __65__CXCallSource_reportOutgoingCallWithUUID_connectedAtDate_reply___block_invoke_56((uint64_t)v34);
      uint64_t v30 = v35;
    }

    goto LABEL_17;
  }
  id v14 = CXDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[CXCallSource reportNewIncomingCallWithUUID:update:reply:](v14, v15, v16, v17, v18, v19, v20, v21);
  }

LABEL_17:
}

void __65__CXCallSource_reportOutgoingCallWithUUID_connectedAtDate_reply___block_invoke_56(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __65__CXCallSource_reportOutgoingCallWithUUID_connectedAtDate_reply___block_invoke_57(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)reportAudioFinishedForCallWithUUID:(id)a3
{
}

- (void)reportAudioFinishedForCallWithUUID:(id)a3 reply:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = CXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 UUIDString];
    *(_DWORD *)buf = 136315394;
    uint64_t v34 = "-[CXCallSource reportAudioFinishedForCallWithUUID:reply:]";
    __int16 v35 = 2112;
    uint64_t v36 = v9;
    _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "Received %s with UUID: %@", buf, 0x16u);
  }
  if (v7)
  {
    if (v6)
    {
      if ([(CXCallSource *)self isPermittedToUsePrivateAPI])
      {
        id v10 = [(CXCallSource *)self delegate];
        [v10 callSource:self reportedAudioFinishedForCallWithUUID:v6];

        v7[2](v7, 0);
        goto LABEL_17;
      }
      uint64_t v28 = CXDefaultLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[CXCallSource reportAudioFinishedForCallWithUUID:reply:]();
      }

      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __57__CXCallSource_reportAudioFinishedForCallWithUUID_reply___block_invoke_63;
      v29[3] = &unk_1E5CAE408;
      uint64_t v30 = v7;
      __57__CXCallSource_reportAudioFinishedForCallWithUUID_reply___block_invoke_63((uint64_t)v29);
      uint64_t v27 = v30;
    }
    else
    {
      uint64_t v19 = CXDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:](v19, v20, v21, v22, v23, v24, v25, v26);
      }

      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __57__CXCallSource_reportAudioFinishedForCallWithUUID_reply___block_invoke_62;
      v31[3] = &unk_1E5CAE408;
      uint64_t v32 = v7;
      __57__CXCallSource_reportAudioFinishedForCallWithUUID_reply___block_invoke_62((uint64_t)v31);
      uint64_t v27 = v32;
    }

    goto LABEL_17;
  }
  int v11 = CXDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[CXCallSource reportNewIncomingCallWithUUID:update:reply:](v11, v12, v13, v14, v15, v16, v17, v18);
  }

LABEL_17:
}

void __57__CXCallSource_reportAudioFinishedForCallWithUUID_reply___block_invoke_62(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __57__CXCallSource_reportAudioFinishedForCallWithUUID_reply___block_invoke_63(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)reportCallWithUUID:(id)a3 changedFrequencyData:(id)a4 forDirection:(int64_t)a5
{
}

- (void)reportCallWithUUID:(id)a3 changedFrequencyData:(id)a4 forDirection:(int64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, void))a6;
  if (v12)
  {
    if (v10)
    {
      if ([(CXCallSource *)self isPermittedToUsePrivateAPI])
      {
        uint64_t v13 = [(CXCallSource *)self delegate];
        [v13 callSource:self reportedCallWithUUID:v10 changedFrequencyData:v11 forDirection:a5];

        v12[2](v12, 0);
        goto LABEL_15;
      }
      uint64_t v31 = CXDefaultLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[CXCallSource reportAudioFinishedForCallWithUUID:reply:]();
      }

      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __75__CXCallSource_reportCallWithUUID_changedFrequencyData_forDirection_reply___block_invoke_69;
      v32[3] = &unk_1E5CAE408;
      uint64_t v33 = v12;
      __75__CXCallSource_reportCallWithUUID_changedFrequencyData_forDirection_reply___block_invoke_69((uint64_t)v32);
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
      v34[2] = __75__CXCallSource_reportCallWithUUID_changedFrequencyData_forDirection_reply___block_invoke_68;
      v34[3] = &unk_1E5CAE408;
      __int16 v35 = v12;
      __75__CXCallSource_reportCallWithUUID_changedFrequencyData_forDirection_reply___block_invoke_68((uint64_t)v34);
      uint64_t v30 = v35;
    }

    goto LABEL_15;
  }
  uint64_t v14 = CXDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[CXCallSource reportNewIncomingCallWithUUID:update:reply:](v14, v15, v16, v17, v18, v19, v20, v21);
  }

LABEL_15:
}

void __75__CXCallSource_reportCallWithUUID_changedFrequencyData_forDirection_reply___block_invoke_68(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __75__CXCallSource_reportCallWithUUID_changedFrequencyData_forDirection_reply___block_invoke_69(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)reportCallWithUUID:(id)a3 changedMeterLevel:(float)a4 forDirection:(int64_t)a5
{
}

- (void)reportCallWithUUID:(id)a3 changedMeterLevel:(float)a4 forDirection:(int64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = (void (**)(id, void))a6;
  if (v11)
  {
    if (v10)
    {
      if ([(CXCallSource *)self isPermittedToUsePrivateAPI])
      {
        uint64_t v12 = [(CXCallSource *)self delegate];
        *(float *)&double v13 = a4;
        [v12 callSource:self reportedCallWithUUID:v10 changedMeterLevel:a5 forDirection:v13];

        v11[2](v11, 0);
        goto LABEL_15;
      }
      uint64_t v31 = CXDefaultLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[CXCallSource reportAudioFinishedForCallWithUUID:reply:]();
      }

      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __72__CXCallSource_reportCallWithUUID_changedMeterLevel_forDirection_reply___block_invoke_75;
      v32[3] = &unk_1E5CAE408;
      uint64_t v33 = v11;
      __72__CXCallSource_reportCallWithUUID_changedMeterLevel_forDirection_reply___block_invoke_75((uint64_t)v32);
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
      v34[2] = __72__CXCallSource_reportCallWithUUID_changedMeterLevel_forDirection_reply___block_invoke_74;
      v34[3] = &unk_1E5CAE408;
      __int16 v35 = v11;
      __72__CXCallSource_reportCallWithUUID_changedMeterLevel_forDirection_reply___block_invoke_74((uint64_t)v34);
      uint64_t v30 = v35;
    }

    goto LABEL_15;
  }
  uint64_t v14 = CXDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[CXCallSource reportNewIncomingCallWithUUID:update:reply:](v14, v15, v16, v17, v18, v19, v20, v21);
  }

LABEL_15:
}

void __72__CXCallSource_reportCallWithUUID_changedMeterLevel_forDirection_reply___block_invoke_74(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __72__CXCallSource_reportCallWithUUID_changedMeterLevel_forDirection_reply___block_invoke_75(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)reportCallWithUUID:(id)a3 crossDeviceIdentifier:(id)a4 changedBytesOfDataUsed:(int64_t)a5
{
}

- (void)reportCallWithUUID:(id)a3 crossDeviceIdentifier:(id)a4 changedBytesOfDataUsed:(int64_t)a5 reply:(id)a6
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  double v13 = CXDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [v10 UUIDString];
    *(_DWORD *)buf = 136315906;
    id v41 = "-[CXCallSource reportCallWithUUID:crossDeviceIdentifier:changedBytesOfDataUsed:reply:]";
    __int16 v42 = 2112;
    v43 = v14;
    __int16 v44 = 2112;
    id v45 = v11;
    __int16 v46 = 2048;
    int64_t v47 = a5;
    _os_log_impl(&dword_1A6E3A000, v13, OS_LOG_TYPE_DEFAULT, "Received %s with UUID: %@ crossDeviceIdentifier: %@ bytesOfDataUsed: %ld", buf, 0x2Au);
  }
  if (!v10)
  {
    uint64_t v16 = CXDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[CXCallSource reportNewIncomingCallWithUUID:update:reply:](v16, v17, v18, v19, v20, v21, v22, v23);
    }

    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __86__CXCallSource_reportCallWithUUID_crossDeviceIdentifier_changedBytesOfDataUsed_reply___block_invoke;
    v38[3] = &unk_1E5CAE408;
    id v39 = v12;
    __86__CXCallSource_reportCallWithUUID_crossDeviceIdentifier_changedBytesOfDataUsed_reply___block_invoke((uint64_t)v38);
    uint64_t v24 = v39;
    goto LABEL_16;
  }
  if (!v11)
  {
    uint64_t v25 = CXDefaultLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[CXCallSource reportCallWithUUID:crossDeviceIdentifier:changedBytesOfDataUsed:reply:](v25, v26, v27, v28, v29, v30, v31, v32);
    }

    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __86__CXCallSource_reportCallWithUUID_crossDeviceIdentifier_changedBytesOfDataUsed_reply___block_invoke_81;
    v36[3] = &unk_1E5CAE408;
    id v37 = v12;
    __86__CXCallSource_reportCallWithUUID_crossDeviceIdentifier_changedBytesOfDataUsed_reply___block_invoke_81((uint64_t)v36);
    uint64_t v24 = v37;
    goto LABEL_16;
  }
  if (![(CXCallSource *)self isPermittedToUsePrivateAPI])
  {
    uint64_t v33 = CXDefaultLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      -[CXCallSource reportAudioFinishedForCallWithUUID:reply:]();
    }

    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __86__CXCallSource_reportCallWithUUID_crossDeviceIdentifier_changedBytesOfDataUsed_reply___block_invoke_82;
    v34[3] = &unk_1E5CAE408;
    id v35 = v12;
    __86__CXCallSource_reportCallWithUUID_crossDeviceIdentifier_changedBytesOfDataUsed_reply___block_invoke_82((uint64_t)v34);
    uint64_t v24 = v35;
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v15 = [(CXCallSource *)self delegate];
  [v15 callSource:self reportedCallWithUUID:v10 crossDeviceIdentifier:v11 changedBytesOfDataUsed:a5];

  (*((void (**)(id, void))v12 + 2))(v12, 0);
LABEL_17:
}

void __86__CXCallSource_reportCallWithUUID_crossDeviceIdentifier_changedBytesOfDataUsed_reply___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __86__CXCallSource_reportCallWithUUID_crossDeviceIdentifier_changedBytesOfDataUsed_reply___block_invoke_81(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __86__CXCallSource_reportCallWithUUID_crossDeviceIdentifier_changedBytesOfDataUsed_reply___block_invoke_82(uint64_t a1)
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
    uint64_t v31 = "-[CXCallSource requestTransaction:completionHandler:]";
    __int16 v32 = 2112;
    id v33 = v6;
    _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "Received %s with transaction: %@", buf, 0x16u);
  }

  if (v7)
  {
    if (v6)
    {
      if ([(CXCallSource *)self isPermittedToUsePrivateAPI])
      {
        id v9 = [(CXCallSource *)self delegate];
        [v9 callSource:self requestedTransaction:v6 completion:v7];
      }
      else
      {
        uint64_t v25 = CXDefaultLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[CXCallSource reportAudioFinishedForCallWithUUID:reply:]();
        }

        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __53__CXCallSource_requestTransaction_completionHandler___block_invoke_92;
        v26[3] = &unk_1E5CAE408;
        uint64_t v27 = v7;
        __53__CXCallSource_requestTransaction_completionHandler___block_invoke_92((uint64_t)v26);
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
      v28[2] = __53__CXCallSource_requestTransaction_completionHandler___block_invoke_91;
      v28[3] = &unk_1E5CAE408;
      uint64_t v29 = v7;
      __53__CXCallSource_requestTransaction_completionHandler___block_invoke_91((uint64_t)v28);
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

void __53__CXCallSource_requestTransaction_completionHandler___block_invoke_91(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __53__CXCallSource_requestTransaction_completionHandler___block_invoke_92(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_requestTransactionErrorWithCode:", 1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)actionCompleted:(id)a3 completionHandler:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = CXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v33 = "-[CXCallSource actionCompleted:completionHandler:]";
    __int16 v34 = 2112;
    id v35 = v6;
    _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "Received %s with action: %@", buf, 0x16u);
  }

  if (v7)
  {
    if (v6)
    {
      if ([(CXCallSource *)self isPermittedToUsePublicAPI])
      {
        if (![(CXCallSource *)self isPermittedToUsePrivateAPI])
        {
          uint64_t v9 = [v6 sanitizedCopy];

          id v6 = (id)v9;
        }
        uint64_t v10 = [(CXCallSource *)self delegate];
        [v10 callSource:self actionCompleted:v6];

        v7[2](v7, 0);
      }
      else
      {
        uint64_t v27 = CXDefaultLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.4();
        }

        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __50__CXCallSource_actionCompleted_completionHandler___block_invoke_99;
        v28[3] = &unk_1E5CAE408;
        uint64_t v29 = v7;
        __50__CXCallSource_actionCompleted_completionHandler___block_invoke_99((uint64_t)v28);
      }
    }
    else
    {
      uint64_t v19 = CXDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[CXCallSource actionCompleted:completionHandler:](v19, v20, v21, v22, v23, v24, v25, v26);
      }

      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __50__CXCallSource_actionCompleted_completionHandler___block_invoke_98;
      v30[3] = &unk_1E5CAE408;
      uint64_t v31 = v7;
      __50__CXCallSource_actionCompleted_completionHandler___block_invoke_98((uint64_t)v30);
      id v6 = v31;
    }
  }
  else
  {
    uint64_t v11 = CXDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CXCallSource requestTransaction:completionHandler:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
}

void __50__CXCallSource_actionCompleted_completionHandler___block_invoke_98(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __50__CXCallSource_actionCompleted_completionHandler___block_invoke_99(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "cx_errorWithCode:", 1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)commitTransaction:(id)a3
{
  id v4 = a3;
  id v5 = [(CXCallSource *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__CXCallSource_commitTransaction___block_invoke;
  v7[3] = &unk_1E5CADC68;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __34__CXCallSource_commitTransaction___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 136315394;
    id v7 = "-[CXCallSource commitTransaction:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Sending %s with transaction: %@", (uint8_t *)&v6, 0x16u);
  }

  id v4 = [*(id *)(a1 + 40) vendorProtocolDelegate];
  id v5 = (void *)[*(id *)(a1 + 32) copy];
  [v4 commitTransaction:v5];
}

- (void)handleActionTimeout:(id)a3
{
  id v4 = a3;
  id v5 = [(CXCallSource *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__CXCallSource_handleActionTimeout___block_invoke;
  v7[3] = &unk_1E5CADC68;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __36__CXCallSource_handleActionTimeout___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 136315394;
    id v7 = "-[CXCallSource handleActionTimeout:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Sending %s with action: %@", (uint8_t *)&v6, 0x16u);
  }

  id v4 = [*(id *)(a1 + 40) vendorProtocolDelegate];
  id v5 = (void *)[*(id *)(a1 + 32) copy];
  [v4 handleActionTimeout:v5];
}

- (void)handleAudioSessionActivationStateChangedTo:(id)a3
{
  id v4 = a3;
  id v5 = [(CXCallSource *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__CXCallSource_handleAudioSessionActivationStateChangedTo___block_invoke;
  v7[3] = &unk_1E5CADC68;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __59__CXCallSource_handleAudioSessionActivationStateChangedTo___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = [*(id *)(a1 + 32) BOOLValue];
    int v5 = 136315394;
    id v6 = "-[CXCallSource handleAudioSessionActivationStateChangedTo:]_block_invoke";
    __int16 v7 = 1024;
    int v8 = v3;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Sending %s with active: %d", (uint8_t *)&v5, 0x12u);
  }

  id v4 = [*(id *)(a1 + 40) vendorProtocolDelegate];
  [v4 handleAudioSessionActivationStateChangedTo:*(void *)(a1 + 32)];
}

- (CXCallSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CXCallSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)reportNewIncomingCallWithUUID:(uint64_t)a3 update:(uint64_t)a4 reply:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)reportNewIncomingCallWithUUID:(uint64_t)a3 update:(uint64_t)a4 reply:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)reportNewIncomingCallWithUUID:(uint64_t)a3 update:(uint64_t)a4 reply:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)reportNewIncomingCallWithUUID:update:reply:.cold.4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_1A6E3A000, v0, v1, "Provider source is not entitled to use public API: %@", v2, v3, v4, v5, v6);
}

- (void)reportCallWithUUID:(uint64_t)a3 receivedDTMFUpdate:(uint64_t)a4 reply:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)reportAudioFinishedForCallWithUUID:reply:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_1A6E3A000, v0, v1, "Provider source is not entitled to use private API: %@", v2, v3, v4, v5, v6);
}

- (void)reportCallWithUUID:(uint64_t)a3 crossDeviceIdentifier:(uint64_t)a4 changedBytesOfDataUsed:(uint64_t)a5 reply:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)requestTransaction:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)requestTransaction:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)actionCompleted:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end