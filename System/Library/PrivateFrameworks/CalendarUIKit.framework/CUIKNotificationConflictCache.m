@interface CUIKNotificationConflictCache
+ (id)sharedInstance;
- (BOOL)_updateNotification:(id)a3 withCacheObject:(id)a4;
- (CUIKNotificationConflictCache)init;
- (id)_eventForNotification:(id)a3;
- (id)conflictsForNotification:(id)a3;
- (void)updateConflictsForNotification:(id)a3 synchronously:(BOOL)a4 withCompletion:(id)a5;
@end

@implementation CUIKNotificationConflictCache

- (CUIKNotificationConflictCache)init
{
  v11.receiver = self;
  v11.super_class = (Class)CUIKNotificationConflictCache;
  v2 = [(CUIKNotificationConflictCache *)&v11 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    cache = v2->_cache;
    v2->_cache = (NSCache *)v3;

    [(NSCache *)v2->_cache setCountLimit:1000];
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("ConflictScanningQueue", v5);
    fetchQueue = v2->_fetchQueue;
    v2->_fetchQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F25550]) initWithEKOptions:130 path:0 changeTrackingClientId:0 enablePropertyModificationLogging:0 allowDelegateSources:1];
    store = v2->_store;
    v2->_store = (EKEventStore *)v8;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_35);
  }
  v2 = (void *)sharedInstance__sharedInstance;

  return v2;
}

void __47__CUIKNotificationConflictCache_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = v0;
}

- (id)_eventForNotification:(id)a3
{
  store = self->_store;
  v4 = [a3 event];
  v5 = [v4 recurrenceIdentifier];
  dispatch_queue_t v6 = [(EKEventStore *)store eventWithRecurrenceIdentifier:v5];

  return v6;
}

- (BOOL)_updateNotification:(id)a3 withCacheObject:(id)a4
{
  id v6 = a4;
  v7 = [(CUIKNotificationConflictCache *)self _eventForNotification:a3];
  uint64_t v8 = [v7 scanForConflicts];

  v9 = [v6 conflictInfo];
  if (!v9 || v8)
  {
    objc_super v11 = [v6 conflictInfo];
    if (v11 || !v8)
    {
      v12 = [v6 conflictInfo];
      uint64_t v13 = [v12 totalOccurrencesInSeries];
      if (v13 == [v8 totalOccurrencesInSeries])
      {
        v14 = [v6 conflictInfo];
        uint64_t v15 = [v14 totalConflictsInSeries];
        if (v15 == [v8 totalConflictsInSeries])
        {
          v16 = [v6 conflictInfo];
          uint64_t v17 = [v16 totalConflictingEvents];
          if (v17 == [v8 totalConflictingEvents])
          {
            v18 = [v6 conflictInfo];
            uint64_t v19 = [v18 totalNeedsActionEvents];
            BOOL v10 = v19 != [v8 totalNeedsActionEvents];
          }
          else
          {
            BOOL v10 = 1;
          }
        }
        else
        {
          BOOL v10 = 1;
        }
      }
      else
      {
        BOOL v10 = 1;
      }
    }
    else
    {
      BOOL v10 = 1;
    }
  }
  else
  {
    BOOL v10 = 1;
  }

  [v6 setConflictInfo:v8];
  [v6 setState:2];

  return v10;
}

- (void)updateConflictsForNotification:(id)a3 synchronously:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = +[CUIKNotificationConflictCacheObject keyForNotification:v8];
  objc_super v11 = self;
  objc_sync_enter(v11);
  v12 = [(NSCache *)v11->_cache objectForKey:v10];
  if (!v12)
  {
    v12 = objc_opt_new();
    [(NSCache *)v11->_cache setObject:v12 forKey:v10];
  }
  if (v6)
  {
    [(CUIKNotificationConflictCache *)v11 _updateNotification:v8 withCacheObject:v12];
  }
  else if ([v12 state] != 1)
  {
    [v12 setState:1];
    fetchQueue = v11->_fetchQueue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __93__CUIKNotificationConflictCache_updateConflictsForNotification_synchronously_withCompletion___block_invoke;
    v14[3] = &unk_1E636B2C8;
    v14[4] = v11;
    id v15 = v8;
    id v16 = v12;
    id v17 = v9;
    dispatch_async(fetchQueue, v14);
  }
  objc_sync_exit(v11);
}

uint64_t __93__CUIKNotificationConflictCache_updateConflictsForNotification_synchronously_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _updateNotification:*(void *)(a1 + 40) withCacheObject:*(void *)(a1 + 48)];
  if (result)
  {
    uint64_t result = *(void *)(a1 + 56);
    if (result)
    {
      uint64_t v3 = *(uint64_t (**)(void))(result + 16);
      return v3();
    }
  }
  return result;
}

- (id)conflictsForNotification:(id)a3
{
  id v4 = a3;
  v5 = +[CUIKNotificationConflictCacheObject keyForNotification:v4];
  BOOL v6 = self;
  objc_sync_enter(v6);
  v7 = [(NSCache *)v6->_cache objectForKey:v5];
  id v8 = [v7 conflictInfo];

  objc_sync_exit(v6);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_fetchQueue, 0);

  objc_storeStrong((id *)&self->_cache, 0);
}

@end