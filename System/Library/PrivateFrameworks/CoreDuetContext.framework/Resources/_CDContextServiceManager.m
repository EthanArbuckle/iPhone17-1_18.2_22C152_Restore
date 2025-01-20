@interface _CDContextServiceManager
+ (id)sharedInstance;
- (CDMonitorManager)monitorManager;
- (_CDContextServiceManager)init;
- (id)_extractInteractionsFromEvents:(id)a3 onStream:(id)a4;
- (void)_recordInteractions:(id)a3 enforceDataLimits:(BOOL)a4 enforcePrivacy:(BOOL)a5 reply:(id)a6;
- (void)_setUpServices;
@end

@implementation _CDContextServiceManager

- (id)_extractInteractionsFromEvents:(id)a3 onStream:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 eventStreamProperties];
  v8 = [v7 name];
  unsigned __int8 v9 = [v8 isEqualToString:@"CallInProgress"];

  if (v9)
  {
    v10 = (id *)_DKCallMetadataKey_ptr;
  }
  else
  {
    v11 = [v6 eventStreamProperties];
    v12 = [v11 name];
    unsigned int v13 = [v12 isEqualToString:@"NextCalendarEvent"];

    if (!v13)
    {
LABEL_17:
      v16 = 0;
      goto LABEL_18;
    }
    v10 = (id *)_DKCalendarMetadataKey_ptr;
  }
  uint64_t v14 = [*v10 interaction];
  if (!v14) {
    goto LABEL_17;
  }
  v15 = (void *)v14;
  id v28 = v6;
  v16 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v29 = v5;
  id v17 = v5;
  id v18 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v31;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v23 = [v22 metadata];
        v24 = [v23 objectForKeyedSubscript:v15];

        if (v24 && [v24 mechanism] != (id)5) {
          [v16 addObject:v24];
        }
        v25 = [v22 metadata];
        id v26 = [v25 mutableCopy];

        [v26 removeObjectForKey:v15];
        [v22 setMetadata:v26];
      }
      id v19 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v19);
  }

  id v6 = v28;
  id v5 = v29;
LABEL_18:

  return v16;
}

+ (id)sharedInstance
{
  if (qword_10000CBF0 != -1) {
    dispatch_once(&qword_10000CBF0, &stru_100008310);
  }
  v2 = (void *)qword_10000CBE8;
  return v2;
}

- (_CDContextServiceManager)init
{
  v3 = +[_CDLogging knowledgeSignpost];
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_CDContextServiceManagerInit", " enableTelemetry=YES ", buf, 2u);
  }

  v37.receiver = self;
  v37.super_class = (Class)_CDContextServiceManager;
  v4 = [(_CDContextServiceManager *)&v37 init];
  if (v4)
  {
    id v5 = +[_CDPaths knowledgeDirectory];
    id v6 = +[_CDCoreDataContextPersisting persistenceWithDirectory:v5];
    v7 = +[_CDSharedMemoryKeyValueStore sharedInstance];
    v8 = +[_CDSharedMemoryContextPersisting persistenceWithSharedMemoryKeyValueStore:v7];

    unsigned __int8 v9 = +[_CDPolicyBasedPersisting persistenceWithPersistenceSurvivingReboot:v6 persistenceSurvivingRelaunch:v8];
    uint64_t v10 = +[_CDUserContextService sharedInstanceWithPersistence:v9];
    userContextDaemon = v4->_userContextDaemon;
    v4->_userContextDaemon = (_CDUserContextService *)v10;

    uint64_t v12 = +[_CDEventStreams sharedInstance];
    eventStreams = v4->_eventStreams;
    v4->_eventStreams = (_CDEventStreams *)v12;

    uint64_t v14 = +[CDMonitorManager monitorManagerForEventStreams:v4->_eventStreams domain:1];
    monitorManager = v4->_monitorManager;
    v4->_monitorManager = (CDMonitorManager *)v14;

    v16 = objc_alloc_init(CDNotifydMonitor);
    notifyMonitor = v4->_notifyMonitor;
    v4->_notifyMonitor = v16;

    uint64_t v18 = +[_DKKnowledgeStore knowledgeStoreWithDirectReadWriteAccess];
    knowledgeStore = v4->_knowledgeStore;
    v4->_knowledgeStore = (_DKKnowledgeStore *)v18;

    uint64_t v20 = +[_CDInteractionPolicies interactionPolicies];
    interactionPolicies = v4->_interactionPolicies;
    v4->_interactionPolicies = (_CDInteractionPolicies *)v20;

    v22 = +[_CDInteractionStore defaultDatabaseDirectory];
    uint64_t v23 = +[_CDInteractionStore storeWithDirectory:v22 readOnly:0];
    interactionStore = v4->_interactionStore;
    v4->_interactionStore = (_CDInteractionStore *)v23;

    [(_CDContextServiceManager *)v4 _setUpServices];
    v25 = (_CDModeClassifier *)objc_alloc_init((Class)_CDModeClassifier);
    modeClassifier = v4->_modeClassifier;
    v4->_modeClassifier = v25;

    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x2050000000;
    v27 = (void *)qword_10000CBF8;
    uint64_t v46 = qword_10000CBF8;
    if (!qword_10000CBF8)
    {
      *(void *)buf = _NSConcreteStackBlock;
      uint64_t v39 = 3221225472;
      v40 = sub_10000537C;
      v41 = &unk_100008480;
      v42 = &v43;
      sub_1000053CC();
      Class Class = objc_getClass("CUObjCEvidenceSystem");
      *(void *)(v42[1] + 24) = Class;
      qword_10000CBF8 = *(void *)(v42[1] + 24);
      v27 = (void *)v44[3];
    }
    id v29 = v27;
    _Block_object_dispose(&v43, 8);
    if (v29)
    {
      [v29 start];
      long long v30 = +[_CDLogging contextChannel];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "CUEvidenceSystem started", buf, 2u);
      }
    }
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x2050000000;
    long long v31 = (void *)qword_10000CC08;
    uint64_t v46 = qword_10000CC08;
    if (!qword_10000CC08)
    {
      *(void *)buf = _NSConcreteStackBlock;
      uint64_t v39 = 3221225472;
      v40 = sub_100005510;
      v41 = &unk_100008480;
      v42 = &v43;
      sub_1000053CC();
      Class v32 = objc_getClass("CUObjCInferenceEngine");
      *(void *)(v42[1] + 24) = v32;
      qword_10000CC08 = *(void *)(v42[1] + 24);
      long long v31 = (void *)v44[3];
    }
    id v33 = v31;
    _Block_object_dispose(&v43, 8);
    if (v33)
    {
      [v33 start];
      v34 = +[_CDLogging contextChannel];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "CUInferenceEngine started", buf, 2u);
      }
    }
  }
  v35 = +[_CDLogging knowledgeSignpost];
  if (os_signpost_enabled(v35))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v35, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_CDContextServiceManagerInit", (const char *)&unk_100006DA9, buf, 2u);
  }

  return v4;
}

- (void)_setUpServices
{
  +[_CDEventStreams loadAllEventStreams];
  [(_CDUserContextService *)self->_userContextDaemon start];
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);

  dispatch_queue_t v5 = dispatch_queue_create("com.apple.coreduetd.serviceManager.historical background", v4);
  objc_initWeak(&location, self);
  monitorManager = self->_monitorManager;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100004450;
  v13[3] = &unk_1000083F0;
  v7 = v5;
  uint64_t v14 = v7;
  objc_copyWeak(&v15, &location);
  [(CDMonitorManager *)monitorManager setHistoricalHandler:v13];
  v8 = self->_monitorManager;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100004DD0;
  v10[3] = &unk_100008418;
  unsigned __int8 v9 = v7;
  v11 = v9;
  objc_copyWeak(&v12, &location);
  [(CDMonitorManager *)v8 setHistoricalDeletingHandler:v10];
  [(CDMonitorManager *)self->_monitorManager setShutdownHandler:&stru_100008458];
  [(CDMonitorManager *)self->_monitorManager start];
  objc_destroyWeak(&v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)_recordInteractions:(id)a3 enforceDataLimits:(BOOL)a4 enforcePrivacy:(BOOL)a5 reply:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  interactionPolicies = self->_interactionPolicies;
  v11 = (void (**)(id, id))a6;
  id v12 = [(_CDInteractionPolicies *)interactionPolicies filterAndModifyInteractionsWithPolicies:a3 enforceDataLimits:v7 enforcePrivacy:v6];
  unsigned int v13 = +[_CDLogging instrumentationChannel];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_100005D08(v12);
  }

  interactionStore = self->_interactionStore;
  uint64_t v15 = 0;
  v11[2](v11, [(_CDInteractionStore *)interactionStore recordInteractions:v12 error:&v15]);
}

- (CDMonitorManager)monitorManager
{
  return self->_monitorManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitorManager, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);
  objc_storeStrong((id *)&self->_interactionPolicies, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_notifyMonitor, 0);
  objc_storeStrong((id *)&self->_modeClassifier, 0);
  objc_storeStrong((id *)&self->_eventStreams, 0);
  objc_storeStrong((id *)&self->_userContextDaemon, 0);
}

@end