@interface DiagCollectionServiceImpl
- (ABCAdministrator)administrator;
- (BOOL)assertEntitlement:(id)a3 entitlement:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (DiagCollectionServiceImpl)initWithQueue:(id)a3;
- (id)diagnosticExtensionController;
- (void)collectPayloadsWithIdentifier:(id)a3 diagnosticExtensions:(id)a4 reply:(id)a5;
- (void)collectPayloadsWithIdentifier:(id)a3 diagnosticExtensionsWithParameters:(id)a4 reply:(id)a5;
- (void)setAdministrator:(id)a3;
- (void)shutdown;
@end

@implementation DiagCollectionServiceImpl

- (DiagCollectionServiceImpl)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DiagCollectionServiceImpl;
  v6 = [(DiagCollectionServiceImpl *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->queue, a3);
  }

  return v7;
}

- (void)collectPayloadsWithIdentifier:(id)a3 diagnosticExtensions:(id)a4 reply:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [MEMORY[0x263EFF9A0] dictionary];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * v15);
        v17 = [MEMORY[0x263EFF9D0] null];
        [v10 setObject:v17 forKeyedSubscript:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  [(DiagCollectionServiceImpl *)self collectPayloadsWithIdentifier:v7 diagnosticExtensionsWithParameters:v10 reply:v9];
}

- (void)collectPayloadsWithIdentifier:(id)a3 diagnosticExtensionsWithParameters:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __100__DiagCollectionServiceImpl_collectPayloadsWithIdentifier_diagnosticExtensionsWithParameters_reply___block_invoke;
  v15[3] = &unk_263FC3CE8;
  id v16 = v9;
  v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(queue, v15);
}

void __100__DiagCollectionServiceImpl_collectPayloadsWithIdentifier_diagnosticExtensionsWithParameters_reply___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = xpcLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = [*(id *)(a1 + 32) allKeys];
    *(_DWORD *)buf = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_209DBA000, v2, OS_LOG_TYPE_INFO, "DiagCollectionService: collectPayloadsForDiagnosticExtensions:%@", buf, 0xCu);
  }
  v4 = [*(id *)(a1 + 40) diagnosticExtensionController];
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __100__DiagCollectionServiceImpl_collectPayloadsWithIdentifier_diagnosticExtensionsWithParameters_reply___block_invoke_5;
  v9[3] = &unk_263FC3C20;
  id v8 = *(id *)(a1 + 56);
  v9[4] = *(void *)(a1 + 40);
  id v10 = v8;
  [v4 collectDEPayloadsWithIdentifier:v5 diagnosticExtensionsWithParameters:v6 queue:v7 reply:v9];
}

void __100__DiagCollectionServiceImpl_collectPayloadsWithIdentifier_diagnosticExtensionsWithParameters_reply___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = xpcLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v17 = 138412290;
    id v18 = v3;
    _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_INFO, "DiagCollectionService: collected DE payloads:%@", (uint8_t *)&v17, 0xCu);
  }

  if (*(void *)(a1 + 40))
  {
    uint64_t v5 = [*(id *)(a1 + 32) diagnosticExtensionController];
    id v6 = [v5 destinationRootDirectory];
    [v6 UTF8String];
    uint64_t v7 = (void *)sandbox_extension_issue_file();

    id v8 = xpcLogHandle();
    id v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v10 = [*(id *)(a1 + 32) diagnosticExtensionController];
        id v11 = [v10 destinationRootDirectory];
        int v17 = 138412290;
        id v18 = v11;
        _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_INFO, "DiagCollectionService: Issued RW sandbox extension for: %@", (uint8_t *)&v17, 0xCu);
      }
      id v12 = [NSString stringWithUTF8String:v7];
      free(v7);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = [*(id *)(a1 + 32) diagnosticExtensionController];
        id v14 = [v13 destinationRootDirectory];
        uint64_t v15 = __error();
        id v16 = strerror(*v15);
        int v17 = 138412546;
        id v18 = v14;
        __int16 v19 = 2080;
        long long v20 = v16;
        _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_ERROR, "DiagCollectionService: Failed to issue RW sandbox extension for: %@ due to error: %s", (uint8_t *)&v17, 0x16u);
      }
      id v12 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (BOOL)assertEntitlement:(id)a3 entitlement:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 valueForEntitlement:v6];
  id v8 = v7;
  if (v7 && ([v7 BOOLValue] & 1) != 0)
  {
    BOOL v9 = 1;
  }
  else
  {
    id v10 = xpcLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12[0] = 67109378;
      v12[1] = [v5 processIdentifier];
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_INFO, "DiagCollectionService: connection %d is missing entitlement %@", (uint8_t *)v12, 0x12u);
    }

    BOOL v9 = 0;
  }

  return v9;
}

- (void)shutdown
{
  self->deController = 0;
  MEMORY[0x270F9A758]();
}

- (id)diagnosticExtensionController
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  deController = self->deController;
  if (!deController)
  {
    v4 = NSTemporaryDirectory();
    id v5 = xpcLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEBUG, "DiagCollectionService: creating DiagnosticExtensionsController with destination %@", (uint8_t *)&v9, 0xCu);
    }

    id v6 = [[DiagnosticExtensionController alloc] initWithDestinationDirectory:v4];
    uint64_t v7 = self->deController;
    self->deController = v6;

    deController = self->deController;
  }

  return deController;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a4;
  BOOL v6 = [(DiagCollectionServiceImpl *)self assertEntitlement:v5 entitlement:@"com.apple.symptom_diagnostics.collect"];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26BE07D18];
    [v5 setExportedInterface:v7];

    [v5 setExportedObject:self];
    id v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    __int16 v13 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0);
    id v14 = [v5 exportedInterface];
    [v14 setClasses:v13 forSelector:sel_collectPayloadsWithIdentifier_diagnosticExtensions_reply_ argumentIndex:0 ofReply:1];

    [v5 resume];
  }
  else
  {
    __int16 v13 = xpcLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v5;
      _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_ERROR, "DiagCollectionService: connection (%@) lacks proper entitlements", buf, 0xCu);
    }
  }

  return v6;
}

- (ABCAdministrator)administrator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_administrator);

  return (ABCAdministrator *)WeakRetained;
}

- (void)setAdministrator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_administrator);
  objc_storeStrong((id *)&self->deController, 0);

  objc_storeStrong((id *)&self->queue, 0);
}

@end