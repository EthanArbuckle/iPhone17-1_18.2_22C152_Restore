@interface EDMessageCategorizer
+ (EDMessageCategorizationResult)noneMessageCategorizationResult;
+ (OS_os_log)signpostLog;
+ (id)log;
+ (id)queryForMessagesToCategorizeForVersion:(int64_t)a3;
- (BOOL)_categorizeMessages:(id)a3 senderAttributes:(id)a4 signpostID:(unint64_t)a5 results:(id)a6 reason:(int64_t)a7;
- (BOOL)_categorizeMessages:(id)a3 signpostID:(unint64_t)a4 results:(id *)a5 reason:(int64_t)a6;
- (BOOL)_shouldGenerateSummaries;
- (BOOL)categorizeMessages:(id)a3 reason:(int64_t)a4;
- (ECDKIMVerifier)verifier;
- (EDCategoryCoreAnalyticsLogger)analyticsLogger;
- (EDCategoryPersistence)persistence;
- (EDInteractionEventLog)eventLog;
- (EDMessageCategorizer)initWithCategoryPersistence:(id)a3 eventLog:(id)a4 vipManager:(id)a5 contactStore:(id)a6 analyticsLogger:(id)a7 senderPersistence:(id)a8 hookRegistry:(id)a9;
- (EDSenderPersistence)senderPersistence;
- (EFLocked)messagesWithCategorization;
- (EMCachingContactStore)contactStore;
- (EMNSUserDefaultsBoolObserver)automaticallySummarizeMessages;
- (EMVIPManager)vipManager;
- (NSConditionLock)categorizationState;
- (OS_dispatch_queue)processingQueue;
- (id)_categorizeMappedMessages:(id)a3;
- (id)_makeCategorizationResultFromPrediction:(id)a3;
- (id)_makeCategorizationResultMetadataFromPrediction:(id)a3;
- (id)_messagesToCategorizeFromMessages:(id)a3;
- (id)_stableEmailAddressForMessage:(id)a3;
- (id)_transformBaseMessages:(id)a3 senderAttributes:(id)a4 signpostID:(unint64_t)a5;
- (id)_transformResult:(id)a3;
- (unint64_t)_subCategoryFor:(id)a3;
- (unint64_t)signpostID;
- (void)persistenceDidAddNewMessages:(id)a3;
- (void)persistenceDidReconcileJournaledMessages:(id)a3 generationWindow:(id)a4;
- (void)persistenceWillAddNewMessages:(id)a3;
- (void)setAnalyticsLogger:(id)a3;
- (void)setAutomaticallySummarizeMessages:(id)a3;
- (void)setEventLog:(id)a3;
- (void)setMessagesWithCategorization:(id)a3;
- (void)setPersistence:(id)a3;
- (void)setProcessingQueue:(id)a3;
- (void)setSenderPersistence:(id)a3;
@end

@implementation EDMessageCategorizer

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__EDMessageCategorizer_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_51 != -1) {
    dispatch_once(&log_onceToken_51, block);
  }
  v2 = (void *)log_log_51;

  return v2;
}

void __27__EDMessageCategorizer_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_51;
  log_log_51 = (uint64_t)v1;
}

+ (OS_os_log)signpostLog
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__EDMessageCategorizer_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_1 != -1) {
    dispatch_once(&signpostLog_onceToken_1, block);
  }
  v2 = (void *)signpostLog_log_1;

  return (OS_os_log *)v2;
}

void __35__EDMessageCategorizer_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  v2 = (void *)signpostLog_log_1;
  signpostLog_log_1 = (uint64_t)v1;
}

- (unint64_t)signpostID
{
  id v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

+ (EDMessageCategorizationResult)noneMessageCategorizationResult
{
  if (noneMessageCategorizationResult_onceToken != -1) {
    dispatch_once(&noneMessageCategorizationResult_onceToken, &__block_literal_global_80);
  }
  v2 = (void *)noneMessageCategorizationResult_sInstance;

  return (EDMessageCategorizationResult *)v2;
}

void __55__EDMessageCategorizer_noneMessageCategorizationResult__block_invoke()
{
  v0 = [EDMessageCategorizationResult alloc];
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F60230]) initWithType:0 subtype:0 isHighImpact:0 state:1];
  uint64_t v1 = -[EDMessageCategorizationResult initWithCategory:metadata:](v0, "initWithCategory:metadata:");
  v2 = (void *)noneMessageCategorizationResult_sInstance;
  noneMessageCategorizationResult_sInstance = v1;
}

- (EDMessageCategorizer)initWithCategoryPersistence:(id)a3 eventLog:(id)a4 vipManager:(id)a5 contactStore:(id)a6 analyticsLogger:(id)a7 senderPersistence:(id)a8 hookRegistry:(id)a9
{
  id v42 = a3;
  id v41 = a4;
  id v40 = a5;
  id v16 = a6;
  id v39 = a7;
  id v17 = a8;
  id v18 = a9;
  v46.receiver = self;
  v46.super_class = (Class)EDMessageCategorizer;
  v19 = [(EDMessageCategorizer *)&v46 init];
  if (v19)
  {
    if (LoadicloudMCCKit_loadPredicate_1 != -1) {
      dispatch_once(&LoadicloudMCCKit_loadPredicate_1, &__block_literal_global_360);
    }
    objc_storeStrong((id *)&v19->_persistence, a3);
    objc_storeStrong((id *)&v19->_eventLog, a4);
    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = dispatch_queue_attr_make_with_qos_class(v20, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v22 = dispatch_queue_create("com.apple.email.EDMessageCategorizer", v21);
    processingQueue = v19->_processingQueue;
    v19->_processingQueue = (OS_dispatch_queue *)v22;

    uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28BB8]), "initWithCondition:", 1, v39, v40, v41, v42);
    categorizationState = v19->_categorizationState;
    v19->_categorizationState = (NSConditionLock *)v24;

    objc_storeStrong((id *)&v19->_vipManager, a5);
    if ((_os_feature_enabled_impl() & 1) != 0
      || _os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
    {
      uint64_t v26 = [objc_alloc(MEMORY[0x1E4F60228]) initWithStore:v16 options:2];
      contactStore = v19->_contactStore;
      v19->_contactStore = (EMCachingContactStore *)v26;
    }
    objc_storeStrong((id *)&v19->_analyticsLogger, a7);
    objc_storeStrong((id *)&v19->_senderPersistence, a8);
    v28 = (ECDKIMVerifier *)objc_alloc_init(MEMORY[0x1E4F607F0]);
    verifier = v19->_verifier;
    v19->_verifier = v28;

    [v18 registerMessageChangeHookResponder:v19];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v19);
    v30 = v19->_processingQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __132__EDMessageCategorizer_initWithCategoryPersistence_eventLog_vipManager_contactStore_analyticsLogger_senderPersistence_hookRegistry___block_invoke;
    block[3] = &unk_1E6C00E78;
    objc_copyWeak(&v44, &location);
    dispatch_async(v30, block);
    if (_os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
    {
      id v31 = objc_alloc(MEMORY[0x1E4F603F8]);
      uint64_t v32 = [v31 initWithUserDefaultKey:*MEMORY[0x1E4F600E8] keyRepresentsDisabled:1 handler:0];
      automaticallySummarizeMessages = v19->_automaticallySummarizeMessages;
      v19->_automaticallySummarizeMessages = (EMNSUserDefaultsBoolObserver *)v32;
    }
    id v34 = objc_alloc(MEMORY[0x1E4F60DA0]);
    v35 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v36 = [v34 initWithObject:v35];
    messagesWithCategorization = v19->_messagesWithCategorization;
    v19->_messagesWithCategorization = (EFLocked *)v36;

    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);
  }

  return v19;
}

void __132__EDMessageCategorizer_initWithCategoryPersistence_eventLog_vipManager_contactStore_analyticsLogger_senderPersistence_hookRegistry___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained categorizationState];
  [v1 lock];

  v2 = [WeakRetained categorizationState];
  [v2 unlockWithCondition:0];
}

- (BOOL)_shouldGenerateSummaries
{
  if (!_os_feature_enabled_impl() || !EMIsGreymatterAvailableWithOverride()) {
    return 0;
  }
  id v3 = [(EDMessageCategorizer *)self automaticallySummarizeMessages];
  char v4 = [v3 isEnabled];

  return v4;
}

- (void)persistenceWillAddNewMessages:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0
    || [(EDMessageCategorizer *)self _shouldGenerateSummaries])
  {
    v5 = +[EDMessageCategorizer signpostLog];
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, (const void *)[MEMORY[0x1E4F29128] UUID]);

    v7 = +[EDMessageCategorizer signpostLog];
    v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_DWORD *)buf = 134349056;
      uint64_t v26 = [v4 count];
      _os_signpost_emit_with_name_impl(&dword_1DB39C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "EDMessageCategorization", "Begin message categorization (count=%{public,signpost.telemetry:number1}lu) enableTelemetry=YES ", buf, 0xCu);
    }

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__EDMessageCategorizer_persistenceWillAddNewMessages___block_invoke;
    aBlock[3] = &unk_1E6C01F40;
    os_signpost_id_t v24 = v6;
    id v9 = v4;
    id v23 = v9;
    v10 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    v11 = objc_msgSend(MEMORY[0x1E4F1C9C8], "ef_dateHoursAgo:", 168);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __54__EDMessageCategorizer_persistenceWillAddNewMessages___block_invoke_99;
    v20[3] = &unk_1E6C01F70;
    id v12 = v11;
    id v21 = v12;
    v13 = objc_msgSend(v9, "ef_filter:", v20);
    id v19 = 0;
    [(EDMessageCategorizer *)self _categorizeMessages:v13 signpostID:v6 results:&v19 reason:0];
    id v14 = v19;
    if ([v14 count])
    {
      [v14 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_103];
      v15 = [(EDMessageCategorizer *)self messagesWithCategorization];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __54__EDMessageCategorizer_persistenceWillAddNewMessages___block_invoke_3;
      v17[3] = &unk_1E6C01FB8;
      id v16 = v14;
      id v18 = v16;
      [v15 performWhileLocked:v17];

      v10[2](v10, [v16 count]);
    }
    else
    {
      v10[2](v10, 0);
    }
  }
}

void __54__EDMessageCategorizer_persistenceWillAddNewMessages___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = +[EDMessageCategorizer signpostLog];
  v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    uint64_t v7 = [*(id *)(a1 + 32) count];
    int v8 = 134349312;
    uint64_t v9 = v7;
    __int16 v10 = 2050;
    uint64_t v11 = a2;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v5, OS_SIGNPOST_INTERVAL_END, v6, "EDMessageCategorization", "Finish message categorization (count=%{public,signpost.telemetry:number1}lu, result=%{public,signpost.telemetry:number2}lu) enableTelemetry=YES ", (uint8_t *)&v8, 0x16u);
  }
}

uint64_t __54__EDMessageCategorizer_persistenceWillAddNewMessages___block_invoke_99(uint64_t a1, void *a2)
{
  id v3 = [a2 dateReceived];
  uint64_t v4 = objc_msgSend(v3, "ef_isLaterThanDate:", *(void *)(a1 + 32));

  return v4;
}

uint64_t __54__EDMessageCategorizer_persistenceWillAddNewMessages___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCategorizationResult:");
}

void __54__EDMessageCategorizer_persistenceWillAddNewMessages___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) allKeys];
  [v4 addObjectsFromArray:v3];
}

- (void)persistenceDidAddNewMessages:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  os_signpost_id_t v6 = [(EDMessageCategorizer *)self messagesWithCategorization];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__EDMessageCategorizer_persistenceDidAddNewMessages___block_invoke;
  v10[3] = &unk_1E6C02008;
  id v7 = v4;
  id v11 = v7;
  id v8 = v5;
  id v12 = v8;
  v13 = self;
  [v6 performWhileLocked:v10];

  uint64_t v9 = [(EDMessageCategorizer *)self analyticsLogger];
  [v9 logReceiveEventForMessagesWithResult:v8];
}

void __53__EDMessageCategorizer_persistenceDidAddNewMessages___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__EDMessageCategorizer_persistenceDidAddNewMessages___block_invoke_2;
  v8[3] = &unk_1E6C01FE0;
  id v5 = v3;
  id v9 = v5;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id v10 = v6;
  uint64_t v11 = v7;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];
  [v5 removeAllObjects];
}

void __53__EDMessageCategorizer_persistenceDidAddNewMessages___block_invoke_2(id *a1, void *a2, void *a3)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([a1[4] containsObject:v6])
  {
    uint64_t v7 = [v6 categorizationResult];
    [a1[5] setObject:v7 forKeyedSubscript:v5];

    id v8 = [v5 category];
    uint64_t v9 = [v8 state];

    if (v9 == 3)
    {
      id v10 = [a1[6] analyticsLogger];
      v15[0] = v5;
      uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
      id v12 = [v5 category];
      uint64_t v13 = [v12 type];
      id v14 = [a1[6] persistence];
      [v10 logRecategorizationEventForMessages:v11 categoryType:v13 categoryPersistence:v14];
    }
  }
}

- (void)persistenceDidReconcileJournaledMessages:(id)a3 generationWindow:(id)a4
{
  id v6 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0
    || _os_feature_enabled_impl() && (EMIsGreymatterAvailableWithOverride() & 1) != 0)
  {
    id v5 = objc_msgSend(v6, "ef_filter:", &__block_literal_global_110);
    [(EDMessageCategorizer *)self categorizeMessages:v5 reason:4];
  }
}

BOOL __82__EDMessageCategorizer_persistenceDidReconcileJournaledMessages_generationWindow___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 category];
  BOOL v3 = [v2 state] == 2;

  return v3;
}

- (id)_transformBaseMessages:(id)a3 senderAttributes:(id)a4 signpostID:(unint64_t)a5
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  id v48 = a4;
  uint64_t v7 = +[EDMessageCategorizer signpostLog];
  id v8 = v7;
  unint64_t spid = a5;
  unint64_t v44 = a5 - 1;
  if (a5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v63 = [v45 count];
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, a5, "EDMessageCategorizationTransformMessage", "Begin message transformation (count=%{public,signpost.telemetry:number1}lu) enableTelemetry=YES ", buf, 0xCu);
  }

  id v49 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v45;
  uint64_t v9 = [obj countByEnumeratingWithState:&v58 objects:v66 count:16];
  if (v9)
  {
    uint64_t v47 = *(void *)v59;
    do
    {
      uint64_t v10 = 0;
      uint64_t v50 = v9;
      do
      {
        if (*(void *)v59 != v47) {
          objc_enumerationMutation(obj);
        }
        uint64_t v52 = v10;
        uint64_t v11 = *(void **)(*((void *)&v58 + 1) + 8 * v10);
        context = (void *)MEMORY[0x1E0190280]();
        id v12 = [v11 to];
        if ([v12 count])
        {
          v57 = [v11 to];
        }
        else
        {
          v57 = (void *)MEMORY[0x1E4F1CBF0];
        }

        uint64_t v13 = [v11 cc];
        if ([v13 count])
        {
          v56 = [v11 cc];
        }
        else
        {
          v56 = (void *)MEMORY[0x1E4F1CBF0];
        }

        id v14 = [v11 bcc];
        if ([v14 count])
        {
          v55 = [v11 bcc];
        }
        else
        {
          v55 = (void *)MEMORY[0x1E4F1CBF0];
        }

        id v15 = objc_alloc(MEMORY[0x1E4F73A60]);
        v54 = (void *)[v15 initWithStringsTo:v57 cc:v56 bcc:v55 replyTo:MEMORY[0x1E4F1CBF0]];
        id v16 = objc_alloc(MEMORY[0x1E4F73A40]);
        id v17 = [v11 from];
        id v18 = [v17 firstObject];
        v53 = (void *)[v16 initWithRawString:v18];

        id v19 = [v11 senders];
        v20 = [v19 firstObject];
        id v21 = [v20 emailAddressValue];

        dispatch_queue_t v22 = [v21 simpleAddress];
        id v23 = [v22 lowercaseString];

        os_signpost_id_t v24 = [v48 objectForKey:v23];
        uint64_t v25 = [v24 isContact];
        uint64_t v26 = [v24 isVIP];
        uint64_t v27 = [v24 isPrimarySender];
        v28 = [v11 headers];
        v29 = [v28 allHeaderKeys];
        uint64_t v30 = [v29 containsObject:@"list-unsubscribe"];

        id v31 = (void *)[objc_alloc(MEMORY[0x1E4F73A68]) initWithSenderEmailAddress:v23 isVIP:v26 isContact:v25 isUnsubscribeHeaderPresent:v30 isPrimarySender:v27];
        id v32 = objc_alloc(MEMORY[0x1E4F73A48]);
        v33 = [v11 subject];
        id v34 = [v33 subjectString];
        v35 = [v11 dateSent];
        uint64_t v36 = [v11 dateReceived];
        v37 = (void *)[v32 initWithState:0 encryptionState:0 signatureState:0 subject:v34 recipients:v54 from:v53 dataSent:v35 dateReceived:v36 headers:0 rawData:0 senderMetadata:v31];

        [v49 setObject:v11 forKeyedSubscript:v37];
        uint64_t v10 = v52 + 1;
      }
      while (v50 != v52 + 1);
      uint64_t v9 = [obj countByEnumeratingWithState:&v58 objects:v66 count:16];
    }
    while (v9);
  }

  v38 = +[EDMessageCategorizer signpostLog];
  id v39 = v38;
  if (v44 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    uint64_t v40 = [obj count];
    uint64_t v41 = [v49 count];
    *(_DWORD *)buf = 134349312;
    uint64_t v63 = v40;
    __int16 v64 = 2050;
    uint64_t v65 = v41;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v39, OS_SIGNPOST_INTERVAL_END, spid, "EDMessageCategorizationTransformMessage", "Finish message transformation (count=%{public,signpost.telemetry:number1}lu, result=%{public,signpost.telemetry:number2}lu) enableTelemetry=YES ", buf, 0x16u);
  }

  return v49;
}

- (BOOL)categorizeMessages:(id)a3 reason:(int64_t)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = +[EDMessageCategorizer signpostLog];
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, (const void *)[MEMORY[0x1E4F29128] UUID]);

  uint64_t v9 = +[EDMessageCategorizer signpostLog];
  uint64_t v10 = v9;
  unint64_t v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v39 = [v6 count];
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "EDMessageCategorization", "Begin message categorization (count=%{public,signpost.telemetry:number1}lu) enableTelemetry=YES ", buf, 0xCu);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__EDMessageCategorizer_categorizeMessages_reason___block_invoke;
  aBlock[3] = &unk_1E6C01F40;
  os_signpost_id_t v37 = v8;
  id v12 = v6;
  id v36 = v12;
  uint64_t v13 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  id v34 = 0;
  BOOL v14 = [(EDMessageCategorizer *)self _categorizeMessages:v12 signpostID:v8 results:&v34 reason:a4];
  id v15 = v34;
  if ([v15 count])
  {
    id v16 = +[EDMessageCategorizer log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v39 = (uint64_t)v15;
      _os_log_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_DEFAULT, "Persisting categorization results map: %{public}@", buf, 0xCu);
    }

    id v17 = +[EDMessageCategorizer signpostLog];
    id v18 = v17;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      uint64_t v19 = [v15 count];
      *(_DWORD *)buf = 134349056;
      uint64_t v39 = v19;
      _os_signpost_emit_with_name_impl(&dword_1DB39C000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v8, "EDMessageCategorizationPersistResult", "Begin persisting categorization results (count=%{public,signpost.telemetry:number1}lu) enableTelemetry=YES ", buf, 0xCu);
    }

    v20 = [(EDMessageCategorizer *)self persistence];
    [v20 persistCategorizationResultMap:v15];

    id v21 = +[EDMessageCategorizer signpostLog];
    dispatch_queue_t v22 = v21;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      uint64_t v23 = [v15 count];
      *(_DWORD *)buf = 134349056;
      uint64_t v39 = v23;
      _os_signpost_emit_with_name_impl(&dword_1DB39C000, v22, OS_SIGNPOST_INTERVAL_END, v8, "EDMessageCategorizationPersistResult", "Finish persisting categorization results (count=%{public,signpost.telemetry:number1}lu) enableTelemetry=YES ", buf, 0xCu);
    }

    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    id v31 = __50__EDMessageCategorizer_categorizeMessages_reason___block_invoke_118;
    id v32 = &unk_1E6C02050;
    id v25 = v24;
    id v33 = v25;
    [v15 enumerateKeysAndObjectsUsingBlock:&v29];
    uint64_t v26 = +[EDMessageCategorizer log];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v39 = (uint64_t)v25;
      _os_log_impl(&dword_1DB39C000, v26, OS_LOG_TYPE_DEFAULT, "Biome donation of categorization results map: %{public}@", buf, 0xCu);
    }

    uint64_t v27 = [(EDMessageCategorizer *)self analyticsLogger];
    [v27 logReceiveEventForMessagesWithResult:v25];

    v13[2](v13, [v15 count]);
    BOOL v14 = 1;
  }
  else
  {
    v13[2](v13, 0);
  }

  return v14;
}

void __50__EDMessageCategorizer_categorizeMessages_reason___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = +[EDMessageCategorizer signpostLog];
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    uint64_t v7 = [*(id *)(a1 + 32) count];
    int v8 = 134349312;
    uint64_t v9 = v7;
    __int16 v10 = 2050;
    uint64_t v11 = a2;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v5, OS_SIGNPOST_INTERVAL_END, v6, "EDMessageCategorization", "Finish message categorization (count=%{public,signpost.telemetry:number1}lu, result=%{public,signpost.telemetry:number2}lu) enableTelemetry=YES ", (uint8_t *)&v8, 0x16u);
  }
}

void __50__EDMessageCategorizer_categorizeMessages_reason___block_invoke_118(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  os_signpost_id_t v6 = [v8 category];
  uint64_t v7 = [v6 state];

  if (v7 != 2) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v8];
  }
}

- (BOOL)_categorizeMessages:(id)a3 signpostID:(unint64_t)a4 results:(id *)a5 reason:(int64_t)a6
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  uint64_t v41 = [(EDMessageCategorizer *)self _messagesToCategorizeFromMessages:a3];
  if ([v41 count])
  {
    id v44 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v47 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v42 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v43 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v49 = [(EDMessageCategorizer *)self senderPersistence];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = v41;
    uint64_t v6 = [obj countByEnumeratingWithState:&v55 objects:v64 count:16];
    if (!v6) {
      goto LABEL_23;
    }
    uint64_t v7 = *(void *)v56;
    uint64_t v8 = *MEMORY[0x1E4F60CE8];
    while (1)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v56 != v7) {
          objc_enumerationMutation(obj);
        }
        __int16 v10 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        uint64_t v11 = [v10 senders];
        id v12 = [v11 firstObject];
        uint64_t v13 = [v12 emailAddressValue];
        BOOL v14 = [v13 simpleAddress];
        id v15 = v14;
        if (v14)
        {
          id v16 = v14;
        }
        else
        {
          id v16 = [v12 stringValue];
        }
        id v17 = v16;

        id v18 = [v17 lowercaseString];

        uint64_t v19 = [v49 userHasSentToSenderAddress:v18];
        if (v19)
        {
          if (v19 == 1)
          {
            if ((*(unsigned int (**)(uint64_t, void *))(v8 + 16))(v8, v18))
            {
              [v42 addObject:v18];
              v20 = v46;
            }
            else
            {
              id v21 = +[EDMessageCategorizer log];
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                LODWORD(buf) = 138412290;
                *(void *)((char *)&buf + 4) = v10;
                _os_log_error_impl(&dword_1DB39C000, v21, OS_LOG_TYPE_ERROR, "Found nil sender for message %@", (uint8_t *)&buf, 0xCu);
              }

              v20 = v46;
            }
          }
          else
          {
            if (v19 != 2) {
              goto LABEL_21;
            }
            [v44 addObject:v18];
            v20 = v47;
          }
        }
        else
        {
          [v43 addObject:v18];
          v20 = v45;
        }
        [v20 addObject:v10];
LABEL_21:
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v55 objects:v64 count:16];
      if (!v6)
      {
LABEL_23:

        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __70__EDMessageCategorizer__categorizeMessages_signpostID_results_reason___block_invoke;
        aBlock[3] = &unk_1E6C02078;
        void aBlock[4] = self;
        dispatch_queue_t v22 = (void (**)(void *, id, uint64_t))_Block_copy(aBlock);
        id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        if ([v47 count])
        {
          id v24 = v22[2](v22, v44, 1);
          BOOL v25 = [(EDMessageCategorizer *)self _categorizeMessages:v47 senderAttributes:v24 signpostID:a4 results:v23 reason:a6];

          if (!v25) {
            goto LABEL_37;
          }
        }
        if ([v46 count]
          && (v22[2](v22, v42, 0),
              uint64_t v26 = objc_claimAutoreleasedReturnValue(),
              BOOL v27 = [(EDMessageCategorizer *)self _categorizeMessages:v46 senderAttributes:v26 signpostID:a4 results:v23 reason:a6], v26, !v27))
        {
LABEL_37:
          BOOL v32 = 0;
        }
        else if ([v45 count])
        {
          id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          uint64_t v29 = v22[2](v22, v43, 1);
          if ([(EDMessageCategorizer *)self _categorizeMessages:v45 senderAttributes:v29 signpostID:a4 results:v28 reason:a6])
          {
            id v30 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            id v31 = objc_msgSend(v29, "ef_mapValues:", &__block_literal_global_127);
            BOOL v32 = [(EDMessageCategorizer *)self _categorizeMessages:v45 senderAttributes:v31 signpostID:a4 results:v30 reason:a6];
            if (v32)
            {
              *(void *)&long long buf = 0;
              *((void *)&buf + 1) = &buf;
              uint64_t v62 = 0x2020000000;
              uint64_t v63 = 0;
              v50[0] = MEMORY[0x1E4F143A8];
              v50[1] = 3221225472;
              v50[2] = __70__EDMessageCategorizer__categorizeMessages_signpostID_results_reason___block_invoke_4;
              v50[3] = &unk_1E6C020C0;
              id v51 = v30;
              id v52 = v23;
              p_long long buf = &buf;
              [v28 enumerateKeysAndObjectsUsingBlock:v50];
              id v33 = +[EDMessageCategorizer log];
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v34 = *(void *)(*((void *)&buf + 1) + 24);
                *(_DWORD *)long long v59 = 134217984;
                uint64_t v60 = v34;
                _os_log_impl(&dword_1DB39C000, v33, OS_LOG_TYPE_DEFAULT, "%lu messages with temporary categorization", v59, 0xCu);
              }

              _Block_object_dispose(&buf, 8);
            }
          }
          else
          {
            BOOL v32 = 0;
          }
        }
        else
        {
          BOOL v32 = 1;
        }
        if (a5)
        {
          if (v32) {
            v35 = v23;
          }
          else {
            v35 = 0;
          }
          *a5 = v35;
        }

        goto LABEL_47;
      }
    }
  }
  if (a5) {
    *a5 = 0;
  }
  LOBYTE(v32) = 1;
LABEL_47:

  return v32;
}

id __70__EDMessageCategorizer__categorizeMessages_signpostID_results_reason___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v16 = a2;
  id v5 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [v16 allObjects];
  uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        __int16 v10 = objc_msgSend(*(id *)(a1 + 32), "contactStore", v16);
        uint64_t v11 = [v10 contactExistsForEmailAddress:v9];

        id v12 = [*(id *)(a1 + 32) vipManager];
        uint64_t v13 = [v12 isVIPAddress:v9];

        BOOL v14 = [[_EDSenderAttributes alloc] initWithisVIP:v13 isContact:v11 isCoreRecent:0 isPrimarySender:a3];
        [v5 setObject:v14 forKey:v9];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  return v5;
}

_EDSenderAttributes *__70__EDMessageCategorizer__categorizeMessages_signpostID_results_reason___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = -[_EDSenderAttributes initWithisVIP:isContact:isCoreRecent:isPrimarySender:]([_EDSenderAttributes alloc], "initWithisVIP:isContact:isCoreRecent:isPrimarySender:", [v2 isVIP], objc_msgSend(v2, "isContact"), objc_msgSend(v2, "isCoreRecent"), objc_msgSend(v2, "isPrimarySender") ^ 1);

  return v3;
}

void __70__EDMessageCategorizer__categorizeMessages_signpostID_results_reason___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v14];
  uint64_t v7 = [v5 category];
  uint64_t v8 = [v6 category];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v14];
  }
  else
  {
    __int16 v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F60230]), "initWithType:subtype:isHighImpact:state:", objc_msgSend(v7, "type"), objc_msgSend(v7, "subtype"), objc_msgSend(v7, "isHighImpact"), 2);
    uint64_t v11 = [EDMessageCategorizationResult alloc];
    id v12 = [v5 metadata];
    uint64_t v13 = [(EDMessageCategorizationResult *)v11 initWithCategory:v10 metadata:v12];
    [*(id *)(a1 + 40) setObject:v13 forKeyedSubscript:v14];

    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
}

- (BOOL)_categorizeMessages:(id)a3 senderAttributes:(id)a4 signpostID:(unint64_t)a5 results:(id)a6 reason:(int64_t)a7
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v24 = a6;
  id v14 = [(EDMessageCategorizer *)self _transformBaseMessages:v12 senderAttributes:v13 signpostID:a5];
  +[EDCategoryPowerLog logStartCategorizationWithReason:a7];
  id v15 = +[EDMessageCategorizer signpostLog];
  id v16 = v15;
  if (a5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_DWORD *)long long buf = 134349056;
    uint64_t v30 = [v12 count];
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v16, OS_SIGNPOST_INTERVAL_BEGIN, a5, "EDMessageCategorizationMessageCategorizer", "Begin categorizer call (count=%{public,signpost.telemetry:number1}lu) enableTelemetry=YES ", buf, 0xCu);
  }

  +[EDCategoryPowerLog logStartCategorizationWithReason:a7];
  id v17 = [(EDMessageCategorizer *)self _categorizeMappedMessages:v14];
  +[EDCategoryPowerLog logStopCategorizationWithReason:count:](EDCategoryPowerLog, "logStopCategorizationWithReason:count:", a7, [v17 count]);
  long long v18 = +[EDMessageCategorizer signpostLog];
  long long v19 = v18;
  if (a5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    uint64_t v20 = [v12 count];
    uint64_t v21 = [v17 count];
    *(_DWORD *)long long buf = 134349312;
    uint64_t v30 = v20;
    __int16 v31 = 2050;
    uint64_t v32 = v21;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v19, OS_SIGNPOST_INTERVAL_END, a5, "EDMessageCategorizationMessageCategorizer", "Finish categorizer call (count=%{public,signpost.telemetry:number1}lu, result=%{public,signpost.telemetry:number2}lu) enableTelemetry=YES ", buf, 0x16u);
  }

  if (v17)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __87__EDMessageCategorizer__categorizeMessages_senderAttributes_signpostID_results_reason___block_invoke;
    v25[3] = &unk_1E6C020E8;
    uint64_t v26 = v17;
    BOOL v27 = self;
    id v28 = v24;
    [v14 enumerateKeysAndObjectsUsingBlock:v25];

    dispatch_queue_t v22 = v26;
  }
  else
  {
    dispatch_queue_t v22 = +[EDMessageCategorizer log];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[EDMessageCategorizer _categorizeMessages:senderAttributes:signpostID:results:reason:](v22);
    }
  }

  return v17 != 0;
}

void __87__EDMessageCategorizer__categorizeMessages_senderAttributes_signpostID_results_reason___block_invoke(id *a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [a1[4] objectForKeyedSubscript:a2];
  if (v6)
  {
    uint64_t v7 = [a1[5] _transformResult:v6];
    [a1[6] setObject:v7 forKeyedSubscript:v5];
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v8 = +[EDMessageCategorizer log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v5, "globalMessageID"));
        int v11 = 138543618;
        id v12 = v9;
        __int16 v13 = 2112;
        id v14 = v5;
        _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "Model did not categorize message with globalID:%{public}@ message:%@. Treating as non-commerce.", (uint8_t *)&v11, 0x16u);
      }
    }
    else
    {
      uint64_t v8 = +[EDMessageCategorizer log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        id v12 = v5;
        _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "Model did not categorize newly synced message:%@. Treating as non-commerce.", (uint8_t *)&v11, 0xCu);
      }
    }

    __int16 v10 = +[EDMessageCategorizer noneMessageCategorizationResult];
    [a1[6] setObject:v10 forKeyedSubscript:v5];
  }
}

- (id)_transformResult:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 categoryType];
  uint64_t v5 = [v3 subcategory];
  if (v5 > 15)
  {
    if (v5 > 63)
    {
      if (v5 == 64)
      {
        uint64_t v7 = 0;
        uint64_t v6 = 7;
        goto LABEL_15;
      }
      if (v5 != 128) {
        goto LABEL_22;
      }
      uint64_t v6 = 8;
    }
    else
    {
      if (v5 != 16)
      {
        if (v5 == 32)
        {
          uint64_t v7 = 0;
          uint64_t v6 = 1;
          goto LABEL_15;
        }
LABEL_22:
        uint64_t v7 = 0;
        uint64_t v6 = 0;
        goto LABEL_15;
      }
      uint64_t v6 = 6;
    }
LABEL_14:
    uint64_t v7 = 2;
    goto LABEL_15;
  }
  uint64_t v6 = 2;
  uint64_t v7 = 3;
  switch(v5)
  {
    case 1:
      break;
    case 2:
      uint64_t v6 = 3;
      goto LABEL_14;
    case 4:
      uint64_t v6 = 4;
      uint64_t v7 = 1;
      break;
    case 8:
      uint64_t v6 = 5;
      goto LABEL_14;
    default:
      goto LABEL_22;
  }
LABEL_15:
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F60230]) initWithType:v7 subtype:v6 isHighImpact:v4 == 2 state:1];
  if (v8)
  {
    int v9 = [EDMessageCategorizationResult alloc];
    __int16 v10 = [v3 metadata];
    int v11 = [(EDMessageCategorizationResult *)v9 initWithCategory:v8 metadata:v10];
  }
  else
  {
    int v11 = 0;
  }

  return v11;
}

+ (id)queryForMessagesToCategorizeForVersion:(int64_t)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v3 = +[EDMessageListItemPredicates predicateForCategorizationVersionLessThanVersion:a3];
  uint64_t v4 = +[EDMessageListItemPredicates predicateForNilModelVersion];
  uint64_t v5 = (void *)MEMORY[0x1E4F28BA0];
  v20[0] = v4;
  v20[1] = v3;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  uint64_t v7 = [v5 orPredicateWithSubpredicates:v6];

  uint64_t v8 = [MEMORY[0x1E4F60390] predicateForMessagesInMailboxWithType:7];
  int v9 = (void *)MEMORY[0x1E4F28BA0];
  v19[0] = v7;
  v19[1] = v8;
  __int16 v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  int v11 = [v9 andPredicateWithSubpredicates:v10];

  id v12 = objc_alloc(MEMORY[0x1E4F60418]);
  uint64_t v13 = objc_opt_class();
  id v14 = [MEMORY[0x1E4F60390] sortDescriptorForDateAscending:0];
  long long v18 = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  id v16 = (void *)[v12 initWithTargetClass:v13 predicate:v11 sortDescriptors:v15];

  return v16;
}

- (id)_messagesToCategorizeFromMessages:(id)a3
{
  id v3 = objc_msgSend(a3, "ef_filter:", &__block_literal_global_140);

  return v3;
}

uint64_t __58__EDMessageCategorizer__messagesToCategorizeFromMessages___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 mailbox];
  uint64_t v4 = [v3 type];

  if (v4 == 7)
  {
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v6 = [v2 labels];
    uint64_t v5 = objc_msgSend(v6, "ef_any:", &__block_literal_global_143);
  }
  return v5;
}

uint64_t __58__EDMessageCategorizer__messagesToCategorizeFromMessages___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 labelName];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F60618]];

  return v3;
}

- (id)_categorizeMappedMessages:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v6 = objc_alloc_init(getMCCSecretAgentControllerClass_1());
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__EDMessageCategorizer__categorizeMappedMessages___block_invoke;
  v12[3] = &unk_1E6C020E8;
  id v7 = v5;
  id v13 = v7;
  id v14 = self;
  id v15 = v6;
  id v8 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v12];
  int v9 = v15;
  id v10 = v7;

  return v10;
}

void __50__EDMessageCategorizer__categorizeMappedMessages___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v53 = a3;
  id v6 = (void *)MEMORY[0x1E0190280]();
  id v7 = [v5 fromAddress];
  id v8 = [v7 emailAddressValue];

  if (v8)
  {
    int v9 = [v5 senderMetadata];
    if (v9)
    {
      id v10 = +[EDMessageCategorizer log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        if ([v9 isVIP]) {
          id v46 = "true";
        }
        else {
          id v46 = "false";
        }
        id v52 = v46;
        if ([v9 isContact]) {
          id v47 = "true";
        }
        else {
          id v47 = "false";
        }
        int v48 = [v9 isUnsubscribeHeaderPresent];
        int v49 = [v9 isPrimarySender];
        if (v48) {
          uint64_t v50 = "true";
        }
        else {
          uint64_t v50 = "false";
        }
        *(_DWORD *)long long buf = 138544386;
        if (v49) {
          id v51 = "true";
        }
        else {
          id v51 = "false";
        }
        long long v61 = v8;
        __int16 v62 = 2080;
        uint64_t v63 = v52;
        __int16 v64 = 2080;
        uint64_t v65 = v47;
        __int16 v66 = 2080;
        uint64_t v67 = v50;
        __int16 v68 = 2080;
        v69 = v51;
        _os_log_debug_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEBUG, "Sender %{public}@ isVIP: %s isContact: %s unsubPresent: %s isPrimarySender: %s", buf, 0x34u);
      }

      id v11 = objc_alloc_init(getMCCCategoryContextClass());
      uint64_t v12 = [v8 displayName];
      id v13 = (void *)v12;
      if (v12) {
        id v14 = (__CFString *)v12;
      }
      else {
        id v14 = &stru_1F3583658;
      }
      [v11 setSenderName:v14];

      id v15 = v8;
      id v16 = [v15 emailAddressValue];
      id v17 = [v16 simpleAddress];
      long long v18 = v17;
      if (v17)
      {
        id v19 = v17;
      }
      else
      {
        id v19 = [v15 stringValue];
      }
      v35 = v19;

      [v11 setSenderEmail:v35];
      id v36 = [v5 subject];
      [v11 setEmailSubject:v36];

      objc_msgSend(v11, "setIsUnsubscribeHeaderPresent:", objc_msgSend(v9, "isUnsubscribeHeaderPresent"));
      objc_msgSend(v11, "setIsSenderVIP:", objc_msgSend(v9, "isVIP"));
      objc_msgSend(v11, "setIsSenderInAddressBook:", objc_msgSend(v9, "isContact"));
      [v11 setIsSenderRecentContact:0];
      objc_msgSend(v11, "setIsSenderPrimary:", objc_msgSend(v9, "isPrimarySender"));
      os_signpost_id_t v37 = [*(id *)(a1 + 40) _stableEmailAddressForMessage:v53];
      [v11 setReceiverEmail:v37];

      v38 = [v53 account];
      uint64_t v39 = [v38 systemAccount];
      uint64_t v40 = [v39 accountPropertyForKey:@"kMCCCategoryIsNonPersonalAccountKey"];
      objc_msgSend(v11, "setIsNonPersonalAccount:", objc_msgSend(v40, "BOOLValue"));

      uint64_t v41 = +[EDMessageCategorizer log];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        id v42 = [v11 receiverEmail];
        __50__EDMessageCategorizer__categorizeMappedMessages___block_invoke_cold_3(v42, [v11 isNonPersonalAccount], buf, v41);
      }

      id v43 = *(void **)(a1 + 48);
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __50__EDMessageCategorizer__categorizeMappedMessages___block_invoke_150;
      v54[3] = &unk_1E6C02150;
      id v55 = *(id *)(a1 + 32);
      id v44 = v5;
      uint64_t v45 = *(void *)(a1 + 40);
      id v56 = v44;
      uint64_t v57 = v45;
      id v58 = v15;
      id v59 = v9;
      [v43 predictCommerceEmailWithContext:v11 completion:v54];
    }
    else
    {
      id v28 = +[EDMessageCategorizer log];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        __50__EDMessageCategorizer__categorizeMappedMessages___block_invoke_cold_2((uint64_t)v8, v28, v29, v30, v31, v32, v33, v34);
      }

      id v11 = (id)[objc_alloc(MEMORY[0x1E4F73A50]) initWithCategoryType:0 subCategoryType:16 metadata:0];
      [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v5];
    }
  }
  else
  {
    uint64_t v20 = +[EDMessageCategorizer log];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      __50__EDMessageCategorizer__categorizeMappedMessages___block_invoke_cold_1(v20, v21, v22, v23, v24, v25, v26, v27);
    }

    int v9 = (void *)[objc_alloc(MEMORY[0x1E4F73A50]) initWithCategoryType:1 subCategoryType:1 metadata:0];
    [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v5];
  }
}

void __50__EDMessageCategorizer__categorizeMappedMessages___block_invoke_150(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [*(id *)(a1 + 48) _makeCategorizationResultFromPrediction:v5];
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  else
  {
    id v8 = +[EDMessageCategorizer log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = objc_msgSend(v6, "ef_publicDescription");
      uint64_t v10 = *(void *)(a1 + 56);
      int v11 = [*(id *)(a1 + 64) isVIP];
      int v12 = [*(id *)(a1 + 64) isContact];
      int v13 = [*(id *)(a1 + 64) isUnsubscribeHeaderPresent];
      int v14 = [*(id *)(a1 + 64) isPrimarySender];
      int v15 = 138544642;
      id v16 = v9;
      __int16 v17 = 2114;
      uint64_t v18 = v10;
      __int16 v19 = 1024;
      int v20 = v11;
      __int16 v21 = 1024;
      int v22 = v12;
      __int16 v23 = 1024;
      int v24 = v13;
      __int16 v25 = 1024;
      int v26 = v14;
      _os_log_error_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_ERROR, "Failed to categorize message with error %{public}@ sender %{public}@ isVIP: %{BOOL}d isContact: %{BOOL}d unsubPresent: %{BOOL}d isPrimarySender: %{BOOL}d", (uint8_t *)&v15, 0x2Eu);
    }
  }
}

- (id)_stableEmailAddressForMessage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 account];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [v3 account];
    uint64_t v7 = [v6 firstEmailAddress];
  }
  else
  {
    id v8 = [v3 account];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v6 = [v3 account];
      uint64_t v7 = [v6 canonicalEmailAddress];
    }
    else
    {
      uint64_t v10 = [v3 account];
      id v6 = [v10 emailAddressStrings];

      if ((unint64_t)[v6 count] >= 2)
      {
        int v11 = [v6 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];
        int v12 = [v11 firstObject];

        goto LABEL_9;
      }
      uint64_t v7 = [v6 firstObject];
    }
  }
  int v12 = (void *)v7;
LABEL_9:

  return v12;
}

- (id)_makeCategorizationResultFromPrediction:(id)a3
{
  id v4 = a3;
  char v5 = [(EDMessageCategorizer *)self _makeCategorizationResultMetadataFromPrediction:v4];
  id v6 = getkDecisionSubCategoryKey();
  uint64_t v7 = [v4 objectForKey:v6];
  unint64_t v8 = [(EDMessageCategorizer *)self _subCategoryFor:v7];

  char v9 = getkDecisionTimeSensitiveKey();
  uint64_t v10 = [v4 objectForKey:v9];
  LODWORD(v7) = [v10 BOOLValue];

  id v11 = objc_alloc(MEMORY[0x1E4F73A50]);
  if (v7) {
    uint64_t v12 = 2;
  }
  else {
    uint64_t v12 = v8 != 32;
  }
  int v13 = (void *)[v11 initWithCategoryType:v12 subCategoryType:v8 metadata:v5];

  return v13;
}

- (id)_makeCategorizationResultMetadataFromPrediction:(id)a3
{
  id v39 = a3;
  id v3 = getkDecisionScoreKey();
  id v4 = [v39 objectForKey:v3];
  [v4 doubleValue];
  double v6 = v5;

  uint64_t v7 = getkDecisionSenderScoreKey();
  unint64_t v8 = [v39 objectForKey:v7];
  [v8 doubleValue];
  double v10 = v9;

  id v11 = getkDecisionTSScoreKey();
  uint64_t v12 = [v39 objectForKey:v11];
  [v12 doubleValue];
  double v14 = v13;

  id v15 = objc_alloc(MEMORY[0x1E4F73A58]);
  v38 = getkDecisionReasonCodesKey();
  uint64_t v40 = [v39 objectForKey:v38];
  os_signpost_id_t v37 = getkDecisionBPModelVersionKey();
  id v16 = [v39 objectForKey:v37];
  id v36 = getkDecisionBPSenderModelVersionKey();
  __int16 v17 = [v39 objectForKey:v36];
  v35 = getkDecisionBPTSModelVersionKey();
  uint64_t v18 = [v39 objectForKey:v35];
  uint64_t v34 = getkDecisionBPFinalRuleModelVersionKey();
  uint64_t v33 = [v39 objectForKey:v34];
  uint64_t v32 = getkDecisionBPExperimentIdKey();
  uint64_t v31 = [v39 objectForKey:v32];
  uint64_t v30 = getkDecisionBPExperimentDeploymentIdKey();
  uint64_t v29 = [v39 objectForKey:v30];
  id v28 = getkDecisionBPTreatmentIdKey();
  uint64_t v27 = [v39 objectForKey:v28];
  int v26 = getkDecisionBPRolloutIdKey();
  __int16 v25 = [v39 objectForKey:v26];
  int v24 = getkDecisionBPRolloutDeploymentIdKey();
  __int16 v19 = [v39 objectForKey:v24];
  int v20 = getkDecisionBPRolloutFactorPackIdKey();
  __int16 v21 = [v39 objectForKey:v20];
  id v23 = (id)[v15 initWithScore:v40 senderScore:v16 tsScore:v17 reasonCodes:v18 modelVersion:v33 senderModelVersion:v31 tsModelVersion:v6 finalRuleVersion:v10 experimentID:v14 experimentDeploymentID:v29 experimentTreatmentID:v27 rolloutID:v25 rolloutDeploymentID:v19 rolloutFactorPackID:v21];

  return v23;
}

- (unint64_t)_subCategoryFor:(id)a3
{
  id v3 = a3;
  if ([v3 caseInsensitiveCompare:@"personal"])
  {
    if ([v3 caseInsensitiveCompare:@"promotions"])
    {
      if ([v3 caseInsensitiveCompare:@"social"])
      {
        if ([v3 caseInsensitiveCompare:@"transactions"])
        {
          if ([v3 caseInsensitiveCompare:@"news"])
          {
            if ([v3 caseInsensitiveCompare:@"unsupported_language"])
            {
              if ([v3 caseInsensitiveCompare:@"nop_sa"])
              {
                if ([v3 caseInsensitiveCompare:@"others"])
                {
                  id v4 = +[EDMessageCategorizer log];
                  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
                    -[EDMessageCategorizer _subCategoryFor:]((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
                  }
                }
                unint64_t v11 = 16;
              }
              else
              {
                unint64_t v11 = 128;
              }
            }
            else
            {
              unint64_t v11 = 64;
            }
          }
          else
          {
            unint64_t v11 = 8;
          }
        }
        else
        {
          unint64_t v11 = 4;
        }
      }
      else
      {
        unint64_t v11 = 2;
      }
    }
    else
    {
      unint64_t v11 = 1;
    }
  }
  else
  {
    unint64_t v11 = 32;
  }

  return v11;
}

- (EMVIPManager)vipManager
{
  return self->_vipManager;
}

- (EMCachingContactStore)contactStore
{
  return self->_contactStore;
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setProcessingQueue:(id)a3
{
}

- (EDCategoryPersistence)persistence
{
  return self->_persistence;
}

- (void)setPersistence:(id)a3
{
}

- (EDInteractionEventLog)eventLog
{
  return self->_eventLog;
}

- (void)setEventLog:(id)a3
{
}

- (NSConditionLock)categorizationState
{
  return self->_categorizationState;
}

- (EDCategoryCoreAnalyticsLogger)analyticsLogger
{
  return self->_analyticsLogger;
}

- (void)setAnalyticsLogger:(id)a3
{
}

- (EDSenderPersistence)senderPersistence
{
  return self->_senderPersistence;
}

- (void)setSenderPersistence:(id)a3
{
}

- (ECDKIMVerifier)verifier
{
  return self->_verifier;
}

- (EMNSUserDefaultsBoolObserver)automaticallySummarizeMessages
{
  return self->_automaticallySummarizeMessages;
}

- (void)setAutomaticallySummarizeMessages:(id)a3
{
}

- (EFLocked)messagesWithCategorization
{
  return self->_messagesWithCategorization;
}

- (void)setMessagesWithCategorization:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagesWithCategorization, 0);
  objc_storeStrong((id *)&self->_automaticallySummarizeMessages, 0);
  objc_storeStrong((id *)&self->_verifier, 0);
  objc_storeStrong((id *)&self->_senderPersistence, 0);
  objc_storeStrong((id *)&self->_analyticsLogger, 0);
  objc_storeStrong((id *)&self->_categorizationState, 0);
  objc_storeStrong((id *)&self->_eventLog, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);

  objc_storeStrong((id *)&self->_vipManager, 0);
}

- (void)_categorizeMessages:(os_log_t)log senderAttributes:signpostID:results:reason:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Categorizer failed to categorize messages", v1, 2u);
}

void __50__EDMessageCategorizer__categorizeMappedMessages___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __50__EDMessageCategorizer__categorizeMappedMessages___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __50__EDMessageCategorizer__categorizeMappedMessages___block_invoke_cold_3(void *a1, char a2, uint8_t *buf, os_log_t log)
{
  uint64_t v5 = "false";
  if (a2) {
    uint64_t v5 = "true";
  }
  *(_DWORD *)long long buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2080;
  *(void *)(buf + 14) = v5;
  _os_log_debug_impl(&dword_1DB39C000, log, OS_LOG_TYPE_DEBUG, "Recipient %{public}@ isNotPersonal: %s", buf, 0x16u);
}

- (void)_subCategoryFor:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end