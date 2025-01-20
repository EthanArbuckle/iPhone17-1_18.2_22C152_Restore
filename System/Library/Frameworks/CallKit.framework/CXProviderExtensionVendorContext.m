@interface CXProviderExtensionVendorContext
- (CXProviderExtensionVendorContextDelegate)delegate;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (void)actionCompleted:(id)a3 completionHandler:(id)a4;
- (void)commitTransaction:(id)a3;
- (void)handleActionTimeout:(id)a3;
- (void)handleAudioSessionActivationStateChangedTo:(id)a3;
- (void)registerWithConfiguration:(id)a3;
- (void)reportAudioFinishedForCallWithUUID:(id)a3;
- (void)reportCallWithUUID:(id)a3 changedFrequencyData:(id)a4 forDirection:(int64_t)a5;
- (void)reportCallWithUUID:(id)a3 changedMeterLevel:(float)a4 forDirection:(int64_t)a5;
- (void)reportCallWithUUID:(id)a3 crossDeviceIdentifier:(id)a4 changedBytesOfDataUsed:(int64_t)a5;
- (void)reportCallWithUUID:(id)a3 endedAtDate:(id)a4 privateReason:(int64_t)a5 failureContext:(id)a6;
- (void)reportCallWithUUID:(id)a3 receivedDTMFUpdate:(id)a4;
- (void)reportCallWithUUID:(id)a3 updated:(id)a4;
- (void)reportNewIncomingCallWithUUID:(id)a3 update:(id)a4 reply:(id)a5;
- (void)reportNewOutgoingCallWithUUID:(id)a3 update:(id)a4;
- (void)reportOutgoingCallWithUUID:(id)a3 connectedAtDate:(id)a4;
- (void)reportOutgoingCallWithUUID:(id)a3 sentInvitationAtDate:(id)a4;
- (void)reportOutgoingCallWithUUID:(id)a3 startedConnectingAtDate:(id)a4;
- (void)requestTransaction:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation CXProviderExtensionVendorContext

- (id)remoteObjectProxy
{
  v4.receiver = self;
  v4.super_class = (Class)CXProviderExtensionVendorContext;
  v2 = [(CXProviderExtensionContext *)&v4 remoteObjectProxy];

  return v2;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CXProviderExtensionVendorContext;
  v3 = [(CXProviderExtensionContext *)&v5 remoteObjectProxyWithErrorHandler:a3];

  return v3;
}

- (void)registerWithConfiguration:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = CXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    v8 = "-[CXProviderExtensionVendorContext registerWithConfiguration:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, "Sending %s with configuration: %@", (uint8_t *)&v7, 0x16u);
  }

  v6 = [(CXProviderExtensionVendorContext *)self remoteObjectProxy];
  [v6 registerWithConfiguration:v4];
}

- (void)reportNewIncomingCallWithUUID:(id)a3 update:(id)a4 reply:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = CXDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [v8 UUIDString];
    int v14 = 136315650;
    v15 = "-[CXProviderExtensionVendorContext reportNewIncomingCallWithUUID:update:reply:]";
    __int16 v16 = 2112;
    v17 = v12;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl(&dword_1A6E3A000, v11, OS_LOG_TYPE_DEFAULT, "Sending %s with UUID: %@ update: %@", (uint8_t *)&v14, 0x20u);
  }
  v13 = [(CXProviderExtensionVendorContext *)self remoteObjectProxy];
  [v13 reportNewIncomingCallWithUUID:v8 update:v9 completion:v10];
}

- (void)reportCallWithUUID:(id)a3 updated:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = CXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 UUIDString];
    int v11 = 136315650;
    v12 = "-[CXProviderExtensionVendorContext reportCallWithUUID:updated:]";
    __int16 v13 = 2112;
    int v14 = v9;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "Sending %s with UUID: %@ update: %@", (uint8_t *)&v11, 0x20u);
  }
  id v10 = [(CXProviderExtensionVendorContext *)self remoteObjectProxy];
  [v10 reportCallWithUUID:v6 updated:v7];
}

- (void)reportCallWithUUID:(id)a3 receivedDTMFUpdate:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = CXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 UUIDString];
    int v11 = 136315650;
    v12 = "-[CXProviderExtensionVendorContext reportCallWithUUID:receivedDTMFUpdate:]";
    __int16 v13 = 2112;
    int v14 = v9;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "Sending %s with UUID: %@ dtmfUpdate: %@", (uint8_t *)&v11, 0x20u);
  }
  id v10 = [(CXProviderExtensionVendorContext *)self remoteObjectProxy];
  [v10 reportCallWithUUID:v6 receivedDTMFUpdate:v7];
}

- (void)reportOutgoingCallWithUUID:(id)a3 sentInvitationAtDate:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = CXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 UUIDString];
    int v11 = 136315650;
    v12 = "-[CXProviderExtensionVendorContext reportOutgoingCallWithUUID:sentInvitationAtDate:]";
    __int16 v13 = 2112;
    int v14 = v9;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "Sending %s with UUID: %@ dateSentInvitation: %@", (uint8_t *)&v11, 0x20u);
  }
  id v10 = [(CXProviderExtensionVendorContext *)self remoteObjectProxy];
  [v10 reportOutgoingCallWithUUID:v6 sentInvitationAtDate:v7];
}

- (void)reportOutgoingCallWithUUID:(id)a3 startedConnectingAtDate:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = CXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 UUIDString];
    int v11 = 136315650;
    v12 = "-[CXProviderExtensionVendorContext reportOutgoingCallWithUUID:startedConnectingAtDate:]";
    __int16 v13 = 2112;
    int v14 = v9;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "Sending %s with UUID: %@ dateStartedConnecting: %@", (uint8_t *)&v11, 0x20u);
  }
  id v10 = [(CXProviderExtensionVendorContext *)self remoteObjectProxy];
  [v10 reportOutgoingCallWithUUID:v6 startedConnectingAtDate:v7];
}

- (void)reportOutgoingCallWithUUID:(id)a3 connectedAtDate:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = CXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 UUIDString];
    int v11 = 136315650;
    v12 = "-[CXProviderExtensionVendorContext reportOutgoingCallWithUUID:connectedAtDate:]";
    __int16 v13 = 2112;
    int v14 = v9;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "Sending %s with UUID: %@ dateConnected: %@", (uint8_t *)&v11, 0x20u);
  }
  id v10 = [(CXProviderExtensionVendorContext *)self remoteObjectProxy];
  [v10 reportOutgoingCallWithUUID:v6 connectedAtDate:v7];
}

- (void)reportCallWithUUID:(id)a3 endedAtDate:(id)a4 privateReason:(int64_t)a5 failureContext:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  __int16 v13 = CXDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = [v10 UUIDString];
    int v16 = 136316162;
    uint64_t v17 = "-[CXProviderExtensionVendorContext reportCallWithUUID:endedAtDate:privateReason:failureContext:]";
    __int16 v18 = 2112;
    id v19 = v14;
    __int16 v20 = 2112;
    id v21 = v11;
    __int16 v22 = 2048;
    int64_t v23 = a5;
    __int16 v24 = 2112;
    id v25 = v12;
    _os_log_impl(&dword_1A6E3A000, v13, OS_LOG_TYPE_DEFAULT, "Sending %s with UUID: %@ dateEnded: %@ privateEndedReason: %ld failureContext: %@", (uint8_t *)&v16, 0x34u);
  }
  __int16 v15 = [(CXProviderExtensionVendorContext *)self remoteObjectProxy];
  [v15 reportCallWithUUID:v10 endedAtDate:v11 privateReason:a5 failureContext:v12];
}

- (void)reportAudioFinishedForCallWithUUID:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = CXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 UUIDString];
    int v8 = 136315394;
    id v9 = "-[CXProviderExtensionVendorContext reportAudioFinishedForCallWithUUID:]";
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, "Sending %s with UUID: %@", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [(CXProviderExtensionVendorContext *)self remoteObjectProxy];
  [v7 reportAudioFinishedForCallWithUUID:v4];
}

- (void)reportCallWithUUID:(id)a3 changedFrequencyData:(id)a4 forDirection:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(CXProviderExtensionVendorContext *)self remoteObjectProxy];
  [v10 reportCallWithUUID:v9 changedFrequencyData:v8 forDirection:a5];
}

- (void)reportCallWithUUID:(id)a3 changedMeterLevel:(float)a4 forDirection:(int64_t)a5
{
  id v8 = a3;
  id v10 = [(CXProviderExtensionVendorContext *)self remoteObjectProxy];
  *(float *)&double v9 = a4;
  [v10 reportCallWithUUID:v8 changedMeterLevel:a5 forDirection:v9];
}

- (void)reportCallWithUUID:(id)a3 crossDeviceIdentifier:(id)a4 changedBytesOfDataUsed:(int64_t)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = CXDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v8 UUIDString];
    int v13 = 136315906;
    int v14 = "-[CXProviderExtensionVendorContext reportCallWithUUID:crossDeviceIdentifier:changedBytesOfDataUsed:]";
    __int16 v15 = 2112;
    int v16 = v11;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2048;
    int64_t v20 = a5;
    _os_log_impl(&dword_1A6E3A000, v10, OS_LOG_TYPE_DEFAULT, "Sending %s with UUID: %@ crossDeviceIdentifier: %@ bytesOfDataUsed: %ld", (uint8_t *)&v13, 0x2Au);
  }
  uint64_t v12 = [(CXProviderExtensionVendorContext *)self remoteObjectProxy];
  [v12 reportCallWithUUID:v8 crossDeviceIdentifier:v9 changedBytesOfDataUsed:a5];
}

- (void)reportNewOutgoingCallWithUUID:(id)a3 update:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CXProviderExtensionVendorContext *)self remoteObjectProxy];
  [v8 reportNewOutgoingCallWithUUID:v7 update:v6];
}

- (void)requestTransaction:(id)a3 completionHandler:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = CXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    id v11 = "-[CXProviderExtensionVendorContext requestTransaction:completionHandler:]";
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "Sending %s with transaction: %@", (uint8_t *)&v10, 0x16u);
  }

  id v9 = [(CXProviderExtensionVendorContext *)self remoteObjectProxy];
  [v9 requestTransaction:v6 reply:v7];
}

- (void)actionCompleted:(id)a3 completionHandler:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = CXDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    id v9 = "-[CXProviderExtensionVendorContext actionCompleted:completionHandler:]";
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_1A6E3A000, v6, OS_LOG_TYPE_DEFAULT, "Sending %s with action: %@", (uint8_t *)&v8, 0x16u);
  }

  id v7 = [(CXProviderExtensionVendorContext *)self remoteObjectProxy];
  [v7 actionCompleted:v5];
}

- (void)commitTransaction:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = CXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "-[CXProviderExtensionVendorContext commitTransaction:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, "Received %s with transaction: %@", (uint8_t *)&v7, 0x16u);
  }

  id v6 = [(CXProviderExtensionVendorContext *)self delegate];
  [v6 providerExtensionVendorContext:self receivedCommittedTransaction:v4];
}

- (void)handleActionTimeout:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = CXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "-[CXProviderExtensionVendorContext handleActionTimeout:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, "Received %s with action: %@", (uint8_t *)&v7, 0x16u);
  }

  id v6 = [(CXProviderExtensionVendorContext *)self delegate];
  [v6 providerExtensionVendorContext:self handledActionTimeout:v4];
}

- (void)handleAudioSessionActivationStateChangedTo:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = CXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "-[CXProviderExtensionVendorContext handleAudioSessionActivationStateChangedTo:]";
    __int16 v9 = 1024;
    int v10 = [v4 BOOLValue];
    _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, "Received %s with active: %d", (uint8_t *)&v7, 0x12u);
  }

  id v6 = [(CXProviderExtensionVendorContext *)self delegate];
  objc_msgSend(v6, "providerExtensionVendorContext:handledAudioSessionActivationStateChangedTo:", self, objc_msgSend(v4, "BOOLValue"));
}

- (CXProviderExtensionVendorContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CXProviderExtensionVendorContextDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end