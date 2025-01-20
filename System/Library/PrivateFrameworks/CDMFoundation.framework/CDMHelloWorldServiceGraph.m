@interface CDMHelloWorldServiceGraph
+ (id)getAssetsForSetup:(id)a3;
+ (id)getUsageForAssetSetName:(int64_t)a3 withLocale:(id)a4;
+ (id)requiredDAGServices;
+ (int)getNLXSchemaCDMServiceGraphName;
- (Class)supportedGraphInputType;
- (void)buildGraph;
@end

@implementation CDMHelloWorldServiceGraph

+ (id)requiredDAGServices
{
  v10[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v10[0] = v4;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v10[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  v8 = [v2 setWithArray:v7];

  return v8;
}

+ (id)getAssetsForSetup:(id)a3
{
  v3 = objc_alloc_init(CDMAssetsInfo);
  return v3;
}

+ (id)getUsageForAssetSetName:(int64_t)a3 withLocale:(id)a4
{
  return 0;
}

+ (int)getNLXSchemaCDMServiceGraphName
{
  return 2;
}

- (void)buildGraph
{
  objc_initWeak(location, self);
  v3 = [(CDMServiceGraph *)self getGraphInput];
  v4 = [v3 siriNLUTypeObj];
  v5 = [(CDMServiceGraph *)self validateRequest:v4];
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__6426;
  v17[4] = __Block_byref_object_dispose__6427;
  id v18 = [v5 utterance];
  v6 = [v4 requestId];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __39__CDMHelloWorldServiceGraph_buildGraph__block_invoke;
  v16[3] = &unk_2647A5110;
  v16[4] = v17;
  v7 = [(CDMServiceGraph *)self addNodeWithName:@"doDummyTokenize" requestId:v6 block:v16];

  v8 = [v4 requestId];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __39__CDMHelloWorldServiceGraph_buildGraph__block_invoke_581;
  v14[3] = &unk_2647A5138;
  v14[4] = v17;
  objc_copyWeak(&v15, location);
  v9 = [(CDMServiceGraph *)self addNodeWithName:@"mockErrorInGraph" requestId:v8 block:v14];

  v10 = [v4 requestId];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __39__CDMHelloWorldServiceGraph_buildGraph__block_invoke_2;
  v12[3] = &unk_2647A5138;
  v12[4] = v17;
  objc_copyWeak(&v13, location);
  v11 = [(CDMServiceGraph *)self addNodeWithName:@"doDummyPostProcess" requestId:v10 block:v12];

  [v11 addDependency:v9];
  [v11 addDependency:v7];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);

  _Block_object_dispose(v17, 8);
  objc_destroyWeak(location);
}

void __39__CDMHelloWorldServiceGraph_buildGraph__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    int v4 = 136315394;
    v5 = "-[CDMHelloWorldServiceGraph buildGraph]_block_invoke";
    __int16 v6 = 2112;
    uint64_t v7 = v3;
    _os_log_impl(&dword_2263A0000, v2, OS_LOG_TYPE_INFO, "%s Dummy tokenize step as an example, utterance=%@", (uint8_t *)&v4, 0x16u);
  }
}

void __39__CDMHelloWorldServiceGraph_buildGraph__block_invoke_581(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  if ([@"hello world: COVID happened 😢" isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)])
  {
    v2 = (void *)MEMORY[0x263F087E8];
    uint64_t v6 = *MEMORY[0x263F08320];
    v7[0] = @"Testing that CDMHelloWorldServiceGraph produced error";
    uint64_t v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
    int v4 = [v2 errorWithDomain:@"mock error domain" code:23 userInfo:v3];

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained setError:v4];
  }
}

void __39__CDMHelloWorldServiceGraph_buildGraph__block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    v9 = "-[CDMHelloWorldServiceGraph buildGraph]_block_invoke_2";
    _os_log_impl(&dword_2263A0000, v2, OS_LOG_TYPE_INFO, "%s Dummy postProcess step which creates a dummy SIRINLUEXTERNALCDMNluResponse", (uint8_t *)&v8, 0xCu);
  }

  id v3 = objc_alloc_init(MEMORY[0x263F71D18]);
  [v3 setIdA:@"✋ Welcome to this dummy Hello World service graph. Have a nice day! ✅"];
  [v3 setConnectionId:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  int v4 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
  id v5 = objc_alloc_init(MEMORY[0x263F71CB0]);
  [v5 setRequestId:v3];
  [v5 setParses:v4];
  uint64_t v6 = [[CDMAssistantNLUResponse alloc] initWithNLUResponse:v5 requestId:@"✋ Welcome to this dummy Hello World service graph. Have a nice day! ✅"];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setGraphOutput:v6];
}

- (Class)supportedGraphInputType
{
  return (Class)objc_opt_class();
}

@end