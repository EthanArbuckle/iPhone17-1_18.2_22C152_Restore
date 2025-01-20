@interface CSLocalAttendingInitiator
- (BOOL)fetchIsAttending;
- (BOOL)isAttending;
- (BOOL)isStoppingForSiriUIDismissal;
- (CSAttendingService)usecaseController;
- (CSLocalAttendingInitiator)initWithAttendingUsecase:(id)a3;
- (LBAttendingStatesServiceDelegate)delegate;
- (NSString)lastLoggedMhUUID;
- (NSString)mhUUID;
- (NSString)rootRequestId;
- (NSString)rootRequestIdForLogging;
- (NSString)rootRequestIdForWillAttendSignal;
- (NSString)rootRequestIdWithMagusDisabled;
- (OS_dispatch_group)attendingStartTransitionGroup;
- (OS_dispatch_queue)queue;
- (int64_t)_stopReasonFromHint:(unint64_t)a3;
- (unint64_t)startAttendingHostTime;
- (void)_emitSpeechStartDetectedEventWithAttendingTriggerInfo:(id)a3;
- (void)_handleClientAudioDidStartMessage;
- (void)_handleSpeechStartDetectedWithEventInfo:(id)a3;
- (void)_reset;
- (void)_resetIsStoppingForSiriUIDismissal;
- (void)_startAttendingForJarvisAnnounceMessageWithInfo:(id)a3;
- (void)_startAttendingWithInfo:(id)a3;
- (void)_startAttendingWithOptions:(id)a3;
- (void)_stopAttendingWithReason:(unint64_t)a3;
- (void)attendingStoppedWithReason:(int64_t)a3;
- (void)intuitiveConvAudioCaptureMonitor:(id)a3 didStartAudioCaptureSuccessfully:(BOOL)a4 option:(id)a5 eventUUID:(id)a6;
- (void)receivedAttendingJarvisHintWithInfo:(id)a3;
- (void)receivedAttendingMagusNotSupportedHintWithInfo:(id)a3;
- (void)receivedAttendingStartHintWithInfo:(id)a3;
- (void)receivedAttendingStopHintWithInfo:(id)a3;
- (void)receivedAttendingTriggerForSiriPromptHintWithInfo:(id)a3;
- (void)receivedAttendingWillStartHintWithInfo:(id)a3;
- (void)setAttendingStartTransitionGroup:(id)a3;
- (void)setAttendingState:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setIsAttending:(BOOL)a3;
- (void)setIsStoppingForSiriUIDismissal:(BOOL)a3;
- (void)setLastLoggedMhUUID:(id)a3;
- (void)setMhUUID:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRootRequestId:(id)a3;
- (void)setRootRequestIdForLogging:(id)a3;
- (void)setRootRequestIdForWillAttendSignal:(id)a3;
- (void)setRootRequestIdWithMagusDisabled:(id)a3;
- (void)setStartAttendingHostTime:(unint64_t)a3;
- (void)setUsecaseController:(id)a3;
- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7;
- (void)speechStartDetectedWithEventInfo:(id)a3;
@end

@implementation CSLocalAttendingInitiator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLoggedMhUUID, 0);
  objc_storeStrong((id *)&self->_attendingStartTransitionGroup, 0);
  objc_storeStrong((id *)&self->_mhUUID, 0);
  objc_storeStrong((id *)&self->_rootRequestIdForWillAttendSignal, 0);
  objc_storeStrong((id *)&self->_rootRequestIdForLogging, 0);
  objc_storeStrong((id *)&self->_rootRequestIdWithMagusDisabled, 0);
  objc_storeStrong((id *)&self->_rootRequestId, 0);
  objc_storeStrong((id *)&self->_usecaseController, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setLastLoggedMhUUID:(id)a3
{
}

- (NSString)lastLoggedMhUUID
{
  return self->_lastLoggedMhUUID;
}

- (void)setAttendingStartTransitionGroup:(id)a3
{
}

- (OS_dispatch_group)attendingStartTransitionGroup
{
  return self->_attendingStartTransitionGroup;
}

- (void)setMhUUID:(id)a3
{
}

- (NSString)mhUUID
{
  return self->_mhUUID;
}

- (void)setStartAttendingHostTime:(unint64_t)a3
{
  self->_startAttendingHostTime = a3;
}

- (unint64_t)startAttendingHostTime
{
  return self->_startAttendingHostTime;
}

- (void)setRootRequestIdForWillAttendSignal:(id)a3
{
}

- (NSString)rootRequestIdForWillAttendSignal
{
  return self->_rootRequestIdForWillAttendSignal;
}

- (void)setRootRequestIdForLogging:(id)a3
{
}

- (NSString)rootRequestIdForLogging
{
  return self->_rootRequestIdForLogging;
}

- (void)setRootRequestIdWithMagusDisabled:(id)a3
{
}

- (NSString)rootRequestIdWithMagusDisabled
{
  return self->_rootRequestIdWithMagusDisabled;
}

- (void)setRootRequestId:(id)a3
{
}

- (NSString)rootRequestId
{
  return self->_rootRequestId;
}

- (void)setIsStoppingForSiriUIDismissal:(BOOL)a3
{
  self->_isStoppingForSiriUIDismissal = a3;
}

- (BOOL)isStoppingForSiriUIDismissal
{
  return self->_isStoppingForSiriUIDismissal;
}

- (void)setIsAttending:(BOOL)a3
{
  self->_isAttending = a3;
}

- (BOOL)isAttending
{
  return self->_isAttending;
}

- (void)setUsecaseController:(id)a3
{
}

- (CSAttendingService)usecaseController
{
  return self->_usecaseController;
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

- (LBAttendingStatesServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (LBAttendingStatesServiceDelegate *)WeakRetained;
}

- (void)_resetIsStoppingForSiriUIDismissal
{
  self->_isStoppingForSiriUIDismissal = 0;
}

- (void)_emitSpeechStartDetectedEventWithAttendingTriggerInfo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_mhUUID)
  {
    v6 = (char *)[v4 triggerMachTime] - self->_startAttendingHostTime;
    v7 = (void *)CSLogCategoryAttending;
    if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      [v5 amountOfSpeechDetectedInMs];
      double v10 = v9;
      [v5 triggerThresholdInMs];
      mhUUID = self->_mhUUID;
      rootRequestIdForLogging = self->_rootRequestIdForLogging;
      int v26 = 136316418;
      v27 = "-[CSLocalAttendingInitiator _emitSpeechStartDetectedEventWithAttendingTriggerInfo:]";
      __int16 v28 = 2048;
      double v29 = v10;
      __int16 v30 = 2048;
      double v31 = v13;
      __int16 v32 = 2048;
      v33 = v6;
      __int16 v34 = 2112;
      v35 = mhUUID;
      __int16 v36 = 2112;
      v37 = rootRequestIdForLogging;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Emit SpeechStartDetected amountOfSpeech: %f, threshold: %f, attendingDuration: %llu, mhUUID: %@, rootRequestIdForLogging: %@", (uint8_t *)&v26, 0x3Eu);
    }
    id v14 = objc_alloc_init((Class)MHSchemaMHSpeechDetectorContext);
    id v15 = objc_alloc_init((Class)MHSchemaMHSpeechDetectorEnded);
    id v16 = objc_alloc((Class)SISchemaUUID);
    id v17 = [objc_alloc((Class)NSUUID) initWithUUIDString:self->_rootRequestIdForLogging];
    id v18 = [v16 initWithNSUUID:v17];
    [v15 setPreviousRequestId:v18];

    [v5 amountOfSpeechDetectedInMs];
    objc_msgSend(v15, "setAmountOfSpeechDetectedInMs:");
    [v5 triggerThresholdInMs];
    objc_msgSend(v15, "setStartSpeechDetectionThresholdInMs:");
    objc_msgSend(v15, "setTimeSinceLastAcceptedRequestInNs:", +[CSFTimeUtils hostTimeToNs:](CSFTimeUtils, "hostTimeToNs:", v6));
    [v14 setEnded:v15];
    id v19 = objc_alloc_init((Class)MHSchemaMHClientEvent);
    id v20 = objc_alloc_init((Class)MHSchemaMHClientEventMetadata);
    id v21 = objc_alloc((Class)SISchemaUUID);
    id v22 = [objc_alloc((Class)NSUUID) initWithUUIDString:self->_mhUUID];
    id v23 = [v21 initWithNSUUID:v22];
    [v20 setMhId:v23];

    [v19 setEventMetadata:v20];
    [v19 setSpeechDetectorContext:v14];
    v24 = +[AssistantSiriAnalytics sharedStream];
    [v24 emitMessage:v19];
  }
  else
  {
    v25 = CSLogCategoryAttending;
    if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 136315138;
      v27 = "-[CSLocalAttendingInitiator _emitSpeechStartDetectedEventWithAttendingTriggerInfo:]";
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s Skip SELF logging since mhUUID is not set", (uint8_t *)&v26, 0xCu);
    }
  }
}

- (void)_handleClientAudioDidStartMessage
{
}

- (void)intuitiveConvAudioCaptureMonitor:(id)a3 didStartAudioCaptureSuccessfully:(BOOL)a4 option:(id)a5 eventUUID:(id)a6
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001724E0;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100172564;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_handleSpeechStartDetectedWithEventInfo:(id)a3
{
  id v4 = a3;
  v5 = (void *)CSLogCategoryAttending;
  if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = [v4 description];
    int v15 = 136315394;
    id v16 = "-[CSLocalAttendingInitiator _handleSpeechStartDetectedWithEventInfo:]";
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v15, 0x16u);
  }
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)p_delegate);
    id v12 = [v4 triggerMachTime];
    id v13 = [v4 audioRecordType];
    id v14 = [v4 deviceId];
    [v11 speechStartDetectedWithHostTime:v12 audioRecordType:v13 audioRecordDeviceId:v14];
  }
}

- (void)speechStartDetectedWithEventInfo:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100172778;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)attendingStoppedWithReason:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001728F8;
  v4[3] = &unk_100253B58;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)receivedAttendingJarvisHintWithInfo:(id)a3
{
  id v4 = a3;
  v5 = [(CSLocalAttendingInitiator *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100172BB8;
  v7[3] = &unk_100253B08;
  id v8 = v4;
  float v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)receivedAttendingMagusNotSupportedHintWithInfo:(id)a3
{
  id v4 = a3;
  v5 = [(CSLocalAttendingInitiator *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100172D30;
  v7[3] = &unk_100253B08;
  id v8 = v4;
  float v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)receivedAttendingTriggerForSiriPromptHintWithInfo:(id)a3
{
  id v4 = a3;
  v5 = [(CSLocalAttendingInitiator *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100172F20;
  v7[3] = &unk_100253B08;
  id v8 = v4;
  float v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)receivedAttendingStopHintWithInfo:(id)a3
{
  id v4 = a3;
  attendingStartTransitionGroup = self->_attendingStartTransitionGroup;
  dispatch_time_t v6 = dispatch_time(0, 10000000000);
  if (dispatch_group_wait(attendingStartTransitionGroup, v6))
  {
    v7 = CSLogCategoryAttending;
    if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v14 = "-[CSLocalAttendingInitiator receivedAttendingStopHintWithInfo:]";
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s attendingStartTransitionGroup: Timed-out transition into AttendingState!", buf, 0xCu);
    }
  }
  id v8 = [(CSLocalAttendingInitiator *)self queue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100173294;
  v10[3] = &unk_100253B08;
  id v11 = v4;
  id v12 = self;
  id v9 = v4;
  dispatch_async(v8, v10);
}

- (void)receivedAttendingStartHintWithInfo:(id)a3
{
  id v4 = a3;
  v5 = [(CSLocalAttendingInitiator *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100173418;
  v7[3] = &unk_100253B08;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)receivedAttendingWillStartHintWithInfo:(id)a3
{
  id v4 = a3;
  v5 = [(CSLocalAttendingInitiator *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100173590;
  v7[3] = &unk_100253B08;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_reset
{
  self->_isAttending = 0;
  rootRequestId = self->_rootRequestId;
  self->_rootRequestId = 0;
}

- (int64_t)_stopReasonFromHint:(unint64_t)a3
{
  if (a3 - 4 > 2) {
    return 0;
  }
  else {
    return qword_1001AC828[a3 - 4];
  }
}

- (void)_stopAttendingWithReason:(unint64_t)a3
{
  v5 = CSLogCategoryAttending;
  if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isAttending = self->_isAttending;
    int v8 = 136315650;
    id v9 = "-[CSLocalAttendingInitiator _stopAttendingWithReason:]";
    __int16 v10 = 1024;
    BOOL v11 = isAttending;
    __int16 v12 = 2048;
    unint64_t v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s isAttending:%u, reason:%lu", (uint8_t *)&v8, 0x1Cu);
  }
  if (a3 == 5 || self->_isAttending)
  {
    if (a3 == 5) {
      self->_isStoppingForSiriUIDismissal = 1;
    }
    [(CSAttendingService *)self->_usecaseController stopAttendingWithReason:[(CSLocalAttendingInitiator *)self _stopReasonFromHint:a3]];
  }
  else
  {
    v7 = CSLogCategoryAttending;
    if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      id v9 = "-[CSLocalAttendingInitiator _stopAttendingWithReason:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Already stopped attending, ignore request", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_startAttendingForJarvisAnnounceMessageWithInfo:(id)a3
{
  id v4 = a3;
  if (+[CSUtils isContinuousConversationSupported])
  {
    if (self->_isAttending)
    {
      v5 = CSLogCategoryAttending;
      if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_INFO))
      {
        int v9 = 136315138;
        __int16 v10 = "-[CSLocalAttendingInitiator _startAttendingForJarvisAnnounceMessageWithInfo:]";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Already in attending state, ignore request", (uint8_t *)&v9, 0xCu);
      }
    }
    else
    {
      v7 = [v4 deviceId];
      int v8 = +[CSAttendingOptions optionForJarvisAnnounceMessageWithDeviceId:v7];

      [(CSLocalAttendingInitiator *)self _startAttendingWithOptions:v8];
    }
  }
  else
  {
    id v6 = CSLogCategoryAttending;
    if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_FAULT))
    {
      int v9 = 136315138;
      __int16 v10 = "-[CSLocalAttendingInitiator _startAttendingForJarvisAnnounceMessageWithInfo:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "%s Wrongly called the code path which is not supported!", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)_startAttendingWithInfo:(id)a3
{
  id v4 = a3;
  if (+[CSUtils isContinuousConversationSupported])
  {
    v5 = [v4 recordContext];
    if (self->_isAttending)
    {
      id v6 = CSLogCategoryAttending;
      if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_INFO))
      {
        int v17 = 136315138;
        id v18 = "-[CSLocalAttendingInitiator _startAttendingWithInfo:]";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Already in attending state, ignore request", (uint8_t *)&v17, 0xCu);
      }
    }
    else
    {
      int v8 = [v4 rootRequestId];
      rootRequestId = self->_rootRequestId;
      self->_rootRequestId = v8;

      __int16 v10 = [v4 rootRequestId];
      rootRequestIdForLogging = self->_rootRequestIdForLogging;
      self->_rootRequestIdForLogging = v10;

      __int16 v12 = [v4 mhUUID];
      mhUUID = self->_mhUUID;
      self->_mhUUID = v12;

      id v14 = [v5 type];
      int v15 = [v5 deviceId];
      id v16 = +[CSAttendingOptions optionForFlexibleFollowupWithAudioRecordType:v14 deviceId:v15];

      [(CSLocalAttendingInitiator *)self _startAttendingWithOptions:v16];
    }
  }
  else
  {
    v7 = CSLogCategoryAttending;
    if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_FAULT))
    {
      int v17 = 136315138;
      id v18 = "-[CSLocalAttendingInitiator _startAttendingWithInfo:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "%s Wrongly called the code path which is not supported!", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (void)_startAttendingWithOptions:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = CSLogCategoryAttending;
  if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v17 = "-[CSLocalAttendingInitiator _startAttendingWithOptions:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s dispatch group enter attendingStartTransitionGroup", buf, 0xCu);
  }
  dispatch_group_enter((dispatch_group_t)self->_attendingStartTransitionGroup);
  [(CSLocalAttendingInitiator *)self _resetIsStoppingForSiriUIDismissal];
  if (self->_rootRequestId)
  {
    if (!-[NSString isEqualToString:](self->_rootRequestIdForWillAttendSignal, "isEqualToString:"))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        id v8 = objc_loadWeakRetained((id *)&self->_delegate);
        [v8 localAttendingWillStartWithRootRequestId:self->_rootRequestIdForWillAttendSignal];
      }
    }
  }
  id v9 = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    [v11 localAttendingStartedWithRootRequestId:self->_rootRequestId];
  }
  usecaseController = self->_usecaseController;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100173D94;
  v14[3] = &unk_100253B30;
  v14[4] = self;
  id v15 = v4;
  id v13 = v4;
  [(CSAttendingService *)usecaseController startAttendingWithOptions:v13 completion:v14];
}

- (void)setAttendingState:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001742E4;
  v4[3] = &unk_100253AB8;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

- (BOOL)fetchIsAttending
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100174458;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (CSLocalAttendingInitiator)initWithAttendingUsecase:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSLocalAttendingInitiator;
  uint64_t v6 = [(CSLocalAttendingInitiator *)&v13 init];
  if (v6)
  {
    uint64_t v7 = +[CSUtils getSerialQueue:@"CSAttendingMagusLauncher Queue" qualityOfService:33];
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_usecaseController, a3);
    [(CSAttendingService *)v6->_usecaseController setDelegate:v6];
    v6->_BOOL isAttending = 0;
    [(CSLocalAttendingInitiator *)v6 _resetIsStoppingForSiriUIDismissal];
    dispatch_group_t v9 = dispatch_group_create();
    attendingStartTransitionGroup = v6->_attendingStartTransitionGroup;
    v6->_attendingStartTransitionGroup = (OS_dispatch_group *)v9;

    lastLoggedMhUUID = v6->_lastLoggedMhUUID;
    v6->_lastLoggedMhUUID = 0;
  }
  return v6;
}

@end