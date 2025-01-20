@interface ADArbitrationFeedbackManager
+ (id)sharedManager;
- (ADDeviceCircleManager)deviceCircleManager;
- (BOOL)_localDeviceIsSameAsLocationSharingDevice:(id)a3;
- (NSDictionary)executionContexts;
- (NSOperationQueue)operationQueue;
- (NSUUID)completedTurnId;
- (OS_dispatch_queue)queue;
- (SCDAFFeedbackService)feedbackService;
- (SCDAFParticipation)participation;
- (id)_createDeviceContextUpdateOperationForParticipation:(id)a3;
- (id)_createDeviceInfoOperationForParticipation:(id)a3;
- (id)_createPeerInfoUpdateOperationForParticipation:(id)a3;
- (id)_createPublishOperationForParticipation:(id)a3;
- (id)_createRequestInfoUpdateOperationForParticipation:(id)a3 forTurnId:(id)a4;
- (id)_findContextCollectorIn:(id)a3 withIDSIdentifier:(id)a4;
- (id)_findPairedPhoneIn:(id)a3;
- (id)_init;
- (id)_initForTesting;
- (id)_mediaStateFrom:(int64_t)a3;
- (id)_nearByDevicesFrom:(id)a3;
- (void)_findTargetDeviceInDeviceCircleLocalPeer:(id)a3 remotePeers:(id)a4 completion:(id)a5;
- (void)_forwardToContextCollectorMessage:(id)a3 From:(id)a4 completion:(id)a5;
- (void)_forwardToDevice:(id)a3 message:(id)a4 From:(id)a5 completion:(id)a6;
- (void)_handleArbitrationParticipationPush:(id)a3 from:(id)a4 completion:(id)a5;
- (void)_processAndSendUserFeedback;
- (void)assistantDismissed;
- (void)handle:(id)a3 fromPeer:(id)a4 completion:(id)a5;
- (void)handleUserFeedbackAction:(int64_t)a3;
- (void)publishParticipation:(id)a3;
- (void)requestLifecycleObserver:(id)a3 requestDidEndWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6;
- (void)requestLifecycleObserver:(id)a3 requestWasCancelledWithInfo:(id)a4 forReason:(int64_t)a5 origin:(int64_t)a6 client:(id)a7 successorInfo:(id)a8;
- (void)setCompletedTurnId:(id)a3;
- (void)setDeviceCircleManager:(id)a3;
- (void)setExecutionContexts:(id)a3;
- (void)setFeedbackService:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setParticipation:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation ADArbitrationFeedbackManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedTurnId, 0);
  objc_storeStrong((id *)&self->_participation, 0);
  objc_storeStrong((id *)&self->_feedbackService, 0);
  objc_storeStrong((id *)&self->_executionContexts, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_deviceCircleManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setCompletedTurnId:(id)a3
{
}

- (NSUUID)completedTurnId
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (void)setParticipation:(id)a3
{
}

- (SCDAFParticipation)participation
{
  return (SCDAFParticipation *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFeedbackService:(id)a3
{
}

- (SCDAFFeedbackService)feedbackService
{
  return self->_feedbackService;
}

- (void)setExecutionContexts:(id)a3
{
}

- (NSDictionary)executionContexts
{
  return self->_executionContexts;
}

- (void)setOperationQueue:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setDeviceCircleManager:(id)a3
{
}

- (ADDeviceCircleManager)deviceCircleManager
{
  return self->_deviceCircleManager;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)_processAndSendUserFeedback
{
  v3 = [(ADArbitrationFeedbackManager *)self completedTurnId];
  if (v3)
  {
    participation = self->_participation;

    if (participation)
    {
      v5 = [(ADArbitrationFeedbackManager *)self _createDeviceInfoOperationForParticipation:self->_participation];
      v6 = [(ADArbitrationFeedbackManager *)self _createPeerInfoUpdateOperationForParticipation:self->_participation];
      v7 = self->_participation;
      v8 = [(ADArbitrationFeedbackManager *)self completedTurnId];
      v9 = [(ADArbitrationFeedbackManager *)self _createRequestInfoUpdateOperationForParticipation:v7 forTurnId:v8];

      v10 = [(ADArbitrationFeedbackManager *)self _createDeviceContextUpdateOperationForParticipation:self->_participation];
      [v6 addDependency:v5];
      [v9 addDependency:v6];
      [v10 addDependency:v9];
      [(NSOperationQueue *)self->_operationQueue addOperation:v5];
      [(NSOperationQueue *)self->_operationQueue addOperation:v6];
      [(NSOperationQueue *)self->_operationQueue addOperation:v9];
      [(NSOperationQueue *)self->_operationQueue addOperation:v10];
      v11 = [(ADArbitrationFeedbackManager *)self _createPublishOperationForParticipation:self->_participation];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10019292C;
      v12[3] = &unk_10050E138;
      v12[4] = self;
      [v11 setCompletionBlock:v12];
      [v11 addDependency:v5];
      [v11 addDependency:v6];
      [v11 addDependency:v9];
      [v11 addDependency:v10];
      [(NSOperationQueue *)self->_operationQueue addOperation:v11];
    }
  }
}

- (void)requestLifecycleObserver:(id)a3 requestDidEndWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6
{
  v7 = objc_msgSend(a4, "turnIdentifier", a3);
  [(ADArbitrationFeedbackManager *)self setCompletedTurnId:v7];

  v8 = +[ADCommandCenter sharedCommandCenter];
  v9 = [v8 rootExecutionContexts];
  [(ADArbitrationFeedbackManager *)self setExecutionContexts:v9];

  [(ADArbitrationFeedbackManager *)self _processAndSendUserFeedback];
}

- (void)requestLifecycleObserver:(id)a3 requestWasCancelledWithInfo:(id)a4 forReason:(int64_t)a5 origin:(int64_t)a6 client:(id)a7 successorInfo:(id)a8
{
  id v10 = +[ADCommandCenter sharedCommandCenter];
  v9 = [v10 rootExecutionContexts];
  [(ADArbitrationFeedbackManager *)self setExecutionContexts:v9];
}

- (void)_forwardToContextCollectorMessage:(id)a3 From:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(ADArbitrationFeedbackManager *)self deviceCircleManager];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100192B7C;
  v15[3] = &unk_100504BE0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 getContextCollectorDeviceIdentifiersWithCompletion:v15];
}

- (void)_forwardToDevice:(id)a3 message:(id)a4 From:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[ADArbitrationFeedbackManager _forwardToDevice:message:From:completion:]";
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback Forward arbitration to device: %@", buf, 0x16u);
  }
  id v13 = [(ADArbitrationFeedbackManager *)self deviceCircleManager];
  queue = self->_queue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100192ED0;
  v17[3] = &unk_100504BB8;
  id v18 = v9;
  id v19 = v11;
  id v15 = v11;
  id v16 = v9;
  [v13 sendRequestType:@"arbitration_info_push" data:v10 toDeviceWithAssistantIdentifier:v16 onQueue:queue completion:v17];
}

- (void)_handleArbitrationParticipationPush:(id)a3 from:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 136315138;
    id v19 = "-[ADArbitrationFeedbackManager _handleArbitrationParticipationPush:from:completion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback Handle received arbitration request on this device.", (uint8_t *)&v18, 0xCu);
  }
  id v12 = [v8 objectForKeyedSubscript:@"ADArbitrationParticipationMessage"];
  id v13 = [objc_alloc((Class)SCDAFParticipation) initWithDictionaryRepresentation:v12];
  id v14 = [v13 advertisement];

  if (v14)
  {
    id v15 = [(ADArbitrationFeedbackManager *)self feedbackService];
    [v15 handleReceivedArbitrationParticipation:v13];

    if (v10) {
      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    }
  }
  else
  {
    id v16 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 136315138;
      id v19 = "-[ADArbitrationFeedbackManager _handleArbitrationParticipationPush:from:completion:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback Unable to parse SCDAFParticipation from request. Returning error.", (uint8_t *)&v18, 0xCu);
    }
    id v17 = +[AFError errorWithCode:30 description:@"Unable to parse SCDAFParticipation from request."];
    if (v10) {
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v17);
    }
  }
}

- (id)_findContextCollectorIn:(id)a3 withIDSIdentifier:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10019329C;
  v8[3] = &unk_100504B90;
  id v9 = a4;
  id v5 = v9;
  v6 = objc_msgSend(a3, "af_firstObjectPassingTest:", v8);

  return v6;
}

- (id)_findPairedPhoneIn:(id)a3
{
  return objc_msgSend(a3, "af_firstObjectPassingTest:", &stru_100504B68);
}

- (void)_findTargetDeviceInDeviceCircleLocalPeer:(id)a3 remotePeers:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, id))a5;
  if (v10)
  {
    id v11 = [(ADDeviceCircleManager *)self->_deviceCircleManager locationSharingDevice];
    id v12 = [v11 assistantIdentifier];

    if ([v12 length])
    {
      id v13 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v21 = "-[ADArbitrationFeedbackManager _findTargetDeviceInDeviceCircleLocalPeer:remotePeers:completion:]";
        __int16 v22 = 2112;
        id v23 = v12;
        _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback Target device is location sharing device: %@", buf, 0x16u);
      }
      id v14 = [v8 assistantIdentifier];
      v10[2](v10, v12, [v14 isEqualToString:v12]);
    }
    else
    {
      id v16 = [(ADArbitrationFeedbackManager *)self deviceCircleManager];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10019357C;
      v17[3] = &unk_100504CD0;
      void v17[4] = self;
      id v19 = v10;
      id v18 = v9;
      [v16 getContextCollectorDeviceIdentifiersWithCompletion:v17];
    }
  }
  else
  {
    id v15 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[ADArbitrationFeedbackManager _findTargetDeviceInDeviceCircleLocalPeer:remotePeers:completion:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback completion is nil. Returning.", buf, 0xCu);
    }
  }
}

- (id)_nearByDevicesFrom:(id)a3
{
  return objc_msgSend(a3, "af_lenientMappedArray:", &stru_100504B28);
}

- (BOOL)_localDeviceIsSameAsLocationSharingDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(ADArbitrationFeedbackManager *)self deviceCircleManager];
  v6 = [v5 localPeerInfo];

  v7 = [v6 assistantIdentifier];
  unsigned __int8 v8 = [v4 isEqualToString:v7];

  return v8;
}

- (void)handle:(id)a3 fromPeer:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 136315394;
    id v16 = "-[ADArbitrationFeedbackManager handle:fromPeer:completion:]";
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback Received arbitration push message: %@", (uint8_t *)&v15, 0x16u);
  }
  id v12 = [(ADArbitrationFeedbackManager *)self deviceCircleManager];
  id v13 = [v12 locationSharingDevice];
  id v14 = [v13 assistantIdentifier];

  if (v14)
  {
    if ([(ADArbitrationFeedbackManager *)self _localDeviceIsSameAsLocationSharingDevice:v14])
    {
      [(ADArbitrationFeedbackManager *)self _handleArbitrationParticipationPush:v8 from:v9 completion:v10];
    }
    else
    {
      [(ADArbitrationFeedbackManager *)self _forwardToDevice:v14 message:v8 From:v9 completion:v10];
    }
  }
  else
  {
    [(ADArbitrationFeedbackManager *)self _forwardToContextCollectorMessage:v8 From:v9 completion:v10];
  }
}

- (id)_mediaStateFrom:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return &off_1005236D8;
  }
  else {
    return off_100504C00[a3 - 1];
  }
}

- (void)assistantDismissed
{
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    v6 = "-[ADArbitrationFeedbackManager assistantDismissed]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback assistantDismissed", (uint8_t *)&v5, 0xCu);
  }
  id v4 = [(ADArbitrationFeedbackManager *)self feedbackService];
  [v4 handleAssistantDismissed];
}

- (id)_createDeviceInfoOperationForParticipation:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10019402C;
  v7[3] = &unk_10050E160;
  id v8 = a3;
  id v9 = self;
  id v4 = v8;
  int v5 = +[NSBlockOperation blockOperationWithBlock:v7];

  return v5;
}

- (id)_createPublishOperationForParticipation:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001945C4;
  v6[3] = &unk_10050E160;
  v6[4] = self;
  id v7 = a3;
  id v3 = v7;
  id v4 = +[NSBlockOperation blockOperationWithBlock:v6];

  return v4;
}

- (id)_createPeerInfoUpdateOperationForParticipation:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100194D74;
  v6[3] = &unk_10050E160;
  v6[4] = self;
  id v7 = a3;
  id v3 = v7;
  id v4 = +[NSBlockOperation blockOperationWithBlock:v6];

  return v4;
}

- (id)_createDeviceContextUpdateOperationForParticipation:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100195280;
  v6[3] = &unk_10050E160;
  v6[4] = self;
  id v7 = a3;
  id v3 = v7;
  id v4 = +[NSBlockOperation blockOperationWithBlock:v6];

  return v4;
}

- (id)_createRequestInfoUpdateOperationForParticipation:(id)a3 forTurnId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100195B7C;
  v12[3] = &unk_10050A280;
  objc_copyWeak(&v15, &location);
  id v8 = v7;
  id v13 = v8;
  id v9 = v6;
  id v14 = v9;
  id v10 = +[NSBlockOperation blockOperationWithBlock:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v10;
}

- (void)publishParticipation:(id)a3
{
  id v5 = a3;
  id v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315138;
    id v9 = "-[ADArbitrationFeedbackManager publishParticipation:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback", (uint8_t *)&v8, 0xCu);
  }
  if (+[AFFeatureFlags isCrossDeviceArbitrationFeedbackEnabled])
  {
    objc_storeStrong((id *)&self->_participation, a3);
    [(ADArbitrationFeedbackManager *)self _processAndSendUserFeedback];
  }
  else
  {
    id v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 136315138;
      id v9 = "-[ADArbitrationFeedbackManager publishParticipation:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback Feature Disabled. Returning.", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)handleUserFeedbackAction:(int64_t)a3
{
  id v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    id v7 = v4;
    int v8 = +[NSNumber numberWithInteger:a3];
    int v9 = 136315394;
    id v10 = "-[ADArbitrationFeedbackManager handleUserFeedbackAction:]";
    __int16 v11 = 2112;
    id v12 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback handleUserFeedbackAction: %@", (uint8_t *)&v9, 0x16u);
  }
  if (a3 != 2)
  {
    id v5 = objc_alloc_init((Class)SAAppsLaunchApp);
    [v5 setLaunchId:SCDAFFeedbackAppBundleId];
    id v6 = +[ADCommandCenter sharedCommandCenter];
    [v6 handleCommand:v5 completion:&stru_1005049F8];
  }
}

- (id)_init
{
  v15.receiver = self;
  v15.super_class = (Class)ADArbitrationFeedbackManager;
  v2 = [(ADArbitrationFeedbackManager *)&v15 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v5 = dispatch_queue_create("ArbitrationFeedbackQueue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = +[ADDeviceCircleManager sharedInstance];
    deviceCircleManager = v2->_deviceCircleManager;
    v2->_deviceCircleManager = (ADDeviceCircleManager *)v7;

    uint64_t v9 = +[SCDAFFeedbackService sharedService];
    feedbackService = v2->_feedbackService;
    v2->_feedbackService = (SCDAFFeedbackService *)v9;

    [(SCDAFFeedbackService *)v2->_feedbackService setDelegate:v2];
    [(ADArbitrationFeedbackManager *)v2 setCompletedTurnId:0];
    __int16 v11 = +[ADRequestLifecycleObserver sharedObserver];
    [v11 addListener:v2];

    id v12 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v12;
  }
  return v2;
}

- (id)_initForTesting
{
  v11.receiver = self;
  v11.super_class = (Class)ADArbitrationFeedbackManager;
  v2 = [(ADArbitrationFeedbackManager *)&v11 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v5 = dispatch_queue_create("ArbitrationFeedbackQueue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v7;

    [(NSOperationQueue *)v2->_operationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v2->_operationQueue setUnderlyingQueue:v2->_queue];
  }
  v10.receiver = v2;
  v10.super_class = (Class)ADArbitrationFeedbackManager;
  return [(ADArbitrationFeedbackManager *)&v10 init];
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001965C0;
  block[3] = &unk_10050E350;
  block[4] = a1;
  if (qword_100585D88 != -1) {
    dispatch_once(&qword_100585D88, block);
  }
  v2 = (void *)qword_100585D80;
  return v2;
}

@end