@interface ADMediaRemoteService
- (ADMediaRemoteService)initWithQueue:(id)a3 volumeTracker:(id)a4 whaService:(id)a5;
- (ADVolumeTracking)volumeTracker;
- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4;
- (id)_commandsForDomain:(id)a3;
- (id)commandsForDomain:(id)a3;
- (id)domains;
- (id)targetQueue;
- (void)_buildCacheOfWhaServiceSupportedCommands;
- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6;
@end

@implementation ADMediaRemoteService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeTracker, 0);
  objc_storeStrong((id *)&self->_whaServiceSupportedCommands, 0);
  objc_storeStrong((id *)&self->_whaService, 0);
  objc_storeStrong((id *)&self->_commandsToIgnore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (ADVolumeTracking)volumeTracker
{
  return self->_volumeTracker;
}

- (id)targetQueue
{
  return self->_queue;
}

- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6
{
  id v9 = a3;
  v70 = (ADService *)a4;
  id v69 = a5;
  id v72 = a6;
  v71 = [v9 encodedClassName];
  v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v87 = "-[ADMediaRemoteService handleCommand:forDomain:executionContext:reply:]";
    __int16 v88 = 2112;
    v89 = v70;
    __int16 v90 = 2112;
    CFStringRef v91 = v71;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);
  }
  if (self->_whaService
    || (v26 = AFSiriLogContextDaemon, os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    && (*(_DWORD *)buf = 136315138,
        v87 = "-[ADMediaRemoteService handleCommand:forDomain:executionContext:reply:]",
        _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s WARNING: No other media service found, handling everything in assistantd.", buf, 0xCu), self->_whaService))
  {
    if (objc_opt_respondsToSelector())
    {
      v11 = [v9 hashedRouteUIDs];
      BOOL v12 = [v11 count] == 0;

      if (!v12)
      {
        v13 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          whaService = self->_whaService;
          *(_DWORD *)buf = 136315650;
          v87 = "-[ADMediaRemoteService handleCommand:forDomain:executionContext:reply:]";
          __int16 v88 = 2112;
          v89 = (ADService *)v71;
          __int16 v90 = 2112;
          CFStringRef v91 = (const __CFString *)whaService;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s %@ command has explicit routes, passing to %@", buf, 0x20u);
        }
        if ([(NSSet *)self->_whaServiceSupportedCommands containsObject:v71])
        {
          v15 = [v9 encodedClassName];
          unsigned int v16 = [v15 isEqualToString:SAMPSetQueueClassIdentifier];

          if (v16)
          {
            id v67 = v9;
            v17 = (void *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              v18 = v17;
              v19 = [v67 aceId];
              *(_DWORD *)buf = 136315394;
              v87 = "_ADAddWHAIdentifiersToSAMPSetQueue";
              __int16 v88 = 2112;
              v89 = v19;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Adding metrics info to SetQueue %@", buf, 0x16u);
            }
            id v68 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:1];
            v20 = +[NSUUID UUID];
            v65 = [v20 UUIDString];

            v92[0] = @"clientID";
            v92[1] = @"beginTime";
            v93[0] = v65;
            v21 = +[NSDate date];
            [v21 timeIntervalSinceReferenceDate];
            v22 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
            v93[1] = v22;
            v23 = +[NSDictionary dictionaryWithObjects:v93 forKeys:v92 count:2];
            [v68 setObject:v23 forKey:@"WHAMetrics"];

            v24 = [v67 metricsContext];
            v64 = v24;
            if (v24)
            {
              v25 = [v24 dataUsingEncoding:4];
              id v79 = 0;
              v66 = +[NSJSONSerialization JSONObjectWithData:v25 options:0 error:&v79];
              id v62 = v79;
            }
            else
            {
              v66 = 0;
              id v62 = 0;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v40 = AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315138;
                v87 = "_ADAddWHAIdentifiersToSAMPSetQueue";
                _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "%s merging existing metricsContext dictionary", buf, 0xCu);
              }
              v41 = v66;
              long long v75 = 0u;
              long long v76 = 0u;
              long long v77 = 0u;
              long long v78 = 0u;
              id v42 = v68;
              id v43 = [v42 countByEnumeratingWithState:&v75 objects:buf count:16];
              if (v43)
              {
                uint64_t v44 = *(void *)v76;
                do
                {
                  for (i = 0; i != v43; i = (char *)i + 1)
                  {
                    if (*(void *)v76 != v44) {
                      objc_enumerationMutation(v42);
                    }
                    v46 = *(void **)(*((void *)&v75 + 1) + 8 * i);
                    v47 = -[ADService valueForKey:](v41, "valueForKey:", v46, v62, v64);

                    if (v47)
                    {
                      v48 = AFSiriLogContextDaemon;
                      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)v80 = 136315394;
                        v81 = "_ADAddWHAIdentifiersToSAMPSetQueue";
                        __int16 v82 = 2112;
                        id v83 = v46;
                        _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%s Value already exists for key %@, keeping it", v80, 0x16u);
                      }
                    }
                  }
                  id v43 = [v42 countByEnumeratingWithState:&v75 objects:buf count:16];
                }
                while (v43);
              }

              [v42 addEntriesFromDictionary:v41];
            }
            else if (v66)
            {
              v49 = AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315650;
                v87 = "_ADAddWHAIdentifiersToSAMPSetQueue";
                __int16 v88 = 2112;
                v89 = v66;
                __int16 v90 = 2112;
                CFStringRef v91 = @"metricsContextValue";
                _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "%s merging existing non-dictionary metricsContext value of %@ under key %@", buf, 0x20u);
              }
              objc_msgSend(v68, "setObject:forKey:", v66, @"metricsContextValue", v62, v64);
            }
            id v74 = v62;
            v50 = +[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v68, 0, &v74, v62);
            id v51 = v74;

            id v52 = [objc_alloc((Class)NSString) initWithData:v50 encoding:4];
            if (v52)
            {
              [v67 setMetricsContext:v52];
              v53 = (void *)AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
              {
                v54 = v53;
                v55 = [v67 aceId];
                *(_DWORD *)v80 = 136315394;
                v81 = "_ADAddWHAIdentifiersToSAMPSetQueue";
                __int16 v82 = 2112;
                id v83 = v55;
                _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "%s Successfully updated metricsContext on %@", v80, 0x16u);
              }
            }
            else
            {
              v56 = AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v80 = 136315650;
                v81 = "_ADAddWHAIdentifiersToSAMPSetQueue";
                __int16 v82 = 2112;
                id v83 = v51;
                __int16 v84 = 2112;
                id v85 = v68;
                _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "%s Failed to update metricsContext error=%@ newContextDictionary=%@", v80, 0x20u);
              }
            }

            v57 = AFAnalyticsContextCreateWithCommand();
            id v58 = [v57 mutableCopy];

            v59 = [v58 objectForKey:@"com.apple.ace.media.SetQueue"];
            id v60 = [v59 mutableCopy];

            [v60 setObject:v68 forKey:@"metricsContext"];
            [v58 setObject:v60 forKey:@"com.apple.ace.media.SetQueue"];
            v61 = +[AFAnalytics sharedAnalytics];
            [v61 logEventWithType:2907 context:v58];
          }
          [(ADService *)self->_whaService handleCommand:v9 forDomain:v70 executionContext:v69 reply:v72];
          goto LABEL_34;
        }
        v27 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          v39 = self->_whaService;
          *(_DWORD *)buf = 136315650;
          v87 = "-[ADMediaRemoteService handleCommand:forDomain:executionContext:reply:]";
          __int16 v88 = 2112;
          v89 = (ADService *)v71;
          __int16 v90 = 2112;
          CFStringRef v91 = (const __CFString *)v39;
          _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s %@ is NOT supported by %@, attempting to handle in assistantd after all", buf, 0x20u);
        }
      }
    }
  }
  if (objc_opt_respondsToSelector()) {
    v28 = v9;
  }
  else {
    v28 = 0;
  }
  id v29 = v28;
  v30 = v29;
  if (v29)
  {
    objc_msgSend(v29, "_ad_performWithMediaRemoteService:replyHandler:", self, v72);
  }
  else if (self->_whaService {
         && ([v9 encodedClassName],
  }
             v31 = objc_claimAutoreleasedReturnValue(),
             unsigned int v32 = [v31 isEqualToString:SAMPSetQueueClassIdentifier],
             v31,
             v32))
  {
    v33 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v34 = self->_whaService;
      *(_DWORD *)buf = 136315394;
      v87 = "-[ADMediaRemoteService handleCommand:forDomain:executionContext:reply:]";
      __int16 v88 = 2112;
      v89 = v34;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "%s Handing SetQueue to %@", buf, 0x16u);
    }
    [(ADService *)self->_whaService handleCommand:v9 forDomain:v70 executionContext:v69 reply:v72];
  }
  else
  {
    v35 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v36 = v35;
      v37 = [v9 encodedClassName];
      v38 = [v9 aceId];
      *(_DWORD *)buf = 136315650;
      v87 = "-[ADMediaRemoteService handleCommand:forDomain:executionContext:reply:]";
      __int16 v88 = 2112;
      v89 = v37;
      __int16 v90 = 2112;
      CFStringRef v91 = v38;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%s %@ %@ was not handled", buf, 0x20u);
    }
    if (v72) {
      (*((void (**)(id, void, void))v72 + 2))(v72, 0, 0);
    }
  }

LABEL_34:
}

- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4
{
  return 1;
}

- (id)commandsForDomain:(id)a3
{
  v4 = [(ADMediaRemoteService *)self _commandsForDomain:a3];
  if (v4 && [(NSArray *)self->_commandsToIgnore count])
  {
    id v5 = [v4 mutableCopy];
    [v5 removeObjectsInArray:self->_commandsToIgnore];
    id v6 = [v5 copy];

    v4 = v6;
  }
  return v4;
}

- (id)_commandsForDomain:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:SANPGroupIdentifier])
  {
    v8[0] = SANPPausePlaybackClassIdentifier;
    v8[1] = SANPSeekToPlaybackPositionClassIdentifier;
    v8[2] = SANPSetRepeatModeClassIdentifier;
    v8[3] = SANPSetShuffleModeClassIdentifier;
    v8[4] = SANPSkipTimeIntervalClassIdentifier;
    v8[5] = SANPSkipToNextItemClassIdentifier;
    v8[6] = SANPSkipToPreviousItemClassIdentifier;
    v8[7] = SANPStartPlaybackClassIdentifier;
    v8[8] = SANPStopPlaybackClassIdentifier;
    v8[9] = SANPSetPlaybackSpeedClassIdentifier;
    v8[10] = SANPGetVolumeLevelClassIdentifier;
    v8[11] = SANPSetVolumeLevelClassIdentifier;
    v4 = +[NSArray arrayWithObjects:v8 count:12];
  }
  else
  {
    v4 = 0;
  }
  if ([v3 isEqualToString:SAMPGroupIdentifier])
  {
    v7[0] = SAMPSetPlaybackPositionClassIdentifier;
    v7[1] = SAMPSetQueueClassIdentifier;
    uint64_t v5 = +[NSArray arrayWithObjects:v7 count:2];

    v4 = (void *)v5;
  }

  return v4;
}

- (id)domains
{
  v4[0] = SANPGroupIdentifier;
  v4[1] = SAMPGroupIdentifier;
  v2 = +[NSArray arrayWithObjects:v4 count:2];
  return v2;
}

- (ADMediaRemoteService)initWithQueue:(id)a3 volumeTracker:(id)a4 whaService:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)ADMediaRemoteService;
  BOOL v12 = [(ADMediaRemoteService *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a3);
    objc_storeStrong((id *)&v13->_volumeTracker, a4);
    objc_storeStrong((id *)&v13->_whaService, a5);
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    [(ADService *)v13 setIdentifier:v15];

    commandsToIgnore = v13->_commandsToIgnore;
    v13->_commandsToIgnore = (NSArray *)&__NSArray0__struct;

    if (v13->_whaService) {
      [(ADMediaRemoteService *)v13 _buildCacheOfWhaServiceSupportedCommands];
    }
  }

  return v13;
}

- (void)_buildCacheOfWhaServiceSupportedCommands
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(ADMediaRemoteService *)self domains];
  id v4 = [obj countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        id v9 = [(ADService *)self->_whaService commandsForDomain:v8];
        if ([v9 count] == (id)1)
        {
          id v10 = v3;
          id v11 = [v9 firstObject];
          unsigned int v12 = [v11 isEqualToString:v8];

          if (v12)
          {
            uint64_t v13 = [(ADMediaRemoteService *)self commandsForDomain:v8];

            id v9 = (void *)v13;
          }
          id v3 = v10;
        }
        if (v9) {
          [v3 addObjectsFromArray:v9];
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v23 objects:v33 count:16];
    }
    while (v5);
  }

  id v14 = [v3 count];
  if (v14) {
    id v15 = [v3 copy];
  }
  else {
    id v15 = 0;
  }
  p_whaServiceSupportedCommands = &self->_whaServiceSupportedCommands;
  objc_storeStrong((id *)p_whaServiceSupportedCommands, v15);
  if (v14) {

  }
  v17 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    objc_super v18 = *p_whaServiceSupportedCommands;
    v19 = v17;
    v20 = +[NSNumber numberWithUnsignedInteger:[(NSSet *)v18 count]];
    v21 = *p_whaServiceSupportedCommands;
    *(_DWORD *)buf = 136315650;
    v28 = "-[ADMediaRemoteService _buildCacheOfWhaServiceSupportedCommands]";
    __int16 v29 = 2112;
    v30 = v20;
    __int16 v31 = 2112;
    unsigned int v32 = v21;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s %@ overlapping commands %@", buf, 0x20u);
  }
}

@end