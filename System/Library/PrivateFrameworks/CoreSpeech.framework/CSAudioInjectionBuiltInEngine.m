@interface CSAudioInjectionBuiltInEngine
- (BOOL)alwaysOnVoiceTriggerEnabled;
- (BOOL)injectAudio:(id)a3;
- (BOOL)injectAudio:(id)a3 withScaleFactor:(float)a4 playbackStarted:(id)a5 completion:(id)a6;
- (BOOL)isForwarding;
- (BOOL)isRecording;
- (BOOL)voiceTriggerEnabled;
- (CSAudioCircularBuffer)circularBuffer;
- (CSAudioInjectionBuiltInEngine)initWithStreamHandleId:(unint64_t)a3;
- (CSAudioInjectionDevice)connectedDevice;
- (CSAudioInjectionEngineDelegate)delegate;
- (CSKeywordAnalyzerNDEAPI)keywordAnalyzer;
- (NSDictionary)userIntentOptions;
- (NSMutableArray)hostTimeBuffer;
- (NSUUID)uuid;
- (OS_dispatch_queue)queue;
- (int64_t)getBestSampleCountWithOption:(id)a3;
- (unint64_t)lastForwardedSampleCount;
- (unint64_t)voiceTriggerSampleCount;
- (void)attachDevice:(id)a3;
- (void)audioEngineBufferAvailable:(id)a3 audioStreamHandleId:(unint64_t)a4 buffer:(id)a5 remoteVAD:(id)a6 atTime:(unint64_t)a7 isFileLoadedBuffer:(BOOL)a8;
- (void)dealloc;
- (void)setAlwaysOnVoiceTriggerEnabled:(BOOL)a3;
- (void)setCircularBuffer:(id)a3;
- (void)setConnectedDevice:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHostTimeBuffer:(id)a3;
- (void)setIsForwarding:(BOOL)a3;
- (void)setKeywordAnalyzer:(id)a3;
- (void)setLastForwardedSampleCount:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setUserIntentOptions:(id)a3;
- (void)setUuid:(id)a3;
- (void)setVoiceTriggerEnabled:(BOOL)a3;
- (void)setVoiceTriggerSampleCount:(unint64_t)a3;
- (void)start;
- (void)startAudioStreamWithOption:(id)a3;
- (void)stop;
- (void)stopAudioStream;
@end

@implementation CSAudioInjectionBuiltInEngine

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIntentOptions, 0);
  objc_destroyWeak((id *)&self->_connectedDevice);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_hostTimeBuffer, 0);
  objc_storeStrong((id *)&self->_circularBuffer, 0);
  objc_storeStrong((id *)&self->_keywordAnalyzer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (NSDictionary)userIntentOptions
{
  return self->_userIntentOptions;
}

- (void)setVoiceTriggerSampleCount:(unint64_t)a3
{
  self->_voiceTriggerSampleCount = a3;
}

- (unint64_t)voiceTriggerSampleCount
{
  return self->_voiceTriggerSampleCount;
}

- (void)setIsForwarding:(BOOL)a3
{
  self->_isForwarding = a3;
}

- (BOOL)isForwarding
{
  return self->_isForwarding;
}

- (void)setConnectedDevice:(id)a3
{
}

- (CSAudioInjectionDevice)connectedDevice
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectedDevice);
  return (CSAudioInjectionDevice *)WeakRetained;
}

- (void)setVoiceTriggerEnabled:(BOOL)a3
{
  self->_voiceTriggerEnabled = a3;
}

- (BOOL)voiceTriggerEnabled
{
  return self->_voiceTriggerEnabled;
}

- (void)setUuid:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setHostTimeBuffer:(id)a3
{
}

- (NSMutableArray)hostTimeBuffer
{
  return self->_hostTimeBuffer;
}

- (void)setLastForwardedSampleCount:(unint64_t)a3
{
  self->_lastForwardedSampleCount = a3;
}

- (unint64_t)lastForwardedSampleCount
{
  return self->_lastForwardedSampleCount;
}

- (void)setCircularBuffer:(id)a3
{
}

- (CSAudioCircularBuffer)circularBuffer
{
  return self->_circularBuffer;
}

- (void)setKeywordAnalyzer:(id)a3
{
}

- (CSKeywordAnalyzerNDEAPI)keywordAnalyzer
{
  return self->_keywordAnalyzer;
}

- (CSAudioInjectionEngineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSAudioInjectionEngineDelegate *)WeakRetained;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)audioEngineBufferAvailable:(id)a3 audioStreamHandleId:(unint64_t)a4 buffer:(id)a5 remoteVAD:(id)a6 atTime:(unint64_t)a7 isFileLoadedBuffer:(BOOL)a8
{
  id v12 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C65E4;
  block[3] = &unk_100252AF8;
  id v16 = v12;
  v17 = self;
  unint64_t v18 = a7;
  unint64_t v19 = a4;
  BOOL v20 = a8;
  id v14 = v12;
  dispatch_async(queue, block);
}

- (void)stopAudioStream
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C6D08;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)startAudioStreamWithOption:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C6E70;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (int64_t)getBestSampleCountWithOption:(id)a3
{
  id v4 = a3;
  self->_unint64_t lastForwardedSampleCount = (unint64_t)[(CSAudioCircularBuffer *)self->_circularBuffer sampleCount];
  if ([v4 requestHistoricalAudioDataWithHostTime])
  {
    unint64_t v5 = 10000000000;
    id v20 = v4;
    id v6 = [v4 startRecordingHostTime];
    unint64_t lastForwardedSampleCount = (unint64_t)[(CSAudioCircularBuffer *)self->_circularBuffer sampleCount];
    if ((int)[(NSMutableArray *)self->_hostTimeBuffer count] < 1)
    {
      uint64_t v15 = 10000000000;
    }
    else
    {
      uint64_t v8 = 0;
      do
      {
        v9 = [(NSMutableArray *)self->_hostTimeBuffer objectAtIndex:v8];
        v10 = [v9 objectForKeyedSubscript:@"SampleCount"];
        unsigned int v11 = [v10 unsignedIntValue];

        id v12 = [v9 objectForKeyedSubscript:@"HostTime"];
        v13 = [v12 unsignedLongLongValue];
        unint64_t v14 = v13 - v6;
        if (v13 - v6 >= v5) {
          unint64_t v14 = v5;
        }
        if (v13 >= v6) {
          uint64_t v15 = v14;
        }
        else {
          uint64_t v15 = v5;
        }
        if (v13 - v6 <= v5 && v13 >= v6) {
          unint64_t lastForwardedSampleCount = v11;
        }

        ++v8;
        unint64_t v5 = v15;
      }
      while (v8 < (int)[(NSMutableArray *)self->_hostTimeBuffer count]);
    }
    v17 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      uuid = self->_uuid;
      *(_DWORD *)buf = 136315906;
      v22 = "-[CSAudioInjectionBuiltInEngine getBestSampleCountWithOption:]";
      __int16 v23 = 2048;
      uint64_t v24 = v15;
      __int16 v25 = 2048;
      unint64_t v26 = lastForwardedSampleCount;
      __int16 v27 = 2112;
      v28 = uuid;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s Looking up audio diff:%llu sampleCount:%llu %@", buf, 0x2Au);
    }
    id v4 = v20;
  }
  else
  {
    unint64_t lastForwardedSampleCount = self->_lastForwardedSampleCount;
  }

  return lastForwardedSampleCount;
}

- (BOOL)isRecording
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000C7234;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)injectAudio:(id)a3 withScaleFactor:(float)a4 playbackStarted:(id)a5 completion:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)CSAudioInjectionBuiltInEngine;
  return -[CSAudioInjectionEngine injectAudio:withScaleFactor:playbackStarted:completion:](&v7, "injectAudio:withScaleFactor:playbackStarted:completion:", a3, a5, a6);
}

- (BOOL)injectAudio:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSAudioInjectionBuiltInEngine;
  return [(CSAudioInjectionEngine *)&v4 injectAudio:a3];
}

- (void)stop
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C733C;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)setUserIntentOptions:(id)a3
{
}

- (void)start
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C7444;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)dealloc
{
  char v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    uuid = self->_uuid;
    *(_DWORD *)buf = 136315394;
    objc_super v7 = "-[CSAudioInjectionBuiltInEngine dealloc]";
    __int16 v8 = 2112;
    char v9 = uuid;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Dealloc CSAudioInjectionEngine : %@", buf, 0x16u);
  }
  v5.receiver = self;
  v5.super_class = (Class)CSAudioInjectionBuiltInEngine;
  [(CSAudioInjectionEngine *)&v5 dealloc];
}

- (void)setDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CSAudioInjectionBuiltInEngine;
  id v4 = a3;
  [(CSAudioInjectionEngine *)&v5 setDelegate:self];
  objc_storeWeak((id *)&self->_delegate, v4);
}

- (void)attachDevice:(id)a3
{
  id v4 = a3;
  [(CSAudioInjectionBuiltInEngine *)self setConnectedDevice:v4];
  unsigned int v5 = [v4 enableAlwaysOnVoiceTrigger];

  BOOL v6 = v5 && [(CSAudioInjectionBuiltInEngine *)self isAlwaysOnVoiceTriggerAvailable];
  [(CSAudioInjectionBuiltInEngine *)self setAlwaysOnVoiceTriggerEnabled:v6];
}

- (BOOL)alwaysOnVoiceTriggerEnabled
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000C7B0C;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setAlwaysOnVoiceTriggerEnabled:(BOOL)a3
{
  if (CSHasAOP())
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000C7BBC;
    v6[3] = &unk_100253AB8;
    v6[4] = self;
    BOOL v7 = a3;
    dispatch_async(queue, v6);
  }
}

- (CSAudioInjectionBuiltInEngine)initWithStreamHandleId:(unint64_t)a3
{
  v22.receiver = self;
  v22.super_class = (Class)CSAudioInjectionBuiltInEngine;
  char v3 = [(CSAudioInjectionEngine *)&v22 initWithStreamHandleId:a3];
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("CSAudioInjectionBuiltInEngine", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    v3->_voiceTriggerEnabled = 0;
    id v6 = objc_alloc((Class)CSAudioCircularBuffer);
    uint64_t v7 = +[CSConfig inputRecordingNumberOfChannels];
    +[CSConfig inputRecordingSampleRate];
    int v9 = v8;
    v10 = +[CSAudioTimeConverterPool sharedInstance];
    unsigned int v11 = [v10 converterForAudioStreamId:1];
    LODWORD(v12) = 3.0;
    LODWORD(v13) = v9;
    unint64_t v14 = (CSAudioCircularBuffer *)[v6 initWithNumChannels:v7 recordingDuration:v11 samplingRate:v12 audioTimeConverter:v13];
    circularBuffer = v3->_circularBuffer;
    v3->_circularBuffer = v14;

    uint64_t v16 = +[NSUUID UUID];
    uuid = v3->_uuid;
    v3->_uuid = (NSUUID *)v16;

    uint64_t v18 = +[NSMutableArray array];
    hostTimeBuffer = v3->_hostTimeBuffer;
    v3->_hostTimeBuffer = (NSMutableArray *)v18;

    userIntentOptions = v3->_userIntentOptions;
    v3->_userIntentOptions = 0;
  }
  return v3;
}

@end