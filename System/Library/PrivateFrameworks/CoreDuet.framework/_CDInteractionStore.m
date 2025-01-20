@interface _CDInteractionStore
+ (_CDInteractionStore)storeWithDirectory:(id)a3 knowledgeStore:(id)a4 readOnly:(BOOL)a5;
+ (_CDInteractionStore)storeWithDirectory:(id)a3 readOnly:(BOOL)a4;
+ (id)defaultDatabaseDirectory;
+ (id)predicateFilteringUsernameForPredicate:(id)a3;
- (BOOL)_deleteMetadataForKey:(id)a3 moc:(id)a4;
- (BOOL)deleteStorage;
- (BOOL)openAndCheckIfReadable;
- (BOOL)readConcurrently;
- (BOOL)recordInteraction:(id)a3;
- (BOOL)recordInteractions:(id)a3;
- (BOOL)recordInteractionsBatch:(id)a3 error:(id *)a4;
- (BOOL)recordVersionNumber:(int64_t)a3;
- (BOOL)updateInteractionsBatch:(id)a3 error:(id *)a4;
- (_CDInteraction)pendingShareSheetInteraction;
- (_CDInteractionStore)init;
- (_CDInteractionStore)initWithDatabasePath:(id)a3 inDirectory:(id)a4;
- (_CDInteractionStore)initWithDirectory:(id)a3 knowledgeStore:(id)a4 readOnly:(BOOL)a5;
- (_DKCoreDataStorage)storage;
- (id)anonymizedCopyToDirectory:(id)a3 salt:(id)a4;
- (id)appendMissingInformationForRecord:(id)a3 fromContact:(id)a4 cacheUpdateRequired:(BOOL *)a5;
- (id)batchFetchExistingAttachmentRecords:(id)a3 context:(id)a4 error:(id *)a5;
- (id)batchFetchExistingContactRecords:(id)a3 context:(id)a4 error:(id *)a5;
- (id)batchFetchExistingInteractionsWithUUIDs:(id)a3 context:(id)a4 error:(id *)a5;
- (id)batchFetchExistingKeywordRecords:(id)a3 context:(id)a4 error:(id *)a5;
- (id)conversationsWithInteractions;
- (id)createAttachmentFromRecord:(id)a3;
- (id)createInteractionFromRecord:(id)a3;
- (id)createInteractionRecord:(id)a3 context:(id)a4 keywordCache:(id)a5 attachmentCache:(id)a6 contactCache:(id)a7 error:(id *)a8;
- (id)createKeywordFromRecord:(id)a3;
- (id)dateFromTimeIntervalSinceRef:(double)a3;
- (id)errorForException:(id)a3;
- (id)fetchOrCreateAttachmentRecord:(id)a3 context:(id)a4 cache:(id)a5 error:(id *)a6;
- (id)fetchOrCreateContactRecord:(id)a3 context:(id)a4 cache:(id)a5 error:(id *)a6;
- (id)fetchOrCreateContactRecord:(id)a3 context:(id)a4 error:(id *)a5;
- (id)fetchOrCreateKeywordRecord:(id)a3 context:(id)a4 cache:(id)a5 error:(id *)a6;
- (id)fetchOrCreateKeywordRecord:(id)a3 context:(id)a4 error:(id *)a5;
- (id)getContactForRecord:(id)a3;
- (id)getInteractionsStatisticsForConfig:(id)a3;
- (id)histogramContactInteractionsUsingPredicate:(id)a3 withLimit:(unint64_t)a4;
- (id)interactionCountPerMechanism;
- (id)kMostRecentConversationsWithLimit:(unint64_t)a3 predicate:(id)a4;
- (id)metadataDictionary;
- (id)metadataForKey:(id)a3;
- (id)predicateForInteractions:(id)a3;
- (id)queryContactInteractionsUsingPredicate:(id)a3 withLimit:(unint64_t)a4;
- (id)queryContactsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 error:(id *)a6;
- (id)queryContactsUsingPredicate:(id)a3 withLimit:(unint64_t)a4 error:(id *)a5;
- (id)queryInteractionsUsingPredicate:(id)a3 matchingNameTokens:(id)a4 sortDescriptors:(id)a5 limit:(unint64_t)a6 error:(id *)a7;
- (id)queryInteractionsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5;
- (id)queryInteractionsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 error:(id *)a6;
- (id)queryInteractionsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 offset:(unint64_t)a6 error:(id *)a7;
- (id)queryInteractionsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 offset:(unint64_t)a6 objectIDs:(id *)a7 error:(id *)a8;
- (id)queryInteractionsUsingPredicate:(id)a3 withLimit:(unint64_t)a4;
- (id)recipientArrayWithMostRecentSenderFirstFromIncomingInteraction:(id)a3 outgoingInteraction:(id)a4;
- (id)usersWithInteractions;
- (int64_t)queryVersionNumber;
- (unint64_t)countContactsUsingPredicate:(id)a3 error:(id *)a4;
- (unint64_t)countInteractionsUsingPredicate:(id)a3 error:(id *)a4;
- (unint64_t)deleteInteractionsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 debuggingReason:(id)a6 error:(id *)a7;
- (unint64_t)deleteInteractionsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 error:(id *)a6;
- (unint64_t)deleteInteractionsOlderThanDate:(id)a3 debuggingReason:(id)a4 limit:(unint64_t)a5;
- (unint64_t)deleteInteractionsOlderThanDate:(id)a3 limit:(unint64_t)a4;
- (unint64_t)deleteInteractionsWithBundleId:(id)a3 account:(id)a4 error:(id *)a5;
- (unint64_t)deleteInteractionsWithBundleId:(id)a3 domainIdentifier:(id)a4 error:(id *)a5;
- (unint64_t)deleteInteractionsWithBundleId:(id)a3 domainIdentifiers:(id)a4 error:(id *)a5;
- (unint64_t)deleteInteractionsWithBundleId:(id)a3 error:(id *)a4;
- (unint64_t)deleteOldInteractionsIfNeededToLimitTotalNumber:(unint64_t)a3 limit:(unint64_t)a4;
- (unint64_t)deleteUnreferencedContacts;
- (unint64_t)deleteUnreferencedKeywords;
- (unint64_t)numberOfContactsMatchingPredicate:(id)a3;
- (unint64_t)numberOfInteractionsMatchingPredicate:(id)a3;
- (void)anonymizeAttachmentsWithSalt:(id)a3;
- (void)anonymizeContactsWithSalt:(id)a3;
- (void)anonymizeInteractionsWithSalt:(id)a3;
- (void)anonymizeKeywordsWithSalt:(id)a3;
- (void)anonymizeWithSalt:(id)a3;
- (void)closeStorage;
- (void)countContactsUsingPredicate:(id)a3 completionHandler:(id)a4;
- (void)countInteractionsUsingPredicate:(id)a3 completionHandler:(id)a4;
- (void)deleteInteractionsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6;
- (void)deleteInteractionsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 debuggingReason:(id)a6 completionHandler:(id)a7;
- (void)deleteInteractionsWithBundleId:(id)a3 account:(id)a4 completionHandler:(id)a5;
- (void)deleteInteractionsWithBundleId:(id)a3 completionHandler:(id)a4;
- (void)deleteInteractionsWithBundleId:(id)a3 domainIdentifier:(id)a4 completionHandler:(id)a5;
- (void)deleteInteractionsWithBundleId:(id)a3 domainIdentifiers:(id)a4 completionHandler:(id)a5;
- (void)enterMaintenanceMode;
- (void)exitMaintenanceMode;
- (void)fillWithoutRelationshipsInteractionRecord:(id)a3 fromInteraction:(id)a4;
- (void)queryContactsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6;
- (void)queryInteractionsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6;
- (void)recordInteractions:(id)a3 completionHandler:(id)a4;
- (void)setMetadata:(id)a3 forKey:(id)a4;
- (void)setPendingShareSheetInteraction:(id)a3;
- (void)setReadConcurrently:(BOOL)a3;
- (void)truncateInteractionsToCount:(unint64_t)a3;
- (void)updateCachedStatsForContactRecord:(id)a3 isSender:(BOOL)a4 withInteraction:(id)a5;
@end

@implementation _CDInteractionStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingShareSheetInteraction, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_pendingShareInteractionQueue, 0);
  objc_storeStrong((id *)&self->_notifier, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

+ (id)defaultDatabaseDirectory
{
  return +[_CDPaths peopleDirectory];
}

+ (id)predicateFilteringUsernameForPredicate:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }
  v6 = v5;

  return v6;
}

- (id)queryInteractionsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 offset:(unint64_t)a6 error:(id *)a7
{
  return [(_CDInteractionStore *)self queryInteractionsUsingPredicate:a3 sortDescriptors:a4 limit:a5 offset:a6 objectIDs:0 error:a7];
}

+ (_CDInteractionStore)storeWithDirectory:(id)a3 readOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [[_CDInteractionStore alloc] initWithDirectory:v5 knowledgeStore:0 readOnly:v4];

  return v6;
}

- (_CDInteractionStore)initWithDirectory:(id)a3 knowledgeStore:(id)a4 readOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v29.receiver = self;
  v29.super_class = (Class)_CDInteractionStore;
  v10 = [(_CDInteractionStore *)&v29 init];
  if (v10)
  {
    v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v12 = [v11 pathForResource:@"CDInteractionDataModel" ofType:@"momd"];

    if (v12)
    {
      uint64_t v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12];
      if (v13)
      {
        v14 = (void *)v13;
        v15 = [[_DKCoreDataStorage alloc] initWithDirectory:v8 databaseName:@"interaction" modelURL:v13 readOnly:v5 localOnly:1];
        storage = v10->_storage;
        v10->_storage = v15;

        v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        dispatch_queue_t v18 = dispatch_queue_create("com.apple.coreduet.interactionstore.work", v17);
        workQueue = v10->_workQueue;
        v10->_workQueue = (OS_dispatch_queue *)v18;

        uint64_t v20 = +[_CDInteractionStoreNotifier sharedInstance];
        notifier = v10->_notifier;
        v10->_notifier = (_CDInteractionStoreNotifier *)v20;

        v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        dispatch_queue_t v23 = dispatch_queue_create("com.apple.interactionstore.pending-share-queue", v22);
        pendingShareInteractionQueue = v10->_pendingShareInteractionQueue;
        v10->_pendingShareInteractionQueue = (OS_dispatch_queue *)v23;

        v10->_inMaintenanceMode = 0;
        if (v9) {
          objc_storeStrong((id *)&v10->_knowledgeStore, a4);
        }

        goto LABEL_7;
      }
      v27 = +[_CDLogging interactionChannel];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[_CDInteractionStore initWithDirectory:knowledgeStore:readOnly:]();
      }
    }
    else
    {
      v26 = +[_CDLogging interactionChannel];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[_CDInteractionStore initWithDirectory:knowledgeStore:readOnly:]();
      }
    }
    v25 = 0;
    goto LABEL_15;
  }
LABEL_7:
  v25 = v10;
LABEL_15:

  return v25;
}

- (unint64_t)deleteInteractionsWithBundleId:(id)a3 domainIdentifiers:(id)a4 error:(id *)a5
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v9 count])
  {
    v22 = _CDTargetBundleIdForBundleId(v8);
    v25 = (void *)[objc_alloc(MEMORY[0x1E4F93B20]) initWithDomainsFromArray:v9];
    v10 = [v25 allDomains];
    dispatch_queue_t v23 = a5;
    v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(domainIdentifier == $domainIdentifier) OR (domainIdentifier >= $domainIdentifierDot AND domainIdentifier < $domainIdentifierSlash)"];
    v12 = [v10 allObjects];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __78___CDInteractionStore_deleteInteractionsWithBundleId_domainIdentifiers_error___block_invoke;
    v26[3] = &unk_1E560EC70;
    id v27 = v11;
    id v24 = v11;
    uint64_t v13 = objc_msgSend(v12, "_pas_mappedArrayWithTransform:", v26);

    v14 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v13];
    v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(noindex(mechanism) != %@ AND noindex(bundleId) == %@) OR (noindex(mechanism) == %@ AND noindex(targetBundleId) == %@)", &unk_1EDE1DA48, v8, &unk_1EDE1DA48, v22];
    v16 = (void *)MEMORY[0x1E4F28BA0];
    v28[0] = v14;
    v28[1] = v15;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    dispatch_queue_t v18 = [v16 andPredicateWithSubpredicates:v17];
    v19 = (void *)[[NSString alloc] initWithFormat:@"deleteInteractionsWithBundleId:%@ domainIdentifiers:(redacted) (bundleId)", v8];
    unint64_t v20 = [(_CDInteractionStore *)self deleteInteractionsMatchingPredicate:v18 sortDescriptors:MEMORY[0x1E4F1CBF0] limit:20000 debuggingReason:v19 error:v23];
  }
  else
  {
    unint64_t v20 = 0;
  }

  return v20;
}

- (unint64_t)deleteInteractionsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 debuggingReason:(id)a6 error:(id *)a7
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v34 = a6;
  uint64_t v33 = MEMORY[0x192FB2F20]();
  if (a5 >= 0x3E8) {
    unint64_t v13 = 1000;
  }
  else {
    unint64_t v13 = a5;
  }
  if (a5) {
    unint64_t v14 = v13;
  }
  else {
    unint64_t v14 = 1000;
  }
  id v35 = 0;
  id v36 = 0;
  v15 = [(_CDInteractionStore *)self queryInteractionsUsingPredicate:v11 sortDescriptors:v12 limit:v14 offset:0 objectIDs:&v36 error:&v35];
  id v16 = v35;
  if ([v36 count])
  {
    v17 = objc_msgSend(v15, "_pas_mappedArrayWithTransform:", &__block_literal_global_438);
    dispatch_queue_t v18 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      if ([v36 count] >= v14) {
        v19 = @"at least ";
      }
      else {
        v19 = &stru_1EDDE58B8;
      }
      uint64_t v20 = [v36 count];
      *(_DWORD *)buf = 138544131;
      v38 = v19;
      __int16 v39 = 2048;
      uint64_t v40 = v20;
      __int16 v41 = 2114;
      id v42 = v34;
      __int16 v43 = 2113;
      v44 = v17;
      _os_log_impl(&dword_18ECEB000, v18, OS_LOG_TYPE_DEFAULT, "Deleted %{public}@%tu interactions with reason %{public}@: %{private}@", buf, 0x2Au);
    }
  }
  unint64_t v21 = [v36 count];
  v22 = [(_DKCoreDataStorage *)self->_storage managedObjectContextFor:*MEMORY[0x1E4F28358]];
  if (v21 >= v14)
  {
    dispatch_queue_t v23 = +[_CDInteractionStore predicateFilteringUsernameForPredicate:v11];
    LOBYTE(v32) = 0;
    id v24 = v22;
    v25 = v23;
    id v26 = v12;
  }
  else
  {
    dispatch_queue_t v23 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self in %@", v36];
    LOBYTE(v32) = 0;
    id v24 = v22;
    v25 = v23;
    id v26 = 0;
  }
  unint64_t v27 = +[_DKCoreDataStorage deleteObjectsInContext:v24 entityName:@"Interactions" predicate:v25 sortDescriptors:v26 fetchLimit:a5 includeSubentities:0 includePendingChanges:v32];

  if (v16 && v27)
  {
    v28 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      -[_CDInteractionStore deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:]();
    }

    objc_super v29 = (void *)v33;
  }
  else
  {
    if (v16 && !v27)
    {
      v30 = +[_CDLogging interactionChannel];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[_CDInteractionStore deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:]();
      }

      objc_super v29 = (void *)v33;
      goto LABEL_31;
    }
    objc_super v29 = (void *)v33;
    if (!v27) {
      goto LABEL_31;
    }
  }
  [(_CDInteractionStore *)self deleteUnreferencedKeywords];
  [(_CDInteractionStore *)self deleteUnreferencedContacts];
  if (self->_inMaintenanceMode)
  {
    if (v16) {
LABEL_30:
    }
      [(_CDInteractionStoreNotifier *)self->_notifier deleteAll];
  }
  else
  {
    if (v16 || v27 > 0x3E8) {
      goto LABEL_30;
    }
    if (v27 <= 0x3E7) {
      [(_CDInteractionStoreNotifier *)self->_notifier deleted:v15];
    }
  }
LABEL_31:

  return v27;
}

- (void)setMetadata:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v19 = 0;
    id v8 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v6 format:200 options:0 error:&v19];
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [(_DKCoreDataStorage *)self->_storage managedObjectContextFor:*MEMORY[0x1E4F28358]];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __42___CDInteractionStore_setMetadata_forKey___block_invoke;
  v14[3] = &unk_1E560EC48;
  v14[4] = self;
  id v15 = v7;
  id v16 = v9;
  id v17 = v6;
  id v18 = v8;
  id v10 = v8;
  id v11 = v6;
  id v12 = v9;
  id v13 = v7;
  [v12 performWithOptions:4 andBlock:v14];
}

- (id)metadataForKey:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__10;
  id v18 = __Block_byref_object_dispose__10;
  id v19 = 0;
  BOOL v5 = [(_DKCoreDataStorage *)self->_storage managedObjectContextFor:*MEMORY[0x1E4F28358]];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38___CDInteractionStore_metadataForKey___block_invoke;
  v10[3] = &unk_1E560E960;
  id v6 = v5;
  id v11 = v6;
  id v7 = v4;
  id v12 = v7;
  id v13 = &v14;
  [v6 performWithOptions:4 andBlock:v10];
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (id)queryInteractionsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 offset:(unint64_t)a6 objectIDs:(id *)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__10;
  v51 = __Block_byref_object_dispose__10;
  id v52 = 0;
  uint64_t v41 = 0;
  id v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__10;
  uint64_t v45 = __Block_byref_object_dispose__10;
  id v46 = 0;
  if (a7) {
    uint64_t v16 = objc_opt_new();
  }
  else {
    uint64_t v16 = 0;
  }
  BOOL v17 = [(_CDInteractionStore *)self readConcurrently];
  storage = self->_storage;
  uint64_t v19 = *MEMORY[0x1E4F28358];
  if (v17) {
    [(_DKCoreDataStorage *)storage privateManagedObjectContextFor:v19];
  }
  else {
  uint64_t v20 = [(_DKCoreDataStorage *)storage managedObjectContextFor:v19];
  }
  unint64_t v21 = [[_CDMemoryUsageInterval alloc] initWithName:@"queryInteractionsUsingPredicate" client:0];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __100___CDInteractionStore_queryInteractionsUsingPredicate_sortDescriptors_limit_offset_objectIDs_error___block_invoke;
  v30[3] = &unk_1E560EA98;
  v22 = v21;
  v31 = v22;
  id v23 = v20;
  id v32 = v23;
  id v24 = v14;
  id v33 = v24;
  unint64_t v39 = a5;
  unint64_t v40 = a6;
  id v25 = v15;
  v37 = &v41;
  id v34 = v25;
  id v35 = self;
  id v26 = v16;
  id v36 = v26;
  v38 = &v47;
  [v23 performWithOptions:4 andBlock:v30];
  [(_CDMemoryUsageInterval *)v22 end];
  if (a8)
  {
    unint64_t v27 = (void *)v42[5];
    if (v27) {
      *a8 = v27;
    }
  }
  if ([(_CDInteractionStore *)self readConcurrently]) {
    [v23 reset];
  }
  if (a7) {
    objc_storeStrong(a7, v16);
  }
  id v28 = (id)v48[5];

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  return v28;
}

- (BOOL)readConcurrently
{
  return self->_readConcurrently;
}

- (id)queryInteractionsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 error:(id *)a6
{
  return [(_CDInteractionStore *)self queryInteractionsUsingPredicate:a3 sortDescriptors:a4 limit:a5 offset:0 error:a6];
}

- (BOOL)_deleteMetadataForKey:(id)a3 moc:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  id v8 = [MEMORY[0x1E4F1C0A8] entityForName:@"Metadata" inManagedObjectContext:v6];
  [v7 setEntity:v8];

  [v7 setResultType:2];
  id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"key = %@", v5];
  [v7 setPredicate:v9];

  [v7 setFetchLimit:1];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v7];
  id v15 = 0;
  id v11 = (id)[v6 executeRequest:v10 error:&v15];
  id v12 = v15;
  if (v12)
  {
    id v13 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[_CDInteractionStore _deleteMetadataForKey:moc:]();
    }
  }
  return v12 == 0;
}

+ (_CDInteractionStore)storeWithDirectory:(id)a3 knowledgeStore:(id)a4 readOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = [[_CDInteractionStore alloc] initWithDirectory:v8 knowledgeStore:v7 readOnly:v5];

  return v9;
}

- (_CDInteractionStore)initWithDatabasePath:(id)a3 inDirectory:(id)a4
{
  return [(_CDInteractionStore *)self initWithDirectory:a4 knowledgeStore:0 readOnly:0];
}

- (_CDInteractionStore)init
{
  return 0;
}

- (id)fetchOrCreateKeywordRecord:(id)a3 context:(id)a4 error:(id *)a5
{
  return [(_CDInteractionStore *)self fetchOrCreateKeywordRecord:a3 context:a4 cache:0 error:a5];
}

- (id)fetchOrCreateKeywordRecord:(id)a3 context:(id)a4 cache:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    uint64_t v32 = 0;
    id v33 = &v32;
    uint64_t v34 = 0x3032000000;
    id v35 = __Block_byref_object_copy__10;
    id v36 = __Block_byref_object_dispose__10;
    id v37 = 0;
    uint64_t v26 = 0;
    unint64_t v27 = &v26;
    uint64_t v28 = 0x3032000000;
    objc_super v29 = __Block_byref_object_copy__10;
    v30 = __Block_byref_object_dispose__10;
    id v31 = 0;
    id v13 = [[_CDMemoryUsageInterval alloc] initWithName:@"fetchOrCreateKeywordRecord" client:0];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __70___CDInteractionStore_fetchOrCreateKeywordRecord_context_cache_error___block_invoke;
    v18[3] = &unk_1E560E988;
    id v14 = v13;
    uint64_t v19 = v14;
    id v20 = v12;
    id v21 = v10;
    id v24 = &v32;
    id v22 = v11;
    id v23 = self;
    id v25 = &v26;
    [v22 performWithOptions:4 andBlock:v18];
    [(_CDMemoryUsageInterval *)v14 end];
    if (a6)
    {
      id v15 = (void *)v27[5];
      if (v15) {
        *a6 = v15;
      }
    }
    id v16 = (id)v33[5];

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v32, 8);
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (id)fetchOrCreateAttachmentRecord:(id)a3 context:(id)a4 cache:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    uint64_t v32 = 0;
    id v33 = &v32;
    uint64_t v34 = 0x3032000000;
    id v35 = __Block_byref_object_copy__10;
    id v36 = __Block_byref_object_dispose__10;
    id v37 = 0;
    uint64_t v26 = 0;
    unint64_t v27 = &v26;
    uint64_t v28 = 0x3032000000;
    objc_super v29 = __Block_byref_object_copy__10;
    v30 = __Block_byref_object_dispose__10;
    id v31 = 0;
    id v13 = [[_CDMemoryUsageInterval alloc] initWithName:@"fetchOrCreateAttachmentRecord" client:0];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __73___CDInteractionStore_fetchOrCreateAttachmentRecord_context_cache_error___block_invoke;
    v18[3] = &unk_1E560E988;
    id v14 = v13;
    uint64_t v19 = v14;
    id v20 = v12;
    id v21 = v10;
    id v24 = &v32;
    id v22 = v11;
    id v23 = self;
    id v25 = &v26;
    [v22 performWithOptions:4 andBlock:v18];
    [(_CDMemoryUsageInterval *)v14 end];
    if (a6)
    {
      id v15 = (void *)v27[5];
      if (v15) {
        *a6 = v15;
      }
    }
    id v16 = (id)v33[5];

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v32, 8);
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (id)fetchOrCreateContactRecord:(id)a3 context:(id)a4 error:(id *)a5
{
  return [(_CDInteractionStore *)self fetchOrCreateContactRecord:a3 context:a4 cache:0 error:a5];
}

- (id)fetchOrCreateContactRecord:(id)a3 context:(id)a4 cache:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    uint64_t v32 = 0;
    id v33 = &v32;
    uint64_t v34 = 0x3032000000;
    id v35 = __Block_byref_object_copy__10;
    id v36 = __Block_byref_object_dispose__10;
    id v37 = 0;
    uint64_t v26 = 0;
    unint64_t v27 = &v26;
    uint64_t v28 = 0x3032000000;
    objc_super v29 = __Block_byref_object_copy__10;
    v30 = __Block_byref_object_dispose__10;
    id v31 = 0;
    id v13 = [[_CDMemoryUsageInterval alloc] initWithName:@"fetchOrCreateContactRecord" client:0];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __70___CDInteractionStore_fetchOrCreateContactRecord_context_cache_error___block_invoke;
    v18[3] = &unk_1E560E988;
    id v14 = v13;
    uint64_t v19 = v14;
    id v20 = v12;
    id v21 = v10;
    id v24 = &v32;
    id v22 = v11;
    id v23 = self;
    id v25 = &v26;
    [v22 performWithOptions:4 andBlock:v18];
    [(_CDMemoryUsageInterval *)v14 end];
    if (a6)
    {
      id v15 = (void *)v27[5];
      if (v15) {
        *a6 = v15;
      }
    }
    id v16 = (id)v33[5];

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v32, 8);
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (id)appendMissingInformationForRecord:(id)a3 fromContact:(id)a4 cacheUpdateRequired:(BOOL *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 identifier];
  if (v9)
  {
  }
  else
  {
    id v10 = [v8 identifier];

    if (v10)
    {
      id v11 = [v8 identifier];
      [v7 setIdentifier:v11];

      *a5 = 1;
    }
  }
  id v12 = [v7 customIdentifier];
  if (v12)
  {
  }
  else
  {
    id v13 = [v8 customIdentifier];

    if (v13)
    {
      id v14 = [v8 customIdentifier];
      [v7 setCustomIdentifier:v14];

      *a5 = 1;
    }
  }
  id v15 = [v7 personId];
  if (v15)
  {
  }
  else
  {
    id v16 = [v8 personId];

    if (v16)
    {
      BOOL v17 = [v8 personId];
      [v7 setPersonId:v17];

      *a5 = 1;
    }
  }
  id v18 = [v7 displayName];
  if (v18)
  {
  }
  else
  {
    uint64_t v19 = [v8 displayName];

    if (v19)
    {
      id v20 = [v8 displayName];
      [v7 setDisplayName:v20];

      *a5 = 1;
    }
  }
  id v21 = [v7 displayImageURL];
  if (v21)
  {
  }
  else
  {
    id v22 = [v8 displayImageURL];

    if (v22)
    {
      id v23 = [v8 displayImageURL];
      [v7 setDisplayImageURL:v23];

      *a5 = 1;
    }
  }

  return v7;
}

- (id)batchFetchExistingKeywordRecords:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy__10;
  id v37 = __Block_byref_object_dispose__10;
  id v38 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__10;
  id v31 = __Block_byref_object_dispose__10;
  id v32 = 0;
  id v10 = [[_CDMemoryUsageInterval alloc] initWithName:@"batchFetchExistingKeywordRecords" client:0];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __70___CDInteractionStore_batchFetchExistingKeywordRecords_context_error___block_invoke;
  id v20 = &unk_1E560E9B0;
  id v11 = v10;
  id v21 = v11;
  id v12 = v9;
  id v22 = v12;
  id v13 = v8;
  id v23 = v13;
  id v24 = self;
  id v25 = &v27;
  uint64_t v26 = &v33;
  [v12 performWithOptions:4 andBlock:&v17];
  [(_CDMemoryUsageInterval *)v11 end];
  if (a5)
  {
    id v14 = (void *)v28[5];
    if (v14) {
      *a5 = v14;
    }
  }
  id v15 = (id)v34[5];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v15;
}

- (id)errorForException:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = *MEMORY[0x1E4F28568];
  uint64_t v4 = [a3 reason];
  BOOL v5 = (void *)v4;
  id v6 = @"Exception Caught";
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  v11[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v8 = [v3 errorWithDomain:@"com.apple.coreduet.CDInteractionStore" code:0 userInfo:v7];

  return v8;
}

- (id)batchFetchExistingAttachmentRecords:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy__10;
  id v37 = __Block_byref_object_dispose__10;
  id v38 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__10;
  id v31 = __Block_byref_object_dispose__10;
  id v32 = 0;
  uint64_t v10 = [[_CDMemoryUsageInterval alloc] initWithName:@"batchFetchExistingAttachmentRecords" client:0];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __73___CDInteractionStore_batchFetchExistingAttachmentRecords_context_error___block_invoke;
  id v20 = &unk_1E560E9B0;
  id v11 = v10;
  id v21 = v11;
  id v12 = v9;
  id v22 = v12;
  id v13 = v8;
  id v23 = v13;
  id v24 = self;
  id v25 = &v27;
  uint64_t v26 = &v33;
  [v12 performWithOptions:4 andBlock:&v17];
  [(_CDMemoryUsageInterval *)v11 end];
  if (a5)
  {
    id v14 = (void *)v28[5];
    if (v14) {
      *a5 = v14;
    }
  }
  id v15 = (id)v34[5];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v15;
}

- (id)batchFetchExistingContactRecords:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy__10;
  id v37 = __Block_byref_object_dispose__10;
  id v38 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__10;
  id v31 = __Block_byref_object_dispose__10;
  id v32 = 0;
  uint64_t v10 = [[_CDMemoryUsageInterval alloc] initWithName:@"batchFetchExistingContactRecords" client:0];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __70___CDInteractionStore_batchFetchExistingContactRecords_context_error___block_invoke;
  id v20 = &unk_1E560E9B0;
  id v11 = v10;
  id v21 = v11;
  id v12 = v9;
  id v22 = v12;
  id v13 = v8;
  id v23 = v13;
  id v24 = self;
  id v25 = &v27;
  uint64_t v26 = &v33;
  [v12 performWithOptions:4 andBlock:&v17];
  [(_CDMemoryUsageInterval *)v11 end];
  if (a5)
  {
    id v14 = (void *)v28[5];
    if (v14) {
      *a5 = v14;
    }
  }
  id v15 = (id)v34[5];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v15;
}

- (id)batchFetchExistingInteractionsWithUUIDs:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy__10;
  id v37 = __Block_byref_object_dispose__10;
  id v38 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__10;
  id v31 = __Block_byref_object_dispose__10;
  id v32 = 0;
  uint64_t v10 = [[_CDMemoryUsageInterval alloc] initWithName:@"batchFetchExistingInteractionsWithUUIDs" client:0];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __77___CDInteractionStore_batchFetchExistingInteractionsWithUUIDs_context_error___block_invoke;
  id v20 = &unk_1E560E9B0;
  id v11 = v10;
  id v21 = v11;
  id v12 = v9;
  id v22 = v12;
  id v13 = v8;
  id v23 = v13;
  id v24 = self;
  id v25 = &v27;
  uint64_t v26 = &v33;
  [v12 performWithOptions:4 andBlock:&v17];
  [(_CDMemoryUsageInterval *)v11 end];
  if (a5)
  {
    id v14 = (void *)v28[5];
    if (v14) {
      *a5 = v14;
    }
  }
  id v15 = (id)v34[5];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v15;
}

- (void)fillWithoutRelationshipsInteractionRecord:(id)a3 fromInteraction:(id)a4
{
  id v5 = a4;
  id v21 = a3;
  id v6 = [v5 startDate];
  [v6 timeIntervalSinceReferenceDate];
  objc_msgSend(v21, "setStartDate:");

  id v7 = [v5 updateDate];
  [v7 timeIntervalSinceReferenceDate];
  objc_msgSend(v21, "setUpdateDate:");

  id v8 = [v5 endDate];
  [v8 timeIntervalSinceReferenceDate];
  objc_msgSend(v21, "setEndDate:");

  id v9 = [v5 uuid];
  [v21 setUuid:v9];

  uint64_t v10 = [v5 locationUUID];
  [v21 setLocationUUID:v10];

  objc_msgSend(v21, "setMechanism:", objc_msgSend(v5, "mechanism"));
  objc_msgSend(v21, "setDirection:", objc_msgSend(v5, "direction"));
  objc_msgSend(v21, "setIsResponse:", objc_msgSend(v5, "isResponse"));
  id v11 = [v5 bundleId];
  [v21 setBundleId:v11];

  id v12 = [v5 targetBundleId];
  [v21 setTargetBundleId:v12];

  id v13 = [v5 groupName];
  [v21 setGroupName:v13];

  id v14 = [v5 contentURL];
  id v15 = [v14 absoluteString];
  [v21 setContentURL:v15];

  id v16 = [v5 derivedIntentIdentifier];
  [v21 setDerivedIntentIdentifier:v16];

  uint64_t v17 = [v5 domainIdentifier];
  [v21 setDomainIdentifier:v17];

  uint64_t v18 = [v5 account];
  [v21 setAccount:v18];

  uint64_t v19 = [v5 recipients];
  objc_msgSend(v21, "setRecipientCount:", objc_msgSend(v19, "count"));

  objc_msgSend(v21, "setMailShareSheetDeletionCandidate:", objc_msgSend(v5, "mailShareSheetDeletionCandidate"));
  uint64_t v20 = [v5 selfParticipantStatus];

  [v21 setSelfParticipantStatus:v20];
}

- (void)updateCachedStatsForContactRecord:(id)a3 isSender:(BOOL)a4 withInteraction:(id)a5
{
  BOOL v6 = a4;
  id v20 = a3;
  id v7 = a5;
  if (v20 && v7)
  {
    id v8 = [v7 startDate];
    [v8 timeIntervalSinceReferenceDate];
    double v10 = v9;

    if ([v7 direction])
    {
      if ([v7 direction] == 1 && !v6)
      {
        objc_msgSend(v20, "setOutgoingRecipientCount:", objc_msgSend(v20, "outgoingRecipientCount") + 1);
        [v20 lastOutgoingRecipientDate];
        if (v11 < v10) {
          [v20 setLastOutgoingRecipientDate:v10];
        }
        [v20 firstOutgoingRecipientDate];
        if (v12 == 0.0 || ([v20 firstOutgoingRecipientDate], v13 > v10)) {
          [v20 setFirstOutgoingRecipientDate:v10];
        }
      }
    }
    else if (v6)
    {
      objc_msgSend(v20, "setIncomingSenderCount:", objc_msgSend(v20, "incomingSenderCount") + 1);
      [v20 lastIncomingSenderDate];
      if (v14 < v10) {
        [v20 setLastIncomingSenderDate:v10];
      }
      [v20 firstIncomingSenderDate];
      if (v15 == 0.0 || ([v20 firstIncomingSenderDate], v16 > v10)) {
        [v20 setFirstIncomingSenderDate:v10];
      }
    }
    else
    {
      objc_msgSend(v20, "setIncomingRecipientCount:", objc_msgSend(v20, "incomingRecipientCount") + 1);
      [v20 lastIncomingRecipientDate];
      if (v17 < v10) {
        [v20 setLastIncomingRecipientDate:v10];
      }
      [v20 firstIncomingRecipientDate];
      if (v18 == 0.0 || ([v20 firstIncomingRecipientDate], v19 > v10)) {
        [v20 setFirstIncomingRecipientDate:v10];
      }
    }
  }
}

- (id)createInteractionRecord:(id)a3 context:(id)a4 keywordCache:(id)a5 attachmentCache:(id)a6 contactCache:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x3032000000;
  uint64_t v45 = __Block_byref_object_copy__10;
  id v46 = __Block_byref_object_dispose__10;
  id v47 = 0;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  unint64_t v39 = __Block_byref_object_copy__10;
  unint64_t v40 = __Block_byref_object_dispose__10;
  id v41 = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __103___CDInteractionStore_createInteractionRecord_context_keywordCache_attachmentCache_contactCache_error___block_invoke;
  v27[3] = &unk_1E560EA50;
  uint64_t v34 = &v42;
  id v19 = v15;
  id v28 = v19;
  uint64_t v29 = self;
  id v20 = v14;
  id v30 = v20;
  id v21 = v18;
  id v31 = v21;
  uint64_t v35 = &v36;
  id v22 = v16;
  id v32 = v22;
  id v23 = v17;
  id v33 = v23;
  [v19 performWithOptions:4 andBlock:v27];
  if (a8)
  {
    id v24 = (void *)v37[5];
    if (v24) {
      *a8 = v24;
    }
  }
  id v25 = (id)v43[5];

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v25;
}

- (id)dateFromTimeIntervalSinceRef:(double)a3
{
  if (a3 == 0.0)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v3];
  }
  return v5;
}

- (id)getContactForRecord:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    BOOL v6 = [v4 contact];

    if (!v6)
    {
      uint64_t v26 = [_CDContact alloc];
      id v7 = [v5 identifier];
      uint64_t v8 = (int)[v5 type];
      double v9 = [v5 customIdentifier];
      double v10 = [v5 displayName];
      uint64_t v11 = (int)[v5 displayType];
      double v12 = [v5 personId];
      uint64_t v13 = (int)[v5 personIdType];
      id v14 = [v5 displayImageURL];
      id v15 = -[_CDContact initWithIdentifier:type:customIdentifier:displayName:displayType:personId:personIdType:displayImageURL:participantStatus:](v26, "initWithIdentifier:type:customIdentifier:displayName:displayType:personId:personIdType:displayImageURL:participantStatus:", v7, v8, v9, v10, v11, v12, v13, v14, [v5 participantStatus]);
      [v5 setContact:v15];

      id v16 = objc_alloc_init(_CDContactStatistics);
      -[_CDContactStatistics setIncomingSenderCount:](v16, "setIncomingSenderCount:", (int)[v5 incomingSenderCount]);
      -[_CDContactStatistics setIncomingRecipientCount:](v16, "setIncomingRecipientCount:", (int)[v5 incomingRecipientCount]);
      -[_CDContactStatistics setOutgoingRecipientCount:](v16, "setOutgoingRecipientCount:", (int)[v5 outgoingRecipientCount]);
      [v5 firstIncomingSenderDate];
      id v17 = -[_CDInteractionStore dateFromTimeIntervalSinceRef:](self, "dateFromTimeIntervalSinceRef:");
      [(_CDContactStatistics *)v16 setFirstIncomingSenderDate:v17];

      [v5 firstIncomingRecipientDate];
      id v18 = -[_CDInteractionStore dateFromTimeIntervalSinceRef:](self, "dateFromTimeIntervalSinceRef:");
      [(_CDContactStatistics *)v16 setFirstIncomingRecipientDate:v18];

      [v5 firstOutgoingRecipientDate];
      id v19 = -[_CDInteractionStore dateFromTimeIntervalSinceRef:](self, "dateFromTimeIntervalSinceRef:");
      [(_CDContactStatistics *)v16 setFirstOutgoingRecipientDate:v19];

      [v5 lastIncomingSenderDate];
      id v20 = -[_CDInteractionStore dateFromTimeIntervalSinceRef:](self, "dateFromTimeIntervalSinceRef:");
      [(_CDContactStatistics *)v16 setLastIncomingSenderDate:v20];

      [v5 lastIncomingRecipientDate];
      id v21 = -[_CDInteractionStore dateFromTimeIntervalSinceRef:](self, "dateFromTimeIntervalSinceRef:");
      [(_CDContactStatistics *)v16 setLastIncomingRecipientDate:v21];

      [v5 lastOutgoingRecipientDate];
      id v22 = -[_CDInteractionStore dateFromTimeIntervalSinceRef:](self, "dateFromTimeIntervalSinceRef:");
      [(_CDContactStatistics *)v16 setLastOutgoingRecipientDate:v22];

      id v23 = [v5 contact];
      [v23 setStatistics:v16];
    }
    id v24 = [v5 contact];
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

- (id)createAttachmentFromRecord:(id)a3
{
  if (a3)
  {
    uint64_t v3 = NSNumber;
    id v4 = a3;
    id v5 = objc_msgSend(v3, "numberWithLongLong:", objc_msgSend(v4, "sizeInBytes"));
    if ([v5 isEqual:&unk_1EDE1D9E8])
    {

      id v5 = 0;
    }
    id v17 = [_CDAttachment alloc];
    id v16 = [v4 identifier];
    BOOL v6 = [v4 cloudIdentifier];
    id v7 = [v4 photoLocalIdentifier];
    uint64_t v8 = [v4 uti];
    id v15 = [v4 creationDate];
    double v9 = [v4 contentURL];
    double v10 = [v4 contentText];
    uint64_t v11 = [v4 photoSceneDescriptor];
    double v12 = [v4 personInPhoto];

    uint64_t v13 = [(_CDAttachment *)v17 initWithIdentifier:v16 cloudIdentifier:v6 photoLocalIdentifier:v7 type:v8 sizeInBytes:v5 creationDate:v15 contentURL:v9 contentText:v10 photoSceneDescriptor:v11 personInPhoto:v12];
  }
  else
  {
    uint64_t v13 = 0;
  }
  return v13;
}

- (id)createKeywordFromRecord:(id)a3
{
  return (id)[a3 keyword];
}

- (id)createInteractionFromRecord:(id)a3
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(_CDInteraction);
    BOOL v6 = (void *)MEMORY[0x1E4F1C9C8];
    [v4 startDate];
    id v7 = objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
    [(_CDInteraction *)v5 setStartDate:v7];

    uint64_t v8 = (void *)MEMORY[0x1E4F1C9C8];
    [v4 updateDate];
    double v9 = objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
    [(_CDInteraction *)v5 setUpdateDate:v9];

    double v10 = (void *)MEMORY[0x1E4F1C9C8];
    [v4 endDate];
    uint64_t v11 = objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:");
    [(_CDInteraction *)v5 setEndDate:v11];

    double v12 = [v4 uuid];
    [(_CDInteraction *)v5 setUuid:v12];

    uint64_t v13 = [v4 locationUUID];
    [(_CDInteraction *)v5 setLocationUUID:v13];

    -[_CDInteraction setMechanism:](v5, "setMechanism:", [v4 mechanism]);
    -[_CDInteraction setDirection:](v5, "setDirection:", [v4 direction]);
    -[_CDInteraction setIsResponse:](v5, "setIsResponse:", [v4 isResponse]);
    id v14 = [v4 bundleId];
    [(_CDInteraction *)v5 setBundleId:v14];

    id v15 = [v4 targetBundleId];
    [(_CDInteraction *)v5 setTargetBundleId:v15];

    id v16 = [v4 groupName];
    [(_CDInteraction *)v5 setGroupName:v16];

    id v17 = (void *)MEMORY[0x1E4F1CB10];
    id v18 = [v4 contentURL];
    id v19 = [v18 stringByRemovingPercentEncoding];
    id v20 = [v17 URLWithString:v19];
    [(_CDInteraction *)v5 setContentURL:v20];

    id v21 = [v4 sender];
    id v22 = [(_CDInteractionStore *)self getContactForRecord:v21];
    [(_CDInteraction *)v5 setSender:v22];

    id v23 = [v4 account];
    [(_CDInteraction *)v5 setAccount:v23];

    id v24 = [v4 derivedIntentIdentifier];
    [(_CDInteraction *)v5 setDerivedIntentIdentifier:v24];

    id v25 = [v4 domainIdentifier];
    [(_CDInteraction *)v5 setDomainIdentifier:v25];

    -[_CDInteraction setMailShareSheetDeletionCandidate:](v5, "setMailShareSheetDeletionCandidate:", [v4 mailShareSheetDeletionCandidate]);
    -[_CDInteraction setSelfParticipantStatus:](v5, "setSelfParticipantStatus:", [v4 selfParticipantStatus]);
    uint64_t v26 = [v4 recipients];
    uint64_t v27 = [v26 count];

    if (v27)
    {
      id v28 = objc_alloc(MEMORY[0x1E4F1CA48]);
      uint64_t v29 = [v4 recipients];
      id v30 = objc_msgSend(v28, "initWithCapacity:", objc_msgSend(v29, "count"));

      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      id v31 = [v4 recipients];
      uint64_t v32 = [v31 countByEnumeratingWithState:&v75 objects:v81 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v76;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v76 != v34) {
              objc_enumerationMutation(v31);
            }
            uint64_t v36 = *(void *)(*((void *)&v75 + 1) + 8 * i);
            id v37 = (void *)MEMORY[0x192FB2F20]();
            uint64_t v38 = [(_CDInteractionStore *)self getContactForRecord:v36];
            [v30 addObject:v38];
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v75 objects:v81 count:16];
        }
        while (v33);
      }

      [(_CDInteraction *)v5 setRecipients:v30];
    }
    unint64_t v39 = [v4 keywords];
    uint64_t v40 = [v39 count];

    if (v40)
    {
      id v41 = objc_alloc(MEMORY[0x1E4F1CA48]);
      uint64_t v42 = [v4 keywords];
      uint64_t v43 = objc_msgSend(v41, "initWithCapacity:", objc_msgSend(v42, "count"));

      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      uint64_t v44 = [v4 keywords];
      uint64_t v45 = [v44 countByEnumeratingWithState:&v71 objects:v80 count:16];
      if (v45)
      {
        uint64_t v46 = v45;
        uint64_t v47 = *(void *)v72;
        do
        {
          for (uint64_t j = 0; j != v46; ++j)
          {
            if (*(void *)v72 != v47) {
              objc_enumerationMutation(v44);
            }
            uint64_t v49 = *(void *)(*((void *)&v71 + 1) + 8 * j);
            v50 = (void *)MEMORY[0x192FB2F20]();
            v51 = [(_CDInteractionStore *)self createKeywordFromRecord:v49];
            if (v51) {
              [v43 addObject:v51];
            }
          }
          uint64_t v46 = [v44 countByEnumeratingWithState:&v71 objects:v80 count:16];
        }
        while (v46);
      }

      [(_CDInteraction *)v5 setKeywords:v43];
    }
    id v52 = [v4 attachments];
    uint64_t v53 = [v52 count];

    if (v53)
    {
      id v54 = objc_alloc(MEMORY[0x1E4F1CA48]);
      v55 = [v4 attachments];
      v56 = objc_msgSend(v54, "initWithCapacity:", objc_msgSend(v55, "count"));

      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      v57 = objc_msgSend(v4, "attachments", 0);
      uint64_t v58 = [v57 countByEnumeratingWithState:&v67 objects:v79 count:16];
      if (v58)
      {
        uint64_t v59 = v58;
        uint64_t v60 = *(void *)v68;
        do
        {
          for (uint64_t k = 0; k != v59; ++k)
          {
            if (*(void *)v68 != v60) {
              objc_enumerationMutation(v57);
            }
            uint64_t v62 = *(void *)(*((void *)&v67 + 1) + 8 * k);
            v63 = (void *)MEMORY[0x192FB2F20]();
            v64 = [(_CDInteractionStore *)self createAttachmentFromRecord:v62];
            [v56 addObject:v64];
          }
          uint64_t v59 = [v57 countByEnumeratingWithState:&v67 objects:v79 count:16];
        }
        while (v59);
      }

      [(_CDInteraction *)v5 setAttachments:v56];
    }
    v65 = [v4 nsUserName];
    [(_CDInteraction *)v5 setNsUserName:v65];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)recordInteraction:(id)a3
{
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObject:a3];
  LOBYTE(self) = [(_CDInteractionStore *)self recordInteractions:v4];

  return (char)self;
}

- (BOOL)recordInteractions:(id)a3
{
  return [(_CDInteractionStore *)self recordInteractionsBatch:a3 error:0];
}

- (void)recordInteractions:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60___CDInteractionStore_recordInteractions_completionHandler___block_invoke;
  v15[3] = &unk_1E560E4E0;
  v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  double v9 = v15;
  double v10 = workQueue;
  id v11 = v7;
  id v12 = v6;
  uint64_t v13 = (void *)os_transaction_create();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_3;
  block[3] = &unk_1E560D978;
  id v19 = v13;
  id v20 = v9;
  id v14 = v13;
  dispatch_async(v10, block);
}

- (BOOL)recordInteractionsBatch:(id)a3 error:(id *)a4
{
  uint64_t v176 = *MEMORY[0x1E4F143B8];
  id v104 = a3;
  v126 = self;
  v105 = [(_DKCoreDataStorage *)self->_storage managedObjectContextFor:*MEMORY[0x1E4F28358]];
  oslog = +[_CDLogging interactionChannel];
  if (!v105)
  {
    if (os_log_type_enabled(&oslog->super, OS_LOG_TYPE_ERROR)) {
      -[_CDInteractionStore recordInteractionsBatch:error:].cold.4();
    }
    goto LABEL_95;
  }
  id v5 = oslog;
  if (os_log_type_enabled(&oslog->super, OS_LOG_TYPE_INFO))
  {
    id v6 = v104;
    uint64_t v7 = [v104 count];
    unint64_t v8 = [v104 count];
    if (v8 >= 0xB)
    {
      double v9 = (void *)MEMORY[0x192FB2F20]();
      id v6 = objc_msgSend(v104, "subarrayWithRange:", 0, 10);
    }
    *(_DWORD *)buf = 134218243;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2117;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_18ECEB000, &oslog->super, OS_LOG_TYPE_INFO, "recordInteractionsBatch - recording: %tu interactions %{sensitive}@", buf, 0x16u);
    if (v8 >= 0xB) {

    }
    id v5 = oslog;
  }

  oslog = [[_CDMemoryUsageInterval alloc] initWithName:@"recordInteractionsBatchPreprocessing" client:0];
  [(_CDMemoryUsageInterval *)oslog begin];
  double v10 = (void *)[v104 mutableCopy];
  pendingShareInteractionQueue = v126->_pendingShareInteractionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53___CDInteractionStore_recordInteractionsBatch_error___block_invoke;
  block[3] = &unk_1E560DB80;
  id v159 = v104;
  id v103 = v10;
  id v160 = v103;
  v161 = v126;
  dispatch_sync(pendingShareInteractionQueue, block);
  id v12 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[_CDInteractionStore recordInteractionsBatch:error:]();
  }

  if (![v103 count])
  {
    [(_CDMemoryUsageInterval *)oslog end];
    goto LABEL_94;
  }
  uint64_t v13 = [v103 sortedArrayUsingComparator:&__block_literal_global_32];
  id v14 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[_CDInteractionStore recordInteractionsBatch:error:]();
  }

  v112 = [MEMORY[0x1E4F1CA60] dictionary];
  id v15 = [MEMORY[0x1E4F1CA60] dictionary];
  v114 = [MEMORY[0x1E4F1CA48] array];
  long long v156 = 0u;
  long long v157 = 0u;
  long long v154 = 0u;
  long long v155 = 0u;
  obuint64_t j = v13;
  uint64_t v16 = [obj countByEnumeratingWithState:&v154 objects:v175 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v155;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v155 != v17) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(void **)(*((void *)&v154 + 1) + 8 * v18);
        id v20 = [v19 targetBundleId];
        id v21 = +[_CDConstants shareSheetTargetBundleIdMail]();
        int v22 = [v20 isEqualToString:v21];

        if (v22)
        {
          [v19 setMailShareSheetDeletionCandidate:1];
          [v114 addObject:v19];
          goto LABEL_30;
        }
        id v23 = [v19 bundleId];
        id v24 = +[_CDConstants mobileMessagesBundleId]();
        if (![v23 isEqualToString:v24]) {
          goto LABEL_28;
        }
        id v25 = [v19 groupName];
        if (!v25) {
          goto LABEL_28;
        }
        uint64_t v26 = [v19 domainIdentifier];
        if (!v26)
        {

LABEL_28:
LABEL_29:
          [v114 addObject:v19];
          goto LABEL_30;
        }
        BOOL v27 = [v19 mechanism] == 4;

        if (!v27) {
          goto LABEL_29;
        }
        BOOL v28 = [v19 direction] == 0;
        uint64_t v29 = [v19 domainIdentifier];
        if (v28)
        {
          [v15 setObject:v19 forKeyedSubscript:v29];
        }
        else
        {
          [v112 setObject:v19 forKeyedSubscript:v29];

          id v30 = [v19 domainIdentifier];
          id v31 = [v15 objectForKeyedSubscript:v30];
          BOOL v32 = v31 == 0;

          if (!v32)
          {
            uint64_t v33 = [v19 domainIdentifier];
            [v15 removeObjectForKey:v33];
          }
        }
LABEL_30:
        ++v18;
      }
      while (v16 != v18);
      uint64_t v34 = [obj countByEnumeratingWithState:&v154 objects:v175 count:16];
      uint64_t v16 = v34;
    }
    while (v34);
  }

  long long v152 = 0u;
  long long v153 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  id v113 = v15;
  uint64_t v110 = [v113 countByEnumeratingWithState:&v150 objects:v174 count:16];
  if (!v110) {
    goto LABEL_59;
  }
  uint64_t v108 = *(void *)v151;
  do
  {
    for (uint64_t i = 0; i != v110; ++i)
    {
      if (*(void *)v151 != v108) {
        objc_enumerationMutation(v113);
      }
      uint64_t v36 = *(void *)(*((void *)&v150 + 1) + 8 * i);
      id v37 = [v113 objectForKeyedSubscript:v36];
      [v114 addObject:v37];
      v116 = [v112 objectForKeyedSubscript:v36];
      uint64_t v38 = [MEMORY[0x1E4F1CA48] array];
      unint64_t v39 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v40 = [v37 startDate];
      v124 = [v39 predicateWithFormat:@"(startDate <= %@)", v40];

      [v38 addObject:v124];
      id v41 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v42 = +[_CDConstants mobileMessagesBundleId]();
      v122 = [v41 predicateWithFormat:@"(bundleId == %@)", v42];

      [v38 addObject:v122];
      v120 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(domainIdentifier == %@)", v36];
      [v38 addObject:v120];
      uint64_t v43 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v44 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EDE1E608];
      id v118 = [v43 predicateWithFormat:@"(direction IN %@)", v44];

      [v38 addObject:v118];
      v117 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v38];
      uint64_t v45 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
      id v142 = 0;
      v173 = v45;
      uint64_t v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v173 count:1];
      id v149 = 0;
      uint64_t v47 = [(_CDInteractionStore *)v126 queryInteractionsUsingPredicate:v117 sortDescriptors:v46 limit:1 offset:0 objectIDs:&v142 error:&v149];
      id v48 = v149;
      uint64_t v49 = [v47 firstObject];

      v50 = (void *)MEMORY[0x192FB2F20]();
      v51 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self in %@", v142];
      if (v48)
      {
        id v52 = +[_CDLogging interactionChannel];
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v48;
          _os_log_error_impl(&dword_18ECEB000, v52, OS_LOG_TYPE_ERROR, "Error retrieving old interaction from store when attempting messages groupName update: %@", buf, 0xCu);
        }
LABEL_42:

        goto LABEL_57;
      }
      if (v49 && v116)
      {
        uint64_t v53 = [v116 startDate];
        id v54 = [v49 startDate];
        [v53 timeIntervalSinceDate:v54];
        BOOL v56 = v55 < 0.0;

        if (!v56)
        {
          v57 = [v37 groupName];
          [v116 setGroupName:v57];

          uint64_t v58 = [v37 contentURL];
          [v116 setContentURL:v58];

          uint64_t v59 = [(_CDInteractionStore *)v126 recipientArrayWithMostRecentSenderFirstFromIncomingInteraction:v37 outgoingInteraction:v116];
          [v116 setRecipients:v59];

          [v112 removeObjectForKey:v36];
          [v114 addObject:v116];
          goto LABEL_56;
        }
      }
      else if (!v49)
      {
        [v37 contentURL];

        goto LABEL_56;
      }
      uint64_t v60 = [v37 groupName];
      [v49 setGroupName:v60];

      v61 = [v37 contentURL];
      [v49 setContentURL:v61];

      uint64_t v62 = [v37 sender];
      LODWORD(v61) = v62 == 0;

      if (v61)
      {
        v63 = [v37 recipients];
        [v49 setRecipients:v63];
      }
      v64 = [(_CDInteractionStore *)v126 recipientArrayWithMostRecentSenderFirstFromIncomingInteraction:v37 outgoingInteraction:v49];
      [v49 setRecipients:v64];

      id v148 = 0;
      [(_CDInteractionStore *)v126 deleteInteractionsMatchingPredicate:v51 sortDescriptors:0 limit:1 debuggingReason:@"recordInteractionsBatch upsert (case A)" error:&v148];
      id v65 = v148;
      if (v65)
      {
        id v48 = v65;
        id v52 = +[_CDLogging interactionChannel];
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v48;
          _os_log_error_impl(&dword_18ECEB000, v52, OS_LOG_TYPE_ERROR, "Error deleting old interaction from store when attempting messages groupName update: %@", buf, 0xCu);
        }
        goto LABEL_42;
      }
      [v114 addObject:v49];
LABEL_56:
      id v48 = 0;
LABEL_57:
    }
    uint64_t v110 = [v113 countByEnumeratingWithState:&v150 objects:v174 count:16];
  }
  while (v110);
LABEL_59:

  v111 = [v112 allValues];
  [v114 addObjectsFromArray:v111];
  [(_CDMemoryUsageInterval *)oslog end];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v170 = __Block_byref_object_copy__10;
  v171 = __Block_byref_object_dispose__10;
  id v172 = 0;
  id v142 = 0;
  v143 = &v142;
  uint64_t v144 = 0x3032000000;
  v145 = __Block_byref_object_copy__10;
  v146 = __Block_byref_object_dispose__10;
  id v147 = [MEMORY[0x1E4F1CA80] set];
  v66 = [[_CDMemoryUsageInterval alloc] initWithName:@"recordInteractionsBatch" client:0];
  v135[0] = MEMORY[0x1E4F143A8];
  v135[1] = 3221225472;
  v135[2] = __53___CDInteractionStore_recordInteractionsBatch_error___block_invoke_281;
  v135[3] = &unk_1E560E9B0;
  long long v67 = v66;
  v136 = v67;
  id v68 = v114;
  id v137 = v68;
  v138 = v126;
  id v139 = v105;
  v140 = buf;
  v141 = &v142;
  id v121 = v139;
  [v139 performWithOptions:4 andBlock:v135];
  [(_CDMemoryUsageInterval *)v67 end];
  v109 = v67;
  long long v69 = [[_CDMemoryUsageInterval alloc] initWithName:@"recordInteractionsBatchPostProcessing" client:0];
  [(_CDMemoryUsageInterval *)v69 begin];
  v115 = v69;
  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  id v119 = v143[5];
  uint64_t v70 = [v119 countByEnumeratingWithState:&v131 objects:v168 count:16];
  v123 = v68;
  if (v70)
  {
    LOBYTE(v71) = 0;
    uint64_t v125 = *(void *)v132;
    do
    {
      for (uint64_t j = 0; j != v70; ++j)
      {
        if (*(void *)v132 != v125) {
          objc_enumerationMutation(v119);
        }
        uint64_t v73 = *(void *)(*((void *)&v131 + 1) + 8 * j);
        long long v74 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid == %@", v73];
        long long v75 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"updateDate" ascending:0];
        v167 = v75;
        long long v76 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v167 count:1];
        long long v77 = (id *)(*(void *)&buf[8] + 40);
        id v130 = *(id *)(*(void *)&buf[8] + 40);
        long long v78 = [(_CDInteractionStore *)v126 queryInteractionsUsingPredicate:v74 sortDescriptors:v76 limit:1 error:&v130];
        objc_storeStrong(v77, v130);
        v79 = [v78 firstObject];

        if (v71) {
          goto LABEL_65;
        }
        v80 = [v79 bundleId];
        v81 = +[_CDConstants mobileMessagesBundleId]();
        if ([v80 isEqualToString:v81])
        {
          uint64_t v82 = [v79 recipients];
          BOOL v71 = (unint64_t)[v82 count] > 1;

          if (v71)
          {
            notify_post((const char *)[@"com.apple.CoreDuet.InteractionStore.MessagesGroupInfoChange" UTF8String]);
LABEL_65:
            LOBYTE(v71) = 1;
          }
        }
        else
        {

          LOBYTE(v71) = 0;
        }
        if (v79)
        {
          v83 = (void *)MEMORY[0x1E4F28F60];
          v84 = [v79 updateDate];
          v85 = [v83 predicateWithFormat:@"uuid == %@ AND updateDate < %@", v73, v84];

          v86 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"updateDate" ascending:0];
          v166 = v86;
          v87 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v166 count:1];
          v88 = (id *)(*(void *)&buf[8] + 40);
          id v129 = *(id *)(*(void *)&buf[8] + 40);
          v89 = [(_CDInteractionStore *)v126 queryInteractionsUsingPredicate:v85 sortDescriptors:v87 limit:1 error:&v129];
          objc_storeStrong(v88, v129);
          v90 = [v89 firstObject];

          v91 = +[_CDLogging interactionChannel];
          if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v162 = 138412290;
            uint64_t v163 = (uint64_t)v79;
            _os_log_debug_impl(&dword_18ECEB000, v91, OS_LOG_TYPE_DEBUG, "duplicateUUID handling, latest interaction: %@", v162, 0xCu);
          }

          v92 = +[_CDLogging interactionChannel];
          if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v162 = 138412290;
            uint64_t v163 = (uint64_t)v90;
            _os_log_debug_impl(&dword_18ECEB000, v92, OS_LOG_TYPE_DEBUG, "duplicateUUID handling, toBeDeletedInteraction: %@", v162, 0xCu);
          }

          if ([v90 mechanism] == 13)
          {
            v93 = +[_CDLogging interactionChannel];
            if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG)) {
              -[_CDInteractionStore recordInteractionsBatch:error:](&v127, v128, v93);
            }

            v94 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid == %@ AND mechanism == %@", v73, &unk_1EDE1DA30];
            v95 = +[_CDInteractionStore predicateFilteringUsernameForPredicate:v94];
            LOBYTE(v101) = 0;
            +[_DKCoreDataStorage deleteObjectsInContext:v121 entityName:@"Interactions" predicate:v95 sortDescriptors:0 fetchLimit:0 includeSubentities:0 includePendingChanges:v101];
          }
          else
          {
            v94 = +[_CDInteractionStore predicateFilteringUsernameForPredicate:v85];
            LOBYTE(v100) = 0;
            +[_DKCoreDataStorage deleteObjectsInContext:v121 entityName:@"Interactions" predicate:v94 sortDescriptors:0 fetchLimit:0 includeSubentities:0 includePendingChanges:v100];
          }

          [v123 removeObject:v79];
        }
      }
      uint64_t v70 = [v119 countByEnumeratingWithState:&v131 objects:v168 count:16];
    }
    while (v70);
  }

  if (a4)
  {
    v96 = *(void **)(*(void *)&buf[8] + 40);
    if (v96) {
      *a4 = v96;
    }
  }
  if ([v123 count]) {
    [(_CDInteractionStoreNotifier *)v126->_notifier recorded:v123];
  }
  [(_CDMemoryUsageInterval *)v115 end];
  v97 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
  {
    uint64_t v98 = [v123 count];
    *(_DWORD *)v162 = 134218243;
    uint64_t v163 = v98;
    __int16 v164 = 2117;
    v165 = v123;
    _os_log_impl(&dword_18ECEB000, v97, OS_LOG_TYPE_INFO, "recordInteractionsBatch - recorded %tu interactions, %{sensitive}@", v162, 0x16u);
  }

  _Block_object_dispose(&v142, 8);
  _Block_object_dispose(buf, 8);

LABEL_94:
LABEL_95:

  return v105 != 0;
}

- (BOOL)openAndCheckIfReadable
{
  v2 = [(_DKCoreDataStorage *)self->_storage managedObjectContextFor:*MEMORY[0x1E4F28358]];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)recipientArrayWithMostRecentSenderFirstFromIncomingInteraction:(id)a3 outgoingInteraction:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  double v9 = [v8 recipients];
  double v10 = (void *)[v9 mutableCopy];

  id v11 = [v7 sender];
  if (v11 && [v10 containsObject:v11])
  {
    [v10 removeObject:v11];
    [v10 insertObject:v11 atIndex:0];
    goto LABEL_20;
  }
  id v12 = objc_msgSend(v11, "identifier", v8, v7);
  uint64_t v13 = [v11 personId];
  if (![v10 count]) {
    goto LABEL_19;
  }
  uint64_t v14 = 0;
  while (1)
  {
    if (!v13)
    {
      if (!v12) {
        goto LABEL_15;
      }
      goto LABEL_11;
    }
    id v4 = [v10 objectAtIndexedSubscript:v14];
    id v5 = [v4 personId];
    if ([v5 isEqualToString:v13]) {
      break;
    }
    if (!v12)
    {

      goto LABEL_15;
    }
LABEL_11:
    id v15 = [v10 objectAtIndexedSubscript:v14];
    uint64_t v16 = [v15 identifier];
    int v17 = [v16 isEqualToString:v12];

    if (v13)
    {

      if (v17) {
        goto LABEL_18;
      }
    }
    else if (v17)
    {
      goto LABEL_18;
    }
LABEL_15:
    if ([v10 count] <= (unint64_t)++v14) {
      goto LABEL_19;
    }
  }

LABEL_18:
  [v10 removeObjectAtIndex:v14];
  [v10 insertObject:v11 atIndex:0];
LABEL_19:

  id v8 = v20;
  id v7 = v21;
LABEL_20:
  uint64_t v18 = (void *)[v10 copy];

  return v18;
}

- (BOOL)updateInteractionsBatch:(id)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 count])
  {
    id v7 = [(_CDInteractionStore *)self predicateForInteractions:v6];
    unint64_t v8 = [(_CDInteractionStore *)self deleteInteractionsMatchingPredicate:v7 sortDescriptors:0 limit:-1 debuggingReason:@"updateInteractionsBatch" error:0];
    double v9 = +[_CDLogging mediaAnalysisChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134218240;
      unint64_t v13 = v8;
      __int16 v14 = 2048;
      uint64_t v15 = [v6 count];
      _os_log_impl(&dword_18ECEB000, v9, OS_LOG_TYPE_DEFAULT, "Deleted %tu interactions, creating %tu interactions", (uint8_t *)&v12, 0x16u);
    }

    BOOL v10 = [(_CDInteractionStore *)self recordInteractionsBatch:v6 error:a4];
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (id)predicateForInteractions:(id)a3
{
  BOOL v3 = objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_304);
  id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid in %@", v3];

  return v4;
}

- (unint64_t)countInteractionsUsingPredicate:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [[_CDMemoryUsageInterval alloc] initWithName:@"countInteractionsUsingPredicate" client:0];
  [(_CDMemoryUsageInterval *)v6 begin];
  id v7 = [(_DKCoreDataStorage *)self->_storage managedObjectContextFor:*MEMORY[0x1E4F28358]];
  unint64_t v8 = +[_CDInteractionStore predicateFilteringUsernameForPredicate:v5];

  unint64_t v9 = +[_DKCoreDataStorage countObjectsInContext:v7 entityName:@"Interactions" predicate:v8 includeSubentities:0 includePendingChanges:0];
  [(_CDMemoryUsageInterval *)v6 end];

  return v9;
}

- (void)countInteractionsUsingPredicate:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __73___CDInteractionStore_countInteractionsUsingPredicate_completionHandler___block_invoke;
    v13[3] = &unk_1E560E4E0;
    v13[4] = self;
    id v14 = v6;
    id v15 = v7;
    unint64_t v9 = v13;
    BOOL v10 = workQueue;
    id v11 = (void *)os_transaction_create();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_3;
    block[3] = &unk_1E560D978;
    id v17 = v11;
    id v18 = v9;
    id v12 = v11;
    dispatch_async(v10, block);
  }
}

- (unint64_t)countContactsUsingPredicate:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [[_CDMemoryUsageInterval alloc] initWithName:@"countContactsUsingPredicate" client:0];
  [(_CDMemoryUsageInterval *)v6 begin];
  id v7 = [(_DKCoreDataStorage *)self->_storage managedObjectContextFor:*MEMORY[0x1E4F28358]];
  unint64_t v8 = +[_DKCoreDataStorage countObjectsInContext:v7 entityName:@"Contacts" predicate:v5 includeSubentities:0 includePendingChanges:0];

  [(_CDMemoryUsageInterval *)v6 end];
  return v8;
}

- (void)countContactsUsingPredicate:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __69___CDInteractionStore_countContactsUsingPredicate_completionHandler___block_invoke;
    v13[3] = &unk_1E560E4E0;
    v13[4] = self;
    id v14 = v6;
    id v15 = v7;
    unint64_t v9 = v13;
    BOOL v10 = workQueue;
    id v11 = (void *)os_transaction_create();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_3;
    block[3] = &unk_1E560D978;
    id v17 = v11;
    id v18 = v9;
    id v12 = v11;
    dispatch_async(v10, block);
  }
}

- (unint64_t)numberOfInteractionsMatchingPredicate:(id)a3
{
  return [(_CDInteractionStore *)self countInteractionsUsingPredicate:a3 error:0];
}

- (id)queryInteractionsUsingPredicate:(id)a3 matchingNameTokens:(id)a4 sortDescriptors:(id)a5 limit:(unint64_t)a6 error:(id *)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v9 = a4;
  id v27 = a5;
  BOOL v10 = [MEMORY[0x1E4F1CA48] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        id v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY recipients.displayName CONTAINS[cd] %@", v16];
        id v18 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"sender.displayName CONTAINS[cd] %@", v16];
        [v10 addObject:v17];
        [v10 addObject:v18];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v13);
  }

  uint64_t v19 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v10];
  id v20 = (void *)v19;
  if (v30)
  {
    id v21 = (void *)MEMORY[0x1E4F28BA0];
    v35[0] = v30;
    v35[1] = v19;
    int v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
    uint64_t v23 = [v21 andPredicateWithSubpredicates:v22];

    id v20 = (void *)v23;
  }
  id v24 = [(_CDInteractionStore *)self queryInteractionsUsingPredicate:v20 sortDescriptors:v27 limit:a6 offset:0 error:a7];

  return v24;
}

- (id)queryInteractionsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5
{
  return [(_CDInteractionStore *)self queryInteractionsUsingPredicate:a3 sortDescriptors:a4 limit:a5 error:0];
}

- (void)queryInteractionsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v12)
  {
    workQueue = self->_workQueue;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __95___CDInteractionStore_queryInteractionsUsingPredicate_sortDescriptors_limit_completionHandler___block_invoke;
    v18[3] = &unk_1E560EAC0;
    void v18[4] = self;
    id v19 = v10;
    id v20 = v11;
    unint64_t v22 = a5;
    id v21 = v12;
    uint64_t v14 = v18;
    id v15 = workQueue;
    uint64_t v16 = (void *)os_transaction_create();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_3;
    block[3] = &unk_1E560D978;
    id v24 = v16;
    id v25 = v14;
    id v17 = v16;
    dispatch_async(v15, block);
  }
}

- (id)queryInteractionsUsingPredicate:(id)a3 withLimit:(unint64_t)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = (objc_class *)MEMORY[0x1E4F29008];
  id v7 = a3;
  unint64_t v8 = (void *)[[v6 alloc] initWithKey:@"startDate" ascending:0];
  v12[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

  id v10 = [(_CDInteractionStore *)self queryInteractionsUsingPredicate:v7 sortDescriptors:v9 limit:a4];

  return v10;
}

- (id)queryContactsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 error:(id *)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a5;
    _os_log_impl(&dword_18ECEB000, v12, OS_LOG_TYPE_INFO, "queryContactsUsingPredicate - querying for %tu items from interaction store", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v41 = 0x3032000000;
  uint64_t v42 = __Block_byref_object_copy__10;
  uint64_t v43 = __Block_byref_object_dispose__10;
  id v44 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000;
  uint64_t v37 = __Block_byref_object_copy__10;
  uint64_t v38 = __Block_byref_object_dispose__10;
  id v39 = 0;
  uint64_t v13 = [(_DKCoreDataStorage *)self->_storage managedObjectContextFor:*MEMORY[0x1E4F28358]];
  uint64_t v14 = [[_CDMemoryUsageInterval alloc] initWithName:@"queryContactsUsingPredicate" client:0];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  id v24 = __79___CDInteractionStore_queryContactsUsingPredicate_sortDescriptors_limit_error___block_invoke;
  id v25 = &unk_1E560EAE8;
  id v15 = v14;
  uint64_t v26 = v15;
  id v16 = v13;
  id v27 = v16;
  id v17 = v10;
  id v28 = v17;
  id v18 = v11;
  id v29 = v18;
  id v30 = self;
  long long v31 = &v34;
  p_long long buf = &buf;
  unint64_t v33 = a5;
  [v16 performWithOptions:4 andBlock:&v22];
  [(_CDMemoryUsageInterval *)v15 end];
  if (a6)
  {
    id v19 = (void *)v35[5];
    if (v19) {
      *a6 = v19;
    }
  }
  id v20 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&buf, 8);

  return v20;
}

- (id)queryContactsUsingPredicate:(id)a3 withLimit:(unint64_t)a4 error:(id *)a5
{
  return [(_CDInteractionStore *)self queryContactsUsingPredicate:a3 sortDescriptors:0 limit:a4 error:0];
}

- (void)queryContactsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v12)
  {
    workQueue = self->_workQueue;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __91___CDInteractionStore_queryContactsUsingPredicate_sortDescriptors_limit_completionHandler___block_invoke;
    v18[3] = &unk_1E560EAC0;
    void v18[4] = self;
    id v19 = v10;
    id v20 = v11;
    unint64_t v22 = a5;
    id v21 = v12;
    uint64_t v14 = v18;
    id v15 = workQueue;
    id v16 = (void *)os_transaction_create();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_3;
    block[3] = &unk_1E560D978;
    id v24 = v16;
    id v25 = v14;
    id v17 = v16;
    dispatch_async(v15, block);
  }
}

- (unint64_t)numberOfContactsMatchingPredicate:(id)a3
{
  return [(_CDInteractionStore *)self countContactsUsingPredicate:a3 error:0];
}

- (id)queryContactInteractionsUsingPredicate:(id)a3 withLimit:(unint64_t)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a4;
    _os_log_impl(&dword_18ECEB000, v7, OS_LOG_TYPE_INFO, "queryContactInteractionsUsingPredicate - querying for %tu items from interaction store", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__10;
  id v28 = __Block_byref_object_dispose__10;
  id v29 = 0;
  unint64_t v8 = [(_DKCoreDataStorage *)self->_storage managedObjectContextFor:*MEMORY[0x1E4F28358]];
  id v9 = [[_CDMemoryUsageInterval alloc] initWithName:@"queryContactInteractionsUsingPredicate" client:0];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __72___CDInteractionStore_queryContactInteractionsUsingPredicate_withLimit___block_invoke;
  id v18 = &unk_1E560EB10;
  id v10 = v9;
  id v19 = v10;
  id v11 = v8;
  id v20 = v11;
  id v12 = v6;
  id v21 = v12;
  unint64_t v22 = self;
  p_long long buf = &buf;
  unint64_t v24 = a4;
  [v11 performWithOptions:4 andBlock:&v15];
  [(_CDMemoryUsageInterval *)v10 end];
  id v13 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v13;
}

- (id)histogramContactInteractionsUsingPredicate:(id)a3 withLimit:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__10;
  id v28 = __Block_byref_object_dispose__10;
  id v29 = 0;
  id v7 = [(_DKCoreDataStorage *)self->_storage managedObjectContextFor:*MEMORY[0x1E4F28358]];
  unint64_t v8 = [[_CDMemoryUsageInterval alloc] initWithName:@"histogramContactInteractionsUsingPredicate" client:0];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __76___CDInteractionStore_histogramContactInteractionsUsingPredicate_withLimit___block_invoke;
  id v17 = &unk_1E560EB38;
  id v9 = v8;
  id v18 = v9;
  id v10 = v7;
  id v19 = v10;
  id v11 = v6;
  unint64_t v22 = &v24;
  unint64_t v23 = a4;
  id v20 = v11;
  id v21 = self;
  [v10 performWithOptions:4 andBlock:&v14];
  [(_CDMemoryUsageInterval *)v9 end];
  id v12 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v12;
}

- (id)interactionCountPerMechanism
{
  BOOL v3 = objc_opt_new();
  for (unint64_t i = 0; i != 21; ++i)
  {
    id v5 = (void *)MEMORY[0x1E4F28F60];
    id v6 = [NSNumber numberWithInteger:i];
    id v7 = [v5 predicateWithFormat:@"mechanism = %@", v6];

    unint64_t v8 = [(_CDInteractionStore *)self countInteractionsUsingPredicate:v7 error:0];
    if (v8)
    {
      id v9 = [NSNumber numberWithUnsignedInteger:v8];
      id v10 = mechanismToString(i);
      [v3 setObject:v9 forKeyedSubscript:v10];
    }
  }
  return v3;
}

- (id)usersWithInteractions
{
  BOOL v3 = objc_opt_new();
  id v4 = [(_DKCoreDataStorage *)self->_storage managedObjectContextFor:*MEMORY[0x1E4F28358]];
  id v5 = [[_CDMemoryUsageInterval alloc] initWithName:@"usersWithInteractions" client:0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __44___CDInteractionStore_usersWithInteractions__block_invoke;
  v12[3] = &unk_1E560DB80;
  id v13 = v5;
  id v14 = v4;
  id v6 = v3;
  id v15 = v6;
  id v7 = v4;
  unint64_t v8 = v5;
  [v7 performWithOptions:4 andBlock:v12];
  [(_CDMemoryUsageInterval *)v8 end];
  id v9 = v15;
  id v10 = v6;

  return v10;
}

- (id)conversationsWithInteractions
{
  BOOL v3 = objc_opt_new();
  id v4 = [(_DKCoreDataStorage *)self->_storage managedObjectContextFor:*MEMORY[0x1E4F28358]];
  id v5 = [[_CDMemoryUsageInterval alloc] initWithName:@"conversationsWithInteractions" client:0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __52___CDInteractionStore_conversationsWithInteractions__block_invoke;
  v12[3] = &unk_1E560DB80;
  id v13 = v5;
  id v14 = v4;
  id v6 = v3;
  id v15 = v6;
  id v7 = v4;
  unint64_t v8 = v5;
  [v7 performWithOptions:4 andBlock:v12];
  [(_CDMemoryUsageInterval *)v8 end];
  id v9 = v15;
  id v10 = v6;

  return v10;
}

- (id)kMostRecentConversationsWithLimit:(unint64_t)a3 predicate:(id)a4
{
  id v6 = a4;
  id v7 = objc_opt_new();
  unint64_t v8 = [(_DKCoreDataStorage *)self->_storage managedObjectContextFor:*MEMORY[0x1E4F28358]];
  id v9 = [[_CDMemoryUsageInterval alloc] initWithName:@"kMostRecentConversationsWithLimit" client:0];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67___CDInteractionStore_kMostRecentConversationsWithLimit_predicate___block_invoke;
  v17[3] = &unk_1E560EB60;
  id v18 = v9;
  id v19 = v8;
  id v20 = v6;
  id v10 = v7;
  id v21 = v10;
  unint64_t v22 = a3;
  id v11 = v6;
  id v12 = v8;
  id v13 = v9;
  [v12 performWithOptions:4 andBlock:v17];
  [(_CDMemoryUsageInterval *)v13 end];
  id v14 = v21;
  id v15 = v10;

  return v15;
}

- (id)getInteractionsStatisticsForConfig:(id)a3
{
  id v4 = a3;
  id v5 = [_CDInteractionsStatistics alloc];
  id v6 = [v4 defaultValues];
  id v7 = [(_CDInteractionsStatistics *)v5 initWithDefaultValues:v6];

  unint64_t v8 = [(_DKCoreDataStorage *)self->_storage managedObjectContextFor:*MEMORY[0x1E4F28358]];
  id v9 = [[_CDMemoryUsageInterval alloc] initWithName:@"getInteractionsStatisticsForConfig" client:0];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __58___CDInteractionStore_getInteractionsStatisticsForConfig___block_invoke;
  id v20 = &unk_1E560EBB0;
  id v21 = v9;
  id v22 = v8;
  id v23 = v4;
  id v10 = v7;
  uint64_t v24 = v10;
  id v11 = v4;
  id v12 = v8;
  id v13 = v9;
  [v12 performWithOptions:4 andBlock:&v17];
  [(_CDMemoryUsageInterval *)v13 end];
  id v14 = v24;
  id v15 = v10;

  return v15;
}

- (void)enterMaintenanceMode
{
  self->_inMaintenanceMode = 1;
  [(_CDInteractionStoreNotifier *)self->_notifier suspend];
}

- (void)exitMaintenanceMode
{
  self->_inMaintenanceMode = 0;
}

- (unint64_t)deleteUnreferencedKeywords
{
  v2 = [(_DKCoreDataStorage *)self->_storage managedObjectContextFor:*MEMORY[0x1E4F28358]];
  BOOL v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"interactions.@count == 0"];
  LOBYTE(v6) = 0;
  unint64_t v4 = +[_DKCoreDataStorage deleteObjectsInContext:v2 entityName:@"Keywords" predicate:v3 sortDescriptors:MEMORY[0x1E4F1CBF0] fetchLimit:20000 includeSubentities:0 includePendingChanges:v6];

  return v4;
}

- (unint64_t)deleteUnreferencedContacts
{
  v2 = [(_DKCoreDataStorage *)self->_storage managedObjectContextFor:*MEMORY[0x1E4F28358]];
  BOOL v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"interactionRecipient.@count == 0 AND interactionSender.@count == 0"];
  LOBYTE(v6) = 0;
  unint64_t v4 = +[_DKCoreDataStorage deleteObjectsInContext:v2 entityName:@"Contacts" predicate:v3 sortDescriptors:MEMORY[0x1E4F1CBF0] fetchLimit:20000 includeSubentities:0 includePendingChanges:v6];

  return v4;
}

- (unint64_t)deleteInteractionsOlderThanDate:(id)a3 limit:(unint64_t)a4
{
  return [(_CDInteractionStore *)self deleteInteractionsOlderThanDate:a3 debuggingReason:@"deleteInteractionsOlderThanDate" limit:a4];
}

- (unint64_t)deleteInteractionsOlderThanDate:(id)a3 debuggingReason:(id)a4 limit:(unint64_t)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  unint64_t v8 = (void *)MEMORY[0x1E4F29008];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 sortDescriptorWithKey:@"startDate" ascending:1];
  id v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"startDate < %@", v10];

  v16[0] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  unint64_t v14 = [(_CDInteractionStore *)self deleteInteractionsMatchingPredicate:v12 sortDescriptors:v13 limit:a5 debuggingReason:v9 error:0];

  return v14;
}

- (unint64_t)deleteOldInteractionsIfNeededToLimitTotalNumber:(unint64_t)a3 limit:(unint64_t)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
  unint64_t v8 = [(_DKCoreDataStorage *)self->_storage managedObjectContextFor:*MEMORY[0x1E4F28358]];
  id v9 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  v21[0] = v7;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  LOWORD(v14) = 1;
  unint64_t v11 = +[_DKCoreDataStorage deleteObjectsIfNeededToLimitTotal:context:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:](_DKCoreDataStorage, "deleteObjectsIfNeededToLimitTotal:context:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:", a3, v8, @"Interactions", v9, v10, a4, v14);

  if (v11)
  {
    id v12 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      unint64_t v16 = v11;
      __int16 v17 = 2048;
      unint64_t v18 = a3;
      __int16 v19 = 2048;
      unint64_t v20 = a4;
      _os_log_impl(&dword_18ECEB000, v12, OS_LOG_TYPE_DEFAULT, "Deleted %tu interactions due to age (deleteOldInteractionsIfNeededToLimitTotalNumber:%tu limit:%tu)", buf, 0x20u);
    }

    [(_CDInteractionStore *)self deleteUnreferencedKeywords];
    [(_CDInteractionStore *)self deleteUnreferencedContacts];
    if (!self->_inMaintenanceMode) {
      [(_CDInteractionStoreNotifier *)self->_notifier deleteAll];
    }
  }

  return v11;
}

- (void)closeStorage
{
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_DEBUG, "Closing interaction storage connection", v1, 2u);
}

- (int64_t)queryVersionNumber
{
  v2 = [(_DKCoreDataStorage *)self->_storage managedObjectContextFor:*MEMORY[0x1E4F28358]];
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  unint64_t v12 = 0x8000000000000000;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41___CDInteractionStore_queryVersionNumber__block_invoke;
  v6[3] = &unk_1E560EBD8;
  id v3 = v2;
  id v7 = v3;
  unint64_t v8 = &v9;
  [v3 performWithOptions:4 andBlock:v6];
  int64_t v4 = v10[3];

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (BOOL)recordVersionNumber:(int64_t)a3
{
  int64_t v4 = [(_DKCoreDataStorage *)self->_storage managedObjectContextFor:*MEMORY[0x1E4F28358]];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43___CDInteractionStore_recordVersionNumber___block_invoke;
  v7[3] = &unk_1E560EC00;
  id v8 = v4;
  int64_t v9 = a3;
  id v5 = v4;
  [v5 performWithOptions:4 andBlock:v7];

  return 1;
}

- (id)metadataDictionary
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  unint64_t v12 = __Block_byref_object_copy__10;
  id v13 = __Block_byref_object_dispose__10;
  id v14 = 0;
  v2 = [(_DKCoreDataStorage *)self->_storage managedObjectContextFor:*MEMORY[0x1E4F28358]];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41___CDInteractionStore_metadataDictionary__block_invoke;
  v6[3] = &unk_1E560EBD8;
  id v3 = v2;
  id v7 = v3;
  id v8 = &v9;
  [v3 performWithOptions:4 andBlock:v6];
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (BOOL)deleteStorage
{
  BOOL v3 = [(_DKCoreDataStorage *)self->_storage deleteStorageFor:*MEMORY[0x1E4F28358]];
  if (v3 && !self->_inMaintenanceMode) {
    [(_CDInteractionStoreNotifier *)self->_notifier deleteAll];
  }
  return v3;
}

- (unint64_t)deleteInteractionsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 error:(id *)a6
{
  return [(_CDInteractionStore *)self deleteInteractionsMatchingPredicate:a3 sortDescriptors:a4 limit:a5 debuggingReason:@"unspecified reason" error:a6];
}

- (unint64_t)deleteInteractionsWithBundleId:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a3;
  id v8 = _CDTargetBundleIdForBundleId(v7);
  uint64_t v9 = [v6 predicateWithFormat:@"bundleId == %@ OR targetBundleId = %@", v7, v8];

  id v10 = (void *)[[NSString alloc] initWithFormat:@"deleteInteractionsWithBundleId:%@", v7];
  unint64_t v11 = [(_CDInteractionStore *)self deleteInteractionsMatchingPredicate:v9 sortDescriptors:MEMORY[0x1E4F1CBF0] limit:20000 debuggingReason:v10 error:a4];

  return v11;
}

- (unint64_t)deleteInteractionsWithBundleId:(id)a3 account:(id)a4 error:(id *)a5
{
  id v8 = (void *)MEMORY[0x1E4F28F60];
  id v9 = a4;
  id v10 = a3;
  unint64_t v11 = _CDTargetBundleIdForBundleId(v10);
  unint64_t v12 = [v8 predicateWithFormat:@"(bundleId == %@ OR targetBundleId == %@) AND account == %@", v10, v11, v9];

  id v13 = (void *)[[NSString alloc] initWithFormat:@"deleteInteractionsWithBundleId:%@ account:%@", v10, v9];
  unint64_t v14 = [(_CDInteractionStore *)self deleteInteractionsMatchingPredicate:v12 sortDescriptors:MEMORY[0x1E4F1CBF0] limit:20000 debuggingReason:v13 error:a5];

  return v14;
}

- (unint64_t)deleteInteractionsWithBundleId:(id)a3 domainIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a4;
  id v10 = a3;
  unint64_t v11 = [v8 arrayWithObjects:&v14 count:1];

  unint64_t v12 = -[_CDInteractionStore deleteInteractionsWithBundleId:domainIdentifiers:error:](self, "deleteInteractionsWithBundleId:domainIdentifiers:error:", v10, v11, a5, v14, v15);
  return v12;
}

- (void)deleteInteractionsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6
{
}

- (void)deleteInteractionsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 debuggingReason:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  workQueue = self->_workQueue;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __115___CDInteractionStore_deleteInteractionsMatchingPredicate_sortDescriptors_limit_debuggingReason_completionHandler___block_invoke;
  v25[3] = &unk_1E560EC98;
  v25[4] = self;
  id v26 = v12;
  id v27 = v13;
  id v28 = v14;
  id v29 = v15;
  unint64_t v30 = a5;
  __int16 v17 = v25;
  unint64_t v18 = workQueue;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  id v23 = (void *)os_transaction_create();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_3;
  block[3] = &unk_1E560D978;
  id v32 = v23;
  id v33 = v17;
  id v24 = v23;
  dispatch_async(v18, block);
}

- (void)deleteInteractionsWithBundleId:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72___CDInteractionStore_deleteInteractionsWithBundleId_completionHandler___block_invoke;
  v15[3] = &unk_1E560E4E0;
  v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  id v9 = v15;
  id v10 = workQueue;
  id v11 = v7;
  id v12 = v6;
  id v13 = (void *)os_transaction_create();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_3;
  block[3] = &unk_1E560D978;
  id v19 = v13;
  id v20 = v9;
  id v14 = v13;
  dispatch_async(v10, block);
}

- (void)deleteInteractionsWithBundleId:(id)a3 account:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __80___CDInteractionStore_deleteInteractionsWithBundleId_account_completionHandler___block_invoke;
  v19[3] = &unk_1E560ECC0;
  v19[4] = self;
  id v20 = v8;
  id v21 = v9;
  id v22 = v10;
  id v12 = v19;
  id v13 = workQueue;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  id v17 = (void *)os_transaction_create();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_3;
  block[3] = &unk_1E560D978;
  id v24 = v17;
  id v25 = v12;
  id v18 = v17;
  dispatch_async(v13, block);
}

- (void)deleteInteractionsWithBundleId:(id)a3 domainIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __89___CDInteractionStore_deleteInteractionsWithBundleId_domainIdentifier_completionHandler___block_invoke;
  v19[3] = &unk_1E560ECC0;
  v19[4] = self;
  id v20 = v8;
  id v21 = v9;
  id v22 = v10;
  id v12 = v19;
  id v13 = workQueue;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  id v17 = (void *)os_transaction_create();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_3;
  block[3] = &unk_1E560D978;
  id v24 = v17;
  id v25 = v12;
  id v18 = v17;
  dispatch_async(v13, block);
}

- (void)deleteInteractionsWithBundleId:(id)a3 domainIdentifiers:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __90___CDInteractionStore_deleteInteractionsWithBundleId_domainIdentifiers_completionHandler___block_invoke;
  v19[3] = &unk_1E560ECC0;
  v19[4] = self;
  id v20 = v8;
  id v21 = v9;
  id v22 = v10;
  id v12 = v19;
  id v13 = workQueue;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  id v17 = (void *)os_transaction_create();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_3;
  block[3] = &unk_1E560D978;
  id v24 = v17;
  id v25 = v12;
  id v18 = v17;
  dispatch_async(v13, block);
}

- (void)truncateInteractionsToCount:(unint64_t)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
    v11[0] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    id v7 = [(_CDInteractionStore *)self queryInteractionsUsingPredicate:0 sortDescriptors:v6 limit:1 offset:a3 - 1 error:0];
    id v8 = [v7 firstObject];

    id v9 = [v8 startDate];
    if (v9)
    {
      id v10 = [[NSString alloc] initWithFormat:@"truncateInteractionsToCount:%tu (cutoffDate: %@)", a3, v9];
      [(_CDInteractionStore *)self deleteInteractionsOlderThanDate:v9 debuggingReason:v10 limit:0];
    }
    else
    {
      if (!v8)
      {
LABEL_11:

        return;
      }
      id v10 = +[_CDLogging interactionChannel];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[_CDInteractionStore truncateInteractionsToCount:](v8, v10);
      }
    }

    goto LABEL_11;
  }
  [(_CDInteractionStore *)self deleteInteractionsMatchingPredicate:0 sortDescriptors:0 limit:0 debuggingReason:@"truncateInteractionsToCount:0" error:0];
}

- (id)anonymizedCopyToDirectory:(id)a3 salt:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x192FB2F20]();
  id v9 = [(_DKCoreDataStorage *)self->_storage copyStorageFor:*MEMORY[0x1E4F28358] toDirectory:v6];

  if (v9)
  {
    id v9 = +[_CDInteractionStore storeWithDirectory:v6 readOnly:0];
    [v9 anonymizeWithSalt:v7];
  }

  return v9;
}

- (void)anonymizeWithSalt:(id)a3
{
  id v4 = a3;
  [(_CDInteractionStore *)self anonymizeContactsWithSalt:v4];
  [(_CDInteractionStore *)self anonymizeKeywordsWithSalt:v4];
  [(_CDInteractionStore *)self anonymizeInteractionsWithSalt:v4];
  [(_CDInteractionStore *)self anonymizeAttachmentsWithSalt:v4];
}

- (void)anonymizeInteractionsWithSalt:(id)a3
{
  storage = self->_storage;
  uint64_t v4 = *MEMORY[0x1E4F28358];
  id v5 = a3;
  id v7 = [(_DKCoreDataStorage *)storage managedObjectContextFor:v4];
  LOBYTE(v6) = 0;
  +[_DKCoreDataStorage anonymizeObjectStringsInContext:v7 entityName:@"Interactions" predicate:0 sortDescriptors:0 batchFetchLimit:1000 totalFetchLimit:0 includeSubentities:v6 salt:v5];
}

- (void)anonymizeKeywordsWithSalt:(id)a3
{
  storage = self->_storage;
  uint64_t v4 = *MEMORY[0x1E4F28358];
  id v5 = a3;
  id v7 = [(_DKCoreDataStorage *)storage managedObjectContextFor:v4];
  LOBYTE(v6) = 0;
  +[_DKCoreDataStorage anonymizeObjectStringsInContext:v7 entityName:@"Keywords" predicate:0 sortDescriptors:0 batchFetchLimit:1000 totalFetchLimit:0 includeSubentities:v6 salt:v5];
}

- (void)anonymizeContactsWithSalt:(id)a3
{
  storage = self->_storage;
  uint64_t v4 = *MEMORY[0x1E4F28358];
  id v5 = a3;
  id v7 = [(_DKCoreDataStorage *)storage managedObjectContextFor:v4];
  LOBYTE(v6) = 0;
  +[_DKCoreDataStorage anonymizeObjectStringsInContext:v7 entityName:@"Contacts" predicate:0 sortDescriptors:0 batchFetchLimit:1000 totalFetchLimit:0 includeSubentities:v6 salt:v5];
}

- (void)anonymizeAttachmentsWithSalt:(id)a3
{
  storage = self->_storage;
  uint64_t v4 = *MEMORY[0x1E4F28358];
  id v5 = a3;
  id v7 = [(_DKCoreDataStorage *)storage managedObjectContextFor:v4];
  LOBYTE(v6) = 0;
  +[_DKCoreDataStorage anonymizeObjectStringsInContext:v7 entityName:@"Attachment" predicate:0 sortDescriptors:0 batchFetchLimit:1000 totalFetchLimit:0 includeSubentities:v6 salt:v5];
}

- (_CDInteraction)pendingShareSheetInteraction
{
  return self->_pendingShareSheetInteraction;
}

- (void)setPendingShareSheetInteraction:(id)a3
{
}

- (_DKCoreDataStorage)storage
{
  return self->_storage;
}

- (void)setReadConcurrently:(BOOL)a3
{
  self->_readConcurrently = a3;
}

- (void)initWithDirectory:knowledgeStore:readOnly:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "Could not obtain model path", v2, v3, v4, v5, v6);
}

- (void)initWithDirectory:knowledgeStore:readOnly:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "Missing model URL...", v2, v3, v4, v5, v6);
}

- (void)recordInteractionsBatch:(os_log_t)log error:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_18ECEB000, log, OS_LOG_TYPE_DEBUG, "Applying special logic not to overwrite donation with SS mechanism", buf, 2u);
}

- (void)recordInteractionsBatch:error:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_DEBUG, "recordInteractionsBatch - interactionsToPersistSortedByDate: %{sensitive}@", v1, 0xCu);
}

- (void)recordInteractionsBatch:error:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_DEBUG, "recordInteractionsBatch - interactionsToPersist: %@", v1, 0xCu);
}

- (void)recordInteractionsBatch:error:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "Missing managedObjectContext, bail!", v2, v3, v4, v5, v6);
}

- (void)_deleteMetadataForKey:moc:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_5(&dword_18ECEB000, v0, v1, "metadata: failed to set delete key %{public}@: %{private}@");
}

- (void)deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:.cold.1()
{
  OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_3_5(&dword_18ECEB000, v0, v1, "Deleted interactions but encountered error fetching interactions, reason: %{public}@, error: %{public}@");
}

- (void)deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4_6();
  _os_log_error_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_ERROR, "Did not delete any interactions but encountered error fetching interactions, reason: %{public}@, error: %{public}@", v1, 0x16u);
}

- (void)truncateInteractionsToCount:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 bundleId];
  uint64_t v5 = [a1 targetBundleId];
  int v6 = 138740483;
  id v7 = a1;
  __int16 v8 = 2114;
  id v9 = v4;
  __int16 v10 = 2114;
  id v11 = v5;
  _os_log_fault_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_FAULT, "truncateInteractionsToCount got nil cutoffDate for interaction %{sensitive}@ from bundle id %{public}@, target bundle id %{public}@", (uint8_t *)&v6, 0x20u);
}

@end