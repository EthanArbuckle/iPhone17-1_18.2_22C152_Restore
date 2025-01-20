@interface CSAttendingSpeechDetectionController
- (BOOL)didActivate;
- (BOOL)isInitialTurnAnnounceFollowup;
- (BOOL)speechNearSpeechStartThresholdDetected;
- (CSAttSiriSignalOptions)signalOptions;
- (CSAttSiriTimer)speechDetectionTimer;
- (CSAttendingServiceDelegate)delegate;
- (CSAttendingSpeechDetectionController)init;
- (OS_dispatch_queue)queue;
- (double)firstSpeechFrameAudioTsInMs;
- (id)_updateAttendingOptionsForAnnounce:(id)a3;
- (void)_cancelSpeechDetectionTimer;
- (void)_setupSpeechDetectionTimerForDuration:(double)a3;
- (void)_startActivationAtHostTime:(unint64_t)a3 sampleCount:(unint64_t)a4 amountOfSpeechInMs:(float)a5;
- (void)attSiriSignalProvider:(id)a3 silenceFramesCountMs:(double)a4 silenceProbability:(double)a5 silenceDurationMs:(double)a6 processedAudioMs:(double)a7 deviceHasBoronEnabled:(BOOL)a8 latestBoronActiveSampleCount:(int64_t)a9;
- (void)attSiriSignalProviderDidStopUnexpectedly;
- (void)cancelAudioStreamHolding;
- (void)dealloc;
- (void)handleSpeechDetectionTimeout;
- (void)setDelegate:(id)a3;
- (void)setDidActivate:(BOOL)a3;
- (void)setFirstSpeechFrameAudioTsInMs:(double)a3;
- (void)setQueue:(id)a3;
- (void)setSignalOptions:(id)a3;
- (void)setSpeechDetectionTimer:(id)a3;
- (void)setSpeechNearSpeechStartThresholdDetected:(BOOL)a3;
- (void)startAttendingWithOptions:(id)a3 completion:(id)a4;
- (void)stopAttendingWithReason:(int64_t)a3;
@end

@implementation CSAttendingSpeechDetectionController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechDetectionTimer, 0);
  objc_storeStrong((id *)&self->_signalOptions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (BOOL)isInitialTurnAnnounceFollowup
{
  return self->_isInitialTurnAnnounceFollowup;
}

- (void)setSpeechNearSpeechStartThresholdDetected:(BOOL)a3
{
  self->_speechNearSpeechStartThresholdDetected = a3;
}

- (BOOL)speechNearSpeechStartThresholdDetected
{
  return self->_speechNearSpeechStartThresholdDetected;
}

- (void)setSpeechDetectionTimer:(id)a3
{
}

- (CSAttSiriTimer)speechDetectionTimer
{
  return self->_speechDetectionTimer;
}

- (void)setSignalOptions:(id)a3
{
}

- (CSAttSiriSignalOptions)signalOptions
{
  return self->_signalOptions;
}

- (void)setDidActivate:(BOOL)a3
{
  self->_didActivate = a3;
}

- (BOOL)didActivate
{
  return self->_didActivate;
}

- (void)setFirstSpeechFrameAudioTsInMs:(double)a3
{
  self->_firstSpeechFrameAudioTsInMs = a3;
}

- (double)firstSpeechFrameAudioTsInMs
{
  return self->_firstSpeechFrameAudioTsInMs;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setDelegate:(id)a3
{
}

- (CSAttendingServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSAttendingServiceDelegate *)WeakRetained;
}

- (void)cancelAudioStreamHolding
{
}

- (void)handleSpeechDetectionTimeout
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100063070;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)_updateAttendingOptionsForAnnounce:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!self->_isInitialTurnAnnounceFollowup)
  {
    if ([v4 recordType] == (id)25)
    {
      self->_isInitialTurnAnnounceFollowup = 1;
      goto LABEL_13;
    }
    id v7 = v5;
    if (!self->_isInitialTurnAnnounceFollowup) {
      goto LABEL_15;
    }
  }
  if ([v5 recordType] != (id)22)
  {
    id v7 = v5;
    if ([v5 recordType] == (id)22) {
      goto LABEL_15;
    }
    id v7 = v5;
    if ([v5 recordType] == (id)25) {
      goto LABEL_15;
    }
    v8 = CSLogCategoryAttending;
    if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      v11 = "-[CSAttendingSpeechDetectionController _updateAttendingOptionsForAnnounce:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Resetting _isInitialTurnAnnounceFollowup", (uint8_t *)&v10, 0xCu);
    }
    self->_isInitialTurnAnnounceFollowup = 0;
LABEL_13:
    id v7 = v5;
    goto LABEL_15;
  }
  v6 = CSLogCategoryAttending;
  if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    v11 = "-[CSAttendingSpeechDetectionController _updateAttendingOptionsForAnnounce:]";
    __int16 v12 = 2112;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Updating attending options for Announce to: %@", (uint8_t *)&v10, 0x16u);
  }
  id v7 = [v5 copyWithRecordType:25];

LABEL_15:
  return v7;
}

- (void)_cancelSpeechDetectionTimer
{
  speechDetectionTimer = self->_speechDetectionTimer;
  if (speechDetectionTimer)
  {
    id v4 = CSLogCategoryAttending;
    if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      id v7 = "-[CSAttendingSpeechDetectionController _cancelSpeechDetectionTimer]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
      speechDetectionTimer = self->_speechDetectionTimer;
    }
    [(CSAttSiriTimer *)speechDetectionTimer cancelTimer];
    v5 = self->_speechDetectionTimer;
    self->_speechDetectionTimer = 0;
  }
}

- (void)_setupSpeechDetectionTimerForDuration:(double)a3
{
  [(CSAttendingSpeechDetectionController *)self _cancelSpeechDetectionTimer];
  v5 = [[CSAttSiriTimer alloc] initWithQueue:0];
  speechDetectionTimer = self->_speechDetectionTimer;
  self->_speechDetectionTimer = v5;

  objc_initWeak(&location, self);
  id v7 = CSLogCategoryAttending;
  if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[CSAttendingSpeechDetectionController _setupSpeechDetectionTimerForDuration:]";
    __int16 v14 = 2048;
    double v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Setup speech detection timer for duration %f secs", buf, 0x16u);
  }
  v8 = self->_speechDetectionTimer;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10006355C;
  v9[3] = &unk_1002533D0;
  objc_copyWeak(&v10, &location);
  [(CSAttSiriTimer *)v8 setTimerForSecs:v9 completionBlock:a3];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_startActivationAtHostTime:(unint64_t)a3 sampleCount:(unint64_t)a4 amountOfSpeechInMs:(float)a5
{
  if (!self->_didActivate)
  {
    v9 = CSLogCategoryAttending;
    if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 136315906;
      v31 = "-[CSAttendingSpeechDetectionController _startActivationAtHostTime:sampleCount:amountOfSpeechInMs:]";
      __int16 v32 = 2048;
      unint64_t v33 = a3;
      __int16 v34 = 2048;
      unint64_t v35 = a4;
      __int16 v36 = 2048;
      double v37 = a5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s StartHostTime: %llu. SampleCount: %llu. AmountOfSpeechInMs: %f", (uint8_t *)&v30, 0x2Au);
    }
    self->_didActivate = 1;
    [(CSAttendingSpeechDetectionController *)self _cancelSpeechDetectionTimer];
    id v10 = +[CSAttSiriSignalProvider sharedProvider];
    [v10 stopWithObserver:self holdAudioStream:1];

    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v13 = WeakRetained;
      id v14 = objc_loadWeakRetained((id *)&self->_delegate);
      char v15 = objc_opt_respondsToSelector();

      if (v15)
      {
        id v16 = objc_loadWeakRetained((id *)&self->_delegate);
        [v16 attendingStoppedWithReason:1];
      }
    }
    v17 = [(CSAttSiriSignalOptions *)self->_signalOptions attendingOptions];
    v18 = [CSAttendingTriggerInfo alloc];
    id v19 = [v17 attendingType];
    id v20 = [v17 recordType];
    v21 = [v17 deviceId];
    [v17 startOfSpeechThresholdInMs];
    *(float *)&double v23 = v22;
    *(float *)&double v22 = a5;
    v24 = [(CSAttendingTriggerInfo *)v18 initWithAttendingType:v19 detectedToken:0 triggerMachTime:a3 triggerAbsStartSampleId:a4 audioRecordType:v20 audioRecordDeviceId:v21 amountOfSpeechDetectedInMs:v22 triggerThresholdInMs:v23];

    id v25 = objc_loadWeakRetained((id *)p_delegate);
    if (v25)
    {
      v26 = v25;
      id v27 = objc_loadWeakRetained((id *)p_delegate);
      char v28 = objc_opt_respondsToSelector();

      if (v28)
      {
        id v29 = objc_loadWeakRetained((id *)p_delegate);
        [v29 speechStartDetectedWithEventInfo:v24];
      }
    }
  }
}

- (void)attSiriSignalProvider:(id)a3 silenceFramesCountMs:(double)a4 silenceProbability:(double)a5 silenceDurationMs:(double)a6 processedAudioMs:(double)a7 deviceHasBoronEnabled:(BOOL)a8 latestBoronActiveSampleCount:(int64_t)a9
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000638FC;
  block[3] = &unk_1002514A8;
  block[4] = self;
  *(double *)&void block[5] = a4;
  *(double *)&block[6] = a7;
  BOOL v11 = a8;
  block[7] = a9;
  dispatch_async(queue, block);
}

- (void)attSiriSignalProviderDidStopUnexpectedly
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100064218;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopAttendingWithReason:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000643D0;
  v4[3] = &unk_100253B58;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)startAttendingWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100064698;
  block[3] = &unk_100253280;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)dealloc
{
  v3 = CSLogCategoryAttending;
  if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v6 = "-[CSAttendingSpeechDetectionController dealloc]";
    __int16 v7 = 2112;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Dealloc: %@", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSAttendingSpeechDetectionController;
  [(CSAttendingSpeechDetectionController *)&v4 dealloc];
}

- (CSAttendingSpeechDetectionController)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSAttendingSpeechDetectionController;
  v2 = [(CSAttendingSpeechDetectionController *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSAttendingSpeechDetectionController queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_isInitialTurnAnnounceFollowup = 0;
  }
  return v2;
}

@end