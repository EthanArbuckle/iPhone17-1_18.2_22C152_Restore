@interface EDOutgoingMessageRepository
+ (id)log;
+ (id)signpostLog;
- (EDMessageChangeManager)messageChangeManager;
- (EDMessagePersistence)messagePersistence;
- (EDOutgoingMessageRepository)initWithMessagePersistence:(id)a3 messageChangeManager:(id)a4;
- (id)messagesForDocumentID:(id)a3 mailboxID:(id)a4;
- (id)outgoingMessageFromPersistedMessage:(id)a3;
- (id)urlForSendLaterFolder;
- (unint64_t)signpostID;
- (void)cancelLastDelayedMessage:(id)a3;
- (void)cancelObservation:(id)a3;
- (void)deleteDraftsInMailboxID:(id)a3 documentID:(id)a4 previousDraftObjectID:(id)a5;
- (void)deliverMessage:(id)a3 usingMailDrop:(BOOL)a4 isCancelable:(BOOL)a5 completion:(id)a6;
- (void)isProcessingWithCompletion:(id)a3;
- (void)numberOfPendingMessagesWithCompletion:(id)a3;
- (void)outboxContainsMessageFromAccountObjectID:(id)a3 completion:(id)a4;
- (void)performBlock:(id)a3;
- (void)processAllQueuedMessages;
- (void)removeSendLaterDateFromMessage:(id)a3 draftsMailboxObjectID:(id)a4 completion:(id)a5;
- (void)resumeDeliveryQueue;
- (void)saveDraftMessage:(id)a3 mailboxID:(id)a4 previousDraftObjectID:(id)a5 completion:(id)a6;
- (void)saveSendLaterMessage:(id)a3 sendLaterDate:(id)a4 completion:(id)a5;
- (void)scheduleAlarmForSendLaterDate:(id)a3 completion:(id)a4;
- (void)setMessagePersistence:(id)a3;
- (void)startObservingPendingMessageChangesWithChangeObserver:(id)a3 observationIdentifier:(id)a4;
- (void)suspendDeliveryQueue;
- (void)updateSendLaterDate:(id)a3 message:(id)a4 completion:(id)a5;
@end

@implementation EDOutgoingMessageRepository

- (EDOutgoingMessageRepository)initWithMessagePersistence:(id)a3 messageChangeManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EDOutgoingMessageRepository;
  v9 = [(EDOutgoingMessageRepository *)&v14 init];
  if (v9)
  {
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.email.EDOutgoingMessageRepository", v10);
    workQueue = v9->_workQueue;
    v9->_workQueue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v9->_messagePersistence, a3);
    objc_storeStrong((id *)&v9->_messageChangeManager, a4);
  }

  return v9;
}

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__EDOutgoingMessageRepository_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_65 != -1) {
    dispatch_once(&log_onceToken_65, block);
  }
  v2 = (void *)log_log_65;

  return v2;
}

void __34__EDOutgoingMessageRepository_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_65;
  log_log_65 = (uint64_t)v1;
}

+ (id)signpostLog
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__EDOutgoingMessageRepository_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_5 != -1) {
    dispatch_once(&signpostLog_onceToken_5, block);
  }
  v2 = (void *)signpostLog_log_5;

  return v2;
}

void __42__EDOutgoingMessageRepository_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  v2 = (void *)signpostLog_log_5;
  signpostLog_log_5 = (uint64_t)v1;
}

- (unint64_t)signpostID
{
  id v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (void)performBlock:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F60E10] transactionWithDescription:@"com.apple.email.outgoingmessagerepository.deliveryworkblock"];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__EDOutgoingMessageRepository_performBlock___block_invoke;
  v9[3] = &unk_1E6C007D8;
  id v10 = v5;
  id v11 = v4;
  id v6 = v5;
  id v7 = v4;
  id v8 = _Block_copy(v9);
  dispatch_async((dispatch_queue_t)self->_workQueue, v8);
}

uint64_t __44__EDOutgoingMessageRepository_performBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);

  return [v2 invalidate];
}

- (void)saveDraftMessage:(id)a3 mailboxID:(id)a4 previousDraftObjectID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __91__EDOutgoingMessageRepository_saveDraftMessage_mailboxID_previousDraftObjectID_completion___block_invoke;
  v18[3] = &unk_1E6C03E30;
  v18[4] = self;
  id v19 = v12;
  id v20 = v10;
  id v21 = v11;
  id v22 = v13;
  id v14 = v13;
  id v15 = v11;
  id v16 = v10;
  id v17 = v12;
  [(EDOutgoingMessageRepository *)self performBlock:v18];
}

void __91__EDOutgoingMessageRepository_saveDraftMessage_mailboxID_previousDraftObjectID_completion___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v2 = +[EDOutgoingMessageRepository signpostLog];
  os_signpost_id_t v3 = [*(id *)(a1 + 32) signpostID];
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v46 = v4;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v2, OS_SIGNPOST_EVENT, v3, "EMAIL DELIVERY", "Begin Saving Draft %@", buf, 0xCu);
  }

  v5 = [*(id *)(a1 + 32) messagePersistence];
  id v6 = [v5 baseMessageForOutgoingMessage:*(void *)(a1 + 48) isDraft:1];

  id v7 = [v6 headers];
  v35 = [v7 firstHeaderForKey:*MEMORY[0x1E4F60780]];

  id v8 = [*(id *)(a1 + 32) messagesForDocumentID:v35 mailboxID:*(void *)(a1 + 56)];
  v9 = [*(id *)(a1 + 32) messageChangeManager];
  v44 = v6;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
  id v11 = [*(id *)(a1 + 56) url];
  v36 = [v9 addNewMessages:v10 mailboxURL:v11 userInitiated:1];

  id v12 = (void *)MEMORY[0x1E4F60318];
  uint64_t v43 = *(void *)(a1 + 56);
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
  id v14 = [v12 mailboxScopeForMailboxObjectIDs:v13 forExclusion:0];

  id v15 = [*(id *)(a1 + 32) messagePersistence];
  v34 = [v15 messagesForPersistedMessages:v36 mailboxScope:v14];

  if ([v8 count])
  {
    id v16 = [*(id *)(a1 + 32) messageChangeManager];
    [v16 deleteMessages:v8];
  }
  if (*(void *)(a1 + 40))
  {
    id v17 = [*(id *)(a1 + 32) messagePersistence];
    uint64_t v42 = *(void *)(a1 + 40);
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
    id v19 = [v17 persistedMessagesForMessageObjectIDs:v18 requireProtectedData:0 temporarilyUnavailableMessageObjectIDs:0];

    id v20 = [*(id *)(a1 + 32) messageChangeManager];
    [v20 deleteMessages:v19];
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v21 = v34;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v38;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v38 != v23) {
          objc_enumerationMutation(v21);
        }
        v25 = *(void **)(*((void *)&v37 + 1) + 8 * v24);
        v26 = [*(id *)(a1 + 32) messagePersistence];
        v27 = [v25 objectID];
        id v28 = (id)[v26 requestSummaryForMessageObjectID:v27];

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [v21 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v22);
  }

  v29 = +[EDOutgoingMessageRepository signpostLog];
  os_signpost_id_t v30 = [*(id *)(a1 + 32) signpostID];
  if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    uint64_t v31 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v46 = v31;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v29, OS_SIGNPOST_EVENT, v30, "EMAIL DELIVERY", "End Saving Draft %@", buf, 0xCu);
  }

  uint64_t v32 = *(void *)(a1 + 64);
  v33 = [v21 firstObject];
  (*(void (**)(uint64_t, void *))(v32 + 16))(v32, v33);
}

- (void)saveSendLaterMessage:(id)a3 sendLaterDate:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__EDOutgoingMessageRepository_saveSendLaterMessage_sendLaterDate_completion___block_invoke;
  v14[3] = &unk_1E6C01A40;
  v14[4] = self;
  id v15 = v9;
  id v16 = v8;
  id v17 = v10;
  id v11 = v10;
  id v12 = v8;
  id v13 = v9;
  [(EDOutgoingMessageRepository *)self performBlock:v14];
}

void __77__EDOutgoingMessageRepository_saveSendLaterMessage_sendLaterDate_completion___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v2 = +[EDOutgoingMessageRepository signpostLog];
  os_signpost_id_t v3 = [*(id *)(a1 + 32) signpostID];
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    uint64_t v34 = v4;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v2, OS_SIGNPOST_INTERVAL_BEGIN, v3, "EMAIL DELIVERY", "Begin saving outgoing message for outgoing message for %{public}@", buf, 0xCu);
  }

  v5 = [*(id *)(a1 + 32) messagePersistence];
  id v6 = [v5 baseMessageForOutgoingMessage:*(void *)(a1 + 48) isDraft:1];

  id v7 = +[EDOutgoingMessageRepository signpostLog];
  os_signpost_id_t v8 = [*(id *)(a1 + 32) signpostID];
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    uint64_t v9 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    uint64_t v34 = v9;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v7, OS_SIGNPOST_INTERVAL_END, v8, "EMAIL DELIVERY", "Base message for %{public}@ was created", buf, 0xCu);
  }

  id v10 = [*(id *)(a1 + 32) messageChangeManager];
  uint64_t v32 = v6;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  id v12 = [*(id *)(a1 + 32) urlForSendLaterFolder];
  id v13 = [v10 addNewMessages:v11 mailboxURL:v12 userInitiated:1];

  id v14 = objc_alloc(MEMORY[0x1E4F60310]);
  id v15 = [*(id *)(a1 + 32) urlForSendLaterFolder];
  id v16 = (void *)[v14 initWithURL:v15];

  id v17 = (void *)MEMORY[0x1E4F60318];
  uint64_t v31 = v16;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  id v19 = [v17 mailboxScopeForMailboxObjectIDs:v18 forExclusion:0];

  id v20 = [*(id *)(a1 + 32) messagePersistence];
  id v21 = [v20 messagesForPersistedMessages:v13 mailboxScope:v19];

  uint64_t v22 = +[EDOutgoingMessageRepository signpostLog];
  os_signpost_id_t v23 = [*(id *)(a1 + 32) signpostID];
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    uint64_t v24 = [v13 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v34 = v24;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v22, OS_SIGNPOST_INTERVAL_END, v23, "EMAIL DELIVERY", "%lu of messages are to be returned in completion", buf, 0xCu);
  }

  v25 = [*(id *)(a1 + 32) messagePersistence];
  [v25 persistSendLaterForMessages:v13 date:*(void *)(a1 + 40)];

  v26 = +[EDOutgoingMessageRepository signpostLog];
  os_signpost_id_t v27 = [*(id *)(a1 + 32) signpostID];
  if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    uint64_t v28 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    uint64_t v34 = v28;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v26, OS_SIGNPOST_INTERVAL_END, v27, "EMAIL DELIVERY", "End saving outgoing message for message at for %{public}@", buf, 0xCu);
  }

  uint64_t v29 = *(void *)(a1 + 56);
  if (v29)
  {
    os_signpost_id_t v30 = [v21 firstObject];
    (*(void (**)(uint64_t, void *))(v29 + 16))(v29, v30);
  }
}

- (void)updateSendLaterDate:(id)a3 message:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__EDOutgoingMessageRepository_updateSendLaterDate_message_completion___block_invoke;
  v14[3] = &unk_1E6C01A40;
  v14[4] = self;
  id v15 = v9;
  id v16 = v8;
  id v17 = v10;
  id v11 = v10;
  id v12 = v8;
  id v13 = v9;
  [(EDOutgoingMessageRepository *)self performBlock:v14];
}

void __70__EDOutgoingMessageRepository_updateSendLaterDate_message_completion___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = +[EDOutgoingMessageRepository signpostLog];
  os_signpost_id_t v3 = [*(id *)(a1 + 32) signpostID];
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    uint64_t v4 = [*(id *)(a1 + 40) documentID];
    uint64_t v5 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    id v17 = v4;
    __int16 v18 = 2114;
    uint64_t v19 = v5;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v2, OS_SIGNPOST_INTERVAL_BEGIN, v3, "EMAIL DELIVERY", "Begin editing outgoing message for documentID %@ at for %{public}@", buf, 0x16u);
  }
  id v6 = [*(id *)(a1 + 32) messagePersistence];
  id v7 = [*(id *)(a1 + 40) objectID];
  id v15 = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  id v9 = [v6 persistedMessagesForObjectIDs:v8 requireProtectedData:0];

  id v10 = [*(id *)(a1 + 32) messagePersistence];
  [v10 persistSendLaterForMessages:v9 date:*(void *)(a1 + 48)];

  id v11 = +[EDOutgoingMessageRepository signpostLog];
  os_signpost_id_t v12 = [*(id *)(a1 + 32) signpostID];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    id v13 = [*(id *)(a1 + 40) documentID];
    uint64_t v14 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    id v17 = v13;
    __int16 v18 = 2114;
    uint64_t v19 = v14;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v11, OS_SIGNPOST_INTERVAL_END, v12, "EMAIL DELIVERY", "End editing outgoing message for documentID %@ at for %{public}@", buf, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)removeSendLaterDateFromMessage:(id)a3 draftsMailboxObjectID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __95__EDOutgoingMessageRepository_removeSendLaterDateFromMessage_draftsMailboxObjectID_completion___block_invoke;
  v14[3] = &unk_1E6C01A40;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(EDOutgoingMessageRepository *)self performBlock:v14];
}

void __95__EDOutgoingMessageRepository_removeSendLaterDateFromMessage_draftsMailboxObjectID_completion___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = +[EDOutgoingMessageRepository signpostLog];
  os_signpost_id_t v3 = [*(id *)(a1 + 32) signpostID];
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    uint64_t v4 = [*(id *)(a1 + 40) documentID];
    *(_DWORD *)buf = 138412290;
    v26 = v4;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v2, OS_SIGNPOST_INTERVAL_BEGIN, v3, "EMAIL DELIVERY", "Begin removing send later date for message with documentID %@", buf, 0xCu);
  }
  uint64_t v5 = [*(id *)(a1 + 32) messagePersistence];
  id v6 = [*(id *)(a1 + 40) objectID];
  uint64_t v24 = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  id v8 = [v5 persistedMessagesForObjectIDs:v7 requireProtectedData:0];

  id v9 = [*(id *)(a1 + 32) messagePersistence];
  [v9 persistSendLaterForMessages:v8 date:0];

  id v10 = [*(id *)(a1 + 32) messageChangeManager];
  id v11 = [*(id *)(a1 + 48) url];
  id v12 = [v10 moveMessages:v8 destinationMailboxURL:v11 userInitiated:1];

  id v13 = (void *)MEMORY[0x1E4F60318];
  uint64_t v23 = *(void *)(a1 + 48);
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  id v15 = [v13 mailboxScopeForMailboxObjectIDs:v14 forExclusion:0];

  id v16 = [*(id *)(a1 + 32) messagePersistence];
  id v17 = [v16 messagesForPersistedMessages:v12 mailboxScope:v15];

  __int16 v18 = +[EDOutgoingMessageRepository signpostLog];
  os_signpost_id_t v19 = [*(id *)(a1 + 32) signpostID];
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    uint64_t v20 = [*(id *)(a1 + 40) documentID];
    *(_DWORD *)buf = 138412290;
    v26 = v20;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v18, OS_SIGNPOST_INTERVAL_END, v19, "EMAIL DELIVERY", "End removing send later date for message for documentID %@", buf, 0xCu);
  }
  uint64_t v21 = *(void *)(a1 + 56);
  uint64_t v22 = [v17 firstObject];
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);
}

- (void)scheduleAlarmForSendLaterDate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(EDOutgoingMessageRepository *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDOutgoingMessageRepository scheduleAlarmForSendLaterDate:completion:]", "EDOutgoingMessageRepository.m", 129, "0");
}

- (void)deleteDraftsInMailboxID:(id)a3 documentID:(id)a4 previousDraftObjectID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __88__EDOutgoingMessageRepository_deleteDraftsInMailboxID_documentID_previousDraftObjectID___block_invoke;
  v14[3] = &unk_1E6BFFA78;
  id v15 = v10;
  id v16 = self;
  id v17 = v8;
  id v18 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(EDOutgoingMessageRepository *)self performBlock:v14];
}

void __88__EDOutgoingMessageRepository_deleteDraftsInMailboxID_documentID_previousDraftObjectID___block_invoke(uint64_t a1)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  v2 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    os_signpost_id_t v3 = +[EDOutgoingMessageRepository log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *v2;
      int v20 = 138412290;
      uint64_t v21 = v4;
      _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "Deleting Draft %@", (uint8_t *)&v20, 0xCu);
    }

    uint64_t v5 = [*(id *)(a1 + 40) messagePersistence];
    v26[0] = *(void *)(a1 + 32);
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    id v7 = [v5 persistedMessagesForMessageObjectIDs:v6 requireProtectedData:0 temporarilyUnavailableMessageObjectIDs:0];

    if ([v7 count])
    {
      id v8 = [*(id *)(a1 + 40) messageChangeManager];
      [v8 deleteMessages:v7];
    }
    else
    {
      id v8 = +[EDOutgoingMessageRepository log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __88__EDOutgoingMessageRepository_deleteDraftsInMailboxID_documentID_previousDraftObjectID___block_invoke_cold_2(v2, v8);
      }
    }
  }
  id v9 = (uint64_t *)(a1 + 48);
  if (*(void *)(a1 + 48))
  {
    id v10 = (uint64_t *)(a1 + 56);
    if (*(void *)(a1 + 56))
    {
      id v11 = objc_msgSend(*(id *)(a1 + 40), "messagesForDocumentID:mailboxID:");
      id v12 = +[EDOutgoingMessageRepository log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *v10;
        uint64_t v14 = *v9;
        int v20 = 138412546;
        uint64_t v21 = v13;
        __int16 v22 = 2112;
        uint64_t v23 = v14;
        _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_DEFAULT, "Deleting draft messages for documentID %@ in mailboxID %@", (uint8_t *)&v20, 0x16u);
      }

      if ([v11 count])
      {
        id v15 = +[EDOutgoingMessageRepository log];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = [v11 count];
          uint64_t v17 = *v10;
          uint64_t v18 = *v9;
          int v20 = 134218498;
          uint64_t v21 = v16;
          __int16 v22 = 2112;
          uint64_t v23 = v17;
          __int16 v24 = 2112;
          uint64_t v25 = v18;
          _os_log_impl(&dword_1DB39C000, v15, OS_LOG_TYPE_DEFAULT, "Deleting %lu messages for documentID %@ in mailboxID %@", (uint8_t *)&v20, 0x20u);
        }

        os_signpost_id_t v19 = [*(id *)(a1 + 40) messageChangeManager];
        [v19 deleteMessages:v11];
      }
      else
      {
        os_signpost_id_t v19 = +[EDOutgoingMessageRepository log];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          __88__EDOutgoingMessageRepository_deleteDraftsInMailboxID_documentID_previousDraftObjectID___block_invoke_cold_1((uint64_t *)(a1 + 56), (uint64_t *)(a1 + 48), v19);
        }
      }
    }
  }
}

- (void)deliverMessage:(id)a3 usingMailDrop:(BOOL)a4 isCancelable:(BOOL)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  [(EDOutgoingMessageRepository *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDOutgoingMessageRepository deliverMessage:usingMailDrop:isCancelable:completion:]", "EDOutgoingMessageRepository.m", 158, "0");
}

- (id)outgoingMessageFromPersistedMessage:(id)a3
{
  id v5 = a3;
  [(EDOutgoingMessageRepository *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDOutgoingMessageRepository outgoingMessageFromPersistedMessage:]", "EDOutgoingMessageRepository.m", 162, "0");
}

- (void)cancelLastDelayedMessage:(id)a3
{
  id v5 = a3;
  [(EDOutgoingMessageRepository *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDOutgoingMessageRepository cancelLastDelayedMessage:]", "EDOutgoingMessageRepository.m", 166, "0");
}

- (void)isProcessingWithCompletion:(id)a3
{
  id v5 = a3;
  [(EDOutgoingMessageRepository *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDOutgoingMessageRepository isProcessingWithCompletion:]", "EDOutgoingMessageRepository.m", 170, "0");
}

- (void)numberOfPendingMessagesWithCompletion:(id)a3
{
  id v5 = a3;
  [(EDOutgoingMessageRepository *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDOutgoingMessageRepository numberOfPendingMessagesWithCompletion:]", "EDOutgoingMessageRepository.m", 174, "0");
}

- (void)outboxContainsMessageFromAccountObjectID:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(EDOutgoingMessageRepository *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDOutgoingMessageRepository outboxContainsMessageFromAccountObjectID:completion:]", "EDOutgoingMessageRepository.m", 178, "0");
}

- (void)processAllQueuedMessages
{
}

- (void)resumeDeliveryQueue
{
}

- (void)suspendDeliveryQueue
{
}

- (id)messagesForDocumentID:(id)a3 mailboxID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(EDOutgoingMessageRepository *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDOutgoingMessageRepository messagesForDocumentID:mailboxID:]", "EDOutgoingMessageRepository.m", 194, "0");
}

- (void)startObservingPendingMessageChangesWithChangeObserver:(id)a3 observationIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(EDOutgoingMessageRepository *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDOutgoingMessageRepository startObservingPendingMessageChangesWithChangeObserver:observationIdentifier:]", "EDOutgoingMessageRepository.m", 198, "0");
}

- (void)cancelObservation:(id)a3
{
  id v5 = a3;
  [(EDOutgoingMessageRepository *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDOutgoingMessageRepository cancelObservation:]", "EDOutgoingMessageRepository.m", 202, "0");
}

- (id)urlForSendLaterFolder
{
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (void)setMessagePersistence:(id)a3
{
}

- (EDMessageChangeManager)messageChangeManager
{
  return self->_messageChangeManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageChangeManager, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __88__EDOutgoingMessageRepository_deleteDraftsInMailboxID_documentID_previousDraftObjectID___block_invoke_cold_1(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Unable to find persisted message for draft documentID %@ in mailboxID %@", (uint8_t *)&v5, 0x16u);
}

void __88__EDOutgoingMessageRepository_deleteDraftsInMailboxID_documentID_previousDraftObjectID___block_invoke_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_ERROR, "Unable to find persisted message for draft: %@", (uint8_t *)&v3, 0xCu);
}

@end