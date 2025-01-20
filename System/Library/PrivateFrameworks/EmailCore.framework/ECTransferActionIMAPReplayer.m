@interface ECTransferActionIMAPReplayer
- (BOOL)deleteSourceMessagesFromTransferItems:(id)a3;
- (BOOL)downloadFailed;
- (BOOL)isRecoverableError:(id)a3;
- (ECIMAPLocalActionReplayerDelegate)delegate;
- (ECIMAPServerInterface)serverInterface;
- (id)_transferItems:(id)a3 destinationMailboxURL:(id)a4 isMove:(BOOL)a5;
- (id)appendItem:(id)a3 mailboxURL:(id)a4;
- (id)copyItems:(id)a3 destinationMailboxURL:(id)a4;
- (id)fetchBodyDataForRemoteID:(id)a3 mailboxURL:(id)a4;
- (id)moveItems:(id)a3 destinationMailboxURL:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setServerInterface:(id)a3;
@end

@implementation ECTransferActionIMAPReplayer

- (id)moveItems:(id)a3 destinationMailboxURL:(id)a4
{
  v4 = [(ECTransferActionIMAPReplayer *)self _transferItems:a3 destinationMailboxURL:a4 isMove:1];
  return v4;
}

- (id)copyItems:(id)a3 destinationMailboxURL:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_transferItems:(id)a3 destinationMailboxURL:(id)a4 isMove:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [(ECTransferActionIMAPReplayer *)self delegate];
  v11 = [v10 imapMailboxNameForMailboxURL:v9];

  if (v11)
  {
    v12 = objc_opt_new();
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    v13 = [v8 allKeys];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v76 objects:v85 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v77;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v77 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = [*(id *)(*((void *)&v76 + 1) + 8 * i) integerValue];
          if (v17) {
            [v12 addIndex:v17];
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v76 objects:v85 count:16];
      }
      while (v14);
    }

    v18 = [(ECTransferActionIMAPReplayer *)self delegate];
    v19 = [(ECLocalActionReplayer *)self action];
    v20 = [v19 mailboxURL];
    v53 = [v18 flagsForIMAPUIDs:v12 mailboxURL:v20];

    if (v5)
    {
      v21 = [(ECTransferActionIMAPReplayer *)self serverInterface];
      id v74 = 0;
      id v75 = 0;
      char v22 = [v21 moveUIDs:v12 toMailboxNamed:v11 copyInfo:&v75 error:&v74];
      id v23 = v75;
      id v24 = v74;

      if ((v22 & 1) == 0)
      {
LABEL_13:
        v25 = [(ECTransferActionIMAPReplayer *)self serverInterface];
        int v26 = [v25 hasValidConnection];

        if (v26)
        {
          v27 = +[ECLocalActionReplayer log];
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            [(ECLocalActionReplayer *)self action];
            objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "ef_publicDescription");
            objc_claimAutoreleasedReturnValue();
            -[ECTransferActionIMAPReplayer _transferItems:destinationMailboxURL:isMove:]();
          }

          v28 = [ECTransferMessageActionResults alloc];
          v56[0] = MEMORY[0x1E4F143A8];
          v56[1] = 3221225472;
          v56[2] = __76__ECTransferActionIMAPReplayer__transferItems_destinationMailboxURL_isMove___block_invoke_11;
          v56[3] = &unk_1E63EF068;
          id v57 = v8;
          v29 = [(ECTransferMessageActionResults *)v28 initWithBuilder:v56];
        }
        else
        {
          v29 = 0;
        }
        [(ECLocalActionReplayer *)self setError:v24];
LABEL_35:

        goto LABEL_36;
      }
    }
    else
    {
      v33 = [(ECTransferActionIMAPReplayer *)self serverInterface];
      id v72 = 0;
      id v73 = 0;
      int v34 = [v33 copyUIDs:v12 toMailboxNamed:v11 copyInfo:&v73 error:&v72];
      id v23 = v73;
      id v24 = v72;

      if (!v34) {
        goto LABEL_13;
      }
    }
    v52 = objc_opt_new();
    if (v23
      && ([(ECTransferActionIMAPReplayer *)self delegate],
          v35 = objc_claimAutoreleasedReturnValue(),
          int v36 = objc_msgSend(v35, "checkUIDValidity:mailboxURL:", objc_msgSend(v23, "uidValidity"), v9),
          v35,
          v36))
    {
      *(void *)buf = 0;
      v82 = buf;
      uint64_t v83 = 0x2020000000;
      int v84 = 0;
      v49 = objc_opt_new();
      v37 = [v23 sourceUIDsToDestinationUIDs];
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __76__ECTransferActionIMAPReplayer__transferItems_destinationMailboxURL_isMove___block_invoke;
      v66[3] = &unk_1E63EEFF0;
      id v38 = v8;
      id v67 = v38;
      id v68 = v53;
      id v50 = v52;
      id v69 = v50;
      id v39 = v49;
      id v70 = v39;
      v71 = buf;
      [v37 enumerateKeysAndObjectsUsingBlock:v66];

      v51 = [v38 allValues];
      unint64_t v40 = [v39 count];
      if (v40 >= [v51 count])
      {
        v41 = 0;
      }
      else
      {
        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __76__ECTransferActionIMAPReplayer__transferItems_destinationMailboxURL_isMove___block_invoke_2;
        v64[3] = &unk_1E63EF018;
        id v65 = v39;
        v41 = objc_msgSend(v51, "ef_filter:", v64);
      }
      if ([v41 count])
      {
        v43 = +[ECLocalActionReplayer log];
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          v44 = [(ECLocalActionReplayer *)self action];
          -[ECTransferActionIMAPReplayer _transferItems:destinationMailboxURL:isMove:](v44, (uint64_t)v80, [v41 count], v43);
        }
      }
      v45 = [ECTransferMessageActionResults alloc];
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __76__ECTransferActionIMAPReplayer__transferItems_destinationMailboxURL_isMove___block_invoke_8;
      v60[3] = &unk_1E63EF040;
      id v46 = v39;
      id v61 = v46;
      id v62 = v50;
      id v63 = v41;
      id v47 = v41;
      v29 = [(ECTransferMessageActionResults *)v45 initWithBuilder:v60];

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v42 = [ECTransferMessageActionResults alloc];
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __76__ECTransferActionIMAPReplayer__transferItems_destinationMailboxURL_isMove___block_invoke_2_10;
      v58[3] = &unk_1E63EF068;
      id v59 = v8;
      v29 = [(ECTransferMessageActionResults *)v42 initWithBuilder:v58];
    }
    goto LABEL_35;
  }
  v30 = +[ECLocalActionReplayer log];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    v31 = [(ECLocalActionReplayer *)self action];
    -[ECTransferActionIMAPReplayer _transferItems:destinationMailboxURL:isMove:](v31, buf, v30);
  }

  v32 = [ECTransferMessageActionResults alloc];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __76__ECTransferActionIMAPReplayer__transferItems_destinationMailboxURL_isMove___block_invoke_12;
  v54[3] = &unk_1E63EF068;
  id v55 = v8;
  v29 = [(ECTransferMessageActionResults *)v32 initWithBuilder:v54];
  v12 = v55;
LABEL_36:

  return v29;
}

void __76__ECTransferActionIMAPReplayer__transferItems_destinationMailboxURL_isMove___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [v5 unsignedIntegerValue];
  unint64_t v7 = [v6 unsignedIntegerValue];
  id v8 = EFStringWithUnsignedInteger();
  id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
  if (v9)
  {
    v10 = [ECServerMessage alloc];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __76__ECTransferActionIMAPReplayer__transferItems_destinationMailboxURL_isMove___block_invoke_4;
    v18 = &unk_1E63EEFC8;
    v11 = v9;
    v19 = v11;
    id v20 = *(id *)(a1 + 40);
    id v21 = v5;
    unint64_t v22 = v7;
    v12 = [(ECServerMessage *)v10 initWithIMAPServerMessageBuilder:&v15];
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v12, v15, v16, v17, v18);
    [*(id *)(a1 + 56) addObject:v11];
    uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
    if (v7 > *(unsigned int *)(v13 + 24)) {
      *(_DWORD *)(v13 + 24) = v7;
    }

    uint64_t v14 = v19;
  }
  else
  {
    uint64_t v14 = +[ECLocalActionReplayer log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v5;
      _os_log_impl(&dword_1BF11D000, v14, OS_LOG_TYPE_DEFAULT, "Got unexpected Source UID %@ while replaying action", buf, 0xCu);
    }
  }
}

void __76__ECTransferActionIMAPReplayer__transferItems_destinationMailboxURL_isMove___block_invoke_4(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [*(id *)(a1 + 32) destinationMessage];
  v4 = [v3 persistentID];
  [v6 setMessagePersistentID:v4];

  id v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(a1 + 48)];
  [v6 setServerFlags:v5];

  [v6 setImapUID:*(unsigned int *)(a1 + 56)];
}

uint64_t __76__ECTransferActionIMAPReplayer__transferItems_destinationMailboxURL_isMove___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

void __76__ECTransferActionIMAPReplayer__transferItems_destinationMailboxURL_isMove___block_invoke_8(void *a1, void *a2)
{
  id v3 = a2;
  [v3 setPhaseForResults:3];
  [v3 setCompletedItems:a1[4]];
  [v3 setCreatedServerMessages:a1[5]];
  [v3 setFailedItems:a1[6]];
}

void __76__ECTransferActionIMAPReplayer__transferItems_destinationMailboxURL_isMove___block_invoke_2_10(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setPhaseForResults:3];
  id v3 = [*(id *)(a1 + 32) allValues];
  [v4 setCompletedItems:v3];
}

void __76__ECTransferActionIMAPReplayer__transferItems_destinationMailboxURL_isMove___block_invoke_11(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setPhaseForResults:3];
  id v3 = [*(id *)(a1 + 32) allValues];
  [v4 setFailedItems:v3];
}

void __76__ECTransferActionIMAPReplayer__transferItems_destinationMailboxURL_isMove___block_invoke_12(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setPhaseForResults:3];
  id v3 = [*(id *)(a1 + 32) allValues];
  [v4 setFailedItems:v3];
}

- (BOOL)deleteSourceMessagesFromTransferItems:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "sourceRemoteID", (void)v19);
        uint64_t v11 = [v10 integerValue];

        if (v11) {
          [v5 addIndex:v11];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  if ([v5 count])
  {
    v12 = [[ECMessageFlagChange alloc] initWithBuilder:&__block_literal_global_22];
    uint64_t v13 = [(ECTransferActionIMAPReplayer *)self serverInterface];
    char v14 = [v13 storeFlagChange:v12 forUIDs:v5];

    uint64_t v15 = [(ECTransferActionIMAPReplayer *)self serverInterface];
    [v15 expungeUIDs:v5];

    if (v14)
    {
      char v16 = 1;
    }
    else
    {
      uint64_t v17 = [(ECTransferActionIMAPReplayer *)self serverInterface];
      char v16 = [v17 hasValidConnection];
    }
  }
  else
  {
    char v16 = 1;
  }

  return v16;
}

uint64_t __70__ECTransferActionIMAPReplayer_deleteSourceMessagesFromTransferItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 changesDeletedTo:1];
}

- (id)fetchBodyDataForRemoteID:(id)a3 mailboxURL:(id)a4
{
  id v5 = a3;
  id v6 = [(ECTransferActionIMAPReplayer *)self delegate];
  uint64_t v7 = [(ECLocalActionReplayer *)self action];
  uint64_t v8 = [v7 mailboxURL];
  id v9 = [v6 messageDataForRemoteID:v5 mailboxURL:v8];

  return v9;
}

- (BOOL)downloadFailed
{
  id v3 = [(ECLocalActionReplayer *)self error];
  id v4 = [(ECTransferActionIMAPReplayer *)self serverInterface];
  if ([v4 hasValidConnection])
  {
    LOBYTE(v5) = 1;
  }
  else if (v3)
  {
    BOOL v5 = ![(ECTransferActionIMAPReplayer *)self isRecoverableError:v3];
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)isRecoverableError:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ECTransferActionIMAPReplayer *)self delegate];
  char v6 = [v5 errorIsIMAPError:v4] ^ 1;

  return v6;
}

- (id)appendItem:(id)a3 mailboxURL:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v39 = a4;
  char v6 = [v38 destinationMessage];
  uint64_t v7 = [(ECTransferActionIMAPReplayer *)self delegate];
  uint64_t v8 = [v7 imapMailboxNameForMailboxURL:v39];

  if (!v8)
  {
    id v9 = +[ECLocalActionReplayer log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      [(ECLocalActionReplayer *)self action];
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E4F60E00], "ec_redactedStringForMailboxURL:", v39);
      objc_claimAutoreleasedReturnValue();
      -[ECTransferActionIMAPReplayer appendItem:mailboxURL:]();
    }
  }
  v10 = [(ECTransferActionIMAPReplayer *)self delegate];
  uint64_t v11 = [v10 messageDataForMessage:v6];

  uint64_t v12 = [v11 length];
  uint64_t v13 = 0;
  id v14 = 0;
  if (!v8) {
    goto LABEL_11;
  }
  if (!v12) {
    goto LABEL_11;
  }
  uint64_t v15 = [(ECTransferActionIMAPReplayer *)self serverInterface];
  char v16 = [v6 flags];
  uint64_t v17 = [v6 dateReceived];
  id v51 = 0;
  id v52 = 0;
  int v18 = [v15 appendData:v11 toMailboxNamed:v8 flags:v16 dateReceived:v17 appendInfo:&v52 error:&v51];
  id v14 = v52;
  uint64_t v13 = (ECServerMessage *)v51;

  if (v18)
  {
    if (!v14
      || ([(ECTransferActionIMAPReplayer *)self delegate],
          long long v19 = objc_claimAutoreleasedReturnValue(),
          int v20 = objc_msgSend(v19, "checkUIDValidity:mailboxURL:", objc_msgSend(v14, "uidValidity"), v39),
          v19,
          !v20))
    {
      v33 = [ECTransferMessageActionResults alloc];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __54__ECTransferActionIMAPReplayer_appendItem_mailboxURL___block_invoke_3;
      v43[3] = &unk_1E63EF068;
      id v44 = v38;
      int v26 = [(ECTransferMessageActionResults *)v33 initWithBuilder:v43];
      v27 = &v44;
      goto LABEL_20;
    }
    int v21 = [v14 newMessageUID];
    long long v22 = [ECServerMessage alloc];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __54__ECTransferActionIMAPReplayer_appendItem_mailboxURL___block_invoke;
    v48[3] = &unk_1E63EF0B0;
    id v49 = v6;
    int v50 = v21;
    id v23 = [(ECServerMessage *)v22 initWithIMAPServerMessageBuilder:v48];
    uint64_t v24 = [ECTransferMessageActionResults alloc];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __54__ECTransferActionIMAPReplayer_appendItem_mailboxURL___block_invoke_2;
    v45[3] = &unk_1E63EF0D8;
    id v46 = v38;
    uint64_t v25 = v23;
    id v47 = v25;
    int v26 = [(ECTransferMessageActionResults *)v24 initWithBuilder:v45];

    v27 = &v49;
  }
  else
  {
LABEL_11:
    v28 = [(ECTransferActionIMAPReplayer *)self serverInterface];
    if ([v28 hasValidConnection])
    {
    }
    else
    {
      v29 = [(ECTransferActionIMAPReplayer *)self delegate];
      int v30 = [v29 errorIsIMAPError:v13];

      if (!v30)
      {
        int v26 = 0;
        goto LABEL_21;
      }
    }
    v31 = +[ECLocalActionReplayer log];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v35 = [(ECLocalActionReplayer *)self action];
      uint64_t v36 = [v11 length];
      v37 = [MEMORY[0x1E4F60E00] partiallyRedactedStringForString:v8];
      *(_DWORD *)buf = 138543874;
      v54 = v35;
      __int16 v55 = 2048;
      uint64_t v56 = v36;
      __int16 v57 = 2114;
      v58 = v37;
      _os_log_error_impl(&dword_1BF11D000, v31, OS_LOG_TYPE_ERROR, "<%{public}@> Permanent error trying to append message (Message Data Length = %lu, mailboxName = %{public}@).", buf, 0x20u);
    }
    v32 = [ECTransferMessageActionResults alloc];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __54__ECTransferActionIMAPReplayer_appendItem_mailboxURL___block_invoke_17;
    v40[3] = &unk_1E63EF0D8;
    id v41 = v38;
    uint64_t v13 = v13;
    v42 = v13;
    int v26 = [(ECTransferMessageActionResults *)v32 initWithBuilder:v40];
    v27 = &v41;
    uint64_t v25 = v42;
  }

LABEL_20:
LABEL_21:

  return v26;
}

void __54__ECTransferActionIMAPReplayer_appendItem_mailboxURL___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) persistentID];
  [v5 setMessagePersistentID:v3];

  id v4 = [*(id *)(a1 + 32) flags];
  [v5 setServerFlags:v4];

  [v5 setImapUID:*(unsigned int *)(a1 + 40)];
}

void __54__ECTransferActionIMAPReplayer_appendItem_mailboxURL___block_invoke_2(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 setPhaseForResults:3];
  v7[0] = *(void *)(a1 + 32);
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v3 setCompletedItems:v4];

  uint64_t v6 = *(void *)(a1 + 40);
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:1];
  [v3 setCreatedServerMessages:v5];
}

void __54__ECTransferActionIMAPReplayer_appendItem_mailboxURL___block_invoke_3(uint64_t a1, void *a2)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 setPhaseForResults:3];
  v5[0] = *(void *)(a1 + 32);
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v3 setCompletedItems:v4];
}

void __54__ECTransferActionIMAPReplayer_appendItem_mailboxURL___block_invoke_17(uint64_t a1, void *a2)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 setPhaseForResults:3];
  v5[0] = *(void *)(a1 + 32);
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v3 setFailedItems:v4];

  [v3 setError:*(void *)(a1 + 40)];
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

- (void)_transferItems:(void *)a1 destinationMailboxURL:(uint8_t *)buf isMove:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1BF11D000, log, OS_LOG_TYPE_ERROR, "<%{public}@>. Unable to find a destination folder while copying items.", buf, 0xCu);
}

- (void)_transferItems:(uint64_t)a3 destinationMailboxURL:(NSObject *)a4 isMove:.cold.2(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138543618;
  *(void *)(a2 + 4) = a1;
  *(_WORD *)(a2 + 12) = 2048;
  *(void *)(a2 + 14) = a3;
  OUTLINED_FUNCTION_1_0(&dword_1BF11D000, "<%{public}@>. Failed to copy %lu items", (uint8_t *)a2, a4);
}

- (void)_transferItems:destinationMailboxURL:isMove:.cold.3()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(v2, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_1_0(&dword_1BF11D000, "<%{public}@>. Server interface does not have a valid connection for copying items. Error: %{public}@", v5, v6);
}

- (void)appendItem:mailboxURL:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(v2, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_1_0(&dword_1BF11D000, "<%{public}@> Couldn't find IMAP mailbox name for URL %{public}@", v5, v6);
}

@end