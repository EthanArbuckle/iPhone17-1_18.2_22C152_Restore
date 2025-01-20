@interface WFJavaScriptRunClient
- (NSXPCListenerEndpoint)endpoint;
- (WFJavaScriptRunClient)initWithEndpoint:(id)a3;
- (void)runJavaScript:(id)a3 completionHandler:(id)a4;
@end

@implementation WFJavaScriptRunClient

- (void).cxx_destruct
{
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)runJavaScript:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v7 = (objc_class *)MEMORY[0x263F08D68];
  id v8 = a3;
  id v9 = [v7 alloc];
  v10 = [(WFJavaScriptRunClient *)self endpoint];
  v11 = (void *)[v9 initWithListenerEndpoint:v10];

  v12 = WFJavaScriptRunnerHostProtocolXPCInterface();
  [v11 setRemoteObjectInterface:v12];

  [v11 resume];
  v13 = [v11 remoteObjectProxy];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __57__WFJavaScriptRunClient_runJavaScript_completionHandler___block_invoke;
  v16[3] = &unk_264288EC0;
  id v17 = v11;
  id v18 = v6;
  id v14 = v6;
  id v15 = v11;
  [v13 runJavaScript:v8 completionHandler:v16];
}

void __57__WFJavaScriptRunClient_runJavaScript_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (WFJavaScriptRunClient)initWithEndpoint:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFJavaScriptRunner.m", 87, @"Invalid parameter not satisfying: %@", @"endpoint" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFJavaScriptRunClient;
  id v7 = [(WFJavaScriptRunClient *)&v12 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_endpoint, a3);
    id v9 = v8;
  }

  return v8;
}

@end