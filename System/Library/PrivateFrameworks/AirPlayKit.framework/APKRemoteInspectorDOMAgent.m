@interface APKRemoteInspectorDOMAgent
- (APKRemoteInspectorDOMAgent)initWithDispatcher:(id)a3;
- (APKRemoteInspectorDOMAgentDelegate)delegate;
- (APKRemoteInspectorDOMEventDispatcherProtocol)dispatcher;
- (void)getAttributesWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5;
- (void)getDocumentWithErrorCallback:(id)a3 successCallback:(id)a4;
- (void)getOuterHTMLWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5;
- (void)requestChildNodesWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5 depth:(int *)a6;
- (void)setDelegate:(id)a3;
@end

@implementation APKRemoteInspectorDOMAgent

- (APKRemoteInspectorDOMAgent)initWithDispatcher:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APKRemoteInspectorDOMAgent;
  v6 = [(APKRemoteInspectorDOMAgent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dispatcher, a3);
  }

  return v7;
}

- (void)getDocumentWithErrorCallback:(id)a3 successCallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(APKRemoteInspectorDOMAgent *)self delegate];

  if (v8)
  {
    objc_super v9 = [(APKRemoteInspectorDOMAgent *)self delegate];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __75__APKRemoteInspectorDOMAgent_getDocumentWithErrorCallback_successCallback___block_invoke;
    v10[3] = &unk_264D84E48;
    id v11 = v7;
    id v12 = v6;
    [v9 DOMAgent:self onDocumentWithCompletion:v10];
  }
  else
  {
    (*((void (**)(id, __CFString *))v6 + 2))(v6, @"Not supported");
  }
}

void __75__APKRemoteInspectorDOMAgent_getDocumentWithErrorCallback_successCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = v5;
  if (v5)
  {
    [v5 setFrameId:@"AirPlayKit.DisplayTree"];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = [a3 localizedDescription];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
}

- (void)getOuterHTMLWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  v10 = [(APKRemoteInspectorDOMAgent *)self delegate];

  if (v10)
  {
    id v11 = [(APKRemoteInspectorDOMAgent *)self delegate];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __83__APKRemoteInspectorDOMAgent_getOuterHTMLWithErrorCallback_successCallback_nodeId___block_invoke;
    v12[3] = &unk_264D84E70;
    id v13 = v9;
    id v14 = v8;
    [v11 DOMAgent:self onOuterHTMLRequestWithIdentifier:v5 completion:v12];
  }
  else
  {
    (*((void (**)(id, __CFString *))v8 + 2))(v8, @"Not supported");
  }
}

void __83__APKRemoteInspectorDOMAgent_getOuterHTMLWithErrorCallback_successCallback_nodeId___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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

- (void)getAttributesWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  v10 = [(APKRemoteInspectorDOMAgent *)self delegate];

  if (v10)
  {
    id v11 = [(APKRemoteInspectorDOMAgent *)self delegate];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __84__APKRemoteInspectorDOMAgent_getAttributesWithErrorCallback_successCallback_nodeId___block_invoke;
    v12[3] = &unk_264D84E00;
    id v13 = v9;
    id v14 = v8;
    [v11 DOMAgent:self onAttributesRequestWithIdentifier:v5 completion:v12];
  }
  else
  {
    (*((void (**)(id, __CFString *))v8 + 2))(v8, @"Not supported");
  }
}

void __84__APKRemoteInspectorDOMAgent_getAttributesWithErrorCallback_successCallback_nodeId___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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

- (void)requestChildNodesWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5 depth:(int *)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = [(APKRemoteInspectorDOMAgent *)self delegate];

  if (v12)
  {
    if (a6) {
      uint64_t v13 = *a6;
    }
    else {
      uint64_t v13 = 3;
    }
    objc_initWeak(&location, self);
    id v14 = [(APKRemoteInspectorDOMAgent *)self delegate];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __94__APKRemoteInspectorDOMAgent_requestChildNodesWithErrorCallback_successCallback_nodeId_depth___block_invoke;
    v15[3] = &unk_264D84E98;
    objc_copyWeak(&v18, &location);
    int v19 = v7;
    id v16 = v11;
    id v17 = v10;
    [v14 DOMAgent:self onChildNodeRequestWithParentIdentifier:v7 depth:v13 completion:v15];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, __CFString *))v10 + 2))(v10, @"Not supported");
  }
}

void __94__APKRemoteInspectorDOMAgent_requestChildNodesWithErrorCallback_successCallback_nodeId_depth___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v6 = [WeakRetained dispatcher];
    [v6 setChildNodesWithParentId:*(unsigned int *)(a1 + 56) nodes:v9];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = [a3 localizedDescription];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
}

- (APKRemoteInspectorDOMEventDispatcherProtocol)dispatcher
{
  return self->_dispatcher;
}

- (APKRemoteInspectorDOMAgentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (APKRemoteInspectorDOMAgentDelegate *)WeakRetained;
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