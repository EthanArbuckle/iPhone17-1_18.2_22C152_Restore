@interface CSAudioInjectionProviderExclave
+ (CSAudioInjectionProviderExclave)sharedInstance;
- (AudioQueueBuffer)_defaultBufferRef;
- (AudioStreamBasicDescription)_defaultOutASBD;
- (BOOL)isAudioQueueStarted;
- (CSAudioInjectionFileOption)fileOption;
- (CSAudioInjectionProviderExclave)init;
- (OS_dispatch_queue)queue;
- (OpaqueAudioQueue)exclaveAudioQueue;
- (double)bufferDuration;
- (id)injectionCompletion;
- (unint64_t)injectionEndTime;
- (unint64_t)injectionStartTime;
- (void)_createAudioQueueIfNeeded;
- (void)_prepareAndStartAudioQueue;
- (void)_readAudioBufferAndFeedIntoAudioQueue;
- (void)_setAudioSessionActive:(BOOL)a3;
- (void)setBufferDuration:(double)a3;
- (void)setExclaveAudioQueue:(OpaqueAudioQueue *)a3;
- (void)setFileOption:(id)a3;
- (void)setInjectionCompletion:(id)a3;
- (void)setInjectionEndTime:(unint64_t)a3;
- (void)setInjectionStartTime:(unint64_t)a3;
- (void)setIsAudioQueueStarted:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)speakAudioInExclave:(id)a3 withCompletion:(id)a4;
- (void)start;
@end

@implementation CSAudioInjectionProviderExclave

- (void).cxx_destruct
{
  objc_storeStrong(&self->_injectionCompletion, 0);
  objc_storeStrong((id *)&self->_fileOption, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setInjectionEndTime:(unint64_t)a3
{
  self->_injectionEndTime = a3;
}

- (unint64_t)injectionEndTime
{
  return self->_injectionEndTime;
}

- (void)setInjectionStartTime:(unint64_t)a3
{
  self->_injectionStartTime = a3;
}

- (unint64_t)injectionStartTime
{
  return self->_injectionStartTime;
}

- (void)setInjectionCompletion:(id)a3
{
}

- (id)injectionCompletion
{
  return self->_injectionCompletion;
}

- (void)setFileOption:(id)a3
{
}

- (CSAudioInjectionFileOption)fileOption
{
  return self->_fileOption;
}

- (void)setBufferDuration:(double)a3
{
  self->_bufferDuration = a3;
}

- (double)bufferDuration
{
  return self->_bufferDuration;
}

- (void)setIsAudioQueueStarted:(BOOL)a3
{
  self->_isAudioQueueStarted = a3;
}

- (BOOL)isAudioQueueStarted
{
  return self->_isAudioQueueStarted;
}

- (void)setExclaveAudioQueue:(OpaqueAudioQueue *)a3
{
  self->_exclaveAudioQueue = a3;
}

- (OpaqueAudioQueue)exclaveAudioQueue
{
  return self->_exclaveAudioQueue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (AudioStreamBasicDescription)_defaultOutASBD
{
  *(void *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  if (+[CSConfig inputRecordingIsFloat]) {
    result = (AudioStreamBasicDescription *)+[CSFAudioStreamBasicDescriptionFactory lpcmFloatASBD];
  }
  else {
    result = (AudioStreamBasicDescription *)+[CSFAudioStreamBasicDescriptionFactory lpcmInt16ASBD];
  }
  long long v5 = v7;
  *(_OWORD *)&retstr->mSampleRate = v6;
  *(_OWORD *)&retstr->mBytesPerPacket = v5;
  *(void *)&retstr->mBitsPerChannel = v8;
  return result;
}

- (void)_setAudioSessionActive:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = +[AVAudioSession sharedInstance];
  long long v5 = v4;
  if (!v3)
  {
    id v15 = 0;
    [v4 setActive:0 error:&v15];
    id v9 = v15;
    v10 = CSLogContextFacilityCoreSpeech;
    if (v9)
    {
      v11 = v9;
      if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
LABEL_11:

        goto LABEL_17;
      }
      *(_DWORD *)buf = 136315394;
      v19 = "-[CSAudioInjectionProviderExclave _setAudioSessionActive:]";
      __int16 v20 = 2112;
      v21 = v11;
      v12 = "%s Failed to deactivate audioSession with error: %@";
LABEL_19:
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v12, buf, 0x16u);
      goto LABEL_11;
    }
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136315138;
    v19 = "-[CSAudioInjectionProviderExclave _setAudioSessionActive:]";
    v14 = "%s Successfully deactivate audioSession";
LABEL_16:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v14, buf, 0xCu);
    goto LABEL_17;
  }
  id v17 = 0;
  [v4 setCategory:AVAudioSessionCategoryPlayback mode:AVAudioSessionModeDefault options:1 error:&v17];
  id v6 = v17;
  if (!v6)
  {
    id v16 = 0;
    [v5 setActive:1 error:&v16];
    id v13 = v16;
    v10 = CSLogContextFacilityCoreSpeech;
    if (v13)
    {
      v11 = v13;
      if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      *(_DWORD *)buf = 136315394;
      v19 = "-[CSAudioInjectionProviderExclave _setAudioSessionActive:]";
      __int16 v20 = 2112;
      v21 = v11;
      v12 = "%s Failed to activate audioSession with error: %@";
      goto LABEL_19;
    }
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136315138;
    v19 = "-[CSAudioInjectionProviderExclave _setAudioSessionActive:]";
    v14 = "%s Successfully activate audioSession";
    goto LABEL_16;
  }
  long long v7 = v6;
  uint64_t v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[CSAudioInjectionProviderExclave _setAudioSessionActive:]";
    __int16 v20 = 2112;
    v21 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Failed to set audioSession properties with error: %@", buf, 0x16u);
  }

LABEL_17:
}

- (void)_createAudioQueueIfNeeded
{
  BOOL v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.mSampleRate) = 136315138;
    *(void *)((char *)&buf.mSampleRate + 4) = "-[CSAudioInjectionProviderExclave _createAudioQueueIfNeeded]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&buf, 0xCu);
  }
  if (!self->_exclaveAudioQueue)
  {
    AudioQueueRef outAQ = 0;
    memset(&buf, 0, sizeof(buf));
    [(CSAudioInjectionProviderExclave *)self _defaultOutASBD];
    OSStatus v4 = AudioQueueNewOutput(&buf, (AudioQueueOutputCallback)j__objc_msgSend__readAudioBufferAndFeedIntoAudioQueue, self, 0, kCFRunLoopCommonModes, 0x80000u, &outAQ);
    if (v4)
    {
      OSStatus v5 = v4;
      id v6 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t v8 = 136315394;
        id v9 = "-[CSAudioInjectionProviderExclave _createAudioQueueIfNeeded]";
        __int16 v10 = 1024;
        OSStatus v11 = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s Failed to create Exclave Audio Injection AudioQueue with OSStatus error: %d", v8, 0x12u);
      }
    }
    else
    {
      self->_exclaveAudioQueue = outAQ;
    }
  }
}

- (AudioQueueBuffer)_defaultBufferRef
{
  double bufferDuration = self->_bufferDuration;
  [(CSAudioInjectionProviderExclave *)self _defaultOutASBD];
  double v4 = bufferDuration * v20;
  [(CSAudioInjectionProviderExclave *)self _defaultOutASBD];
  LODWORD(v5) = v19;
  double v6 = v4 * (double)v5;
  [(CSAudioInjectionProviderExclave *)self _defaultOutASBD];
  LODWORD(v7) = v18;
  unint64_t v8 = (unint64_t)(v6 * (double)v7);
  AudioQueueBufferRef outBuffer = 0;
  OSStatus v9 = AudioQueueAllocateBuffer(self->_exclaveAudioQueue, v8, &outBuffer);
  if (v9)
  {
    OSStatus v10 = v9;
    OSStatus v11 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)AudioStreamBasicDescription buf = 136315394;
      v22 = "-[CSAudioInjectionProviderExclave _defaultBufferRef]";
      __int16 v23 = 1024;
      OSStatus v24 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Unable to alloc AudioQueue AudioBuffer with OSStatus: %d", buf, 0x12u);
    }
    return 0;
  }
  else
  {
    memset(outBuffer->mAudioData, 1, v8);
    double v13 = self->_bufferDuration;
    [(CSAudioInjectionProviderExclave *)self _defaultOutASBD];
    [(CSAudioInjectionProviderExclave *)self _defaultOutASBD];
    [(CSAudioInjectionProviderExclave *)self _defaultOutASBD];
    result = outBuffer;
    outBuffer->mAudioDataByteSize = v15 * (v13 * v16) * v14;
  }
  return result;
}

- (void)_readAudioBufferAndFeedIntoAudioQueue
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F7018;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_prepareAndStartAudioQueue
{
  BOOL v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    OSStatus v11 = "-[CSAudioInjectionProviderExclave _prepareAndStartAudioQueue]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v10, 0xCu);
  }
  OSStatus v4 = AudioQueueEnqueueBuffer(self->_exclaveAudioQueue, [(CSAudioInjectionProviderExclave *)self _defaultBufferRef], 0, 0);
  if (v4)
  {
    OSStatus v5 = v4;
    double v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      OSStatus v11 = "-[CSAudioInjectionProviderExclave _prepareAndStartAudioQueue]";
      __int16 v12 = 1024;
      OSStatus v13 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s Failed to feed audio into exclave, unable to enqueue AQ buffer with OSStatus: %d", (uint8_t *)&v10, 0x12u);
    }
  }
  else
  {
    [(CSAudioInjectionProviderExclave *)self _setAudioSessionActive:1];
    OSStatus v7 = AudioQueueStart(self->_exclaveAudioQueue, 0);
    unint64_t v8 = CSLogContextFacilityCoreSpeech;
    if (v7)
    {
      OSStatus v9 = v7;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v10 = 136315394;
        OSStatus v11 = "-[CSAudioInjectionProviderExclave _prepareAndStartAudioQueue]";
        __int16 v12 = 1024;
        OSStatus v13 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Failed to feed audio into exclave, unable to start AQ buffer with OSStatus: %d", (uint8_t *)&v10, 0x12u);
      }
      [(CSAudioInjectionProviderExclave *)self _setAudioSessionActive:0];
    }
    else
    {
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315138;
        OSStatus v11 = "-[CSAudioInjectionProviderExclave _prepareAndStartAudioQueue]";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Successfully start the audio queue", (uint8_t *)&v10, 0xCu);
      }
      self->_isAudioQueueStarted = 1;
    }
  }
}

- (void)speakAudioInExclave:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F7920;
  block[3] = &unk_100253280;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)start
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F7BF8;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (CSAudioInjectionProviderExclave)init
{
  v7.receiver = self;
  v7.super_class = (Class)CSAudioInjectionProviderExclave;
  v2 = [(CSAudioInjectionProviderExclave *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSAudioInjectionProviderExclave", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_isAudioQueueStarted = 0;
    +[CSConfig inputRecordingBufferDuration];
    v2->_double bufferDuration = v5;
  }
  return v2;
}

+ (CSAudioInjectionProviderExclave)sharedInstance
{
  if (qword_1002A39E0 != -1) {
    dispatch_once(&qword_1002A39E0, &stru_1002517E0);
  }
  v2 = (void *)qword_1002A39E8;
  return (CSAudioInjectionProviderExclave *)v2;
}

@end