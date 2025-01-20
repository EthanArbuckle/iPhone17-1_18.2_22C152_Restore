@interface BRFetchRecordsOperation
- (BRFetchRecordsOperation)init;
- (void)setFetchRecordsCompletionBlock:(id)a3;
@end

@implementation BRFetchRecordsOperation

- (BRFetchRecordsOperation)init
{
  v8.receiver = self;
  v8.super_class = (Class)BRFetchRecordsOperation;
  v2 = [(BRFetchRecordsOperation *)&v8 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __31__BRFetchRecordsOperation_init__block_invoke;
    v5[3] = &unk_1E6993EF8;
    objc_copyWeak(&v6, &location);
    v4.receiver = v2;
    v4.super_class = (Class)BRFetchRecordsOperation;
    [(BRFetchRecordsOperation *)&v4 setFetchRecordsCompletionBlock:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __31__BRFetchRecordsOperation_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v8 = objc_msgSend(v6, "brc_ckPartialErrorsByItemID");
  uint64_t v9 = [WeakRetained perRecordCompletionBlock];
  if (v9)
  {
    v10 = (void *)v9;
    uint64_t v11 = [v5 count];
    unint64_t v12 = [v8 count] + v11;
    v13 = [WeakRetained recordIDs];
    unint64_t v14 = [v13 count];

    if (v12 < v14)
    {
      id v29 = v6;
      v15 = brc_bread_crumbs();
      v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v15;
        _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] Batch operatoin completed but some records were not handled by perRecordCompletionBlock%@", buf, 0xCu);
      }

      v17 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F592A8] code:149 userInfo:0];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      v18 = [WeakRetained recordIDs];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v31;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v31 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v30 + 1) + 8 * v22);
            v24 = [v5 objectForKey:v23];
            if (v24) {
              goto LABEL_11;
            }
            v25 = [v8 objectForKey:v23];

            if (!v25)
            {
              v24 = [WeakRetained perRecordCompletionBlock];
              ((void (**)(void, void, uint64_t, void *))v24)[2](v24, 0, v23, v17);
LABEL_11:
            }
            ++v22;
          }
          while (v20 != v22);
          uint64_t v26 = [v18 countByEnumeratingWithState:&v30 objects:v34 count:16];
          uint64_t v20 = v26;
        }
        while (v26);
      }

      id v6 = v29;
    }
  }
  uint64_t v27 = WeakRetained[87];
  if (v27)
  {
    (*(void (**)(uint64_t, id, id))(v27 + 16))(v27, v5, v6);
    v28 = (void *)WeakRetained[87];
    WeakRetained[87] = 0;
  }
}

- (void)setFetchRecordsCompletionBlock:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x1D94389C0](a3, a2);
  id fetchRecordsCompletionBlock = self->_fetchRecordsCompletionBlock;
  self->_id fetchRecordsCompletionBlock = v4;
}

- (void).cxx_destruct
{
}

@end