@interface BRListNonLocalVersionsOperation
- (BOOL)__advanceToState:(char)a3 result:(id)a4 error:(id)a5;
- (BOOL)__finishIfCancelled;
- (BOOL)_advanceToState:(char)a3 result:(id)a4 error:(id)a5;
- (BOOL)_setVersionStoreForDocumentAtURL:(id)a3 error:(id *)a4;
- (BOOL)includeCachedVersions;
- (BOOL)isConcurrent;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BRListNonLocalVersionsOperation)initWithDocumentURL:(id)a3;
- (NSError)error;
- (NSMutableArray)versions;
- (NSString)description;
- (id)fetchingVersionsDoneBlock;
- (void)_addVersion:(id)a3;
- (void)_senderInvalidate;
- (void)cancel;
- (void)dealloc;
- (void)newCachedVersionAtURL:(id)a3 size:(id)a4 etag:(id)a5 hasThumbnail:(BOOL)a6 displayName:(id)a7 lastEditorDeviceName:(id)a8 lastEditorNameComponents:(id)a9 modificationDate:(id)a10;
- (void)newFaultVersionAtURL:(id)a3 faultURL:(id)a4 faultExtension:(id)a5 etag:(id)a6 hasThumbnail:(BOOL)a7 displayName:(id)a8 lastEditorDeviceName:(id)a9 lastEditorNameComponents:(id)a10 modificationDate:(id)a11;
- (void)newThumbnailForVersionWithEtag:(id)a3;
- (void)setExecuting:(BOOL)a3;
- (void)setFetchingVersionsDoneBlock:(id)a3;
- (void)setFinished:(BOOL)a3;
- (void)setIncludeCachedVersions:(BOOL)a3;
- (void)start;
- (void)versionsDone;
@end

@implementation BRListNonLocalVersionsOperation

- (NSError)error
{
  return 0;
}

- (BRListNonLocalVersionsOperation)initWithDocumentURL:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRListNonLocalVersionsOperation;
  v6 = [(BRListNonLocalVersionsOperation *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_documentURL, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    versions = v7->_versions;
    v7->_versions = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    versionsByEtag = v7->_versionsByEtag;
    v7->_versionsByEtag = v10;
  }
  return v7;
}

- (void)dealloc
{
  [(BRListNonLocalVersionsOperation *)self _senderInvalidate];
  v3.receiver = self;
  v3.super_class = (Class)BRListNonLocalVersionsOperation;
  [(BRListNonLocalVersionsOperation *)&v3 dealloc];
}

- (BOOL)isConcurrent
{
  return 1;
}

- (void)setExecuting:(BOOL)a3
{
  [(BRListNonLocalVersionsOperation *)self willChangeValueForKey:@"isExecuting"];
  self->_executing = a3;

  [(BRListNonLocalVersionsOperation *)self didChangeValueForKey:@"isExecuting"];
}

- (void)setFinished:(BOOL)a3
{
  [(BRListNonLocalVersionsOperation *)self willChangeValueForKey:@"isFinished"];
  self->_finished = a3;

  [(BRListNonLocalVersionsOperation *)self didChangeValueForKey:@"isFinished"];
}

- (void)_senderInvalidate
{
  [(BRNonLocalVersionSending *)self->_sender invalidate];
  sender = self->_sender;
  self->_sender = 0;
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)BRListNonLocalVersionsOperation;
  [(BRListNonLocalVersionsOperation *)&v4 cancel];
  objc_super v3 = self;
  objc_sync_enter(v3);
  if ([(BRListNonLocalVersionsOperation *)v3 isExecuting]) {
    [(BRListNonLocalVersionsOperation *)v3 __finishIfCancelled];
  }
  objc_sync_exit(v3);
}

- (BOOL)__finishIfCancelled
{
  if ([(BRListNonLocalVersionsOperation *)self isFinished])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    int v3 = [(BRListNonLocalVersionsOperation *)self isCancelled];
    if (v3)
    {
      objc_super v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
      BOOL v5 = [(BRListNonLocalVersionsOperation *)self __advanceToState:2 result:0 error:v4];

      LOBYTE(v3) = v5;
    }
  }
  return v3;
}

- (BOOL)__advanceToState:(char)a3 result:(id)a4 error:(id)a5
{
  int v6 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (![(BRListNonLocalVersionsOperation *)self isFinished])
  {
    int state = self->_state;
    if (state < v6)
    {
      while (state != 1)
      {
        if (!(_BYTE)state)
        {
          fetchingVersionsDoneBlock = (void (**)(id, id, id))self->_fetchingVersionsDoneBlock;
          if (fetchingVersionsDoneBlock)
          {
            fetchingVersionsDoneBlock[2](fetchingVersionsDoneBlock, v8, v9);
            [(BRListNonLocalVersionsOperation *)self setFetchingVersionsDoneBlock:0];
          }
          LOBYTE(state) = 1;
          goto LABEL_9;
        }
LABEL_10:
        if (v6 <= (char)state) {
          goto LABEL_11;
        }
      }
      LOBYTE(state) = 2;
LABEL_9:
      self->_int state = state;
      goto LABEL_10;
    }
LABEL_11:
    if (state != 2)
    {
      BOOL v14 = 0;
      goto LABEL_17;
    }
    [(BRListNonLocalVersionsOperation *)self setExecuting:0];
    [(BRListNonLocalVersionsOperation *)self setFinished:1];
    v12 = brc_bread_crumbs((uint64_t)"-[BRListNonLocalVersionsOperation __advanceToState:result:error:]", 233);
    objc_super v13 = brc_default_log(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 138412802;
      v17 = self;
      __int16 v18 = 2112;
      id v19 = v9;
      __int16 v20 = 2112;
      v21 = v12;
      _os_log_debug_impl(&dword_19ED3F000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ did finish with error %@%@", (uint8_t *)&v16, 0x20u);
    }

    [(BRListNonLocalVersionsOperation *)self _senderInvalidate];
  }
  BOOL v14 = 1;
LABEL_17:

  return v14;
}

- (BOOL)_advanceToState:(char)a3 result:(id)a4 error:(id)a5
{
  uint64_t v6 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  if ([(BRListNonLocalVersionsOperation *)v10 __finishIfCancelled]) {
    char v11 = 1;
  }
  else {
    char v11 = [(BRListNonLocalVersionsOperation *)v10 __advanceToState:v6 result:v8 error:v9];
  }
  objc_sync_exit(v10);

  return v11;
}

- (BOOL)_setVersionStoreForDocumentAtURL:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F63BE8];
  id v7 = a3;
  id v8 = [v6 manager];
  id v9 = [v8 permanentStorageForItemAtURL:v7 allocateIfNone:0 error:a4];

  versionsStore = self->_versionsStore;
  self->_versionsStore = v9;

  LOBYTE(v9) = self->_versionsStore != 0;
  return (char)v9;
}

- (void)start
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] not starting %@%@");
}

void __40__BRListNonLocalVersionsOperation_start__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_super v4 = brc_bread_crumbs((uint64_t)"-[BRListNonLocalVersionsOperation start]_block_invoke", 278);
  BOOL v5 = brc_default_log(0);
  if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v15 = 138412802;
    uint64_t v16 = v6;
    __int16 v17 = 2112;
    id v18 = v3;
    __int16 v19 = 2112;
    __int16 v20 = v4;
    _os_log_error_impl(&dword_19ED3F000, v5, (os_log_type_t)0x90u, "[ERROR] failed getting a sender for '%@' - %@%@", (uint8_t *)&v15, 0x20u);
  }

  if (!v3)
  {
    id v7 = brc_bread_crumbs((uint64_t)"-[BRListNonLocalVersionsOperation start]_block_invoke", 279);
    id v8 = brc_default_log(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __40__BRListNonLocalVersionsOperation_start__block_invoke_cold_1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  [*(id *)(a1 + 40) _advanceToState:2 result:0 error:v3];
}

void __40__BRListNonLocalVersionsOperation_start__block_invoke_94(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (a2)
  {
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __40__BRListNonLocalVersionsOperation_start__block_invoke_95;
    v40[3] = &unk_1E59AE220;
    id v41 = *(id *)(a1 + 32);
    id v42 = v8;
    uint64_t v43 = *(void *)(a1 + 40);
    id v9 = v8;
    uint64_t v10 = [a2 remoteObjectProxyWithErrorHandler:v40];
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void **)(v11 + 280);
    *(void *)(v11 + 280) = v10;

    uint64_t v13 = *(void **)(a1 + 40);
    id v39 = v9;
    char v14 = [v13 _setVersionStoreForDocumentAtURL:v7 error:&v39];
    id v8 = v39;

    if (v14)
    {
      uint64_t v15 = *(void *)(a1 + 40);
      uint64_t v16 = *(void **)(v15 + 280);
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __40__BRListNonLocalVersionsOperation_start__block_invoke_96;
      v38[3] = &unk_1E59AD448;
      v38[4] = v15;
      [v16 listNonLocalVersionsWithReply:v38];
    }
    else
    {
      __int16 v19 = brc_bread_crumbs((uint64_t)"-[BRListNonLocalVersionsOperation start]_block_invoke", 298);
      __int16 v20 = brc_default_log(0);
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        id v45 = v7;
        __int16 v46 = 2112;
        id v47 = v8;
        __int16 v48 = 2112;
        v49 = v19;
        _os_log_error_impl(&dword_19ED3F000, v20, (os_log_type_t)0x90u, "[ERROR] failed setting the version store for '%@' - %@%@", buf, 0x20u);
      }

      if (!v8)
      {
        v30 = brc_bread_crumbs((uint64_t)"-[BRListNonLocalVersionsOperation start]_block_invoke", 299);
        v31 = brc_default_log(0);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
          __40__BRListNonLocalVersionsOperation_start__block_invoke_cold_1((uint64_t)v30, v31, v32, v33, v34, v35, v36, v37);
        }
      }
      [*(id *)(a1 + 40) _advanceToState:2 result:0 error:v8];
    }
  }
  else
  {
    __int16 v17 = brc_bread_crumbs((uint64_t)"-[BRListNonLocalVersionsOperation start]_block_invoke", 286);
    id v18 = brc_default_log(0);
    if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
    {
      uint64_t v21 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      id v45 = v21;
      __int16 v46 = 2112;
      id v47 = v8;
      __int16 v48 = 2112;
      v49 = v17;
      _os_log_error_impl(&dword_19ED3F000, v18, (os_log_type_t)0x90u, "[ERROR] failed getting a sender for '%@' - %@%@", buf, 0x20u);
    }

    if (!v8)
    {
      uint64_t v22 = brc_bread_crumbs((uint64_t)"-[BRListNonLocalVersionsOperation start]_block_invoke", 287);
      v23 = brc_default_log(0);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
        __40__BRListNonLocalVersionsOperation_start__block_invoke_cold_1((uint64_t)v22, v23, v24, v25, v26, v27, v28, v29);
      }
    }
    [*(id *)(a1 + 40) _advanceToState:2 result:0 error:v8];
  }
}

void __40__BRListNonLocalVersionsOperation_start__block_invoke_95(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = brc_bread_crumbs((uint64_t)"-[BRListNonLocalVersionsOperation start]_block_invoke", 293);
  BOOL v5 = brc_default_log(0);
  if (os_log_type_enabled(v5, (os_log_type_t)0x90u)) {
    __40__BRListNonLocalVersionsOperation_start__block_invoke_95_cold_1(a1, (uint64_t)v4, v5);
  }

  [*(id *)(a1 + 48) _advanceToState:2 result:0 error:v3];
}

uint64_t __40__BRListNonLocalVersionsOperation_start__block_invoke_96(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = v2[32];
  }
  return [v2 _advanceToState:2 result:v3 error:a2];
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(NSURL *)self->_documentURL path];
  uint64_t v6 = [(NSMutableArray *)self->_versions count];
  if ([(BRListNonLocalVersionsOperation *)self isCancelled])
  {
    id v7 = "cancelled";
  }
  else if ([(BRListNonLocalVersionsOperation *)self isExecuting])
  {
    id v7 = "executing";
  }
  else if ([(BRListNonLocalVersionsOperation *)self isFinished])
  {
    id v7 = "finished";
  }
  else
  {
    int v8 = [(BRListNonLocalVersionsOperation *)self isReady];
    id v7 = "not ready";
    if (v8) {
      id v7 = "ready";
    }
  }
  id v9 = [v3 stringWithFormat:@"<%@ url:'%@' versions:%u %s>", v4, v5, v6, v7];

  return (NSString *)v9;
}

- (void)_addVersion:(id)a3
{
  id v4 = a3;
  BOOL v5 = brc_bread_crumbs((uint64_t)"-[BRListNonLocalVersionsOperation _addVersion:]", 321);
  uint64_t v6 = brc_default_log(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BRListNonLocalVersionsOperation _addVersion:]();
  }

  versionsByEtag = self->_versionsByEtag;
  int v8 = [v4 etag];
  [(NSMutableDictionary *)versionsByEtag setObject:v4 forKey:v8];

  [(NSMutableArray *)self->_versions addObject:v4];
}

- (void)newFaultVersionAtURL:(id)a3 faultURL:(id)a4 faultExtension:(id)a5 etag:(id)a6 hasThumbnail:(BOOL)a7 displayName:(id)a8 lastEditorDeviceName:(id)a9 lastEditorNameComponents:(id)a10 modificationDate:(id)a11
{
  BOOL v34 = a7;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  uint64_t v24 = [(NSMutableDictionary *)self->_versionsByEtag objectForKey:v19];
  if (v24) {
    goto LABEL_13;
  }
  uint64_t v33 = self;
  _CFURLPromiseSetPhysicalURL();
  id v32 = v16;
  id v25 = v20;
  if (![v18 length]) {
    goto LABEL_8;
  }
  MEMORY[0x19F3C3D20](v17, v18);
  id v26 = v18;
  [v26 bytes];
  if (sandbox_extension_consume() < 0)
  {
    int v31 = *__error();
    uint64_t v28 = brc_bread_crumbs((uint64_t)"-[BRListNonLocalVersionsOperation newFaultVersionAtURL:faultURL:faultExtension:etag:hasThumbnail:displayName:lastEditorDeviceName:lastEditorNameComponents:modificationDate:]", 346);
    uint64_t v29 = brc_default_log(0);
    if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      id v36 = v26;
      __int16 v37 = 1024;
      int v38 = v31;
      __int16 v39 = 2112;
      v40 = v28;
      _os_log_error_impl(&dword_19ED3F000, v29, (os_log_type_t)0x90u, "[ERROR] Failed to consume extension %@ %{errno}d%@", buf, 0x1Cu);
    }

    *__error() = v31;
LABEL_8:
    uint64_t v27 = (void *)_CFURLCopyPropertiesOfPromiseAtURL();
    goto LABEL_9;
  }
  uint64_t v27 = (void *)_CFURLCopyPropertiesOfPromiseAtURL();
  sandbox_extension_release();
LABEL_9:
  if (v27)
  {
    v30 = [v27 objectForKey:*MEMORY[0x1E4F1C5F8]];
    CFRelease(v27);
  }
  else
  {
    v30 = 0;
  }
  id v16 = v32;
  uint64_t v24 = [[BRNonLocalVersion alloc] initWithURL:v32 physicalURL:v17 size:v30 extension:v18 etag:v19 hasThumbnail:v34 displayName:v25 lastEditorDeviceName:v21 lastEditorNameComponents:v22 modificationDate:v23 versionsStore:v33->_versionsStore];
  [(BRListNonLocalVersionsOperation *)v33 _addVersion:v24];

  id v20 = v25;
LABEL_13:
}

- (void)newCachedVersionAtURL:(id)a3 size:(id)a4 etag:(id)a5 hasThumbnail:(BOOL)a6 displayName:(id)a7 lastEditorDeviceName:(id)a8 lastEditorNameComponents:(id)a9 modificationDate:(id)a10
{
  BOOL v12 = a6;
  id v23 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = [(NSMutableDictionary *)self->_versionsByEtag objectForKey:v17];
  if (!v22)
  {
    id v22 = [[BRNonLocalVersion alloc] initWithURL:v23 physicalURL:v23 size:v16 extension:0 etag:v17 hasThumbnail:v12 displayName:v18 lastEditorDeviceName:v19 lastEditorNameComponents:v20 modificationDate:v21 versionsStore:self->_versionsStore];
    [(BRListNonLocalVersionsOperation *)self _addVersion:v22];
  }
}

- (void)versionsDone
{
}

- (void)newThumbnailForVersionWithEtag:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_versionsByEtag objectForKeyedSubscript:a3];
  if (v3)
  {
    id v4 = brc_bread_crumbs((uint64_t)"-[BRListNonLocalVersionsOperation newThumbnailForVersionWithEtag:]", 414);
    BOOL v5 = brc_default_log(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[BRListNonLocalVersionsOperation newThumbnailForVersionWithEtag:]();
    }

    [v3 setHasThumbnail:1];
  }
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (NSMutableArray)versions
{
  return self->_versions;
}

- (BOOL)includeCachedVersions
{
  return self->_includeCachedVersions;
}

- (void)setIncludeCachedVersions:(BOOL)a3
{
  self->_includeCachedVersions = a3;
}

- (id)fetchingVersionsDoneBlock
{
  return self->_fetchingVersionsDoneBlock;
}

- (void)setFetchingVersionsDoneBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchingVersionsDoneBlock, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_versionsStore, 0);
  objc_storeStrong((id *)&self->_versionsByEtag, 0);
  objc_storeStrong((id *)&self->_versions, 0);

  objc_storeStrong((id *)&self->_documentURL, 0);
}

void __40__BRListNonLocalVersionsOperation_start__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, a2, a3, "[CRIT] Assertion failed: error != nil%@", a5, a6, a7, a8, 2u);
}

void __40__BRListNonLocalVersionsOperation_start__block_invoke_95_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_19ED3F000, log, (os_log_type_t)0x90u, "[ERROR] failed receiving versions for '%@' - %@%@", (uint8_t *)&v5, 0x20u);
}

- (void)_addVersion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] adding version: %@%@");
}

- (void)newThumbnailForVersionWithEtag:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] %@ now has a thumbnail%@");
}

@end