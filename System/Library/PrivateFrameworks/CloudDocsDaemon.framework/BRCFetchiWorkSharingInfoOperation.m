@interface BRCFetchiWorkSharingInfoOperation
- (BOOL)shouldRetryForError:(id)a3;
- (BRCFetchiWorkSharingInfoOperation)initWithDocumentItem:(id)a3 sessionContext:(id)a4;
- (CKRecordID)recordID;
- (id)createActivity;
- (void)main;
- (void)setRecordID:(id)a3;
@end

@implementation BRCFetchiWorkSharingInfoOperation

- (BRCFetchiWorkSharingInfoOperation)initWithDocumentItem:(id)a3 sessionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 serverZone];
  v9 = [v8 metadataSyncContext];
  v14.receiver = self;
  v14.super_class = (Class)BRCFetchiWorkSharingInfoOperation;
  v10 = [(_BRCOperation *)&v14 initWithName:@"sharing/iWork-publishing-fetch" syncContext:v9 sessionContext:v7];

  if (v10)
  {
    uint64_t v11 = [v6 documentRecordID];
    recordID = v10->_recordID;
    v10->_recordID = (CKRecordID *)v11;

    [(_BRCOperation *)v10 setNonDiscretionary:1];
  }

  return v10;
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_1D353B000, "sharing/iWork-publishing-fetch", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (BOOL)shouldRetryForError:(id)a3
{
  return objc_msgSend(a3, "brc_isUserInitiatedRetriable");
}

- (void)main
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1A0A8]);
  v11[0] = self->_recordID;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v5 = (void *)[v3 initWithRecordIDs:v4];

  uint64_t v6 = *MEMORY[0x1E4F19DF8];
  v10[0] = *MEMORY[0x1E4F19E00];
  v10[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F19E08];
  v10[2] = *MEMORY[0x1E4F19DF0];
  v10[3] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];
  [v5 setDesiredKeys:v8];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__BRCFetchiWorkSharingInfoOperation_main__block_invoke;
  v9[3] = &unk_1E6995380;
  v9[4] = self;
  [v5 setFetchRecordsCompletionBlock:v9];
  [(_BRCOperation *)self addSubOperation:v5];
}

void __41__BRCFetchiWorkSharingInfoOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6) {
    goto LABEL_2;
  }
  if ([v5 count]) {
    goto LABEL_4;
  }
  v9 = brc_bread_crumbs();
  v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
    __41__BRCFetchiWorkSharingInfoOperation_main__block_invoke_cold_1(v5, (uint64_t)v9, v10);
  }

  objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: No error and invalid number of records %lu", objc_msgSend(v5, "count"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
LABEL_2:
    [*(id *)(a1 + 32) completedWithResult:0 error:v6];
  }
  else
  {
LABEL_4:
    uint64_t v7 = *(void **)(a1 + 32);
    id v6 = [v5 allValues];
    v8 = [v6 firstObject];
    [v7 completedWithResult:v8 error:0];
  }
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
}

- (void).cxx_destruct
{
}

void __41__BRCFetchiWorkSharingInfoOperation_main__block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = 134218242;
  uint64_t v6 = [a1 count];
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_fault_impl(&dword_1D353B000, a3, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: No error and invalid number of records %lu%@", (uint8_t *)&v5, 0x16u);
}

@end