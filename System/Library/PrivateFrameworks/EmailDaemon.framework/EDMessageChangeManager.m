@interface EDMessageChangeManager
+ (OS_os_log)log;
+ (id)signpostLog;
- (BOOL)_hookResponderRespondsToRequiredMethods:(id)a3;
- (BOOL)_needToStoreServerMessagesForMailboxURL:(id)a3;
- (BOOL)_persistFlagChangeResults:(id)a3 forFlagChangeAction:(id)a4;
- (BOOL)_persistResults:(id)a3 forFlagChangeAction:(id)a4;
- (BOOL)_persistResults:(id)a3 forLabelChangeAction:(id)a4;
- (BOOL)_persistResults:(id)a3 forTransferAction:(id)a4;
- (BOOL)mailboxURL:(id)a3 isInSameAccountAsMailboxURL:(id)a4;
- (BOOL)mailboxURLIsInRemoteAccount:(id)a3;
- (BOOL)persistResults:(id)a3 forAction:(id)a4;
- (EDBIMIManager)bimiManager;
- (EDBiomeBlackPearlLogger)biomeCollector;
- (EDLocalActionPersistence)localActionPersistence;
- (EDMessageAuthenticator)messageAuthenticator;
- (EDMessageCategorizer)messageCategorizer;
- (EDMessageChangeHookResponder)hookResponder;
- (EDMessageChangeManager)init;
- (EDMessageChangeManager)initWithDatabase:(id)a3 localActionPersistence:(id)a4 messagePersistence:(id)a5 serverMessagePersistenceFactory:(id)a6 readLaterPersistence:(id)a7 categoryPersistence:(id)a8 bimiManager:(id)a9 hookResponder:(id)a10 hookRegistry:(id)a11;
- (EDMessagePersistence)messagePersistence;
- (EDPersistenceDatabase)database;
- (EDReadLaterPersistence)readLaterPersistence;
- (EDServerMessagePersistenceFactory)serverMessagePersistenceFactory;
- (OS_dispatch_queue)markAllWorkQueue;
- (id)_applyReadLaterDate:(id)a3 displayDate:(id)a4 toMessages:(id)a5 changeIsRemote:(BOOL)a6;
- (id)_findDestinationMessagesFromCompletedItems:(id)a3 notInServerMessages:(id)a4;
- (id)_handleDuplicateServerMessage:(id)a3 serverMessagePersistence:(id)a4;
- (id)_truncateReadLaterDate:(id)a3;
- (id)accountForMailboxURL:(id)a3;
- (id)addLabels:(id)a3 removeLabels:(id)a4 forMessages:(id)a5;
- (id)addNewMessages:(id)a3 mailboxURL:(id)a4 userInitiated:(BOOL)a5;
- (id)applyFlagChange:(id)a3 toMessages:(id)a4;
- (id)applyReadLaterDate:(id)a3 displayDate:(id)a4 toMessages:(id)a5;
- (id)copyMessages:(id)a3 destinationMailboxURL:(id)a4 userInitiated:(BOOL)a5;
- (id)messagesToJournalForMessages:(id)a3 inMailbox:(id)a4;
- (id)moveMessages:(id)a3 destinationMailboxURL:(id)a4 userInitiated:(BOOL)a5;
- (id)reflectNewMessages:(id)a3 mailboxURL:(id)a4;
- (id)transferMessages:(id)a3 transferType:(int64_t)a4 destinationMailboxURL:(id)a5 userInitiated:(BOOL)a6;
- (unint64_t)signpostID;
- (void)_addLogMassDeletion;
- (void)_clearFollowUpsFromThreadsForMessages:(id)a3;
- (void)_deleteDestinationMessagesFromCompletedItems:(id)a3 notInServerMessages:(id)a4;
- (void)_handleFailedCopyItems:(id)a3 transferAction:(id)a4 generationWindow:(id)a5;
- (void)_handleFailedDownload:(id)a3 generationWindow:(id)a4;
- (void)_reflectFlagChanges:(id)a3 messages:(id)a4 remoteIDs:(id)a5 mailboxURL:(id)a6;
- (void)_resetLocalFlagsToServerFlagsForMessagesWithRemoteIDs:(id)a3 mailboxURL:(id)a4;
- (void)_resetLocalLabelsToServerLabelsForMessagesWithRemoteIDs:(id)a3 mailboxURL:(id)a4;
- (void)_storeServerMessages:(id)a3 mailboxURL:(id)a4 generationWindow:(id)a5;
- (void)applyFlagChange:(id)a3 toAllMessagesFromMailboxes:(id)a4 exceptMessages:(id)a5;
- (void)applyFollowUp:(id)a3 toMessages:(id)a4;
- (void)applyFollowUp:(id)a3 toMessages:(id)a4 withNegativeFeedbackForSuggestions:(BOOL)a5;
- (void)applyVIPStatus:(BOOL)a3 forMessages:(id)a4;
- (void)deleteAllMessageFromMailboxes:(id)a3 exceptMessages:(id)a4;
- (void)deleteLocalMessageActionsWithIDs:(id)a3;
- (void)deleteMessages:(id)a3;
- (void)reflectAddedLabels:(id)a3 removedLabels:(id)a4 forMessagesWithRemoteIDs:(id)a5 mailboxURL:(id)a6;
- (void)reflectAllMessagesDeletedInMailboxURL:(id)a3;
- (void)reflectDeletedAllClearedMessagesInMailboxURL:(id)a3;
- (void)reflectDeletedMessages:(id)a3;
- (void)reflectDeletedMessagesWithRemoteIDs:(id)a3 mailboxURL:(id)a4;
- (void)reflectFlagChanges:(id)a3 forMessages:(id)a4;
- (void)reflectFlagChanges:(id)a3 forMessagesWithRemoteIDs:(id)a4 mailboxURL:(id)a5;
- (void)reflectSortedFlagChanges:(id)a3 mailboxURL:(id)a4;
- (void)remindMeCloudStorageChangedWithAddedOrChangedItems:(id)a3 deletedItems:(id)a4;
- (void)setBiomeCollector:(id)a3;
- (void)setMarkAllWorkQueue:(id)a3;
- (void)setMessageAuthenticator:(id)a3;
- (void)setMessageCategorizer:(id)a3;
- (void)test_tearDown;
- (void)transferAllMessagesFromMailboxes:(id)a3 exceptMessages:(id)a4 transferType:(int64_t)a5 destinationMailboxURL:(id)a6 userInitiated:(BOOL)a7;
- (void)transferMessages:(id)a3 transferType:(int64_t)a4 destinationMailboxURL:(id)a5 userInitiated:(BOOL)a6 oldMessagesByNewMessage:(id)a7;
@end

@implementation EDMessageChangeManager

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__EDMessageChangeManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_52 != -1) {
    dispatch_once(&log_onceToken_52, block);
  }
  v2 = (void *)log_log_52;

  return (OS_os_log *)v2;
}

void __29__EDMessageChangeManager_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_52;
  log_log_52 = (uint64_t)v1;
}

+ (id)signpostLog
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__EDMessageChangeManager_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_2 != -1) {
    dispatch_once(&signpostLog_onceToken_2, block);
  }
  v2 = (void *)signpostLog_log_2;

  return v2;
}

void __37__EDMessageChangeManager_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  v2 = (void *)signpostLog_log_2;
  signpostLog_log_2 = (uint64_t)v1;
}

- (unint64_t)signpostID
{
  id v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (EDMessageChangeManager)initWithDatabase:(id)a3 localActionPersistence:(id)a4 messagePersistence:(id)a5 serverMessagePersistenceFactory:(id)a6 readLaterPersistence:(id)a7 categoryPersistence:(id)a8 bimiManager:(id)a9 hookResponder:(id)a10 hookRegistry:(id)a11
{
  id v38 = a3;
  id v37 = a4;
  id v36 = a5;
  id v35 = a6;
  id v34 = a7;
  id v39 = a8;
  id v33 = a9;
  id v18 = a10;
  id v19 = a11;
  v40.receiver = self;
  v40.super_class = (Class)EDMessageChangeManager;
  v20 = [(EDMessageChangeManager *)&v40 init];
  p_isa = (id *)&v20->super.isa;
  v22 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_database, a3);
    objc_storeStrong(p_isa + 9, a4);
    objc_storeStrong(p_isa + 7, a5);
    objc_storeStrong(p_isa + 3, a6);
    objc_storeStrong(p_isa + 2, a7);
    objc_storeStrong(p_isa + 4, a9);
    v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = dispatch_queue_attr_make_with_qos_class(v23, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v25 = dispatch_queue_create("com.apple.email.EDMessageChangeManager", v24);
    markAllWorkQueue = v22->_markAllWorkQueue;
    v22->_markAllWorkQueue = (OS_dispatch_queue *)v25;

    v27 = [v39 analyticsLogger];
    uint64_t v28 = [v27 biomeCollector];
    biomeCollector = v22->_biomeCollector;
    v22->_biomeCollector = (EDBiomeBlackPearlLogger *)v28;

    if (![(EDMessageChangeManager *)v22 _hookResponderRespondsToRequiredMethods:v18])
    {
      v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:a2 object:v22 file:@"EDMessageChangeManager.m" lineNumber:143 description:@"HookResponder does not respond to all of the methods required by the EDMessageChangeManager."];
    }
    objc_storeWeak(p_isa + 8, v18);
    [v19 registerCloudStorageChangeHookResponder:v22];
  }

  return v22;
}

- (EDMessageChangeManager)init
{
}

- (void)test_tearDown
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    os_signpost_id_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EDMessageChangeManager.m", 156, @"%s can only be called from unit tests", "-[EDMessageChangeManager test_tearDown]");
  }
  v5 = [(EDMessageChangeManager *)self markAllWorkQueue];
  dispatch_sync(v5, &__block_literal_global_43);
}

- (id)moveMessages:(id)a3 destinationMailboxURL:(id)a4 userInitiated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = +[EDMessageChangeManager log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v8 count];
    v12 = objc_msgSend(MEMORY[0x1E4F60E00], "ec_redactedStringForMailboxURL:", v9);
    int v15 = 134218242;
    uint64_t v16 = v11;
    __int16 v17 = 2114;
    id v18 = v12;
    _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Moving %lu new messages to %{public}@", (uint8_t *)&v15, 0x16u);
  }
  v13 = [(EDMessageChangeManager *)self transferMessages:v8 transferType:1 destinationMailboxURL:v9 userInitiated:v5];

  return v13;
}

- (id)copyMessages:(id)a3 destinationMailboxURL:(id)a4 userInitiated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = +[EDMessageChangeManager log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v8 count];
    v12 = objc_msgSend(MEMORY[0x1E4F60E00], "ec_redactedStringForMailboxURL:", v9);
    int v15 = 134218242;
    uint64_t v16 = v11;
    __int16 v17 = 2114;
    id v18 = v12;
    _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Copying %lu new messages to %{public}@", (uint8_t *)&v15, 0x16u);
  }
  v13 = [(EDMessageChangeManager *)self transferMessages:v8 transferType:0 destinationMailboxURL:v9 userInitiated:v5];

  return v13;
}

- (id)transferMessages:(id)a3 transferType:(int64_t)a4 destinationMailboxURL:(id)a5 userInitiated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a5;
  v12 = objc_opt_new();
  [(EDMessageChangeManager *)self transferMessages:v10 transferType:a4 destinationMailboxURL:v11 userInitiated:v6 oldMessagesByNewMessage:v12];
  v13 = [v12 allKeys];

  return v13;
}

- (void)transferMessages:(id)a3 transferType:(int64_t)a4 destinationMailboxURL:(id)a5 userInitiated:(BOOL)a6 oldMessagesByNewMessage:(id)a7
{
  BOOL v8 = a6;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  id v44 = a5;
  id v45 = a7;
  v12 = +[EDMessageChangeManager signpostLog];
  os_signpost_id_t v13 = os_signpost_id_generate(v12);

  v14 = +[EDMessageChangeManager signpostLog];
  int v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    int v16 = objc_msgSend(MEMORY[0x1E4F60E00], "bucketMessageCount:", objc_msgSend(v46, "count"));
    __int16 v17 = objc_msgSend(MEMORY[0x1E4F60E00], "ec_redactedStringForMailboxURL:", v44);
    *(_DWORD *)buf = 67240450;
    *(_DWORD *)&buf[4] = v16;
    LOWORD(v65) = 2114;
    *(void *)((char *)&v65 + 2) = v17;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "EDMessageChangeManagerTransferMessages", "Begin transferring NumberOfMessages=%{public,signpost.telemetry:number1}u messages to destinationMailbox=%{public}@ enableTelemetry=YES ", buf, 0x12u);
  }
  id v18 = [(EDMessageChangeManager *)self hookResponder];
  [v18 persistenceWillBeginUpdates];

  uint64_t v19 = [(EDMessageChangeManager *)self hookResponder];
  [v19 persistenceWillTransferMessages:v46 transferType:a4 destinationMailboxURL:v44 userInitiated:v8];

  if (!v45) {
    id v45 = (id)objc_opt_new();
  }
  v43 = objc_msgSend(v46, "ef_groupBy:", &__block_literal_global_46_1);
  v41 = [MEMORY[0x1E4F608B8] setDeleted];
  v42 = objc_opt_new();
  v20 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  *(void *)buf = 0;
  *(void *)&long long v65 = buf;
  *((void *)&v65 + 1) = 0x2020000000;
  char v66 = 0;
  BOOL v21 = [(EDMessageChangeManager *)self mailboxURLIsInRemoteAccount:v44];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __116__EDMessageChangeManager_transferMessages_transferType_destinationMailboxURL_userInitiated_oldMessagesByNewMessage___block_invoke_2;
  v47[3] = &unk_1E6C02290;
  v47[4] = self;
  id v22 = v44;
  id v48 = v22;
  int64_t v54 = a4;
  os_signpost_id_t v55 = v13;
  v23 = v20;
  v49 = v23;
  id v24 = v45;
  id v50 = v24;
  BOOL v56 = v21;
  BOOL v57 = v8;
  id v25 = v41;
  id v51 = v25;
  id v26 = v42;
  id v52 = v26;
  v53 = buf;
  [v43 enumerateKeysAndObjectsUsingBlock:v47];
  v27 = +[EDMessageChangeManager log];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v28 = [v24 count];
    uint64_t v29 = [v26 count];
    *(_DWORD *)v58 = 134218496;
    int64_t v59 = a4;
    __int16 v60 = 2048;
    uint64_t v61 = v28;
    __int16 v62 = 2048;
    uint64_t v63 = v29;
    _os_log_impl(&dword_1DB39C000, v27, OS_LOG_TYPE_DEFAULT, "Transfer messages with type %ld, oldMessagesByNewMessage:%lld deletedMessages:%lld", v58, 0x20u);
  }

  if ([v24 count])
  {
    [(EDMessageChangeManager *)self willStartPersistenceDidAddMessages:v24];
    v30 = [(EDMessageChangeManager *)self hookResponder];
    v31 = [v24 allKeys];
    [v30 persistenceDidAddMessages:v31 generationWindow:v23];

    [(EDMessageChangeManager *)self didFinishPersistenceDidAddMessages:v24];
  }
  if ([v26 count])
  {
    v32 = [(EDMessageChangeManager *)self hookResponder];
    [v32 persistenceDidChangeFlags:v25 messages:v26 generationWindow:v23];
  }
  id v33 = [(EDMessageChangeManager *)self hookResponder];
  [v33 persistenceDidDeleteMessages:v26 generationWindow:v23];

  id v34 = [(EDMessageChangeManager *)self hookResponder];
  [v34 persistenceDidFinishUpdates];

  id v35 = +[EDMessageChangeManager signpostLog];
  id v36 = v35;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
  {
    *(_WORD *)v58 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v36, OS_SIGNPOST_INTERVAL_END, v13, "EDMessageChangeManagerTransferMessages", "", v58, 2u);
  }

  if ([(EDMessageChangeManager *)self mailboxIsAllMail:v22]
    && (unint64_t)[v46 count] >= 0xC8)
  {
    [(EDMessageChangeManager *)self _addLogMassDeletion];
    id v37 = objc_msgSend(NSString, "stringWithFormat:", @"Large Google Message Transfer: The user has selected to transfer %lu messages", objc_msgSend(v46, "count"));
    id v38 = [MEMORY[0x1E4F60D20] sharedReporter];
    id v39 = (objc_class *)objc_opt_class();
    objc_super v40 = NSStringFromClass(v39);
    [v38 reportIssueType:v40 description:v37];
  }
  _Block_object_dispose(buf, 8);
}

id __116__EDMessageChangeManager_transferMessages_transferType_destinationMailboxURL_userInitiated_oldMessagesByNewMessage___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 mailbox];
  id v3 = [v2 URL];

  if (!v3)
  {
    id v3 = [MEMORY[0x1E4F1CA98] null];
  }

  return v3;
}

void __116__EDMessageChangeManager_transferMessages_transferType_destinationMailboxURL_userInitiated_oldMessagesByNewMessage___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA98] null];

  if (v7 == v5)
  {

    id v5 = 0;
  }
  BOOL v8 = [*(id *)(a1 + 32) messagesToJournalForMessages:v6 inMailbox:v5];

  int v9 = [*(id *)(a1 + 32) mailboxURL:v5 isInSameAccountAsMailboxURL:*(void *)(a1 + 40)];
  char v10 = v9;
  uint64_t v11 = *(void *)(a1 + 88);
  if (v11 == 1) {
    int v12 = v9;
  }
  else {
    int v12 = 0;
  }
  if (v12 != 1)
  {
LABEL_9:
    if (v5) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  if ([*(id *)(a1 + 32) mailboxIsAllMail:v5])
  {
    uint64_t v11 = [*(id *)(a1 + 32) mailboxPartOfAllMail:*(void *)(a1 + 40)] ^ 1;
    goto LABEL_9;
  }
  uint64_t v11 = 1;
  if (v5) {
    goto LABEL_12;
  }
LABEL_10:
  if (*(void *)(a1 + 88) == 1) {
    uint64_t v11 = 0;
  }
LABEL_12:
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__19;
  v39[4] = __Block_byref_object_dispose__19;
  id v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__19;
  v37[4] = __Block_byref_object_dispose__19;
  id v38 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  char v36 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __116__EDMessageChangeManager_transferMessages_transferType_destinationMailboxURL_userInitiated_oldMessagesByNewMessage___block_invoke_51;
  v18[3] = &unk_1E6C02268;
  uint64_t v30 = *(void *)(a1 + 96);
  id v13 = v5;
  uint64_t v14 = *(void *)(a1 + 32);
  id v19 = v13;
  uint64_t v20 = v14;
  id v15 = *(id *)(a1 + 48);
  uint64_t v31 = v11;
  id v21 = v15;
  id v26 = v39;
  id v22 = *(id *)(a1 + 40);
  id v16 = *(id *)(a1 + 56);
  char v32 = *(unsigned char *)(a1 + 104);
  char v33 = v10;
  id v23 = v16;
  v27 = v37;
  char v34 = *(unsigned char *)(a1 + 105);
  id v24 = *(id *)(a1 + 64);
  id v25 = *(id *)(a1 + 72);
  uint64_t v17 = *(void *)(a1 + 80);
  uint64_t v28 = v35;
  uint64_t v29 = v17;
  objc_msgSend(v8, "ef_enumerateObjectsInBatchesOfSize:block:", 25, v18);

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v37, 8);

  _Block_object_dispose(v39, 8);
}

void __116__EDMessageChangeManager_transferMessages_transferType_destinationMailboxURL_userInitiated_oldMessagesByNewMessage___block_invoke_51(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_signpost_id_t v4 = +[EDMessageChangeManager signpostLog];
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 120);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = objc_msgSend(MEMORY[0x1E4F60E00], "bucketMessageCount:", objc_msgSend(v3, "count"));
    BOOL v8 = objc_msgSend(MEMORY[0x1E4F60E00], "ec_redactedStringForMailboxURL:", *(void *)(a1 + 32));
    *(_DWORD *)buf = 67109378;
    int v39 = v7;
    __int16 v40 = 2114;
    v41 = v8;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v5, OS_SIGNPOST_EVENT, v6, "EDMessageChangeManagerTransferMessages", "Begin Processing batch of %u messages for sourceMailboxURL %{public}@", buf, 0x12u);
  }
  int v9 = [*(id *)(a1 + 40) database];
  char v10 = [NSString stringWithUTF8String:"-[EDMessageChangeManager transferMessages:transferType:destinationMailboxURL:userInitiated:oldMessagesByNewMessage:]_block_invoke"];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __116__EDMessageChangeManager_transferMessages_transferType_destinationMailboxURL_userInitiated_oldMessagesByNewMessage___block_invoke_2_53;
  v23[3] = &unk_1E6C02240;
  uint64_t v34 = *(void *)(a1 + 120);
  int8x16_t v22 = *(int8x16_t *)(a1 + 32);
  id v11 = (id)v22.i64[0];
  int8x16_t v24 = vextq_s8(v22, v22, 8uLL);
  id v12 = *(id *)(a1 + 48);
  uint64_t v35 = *(void *)(a1 + 128);
  uint64_t v13 = *(void *)(a1 + 88);
  id v25 = v12;
  uint64_t v31 = v13;
  id v14 = v3;
  id v26 = v14;
  id v27 = *(id *)(a1 + 56);
  id v15 = *(id *)(a1 + 64);
  char v36 = *(unsigned char *)(a1 + 136);
  __int16 v37 = *(_WORD *)(a1 + 137);
  uint64_t v16 = *(void *)(a1 + 96);
  id v28 = v15;
  uint64_t v32 = v16;
  id v29 = *(id *)(a1 + 72);
  id v30 = *(id *)(a1 + 80);
  long long v33 = *(_OWORD *)(a1 + 104);
  objc_msgSend(v9, "__performWriteWithCaller:usingBlock:", v10, v23);

  if (*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)) {
    objc_msgSend(*(id *)(a1 + 40), "checkForNewActionsInMailboxID:", objc_msgSend(*(id *)(a1 + 40), "mailboxDatabaseIDForURL:"));
  }
  uint64_t v17 = +[EDMessageChangeManager signpostLog];
  id v18 = v17;
  os_signpost_id_t v19 = *(void *)(a1 + 120);
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    int v20 = objc_msgSend(MEMORY[0x1E4F60E00], "bucketMessageCount:", objc_msgSend(v14, "count"));
    id v21 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 67109378;
    int v39 = v20;
    __int16 v40 = 2112;
    v41 = v21;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v18, OS_SIGNPOST_EVENT, v19, "EDMessageChangeManagerTransferMessages", "End Processing batch of %u messages for sourceMailboxURL %@", buf, 0x12u);
  }
}

uint64_t __116__EDMessageChangeManager_transferMessages_transferType_destinationMailboxURL_userInitiated_oldMessagesByNewMessage___block_invoke_2_53(uint64_t a1, void *a2)
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v54 = a2;
  id v3 = +[EDMessageChangeManager signpostLog];
  os_signpost_id_t v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 128);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v4, OS_SIGNPOST_EVENT, v5, "EDMessageChangeManagerTransferMessages", "Begin database write connection", buf, 2u);
  }

  int v6 = [*(id *)(a1 + 32) mailboxURLIsInRemoteAccount:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 48), "insertGeneration:", objc_msgSend(v54, "transactionGeneration"));
  uint64_t v7 = *(void *)(a1 + 136);
  if (v7 == 3)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v9 = objc_opt_new();
    uint64_t v10 = *(void *)(*(void *)(a1 + 96) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    uint64_t v8 = [*(id *)(a1 + 32) persistNewMessages:*(void *)(a1 + 56) mailboxURL:*(void *)(a1 + 64) oldMessagesByNewMessage:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) fromSyncing:0];
    [*(id *)(a1 + 72) addEntriesFromDictionary:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)];
    uint64_t v7 = *(void *)(a1 + 136);
  }
  if (*(unsigned char *)(a1 + 144)) {
    int v12 = 1;
  }
  else {
    int v12 = v6;
  }
  if (v12 == 1)
  {
    BOOL v13 = 0;
    if (v7 != 3 && ((v6 ^ 1) & 1) == 0) {
      BOOL v13 = *(unsigned char *)(a1 + 145) == 0;
    }
    if (v6)
    {
      BOOL v15 = v7 == 1 || v7 == 3;
      BOOL v52 = v15;
    }
    else
    {
      BOOL v52 = 0;
    }
    id v50 = objc_opt_new();
    id v51 = objc_opt_new();
    uint64_t v16 = objc_opt_new();
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __116__EDMessageChangeManager_transferMessages_transferType_destinationMailboxURL_userInitiated_oldMessagesByNewMessage___block_invoke_54;
    aBlock[3] = &unk_1E6C021D0;
    BOOL v73 = v13;
    aBlock[4] = *(void *)(a1 + 32);
    id v17 = v50;
    id v70 = v17;
    char v74 = *(unsigned char *)(a1 + 144);
    id v18 = v51;
    id v71 = v18;
    BOOL v75 = v52;
    id v53 = v16;
    id v72 = v53;
    os_signpost_id_t v19 = _Block_copy(aBlock);
    int v20 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
    if (v20)
    {
      [v20 enumerateKeysAndObjectsUsingBlock:v19];
    }
    else
    {
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v21 = *(id *)(a1 + 56);
      uint64_t v22 = [v21 countByEnumeratingWithState:&v65 objects:v77 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v66;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v66 != v23) {
              objc_enumerationMutation(v21);
            }
            (*((void (**)(void *, void, void, void))v19 + 2))(v19, 0, *(void *)(*((void *)&v65 + 1) + 8 * i), 0);
          }
          uint64_t v22 = [v21 countByEnumeratingWithState:&v65 objects:v77 count:16];
        }
        while (v22);
      }

      uint64_t v8 = v8;
    }
    uint64_t v25 = [v17 count];
    id v26 = (id *)(a1 + 40);
    if (!v25)
    {
      if ([v18 count])
      {
        id v26 = (id *)(a1 + 40);
        if (!*(unsigned char *)(a1 + 145)) {
          id v26 = (id *)(a1 + 64);
        }
      }
      else
      {
        id v26 = (id *)(a1 + 40);
        if (!v52)
        {
LABEL_40:
          if (*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40))
          {
            id v30 = objc_alloc(MEMORY[0x1E4F60908]);
            v55[0] = MEMORY[0x1E4F143A8];
            v55[1] = 3221225472;
            v55[2] = __116__EDMessageChangeManager_transferMessages_transferType_destinationMailboxURL_userInitiated_oldMessagesByNewMessage___block_invoke_3;
            v55[3] = &unk_1E6C021F8;
            id v56 = v17;
            id v57 = v18;
            id v58 = v53;
            id v59 = *(id *)(a1 + 40);
            char v63 = *(unsigned char *)(a1 + 144);
            id v31 = *(id *)(a1 + 64);
            uint64_t v32 = *(void *)(a1 + 104);
            id v60 = v31;
            uint64_t v61 = v32;
            char v64 = *(unsigned char *)(a1 + 146);
            uint64_t v62 = *(void *)(a1 + 136);
            long long v33 = (void *)[v30 initWithBuilder:v55];
            uint64_t v34 = [*(id *)(a1 + 32) localActionPersistence];
            uint64_t v8 = [v34 persistTransferAction:v33];
          }
          uint64_t v7 = *(void *)(a1 + 136);
          goto LABEL_43;
        }
      }
    }
    uint64_t v27 = *(void *)(*(void *)(a1 + 104) + 8);
    id v28 = *v26;
    id v29 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v28;

    goto LABEL_40;
  }
LABEL_43:
  if (v7 == 3 || ((BOOL v35 = v7 == 1, v7 != 1) ? (v36 = 1) : (v36 = v6), (v36 & 1) == 0))
  {
    uint64_t v42 = +[EDMessageChangeManager log];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB39C000, v42, OS_LOG_TYPE_DEFAULT, "Deleting the source library messages if necessary", buf, 2u);
    }

    __int16 v37 = objc_msgSend(*(id *)(a1 + 56), "ef_filter:", &__block_literal_global_398_0);
    v43 = [*(id *)(a1 + 32) hookResponder];
    [v43 persistenceWillChangeFlags:*(void *)(a1 + 80) messages:v37];

    id v44 = (id)[*(id *)(a1 + 32) applyFlagChange:*(void *)(a1 + 80) toMessagesInDatabase:*(void *)(a1 + 56)];
    id v45 = [*(id *)(a1 + 32) hookResponder];
    [v45 persistenceIsChangingFlags:*(void *)(a1 + 80) messages:v37 generationWindow:*(void *)(a1 + 48)];

    [*(id *)(a1 + 32) deletePersistedMessages:v37];
    [*(id *)(a1 + 88) addObjectsFromArray:v37];
    if (!_os_feature_enabled_impl()) {
      goto LABEL_56;
    }
    v41 = [*(id *)(a1 + 32) biomeCollector];
    [v41 deleteEventsForMessages:*(void *)(a1 + 88)];
LABEL_55:

LABEL_56:
    goto LABEL_57;
  }
  if (v35)
  {
    __int16 v37 = objc_msgSend(*(id *)(a1 + 56), "ef_filter:", &__block_literal_global_398_0);
    id v38 = [*(id *)(a1 + 32) hookResponder];
    [v38 persistenceWillChangeFlags:*(void *)(a1 + 80) messages:v37];

    id v39 = (id)[*(id *)(a1 + 32) applyFlagChange:*(void *)(a1 + 80) toMessagesInDatabase:*(void *)(a1 + 56)];
    __int16 v40 = [*(id *)(a1 + 32) hookResponder];
    [v40 persistenceIsChangingFlags:*(void *)(a1 + 80) messages:v37 generationWindow:*(void *)(a1 + 48)];

    v41 = objc_msgSend(v37, "ef_filter:", &__block_literal_global_66);
    [*(id *)(a1 + 32) deletePersistedMessages:v41];
    [*(id *)(a1 + 88) addObjectsFromArray:v37];
    goto LABEL_55;
  }
LABEL_57:
  if (v8
    && (!*(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24)
     || !*(unsigned char *)(*(void *)(*(void *)(a1 + 120) + 8) + 24))
    && objc_msgSend(*(id *)(a1 + 56), "ef_any:", &__block_literal_global_70))
  {
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) && *(void *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "resetStatusCountsForMailboxWithURL:");
      *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = 1;
    }
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) && *(void *)(a1 + 64))
    {
      objc_msgSend(*(id *)(a1 + 32), "resetStatusCountsForMailboxWithURL:");
      *(unsigned char *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) = 1;
    }
  }
  id v46 = +[EDMessageChangeManager signpostLog];
  v47 = v46;
  os_signpost_id_t v48 = *(void *)(a1 + 128);
  if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v47, OS_SIGNPOST_EVENT, v48, "EDMessageChangeManagerTransferMessages", "End database write connection", buf, 2u);
  }

  return v8;
}

void __116__EDMessageChangeManager_transferMessages_transferType_destinationMailboxURL_userInitiated_oldMessagesByNewMessage___block_invoke_54(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc(MEMORY[0x1E4F60910]);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __116__EDMessageChangeManager_transferMessages_transferType_destinationMailboxURL_userInitiated_oldMessagesByNewMessage___block_invoke_2_56;
  BOOL v15 = &unk_1E6C021A8;
  id v8 = v6;
  id v16 = v8;
  id v9 = v5;
  id v17 = v9;
  uint64_t v10 = (void *)[v7 initWithBuilder:&v12];
  if (*(unsigned char *)(a1 + 64)
    && (objc_msgSend(*(id *)(a1 + 32), "haveCompleteMIMEForMessage:", v9, v12, v13, v14, v15, v16) & 1) == 0)
  {
    id v11 = (id *)(a1 + 40);
    goto LABEL_8;
  }
  if (*(unsigned char *)(a1 + 65))
  {
    id v11 = (id *)(a1 + 48);
LABEL_8:
    objc_msgSend(*v11, "addObject:", v10, v12, v13, v14, v15);
    goto LABEL_9;
  }
  if (*(unsigned char *)(a1 + 66))
  {
    id v11 = (id *)(a1 + 56);
    goto LABEL_8;
  }
LABEL_9:
}

void __116__EDMessageChangeManager_transferMessages_transferType_destinationMailboxURL_userInitiated_oldMessagesByNewMessage___block_invoke_2_56(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSourceMessage:*(void *)(a1 + 32)];
  [v3 setDestinationMessage:*(void *)(a1 + 40)];
}

void __116__EDMessageChangeManager_transferMessages_transferType_destinationMailboxURL_userInitiated_oldMessagesByNewMessage___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setItemsToDownload:*(void *)(a1 + 32)];
  [v4 setItemsToCopy:*(void *)(a1 + 40)];
  [v4 setItemsToDelete:*(void *)(a1 + 48)];
  [v4 setSourceMailboxURL:*(void *)(a1 + 56)];
  if (*(unsigned char *)(a1 + 88)) {
    uint64_t v3 = *(void *)(a1 + 64);
  }
  else {
    uint64_t v3 = 0;
  }
  [v4 setDestinationMailboxURL:v3];
  [v4 setMailboxURL:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  [v4 setUserInitiated:*(unsigned __int8 *)(a1 + 89)];
  [v4 setTransferType:*(void *)(a1 + 80)];
}

BOOL __116__EDMessageChangeManager_transferMessages_transferType_destinationMailboxURL_userInitiated_oldMessagesByNewMessage___block_invoke_63(uint64_t a1, void *a2)
{
  v2 = [a2 remoteID];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

uint64_t __116__EDMessageChangeManager_transferMessages_transferType_destinationMailboxURL_userInitiated_oldMessagesByNewMessage___block_invoke_2_67(uint64_t a1, void *a2)
{
  v2 = [a2 flags];
  uint64_t v3 = [v2 read] ^ 1;

  return v3;
}

- (void)_addLogMassDeletion
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  id v4 = [v3 objectForKey:@"EMUserDefaultLogMassDeletion"];
  id v9 = (id)[v2 initWithArray:v4];

  if ((unint64_t)[v9 count] >= 0x1F) {
    objc_msgSend(v9, "removeObjectsInRange:", 0, 2);
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = [MEMORY[0x1E4F1C9C8] now];
  [v5 setObject:v6 forKeyedSubscript:@"EMUserDefaultLogMassDeletionGmailThreshold"];

  [v9 addObject:v5];
  id v7 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  id v8 = (void *)[v9 copy];
  [v7 setValue:v8 forKey:@"EMUserDefaultLogMassDeletion"];
}

- (void)deleteAllMessageFromMailboxes:(id)a3 exceptMessages:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v6, "ef_map:", &__block_literal_global_82_0);
  id v9 = +[EDMessageChangeManager log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = v8;
    _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "Deleting all message from %{public}@", (uint8_t *)&v10, 0xCu);
  }

  [(EDMessageChangeManager *)self transferAllMessagesFromMailboxes:v6 exceptMessages:v7 transferType:3 destinationMailboxURL:0 userInitiated:0];
}

id __71__EDMessageChangeManager_deleteAllMessageFromMailboxes_exceptMessages___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = objc_msgSend(MEMORY[0x1E4F60E00], "ec_redactedStringForMailboxURL:", a2);

  return v2;
}

- (void)transferAllMessagesFromMailboxes:(id)a3 exceptMessages:(id)a4 transferType:(int64_t)a5 destinationMailboxURL:(id)a6 userInitiated:(BOOL)a7
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v28 = a4;
  id v26 = a6;
  uint64_t v12 = +[EDMessageChangeManager signpostLog];
  os_signpost_id_t v13 = os_signpost_id_generate(v12);

  id v14 = +[EDMessageChangeManager signpostLog];
  BOOL v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    int v16 = objc_msgSend(MEMORY[0x1E4F60E00], "bucketMessageCount:", objc_msgSend(v28, "count"));
    id v17 = objc_msgSend(MEMORY[0x1E4F60E00], "ec_redactedStringForMailboxURL:", v26);
    *(_DWORD *)buf = 67240450;
    int v41 = v16;
    __int16 v42 = 2114;
    v43 = v17;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "EDMessageChangeManagerTransferAllMessages", "Begin transfer all NumberOfMessages=%{public,signpost.telemetry:number1}u messages to destinationMailbox=%{public}@ enableTelemetry=YES ", buf, 0x12u);
  }
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __123__EDMessageChangeManager_transferAllMessagesFromMailboxes_exceptMessages_transferType_destinationMailboxURL_userInitiated___block_invoke;
  v36[3] = &unk_1E6C02300;
  v36[4] = self;
  int64_t v38 = a5;
  id v18 = v26;
  id v37 = v18;
  BOOL v39 = a7;
  os_signpost_id_t v19 = [(EDMessageChangeManager *)self iterateMessagesInMailboxURLs:v27 excludingMessages:v28 batchSize:256 returnMessagesForFlagChange:0 handler:v36];
  int v20 = [(EDMessageChangeManager *)self markAllWorkQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __123__EDMessageChangeManager_transferAllMessagesFromMailboxes_exceptMessages_transferType_destinationMailboxURL_userInitiated___block_invoke_3;
  block[3] = &unk_1E6C00500;
  id v21 = v27;
  int64_t v34 = a5;
  id v30 = v21;
  id v31 = self;
  id v22 = v18;
  id v32 = v22;
  id v23 = v19;
  id v33 = v23;
  BOOL v35 = a7;
  dispatch_sync(v20, block);

  int8x16_t v24 = +[EDMessageChangeManager signpostLog];
  uint64_t v25 = v24;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v25, OS_SIGNPOST_INTERVAL_END, v13, "EDMessageChangeManagerTransferAllMessages", "", buf, 2u);
  }
}

void __123__EDMessageChangeManager_transferAllMessagesFromMailboxes_exceptMessages_transferType_destinationMailboxURL_userInitiated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) markAllWorkQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __123__EDMessageChangeManager_transferAllMessagesFromMailboxes_exceptMessages_transferType_destinationMailboxURL_userInitiated___block_invoke_2;
  block[3] = &unk_1E6C022D8;
  id v5 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v10 = *(void *)(a1 + 48);
  id v9 = v5;
  char v11 = *(unsigned char *)(a1 + 56);
  id v6 = v3;
  dispatch_async(v4, block);
}

id __123__EDMessageChangeManager_transferAllMessagesFromMailboxes_exceptMessages_transferType_destinationMailboxURL_userInitiated___block_invoke_2(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) transferMessages:*(void *)(a1 + 40) transferType:*(void *)(a1 + 56) destinationMailboxURL:*(void *)(a1 + 48) userInitiated:*(unsigned __int8 *)(a1 + 64)];
}

void __123__EDMessageChangeManager_transferAllMessagesFromMailboxes_exceptMessages_transferType_destinationMailboxURL_userInitiated___block_invoke_3(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v23;
    uint64_t v5 = *MEMORY[0x1E4F5FC38];
    BOOL v15 = v17;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v23 != v4) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v8 = *(void *)(a1 + 64);
        if (v8 == 1)
        {
          if (objc_msgSend(*(id *)(a1 + 40), "mailboxIsAllMail:", *(void *)(*((void *)&v22 + 1) + 8 * i), v15))uint64_t v8 = objc_msgSend(*(id *)(a1 + 40), "mailboxPartOfAllMail:", *(void *)(a1 + 48)) ^ 1; {
          else
          }
            uint64_t v8 = 1;
        }
        objc_msgSend(*(id *)(a1 + 40), "resetStatusCountsForMailboxWithURL:", v7, v15);
        if (*(void *)(a1 + 48)) {
          objc_msgSend(*(id *)(a1 + 40), "resetStatusCountsForMailboxWithURL:");
        }
        id v9 = [*(id *)(a1 + 56) objectForKeyedSubscript:v7];
        int v10 = objc_msgSend(v7, "ef_hasScheme:", v5);
        if (v9) {
          int v11 = v10;
        }
        else {
          int v11 = 0;
        }
        if (v11 == 1 && ([v9 isEqualToString:@"1"] & 1) == 0)
        {
          id v12 = objc_alloc(MEMORY[0x1E4F60928]);
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v17[0] = __123__EDMessageChangeManager_transferAllMessagesFromMailboxes_exceptMessages_transferType_destinationMailboxURL_userInitiated___block_invoke_4;
          v17[1] = &unk_1E6C02328;
          v17[2] = v7;
          id v18 = *(id *)(a1 + 48);
          uint64_t v20 = v8;
          char v21 = *(unsigned char *)(a1 + 72);
          id v19 = v9;
          os_signpost_id_t v13 = (void *)[v12 initWithBuilder:v16];
          id v14 = [*(id *)(a1 + 40) localActionPersistence];
          [v14 persistTransferUndownloadedAction:v13];

          objc_msgSend(*(id *)(a1 + 40), "checkForNewActionsInMailboxID:", objc_msgSend(*(id *)(a1 + 40), "mailboxDatabaseIDForURL:", v7));
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v3);
  }
}

void __123__EDMessageChangeManager_transferAllMessagesFromMailboxes_exceptMessages_transferType_destinationMailboxURL_userInitiated___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setMailboxURL:*(void *)(a1 + 32)];
  [v3 setSourceMailboxURL:*(void *)(a1 + 32)];
  [v3 setDestinationMailboxURL:*(void *)(a1 + 40)];
  [v3 setTransferType:*(void *)(a1 + 56)];
  [v3 setUserInitiated:*(unsigned __int8 *)(a1 + 64)];
  [v3 setOldestPersistedRemoteID:*(void *)(a1 + 48)];
}

- (id)addNewMessages:(id)a3 mailboxURL:(id)a4 userInitiated:(BOOL)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v8 = a4;
  long long v25 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  id v9 = +[EDMessageChangeManager log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v26 count];
    int v11 = objc_msgSend(MEMORY[0x1E4F60E00], "ec_redactedStringForMailboxURL:", v8);
    *(_DWORD *)buf = 134218242;
    uint64_t v36 = v10;
    __int16 v37 = 2114;
    int64_t v38 = v11;
    _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "Adding %lu new messages to %{public}@", buf, 0x16u);
  }
  id v12 = [(EDMessageChangeManager *)self hookResponder];
  [v12 persistenceWillBeginUpdates];

  LOBYTE(v12) = [(EDMessageChangeManager *)self mailboxURLIsInRemoteAccount:v8];
  os_signpost_id_t v13 = objc_opt_new();
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __66__EDMessageChangeManager_addNewMessages_mailboxURL_userInitiated___block_invoke;
  v27[3] = &unk_1E6C023C8;
  v27[4] = self;
  id v15 = v8;
  id v28 = v15;
  id v16 = v13;
  id v29 = v16;
  id v17 = v25;
  id v30 = v17;
  id v18 = v14;
  id v31 = v18;
  id v19 = v26;
  id v32 = v19;
  char v33 = (char)v12;
  BOOL v34 = a5;
  objc_msgSend(v19, "ef_enumerateObjectsInBatchesOfSize:block:", 25, v27);
  if ([v18 count])
  {
    [(EDMessageChangeManager *)self willStartPersistenceDidAddMessages:v16];
    uint64_t v20 = [(EDMessageChangeManager *)self hookResponder];
    [v20 persistenceDidAddMessages:v18 generationWindow:v17];

    [(EDMessageChangeManager *)self didFinishPersistenceDidAddMessages:v16];
  }
  char v21 = [(EDMessageChangeManager *)self hookResponder];
  [v21 persistenceDidFinishUpdates];

  long long v22 = v32;
  id v23 = v18;

  return v23;
}

void __66__EDMessageChangeManager_addNewMessages_mailboxURL_userInitiated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) database];
  uint64_t v5 = [NSString stringWithUTF8String:"-[EDMessageChangeManager addNewMessages:mailboxURL:userInitiated:]_block_invoke"];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __66__EDMessageChangeManager_addNewMessages_mailboxURL_userInitiated___block_invoke_2;
  uint64_t v10 = &unk_1E6C023A0;
  uint64_t v11 = *(void *)(a1 + 32);
  id v6 = v3;
  id v12 = v6;
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  id v16 = *(id *)(a1 + 64);
  id v17 = *(id *)(a1 + 72);
  __int16 v18 = *(_WORD *)(a1 + 80);
  objc_msgSend(v4, "__performWriteWithCaller:usingBlock:", v5, &v7);

  if (*(unsigned char *)(a1 + 80)) {
    objc_msgSend(*(id *)(a1 + 32), "checkForNewActionsInMailboxID:", objc_msgSend(*(id *)(a1 + 32), "mailboxDatabaseIDForURL:", *(void *)(a1 + 40), v7, v8, v9, v10, v11, v12, v13, v14, v15, v16));
  }
}

uint64_t __66__EDMessageChangeManager_addNewMessages_mailboxURL_userInitiated___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v19 = a2;
  __int16 v18 = objc_opt_new();
  int v3 = [*(id *)(a1 + 32) persistNewMessages:*(void *)(a1 + 40) mailboxURL:*(void *)(a1 + 48) oldMessagesByNewMessage:v18 fromSyncing:0];
  [*(id *)(a1 + 56) addEntriesFromDictionary:v18];
  uint64_t v20 = [v18 allKeys];
  objc_msgSend(*(id *)(a1 + 64), "insertGeneration:", objc_msgSend(v19, "transactionGeneration"));
  [*(id *)(a1 + 72) addObjectsFromArray:v20];
  if (v3)
  {
    if (objc_msgSend(*(id *)(a1 + 80), "ef_any:", &__block_literal_global_90_1)) {
      [*(id *)(a1 + 32) resetStatusCountsForMailboxWithURL:*(void *)(a1 + 48)];
    }
    if (*(unsigned char *)(a1 + 88))
    {
      uint64_t v4 = objc_opt_new();
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v5 = v20;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v27 != v7) {
              objc_enumerationMutation(v5);
            }
            uint64_t v9 = *(void *)(*((void *)&v26 + 1) + 8 * i);
            id v10 = objc_alloc(MEMORY[0x1E4F60910]);
            v25[0] = MEMORY[0x1E4F143A8];
            v25[1] = 3221225472;
            v25[2] = __66__EDMessageChangeManager_addNewMessages_mailboxURL_userInitiated___block_invoke_4;
            v25[3] = &unk_1E6C02350;
            v25[4] = v9;
            uint64_t v11 = (void *)[v10 initWithBuilder:v25];
            [v4 addObject:v11];
          }
          uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v6);
      }

      id v12 = objc_alloc(MEMORY[0x1E4F60908]);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __66__EDMessageChangeManager_addNewMessages_mailboxURL_userInitiated___block_invoke_5;
      v21[3] = &unk_1E6C02378;
      id v13 = v4;
      id v22 = v13;
      id v23 = *(id *)(a1 + 48);
      char v24 = *(unsigned char *)(a1 + 89);
      id v14 = (void *)[v12 initWithBuilder:v21];
      id v15 = [*(id *)(a1 + 32) localActionPersistence];
      uint64_t v16 = [v15 persistTransferAction:v14];
    }
    else
    {
      uint64_t v16 = 1;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

uint64_t __66__EDMessageChangeManager_addNewMessages_mailboxURL_userInitiated___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 flags];
  uint64_t v3 = [v2 read] ^ 1;

  return v3;
}

uint64_t __66__EDMessageChangeManager_addNewMessages_mailboxURL_userInitiated___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setDestinationMessage:*(void *)(a1 + 32)];
}

void __66__EDMessageChangeManager_addNewMessages_mailboxURL_userInitiated___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setItemsToCopy:*(void *)(a1 + 32)];
  [v3 setDestinationMailboxURL:*(void *)(a1 + 40)];
  [v3 setMailboxURL:*(void *)(a1 + 40)];
  [v3 setUserInitiated:*(unsigned __int8 *)(a1 + 48)];
  [v3 setTransferType:2];
}

- (void)deleteMessages:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[EDMessageChangeManager log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    uint64_t v8 = [v4 count];
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Deleting %lu messages", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(EDMessageChangeManager *)self transferMessages:v4 transferType:3 destinationMailboxURL:0 userInitiated:0];
}

- (void)applyFlagChange:(id)a3 toAllMessagesFromMailboxes:(id)a4 exceptMessages:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v26 = objc_msgSend(v8, "ef_map:", &__block_literal_global_92_0);
  id v10 = +[EDMessageChangeManager log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_msgSend(v27, "ef_publicDescription");
    *(_DWORD *)buf = 138543618;
    *(void *)uint64_t v36 = v11;
    *(_WORD *)&v36[8] = 2114;
    *(void *)&v36[10] = v26;
    _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Setting flags %{public}@ on all message for mailboxes %{public}@", buf, 0x16u);
  }
  id v12 = +[EDMessageChangeManager signpostLog];
  os_signpost_id_t v13 = os_signpost_id_generate(v12);

  id v14 = +[EDMessageChangeManager signpostLog];
  id v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    int v16 = objc_msgSend(MEMORY[0x1E4F60E00], "bucketMessageCount:", objc_msgSend(v9, "count"));
    uint64_t v17 = [v27 hash];
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)uint64_t v36 = v16;
    *(_WORD *)&v36[4] = 2050;
    *(void *)&v36[6] = v17;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "EDMessageChangeManagerChangeFlagAllMessages", "Begin flag change NumberOfMessages=%{public,signpost.telemetry:number1}u messages to FlagChange=%{public,signpost.telemetry:number2}lu enableTelemetry=YES ", buf, 0x12u);
  }

  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __84__EDMessageChangeManager_applyFlagChange_toAllMessagesFromMailboxes_exceptMessages___block_invoke_93;
  v33[3] = &unk_1E6C023F0;
  v33[4] = self;
  id v18 = v27;
  id v34 = v18;
  id v19 = [(EDMessageChangeManager *)self iterateMessagesInMailboxURLs:v8 excludingMessages:v9 batchSize:256 returnMessagesForFlagChange:v18 handler:v33];
  uint64_t v20 = [(EDMessageChangeManager *)self markAllWorkQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__EDMessageChangeManager_applyFlagChange_toAllMessagesFromMailboxes_exceptMessages___block_invoke_3;
  block[3] = &unk_1E6BFFA78;
  id v21 = v8;
  id v29 = v21;
  id v22 = v18;
  id v30 = v22;
  uint64_t v31 = self;
  id v23 = v19;
  id v32 = v23;
  dispatch_sync(v20, block);

  char v24 = +[EDMessageChangeManager signpostLog];
  long long v25 = v24;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v25, OS_SIGNPOST_INTERVAL_END, v13, "EDMessageChangeManagerChangeFlagAllMessages", "", buf, 2u);
  }
}

id __84__EDMessageChangeManager_applyFlagChange_toAllMessagesFromMailboxes_exceptMessages___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = objc_msgSend(MEMORY[0x1E4F60E00], "ec_redactedStringForMailboxURL:", a2);

  return v2;
}

void __84__EDMessageChangeManager_applyFlagChange_toAllMessagesFromMailboxes_exceptMessages___block_invoke_93(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) markAllWorkQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__EDMessageChangeManager_applyFlagChange_toAllMessagesFromMailboxes_exceptMessages___block_invoke_2;
  block[3] = &unk_1E6BFF7A8;
  id v5 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v4, block);
}

id __84__EDMessageChangeManager_applyFlagChange_toAllMessagesFromMailboxes_exceptMessages___block_invoke_2(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) applyFlagChange:*(void *)(a1 + 40) toMessages:*(void *)(a1 + 48)];
}

void __84__EDMessageChangeManager_applyFlagChange_toAllMessagesFromMailboxes_exceptMessages___block_invoke_3(id *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v2 = a1[4];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v20;
    uint64_t v5 = *MEMORY[0x1E4F5FC38];
    id v14 = v16;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v20 != v4) {
          objc_enumerationMutation(v2);
        }
        int v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ((objc_msgSend(a1[5], "readChanged", v14) & 1) != 0 || objc_msgSend(a1[5], "deletedChanged")) {
          [a1[6] resetStatusCountsForMailboxWithURL:v7];
        }
        id v8 = [a1[7] objectForKeyedSubscript:v7];
        int v9 = objc_msgSend(v7, "ef_hasScheme:", v5);
        if (v8) {
          int v10 = v9;
        }
        else {
          int v10 = 0;
        }
        if (v10 == 1 && ([v8 isEqualToString:@"1"] & 1) == 0)
        {
          id v11 = objc_alloc(MEMORY[0x1E4F60838]);
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v16[0] = __84__EDMessageChangeManager_applyFlagChange_toAllMessagesFromMailboxes_exceptMessages___block_invoke_4;
          v16[1] = &unk_1E6C02418;
          void v16[2] = v7;
          id v17 = a1[5];
          id v18 = v8;
          id v12 = (void *)[v11 initWithBuilder:v15];
          os_signpost_id_t v13 = [a1[6] localActionPersistence];
          [v13 persistFlagChangeUndownloadedAction:v12];

          objc_msgSend(a1[6], "checkForNewActionsInMailboxID:", objc_msgSend(a1[6], "mailboxDatabaseIDForURL:", v7));
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v3);
  }
}

void __84__EDMessageChangeManager_applyFlagChange_toAllMessagesFromMailboxes_exceptMessages___block_invoke_4(void *a1, void *a2)
{
  id v3 = a2;
  [v3 setMailboxURL:a1[4]];
  [v3 setFlagChange:a1[5]];
  [v3 setOldestPersistedRemoteID:a1[6]];
}

- (id)applyFlagChange:(id)a3 toMessages:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v38 = a4;
  uint64_t v7 = [v38 count];
  int v8 = [v6 readChanged];
  int v9 = &stru_1F3583658;
  if (v8) {
    int v9 = @"[ReadFlags] ";
  }
  uint64_t v37 = v9;
  int v10 = +[EDMessageChangeManager log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = objc_msgSend(v6, "ef_publicDescription");
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v37;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2048;
    id v53 = (uint64_t (*)(uint64_t, uint64_t))v7;
    _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Setting flags %{public}@ on %lu messages", buf, 0x20u);
  }
  uint64_t v36 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  id v12 = +[EDMessageChangeManager signpostLog];
  os_signpost_id_t v13 = os_signpost_id_generate(v12);

  id v14 = +[EDMessageChangeManager signpostLog];
  id v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    int v16 = [MEMORY[0x1E4F60E00] bucketMessageCount:v7];
    uint64_t v17 = [v6 hash];
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)&uint8_t buf[4] = v16;
    *(_WORD *)&uint8_t buf[8] = 2050;
    *(void *)&buf[10] = v17;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "EDMessageChangeManagerChangeFlagMessages", "Begin flag change NumberOfMessages=%{public,signpost.telemetry:number1}u messages to FlagChange=%{public,signpost.telemetry:number2}lu enableTelemetry=YES ", buf, 0x12u);
  }

  id v18 = [(EDMessageChangeManager *)self hookResponder];
  [v18 persistenceWillBeginUpdates];

  long long v19 = objc_msgSend(v38, "ef_filter:", &__block_literal_global_98_0);
  long long v20 = objc_msgSend(v19, "ef_groupBy:", &__block_literal_global_101_0);

  long long v21 = [v20 allValues];
  long long v22 = objc_msgSend(v21, "ef_flatten");
  uint64_t v23 = [v22 count];

  if (v23 != v7)
  {
    uint64_t v24 = +[EDMessageChangeManager log];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[EDMessageChangeManager applyFlagChange:toMessages:](v23, v7, v24);
    }
  }
  long long v25 = [(EDMessageChangeManager *)self hookResponder];
  long long v26 = objc_msgSend(v38, "ef_filter:", &__block_literal_global_398_0);
  [v25 persistenceWillChangeFlags:v6 messages:v26];

  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  id v53 = __Block_byref_object_copy__19;
  id v54 = __Block_byref_object_dispose__19;
  id v55 = (id)0xAAAAAAAAAAAAAAAALL;
  id v55 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__19;
  id v50 = __Block_byref_object_dispose__19;
  id v51 = (id)0xAAAAAAAAAAAAAAAALL;
  id v51 = [MEMORY[0x1E4F1CA48] array];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __53__EDMessageChangeManager_applyFlagChange_toMessages___block_invoke_102;
  v40[3] = &unk_1E6C024B0;
  v40[4] = self;
  id v27 = v6;
  id v41 = v27;
  long long v28 = v37;
  __int16 v42 = v28;
  id v29 = v36;
  v43 = v29;
  uint64_t v44 = buf;
  id v45 = &v46;
  [v20 enumerateKeysAndObjectsUsingBlock:v40];
  id v30 = [(EDMessageChangeManager *)self hookResponder];
  [v30 persistenceDidChangeFlags:v27 messages:v47[5] generationWindow:v29];

  uint64_t v31 = [(EDMessageChangeManager *)self hookResponder];
  [v31 persistenceDidFinishUpdates];

  id v32 = +[EDMessageChangeManager signpostLog];
  char v33 = v32;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
  {
    *(_WORD *)uint64_t v39 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v33, OS_SIGNPOST_INTERVAL_END, v13, "EDMessageChangeManagerChangeFlagMessages", "", v39, 2u);
  }

  id v34 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(&v46, 8);

  _Block_object_dispose(buf, 8);

  return v34;
}

BOOL __53__EDMessageChangeManager_applyFlagChange_toMessages___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 mailbox];
  id v3 = [v2 URL];
  BOOL v4 = v3 != 0;

  return v4;
}

id __53__EDMessageChangeManager_applyFlagChange_toMessages___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 mailbox];
  id v3 = [v2 URL];

  return v3;
}

void __53__EDMessageChangeManager_applyFlagChange_toMessages___block_invoke_102(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) mailboxURLIsInRemoteAccount:v5];
  int v8 = [*(id *)(a1 + 32) database];
  int v9 = [NSString stringWithUTF8String:"-[EDMessageChangeManager applyFlagChange:toMessages:]_block_invoke"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__EDMessageChangeManager_applyFlagChange_toMessages___block_invoke_2_103;
  v13[3] = &unk_1E6C02488;
  int v10 = *(void **)(a1 + 40);
  v13[4] = *(void *)(a1 + 32);
  id v14 = v10;
  id v11 = v6;
  id v15 = v11;
  id v16 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 56);
  long long v19 = *(_OWORD *)(a1 + 64);
  id v12 = v5;
  id v18 = v12;
  char v20 = v7;
  objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v9, v13);

  if (v7) {
    objc_msgSend(*(id *)(a1 + 32), "checkForNewActionsInMailboxID:", objc_msgSend(*(id *)(a1 + 32), "mailboxDatabaseIDForURL:", v12));
  }
}

uint64_t __53__EDMessageChangeManager_applyFlagChange_toMessages___block_invoke_2_103(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) applyFlagChange:*(void *)(a1 + 40) toMessagesInDatabase:*(void *)(a1 + 48)];
  uint64_t v5 = [v4 count];
  if (v5 != [*(id *)(a1 + 48) count])
  {
    id v6 = +[EDMessageChangeManager log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 56);
      uint64_t v8 = [*(id *)(a1 + 48) count];
      *(_DWORD *)buf = 138543874;
      uint64_t v27 = v7;
      __int16 v28 = 2048;
      uint64_t v29 = v5;
      __int16 v30 = 2048;
      uint64_t v31 = v8;
      _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Applied flag change to %lu of %lu messages", buf, 0x20u);
    }
  }
  int v9 = objc_msgSend(v4, "ef_filter:", &__block_literal_global_398_0);
  if (v5 != [v9 count])
  {
    int v10 = +[EDMessageChangeManager log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __53__EDMessageChangeManager_applyFlagChange_toMessages___block_invoke_2_103_cold_1(buf, [v9 count], v5, v10);
    }
  }
  objc_msgSend(*(id *)(a1 + 64), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) addObjectsFromArray:v4];
  [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) addObjectsFromArray:v9];
  if ([v4 count])
  {
    id v11 = [*(id *)(a1 + 32) hookResponder];
    [v11 persistenceIsChangingFlags:*(void *)(a1 + 40) messages:v9 generationWindow:*(void *)(a1 + 64)];

    if (([*(id *)(a1 + 40) readChanged] & 1) != 0
      || [*(id *)(a1 + 40) deletedChanged])
    {
      [*(id *)(a1 + 32) resetStatusCountsForMailboxWithURL:*(void *)(a1 + 72)];
    }
  }
  if (*(unsigned char *)(a1 + 96) && [v4 count])
  {
    id v12 = objc_alloc(MEMORY[0x1E4F60828]);
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    char v20 = __53__EDMessageChangeManager_applyFlagChange_toMessages___block_invoke_105;
    long long v21 = &unk_1E6C02460;
    id v13 = *(id *)(a1 + 72);
    uint64_t v14 = *(void *)(a1 + 32);
    id v22 = v13;
    uint64_t v23 = v14;
    id v24 = *(id *)(a1 + 48);
    id v25 = *(id *)(a1 + 40);
    id v15 = (void *)[v12 initWithBuilder:&v18];
    id v16 = objc_msgSend(*(id *)(a1 + 32), "localActionPersistence", v18, v19, v20, v21);
    [v16 persistFlagChangeAction:v15];
  }
  return 1;
}

void __53__EDMessageChangeManager_applyFlagChange_toMessages___block_invoke_105(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setMailboxURL:*(void *)(a1 + 32)];
  id v3 = [*(id *)(a1 + 40) messagesToJournalForMessages:*(void *)(a1 + 48) inMailbox:*(void *)(a1 + 32)];
  [v4 setMessages:v3];

  [v4 setFlagChange:*(void *)(a1 + 56)];
}

- (void)applyFollowUp:(id)a3 toMessages:(id)a4
{
}

- (void)applyFollowUp:(id)a3 toMessages:(id)a4 withNegativeFeedbackForSuggestions:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  int v10 = +[EDMessageChangeManager log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [v9 count];
    _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Setting follow up dates and json data %{public}@ on %lu messages", buf, 0x16u);
  }

  id v11 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  id v12 = [(EDMessageChangeManager *)self hookResponder];
  [v12 persistenceWillBeginUpdates];

  if (v5)
  {
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    long long v26 = __Block_byref_object_copy__19;
    uint64_t v27 = __Block_byref_object_dispose__19;
    id v28 = (id)0xAAAAAAAAAAAAAAAALL;
    id v28 = [MEMORY[0x1E4F5DB70] serviceForMail];
    [*(id *)(*(void *)&buf[8] + 40) setSyncTimeout:0.1];
    id v13 = [(EDMessageChangeManager *)self messagePersistence];
    uint64_t v14 = [v13 retrieveFollowUpJsonStringForModelEvaluationForSuggestionsForMessages:v9];

    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = __Block_byref_object_copy__19;
    void v21[4] = __Block_byref_object_dispose__19;
    id v22 = 0;
    id v15 = +[EDMessageChangeManager log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [v14 count];
      *(_DWORD *)uint64_t v23 = 134217984;
      uint64_t v24 = v16;
      _os_log_impl(&dword_1DB39C000, v15, OS_LOG_TYPE_DEFAULT, "Sending negative feedback for follow up to Suggestions for %lu messages", v23, 0xCu);
    }

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __86__EDMessageChangeManager_applyFollowUp_toMessages_withNegativeFeedbackForSuggestions___block_invoke;
    v20[3] = &unk_1E6C024D8;
    v20[4] = buf;
    v20[5] = v21;
    [v14 enumerateObjectsUsingBlock:v20];
    _Block_object_dispose(v21, 8);

    _Block_object_dispose(buf, 8);
  }
  id v17 = [(EDMessageChangeManager *)self messagePersistence];
  [v17 persistFollowUp:v8 forMessages:v9];

  uint64_t v18 = [(EDMessageChangeManager *)self hookResponder];
  [v18 persistenceDidUpdateFollowUpForMessages:v9 generationWindow:v11];

  uint64_t v19 = [(EDMessageChangeManager *)self hookResponder];
  [v19 persistenceDidFinishUpdates];
}

void __86__EDMessageChangeManager_applyFollowUp_toMessages_withNegativeFeedbackForSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v9 = +[EDMessageChangeManager log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v10 = 0;
      _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "Suggestions does not respond to selector @selector(reportMailIntelligenceFollowUpUserEngagement:forStringFromFollowUpWarning:error:)", v10, 2u);
    }
    goto LABEL_7;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v4 = a1 + 40;
  id v6 = *(void **)(*(void *)(*(void *)(v4 - 8) + 8) + 40);
  uint64_t v7 = *(void *)(v5 + 8);
  id obj = *(id *)(v7 + 40);
  id v8 = (id)[v6 reportMailIntelligenceFollowUpUserEngagement:0 forStringFromFollowUpWarning:v3 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  if (*(void *)(*(void *)(*(void *)v4 + 8) + 40))
  {
    id v9 = +[EDMessageChangeManager log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __86__EDMessageChangeManager_applyFollowUp_toMessages_withNegativeFeedbackForSuggestions___block_invoke_cold_1(v4, v9);
    }
LABEL_7:
  }
}

- (id)applyReadLaterDate:(id)a3 displayDate:(id)a4 toMessages:(id)a5
{
  uint64_t v5 = [(EDMessageChangeManager *)self _applyReadLaterDate:a3 displayDate:a4 toMessages:a5 changeIsRemote:0];

  return v5;
}

- (id)_applyReadLaterDate:(id)a3 displayDate:(id)a4 toMessages:(id)a5 changeIsRemote:(BOOL)a6
{
  BOOL v31 = a6;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v29 = a4;
  id v34 = a5;
  uint64_t v10 = [(EDMessageChangeManager *)self _truncateReadLaterDate:v9];

  char v33 = (void *)v10;
  if (v10) {
    id v28 = (void *)[objc_alloc(MEMORY[0x1E4F60420]) initWithDate:v10];
  }
  else {
    id v28 = 0;
  }
  id v11 = EDRemindMeLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v29;
    *(_WORD *)&buf[22] = 2048;
    id v53 = (uint64_t (*)(uint64_t, uint64_t))[v34 count];
    LOWORD(v54) = 1024;
    *(_DWORD *)((char *)&v54 + 2) = v31;
    _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_DEFAULT, "Setting read later date=%{public}@, displayDate=%{public}@ on %lu messages, changeIsRemote:%{BOOL}d", buf, 0x26u);
  }

  uint64_t v27 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  id v12 = [(EDMessageChangeManager *)self hookResponder];
  __int16 v30 = v12;
  [v12 persistenceWillBeginUpdates];
  if ([v34 count]) {
    [v12 persistenceWillChangeReadLaterDate:v33 messages:v34];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__EDMessageChangeManager__applyReadLaterDate_displayDate_toMessages_changeIsRemote___block_invoke;
  aBlock[3] = &unk_1E6C02500;
  id v13 = v29;
  id v51 = v13;
  uint64_t v32 = _Block_copy(aBlock);
  uint64_t v14 = objc_msgSend(v34, "ef_filter:", v32);
  if ([v14 count]) {
    [v12 persistenceWillUpdateDisplayDateForMessages:v14];
  }
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  uint64_t v49 = 0;
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  id v53 = __Block_byref_object_copy__19;
  id v54 = __Block_byref_object_dispose__19;
  id v55 = 0;
  id v15 = [(EDMessageChangeManager *)self database];
  uint64_t v16 = [NSString stringWithUTF8String:"-[EDMessageChangeManager _applyReadLaterDate:displayDate:toMessages:changeIsRemote:]"];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __84__EDMessageChangeManager__applyReadLaterDate_displayDate_toMessages_changeIsRemote___block_invoke_2;
  void v35[3] = &unk_1E6C02528;
  uint64_t v44 = &v46;
  id v17 = v27;
  uint64_t v36 = v17;
  id v18 = v34;
  id v37 = v18;
  id v19 = v28;
  id v38 = v19;
  id v20 = v32;
  id v43 = v20;
  id v21 = v33;
  id v39 = v21;
  __int16 v40 = self;
  id v22 = v13;
  id v41 = v22;
  id v23 = v30;
  id v42 = v23;
  id v45 = buf;
  objc_msgSend(v15, "__performWriteWithCaller:usingBlock:", v16, v35);

  if ([v18 count]) {
    [v23 persistenceDidChangeReadLaterDate:v21 messages:*(void *)(*(void *)&buf[8] + 40) changeIsRemote:v31 generationWindow:v17];
  }
  if ([v14 count]) {
    [v23 persistenceDidUpdateDisplayDateForMessages:v14 changeIsRemote:v31 generation:v47[3]];
  }
  [v23 persistenceDidFinishUpdates];
  uint64_t v24 = *(void **)(*(void *)&buf[8] + 40);
  if (!v24) {
    uint64_t v24 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v25 = v24;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v46, 8);

  return v25;
}

uint64_t __84__EDMessageChangeManager__applyReadLaterDate_displayDate_toMessages_changeIsRemote___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(void *)(a1 + 32))
  {
    uint64_t v5 = [v3 displayDate];
    int v6 = [v5 isEqualToDate:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = [v3 dateReceived];
    uint64_t v7 = [v4 displayDate];
    int v6 = [v5 isEqualToDate:v7];
  }
  return v6 ^ 1u;
}

uint64_t __84__EDMessageChangeManager__applyReadLaterDate_displayDate_toMessages_changeIsRemote___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = [v3 transactionGeneration];
  [*(id *)(a1 + 32) insertGeneration:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_msgSend(v8, "setReadLater:", *(void *)(a1 + 48), (void)v17);
        id v9 = [v8 displayDate];
        int v10 = (*(uint64_t (**)(void))(*(void *)(a1 + 88) + 16))();
        id v11 = *(void **)(a1 + 64);
        if (*(void *)(a1 + 56))
        {
          id v12 = [v11 readLaterPersistence];
          [v12 persistReadLaterForMessage:v8 date:*(void *)(a1 + 56) displayDate:*(void *)(a1 + 72)];
        }
        else
        {
          id v12 = [v11 readLaterPersistence];
          [v12 removeReadLaterForMessage:v8];
        }

        if (v10) {
          [*(id *)(a1 + 80) persistenceIsUpdatingDisplayDateForMessage:v8 fromDate:v9 generation:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }

  uint64_t v13 = [*(id *)(a1 + 40) copy];
  uint64_t v14 = *(void *)(*(void *)(a1 + 104) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  return 1;
}

- (id)_truncateReadLaterDate:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, "ef_dateWithTruncatedSeconds");
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] now];
  char v6 = objc_msgSend(v4, "ef_isLaterThanOrEqualDate:", v5);

  uint64_t v7 = v4;
  if ((v6 & 1) == 0)
  {
    id v8 = +[EDMessageChangeManager log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      [(EDMessageChangeManager *)(uint64_t)v4 _truncateReadLaterDate:v8];
    }

    uint64_t v7 = v3;
  }
  id v9 = v7;

  return v9;
}

- (void)applyVIPStatus:(BOOL)a3 forMessages:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  char v6 = [(EDMessageChangeManager *)self hookResponder];
  [v6 persistenceWillBeginUpdates];

  [(EDMessageChangeManager *)self applyVIPStatus:v4 toMessagesInDatabase:v9];
  uint64_t v7 = [(EDMessageChangeManager *)self hookResponder];
  [v7 persistenceDidChangeVIPStatus:v4 messages:v9];

  id v8 = [(EDMessageChangeManager *)self hookResponder];
  [v8 persistenceDidFinishUpdates];
}

- (id)addLabels:(id)a3 removeLabels:(id)a4 forMessages:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  id v12 = [(EDMessageChangeManager *)self hookResponder];
  [v12 persistenceWillBeginUpdates];

  uint64_t v13 = objc_msgSend(v10, "ef_groupBy:", &__block_literal_global_113);
  uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __61__EDMessageChangeManager_addLabels_removeLabels_forMessages___block_invoke_2;
  v25[3] = &unk_1E6C025A0;
  v25[4] = self;
  id v15 = v8;
  id v26 = v15;
  id v16 = v9;
  id v27 = v16;
  long long v17 = v11;
  id v28 = v17;
  id v18 = v14;
  id v29 = v18;
  [v13 enumerateKeysAndObjectsUsingBlock:v25];
  long long v19 = [(EDMessageChangeManager *)self hookResponder];
  long long v20 = objc_msgSend(v18, "ef_filter:", &__block_literal_global_398_0);
  [v19 persistenceDidAddLabels:v15 removeLabels:v16 messages:v20 generationWindow:v17];

  id v21 = [(EDMessageChangeManager *)self hookResponder];
  [v21 persistenceDidFinishUpdates];

  uint64_t v22 = v29;
  id v23 = v18;

  return v23;
}

id __61__EDMessageChangeManager_addLabels_removeLabels_forMessages___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 mailbox];
  id v3 = [v2 URL];

  return v3;
}

void __61__EDMessageChangeManager_addLabels_removeLabels_forMessages___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) mailboxURLIsInRemoteAccount:v5];
  id v8 = [*(id *)(a1 + 32) database];
  id v9 = [NSString stringWithUTF8String:"-[EDMessageChangeManager addLabels:removeLabels:forMessages:]_block_invoke_2"];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __61__EDMessageChangeManager_addLabels_removeLabels_forMessages___block_invoke_3;
  id v16 = &unk_1E6C02578;
  id v10 = *(void **)(a1 + 40);
  uint64_t v17 = *(void *)(a1 + 32);
  id v18 = v10;
  id v19 = *(id *)(a1 + 48);
  id v11 = v6;
  id v20 = v11;
  id v21 = *(id *)(a1 + 56);
  id v22 = *(id *)(a1 + 64);
  char v24 = v7;
  id v12 = v5;
  id v23 = v12;
  objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v9, &v13);

  if (v7) {
    objc_msgSend(*(id *)(a1 + 32), "checkForNewActionsInMailboxID:", objc_msgSend(*(id *)(a1 + 32), "mailboxDatabaseIDForURL:", v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22));
  }
}

uint64_t __61__EDMessageChangeManager_addLabels_removeLabels_forMessages___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) addLabels:*(void *)(a1 + 40) removeLabels:*(void *)(a1 + 48) toMessagesInDatabase:*(void *)(a1 + 56)];
  objc_msgSend(*(id *)(a1 + 64), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  [*(id *)(a1 + 72) addObjectsFromArray:v4];
  if (*(unsigned char *)(a1 + 88) && [*(id *)(a1 + 72) count])
  {
    id v5 = objc_alloc(MEMORY[0x1E4F60878]);
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __61__EDMessageChangeManager_addLabels_removeLabels_forMessages___block_invoke_4;
    id v12 = &unk_1E6C02550;
    id v13 = *(id *)(a1 + 80);
    id v14 = v4;
    id v15 = *(id *)(a1 + 40);
    id v16 = *(id *)(a1 + 48);
    id v6 = (void *)[v5 initWithBuilder:&v9];
    int v7 = objc_msgSend(*(id *)(a1 + 32), "localActionPersistence", v9, v10, v11, v12);
    [v7 persistLabelChangeAction:v6];
  }
  return 1;
}

void __61__EDMessageChangeManager_addLabels_removeLabels_forMessages___block_invoke_4(void *a1, void *a2)
{
  id v3 = a2;
  [v3 setMailboxURL:a1[4]];
  [v3 setMessages:a1[5]];
  [v3 setLabelsToAdd:a1[6]];
  [v3 setLabelsToRemove:a1[7]];
}

- (id)messagesToJournalForMessages:(id)a3 inMailbox:(id)a4
{
  id v4 = a3;

  return v4;
}

- (id)reflectNewMessages:(id)a3 mailboxURL:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  id v42 = a4;
  int v7 = [(EDMessageChangeManager *)self hookResponder];
  [v7 persistenceWillBeginUpdates];

  id v8 = +[EDMessageChangeManager log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v43 count];
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F60E00], "ec_redactedStringForMailboxURL:", v42);
    *(_DWORD *)buf = 134218242;
    uint64_t v65 = v9;
    __int16 v66 = 2114;
    uint64_t v67 = (uint64_t)v10;
    _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "Adding %lu new messages from server sync to %{public}@", buf, 0x16u);
  }
  if ([v43 count])
  {
    id v11 = [(EDMessageChangeManager *)self hookResponder];
    [v11 persistenceWillAddNewMessages:v43];
  }
  __int16 v40 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  uint64_t v44 = objc_opt_new();
  if ([(EDMessageChangeManager *)self _needToStoreServerMessagesForMailboxURL:v42])
  {
    id v12 = objc_opt_new();
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __56__EDMessageChangeManager_reflectNewMessages_mailboxURL___block_invoke;
    v56[3] = &unk_1E6C02690;
    v56[4] = self;
    id v57 = v40;
    id v58 = v42;
    id v59 = v44;
    SEL v61 = a2;
    id v13 = v12;
    id v60 = v13;
    objc_msgSend(v43, "ef_enumerateObjectsInBatchesOfSize:block:", 256, v56);
    id v14 = v60;
    id v15 = v13;
  }
  else
  {
    [(EDMessageChangeManager *)self persistNewMessages:v43 mailboxURL:v42 oldMessagesByNewMessage:v44 fromSyncing:1];
    id v15 = [v44 allKeys];
  }
  id v16 = [(EDMessageChangeManager *)self markAllWorkQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__EDMessageChangeManager_reflectNewMessages_mailboxURL___block_invoke_7;
  block[3] = &unk_1E6BFFAF0;
  void block[4] = self;
  id v17 = v15;
  id v55 = v17;
  dispatch_async(v16, block);

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v17;
  uint64_t v18 = [obj countByEnumeratingWithState:&v50 objects:v70 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v51 != v19) {
          objc_enumerationMutation(obj);
        }
        id v21 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        id v22 = (void *)MEMORY[0x1E0190280]();
        id v23 = [(EDMessageChangeManager *)self readLaterPersistence];
        id v49 = 0;
        uint64_t v24 = [v23 cloudStorageReadLaterDateForMessage:v21 displayDate:&v49];
        unint64_t v25 = (unint64_t)v49;

        if (v24 | v25)
        {
          id v26 = EDRemindMeLog();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            id v27 = [v21 messageIDHeaderHash];
            uint64_t v28 = [v27 int64Value];
            *(_DWORD *)buf = 134218498;
            uint64_t v65 = v28;
            __int16 v66 = 2114;
            uint64_t v67 = v24;
            __int16 v68 = 2114;
            unint64_t v69 = v25;
            _os_log_impl(&dword_1DB39C000, v26, OS_LOG_TYPE_DEFAULT, "Applying to downloaded message: %lld readLaterDate:%{public}@ displayDate:%{public}@", buf, 0x20u);
          }
          if (v24)
          {
            char v63 = v21;
            id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
            id v30 = [(EDMessageChangeManager *)self _applyReadLaterDate:v24 displayDate:v25 toMessages:v29 changeIsRemote:1];
          }
          else
          {
            if (!v25) {
              goto LABEL_21;
            }
            id v29 = [(EDMessageChangeManager *)self messagePersistence];
            uint64_t v62 = v21;
            BOOL v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
            [v29 updateDisplayDateForPersistedMessages:v31 displayDate:v25 changeIsRemote:1];
          }
        }
LABEL_21:
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v50 objects:v70 count:16];
    }
    while (v18);
  }

  if ([v44 count] && objc_msgSend(obj, "count"))
  {
    [(EDMessageChangeManager *)self willStartPersistenceDidAddMessages:v44];
    uint64_t v32 = [(EDMessageChangeManager *)self hookResponder];
    [v32 persistenceDidAddMessages:obj generationWindow:v41];

    [(EDMessageChangeManager *)self didFinishPersistenceDidAddMessages:v44];
    [(EDMessageChangeManager *)self didReflectNewMessages:obj];
    char v33 = [(EDMessageChangeManager *)self hookResponder];
    [v33 persistenceDidAddNewMessages:v44];
  }
  id v34 = [(EDMessageChangeManager *)self hookResponder];
  [v34 persistenceDidFinishUpdates];

  if ([MEMORY[0x1E4F602E0] preferenceEnabled:55])
  {
    dispatch_time_t v35 = dispatch_time(0, 15000000000);
    uint64_t v36 = [(EDMessageChangeManager *)self markAllWorkQueue];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __56__EDMessageChangeManager_reflectNewMessages_mailboxURL___block_invoke_129;
    v46[3] = &unk_1E6BFFAF0;
    id v47 = obj;
    uint64_t v48 = self;
    dispatch_after(v35, v36, v46);
  }
  id v37 = v55;
  id v38 = obj;

  return v38;
}

void __56__EDMessageChangeManager_reflectNewMessages_mailboxURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) database];
  id v5 = [NSString stringWithUTF8String:"-[EDMessageChangeManager reflectNewMessages:mailboxURL:]_block_invoke"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__EDMessageChangeManager_reflectNewMessages_mailboxURL___block_invoke_2;
  v11[3] = &unk_1E6C02668;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v12 = v6;
  uint64_t v13 = v7;
  id v8 = v3;
  id v14 = v8;
  id v15 = *(id *)(a1 + 48);
  id v16 = *(id *)(a1 + 56);
  long long v10 = *(_OWORD *)(a1 + 64);
  id v9 = (id)v10;
  long long v17 = v10;
  objc_msgSend(v4, "__performWriteWithCaller:usingBlock:", v5, v11);
}

uint64_t __56__EDMessageChangeManager_reflectNewMessages_mailboxURL___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v28 = a2;
  id v30 = objc_opt_new();
  uint64_t v34 = a1;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v28, "transactionGeneration"));
  LODWORD(a1) = [*(id *)(v34 + 40) persistNewMessages:*(void *)(v34 + 48) mailboxURL:*(void *)(v34 + 56) oldMessagesByNewMessage:v30 fromSyncing:1];
  [*(id *)(v34 + 64) addEntriesFromDictionary:v30];
  if (a1 && _os_feature_enabled_impl())
  {
    id v3 = objc_msgSend(*(id *)(v34 + 40), "bimiManager", v28);
    id v4 = [v3 processBIMIHeadersForMessages:*(void *)(v34 + 48)];

    id v5 = objc_alloc(MEMORY[0x1E4F1CA80]);
    id v6 = [v4 allValues];
    uint64_t v7 = objc_msgSend(v6, "ef_mapSelector:", sel_second);
    id v8 = objc_msgSend(v7, "ef_flatten");
    id v9 = (void *)[v5 initWithArray:v8];

    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __56__EDMessageChangeManager_reflectNewMessages_mailboxURL___block_invoke_3;
    v46[3] = &unk_1E6C025C8;
    id v11 = v9;
    id v47 = v11;
    id v12 = v10;
    id v48 = v12;
    [v30 enumerateKeysAndObjectsUsingBlock:v46];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __56__EDMessageChangeManager_reflectNewMessages_mailboxURL___block_invoke_4;
    v43[3] = &unk_1E6C02618;
    id v13 = v12;
    uint64_t v14 = *(void *)(v34 + 40);
    id v44 = v13;
    uint64_t v45 = v14;
    [v4 enumerateKeysAndObjectsUsingBlock:v43];
  }
  id v15 = objc_msgSend(*(id *)(v34 + 40), "serverMessagePersistenceFactory", v28);
  dispatch_time_t v35 = [v15 serverMessagePersistenceForMailboxURL:*(void *)(v34 + 56)];

  char v33 = objc_opt_new();
  BOOL v31 = objc_opt_new();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = [v30 allKeys];
  uint64_t v16 = [obj countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v40;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v40 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void **)(*((void *)&v39 + 1) + 8 * v18);
        id v20 = objc_alloc(MEMORY[0x1E4F608D8]);
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __56__EDMessageChangeManager_reflectNewMessages_mailboxURL___block_invoke_6;
        v37[3] = &unk_1E6C02640;
        v37[4] = v19;
        id v21 = v35;
        id v38 = v21;
        id v22 = (void *)[v20 initWithIMAPServerMessageBuilder:v37];
        __int16 v36 = 0;
        [v21 addServerMessage:v22 invalidMessage:(char *)&v36 + 1 duplicateRemoteID:&v36];
        if (HIBYTE(v36))
        {
          id v26 = [MEMORY[0x1E4F28B00] currentHandler];
          [v26 handleFailureInMethod:*(void *)(v34 + 80) object:*(void *)(v34 + 40) file:@"EDMessageChangeManager.m" lineNumber:889 description:@"Got foreign key constraint"];
        }
        if ((_BYTE)v36)
        {
          id v23 = *(void **)(v34 + 40);
          uint64_t v24 = [v19 persistentID];
          unint64_t v25 = objc_msgSend(v23, "messageForDatabaseID:", objc_msgSend(v24, "longLongValue"));

          [v33 addObject:v25];
        }
        else
        {
          [v31 addObject:v19];
        }

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [obj countByEnumeratingWithState:&v39 objects:v49 count:16];
    }
    while (v16);
  }

  if ([v33 count]) {
    [*(id *)(v34 + 40) deletePersistedMessages:v33];
  }
  if ([v31 count]) {
    [*(id *)(v34 + 72) addObjectsFromArray:v31];
  }

  return 1;
}

void __56__EDMessageChangeManager_reflectNewMessages_mailboxURL___block_invoke_3(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  id v7 = a3;
  if ([*(id *)(a1 + 32) containsObject:v7])
  {
    [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v7];
    [*(id *)(a1 + 32) removeObject:v7];
    if (![*(id *)(a1 + 32) count]) {
      *a4 = 1;
    }
  }
}

void __56__EDMessageChangeManager_reflectNewMessages_mailboxURL___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 second];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__EDMessageChangeManager_reflectNewMessages_mailboxURL___block_invoke_5;
  v12[3] = &unk_1E6C025F0;
  id v13 = *(id *)(a1 + 32);
  id v8 = objc_msgSend(v7, "ef_compactMap:", v12);

  id v9 = [*(id *)(a1 + 40) messagePersistence];
  uint64_t v10 = [v5 longLongValue];
  id v11 = [v6 first];
  [v9 setBrandIndicatorDatabaseID:v10 location:v11 forMessages:v8];
}

id __56__EDMessageChangeManager_reflectNewMessages_mailboxURL___block_invoke_5(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];

  return v2;
}

void __56__EDMessageChangeManager_reflectNewMessages_mailboxURL___block_invoke_6(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [*(id *)(a1 + 32) remoteID];
  [v7 setImapUID:uidFromString(v3)];

  id v4 = [*(id *)(a1 + 32) persistentID];
  [v7 setMessagePersistentID:v4];

  id v5 = [*(id *)(a1 + 32) flags];
  [v7 setServerFlags:v5];

  if ([*(id *)(a1 + 40) supportsLabels])
  {
    id v6 = [*(id *)(a1 + 32) labels];
    [v7 setLabels:v6];
  }
}

uint64_t __56__EDMessageChangeManager_reflectNewMessages_mailboxURL___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearFollowUpsFromThreadsForMessages:*(void *)(a1 + 40)];
}

void __56__EDMessageChangeManager_reflectNewMessages_mailboxURL___block_invoke_129(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v1 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v1)
  {
    uint64_t v2 = *(void *)v26;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v26 != v2) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v25 + 1) + 8 * v3);
        id v5 = objc_alloc(MEMORY[0x1E4F28B18]);
        id v6 = NSString;
        id v7 = [v4 subject];
        id v8 = [v7 subjectString];
        id v9 = [v6 stringWithFormat:@"Top line summary for %@", v8];
        uint64_t v10 = (void *)[v5 initWithString:v9];

        id v11 = objc_alloc(MEMORY[0x1E4F28B18]);
        id v12 = NSString;
        id v13 = [v4 subject];
        uint64_t v14 = [v13 subjectString];
        id v15 = [v12 stringWithFormat:@"Synopsis for %@", v14];
        uint64_t v16 = (void *)[v11 initWithString:v15];

        uint64_t v17 = [v4 subject];
        uint64_t v18 = [v17 subjectString];
        uint64_t v19 = [v18 hasPrefix:@"Urgent"];

        id v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F60338]), "initWithGlobalMessageID:", objc_msgSend(v4, "globalMessageID"));
        id v21 = (void *)[objc_alloc(MEMORY[0x1E4F602A8]) initWithTopLine:v10 synopsis:v16 urgent:v19 messageItemID:v20];
        id v22 = [*(id *)(a1 + 40) messagePersistence];
        [v22 setGeneratedSummary:v21 forPersistedMessage:v4];

        ++v3;
      }
      while (v1 != v3);
      uint64_t v1 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v1);
  }
}

- (void)reflectDeletedMessages:(id)a3
{
  id v5 = a3;
  id v6 = [v5 firstObject];
  id v7 = [v6 mailbox];
  id v8 = [v7 URL];
  BOOL v9 = [(EDMessageChangeManager *)self _needToStoreServerMessagesForMailboxURL:v8];

  if (v9)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"EDMessageChangeManager.m" lineNumber:975 description:@"Calling reflectFlagChanges:forMessages: on IMAP"];
  }
  uint64_t v10 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  id v11 = [(EDMessageChangeManager *)self hookResponder];
  [v11 persistenceWillBeginUpdates];

  id v12 = [(EDMessageChangeManager *)self database];
  id v13 = [NSString stringWithUTF8String:"-[EDMessageChangeManager reflectDeletedMessages:]"];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __49__EDMessageChangeManager_reflectDeletedMessages___block_invoke;
  v19[3] = &unk_1E6BFF4F0;
  uint64_t v14 = v10;
  id v20 = v14;
  id v21 = self;
  id v15 = v5;
  id v22 = v15;
  objc_msgSend(v12, "__performWriteWithCaller:usingBlock:", v13, v19);

  uint64_t v16 = [(EDMessageChangeManager *)self hookResponder];
  [v16 persistenceDidDeleteMessages:v15 generationWindow:v14];

  uint64_t v17 = [(EDMessageChangeManager *)self hookResponder];
  [v17 persistenceDidFinishUpdates];
}

uint64_t __49__EDMessageChangeManager_reflectDeletedMessages___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  [*(id *)(a1 + 40) deletePersistedMessages:*(void *)(a1 + 48)];

  return 1;
}

- (void)reflectDeletedMessagesWithRemoteIDs:(id)a3 mailboxURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  BOOL v9 = [(EDMessageChangeManager *)self hookResponder];
  [v9 persistenceWillBeginUpdates];

  BOOL v10 = [(EDMessageChangeManager *)self _needToStoreServerMessagesForMailboxURL:v7];
  BOOL v11 = v10;
  if (v10)
  {
    id v12 = [(EDMessageChangeManager *)self serverMessagePersistenceFactory];
    id v13 = [v12 serverMessagePersistenceForMailboxURL:v7];
  }
  else
  {
    id v13 = 0;
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __73__EDMessageChangeManager_reflectDeletedMessagesWithRemoteIDs_mailboxURL___block_invoke;
  v18[3] = &unk_1E6C026E0;
  void v18[4] = self;
  id v14 = v7;
  id v19 = v14;
  id v15 = v8;
  id v20 = v15;
  BOOL v22 = v11;
  id v16 = v13;
  id v21 = v16;
  objc_msgSend(v6, "ef_enumerateObjectsInBatchesOfSize:block:", 25, v18);
  uint64_t v17 = [(EDMessageChangeManager *)self hookResponder];
  [v17 persistenceDidFinishUpdates];
}

void __73__EDMessageChangeManager_reflectDeletedMessagesWithRemoteIDs_mailboxURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__19;
  id v20 = __Block_byref_object_dispose__19;
  id v21 = 0;
  id v4 = [*(id *)(a1 + 32) database];
  id v5 = [NSString stringWithUTF8String:"-[EDMessageChangeManager reflectDeletedMessagesWithRemoteIDs:mailboxURL:]_block_invoke"];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__EDMessageChangeManager_reflectDeletedMessagesWithRemoteIDs_mailboxURL___block_invoke_2;
  v9[3] = &unk_1E6C026B8;
  uint64_t v6 = *(void *)(a1 + 32);
  id v14 = &v16;
  v9[4] = v6;
  id v7 = v3;
  id v10 = v7;
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  char v15 = *(unsigned char *)(a1 + 64);
  id v13 = *(id *)(a1 + 56);
  objc_msgSend(v4, "__performWriteWithCaller:usingBlock:", v5, v9);

  id v8 = [*(id *)(a1 + 32) hookResponder];
  [v8 persistenceDidDeleteMessages:v17[5] generationWindow:*(void *)(a1 + 48)];

  _Block_object_dispose(&v16, 8);
}

uint64_t __73__EDMessageChangeManager_reflectDeletedMessagesWithRemoteIDs_mailboxURL___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) messagesForRemoteIDs:*(void *)(a1 + 40) mailboxURL:*(void *)(a1 + 48)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(a1 + 56), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  [*(id *)(a1 + 32) deletePersistedMessages:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  if (*(unsigned char *)(a1 + 80)) {
    [*(id *)(a1 + 64) deleteServerMessagesWithRemoteIDs:*(void *)(a1 + 40)];
  }

  return 1;
}

- (void)reflectAllMessagesDeletedInMailboxURL:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  if (!-[EDMessageChangeManager _needToStoreServerMessagesForMailboxURL:](self, "_needToStoreServerMessagesForMailboxURL:"))
  {
    long long v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2 object:self file:@"EDMessageChangeManager.m" lineNumber:1022 description:@"Reflect all deleted server messages for a data source without server messages"];
  }
  id v29 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  uint64_t v5 = [(EDMessageChangeManager *)self hookResponder];
  [v5 persistenceWillBeginUpdates];

  uint64_t v6 = [(EDMessageChangeManager *)self serverMessagePersistenceFactory];
  uint64_t v30 = [v6 serverMessagePersistenceForMailboxURL:v28];

  while (1)
  {
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 1, 0xFFFFFFFFLL);
    id v8 = [v30 serverMessagesForIMAPUIDs:v7 limit:25 returnLastEntries:0];

    if (![v8 count]) {
      break;
    }
    BOOL v9 = objc_opt_new();
    id v10 = objc_opt_new();
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v38 != v13) {
            objc_enumerationMutation(v11);
          }
          char v15 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v16 = [v15 remoteID];
          [v9 addObject:v16];

          uint64_t v17 = [v15 messagePersistentID];

          if (v17)
          {
            uint64_t v18 = [v15 messagePersistentID];
            id v19 = -[EDMessageChangeManager messageForDatabaseID:](self, "messageForDatabaseID:", [v18 longLongValue]);
            [v10 addObject:v19];
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v12);
    }

    id v20 = [(EDMessageChangeManager *)self database];
    id v21 = [NSString stringWithUTF8String:"-[EDMessageChangeManager reflectAllMessagesDeletedInMailboxURL:]"];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __64__EDMessageChangeManager_reflectAllMessagesDeletedInMailboxURL___block_invoke;
    v31[3] = &unk_1E6C02708;
    BOOL v22 = v29;
    uint64_t v32 = v22;
    id v33 = v30;
    id v23 = v9;
    id v34 = v23;
    dispatch_time_t v35 = self;
    id v24 = v10;
    id v36 = v24;
    objc_msgSend(v20, "__performWriteWithCaller:usingBlock:", v21, v31);

    long long v25 = [(EDMessageChangeManager *)self hookResponder];
    [v25 persistenceDidDeleteMessages:v24 generationWindow:v22];
  }
  long long v26 = [(EDMessageChangeManager *)self hookResponder];
  [v26 persistenceDidFinishUpdates];
}

uint64_t __64__EDMessageChangeManager_reflectAllMessagesDeletedInMailboxURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  [*(id *)(a1 + 40) deleteServerMessagesWithRemoteIDs:*(void *)(a1 + 48)];
  [*(id *)(a1 + 56) deletePersistedMessages:*(void *)(a1 + 64)];

  return 1;
}

- (void)reflectDeletedAllClearedMessagesInMailboxURL:(id)a3
{
  id v20 = a3;
  if (-[EDMessageChangeManager _needToStoreServerMessagesForMailboxURL:](self, "_needToStoreServerMessagesForMailboxURL:"))
  {
    id v21 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
    uint64_t v4 = [(EDMessageChangeManager *)self hookResponder];
    [v4 persistenceWillBeginUpdates];

    uint64_t v5 = [(EDMessageChangeManager *)self serverMessagePersistenceFactory];
    uint64_t v6 = [v5 serverMessagePersistenceForMailboxURL:v20];

    id v7 = (void *)MEMORY[0x1E4F1CA48];
    id v8 = [v6 deleteAllClearedUIDMessages];
    BOOL v9 = [v7 arrayWithArray:v8];

    while ([v9 count])
    {
      unint64_t v10 = [v9 count];
      if (v10 >= 0xC8) {
        uint64_t v11 = 200;
      }
      else {
        uint64_t v11 = v10;
      }
      uint64_t v12 = objc_msgSend(v9, "subarrayWithRange:", 0, v11);
      objc_msgSend(v9, "removeObjectsInRange:", 0, v11);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __71__EDMessageChangeManager_reflectDeletedAllClearedMessagesInMailboxURL___block_invoke;
      v26[3] = &unk_1E6C02730;
      v26[4] = self;
      uint64_t v13 = objc_msgSend(v12, "ef_compactMap:", v26);
      id v14 = [(EDMessageChangeManager *)self database];
      char v15 = [NSString stringWithUTF8String:"-[EDMessageChangeManager reflectDeletedAllClearedMessagesInMailboxURL:]"];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __71__EDMessageChangeManager_reflectDeletedAllClearedMessagesInMailboxURL___block_invoke_2;
      v22[3] = &unk_1E6BFF4F0;
      uint64_t v16 = v21;
      id v23 = v16;
      id v24 = self;
      id v17 = v13;
      id v25 = v17;
      objc_msgSend(v14, "__performWriteWithCaller:usingBlock:", v15, v22);

      uint64_t v18 = [(EDMessageChangeManager *)self hookResponder];
      [v18 persistenceDidDeleteMessages:v17 generationWindow:v16];
    }
    id v19 = [(EDMessageChangeManager *)self hookResponder];
    [v19 persistenceDidFinishUpdates];
  }
}

id __71__EDMessageChangeManager_reflectDeletedAllClearedMessagesInMailboxURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 longLongValue];
  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) messageForDatabaseID:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __71__EDMessageChangeManager_reflectDeletedAllClearedMessagesInMailboxURL___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  [*(id *)(a1 + 40) deletePersistedMessages:*(void *)(a1 + 48)];

  return 1;
}

- (void)reflectFlagChanges:(id)a3 forMessages:(id)a4
{
  id v13 = a3;
  id v7 = a4;
  id v8 = [v7 firstObject];
  BOOL v9 = [v8 mailbox];
  unint64_t v10 = [v9 URL];
  BOOL v11 = [(EDMessageChangeManager *)self _needToStoreServerMessagesForMailboxURL:v10];

  if (v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"EDMessageChangeManager.m" lineNumber:1092 description:@"Calling reflectFlagChanges:forMessages: on IMAP"];
  }
  [(EDMessageChangeManager *)self _reflectFlagChanges:v13 messages:v7 remoteIDs:0 mailboxURL:0];
}

- (void)reflectFlagChanges:(id)a3 forMessagesWithRemoteIDs:(id)a4 mailboxURL:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  unint64_t v10 = [(EDMessageChangeManager *)self messagesForRemoteIDs:v8 mailboxURL:v9];
  [(EDMessageChangeManager *)self _reflectFlagChanges:v11 messages:v10 remoteIDs:v8 mailboxURL:v9];
}

- (void)_reflectFlagChanges:(id)a3 messages:(id)a4 remoteIDs:(id)a5 mailboxURL:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  char v15 = [(EDMessageChangeManager *)self hookResponder];
  [v15 persistenceWillBeginUpdates];

  if ([v11 count])
  {
    uint64_t v16 = [(EDMessageChangeManager *)self hookResponder];
    [v16 persistenceWillChangeFlags:v10 messages:v11];
  }
  uint64_t v34 = 0;
  dispatch_time_t v35 = &v34;
  uint64_t v36 = 0x3032000000;
  long long v37 = __Block_byref_object_copy__19;
  long long v38 = __Block_byref_object_dispose__19;
  id v39 = 0;
  id v17 = [(EDMessageChangeManager *)self database];
  uint64_t v18 = [NSString stringWithUTF8String:"-[EDMessageChangeManager _reflectFlagChanges:messages:remoteIDs:mailboxURL:]"];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __76__EDMessageChangeManager__reflectFlagChanges_messages_remoteIDs_mailboxURL___block_invoke;
  v26[3] = &unk_1E6C02758;
  id v19 = v14;
  long long v27 = v19;
  id v28 = self;
  id v20 = v13;
  id v29 = v20;
  id v21 = v12;
  id v30 = v21;
  id v22 = v10;
  id v31 = v22;
  id v23 = v11;
  id v32 = v23;
  id v33 = &v34;
  objc_msgSend(v17, "__performWriteWithCaller:usingBlock:", v18, v26);

  if ([v23 count])
  {
    id v24 = [(EDMessageChangeManager *)self hookResponder];
    [v24 persistenceDidChangeFlags:v22 messages:v35[5] generationWindow:v19];
  }
  id v25 = [(EDMessageChangeManager *)self hookResponder];
  [v25 persistenceDidFinishUpdates];

  _Block_object_dispose(&v34, 8);
}

uint64_t __76__EDMessageChangeManager__reflectFlagChanges_messages_remoteIDs_mailboxURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  if ([*(id *)(a1 + 40) _needToStoreServerMessagesForMailboxURL:*(void *)(a1 + 48)]
    && [*(id *)(a1 + 56) count])
  {
    uint64_t v4 = [*(id *)(a1 + 40) serverMessagePersistenceFactory];
    uint64_t v5 = [v4 serverMessagePersistenceForMailboxURL:*(void *)(a1 + 48)];

    [v5 applyFlagChange:*(void *)(a1 + 64) toMessagesWithRemoteIDs:*(void *)(a1 + 56)];
  }
  if ([*(id *)(a1 + 72) count])
  {
    uint64_t v6 = [*(id *)(a1 + 40) applyFlagChange:*(void *)(a1 + 64) toMessagesInDatabase:*(void *)(a1 + 72)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 80) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    if ([*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) count])
    {
      id v9 = [*(id *)(a1 + 40) hookResponder];
      [v9 persistenceIsChangingFlags:*(void *)(a1 + 64) messages:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) generationWindow:*(void *)(a1 + 32)];
    }
  }

  return 1;
}

- (void)reflectSortedFlagChanges:(id)a3 mailboxURL:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v33 = a4;
  uint64_t v5 = [v29 count];
  if (v33 && v5)
  {
    id v28 = v29;
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v28, "count"));
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = v28;
    uint64_t v7 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v42 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          id v11 = [v10 first];
          uint64_t v12 = [v11 unsignedIntegerValue];

          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          v40[2] = __groupFlagChangesByChange_block_invoke;
          v40[3] = &unk_1E6C02950;
          v40[4] = v10;
          uint64_t v13 = [v6 indexOfObjectPassingTest:v40];
          if (v13 == 0x7FFFFFFFFFFFFFFFLL)
          {
            id v14 = (void *)MEMORY[0x1E4F60DF0];
            char v15 = [MEMORY[0x1E4F28E60] indexSetWithIndex:v12];
            uint64_t v16 = [v10 second];
            id v17 = [v14 pairWithFirst:v15 second:v16];
            [v6 addObject:v17];
          }
          else
          {
            char v15 = [v6 objectAtIndexedSubscript:v13];
            uint64_t v16 = [v15 first];
            [v16 addIndex:v12];
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v7);
    }

    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obja = v6;
    uint64_t v18 = [obja countByEnumeratingWithState:&v36 objects:v45 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v37 != v19) {
            objc_enumerationMutation(obja);
          }
          id v21 = *(void **)(*((void *)&v36 + 1) + 8 * j);
          id v22 = (void *)MEMORY[0x1E4F1CA48];
          id v23 = [v21 first];
          id v24 = objc_msgSend(v22, "arrayWithCapacity:", objc_msgSend(v23, "count"));

          id v25 = [v21 first];
          v34[0] = MEMORY[0x1E4F143A8];
          v34[1] = 3221225472;
          v34[2] = __62__EDMessageChangeManager_reflectSortedFlagChanges_mailboxURL___block_invoke;
          v34[3] = &unk_1E6C02780;
          id v26 = v24;
          id v35 = v26;
          [v25 enumerateIndexesUsingBlock:v34];

          long long v27 = [v21 second];
          [(EDMessageChangeManager *)self reflectFlagChanges:v27 forMessagesWithRemoteIDs:v26 mailboxURL:v33];
        }
        uint64_t v18 = [obja countByEnumeratingWithState:&v36 objects:v45 count:16];
      }
      while (v18);
    }
  }
}

void __62__EDMessageChangeManager_reflectSortedFlagChanges_mailboxURL___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  objc_msgSend(NSString, "stringWithFormat:", @"%llu", a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");
}

- (void)reflectAddedLabels:(id)a3 removedLabels:(id)a4 forMessagesWithRemoteIDs:(id)a5 mailboxURL:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v24 = a5;
  id v12 = a6;
  uint64_t v13 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  id v14 = [(EDMessageChangeManager *)self hookResponder];
  [v14 persistenceWillBeginUpdates];

  LOBYTE(a5) = [(EDMessageChangeManager *)self _needToStoreServerMessagesForMailboxURL:v12];
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000;
  long long v37 = __Block_byref_object_copy__19;
  long long v38 = __Block_byref_object_dispose__19;
  id v39 = 0;
  char v15 = [(EDMessageChangeManager *)self database];
  uint64_t v16 = [NSString stringWithUTF8String:"-[EDMessageChangeManager reflectAddedLabels:removedLabels:forMessagesWithRemoteIDs:mailboxURL:]"];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __95__EDMessageChangeManager_reflectAddedLabels_removedLabels_forMessagesWithRemoteIDs_mailboxURL___block_invoke;
  v25[3] = &unk_1E6C027A8;
  id v17 = v13;
  char v33 = (char)a5;
  id v26 = v17;
  long long v27 = self;
  id v18 = v12;
  id v28 = v18;
  id v19 = v10;
  id v29 = v19;
  id v20 = v11;
  id v30 = v20;
  id v21 = v24;
  id v31 = v21;
  id v32 = &v34;
  objc_msgSend(v15, "__performWriteWithCaller:usingBlock:", v16, v25);

  id v22 = [(EDMessageChangeManager *)self hookResponder];
  [v22 persistenceDidAddLabels:v19 removeLabels:v20 messages:v35[5] generationWindow:v17];

  id v23 = [(EDMessageChangeManager *)self hookResponder];
  [v23 persistenceDidFinishUpdates];

  _Block_object_dispose(&v34, 8);
}

uint64_t __95__EDMessageChangeManager_reflectAddedLabels_removedLabels_forMessagesWithRemoteIDs_mailboxURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  if (*(unsigned char *)(a1 + 88))
  {
    uint64_t v4 = [*(id *)(a1 + 40) serverMessagePersistenceFactory];
    uint64_t v5 = [v4 serverMessagePersistenceForMailboxURL:*(void *)(a1 + 48)];

    [v5 addLabels:*(void *)(a1 + 56) removeLabels:*(void *)(a1 + 64) toMessagesWithRemoteIDs:*(void *)(a1 + 72)];
  }
  uint64_t v6 = [*(id *)(a1 + 40) messagesForRemoteIDs:*(void *)(a1 + 72) mailboxURL:*(void *)(a1 + 48)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 80) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id v9 = (id)[*(id *)(a1 + 40) addLabels:*(void *)(a1 + 56) removeLabels:*(void *)(a1 + 64) toMessagesInDatabase:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
  return 1;
}

- (BOOL)persistResults:(id)a3 forAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(EDMessageChangeManager *)self hookResponder];
  [v8 persistenceWillBeginUpdates];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(EDMessageChangeManager *)self _persistResults:v6 forFlagChangeAction:v7];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_10;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_7;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_10:
          id v12 = [(EDMessageChangeManager *)self localActionPersistence];
          uint64_t v13 = [v7 persistentID];
          objc_msgSend(v12, "removeMessageAction:", objc_msgSend(v13, "databaseID"));

          char v9 = 0;
        }
        else
        {
          id v12 = [(EDMessageChangeManager *)self localActionPersistence];
          char v9 = [v12 updateTransferUndownloadedMessageAction:v7 withResults:v6];
        }

        goto LABEL_8;
      }
      [(EDMessageChangeManager *)self _persistResults:v6 forLabelChangeAction:v7];
    }
LABEL_7:
    char v9 = 0;
    goto LABEL_8;
  }
  char v9 = [(EDMessageChangeManager *)self _persistResults:v6 forTransferAction:v7];
LABEL_8:
  id v10 = [(EDMessageChangeManager *)self hookResponder];
  [v10 persistenceDidFinishUpdates];

  return v9;
}

- (void)deleteLocalMessageActionsWithIDs:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(EDMessageChangeManager *)self hookResponder];
  [v4 persistenceWillBeginUpdates];

  uint64_t v5 = [(EDMessageChangeManager *)self localActionPersistence];
  [v5 removeMessageActions:v7];

  id v6 = [(EDMessageChangeManager *)self hookResponder];
  [v6 persistenceDidFinishUpdates];
}

- (BOOL)_persistResults:(id)a3 forLabelChangeAction:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 remoteIDs];
  char v9 = [v8 allObjects];
  id v10 = (void *)[v9 mutableCopy];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = [v7 messages];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v28;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v11);
        }
        char v15 = [*(id *)(*((void *)&v27 + 1) + 8 * v14) remoteID];
        if ([v15 length]) {
          [v10 addObject:v15];
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v12);
  }

  uint64_t v16 = [(EDMessageChangeManager *)self database];
  id v17 = [NSString stringWithUTF8String:"-[EDMessageChangeManager _persistResults:forLabelChangeAction:]"];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __63__EDMessageChangeManager__persistResults_forLabelChangeAction___block_invoke;
  v22[3] = &unk_1E6C027D0;
  id v18 = v6;
  id v23 = v18;
  id v24 = self;
  id v19 = v7;
  id v25 = v19;
  id v20 = v10;
  id v26 = v20;
  objc_msgSend(v16, "__performWriteWithCaller:usingBlock:", v17, v22);

  return 0;
}

uint64_t __63__EDMessageChangeManager__persistResults_forLabelChangeAction___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) error];

  id v3 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v5 = [*(id *)(a1 + 48) mailboxURL];
    [v3 _resetLocalLabelsToServerLabelsForMessagesWithRemoteIDs:v4 mailboxURL:v5];
  }
  else
  {
    id v6 = [*(id *)(a1 + 40) serverMessagePersistenceFactory];
    id v7 = [*(id *)(a1 + 48) mailboxURL];
    uint64_t v5 = [v6 serverMessagePersistenceForMailboxURL:v7];

    uint64_t v8 = [*(id *)(a1 + 48) labelsToAdd];
    char v9 = [*(id *)(a1 + 48) labelsToRemove];
    [v5 addLabels:v8 removeLabels:v9 toMessagesWithRemoteIDs:*(void *)(a1 + 56)];
  }
  id v10 = [*(id *)(a1 + 40) localActionPersistence];
  id v11 = [*(id *)(a1 + 48) persistentID];
  objc_msgSend(v10, "removeMessageAction:", objc_msgSend(v11, "databaseID"));

  return 1;
}

- (void)_resetLocalLabelsToServerLabelsForMessagesWithRemoteIDs:(id)a3 mailboxURL:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v22 = a4;
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v25 = self;
  id v6 = [(EDMessageChangeManager *)self serverMessagePersistenceFactory];
  id v7 = [v6 serverMessagePersistenceForMailboxURL:v22];

  id v20 = v7;
  [v7 serverMessagesForRemoteIDs:v21];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v12 = [v11 messagePersistentID];
        uint64_t v13 = -[EDMessageChangeManager messageForDatabaseID:](v25, "messageForDatabaseID:", [v12 longLongValue]);

        if (v13)
        {
          uint64_t v14 = [v13 labels];
          char v15 = [v11 labels];
          uint64_t v16 = [MEMORY[0x1E4F1CA80] setWithSet:v15];
          [v16 minusSet:v14];
          id v17 = [MEMORY[0x1E4F1CA80] setWithSet:v14];
          [v17 minusSet:v15];
          v31[0] = MEMORY[0x1E4F1CC38];
          v31[1] = MEMORY[0x1E4F1CC28];
          v32[0] = v16;
          v32[1] = v17;
          id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
          id v19 = [v24 objectForKeyedSubscript:v18];
          if (!v19)
          {
            id v19 = objc_opt_new();
            [v24 setObject:v19 forKeyedSubscript:v18];
          }
          [v19 addObject:v13];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v8);
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __93__EDMessageChangeManager__resetLocalLabelsToServerLabelsForMessagesWithRemoteIDs_mailboxURL___block_invoke;
  v26[3] = &unk_1E6C027F8;
  void v26[4] = v25;
  [v24 enumerateKeysAndObjectsUsingBlock:v26];
}

void __93__EDMessageChangeManager__resetLocalLabelsToServerLabelsForMessagesWithRemoteIDs_mailboxURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v7 = [v10 objectForKeyedSubscript:MEMORY[0x1E4F1CC38]];
  uint64_t v8 = [v10 objectForKeyedSubscript:MEMORY[0x1E4F1CC28]];
  id v9 = (id)[v6 addLabels:v7 removeLabels:v8 toMessagesInDatabase:v5];
}

- (BOOL)_persistResults:(id)a3 forFlagChangeAction:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v24 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v8 = [(EDMessageChangeManager *)self _persistFlagChangeResults:v6 forFlagChangeAction:v7];
  }
  else
  {
    id v9 = [v7 remoteIDs];
    id v10 = [v9 allObjects];
    id v11 = (void *)[v10 mutableCopy];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v12 = [v7 messages];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          id v17 = [v16 remoteID];
          uint64_t v18 = [v17 length];

          if (v18)
          {
            id v19 = [v16 remoteID];
            [v11 addObject:v19];
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v13);
    }

    id v20 = [(EDMessageChangeManager *)self database];
    id v21 = [NSString stringWithUTF8String:"-[EDMessageChangeManager _persistResults:forFlagChangeAction:]"];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __62__EDMessageChangeManager__persistResults_forFlagChangeAction___block_invoke;
    v25[3] = &unk_1E6C027D0;
    id v26 = v24;
    long long v27 = self;
    id v28 = v7;
    id v22 = v11;
    id v29 = v22;
    objc_msgSend(v20, "__performWriteWithCaller:usingBlock:", v21, v25);

    BOOL v8 = 0;
  }

  return v8;
}

uint64_t __62__EDMessageChangeManager__persistResults_forFlagChangeAction___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) error];

  id v3 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v5 = [*(id *)(a1 + 48) mailboxURL];
    [v3 _resetLocalFlagsToServerFlagsForMessagesWithRemoteIDs:v4 mailboxURL:v5];
    id v6 = (void *)v5;
  }
  else
  {
    id v7 = [*(id *)(a1 + 40) serverMessagePersistenceFactory];
    BOOL v8 = [*(id *)(a1 + 48) mailboxURL];
    id v6 = [v7 serverMessagePersistenceForMailboxURL:v8];

    id v9 = [*(id *)(a1 + 48) flagChange];
    [v6 applyFlagChange:v9 toMessagesWithRemoteIDs:*(void *)(a1 + 56)];
  }
  id v10 = [*(id *)(a1 + 40) localActionPersistence];
  id v11 = [*(id *)(a1 + 48) persistentID];
  objc_msgSend(v10, "removeMessageAction:", objc_msgSend(v11, "databaseID"));

  return 1;
}

- (BOOL)_persistFlagChangeResults:(id)a3 forFlagChangeAction:(id)a4
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v62 = a3;
  id v63 = a4;
  uint64_t v5 = [MEMORY[0x1E4F28E60] indexSet];
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v6 = [v63 remoteIDs];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v84 objects:v94 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v85;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v85 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v84 + 1) + 8 * i);
        unsigned int v11 = uidFromString(v10);
        if (v11 - 1 > 0xFFFFFFFD)
        {
          uint64_t v12 = +[EDMessageChangeManager log];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)v90 = v10;
            _os_log_error_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_ERROR, "Invalid UID (%{public}@) in flag change action.", buf, 0xCu);
          }
        }
        else
        {
          [v5 addIndex:v11];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v84 objects:v94 count:16];
    }
    while (v7);
  }

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  uint64_t v13 = [v63 messages];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v80 objects:v93 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v81;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v81 != v15) {
          objc_enumerationMutation(v13);
        }
        id v17 = *(void **)(*((void *)&v80 + 1) + 8 * j);
        uint64_t v18 = [v17 remoteID];
        unsigned int v19 = uidFromString(v18);

        if (v19 - 1 > 0xFFFFFFFD)
        {
          id v20 = +[EDMessageChangeManager log];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            id v21 = [v17 remoteID];
            [(EDMessageChangeManager *)v21 _persistFlagChangeResults:&v92 forFlagChangeAction:v20];
          }
        }
        else
        {
          [v5 addIndex:v19];
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v80 objects:v93 count:16];
    }
    while (v14);
  }

  uint64_t v22 = [v5 count];
  id v23 = [v63 remoteIDs];
  BOOL v24 = v22 == [v23 count];

  if (!v24)
  {
    id v25 = +[EDMessageChangeManager log];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v56 = [v5 count];
      id v57 = [v63 remoteIDs];
      int v58 = [v57 count];
      id v59 = [v63 remoteIDs];
      int v60 = [v59 count];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v90 = v56 - v58;
      *(_WORD *)&v90[4] = 1024;
      *(_DWORD *)&v90[6] = v60;
      _os_log_error_impl(&dword_1DB39C000, v25, OS_LOG_TYPE_ERROR, "%d of %d UIDs in flag change action were invalid.", buf, 0xEu);
    }
  }
  id v26 = [v62 completedUIDs];
  int v27 = [v26 isEqualToIndexSet:v5];

  if (v27)
  {
    id v28 = +[EDMessageChangeManager log];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      int v29 = [v5 count];
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v90 = v29;
      _os_log_impl(&dword_1DB39C000, v28, OS_LOG_TYPE_INFO, "All %d UIDs in flag change action were completed.", buf, 8u);
    }

    long long v30 = [v63 remoteIDs];
    long long v31 = [v30 allObjects];
    long long v32 = (void *)[v31 mutableCopy];

    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v33 = [v63 messages];
    uint64_t v34 = [v33 countByEnumeratingWithState:&v76 objects:v88 count:16];
    if (v34)
    {
      uint64_t v35 = *(void *)v77;
      do
      {
        for (uint64_t k = 0; k != v34; ++k)
        {
          if (*(void *)v77 != v35) {
            objc_enumerationMutation(v33);
          }
          long long v37 = *(void **)(*((void *)&v76 + 1) + 8 * k);
          long long v38 = [v37 remoteID];
          uint64_t v39 = [v38 length];

          if (v39)
          {
            long long v40 = [v37 remoteID];
            [v32 addObject:v40];
          }
        }
        uint64_t v34 = [v33 countByEnumeratingWithState:&v76 objects:v88 count:16];
      }
      while (v34);
    }

    long long v41 = [(EDMessageChangeManager *)self database];
    long long v42 = [NSString stringWithUTF8String:"-[EDMessageChangeManager _persistFlagChangeResults:forFlagChangeAction:]"];
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __72__EDMessageChangeManager__persistFlagChangeResults_forFlagChangeAction___block_invoke;
    v71[3] = &unk_1E6C027D0;
    id v72 = v62;
    BOOL v73 = self;
    id v74 = v63;
    BOOL v75 = v32;
    objc_msgSend(v41, "__performWriteWithCaller:usingBlock:", v42, v71);
  }
  else
  {
    long long v43 = +[EDMessageChangeManager log];
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      long long v44 = [v62 completedUIDs];
      int v45 = [v44 count];
      int v46 = [v5 count];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v90 = v45;
      *(_WORD *)&v90[4] = 1024;
      *(_DWORD *)&v90[6] = v46;
      _os_log_impl(&dword_1DB39C000, v43, OS_LOG_TYPE_INFO, "%d of %d UIDs in flag change action were completed.", buf, 0xEu);
    }
    uint64_t v47 = (void *)MEMORY[0x1E4F1CA48];
    id v48 = [v62 completedUIDs];
    long long v32 = objc_msgSend(v47, "arrayWithCapacity:", objc_msgSend(v48, "count"));

    id v49 = [v62 completedUIDs];
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __72__EDMessageChangeManager__persistFlagChangeResults_forFlagChangeAction___block_invoke_159;
    v70[3] = &unk_1E6C02780;
    v70[4] = v32;
    [v49 enumerateIndexesUsingBlock:v70];

    uint64_t v50 = (void *)[objc_alloc(MEMORY[0x1E4F28E60]) initWithIndexSet:v5];
    long long v51 = [v62 completedUIDs];
    [v50 removeIndexes:v51];

    long long v52 = [(EDMessageChangeManager *)self database];
    long long v53 = [NSString stringWithUTF8String:"-[EDMessageChangeManager _persistFlagChangeResults:forFlagChangeAction:]"];
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __72__EDMessageChangeManager__persistFlagChangeResults_forFlagChangeAction___block_invoke_2;
    v64[3] = &unk_1E6C02708;
    id v65 = v62;
    __int16 v66 = self;
    id v67 = v63;
    __int16 v68 = v32;
    id v54 = v50;
    id v69 = v54;
    objc_msgSend(v52, "__performWriteWithCaller:usingBlock:", v53, v64);
  }
  return 0;
}

uint64_t __72__EDMessageChangeManager__persistFlagChangeResults_forFlagChangeAction___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) error];

  id v3 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v5 = [*(id *)(a1 + 48) mailboxURL];
    [v3 _resetLocalFlagsToServerFlagsForMessagesWithRemoteIDs:v4 mailboxURL:v5];
    id v6 = (void *)v5;
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 40) serverMessagePersistenceFactory];
    uint64_t v8 = [*(id *)(a1 + 48) mailboxURL];
    id v6 = [v7 serverMessagePersistenceForMailboxURL:v8];

    id v9 = [*(id *)(a1 + 48) flagChange];
    [v6 applyFlagChange:v9 toMessagesWithRemoteIDs:*(void *)(a1 + 56)];
  }
  id v10 = [*(id *)(a1 + 40) localActionPersistence];
  unsigned int v11 = [*(id *)(a1 + 48) persistentID];
  objc_msgSend(v10, "removeMessageAction:", objc_msgSend(v11, "databaseID"));

  return 1;
}

void __72__EDMessageChangeManager__persistFlagChangeResults_forFlagChangeAction___block_invoke_159(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  objc_msgSend(NSString, "stringWithFormat:", @"%u", a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");
}

uint64_t __72__EDMessageChangeManager__persistFlagChangeResults_forFlagChangeAction___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) error];

  id v3 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v5 = [*(id *)(a1 + 48) mailboxURL];
    [v3 _resetLocalFlagsToServerFlagsForMessagesWithRemoteIDs:v4 mailboxURL:v5];
    id v6 = (void *)v5;
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 40) serverMessagePersistenceFactory];
    uint64_t v8 = [*(id *)(a1 + 48) mailboxURL];
    id v6 = [v7 serverMessagePersistenceForMailboxURL:v8];

    id v9 = [*(id *)(a1 + 48) flagChange];
    [v6 applyFlagChange:v9 toMessagesWithRemoteIDs:*(void *)(a1 + 56)];
  }
  id v10 = [*(id *)(a1 + 40) localActionPersistence];
  [v10 updateFlagChangeAction:*(void *)(a1 + 48) withRemainingUIDs:*(void *)(a1 + 64)];

  return 1;
}

- (void)_clearFollowUpsFromThreadsForMessages:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  if ([v37 count])
  {
    context = (void *)MEMORY[0x1E0190280]();
    id v3 = +[EDMessageChangeManager log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v53 = [v37 count];
      _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "Starting to clear follow-ups from threads of %lu incoming messages.", buf, 0xCu);
    }

    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id obj = v37;
    uint64_t v5 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v47 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          id v9 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v8, "conversationID"));
          id v10 = [v4 objectForKeyedSubscript:v9];

          if (!v10
            || ([v8 dateReceived],
                unsigned int v11 = objc_claimAutoreleasedReturnValue(),
                int v12 = objc_msgSend(v10, "ef_isEarlierThanDate:", v11),
                v11,
                v12))
          {
            uint64_t v13 = [v8 dateReceived];
            uint64_t v14 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v8, "conversationID"));
            [v4 setObject:v13 forKeyedSubscript:v14];
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v5);
    }

    uint64_t v34 = [v4 allKeys];
    id v15 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v16 = objc_msgSend(obj, "ef_map:", &__block_literal_global_167);
    uint64_t v39 = (void *)[v15 initWithArray:v16];

    id v17 = [(EDMessageChangeManager *)self messagePersistence];
    uint64_t v35 = [v17 persistedMessageIDsForMessagesWithFollowUpsForConversationIDs:v34];

    uint64_t v18 = [(EDMessageChangeManager *)self messagePersistence];
    long long v33 = [v18 persistedMessagesForDatabaseIDs:v35 requireProtectedData:0 temporarilyUnavailableDatabaseIDs:0];

    id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id obja = v33;
    uint64_t v19 = [obja countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v43 != v20) {
            objc_enumerationMutation(obja);
          }
          uint64_t v22 = *(void **)(*((void *)&v42 + 1) + 8 * j);
          id v23 = [v22 dateReceived];
          BOOL v24 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v22, "conversationID"));
          id v25 = [v4 objectForKeyedSubscript:v24];
          int v26 = objc_msgSend(v23, "ef_isEarlierThanDate:", v25);

          if (v26)
          {
            int v27 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v22, "globalMessageID"));
            char v28 = [v39 containsObject:v27];

            if ((v28 & 1) == 0) {
              [v38 addObject:v22];
            }
          }
        }
        uint64_t v19 = [obja countByEnumeratingWithState:&v42 objects:v50 count:16];
      }
      while (v19);
    }

    int v29 = [(EDMessageChangeManager *)self messagePersistence];
    [v29 persistFollowUp:0 forMessages:v38];

    long long v30 = +[EDMessageChangeManager log];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = [v38 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v53 = v31;
      _os_log_impl(&dword_1DB39C000, v30, OS_LOG_TYPE_DEFAULT, "Finished clearing %lu follow-ups.", buf, 0xCu);
    }
  }
}

id __64__EDMessageChangeManager__clearFollowUpsFromThreadsForMessages___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v2, "globalMessageID"));

  return v3;
}

- (void)_resetLocalFlagsToServerFlagsForMessagesWithRemoteIDs:(id)a3 mailboxURL:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v21 = a4;
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v6 = [(EDMessageChangeManager *)self serverMessagePersistenceFactory];
  uint64_t v7 = [v6 serverMessagePersistenceForMailboxURL:v21];

  uint64_t v19 = v7;
  [v7 serverMessagesForRemoteIDs:v20];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v8);
        }
        int v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v13 = [v12 messagePersistentID];
        uint64_t v14 = -[EDMessageChangeManager messageForDatabaseID:](self, "messageForDatabaseID:", [v13 longLongValue]);

        if (v14)
        {
          id v15 = [v14 flags];
          uint64_t v16 = [v12 serverFlags];
          if (([v15 isEqual:v16] & 1) == 0)
          {
            id v17 = [MEMORY[0x1E4F608B8] changeFrom:v15 to:v16];
            uint64_t v18 = [v22 objectForKeyedSubscript:v17];
            if (!v18)
            {
              uint64_t v18 = objc_opt_new();
              [v22 setObject:v18 forKeyedSubscript:v17];
            }
            [v18 addObject:v14];
          }
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __91__EDMessageChangeManager__resetLocalFlagsToServerFlagsForMessagesWithRemoteIDs_mailboxURL___block_invoke;
  v23[3] = &unk_1E6C02820;
  uint8_t v23[4] = self;
  [v22 enumerateKeysAndObjectsUsingBlock:v23];
}

id __91__EDMessageChangeManager__resetLocalFlagsToServerFlagsForMessagesWithRemoteIDs_mailboxURL___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)[*(id *)(a1 + 32) applyFlagChange:a2 toMessagesInDatabase:a3];
}

- (BOOL)_persistResults:(id)a3 forTransferAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v31 = 0;
  long long v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v27 = 0;
  char v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  id v8 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  uint64_t v9 = [(EDMessageChangeManager *)self database];
  uint64_t v10 = [NSString stringWithUTF8String:"-[EDMessageChangeManager _persistResults:forTransferAction:]"];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __60__EDMessageChangeManager__persistResults_forTransferAction___block_invoke;
  id v20 = &unk_1E6C01928;
  unsigned int v11 = v8;
  id v21 = v11;
  id v12 = v6;
  id v22 = v12;
  id v23 = self;
  id v13 = v7;
  id v24 = v13;
  long long v25 = &v31;
  long long v26 = &v27;
  objc_msgSend(v9, "__performWriteWithCaller:usingBlock:", v10, &v17);

  uint64_t v14 = objc_msgSend(v12, "error", v17, v18, v19, v20);

  if (v14) {
    [(EDMessageChangeManager *)self displayErrorForTransferAction:v13 withResults:v12];
  }
  if (*((unsigned char *)v28 + 24))
  {
    *((unsigned char *)v32 + 24) = 0;
    [(EDMessageChangeManager *)self actionHasChangedAccount:v13];
  }
  char v15 = *((unsigned char *)v32 + 24);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v15;
}

uint64_t __60__EDMessageChangeManager__persistResults_forTransferAction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  id v4 = [*(id *)(a1 + 40) failedItems];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    if ([*(id *)(a1 + 40) phaseForResults] == 3
      || [*(id *)(a1 + 40) phaseForResults] == 4)
    {
      id v6 = *(void **)(a1 + 48);
      id v7 = [*(id *)(a1 + 40) failedItems];
      [v6 _handleFailedCopyItems:v7 transferAction:*(void *)(a1 + 56) generationWindow:*(void *)(a1 + 32)];
LABEL_5:

      goto LABEL_6;
    }
    if ([*(id *)(a1 + 40) phaseForResults] == 1)
    {
      char v30 = *(void **)(a1 + 48);
      id v7 = [*(id *)(a1 + 40) failedItems];
      [v30 _handleFailedDownload:v7 generationWindow:*(void *)(a1 + 32)];
      goto LABEL_5;
    }
  }
LABEL_6:
  id v8 = [*(id *)(a1 + 40) completedItems];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    uint64_t v10 = [*(id *)(a1 + 40) phaseForResults];
    unsigned int v11 = *(void **)(a1 + 40);
    if (v10 == 1)
    {
      id v12 = [v11 downloadedDataByCopyItems];
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __60__EDMessageChangeManager__persistResults_forTransferAction___block_invoke_2;
      v68[3] = &unk_1E6C02848;
      v68[4] = *(void *)(a1 + 48);
      [v12 enumerateKeysAndObjectsUsingBlock:v68];
    }
    else if ([v11 phaseForResults] == 3)
    {
      id v13 = [*(id *)(a1 + 56) mailboxURL];
      uint64_t v14 = [*(id *)(a1 + 56) destinationMailboxURL];
      int v15 = [v13 isEqual:v14];

      if (v15)
      {
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        uint64_t v16 = [*(id *)(a1 + 40) completedItems];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v64 objects:v71 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v65;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v65 != v18) {
                objc_enumerationMutation(v16);
              }
              id v20 = *(void **)(a1 + 48);
              id v21 = [*(id *)(*((void *)&v64 + 1) + 8 * i) destinationMessage];
              [v20 messageWasAppended:v21];
            }
            uint64_t v17 = [v16 countByEnumeratingWithState:&v64 objects:v71 count:16];
          }
          while (v17);
        }
      }
      id v22 = *(void **)(a1 + 48);
      id v23 = [*(id *)(a1 + 56) destinationMailboxURL];
      LODWORD(v22) = [v22 _needToStoreServerMessagesForMailboxURL:v23];

      if (v22)
      {
        id v24 = *(void **)(a1 + 48);
        long long v25 = [*(id *)(a1 + 40) createdServerMessages];
        long long v26 = [*(id *)(a1 + 56) destinationMailboxURL];
        [v24 _storeServerMessages:v25 mailboxURL:v26 generationWindow:*(void *)(a1 + 32)];

        uint64_t v27 = *(void **)(a1 + 48);
        char v28 = [*(id *)(a1 + 40) completedItems];
        uint64_t v29 = [*(id *)(a1 + 40) createdServerMessages];
        [v27 _deleteDestinationMessagesFromCompletedItems:v28 notInServerMessages:v29];
      }
      else
      {
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v43 = [*(id *)(a1 + 40) createdServerMessages];
        uint64_t v44 = [v43 countByEnumeratingWithState:&v60 objects:v70 count:16];
        if (v44)
        {
          uint64_t v45 = *(void *)v61;
          do
          {
            for (uint64_t j = 0; j != v44; ++j)
            {
              if (*(void *)v61 != v45) {
                objc_enumerationMutation(v43);
              }
              long long v47 = *(void **)(*((void *)&v60 + 1) + 8 * j);
              long long v48 = *(void **)(a1 + 48);
              long long v49 = [v47 remoteID];
              uint64_t v50 = [v47 messagePersistentID];
              objc_msgSend(v48, "setRemoteID:onMessageWithDatabaseID:", v49, objc_msgSend(v50, "longLongValue"));
            }
            uint64_t v44 = [v43 countByEnumeratingWithState:&v60 objects:v70 count:16];
          }
          while (v44);
        }
      }
    }
    else if ([*(id *)(a1 + 40) phaseForResults] == 4)
    {
      uint64_t v31 = *(void **)(a1 + 48);
      long long v32 = [*(id *)(a1 + 56) sourceMailboxURL];
      LODWORD(v31) = [v31 _needToStoreServerMessagesForMailboxURL:v32];

      if (v31)
      {
        uint64_t v33 = objc_opt_new();
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        char v34 = objc_msgSend(*(id *)(a1 + 40), "completedItems", 0);
        uint64_t v35 = [v34 countByEnumeratingWithState:&v56 objects:v69 count:16];
        if (v35)
        {
          uint64_t v36 = *(void *)v57;
          do
          {
            for (uint64_t k = 0; k != v35; ++k)
            {
              if (*(void *)v57 != v36) {
                objc_enumerationMutation(v34);
              }
              id v38 = [*(id *)(*((void *)&v56 + 1) + 8 * k) sourceRemoteID];
              if (v38) {
                [v33 addObject:v38];
              }
            }
            uint64_t v35 = [v34 countByEnumeratingWithState:&v56 objects:v69 count:16];
          }
          while (v35);
        }

        uint64_t v39 = [*(id *)(a1 + 48) serverMessagePersistenceFactory];
        long long v40 = [*(id *)(a1 + 56) mailboxURL];
        long long v41 = [v39 serverMessagePersistenceForMailboxURL:v40];

        long long v42 = (void *)[objc_alloc(MEMORY[0x1E4F608B8]) initWithBuilder:&__block_literal_global_172];
        [v41 applyFlagChange:v42 toMessagesWithRemoteIDs:v33];
      }
    }
  }
  long long v51 = [*(id *)(a1 + 56) mailboxURL];
  long long v52 = [*(id *)(a1 + 48) localActionPersistence];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v52 updateTransferAction:*(void *)(a1 + 56) withResults:*(void *)(a1 + 40)];

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    uint64_t v53 = *(void **)(a1 + 48);
    uint64_t v54 = [*(id *)(a1 + 56) mailboxURL];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v53 mailboxURL:v54 isInSameAccountAsMailboxURL:v51] ^ 1;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
  }

  return 1;
}

void __60__EDMessageChangeManager__persistResults_forTransferAction___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  uint64_t v5 = [a2 destinationMessage];
  [*(id *)(a1 + 32) setData:v6 onMessage:v5];
}

uint64_t __60__EDMessageChangeManager__persistResults_forTransferAction___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 changesDeletedTo:1];
}

- (void)_handleFailedDownload:(id)a3 generationWindow:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = objc_opt_new();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "destinationMessage", (void)v15);
          if (v13) {
            [v8 addObject:v13];
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    [(EDMessageChangeManager *)self deletePersistedMessages:v8];
    uint64_t v14 = [(EDMessageChangeManager *)self hookResponder];
    [v14 persistenceDidDeleteMessages:v8 generationWindow:v7];
  }
}

- (void)_handleFailedCopyItems:(id)a3 transferAction:(id)a4 generationWindow:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v30 = a4;
  id v27 = a5;
  char v28 = v7;
  if ([v7 count])
  {
    uint64_t v8 = [v30 sourceMailboxURL];
    uint64_t v25 = v8;
    if (v8) {
      int v9 = !-[EDMessageChangeManager mailboxURLIsInRemoteAccount:](self, "mailboxURLIsInRemoteAccount:", v8, v8);
    }
    else {
      int v9 = 0;
    }
    uint64_t v31 = objc_opt_new();
    uint64_t v10 = objc_opt_new();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v36 != v13) {
            objc_enumerationMutation(v11);
          }
          long long v15 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          if ((v9 & 1) == 0)
          {
            long long v16 = [*(id *)(*((void *)&v35 + 1) + 8 * i) sourceRemoteID];
            if (v16)
            {
            }
            else
            {
              long long v17 = [v15 sourceMessage];
              long long v18 = [v17 remoteID];
              BOOL v19 = [v18 length] == 0;

              if (v19) {
                continue;
              }
            }
          }
          uint64_t v20 = objc_msgSend(v15, "destinationMessage", v25);
          if (v20)
          {
            [v31 addObject:v20];
            [v10 setObject:v15 forKeyedSubscript:v20];
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v12);
    }

    if ([v30 transferType] == 1 && objc_msgSend(v31, "count"))
    {
      id v21 = objc_opt_new();
      id v22 = [v30 sourceMailboxURL];
      int v23 = [(EDMessageChangeManager *)self persistNewMessages:v31 mailboxURL:v22 oldMessagesByNewMessage:v21 fromSyncing:0];

      if (((v23 ^ 1 | v9) & 1) == 0)
      {
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        void v32[2] = __81__EDMessageChangeManager__handleFailedCopyItems_transferAction_generationWindow___block_invoke;
        v32[3] = &unk_1E6C025C8;
        id v33 = v10;
        char v34 = self;
        [v21 enumerateKeysAndObjectsUsingBlock:v32];
      }
    }
    -[EDMessageChangeManager deletePersistedMessages:](self, "deletePersistedMessages:", v31, v25);
    id v24 = [(EDMessageChangeManager *)self hookResponder];
    [v24 persistenceDidDeleteMessages:v31 generationWindow:v27];
  }
}

void __81__EDMessageChangeManager__handleFailedCopyItems_transferAction_generationWindow___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v15 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:a3];
  id v6 = [v5 sourceRemoteID];

  id v7 = [v15 persistentID];
  uint64_t v8 = [v7 longLongValue];

  [*(id *)(a1 + 40) setRemoteID:v6 onMessageWithDatabaseID:v8];
  int v9 = [v15 mailbox];
  uint64_t v10 = [v9 URL];

  if ([*(id *)(a1 + 40) _needToStoreServerMessagesForMailboxURL:v10])
  {
    id v11 = [*(id *)(a1 + 40) serverMessagePersistenceFactory];
    uint64_t v12 = [v15 mailbox];
    uint64_t v13 = [v12 URL];
    uint64_t v14 = [v11 serverMessagePersistenceForMailboxURL:v13];

    [v14 attachMessage:v8 toServerMessageWithRemoteID:v6];
  }
}

- (void)_storeServerMessages:(id)a3 mailboxURL:(id)a4 generationWindow:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v27 = a5;
  char v28 = v9;
  uint64_t v10 = [(EDMessageChangeManager *)self serverMessagePersistenceFactory];
  long long v32 = [v10 serverMessagePersistenceForMailboxURL:v9];

  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v8;
  uint64_t v11 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v11)
  {
    uint64_t v31 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v40 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        __int16 v38 = 0;
        [v32 addServerMessage:v13 invalidMessage:(char *)&v38 + 1 duplicateRemoteID:&v38];
        if ((_BYTE)v38)
        {
          uint64_t v14 = [(EDMessageChangeManager *)self _handleDuplicateServerMessage:v13 serverMessagePersistence:v32];
          if (v14) {
            [v29 addObject:v14];
          }
        }
        else if (HIBYTE(v38))
        {
          id v15 = objc_alloc(MEMORY[0x1E4F608D8]);
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = __75__EDMessageChangeManager__storeServerMessages_mailboxURL_generationWindow___block_invoke;
          v37[3] = &unk_1E6C02890;
          v37[4] = v13;
          long long v16 = (void *)[v15 initWithServerMessageBuilder:v37];
          [v32 addServerMessage:v16 invalidMessage:0 duplicateRemoteID:0];
          id v17 = objc_alloc(MEMORY[0x1E4F60910]);
          v36[0] = MEMORY[0x1E4F143A8];
          v36[1] = 3221225472;
          v36[2] = __75__EDMessageChangeManager__storeServerMessages_mailboxURL_generationWindow___block_invoke_2;
          v36[3] = &unk_1E6C02350;
          v36[4] = v13;
          long long v18 = (void *)[v17 initWithBuilder:v36];
          id v19 = objc_alloc(MEMORY[0x1E4F60908]);
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          v33[2] = __75__EDMessageChangeManager__storeServerMessages_mailboxURL_generationWindow___block_invoke_3;
          v33[3] = &unk_1E6C028B8;
          id v20 = v18;
          id v34 = v20;
          id v21 = v28;
          id v35 = v21;
          id v22 = (void *)[v19 initWithBuilder:v33];
          int v23 = [(EDMessageChangeManager *)self localActionPersistence];
          [v23 persistTransferAction:v22];

          [(EDMessageChangeManager *)self checkForNewActionsInMailboxID:[(EDMessageChangeManager *)self mailboxDatabaseIDForURL:v21]];
        }
        id v24 = [v13 remoteID];
        uint64_t v25 = [v13 messagePersistentID];
        -[EDMessageChangeManager setRemoteID:onMessageWithDatabaseID:](self, "setRemoteID:onMessageWithDatabaseID:", v24, [v25 longLongValue]);
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v11);
  }

  if ([v29 count])
  {
    [(EDMessageChangeManager *)self deletePersistedMessages:v29];
    id v26 = [(EDMessageChangeManager *)self hookResponder];
    [v26 persistenceDidDeleteMessages:v29 generationWindow:v27];
  }
}

void __75__EDMessageChangeManager__storeServerMessages_mailboxURL_generationWindow___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) remoteID];
  [v5 setRemoteID:v3];

  id v4 = [*(id *)(a1 + 32) serverFlags];
  [v5 setServerFlags:v4];
}

void __75__EDMessageChangeManager__storeServerMessages_mailboxURL_generationWindow___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) remoteID];
  [v4 setSourceRemoteID:v3];
}

void __75__EDMessageChangeManager__storeServerMessages_mailboxURL_generationWindow___block_invoke_3(uint64_t a1, void *a2)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v5[0] = *(void *)(a1 + 32);
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v3 setItemsToDelete:v4];

  [v3 setSourceMailboxURL:*(void *)(a1 + 40)];
  [v3 setMailboxURL:*(void *)(a1 + 40)];
  [v3 setUserInitiated:0];
  [v3 setTransferType:3];
}

- (void)_deleteDestinationMessagesFromCompletedItems:(id)a3 notInServerMessages:(id)a4
{
  id v6 = [(EDMessageChangeManager *)self _findDestinationMessagesFromCompletedItems:a3 notInServerMessages:a4];
  id v5 = objc_msgSend(v6, "ef_filter:", &__block_literal_global_398_0);
  [(EDMessageChangeManager *)self deletePersistedMessages:v5];
}

- (id)_findDestinationMessagesFromCompletedItems:(id)a3 notInServerMessages:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v16 = a4;
  if (v16)
  {
    id v6 = objc_msgSend(v5, "ef_compactMap:", &__block_literal_global_176);
    id v7 = (void *)[v6 mutableCopy];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v16;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = [*(id *)(*((void *)&v19 + 1) + 8 * i) messagePersistentID];
          uint64_t v13 = v12;
          if (v12)
          {
            v17[0] = MEMORY[0x1E4F143A8];
            v17[1] = 3221225472;
            v17[2] = __89__EDMessageChangeManager__findDestinationMessagesFromCompletedItems_notInServerMessages___block_invoke_2;
            void v17[3] = &unk_1E6C02900;
            id v18 = v12;
            uint64_t v14 = [v7 indexOfObjectPassingTest:v17];
            if (v14 != 0x7FFFFFFFFFFFFFFFLL) {
              [v7 removeObjectAtIndex:v14];
            }
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

id __89__EDMessageChangeManager__findDestinationMessagesFromCompletedItems_notInServerMessages___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 destinationMessage];

  return v2;
}

uint64_t __89__EDMessageChangeManager__findDestinationMessagesFromCompletedItems_notInServerMessages___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 persistentID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)_handleDuplicateServerMessage:(id)a3 serverMessagePersistence:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 remoteID];
  v19[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  uint64_t v10 = [v7 serverMessagesForRemoteIDs:v9];
  uint64_t v11 = [v10 firstObject];

  uint64_t v12 = [v11 messagePersistentID];

  if (v12)
  {
    uint64_t v13 = [v11 messagePersistentID];
    uint64_t v14 = -[EDMessageChangeManager messageForDatabaseID:](self, "messageForDatabaseID:", [v13 longLongValue]);
  }
  else
  {
    uint64_t v14 = 0;
  }
  id v15 = [v6 messagePersistentID];
  uint64_t v16 = [v15 longLongValue];
  id v17 = [v11 remoteID];
  [v7 attachMessage:v16 toServerMessageWithRemoteID:v17];

  return v14;
}

- (BOOL)mailboxURLIsInRemoteAccount:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "ef_hasScheme:", *MEMORY[0x1E4F5FC38]) & 1) != 0
      || (objc_msgSend(v4, "ef_hasScheme:", *MEMORY[0x1E4F5FC30]) & 1) != 0)
    {
      char v5 = 1;
    }
    else
    {
      char v5 = objc_msgSend(v4, "ef_hasScheme:", *MEMORY[0x1E4F5FC28]);
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)_needToStoreServerMessagesForMailboxURL:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3) {
    char v5 = objc_msgSend(v3, "ef_hasScheme:", *MEMORY[0x1E4F5FC38]);
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)mailboxURL:(id)a3 isInSameAccountAsMailboxURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  char v8 = 0;
  if (v5 && v6)
  {
    uint64_t v9 = [v5 host];
    uint64_t v10 = [v7 host];
    char v8 = [v9 isEqualToString:v10];
  }
  return v8;
}

- (id)accountForMailboxURL:(id)a3
{
  id v5 = a3;
  [(EDMessageChangeManager *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDMessageChangeManager accountForMailboxURL:]", "EDMessageChangeManager.m", 1729, "0");
}

- (BOOL)_hookResponderRespondsToRequiredMethods:(id)a3
{
  id v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    char v4 = objc_opt_respondsToSelector();
  }
  else
  {
    char v4 = 0;
  }

  return v4 & 1;
}

- (void)remindMeCloudStorageChangedWithAddedOrChangedItems:(id)a3 deletedItems:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v15 = a4;
  id v7 = EDRemindMeLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v23 = v6;
    __int16 v24 = 2114;
    id v25 = v15;
    _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "Processing remote changes for changed items: %{public}@ deleted items: %{public}@", buf, 0x16u);
  }

  char v8 = (void *)[v6 mutableCopy];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v15;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * v12);
        uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v15);
        [v8 setObject:v14 forKeyedSubscript:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __90__EDMessageChangeManager_remindMeCloudStorageChangedWithAddedOrChangedItems_deletedItems___block_invoke;
  void v16[3] = &unk_1E6C02928;
  v16[4] = self;
  [v8 enumerateKeysAndObjectsUsingBlock:v16];
}

void __90__EDMessageChangeManager_remindMeCloudStorageChangedWithAddedOrChangedItems_deletedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v25 = v5;
  id v7 = [*(id *)(a1 + 32) messagePersistence];
  uint64_t v8 = [v7 globalIDForMessageIDHash:v5];

  id v9 = objc_alloc(MEMORY[0x1E4F603A0]);
  uint64_t v10 = [MEMORY[0x1E4F60318] allMailboxesScope];
  uint64_t v11 = (void *)[v9 initWithGlobalMessageID:v8 mailboxScope:v10];

  uint64_t v12 = [*(id *)(a1 + 32) messagePersistence];
  v36[0] = v11;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  uint64_t v14 = [v12 persistedMessagesForObjectIDs:v13 requireProtectedData:0];

  if ([v14 count])
  {
    id v15 = [v14 firstObject];
    uint64_t v16 = [v15 readLater];
    long long v17 = [v16 date];

    long long v18 = [v14 firstObject];
    long long v19 = [v18 displayDate];

    uint64_t v20 = *MEMORY[0x1E4F60CF0];
    if ((*(uint64_t (**)(void, id))(*MEMORY[0x1E4F60CF0] + 16))(*MEMORY[0x1E4F60CF0], v6))
    {
      long long v21 = 0;
    }
    else
    {
      long long v21 = [v6 readLaterDate];
    }
    if ((*(uint64_t (**)(uint64_t, id))(v20 + 16))(v20, v6))
    {
      long long v22 = 0;
    }
    else
    {
      long long v22 = [v6 displayDate];
    }
    if ((EFObjectsAreEqual() & 1) == 0)
    {
      id v23 = EDRemindMeLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134219010;
        uint64_t v27 = v8;
        __int16 v28 = 2114;
        id v29 = v21;
        __int16 v30 = 2114;
        uint64_t v31 = v17;
        __int16 v32 = 2114;
        id v33 = v22;
        __int16 v34 = 2114;
        id v35 = v19;
        _os_log_impl(&dword_1DB39C000, v23, OS_LOG_TYPE_DEFAULT, "Applying new read later date due to remote change for messages with global message id: %lld, new read later date: %{public}@, old read later date: %{public}@, new display date: %{public}@, old display date: %{public}@", buf, 0x34u);
      }

      if ([v22 isEqualToDate:v19])
      {

        long long v22 = 0;
      }
      id v24 = (id)[*(id *)(a1 + 32) _applyReadLaterDate:v21 displayDate:v22 toMessages:v14 changeIsRemote:1];
    }
  }
  else
  {
    long long v17 = EDRemindMeLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_DEFAULT, "No persisted messages found for remote changes.", buf, 2u);
    }
  }
}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

- (EDReadLaterPersistence)readLaterPersistence
{
  return self->_readLaterPersistence;
}

- (EDServerMessagePersistenceFactory)serverMessagePersistenceFactory
{
  return self->_serverMessagePersistenceFactory;
}

- (EDBIMIManager)bimiManager
{
  return self->_bimiManager;
}

- (OS_dispatch_queue)markAllWorkQueue
{
  return self->_markAllWorkQueue;
}

- (void)setMarkAllWorkQueue:(id)a3
{
}

- (EDBiomeBlackPearlLogger)biomeCollector
{
  return self->_biomeCollector;
}

- (void)setBiomeCollector:(id)a3
{
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (EDMessageChangeHookResponder)hookResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hookResponder);

  return (EDMessageChangeHookResponder *)WeakRetained;
}

- (EDLocalActionPersistence)localActionPersistence
{
  return self->_localActionPersistence;
}

- (EDMessageAuthenticator)messageAuthenticator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageAuthenticator);

  return (EDMessageAuthenticator *)WeakRetained;
}

- (void)setMessageAuthenticator:(id)a3
{
}

- (EDMessageCategorizer)messageCategorizer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageCategorizer);

  return (EDMessageCategorizer *)WeakRetained;
}

- (void)setMessageCategorizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_messageCategorizer);
  objc_destroyWeak((id *)&self->_messageAuthenticator);
  objc_storeStrong((id *)&self->_localActionPersistence, 0);
  objc_destroyWeak((id *)&self->_hookResponder);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_biomeCollector, 0);
  objc_storeStrong((id *)&self->_markAllWorkQueue, 0);
  objc_storeStrong((id *)&self->_bimiManager, 0);
  objc_storeStrong((id *)&self->_serverMessagePersistenceFactory, 0);
  objc_storeStrong((id *)&self->_readLaterPersistence, 0);

  objc_storeStrong((id *)&self->_database, 0);
}

- (void)applyFlagChange:(os_log_t)log toMessages:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Warning, only changing flags on %lu of %lu messages as some messages were missing mailbox URLs", (uint8_t *)&v3, 0x16u);
}

void __53__EDMessageChangeManager_applyFlagChange_toMessages___block_invoke_2_103_cold_1(uint8_t *buf, uint64_t a2, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(void *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a3;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Warning, only converted %lu of %lu to persisted messages", buf, 0x16u);
}

void __86__EDMessageChangeManager_applyFollowUp_toMessages_withNegativeFeedbackForSuggestions___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_ERROR, "ERROR calling the follow up feedback SPI from Suggestions: %@", (uint8_t *)&v3, 0xCu);
}

- (void)_truncateReadLaterDate:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1DB39C000, log, OS_LOG_TYPE_DEBUG, "Skip truncation. truncatedDate:%{public}@ readLaterDate:%{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)_persistFlagChangeResults:(void *)a3 forFlagChangeAction:(os_log_t)log .cold.1(void *a1, uint8_t *buf, void *a3, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *a3 = a1;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Message’s UID (%{public}@) is invalid in flag change action.", buf, 0xCu);
}

@end