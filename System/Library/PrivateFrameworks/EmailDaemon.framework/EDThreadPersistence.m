@interface EDThreadPersistence
+ (EFSQLTableSchema)threadMailboxesTableSchema;
+ (EFSQLTableSchema)threadRecipientsTableSchema;
+ (EFSQLTableSchema)threadScopesTableSchema;
+ (EFSQLTableSchema)threadSendersTableSchema;
+ (EFSQLTableSchema)threadsTableSchema;
+ (OS_os_log)log;
+ (OS_os_log)signpostLog;
+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4;
- (BOOL)_addThreadScopeToDatabase:(id)a3 needsUpdate:(BOOL)a4 lastViewedDate:(id)a5 updateThreadScopeManager:(BOOL)a6;
- (BOOL)_addThreadScopeToDatabase:(id)a3 withMailboxDatabaseID:(int64_t)a4 filterPredicate:(unint64_t)a5 needsUpdate:(BOOL)a6 lastViewedDate:(id)a7 updateThreadScopeManager:(BOOL)a8 connection:(id)a9;
- (BOOL)_addThreadScopeToDatabaseWithMailboxType:(id)a3 filterPredicate:(unint64_t)a4 needsUpdate:(BOOL)a5 lastViewedDate:(id)a6 connection:(id)a7;
- (BOOL)_deleteMailboxesFromWrappedMessages:(id)a3 fromThreadWithDatabaseID:(id)a4 messageThreadExpression:(id)a5;
- (BOOL)_deleteRecipientsOfType:(unint64_t)a3 fromThreadWithDatabaseID:(id)a4 messageThreadExpression:(id)a5;
- (BOOL)_deleteSendersFromThreadWithDatabaseID:(id)a3 messageThreadExpression:(id)a4;
- (BOOL)_enumerateThreadObjectIDsForThreadScope:(id)a3 filterClause:(id)a4 sortDescriptors:(id)a5 batchBlock:(id)a6;
- (BOOL)_isThreadScopePrecomputed:(id)a3 shouldMigrate:(BOOL *)a4;
- (BOOL)_messagesAreJournaledForThreadWithObjectID:(id)a3;
- (BOOL)_recalculateNewestMessageForThreadObjectID:(id)a3 threadScopeDatabaseID:(int64_t)a4;
- (BOOL)_recalculateNewestReadMessageForThreadObjectID:(id)a3 threadScopeDatabaseID:(int64_t)a4;
- (BOOL)_updateNewestReadMessageWithWrappedMessage:(id)a3 threadExpression:(id)a4;
- (BOOL)addThreadScopeToDatabase:(id)a3 needsUpdate:(BOOL)a4 lastViewedDate:(id)a5;
- (BOOL)addThreads:(id)a3;
- (BOOL)deleteThreadsWithObjectIDs:(id)a3;
- (BOOL)endMigratingThreadScope:(id)a3;
- (BOOL)setPriorityForDisplayMessageSenderForThreadObjectID:(id)a3;
- (BOOL)threadScopeManager:(id)a3 evictThreadScopesWithDatabaseIDs:(id)a4 completionBlock:(id)a5;
- (BOOL)threadScopeManager:(id)a3 isValidMailboxObjectID:(id)a4;
- (BOOL)threadScopeManager:(id)a3 mailboxScopeExists:(id)a4;
- (EDCategoryPersistence)categoryPersistence;
- (EDMessagePersistence)messagePersistence;
- (EDPersistenceDatabase)database;
- (EDPersistenceHookRegistry)hookRegistry;
- (EDThreadPersistence)initWithMessagePersistence:(id)a3 categoryPersistence:(id)a4 database:(id)a5 hookRegistry:(id)a6 vipManager:(id)a7 blockedSenderManager:(id)a8;
- (EDThreadScopeManager)threadScopeManager;
- (EFDebouncer)threadRecomputationDebouncer;
- (EFScheduler)consistencyCheckScheduler;
- (EFScheduler)threadRecomputationScheduler;
- (EMBlockedSenderManager)blockedSenderManager;
- (EMVIPManager)vipManager;
- (id)_addressesFromMessageAddressesStatement:(id)a3;
- (id)_addressesFromSelectStatement:(id)a3 additionalRowHandling:(id)a4;
- (id)_columnForSortDescriptor:(id)a3;
- (id)_comparisonExpressionForSortDescriptors:(id)a3 conversationID:(int64_t)a4 threadExpression:(id)a5 threadScopeDatabaseID:(int64_t)a6 connection:(id)a7;
- (id)_countMessagesForExpression:(id)a3;
- (id)_deleteWrappedMessages:(id)a3 fromThreadWithObjectID:(id)a4 threadScopeDatabaseID:(int64_t)a5 generationWindow:(id)a6;
- (id)_expressionForCategoryType:(unint64_t)a3;
- (id)_expressionForPredicateForPrimaryMessages;
- (id)_expressionForThreadScope:(id)a3;
- (id)_expressionFromSelect:(id)a3 equalTo:(id)a4;
- (id)_filteredPersistedMessagesForPersistedMessages:(id)a3;
- (id)_flagColorsFromRow:(id)a3;
- (id)_int64SetFromSet:(id)a3 byRemovingIndexesFromSet:(id)a4 andLimitingTo:(unint64_t)a5;
- (id)_mailboxDatabaseIDsForWrappedMessages:(id)a3;
- (id)_mailboxScopeForThreadScope:(id)a3 andFilterPredicate:(unint64_t *)a4;
- (id)_mailboxesForThreadDatabaseID:(id)a3;
- (id)_messageActiveFollowUpExpressionForSentMailboxObjectIDs:(id)a3;
- (id)_messageFilterExpressionForFilterPredicate:(id)a3;
- (id)_messageFiredReadLaterExpression:(id)a3;
- (id)_messageIsNotDeletedExpression;
- (id)_messageMailboxesExpressionForAccountObjectIDs:(id)a3;
- (id)_messageMailboxesExpressionForMailboxObjectIDs:(id)a3;
- (id)_messageMailboxesExpressionForMailboxScope:(id)a3;
- (id)_messageMailboxesExpressionForMailboxType:(int64_t)a3;
- (id)_messageThreadExpressionForThreadObjectID:(id)a3;
- (id)_messageThreadExpressionForThreadScope:(id)a3 conversationExpression:(id)a4;
- (id)_messageThreadExpressionForThreadScope:(id)a3 objectIDs:(id)a4;
- (id)_nonJournaledSubjectForThreadWithObjectID:(id)a3 connection:(id)a4;
- (id)_persistedMessagesByPossibleThreadScopeForPersistedMessages:(id)a3;
- (id)_persistedMessagesForMailboxScope:(id)a3 messageExpression:(id)a4;
- (id)_persistenceIsChangingFlags:(id)a3 wrappedMessages:(id)a4 threadObjectID:(id)a5 threadScopeDatabaseID:(int64_t)a6;
- (id)_recalculateDisplayMessageForThreadObjectID:(id)a3 threadScopeDatabaseID:(int64_t)a4;
- (id)_recipientAddressesExpressionForRecipientType:(unint64_t)a3 messages:(id)a4;
- (id)_recipientsOfType:(unint64_t)a3 forThreadDatabaseID:(id)a4;
- (id)_recipientsOfType:(unint64_t)a3 fromMessagesForThreadObjectID:(id)a4;
- (id)_selectFromMessageGlobalDataColumn:(id)a3;
- (id)_senderAddressesExpressionForMessages:(id)a3;
- (id)_sendersForThreadDatabaseID:(id)a3;
- (id)_sendersFromMessagesForThreadObjectID:(id)a3;
- (id)_statementForOldestThreadInMailbox:(id)a3 threadScope:(id)a4 createMailboxDatabaseIDIfNecessary:(BOOL)a5;
- (id)_threadDatabaseIDExpressionForThreadScopeDatabaseID:(int64_t)a3 conversation:(int64_t)a4;
- (id)_threadExpressionForThreadScopeDatabaseID:(int64_t)a3 conversation:(int64_t)a4;
- (id)_threadForWrappedMessages:(id)a3 objectID:(id)a4;
- (id)_threadQueryForThreadScope:(id)a3;
- (id)_updateBasicPropertiesAfterDeleteForThreadObjectID:(id)a3 threadScopeDatabaseID:(int64_t)a4;
- (id)_updateForThreadsWithThreadScopeDatabaseID:(int64_t)a3 conversation:(int64_t)a4;
- (id)_updateThreadForDeleteWithObjectID:(id)a3 threadScopeDatabaseID:(int64_t)a4 generationWindow:(id)a5;
- (id)_upsertForThreadsWithThreadScopeDatabaseID:(int64_t)a3 conversation:(int64_t)a4;
- (id)_wrappedMessageForPersistedMessages:(id)a3 threadScope:(id)a4 messageFilter:(id)a5;
- (id)_wrappedMessagesByThreadScopeForPersistedMessages:(id)a3 messageFilter:(id)a4;
- (id)beginMigratingThreadScope:(id)a3;
- (id)changeForThreadWithObjectID:(id)a3 changedKeyPaths:(id)a4;
- (id)newestMessageItemIDForThreadWithObjectID:(id)a3;
- (id)nextExistingThreadObjectIDForThreadObjectID:(id)a3 forSortDescriptors:(id)a4 journaledThreadsToCheck:(id)a5 excluding:(id)a6;
- (id)oldestThreadObjectIDForMailbox:(id)a3 threadScope:(id)a4;
- (id)resetThreadScopesForAccount:(id)a3;
- (id)statisticsForThreadScopesWithDatabaseIDs:(id)a3;
- (id)threadForObjectID:(id)a3 originatingQuery:(id)a4 error:(id *)a5;
- (id)threadObjectIDsByNextExistingForThreadObjectIDs:(id)a3 forSortDescriptors:(id)a4 journaledThreadsToCheck:(id)a5;
- (id)threadScopesByDatabaseID;
- (int64_t)_databaseIDForThreadObjectID:(id)a3;
- (unint64_t)persistenceStateForThreadScope:(id)a3;
- (unint64_t)persistenceStateForThreadScope:(id)a3 wantsPrecomputed:(BOOL)a4;
- (unint64_t)signpostID;
- (void)_addKeyPathsForBasicPropertiesChangeToKeyPaths:(id)a3;
- (void)_addKeyPathsForDisplayMessageChangeToKeyPaths:(id)a3;
- (void)_addOrderByToThreadSelect:(id)a3 forSortDescriptors:(id)a4;
- (void)_addPersistedMessages:(id)a3 journaled:(BOOL)a4 generationWindow:(id)a5;
- (void)_enumerateThreadScopesUsingBlock:(id)a3;
- (void)_getIndividualMailboxScopes:(id *)a3 unifiedMailboxThreadScopes:(id *)a4 forAccount:(id)a5;
- (void)_iterateWrappedMessagesByConversationForPersistedMessages:(id)a3 block:(id)a4;
- (void)_iterateWrappedMessagesByConversationForPersistedMessages:(id)a3 messageFilter:(id)a4 writeBlock:(id)a5;
- (void)_logFailedVerifyConsistencyForConversationIDs:(id)a3;
- (void)_persistenceDidUpdateMessages:(id)a3 forFilterPredicate:(unint64_t)a4 changedKeyPaths:(id)a5 predicateToIgnore:(id)a6 loggingString:(id)a7 generationWindow:(id)a8 messageTest:(id)a9;
- (void)_persistenceDidUpdateReadLaterForMessages:(id)a3 generationWindow:(id)a4;
- (void)_persistenceIsChangingFlags:(id)a3 messages:(id)a4 generationWindow:(id)a5;
- (void)_persistenceIsDeletingMessages:(id)a3 generationWindow:(id)a4;
- (void)_recomputeThreads;
- (void)_resetThreadScope:(id)a3 withDatabaseID:(id)a4;
- (void)_scheduleRecomputationForThread:(id)a3 reason:(id)a4;
- (void)_writeThreadedMessages:(id)a3 withChangedKeyPaths:(id)a4 journaled:(BOOL)a5 generationWindow:(id)a6;
- (void)persistenceDidAddMessages:(id)a3 generationWindow:(id)a4;
- (void)persistenceDidChangeCategorizationForMessages:(id)a3 generationWindow:(id)a4;
- (void)persistenceDidChangeFlags:(id)a3 messages:(id)a4 generationWindow:(id)a5;
- (void)persistenceDidChangeGlobalMessageID:(int64_t)a3 orConversationID:(int64_t)a4 message:(id)a5 generationWindow:(id)a6;
- (void)persistenceDidChangeReadLaterDate:(id)a3 messages:(id)a4 changeIsRemote:(BOOL)a5 generationWindow:(id)a6;
- (void)persistenceDidDeleteAllMessagesInMailboxesWithURLs:(id)a3 generationWindow:(id)a4;
- (void)persistenceDidDeleteMessages:(id)a3 generationWindow:(id)a4;
- (void)persistenceDidUpdateDisplayDateForMessages:(id)a3 changeIsRemote:(BOOL)a4 generation:(int64_t)a5;
- (void)persistenceDidUpdateFollowUpForMessages:(id)a3 generationWindow:(id)a4;
- (void)persistenceDidUpdateProperties:(id)a3 message:(id)a4 generationWindow:(id)a5;
- (void)persistenceIsAddingMailboxWithDatabaseID:(int64_t)a3 objectID:(id)a4 generationWindow:(id)a5;
- (void)persistenceIsAddingMessages:(id)a3 journaled:(BOOL)a4 generationWindow:(id)a5;
- (void)persistenceIsChangingConversationID:(int64_t)a3 messages:(id)a4 generationWindow:(id)a5;
- (void)persistenceIsChangingFlags:(id)a3 messages:(id)a4 generationWindow:(id)a5;
- (void)persistenceIsDeletingAllMessagesInMailboxWithURL:(id)a3 generationWindow:(id)a4;
- (void)persistenceIsDeletingMessages:(id)a3 generationWindow:(id)a4;
- (void)persistenceIsInitializingDatabaseWithConnection:(id)a3;
- (void)persistenceIsUpdatingDisplayDateForMessage:(id)a3 fromDate:(id)a4 generation:(int64_t)a5;
- (void)resetThreadScopesForMailboxScope:(id)a3;
- (void)setNeedsUpdateForThreadScope:(id)a3;
- (void)setThreadRecomputationDebouncer:(id)a3;
- (void)setThreadRecomputationScheduler:(id)a3;
- (void)test_tearDown;
- (void)threadObjectIDsForThreadScope:(id)a3 sortDescriptors:(id)a4 initialBatchSize:(unint64_t)a5 journaledObjectIDs:(id)a6 batchBlock:(id)a7;
- (void)threadScopeManager:(id)a3 gatherStatisticsForThreadScopesWithDatabaseIDs:(id)a4 block:(id)a5;
- (void)threadScopeManager:(id)a3 populateThreadScopesWithBlock:(id)a4;
- (void)updateLastViewedDateForThreadScope:(id)a3;
- (void)verifyConsistencyOfThreadScope:(id)a3;
@end

@implementation EDThreadPersistence

- (id)threadForObjectID:(id)a3 originatingQuery:(id)a4 error:(id *)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__42;
  v51 = __Block_byref_object_dispose__42;
  id v52 = 0;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__42;
  v45 = __Block_byref_object_dispose__42;
  id v46 = 0;
  v10 = [(EDThreadPersistence *)self database];
  v11 = [NSString stringWithUTF8String:"-[EDThreadPersistence threadForObjectID:originatingQuery:error:]"];
  uint64_t v32 = MEMORY[0x1E4F143A8];
  uint64_t v33 = 3221225472;
  v34 = __64__EDThreadPersistence_threadForObjectID_originatingQuery_error___block_invoke;
  v35 = &unk_1E6C06B80;
  v36 = self;
  id v12 = v8;
  id v37 = v12;
  v39 = &v41;
  id v13 = v9;
  id v38 = v13;
  v40 = &v47;
  objc_msgSend(v10, "__performReadWithCaller:usingBlock:", v11, &v32);

  if (a5)
  {
    v14 = v42;
    if (!v48[5] && !v42[5])
    {
      v15 = (void *)MEMORY[0x1E4F28C58];
      v16 = NSString;
      v17 = objc_msgSend(v12, "ef_publicDescription");
      v18 = [v16 stringWithFormat:@"Failed to get thread with objectID: %@", v17, v32, v33, v34, v35, v36, v37];
      uint64_t v19 = objc_msgSend(v15, "em_internalErrorWithReason:", v18);
      v20 = (void *)v42[5];
      v42[5] = v19;

      v14 = v42;
    }
    *a5 = (id) v14[5];
  }
  v21 = (void *)v48[5];
  if (v21)
  {
    v22 = [v21 subject];
    BOOL v23 = v22 == 0;

    if (v23)
    {
      v24 = +[EDThreadPersistence log];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)v48[5], "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        -[EDThreadPersistence threadForObjectID:originatingQuery:error:]();
      }

      EFSaveTailspin();
    }
    v25 = [(id)v48[5] senderList];
    BOOL v26 = [v25 count] == 0;

    if (v26)
    {
      v27 = +[EDThreadPersistence log];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)v48[5], "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        -[EDThreadPersistence threadForObjectID:originatingQuery:error:]();
      }

      EFSaveTailspin();
    }
  }
  else
  {
    v28 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = objc_msgSend((id)v42[5], "ef_publicDescription");
      *(_DWORD *)buf = 138543618;
      id v54 = v12;
      __int16 v55 = 2114;
      v56 = v29;
      _os_log_impl(&dword_1DB39C000, v28, OS_LOG_TYPE_DEFAULT, "Unable to return thread for objectID %{public}@ due to error: %{public}@", buf, 0x16u);
    }
  }
  id v30 = (id)v48[5];

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  return v30;
}

void __52__EDThreadPersistence__databaseIDForThreadObjectID___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  v6 = [v7 objectAtIndexedSubscript:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v6 databaseIDValue];

  *a4 = 1;
}

void __64__EDThreadPersistence_threadForObjectID_originatingQuery_error___block_invoke_2(uint64_t a1, void *a2)
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v30 = a2;
  id v3 = objc_alloc(MEMORY[0x1E4F608C0]);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __64__EDThreadPersistence_threadForObjectID_originatingQuery_error___block_invoke_3;
  v45[3] = &unk_1E6C063F0;
  id v4 = v30;
  id v46 = v4;
  v31 = (void *)[v3 initWithBuilder:v45];
  v5 = [v4 objectForKeyedSubscript:@"global_message_id"];
  uint64_t v6 = [v5 int64Value];

  if (v6)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F60338]) initWithGlobalMessageID:v6];
    id v8 = *(id *)(a1 + 40);
    if (!*(void *)(a1 + 40))
    {
      v29 = v7;
      id v9 = [*(id *)(a1 + 32) threadScope];
      v10 = [MEMORY[0x1E4F60390] predicateForMessagesWithThreadScope:v9];
      v11 = [MEMORY[0x1E4F60390] sortDescriptorForDateAscending:0];
      id v12 = objc_alloc(MEMORY[0x1E4F60418]);
      uint64_t v13 = objc_opt_class();
      v47[0] = v11;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
      uint64_t v15 = [v12 initWithTargetClass:v13 predicate:v10 sortDescriptors:v14];

      id v8 = (id)v15;
      id v7 = v29;
    }
    id v16 = objc_alloc(MEMORY[0x1E4F604D8]);
    uint64_t v17 = *(void *)(a1 + 32);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __64__EDThreadPersistence_threadForObjectID_originatingQuery_error___block_invoke_284;
    v32[3] = &unk_1E6C06B30;
    id v33 = v4;
    id v18 = v7;
    id v34 = v18;
    id v19 = *(id *)(a1 + 32);
    uint64_t v20 = *(void *)(a1 + 48);
    v21 = *(void **)(a1 + 56);
    id v35 = v19;
    uint64_t v36 = v20;
    id v37 = v21;
    id v38 = *(id *)(a1 + 64);
    id v39 = *(id *)(a1 + 72);
    id v40 = *(id *)(a1 + 80);
    id v41 = v31;
    char v44 = *(unsigned char *)(a1 + 120);
    id v42 = *(id *)(a1 + 88);
    id v43 = *(id *)(a1 + 96);
    uint64_t v22 = [v16 initWithObjectID:v17 originatingQuery:v8 builder:v32];
    uint64_t v23 = *(void *)(*(void *)(a1 + 112) + 8);
    v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;
  }
  else
  {
    v25 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      __64__EDThreadPersistence_threadForObjectID_originatingQuery_error___block_invoke_2_cold_1(a1, v25, v26);
    }

    uint64_t v27 = objc_msgSend(MEMORY[0x1E4F28C58], "em_itemNotFoundErrorWithItemID:", *(void *)(a1 + 32));
    uint64_t v28 = *(void *)(*(void *)(a1 + 104) + 8);
    id v18 = *(id *)(v28 + 40);
    *(void *)(v28 + 40) = v27;
  }
}

uint64_t __64__EDThreadPersistence_threadForObjectID_originatingQuery_error___block_invoke_197(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 stringValue];
  uint64_t v4 = [v2 isVIPAddress:v3];

  return v4;
}

void __53__EDThreadPersistence__mailboxesForThreadDatabaseID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 objectAtIndexedSubscript:0];
  id v6 = [v3 stringValue];

  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v6];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F60310]) initWithURL:v4];
  [*(id *)(a1 + 32) addObject:v5];
}

uint64_t __64__EDThreadPersistence_threadForObjectID_originatingQuery_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _databaseIDForThreadObjectID:*(void *)(a1 + 40)];
  if (v4 == *MEMORY[0x1E4F5FCC8])
  {
    v5 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __64__EDThreadPersistence_threadForObjectID_originatingQuery_error___block_invoke_cold_1((uint64_t *)(a1 + 40), v5, v6);
    }

    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "em_itemNotFoundErrorWithItemID:", *(void *)(a1 + 40));
LABEL_11:
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
    id v8 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v7;
    uint64_t v15 = 1;
    goto LABEL_27;
  }
  if (([v3 protectedDatabaseAttached] & 1) == 0)
  {
    v11 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __64__EDThreadPersistence_threadForObjectID_originatingQuery_error___block_invoke_cold_2((uint64_t *)(a1 + 40), v11, v12);
    }

    id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v7 = [v13 initWithDomain:*MEMORY[0x1E4F5FCD0] code:1025 userInfo:0];
    goto LABEL_11;
  }
  id v8 = [NSNumber numberWithLongLong:v4];
  id v9 = [*(id *)(a1 + 32) _mailboxesForThreadDatabaseID:v8];
  v60 = [*(id *)(a1 + 32) _sendersForThreadDatabaseID:v8];
  if ([v60 count])
  {
    v59 = 0;
    BOOL v10 = 1;
  }
  else
  {
    id v16 = [*(id *)(a1 + 32) _sendersFromMessagesForThreadObjectID:*(void *)(a1 + 40)];

    uint64_t v17 = [v16 count];
    BOOL v10 = v17 == 0;
    id v18 = @"no senders";
    if (!v17) {
      id v18 = 0;
    }
    v59 = v18;
    v60 = v16;
  }
  id v19 = [*(id *)(a1 + 32) _recipientsOfType:1 forThreadDatabaseID:v8];
  uint64_t v20 = [*(id *)(a1 + 32) _recipientsOfType:2 forThreadDatabaseID:v8];
  if ([v19 count] || objc_msgSend(v20, "count"))
  {
    v21 = v19;
    uint64_t v22 = v20;
    goto LABEL_18;
  }
  v21 = [*(id *)(a1 + 32) _recipientsOfType:1 fromMessagesForThreadObjectID:*(void *)(a1 + 40)];

  uint64_t v22 = [*(id *)(a1 + 32) _recipientsOfType:2 fromMessagesForThreadObjectID:*(void *)(a1 + 40)];

  if (![v21 count] && !objc_msgSend(v22, "count")) {
    goto LABEL_18;
  }
  if (!v10)
  {
    v59 = [(__CFString *)v59 stringByAppendingString:@" and no recipients"];
LABEL_18:
    if (v59) {
      [*(id *)(a1 + 32) _scheduleRecomputationForThread:*(void *)(a1 + 40) reason:v59];
    }
    else {
      v59 = 0;
    }
    goto LABEL_21;
  }
  v59 = @"no recipients";
  [*(id *)(a1 + 32) _scheduleRecomputationForThread:*(void *)(a1 + 40) reason:@"no recipients"];
LABEL_21:
  id v52 = v22;
  v53 = v21;
  uint64_t v23 = [*(id *)(a1 + 32) vipManager];
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __64__EDThreadPersistence_threadForObjectID_originatingQuery_error___block_invoke_197;
  v75[3] = &unk_1E6C062E8;
  id v51 = v23;
  id v76 = v51;
  char v24 = objc_msgSend(v60, "ef_any:", v75);
  +[EDMessagePersistence messagesTableName];
  id v54 = v50 = v24;
  v25 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"date" table:@"threads"];
  uint64_t v26 = *MEMORY[0x1E4F60D08];
  __int16 v55 = [v25 leftOuterJoin:@"conversations" sourceColumn:@"conversation" targetColumn:*MEMORY[0x1E4F60D08]];
  uint64_t v27 = [v25 leftOuterJoin:v54 sourceColumn:@"display_message" targetColumn:v26];
  v61 = [v27 leftOuterJoin:@"message_global_data" sourceColumn:@"global_message_id" targetColumn:v26];
  v58 = [v27 leftOuterJoin:@"subjects" sourceColumn:@"subject" targetColumn:v26];
  uint64_t v57 = [v27 leftOuterJoin:@"summaries" sourceColumn:@"summary" targetColumn:v26];
  v56 = [v27 leftOuterJoin:@"brand_indicators" sourceColumn:@"brand_indicator" targetColumn:v26];
  [v27 addResultColumn:@"subject_prefix"];
  [v27 addResultColumn:@"unsubscribe_type"];
  [v58 addResultColumn:@"subject"];
  [v57 addResultColumn:@"summary"];
  [v56 addResultColumn:@"url" alias:@"brand_indicator_location"];
  [v25 addResultColumn:@"display_message"];
  [v25 addResultColumn:@"newest_message"];
  [v27 addResultColumn:@"global_message_id"];
  [v25 addResultColumn:@"date"];
  [v25 addResultColumn:@"display_date"];
  [v25 addResultColumn:@"read_later_date"];
  [v61 addResultColumn:@"follow_up_start_date"];
  [v61 addResultColumn:@"follow_up_end_date"];
  [v61 addResultColumn:@"follow_up_jsonstringformodelevaluationforsuggestions"];
  [v25 addResultColumn:@"read"];
  [v25 addResultColumn:@"flagged"];
  [v25 addResultColumn:@"has_red_flag"];
  [v25 addResultColumn:@"has_orange_flag"];
  [v25 addResultColumn:@"has_yellow_flag"];
  [v25 addResultColumn:@"has_green_flag"];
  [v25 addResultColumn:@"has_blue_flag"];
  [v25 addResultColumn:@"has_purple_flag"];
  [v25 addResultColumn:@"has_gray_flag"];
  [v25 addResultColumn:@"draft"];
  [v25 addResultColumn:@"replied"];
  [v25 addResultColumn:@"forwarded"];
  [v25 addResultColumn:@"redirected"];
  [v25 addResultColumn:@"junk_level_set_by_user"];
  [v25 addResultColumn:@"junk_level"];
  [v25 addResultColumn:@"has_unflagged"];
  [v25 addResultColumn:@"has_attachments"];
  [v55 addResultColumn:@"flags"];
  [v25 addResultColumn:@"count"];
  [v25 addResultColumn:@"journaled"];
  if (_os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
  {
    uint64_t v28 = [v25 leftOuterJoin:v54 alias:@"newest_message" sourceColumn:@"newest_message" targetColumn:v26];
    v29 = [v28 leftOuterJoin:@"message_global_data" alias:@"newest_message_global_data" sourceColumn:@"global_message_id" targetColumn:v26];
    [v29 addResultColumn:@"rowid" alias:@"newest_message_global_message_id"];
    id v30 = [v29 leftOuterJoin:@"generated_summaries" sourceColumn:@"generated_summary" targetColumn:v26];
    [v30 addResultColumn:@"summary" alias:@"generated_summary"];
    [v29 addResultColumn:@"urgent"];
  }
  if (_os_feature_enabled_impl())
  {
    v31 = +[EDBusinessPersistence businessAddressesTableName];
    uint64_t v32 = +[EDBusinessPersistence businessAddressesAddressColumnName];
    id v33 = [v27 leftOuterJoin:v31 sourceColumn:@"sender" targetColumn:v32];

    +[EDCategoryPersistence addCategoryColumnsToMessagesSelectComponent:v27 globalMessagesSelectComponent:v61 businessAddressesSelectComponent:v33];
    id v34 = +[EDMessagePersistence messageGlobalDataValidationState];
    [v61 addResultColumn:v34];

    id v35 = +[EDBusinessPersistence businessesTableName];
    uint64_t v36 = [v33 leftOuterJoin:v35 sourceColumn:@"business" targetColumn:v26];

    id v37 = +[EDBusinessPersistence businessesBrandIDColumnName];
    [v36 addResultColumn:v37];
  }
  id v38 = [MEMORY[0x1E4F60E78] table:@"threads" column:v26];
  id v39 = [v38 equalTo:v8];
  [v25 setWhere:v39];

  [v25 setLimit:1];
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __64__EDThreadPersistence_threadForObjectID_originatingQuery_error___block_invoke_2;
  v62[3] = &unk_1E6C06B58;
  id v40 = *(id *)(a1 + 40);
  id v42 = *(void **)(a1 + 48);
  uint64_t v41 = *(void *)(a1 + 56);
  id v63 = v40;
  uint64_t v72 = v41;
  id v43 = v42;
  uint64_t v73 = *(void *)(a1 + 64);
  uint64_t v44 = *(void *)(a1 + 32);
  id v64 = v43;
  uint64_t v65 = v44;
  id v66 = v3;
  id v45 = v60;
  id v67 = v45;
  id v46 = v53;
  id v68 = v46;
  id v47 = v52;
  id v69 = v47;
  char v74 = v50;
  id v48 = v9;
  id v70 = v48;
  v71 = @"newest_message_global_message_id";
  uint64_t v15 = [v66 executeSelectStatement:v25 withBlock:v62 error:0];

LABEL_27:
  return v15;
}

- (EMVIPManager)vipManager
{
  return self->_vipManager;
}

- (id)_flagColorsFromRow:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  v5 = [v3 objectForKeyedSubscript:@"has_red_flag"];
  int v6 = [v5 BOOLValue];

  if (v6) {
    [v4 addIndex:0];
  }
  uint64_t v7 = [v3 objectForKeyedSubscript:@"has_orange_flag"];
  int v8 = [v7 BOOLValue];

  if (v8) {
    [v4 addIndex:1];
  }
  id v9 = [v3 objectForKeyedSubscript:@"has_yellow_flag"];
  int v10 = [v9 BOOLValue];

  if (v10) {
    [v4 addIndex:2];
  }
  v11 = [v3 objectForKeyedSubscript:@"has_green_flag"];
  int v12 = [v11 BOOLValue];

  if (v12) {
    [v4 addIndex:3];
  }
  id v13 = [v3 objectForKeyedSubscript:@"has_blue_flag"];
  int v14 = [v13 BOOLValue];

  if (v14) {
    [v4 addIndex:4];
  }
  uint64_t v15 = [v3 objectForKeyedSubscript:@"has_purple_flag"];
  int v16 = [v15 BOOLValue];

  if (v16) {
    [v4 addIndex:5];
  }
  uint64_t v17 = [v3 objectForKeyedSubscript:@"has_gray_flag"];
  int v18 = [v17 BOOLValue];

  if (v18) {
    [v4 addIndex:6];
  }
  if (![v4 count]) {
    [v4 addIndex:0];
  }

  return v4;
}

void __75__EDThreadPersistence__addressesFromSelectStatement_additionalRowHandling___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v17 = a2;
  uint64_t v7 = [v17 objectForKeyedSubscript:@"address"];
  int v8 = [v7 stringValue];

  id v9 = [v17 objectForKeyedSubscript:@"comment"];
  int v10 = [v9 stringValue];

  v11 = (void *)[objc_alloc(MEMORY[0x1E4F60800]) initWithString:v8];
  [v11 setDisplayName:v10];
  uint64_t v12 = [v11 emailAddressValue];
  id v13 = (void *)v12;
  if (v12) {
    int v14 = (void *)v12;
  }
  else {
    int v14 = v8;
  }
  id v15 = v14;

  [*(id *)(a1 + 32) addObject:v15];
  uint64_t v16 = *(void *)(a1 + 40);
  if (v16) {
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v16 + 16))(v16, v17, a3, a4);
  }
}

void __103__EDThreadPersistence__enumerateThreadObjectIDsForThreadScope_filterClause_sortDescriptors_batchBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = [a2 objectAtIndexedSubscript:0];
  uint64_t v3 = [v4 databaseIDValue];

  id v5 = (id)[objc_alloc(MEMORY[0x1E4F604E0]) initWithConversationID:v3 threadScope:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __116__EDThreadPersistence_threadObjectIDsForThreadScope_sortDescriptors_initialBatchSize_journaledObjectIDs_batchBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addObject:");
  if ((unint64_t)[*(id *)(a1 + 32) count] >= *(void *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                              + 24))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    int v6 = (void *)[*(id *)(a1 + 32) copy];
    (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v5 + 16))(v5, v6, *(void *)(*(void *)(a1 + 48) + 8) + 24, a3);

    [*(id *)(a1 + 32) removeAllObjects];
  }
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (EMBlockedSenderManager)blockedSenderManager
{
  return self->_blockedSenderManager;
}

- (id)_mailboxesForThreadDatabaseID:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v6 = [(EDThreadPersistence *)self database];
  id v7 = [NSString stringWithUTF8String:"-[EDThreadPersistence _mailboxesForThreadDatabaseID:]"];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __53__EDThreadPersistence__mailboxesForThreadDatabaseID___block_invoke;
  v18[3] = &unk_1E6BFF3D8;
  id v8 = v4;
  id v19 = v8;
  id v9 = v5;
  id v20 = v9;
  objc_msgSend(v6, "__performReadWithCaller:usingBlock:", v7, v18);

  int v10 = [(EDThreadPersistence *)self messagePersistence];
  v11 = [v10 mailboxPersistence];
  uint64_t v12 = [v11 mailboxProvider];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __53__EDThreadPersistence__mailboxesForThreadDatabaseID___block_invoke_3;
  v16[3] = &unk_1E6C06BD0;
  id v17 = v12;
  id v13 = v12;
  int v14 = objc_msgSend(v9, "ef_compactMap:", v16);

  return v14;
}

void __64__EDThreadPersistence_threadForObjectID_originatingQuery_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v12 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"read"];
  objc_msgSend(v12, "setRead:", objc_msgSend(v3, "BOOLValue"));

  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"flagged"];
  objc_msgSend(v12, "setFlagged:", objc_msgSend(v4, "BOOLValue"));

  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"draft"];
  objc_msgSend(v12, "setDraft:", objc_msgSend(v5, "BOOLValue"));

  int v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"replied"];
  objc_msgSend(v12, "setReplied:", objc_msgSend(v6, "BOOLValue"));

  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"forwarded"];
  objc_msgSend(v12, "setForwarded:", objc_msgSend(v7, "BOOLValue"));

  id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"redirected"];
  objc_msgSend(v12, "setRedirected:", objc_msgSend(v8, "BOOLValue"));

  id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"junk_level_set_by_user"];
  objc_msgSend(v12, "setJunkLevelSetByUser:", objc_msgSend(v9, "BOOLValue"));

  int v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"junk_level"];
  v11 = [v10 numberValue];
  objc_msgSend(v12, "setJunkLevel:", objc_msgSend(v11, "unsignedIntegerValue"));
}

- (int64_t)_databaseIDForThreadObjectID:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 conversationID];
  int64_t v6 = *MEMORY[0x1E4F5FCC8];
  if (v5 == *MEMORY[0x1E4F5FCC8])
  {
    id v7 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[EDThreadPersistence _databaseIDForThreadObjectID:]();
    }
  }
  else
  {
    id v8 = [(EDThreadPersistence *)self threadScopeManager];
    id v9 = [v4 threadScope];
    uint64_t v10 = [v8 databaseIDForThreadScope:v9];

    if (v10 == v6)
    {
      v11 = +[EDThreadPersistence log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[EDThreadPersistence _databaseIDForThreadObjectID:]();
      }

      int64_t v5 = v6;
    }
    else
    {
      uint64_t v16 = 0;
      id v17 = &v16;
      uint64_t v18 = 0x2020000000;
      int64_t v19 = v6;
      id v12 = [(EDThreadPersistence *)self database];
      id v13 = [NSString stringWithUTF8String:"-[EDThreadPersistence _databaseIDForThreadObjectID:]"];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __52__EDThreadPersistence__databaseIDForThreadObjectID___block_invoke;
      v15[3] = &unk_1E6C06C90;
      v15[6] = v10;
      v15[7] = v5;
      v15[4] = self;
      v15[5] = &v16;
      objc_msgSend(v12, "__performReadWithCaller:usingBlock:", v13, v15);

      int64_t v5 = v17[3];
      _Block_object_dispose(&v16, 8);
    }
  }

  return v5;
}

- (id)_addressesFromSelectStatement:(id)a3 additionalRowHandling:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = [(EDThreadPersistence *)self database];
  uint64_t v10 = [NSString stringWithUTF8String:"-[EDThreadPersistence _addressesFromSelectStatement:additionalRowHandling:]"];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__EDThreadPersistence__addressesFromSelectStatement_additionalRowHandling___block_invoke;
  v17[3] = &unk_1E6C064B8;
  id v11 = v6;
  id v18 = v11;
  id v12 = v8;
  id v19 = v12;
  id v13 = v7;
  id v20 = v13;
  objc_msgSend(v9, "__performReadWithCaller:usingBlock:", v10, v17);

  int v14 = v20;
  id v15 = v12;

  return v15;
}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

uint64_t __75__EDThreadPersistence__addressesFromSelectStatement_additionalRowHandling___block_invoke(uint64_t a1, void *a2)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__EDThreadPersistence__addressesFromSelectStatement_additionalRowHandling___block_invoke_2;
  v7[3] = &unk_1E6C06AE0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  uint64_t v5 = [a2 executeSelectStatement:v4 withBlock:v7 error:0];

  return v5;
}

- (EDThreadScopeManager)threadScopeManager
{
  return self->_threadScopeManager;
}

uint64_t __53__EDThreadPersistence__mailboxesForThreadDatabaseID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[EDPersistenceDatabaseSchema mailboxesTableName];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"url" table:v4];
  id v6 = (id)[v5 join:@"thread_mailboxes" sourceColumn:*MEMORY[0x1E4F60D08] targetColumn:@"mailbox"];
  id v7 = [MEMORY[0x1E4F60E78] table:@"thread_mailboxes" column:@"thread"];
  id v8 = [v7 equalTo:*(void *)(a1 + 32)];
  [v5 setWhere:v8];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__EDThreadPersistence__mailboxesForThreadDatabaseID___block_invoke_2;
  v11[3] = &unk_1E6BFF3B0;
  id v12 = *(id *)(a1 + 40);
  uint64_t v9 = [v3 executeSelectStatement:v5 withBlock:v11 error:0];

  return v9;
}

uint64_t __52__EDThreadPersistence__databaseIDForThreadObjectID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _threadDatabaseIDExpressionForThreadScopeDatabaseID:*(void *)(a1 + 48) conversation:*(void *)(a1 + 56)];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__EDThreadPersistence__databaseIDForThreadObjectID___block_invoke_2;
  v7[3] = &unk_1E6BFF4C8;
  void v7[4] = *(void *)(a1 + 40);
  uint64_t v5 = [v3 executeSelectStatement:v4 withBlock:v7 error:0];

  return v5;
}

- (id)_threadExpressionForThreadScopeDatabaseID:(int64_t)a3 conversation:(int64_t)a4
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v6 = [MEMORY[0x1E4F60E78] table:@"threads" column:@"scope"];
  id v7 = [MEMORY[0x1E4F60E78] table:@"threads" column:@"conversation"];
  id v8 = objc_alloc(MEMORY[0x1E4F60E48]);
  uint64_t v9 = [NSNumber numberWithLongLong:a3];
  uint64_t v10 = [v6 equalTo:v9];
  v16[0] = v10;
  id v11 = [NSNumber numberWithLongLong:a4];
  id v12 = [v7 equalTo:v11];
  v16[1] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  int v14 = (void *)[v8 initWithExpressions:v13];

  return v14;
}

- (id)_threadDatabaseIDExpressionForThreadScopeDatabaseID:(int64_t)a3 conversation:(int64_t)a4
{
  id v7 = objc_alloc(MEMORY[0x1E4F60EF8]);
  id v8 = (void *)[v7 initWithResultColumn:*MEMORY[0x1E4F60D08] table:@"threads"];
  uint64_t v9 = [(EDThreadPersistence *)self _threadExpressionForThreadScopeDatabaseID:a3 conversation:a4];
  [v8 setWhere:v9];

  [v8 setLimit:1];

  return v8;
}

- (id)_sendersForThreadDatabaseID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"address" table:@"addresses"];
  [v5 addResultColumn:@"comment"];
  id v6 = [v5 join:@"thread_senders" sourceColumn:*MEMORY[0x1E4F60D08] targetColumn:@"address"];
  id v7 = [MEMORY[0x1E4F60E78] table:@"thread_senders" column:@"thread"];
  id v8 = [v7 equalTo:v4];
  [v5 setWhere:v8];

  [v6 orderByColumn:@"priority" ascending:0];
  [v6 orderByColumn:@"date" ascending:0];
  uint64_t v9 = [(EDThreadPersistence *)self _addressesFromSelectStatement:v5 additionalRowHandling:0];

  return v9;
}

- (id)_recipientsOfType:(unint64_t)a3 forThreadDatabaseID:(id)a4
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"address" table:@"addresses"];
  [v7 addResultColumn:@"comment"];
  id v8 = [v7 join:@"thread_recipients" sourceColumn:*MEMORY[0x1E4F60D08] targetColumn:@"address"];
  uint64_t v9 = [MEMORY[0x1E4F60E78] table:@"thread_recipients" column:@"thread"];
  uint64_t v10 = [v9 equalTo:v6];

  id v11 = [MEMORY[0x1E4F60E78] table:@"thread_recipients" column:@"type"];
  id v12 = [NSNumber numberWithUnsignedInteger:a3];
  id v13 = [v11 equalTo:v12];

  id v14 = objc_alloc(MEMORY[0x1E4F60E48]);
  v19[0] = v10;
  v19[1] = v13;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  uint64_t v16 = (void *)[v14 initWithExpressions:v15];
  [v7 setWhere:v16];

  [v8 orderByColumn:@"priority" ascending:0];
  [v8 orderByColumn:@"date" ascending:0];
  id v17 = [(EDThreadPersistence *)self _addressesFromSelectStatement:v7 additionalRowHandling:0];

  return v17;
}

uint64_t __58__EDThreadPersistence_updateLastViewedDateForThreadScope___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) threadScopeManager];
  uint64_t v5 = [v4 databaseIDForThreadScope:*(void *)(a1 + 40)];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"thread_scopes" conflictResolution:4];
  [v6 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"last_viewed"];
  id v7 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
  id v8 = [NSNumber numberWithLongLong:v5];
  uint64_t v9 = [v7 equalTo:v8];
  [v6 setWhereClause:v9];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v3 executeUpdateStatement:v6 error:0];
  uint64_t v10 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);

  return v10;
}

id __53__EDThreadPersistence__mailboxesForThreadDatabaseID___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) mailboxForObjectID:a2];

  return v2;
}

BOOL __103__EDThreadPersistence__enumerateThreadObjectIDsForThreadScope_filterClause_sortDescriptors_batchBlock___block_invoke(uint64_t a1, void *a2)
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) threadScopeManager];
  uint64_t v5 = [v4 databaseIDForThreadScope:*(void *)(a1 + 40)];

  if (v5 == *MEMORY[0x1E4F5FCC8])
  {
    BOOL v6 = 1;
  }
  else
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"conversation" table:@"threads"];
    id v8 = [MEMORY[0x1E4F60E78] column:@"scope"];
    uint64_t v9 = [NSNumber numberWithLongLong:v5];
    uint64_t v10 = [v8 equalTo:v9];

    if (*(void *)(a1 + 48))
    {
      id v11 = objc_alloc(MEMORY[0x1E4F60E48]);
      uint64_t v12 = *(void *)(a1 + 48);
      v19[0] = v10;
      v19[1] = v12;
      id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
      id v14 = (void *)[v11 initWithExpressions:v13];
      [v7 setWhere:v14];
    }
    else
    {
      [v7 setWhere:v10];
    }
    [*(id *)(a1 + 32) _addOrderByToThreadSelect:v7 forSortDescriptors:*(void *)(a1 + 56)];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __103__EDThreadPersistence__enumerateThreadObjectIDsForThreadScope_filterClause_sortDescriptors_batchBlock___block_invoke_2;
    void v16[3] = &unk_1E6C06AE0;
    id v17 = *(id *)(a1 + 40);
    id v18 = *(id *)(a1 + 64);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v3 executeSelectStatement:v7 withBlock:v16 error:0];
    BOOL v6 = *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) != 0;
  }
  return v6;
}

- (void)_addOrderByToThreadSelect:(id)a3 forSortDescriptors:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = a4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v20;
    uint64_t v8 = *MEMORY[0x1E4F5FE30];
    uint64_t v9 = *MEMORY[0x1E4F5FE38];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v12 = [v11 key];
        int v13 = [v12 isEqualToString:v8];

        if (v13)
        {
          uint64_t v14 = [v11 ascending];
          id v15 = @"date";
        }
        else
        {
          uint64_t v16 = [v11 key];
          int v17 = [v16 isEqualToString:v9];

          if (!v17) {
            continue;
          }
          uint64_t v14 = [v11 ascending];
          id v15 = @"display_date";
        }
        [v5 orderByColumn:v15 fromTable:@"threads" ascending:v14];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  [v5 orderByColumn:@"conversation" fromTable:@"threads" ascending:1];
}

- (void)threadObjectIDsForThreadScope:(id)a3 sortDescriptors:(id)a4 initialBatchSize:(unint64_t)a5 journaledObjectIDs:(id)a6 batchBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = a5;
  uint64_t v16 = [(EDThreadPersistence *)self database];
  int v17 = [NSString stringWithUTF8String:"-[EDThreadPersistence threadObjectIDsForThreadScope:sortDescriptors:initialBatchSize:journaledObjectIDs:batchBlock:]"];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __116__EDThreadPersistence_threadObjectIDsForThreadScope_sortDescriptors_initialBatchSize_journaledObjectIDs_batchBlock___block_invoke;
  v22[3] = &unk_1E6C06AB8;
  v22[4] = self;
  id v18 = v12;
  id v23 = v18;
  id v19 = v13;
  id v24 = v19;
  uint64_t v27 = v28;
  id v20 = v15;
  id v26 = v20;
  id v21 = v14;
  id v25 = v21;
  objc_msgSend(v16, "__performReadWithCaller:usingBlock:", v17, v22);

  _Block_object_dispose(v28, 8);
}

- (unint64_t)persistenceStateForThreadScope:(id)a3 wantsPrecomputed:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unsigned __int8 v14 = 0;
  if ([(EDThreadPersistence *)self _isThreadScopePrecomputed:v6 shouldMigrate:&v14])
  {
    unint64_t v7 = 1;
  }
  else
  {
    int v8 = v14;
    if (v4 && !v14)
    {
      uint64_t v9 = +[EDThreadPersistence log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[EDThreadPersistence persistenceStateForThreadScope:wantsPrecomputed:]();
      }

      int v8 = v14;
    }
    if (v8)
    {
      p_migratingThreadScopesLock = &self->_migratingThreadScopesLock;
      os_unfair_lock_lock(&self->_migratingThreadScopesLock);
      if ([(NSMutableArray *)self->_migratingThreadScopes containsObject:v6])
      {
        id v11 = +[EDThreadPersistence log];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v16 = v6;
          _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_DEFAULT, "Migration in progress for threadscope: %{public}@", buf, 0xCu);
        }

        unsigned __int8 v14 = 0;
      }
      else
      {
        id v12 = +[EDThreadPersistence log];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v16 = v6;
          _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_DEFAULT, "Migration requested for threadscope: %{public}@", buf, 0xCu);
        }

        [(NSMutableArray *)self->_migratingThreadScopes addObject:v6];
      }
      os_unfair_lock_unlock(p_migratingThreadScopesLock);
      unint64_t v7 = 2 * v14;
    }
    else
    {
      unint64_t v7 = 0;
    }
  }

  return v7;
}

- (BOOL)_isThreadScopePrecomputed:(id)a3 shouldMigrate:(BOOL *)a4
{
  id v6 = a3;
  if ([MEMORY[0x1E4F602E0] preferenceEnabled:2])
  {
    char v7 = 0;
    *a4 = 0;
  }
  else
  {
    int v8 = [(EDThreadPersistence *)self messagePersistence];
    uint64_t v9 = [v8 mailboxPersistence];
    uint64_t v10 = [v9 mailboxProvider];

    id v11 = [(EDThreadPersistence *)self threadScopeManager];
    char v7 = [v11 isThreadScopePrecomputed:v6 mailboxProvider:v10 shouldMigrate:a4];
  }
  return v7;
}

uint64_t __116__EDThreadPersistence_threadObjectIDsForThreadScope_sortDescriptors_initialBatchSize_journaledObjectIDs_batchBlock___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) threadScopeManager];
  uint64_t v3 = [v2 databaseIDForThreadScope:*(void *)(a1 + 40)];

  if (v3 == *MEMORY[0x1E4F5FCC8]) {
    return 1;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [MEMORY[0x1E4F60E78] column:@"journaled"];
  char v7 = [v6 equalTo:&unk_1F35BB198];

  int v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __116__EDThreadPersistence_threadObjectIDsForThreadScope_sortDescriptors_initialBatchSize_journaledObjectIDs_batchBlock___block_invoke_2;
  v24[3] = &unk_1E6C06A68;
  id v11 = v5;
  id v25 = v11;
  long long v20 = *(_OWORD *)(a1 + 64);
  id v12 = (id)v20;
  long long v26 = v20;
  int v13 = [v8 _enumerateThreadObjectIDsForThreadScope:v9 filterClause:v7 sortDescriptors:v10 batchBlock:v24];
  char v23 = 0;
  if ([v11 count]) {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  unsigned __int8 v14 = objc_msgSend(MEMORY[0x1E4F60E78], "column:", @"journaled", v20);
  id v15 = [v14 equalTo:&unk_1F35BB1B0];

  id v16 = *(void **)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __116__EDThreadPersistence_threadObjectIDsForThreadScope_sortDescriptors_initialBatchSize_journaledObjectIDs_batchBlock___block_invoke_3;
  v21[3] = &unk_1E6C06A90;
  uint64_t v18 = *(void *)(a1 + 48);
  id v22 = *(id *)(a1 + 56);
  uint64_t v4 = v13 & [v16 _enumerateThreadObjectIDsForThreadScope:v17 filterClause:v15 sortDescriptors:v18 batchBlock:v21];

  return v4;
}

- (BOOL)_enumerateThreadObjectIDsForThreadScope:(id)a3 filterClause:(id)a4 sortDescriptors:(id)a5 batchBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 1;
  unsigned __int8 v14 = [(EDThreadPersistence *)self database];
  id v15 = [NSString stringWithUTF8String:"-[EDThreadPersistence _enumerateThreadObjectIDsForThreadScope:filterClause:sortDescriptors:batchBlock:]"];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __103__EDThreadPersistence__enumerateThreadObjectIDsForThreadScope_filterClause_sortDescriptors_batchBlock___block_invoke;
  v21[3] = &unk_1E6C06B08;
  void v21[4] = self;
  id v16 = v10;
  id v22 = v16;
  id v17 = v11;
  id v23 = v17;
  id v18 = v12;
  id v24 = v18;
  long long v26 = &v27;
  id v19 = v13;
  id v25 = v19;
  objc_msgSend(v14, "__performReadWithCaller:usingBlock:", v15, v21);

  LOBYTE(v10) = *((unsigned char *)v28 + 24);
  _Block_object_dispose(&v27, 8);

  return (char)v10;
}

- (void)updateLastViewedDateForThreadScope:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  id v6 = [(EDThreadPersistence *)self database];
  char v7 = [NSString stringWithUTF8String:"-[EDThreadPersistence updateLastViewedDateForThreadScope:]"];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __58__EDThreadPersistence_updateLastViewedDateForThreadScope___block_invoke;
  unsigned __int8 v14 = &unk_1E6C01950;
  id v15 = self;
  id v8 = v4;
  id v16 = v8;
  id v9 = v5;
  id v17 = v9;
  id v18 = &v19;
  objc_msgSend(v6, "__performWriteWithCaller:usingBlock:", v7, &v11);

  if (*((unsigned char *)v20 + 24))
  {
    id v10 = [(EDThreadPersistence *)self threadScopeManager];
    [v10 setLastViewedDate:v9 forThreadScope:v8];
  }
  _Block_object_dispose(&v19, 8);
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__EDThreadPersistence_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_94 != -1) {
    dispatch_once(&log_onceToken_94, block);
  }
  v2 = (void *)log_log_94;

  return (OS_os_log *)v2;
}

void __26__EDThreadPersistence_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_94;
  log_log_94 = (uint64_t)v1;
}

+ (OS_os_log)signpostLog
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__EDThreadPersistence_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_10 != -1) {
    dispatch_once(&signpostLog_onceToken_10, block);
  }
  v2 = (void *)signpostLog_log_10;

  return (OS_os_log *)v2;
}

void __34__EDThreadPersistence_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  v2 = (void *)signpostLog_log_10;
  signpostLog_log_10 = (uint64_t)v1;
}

- (unint64_t)signpostID
{
  id v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4
{
  v38[6] = *MEMORY[0x1E4F143B8];
  v31 = [a1 threadScopesTableSchema];
  id v5 = [a1 threadsTableSchema];
  char v30 = [a1 threadMailboxesTableSchema];
  uint64_t v29 = [a1 threadSendersTableSchema];
  uint64_t v28 = [a1 threadRecipientsTableSchema];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__EDThreadPersistence_tablesAndForeignKeysToResolve_associationsToResolve___block_invoke_2;
  aBlock[3] = &unk_1E6BFF250;
  id v35 = &__block_literal_global_84;
  id v6 = (void (**)(void *, void *, __CFString *, void *))_Block_copy(aBlock);
  v6[2](v6, v5, @"scope", v31);
  v6[2](v6, v30, @"thread", v5);
  v6[2](v6, v29, @"thread", v5);
  v6[2](v6, v28, @"thread", v5);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __75__EDThreadPersistence_tablesAndForeignKeysToResolve_associationsToResolve___block_invoke_4;
  v32[3] = &unk_1E6C06A18;
  id v33 = &__block_literal_global_128;
  char v7 = (void (**)(void *, void *, __CFString *, void *))_Block_copy(v32);
  id v8 = +[EDPersistenceDatabaseSchema mailboxesTableName];
  uint64_t v27 = v7[2](v7, v31, @"mailbox", v8);

  id v9 = +[EDConversationPersistence conversationsTableName];
  long long v26 = v7[2](v7, v5, @"conversation", v9);

  id v10 = +[EDMessagePersistence messagesTableName];
  id v25 = __75__EDThreadPersistence_tablesAndForeignKeysToResolve_associationsToResolve___block_invoke_3((uint64_t)v10, v5, @"newest_read_message", v10, 3);

  uint64_t v11 = +[EDMessagePersistence messagesTableName];
  uint64_t v12 = __75__EDThreadPersistence_tablesAndForeignKeysToResolve_associationsToResolve___block_invoke_3((uint64_t)v11, v5, @"newest_message", v11, 3);

  id v13 = +[EDMessagePersistence messagesTableName];
  unsigned __int8 v14 = __75__EDThreadPersistence_tablesAndForeignKeysToResolve_associationsToResolve___block_invoke_3((uint64_t)v13, v5, @"display_message", v13, 3);

  id v15 = +[EDPersistenceDatabaseSchema mailboxesTableName];
  id v16 = v7[2](v7, v30, @"mailbox", v15);

  id v17 = +[EDMessagePersistence addressesTableName];
  id v18 = __75__EDThreadPersistence_tablesAndForeignKeysToResolve_associationsToResolve___block_invoke_5((uint64_t)v17, v29, @"address", v17);

  uint64_t v19 = +[EDMessagePersistence addressesTableName];
  long long v20 = __75__EDThreadPersistence_tablesAndForeignKeysToResolve_associationsToResolve___block_invoke_5((uint64_t)v19, v28, @"address", v19);

  v38[0] = v27;
  v38[1] = v26;
  v38[2] = v25;
  v38[3] = v12;
  v38[4] = v14;
  v38[5] = v16;
  *a3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:6];
  v37[0] = v18;
  v37[1] = v20;
  *a4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
  v36[0] = v31;
  v36[1] = v5;
  v36[2] = v30;
  v36[3] = v29;
  v36[4] = v28;
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:5];

  return v21;
}

void __75__EDThreadPersistence_tablesAndForeignKeysToResolve_associationsToResolve___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v9 = a4;
  id v8 = [a2 columnForName:a3];
  [v8 setAsForeignKeyForTable:v9 onDelete:a5 onUpdate:0];
}

uint64_t __75__EDThreadPersistence_tablesAndForeignKeysToResolve_associationsToResolve___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

EDPersistenceForeignKeyPlaceholder *__75__EDThreadPersistence_tablesAndForeignKeysToResolve_associationsToResolve___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v8 = a4;
  id v9 = [a2 columnForName:a3];
  id v10 = [[EDPersistenceForeignKeyPlaceholder alloc] initWithColumn:v9 tableName:v8 onDelete:a5 onUpdate:0];

  return v10;
}

id __75__EDThreadPersistence_tablesAndForeignKeysToResolve_associationsToResolve___block_invoke_4(uint64_t a1)
{
  os_log_t v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return v1;
}

EDPersistenceAssociationPlaceholder *__75__EDThreadPersistence_tablesAndForeignKeysToResolve_associationsToResolve___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  char v7 = [a2 columnForName:a3];
  id v8 = [[EDPersistenceAssociationPlaceholder alloc] initWithColumn:v7 tableName:v6];

  return v8;
}

+ (EFSQLTableSchema)threadScopesTableSchema
{
  v84[5] = *MEMORY[0x1E4F143B8];
  id v70 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"mailbox" nullable:1];
  id v67 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"mailbox_type" nullable:1];
  id v68 = [MEMORY[0x1E4F60E80] blobColumnWithName:@"filter_predicate" nullable:1];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  v84[0] = v70;
  v84[1] = v67;
  v84[2] = v68;
  id v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"needs_update" nullable:0 defaultValue:&unk_1F35BB198];
  v84[3] = v3;
  os_signpost_id_t v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"last_viewed" nullable:0 defaultValue:&unk_1F35BB198];
  v84[4] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:5];
  id v6 = (void *)[v2 initWithName:@"thread_scopes" rowIDType:2 columns:v5];

  id v69 = [v70 columnExpression];
  id v66 = [v67 columnExpression];
  uint64_t v65 = [v68 columnExpression];
  id v7 = objc_alloc(MEMORY[0x1E4F60E48]);
  id v8 = [v69 isNotNull];
  v83[0] = v8;
  id v9 = [v66 isNull];
  v83[1] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:2];
  id v64 = (void *)[v7 initWithExpressions:v10];

  id v11 = objc_alloc(MEMORY[0x1E4F60E48]);
  uint64_t v12 = [v69 isNull];
  v82[0] = v12;
  id v13 = [v66 isNotNull];
  v82[1] = v13;
  unsigned __int8 v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:2];
  id v63 = (void *)[v11 initWithExpressions:v14];

  id v15 = objc_alloc(MEMORY[0x1E4F60ED8]);
  v81[0] = v64;
  v81[1] = v63;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:2];
  v62 = (void *)[v15 initWithExpressions:v16];

  [v6 addCheckConstraintForExpression:v62];
  id v17 = objc_alloc(MEMORY[0x1E4F60E48]);
  id v18 = [v69 isNotNull];
  v80[0] = v18;
  uint64_t v19 = [v65 isNull];
  v80[1] = v19;
  long long v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:2];
  uint64_t v21 = (void *)[v17 initWithExpressions:v20];

  id v22 = objc_alloc(MEMORY[0x1E4F60EB0]);
  id v23 = [v6 name];
  id v24 = [v70 name];
  v79 = v24;
  id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];
  v61 = (void *)[v22 initWithTableName:v23 columnNames:v25 where:v21 unique:1];

  [v6 addIndex:v61];
  id v26 = objc_alloc(MEMORY[0x1E4F60E48]);
  uint64_t v27 = [v69 isNotNull];
  v78[0] = v27;
  uint64_t v28 = [v65 isNotNull];
  v78[1] = v28;
  uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:2];
  char v30 = (void *)[v26 initWithExpressions:v29];

  id v31 = objc_alloc(MEMORY[0x1E4F60EB0]);
  uint64_t v32 = [v6 name];
  id v33 = [v70 name];
  v77[0] = v33;
  id v34 = [v68 name];
  v77[1] = v34;
  id v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:2];
  uint64_t v36 = (void *)[v31 initWithTableName:v32 columnNames:v35 where:v30 unique:1];

  [v6 addIndex:v36];
  id v37 = objc_alloc(MEMORY[0x1E4F60E48]);
  id v38 = [v66 isNotNull];
  v76[0] = v38;
  id v39 = [v65 isNull];
  v76[1] = v39;
  id v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:2];
  uint64_t v41 = (void *)[v37 initWithExpressions:v40];

  id v42 = objc_alloc(MEMORY[0x1E4F60EB0]);
  id v43 = [v6 name];
  uint64_t v44 = [v67 name];
  v75 = v44;
  id v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
  id v46 = (void *)[v42 initWithTableName:v43 columnNames:v45 where:v41 unique:1];

  [v6 addIndex:v46];
  id v47 = objc_alloc(MEMORY[0x1E4F60E48]);
  id v48 = [v66 isNotNull];
  v74[0] = v48;
  uint64_t v49 = [v65 isNotNull];
  v74[1] = v49;
  char v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:2];
  id v51 = (void *)[v47 initWithExpressions:v50];

  id v52 = objc_alloc(MEMORY[0x1E4F60EB0]);
  v53 = [v6 name];
  id v54 = [v67 name];
  v73[0] = v54;
  __int16 v55 = [v68 name];
  v73[1] = v55;
  v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:2];
  uint64_t v57 = (void *)[v52 initWithTableName:v53 columnNames:v56 where:v51 unique:1];

  [v6 addIndex:v57];
  uint64_t v72 = @"needs_update";
  v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
  [v6 addIndexForColumns:v58];

  v71 = @"last_viewed";
  v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
  [v6 addIndexForColumns:v59];

  return (EFSQLTableSchema *)v6;
}

+ (EFSQLTableSchema)threadsTableSchema
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  uint64_t v44 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"scope" nullable:0];
  v53 = v44;
  uint64_t v54 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"conversation" nullable:0];
  id v43 = (void *)v54;
  id v42 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"newest_read_message" nullable:1];
  __int16 v55 = v42;
  uint64_t v41 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"newest_message" nullable:1];
  v56 = v41;
  id v40 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"display_message" nullable:1];
  uint64_t v57 = v40;
  id v39 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"date" nullable:0];
  v58 = v39;
  id v38 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"display_date" nullable:0 defaultValue:&unk_1F35BB198];
  v59 = v38;
  id v37 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"read_later_date" nullable:1];
  v60 = v37;
  uint64_t v36 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"read" nullable:0 defaultValue:&unk_1F35BB198];
  v61 = v36;
  id v35 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"flagged" nullable:0 defaultValue:&unk_1F35BB198];
  v62 = v35;
  id v34 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_red_flag" nullable:0 defaultValue:&unk_1F35BB198];
  id v63 = v34;
  id v33 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_orange_flag" nullable:0 defaultValue:&unk_1F35BB198];
  id v64 = v33;
  uint64_t v32 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_yellow_flag" nullable:0 defaultValue:&unk_1F35BB198];
  uint64_t v65 = v32;
  id v31 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_green_flag" nullable:0 defaultValue:&unk_1F35BB198];
  id v66 = v31;
  char v30 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_blue_flag" nullable:0 defaultValue:&unk_1F35BB198];
  id v67 = v30;
  uint64_t v29 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_purple_flag" nullable:0 defaultValue:&unk_1F35BB198];
  id v68 = v29;
  uint64_t v28 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_gray_flag" nullable:0 defaultValue:&unk_1F35BB198];
  id v69 = v28;
  uint64_t v27 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"draft" nullable:0 defaultValue:&unk_1F35BB198];
  id v70 = v27;
  id v26 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"replied" nullable:0 defaultValue:&unk_1F35BB198];
  v71 = v26;
  id v25 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"forwarded" nullable:0 defaultValue:&unk_1F35BB198];
  uint64_t v72 = v25;
  id v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"redirected" nullable:0 defaultValue:&unk_1F35BB198];
  uint64_t v73 = v3;
  os_signpost_id_t v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"junk_level_set_by_user" nullable:0 defaultValue:&unk_1F35BB198];
  char v74 = v4;
  id v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"junk_level" nullable:0 defaultValue:&unk_1F35BB198];
  v75 = v5;
  id v6 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_unflagged" nullable:0 defaultValue:&unk_1F35BB198];
  id v76 = v6;
  id v7 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_attachments" nullable:0 defaultValue:&unk_1F35BB198];
  v77 = v7;
  id v8 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"count" nullable:0];
  v78 = v8;
  id v9 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"journaled" nullable:0 defaultValue:&unk_1F35BB198];
  v79 = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:27];
  id v11 = (void *)[v2 initWithName:@"threads" rowIDType:2 columns:v10];

  v52[0] = @"scope";
  v52[1] = @"conversation";
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
  [v11 addUniquenessConstraintForColumns:v12 conflictResolution:1];

  v51[0] = @"scope";
  v51[1] = @"date";
  v51[2] = @"conversation";
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:3];
  [v11 addIndexForColumns:v13];

  v50[0] = @"scope";
  v50[1] = @"display_date";
  v50[2] = @"conversation";
  unsigned __int8 v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:3];
  [v11 addIndexForColumns:v14];

  v49[0] = @"journaled";
  v49[1] = @"scope";
  v49[2] = @"date";
  v49[3] = @"conversation";
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:4];
  [v11 addIndexForColumns:v15];

  id v48 = @"newest_read_message";
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
  [v11 addIndexForColumns:v16];

  id v47 = @"newest_message";
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
  [v11 addIndexForColumns:v17];

  id v46 = @"display_message";
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
  [v11 addIndexForColumns:v18];

  id v19 = objc_alloc(MEMORY[0x1E4F60EB0]);
  v45[0] = @"journaled";
  v45[1] = @"date";
  v45[2] = @"scope";
  v45[3] = @"conversation";
  long long v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:4];
  uint64_t v21 = [MEMORY[0x1E4F60E78] column:@"journaled"];
  id v22 = [v21 equalTo:&unk_1F35BB1B0];
  id v23 = (void *)[v19 initWithTableName:@"threads" columnNames:v20 where:v22 unique:0];

  [v11 addIndex:v23];

  return (EFSQLTableSchema *)v11;
}

+ (EFSQLTableSchema)threadMailboxesTableSchema
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"thread" nullable:0];
  v10[0] = v3;
  os_signpost_id_t v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"mailbox" nullable:0];
  v10[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  v9[0] = @"thread";
  v9[1] = @"mailbox";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v7 = (void *)[v2 initWithName:@"thread_mailboxes" columns:v5 primaryKeyColumns:v6];

  [v7 addIndexForColumns:&unk_1F35BB600];

  return (EFSQLTableSchema *)v7;
}

+ (EFSQLTableSchema)threadSendersTableSchema
{
  void v16[4] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"thread" nullable:0];
  v16[0] = v3;
  os_signpost_id_t v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"address" nullable:0];
  v16[1] = v4;
  id v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"date" nullable:0];
  v16[2] = v5;
  id v6 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"priority" nullable:0 defaultValue:&unk_1F35BB198];
  void v16[3] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
  v15[0] = @"thread";
  v15[1] = @"address";
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  id v9 = (void *)[v2 initWithName:@"thread_senders" columns:v7 primaryKeyColumns:v8 conflictResolution:5];

  v14[0] = @"address";
  v14[1] = @"thread";
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  [v9 addIndexForColumns:v10];

  v13[0] = @"thread";
  v13[1] = @"priority";
  v13[2] = @"date";
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  [v9 addIndexForColumns:v11];

  return (EFSQLTableSchema *)v9;
}

+ (EFSQLTableSchema)threadRecipientsTableSchema
{
  v17[5] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"thread" nullable:0];
  v17[0] = v3;
  os_signpost_id_t v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"address" nullable:0];
  v17[1] = v4;
  id v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"type" nullable:0];
  v17[2] = v5;
  id v6 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"date" nullable:0];
  v17[3] = v6;
  id v7 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"priority" nullable:0 defaultValue:&unk_1F35BB198];
  void v17[4] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:5];
  v16[0] = @"thread";
  v16[1] = @"type";
  v16[2] = @"address";
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
  id v10 = (void *)[v2 initWithName:@"thread_recipients" columns:v8 primaryKeyColumns:v9 conflictResolution:5];

  v15[0] = @"address";
  v15[1] = @"thread";
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  [v10 addIndexForColumns:v11];

  v14[0] = @"thread";
  v14[1] = @"priority";
  void v14[2] = @"date";
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
  [v10 addIndexForColumns:v12];

  return (EFSQLTableSchema *)v10;
}

- (EDThreadPersistence)initWithMessagePersistence:(id)a3 categoryPersistence:(id)a4 database:(id)a5 hookRegistry:(id)a6 vipManager:(id)a7 blockedSenderManager:(id)a8
{
  id v39 = a3;
  id v38 = a4;
  id v37 = a5;
  id v15 = a6;
  id v36 = a7;
  id v16 = a8;
  v43.receiver = self;
  v43.super_class = (Class)EDThreadPersistence;
  id v17 = [(EDThreadPersistence *)&v43 init];
  id v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_messagePersistence, a3);
    objc_storeStrong((id *)&v18->_database, a5);
    objc_storeStrong((id *)&v18->_hookRegistry, a6);
    objc_storeStrong((id *)&v18->_vipManager, a7);
    objc_storeStrong((id *)&v18->_blockedSenderManager, a8);
    id v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    threadObjectIDsToRecompute = v18->_threadObjectIDsToRecompute;
    v18->_threadObjectIDsToRecompute = v19;

    v18->_threadRecomputationLock._os_unfair_lock_opaque = 0;
    uint64_t v21 = -[EDThreadScopeManager initWithDataSource:]([EDThreadScopeManager alloc], "initWithDataSource:", v18, v36, v37, v38, v39);
    threadScopeManager = v18->_threadScopeManager;
    v18->_threadScopeManager = v21;

    v18->_migratingThreadScopesLock._os_unfair_lock_opaque = 0;
    id v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    migratingThreadScopes = v18->_migratingThreadScopes;
    v18->_migratingThreadScopes = v23;

    id v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    backgroundProcessingAssertionsByMigratingThreadScope = v18->_backgroundProcessingAssertionsByMigratingThreadScope;
    v18->_backgroundProcessingAssertionsByMigratingThreadScope = v25;

    uint64_t v27 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.EmailDaemon.EDThreadPersistence.consistencyCheckScheduler" qualityOfService:9];
    consistencyCheckScheduler = v18->_consistencyCheckScheduler;
    v18->_consistencyCheckScheduler = (EFScheduler *)v27;

    uint64_t v29 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.EmailDaemon.EDThreadPersistence.threadRecomputationScheduler" qualityOfService:9];
    threadRecomputationScheduler = v18->_threadRecomputationScheduler;
    v18->_threadRecomputationScheduler = (EFScheduler *)v29;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v18);
    id v31 = objc_alloc(MEMORY[0x1E4F60D50]);
    uint64_t v32 = v18->_threadRecomputationScheduler;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __124__EDThreadPersistence_initWithMessagePersistence_categoryPersistence_database_hookRegistry_vipManager_blockedSenderManager___block_invoke;
    v40[3] = &unk_1E6C05218;
    objc_copyWeak(&v41, &location);
    uint64_t v33 = [v31 initWithTimeInterval:v32 scheduler:0 startAfter:v40 block:10.0];
    threadRecomputationDebouncer = v18->_threadRecomputationDebouncer;
    v18->_threadRecomputationDebouncer = (EFDebouncer *)v33;

    [v15 registerDatabaseChangeHookResponder:v18];
    [v15 registerMailboxChangeHookResponder:v18];
    [v15 registerMessageChangeHookResponder:v18];
    objc_storeStrong((id *)&v18->_categoryPersistence, a4);
    [v15 registerCategoryChangeHookResponder:v18];
    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }

  return v18;
}

void __124__EDThreadPersistence_initWithMessagePersistence_categoryPersistence_database_hookRegistry_vipManager_blockedSenderManager___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _recomputeThreads];
}

- (void)_enumerateThreadScopesUsingBlock:(id)a3
{
  id v5 = a3;
  id v6 = [(EDThreadPersistence *)self threadScopeManager];
  id v7 = [v6 threadScopesByDatabaseID];

  id v8 = [(EDThreadPersistence *)self messagePersistence];
  id v9 = [v8 mailboxPersistence];
  id v10 = [v9 mailboxProvider];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__EDThreadPersistence__enumerateThreadScopesUsingBlock___block_invoke;
  void v13[3] = &unk_1E6C06A40;
  SEL v16 = a2;
  v13[4] = self;
  id v14 = v10;
  id v11 = v5;
  id v15 = v11;
  id v12 = v10;
  [v7 enumerateKeysAndObjectsUsingBlock:v13];
}

void __56__EDThreadPersistence__enumerateThreadScopesUsingBlock___block_invoke(void *a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  id v6 = [v5 mailboxScope];
  id v7 = v6;
  id v8 = [MEMORY[0x1E4F60318] allMailboxesScope];

  if (v6 == v8)
  {
    id v9 = [v5 filterPredicate];

    if (!v9)
    {
      id v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a1[7] object:a1[4] file:@"EDThreadPersistence.m" lineNumber:396 description:@"Thread scope with \"all mailboxes\" mailbox scope must have filter predicate"];
    }
    id v10 = (void *)MEMORY[0x1E4F60390];
    id v11 = [v5 filterPredicate];
    uint64_t v12 = [v10 mailboxScopeForPredicate:v11 withMailboxTypeResolver:a1[5]];

    id v7 = (void *)v12;
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)test_tearDown
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EDThreadPersistence.m", 405, @"%s can only be called from unit tests", "-[EDThreadPersistence test_tearDown]");
  }
  id v4 = [(EDThreadPersistence *)self consistencyCheckScheduler];
  [v4 performSyncBlock:&__block_literal_global_174];
}

- (unint64_t)persistenceStateForThreadScope:(id)a3
{
  return [(EDThreadPersistence *)self persistenceStateForThreadScope:a3 wantsPrecomputed:0];
}

- (void)resetThreadScopesForMailboxScope:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  id v5 = [(EDThreadPersistence *)self database];
  id v6 = [NSString stringWithUTF8String:"-[EDThreadPersistence resetThreadScopesForMailboxScope:]"];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __56__EDThreadPersistence_resetThreadScopesForMailboxScope___block_invoke;
  v9[3] = &unk_1E6BFF338;
  id v7 = v4;
  id v10 = v7;
  id v11 = self;
  uint64_t v12 = &v13;
  objc_msgSend(v5, "__performWriteWithCaller:usingBlock:", v6, v9);

  if (*((unsigned char *)v14 + 24))
  {
    id v8 = [(EDThreadPersistence *)self threadScopeManager];
    if (v7) {
      [v8 removeThreadScopesForMailboxScope:v7];
    }
    else {
      [v8 removeAllThreadScopes];
    }
  }
  _Block_object_dispose(&v13, 8);
}

BOOL __56__EDThreadPersistence_resetThreadScopesForMailboxScope___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id v5 = [v4 mailboxTypes];
    if ([v5 count])
    {
      id v6 = [MEMORY[0x1E4F60E78] column:@"mailbox_type"];
      id v7 = [v6 in:v5];
    }
    else
    {
      id v6 = [*(id *)(a1 + 32) mailboxObjectIDs];
      id v8 = [*(id *)(a1 + 40) messagePersistence];
      id v9 = [v8 mailboxPersistence];
      id v10 = [v9 mailboxDatabaseIDsForMailboxObjectIDs:v6 createIfNecessary:0];

      id v11 = [MEMORY[0x1E4F60E78] column:@"mailbox"];
      id v7 = [v11 in:v10];
    }
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F60E98]) initWithTable:@"thread_scopes" where:v7];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 executeDeleteStatement:v12 error:0];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (*(void *)(a1 + 32))
    {
      BOOL v13 = 1;
    }
    else
    {
      id v14 = (void *)[objc_alloc(MEMORY[0x1E4F60E98]) initWithTable:@"threads"];

      uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
      if (*(unsigned char *)(v15 + 24))
      {
        char v16 = [v3 executeDeleteStatement:v14 error:0];
        uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
      }
      else
      {
        char v16 = 0;
      }
      *(unsigned char *)(v15 + 24) = v16;
      id v17 = (void *)[objc_alloc(MEMORY[0x1E4F60E98]) initWithTable:@"thread_mailboxes"];

      uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
      if (*(unsigned char *)(v18 + 24))
      {
        char v19 = [v3 executeDeleteStatement:v17 error:0];
        uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
      }
      else
      {
        char v19 = 0;
      }
      *(unsigned char *)(v18 + 24) = v19;
      long long v20 = (void *)[objc_alloc(MEMORY[0x1E4F60E98]) initWithTable:@"thread_senders"];

      uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
      if (*(unsigned char *)(v21 + 24))
      {
        char v22 = [v3 executeDeleteStatement:v20 error:0];
        uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
      }
      else
      {
        char v22 = 0;
      }
      *(unsigned char *)(v21 + 24) = v22;
      uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F60E98]) initWithTable:@"thread_recipients"];

      uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
      if (*(unsigned char *)(v23 + 24))
      {
        char v24 = [v3 executeDeleteStatement:v12 error:0];
        uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
      }
      else
      {
        char v24 = 0;
      }
      *(unsigned char *)(v23 + 24) = v24;
      BOOL v13 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)threadScopesByDatabaseID
{
  id v2 = [(EDThreadPersistence *)self threadScopeManager];
  id v3 = [v2 threadScopesByDatabaseID];

  return v3;
}

uint64_t __116__EDThreadPersistence_threadObjectIDsForThreadScope_sortDescriptors_initialBatchSize_journaledObjectIDs_batchBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __64__EDThreadPersistence_threadForObjectID_originatingQuery_error___block_invoke_284(uint64_t a1, void *a2)
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"date"];
  id v5 = [v4 dateValue];
  [v3 setDate:v5];

  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"display_date"];
  id v7 = [v6 dateValue];
  [v3 setDisplayDate:v7];

  id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"read_later_date"];
  uint64_t v9 = [v8 dateValue];

  v75 = (void *)v9;
  if (v9)
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F60420]) initWithDate:v9];
    [v3 setReadLater:v10];
  }
  id v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"subject_prefix"];
  id v76 = [v11 stringValue];

  uint64_t v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"subject"];
  BOOL v13 = [v12 stringValue];

  id v14 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"journaled"];
  int v15 = [v14 BOOLValue];

  if (v13) {
    int v16 = 0;
  }
  else {
    int v16 = v15;
  }
  if (v16 == 1)
  {
    id v17 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void *)(a1 + 40);
      uint64_t v19 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      uint64_t v78 = v18;
      __int16 v79 = 2114;
      uint64_t v80 = v19;
      _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_DEFAULT, "Unable to find subject from display message %{public}@ for journaled thread %{public}@", buf, 0x16u);
    }

    BOOL v13 = [*(id *)(a1 + 56) _nonJournaledSubjectForThreadWithObjectID:*(void *)(a1 + 48) connection:*(void *)(a1 + 64)];
  }
  long long v20 = (void *)[objc_alloc(MEMORY[0x1E4F608E0]) initWithPrefix:v76 subjectWithoutPrefix:v13];
  [v3 setSubject:v20];

  uint64_t v21 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"summary"];
  char v22 = [v21 stringValue];
  [v3 setSummary:v22];

  uint64_t v23 = MEMORY[0x1E4F1CBF0];
  if (*(void *)(a1 + 72)) {
    uint64_t v24 = *(void *)(a1 + 72);
  }
  else {
    uint64_t v24 = MEMORY[0x1E4F1CBF0];
  }
  [v3 setSenderList:v24];
  if (*(void *)(a1 + 80)) {
    uint64_t v25 = *(void *)(a1 + 80);
  }
  else {
    uint64_t v25 = v23;
  }
  [v3 setToList:v25];
  if (*(void *)(a1 + 88)) {
    uint64_t v26 = *(void *)(a1 + 88);
  }
  else {
    uint64_t v26 = v23;
  }
  [v3 setCcList:v26];
  [v3 setFlags:*(void *)(a1 + 96)];
  uint64_t v27 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"has_unflagged"];
  objc_msgSend(v3, "setHasUnflagged:", objc_msgSend(v27, "BOOLValue"));

  uint64_t v28 = [*(id *)(a1 + 56) _flagColorsFromRow:*(void *)(a1 + 32)];
  [v3 setFlagColors:v28];

  [v3 setIsVIP:*(unsigned __int8 *)(a1 + 120)];
  uint64_t v29 = [*(id *)(a1 + 56) blockedSenderManager];
  uint64_t v30 = [v29 areAnyEmailAddressesBlocked:*(void *)(a1 + 72)];

  [v3 setIsBlocked:v30];
  id v31 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"unsubscribe_type"];
  objc_msgSend(v3, "setUnsubscribeType:", objc_msgSend(v31, "integerValue"));

  uint64_t v32 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"has_attachments"];
  objc_msgSend(v3, "setHasAttachments:", objc_msgSend(v32, "BOOLValue"));

  uint64_t v33 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"flags"];
  id v34 = [v33 numberValue];
  int64_t v35 = +[EDConversationPersistence conversationNotificationLevelForConversationFlags:](EDConversationPersistence, "conversationNotificationLevelForConversationFlags:", [v34 unsignedLongLongValue]);

  [v3 setConversationNotificationLevel:v35];
  id v36 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"count"];
  id v37 = [v36 numberValue];
  objc_msgSend(v3, "setCount:", objc_msgSend(v37, "unsignedIntegerValue"));

  [v3 setMailboxes:*(void *)(a1 + 104)];
  [v3 setDisplayMessageItemID:*(void *)(a1 + 40)];
  id v38 = [*(id *)(a1 + 56) messagePersistence];
  id v39 = [v38 mailboxPersistence];
  [v3 setMailboxTypeResolver:v39];

  id v40 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"follow_up_start_date"];
  id v41 = [v40 dateValue];

  id v42 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"follow_up_end_date"];
  objc_super v43 = [v42 dateValue];

  uint64_t v44 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"follow_up_jsonstringformodelevaluationforsuggestions"];
  id v45 = [v44 stringValue];

  if (v41 && v43)
  {
    id v46 = (void *)[objc_alloc(MEMORY[0x1E4F60298]) initWithStartDate:v41 endDate:v43 jsonStringForModelEvaluationForSuggestions:v45];
    [v3 setFollowUp:v46];
  }
  id v47 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"brand_indicator_location"];
  id v48 = [v47 stringValue];

  if (v48)
  {
    uint64_t v49 = [MEMORY[0x1E4F1CB10] URLWithString:v48];
    [v3 setBrandIndicatorLocation:v49];
  }
  if (_os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
  {
    char v50 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"generated_summary"];
    char v74 = [v50 dataValue];

    if ([v74 length])
    {
      id v51 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"urgent"];
      unsigned int v71 = [v51 BOOLValue];

      uint64_t v73 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v74 error:0];
      id v52 = [v73 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F5FE80]];
      uint64_t v72 = [v73 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F5FE78]];
      if (v52)
      {
        v53 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 112)];
        uint64_t v54 = [v53 int64Value];

        if (v54) {
          __int16 v55 = (void *)[objc_alloc(MEMORY[0x1E4F60338]) initWithGlobalMessageID:v54];
        }
        else {
          __int16 v55 = 0;
        }
        v56 = (void *)[objc_alloc(MEMORY[0x1E4F602A8]) initWithTopLine:v52 synopsis:v72 urgent:v71 messageItemID:v55];
        [v3 setGeneratedSummary:v56];
      }
    }
  }
  if (_os_feature_enabled_impl())
  {
    uint64_t v57 = +[EDCategoryPersistence categoryForResultRow:*(void *)(a1 + 32)];
    [v3 setCategory:v57];

    v58 = *(void **)(a1 + 32);
    v59 = +[EDMessagePersistence messageGlobalDataValidationState];
    v60 = [v58 objectForKeyedSubscript:v59];
    __int16 v61 = [v60 integerValue];
    BOOL v63 = (v61 & 0xE08) == 0x408 && (v61 & 0x30) != 16;
    [v3 setIsAuthenticated:v63];

    id v64 = *(void **)(a1 + 32);
    uint64_t v65 = +[EDMessagePersistence messageGlobalDataValidationState];
    id v66 = [v64 objectForKeyedSubscript:v65];
    unint64_t v67 = [v66 integerValue];
    if ((v67 & 0x10000) != 0 || (uint64_t v68 = (v67 >> 9) & 7, (v67 & 8) != 0) && v68 == 2 && (v67 & 0x30) != 0x10) {
      uint64_t v69 = 0;
    }
    else {
      uint64_t v69 = (v68 != 0) & (v67 >> 2);
    }
    [v3 setAllowAuthenticationWarning:v69];

    id v70 = +[EDBusinessPersistence brandIDForResultRow:*(void *)(a1 + 32)];
    [v3 setBusinessLogoID:v70];
  }
}

- (id)_nonJournaledSubjectForThreadWithObjectID:(id)a3 connection:(id)a4
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(EDThreadPersistence *)self _messageThreadExpressionForThreadObjectID:v6];
  uint64_t v9 = [MEMORY[0x1E4F60E78] column:@"journaled"];
  id v10 = [v9 equalTo:&unk_1F35BB198];

  id v11 = objc_alloc(MEMORY[0x1E4F60EF8]);
  uint64_t v12 = +[EDMessagePersistence messagesTableName];
  BOOL v13 = (void *)[v11 initWithResultColumn:@"subject" table:v12];

  id v14 = objc_alloc(MEMORY[0x1E4F60E48]);
  v30[0] = v8;
  v30[1] = v10;
  int v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  int v16 = (void *)[v14 initWithExpressions:v15];
  [v13 setWhere:v16];

  id v17 = +[EDMessagePersistence messagesDateReceivedColumnName];
  [v13 orderByColumn:v17 ascending:0];

  [v13 setLimit:1];
  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"subject" table:@"subjects"];
  uint64_t v19 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
  long long v20 = [v19 in:v13];
  [v18 setWhere:v20];

  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__42;
  uint64_t v28 = __Block_byref_object_dispose__42;
  id v29 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __76__EDThreadPersistence__nonJournaledSubjectForThreadWithObjectID_connection___block_invoke;
  v23[3] = &unk_1E6BFF4C8;
  v23[4] = &v24;
  [v7 executeSelectStatement:v18 withBlock:v23 error:0];
  id v21 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  return v21;
}

void __76__EDThreadPersistence__nonJournaledSubjectForThreadWithObjectID_connection___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 objectAtIndexedSubscript:0];
  uint64_t v4 = [v3 stringValue];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)changeForThreadWithObjectID:(id)a3 changedKeyPaths:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__42;
  char v22 = __Block_byref_object_dispose__42;
  id v23 = 0;
  id v8 = [(EDThreadPersistence *)self database];
  uint64_t v9 = [NSString stringWithUTF8String:"-[EDThreadPersistence changeForThreadWithObjectID:changedKeyPaths:]"];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __67__EDThreadPersistence_changeForThreadWithObjectID_changedKeyPaths___block_invoke;
  void v14[3] = &unk_1E6C01950;
  v14[4] = self;
  id v10 = v6;
  id v15 = v10;
  id v11 = v7;
  id v16 = v11;
  id v17 = &v18;
  objc_msgSend(v8, "__performReadWithCaller:usingBlock:", v9, v14);

  id v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

uint64_t __67__EDThreadPersistence_changeForThreadWithObjectID_changedKeyPaths___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _databaseIDForThreadObjectID:*(void *)(a1 + 40)];
  if (v4 == *MEMORY[0x1E4F5FCC8])
  {
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v57 = [NSNumber numberWithLongLong:v4];
    if (([*(id *)(a1 + 48) containsObject:*MEMORY[0x1E4F5FEC0]] & 1) != 0
      || [*(id *)(a1 + 48) containsObject:*MEMORY[0x1E4F5FED8]])
    {
      uint64_t v6 = [*(id *)(a1 + 32) _mailboxesForThreadDatabaseID:v57];
    }
    else
    {
      uint64_t v6 = 0;
    }
    int v7 = [v3 protectedDatabaseAttached];
    id v45 = (void *)v6;
    int v53 = [*(id *)(a1 + 48) containsObject:*MEMORY[0x1E4F5FF30]];
    if ((v7 & v53) == 1)
    {
      id v8 = [*(id *)(a1 + 32) _sendersForThreadDatabaseID:v57];
      uint64_t v9 = [v8 count];
      id v10 = v8;
      if (!v9)
      {
        [*(id *)(a1 + 32) _scheduleRecomputationForThread:*(void *)(a1 + 40) reason:@"no sender on change"];
        id v10 = v8;
      }
    }
    else
    {
      id v10 = 0;
    }
    uint64_t v44 = v10;
    if (v7)
    {
      if ([*(id *)(a1 + 48) containsObject:*MEMORY[0x1E4F5FF60]])
      {
        objc_super v43 = [*(id *)(a1 + 32) _recipientsOfType:1 forThreadDatabaseID:v57];
      }
      else
      {
        objc_super v43 = 0;
      }
      if ([*(id *)(a1 + 48) containsObject:*MEMORY[0x1E4F5FDF0]])
      {
        uint64_t v11 = [*(id *)(a1 + 32) _recipientsOfType:2 forThreadDatabaseID:v57];
      }
      else
      {
        uint64_t v11 = 0;
      }
    }
    else
    {
      objc_super v43 = 0;
      uint64_t v11 = 0;
    }
    int v55 = [*(id *)(a1 + 48) containsObject:*MEMORY[0x1E4F5FE40]];
    if (v7)
    {
      int v12 = [*(id *)(a1 + 48) containsObject:*MEMORY[0x1E4F5FF40]];
      int v54 = [*(id *)(a1 + 48) containsObject:*MEMORY[0x1E4F5FF48]];
      int v13 = v12;
    }
    else
    {
      LOBYTE(v12) = 0;
      int v13 = 0;
      int v54 = 0;
    }
    if ([*(id *)(a1 + 48) containsObject:*MEMORY[0x1E4F5FE30]]) {
      int v52 = 1;
    }
    else {
      int v52 = [*(id *)(a1 + 48) containsObject:*MEMORY[0x1E4F5FE38]];
    }
    if ([*(id *)(a1 + 48) containsObject:*MEMORY[0x1E4F5FEF8]]) {
      int v51 = 1;
    }
    else {
      int v51 = [*(id *)(a1 + 48) containsObject:*MEMORY[0x1E4F5FF00]];
    }
    if (([*(id *)(a1 + 48) containsObject:*MEMORY[0x1E4F5FE68]] & 1) != 0
      || ([*(id *)(a1 + 48) containsObject:*MEMORY[0x1E4F5FE58]] & 1) != 0)
    {
      int v56 = 1;
    }
    else
    {
      int v56 = [*(id *)(a1 + 48) containsObject:*MEMORY[0x1E4F5FE60]];
    }
    int v50 = [*(id *)(a1 + 48) containsObject:*MEMORY[0x1E4F5FE50]];
    int v49 = [*(id *)(a1 + 48) containsObject:*MEMORY[0x1E4F5FE98]];
    int v48 = [*(id *)(a1 + 48) containsObject:*MEMORY[0x1E4F5FE48]];
    int v47 = [*(id *)(a1 + 48) containsObject:*MEMORY[0x1E4F5FE90]];
    int v46 = [*(id *)(a1 + 48) containsObject:*MEMORY[0x1E4F5FE28]];
    if (_os_feature_enabled_impl())
    {
      if ([*(id *)(a1 + 48) containsObject:*MEMORY[0x1E4F5FDE0]]) {
        int v14 = 1;
      }
      else {
        int v14 = [*(id *)(a1 + 48) containsObject:*MEMORY[0x1E4F5FDE8]];
      }
    }
    else
    {
      int v14 = 0;
    }
    char v40 = v12;
    id v42 = (void *)v11;
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"date" table:@"threads"];
    uint64_t v16 = *MEMORY[0x1E4F60D08];
    id v17 = (id)[v15 leftOuterJoin:@"conversations" sourceColumn:@"conversation" targetColumn:*MEMORY[0x1E4F60D08]];
    uint64_t v18 = +[EDMessagePersistence messagesTableName];
    id v41 = (void *)v18;
    if ((v55 | v13 | v54 | v56 | v14) == 1)
    {
      uint64_t v19 = [v15 leftOuterJoin:v18 sourceColumn:@"display_message" targetColumn:v16];
      uint64_t v20 = v19;
      if ((v56 | v14) == 1)
      {
        [v19 leftOuterJoin:@"message_global_data" sourceColumn:@"global_message_id" targetColumn:v16];
        char v22 = v21 = v20;
      }
      else
      {
        char v22 = 0;
        id v21 = v19;
      }
    }
    else
    {
      id v21 = 0;
      char v22 = 0;
    }
    if (v55)
    {
      [v15 addResultColumn:@"display_message"];
      [v21 addResultColumn:@"global_message_id"];
    }
    if (v13)
    {
      id v23 = [v21 leftOuterJoin:@"subjects" sourceColumn:@"subject" targetColumn:v16];
      [v21 addResultColumn:@"subject_prefix"];
      [v23 addResultColumn:@"subject"];
    }
    if (v54)
    {
      uint64_t v24 = [v21 leftOuterJoin:@"summaries" sourceColumn:@"summary" targetColumn:v16];
      [v24 addResultColumn:@"summary"];
    }
    if (v52)
    {
      [v15 addResultColumn:@"date"];
      [v15 addResultColumn:@"display_date"];
    }
    if (v51) {
      [v15 addResultColumn:@"read_later_date"];
    }
    if (v56)
    {
      [v22 addResultColumn:@"follow_up_start_date"];
      [v22 addResultColumn:@"follow_up_end_date"];
      [v22 addResultColumn:@"follow_up_jsonstringformodelevaluationforsuggestions"];
    }
    if (v50)
    {
      [v15 addResultColumn:@"read"];
      [v15 addResultColumn:@"flagged"];
      [v15 addResultColumn:@"draft"];
      [v15 addResultColumn:@"replied"];
      [v15 addResultColumn:@"forwarded"];
      [v15 addResultColumn:@"redirected"];
      [v15 addResultColumn:@"junk_level_set_by_user"];
      [v15 addResultColumn:@"junk_level"];
    }
    if (v49) {
      [v15 addResultColumn:@"has_unflagged"];
    }
    if (v48)
    {
      [v15 addResultColumn:@"has_red_flag"];
      [v15 addResultColumn:@"has_orange_flag"];
      [v15 addResultColumn:@"has_yellow_flag"];
      [v15 addResultColumn:@"has_green_flag"];
      [v15 addResultColumn:@"has_blue_flag"];
      [v15 addResultColumn:@"has_purple_flag"];
      [v15 addResultColumn:@"has_gray_flag"];
    }
    if (v47) {
      [v15 addResultColumn:@"has_attachments"];
    }
    if (v46) {
      [v15 addResultColumn:@"count"];
    }
    if (v14)
    {
      uint64_t v25 = +[EDBusinessPersistence businessAddressesTableName];
      uint64_t v26 = +[EDBusinessPersistence businessAddressesAddressColumnName];
      uint64_t v27 = [v21 leftOuterJoin:v25 sourceColumn:@"sender" targetColumn:v26];

      uint64_t v28 = +[EDBusinessPersistence businessAddressesBusinessColumnName];
      [v27 addResultColumn:v28];

      +[EDCategoryPersistence addCategoryColumnsToMessagesSelectComponent:v21 globalMessagesSelectComponent:v22 businessAddressesSelectComponent:v27];
      id v29 = +[EDBusinessPersistence businessesTableName];
      uint64_t v30 = [v27 leftOuterJoin:v29 sourceColumn:@"business" targetColumn:v16];

      id v31 = +[EDBusinessPersistence businessesBrandIDColumnName];
      [v30 addResultColumn:v31];
    }
    uint64_t v32 = [MEMORY[0x1E4F60E78] table:@"threads" column:v16];
    uint64_t v33 = [v32 equalTo:v57];
    [v15 setWhere:v33];

    [v15 setLimit:1];
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __67__EDThreadPersistence_changeForThreadWithObjectID_changedKeyPaths___block_invoke_2;
    v58[3] = &unk_1E6C06BA8;
    uint64_t v64 = *(void *)(a1 + 56);
    char v65 = v53;
    id v34 = v44;
    id v59 = v34;
    id v35 = v43;
    id v60 = v35;
    id v36 = v42;
    id v61 = v36;
    id v37 = v45;
    char v66 = v55;
    char v67 = v40;
    char v68 = v54;
    char v69 = v52;
    char v70 = v51;
    char v71 = v56;
    char v72 = v50;
    char v73 = v49;
    char v74 = v48;
    uint64_t v38 = *(void *)(a1 + 32);
    id v62 = v37;
    uint64_t v63 = v38;
    char v75 = v47;
    char v76 = v46;
    char v77 = v14;
    uint64_t v5 = [v3 executeSelectStatement:v15 withBlock:v58 error:0];
  }
  return v5;
}

void __67__EDThreadPersistence_changeForThreadWithObjectID_changedKeyPaths___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F60388]);
  uint64_t v5 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (*(unsigned char *)(a1 + 80)) {
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setSenderList:*(void *)(a1 + 32)];
  }
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setToList:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setCcList:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setMailboxes:*(void *)(a1 + 56)];
  if (*(unsigned char *)(a1 + 81))
  {
    int v7 = [v3 objectForKeyedSubscript:@"global_message_id"];
    uint64_t v8 = [v7 int64Value];

    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F60338]) initWithGlobalMessageID:v8];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setDisplayMessageItemID:v9];
  }
  if (*(unsigned char *)(a1 + 82))
  {
    id v10 = [v3 objectForKeyedSubscript:@"subject_prefix"];
    uint64_t v11 = [v10 stringValue];

    int v12 = [v3 objectForKeyedSubscript:@"subject"];
    int v13 = [v12 stringValue];

    int v14 = (void *)[objc_alloc(MEMORY[0x1E4F608E0]) initWithPrefix:v11 subjectWithoutPrefix:v13];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setSubject:v14];
  }
  if (*(unsigned char *)(a1 + 83))
  {
    id v15 = [v3 objectForKeyedSubscript:@"summary"];
    uint64_t v16 = [v15 stringValue];
    id v17 = v16;
    if (!v16)
    {
      id v17 = [MEMORY[0x1E4F1CA98] null];
    }
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setSummary:v17];
    if (!v16) {
  }
    }
  if (*(unsigned char *)(a1 + 84))
  {
    uint64_t v18 = [v3 objectForKeyedSubscript:@"date"];
    uint64_t v19 = [v18 dateValue];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setDate:v19];

    uint64_t v20 = [v3 objectForKeyedSubscript:@"display_date"];
    id v21 = [v20 dateValue];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setDisplayDate:v21];
  }
  if (*(unsigned char *)(a1 + 85))
  {
    char v22 = [v3 objectForKeyedSubscript:@"read_later_date"];
    id v23 = [v22 dateValue];

    if (v23)
    {
      uint64_t v24 = [objc_alloc(MEMORY[0x1E4F60420]) initWithDate:v23];
    }
    else
    {
      uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
    }
    uint64_t v25 = (void *)v24;
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setReadLater:v24];
  }
  if (*(unsigned char *)(a1 + 86))
  {
    uint64_t v26 = [v3 objectForKeyedSubscript:@"follow_up_start_date"];
    uint64_t v27 = [v26 dateValue];

    uint64_t v28 = [v3 objectForKeyedSubscript:@"follow_up_end_date"];
    id v29 = [v28 dateValue];

    uint64_t v30 = [v3 objectForKeyedSubscript:@"follow_up_jsonstringformodelevaluationforsuggestions"];
    id v31 = [v30 stringValue];

    if (v27 && v29)
    {
      uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F60298]) initWithStartDate:v27 endDate:v29 jsonStringForModelEvaluationForSuggestions:v31];
      [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setFollowUp:v32];
    }
    else
    {
      uint64_t v32 = [MEMORY[0x1E4F1CA98] null];
      [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setFollowUp:v32];
    }
  }
  if (*(unsigned char *)(a1 + 87))
  {
    id v33 = objc_alloc(MEMORY[0x1E4F608C0]);
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __67__EDThreadPersistence_changeForThreadWithObjectID_changedKeyPaths___block_invoke_3;
    v49[3] = &unk_1E6C063F0;
    id v50 = v3;
    id v34 = (void *)[v33 initWithBuilder:v49];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setFlags:v34];
  }
  if (*(unsigned char *)(a1 + 88))
  {
    id v35 = NSNumber;
    id v36 = [v3 objectForKeyedSubscript:@"has_unflagged"];
    id v37 = [v36 numberValue];
    uint64_t v38 = objc_msgSend(v35, "numberWithBool:", objc_msgSend(v37, "BOOLValue"));
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setHasUnflagged:v38];
  }
  if (*(unsigned char *)(a1 + 89))
  {
    id v39 = [*(id *)(a1 + 64) _flagColorsFromRow:v3];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setFlagColors:v39];
  }
  if (*(unsigned char *)(a1 + 90))
  {
    char v40 = NSNumber;
    id v41 = [v3 objectForKeyedSubscript:@"has_attachments"];
    id v42 = [v41 numberValue];
    objc_super v43 = objc_msgSend(v40, "numberWithBool:", objc_msgSend(v42, "BOOLValue"));
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setHasAttachments:v43];
  }
  if (*(unsigned char *)(a1 + 91))
  {
    uint64_t v44 = NSNumber;
    id v45 = [v3 objectForKeyedSubscript:@"count"];
    int v46 = [v45 numberValue];
    int v47 = objc_msgSend(v44, "numberWithUnsignedInteger:", objc_msgSend(v46, "unsignedIntegerValue"));
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setCount:v47];
  }
  if (*(unsigned char *)(a1 + 92))
  {
    int v48 = +[EDBusinessPersistence brandIDForResultRow:v3];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setBusinessLogoID:v48];
  }
}

void __67__EDThreadPersistence_changeForThreadWithObjectID_changedKeyPaths___block_invoke_3(uint64_t a1, void *a2)
{
  id v12 = a2;
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"read"];
  objc_msgSend(v12, "setRead:", objc_msgSend(v3, "BOOLValue"));

  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"flagged"];
  objc_msgSend(v12, "setFlagged:", objc_msgSend(v4, "BOOLValue"));

  uint64_t v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"draft"];
  objc_msgSend(v12, "setDraft:", objc_msgSend(v5, "BOOLValue"));

  uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"replied"];
  objc_msgSend(v12, "setReplied:", objc_msgSend(v6, "BOOLValue"));

  int v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"forwarded"];
  objc_msgSend(v12, "setForwarded:", objc_msgSend(v7, "BOOLValue"));

  uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"redirected"];
  objc_msgSend(v12, "setRedirected:", objc_msgSend(v8, "BOOLValue"));

  uint64_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"junk_level_set_by_user"];
  objc_msgSend(v12, "setJunkLevelSetByUser:", objc_msgSend(v9, "BOOLValue"));

  id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"junk_level"];
  uint64_t v11 = [v10 numberValue];
  objc_msgSend(v12, "setJunkLevel:", objc_msgSend(v11, "unsignedIntegerValue"));
}

- (id)newestMessageItemIDForThreadWithObjectID:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__42;
  id v17 = __Block_byref_object_dispose__42;
  id v18 = 0;
  uint64_t v5 = [(EDThreadPersistence *)self database];
  uint64_t v6 = [NSString stringWithUTF8String:"-[EDThreadPersistence newestMessageItemIDForThreadWithObjectID:]"];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__EDThreadPersistence_newestMessageItemIDForThreadWithObjectID___block_invoke;
  void v10[3] = &unk_1E6BFF338;
  v10[4] = self;
  id v7 = v4;
  id v11 = v7;
  id v12 = &v13;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v10);

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __64__EDThreadPersistence_newestMessageItemIDForThreadWithObjectID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _databaseIDForThreadObjectID:*(void *)(a1 + 40)];
  if (v4 == *MEMORY[0x1E4F5FCC8])
  {
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v6 = [NSNumber numberWithLongLong:v4];
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithTable:@"threads"];
    id v8 = +[EDMessagePersistence messagesTableName];
    uint64_t v9 = *MEMORY[0x1E4F60D08];
    id v10 = [v7 leftOuterJoin:v8 sourceColumn:@"newest_message" targetColumn:*MEMORY[0x1E4F60D08]];

    [v10 addResultColumn:@"global_message_id"];
    id v11 = [MEMORY[0x1E4F60E78] table:@"threads" column:v9];
    id v12 = [v11 equalTo:v6];
    [v7 setWhere:v12];

    [v7 setLimit:1];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __64__EDThreadPersistence_newestMessageItemIDForThreadWithObjectID___block_invoke_2;
    void v14[3] = &unk_1E6BFF4C8;
    v14[4] = *(void *)(a1 + 48);
    uint64_t v5 = [v3 executeSelectStatement:v7 withBlock:v14 error:0];
  }
  return v5;
}

void __64__EDThreadPersistence_newestMessageItemIDForThreadWithObjectID___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 objectForKeyedSubscript:@"global_message_id"];
  uint64_t v4 = [v3 int64Value];

  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F60338]) initWithGlobalMessageID:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)_sendersFromMessagesForThreadObjectID:(id)a3
{
  uint64_t v4 = [(EDThreadPersistence *)self _messageThreadExpressionForThreadObjectID:a3];
  uint64_t v5 = [(EDThreadPersistence *)self _senderAddressesExpressionForMessages:v4];
  uint64_t v6 = [(EDThreadPersistence *)self _addressesFromMessageAddressesStatement:v5];

  return v6;
}

- (id)_recipientsOfType:(unint64_t)a3 fromMessagesForThreadObjectID:(id)a4
{
  uint64_t v6 = [(EDThreadPersistence *)self _messageThreadExpressionForThreadObjectID:a4];
  id v7 = [(EDThreadPersistence *)self _recipientAddressesExpressionForRecipientType:a3 messages:v6];
  id v8 = [(EDThreadPersistence *)self _addressesFromMessageAddressesStatement:v7];

  return v8;
}

- (id)_addressesFromMessageAddressesStatement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[EDMessagePersistence messagesDateReceivedColumnName];
  uint64_t v6 = +[EDMessagePersistence messagesTableName];
  [v4 orderByColumn:v5 fromTable:v6 ascending:0];

  [v4 setDistinct:1];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"address" table:@"addresses"];
  [v7 addResultColumn:@"comment"];
  id v8 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
  uint64_t v9 = [v8 in:v4];
  [v7 setWhere:v9];

  id v10 = [(EDThreadPersistence *)self _addressesFromSelectStatement:v7 additionalRowHandling:0];

  return v10;
}

- (id)nextExistingThreadObjectIDForThreadObjectID:(id)a3 forSortDescriptors:(id)a4 journaledThreadsToCheck:(id)a5 excluding:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v10 = a4;
  id v11 = (uint64_t (*)(uint64_t, uint64_t))a5;
  id v12 = a6;
  uint64_t v13 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = v27;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2114;
    id v37 = v11;
    LOWORD(v38) = 2114;
    *(void *)((char *)&v38 + 2) = v12;
    _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "Looking up thread before thread: %{public}@, sort descriptors: %{public}@, journaled threads: %{public}@, excluding: %{public}@", buf, 0x2Au);
  }

  int v14 = [(EDThreadPersistence *)self threadScopeManager];
  uint64_t v15 = [v27 threadScope];
  uint64_t v16 = [v14 databaseIDForThreadScope:v15];

  id v17 = -[EDThreadPersistence _threadExpressionForThreadScopeDatabaseID:conversation:](self, "_threadExpressionForThreadScopeDatabaseID:conversation:", v16, [v27 conversationID]);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v37 = __Block_byref_object_copy__42;
  *(void *)&long long v38 = __Block_byref_object_dispose__42;
  *((void *)&v38 + 1) = 0;
  id v18 = [(EDThreadPersistence *)self database];
  uint64_t v19 = [NSString stringWithUTF8String:"-[EDThreadPersistence nextExistingThreadObjectIDForThreadObjectID:forSortDescriptors:journaledThreadsToCheck:excluding:]"];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __120__EDThreadPersistence_nextExistingThreadObjectIDForThreadObjectID_forSortDescriptors_journaledThreadsToCheck_excluding___block_invoke;
  v28[3] = &unk_1E6C06C18;
  void v28[4] = self;
  id v20 = v10;
  id v29 = v20;
  id v21 = v27;
  id v30 = v21;
  id v22 = v17;
  id v31 = v22;
  uint64_t v35 = v16;
  id v23 = v12;
  id v32 = v23;
  uint64_t v24 = v11;
  id v33 = v24;
  id v34 = buf;
  objc_msgSend(v18, "__performReadWithCaller:usingBlock:", v19, v28);

  id v25 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v25;
}

uint64_t __120__EDThreadPersistence_nextExistingThreadObjectIDForThreadObjectID_forSortDescriptors_journaledThreadsToCheck_excluding___block_invoke(uint64_t a1, void *a2)
{
  void v45[4] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"conversation" table:@"threads"];
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "_comparisonExpressionForSortDescriptors:conversationID:threadExpression:threadScopeDatabaseID:connection:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "conversationID"), *(void *)(a1 + 56), *(void *)(a1 + 88), v3);
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F60E78] column:@"scope"];
    id v7 = [NSNumber numberWithLongLong:*(void *)(a1 + 88)];
    id v8 = [v6 equalTo:v7];

    uint64_t v9 = [MEMORY[0x1E4F60E78] column:@"journaled"];
    id v34 = [v9 equalTo:&unk_1F35BB198];

    if ([*(id *)(a1 + 64) count])
    {
      id v10 = [MEMORY[0x1E4F60E78] column:@"conversation"];
      id v11 = objc_msgSend(*(id *)(a1 + 64), "ef_compactMap:", &__block_literal_global_320);
      id v12 = [v10 notIn:v11];

      v45[0] = v8;
      v45[1] = v12;
      v45[2] = v34;
      v45[3] = v5;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:4];
    }
    else
    {
      v44[0] = v8;
      v44[1] = v34;
      v44[2] = v5;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:3];
    }
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F60E48]) initWithExpressions:v13];
    [v4 setWhere:v15];

    [*(id *)(a1 + 32) _addOrderByToThreadSelect:v4 forSortDescriptors:*(void *)(a1 + 40)];
    [v4 setLimit:1];
    uint64_t v37 = 0;
    long long v38 = &v37;
    uint64_t v39 = 0x2020000000;
    uint64_t v40 = 0;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __120__EDThreadPersistence_nextExistingThreadObjectIDForThreadObjectID_forSortDescriptors_journaledThreadsToCheck_excluding___block_invoke_2;
    v36[3] = &unk_1E6BFF4C8;
    v36[4] = &v37;
    if (![v3 executeSelectStatement:v4 withBlock:v36 error:0])
    {
      id v20 = +[EDThreadPersistence log];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        __120__EDThreadPersistence_nextExistingThreadObjectIDForThreadObjectID_forSortDescriptors_journaledThreadsToCheck_excluding___block_invoke_cold_3();
      }
      uint64_t v14 = 0;
      goto LABEL_24;
    }
    uint64_t v16 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = v38[3];
      *(_DWORD *)buf = 134217984;
      uint64_t v43 = v17;
      _os_log_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_DEFAULT, "Found next unjournaled conversation ID: %lld", buf, 0xCu);
    }

    if ([*(id *)(a1 + 72) count])
    {
      id v18 = objc_msgSend(*(id *)(a1 + 72), "ef_compactMap:", &__block_literal_global_323);
      uint64_t v19 = [NSNumber numberWithLongLong:v38[3]];
      id v20 = [v18 arrayByAddingObject:v19];

      id v21 = [MEMORY[0x1E4F60E78] column:@"conversation"];
      id v22 = [v21 in:v20];

      v41[0] = v8;
      v41[1] = v22;
      v41[2] = v5;
      uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:3];

      uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F60E48]) initWithExpressions:v23];
      [v4 setWhere:v24];

      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __120__EDThreadPersistence_nextExistingThreadObjectIDForThreadObjectID_forSortDescriptors_journaledThreadsToCheck_excluding___block_invoke_2_324;
      v35[3] = &unk_1E6BFF4C8;
      v35[4] = &v37;
      if (![v3 executeSelectStatement:v4 withBlock:v35 error:0])
      {
        id v32 = +[EDThreadPersistence log];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          __120__EDThreadPersistence_nextExistingThreadObjectIDForThreadObjectID_forSortDescriptors_journaledThreadsToCheck_excluding___block_invoke_cold_2();
        }

        uint64_t v14 = 0;
        uint64_t v13 = (void *)v23;
        goto LABEL_24;
      }
      id v25 = +[EDThreadPersistence log];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = v38[3];
        *(_DWORD *)buf = 134217984;
        uint64_t v43 = v26;
        _os_log_impl(&dword_1DB39C000, v25, OS_LOG_TYPE_DEFAULT, "Found next conversation ID, including journaled: %lld", buf, 0xCu);
      }

      uint64_t v13 = (void *)v23;
    }
    if (!v38[3])
    {
      uint64_t v14 = 1;
      goto LABEL_25;
    }
    id v27 = objc_alloc(MEMORY[0x1E4F604E0]);
    uint64_t v28 = v38[3];
    id v20 = [*(id *)(a1 + 48) threadScope];
    uint64_t v29 = [v27 initWithConversationID:v28 threadScope:v20];
    uint64_t v30 = *(void *)(*(void *)(a1 + 80) + 8);
    id v31 = *(void **)(v30 + 40);
    *(void *)(v30 + 40) = v29;

    uint64_t v14 = 1;
LABEL_24:

LABEL_25:
    _Block_object_dispose(&v37, 8);

    goto LABEL_26;
  }
  id v8 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    __120__EDThreadPersistence_nextExistingThreadObjectIDForThreadObjectID_forSortDescriptors_journaledThreadsToCheck_excluding___block_invoke_cold_1();
  }
  uint64_t v14 = 1;
LABEL_26:

  return v14;
}

id __120__EDThreadPersistence_nextExistingThreadObjectIDForThreadObjectID_forSortDescriptors_journaledThreadsToCheck_excluding___block_invoke_317(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v2, "conversationID"));

  return v3;
}

void __120__EDThreadPersistence_nextExistingThreadObjectIDForThreadObjectID_forSortDescriptors_journaledThreadsToCheck_excluding___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 objectAtIndexedSubscript:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 databaseIDValue];
}

id __120__EDThreadPersistence_nextExistingThreadObjectIDForThreadObjectID_forSortDescriptors_journaledThreadsToCheck_excluding___block_invoke_321(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v2, "conversationID"));

  return v3;
}

void __120__EDThreadPersistence_nextExistingThreadObjectIDForThreadObjectID_forSortDescriptors_journaledThreadsToCheck_excluding___block_invoke_2_324(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 objectAtIndexedSubscript:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 databaseIDValue];
}

- (id)threadObjectIDsByNextExistingForThreadObjectIDs:(id)a3 forSortDescriptors:(id)a4 journaledThreadsToCheck:(id)a5
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  id v47 = a4;
  id v48 = a5;
  id v7 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[EDThreadPersistence threadObjectIDsByNextExistingForThreadObjectIDs:forSortDescriptors:journaledThreadsToCheck:]((uint64_t)v45, (uint64_t)v70, [v45 count]);
  }

  if ([v45 count])
  {
    id v41 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", 0, objc_msgSend(v45, "count"));
    id v42 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v43 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v8 = [v45 firstObject];
    uint64_t v9 = [(EDThreadPersistence *)self nextExistingThreadObjectIDForThreadObjectID:v8 forSortDescriptors:v47 journaledThreadsToCheck:v48 excluding:v45];

    if (v9)
    {
      [v42 setObject:v9 forKeyedSubscript:&unk_1F35BB198];
      uint64_t v62 = 0;
      uint64_t v63 = &v62;
      uint64_t v64 = 0x3032000000;
      char v65 = __Block_byref_object_copy__42;
      char v66 = __Block_byref_object_dispose__42;
      id v67 = (id)0xAAAAAAAAAAAAAAAALL;
      id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
      id v11 = [v45 firstObject];
      id v67 = (id)objc_msgSend(v10, "initWithObjects:", v11, 0);

      [v41 removeIndex:0];
      [v43 setObject:v63[5] forKeyedSubscript:v9];
      if ([v45 count] == 1)
      {
        id v12 = v43;
      }
      else
      {
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __114__EDThreadPersistence_threadObjectIDsByNextExistingForThreadObjectIDs_forSortDescriptors_journaledThreadsToCheck___block_invoke;
        aBlock[3] = &unk_1E6C06C40;
        id v44 = v42;
        id v57 = v44;
        id v15 = v41;
        id v58 = v15;
        id v61 = &v62;
        id v40 = v43;
        id v59 = v40;
        id v16 = v45;
        id v60 = v16;
        uint64_t v17 = (uint64_t (**)(void *, void *, uint64_t, void))_Block_copy(aBlock);
        id v18 = [v16 lastObject];
        uint64_t v19 = [(EDThreadPersistence *)self nextExistingThreadObjectIDForThreadObjectID:v18 forSortDescriptors:v47 journaledThreadsToCheck:v48 excluding:v16];
        id v20 = v19;
        if (v19)
        {
          id v21 = v19;
        }
        else
        {
          id v21 = [MEMORY[0x1E4F1CA98] null];
        }
        id v22 = v21;

        uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "count") - 1);
        [v44 setObject:v22 forKeyedSubscript:v23];

        if ((v17[2](v17, v22, [v16 count] - 1, 0) & 1) == 0)
        {
          objc_msgSend(v15, "removeIndex:", objc_msgSend(v16, "count") - 1);
          id v24 = objc_alloc(MEMORY[0x1E4F1CA48]);
          id v25 = [v16 lastObject];
          uint64_t v26 = objc_msgSend(v24, "initWithObjects:", v25, 0);
          id v27 = (void *)v63[5];
          v63[5] = v26;

          [v40 setObject:v63[5] forKeyedSubscript:v22];
        }
        uint64_t v51 = 0;
        int v52 = &v51;
        uint64_t v53 = 0x3010000000;
        int v54 = &unk_1DB68C921;
        long long v55 = xmmword_1DB640700;
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __114__EDThreadPersistence_threadObjectIDsByNextExistingForThreadObjectIDs_forSortDescriptors_journaledThreadsToCheck___block_invoke_2;
        void v50[3] = &unk_1E6C06C68;
        v50[4] = &v51;
        [v15 enumerateRangesUsingBlock:v50];
        uint64_t v28 = v52;
        uint64_t v29 = v52[4];
        if (v29 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v9 = v22;
        }
        else
        {
          do
          {
            uint64_t v30 = v29 + ((unint64_t)v28[5] >> 1);
            id v31 = [v16 objectAtIndexedSubscript:v30];
            id v32 = [(EDThreadPersistence *)self nextExistingThreadObjectIDForThreadObjectID:v31 forSortDescriptors:v47 journaledThreadsToCheck:v48 excluding:v16];
            id v33 = v32;
            if (v32)
            {
              id v34 = v32;
            }
            else
            {
              id v34 = [MEMORY[0x1E4F1CA98] null];
            }
            uint64_t v9 = v34;

            uint64_t v35 = [NSNumber numberWithUnsignedInteger:v30];
            [v44 setObject:v9 forKeyedSubscript:v35];

            if ((v17[2](v17, v9, v30, v52[4] - 1) & 1) == 0 && (v17[2](v17, v9, v30, v52[5] + v52[4]) & 1) == 0)
            {
              [v15 removeIndex:v30];
              uint64_t v36 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v31, 0);
              uint64_t v37 = (void *)v63[5];
              v63[5] = v36;

              [v40 setObject:v63[5] forKeyedSubscript:v9];
            }
            *((_OWORD *)v52 + 2) = xmmword_1DB640700;
            v49[0] = MEMORY[0x1E4F143A8];
            v49[1] = 3221225472;
            v49[2] = __114__EDThreadPersistence_threadObjectIDsByNextExistingForThreadObjectIDs_forSortDescriptors_journaledThreadsToCheck___block_invoke_3;
            v49[3] = &unk_1E6C06C68;
            void v49[4] = &v51;
            [v15 enumerateRangesUsingBlock:v49];

            uint64_t v28 = v52;
            uint64_t v29 = v52[4];
            id v22 = v9;
          }
          while (v29 != 0x7FFFFFFFFFFFFFFFLL);
        }
        id v38 = v40;
        _Block_object_dispose(&v51, 8);
      }
      _Block_object_dispose(&v62, 8);

      uint64_t v14 = v9;
      uint64_t v13 = v43;
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
      char v68 = v14;
      id v69 = v45;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
    }
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v13;
}

uint64_t __114__EDThreadPersistence_threadObjectIDsByNextExistingForThreadObjectIDs_forSortDescriptors_journaledThreadsToCheck___block_invoke(uint64_t a1, void *a2, unint64_t a3, unint64_t a4)
{
  id v7 = a2;
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = [NSNumber numberWithUnsignedInteger:a4];
  id v10 = [v8 objectForKeyedSubscript:v9];

  uint64_t v11 = [v10 isEqual:v7];
  if (v11)
  {
    uint64_t v12 = a4 - a3;
    if (a4 >= a3)
    {
      objc_msgSend(*(id *)(a1 + 40), "removeIndexesInRange:", a3, a4 - a3);
      uint64_t v20 = [*(id *)(a1 + 48) objectForKeyedSubscript:v7];
      uint64_t v21 = *(void *)(*(void *)(a1 + 64) + 8);
      id v22 = *(void **)(v21 + 40);
      *(void *)(v21 + 40) = v20;

      uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, a4 - a3);
      uint64_t v23 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      id v24 = objc_msgSend(*(id *)(a1 + 56), "subarrayWithRange:", a3, v12);
      [v23 insertObjects:v24 atIndexes:v19];
    }
    else
    {
      uint64_t v13 = a3 - a4;
      objc_msgSend(*(id *)(a1 + 40), "removeIndexesInRange:", a4 + 1, v13);
      uint64_t v14 = [*(id *)(a1 + 48) objectForKeyedSubscript:v7];
      uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
      id v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

      uint64_t v17 = *(void **)(a1 + 56);
      id v18 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      uint64_t v19 = objc_msgSend(v17, "subarrayWithRange:", a4 + 1, v13);
      [v18 addObjectsFromArray:v19];
    }
  }
  return v11;
}

uint64_t __114__EDThreadPersistence_threadObjectIDsByNextExistingForThreadObjectIDs_forSortDescriptors_journaledThreadsToCheck___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v4 = *(void *)(*(void *)(result + 32) + 8);
  *(void *)(v4 + 32) = a2;
  *(void *)(v4 + 40) = a3;
  *a4 = 1;
  return result;
}

uint64_t __114__EDThreadPersistence_threadObjectIDsByNextExistingForThreadObjectIDs_forSortDescriptors_journaledThreadsToCheck___block_invoke_3(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v4 = *(void *)(*(void *)(result + 32) + 8);
  *(void *)(v4 + 32) = a2;
  *(void *)(v4 + 40) = a3;
  *a4 = 1;
  return result;
}

- (id)_comparisonExpressionForSortDescriptors:(id)a3 conversationID:(int64_t)a4 threadExpression:(id)a5 threadScopeDatabaseID:(int64_t)a6 connection:(id)a7
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v38 = a5;
  id v39 = a7;
  uint64_t v37 = v10;
  uint64_t v11 = [v10 firstObject];
  uint64_t v12 = [(EDThreadPersistence *)self _columnForSortDescriptor:v11];

  id v40 = (void *)v12;
  if (v12)
  {
    uint64_t v36 = [objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:v12 table:@"threads"];
    [v36 setWhere:v38];
    uint64_t v50 = 0;
    uint64_t v51 = &v50;
    uint64_t v52 = 0x3032000000;
    uint64_t v53 = __Block_byref_object_copy__42;
    int v54 = __Block_byref_object_dispose__42;
    id v55 = 0;
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __128__EDThreadPersistence__comparisonExpressionForSortDescriptors_conversationID_threadExpression_threadScopeDatabaseID_connection___block_invoke;
    v49[3] = &unk_1E6BFF4C8;
    void v49[4] = &v50;
    [v39 executeSelectStatement:v36 withBlock:v49 error:0];
    if (v51[5])
    {
      id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v44 = self;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id obj = v10;
      uint64_t v13 = [obj countByEnumeratingWithState:&v45 objects:v58 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v46 != v14) {
              objc_enumerationMutation(obj);
            }
            id v16 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            uint64_t v17 = [(EDThreadPersistence *)v44 _columnForSortDescriptor:v16];
            if (v17)
            {
              id v18 = [MEMORY[0x1E4F60E78] table:@"threads" column:v17];
              int v19 = [v16 ascending];
              id v20 = objc_alloc(MEMORY[0x1E4F60E58]);
              if (v19) {
                uint64_t v21 = 2;
              }
              else {
                uint64_t v21 = 4;
              }
              id v22 = (void *)[v20 initWithLeft:v18 operator:v21 right:v51[5]];
              uint64_t v23 = [MEMORY[0x1E4F60E78] table:@"threads" column:@"conversation"];
              id v24 = [NSNumber numberWithLongLong:a4];
              id v25 = [v23 greaterThan:v24];

              id v26 = objc_alloc(MEMORY[0x1E4F60E48]);
              id v27 = [v18 equalTo:v51[5]];
              v57[0] = v27;
              v57[1] = v25;
              uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
              uint64_t v29 = (void *)[v26 initWithExpressions:v28];

              id v30 = objc_alloc(MEMORY[0x1E4F60ED8]);
              v56[0] = v22;
              v56[1] = v29;
              id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
              id v32 = (void *)[v30 initWithExpressions:v31];

              [v43 addObject:v32];
            }
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v45 objects:v58 count:16];
        }
        while (v13);
      }

      if ((unint64_t)[v43 count] < 2)
      {
        uint64_t v33 = [v43 firstObject];
      }
      else
      {
        uint64_t v33 = [objc_alloc(MEMORY[0x1E4F60E48]) initWithExpressions:v43];
      }
      id v34 = (void *)v33;
    }
    else
    {
      id v34 = 0;
    }
    _Block_object_dispose(&v50, 8);
  }
  else
  {
    uint64_t v36 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
      -[EDThreadPersistence _comparisonExpressionForSortDescriptors:conversationID:threadExpression:threadScopeDatabaseID:connection:]();
    }
    id v34 = (void *)MEMORY[0x1E4F1CC38];
  }

  return v34;
}

void __128__EDThreadPersistence__comparisonExpressionForSortDescriptors_conversationID_threadExpression_threadScopeDatabaseID_connection___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 objectAtIndexedSubscript:0];
  uint64_t v4 = [v3 numberValue];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)_columnForSortDescriptor:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 key];
  char v5 = [v4 isEqualToString:*MEMORY[0x1E4F5FE30]];

  if (v5)
  {
    uint64_t v6 = @"date";
  }
  else
  {
    id v7 = [v3 key];
    int v8 = [v7 isEqualToString:*MEMORY[0x1E4F5FE38]];

    if (v8) {
      uint64_t v6 = @"display_date";
    }
    else {
      uint64_t v6 = 0;
    }
  }

  return v6;
}

- (void)_scheduleRecomputationForThread:(id)a3 reason:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    id v12 = v6;
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "Scheduling recomputation for %{public}@: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  os_unfair_lock_lock(&self->_threadRecomputationLock);
  [(NSMutableSet *)self->_threadObjectIDsToRecompute addObject:v6];
  os_unfair_lock_unlock(&self->_threadRecomputationLock);
  uint64_t v9 = [(EDThreadPersistence *)self threadRecomputationDebouncer];
  [v9 debounceResult:0];

  id v10 = [@"Precomputed thread (recoverable) - " stringByAppendingString:v7];
  EFSaveTailspin();
}

- (void)_recomputeThreads
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  p_threadRecomputationLock = &self->_threadRecomputationLock;
  os_unfair_lock_lock(&self->_threadRecomputationLock);
  uint64_t v4 = (void *)[(NSMutableSet *)self->_threadObjectIDsToRecompute copy];
  [(NSMutableSet *)self->_threadObjectIDsToRecompute removeAllObjects];
  os_unfair_lock_unlock(p_threadRecomputationLock);
  char v5 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v10 = [v4 count];
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Recomputing %lu threads: %{public}@", buf, 0x16u);
  }

  id v6 = [v4 allObjects];
  id v7 = objc_msgSend(v6, "ef_groupBy:", &__block_literal_global_336);

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__EDThreadPersistence__recomputeThreads__block_invoke_2;
  v8[3] = &unk_1E6C06D00;
  v8[4] = self;
  [v7 enumerateKeysAndObjectsUsingBlock:v8];
}

id __40__EDThreadPersistence__recomputeThreads__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 threadScope];

  return v2;
}

void __40__EDThreadPersistence__recomputeThreads__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__EDThreadPersistence__recomputeThreads__block_invoke_3;
  v7[3] = &unk_1E6C06378;
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v5;
  objc_msgSend(a3, "ef_enumerateObjectsInBatchesOfSize:block:", 100, v7);
}

void __40__EDThreadPersistence__recomputeThreads__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) database];
  id v5 = [NSString stringWithUTF8String:"-[EDThreadPersistence _recomputeThreads]_block_invoke_3"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__EDThreadPersistence__recomputeThreads__block_invoke_4;
  v11[3] = &unk_1E6BFF4F0;
  id v6 = *(void **)(a1 + 40);
  void v11[4] = *(void *)(a1 + 32);
  id v12 = v6;
  id v7 = v3;
  id v13 = v7;
  int v8 = objc_msgSend(v4, "__performWriteWithCaller:usingBlock:", v5, v11);

  if (v8)
  {
    uint64_t v9 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v7 count];
      *(_DWORD *)buf = 134218242;
      uint64_t v15 = v10;
      __int16 v16 = 2114;
      id v17 = v7;
      _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "Successfully recomputed %lu threads: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v9 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __40__EDThreadPersistence__recomputeThreads__block_invoke_3_cold_1((uint64_t)v7, (uint64_t)buf, [v7 count]);
    }
  }
}

uint64_t __40__EDThreadPersistence__recomputeThreads__block_invoke_4(uint64_t a1, void *a2)
{
  if (![a2 protectedDatabaseAttached]) {
    return 1;
  }
  id v3 = [*(id *)(a1 + 32) _messageThreadExpressionForThreadScope:*(void *)(a1 + 40) objectIDs:*(void *)(a1 + 48)];
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) mailboxScope];
  id v6 = [v4 _persistedMessagesForMailboxScope:v5 messageExpression:v3];

  BOOL v7 = 1;
  if ([v6 count])
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 1;
    int v8 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __40__EDThreadPersistence__recomputeThreads__block_invoke_5;
    void v10[3] = &unk_1E6C06CD8;
    v10[4] = &v11;
    [v8 _iterateWrappedMessagesByConversationForPersistedMessages:v6 messageFilter:0 writeBlock:v10];
    BOOL v7 = *((unsigned char *)v12 + 24) != 0;
    _Block_object_dispose(&v11, 8);
  }

  return v7;
}

void __40__EDThreadPersistence__recomputeThreads__block_invoke_5(uint64_t a1, void *a2)
{
  id v6 = a2;
  char v3 = [v6 addThreadReplacingExisting:1 journaled:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v4 + 24)) {
    char v5 = v3;
  }
  else {
    char v5 = 0;
  }
  *(unsigned char *)(v4 + 24) = v5;
}

- (id)_persistedMessagesForMailboxScope:(id)a3 messageExpression:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v7 = [(EDThreadPersistence *)self database];
  int v8 = [NSString stringWithUTF8String:"-[EDThreadPersistence _persistedMessagesForMailboxScope:messageExpression:]"];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __75__EDThreadPersistence__persistedMessagesForMailboxScope_messageExpression___block_invoke;
  v18[3] = &unk_1E6BFF3D8;
  id v9 = v5;
  id v19 = v9;
  id v10 = v6;
  id v20 = v10;
  objc_msgSend(v7, "__performReadWithCaller:usingBlock:", v8, v18);

  if ([v10 count])
  {
    uint64_t v11 = [(EDThreadPersistence *)self messagePersistence];
    id v17 = 0;
    id v12 = [v11 persistedMessagesForDatabaseIDs:v10 requireProtectedData:1 temporarilyUnavailableDatabaseIDs:&v17];
    id v13 = v17;

    uint64_t v14 = [v13 count];
    if (v14) {
      id v15 = 0;
    }
    else {
      id v15 = v12;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

uint64_t __75__EDThreadPersistence__persistedMessagesForMailboxScope_messageExpression___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F60EF8]);
  id v5 = +[EDMessagePersistence messagesTableName];
  id v6 = (void *)[v4 initWithResultColumn:*MEMORY[0x1E4F60D08] table:v5];

  [v6 setWhere:*(void *)(a1 + 32)];
  BOOL v7 = +[EDMessagePersistence messagesDateReceivedColumnName];
  [v6 orderByColumn:v7 ascending:0];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__EDThreadPersistence__persistedMessagesForMailboxScope_messageExpression___block_invoke_2;
  void v10[3] = &unk_1E6BFF3B0;
  id v11 = *(id *)(a1 + 40);
  uint64_t v8 = [v3 executeSelectStatement:v6 withBlock:v10 error:0];

  return v8;
}

void __75__EDThreadPersistence__persistedMessagesForMailboxScope_messageExpression___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [a2 objectAtIndexedSubscript:0];
  id v3 = [v4 numberValue];
  [v2 addObject:v3];
}

- (void)persistenceIsInitializingDatabaseWithConnection:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  if ([(EDThreadPersistence *)self _addThreadScopeToDatabaseWithMailboxType:&unk_1F35BB1C8 filterPredicate:7 needsUpdate:0 lastViewedDate:v5 connection:v4])
  {
    id v6 = [MEMORY[0x1E4F60318] mailboxScopeForMailboxTypes:&unk_1F35BB618 forExclusion:0];
    BOOL v7 = (void *)[objc_alloc(MEMORY[0x1E4F604F0]) initWithMailboxScope:v6 filterPredicate:0];
    uint64_t v8 = [(EDThreadPersistence *)self threadScopeManager];
    objc_msgSend(v8, "addThreadScope:withDatabaseID:needsUpdate:lastViewedDate:", v7, objc_msgSend(v4, "lastInsertedDatabaseID"), 0, v5);
  }
  else
  {
    id v6 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[EDThreadPersistence persistenceIsInitializingDatabaseWithConnection:]();
    }
  }
}

- (void)setNeedsUpdateForThreadScope:(id)a3
{
  id v5 = a3;
  id v4 = [(EDThreadPersistence *)self threadScopeManager];
  [v4 setNeedsUpdate:1 forThreadScope:v5];
}

- (id)resetThreadScopesForAccount:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v17 = 0;
  id v18 = 0;
  [(EDThreadPersistence *)self _getIndividualMailboxScopes:&v18 unifiedMailboxThreadScopes:&v17 forAccount:a3];
  id v4 = v18;
  id v5 = v17;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        [(EDThreadPersistence *)self resetThreadScopesForMailboxScope:*(void *)(*((void *)&v13 + 1) + 8 * i)];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v7);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__EDThreadPersistence_resetThreadScopesForAccount___block_invoke;
  v12[3] = &unk_1E6C06D28;
  v12[4] = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v12];
  id v10 = [v5 allKeys];

  return v10;
}

uint64_t __51__EDThreadPersistence_resetThreadScopesForAccount___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _resetThreadScope:a2 withDatabaseID:a3];
}

- (void)_getIndividualMailboxScopes:(id *)a3 unifiedMailboxThreadScopes:(id *)a4 forAccount:(id)a5
{
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  *a3 = v10;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  *a4 = v11;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __89__EDThreadPersistence__getIndividualMailboxScopes_unifiedMailboxThreadScopes_forAccount___block_invoke;
  v15[3] = &unk_1E6C06D50;
  SEL v19 = a2;
  v15[4] = self;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  id v13 = v10;
  id v18 = v13;
  id v14 = v11;
  [(EDThreadPersistence *)self _enumerateThreadScopesUsingBlock:v15];
}

void __89__EDThreadPersistence__getIndividualMailboxScopes_unifiedMailboxThreadScopes_forAccount___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, int a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (v11)
  {
    id v12 = [MEMORY[0x1E4F60318] allMailboxesScope];

    if (v12 != v11)
    {
      id v13 = [v11 mailboxTypes];
      uint64_t v14 = [v13 count];

      if (v14)
      {
        long long v15 = [v11 mailboxObjectIDs];

        if (v15)
        {
          id v24 = [MEMORY[0x1E4F28B00] currentHandler];
          [v24 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"EDThreadPersistence.m" lineNumber:1638 description:@"Mailbox scope should not have both types and objects"];

          if (a5)
          {
LABEL_6:
            id v16 = [v11 mailboxTypes];
            uint64_t v17 = [v16 count];

            if (v17 != 2)
            {
              id v18 = [MEMORY[0x1E4F28B00] currentHandler];
              [v18 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"EDThreadPersistence.m" lineNumber:1640 description:@"Mailbox scope should have exactly two types"];
LABEL_25:

              goto LABEL_17;
            }
            goto LABEL_17;
          }
        }
        else if (a5)
        {
          goto LABEL_6;
        }
        id v25 = [v11 mailboxTypes];
        uint64_t v26 = [v25 count];

        if (v26 != 1)
        {
          id v18 = [MEMORY[0x1E4F28B00] currentHandler];
          [v18 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"EDThreadPersistence.m" lineNumber:1642 description:@"Mailbox scope should have exactly one type"];
          goto LABEL_25;
        }
LABEL_17:
        [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v10];
        goto LABEL_23;
      }
      uint64_t v20 = [v11 mailboxTypes];

      if (v20)
      {
        id v27 = [MEMORY[0x1E4F28B00] currentHandler];
        [v27 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"EDThreadPersistence.m" lineNumber:1646 description:@"Mailbox scope should not have both types and objects"];

        if (a5)
        {
LABEL_13:
          uint64_t v21 = [v11 mailboxObjectIDs];
          uint64_t v22 = [v21 count];

          if (v22 != 2)
          {
            uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
            [v23 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"EDThreadPersistence.m" lineNumber:1648 description:@"Mailbox scope should have exactly two mailboxes"];
LABEL_27:

            goto LABEL_20;
          }
          goto LABEL_20;
        }
      }
      else if (a5)
      {
        goto LABEL_13;
      }
      uint64_t v28 = [v11 mailboxObjectIDs];
      uint64_t v29 = [v28 count];

      if (v29 != 1)
      {
        uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
        [v23 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"EDThreadPersistence.m" lineNumber:1650 description:@"Mailbox scope should have exactly two mailbox"];
        goto LABEL_27;
      }
LABEL_20:
      id v30 = [v11 mailboxObjectIDs];
      id v31 = [v30 anyObject];

      id v32 = [v31 url];
      if ([*(id *)(a1 + 48) containsMailboxWithURL:v32]) {
        [*(id *)(a1 + 56) addObject:v11];
      }

      goto LABEL_23;
    }
  }
  SEL v19 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    __89__EDThreadPersistence__getIndividualMailboxScopes_unifiedMailboxThreadScopes_forAccount___block_invoke_cold_1();
  }

LABEL_23:
}

- (void)persistenceIsAddingMailboxWithDatabaseID:(int64_t)a3 objectID:(id)a4 generationWindow:(id)a5
{
  id v7 = a4;
  if (([v7 isEphemeral] & 1) == 0)
  {
    uint64_t v8 = [(EDThreadPersistence *)self messagePersistence];
    id v9 = [v8 mailboxPersistence];
    id v10 = [v7 url];
    id v11 = [v9 legacyMailboxForMailboxURL:v10];

    if ([v11 type] == 7)
    {
      id v12 = [(EDThreadPersistence *)self database];
      id v13 = [NSString stringWithUTF8String:"-[EDThreadPersistence persistenceIsAddingMailboxWithDatabaseID:objectID:generationWindow:]"];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      void v14[2] = __90__EDThreadPersistence_persistenceIsAddingMailboxWithDatabaseID_objectID_generationWindow___block_invoke;
      void v14[3] = &unk_1E6BFF360;
      id v15 = v7;
      id v16 = self;
      int64_t v17 = a3;
      objc_msgSend(v12, "__performWriteWithCaller:usingBlock:", v13, v14);
    }
  }
}

uint64_t __90__EDThreadPersistence_persistenceIsAddingMailboxWithDatabaseID_objectID_generationWindow___block_invoke(void *a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F60318];
  v13[0] = a1[4];
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  id v6 = [v4 mailboxScopeForMailboxObjectIDs:v5 forExclusion:0];

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F604F0]) initWithMailboxScope:v6 filterPredicate:0];
  id v9 = (void *)a1[5];
  uint64_t v8 = a1[6];
  id v10 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v11 = [v9 _addThreadScopeToDatabase:v7 withMailboxDatabaseID:v8 filterPredicate:7 needsUpdate:0 lastViewedDate:v10 updateThreadScopeManager:1 connection:v3];

  return v11;
}

- (void)persistenceIsAddingMessages:(id)a3 journaled:(BOOL)a4 generationWindow:(id)a5
{
  BOOL v6 = a4;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    uint64_t v12 = [v8 count];
    _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Persistence is adding %lu messages", (uint8_t *)&v11, 0xCu);
  }

  [(EDThreadPersistence *)self _addPersistedMessages:v8 journaled:v6 generationWindow:v9];
}

- (void)_addPersistedMessages:(id)a3 journaled:(BOOL)a4 generationWindow:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(EDThreadPersistence *)self _filteredPersistedMessagesForPersistedMessages:v8];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__EDThreadPersistence__addPersistedMessages_journaled_generationWindow___block_invoke;
  v12[3] = &unk_1E6C06D78;
  v12[4] = self;
  BOOL v14 = a4;
  id v11 = v9;
  id v13 = v11;
  [(EDThreadPersistence *)self _iterateWrappedMessagesByConversationForPersistedMessages:v10 messageFilter:0 writeBlock:v12];
}

uint64_t __72__EDThreadPersistence__addPersistedMessages_journaled_generationWindow___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _writeThreadedMessages:a2 withChangedKeyPaths:0 journaled:*(unsigned __int8 *)(a1 + 48) generationWindow:*(void *)(a1 + 40)];
}

- (void)_writeThreadedMessages:(id)a3 withChangedKeyPaths:(id)a4 journaled:(BOOL)a5 generationWindow:(id)a6
{
  BOOL v7 = a5;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v27 = [v10 thread];
  id v13 = [(EDThreadPersistence *)self hookRegistry];
  if ([v10 addThreadReplacingExisting:0 journaled:v7])
  {
    BOOL v14 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = &stru_1F3583658;
      if (v7) {
        id v15 = @"journaled ";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v29 = v15;
      __int16 v30 = 2114;
      id v31 = v27;
      _os_log_impl(&dword_1DB39C000, v14, OS_LOG_TYPE_DEFAULT, "Adding %@thread (new messages): %{public}@", buf, 0x16u);
    }

    id v16 = [v10 threadObjectID];
    [v13 persistenceIsAddingThreadWithObjectID:v16 journaled:v7 generationWindow:v12];
  }
  else
  {
    int64_t v17 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = &stru_1F3583658;
      if (v7) {
        id v18 = @"journaled ";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v29 = v18;
      __int16 v30 = 2114;
      id v31 = v27;
      _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_DEFAULT, "Updating %@thread (new messages): %{public}@", buf, 0x16u);
    }

    SEL v19 = [v10 updateThreadTableWithJournaled:v7];
    uint64_t v20 = [v10 threadObjectID];
    BOOL v21 = -[EDThreadPersistence _recalculateNewestMessageForThreadObjectID:threadScopeDatabaseID:](self, "_recalculateNewestMessageForThreadObjectID:threadScopeDatabaseID:", v20, [v10 threadScopeDatabaseID]);

    if (v21) {
      [v19 addObject:*MEMORY[0x1E4F5FE70]];
    }
    if (v19)
    {
      if ([v11 count]) {
        objc_msgSend(v19, "ef_addAbsentObjectsFromArrayAccordingToEquals:", v11);
      }
      id v22 = v19;

      id v11 = v22;
    }
    if ([v11 count])
    {
      uint64_t v23 = +[EDThreadPersistence log];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = &stru_1F3583658;
        *(_DWORD *)buf = 138412802;
        if (v7) {
          id v24 = @"journaled ";
        }
        uint64_t v29 = v24;
        __int16 v30 = 2114;
        id v31 = v27;
        __int16 v32 = 2114;
        id v33 = v11;
        _os_log_impl(&dword_1DB39C000, v23, OS_LOG_TYPE_DEFAULT, "Changing %@thread (new messages): %{public}@\nkey paths: %{public}@", buf, 0x20u);
      }

      if (v7)
      {
        id v25 = [v10 threadObjectID];
        [v13 persistenceIsMarkingThreadAsJournaledWithObjectID:v25 generationWindow:v12];
      }
      uint64_t v26 = [v10 threadObjectID];
      [v13 persistenceIsChangingThreadWithObjectID:v26 changedKeyPaths:v11 generationWindow:v12];
    }
  }
}

- (void)persistenceDidAddMessages:(id)a3 generationWindow:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 67109120;
    int v11 = objc_msgSend(MEMORY[0x1E4F60E00], "bucketMessageCount:", objc_msgSend(v5, "count"));
    _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_DEFAULT, "Persistence did add %u messages", (uint8_t *)&v10, 8u);
  }

  BOOL v7 = EFFetchSignpostLog();
  if (os_signpost_enabled(v7))
  {
    int v8 = objc_msgSend(MEMORY[0x1E4F60E00], "bucketMessageCount:", objc_msgSend(v5, "count"));
    int v10 = 67109120;
    int v11 = v8;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ThreadPersistenceDidAddMessages", "count=%u ", (uint8_t *)&v10, 8u);
  }

  id v9 = [(EDThreadPersistence *)self hookRegistry];
  [v9 persistenceDidFinishThreadUpdates];
}

- (void)persistenceIsChangingFlags:(id)a3 messages:(id)a4 generationWindow:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 deletedChanged])
  {
    if ([v8 deleted])
    {
      int v11 = +[EDThreadPersistence log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 134218242;
        uint64_t v15 = [v9 count];
        __int16 v16 = 2114;
        id v17 = v8;
        _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_DEFAULT, "Persistence is setting deleted flag for %lu messages: %{public}@", (uint8_t *)&v14, 0x16u);
      }

      [(EDThreadPersistence *)self _persistenceIsDeletingMessages:v9 generationWindow:v10];
    }
    else
    {
      id v13 = +[EDThreadPersistence log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 134218242;
        uint64_t v15 = [v9 count];
        __int16 v16 = 2114;
        id v17 = v8;
        _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "Persistence is unsetting deleted flag for %lu messages: %{public}@", (uint8_t *)&v14, 0x16u);
      }

      [(EDThreadPersistence *)self _addPersistedMessages:v9 journaled:0 generationWindow:v10];
    }
  }
  else
  {
    uint64_t v12 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134218242;
      uint64_t v15 = [v9 count];
      __int16 v16 = 2114;
      id v17 = v8;
      _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_DEFAULT, "Persistence is changing flags for %lu messages: %{public}@", (uint8_t *)&v14, 0x16u);
    }

    [(EDThreadPersistence *)self _persistenceIsChangingFlags:v8 messages:v9 generationWindow:v10];
  }
}

- (void)_persistenceIsChangingFlags:(id)a3 messages:(id)a4 generationWindow:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(EDThreadPersistence *)self _filteredPersistedMessagesForPersistedMessages:v9];

  uint64_t v12 = [(EDThreadPersistence *)self hookRegistry];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __77__EDThreadPersistence__persistenceIsChangingFlags_messages_generationWindow___block_invoke;
  void v16[3] = &unk_1E6C06DA0;
  void v16[4] = self;
  id v13 = v8;
  id v17 = v13;
  id v18 = v12;
  id v14 = v10;
  id v19 = v14;
  id v15 = v12;
  [(EDThreadPersistence *)self _iterateWrappedMessagesByConversationForPersistedMessages:v11 block:v16];
}

void __77__EDThreadPersistence__persistenceIsChangingFlags_messages_generationWindow___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [*(id *)(a1 + 32) _persistenceIsChangingFlags:*(void *)(a1 + 40) wrappedMessages:v8 threadObjectID:v7 threadScopeDatabaseID:a2];
  if ([v9 count])
  {
    id v10 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
      int v12 = 138543874;
      id v13 = v7;
      __int16 v14 = 2114;
      id v15 = v9;
      __int16 v16 = 2114;
      id v17 = v11;
      _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Changing thread (flag change): %{public}@\nkey paths: %{public}@\n updated flags: %{public}@", (uint8_t *)&v12, 0x20u);
    }
    [*(id *)(a1 + 48) persistenceIsChangingThreadWithObjectID:v7 changedKeyPaths:v9 generationWindow:*(void *)(a1 + 56)];
  }
}

- (void)persistenceDidChangeFlags:(id)a3 messages:(id)a4 generationWindow:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v8 count];
    int v11 = objc_msgSend(v7, "ef_publicDescription");
    int v13 = 134218242;
    uint64_t v14 = v10;
    __int16 v15 = 2114;
    __int16 v16 = v11;
    _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "Persistence did change flags for %lu messages: %{public}@", (uint8_t *)&v13, 0x16u);
  }
  int v12 = [(EDThreadPersistence *)self hookRegistry];
  [v12 persistenceDidFinishThreadUpdates];
}

- (id)_persistenceIsChangingFlags:(id)a3 wrappedMessages:(id)a4 threadObjectID:(id)a5 threadScopeDatabaseID:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = -[EDThreadPersistence _threadExpressionForThreadScopeDatabaseID:conversation:](self, "_threadExpressionForThreadScopeDatabaseID:conversation:", a6, [v12 conversationID]);
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v25 = [(EDThreadPersistence *)self database];
  __int16 v15 = [NSString stringWithUTF8String:"-[EDThreadPersistence _persistenceIsChangingFlags:wrappedMessages:threadObjectID:threadScopeDatabaseID:]"];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __104__EDThreadPersistence__persistenceIsChangingFlags_wrappedMessages_threadObjectID_threadScopeDatabaseID___block_invoke;
  v26[3] = &unk_1E6C02668;
  v26[4] = self;
  id v16 = v12;
  id v27 = v16;
  id v17 = v10;
  id v28 = v17;
  id v24 = v12;
  id v18 = v13;
  id v29 = v18;
  id v19 = v14;
  id v30 = v19;
  id v20 = v11;
  id v31 = v20;
  int64_t v32 = a6;
  objc_msgSend(v25, "__performWriteWithCaller:usingBlock:", v15, v26, v14, v24);

  BOOL v21 = v31;
  id v22 = v19;

  return v22;
}

uint64_t __104__EDThreadPersistence__persistenceIsChangingFlags_wrappedMessages_threadObjectID_threadScopeDatabaseID___block_invoke(uint64_t a1, void *a2)
{
  v201[2] = *MEMORY[0x1E4F143B8];
  id v181 = a2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"threads"];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v183 = [*(id *)(a1 + 32) _messageThreadExpressionForThreadObjectID:*(void *)(a1 + 40)];
  if ([*(id *)(a1 + 48) readChanged])
  {
    id v5 = [MEMORY[0x1E4F60E78] column:@"read"];
    if ([*(id *)(a1 + 48) read])
    {
      id v6 = objc_alloc(MEMORY[0x1E4F60EF8]);
      id v7 = +[EDMessagePersistence messagesTableName];
      id v8 = (void *)[v6 initWithResult:&unk_1F35BB198 table:v7];

      id v9 = objc_alloc(MEMORY[0x1E4F60E48]);
      v201[0] = v183;
      id v10 = [MEMORY[0x1E4F60E78] column:@"read"];
      id v11 = [v10 equalTo:&unk_1F35BB198];
      v201[1] = v11;
      id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v201 count:2];
      int v13 = (void *)[v9 initWithExpressions:v12];
      [v8 setWhere:v13];

      [v8 setLimit:1];
      id v14 = [MEMORY[0x1E4F60EA8] ifNull:v8 second:&unk_1F35BB1B0];
      [v3 setObject:v14 forKeyedSubscript:@"read"];

      __int16 v15 = [v5 equalTo:&unk_1F35BB198];
      [v4 addObject:v15];
    }
    else
    {
      [v3 setObject:&unk_1F35BB198 forKeyedSubscript:@"read"];
      id v16 = [v5 notEqualTo:&unk_1F35BB198];
      [v4 addObject:v16];
    }
  }
  if (objc_msgSend(*(id *)(a1 + 48), "flaggedChanged", v181))
  {
    id v17 = [MEMORY[0x1E4F60E78] column:@"flagged"];
    if ([*(id *)(a1 + 48) flagged])
    {
      [v3 setObject:&unk_1F35BB1B0 forKeyedSubscript:@"flagged"];
      id v18 = [v17 equalTo:&unk_1F35BB198];
      [v4 addObject:v18];
    }
    else
    {
      id v19 = objc_alloc(MEMORY[0x1E4F60EF8]);
      id v20 = +[EDMessagePersistence messagesTableName];
      id v18 = (void *)[v19 initWithResult:&unk_1F35BB1B0 table:v20];

      id v21 = objc_alloc(MEMORY[0x1E4F60E48]);
      v200[0] = v183;
      id v22 = [MEMORY[0x1E4F60E78] column:@"flagged"];
      uint64_t v23 = [v22 equalTo:&unk_1F35BB1B0];
      v200[1] = v23;
      id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v200 count:2];
      id v25 = (void *)[v21 initWithExpressions:v24];
      [v18 setWhere:v25];

      [v18 setLimit:1];
      uint64_t v26 = [MEMORY[0x1E4F60EA8] ifNull:v18 second:&unk_1F35BB198];
      [v3 setObject:v26 forKeyedSubscript:@"flagged"];

      id v27 = [v17 notEqualTo:&unk_1F35BB198];
      [v4 addObject:v27];
    }
  }
  id v28 = [MEMORY[0x1E4F60E78] column:@"flags"];
  if ([*(id *)(a1 + 48) draftChanged])
  {
    id v29 = [MEMORY[0x1E4F60E78] column:@"draft"];
    if ([*(id *)(a1 + 48) draft])
    {
      [v3 setObject:&unk_1F35BB1B0 forKeyedSubscript:@"draft"];
      id v30 = [v29 equalTo:&unk_1F35BB198];
      [v4 addObject:v30];
    }
    else
    {
      id v31 = objc_alloc(MEMORY[0x1E4F60EF8]);
      int64_t v32 = +[EDMessagePersistence messagesTableName];
      id v30 = (void *)[v31 initWithResult:&unk_1F35BB1B0 table:v32];

      id v33 = objc_alloc(MEMORY[0x1E4F60E48]);
      v199[0] = v183;
      uint64_t v34 = [v28 matchesMask:&unk_1F35BB1E0];
      v199[1] = v34;
      uint64_t v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v199 count:2];
      uint64_t v36 = (void *)[v33 initWithExpressions:v35];
      [v30 setWhere:v36];

      [v30 setLimit:1];
      uint64_t v37 = [MEMORY[0x1E4F60EA8] ifNull:v30 second:&unk_1F35BB198];
      [v3 setObject:v37 forKeyedSubscript:@"draft"];

      id v38 = [v29 notEqualTo:&unk_1F35BB198];
      [v4 addObject:v38];
    }
  }
  if ([*(id *)(a1 + 48) repliedChanged])
  {
    id v39 = [MEMORY[0x1E4F60E78] column:@"replied"];
    if ([*(id *)(a1 + 48) replied])
    {
      [v3 setObject:&unk_1F35BB1B0 forKeyedSubscript:@"replied"];
      id v40 = [v39 equalTo:&unk_1F35BB198];
      [v4 addObject:v40];
    }
    else
    {
      id v41 = objc_alloc(MEMORY[0x1E4F60EF8]);
      id v42 = +[EDMessagePersistence messagesTableName];
      id v40 = (void *)[v41 initWithResult:&unk_1F35BB1B0 table:v42];

      id v43 = objc_alloc(MEMORY[0x1E4F60E48]);
      v198[0] = v183;
      id v44 = [v28 matchesMask:&unk_1F35BB1F8];
      v198[1] = v44;
      long long v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v198 count:2];
      long long v46 = (void *)[v43 initWithExpressions:v45];
      [v40 setWhere:v46];

      [v40 setLimit:1];
      long long v47 = [MEMORY[0x1E4F60EA8] ifNull:v40 second:&unk_1F35BB198];
      [v3 setObject:v47 forKeyedSubscript:@"replied"];

      long long v48 = [v39 notEqualTo:&unk_1F35BB198];
      [v4 addObject:v48];
    }
  }
  if ([*(id *)(a1 + 48) forwardedChanged])
  {
    int v49 = [MEMORY[0x1E4F60E78] column:@"forwarded"];
    if ([*(id *)(a1 + 48) forwarded])
    {
      [v3 setObject:&unk_1F35BB1B0 forKeyedSubscript:@"forwarded"];
      uint64_t v50 = [v49 equalTo:&unk_1F35BB198];
      [v4 addObject:v50];
    }
    else
    {
      id v51 = objc_alloc(MEMORY[0x1E4F60EF8]);
      uint64_t v52 = +[EDMessagePersistence messagesTableName];
      uint64_t v50 = (void *)[v51 initWithResult:&unk_1F35BB1B0 table:v52];

      id v53 = objc_alloc(MEMORY[0x1E4F60E48]);
      v197[0] = v183;
      int v54 = [v28 matchesMask:&unk_1F35BB210];
      v197[1] = v54;
      id v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v197 count:2];
      int v56 = (void *)[v53 initWithExpressions:v55];
      [v50 setWhere:v56];

      [v50 setLimit:1];
      id v57 = [MEMORY[0x1E4F60EA8] ifNull:v50 second:&unk_1F35BB198];
      [v3 setObject:v57 forKeyedSubscript:@"forwarded"];

      id v58 = [v49 notEqualTo:&unk_1F35BB198];
      [v4 addObject:v58];
    }
  }
  if ([*(id *)(a1 + 48) redirectedChanged])
  {
    uint64_t v59 = [MEMORY[0x1E4F60E78] column:@"redirected"];
    if ([*(id *)(a1 + 48) redirected])
    {
      [v3 setObject:&unk_1F35BB1B0 forKeyedSubscript:@"redirected"];
      id v60 = [v59 equalTo:&unk_1F35BB198];
      [v4 addObject:v60];
    }
    else
    {
      id v61 = objc_alloc(MEMORY[0x1E4F60EF8]);
      uint64_t v62 = +[EDMessagePersistence messagesTableName];
      id v60 = (void *)[v61 initWithResult:&unk_1F35BB1B0 table:v62];

      id v63 = objc_alloc(MEMORY[0x1E4F60E48]);
      v196[0] = v183;
      uint64_t v64 = [v28 matchesMask:&unk_1F35BB228];
      v196[1] = v64;
      char v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:v196 count:2];
      char v66 = (void *)[v63 initWithExpressions:v65];
      [v60 setWhere:v66];

      [v60 setLimit:1];
      id v67 = [MEMORY[0x1E4F60EA8] ifNull:v60 second:&unk_1F35BB198];
      [v3 setObject:v67 forKeyedSubscript:@"redirected"];

      char v68 = [v59 notEqualTo:&unk_1F35BB198];
      [v4 addObject:v68];
    }
  }
  if ([*(id *)(a1 + 48) flagColorChanged])
  {
    id v69 = [MEMORY[0x1E4F60E78] column:@"has_red_flag"];
    if ([*(id *)(a1 + 48) flaggedChanged]
      && ![*(id *)(a1 + 48) flagged]
      || [*(id *)(a1 + 48) flagColor])
    {
      id v70 = objc_alloc(MEMORY[0x1E4F60EF8]);
      uint64_t v71 = +[EDMessagePersistence messagesTableName];
      char v72 = (void *)[v70 initWithResult:&unk_1F35BB1B0 table:v71];

      char v73 = [MEMORY[0x1E4F60E78] column:@"flag_color"];
      char v74 = [v73 equalTo:&unk_1F35BB240];

      id v75 = objc_alloc(MEMORY[0x1E4F60E48]);
      v195[0] = v183;
      v195[1] = v74;
      char v76 = [MEMORY[0x1E4F1C978] arrayWithObjects:v195 count:2];
      char v77 = (void *)[v75 initWithExpressions:v76];
      [v72 setWhere:v77];

      [v72 setLimit:1];
      uint64_t v78 = [MEMORY[0x1E4F60EA8] ifNull:v72 second:&unk_1F35BB198];
      [v3 setObject:v78 forKeyedSubscript:@"has_red_flag"];

      __int16 v79 = [v69 notEqualTo:&unk_1F35BB198];
      [v4 addObject:v79];
    }
    else
    {
      [v3 setObject:&unk_1F35BB1B0 forKeyedSubscript:@"has_red_flag"];
      char v72 = [v69 equalTo:&unk_1F35BB198];
      [v4 addObject:v72];
    }

    uint64_t v80 = [MEMORY[0x1E4F60E78] column:@"has_orange_flag"];
    if ((![*(id *)(a1 + 48) flaggedChanged]
       || [*(id *)(a1 + 48) flagged])
      && [*(id *)(a1 + 48) flagColor] == 1)
    {
      [v3 setObject:&unk_1F35BB1B0 forKeyedSubscript:@"has_orange_flag"];
      uint64_t v81 = [v80 equalTo:&unk_1F35BB198];
      [v4 addObject:v81];
    }
    else
    {
      id v82 = objc_alloc(MEMORY[0x1E4F60EF8]);
      v83 = +[EDMessagePersistence messagesTableName];
      uint64_t v81 = (void *)[v82 initWithResult:&unk_1F35BB1B0 table:v83];

      v84 = [MEMORY[0x1E4F60E78] column:@"flag_color"];
      v85 = [v84 equalTo:&unk_1F35BB258];

      id v86 = objc_alloc(MEMORY[0x1E4F60E48]);
      v194[0] = v183;
      v194[1] = v85;
      v87 = [MEMORY[0x1E4F1C978] arrayWithObjects:v194 count:2];
      v88 = (void *)[v86 initWithExpressions:v87];
      [v81 setWhere:v88];

      [v81 setLimit:1];
      v89 = [MEMORY[0x1E4F60EA8] ifNull:v81 second:&unk_1F35BB198];
      [v3 setObject:v89 forKeyedSubscript:@"has_orange_flag"];

      v90 = [v80 notEqualTo:&unk_1F35BB198];
      [v4 addObject:v90];
    }
    v91 = [MEMORY[0x1E4F60E78] column:@"has_yellow_flag"];
    if ((![*(id *)(a1 + 48) flaggedChanged]
       || [*(id *)(a1 + 48) flagged])
      && [*(id *)(a1 + 48) flagColor] == 2)
    {
      [v3 setObject:&unk_1F35BB1B0 forKeyedSubscript:@"has_yellow_flag"];
      v92 = [v91 equalTo:&unk_1F35BB198];
      [v4 addObject:v92];
    }
    else
    {
      id v93 = objc_alloc(MEMORY[0x1E4F60EF8]);
      v94 = +[EDMessagePersistence messagesTableName];
      v92 = (void *)[v93 initWithResult:&unk_1F35BB1B0 table:v94];

      v95 = [MEMORY[0x1E4F60E78] column:@"flag_color"];
      v96 = [v95 equalTo:&unk_1F35BB270];

      id v97 = objc_alloc(MEMORY[0x1E4F60E48]);
      v193[0] = v183;
      v193[1] = v96;
      v98 = [MEMORY[0x1E4F1C978] arrayWithObjects:v193 count:2];
      v99 = (void *)[v97 initWithExpressions:v98];
      [v92 setWhere:v99];

      [v92 setLimit:1];
      v100 = [MEMORY[0x1E4F60EA8] ifNull:v92 second:&unk_1F35BB198];
      [v3 setObject:v100 forKeyedSubscript:@"has_yellow_flag"];

      v101 = [v91 notEqualTo:&unk_1F35BB198];
      [v4 addObject:v101];
    }
    v102 = [MEMORY[0x1E4F60E78] column:@"has_green_flag"];
    if ((![*(id *)(a1 + 48) flaggedChanged]
       || [*(id *)(a1 + 48) flagged])
      && [*(id *)(a1 + 48) flagColor] == 3)
    {
      [v3 setObject:&unk_1F35BB1B0 forKeyedSubscript:@"has_green_flag"];
      v103 = [v102 equalTo:&unk_1F35BB198];
      [v4 addObject:v103];
    }
    else
    {
      id v104 = objc_alloc(MEMORY[0x1E4F60EF8]);
      v105 = +[EDMessagePersistence messagesTableName];
      v103 = (void *)[v104 initWithResult:&unk_1F35BB1B0 table:v105];

      v106 = [MEMORY[0x1E4F60E78] column:@"flag_color"];
      v107 = [v106 equalTo:&unk_1F35BB288];

      id v108 = objc_alloc(MEMORY[0x1E4F60E48]);
      v192[0] = v183;
      v192[1] = v107;
      v109 = [MEMORY[0x1E4F1C978] arrayWithObjects:v192 count:2];
      v110 = (void *)[v108 initWithExpressions:v109];
      [v103 setWhere:v110];

      [v103 setLimit:1];
      v111 = [MEMORY[0x1E4F60EA8] ifNull:v103 second:&unk_1F35BB198];
      [v3 setObject:v111 forKeyedSubscript:@"has_green_flag"];

      v112 = [v102 notEqualTo:&unk_1F35BB198];
      [v4 addObject:v112];
    }
    v113 = [MEMORY[0x1E4F60E78] column:@"has_blue_flag"];
    if ((![*(id *)(a1 + 48) flaggedChanged]
       || [*(id *)(a1 + 48) flagged])
      && [*(id *)(a1 + 48) flagColor] == 4)
    {
      [v3 setObject:&unk_1F35BB1B0 forKeyedSubscript:@"has_blue_flag"];
      v114 = [v113 equalTo:&unk_1F35BB198];
      [v4 addObject:v114];
    }
    else
    {
      id v115 = objc_alloc(MEMORY[0x1E4F60EF8]);
      v116 = +[EDMessagePersistence messagesTableName];
      v114 = (void *)[v115 initWithResult:&unk_1F35BB1B0 table:v116];

      v117 = [MEMORY[0x1E4F60E78] column:@"flag_color"];
      v118 = [v117 equalTo:&unk_1F35BB2A0];

      id v119 = objc_alloc(MEMORY[0x1E4F60E48]);
      v191[0] = v183;
      v191[1] = v118;
      v120 = [MEMORY[0x1E4F1C978] arrayWithObjects:v191 count:2];
      v121 = (void *)[v119 initWithExpressions:v120];
      [v114 setWhere:v121];

      [v114 setLimit:1];
      v122 = [MEMORY[0x1E4F60EA8] ifNull:v114 second:&unk_1F35BB198];
      [v3 setObject:v122 forKeyedSubscript:@"has_blue_flag"];

      v123 = [v113 notEqualTo:&unk_1F35BB198];
      [v4 addObject:v123];
    }
    v124 = [MEMORY[0x1E4F60E78] column:@"has_purple_flag"];
    if ((![*(id *)(a1 + 48) flaggedChanged]
       || [*(id *)(a1 + 48) flagged])
      && [*(id *)(a1 + 48) flagColor] == 5)
    {
      [v3 setObject:&unk_1F35BB1B0 forKeyedSubscript:@"has_purple_flag"];
      v125 = [v124 equalTo:&unk_1F35BB198];
      [v4 addObject:v125];
    }
    else
    {
      id v126 = objc_alloc(MEMORY[0x1E4F60EF8]);
      v127 = +[EDMessagePersistence messagesTableName];
      v125 = (void *)[v126 initWithResult:&unk_1F35BB1B0 table:v127];

      v128 = [MEMORY[0x1E4F60E78] column:@"flag_color"];
      v129 = [v128 equalTo:&unk_1F35BB2B8];

      id v130 = objc_alloc(MEMORY[0x1E4F60E48]);
      v190[0] = v183;
      v190[1] = v129;
      v131 = [MEMORY[0x1E4F1C978] arrayWithObjects:v190 count:2];
      v132 = (void *)[v130 initWithExpressions:v131];
      [v125 setWhere:v132];

      [v125 setLimit:1];
      v133 = [MEMORY[0x1E4F60EA8] ifNull:v125 second:&unk_1F35BB198];
      [v3 setObject:v133 forKeyedSubscript:@"has_purple_flag"];

      v134 = [v124 notEqualTo:&unk_1F35BB198];
      [v4 addObject:v134];
    }
    v135 = [MEMORY[0x1E4F60E78] column:@"has_gray_flag"];
    if ((![*(id *)(a1 + 48) flaggedChanged]
       || [*(id *)(a1 + 48) flagged])
      && [*(id *)(a1 + 48) flagColor] == 6)
    {
      [v3 setObject:&unk_1F35BB1B0 forKeyedSubscript:@"has_gray_flag"];
      v136 = [v135 equalTo:&unk_1F35BB198];
      [v4 addObject:v136];
    }
    else
    {
      id v137 = objc_alloc(MEMORY[0x1E4F60EF8]);
      v138 = +[EDMessagePersistence messagesTableName];
      v136 = (void *)[v137 initWithResult:&unk_1F35BB1B0 table:v138];

      v139 = [MEMORY[0x1E4F60E78] column:@"flag_color"];
      v140 = [v139 equalTo:&unk_1F35BB2D0];

      id v141 = objc_alloc(MEMORY[0x1E4F60E48]);
      v189[0] = v183;
      v189[1] = v140;
      v142 = [MEMORY[0x1E4F1C978] arrayWithObjects:v189 count:2];
      v143 = (void *)[v141 initWithExpressions:v142];
      [v136 setWhere:v143];

      [v136 setLimit:1];
      v144 = [MEMORY[0x1E4F60EA8] ifNull:v136 second:&unk_1F35BB198];
      [v3 setObject:v144 forKeyedSubscript:@"has_gray_flag"];

      v145 = [v135 notEqualTo:&unk_1F35BB198];
      [v4 addObject:v145];
    }
  }
  if ([*(id *)(a1 + 48) junkLevelChanged])
  {
    v146 = [MEMORY[0x1E4F60E78] column:@"junk_level"];
    if ([*(id *)(a1 + 48) junkLevel] == 1)
    {
      id v147 = objc_alloc(MEMORY[0x1E4F60EF8]);
      v148 = +[EDMessagePersistence messagesTableName];
      v149 = (void *)[v147 initWithResult:&unk_1F35BB270 table:v148];

      v150 = [v28 matchesMask:&unk_1F35BB2E8];
      id v151 = objc_alloc(MEMORY[0x1E4F60E48]);
      v188[0] = v183;
      v188[1] = v150;
      v152 = [MEMORY[0x1E4F1C978] arrayWithObjects:v188 count:2];
      v153 = (void *)[v151 initWithExpressions:v152];
      [v149 setWhere:v153];

      [v149 setLimit:1];
      v154 = [MEMORY[0x1E4F60EA8] ifNull:v149 second:&unk_1F35BB258];
      [v3 setObject:v154 forKeyedSubscript:@"junk_level"];

      v155 = [v146 equalTo:&unk_1F35BB270];
      [v4 addObject:v155];
    }
    else
    {
      [v3 setObject:&unk_1F35BB270 forKeyedSubscript:@"junk_level"];
      v149 = [v146 notEqualTo:&unk_1F35BB270];
      [v4 addObject:v149];
    }
  }
  if ([*(id *)(a1 + 48) flaggedChanged])
  {
    v156 = [MEMORY[0x1E4F60E78] column:@"has_unflagged"];
    if ([*(id *)(a1 + 48) flagged])
    {
      id v157 = objc_alloc(MEMORY[0x1E4F60EF8]);
      v158 = +[EDMessagePersistence messagesTableName];
      v159 = (void *)[v157 initWithResult:&unk_1F35BB1B0 table:v158];

      v160 = [MEMORY[0x1E4F60E78] column:@"flagged"];
      v161 = [v160 equalTo:&unk_1F35BB198];

      id v162 = objc_alloc(MEMORY[0x1E4F60E48]);
      v187[0] = v183;
      v187[1] = v161;
      v163 = [MEMORY[0x1E4F1C978] arrayWithObjects:v187 count:2];
      v164 = (void *)[v162 initWithExpressions:v163];
      [v159 setWhere:v164];

      [v159 setLimit:1];
      v165 = [MEMORY[0x1E4F60EA8] ifNull:v159 second:&unk_1F35BB198];
      [v3 setObject:v165 forKeyedSubscript:@"has_unflagged"];

      v166 = [v156 notEqualTo:&unk_1F35BB198];
      [v4 addObject:v166];
    }
    else
    {
      [v3 setObject:&unk_1F35BB1B0 forKeyedSubscript:@"has_unflagged"];
      v159 = [v156 equalTo:&unk_1F35BB198];
      [v4 addObject:v159];
    }
  }
  if ([v4 count])
  {
    id v167 = objc_alloc(MEMORY[0x1E4F60E48]);
    v186[0] = *(void *)(a1 + 56);
    v168 = (void *)[objc_alloc(MEMORY[0x1E4F60ED8]) initWithExpressions:v4];
    v186[1] = v168;
    v169 = [MEMORY[0x1E4F1C978] arrayWithObjects:v186 count:2];
    v170 = (void *)[v167 initWithExpressions:v169];
    [v3 setWhereClause:v170];

    uint64_t v184 = 0;
    uint64_t v171 = [v182 executeUpdateStatement:v3 rowsChanged:&v184];
    if (v184)
    {
      v172 = *(void **)(a1 + 64);
      uint64_t v173 = *MEMORY[0x1E4F5FE48];
      v185[0] = *MEMORY[0x1E4F5FE50];
      v185[1] = v173;
      v185[2] = *MEMORY[0x1E4F5FE98];
      v174 = [MEMORY[0x1E4F1C978] arrayWithObjects:v185 count:3];
      [v172 addObjectsFromArray:v174];
    }
  }
  else
  {
    uint64_t v171 = 1;
  }
  if ([*(id *)(a1 + 48) readChanged])
  {
    int v175 = [*(id *)(a1 + 48) read];
    v176 = *(void **)(a1 + 32);
    if (v175)
    {
      v177 = [*(id *)(a1 + 72) firstObject];
      int v178 = [v176 _updateNewestReadMessageWithWrappedMessage:v177 threadExpression:*(void *)(a1 + 56)];

      if (!v178)
      {
        v179 = 0;
LABEL_88:
        if ([v179 count]) {
          objc_msgSend(*(id *)(a1 + 64), "ef_addAbsentObjectsFromArrayAccordingToEquals:", v179);
        }

        goto LABEL_91;
      }
    }
    else
    {
      [*(id *)(a1 + 32) _recalculateNewestReadMessageForThreadObjectID:*(void *)(a1 + 40) threadScopeDatabaseID:*(void *)(a1 + 80)];
    }
    v179 = [*(id *)(a1 + 32) _recalculateDisplayMessageForThreadObjectID:*(void *)(a1 + 40) threadScopeDatabaseID:*(void *)(a1 + 80)];
    goto LABEL_88;
  }
LABEL_91:

  return v171;
}

- (void)persistenceIsDeletingMessages:(id)a3 generationWindow:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    uint64_t v11 = [v6 count];
    _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "Persistence is deleting %lu messages", (uint8_t *)&v10, 0xCu);
  }

  id v9 = [(EDThreadPersistence *)self _filteredPersistedMessagesForPersistedMessages:v6];

  [(EDThreadPersistence *)self _persistenceIsDeletingMessages:v9 generationWindow:v7];
}

- (void)_persistenceIsDeletingMessages:(id)a3 generationWindow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(EDThreadPersistence *)self hookRegistry];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__EDThreadPersistence__persistenceIsDeletingMessages_generationWindow___block_invoke;
  v11[3] = &unk_1E6C06DC8;
  void v11[4] = self;
  id v9 = v7;
  id v12 = v9;
  id v13 = v8;
  id v10 = v8;
  [(EDThreadPersistence *)self _iterateWrappedMessagesByConversationForPersistedMessages:v6 block:v11];
}

void __71__EDThreadPersistence__persistenceIsDeletingMessages_generationWindow___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [*(id *)(a1 + 32) _deleteWrappedMessages:v8 fromThreadWithObjectID:v7 threadScopeDatabaseID:a2 generationWindow:*(void *)(a1 + 40)];
  if ([v9 count])
  {
    id v10 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543618;
      id v12 = v7;
      __int16 v13 = 2114;
      id v14 = v9;
      _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Changing thread (deleted messages): %{public}@\nkey paths: %{public}@", (uint8_t *)&v11, 0x16u);
    }

    [*(id *)(a1 + 48) persistenceIsChangingThreadWithObjectID:v7 changedKeyPaths:v9 generationWindow:*(void *)(a1 + 40)];
  }
}

- (void)persistenceDidDeleteMessages:(id)a3 generationWindow:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    uint64_t v9 = [v5 count];
    _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_DEFAULT, "Persistence did delete %lu messages", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(EDThreadPersistence *)self hookRegistry];
  [v7 persistenceDidFinishThreadUpdates];
}

- (id)_deleteWrappedMessages:(id)a3 fromThreadWithObjectID:(id)a4 threadScopeDatabaseID:(int64_t)a5 generationWindow:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = [(EDThreadPersistence *)self _updateThreadForDeleteWithObjectID:v11 threadScopeDatabaseID:a5 generationWindow:a6];
  if (v12)
  {
    int64_t v13 = [(EDThreadPersistence *)self _databaseIDForThreadObjectID:v11];
    id v14 = v12;
    if (v13 != *MEMORY[0x1E4F5FCC8])
    {
      uint64_t v15 = objc_msgSend(NSNumber, "numberWithLongLong:");
      id v16 = [(EDThreadPersistence *)self _messageThreadExpressionForThreadObjectID:v11];
      if ([(EDThreadPersistence *)self _deleteMailboxesFromWrappedMessages:v10 fromThreadWithDatabaseID:v15 messageThreadExpression:v16])
      {
        [v12 addObject:*MEMORY[0x1E4F5FED8]];
      }

      id v14 = v12;
    }
  }
  else
  {
    id v14 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v17 = v14;

  return v17;
}

- (id)_updateThreadForDeleteWithObjectID:(id)a3 threadScopeDatabaseID:(int64_t)a4 generationWindow:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__42;
  id v30 = __Block_byref_object_dispose__42;
  id v31 = 0;
  uint64_t v10 = [v8 conversationID];
  id v11 = [(EDThreadPersistence *)self _messageThreadExpressionForThreadObjectID:v8];
  id v12 = [(EDThreadPersistence *)self database];
  int64_t v13 = [NSString stringWithUTF8String:"-[EDThreadPersistence _updateThreadForDeleteWithObjectID:threadScopeDatabaseID:generationWindow:]"];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __97__EDThreadPersistence__updateThreadForDeleteWithObjectID_threadScopeDatabaseID_generationWindow___block_invoke;
  void v19[3] = &unk_1E6C06DF0;
  v19[4] = self;
  id v14 = v8;
  id v20 = v14;
  id v15 = v9;
  id v21 = v15;
  id v16 = v11;
  id v22 = v16;
  uint64_t v23 = &v26;
  int64_t v24 = a4;
  uint64_t v25 = v10;
  objc_msgSend(v12, "__performWriteWithCaller:usingBlock:", v13, v19);

  id v17 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v17;
}

uint64_t __97__EDThreadPersistence__updateThreadForDeleteWithObjectID_threadScopeDatabaseID_generationWindow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _databaseIDForThreadObjectID:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 48), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  if (v4 == *MEMORY[0x1E4F5FCC8])
  {
    id v5 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "No thread database ID: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v7 = 1;
  }
  else
  {
    id v5 = [NSNumber numberWithLongLong:v4];
    id v8 = objc_alloc(MEMORY[0x1E4F60EF8]);
    id v9 = +[EDMessagePersistence messagesTableName];
    uint64_t v10 = (void *)[v8 initWithResult:&unk_1F35BB1B0 table:v9];

    [v10 setWhere:*(void *)(a1 + 56)];
    [v10 setLimit:1];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __97__EDThreadPersistence__updateThreadForDeleteWithObjectID_threadScopeDatabaseID_generationWindow___block_invoke_405;
    v21[3] = &unk_1E6BFF4C8;
    void v21[4] = &buf;
    if ([v3 executeSelectStatement:v10 withBlock:v21 error:0])
    {
      id v11 = *(void **)(a1 + 32);
      if (*(unsigned char *)(*((void *)&buf + 1) + 24))
      {
        uint64_t v12 = [v11 _updateBasicPropertiesAfterDeleteForThreadObjectID:*(void *)(a1 + 40) threadScopeDatabaseID:*(void *)(a1 + 72)];
        uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
        id v14 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = v12;

        [*(id *)(a1 + 32) _recalculateNewestReadMessageForThreadObjectID:*(void *)(a1 + 40) threadScopeDatabaseID:*(void *)(a1 + 72)];
        id v15 = [*(id *)(a1 + 32) _recalculateDisplayMessageForThreadObjectID:*(void *)(a1 + 40) threadScopeDatabaseID:*(void *)(a1 + 72)];
        if ([v15 count]) {
          objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "ef_addAbsentObjectsFromArrayAccordingToEquals:", v15);
        }
        if ([*(id *)(a1 + 32) _recalculateNewestMessageForThreadObjectID:*(void *)(a1 + 40) threadScopeDatabaseID:*(void *)(a1 + 72)])objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "addObject:", *MEMORY[0x1E4F5FE70]); {
        if ([*(id *)(a1 + 32) _deleteSendersFromThreadWithDatabaseID:v5 messageThreadExpression:*(void *)(a1 + 56)])objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "addObject:", *MEMORY[0x1E4F5FF30]);
        }
        if ([*(id *)(a1 + 32) _deleteRecipientsOfType:1 fromThreadWithDatabaseID:v5 messageThreadExpression:*(void *)(a1 + 56)])objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "addObject:", *MEMORY[0x1E4F5FF60]); {
        if ([*(id *)(a1 + 32) _deleteRecipientsOfType:2 fromThreadWithDatabaseID:v5 messageThreadExpression:*(void *)(a1 + 56)])objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "addObject:", *MEMORY[0x1E4F5FDF0]);
        }
        uint64_t v7 = 1;
      }
      else
      {
        id v15 = [v11 _threadExpressionForThreadScopeDatabaseID:*(void *)(a1 + 72) conversation:*(void *)(a1 + 80)];
        id v16 = (void *)[objc_alloc(MEMORY[0x1E4F60E98]) initWithTable:@"threads" where:v15];
        uint64_t v7 = [v3 executeDeleteStatement:v16 error:0];
        id v17 = +[EDThreadPersistence log];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = *(void *)(a1 + 40);
          *(_DWORD *)id v22 = 138543362;
          uint64_t v23 = v18;
          _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_DEFAULT, "Deleting thread: %{public}@", v22, 0xCu);
        }

        id v19 = [*(id *)(a1 + 32) hookRegistry];
        [v19 persistenceIsDeletingThreadWithObjectID:*(void *)(a1 + 40) generationWindow:*(void *)(a1 + 48)];
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    _Block_object_dispose(&buf, 8);
  }
  return v7;
}

uint64_t __97__EDThreadPersistence__updateThreadForDeleteWithObjectID_threadScopeDatabaseID_generationWindow___block_invoke_405(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (id)_updateBasicPropertiesAfterDeleteForThreadObjectID:(id)a3 threadScopeDatabaseID:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 conversationID];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = [(EDThreadPersistence *)self database];
  uint64_t v10 = [NSString stringWithUTF8String:"-[EDThreadPersistence _updateBasicPropertiesAfterDeleteForThreadObjectID:threadScopeDatabaseID:]"];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __96__EDThreadPersistence__updateBasicPropertiesAfterDeleteForThreadObjectID_threadScopeDatabaseID___block_invoke;
  void v16[3] = &unk_1E6C06E40;
  void v16[4] = self;
  id v11 = v6;
  id v17 = v11;
  int64_t v19 = a4;
  uint64_t v20 = v7;
  id v12 = v8;
  id v18 = v12;
  objc_msgSend(v9, "__performWriteWithCaller:usingBlock:", v10, v16);

  uint64_t v13 = v18;
  id v14 = v12;

  return v14;
}

uint64_t __96__EDThreadPersistence__updateBasicPropertiesAfterDeleteForThreadObjectID_threadScopeDatabaseID___block_invoke(uint64_t a1, void *a2)
{
  v179[2] = *MEMORY[0x1E4F143B8];
  id v131 = a2;
  id v3 = [*(id *)(a1 + 32) _messageThreadExpressionForThreadObjectID:*(void *)(a1 + 40)];
  uint64_t v164 = 0;
  v165 = &v164;
  uint64_t v166 = 0x3032000000;
  id v167 = __Block_byref_object_copy__42;
  v168 = __Block_byref_object_dispose__42;
  id v169 = 0;
  uint64_t v158 = 0;
  v159 = &v158;
  uint64_t v160 = 0x3032000000;
  v161 = __Block_byref_object_copy__42;
  id v162 = __Block_byref_object_dispose__42;
  id v163 = 0;
  uint64_t v152 = 0;
  v153 = &v152;
  uint64_t v154 = 0x3032000000;
  v155 = __Block_byref_object_copy__42;
  v156 = __Block_byref_object_dispose__42;
  id v157 = 0;
  uint64_t v146 = 0;
  id v147 = &v146;
  uint64_t v148 = 0x3032000000;
  v149 = __Block_byref_object_copy__42;
  v150 = __Block_byref_object_dispose__42;
  id v151 = 0;
  uint64_t v140 = 0;
  id v141 = &v140;
  uint64_t v142 = 0x3032000000;
  v143 = __Block_byref_object_copy__42;
  v144 = __Block_byref_object_dispose__42;
  id v145 = 0;
  uint64_t v134 = 0;
  v135 = &v134;
  uint64_t v136 = 0x3032000000;
  id v137 = __Block_byref_object_copy__42;
  v138 = __Block_byref_object_dispose__42;
  id v139 = 0;
  id v4 = objc_alloc(MEMORY[0x1E4F60EF8]);
  id v5 = +[EDMessagePersistence messagesTableName];
  id v130 = (void *)[v4 initWithResultColumn:@"flags" table:v5];

  [v130 setWhere:v3];
  v133[0] = MEMORY[0x1E4F143A8];
  v133[1] = 3221225472;
  v133[2] = __96__EDThreadPersistence__updateBasicPropertiesAfterDeleteForThreadObjectID_threadScopeDatabaseID___block_invoke_2;
  v133[3] = &unk_1E6C06E18;
  v133[4] = &v164;
  v133[5] = &v158;
  v133[6] = &v152;
  v133[7] = &v146;
  v133[8] = &v140;
  v133[9] = &v134;
  if ([v131 executeSelectStatement:v130 withBlock:v133 error:0])
  {
    id v6 = [*(id *)(a1 + 32) _updateForThreadsWithThreadScopeDatabaseID:*(void *)(a1 + 56) conversation:*(void *)(a1 + 64)];
    uint64_t v7 = (void *)MEMORY[0x1E4F60E40];
    id v8 = (void *)MEMORY[0x1E4F60E78];
    id v9 = +[EDMessagePersistence messagesDateReceivedColumnName];
    uint64_t v10 = [v8 column:v9];
    v128 = [v7 max:v10];

    id v11 = objc_alloc(MEMORY[0x1E4F60EF8]);
    id v12 = +[EDMessagePersistence messagesTableName];
    v127 = (void *)[v11 initWithResult:v128 table:v12];

    [v127 setWhere:v3];
    [v6 setObject:v127 forKeyedSubscript:@"date"];
    uint64_t v13 = (void *)MEMORY[0x1E4F60E40];
    id v14 = (void *)MEMORY[0x1E4F60E78];
    id v15 = +[EDMessagePersistence messagesDisplayDateColumnName];
    id v16 = [v14 column:v15];
    v124 = [v13 max:v16];

    id v17 = objc_alloc(MEMORY[0x1E4F60EF8]);
    id v18 = +[EDMessagePersistence messagesTableName];
    v125 = (void *)[v17 initWithResult:v124 table:v18];

    [v125 setWhere:v3];
    [v6 setObject:v125 forKeyedSubscript:@"display_date"];
    int64_t v19 = (void *)MEMORY[0x1E4F60E40];
    uint64_t v20 = [MEMORY[0x1E4F60E78] table:@"message_global_data" column:@"read_later_date"];
    id v126 = [v19 min:v20];

    v129 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResult:v126 table:@"message_global_data"];
    id v21 = +[EDMessagePersistence messagesTableName];
    id v22 = (id)[v129 join:v21 sourceColumn:*MEMORY[0x1E4F60D08] targetColumn:@"global_message_id"];

    [v129 setWhere:v3];
    [v6 setObject:v129 forKeyedSubscript:@"read_later_date"];
    id v23 = objc_alloc(MEMORY[0x1E4F60EF8]);
    int64_t v24 = +[EDMessagePersistence messagesTableName];
    uint64_t v25 = (void *)[v23 initWithResult:MEMORY[0x1E4F1CC28] table:v24];

    id v26 = objc_alloc(MEMORY[0x1E4F60E48]);
    v179[0] = v3;
    uint64_t v27 = [MEMORY[0x1E4F60E78] column:@"read"];
    uint64_t v28 = [v27 equalTo:&unk_1F35BB198];
    v179[1] = v28;
    id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v179 count:2];
    id v30 = (void *)[v26 initWithExpressions:v29];
    [v25 setWhere:v30];

    [v25 setLimit:1];
    id v31 = [MEMORY[0x1E4F60EA8] ifNull:v25 second:&unk_1F35BB1B0];
    [v6 setObject:v31 forKeyedSubscript:@"read"];

    id v32 = objc_alloc(MEMORY[0x1E4F60EF8]);
    id v33 = +[EDMessagePersistence messagesTableName];
    uint64_t v34 = (void *)[v32 initWithResult:MEMORY[0x1E4F1CC38] table:v33];

    id v35 = objc_alloc(MEMORY[0x1E4F60E48]);
    v178[0] = v3;
    uint64_t v36 = [MEMORY[0x1E4F60E78] column:@"flagged"];
    uint64_t v37 = [v36 equalTo:&unk_1F35BB1B0];
    v178[1] = v37;
    id v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v178 count:2];
    id v39 = (void *)[v35 initWithExpressions:v38];
    [v34 setWhere:v39];

    [v34 setLimit:1];
    id v40 = [MEMORY[0x1E4F60EA8] ifNull:v34 second:&unk_1F35BB198];
    [v6 setObject:v40 forKeyedSubscript:@"flagged"];

    id v41 = objc_alloc(MEMORY[0x1E4F60EF8]);
    id v42 = +[EDMessagePersistence messagesTableName];
    id v43 = (void *)[v41 initWithResult:MEMORY[0x1E4F1CC38] table:v42];

    id v44 = objc_alloc(MEMORY[0x1E4F60E48]);
    v177[0] = v3;
    long long v45 = [MEMORY[0x1E4F60E78] column:@"flag_color"];
    long long v46 = [v45 equalTo:&unk_1F35BB240];
    v177[1] = v46;
    long long v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v177 count:2];
    long long v48 = (void *)[v44 initWithExpressions:v47];
    [v43 setWhere:v48];

    [v43 setLimit:1];
    int v49 = [MEMORY[0x1E4F60EA8] ifNull:v43 second:&unk_1F35BB198];
    [v6 setObject:v49 forKeyedSubscript:@"has_red_flag"];

    id v50 = objc_alloc(MEMORY[0x1E4F60EF8]);
    id v51 = +[EDMessagePersistence messagesTableName];
    uint64_t v52 = (void *)[v50 initWithResult:MEMORY[0x1E4F1CC38] table:v51];

    id v53 = objc_alloc(MEMORY[0x1E4F60E48]);
    v176[0] = v3;
    int v54 = [MEMORY[0x1E4F60E78] column:@"flag_color"];
    id v55 = [v54 equalTo:&unk_1F35BB258];
    v176[1] = v55;
    int v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v176 count:2];
    id v57 = (void *)[v53 initWithExpressions:v56];
    [v52 setWhere:v57];

    [v52 setLimit:1];
    id v58 = [MEMORY[0x1E4F60EA8] ifNull:v52 second:&unk_1F35BB198];
    [v6 setObject:v58 forKeyedSubscript:@"has_orange_flag"];

    id v59 = objc_alloc(MEMORY[0x1E4F60EF8]);
    id v60 = +[EDMessagePersistence messagesTableName];
    id v61 = (void *)[v59 initWithResult:MEMORY[0x1E4F1CC38] table:v60];

    id v62 = objc_alloc(MEMORY[0x1E4F60E48]);
    v175[0] = v3;
    id v63 = [MEMORY[0x1E4F60E78] column:@"flag_color"];
    uint64_t v64 = [v63 equalTo:&unk_1F35BB270];
    v175[1] = v64;
    char v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:v175 count:2];
    char v66 = (void *)[v62 initWithExpressions:v65];
    [v61 setWhere:v66];

    [v61 setLimit:1];
    id v67 = [MEMORY[0x1E4F60EA8] ifNull:v61 second:&unk_1F35BB198];
    [v6 setObject:v67 forKeyedSubscript:@"has_yellow_flag"];

    id v68 = objc_alloc(MEMORY[0x1E4F60EF8]);
    id v69 = +[EDMessagePersistence messagesTableName];
    id v70 = (void *)[v68 initWithResult:MEMORY[0x1E4F1CC38] table:v69];

    id v71 = objc_alloc(MEMORY[0x1E4F60E48]);
    v174[0] = v3;
    char v72 = [MEMORY[0x1E4F60E78] column:@"flag_color"];
    char v73 = [v72 equalTo:&unk_1F35BB288];
    v174[1] = v73;
    char v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:v174 count:2];
    id v75 = (void *)[v71 initWithExpressions:v74];
    [v70 setWhere:v75];

    [v70 setLimit:1];
    char v76 = [MEMORY[0x1E4F60EA8] ifNull:v70 second:&unk_1F35BB198];
    [v6 setObject:v76 forKeyedSubscript:@"has_green_flag"];

    id v77 = objc_alloc(MEMORY[0x1E4F60EF8]);
    uint64_t v78 = +[EDMessagePersistence messagesTableName];
    __int16 v79 = (void *)[v77 initWithResult:MEMORY[0x1E4F1CC38] table:v78];

    id v80 = objc_alloc(MEMORY[0x1E4F60E48]);
    v173[0] = v3;
    uint64_t v81 = [MEMORY[0x1E4F60E78] column:@"flag_color"];
    id v82 = [v81 equalTo:&unk_1F35BB2A0];
    v173[1] = v82;
    v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:v173 count:2];
    v84 = (void *)[v80 initWithExpressions:v83];
    [v79 setWhere:v84];

    [v79 setLimit:1];
    v85 = [MEMORY[0x1E4F60EA8] ifNull:v79 second:&unk_1F35BB198];
    [v6 setObject:v85 forKeyedSubscript:@"has_blue_flag"];

    id v86 = objc_alloc(MEMORY[0x1E4F60EF8]);
    v87 = +[EDMessagePersistence messagesTableName];
    v88 = (void *)[v86 initWithResult:MEMORY[0x1E4F1CC38] table:v87];

    id v89 = objc_alloc(MEMORY[0x1E4F60E48]);
    v172[0] = v3;
    v90 = [MEMORY[0x1E4F60E78] column:@"flag_color"];
    v91 = [v90 equalTo:&unk_1F35BB2B8];
    v172[1] = v91;
    v92 = [MEMORY[0x1E4F1C978] arrayWithObjects:v172 count:2];
    id v93 = (void *)[v89 initWithExpressions:v92];
    [v88 setWhere:v93];

    [v88 setLimit:1];
    v94 = [MEMORY[0x1E4F60EA8] ifNull:v88 second:&unk_1F35BB198];
    [v6 setObject:v94 forKeyedSubscript:@"has_purple_flag"];

    id v95 = objc_alloc(MEMORY[0x1E4F60EF8]);
    v96 = +[EDMessagePersistence messagesTableName];
    id v97 = (void *)[v95 initWithResult:MEMORY[0x1E4F1CC38] table:v96];

    id v98 = objc_alloc(MEMORY[0x1E4F60E48]);
    v171[0] = v3;
    v99 = [MEMORY[0x1E4F60E78] column:@"flag_color"];
    v100 = [v99 equalTo:&unk_1F35BB2D0];
    v171[1] = v100;
    v101 = [MEMORY[0x1E4F1C978] arrayWithObjects:v171 count:2];
    v102 = (void *)[v98 initWithExpressions:v101];
    [v97 setWhere:v102];

    [v97 setLimit:1];
    v103 = [MEMORY[0x1E4F60EA8] ifNull:v97 second:&unk_1F35BB198];
    [v6 setObject:v103 forKeyedSubscript:@"has_gray_flag"];

    id v104 = objc_alloc(MEMORY[0x1E4F60EF8]);
    v105 = +[EDMessagePersistence messagesTableName];
    v106 = (void *)[v104 initWithResult:MEMORY[0x1E4F1CC38] table:v105];

    id v107 = objc_alloc(MEMORY[0x1E4F60E48]);
    v170[0] = v3;
    id v108 = [MEMORY[0x1E4F60E78] column:@"flagged"];
    v109 = [v108 equalTo:&unk_1F35BB198];
    v170[1] = v109;
    v110 = [MEMORY[0x1E4F1C978] arrayWithObjects:v170 count:2];
    v111 = (void *)[v107 initWithExpressions:v110];
    [v106 setWhere:v111];

    [v106 setLimit:1];
    v112 = [MEMORY[0x1E4F60EA8] ifNull:v106 second:&unk_1F35BB198];
    [v6 setObject:v112 forKeyedSubscript:@"has_unflagged"];

    uint64_t v113 = MEMORY[0x1E4F1CC28];
    if (v165[5]) {
      uint64_t v114 = v165[5];
    }
    else {
      uint64_t v114 = MEMORY[0x1E4F1CC28];
    }
    [v6 setObject:v114 forKeyedSubscript:@"draft"];
    if (v159[5]) {
      uint64_t v115 = v159[5];
    }
    else {
      uint64_t v115 = v113;
    }
    [v6 setObject:v115 forKeyedSubscript:@"replied"];
    if (v153[5]) {
      uint64_t v116 = v153[5];
    }
    else {
      uint64_t v116 = v113;
    }
    [v6 setObject:v116 forKeyedSubscript:@"forwarded"];
    if (v147[5]) {
      uint64_t v117 = v147[5];
    }
    else {
      uint64_t v117 = v113;
    }
    [v6 setObject:v117 forKeyedSubscript:@"redirected"];
    if (v141[5]) {
      uint64_t v118 = v141[5];
    }
    else {
      uint64_t v118 = v113;
    }
    [v6 setObject:v118 forKeyedSubscript:@"has_attachments"];
    if (v135[5]) {
      id v119 = (void *)v135[5];
    }
    else {
      id v119 = &unk_1F35BB258;
    }
    [v6 setObject:v119 forKeyedSubscript:@"junk_level"];
    v120 = [*(id *)(a1 + 32) _messageThreadExpressionForThreadObjectID:*(void *)(a1 + 40)];
    v121 = [*(id *)(a1 + 32) _countMessagesForExpression:v120];
    [v6 setObject:v121 forKeyedSubscript:@"count"];

    uint64_t v132 = 0;
    uint64_t v122 = [v131 executeUpdateStatement:v6 rowsChanged:&v132];
    if (v132) {
      [*(id *)(a1 + 32) _addKeyPathsForBasicPropertiesChangeToKeyPaths:*(void *)(a1 + 48)];
    }
  }
  else
  {
    uint64_t v122 = 0;
  }

  _Block_object_dispose(&v134, 8);
  _Block_object_dispose(&v140, 8);

  _Block_object_dispose(&v146, 8);
  _Block_object_dispose(&v152, 8);

  _Block_object_dispose(&v158, 8);
  _Block_object_dispose(&v164, 8);

  return v122;
}

void __96__EDThreadPersistence__updateBasicPropertiesAfterDeleteForThreadObjectID_threadScopeDatabaseID___block_invoke_2(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 objectAtIndexedSubscript:0];
  unint64_t v7 = [v6 integerValue];

  uint64_t v8 = MEMORY[0x1E4F1CC38];
  if ((v7 & 0x40) != 0)
  {
    uint64_t v15 = *(void *)(a1[4] + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = MEMORY[0x1E4F1CC38];

    if ((v7 & 4) == 0)
    {
LABEL_3:
      if ((v7 & 0x100) == 0) {
        goto LABEL_4;
      }
LABEL_21:
      uint64_t v19 = *(void *)(a1[6] + 8);
      uint64_t v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v8;

      if ((v7 & 0x200) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((v7 & 4) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v17 = *(void *)(a1[5] + 8);
  id v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v8;

  if ((v7 & 0x100) != 0) {
    goto LABEL_21;
  }
LABEL_4:
  if ((v7 & 0x200) != 0)
  {
LABEL_5:
    uint64_t v9 = *(void *)(a1[7] + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
LABEL_6:
  if ((v7 & 0xFC00) != 0 && (v7 & 0xFC00) != 0xFC00)
  {
    uint64_t v11 = *(void *)(a1[8] + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v8;
  }
  if (v7 >> 31)
  {
    uint64_t v13 = *(void *)(a1[9] + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = &unk_1F35BB270;
  }
  if (*(void *)(*(void *)(a1[4] + 8) + 40)
    && *(void *)(*(void *)(a1[5] + 8) + 40)
    && *(void *)(*(void *)(a1[6] + 8) + 40)
    && *(void *)(*(void *)(a1[7] + 8) + 40)
    && *(void *)(*(void *)(a1[8] + 8) + 40))
  {
    if (*(void *)(*(void *)(a1[9] + 8) + 40)) {
      *a4 = 1;
    }
  }
}

- (BOOL)_deleteMailboxesFromWrappedMessages:(id)a3 fromThreadWithDatabaseID:(id)a4 messageThreadExpression:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v23 = 0;
  int64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  uint64_t v11 = [(EDThreadPersistence *)self database];
  id v12 = [NSString stringWithUTF8String:"-[EDThreadPersistence _deleteMailboxesFromWrappedMessages:fromThreadWithDatabaseID:messageThreadExpression:]"];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __108__EDThreadPersistence__deleteMailboxesFromWrappedMessages_fromThreadWithDatabaseID_messageThreadExpression___block_invoke;
  v17[3] = &unk_1E6C06E68;
  id v13 = v10;
  id v18 = v13;
  id v14 = v9;
  id v19 = v14;
  uint64_t v20 = self;
  id v15 = v8;
  id v21 = v15;
  id v22 = &v23;
  objc_msgSend(v11, "__performWriteWithCaller:usingBlock:", v12, v17);

  LOBYTE(v8) = v24[3] != 0;
  _Block_object_dispose(&v23, 8);

  return (char)v8;
}

uint64_t __108__EDThreadPersistence__deleteMailboxesFromWrappedMessages_fromThreadWithDatabaseID_messageThreadExpression___block_invoke(uint64_t a1, void *a2)
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v19 = a2;
  id v3 = objc_alloc(MEMORY[0x1E4F60EF8]);
  id v4 = +[EDMessagePersistence messagesTableName];
  id v5 = (void *)[v3 initWithResultColumn:@"mailbox" table:v4];

  [v5 setDistinct:1];
  [v5 setWhere:*(void *)(a1 + 32)];
  id v6 = objc_alloc(MEMORY[0x1E4F60E48]);
  id v18 = [MEMORY[0x1E4F60E78] column:@"thread"];
  unint64_t v7 = [v18 equalTo:*(void *)(a1 + 40)];
  v20[0] = v7;
  id v8 = [MEMORY[0x1E4F60E78] column:@"mailbox"];
  id v9 = [*(id *)(a1 + 48) _mailboxDatabaseIDsForWrappedMessages:*(void *)(a1 + 56)];
  id v10 = [v8 in:v9];
  v20[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F60E78] column:@"mailbox"];
  id v12 = [v11 notIn:v5];
  v20[2] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  id v14 = (void *)[v6 initWithExpressions:v13];

  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F60E98]) initWithTable:@"thread_mailboxes" where:v14];
  uint64_t v16 = [v19 executeDeleteStatement:v15 rowsChanged:*(void *)(*(void *)(a1 + 64) + 8) + 24];

  return v16;
}

- (BOOL)_deleteSendersFromThreadWithDatabaseID:(id)a3 messageThreadExpression:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  id v8 = [(EDThreadPersistence *)self database];
  id v9 = [NSString stringWithUTF8String:"-[EDThreadPersistence _deleteSendersFromThreadWithDatabaseID:messageThreadExpression:]"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __86__EDThreadPersistence__deleteSendersFromThreadWithDatabaseID_messageThreadExpression___block_invoke;
  void v13[3] = &unk_1E6C01950;
  v13[4] = self;
  id v10 = v7;
  id v14 = v10;
  id v11 = v6;
  id v15 = v11;
  uint64_t v16 = &v17;
  objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v9, v13);

  LOBYTE(v6) = v18[3] != 0;
  _Block_object_dispose(&v17, 8);

  return (char)v6;
}

uint64_t __86__EDThreadPersistence__deleteSendersFromThreadWithDatabaseID_messageThreadExpression___block_invoke(uint64_t a1, void *a2)
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _senderAddressesExpressionForMessages:*(void *)(a1 + 40)];
  id v5 = objc_alloc(MEMORY[0x1E4F60E48]);
  id v6 = [MEMORY[0x1E4F60E78] column:@"thread"];
  id v7 = [v6 equalTo:*(void *)(a1 + 48)];
  v15[0] = v7;
  id v8 = [MEMORY[0x1E4F60E78] column:@"address"];
  id v9 = [v8 notIn:v4];
  v15[1] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  id v11 = (void *)[v5 initWithExpressions:v10];

  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F60E98]) initWithTable:@"thread_senders" where:v11];
  uint64_t v13 = [v3 executeDeleteStatement:v12 rowsChanged:*(void *)(*(void *)(a1 + 56) + 8) + 24];

  return v13;
}

- (BOOL)_deleteRecipientsOfType:(unint64_t)a3 fromThreadWithDatabaseID:(id)a4 messageThreadExpression:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  id v10 = [(EDThreadPersistence *)self database];
  id v11 = [NSString stringWithUTF8String:"-[EDThreadPersistence _deleteRecipientsOfType:fromThreadWithDatabaseID:messageThreadExpression:]"];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __96__EDThreadPersistence__deleteRecipientsOfType_fromThreadWithDatabaseID_messageThreadExpression___block_invoke;
  void v15[3] = &unk_1E6C00210;
  v15[4] = self;
  unint64_t v19 = a3;
  id v12 = v9;
  id v16 = v12;
  id v13 = v8;
  id v17 = v13;
  id v18 = &v20;
  objc_msgSend(v10, "__performWriteWithCaller:usingBlock:", v11, v15);

  LOBYTE(v8) = v21[3] != 0;
  _Block_object_dispose(&v20, 8);

  return (char)v8;
}

uint64_t __96__EDThreadPersistence__deleteRecipientsOfType_fromThreadWithDatabaseID_messageThreadExpression___block_invoke(uint64_t a1, void *a2)
{
  v18[3] = *MEMORY[0x1E4F143B8];
  id v16 = a2;
  id v17 = [*(id *)(a1 + 32) _recipientAddressesExpressionForRecipientType:*(void *)(a1 + 64) messages:*(void *)(a1 + 40)];
  id v3 = objc_alloc(MEMORY[0x1E4F60E48]);
  id v4 = [MEMORY[0x1E4F60E78] column:@"thread"];
  id v5 = [v4 equalTo:*(void *)(a1 + 48)];
  v18[0] = v5;
  id v6 = [MEMORY[0x1E4F60E78] column:@"type"];
  id v7 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
  id v8 = [v6 equalTo:v7];
  v18[1] = v8;
  id v9 = [MEMORY[0x1E4F60E78] column:@"address"];
  id v10 = [v9 notIn:v17];
  v18[2] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
  id v12 = (void *)[v3 initWithExpressions:v11];

  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F60E98]) initWithTable:@"thread_recipients" where:v12];
  uint64_t v14 = [v16 executeDeleteStatement:v13 rowsChanged:*(void *)(*(void *)(a1 + 56) + 8) + 24];

  return v14;
}

- (void)persistenceIsDeletingAllMessagesInMailboxWithURL:(id)a3 generationWindow:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F60E00], "ec_redactedStringForMailboxURL:", v5);
    *(_DWORD *)long long buf = 138543362;
    id v18 = v7;
    _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_DEFAULT, "Persistence is deleting all messages in mailbox %{public}@", buf, 0xCu);
  }
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F60310]) initWithURL:v5];
  id v9 = [(EDThreadPersistence *)self messagePersistence];
  id v10 = [v9 mailboxPersistence];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __89__EDThreadPersistence_persistenceIsDeletingAllMessagesInMailboxWithURL_generationWindow___block_invoke;
  void v13[3] = &unk_1E6C06E90;
  id v11 = v8;
  id v14 = v11;
  id v15 = v10;
  id v16 = self;
  id v12 = v10;
  [(EDThreadPersistence *)self _enumerateThreadScopesUsingBlock:v13];
}

void __89__EDThreadPersistence_persistenceIsDeletingAllMessagesInMailboxWithURL_generationWindow___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  if ([v8 scopeContainsMailboxObjectID:*(void *)(a1 + 32) mailboxTypeResolver:*(void *)(a1 + 40)])objc_msgSend(*(id *)(a1 + 48), "_resetThreadScope:withDatabaseID:", v7, v9); {
}
  }

- (void)_resetThreadScope:(id)a3 withDatabaseID:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(EDThreadPersistence *)self database];
  id v9 = [NSString stringWithUTF8String:"-[EDThreadPersistence _resetThreadScope:withDatabaseID:]"];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __56__EDThreadPersistence__resetThreadScope_withDatabaseID___block_invoke;
  void v15[3] = &unk_1E6C00AF0;
  id v10 = v7;
  id v16 = v10;
  int v11 = objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v9, v15);

  if (v11)
  {
    id v12 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v18 = v6;
      _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_DEFAULT, "Successfully reset thread scope: %{public}@", buf, 0xCu);
    }

    id v13 = [(EDThreadPersistence *)self threadScopeManager];
    [v13 removeThreadScope:v6];

    id v14 = [(EDThreadPersistence *)self hookRegistry];
    [v14 persistenceDidResetThreadScope:v6];
  }
  else
  {
    id v14 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v18 = v6;
      _os_log_impl(&dword_1DB39C000, v14, OS_LOG_TYPE_DEFAULT, "Failed to reset thread scope: %{public}@", buf, 0xCu);
    }
  }
}

uint64_t __56__EDThreadPersistence__resetThreadScope_withDatabaseID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
  id v5 = [v4 equalTo:*(void *)(a1 + 32)];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F60E98]) initWithTable:@"thread_scopes" where:v5];
  uint64_t v7 = [v3 executeDeleteStatement:v6 error:0];

  return v7;
}

- (void)persistenceDidDeleteAllMessagesInMailboxesWithURLs:(id)a3 generationWindow:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_msgSend(v5, "ef_map:", &__block_literal_global_409);
  uint64_t v7 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v6;
    _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "Persistence did delete all messages in mailbox %{public}@", (uint8_t *)&v9, 0xCu);
  }

  id v8 = [(EDThreadPersistence *)self hookRegistry];
  [v8 persistenceDidFinishThreadUpdates];
}

id __91__EDThreadPersistence_persistenceDidDeleteAllMessagesInMailboxesWithURLs_generationWindow___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = objc_msgSend(MEMORY[0x1E4F60E00], "ec_redactedStringForMailboxURL:", a2);

  return v2;
}

- (void)persistenceIsChangingConversationID:(int64_t)a3 messages:(id)a4 generationWindow:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218240;
    uint64_t v20 = [v8 count];
    __int16 v21 = 2048;
    int64_t v22 = a3;
    _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Persistence is changing conversation ID for %lu messages from %lld", buf, 0x16u);
  }

  uint64_t v11 = [(EDThreadPersistence *)self _filteredPersistedMessagesForPersistedMessages:v8];

  id v12 = [(EDThreadPersistence *)self hookRegistry];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __85__EDThreadPersistence_persistenceIsChangingConversationID_messages_generationWindow___block_invoke;
  void v15[3] = &unk_1E6C06EB8;
  int64_t v18 = a3;
  void v15[4] = self;
  id v13 = v9;
  id v16 = v13;
  id v17 = v12;
  id v14 = v12;
  [(EDThreadPersistence *)self _iterateWrappedMessagesByConversationForPersistedMessages:v11 messageFilter:0 writeBlock:v15];
}

void __85__EDThreadPersistence_persistenceIsChangingConversationID_messages_generationWindow___block_invoke(void *a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F604E0]);
  uint64_t v5 = a1[7];
  id v6 = [v3 threadObjectID];
  uint64_t v7 = [v6 threadScope];
  id v8 = (void *)[v4 initWithConversationID:v5 threadScope:v7];

  id v9 = (void *)a1[4];
  id v10 = [v3 wrappedMessages];
  uint64_t v11 = objc_msgSend(v9, "_deleteWrappedMessages:fromThreadWithObjectID:threadScopeDatabaseID:generationWindow:", v10, v8, objc_msgSend(v3, "threadScopeDatabaseID"), a1[5]);

  id v12 = (void *)a1[4];
  id v13 = [v3 wrappedMessages];
  id v14 = [v3 threadObjectID];
  id v15 = [v12 _threadForWrappedMessages:v13 objectID:v14];

  id v16 = (void *)a1[4];
  id v17 = [v15 objectID];
  uint64_t v18 = [v16 _messagesAreJournaledForThreadWithObjectID:v17];

  if ([v3 addThreadReplacingExisting:0 journaled:v18])
  {
    uint64_t v19 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = &stru_1F3583658;
      if (v18) {
        uint64_t v20 = @"journaled ";
      }
      int v30 = 138412546;
      id v31 = v20;
      __int16 v32 = 2114;
      id v33 = v15;
      _os_log_impl(&dword_1DB39C000, v19, OS_LOG_TYPE_DEFAULT, "Adding %@thread (conversation change): %{public}@", (uint8_t *)&v30, 0x16u);
    }

    __int16 v21 = (void *)a1[6];
    int64_t v22 = [v3 threadObjectID];
    [v21 persistenceIsAddingThreadWithObjectID:v22 journaled:v18 generationWindow:a1[5]];
  }
  else
  {
    uint64_t v23 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v24 = &stru_1F3583658;
      if (v18) {
        int64_t v24 = @"journaled ";
      }
      int v30 = 138412546;
      id v31 = v24;
      __int16 v32 = 2114;
      id v33 = v15;
      _os_log_impl(&dword_1DB39C000, v23, OS_LOG_TYPE_DEFAULT, "Updating %@thread (conversation change): %{public}@", (uint8_t *)&v30, 0x16u);
    }

    int64_t v22 = [v3 updateThreadTableWithJournaled:v18];
    uint64_t v25 = [v11 arrayByAddingObjectsFromArray:v22];

    uint64_t v11 = (void *)v25;
  }

  if ([v11 count])
  {
    uint64_t v26 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = [v3 threadObjectID];
      int v30 = 138543618;
      id v31 = v27;
      __int16 v32 = 2114;
      id v33 = v11;
      _os_log_impl(&dword_1DB39C000, v26, OS_LOG_TYPE_DEFAULT, "Changing thread (conversation change): %{public}@\nkey paths: %{public}@", (uint8_t *)&v30, 0x16u);
    }
    uint64_t v28 = (void *)a1[6];
    id v29 = [v3 threadObjectID];
    [v28 persistenceIsChangingThreadWithObjectID:v29 changedKeyPaths:v11 generationWindow:a1[5]];
  }
}

- (void)persistenceDidChangeGlobalMessageID:(int64_t)a3 orConversationID:(int64_t)a4 message:(id)a5 generationWindow:(id)a6
{
  uint64_t v7 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "Persistence did change global-message-id for message", v9, 2u);
  }

  id v8 = [(EDThreadPersistence *)self hookRegistry];
  [v8 persistenceDidFinishThreadUpdates];
}

- (BOOL)_messagesAreJournaledForThreadWithObjectID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v5 = [(EDThreadPersistence *)self database];
  id v6 = [NSString stringWithUTF8String:"-[EDThreadPersistence _messagesAreJournaledForThreadWithObjectID:]"];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __66__EDThreadPersistence__messagesAreJournaledForThreadWithObjectID___block_invoke;
  v9[3] = &unk_1E6BFF338;
  void v9[4] = self;
  id v7 = v4;
  id v10 = v7;
  uint64_t v11 = &v12;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v9);

  LOBYTE(v4) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v4;
}

uint64_t __66__EDThreadPersistence__messagesAreJournaledForThreadWithObjectID___block_invoke(uint64_t a1, void *a2)
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F60EF8]);
  uint64_t v5 = +[EDMessagePersistence messagesTableName];
  id v6 = (void *)[v4 initWithResult:&unk_1F35BB1B0 table:v5];

  id v7 = [*(id *)(a1 + 32) _messageThreadExpressionForThreadObjectID:*(void *)(a1 + 40)];
  id v8 = [MEMORY[0x1E4F60E78] column:@"journaled"];
  id v9 = [v8 equalTo:&unk_1F35BB1B0];

  id v10 = objc_alloc(MEMORY[0x1E4F60E48]);
  v16[0] = v7;
  v16[1] = v9;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  uint64_t v12 = (void *)[v10 initWithExpressions:v11];
  [v6 setWhere:v12];

  [v6 setLimit:1];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __66__EDThreadPersistence__messagesAreJournaledForThreadWithObjectID___block_invoke_2;
  void v15[3] = &unk_1E6BFF4C8;
  void v15[4] = *(void *)(a1 + 48);
  uint64_t v13 = [v3 executeSelectStatement:v6 withBlock:v15 error:0];

  return v13;
}

uint64_t __66__EDThreadPersistence__messagesAreJournaledForThreadWithObjectID___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (void)persistenceDidChangeReadLaterDate:(id)a3 messages:(id)a4 changeIsRemote:(BOOL)a5 generationWindow:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = NSStringFromSelector(a2);
    *(_DWORD *)long long buf = 138543362;
    int64_t v24 = v14;
    _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  [(EDThreadPersistence *)self _persistenceDidUpdateReadLaterForMessages:v11 generationWindow:v12];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __98__EDThreadPersistence_persistenceDidChangeReadLaterDate_messages_changeIsRemote_generationWindow___block_invoke;
  v20[3] = &unk_1E6C06DC8;
  void v20[4] = self;
  id v15 = v12;
  id v21 = v15;
  id v16 = v10;
  id v22 = v16;
  [(EDThreadPersistence *)self _iterateWrappedMessagesByConversationForPersistedMessages:v11 block:v20];
  id v17 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = objc_msgSend(MEMORY[0x1E4F60E00], "bucketMessageCount:", objc_msgSend(v11, "count"));
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v24) = v18;
    _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_DEFAULT, "Persistence did update read later date for %u messages", buf, 8u);
  }

  uint64_t v19 = [(EDThreadPersistence *)self hookRegistry];
  [v19 persistenceDidFinishThreadUpdates];
}

void __98__EDThreadPersistence_persistenceDidChangeReadLaterDate_messages_changeIsRemote_generationWindow___block_invoke(id *a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_msgSend(a1[4], "_threadExpressionForThreadScopeDatabaseID:conversation:", a2, objc_msgSend(v5, "conversationID"));
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  id v7 = [a1[4] database];
  id v8 = [NSString stringWithUTF8String:"-[EDThreadPersistence persistenceDidChangeReadLaterDate:messages:changeIsRemote:generationWindow:]_block_invoke"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __98__EDThreadPersistence_persistenceDidChangeReadLaterDate_messages_changeIsRemote_generationWindow___block_invoke_2;
  void v13[3] = &unk_1E6C01950;
  id v14 = a1[5];
  id v15 = a1[6];
  id v9 = v6;
  id v16 = v9;
  id v17 = &v18;
  objc_msgSend(v7, "__performWriteWithCaller:usingBlock:", v8, v13);

  if (v19[3])
  {
    id v10 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v24 = v5;
      _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Changing thread (readLaterDate change): %{public}@", buf, 0xCu);
    }

    id v11 = [a1[4] hookRegistry];
    uint64_t v22 = *MEMORY[0x1E4F5FEF8];
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
    [v11 persistenceIsChangingThreadWithObjectID:v5 changedKeyPaths:v12 generationWindow:a1[5]];
  }
  _Block_object_dispose(&v18, 8);
}

uint64_t __98__EDThreadPersistence_persistenceDidChangeReadLaterDate_messages_changeIsRemote_generationWindow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"threads"];
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  id v5 = *(void **)(a1 + 40);
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  [v4 setObject:v6 forKeyedSubscript:@"read_later_date"];
  if (!v5) {

  }
  [v4 setWhereClause:*(void *)(a1 + 48)];
  uint64_t v7 = [v3 executeUpdateStatement:v4 rowsChanged:*(void *)(*(void *)(a1 + 56) + 8) + 24];

  return v7;
}

- (void)_persistenceDidUpdateReadLaterForMessages:(id)a3 generationWindow:(id)a4
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x1E4F5FF00];
  v11[0] = *MEMORY[0x1E4F5FEF8];
  v11[1] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  id v10 = [MEMORY[0x1E4F60390] predicateForFiredReadLaterMessages];
  [(EDThreadPersistence *)self _persistenceDidUpdateMessages:v6 forFilterPredicate:2 changedKeyPaths:v9 predicateToIgnore:v10 loggingString:@"read later" generationWindow:v7 messageTest:&__block_literal_global_415];
}

uint64_t __82__EDThreadPersistence__persistenceDidUpdateReadLaterForMessages_generationWindow___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 readLater];
  uint64_t v3 = [v2 isActive];

  return v3;
}

- (void)persistenceDidUpdateFollowUpForMessages:(id)a3 generationWindow:(id)a4
{
  void v11[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x1E4F5FE58];
  v11[0] = *MEMORY[0x1E4F5FE68];
  v11[1] = v8;
  v11[2] = *MEMORY[0x1E4F5FE60];
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
  id v10 = [MEMORY[0x1E4F60390] predicateForMessagesWithActiveFollowUp];
  [(EDThreadPersistence *)self _persistenceDidUpdateMessages:v6 forFilterPredicate:1 changedKeyPaths:v9 predicateToIgnore:v10 loggingString:@"follow up" generationWindow:v7 messageTest:&__block_literal_global_420];
}

uint64_t __80__EDThreadPersistence_persistenceDidUpdateFollowUpForMessages_generationWindow___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 followUp];
  uint64_t v3 = [v2 isActive];

  return v3;
}

- (void)persistenceIsUpdatingDisplayDateForMessage:(id)a3 fromDate:(id)a4 generation:(int64_t)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = NSStringFromSelector(a2);
    *(_DWORD *)long long buf = 138543362;
    uint64_t v23 = v12;
    _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  uint64_t v13 = [v9 displayDate];
  id v21 = v9;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __86__EDThreadPersistence_persistenceIsUpdatingDisplayDateForMessage_fromDate_generation___block_invoke;
  v17[3] = &unk_1E6C06F30;
  void v17[4] = self;
  id v15 = v10;
  id v18 = v15;
  id v16 = v13;
  id v19 = v16;
  int64_t v20 = a5;
  [(EDThreadPersistence *)self _iterateWrappedMessagesByConversationForPersistedMessages:v14 block:v17];
}

void __86__EDThreadPersistence_persistenceIsUpdatingDisplayDateForMessage_fromDate_generation___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_msgSend(*(id *)(a1 + 32), "_threadExpressionForThreadScopeDatabaseID:conversation:", a2, objc_msgSend(v7, "conversationID"));
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __86__EDThreadPersistence_persistenceIsUpdatingDisplayDateForMessage_fromDate_generation___block_invoke_2;
  v34[3] = &unk_1E6C06EE0;
  id v35 = *(id *)(a1 + 40);
  id v36 = *(id *)(a1 + 48);
  char v10 = objc_msgSend(v8, "ef_all:", v34);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  id v12 = [*(id *)(a1 + 32) database];
  uint64_t v13 = [NSString stringWithUTF8String:"-[EDThreadPersistence persistenceIsUpdatingDisplayDateForMessage:fromDate:generation:]_block_invoke"];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __86__EDThreadPersistence_persistenceIsUpdatingDisplayDateForMessage_fromDate_generation___block_invoke_3;
  v21[3] = &unk_1E6C06F08;
  char v29 = v10;
  id v22 = *(id *)(a1 + 48);
  id v14 = v9;
  uint64_t v15 = *(void *)(a1 + 32);
  id v23 = v14;
  uint64_t v24 = v15;
  id v16 = v7;
  id v25 = v16;
  uint64_t v27 = &v30;
  id v17 = v11;
  id v26 = v17;
  uint64_t v28 = a2;
  objc_msgSend(v12, "__performWriteWithCaller:usingBlock:", v13, v21);

  if (v31[3])
  {
    id v18 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v38 = v16;
      _os_log_impl(&dword_1DB39C000, v18, OS_LOG_TYPE_DEFAULT, "Changing thread (displayDate change): %{public}@", buf, 0xCu);
    }

    id v19 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
    [(EDPersistenceDatabaseGenerationWindow *)v19 insertGeneration:*(void *)(a1 + 56)];
    int64_t v20 = [*(id *)(a1 + 32) hookRegistry];
    [v20 persistenceIsChangingThreadWithObjectID:v16 changedKeyPaths:v17 generationWindow:v19];
  }
  _Block_object_dispose(&v30, 8);
}

uint64_t __86__EDThreadPersistence_persistenceIsUpdatingDisplayDateForMessage_fromDate_generation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "ef_isEarlierThanOrEqualDate:", *(void *)(a1 + 40));
}

uint64_t __86__EDThreadPersistence_persistenceIsUpdatingDisplayDateForMessage_fromDate_generation___block_invoke_3(uint64_t a1, void *a2)
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"threads"];
  id v5 = v4;
  if (*(unsigned char *)(a1 + 88))
  {
    [v4 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"display_date"];
    id v6 = [MEMORY[0x1E4F60E78] column:@"display_date"];
    id v7 = [v6 lessThan:*(void *)(a1 + 32)];

    id v8 = objc_alloc(MEMORY[0x1E4F60E48]);
    v23[0] = *(void *)(a1 + 40);
    v23[1] = v7;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    char v10 = (void *)[v8 initWithExpressions:v9];
    [v5 setWhereClause:v10];
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x1E4F60EF8]);
    id v12 = (void *)MEMORY[0x1E4F60E40];
    uint64_t v13 = (void *)MEMORY[0x1E4F60E78];
    id v14 = +[EDMessagePersistence messagesDisplayDateColumnName];
    uint64_t v15 = [v13 column:v14];
    id v16 = [v12 max:v15];
    id v17 = +[EDMessagePersistence messagesTableName];
    id v18 = (void *)[v11 initWithResult:v16 table:v17];

    id v19 = [*(id *)(a1 + 48) _messageThreadExpressionForThreadObjectID:*(void *)(a1 + 56)];
    [v18 setWhere:v19];

    [v5 setObject:v18 forKeyedSubscript:@"display_date"];
    [v5 setWhereClause:*(void *)(a1 + 40)];
  }
  uint64_t v20 = [v3 executeUpdateStatement:v5 rowsChanged:*(void *)(*(void *)(a1 + 72) + 8) + 24];
  if (v20 && *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    [*(id *)(a1 + 64) addObject:*MEMORY[0x1E4F5FE38]];
    [*(id *)(a1 + 48) _recalculateNewestReadMessageForThreadObjectID:*(void *)(a1 + 56) threadScopeDatabaseID:*(void *)(a1 + 80)];
    id v21 = [*(id *)(a1 + 48) _recalculateDisplayMessageForThreadObjectID:*(void *)(a1 + 56) threadScopeDatabaseID:*(void *)(a1 + 80)];
    if ([v21 count]) {
      objc_msgSend(*(id *)(a1 + 64), "ef_addAbsentObjectsFromArrayAccordingToEquals:", v21);
    }
  }
  return v20;
}

- (void)persistenceDidUpdateDisplayDateForMessages:(id)a3 changeIsRemote:(BOOL)a4 generation:(int64_t)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = objc_msgSend(MEMORY[0x1E4F60E00], "bucketMessageCount:", objc_msgSend(v6, "count"));
    _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "Persistence did update display date for %u messages", (uint8_t *)v9, 8u);
  }

  id v8 = [(EDThreadPersistence *)self hookRegistry];
  [v8 persistenceDidFinishThreadUpdates];
}

- (void)persistenceDidUpdateProperties:(id)a3 message:(id)a4 generationWindow:(id)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 flags];
  char v12 = [v11 deleted];

  if ((v12 & 1) == 0
    && [v8 containsObject:*MEMORY[0x1E4F60788]]
    && [v9 numberOfAttachments])
  {
    v24[0] = v9;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    id v18 = __79__EDThreadPersistence_persistenceDidUpdateProperties_message_generationWindow___block_invoke;
    id v19 = &unk_1E6C06F58;
    uint64_t v20 = self;
    id v21 = v10;
    [(EDThreadPersistence *)self _iterateWrappedMessagesByConversationForPersistedMessages:v13 block:&v16];

    id v14 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v23 = v8;
      _os_log_impl(&dword_1DB39C000, v14, OS_LOG_TYPE_DEFAULT, "Persistence did update properties for message: %{public}@", buf, 0xCu);
    }

    uint64_t v15 = [(EDThreadPersistence *)self hookRegistry];
    [v15 persistenceDidFinishThreadUpdates];
  }
}

void __79__EDThreadPersistence_persistenceDidUpdateProperties_message_generationWindow___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_msgSend(*(id *)(a1 + 32), "_threadExpressionForThreadScopeDatabaseID:conversation:", a2, objc_msgSend(v5, "conversationID"));
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  id v7 = [*(id *)(a1 + 32) database];
  id v8 = [NSString stringWithUTF8String:"-[EDThreadPersistence persistenceDidUpdateProperties:message:generationWindow:]_block_invoke"];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __79__EDThreadPersistence_persistenceDidUpdateProperties_message_generationWindow___block_invoke_2;
  uint64_t v16 = &unk_1E6BFF338;
  id v17 = *(id *)(a1 + 40);
  id v9 = v6;
  id v18 = v9;
  id v19 = &v20;
  objc_msgSend(v7, "__performWriteWithCaller:usingBlock:", v8, &v13);

  if (v21[3])
  {
    id v10 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v26 = v5;
      _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Changing thread (hasAttachments change): %{public}@", buf, 0xCu);
    }

    id v11 = [*(id *)(a1 + 32) hookRegistry];
    uint64_t v24 = *MEMORY[0x1E4F5FE90];
    char v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    [v11 persistenceIsChangingThreadWithObjectID:v5 changedKeyPaths:v12 generationWindow:*(void *)(a1 + 40)];
  }
  _Block_object_dispose(&v20, 8);
}

uint64_t __79__EDThreadPersistence_persistenceDidUpdateProperties_message_generationWindow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"threads"];
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  [v4 setObject:&unk_1F35BB1B0 forKeyedSubscript:@"has_attachments"];
  [v4 setWhereClause:*(void *)(a1 + 40)];
  uint64_t v5 = [v3 executeUpdateStatement:v4 rowsChanged:*(void *)(*(void *)(a1 + 48) + 8) + 24];

  return v5;
}

- (void)persistenceDidChangeCategorizationForMessages:(id)a3 generationWindow:(id)a4
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x1E4F5FDF8];
  v11[0] = *MEMORY[0x1E4F5FE00];
  v11[1] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  id v10 = [MEMORY[0x1E4F60390] predicateForPrimaryMessages];
  [(EDThreadPersistence *)self _persistenceDidUpdateMessages:v6 forFilterPredicate:4 changedKeyPaths:v9 predicateToIgnore:v10 loggingString:@"categorization" generationWindow:v7 messageTest:&__block_literal_global_427];
}

uint64_t __86__EDThreadPersistence_persistenceDidChangeCategorizationForMessages_generationWindow___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 category];
  uint64_t v3 = [v2 isPrimary];

  return v3;
}

- (void)_persistenceDidUpdateMessages:(id)a3 forFilterPredicate:(unint64_t)a4 changedKeyPaths:(id)a5 predicateToIgnore:(id)a6 loggingString:(id)a7 generationWindow:(id)a8 messageTest:(id)a9
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  id v39 = a5;
  id v37 = a6;
  id v41 = a7;
  id v40 = a8;
  id v42 = a9;
  uint64_t v16 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = NSStringFromSelector(a2);
    *(_DWORD *)long long buf = 138543618;
    id v62 = v17;
    __int16 v63 = 2114;
    id v64 = v41;
    _os_log_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ - %{public}@", buf, 0x16u);
  }
  id v38 = [(EDThreadPersistence *)self hookRegistry];
  id v44 = objc_msgSend(v43, "ef_partition:", v42);
  id v18 = [(EDThreadPersistence *)self messagePersistence];
  id v19 = [v18 mailboxPersistence];
  id v36 = [v19 mailboxProvider];

  uint64_t v20 = [v44 first];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __149__EDThreadPersistence__persistenceDidUpdateMessages_forFilterPredicate_changedKeyPaths_predicateToIgnore_loggingString_generationWindow_messageTest___block_invoke;
  v54[3] = &unk_1E6C06F80;
  v54[4] = self;
  id v21 = v36;
  id v55 = v21;
  unint64_t v60 = a4;
  id v22 = v39;
  id v56 = v22;
  id v23 = v40;
  id v57 = v23;
  id v24 = v41;
  id v58 = v24;
  id v25 = v38;
  id v59 = v25;
  [(EDThreadPersistence *)self _iterateWrappedMessagesByConversationForPersistedMessages:v20 messageFilter:0 writeBlock:v54];

  id v26 = [v44 second];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  void v52[2] = __149__EDThreadPersistence__persistenceDidUpdateMessages_forFilterPredicate_changedKeyPaths_predicateToIgnore_loggingString_generationWindow_messageTest___block_invoke_428;
  v52[3] = &unk_1E6C06FA8;
  id v27 = v37;
  id v53 = v27;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __149__EDThreadPersistence__persistenceDidUpdateMessages_forFilterPredicate_changedKeyPaths_predicateToIgnore_loggingString_generationWindow_messageTest___block_invoke_2;
  v45[3] = &unk_1E6C06F80;
  void v45[4] = self;
  id v28 = v21;
  id v46 = v28;
  unint64_t v51 = a4;
  id v29 = v23;
  id v47 = v29;
  id v30 = v22;
  id v48 = v30;
  id v31 = v24;
  id v49 = v31;
  id v32 = v25;
  id v50 = v32;
  [(EDThreadPersistence *)self _iterateWrappedMessagesByConversationForPersistedMessages:v26 messageFilter:v52 writeBlock:v45];

  uint64_t v33 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    int v34 = objc_msgSend(MEMORY[0x1E4F60E00], "bucketMessageCount:", objc_msgSend(v43, "count"));
    *(_DWORD *)long long buf = 138543618;
    id v62 = v31;
    __int16 v63 = 1024;
    LODWORD(v64) = v34;
    _os_log_impl(&dword_1DB39C000, v33, OS_LOG_TYPE_DEFAULT, "Persistence did update (%{public}@) for %u messages", buf, 0x12u);
  }

  id v35 = [(EDThreadPersistence *)self hookRegistry];
  [v35 persistenceDidFinishThreadUpdates];
}

void __149__EDThreadPersistence__persistenceDidUpdateMessages_forFilterPredicate_changedKeyPaths_predicateToIgnore_loggingString_generationWindow_messageTest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 thread];
  uint64_t v5 = [v4 objectID];
  id v6 = [v5 threadScope];

  uint64_t v14 = 0;
  id v7 = [*(id *)(a1 + 32) threadScopeManager];
  id v8 = (id)[v7 precomputedMailboxScopeForThreadScope:v6 mailboxTypeResolver:*(void *)(a1 + 40) foundPredicates:&v14];

  if ((*(void *)(a1 + 80) & v14) != 0)
  {
    [*(id *)(a1 + 32) _writeThreadedMessages:v3 withChangedKeyPaths:*(void *)(a1 + 48) journaled:0 generationWindow:*(void *)(a1 + 56)];
  }
  else
  {
    id v9 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 64);
      uint64_t v11 = *(void *)(a1 + 48);
      *(_DWORD *)long long buf = 138543874;
      uint64_t v16 = v10;
      __int16 v17 = 2114;
      id v18 = v4;
      __int16 v19 = 2114;
      uint64_t v20 = v11;
      _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "Changing thread (%{public}@): %{public}@\nkey paths: %{public}@", buf, 0x20u);
    }

    char v12 = *(void **)(a1 + 72);
    uint64_t v13 = [v3 threadObjectID];
    [v12 persistenceIsChangingThreadWithObjectID:v13 changedKeyPaths:*(void *)(a1 + 48) generationWindow:*(void *)(a1 + 56)];
  }
}

uint64_t __149__EDThreadPersistence__persistenceDidUpdateMessages_forFilterPredicate_changedKeyPaths_predicateToIgnore_loggingString_generationWindow_messageTest___block_invoke_428(uint64_t a1, void *a2, void *a3)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1E4F60390];
  v12[0] = *(void *)(a1 + 32);
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  id v9 = [v7 predicateFromPredicate:v5 ignoringPredicates:v8];

  uint64_t v10 = [v9 evaluateWithObject:v6];
  return v10;
}

void __149__EDThreadPersistence__persistenceDidUpdateMessages_forFilterPredicate_changedKeyPaths_predicateToIgnore_loggingString_generationWindow_messageTest___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 thread];
  id v5 = [v4 objectID];
  id v6 = [v5 threadScope];

  uint64_t v23 = 0;
  id v7 = [*(id *)(a1 + 32) threadScopeManager];
  id v8 = (id)[v7 precomputedMailboxScopeForThreadScope:v6 mailboxTypeResolver:*(void *)(a1 + 40) foundPredicates:&v23];

  if ((*(void *)(a1 + 80) & v23) != 0)
  {
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = [v3 wrappedMessages];
    uint64_t v11 = [v3 threadObjectID];
    char v12 = objc_msgSend(v9, "_deleteWrappedMessages:fromThreadWithObjectID:threadScopeDatabaseID:generationWindow:", v10, v11, objc_msgSend(v3, "threadScopeDatabaseID"), *(void *)(a1 + 48));

    if ([v12 count])
    {
      uint64_t v13 = (void *)[v12 mutableCopy];
      objc_msgSend(v13, "ef_addAbsentObjectsFromArrayAccordingToEquals:", *(void *)(a1 + 56));
      uint64_t v14 = +[EDThreadPersistence log];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void *)(a1 + 64);
        uint64_t v16 = [v3 threadObjectID];
        *(_DWORD *)long long buf = 138543874;
        uint64_t v25 = v15;
        __int16 v26 = 2114;
        id v27 = v16;
        __int16 v28 = 2114;
        id v29 = v13;
        _os_log_impl(&dword_1DB39C000, v14, OS_LOG_TYPE_DEFAULT, "Changing thread (%{public}@): %{public}@\nkey paths: %{public}@", buf, 0x20u);
      }
      __int16 v17 = *(void **)(a1 + 72);
      id v18 = [v3 threadObjectID];
      [v17 persistenceIsChangingThreadWithObjectID:v18 changedKeyPaths:v13 generationWindow:*(void *)(a1 + 48)];
    }
  }
  else
  {
    __int16 v19 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = *(void **)(a1 + 56);
      uint64_t v20 = *(void *)(a1 + 64);
      *(_DWORD *)long long buf = 138543874;
      uint64_t v25 = v20;
      __int16 v26 = 2114;
      id v27 = v4;
      __int16 v28 = 2114;
      id v29 = v21;
      _os_log_impl(&dword_1DB39C000, v19, OS_LOG_TYPE_DEFAULT, "Changing thread (%{public}@): %{public}@\nkey paths: %{public}@", buf, 0x20u);
    }

    id v22 = *(void **)(a1 + 72);
    char v12 = [v3 threadObjectID];
    [v22 persistenceIsChangingThreadWithObjectID:v12 changedKeyPaths:*(void *)(a1 + 56) generationWindow:*(void *)(a1 + 48)];
  }
}

- (id)_filteredPersistedMessagesForPersistedMessages:(id)a3
{
  id v3 = objc_msgSend(a3, "ef_filter:", &__block_literal_global_431);

  return v3;
}

uint64_t __70__EDThreadPersistence__filteredPersistedMessagesForPersistedMessages___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 flags];
  if ([v3 deleted]) {
    int v4 = 1;
  }
  else {
    int v4 = [v2 isServerSearchResult];
  }
  uint64_t v5 = v4 ^ 1u;

  return v5;
}

- (void)_iterateWrappedMessagesByConversationForPersistedMessages:(id)a3 messageFilter:(id)a4 writeBlock:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateReceived" ascending:0];
  v23[0] = v11;
  char v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  uint64_t v13 = [v8 sortedArrayUsingDescriptors:v12];

  uint64_t v14 = [(EDThreadPersistence *)self database];
  uint64_t v15 = [NSString stringWithUTF8String:"-[EDThreadPersistence _iterateWrappedMessagesByConversationForPersistedMessages:messageFilter:writeBlock:]"];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __106__EDThreadPersistence__iterateWrappedMessagesByConversationForPersistedMessages_messageFilter_writeBlock___block_invoke;
  void v19[3] = &unk_1E6C07020;
  v19[4] = self;
  id v16 = v13;
  id v20 = v16;
  id v17 = v9;
  id v21 = v17;
  id v18 = v10;
  id v22 = v18;
  objc_msgSend(v14, "__performWriteWithCaller:usingBlock:", v15, v19);
}

uint64_t __106__EDThreadPersistence__iterateWrappedMessagesByConversationForPersistedMessages_messageFilter_writeBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [[_EDThreadPersistence_StatementCache alloc] initWithConnection:v3];
  uint64_t v5 = [*(id *)(a1 + 32) _wrappedMessagesByThreadScopeForPersistedMessages:*(void *)(a1 + 40) messageFilter:*(void *)(a1 + 48)];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _DWORD v9[2] = __106__EDThreadPersistence__iterateWrappedMessagesByConversationForPersistedMessages_messageFilter_writeBlock___block_invoke_2;
  v9[3] = &unk_1E6C06FF8;
  void v9[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v10 = v6;
  char v12 = &v13;
  id v11 = *(id *)(a1 + 56);
  [v5 enumerateKeysAndObjectsUsingBlock:v9];
  uint64_t v7 = *((unsigned __int8 *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __106__EDThreadPersistence__iterateWrappedMessagesByConversationForPersistedMessages_messageFilter_writeBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v25 = a3;
  id v29 = v5;
  id v6 = [*(id *)(a1 + 32) threadScopeManager];
  uint64_t v7 = [v6 databaseIDForThreadScope:v5];

  __int16 v26 = [*(id *)(a1 + 32) _expressionForThreadScope:v5];
  id v8 = [_EDThreadPersistence_ThreadScope alloc];
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [*(id *)(a1 + 32) messagePersistence];
  __int16 v28 = [(_EDThreadPersistence_ThreadScope *)v8 initWithCache:v9 messagePersistence:v10 threadScopeDatabaseID:v7 threadScopeExpression:v26];

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __106__EDThreadPersistence__iterateWrappedMessagesByConversationForPersistedMessages_messageFilter_writeBlock___block_invoke_3;
  v35[3] = &unk_1E6C06FD0;
  id v12 = v11;
  id v36 = v12;
  uint64_t v13 = objc_msgSend(v25, "ef_groupBy:", v35);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v12;
  uint64_t v14 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v18 = [v13 objectForKeyedSubscript:v17];
        __int16 v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F604E0]), "initWithConversationID:threadScope:", objc_msgSend(v17, "longLongValue"), v29);
        uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
        if (*(unsigned char *)(v20 + 24))
        {
          id v30 = 0;
          BOOL v21 = [(_EDThreadPersistence_ThreadScope *)v28 createMessagesWithThreadObjectID:v19 wrappedMessages:v18 threadMessages:&v30];
          id v22 = v30;
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v21;
          if (v22)
          {
            uint64_t v23 = v22;
            (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
            goto LABEL_13;
          }
        }
        else
        {
          *(unsigned char *)(v20 + 24) = 0;
        }
        id v24 = +[EDThreadPersistence log];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543362;
          id v38 = v19;
          _os_log_error_impl(&dword_1DB39C000, v24, OS_LOG_TYPE_ERROR, "Failed to create messages for threadObjectID: %{public}@", buf, 0xCu);
        }

        uint64_t v23 = 0;
LABEL_13:
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v14);
  }
}

id __106__EDThreadPersistence__iterateWrappedMessagesByConversationForPersistedMessages_messageFilter_writeBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = NSNumber;
  int v4 = [a2 message];
  id v5 = objc_msgSend(v3, "numberWithLongLong:", objc_msgSend(v4, "conversationID"));

  [*(id *)(a1 + 32) addObject:v5];

  return v5;
}

- (void)_iterateWrappedMessagesByConversationForPersistedMessages:(id)a3 block:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateReceived" ascending:0];
  v15[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  id v10 = [v6 sortedArrayUsingDescriptors:v9];

  id v11 = [(EDThreadPersistence *)self _wrappedMessagesByThreadScopeForPersistedMessages:v10 messageFilter:0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __87__EDThreadPersistence__iterateWrappedMessagesByConversationForPersistedMessages_block___block_invoke;
  void v13[3] = &unk_1E6C07048;
  void v13[4] = self;
  id v12 = v7;
  id v14 = v12;
  [v11 enumerateKeysAndObjectsUsingBlock:v13];
}

void __87__EDThreadPersistence__iterateWrappedMessagesByConversationForPersistedMessages_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v16 = a3;
  id v6 = [*(id *)(a1 + 32) threadScopeManager];
  [v6 databaseIDForThreadScope:v5];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __87__EDThreadPersistence__iterateWrappedMessagesByConversationForPersistedMessages_block___block_invoke_2;
  v22[3] = &unk_1E6C06FD0;
  id v8 = v7;
  id v23 = v8;
  uint64_t v9 = objc_msgSend(v16, "ef_groupBy:", v22);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v14 = [v9 objectForKeyedSubscript:v13];
        uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F604E0]), "initWithConversationID:threadScope:", objc_msgSend(v13, "longLongValue"), v5);
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v10);
  }
}

id __87__EDThreadPersistence__iterateWrappedMessagesByConversationForPersistedMessages_block___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = NSNumber;
  int v4 = [a2 message];
  id v5 = objc_msgSend(v3, "numberWithLongLong:", objc_msgSend(v4, "conversationID"));

  [*(id *)(a1 + 32) addObject:v5];

  return v5;
}

- (id)_wrappedMessagesByThreadScopeForPersistedMessages:(id)a3 messageFilter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (!v7) {
    id v7 = &__block_literal_global_440;
  }
  uint64_t v9 = [(EDThreadPersistence *)self _persistedMessagesByPossibleThreadScopeForPersistedMessages:v6];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __87__EDThreadPersistence__wrappedMessagesByThreadScopeForPersistedMessages_messageFilter___block_invoke_2;
  void v15[3] = &unk_1E6C07090;
  void v15[4] = self;
  id v10 = v7;
  id v17 = v10;
  id v11 = v8;
  id v16 = v11;
  [v9 enumerateKeysAndObjectsUsingBlock:v15];
  id v12 = v16;
  id v13 = v11;

  return v13;
}

uint64_t __87__EDThreadPersistence__wrappedMessagesByThreadScopeForPersistedMessages_messageFilter___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "evaluateWithObject:");
}

void __87__EDThreadPersistence__wrappedMessagesByThreadScopeForPersistedMessages_messageFilter___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  id v5 = objc_msgSend(*(id *)(a1 + 32), "_wrappedMessageForPersistedMessages:threadScope:messageFilter:", a3);
  if ([v5 count]) {
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v6];
  }
}

- (id)_persistedMessagesByPossibleThreadScopeForPersistedMessages:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = [(EDThreadPersistence *)self messagePersistence];
  id v37 = [v5 mailboxPersistence];

  id v6 = [(EDThreadPersistence *)self threadScopeManager];
  id v29 = [v6 threadScopes];

  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v28;
  uint64_t v33 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v33)
  {
    uint64_t v32 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v47 != v32) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        id v8 = [v7 mailbox];
        if (v8)
        {
          uint64_t v9 = [v31 objectForKeyedSubscript:v8];
          long long v34 = v8;
          if (!v9)
          {
            id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            id v10 = objc_alloc(MEMORY[0x1E4F60310]);
            id v11 = [v34 URL];
            id v12 = (void *)[v10 initWithURL:v11];

            long long v44 = 0u;
            long long v45 = 0u;
            long long v42 = 0u;
            long long v43 = 0u;
            id v13 = v29;
            uint64_t v14 = [v13 countByEnumeratingWithState:&v42 objects:v51 count:16];
            if (v14)
            {
              uint64_t v15 = *(void *)v43;
              do
              {
                for (uint64_t j = 0; j != v14; ++j)
                {
                  if (*(void *)v43 != v15) {
                    objc_enumerationMutation(v13);
                  }
                  id v17 = *(void **)(*((void *)&v42 + 1) + 8 * j);
                  long long v18 = [v17 mailboxScope];
                  int v19 = [v18 scopeContainsMailboxObjectID:v12 mailboxTypeResolver:v37];

                  if (v19) {
                    [v36 addObject:v17];
                  }
                }
                uint64_t v14 = [v13 countByEnumeratingWithState:&v42 objects:v51 count:16];
              }
              while (v14);
            }

            [v31 setObject:v36 forKeyedSubscript:v34];
            uint64_t v9 = v36;
          }
          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          id v20 = v9;
          uint64_t v21 = [v20 countByEnumeratingWithState:&v38 objects:v50 count:16];
          if (v21)
          {
            uint64_t v22 = *(void *)v39;
            do
            {
              for (uint64_t k = 0; k != v21; ++k)
              {
                if (*(void *)v39 != v22) {
                  objc_enumerationMutation(v20);
                }
                uint64_t v24 = *(void *)(*((void *)&v38 + 1) + 8 * k);
                uint64_t v25 = [v4 objectForKeyedSubscript:v24];
                __int16 v26 = v25;
                if (v25)
                {
                  [v25 addObject:v7];
                }
                else
                {
                  __int16 v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v7, 0);
                  [v4 setObject:v26 forKeyedSubscript:v24];
                }
              }
              uint64_t v21 = [v20 countByEnumeratingWithState:&v38 objects:v50 count:16];
            }
            while (v21);
          }

          id v8 = v34;
        }
      }
      uint64_t v33 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
    }
    while (v33);
  }

  return v4;
}

- (id)_wrappedMessageForPersistedMessages:(id)a3 threadScope:(id)a4 messageFilter:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v35 = a4;
  id v34 = a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v8;
  uint64_t v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16, v8);
  if (v10)
  {
    uint64_t v11 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v47 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v13, "globalMessageID"));
        uint64_t v15 = [v9 objectForKeyedSubscript:v14];
        BOOL v16 = v15 == 0;

        if (v16)
        {
          id v17 = [v13 persistentID];
          [v9 setObject:v17 forKeyedSubscript:v14];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v10);
  }

  long long v18 = [(EDThreadPersistence *)self messagePersistence];
  int v19 = [v35 mailboxScope];
  id v36 = [v18 messagesForPersistedMessages:obj mailboxScope:v19];

  id v20 = [v35 filterPredicate];
  uint64_t v33 = v20;
  if (v20)
  {
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __85__EDThreadPersistence__wrappedMessageForPersistedMessages_threadScope_messageFilter___block_invoke;
    v43[3] = &unk_1E6C070B8;
    id v45 = v34;
    id v44 = v20;
    uint64_t v21 = objc_msgSend(v36, "ef_filter:", v43);

    id v36 = (id)v21;
  }
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v37 = v36;
  uint64_t v23 = [v37 countByEnumeratingWithState:&v39 objects:v50 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v40 != v24) {
          objc_enumerationMutation(v37);
        }
        __int16 v26 = *(void **)(*((void *)&v39 + 1) + 8 * j);
        id v27 = [v26 objectID];
        id v28 = [_EDWrappedMessage alloc];
        id v29 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v27, "globalMessageID"));
        id v30 = [v9 objectForKeyedSubscript:v29];
        id v31 = -[_EDWrappedMessage initWithMessage:databaseID:](v28, "initWithMessage:databaseID:", v26, [v30 longLongValue]);

        [v22 addObject:v31];
      }
      uint64_t v23 = [v37 countByEnumeratingWithState:&v39 objects:v50 count:16];
    }
    while (v23);
  }

  return v22;
}

uint64_t __85__EDThreadPersistence__wrappedMessageForPersistedMessages_threadScope_messageFilter___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

- (id)_threadForWrappedMessages:(id)a3 objectID:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(a3, "ef_mapSelector:", sel_message);
  id v8 = objc_alloc(MEMORY[0x1E4F602D0]);
  id v9 = [v6 threadScope];
  uint64_t v10 = [(EDThreadPersistence *)self _threadQueryForThreadScope:v9];
  uint64_t v11 = [v6 threadScope];
  id v12 = (void *)[v8 initWithMessages:v7 originatingQuery:v10 threadScope:v11];

  id v13 = [v12 thread];

  return v13;
}

- (id)_mailboxDatabaseIDsForWrappedMessages:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "message", (void)v17);
        uint64_t v11 = [v10 mailboxObjectIDs];
        [v5 addObjectsFromArray:v11];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  id v12 = [(EDThreadPersistence *)self messagePersistence];
  id v13 = [v12 mailboxPersistence];
  uint64_t v14 = [v13 mailboxDatabaseIDsForMailboxObjectIDs:v5 createIfNecessary:0];
  uint64_t v15 = [v14 allObjects];

  return v15;
}

- (void)_addKeyPathsForBasicPropertiesChangeToKeyPaths:(id)a3
{
  v9[8] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F5FE38];
  v9[0] = *MEMORY[0x1E4F5FE30];
  v9[1] = v4;
  uint64_t v5 = *MEMORY[0x1E4F5FE50];
  _DWORD v9[2] = *MEMORY[0x1E4F5FEF8];
  v9[3] = v5;
  uint64_t v6 = *MEMORY[0x1E4F5FE98];
  void v9[4] = *MEMORY[0x1E4F5FE48];
  void v9[5] = v6;
  uint64_t v7 = *MEMORY[0x1E4F5FE28];
  v9[6] = *MEMORY[0x1E4F5FE90];
  v9[7] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:8];
  [v3 addObjectsFromArray:v8];
}

- (void)_addKeyPathsForDisplayMessageChangeToKeyPaths:(id)a3
{
  v6[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F5FF48];
  v6[0] = *MEMORY[0x1E4F5FF40];
  v6[1] = v4;
  v6[2] = *MEMORY[0x1E4F5FE40];
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  objc_msgSend(v3, "ef_addAbsentObjectsFromArrayAccordingToEquals:", v5);
}

- (BOOL)_updateNewestReadMessageWithWrappedMessage:(id)a3 threadExpression:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [v6 message];
    id v9 = [v8 date];

    uint64_t v10 = [v6 databaseID];
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x2020000000;
    uint64_t v24 = 0;
    uint64_t v11 = [(EDThreadPersistence *)self database];
    id v12 = [NSString stringWithUTF8String:"-[EDThreadPersistence _updateNewestReadMessageWithWrappedMessage:threadExpression:]"];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __83__EDThreadPersistence__updateNewestReadMessageWithWrappedMessage_threadExpression___block_invoke;
    void v16[3] = &unk_1E6C070E0;
    uint64_t v20 = v10;
    id v13 = v9;
    id v17 = v13;
    id v18 = v7;
    long long v19 = &v21;
    objc_msgSend(v11, "__performWriteWithCaller:usingBlock:", v12, v16);

    BOOL v14 = v22[3] != 0;
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

uint64_t __83__EDThreadPersistence__updateNewestReadMessageWithWrappedMessage_threadExpression___block_invoke(void *a1, void *a2)
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v25 = a2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"threads" conflictResolution:4];
  uint64_t v4 = [NSNumber numberWithLongLong:a1[7]];
  [v3 setObject:v4 forKeyedSubscript:@"newest_read_message"];

  __int16 v26 = +[EDMessagePersistence messagesTableName];
  id v5 = objc_alloc(MEMORY[0x1E4F60EF8]);
  id v6 = +[EDMessagePersistence messagesDateReceivedColumnName];
  id v7 = (void *)[v5 initWithResultColumn:v6 table:v26];

  uint64_t v8 = [MEMORY[0x1E4F60E78] table:v26 column:*MEMORY[0x1E4F60D08]];
  id v9 = [MEMORY[0x1E4F60E78] table:@"threads" column:@"newest_read_message"];
  uint64_t v10 = [v8 equalTo:v9];
  [v7 setWhere:v10];

  id v11 = objc_alloc(MEMORY[0x1E4F60ED8]);
  id v12 = [MEMORY[0x1E4F60E78] column:@"newest_read_message"];
  id v13 = [v12 isNull];
  v28[0] = v13;
  id v14 = objc_alloc(MEMORY[0x1E4F60E58]);
  uint64_t v15 = a1[4];
  BOOL v16 = objc_msgSend(v7, "ef_SQLIsolatedExpression");
  id v17 = (void *)[v14 initWithLeft:v15 operator:2 right:v16];
  v28[1] = v17;
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  long long v19 = (void *)[v11 initWithExpressions:v18];

  id v20 = objc_alloc(MEMORY[0x1E4F60E48]);
  v27[0] = a1[5];
  v27[1] = v19;
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  uint64_t v22 = (void *)[v20 initWithExpressions:v21];
  [v3 setWhereClause:v22];

  uint64_t v23 = [v25 executeUpdateStatement:v3 rowsChanged:*(void *)(a1[6] + 8) + 24];
  return v23;
}

- (BOOL)_recalculateNewestMessageForThreadObjectID:(id)a3 threadScopeDatabaseID:(int64_t)a4
{
  id v6 = a3;
  id v7 = +[EDMessagePersistence messagesTableName];
  uint64_t v8 = [(EDThreadPersistence *)self _messageThreadExpressionForThreadObjectID:v6];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  id v9 = [(EDThreadPersistence *)self database];
  uint64_t v10 = [NSString stringWithUTF8String:"-[EDThreadPersistence _recalculateNewestMessageForThreadObjectID:threadScopeDatabaseID:]"];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __88__EDThreadPersistence__recalculateNewestMessageForThreadObjectID_threadScopeDatabaseID___block_invoke;
  void v15[3] = &unk_1E6C07108;
  void v15[4] = self;
  int64_t v20 = a4;
  id v11 = v6;
  id v16 = v11;
  id v12 = v7;
  id v17 = v12;
  id v13 = v8;
  id v18 = v13;
  long long v19 = &v21;
  objc_msgSend(v9, "__performWriteWithCaller:usingBlock:", v10, v15);

  LOBYTE(v6) = v22[3] != 0;
  _Block_object_dispose(&v21, 8);

  return (char)v6;
}

uint64_t __88__EDThreadPersistence__recalculateNewestMessageForThreadObjectID_threadScopeDatabaseID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "_upsertForThreadsWithThreadScopeDatabaseID:conversation:", *(void *)(a1 + 72), objc_msgSend(*(id *)(a1 + 40), "conversationID"));
  id v5 = objc_alloc(MEMORY[0x1E4F60EF8]);
  id v6 = (void *)[v5 initWithResultColumn:*MEMORY[0x1E4F60D08] table:*(void *)(a1 + 48)];
  [v6 setWhere:*(void *)(a1 + 56)];
  id v7 = +[EDMessagePersistence messagesDateReceivedColumnName];
  [v6 orderByColumn:v7 ascending:0];

  [v6 setLimit:1];
  [v4 setObject:v6 forKeyedSubscript:@"newest_message"];
  uint64_t v8 = [v4 excludedColumnExpressionForColumnName:@"newest_message"];
  id v9 = [MEMORY[0x1E4F60E78] column:@"newest_message"];
  uint64_t v10 = [v9 isNot:v8];
  [v4 setWhereClause:v10];

  uint64_t v11 = [v3 executeUpsertStatement:v4 rowsChanged:*(void *)(*(void *)(a1 + 64) + 8) + 24];
  return v11;
}

- (BOOL)_recalculateNewestReadMessageForThreadObjectID:(id)a3 threadScopeDatabaseID:(int64_t)a4
{
  id v6 = a3;
  id v7 = +[EDMessagePersistence messagesTableName];
  uint64_t v8 = [(EDThreadPersistence *)self _messageThreadExpressionForThreadObjectID:v6];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  id v9 = [(EDThreadPersistence *)self database];
  uint64_t v10 = [NSString stringWithUTF8String:"-[EDThreadPersistence _recalculateNewestReadMessageForThreadObjectID:threadScopeDatabaseID:]"];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __92__EDThreadPersistence__recalculateNewestReadMessageForThreadObjectID_threadScopeDatabaseID___block_invoke;
  void v15[3] = &unk_1E6C07108;
  void v15[4] = self;
  int64_t v20 = a4;
  id v11 = v6;
  id v16 = v11;
  id v12 = v7;
  id v17 = v12;
  id v13 = v8;
  id v18 = v13;
  long long v19 = &v21;
  objc_msgSend(v9, "__performWriteWithCaller:usingBlock:", v10, v15);

  LOBYTE(v6) = v22[3] != 0;
  _Block_object_dispose(&v21, 8);

  return (char)v6;
}

uint64_t __92__EDThreadPersistence__recalculateNewestReadMessageForThreadObjectID_threadScopeDatabaseID___block_invoke(uint64_t a1, void *a2)
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "_upsertForThreadsWithThreadScopeDatabaseID:conversation:", *(void *)(a1 + 72), objc_msgSend(*(id *)(a1 + 40), "conversationID"));
  id v5 = objc_alloc(MEMORY[0x1E4F60EF8]);
  id v6 = (void *)[v5 initWithResultColumn:*MEMORY[0x1E4F60D08] table:*(void *)(a1 + 48)];
  id v7 = [MEMORY[0x1E4F60E78] column:@"read"];
  uint64_t v8 = [v7 equalTo:&unk_1F35BB1B0];

  id v9 = objc_alloc(MEMORY[0x1E4F60E48]);
  v18[0] = *(void *)(a1 + 56);
  v18[1] = v8;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  id v11 = (void *)[v9 initWithExpressions:v10];
  [v6 setWhere:v11];

  id v12 = +[EDMessagePersistence messagesDateReceivedColumnName];
  [v6 orderByColumn:v12 ascending:0];

  [v6 setLimit:1];
  [v4 setObject:v6 forKeyedSubscript:@"newest_read_message"];
  id v13 = [v4 excludedColumnExpressionForColumnName:@"newest_read_message"];
  id v14 = [MEMORY[0x1E4F60E78] column:@"newest_read_message"];
  uint64_t v15 = [v14 isNot:v13];
  [v4 setWhereClause:v15];

  uint64_t v16 = [v3 executeUpsertStatement:v4 rowsChanged:*(void *)(*(void *)(a1 + 64) + 8) + 24];
  return v16;
}

- (id)_recalculateDisplayMessageForThreadObjectID:(id)a3 threadScopeDatabaseID:(int64_t)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = +[EDMessagePersistence messagesTableName];
  uint64_t v8 = objc_msgSend(v6, "conversationID", v7);
  id v9 = [(EDThreadPersistence *)self _threadExpressionForThreadScopeDatabaseID:a4 conversation:v8];
  uint64_t v10 = [(EDThreadPersistence *)self _messageThreadExpressionForThreadObjectID:v6];
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  id v11 = [(EDThreadPersistence *)self database];
  id v12 = [NSString stringWithUTF8String:"-[EDThreadPersistence _recalculateDisplayMessageForThreadObjectID:threadScopeDatabaseID:]"];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __89__EDThreadPersistence__recalculateDisplayMessageForThreadObjectID_threadScopeDatabaseID___block_invoke;
  void v19[3] = &unk_1E6C06DF0;
  v19[4] = self;
  int64_t v24 = a4;
  uint64_t v25 = v8;
  id v13 = v7;
  id v20 = v13;
  id v14 = v9;
  id v21 = v14;
  id v15 = v10;
  id v22 = v15;
  uint64_t v23 = &v26;
  objc_msgSend(v11, "__performWriteWithCaller:usingBlock:", v12, v19);

  if (v27[3])
  {
    uint64_t v16 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      uint64_t v31 = v8;
      _os_log_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_DEFAULT, "Thread with conversationID %lld display message updated", buf, 0xCu);
    }

    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(EDThreadPersistence *)self _addKeyPathsForDisplayMessageChangeToKeyPaths:v17];
    if ([(EDThreadPersistence *)self setPriorityForDisplayMessageSenderForThreadObjectID:v6])
    {
      objc_msgSend(v17, "ef_addObjectIfAbsent:", *MEMORY[0x1E4F5FF30]);
    }
  }
  else
  {
    id v17 = (id)MEMORY[0x1E4F1CBF0];
  }

  _Block_object_dispose(&v26, 8);

  return v17;
}

uint64_t __89__EDThreadPersistence__recalculateDisplayMessageForThreadObjectID_threadScopeDatabaseID___block_invoke(uint64_t a1, void *a2)
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v26 = a2;
  id v3 = [*(id *)(a1 + 32) _upsertForThreadsWithThreadScopeDatabaseID:*(void *)(a1 + 72) conversation:*(void *)(a1 + 80)];
  id v4 = objc_alloc(MEMORY[0x1E4F60EF8]);
  id v5 = +[EDMessagePersistence messagesDateReceivedColumnName];
  id v6 = (void *)[v4 initWithResultColumn:v5 table:*(void *)(a1 + 40)];

  uint64_t v7 = *MEMORY[0x1E4F60D08];
  id v8 = (id)[v6 join:@"threads" sourceColumn:*MEMORY[0x1E4F60D08] targetColumn:@"newest_read_message"];
  [v6 setWhere:*(void *)(a1 + 48)];
  id v27 = [MEMORY[0x1E4F60EA8] ifNull:v6 second:&unk_1F35BB198];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:v7 table:*(void *)(a1 + 40)];
  uint64_t v10 = (void *)MEMORY[0x1E4F60E78];
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = +[EDMessagePersistence messagesDateReceivedColumnName];
  id v13 = [v10 table:v11 column:v12];
  id v14 = [v13 greaterThan:v27];

  id v15 = objc_alloc(MEMORY[0x1E4F60E48]);
  v28[0] = *(void *)(a1 + 56);
  v28[1] = v14;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  id v17 = (void *)[v15 initWithExpressions:v16];
  [v9 setWhere:v17];

  id v18 = +[EDMessagePersistence messagesDateReceivedColumnName];
  [v9 orderByColumn:v18 ascending:1];

  [v9 setLimit:1];
  long long v19 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"newest_read_message" table:@"threads"];
  [v19 setWhere:*(void *)(a1 + 48)];
  id v20 = [MEMORY[0x1E4F60EA8] ifNull:v9 second:v19];
  [v3 setObject:v20 forKeyedSubscript:@"display_message"];

  id v21 = [v3 excludedColumnExpressionForColumnName:@"display_message"];
  id v22 = [MEMORY[0x1E4F60E78] column:@"display_message"];
  uint64_t v23 = [v22 isNot:v21];
  [v3 setWhereClause:v23];

  uint64_t v24 = [v26 executeUpsertStatement:v3 rowsChanged:*(void *)(*(void *)(a1 + 64) + 8) + 24];
  return v24;
}

- (BOOL)setPriorityForDisplayMessageSenderForThreadObjectID:(id)a3
{
  id v4 = a3;
  id v5 = +[EDMessagePersistence messagesTableName];
  int64_t v6 = [(EDThreadPersistence *)self _databaseIDForThreadObjectID:v4];
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v7 = [(EDThreadPersistence *)self database];
  id v8 = [NSString stringWithUTF8String:"-[EDThreadPersistence setPriorityForDisplayMessageSenderForThreadObjectID:]"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__EDThreadPersistence_setPriorityForDisplayMessageSenderForThreadObjectID___block_invoke;
  void v11[3] = &unk_1E6C03068;
  int64_t v14 = v6;
  id v9 = v5;
  id v12 = v9;
  id v13 = &v15;
  objc_msgSend(v7, "__performWriteWithCaller:usingBlock:", v8, v11);

  LOBYTE(v5) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)v5;
}

uint64_t __75__EDThreadPersistence_setPriorityForDisplayMessageSenderForThreadObjectID___block_invoke(void *a1, void *a2)
{
  v50[2] = *MEMORY[0x1E4F143B8];
  id v37 = a2;
  id v3 = [MEMORY[0x1E4F60E78] column:@"thread"];
  id v4 = [NSNumber numberWithLongLong:a1[6]];
  uint64_t v5 = [v3 equalTo:v4];

  id v35 = (void *)v5;
  int64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"address" table:@"thread_senders"];
  uint64_t v7 = [MEMORY[0x1E4F60E78] column:@"priority"];
  id v36 = [v7 equalTo:&unk_1F35BB300];

  id v8 = objc_alloc(MEMORY[0x1E4F60E48]);
  v50[0] = v5;
  v50[1] = v36;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
  uint64_t v10 = (void *)[v8 initWithExpressions:v9];
  [v6 setWhere:v10];

  uint64_t v44 = 0;
  id v45 = &v44;
  uint64_t v46 = 0x2020000000;
  uint64_t v11 = *MEMORY[0x1E4F5FCC8];
  uint64_t v47 = *MEMORY[0x1E4F5FCC8];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __75__EDThreadPersistence_setPriorityForDisplayMessageSenderForThreadObjectID___block_invoke_448;
  v43[3] = &unk_1E6BFF4C8;
  void v43[4] = &v44;
  if ([v37 executeSelectStatement:v6 withBlock:v43 error:0])
  {
    id v34 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"display_message" table:@"threads"];
    uint64_t v12 = *MEMORY[0x1E4F60D08];
    id v13 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
    int64_t v14 = [NSNumber numberWithLongLong:a1[6]];
    uint64_t v15 = [v13 equalTo:v14];
    [v34 setWhere:v15];

    id v16 = objc_alloc(MEMORY[0x1E4F60EF8]);
    uint64_t v17 = +[EDMessagePersistence messagesSenderColumnName];
    char v18 = (void *)[v16 initWithResultColumn:v17 table:a1[4]];

    long long v19 = [MEMORY[0x1E4F60E78] column:v12];
    id v20 = [v19 in:v34];
    [v18 setWhere:v20];

    uint64_t v39 = 0;
    long long v40 = &v39;
    uint64_t v41 = 0x2020000000;
    uint64_t v42 = v11;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __75__EDThreadPersistence_setPriorityForDisplayMessageSenderForThreadObjectID___block_invoke_2;
    v38[3] = &unk_1E6BFF4C8;
    v38[4] = &v39;
    if ([v37 executeSelectStatement:v18 withBlock:v38 error:0])
    {
      uint64_t v21 = 1;
      if (v45[3] != v40[3])
      {
        *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
        id v22 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"thread_senders"];
        [v22 setObject:&unk_1F35BB318 forKeyedSubscript:@"priority"];
        id v23 = objc_alloc(MEMORY[0x1E4F60E48]);
        v49[0] = v35;
        v49[1] = v36;
        uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
        uint64_t v25 = (void *)[v23 initWithExpressions:v24];
        [v22 setWhereClause:v25];

        if ([v37 executeUpdateStatement:v22 error:0])
        {
          id v26 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"thread_senders"];
          [v26 setObject:&unk_1F35BB300 forKeyedSubscript:@"priority"];
          id v27 = [MEMORY[0x1E4F60E78] column:@"address"];
          uint64_t v28 = [NSNumber numberWithLongLong:v40[3]];
          uint64_t v29 = [v27 equalTo:v28];

          id v30 = objc_alloc(MEMORY[0x1E4F60E48]);
          v48[0] = v35;
          v48[1] = v29;
          uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
          uint64_t v32 = (void *)[v30 initWithExpressions:v31];
          [v26 setWhereClause:v32];

          uint64_t v21 = [v37 executeUpdateStatement:v26 error:0];
        }
        else
        {
          uint64_t v21 = 0;
        }
      }
    }
    else
    {
      uint64_t v21 = 0;
    }
    _Block_object_dispose(&v39, 8);
  }
  else
  {
    uint64_t v21 = 0;
  }
  _Block_object_dispose(&v44, 8);

  return v21;
}

void __75__EDThreadPersistence_setPriorityForDisplayMessageSenderForThreadObjectID___block_invoke_448(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  int64_t v6 = [v7 objectAtIndexedSubscript:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v6 databaseIDValue];

  *a4 = 1;
}

void __75__EDThreadPersistence_setPriorityForDisplayMessageSenderForThreadObjectID___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  int64_t v6 = [v7 objectAtIndexedSubscript:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v6 databaseIDValue];

  *a4 = 1;
}

- (id)_upsertForThreadsWithThreadScopeDatabaseID:(int64_t)a3 conversation:(int64_t)a4
{
  void v14[2] = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc(MEMORY[0x1E4F60F18]);
  v14[0] = @"scope";
  v14[1] = @"conversation";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  id v8 = (void *)[v6 initWithTable:@"threads" conflictTarget:v7];

  id v9 = [NSNumber numberWithLongLong:a3];
  [v8 setObject:v9 forKeyedSubscript:@"scope"];

  uint64_t v10 = [NSNumber numberWithLongLong:a4];
  [v8 setObject:v10 forKeyedSubscript:@"conversation"];

  uint64_t v11 = [v8 insertValue];
  [v11 setObject:&unk_1F35BB198 forKeyedSubscript:@"date"];

  uint64_t v12 = [v8 insertValue];
  [v12 setObject:&unk_1F35BB198 forKeyedSubscript:@"count"];

  return v8;
}

- (id)_updateForThreadsWithThreadScopeDatabaseID:(int64_t)a3 conversation:(int64_t)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"threads"];
  id v7 = objc_alloc(MEMORY[0x1E4F60E48]);
  id v8 = [MEMORY[0x1E4F60E78] column:@"scope"];
  id v9 = [NSNumber numberWithLongLong:a3];
  uint64_t v10 = [v8 equalTo:v9];
  v17[0] = v10;
  uint64_t v11 = [MEMORY[0x1E4F60E78] column:@"conversation"];
  uint64_t v12 = [NSNumber numberWithLongLong:a4];
  id v13 = [v11 equalTo:v12];
  v17[1] = v13;
  int64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  uint64_t v15 = (void *)[v7 initWithExpressions:v14];
  [v6 setWhereClause:v15];

  return v6;
}

- (id)_countMessagesForExpression:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
  uint64_t v5 = [MEMORY[0x1E4F60E78] column:@"message_id"];
  id v6 = (void *)MEMORY[0x1E4F60EA8];
  id v7 = [v4 concatenate:@"-fake-message-id"];
  id v8 = [v6 ifNull:v5 second:v7];

  id v9 = [MEMORY[0x1E4F60E40] countDistinct:v8];
  id v10 = objc_alloc(MEMORY[0x1E4F60EF8]);
  uint64_t v11 = +[EDMessagePersistence messagesTableName];
  uint64_t v12 = (void *)[v10 initWithResult:v9 table:v11];

  [v12 setWhere:v3];

  return v12;
}

- (id)_messageThreadExpressionForThreadObjectID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F60E78] column:@"conversation_id"];
  id v6 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "conversationID"));
  id v7 = [v5 equalTo:v6];

  id v8 = [v4 threadScope];
  id v9 = [(EDThreadPersistence *)self _messageThreadExpressionForThreadScope:v8 conversationExpression:v7];

  return v9;
}

- (id)_messageThreadExpressionForThreadScope:(id)a3 objectIDs:(id)a4
{
  id v6 = a3;
  id v7 = objc_msgSend(a4, "ef_map:", &__block_literal_global_462);
  id v8 = [MEMORY[0x1E4F60E78] column:@"conversation_id"];
  id v9 = [v8 in:v7];

  id v10 = [(EDThreadPersistence *)self _messageThreadExpressionForThreadScope:v6 conversationExpression:v9];

  return v10;
}

id __72__EDThreadPersistence__messageThreadExpressionForThreadScope_objectIDs___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v2, "conversationID"));

  return v3;
}

- (id)_messageThreadExpressionForThreadScope:(id)a3 conversationExpression:(id)a4
{
  void v19[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(EDThreadPersistence *)self _expressionForThreadScope:v6];
  id v9 = (void *)MEMORY[0x1E4F60EA8];
  id v10 = (void *)MEMORY[0x1E4F60E78];
  uint64_t v11 = +[EDMessagePersistence messagesTableName];
  uint64_t v12 = [v10 table:v11 column:@"deleted"];
  id v13 = [v12 equalTo:&unk_1F35BB198];
  int64_t v14 = [v9 likely:v13];

  id v15 = objc_alloc(MEMORY[0x1E4F60E48]);
  v19[0] = v14;
  v19[1] = v7;
  v19[2] = v8;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  uint64_t v17 = (void *)[v15 initWithExpressions:v16];

  return v17;
}

- (id)_expressionForThreadScope:(id)a3
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 filterPredicate];
  id v6 = [(EDThreadPersistence *)self _messageFilterExpressionForFilterPredicate:v5];

  if (v6)
  {
    id v7 = [v4 mailboxScope];
    id v8 = [MEMORY[0x1E4F60318] allMailboxesScope];

    if (v7 == v8)
    {
      id v12 = v6;
    }
    else
    {
      id v9 = [(EDThreadPersistence *)self _messageMailboxesExpressionForMailboxScope:v7];
      id v10 = objc_alloc(MEMORY[0x1E4F60E48]);
      v15[0] = v9;
      v15[1] = v6;
      uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
      id v12 = (id)[v10 initWithExpressions:v11];
    }
  }
  else
  {
    id v13 = [v4 mailboxScope];
    id v12 = [(EDThreadPersistence *)self _messageMailboxesExpressionForMailboxScope:v13];
  }

  return v12;
}

- (id)_messageMailboxesExpressionForMailboxScope:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F60318] allMailboxesScope];

  if (v6 == v5)
  {
    id v10 = (void *)MEMORY[0x1E4F1CC38];
  }
  else
  {
    char v13 = 0;
    id v7 = [(EDThreadPersistence *)self messagePersistence];
    id v8 = [v7 mailboxPersistence];
    id v9 = [v5 allMailboxObjectIDsWithMailboxTypeResolver:v8 forExclusion:&v13];

    if (v13)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"EDThreadPersistence.m" lineNumber:2988 description:@"Mailbox scope for pre-computed threads should never be for exclusion."];
    }
    id v10 = [(EDThreadPersistence *)self _messageMailboxesExpressionForMailboxObjectIDs:v9];
  }

  return v10;
}

- (id)_messageMailboxesExpressionForMailboxType:(int64_t)a3
{
  id v5 = [(EDThreadPersistence *)self messagePersistence];
  id v6 = [v5 mailboxPersistence];
  id v7 = [v6 mailboxObjectIDsForMailboxType:a3];

  id v8 = [(EDThreadPersistence *)self _messageMailboxesExpressionForMailboxObjectIDs:v7];

  return v8;
}

- (id)_messageMailboxesExpressionForMailboxObjectIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(EDThreadPersistence *)self messagePersistence];
  id v6 = [v5 mailboxPersistence];
  id v7 = [v6 mailboxDatabaseIDsForMailboxObjectIDs:v4 createIfNecessary:0];

  id v8 = [MEMORY[0x1E4F60E78] column:@"mailbox"];
  id v9 = [v8 in:v7];

  return v9;
}

- (id)_messageMailboxesExpressionForAccountObjectIDs:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = [(EDThreadPersistence *)self messagePersistence];
  id v7 = [v6 mailboxPersistence];
  id v8 = [v7 allMailboxes];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        char v13 = [v12 accountIdentifier];
        int v14 = [v4 containsObject:v13];

        if (v14)
        {
          id v15 = [v12 objectID];
          [v5 addObject:v15];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }

  id v16 = [(EDThreadPersistence *)self messagePersistence];
  uint64_t v17 = [v16 mailboxPersistence];
  char v18 = [v17 mailboxDatabaseIDsForMailboxObjectIDs:v5 createIfNecessary:0];

  long long v19 = [MEMORY[0x1E4F60E78] column:@"mailbox"];
  id v20 = [v19 in:v18];

  return v20;
}

- (id)_messageActiveFollowUpExpressionForSentMailboxObjectIDs:(id)a3
{
  v29[3] = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"follow_up_start_date" table:@"message_global_data"];
  uint64_t v5 = *MEMORY[0x1E4F60D08];
  id v6 = [MEMORY[0x1E4F60E78] table:@"message_global_data" column:*MEMORY[0x1E4F60D08]];
  id v7 = (void *)MEMORY[0x1E4F60E78];
  id v8 = +[EDMessagePersistence messagesTableName];
  uint64_t v9 = [v7 table:v8 column:@"global_message_id"];
  uint64_t v10 = [v6 equalTo:v9];
  [v4 setWhere:v10];

  [v4 setLimit:1];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"follow_up_end_date" table:@"message_global_data"];
  id v12 = [MEMORY[0x1E4F60E78] table:@"message_global_data" column:v5];
  char v13 = (void *)MEMORY[0x1E4F60E78];
  int v14 = +[EDMessagePersistence messagesTableName];
  id v15 = [v13 table:v14 column:@"global_message_id"];
  id v16 = [v12 equalTo:v15];
  [v11 setWhere:v16];

  [v11 setLimit:1];
  uint64_t v17 = [MEMORY[0x1E4F60E78] column:@"display_date"];
  char v18 = [v17 greaterThan:v4];
  long long v19 = [v17 lessThan:v11];
  if ([v27 count]
    && ([(EDThreadPersistence *)self _messageMailboxesExpressionForMailboxObjectIDs:v27], uint64_t v20 = objc_claimAutoreleasedReturnValue(), (v21 = (void *)v20) != 0))
  {
    long long v22 = (void *)MEMORY[0x1E4F60E48];
    v29[0] = v18;
    v29[1] = v19;
    v29[2] = v20;
    long long v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:3];
    long long v24 = [v22 combined:v23];
  }
  else
  {
    long long v25 = (void *)MEMORY[0x1E4F60E48];
    v28[0] = v18;
    v28[1] = v19;
    uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    long long v24 = [v25 combined:v21];
  }

  return v24;
}

- (id)_selectFromMessageGlobalDataColumn:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:v3 table:@"message_global_data"];
  uint64_t v5 = [MEMORY[0x1E4F60E78] table:@"message_global_data" column:*MEMORY[0x1E4F60D08]];
  id v6 = (void *)MEMORY[0x1E4F60E78];
  id v7 = +[EDMessagePersistence messagesTableName];
  id v8 = [v6 table:v7 column:@"global_message_id"];
  uint64_t v9 = [v5 equalTo:v8];
  [v4 setWhere:v9];

  [v4 setLimit:1];

  return v4;
}

- (id)_messageFiredReadLaterExpression:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(EDThreadPersistence *)self _selectFromMessageGlobalDataColumn:@"read_later_date"];
  id v6 = [MEMORY[0x1E4F60E78] column:@"display_date"];
  id v7 = [v6 greaterThanEqualTo:v5];
  if ([v4 count]
    && ([(EDThreadPersistence *)self _messageMailboxesExpressionForAccountObjectIDs:v4], uint64_t v8 = objc_claimAutoreleasedReturnValue(), (v9 = (void *)v8) != 0))
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F60E48];
    v16[0] = v7;
    v16[1] = v8;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    id v12 = [v10 combined:v11];
  }
  else
  {
    char v13 = (void *)MEMORY[0x1E4F60E48];
    id v15 = v7;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    id v12 = [v13 combined:v9];
  }

  return v12;
}

- (id)_expressionFromSelect:(id)a3 equalTo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc(MEMORY[0x1E4F60E58]);
  uint64_t v8 = objc_msgSend(v5, "ef_SQLIsolatedExpression");
  id v9 = [MEMORY[0x1E4F1CA98] null];
  uint64_t v10 = objc_msgSend(v6, "ef_SQLIsolatedExpression");
  if (v9 == v6) {
    uint64_t v11 = 12;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = (void *)[v7 initWithLeft:v8 operator:v11 right:v10];

  return v12;
}

- (id)_expressionForCategoryType:(unint64_t)a3
{
  v25[3] = *MEMORY[0x1E4F143B8];
  id v4 = [(EDThreadPersistence *)self _selectFromMessageGlobalDataColumn:@"model_category"];
  id v5 = objc_alloc(MEMORY[0x1E4F60EF8]);
  id v6 = +[EDBusinessPersistence businessAddressesCategoryColumnName];
  id v7 = +[EDBusinessPersistence businessAddressesTableName];
  uint64_t v8 = (void *)[v5 initWithResultColumn:v6 table:v7];

  id v9 = (void *)MEMORY[0x1E4F60E78];
  uint64_t v10 = +[EDBusinessPersistence businessAddressesTableName];
  uint64_t v11 = +[EDBusinessPersistence businessAddressesAddressColumnName];
  id v12 = [v9 table:v10 column:v11];
  char v13 = (void *)MEMORY[0x1E4F60E78];
  int v14 = +[EDMessagePersistence messagesTableName];
  id v15 = +[EDMessagePersistence messagesSenderColumnName];
  id v16 = [v13 table:v14 column:v15];
  uint64_t v17 = [v12 equalTo:v16];
  [v8 setWhere:v17];

  [v8 setLimit:1];
  char v18 = (void *)MEMORY[0x1E4F60EA8];
  v25[0] = v8;
  v25[1] = v4;
  v25[2] = &unk_1F35BB240;
  long long v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:3];
  uint64_t v20 = [v18 coalesce:v19];

  id v21 = objc_alloc(MEMORY[0x1E4F60E58]);
  long long v22 = [NSNumber numberWithUnsignedInteger:a3];
  long long v23 = (void *)[v21 initWithLeft:v20 operator:0 right:v22];

  return v23;
}

- (id)_expressionForPredicateForPrimaryMessages
{
  _DWORD v9[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(EDThreadPersistence *)self _selectFromMessageGlobalDataColumn:@"model_high_impact"];
  id v4 = [(EDThreadPersistence *)self _expressionForCategoryType:0];
  v9[0] = v4;
  id v5 = [(EDThreadPersistence *)self _expressionFromSelect:v3 equalTo:&unk_1F35BB1B0];
  v9[1] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];

  id v7 = [MEMORY[0x1E4F60ED8] combined:v6];

  return v7;
}

- (id)_senderAddressesExpressionForMessages:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F60EF8]);
  id v5 = +[EDMessagePersistence messagesSenderColumnName];
  id v6 = +[EDMessagePersistence messagesTableName];
  id v7 = (void *)[v4 initWithResultColumn:v5 table:v6];

  [v7 setWhere:v3];

  return v7;
}

- (id)_recipientAddressesExpressionForRecipientType:(unint64_t)a3 messages:(id)a4
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"address" table:@"recipients"];
  id v7 = +[EDMessagePersistence messagesTableName];
  id v8 = (id)[v6 join:v7 sourceColumn:@"message" targetColumn:*MEMORY[0x1E4F60D08]];

  id v9 = objc_alloc(MEMORY[0x1E4F60E48]);
  v16[0] = v5;
  uint64_t v10 = [MEMORY[0x1E4F60E78] table:@"recipients" column:@"type"];
  uint64_t v11 = [NSNumber numberWithUnsignedInteger:a3];
  id v12 = [v10 equalTo:v11];
  v16[1] = v12;
  char v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  int v14 = (void *)[v9 initWithExpressions:v13];
  [v6 setWhere:v14];

  return v6;
}

- (id)_messageFilterExpressionForFilterPredicate:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v12 = 0;
    goto LABEL_22;
  }
  id v5 = [(EDThreadPersistence *)self messagePersistence];
  id v6 = [v5 mailboxPersistence];
  id v7 = [v6 mailboxProvider];

  char v36 = 0;
  id v34 = 0;
  uint64_t v35 = -500;
  int v8 = [MEMORY[0x1E4F60390] isPredicateForMessagesInMailboxObjectID:v4 mailboxObjectID:&v34];
  id v9 = v34;
  uint64_t v10 = v9;
  if (!v8)
  {
    if ([MEMORY[0x1E4F60390] isPredicateForMessagesInMailboxWithType:v4 mailboxType:&v35])
    {
      if (v35 != -500)
      {
        char v13 = 0;
        id v12 = -[EDThreadPersistence _messageMailboxesExpressionForMailboxType:](self, "_messageMailboxesExpressionForMailboxType:");
        id v14 = 0;
        goto LABEL_21;
      }
      goto LABEL_8;
    }
    id v33 = 0;
    int v15 = [MEMORY[0x1E4F60390] isPredicateForMessagesWithActiveFollowUp:v4 mailboxTypeResolver:v7 inSent:&v36 sentMailboxObjectIDs:&v33];
    id v16 = v33;
    char v13 = v16;
    if (v15)
    {
      if (v36 && ![v16 count])
      {
        uint64_t v17 = [v7 mailboxObjectIDsForMailboxType:4];

        char v13 = (void *)v17;
      }
      id v14 = 0;
      uint64_t v18 = [(EDThreadPersistence *)self _messageActiveFollowUpExpressionForSentMailboxObjectIDs:v13];
      goto LABEL_20;
    }
    id v32 = 0;
    int v19 = [MEMORY[0x1E4F60390] isPredicateForMessagesWithFiredReadLaterDate:v4 accountObjectIDs:&v32];
    id v14 = v32;
    if (v19)
    {
      uint64_t v18 = [(EDThreadPersistence *)self _messageFiredReadLaterExpression:v14];
LABEL_20:
      id v12 = (void *)v18;
      goto LABEL_21;
    }
    uint64_t v20 = [MEMORY[0x1E4F60390] predicateForPrimaryMessages];
    int v21 = [v4 isEqual:v20];

    if (v21)
    {
      uint64_t v18 = [(EDThreadPersistence *)self _expressionForPredicateForPrimaryMessages];
      goto LABEL_20;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_9;
    }
    id v23 = v4;
    id v12 = [v23 subpredicates];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __66__EDThreadPersistence__messageFilterExpressionForFilterPredicate___block_invoke;
    v31[3] = &unk_1E6C07130;
    v31[4] = self;
    long long v24 = objc_msgSend(v12, "ef_compactMap:", v31);

    uint64_t v25 = [v23 compoundPredicateType];
    if (v25)
    {
      if (v25 != 1)
      {
        if (v25 != 2)
        {
          char v30 = 1;
LABEL_38:

          if ((v30 & 1) == 0) {
            goto LABEL_21;
          }
          goto LABEL_9;
        }
        id v26 = (id *)0x1E4F60ED8;
        goto LABEL_35;
      }
    }
    else if ((unint64_t)[v24 count] >= 2)
    {
      id v27 = +[EDThreadPersistence log];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[EDThreadPersistence _messageFilterExpressionForFilterPredicate:]();
      }

      id v28 = objc_alloc(MEMORY[0x1E4F60EC8]);
      uint64_t v29 = [v24 firstObject];
      id v12 = (void *)[v28 initWithExpression:v29];

      goto LABEL_36;
    }
    id v26 = (id *)0x1E4F60E48;
LABEL_35:
    id v12 = [*v26 combined:v24];
LABEL_36:
    char v30 = 0;
    goto LABEL_38;
  }
  if (!v9)
  {
LABEL_8:
    char v13 = 0;
    id v14 = 0;
LABEL_9:
    id v12 = 0;
    goto LABEL_21;
  }
  uint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
  id v12 = [(EDThreadPersistence *)self _messageMailboxesExpressionForMailboxObjectIDs:v11];

  char v13 = 0;
  id v14 = 0;
LABEL_21:

LABEL_22:

  return v12;
}

id __66__EDThreadPersistence__messageFilterExpressionForFilterPredicate___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) _messageFilterExpressionForFilterPredicate:a2];

  return v2;
}

- (id)_messageIsNotDeletedExpression
{
  id v2 = (void *)MEMORY[0x1E4F60E78];
  id v3 = +[EDMessagePersistence messagesTableName];
  id v4 = [v2 table:v3 column:@"deleted"];

  id v5 = [v4 equalTo:&unk_1F35BB198];
  id v6 = [MEMORY[0x1E4F60EA8] likely:v5];

  return v6;
}

- (id)_threadQueryForThreadScope:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F60390] predicateForMessagesWithThreadScope:a3];
  id v4 = [MEMORY[0x1E4F60390] sortDescriptorForDateAscending:0];
  id v5 = objc_alloc(MEMORY[0x1E4F60418]);
  uint64_t v6 = objc_opt_class();
  v10[0] = v4;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  int v8 = (void *)[v5 initWithTargetClass:v6 predicate:v3 sortDescriptors:v7];

  return v8;
}

- (id)beginMigratingThreadScope:(id)a3
{
  void v34[4] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(EDThreadPersistence *)self database];
  v34[0] = 0;
  uint64_t v6 = [v5 requestProtectedDatabaseBackgroundProcessingForDuration:v34 error:1200.0];
  id v7 = v34[0];

  if (!v6)
  {
    int v8 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[EDThreadPersistence beginMigratingThreadScope:]();
    }
  }
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 1;
  id v9 = [(EDThreadPersistence *)self threadScopeManager];
  uint64_t v10 = [v9 databaseIDForThreadScope:v4];
  BOOL v11 = v10 == *MEMORY[0x1E4F5FCC8];

  if (v11)
  {
    id v12 = [MEMORY[0x1E4F1C9C8] date];
    BOOL v13 = [(EDThreadPersistence *)self _addThreadScopeToDatabase:v4 needsUpdate:1 lastViewedDate:v12 updateThreadScopeManager:1];
    *((unsigned char *)v31 + 24) = v13;
  }
  else
  {
    id v14 = [(EDThreadPersistence *)self threadScopeManager];
    uint64_t v15 = [v14 databaseIDForThreadScope:v4];

    id v12 = [(EDThreadPersistence *)self database];
    id v16 = [NSString stringWithUTF8String:"-[EDThreadPersistence beginMigratingThreadScope:]"];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __49__EDThreadPersistence_beginMigratingThreadScope___block_invoke;
    v29[3] = &unk_1E6BFFE38;
    void v29[4] = &v30;
    v29[5] = v15;
    objc_msgSend(v12, "__performWriteWithCaller:usingBlock:", v16, v29);
  }
  if (*((unsigned char *)v31 + 24))
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    uint64_t v17 = (void *)MEMORY[0x1E4F60D40];
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    long long v24 = __49__EDThreadPersistence_beginMigratingThreadScope___block_invoke_2;
    uint64_t v25 = &unk_1E6BFF198;
    objc_copyWeak(&v27, &location);
    id v18 = v4;
    id v26 = v18;
    int v19 = [v17 tokenWithCancelationBlock:&v22];
    uint64_t v20 = v19;
    if (v6)
    {
      objc_msgSend(v19, "addCancelable:", v6, v22, v23, v24, v25);
      os_unfair_lock_lock(&self->_migratingThreadScopesLock);
      [(NSMutableDictionary *)self->_backgroundProcessingAssertionsByMigratingThreadScope setObject:v6 forKeyedSubscript:v18];
      os_unfair_lock_unlock(&self->_migratingThreadScopesLock);
    }

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  else
  {
    if (v6) {
      [v6 cancel];
    }
    uint64_t v20 = 0;
  }
  _Block_object_dispose(&v30, 8);

  return v20;
}

uint64_t __49__EDThreadPersistence_beginMigratingThreadScope___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F60E78] column:@"scope"];
  id v5 = [NSNumber numberWithLongLong:*(void *)(a1 + 40)];
  uint64_t v6 = [v4 equalTo:v5];

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F60E98]) initWithTable:@"threads" where:v6];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 executeDeleteStatement:v7 error:0];
  uint64_t v8 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);

  return v8;
}

void __49__EDThreadPersistence_beginMigratingThreadScope___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138543362;
      uint64_t v6 = v4;
      _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "Migration cancelled or reset for threadscope - %{public}@", (uint8_t *)&v5, 0xCu);
    }

    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 10);
    [*((id *)WeakRetained + 3) removeObject:*(void *)(a1 + 32)];
    [*((id *)WeakRetained + 4) removeObjectForKey:*(void *)(a1 + 32)];
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 10);
  }
}

- (BOOL)endMigratingThreadScope:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(EDThreadPersistence *)self threadScopeManager];
  uint64_t v6 = [v5 databaseIDForThreadScope:v4];

  if (v6 == *MEMORY[0x1E4F5FCC8])
  {
    uint64_t v7 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v4, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[EDThreadPersistence endMigratingThreadScope:]();
    }

    BOOL v8 = 0;
  }
  else
  {
    uint64_t v18 = 0;
    int v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 1;
    id v9 = [(EDThreadPersistence *)self database];
    uint64_t v10 = [NSString stringWithUTF8String:"-[EDThreadPersistence endMigratingThreadScope:]"];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __47__EDThreadPersistence_endMigratingThreadScope___block_invoke;
    void v15[3] = &unk_1E6BFFE38;
    void v15[4] = &v18;
    void v15[5] = v6;
    objc_msgSend(v9, "__performWriteWithCaller:usingBlock:", v10, v15);

    if (*((unsigned char *)v19 + 24))
    {
      BOOL v11 = [(EDThreadPersistence *)self threadScopeManager];
      [v11 setNeedsUpdate:0 forThreadScope:v4];

      id v12 = +[EDThreadPersistence log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        id v17 = v4;
        _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_DEFAULT, "Migration finished for threadscope - %{public}@", buf, 0xCu);
      }

      os_unfair_lock_lock(&self->_migratingThreadScopesLock);
      [(NSMutableArray *)self->_migratingThreadScopes removeObject:v4];
      BOOL v13 = [(NSMutableDictionary *)self->_backgroundProcessingAssertionsByMigratingThreadScope objectForKeyedSubscript:v4];
      [(NSMutableDictionary *)self->_backgroundProcessingAssertionsByMigratingThreadScope removeObjectForKey:v4];
      os_unfair_lock_unlock(&self->_migratingThreadScopesLock);
      [v13 cancel];

      BOOL v8 = *((unsigned char *)v19 + 24) != 0;
    }
    else
    {
      BOOL v8 = 0;
    }
    _Block_object_dispose(&v18, 8);
  }

  return v8;
}

uint64_t __47__EDThreadPersistence_endMigratingThreadScope___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"thread_scopes"];
  [v4 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"needs_update"];
  int v5 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
  uint64_t v6 = [NSNumber numberWithLongLong:*(void *)(a1 + 40)];
  uint64_t v7 = [v5 equalTo:v6];
  [v4 setWhereClause:v7];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 executeUpdateStatement:v4 error:0];
  uint64_t v8 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);

  return v8;
}

- (BOOL)addThreads:(id)a3
{
  id v4 = a3;
  int v5 = [v4 allKeys];
  uint64_t v6 = [v5 firstObject];

  uint64_t v7 = [v6 objectID];
  uint64_t v8 = [v7 threadScope];

  id v9 = [(EDThreadPersistence *)self threadScopeManager];
  uint64_t v10 = [v9 databaseIDForThreadScope:v8];

  BOOL v11 = [(EDThreadPersistence *)self _expressionForThreadScope:v8];
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 1;
  id v12 = [(EDThreadPersistence *)self database];
  BOOL v13 = [NSString stringWithUTF8String:"-[EDThreadPersistence addThreads:]"];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __34__EDThreadPersistence_addThreads___block_invoke;
  void v17[3] = &unk_1E6C00210;
  void v17[4] = self;
  uint64_t v21 = v10;
  id v14 = v11;
  id v18 = v14;
  id v15 = v4;
  id v19 = v15;
  uint64_t v20 = &v22;
  objc_msgSend(v12, "__performWriteWithCaller:usingBlock:", v13, v17);

  LOBYTE(v4) = *((unsigned char *)v23 + 24);
  _Block_object_dispose(&v22, 8);

  return (char)v4;
}

uint64_t __34__EDThreadPersistence_addThreads___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[_EDThreadPersistence_StatementCache alloc] initWithConnection:v3];
  int v5 = [_EDThreadPersistence_ThreadScope alloc];
  uint64_t v6 = [*(id *)(a1 + 32) messagePersistence];
  uint64_t v7 = [(_EDThreadPersistence_ThreadScope *)v5 initWithCache:v4 messagePersistence:v6 threadScopeDatabaseID:*(void *)(a1 + 64) threadScopeExpression:*(void *)(a1 + 40)];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __34__EDThreadPersistence_addThreads___block_invoke_2;
  void v14[3] = &unk_1E6C07180;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  id v15 = v7;
  uint64_t v16 = v9;
  void v14[4] = v8;
  BOOL v11 = v7;
  [v10 enumerateKeysAndObjectsUsingBlock:v14];
  uint64_t v12 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);

  return v12;
}

void __34__EDThreadPersistence_addThreads___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1E0190280]();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __34__EDThreadPersistence_addThreads___block_invoke_3;
  void v16[3] = &unk_1E6C07158;
  void v16[4] = a1[4];
  uint64_t v8 = objc_msgSend(v6, "ef_map:", v16);
  uint64_t v9 = *(void *)(a1[6] + 8);
  if (*(unsigned char *)(v9 + 24))
  {
    uint64_t v10 = (void *)a1[5];
    BOOL v11 = [v5 objectID];
    id v15 = 0;
    LOBYTE(v10) = [v10 createMessagesWithThreadObjectID:v11 wrappedMessages:v8 threadMessages:&v15];
    id v12 = v15;
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = (_BYTE)v10;
  }
  else
  {
    id v12 = 0;
    *(unsigned char *)(v9 + 24) = 0;
  }
  uint64_t v13 = *(void *)(a1[6] + 8);
  if (*(unsigned char *)(v13 + 24))
  {
    char v14 = [v12 addThreadReplacingExisting:1 journaled:0];
    uint64_t v13 = *(void *)(a1[6] + 8);
  }
  else
  {
    char v14 = 0;
  }
  *(unsigned char *)(v13 + 24) = v14;
}

_EDLazyWrappedMessage *__34__EDThreadPersistence_addThreads___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [_EDLazyWrappedMessage alloc];
  id v5 = [*(id *)(a1 + 32) messagePersistence];
  id v6 = [(_EDLazyWrappedMessage *)v4 initWithMessage:v3 messagePersistence:v5];

  return v6;
}

- (BOOL)deleteThreadsWithObjectIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(EDThreadPersistence *)self threadScopeManager];
  id v6 = [v4 firstObject];
  uint64_t v7 = [v6 threadScope];
  uint64_t v8 = [v5 databaseIDForThreadScope:v7];

  uint64_t v9 = objc_msgSend(v4, "ef_map:", &__block_literal_global_490);
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  uint64_t v10 = [(EDThreadPersistence *)self database];
  BOOL v11 = [NSString stringWithUTF8String:"-[EDThreadPersistence deleteThreadsWithObjectIDs:]"];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __50__EDThreadPersistence_deleteThreadsWithObjectIDs___block_invoke_2;
  void v14[3] = &unk_1E6C03068;
  uint64_t v17 = v8;
  id v12 = v9;
  id v15 = v12;
  uint64_t v16 = &v18;
  objc_msgSend(v10, "__performWriteWithCaller:usingBlock:", v11, v14);

  LOBYTE(v9) = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return (char)v9;
}

id __50__EDThreadPersistence_deleteThreadsWithObjectIDs___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v2, "conversationID"));

  return v3;
}

BOOL __50__EDThreadPersistence_deleteThreadsWithObjectIDs___block_invoke_2(void *a1, void *a2)
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F60E78] column:@"scope"];
  id v5 = [NSNumber numberWithLongLong:a1[6]];
  id v6 = [v4 equalTo:v5];

  uint64_t v7 = [MEMORY[0x1E4F60E78] column:@"conversation"];
  uint64_t v8 = [v7 in:a1[4]];

  id v9 = objc_alloc(MEMORY[0x1E4F60E98]);
  id v10 = objc_alloc(MEMORY[0x1E4F60E48]);
  v16[0] = v6;
  v16[1] = v8;
  BOOL v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  id v12 = (void *)[v10 initWithExpressions:v11];
  uint64_t v13 = (void *)[v9 initWithTable:@"threads" where:v12];

  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = [v3 executeDeleteStatement:v13 error:0];
  BOOL v14 = *(unsigned char *)(*(void *)(a1[5] + 8) + 24) != 0;

  return v14;
}

- (id)oldestThreadObjectIDForMailbox:(id)a3 threadScope:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v37 = 0;
  long long v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy__42;
  uint64_t v35 = __Block_byref_object_dispose__42;
  id v36 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__EDThreadPersistence_oldestThreadObjectIDForMailbox_threadScope___block_invoke;
  aBlock[3] = &unk_1E6C071A8;
  uint64_t v30 = &v31;
  id v8 = v7;
  id v29 = v8;
  id v9 = _Block_copy(aBlock);
  id v10 = [(EDThreadPersistence *)self database];
  BOOL v11 = [NSString stringWithUTF8String:"-[EDThreadPersistence oldestThreadObjectIDForMailbox:threadScope:]"];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  void v23[2] = __66__EDThreadPersistence_oldestThreadObjectIDForMailbox_threadScope___block_invoke_3;
  void v23[3] = &unk_1E6C071D0;
  v23[4] = self;
  id v12 = v6;
  id v24 = v12;
  id v13 = v8;
  id v25 = v13;
  id v27 = &v37;
  id v14 = v9;
  id v26 = v14;
  objc_msgSend(v10, "__performReadWithCaller:usingBlock:", v11, v23);

  if (*((unsigned char *)v38 + 24))
  {
    id v15 = [(EDThreadPersistence *)self database];
    uint64_t v16 = [NSString stringWithUTF8String:"-[EDThreadPersistence oldestThreadObjectIDForMailbox:threadScope:]"];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __66__EDThreadPersistence_oldestThreadObjectIDForMailbox_threadScope___block_invoke_4;
    void v19[3] = &unk_1E6C071F8;
    void v19[4] = self;
    id v20 = v12;
    id v21 = v13;
    id v22 = v14;
    objc_msgSend(v15, "__performWriteWithCaller:usingBlock:", v16, v19);
  }
  id v17 = (id)v32[5];

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v17;
}

uint64_t __66__EDThreadPersistence_oldestThreadObjectIDForMailbox_threadScope___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _DWORD v9[2] = __66__EDThreadPersistence_oldestThreadObjectIDForMailbox_threadScope___block_invoke_2;
  void v9[3] = &unk_1E6BFF208;
  long long v8 = *(_OWORD *)(a1 + 32);
  id v5 = (id)v8;
  long long v10 = v8;
  uint64_t v6 = [a2 executeSelectStatement:a3 withBlock:v9 error:0];

  return v6;
}

void __66__EDThreadPersistence_oldestThreadObjectIDForMailbox_threadScope___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 objectAtIndexedSubscript:0];
  uint64_t v4 = [v3 databaseIDValue];

  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F604E0]) initWithConversationID:v4 threadScope:*(void *)(a1 + 32)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

uint64_t __66__EDThreadPersistence_oldestThreadObjectIDForMailbox_threadScope___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _statementForOldestThreadInMailbox:*(void *)(a1 + 40) threadScope:*(void *)(a1 + 48) createMailboxDatabaseIDIfNecessary:0];
  if (v4)
  {
    uint64_t v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v5 = 1;
    *(unsigned char *)(v6 + 24) = 1;
  }

  return v5;
}

uint64_t __66__EDThreadPersistence_oldestThreadObjectIDForMailbox_threadScope___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _statementForOldestThreadInMailbox:*(void *)(a1 + 40) threadScope:*(void *)(a1 + 48) createMailboxDatabaseIDIfNecessary:1];
  if (v4)
  {
    uint64_t v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v6 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __66__EDThreadPersistence_oldestThreadObjectIDForMailbox_threadScope___block_invoke_4_cold_1();
    }

    uint64_t v5 = 1;
  }

  return v5;
}

- (id)_statementForOldestThreadInMailbox:(id)a3 threadScope:(id)a4 createMailboxDatabaseIDIfNecessary:(BOOL)a5
{
  BOOL v5 = a5;
  v33[2] = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v8 = a4;
  id v9 = [(EDThreadPersistence *)self threadScopeManager];
  uint64_t v10 = [v9 databaseIDForThreadScope:v8];

  BOOL v11 = [(EDThreadPersistence *)self messagePersistence];
  id v12 = [v11 mailboxPersistence];
  id v13 = [MEMORY[0x1E4F1CAD0] setWithObject:v31];
  id v14 = [v12 mailboxDatabaseIDsForMailboxObjectIDs:v13 createIfNecessary:v5];
  id v15 = [v14 anyObject];

  if (v15)
  {
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"conversation" table:@"threads"];
    id v17 = [MEMORY[0x1E4F60E78] column:@"scope"];
    uint64_t v18 = [NSNumber numberWithLongLong:v10];
    id v19 = [v17 equalTo:v18];

    id v20 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"thread" table:@"thread_mailboxes"];
    id v21 = [MEMORY[0x1E4F60E78] column:@"mailbox"];
    id v22 = [v21 equalTo:v15];
    [v20 setWhere:v22];

    uint64_t v23 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
    id v24 = [v23 in:v20];

    id v25 = objc_alloc(MEMORY[0x1E4F60E48]);
    v33[0] = v19;
    v33[1] = v24;
    id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
    id v27 = (void *)[v25 initWithExpressions:v26];
    [v16 setWhere:v27];

    id v28 = [MEMORY[0x1E4F60390] sortDescriptorForDateAscending:1];
    uint64_t v32 = v28;
    id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
    [(EDThreadPersistence *)self _addOrderByToThreadSelect:v16 forSortDescriptors:v29];

    [v16 setLimit:1];
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (void)verifyConsistencyOfThreadScope:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(EDThreadPersistence *)self consistencyCheckScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke;
  v7[3] = &unk_1E6BFFAF0;
  void v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 performBlock:v7];
}

void __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) threadScopeManager];
  uint64_t v3 = [v2 databaseIDForThreadScope:*(void *)(a1 + 40)];

  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  id v4 = [*(id *)(a1 + 32) database];
  BOOL v5 = [NSString stringWithUTF8String:"-[EDThreadPersistence verifyConsistencyOfThreadScope:]_block_invoke"];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_2;
  id v14 = &unk_1E6C00008;
  id v17 = &v19;
  uint64_t v18 = v3;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v15 = v6;
  uint64_t v16 = v7;
  objc_msgSend(v4, "__performReadWithCaller:usingBlock:", v5, &v11);

  if (!*((unsigned char *)v20 + 24))
  {
    id v9 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithLongLong:", v3, v11, v12, v13, v14);
    [v9 _resetThreadScope:v8 withDatabaseID:v10];
  }
  _Block_object_dispose(&v19, 8);
}

uint64_t __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_2(uint64_t a1, void *a2)
{
  v72[2] = *MEMORY[0x1E4F143B8];
  id v54 = a2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"conversation" table:@"threads"];
  [v3 addResultColumn:@"display_message"];
  [v3 addResultColumn:@"count"];
  id v4 = [MEMORY[0x1E4F60E78] column:@"display_message"];
  uint64_t v52 = [v4 isNull];

  BOOL v5 = [MEMORY[0x1E4F60E78] column:@"count"];
  uint64_t v6 = [v5 equalTo:&unk_1F35BB198];

  uint64_t v7 = (void *)MEMORY[0x1E4F60ED8];
  v72[0] = v52;
  v72[1] = v6;
  id v50 = (void *)v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:2];
  unint64_t v51 = [v7 combined:v8];

  id v9 = [MEMORY[0x1E4F60E78] column:@"scope"];
  uint64_t v10 = [NSNumber numberWithLongLong:*(void *)(a1 + 56)];
  uint64_t v53 = [v9 equalTo:v10];

  uint64_t v11 = (void *)MEMORY[0x1E4F60E48];
  v71[0] = v53;
  v71[1] = v51;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:2];
  id v13 = [v11 combined:v12];
  [v3 setWhere:v13];

  [v3 setLimit:1];
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x2020000000;
  v67[3] = *MEMORY[0x1E4F5FCC8];
  uint64_t v63 = 0;
  id v64 = &v63;
  uint64_t v65 = 0x2020000000;
  char v66 = 1;
  uint64_t v59 = 0;
  unint64_t v60 = &v59;
  uint64_t v61 = 0x2020000000;
  char v62 = 1;
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_3;
  v58[3] = &unk_1E6C07220;
  void v58[4] = v67;
  v58[5] = &v63;
  uint64_t v14 = *(void *)(a1 + 48);
  v58[6] = &v59;
  v58[7] = v14;
  [v54 executeSelectStatement:v3 withBlock:v58 error:0];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (*((unsigned char *)v64 + 24))
    {
      if (*((unsigned char *)v60 + 24))
      {
        id v31 = +[EDThreadPersistence log];
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          goto LABEL_28;
        }
        objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        uint64_t v32 = v31;
        __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_2_cold_4();
      }
      else
      {
        id v31 = +[EDThreadPersistence log];
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          goto LABEL_28;
        }
        objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        uint64_t v32 = v31;
        __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_2_cold_3();
      }
    }
    else if (*((unsigned char *)v60 + 24))
    {
      id v31 = +[EDThreadPersistence log];
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
      objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      uint64_t v32 = v31;
      __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_2_cold_2();
    }
    else
    {
      id v31 = +[EDThreadPersistence log];
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
      objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      uint64_t v32 = v31;
      __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_2_cold_1();
    }
    id v31 = v32;
    goto LABEL_28;
  }
  id v15 = objc_alloc(MEMORY[0x1E4F60EF8]);
  uint64_t v16 = [MEMORY[0x1E4F60E40] count:0];
  long long v49 = [v15 initWithResult:v16 table:@"threads"];

  [v49 setWhere:v53];
  unint64_t v17 = [v54 countForSelectStatement:v49];
  id v18 = objc_alloc(MEMORY[0x1E4F60EF8]);
  uint64_t v19 = (void *)MEMORY[0x1E4F60E40];
  id v20 = [MEMORY[0x1E4F60E78] column:@"conversation_id"];
  uint64_t v21 = [v19 countDistinct:v20];
  char v22 = +[EDMessagePersistence messagesTableName];
  uint64_t v47 = (void *)[v18 initWithResult:v21 table:v22];

  long long v48 = [*(id *)(a1 + 40) _expressionForThreadScope:*(void *)(a1 + 32)];
  uint64_t v23 = [*(id *)(a1 + 40) _messageIsNotDeletedExpression];
  id v24 = (void *)MEMORY[0x1E4F60E48];
  v70[0] = v48;
  v70[1] = v23;
  uint64_t v46 = (void *)v23;
  id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:2];
  id v26 = [v24 combined:v25];

  [v47 setWhere:v26];
  unint64_t v27 = [v54 countForSelectStatement:v47];
  if (v17 == v27)
  {
    id v28 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      id v29 = objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v29;
      _os_log_impl(&dword_1DB39C000, v28, OS_LOG_TYPE_INFO, "Thread scope is consistent: %{public}@", buf, 0xCu);
    }
    uint64_t v30 = v46;
  }
  else
  {
    uint64_t v33 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      uint64_t v44 = objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
      *(_DWORD *)long long buf = 134218498;
      *(void *)&uint8_t buf[4] = v27;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v17;
      *(_WORD *)&buf[22] = 2114;
      id v69 = v44;
      _os_log_error_impl(&dword_1DB39C000, v33, OS_LOG_TYPE_ERROR, "Thread scope is inconsistent - expected %lu threads but %lu threads exist: %{public}@", buf, 0x20u);
    }
    uint64_t v30 = v46;
    id v28 = [objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"conversation" table:@"threads"];
    [v28 setWhere:v53];
    id v45 = [v54 databaseIDsForSelectStatement:v28];
    id v34 = objc_alloc(MEMORY[0x1E4F60EF8]);
    uint64_t v35 = +[EDMessagePersistence messagesTableName];
    id v36 = (void *)[v34 initWithResultColumn:@"conversation_id" table:v35];

    [v36 setWhere:v26];
    uint64_t v37 = [v54 databaseIDsForSelectStatement:v36];
    long long v38 = *(void **)(a1 + 40);
    if (v17 <= v27)
    {
      uint64_t v39 = [v38 _int64SetFromSet:v37 byRemovingIndexesFromSet:v45 andLimitingTo:50];
      char v40 = +[EDThreadPersistence log];
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        [v39 commaSeparatedString];
        objc_claimAutoreleasedReturnValue();
        __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_2_cold_6();
      }
    }
    else
    {
      uint64_t v39 = [v38 _int64SetFromSet:v45 byRemovingIndexesFromSet:v37 andLimitingTo:50];
      char v40 = +[EDThreadPersistence log];
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        [v39 commaSeparatedString];
        objc_claimAutoreleasedReturnValue();
        __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_2_cold_5();
      }
    }

    uint64_t v41 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:10];
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    id v69 = 0;
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_492;
    v55[3] = &unk_1E6C07248;
    id v42 = v41;
    id v56 = v42;
    id v57 = buf;
    [v39 enumerateIndexesUsingBlock:v55];
    [*(id *)(a1 + 40) _logFailedVerifyConsistencyForConversationIDs:v42];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;

    _Block_object_dispose(buf, 8);
  }

  id v31 = v49;
LABEL_28:

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(v67, 8);

  return 1;
}

void __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_3(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  uint64_t v6 = [v11 objectForKeyedSubscript:@"conversation"];
  *(void *)(*(void *)(a1[4] + 8) + 24) = [v6 databaseIDValue];

  uint64_t v7 = [v11 objectForKeyedSubscript:@"display_message"];
  uint64_t v8 = [v7 objectValue];

  if (!v8) {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
  }
  id v9 = [v11 objectForKeyedSubscript:@"count"];
  uint64_t v10 = [v9 integerValue];

  if (!v10) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 0;
  *a4 = 1;
}

void __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_492(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  BOOL v5 = *(void **)(a1 + 32);
  uint64_t v6 = [NSNumber numberWithLongLong:a2];
  [v5 addObject:v6];

  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void *)(v7 + 24);
  *(void *)(v7 + 24) = v8 + 1;
  if (v8 >= 9) {
    *a3 = 1;
  }
}

- (void)_logFailedVerifyConsistencyForConversationIDs:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  BOOL v5 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[EDThreadPersistence _logFailedVerifyConsistencyForConversationIDs:]();
  }

  uint64_t v6 = [(EDThreadPersistence *)self messagePersistence];
  uint64_t v21 = [v6 persistedMessageIDsForMessagesForConversationIDs:v20];

  uint64_t v7 = [(EDThreadPersistence *)self messagePersistence];
  uint64_t v8 = [v7 persistedMessagesForDatabaseIDs:v21 requireProtectedData:0 temporarilyUnavailableDatabaseIDs:0];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v39 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v24;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v23 + 1) + 8 * v11);
        id v13 = +[EDThreadPersistence log];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          uint64_t v14 = [v12 globalMessageID];
          uint64_t v15 = [v12 conversationID];
          uint64_t v16 = [v12 displayDate];
          unint64_t v17 = [v12 dateReceived];
          id v18 = [v12 readLater];
          uint64_t v19 = [v12 followUp];
          *(_DWORD *)long long buf = 134219266;
          uint64_t v28 = v14;
          __int16 v29 = 2048;
          uint64_t v30 = v15;
          __int16 v31 = 2114;
          uint64_t v32 = v16;
          __int16 v33 = 2114;
          id v34 = v17;
          __int16 v35 = 2114;
          id v36 = v18;
          __int16 v37 = 2114;
          long long v38 = v19;
          _os_log_error_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_ERROR, "\tmessage globalMessageID:%lld, conversationID:%lld, displayDate:%{public}@, dateReceived:%{public}@, readLater:%{public}@, followUp:%{public}@", buf, 0x3Eu);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v39 count:16];
    }
    while (v9);
  }
}

- (id)_int64SetFromSet:(id)a3 byRemovingIndexesFromSet:(id)a4 andLimitingTo:(unint64_t)a5
{
  id v7 = a4;
  uint64_t v8 = (void *)[a3 mutableCopy];
  [v8 removeIndexes:v7];
  uint64_t v9 = objc_msgSend(v8, "lowestIndexesInRange:maxCount:", *MEMORY[0x1E4F60CE0], *(void *)(MEMORY[0x1E4F60CE0] + 8), a5);

  return v9;
}

- (BOOL)_addThreadScopeToDatabase:(id)a3 needsUpdate:(BOOL)a4 lastViewedDate:(id)a5 updateThreadScopeManager:(BOOL)a6
{
  id v11 = a3;
  id v12 = a5;
  uint64_t v25 = 0;
  long long v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  id v13 = [(EDThreadPersistence *)self database];
  uint64_t v14 = [NSString stringWithUTF8String:"-[EDThreadPersistence _addThreadScopeToDatabase:needsUpdate:lastViewedDate:updateThreadScopeManager:]"];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __101__EDThreadPersistence__addThreadScopeToDatabase_needsUpdate_lastViewedDate_updateThreadScopeManager___block_invoke;
  void v18[3] = &unk_1E6C07270;
  void v18[4] = self;
  id v15 = v11;
  id v19 = v15;
  uint64_t v21 = &v25;
  BOOL v23 = a4;
  id v16 = v12;
  id v20 = v16;
  SEL v22 = a2;
  BOOL v24 = a6;
  objc_msgSend(v13, "__performWriteWithCaller:usingBlock:", v14, v18);

  LOBYTE(v11) = *((unsigned char *)v26 + 24);
  _Block_object_dispose(&v25, 8);

  return (char)v11;
}

BOOL __101__EDThreadPersistence__addThreadScopeToDatabase_needsUpdate_lastViewedDate_updateThreadScopeManager___block_invoke(uint64_t a1, void *a2)
{
  void v19[4] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v19[0] = 0;
  id v4 = [*(id *)(a1 + 32) _mailboxScopeForThreadScope:*(void *)(a1 + 40) andFilterPredicate:v19];
  BOOL v5 = [v4 mailboxTypes];
  uint64_t v6 = [v5 anyObject];

  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) _addThreadScopeToDatabaseWithMailboxType:v6 filterPredicate:v19[0] needsUpdate:*(unsigned __int8 *)(a1 + 72) lastViewedDate:*(void *)(a1 + 48) connection:v3];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      id v7 = [*(id *)(a1 + 32) threadScopeManager];
      objc_msgSend(v7, "addThreadScope:withDatabaseID:needsUpdate:lastViewedDate:", *(void *)(a1 + 40), objc_msgSend(v3, "lastInsertedDatabaseID"), *(unsigned __int8 *)(a1 + 72), *(void *)(a1 + 48));
    }
    else
    {
      id v15 = +[EDThreadPersistence log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        __101__EDThreadPersistence__addThreadScopeToDatabase_needsUpdate_lastViewedDate_updateThreadScopeManager___block_invoke_cold_1();
      }

      id v7 = [*(id *)(a1 + 32) threadScopeManager];
      [v7 logExistingThreadScopes];
    }
  }
  else
  {
    id v7 = [v4 mailboxObjectIDs];
    uint64_t v8 = [*(id *)(a1 + 32) messagePersistence];
    uint64_t v9 = [v8 mailboxPersistence];
    uint64_t v10 = [v9 mailboxDatabaseIDsForMailboxObjectIDs:v7 createIfNecessary:1];
    id v11 = [v10 anyObject];
    uint64_t v12 = [v11 longLongValue];

    if (v12 == *MEMORY[0x1E4F5FCC8])
    {
      id v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"EDThreadPersistence.m" lineNumber:3491 description:@"No mailbox database ID for migrating thread scope"];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) _addThreadScopeToDatabase:*(void *)(a1 + 40) withMailboxDatabaseID:v12 filterPredicate:v19[0] needsUpdate:*(unsigned __int8 *)(a1 + 72) lastViewedDate:*(void *)(a1 + 48) updateThreadScopeManager:*(unsigned __int8 *)(a1 + 73) connection:v3];
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      id v13 = +[EDThreadPersistence log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        __101__EDThreadPersistence__addThreadScopeToDatabase_needsUpdate_lastViewedDate_updateThreadScopeManager___block_invoke_cold_1();
      }

      uint64_t v14 = [*(id *)(a1 + 32) threadScopeManager];
      [v14 logExistingThreadScopes];
    }
  }

  BOOL v16 = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) != 0;
  return v16;
}

- (id)_mailboxScopeForThreadScope:(id)a3 andFilterPredicate:(unint64_t *)a4
{
  id v6 = a3;
  id v7 = [(EDThreadPersistence *)self messagePersistence];
  uint64_t v8 = [v7 mailboxPersistence];
  uint64_t v9 = [v8 mailboxProvider];

  unint64_t v13 = 0;
  uint64_t v10 = [(EDThreadPersistence *)self threadScopeManager];
  id v11 = [v10 precomputedMailboxScopeForThreadScope:v6 mailboxTypeResolver:v9 foundPredicates:&v13];

  if (a4) {
    *a4 = v13;
  }

  return v11;
}

- (BOOL)_addThreadScopeToDatabaseWithMailboxType:(id)a3 filterPredicate:(unint64_t)a4 needsUpdate:(BOOL)a5 lastViewedDate:(id)a6 connection:(id)a7
{
  uint64_t v9 = a5;
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F60EC0]) initWithTable:@"thread_scopes"];
  [v14 setObject:v11 forKeyedSubscript:@"mailbox_type"];
  id v15 = [NSNumber numberWithUnsignedInteger:a4];
  [v14 setObject:v15 forKeyedSubscript:@"filter_predicate"];

  BOOL v16 = [NSNumber numberWithBool:v9];
  [v14 setObject:v16 forKeyedSubscript:@"needs_update"];

  [v14 setObject:v12 forKeyedSubscript:@"last_viewed"];
  LOBYTE(v9) = [v13 executeInsertStatement:v14 error:0];

  return v9;
}

- (BOOL)_addThreadScopeToDatabase:(id)a3 withMailboxDatabaseID:(int64_t)a4 filterPredicate:(unint64_t)a5 needsUpdate:(BOOL)a6 lastViewedDate:(id)a7 updateThreadScopeManager:(BOOL)a8 connection:(id)a9
{
  BOOL v9 = a8;
  BOOL v11 = a6;
  id v15 = a3;
  id v16 = a7;
  id v17 = a9;
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F60EC0]) initWithTable:@"thread_scopes"];
  id v19 = [NSNumber numberWithLongLong:a4];
  [v18 setObject:v19 forKeyedSubscript:@"mailbox"];

  id v20 = [NSNumber numberWithUnsignedInteger:a5];
  [v18 setObject:v20 forKeyedSubscript:@"filter_predicate"];

  uint64_t v21 = [NSNumber numberWithBool:v11];
  [v18 setObject:v21 forKeyedSubscript:@"needs_update"];

  [v18 setObject:v16 forKeyedSubscript:@"last_viewed"];
  uint64_t v25 = 0;
  int v22 = [v17 executeInsertStatement:v18 rowsChanged:&v25];
  if (v22 && v25 && v9)
  {
    BOOL v23 = [(EDThreadPersistence *)self threadScopeManager];
    objc_msgSend(v23, "addThreadScope:withDatabaseID:needsUpdate:lastViewedDate:", v15, objc_msgSend(v17, "lastInsertedDatabaseID"), v11, v16);
  }
  return v22;
}

- (BOOL)addThreadScopeToDatabase:(id)a3 needsUpdate:(BOOL)a4 lastViewedDate:(id)a5
{
  return [(EDThreadPersistence *)self _addThreadScopeToDatabase:a3 needsUpdate:a4 lastViewedDate:a5 updateThreadScopeManager:0];
}

- (id)statisticsForThreadScopesWithDatabaseIDs:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = [(EDThreadPersistence *)self threadScopeManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _DWORD v9[2] = __64__EDThreadPersistence_statisticsForThreadScopesWithDatabaseIDs___block_invoke;
  void v9[3] = &unk_1E6C07298;
  id v7 = v5;
  id v10 = v7;
  [(EDThreadPersistence *)self threadScopeManager:v6 gatherStatisticsForThreadScopesWithDatabaseIDs:v4 block:v9];

  return v7;
}

void __64__EDThreadPersistence_statisticsForThreadScopesWithDatabaseIDs___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v12 = a3;
  id v7 = (void *)MEMORY[0x1E4F60DF0];
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:a4];
  BOOL v9 = [v7 pairWithFirst:v12 second:v8];
  id v10 = *(void **)(a1 + 32);
  BOOL v11 = [NSNumber numberWithLongLong:a2];
  [v10 setObject:v9 forKeyedSubscript:v11];
}

- (BOOL)threadScopeManager:(id)a3 mailboxScopeExists:(id)a4
{
  id v5 = a4;
  id v6 = [(EDThreadPersistence *)self messagePersistence];
  id v7 = [v6 mailboxPersistence];
  uint64_t v8 = [v5 mailboxObjectIDs];
  BOOL v9 = [v7 mailboxDatabaseIDsForMailboxObjectIDs:v8 createIfNecessary:0];
  BOOL v10 = [v9 count] != 0;

  return v10;
}

- (BOOL)threadScopeManager:(id)a3 isValidMailboxObjectID:(id)a4
{
  id v5 = a4;
  id v6 = [(EDThreadPersistence *)self messagePersistence];
  id v7 = [v6 mailboxPersistence];
  uint64_t v8 = [v7 legacyMailboxForObjectID:v5];

  return v8 != 0;
}

- (void)threadScopeManager:(id)a3 populateThreadScopesWithBlock:(id)a4
{
  id v6 = a4;
  id v7 = [(EDThreadPersistence *)self database];
  uint64_t v8 = [NSString stringWithUTF8String:"-[EDThreadPersistence threadScopeManager:populateThreadScopesWithBlock:]"];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __72__EDThreadPersistence_threadScopeManager_populateThreadScopesWithBlock___block_invoke;
  void v10[3] = &unk_1E6C072E8;
  SEL v12 = a2;
  void v10[4] = self;
  id v9 = v6;
  id v11 = v9;
  objc_msgSend(v7, "__performReadWithCaller:usingBlock:", v8, v10);
}

uint64_t __72__EDThreadPersistence_threadScopeManager_populateThreadScopesWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F60EF8]);
  uint64_t v5 = *MEMORY[0x1E4F60D08];
  id v6 = (void *)[v4 initWithResultColumn:*MEMORY[0x1E4F60D08] table:@"thread_scopes"];
  id v7 = +[EDPersistenceDatabaseSchema mailboxesTableName];
  uint64_t v8 = [v6 leftOuterJoin:v7 sourceColumn:@"mailbox" targetColumn:v5];

  [v6 addResultColumn:@"needs_update"];
  [v8 addResultColumn:@"url"];
  [v6 addResultColumn:@"mailbox_type"];
  [v6 addResultColumn:@"filter_predicate"];
  [v6 addResultColumn:@"last_viewed"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __72__EDThreadPersistence_threadScopeManager_populateThreadScopesWithBlock___block_invoke_2;
  void v13[3] = &unk_1E6C072C0;
  void v13[4] = *(void *)(a1 + 32);
  long long v12 = *(_OWORD *)(a1 + 40);
  id v9 = (id)v12;
  long long v14 = v12;
  uint64_t v10 = [v3 executeSelectStatement:v6 withBlock:v13 error:0];

  return v10;
}

void __72__EDThreadPersistence_threadScopeManager_populateThreadScopesWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F60D08]];
  uint64_t v26 = [v4 databaseIDValue];

  uint64_t v5 = [v3 objectForKeyedSubscript:@"url"];
  id v6 = [v5 stringValue];

  id v7 = [v3 objectForKeyedSubscript:@"mailbox_type"];
  char v28 = [v7 numberValue];

  uint64_t v8 = [v3 objectForKeyedSubscript:@"filter_predicate"];
  id v9 = [v8 numberValue];
  uint64_t v10 = [v9 unsignedIntegerValue];

  id v11 = [v3 objectForKeyedSubscript:@"needs_update"];
  long long v12 = [v11 numberValue];
  [v12 BOOLValue];

  id v13 = [v3 objectForKeyedSubscript:@"last_viewed"];
  uint64_t v27 = [v13 dateValue];

  if ((v6 != 0) == (v28 != 0))
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"EDThreadPersistence.m" lineNumber:3582 description:@"Pre-computed thread scope should have exactly one mailbox or mailbox type"];

    if (v6) {
      goto LABEL_3;
    }
LABEL_5:
    id v20 = (void *)MEMORY[0x1E4F60318];
    __int16 v29 = v28;
    long long v14 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v29, 1, v26);
    id v18 = [v20 mailboxScopeForMailboxTypes:v14 forExclusion:0];
    goto LABEL_6;
  }
  if (!v6) {
    goto LABEL_5;
  }
LABEL_3:
  long long v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v6];
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F60310]) initWithURL:v14];
  id v16 = (void *)MEMORY[0x1E4F60318];
  v30[0] = v15;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  id v18 = [v16 mailboxScopeForMailboxObjectIDs:v17 forExclusion:0];

LABEL_6:
  uint64_t v21 = [*(id *)(a1 + 32) threadScopeManager];
  int v22 = [*(id *)(a1 + 32) messagePersistence];
  BOOL v23 = [v22 mailboxPersistence];
  BOOL v24 = [v23 mailboxProvider];
  uint64_t v25 = [v21 threadScopeFromPrecomputedMailboxScope:v18 predicates:v10 mailboxProvider:v24];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)threadScopeManager:(id)a3 gatherStatisticsForThreadScopesWithDatabaseIDs:(id)a4 block:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(EDThreadPersistence *)self database];
  uint64_t v10 = [NSString stringWithUTF8String:"-[EDThreadPersistence threadScopeManager:gatherStatisticsForThreadScopesWithDatabaseIDs:block:]"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __95__EDThreadPersistence_threadScopeManager_gatherStatisticsForThreadScopesWithDatabaseIDs_block___block_invoke;
  void v13[3] = &unk_1E6C064B8;
  id v11 = v7;
  id v14 = v11;
  id v15 = self;
  id v12 = v8;
  id v16 = v12;
  objc_msgSend(v9, "__performReadWithCaller:usingBlock:", v10, v13);
}

uint64_t __95__EDThreadPersistence_threadScopeManager_gatherStatisticsForThreadScopesWithDatabaseIDs_block___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _DWORD v9[2] = __95__EDThreadPersistence_threadScopeManager_gatherStatisticsForThreadScopesWithDatabaseIDs_block___block_invoke_2;
  void v9[3] = &unk_1E6C07338;
  id v12 = &v13;
  id v4 = (void *)a1[4];
  uint64_t v5 = (void *)a1[6];
  void v9[4] = a1[5];
  id v10 = v3;
  id v11 = v5;
  id v6 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];
  uint64_t v7 = *((unsigned __int8 *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __95__EDThreadPersistence_threadScopeManager_gatherStatisticsForThreadScopesWithDatabaseIDs_block___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  uint64_t v25 = [*(id *)(a1 + 32) _expressionForThreadScope:v7];
  id v9 = [MEMORY[0x1E4F60E78] column:@"last_viewed"];
  id v10 = [MEMORY[0x1E4F60E78] column:@"date_received"];
  id v11 = [v10 greaterThan:v9];
  BOOL v24 = a4;
  id v12 = objc_alloc(MEMORY[0x1E4F60EF8]);
  uint64_t v13 = [MEMORY[0x1E4F60E40] count:0];
  id v14 = +[EDMessagePersistence messagesTableName];
  uint64_t v15 = (void *)[v12 initWithResult:v13 table:v14];

  id v16 = objc_alloc(MEMORY[0x1E4F60E48]);
  v29[0] = v25;
  v29[1] = v11;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  id v18 = (void *)[v16 initWithExpressions:v17];
  [v15 setWhere:v18];

  id v19 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"last_viewed" table:@"thread_scopes"];
  [v19 addResult:v15 alias:@"count"];
  id v20 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
  uint64_t v21 = [v20 equalTo:v8];
  [v19 setWhere:v21];

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __95__EDThreadPersistence_threadScopeManager_gatherStatisticsForThreadScopesWithDatabaseIDs_block___block_invoke_3;
  v26[3] = &unk_1E6C07310;
  int v22 = *(void **)(a1 + 40);
  id v28 = *(id *)(a1 + 48);
  id v23 = v8;
  id v27 = v23;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v22 executeSelectStatement:v19 withBlock:v26 error:0];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    unsigned char *v24 = 1;
  }
}

void __95__EDThreadPersistence_threadScopeManager_gatherStatisticsForThreadScopesWithDatabaseIDs_block___block_invoke_3(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 32) longLongValue];
  uint64_t v5 = [v9 objectForKeyedSubscript:@"last_viewed"];
  id v6 = [v5 dateValue];
  id v7 = [v9 objectForKeyedSubscript:@"count"];
  id v8 = [v7 numberValue];
  (*(void (**)(uint64_t, uint64_t, void *, uint64_t))(v3 + 16))(v3, v4, v6, [v8 unsignedIntegerValue]);
}

- (BOOL)threadScopeManager:(id)a3 evictThreadScopesWithDatabaseIDs:(id)a4 completionBlock:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v9 = [(EDThreadPersistence *)self database];
  id v10 = [NSString stringWithUTF8String:"-[EDThreadPersistence threadScopeManager:evictThreadScopesWithDatabaseIDs:completionBlock:]"];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __91__EDThreadPersistence_threadScopeManager_evictThreadScopesWithDatabaseIDs_completionBlock___block_invoke;
  void v14[3] = &unk_1E6C07360;
  id v11 = v7;
  id v15 = v11;
  id v17 = &v18;
  id v12 = v8;
  id v16 = v12;
  objc_msgSend(v9, "__performWriteWithCaller:usingBlock:", v10, v14);

  LOBYTE(v7) = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return (char)v7;
}

uint64_t __91__EDThreadPersistence_threadScopeManager_evictThreadScopesWithDatabaseIDs_completionBlock___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
  uint64_t v5 = [v4 in:a1[4]];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F60E98]) initWithTable:@"thread_scopes" where:v5];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v3 executeDeleteStatement:v6 error:0];
  (*(void (**)(void))(a1[5] + 16))();
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);

  return v7;
}

- (EDPersistenceHookRegistry)hookRegistry
{
  return self->_hookRegistry;
}

- (EFScheduler)consistencyCheckScheduler
{
  return self->_consistencyCheckScheduler;
}

- (EDCategoryPersistence)categoryPersistence
{
  return self->_categoryPersistence;
}

- (EFScheduler)threadRecomputationScheduler
{
  return self->_threadRecomputationScheduler;
}

- (void)setThreadRecomputationScheduler:(id)a3
{
}

- (EFDebouncer)threadRecomputationDebouncer
{
  return self->_threadRecomputationDebouncer;
}

- (void)setThreadRecomputationDebouncer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadRecomputationDebouncer, 0);
  objc_storeStrong((id *)&self->_threadRecomputationScheduler, 0);
  objc_storeStrong((id *)&self->_categoryPersistence, 0);
  objc_storeStrong((id *)&self->_consistencyCheckScheduler, 0);
  objc_storeStrong((id *)&self->_threadScopeManager, 0);
  objc_storeStrong((id *)&self->_blockedSenderManager, 0);
  objc_storeStrong((id *)&self->_vipManager, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_backgroundProcessingAssertionsByMigratingThreadScope, 0);
  objc_storeStrong((id *)&self->_migratingThreadScopes, 0);

  objc_storeStrong((id *)&self->_threadObjectIDsToRecompute, 0);
}

id __55___EDThreadPersistence_ThreadMessages_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(v2, "databaseID"));

  return v3;
}

void __76___EDThreadPersistence_ThreadMessages_addThreadReplacingExisting_journaled___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) thread];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "threadScopeDatabaseID"));
  [v3 setObject:v5 forKeyedSubscript:@":scope"];

  id v6 = NSNumber;
  uint64_t v7 = [v4 objectID];
  id v8 = objc_msgSend(v6, "numberWithLongLong:", objc_msgSend(v7, "conversationID"));
  [v3 setObject:v8 forKeyedSubscript:@":conversation_id"];

  id v9 = *(void **)(a1 + 32);
  id v72 = 0;
  id v10 = [v9 _displayWrappedMessageWithNewestReadWrappedMessage:&v72];
  id v11 = v72;
  id v12 = v11;
  if (v11) {
    objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v11, "databaseID"));
  }
  else {
  uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  [v3 setObject:v13 forKeyedSubscript:@":newest_read_message"];

  id v14 = [*(id *)(a1 + 32) wrappedMessages];
  id v15 = [v14 firstObject];

  if (v15) {
    objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v15, "databaseID"));
  }
  else {
  id v16 = [MEMORY[0x1E4F1CA98] null];
  }
  [v3 setObject:v16 forKeyedSubscript:@":newest_message"];

  id v17 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v10, "databaseID"));
  [v3 setObject:v17 forKeyedSubscript:@":display_message"];

  uint64_t v18 = [v4 date];
  [v3 setObject:v18 forKeyedSubscript:@":date"];

  id v19 = [v4 displayDate];
  [v3 setObject:v19 forKeyedSubscript:@":display_date"];

  uint64_t v20 = [v4 readLater];
  char v21 = [v20 date];
  int v22 = v21;
  if (!v21)
  {
    int v22 = [MEMORY[0x1E4F1CA98] null];
  }
  [v3 setObject:v22 forKeyedSubscript:@":read_later_date"];
  if (!v21) {

  }
  id v23 = NSNumber;
  BOOL v24 = [v4 flags];
  uint64_t v25 = objc_msgSend(v23, "numberWithBool:", objc_msgSend(v24, "read"));
  [v3 setObject:v25 forKeyedSubscript:@":read"];

  uint64_t v26 = NSNumber;
  id v27 = [v4 flags];
  id v28 = objc_msgSend(v26, "numberWithBool:", objc_msgSend(v27, "flagged"));
  [v3 setObject:v28 forKeyedSubscript:@":flagged"];

  __int16 v29 = NSNumber;
  uint64_t v30 = [v4 flagColors];
  __int16 v31 = objc_msgSend(v29, "numberWithBool:", objc_msgSend(v30, "containsIndex:", 0));
  [v3 setObject:v31 forKeyedSubscript:@":has_Red_flag"];

  uint64_t v32 = NSNumber;
  __int16 v33 = [v4 flagColors];
  id v34 = objc_msgSend(v32, "numberWithBool:", objc_msgSend(v33, "containsIndex:", 1));
  [v3 setObject:v34 forKeyedSubscript:@":has_Orange_flag"];

  __int16 v35 = NSNumber;
  id v36 = [v4 flagColors];
  __int16 v37 = objc_msgSend(v35, "numberWithBool:", objc_msgSend(v36, "containsIndex:", 2));
  [v3 setObject:v37 forKeyedSubscript:@":has_Yellow_flag"];

  long long v38 = NSNumber;
  uint64_t v39 = [v4 flagColors];
  uint64_t v40 = objc_msgSend(v38, "numberWithBool:", objc_msgSend(v39, "containsIndex:", 3));
  [v3 setObject:v40 forKeyedSubscript:@":has_Green_flag"];

  uint64_t v41 = NSNumber;
  id v42 = [v4 flagColors];
  long long v43 = objc_msgSend(v41, "numberWithBool:", objc_msgSend(v42, "containsIndex:", 4));
  [v3 setObject:v43 forKeyedSubscript:@":has_Blue_flag"];

  uint64_t v44 = NSNumber;
  id v45 = [v4 flagColors];
  uint64_t v46 = objc_msgSend(v44, "numberWithBool:", objc_msgSend(v45, "containsIndex:", 5));
  [v3 setObject:v46 forKeyedSubscript:@":has_Purple_flag"];

  uint64_t v47 = NSNumber;
  long long v48 = [v4 flagColors];
  long long v49 = objc_msgSend(v47, "numberWithBool:", objc_msgSend(v48, "containsIndex:", 6));
  [v3 setObject:v49 forKeyedSubscript:@":has_Gray_flag"];

  id v50 = NSNumber;
  unint64_t v51 = [v4 flags];
  uint64_t v52 = objc_msgSend(v50, "numberWithBool:", objc_msgSend(v51, "draft"));
  [v3 setObject:v52 forKeyedSubscript:@":draft"];

  uint64_t v53 = NSNumber;
  id v54 = [v4 flags];
  id v55 = objc_msgSend(v53, "numberWithBool:", objc_msgSend(v54, "replied"));
  [v3 setObject:v55 forKeyedSubscript:@":replied"];

  id v56 = NSNumber;
  id v57 = [v4 flags];
  id v58 = objc_msgSend(v56, "numberWithBool:", objc_msgSend(v57, "forwarded"));
  [v3 setObject:v58 forKeyedSubscript:@":forwarded"];

  uint64_t v59 = NSNumber;
  unint64_t v60 = [v4 flags];
  uint64_t v61 = objc_msgSend(v59, "numberWithBool:", objc_msgSend(v60, "redirected"));
  [v3 setObject:v61 forKeyedSubscript:@":redirected"];

  char v62 = NSNumber;
  uint64_t v63 = [v4 flags];
  id v64 = objc_msgSend(v62, "numberWithBool:", objc_msgSend(v63, "junkLevelSetByUser"));
  [v3 setObject:v64 forKeyedSubscript:@":junk_level_set_by_user"];

  uint64_t v65 = NSNumber;
  char v66 = [v4 flags];
  id v67 = objc_msgSend(v65, "numberWithUnsignedInteger:", objc_msgSend(v66, "junkLevel"));
  [v3 setObject:v67 forKeyedSubscript:@":junk_level"];

  id v68 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "hasUnflagged"));
  [v3 setObject:v68 forKeyedSubscript:@":has_unflagged"];

  id v69 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "hasAttachments"));
  [v3 setObject:v69 forKeyedSubscript:@":has_attachments"];

  id v70 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  [v3 setObject:v70 forKeyedSubscript:@":count"];

  id v71 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  [v3 setObject:v71 forKeyedSubscript:@":journaled"];
}

void __76___EDThreadPersistence_ThreadMessages_addThreadReplacingExisting_journaled___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v3, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __76___EDThreadPersistence_ThreadMessages_addThreadReplacingExisting_journaled___block_invoke_2_cold_1();
  }

  if ([v3 code] == 19)
  {
    [*(id *)(a1 + 32) _collectDebuggingInfo];
    id v5 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"SQLITE_CONSTRAINT" reason:0 userInfo:0];
    objc_exception_throw(v5);
  }
}

void __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_2_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_133(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    [v3 objectForKeyedSubscript:@"ROWID"];
    [(id)objc_claimAutoreleasedReturnValue() stringValue];
    objc_claimAutoreleasedReturnValue();
    __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_133_cold_1();
  }

  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

void __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_141(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = NSNumber;
  uint64_t v4 = [*(id *)(a1 + 32) objectID];
  uint64_t v5 = objc_msgSend(v3, "numberWithLongLong:", objc_msgSend(v4, "conversationID"));
  [v6 setObject:v5 forKeyedSubscript:@":conversation_id"];
}

void __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_2_142(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_2_142_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_145(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    [v3 objectForKeyedSubscript:@"conversation_id"];
    [(id)objc_claimAutoreleasedReturnValue() stringValue];
    objc_claimAutoreleasedReturnValue();
    __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_145_cold_1();
  }

  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

void __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_152(id *a1, void *a2)
{
  id v6 = a2;
  if (a1[4]) {
    objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(a1[4], "databaseID"));
  }
  else {
  id v3 = [MEMORY[0x1E4F1CA98] null];
  }
  [v6 setObject:v3 forKeyedSubscript:@":newest_read_message"];

  if (a1[5]) {
    objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(a1[5], "databaseID"));
  }
  else {
  uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  }
  [v6 setObject:v4 forKeyedSubscript:@":newest_message"];

  uint64_t v5 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(a1[6], "databaseID"));
  [v6 setObject:v5 forKeyedSubscript:@":display_message"];
}

void __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_2_153(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_2_153_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_156(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    [v3 objectForKeyedSubscript:@"ROWID"];
    [(id)objc_claimAutoreleasedReturnValue() stringValue];
    objc_claimAutoreleasedReturnValue();
    __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_156_cold_1();
  }

  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

void __70___EDThreadPersistence_ThreadMessages_updateThreadTableWithJournaled___block_invoke(uint64_t a1, void *a2)
{
  id v65 = a2;
  id v3 = [*(id *)(a1 + 32) thread];
  uint64_t v4 = [NSNumber numberWithLongLong:*(void *)(a1 + 40)];
  [v65 setObject:v4 forKeyedSubscript:@":conversation_id"];

  uint64_t v5 = [*(id *)(a1 + 32) thread];
  uint64_t v6 = [v5 date];
  [v65 setObject:v6 forKeyedSubscript:@":date"];

  uint64_t v7 = [*(id *)(a1 + 32) thread];
  uint64_t v8 = [v7 displayDate];
  [v65 setObject:v8 forKeyedSubscript:@":display_date"];

  uint64_t v9 = [v3 readLater];
  id v10 = [v9 date];
  id v11 = v10;
  if (!v10)
  {
    id v11 = [MEMORY[0x1E4F1CA98] null];
  }
  [v65 setObject:v11 forKeyedSubscript:@":read_later_date"];
  if (!v10) {

  }
  id v12 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "threadScopeDatabaseID"));
  [v65 setObject:v12 forKeyedSubscript:@":scope"];

  uint64_t v13 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  [v65 setObject:v13 forKeyedSubscript:@":journaled"];

  id v14 = NSNumber;
  id v15 = [*(id *)(a1 + 32) thread];
  id v16 = objc_msgSend(v14, "numberWithBool:", objc_msgSend(v15, "hasUnflagged"));
  [v65 setObject:v16 forKeyedSubscript:@":has_unflagged"];

  id v17 = NSNumber;
  uint64_t v18 = [*(id *)(a1 + 32) thread];
  id v19 = objc_msgSend(v17, "numberWithBool:", objc_msgSend(v18, "hasAttachments"));
  [v65 setObject:v19 forKeyedSubscript:@":has_attachments"];

  uint64_t v20 = NSNumber;
  char v21 = [v3 flags];
  int v22 = objc_msgSend(v20, "numberWithBool:", objc_msgSend(v21, "read"));
  [v65 setObject:v22 forKeyedSubscript:@":read"];

  id v23 = NSNumber;
  BOOL v24 = [v3 flags];
  uint64_t v25 = objc_msgSend(v23, "numberWithBool:", objc_msgSend(v24, "flagged"));
  [v65 setObject:v25 forKeyedSubscript:@":flagged"];

  uint64_t v26 = NSNumber;
  id v27 = [v3 flags];
  id v28 = objc_msgSend(v26, "numberWithBool:", objc_msgSend(v27, "draft"));
  [v65 setObject:v28 forKeyedSubscript:@":draft"];

  __int16 v29 = NSNumber;
  uint64_t v30 = [v3 flags];
  __int16 v31 = objc_msgSend(v29, "numberWithBool:", objc_msgSend(v30, "replied"));
  [v65 setObject:v31 forKeyedSubscript:@":replied"];

  uint64_t v32 = NSNumber;
  __int16 v33 = [v3 flags];
  id v34 = objc_msgSend(v32, "numberWithBool:", objc_msgSend(v33, "forwarded"));
  [v65 setObject:v34 forKeyedSubscript:@":forwarded"];

  __int16 v35 = NSNumber;
  id v36 = [v3 flags];
  __int16 v37 = objc_msgSend(v35, "numberWithBool:", objc_msgSend(v36, "redirected"));
  [v65 setObject:v37 forKeyedSubscript:@":redirected"];

  long long v38 = NSNumber;
  uint64_t v39 = [v3 flags];
  uint64_t v40 = objc_msgSend(v38, "numberWithBool:", objc_msgSend(v39, "junkLevelSetByUser"));
  [v65 setObject:v40 forKeyedSubscript:@":junk_level_set_by_user"];

  uint64_t v41 = NSNumber;
  id v42 = [v3 flags];
  long long v43 = objc_msgSend(v41, "numberWithUnsignedInteger:", objc_msgSend(v42, "junkLevel"));
  [v65 setObject:v43 forKeyedSubscript:@":junk_level"];

  uint64_t v44 = [v3 flagColors];
  uint64_t v45 = [v44 containsIndex:0];

  uint64_t v46 = [NSNumber numberWithBool:v45];
  [v65 setObject:v46 forKeyedSubscript:@":has_Red_flag"];

  uint64_t v47 = [v3 flagColors];
  uint64_t v48 = [v47 containsIndex:1];

  long long v49 = [NSNumber numberWithBool:v48];
  [v65 setObject:v49 forKeyedSubscript:@":has_Orange_flag"];

  id v50 = [v3 flagColors];
  uint64_t v51 = [v50 containsIndex:2];

  uint64_t v52 = [NSNumber numberWithBool:v51];
  [v65 setObject:v52 forKeyedSubscript:@":has_Yellow_flag"];

  uint64_t v53 = [v3 flagColors];
  uint64_t v54 = [v53 containsIndex:3];

  id v55 = [NSNumber numberWithBool:v54];
  [v65 setObject:v55 forKeyedSubscript:@":has_Green_flag"];

  id v56 = [v3 flagColors];
  uint64_t v57 = [v56 containsIndex:4];

  id v58 = [NSNumber numberWithBool:v57];
  [v65 setObject:v58 forKeyedSubscript:@":has_Blue_flag"];

  uint64_t v59 = [v3 flagColors];
  uint64_t v60 = [v59 containsIndex:5];

  uint64_t v61 = [NSNumber numberWithBool:v60];
  [v65 setObject:v61 forKeyedSubscript:@":has_Purple_flag"];

  char v62 = [v3 flagColors];
  uint64_t v63 = [v62 containsIndex:6];

  id v64 = [NSNumber numberWithBool:v63];
  [v65 setObject:v64 forKeyedSubscript:@":has_Gray_flag"];
}

void __70___EDThreadPersistence_ThreadMessages_updateThreadTableWithJournaled___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __70___EDThreadPersistence_ThreadMessages_updateThreadTableWithJournaled___block_invoke_2_cold_1();
  }
}

void __70___EDThreadPersistence_ThreadMessages_updateThreadTableWithJournaled___block_invoke_165(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = NSNumber;
  uint64_t v4 = [*(id *)(a1 + 32) thread];
  uint64_t v5 = [v4 objectID];
  uint64_t v6 = objc_msgSend(v3, "numberWithLongLong:", objc_msgSend(v5, "conversationID"));
  [v8 setObject:v6 forKeyedSubscript:@":conversation_id"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "threadScopeDatabaseID"));
  [v8 setObject:v7 forKeyedSubscript:@":scope"];
}

void __70___EDThreadPersistence_ThreadMessages_updateThreadTableWithJournaled___block_invoke_2_166(uint64_t a1)
{
  id v2 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    __70___EDThreadPersistence_ThreadMessages_updateThreadTableWithJournaled___block_invoke_2_166_cold_1();
  }

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
}

void __70___EDThreadPersistence_ThreadMessages_updateThreadTableWithJournaled___block_invoke_167(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 objectAtIndexedSubscript:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 databaseIDValue];
}

uint64_t __96___EDThreadPersistence_ThreadMessages__newestUnreadWrappedMessagesWithNewestReadWrappedMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __90___EDThreadPersistence_ThreadMessages__displayWrappedMessageWithNewestReadWrappedMessage___block_invoke(uint64_t a1, void *a2)
{
}

id __56___EDThreadPersistence_PersistedThread_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(v2, "databaseID"));

  return v3;
}

void __64___EDThreadPersistence_PersistedThread_updateNewestReadMessage___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "threadDatabaseID"));
  [v7 setObject:v3 forKeyedSubscript:@":thread"];

  id v4 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "databaseID"));
  [v7 setObject:v4 forKeyedSubscript:@":newest_read_message"];

  uint64_t v5 = [*(id *)(a1 + 40) message];
  uint64_t v6 = [v5 date];
  [v7 setObject:v6 forKeyedSubscript:@":date"];
}

void __64___EDThreadPersistence_PersistedThread_updateNewestReadMessage___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __70___EDThreadPersistence_ThreadMessages_updateThreadTableWithJournaled___block_invoke_2_cold_1();
  }
}

void __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "threadDatabaseID"));
  [v4 setObject:v3 forKeyedSubscript:@":thread"];
}

void __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke_2_cold_1();
  }
}

void __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke_246(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = [v11 objectAtIndexedSubscript:0];
  uint64_t v4 = [v3 dateValue];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = [v11 objectAtIndexedSubscript:1];
  uint64_t v8 = [v7 dateValue];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

void __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke_2_247(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  uint64_t v6 = [v8 message];
  id v7 = [v6 date];

  if (!*(void *)(*(void *)(a1[4] + 8) + 40) || (objc_msgSend(v7, "ef_isLaterThanDate:"))
    && ((objc_msgSend(v7, "ef_isEarlierThanDate:", *(void *)(*(void *)(a1[5] + 8) + 40)) & 1) != 0
     || *(void *)(*(void *)(a1[4] + 8) + 40)
     && objc_msgSend(*(id *)(*(void *)(a1[5] + 8) + 40), "isEqualToDate:")))
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = [v8 databaseID];
    *a4 = 1;
  }
}

void __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "threadDatabaseID"));
  [v5 setObject:v3 forKeyedSubscript:@":thread"];

  uint64_t v4 = [NSNumber numberWithLongLong:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  [v5 setObject:v4 forKeyedSubscript:@":display_message"];
}

void __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke_4_cold_1();
  }
}

void __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke_258(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "threadDatabaseID"));
  [v4 setObject:v3 forKeyedSubscript:@":thread"];
}

void __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke_2_259(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke_4_cold_1();
  }
}

void __52___EDThreadPersistence_PersistedThread_addMailboxes__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "threadDatabaseID"));
  [v4 setObject:v3 forKeyedSubscript:@":thread"];

  [v4 setObject:*(void *)(a1 + 40) forKeyedSubscript:@":mailbox"];
}

void __52___EDThreadPersistence_PersistedThread_addMailboxes__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __52___EDThreadPersistence_PersistedThread_addMailboxes__block_invoke_2_cold_1();
  }
}

void __59___EDThreadPersistence_PersistedThread_currentSenderCounts__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "threadDatabaseID"));
  [v4 setObject:v3 forKeyedSubscript:@":thread"];
}

void __59___EDThreadPersistence_PersistedThread_currentSenderCounts__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __59___EDThreadPersistence_PersistedThread_currentSenderCounts__block_invoke_2_cold_1();
  }
}

void __59___EDThreadPersistence_PersistedThread_currentSenderCounts__block_invoke_276(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 objectAtIndexedSubscript:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 integerValue];
}

void __66___EDThreadPersistence_PersistedThread_senderDatabaseIDsAndDates___block_invoke_2()
{
  v0 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    __66___EDThreadPersistence_PersistedThread_senderDatabaseIDsAndDates___block_invoke_2_cold_1();
  }
}

void __66___EDThreadPersistence_PersistedThread_senderDatabaseIDsAndDates___block_invoke_285(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 objectForKeyedSubscript:@"sender"];
  id v4 = [v3 numberValue];

  if (v4)
  {
    id v5 = [v8 objectForKeyedSubscript:@"date_received"];
    uint64_t v6 = [v5 dateValue];

    id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
    if (!v7 || objc_msgSend(v6, "ef_isLaterThanDate:", v7)) {
      [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v4];
    }
  }
}

void __51___EDThreadPersistence_PersistedThread_addSenders___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = [*(id *)(a1 + 32) sqlHelper];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __51___EDThreadPersistence_PersistedThread_addSenders___block_invoke_2;
  void v14[3] = &unk_1E6C073F0;
  uint64_t v10 = *(void *)(a1 + 40);
  void v14[4] = *(void *)(a1 + 32);
  id v11 = v7;
  id v15 = v11;
  id v12 = v8;
  id v16 = v12;
  uint64_t v13 = [v9 executeUpsertSQL:v10 bindings:v14 errorHandler:&__block_literal_global_299];

  if (v13 == *MEMORY[0x1E4F5FCC8]) {
    *a4 = 1;
  }
  else {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
}

void __51___EDThreadPersistence_PersistedThread_addSenders___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "threadDatabaseID"));
  [v4 setObject:v3 forKeyedSubscript:@":thread"];

  [v4 setObject:*(void *)(a1 + 40) forKeyedSubscript:@":address"];
  [v4 setObject:*(void *)(a1 + 48) forKeyedSubscript:@":date"];
}

void __51___EDThreadPersistence_PersistedThread_addSenders___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __51___EDThreadPersistence_PersistedThread_addSenders___block_invoke_3_cold_1();
  }
}

void __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "threadDatabaseID"));
  [v4 setObject:v3 forKeyedSubscript:@":thread"];
}

void __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __59___EDThreadPersistence_PersistedThread_currentSenderCounts__block_invoke_2_cold_1();
  }
}

void __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_306(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v6 = [v7 objectAtIndexedSubscript:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v6 databaseIDValue];

  *a4 = 1;
}

void __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_2_310(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "threadDatabaseID"));
  [v4 setObject:v3 forKeyedSubscript:@":thread"];
}

void __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_3_cold_1();
  }
}

void __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_313(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v6 = [v7 objectAtIndexedSubscript:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v6 databaseIDValue];

  *a4 = 1;
}

void __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_2_317(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "threadDatabaseID"));
  [v4 setObject:v3 forKeyedSubscript:@":thread"];
}

void __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_3_318(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_3_318_cold_1();
  }
}

void __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_324(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "threadDatabaseID"));
  [v5 setObject:v3 forKeyedSubscript:@":thread"];

  id v4 = [NSNumber numberWithLongLong:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  [v5 setObject:v4 forKeyedSubscript:@":address"];
}

void __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_2_325(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_2_325_cold_1();
  }
}

void __96___EDThreadPersistence_PersistedThread_recipientDatabaseIDsAndDatesForRecipientType_recipients___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  [v4 setObject:v3 forKeyedSubscript:@":recipients_type"];
}

void __96___EDThreadPersistence_PersistedThread_recipientDatabaseIDsAndDatesForRecipientType_recipients___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __96___EDThreadPersistence_PersistedThread_recipientDatabaseIDsAndDatesForRecipientType_recipients___block_invoke_2_cold_1();
  }
}

void __96___EDThreadPersistence_PersistedThread_recipientDatabaseIDsAndDatesForRecipientType_recipients___block_invoke_337(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 objectForKeyedSubscript:@"address"];
  id v4 = [v3 numberValue];

  id v5 = [v8 objectForKeyedSubscript:@"date_received"];
  uint64_t v6 = [v5 dateValue];

  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
  if (!v7 || objc_msgSend(v6, "ef_isLaterThanDate:", v7)) {
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v4];
  }
}

void __61___EDThreadPersistence_PersistedThread_addRecipients_ofType___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = [*(id *)(a1 + 32) sqlHelper];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __61___EDThreadPersistence_PersistedThread_addRecipients_ofType___block_invoke_2;
  void v14[3] = &unk_1E6C07528;
  void v14[4] = *(void *)(a1 + 32);
  id v10 = v7;
  id v15 = v10;
  id v11 = v8;
  uint64_t v12 = *(void *)(a1 + 48);
  id v16 = v11;
  uint64_t v17 = v12;
  uint64_t v13 = objc_msgSend(v9, "executeUpsertSQL:bindings:errorHandler:", @"INSERT INTO thread_recipients( thread,  address,  type,  date,  priority) VALUES( :thread,  :address,  :type,  :date,  0) ON CONFLICT (thread, type, address) DO UPDATE SET   date = max(date, excluded.date) ;",
          v14,
          &__block_literal_global_348_0);

  if (v13 == *MEMORY[0x1E4F5FCC8]) {
    *a4 = 1;
  }
  else {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

void __61___EDThreadPersistence_PersistedThread_addRecipients_ofType___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "threadDatabaseID"));
  [v5 setObject:v3 forKeyedSubscript:@":thread"];

  [v5 setObject:*(void *)(a1 + 40) forKeyedSubscript:@":address"];
  [v5 setObject:*(void *)(a1 + 48) forKeyedSubscript:@":date"];
  id v4 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
  [v5 setObject:v4 forKeyedSubscript:@":type"];
}

void __61___EDThreadPersistence_PersistedThread_addRecipients_ofType___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __61___EDThreadPersistence_PersistedThread_addRecipients_ofType___block_invoke_3_cold_1();
  }
}

void __63___EDThreadPersistence_PersistedThread__ensureTempMessagesView__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = NSNumber;
  id v4 = [*(id *)(a1 + 32) thread];
  id v5 = objc_msgSend(v3, "numberWithLongLong:", objc_msgSend(v4, "conversationID"));
  [v6 setObject:v5 forKeyedSubscript:@":conversation_id"];
}

void __63___EDThreadPersistence_PersistedThread__ensureTempMessagesView__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __63___EDThreadPersistence_PersistedThread__ensureTempMessagesView__block_invoke_2_cold_1();
  }
}

void __63___EDThreadPersistence_PersistedThread__ensureTempMessagesView__block_invoke_354(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = NSNumber;
  id v5 = [a2 objectAtIndexedSubscript:0];
  id v4 = objc_msgSend(v3, "numberWithLongLong:", objc_msgSend(v5, "databaseIDValue"));
  [v2 addObject:v4];
}

- (void)persistenceStateForThreadScope:wantsPrecomputed:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_3();
  _os_log_fault_impl(&dword_1DB39C000, v0, OS_LOG_TYPE_FAULT, "Client wants to precompute, but we're unable to do so for threadscope: %{public}@", v1, 0xCu);
}

- (void)threadForObjectID:originatingQuery:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Thread has no sender: %{public}@", v5);
}

- (void)threadForObjectID:originatingQuery:error:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Thread has no subject: %{public}@", v5);
}

void __64__EDThreadPersistence_threadForObjectID_originatingQuery_error___block_invoke_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138543362;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_5_0(&dword_1DB39C000, a2, a3, "Unable to find database ID for thread: %{public}@", (uint8_t *)&v4);
}

void __64__EDThreadPersistence_threadForObjectID_originatingQuery_error___block_invoke_cold_2(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138543362;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_5_0(&dword_1DB39C000, a2, a3, "Unable to return thread because database is locked: %{public}@", (uint8_t *)&v4);
}

void __64__EDThreadPersistence_threadForObjectID_originatingQuery_error___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543362;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_5_0(&dword_1DB39C000, a2, a3, "Unable to find display message for thread: %{public}@", (uint8_t *)&v4);
}

void __120__EDThreadPersistence_nextExistingThreadObjectIDForThreadObjectID_forSortDescriptors_journaledThreadsToCheck_excluding___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB39C000, v0, v1, "Unable to form comparison expression to look up position", v2, v3, v4, v5, v6);
}

void __120__EDThreadPersistence_nextExistingThreadObjectIDForThreadObjectID_forSortDescriptors_journaledThreadsToCheck_excluding___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB39C000, v0, v1, "Failed to find next thread", v2, v3, v4, v5, v6);
}

void __120__EDThreadPersistence_nextExistingThreadObjectIDForThreadObjectID_forSortDescriptors_journaledThreadsToCheck_excluding___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB39C000, v0, v1, "Failed to find next unjournaled thread", v2, v3, v4, v5, v6);
}

- (void)threadObjectIDsByNextExistingForThreadObjectIDs:(uint64_t)a1 forSortDescriptors:(uint64_t)a2 journaledThreadsToCheck:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_3(a1, a2, a3, 3.8521e-34);
  _os_log_debug_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEBUG, "Looking up next existing threads before %lu threads: %{public}@", v3, 0x16u);
}

- (void)_comparisonExpressionForSortDescriptors:conversationID:threadExpression:threadScopeDatabaseID:connection:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_3();
  _os_log_fault_impl(&dword_1DB39C000, v0, OS_LOG_TYPE_FAULT, "Cannot generate expression for unsupported sort descriptors: %{public}@", v1, 0xCu);
}

- (void)_databaseIDForThreadObjectID:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_5_0(&dword_1DB39C000, v0, v1, "No conversation ID for thread: %{public}@", v2);
}

- (void)_databaseIDForThreadObjectID:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_5_0(&dword_1DB39C000, v0, v1, "Unable to find thread scope database ID for thread: %{public}@", v2);
}

void __40__EDThreadPersistence__recomputeThreads__block_invoke_3_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_3(a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Failed to recompute %lu threads: %{public}@", v3, v4);
}

- (void)persistenceIsInitializingDatabaseWithConnection:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB39C000, v0, v1, "Failed to add default thread scope", v2, v3, v4, v5, v6);
}

void __89__EDThreadPersistence__getIndividualMailboxScopes_unifiedMailboxThreadScopes_forAccount___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_5_0(&dword_1DB39C000, v0, v1, "Thread scope %{public}@ does not have a valid mailbox scope", v2);
}

- (void)_writeThreadedMessages:withChangedKeyPaths:journaled:generationWindow:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB39C000, v0, v1, "Resetting thread scopes due to error", v2, v3, v4, v5, v6);
}

- (void)_messageFilterExpressionForFilterPredicate:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_5_0(&dword_1DB39C000, v0, v1, "NOT predicate should only have one subpredicate: %@", v2);
}

- (void)beginMigratingThreadScope:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Unable to request background processing assertion: %{public}@", v5);
}

- (void)endMigratingThreadScope:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  _os_log_fault_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_FAULT, "Attempting to finish migration for a thread scope which doesn't exist: %{public}@", v4, 0xCu);
}

void __66__EDThreadPersistence_oldestThreadObjectIDForMailbox_threadScope___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Unable to get oldest thread object ID for mailbox: %{public}@", v5);
}

void __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Thread scope is inconsistent - conversation id %lld is empty and has null display message: %{public}@", v4, v5);
}

void __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Thread scope is inconsistent - conversation id %lld has null display message: %{public}@", v4, v5);
}

void __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Thread scope is inconsistent - conversation id %lld is empty: %{public}@", v4, v5);
}

void __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_2_cold_4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Thread scope is inconsistent - conversation id %lld has unknown consistency issue: %{public}@", v4, v5);
}

void __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_2_cold_5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Conversation IDs in threads but not messages: %{public}@", v5);
}

void __54__EDThreadPersistence_verifyConsistencyOfThreadScope___block_invoke_2_cold_6()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Conversation IDs in messages but not threads: %{public}@", v5);
}

- (void)_logFailedVerifyConsistencyForConversationIDs:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "%{public}@", v5);
}

void __101__EDThreadPersistence__addThreadScopeToDatabase_needsUpdate_lastViewedDate_updateThreadScopeManager___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Failed to add thread scope %{public}@", v5);
}

void __76___EDThreadPersistence_ThreadMessages_addThreadReplacingExisting_journaled___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_6(&dword_1DB39C000, v3, v4, "Failed to add thread: %{public}@", v5);
}

void __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_133_cold_1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_11(v2, v3, 5.7779e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v4, v5, "thread_scopes — ROWID: %@", v6);
}

void __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_2_142_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_145_cold_1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_11(v2, v3, 5.7779e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v4, v5, "conversations — conversation_id: %@", v6);
}

void __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_2_153_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __60___EDThreadPersistence_ThreadMessages__collectDebuggingInfo__block_invoke_156_cold_1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_11(v2, v3, 5.7779e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v4, v5, "messages — ROWID: %@", v6);
}

void __70___EDThreadPersistence_ThreadMessages_updateThreadTableWithJournaled___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_6(&dword_1DB39C000, v3, v4, "Failed to update thread: %{public}@", v5);
}

void __70___EDThreadPersistence_ThreadMessages_updateThreadTableWithJournaled___block_invoke_2_166_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_2(&dword_1DB39C000, v0, v1, "Failed to get current display message sender.", v2, v3, v4, v5, v6);
}

void __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_6(&dword_1DB39C000, v3, v4, "Failed to get date of newest read / current display messages: %{public}@", v5);
}

void __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_6(&dword_1DB39C000, v3, v4, "Failed to update thread display message: %{public}@", v5);
}

void __52___EDThreadPersistence_PersistedThread_addMailboxes__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_6(&dword_1DB39C000, v3, v4, "Failed to add thread mailbox: %{public}@", v5);
}

void __59___EDThreadPersistence_PersistedThread_currentSenderCounts__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_6(&dword_1DB39C000, v3, v4, "Failed to get current display message sender: %{public}@", v5);
}

void __66___EDThreadPersistence_PersistedThread_senderDatabaseIDsAndDates___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_2(&dword_1DB39C000, v0, v1, "Failed to get message senders for thread.", v2, v3, v4, v5, v6);
}

void __51___EDThreadPersistence_PersistedThread_addSenders___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_6(&dword_1DB39C000, v3, v4, "Failed to add sender: %{public}@", v5);
}

void __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_6(&dword_1DB39C000, v3, v4, "Failed to get actual display message sender: %{public}@", v5);
}

void __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_3_318_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_6(&dword_1DB39C000, v3, v4, "Failed to clear sender priority: %{public}@", v5);
}

void __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_2_325_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_6(&dword_1DB39C000, v3, v4, "Failed to set the sender priority: %{public}@", v5);
}

void __96___EDThreadPersistence_PersistedThread_recipientDatabaseIDsAndDatesForRecipientType_recipients___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_6(&dword_1DB39C000, v3, v4, "Failed to get message receipients for thread: %{public}@", v5);
}

void __61___EDThreadPersistence_PersistedThread_addRecipients_ofType___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_6(&dword_1DB39C000, v3, v4, "Failed to add recipient: %{public}@", v5);
}

void __63___EDThreadPersistence_PersistedThread__ensureTempMessagesView__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_6(&dword_1DB39C000, v3, v4, "Failed to get message row IDs for thread: %{public}@", v5);
}

@end