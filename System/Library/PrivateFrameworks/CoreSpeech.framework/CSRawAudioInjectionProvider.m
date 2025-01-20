@interface CSRawAudioInjectionProvider
- (BOOL)activateAudioSessionWithReason:(unint64_t)a3 streamHandleId:(unint64_t)a4 error:(id *)a5;
- (BOOL)deactivateAudioSession:(unint64_t)a3 streamHandleId:(unint64_t)a4 error:(id *)a5;
- (BOOL)duckOthersOption;
- (BOOL)isNarrowBandWithStreamHandleId:(unint64_t)a3;
- (BOOL)isRecordingWithRecordDeviceIndicator:(id)a3;
- (BOOL)isSessionCurrentlyActivated;
- (BOOL)playAlertSoundForType:(int64_t)a3 recordDevideIndicator:(id)a4;
- (BOOL)playRecordStartingAlertAndResetEndpointerFromStream:(unint64_t)a3 withAlertOverride:(int64_t)a4;
- (BOOL)prepareAudioStreamRecord:(id)a3 recordDeviceIndicator:(id)a4 error:(id *)a5;
- (BOOL)prewarmAudioSessionWithStreamHandleId:(unint64_t)a3 error:(id *)a4;
- (BOOL)setAlertSoundFromURL:(id)a3 forType:(int64_t)a4 force:(BOOL)a5;
- (BOOL)setCurrentContext:(id)a3 streamHandleId:(unint64_t)a4 error:(id *)a5;
- (BOOL)setRecordMode:(int64_t)a3 streamHandleId:(unint64_t)a4 error:(id *)a5;
- (BOOL)startAudioStreamWithOption:(id)a3 recordDeviceIndicator:(id)a4 error:(id *)a5;
- (BOOL)stopAudioStreamWithRecordDeviceIndicator:(id)a3 error:(id *)a4;
- (CSRawAudioInjectionProvider)init;
- (NSHashTable)observers;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)audioFeedTimer;
- (__sFILE)fp;
- (float)averagePowerForChannel:(unint64_t)a3;
- (float)peakPowerForChannel:(unint64_t)a3;
- (float)recordingSampleRateWithStreamHandleId:(unint64_t)a3;
- (id)audioDeviceInfoWithStreamHandleId:(unint64_t)a3 recordDeviceIndicator:(id)a4;
- (id)fetchGibraltarVoiceTriggerInfoWithRecordDeviceIndicator:(id)a3;
- (id)getPlaybackRouteForStreamID:(unint64_t)a3;
- (id)metrics;
- (id)recordDeviceInfoWithStreamHandleId:(unint64_t)a3 recordDeviceIndicator:(id)a4;
- (id)recordRouteWithRecordDeviceIndicator:(id)a3;
- (id)recordSettingsWithStreamHandleId:(unint64_t)a3;
- (unint64_t)alertStartTime;
- (void)_readAudioBufferAndFeed;
- (void)dealloc;
- (void)registerObserver:(id)a3;
- (void)setAudioFeedTimer:(id)a3;
- (void)setContext:(id)a3 completion:(id)a4;
- (void)setFp:(__sFILE *)a3;
- (void)setObservers:(id)a3;
- (void)setQueue:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CSRawAudioInjectionProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioFeedTimer, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setFp:(__sFILE *)a3
{
  self->_fp = a3;
}

- (__sFILE)fp
{
  return self->_fp;
}

- (void)setAudioFeedTimer:(id)a3
{
}

- (OS_dispatch_source)audioFeedTimer
{
  return self->_audioFeedTimer;
}

- (void)setObservers:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)metrics
{
  return 0;
}

- (id)fetchGibraltarVoiceTriggerInfoWithRecordDeviceIndicator:(id)a3
{
  return 0;
}

- (BOOL)isSessionCurrentlyActivated
{
  return 0;
}

- (float)averagePowerForChannel:(unint64_t)a3
{
  return 0.0;
}

- (float)peakPowerForChannel:(unint64_t)a3
{
  return 0.0;
}

- (unint64_t)alertStartTime
{
  return 0;
}

- (BOOL)playAlertSoundForType:(int64_t)a3 recordDevideIndicator:(id)a4
{
  return 1;
}

- (BOOL)playRecordStartingAlertAndResetEndpointerFromStream:(unint64_t)a3 withAlertOverride:(int64_t)a4
{
  v5 = CSLogCategoryAudio;
  if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    v8 = "-[CSRawAudioInjectionProvider playRecordStartingAlertAndResetEndpointerFromStream:withAlertOverride:]";
    __int16 v9 = 2048;
    int64_t v10 = a4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s playing start recording alert with override: %lu", (uint8_t *)&v7, 0x16u);
  }
  return 1;
}

- (BOOL)setAlertSoundFromURL:(id)a3 forType:(int64_t)a4 force:(BOOL)a5
{
  return 1;
}

- (id)getPlaybackRouteForStreamID:(unint64_t)a3
{
  return @"BuiltInSpeaker";
}

- (BOOL)duckOthersOption
{
  return 1;
}

- (BOOL)setRecordMode:(int64_t)a3 streamHandleId:(unint64_t)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)deactivateAudioSession:(unint64_t)a3 streamHandleId:(unint64_t)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)activateAudioSessionWithReason:(unint64_t)a3 streamHandleId:(unint64_t)a4 error:(id *)a5
{
  v5 = CSLogCategoryAudio;
  if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "-[CSRawAudioInjectionProvider activateAudioSessionWithReason:streamHandleId:error:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Calling activate audio session", (uint8_t *)&v7, 0xCu);
  }
  return 1;
}

- (BOOL)prewarmAudioSessionWithStreamHandleId:(unint64_t)a3 error:(id *)a4
{
  v4 = CSLogCategoryAudio;
  if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[CSRawAudioInjectionProvider prewarmAudioSessionWithStreamHandleId:error:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Calling prewarm", (uint8_t *)&v6, 0xCu);
  }
  return 1;
}

- (BOOL)isNarrowBandWithStreamHandleId:(unint64_t)a3
{
  return 0;
}

- (float)recordingSampleRateWithStreamHandleId:(unint64_t)a3
{
  +[CSConfig inputRecordingSampleRate];
  return result;
}

- (id)recordSettingsWithStreamHandleId:(unint64_t)a3
{
  return &__NSDictionary0__struct;
}

- (id)audioDeviceInfoWithStreamHandleId:(unint64_t)a3 recordDeviceIndicator:(id)a4
{
  return 0;
}

- (id)recordDeviceInfoWithStreamHandleId:(unint64_t)a3 recordDeviceIndicator:(id)a4
{
  return 0;
}

- (id)recordRouteWithRecordDeviceIndicator:(id)a3
{
  return @"RawAudioInjection";
}

- (BOOL)isRecordingWithRecordDeviceIndicator:(id)a3
{
  v3 = CSLogCategoryAudio;
  if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "-[CSRawAudioInjectionProvider isRecordingWithRecordDeviceIndicator:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Calling isRecording", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

- (BOOL)stopAudioStreamWithRecordDeviceIndicator:(id)a3 error:(id *)a4
{
  int v5 = CSLogCategoryAudio;
  if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int64_t v10 = "-[CSRawAudioInjectionProvider stopAudioStreamWithRecordDeviceIndicator:error:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Calling stop audio stream", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EAAD0;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
  return 1;
}

- (void)_readAudioBufferAndFeed
{
  id v3 = +[NSMutableData dataWithLength:1280];
  if (fread([v3 bytes], 1uLL, 0x500uLL, self->_fp) <= 0x4FF) {
    fseek(self->_fp, 44, 0);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = self->_observers;
  id v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        __int16 v9 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v8);
        if (objc_opt_respondsToSelector())
        {
          LODWORD(v10) = 1;
          [v9 audioRecorderBufferAvailable:self audioStreamHandleId:1 buffer:v3 remoteVAD:0 atTime:mach_absolute_time() arrivalTimestampToAudioRecorder:0 numberOfChannels:v10];
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (BOOL)startAudioStreamWithOption:(id)a3 recordDeviceIndicator:(id)a4 error:(id *)a5
{
  id v6 = a3;
  uint64_t v7 = CSLogCategoryAudio;
  if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v12 = "-[CSRawAudioInjectionProvider startAudioStreamWithOption:recordDeviceIndicator:error:]";
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Calling start audio stream : %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EAECC;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);

  return 1;
}

- (BOOL)prepareAudioStreamRecord:(id)a3 recordDeviceIndicator:(id)a4 error:(id *)a5
{
  id v5 = CSLogCategoryAudio;
  if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "-[CSRawAudioInjectionProvider prepareAudioStreamRecord:recordDeviceIndicator:error:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Calling prepare", (uint8_t *)&v7, 0xCu);
  }
  return 1;
}

- (BOOL)setCurrentContext:(id)a3 streamHandleId:(unint64_t)a4 error:(id *)a5
{
  id v5 = a3;
  id v6 = CSLogCategoryAudio;
  if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    __int16 v9 = "-[CSRawAudioInjectionProvider setCurrentContext:streamHandleId:error:]";
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Calling StreamId for : %@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

- (void)setContext:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, uint64_t, uint64_t, void))a4;
  int v7 = CSLogCategoryAudio;
  if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    __int16 v9 = "-[CSRawAudioInjectionProvider setContext:completion:]";
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Calling StreamId for : %@", (uint8_t *)&v8, 0x16u);
  }
  if (v6) {
    v6[2](v6, 1, 2, 0);
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000EB4A8;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000EB55C;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)dealloc
{
  id v3 = CSLogCategoryAudio;
  if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v6 = "-[CSRawAudioInjectionProvider dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Dealloc CSRawAudioInjectionProvider", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSRawAudioInjectionProvider;
  [(CSRawAudioInjectionProvider *)&v4 dealloc];
}

- (CSRawAudioInjectionProvider)init
{
  id v3 = CSLogCategoryAudio;
  if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    id v11 = "-[CSRawAudioInjectionProvider init]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Initializing CSRawAudioInjectionProvider", (uint8_t *)&v10, 0xCu);
  }
  if (self)
  {
    objc_super v4 = (OS_dispatch_queue *)dispatch_queue_create("CSRawAudioInjectionProvider", 0);
    queue = self->_queue;
    self->_queue = v4;

    id v6 = +[NSHashTable weakObjectsHashTable];
    observers = self->_observers;
    self->_observers = v6;
  }
  id v8 = CSLogCategoryAudio;
  if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    id v11 = "-[CSRawAudioInjectionProvider init]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Done initializing CSRawAudioInjectionProvider", (uint8_t *)&v10, 0xCu);
  }
  return self;
}

@end