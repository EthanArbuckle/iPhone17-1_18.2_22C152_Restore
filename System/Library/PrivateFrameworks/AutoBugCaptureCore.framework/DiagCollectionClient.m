@interface DiagCollectionClient
- (DiagCollectionClient)init;
- (DiagCollectionClient)initWithDestinationDirectory:(id)a3;
- (id)setupXPCInterface;
- (unsigned)currentLoginUserID;
- (void)collectDEPayloadsWithIdentifier:(id)a3 diagnosticExtensionsWithParameters:(id)a4 queue:(id)a5 reply:(id)a6;
- (void)moveDiagnosticFilesToDestination:(id)a3 reply:(id)a4;
@end

@implementation DiagCollectionClient

- (DiagCollectionClient)init
{
  v3 = NSTemporaryDirectory();
  v4 = [(DiagCollectionClient *)self initWithDestinationDirectory:v3];

  return v4;
}

- (DiagCollectionClient)initWithDestinationDirectory:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DiagCollectionClient;
  v6 = [(DiagCollectionClient *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->destinationDirectory, a3);
    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.autobugcapture.diagcollectionclient.queue", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;
  }
  return v7;
}

- (id)setupXPCInterface
{
  uint64_t v2 = [(DiagCollectionClient *)self currentLoginUserID];
  if (v2)
  {
    uint64_t v3 = v2;
    v4 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.symptom_diagnostics_collection" options:0];
    id v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26BE07D18];
    [v4 setRemoteObjectInterface:v5];

    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    objc_super v12 = [v4 remoteObjectInterface];
    [v12 setClasses:v11 forSelector:sel_collectPayloadsWithIdentifier_diagnosticExtensions_reply_ argumentIndex:0 ofReply:1];

    [v4 setInvalidationHandler:&__block_literal_global_7];
    [v4 setInterruptionHandler:&__block_literal_global_65];
    [v4 _setTargetUserIdentifier:v3];
    [v4 resume];
    v13 = diagcollectLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_DEFAULT, "DiagCollectionClient: XPC interface ready.", buf, 2u);
    }
  }
  else
  {
    v11 = diagcollectLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_ERROR, "DiagCollectionClient: Could not ready the XPC interface (missing target user id)", v15, 2u);
    }
    v4 = 0;
  }

  return v4;
}

void __41__DiagCollectionClient_setupXPCInterface__block_invoke()
{
  v0 = diagcollectLogHandle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_209DBA000, v0, OS_LOG_TYPE_INFO, "DiagCollectionClient: Connection invalidated.", v1, 2u);
  }
}

void __41__DiagCollectionClient_setupXPCInterface__block_invoke_63()
{
  v0 = diagcollectLogHandle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_209DBA000, v0, OS_LOG_TYPE_INFO, "DiagCollectionClient: Connection interrupted.", v1, 2u);
  }
}

- (unsigned)currentLoginUserID
{
  return 0;
}

- (void)moveDiagnosticFilesToDestination:(id)a3 reply:(id)a4
{
  v6 = (void (**)(id, id))a4;
  uint64_t v7 = (void *)MEMORY[0x263F08850];
  id v8 = a3;
  uint64_t v9 = [v7 defaultManager];
  uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __63__DiagCollectionClient_moveDiagnosticFilesToDestination_reply___block_invoke;
  v15[3] = &unk_263FC3948;
  v15[4] = self;
  id v16 = v9;
  id v11 = v10;
  id v17 = v11;
  id v12 = v9;
  [v8 enumerateKeysAndObjectsUsingBlock:v15];

  v13 = diagcollectLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_DEBUG, "DiagCollectionClient: Finished moving all DiagnosticExtension files", v14, 2u);
  }

  if (v6) {
    v6[2](v6, v11);
  }
}

void __63__DiagCollectionClient_moveDiagnosticFilesToDestination_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = diagcollectLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v5;
    _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_INFO, "DiagCollectionClient: Processing files for %@", buf, 0xCu);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [MEMORY[0x263EFF980] array];
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    v18 = __63__DiagCollectionClient_moveDiagnosticFilesToDestination_reply___block_invoke_69;
    v19 = &unk_263FC3920;
    id v9 = v5;
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(a1 + 40);
    id v20 = v9;
    uint64_t v21 = v10;
    id v22 = v11;
    id v23 = v8;
    id v12 = v8;
    [v6 enumerateObjectsUsingBlock:&v16];
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v12, v9, v16, v17, v18, v19);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [*(id *)(a1 + 48) setObject:v6 forKeyedSubscript:v5];
    }
    else
    {
      v13 = diagcollectLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = (objc_class *)objc_opt_class();
        v15 = NSStringFromClass(v14);
        *(_DWORD *)buf = 138412546;
        id v25 = v15;
        __int16 v26 = 2112;
        id v27 = v6;
        _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_ERROR, "DiagCollectionClient: Found unexpected object %@ with value %@ in DE filepaths dictionary (expected NSArray)", buf, 0x16u);
      }
    }
  }
}

void __63__DiagCollectionClient_moveDiagnosticFilesToDestination_reply___block_invoke_69(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 lastPathComponent];
    if (([v4 containsString:*(void *)(a1 + 32)] & 1) == 0)
    {
      id v5 = diagcollectLogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = *(NSObject **)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v17 = v4;
        __int16 v18 = 2112;
        v19 = v6;
        _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEFAULT, "DiagCollectionClient: WARNING - File %@ does not contain this DiagnosticExtention's identifier (%@) in the filename", buf, 0x16u);
      }
    }
    uint64_t v7 = [*(id *)(*(void *)(a1 + 40) + 16) stringByAppendingPathComponent:v4];
    id v8 = *(void **)(a1 + 48);
    id v15 = 0;
    int v9 = [v8 moveItemAtPath:v3 toPath:v7 error:&v15];
    id v10 = v15;
    id v11 = diagcollectLogHandle();
    id v12 = v11;
    if (v9)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v17 = v3;
        __int16 v18 = 2112;
        v19 = v7;
        _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_INFO, "DiagCollectionClient: Moved file from %@ to %@", buf, 0x16u);
      }

      [*(id *)(a1 + 56) addObject:v7];
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v17 = v3;
        __int16 v18 = 2112;
        v19 = v7;
        __int16 v20 = 2112;
        id v21 = v10;
        _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_ERROR, "DiagCollectionClient: Unable to move file at %@ to %@ (%@)", buf, 0x20u);
      }
    }
  }
  else
  {
    v4 = diagcollectLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = v14;
      __int16 v18 = 2112;
      v19 = v3;
      _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_ERROR, "DiagCollectionClient: Found unexpected object %@ with value %@ in DE filepaths array (expected NSString)", buf, 0x16u);
    }
  }
}

- (void)collectDEPayloadsWithIdentifier:(id)a3 diagnosticExtensionsWithParameters:(id)a4 queue:(id)a5 reply:(id)a6
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    if ([v10 length])
    {
      v14 = [(DiagCollectionClient *)self setupXPCInterface];
      id v15 = v14;
      if (v14)
      {
        *(void *)v47 = 0;
        v48 = v47;
        uint64_t v49 = 0x2020000000;
        char v50 = 0;
        uint64_t v16 = [v14 _queue];
        dispatch_source_t v17 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v16);

        v42[0] = MEMORY[0x263EF8330];
        v42[1] = 3221225472;
        v42[2] = __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_2;
        v42[3] = &unk_263FC3998;
        __int16 v18 = v17;
        v43 = v18;
        v46 = v47;
        v19 = v12;
        v44 = v19;
        id v20 = v13;
        id v45 = v20;
        uint64_t v28 = [v15 remoteObjectProxyWithErrorHandler:v42];
        if (v28)
        {
          id v21 = diagcollectLogHandle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            int v54 = 600;
            _os_log_impl(&dword_209DBA000, v21, OS_LOG_TYPE_INFO, "DiagCollectionClient: calling remote service (collectPayloadsWithIdentifier:diagnosticExtensionsWithParameters:) with timeout = %d", buf, 8u);
          }

          if (v18)
          {
            dispatch_time_t v22 = dispatch_time(0, 600000000000);
            dispatch_source_set_timer(v18, v22, 0xFFFFFFFFFFFFFFFFLL, 0);
            handler[0] = MEMORY[0x263EF8330];
            handler[1] = 3221225472;
            handler[2] = __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_75;
            handler[3] = &unk_263FC39C0;
            v41 = v47;
            v39 = v19;
            id v40 = v20;
            dispatch_source_set_event_handler(v18, handler);
            id v23 = diagcollectLogHandle();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_209DBA000, v23, OS_LOG_TYPE_DEBUG, "DiagCollectionClient: Starting safeguard timer", buf, 2u);
            }

            dispatch_resume(v18);
            v24 = v39;
          }
          else
          {
            v24 = diagcollectLogHandle();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_209DBA000, v24, OS_LOG_TYPE_DEFAULT, "DiagCollectionClient: Failed to create a safeguard timer.", buf, 2u);
            }
          }

          v33[0] = MEMORY[0x263EF8330];
          v33[1] = 3221225472;
          v33[2] = __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_77;
          v33[3] = &unk_263FC3A10;
          v37 = v47;
          v34[0] = v18;
          v34[1] = self;
          v35 = v19;
          id v36 = v20;
          [v28 collectPayloadsWithIdentifier:v10 diagnosticExtensionsWithParameters:v11 reply:v33];

          id v27 = (id *)v34;
        }
        else
        {
          __int16 v26 = diagcollectLogHandle();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_209DBA000, v26, OS_LOG_TYPE_INFO, "DiagCollectionClient: remote service not initialized", buf, 2u);
          }

          v31[0] = MEMORY[0x263EF8330];
          v31[1] = 3221225472;
          v31[2] = __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_82;
          v31[3] = &unk_263FC3970;
          id v27 = &v32;
          id v32 = v20;
          dispatch_async(v19, v31);
        }

        _Block_object_dispose(v47, 8);
      }
      else
      {
        id v25 = diagcollectLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v47 = 0;
          _os_log_impl(&dword_209DBA000, v25, OS_LOG_TYPE_ERROR, "DiagCollectionClient: Unable to establish XPC connection to DiagnosticExtension collection service", v47, 2u);
        }

        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_83;
        v29[3] = &unk_263FC3970;
        id v30 = v13;
        dispatch_async(v12, v29);
      }
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke;
      block[3] = &unk_263FC3970;
      id v52 = v13;
      dispatch_async(v12, block);
      id v15 = v52;
    }
  }
}

void __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:45 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = diagcollectLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [v3 description];
    *(_DWORD *)buf = 136315138;
    uint64_t v14 = [v5 UTF8String];
    _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_INFO, "DiagCollectionClient: remote object proxy error %s", buf, 0xCu);
  }
  id v6 = *(NSObject **)(a1 + 32);
  if (v6) {
    dispatch_source_cancel(v6);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_73;
  v10[3] = &unk_263FC2E88;
  uint64_t v7 = *(NSObject **)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v11 = v3;
  id v12 = v8;
  id v9 = v3;
  dispatch_async(v7, v10);
}

uint64_t __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_73(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_75(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v2 = diagcollectLogHandle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v2, OS_LOG_TYPE_ERROR, "DiagCollectionClient: calling remote service (collectPayloadsWithIdentifier:diagnosticExtensionsWithParameters:) timedout", buf, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_76;
    block[3] = &unk_263FC3970;
    id v3 = *(NSObject **)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    dispatch_async(v3, block);
  }
}

void __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_76(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:60 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_77(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(NSObject **)(a1 + 32);
  if (v10) {
    dispatch_source_cancel(v10);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  if (!v9)
  {
    if (v8)
    {
      [v8 UTF8String];
      uint64_t v11 = sandbox_extension_consume();
      if (v11 != -1)
      {
LABEL_12:
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_78;
        v20[3] = &unk_263FC39E8;
        __int16 v18 = *(void **)(a1 + 40);
        id v21 = *(id *)(a1 + 48);
        id v19 = *(id *)(a1 + 56);
        id v22 = 0;
        id v23 = v19;
        [v18 moveDiagnosticFilesToDestination:v7 reply:v20];
        if (v11 != -1) {
          sandbox_extension_release();
        }

        goto LABEL_15;
      }
      id v12 = diagcollectLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = __error();
        uint64_t v14 = strerror(*v13);
        *(_DWORD *)buf = 136315138;
        id v25 = v14;
        uint64_t v15 = "Failed to consume sandbox extension due to error: %s";
        uint64_t v16 = v12;
        uint32_t v17 = 12;
LABEL_10:
        _os_log_impl(&dword_209DBA000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
      }
    }
    else
    {
      id v12 = diagcollectLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        uint64_t v15 = "No sandbox extension provided";
        uint64_t v16 = v12;
        uint32_t v17 = 2;
        goto LABEL_10;
      }
    }

    uint64_t v11 = -1;
    goto LABEL_12;
  }
LABEL_15:
}

void __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_78(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_2_79;
  block[3] = &unk_263FC33B0;
  id v9 = *(id *)(a1 + 48);
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_2_79(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_82(uint64_t a1)
{
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:57 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __103__DiagCollectionClient_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_83(uint64_t a1)
{
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:57 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->destinationDirectory, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end