@interface SKGUpdaterAgent
+ (BOOL)enableEventUpdaters;
+ (id)sharedAgent;
+ (void)initialize;
- (BOOL)_doStart;
- (BOOL)addClientConnectionIfAllowedForConnection:(id)a3;
- (BOOL)embeddingsSupported;
- (BOOL)enableAppEntities;
- (BOOL)enableDocumentUnderstanding;
- (BOOL)enableEmbeddings;
- (BOOL)enableIndexNotifier;
- (BOOL)enableKeyPhrases;
- (BOOL)enableProcessingStateUpdater;
- (BOOL)enableSuggestedEvents;
- (BOOL)handleCheckedInMessage:(id)a3;
- (BOOL)handleCommand:(const char *)a3 info:(id)a4 connection:(id)a5;
- (BOOL)handleDiagnose:(id)a3;
- (BOOL)handleDocumentUnderstandingProgressReport:(id)a3;
- (BOOL)handleEmbeddingProgressReport:(id)a3;
- (BOOL)handleEventsJournalsStats:(id)a3;
- (BOOL)handleProcessRecordMessage:(id)a3;
- (BOOL)handleSuggestedEventsProgressReport:(id)a3;
- (BOOL)handleTurboMessage:(id)a3;
- (BOOL)start;
- (OS_dispatch_queue)clientCheckInQueue;
- (OS_dispatch_queue)lockHandlerQueue;
- (id)encodeProgressReport:(id)a3;
- (id)formatProgressReport:(id)a3;
- (id)indexQueue;
- (void)_setup;
- (void)deviceStateWillChange:(BOOL)a3;
- (void)didReceiveMemoryPressureNotification:(unint64_t)a3;
- (void)didReceiveSignal:(unint64_t)a3;
- (void)locked;
- (void)locking;
- (void)setClientCheckInQueue:(id)a3;
- (void)setLockHandlerQueue:(id)a3;
- (void)unlocked;
@end

@implementation SKGUpdaterAgent

- (BOOL)handleCheckedInMessage:(id)a3
{
  id v4 = a3;
  v5 = sub_100050698();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "handleCheckedInMessage", buf, 2u);
  }

  id v6 = +[CSXPCConnection copyNSStringForKey:"bundleIdentifier" fromXPCDictionary:v4];
  v7 = +[SKGJobContext defaultJobContextWithDeviceUnlocked:1];
  v8 = +[SKGProcessorContext sharedContext];
  v9 = [v8 excludeBundles];
  if ([v9 containsObject:v6])
  {

LABEL_7:
    goto LABEL_8;
  }
  v10 = [v7 doNotUpdateDelegatesList];
  unsigned __int8 v11 = [v10 containsObject:v6];

  if ((v11 & 1) == 0)
  {
    v12 = [(SKGUpdaterAgent *)self clientCheckInQueue];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100012790;
    v16[3] = &unk_1000DAEB0;
    id v17 = v7;
    id v18 = v6;
    dispatch_async(v12, v16);

    v8 = v17;
    goto LABEL_7;
  }
LABEL_8:
  xpc_dictionary_get_remote_connection(v4);
  v13 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  xpc_dictionary_set_int64(reply, "status", 0);
  xpc_connection_send_message(v13, reply);

  return 1;
}

- (BOOL)handleCommand:(const char *)a3 info:(id)a4 connection:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = sub_100050698();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v20 = 136315394;
    v21 = a3;
    __int16 v22 = 2048;
    id v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "command %s info:%p", (uint8_t *)&v20, 0x16u);
  }

  if (strcmp(a3, "test"))
  {
    if (!strcmp(a3, "processCheckedInBundleID"))
    {
      if ([(SKGUpdaterAgent *)self handleCheckedInMessage:v8]) {
        goto LABEL_18;
      }
    }
    else if (!strcmp(a3, "processRecord"))
    {
      if ([(SKGUpdaterAgent *)self handleProcessRecordMessage:v8]) {
        goto LABEL_18;
      }
    }
    else if (!strcmp(a3, "turboMode"))
    {
      if ([(SKGUpdaterAgent *)self handleTurboMessage:v8]) {
        goto LABEL_18;
      }
    }
    else if (!strcmp(a3, "embeddingGenerationProgress"))
    {
      if ([(SKGUpdaterAgent *)self handleEmbeddingProgressReport:v8]) {
        goto LABEL_18;
      }
    }
    else if (!strcmp(a3, "eventsJournalsStats"))
    {
      if ([(SKGUpdaterAgent *)self handleEventsJournalsStats:v8]) {
        goto LABEL_18;
      }
    }
    else if (!strcmp(a3, "suggestedEventsGenerationProgress"))
    {
      if ([(SKGUpdaterAgent *)self handleSuggestedEventsProgressReport:v8]) {
        goto LABEL_18;
      }
    }
    else if (!strcmp(a3, "documentUnderstandingGenerationProgress"))
    {
      if ([(SKGUpdaterAgent *)self handleDocumentUnderstandingProgressReport:v8])
      {
        goto LABEL_18;
      }
    }
    else
    {
      if (strcmp(a3, "diagnose"))
      {
        if (byte_1000F8FF0 != 1) {
          goto LABEL_20;
        }
        if (strcmp(a3, "j")) {
          goto LABEL_20;
        }
        unsigned __int8 v11 = +[CSXPCEventListener sharedInstance];
        unsigned __int8 v12 = [v11 handleMessage:v8 connection:v9];

        if ((v12 & 1) == 0) {
          goto LABEL_20;
        }
LABEL_18:
        BOOL v15 = 1;
        goto LABEL_29;
      }
      if ([(SKGUpdaterAgent *)self handleDiagnose:v8]) {
        goto LABEL_18;
      }
    }
LABEL_20:
    xpc_object_t v13 = 0;
    int64_t v14 = -1;
    goto LABEL_21;
  }
  xpc_object_t v13 = xpc_data_create("TEST", 5uLL);

  int64_t v14 = 0;
LABEL_21:
  xpc_dictionary_get_remote_connection(v8);
  v16 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v8);
    id v18 = reply;
    BOOL v15 = reply != 0;
    if (reply)
    {
      xpc_dictionary_set_int64(reply, "status", v14);
      if (v13) {
        xpc_dictionary_set_data(v18, "data", "TEST", 5uLL);
      }
      xpc_connection_send_message(v16, v18);
    }
  }
  else
  {
    BOOL v15 = 0;
  }

LABEL_29:
  return v15;
}

- (OS_dispatch_queue)clientCheckInQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

+ (BOOL)enableEventUpdaters
{
  int v2 = _os_feature_enabled_impl();
  if (v2)
  {
    LOBYTE(v2) = _os_feature_enabled_impl();
  }
  return v2;
}

- (BOOL)enableProcessingStateUpdater
{
  int v2 = _os_feature_enabled_impl();
  if (v2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = 14;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SKGUpdater: %d disabled", (uint8_t *)v4, 8u);
  }
  return v2 ^ 1;
}

- (BOOL)enableAppEntities
{
  if (_os_feature_enabled_impl() && !_os_feature_enabled_impl()) {
    return 1;
  }
  BOOL v2 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v2)
  {
    v4[0] = 67109120;
    v4[1] = 10;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SKGUpdater: %d disabled", (uint8_t *)v4, 8u);
    return 0;
  }
  return result;
}

- (BOOL)enableEmbeddings
{
  if (_os_feature_enabled_impl())
  {
    BOOL v2 = +[SPEmbeddingModel sharedInstance];
    unsigned int v3 = [v2 deviceCanGenerateEmbeddings];

    if (v3)
    {
      if (!_os_feature_enabled_impl()) {
        return 1;
      }
    }
  }
  BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v4)
  {
    v6[0] = 67109120;
    v6[1] = 11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SKGUpdater: %d disabled", (uint8_t *)v6, 8u);
    return 0;
  }
  return result;
}

- (BOOL)embeddingsSupported
{
  BOOL result = 0;
  if (_os_feature_enabled_impl())
  {
    BOOL v2 = +[SPEmbeddingModel sharedInstance];
    unsigned int v3 = [v2 hardwareSupportsEmbedding];

    if (v3)
    {
      if (!_os_feature_enabled_impl()) {
        return 1;
      }
    }
  }
  return result;
}

- (BOOL)enableKeyPhrases
{
  if (_os_feature_enabled_impl() && !_os_feature_enabled_impl()) {
    return 1;
  }
  BOOL v2 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v2)
  {
    v4[0] = 67109120;
    v4[1] = 12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SKGUpdater: %d disabled", (uint8_t *)v4, 8u);
    return 0;
  }
  return result;
}

- (BOOL)enableSuggestedEvents
{
  if _os_feature_enabled_impl() && (_os_feature_enabled_impl()) {
    return 1;
  }
  BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v3)
  {
    v4[0] = 67109120;
    v4[1] = 15;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SKGUpdater: %d disabled", (uint8_t *)v4, 8u);
    return 0;
  }
  return result;
}

- (BOOL)enableIndexNotifier
{
  if ([(SKGUpdaterAgent *)self enableEmbeddings]
    && _os_feature_enabled_impl()
    && !_os_feature_enabled_impl())
  {
    return 1;
  }
  BOOL v2 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v2)
  {
    v4[0] = 67109120;
    v4[1] = 13;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SKGUpdater: %d disabled", (uint8_t *)v4, 8u);
    return 0;
  }
  return result;
}

- (BOOL)enableDocumentUnderstanding
{
  if _os_feature_enabled_impl() && (_os_feature_enabled_impl()) {
    return 1;
  }
  BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v3)
  {
    v4[0] = 67109120;
    v4[1] = 16;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SKGUpdater: %d disabled", (uint8_t *)v4, 8u);
    return 0;
  }
  return result;
}

+ (id)sharedAgent
{
  return (id)qword_1000F8FE8;
}

+ (void)initialize
{
  if (+[SKGUpdaterAgent enableEventUpdaters])
  {
    byte_1000F8FF0 = 1;
    +[CSEventListenerTasksManager eventListenerManagerPowerStateInit];
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = byte_1000F8FF0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sEnableCSEventListener: %d", (uint8_t *)v4, 8u);
  }
  id v2 = [[SKGUpdaterAgent alloc] initMachServiceListenerWithName:@"com.apple.spotlightknowledged" enableConnectionLogging:0];
  BOOL v3 = (void *)qword_1000F8FE8;
  qword_1000F8FE8 = (uint64_t)v2;

  [(id)qword_1000F8FE8 _setup];
}

- (BOOL)start
{
  BOOL v3 = +[SDLockHandler sharedLockHandler];
  unsigned __int8 v4 = [v3 unlockedSinceBoot];

  if (v4)
  {
    return [(SKGUpdaterAgent *)self _doStart];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "### delaying SKGUpdaterAgent start until first unlock", v6, 2u);
    }
    return 1;
  }
}

- (BOOL)_doStart
{
  if ((atomic_exchange((atomic_uchar *volatile)&self->_didStart, 1u) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "### SKGUpdaterAgent _doStart", (uint8_t *)&v18, 2u);
    }
    [(SKGUpdaterAgent *)self startListener];
    if (byte_1000F8FF0 == 1)
    {
      BOOL v3 = objc_opt_new();
      if ([(SKGUpdaterAgent *)self enableProcessingStateUpdater])
      {
        unsigned __int8 v4 = objc_opt_new();
        [v3 addObject:v4];
      }
      if ([(SKGUpdaterAgent *)self enableAppEntities])
      {
        v5 = objc_opt_new();
        [v3 addObject:v5];
      }
      if ([(SKGUpdaterAgent *)self enableKeyPhrases])
      {
        id v6 = +[SKGProcessor sharedProcessor];
        [v6 loadKeyphraser];

        v7 = objc_opt_new();
        [v3 addObject:v7];
      }
      if ([(SKGUpdaterAgent *)self embeddingsSupported])
      {
        if ([(SKGUpdaterAgent *)self enableEmbeddings])
        {
          id v8 = +[SKGProcessor sharedProcessor];
          [v8 loadEmbedder];

          +[CSEventFeedback logEmbeddingPrewarmRequestTime];
        }
        id v9 = objc_opt_new();
        [v3 addObject:v9];

        v10 = objc_opt_new();
        [v3 addObject:v10];

        uint64_t v11 = 0;
        do
        {
          if ((v11 & 0x7FFFFFFD) == 1) {
            id v12 = +[EmbeddingCache initInstanceWithType:v11 name:@"embedding_store.db"];
          }
          uint64_t v11 = (v11 + 1);
        }
        while (v11 != 6);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 67109120;
        LODWORD(v19) = 11;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SKGUpdater: %d disabled", (uint8_t *)&v18, 8u);
      }
      if ([(SKGUpdaterAgent *)self enableSuggestedEvents])
      {
        xpc_object_t v13 = objc_opt_new();
        [v3 addObject:v13];
      }
      if ([(SKGUpdaterAgent *)self enableIndexNotifier])
      {
        int64_t v14 = objc_opt_new();
        [v3 addObject:v14];
      }
      if ([(SKGUpdaterAgent *)self enableDocumentUnderstanding])
      {
        BOOL v15 = objc_opt_new();
        [v3 addObject:v15];
      }
      if ([v3 count])
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 138412290;
          v19 = v3;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v18, 0xCu);
        }
        v16 = +[CSXPCEventListener sharedInstance];
        [v16 startWithEventListeners:v3];
      }
      else
      {
        +[CSXPCEventListener disable];
      }
      +[CSEventListenerTasksManager eventListenerManagerSetupScheduler];
    }
  }
  return 1;
}

- (void)_setup
{
  +[SDSignalHandler setDelegate:self memoryStatusFlags:55];
  +[SDSignalHandler setupHandlers];
  BOOL v3 = dispatch_queue_attr_make_with_overcommit();
  unsigned __int8 v4 = dispatch_queue_attr_make_with_autorelease_frequency(v3, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_BACKGROUND, 0);
  id v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.spotlightknowledged.lockhandlerqueue", v5);
  lockHandlerQueue = self->_lockHandlerQueue;
  self->_lockHandlerQueue = v6;

  +[SDLockHandler setLockHandlerWithDelegate:self options:0];
  id v12 = +[SDLockHandler sharedLockHandler];
  [v12 start];
  id v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UTILITY, 0);
  v10 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.spotlightknowledged.client-check-in", v9);
  clientCheckInQueue = self->_clientCheckInQueue;
  self->_clientCheckInQueue = v10;
}

- (BOOL)addClientConnectionIfAllowedForConnection:(id)a3
{
  BOOL v3 = (_xpc_connection_s *)a3;
  pid_t pid = xpc_connection_get_pid(v3);
  xpc_connection_get_audit_token();

  memset(&token, 0, sizeof(token));
  v5 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
  if (v5)
  {
    id v6 = v5;
    v7 = (void *)SecTaskCopyValueForEntitlement(v5, @"com.apple.private.corespotlight.skgupdater", 0);
    unsigned int v8 = [v7 BOOLValue];
    id v9 = sub_100050698();
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        token.val[0] = 67109120;
        token.val[1] = pid;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "New sender connection for pid: %d", (uint8_t *)&token, 8u);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      sub_1000A0D5C(pid, v10);
    }

    CFRelease(v6);
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (void)didReceiveSignal:(unint64_t)a3
{
  unsigned __int8 v4 = sub_100050698();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 134217984;
    unint64_t v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "didReceiveSignal %ld", (uint8_t *)&v5, 0xCu);
  }

  if (a3 == 15) {
    exit(0);
  }
}

- (void)didReceiveMemoryPressureNotification:(unint64_t)a3
{
  unsigned __int8 v4 = sub_100050698();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 134217984;
    unint64_t v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "didReceiveMemoryPressureNotification %llx", (uint8_t *)&v5, 0xCu);
  }
}

- (id)indexQueue
{
  return self->_lockHandlerQueue;
}

- (void)deviceStateWillChange:(BOOL)a3
{
  if (a3) {
    [(SKGUpdaterAgent *)self _doStart];
  }
}

- (void)locking
{
  id v2 = sub_100050698();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned __int8 v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "[LOCK] received locking", v4, 2u);
  }

  BOOL v3 = +[CSXPCEventListener sharedInstance];
  [v3 handleDeviceLocking];
}

- (void)locked
{
  id v2 = sub_100050698();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "[LOCK] received locked", v3, 2u);
  }
}

- (void)unlocked
{
  id v2 = sub_100050698();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned __int8 v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "[LOCK] received unlocked", v4, 2u);
  }

  BOOL v3 = +[CSXPCEventListener sharedInstance];
  [v3 handleDeviceUnlocked];
}

- (id)encodeProgressReport:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    unsigned __int8 v4 = objc_opt_new();
    v52 = objc_opt_new();
    v51 = objc_opt_new();
    v50 = objc_opt_new();
    v49 = objc_opt_new();
    v48 = objc_opt_new();
    v47 = objc_opt_new();
    v46 = objc_opt_new();
    v45 = objc_opt_new();
    xpc_object_t xdict = xpc_dictionary_create_empty();
    xpc_object_t empty = xpc_array_create_empty();
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v44 = v3;
    id v6 = v3;
    id v7 = [v6 countByEnumeratingWithState:&v53 objects:v57 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v54;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v54 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          if (([v11 isEqualToString:@"Total"] & 1) == 0)
          {
            id v12 = v11;
            xpc_object_t v13 = xpc_string_create((const char *)[v12 UTF8String]);
            xpc_array_append_value(empty, v13);

            int64_t v14 = [v6 objectForKeyedSubscript:v12];
            BOOL v15 = [v14 objectForKeyedSubscript:@"itemsProcessed"];
            [v4 setObject:v15 forKeyedSubscript:v12];

            v16 = [v6 objectForKeyedSubscript:v12];
            id v17 = [v16 objectForKeyedSubscript:@"itemsNeedProcessing"];
            [v52 setObject:v17 forKeyedSubscript:v12];

            int v18 = [v6 objectForKeyedSubscript:v12];
            v19 = [v18 objectForKeyedSubscript:@"itemsNeedEmbeddings"];
            [v51 setObject:v19 forKeyedSubscript:v12];

            int v20 = [v6 objectForKeyedSubscript:v12];
            v21 = [v20 objectForKeyedSubscript:@"itemsWithPrimaryTextEmbedding"];
            [v50 setObject:v21 forKeyedSubscript:v12];

            __int16 v22 = [v6 objectForKeyedSubscript:v12];
            id v23 = [v22 objectForKeyedSubscript:@"itemsWithSecondaryTextEmbedding"];
            [v49 setObject:v23 forKeyedSubscript:v12];

            v24 = [v6 objectForKeyedSubscript:v12];
            v25 = [v24 objectForKeyedSubscript:@"itemsNeedSuggestedEvents"];
            [v48 setObject:v25 forKeyedSubscript:v12];

            v26 = [v6 objectForKeyedSubscript:v12];
            v27 = [v26 objectForKeyedSubscript:@"itemsWithSuggestedEvents"];
            [v47 setObject:v27 forKeyedSubscript:v12];

            v28 = [v6 objectForKeyedSubscript:v12];
            v29 = [v28 objectForKeyedSubscript:@"itemsNeedDocumentUnderstanding"];
            [v46 setObject:v29 forKeyedSubscript:v12];

            v30 = [v6 objectForKeyedSubscript:v12];
            v31 = [v30 objectForKeyedSubscript:@"itemsWithDocumentUnderstanding"];
            [v45 setObject:v31 forKeyedSubscript:v12];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v53 objects:v57 count:16];
      }
      while (v8);
    }

    v32 = xdict;
    xpc_dictionary_set_value(xdict, "bundleIDs", empty);
    v33 = sub_10004DA44(v4);
    xpc_dictionary_set_value(xdict, "itemsProcessedDict", v33);

    v34 = sub_10004DA44(v52);
    xpc_dictionary_set_value(xdict, "itemsNeedProcessingDict", v34);

    v35 = sub_10004DA44(v51);
    xpc_dictionary_set_value(xdict, "itemsNeedEmbedDict", v35);

    v36 = sub_10004DA44(v50);
    xpc_dictionary_set_value(xdict, "itemsWithPrimaryTextEmbeddingDict", v36);

    v37 = sub_10004DA44(v49);
    xpc_dictionary_set_value(xdict, "itemsWithSecondaryTextEmbeddingDict", v37);

    v38 = sub_10004DA44(v48);
    xpc_dictionary_set_value(xdict, "itemsNeedSuggestedEventsDict", v38);

    v39 = sub_10004DA44(v47);
    xpc_dictionary_set_value(xdict, "itemsWithSuggestedEventsDict", v39);

    v40 = sub_10004DA44(v46);
    xpc_dictionary_set_value(xdict, "itemsNeedDocumentUnderstandingDict", v40);

    v41 = sub_10004DA44(v45);
    xpc_dictionary_set_value(xdict, "itemsWithDocumentUnderstandingDict", v41);

    id v3 = v44;
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (id)formatProgressReport:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableString);
  int v5 = [@"Bundle" stringByPaddingToLength:50 withString:@" " startingAtIndex:0];
  [v4 appendString:v5];

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v6 = [&off_1000E7380 countByEnumeratingWithState:&v54 objects:v61 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v55;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v55 != v8) {
          objc_enumerationMutation(&off_1000E7380);
        }
        v10 = [*(id *)(*((void *)&v54 + 1) + 8 * i) stringByPaddingToLength:35 withString:@" " startingAtIndex:0];
        [v4 appendString:v10];
      }
      id v7 = [&off_1000E7380 countByEnumeratingWithState:&v54 objects:v61 count:16];
    }
    while (v7);
  }
  [v4 appendString:@"\n"];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v11 = v3;
  id v12 = [v11 countByEnumeratingWithState:&v50 objects:v60 count:16];
  if (v12)
  {
    id v13 = v12;
    int64_t v14 = 0;
    uint64_t v15 = *(void *)v51;
    uint64_t v37 = *(void *)v51;
    id v38 = v11;
    do
    {
      uint64_t v16 = 0;
      id v39 = v13;
      do
      {
        if (*(void *)v51 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v41 = v16;
        id v17 = *(void **)(*((void *)&v50 + 1) + 8 * v16);
        if ([v17 isEqual:@"Total"])
        {
          [v11 objectForKeyedSubscript:@"Total"];
          v14 = int v18 = v14;
        }
        else
        {
          v40 = v14;
          v19 = [v17 stringByPaddingToLength:50 withString:@" " startingAtIndex:0];
          [v4 appendString:v19];

          int v18 = [v11 objectForKeyedSubscript:v17];
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          id v20 = [&off_1000E7380 countByEnumeratingWithState:&v46 objects:v59 count:16];
          if (v20)
          {
            id v21 = v20;
            uint64_t v22 = *(void *)v47;
            do
            {
              for (j = 0; j != v21; j = (char *)j + 1)
              {
                if (*(void *)v47 != v22) {
                  objc_enumerationMutation(&off_1000E7380);
                }
                v24 = [v18 objectForKeyedSubscript:*(void *)(*((void *)&v46 + 1) + 8 * (void)j)];
                v25 = +[NSString stringWithFormat:@"%@", v24];
                v26 = [v25 stringByPaddingToLength:35 withString:@" " startingAtIndex:0];
                [v4 appendString:v26];
              }
              id v21 = [&off_1000E7380 countByEnumeratingWithState:&v46 objects:v59 count:16];
            }
            while (v21);
          }
          [v4 appendString:@"\n"];
          id v11 = v38;
          id v13 = v39;
          int64_t v14 = v40;
          uint64_t v15 = v37;
        }

        uint64_t v16 = v41 + 1;
      }
      while ((id)(v41 + 1) != v13);
      id v13 = [v11 countByEnumeratingWithState:&v50 objects:v60 count:16];
    }
    while (v13);

    if (v14)
    {
      v27 = [@"Total" stringByPaddingToLength:50 withString:@" " startingAtIndex:0];
      [v4 appendString:v27];

      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v28 = [&off_1000E7380 countByEnumeratingWithState:&v42 objects:v58 count:16];
      if (v28)
      {
        id v29 = v28;
        uint64_t v30 = *(void *)v43;
        do
        {
          for (k = 0; k != v29; k = (char *)k + 1)
          {
            if (*(void *)v43 != v30) {
              objc_enumerationMutation(&off_1000E7380);
            }
            [v14 objectForKeyedSubscript:*(void *)(*((void *)&v42 + 1) + 8 * (void)k)];
            v33 = v32 = v14;
            v34 = +[NSString stringWithFormat:@"%@", v33];
            v35 = [v34 stringByPaddingToLength:35 withString:@" " startingAtIndex:0];
            [v4 appendString:v35];

            int64_t v14 = v32;
          }
          id v29 = [&off_1000E7380 countByEnumeratingWithState:&v42 objects:v58 count:16];
        }
        while (v29);
      }
      [v4 appendString:@"\n"];
      id v11 = v38;
    }
  }
  else
  {

    int64_t v14 = 0;
  }

  return v4;
}

- (BOOL)handleEmbeddingProgressReport:(id)a3
{
  id v4 = a3;
  int v5 = sub_100050698();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "handleEmbeddingProgressReport", v14, 2u);
  }

  xpc_dictionary_get_remote_connection(v4);
  id v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  xpc_dictionary_set_int64(reply, "status", 0);
  uint64_t v9 = +[SKGJobContext defaultJobContextWithDeviceUnlocked:1];
  v10 = [[SKGJob alloc] initWithJobContext:v9];
  id v11 = [(SKGJob *)v10 generateCSEmbeddingsReportWithCancelBlock:&stru_1000DAED0];
  id v12 = [(SKGUpdaterAgent *)self encodeProgressReport:v11];
  if (v12) {
    xpc_dictionary_set_value(reply, "embeddingReport", v12);
  }

  xpc_connection_send_message(v6, reply);

  return 1;
}

- (BOOL)handleEventsJournalsStats:(id)a3
{
  id v3 = a3;
  id v4 = sub_100050698();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "handleEventsJournalsStats", v11, 2u);
  }

  xpc_dictionary_get_remote_connection(v3);
  int v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_object_t reply = xpc_dictionary_create_reply(v3);
  xpc_dictionary_set_int64(reply, "status", 0);
  uint64_t v8 = +[CSEventJournalStats generateStats];
  uint64_t v9 = sub_10004E358(v8);
  if (v9) {
    xpc_dictionary_set_value(reply, "journalsStats", v9);
  }

  xpc_connection_send_message(v5, reply);

  return 1;
}

- (BOOL)handleSuggestedEventsProgressReport:(id)a3
{
  id v4 = a3;
  int v5 = sub_100050698();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "handleSuggestedEventsProgressReport", v14, 2u);
  }

  xpc_dictionary_get_remote_connection(v4);
  id v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  xpc_dictionary_set_int64(reply, "status", 0);
  uint64_t v9 = +[SKGJobContext defaultJobContextWithDeviceUnlocked:1];
  v10 = [[SKGJob alloc] initWithJobContext:v9];
  id v11 = [(SKGJob *)v10 generateCSSuggestedEventsReportWithCancelBlock:&stru_1000DAEF0];
  id v12 = [(SKGUpdaterAgent *)self encodeProgressReport:v11];
  if (v12) {
    xpc_dictionary_set_value(reply, "suggestedEventsReport", v12);
  }

  xpc_connection_send_message(v6, reply);

  return 1;
}

- (BOOL)handleDocumentUnderstandingProgressReport:(id)a3
{
  id v4 = a3;
  int v5 = sub_100050698();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "handleDocumentUnderstandingProgressReport", v14, 2u);
  }

  xpc_dictionary_get_remote_connection(v4);
  id v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  xpc_dictionary_set_int64(reply, "status", 0);
  uint64_t v9 = +[SKGJobContext defaultJobContextWithDeviceUnlocked:1];
  v10 = [[SKGJob alloc] initWithJobContext:v9];
  id v11 = [(SKGJob *)v10 generateCSDocumentUnderstandingReportWithCancelBlock:&stru_1000DAF10];
  id v12 = [(SKGUpdaterAgent *)self encodeProgressReport:v11];
  if (v12) {
    xpc_dictionary_set_value(reply, "documentUnderstandingReport", v12);
  }

  xpc_connection_send_message(v6, reply);

  return 1;
}

- (BOOL)handleProcessRecordMessage:(id)a3
{
  id v3 = a3;
  id v4 = sub_100050698();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "handleProcessRecord", buf, 2u);
  }

  unsigned int v5 = +[CSXPCConnection copyBoolForKey:"includeEmbeddings" fromXPCDictionary:v3];
  unsigned int v6 = +[CSXPCConnection copyBoolForKey:"includeKeyphrases" fromXPCDictionary:v3];
  unsigned int v7 = +[CSXPCConnection copyBoolForKey:"includeSuggestedEvents" fromXPCDictionary:v3];
  if ((v6 & 1) == 0 && (v5 & 1) == 0 && !v7)
  {
    LOBYTE(v8) = 0;
    uint64_t v9 = 0;
    id v10 = 0;
LABEL_24:
    uint64_t v15 = 0;
    goto LABEL_25;
  }
  id v10 = +[CSXPCConnection copyNSStringForKey:"protectionClass" fromXPCDictionary:v3];
  if (!v10)
  {
    LOBYTE(v8) = 0;
    uint64_t v9 = 0;
    goto LABEL_24;
  }
  id v11 = objc_alloc((Class)CSDecoder);
  id v12 = +[CSXPCConnection copyNSDataForKey:"record" fromXPCDictionary:v3];
  id v13 = [v11 initWithData:v12];
  uint64_t v9 = [v13 decode];

  if (!v9)
  {
    LOBYTE(v8) = 0;
    goto LABEL_24;
  }
  int64_t v14 = +[SKGProcessor sharedProcessor];
  unsigned int v8 = [v14 recordIsValid:v9];

  if (v8)
  {
    xpc_dictionary_get_remote_connection(v3);
    uint64_t v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    if (!v15 || (xpc_object_t reply = xpc_dictionary_create_reply(v3)) == 0)
    {
      LOBYTE(v8) = 0;
      goto LABEL_25;
    }
    v25 = reply;
    id v17 = +[CSXPCConnection copyNSStringForKey:"referenceIdentifier" fromXPCDictionary:v3];
    if (v5)
    {
      int v18 = +[SKGProcessor sharedProcessor];
      [v18 loadEmbedder];
    }
    if (v6)
    {
      v19 = +[SKGProcessor sharedProcessor];
      [v19 loadKeyphraser];
    }
    *(void *)buf = 0;
    uint64_t v30 = buf;
    uint64_t v31 = 0x2020000000;
    int v32 = -1;
    id v20 = +[SKGProcessor sharedProcessor];
    uint64_t v21 = 2;
    if (!v5) {
      uint64_t v21 = 0;
    }
    if (v6) {
      uint64_t v22 = v21 | 4;
    }
    else {
      uint64_t v22 = v21;
    }
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10004EB6C;
    v26[3] = &unk_1000DAF38;
    id v23 = v25;
    id v27 = v23;
    id v28 = buf;
    [v20 enumerateProcessedItemsFromRecord:v9 referenceIdentifier:v17 bundleIdentifier:0 protectionClass:v10 processorFlags:v22 processedItemBlock:v26 cancelBlock:&stru_1000DAF78];

    xpc_dictionary_set_int64(v23, "status", *((int *)v30 + 6));
    xpc_connection_send_message(v15, v23);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v15 = 0;
    id v23 = v9;
    uint64_t v9 = 0;
  }

LABEL_25:
  return v8;
}

- (BOOL)handleTurboMessage:(id)a3
{
  id v3 = a3;
  id v4 = sub_100050698();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "handleTurboMessage", v7, 2u);
  }

  BOOL v5 = xpc_dictionary_get_BOOL(v3, "state");
  +[CSEventListenerTasksManager setTurboMode:v5];
  return 1;
}

- (BOOL)handleDiagnose:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_100050698();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "handleDiagnose", buf, 2u);
  }

  v25 = +[SKGJobContext defaultJobContextWithDeviceUnlocked:1];
  unsigned int v6 = [[SKGJob alloc] initWithJobContext:v25];
  unsigned int v7 = [(SKGJob *)v6 generateCSEmbeddingsReportWithCancelBlock:&stru_1000DAF98];
  id v8 = +[CSXPCConnection copyNSStringForKey:"path" fromXPCDictionary:v4];
  uint64_t v9 = +[NSString stringWithFormat:@"%@/%@", v8, @"embedding-status.log"];

  id v10 = [(SKGUpdaterAgent *)self formatProgressReport:v7];
  [v10 writeToFile:v9 atomically:1 encoding:4 error:0];

  id v11 = +[CSEventJournalStats generateStats];

  id v12 = +[CSXPCConnection copyNSStringForKey:"path" fromXPCDictionary:v4];
  id v13 = +[NSString stringWithFormat:@"%@/%@", v12, @"events-journals-stats.log"];

  int64_t v14 = +[CSEventJournalStatsFormatter tabulateStats:v11];
  [v14 writeToFile:v13 atomically:1 encoding:4 error:0];

  id v15 = +[CSXPCConnection copyNSStringForKey:"path" fromXPCDictionary:v4];
  uint64_t v16 = +[NSString stringWithFormat:@"%@/%@", v15, @"SKGActivityJournal.log"];

  id v17 = +[SKGActivityJournal sharedJournal];
  int v18 = [v17 path];

  v19 = +[NSFileManager defaultManager];
  LODWORD(v6) = [v19 fileExistsAtPath:v18];

  if (v6)
  {
    id v20 = +[NSFileManager defaultManager];
    unsigned int v21 = [v20 fileExistsAtPath:v16];

    if (v21)
    {
      uint64_t v22 = +[NSFileManager defaultManager];
      [v22 removeItemAtPath:v16 error:0];
    }
    id v23 = +[NSFileManager defaultManager];
    [v23 copyItemAtPath:v18 toPath:v16 error:0];
  }
  return 1;
}

- (OS_dispatch_queue)lockHandlerQueue
{
  return self->_lockHandlerQueue;
}

- (void)setLockHandlerQueue:(id)a3
{
}

- (void)setClientCheckInQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientCheckInQueue, 0);

  objc_storeStrong((id *)&self->_lockHandlerQueue, 0);
}

@end