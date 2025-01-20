@interface CSAudioInjectionProvider
+ (id)defaultInjectionProvider;
- (BOOL)activateAudioSessionWithReason:(unint64_t)a3 streamHandleId:(unint64_t)a4 error:(id *)a5;
- (BOOL)allowZeroInjection;
- (BOOL)deactivateAudioSession:(unint64_t)a3 error:(id *)a4;
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
- (BOOL)shouldSupportOnlyTVRemote;
- (BOOL)startAudioStreamWithOption:(id)a3 recordDeviceIndicator:(id)a4 error:(id *)a5;
- (BOOL)stopAudioStreamWithRecordDeviceIndicator:(id)a3 error:(id *)a4;
- (CSAudioInjectionDevice)builtInDevice;
- (CSAudioInjectionDevice)bundleTvRemote;
- (CSAudioInjectionEngine)builtInAudioInjectionEngine;
- (CSAudioInjectionProvider)init;
- (CSAudioRecordContext)audioRecordContext;
- (NSHashTable)observers;
- (NSMutableArray)connectedDevices;
- (NSMutableDictionary)audioInjectionEngines;
- (NSString)atvRemoteDeviceID;
- (NSUUID)uuid;
- (OS_dispatch_queue)queue;
- (float)averagePowerForChannel:(unint64_t)a3;
- (float)didStartDelayInSeconds;
- (float)peakPowerForChannel:(unint64_t)a3;
- (float)recordingSampleRateWithStreamHandleId:(unint64_t)a3;
- (id)audioDeviceInfoWithStreamHandleId:(unint64_t)a3 recordDeviceIndicator:(id)a4;
- (id)fetchGibraltarVoiceTriggerInfoWithRecordDeviceIndicator:(id)a3;
- (id)getPlaybackRouteForStreamID:(unint64_t)a3;
- (id)metrics;
- (id)primaryInputDevice;
- (id)recordDeviceInfoWithStreamHandleId:(unint64_t)a3 recordDeviceIndicator:(id)a4;
- (id)recordRouteWithRecordDeviceIndicator:(id)a3;
- (id)recordSettingsWithStreamHandleId:(unint64_t)a3;
- (unint64_t)activateEndTime;
- (unint64_t)activateStartTime;
- (unint64_t)alertStartTime;
- (unint64_t)deactivateEndTime;
- (unint64_t)deactivateStartTime;
- (unint64_t)latestPluginStreamId;
- (void)_connectPluginDevice:(id)a3;
- (void)_createSpeechDetectionVADIfNeeded;
- (void)_tearDownSpeechDetectionVADIfNeeded;
- (void)audioEngineAudioChunkForTvAvailable:(id)a3 audioChunk:(id)a4;
- (void)audioEngineBufferAvailable:(id)a3 audioStreamHandleId:(unint64_t)a4 buffer:(id)a5 remoteVAD:(id)a6 atTime:(unint64_t)a7 isFileLoadedBuffer:(BOOL)a8;
- (void)audioEngineDidStartRecord:(id)a3 audioStreamHandleId:(unint64_t)a4 successfully:(BOOL)a5 error:(id)a6;
- (void)audioEngineDidStopRecord:(id)a3 audioStreamHandleId:(unint64_t)a4 reason:(unint64_t)a5;
- (void)connectDevice:(id)a3;
- (void)dealloc;
- (void)disconnectDevice:(id)a3;
- (void)registerObserver:(id)a3;
- (void)setActivateEndTime:(unint64_t)a3;
- (void)setActivateStartTime:(unint64_t)a3;
- (void)setAllowZeroInjection:(BOOL)a3;
- (void)setAtvRemoteDeviceID:(id)a3;
- (void)setAudioInjectionEngines:(id)a3;
- (void)setAudioRecordContext:(id)a3;
- (void)setBuiltInAudioInjectionEngine:(id)a3;
- (void)setBuiltInDevice:(id)a3;
- (void)setBundleTvRemote:(id)a3;
- (void)setConnectedDevices:(id)a3;
- (void)setContext:(id)a3 completion:(id)a4;
- (void)setDeactivateEndTime:(unint64_t)a3;
- (void)setDeactivateStartTime:(unint64_t)a3;
- (void)setDidStartDelayInSeconds:(float)a3;
- (void)setLatestPluginStreamId:(unint64_t)a3;
- (void)setObservers:(id)a3;
- (void)setQueue:(id)a3;
- (void)setShouldSupportOnlyTVRemote:(BOOL)a3;
- (void)setUuid:(id)a3;
- (void)start;
- (void)stop;
- (void)unregisterObserver:(id)a3;
- (void)willDestroy;
@end

@implementation CSAudioInjectionProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioRecordContext, 0);
  objc_storeStrong((id *)&self->_atvRemoteDeviceID, 0);
  objc_storeStrong((id *)&self->_audioInjectionEngines, 0);
  objc_storeStrong((id *)&self->_builtInAudioInjectionEngine, 0);
  objc_storeStrong((id *)&self->_bundleTvRemote, 0);
  objc_storeStrong((id *)&self->_builtInDevice, 0);
  objc_storeStrong((id *)&self->_connectedDevices, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)setShouldSupportOnlyTVRemote:(BOOL)a3
{
  self->_shouldSupportOnlyTVRemote = a3;
}

- (BOOL)shouldSupportOnlyTVRemote
{
  return self->_shouldSupportOnlyTVRemote;
}

- (void)setAllowZeroInjection:(BOOL)a3
{
  self->_allowZeroInjection = a3;
}

- (BOOL)allowZeroInjection
{
  return self->_allowZeroInjection;
}

- (void)setAudioRecordContext:(id)a3
{
}

- (CSAudioRecordContext)audioRecordContext
{
  return self->_audioRecordContext;
}

- (void)setAtvRemoteDeviceID:(id)a3
{
}

- (NSString)atvRemoteDeviceID
{
  return self->_atvRemoteDeviceID;
}

- (void)setDeactivateEndTime:(unint64_t)a3
{
  self->_deactivateEndTime = a3;
}

- (unint64_t)deactivateEndTime
{
  return self->_deactivateEndTime;
}

- (void)setDeactivateStartTime:(unint64_t)a3
{
  self->_deactivateStartTime = a3;
}

- (unint64_t)deactivateStartTime
{
  return self->_deactivateStartTime;
}

- (void)setActivateEndTime:(unint64_t)a3
{
  self->_activateEndTime = a3;
}

- (unint64_t)activateEndTime
{
  return self->_activateEndTime;
}

- (void)setActivateStartTime:(unint64_t)a3
{
  self->_activateStartTime = a3;
}

- (unint64_t)activateStartTime
{
  return self->_activateStartTime;
}

- (void)setLatestPluginStreamId:(unint64_t)a3
{
  self->_latestPluginStreamId = a3;
}

- (unint64_t)latestPluginStreamId
{
  return self->_latestPluginStreamId;
}

- (void)setAudioInjectionEngines:(id)a3
{
}

- (NSMutableDictionary)audioInjectionEngines
{
  return self->_audioInjectionEngines;
}

- (void)setBuiltInAudioInjectionEngine:(id)a3
{
}

- (CSAudioInjectionEngine)builtInAudioInjectionEngine
{
  return self->_builtInAudioInjectionEngine;
}

- (void)setBundleTvRemote:(id)a3
{
}

- (CSAudioInjectionDevice)bundleTvRemote
{
  return self->_bundleTvRemote;
}

- (void)setBuiltInDevice:(id)a3
{
}

- (CSAudioInjectionDevice)builtInDevice
{
  return self->_builtInDevice;
}

- (void)setConnectedDevices:(id)a3
{
}

- (NSMutableArray)connectedDevices
{
  return self->_connectedDevices;
}

- (void)setUuid:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setObservers:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setDidStartDelayInSeconds:(float)a3
{
  self->_didStartDelayInSeconds = a3;
}

- (float)didStartDelayInSeconds
{
  return self->_didStartDelayInSeconds;
}

- (void)audioEngineAudioChunkForTvAvailable:(id)a3 audioChunk:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000A6D68;
  v8[3] = &unk_100253B08;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)audioEngineDidStopRecord:(id)a3 audioStreamHandleId:(unint64_t)a4 reason:(unint64_t)a5
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A6F24;
  block[3] = &unk_1002513B8;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  dispatch_async(queue, block);
}

- (void)audioEngineBufferAvailable:(id)a3 audioStreamHandleId:(unint64_t)a4 buffer:(id)a5 remoteVAD:(id)a6 atTime:(unint64_t)a7 isFileLoadedBuffer:(BOOL)a8
{
  id v13 = a5;
  id v14 = a6;
  queue = self->_queue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000A713C;
  v18[3] = &unk_100251068;
  BOOL v23 = a8;
  v18[4] = self;
  id v19 = v13;
  id v20 = v14;
  unint64_t v21 = a4;
  unint64_t v22 = a7;
  id v16 = v14;
  id v17 = v13;
  dispatch_async(queue, v18);
}

- (void)audioEngineDidStartRecord:(id)a3 audioStreamHandleId:(unint64_t)a4 successfully:(BOOL)a5 error:(id)a6
{
  id v9 = a6;
  queue = self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000A7390;
  v12[3] = &unk_1002507D8;
  id v13 = v9;
  unint64_t v14 = a4;
  BOOL v15 = a5;
  v12[4] = self;
  id v11 = v9;
  dispatch_async(queue, v12);
}

- (id)metrics
{
  uint64_t v3 = AVVoiceControllerMetricDataBeginHostTime;
  v17[0] = AVVoiceControllerMetricDataBeginHostTime;
  v4 = +[NSNumber numberWithUnsignedLongLong:self->_activateStartTime];
  v18[0] = v4;
  uint64_t v5 = AVVoiceControllerMetricDataEndHostTime;
  v17[1] = AVVoiceControllerMetricDataEndHostTime;
  v6 = +[NSNumber numberWithUnsignedLongLong:self->_activateEndTime];
  v18[1] = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

  v15[0] = v3;
  v8 = +[NSNumber numberWithUnsignedLongLong:self->_deactivateStartTime];
  v15[1] = v5;
  v16[0] = v8;
  id v9 = +[NSNumber numberWithUnsignedLongLong:self->_deactivateEndTime];
  v16[1] = v9;
  v10 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  v13[0] = AVVoiceControllerMetricAudioSessionSetActiveTime;
  v13[1] = AVVoiceControllerMetricAudioSessionSetInactiveTime;
  v14[0] = v7;
  v14[1] = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v11;
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
  uint64_t v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    v8 = "-[CSAudioInjectionProvider playRecordStartingAlertAndResetEndpointerFromStream:withAlertOverride:]";
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

- (BOOL)deactivateAudioSession:(unint64_t)a3 error:(id *)a4
{
  self->_deactivateStartTime = mach_absolute_time();
  int v7 = +[AVAudioSession sharedInstance];
  LOBYTE(a4) = [v7 setActive:0 withOptions:a3 error:a4];

  self->_deactivateEndTime = mach_absolute_time();
  return (char)a4;
}

- (BOOL)deactivateAudioSession:(unint64_t)a3 streamHandleId:(unint64_t)a4 error:(id *)a5
{
  self->_deactivateStartTime = mach_absolute_time();
  v8 = +[AVAudioSession sharedInstance];
  LOBYTE(a5) = [v8 setActive:0 withOptions:a3 error:a5];

  self->_deactivateEndTime = mach_absolute_time();
  return (char)a5;
}

- (BOOL)activateAudioSessionWithReason:(unint64_t)a3 streamHandleId:(unint64_t)a4 error:(id *)a5
{
  self->_activateStartTime = mach_absolute_time();
  if (CSIsHorseman()
    && (+[AVAudioSession sharedInstance],
        int v7 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v8 = [v7 setCategory:AVAudioSessionCategoryPlayAndRecord withOptions:1 error:a5], v7, (v8 & 1) == 0))
  {
    v12 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      id v13 = *a5;
      int v14 = 136315394;
      BOOL v15 = "-[CSAudioInjectionProvider activateAudioSessionWithReason:streamHandleId:error:]";
      __int16 v16 = 2112;
      id v17 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s CS set AVAudioSession category/options failed with error: %@", (uint8_t *)&v14, 0x16u);
    }
    return 0;
  }
  else
  {
    __int16 v9 = +[AVAudioSession sharedInstance];
    unsigned __int8 v10 = [v9 setActive:1 error:a5];

    self->_activateEndTime = mach_absolute_time();
    return v10;
  }
}

- (BOOL)prewarmAudioSessionWithStreamHandleId:(unint64_t)a3 error:(id *)a4
{
  uint64_t v5 = +[AVAudioSession sharedInstance];
  LOBYTE(a4) = [v5 setActive:1 withOptions:0x2000 error:a4];

  return (char)a4;
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
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v5 = v4;
  if (self->_shouldSupportOnlyTVRemote)
  {
    [v4 setObject:&off_10025DD38 forKey:AVNumberOfChannelsKey];
    [v5 setObject:&off_10025DD50 forKey:AVSampleRateKey];
    [v5 setObject:&off_10025DD68 forKey:AVLinearPCMBitDepthKey];
    v6 = +[CSFPreferences sharedPreferences];
    unsigned int v7 = [v6 useSpeexForAudioInjection];

    if (v7) {
      unsigned __int8 v8 = &off_10025DD80;
    }
    else {
      unsigned __int8 v8 = &off_10025DD98;
    }
    [v5 setObject:v8 forKey:AVFormatIDKey];
  }
  return v5;
}

- (id)audioDeviceInfoWithStreamHandleId:(unint64_t)a3 recordDeviceIndicator:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc((Class)CSFAudioDeviceInfo);
  unsigned __int8 v8 = [(CSAudioInjectionProvider *)self recordDeviceInfoWithStreamHandleId:a3 recordDeviceIndicator:v6];

  __int16 v9 = [(CSAudioInjectionProvider *)self getPlaybackRouteForStreamID:a3];
  unsigned __int8 v10 = +[NSArray array];
  id v11 = [v7 initWithRecordDeviceInfo:v8 playbackRoute:v9 playbackDeviceTypeList:v10];

  return v11;
}

- (id)recordDeviceInfoWithStreamHandleId:(unint64_t)a3 recordDeviceIndicator:(id)a4
{
  uint64_t v8 = 0;
  __int16 v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_1000A7D44;
  queue = self->_queue;
  v12 = sub_1000A7D54;
  id v13 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A7D5C;
  block[3] = &unk_100252430;
  block[5] = &v8;
  block[6] = a3;
  block[4] = self;
  dispatch_async_and_wait(queue, block);
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)recordRouteWithRecordDeviceIndicator:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  BOOL v15 = sub_1000A7D44;
  queue = self->_queue;
  __int16 v16 = sub_1000A7D54;
  id v17 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A8064;
  block[3] = &unk_1002523B8;
  block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_async_and_wait(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)isRecordingWithRecordDeviceIndicator:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  __int16 v16 = sub_1000A7D44;
  id v17 = sub_1000A7D54;
  id v18 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A8328;
  block[3] = &unk_1002523B8;
  uint64_t v12 = &v13;
  block[4] = self;
  id v6 = v4;
  id v11 = v6;
  dispatch_async_and_wait(queue, block);
  id v7 = (void *)v14[5];
  if (v7) {
    unsigned __int8 v8 = [v7 isRecording];
  }
  else {
    unsigned __int8 v8 = 0;
  }

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (BOOL)stopAudioStreamWithRecordDeviceIndicator:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    uuid = self->_uuid;
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[CSAudioInjectionProvider stopAudioStreamWithRecordDeviceIndicator:error:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = uuid;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Calling stop audio stream : %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  __int16 v16 = sub_1000A7D44;
  id v17 = sub_1000A7D54;
  id v18 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A85A0;
  block[3] = &unk_1002523B8;
  uint64_t v14 = buf;
  block[4] = self;
  id v9 = v5;
  id v13 = v9;
  dispatch_async_and_wait(queue, block);
  uint64_t v10 = *(void *)(*(void *)&buf[8] + 40);
  if (v10) {
    [*(id *)(*(void *)&buf[8] + 40) stopAudioStream];
  }

  _Block_object_dispose(buf, 8);
  return v10 != 0;
}

- (BOOL)startAudioStreamWithOption:(id)a3 recordDeviceIndicator:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_1000A7D44;
  v30 = sub_1000A7D54;
  id v31 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A88DC;
  block[3] = &unk_100250A58;
  id v10 = v7;
  id v22 = v10;
  BOOL v23 = self;
  v25 = &v26;
  id v11 = v8;
  id v24 = v11;
  dispatch_async_and_wait(queue, block);
  uint64_t v12 = v27[5];
  if (v12)
  {
    float didStartDelayInSeconds = self->_didStartDelayInSeconds;
    if (didStartDelayInSeconds <= 0.0)
    {
      [(id)v27[5] startAudioStreamWithOption:v10];
    }
    else
    {
      dispatch_time_t v14 = dispatch_time(0, (uint64_t)(float)(didStartDelayInSeconds * 1000000000.0));
      uint64_t v15 = self->_queue;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      void v18[2] = sub_1000A8AE4;
      v18[3] = &unk_100253A90;
      id v20 = &v26;
      id v19 = v10;
      dispatch_after(v14, v15, v18);
    }
  }
  else
  {
    __int16 v16 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v33 = "-[CSAudioInjectionProvider startAudioStreamWithOption:recordDeviceIndicator:error:]";
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s AudioInjection Engine is nil", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v26, 8);
  return v12 != 0;
}

- (BOOL)prepareAudioStreamRecord:(id)a3 recordDeviceIndicator:(id)a4 error:(id *)a5
{
  id v6 = a3;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000A8B98;
  v10[3] = &unk_100253B08;
  v10[4] = self;
  id v11 = v6;
  id v8 = v6;
  dispatch_async(queue, v10);

  return 1;
}

- (BOOL)setCurrentContext:(id)a3 streamHandleId:(unint64_t)a4 error:(id *)a5
{
  return 1;
}

- (void)setContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, uint64_t, void))a4;
  if ([v6 isPluginContext])
  {
    if (self->_shouldSupportOnlyTVRemote) {
      [v6 setDeviceId:self->_atvRemoteDeviceID];
    }
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v15 = 0;
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A8D78;
    block[3] = &unk_1002523B8;
    void block[4] = self;
    id v10 = v6;
    id v11 = &v12;
    dispatch_async_and_wait(queue, block);
    if (v7) {
      v7[2](v7, v13[3], 1, 0);
    }

    _Block_object_dispose(&v12, 8);
  }
  else if (v7)
  {
    v7[2](v7, 1, 2, 0);
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A8F90;
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
  v7[2] = sub_1000A9044;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)willDestroy
{
  v2.receiver = self;
  v2.super_class = (Class)CSAudioInjectionProvider;
  [(CSAudioInjectionProvider *)&v2 willDestroy];
}

- (void)disconnectDevice:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000A913C;
    v7[3] = &unk_100253B08;
    id v8 = v4;
    id v9 = self;
    dispatch_async(queue, v7);
  }
}

- (void)connectDevice:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000A93B4;
    v7[3] = &unk_100253B08;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (id)primaryInputDevice
{
  if (self->_shouldSupportOnlyTVRemote) {
    objc_super v2 = &OBJC_IVAR___CSAudioInjectionProvider__bundleTvRemote;
  }
  else {
    objc_super v2 = &OBJC_IVAR___CSAudioInjectionProvider__builtInDevice;
  }
  return *(id *)&self->CSAudioRecorder_opaque[*v2];
}

- (void)stop
{
  uint64_t v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    uuid = self->_uuid;
    *(_DWORD *)buf = 136315394;
    id v8 = "-[CSAudioInjectionProvider stop]";
    __int16 v9 = 2112;
    id v10 = uuid;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Stopping Audio Injection Provider : %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A957C;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_createSpeechDetectionVADIfNeeded
{
  uint64_t v3 = [(NSMutableDictionary *)self->_audioInjectionEngines objectForKeyedSubscript:&off_10025DD20];

  if (!v3)
  {
    id v4 = [[CSAudioInjectionBuiltInEngine alloc] initWithStreamHandleId:1];
    builtInAudioInjectionEngine = self->_builtInAudioInjectionEngine;
    self->_builtInAudioInjectionEngine = &v4->super;

    [(CSAudioInjectionEngine *)self->_builtInAudioInjectionEngine setDelegate:self];
    [(CSAudioInjectionEngine *)self->_builtInAudioInjectionEngine attachDevice:self->_builtInDevice];
    [(CSAudioInjectionEngine *)self->_builtInAudioInjectionEngine start];
    [(NSMutableDictionary *)self->_audioInjectionEngines setObject:self->_builtInAudioInjectionEngine forKey:&off_10025DD20];
    builtInDevice = self->_builtInDevice;
    id v7 = [(NSMutableDictionary *)self->_audioInjectionEngines objectForKeyedSubscript:&off_10025DD20];
    [(CSAudioInjectionDevice *)builtInDevice setInjectionEngine:v7];
  }
}

- (void)_tearDownSpeechDetectionVADIfNeeded
{
  if ((CSIsWatch() & 1) == 0)
  {
    builtInAudioInjectionEngine = self->_builtInAudioInjectionEngine;
    if (builtInAudioInjectionEngine)
    {
      [(CSAudioInjectionEngine *)builtInAudioInjectionEngine stop];
      id v4 = self->_builtInAudioInjectionEngine;
      self->_builtInAudioInjectionEngine = 0;

      audioInjectionEngines = self->_audioInjectionEngines;
      [(NSMutableDictionary *)audioInjectionEngines removeObjectForKey:&off_10025DD20];
    }
  }
}

- (void)_connectPluginDevice:(id)a3
{
  id v4 = a3;
  +[CSAudioInjectionEngineFactory engineWithDeviceType:streamHandleId:](CSAudioInjectionEngineFactory, "engineWithDeviceType:streamHandleId:", [v4 deviceType], self->_latestPluginStreamId);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 setDelegate:self];
  [v7 start];
  [v4 setInjectionEngine:v7];
  [v7 attachDevice:v4];

  audioInjectionEngines = self->_audioInjectionEngines;
  id v6 = +[NSNumber numberWithUnsignedInteger:self->_latestPluginStreamId];
  [(NSMutableDictionary *)audioInjectionEngines setObject:v7 forKey:v6];

  ++self->_latestPluginStreamId;
}

- (void)start
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A9AFC;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)dealloc
{
  uint64_t v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    uuid = self->_uuid;
    *(_DWORD *)buf = 136315394;
    id v7 = "-[CSAudioInjectionProvider dealloc]";
    __int16 v8 = 2112;
    __int16 v9 = uuid;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Dealloc CSAudioInjectionProvider : %@", buf, 0x16u);
  }
  v5.receiver = self;
  v5.super_class = (Class)CSAudioInjectionProvider;
  [(CSAudioInjectionProvider *)&v5 dealloc];
}

- (CSAudioInjectionProvider)init
{
  v22.receiver = self;
  v22.super_class = (Class)CSAudioInjectionProvider;
  objc_super v2 = [(CSAudioInjectionProvider *)&v22 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSAudioInjectionProvider", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = +[NSHashTable weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    uint64_t v7 = +[NSMutableDictionary dictionary];
    audioInjectionEngines = v2->_audioInjectionEngines;
    v2->_audioInjectionEngines = (NSMutableDictionary *)v7;

    uint64_t v9 = +[NSMutableArray array];
    connectedDevices = v2->_connectedDevices;
    v2->_connectedDevices = (NSMutableArray *)v9;

    uint64_t v11 = +[NSUUID UUID];
    uuid = v2->_uuid;
    v2->_uuid = (NSUUID *)v11;

    v2->_latestPluginStreamId = 2;
    int v13 = CSIsTV();
    v2->_shouldSupportOnlyTVRemote = v13;
    if (v13)
    {
      uint64_t v14 = +[NSUUID UUID];
      uint64_t v15 = [v14 UUIDString];
      atvRemoteDeviceID = v2->_atvRemoteDeviceID;
      v2->_atvRemoteDeviceID = (NSString *)v15;

      id v17 = [[CSAudioInjectionDevice alloc] initWithDeviceType:5 deviceName:@"ATVRemoteInput" deviceID:v2->_atvRemoteDeviceID productID:0];
      uint64_t v18 = 56;
    }
    else
    {
      id v17 = [[CSAudioInjectionDevice alloc] initWithDeviceType:1 deviceName:@"BuiltInMic" deviceID:0 productID:0];
      uint64_t v18 = 48;
    }
    id v19 = (CSAudioInjectionDevice **)&v2->CSAudioRecorder_opaque[v18];
    id v20 = *(void **)&v2->CSAudioRecorder_opaque[v18];
    *id v19 = v17;

    [(NSMutableArray *)v2->_connectedDevices addObject:*v19];
  }
  return v2;
}

+ (id)defaultInjectionProvider
{
  if (qword_1002A3870 != -1) {
    dispatch_once(&qword_1002A3870, &stru_100250550);
  }
  objc_super v2 = (void *)qword_1002A3878;
  return v2;
}

@end