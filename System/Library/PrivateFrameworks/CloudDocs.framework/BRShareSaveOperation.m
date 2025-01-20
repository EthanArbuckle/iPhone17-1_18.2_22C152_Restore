@interface BRShareSaveOperation
+ (BOOL)shouldRetryShareSaveOnError:(id)a3;
- (BRShareSaveOperation)initWithShare:(id)a3;
- (BRShareSaveOperation)initWithShare:(id)a3 fileURL:(id)a4;
- (CKShare)share;
- (id)shareSaveCompletionBlock;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)setShare:(id)a3;
- (void)setShareSaveCompletionBlock:(id)a3;
@end

@implementation BRShareSaveOperation

- (BRShareSaveOperation)initWithShare:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BRShareSaveOperation;
  v5 = [(BRShareOperation *)&v8 initWithShare:v4];
  v6 = v5;
  if (v5) {
    [(BRShareSaveOperation *)v5 setShare:v4];
  }

  return v6;
}

- (BRShareSaveOperation)initWithShare:(id)a3 fileURL:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BRShareSaveOperation;
  v7 = [(BRShareOperation *)&v10 initWithURL:a4];
  objc_super v8 = v7;
  if (v7) {
    [(BRShareSaveOperation *)v7 setShare:v6];
  }

  return v8;
}

- (void)main
{
  v3 = [(BRShareOperation *)self remoteObject];
  id v4 = (void *)[(CKShare *)self->_share copy];
  br_setShareAssociatedURL(v4, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__BRShareSaveOperation_main__block_invoke;
  v5[3] = &unk_1E59AD7F8;
  v5[4] = self;
  [v3 startOperation:self toSaveSharingInfo:v4 reply:v5];
}

void __28__BRShareSaveOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v8 = a2;
  v7 = [v5 url];
  br_setShareAssociatedURL(v8, v7);

  [*(id *)(a1 + 32) completedWithResult:v8 error:v6];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BRShareSaveOperation *)self shareSaveCompletionBlock];
  v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v6, v7);
    [(BRShareSaveOperation *)self setShareSaveCompletionBlock:0];
  }

  v10.receiver = self;
  v10.super_class = (Class)BRShareSaveOperation;
  [(BROperation *)&v10 finishWithResult:v6 error:v7];
}

+ (BOOL)shouldRetryShareSaveOnError:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 domain];
  int v6 = [v5 isEqualToString:@"BRCloudDocsErrorDomain"];

  if (!v6)
  {
    objc_super v10 = [v4 domain];
    v11 = getCKErrorDomain();
    if ([v10 isEqualToString:v11])
    {
      uint64_t v12 = [v4 code];

      if (v12 == 14)
      {
LABEL_23:
        char v9 = 1;
        goto LABEL_24;
      }
    }
    else
    {
    }
    v13 = [v4 domain];
    v14 = getCKErrorDomain();
    if ([v13 isEqualToString:v14])
    {
      uint64_t v15 = [v4 code];

      if (v15 != 2)
      {
LABEL_22:
        char v9 = 0;
        goto LABEL_24;
      }
      v16 = [v4 userInfo];
      v17 = getCKPartialErrorsByItemIDKey();
      v13 = [v16 objectForKeyedSubscript:v17];

      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      v14 = objc_msgSend(v13, "objectEnumerator", 0);
      uint64_t v18 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v30 != v20) {
              objc_enumerationMutation(v14);
            }
            v22 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            v23 = [v22 domain];
            v24 = getCKErrorDomain();
            if ([v23 isEqualToString:v24])
            {
              uint64_t v25 = [v22 code];

              if (v25 == 14)
              {

                goto LABEL_23;
              }
            }
            else
            {
            }
          }
          uint64_t v19 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v19);
      }
    }

    goto LABEL_22;
  }
  id v7 = [v4 userInfo];
  id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  if (v8 == v4)
  {
    v27 = brc_bread_crumbs((uint64_t)"+[BRShareSaveOperation shouldRetryShareSaveOnError:]", 517);
    v28 = brc_default_log(0);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      +[BRShareSaveOperation shouldRetryShareSaveOnError:]();
    }
  }
  char v9 = [a1 shouldRetryShareSaveOnError:v8];

LABEL_24:
  return v9;
}

- (CKShare)share
{
  return self->_share;
}

- (void)setShare:(id)a3
{
}

- (id)shareSaveCompletionBlock
{
  return objc_getProperty(self, a2, 352, 1);
}

- (void)setShareSaveCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shareSaveCompletionBlock, 0);

  objc_storeStrong((id *)&self->_share, 0);
}

+ (void)shouldRetryShareSaveOnError:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: error != underlyingError%@", v2, v3, v4, v5, v6);
}

@end