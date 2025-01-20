@interface ADOpportuneSpeakingModuleEdgeDetector
- (ADOpportuneSpeakingModuleEdgeDetector)initWithQueue:(id)a3 stateManager:(id)a4;
- (BOOL)isListening;
- (id)modeDescriptionFor:(unint64_t)a3;
- (unsigned)_framesPerSecondForOpportuneSpeakListeningType:(unint64_t)a3;
- (void)_didStartListening;
- (void)_didStopListening;
- (void)_handleFrame:(unint64_t)a3;
- (void)_initializeVoiceThresholdsForOpportuneSpeakListeningType:(unint64_t)a3;
- (void)_resetStateWithCompletion:(id)a3;
- (void)_restartAndExtendListening;
- (void)_scheduleTimerForMaxDelay:(float)a3;
- (void)_stopListeningWithCompletion:(id)a3;
- (void)_thresholdDetected;
- (void)dealloc;
- (void)listenForPauseWithOptions:(id)a3 forPause:(float)a4 maxDelay:(float)a5 stopOnDetection:(BOOL)a6 executeOnSuccess:(id)a7 onFail:(id)a8;
- (void)listenForUserSpeechWithOptions:(id)a3 forVoice:(float)a4 maxDelay:(float)a5 stopOnDetection:(BOOL)a6 executeOnSuccess:(id)a7 onFail:(id)a8;
- (void)opportuneSpeakListener:(id)a3 didStopUnexpectly:(BOOL)a4;
- (void)opportuneSpeakListener:(id)a3 hasRemoteVADAvailable:(BOOL)a4;
- (void)opportuneSpeakListener:(id)a3 hasVADAvailable:(BOOL)a4 withHostTime:(float)a5;
- (void)stopListening;
- (void)updateAttendingThreshold:(float)a3;
@end

@implementation ADOpportuneSpeakingModuleEdgeDetector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_failCompletionBlock, 0);
  objc_storeStrong(&self->_successCompletionBlock, 0);
  objc_storeStrong((id *)&self->_listeningOptions, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_stateManager, 0);
  objc_storeStrong((id *)&self->_avbuffer, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (BOOL)isListening
{
  return self->_isListening;
}

- (void)opportuneSpeakListener:(id)a3 didStopUnexpectly:(BOOL)a4
{
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000C604C;
  v5[3] = &unk_10050CD50;
  BOOL v6 = a4;
  v5[4] = self;
  dispatch_async(dispatchQueue, v5);
}

- (void)opportuneSpeakListener:(id)a3 hasVADAvailable:(BOOL)a4 withHostTime:(float)a5
{
  dispatchQueue = self->_dispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000C6210;
  v6[3] = &unk_100500FA8;
  v6[4] = self;
  BOOL v8 = a4;
  float v7 = a5;
  dispatch_async(dispatchQueue, v6);
}

- (void)opportuneSpeakListener:(id)a3 hasRemoteVADAvailable:(BOOL)a4
{
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000C63B4;
  v5[3] = &unk_10050CD50;
  v5[4] = self;
  BOOL v6 = a4;
  dispatch_async(dispatchQueue, v5);
}

- (id)modeDescriptionFor:(unint64_t)a3
{
  if (a3) {
    return @"ADOSMED_PAUSE";
  }
  else {
    return @"ADOSMED_SPEECH";
  }
}

- (void)_didStopListening
{
}

- (void)_didStartListening
{
}

- (void)_restartAndExtendListening
{
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    float v7 = "-[ADOpportuneSpeakingModuleEdgeDetector _restartAndExtendListening]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s OPPSPK - Restarting listener to bypass 90 second recording limit", buf, 0xCu);
  }
  self->_isStopping = 1;
  listener = self->_listener;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000C6620;
  v5[3] = &unk_10050B720;
  v5[4] = self;
  [(CSOpportuneSpeakListener *)listener stopListenWithStateReset:0 completion:v5];
}

- (void)stopListening
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C6A30;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_stopListeningWithCompletion:(id)a3
{
  id v4 = a3;
  if (!self->_isStopping)
  {
    self->_isStopping = 1;
    [(AFWatchdogTimer *)self->_timer cancel];
    timer = self->_timer;
    self->_timer = 0;

    listener = self->_listener;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000C6BB4;
    v7[3] = &unk_100500F80;
    v7[4] = self;
    id v8 = v4;
    [(CSOpportuneSpeakListener *)listener stopListenWithStateReset:1 completion:v7];
  }
}

- (void)_thresholdDetected
{
  if (self->_dispatchQueue)
  {
    BOOL shouldStopListeningOnDetection = self->_shouldStopListeningOnDetection;
    id v4 = AFSiriLogContextDaemon;
    BOOL v5 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (shouldStopListeningOnDetection)
    {
      if (v5)
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = "-[ADOpportuneSpeakingModuleEdgeDetector _thresholdDetected]";
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s OPPSPK - stop listening event detected, stopping listener", (uint8_t *)&buf, 0xCu);
      }
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v14 = 0x3032000000;
      v15 = sub_1000C7070;
      v16 = sub_1000C709C;
      id v17 = objc_retainBlock(self->_successCompletionBlock);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000C70A4;
      v12[3] = &unk_100500F58;
      v12[4] = self;
      v12[5] = &buf;
      [(ADOpportuneSpeakingModuleEdgeDetector *)self _stopListeningWithCompletion:v12];
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      if (v5)
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = "-[ADOpportuneSpeakingModuleEdgeDetector _thresholdDetected]";
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s OPPSPK - stop listening event detected, not stopping listener", (uint8_t *)&buf, 0xCu);
      }
      successCompletionBlock = (uint64_t (**)(id, float))self->_successCompletionBlock;
      if (successCompletionBlock)
      {
        float v7 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "-[ADOpportuneSpeakingModuleEdgeDetector _thresholdDetected]";
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s OPPSPK - will call completion but not stop listener", (uint8_t *)&buf, 0xCu);
          successCompletionBlock = (uint64_t (**)(id, float))self->_successCompletionBlock;
        }
        int v8 = successCompletionBlock[2](successCompletionBlock, self->_mostRecentAudioFrameHostTime);
        v9 = AFSiriLogContextDaemon;
        BOOL v10 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
        if (v8)
        {
          if (v10)
          {
            LODWORD(buf) = 136315138;
            *(void *)((char *)&buf + 4) = "-[ADOpportuneSpeakingModuleEdgeDetector _thresholdDetected]";
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s OPPSPK - resetting state and continuing to send threshold events", (uint8_t *)&buf, 0xCu);
          }
          self->_inVoice = 0;
          *(void *)&self->_currentPausedFrameCount = 0;
        }
        else
        {
          if (v10)
          {
            LODWORD(buf) = 136315138;
            *(void *)((char *)&buf + 4) = "-[ADOpportuneSpeakingModuleEdgeDetector _thresholdDetected]";
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s OPPSPK - done sending threshold events", (uint8_t *)&buf, 0xCu);
          }
          id v11 = self->_successCompletionBlock;
          self->_successCompletionBlock = 0;
        }
      }
    }
  }
}

- (void)_handleFrame:(unint64_t)a3
{
  if (!a3) {
    goto LABEL_4;
  }
  if (a3 != 1)
  {
    id v11 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v29 = 136315138;
      *(void *)&v29[4] = "-[ADOpportuneSpeakingModuleEdgeDetector _handleFrame:]";
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Invalid frame type passed to _handleFrame", v29, 0xCu);
    }
    return;
  }
  if (!self->_currentHasAccel) {
    BOOL currentHasVAD = 0;
  }
  else {
LABEL_4:
  }
    BOOL currentHasVAD = self->_currentHasVAD;
  uint64_t v5 = _AFPreferencesOpportuneSpeakingEdgeDetectorSignalOverride();
  if ((AFIsInternalInstall() & (v5 != -1)) != 0) {
    unsigned __int8 v6 = v5;
  }
  else {
    unsigned __int8 v6 = currentHasVAD;
  }
  [(ADOpportuneSpeakingMovingAverageBuffer *)self->_avbuffer add:v6];
  [(ADOpportuneSpeakingMovingAverageBuffer *)self->_avbuffer movingAverage];
  if (v7 > self->_voiceOnMin)
  {
    ++self->_currentVoiceFrameCount;
    if (!self->_inVoice)
    {
      int v8 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int currentFrameCount = self->_currentFrameCount;
        *(_DWORD *)v29 = 136315394;
        *(void *)&v29[4] = "-[ADOpportuneSpeakingModuleEdgeDetector _handleFrame:]";
        *(_WORD *)&v29[12] = 1024;
        *(_DWORD *)&v29[14] = currentFrameCount;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s OPPSPK - VOICE STARTS frame = %d", v29, 0x12u);
      }
      self->_inVoice = 1;
    }
    uint64_t v10 = 64;
LABEL_22:
    *(_DWORD *)((char *)&self->super.isa + v10) = 0;
    goto LABEL_23;
  }
  [(ADOpportuneSpeakingMovingAverageBuffer *)self->_avbuffer movingAverage];
  if (v12 < self->_voiceOffMax)
  {
    ++self->_currentPausedFrameCount;
    if (self->_inVoice)
    {
      v13 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v14 = self->_currentFrameCount;
        *(_DWORD *)v29 = 136315394;
        *(void *)&v29[4] = "-[ADOpportuneSpeakingModuleEdgeDetector _handleFrame:]";
        *(_WORD *)&v29[12] = 1024;
        *(_DWORD *)&v29[14] = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s OPPSPK - VOICE ENDS frame = %d", v29, 0x12u);
      }
      self->_inVoice = 0;
    }
    uint64_t v10 = 68;
    goto LABEL_22;
  }
LABEL_23:
  int v15 = self->_currentFrameCount + 1;
  self->_int currentFrameCount = v15;
  v16 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int currentPausedFrameCount = self->_currentPausedFrameCount;
    int currentVoiceFrameCount = self->_currentVoiceFrameCount;
    BOOL currentHasAccel = self->_currentHasAccel;
    BOOL v25 = self->_currentHasVAD;
    avbuffer = self->_avbuffer;
    v27 = v16;
    [(ADOpportuneSpeakingMovingAverageBuffer *)avbuffer movingAverage];
    *(_DWORD *)v29 = 136316674;
    *(void *)&v29[4] = "-[ADOpportuneSpeakingModuleEdgeDetector _handleFrame:]";
    *(_WORD *)&v29[12] = 1024;
    *(_DWORD *)&v29[14] = v15;
    *(_WORD *)&v29[18] = 1024;
    *(_DWORD *)&v29[20] = currentVoiceFrameCount;
    __int16 v30 = 1024;
    int v31 = currentPausedFrameCount;
    __int16 v32 = 1024;
    BOOL v33 = currentHasAccel;
    __int16 v34 = 1024;
    BOOL v35 = v25;
    __int16 v36 = 2048;
    double v37 = v28;
    _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "%s OPPSPK - frame %d/%d/%d wearer=%d ambient=%d moving=%f", v29, 0x34u);
  }
  unint64_t mode = self->_mode;
  if (!mode)
  {
    if (self->_currentVoiceFrameCount < self->_thresholdFrameCount) {
      return;
    }
    v18 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO)) {
      goto LABEL_34;
    }
    int v21 = self->_currentFrameCount;
    *(_DWORD *)v29 = 136315394;
    *(void *)&v29[4] = "-[ADOpportuneSpeakingModuleEdgeDetector _handleFrame:]";
    *(_WORD *)&v29[12] = 1024;
    *(_DWORD *)&v29[14] = v21;
    v20 = "%s OPPSPK - SPEECH SEEN frame = %d";
    goto LABEL_33;
  }
  if (mode == 1 && self->_currentPausedFrameCount >= self->_thresholdFrameCount)
  {
    v18 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
LABEL_34:
      [(ADOpportuneSpeakingModuleEdgeDetector *)self _thresholdDetected];
      return;
    }
    int v19 = self->_currentFrameCount;
    *(_DWORD *)v29 = 136315394;
    *(void *)&v29[4] = "-[ADOpportuneSpeakingModuleEdgeDetector _handleFrame:]";
    *(_WORD *)&v29[12] = 1024;
    *(_DWORD *)&v29[14] = v19;
    v20 = "%s OPPSPK - PAUSE SEEN frame = %d";
LABEL_33:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, v20, v29, 0x12u);
    goto LABEL_34;
  }
}

- (void)updateAttendingThreshold:(float)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000C7554;
  v4[3] = &unk_1005012D0;
  v4[4] = self;
  float v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)listenForUserSpeechWithOptions:(id)a3 forVoice:(float)a4 maxDelay:(float)a5 stopOnDetection:(BOOL)a6 executeOnSuccess:(id)a7 onFail:(id)a8
{
  BOOL v10 = a6;
  id v15 = a3;
  id v16 = a8;
  id v17 = a7;
  unsigned int v18 = -[ADOpportuneSpeakingModuleEdgeDetector _framesPerSecondForOpportuneSpeakListeningType:](self, "_framesPerSecondForOpportuneSpeakListeningType:", [v15 opportuneSpeakListeningType]);
  self->_inVoice = 0;
  *(void *)&self->_int currentPausedFrameCount = 0;
  self->_int currentFrameCount = 0;
  id v19 = objc_retainBlock(v17);

  id successCompletionBlock = self->_successCompletionBlock;
  self->_id successCompletionBlock = v19;

  id v21 = objc_retainBlock(v16);
  id failCompletionBlock = self->_failCompletionBlock;
  self->_id failCompletionBlock = v21;

  self->_thresholdFrameCount = (int)(float)((float)v18 * a4);
  self->_unint64_t mode = 0;
  self->_isListening = 1;
  self->_isStopping = 0;
  v23 = [v15 deviceId];
  deviceID = self->_deviceID;
  self->_deviceID = v23;

  self->_maxDelay = a5;
  BOOL v25 = [[ADOpportuneSpeakingMovingAverageBuffer alloc] initWithSize:self->_thresholdFrameCount];
  avbuffer = self->_avbuffer;
  self->_avbuffer = v25;

  self->_BOOL shouldStopListeningOnDetection = v10;
  objc_storeStrong((id *)&self->_listeningOptions, a3);
  -[ADOpportuneSpeakingModuleEdgeDetector _initializeVoiceThresholdsForOpportuneSpeakListeningType:](self, "_initializeVoiceThresholdsForOpportuneSpeakListeningType:", [v15 opportuneSpeakListeningType]);
  v27 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    CFStringRef v29 = @"NO";
    if (v10) {
      CFStringRef v29 = @"YES";
    }
    *(_DWORD *)long long buf = 136315394;
    BOOL v33 = "-[ADOpportuneSpeakingModuleEdgeDetector listenForUserSpeechWithOptions:forVoice:maxDelay:stopOnDetection:execu"
          "teOnSuccess:onFail:]";
    __int16 v34 = 2112;
    CFStringRef v35 = v29;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s shouldStopListeningOnDetection:%@", buf, 0x16u);
  }
  *(float *)&double v28 = a5;
  [(ADOpportuneSpeakingModuleEdgeDetector *)self _scheduleTimerForMaxDelay:v28];
  listener = self->_listener;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000C7914;
  v31[3] = &unk_10050B720;
  v31[4] = self;
  [(CSOpportuneSpeakListener *)listener startListenWithOption:v15 completion:v31];
}

- (void)listenForPauseWithOptions:(id)a3 forPause:(float)a4 maxDelay:(float)a5 stopOnDetection:(BOOL)a6 executeOnSuccess:(id)a7 onFail:(id)a8
{
  BOOL v10 = a6;
  id v15 = a3;
  id v16 = a8;
  id v17 = a7;
  LODWORD(a8) = -[ADOpportuneSpeakingModuleEdgeDetector _framesPerSecondForOpportuneSpeakListeningType:](self, "_framesPerSecondForOpportuneSpeakListeningType:", [v15 opportuneSpeakListeningType]);
  self->_inVoice = 0;
  *(void *)&self->_int currentPausedFrameCount = 0;
  self->_int currentFrameCount = 0;
  id v18 = objc_retainBlock(v17);

  id successCompletionBlock = self->_successCompletionBlock;
  self->_id successCompletionBlock = v18;

  id v20 = objc_retainBlock(v16);
  id failCompletionBlock = self->_failCompletionBlock;
  self->_id failCompletionBlock = v20;

  self->_thresholdFrameCount = (int)(float)((float)a8 * a4);
  self->_unint64_t mode = 1;
  self->_isListening = 1;
  self->_isStopping = 0;
  v22 = [v15 deviceId];
  deviceID = self->_deviceID;
  self->_deviceID = v22;

  self->_maxDelay = a5;
  v24 = [[ADOpportuneSpeakingMovingAverageBuffer alloc] initWithSize:(int)((double)a8 * 0.5)];
  avbuffer = self->_avbuffer;
  self->_avbuffer = v24;

  self->_BOOL shouldStopListeningOnDetection = v10;
  objc_storeStrong((id *)&self->_listeningOptions, a3);
  -[ADOpportuneSpeakingModuleEdgeDetector _initializeVoiceThresholdsForOpportuneSpeakListeningType:](self, "_initializeVoiceThresholdsForOpportuneSpeakListeningType:", [v15 opportuneSpeakListeningType]);
  v26 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    CFStringRef v28 = @"NO";
    if (v10) {
      CFStringRef v28 = @"YES";
    }
    *(_DWORD *)long long buf = 136315394;
    __int16 v32 = "-[ADOpportuneSpeakingModuleEdgeDetector listenForPauseWithOptions:forPause:maxDelay:stopOnDetection:executeOnSuccess:onFail:]";
    __int16 v33 = 2112;
    CFStringRef v34 = v28;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s shouldStopListeningOnDetection:%@", buf, 0x16u);
  }
  *(float *)&double v27 = a5;
  [(ADOpportuneSpeakingModuleEdgeDetector *)self _scheduleTimerForMaxDelay:v27];
  listener = self->_listener;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000C7D14;
  v30[3] = &unk_10050B720;
  v30[4] = self;
  [(CSOpportuneSpeakListener *)listener startListenWithOption:v15 completion:v30];
}

- (void)_scheduleTimerForMaxDelay:(float)a3
{
  id v5 = objc_alloc((Class)AFWatchdogTimer);
  dispatchQueue = self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000C7F50;
  v9[3] = &unk_10050E138;
  v9[4] = self;
  float v7 = (AFWatchdogTimer *)[v5 initWithTimeoutInterval:dispatchQueue onQueue:v9 timeoutHandler:a3];
  timer = self->_timer;
  self->_timer = v7;

  [(AFWatchdogTimer *)self->_timer start];
}

- (void)_resetStateWithCompletion:(id)a3
{
  id v7 = a3;
  [(ADOpportuneSpeakingModuleEdgeDetector *)self _didStopListening];
  self->_isListening = 0;
  id failCompletionBlock = self->_failCompletionBlock;
  self->_id failCompletionBlock = 0;

  id successCompletionBlock = self->_successCompletionBlock;
  self->_id successCompletionBlock = 0;

  unsigned __int8 v6 = v7;
  self->_inVoice = 0;
  *(void *)&self->_int currentPausedFrameCount = 0;
  self->_int currentFrameCount = 0;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    unsigned __int8 v6 = v7;
  }
}

- (void)_initializeVoiceThresholdsForOpportuneSpeakListeningType:(unint64_t)a3
{
  if (a3 == 1)
  {
    _AFPreferencesAnnounceCallsVoiceOnMinRatio();
    self->_double voiceOnMin = v7;
    _AFPreferencesAnnounceCallsVoiceOffMaxRatio();
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    _AFPreferencesAnnounceNotificationsVoiceOnMinRatio();
    self->_double voiceOnMin = v5;
    _AFPreferencesAnnounceNotificationsVoiceOffMaxRatio();
  }
  self->_double voiceOffMax = v6;
LABEL_6:
  int v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    double voiceOnMin = self->_voiceOnMin;
    double voiceOffMax = self->_voiceOffMax;
    int v11 = 136315906;
    float v12 = "-[ADOpportuneSpeakingModuleEdgeDetector _initializeVoiceThresholdsForOpportuneSpeakListeningType:]";
    __int16 v13 = 2048;
    double v14 = voiceOnMin;
    __int16 v15 = 2048;
    double v16 = voiceOffMax;
    __int16 v17 = 2048;
    unint64_t v18 = a3;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s Using voiceOnMin: %f, voiceOffMax: %f for listening type: %lu", (uint8_t *)&v11, 0x2Au);
  }
}

- (unsigned)_framesPerSecondForOpportuneSpeakListeningType:(unint64_t)a3
{
  if (!a3) {
    return 50;
  }
  if (a3 == 1) {
    return 100;
  }
  id v4 = AFSiriLogContextDaemon;
  unsigned int result = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR);
  if (result)
  {
    int v5 = 136315138;
    float v6 = "-[ADOpportuneSpeakingModuleEdgeDetector _framesPerSecondForOpportuneSpeakListeningType:]";
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s Invalid listeningType passed to _framesPerSecondForOpportuneSpeakListeningType", (uint8_t *)&v5, 0xCu);
    return 0;
  }
  return result;
}

- (void)dealloc
{
  [(ADOpportuneSpeakingModuleEdgeDetector *)self _resetStateWithCompletion:0];
  v3.receiver = self;
  v3.super_class = (Class)ADOpportuneSpeakingModuleEdgeDetector;
  [(ADOpportuneSpeakingModuleEdgeDetector *)&v3 dealloc];
}

- (ADOpportuneSpeakingModuleEdgeDetector)initWithQueue:(id)a3 stateManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ADOpportuneSpeakingModuleEdgeDetector;
  v9 = [(ADOpportuneSpeakingModuleEdgeDetector *)&v19 init];
  if (v9)
  {
    BOOL v10 = (NSUUID *)objc_alloc_init((Class)NSUUID);
    uuid = v9->_uuid;
    v9->_uuid = v10;

    *(_WORD *)&v9->_BOOL currentHasAccel = 0;
    v9->_inVoice = 0;
    *(void *)&v9->_int currentPausedFrameCount = 0;
    v9->_int currentFrameCount = 0;
    id successCompletionBlock = v9->_successCompletionBlock;
    v9->_id successCompletionBlock = 0;

    id failCompletionBlock = v9->_failCompletionBlock;
    v9->_id failCompletionBlock = 0;

    v9->_isListening = 0;
    v9->_isStopping = 0;
    objc_storeStrong((id *)&v9->_dispatchQueue, a3);
    objc_storeStrong((id *)&v9->_stateManager, a4);
    double v14 = (CSOpportuneSpeakListener *)objc_alloc_init((Class)CSOpportuneSpeakListener);
    listener = v9->_listener;
    v9->_listener = v14;

    [(CSOpportuneSpeakListener *)v9->_listener setDelegate:v9];
    listeningOptions = v9->_listeningOptions;
    v9->_listeningOptions = 0;

    v9->_BOOL shouldStopListeningOnDetection = 1;
    __int16 v17 = v9;
  }

  return v9;
}

@end