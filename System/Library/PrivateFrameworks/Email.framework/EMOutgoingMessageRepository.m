@interface EMOutgoingMessageRepository
+ (NSXPCInterface)remoteInterface;
+ (OS_os_log)log;
+ (id)signpostLog;
- (BOOL)hasDelayedMessages;
- (BOOL)isProcessing;
- (BOOL)outboxContainsMessageFromAccount:(id)a3;
- (EFCancelable)registrationCancelable;
- (EFScheduler)scheduler;
- (EMOutgoingMessageRepository)initWithRemoteConnection:(id)a3;
- (EMRemoteConnection)connection;
- (NSMutableArray)observers;
- (NSNumber)pendingMessages;
- (id)deliverMessage:(id)a3 usingMailDrop:(BOOL)a4 isCancelable:(BOOL)a5;
- (id)removeSendLaterDateFromMessage:(id)a3 draftsMailboxObjectID:(id)a4;
- (id)saveDraftMessage:(id)a3 mailboxObjectID:(id)a4 previousDraftObjectID:(id)a5;
- (id)saveSendLaterMessage:(id)a3 sendLaterDate:(id)a4;
- (id)updateSendLaterDate:(id)a3 message:(id)a4;
- (unint64_t)numberOfPendingMessages;
- (unint64_t)signpostID;
- (void)_restartObservingUnsentChangesIfNecessary;
- (void)_startObservingUnsentChangesIfNecessary;
- (void)addOutgoingMessageRepositoryObserver:(id)a3;
- (void)cancelLastDelayedMessage:(id)a3;
- (void)dealloc;
- (void)deleteDraftsInMailbox:(id)a3 documentID:(id)a4 previousDraftObjectID:(id)a5;
- (void)hasDelayedMessagesDidChange:(BOOL)a3;
- (void)numberOfPendingMessagesChanged:(id)a3;
- (void)processAllQueuedMessages;
- (void)removeOutgoingMessageRepositoryObserver:(id)a3;
- (void)resumeDeliveryQueue;
- (void)scheduleAlarmForSendLaterDate:(id)a3 completion:(id)a4;
- (void)setConnection:(id)a3;
- (void)setHasDelayedMessages:(BOOL)a3;
- (void)setPendingMessages:(id)a3;
- (void)setRegistrationCancelable:(id)a3;
- (void)suspendDeliveryQueue;
- (void)updateObserversForHasDelayedMessagesDidChange;
- (void)updateObserversForPendingMessagesChange;
@end

@implementation EMOutgoingMessageRepository

void __62__EMOutgoingMessageRepository_numberOfPendingMessagesChanged___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) pendingMessages];
  v3 = *(void **)(a1 + 40);

  if (v2 != v3)
  {
    [*(id *)(a1 + 32) setPendingMessages:*(void *)(a1 + 40)];
    v4 = *(void **)(a1 + 32);
    [v4 updateObserversForPendingMessagesChange];
  }
}

- (void)updateObserversForPendingMessagesChange
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [(EMOutgoingMessageRepository *)self pendingMessages];
  uint64_t v4 = [v3 unsignedIntegerValue];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v5 = [(EMOutgoingMessageRepository *)self observers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) numberOfPendingMessagesChanged:v4];
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

void __71__EMOutgoingMessageRepository_removeOutgoingMessageRepositoryObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 removeObject:*(void *)(a1 + 40)];
}

uint64_t __68__EMOutgoingMessageRepository_addOutgoingMessageRepositoryObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 addObject:*(void *)(a1 + 40)];

  v3 = [*(id *)(a1 + 32) pendingMessages];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    v5 = [*(id *)(a1 + 32) pendingMessages];
    objc_msgSend(v4, "numberOfPendingMessagesChanged:", objc_msgSend(v5, "unsignedIntegerValue"));
  }
  uint64_t v6 = *(void **)(a1 + 32);
  return [v6 _startObservingUnsentChangesIfNecessary];
}

- (NSNumber)pendingMessages
{
  return self->_pendingMessages;
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (void)setPendingMessages:(id)a3
{
}

+ (NSXPCInterface)remoteInterface
{
  id v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A761C8];
  v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v3 forSelector:sel_numberOfPendingMessagesChanged_ argumentIndex:0 ofReply:0];

  uint64_t v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A86B58];
  [v4 setInterface:v2 forSelector:sel_startObservingPendingMessageChangesWithChangeObserver_observationIdentifier_ argumentIndex:0 ofReply:0];

  return (NSXPCInterface *)v4;
}

- (void)removeOutgoingMessageRepositoryObserver:(id)a3
{
  id v4 = a3;
  v5 = [(EMOutgoingMessageRepository *)self scheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__EMOutgoingMessageRepository_removeOutgoingMessageRepositoryObserver___block_invoke;
  v7[3] = &unk_1E63E2760;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 performBlock:v7];
}

- (void)addOutgoingMessageRepositoryObserver:(id)a3
{
  id v4 = a3;
  v5 = [(EMOutgoingMessageRepository *)self scheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__EMOutgoingMessageRepository_addOutgoingMessageRepositoryObserver___block_invoke;
  v7[3] = &unk_1E63E2760;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 performBlock:v7];
}

- (EFScheduler)scheduler
{
  return self->_scheduler;
}

- (void)_startObservingUnsentChangesIfNecessary
{
  v3 = [(EMOutgoingMessageRepository *)self registrationCancelable];

  if (!v3)
  {
    atomic_store(1u, (unsigned __int8 *)&self->_hasStartedObservingUnsentChanges);
    id v4 = [(EMOutgoingMessageRepository *)self connection];
    v5 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_164];

    id v6 = [[EMObjectID alloc] initAsEphemeralID:1];
    [v5 startObservingPendingMessageChangesWithChangeObserver:self observationIdentifier:v6];
    uint64_t v7 = (void *)MEMORY[0x1E4F60D40];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __70__EMOutgoingMessageRepository__startObservingUnsentChangesIfNecessary__block_invoke_167;
    uint64_t v14 = &unk_1E63E2760;
    id v8 = v5;
    id v15 = v8;
    id v9 = v6;
    id v16 = v9;
    long long v10 = [v7 tokenWithCancelationBlock:&v11];
    -[EMOutgoingMessageRepository setRegistrationCancelable:](self, "setRegistrationCancelable:", v10, v11, v12, v13, v14);
  }
}

- (EFCancelable)registrationCancelable
{
  return (EFCancelable *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRegistrationCancelable:(id)a3
{
}

- (EMRemoteConnection)connection
{
  return (EMRemoteConnection *)objc_getProperty(self, a2, 16, 1);
}

- (EMOutgoingMessageRepository)initWithRemoteConnection:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)EMOutgoingMessageRepository;
  id v6 = [(EMOutgoingMessageRepository *)&v20 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    uint64_t v8 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.email.EMOutgoingMessageRepository" qualityOfService:17];
    scheduler = v7->_scheduler;
    v7->_scheduler = (EFScheduler *)v8;

    long long v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    observers = v7->_observers;
    v7->_observers = v10;

    atomic_store(0, (unsigned __int8 *)&v7->_hasStartedObservingUnsentChanges);
    v7->_hasDelayedMessages = 0;
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v7);
    connection = v7->_connection;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __56__EMOutgoingMessageRepository_initWithRemoteConnection___block_invoke;
    v17[3] = &unk_1E63E2688;
    objc_copyWeak(&v18, &location);
    [(EMRemoteConnection *)connection addResetHandler:v17];
    v13 = v7->_connection;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__EMOutgoingMessageRepository_initWithRemoteConnection___block_invoke_2;
    v15[3] = &unk_1E63E2688;
    objc_copyWeak(&v16, &location);
    [(EMRemoteConnection *)v13 addRecoveryHandler:v15];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)numberOfPendingMessagesChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(EMOutgoingMessageRepository *)self scheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__EMOutgoingMessageRepository_numberOfPendingMessagesChanged___block_invoke;
  v7[3] = &unk_1E63E2760;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 performBlock:v7];
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__EMOutgoingMessageRepository_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_31 != -1) {
    dispatch_once(&log_onceToken_31, block);
  }
  id v2 = (void *)log_log_31;
  return (OS_os_log *)v2;
}

void __34__EMOutgoingMessageRepository_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)log_log_31;
  log_log_31 = (uint64_t)v1;
}

+ (id)signpostLog
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__EMOutgoingMessageRepository_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_2 != -1) {
    dispatch_once(&signpostLog_onceToken_2, block);
  }
  id v2 = (void *)signpostLog_log_2;
  return v2;
}

void __42__EMOutgoingMessageRepository_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  id v2 = (void *)signpostLog_log_2;
  signpostLog_log_2 = (uint64_t)v1;
}

- (unint64_t)signpostID
{
  id v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

void __56__EMOutgoingMessageRepository_initWithRemoteConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setRegistrationCancelable:0];
}

void __56__EMOutgoingMessageRepository_initWithRemoteConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _restartObservingUnsentChangesIfNecessary];
}

- (void)dealloc
{
  [(EFCancelable *)self->_registrationCancelable cancel];
  v3.receiver = self;
  v3.super_class = (Class)EMOutgoingMessageRepository;
  [(EMOutgoingMessageRepository *)&v3 dealloc];
}

- (id)saveDraftMessage:(id)a3 mailboxObjectID:(id)a4 previousDraftObjectID:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x1E4F60E18] promise];
  uint64_t v12 = +[EMOutgoingMessageRepository signpostLog];
  os_signpost_id_t v13 = [(EMOutgoingMessageRepository *)self signpostID];
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v10;
    _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "EMAIL DELIVERY", "Begin Saving Draft %@", buf, 0xCu);
  }

  uint64_t v14 = [(EMOutgoingMessageRepository *)self connection];
  id v15 = [v14 reattemptingRemoteObjectProxy];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __86__EMOutgoingMessageRepository_saveDraftMessage_mailboxObjectID_previousDraftObjectID___block_invoke;
  v20[3] = &unk_1E63E5B68;
  v20[4] = self;
  id v16 = v11;
  id v21 = v16;
  id v17 = v10;
  id v22 = v17;
  [v15 saveDraftMessage:v8 mailboxID:v9 previousDraftObjectID:v17 completion:v20];

  id v18 = [v16 future];

  return v18;
}

void __86__EMOutgoingMessageRepository_saveDraftMessage_mailboxObjectID_previousDraftObjectID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_signpost_id_t v4 = [*(id *)(a1 + 32) scheduler];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __86__EMOutgoingMessageRepository_saveDraftMessage_mailboxObjectID_previousDraftObjectID___block_invoke_2;
  uint64_t v12 = &unk_1E63E2760;
  id v13 = *(id *)(a1 + 40);
  id v5 = v3;
  id v14 = v5;
  [v4 performBlock:&v9];

  id v6 = +[EMOutgoingMessageRepository signpostLog];
  os_signpost_id_t v7 = [*(id *)(a1 + 32) signpostID];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    uint64_t v8 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v8;
    _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v6, OS_SIGNPOST_INTERVAL_END, v7, "EMAIL DELIVERY", "End Saving Draft %@", buf, 0xCu);
  }
}

uint64_t __86__EMOutgoingMessageRepository_saveDraftMessage_mailboxObjectID_previousDraftObjectID___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:*(void *)(a1 + 40)];
}

- (id)saveSendLaterMessage:(id)a3 sendLaterDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F60E18] promise];
  uint64_t v9 = +[EMOutgoingMessageRepository signpostLog];
  os_signpost_id_t v10 = [(EMOutgoingMessageRepository *)self signpostID];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v10, "EMAIL DELIVERY", "Begin Saving Send Later", buf, 2u);
  }

  uint64_t v11 = [(EMOutgoingMessageRepository *)self connection];
  uint64_t v12 = [v11 reattemptingRemoteObjectProxy];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __66__EMOutgoingMessageRepository_saveSendLaterMessage_sendLaterDate___block_invoke;
  v19 = &unk_1E63E5B90;
  objc_super v20 = self;
  id v13 = v8;
  id v21 = v13;
  [v12 saveSendLaterMessage:v6 sendLaterDate:v7 completion:&v16];

  id v14 = objc_msgSend(v13, "future", v16, v17, v18, v19, v20);

  return v14;
}

void __66__EMOutgoingMessageRepository_saveSendLaterMessage_sendLaterDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_signpost_id_t v4 = [*(id *)(a1 + 32) scheduler];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__EMOutgoingMessageRepository_saveSendLaterMessage_sendLaterDate___block_invoke_2;
  v9[3] = &unk_1E63E2760;
  id v10 = *(id *)(a1 + 40);
  id v5 = v3;
  id v11 = v5;
  [v4 performBlock:v9];

  id v6 = +[EMOutgoingMessageRepository signpostLog];
  os_signpost_id_t v7 = [*(id *)(a1 + 32) signpostID];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v6, OS_SIGNPOST_INTERVAL_END, v7, "EMAIL DELIVERY", "End Saving Send Later", v8, 2u);
  }
}

uint64_t __66__EMOutgoingMessageRepository_saveSendLaterMessage_sendLaterDate___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:*(void *)(a1 + 40)];
}

- (id)updateSendLaterDate:(id)a3 message:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"EMOutgoingMessageRepository.m", 125, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];
  }
  uint64_t v9 = [MEMORY[0x1E4F60E18] promise];
  id v10 = +[EMOutgoingMessageRepository signpostLog];
  os_signpost_id_t v11 = [(EMOutgoingMessageRepository *)self signpostID];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "EMAIL DELIVERY", "Begin Saving Send Later", buf, 2u);
  }

  uint64_t v12 = [(EMOutgoingMessageRepository *)self connection];
  id v13 = [v12 reattemptingRemoteObjectProxy];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __59__EMOutgoingMessageRepository_updateSendLaterDate_message___block_invoke;
  v18[3] = &unk_1E63E5B90;
  v18[4] = self;
  id v14 = v9;
  id v19 = v14;
  [v13 updateSendLaterDate:v7 message:v8 completion:v18];

  id v15 = [v14 future];

  return v15;
}

void __59__EMOutgoingMessageRepository_updateSendLaterDate_message___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_signpost_id_t v4 = [*(id *)(a1 + 32) scheduler];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__EMOutgoingMessageRepository_updateSendLaterDate_message___block_invoke_2;
  v9[3] = &unk_1E63E2760;
  id v10 = *(id *)(a1 + 40);
  id v5 = v3;
  id v11 = v5;
  [v4 performBlock:v9];

  id v6 = +[EMOutgoingMessageRepository signpostLog];
  os_signpost_id_t v7 = [*(id *)(a1 + 32) signpostID];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)id v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v6, OS_SIGNPOST_INTERVAL_END, v7, "EMAIL DELIVERY", "End Saving Send Later", v8, 2u);
  }
}

uint64_t __59__EMOutgoingMessageRepository_updateSendLaterDate_message___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:*(void *)(a1 + 40)];
}

- (id)removeSendLaterDateFromMessage:(id)a3 draftsMailboxObjectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F60E18] promise];
  uint64_t v9 = +[EMOutgoingMessageRepository signpostLog];
  os_signpost_id_t v10 = [(EMOutgoingMessageRepository *)self signpostID];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v10, "EMAIL DELIVERY", "Begin Removing Send Later", buf, 2u);
  }

  id v11 = [(EMOutgoingMessageRepository *)self connection];
  uint64_t v12 = [v11 reattemptingRemoteObjectProxy];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __84__EMOutgoingMessageRepository_removeSendLaterDateFromMessage_draftsMailboxObjectID___block_invoke;
  id v19 = &unk_1E63E5B90;
  objc_super v20 = self;
  id v13 = v8;
  id v21 = v13;
  [v12 removeSendLaterDateFromMessage:v6 draftsMailboxObjectID:v7 completion:&v16];

  id v14 = objc_msgSend(v13, "future", v16, v17, v18, v19, v20);

  return v14;
}

void __84__EMOutgoingMessageRepository_removeSendLaterDateFromMessage_draftsMailboxObjectID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_signpost_id_t v4 = [*(id *)(a1 + 32) scheduler];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__EMOutgoingMessageRepository_removeSendLaterDateFromMessage_draftsMailboxObjectID___block_invoke_2;
  v9[3] = &unk_1E63E2760;
  id v10 = *(id *)(a1 + 40);
  id v5 = v3;
  id v11 = v5;
  [v4 performBlock:v9];

  id v6 = +[EMOutgoingMessageRepository signpostLog];
  os_signpost_id_t v7 = [*(id *)(a1 + 32) signpostID];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)id v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v6, OS_SIGNPOST_INTERVAL_END, v7, "EMAIL DELIVERY", "End Removing Send Later", v8, 2u);
  }
}

uint64_t __84__EMOutgoingMessageRepository_removeSendLaterDateFromMessage_draftsMailboxObjectID___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:*(void *)(a1 + 40)];
}

- (void)scheduleAlarmForSendLaterDate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(EMOutgoingMessageRepository *)self connection];
  uint64_t v9 = [v8 reattemptingRemoteObjectProxy];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__EMOutgoingMessageRepository_scheduleAlarmForSendLaterDate_completion___block_invoke;
  v11[3] = &unk_1E63E55F0;
  v11[4] = self;
  id v10 = v7;
  id v12 = v10;
  [v9 scheduleAlarmForSendLaterDate:v6 completion:v11];
}

void __72__EMOutgoingMessageRepository_scheduleAlarmForSendLaterDate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_signpost_id_t v4 = [*(id *)(a1 + 32) scheduler];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__EMOutgoingMessageRepository_scheduleAlarmForSendLaterDate_completion___block_invoke_2;
  v6[3] = &unk_1E63E36B0;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  id v7 = v5;
  [v4 performBlock:v6];
}

uint64_t __72__EMOutgoingMessageRepository_scheduleAlarmForSendLaterDate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)deleteDraftsInMailbox:(id)a3 documentID:(id)a4 previousDraftObjectID:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  if (v10) {
    BOOL v13 = v9 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13 && !v11)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"EMOutgoingMessageRepository.m", 158, @"Invalid parameter not satisfying: %@", @"(mailboxObjectID && documentID) || objectID" object file lineNumber description];
  }
  id v14 = +[EMOutgoingMessageRepository log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    objc_super v20 = v12;
    _os_log_impl(&dword_1BEFDB000, v14, OS_LOG_TYPE_DEFAULT, "Begin Deleting Drafts In Mailbox %@", buf, 0xCu);
  }

  id v15 = [(EMOutgoingMessageRepository *)self connection];
  uint64_t v16 = [v15 reattemptingRemoteObjectProxy];
  [v16 deleteDraftsInMailboxID:v9 documentID:v10 previousDraftObjectID:v12];

  uint64_t v17 = +[EMOutgoingMessageRepository log];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    objc_super v20 = v12;
    _os_log_impl(&dword_1BEFDB000, v17, OS_LOG_TYPE_DEFAULT, "End Deleting Drafts In Mailbox %@", buf, 0xCu);
  }
}

- (id)deliverMessage:(id)a3 usingMailDrop:(BOOL)a4 isCancelable:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = [MEMORY[0x1E4F60E18] promise];
  id v10 = +[EMOutgoingMessageRepository signpostLog];
  os_signpost_id_t v11 = [(EMOutgoingMessageRepository *)self signpostID];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    id v12 = [v8 originalMessageID];
    *(_DWORD *)buf = 138412290;
    v23 = v12;
    _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "EMAIL DELIVERY", "Begin Message Delivery %@", buf, 0xCu);
  }
  BOOL v13 = [(EMOutgoingMessageRepository *)self connection];
  id v14 = [v13 reattemptingRemoteObjectProxy];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __73__EMOutgoingMessageRepository_deliverMessage_usingMailDrop_isCancelable___block_invoke;
  v19[3] = &unk_1E63E5BB8;
  v19[4] = self;
  id v15 = v8;
  id v20 = v15;
  id v16 = v9;
  id v21 = v16;
  [v14 deliverMessage:v15 usingMailDrop:v6 isCancelable:v5 completion:v19];

  uint64_t v17 = [v16 future];

  return v17;
}

void __73__EMOutgoingMessageRepository_deliverMessage_usingMailDrop_isCancelable___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_signpost_id_t v4 = [*(id *)(a1 + 32) scheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__EMOutgoingMessageRepository_deliverMessage_usingMailDrop_isCancelable___block_invoke_2;
  v7[3] = &unk_1E63E4008;
  BOOL v5 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v9 = *(id *)(a1 + 48);
  id v6 = v3;
  id v10 = v6;
  [v4 performBlock:v7];
}

uint64_t __73__EMOutgoingMessageRepository_deliverMessage_usingMailDrop_isCancelable___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = +[EMOutgoingMessageRepository signpostLog];
  os_signpost_id_t v3 = [*(id *)(a1 + 32) signpostID];
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    os_signpost_id_t v4 = [*(id *)(a1 + 40) originalMessageID];
    int v6 = 138412290;
    id v7 = v4;
    _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v2, OS_SIGNPOST_INTERVAL_END, v3, "EMAIL DELIVERY", "End Message Delivery %@", (uint8_t *)&v6, 0xCu);
  }
  return [*(id *)(a1 + 48) finishWithResult:*(void *)(a1 + 56)];
}

- (void)cancelLastDelayedMessage:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[EMOutgoingMessageRepository signpostLog];
  os_signpost_id_t v6 = [(EMOutgoingMessageRepository *)self signpostID];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "UNDO SEND", "Begin Cancelling Last Pending Message", buf, 2u);
  }

  id v7 = [(EMOutgoingMessageRepository *)self connection];
  uint64_t v8 = [v7 reattemptingRemoteObjectProxy];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__EMOutgoingMessageRepository_cancelLastDelayedMessage___block_invoke;
  v10[3] = &unk_1E63E51E0;
  v10[4] = self;
  id v9 = v4;
  id v11 = v9;
  [v8 cancelLastDelayedMessage:v10];
}

uint64_t __56__EMOutgoingMessageRepository_cancelLastDelayedMessage___block_invoke(uint64_t a1, int a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = +[EMOutgoingMessageRepository signpostLog];
  os_signpost_id_t v5 = [*(id *)(a1 + 32) signpostID];
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7[0] = 67109120;
    v7[1] = a2;
    _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v4, OS_SIGNPOST_INTERVAL_END, v5, "UNDO SEND", "End Cancelling Last Pending Message (success:%{BOOL}d)", (uint8_t *)v7, 8u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)outboxContainsMessageFromAccount:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  os_signpost_id_t v5 = +[EMOutgoingMessageRepository signpostLog];
  os_signpost_id_t v6 = [(EMOutgoingMessageRepository *)self signpostID];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    id v7 = objc_msgSend(v4, "ef_publicDescription");
    *(_DWORD *)buf = 138412290;
    uint64_t v27 = (uint64_t)v7;
    _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "EMAIL DELIVERY", "Begin Outbox Query For Account %@", buf, 0xCu);
  }
  uint64_t v8 = [(EMOutgoingMessageRepository *)self connection];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __64__EMOutgoingMessageRepository_outboxContainsMessageFromAccount___block_invoke;
  v20[3] = &unk_1E63E4330;
  id v9 = v4;
  id v21 = v9;
  id v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v20];
  id v11 = [v9 objectID];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __64__EMOutgoingMessageRepository_outboxContainsMessageFromAccount___block_invoke_150;
  v19[3] = &unk_1E63E5BE0;
  v19[4] = &v22;
  [v10 outboxContainsMessageFromAccountObjectID:v11 completion:v19];

  id v12 = +[EMOutgoingMessageRepository signpostLog];
  os_signpost_id_t v13 = [(EMOutgoingMessageRepository *)self signpostID];
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    uint64_t v14 = objc_msgSend(v9, "ef_publicDescription");
    id v15 = (void *)v14;
    if (*((unsigned char *)v23 + 24)) {
      id v16 = @"YES";
    }
    else {
      id v16 = @"NO";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v27 = v14;
    __int16 v28 = 2112;
    v29 = v16;
    _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v12, OS_SIGNPOST_INTERVAL_END, v13, "EMAIL DELIVERY", "End Outbox Query For Account %@: Contains Messages : %@", buf, 0x16u);
  }
  BOOL v17 = *((unsigned char *)v23 + 24) != 0;

  _Block_object_dispose(&v22, 8);
  return v17;
}

void __64__EMOutgoingMessageRepository_outboxContainsMessageFromAccount___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v2 = +[EMOutgoingMessageRepository log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    os_signpost_id_t v3 = objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
    __64__EMOutgoingMessageRepository_outboxContainsMessageFromAccount___block_invoke_cold_1(v3, v4, v2);
  }
}

uint64_t __64__EMOutgoingMessageRepository_outboxContainsMessageFromAccount___block_invoke_150(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)suspendDeliveryQueue
{
  os_signpost_id_t v3 = +[EMOutgoingMessageRepository log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_signpost_id_t v6 = 0;
    _os_log_impl(&dword_1BEFDB000, v3, OS_LOG_TYPE_DEFAULT, "Begin Suspending Delivery Queue", v6, 2u);
  }

  id v4 = [(EMOutgoingMessageRepository *)self connection];
  uint64_t v5 = [v4 remoteObjectProxy];
  [v5 suspendDeliveryQueue];
}

- (void)resumeDeliveryQueue
{
  os_signpost_id_t v3 = +[EMOutgoingMessageRepository log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_signpost_id_t v6 = 0;
    _os_log_impl(&dword_1BEFDB000, v3, OS_LOG_TYPE_DEFAULT, "Resuming Delivery Queue", v6, 2u);
  }

  id v4 = [(EMOutgoingMessageRepository *)self connection];
  uint64_t v5 = [v4 remoteObjectProxy];
  [v5 resumeDeliveryQueue];
}

- (void)processAllQueuedMessages
{
  os_signpost_id_t v3 = +[EMOutgoingMessageRepository log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_signpost_id_t v6 = 0;
    _os_log_impl(&dword_1BEFDB000, v3, OS_LOG_TYPE_DEFAULT, "Trigger Processing Queued Delivery Messages", v6, 2u);
  }

  id v4 = [(EMOutgoingMessageRepository *)self connection];
  uint64_t v5 = [v4 remoteObjectProxy];
  [v5 processAllQueuedMessages];
}

- (BOOL)isProcessing
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v2 = [(EMOutgoingMessageRepository *)self connection];
  os_signpost_id_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_41];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__EMOutgoingMessageRepository_isProcessing__block_invoke_157;
  v5[3] = &unk_1E63E5BE0;
  v5[4] = &v6;
  [v3 isProcessingWithCompletion:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __43__EMOutgoingMessageRepository_isProcessing__block_invoke()
{
  v0 = +[EMOutgoingMessageRepository log];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __43__EMOutgoingMessageRepository_isProcessing__block_invoke_cold_1(v0);
  }
}

uint64_t __43__EMOutgoingMessageRepository_isProcessing__block_invoke_157(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (unint64_t)numberOfPendingMessages
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__10;
  uint64_t v24 = __Block_byref_object_dispose__10;
  id v25 = 0;
  os_signpost_id_t v3 = [(EMOutgoingMessageRepository *)self scheduler];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __54__EMOutgoingMessageRepository_numberOfPendingMessages__block_invoke;
  v19[3] = &unk_1E63E3E38;
  v19[4] = self;
  void v19[5] = &v20;
  [v3 performSyncBlock:v19];

  id v4 = (void *)v21[5];
  if (v4)
  {
    unint64_t v5 = [v4 unsignedIntValue];
  }
  else
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x2020000000;
    uint64_t v18 = 0;
    uint64_t v6 = +[EMOutgoingMessageRepository signpostLog];
    os_signpost_id_t v7 = [(EMOutgoingMessageRepository *)self signpostID];
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v7, "EMAIL DELIVERY", "Begin Query For Number of Pending Messages", buf, 2u);
    }

    uint64_t v8 = [(EMOutgoingMessageRepository *)self connection];
    char v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_160];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __54__EMOutgoingMessageRepository_numberOfPendingMessages__block_invoke_161;
    v14[3] = &unk_1E63E5C08;
    v14[4] = &v15;
    [v9 numberOfPendingMessagesWithCompletion:v14];

    id v10 = +[EMOutgoingMessageRepository signpostLog];
    os_signpost_id_t v11 = [(EMOutgoingMessageRepository *)self signpostID];
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      uint64_t v12 = v16[3];
      *(_DWORD *)buf = 134217984;
      uint64_t v27 = v12;
      _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v10, OS_SIGNPOST_INTERVAL_END, v11, "EMAIL DELIVERY", "End Query For Number of Pending Messages with result %lu", buf, 0xCu);
    }

    unint64_t v5 = v16[3];
    _Block_object_dispose(&v15, 8);
  }
  _Block_object_dispose(&v20, 8);

  return v5;
}

void __54__EMOutgoingMessageRepository_numberOfPendingMessages__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pendingMessages];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __54__EMOutgoingMessageRepository_numberOfPendingMessages__block_invoke_158()
{
  v0 = +[EMOutgoingMessageRepository log];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __54__EMOutgoingMessageRepository_numberOfPendingMessages__block_invoke_158_cold_1(v0);
  }
}

uint64_t __54__EMOutgoingMessageRepository_numberOfPendingMessages__block_invoke_161(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)_restartObservingUnsentChangesIfNecessary
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_hasStartedObservingUnsentChanges);
  if (v2) {
    [(EMOutgoingMessageRepository *)self _startObservingUnsentChangesIfNecessary];
  }
}

void __70__EMOutgoingMessageRepository__startObservingUnsentChangesIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[EMOutgoingMessageRepository log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __63__EMMailboxRepository__startObservingMailboxChangesIfNecessary__block_invoke_cold_1((uint64_t)v2, v3);
  }
}

uint64_t __70__EMOutgoingMessageRepository__startObservingUnsentChangesIfNecessary__block_invoke_167(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelObservation:*(void *)(a1 + 40)];
}

- (void)hasDelayedMessagesDidChange:(BOOL)a3
{
  unint64_t v5 = [(EMOutgoingMessageRepository *)self scheduler];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__EMOutgoingMessageRepository_hasDelayedMessagesDidChange___block_invoke;
  v6[3] = &unk_1E63E3360;
  void v6[4] = self;
  BOOL v7 = a3;
  [v5 performBlock:v6];
}

uint64_t __59__EMOutgoingMessageRepository_hasDelayedMessagesDidChange___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) hasDelayedMessages];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != result)
  {
    [*(id *)(a1 + 32) setHasDelayedMessages:v3 != 0];
    id v4 = *(void **)(a1 + 32);
    return [v4 updateObserversForHasDelayedMessagesDidChange];
  }
  return result;
}

- (void)updateObserversForHasDelayedMessagesDidChange
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(EMOutgoingMessageRepository *)self hasDelayedMessages];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(EMOutgoingMessageRepository *)self observers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) hasDelayedMessagesDidChange:v3];
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)setConnection:(id)a3
{
}

- (BOOL)hasDelayedMessages
{
  return self->_hasDelayedMessages;
}

- (void)setHasDelayedMessages:(BOOL)a3
{
  self->_hasDelayedMessages = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingMessages, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_registrationCancelable, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __64__EMOutgoingMessageRepository_outboxContainsMessageFromAccount___block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "encountered error while looking for outbox messages for account %{public}@", buf, 0xCu);
}

void __43__EMOutgoingMessageRepository_isProcessing__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "encountered error while determining outbox isProcessing state", v1, 2u);
}

void __54__EMOutgoingMessageRepository_numberOfPendingMessages__block_invoke_158_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "encountered error while determining numberOfPendingMessages in outbox", v1, 2u);
}

@end