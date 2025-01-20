@interface BADownloaderExtensionConnection
- (BADownloaderExtension)principalObject;
- (BADownloaderExtensionConnection)initWithPrincipalObject:(id)a3;
- (BOOL)_markPurgeableWithFileURL:(void *)a3 error:;
- (BOOL)shouldAcceptXPCConnection:(id)a3;
- (id)acquireWakeAssertion;
- (void)backgroundDownload:(id)a3 failedWithError:(id)a4 completionHandler:(id)a5;
- (void)backgroundDownload:(id)a3 finishedWithSandboxToken:(id)a4 completionHandler:(id)a5;
- (void)downloadsForRequest:(int64_t)a3 manifestURL:(id)a4 manifestToken:(id)a5 extensionInfo:(id)a6 completionHandler:(id)a7;
- (void)extensionWillTerminate;
- (void)receivedAuthenticationChallenge:(id)a3 download:(id)a4 completionHandler:(id)a5;
- (void)setPrincipalObject:(id)a3;
- (void)wakeupForTokenWithReply:(id)a3;
@end

@implementation BADownloaderExtensionConnection

- (BADownloaderExtensionConnection)initWithPrincipalObject:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BADownloaderExtensionConnection;
  v5 = [(BADownloaderExtensionConnection *)&v15 init];
  if (v5)
  {
    v6 = +[BADownloadManager sharedManager];
    -[BADownloadManager setExtensionConnection:]((uint64_t)v6, v5);

    v7 = NSString;
    v8 = [MEMORY[0x263F086E0] mainBundle];
    v9 = [v8 bundleIdentifier];
    v10 = [v7 stringWithFormat:@"%@.work-queue", v9];

    id v11 = v10;
    dispatch_queue_t v12 = dispatch_queue_create((const char *)[v11 UTF8String], 0);
    objc_setProperty_atomic(v5, v13, v12, 24);

    [(BADownloaderExtensionConnection *)v5 setPrincipalObject:v4];
  }

  return v5;
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  v34[4] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DAF9C98];
  v5 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v4 setClasses:v5 forSelector:sel_downloadsForRequest_manifestURL_manifestToken_extensionInfo_completionHandler_ argumentIndex:1 ofReply:0];

  v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v4 setClasses:v6 forSelector:sel_downloadsForRequest_manifestURL_manifestToken_extensionInfo_completionHandler_ argumentIndex:2 ofReply:0];

  v7 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v4 setClasses:v7 forSelector:sel_downloadsForRequest_manifestURL_manifestToken_extensionInfo_completionHandler_ argumentIndex:3 ofReply:0];

  v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  id v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  [v4 setClasses:v11 forSelector:sel_downloadsForRequest_manifestURL_manifestToken_extensionInfo_completionHandler_ argumentIndex:1 ofReply:1];

  dispatch_queue_t v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v4 setClasses:v12 forSelector:sel_receivedAuthenticationChallenge_download_completionHandler_ argumentIndex:0 ofReply:0];

  SEL v13 = (void *)MEMORY[0x263EFFA08];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  v17 = objc_msgSend(v13, "setWithObjects:", v14, v15, v16, objc_opt_class(), 0);
  [v4 setClasses:v17 forSelector:sel_receivedAuthenticationChallenge_download_completionHandler_ argumentIndex:1 ofReply:0];

  v18 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v4 setClasses:v18 forSelector:sel_receivedAuthenticationChallenge_download_completionHandler_ argumentIndex:1 ofReply:1];

  v19 = (void *)MEMORY[0x263EFFA08];
  v34[0] = objc_opt_class();
  v34[1] = objc_opt_class();
  v34[2] = objc_opt_class();
  v34[3] = objc_opt_class();
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:4];
  v21 = [v19 setWithArray:v20];
  [v4 setClasses:v21 forSelector:sel_backgroundDownload_failedWithError_completionHandler_ argumentIndex:0 ofReply:0];

  v22 = (void *)MEMORY[0x263EFFA08];
  v33[0] = objc_opt_class();
  v33[1] = objc_opt_class();
  v33[2] = objc_opt_class();
  v33[3] = objc_opt_class();
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:4];
  v24 = [v22 setWithArray:v23];
  [v4 setClasses:v24 forSelector:sel_backgroundDownload_finishedWithSandboxToken_completionHandler_ argumentIndex:0 ofReply:0];

  v25 = (void *)MEMORY[0x263EFFA08];
  uint64_t v32 = objc_opt_class();
  v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
  v27 = [v25 setWithArray:v26];
  [v4 setClasses:v27 forSelector:sel_backgroundDownload_finishedWithSandboxToken_completionHandler_ argumentIndex:1 ofReply:0];

  v28 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DAFC670];
  [v3 setExportedInterface:v4];
  [v3 setRemoteObjectInterface:v28];
  [v3 setExportedObject:self];
  if (self) {
    objc_setProperty_atomic(self, v29, v3, 40);
  }
  [v3 resume];

  return 1;
}

- (void)wakeupForTokenWithReply:(id)a3
{
}

- (void)downloadsForRequest:(int64_t)a3 manifestURL:(id)a4 manifestToken:(id)a5 extensionInfo:(id)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v17 = [(BADownloaderExtensionConnection *)self principalObject];
  if (self) {
    self = (BADownloaderExtensionConnection *)objc_getProperty(self, v16, 24, 1);
  }
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __113__BADownloaderExtensionConnection_downloadsForRequest_manifestURL_manifestToken_extensionInfo_completionHandler___block_invoke;
  v23[3] = &unk_2647E8BC0;
  id v24 = v13;
  id v25 = v12;
  id v28 = v15;
  int64_t v29 = a3;
  id v26 = v17;
  id v27 = v14;
  id v18 = v14;
  id v19 = v17;
  id v20 = v15;
  id v21 = v12;
  id v22 = v13;
  dispatch_async(&self->super.super, v23);
}

void __113__BADownloaderExtensionConnection_downloadsForRequest_manifestURL_manifestToken_extensionInfo_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v47 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) UTF8String];
  if (sandbox_extension_consume() != -1)
  {
    v2 = +[BADownloadManager sharedManager];
    -[BADownloadManager setScheduleLocked:]((uint64_t)v2, 1);

    id v3 = [MEMORY[0x263EFFA08] set];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v4 = [*(id *)(v1 + 48) downloadsForRequest:*(void *)(v1 + 72) manifestURL:*(void *)(v1 + 40) extensionInfo:*(void *)(v1 + 56)];

      id v3 = (void *)v4;
    }
    sandbox_extension_release();
    if (!v3) {
      goto LABEL_27;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_27;
    }
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (!v6) {
      goto LABEL_16;
    }
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v43;
    while (1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v43 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v1 = *(void *)(v1 + 64);
          id v14 = objc_msgSend(MEMORY[0x263EFFA08], "set", (void)v42);
          (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v14);

          BOOL v15 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
          if (v15) {
            __113__BADownloaderExtensionConnection_downloadsForRequest_manifestURL_manifestToken_extensionInfo_completionHandler___block_invoke_cold_4(v15, v16, v17, v18, v19, v20, v21, v22);
          }
          __break(1u);
LABEL_24:
          uint64_t v1 = *(void *)(v1 + 64);
          v23 = [MEMORY[0x263EFFA08] set];
          (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v23);

          BOOL v24 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
          if (v24) {
            __113__BADownloaderExtensionConnection_downloadsForRequest_manifestURL_manifestToken_extensionInfo_completionHandler___block_invoke_cold_3(v24, v25, v26, v27, v28, v29, v30, v31);
          }
          __break(1u);
LABEL_27:
          uint64_t v32 = *(void *)(v1 + 64);
          v33 = [MEMORY[0x263EFFA08] set];
          (*(void (**)(uint64_t, void, void *))(v32 + 16))(v32, 0, v33);

          BOOL v34 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
          if (v34) {
            __113__BADownloaderExtensionConnection_downloadsForRequest_manifestURL_manifestToken_extensionInfo_completionHandler___block_invoke_cold_2(v34, v35, v36, v37, v38, v39, v40, v41);
          }
          __break(1u);
        }
        if ((unint64_t)(*(void *)(v1 + 72) - 1) >= 2 && objc_msgSend(v10, "necessity", (void)v42) == 1) {
          goto LABEL_24;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (!v7)
      {
LABEL_16:

        (*(void (**)(void))(*(void *)(v1 + 64) + 16))();
        id v11 = +[BADownloadManager sharedManager];
        -[BADownloadManager setScheduleLocked:]((uint64_t)v11, 0);

        goto LABEL_20;
      }
    }
  }
  id v12 = BASystemLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    __113__BADownloaderExtensionConnection_downloadsForRequest_manifestURL_manifestToken_extensionInfo_completionHandler___block_invoke_cold_1(v1, v12);
  }

  uint64_t v13 = *(void *)(v1 + 64);
  id v5 = [MEMORY[0x263EFFA08] set];
  (*(void (**)(uint64_t, void, id))(v13 + 16))(v13, 0, v5);
LABEL_20:
}

- (void)receivedAuthenticationChallenge:(id)a3 download:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v12 = [(BADownloaderExtensionConnection *)self principalObject];
  if (self) {
    self = (BADownloaderExtensionConnection *)objc_getProperty(self, v11, 24, 1);
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __94__BADownloaderExtensionConnection_receivedAuthenticationChallenge_download_completionHandler___block_invoke;
  v17[3] = &unk_2647E8BE8;
  id v18 = v12;
  id v19 = v9;
  id v20 = v8;
  id v21 = v10;
  id v13 = v10;
  id v14 = v8;
  id v15 = v9;
  id v16 = v12;
  dispatch_async(&self->super.super, v17);
}

uint64_t __94__BADownloaderExtensionConnection_receivedAuthenticationChallenge_download_completionHandler___block_invoke(void *a1)
{
  if (objc_opt_respondsToSelector())
  {
    v2 = (void *)a1[4];
    uint64_t v3 = a1[5];
    uint64_t v4 = a1[6];
    uint64_t v5 = a1[7];
    return [v2 backgroundDownload:v3 didReceiveChallenge:v4 completionHandler:v5];
  }
  else
  {
    uint64_t v7 = *(uint64_t (**)(void))(a1[7] + 16);
    return v7();
  }
}

- (void)extensionWillTerminate
{
  id v2 = [(BADownloaderExtensionConnection *)self principalObject];
  if (objc_opt_respondsToSelector()) {
    [v2 extensionWillTerminate];
  }
}

- (void)backgroundDownload:(id)a3 failedWithError:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v12 = [(BADownloaderExtensionConnection *)self principalObject];
  if (self) {
    self = (BADownloaderExtensionConnection *)objc_getProperty(self, v11, 24, 1);
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __88__BADownloaderExtensionConnection_backgroundDownload_failedWithError_completionHandler___block_invoke;
  v17[3] = &unk_2647E8BE8;
  id v18 = v12;
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  id v16 = v12;
  dispatch_async(&self->super.super, v17);
}

uint64_t __88__BADownloaderExtensionConnection_backgroundDownload_failedWithError_completionHandler___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) backgroundDownload:*(void *)(a1 + 40) failedWithError:*(void *)(a1 + 48)];
  }
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v2();
}

- (void)backgroundDownload:(id)a3 finishedWithSandboxToken:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v12 = [(BADownloaderExtensionConnection *)self principalObject];
  if (self) {
    Property = objc_getProperty(self, v11, 24, 1);
  }
  else {
    Property = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __97__BADownloaderExtensionConnection_backgroundDownload_finishedWithSandboxToken_completionHandler___block_invoke;
  block[3] = &unk_2647E8C10;
  id v19 = v9;
  id v20 = v8;
  uint64_t v22 = self;
  id v23 = v10;
  id v21 = v12;
  id v14 = v10;
  id v15 = v12;
  id v16 = v8;
  id v17 = v9;
  dispatch_async(Property, block);
}

void __97__BADownloaderExtensionConnection_backgroundDownload_finishedWithSandboxToken_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) UTF8String];
  if (sandbox_extension_consume() != -1)
  {
    id v2 = *(void **)(a1 + 40);
    id v24 = 0;
    id v25 = 0;
    char v3 = [v2 cloneDownloadToFinalDestinationURL:&v25 error:&v24];
    id v4 = v25;
    id v5 = v24;
    if (v3)
    {
      uint64_t v6 = *(void **)(a1 + 56);
      id v23 = v5;
      BOOL v7 = -[BADownloaderExtensionConnection _markPurgeableWithFileURL:error:](v6, v4, &v23);
      id v8 = v23;

      if (v7)
      {
        if (objc_opt_respondsToSelector()) {
          [*(id *)(a1 + 48) backgroundDownload:*(void *)(a1 + 40) finishedWithFileURL:v4];
        }
        id v9 = [MEMORY[0x263F08850] defaultManager];
        id v10 = [v4 path];
        int v11 = [v9 fileExistsAtPath:v10];

        if (!v11) {
          goto LABEL_30;
        }
        id v12 = [MEMORY[0x263F08850] defaultManager];
        id v21 = 0;
        char v13 = [v12 removeItemAtURL:v4 error:&v21];
        id v14 = v21;

        if ((v13 & 1) == 0)
        {
          id v15 = BAClientLogObject();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            __97__BADownloaderExtensionConnection_backgroundDownload_finishedWithSandboxToken_completionHandler___block_invoke_cold_2();
          }
        }
      }
      else
      {
        id v17 = BAClientLogObject();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          __97__BADownloaderExtensionConnection_backgroundDownload_finishedWithSandboxToken_completionHandler___block_invoke_cold_4();
        }

        -[BADownload setInternalState:](*(void **)(a1 + 40), -1);
        id v18 = [MEMORY[0x263F08850] defaultManager];
        id v22 = 0;
        char v19 = [v18 removeItemAtURL:v4 error:&v22];
        id v14 = v22;

        if ((v19 & 1) == 0)
        {
          id v20 = BAClientLogObject();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            __97__BADownloaderExtensionConnection_backgroundDownload_finishedWithSandboxToken_completionHandler___block_invoke_cold_3();
          }
        }
        if (objc_opt_respondsToSelector()) {
          [*(id *)(a1 + 48) backgroundDownload:*(void *)(a1 + 40) failedWithError:v8];
        }
      }
    }
    else
    {
      -[BADownload setInternalState:](*(void **)(a1 + 40), -1);
      if (objc_opt_respondsToSelector()) {
        [*(id *)(a1 + 48) backgroundDownload:*(void *)(a1 + 40) failedWithError:v5];
      }
      id v14 = BAClientLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __97__BADownloaderExtensionConnection_backgroundDownload_finishedWithSandboxToken_completionHandler___block_invoke_cold_5();
      }
      id v8 = v5;
    }

LABEL_30:
    sandbox_extension_release();
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

    goto LABEL_31;
  }
  id v16 = BASystemLogObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    __97__BADownloaderExtensionConnection_backgroundDownload_finishedWithSandboxToken_completionHandler___block_invoke_cold_1(a1, v16);
  }

  NSErrorWithBAErrorCode(-108);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BADownload setInternalState:](*(void **)(a1 + 40), -1);
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 48) backgroundDownload:*(void *)(a1 + 40) failedWithError:v4];
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_31:
}

- (BOOL)_markPurgeableWithFileURL:(void *)a3 error:
{
  v34[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = v5;
  if (!a1) {
    goto LABEL_13;
  }
  id v7 = v5;
  [v7 fileSystemRepresentation];
  id Property = objc_getProperty(a1, v8, 40, 1);
  if (Property)
  {
    [Property auditToken];
  }
  else
  {
    long long v31 = 0u;
    long long v32 = 0u;
  }
  id v10 = (void *)sandbox_extension_issue_file_to_process();
  if (v10)
  {
    int v11 = [NSString stringWithUTF8String:v10];
    free(v10);
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 0;
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x3032000000;
    id v24 = __Block_byref_object_copy__108;
    id v25 = __Block_byref_object_dispose__109;
    id v26 = 0;
    id v13 = objc_getProperty(a1, v12, 40, 1);
    id v14 = [v13 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_111];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __67__BADownloaderExtensionConnection__markPurgeableWithFileURL_error___block_invoke_112;
    v20[3] = &unk_2647E8CC8;
    v20[4] = &v27;
    v20[5] = &v21;
    [v14 markPurgeableWithFileURL:v7 sandboxToken:v11 reply:v20];

    if (a3) {
      *a3 = (id) v22[5];
    }
    BOOL v15 = *((unsigned char *)v28 + 24) != 0;
    _Block_object_dispose(&v21, 8);

    _Block_object_dispose(&v27, 8);
    goto LABEL_11;
  }
  if (!a3)
  {
LABEL_13:
    BOOL v15 = 0;
    goto LABEL_12;
  }
  id v16 = (void *)MEMORY[0x263F087E8];
  uint64_t v17 = *__error();
  v33 = @"FileURL";
  v34[0] = v7;
  id v18 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
  int v11 = [v16 errorWithDomain:*MEMORY[0x263F08438] code:v17 userInfo:v18];

  NSErrorWithBAErrorDomainCodeUnderlying(@"BAErrorDomain", -107, v11);
  BOOL v15 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

LABEL_12:
  return v15;
}

- (id)acquireWakeAssertion
{
  if (self) {
    self = (BADownloaderExtensionConnection *)objc_getProperty(self, a2, 40, 1);
  }
  id v2 = [(BADownloaderExtensionConnection *)self synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global];
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  SEL v12 = __Block_byref_object_copy_;
  id v13 = __Block_byref_object_dispose_;
  id v14 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_100);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__BADownloaderExtensionConnection_acquireWakeAssertion__block_invoke_2;
  v6[3] = &unk_2647E8CA0;
  SEL v8 = &v9;
  id v3 = v2;
  id v7 = v3;
  [v3 incrementWakeAssertionWithReply:v6];
  id v4 = _Block_copy((const void *)v10[5]);

  _Block_object_dispose(&v9, 8);

  return v4;
}

void __55__BADownloaderExtensionConnection_acquireWakeAssertion__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = BAClientLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __55__BADownloaderExtensionConnection_acquireWakeAssertion__block_invoke_cold_1(v2);
  }
}

void __55__BADownloaderExtensionConnection_acquireWakeAssertion__block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__BADownloaderExtensionConnection_acquireWakeAssertion__block_invoke_3;
  block[3] = &unk_2647E8C78;
  id v6 = *(id *)(a1 + 32);
  dispatch_block_t v2 = dispatch_block_create((dispatch_block_flags_t)0, block);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __55__BADownloaderExtensionConnection_acquireWakeAssertion__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) decrementWakeAssertionWithReply:&__block_literal_global_102];
}

void __67__BADownloaderExtensionConnection__markPurgeableWithFileURL_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = BAClientLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __67__BADownloaderExtensionConnection__markPurgeableWithFileURL_error___block_invoke_cold_1(v2);
  }
}

void __67__BADownloaderExtensionConnection__markPurgeableWithFileURL_error___block_invoke_112(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BADownloaderExtension)principalObject
{
  return (BADownloaderExtension *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPrincipalObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonConnection, 0);
  objc_storeStrong((id *)&self->_principalObject, 0);

  objc_storeStrong((id *)&self->_extensionWorkQueue, 0);
}

void __113__BADownloaderExtensionConnection_downloadsForRequest_manifestURL_manifestToken_extensionInfo_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_226E14000, a2, OS_LOG_TYPE_ERROR, "Manifest of %{public}@ finished but sandbox_extension_consume() failed.", (uint8_t *)&v3, 0xCu);
}

void __113__BADownloaderExtensionConnection_downloadsForRequest_manifestURL_manifestToken_extensionInfo_completionHandler___block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __113__BADownloaderExtensionConnection_downloadsForRequest_manifestURL_manifestToken_extensionInfo_completionHandler___block_invoke_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __113__BADownloaderExtensionConnection_downloadsForRequest_manifestURL_manifestToken_extensionInfo_completionHandler___block_invoke_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __97__BADownloaderExtensionConnection_backgroundDownload_finishedWithSandboxToken_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_226E14000, a2, OS_LOG_TYPE_ERROR, "Download  %{public}@ finished but sandbox_extension_consume() failed.", (uint8_t *)&v3, 0xCu);
}

void __97__BADownloaderExtensionConnection_backgroundDownload_finishedWithSandboxToken_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  [(id)OUTLINED_FUNCTION_5(v1) identifier];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_4() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_226E14000, v3, v4, "Download %{public}@ failed to remove cloned file after the client serviced the download. Error:%{public}@", v5, v6, v7, v8, v9);
}

void __97__BADownloaderExtensionConnection_backgroundDownload_finishedWithSandboxToken_completionHandler___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  [(id)OUTLINED_FUNCTION_5(v1) identifier];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_4() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_226E14000, v3, v4, "Download %{public}@ failed to remove cloned file failing to be marked as purgeable. Error:%{public}@", v5, v6, v7, v8, v9);
}

void __97__BADownloaderExtensionConnection_backgroundDownload_finishedWithSandboxToken_completionHandler___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_3();
  [(id)OUTLINED_FUNCTION_5(v1) identifier];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_4() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_226E14000, v3, v4, "Download %{public}@ failed to mark cloned file as purgeable. Error:%{public}@", v5, v6, v7, v8, v9);
}

void __97__BADownloaderExtensionConnection_backgroundDownload_finishedWithSandboxToken_completionHandler___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_3();
  [(id)OUTLINED_FUNCTION_5(v1) identifier];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_4() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_226E14000, v3, v4, "Download %{public}@ failed to be cloned after download. Error:%{public}@", v5, v6, v7, v8, v9);
}

void __55__BADownloaderExtensionConnection_acquireWakeAssertion__block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_226E14000, v2, v3, "Message failed: %{public}s error: %{public}@", v4, v5, v6, v7, 2u);
}

void __67__BADownloaderExtensionConnection__markPurgeableWithFileURL_error___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_226E14000, v2, v3, "Message failed: %{public}s error: %{public}@", v4, v5, v6, v7, 2u);
}

@end