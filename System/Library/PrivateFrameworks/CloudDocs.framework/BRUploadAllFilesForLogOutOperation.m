@interface BRUploadAllFilesForLogOutOperation
- (BOOL)shouldKeepDataLocal;
- (BRGlobalProgressProxy)progress;
- (BRUploadAllFilesForLogOutOperation)init;
- (NSString)description;
- (id)uploadAllFilesCompletionBlock;
- (void)cancel;
- (void)evictAllFilesInGroup:(id)a3;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)setProgress:(id)a3;
- (void)setShouldKeepDataLocal:(BOOL)a3;
- (void)setUploadAllFilesCompletionBlock:(id)a3;
@end

@implementation BRUploadAllFilesForLogOutOperation

- (BRUploadAllFilesForLogOutOperation)init
{
  v13.receiver = self;
  v13.super_class = (Class)BRUploadAllFilesForLogOutOperation;
  v2 = [(BROperation *)&v13 init];
  if (v2)
  {
    v3 = [BRGlobalProgressProxy alloc];
    uint64_t v4 = [(BRGlobalProgressProxy *)v3 initWithGlobalProgressKind:*MEMORY[0x1E4F28880]];
    progress = v2->_progress;
    v2->_progress = (BRGlobalProgressProxy *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    errorsByContainerID = v2->_errorsByContainerID;
    v2->_errorsByContainerID = v6;

    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    opQueue = v2->_opQueue;
    v2->_opQueue = v8;

    [(NSOperationQueue *)v2->_opQueue setMaxConcurrentOperationCount:8];
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    hiddenContainersWithError = v2->_hiddenContainersWithError;
    v2->_hiddenContainersWithError = v10;
  }
  return v2;
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)BRUploadAllFilesForLogOutOperation;
  [(BROperation *)&v4 cancel];
  v3 = self;
  objc_sync_enter(v3);
  [(NSOperationQueue *)v3->_opQueue cancelAllOperations];
  objc_sync_exit(v3);
}

- (NSString)description
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = NSString;
  v8.receiver = v2;
  v8.super_class = (Class)BRUploadAllFilesForLogOutOperation;
  objc_super v4 = [(BROperation *)&v8 description];
  v5 = [(NSOperationQueue *)v2->_opQueue operations];
  v6 = [v3 stringWithFormat:@"%@ sub=%@", v4, v5];

  objc_sync_exit(v2);

  return (NSString *)v6;
}

- (void)evictAllFilesInGroup:(id)a3
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  v3 = a3;
  memset(v71, 0, sizeof(v71));
  __brc_create_section(0, (uint64_t)"-[BRUploadAllFilesForLogOutOperation evictAllFilesInGroup:]", 70, v71);
  objc_super v4 = brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation evictAllFilesInGroup:]", 70);
  v5 = brc_default_log(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[BRUploadAllFilesForLogOutOperation evictAllFilesInGroup:]();
  }

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id obj = +[BRContainer documentContainers];
  uint64_t v46 = [obj countByEnumeratingWithState:&v67 objects:v81 count:16];
  if (v46)
  {
    v6 = &v53;
    uint64_t v45 = *(void *)v68;
    v43 = @"com.apple.CloudDocs";
    do
    {
      uint64_t v47 = 0;
      do
      {
        if (*(void *)v68 != v45) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v67 + 1) + 8 * v47);
        objc_super v8 = brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation evictAllFilesInGroup:]", 73);
        v9 = brc_default_log(1);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = [v7 identifier];
          *(_DWORD *)buf = 138412546;
          v73 = v10;
          __int16 v74 = 2112;
          v75 = v8;
          _os_log_impl(&dword_19ED3F000, v9, OS_LOG_TYPE_DEFAULT, "[NOTICE] evicting files in %@%@", buf, 0x16u);
        }
        v11 = [v7 documentsURL];
        v80 = v11;
        v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
        objc_super v13 = (void *)[v12 mutableCopy];

        if ((BRIsFPFSEnabled(v14, v15) & 1) == 0)
        {
          v16 = [v7 identifier];
          int v17 = [v16 isEqualToString:v43];

          if (v17)
          {
            v18 = [v13 objectAtIndexedSubscript:0];
            [v13 removeAllObjects];
            v48 = [MEMORY[0x1E4F28CB8] defaultManager];
            long long v65 = 0u;
            long long v66 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            v19 = [v18 path];
            id v62 = 0;
            v20 = [v48 contentsOfDirectoryAtPath:v19 error:&v62];
            id v21 = v62;

            uint64_t v22 = [v20 countByEnumeratingWithState:&v63 objects:v79 count:16];
            if (v22)
            {
              uint64_t v23 = *(void *)v64;
              do
              {
                for (uint64_t i = 0; i != v22; ++i)
                {
                  if (*(void *)v64 != v23) {
                    objc_enumerationMutation(v20);
                  }
                  v25 = objc_msgSend(v18, "URLByAppendingPathComponent:", *(void *)(*((void *)&v63 + 1) + 8 * i), v43);
                  [v13 addObject:v25];
                }
                uint64_t v22 = [v20 countByEnumeratingWithState:&v63 objects:v79 count:16];
              }
              while (v22);
            }

            if (v21)
            {
              v26 = brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation evictAllFilesInGroup:]", 91);
              v27 = brc_default_log(0);
              if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
              {
                *(_DWORD *)buf = 138412546;
                v73 = v18;
                __int16 v74 = 2112;
                v75 = v26;
                _os_log_error_impl(&dword_19ED3F000, v27, (os_log_type_t)0x90u, "[ERROR] couldn't enumerate %@%@", buf, 0x16u);
              }
            }
          }
        }
        v28 = brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation evictAllFilesInGroup:]", 96);
        v29 = brc_default_log(1);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v73 = v13;
          __int16 v74 = 2112;
          v75 = v28;
          _os_log_debug_impl(&dword_19ED3F000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] evicting urls: %@%@", buf, 0x16u);
        }

        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id v30 = v13;
        uint64_t v31 = [v30 countByEnumeratingWithState:&v58 objects:v78 count:16];
        if (v31)
        {
          uint64_t v32 = *(void *)v59;
          uint64_t v49 = *(void *)v59;
          do
          {
            uint64_t v33 = 0;
            do
            {
              if (*(void *)v59 != v32) {
                objc_enumerationMutation(v30);
              }
              v34 = *(void **)(*((void *)&v58 + 1) + 8 * v33);
              dispatch_group_enter(v3);
              long long v54 = 0uLL;
              uint64_t v55 = 0;
              __brc_create_section(0, (uint64_t)"-[BRUploadAllFilesForLogOutOperation evictAllFilesInGroup:]", 101, &v54);
              v35 = brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation evictAllFilesInGroup:]", 101);
              v36 = brc_default_log(1);
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
              {
                v38 = v6;
                v39 = v3;
                id v40 = v30;
                v41 = (void *)v54;
                v42 = [v34 path];
                *(_DWORD *)buf = 134218498;
                v73 = v41;
                __int16 v74 = 2112;
                v75 = v42;
                __int16 v76 = 2112;
                v77 = v35;
                _os_log_debug_impl(&dword_19ED3F000, v36, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx evicting %@%@", buf, 0x20u);

                uint64_t v32 = v49;
                id v30 = v40;
                v3 = v39;
                v6 = v38;
              }

              long long v56 = v54;
              uint64_t v57 = v55;
              v37 = [[BREvictItemOperation alloc] initWithURL:v34];
              v51[0] = MEMORY[0x1E4F143A8];
              v51[1] = 3221225472;
              v51[2] = __59__BRUploadAllFilesForLogOutOperation_evictAllFilesInGroup___block_invoke;
              v51[3] = &unk_1E59AE998;
              *(_OWORD *)v6 = v56;
              v6[2] = v57;
              v51[4] = v34;
              v52 = v3;
              [(BREvictItemOperation *)v37 setEvictionCompletionBlock:v51];
              [(NSOperationQueue *)self->_opQueue addOperation:v37];

              ++v33;
            }
            while (v31 != v33);
            uint64_t v31 = [v30 countByEnumeratingWithState:&v58 objects:v78 count:16];
          }
          while (v31);
        }

        ++v47;
      }
      while (v47 != v46);
      uint64_t v46 = [obj countByEnumeratingWithState:&v67 objects:v81 count:16];
    }
    while (v46);
  }

  __brc_leave_section((uint64_t)v71);
}

void __59__BRUploadAllFilesForLogOutOperation_evictAllFilesInGroup___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = *(_OWORD *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 64);
  objc_super v4 = brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation evictAllFilesInGroup:]_block_invoke", 104);
  v5 = brc_default_log(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_super v8 = [*(id *)(a1 + 32) path];
    *(_DWORD *)buf = 134218498;
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    v16 = v4;
    _os_log_debug_impl(&dword_19ED3F000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx finished evicting data under %@%@", buf, 0x20u);
  }
  if (v3)
  {
    v6 = brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation evictAllFilesInGroup:]_block_invoke", 105);
    v7 = brc_default_log(0);
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u)) {
      __59__BRUploadAllFilesForLogOutOperation_evictAllFilesInGroup___block_invoke_cold_1();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  __brc_leave_section((uint64_t)&v9);
}

- (void)main
{
  objc_super v4 = "NO";
  if (a1) {
    objc_super v4 = "YES";
  }
  *(_DWORD *)buf = 136315394;
  *(void *)(buf + 4) = v4;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_19ED3F000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Request to set should keep local data on Sign Out to [%s]%@", buf, 0x16u);
}

void __42__BRUploadAllFilesForLogOutOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation main]_block_invoke", 127);
  v5 = brc_default_log(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_cold_1();
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_19(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  v5 = brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation main]_block_invoke", 140);
  uint64_t v6 = brc_default_log(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_19_cold_1();
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_20(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  memset(v16, 0, sizeof(v16));
  __brc_create_section(0, (uint64_t)"-[BRUploadAllFilesForLogOutOperation main]_block_invoke", 152, v16);
  v2 = brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation main]_block_invoke", 152);
  id v3 = brc_default_log(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_20_cold_1();
  }

  id v4 = +[BRRemoteUserDefaults sharedDefaults];
  v5 = [v4 excludedFilenamesWorthWarningAtLogout];

  uint64_t v6 = +[BRRemoteUserDefaults sharedDefaults];
  v7 = [v6 excludedExtensionsWorthPreserving];

  objc_super v8 = +[BRContainer allContainers];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_22;
  v13[3] = &unk_1E59AEA10;
  id v9 = v5;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_msgSend(v8, "br_any_of:", v13);

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    v11 = brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation main]_block_invoke", 160);
    uint64_t v12 = brc_default_log(1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v11;
      _os_log_impl(&dword_19ED3F000, v12, OS_LOG_TYPE_DEFAULT, "[NOTICE] there are files that we're never going to upload on the file system%@", buf, 0xCu);
    }
  }
  __brc_leave_section((uint64_t)v16);
}

uint64_t __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_22(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation main]_block_invoke", 156);
  v5 = brc_default_log(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v3 identifier];
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_19ED3F000, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] checking for excluded files in %@%@", (uint8_t *)&v9, 0x16u);
  }
  if ([v3 isDocumentScopePublic]) {
    uint64_t v7 = [v3 containsExcludedDocumentsOnTheFSWithExcludedButPreservedFilename:*(void *)(a1 + 32) excludedButPreservedExtensions:*(void *)(a1 + 40) andStampUploadedAppWithXattr:1];
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

void __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_27()
{
  v0 = brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation main]_block_invoke", 167);
  v1 = brc_default_log(1);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_27_cold_1();
  }
}

void __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_28(uint64_t a1)
{
  long long v15 = *(_OWORD *)(a1 + 64);
  uint64_t v16 = *(void *)(a1 + 80);
  v2 = brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation main]_block_invoke", 172);
  id v3 = brc_default_log(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_28_cold_2();
  }

  id v4 = dispatch_group_create();
  if (BRIsFPFSEnabled(v4, v5) & 1) != 0 || ([*(id *)(a1 + 32) shouldKeepDataLocal])
  {
    uint64_t v6 = brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation main]_block_invoke", 178);
    uint64_t v7 = brc_default_log(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_28_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 32) evictAllFilesInGroup:v4];
  }
  objc_super v8 = [*(id *)(a1 + 32) callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_29;
  block[3] = &unk_1E59AEA58;
  long long v13 = *(_OWORD *)(a1 + 64);
  uint64_t v14 = *(void *)(a1 + 80);
  long long v9 = *(_OWORD *)(a1 + 32);
  long long v12 = *(_OWORD *)(a1 + 48);
  long long v11 = v9;
  dispatch_group_notify(v4, v8, block);

  __brc_leave_section((uint64_t)&v15);
}

void __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_29(uint64_t a1)
{
  long long v7 = *(_OWORD *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 80);
  v2 = brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation main]_block_invoke", 182);
  id v3 = brc_default_log(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_29_cold_1();
  }

  id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v4 || (id v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) != 0)
  {
    id v5 = v4;
  }
  else
  {
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      uint64_t v6 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"BRCloudDocsErrorDomain", 1000, 0, v7, v8);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v6 = v5;
LABEL_7:
  objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v6, v7, v8);

  __brc_leave_section((uint64_t)&v7);
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (__CFString *)a4;
  id v7 = a3;
  uint64_t v8 = brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation finishWithResult:error:]", 199);
  long long v9 = brc_default_log(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = @"success";
    if (v6) {
      id v10 = v6;
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v19 = v10;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl(&dword_19ED3F000, v9, OS_LOG_TYPE_DEFAULT, "[NOTICE] uploading all files for logout finished\n  status: %@%@", buf, 0x16u);
  }

  [(BRProgressProxy *)self->_progress stop];
  long long v11 = brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation finishWithResult:error:]", 203);
  long long v12 = brc_default_log(1);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[BRUploadAllFilesForLogOutOperation finishWithResult:error:]();
  }

  uint64_t v13 = [(BRUploadAllFilesForLogOutOperation *)self uploadAllFilesCompletionBlock];
  uint64_t v14 = (void *)v13;
  if (v13)
  {
    (*(void (**)(uint64_t, __CFString *))(v13 + 16))(v13, v6);
    [(BRUploadAllFilesForLogOutOperation *)self setUploadAllFilesCompletionBlock:0];
  }

  long long v15 = brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation finishWithResult:error:]", 206);
  uint64_t v16 = brc_default_log(1);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[BRUploadAllFilesForLogOutOperation finishWithResult:error:]();
  }

  v17.receiver = self;
  v17.super_class = (Class)BRUploadAllFilesForLogOutOperation;
  [(BROperation *)&v17 finishWithResult:v7 error:v6];
}

- (id)uploadAllFilesCompletionBlock
{
  return objc_getProperty(self, a2, 304, 1);
}

- (void)setUploadAllFilesCompletionBlock:(id)a3
{
}

- (BRGlobalProgressProxy)progress
{
  return (BRGlobalProgressProxy *)objc_getProperty(self, a2, 296, 1);
}

- (void)setProgress:(id)a3
{
}

- (BOOL)shouldKeepDataLocal
{
  return self->_shouldKeepDataLocal;
}

- (void)setShouldKeepDataLocal:(BOOL)a3
{
  self->_shouldKeepDataLocal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_opQueue, 0);
  objc_storeStrong((id *)&self->_hiddenContainersWithError, 0);
  objc_storeStrong((id *)&self->_errorsByContainerID, 0);
  objc_storeStrong(&self->_uploadAllFilesCompletionBlock, 0);

  objc_storeStrong((id *)&self->_progress, 0);
}

- (void)evictAllFilesInGroup:.cold.1()
{
  OUTLINED_FUNCTION_7_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] ┏%llx evicting data%@");
}

void __59__BRUploadAllFilesForLogOutOperation_evictAllFilesInGroup___block_invoke_cold_1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_19ED3F000, v1, (os_log_type_t)0x90u, "[ERROR] eviction error: %@%@", v2, 0x16u);
}

void __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] Waiting for FPFS migration: %@%@");
}

void __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_19_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] uploading all files: %@%@");
}

void __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_20_cold_1()
{
  OUTLINED_FUNCTION_7_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] ┏%llx checking for excluded files%@");
}

void __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_27_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] Request to set should keep local data on Sign Out done%@", v2, v3, v4, v5, v6);
}

void __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_28_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] Skip evicting all files%@", v2, v3, v4, v5, v6);
}

void __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_28_cold_2()
{
  OUTLINED_FUNCTION_7_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] ┳%llx operations finished%@");
}

void __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_29_cold_1()
{
  OUTLINED_FUNCTION_7_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] ┳%llx container eviction finished%@");
}

- (void)finishWithResult:error:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] calling super%@", v2, v3, v4, v5, v6);
}

- (void)finishWithResult:error:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] calling callback%@", v2, v3, v4, v5, v6);
}

@end