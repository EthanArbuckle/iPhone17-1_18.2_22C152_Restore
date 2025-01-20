@interface _CDSpotlightContactResolver
+ (id)resolveContactIfPossibleFromContactIdentifierString:(id)a3;
+ (id)sharedInstance;
- (_CDSpotlightContactResolver)init;
- (id)_getCachedContactForHandle:(id)a3;
- (void)_purge;
- (void)_setContact:(id)a3 forHandle:(id)a4;
- (void)_validateCache;
@end

@implementation _CDSpotlightContactResolver

- (_CDSpotlightContactResolver)init
{
  v16.receiver = self;
  v16.super_class = (Class)_CDSpotlightContactResolver;
  id v2 = [(_CDSpotlightContactResolver *)&v16 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F93B70]);
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F93B48]) initWithCountLimit:2000];
    uint64_t v5 = [v3 initWithGuardedData:v4];
    v6 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("cdSpotlightResolverTimerQueue", v7);
    v9 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v8;

    dispatch_source_t v10 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 1uLL, *((dispatch_queue_t *)v2 + 2));
    v11 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v10;

    dispatch_source_set_timer(*((dispatch_source_t *)v2 + 3), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    v12 = *((void *)v2 + 3);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __35___CDSpotlightContactResolver_init__block_invoke;
    handler[3] = &unk_1E560D578;
    id v15 = v2;
    dispatch_source_set_event_handler(v12, handler);
    dispatch_resume(*((dispatch_object_t *)v2 + 3));
  }
  return (_CDSpotlightContactResolver *)v2;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken5 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken5, &__block_literal_global_6);
  }
  id v2 = (void *)sharedInstance__pasExprOnceResult_0;
  return v2;
}

+ (id)resolveContactIfPossibleFromContactIdentifierString:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = +[_CDSpotlightContactResolver sharedInstance];
    uint64_t v5 = [v4 _getCachedContactForHandle:v3];
    if (v5)
    {
      v6 = +[_CDLogging spotlightReceiverChannel];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        +[_CDSpotlightContactResolver resolveContactIfPossibleFromContactIdentifierString:](v6);
      }

      v7 = [v5 contact];
    }
    else
    {
      v7 = +[_CDContactResolver resolveContactIfPossibleFromContactIdentifierString:v3];
      [v4 _setContact:v7 forHandle:v3];
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_validateCache
{
  dispatch_suspend((dispatch_object_t)self->_cacheInvalidationTimer);
  if (!self->_transaction)
  {
    id v3 = (OS_os_transaction *)os_transaction_create();
    transaction = self->_transaction;
    self->_transaction = v3;
  }
  cacheInvalidationTimer = self->_cacheInvalidationTimer;
  dispatch_time_t v6 = dispatch_time(0, 3000000000);
  dispatch_source_set_timer(cacheInvalidationTimer, v6, 0xFFFFFFFFFFFFFFFFLL, 0);
  v7 = self->_cacheInvalidationTimer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __45___CDSpotlightContactResolver__validateCache__block_invoke;
  handler[3] = &unk_1E560D578;
  void handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_resume((dispatch_object_t)self->_cacheInvalidationTimer);
}

- (void)_setContact:(id)a3 forHandle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(_CDSpotlightContactResolver *)self _validateCache];
  cachedContactsForHandle = self->_cachedContactsForHandle;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53___CDSpotlightContactResolver__setContact_forHandle___block_invoke;
  v11[3] = &unk_1E560D8C8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(_PASLock *)cachedContactsForHandle runWithLockAcquired:v11];
}

- (id)_getCachedContactForHandle:(id)a3
{
  id v4 = a3;
  [(_CDSpotlightContactResolver *)self _validateCache];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__3;
  objc_super v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  cachedContactsForHandle = self->_cachedContactsForHandle;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58___CDSpotlightContactResolver__getCachedContactForHandle___block_invoke;
  v9[3] = &unk_1E560D8F0;
  v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [(_PASLock *)cachedContactsForHandle runWithLockAcquired:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)_purge
{
  id v3 = +[_CDLogging spotlightReceiverChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18ECEB000, v3, OS_LOG_TYPE_INFO, "_CDSpotlightContactResolver: Purging cache.", buf, 2u);
  }

  cachedContactsForHandle = self->_cachedContactsForHandle;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37___CDSpotlightContactResolver__purge__block_invoke;
  v5[3] = &unk_1E560D918;
  v5[4] = self;
  [(_PASLock *)cachedContactsForHandle runWithLockAcquired:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_cacheInvalidationTimer, 0);
  objc_storeStrong((id *)&self->_cacheInvalidationTimerQueue, 0);
  objc_storeStrong((id *)&self->_cachedContactsForHandle, 0);
}

+ (void)resolveContactIfPossibleFromContactIdentifierString:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_18ECEB000, log, OS_LOG_TYPE_DEBUG, "_CDSpotlightContactResolver: Cache hit", v1, 2u);
}

@end