@interface ECTransferActionReplayer
- (id)_allCopyItemsBySourceRemoteIDsForAction:(id)a3 failedItems:(id *)a4;
- (id)_appendMessagesInAction:(id)a3;
- (id)_deleteItemsInAction:(id)a3;
- (id)_downLoadSourceMessagesInAction:(id)a3;
- (id)_transferItemsInAction:(id)a3 isMove:(BOOL)a4;
- (id)failActionWithError:(id)a3;
- (id)replayAction;
@end

@implementation ECTransferActionReplayer

- (id)replayAction
{
  v4 = [(ECLocalActionReplayer *)self action];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"ECTransferActionReplayer.m", 23, @"Invalid parameter not satisfying: %@", @"[transferAction isKindOfClass:[ECTransferMessageAction class]]" object file lineNumber description];
  }
  v5 = [v4 itemsToDownload];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = [(ECTransferActionReplayer *)self _downLoadSourceMessagesInAction:v4];
  }
  else
  {
    v10 = [v4 itemsToCopy];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      v12 = [v4 mailboxURL];
      v13 = [v4 destinationMailboxURL];
      int v14 = [v12 isEqual:v13];

      if (v14)
      {
        uint64_t v7 = [(ECTransferActionReplayer *)self _appendMessagesInAction:v4];
      }
      else
      {
        if ([v4 transferType] == 1)
        {
          v17 = [(ECLocalActionReplayer *)self delegate];
          v18 = [v4 sourceMailboxURL];
          v19 = [v4 destinationMailboxURL];
          uint64_t v20 = [v17 moveSupportedFromMailboxURL:v18 toURL:v19];
        }
        else
        {
          uint64_t v20 = 0;
        }
        uint64_t v7 = [(ECTransferActionReplayer *)self _transferItemsInAction:v4 isMove:v20];
      }
    }
    else
    {
      v15 = [v4 itemsToDelete];
      uint64_t v16 = [v15 count];

      if (!v16)
      {
        v22 = [MEMORY[0x1E4F28B00] currentHandler];
        [v22 handleFailureInMethod:a2, self, @"ECTransferActionReplayer.m", 36, @"The copy action had nothing to do, so it shouldn't have been created" object file lineNumber description];
      }
      uint64_t v7 = [(ECTransferActionReplayer *)self _deleteItemsInAction:v4];
    }
  }
  v8 = (void *)v7;

  return v8;
}

- (id)_downLoadSourceMessagesInAction:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 itemsToDownload];
  uint64_t v6 = [v5 firstObject];

  uint64_t v7 = [v6 sourceRemoteID];
  v8 = [v4 mailboxURL];
  v9 = [(ECTransferActionReplayer *)self fetchBodyDataForRemoteID:v7 mailboxURL:v8];

  if ([v9 length])
  {
    v10 = [ECTransferMessageActionResults alloc];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __60__ECTransferActionReplayer__downLoadSourceMessagesInAction___block_invoke;
    v19[3] = &unk_1E63EF0D8;
    id v20 = v6;
    id v21 = v9;
    uint64_t v11 = [(ECTransferMessageActionResults *)v10 initWithBuilder:v19];

    v12 = &v20;
LABEL_7:

    goto LABEL_8;
  }
  if ([(ECTransferActionReplayer *)self downloadFailed])
  {
    v13 = +[ECLocalActionReplayer log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = [(ECLocalActionReplayer *)self action];
      -[ECTransferActionReplayer _downLoadSourceMessagesInAction:](v14, (uint64_t)v6, buf, v13);
    }

    v15 = [ECTransferMessageActionResults alloc];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __60__ECTransferActionReplayer__downLoadSourceMessagesInAction___block_invoke_16;
    v17[3] = &unk_1E63EF0D8;
    v18[0] = v6;
    v18[1] = self;
    uint64_t v11 = [(ECTransferMessageActionResults *)v15 initWithBuilder:v17];
    v12 = (id *)v18;
    goto LABEL_7;
  }
  uint64_t v11 = 0;
LABEL_8:

  return v11;
}

void __60__ECTransferActionReplayer__downLoadSourceMessagesInAction___block_invoke(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 setPhaseForResults:1];
  v9[0] = *(void *)(a1 + 32);
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [v3 setCompletedItems:v4];

  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  [v3 setDownloadedDataByCopyItems:v6];
}

void __60__ECTransferActionReplayer__downLoadSourceMessagesInAction___block_invoke_16(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 setPhaseForResults:1];
  v6[0] = *(void *)(a1 + 32);
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [v3 setFailedItems:v4];

  uint64_t v5 = [*(id *)(a1 + 40) error];
  [v3 setError:v5];
}

- (id)_transferItemsInAction:(id)a3 isMove:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v31 = 0;
  uint64_t v7 = [(ECTransferActionReplayer *)self _allCopyItemsBySourceRemoteIDsForAction:v6 failedItems:&v31];
  id v8 = v31;
  if ([v8 count])
  {
    v9 = +[ECLocalActionReplayer log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = [(ECLocalActionReplayer *)self action];
      -[ECTransferActionReplayer _transferItemsInAction:isMove:](v10, buf, v9);
    }

    uint64_t v11 = [ECTransferMessageActionResults alloc];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __58__ECTransferActionReplayer__transferItemsInAction_isMove___block_invoke;
    v29[3] = &unk_1E63EF068;
    v30 = (__CFString *)v8;
    v12 = [(ECTransferMessageActionResults *)v11 initWithBuilder:v29];
    v13 = v30;
  }
  else
  {
    if (v4)
    {
      int v14 = [v6 destinationMailboxURL];
      v12 = [(ECTransferActionReplayer *)self moveItems:v7 destinationMailboxURL:v14];

      v15 = [(ECLocalMessageActionResults *)v12 error];
      if (v15)
      {
        uint64_t v16 = NSString;
        v17 = [(ECLocalMessageActionResults *)v12 error];
        [v16 stringWithFormat:@"didn't work, error = %@", v17];
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = @"worked";
      }

      v22 = +[ECLocalActionReplayer log];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = [(ECLocalActionReplayer *)self action];
        uint64_t v24 = [v7 count];
        *(_DWORD *)buf = 138543874;
        v33 = v23;
        __int16 v34 = 2048;
        uint64_t v35 = v24;
        __int16 v36 = 2114;
        v37 = v13;
        _os_log_impl(&dword_1BF11D000, v22, OS_LOG_TYPE_DEFAULT, "Replaying move action %{public}@ for %lu items %{public}@", buf, 0x20u);
      }
    }
    else
    {
      v18 = [v6 destinationMailboxURL];
      v12 = (ECTransferMessageActionResults *)[(ECTransferActionReplayer *)self copyItems:v7 destinationMailboxURL:v18];

      v19 = [(ECLocalMessageActionResults *)v12 error];
      if (v19)
      {
        id v20 = NSString;
        id v21 = [(ECLocalMessageActionResults *)v12 error];
        [v20 stringWithFormat:@"didn't work, error = %@", v21];
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = @"worked";
      }

      v22 = +[ECLocalActionReplayer log];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v25 = [(ECLocalActionReplayer *)self action];
        uint64_t v26 = [v7 count];
        *(_DWORD *)buf = 138543874;
        v33 = v25;
        __int16 v34 = 2048;
        uint64_t v35 = v26;
        __int16 v36 = 2114;
        v37 = v13;
        _os_log_impl(&dword_1BF11D000, v22, OS_LOG_TYPE_DEFAULT, "Replaying copy action %{public}@ for %lu items %{public}@", buf, 0x20u);
      }
    }
  }
  v27 = v12;

  return v27;
}

void __58__ECTransferActionReplayer__transferItemsInAction_isMove___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setPhaseForResults:3];
  [v3 setFailedItems:*(void *)(a1 + 32)];
}

- (id)_allCopyItemsBySourceRemoteIDsForAction:(id)a3 failedItems:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  uint64_t v5 = objc_opt_new();
  id v6 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [v18 itemsToCopy];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v20;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v20 != v9) {
        objc_enumerationMutation(v7);
      }
      uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * v10);
      v12 = [v11 sourceRemoteID];
      if (v12
        || ([v11 sourceMessage],
            v13 = objc_claimAutoreleasedReturnValue(),
            [v13 remoteID],
            v12 = objc_claimAutoreleasedReturnValue(),
            v13,
            v12))
      {
        [v5 setObject:v11 forKeyedSubscript:v12];
      }
      else
      {
        [v6 addObject:v11];
      }
      BOOL v14 = (unint64_t)[v5 count] < 0x1F5;

      if (!v14) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v15 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
        uint64_t v8 = v15;
        if (v15) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  uint64_t v16 = [v6 count];
  if (a4 && v16) {
    *a4 = v6;
  }

  return v5;
}

- (id)_appendMessagesInAction:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 itemsToCopy];
  id v6 = [v5 firstObject];

  uint64_t v7 = [v6 destinationMessage];
  if (!v7) {
    goto LABEL_3;
  }
  uint64_t v8 = [v6 destinationMessage];
  uint64_t v9 = [v8 flags];
  int v10 = [v9 deleted];

  if (!v10)
  {
    uint64_t v15 = [v4 destinationMailboxURL];
    BOOL v14 = [(ECTransferActionReplayer *)self appendItem:v6 mailboxURL:v15];
  }
  else
  {
LABEL_3:
    uint64_t v11 = +[ECLocalActionReplayer log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [(ECLocalActionReplayer *)self action];
      *(_DWORD *)buf = 138543362;
      long long v20 = v12;
      _os_log_impl(&dword_1BF11D000, v11, OS_LOG_TYPE_DEFAULT, "<%{public}@>. Not appending deleted messages", buf, 0xCu);
    }
    v13 = [ECTransferMessageActionResults alloc];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __52__ECTransferActionReplayer__appendMessagesInAction___block_invoke;
    v17[3] = &unk_1E63EF068;
    id v18 = v6;
    BOOL v14 = [(ECTransferMessageActionResults *)v13 initWithBuilder:v17];
  }
  return v14;
}

void __52__ECTransferActionReplayer__appendMessagesInAction___block_invoke(uint64_t a1, void *a2)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 setPhaseForResults:3];
  v5[0] = *(void *)(a1 + 32);
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v3 setFailedItems:v4];
}

- (id)_deleteItemsInAction:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 itemsToDelete];
  int v6 = [(ECTransferActionReplayer *)self deleteSourceMessagesFromTransferItems:v5];

  uint64_t v7 = @"got connection error";
  if (v6) {
    uint64_t v7 = @"finished";
  }
  uint64_t v8 = v7;
  uint64_t v9 = +[ECLocalActionReplayer log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [(ECLocalActionReplayer *)self action];
    uint64_t v11 = [v4 itemsToDelete];
    *(_DWORD *)buf = 138543874;
    id v18 = v10;
    __int16 v19 = 2048;
    uint64_t v20 = [v11 count];
    __int16 v21 = 2114;
    long long v22 = v8;
    _os_log_impl(&dword_1BF11D000, v9, OS_LOG_TYPE_DEFAULT, "Replaying delete action %{public}@ for %lu items %{public}@", buf, 0x20u);
  }
  if (v6)
  {
    v12 = [ECTransferMessageActionResults alloc];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __49__ECTransferActionReplayer__deleteItemsInAction___block_invoke;
    v15[3] = &unk_1E63EF068;
    id v16 = v4;
    v13 = [(ECTransferMessageActionResults *)v12 initWithBuilder:v15];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __49__ECTransferActionReplayer__deleteItemsInAction___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setPhaseForResults:4];
  id v3 = [*(id *)(a1 + 32) itemsToDelete];
  [v4 setCompletedItems:v3];
}

- (id)failActionWithError:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = [(ECLocalActionReplayer *)self action];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"ECTransferActionReplayer.m", 152, @"Invalid parameter not satisfying: %@", @"[action isKindOfClass:[ECTransferMessageAction class]]" object file lineNumber description];
  }
  id v7 = v6;
  uint64_t v8 = [v7 itemsToDownload];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    int v10 = [v7 itemsToDownload];
    uint64_t v11 = 1;
  }
  else
  {
    v12 = [v7 itemsToCopy];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      int v10 = [v7 itemsToCopy];
      uint64_t v11 = 3;
    }
    else
    {
      BOOL v14 = [v7 itemsToDelete];
      uint64_t v15 = [v14 count];

      if (!v15)
      {
        uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
        [v26 handleFailureInMethod:a2, self, @"ECTransferActionReplayer.m", 164, @"The copy action had nothing to do, so it shouldn't have been created" object file lineNumber description];
      }
      int v10 = [v7 itemsToDelete];
      uint64_t v11 = 4;
    }
  }
  id v16 = +[ECLocalActionReplayer log];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    long long v22 = [(ECLocalActionReplayer *)self action];
    uint64_t v23 = [(ECLocalActionReplayer *)self error];
    uint64_t v24 = objc_msgSend(v23, "ef_publicDescription");
    *(_DWORD *)buf = 138543618;
    v32 = v22;
    __int16 v33 = 2114;
    __int16 v34 = v24;
    _os_log_error_impl(&dword_1BF11D000, v16, OS_LOG_TYPE_ERROR, "<%{public}@>. Failed with error: %{public}@", buf, 0x16u);
  }
  v17 = [ECTransferMessageActionResults alloc];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __48__ECTransferActionReplayer_failActionWithError___block_invoke;
  v27[3] = &unk_1E63EF100;
  uint64_t v30 = v11;
  id v28 = v10;
  id v18 = v5;
  id v29 = v18;
  id v19 = v10;
  uint64_t v20 = [(ECTransferMessageActionResults *)v17 initWithBuilder:v27];

  return v20;
}

void __48__ECTransferActionReplayer_failActionWithError___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  [v3 setPhaseForResults:a1[6]];
  [v3 setFailedItems:a1[4]];
  [v3 setError:a1[5]];
}

- (void)_downLoadSourceMessagesInAction:(uint8_t *)buf .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1BF11D000, log, OS_LOG_TYPE_ERROR, "<%{public}@>. Download failed for item: %{publid}@", buf, 0x16u);
}

- (void)_transferItemsInAction:(os_log_t)log isMove:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1BF11D000, log, OS_LOG_TYPE_ERROR, "<%{public}@>. Failed due to source messages without UIDs", buf, 0xCu);
}

@end