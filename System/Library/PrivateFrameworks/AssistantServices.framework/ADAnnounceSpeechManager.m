@interface ADAnnounceSpeechManager
+ (double)_bargeInTimeThresholdForType:(int64_t)a3;
+ (double)lookbackTimeForSpeechObservingType:(int64_t)a3;
- (ADAnnounceSpeechManager)init;
- (ADAnnounceSpeechManagerDelegate)delegate;
- (BOOL)isAttending;
- (id)_attendingServiceClient;
- (id)_osmedDetector;
- (void)_attendingStoppedWithReason:(int64_t)a3;
- (void)_resetDetector;
- (void)_startAttendingForSpeechPauseWithType:(int64_t)a3 completion:(id)a4;
- (void)_startAttendingForSpeechWithType:(int64_t)a3 completion:(id)a4;
- (void)attendingStoppedWithReason:(int64_t)a3;
- (void)didTransitionToTriggerlessListening;
- (void)setDelegate:(id)a3;
- (void)startAttendingForPauseInSpeechWithType:(int64_t)a3 completion:(id)a4;
- (void)startAttendingForSpeechWithType:(int64_t)a3 completion:(id)a4;
- (void)stopAttending;
@end

@implementation ADAnnounceSpeechManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_attendingServiceClient, 0);
  objc_storeStrong((id *)&self->_osmedDetector, 0);
}

- (void)setDelegate:(id)a3
{
}

- (ADAnnounceSpeechManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ADAnnounceSpeechManagerDelegate *)WeakRetained;
}

- (void)_resetDetector
{
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315138;
    v12 = "-[ADAnnounceSpeechManager _resetDetector]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v11, 0xCu);
  }
  v4 = [(ADAnnounceSpeechManager *)self _osmedDetector];
  unsigned int v5 = [v4 isListening];

  if (v5)
  {
    v6 = [(ADAnnounceSpeechManager *)self _osmedDetector];
    [v6 stopListening];
  }
  if (self->_isAttendingWithAttendingService)
  {
    v7 = [(ADAnnounceSpeechManager *)self _attendingServiceClient];
    [v7 stopAttendingWithReason:4];
  }
  deviceID = self->_deviceID;
  self->_deviceID = 0;

  self->_speechType = 0;
  osmedDetector = self->_osmedDetector;
  self->_osmedDetector = 0;

  attendingServiceClient = self->_attendingServiceClient;
  self->_attendingServiceClient = 0;

  *(_WORD *)&self->_isAttendingWithCSOSL = 0;
}

- (BOOL)isAttending
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004FF58;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)stopAttending
{
  char v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[ADAnnounceSpeechManager stopAttending]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100050088;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)didTransitionToTriggerlessListening
{
  char v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[ADAnnounceSpeechManager didTransitionToTriggerlessListening]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100050190;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)_osmedDetector
{
  osmedDetector = self->_osmedDetector;
  if (!osmedDetector)
  {
    v4 = +[ADOpportuneSpeakingModule sharedModule];
    unsigned int v5 = [v4 stateManager];

    uint64_t v6 = [[ADOpportuneSpeakingModuleEdgeDetector alloc] initWithQueue:self->_queue stateManager:v5];
    v7 = self->_osmedDetector;
    self->_osmedDetector = v6;

    osmedDetector = self->_osmedDetector;
  }
  return osmedDetector;
}

- (id)_attendingServiceClient
{
  attendingServiceClient = self->_attendingServiceClient;
  if (!attendingServiceClient)
  {
    v4 = (CSAttendingServiceClient *)objc_alloc_init((Class)CSAttendingServiceClient);
    unsigned int v5 = self->_attendingServiceClient;
    self->_attendingServiceClient = v4;

    [(CSAttendingServiceClient *)self->_attendingServiceClient setDelegate:self];
    attendingServiceClient = self->_attendingServiceClient;
  }
  return attendingServiceClient;
}

- (void)_attendingStoppedWithReason:(int64_t)a3
{
  if (a3 != 4)
  {
    p_delegate = &self->_delegate;
    if (a3 == 1)
    {
      id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
      [WeakRetained speechManager:self detectedSpeechForListeningType:1 atHostTime:0 shouldHandleActivation:0.0];
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
      [WeakRetained speechManager:self didStopUnexpectlyWithError:0];
    }
  }
  self->_isAttendingWithAttendingService = 0;
}

- (void)attendingStoppedWithReason:(int64_t)a3
{
  unsigned int v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    char v9 = "-[ADAnnounceSpeechManager attendingStoppedWithReason:]";
    __int16 v10 = 2048;
    int64_t v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s attendingStoppedWithReason: %lu", buf, 0x16u);
  }
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100050490;
  v7[3] = &unk_10050D8C0;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(queue, v7);
}

- (void)_startAttendingForSpeechPauseWithType:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = +[AFPreferences sharedPreferences];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  uint64_t v20 = 0;
  [v7 opportuneSpeakingPauseInterval];
  uint64_t v20 = v8;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  uint64_t v18 = 0;
  [v7 opportuneSpeakingTimeoutInterval];
  uint64_t v18 = v9;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000505E8;
  block[3] = &unk_1004FF350;
  block[4] = self;
  id v13 = v6;
  v15 = v17;
  int64_t v16 = a3;
  v14 = v19;
  id v11 = v6;
  dispatch_async(queue, block);

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
}

- (void)_startAttendingForSpeechWithType:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  if ((unint64_t)(a3 - 3) >= 2 && a3)
  {
    if (a3 == 2)
    {
      unsigned int v7 = +[AFFeatureFlags isRingtoneOverA2DPEnabled];
      uint64_t v8 = AFSiriLogContextDaemon;
      BOOL v9 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR);
      if (v7)
      {
        if (v9)
        {
          *(_DWORD *)buf = 136315138;
          v23 = "-[ADAnnounceSpeechManager _startAttendingForSpeechWithType:completion:]";
          _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Ringtone over A2DP enabled, using DOAP for OPPSPK", buf, 0xCu);
        }
        uint64_t v10 = 0;
        int64_t v11 = 1;
      }
      else
      {
        if (v9)
        {
          *(_DWORD *)buf = 136315138;
          v23 = "-[ADAnnounceSpeechManager _startAttendingForSpeechWithType:completion:]";
          _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Ringtone over HFP enabled, using HFP for OPPSPK", buf, 0xCu);
        }
        int64_t v11 = 2;
        uint64_t v10 = 1;
      }
      void v19[3] = v10;
      self->_speechType = v11;
    }
    id v13 = +[AFHeadphonesAnnouncementRequestCapabilityProvider provider];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000510D8;
    v14[3] = &unk_1004FF288;
    v14[4] = self;
    int64_t v16 = &v18;
    id v15 = v6;
    int64_t v17 = a3;
    [v13 fetchCurrentlyRoutedHeadphonesCBUUIDWithCompletion:v14];
  }
  else
  {
    v12 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[ADAnnounceSpeechManager _startAttendingForSpeechWithType:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s No triggerless listening for speech observing type", buf, 0xCu);
    }
    id v13 = +[AFError errorWithCode:7200 description:0];
    (*((void (**)(id, void *))v6 + 2))(v6, v13);
  }

  _Block_object_dispose(&v18, 8);
}

- (void)startAttendingForPauseInSpeechWithType:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  unsigned int v7 = (void (**)(void, void, void))v6;
  switch(a3)
  {
    case 0:
      if (v6)
      {
        BOOL v9 = +[AFError errorWithCode:7200];
        ((void (**)(void, void, void *))v7)[2](v7, 0, v9);
      }
      break;
    case 1:
    case 2:
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100051BE4;
      block[3] = &unk_10050C148;
      block[4] = self;
      int64_t v12 = a3;
      id v11 = v6;
      dispatch_async(queue, block);

      break;
    case 3:
    case 4:
      if (v6) {
        (*((void (**)(id, uint64_t, void))v6 + 2))(v6, 1, 0);
      }
      break;
    default:
      break;
  }
}

- (void)startAttendingForSpeechWithType:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  unsigned int v7 = (void (**)(void, void))v6;
  if ((unint64_t)(a3 - 1) < 2)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100051DB0;
    block[3] = &unk_10050C148;
    block[4] = self;
    int64_t v12 = a3;
    id v11 = v6;
    dispatch_async(queue, block);
  }
  else if ((unint64_t)(a3 - 3) >= 2)
  {
    if (!a3 && v6)
    {
      BOOL v9 = +[AFError errorWithCode:7200 description:0 underlyingError:0];
      ((void (**)(void, void *))v7)[2](v7, v9);
    }
  }
  else if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

- (ADAnnounceSpeechManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)ADAnnounceSpeechManager;
  v2 = [(ADAnnounceSpeechManager *)&v9 init];
  if (v2)
  {
    char v3 = (id)qword_100585E48;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    unsigned int v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UNSPECIFIED, 0);

    dispatch_queue_t v6 = dispatch_queue_create_with_target_V2("ADAnnounceSpeechManagerQueue", v5, v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

+ (double)lookbackTimeForSpeechObservingType:(int64_t)a3
{
  [(id)objc_opt_class() _bargeInTimeThresholdForType:a3];
  return v3 + 0.2;
}

+ (double)_bargeInTimeThresholdForType:(int64_t)a3
{
  if (a3 == 2)
  {
    __AFPreferencesAnnounceCallsBargeInTime(a1, a2);
  }
  else if (a3 == 1)
  {
    __AFPreferencesSpokenNotificationQuickIgnoreTime(a1, a2);
  }
  else
  {
    double v3 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      dispatch_queue_t v6 = "+[ADAnnounceSpeechManager _bargeInTimeThresholdForType:]";
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s Invalid request delay type, unable to compute voice threshold", (uint8_t *)&v5, 0xCu);
    }
    return 0.0;
  }
  return result;
}

@end