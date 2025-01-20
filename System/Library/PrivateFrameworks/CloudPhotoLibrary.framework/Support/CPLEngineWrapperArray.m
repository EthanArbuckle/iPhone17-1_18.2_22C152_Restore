@interface CPLEngineWrapperArray
+ (double)timeToWaitForRegisteredWrapper;
+ (void)setTimeToWaitForRegisteredWrapper:(double)a3;
- (BOOL)_autoCloseOneWrapper;
- (BOOL)_autoCloseWrapper:(id)a3;
- (BOOL)_canAutoCloseWrapper:(id)a3;
- (BOOL)_canReallyOpenWrapper:(id)a3 error:(id *)a4;
- (BOOL)_shouldAutoOpenWrapper:(id)a3 error:(id *)a4;
- (BOOL)isWrapperOpened:(id)a3;
- (CPLConfigurationDictionary)mostRecentConfigurationDictionary;
- (CPLConfigurationDictionary)oldestConfigurationDictionary;
- (CPLEngineParametersStorage)parametersStorage;
- (CPLEngineWrapperArray)initWithParametersStorage:(id)a3 queue:(id)a4;
- (CPLEngineWrapperArrayDelegate)delegate;
- (NSArray)registeredLibraryIdentifiers;
- (NSArray)wrapperStatuses;
- (OS_dispatch_queue)queue;
- (id)_instantiateWrapperWithParameters:(id)a3 createIfNecessary:(BOOL)a4 error:(id *)a5;
- (id)_loadWrapperWithIdentifier:(id)a3 error:(id *)a4;
- (id)_wrappersLibraryIdentifierEnumerator;
- (id)openedWrapperWithLibraryIdentifier:(id)a3;
- (id)registeredWrapperCreateIfNecessaryWithParameters:(id)a3 error:(id *)a4;
- (id)registeredWrapperWithLibraryIdentifier:(id)a3 error:(id *)a4;
- (unint64_t)_countOfUltimatelyOpenedWrappers;
- (unint64_t)count;
- (unint64_t)unopenedCount;
- (void)_addEngineWrapperOpenObserver:(id)a3 withIdentifier:(id)a4;
- (void)_callStopAllBlocks;
- (void)_dropWrapper:(id)a3;
- (void)_executeMaintenanceWithEnumerator:(id)a3 progress:(id)a4 completionHandler:(id)a5;
- (void)_forceBackupWithActivity:(id)a3 forceClientPush:(BOOL)a4 enumerator:(id)a5 progress:(id)a6 completionHandler:(id)a7;
- (void)_registerOpenError:(id)a3 forWrapper:(id)a4;
- (void)_removeEngineWrapperOpenObserverWithIdentifier:(id)a3;
- (void)cancelConfigurationDictionariesRefresh;
- (void)configurationFetcher:(id)a3 didUpdateConfigurationDictionary:(id)a4 configurationHasChanged:(BOOL)a5;
- (void)emergencyStop;
- (void)enumerateOpenedWrappersWithBlock:(id)a3;
- (void)enumerateWrappersWithBlock:(id)a3;
- (void)executeMaintenanceWithCompletionHandler:(id)a3;
- (void)executePeriodicUploadOfComputeStatesWithCompletionHandler:(id)a3;
- (void)forceBackupWithActivity:(id)a3 forceClientPush:(BOOL)a4 completionHandler:(id)a5;
- (void)loadRegisteredWrappers;
- (void)refreshAllConfigurationDictionaries;
- (void)refreshAllConfigurationDictionariesWithCompletionHandler:(id)a3;
- (void)requestRegisteredWrapperWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)stopAllWithCompletionHandler:(id)a3;
- (void)wipeEnginesIfNecessary;
- (void)wrapper:(id)a3 getStatusDictionaryWithCompletionHandler:(id)a4;
- (void)wrapper:(id)a3 getStatusWithCompletionHandler:(id)a4;
- (void)wrapper:(id)a3 libraryDidOpenWithError:(id)a4;
- (void)wrapperDidCompleteInitialSyncOfMainScope:(id)a3;
- (void)wrapperEmergencyExit:(id)a3;
- (void)wrapperLibraryDidClose:(id)a3;
- (void)wrapperNeedsInitialDownloadOfMainScope:(id)a3;
- (void)wrapperShouldBeDropped:(id)a3;
@end

@implementation CPLEngineWrapperArray

+ (double)timeToWaitForRegisteredWrapper
{
  return *(double *)&qword_1002C8160;
}

+ (void)setTimeToWaitForRegisteredWrapper:(double)a3
{
  if (*(double *)&qword_1002C8160 == 0.0) {
    a3 = 60.0;
  }
  qword_1002C8160 = *(void *)&a3;
}

- (CPLEngineWrapperArray)initWithParametersStorage:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CPLEngineWrapperArray;
  v9 = [(CPLEngineWrapperArray *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parametersStorage, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    wrappers = v10->_wrappers;
    v10->_wrappers = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    unopenedWrappers = v10->_unopenedWrappers;
    v10->_unopenedWrappers = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    autoClosingWrappers = v10->_autoClosingWrappers;
    v10->_autoClosingWrappers = v15;
  }
  return v10;
}

- (void)loadRegisteredWrappers
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = [(CPLEngineParametersStorage *)self->_parametersStorage allDefinedParameters];
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v15;
    *(void *)&long long v5 = 138412290;
    long long v13 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "libraryIdentifier", v13);
        v10 = [(CPLEngineWrapperArray *)self _loadWrapperWithIdentifier:v9 error:0];

        if (v10) {
          BOOL v11 = _CPLSilentLogging == 0;
        }
        else {
          BOOL v11 = 0;
        }
        if (v11)
        {
          v12 = sub_10001337C();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v13;
            v19 = v10;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Found %@ at launch", buf, 0xCu);
          }
        }
      }
      id v6 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v6);
  }
}

- (BOOL)_shouldAutoOpenWrapper:(id)a3 error:(id *)a4
{
  id v6 = [a3 libraryIdentifier];
  unsigned __int8 v7 = [v6 isEqualToString:CPLLibraryIdentifierSystemLibrary];

  if (v7) {
    return 1;
  }
  v9 = +[NSUserDefaults standardUserDefaults];
  unsigned int v10 = [v9 BOOLForKey:@"CPLDontAutoOpenAppLibraries"];

  if (v10)
  {
    if (a4)
    {
      BOOL v11 = +[CPLErrors libraryDoesNotAutoOpenError];
LABEL_9:
      id v12 = v11;
      BOOL result = 0;
      *a4 = v12;
      return result;
    }
  }
  else
  {
    if ((unint64_t)[(NSMutableDictionary *)self->_wrappers count] < 0xA) {
      return 1;
    }
    if (a4)
    {
      BOOL v11 = +[CPLErrors tooManyOpenedEnginesError];
      goto LABEL_9;
    }
  }
  return 0;
}

- (BOOL)_canAutoCloseWrapper:(id)a3
{
  v3 = [a3 libraryIdentifier];
  char v4 = [v3 isEqualToString:CPLLibraryIdentifierSystemLibrary] ^ 1;

  return v4;
}

- (BOOL)_autoCloseWrapper:(id)a3
{
  id v4 = a3;
  long long v5 = [v4 libraryIdentifier];
  id v6 = [(NSMutableDictionary *)self->_autoClosingWrappers objectForKeyedSubscript:v5];
  if (v6)
  {
  }
  else if ([(CPLEngineWrapperArray *)self _canAutoCloseWrapper:v4])
  {
    unsigned __int8 v7 = [(CPLEngineWrapperArray *)self delegate];
    id v8 = [v7 wrapperArray:self countOfClientsForWrapper:v4];

    if (!v8)
    {
      [(NSMutableDictionary *)self->_autoClosingWrappers setObject:v4 forKeyedSubscript:v5];
      [v4 stop];
      BOOL v9 = 1;
      goto LABEL_6;
    }
  }
  BOOL v9 = 0;
LABEL_6:

  return v9;
}

- (BOOL)_autoCloseOneWrapper
{
  uint64_t v6 = 0;
  unsigned __int8 v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  wrappers = self->_wrappers;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100013684;
  v5[3] = &unk_100276718;
  v5[4] = self;
  v5[5] = &v6;
  [(NSMutableDictionary *)wrappers enumerateKeysAndObjectsUsingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_canReallyOpenWrapper:(id)a3 error:(id *)a4
{
  uint64_t v6 = [a3 libraryIdentifier];
  unsigned __int8 v7 = [v6 isEqualToString:CPLLibraryIdentifierSystemLibrary];

  if (v7) {
    return 1;
  }
  if ((unint64_t)[(NSMutableDictionary *)self->_wrappers count] >= 0xF)
  {
    if (!a4) {
      return 0;
    }
    goto LABEL_9;
  }
  char v9 = (char *)[(NSMutableDictionary *)self->_wrappers count];
  if (v9 < (char *)[(NSMutableDictionary *)self->_autoClosingWrappers count] + 10) {
    return 1;
  }
  BOOL result = [(CPLEngineWrapperArray *)self _autoCloseOneWrapper];
  if (a4 && !result)
  {
LABEL_9:
    id v10 = +[CPLErrors tooManyOpenedEnginesError];
    BOOL result = 0;
    *a4 = v10;
  }
  return result;
}

- (id)_loadWrapperWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = [(CPLEngineParametersStorage *)self->_parametersStorage parametersForLibraryIdentifier:v6];
  if (v7)
  {
    id v13 = 0;
    uint64_t v8 = [(CPLEngineWrapperArray *)self _instantiateWrapperWithParameters:v7 createIfNecessary:0 error:&v13];
    id v9 = v13;
    if (!v8)
    {
      if (!_CPLSilentLogging)
      {
        id v10 = sub_10001337C();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v15 = v6;
          __int16 v16 = 2112;
          id v17 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@ can't be opened: %@\nResetting stored parameters and will just wait for a client to connect", buf, 0x16u);
        }
      }
      if (a4) {
        *a4 = v9;
      }
      [(CPLEngineParametersStorage *)self->_parametersStorage removeParametersWithLibraryIdentifier:v6 error:0];
    }
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      BOOL v11 = sub_10001337C();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        id v15 = v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}@ has not been configured yet", buf, 0xCu);
      }
    }
    if (a4)
    {
      +[CPLErrors cplErrorWithCode:2006, @"%@ has not been configured yet", v6 description];
      uint64_t v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v8 = 0;
    }
  }

  return v8;
}

- (id)_instantiateWrapperWithParameters:(id)a3 createIfNecessary:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    queue = self->_queue;
    id v45 = 0;
    id v12 = [WeakRetained wrapperArray:self engineWrapperWithParameters:v8 createIfNecessary:v6 queue:queue error:&v45];
    id v13 = v45;
    if (v12)
    {
      if (!v6)
      {
        [v12 setDelegate:self];
        id v43 = 0;
        int v20 = [(CPLEngineWrapperArray *)self _shouldAutoOpenWrapper:v12 error:&v43];
        id v17 = v43;
        if ((v20 & 1) == 0)
        {
          if (!_CPLSilentLogging)
          {
            v27 = sub_10001337C();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              v28 = [v17 localizedDescription];
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v12;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v28;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%@ will not open automatically: %@", buf, 0x16u);
            }
          }
          v29 = self->_queue;
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          v40[2] = sub_100013F08;
          v40[3] = &unk_1002760B0;
          v40[4] = self;
          id v41 = v12;
          id v17 = v17;
          id v42 = v17;
          v30 = v40;
          *(void *)buf = _NSConcreteStackBlock;
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = sub_100018990;
          v47 = &unk_100275DF8;
          id v48 = v30;
          v31 = v29;
          dispatch_block_t v32 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
          dispatch_async(v31, v32);

          goto LABEL_32;
        }
LABEL_16:
        id v39 = 0;
        unsigned __int8 v21 = [v12 startWithError:&v39];
        id v22 = v39;
        v23 = v22;
        if ((v21 & 1) == 0)
        {
          if (!_CPLSilentLogging)
          {
            v37 = sub_10001337C();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v12;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v23;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Unable to start %@: %@", buf, 0x16u);
            }
          }
          if (a5) {
            *a5 = v23;
          }

          id v18 = 0;
          goto LABEL_40;
        }

LABEL_32:
        wrappers = self->_wrappers;
        v34 = [v8 libraryIdentifier];
        [(NSMutableDictionary *)wrappers setObject:v12 forKeyedSubscript:v34];

        unopenedWrappers = self->_unopenedWrappers;
        v36 = [v8 libraryIdentifier];
        [(NSMutableDictionary *)unopenedWrappers setObject:v12 forKeyedSubscript:v36];

        id v18 = v12;
LABEL_40:

        goto LABEL_41;
      }
      id v44 = 0;
      unsigned __int8 v14 = [(CPLEngineWrapperArray *)self _canReallyOpenWrapper:v12 error:&v44];
      id v15 = v44;
      __int16 v16 = v15;
      if (v14)
      {

        [v12 setDelegate:self];
        id v17 = 0;
        goto LABEL_16;
      }
      if (!_CPLSilentLogging)
      {
        v24 = sub_10001337C();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = [v16 localizedDescription];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v12;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v25;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Can't open %@: %@", buf, 0x16u);
        }
      }
      if (a5) {
        *a5 = v16;
      }
      id v26 = objc_loadWeakRetained((id *)&self->_delegate);
      [v26 wrapperArray:self wrapperShouldBeDropped:v12];
    }
    else
    {
      if (v6 && !_CPLSilentLogging)
      {
        v19 = sub_10001337C();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v8;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v13;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Can't instantiate wrapper for %@: %@", buf, 0x16u);
        }
      }
      if (a5)
      {
        id v18 = 0;
        *a5 = v13;
LABEL_41:

        goto LABEL_42;
      }
    }
    id v18 = 0;
    goto LABEL_41;
  }
  if (a5)
  {
    +[CPLErrors incorrectMachineStateErrorWithReason:@"missing delegate"];
    id v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v18 = 0;
  }
LABEL_42:

  return v18;
}

- (void)_callStopAllBlocks
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  char v3 = self->_stopAllBlocks;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      unsigned __int8 v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * (void)v7) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * (void)v7));
        unsigned __int8 v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  stopAllBlocks = self->_stopAllBlocks;
  self->_stopAllBlocks = 0;
}

- (void)_addEngineWrapperOpenObserver:(id)a3 withIdentifier:(id)a4
{
  id v12 = a3;
  queue = self->_queue;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  if (!self->_openObservers)
  {
    id v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    openObservers = self->_openObservers;
    self->_openObservers = v8;
  }
  id v10 = [v12 copy];
  id v11 = objc_retainBlock(v10);
  [(NSMutableDictionary *)self->_openObservers setObject:v11 forKeyedSubscript:v7];
}

- (void)_removeEngineWrapperOpenObserverWithIdentifier:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  [(NSMutableDictionary *)self->_openObservers removeObjectForKey:v5];
}

- (void)stopAllWithCompletionHandler:(id)a3
{
  stopAllBlocks = self->_stopAllBlocks;
  if (stopAllBlocks)
  {
    id v4 = a3;
    id v14 = [v4 copy];

    id v5 = objc_retainBlock(v14);
    [(NSMutableArray *)stopAllBlocks addObject:v5];
  }
  else
  {
    id v7 = a3;
    id v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    long long v9 = self->_stopAllBlocks;
    self->_stopAllBlocks = v8;

    id v10 = self->_stopAllBlocks;
    id v11 = [v7 copy];

    id v12 = objc_retainBlock(v11);
    [(NSMutableArray *)v10 addObject:v12];

    if ([(NSMutableDictionary *)self->_wrappers count])
    {
      wrappers = self->_wrappers;
      [(NSMutableDictionary *)wrappers enumerateKeysAndObjectsUsingBlock:&stru_100276758];
    }
    else
    {
      [(CPLEngineWrapperArray *)self _callStopAllBlocks];
    }
  }
}

- (void)emergencyStop
{
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableDictionary *)self->_wrappers count];
}

- (unint64_t)_countOfUltimatelyOpenedWrappers
{
  id v4 = [(NSMutableDictionary *)self->_wrappers count];
  id v5 = [(NSMutableDictionary *)self->_autoClosingWrappers count];
  BOOL v6 = v4 >= v5;
  unint64_t result = v4 - v5;
  if (!v6) {
    sub_1001C53BC((uint64_t)a2, (uint64_t)self);
  }
  return result;
}

- (unint64_t)unopenedCount
{
  return (unint64_t)[(NSMutableDictionary *)self->_unopenedWrappers count];
}

- (NSArray)registeredLibraryIdentifiers
{
  v2 = [(NSMutableDictionary *)self->_wrappers allKeys];
  char v3 = [v2 sortedArrayUsingComparator:&stru_1002767B8];

  return (NSArray *)v3;
}

- (id)registeredWrapperCreateIfNecessaryWithParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 libraryIdentifier];
  id v8 = [(NSMutableDictionary *)self->_previousOpenErrors objectForKeyedSubscript:v7];
  long long v9 = v8;
  if (v8 && ([v8 shouldTryReopening] & 1) == 0)
  {
    if (a4)
    {
      [v9 openError];
      id v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
    goto LABEL_14;
  }
  id v10 = [(NSMutableDictionary *)self->_wrappers objectForKeyedSubscript:v7];
  if (v10)
  {
    id v11 = v10;
    id v12 = [v10 parameters];
    unsigned __int8 v13 = [v12 matchesParameters:v6];

    if (v13) {
      goto LABEL_32;
    }
    if (!_CPLSilentLogging)
    {
      id v14 = sub_10001337C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v30 = v6;
        __int16 v31 = 2112;
        id v32 = v11;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Trying to open engine %@ but it mismatches with parameters for %@", buf, 0x16u);
      }
    }
    if (a4)
    {
      id v15 = [v6 libraryIdentifier];
      *a4 = +[CPLErrors cplErrorWithCode:2005, @"Incorrect parameters for %@", v15 description];
    }
LABEL_14:
    id v11 = 0;
    goto LABEL_32;
  }
  __int16 v16 = [(CPLEngineWrapperArray *)self mostRecentConfigurationDictionary];
  id v28 = 0;
  id v11 = [(CPLEngineWrapperArray *)self _instantiateWrapperWithParameters:v6 createIfNecessary:1 error:&v28];
  id v17 = v28;
  id v18 = v17;
  if (v11)
  {
    if (!_CPLSilentLogging)
    {
      v19 = sub_10001337C();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v30 = v11;
        __int16 v31 = 2112;
        id v32 = v6;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Created %@ for %@", buf, 0x16u);
      }
    }
    parametersStorage = self->_parametersStorage;
    id v27 = 0;
    unsigned __int8 v21 = [(CPLEngineParametersStorage *)parametersStorage saveParameters:v6 error:&v27];
    id v22 = v27;
    if ((v21 & 1) == 0 && !_CPLSilentLogging)
    {
      v23 = sub_10001337C();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v30 = v6;
        __int16 v31 = 2112;
        id v32 = v22;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to store %@ for automatic start: %@", buf, 0x16u);
      }
    }
    if (v16)
    {
      v24 = [v11 engine];
      v25 = [v24 configuration];
      [v25 updateConfigurationDictionary:v16];
    }
    else
    {
      [(CPLEngineWrapperArray *)self refreshAllConfigurationDictionaries];
    }
  }
  else if (a4)
  {
    *a4 = v17;
  }

LABEL_32:
  return v11;
}

- (id)registeredWrapperWithLibraryIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)self->_previousOpenErrors objectForKeyedSubscript:v6];
  id v8 = v7;
  if (!v7)
  {
    id v10 = [(NSMutableDictionary *)self->_wrappers objectForKeyedSubscript:v6];
    if (v10) {
      goto LABEL_11;
    }
    id v11 = +[CPLErrors cplErrorWithCode:2006, @"%@ has not been configured yet", v6 description];
    long long v9 = v11;
    if (a4) {
      *a4 = v11;
    }
    goto LABEL_7;
  }
  if ([v7 shouldTryReopeningWithoutLibrary])
  {
    long long v9 = [v8 parameters];
    id v10 = [(CPLEngineWrapperArray *)self registeredWrapperCreateIfNecessaryWithParameters:v9 error:a4];
LABEL_7:

    goto LABEL_11;
  }
  if (a4)
  {
    [v8 openError];
    id v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }
LABEL_11:

  return v10;
}

- (id)openedWrapperWithLibraryIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_wrappers objectForKeyedSubscript:v4];
  if (v5)
  {
    id v6 = [(NSMutableDictionary *)self->_unopenedWrappers objectForKeyedSubscript:v4];

    if (v6)
    {

      id v5 = 0;
    }
  }

  return v5;
}

- (void)enumerateWrappersWithBlock:(id)a3
{
  id v4 = (void (**)(id, void *, unsigned char *))a3;
  unsigned __int8 v16 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(CPLEngineWrapperArray *)self registeredLibraryIdentifiers];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = [(NSMutableDictionary *)self->_wrappers objectForKeyedSubscript:*(void *)(*((void *)&v12 + 1) + 8 * v9)];
      v4[2](v4, v10, &v16);
      int v11 = v16;

      if (v11) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)enumerateOpenedWrappersWithBlock:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100014C60;
  v4[3] = &unk_1002767E0;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(CPLEngineWrapperArray *)v5 enumerateWrappersWithBlock:v4];
}

- (BOOL)isWrapperOpened:(id)a3
{
  unopenedWrappers = self->_unopenedWrappers;
  id v4 = [a3 libraryIdentifier];
  id v5 = [(NSMutableDictionary *)unopenedWrappers objectForKeyedSubscript:v4];
  LOBYTE(unopenedWrappers) = v5 == 0;

  return (char)unopenedWrappers;
}

- (id)_wrappersLibraryIdentifierEnumerator
{
  v2 = [(CPLEngineWrapperArray *)self registeredLibraryIdentifiers];
  id v3 = [v2 objectEnumerator];

  return v3;
}

- (void)_forceBackupWithActivity:(id)a3 forceClientPush:(BOOL)a4 enumerator:(id)a5 progress:(id)a6 completionHandler:(id)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  unsigned __int8 v16 = [v13 nextObject];
  if (v16)
  {
    id v17 = [(NSMutableDictionary *)self->_wrappers objectForKeyedSubscript:v16];
    if (v17)
    {
      id v18 = [(NSMutableDictionary *)self->_unopenedWrappers objectForKeyedSubscript:v16];

      if (!v18)
      {
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_100015058;
        v21[3] = &unk_100276858;
        id v22 = v17;
        BOOL v28 = v10;
        id v23 = v12;
        v24 = self;
        id v27 = v15;
        id v25 = v13;
        id v26 = v14;
        [v26 performAsCurrentWithPendingUnitCount:1 usingBlock:v21];

        goto LABEL_16;
      }
      if (!_CPLSilentLogging)
      {
        v19 = sub_10001337C();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v30 = v17;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Requested forced backup for %@ can't be done as it is not fully opened", buf, 0xCu);
        }
      }
      objc_msgSend(v14, "setCompletedUnitCount:", (char *)objc_msgSend(v14, "completedUnitCount") + 1);
    }
    [(CPLEngineWrapperArray *)self _forceBackupWithActivity:v12 forceClientPush:v10 enumerator:v13 progress:v14 completionHandler:v15];
LABEL_16:

    goto LABEL_17;
  }
  if (!_CPLSilentLogging)
  {
    int v20 = sub_10001337C();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Finished all necessary backup activities successfully", buf, 2u);
    }
  }
  (*((void (**)(id, void))v15 + 2))(v15, 0);
  objc_msgSend(v14, "setCompletedUnitCount:", objc_msgSend(v14, "totalUnitCount"));
LABEL_17:
}

- (void)forceBackupWithActivity:(id)a3 forceClientPush:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void))a5;
  if ([(NSMutableDictionary *)self->_wrappers count])
  {
    BOOL v10 = +[NSProgress progressWithTotalUnitCount:[(NSMutableDictionary *)self->_wrappers count]];
    int v11 = [(CPLEngineWrapperArray *)self _wrappersLibraryIdentifierEnumerator];
    [(CPLEngineWrapperArray *)self _forceBackupWithActivity:v8 forceClientPush:v6 enumerator:v11 progress:v10 completionHandler:v9];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v12 = sub_10001337C();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No engine to backup - finishing backup activity immediately", v13, 2u);
      }
    }
    v9[2](v9, 0);
  }
}

- (void)_executeMaintenanceWithEnumerator:(id)a3 progress:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (void (**)(id, void *))a5;
  if ([v9 isCancelled])
  {
    if (!_CPLSilentLogging)
    {
      int v11 = sub_10001337C();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Requested maintenance has been cancelled", buf, 2u);
      }
    }
    id v12 = +[CPLErrors operationCancelledError];
    v10[2](v10, v12);
    goto LABEL_23;
  }
  id v12 = [v8 nextObject];
  if (v12)
  {
    id v13 = [(NSMutableDictionary *)self->_wrappers objectForKeyedSubscript:v12];
    if (v13)
    {
      id v14 = [(NSMutableDictionary *)self->_unopenedWrappers objectForKeyedSubscript:v12];

      if (!v14)
      {
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_100015874;
        v17[3] = &unk_100276428;
        id v18 = v13;
        v19 = self;
        id v20 = v8;
        id v21 = v9;
        id v22 = v10;
        [v21 performAsCurrentWithPendingUnitCount:1 usingBlock:v17];

        goto LABEL_22;
      }
      if (!_CPLSilentLogging)
      {
        id v15 = sub_10001337C();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v13;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Requested maintenance for %@ can't be done as it is not fully opened", buf, 0xCu);
        }
      }
    }
    objc_msgSend(v9, "setCompletedUnitCount:", (char *)objc_msgSend(v9, "completedUnitCount") + 1);
    [(CPLEngineWrapperArray *)self _executeMaintenanceWithEnumerator:v8 progress:v9 completionHandler:v10];
LABEL_22:

    goto LABEL_23;
  }
  if (!_CPLSilentLogging)
  {
    unsigned __int8 v16 = sub_10001337C();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Finished maintenance for all engines successfully", buf, 2u);
    }
  }
  v10[2](v10, 0);
LABEL_23:
}

- (void)executeMaintenanceWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100015D38;
  v12[3] = &unk_100276880;
  v12[4] = self;
  +[CPLSimpleUpgradeHistory cleanupUnusedUpgradeHistoriesWithUsedBlock:v12];
  if ([(NSMutableDictionary *)self->_wrappers count])
  {
    id v5 = [(CPLEngineWrapperArray *)self _wrappersLibraryIdentifierEnumerator];
    +[NSProgress progressWithTotalUnitCount:[(NSMutableDictionary *)self->_wrappers count]];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100015DA4;
    v9[3] = &unk_1002766A8;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = v4;
    id v6 = v10;
    [(CPLEngineWrapperArray *)self _executeMaintenanceWithEnumerator:v5 progress:v6 completionHandler:v9];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v7 = sub_10001337C();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No engine to maintain - finishing system task immediately", v8, 2u);
      }
    }
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)executePeriodicUploadOfComputeStatesWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = [(CPLEngineWrapperArray *)self openedWrapperWithLibraryIdentifier:CPLLibraryIdentifierSystemLibrary];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 engine];
    id v8 = [v7 store];

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100015F24;
    v11[3] = &unk_100276590;
    id v12 = v8;
    id v13 = v6;
    id v9 = v8;
    id v10 = [v9 performReadTransactionWithBlock:v11];
  }
  v4[2](v4, 0);
}

- (void)requestRegisteredWrapperWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v9 = self->_queue;
  id v10 = +[NSProgress progressWithTotalUnitCount:1];
  id v11 = +[NSUUID UUID];
  v76[0] = 0;
  v76[1] = v76;
  v76[2] = 0x3032000000;
  v76[3] = sub_1000166A0;
  v76[4] = sub_1000166B0;
  id v77 = 0;
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_1000166B8;
  v73[3] = &unk_1002768A8;
  id v12 = v9;
  v74 = v12;
  v75 = v76;
  id v13 = objc_retainBlock(v73);
  v71[0] = 0;
  v71[1] = v71;
  v71[2] = 0x2020000000;
  char v72 = 0;
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_100016720;
  v63[3] = &unk_1002768D0;
  id v14 = v12;
  v64 = v14;
  v70 = v71;
  id v15 = v13;
  id v68 = v15;
  id v16 = v8;
  id v69 = v16;
  id v17 = v10;
  id v65 = v17;
  v66 = self;
  id v40 = v11;
  id v67 = v40;
  id v18 = objc_retainBlock(v63);
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_1000167EC;
  v56[3] = &unk_100276920;
  v19 = v14;
  v57 = v19;
  v61 = v71;
  id v39 = v15;
  id v59 = v39;
  v62 = v76;
  id v20 = v7;
  id v58 = v20;
  id v21 = v18;
  id v60 = v21;
  id v22 = objc_retainBlock(v56);
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_100016A64;
  v52[3] = &unk_100276970;
  id v41 = v19;
  v53 = v41;
  SEL v55 = a2;
  id v23 = v21;
  id v54 = v23;
  [v17 setCancellationHandler:v52];
  v24 = [(NSMutableDictionary *)self->_previousOpenErrors objectForKeyedSubscript:v20];
  if (v24
    && ([(NSMutableDictionary *)self->_wrappers objectForKeyedSubscript:v20],
        id v25 = objc_claimAutoreleasedReturnValue(),
        v25,
        !v25))
  {
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_100016C74;
    v49[3] = &unk_100276210;
    v51 = v23;
    id v50 = v24;
    id v32 = v49;
    block = _NSConcreteStackBlock;
    uint64_t v79 = 3221225472;
    v80 = sub_100018990;
    v81 = &unk_100275DF8;
    id v82 = v32;
    v33 = v41;
    dispatch_block_t v34 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v33, v34);

    id v26 = v51;
  }
  else
  {
    id v38 = v16;
    id v26 = [(NSMutableDictionary *)self->_wrappers objectForKeyedSubscript:v20];
    if (v26
      && ([(NSMutableDictionary *)self->_unopenedWrappers objectForKeyedSubscript:v20],
          id v27 = objc_claimAutoreleasedReturnValue(),
          v27,
          !v27))
    {
      BOOL v28 = v22;
      id v29 = v17;
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_100016CD4;
      v46[3] = &unk_100276210;
      id v30 = (id *)&v48;
      id v48 = v23;
      __int16 v31 = &v47;
      id v47 = v26;
      v35 = v46;
      block = _NSConcreteStackBlock;
      uint64_t v79 = 3221225472;
      v80 = sub_100018990;
      v81 = &unk_100275DF8;
      id v82 = v35;
      v36 = v41;
      dispatch_block_t v37 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
      dispatch_async(v36, v37);
    }
    else
    {
      ((void (*)(void *))v22[2])(v22);
      CPLRequestClient();
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_100016CEC;
      v42[3] = &unk_100276998;
      id v43 = v41;
      id v44 = v20;
      id v45 = v23;
      [(CPLEngineWrapperArray *)self _addEngineWrapperOpenObserver:v42 withIdentifier:v40];
      BOOL v28 = v22;
      id v29 = v17;
      id v30 = (id *)&v43;
      __int16 v31 = &v44;
    }
    id v16 = v38;
    id v17 = v29;
    id v22 = v28;
  }

  _Block_object_dispose(v71, 8);
  _Block_object_dispose(v76, 8);
}

- (void)wipeEnginesIfNecessary
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = objc_alloc_init((Class)NSMutableArray);
  previousOpenErrors = self->_previousOpenErrors;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100016E44;
  v6[3] = &unk_1002769C0;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)previousOpenErrors enumerateKeysAndObjectsUsingBlock:v6];
}

- (void)_dropWrapper:(id)a3
{
  id v4 = [a3 libraryIdentifier];
  [(NSMutableDictionary *)self->_unopenedWrappers removeObjectForKey:v4];
  [(NSMutableDictionary *)self->_wrappers removeObjectForKey:v4];
  parametersStorage = self->_parametersStorage;
  id v9 = 0;
  unsigned __int8 v6 = [(CPLEngineParametersStorage *)parametersStorage removeParametersWithLibraryIdentifier:v4 error:&v9];
  id v7 = v9;
  if ((v6 & 1) == 0 && !_CPLSilentLogging)
  {
    id v8 = sub_10001337C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v11 = v4;
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to remove parameters for %{public}@: %@", buf, 0x16u);
    }
  }
}

- (NSArray)wrapperStatuses
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000171EC;
  v14[3] = &unk_100275F38;
  id v15 = self;
  id v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[CPLEngineWrapperArray count](self, "count"));
  id v16 = v3;
  [(CPLEngineWrapperArray *)v15 enumerateWrappersWithBlock:v14];
  previousOpenErrors = self->_previousOpenErrors;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_1000172CC;
  id v11 = &unk_1002769C0;
  __int16 v12 = self;
  id v13 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)previousOpenErrors enumerateKeysAndObjectsUsingBlock:&v8];
  id v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);

  return (NSArray *)v6;
}

- (CPLConfigurationDictionary)mostRecentConfigurationDictionary
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_1000166A0;
  uint64_t v9 = sub_1000166B0;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000174A0;
  v4[3] = &unk_1002769E8;
  void v4[4] = &v5;
  [(CPLEngineWrapperArray *)self enumerateWrappersWithBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (CPLConfigurationDictionary *)v2;
}

- (CPLConfigurationDictionary)oldestConfigurationDictionary
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_1000166A0;
  uint64_t v9 = sub_1000166B0;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100017680;
  v4[3] = &unk_1002769E8;
  void v4[4] = &v5;
  [(CPLEngineWrapperArray *)self enumerateWrappersWithBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (CPLConfigurationDictionary *)v2;
}

- (void)refreshAllConfigurationDictionaries
{
}

- (void)refreshAllConfigurationDictionariesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = WeakRetained;
  if (WeakRetained
    && ([WeakRetained allowsConfigurationRefreshForWrapperArray:self] & 1) != 0)
  {
    uint64_t v7 = [(CPLEngineWrapperArray *)self oldestConfigurationDictionary];
    id v8 = v7;
    if (v7
      && (([v7 isStale] & 1) != 0
       || (+[NSUserDefaults standardUserDefaults],
           uint64_t v9 = objc_claimAutoreleasedReturnValue(),
           unsigned __int8 v10 = [v9 BOOLForKey:@"CPLAlwaysFetchConfiguration"],
           v9,
           (v10 & 1) != 0)))
    {
      configurationFetcher = self->_configurationFetcher;
      if (!configurationFetcher)
      {
        id v12 = objc_alloc((Class)CPLConfigurationFetcher);
        id v13 = _CPLConfigurationDefaultURL();
        id v14 = (CPLConfigurationFetcher *)[v12 initWithConfigurationURL:v13 delegate:self queue:self->_queue];
        id v15 = self->_configurationFetcher;
        self->_configurationFetcher = v14;

        configurationFetcher = self->_configurationFetcher;
      }
      [(CPLConfigurationFetcher *)configurationFetcher fetchConfigurationDictionary:v8 completionHandler:v4];
    }
    else if (v4)
    {
      queue = self->_queue;
      block = _NSConcreteStackBlock;
      uint64_t v22 = 3221225472;
      id v23 = sub_100018990;
      v24 = &unk_100275DF8;
      id v25 = v4;
      v19 = queue;
      dispatch_block_t v20 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
      dispatch_async(v19, v20);
    }
    goto LABEL_11;
  }
  if (v4)
  {
    id v16 = self->_queue;
    block = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    id v23 = sub_100018990;
    v24 = &unk_100275DF8;
    id v25 = v4;
    id v8 = v16;
    dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v8, v17);

LABEL_11:
  }
}

- (void)cancelConfigurationDictionariesRefresh
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(CPLConfigurationFetcher *)self->_configurationFetcher invalidate];
  configurationFetcher = self->_configurationFetcher;
  self->_configurationFetcher = 0;
}

- (void)configurationFetcher:(id)a3 didUpdateConfigurationDictionary:(id)a4 configurationHasChanged:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  queue = self->_queue;
  unsigned __int8 v10 = (CPLConfigurationFetcher *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  configurationFetcher = self->_configurationFetcher;

  if (configurationFetcher == v10)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100017ADC;
    v14[3] = &unk_100276A10;
    id v15 = v8;
    [(CPLEngineWrapperArray *)self enumerateWrappersWithBlock:v14];
    if (v5)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, _CPLConfigurationDidChangeNotification, 0, 0, 0);
    }
    id v13 = self->_configurationFetcher;
    self->_configurationFetcher = 0;
  }
}

- (void)wrapperEmergencyExit:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!_CPLSilentLogging)
  {
    BOOL v5 = sub_10001337C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is requesting an emergency exit", (uint8_t *)&v9, 0xCu);
    }
  }
  [(NSMutableDictionary *)self->_wrappers enumerateKeysAndObjectsUsingBlock:&stru_100276A30];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained)
  {
    if (!_CPLSilentLogging)
    {
      id v8 = sub_10001337C();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Closing immediately", (uint8_t *)&v9, 2u);
      }
    }
    exit(0);
  }
  uint64_t v7 = WeakRetained;
  [WeakRetained emergencyExitForWrapperArray:self];
}

- (void)_registerOpenError:(id)a3 forWrapper:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  if (!self->_previousOpenErrors)
  {
    uint64_t v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    previousOpenErrors = self->_previousOpenErrors;
    self->_previousOpenErrors = v7;
  }
  int v9 = [_CPLEngineWrapperOpenError alloc];
  id v10 = [v6 parameters];
  id v11 = [(_CPLEngineWrapperOpenError *)v9 initWithParameters:v10 openError:v15];
  id v12 = self->_previousOpenErrors;
  id v13 = [v6 libraryIdentifier];
  [(NSMutableDictionary *)v12 setObject:v11 forKeyedSubscript:v13];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained wrapperArray:self wrapperShouldBeDropped:v6];
}

- (void)wrapper:(id)a3 libraryDidOpenWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = [v6 libraryIdentifier];
  int v9 = [(NSMutableDictionary *)self->_unopenedWrappers objectForKeyedSubscript:v8];

  if (v9)
  {
    [(NSMutableDictionary *)self->_unopenedWrappers removeObjectForKey:v8];
    [(NSMutableDictionary *)self->_previousOpenErrors removeObjectForKey:v8];
    if (v7)
    {
      if (!_CPLSilentLogging)
      {
        id v10 = sub_10001337C();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v20 = v6;
          __int16 v21 = 2112;
          id v22 = v7;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to open %@: %@", buf, 0x16u);
        }
      }
      [(NSMutableDictionary *)self->_autoClosingWrappers removeObjectForKey:v8];
      [(NSMutableDictionary *)self->_wrappers removeObjectForKey:v8];
      [(CPLEngineWrapperArray *)self _registerOpenError:v7 forWrapper:v6];
    }
    openObservers = self->_openObservers;
    id v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    id v15 = sub_100018054;
    id v16 = &unk_100276A58;
    id v17 = v6;
    id v18 = v7;
    [(NSMutableDictionary *)openObservers enumerateKeysAndObjectsUsingBlock:&v13];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "wrapperArrayCountDidChange:", self, v13, v14, v15, v16);
  }
}

- (void)wrapperLibraryDidClose:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v5 = [v4 libraryIdentifier];
  id v6 = [(NSMutableDictionary *)self->_wrappers objectForKeyedSubscript:v5];

  if (v6)
  {
    id v7 = [(NSMutableDictionary *)self->_unopenedWrappers objectForKeyedSubscript:v5];

    if (v7)
    {
      if (!_CPLSilentLogging)
      {
        id v8 = sub_10001337C();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 138412290;
          id v14 = v4;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ closed before even being opened", (uint8_t *)&v13, 0xCu);
        }
      }
      [(NSMutableDictionary *)self->_unopenedWrappers removeObjectForKey:v5];
    }
    else if (!_CPLSilentLogging)
    {
      int v9 = sub_10001337C();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        id v14 = v4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ is closed", (uint8_t *)&v13, 0xCu);
      }
    }
    [(NSMutableDictionary *)self->_wrappers removeObjectForKey:v5];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained wrapperArrayCountDidChange:self];
  }
  id v11 = [(NSMutableDictionary *)self->_autoClosingWrappers objectForKeyedSubscript:v5];

  if (v11)
  {
    id v12 = +[CPLErrors libraryDoesNotAutoOpenError];
    [(CPLEngineWrapperArray *)self _registerOpenError:v12 forWrapper:v4];

    [(NSMutableDictionary *)self->_autoClosingWrappers removeObjectForKey:v5];
  }
  if (![(NSMutableDictionary *)self->_wrappers count] && self->_stopAllBlocks) {
    [(CPLEngineWrapperArray *)self _callStopAllBlocks];
  }
}

- (void)wrapper:(id)a3 getStatusWithCompletionHandler:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = (void (**)(id, const __CFString *, void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  id v8 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained wrapperArray:self getStatusWithCompletionHandler:v6];
  }
  else {
    v6[2](v6, &stru_10027FEB8, 0);
  }
}

- (void)wrapper:(id)a3 getStatusDictionaryWithCompletionHandler:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = (void (**)(id, void *, void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  id v8 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained wrapperArray:self getStatusDictionaryWithCompletionHandler:v6];
  }
  else {
    v6[2](v6, &__NSDictionary0__struct, 0);
  }
}

- (void)wrapperShouldBeDropped:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained wrapperArray:self wrapperShouldBeDropped:v4];

  id v6 = [v4 libraryIdentifier];
  parametersStorage = self->_parametersStorage;
  id v15 = 0;
  unsigned __int8 v8 = [(CPLEngineParametersStorage *)parametersStorage removeParametersWithLibraryIdentifier:v6 error:&v15];
  id v9 = v15;
  if (v8)
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_10001337C();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v4;
        id v11 = "Removed stored parameters for %@";
        id v12 = v10;
        os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
        uint32_t v14 = 12;
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, buf, v14);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if (!_CPLSilentLogging)
  {
    id v10 = sub_10001337C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v4;
      __int16 v18 = 2112;
      id v19 = v9;
      id v11 = "Failed to drop parameters for %@: %@";
      id v12 = v10;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 22;
      goto LABEL_8;
    }
LABEL_9:
  }
  [(NSMutableDictionary *)self->_wrappers removeObjectForKey:v6];
  [(NSMutableDictionary *)self->_unopenedWrappers removeObjectForKey:v6];
}

- (void)wrapperNeedsInitialDownloadOfMainScope:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained wrapperArray:self wrapperNeedsInitialDownloadOfMainScope:v5];
}

- (void)wrapperDidCompleteInitialSyncOfMainScope:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained wrapperArray:self wrapperDidCompleteInitialSyncOfMainScope:v5];
}

- (CPLEngineParametersStorage)parametersStorage
{
  return self->_parametersStorage;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CPLEngineWrapperArrayDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CPLEngineWrapperArrayDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_parametersStorage, 0);
  objc_storeStrong((id *)&self->_autoClosingWrappers, 0);
  objc_storeStrong((id *)&self->_configurationFetcher, 0);
  objc_storeStrong((id *)&self->_openObservers, 0);
  objc_storeStrong((id *)&self->_stopAllBlocks, 0);
  objc_storeStrong((id *)&self->_previousOpenErrors, 0);
  objc_storeStrong((id *)&self->_unopenedWrappers, 0);
  objc_storeStrong((id *)&self->_wrappers, 0);
}

@end