@interface ADAnalyticsService
+ (id)sharedService;
- (ADAnalyticsService)init;
- (NSString)currentEventStreamUID;
- (id)_store;
- (id)_unstageEvents;
- (void)_addConnection:(id)a3;
- (void)_beginEventsFuzzingWithStartTime:(unint64_t)a3;
- (void)_beginEventsGrouping;
- (void)_endEventsFuzzingWithEndTime:(unint64_t)a3;
- (void)_endEventsGrouping;
- (void)_enumerateConnectionsAsServiceDelegates:(id)a3 completion:(id)a4;
- (void)_executeDelegateBlockOnAllConnections:(id)a3 completion:(id)a4;
- (void)_houseKeeperArrived;
- (void)_linkStoreForSysdiagnose;
- (void)_observeConnectionDisrupted:(int)a3 observer:(id)a4 referenceId:(id)a5;
- (void)_processStagedEvents;
- (void)_publishEventsToObserver:(id)a3 completion:(id)a4;
- (void)_removeConnection:(id)a3;
- (void)_resumeEventsStaging;
- (void)_signalConnectionDisruption:(id)a3;
- (void)_stageEvent:(id)a3;
- (void)_stageEvents:(id)a3;
- (void)_startHouseKeepingTimer;
- (void)_stopHouseKeepingTimer;
- (void)_stopObservingConnectionDisrupted:(int)a3 referenceId:(id)a4;
- (void)_suspendEventsStaging;
- (void)_unlinkStoreForSysdiagnose;
- (void)accessStoreUsingBlock:(id)a3;
- (void)beginEventsFuzzingWithStartTime:(unint64_t)a3;
- (void)beginEventsGrouping;
- (void)boostAllConnections:(id)a3;
- (void)checkForMetricsUploadProblem;
- (void)connectionConnected:(id)a3;
- (void)connectionDisconnected:(id)a3;
- (void)connectionInterrupted:(id)a3;
- (void)dealloc;
- (void)endEventsFuzzingWithEndTime:(unint64_t)a3;
- (void)endEventsGrouping;
- (void)flushWithCompletion:(id)a3;
- (void)logInstrumentationOfType:(id)a3 machAbsoluteTime:(unint64_t)a4 turnIdentifier:(id)a5;
- (void)managedConfigurationEffectiveSettingsChanged;
- (void)observeWithCompletion:(id)a3;
- (void)resumeEventsStaging;
- (void)setObserverConnection:(id)a3;
- (void)stageEvents:(id)a3 completion:(id)a4;
- (void)stageUEIEventData:(id)a3 timestamp:(unint64_t)a4 completion:(id)a5;
- (void)storeGenericInstrumentation:(id)a3 completion:(id)a4;
- (void)suspendEventsStaging;
@end

@implementation ADAnalyticsService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionDisruptedObservers, 0);
  objc_storeStrong((id *)&self->_fuzzingIntervals, 0);
  objc_storeStrong((id *)&self->_currentFuzzingInterval, 0);
  objc_storeStrong((id *)&self->_observerConnection, 0);
  objc_storeStrong(&self->_observationCompletion, 0);
  objc_storeStrong((id *)&self->_speechId, 0);
  objc_storeStrong((id *)&self->_instrumentationResolver, 0);
  objc_storeStrong((id *)&self->_streamUID, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_stagedEvents, 0);
  objc_storeStrong((id *)&self->_houseKeepingTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_unlinkStoreForSysdiagnose
{
  v3 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[ADAnalyticsService _unlinkStoreForSysdiagnose]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v4 = AFAnalyticsLogsDirectory();
  v5 = [(ADAnalyticsStore *)self->_store path];
  v6 = [v5 lastPathComponent];
  v7 = [v4 stringByAppendingPathComponent:v6];

  v8 = +[NSFileManager defaultManager];
  if ([v8 fileExistsAtPath:v7 isDirectory:0])
  {
    id v12 = 0;
    unsigned int v9 = [v8 removeItemAtPath:v7 error:&v12];
    id v10 = v12;
    v11 = AFSiriLogContextAnalytics;
    if (v9)
    {
      if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v14 = "-[ADAnalyticsService _unlinkStoreForSysdiagnose]";
        __int16 v15 = 2112;
        v16 = v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Deleted link at %@.", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v14 = "-[ADAnalyticsService _unlinkStoreForSysdiagnose]";
      __int16 v15 = 2112;
      v16 = v7;
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Failed to delete link at %@ due to error %@.", buf, 0x20u);
    }
  }
}

- (void)_linkStoreForSysdiagnose
{
  v3 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[ADAnalyticsService _linkStoreForSysdiagnose]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v4 = AFAnalyticsLogsDirectory();
  v5 = AFAnalyticsLogsDirectory();
  v6 = [(ADAnalyticsStore *)self->_store path];
  v7 = [v6 lastPathComponent];
  v8 = [v5 stringByAppendingPathComponent:v7];

  unsigned int v9 = +[NSFileManager defaultManager];
  if (([v9 fileExistsAtPath:v8 isDirectory:0] & 1) == 0)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1002F016C;
    v16[3] = &unk_10050DCB8;
    id v10 = v9;
    id v17 = v10;
    id v18 = v8;
    v19 = self;
    v11 = objc_retainBlock(v16);
    if ([v10 fileExistsAtPath:v4])
    {
      ((void (*)(void *))v11[2])(v11);
    }
    else
    {
      id v15 = 0;
      unsigned int v12 = [v10 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v15];
      id v13 = v15;
      if (v12)
      {
        ((void (*)(void *))v11[2])(v11);
      }
      else
      {
        v14 = AFSiriLogContextAnalytics;
        if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v21 = "-[ADAnalyticsService _linkStoreForSysdiagnose]";
          __int16 v22 = 2112;
          v23 = v4;
          __int16 v24 = 2112;
          id v25 = v13;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Failed to create directory at %@ due to error %@.", buf, 0x20u);
        }
      }
    }
  }
}

- (void)_endEventsFuzzingWithEndTime:(unint64_t)a3
{
  if (self->_isFuzzing)
  {
    v5 = self->_currentFuzzingInterval;
    self->_isFuzzing = 0;
    [(ADAnalyticsFuzzingInterval *)v5 setEndTime:a3];
    v6 = (void *)AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
    {
      v7 = v6;
      unint64_t v8 = [(ADAnalyticsFuzzingInterval *)v5 endTime];
      unsigned int v9 = [(ADAnalyticsFuzzingInterval *)v5 streamUID];
      *(_DWORD *)buf = 136315650;
      id v13 = "-[ADAnalyticsService _endEventsFuzzingWithEndTime:]";
      __int16 v14 = 2048;
      unint64_t v15 = v8;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Fuzzing time interval ended with end time: %lld streamUID: %@", buf, 0x20u);
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1002F04C8;
    v11[3] = &unk_10050E138;
    v11[4] = self;
    [(ADAnalyticsService *)self flushWithCompletion:v11];
  }
  else
  {
    id v10 = AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v13 = "-[ADAnalyticsService _endEventsFuzzingWithEndTime:]";
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Haven't start a fuzzing interval, unable to end", buf, 0xCu);
    }
  }
}

- (void)_beginEventsFuzzingWithStartTime:(unint64_t)a3
{
  if (self->_isFuzzing)
  {
    v3 = AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      v11 = "-[ADAnalyticsService _beginEventsFuzzingWithStartTime:]";
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s Haven't ended previous fuzzing interval, unable to begin new one", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    self->_isFuzzing = 1;
    v5 = [[ADAnalyticsFuzzingInterval alloc] initWithStartTime:a3];
    objc_storeStrong((id *)&self->_currentFuzzingInterval, v5);
    [(AFQueue *)self->_fuzzingIntervals enqueueObject:self->_currentFuzzingInterval];
    v6 = (void *)AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
    {
      v7 = v6;
      unint64_t v8 = [(ADAnalyticsFuzzingInterval *)v5 startTime];
      unsigned int v9 = [(ADAnalyticsFuzzingInterval *)v5 streamUID];
      int v10 = 136315650;
      v11 = "-[ADAnalyticsService _beginEventsFuzzingWithStartTime:]";
      __int16 v12 = 2048;
      unint64_t v13 = v8;
      __int16 v14 = 2112;
      unint64_t v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Fuzzing time interval created with start time: %lld streamUID: %@", (uint8_t *)&v10, 0x20u);
    }
  }
}

- (void)_houseKeeperArrived
{
  [(ADAnalyticsService *)self _stopHouseKeepingTimer];
  [(ADAnalyticsService *)self _processStagedEvents];
}

- (void)_stopHouseKeepingTimer
{
  houseKeepingTimer = self->_houseKeepingTimer;
  if (houseKeepingTimer)
  {
    dispatch_source_cancel(houseKeepingTimer);
    v4 = self->_houseKeepingTimer;
    self->_houseKeepingTimer = 0;
  }
}

- (void)_startHouseKeepingTimer
{
  if (!self->_houseKeepingTimer)
  {
    int64_t depthOfEventsGrouping = self->_depthOfEventsGrouping;
    v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
    houseKeepingTimer = self->_houseKeepingTimer;
    self->_houseKeepingTimer = v4;

    v6 = self->_houseKeepingTimer;
    if (depthOfEventsGrouping <= 0) {
      int64_t v7 = 4000000000;
    }
    else {
      int64_t v7 = 16000000000;
    }
    dispatch_time_t v8 = dispatch_time(0, v7);
    dispatch_source_set_timer(v6, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    objc_initWeak(&location, self);
    unsigned int v9 = self->_houseKeepingTimer;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1002F08D8;
    v10[3] = &unk_10050B790;
    objc_copyWeak(&v11, &location);
    dispatch_source_set_event_handler(v9, v10);
    dispatch_resume((dispatch_object_t)self->_houseKeepingTimer);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)_resumeEventsStaging
{
  if (self->_isSuspended)
  {
    self->_isSuspended = 0;
  }
  else
  {
    v2 = AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      int v3 = 136315138;
      v4 = "-[ADAnalyticsService _resumeEventsStaging]";
      _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s Attempted to resume events staging while not suspended.", (uint8_t *)&v3, 0xCu);
    }
  }
}

- (void)_suspendEventsStaging
{
  if (self->_isSuspended)
  {
    v2 = AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      int v3 = 136315138;
      v4 = "-[ADAnalyticsService _suspendEventsStaging]";
      _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s Attempted to suspend events staging while already suspended.", (uint8_t *)&v3, 0xCu);
    }
  }
  else
  {
    self->_isSuspended = 1;
  }
}

- (void)_endEventsGrouping
{
  int64_t v2 = self->_depthOfEventsGrouping - 1;
  self->_int64_t depthOfEventsGrouping = v2;
  if (!v2)
  {
    [(ADAnalyticsService *)self _stopHouseKeepingTimer];
    [(ADAnalyticsService *)self _startHouseKeepingTimer];
  }
}

- (void)_beginEventsGrouping
{
  int64_t depthOfEventsGrouping = self->_depthOfEventsGrouping;
  self->_int64_t depthOfEventsGrouping = depthOfEventsGrouping + 1;
  if (!depthOfEventsGrouping)
  {
    [(ADAnalyticsService *)self _stopHouseKeepingTimer];
    [(ADAnalyticsService *)self _startHouseKeepingTimer];
  }
}

- (void)_processStagedEvents
{
  int64_t v2 = self;
  int v3 = [(ADAnalyticsService *)self _unstageEvents];
  if ([v3 count])
  {
    v4 = +[AFPreferences sharedPreferences];
    unsigned int v5 = [v4 isDictationHIPAACompliant];

    if (v5)
    {
      v6 = AFSiriLogContextAnalytics;
      if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v86 = "-[ADAnalyticsService _processStagedEvents]";
        int64_t v7 = "%s Dont unstage the events and send them, because we have HIPAA On-Device Dictation enabled";
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v7, buf, 0xCu);
      }
    }
    else
    {
      dispatch_time_t v8 = +[AFSiriDataSharingSensitivityManager shared];
      unsigned int v9 = [v8 isOptedOutOfMTE];

      if (v9)
      {
        v6 = AFSiriLogContextAnalytics;
        if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v86 = "-[ADAnalyticsService _processStagedEvents]";
          int64_t v7 = "%s #MTEOptOut Skipping writing staged events to disk because device is opted out of MTE";
          goto LABEL_8;
        }
      }
      else
      {
        id v10 = objc_alloc_init((Class)NSMutableDictionary);
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        v47 = v3;
        id obj = v3;
        id v11 = [obj countByEnumeratingWithState:&v77 objects:v84 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v78;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v78 != v13) {
                objc_enumerationMutation(obj);
              }
              unint64_t v15 = *(void **)(*((void *)&v77 + 1) + 8 * i);
              uint64_t v16 = [v15 speechId];
              if (v16) {
                id v17 = (__CFString *)v16;
              }
              else {
                id v17 = @"unknown";
              }
              id v18 = [v10 objectForKey:v17];
              if (!v18)
              {
                id v18 = objc_alloc_init((Class)NSMutableSet);
                [v10 setObject:v18 forKey:v17];
              }
              [v18 addObject:v15];
            }
            id v12 = [obj countByEnumeratingWithState:&v77 objects:v84 count:16];
          }
          while (v12);
        }

        id v19 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(obj, "count"));
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        id v51 = v10;
        id v50 = [v51 countByEnumeratingWithState:&v73 objects:v83 count:16];
        if (v50)
        {
          uint64_t v49 = *(void *)v74;
          id v54 = v19;
          v55 = v2;
          do
          {
            uint64_t v20 = 0;
            do
            {
              if (*(void *)v74 != v49) {
                objc_enumerationMutation(v51);
              }
              uint64_t v52 = v20;
              uint64_t v57 = *(void *)(*((void *)&v73 + 1) + 8 * v20);
              v21 = objc_msgSend(v51, "objectForKey:");
              long long v69 = 0u;
              long long v70 = 0u;
              long long v71 = 0u;
              long long v72 = 0u;
              id v53 = v21;
              id v58 = [v21 countByEnumeratingWithState:&v69 objects:v82 count:16];
              if (v58)
              {
                uint64_t v56 = *(void *)v70;
                do
                {
                  for (j = 0; j != v58; j = (char *)j + 1)
                  {
                    if (*(void *)v70 != v56) {
                      objc_enumerationMutation(v53);
                    }
                    id v23 = *(id *)(*((void *)&v69 + 1) + 8 * (void)j);
                    __int16 v24 = v2->_streamUID;
                    if ([(AFQueue *)v2->_fuzzingIntervals count])
                    {
                      v59 = j;
                      long long v67 = 0u;
                      long long v68 = 0u;
                      long long v65 = 0u;
                      long long v66 = 0u;
                      v61 = v2->_fuzzingIntervals;
                      id v25 = [(AFQueue *)v61 countByEnumeratingWithState:&v65 objects:v81 count:16];
                      if (v25)
                      {
                        id v26 = v25;
                        uint64_t v27 = *(void *)v66;
                        v60 = v23;
                        v28 = v23;
                        do
                        {
                          for (k = 0; k != v26; k = (char *)k + 1)
                          {
                            if (*(void *)v66 != v27) {
                              objc_enumerationMutation(v61);
                            }
                            v30 = *(void **)(*((void *)&v65 + 1) + 8 * (void)k);
                            id v31 = [v28 timestamp];
                            if (v31 >= [v30 startTime])
                            {
                              if (![v30 endTime]
                                || (id v32 = [v28 timestamp], v32 <= objc_msgSend(v30, "endTime")))
                              {
                                uint64_t v62 = [v30 streamUID];

                                v33 = (char *)[v60 timestamp];
                                v34 = &v33[(void)[v30 offset]];
                                id v35 = objc_alloc((Class)AFAnalyticsEvent);
                                id v36 = [v60 deliveryStream];
                                id v37 = [v60 type];
                                id v38 = v26;
                                uint64_t v39 = v27;
                                id v40 = [v60 contextDataType];
                                v41 = [v60 contextData];
                                id v42 = [v35 initWithDeliveryStream:v36 type:v37 timestamp:v34 contextDataType:v40 contextData:v41];

                                v28 = v42;
                                uint64_t v27 = v39;
                                id v26 = v38;
                                __int16 v24 = (NSString *)v62;
                              }
                            }
                          }
                          id v26 = [(AFQueue *)v61 countByEnumeratingWithState:&v65 objects:v81 count:16];
                        }
                        while (v26);
                      }
                      else
                      {
                        v28 = v23;
                      }

                      id v23 = v28;
                      id v19 = v54;
                      int64_t v2 = v55;
                      j = v59;
                    }
                    v43 = +[NSDate date];
                    v44 = v23;
                    id v45 = [objc_alloc((Class)AFAnalyticsEventRecord) initWithEvent:v23 streamUID:v24 dateCreated:v43 speechId:v57];
                    if (v45) {
                      [v19 addObject:v45];
                    }
                  }
                  id v58 = [v53 countByEnumeratingWithState:&v69 objects:v82 count:16];
                }
                while (v58);
              }

              uint64_t v20 = v52 + 1;
            }
            while ((id)(v52 + 1) != v50);
            id v50 = [v51 countByEnumeratingWithState:&v73 objects:v83 count:16];
          }
          while (v50);
        }

        if ([v19 count])
        {
          v46 = [(ADAnalyticsService *)v2 _store];
          v63[0] = _NSConcreteStackBlock;
          v63[1] = 3221225472;
          v63[2] = sub_1002F11F4;
          v63[3] = &unk_10050B720;
          id v64 = obj;
          [v46 insertEventRecords:v19 completion:v63];
        }
        int v3 = v47;
      }
    }
  }
}

- (id)_unstageEvents
{
  int v3 = self->_stagedEvents;
  v4 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  stagedEvents = self->_stagedEvents;
  self->_stagedEvents = v4;

  return v3;
}

- (void)_stageEvents:(id)a3
{
  [(NSMutableSet *)self->_stagedEvents unionSet:a3];
  [(ADAnalyticsService *)self _startHouseKeepingTimer];
}

- (void)_stageEvent:(id)a3
{
  [(NSMutableSet *)self->_stagedEvents addObject:a3];
  [(ADAnalyticsService *)self _startHouseKeepingTimer];
}

- (void)_executeDelegateBlockOnAllConnections:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_time_t v8 = dispatch_group_create();
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  dispatch_group_enter(v8);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1002F1584;
  v19[3] = &unk_10050B6F8;
  uint64_t v20 = v8;
  id v21 = v9;
  __int16 v22 = self;
  id v23 = v6;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1002F18A8;
  v17[3] = &unk_10050E138;
  id v18 = v20;
  id v10 = v20;
  id v11 = v6;
  id v12 = v9;
  [(ADAnalyticsService *)self _enumerateConnectionsAsServiceDelegates:v19 completion:v17];
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002F18B0;
  v15[3] = &unk_10050D0D0;
  id v16 = v7;
  id v14 = v7;
  dispatch_group_notify(v10, queue, v15);
}

- (void)_enumerateConnectionsAsServiceDelegates:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_time_t v8 = +[AFAnalytics sharedAnalytics];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002F1CB8;
  v11[3] = &unk_10050C688;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 barrier:v11];
}

- (void)_stopObservingConnectionDisrupted:(int)a3 referenceId:(id)a4
{
  if (a4)
  {
    uint64_t v4 = *(void *)&a3;
    connectionDisruptedObservers = self->_connectionDisruptedObservers;
    id v7 = a4;
    dispatch_time_t v8 = +[NSNumber numberWithInt:v4];
    id v11 = [(NSMutableDictionary *)connectionDisruptedObservers objectForKey:v8];

    [v11 removeObjectForKey:v7];
    if (![v11 count])
    {
      id v9 = self->_connectionDisruptedObservers;
      id v10 = +[NSNumber numberWithInt:v4];
      [(NSMutableDictionary *)v9 removeObjectForKey:v10];
    }
  }
}

- (void)_observeConnectionDisrupted:(int)a3 observer:(id)a4 referenceId:(id)a5
{
  if (a4 && a5)
  {
    uint64_t v6 = *(void *)&a3;
    id v8 = a5;
    id v15 = [a4 copy];
    connectionDisruptedObservers = self->_connectionDisruptedObservers;
    id v10 = +[NSNumber numberWithInt:v6];
    id v11 = [(NSMutableDictionary *)connectionDisruptedObservers objectForKey:v10];

    if (!v11)
    {
      id v11 = +[NSMutableDictionary dictionary];
      id v12 = self->_connectionDisruptedObservers;
      id v13 = +[NSNumber numberWithInt:v6];
      [(NSMutableDictionary *)v12 setObject:v11 forKey:v13];
    }
    id v14 = objc_retainBlock(v15);
    [v11 setObject:v14 forKey:v8];
  }
}

- (void)_removeConnection:(id)a3
{
}

- (void)_signalConnectionDisruption:(id)a3
{
  id v4 = [a3 processIdentifier];
  connectionDisruptedObservers = self->_connectionDisruptedObservers;
  uint64_t v6 = +[NSNumber numberWithInt:v4];
  id v7 = [(NSMutableDictionary *)connectionDisruptedObservers objectForKey:v6];
  id v8 = [v7 allValues];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * (void)v13) + 16))(*(void *)(*((void *)&v14 + 1) + 8 * (void)v13));
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)_addConnection:(id)a3
{
}

- (id)_store
{
  if (!self->_store)
  {
    int v3 = [ADAnalyticsStore alloc];
    id v4 = +[ADAudioFileWriter _savedAudioFilesDirectory]_0();
    unsigned int v5 = [v4 URLByAppendingPathComponent:@"SiriAnalytics.db"];
    uint64_t v6 = [v5 path];
    id v7 = [(ADAnalyticsStore *)v3 initWithPath:v6];
    store = self->_store;
    self->_store = v7;

    if ((AFIsInternalInstall() & 1) != 0
      || (+[AFPreferences sharedPreferences],
          id v9 = objc_claimAutoreleasedReturnValue(),
          unsigned int v10 = [v9 shouldLogForQA],
          v9,
          v10))
    {
      [(ADAnalyticsService *)self _linkStoreForSysdiagnose];
    }
    else
    {
      [(ADAnalyticsService *)self _unlinkStoreForSysdiagnose];
    }
  }
  id v11 = self->_store;
  return v11;
}

- (void)flushWithCompletion:(id)a3
{
}

- (void)observeWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002F2440;
  v7[3] = &unk_10050E188;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_publishEventsToObserver:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1002F2644;
  v17[3] = &unk_10050D0D0;
  id v7 = a4;
  id v18 = v7;
  id v8 = objc_retainBlock(v17);
  id v9 = v8;
  observerConnection = self->_observerConnection;
  if (observerConnection)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1002F265C;
    v15[3] = &unk_10050D440;
    id v11 = v8;
    id v16 = v11;
    uint64_t v12 = [(NSXPCConnection *)observerConnection remoteObjectProxyWithErrorHandler:v15];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1002F273C;
    v13[3] = &unk_10050D0D0;
    long long v14 = v11;
    [v12 didObserveEvents:v6 completion:v13];
  }
  else
  {
    ((void (*)(void *))v8[2])(v8);
  }
}

- (void)storeGenericInstrumentation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v20 = "-[ADAnalyticsService storeGenericInstrumentation:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1002F28F8;
  v17[3] = &unk_10050D0D0;
  id v18 = v7;
  id v9 = v7;
  unsigned int v10 = objc_retainBlock(v17);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002F2910;
  block[3] = &unk_10050E188;
  id v15 = v6;
  id v16 = v10;
  uint64_t v12 = v10;
  id v13 = v6;
  dispatch_async(queue, block);
}

- (void)boostAllConnections:(id)a3
{
  id v4 = a3;
  unsigned int v5 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[ADAnalyticsService boostAllConnections:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1002F2B00;
  v12[3] = &unk_10050D0D0;
  id v13 = v4;
  id v6 = v4;
  id v7 = objc_retainBlock(v12);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002F2B18;
  block[3] = &unk_10050E188;
  void block[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(queue, block);
}

- (void)stageUEIEventData:(id)a3 timestamp:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002F2F6C;
  block[3] = &unk_10050C148;
  id v15 = v9;
  unint64_t v16 = a4;
  id v14 = v8;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, block);
}

- (void)endEventsFuzzingWithEndTime:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1002F3088;
  v4[3] = &unk_10050D8C0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)beginEventsFuzzingWithStartTime:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1002F3108;
  v4[3] = &unk_10050D8C0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)logInstrumentationOfType:(id)a3 machAbsoluteTime:(unint64_t)a4 turnIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1002F31DC;
  v13[3] = &unk_10050DD08;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)endEventsGrouping
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002F3264;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)beginEventsGrouping
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002F32E0;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)stageEvents:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1002F3438;
  v13[3] = &unk_10050D0D0;
  id v7 = a4;
  id v14 = v7;
  id v8 = objc_retainBlock(v13);
  if ([v6 count])
  {
    queue = self->_queue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1002F3450;
    v10[3] = &unk_10050E1D8;
    void v10[4] = self;
    id v11 = v6;
    id v12 = v8;
    dispatch_async(queue, v10);
  }
  else
  {
    ((void (*)(void *))v8[2])(v8);
  }
}

- (void)checkForMetricsUploadProblem
{
  int v3 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v14 = "-[ADAnalyticsService checkForMetricsUploadProblem]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (AFIsInternalInstall())
  {
    if (AFHasUnlockedSinceBoot())
    {
      id v4 = +[ADPreferences sharedPreferences];
      unsigned int v5 = [v4 lastMetricsUploadDate];

      [v5 timeIntervalSinceNow];
      if (v6 <= -21600.0)
      {
        id v7 = +[ADPreferences sharedPreferences];
        id v8 = [v7 lastMetricsUploadFailureReportedOnDate];

        [v8 timeIntervalSinceNow];
        if (v9 >= -86400.0)
        {
          v11[0] = _NSConcreteStackBlock;
          v11[1] = 3221225472;
          v11[2] = sub_1002F3888;
          v11[3] = &unk_10050B5C0;
          id v12 = v5;
          [(ADAnalyticsService *)self accessStoreUsingBlock:v11];
        }
      }
    }
    else
    {
      unsigned int v10 = AFSiriLogContextAnalytics;
      if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        id v14 = "-[ADAnalyticsService checkForMetricsUploadProblem]";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Skipping check due to storage lock.", buf, 0xCu);
      }
    }
  }
}

- (void)managedConfigurationEffectiveSettingsChanged
{
  int v3 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[ADAnalyticsService managedConfigurationEffectiveSettingsChanged]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002F3C3C;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)resumeEventsStaging
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002F3D48;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)suspendEventsStaging
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002F3DC4;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)setObserverConnection:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002F3E64;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)accessStoreUsingBlock:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002F3F90;
    v7[3] = &unk_10050E188;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)connectionDisconnected:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002F4094;
    v7[3] = &unk_10050E160;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)connectionInterrupted:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002F417C;
    v7[3] = &unk_10050E160;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)connectionConnected:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002F4230;
    v7[3] = &unk_10050E160;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (NSString)currentEventStreamUID
{
  return self->_streamUID;
}

- (void)dealloc
{
  [(ADAnalyticsService *)self _stopHouseKeepingTimer];
  v3.receiver = self;
  v3.super_class = (Class)ADAnalyticsService;
  [(ADAnalyticsService *)&v3 dealloc];
}

- (ADAnalyticsService)init
{
  v31.receiver = self;
  v31.super_class = (Class)ADAnalyticsService;
  int64_t v2 = [(ADAnalyticsService *)&v31 init];
  if (v2)
  {
    objc_super v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.assistant.analytics.service", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    id v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    stagedEvents = v2->_stagedEvents;
    v2->_stagedEvents = v7;

    double v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    connections = v2->_connections;
    v2->_connections = v9;

    if (qword_100585E58 != -1) {
      dispatch_once(&qword_100585E58, &stru_100506A10);
    }
    p_streamUID = (void **)&v2->_streamUID;
    objc_storeStrong((id *)&v2->_streamUID, (id)qword_100585E50);
    id v12 = [[ADInstrumentationResolver alloc] initWithQueue:v2->_queue];
    instrumentationResolver = v2->_instrumentationResolver;
    v2->_instrumentationResolver = v12;

    if (!v2->_streamUID)
    {
      id v14 = AFSiriLogContextAnalytics;
      if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v33 = "-[ADAnalyticsService init]";
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Unable to use boot session UUID as stream UID, falling back to in memory UUID instead.", buf, 0xCu);
      }
      id v15 = objc_alloc_init((Class)NSUUID);
      uint64_t v16 = [v15 UUIDString];
      long long v17 = *p_streamUID;
      *p_streamUID = (void *)v16;
    }
    id v18 = AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
    {
      id v19 = *p_streamUID;
      *(_DWORD *)buf = 136315394;
      v33 = "-[ADAnalyticsService init]";
      __int16 v34 = 2112;
      id v35 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s streamUID = %@", buf, 0x16u);
    }
    uint64_t v20 = (AFQueue *)objc_alloc_init((Class)AFQueue);
    fuzzingIntervals = v2->_fuzzingIntervals;
    v2->_fuzzingIntervals = v20;

    uint64_t v22 = +[NSMutableDictionary dictionary];
    connectionDisruptedObservers = v2->_connectionDisruptedObservers;
    v2->_connectionDisruptedObservers = (NSMutableDictionary *)v22;

    __int16 v24 = +[ADAccount activeAccount];
    uint64_t v25 = [v24 speechIdentifier];
    speechId = v2->_speechId;
    v2->_speechId = (NSString *)v25;

    uint64_t v27 = v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002F4594;
    block[3] = &unk_10050E138;
    v30 = v2;
    dispatch_async(v27, block);
  }
  return v2;
}

+ (id)sharedService
{
  if (qword_100586250 != -1) {
    dispatch_once(&qword_100586250, &stru_10050B570);
  }
  int64_t v2 = (void *)qword_100586258;
  return v2;
}

@end