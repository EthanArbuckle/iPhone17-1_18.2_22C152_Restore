@interface _CDSpotlightCoalescedDeletionManager
- (_CDSpotlightCoalescedDeletionManager)initWithKnowledgeStore:(id)a3;
- (_CDSpotlightCoalescedDeletionManager)initWithKnowledgeStore:(id)a3 persistencePath:(id)a4 delay:(double)a5;
- (void)deleteKnowledgeEventsMatchingPredicate:(id)a3 withCompletion:(id)a4;
- (void)processDeletionForOperation:(id)a3;
- (void)setupCoalescingTimer;
@end

@implementation _CDSpotlightCoalescedDeletionManager

- (_CDSpotlightCoalescedDeletionManager)initWithKnowledgeStore:(id)a3
{
  id v4 = a3;
  v5 = +[_CDPaths systemCachesDirectory];
  v6 = [v5 stringByAppendingPathComponent:@"_CDSpotlightCoalescedDeletionManager"];

  v7 = [(_CDSpotlightCoalescedDeletionManager *)self initWithKnowledgeStore:v4 persistencePath:v6 delay:5.0];
  return v7;
}

- (_CDSpotlightCoalescedDeletionManager)initWithKnowledgeStore:(id)a3 persistencePath:(id)a4 delay:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_CDSpotlightCoalescedDeletionManager;
  v11 = [(_CDSpotlightCoalescedDeletionManager *)&v17 init];
  v12 = v11;
  if (v11)
  {
    v11->_delay = a5;
    objc_storeStrong((id *)&v11->_persistencePath, a4);
    objc_storeStrong((id *)&v12->_knowledgeStore, a3);
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("deletionCoalesingQueue", v13);
    deletionCoalescingQueue = v12->_deletionCoalescingQueue;
    v12->_deletionCoalescingQueue = (OS_dispatch_queue *)v14;
  }
  [(_CDSpotlightCoalescedDeletionManager *)v12 setupCoalescingTimer];

  return v12;
}

- (void)setupCoalescingTimer
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60___CDSpotlightCoalescedDeletionManager_setupCoalescingTimer__block_invoke_11;
  v6[3] = &unk_1E5610858;
  v6[4] = self;
  v3 = (void *)MEMORY[0x192FB31A0](v6, a2);
  id v4 = [[_CDPersistedCoalescingTimer alloc] initWithDelay:&__block_literal_global_75 coalesceData:v3 operation:self->_persistencePath persistencePath:objc_opt_class() dataClass:@"_CDPersistedCoalescingTimer" timerName:self->_delay];
  deletionCoalescingTimer = self->_deletionCoalescingTimer;
  self->_deletionCoalescingTimer = v4;
}

- (void)deleteKnowledgeEventsMatchingPredicate:(id)a3 withCompletion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v6 = (void (**)(id, BOOL, id))a4;
  knowledgeStore = self->_knowledgeStore;
  id v16 = 0;
  uint64_t v8 = [(_DKKnowledgeEventStreamDeleting *)knowledgeStore deleteAllEventsMatchingPredicate:a3 error:&v16];
  id v9 = v16;
  if (v9)
  {
    id v10 = +[_CDLogging spotlightReceiverChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[_CDSpotlightCoalescedDeletionManager deleteKnowledgeEventsMatchingPredicate:withCompletion:]((uint64_t)v9, v10);
    }
  }
  else
  {
    v11 = +[_CDLogging spotlightReceiverChannel];
    id v10 = v11;
    if (v8)
    {
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_10;
      }
      *(_DWORD *)buf = 134217984;
      uint64_t v18 = v8;
      v12 = "_CDSpotlightCoalescedDeletionManager Successfully deleted %tu knowledge events.";
      v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      uint32_t v15 = 12;
    }
    else
    {
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
        goto LABEL_10;
      }
      *(_WORD *)buf = 0;
      v12 = "_CDSpotlightCoalescedDeletionManager No knowledge events were deleted because none of them matched the coale"
            "sced deletion operations.";
      v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_INFO;
      uint32_t v15 = 2;
    }
    _os_log_impl(&dword_18ECEB000, v13, v14, v12, buf, v15);
  }
LABEL_10:

  if (v6) {
    v6[2](v6, v9 == 0, v9);
  }
}

- (void)processDeletionForOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_deletionCoalescingTimer, 0);
  objc_storeStrong((id *)&self->_persistencePath, 0);
  objc_storeStrong((id *)&self->_deletionCoalescingQueue, 0);
}

- (void)deleteKnowledgeEventsMatchingPredicate:(uint64_t)a1 withCompletion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "_CDSpotlightCoalescedDeletionManager Failed to delete knowledge events. Error = %{public}@.", (uint8_t *)&v2, 0xCu);
}

@end