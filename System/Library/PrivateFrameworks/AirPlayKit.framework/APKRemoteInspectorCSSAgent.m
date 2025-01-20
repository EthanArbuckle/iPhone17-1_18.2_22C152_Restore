@interface APKRemoteInspectorCSSAgent
- (APKRemoteInspectorCSSAgent)initWithDispatcher:(id)a3;
- (APKRemoteInspectorCSSAgentDelegate)delegate;
- (APKRemoteInspectorCSSEventDispatcherProtocol)dispatcher;
- (void)disableWithErrorCallback:(id)a3 successCallback:(id)a4;
- (void)enableWithErrorCallback:(id)a3 successCallback:(id)a4;
- (void)getComputedStyleForNodeWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5;
- (void)getInlineStylesForNodeWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5;
- (void)setDelegate:(id)a3;
@end

@implementation APKRemoteInspectorCSSAgent

- (APKRemoteInspectorCSSAgent)initWithDispatcher:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APKRemoteInspectorCSSAgent;
  v6 = [(APKRemoteInspectorCSSAgent *)&v9 init];
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

- (void)getInlineStylesForNodeWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  v10 = [(APKRemoteInspectorCSSAgent *)self delegate];

  if (v10)
  {
    v11 = [(APKRemoteInspectorCSSAgent *)self delegate];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __93__APKRemoteInspectorCSSAgent_getInlineStylesForNodeWithErrorCallback_successCallback_nodeId___block_invoke;
    v12[3] = &unk_264D84DD8;
    id v13 = v9;
    id v14 = v8;
    [v11 CSSAgent:self onInlineStylesRequestWithIdentifier:v5 completion:v12];
  }
  else
  {
    (*((void (**)(id, __CFString *))v8 + 2))(v8, @"Not supported");
  }
}

void __93__APKRemoteInspectorCSSAgent_getInlineStylesForNodeWithErrorCallback_successCallback_nodeId___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (v5)
  {
    v6 = v5;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v7 = v6;
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [a3 localizedDescription];
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v9);
  }
}

- (void)getComputedStyleForNodeWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  v10 = [(APKRemoteInspectorCSSAgent *)self delegate];

  if (v10)
  {
    v11 = [(APKRemoteInspectorCSSAgent *)self delegate];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __94__APKRemoteInspectorCSSAgent_getComputedStyleForNodeWithErrorCallback_successCallback_nodeId___block_invoke;
    v12[3] = &unk_264D84E00;
    id v13 = v9;
    id v14 = v8;
    [v11 CSSAgent:self onComputedStylesRequestWithIdentifier:v5 completion:v12];
  }
  else
  {
    (*((void (**)(id, __CFString *))v8 + 2))(v8, @"Not supported");
  }
}

void __94__APKRemoteInspectorCSSAgent_getComputedStyleForNodeWithErrorCallback_successCallback_nodeId___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = [a3 localizedDescription];
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

- (APKRemoteInspectorCSSEventDispatcherProtocol)dispatcher
{
  return self->_dispatcher;
}

- (APKRemoteInspectorCSSAgentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (APKRemoteInspectorCSSAgentDelegate *)WeakRetained;
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