@interface AXContainerManager
+ (id)sharedManager;
- (AXUIClient)containerServerClient;
- (void)deleteFileAtAccessibilityContainerPath:(id)a3 completion:(id)a4;
- (void)readDataForFileAtAccessibilityContainerPath:(id)a3 completion:(id)a4;
- (void)setContainerServerClient:(id)a3;
- (void)writeData:(id)a3 toFileAtAccessibilityContainerPath:(id)a4 completion:(id)a5;
@end

@implementation AXContainerManager

- (AXUIClient)containerServerClient
{
  containerServerClient = self->_containerServerClient;
  if (!containerServerClient)
  {
    id v4 = objc_alloc(MEMORY[0x263F22198]);
    v5 = objc_msgSend(NSString, "stringWithFormat:", @"AXContainerManager-%d", 0);
    v6 = (AXUIClient *)[v4 initWithIdentifier:v5 serviceBundleName:@"AXContainerManagerServer"];
    v7 = self->_containerServerClient;
    self->_containerServerClient = v6;

    containerServerClient = self->_containerServerClient;
  }
  return containerServerClient;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedManager_manager;
  return v2;
}

uint64_t __35__AXContainerManager_sharedManager__block_invoke()
{
  sharedManager_manager = objc_alloc_init(AXContainerManager);
  return MEMORY[0x270F9A758]();
}

- (void)readDataForFileAtAccessibilityContainerPath:(id)a3 completion:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v15 = *MEMORY[0x263F225D8];
  v16[0] = a3;
  v7 = NSDictionary;
  id v8 = a3;
  v9 = [v7 dictionaryWithObjects:v16 forKeys:&v15 count:1];
  v10 = [(AXContainerManager *)self containerServerClient];
  v11 = [MEMORY[0x263F227F8] mainAccessQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __77__AXContainerManager_readDataForFileAtAccessibilityContainerPath_completion___block_invoke;
  v13[3] = &unk_26452A0A0;
  id v14 = v6;
  id v12 = v6;
  [v10 sendAsynchronousMessage:v9 withIdentifier:1 targetAccessQueue:v11 completion:v13];
}

void __77__AXContainerManager_readDataForFileAtAccessibilityContainerPath_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  v5 = getErrorCascading(a3, v7);
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v6 = [v7 objectForKeyedSubscript:*MEMORY[0x263F225C8]];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)writeData:(id)a3 toFileAtAccessibilityContainerPath:(id)a4 completion:(id)a5
{
  v20[2] = *MEMORY[0x263EF8340];
  id v8 = a5;
  uint64_t v9 = *MEMORY[0x263F225C8];
  v19[0] = *MEMORY[0x263F225D8];
  v19[1] = v9;
  v20[0] = a4;
  v20[1] = a3;
  v10 = NSDictionary;
  id v11 = a4;
  id v12 = a3;
  v13 = [v10 dictionaryWithObjects:v20 forKeys:v19 count:2];
  id v14 = [(AXContainerManager *)self containerServerClient];
  uint64_t v15 = [MEMORY[0x263F227F8] mainAccessQueue];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __78__AXContainerManager_writeData_toFileAtAccessibilityContainerPath_completion___block_invoke;
  v17[3] = &unk_26452A0A0;
  id v18 = v8;
  id v16 = v8;
  [v14 sendAsynchronousMessage:v13 withIdentifier:2 targetAccessQueue:v15 completion:v17];
}

void __78__AXContainerManager_writeData_toFileAtAccessibilityContainerPath_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  getErrorCascading(a3, a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteFileAtAccessibilityContainerPath:(id)a3 completion:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v15 = *MEMORY[0x263F225D8];
  v16[0] = a3;
  id v7 = NSDictionary;
  id v8 = a3;
  uint64_t v9 = [v7 dictionaryWithObjects:v16 forKeys:&v15 count:1];
  v10 = [(AXContainerManager *)self containerServerClient];
  id v11 = [MEMORY[0x263F227F8] mainAccessQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __72__AXContainerManager_deleteFileAtAccessibilityContainerPath_completion___block_invoke;
  v13[3] = &unk_26452A0A0;
  id v14 = v6;
  id v12 = v6;
  [v10 sendAsynchronousMessage:v9 withIdentifier:3 targetAccessQueue:v11 completion:v13];
}

void __72__AXContainerManager_deleteFileAtAccessibilityContainerPath_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  getErrorCascading(a3, a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setContainerServerClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end