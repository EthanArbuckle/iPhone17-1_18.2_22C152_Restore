@interface BRCFetchQuotaOperation
- (BOOL)shouldRetryForError:(id)a3;
- (BRCFetchQuotaOperation)initWithSession:(id)a3;
- (void)main;
@end

@implementation BRCFetchQuotaOperation

- (BRCFetchQuotaOperation)initWithSession:(id)a3
{
  id v4 = a3;
  v5 = [v4 syncContextProvider];
  v6 = [v5 defaultSyncContext];
  v9.receiver = self;
  v9.super_class = (Class)BRCFetchQuotaOperation;
  v7 = [(_BRCOperation *)&v9 initWithName:@"fetch-quota" syncContext:v6 sessionContext:v4];

  if (v7) {
    [(_BRCOperation *)v7 setNonDiscretionary:1];
  }
  return v7;
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (void)main
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1A0F8]);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30__BRCFetchQuotaOperation_main__block_invoke;
  v4[3] = &unk_1E6998BD0;
  v4[4] = self;
  [v3 setFetchUserQuotaCompletionBlock:v4];
  [(_BRCOperation *)self addSubOperation:v3];
}

void __30__BRCFetchQuotaOperation_main__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = brc_bread_crumbs();
  v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 134218498;
    uint64_t v11 = a2;
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    v15 = v6;
    _os_log_debug_impl(&dword_1D353B000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] fetched quota %llu - %@%@", (uint8_t *)&v10, 0x20u);
  }

  v8 = *(void **)(a1 + 32);
  if (v5)
  {
    [v8 completedWithResult:0 error:v5];
  }
  else
  {
    objc_super v9 = [NSNumber numberWithUnsignedLongLong:a2];
    [v8 completedWithResult:v9 error:0];
  }
}

@end