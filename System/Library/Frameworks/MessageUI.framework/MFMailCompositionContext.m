@interface MFMailCompositionContext
@end

@implementation MFMailCompositionContext

void __32___MFMailCompositionContext_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.messageui", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_5;
  log_log_5 = (uint64_t)v1;
}

id __89___MFMailCompositionContext_initWithURL_composeType_originalMessage_legacyMessage_isEML___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 emailAddressValue];
  v4 = v3;
  if (v3) {
    [v3 stringValue];
  }
  else {
  v5 = [v2 stringValue];
  }

  return v5;
}

id __89___MFMailCompositionContext_initWithURL_composeType_originalMessage_legacyMessage_isEML___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 emailAddressValue];
  v4 = v3;
  if (v3) {
    [v3 stringValue];
  }
  else {
  v5 = [v2 stringValue];
  }

  return v5;
}

id __89___MFMailCompositionContext_initWithURL_composeType_originalMessage_legacyMessage_isEML___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 emailAddressValue];
  v4 = v3;
  if (v3) {
    [v3 stringValue];
  }
  else {
  v5 = [v2 stringValue];
  }

  return v5;
}

void __104___MFMailCompositionContext__loadMessageWithObjectID_mailboxObjectID_messageRepository_mailboxProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v7 = v6;
    if (!v6)
    {
      a1 = [v3 mailboxObjectIDs];
      v7 = [(id)a1 firstObject];
    }
    v8 = [v5 legacyMailboxForObjectID:v7];
    v9 = +[MFComposeMailMessage legacyMessageWithMessage:v3 mailboxUid:v8];

    if (v6)
    {
      if (!v9) {
        goto LABEL_11;
      }
    }
    else
    {

      if (!v9)
      {
LABEL_11:
        *((unsigned char *)WeakRetained + 80) = 0;
        objc_storeStrong((id *)WeakRetained + 1, v9);
        [WeakRetained setOriginalMessage:v3];
        id v14 = objc_loadWeakRetained((id *)WeakRetained + 16);
        [v14 mailCompositionContext:WeakRetained didFinishLoadingMessage:v3 legacyMessage:v9 error:0];

        goto LABEL_12;
      }
    }
    v10 = MFComposeLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __104___MFMailCompositionContext__loadMessageWithObjectID_mailboxObjectID_messageRepository_mailboxProvider___block_invoke_cold_1(v10);
    }

    v11 = (void *)[objc_alloc(MEMORY[0x1E4F77C40]) initWithMessage:v9];
    v12 = (void *)*((void *)WeakRetained + 7);
    v13 = [v9 messageURL];
    [v12 addProvider:v11 forBaseURL:v13];

    goto LABEL_11;
  }
LABEL_12:
}

void __104___MFMailCompositionContext__loadMessageWithObjectID_mailboxObjectID_messageRepository_mailboxProvider___block_invoke_99(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = MFComposeLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = objc_msgSend(v3, "ef_publicDescription");
    __104___MFMailCompositionContext__loadMessageWithObjectID_mailboxObjectID_messageRepository_mailboxProvider___block_invoke_99_cold_1(v5, v8, v4);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *((unsigned char *)WeakRetained + 80) = 0;
  id v7 = objc_loadWeakRetained((id *)WeakRetained + 16);
  [v7 mailCompositionContext:WeakRetained didFinishLoadingMessage:0 legacyMessage:0 error:v3];
}

void __106___MFMailCompositionContext__loadMessageWithAutosaveIdentifier_messageRepository_originalMessageObjectID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = MFComposeLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v6;
      __int16 v29 = 2048;
      v30 = WeakRetained;
      _os_log_impl(&dword_1AF945000, v5, OS_LOG_TYPE_INFO, "Autosave success for %{public}@, self = %p", buf, 0x16u);
    }

    id v7 = [MEMORY[0x1E4F77BD8] messageWithRFC822Data:v3];
    if (v7)
    {
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F77C40]) initWithMessageData:v3 parentPart:0];
      uint64_t v9 = (void *)WeakRetained[7];
      v10 = [v7 messageURL];
      [v9 addProvider:v8 forBaseURL:v10];
    }
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, WeakRetained);
    v11 = *(void **)(a1 + 40);
    v12 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
    if (v11)
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __106___MFMailCompositionContext__loadMessageWithAutosaveIdentifier_messageRepository_originalMessageObjectID___block_invoke_105;
      v25[3] = &unk_1E5F7C568;
      v13 = &v27;
      objc_copyWeak(&v27, (id *)buf);
      id v14 = v7;
      v26 = v14;
      [v11 onScheduler:v12 addSuccessBlock:v25];

      v15 = *(void **)(a1 + 40);
      v16 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __106___MFMailCompositionContext__loadMessageWithAutosaveIdentifier_messageRepository_originalMessageObjectID___block_invoke_2;
      v22[3] = &unk_1E5F7C590;
      objc_copyWeak(&v24, (id *)buf);
      v23 = v14;
      [v15 onScheduler:v16 addFailureBlock:v22];

      objc_destroyWeak(&v24);
      v17 = (id *)&v26;
    }
    else
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __106___MFMailCompositionContext__loadMessageWithAutosaveIdentifier_messageRepository_originalMessageObjectID___block_invoke_106;
      v19[3] = &unk_1E5F7C5B8;
      v13 = &v21;
      objc_copyWeak(&v21, (id *)buf);
      v20 = v7;
      [v12 performBlock:v19];

      v17 = (id *)&v20;
    }

    objc_destroyWeak(v13);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v7 = MFComposeLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v18;
      _os_log_impl(&dword_1AF945000, v7, OS_LOG_TYPE_INFO, "Autosave success abandoned for %{public}@", buf, 0xCu);
    }
  }
}

void __106___MFMailCompositionContext__loadMessageWithAutosaveIdentifier_messageRepository_originalMessageObjectID___block_invoke_105(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F60CE8] + 16))()) {
      objc_storeStrong(WeakRetained + 14, a2);
    }
    [WeakRetained _notifyDidFinishLoadingWithLegacyMessage:*(void *)(a1 + 32)];
  }
}

void __106___MFMailCompositionContext__loadMessageWithAutosaveIdentifier_messageRepository_originalMessageObjectID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = MFComposeLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __106___MFMailCompositionContext__loadMessageWithAutosaveIdentifier_messageRepository_originalMessageObjectID___block_invoke_2_cold_1((uint64_t)v3, v5);
    }

    [WeakRetained _notifyDidFinishLoadingWithLegacyMessage:*(void *)(a1 + 32)];
  }
}

void __106___MFMailCompositionContext__loadMessageWithAutosaveIdentifier_messageRepository_originalMessageObjectID___block_invoke_106(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [WeakRetained _notifyDidFinishLoadingWithLegacyMessage:*(void *)(a1 + 32)];
  }
}

void __106___MFMailCompositionContext__loadMessageWithAutosaveIdentifier_messageRepository_originalMessageObjectID___block_invoke_2_108(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = MFComposeLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543874;
      uint64_t v9 = v7;
      __int16 v10 = 2048;
      v11 = WeakRetained;
      __int16 v12 = 2114;
      id v13 = v3;
      _os_log_error_impl(&dword_1AF945000, v5, OS_LOG_TYPE_ERROR, "Autosave failure for %{public}@, self = %p, error = %{public}@", (uint8_t *)&v8, 0x20u);
    }

    *((unsigned char *)WeakRetained + 80) = 0;
    uint64_t v6 = objc_loadWeakRetained(WeakRetained + 16);
    [v6 mailCompositionContext:WeakRetained didFinishLoadingMessage:0 legacyMessage:0 error:v3];
  }
  else
  {
    uint64_t v6 = MFComposeLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __106___MFMailCompositionContext__loadMessageWithAutosaveIdentifier_messageRepository_originalMessageObjectID___block_invoke_2_108_cold_1(a1, (uint64_t)v3, v6);
    }
  }
}

void __77___MFMailCompositionContext_collection_replacedExistingItemID_withNewItemID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77___MFMailCompositionContext_collection_replacedExistingItemID_withNewItemID___block_invoke_2;
  v6[3] = &unk_1E5F79038;
  v6[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v7 = v5;
  [v4 performBlock:v6];
}

void __77___MFMailCompositionContext_collection_replacedExistingItemID_withNewItemID___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setOriginalMessage:*(void *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 originalMessage];
  [v4 mailCompositionContext:v2 messageDidChange:v3];
}

void __104___MFMailCompositionContext__loadMessageWithObjectID_mailboxObjectID_messageRepository_mailboxProvider___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1AF945000, log, OS_LOG_TYPE_ERROR, "Legacy message is nil after loading message from ID", v1, 2u);
}

void __104___MFMailCompositionContext__loadMessageWithObjectID_mailboxObjectID_messageRepository_mailboxProvider___block_invoke_99_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1AF945000, log, OS_LOG_TYPE_ERROR, "Failed to get message for object id. Error: %{public}@", buf, 0xCu);
}

void __106___MFMailCompositionContext__loadMessageWithAutosaveIdentifier_messageRepository_originalMessageObjectID___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AF945000, a2, OS_LOG_TYPE_ERROR, "Failed to load original message: %@", (uint8_t *)&v2, 0xCu);
}

void __106___MFMailCompositionContext__loadMessageWithAutosaveIdentifier_messageRepository_originalMessageObjectID___block_invoke_2_108_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1AF945000, log, OS_LOG_TYPE_ERROR, "Autosave failure abandoned %{public}@, error = %{public}@", (uint8_t *)&v4, 0x16u);
}

@end