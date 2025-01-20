@interface IDSServerStorageStateMachine
+ (id)sharedInstance;
- (BOOL)inflightServerStorageStateMachineForTopic:(id)a3;
- (IDSDeliveryController)deliveryController;
- (IDSServerBag)idsServerBag;
- (IDSServerStorageStateMachine)init;
- (IDSServerStorageStateMachine)initWithDeliveryController:(id)a3 userDefaults:(id)a4 idsServerBag:(id)a5;
- (IMUserDefaults)userDefaults;
- (NSMutableDictionary)currentStorageRetriesPerTopic;
- (NSMutableDictionary)deathTimerToTopicMap;
- (id)_persistedTopics;
- (id)currentMetricCollectorForTopic:(id)a3;
- (id)lastReceivedMessageTimeForTopic:(id)a3;
- (id)metricCollectors;
- (void)_incrementMessagesFromStorageForTopic:(id)a3;
- (void)_persistTopic:(id)a3;
- (void)_sendServerStorageMessageForTopic:(id)a3 retryCount:(int)a4;
- (void)_startExtendedTimeoutTimerForTopic:(id)a3;
- (void)_startTimeoutTimerForTopic:(id)a3;
- (void)_stateMachineTimedOut:(id)a3;
- (void)_submitNoLastFromStorageMetricForService:(id)a3;
- (void)_unpersistTopic:(id)a3;
- (void)dealloc;
- (void)incomingStorageRequestForTopic:(id)a3 primary:(BOOL)a4 messageContext:(id)a5;
- (void)recievedLastMessageFromStorageForTopic:(id)a3;
- (void)recievedMessageFromStorageForTopic:(id)a3;
- (void)recievedNoStorageResponseForTopic:(id)a3 messageContext:(id)a4;
- (void)reissuePersistedRequests;
- (void)setCurrentStorageRetriesPerTopic:(id)a3;
- (void)setDeathTimerToTopicMap:(id)a3;
- (void)setDeliveryController:(id)a3;
- (void)setIdsServerBag:(id)a3;
- (void)setUserDefaults:(id)a3;
- (void)startCollectingMetricsForServerStorageStateMachineFor:(id)a3 isPrimary:(BOOL)a4;
- (void)stopCollectingMetricsForServerStorageStateMachineFor:(id)a3;
- (void)terminateStateMachineForTopic:(id)a3;
@end

@implementation IDSServerStorageStateMachine

+ (id)sharedInstance
{
  if (qword_100A4AB30 != -1) {
    dispatch_once(&qword_100A4AB30, &stru_1009865F8);
  }
  v2 = (void *)qword_100A4AB38;

  return v2;
}

- (IDSServerStorageStateMachine)init
{
  v3 = +[IDSDeliveryController sharedInstance];
  v4 = +[IMUserDefaults sharedDefaults];
  v5 = +[IDSServerBag sharedInstanceForBagType:0];
  v6 = [(IDSServerStorageStateMachine *)self initWithDeliveryController:v3 userDefaults:v4 idsServerBag:v5];

  return v6;
}

- (IDSServerStorageStateMachine)initWithDeliveryController:(id)a3 userDefaults:(id)a4 idsServerBag:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)IDSServerStorageStateMachine;
  v11 = [(IDSServerStorageStateMachine *)&v24 init];
  v12 = v11;
  if (v11)
  {
    if (!v11->_currentStorageRetriesPerTopic)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      currentStorageRetriesPerTopic = v12->_currentStorageRetriesPerTopic;
      v12->_currentStorageRetriesPerTopic = (NSMutableDictionary *)Mutable;
    }
    if (!v12->_deathTimerToTopicMap)
    {
      CFMutableDictionaryRef v15 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      deathTimerToTopicMap = v12->_deathTimerToTopicMap;
      v12->_deathTimerToTopicMap = (NSMutableDictionary *)v15;
    }
    if (!v12->_lastReceivedMessageTimePerTopic)
    {
      CFMutableDictionaryRef v17 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      lastReceivedMessageTimePerTopic = v12->_lastReceivedMessageTimePerTopic;
      v12->_lastReceivedMessageTimePerTopic = (NSMutableDictionary *)v17;
    }
    if (!v12->_inflightStorageRequests)
    {
      v19 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      inflightStorageRequests = v12->_inflightStorageRequests;
      v12->_inflightStorageRequests = v19;
    }
    if (!v12->_pendingStorageRequests)
    {
      v21 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      pendingStorageRequests = v12->_pendingStorageRequests;
      v12->_pendingStorageRequests = v21;
    }
    [(IDSServerStorageStateMachine *)v12 setDeliveryController:v8];
    [(IDSServerStorageStateMachine *)v12 setUserDefaults:v9];
    [(IDSServerStorageStateMachine *)v12 setIdsServerBag:v10];
  }

  return v12;
}

- (void)dealloc
{
  v3 = [(NSMutableDictionary *)self->_deathTimerToTopicMap allValues];
  [v3 makeObjectsPerformSelector:"invalidate"];

  v4.receiver = self;
  v4.super_class = (Class)IDSServerStorageStateMachine;
  [(IDSServerStorageStateMachine *)&v4 dealloc];
}

- (void)incomingStorageRequestForTopic:(id)a3 primary:(BOOL)a4 messageContext:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ([(NSMutableSet *)self->_inflightStorageRequests containsObject:v8])
  {
    id v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "We already have an inflight request for topic %@, checking if we have a backup", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v14 = v8;
      _IDSLogV();
    }
    if (-[NSMutableSet containsObject:](self->_pendingStorageRequests, "containsObject:", v8, v14))
    {
      v11 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v8;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "We already have a backup request for topic %@, throwing this request away", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
LABEL_23:
      }
        _IDSLogV();
    }
    else
    {
      [(NSMutableSet *)self->_pendingStorageRequests addObject:v8];
      v13 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v8;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "We already have an inflight request for this topic %@, adding it to the backup queue", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        goto LABEL_23;
      }
    }
  }
  else
  {
    v12 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "This is the first request for topic %@, kicking off a server message for it", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v14 = v8;
      _IDSLogV();
    }
    -[IDSServerStorageStateMachine _persistTopic:](self, "_persistTopic:", v8, v14);
    [(NSMutableSet *)self->_inflightStorageRequests addObject:v8];
    [(IDSServerStorageStateMachine *)self startCollectingMetricsForServerStorageStateMachineFor:v8 isPrimary:v6];
    [(IDSServerStorageStateMachine *)self _sendServerStorageMessageForTopic:v8 retryCount:0];
  }
}

- (void)recievedNoStorageResponseForTopic:(id)a3 messageContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "We received a 165 from the server for topic %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v9 = v6;
    _IDSLogV();
  }
  -[IDSServerStorageStateMachine terminateStateMachineForTopic:](self, "terminateStateMachineForTopic:", v6, v9);
}

- (void)recievedLastMessageFromStorageForTopic:(id)a3
{
  id v4 = a3;
  v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "We received a last from storage from the server for topic %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v6 = v4;
    _IDSLogV();
  }
  -[IDSServerStorageStateMachine terminateStateMachineForTopic:](self, "terminateStateMachineForTopic:", v4, v6);
}

- (void)recievedMessageFromStorageForTopic:(id)a3
{
  lastReceivedMessageTimePerTopic = self->_lastReceivedMessageTimePerTopic;
  id v6 = a3;
  v5 = +[NSDate date];
  [(NSMutableDictionary *)lastReceivedMessageTimePerTopic setObject:v5 forKey:v6];

  [(IDSServerStorageStateMachine *)self _incrementMessagesFromStorageForTopic:v6];
}

- (void)_startTimeoutTimerForTopic:(id)a3
{
  id v4 = a3;
  v5 = +[NSString stringWithFormat:@"%@-retry-timeout", v4];
  id v6 = [(IDSServerStorageStateMachine *)self idsServerBag];
  id v7 = [v6 objectForKey:v5];
  signed int v8 = [v7 intValue];

  if (!v8) {
    signed int v8 = 60;
  }
  id v9 = objc_alloc((Class)IMDispatchTimer);
  id v10 = im_primary_queue();
  id v11 = +[NSDictionary dictionaryWithObjectsAndKeys:v4, @"topic", 0];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10021D838;
  v13[3] = &unk_100980598;
  v13[4] = self;
  id v12 = [v9 initWithQueue:v10 interval:v8 repeats:0 userInfo:v11 handlerBlock:v13];

  [(NSMutableDictionary *)self->_deathTimerToTopicMap setObject:v12 forKey:v4];
}

- (void)_startExtendedTimeoutTimerForTopic:(id)a3
{
  id v4 = a3;
  v5 = +[NSString stringWithFormat:@"%@-extend-retry-timeout", v4];
  id v6 = [(IDSServerStorageStateMachine *)self idsServerBag];
  id v7 = [v6 objectForKey:v5];
  signed int v8 = [v7 intValue];

  if (!v8) {
    signed int v8 = 20;
  }
  id v9 = objc_alloc((Class)IMDispatchTimer);
  id v10 = im_primary_queue();
  id v11 = +[NSDictionary dictionaryWithObjectsAndKeys:v4, @"topic", 0];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10021D9BC;
  v13[3] = &unk_100980598;
  v13[4] = self;
  id v12 = [v9 initWithQueue:v10 interval:v8 repeats:0 userInfo:v11 handlerBlock:v13];

  [(NSMutableDictionary *)self->_deathTimerToTopicMap setObject:v12 forKey:v4];
}

- (void)_submitNoLastFromStorageMetricForService:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)IDSMissingMessageMetric) initWithReason:705 guid:0 service:v3 additionalInformation:0];

  +[IDSMissingMessageMetricReporter sendMetric:v4];
}

- (void)_stateMachineTimedOut:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  id v6 = [v5 _stringForKey:@"topic"];
  id v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v48 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Topic %@, has timed out waiting for server response", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    v38 = v6;
    _IDSLogV();
  }
  signed int v8 = -[IDSServerStorageStateMachine lastReceivedMessageTimeForTopic:](self, "lastReceivedMessageTimeForTopic:", v6, v38);
  id v9 = v8;
  if (!v8) {
    goto LABEL_56;
  }
  [v8 timeIntervalSinceNow];
  if (v10 < 0.0) {
    double v10 = -v10;
  }
  if (v10 < 10.0)
  {
    id v11 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v48 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Topic %@ has recently received a message from storage.  Starting a new extended timer for retry.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v39 = v6;
      _IDSLogV();
    }
    id v12 = -[NSMutableDictionary objectForKey:](self->_deathTimerToTopicMap, "objectForKey:", v6, v39);
    v13 = v12;
    if (v12)
    {
      [v12 invalidate];
      [(NSMutableDictionary *)self->_deathTimerToTopicMap removeObjectForKey:v6];
    }
    [(IDSServerStorageStateMachine *)self _startExtendedTimeoutTimerForTopic:v6];
  }
  else
  {
LABEL_56:
    if ([(NSMutableSet *)self->_pendingStorageRequests containsObject:v6])
    {
      id v14 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v6;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "We timed out with our request for %@ however we have one in the pending queue, Not retrying and instead letting that take over", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v39 = v6;
        _IDSLogV();
      }
      -[IDSServerStorageStateMachine terminateStateMachineForTopic:](self, "terminateStateMachineForTopic:", v6, v39);
      [(IDSServerStorageStateMachine *)self _submitNoLastFromStorageMetricForService:v6];
    }
    else
    {
      CFMutableDictionaryRef v15 = +[IDSDServiceController sharedInstance];
      v46 = [v15 serviceWithPushTopic:v6];

      id v16 = +[NSString stringWithFormat:@"%@-force-passthrough-retry", v6];
      CFMutableDictionaryRef v17 = [(IDSServerStorageStateMachine *)self idsServerBag];
      v18 = [v17 objectForKey:v16];
      unsigned int v19 = [v18 BOOLValue];

      if (([v46 passThroughMessagesFromStorage] ^ 1 | v19))
      {
        v44 = +[NSString stringWithFormat:@"%@-storage-state-machine-retry-limit", v6];
        v20 = +[IDSServerBag sharedInstance];
        v45 = [v20 objectForKey:v44];

        if (v45 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
          int v21 = [v45 intValue];
        }
        else {
          int v21 = 2;
        }
        v23 = [(NSMutableDictionary *)self->_currentStorageRetriesPerTopic _numberForKey:v6];
        BOOL v24 = (int)[v23 intValue] < v21;

        if (v24)
        {
          v25 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v26 = [(NSMutableDictionary *)self->_currentStorageRetriesPerTopic _numberForKey:v6];
            unsigned int v27 = [v26 intValue];
            *(_DWORD *)buf = 138412802;
            v48 = v6;
            __int16 v49 = 1024;
            unsigned int v50 = v27;
            __int16 v51 = 1024;
            int v52 = 2;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "We have not used up our remaining retries on topic %@: Used: %d Available: %d", buf, 0x18u);
          }
          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            v28 = [(NSMutableDictionary *)self->_currentStorageRetriesPerTopic _numberForKey:v6];
            id v42 = [v28 intValue];
            uint64_t v43 = 2;
            v41 = v6;
            _IDSLogV();
          }
          v29 = -[NSMutableDictionary objectForKey:](self->_deathTimerToTopicMap, "objectForKey:", v6, v41, v42, v43);
          v30 = v29;
          if (v29)
          {
            [v29 invalidate];
            [(NSMutableDictionary *)self->_deathTimerToTopicMap removeObjectForKey:v6];
          }
          v31 = [(NSMutableDictionary *)self->_currentStorageRetriesPerTopic _numberForKey:v6];
          v32 = (char *)[v31 integerValue];

          v33 = v32 + 1;
          currentStorageRetriesPerTopic = self->_currentStorageRetriesPerTopic;
          v35 = +[NSNumber numberWithInteger:v33];
          [(NSMutableDictionary *)currentStorageRetriesPerTopic setObject:v35 forKey:v6];

          v36 = [(NSMutableDictionary *)self->_currentStorageRetriesPerTopic _numberForKey:v6];
          -[IDSServerStorageStateMachine _sendServerStorageMessageForTopic:retryCount:](self, "_sendServerStorageMessageForTopic:retryCount:", v6, [v36 intValue]);
        }
        else
        {
          v37 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v48 = v6;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "We have used up all available retries for topic %@: Terminating state machine", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            v41 = v6;
            _IDSLogV();
          }
          -[IDSServerStorageStateMachine terminateStateMachineForTopic:](self, "terminateStateMachineForTopic:", v6, v41);
          [(IDSServerStorageStateMachine *)self _submitNoLastFromStorageMetricForService:v6];
        }
      }
      else
      {
        v22 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v48 = v6;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "The topic %@ is a pass-through-message service. Not retrying.", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          v40 = v6;
          _IDSLogV();
        }
        -[IDSServerStorageStateMachine terminateStateMachineForTopic:](self, "terminateStateMachineForTopic:", v6, v40);
        [(IDSServerStorageStateMachine *)self _submitNoLastFromStorageMetricForService:v6];
      }
    }
  }
}

- (void)_sendServerStorageMessageForTopic:(id)a3 retryCount:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)IDSPendingOfflineMessageResponse);
  signed int v8 = +[NSNumber numberWithInt:v4];
  [v7 setRetryCount:v8];

  id v9 = [(IDSServerStorageStateMachine *)self deliveryController];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10021E330;
  v11[3] = &unk_100980110;
  id v12 = v6;
  v13 = self;
  id v10 = v6;
  [v9 sendIDSMessage:v7 service:0 topic:v10 completionBlock:v11];
}

- (void)terminateStateMachineForTopic:(id)a3
{
  id v4 = a3;
  v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Told to terminate state machine for topic %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v10 = v4;
    _IDSLogV();
  }
  id v6 = -[NSMutableDictionary objectForKey:](self->_deathTimerToTopicMap, "objectForKey:", v4, v10);
  id v7 = v6;
  if (v6)
  {
    [v6 invalidate];
    [(NSMutableDictionary *)self->_deathTimerToTopicMap removeObjectForKey:v4];
  }
  else
  {
    signed int v8 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unable to find a topic timeout timer, This will likely cause a bug", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
  [(NSMutableSet *)self->_inflightStorageRequests removeObject:v4];
  [(NSMutableDictionary *)self->_currentStorageRetriesPerTopic removeObjectForKey:v4];
  [(IDSServerStorageStateMachine *)self stopCollectingMetricsForServerStorageStateMachineFor:v4];
  if ([(NSMutableSet *)self->_pendingStorageRequests containsObject:v4])
  {
    id v9 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "We terminated our state machine for %@, however we have another backed up, kicking off another state machine", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v11 = v4;
      _IDSLogV();
    }
    -[NSMutableSet removeObject:](self->_pendingStorageRequests, "removeObject:", v4, v11);
    [(IDSServerStorageStateMachine *)self incomingStorageRequestForTopic:v4 primary:0 messageContext:0];
  }
  else
  {
    [(IDSServerStorageStateMachine *)self _unpersistTopic:v4];
  }
}

- (BOOL)inflightServerStorageStateMachineForTopic:(id)a3
{
  return [(NSMutableSet *)self->_inflightStorageRequests containsObject:a3];
}

- (id)lastReceivedMessageTimeForTopic:(id)a3
{
  return [(NSMutableDictionary *)self->_lastReceivedMessageTimePerTopic objectForKey:a3];
}

- (id)currentMetricCollectorForTopic:(id)a3
{
  id v4 = a3;
  metricCollectors = self->_metricCollectors;
  if (!metricCollectors)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    id v7 = self->_metricCollectors;
    self->_metricCollectors = Mutable;

    metricCollectors = self->_metricCollectors;
  }
  signed int v8 = [(NSMutableDictionary *)metricCollectors objectForKey:v4];

  return v8;
}

- (void)startCollectingMetricsForServerStorageStateMachineFor:(id)a3 isPrimary:(BOOL)a4
{
  BOOL v4 = a4;
  id key = a3;
  id v6 = [[IDSServerStorageMetricCollector alloc] initWithTopic:key isPrimary:v4];
  id v7 = v6;
  if (self->_metricCollectors)
  {
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  metricCollectors = self->_metricCollectors;
  self->_metricCollectors = Mutable;

  if (v7) {
LABEL_3:
  }
    CFDictionarySetValue((CFMutableDictionaryRef)self->_metricCollectors, key, v7);
LABEL_4:
}

- (void)stopCollectingMetricsForServerStorageStateMachineFor:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_metricCollectors objectForKey:v4];

  if (v5)
  {
    id v6 = [(NSMutableDictionary *)self->_metricCollectors objectForKey:v4];
    [v6 endCollector];
    [v6 reportMetric];
    [(NSMutableDictionary *)self->_metricCollectors removeObjectForKey:v4];
  }
  else
  {
    id v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)signed int v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Was told to stop, but we didnt have one in progress...", v8, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (void)_incrementMessagesFromStorageForTopic:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_metricCollectors objectForKey:v4];

  if (v5)
  {
    id v6 = [(NSMutableDictionary *)self->_metricCollectors objectForKey:v4];
    [v6 incrementMessageCount];
  }
  else
  {
    id v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)signed int v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Told about a message from server storage, but we dont have an ongoing metric for it, not able to incriment", v8, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (void)reissuePersistedRequests
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(IDSServerStorageStateMachine *)self _persistedTopics];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(IDSServerStorageStateMachine *)self incomingStorageRequestForTopic:*(void *)(*((void *)&v8 + 1) + 8 * (void)v7) primary:1 messageContext:0];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)metricCollectors
{
  return self->_metricCollectors;
}

- (void)_persistTopic:(id)a3
{
  id v7 = a3;
  id v4 = [(IDSServerStorageStateMachine *)self _persistedTopics];
  id v5 = [v4 mutableCopy];

  if (!v5) {
    id v5 = objc_alloc_init((Class)NSMutableArray);
  }
  if (([v5 containsObject:v7] & 1) == 0)
  {
    [v5 addObject:v7];
    uint64_t v6 = [(IDSServerStorageStateMachine *)self userDefaults];
    [v6 setAppValue:v5 forKey:@"IDSActiveStorageStateMachines"];
  }
}

- (void)_unpersistTopic:(id)a3
{
  id v9 = a3;
  id v4 = [(IDSServerStorageStateMachine *)self _persistedTopics];
  id v5 = [v4 mutableCopy];

  if ([v5 containsObject:v9])
  {
    [v5 removeObject:v9];
    id v6 = [v5 count];
    id v7 = [(IDSServerStorageStateMachine *)self userDefaults];
    long long v8 = v7;
    if (v6) {
      [v7 setAppValue:v5 forKey:@"IDSActiveStorageStateMachines"];
    }
    else {
      [v7 removeAppValueForKey:@"IDSActiveStorageStateMachines"];
    }
  }
}

- (id)_persistedTopics
{
  v2 = [(IDSServerStorageStateMachine *)self userDefaults];
  id v3 = [v2 appValueForKey:@"IDSActiveStorageStateMachines"];

  return v3;
}

- (IDSDeliveryController)deliveryController
{
  return self->_deliveryController;
}

- (void)setDeliveryController:(id)a3
{
}

- (IMUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (IDSServerBag)idsServerBag
{
  return self->_idsServerBag;
}

- (void)setIdsServerBag:(id)a3
{
}

- (NSMutableDictionary)deathTimerToTopicMap
{
  return self->_deathTimerToTopicMap;
}

- (void)setDeathTimerToTopicMap:(id)a3
{
}

- (NSMutableDictionary)currentStorageRetriesPerTopic
{
  return self->_currentStorageRetriesPerTopic;
}

- (void)setCurrentStorageRetriesPerTopic:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStorageRetriesPerTopic, 0);
  objc_storeStrong((id *)&self->_deathTimerToTopicMap, 0);
  objc_storeStrong((id *)&self->_idsServerBag, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_deliveryController, 0);
  objc_storeStrong((id *)&self->_metricCollectors, 0);
  objc_storeStrong((id *)&self->_pendingStorageRequests, 0);
  objc_storeStrong((id *)&self->_inflightStorageRequests, 0);

  objc_storeStrong((id *)&self->_lastReceivedMessageTimePerTopic, 0);
}

@end