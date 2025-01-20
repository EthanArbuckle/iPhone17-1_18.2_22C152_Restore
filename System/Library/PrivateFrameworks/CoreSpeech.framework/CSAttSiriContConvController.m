@interface CSAttSiriContConvController
+ (BOOL)_isAttentionNodeAvailable;
- (BOOL)_shouldConfigureAudioForContinuousConversation;
- (BOOL)_shouldDisableCCForAudioRecordType:(int64_t)a3;
- (BOOL)_useAttendingTimeoutInAsset:(float)a3;
- (BOOL)isAttending;
- (BOOL)isInAttendingState;
- (BOOL)shouldRunCCForAudioRecordContext:(id)a3;
- (BOOL)useGazeSignal;
- (CSAttSiriAttentionNode)attentionNode;
- (CSAttSiriAudioSessionStateClient)siriStateClient;
- (CSAttSiriContConvController)initWithAttSiriController:(id)a3;
- (CSAttSiriContConvController)initWithAttSiriController:(id)a3 supportAttentionLostAndGain:(BOOL)a4;
- (CSAttSiriController)attSiriController;
- (CSAttSiriMagusLoggingNode)magusLoggingNode;
- (CSAttSiriMotionNode)motionNode;
- (CSAttSiriNode)gazeNode;
- (CSAttSiriOSDNode)osdNode;
- (CSAttSiriTimer)attendingPendingStateTimer;
- (CSAttSiriTimer)attendingTimer;
- (CSAttSiriTimer)clientPendingTimer;
- (CSAudioRecordContext)audioRecordContext;
- (NSMutableDictionary)nodesCache;
- (NSString)prevStoppedMhId;
- (NSString)requestMHUUID;
- (OS_dispatch_queue)queue;
- (float)attendingTimeoutInSecs;
- (void)_applyGazeSignalMandate;
- (void)_configureAttendingTimeout;
- (void)_setupAttendingTimer;
- (void)_setupClientPendingTimer;
- (void)_setupGazeNodeWithAttSiriController:(id)a3;
- (void)_startAttendingWithAudioRecordContext:(id)a3 withRequestId:(id)a4 shouldStartTimer:(BOOL)a5;
- (void)_stopAttendingForRequestId:(id)a3 isReqCC:(BOOL)a4 forceStop:(BOOL)a5;
- (void)_stopNodes;
- (void)_stopTimers;
- (void)attSiriNode:(id)a3 startSpeechProcessing:(unint64_t)a4;
- (void)gazeTrackerFaceTrackingMetaDataUpdate:(id)a3 atMachAbsTime:(unint64_t)a4;
- (void)handleAttendingTimeout;
- (void)notifySiriSessionStateTTSOngoing:(BOOL)a3;
- (void)relayGazeEstimates:(CGPoint)a3 landmarks:(id)a4;
- (void)setAttSiriController:(id)a3;
- (void)setAttendingPendingStateTimer:(id)a3;
- (void)setAttendingTimeoutInSecs:(float)a3;
- (void)setAttendingTimer:(id)a3;
- (void)setAudioRecordContext:(id)a3;
- (void)setClientPendingTimer:(id)a3;
- (void)setGazeNode:(id)a3;
- (void)setIsAttending:(BOOL)a3;
- (void)setMagusLoggingNode:(id)a3;
- (void)setMotionNode:(id)a3;
- (void)setNodesCache:(id)a3;
- (void)setPrevStoppedMhId:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRequestMHUUID:(id)a3;
- (void)setSiriStateClient:(id)a3;
- (void)setUseGazeSignal:(BOOL)a3;
- (void)startAttendingWithAudioRecordContext:(id)a3 attendingSiriRequestContext:(id)a4 withRequestId:(id)a5 shouldStartTimer:(BOOL)a6;
- (void)startAttendingWithAudioRecordContext:(id)a3 withRequestId:(id)a4 shouldStartTimer:(BOOL)a5;
- (void)startMagusLoggingForTriggerRequest;
- (void)stopAttendingForRequestId:(id)a3 isReqCC:(BOOL)a4 forceStop:(BOOL)a5;
- (void)updateSiriOrbLocation:(CGRect)a3;
@end

@implementation CSAttSiriContConvController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriStateClient, 0);
  objc_storeStrong((id *)&self->_prevStoppedMhId, 0);
  objc_storeStrong((id *)&self->_attendingTimer, 0);
  objc_storeStrong((id *)&self->_attendingPendingStateTimer, 0);
  objc_storeStrong((id *)&self->_clientPendingTimer, 0);
  objc_storeStrong((id *)&self->_audioRecordContext, 0);
  objc_storeStrong((id *)&self->_magusLoggingNode, 0);
  objc_storeStrong((id *)&self->_motionNode, 0);
  objc_storeStrong((id *)&self->_requestMHUUID, 0);
  objc_storeStrong((id *)&self->_attSiriController, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_nodesCache, 0);
  objc_storeStrong((id *)&self->_osdNode, 0);
  objc_storeStrong((id *)&self->_attentionNode, 0);
  objc_storeStrong((id *)&self->_gazeNode, 0);
}

- (void)setSiriStateClient:(id)a3
{
}

- (CSAttSiriAudioSessionStateClient)siriStateClient
{
  return self->_siriStateClient;
}

- (void)setUseGazeSignal:(BOOL)a3
{
  self->_useGazeSignal = a3;
}

- (BOOL)useGazeSignal
{
  return self->_useGazeSignal;
}

- (void)setPrevStoppedMhId:(id)a3
{
}

- (NSString)prevStoppedMhId
{
  return self->_prevStoppedMhId;
}

- (void)setIsAttending:(BOOL)a3
{
  self->_isAttending = a3;
}

- (BOOL)isAttending
{
  return self->_isAttending;
}

- (void)setAttendingTimeoutInSecs:(float)a3
{
  self->_attendingTimeoutInSecs = a3;
}

- (float)attendingTimeoutInSecs
{
  return self->_attendingTimeoutInSecs;
}

- (void)setAttendingTimer:(id)a3
{
}

- (CSAttSiriTimer)attendingTimer
{
  return self->_attendingTimer;
}

- (void)setAttendingPendingStateTimer:(id)a3
{
}

- (CSAttSiriTimer)attendingPendingStateTimer
{
  return self->_attendingPendingStateTimer;
}

- (void)setClientPendingTimer:(id)a3
{
}

- (CSAttSiriTimer)clientPendingTimer
{
  return self->_clientPendingTimer;
}

- (void)setAudioRecordContext:(id)a3
{
}

- (CSAudioRecordContext)audioRecordContext
{
  return self->_audioRecordContext;
}

- (void)setMagusLoggingNode:(id)a3
{
}

- (CSAttSiriMagusLoggingNode)magusLoggingNode
{
  return self->_magusLoggingNode;
}

- (void)setMotionNode:(id)a3
{
}

- (CSAttSiriMotionNode)motionNode
{
  return self->_motionNode;
}

- (void)setRequestMHUUID:(id)a3
{
}

- (NSString)requestMHUUID
{
  return self->_requestMHUUID;
}

- (void)setAttSiriController:(id)a3
{
}

- (CSAttSiriController)attSiriController
{
  return self->_attSiriController;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setNodesCache:(id)a3
{
}

- (NSMutableDictionary)nodesCache
{
  return self->_nodesCache;
}

- (CSAttSiriOSDNode)osdNode
{
  return self->_osdNode;
}

- (CSAttSiriAttentionNode)attentionNode
{
  return self->_attentionNode;
}

- (void)setGazeNode:(id)a3
{
}

- (CSAttSiriNode)gazeNode
{
  return self->_gazeNode;
}

- (void)notifySiriSessionStateTTSOngoing:(BOOL)a3
{
  BOOL v3 = a3;
  if (CSIsIOS())
  {
    id v4 = +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient];
    [v4 setAggressiveECMode:v3 completionBlock:&stru_10024FC70];
  }
}

- (void)handleAttendingTimeout
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006B540;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_setupAttendingTimer
{
  float attendingTimeoutInSecs = self->_attendingTimeoutInSecs;
  if (attendingTimeoutInSecs >= 1.0)
  {
    attendingTimer = self->_attendingTimer;
    if (attendingTimer)
    {
      [(CSAttSiriTimer *)attendingTimer cancelTimer];
      v6 = self->_attendingTimer;
      self->_attendingTimer = 0;
    }
    v7 = [[CSAttSiriTimer alloc] initWithQueue:0];
    v8 = self->_attendingTimer;
    self->_attendingTimer = v7;

    objc_initWeak(&location, self);
    v9 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      double v10 = self->_attendingTimeoutInSecs;
      *(_DWORD *)buf = 136315394;
      v17 = "-[CSAttSiriContConvController _setupAttendingTimer]";
      __int16 v18 = 2048;
      double v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Setup attending timer for duration %f secs", buf, 0x16u);
    }
    v11 = self->_attendingTimer;
    float v12 = self->_attendingTimeoutInSecs;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10006B7D4;
    v13[3] = &unk_1002533D0;
    objc_copyWeak(&v14, &location);
    [(CSAttSiriTimer *)v11 setTimerForSecs:v13 completionBlock:v12];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    BOOL v3 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[CSAttSiriContConvController _setupAttendingTimer]";
      __int16 v18 = 2048;
      double v19 = attendingTimeoutInSecs;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s Not setting up attending timer. Timeout value set to :%f(sec)", buf, 0x16u);
    }
  }
}

- (void)_configureAttendingTimeout
{
  BOOL v3 = +[CSFPreferences sharedPreferences];
  [v3 getAttendingTimeoutConfig];
  self->_double attendingTimeoutInSecs = v4;

  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    double attendingTimeoutInSecs = self->_attendingTimeoutInSecs;
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSAttSiriContConvController _configureAttendingTimeout]";
    __int16 v12 = 2048;
    double v13 = attendingTimeoutInSecs;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s attending timeout:%f", buf, 0x16u);
  }
  *(float *)&double v6 = self->_attendingTimeoutInSecs;
  if ([(CSAttSiriContConvController *)self _useAttendingTimeoutInAsset:v6])
  {
    v8 = +[CSAttSiriMitigationAssetHandler sharedHandler];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10006B9F0;
    v9[3] = &unk_100252DF0;
    v9[4] = self;
    [v8 getMitigationAssetWithEndpointId:0 completion:v9];
  }
}

- (BOOL)_useAttendingTimeoutInAsset:(float)a3
{
  return fabsf(a3) < 0.0000001;
}

- (void)_applyGazeSignalMandate
{
  objc_initWeak(&location, self);
  BOOL v3 = +[CSAttSiriMitigationAssetHandler sharedHandler];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10006BD3C;
  v4[3] = &unk_10024FC30;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  [v3 getMitigationAssetWithEndpointId:0 completion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)_shouldConfigureAudioForContinuousConversation
{
  unsigned int v2 = +[CSUtils isContinuousConversationSupported];
  BOOL v3 = +[CSAudioRouteChangeMonitor sharedInstance];
  unsigned int v4 = [v3 carPlayConnected];

  unsigned int v5 = +[CSUtils isBluetoothAudioDeviceConnected];
  double v6 = +[CSAudioRouteChangeMonitor sharedInstance];
  id v7 = [v6 hearstRouteStatus];

  if (v7) {
    BOOL v8 = v7 == (id)5;
  }
  else {
    BOOL v8 = 1;
  }
  int v9 = !v8;
  int v10 = v5 ^ 1 | v9;
  if (v4) {
    int v10 = 0;
  }
  if (v2) {
    BOOL v11 = v10;
  }
  else {
    BOOL v11 = 0;
  }
  __int16 v12 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136316418;
    v15 = "-[CSAttSiriContConvController _shouldConfigureAudioForContinuousConversation]";
    __int16 v16 = 1024;
    BOOL v17 = v11;
    __int16 v18 = 1024;
    unsigned int v19 = v2;
    __int16 v20 = 1024;
    unsigned int v21 = v4;
    __int16 v22 = 1024;
    unsigned int v23 = v5;
    __int16 v24 = 1024;
    int v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s ccSupported:%u --> isCCConfigEnabled:%u isCarplayConnected:%u isBluetoothDeviceConnected:%u isHearstConnected:%u", (uint8_t *)&v14, 0x2Au);
  }
  return v11;
}

- (BOOL)_shouldDisableCCForAudioRecordType:(int64_t)a3
{
  return ((unint64_t)a3 < 0x14) & (0xFF18Du >> a3);
}

- (void)_setupClientPendingTimer
{
  clientPendingTimer = self->_clientPendingTimer;
  if (clientPendingTimer)
  {
    [(CSAttSiriTimer *)clientPendingTimer cancelTimer];
    unsigned int v4 = self->_clientPendingTimer;
    self->_clientPendingTimer = 0;
  }
  unsigned int v5 = [[CSAttSiriTimer alloc] initWithQueue:0];
  double v6 = self->_clientPendingTimer;
  self->_clientPendingTimer = v5;

  objc_initWeak(&location, self);
  id v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    double v13 = "-[CSAttSiriContConvController _setupClientPendingTimer]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Setup client pending timer", buf, 0xCu);
  }
  BOOL v8 = self->_clientPendingTimer;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10006C238;
  v9[3] = &unk_1002533D0;
  objc_copyWeak(&v10, &location);
  [(CSAttSiriTimer *)v8 setTimerForSecs:v9 completionBlock:10.0];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_stopNodes
{
  BOOL v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    unsigned int v5 = "-[CSAttSiriContConvController _stopNodes]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(CSAttSiriMagusLoggingNode *)self->_magusLoggingNode stop];
  [(CSAttSiriNode *)self->_gazeNode stop];
  [(CSAttSiriAttentionNode *)self->_attentionNode stop];
  [(CSAttSiriMotionNode *)self->_motionNode stop];
}

- (void)_stopTimers
{
  BOOL v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[CSAttSiriContConvController _stopTimers]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v9, 0xCu);
  }
  [(CSAttSiriTimer *)self->_attendingTimer cancelTimer];
  [(CSAttSiriTimer *)self->_clientPendingTimer cancelTimer];
  attendingTimer = self->_attendingTimer;
  self->_attendingTimer = 0;

  clientPendingTimer = self->_clientPendingTimer;
  self->_clientPendingTimer = 0;

  audioRecordContext = self->_audioRecordContext;
  self->_audioRecordContext = 0;

  requestMHUUID = self->_requestMHUUID;
  self->_requestMHUUID = 0;

  self->_isAttending = 0;
  BOOL v8 = +[CSAttSiriStateMonitor sharedInstance];
  [v8 updateState:0];
}

- (void)_stopAttendingForRequestId:(id)a3 isReqCC:(BOOL)a4 forceStop:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315906;
    __int16 v12 = "-[CSAttSiriContConvController _stopAttendingForRequestId:isReqCC:forceStop:]";
    __int16 v13 = 2112;
    id v14 = v9;
    __int16 v15 = 1024;
    BOOL v16 = v6;
    __int16 v17 = 1024;
    BOOL v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s mhId:%@ isReqCC:%u forceStop:%u", (uint8_t *)&v11, 0x22u);
  }
  objc_storeStrong((id *)&self->_prevStoppedMhId, a3);
  [(CSAttSiriContConvController *)self _stopTimers];
  if (!v6) {
    [(CSAttSiriContConvController *)self _stopNodes];
  }
  if (v5)
  {
    [(CSAttSiriOSDNode *)self->_osdNode stop];
    [(CSAttSiriController *)self->_attSiriController handleEndOfAttendingForRequestId:self->_requestMHUUID];
  }
}

- (void)_startAttendingWithAudioRecordContext:(id)a3 withRequestId:(id)a4 shouldStartTimer:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  int v11 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isAttending = self->_isAttending;
    requestMHUUID = self->_requestMHUUID;
    *(_DWORD *)buf = 136316162;
    v31 = "-[CSAttSiriContConvController _startAttendingWithAudioRecordContext:withRequestId:shouldStartTimer:]";
    __int16 v32 = 1024;
    *(_DWORD *)v33 = isAttending;
    *(_WORD *)&v33[4] = 2112;
    *(void *)&v33[6] = requestMHUUID;
    *(_WORD *)&v33[14] = 2112;
    *(void *)&v33[16] = v10;
    __int16 v34 = 1024;
    BOOL v35 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s _isAttending:%u _requestMHUUID:%@ mhId:%@ startTimer:%u", buf, 0x2Cu);
    int v11 = CSLogContextFacilityCoreSpeech;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double attendingTimeoutInSecs = self->_attendingTimeoutInSecs;
    *(_DWORD *)buf = 136315650;
    v31 = "-[CSAttSiriContConvController _startAttendingWithAudioRecordContext:withRequestId:shouldStartTimer:]";
    __int16 v32 = 2048;
    *(double *)v33 = attendingTimeoutInSecs;
    *(_WORD *)&v33[8] = 2048;
    *(void *)&v33[10] = 0x3FF0000000000000;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s _attendingTimeoutInSecs:%f kCSAttSiriAttendingTimeoutMinVal:%f", buf, 0x20u);
  }
  if (!self->_isAttending)
  {
    if (self->_prevStoppedMhId
      && objc_msgSend(v10, "isEqualToString:")
      && ![(CSAttSiriController *)self->_attSiriController getPendingActivationStatus])
    {
      v26 = CSLogContextFacilityCoreSpeech;
      if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      *(_DWORD *)buf = 136315394;
      v31 = "-[CSAttSiriContConvController _startAttendingWithAudioRecordContext:withRequestId:shouldStartTimer:]";
      __int16 v32 = 2112;
      *(void *)v33 = v10;
      BOOL v18 = "%s Ignoring attending start request for previously stopped MHId:%@";
    }
    else
    {
      objc_storeStrong((id *)&self->_audioRecordContext, a3);
      p_requestMHUUID = &self->_requestMHUUID;
      objc_storeStrong((id *)&self->_requestMHUUID, a4);
      [(CSAttSiriMagusLoggingNode *)self->_magusLoggingNode setMhId:v10];
      [(CSAttSiriMagusLoggingNode *)self->_magusLoggingNode setAudioRecordContext:self->_audioRecordContext];
      [(CSAttSiriMagusLoggingNode *)self->_magusLoggingNode stop];
      [(CSAttSiriOSDNode *)self->_osdNode resetForNewRequestWithRecordContext:self->_audioRecordContext endpointerSettings:0 voiceTriggerInfo:0 osdMode:1];
      [(CSAttSiriNode *)self->_gazeNode start];
      [(CSAttSiriAttentionNode *)self->_attentionNode start];
      [(CSAttSiriMotionNode *)self->_motionNode start];
      [(CSAttSiriMagusLoggingNode *)self->_magusLoggingNode start];
      __int16 v22 = +[CSFPreferences sharedPreferences];
      char v23 = [v22 isGazeSimlModelEnabled] ^ 1;

      __int16 v24 = [(CSAttSiriController *)self->_attSiriController attSiriSvcListener];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10006CA60;
      v28[3] = &unk_1002536A8;
      char v29 = v23;
      v28[4] = self;
      [v24 notifyClientsWithBlock:v28];

      self->_BOOL isAttending = 1;
      if (v5) {
        [(CSAttSiriContConvController *)self _setupAttendingTimer];
      }
      int v25 = +[CSAttSiriStateMonitor sharedInstance];
      [v25 updateState:1];

      v26 = CSLogContextFacilityCoreSpeech;
      if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      v27 = *p_requestMHUUID;
      *(_DWORD *)buf = 136315394;
      v31 = "-[CSAttSiriContConvController _startAttendingWithAudioRecordContext:withRequestId:shouldStartTimer:]";
      __int16 v32 = 2112;
      *(void *)v33 = v27;
      BOOL v18 = "%s Started attending for request Id: %@";
    }
    unsigned int v19 = v26;
    uint32_t v20 = 22;
    goto LABEL_20;
  }
  if (v5)
  {
    if ([(NSString *)self->_requestMHUUID isEqualToString:v10])
    {
      [(CSAttSiriContConvController *)self _setupAttendingTimer];
      __int16 v15 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v31 = "-[CSAttSiriContConvController _startAttendingWithAudioRecordContext:withRequestId:shouldStartTimer:]";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s Start/Restart attending timer", buf, 0xCu);
      }
    }
  }
  BOOL v16 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v17 = self->_requestMHUUID;
    *(_DWORD *)buf = 136315650;
    v31 = "-[CSAttSiriContConvController _startAttendingWithAudioRecordContext:withRequestId:shouldStartTimer:]";
    __int16 v32 = 2112;
    *(void *)v33 = v17;
    *(_WORD *)&v33[8] = 2112;
    *(void *)&v33[10] = v10;
    BOOL v18 = "%s Already attending with id: %@, ignore new start attending request for id: %@";
    unsigned int v19 = v16;
    uint32_t v20 = 32;
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
  }
LABEL_21:
}

- (void)updateSiriOrbLocation:(CGRect)a3
{
  if (self->_gazeNode)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006CC5C;
    block[3] = &unk_10024FC08;
    block[4] = self;
    CGRect v6 = a3;
    dispatch_async(queue, block);
  }
  else
  {
    int v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v8 = "-[CSAttSiriContConvController updateSiriOrbLocation:]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s gazeNode is nil!", buf, 0xCu);
    }
  }
}

- (void)relayGazeEstimates:(CGPoint)a3 landmarks:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  BOOL v8 = v7;
  if (self->_gazeNode)
  {
    queue = self->_queue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10006CE28;
    v11[3] = &unk_100250C70;
    v11[4] = self;
    CGFloat v13 = x;
    CGFloat v14 = y;
    id v12 = v7;
    dispatch_async(queue, v11);
  }
  else
  {
    id v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v16 = "-[CSAttSiriContConvController relayGazeEstimates:landmarks:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s gazeNode is nil!", buf, 0xCu);
    }
  }
}

- (void)gazeTrackerFaceTrackingMetaDataUpdate:(id)a3 atMachAbsTime:(unint64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (self->_gazeNode)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006CFE0;
    block[3] = &unk_1002532A8;
    block[4] = self;
    id v11 = v6;
    unint64_t v12 = a4;
    dispatch_async(queue, block);
  }
  else
  {
    id v9 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      CGFloat v14 = "-[CSAttSiriContConvController gazeTrackerFaceTrackingMetaDataUpdate:atMachAbsTime:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s gazeNode is nil!", buf, 0xCu);
    }
  }
}

- (void)attSiriNode:(id)a3 startSpeechProcessing:(unint64_t)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10006D0D4;
  v5[3] = &unk_100253B58;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)startMagusLoggingForTriggerRequest
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006D154;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopAttendingForRequestId:(id)a3 isReqCC:(BOOL)a4 forceStop:(BOOL)a5
{
  id v8 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006D210;
  block[3] = &unk_1002522D0;
  BOOL v14 = a4;
  BOOL v15 = a5;
  id v12 = v8;
  CGFloat v13 = self;
  id v10 = v8;
  dispatch_async(queue, block);
}

- (void)startAttendingWithAudioRecordContext:(id)a3 attendingSiriRequestContext:(id)a4 withRequestId:(id)a5 shouldStartTimer:(BOOL)a6
{
  id v9 = a3;
  id v10 = a5;
  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10006D3D0;
  v14[3] = &unk_100252588;
  BOOL v18 = a6;
  id v15 = v10;
  id v16 = v9;
  __int16 v17 = self;
  id v12 = v9;
  id v13 = v10;
  dispatch_async(queue, v14);
}

- (void)startAttendingWithAudioRecordContext:(id)a3 withRequestId:(id)a4 shouldStartTimer:(BOOL)a5
{
}

- (BOOL)shouldRunCCForAudioRecordContext:(id)a3
{
  if (-[CSAttSiriContConvController _shouldDisableCCForAudioRecordType:](self, "_shouldDisableCCForAudioRecordType:", [a3 type]))
  {
    return 0;
  }
  return [(CSAttSiriContConvController *)self _shouldConfigureAudioForContinuousConversation];
}

- (void)_setupGazeNodeWithAttSiriController:(id)a3
{
  id v4 = a3;
  BOOL v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    id v11 = "-[CSAttSiriContConvController _setupGazeNodeWithAttSiriController:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v10, 0xCu);
  }
  id v6 = [[CSAttSiriIOSGazeNode alloc] initWithAttSiriController:v4];
  gazeNode = self->_gazeNode;
  self->_gazeNode = (CSAttSiriNode *)v6;

  id v8 = self->_gazeNode;
  if (v8)
  {
    [(NSMutableDictionary *)self->_nodesCache setObject:v8 forKey:&off_10025DB58];
  }
  else
  {
    id v9 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      id v11 = "-[CSAttSiriContConvController _setupGazeNodeWithAttSiriController:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Gaze Node is nil!", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (BOOL)isInAttendingState
{
  return self->_isAttending;
}

- (CSAttSiriContConvController)initWithAttSiriController:(id)a3 supportAttentionLostAndGain:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v43.receiver = self;
  v43.super_class = (Class)CSAttSiriContConvController;
  id v8 = [(CSAttSiriContConvController *)&v43 init];
  id v9 = v8;
  if (!v8)
  {
LABEL_27:
    v36 = v9;
    goto LABEL_28;
  }
  objc_storeStrong((id *)&v8->_attSiriController, a3);
  dispatch_queue_t v10 = dispatch_queue_create("AttSiriCCController queue", 0);
  queue = v9->_queue;
  v9->_queue = (OS_dispatch_queue *)v10;

  uint64_t v12 = +[NSMutableDictionary dictionary];
  nodesCache = v9->_nodesCache;
  v9->_nodesCache = (NSMutableDictionary *)v12;

  if (CSIsIOS())
  {
    [(CSAttSiriContConvController *)v9 _applyGazeSignalMandate];
    if (v4)
    {
      BOOL v14 = [[CSAttSiriAttentionNode alloc] initWithAttSiriController:v9->_attSiriController];
      attentionNode = v9->_attentionNode;
      v9->_attentionNode = v14;

      id v16 = v9->_attentionNode;
      if (v16)
      {
        [(NSMutableDictionary *)v9->_nodesCache setObject:v16 forKey:&off_10025DAF8];
      }
      else
      {
        __int16 v17 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v45 = "-[CSAttSiriContConvController initWithAttSiriController:supportAttentionLostAndGain:]";
          _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s _attentionNode is nil!", buf, 0xCu);
        }
      }
    }
  }
  BOOL v18 = objc_alloc_init(CSAttSiriOSDNode);
  osdNode = v9->_osdNode;
  v9->_osdNode = v18;

  uint32_t v20 = v9->_osdNode;
  if (v20)
  {
    [(NSMutableDictionary *)v9->_nodesCache setObject:v20 forKey:&off_10025DB10];
    unsigned int v21 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v22 = v9->_osdNode;
      *(_DWORD *)buf = 136315394;
      v45 = "-[CSAttSiriContConvController initWithAttSiriController:supportAttentionLostAndGain:]";
      __int16 v46 = 2112;
      v47 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s _osdNode:%@", buf, 0x16u);
    }
    char v23 = +[CSFPreferences sharedPreferences];
    unsigned __int8 v24 = [v23 isAttentiveSiriAudioLoggingEnabled];

    if (v24)
    {
      int v25 = [[CSAttSiriMagusLoggingNode alloc] initWithAttSiriController:v9->_attSiriController];
      magusLoggingNode = v9->_magusLoggingNode;
      v9->_magusLoggingNode = v25;

      v27 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        v28 = v9->_magusLoggingNode;
        *(_DWORD *)buf = 136315394;
        v45 = "-[CSAttSiriContConvController initWithAttSiriController:supportAttentionLostAndGain:]";
        __int16 v46 = 2112;
        v47 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s Created _magusLoggingNode:%@", buf, 0x16u);
      }
      char v29 = v9->_magusLoggingNode;
      if (v29) {
        [(NSMutableDictionary *)v9->_nodesCache setObject:v29 forKey:&off_10025DB28];
      }
      if (CSIsIOS())
      {
        v30 = [[CSAttSiriMotionNode alloc] initWithAttSiriController:v9->_attSiriController];
        motionNode = v9->_motionNode;
        v9->_motionNode = v30;

        __int16 v32 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          v33 = v9->_motionNode;
          *(_DWORD *)buf = 136315394;
          v45 = "-[CSAttSiriContConvController initWithAttSiriController:supportAttentionLostAndGain:]";
          __int16 v46 = 2112;
          v47 = v33;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%s Created _motionNode:%@", buf, 0x16u);
        }
        __int16 v34 = v9->_motionNode;
        if (v34) {
          [(NSMutableDictionary *)v9->_nodesCache setObject:v34 forKey:&off_10025DB40];
        }
      }
    }
    else
    {
      v37 = v9->_magusLoggingNode;
      v9->_magusLoggingNode = 0;

      v38 = v9->_motionNode;
      v9->_motionNode = 0;
    }
    v39 = [[CSAttSiriAudioSessionStateClient alloc] initWithDelegate:v9];
    siriStateClient = v9->_siriStateClient;
    v9->_siriStateClient = v39;

    v9->_BOOL isAttending = 0;
    [(CSAttSiriContConvController *)v9 _configureAttendingTimeout];
    v41 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v45 = "-[CSAttSiriContConvController initWithAttSiriController:supportAttentionLostAndGain:]";
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%s Created AttSiriCCController", buf, 0xCu);
    }
    goto LABEL_27;
  }
  BOOL v35 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v45 = "-[CSAttSiriContConvController initWithAttSiriController:supportAttentionLostAndGain:]";
    _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%s _osdNode is nil! Initialization failed!", buf, 0xCu);
  }
  v36 = 0;
LABEL_28:

  return v36;
}

- (CSAttSiriContConvController)initWithAttSiriController:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSAttSiriContConvController *)self initWithAttSiriController:v4 supportAttentionLostAndGain:+[CSAttSiriAttentionNode supportAttentionLostAndGain]];

  return v5;
}

+ (BOOL)_isAttentionNodeAvailable
{
  return 1;
}

@end