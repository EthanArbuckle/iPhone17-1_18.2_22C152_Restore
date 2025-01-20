@interface CSPrivateIndexController
- (BOOL)blocklistCheck:(id)a3 withOptions:(int64_t)a4;
- (BOOL)deviceFirstUnlockedInMKB;
- (BOOL)deviceFirstUnlockedInSB;
- (BOOL)deviceUnlocked;
- (BOOL)disableABCReporting:(id)a3;
- (BOOL)indexingEnabled;
- (BOOL)managedIndex;
- (BOOL)privateIndex;
- (BOOL)setupHasComplete;
- (CSPrivateIndexController)initWithBundle:(id)a3 directory:(id)a4;
- (NSString)bundleID;
- (NSString)indexPath;
- (OS_dispatch_queue)firstUnlockQueue;
- (OS_dispatch_queue)indexQueue;
- (SPCoreSpotlightIndexer)indexer;
- (id)disabledBundleSet;
- (id)extraTTRInfo;
- (id)indexDirectory;
- (id)taskForTopHitQueryWithQueryString:(id)a3 queryContext:(id)a4 eventHandler:(id)a5 resultsHandler:(id)a6 completionHandler:(id)a7;
- (void)deviceStateWillChange:(BOOL)a3;
- (void)didReceiveMemoryPressureNotification:(unint64_t)a3;
- (void)didReceiveSignal:(unint64_t)a3;
- (void)locked;
- (void)lockedCx;
- (void)locking;
- (void)lockingCx;
- (void)migrationCompleted;
- (void)setBundleID:(id)a3;
- (void)setFirstUnlockQueue:(id)a3;
- (void)setIndexPath:(id)a3;
- (void)setIndexQueue:(id)a3;
- (void)setIndexer:(id)a3;
- (void)startIndexer;
- (void)unlocked;
- (void)updateApplicationsWithCompletion:(id)a3 clean:(BOOL)a4;
@end

@implementation CSPrivateIndexController

- (BOOL)deviceUnlocked
{
  v2 = +[SDLockHandler sharedLockHandler];
  unsigned __int8 v3 = [v2 unlocked];

  return v3;
}

- (BOOL)blocklistCheck:(id)a3 withOptions:(int64_t)a4
{
  return 0;
}

- (void)startIndexer
{
  if ((atomic_exchange((atomic_uchar *volatile)&self->_didStart, 1u) & 1) == 0)
  {
    unsigned __int8 v3 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "### Indexer starting", v4, 2u);
    }

    dispatch_activate((dispatch_object_t)self->_indexQueue);
    [(SPCoreSpotlightIndexer *)self->_indexer start];
  }
}

- (CSPrivateIndexController)initWithBundle:(id)a3 directory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)CSPrivateIndexController;
  v9 = [(CSPrivateIndexController *)&v27 init];
  v10 = v9;
  if (v9)
  {
    [(CSPrivateIndexController *)v9 setIndexPath:v8];
    objc_storeStrong((id *)&v10->_bundleID, a3);
    v11 = dispatch_queue_attr_make_initially_inactive(0);
    v12 = dispatch_queue_attr_make_with_overcommit();
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(v12, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.spotlight.index", v14);
    indexQueue = v10->_indexQueue;
    v10->_indexQueue = (OS_dispatch_queue *)v15;

    v17 = dispatch_queue_attr_make_initially_inactive(0);
    v18 = dispatch_queue_attr_make_with_autorelease_frequency(v17, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create_with_target_V2("com.apple.spotlight.index.firstUnlock", v18, (dispatch_queue_t)v10->_indexQueue);
    firstUnlockQueue = v10->_firstUnlockQueue;
    v10->_firstUnlockQueue = (OS_dispatch_queue *)v19;

    +[SPCoreSpotlightIndexer setIndexerDelegate:v10];
    +[SDLockHandler setLockHandlerWithDelegate:v10 options:4];
    uint64_t v21 = +[SPCoreSpotlightIndexer sharedInstance];
    indexer = v10->_indexer;
    v10->_indexer = (SPCoreSpotlightIndexer *)v21;

    v23 = +[SDLockHandler sharedLockHandler];
    [v23 start];
    if ([v23 unlockedSinceBoot])
    {
      [(CSPrivateIndexController *)v10 startIndexer];
    }
    else
    {
      v24 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v26[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "### delaying indexer start until first unlock", (uint8_t *)v26, 2u);
      }
    }
  }

  return v10;
}

- (void)didReceiveSignal:(unint64_t)a3
{
  if (a3 == 1)
  {
    +[SPCoreSpotlightIndexer sync];
  }
  else if (a3 == 15)
  {
    +[SPCoreSpotlightIndexer shutdown];
  }
}

- (void)didReceiveMemoryPressureNotification:(unint64_t)a3
{
  +[SPCoreSpotlightIndexer setMemoryPressureStatus:](SPCoreSpotlightIndexer, "setMemoryPressureStatus:");
  if (a3 != 1)
  {
    +[SPCoreSpotlightIndexer shrink:a3];
  }
}

- (BOOL)privateIndex
{
  return 1;
}

- (BOOL)managedIndex
{
  return 0;
}

- (OS_dispatch_queue)indexQueue
{
  return self->_indexQueue;
}

- (OS_dispatch_queue)firstUnlockQueue
{
  return self->_firstUnlockQueue;
}

- (BOOL)deviceFirstUnlockedInMKB
{
  v2 = +[SDLockHandler sharedLockHandler];
  unsigned __int8 v3 = [v2 unlockedSinceBoot];

  return v3;
}

- (BOOL)deviceFirstUnlockedInSB
{
  v2 = +[SDLockHandler sharedLockHandler];
  unsigned __int8 v3 = [v2 firstUnlockedInSB];

  return v3;
}

- (BOOL)indexingEnabled
{
  return 1;
}

- (BOOL)setupHasComplete
{
  return 1;
}

- (void)updateApplicationsWithCompletion:(id)a3 clean:(BOOL)a4
{
}

- (id)taskForTopHitQueryWithQueryString:(id)a3 queryContext:(id)a4 eventHandler:(id)a5 resultsHandler:(id)a6 completionHandler:(id)a7
{
  return 0;
}

- (id)disabledBundleSet
{
  return 0;
}

- (id)indexDirectory
{
  return [(CSPrivateIndexController *)self indexPath];
}

- (id)extraTTRInfo
{
  return 0;
}

- (BOOL)disableABCReporting:(id)a3
{
  return 0;
}

- (void)deviceStateWillChange:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    [(CSPrivateIndexController *)self startIndexer];
  }

  +[SPCoreSpotlightIndexer deviceStateWillChange:v3];
}

- (void)migrationCompleted
{
  BOOL v3 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "### Controller migrationCompleted", (uint8_t *)&v5, 2u);
  }

  [(SPCoreSpotlightIndexer *)self->_indexer resume];
  v4 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    v6 = "com.apple.spotlight.index.firstUnlock";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Activate %s queue", (uint8_t *)&v5, 0xCu);
  }

  dispatch_activate((dispatch_object_t)self->_firstUnlockQueue);
}

- (void)locking
{
  BOOL v3 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "### Controller locking", v5, 2u);
  }

  v4 = [(CSPrivateIndexController *)self indexer];
  [v4 locking];
}

- (void)locked
{
  BOOL v3 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "### Controller locked", v5, 2u);
  }

  v4 = [(CSPrivateIndexController *)self indexer];
  [v4 locked];
}

- (void)lockingCx
{
  BOOL v3 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "### Controller locking Cx", v5, 2u);
  }

  v4 = [(CSPrivateIndexController *)self indexer];
  [v4 lockingCx];
}

- (void)lockedCx
{
  BOOL v3 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "### Controller locked Cx", v5, 2u);
  }

  v4 = [(CSPrivateIndexController *)self indexer];
  [v4 lockedCx];
}

- (void)unlocked
{
  BOOL v3 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "### Controller unlocked", v5, 2u);
  }

  v4 = [(CSPrivateIndexController *)self indexer];
  [v4 unlock];
}

- (SPCoreSpotlightIndexer)indexer
{
  return self->_indexer;
}

- (void)setIndexer:(id)a3
{
}

- (void)setIndexQueue:(id)a3
{
}

- (void)setFirstUnlockQueue:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_firstUnlockQueue, 0);
  objc_storeStrong((id *)&self->_indexQueue, 0);

  objc_storeStrong((id *)&self->_indexer, 0);
}

@end