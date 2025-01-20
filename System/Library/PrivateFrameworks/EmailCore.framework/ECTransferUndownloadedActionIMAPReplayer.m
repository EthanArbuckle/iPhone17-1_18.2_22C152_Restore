@interface ECTransferUndownloadedActionIMAPReplayer
- (BOOL)_deleteUIDs:(id)a3;
- (BOOL)_moveAllMessages;
- (ECIMAPLocalActionReplayerDelegate)delegate;
- (ECIMAPServerInterface)serverInterface;
- (id)_copyAllMessages:(BOOL)a3;
- (id)_uidIndexSet;
- (id)replayAction;
- (void)_uidIndexSet;
- (void)setDelegate:(id)a3;
- (void)setServerInterface:(id)a3;
@end

@implementation ECTransferUndownloadedActionIMAPReplayer

- (id)replayAction
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v4 = [(ECLocalActionReplayer *)self action];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"ECTransferUndownloadedActionIMAPReplayer.m", 21, @"Invalid parameter not satisfying: %@", @"[self.action isKindOfClass:[ECTransferUndownloadedMessageAction class]]" object file lineNumber description];
  }
  v6 = [(ECLocalActionReplayer *)self action];
  if ([v6 transferType] != 1) {
    goto LABEL_7;
  }
  v7 = [(ECTransferUndownloadedActionIMAPReplayer *)self delegate];
  v8 = [v6 sourceMailboxURL];
  v9 = [v6 destinationMailboxURL];
  int v10 = [v7 moveSupportedFromMailboxURL:v8 toURL:v9];

  if (v10)
  {
    if ([(ECTransferUndownloadedActionIMAPReplayer *)self _moveAllMessages]) {
      goto LABEL_21;
    }
  }
  else
  {
LABEL_7:
    if ([v6 transferType] == 3)
    {
      v11 = [v6 itemsToDelete];
      uint64_t v12 = [v11 count];

      if (v12)
      {
        v13 = objc_opt_new();
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        v14 = [v6 itemsToDelete];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v32;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v32 != v16) {
                objc_enumerationMutation(v14);
              }
              v18 = [*(id *)(*((void *)&v31 + 1) + 8 * i) sourceRemoteID];
              objc_msgSend(v13, "addIndex:", objc_msgSend(v18, "integerValue"));
            }
            uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
          }
          while (v15);
        }

        BOOL v19 = [(ECTransferUndownloadedActionIMAPReplayer *)self _deleteUIDs:v13];
        v20 = [(ECTransferUndownloadedActionIMAPReplayer *)self serverInterface];
        [v20 expungeUIDs:v13];

        if (v19) {
          goto LABEL_21;
        }
      }
      else
      {
        v22 = [(ECTransferUndownloadedActionIMAPReplayer *)self _uidIndexSet];
        BOOL v23 = [(ECTransferUndownloadedActionIMAPReplayer *)self _deleteUIDs:v22];

        v24 = [(ECTransferUndownloadedActionIMAPReplayer *)self serverInterface];
        [v24 expunge];

        if (v23)
        {
LABEL_21:
          v21 = [(ECLocalMessageActionResults *)[ECTransferMessageActionResults alloc] initWithError:0];
          goto LABEL_25;
        }
      }
    }
    else
    {
      v21 = -[ECTransferUndownloadedActionIMAPReplayer _copyAllMessages:](self, "_copyAllMessages:", [v6 transferType] == 1);
      if (v21) {
        goto LABEL_25;
      }
    }
  }
  v25 = [(ECTransferUndownloadedActionIMAPReplayer *)self serverInterface];
  int v26 = [v25 hasValidConnection];

  if (v26)
  {
    v27 = [ECTransferMessageActionResults alloc];
    v28 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ECLocalActionReplayErrorDomain" code:1 userInfo:0];
    v21 = [(ECLocalMessageActionResults *)v27 initWithError:v28];
  }
  else
  {
    v21 = 0;
  }
LABEL_25:

  return v21;
}

- (BOOL)_moveAllMessages
{
  v3 = [(ECLocalActionReplayer *)self action];
  v4 = [(ECTransferUndownloadedActionIMAPReplayer *)self delegate];
  v5 = [v3 destinationMailboxURL];
  v6 = [v4 imapMailboxNameForMailboxURL:v5];

  v7 = [(ECTransferUndownloadedActionIMAPReplayer *)self serverInterface];
  v8 = [(ECTransferUndownloadedActionIMAPReplayer *)self _uidIndexSet];
  LOBYTE(v5) = [v7 moveUIDs:v8 toMailboxNamed:v6 copyInfo:0 error:0];

  return (char)v5;
}

- (id)_copyAllMessages:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v24 = [(ECLocalActionReplayer *)self action];
  v5 = [(ECTransferUndownloadedActionIMAPReplayer *)self delegate];
  v6 = [v24 destinationMailboxURL];
  v25 = [v5 imapMailboxNameForMailboxURL:v6];

  v7 = [(ECTransferUndownloadedActionIMAPReplayer *)self serverInterface];
  v8 = [(ECTransferUndownloadedActionIMAPReplayer *)self _uidIndexSet];
  id v34 = 0;
  int v9 = [v7 copyUIDs:v8 toMailboxNamed:v25 copyInfo:&v34 error:0];
  id v26 = v34;

  int v10 = [v26 sourceUIDsToDestinationUIDs];
  BOOL v23 = [v10 allKeys];

  if (v3 && [v23 count])
  {
    v11 = objc_opt_new();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v12 = v23;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v31;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * v15), "unsignedIntegerValue", v23);
          v17 = [ECTransferMessageActionItem alloc];
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __61__ECTransferUndownloadedActionIMAPReplayer__copyAllMessages___block_invoke;
          v29[3] = &__block_descriptor_40_e46_v16__0___ECTransferMessageActionItemBuilder__8l;
          v29[4] = v16;
          v18 = [(ECTransferMessageActionItem *)v17 initWithBuilder:v29];
          [v11 addObject:v18];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v13);
    }

    BOOL v19 = [ECTransferMessageActionResults alloc];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __61__ECTransferUndownloadedActionIMAPReplayer__copyAllMessages___block_invoke_2;
    v27[3] = &unk_1E63EF068;
    id v20 = v11;
    id v28 = v20;
    v21 = [(ECTransferMessageActionResults *)v19 initWithBuilder:v27];
  }
  else if (v9)
  {
    v21 = [(ECLocalMessageActionResults *)[ECTransferMessageActionResults alloc] initWithError:0];
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

void __61__ECTransferUndownloadedActionIMAPReplayer__copyAllMessages___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v2 = EFStringWithInt();
  [v3 setSourceRemoteID:v2];
}

void __61__ECTransferUndownloadedActionIMAPReplayer__copyAllMessages___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setPhaseForResults:3];
  [v3 setCompletedItems:*(void *)(a1 + 32)];
}

- (BOOL)_deleteUIDs:(id)a3
{
  id v4 = a3;
  v5 = [[ECMessageFlagChange alloc] initWithBuilder:&__block_literal_global_23];
  v6 = [(ECTransferUndownloadedActionIMAPReplayer *)self serverInterface];
  char v7 = [v6 storeFlagChange:v5 forUIDs:v4];

  return v7;
}

uint64_t __56__ECTransferUndownloadedActionIMAPReplayer__deleteUIDs___block_invoke(uint64_t a1, void *a2)
{
  return [a2 changesDeletedTo:1];
}

- (id)_uidIndexSet
{
  v2 = [(ECLocalActionReplayer *)self action];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 oldestPersistedRemoteID];
    v5 = v4;
    if (!v4)
    {
      v17 = +[ECLocalActionReplayer log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        [(ECTransferUndownloadedActionIMAPReplayer *)v17 _uidIndexSet];
      }

      uint64_t v25 = [MEMORY[0x1E4F28D60] indexSet];
      goto LABEL_19;
    }
    unint64_t v34 = 0;
    id v6 = v4;
    if (sscanf((const char *)[v6 UTF8String], "%lld", &v34) == 1)
    {
      if ((uint64_t)v34 <= 0)
      {
        char v7 = +[ECLocalActionReplayer log];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          [(ECTransferUndownloadedActionIMAPReplayer *)v7 _uidIndexSet];
        }
      }
      else
      {
        if (!HIDWORD(v34))
        {
          uint64_t v25 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 1, v34 - 1);
          goto LABEL_19;
        }
        char v7 = +[ECLocalActionReplayer log];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          [(ECTransferUndownloadedActionIMAPReplayer *)(uint64_t *)&v34 _uidIndexSet];
        }
      }
    }
    else
    {
      char v7 = +[ECLocalActionReplayer log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        [(ECTransferUndownloadedActionIMAPReplayer *)(uint64_t)v6 _uidIndexSet];
      }
    }

    uint64_t v25 = [MEMORY[0x1E4F28D60] indexSet];
LABEL_19:
    uint64_t v16 = (void *)v25;

    goto LABEL_20;
  }
  v8 = +[ECLocalActionReplayer log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    [(ECTransferUndownloadedActionIMAPReplayer *)v8 _uidIndexSet];
  }

  uint64_t v16 = [MEMORY[0x1E4F28D60] indexSet];
LABEL_20:

  return v16;
}

- (ECIMAPServerInterface)serverInterface
{
  return self->serverInterface;
}

- (void)setServerInterface:(id)a3
{
}

- (ECIMAPLocalActionReplayerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (ECIMAPLocalActionReplayerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->serverInterface, 0);
}

- (void)_uidIndexSet
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BF11D000, a2, OS_LOG_TYPE_ERROR, "Failed to scan '%{public}@' as oldest persisted remote ID.", (uint8_t *)&v2, 0xCu);
}

@end