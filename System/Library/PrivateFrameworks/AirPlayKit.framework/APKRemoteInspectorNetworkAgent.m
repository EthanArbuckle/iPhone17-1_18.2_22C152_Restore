@interface APKRemoteInspectorNetworkAgent
- (APKRemoteInspectorNetworkAgent)initWithDispatcher:(id)a3;
- (APKRemoteInspectorNetworkAgentDelegate)delegate;
- (APKRemoteInspectorNetworkEventDispatcherProtocol)dispatcher;
- (void)disableWithErrorCallback:(id)a3 successCallback:(id)a4;
- (void)enableWithErrorCallback:(id)a3 successCallback:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation APKRemoteInspectorNetworkAgent

- (APKRemoteInspectorNetworkAgent)initWithDispatcher:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APKRemoteInspectorNetworkAgent;
  v6 = [(APKRemoteInspectorNetworkAgent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dispatcher, a3);
  }

  return v7;
}

- (void)enableWithErrorCallback:(id)a3 successCallback:(id)a4
{
}

- (void)disableWithErrorCallback:(id)a3 successCallback:(id)a4
{
}

- (APKRemoteInspectorNetworkEventDispatcherProtocol)dispatcher
{
  return self->_dispatcher;
}

- (APKRemoteInspectorNetworkAgentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (APKRemoteInspectorNetworkAgentDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dispatcher, 0);
}

@end