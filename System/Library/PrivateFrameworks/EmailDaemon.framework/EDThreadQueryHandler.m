@interface EDThreadQueryHandler
+ (OS_os_log)log;
- (BOOL)isStarted;
- (BOOL)start;
- (EDMessagePersistence)messagePersistence;
- (EDPersistenceHookRegistry)hookRegistry;
- (EDRemindMeNotificationController)remindMeNotificationController;
- (EDResumable)observerResumer;
- (EDSearchProvider)searchProvider;
- (EDThreadPersistence)threadPersistence;
- (EDThreadQueryHandler)initWithQuery:(id)a3 messagePersistence:(id)a4 threadPersistence:(id)a5 hookRegistry:(id)a6 vipManager:(id)a7 searchProvider:(id)a8 remindMeNotificationController:(id)a9 observer:(id)a10 observationIdentifier:(id)a11 helperObserver:(id)a12 delegate:(id)a13 observationResumer:(id)a14;
- (EDThreadQueryHandlerDelegate)delegate;
- (EDVIPManager)vipManager;
- (EFLocked)underlyingHandler;
- (EMMessageListItemQueryResultsObserver)resultsObserver;
- (EMMessageQueryHelperObserver_xpc)helperObserver;
- (EMObjectID)observationIdentifier;
- (EMQuery)query;
- (EMThreadScope)threadScope;
- (id)_addSnippetHintsToExtraInfo:(id)a3;
- (id)inMemoryMessageObjectIDsForThread:(id)a3;
- (id)messageListItemForObjectID:(id)a3 isPersisted:(BOOL *)a4 error:(id *)a5;
- (id)messageReconciliationQueries;
- (id)messagesInConversationIDs:(id)a3 limit:(int64_t)a4;
- (id)threadReconciliationQueries;
- (void)_createUnderlyingHandlerIfNeededAndStart;
- (void)_tearDownWithQueryHandlerBlock:(id)a3;
- (void)cancel;
- (void)observer:(id)a3 matchedAddedObjectIDs:(id)a4 after:(id)a5 extraInfo:(id)a6;
- (void)observer:(id)a3 matchedAddedObjectIDs:(id)a4 before:(id)a5 extraInfo:(id)a6;
- (void)observer:(id)a3 matchedChangesForObjectIDs:(id)a4;
- (void)observer:(id)a3 matchedDeletedObjectIDs:(id)a4;
- (void)observer:(id)a3 matchedMovedObjectIDs:(id)a4 after:(id)a5 extraInfo:(id)a6;
- (void)observer:(id)a3 matchedMovedObjectIDs:(id)a4 before:(id)a5 extraInfo:(id)a6;
- (void)observer:(id)a3 matchedOldestItemsUpdatedForMailboxes:(id)a4;
- (void)observer:(id)a3 replacedExistingObjectID:(id)a4 withNewObjectID:(id)a5;
- (void)observer:(id)a3 wasUpdated:(id)a4;
- (void)observerDidFinishInitialLoad:(id)a3;
- (void)observerDidFinishRemoteSearch:(id)a3;
- (void)observerWillRestart:(id)a3;
- (void)persistenceDidResetThreadScope:(id)a3;
- (void)requestSummaryForMessageObjectID:(id)a3;
- (void)tearDown;
- (void)test_tearDown;
- (void)threadMigratorDidComplete:(id)a3;
@end

@implementation EDThreadQueryHandler

- (EDThreadQueryHandler)initWithQuery:(id)a3 messagePersistence:(id)a4 threadPersistence:(id)a5 hookRegistry:(id)a6 vipManager:(id)a7 searchProvider:(id)a8 remindMeNotificationController:(id)a9 observer:(id)a10 observationIdentifier:(id)a11 helperObserver:(id)a12 delegate:(id)a13 observationResumer:(id)a14
{
  id v47 = a3;
  id v31 = a4;
  id v46 = a4;
  id v32 = a5;
  id v43 = a5;
  id v33 = a6;
  id v42 = a6;
  id v41 = a7;
  id v40 = a8;
  id v39 = a9;
  id v38 = a10;
  id v37 = a11;
  id v36 = a12;
  id v45 = a13;
  id v35 = a14;
  v48.receiver = self;
  v48.super_class = (Class)EDThreadQueryHandler;
  v19 = [(EDThreadQueryHandler *)&v48 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_query, a3);
    v21 = (void *)MEMORY[0x1E4F60390];
    v22 = [v47 predicate];
    v23 = [v46 mailboxPersistence];
    uint64_t v24 = [v21 threadScopeForPredicate:v22 withMailboxTypeResolver:v23];
    threadScope = v20->_threadScope;
    v20->_threadScope = (EMThreadScope *)v24;

    objc_storeStrong((id *)&v20->_messagePersistence, v31);
    objc_storeStrong((id *)&v20->_threadPersistence, v32);
    objc_storeStrong((id *)&v20->_hookRegistry, v33);
    objc_storeStrong((id *)&v20->_vipManager, a7);
    objc_storeStrong((id *)&v20->_searchProvider, a8);
    objc_storeStrong((id *)&v20->_remindMeNotificationController, a9);
    objc_storeStrong((id *)&v20->_resultsObserver, a10);
    objc_storeStrong((id *)&v20->_observationIdentifier, a11);
    objc_storeStrong((id *)&v20->_helperObserver, a12);
    id v26 = objc_alloc(MEMORY[0x1E4F60DA0]);
    v27 = objc_alloc_init(_EDThreadQueryUnderlyingHandlers);
    uint64_t v28 = [v26 initWithObject:v27];
    underlyingHandler = v20->_underlyingHandler;
    v20->_underlyingHandler = (EFLocked *)v28;

    objc_storeWeak((id *)&v20->_delegate, v45);
    objc_storeStrong((id *)&v20->_observerResumer, a14);
  }

  return v20;
}

- (void)observer:(id)a3 matchedAddedObjectIDs:(id)a4 before:(id)a5 extraInfo:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = +[EDThreadQueryHandler log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[EDThreadQueryHandler observer:matchedAddedObjectIDs:before:extraInfo:]();
  }

  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy__44;
  id v37 = __Block_byref_object_dispose__44;
  id v38 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = -86;
  v15 = [(EDThreadQueryHandler *)self underlyingHandler];
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __72__EDThreadQueryHandler_observer_matchedAddedObjectIDs_before_extraInfo___block_invoke;
  uint64_t v24 = &unk_1E6C076D8;
  v27 = &v33;
  uint64_t v28 = &v29;
  v25 = self;
  id v16 = v10;
  id v26 = v16;
  [v15 performWhileLocked:&v21];

  if (*((unsigned char *)v30 + 24))
  {
    objc_msgSend((id)v34[5], "addObjectIDsToMigrate:", v11, v21, v22, v23, v24, v25);
    if (_os_feature_enabled_impl())
    {
      v17 = [(EDThreadQueryHandler *)self _addSnippetHintsToExtraInfo:v13];
      v18 = [(EDThreadQueryHandler *)self resultsObserver];
      v19 = [(EDThreadQueryHandler *)self observationIdentifier];
      [v18 observer:v19 matchedAddedObjectIDs:v11 before:v12 extraInfo:v17];
    }
    else
    {
      v17 = [(EDThreadQueryHandler *)self resultsObserver];
      v20 = [(EDThreadQueryHandler *)self observationIdentifier];
      [v17 observer:v20 matchedAddedObjectIDs:v11 before:v12 extraInfo:v13];
    }
  }
  else
  {
    v17 = +[EDThreadQueryHandler log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v40 = self;
      _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_DEFAULT, "%p: Observer callback from unknown (old?) underlying handler.", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
}

- (EFLocked)underlyingHandler
{
  return self->_underlyingHandler;
}

- (EMObjectID)observationIdentifier
{
  return self->_observationIdentifier;
}

- (EMMessageListItemQueryResultsObserver)resultsObserver
{
  return self->_resultsObserver;
}

- (id)_addSnippetHintsToExtraInfo:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  v4 = [MEMORY[0x1E4F29060] currentThread];
  v27 = self;
  v5 = [v4 threadDictionary];
  uint64_t v6 = *MEMORY[0x1E4F5FD98];
  uint64_t v29 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F5FD98]];

  v7 = [MEMORY[0x1E4F29060] currentThread];
  v8 = [v7 threadDictionary];
  [v8 setObject:0 forKeyedSubscript:v6];

  if (v29)
  {
    v9 = objc_opt_new();
    id v10 = objc_opt_new();
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v11 = v29;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v34 != v13) {
            objc_enumerationMutation(v11);
          }
          v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          id v16 = [v15 snippetHints];
          v17 = [v15 searchableItemIdentifier];
          [v9 setObject:v16 forKeyedSubscript:v17];

          v18 = [v15 searchableItemIdentifier];
          [v10 addObject:v18];
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v12);
    }

    v19 = [(EDThreadQueryHandler *)v27 messagePersistence];
    v20 = [v19 messageObjectIDsForSearchableItemIdentifiers:v10];

    uint64_t v21 = [v20 second];
    uint64_t v22 = objc_opt_new();
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __52__EDThreadQueryHandler__addSnippetHintsToExtraInfo___block_invoke;
    v30[3] = &unk_1E6BFFC68;
    id v23 = v21;
    id v31 = v23;
    id v24 = v22;
    id v32 = v24;
    [v9 enumerateKeysAndObjectsUsingBlock:v30];
    id v25 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v28];
    [v25 setObject:v24 forKeyedSubscript:v6];
  }
  else
  {
    id v25 = v28;
  }

  return v25;
}

void __64__EDThreadQueryHandler__createUnderlyingHandlerIfNeededAndStart__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__EDThreadQueryHandler__createUnderlyingHandlerIfNeededAndStart__block_invoke_2;
  aBlock[3] = &unk_1E6C07578;
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  long long v87 = *(_OWORD *)(a1 + 48);
  id v85 = v4;
  uint64_t v86 = v5;
  uint64_t v6 = (void (**)(void *, void))_Block_copy(aBlock);
  uint64_t v77 = MEMORY[0x1E4F143A8];
  uint64_t v78 = 3221225472;
  v79 = __64__EDThreadQueryHandler__createUnderlyingHandlerIfNeededAndStart__block_invoke_3;
  v80 = &unk_1E6C075A0;
  id v7 = v4;
  long long v83 = *(_OWORD *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 32);
  id v81 = v7;
  uint64_t v82 = v8;
  v9 = (void (**)(void))_Block_copy(&v77);
  id v10 = objc_msgSend(*(id *)(a1 + 32), "query", v77, v78, v79, v80);
  char v11 = [v10 queryOptions];

  if ((v11 & 0x22) != 0)
  {
LABEL_2:
    uint64_t v12 = +[EDThreadQueryHandler log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      v89 = v13;
      _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_DEFAULT, "%p: thread scope state: use in-memory", buf, 0xCu);
    }

    v6[2](v6, 0);
    goto LABEL_5;
  }
  v27 = [*(id *)(a1 + 32) query];
  unint64_t v28 = [v27 queryOptions];

  uint64_t v29 = [*(id *)(a1 + 32) threadPersistence];
  v30 = [*(id *)(a1 + 32) threadScope];
  uint64_t v31 = [v29 persistenceStateForThreadScope:v30 wantsPrecomputed:(v28 >> 12) & 1];

  if (v31 == 2)
  {
    v67 = +[EDThreadQueryHandler log];
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      v68 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      v89 = v68;
      _os_log_impl(&dword_1DB39C000, v67, OS_LOG_TYPE_DEFAULT, "%p: thread scope state: perform migration", buf, 0xCu);
    }

    v6[2](v6, 1);
    v69 = [EDThreadMigrator alloc];
    v70 = [*(id *)(a1 + 32) threadScope];
    v71 = [*(id *)(a1 + 32) threadPersistence];
    uint64_t v72 = [(EDThreadMigrator *)v69 initWithThreadScope:v70 threadPersistence:v71 queryHandler:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) delegate:*(void *)(a1 + 32)];
    uint64_t v73 = *(void *)(*(void *)(a1 + 80) + 8);
    v74 = *(void **)(v73 + 40);
    *(void *)(v73 + 40) = v72;
  }
  else
  {
    if (v31 != 1)
    {
      if (v31) {
        goto LABEL_5;
      }
      goto LABEL_2;
    }
    v75 = +[EDThreadQueryHandler log];
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      v76 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      v89 = v76;
      _os_log_impl(&dword_1DB39C000, v75, OS_LOG_TYPE_DEFAULT, "%p: thread scope state: use pre-computed", buf, 0xCu);
    }

    v9[2](v9);
  }
LABEL_5:
  v14 = +[EDThreadQueryHandler log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(void **)(a1 + 32);
    id v16 = [v15 query];
    v17 = [*(id *)(a1 + 32) observationIdentifier];
    *(_DWORD *)buf = 134218498;
    v89 = v15;
    __int16 v90 = 2114;
    v91 = v16;
    __int16 v92 = 2114;
    v93 = v17;
    _os_log_impl(&dword_1DB39C000, v14, OS_LOG_TYPE_DEFAULT, "%p: Creating implementations for thread query handler; query: {%{public}@}, observation identifier: {%{public}@}",
      buf,
      0x20u);
  }
  v18 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  v19 = [v7 inMemoryQueryHandler];
  LOBYTE(v18) = v18 == v19;

  if (v18)
  {
    id v32 = [v7 inMemoryQueryHandler];

    if (v32)
    {
      long long v33 = +[EDThreadQueryHandler log];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        long long v34 = *(void **)(a1 + 32);
        long long v35 = [v7 inMemoryQueryHandler];
        *(_DWORD *)buf = 134218240;
        v89 = v34;
        __int16 v90 = 2048;
        v91 = v35;
        _os_log_impl(&dword_1DB39C000, v33, OS_LOG_TYPE_DEFAULT, "%p Keeping existing in-memory query handler %p", buf, 0x16u);
      }
    }
  }
  else
  {
    v20 = +[EDThreadQueryHandler log];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = *(void **)(a1 + 32);
      uint64_t v22 = [v7 inMemoryQueryHandler];
      id v23 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 134218496;
      v89 = v21;
      __int16 v90 = 2048;
      v91 = v22;
      __int16 v92 = 2048;
      v93 = v23;
      _os_log_impl(&dword_1DB39C000, v20, OS_LOG_TYPE_DEFAULT, "%p: Replacing in-memory query handler %p -> %p", buf, 0x20u);
    }
    id v24 = [v7 inMemoryQueryHandler];

    if (v24)
    {
      id v25 = *(void **)(a1 + 40);
      id v26 = [v7 inMemoryQueryHandler];
      [v25 addObject:v26];
    }
    [v7 setInMemoryQueryHandler:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    [v7 setInMemoryObservationID:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
  }
  long long v36 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  id v37 = [v7 precomputedQueryHandler];
  LOBYTE(v36) = v36 == v37;

  if (v36)
  {
    id v45 = [v7 precomputedQueryHandler];

    if (v45)
    {
      id v46 = +[EDThreadQueryHandler log];
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        id v47 = *(void **)(a1 + 32);
        objc_super v48 = [v7 precomputedQueryHandler];
        *(_DWORD *)buf = 134218240;
        v89 = v47;
        __int16 v90 = 2048;
        v91 = v48;
        _os_log_impl(&dword_1DB39C000, v46, OS_LOG_TYPE_DEFAULT, "%p: Keeping existing pre-computed query handler %p", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v38 = +[EDThreadQueryHandler log];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      id v39 = *(void **)(a1 + 32);
      id v40 = [v7 precomputedQueryHandler];
      uint64_t v41 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      *(_DWORD *)buf = 134218496;
      v89 = v39;
      __int16 v90 = 2048;
      v91 = v40;
      __int16 v92 = 2048;
      v93 = v41;
      _os_log_impl(&dword_1DB39C000, v38, OS_LOG_TYPE_DEFAULT, "%p: Replacing pre-computed query handler %p -> %p", buf, 0x20u);
    }
    id v42 = [v7 precomputedQueryHandler];

    if (v42)
    {
      id v43 = *(void **)(a1 + 40);
      v44 = [v7 precomputedQueryHandler];
      [v43 addObject:v44];
    }
    [v7 setPrecomputedQueryHandler:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
    [v7 setPrecomputedObservationID:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
  {
    v49 = [v7 threadMigrator];

    if (v49)
    {
      v50 = +[EDThreadQueryHandler log];
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        v51 = *(void **)(a1 + 32);
        v52 = [v7 threadMigrator];
        v53 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
        *(_DWORD *)buf = 134218496;
        v89 = v51;
        __int16 v90 = 2048;
        v91 = v52;
        __int16 v92 = 2048;
        v93 = v53;
        _os_log_impl(&dword_1DB39C000, v50, OS_LOG_TYPE_DEFAULT, "%p: Replacing thread migrator %p -> %p", buf, 0x20u);
      }
      uint64_t v54 = [v7 threadMigrator];
      uint64_t v55 = *(void *)(*(void *)(a1 + 96) + 8);
      v56 = *(NSObject **)(v55 + 40);
      *(void *)(v55 + 40) = v54;
    }
    else
    {
      v56 = +[EDThreadQueryHandler log];
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        v65 = *(void **)(a1 + 32);
        v66 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
        *(_DWORD *)buf = 134218240;
        v89 = v65;
        __int16 v90 = 2048;
        v91 = v66;
        _os_log_impl(&dword_1DB39C000, v56, OS_LOG_TYPE_DEFAULT, "%p: Creating new thread migrator %p", buf, 0x16u);
      }
    }

    uint64_t v64 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
LABEL_43:
    [v7 setThreadMigrator:v64];
    goto LABEL_44;
  }
  v57 = [v7 threadMigrator];

  if (v57)
  {
    v58 = +[EDThreadQueryHandler log];
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      v59 = *(void **)(a1 + 32);
      v60 = [v7 threadMigrator];
      *(_DWORD *)buf = 134218240;
      v89 = v59;
      __int16 v90 = 2048;
      v91 = v60;
      _os_log_impl(&dword_1DB39C000, v58, OS_LOG_TYPE_DEFAULT, "%p: Removing thread migrator %p", buf, 0x16u);
    }
    uint64_t v61 = [v7 threadMigrator];
    uint64_t v62 = *(void *)(*(void *)(a1 + 96) + 8);
    v63 = *(void **)(v62 + 40);
    *(void *)(v62 + 40) = v61;

    uint64_t v64 = 0;
    goto LABEL_43;
  }
LABEL_44:
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__EDThreadQueryHandler_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_95 != -1) {
    dispatch_once(&log_onceToken_95, block);
  }
  v2 = (void *)log_log_95;

  return (OS_os_log *)v2;
}

- (EMQuery)query
{
  return self->_query;
}

- (EMThreadScope)threadScope
{
  return self->_threadScope;
}

- (EDThreadPersistence)threadPersistence
{
  return self->_threadPersistence;
}

void __64__EDThreadQueryHandler__createUnderlyingHandlerIfNeededAndStart__block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) precomputedQueryHandler];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) precomputedObservationID];
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    uint64_t v6 = [*(id *)(a1 + 32) precomputedQueryHandler];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F60400]) initAsEphemeralID:1];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    char v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    uint64_t v12 = [EDPrecomputedThreadQueryHandler alloc];
    uint64_t v24 = [*(id *)(a1 + 40) query];
    uint64_t v13 = [*(id *)(a1 + 40) threadScope];
    v14 = [*(id *)(a1 + 40) messagePersistence];
    v15 = [*(id *)(a1 + 40) threadPersistence];
    id v16 = [*(id *)(a1 + 40) hookRegistry];
    v17 = [*(id *)(a1 + 40) remindMeNotificationController];
    v18 = *(void **)(a1 + 40);
    uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    v20 = [v18 observerResumer];
    uint64_t v21 = [(EDPrecomputedThreadQueryHandler *)v12 initWithQuery:v24 threadScope:v13 messagePersistence:v14 threadPersistence:v15 hookRegistry:v16 remindMeNotificationController:v17 observer:v18 observationIdentifier:v19 observationResumer:v20];
    uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8);
    id v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;

    uint64_t v8 = (void *)v24;
  }
}

- (EDPersistenceHookRegistry)hookRegistry
{
  return self->_hookRegistry;
}

void __53__EDThreadQueryHandler_observerDidFinishInitialLoad___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 threadMigrator];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  int v6 = [*(id *)(a1 + 32) isStarted];
  if (v6) {
    LOBYTE(v6) = [v7 _isCurrentObservationToken:*(void *)(a1 + 40)];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v6;
}

void __72__EDThreadQueryHandler_observer_matchedAddedObjectIDs_before_extraInfo___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 threadMigrator];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  int v6 = [*(id *)(a1 + 32) isStarted];
  if (v6) {
    LOBYTE(v6) = [v7 _isCurrentObservationToken:*(void *)(a1 + 40)];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v6;
}

- (BOOL)isStarted
{
  int v2 = atomic_load((unsigned __int8 *)&self->_state);
  return v2 == 1;
}

- (EDRemindMeNotificationController)remindMeNotificationController
{
  return self->_remindMeNotificationController;
}

- (EDResumable)observerResumer
{
  return self->_observerResumer;
}

- (void)observerDidFinishInitialLoad:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[EDThreadQueryHandler log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[EDThreadQueryHandler observerDidFinishInitialLoad:]();
  }

  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  unint64_t v28 = __Block_byref_object_copy__44;
  uint64_t v29 = __Block_byref_object_dispose__44;
  id v30 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = -86;
  int v6 = [(EDThreadQueryHandler *)self underlyingHandler];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __53__EDThreadQueryHandler_observerDidFinishInitialLoad___block_invoke;
  id v16 = &unk_1E6C076D8;
  uint64_t v19 = &v25;
  v20 = &v21;
  v17 = self;
  id v7 = v4;
  id v18 = v7;
  [v6 performWhileLocked:&v13];

  if (*((unsigned char *)v22 + 24))
  {
    if (v26[5])
    {
      uint64_t v8 = +[EDThreadQueryHandler log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = v26[5];
        *(_DWORD *)buf = 134218240;
        id v32 = self;
        __int16 v33 = 2048;
        uint64_t v34 = v9;
        _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_INFO, "%p: Starting migrator %p.", buf, 0x16u);
      }

      uint64_t v10 = (void *)v26[5];
    }
    else
    {
      uint64_t v10 = 0;
    }
    objc_msgSend(v10, "start", v13, v14, v15, v16, v17);
    char v11 = [(EDThreadQueryHandler *)self resultsObserver];
    uint64_t v12 = [(EDThreadQueryHandler *)self observationIdentifier];
    [v11 observerDidFinishInitialLoad:v12];
  }
  else
  {
    char v11 = +[EDThreadQueryHandler log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v32 = self;
      _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_DEFAULT, "%p: Observer callback from unknown (old?) underlying handler.", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (BOOL)start
{
  char v2 = 0;
  atomic_compare_exchange_strong(&self->_state, (unsigned __int8 *)&v2, 1u);
  BOOL v3 = v2 == 0;
  if (!v2)
  {
    uint64_t v5 = [(EDThreadQueryHandler *)self hookRegistry];
    [v5 registerThreadChangeHookResponder:self];

    [(EDThreadQueryHandler *)self _createUnderlyingHandlerIfNeededAndStart];
  }
  return v3;
}

- (void)_createUnderlyingHandlerIfNeededAndStart
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__44;
  v68 = __Block_byref_object_dispose__44;
  id v69 = 0;
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x3032000000;
  uint64_t v61 = __Block_byref_object_copy__44;
  uint64_t v62 = __Block_byref_object_dispose__44;
  id v63 = 0;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  uint64_t v55 = __Block_byref_object_copy__44;
  v56 = __Block_byref_object_dispose__44;
  id v57 = 0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = __Block_byref_object_copy__44;
  v50[4] = __Block_byref_object_dispose__44;
  id v51 = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3032000000;
  v48[3] = __Block_byref_object_copy__44;
  v48[4] = __Block_byref_object_dispose__44;
  id v49 = 0;
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v42 = 0;
  id v43 = &v42;
  uint64_t v44 = 0x3032000000;
  id v45 = __Block_byref_object_copy__44;
  id v46 = __Block_byref_object_dispose__44;
  id v47 = 0;
  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  id v4 = [(EDThreadQueryHandler *)self underlyingHandler];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __64__EDThreadQueryHandler__createUnderlyingHandlerIfNeededAndStart__block_invoke;
  v29[3] = &unk_1E6C075C8;
  uint64_t v31 = v50;
  id v32 = &v64;
  v29[4] = self;
  __int16 v33 = v48;
  uint64_t v34 = &v58;
  uint64_t v35 = &v52;
  id v5 = v3;
  id v30 = v5;
  long long v36 = &v38;
  id v37 = &v42;
  [v4 performWhileLocked:v29];

  if (*((unsigned char *)v39 + 24) && (atomic_exchange(&self->_isRunning._Value, 1u) & 1) != 0)
  {
    id v7 = +[EDThreadQueryHandler log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v71 = self;
      _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "%p: Notifying observer about restart.", buf, 0xCu);
    }

    uint64_t v8 = [(EDThreadQueryHandler *)self resultsObserver];
    uint64_t v9 = [(EDThreadQueryHandler *)self observationIdentifier];
    [v8 observerWillRestart:v9];

    int v6 = 1;
  }
  else
  {
    int v6 = 0;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v78 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "tearDown", (void)v25);
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v78 count:16];
    }
    while (v11);
  }

  [(id)v43[5] cancel];
  int v14 = [(id)v65[5] start];
  int v15 = [(id)v59[5] start];
  if (v6)
  {
    int v16 = v15;
    if ((v14 | v15) == 1)
    {
      v17 = +[EDThreadQueryHandler log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = v65[5];
        uint64_t v19 = v59[5];
        *(_DWORD *)buf = 134219008;
        v71 = self;
        __int16 v72 = 2048;
        uint64_t v73 = v18;
        __int16 v74 = 1024;
        *(_DWORD *)v75 = v14;
        *(_WORD *)&v75[4] = 2048;
        *(void *)&v75[6] = v19;
        __int16 v76 = 1024;
        int v77 = v16;
        _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_DEFAULT, "%p: didRestartObservers - didStart inMemoryQueryHandler(%p):%{BOOL}d precomputedQueryHandler(%p):%{BOOL}d", buf, 0x2Cu);
      }
    }
    else
    {
      v17 = +[EDThreadQueryHandler log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        uint64_t v23 = v65[5];
        uint64_t v24 = v59[5];
        *(_DWORD *)buf = 134219008;
        v71 = self;
        __int16 v72 = 2048;
        uint64_t v73 = v23;
        __int16 v74 = 1024;
        *(_DWORD *)v75 = 0;
        *(_WORD *)&v75[4] = 2048;
        *(void *)&v75[6] = v24;
        __int16 v76 = 1024;
        int v77 = 0;
        _os_log_fault_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_FAULT, "%p: called didRestartObservers but neither handler started - inMemoryQueryHandler(%p):%{BOOL}d precomputedQueryHandler(%p):%{BOOL}d", buf, 0x2Cu);
      }
    }
  }
  if (v53[5])
  {
    v20 = +[EDThreadQueryHandler log];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = v53[5];
      uint64_t v22 = v65[5];
      *(_DWORD *)buf = 134218496;
      v71 = self;
      __int16 v72 = 2048;
      uint64_t v73 = v21;
      __int16 v74 = 2048;
      *(void *)v75 = v22;
      _os_log_impl(&dword_1DB39C000, v20, OS_LOG_TYPE_DEFAULT, "%p: Migrator %p will be started by in-memory query handler %p.", buf, 0x20u);
    }
  }
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(v48, 8);
  _Block_object_dispose(v50, 8);

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);

  _Block_object_dispose(&v64, 8);
}

void __27__EDThreadQueryHandler_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  char v2 = (void *)log_log_95;
  log_log_95 = (uint64_t)v1;
}

void __64__EDThreadQueryHandler__createUnderlyingHandlerIfNeededAndStart__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2
    || ([*(id *)(a1 + 32) inMemoryQueryHandler],
        uint64_t v18 = objc_claimAutoreleasedReturnValue(),
        v18,
        !v18))
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F60400]) initAsEphemeralID:1];
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    int v6 = [EDInMemoryThreadQueryHandler alloc];
    id v25 = [*(id *)(a1 + 40) query];
    uint64_t v24 = [*(id *)(a1 + 40) messagePersistence];
    id v7 = [*(id *)(a1 + 40) hookRegistry];
    uint64_t v8 = [*(id *)(a1 + 40) remindMeNotificationController];
    uint64_t v9 = [*(id *)(a1 + 40) vipManager];
    id v10 = [*(id *)(a1 + 40) searchProvider];
    uint64_t v11 = *(void **)(a1 + 40);
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v13 = [v11 observerResumer];
    int v14 = [*(id *)(a1 + 40) helperObserver];
    uint64_t v15 = [(EDInMemoryThreadQueryHandler *)v6 initWithQuery:v25 messagePersistence:v24 hookRegistry:v7 remindMeNotificationController:v8 vipManager:v9 searchProvider:v10 observer:v11 observationIdentifier:v12 observationResumer:v13 helperObserver:v14];
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
    v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }
  else
  {
    uint64_t v19 = [*(id *)(a1 + 32) inMemoryObservationID];
    uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;

    uint64_t v22 = [*(id *)(a1 + 32) inMemoryQueryHandler];
    uint64_t v23 = *(void *)(*(void *)(a1 + 56) + 8);
    id v25 = *(id *)(v23 + 40);
    *(void *)(v23 + 40) = v22;
  }
}

- (void)cancel
{
  uint64_t v3 = [(EDThreadQueryHandler *)self hookRegistry];
  [v3 unregisterHookResponder:self];

  [(EDThreadQueryHandler *)self tearDown];
}

- (void)_tearDownWithQueryHandlerBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  if (atomic_exchange(&self->_state, 2u) != 2)
  {
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x3032000000;
    uint64_t v22 = __Block_byref_object_copy__44;
    uint64_t v23 = __Block_byref_object_dispose__44;
    id v24 = 0;
    uint64_t v13 = 0;
    int v14 = &v13;
    uint64_t v15 = 0x3032000000;
    uint64_t v16 = __Block_byref_object_copy__44;
    v17 = __Block_byref_object_dispose__44;
    id v18 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x3032000000;
    id v10 = __Block_byref_object_copy__44;
    uint64_t v11 = __Block_byref_object_dispose__44;
    id v12 = 0;
    id v5 = [(EDThreadQueryHandler *)self underlyingHandler];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__EDThreadQueryHandler__tearDownWithQueryHandlerBlock___block_invoke;
    v6[3] = &unk_1E6C075F0;
    v6[4] = &v19;
    v6[5] = &v13;
    v6[6] = &v7;
    [v5 performWhileLocked:v6];

    v4[2](v4, v20[5]);
    v4[2](v4, v14[5]);
    [(id)v8[5] cancel];
    _Block_object_dispose(&v7, 8);

    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v19, 8);
  }
}

void __55__EDThreadQueryHandler__tearDownWithQueryHandlerBlock___block_invoke(void *a1, void *a2)
{
  id v12 = a2;
  uint64_t v3 = [v12 inMemoryQueryHandler];
  uint64_t v4 = *(void *)(a1[4] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = [v12 precomputedQueryHandler];
  uint64_t v7 = *(void *)(a1[5] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = [v12 threadMigrator];
  uint64_t v10 = *(void *)(a1[6] + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  [v12 setInMemoryQueryHandler:0];
  [v12 setPrecomputedQueryHandler:0];
  [v12 setThreadMigrator:0];
}

- (void)test_tearDown
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EDThreadQueryHandler.m", 300, @"%s can only be called from unit tests", "-[EDThreadQueryHandler test_tearDown]");
  }

  [(EDThreadQueryHandler *)self _tearDownWithQueryHandlerBlock:&__block_literal_global_86];
}

uint64_t __37__EDThreadQueryHandler_test_tearDown__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "test_tearDown");
}

- (void)tearDown
{
}

uint64_t __32__EDThreadQueryHandler_tearDown__block_invoke(uint64_t a1, void *a2)
{
  return [a2 tearDown];
}

- (void)requestSummaryForMessageObjectID:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__44;
  v17 = __Block_byref_object_dispose__44;
  id v18 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__44;
  uint64_t v11 = __Block_byref_object_dispose__44;
  id v12 = 0;
  id v5 = [(EDThreadQueryHandler *)self underlyingHandler];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__EDThreadQueryHandler_requestSummaryForMessageObjectID___block_invoke;
  v6[3] = &unk_1E6C07638;
  v6[4] = &v13;
  v6[5] = &v7;
  [v5 performWhileLocked:v6];

  [(id)v14[5] requestSummaryForMessageObjectID:v4];
  [(id)v8[5] requestSummaryForMessageObjectID:v4];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
}

void __57__EDThreadQueryHandler_requestSummaryForMessageObjectID___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = [v9 inMemoryQueryHandler];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = [v9 precomputedQueryHandler];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)messageListItemForObjectID:(id)a3 isPersisted:(BOOL *)a4 error:(id *)a5
{
  id v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"EDThreadQueryHandler.m", 324, @"Invalid parameter not satisfying: %@", @"[objectID isKindOfClass:[EMThreadObjectID class]]" object file lineNumber description];
  }
  EFContentProtectionValidateObservedStateIsUnlocked();
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  __int16 v33 = __Block_byref_object_copy__44;
  uint64_t v34 = __Block_byref_object_dispose__44;
  id v35 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  long long v27 = __Block_byref_object_copy__44;
  long long v28 = __Block_byref_object_dispose__44;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__44;
  uint64_t v22 = __Block_byref_object_dispose__44;
  id v23 = 0;
  uint64_t v10 = [(EDThreadQueryHandler *)self underlyingHandler];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__EDThreadQueryHandler_messageListItemForObjectID_isPersisted_error___block_invoke;
  v17[3] = &unk_1E6C075F0;
  v17[4] = &v30;
  v17[5] = &v24;
  v17[6] = &v18;
  [v10 performWhileLocked:v17];

  uint64_t v11 = (void *)v25[5];
  if (v11)
  {
    uint64_t v12 = [v11 messageListItemForObjectID:v9 error:a5];
    uint64_t v13 = (void *)v12;
    if (a4 && v12)
    {
      BOOL v14 = 1;
      goto LABEL_10;
    }
    if (v12) {
      goto LABEL_11;
    }
  }
  uint64_t v13 = [(id)v31[5] messageListItemForObjectID:v9 error:a5];
  if (!a4) {
    goto LABEL_11;
  }
  BOOL v14 = v19[5] != 0;
LABEL_10:
  *a4 = v14;
LABEL_11:
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v13;
}

void __69__EDThreadQueryHandler_messageListItemForObjectID_isPersisted_error___block_invoke(void *a1, void *a2)
{
  id v12 = a2;
  uint64_t v3 = [v12 inMemoryQueryHandler];
  uint64_t v4 = *(void *)(a1[4] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = [v12 precomputedQueryHandler];
  uint64_t v7 = *(void *)(a1[5] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = [v12 threadMigrator];
  uint64_t v10 = *(void *)(a1[6] + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

- (id)inMemoryMessageObjectIDsForThread:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  BOOL v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__44;
  v17 = __Block_byref_object_dispose__44;
  id v18 = 0;
  id v5 = [(EDThreadQueryHandler *)self underlyingHandler];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__EDThreadQueryHandler_inMemoryMessageObjectIDsForThread___block_invoke;
  v12[3] = &unk_1E6C07660;
  v12[4] = &v13;
  [v5 performWhileLocked:v12];

  uint64_t v6 = [(id)v14[5] messagesForThread:v4];
  uint64_t v7 = objc_msgSend(v6, "ef_mapSelector:", sel_objectID);
  uint64_t v8 = (void *)v7;
  uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
  if (v7) {
    uint64_t v9 = (void *)v7;
  }
  id v10 = v9;

  _Block_object_dispose(&v13, 8);

  return v10;
}

void __58__EDThreadQueryHandler_inMemoryMessageObjectIDsForThread___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 inMemoryQueryHandler];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)messagesInConversationIDs:(id)a3 limit:(int64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__44;
  uint64_t v19 = __Block_byref_object_dispose__44;
  id v20 = 0;
  uint64_t v8 = [(EDThreadQueryHandler *)self underlyingHandler];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__EDThreadQueryHandler_messagesInConversationIDs_limit___block_invoke;
  v14[3] = &unk_1E6C07660;
  v14[4] = &v15;
  [v8 performWhileLocked:v14];

  uint64_t v9 = (void *)v16[5];
  if (v9)
  {
    id v10 = [v9 messagesInConversationIDs:v7 limit:a4];
  }
  else
  {
    uint64_t v11 = +[EDThreadQueryHandler log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = NSStringFromSelector(a2);
      [(EDThreadQueryHandler *)(uint64_t)self messagesInConversationIDs:buf limit:v11];
    }

    id v10 = 0;
  }
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __56__EDThreadQueryHandler_messagesInConversationIDs_limit___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 inMemoryQueryHandler];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)threadMigratorDidComplete:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = -86;
  id v5 = [(EDThreadQueryHandler *)self underlyingHandler];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __50__EDThreadQueryHandler_threadMigratorDidComplete___block_invoke;
  id v12 = &unk_1E6C07688;
  BOOL v14 = &v15;
  id v6 = v4;
  id v13 = v6;
  [v5 performWhileLocked:&v9];

  if (*((unsigned char *)v16 + 24))
  {
    id v7 = +[EDThreadQueryHandler log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      id v20 = self;
      __int16 v21 = 2048;
      id v22 = v6;
      _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "%p: Thread migrator %p did complete.", buf, 0x16u);
    }

    [(EDThreadQueryHandler *)self _createUnderlyingHandlerIfNeededAndStart];
    uint64_t v8 = [(EDThreadQueryHandler *)self delegate];
    [v8 threadQueryHandlerStateDidChange:self];
  }
  else
  {
    uint64_t v8 = +[EDThreadQueryHandler log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      id v20 = self;
      __int16 v21 = 2048;
      id v22 = v6;
      _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "%p: Unknown thread migrator %p did complete.", buf, 0x16u);
    }
  }

  _Block_object_dispose(&v15, 8);
}

void __50__EDThreadQueryHandler_threadMigratorDidComplete___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v6 = v3;
  id v5 = [v3 threadMigrator];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4 == v5;
}

- (void)observer:(id)a3 wasUpdated:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[EDThreadQueryHandler log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[EDThreadQueryHandler observer:wasUpdated:]();
  }

  uint64_t v17 = 0;
  char v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = -86;
  uint64_t v9 = [(EDThreadQueryHandler *)self underlyingHandler];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __44__EDThreadQueryHandler_observer_wasUpdated___block_invoke;
  v14[3] = &unk_1E6C076B0;
  uint64_t v16 = &v17;
  v14[4] = self;
  id v10 = v6;
  id v15 = v10;
  [v9 performWhileLocked:v14];

  if (*((unsigned char *)v18 + 24))
  {
    uint64_t v11 = [(EDThreadQueryHandler *)self resultsObserver];
    id v12 = [(EDThreadQueryHandler *)self observationIdentifier];
    [v11 observer:v12 wasUpdated:v7];
  }
  else
  {
    id v13 = +[EDThreadQueryHandler log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      id v22 = self;
      __int16 v23 = 2114;
      id v24 = v10;
      __int16 v25 = 2114;
      id v26 = v7;
      _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "%p: Observer callback from unknown (old?) underlying handler for %{public}@: %{public}@.", buf, 0x20u);
    }

    [v7 invoke];
  }

  _Block_object_dispose(&v17, 8);
}

void __44__EDThreadQueryHandler_observer_wasUpdated___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  int v3 = [*(id *)(a1 + 32) isStarted];
  if (v3) {
    LOBYTE(v3) = [v4 _isCurrentObservationToken:*(void *)(a1 + 40)];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
}

void __52__EDThreadQueryHandler__addSnippetHintsToExtraInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (v5 && [v6 count]) {
    [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v5];
  }
}

- (void)observer:(id)a3 matchedAddedObjectIDs:(id)a4 after:(id)a5 extraInfo:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  BOOL v14 = +[EDThreadQueryHandler log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[EDThreadQueryHandler observer:matchedAddedObjectIDs:after:extraInfo:]();
  }

  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  long long v36 = __Block_byref_object_copy__44;
  id v37 = __Block_byref_object_dispose__44;
  id v38 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = -86;
  id v15 = [(EDThreadQueryHandler *)self underlyingHandler];
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  __int16 v23 = __71__EDThreadQueryHandler_observer_matchedAddedObjectIDs_after_extraInfo___block_invoke;
  id v24 = &unk_1E6C076D8;
  uint64_t v27 = &v33;
  long long v28 = &v29;
  __int16 v25 = self;
  id v16 = v10;
  id v26 = v16;
  [v15 performWhileLocked:&v21];

  if (*((unsigned char *)v30 + 24))
  {
    objc_msgSend((id)v34[5], "addObjectIDsToMigrate:", v11, v21, v22, v23, v24, v25);
    if (_os_feature_enabled_impl())
    {
      uint64_t v17 = [(EDThreadQueryHandler *)self _addSnippetHintsToExtraInfo:v13];
      char v18 = [(EDThreadQueryHandler *)self resultsObserver];
      uint64_t v19 = [(EDThreadQueryHandler *)self observationIdentifier];
      [v18 observer:v19 matchedAddedObjectIDs:v11 after:v12 extraInfo:v17];
    }
    else
    {
      uint64_t v17 = [(EDThreadQueryHandler *)self resultsObserver];
      char v20 = [(EDThreadQueryHandler *)self observationIdentifier];
      [v17 observer:v20 matchedAddedObjectIDs:v11 after:v12 extraInfo:v13];
    }
  }
  else
  {
    uint64_t v17 = +[EDThreadQueryHandler log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v40 = self;
      _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_DEFAULT, "%p: Observer callback from unknown (old?) underlying handler.", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
}

void __71__EDThreadQueryHandler_observer_matchedAddedObjectIDs_after_extraInfo___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 threadMigrator];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  int v6 = [*(id *)(a1 + 32) isStarted];
  if (v6) {
    LOBYTE(v6) = [v7 _isCurrentObservationToken:*(void *)(a1 + 40)];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v6;
}

- (void)observer:(id)a3 matchedMovedObjectIDs:(id)a4 before:(id)a5 extraInfo:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  BOOL v14 = +[EDThreadQueryHandler log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[EDThreadQueryHandler observer:matchedMovedObjectIDs:before:extraInfo:]();
  }

  uint64_t v22 = 0;
  __int16 v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = -86;
  id v15 = [(EDThreadQueryHandler *)self underlyingHandler];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __72__EDThreadQueryHandler_observer_matchedMovedObjectIDs_before_extraInfo___block_invoke;
  v19[3] = &unk_1E6C076B0;
  uint64_t v21 = &v22;
  v19[4] = self;
  id v16 = v10;
  id v20 = v16;
  [v15 performWhileLocked:v19];

  if (*((unsigned char *)v23 + 24))
  {
    uint64_t v17 = [(EDThreadQueryHandler *)self resultsObserver];
    char v18 = [(EDThreadQueryHandler *)self observationIdentifier];
    [v17 observer:v18 matchedMovedObjectIDs:v11 before:v12 extraInfo:v13];
  }
  else
  {
    uint64_t v17 = +[EDThreadQueryHandler log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v27 = self;
      _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_DEFAULT, "%p: Observer callback from unknown (old?) underlying handler.", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v22, 8);
}

void __72__EDThreadQueryHandler_observer_matchedMovedObjectIDs_before_extraInfo___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  int v3 = [*(id *)(a1 + 32) isStarted];
  if (v3) {
    LOBYTE(v3) = [v4 _isCurrentObservationToken:*(void *)(a1 + 40)];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
}

- (void)observer:(id)a3 matchedMovedObjectIDs:(id)a4 after:(id)a5 extraInfo:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  BOOL v14 = +[EDThreadQueryHandler log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[EDThreadQueryHandler observer:matchedMovedObjectIDs:after:extraInfo:]();
  }

  uint64_t v22 = 0;
  __int16 v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = -86;
  id v15 = [(EDThreadQueryHandler *)self underlyingHandler];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __71__EDThreadQueryHandler_observer_matchedMovedObjectIDs_after_extraInfo___block_invoke;
  v19[3] = &unk_1E6C076B0;
  uint64_t v21 = &v22;
  v19[4] = self;
  id v16 = v10;
  id v20 = v16;
  [v15 performWhileLocked:v19];

  if (*((unsigned char *)v23 + 24))
  {
    uint64_t v17 = [(EDThreadQueryHandler *)self resultsObserver];
    char v18 = [(EDThreadQueryHandler *)self observationIdentifier];
    [v17 observer:v18 matchedMovedObjectIDs:v11 after:v12 extraInfo:v13];
  }
  else
  {
    uint64_t v17 = +[EDThreadQueryHandler log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v27 = self;
      _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_DEFAULT, "%p: Observer callback from unknown (old?) underlying handler.", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v22, 8);
}

void __71__EDThreadQueryHandler_observer_matchedMovedObjectIDs_after_extraInfo___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  int v3 = [*(id *)(a1 + 32) isStarted];
  if (v3) {
    LOBYTE(v3) = [v4 _isCurrentObservationToken:*(void *)(a1 + 40)];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
}

- (void)observer:(id)a3 matchedChangesForObjectIDs:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[EDThreadQueryHandler log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[EDThreadQueryHandler observer:matchedChangesForObjectIDs:]();
  }

  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__44;
  uint64_t v31 = __Block_byref_object_dispose__44;
  id v32 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = -86;
  uint64_t v9 = [(EDThreadQueryHandler *)self underlyingHandler];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __60__EDThreadQueryHandler_observer_matchedChangesForObjectIDs___block_invoke;
  char v18 = &unk_1E6C076D8;
  uint64_t v21 = &v27;
  uint64_t v22 = &v23;
  uint64_t v19 = self;
  id v10 = v6;
  id v20 = v10;
  [v9 performWhileLocked:&v15];

  if (*((unsigned char *)v24 + 24))
  {
    id v11 = (void *)v28[5];
    id v12 = objc_msgSend(v7, "allKeys", v15, v16, v17, v18, v19);
    [v11 changeObjectIDsToMigrate:v12];

    id v13 = [(EDThreadQueryHandler *)self resultsObserver];
    BOOL v14 = [(EDThreadQueryHandler *)self observationIdentifier];
    [v13 observer:v14 matchedChangesForObjectIDs:v7];
  }
  else
  {
    id v13 = +[EDThreadQueryHandler log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v34 = self;
      _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "%p: Observer callback from unknown (old?) underlying handler.", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
}

void __60__EDThreadQueryHandler_observer_matchedChangesForObjectIDs___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 threadMigrator];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  int v6 = [*(id *)(a1 + 32) isStarted];
  if (v6) {
    LOBYTE(v6) = [v7 _isCurrentObservationToken:*(void *)(a1 + 40)];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v6;
}

- (void)observer:(id)a3 matchedDeletedObjectIDs:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[EDThreadQueryHandler log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[EDThreadQueryHandler observer:matchedDeletedObjectIDs:]();
  }

  uint64_t v25 = 0;
  char v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__44;
  uint64_t v29 = __Block_byref_object_dispose__44;
  id v30 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = -86;
  uint64_t v9 = [(EDThreadQueryHandler *)self underlyingHandler];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __57__EDThreadQueryHandler_observer_matchedDeletedObjectIDs___block_invoke;
  uint64_t v16 = &unk_1E6C076D8;
  uint64_t v19 = &v25;
  id v20 = &v21;
  uint64_t v17 = self;
  id v10 = v6;
  id v18 = v10;
  [v9 performWhileLocked:&v13];

  if (*((unsigned char *)v22 + 24))
  {
    objc_msgSend((id)v26[5], "deleteObjectIDsToMigrate:", v7, v13, v14, v15, v16, v17);
    id v11 = [(EDThreadQueryHandler *)self resultsObserver];
    id v12 = [(EDThreadQueryHandler *)self observationIdentifier];
    [v11 observer:v12 matchedDeletedObjectIDs:v7];
  }
  else
  {
    id v11 = +[EDThreadQueryHandler log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v32 = self;
      _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_DEFAULT, "%p: Observer callback from unknown (old?) underlying handler.", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
}

void __57__EDThreadQueryHandler_observer_matchedDeletedObjectIDs___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 threadMigrator];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  int v6 = [*(id *)(a1 + 32) isStarted];
  if (v6) {
    LOBYTE(v6) = [v7 _isCurrentObservationToken:*(void *)(a1 + 40)];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v6;
}

- (void)observerDidFinishRemoteSearch:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[EDThreadQueryHandler log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[EDThreadQueryHandler observerDidFinishRemoteSearch:]();
  }

  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = -86;
  int v6 = [(EDThreadQueryHandler *)self underlyingHandler];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__EDThreadQueryHandler_observerDidFinishRemoteSearch___block_invoke;
  v10[3] = &unk_1E6C076B0;
  id v12 = &v13;
  v10[4] = self;
  id v7 = v4;
  id v11 = v7;
  [v6 performWhileLocked:v10];

  if (*((unsigned char *)v14 + 24))
  {
    uint64_t v8 = [(EDThreadQueryHandler *)self resultsObserver];
    uint64_t v9 = [(EDThreadQueryHandler *)self observationIdentifier];
    [v8 observerDidFinishRemoteSearch:v9];
  }
  else
  {
    uint64_t v8 = +[EDThreadQueryHandler log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v18 = self;
      _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "%p: Observer callback from unknown (old?) underlying handler.", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v13, 8);
}

void __54__EDThreadQueryHandler_observerDidFinishRemoteSearch___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  int v3 = [*(id *)(a1 + 32) isStarted];
  if (v3) {
    LOBYTE(v3) = [v4 _isCurrentObservationToken:*(void *)(a1 + 40)];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
}

- (void)observer:(id)a3 replacedExistingObjectID:(id)a4 withNewObjectID:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[EDThreadQueryHandler log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[EDThreadQueryHandler observer:replacedExistingObjectID:withNewObjectID:]();
  }

  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = -86;
  id v12 = [(EDThreadQueryHandler *)self underlyingHandler];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__EDThreadQueryHandler_observer_replacedExistingObjectID_withNewObjectID___block_invoke;
  v16[3] = &unk_1E6C076B0;
  id v18 = &v19;
  v16[4] = self;
  id v13 = v8;
  id v17 = v13;
  [v12 performWhileLocked:v16];

  if (*((unsigned char *)v20 + 24))
  {
    uint64_t v14 = [(EDThreadQueryHandler *)self resultsObserver];
    uint64_t v15 = [(EDThreadQueryHandler *)self observationIdentifier];
    [v14 observer:v15 replacedExistingObjectID:v9 withNewObjectID:v10];
  }
  else
  {
    uint64_t v14 = +[EDThreadQueryHandler log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      char v24 = self;
      _os_log_impl(&dword_1DB39C000, v14, OS_LOG_TYPE_DEFAULT, "%p: Observer callback from unknown (old?) underlying handler.", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v19, 8);
}

void __74__EDThreadQueryHandler_observer_replacedExistingObjectID_withNewObjectID___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  int v3 = [*(id *)(a1 + 32) isStarted];
  if (v3) {
    LOBYTE(v3) = [v4 _isCurrentObservationToken:*(void *)(a1 + 40)];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
}

- (void)observerWillRestart:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[EDThreadQueryHandler log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[EDThreadQueryHandler observerWillRestart:]();
  }

  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__44;
  char v26 = __Block_byref_object_dispose__44;
  id v27 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = -86;
  int v6 = [(EDThreadQueryHandler *)self underlyingHandler];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __44__EDThreadQueryHandler_observerWillRestart___block_invoke;
  id v13 = &unk_1E6C076D8;
  char v16 = &v22;
  id v17 = &v18;
  uint64_t v14 = self;
  id v7 = v4;
  id v15 = v7;
  [v6 performWhileLocked:&v10];

  if (*((unsigned char *)v19 + 24))
  {
    objc_msgSend((id)v23[5], "reset", v10, v11, v12, v13, v14);
    id v8 = [(EDThreadQueryHandler *)self resultsObserver];
    id v9 = [(EDThreadQueryHandler *)self observationIdentifier];
    [v8 observerWillRestart:v9];
  }
  else
  {
    id v8 = +[EDThreadQueryHandler log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v29 = self;
      _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "%p: Observer callback from unknown (old?) underlying handler.", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
}

void __44__EDThreadQueryHandler_observerWillRestart___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 threadMigrator];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  int v6 = [*(id *)(a1 + 32) isStarted];
  if (v6) {
    LOBYTE(v6) = [v7 _isCurrentObservationToken:*(void *)(a1 + 40)];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v6;
}

- (void)observer:(id)a3 matchedOldestItemsUpdatedForMailboxes:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[EDThreadQueryHandler log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[EDThreadQueryHandler observer:matchedOldestItemsUpdatedForMailboxes:]();
  }

  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = -86;
  id v9 = [(EDThreadQueryHandler *)self underlyingHandler];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__EDThreadQueryHandler_observer_matchedOldestItemsUpdatedForMailboxes___block_invoke;
  v13[3] = &unk_1E6C076B0;
  id v15 = &v16;
  v13[4] = self;
  id v10 = v6;
  id v14 = v10;
  [v9 performWhileLocked:v13];

  if (*((unsigned char *)v17 + 24))
  {
    uint64_t v11 = [(EDThreadQueryHandler *)self resultsObserver];
    id v12 = [(EDThreadQueryHandler *)self observationIdentifier];
    [v11 observer:v12 matchedOldestItemsUpdatedForMailboxes:v7];
  }
  else
  {
    uint64_t v11 = +[EDThreadQueryHandler log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      char v21 = self;
      _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_DEFAULT, "%p: Observer callback from unknown (old?) underlying handler.", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v16, 8);
}

void __71__EDThreadQueryHandler_observer_matchedOldestItemsUpdatedForMailboxes___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  int v3 = [*(id *)(a1 + 32) isStarted];
  if (v3) {
    LOBYTE(v3) = [v4 _isCurrentObservationToken:*(void *)(a1 + 40)];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
}

- (void)persistenceDidResetThreadScope:(id)a3
{
  id v6 = a3;
  id v4 = [(EDThreadQueryHandler *)self threadScope];
  int v5 = [v6 isEqual:v4];

  if (v5) {
    [(EDThreadQueryHandler *)self triggerMigration];
  }
}

- (id)threadReconciliationQueries
{
  v8[1] = *MEMORY[0x1E4F143B8];
  int v3 = [(EDThreadQueryHandler *)self query];
  char v4 = [v3 queryOptions];

  if ((v4 & 8) != 0)
  {
    id v6 = [(EDThreadQueryHandler *)self query];
    v8[0] = v6;
    int v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (id)messageReconciliationQueries
{
  return 0;
}

- (EMMessageQueryHelperObserver_xpc)helperObserver
{
  return self->_helperObserver;
}

- (EDVIPManager)vipManager
{
  return self->_vipManager;
}

- (EDSearchProvider)searchProvider
{
  return self->_searchProvider;
}

- (EDThreadQueryHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EDThreadQueryHandlerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerResumer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_underlyingHandler, 0);
  objc_storeStrong((id *)&self->_remindMeNotificationController, 0);
  objc_storeStrong((id *)&self->_searchProvider, 0);
  objc_storeStrong((id *)&self->_vipManager, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_threadPersistence, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_helperObserver, 0);
  objc_storeStrong((id *)&self->_observationIdentifier, 0);
  objc_storeStrong((id *)&self->_resultsObserver, 0);
  objc_storeStrong((id *)&self->_query, 0);

  objc_storeStrong((id *)&self->_threadScope, 0);
}

- (void)messagesInConversationIDs:(uint8_t *)buf limit:(os_log_t)log .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "%p: Only in-memory threads are supported for %{public}@", buf, 0x16u);
}

- (void)observer:wasUpdated:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_1DB39C000, v0, v1, "%p: ID %{public}@ was updated.");
}

- (void)observer:matchedAddedObjectIDs:before:extraInfo:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_1DB39C000, v0, v1, "%p: ID %{public}@ matched added object IDs before.");
}

- (void)observer:matchedAddedObjectIDs:after:extraInfo:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_1DB39C000, v0, v1, "%p: ID %{public}@ matched added object IDs after.");
}

- (void)observer:matchedMovedObjectIDs:before:extraInfo:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_1DB39C000, v0, v1, "%p: ID %{public}@ matched moved object IDs before.");
}

- (void)observer:matchedMovedObjectIDs:after:extraInfo:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_1DB39C000, v0, v1, "%p: ID %{public}@ matched moved object IDs after.");
}

- (void)observer:matchedChangesForObjectIDs:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_1DB39C000, v0, v1, "%p: ID %{public}@ matched changes for object IDs.");
}

- (void)observer:matchedDeletedObjectIDs:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_1DB39C000, v0, v1, "%p: ID %{public}@ matched deleted object IDs.");
}

- (void)observerDidFinishInitialLoad:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_1DB39C000, v0, v1, "%p: ID %{public}@ finished initial load.");
}

- (void)observerDidFinishRemoteSearch:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_1DB39C000, v0, v1, "%p: ID %{public}@ finished remote search.");
}

- (void)observer:replacedExistingObjectID:withNewObjectID:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_1DB39C000, v0, v1, "%p: ID %{public}@ replaced existing object ID.");
}

- (void)observerWillRestart:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_1DB39C000, v0, v1, "%p: ID %{public}@ will restart.");
}

- (void)observer:matchedOldestItemsUpdatedForMailboxes:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_1DB39C000, v0, v1, "%p: ID %{public}@ matched oldest items updated for mailboxes.");
}

@end