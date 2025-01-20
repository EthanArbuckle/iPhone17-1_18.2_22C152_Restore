@interface BRCSharingLookupParticipantsOperation
- (BRCSharingLookupParticipantsOperation)initWithUserIdentities:(id)a3 session:(id)a4;
- (id)createActivity;
- (void)main;
@end

@implementation BRCSharingLookupParticipantsOperation

- (BRCSharingLookupParticipantsOperation)initWithUserIdentities:(id)a3 session:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v8 syncContextProvider];
  v10 = [v9 defaultSyncContext];
  v16.receiver = self;
  v16.super_class = (Class)BRCSharingLookupParticipantsOperation;
  v11 = [(_BRCOperation *)&v16 initWithName:@"sharing/lookup-participants" syncContext:v10 sessionContext:v8];

  if (v11)
  {
    [(_BRCOperation *)v11 setNonDiscretionary:1];
    objc_storeStrong((id *)&v11->_userIdentities, a3);
    uint64_t v12 = objc_opt_new();
    shareParticipants = v11->_shareParticipants;
    v11->_shareParticipants = (NSMutableArray *)v12;

    v14 = objc_msgSend(MEMORY[0x1E4F1A218], "br_sharingMisc");
    [(_BRCOperation *)v11 setGroup:v14];
  }
  return v11;
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_1D353B000, "sharing/lookup-participants", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)main
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1A0D8]) initWithUserIdentityLookupInfos:self->_userIdentities];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__BRCSharingLookupParticipantsOperation_main__block_invoke;
  v5[3] = &unk_1E699A058;
  v5[4] = self;
  [v3 setShareParticipantFetchedBlock:v5];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__BRCSharingLookupParticipantsOperation_main__block_invoke_2;
  v4[3] = &unk_1E69939E8;
  v4[4] = self;
  [v3 setFetchShareParticipantsCompletionBlock:v4];
  [(_BRCOperation *)self addSubOperation:v3];
}

uint64_t __45__BRCSharingLookupParticipantsOperation_main__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 528) addObject:a2];
}

void __45__BRCSharingLookupParticipantsOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 528) count];
    if (v9 == [*(id *)(*(void *)(a1 + 32) + 520) count])
    {
      v10 = brc_bread_crumbs();
      v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 528);
        int v18 = 138412546;
        uint64_t v19 = v15;
        __int16 v20 = 2112;
        uint64_t v21 = (uint64_t)v10;
        _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] fetched share participants: %@%@", (uint8_t *)&v18, 0x16u);
      }

      id v8 = *(void **)(a1 + 32);
    }
    else
    {
      uint64_t v12 = brc_bread_crumbs();
      v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        uint64_t v16 = [*(id *)(*(void *)(a1 + 32) + 520) count];
        uint64_t v17 = [*(id *)(*(void *)(a1 + 32) + 528) count];
        int v18 = 134218498;
        uint64_t v19 = v16;
        __int16 v20 = 2048;
        uint64_t v21 = v17;
        __int16 v22 = 2112;
        v23 = v12;
        _os_log_fault_impl(&dword_1D353B000, v13, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Unexpected number of share participants: expected %lu got %lu%@", (uint8_t *)&v18, 0x20u);
      }

      v4 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F592A8], 15, @"Unexpected number of share participants");
      id v8 = *(void **)(a1 + 32);
      if (v4)
      {
        uint64_t v7 = 0;
        goto LABEL_14;
      }
    }
    v4 = 0;
    uint64_t v7 = v8[66];
    goto LABEL_14;
  }
  v4 = v3;
  v5 = brc_bread_crumbs();
  v6 = brc_default_log();
  if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    int v18 = 138412802;
    uint64_t v19 = v14;
    __int16 v20 = 2112;
    uint64_t v21 = (uint64_t)v4;
    __int16 v22 = 2112;
    v23 = v5;
    _os_log_error_impl(&dword_1D353B000, v6, (os_log_type_t)0x90u, "[ERROR] failed share participant lookup for %@ - %@%@", (uint8_t *)&v18, 0x20u);
  }

  uint64_t v7 = 0;
  id v8 = *(void **)(a1 + 32);
LABEL_14:
  [v8 completedWithResult:v7 error:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareParticipants, 0);
  objc_storeStrong((id *)&self->_userIdentities, 0);
}

@end