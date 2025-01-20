@interface HDUserDomainConceptManager
+ (id)_countOfMedicalUserDomainConceptsWithPredicate:(void *)a3 transaction:(uint64_t)a4 error:;
+ (id)_countOfUserDomainConceptsWithEntity:(void *)a3 predicate:(void *)a4 transaction:(uint64_t)a5 error:;
+ (id)_enumerationPredicateWithOptions:(void *)a3 existingPredicate:;
+ (id)countOfUserDomainConceptsMatchingPredicate:(id)a3 options:(unint64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (id)predicateForAllPinnedConceptsMappingToRecordsWithUUIDs:(id)a3 pinnedConceptUUIDs:(id)a4;
+ (id)predicateForElementsOfListType:(unint64_t)a3;
+ (id)predicateForListUserDomainConceptWithType:(unint64_t)a3;
- (BOOL)deleteUserDomainConcept:(id)a3 error:(id *)a4;
- (BOOL)deleteUserDomainConcepts:(id)a3 error:(id *)a4;
- (BOOL)enumerateUserDomainConceptsWithPredicate:(id)a3 enumerationOptions:(unint64_t)a4 limit:(int64_t)a5 orderingTerms:(id)a6 error:(id *)a7 enumerationHandler:(id)a8;
- (BOOL)enumerateUserDomainConceptsWithPredicate:(id)a3 enumerationOptions:(unint64_t)a4 limit:(int64_t)a5 orderingTerms:(id)a6 transaction:(id)a7 error:(id *)a8 enumerationHandler:(id)a9;
- (BOOL)enumerateUserDomainConceptsWithPredicate:(id)a3 error:(id *)a4 enumerationHandler:(id)a5;
- (BOOL)enumerateUserDomainConceptsWithPredicate:(id)a3 limit:(int64_t)a4 orderingTerms:(id)a5 error:(id *)a6 enumerationHandler:(id)a7;
- (BOOL)modifyUserDomainConcepts:(id)a3 method:(int64_t)a4 error:(id *)a5;
- (BOOL)modifyUserDomainConcepts:(id)a3 method:(int64_t)a4 syncProvenance:(int64_t)a5 syncIdentity:(int64_t)a6 syncVersion:(id)a7 error:(id *)a8;
- (BOOL)updateUserDomainConcept:(id)a3 error:(id *)a4;
- (BOOL)updateUserDomainConcepts:(id)a3 error:(id *)a4;
- (HDProfile)profile;
- (HDUserDomainConceptManager)init;
- (HDUserDomainConceptManager)initWithProfile:(id)a3;
- (HDUserDomainConceptProcessingManager)processingManager;
- (HDUserDomainConceptSyncRequester)syncRequester;
- (_HDUserDomainConceptObserverRecordSummary)_synthesizeSummaryForCallToObserversAndFlushRecordsIsSynchronous:(uint64_t)a1;
- (id)keyValueDomain;
- (id)orderingTermsForSortDescriptors:(id)a3 error:(id *)a4;
- (id)userDomainConceptAnalyticsWithError:(id *)a3;
- (void)_callObserversIfPossible;
- (void)_notifyObserversForUDC:(uint64_t)a3 type:(void *)a4 transaction:;
- (void)addSynchronousUserDomainConceptObserver:(id)a3;
- (void)addUserDomainConceptObserver:(id)a3 queue:(id)a4;
- (void)closeObserverTransaction;
- (void)notifyObserversForAddedUDC:(id)a3 transaction:(id)a4;
- (void)notifyObserversForDeletedUDC:(id)a3 transaction:(id)a4;
- (void)notifyObserversForUpdatedUDC:(id)a3 transaction:(id)a4;
- (void)openObserverTransaction;
- (void)removeSynchronousUserDomainConceptObserver:(id)a3;
- (void)removeUserDomainConceptObserver:(id)a3;
@end

@implementation HDUserDomainConceptManager

- (HDUserDomainConceptManager)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDUserDomainConceptManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HDUserDomainConceptManager;
  v5 = [(HDUserDomainConceptManager *)&v26 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    id v7 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    v8 = NSStringFromProtocol((Protocol *)&unk_1F181ED60);
    v9 = HKLogHealthOntology();
    uint64_t v10 = [v7 initWithName:v8 loggingCategory:v9];
    userDomainConceptObservers = v6->_userDomainConceptObservers;
    v6->_userDomainConceptObservers = (HDUserDomainConceptObserver *)v10;

    id v12 = objc_alloc(MEMORY[0x1E4F2B5F0]);
    v13 = NSStringFromProtocol((Protocol *)&unk_1F18A88E8);
    v14 = HKLogHealthOntology();
    uint64_t v15 = [v12 initWithName:v13 loggingCategory:v14];
    synchronousUserDomainConceptObservers = v6->_synchronousUserDomainConceptObservers;
    v6->_synchronousUserDomainConceptObservers = (HDUserDomainConceptSynchronousObserver *)v15;

    v6->_userDomainConceptObserverLock._os_unfair_lock_opaque = 0;
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingUserDomainConceptObserverRecords = v6->_pendingUserDomainConceptObserverRecords;
    v6->_pendingUserDomainConceptObserverRecords = v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingUserDomainConceptSynchronousObserverRecords = v6->_pendingUserDomainConceptSynchronousObserverRecords;
    v6->_pendingUserDomainConceptSynchronousObserverRecords = v19;

    v21 = [[HDUserDomainConceptProcessingManager alloc] initWithProfile:v4];
    processingManager = v6->_processingManager;
    v6->_processingManager = v21;

    v23 = [[HDUserDomainConceptSyncRequester alloc] initWithUserDomainConceptManager:v6];
    syncRequester = v6->_syncRequester;
    v6->_syncRequester = v23;
  }
  return v6;
}

- (BOOL)updateUserDomainConcept:(id)a3 error:(id *)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  v8 = [v6 arrayWithObjects:&v10 count:1];

  LOBYTE(a4) = -[HDUserDomainConceptManager modifyUserDomainConcepts:method:error:](self, "modifyUserDomainConcepts:method:error:", v8, 1, a4, v10, v11);
  return (char)a4;
}

- (BOOL)updateUserDomainConcepts:(id)a3 error:(id *)a4
{
  return [(HDUserDomainConceptManager *)self modifyUserDomainConcepts:a3 method:1 error:a4];
}

- (BOOL)deleteUserDomainConcept:(id)a3 error:(id *)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  v8 = [v6 arrayWithObjects:&v10 count:1];

  LOBYTE(a4) = -[HDUserDomainConceptManager modifyUserDomainConcepts:method:error:](self, "modifyUserDomainConcepts:method:error:", v8, 3, a4, v10, v11);
  return (char)a4;
}

- (BOOL)deleteUserDomainConcepts:(id)a3 error:(id *)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  _HKInitializeLogging();
  id v7 = HKLogHealthOntology();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    uint64_t v11 = self;
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: deleteUserDomainConcepts: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  BOOL v8 = [(HDUserDomainConceptManager *)self modifyUserDomainConcepts:v6 method:3 error:a4];
  return v8;
}

- (BOOL)enumerateUserDomainConceptsWithPredicate:(id)a3 enumerationOptions:(unint64_t)a4 limit:(int64_t)a5 orderingTerms:(id)a6 transaction:(id)a7 error:(id *)a8 enumerationHandler:(id)a9
{
  char v13 = a4;
  id v16 = a9;
  id v17 = a7;
  id v18 = a6;
  v19 = +[HDUserDomainConceptManager _enumerationPredicateWithOptions:existingPredicate:]((uint64_t)HDUserDomainConceptManager, v13, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  LOBYTE(a8) = +[HDUserDomainConceptEntity enumerateUserDomainConceptsWithPredicate:v19 limit:a5 orderingTerms:v18 profile:WeakRetained transaction:v17 error:a8 enumerationHandler:v16];

  return (char)a8;
}

+ (id)_enumerationPredicateWithOptions:(void *)a3 existingPredicate:
{
  id v4 = a3;
  self;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_msgSend(v5, "hk_addNonNilObject:", v4);

  if ((a2 & 1) == 0)
  {
    self;
    id v6 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"deleted" equalToValue:MEMORY[0x1E4F1CC28]];
    [v5 addObject:v6];
  }
  if ((a2 & 2) == 0)
  {
    id v7 = +[HDUserDomainConceptEntity ignoreHiddenConceptsPredicate];
    [v5 addObject:v7];
  }
  if ([v5 count])
  {
    BOOL v8 = [MEMORY[0x1E4F65D08] predicateMatchingAllPredicates:v5];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)enumerateUserDomainConceptsWithPredicate:(id)a3 enumerationOptions:(unint64_t)a4 limit:(int64_t)a5 orderingTerms:(id)a6 error:(id *)a7 enumerationHandler:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a8;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v18 = [WeakRetained database];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __135__HDUserDomainConceptManager_enumerateUserDomainConceptsWithPredicate_enumerationOptions_limit_orderingTerms_error_enumerationHandler___block_invoke;
  v23[3] = &unk_1E630A888;
  v23[4] = self;
  id v24 = v14;
  unint64_t v27 = a4;
  int64_t v28 = a5;
  id v25 = v15;
  id v26 = v16;
  id v19 = v16;
  id v20 = v15;
  id v21 = v14;
  LOBYTE(a7) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v18 error:a7 block:v23];

  return (char)a7;
}

uint64_t __135__HDUserDomainConceptManager_enumerateUserDomainConceptsWithPredicate_enumerationOptions_limit_orderingTerms_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) enumerateUserDomainConceptsWithPredicate:*(void *)(a1 + 40) enumerationOptions:*(void *)(a1 + 64) limit:*(void *)(a1 + 72) orderingTerms:*(void *)(a1 + 48) transaction:a2 error:a3 enumerationHandler:*(void *)(a1 + 56)];
}

- (BOOL)enumerateUserDomainConceptsWithPredicate:(id)a3 limit:(int64_t)a4 orderingTerms:(id)a5 error:(id *)a6 enumerationHandler:(id)a7
{
  return [(HDUserDomainConceptManager *)self enumerateUserDomainConceptsWithPredicate:a3 enumerationOptions:0 limit:a4 orderingTerms:a5 error:a6 enumerationHandler:a7];
}

- (BOOL)enumerateUserDomainConceptsWithPredicate:(id)a3 error:(id *)a4 enumerationHandler:(id)a5
{
  return [(HDUserDomainConceptManager *)self enumerateUserDomainConceptsWithPredicate:a3 limit:0 orderingTerms:0 error:a4 enumerationHandler:a5];
}

- (id)userDomainConceptAnalyticsWithError:(id *)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  char v13 = __Block_byref_object_copy__173;
  id v14 = __Block_byref_object_dispose__173;
  id v15 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v5 = [WeakRetained database];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__HDUserDomainConceptManager_userDomainConceptAnalyticsWithError___block_invoke;
  v9[3] = &unk_1E62F82A8;
  v9[4] = &v10;
  LODWORD(a3) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v5 error:a3 block:v9];

  if (a3) {
    id v6 = (void *)v11[5];
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(&v10, 8);

  return v7;
}

BOOL __66__HDUserDomainConceptManager_userDomainConceptAnalyticsWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  self;
  id v46 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  self;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v6 = [&unk_1F17EAC20 countByEnumeratingWithState:&v52 objects:&v50 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v53;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v53 != v8) {
          objc_enumerationMutation(&unk_1F17EAC20);
        }
        id v10 = v4;
        id v48 = v4;
        id v49 = v5;
        int v11 = HKWithAutoreleasePool();

        if (!v11)
        {
          id v12 = 0;
          id v4 = v10;
          goto LABEL_11;
        }
        id v4 = v10;
      }
      uint64_t v7 = [&unk_1F17EAC20 countByEnumeratingWithState:&v52 objects:&v50 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v12 = v5;
LABEL_11:

  char v13 = v46;
  if (v12)
  {
    [v46 addEntriesFromDictionary:v12];
    id v44 = v4;
    id v43 = v4;
    self;
    uint64_t v14 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"modification_date" entityClass:objc_opt_class() ascending:0];
    id v15 = (void *)MEMORY[0x1E4F65D08];
    id v16 = HDListUserDomainConceptEntityPredicateForListType(1, 1);
    v50 = v16;
    id v17 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"user_domain_concept_links.link_type" equalToValue:&unk_1F17EEEB0];
    v51 = v17;
    id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:2];
    id v19 = [v15 predicateMatchingAllPredicates:v18];

    id v20 = objc_alloc_init(MEMORY[0x1E4F65D68]);
    [v20 setEntityClass:objc_opt_class()];
    [v20 setLimitCount:1];
    [v20 setPredicate:v19];
    [v20 setGroupBy:@"udc_id"];
    id v21 = (void *)v14;
    *(void *)&long long v52 = v14;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
    [v20 setOrderingTerms:v22];

    uint64_t v23 = *MEMORY[0x1E4F65C78];
    uint64_t v24 = *MEMORY[0x1E4F65CA0];
    id v25 = [v43 protectedDatabase];

    id v26 = +[HDSQLiteEntity aggregateSingleValueForProperty:v23 function:v24 queryDescriptor:v20 database:v25 error:a3];

    if (v26)
    {
      unint64_t v27 = NSNumber;
      int64_t v28 = [v26 allValues];
      v29 = [v28 firstObject];
      v30 = objc_msgSend(v27, "numberWithInteger:", objc_msgSend(v29, "integerValue"));
    }
    else
    {
      v30 = 0;
    }

    if (v30)
    {
      char v13 = v46;
      [v46 setObject:v30 forKeyedSubscript:@"countNumberLabConceptsPinned"];
      id v32 = v43;
      uint64_t v33 = self;
      v34 = HDMedicalUserDomainConceptEntityPredicateForCategoryType((uint64_t)&unk_1F17EEE68, 1);
      v35 = (void *)MEMORY[0x1E4F65D08];
      v36 = HDUserDomainConceptEducationContentEntityPredicateForEducationContent(0);
      v50 = v36;
      v51 = v34;
      v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:2];
      v38 = [v35 predicateMatchingAllPredicates:v37];

      v39 = +[HDUserDomainConceptManager _countOfMedicalUserDomainConceptsWithPredicate:transaction:error:](v33, v38, v32, a3);

      if (v39)
      {
        [v46 setObject:v39 forKeyedSubscript:@"countNumberLabConceptsWithEducation"];
        uint64_t v31 = [v46 copy];
      }
      else
      {
        uint64_t v31 = 0;
      }
    }
    else
    {
      uint64_t v31 = 0;
      char v13 = v46;
    }

    id v4 = v44;
  }
  else
  {
    uint64_t v31 = 0;
  }

  uint64_t v40 = *(void *)(*(void *)(a1 + 32) + 8);
  v41 = *(void **)(v40 + 40);
  *(void *)(v40 + 40) = v31;

  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

- (id)orderingTermsForSortDescriptors:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    uint64_t v10 = *MEMORY[0x1E4F2AA88];
    uint64_t v27 = *MEMORY[0x1E4F2AA90];
    uint64_t v26 = *MEMORY[0x1E4F2AA80];
    id obj = v6;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        char v13 = [v12 key];
        char v14 = [v13 isEqualToString:v10];

        id v15 = @"creation_date";
        if ((v14 & 1) == 0)
        {
          id v16 = [v12 key];
          char v17 = [v16 isEqualToString:v27];

          id v15 = @"modification_date";
          if ((v17 & 1) == 0)
          {
            id v18 = [v12 key];
            char v19 = [v18 isEqualToString:v26];

            id v15 = @"sync_anchor";
            if ((v19 & 1) == 0)
            {
              v22 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v23 = [v12 key];
              objc_msgSend(v22, "hk_assignError:code:format:", a4, 3, @"We don't have have any sort descriptor key defined for key: '%@'. Please add them here", v23);

              id v6 = obj;
              id v21 = 0;
              goto LABEL_13;
            }
          }
        }
        id v20 = objc_msgSend(MEMORY[0x1E4F65D50], "orderingTermWithProperty:entityClass:ascending:", v15, objc_opt_class(), objc_msgSend(v12, "ascending"));
        [v5 addObject:v20];
      }
      id v6 = obj;
      uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v21 = v5;
LABEL_13:

  return v21;
}

- (void)addUserDomainConceptObserver:(id)a3 queue:(id)a4
{
}

- (void)removeUserDomainConceptObserver:(id)a3
{
}

- (void)addSynchronousUserDomainConceptObserver:(id)a3
{
}

- (void)removeSynchronousUserDomainConceptObserver:(id)a3
{
}

- (BOOL)modifyUserDomainConcepts:(id)a3 method:(int64_t)a4 syncProvenance:(int64_t)a5 syncIdentity:(int64_t)a6 syncVersion:(id)a7 error:(id *)a8
{
  id v14 = a3;
  if (self)
  {
    id v15 = [[_HDUserDomainConceptManagerModificationOperation alloc] initWithUserDomainConcepts:v14 method:a4 syncProvenance:a5 syncIdentity:a6 syncVersion:a7];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    BOOL v17 = [(HDJournalableOperation *)v15 performOrJournalWithProfile:WeakRetained error:a8];

    if (v17 && [(HDJournalableOperation *)v15 didJournal])
    {
      id v18 = objc_msgSend(v14, "hk_map:", &__block_literal_global_213);
      os_unfair_lock_lock(&self->_userDomainConceptObserverLock);
      [(NSMutableArray *)self->_pendingUserDomainConceptObserverRecords addObjectsFromArray:v18];
      os_unfair_lock_unlock(&self->_userDomainConceptObserverLock);
      -[HDUserDomainConceptManager _callObserversIfPossible]((uint64_t)self);
    }
  }
  else
  {
    LOBYTE(v17) = 0;
  }

  return v17;
}

- (BOOL)modifyUserDomainConcepts:(id)a3 method:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [(HDUserDomainConceptManager *)self profile];
  LOBYTE(a5) = -[HDUserDomainConceptManager modifyUserDomainConcepts:method:syncProvenance:syncIdentity:syncVersion:error:](self, "modifyUserDomainConcepts:method:syncProvenance:syncIdentity:syncVersion:error:", v8, a4, 0, [v9 currentSyncIdentityPersistentID], 0x400000000, a5);

  return (char)a5;
}

- (void)openObserverTransaction
{
  p_userDomainConceptObserverLock = &self->_userDomainConceptObserverLock;
  os_unfair_lock_lock(&self->_userDomainConceptObserverLock);
  ++self->_userDomainConceptObserverOpenTransactionsCount;

  os_unfair_lock_unlock(p_userDomainConceptObserverLock);
}

- (void)closeObserverTransaction
{
  p_userDomainConceptObserverLock = &self->_userDomainConceptObserverLock;
  os_unfair_lock_lock(&self->_userDomainConceptObserverLock);
  int64_t userDomainConceptObserverOpenTransactionsCount = self->_userDomainConceptObserverOpenTransactionsCount;
  if (userDomainConceptObserverOpenTransactionsCount <= 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"HDUserDomainConceptManager.m" lineNumber:332 description:@"No open transactions"];

    int64_t userDomainConceptObserverOpenTransactionsCount = self->_userDomainConceptObserverOpenTransactionsCount;
  }
  self->_int64_t userDomainConceptObserverOpenTransactionsCount = userDomainConceptObserverOpenTransactionsCount - 1;
  os_unfair_lock_unlock(p_userDomainConceptObserverLock);

  -[HDUserDomainConceptManager _callObserversIfPossible]((uint64_t)self);
}

- (void)_callObserversIfPossible
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = -[HDUserDomainConceptManager _synthesizeSummaryForCallToObserversAndFlushRecordsIsSynchronous:](a1, 0);
    if (v2)
    {
      _HKInitializeLogging();
      id v3 = HKLogHealthOntology();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        id v4 = [v2 addedConcepts];
        uint64_t v5 = [v4 count];
        id v6 = [v2 updatedConcepts];
        uint64_t v7 = [v6 count];
        id v8 = [v2 journaledConcepts];
        uint64_t v9 = [v8 count];
        uint64_t v10 = [v2 removedConcepts];
        *(_DWORD *)buf = 138544386;
        uint64_t v15 = a1;
        __int16 v16 = 2048;
        uint64_t v17 = v5;
        __int16 v18 = 2048;
        uint64_t v19 = v7;
        __int16 v20 = 2048;
        uint64_t v21 = v9;
        __int16 v22 = 2048;
        uint64_t v23 = [v10 count];
        _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: notify UDC observers about: added=%ld, updated=%ld, journaled=%ld, deleted=%ld", buf, 0x34u);
      }
      int v11 = *(void **)(a1 + 8);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __54__HDUserDomainConceptManager__callObserversIfPossible__block_invoke;
      v12[3] = &unk_1E630A8F8;
      v12[4] = a1;
      id v13 = v2;
      [v11 notifyObservers:v12];
    }
  }
}

- (void)notifyObserversForAddedUDC:(id)a3 transaction:(id)a4
{
}

- (void)_notifyObserversForUDC:(uint64_t)a3 type:(void *)a4 transaction:
{
  id v7 = a4;
  if (a1)
  {
    id v8 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    uint64_t v9 = *(void **)(a1 + 56);
    if (!v9)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      int v11 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v10;

      id v12 = [v7 protectedDatabase];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __70__HDUserDomainConceptManager__notifyObserversForUDC_type_transaction___block_invoke;
      v17[3] = &unk_1E63007F8;
      v17[4] = a1;
      id v13 = v7;
      id v18 = v13;
      [v12 beforeCommit:v17];

      v15[4] = a1;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __70__HDUserDomainConceptManager__notifyObserversForUDC_type_transaction___block_invoke_2;
      v16[3] = &unk_1E62F3208;
      v16[4] = a1;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __70__HDUserDomainConceptManager__notifyObserversForUDC_type_transaction___block_invoke_3;
      v15[3] = &unk_1E62F3170;
      [v13 onCommit:v16 orRollback:v15];

      uint64_t v9 = *(void **)(a1 + 56);
    }
    id v14 = [[_HDUserDomainConceptObserverRecord alloc] initWithUserDomainConcept:v8 modificationType:a3];

    [v9 addObject:v14];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  }
}

- (void)notifyObserversForUpdatedUDC:(id)a3 transaction:(id)a4
{
}

- (void)notifyObserversForDeletedUDC:(id)a3 transaction:(id)a4
{
}

+ (id)countOfUserDomainConceptsMatchingPredicate:(id)a3 options:(unint64_t)a4 transaction:(id)a5 error:(id *)a6
{
  char v7 = a4;
  id v10 = a5;
  int v11 = +[HDUserDomainConceptManager _enumerationPredicateWithOptions:existingPredicate:]((uint64_t)a1, v7, a3);
  id v12 = v10;
  id v13 = v11;
  uint64_t v14 = self;
  uint64_t v15 = objc_opt_class();
  __int16 v16 = +[HDUserDomainConceptManager _countOfUserDomainConceptsWithEntity:predicate:transaction:error:](v14, v15, v13, v12, (uint64_t)a6);

  return v16;
}

BOOL __129__HDUserDomainConceptManager__enumerateAndDeleteSemanticDuplicatesOfConceptIfSupportsHidingSemanticDuplicates_transaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = (id *)(*(void *)(a1 + 32) + 64);
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  BOOL v9 = +[HDUserDomainConceptEntity deleteUserDomainConcept:v7 profile:WeakRetained transaction:*(void *)(a1 + 40) error:a4];

  return v9;
}

+ (id)_countOfUserDomainConceptsWithEntity:(void *)a3 predicate:(void *)a4 transaction:(uint64_t)a5 error:
{
  id v8 = a4;
  id v9 = a3;
  self;
  id v10 = [v8 protectedDatabase];

  int v11 = [a2 countDistinctForProperty:@"udc_id" predicate:v9 database:v10 error:a5];

  return v11;
}

+ (id)_countOfMedicalUserDomainConceptsWithPredicate:(void *)a3 transaction:(uint64_t)a4 error:
{
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = self;
  id v9 = objc_opt_class();
  id v10 = +[HDUserDomainConceptManager _countOfUserDomainConceptsWithEntity:predicate:transaction:error:](v8, v9, v7, v6, a4);

  return v10;
}

BOOL __95__HDUserDomainConceptManager__analyticsForMedicalUserDomainConceptCountsWithTransaction_error___block_invoke(id *a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1[4] integerValue];
  self;
  if ((unint64_t)(v4 - 1) >= 7)
  {
    _HKInitializeLogging();
    id v12 = (void *)*MEMORY[0x1E4F29F38];
    BOOL v11 = 1;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_INFO))
    {
      id v13 = v12;
      uint64_t v14 = HKStringFromMedicalRecordCategoryType();
      int v16 = 138412290;
      uint64_t v17 = v14;
      _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_INFO, "Health records category %@ not supported in daily analytics", (uint8_t *)&v16, 0xCu);
    }
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = off_1E630A940[v4 - 1];
    id v6 = a1[5];
    uint64_t v7 = self;
    uint64_t v8 = [NSNumber numberWithInteger:v4];
    id v9 = HDMedicalUserDomainConceptEntityPredicateForCategoryType((uint64_t)v8, 1);

    id v10 = +[HDUserDomainConceptManager _countOfMedicalUserDomainConceptsWithPredicate:transaction:error:](v7, v9, v6, a2);

    BOOL v11 = v10 != 0;
    if (v10) {
      [a1[6] setObject:v10 forKeyedSubscript:v5];
    }
  }
  return v11;
}

_HDUserDomainConceptObserverRecord *__73__HDUserDomainConceptManager__notifyObserversIfPossibleForJournaledUDCs___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[_HDUserDomainConceptObserverRecord alloc] initWithUserDomainConcept:v2 modificationType:4];

  return v3;
}

uint64_t __70__HDUserDomainConceptManager__notifyObserversForUDC_type_transaction___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  [*(id *)(*(void *)(a1 + 32) + 48) addObjectsFromArray:*(void *)(*(void *)(a1 + 32) + 56)];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  if (v2)
  {
    uint64_t v4 = -[HDUserDomainConceptManager _synthesizeSummaryForCallToObserversAndFlushRecordsIsSynchronous:](v2, 1);
    uint64_t v5 = [v4 journaledConcepts];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      _HKInitializeLogging();
      uint64_t v7 = HKLogHealthOntology();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = [v4 journaledConcepts];
        *(_DWORD *)uint64_t v19 = 138543618;
        *(void *)&v19[4] = v2;
        *(_WORD *)&v19[12] = 2048;
        *(void *)&v19[14] = [v18 count];
        _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "%{public}@: synchronous observer cache summary contains %ld journaled records, but it should not have any", v19, 0x16u);
      }
    }
    _HKInitializeLogging();
    uint64_t v8 = HKLogHealthOntology();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v4 addedConcepts];
      uint64_t v10 = [v9 count];
      BOOL v11 = [v4 updatedConcepts];
      uint64_t v12 = [v11 count];
      id v13 = [v4 removedConcepts];
      uint64_t v14 = [v13 count];
      *(_DWORD *)uint64_t v19 = 138544130;
      *(void *)&v19[4] = v2;
      *(_WORD *)&v19[12] = 2048;
      *(void *)&v19[14] = v10;
      *(_WORD *)&v19[22] = 2048;
      __int16 v20 = (void *)v12;
      LOWORD(v21) = 2048;
      *(void *)((char *)&v21 + 2) = v14;
      _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: notify synchronous UDC observers about: added=%ld, updated=%ld, deleted=%ld", v19, 0x2Au);
    }
    uint64_t v15 = *(void **)(v2 + 16);
    *(void *)uint64_t v19 = MEMORY[0x1E4F143A8];
    *(void *)&v19[8] = 3221225472;
    *(void *)&v19[16] = __71__HDUserDomainConceptManager__callSynchronousObserversWithTransaction___block_invoke;
    __int16 v20 = &unk_1E630A920;
    *(void *)&long long v21 = v2;
    *((void *)&v21 + 1) = v4;
    id v22 = v3;
    id v16 = v4;
    [v15 notifyObservers:v19];
  }
  return 1;
}

void __70__HDUserDomainConceptManager__notifyObserversForUDC_type_transaction___block_invoke_2(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  [*(id *)(*(void *)(a1 + 32) + 40) addObjectsFromArray:*(void *)(*(void *)(a1 + 32) + 56)];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  uint64_t v4 = *(void *)(a1 + 32);

  -[HDUserDomainConceptManager _callObserversIfPossible](v4);
}

void __70__HDUserDomainConceptManager__notifyObserversForUDC_type_transaction___block_invoke_3(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = 0;

  uint64_t v4 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 24);

  os_unfair_lock_unlock(v4);
}

- (_HDUserDomainConceptObserverRecordSummary)_synthesizeSummaryForCallToObserversAndFlushRecordsIsSynchronous:(uint64_t)a1
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (os_unfair_lock_s *)(a1 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  if (a2)
  {
    uint64_t v5 = 48;
  }
  else
  {
    if (*(void *)(a1 + 32))
    {
      uint64_t v6 = 0;
      goto LABEL_30;
    }
    uint64_t v5 = 40;
  }
  id v7 = *(id *)(a1 + v5);
  long long v21 = v4;
  os_unfair_lock_assert_owner(v4);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0;
    id v12 = 0;
    id v13 = 0;
    id v14 = 0;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v8);
        }
        uint64_t v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        switch([v17 changeType])
        {
          case 1:
            if (!v12) {
              id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            uint64_t v18 = [v17 userDomainConcept];
            uint64_t v19 = v12;
            goto LABEL_24;
          case 2:
            if (!v13) {
              id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            uint64_t v18 = [v17 userDomainConcept];
            uint64_t v19 = v13;
            goto LABEL_24;
          case 3:
            if (!v14) {
              id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            uint64_t v18 = [v17 userDomainConcept];
            uint64_t v19 = v14;
            goto LABEL_24;
          case 4:
            if (!v11) {
              id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            uint64_t v18 = [v17 userDomainConcept];
            uint64_t v19 = v11;
LABEL_24:
            [v19 addObject:v18];

            break;
          default:
            continue;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }
  else
  {
    id v11 = 0;
    id v12 = 0;
    id v13 = 0;
    id v14 = 0;
  }

  [v8 removeAllObjects];
  uint64_t v6 = [[_HDUserDomainConceptObserverRecordSummary alloc] initWithJournaledConcepts:v11 addedConcepts:v12 updatedConcepts:v13 removedConcepts:v14];

  uint64_t v4 = v21;
LABEL_30:
  os_unfair_lock_unlock(v4);

  return v6;
}

void __54__HDUserDomainConceptManager__callObserversIfPossible__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v18 = a2;
  id v4 = v3;
  uint64_t v5 = v4;
  if (v2)
  {
    uint64_t v6 = [v4 journaledConcepts];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      id v8 = [v5 journaledConcepts];
      [v18 userDomainConceptManager:v2 didJournalUserDomainConcepts:v8];
    }
    uint64_t v9 = [v5 addedConcepts];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      id v11 = [v5 addedConcepts];
      [v18 userDomainConceptManager:v2 didAddUserDomainConcepts:v11];
    }
    id v12 = [v5 updatedConcepts];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      id v14 = [v5 updatedConcepts];
      [v18 userDomainConceptManager:v2 didUpdateUserDomainConcepts:v14];
    }
    uint64_t v15 = [v5 removedConcepts];
    uint64_t v16 = [v15 count];

    if (v16)
    {
      uint64_t v17 = [v5 removedConcepts];
      [v18 userDomainConceptManager:v2 didDeleteUserDomainConcepts:v17];
    }
  }
}

void __71__HDUserDomainConceptManager__callSynchronousObserversWithTransaction___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v2 = (void *)a1[5];
  id v4 = (void *)a1[6];
  id v16 = a2;
  id v5 = v2;
  id v6 = v4;
  if (v3)
  {
    uint64_t v7 = [v5 addedConcepts];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      uint64_t v9 = [v5 addedConcepts];
      [v16 userDomainConceptManager:v3 didAddUserDomainConcepts:v9 transaction:v6];
    }
    uint64_t v10 = [v5 updatedConcepts];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      id v12 = [v5 updatedConcepts];
      [v16 userDomainConceptManager:v3 didUpdateUserDomainConcepts:v12 transaction:v6];
    }
    uint64_t v13 = [v5 removedConcepts];
    uint64_t v14 = [v13 count];

    if (v14)
    {
      uint64_t v15 = [v5 removedConcepts];
      [v16 userDomainConceptManager:v3 didDeleteUserDomainConcepts:v15 transaction:v6];
    }
  }
}

- (id)keyValueDomain
{
  uint64_t v3 = [HDKeyValueDomain alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v5 = [(HDKeyValueDomain *)v3 initWithCategory:100 domainName:@"com.apple.health.records.userdomain" profile:WeakRetained];

  return v5;
}

+ (id)predicateForAllPinnedConceptsMappingToRecordsWithUUIDs:(id)a3 pinnedConceptUUIDs:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F65D58];
  id v6 = a4;
  uint64_t v7 = HDMedicalUserDomainConceptEntityPredicateForMedicalRecordWithUUIDs((uint64_t)a3);
  uint64_t v8 = HDUserDomainConceptEntityPredicateForConceptUUIDs((uint64_t)v6);

  uint64_t v9 = [v5 compoundPredicateWithPredicate:v7 otherPredicate:v8];

  return v9;
}

+ (id)predicateForListUserDomainConceptWithType:(unint64_t)a3
{
  return HDListUserDomainConceptEntityPredicateForListType(a3, 1);
}

+ (id)predicateForElementsOfListType:(unint64_t)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F65D68]);
  [v4 setEntityClass:objc_opt_class()];
  [v4 setLimitCount:1];
  id v5 = HDListUserDomainConceptEntityPredicateForListType(a3, 1);
  [v4 setPredicate:v5];

  id v6 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"modification_date" entityClass:objc_opt_class() ascending:0];
  v21[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  [v4 setOrderingTerms:v7];

  uint64_t v8 = (void *)MEMORY[0x1E4F65D00];
  uint64_t v9 = +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:@"udc_id"];
  __int16 v20 = @"udc_id";
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  uint64_t v11 = [v8 predicateWithProperty:v9 comparisonType:7 subqueryDescriptor:v4 subqueryProperties:v10];

  id v12 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"user_domain_concept_links.link_type" equalToValue:&unk_1F17EEEB0];
  id v13 = objc_alloc_init(MEMORY[0x1E4F65D68]);
  [v13 setEntityClass:objc_opt_class()];
  uint64_t v14 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v11 otherPredicate:v12];
  [v13 setPredicate:v14];

  uint64_t v15 = (void *)MEMORY[0x1E4F65D00];
  uint64_t v19 = @"user_domain_concept_links.target_uuid";
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  uint64_t v17 = [v15 predicateWithProperty:@"uuid" comparisonType:7 subqueryDescriptor:v13 subqueryProperties:v16];

  return v17;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (HDUserDomainConceptSyncRequester)syncRequester
{
  return self->_syncRequester;
}

- (HDUserDomainConceptProcessingManager)processingManager
{
  return self->_processingManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingManager, 0);
  objc_storeStrong((id *)&self->_syncRequester, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_transactionUserDomainConceptObserverRecords, 0);
  objc_storeStrong((id *)&self->_pendingUserDomainConceptSynchronousObserverRecords, 0);
  objc_storeStrong((id *)&self->_pendingUserDomainConceptObserverRecords, 0);
  objc_storeStrong((id *)&self->_synchronousUserDomainConceptObservers, 0);

  objc_storeStrong((id *)&self->_userDomainConceptObservers, 0);
}

@end