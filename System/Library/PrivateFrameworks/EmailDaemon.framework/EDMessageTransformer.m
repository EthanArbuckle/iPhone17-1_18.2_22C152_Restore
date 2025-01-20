@interface EDMessageTransformer
+ (OS_os_log)log;
+ (id)mailboxesForPersistedMessage:(id)a3 mailboxProvider:(id)a4;
- (EDMailboxProvider)mailboxProvider;
- (EDMessageTransformer)initWithMailboxProvider:(id)a3 userProfileProvider:(id)a4 blockedSenderManager:(id)a5 vipReader:(id)a6;
- (EMBlockedSenderManager)blockedSenderManager;
- (EMUserProfileProvider)userProfileProvider;
- (EMVIPReader)vipReader;
- (id)_transformBaseMessage:(id)a3 messageObjectID:(id)a4 duplicateInfo:(id)a5 additionalBuilder:(id)a6;
- (id)_transformPersistedMessage:(id)a3 mailboxScope:(id)a4 duplicateInfo:(id)a5 additionalBuilder:(id)a6;
- (id)transformBaseMessage:(id)a3 mailboxScope:(id)a4 loaderBlock:(id)a5;
- (id)transformPersistedMessages:(id)a3 mailboxScope:(id)a4;
@end

@implementation EDMessageTransformer

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__EDMessageTransformer_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_61 != -1) {
    dispatch_once(&log_onceToken_61, block);
  }
  v2 = (void *)log_log_61;

  return (OS_os_log *)v2;
}

void __27__EDMessageTransformer_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_61;
  log_log_61 = (uint64_t)v1;
}

- (EDMessageTransformer)initWithMailboxProvider:(id)a3 userProfileProvider:(id)a4 blockedSenderManager:(id)a5 vipReader:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)EDMessageTransformer;
  v15 = [(EDMessageTransformer *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_mailboxProvider, a3);
    objc_storeStrong((id *)&v16->_userProfileProvider, a4);
    objc_storeStrong((id *)&v16->_blockedSenderManager, a5);
    objc_storeStrong((id *)&v16->_vipReader, a6);
  }

  return v16;
}

- (id)transformBaseMessage:(id)a3 mailboxScope:(id)a4 loaderBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__EDMessageTransformer_transformBaseMessage_mailboxScope_loaderBlock___block_invoke;
  aBlock[3] = &unk_1E6C03CF8;
  id v11 = v10;
  id v18 = v11;
  id v12 = _Block_copy(aBlock);
  id v13 = [v8 persistentID];

  if (v13)
  {
    id v14 = [(EDMessageTransformer *)self _transformPersistedMessage:v8 mailboxScope:v9 duplicateInfo:0 additionalBuilder:v12];
  }
  else
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F603A0]);
    id v14 = [(EDMessageTransformer *)self _transformBaseMessage:v8 messageObjectID:v15 duplicateInfo:0 additionalBuilder:v12];
  }

  return v14;
}

uint64_t __70__EDMessageTransformer_transformBaseMessage_mailboxScope_loaderBlock___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setLoaderBlock:*(void *)(a1 + 32)];
}

- (id)transformPersistedMessages:(id)a3 mailboxScope:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v21 = a4;
  v25 = objc_opt_new();
  v23 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v22;
  uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v10 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v9, "globalMessageID"));
        id v11 = [(EDMessageTransformer *)self mailboxProvider];
        id v12 = +[EDMessageTransformer mailboxesForPersistedMessage:v9 mailboxProvider:v11];
        uint64_t v13 = [v12 count];

        if (v13)
        {
          id v14 = [v25 objectForKeyedSubscript:v10];
          id v15 = v14;
          if (v14)
          {
            [(_EDMessageDuplicateInfo *)v14 addMessage:v9];
          }
          else
          {
            v16 = [_EDMessageDuplicateInfo alloc];
            v17 = [(EDMessageTransformer *)self mailboxProvider];
            id v15 = [(_EDMessageDuplicateInfo *)v16 initWithMailboxProvider:v17];

            [(_EDMessageDuplicateInfo *)v15 addMessage:v9];
            [v25 setObject:v15 forKeyedSubscript:v10];
            [v23 addObject:v15];
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v6);
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __64__EDMessageTransformer_transformPersistedMessages_mailboxScope___block_invoke;
  v26[3] = &unk_1E6C03D20;
  v26[4] = self;
  id v18 = v21;
  id v27 = v18;
  v19 = objc_msgSend(v23, "ef_compactMap:", v26);

  return v19;
}

id __64__EDMessageTransformer_transformPersistedMessages_mailboxScope___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 combinedMailboxes];
  v5 = [v3 primaryPersistedMessage];
  if (![v4 count])
  {
    uint64_t v6 = +[EDMessageTransformer log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [v5 persistentID];
      objc_claimAutoreleasedReturnValue();
      __64__EDMessageTransformer_transformPersistedMessages_mailboxScope___block_invoke_cold_1();
    }
  }
  if ([v4 count])
  {
    uint64_t v7 = [*(id *)(a1 + 32) _transformPersistedMessage:v5 mailboxScope:*(void *)(a1 + 40) duplicateInfo:v3 additionalBuilder:0];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_transformPersistedMessage:(id)a3 mailboxScope:(id)a4 duplicateInfo:(id)a5 additionalBuilder:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v32 = v12;
  id v14 = [v12 combinedMailboxes];
  if (!v14)
  {
    id v15 = [(EDMessageTransformer *)self mailboxProvider];
    id v14 = +[EDMessageTransformer mailboxesForPersistedMessage:v10 mailboxProvider:v15];
  }
  uint64_t v33 = v14;
  if (![v14 count])
  {
    v16 = +[EDMessageTransformer log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      [v10 persistentID];
      objc_claimAutoreleasedReturnValue();
      -[EDMessageTransformer _transformPersistedMessage:mailboxScope:duplicateInfo:additionalBuilder:]();
    }
  }
  id v17 = [MEMORY[0x1E4F60318] noMailboxesScope];
  BOOL v18 = v17 == v11;

  if (v18)
  {
    v19 = (void *)MEMORY[0x1E4F60318];
    v20 = objc_msgSend(v14, "ef_mapSelector:", sel_objectID);
    uint64_t v21 = [v19 mailboxScopeForMailboxObjectIDs:v20 forExclusion:0];

    id v11 = (id)v21;
  }
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __96__EDMessageTransformer__transformPersistedMessage_mailboxScope_duplicateInfo_additionalBuilder___block_invoke;
  v40[3] = &unk_1E6C01A68;
  id v22 = v11;
  id v41 = v22;
  v23 = objc_msgSend(v14, "ef_filter:", v40);
  int64_t v24 = +[EDConversationPersistence conversationNotificationLevelForConversationFlags:](EDConversationPersistence, "conversationNotificationLevelForConversationFlags:", [v10 conversationFlags]);
  v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F603A0]), "initWithGlobalMessageID:mailboxScope:", objc_msgSend(v10, "globalMessageID"), v22);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __96__EDMessageTransformer__transformPersistedMessage_mailboxScope_duplicateInfo_additionalBuilder___block_invoke_2;
  v34[3] = &unk_1E6C03D48;
  id v26 = v10;
  id v35 = v26;
  id v36 = v25;
  id v27 = v23;
  id v37 = v27;
  int64_t v39 = v24;
  id v28 = v13;
  id v38 = v28;
  id v29 = v25;
  long long v30 = [(EDMessageTransformer *)self _transformBaseMessage:v26 messageObjectID:v29 duplicateInfo:v32 additionalBuilder:v34];

  return v30;
}

uint64_t __96__EDMessageTransformer__transformPersistedMessage_mailboxScope_duplicateInfo_additionalBuilder___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) scopeContainsMailbox:a2];
}

void __96__EDMessageTransformer__transformPersistedMessage_mailboxScope_duplicateInfo_additionalBuilder___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) displayDate];
  [v3 setDisplayDate:v4];

  v5 = [*(id *)(a1 + 32) readLater];
  [v3 setReadLater:v5];

  uint64_t v6 = [*(id *)(a1 + 32) sendLaterDate];
  [v3 setSendLaterDate:v6];

  uint64_t v7 = [*(id *)(a1 + 32) followUp];
  [v3 setFollowUp:v7];

  id v8 = [*(id *)(a1 + 32) category];
  [v3 setCategory:v8];

  objc_msgSend(v3, "setBusinessID:", objc_msgSend(*(id *)(a1 + 32), "businessID"));
  id v9 = [*(id *)(a1 + 32) businessLogoID];
  [v3 setBusinessLogoID:v9];

  id v10 = [v3 category];

  if (!v10)
  {
    id v11 = +[EDMessageTransformer log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __96__EDMessageTransformer__transformPersistedMessage_mailboxScope_duplicateInfo_additionalBuilder___block_invoke_2_cold_2(a1, v11);
    }
  }
  if (_os_feature_enabled_impl() && ![v3 businessID])
  {
    id v12 = +[EDMessageTransformer log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __96__EDMessageTransformer__transformPersistedMessage_mailboxScope_duplicateInfo_additionalBuilder___block_invoke_2_cold_1(a1, v12);
    }

    memset(__b, 170, sizeof(__b));
    __b[8] = 0;
    *(void *)uint64_t v21 = 0xE00000001;
    int v22 = 1;
    pid_t v23 = getpid();
    size_t v19 = 648;
    if (!sysctl(v21, 4u, __b, &v19, 0, 0) && (__b[8] & 0x800) != 0) {
      __debugbreak();
    }
  }
  id v13 = [*(id *)(a1 + 32) summary];
  [v3 setSummary:v13];

  id v14 = [*(id *)(a1 + 32) generatedSummary];
  [v3 setGeneratedSummary:v14];

  objc_msgSend(v3, "setUnsubscribeType:", objc_msgSend(*(id *)(a1 + 32), "unsubscribeType"));
  [v3 setMailboxes:*(void *)(a1 + 48)];
  [v3 setConversationNotificationLevel:*(void *)(a1 + 64)];
  id v15 = [*(id *)(a1 + 32) brandIndicatorLocation];
  [v3 setBrandIndicatorLocation:v15];

  v16 = [*(id *)(a1 + 32) persistedMessageID];
  id v17 = +[EDSearchableIndexItem searchableMessageIDForPersistedMessageID:v16];
  [v3 setSearchableMessageID:v17];

  uint64_t v18 = *(void *)(a1 + 56);
  if (v18) {
    (*(void (**)(uint64_t, id))(v18 + 16))(v18, v3);
  }
}

- (id)_transformBaseMessage:(id)a3 messageObjectID:(id)a4 duplicateInfo:(id)a5 additionalBuilder:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc(MEMORY[0x1E4F60320]);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __94__EDMessageTransformer__transformBaseMessage_messageObjectID_duplicateInfo_additionalBuilder___block_invoke;
  v20[3] = &unk_1E6C03D70;
  id v15 = v12;
  id v21 = v15;
  id v16 = v10;
  id v22 = v16;
  pid_t v23 = self;
  id v17 = v13;
  id v24 = v17;
  uint64_t v18 = (void *)[v14 initWithObjectID:v11 builder:v20];

  return v18;
}

void __94__EDMessageTransformer__transformBaseMessage_messageObjectID_duplicateInfo_additionalBuilder___block_invoke(uint64_t a1, void *a2)
{
  id v32 = a2;
  id v3 = [*(id *)(a1 + 32) combinedDate];
  v4 = v3;
  if (!v3)
  {
    v4 = [*(id *)(a1 + 40) dateReceived];
  }
  [v32 setDate:v4];
  if (!v3) {

  }
  v5 = [*(id *)(a1 + 40) subjectIfAvailable];
  [v32 setSubject:v5];

  uint64_t v6 = [*(id *)(a1 + 40) senders];
  [v32 setSenderList:v6];

  uint64_t v7 = [*(id *)(a1 + 40) to];
  [v32 setToList:v7];

  id v8 = [*(id *)(a1 + 40) cc];
  [v32 setCcList:v8];

  id v9 = [*(id *)(a1 + 32) combinedMessageFlags];
  id v10 = v9;
  if (!v9)
  {
    id v10 = [*(id *)(a1 + 40) flags];
  }
  [v32 setFlags:v10];
  if (!v9) {

  }
  id v11 = [*(id *)(a1 + 48) blockedSenderManager];
  id v12 = [*(id *)(a1 + 40) senders];
  id v13 = [v12 firstObject];
  uint64_t v14 = [v11 isEmailAddressBlocked:v13];

  [v32 setIsBlocked:v14];
  objc_msgSend(v32, "setHasAttachments:", objc_msgSend(*(id *)(a1 + 40), "numberOfAttachments") != 0);
  objc_msgSend(v32, "setConversationID:", objc_msgSend(*(id *)(a1 + 40), "conversationID"));
  id v15 = [*(id *)(a1 + 40) documentID];
  [v32 setDocumentID:v15];

  id v16 = [*(id *)(a1 + 48) userProfileProvider];
  id v17 = [*(id *)(a1 + 40) to];
  objc_msgSend(v32, "setIsToMe:", objc_msgSend(v16, "isMyEmailAddressContainedInAddressList:", v17));

  uint64_t v18 = [*(id *)(a1 + 40) cc];
  objc_msgSend(v32, "setIsCCMe:", objc_msgSend(v16, "isMyEmailAddressContainedInAddressList:", v18));

  size_t v19 = [*(id *)(a1 + 48) vipReader];
  v20 = [*(id *)(a1 + 40) senders];
  id v21 = [v20 firstObject];
  objc_msgSend(v32, "setIsVIP:", objc_msgSend(v19, "isVIPAddress:", v21));

  uint64_t v22 = *(void *)(a1 + 56);
  if (v22) {
    (*(void (**)(uint64_t, id))(v22 + 16))(v22, v32);
  }
  char v23 = objc_opt_respondsToSelector();
  id v24 = *(void **)(a1 + 40);
  if (v23) {
    [v24 bccIfAvailable];
  }
  else {
  v25 = [v24 bcc];
  }
  [v32 setBccList:v25];

  if (objc_opt_respondsToSelector())
  {
    __int16 v26 = [*(id *)(a1 + 40) authenticationState];
    BOOL v28 = (v26 & 0xE08) == 0x408 && (v26 & 0x30) != 16;
    [v32 setIsAuthenticated:v28];
    unint64_t v29 = [*(id *)(a1 + 40) authenticationState];
    if ((v29 & 0x10000) != 0 || (uint64_t v30 = (v29 >> 9) & 7, (v29 & 8) != 0) && v30 == 2 && (v29 & 0x30) != 0x10) {
      uint64_t v31 = 0;
    }
    else {
      uint64_t v31 = (v30 != 0) & (v29 >> 2);
    }
    [v32 setAllowAuthenticationWarning:v31];
  }
}

+ (id)mailboxesForPersistedMessage:(id)a3 mailboxProvider:(id)a4
{
  v22[6] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 labels];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    id v9 = [v5 labels];
    id v10 = objc_msgSend(v9, "ef_compactMap:", &__block_literal_global_75_0);
    id v11 = [v10 allObjects];
  }
  else
  {
    id v12 = [v5 mailbox];
    if (!v12)
    {
      id v13 = +[EDMessageTransformer log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        [v5 persistentID];
        objc_claimAutoreleasedReturnValue();
        +[EDMessageTransformer mailboxesForPersistedMessage:mailboxProvider:]();
      }
    }
    uint64_t v14 = [v12 URL];
    id v15 = (void *)v14;
    if (v14)
    {
      v22[0] = v14;
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    }
    else
    {
      id v16 = +[EDMessageTransformer log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        [v5 persistentID];
        objc_claimAutoreleasedReturnValue();
        +[EDMessageTransformer mailboxesForPersistedMessage:mailboxProvider:]();
      }

      id v11 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __69__EDMessageTransformer_mailboxesForPersistedMessage_mailboxProvider___block_invoke_77;
  v20[3] = &unk_1E6C03DB8;
  id v17 = v6;
  id v21 = v17;
  uint64_t v18 = objc_msgSend(v11, "ef_compactMap:", v20);

  return v18;
}

id __69__EDMessageTransformer_mailboxesForPersistedMessage_mailboxProvider___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 URL];

  return v2;
}

id __69__EDMessageTransformer_mailboxesForPersistedMessage_mailboxProvider___block_invoke_77(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F60310]) initWithURL:v3];
  id v5 = [*(id *)(a1 + 32) mailboxForObjectID:v4];

  return v5;
}

- (EDMailboxProvider)mailboxProvider
{
  return self->_mailboxProvider;
}

- (EMUserProfileProvider)userProfileProvider
{
  return self->_userProfileProvider;
}

- (EMBlockedSenderManager)blockedSenderManager
{
  return self->_blockedSenderManager;
}

- (EMVIPReader)vipReader
{
  return self->_vipReader;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vipReader, 0);
  objc_storeStrong((id *)&self->_blockedSenderManager, 0);
  objc_storeStrong((id *)&self->_userProfileProvider, 0);

  objc_storeStrong((id *)&self->_mailboxProvider, 0);
}

void __64__EDMessageTransformer_transformPersistedMessages_mailboxScope___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "No mailboxes were found for legacy message database id: %{public}@", v5);
}

- (void)_transformPersistedMessage:mailboxScope:duplicateInfo:additionalBuilder:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Unable to find mailboxes for legacy message database id: %{public}@", v5);
}

void __96__EDMessageTransformer__transformPersistedMessage_mailboxScope_duplicateInfo_additionalBuilder___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_ERROR, "Attempting to transform a message %@ with a nil business ID", (uint8_t *)&v3, 0xCu);
}

void __96__EDMessageTransformer__transformPersistedMessage_mailboxScope_duplicateInfo_additionalBuilder___block_invoke_2_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_ERROR, "Attempting to transform message %@ with no category", (uint8_t *)&v3, 0xCu);
}

+ (void)mailboxesForPersistedMessage:mailboxProvider:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "No mailbox URL was found for legacy message database id: %{public}@", v5);
}

+ (void)mailboxesForPersistedMessage:mailboxProvider:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "No mailbox was found for legacy message database id: %{public}@", v5);
}

@end