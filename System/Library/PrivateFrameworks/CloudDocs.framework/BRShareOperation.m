@interface BRShareOperation
- (BOOL)shouldUseDirectConnection;
- (BRShareOperation)init;
- (BRShareOperation)initWithDirectConnection;
- (BRShareOperation)initWithItemIdentifier:(id)a3;
- (BRShareOperation)initWithShare:(id)a3;
- (BRShareOperation)initWithURL:(id)a3;
- (NSString)itemID;
- (NSURL)url;
- (id)directConnectionFPFSObject;
- (id)remoteFPFSObject;
- (id)remoteLegacyObject;
- (id)remoteObject;
- (void)setItemID:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation BRShareOperation

- (BRShareOperation)init
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  abc_report_panic_with_signature(@"BRShareOperation must be initialized with a URL");
  uint64_t v2 = [NSString stringWithFormat:@"BRShareOperation must be initialized with a URL"];
  v3 = brc_bread_crumbs((uint64_t)"-[BRShareOperation init]", 204);
  v4 = brc_default_log(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    v5 = brc_append_system_info_to_message(v2);
    int v7 = 138412546;
    v8 = v5;
    __int16 v9 = 2112;
    v10 = v3;
    _os_log_fault_impl(&dword_19ED3F000, v4, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", (uint8_t *)&v7, 0x16u);
  }
  brc_append_system_info_to_message(v2);
  v6 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
  __assert_rtn("-[BRShareOperation init]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/operations/BRShareOperations.m", 204, v6);
}

- (BRShareOperation)initWithShare:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = br_shareAssociatedURL(v4);
  if (!v5)
  {
    if (BRShareProcessShouldUseDirectConnection())
    {
      v6 = brc_bread_crumbs((uint64_t)"-[BRShareOperation initWithShare:]", 212);
      int v7 = brc_default_log(1);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[BRShareOperation initWithShare:]();
      }
    }
    else
    {
      v6 = brc_bread_crumbs((uint64_t)"-[BRShareOperation initWithShare:]", 214);
      int v7 = brc_default_log(0);
      if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
      {
        int v10 = 138412802;
        uint64_t v11 = self;
        __int16 v12 = 2112;
        id v13 = v4;
        __int16 v14 = 2112;
        v15 = v6;
        _os_log_error_impl(&dword_19ED3F000, v7, (os_log_type_t)0x90u, "[ERROR] %@ initialized with CKShare %@ that wasn't returned by BRShareCopyShareOperation. Falling back to default connection.%@", (uint8_t *)&v10, 0x20u);
      }
    }
  }
  v8 = [(BRShareOperation *)self initWithURL:v5];

  return v8;
}

- (BRShareOperation)initWithDirectConnection
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(BRShareOperation *)self initWithURL:0];
  if (v2)
  {
    v3 = brc_bread_crumbs((uint64_t)"-[BRShareOperation initWithDirectConnection]", 223);
    id v4 = brc_default_log(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412546;
      int v7 = v2;
      __int16 v8 = 2112;
      __int16 v9 = v3;
      _os_log_impl(&dword_19ED3F000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ initialized without share/url, but using default connection%@", (uint8_t *)&v6, 0x16u);
    }
  }
  return v2;
}

- (BRShareOperation)initWithItemIdentifier:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRShareOperation;
  int v6 = [(BROperation *)&v13 init];
  if (v6)
  {
    int v7 = brc_bread_crumbs((uint64_t)"-[BRShareOperation initWithItemIdentifier:]", 231);
    __int16 v8 = brc_default_log(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[BRShareOperation initWithItemIdentifier:]();
    }

    objc_storeStrong((id *)&v6->_itemID, a3);
    __int16 v9 = +[BRDaemonConnection defaultConnection];
    uint64_t v10 = [v9 remoteObjectProxy];
    remoteObject = v6->_remoteObject;
    v6->_remoteObject = (BRShareOperationProtocol *)v10;
  }
  return v6;
}

- (BRShareOperation)initWithURL:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BRShareOperation;
  id v5 = [(BROperation *)&v32 init];
  if (!v5)
  {
LABEL_15:
    id v21 = v5;
    goto LABEL_16;
  }
  int v6 = brc_bread_crumbs((uint64_t)"-[BRShareOperation initWithURL:]", 241);
  int v7 = brc_default_log(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[BRShareOperation initWithURL:]();
  }

  id v31 = 0;
  [v4 getResourceValue:&v31 forKey:@"FPOriginalDocumentURL" error:0];
  id v8 = v31;
  if (v8)
  {
    __int16 v9 = brc_bread_crumbs((uint64_t)"-[BRShareOperation initWithURL:]", 245);
    uint64_t v10 = brc_default_log(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v34 = v4;
      __int16 v35 = 2112;
      id v36 = v8;
      __int16 v37 = 2112;
      v38 = v9;
      _os_log_debug_impl(&dword_19ED3F000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] originalURL found on %@: %@%@", buf, 0x20u);
    }

    id v11 = v8;
    id v4 = v11;
  }
  uint64_t v12 = [v4 filePathURL];
  objc_super v13 = (void *)*((void *)v5 + 41);
  *((void *)v5 + 41) = v12;

  if (!v4 || *((void *)v5 + 41))
  {
    dispatch_group_t v14 = dispatch_group_create();
    v15 = (void *)*((void *)v5 + 37);
    *((void *)v5 + 37) = v14;

    int ShouldUseDirectConnection = BRShareProcessShouldUseDirectConnection();
    if (!v4 || ShouldUseDirectConnection)
    {
      v18 = +[BRDaemonConnection defaultConnection];
      uint64_t v19 = [v18 remoteObjectProxy];
      v20 = (void *)*((void *)v5 + 40);
      *((void *)v5 + 40) = v19;
    }
    else
    {
      dispatch_group_enter(*((dispatch_group_t *)v5 + 37));
      v17 = [MEMORY[0x1E4F28CB8] defaultManager];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __32__BRShareOperation_initWithURL___block_invoke;
      v28[3] = &unk_1E59AD870;
      id v29 = v5;
      id v30 = v4;
      [v17 getFileProviderServicesForItemAtURL:v30 completionHandler:v28];

      v18 = v29;
    }

    goto LABEL_15;
  }
  uint64_t v23 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"url", v4);
  v24 = (void *)*((void *)v5 + 38);
  *((void *)v5 + 38) = v23;

  v25 = brc_bread_crumbs((uint64_t)"-[BRShareOperation initWithURL:]", 251);
  v26 = brc_default_log(0);
  if (os_log_type_enabled(v26, (os_log_type_t)0x90u)) {
    -[BRShareOperation initWithURL:]();
  }

  id v27 = v5;
LABEL_16:

  return (BRShareOperation *)v5;
}

void __32__BRShareOperation_initWithURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = v6;
  if (!v5 || v6)
  {
    if (objc_msgSend(v6, "br_isFileProviderErrorCode:", -1005)
      && ([v7 userInfo],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          [v12 objectForKeyedSubscript:*MEMORY[0x1E4F25C28]],
          objc_super v13 = objc_claimAutoreleasedReturnValue(),
          v13,
          v12,
          v13))
    {
      dispatch_group_t v14 = (void *)MEMORY[0x1E4F28C58];
      v15 = [*(id *)(a1 + 40) path];
      uint64_t v16 = objc_msgSend(v14, "brc_errorNotInCloud:", v15);
      uint64_t v17 = *(void *)(a1 + 32);
      v18 = *(void **)(v17 + 304);
      *(void *)(v17 + 304) = v16;

      id v19 = *(id *)(*(void *)(a1 + 32) + 304);
      v20 = brc_bread_crumbs((uint64_t)"-[BRShareOperation initWithURL:]_block_invoke", 267);
      id v21 = brc_default_log(0);
      if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
      {
        uint64_t v22 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        uint64_t v31 = v22;
        __int16 v32 = 2112;
        id v33 = v19;
        __int16 v34 = 2112;
        __int16 v35 = v20;
        _os_log_error_impl(&dword_19ED3F000, v21, (os_log_type_t)0x90u, "[ERROR] failed to get services for url %@ (%@)%@", buf, 0x20u);
      }
    }
    else
    {
      v20 = brc_bread_crumbs((uint64_t)"-[BRShareOperation initWithURL:]_block_invoke", 269);
      id v21 = brc_default_log(0);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        uint64_t v25 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        uint64_t v31 = v25;
        __int16 v32 = 2112;
        id v33 = v7;
        __int16 v34 = 2112;
        __int16 v35 = v20;
        _os_log_fault_impl(&dword_19ED3F000, v21, OS_LOG_TYPE_FAULT, "[CRIT] failed to get services for url %@ (%@)%@", buf, 0x20u);
      }
      id v19 = v7;
    }

    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 296));
  }
  else
  {
    uint64_t v8 = [v5 objectForKeyedSubscript:@"com.apple.CloudDocs.private.SharingOperation"];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void **)(v9 + 312);
    *(void *)(v9 + 312) = v8;

    id v11 = *(void **)(*(void *)(a1 + 32) + 312);
    if (v11)
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __32__BRShareOperation_initWithURL___block_invoke_53;
      v26[3] = &unk_1E59AD848;
      id v27 = *(id *)(a1 + 40);
      id v28 = 0;
      id v29 = *(id *)(a1 + 32);
      [v11 getFileProviderConnectionWithCompletionHandler:v26];
    }
    else
    {
      uint64_t v23 = brc_bread_crumbs((uint64_t)"-[BRShareOperation initWithURL:]_block_invoke", 276);
      v24 = brc_default_log(0);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        __32__BRShareOperation_initWithURL___block_invoke_cold_1();
      }

      dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 296));
    }
  }
}

void __32__BRShareOperation_initWithURL___block_invoke_53(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!v5 || a3)
  {
    objc_super v13 = brc_bread_crumbs((uint64_t)"-[BRShareOperation initWithURL:]_block_invoke", 282);
    dispatch_group_t v14 = brc_default_log(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      __32__BRShareOperation_initWithURL___block_invoke_53_cold_1();
    }

    uint64_t v10 = a1 + 48;
  }
  else
  {
    id v6 = BRCXPCSharingOperationInterface();
    [v5 setRemoteObjectInterface:v6];

    int v7 = brc_bread_crumbs((uint64_t)"-[BRShareOperation initWithURL:]_block_invoke", 287);
    uint64_t v8 = brc_default_log(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      uint64_t v16 = v7;
      _os_log_impl(&dword_19ED3F000, v8, OS_LOG_TYPE_INFO, "[INFO] got sharing service proxy%@", (uint8_t *)&v15, 0xCu);
    }

    uint64_t v9 = [v5 remoteObjectProxy];
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v10 = a1 + 48;
    uint64_t v12 = *(void **)(v11 + 320);
    *(void *)(v11 + 320) = v9;

    [v5 resume];
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)v10 + 296));
}

- (id)remoteObject
{
  serviceGroup = self->_serviceGroup;
  if (serviceGroup) {
    dispatch_group_wait(serviceGroup, 0xFFFFFFFFFFFFFFFFLL);
  }
  remoteObject = self->_remoteObject;
  if (remoteObject)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __32__BRShareOperation_remoteObject__block_invoke;
    v13[3] = &unk_1E59AD448;
    v13[4] = self;
    id v5 = [(BRShareOperationProtocol *)remoteObject remoteObjectProxyWithErrorHandler:v13];
  }
  else
  {
    int v6 = BRIsFPFSEnabled(0, a2);
    int v7 = (id *)&protocolRef_BRShareOperationFPFSProtocol;
    if (!v6) {
      int v7 = (id *)&protocolRef_BRShareOperationLegacyProtocol;
    }
    id v8 = *v7;
    initError = self->_initError;
    if (initError)
    {
      uint64_t v10 = initError;
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4099 userInfo:0];
    }
    uint64_t v11 = v10;
    id v5 = [(FPXPCAutomaticErrorProxy *)[BRXPCAutomaticErrorProxy alloc] initWithConnection:0 protocol:v8 orError:v10 name:@"broken sharing service proxy" requestPid:0];
  }

  return v5;
}

uint64_t __32__BRShareOperation_remoteObject__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:a2];
}

- (id)remoteFPFSObject
{
  if (BRIsFPFSEnabled(self, a2))
  {
    v3 = [(BRShareOperation *)self remoteObject];
  }
  else
  {
    id v4 = brc_bread_crumbs((uint64_t)"-[BRShareOperation remoteFPFSObject]", 320);
    id v5 = brc_default_log(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BROperation remoteFPFSObject]();
    }

    int v6 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorMethodNotImplemented:", sel_remoteFPFSObject);
    [(BROperation *)self completedWithResult:0 error:v6];

    v3 = 0;
  }

  return v3;
}

- (BOOL)shouldUseDirectConnection
{
  v3 = [(BRShareOperation *)self itemID];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(BRShareOperation *)self url];
    BOOL v4 = v5 == 0;
  }
  return v4;
}

- (id)directConnectionFPFSObject
{
  if (BRIsFPFSEnabled(self, a2))
  {
    v3 = [(BRShareOperation *)self remoteObject];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)remoteLegacyObject
{
  if (BRIsFPFSEnabled(self, a2))
  {
    v3 = brc_bread_crumbs((uint64_t)"-[BRShareOperation remoteLegacyObject]", 346);
    BOOL v4 = brc_default_log(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[BROperation remoteLegacyObject]();
    }

    id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorMethodNotImplemented:", sel_remoteLegacyObject);
    [(BROperation *)self completedWithResult:0 error:v5];

    int v6 = 0;
  }
  else
  {
    int v6 = [(BRShareOperation *)self remoteObject];
  }

  return v6;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_sharingService, 0);
  objc_storeStrong((id *)&self->_initError, 0);

  objc_storeStrong((id *)&self->_serviceGroup, 0);
}

- (void)initWithShare:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_19ED3F000, v0, (uint64_t)v0, "[DEBUG] %@ initialized without share/url, but using default connection%@", v1);
}

- (void)initWithItemIdentifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_19ED3F000, v0, (uint64_t)v0, "[DEBUG] init shareOperation with itemID %@%@", v1);
}

- (void)initWithURL:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_19ED3F000, v0, (os_log_type_t)0x90u, "[ERROR] failed to fetch full file path url for %@%@", v1, 0x16u);
}

- (void)initWithURL:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_19ED3F000, v0, (uint64_t)v0, "[DEBUG] init shareOperation with URL %@%@", v1);
}

void __32__BRShareOperation_initWithURL___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [v1 allKeys];
  OUTLINED_FUNCTION_0_1();
  _os_log_fault_impl(&dword_19ED3F000, v0, OS_LOG_TYPE_FAULT, "[CRIT] services didn't contain sharing service (contained %@)%@", v3, 0x16u);
}

void __32__BRShareOperation_initWithURL___block_invoke_53_cold_1()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_8_0();
  uint64_t v5 = v0;
  __int16 v6 = v1;
  uint64_t v7 = v2;
  _os_log_fault_impl(&dword_19ED3F000, v3, OS_LOG_TYPE_FAULT, "[CRIT] failed to get sharing service connection for url %@ (%@)%@", v4, 0x20u);
}

@end