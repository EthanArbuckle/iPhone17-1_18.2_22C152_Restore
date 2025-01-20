@interface _DDUIRapportIncomingTransportSession
- (DDUIDevice)remoteDevice;
- (NSString)destinationID;
- (NSString)sessionID;
- (RPCompanionLinkClient)client;
- (_DDUIRapportDevice)cachedDevice;
- (_DDUIRapportIncomingTransportSession)initWithOptions:(id)a3;
- (id)messageHandler;
- (unint64_t)sessionType;
- (void)activateWithErrorHandler:(id)a3 messageHandler:(id)a4 completion:(id)a5;
- (void)generateNetworkEndpointIdentifierForRemoteDevice:(id)a3 withCompletion:(id)a4;
- (void)invalidate;
- (void)sendMessage:(id)a3 withCompletion:(id)a4;
- (void)sendMessage:(id)a3 withTimeout:(double)a4 completion:(id)a5;
- (void)setCachedDevice:(id)a3;
- (void)setClient:(id)a3;
- (void)setDestinationID:(id)a3;
- (void)setMessageHandler:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setSessionType:(unint64_t)a3;
@end

@implementation _DDUIRapportIncomingTransportSession

- (_DDUIRapportIncomingTransportSession)initWithOptions:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_DDUIRapportIncomingTransportSession;
  v5 = [(_DDUIRapportIncomingTransportSession *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F947A8]];
    destinationID = v5->_destinationID;
    v5->_destinationID = (NSString *)v6;

    if (v4)
    {
      v8 = [[_DDUIRapportDevice alloc] initWithIncomingMessageOptions:v4];
      cachedDevice = v5->_cachedDevice;
      v5->_cachedDevice = v8;

      v10 = _DDUICoreRapportLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = [(_DDUIRapportDevice *)v5->_cachedDevice name];
        v12 = [(_DDUIRapportDevice *)v5->_cachedDevice identifier];
        v13 = [(_DDUIRapportDevice *)v5->_cachedDevice model];
        v14 = [(_DDUIRapportDevice *)v5->_cachedDevice accountIdentifier];
        *(_DWORD *)buf = 138413058;
        v18 = v11;
        __int16 v19 = 2112;
        v20 = v12;
        __int16 v21 = 2112;
        v22 = v13;
        __int16 v23 = 2112;
        v24 = v14;
        _os_log_impl(&dword_1CFC71000, v10, OS_LOG_TYPE_DEFAULT, "_DDUIRapportIncomingTransportSession init. Created DDUIDevice: name: %@, identifier: %@, model: %@, accountID: %@", buf, 0x2Au);
      }
    }
  }

  return v5;
}

- (DDUIDevice)remoteDevice
{
  return (DDUIDevice *)self->_cachedDevice;
}

- (void)generateNetworkEndpointIdentifierForRemoteDevice:(id)a3 withCompletion:(id)a4
{
}

- (void)activateWithErrorHandler:(id)a3 messageHandler:(id)a4 completion:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v7 = (void (**)(id, _DDUIRapportIncomingTransportSession *))a5;
  id v8 = a4;
  v9 = _DDUICoreRapportLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134217984;
    v13 = self;
    _os_log_impl(&dword_1CFC71000, v9, OS_LOG_TYPE_DEFAULT, "_DDUIRapportIncomingTransportSession activating {self: %p}", (uint8_t *)&v12, 0xCu);
  }

  v10 = (void *)MEMORY[0x1D25DB000](v8);
  id messageHandler = self->_messageHandler;
  self->_id messageHandler = v10;

  v7[2](v7, self);
}

- (void)sendMessage:(id)a3 withCompletion:(id)a4
{
}

- (void)sendMessage:(id)a3 withTimeout:(double)a4 completion:(id)a5
{
  v41[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = [MEMORY[0x1E4F29128] UUID];
  v11 = [v10 UUIDString];

  sessionID = self->_sessionID;
  v40[0] = @"sesID";
  v40[1] = @"msgID";
  v41[0] = sessionID;
  v41[1] = v11;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
  uint64_t v14 = (void *)[v13 mutableCopy];

  if (v8) {
    [v14 setObject:v8 forKeyedSubscript:@"info"];
  }
  if (a4 <= 0.0)
  {
    objc_super v16 = 0;
  }
  else
  {
    uint64_t v38 = *MEMORY[0x1E4F947C0];
    v15 = [NSNumber numberWithDouble:a4];
    v39 = v15;
    objc_super v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
  }
  v17 = _DDUICoreRapportLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = [(_DDUIRapportIncomingTransportSession *)self sessionID];
    *(_DWORD *)buf = 134219010;
    v29 = self;
    __int16 v30 = 2112;
    v31 = v18;
    __int16 v32 = 2112;
    v33 = v11;
    __int16 v34 = 2112;
    id v35 = v8;
    __int16 v36 = 2112;
    v37 = v16;
    _os_log_impl(&dword_1CFC71000, v17, OS_LOG_TYPE_DEFAULT, "_DDUIRapportIncomingTransportSession sending message {self: %p, sessionID: %@ messageID: %@, message: %@, options: %@}", buf, 0x34u);
  }
  __int16 v19 = _DDUIRapportPairingResponderMessageID;
  if (self->_sessionType == 1) {
    __int16 v19 = _DDUIRapportContinuityCameraResponseMessageID;
  }
  v20 = *v19;
  client = self->_client;
  destinationID = self->_destinationID;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __75___DDUIRapportIncomingTransportSession_sendMessage_withTimeout_completion___block_invoke;
  v25[3] = &unk_1E685F858;
  v25[4] = self;
  id v26 = v11;
  id v27 = v9;
  id v23 = v9;
  id v24 = v11;
  [(RPCompanionLinkClient *)client sendRequestID:v20 request:v14 destinationID:destinationID options:v16 responseHandler:v25];
}

- (void)invalidate
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = _DDUICoreRapportLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    v7 = self;
    _os_log_impl(&dword_1CFC71000, v3, OS_LOG_TYPE_DEFAULT, "-[_DDUIRapportIncomingTransportSession invalidate] {self: %p}", (uint8_t *)&v6, 0xCu);
  }

  id messageHandler = self->_messageHandler;
  self->_id messageHandler = 0;

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

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (NSString)destinationID
{
  return self->_destinationID;
}

- (void)setDestinationID:(id)a3
{
}

- (id)messageHandler
{
  return self->_messageHandler;
}

- (void)setMessageHandler:(id)a3
{
}

- (unint64_t)sessionType
{
  return self->_sessionType;
}

- (void)setSessionType:(unint64_t)a3
{
  self->_sessionType = a3;
}

- (_DDUIRapportDevice)cachedDevice
{
  return self->_cachedDevice;
}

- (void)setCachedDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDevice, 0);
  objc_storeStrong(&self->_messageHandler, 0);
  objc_storeStrong((id *)&self->_destinationID, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end