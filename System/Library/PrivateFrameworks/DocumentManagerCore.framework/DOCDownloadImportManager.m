@interface DOCDownloadImportManager
- (BOOL)_doc_destinationLocationExists:(int64_t)a3;
- (id)_moveItemAtURL:(id)a3 toNamedLocation:(int64_t)a4 error:(id *)a5;
- (id)interface;
- (void)importPlaceholderAtURLToDownloadsDirectory:(id)a3 completion:(id)a4;
- (void)replacePlaceholder:(id)a3 withFinalFileURL:(id)a4 completionHandler:(id)a5;
@end

@implementation DOCDownloadImportManager

- (void)importPlaceholderAtURLToDownloadsDirectory:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"DOCDownloadImportManager.m", 30, @"Invalid parameter not satisfying: %@", @"placeholderDocumentURL" object file lineNumber description];
  }
  v9 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.DocumentManagerCore.Downloads"];
  v10 = [(DOCDownloadImportManager *)self interface];
  [v9 setRemoteObjectInterface:v10];

  [v9 resume];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __82__DOCDownloadImportManager_importPlaceholderAtURLToDownloadsDirectory_completion___block_invoke;
  v19[3] = &unk_2641B5980;
  id v11 = v8;
  id v20 = v11;
  v12 = [v9 remoteObjectProxyWithErrorHandler:v19];
  id v18 = 0;
  v13 = [MEMORY[0x263F054E0] wrapperWithURL:v7 readonly:0 error:&v18];
  id v14 = v18;
  if (v13)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __82__DOCDownloadImportManager_importPlaceholderAtURLToDownloadsDirectory_completion___block_invoke_16;
    v16[3] = &unk_2641B5BA0;
    id v17 = v11;
    [v12 importPlaceholderAtURLToDownloadsDirectory:v13 completionHandler:v16];
  }
  else
  {
    (*((void (**)(id, void, id))v11 + 2))(v11, 0, v14);
  }
}

void __82__DOCDownloadImportManager_importPlaceholderAtURLToDownloadsDirectory_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = docDownloadServiceLogHandle;
  if (!docDownloadServiceLogHandle)
  {
    DOCInitLogging();
    v4 = docDownloadServiceLogHandle;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __82__DOCDownloadImportManager_importPlaceholderAtURLToDownloadsDirectory_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __82__DOCDownloadImportManager_importPlaceholderAtURLToDownloadsDirectory_completion___block_invoke_16(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v5 = [a2 url];
    int v3 = [v5 startAccessingSecurityScopedResource];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    if (v3) {
      [v5 stopAccessingSecurityScopedResource];
    }
  }
  else
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
}

- (void)replacePlaceholder:(id)a3 withFinalFileURL:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v9 = (objc_class *)MEMORY[0x263F08D68];
  id v10 = a4;
  id v11 = a3;
  v12 = (void *)[[v9 alloc] initWithServiceName:@"com.apple.DocumentManagerCore.Downloads"];
  v13 = [(DOCDownloadImportManager *)self interface];
  [v12 setRemoteObjectInterface:v13];

  [v12 resume];
  id v14 = [v12 remoteObjectProxyWithErrorHandler:&__block_literal_global_6];
  id v22 = 0;
  v15 = [MEMORY[0x263F054E0] wrapperWithURL:v11 readonly:0 error:&v22];

  id v16 = v22;
  id v21 = v16;
  id v17 = [MEMORY[0x263F054E0] wrapperWithURL:v10 readonly:0 error:&v21];

  id v18 = v21;
  if (v15 && v17)
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __82__DOCDownloadImportManager_replacePlaceholder_withFinalFileURL_completionHandler___block_invoke_18;
    v19[3] = &unk_2641B5BA0;
    id v20 = v8;
    [v14 replacePlaceholder:v15 withFinalFileURL:v17 completionHandler:v19];
  }
  else
  {
    (*((void (**)(id, void, id))v8 + 2))(v8, 0, v18);
  }
}

void __82__DOCDownloadImportManager_replacePlaceholder_withFinalFileURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = docDownloadServiceLogHandle;
  if (!docDownloadServiceLogHandle)
  {
    DOCInitLogging();
    int v3 = docDownloadServiceLogHandle;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __82__DOCDownloadImportManager_importPlaceholderAtURLToDownloadsDirectory_completion___block_invoke_cold_1();
  }
}

void __82__DOCDownloadImportManager_replacePlaceholder_withFinalFileURL_completionHandler___block_invoke_18(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v4 = [a2 url];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    int v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
}

- (id)interface
{
  id v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C421278];
  int v3 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v3 forSelector:sel_importPlaceholderAtURLToDownloadsDirectory_completionHandler_ argumentIndex:0 ofReply:0];

  id v4 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v4 forSelector:sel_importPlaceholderAtURLToDownloadsDirectory_completionHandler_ argumentIndex:0 ofReply:1];

  id v5 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_importPlaceholderAtURLToDownloadsDirectory_completionHandler_ argumentIndex:1 ofReply:1];

  v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v6 forSelector:sel_replacePlaceholder_withFinalFileURL_completionHandler_ argumentIndex:0 ofReply:0];

  id v7 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v7 forSelector:sel_replacePlaceholder_withFinalFileURL_completionHandler_ argumentIndex:1 ofReply:0];

  id v8 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_replacePlaceholder_withFinalFileURL_completionHandler_ argumentIndex:0 ofReply:1];

  v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v9 forSelector:sel_replacePlaceholder_withFinalFileURL_completionHandler_ argumentIndex:1 ofReply:1];

  id v10 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v10 forSelector:sel_importItemAtURL_toLocation_completionHandler_ argumentIndex:0 ofReply:1];

  id v11 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v11 forSelector:sel_importItemAtURL_toLocation_completionHandler_ argumentIndex:1 ofReply:1];

  v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v12 forSelector:sel_namedLocationExists_completionHandler_ argumentIndex:1 ofReply:1];

  return v2;
}

- (id)_moveItemAtURL:(id)a3 toNamedLocation:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  int v9 = [v8 startAccessingSecurityScopedResource];
  v33[0] = 0;
  id v10 = [MEMORY[0x263F054E0] wrapperWithURL:v8 readonly:0 error:v33];
  id v11 = v33[0];
  v12 = v11;
  if (v11)
  {
    id v13 = 0;
    if (a5) {
      *a5 = v11;
    }
  }
  else
  {
    id v14 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.DocumentManagerCore.Downloads"];
    v15 = [(DOCDownloadImportManager *)self interface];
    [v14 setRemoteObjectInterface:v15];

    [v14 resume];
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__1;
    v31 = __Block_byref_object_dispose__1;
    id v32 = 0;
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__1;
    v25 = __Block_byref_object_dispose__1;
    id v26 = 0;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __65__DOCDownloadImportManager__moveItemAtURL_toNamedLocation_error___block_invoke;
    v20[3] = &unk_2641B5BE8;
    v20[4] = &v27;
    id v16 = [v14 synchronousRemoteObjectProxyWithErrorHandler:v20];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __65__DOCDownloadImportManager__moveItemAtURL_toNamedLocation_error___block_invoke_35;
    v19[3] = &unk_2641B5C10;
    void v19[4] = &v21;
    v19[5] = &v27;
    [v16 importItemAtURL:v10 toLocation:a4 completionHandler:v19];
    if (a5)
    {
      id v17 = (void *)v28[5];
      if (v17) {
        *a5 = v17;
      }
    }
    if (v9) {
      [v8 stopAccessingSecurityScopedResource];
    }
    id v13 = (id)v22[5];

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v27, 8);
  }
  return v13;
}

void __65__DOCDownloadImportManager__moveItemAtURL_toNamedLocation_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = docDownloadServiceLogHandle;
  if (!docDownloadServiceLogHandle)
  {
    DOCInitLogging();
    id v4 = docDownloadServiceLogHandle;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __82__DOCDownloadImportManager_importPlaceholderAtURLToDownloadsDirectory_completion___block_invoke_cold_1();
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __65__DOCDownloadImportManager__moveItemAtURL_toNamedLocation_error___block_invoke_35(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v11 = v5;
  if (a2)
  {
    uint64_t v6 = [a2 url];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = v5;
    id v8 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }
}

- (BOOL)_doc_destinationLocationExists:(int64_t)a3
{
  if (a3 != 2)
  {
    id v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"DOCDownloadImportManager.m", 165, @"Invalid parameter not satisfying: %@", @"location == _DOCFileDestinationDocuments" object file lineNumber description];
  }
  id v5 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.DocumentManagerCore.Downloads"];
  uint64_t v6 = [(DOCDownloadImportManager *)self interface];
  [v5 setRemoteObjectInterface:v6];

  [v5 resume];
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__1;
  v18[4] = __Block_byref_object_dispose__1;
  id v19 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__DOCDownloadImportManager__doc_destinationLocationExists___block_invoke;
  v13[3] = &unk_2641B5BE8;
  v13[4] = v18;
  uint64_t v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __59__DOCDownloadImportManager__doc_destinationLocationExists___block_invoke_39;
  v12[3] = &unk_2641B5C38;
  v12[4] = &v14;
  [v7 namedLocationExists:a3 completionHandler:v12];
  char v8 = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(v18, 8);

  return v8;
}

void __59__DOCDownloadImportManager__doc_destinationLocationExists___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = docDownloadServiceLogHandle;
  if (!docDownloadServiceLogHandle)
  {
    DOCInitLogging();
    id v4 = docDownloadServiceLogHandle;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __82__DOCDownloadImportManager_importPlaceholderAtURLToDownloadsDirectory_completion___block_invoke_cold_1();
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __59__DOCDownloadImportManager__doc_destinationLocationExists___block_invoke_39(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      uint64_t v6 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __59__DOCDownloadImportManager__doc_destinationLocationExists___block_invoke_39_cold_1();
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

void __82__DOCDownloadImportManager_importPlaceholderAtURLToDownloadsDirectory_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_213670000, v0, v1, "Remote object proxy error: %@", v2, v3, v4, v5, v6);
}

void __59__DOCDownloadImportManager__doc_destinationLocationExists___block_invoke_39_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_213670000, v0, OS_LOG_TYPE_ERROR, "Named location error: %@", v1, 0xCu);
}

@end