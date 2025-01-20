@interface DOCRenameSupport
+ (id)_spi_renameDocumentAtURL:(id)a3 proposedName:(id)a4 error:(id *)a5;
+ (id)interface;
+ (void)_spi_renameDocumentAtURL:(id)a3 proposedName:(id)a4 completionHandler:(id)a5;
@end

@implementation DOCRenameSupport

+ (id)_spi_renameDocumentAtURL:(id)a3 proposedName:(id)a4 error:(id *)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v34 = 0;
  v9 = [MEMORY[0x263F054E0] wrapperWithURL:v7 readonly:0 error:&v34];
  id v10 = v34;
  v11 = v10;
  if (v9)
  {
    v12 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.DocumentManagerCore.Rename"];
    v13 = [(id)objc_opt_class() interface];
    [v12 setRemoteObjectInterface:v13];

    [v12 resume];
    v14 = [v12 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_10];
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__4;
    v32 = __Block_byref_object_dispose__4;
    id v33 = 0;
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__4;
    v26 = __Block_byref_object_dispose__4;
    id v27 = 0;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __64__DOCRenameSupport__spi_renameDocumentAtURL_proposedName_error___block_invoke_3;
    v21[3] = &unk_2641B5C10;
    v21[4] = &v22;
    v21[5] = &v28;
    [v14 renameDocumentAtURL:v9 proposedName:v8 completionHandler:v21];
    [v12 invalidate];
    v15 = docRenameLogHandle;
    if (!docRenameLogHandle)
    {
      DOCInitLogging();
      v15 = docRenameLogHandle;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = v23[5];
      uint64_t v17 = v29[5];
      *(_DWORD *)buf = 136315650;
      v36 = "+[DOCRenameSupport _spi_renameDocumentAtURL:proposedName:error:]";
      __int16 v37 = 2112;
      uint64_t v38 = v16;
      __int16 v39 = 2112;
      uint64_t v40 = v17;
      _os_log_impl(&dword_213670000, v15, OS_LOG_TYPE_INFO, "%s new url: %@ error: %@", buf, 0x20u);
    }
    if (a5)
    {
      v18 = (void *)v29[5];
      if (v18) {
        *a5 = v18;
      }
    }
    id v19 = (id)v23[5];
    _Block_object_dispose(&v22, 8);

    _Block_object_dispose(&v28, 8);
  }
  else
  {
    id v19 = 0;
    if (a5 && v10)
    {
      id v19 = 0;
      *a5 = v10;
    }
  }

  return v19;
}

void __64__DOCRenameSupport__spi_renameDocumentAtURL_proposedName_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = docRenameLogHandle;
  if (!docRenameLogHandle)
  {
    DOCInitLogging();
    v3 = docRenameLogHandle;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __64__DOCRenameSupport__spi_renameDocumentAtURL_proposedName_error___block_invoke_cold_1((uint64_t)v2, v3);
  }
}

void __64__DOCRenameSupport__spi_renameDocumentAtURL_proposedName_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  id v8 = docRenameLogHandle;
  if (!v5 || v6)
  {
    if (!docRenameLogHandle)
    {
      DOCInitLogging();
      id v8 = docRenameLogHandle;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __64__DOCRenameSupport__spi_renameDocumentAtURL_proposedName_error___block_invoke_3_cold_1();
    }
  }
  else
  {
    if (!docRenameLogHandle)
    {
      DOCInitLogging();
      id v8 = docRenameLogHandle;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315650;
      v15 = "+[DOCRenameSupport _spi_renameDocumentAtURL:proposedName:error:]_block_invoke";
      __int16 v16 = 2112;
      id v17 = v5;
      __int16 v18 = 2112;
      uint64_t v19 = 0;
      _os_log_impl(&dword_213670000, v8, OS_LOG_TYPE_INFO, "%s new url: %@ error: %@", (uint8_t *)&v14, 0x20u);
    }
  }
  uint64_t v9 = [v5 url];
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v7;
}

+ (void)_spi_renameDocumentAtURL:(id)a3 proposedName:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v16 = 0;
  uint64_t v9 = [MEMORY[0x263F054E0] wrapperWithURL:a3 readonly:0 error:&v16];
  id v10 = v16;
  if (v9)
  {
    v11 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.DocumentManagerCore.Rename"];
    uint64_t v12 = [(id)objc_opt_class() interface];
    [v11 setRemoteObjectInterface:v12];

    [v11 resume];
    v13 = [v11 remoteObjectProxyWithErrorHandler:&__block_literal_global_6];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __76__DOCRenameSupport__spi_renameDocumentAtURL_proposedName_completionHandler___block_invoke_7;
    v14[3] = &unk_2641B5BA0;
    id v15 = v8;
    [v13 renameDocumentAtURL:v9 proposedName:v7 completionHandler:v14];
  }
  else
  {
    (*((void (**)(id, void, id))v8 + 2))(v8, 0, v10);
  }
}

void __76__DOCRenameSupport__spi_renameDocumentAtURL_proposedName_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = docRenameLogHandle;
  if (!docRenameLogHandle)
  {
    DOCInitLogging();
    v3 = docRenameLogHandle;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __76__DOCRenameSupport__spi_renameDocumentAtURL_proposedName_completionHandler___block_invoke_cold_1((uint64_t)v2, v3);
  }
}

void __76__DOCRenameSupport__spi_renameDocumentAtURL_proposedName_completionHandler___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    v11 = docRenameLogHandle;
    if (!docRenameLogHandle)
    {
      DOCInitLogging();
      v11 = docRenameLogHandle;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __76__DOCRenameSupport__spi_renameDocumentAtURL_proposedName_completionHandler___block_invoke_7_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v8 = [v5 url];
    uint64_t v9 = docRenameLogHandle;
    if (!docRenameLogHandle)
    {
      DOCInitLogging();
      uint64_t v9 = docRenameLogHandle;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315650;
      v13 = "+[DOCRenameSupport _spi_renameDocumentAtURL:proposedName:completionHandler:]_block_invoke";
      __int16 v14 = 2112;
      id v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = 0;
      _os_log_impl(&dword_213670000, v9, OS_LOG_TYPE_INFO, "%s new url: %@ error: %@", (uint8_t *)&v12, 0x20u);
    }
    int v10 = [v8 startAccessingSecurityScopedResource];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    if (v10) {
      [v8 stopAccessingSecurityScopedResource];
    }
  }
}

+ (id)interface
{
  id v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C4212D8];
  v3 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v3 forSelector:sel_renameDocumentAtURL_proposedName_completionHandler_ argumentIndex:0 ofReply:0];

  v4 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v4 forSelector:sel_renameDocumentAtURL_proposedName_completionHandler_ argumentIndex:1 ofReply:0];

  id v5 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_renameDocumentAtURL_proposedName_completionHandler_ argumentIndex:0 ofReply:1];

  id v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v6 forSelector:sel_renameDocumentAtURL_proposedName_completionHandler_ argumentIndex:1 ofReply:1];

  return v2;
}

void __64__DOCRenameSupport__spi_renameDocumentAtURL_proposedName_error___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_213670000, a2, OS_LOG_TYPE_ERROR, "Synchronous remote object proxy error: %@", (uint8_t *)&v2, 0xCu);
}

void __64__DOCRenameSupport__spi_renameDocumentAtURL_proposedName_error___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_213670000, v0, v1, "ERROR: Remote object renameDocumentAtURL: call retured bookmarkData: %@ error: %@");
}

void __76__DOCRenameSupport__spi_renameDocumentAtURL_proposedName_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_213670000, a2, OS_LOG_TYPE_ERROR, "Remote object proxy error: %@", (uint8_t *)&v2, 0xCu);
}

void __76__DOCRenameSupport__spi_renameDocumentAtURL_proposedName_completionHandler___block_invoke_7_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_213670000, v0, v1, "ERROR: Remote object renameDocumentAtURL: call retured bookmark data: %@ error: %@");
}

@end