@interface CSAttendingStatesMessageHandler
- (BOOL)_shouldDuckTTSAtSpeechStartDetected:(int64_t)a3;
- (BOOL)isSpeechRecognizerBusy;
- (BOOL)shouldDelaySpeechRecognizerForNextTurn;
- (CSAttendingStatesMessageHandler)init;
- (CSSpeechStartDetectedMetaData)speechDetectedMetaData;
- (LBAttendingStatesServiceDelegate)delegate;
- (OS_dispatch_queue)queue;
- (void)_handleSpeechRecognitionTaskDidStop;
- (void)_resetCachedState;
- (void)didCompleteRecognitionTaskWithStatistics:(id)a3 requestId:(id)a4 endpointMode:(int64_t)a5 error:(id)a6;
- (void)didReceiveStartRecognitionRequest:(id)a3 taskName:(id)a4 sharedUserInfo:(id)a5;
- (void)didReceiveStopRecognitionRequest:(id)a3 stopReason:(unint64_t)a4;
- (void)localAttendingStartedWithRootRequestId:(id)a3;
- (void)localAttendingStopped;
- (void)localAttendingStoppedUnexpectedlyWithError:(id)a3;
- (void)localAttendingWillStartWithRootRequestId:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsSpeechRecognizerBusy:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setShouldDelaySpeechRecognizerForNextTurn:(BOOL)a3;
- (void)setSpeechDetectedMetaData:(id)a3;
- (void)speechStartDetectedWithHostTime:(unint64_t)a3 audioRecordType:(int64_t)a4 audioRecordDeviceId:(id)a5;
@end

@implementation CSAttendingStatesMessageHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechDetectedMetaData, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setSpeechDetectedMetaData:(id)a3
{
}

- (CSSpeechStartDetectedMetaData)speechDetectedMetaData
{
  return self->_speechDetectedMetaData;
}

- (void)setShouldDelaySpeechRecognizerForNextTurn:(BOOL)a3
{
  self->_shouldDelaySpeechRecognizerForNextTurn = a3;
}

- (BOOL)shouldDelaySpeechRecognizerForNextTurn
{
  return self->_shouldDelaySpeechRecognizerForNextTurn;
}

- (void)setIsSpeechRecognizerBusy:(BOOL)a3
{
  self->_isSpeechRecognizerBusy = a3;
}

- (BOOL)isSpeechRecognizerBusy
{
  return self->_isSpeechRecognizerBusy;
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

- (void)_handleSpeechRecognitionTaskDidStop
{
  self->_isSpeechRecognizerBusy = 0;
  if (self->_shouldDelaySpeechRecognizerForNextTurn)
  {
    if (self->_speechDetectedMetaData)
    {
      self->_shouldDelaySpeechRecognizerForNextTurn = 0;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v4 = objc_opt_respondsToSelector();

      if (v4)
      {
        id v8 = objc_loadWeakRetained((id *)&self->_delegate);
        unint64_t v5 = [(CSSpeechStartDetectedMetaData *)self->_speechDetectedMetaData hostTime];
        int64_t v6 = [(CSSpeechStartDetectedMetaData *)self->_speechDetectedMetaData audioRecordType];
        v7 = [(CSSpeechStartDetectedMetaData *)self->_speechDetectedMetaData deviceId];
        [v8 speechRecognizerReadyForNewTurnWithSpeechStartDetectedAtHostTime:v5 audioRecordType:v6 audioRecordDeviceId:v7];
      }
    }
  }
}

- (void)didCompleteRecognitionTaskWithStatistics:(id)a3 requestId:(id)a4 endpointMode:(int64_t)a5 error:(id)a6
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CAFC0;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)didReceiveStopRecognitionRequest:(id)a3 stopReason:(unint64_t)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000CB03C;
  v5[3] = &unk_100253B58;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)didReceiveStartRecognitionRequest:(id)a3 taskName:(id)a4 sharedUserInfo:(id)a5
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CB188;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)_shouldDuckTTSAtSpeechStartDetected:(int64_t)a3
{
  BOOL v4 = a3 == 22 || a3 == 25;
  unint64_t v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[CSAttendingStatesMessageHandler _shouldDuckTTSAtSpeechStartDetected:]";
    __int16 v9 = 1026;
    BOOL v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s shouldDuckTTS: %{public}d", (uint8_t *)&v7, 0x12u);
  }
  return v4;
}

- (void)speechStartDetectedWithHostTime:(unint64_t)a3 audioRecordType:(int64_t)a4 audioRecordDeviceId:(id)a5
{
  id v8 = a5;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000CB308;
  v11[3] = &unk_100250C70;
  unint64_t v13 = a3;
  int64_t v14 = a4;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, v11);
}

- (void)localAttendingStopped
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CB598;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)localAttendingStoppedUnexpectedlyWithError:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000CB6C4;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)localAttendingStartedWithRootRequestId:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000CB7B8;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)localAttendingWillStartWithRootRequestId:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000CB8F0;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_resetCachedState
{
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[CSAttendingStatesMessageHandler _resetCachedState]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
  *(_WORD *)&self->_isSpeechRecognizerBusy = 0;
  speechDetectedMetaData = self->_speechDetectedMetaData;
  self->_speechDetectedMetaData = 0;
}

- (CSAttendingStatesMessageHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSAttendingStatesMessageHandler;
  v2 = [(CSAttendingStatesMessageHandler *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[CSUtils getSerialQueue:@"CSAttendingStatesMessageHandler Queue" qualityOfService:33];
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

@end