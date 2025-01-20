@interface BRCSharingCopyAccessTokenOperation
- (BRCSharingCopyAccessTokenOperation)initWithItem:(id)a3 sessionContext:(id)a4;
- (CKRecordID)recordID;
- (CKRecordID)shareID;
- (id)createActivity;
- (void)main;
- (void)setRecordID:(id)a3;
- (void)setShareID:(id)a3;
@end

@implementation BRCSharingCopyAccessTokenOperation

- (BRCSharingCopyAccessTokenOperation)initWithItem:(id)a3 sessionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 serverZone];
  v9 = [v8 metadataSyncContext];
  v15.receiver = self;
  v15.super_class = (Class)BRCSharingCopyAccessTokenOperation;
  v10 = [(_BRCOperation *)&v15 initWithName:@"sharing/access-token" syncContext:v9 sessionContext:v7];

  if (v10)
  {
    v11 = [v6 documentRecordID];
    [(BRCSharingCopyAccessTokenOperation *)v10 setRecordID:v11];

    v12 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initShareIDWithShareableItem:v6];
    [(BRCSharingCopyAccessTokenOperation *)v10 setShareID:v12];

    [(_BRCOperation *)v10 setNonDiscretionary:1];
    v13 = objc_msgSend(MEMORY[0x1E4F1A218], "br_sharingMisc");
    [(_BRCOperation *)v10 setGroup:v13];
  }
  return v10;
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_1D353B000, "sharing/access-token", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)main
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1A0A8]);
  v4 = [(BRCSharingCopyAccessTokenOperation *)self recordID];
  v11[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v6 = (void *)[v3 initWithRecordIDs:v5];

  uint64_t v7 = *MEMORY[0x1E4F19DF0];
  v10[0] = *MEMORY[0x1E4F19CF8];
  v10[1] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  [v6 setDesiredKeys:v8];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__BRCSharingCopyAccessTokenOperation_main__block_invoke;
  v9[3] = &unk_1E6995380;
  v9[4] = self;
  [v6 setFetchRecordsCompletionBlock:v9];
  [(_BRCOperation *)self addSubOperation:v6];
}

void __42__BRCSharingCopyAccessTokenOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  v8 = [v6 recordID];
  v9 = [v7 objectForKeyedSubscript:v8];

  v10 = [v9 encryptedValues];
  v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F19CF8]];

  uint64_t v12 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F19DF0]];
  v13 = (void *)v12;
  if (!v5 && !v11 && v12 == 0)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorDocumentIsNotSharedAtIdentifier:", 0);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!v5)
  {
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v16 = brc_bread_crumbs();
        v17 = brc_default_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
          __42__BRCSharingCopyAccessTokenOperation_main__block_invoke_cold_2();
        }

        objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: encrypted access token %@ is of unexpected type", v11);
        goto LABEL_23;
      }
    }
  }
  if (!v5 && v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = 0;
      goto LABEL_8;
    }
    v18 = brc_bread_crumbs();
    v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      __42__BRCSharingCopyAccessTokenOperation_main__block_invoke_cold_1();
    }

    objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: reference identifier %@ is of unexpected type", v13);
LABEL_23:
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v15 = 0;
    if (v5) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_8:
  id v15 = v11;
  if (v5)
  {
LABEL_9:
    [*(id *)(a1 + 32) completedWithResult:0 error:v5];
    goto LABEL_29;
  }
LABEL_24:
  v20 = objc_opt_new();
  v21 = v20;
  if (v15) {
    [v20 setObject:v15 forKeyedSubscript:@"token"];
  }
  if (v13) {
    [v21 setObject:v13 forKeyedSubscript:@"ref_id"];
  }
  [*(id *)(a1 + 32) completedWithResult:v21 error:0];

LABEL_29:
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
}

- (CKRecordID)shareID
{
  return self->_shareID;
}

- (void)setShareID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareID, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

void __42__BRCSharingCopyAccessTokenOperation_main__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: reference identifier %@ is of unexpected type%@");
}

void __42__BRCSharingCopyAccessTokenOperation_main__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: encrypted access token %@ is of unexpected type%@");
}

@end