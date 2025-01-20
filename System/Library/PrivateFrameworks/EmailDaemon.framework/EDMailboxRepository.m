@interface EDMailboxRepository
+ (OS_os_log)log;
- (BOOL)_performCreateMailboxChangeAction:(id)a3;
- (BOOL)_performDeleteMailboxChangeAction:(id)a3;
- (BOOL)_performMoveMailboxChangeAction:(id)a3;
- (BOOL)_performRenameMailboxChangeAction:(id)a3;
- (EDMailboxPersistence)mailboxPersistence;
- (EDMailboxRepository)initWithMailboxPersistence:(id)a3;
- (OS_dispatch_queue)serializationQueue;
- (void)cancelObservation:(id)a3;
- (void)getAllMailboxObjectIDsWithCompletion:(id)a3;
- (void)getMailboxesWithCompletion:(id)a3;
- (void)mailboxObjectIDsForMailboxType:(int64_t)a3 completionHandler:(id)a4;
- (void)mailboxTypeForMailboxObjectID:(id)a3 completionHandler:(id)a4;
- (void)performMailboxChangeAction:(id)a3 completionHandler:(id)a4;
- (void)recordFrecencyEventWithMailboxesWithIDs:(id)a3;
- (void)refreshMailboxList:(int64_t)a3;
- (void)setMailboxPersistence:(id)a3;
- (void)startObservingMailboxChangesWithChangeObserver:(id)a3 observationIdentifier:(id)a4;
- (void)testRecordFrecencyEventsForAllMailboxes;
- (void)testResetFrecencyForAllMailboxes;
@end

@implementation EDMailboxRepository

- (EDMailboxRepository)initWithMailboxPersistence:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)EDMailboxRepository;
  v6 = [(EDMailboxRepository *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mailboxPersistence, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.email.EDMessageRepository.serializationQueue", v9);
    serializationQueue = v7->_serializationQueue;
    v7->_serializationQueue = (OS_dispatch_queue *)v10;

    v12 = (void *)MEMORY[0x1E4F60418];
    v16[0] = *MEMORY[0x1E4F60088];
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    [v12 addValidSortDescriptorKeyPaths:v13 forTargetClass:objc_opt_class()];
  }
  return v7;
}

- (void)startObservingMailboxChangesWithChangeObserver:(id)a3 observationIdentifier:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = +[EDMailboxRepository log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 138543362;
    id v11 = v7;
    _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_INFO, "Registering For Mailbox Observation With Observer %{public}@", (uint8_t *)&v10, 0xCu);
  }

  v9 = [(EDMailboxRepository *)self mailboxPersistence];
  [v9 addChangeObserver:v6 withIdentifier:v7];
}

- (void)getMailboxesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[EDMailboxRepository log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_INFO, "Get All Mailboxes", buf, 2u);
  }

  id v6 = (void *)MEMORY[0x1E0190280]();
  id v7 = [(EDMailboxRepository *)self mailboxPersistence];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__EDMailboxRepository_getMailboxesWithCompletion___block_invoke;
  v9[3] = &unk_1E6C01BC8;
  id v8 = v4;
  id v10 = v8;
  [v7 allMailboxesWithCompletionHandler:v9];
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__EDMailboxRepository_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_46 != -1) {
    dispatch_once(&log_onceToken_46, block);
  }
  v2 = (void *)log_log_46;

  return (OS_os_log *)v2;
}

- (EDMailboxPersistence)mailboxPersistence
{
  return self->_mailboxPersistence;
}

void __50__EDMailboxRepository_getMailboxesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[EDMailboxRepository log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 134217984;
    uint64_t v6 = [v3 count];
    _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_INFO, "Number of Mailboxes %ld count", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __26__EDMailboxRepository_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_46;
  log_log_46 = (uint64_t)v1;
}

- (void)cancelObservation:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = +[EDMailboxRepository log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_INFO, "Unregistering For Mailbox Observation With Observer %{public}@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v6 = [(EDMailboxRepository *)self mailboxPersistence];
  [v6 removeChangeObserverWithIdentifier:v4];
}

- (void)performMailboxChangeAction:(id)a3 completionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[EDMailboxRepository log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v6;
    _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "Perform Change Action:%{public}@", buf, 0xCu);
  }

  uint64_t v9 = [(EDMailboxRepository *)self serializationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__EDMailboxRepository_performMailboxChangeAction_completionHandler___block_invoke;
  block[3] = &unk_1E6C01BF0;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __68__EDMailboxRepository_performMailboxChangeAction_completionHandler___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) mailboxPersistence];
  v2 = [v4 mailboxProvider];
  [v2 beginDeferringInvalidation];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 32) _performCreateMailboxChangeAction:*(void *)(a1 + 40)];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [*(id *)(a1 + 32) _performDeleteMailboxChangeAction:*(void *)(a1 + 40)];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [*(id *)(a1 + 32) _performMoveMailboxChangeAction:*(void *)(a1 + 40)];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [*(id *)(a1 + 32) _performRenameMailboxChangeAction:*(void *)(a1 + 40)];
        }
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v5 = [*(id *)(a1 + 32) mailboxPersistence];
  id v3 = [v5 mailboxProvider];
  [v3 endDeferringInvalidation];
}

- (void)refreshMailboxList:(int64_t)a3
{
  unint64_t v3 = 0xAAAAAAAAAAAAAAAALL;
  if (a3 == 1) {
    unint64_t v3 = 1;
  }
  if (a3) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = [(EDMailboxRepository *)self mailboxPersistence];
  [v5 fetchMailboxListsWithKind:v4];
}

- (void)getAllMailboxObjectIDsWithCompletion:(id)a3
{
  id v8 = (void (**)(id, void *))a3;
  unint64_t v4 = [(EDMailboxRepository *)self mailboxPersistence];
  id v5 = [v4 allMailboxes];

  id v6 = objc_msgSend(v5, "ef_compactMap:", &__block_literal_global_37);
  id v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
  v8[2](v8, v7);
}

id __60__EDMailboxRepository_getAllMailboxObjectIDsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 objectID];

  return v2;
}

- (void)mailboxObjectIDsForMailboxType:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  id v7 = [(EDMailboxRepository *)self mailboxPersistence];
  id v8 = [v7 allMailboxes];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__EDMailboxRepository_mailboxObjectIDsForMailboxType_completionHandler___block_invoke;
  v12[3] = &__block_descriptor_40_e19_B16__0__EMMailbox_8l;
  v12[4] = a3;
  uint64_t v9 = objc_msgSend(v8, "ef_filter:", v12);
  id v10 = objc_msgSend(v9, "ef_compactMap:", &__block_literal_global_16);

  id v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];
  v6[2](v6, v11);
}

BOOL __72__EDMailboxRepository_mailboxObjectIDsForMailboxType_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == *(void *)(a1 + 32);
}

id __72__EDMailboxRepository_mailboxObjectIDsForMailboxType_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 objectID];

  return v2;
}

- (void)mailboxTypeForMailboxObjectID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  id v8 = [(EDMailboxRepository *)self mailboxPersistence];
  uint64_t v9 = [v8 allMailboxes];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__EDMailboxRepository_mailboxTypeForMailboxObjectID_completionHandler___block_invoke;
  v14[3] = &unk_1E6C01A68;
  id v10 = v6;
  id v15 = v10;
  id v11 = objc_msgSend(v9, "ef_firstObjectPassingTest:", v14);
  uint64_t v12 = v11;
  if (v11) {
    uint64_t v13 = [v11 type];
  }
  else {
    uint64_t v13 = -500;
  }
  v7[2](v7, v13);
}

uint64_t __71__EDMailboxRepository_mailboxTypeForMailboxObjectID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 objectID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)_performCreateMailboxChangeAction:(id)a3
{
  id v4 = a3;
  id v5 = [(EDMailboxRepository *)self mailboxPersistence];
  id v6 = [v4 name];
  id v7 = [v4 mailboxObjectID];
  char v8 = [v5 createMailbox:v6 parentMailboxID:v7];

  return v8;
}

- (BOOL)_performDeleteMailboxChangeAction:(id)a3
{
  id v4 = a3;
  id v5 = [(EDMailboxRepository *)self mailboxPersistence];
  id v6 = [v4 mailboxObjectID];
  char v7 = [v5 deleteMailbox:v6];

  return v7;
}

- (BOOL)_performMoveMailboxChangeAction:(id)a3
{
  id v4 = a3;
  id v5 = [(EDMailboxRepository *)self mailboxPersistence];
  id v6 = [v4 mailboxObjectID];
  char v7 = [v4 parentMailboxID];
  char v8 = [v5 moveMailbox:v6 newParentMailboxID:v7];

  return v8;
}

- (BOOL)_performRenameMailboxChangeAction:(id)a3
{
  id v4 = a3;
  id v5 = [(EDMailboxRepository *)self mailboxPersistence];
  id v6 = [v4 mailboxObjectID];
  char v7 = [v4 name];
  char v8 = [v5 renameMailbox:v6 newName:v7];

  return v8;
}

- (void)recordFrecencyEventWithMailboxesWithIDs:(id)a3
{
  id v5 = a3;
  id v4 = [(EDMailboxRepository *)self mailboxPersistence];
  [v4 recordFrecencyEventWithMailboxesWithIDs:v5];
}

- (void)testRecordFrecencyEventsForAllMailboxes
{
  id v2 = [(EDMailboxRepository *)self mailboxPersistence];
  [v2 testRecordFrecencyEventsForAllMailboxes];
}

- (void)testResetFrecencyForAllMailboxes
{
  id v2 = [(EDMailboxRepository *)self mailboxPersistence];
  [v2 testResetFrecencyForAllMailboxes];
}

- (void)setMailboxPersistence:(id)a3
{
}

- (OS_dispatch_queue)serializationQueue
{
  return self->_serializationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializationQueue, 0);

  objc_storeStrong((id *)&self->_mailboxPersistence, 0);
}

@end