@interface EKPredicateSearch
+ (id)searchWithEntityClass:(Class)a3 predicate:(id)a4 store:(id)a5;
+ (id)signpostHandle;
- (EKPredicateSearch)initWithEntityClass:(Class)a3 predicate:(id)a4 store:(id)a5;
- (id)_createOSActivity;
- (id)fetchObjectIDs;
- (id)runSynchronously;
- (id)startWithCompletion:(id)a3 queue:(id)a4;
- (void)_createOSActivity;
- (void)_fetchObjectIDsActualWithCompletion:(id)a3 synchronous:(BOOL)a4 queue:(id)a5;
- (void)_startActivityWithCompletion:(id)a3 synchronous:(BOOL)a4 queue:(id)a5;
- (void)_startActualWithCompletion:(id)a3 synchronous:(BOOL)a4 queue:(id)a5;
- (void)_startFetchObjectIDsActivityWithCompletion:(id)a3 synchronous:(BOOL)a4 queue:(id)a5;
- (void)_startProcessingWithCompletion:(id)a3 synchronous:(BOOL)a4 processor:(id)a5 queue:(id)a6;
- (void)cancel;
- (void)filterSkippedReminders:(id)a3;
- (void)signpostEndWithError:(int)a3 count:(unint64_t)a4;
- (void)signpostStart;
- (void)terminate;
@end

@implementation EKPredicateSearch

BOOL __44__EKPredicateSearch_filterSkippedReminders___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = ![v2 isReminderIntegrationEvent] || objc_msgSend(v2, "reminderOccurrenceType") != 1;

  return v3;
}

uint64_t __68__EKPredicateSearch__startActivityWithCompletion_synchronous_queue___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) signpostStart];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
  v5 = *(void **)(a1 + 32);

  return [v5 _startActualWithCompletion:v2 synchronous:v4 queue:v3];
}

void __80__EKPredicateSearch__startProcessingWithCompletion_synchronous_processor_queue___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v6 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __80__EKPredicateSearch__startProcessingWithCompletion_synchronous_processor_queue___block_invoke_cold_2(a1, a2, v6);
    }
    id v7 = *(id *)(a1 + 32);
    objc_sync_enter(v7);
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = *(_DWORD *)(v8 + 52);
    *(_DWORD *)(v8 + 52) = v9 + 1;
    objc_sync_exit(v7);

    if (v9 < 2)
    {
      [*(id *)(a1 + 32) _startProcessingWithCompletion:*(void *)(a1 + 48) synchronous:*(unsigned __int8 *)(a1 + 68) processor:*(void *)(a1 + 56) queue:*(void *)(a1 + 40)];
      goto LABEL_12;
    }
    v10 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __80__EKPredicateSearch__startProcessingWithCompletion_synchronous_processor_queue___block_invoke_cold_1(v10);
    }
  }
  v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __80__EKPredicateSearch__startProcessingWithCompletion_synchronous_processor_queue___block_invoke_60;
  v17[3] = &unk_1E5B98038;
  id v12 = v5;
  uint64_t v13 = *(void *)(a1 + 32);
  id v18 = v12;
  uint64_t v19 = v13;
  id v21 = *(id *)(a1 + 56);
  id v14 = v11;
  id v20 = v14;
  int v23 = a2;
  id v22 = *(id *)(a1 + 48);
  int v24 = *(_DWORD *)(a1 + 64);
  v15 = (void (**)(void))MEMORY[0x1A6266730](v17);
  v16 = v15;
  if (*(unsigned char *)(a1 + 68)) {
    v15[2](v15);
  }
  else {
    dispatch_async(*(dispatch_queue_t *)(a1 + 40), v15);
  }

LABEL_12:
}

void __80__EKPredicateSearch__startProcessingWithCompletion_synchronous_processor_queue___block_invoke_60(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v18 != v5) {
        objc_enumerationMutation(v2);
      }
      if (*(unsigned char *)(*(void *)(a1 + 40) + 49)) {
        break;
      }
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56));
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  int v7 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "eventAccessLevel", (void)v17);
  int v8 = [MEMORY[0x1E4F57690] isProgramSDKAtLeast:0x7E60901FFFFFFFFLL];
  BOOL v9 = v7 != 2 || v8 == 0;
  if (!v9 && [*(id *)(*(void *)(a1 + 40) + 24) conformsToProtocol:&unk_1EF983E60])
  {
    uint64_t v10 = *(void *)(a1 + 40);
    v11 = *(void **)(v10 + 32);
    id v12 = *(id *)(v10 + 24);
    uint64_t v13 = [v11 objectsPendingCommit];
    id v14 = [*(id *)(*(void *)(a1 + 40) + 32) deletedObjectIDsPendingCommit];
    [v12 expandWithObjectsPendingCommit:v13 deletedObjectIDs:v14 andResultArray:*(void *)(a1 + 48)];
  }
  [*(id *)(a1 + 40) filterSkippedReminders:*(void *)(a1 + 48)];
  objc_msgSend(*(id *)(a1 + 40), "signpostEndWithError:count:", *(unsigned int *)(a1 + 72), objc_msgSend(*(id *)(a1 + 48), "count"));
  uint64_t v15 = *(void *)(a1 + 40);
  if (!*(unsigned char *)(v15 + 49))
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    uint64_t v15 = *(void *)(a1 + 40);
  }
  v16 = [*(id *)(v15 + 32) connection];
  [v16 removeCancellableRemoteOperation:*(unsigned int *)(a1 + 76)];
}

void __66__EKPredicateSearch__startActualWithCompletion_synchronous_queue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [v5 loadedValues];
  int v8 = [v5 objectID];
  BOOL v9 = +[EKObjectID objectIDWithCADObjectID:v8];

  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v12 = a1 + 32;
  uint64_t v13 = [*(id *)(v11 + 32) registerFetchedObjectWithID:v9 withDefaultLoadedPropertyKeys:v10 values:v7];
  if (v13)
  {
    if ([v9 entityType] == 2)
    {
      id v14 = (EKReminder *)v5;
      uint64_t v15 = [(EKReminder *)v14 occurrenceDate];
      v16 = [[EKEvent alloc] initWithPersistentObject:v13 occurrenceDate:v15];
      if (v16)
      {
        long long v17 = [(EKReminder *)v14 nextReminderOccurrenceDate];
        if (v17) {
          [(EKEvent *)v16 _setNextCachedReminderOccurrenceDate:v17];
        }
        [v6 addObject:v16];
      }
LABEL_13:

      goto LABEL_14;
    }
    if ([v9 entityType] == 3)
    {
      id v14 = [[EKReminder alloc] initWithPersistentObject:v13];
      if (v14) {
        [v6 addObject:v14];
      }
      goto LABEL_13;
    }
  }
  else
  {
    long long v18 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __66__EKPredicateSearch__startActualWithCompletion_synchronous_queue___block_invoke_cold_1(v12, v18, (uint64_t)v9);
    }
  }
LABEL_14:
}

- (void)filterSkippedReminders:(id)a3
{
  id v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(NSPredicate *)self->_predicate excludeSkippedReminders]
    && [(EKEventStore *)self->_store showsIntegrations])
  {
    uint64_t v4 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_72];
    [v5 filterUsingPredicate:v4];
  }
}

- (void)signpostStart
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[EKPredicateSearch signpostHandle];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  char v5 = objc_opt_respondsToSelector();
  predicate = self->_predicate;
  if (v5)
  {
    id v11 = +[EKPredicateSearch signpostHandle];
    -[NSPredicate beginSignpostWithHandle:signpostID:](predicate, "beginSignpostWithHandle:signpostID:");
  }
  else
  {
    int v7 = [(NSPredicate *)self->_predicate predicateFormat];
    int v8 = +[EKPredicateSearch signpostHandle];
    BOOL v9 = v8;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_DWORD *)buf = 138412546;
      id v13 = (id)objc_opt_class();
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      id v10 = v13;
      _os_signpost_emit_with_name_impl(&dword_1A4E47000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v4, "EKPredicateSearch", "predicateClass=%@; predicateFormat=%@",
        buf,
        0x16u);
    }
  }
}

- (void)signpostEndWithError:(int)a3 count:(unint64_t)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v7 = +[EKPredicateSearch signpostHandle];
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);

  BOOL v9 = +[EKPredicateSearch signpostHandle];
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v11[0] = 67109376;
    v11[1] = a3;
    __int16 v12 = 2048;
    unint64_t v13 = a4;
    _os_signpost_emit_with_name_impl(&dword_1A4E47000, v10, OS_SIGNPOST_INTERVAL_END, v8, "EKPredicateSearch", "error=%i; foundItems=%lu",
      (uint8_t *)v11,
      0x12u);
  }
}

+ (id)signpostHandle
{
  if (signpostHandle_onceToken != -1) {
    dispatch_once(&signpostHandle_onceToken, &__block_literal_global_44);
  }
  id v2 = (void *)signpostHandle_signpostHandle;

  return v2;
}

void __37__EKPredicateSearch_runSynchronously__block_invoke(uint64_t a1, void *a2)
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancellationToken, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_predicate, 0);

  objc_storeStrong(&self->_callback, 0);
}

+ (id)searchWithEntityClass:(Class)a3 predicate:(id)a4 store:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)[objc_alloc((Class)a1) initWithEntityClass:a3 predicate:v9 store:v8];

  return v10;
}

- (EKPredicateSearch)initWithEntityClass:(Class)a3 predicate:(id)a4 store:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)EKPredicateSearch;
  id v11 = [(EKPredicateSearch *)&v14 init];
  __int16 v12 = v11;
  if (v11)
  {
    v11->_entityClass = a3;
    objc_storeStrong((id *)&v11->_predicate, a4);
    objc_storeStrong((id *)&v12->_store, a5);
  }

  return v12;
}

- (id)runSynchronously
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__12;
  id v9 = __Block_byref_object_dispose__12;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__EKPredicateSearch_runSynchronously__block_invoke;
  v4[3] = &unk_1E5B980F0;
  v4[4] = &v5;
  [(EKPredicateSearch *)self _startActivityWithCompletion:v4 synchronous:1 queue:0];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)_startActivityWithCompletion:(id)a3 synchronous:(BOOL)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(EKPredicateSearch *)self _createOSActivity];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__EKPredicateSearch__startActivityWithCompletion_synchronous_queue___block_invoke;
  v13[3] = &unk_1E5B98010;
  id v14 = v9;
  id v15 = v8;
  BOOL v16 = a4;
  v13[4] = self;
  id v11 = v9;
  id v12 = v8;
  os_activity_apply(v10, v13);
}

- (id)_createOSActivity
{
  p_predicate = &self->_predicate;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = "CADEventPredicate";
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v3 = "CADNotifiableEventsPredicate";
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v3 = "CADEventsForAssistantSearchPredicate";
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v3 = "CADNotificationCenterVisibleEventsPredicate";
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v3 = "CADUnacknowledgedEventsPredicate";
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v3 = "CADUnalertedEventsPredicate";
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v3 = "CADRespondedEventsPredicate";
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v3 = "CADUpcomingEventsPredicate";
                }
                else
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    uint64_t v3 = "EKMasterEventsPredicate";
                  }
                  else
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      uint64_t v3 = "EKScheduleAgentClientEventsPredicate";
                    }
                    else
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        uint64_t v3 = "CADTravelEventsPredicate";
                      }
                      else
                      {
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          uint64_t v3 = "CADUpNextEventsPredicate";
                        }
                        else
                        {
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            uint64_t v3 = "CADContactEventsPredicate";
                          }
                          else
                          {
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              uint64_t v3 = "CADEventCreatedFromSuggestionPredicate";
                            }
                            else
                            {
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                uint64_t v3 = "CADCalendarItemsWithExternalIdentifierPredicate";
                              }
                              else
                              {
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  uint64_t v3 = "CADPropertySearchPredicate";
                                }
                                else
                                {
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    uint64_t v3 = "CADEventTimeWindowPredicate";
                                  }
                                  else
                                  {
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      uint64_t v3 = "CADNaturalLanguageSuggestedEventsSearchPredicate";
                                    }
                                    else
                                    {
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        uint64_t v3 = "CADEventsForConferenceURLPredicate";
                                      }
                                      else
                                      {
                                        os_signpost_id_t v4 = (void *)EKLogHandle;
                                        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
                                          [(EKPredicateSearch *)(uint64_t)p_predicate _createOSActivity];
                                        }
                                        uint64_t v3 = "Unknown Predicate Search";
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  os_activity_t v5 = _os_activity_create(&dword_1A4E47000, v3, MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v5;
}

- (id)startWithCompletion:(id)a3 queue:(id)a4
{
  if (self->_isCancelled)
  {
    os_signpost_id_t v4 = 0;
  }
  else
  {
    store = self->_store;
    id v8 = a4;
    id v9 = a3;
    id v10 = [(EKEventStore *)store connection];
    uint64_t v11 = [v10 addCancellableRemoteOperation:self];

    id v12 = [NSNumber numberWithUnsignedInt:v11];
    id cancellationToken = self->_cancellationToken;
    self->_id cancellationToken = v12;

    self->_retryCount = 0;
    [(EKPredicateSearch *)self _startActivityWithCompletion:v9 synchronous:0 queue:v8];

    os_signpost_id_t v4 = [[EKEventFetchRequestToken alloc] initWithEventStore:self->_store token:v11];
  }

  return v4;
}

- (void)_startActualWithCompletion:(id)a3 synchronous:(BOOL)a4 queue:(id)a5
{
  BOOL v5 = a4;
  predicate = self->_predicate;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = [(NSPredicate *)predicate defaultPropertiesToLoad];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__EKPredicateSearch__startActualWithCompletion_synchronous_queue___block_invoke;
  v13[3] = &unk_1E5B980C8;
  v13[4] = self;
  id v14 = v11;
  id v12 = v11;
  [(EKPredicateSearch *)self _startProcessingWithCompletion:v10 synchronous:v5 processor:v13 queue:v9];
}

- (void)_startProcessingWithCompletion:(id)a3 synchronous:(BOOL)a4 processor:(id)a5 queue:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [self->_cancellationToken unsignedIntValue];
  Class entityClass = self->_entityClass;
  if (entityClass == (Class)objc_opt_class())
  {
    uint64_t v17 = 2;
  }
  else
  {
    Class v15 = self->_entityClass;
    if (v15 == (Class)objc_opt_class())
    {
      uint64_t v17 = 3;
    }
    else
    {
      Class v16 = self->_entityClass;
      if (v16 == (Class)objc_opt_class())
      {
        uint64_t v17 = 101;
      }
      else
      {
        [MEMORY[0x1E4F1CA00] raise:@"Unknown entity type", @"Didn't recognize entity class %@", self->_entityClass format];
        uint64_t v17 = 0xFFFFFFFFLL;
      }
    }
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __80__EKPredicateSearch__startProcessingWithCompletion_synchronous_processor_queue___block_invoke;
  v25[3] = &unk_1E5B98060;
  v25[4] = self;
  id v18 = v10;
  id v27 = v18;
  BOOL v30 = v8;
  id v19 = v11;
  id v28 = v19;
  id v20 = v12;
  id v26 = v20;
  int v29 = v13;
  id v21 = (void *)MEMORY[0x1A6266730](v25);
  uint64_t v22 = [(EKEventStore *)self->_store connection];
  int v23 = v22;
  if (v8) {
    [v22 CADOperationProxySync];
  }
  else {
  int v24 = [v22 CADOperationProxy];
  }

  [v24 CADDatabaseFetchCalendarItemsWithPredicate:self->_predicate entityType:v17 fetchIdentifier:v13 synchronous:v8 reply:v21];
}

uint64_t __35__EKPredicateSearch_signpostHandle__block_invoke()
{
  signpostHandle_signpostHandle = (uint64_t)os_log_create(ekSubSystem, "EKPredicateSearch");

  return MEMORY[0x1F41817F8]();
}

- (void)terminate
{
  self->_finished = 1;
}

- (void)_startFetchObjectIDsActivityWithCompletion:(id)a3 synchronous:(BOOL)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(EKPredicateSearch *)self _createOSActivity];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__EKPredicateSearch__startFetchObjectIDsActivityWithCompletion_synchronous_queue___block_invoke;
  v13[3] = &unk_1E5B98010;
  id v14 = v9;
  id v15 = v8;
  BOOL v16 = a4;
  v13[4] = self;
  id v11 = v9;
  id v12 = v8;
  os_activity_apply(v10, v13);
}

uint64_t __82__EKPredicateSearch__startFetchObjectIDsActivityWithCompletion_synchronous_queue___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) signpostStart];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
  BOOL v5 = *(void **)(a1 + 32);

  return [v5 _fetchObjectIDsActualWithCompletion:v2 synchronous:v4 queue:v3];
}

- (void)_fetchObjectIDsActualWithCompletion:(id)a3 synchronous:(BOOL)a4 queue:(id)a5
{
}

void __75__EKPredicateSearch__fetchObjectIDsActualWithCompletion_synchronous_queue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = [a2 objectID];
  id v6 = +[EKObjectID objectIDWithCADObjectID:v5];

  [v4 addObject:v6];
}

- (id)fetchObjectIDs
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__12;
  id v9 = __Block_byref_object_dispose__12;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__EKPredicateSearch_fetchObjectIDs__block_invoke;
  v4[3] = &unk_1E5B980F0;
  v4[4] = &v5;
  [(EKPredicateSearch *)self _startFetchObjectIDsActivityWithCompletion:v4 synchronous:1 queue:0];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __35__EKPredicateSearch_fetchObjectIDs__block_invoke(uint64_t a1, void *a2)
{
}

- (void)cancel
{
  self->_isCancelled = 1;
  uint64_t v3 = [(EKEventStore *)self->_store connection];
  id v4 = [v3 CADOperationProxy];
  objc_msgSend(v4, "CADDatabaseCancelFetchRequestWithIdentifier:", objc_msgSend(self->_cancellationToken, "unsignedIntValue"));

  id cancellationToken = self->_cancellationToken;
  self->_id cancellationToken = 0;
}

- (void)_createOSActivity
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  int v4 = 138412290;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_error_impl(&dword_1A4E47000, v2, OS_LOG_TYPE_ERROR, "Unexpected predicate class: %@", (uint8_t *)&v4, 0xCu);
}

void __80__EKPredicateSearch__startProcessingWithCompletion_synchronous_processor_queue___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "All retries exhausted for CADDatabaseFetchCalendarItemsWithPredicate", v1, 2u);
}

void __80__EKPredicateSearch__startProcessingWithCompletion_synchronous_processor_queue___block_invoke_cold_2(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = *(_DWORD *)(*(void *)(a1 + 32) + 52) + 1;
  v4[0] = 67109632;
  v4[1] = a2;
  __int16 v5 = 1024;
  int v6 = v3;
  __int16 v7 = 1024;
  int v8 = 3;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "Error (%d) in reply block for CADDatabaseFetchCalendarItemsWithPredicate attempt %d/%d", (uint8_t *)v4, 0x14u);
}

void __66__EKPredicateSearch__startActualWithCompletion_synchronous_queue___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v4 = a2;
  int v6 = 138412546;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2112;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_error_impl(&dword_1A4E47000, v4, OS_LOG_TYPE_ERROR, "%@: failed to register result object with objectID: %@", (uint8_t *)&v6, 0x16u);
}

@end