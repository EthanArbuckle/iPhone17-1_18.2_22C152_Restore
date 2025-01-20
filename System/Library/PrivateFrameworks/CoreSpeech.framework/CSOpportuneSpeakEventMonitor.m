@interface CSOpportuneSpeakEventMonitor
+ (id)sharedInstance;
- (BOOL)isOpportuneSpeakListening;
- (BOOL)isStreaming;
- (CSAudioRecordContext)audioRecordContext;
- (CSOpportuneSpeakEventMonitor)init;
- (NSString)audioProviderUUID;
- (NSUUID)token;
- (OS_dispatch_queue)queue;
- (void)_notifyStopOpportuneSpeakWithDelay:(double)a3;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)opportuneSpeakBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 audioProviderUUID:(id)a5 successfully:(BOOL)a6 option:(id)a7;
- (void)opportuneSpeakBehaviorMonitor:(id)a3 didStopStream:(id)a4;
- (void)opportuneSpeakBehaviorMonitor:(id)a3 willStopStream:(id)a4;
- (void)setAudioProviderUUID:(id)a3;
- (void)setAudioRecordContext:(id)a3;
- (void)setIsOpportuneSpeakListening:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setToken:(id)a3;
@end

@implementation CSOpportuneSpeakEventMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_audioRecordContext, 0);
  objc_storeStrong((id *)&self->_audioProviderUUID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setToken:(id)a3
{
}

- (NSUUID)token
{
  return self->_token;
}

- (void)setAudioRecordContext:(id)a3
{
}

- (void)setAudioProviderUUID:(id)a3
{
}

- (void)setIsOpportuneSpeakListening:(BOOL)a3
{
  self->_isOpportuneSpeakListening = a3;
}

- (BOOL)isOpportuneSpeakListening
{
  return self->_isOpportuneSpeakListening;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)_notifyStopOpportuneSpeakWithDelay:(double)a3
{
  id v5 = [(NSUUID *)self->_token copy];
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004DF30;
  v9[3] = &unk_100253B08;
  id v10 = v5;
  v11 = self;
  id v8 = v5;
  dispatch_after(v6, queue, v9);
}

- (void)opportuneSpeakBehaviorMonitor:(id)a3 didStopStream:(id)a4
{
}

- (void)opportuneSpeakBehaviorMonitor:(id)a3 willStopStream:(id)a4
{
}

- (void)opportuneSpeakBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 audioProviderUUID:(id)a5 successfully:(BOOL)a6 option:(id)a7
{
  id v10 = a4;
  id v11 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10004E178;
  v15[3] = &unk_100252588;
  BOOL v18 = a6;
  v15[4] = self;
  id v16 = v11;
  id v17 = v10;
  id v13 = v10;
  id v14 = v11;
  dispatch_async(queue, v15);
}

- (CSAudioRecordContext)audioRecordContext
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_10004E3E0;
  id v10 = sub_10004E3F0;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004E3F8;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CSAudioRecordContext *)v3;
}

- (NSString)audioProviderUUID
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_10004E3E0;
  id v10 = sub_10004E3F0;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004E544;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (BOOL)isStreaming
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004E6E4;
  v7[3] = &unk_100253A90;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_async_and_wait(queue, v7);
  id v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *((unsigned __int8 *)v9 + 24);
    *(_DWORD *)buf = 136315394;
    id v13 = "-[CSOpportuneSpeakEventMonitor isStreaming]";
    __int16 v14 = 1024;
    int v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Fetching CommandControl Listening State: %d", buf, 0x12u);
  }
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)_stopMonitoring
{
  id v3 = +[CSOpportuneSpeakBehaviorMonitor sharedInstance];
  [v3 unregisterObserver:self];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004E7A4;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_startMonitoringWithQueue:(id)a3
{
  int v4 = +[CSOpportuneSpeakBehaviorMonitor sharedInstance];
  [v4 registerObserver:self];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004E85C;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (CSOpportuneSpeakEventMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSOpportuneSpeakEventMonitor;
  v2 = [(CSOpportuneSpeakEventMonitor *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSOpportuneSpeakEventMonitor", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_isOpportuneSpeakListening = 0;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1002A36F8 != -1) {
    dispatch_once(&qword_1002A36F8, &stru_10024F390);
  }
  v2 = (void *)qword_1002A36F0;
  return v2;
}

@end