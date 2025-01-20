@interface NviSignalProvidersController
+ (void)initialize;
- (BOOL)_setupSignalProviders:(id)a3;
- (NSDictionary)dataSrcMap;
- (NSHashTable)currActiveDataSourceTypes;
- (NSHashTable)currActiveSigProvTypes;
- (NSMapTable)sigProvidersMap;
- (NviAssetsProvider)assetsProvider;
- (NviSignalProvidersController)initWithAssetsProvider:(id)a3 dataSourceMap:(id)a4 signalProviderToDataSourceMap:(id)a5;
- (void)_iterateSignalMask:(unint64_t)a3 withHandler:(id)a4;
- (void)_startDataSourcesWithContext:(id)a3;
- (void)_startSignalProvidersWithContext:(id)a3;
- (void)_stopCurrentlyRunningSignalProviders;
- (void)_stopDataSources;
- (void)dealloc;
- (void)registerSignalProviderDelegate:(id)a3 forSignalTypes:(unint64_t)a4;
- (void)registerSignalProviderDelegateForAllSignalTypes:(id)a3;
- (void)reset;
- (void)setAssetsProvider:(id)a3;
- (void)setCurrActiveDataSourceTypes:(id)a3;
- (void)setCurrActiveSigProvTypes:(id)a3;
- (void)setDataSrcMap:(id)a3;
- (void)setSigProvidersMap:(id)a3;
- (void)startWithNviContext:(id)a3;
- (void)stop;
- (void)unregisterSignalProviderDelegate:(id)a3 forSignalType:(unint64_t)a4;
- (void)unregisterSignalProviderDelegateForAllSignalTypes:(id)a3;
@end

@implementation NviSignalProvidersController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currActiveDataSourceTypes, 0);
  objc_storeStrong((id *)&self->_currActiveSigProvTypes, 0);
  objc_storeStrong((id *)&self->_sigProvidersMap, 0);
  objc_storeStrong((id *)&self->_dataSrcMap, 0);
  objc_storeStrong((id *)&self->_assetsProvider, 0);
}

- (void)setCurrActiveDataSourceTypes:(id)a3
{
}

- (NSHashTable)currActiveDataSourceTypes
{
  return self->_currActiveDataSourceTypes;
}

- (void)setCurrActiveSigProvTypes:(id)a3
{
}

- (NSHashTable)currActiveSigProvTypes
{
  return self->_currActiveSigProvTypes;
}

- (void)setSigProvidersMap:(id)a3
{
}

- (NSMapTable)sigProvidersMap
{
  return self->_sigProvidersMap;
}

- (void)setDataSrcMap:(id)a3
{
}

- (NSDictionary)dataSrcMap
{
  return self->_dataSrcMap;
}

- (void)setAssetsProvider:(id)a3
{
}

- (NviAssetsProvider)assetsProvider
{
  return self->_assetsProvider;
}

- (void)unregisterSignalProviderDelegateForAllSignalTypes:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_sigProvidersMap;
  uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = -[NSMapTable objectForKeyedSubscript:](self->_sigProvidersMap, "objectForKeyedSubscript:", *(void *)(*((void *)&v11 + 1) + 8 * v9), (void)v11);
        [v10 removeDelegate:v4];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)registerSignalProviderDelegateForAllSignalTypes:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_sigProvidersMap;
  uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = -[NSMapTable objectForKeyedSubscript:](self->_sigProvidersMap, "objectForKeyedSubscript:", *(void *)(*((void *)&v11 + 1) + 8 * v9), (void)v11);
        [v10 addDelegate:v4];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)unregisterSignalProviderDelegate:(id)a3 forSignalType:(unint64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__NviSignalProvidersController_unregisterSignalProviderDelegate_forSignalType___block_invoke;
  v8[3] = &unk_1E658A4E8;
  id v9 = v6;
  id v7 = v6;
  [(NviSignalProvidersController *)self _iterateSignalMask:a4 withHandler:v8];
}

uint64_t __79__NviSignalProvidersController_unregisterSignalProviderDelegate_forSignalType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeDelegate:*(void *)(a1 + 32)];
}

- (void)registerSignalProviderDelegate:(id)a3 forSignalTypes:(unint64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__NviSignalProvidersController_registerSignalProviderDelegate_forSignalTypes___block_invoke;
  v8[3] = &unk_1E658A4E8;
  id v9 = v6;
  id v7 = v6;
  [(NviSignalProvidersController *)self _iterateSignalMask:a4 withHandler:v8];
}

uint64_t __78__NviSignalProvidersController_registerSignalProviderDelegate_forSignalTypes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addDelegate:*(void *)(a1 + 32)];
}

- (void)_iterateSignalMask:(unint64_t)a3 withHandler:(id)a4
{
  unsigned int v4 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void *))a4;
  uint64_t v7 = 0;
  *(void *)&long long v8 = 136315394;
  long long v15 = v8;
  do
  {
    sigProvidersMap = self->_sigProvidersMap;
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", (1 << v7) & v4, v15);
    long long v11 = [(NSMapTable *)sigProvidersMap objectForKeyedSubscript:v10];

    if (v11)
    {
      v6[2](v6, v11);
    }
    else
    {
      long long v12 = (void *)NviLogContextFacility;
      if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
      {
        long long v13 = v12;
        long long v14 = +[NviUtils strRepForNviSignalType:(1 << v7) & v4];
        *(_DWORD *)buf = v15;
        v17 = "-[NviSignalProvidersController _iterateSignalMask:withHandler:]";
        __int16 v18 = 2112;
        v19 = v14;
        _os_log_impl(&dword_1C9338000, v13, OS_LOG_TYPE_DEFAULT, "%s WARN: Cannot find SignalProvider for %@. Skipping", buf, 0x16u);
      }
    }

    ++v7;
  }
  while (v7 != 5);
}

- (void)stop
{
  [(NviSignalProvidersController *)self _stopDataSources];
  [(NviSignalProvidersController *)self _stopCurrentlyRunningSignalProviders];
}

- (void)_stopCurrentlyRunningSignalProviders
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = dispatch_group_create();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obj = self->_currActiveSigProvTypes;
  uint64_t v4 = [(NSHashTable *)obj countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v9 = [(NSMapTable *)self->_sigProvidersMap objectForKeyedSubscript:v8];
        dispatch_group_enter(v3);
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __68__NviSignalProvidersController__stopCurrentlyRunningSignalProviders__block_invoke;
        v19[3] = &unk_1E658A498;
        v19[4] = v8;
        uint64_t v20 = v3;
        [v9 stopWithDidStopHandler:v19];
      }
      uint64_t v5 = [(NSHashTable *)obj countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v5);
  }

  dispatch_time_t v10 = dispatch_time(0, 2000000000);
  long long v11 = [MEMORY[0x1E4F1C9C8] date];
  intptr_t v12 = dispatch_group_wait(v3, v10);
  long long v13 = [MEMORY[0x1E4F1C9C8] date];
  long long v14 = NviLogContextFacility;
  BOOL v15 = os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v15)
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[NviSignalProvidersController _stopCurrentlyRunningSignalProviders]";
      _os_log_impl(&dword_1C9338000, v14, OS_LOG_TYPE_DEFAULT, "%s WARN: SignalProviders timedout didStop. timeout=2secs", buf, 0xCu);
    }
  }
  else if (v15)
  {
    uint64_t v16 = v14;
    [v13 timeIntervalSinceDate:v11];
    *(_DWORD *)buf = 136315394;
    v26 = "-[NviSignalProvidersController _stopCurrentlyRunningSignalProviders]";
    __int16 v27 = 2048;
    double v28 = v17 * 1000.0;
    _os_log_impl(&dword_1C9338000, v16, OS_LOG_TYPE_DEFAULT, "%s >>> All SignalProviders didStop within timeout of 2secs: timeTaken=%f ms", buf, 0x16u);
  }
}

void __68__NviSignalProvidersController__stopCurrentlyRunningSignalProviders__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    uint64_t v6 = (void *)NviLogContextFacility;
    if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void **)(a1 + 32);
      uint64_t v8 = v6;
      id v9 = +[NviUtils strRepForNviSignalType:](NviUtils, "strRepForNviSignalType:", [v7 unsignedIntegerValue]);
      int v10 = 136315650;
      long long v11 = "-[NviSignalProvidersController _stopCurrentlyRunningSignalProviders]_block_invoke";
      __int16 v12 = 2112;
      long long v13 = v9;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_DEFAULT, "%s Failed to stop %@: Err=%@", (uint8_t *)&v10, 0x20u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)_stopDataSources
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = dispatch_group_create();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obj = self->_currActiveDataSourceTypes;
  uint64_t v4 = [(NSHashTable *)obj countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v9 = [(NSDictionary *)self->_dataSrcMap objectForKeyedSubscript:v8];
        dispatch_group_enter(v3);
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __48__NviSignalProvidersController__stopDataSources__block_invoke;
        v19[3] = &unk_1E658A498;
        v19[4] = v8;
        uint64_t v20 = v3;
        [v9 stopWithDidStopHandler:v19];
      }
      uint64_t v5 = [(NSHashTable *)obj countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v5);
  }

  dispatch_time_t v10 = dispatch_time(0, 2000000000);
  long long v11 = [MEMORY[0x1E4F1C9C8] date];
  intptr_t v12 = dispatch_group_wait(v3, v10);
  long long v13 = [MEMORY[0x1E4F1C9C8] date];
  __int16 v14 = NviLogContextFacility;
  BOOL v15 = os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v15)
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[NviSignalProvidersController _stopDataSources]";
      _os_log_impl(&dword_1C9338000, v14, OS_LOG_TYPE_DEFAULT, "%s WARN: DataSources timedout stopping. timeout=2secs", buf, 0xCu);
    }
  }
  else if (v15)
  {
    uint64_t v16 = v14;
    [v13 timeIntervalSinceDate:v11];
    *(_DWORD *)buf = 136315394;
    v26 = "-[NviSignalProvidersController _stopDataSources]";
    __int16 v27 = 2048;
    double v28 = v17 * 1000.0;
    _os_log_impl(&dword_1C9338000, v16, OS_LOG_TYPE_DEFAULT, "%s >>> All DataSources Stopped within timeout of 2secs: timeTaken=%f ms", buf, 0x16u);
  }
}

void __48__NviSignalProvidersController__stopDataSources__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    uint64_t v6 = (void *)NviLogContextFacility;
    if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void **)(a1 + 32);
      uint64_t v8 = v6;
      id v9 = +[NviUtils strRepForNviDataSourceType:](NviUtils, "strRepForNviDataSourceType:", [v7 unsignedIntegerValue]);
      int v10 = 136315650;
      long long v11 = "-[NviSignalProvidersController _stopDataSources]_block_invoke";
      __int16 v12 = 2112;
      long long v13 = v9;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_DEFAULT, "%s Failed to start %@. Err=%@", (uint8_t *)&v10, 0x20u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)reset
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_sigProvidersMap;
  uint64_t v4 = [(NSMapTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = -[NSMapTable objectForKeyedSubscript:](self->_sigProvidersMap, "objectForKeyedSubscript:", *(void *)(*((void *)&v9 + 1) + 8 * v7), (void)v9);
        [v8 reset];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMapTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)startWithNviContext:(id)a3
{
  id v4 = a3;
  [(NviSignalProvidersController *)self _startSignalProvidersWithContext:v4];
  [(NviSignalProvidersController *)self _startDataSourcesWithContext:v4];
}

- (void)_startSignalProvidersWithContext:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v4 = -[NviAssetsProvider signalProvidersMapForContext:](self->_assetsProvider, "signalProvidersMapForContext:");
  uint64_t v5 = [MEMORY[0x1E4F28D30] hashTableWithOptions:0];
  currActiveSigProvTypes = self->_currActiveSigProvTypes;
  self->_currActiveSigProvTypes = v5;

  uint64_t v7 = [MEMORY[0x1E4F28D30] hashTableWithOptions:0];
  currActiveDataSourceTypes = self->_currActiveDataSourceTypes;
  self->_currActiveDataSourceTypes = v7;

  long long v9 = dispatch_group_create();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v34;
    *(void *)&long long v12 = 136315394;
    long long v28 = v12;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v34 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        double v17 = -[NSMapTable objectForKeyedSubscript:](self->_sigProvidersMap, "objectForKeyedSubscript:", v16, v28);
        __int16 v18 = NviLogContextFacility;
        if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v28;
          v38 = "-[NviSignalProvidersController _startSignalProvidersWithContext:]";
          __int16 v39 = 2112;
          double v40 = *(double *)&v17;
          _os_log_impl(&dword_1C9338000, v18, OS_LOG_TYPE_DEFAULT, "%s Starting signal provider: %@", buf, 0x16u);
        }
        dispatch_group_enter(v9);
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __65__NviSignalProvidersController__startSignalProvidersWithContext___block_invoke;
        v30[3] = &unk_1E658A4C0;
        v30[4] = v16;
        v30[5] = self;
        id v19 = v10;
        id v31 = v19;
        v32 = v9;
        [v17 startWithNviContext:v29 didStartHandler:v30];
      }
      uint64_t v13 = [v19 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v13);
  }

  dispatch_time_t v20 = dispatch_time(0, 2000000000);
  long long v21 = [MEMORY[0x1E4F1C9C8] date];
  intptr_t v22 = dispatch_group_wait(v9, v20);
  long long v23 = [MEMORY[0x1E4F1C9C8] date];
  long long v24 = NviLogContextFacility;
  BOOL v25 = os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT);
  if (v22)
  {
    if (v25)
    {
      *(_DWORD *)buf = 136315138;
      v38 = "-[NviSignalProvidersController _startSignalProvidersWithContext:]";
      _os_log_impl(&dword_1C9338000, v24, OS_LOG_TYPE_DEFAULT, "%s WARN: SignalProviders timedout didStart. timeout=2secs", buf, 0xCu);
    }
  }
  else if (v25)
  {
    v26 = v24;
    [v23 timeIntervalSinceDate:v21];
    *(_DWORD *)buf = 136315394;
    v38 = "-[NviSignalProvidersController _startSignalProvidersWithContext:]";
    __int16 v39 = 2048;
    double v40 = v27 * 1000.0;
    _os_log_impl(&dword_1C9338000, v26, OS_LOG_TYPE_DEFAULT, "%s >>> All SignalProviders didStart within timeout of 2secs: timeTaken=%f ms", buf, 0x16u);
  }
}

void __65__NviSignalProvidersController__startSignalProvidersWithContext___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    uint64_t v8 = (void *)NviLogContextFacility;
    if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      long long v9 = *(void **)(a1 + 32);
      id v10 = v8;
      uint64_t v11 = +[NviUtils strRepForNviSignalType:](NviUtils, "strRepForNviSignalType:", [v9 unsignedIntegerValue]);
      int v12 = 136315650;
      uint64_t v13 = "-[NviSignalProvidersController _startSignalProvidersWithContext:]_block_invoke";
      __int16 v14 = 2112;
      id v15 = v11;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl(&dword_1C9338000, v10, OS_LOG_TYPE_DEFAULT, "%s Failed to start %@: Err=%@", (uint8_t *)&v12, 0x20u);
    }
  }
  else
  {
    [*(id *)(*(void *)(a1 + 40) + 32) addObject:*(void *)(a1 + 32)];
    uint64_t v6 = *(void **)(*(void *)(a1 + 40) + 40);
    uint64_t v7 = [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(a1 + 32)];
    [v6 addObject:v7];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

- (void)_startDataSourcesWithContext:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v4 = dispatch_group_create();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obj = self->_currActiveDataSourceTypes;
  uint64_t v5 = [(NSHashTable *)obj countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v27;
    *(void *)&long long v6 = 136315394;
    long long v21 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v11 = -[NSDictionary objectForKeyedSubscript:](self->_dataSrcMap, "objectForKeyedSubscript:", v10, v21);
        int v12 = NviLogContextFacility;
        if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v21;
          id v31 = "-[NviSignalProvidersController _startDataSourcesWithContext:]";
          __int16 v32 = 2112;
          double v33 = *(double *)&v11;
          _os_log_impl(&dword_1C9338000, v12, OS_LOG_TYPE_DEFAULT, "%s Starting datasrc: %@", buf, 0x16u);
        }
        dispatch_group_enter(v4);
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __61__NviSignalProvidersController__startDataSourcesWithContext___block_invoke;
        v24[3] = &unk_1E658A498;
        v24[4] = v10;
        BOOL v25 = v4;
        [v11 startWithNviContext:v23 didStartHandler:v24];
      }
      uint64_t v7 = [(NSHashTable *)obj countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v7);
  }

  dispatch_time_t v13 = dispatch_time(0, 2000000000);
  __int16 v14 = [MEMORY[0x1E4F1C9C8] date];
  intptr_t v15 = dispatch_group_wait(v4, v13);
  __int16 v16 = [MEMORY[0x1E4F1C9C8] date];
  id v17 = NviLogContextFacility;
  BOOL v18 = os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v18)
    {
      *(_DWORD *)buf = 136315138;
      id v31 = "-[NviSignalProvidersController _startDataSourcesWithContext:]";
      _os_log_impl(&dword_1C9338000, v17, OS_LOG_TYPE_DEFAULT, "%s WARN: DataSources Start timedout. timeout=2secs", buf, 0xCu);
    }
  }
  else if (v18)
  {
    id v19 = v17;
    [v16 timeIntervalSinceDate:v14];
    *(_DWORD *)buf = 136315394;
    id v31 = "-[NviSignalProvidersController _startDataSourcesWithContext:]";
    __int16 v32 = 2048;
    double v33 = v20 * 1000.0;
    _os_log_impl(&dword_1C9338000, v19, OS_LOG_TYPE_DEFAULT, "%s >>> All DataSources Started within timeout of 2secs: timeTaken=%f ms", buf, 0x16u);
  }
}

void __61__NviSignalProvidersController__startDataSourcesWithContext___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    long long v6 = (void *)NviLogContextFacility;
    if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void **)(a1 + 32);
      uint64_t v8 = v6;
      long long v9 = +[NviUtils strRepForNviDataSourceType:](NviUtils, "strRepForNviDataSourceType:", [v7 unsignedIntegerValue]);
      int v10 = 136315650;
      uint64_t v11 = "-[NviSignalProvidersController _startDataSourcesWithContext:]_block_invoke";
      __int16 v12 = 2112;
      dispatch_time_t v13 = v9;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_DEFAULT, "%s Failed to start %@. Err=%@", (uint8_t *)&v10, 0x20u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (BOOL)_setupSignalProviders:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
  sigProvidersMap = self->_sigProvidersMap;
  self->_sigProvidersMap = v5;

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v7);
        }
        __int16 v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        dataSrcMap = self->_dataSrcMap;
        __int16 v14 = [v7 objectForKeyedSubscript:v12];
        id v15 = [(NSDictionary *)dataSrcMap objectForKeyedSubscript:v14];

        if (!v15)
        {
          BOOL v18 = [MEMORY[0x1E4F28B00] currentHandler];
          id v19 = +[NviUtils strRepForNviSignalType:](NviUtils, "strRepForNviSignalType:", [v12 unsignedIntegerValue]);
          [v18 handleFailureInMethod:a2, self, @"NviSignalProvidersController.m", 72, @"No DataSource found for SignalType: %@", v19 object file lineNumber description];
        }
        if ([v12 unsignedIntegerValue] != 4)
        {
          id v23 = (void *)NviLogContextFacility;
          if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
          {
            long long v24 = v23;
            BOOL v25 = +[NviUtils strRepForNviSignalType:](NviUtils, "strRepForNviSignalType:", [v12 unsignedIntegerValue]);
            *(_DWORD *)buf = 136315394;
            long long v36 = "-[NviSignalProvidersController _setupSignalProviders:]";
            __int16 v37 = 2112;
            v38 = v25;
            _os_log_impl(&dword_1C9338000, v24, OS_LOG_TYPE_DEFAULT, "%s %@ not supported yet.", buf, 0x16u);
          }
LABEL_19:
          long long v26 = (void *)NviLogContextFacility;
          if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
          {
            long long v27 = v26;
            long long v28 = +[NviUtils strRepForNviSignalType:](NviUtils, "strRepForNviSignalType:", [v12 unsignedIntegerValue]);
            *(_DWORD *)buf = 136315394;
            long long v36 = "-[NviSignalProvidersController _setupSignalProviders:]";
            __int16 v37 = 2112;
            v38 = v28;
            _os_log_impl(&dword_1C9338000, v27, OS_LOG_TYPE_DEFAULT, "%s Failed to create: %@", buf, 0x16u);
          }
          BOOL v22 = 0;
          goto LABEL_22;
        }
        uint64_t v16 = [[NviDirectionalitySignalProvider alloc] initWithDataSource:v15 assetsProvider:self->_assetsProvider];
        id v17 = NviLogContextFacility;
        if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          long long v36 = "-[NviSignalProvidersController _setupSignalProviders:]";
          __int16 v37 = 2048;
          v38 = v16;
          _os_log_impl(&dword_1C9338000, v17, OS_LOG_TYPE_DEFAULT, "%s sp=%p", buf, 0x16u);
        }
        if (!v16) {
          goto LABEL_19;
        }
        [(NSMapTable *)self->_sigProvidersMap setObject:v16 forKeyedSubscript:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  double v20 = NviLogContextFacility;
  if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    long long v21 = self->_sigProvidersMap;
    *(_DWORD *)buf = 136315394;
    long long v36 = "-[NviSignalProvidersController _setupSignalProviders:]";
    __int16 v37 = 2112;
    v38 = v21;
    _os_log_impl(&dword_1C9338000, v20, OS_LOG_TYPE_DEFAULT, "%s SigPrvdrs: %@", buf, 0x16u);
  }
  BOOL v22 = 1;
LABEL_22:

  return v22;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = NviLogContextFacility;
  if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v6 = "-[NviSignalProvidersController dealloc]";
    __int16 v7 = 2048;
    uint64_t v8 = self;
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_DEFAULT, "%s %p dealloced", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)NviSignalProvidersController;
  [(NviSignalProvidersController *)&v4 dealloc];
}

- (NviSignalProvidersController)initWithAssetsProvider:(id)a3 dataSourceMap:(id)a4 signalProviderToDataSourceMap:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)NviSignalProvidersController;
  __int16 v12 = [(NviSignalProvidersController *)&v17 init];
  p_isa = (id *)&v12->super.isa;
  if (v12
    && (objc_storeStrong((id *)&v12->_assetsProvider, a3),
        objc_storeStrong(p_isa + 2, a4),
        ![p_isa _setupSignalProviders:v11]))
  {
    id v15 = 0;
  }
  else
  {
    __int16 v14 = NviLogContextFacility;
    if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v19 = "-[NviSignalProvidersController initWithAssetsProvider:dataSourceMap:signalProviderToDataSourceMap:]";
      __int16 v20 = 2048;
      long long v21 = p_isa;
      _os_log_impl(&dword_1C9338000, v14, OS_LOG_TYPE_DEFAULT, "%s %p created", buf, 0x16u);
    }
    id v15 = p_isa;
  }

  return v15;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && InitNviLogging_once != -1)
  {
    dispatch_once(&InitNviLogging_once, &__block_literal_global_16716);
  }
}

@end