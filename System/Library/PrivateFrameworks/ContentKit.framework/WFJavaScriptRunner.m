@interface WFJavaScriptRunner
- (NSItemProvider)itemProvider;
- (WFJavaScriptRunner)initWithItemProvider:(id)a3;
- (void)runJavaScript:(id)a3 completionHandler:(id)a4;
@end

@implementation WFJavaScriptRunner

- (void).cxx_destruct
{
}

- (NSItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void)runJavaScript:(id)a3 completionHandler:(id)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v17 = a3;
  v18 = @"extraArguments";
  v16 = @"WFJavaScriptToRun";
  v7 = NSDictionary;
  id v8 = a3;
  v9 = [v7 dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  v19[0] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];

  v11 = [(WFJavaScriptRunner *)self itemProvider];
  v12 = [(id)*MEMORY[0x263F1DC40] identifier];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __54__WFJavaScriptRunner_runJavaScript_completionHandler___block_invoke;
  v14[3] = &unk_264288E98;
  id v15 = v6;
  id v13 = v6;
  [v11 loadItemForTypeIdentifier:v12 options:v10 completionHandler:v14];
}

void __54__WFJavaScriptRunner_runJavaScript_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    id v6 = WFEnforceClass(v10, v5);
    v7 = [v6 objectForKey:*MEMORY[0x263F07FF0]];
    uint64_t v8 = objc_opt_class();
    v9 = WFEnforceClass(v7, v8);

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (WFJavaScriptRunner)initWithItemProvider:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFJavaScriptRunner.m", 51, @"Invalid parameter not satisfying: %@", @"itemProvider" object file lineNumber description];
  }
  v7 = WFJavaScriptRunnerHostProtocolXPCInterface();
  v12.receiver = self;
  v12.super_class = (Class)WFJavaScriptRunner;
  uint64_t v8 = [(WFSingleConnectionXPCListener *)&v12 initWithExportedObject:self exportedInterface:v7];

  if (v8)
  {
    objc_storeStrong((id *)&v8->_itemProvider, a3);
    v9 = v8;
  }

  return v8;
}

@end