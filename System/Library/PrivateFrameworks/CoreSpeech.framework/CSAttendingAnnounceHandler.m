@interface CSAttendingAnnounceHandler
- (BOOL)_shouldDuckTTSAtSpeechStartDetected:(int64_t)a3;
- (CSAttendingAnnounceHandler)init;
- (LBAttendingStatesServiceDelegate)delegate;
- (OS_dispatch_queue)queue;
- (void)attendingStoppedWithReason:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)speechStartDetectedWithEventInfo:(id)a3;
@end

@implementation CSAttendingAnnounceHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
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

- (BOOL)_shouldDuckTTSAtSpeechStartDetected:(int64_t)a3
{
  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    v7 = "-[CSAttendingAnnounceHandler _shouldDuckTTSAtSpeechStartDetected:]";
    __int16 v8 = 1026;
    BOOL v9 = a3 == 25;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s shouldDuckTTS: %{public}d", (uint8_t *)&v6, 0x12u);
  }
  return a3 == 25;
}

- (void)speechStartDetectedWithEventInfo:(id)a3
{
  id v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSAttendingAnnounceHandler speechStartDetectedWithEventInfo:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100169434;
  v8[3] = &unk_100253B08;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)attendingStoppedWithReason:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100169660;
  v4[3] = &unk_100253B58;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (CSAttendingAnnounceHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSAttendingAnnounceHandler;
  v2 = [(CSAttendingAnnounceHandler *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[CSUtils getSerialQueue:@"CSAttendingAnnounceHandler Queue" qualityOfService:33];
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

@end