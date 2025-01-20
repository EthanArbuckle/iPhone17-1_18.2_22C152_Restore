@interface APKRemoteInspectorPageAgent
- (APKRemoteInspectorPageAgent)initWithDispatcher:(id)a3;
- (APKRemoteInspectorPageAgentDelegate)delegate;
- (APKRemoteInspectorPageEventDispatcherProtocol)dispatcher;
- (void)disableWithErrorCallback:(id)a3 successCallback:(id)a4;
- (void)enableWithErrorCallback:(id)a3 successCallback:(id)a4;
- (void)getResourceContentWithErrorCallback:(id)a3 successCallback:(id)a4 frameId:(id)a5 url:(id)a6;
- (void)getResourceTreeWithErrorCallback:(id)a3 successCallback:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation APKRemoteInspectorPageAgent

- (APKRemoteInspectorPageAgent)initWithDispatcher:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APKRemoteInspectorPageAgent;
  v6 = [(APKRemoteInspectorPageAgent *)&v9 init];
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

- (void)getResourceTreeWithErrorCallback:(id)a3 successCallback:(id)a4
{
  id v5 = a4;
  v6 = [(APKRemoteInspectorPageAgent *)self delegate];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __80__APKRemoteInspectorPageAgent_getResourceTreeWithErrorCallback_successCallback___block_invoke;
  v8[3] = &unk_264D84EC0;
  id v9 = v5;
  id v7 = v5;
  [v6 pageAgent:self onResourcesRequestWithCompletion:v8];
}

void __80__APKRemoteInspectorPageAgent_getResourceTreeWithErrorCallback_successCallback___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263F86220];
  id v4 = a2;
  id v6 = (id)[[v3 alloc] initWithIdentifier:@"AirPlayKit.DisplayTree" loaderId:&stru_26EC86D30 url:@"airplay://index" securityOrigin:@"AirPlayKit.DisplayTree" mimeType:@"text/xml"];
  id v5 = (void *)[objc_alloc(MEMORY[0x263F86230]) initWithFrame:v6 resources:v4];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getResourceContentWithErrorCallback:(id)a3 successCallback:(id)a4 frameId:(id)a5 url:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = [(APKRemoteInspectorPageAgent *)self delegate];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __95__APKRemoteInspectorPageAgent_getResourceContentWithErrorCallback_successCallback_frameId_url___block_invoke;
  v15[3] = &unk_264D84EE8;
  id v16 = v10;
  id v17 = v9;
  id v13 = v9;
  id v14 = v10;
  [v12 pageAgent:self onResourceContentRequestWithIdentifier:v11 completion:v15];
}

void __95__APKRemoteInspectorPageAgent_getResourceContentWithErrorCallback_successCallback_frameId_url___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a2)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [a4 localizedDescription];
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

- (APKRemoteInspectorPageEventDispatcherProtocol)dispatcher
{
  return self->_dispatcher;
}

- (APKRemoteInspectorPageAgentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (APKRemoteInspectorPageAgentDelegate *)WeakRetained;
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