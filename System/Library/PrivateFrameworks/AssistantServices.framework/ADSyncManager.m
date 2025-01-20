@interface ADSyncManager
- (ADSyncManager)initWithServiceManager:(id)a3 queue:(id)a4;
- (BOOL)_forceResetOnNextSync;
- (BOOL)isSyncing;
- (BOOL)isVerifying;
- (BOOL)shouldIncludeAllKnownSiriKitAnchorsForReason:(id)a3;
- (BOOL)shouldSyncEverythingForReason:(id)a3;
- (BOOL)shouldSyncIntentPolicyForSyncKeys:(id)a3;
- (BOOL)shouldSyncThirdPartyUserVocabularyForSyncKeys:(id)a3;
- (SASyncAnchor)_currentAnchor;
- (SASyncGetAnchors)getAnchorsRequest;
- (id)_continueBlock;
- (id)_preferredSyncKeyOrder;
- (id)_serviceManager;
- (id)_sortedAnchorsFromAnchors:(id)a3;
- (id)queuedAnchors;
- (id)queuedReasons;
- (id)syncKeysForReason:(id)a3;
- (void)_continueSync;
- (void)_finishSync;
- (void)_invokeContinueBlockWithKeepGoingArgument:(BOOL)a3;
- (void)_postSyncFinishedNotification;
- (void)_setAnchorsToSync:(id)a3;
- (void)_setContinueBlock:(id)a3;
- (void)_setCurrentAnchor:(id)a3;
- (void)_setCurrentAnchorToNext;
- (void)_setForceResetOnNextSync:(BOOL)a3;
- (void)_syncFinishedForService:(id)a3 error:(id)a4;
- (void)_syncingService:(id)a3 withSyncInfo:(id)a4 receivedChunk:(id)a5 continueBlock:(id)a6;
- (void)_waitUntilSafeToContinue;
- (void)addQueuedAnchors:(id)a3 forReasons:(id)a4;
- (void)cancelSyncForAnchor:(id)a3;
- (void)clearQueuedAnchorsAndReasons;
- (void)continueSync;
- (void)prepareSyncWithAnchors:(id)a3 forReasons:(id)a4 delegate:(id)a5;
- (void)reset;
- (void)serviceTimedoutForSync:(id)a3;
- (void)setGetAnchorsRequest:(id)a3;
- (void)setIsVerifying:(BOOL)a3;
@end

@implementation ADSyncManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_getAnchorsRequest, 0);
  objc_storeStrong((id *)&self->_timedoutServices, 0);
  objc_storeStrong(&self->_continueBlock, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_currentSyncID, 0);
  objc_storeStrong((id *)&self->_currentSyncGeneration, 0);
  objc_storeStrong((id *)&self->_currentSyncService, 0);
  objc_storeStrong((id *)&self->_currentAnchor, 0);
  objc_storeStrong((id *)&self->_syncedAnchors, 0);
  objc_storeStrong((id *)&self->_queuedReasons, 0);
  objc_storeStrong((id *)&self->_queuedAnchorsByNormalizedKey, 0);
  objc_storeStrong((id *)&self->_currentSyncReasons, 0);
  objc_storeStrong((id *)&self->_anchorsToSync, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_serviceManager, 0);
}

- (void)setIsVerifying:(BOOL)a3
{
  self->_isVerifying = a3;
}

- (BOOL)isVerifying
{
  return self->_isVerifying;
}

- (void)setGetAnchorsRequest:(id)a3
{
}

- (SASyncGetAnchors)getAnchorsRequest
{
  return self->_getAnchorsRequest;
}

- (void)_setContinueBlock:(id)a3
{
}

- (id)_continueBlock
{
  return self->_continueBlock;
}

- (void)_setForceResetOnNextSync:(BOOL)a3
{
  self->_forceResetOnNextSync = a3;
}

- (BOOL)_forceResetOnNextSync
{
  return self->_forceResetOnNextSync;
}

- (void)_setCurrentAnchor:(id)a3
{
}

- (SASyncAnchor)_currentAnchor
{
  return self->_currentAnchor;
}

- (void)serviceTimedoutForSync:(id)a3
{
  timedoutServices = self->_timedoutServices;
  v5 = [a3 identifier];
  [(NSMutableSet *)timedoutServices addObject:v5];

  if ((unint64_t)[(NSMutableSet *)self->_timedoutServices count] >= 3)
  {
    v6 = AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      v8 = "-[ADSyncManager serviceTimedoutForSync:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Too many plugins have timed out for sync, reset and try later", (uint8_t *)&v7, 0xCu);
    }
    [(ADSyncManager *)self reset];
  }
}

- (void)reset
{
  unsigned int v3 = [(ADSyncManager *)self isSyncing];
  BOOL isVerifying = self->_isVerifying;
  v5 = self->_delegate;
  [(ADSyncManager *)self cancelSyncForAnchor:self->_currentAnchor];
  delegate = self->_delegate;
  self->_delegate = 0;

  getAnchorsRequest = self->_getAnchorsRequest;
  self->_getAnchorsRequest = 0;

  currentAnchor = self->_currentAnchor;
  self->_currentAnchor = 0;

  syncedAnchors = self->_syncedAnchors;
  self->_syncedAnchors = 0;

  anchorsToSync = self->_anchorsToSync;
  self->_anchorsToSync = 0;

  currentSyncReasons = self->_currentSyncReasons;
  self->_currentSyncReasons = 0;

  id continueBlock = self->_continueBlock;
  self->_id continueBlock = 0;

  currentSyncService = self->_currentSyncService;
  self->_currentSyncService = 0;

  currentSyncID = self->_currentSyncID;
  self->_currentSyncID = 0;

  timedoutServices = self->_timedoutServices;
  self->_timedoutServices = 0;

  self->_BOOL isVerifying = 0;
  if (v3)
  {
    v16 = AFSiriLogContextSync;
    BOOL v17 = os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO);
    if (isVerifying)
    {
      if (v17)
      {
        *(_DWORD *)v19 = 136315138;
        *(void *)&v19[4] = "-[ADSyncManager reset]";
        v18 = "%s In progress verification has been reset";
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, v18, v19, 0xCu);
      }
    }
    else if (v17)
    {
      *(_DWORD *)v19 = 136315138;
      *(void *)&v19[4] = "-[ADSyncManager reset]";
      v18 = "%s In progress sync has been reset";
      goto LABEL_7;
    }
    -[ADSyncManagerDelegate syncManagerDidResetInProgressSync:](v5, "syncManagerDidResetInProgressSync:", self, *(_OWORD *)v19);
  }
}

- (void)_invokeContinueBlockWithKeepGoingArgument:(BOOL)a3
{
  id continueBlock = self->_continueBlock;
  if (continueBlock)
  {
    BOOL v5 = a3;
    int v7 = (void (**)(id, BOOL))objc_retainBlock(continueBlock);
    id v6 = self->_continueBlock;
    self->_id continueBlock = 0;

    v7[2](v7, v5);
  }
}

- (void)cancelSyncForAnchor:(id)a3
{
  id v4 = a3;
  BOOL v5 = self->_currentAnchor;
  id v6 = v4;
  uint64_t v7 = [(SASyncAnchor *)v5 key];
  uint64_t v8 = [v6 key];
  if (v7 | v8 && ![(id)v7 isEqual:v8])
  {

    goto LABEL_11;
  }
  uint64_t v9 = [(SASyncAnchor *)v5 appMetaData];
  uint64_t v10 = [v6 appMetaData];
  if (v9 | v10)
  {
    v11 = (void *)v10;
    unsigned __int8 v12 = [(id)v9 isEqual:v10];

    if ((v12 & 1) == 0)
    {
LABEL_11:
      v14 = AFSiriLogContextSync;
      if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
      {
        currentAnchor = self->_currentAnchor;
        int v16 = 136315650;
        BOOL v17 = "-[ADSyncManager cancelSyncForAnchor:]";
        __int16 v18 = 2112;
        id v19 = v6;
        __int16 v20 = 2112;
        v21 = currentAnchor;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Ignoring sync cancel for anchor %@. Current anchor is %@", (uint8_t *)&v16, 0x20u);
      }
      goto LABEL_13;
    }
  }
  else
  {
  }
  v13 = AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315394;
    BOOL v17 = "-[ADSyncManager cancelSyncForAnchor:]";
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Canceling sync for anchor %@", (uint8_t *)&v16, 0x16u);
  }
  self->_currentSyncShouldCancel = 1;
  [(ADSyncManager *)self _invokeContinueBlockWithKeepGoingArgument:0];
LABEL_13:
}

- (void)continueSync
{
  id continueBlock = self->_continueBlock;
  id v4 = AFSiriLogContextSync;
  BOOL v5 = os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO);
  if (continueBlock)
  {
    if (v5)
    {
      int v6 = 136315138;
      uint64_t v7 = "-[ADSyncManager continueSync]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Continuing sync", (uint8_t *)&v6, 0xCu);
    }
    [(ADSyncManager *)self _invokeContinueBlockWithKeepGoingArgument:1];
  }
  else if (v5)
  {
    int v6 = 136315138;
    uint64_t v7 = "-[ADSyncManager continueSync]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Sync Manager isn't waiting on a continue, ignoring request", (uint8_t *)&v6, 0xCu);
  }
}

- (BOOL)isSyncing
{
  return self->_delegate != 0;
}

- (void)_waitUntilSafeToContinue
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100231734;
  v3[3] = &unk_100507778;
  objc_copyWeak(&v4, &location);
  [(ADSyncManager *)self _setContinueBlock:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (id)queuedReasons
{
  return self->_queuedReasons;
}

- (id)queuedAnchors
{
  id v3 = [(NSMutableDictionary *)self->_queuedAnchorsByNormalizedKey count];
  if (v3)
  {
    id v3 = [(NSMutableDictionary *)self->_queuedAnchorsByNormalizedKey allValues];
  }
  return v3;
}

- (void)clearQueuedAnchorsAndReasons
{
  queuedAnchorsByNormalizedKey = self->_queuedAnchorsByNormalizedKey;
  self->_queuedAnchorsByNormalizedKey = 0;

  queuedReasons = self->_queuedReasons;
  self->_queuedReasons = 0;
}

- (void)addQueuedAnchors:(id)a3 forReasons:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_queuedAnchorsByNormalizedKey)
  {
    uint64_t v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    queuedAnchorsByNormalizedKey = self->_queuedAnchorsByNormalizedKey;
    self->_queuedAnchorsByNormalizedKey = v8;
  }
  id v10 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", -[NSMutableArray count](self->_anchorsToSync, "count"));
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v11 = self->_anchorsToSync;
  id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v36 objects:v47 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v37;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v37 != v14) {
          objc_enumerationMutation(v11);
        }
        int v16 = objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * i), "_af_normalizedKey");
        [v10 addObject:v16];
      }
      id v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v36 objects:v47 count:16];
    }
    while (v13);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v17 = v6;
  id v18 = [v17 countByEnumeratingWithState:&v32 objects:v46 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v33;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v32 + 1) + 8 * (void)j);
        v23 = objc_msgSend(v22, "_af_normalizedKey", (void)v32);
        if (([v10 containsObject:v23] & 1) == 0) {
          [(NSMutableDictionary *)self->_queuedAnchorsByNormalizedKey setObject:v22 forKey:v23];
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v32 objects:v46 count:16];
    }
    while (v19);
  }

  queuedReasons = self->_queuedReasons;
  if (!queuedReasons)
  {
    v25 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v26 = self->_queuedReasons;
    self->_queuedReasons = v25;

    queuedReasons = self->_queuedReasons;
  }
  -[NSMutableSet addObjectsFromArray:](queuedReasons, "addObjectsFromArray:", v7, (void)v32);
  v27 = (void *)AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_DEBUG))
  {
    v28 = self->_queuedAnchorsByNormalizedKey;
    v29 = v27;
    v30 = [(NSMutableDictionary *)v28 allKeys];
    v31 = self->_queuedReasons;
    *(_DWORD *)buf = 136315650;
    v41 = "-[ADSyncManager addQueuedAnchors:forReasons:]";
    __int16 v42 = 2112;
    v43 = v30;
    __int16 v44 = 2112;
    v45 = v31;
    _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "%s Anchors in queue: %@ for reasons: %@", buf, 0x20u);
  }
}

- (void)prepareSyncWithAnchors:(id)a3 forReasons:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (self->_delegate)
  {
    v24 = +[NSAssertionHandler currentHandler];
    [v24 handleFailureInMethod:a2, self, @"ADSyncManager.m", 287, @"Already have a sync delegate, is sync still in progress?" object file lineNumber description];
  }
  id v12 = +[ADAudioFileWriter _savedAudioFilesDirectory]_0();
  objc_storeStrong((id *)&self->_delegate, a5);
  id v13 = (NSUUID *)objc_alloc_init((Class)NSUUID);
  currentSyncID = self->_currentSyncID;
  self->_currentSyncID = v13;

  v15 = AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    int v16 = self->_currentSyncID;
    int v25 = 136315650;
    v26 = "-[ADSyncManager prepareSyncWithAnchors:forReasons:delegate:]";
    __int16 v27 = 2112;
    v28 = v16;
    __int16 v29 = 2112;
    id v30 = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s Preparing sync with ID %@ for reasons: %@", (uint8_t *)&v25, 0x20u);
  }
  id v17 = [(ADSyncManager *)self _sortedAnchorsFromAnchors:v9];
  [(ADSyncManager *)self _setAnchorsToSync:v17];
  id v18 = (NSSet *)[objc_alloc((Class)NSSet) initWithArray:v10];
  currentSyncReasons = self->_currentSyncReasons;
  self->_currentSyncReasons = v18;

  uint64_t v20 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v17, "count"));
  syncedAnchors = self->_syncedAnchors;
  self->_syncedAnchors = v20;

  v22 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  timedoutServices = self->_timedoutServices;
  self->_timedoutServices = v22;

  [(ADSyncManager *)self _waitUntilSafeToContinue];
  [(ADSyncManagerDelegate *)self->_delegate syncManagerIsPausingSync:self];
}

- (id)_sortedAnchorsFromAnchors:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v23 = self;
    id v5 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v4, "count"));
    id v6 = objc_alloc_init((Class)NSMutableArray);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v25;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v13 = [v12 key];
          if (v13
            && ([v12 appMetaData],
                uint64_t v14 = objc_claimAutoreleasedReturnValue(),
                v14,
                !v14))
          {
            [v5 setObject:v12 forKey:v13];
          }
          else
          {
            [v6 addObject:v12];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v9);
    }

    id v15 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v7, "count"));
    int v16 = [(ADSyncManager *)v23 _preferredSyncKeyOrder];
    id v17 = (char *)[v16 count];
    if (v17)
    {
      id v18 = v17 - 1;
      do
      {
        id v19 = [v16 objectAtIndex:v18];
        uint64_t v20 = [v5 objectForKey:v19];
        if (v20)
        {
          [v15 addObject:v20];
          [v5 removeObjectForKey:v19];
        }

        --v18;
      }
      while (v18 != (char *)-1);
    }
    v21 = [v5 allValues];
    if (v21) {
      [v6 addObjectsFromArray:v21];
    }
    if (v15) {
      [v6 addObjectsFromArray:v15];
    }
  }
  else
  {
    id v6 = v4;
  }

  return v6;
}

- (void)_postSyncFinishedNotification
{
}

- (void)_continueSync
{
  id v3 = AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    anchorsToSync = self->_anchorsToSync;
    *(_DWORD *)buf = 136315394;
    v23 = "-[ADSyncManager _continueSync]";
    __int16 v24 = 2112;
    long long v25 = anchorsToSync;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s anchorsToSync: %@", buf, 0x16u);
  }
  [(ADSyncManager *)self _setCurrentAnchorToNext];
  currentAnchor = self->_currentAnchor;
  if (!currentAnchor) {
    goto LABEL_14;
  }
  *(void *)&long long v5 = 136315394;
  long long v17 = v5;
  while (1)
  {
    id v7 = [(SASyncAnchor *)currentAnchor key];
    uint64_t v8 = [(ADServiceManager *)self->_serviceManager serviceForSyncAnchorKey:v7];
    if (v8) {
      break;
    }
    id v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = v17;
      v23 = "-[ADSyncManager _continueSync]";
      __int16 v24 = 2114;
      long long v25 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Sync manager couldn't find connection for anchor key %{public}@. Moving on.", buf, 0x16u);
    }
    [(ADSyncManager *)self _setCurrentAnchorToNext];

    currentAnchor = self->_currentAnchor;
    if (!currentAnchor) {
      goto LABEL_14;
    }
  }
  uint64_t v10 = (void *)v8;
  id v11 = [objc_alloc((Class)AFSyncInfo) initWithAnchor:self->_currentAnchor forcingReset:self->_forceResetOnNextSync];
  [v11 setReasons:self->_currentSyncReasons];
  [v11 setForVerification:self->_isVerifying];
  if (self->_forceResetOnNextSync)
  {
    id v12 = AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = v17;
      v23 = "-[ADSyncManager _continueSync]";
      __int16 v24 = 2112;
      long long v25 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Forcing a reset on key %@", buf, 0x16u);
    }
  }
  [v10 setDelegate:self];
  self->_currentSyncShouldCancel = 0;
  objc_storeStrong((id *)&self->_currentSyncService, v10);
  self->_currentSyncHasChanges = 0;
  id v13 = [(NSUUID *)self->_currentSyncID copy];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1002322BC;
  v18[3] = &unk_100507750;
  v18[4] = self;
  id v19 = v10;
  id v20 = v13;
  id v21 = v11;
  id v14 = v11;
  id v15 = v13;
  id v16 = v10;
  [v16 beginSyncForInfo:v14 chunkHandler:v18];

  if (!self->_currentAnchor) {
LABEL_14:
  }
    [(ADSyncManager *)self _finishSync];
}

- (void)_syncFinishedForService:(id)a3 error:(id)a4
{
  [a3 setDelegate:0];
  currentSyncService = self->_currentSyncService;
  self->_currentSyncService = 0;

  if (!a4 && !self->_currentSyncShouldCancel)
  {
    id v7 = [(ADSyncManager *)self _currentAnchor];
    if (v7)
    {
      [(NSMutableArray *)self->_syncedAnchors addObject:v7];
      uint64_t v8 = [v7 key];
      id v12 = v8;
      id v9 = +[NSArray arrayWithObjects:&v12 count:1];
      sub_1002E7490(v9);
    }
    if (self->_currentSyncHasChanges)
    {
      delegate = self->_delegate;
      id v11 = [v7 key];
      [(ADSyncManagerDelegate *)delegate syncManager:self finishedSyncForSyncKey:v11 generation:self->_currentSyncGeneration];
    }
  }
  [(ADSyncManager *)self _setCurrentAnchor:0];
  [(ADSyncManager *)self _waitUntilSafeToContinue];
  [(ADSyncManagerDelegate *)self->_delegate syncManagerIsPausingSync:self];
}

- (void)_syncingService:(id)a3 withSyncInfo:(id)a4 receivedChunk:(id)a5 continueBlock:(id)a6
{
  id v41 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void))a6;
  id v14 = [v11 appMetadata];
  id v15 = [v14 appIdentifyingInfo];

  id v16 = [v12 toAdd];
  *((void *)&v40 + 1) = [v16 count];

  long long v17 = [v12 toRemove];
  *(void *)&long long v40 = [v17 count];

  id v18 = (void *)AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    log = v18;
    long long v37 = [v11 key];
    long long v39 = [v11 anchor];
    long long v32 = [v11 validity];
    id v34 = [v11 count];
    id v19 = [v15 bundleId];
    __int16 v29 = [v15 version];
    id v20 = [v15 clientIdentifier];
    [v15 buildNumber];
    v21 = long long v38 = v11;
    v31 = [v38 appMetadata];
    [v31 syncSlots];
    v22 = long long v35 = a2;
    [v12 pre];
    v23 = id v30 = self;
    __int16 v24 = [v12 post];
    [v12 validity];
    v25 = long long v36 = v13;
    *(_DWORD *)buf = 136318978;
    v43 = "-[ADSyncManager _syncingService:withSyncInfo:receivedChunk:continueBlock:]";
    __int16 v44 = 2112;
    id v45 = v41;
    __int16 v46 = 2112;
    v47 = v37;
    __int16 v48 = 2112;
    v49 = v39;
    __int16 v50 = 2112;
    v51 = v32;
    __int16 v52 = 2048;
    id v53 = v34;
    __int16 v54 = 2112;
    v55 = v19;
    __int16 v56 = 2112;
    v57 = v29;
    __int16 v58 = 2112;
    v59 = v20;
    __int16 v60 = 2112;
    v61 = v21;
    __int16 v62 = 2112;
    v63 = v22;
    __int16 v64 = 2112;
    v65 = v23;
    __int16 v66 = 2112;
    v67 = v24;
    __int16 v68 = 2112;
    v69 = v25;
    __int16 v70 = 2048;
    uint64_t v71 = *((void *)&v40 + 1);
    __int16 v72 = 2048;
    uint64_t v73 = v40;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s %@  Sync - key: %@  anchor: %@  validity: %@  count %lu\nApp Metadata - bundleId: %@  version: %@  clientIdentifier: %@  buildNumber: %@  syncSlots: %@\nChunk - pre: %@  post: %@  validity: %@  toAdd: %lu  toRemove: %lu", buf, 0xA2u);

    id v13 = v36;
    self = v30;

    a2 = v35;
    id v11 = v38;
  }
  if (self->_continueBlock)
  {
    v28 = +[NSAssertionHandler currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"ADSyncManager.m" lineNumber:140 description:@"Not expecting a sync chunk; already have a continue block"];
  }
  if (self->_currentSyncShouldCancel)
  {
    v13[2](v13, 0);
  }
  else
  {
    [(ADSyncManager *)self _setContinueBlock:v13];
    if (v40 != 0) {
      self->_currentSyncHasChanges = 1;
    }
    long long v26 = [v12 post];
    currentSyncGeneration = self->_currentSyncGeneration;
    self->_currentSyncGeneration = v26;

    [(ADSyncManagerDelegate *)self->_delegate syncManager:self chunkForSyncInfo:v11 chunkInfo:v12];
    [(ADSyncManagerDelegate *)self->_delegate syncManagerIsPausingSync:self];
  }
}

- (void)_setCurrentAnchorToNext
{
  id v3 = [(NSMutableArray *)self->_anchorsToSync lastObject];
  [(ADSyncManager *)self _setCurrentAnchor:v3];
  if (v3) {
    [(NSMutableArray *)self->_anchorsToSync removeLastObject];
  }
}

- (void)_finishSync
{
  id v3 = AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    long long v36 = "-[ADSyncManager _finishSync]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_syncedAnchors, "count"));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v27 = self;
  obj = self->_syncedAnchors;
  id v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v31 objects:v47 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v32;
    id v28 = v4;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v10 = [v9 key];
        if (v10)
        {
          [v4 addObject:v10];
          id v11 = (void *)AFSiriLogContextSync;
          if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
          {
            log = v11;
            id v12 = [v9 generation];
            id v13 = v6;
            uint64_t v14 = v7;
            id v15 = [v9 count];
            id v16 = [v9 validity];
            long long v17 = [v9 appMetaData];
            id v18 = [v17 syncSlots];
            *(_DWORD *)buf = 136316418;
            long long v36 = "-[ADSyncManager _finishSync]";
            __int16 v37 = 2112;
            long long v38 = v10;
            __int16 v39 = 2112;
            long long v40 = v12;
            __int16 v41 = 2048;
            id v42 = v15;
            uint64_t v7 = v14;
            id v6 = v13;
            __int16 v43 = 2112;
            __int16 v44 = v16;
            __int16 v45 = 2112;
            __int16 v46 = v18;
            _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s Anchor key: %@  generation: %@   count: %lu  validity: %@  syncSlots: %@", buf, 0x3Eu);

            id v4 = v28;
          }
        }
      }
      id v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v31 objects:v47 count:16];
    }
    while (v6);
  }

  delegate = v27->_delegate;
  v27->_delegate = 0;
  id v20 = delegate;

  currentAnchor = v27->_currentAnchor;
  v27->_currentAnchor = 0;

  anchorsToSync = v27->_anchorsToSync;
  v27->_anchorsToSync = 0;

  syncedAnchors = v27->_syncedAnchors;
  v27->_syncedAnchors = 0;

  currentSyncID = v27->_currentSyncID;
  v27->_currentSyncID = 0;

  currentSyncReasons = v27->_currentSyncReasons;
  v27->_currentSyncReasons = 0;

  timedoutServices = v27->_timedoutServices;
  v27->_timedoutServices = 0;

  v27->_forceResetOnNextSync = 0;
  [(ADSyncManagerDelegate *)v20 syncManager:v27 finishedSyncForKeys:v4 postNotification:1];

  [(ADSyncManager *)v27 _postSyncFinishedNotification];
}

- (void)_setAnchorsToSync:(id)a3
{
  if (self->_anchorsToSync != a3)
  {
    id v4 = (NSMutableArray *)[a3 mutableCopy];
    anchorsToSync = self->_anchorsToSync;
    self->_anchorsToSync = v4;
    _objc_release_x1(v4, anchorsToSync);
  }
}

- (id)_serviceManager
{
  return self->_serviceManager;
}

- (ADSyncManager)initWithServiceManager:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ADSyncManager;
  id v9 = [(ADSyncManager *)&v17 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceManager, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
    id v11 = v10->_queue;
    id v12 = +[ADQueueMonitor sharedMonitor];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100233050;
    v15[3] = &unk_10050C458;
    id v16 = v11;
    id v13 = v11;
    [v12 addQueue:v13 heartBeatInterval:v15 timeoutInterval:5.0 timeoutHandler:5.0];
  }
  return v10;
}

- (id)_preferredSyncKeyOrder
{
  if (AFIsHorseman())
  {
    CFStringRef v8 = @"com.apple.siri.client.state.DynamiteClientState";
    CFStringRef v9 = @"com.apple.media.entities";
    CFStringRef v10 = @"com.apple.homekit.name";
    v2 = &v8;
    uint64_t v3 = 3;
  }
  else
  {
    CFStringRef v6 = @"com.apple.contact.people";
    CFStringRef v7 = @"com.apple.homekit.name";
    v2 = &v6;
    uint64_t v3 = 2;
  }
  id v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v2, v3, v6, v7, v8, v9, v10);
  return v4;
}

- (BOOL)shouldSyncIntentPolicyForSyncKeys:(id)a3
{
  id v3 = a3;
  if ([v3 containsObject:@"com.apple.siri.appIntentSupportPolicyAndVocab"]) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = [v3 containsObject:@"com.apple.siri.appIntentSupportPolicyAndVocab.nano"];
  }

  return v4;
}

- (BOOL)shouldSyncThirdPartyUserVocabularyForSyncKeys:(id)a3
{
  return [a3 containsObject:@"com.apple.siri.vocabularyupdates"];
}

- (BOOL)shouldIncludeAllKnownSiriKitAnchorsForReason:(id)a3
{
  return [a3 isEqualToString:@"daily_sync"];
}

- (BOOL)shouldSyncEverythingForReason:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", @"assistant_enabled", @"daily_sync", @"requested_by_assistantd", @"com.apple.assistant.sync_data_changed", @"Safety net", @"siri_locale_change", 0);
  unsigned __int8 v5 = [v4 containsObject:v3];

  return v5;
}

- (id)syncKeysForReason:(id)a3
{
  id v4 = sub_1002E6F70(a3);
  if (![v4 count])
  {
    unsigned __int8 v5 = [(ADSyncManager *)self _serviceManager];
    uint64_t v6 = [v5 allSyncAnchorKeys];

    id v4 = (void *)v6;
  }
  return v4;
}

@end