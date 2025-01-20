@interface CXProviderExtensionHostContext
- (CXProviderHostProtocol)delegate;
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

@implementation CXProviderExtensionHostContext

- (id)remoteObjectProxy
{
  v4.receiver = self;
  v4.super_class = (Class)CXProviderExtensionHostContext;
  v2 = [(CXProviderExtensionContext *)&v4 remoteObjectProxy];

  return v2;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CXProviderExtensionHostContext;
  v3 = [(CXProviderExtensionContext *)&v5 remoteObjectProxyWithErrorHandler:a3];

  return v3;
}

- (void)commitTransaction:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = CXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, "Committing transaction to extension vendor: %@", (uint8_t *)&v7, 0xCu);
  }

  v6 = [(CXProviderExtensionHostContext *)self remoteObjectProxy];
  [v6 commitTransaction:v4];
}

- (void)handleActionTimeout:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = CXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, "Asking extension vendor to handle action timeout: %@", (uint8_t *)&v7, 0xCu);
  }

  v6 = [(CXProviderExtensionHostContext *)self remoteObjectProxy];
  [v6 handleActionTimeout:v4];
}

- (void)handleAudioSessionActivationStateChangedTo:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = CXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = [v4 BOOLValue];
    _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, "Asking extension vendor to handle audio session activation state change to: %d", (uint8_t *)v7, 8u);
  }

  v6 = [(CXProviderExtensionHostContext *)self remoteObjectProxy];
  [v6 handleAudioSessionActivationStateChangedTo:v4];
}

- (void)registerWithConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(CXProviderExtensionHostContext *)self delegate];
  [v5 registerWithConfiguration:v4];
}

- (void)reportNewIncomingCallWithUUID:(id)a3 update:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CXProviderExtensionHostContext *)self delegate];
  [v11 reportNewIncomingCallWithUUID:v10 update:v9 reply:v8];
}

- (void)reportCallWithUUID:(id)a3 updated:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CXProviderExtensionHostContext *)self delegate];
  [v8 reportCallWithUUID:v7 updated:v6];
}

- (void)reportCallWithUUID:(id)a3 receivedDTMFUpdate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CXProviderExtensionHostContext *)self delegate];
  [v8 reportCallWithUUID:v7 receivedDTMFUpdate:v6];
}

- (void)reportOutgoingCallWithUUID:(id)a3 sentInvitationAtDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CXProviderExtensionHostContext *)self delegate];
  [v8 reportOutgoingCallWithUUID:v7 sentInvitationAtDate:v6];
}

- (void)reportOutgoingCallWithUUID:(id)a3 startedConnectingAtDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CXProviderExtensionHostContext *)self delegate];
  [v8 reportOutgoingCallWithUUID:v7 startedConnectingAtDate:v6];
}

- (void)reportOutgoingCallWithUUID:(id)a3 connectedAtDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CXProviderExtensionHostContext *)self delegate];
  [v8 reportOutgoingCallWithUUID:v7 connectedAtDate:v6];
}

- (void)reportCallWithUUID:(id)a3 endedAtDate:(id)a4 privateReason:(int64_t)a5 failureContext:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(CXProviderExtensionHostContext *)self delegate];
  [v13 reportCallWithUUID:v12 endedAtDate:v11 privateReason:a5 failureContext:v10];
}

- (void)reportAudioFinishedForCallWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(CXProviderExtensionHostContext *)self delegate];
  [v5 reportAudioFinishedForCallWithUUID:v4];
}

- (void)reportCallWithUUID:(id)a3 changedFrequencyData:(id)a4 forDirection:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(CXProviderExtensionHostContext *)self delegate];
  [v10 reportCallWithUUID:v9 changedFrequencyData:v8 forDirection:a5];
}

- (void)reportCallWithUUID:(id)a3 changedMeterLevel:(float)a4 forDirection:(int64_t)a5
{
  id v8 = a3;
  id v10 = [(CXProviderExtensionHostContext *)self delegate];
  *(float *)&double v9 = a4;
  [v10 reportCallWithUUID:v8 changedMeterLevel:a5 forDirection:v9];
}

- (void)reportCallWithUUID:(id)a3 crossDeviceIdentifier:(id)a4 changedBytesOfDataUsed:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(CXProviderExtensionHostContext *)self delegate];
  [v10 reportCallWithUUID:v9 crossDeviceIdentifier:v8 changedBytesOfDataUsed:a5];
}

- (void)reportNewOutgoingCallWithUUID:(id)a3 update:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CXProviderExtensionHostContext *)self delegate];
  [v8 reportNewOutgoingCallWithUUID:v7 update:v6];
}

- (void)requestTransaction:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CXProviderExtensionHostContext *)self delegate];
  [v8 requestTransaction:v7 completionHandler:v6];
}

- (void)actionCompleted:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CXProviderExtensionHostContext *)self delegate];
  [v8 actionCompleted:v7 completionHandler:v6];
}

- (CXProviderHostProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CXProviderHostProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end