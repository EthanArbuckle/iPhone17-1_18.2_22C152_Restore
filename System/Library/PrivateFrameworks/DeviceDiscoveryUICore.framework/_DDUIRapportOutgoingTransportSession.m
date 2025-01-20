@interface _DDUIRapportOutgoingTransportSession
- (DDUIDevice)remoteDevice;
- (NSString)serviceIdentifier;
- (NSString)sessionID;
- (RPCompanionLinkClient)client;
- (_DDUIRapportOutgoingTransportSession)initWithServiceIdentifier:(id)a3;
- (id)messageHandler;
- (void)activateWithErrorHandler:(id)a3 messageHandler:(id)a4 completion:(id)a5;
- (void)generateNetworkEndpointIdentifierForRemoteDevice:(id)a3 withCompletion:(id)a4;
- (void)handleIncomingMessage:(id)a3 withMessageID:(id)a4;
- (void)invalidate;
- (void)sendMessage:(id)a3 withCompletion:(id)a4;
- (void)sendMessage:(id)a3 withTimeout:(double)a4 completion:(id)a5;
- (void)setClient:(id)a3;
- (void)setMessageHandler:(id)a3;
- (void)setServiceIdentifier:(id)a3;
- (void)setSessionID:(id)a3;
@end

@implementation _DDUIRapportOutgoingTransportSession

- (_DDUIRapportOutgoingTransportSession)initWithServiceIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_DDUIRapportOutgoingTransportSession;
  v6 = [(_DDUIRapportOutgoingTransportSession *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serviceIdentifier, a3);
    v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [v8 UUIDString];
    sessionID = v7->_sessionID;
    v7->_sessionID = (NSString *)v9;

    v11 = _DDUICoreRapportLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v7->_sessionID;
      *(_DWORD *)buf = 134218242;
      v16 = v7;
      __int16 v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_1CFC71000, v11, OS_LOG_TYPE_DEFAULT, "-[_DDUIRapportOutgoingTransportSession init] {self: %p, sessionID: %@}", buf, 0x16u);
    }
  }
  return v7;
}

- (DDUIDevice)remoteDevice
{
  v3 = [_DDUIRapportDevice alloc];
  v4 = [(RPCompanionLinkClient *)self->_client destinationDevice];
  id v5 = [(_DDUIRapportDevice *)v3 initWithRPCompanionLinkDevice:v4];

  return (DDUIDevice *)v5;
}

- (void)generateNetworkEndpointIdentifierForRemoteDevice:(id)a3 withCompletion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = _DDUICoreRapportLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v18 = self;
    _os_log_impl(&dword_1CFC71000, v8, OS_LOG_TYPE_DEFAULT, "_DDUIRapportOutgoingTransportSession generating mapping {self: %p}", buf, 0xCu);
  }

  id v9 = objc_alloc_init(MEMORY[0x1E4F946C8]);
  v10 = [(_DDUIRapportOutgoingTransportSession *)self serviceIdentifier];
  v11 = [(_DDUIRapportOutgoingTransportSession *)self client];
  v12 = [v11 destinationDevice];
  v13 = [v12 identifier];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __104___DDUIRapportOutgoingTransportSession_generateNetworkEndpointIdentifierForRemoteDevice_withCompletion___block_invoke;
  v15[3] = &unk_1E685FD58;
  v15[4] = self;
  id v16 = v6;
  id v14 = v6;
  [v9 createEndpointToDeviceMapping:v10 deviceID:v13 endpointID:v7 completion:v15];
}

- (void)handleIncomingMessage:(id)a3 withMessageID:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = _DDUICoreRapportLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218498;
    v11 = self;
    __int16 v12 = 2112;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_1CFC71000, v8, OS_LOG_TYPE_DEFAULT, "_DDUIRapportOutgoingTransportSession - incoming ResponderMessage {self: %p, messageID: %@, message: %@}", (uint8_t *)&v10, 0x20u);
  }

  id v9 = [(_DDUIRapportOutgoingTransportSession *)self messageHandler];
  ((void (**)(void, id))v9)[2](v9, v6);
}

- (void)activateWithErrorHandler:(id)a3 messageHandler:(id)a4 completion:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = _DDUICoreRapportLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v12 = (void *)MEMORY[0x1D25DB000](v8);
    id v13 = (void *)MEMORY[0x1D25DB000](v9);
    __int16 v14 = (void *)MEMORY[0x1D25DB000](v10);
    *(_DWORD *)buf = 134218754;
    *(void *)&uint8_t buf[4] = self;
    __int16 v32 = 2112;
    v33 = v12;
    __int16 v34 = 2112;
    v35 = v13;
    __int16 v36 = 2112;
    v37 = v14;
    _os_log_impl(&dword_1CFC71000, v11, OS_LOG_TYPE_DEFAULT, "_DDUIRapportOutgoingTransportSession activating {self: %p, errorHandler: %@, messageHandler: %@, completion: %@}", buf, 0x2Au);
  }
  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  id v15 = (void *)MEMORY[0x1D25DB000](v9);
  id messageHandler = self->_messageHandler;
  self->_id messageHandler = v15;

  client = self->_client;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __91___DDUIRapportOutgoingTransportSession_activateWithErrorHandler_messageHandler_completion___block_invoke;
  v28[3] = &unk_1E685FD80;
  objc_copyWeak(&v30, (id *)buf);
  id v18 = v8;
  id v29 = v18;
  [(RPCompanionLinkClient *)client setDisconnectHandler:v28];
  uint64_t v19 = self->_client;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __91___DDUIRapportOutgoingTransportSession_activateWithErrorHandler_messageHandler_completion___block_invoke_4;
  v25[3] = &unk_1E685FD80;
  objc_copyWeak(&v27, (id *)buf);
  id v20 = v18;
  id v26 = v20;
  [(RPCompanionLinkClient *)v19 setInterruptionHandler:v25];
  v21 = self->_client;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __91___DDUIRapportOutgoingTransportSession_activateWithErrorHandler_messageHandler_completion___block_invoke_5;
  v23[3] = &unk_1E685F958;
  v23[4] = self;
  id v22 = v10;
  id v24 = v22;
  [(RPCompanionLinkClient *)v21 activateWithCompletion:v23];

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);
}

- (void)sendMessage:(id)a3 withTimeout:(double)a4 completion:(id)a5
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F29128] UUID];
  v11 = [v10 UUIDString];

  sessionID = self->_sessionID;
  v37[0] = @"sesID";
  v37[1] = @"msgID";
  v38[0] = sessionID;
  v38[1] = v11;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
  __int16 v14 = (void *)[v13 mutableCopy];

  if (v8) {
    [v14 setObject:v8 forKeyedSubscript:@"info"];
  }
  if (a4 <= 0.0)
  {
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v35 = *MEMORY[0x1E4F947C0];
    id v15 = [NSNumber numberWithDouble:a4];
    __int16 v36 = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
  }
  __int16 v17 = _DDUICoreRapportLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = self->_sessionID;
    *(_DWORD *)buf = 134219010;
    id v26 = self;
    __int16 v27 = 2112;
    v28 = v18;
    __int16 v29 = 2112;
    id v30 = v11;
    __int16 v31 = 2112;
    id v32 = v8;
    __int16 v33 = 2112;
    __int16 v34 = v16;
    _os_log_impl(&dword_1CFC71000, v17, OS_LOG_TYPE_DEFAULT, "_DDUIRapportOutgoingTransportSession sending message {self: %p, sessionID: %@, messageID: %@, message: %@, options: %@}", buf, 0x34u);
  }

  client = self->_client;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __75___DDUIRapportOutgoingTransportSession_sendMessage_withTimeout_completion___block_invoke;
  v22[3] = &unk_1E685F858;
  v22[4] = self;
  id v23 = v11;
  id v24 = v9;
  id v20 = v9;
  id v21 = v11;
  [(RPCompanionLinkClient *)client sendRequestID:@"DDUI-pair-init" request:v14 options:v16 responseHandler:v22];
}

- (void)sendMessage:(id)a3 withCompletion:(id)a4
{
}

- (void)invalidate
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = _DDUICoreRapportLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    id v6 = self;
    _os_log_impl(&dword_1CFC71000, v3, OS_LOG_TYPE_DEFAULT, "-[_DDUIRapportOutgoingTransportSession invalidate] {self: %p}", (uint8_t *)&v5, 0xCu);
  }

  [(RPCompanionLinkClient *)self->_client invalidate];
  client = self->_client;
  self->_client = 0;
}

- (RPCompanionLinkClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (id)messageHandler
{
  return self->_messageHandler;
}

- (void)setMessageHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_messageHandler, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end