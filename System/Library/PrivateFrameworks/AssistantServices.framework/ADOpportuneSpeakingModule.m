@interface ADOpportuneSpeakingModule
+ (id)sharedModule;
- (ADOpportuneSpeakingStateManager)stateManager;
- (id)_connectionToOSMService;
- (id)_init;
- (id)_remoteOSMService;
- (void)_cleanUpAllModels;
- (void)_finishRunningCurrentSpeakableWithResult:(int64_t)a3 error:(id)a4;
- (void)_loadModelWithType:(int64_t)a3 completion:(id)a4;
- (void)_processEnqueuedSpeakables;
- (void)_recordImmediateNotificationInteractionAfterRecommendation:(int64_t)a3 forSpeakable:(id)a4;
- (void)_resetConnectionToOSMService;
- (void)_withAllModelsExecute:(id)a3;
- (void)modelWithIdentifier:(id)a3 didUpdateScore:(float)a4 forSpeakable:(id)a5;
- (void)recordSpokenRequestCancelledForSpeakable:(id)a3;
- (void)recordSpokenRequestCompletedForSpeakable:(id)a3;
- (void)requestsToSpeak:(id)a3 withHandler:(id)a4;
@end

@implementation ADOpportuneSpeakingModule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateManager, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_typeMap, 0);
  objc_storeStrong((id *)&self->_modelMap, 0);
  objc_storeStrong((id *)&self->_executionModelIdentifier, 0);
  objc_storeStrong((id *)&self->_handlersBySpeakableID, 0);
  objc_storeStrong((id *)&self->_queuedSpeakables, 0);
  objc_storeStrong((id *)&self->_currentSpeakable, 0);
  objc_storeStrong((id *)&self->_modelLoadingGroup, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

- (ADOpportuneSpeakingStateManager)stateManager
{
  return self->_stateManager;
}

- (void)modelWithIdentifier:(id)a3 didUpdateScore:(float)a4 forSpeakable:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v14 = v10;
    v15 = [v9 speakableDescription];
    *(_DWORD *)buf = 136315906;
    v22 = "-[ADOpportuneSpeakingModule modelWithIdentifier:didUpdateScore:forSpeakable:]";
    __int16 v23 = 2112;
    id v24 = v8;
    __int16 v25 = 2048;
    double v26 = a4;
    __int16 v27 = 2112;
    v28 = v15;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%s model with identifier %@ returned score: %f speakable: %@", buf, 0x2Au);
  }
  queue = self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100286BA4;
  v16[3] = &unk_10050B6A8;
  id v17 = v9;
  v18 = self;
  float v20 = a4;
  id v19 = v8;
  id v12 = v8;
  id v13 = v9;
  dispatch_async(queue, v16);
}

- (id)_remoteOSMService
{
  v2 = [(ADOpportuneSpeakingModule *)self _connectionToOSMService];
  v3 = [v2 remoteObjectProxyWithErrorHandler:&stru_100509558];

  return v3;
}

- (id)_connectionToOSMService
{
  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.siri.OpportuneSpeakingModelService"];
    v5 = self->_connection;
    self->_connection = v4;

    v6 = self->_connection;
    v7 = AFOpportuneSpeakingModelServiceInterface();
    [(NSXPCConnection *)v6 setRemoteObjectInterface:v7];

    objc_initWeak(&location, self);
    id v8 = self->_connection;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100286FE4;
    v13[3] = &unk_10050B790;
    objc_copyWeak(&v14, &location);
    [(NSXPCConnection *)v8 setInterruptionHandler:v13];
    id v9 = self->_connection;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1002870A8;
    v11[3] = &unk_10050B790;
    objc_copyWeak(&v12, &location);
    [(NSXPCConnection *)v9 setInvalidationHandler:v11];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

- (void)_cleanUpAllModels
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = [(NSMutableDictionary *)self->_modelMap allValues];
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * (void)v7) stop];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  id v8 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:4];
  modelMap = self->_modelMap;
  self->_modelMap = v8;

  v10 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:4];
  typeMap = self->_typeMap;
  self->_typeMap = v10;

  self->_modelLoading = 0;
  executionModelIdentifier = self->_executionModelIdentifier;
  self->_executionModelIdentifier = 0;

  self->_executionModelType = 0;
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;
}

- (void)_resetConnectionToOSMService
{
  v3 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSMutableDictionary count](self->_typeMap, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [(NSMutableDictionary *)self->_typeMap allKeys];
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v10 = [(NSMutableDictionary *)self->_typeMap objectForKey:v9];
        v11 = [(NSMutableDictionary *)self->_modelMap objectForKey:v10];
        id v12 = (char *)[v9 integerValue];
        if ((unint64_t)(v12 - 2) >= 2)
        {
          if (v12 == (char *)1) {
            [(NSMutableDictionary *)v3 setObject:v10 forKey:v9];
          }
        }
        else
        {
          [v11 stop];
          [(NSMutableDictionary *)self->_modelMap removeObjectForKey:v10];
          if (self->_executionModelIdentifier == v10)
          {
            self->_executionModelIdentifier = 0;

            self->_executionModelType = 0;
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  typeMap = self->_typeMap;
  self->_typeMap = v3;
  long long v14 = v3;

  self->_modelLoading = 0;
  connection = self->_connection;
  self->_connection = 0;
}

- (void)_loadModelWithType:(int64_t)a3 completion:(id)a4
{
  id v6 = (void (**)(void))a4;
  uint64_t v7 = AFOpportuneSpeakingModelTypeGetDescription();
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    float v20 = "-[ADOpportuneSpeakingModule _loadModelWithType:completion:]";
    __int16 v21 = 2112;
    v22 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s loading model with type: %@", buf, 0x16u);
  }
  if ((unint64_t)(a3 - 2) >= 2)
  {
    if (a3 != 1)
    {
      id v12 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        float v20 = "-[ADOpportuneSpeakingModule _loadModelWithType:completion:]";
        __int16 v21 = 2112;
        v22 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Unsupported model type: %@", buf, 0x16u);
        if (!v6) {
          goto LABEL_8;
        }
      }
      else if (!v6)
      {
        goto LABEL_8;
      }
      v6[2](v6);
      goto LABEL_8;
    }
    queue = self->_queue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1002877F0;
    v13[3] = &unk_10050C148;
    void v13[4] = self;
    uint64_t v15 = 1;
    long long v14 = v6;
    dispatch_async(queue, v13);
    v10 = v14;
  }
  else
  {
    id v9 = [(ADOpportuneSpeakingModule *)self _remoteOSMService];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10028770C;
    v16[3] = &unk_100509538;
    void v16[4] = self;
    int64_t v18 = a3;
    long long v17 = v6;
    [v9 createModelWithType:a3 completion:v16];

    v10 = v17;
  }

LABEL_8:
}

- (void)_withAllModelsExecute:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100287DD0;
    v22[3] = &unk_10050E188;
    v22[4] = self;
    id v23 = v4;
    id v6 = objc_retainBlock(v22);
    if (AFIsInternalInstall()) {
      unint64_t v7 = 4;
    }
    else {
      unint64_t v7 = 1;
    }
    if ((unint64_t)[(NSMutableDictionary *)self->_modelMap count] >= v7)
    {
      ((void (*)(void *))v6[2])(v6);
    }
    else if (self->_modelLoading)
    {
      id v8 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v25 = "-[ADOpportuneSpeakingModule _withAllModelsExecute:]";
        _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s Already loading models", buf, 0xCu);
      }
      dispatch_group_notify((dispatch_group_t)self->_modelLoadingGroup, (dispatch_queue_t)self->_queue, v6);
    }
    else
    {
      self->_modelLoading = 1;
      if (AFIsInternalInstall())
      {
        for (uint64_t i = 1; i != 4; ++i)
        {
          typeMap = self->_typeMap;
          v11 = +[NSNumber numberWithInteger:i];
          id v12 = [(NSMutableDictionary *)typeMap objectForKey:v11];

          if (!v12)
          {
            dispatch_group_enter((dispatch_group_t)self->_modelLoadingGroup);
            v21[0] = _NSConcreteStackBlock;
            v21[1] = 3221225472;
            v21[2] = sub_100287F2C;
            v21[3] = &unk_10050E138;
            v21[4] = self;
            [(ADOpportuneSpeakingModule *)self _loadModelWithType:i completion:v21];
          }
        }
      }
      else
      {
        id v13 = self->_typeMap;
        long long v14 = +[NSNumber numberWithInteger:1];
        uint64_t v15 = [(NSMutableDictionary *)v13 objectForKey:v14];

        if (!v15)
        {
          dispatch_group_enter((dispatch_group_t)self->_modelLoadingGroup);
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = sub_100287F38;
          v20[3] = &unk_10050E138;
          v20[4] = self;
          [(ADOpportuneSpeakingModule *)self _loadModelWithType:1 completion:v20];
        }
      }
      queue = self->_queue;
      modelLoadingGroup = self->_modelLoadingGroup;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100287F44;
      v18[3] = &unk_10050E188;
      v18[4] = self;
      long long v19 = v6;
      dispatch_group_notify(modelLoadingGroup, queue, v18);
    }
  }
}

- (void)recordSpokenRequestCompletedForSpeakable:(id)a3
{
  id v7 = a3;
  if (AFIsInternalInstall())
  {
    id v4 = [(ADOpportuneSpeakingModule *)self _remoteOSMService];
    id v5 = [v7 speakableIdentifier];
    [v4 recordFeedbackOfType:1 forSpeakableId:v5];
  }
  id v6 = [(NSMutableDictionary *)self->_modelMap objectForKey:self->_executionModelIdentifier];
  [v6 recordFeedbackOfType:1 forSpeakable:v7];
}

- (void)recordSpokenRequestCancelledForSpeakable:(id)a3
{
  id v7 = a3;
  if (AFIsInternalInstall())
  {
    id v4 = [(ADOpportuneSpeakingModule *)self _remoteOSMService];
    id v5 = [v7 speakableIdentifier];
    [v4 recordFeedbackOfType:2 forSpeakableId:v5];
  }
  id v6 = [(NSMutableDictionary *)self->_modelMap objectForKey:self->_executionModelIdentifier];
  [v6 recordFeedbackOfType:2 forSpeakable:v7];
}

- (void)requestsToSpeak:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      v10 = v8;
      v11 = [v6 speakableDescription];
      *(_DWORD *)buf = 136315394;
      long long v16 = "-[ADOpportuneSpeakingModule requestsToSpeak:withHandler:]";
      __int16 v17 = 2112;
      int64_t v18 = v11;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
    }
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100288240;
    block[3] = &unk_10050E1D8;
    block[4] = self;
    id v14 = v7;
    id v13 = v6;
    dispatch_async(queue, block);
  }
}

- (void)_processEnqueuedSpeakables
{
  if (!self->_currentSpeakable && [(NSMutableArray *)self->_queuedSpeakables count])
  {
    v3 = [(NSMutableArray *)self->_queuedSpeakables firstObject];
    currentSpeakable = self->_currentSpeakable;
    self->_currentSpeakable = v3;

    [(NSMutableArray *)self->_queuedSpeakables removeObjectAtIndex:0];
    if (AFIsInternalInstall() && _AFPreferencesSpokenNotificationIsAlwaysOpportune())
    {
      id v5 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v15 = "-[ADOpportuneSpeakingModule _processEnqueuedSpeakables]";
        _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s Always Opportune: Forcing all speakables to be spoken", buf, 0xCu);
      }
      [(ADOpportuneSpeakingModule *)self _finishRunningCurrentSpeakableWithResult:2 error:0];
    }
    else if (_AFPreferencesOpportuneSpeakingModuleEnabled())
    {
      _AFPreferencesOpportuneSpeakingTimeout();
      double v7 = v6 + 1.0;
      id v8 = objc_alloc((Class)AFWatchdogTimer);
      queue = self->_queue;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100288504;
      v13[3] = &unk_10050D8C0;
      *(double *)&void v13[5] = v7;
      void v13[4] = self;
      v10 = (AFWatchdogTimer *)[v8 initWithTimeoutInterval:queue onQueue:v13 timeoutHandler:v7];
      timer = self->_timer;
      self->_timer = v10;

      [(AFWatchdogTimer *)self->_timer start];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1002885F0;
      v12[3] = &unk_1005094E8;
      v12[4] = self;
      *(double *)&v12[5] = v7;
      [(ADOpportuneSpeakingModule *)self _withAllModelsExecute:v12];
    }
    else
    {
      [(ADOpportuneSpeakingModule *)self _finishRunningCurrentSpeakableWithResult:2 error:0];
    }
  }
}

- (void)_recordImmediateNotificationInteractionAfterRecommendation:(int64_t)a3 forSpeakable:(id)a4
{
  id v6 = a4;
  double v7 = [v6 speakableDate];
  id v8 = [v7 dateByAddingTimeInterval:60.0];
  if (AFIsInternalInstall())
  {
    id v9 = [(ADOpportuneSpeakingModule *)self _remoteOSMService];
    v10 = [v6 speakableIdentifier];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100288808;
    v11[3] = &unk_1005094C0;
    int64_t v13 = a3;
    void v11[4] = self;
    id v12 = v6;
    [v9 recordNotificationUsageForSpeakableId:v10 withStartDate:v7 withEndDate:v8 withCompletion:v11];
  }
}

- (void)_finishRunningCurrentSpeakableWithResult:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  double v7 = [(AFOpportuneSpeakable *)self->_currentSpeakable speakableIdentifier];
  uint64_t v8 = [(NSMutableDictionary *)self->_handlersBySpeakableID objectForKey:v7];
  id v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, int64_t, id))(v8 + 16))(v8, a3, v6);
    [(ADOpportuneSpeakingModule *)self _recordImmediateNotificationInteractionAfterRecommendation:a3 forSpeakable:self->_currentSpeakable];
    [(NSMutableDictionary *)self->_handlersBySpeakableID removeObjectForKey:v7];
  }
  currentSpeakable = self->_currentSpeakable;
  self->_currentSpeakable = 0;

  v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    id v12 = self->_currentSpeakable;
    int v13 = 136315394;
    id v14 = "-[ADOpportuneSpeakingModule _finishRunningCurrentSpeakableWithResult:error:]";
    __int16 v15 = 2112;
    long long v16 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s _currentSpeakable: %@", (uint8_t *)&v13, 0x16u);
  }
  [(ADOpportuneSpeakingModule *)self _processEnqueuedSpeakables];
}

- (id)_init
{
  v19.receiver = self;
  v19.super_class = (Class)ADOpportuneSpeakingModule;
  v2 = [(ADOpportuneSpeakingModule *)&v19 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("ADOpportuneSpeakingModule", v3);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    dispatch_group_t v6 = dispatch_group_create();
    modelLoadingGroup = v2->_modelLoadingGroup;
    v2->_modelLoadingGroup = (OS_dispatch_group *)v6;

    uint64_t v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    queuedSpeakables = v2->_queuedSpeakables;
    v2->_queuedSpeakables = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    handlersBySpeakableID = v2->_handlersBySpeakableID;
    v2->_handlersBySpeakableID = v10;

    id v12 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:4];
    modelMap = v2->_modelMap;
    v2->_modelMap = v12;

    id v14 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:4];
    typeMap = v2->_typeMap;
    v2->_typeMap = v14;

    long long v16 = [[ADOpportuneSpeakingStateManager alloc] initWithQueue:v2->_queue];
    stateManager = v2->_stateManager;
    v2->_stateManager = v16;
  }
  return v2;
}

+ (id)sharedModule
{
  if (qword_1005860A8 != -1) {
    dispatch_once(&qword_1005860A8, &stru_100509498);
  }
  v2 = (void *)qword_1005860B0;
  return v2;
}

@end