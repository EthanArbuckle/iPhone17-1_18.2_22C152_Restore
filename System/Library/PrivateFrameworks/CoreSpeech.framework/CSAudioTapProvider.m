@interface CSAudioTapProvider
- (BOOL)_setupRecordingAudioQueueIfNeededWithOption:(id)a3;
- (BOOL)isNarrowBand;
- (BOOL)isRecording;
- (BOOL)prepareAudioStreamSync:(id)a3 request:(id)a4 error:(id *)a5;
- (BOOL)setCurrentContext:(id)a3 error:(id *)a4;
- (BOOL)supportsDuckingOnCurrentRouteWithError:(id *)a3;
- (CSAudioCircularBuffer)circularBuffer;
- (CSAudioStream)audioStream;
- (CSAudioTapProvider)init;
- (CSOSTransaction)transaction;
- (NSString)UUIDString;
- (OS_dispatch_queue)loggingQueue;
- (OS_dispatch_queue)queue;
- (OpaqueAudioQueue)recordingAudioQueue;
- (id)UUID;
- (id)aqStartCompletion;
- (id)aqStopCompletion;
- (id)audioChunkFrom:(unint64_t)a3 to:(unint64_t)a4;
- (id)audioChunkFrom:(unint64_t)a3 to:(unint64_t)a4 channelIdx:(unint64_t)a5;
- (id)audioChunkToEndFrom:(unint64_t)a3;
- (id)audioChunkToEndFrom:(unint64_t)a3 channelIdx:(unint64_t)a4;
- (id)audioDeviceInfo;
- (id)audioStreamWithRequest:(id)a3 streamName:(id)a4 error:(id *)a5;
- (id)holdAudioStreamWithDescription:(id)a3 option:(id)a4;
- (id)playbackRoute;
- (id)recordDeviceInfo;
- (id)recordRoute;
- (id)recordSettings;
- (unint64_t)audioStreamId;
- (unint64_t)processedSampleCount;
- (unsigned)_calculateBufferSize:(OpaqueAudioQueue *)a3 audioStreamBasicDescription:(AudioStreamBasicDescription *)a4 frameSizeInSec:(float)a5;
- (void)CSAudioServerCrashMonitorDidReceiveServerCrash:(id)a3;
- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3;
- (void)_destroyRecordingAudioQueue;
- (void)_holdTransactionForStartListening;
- (void)_releaseTransactionForStopListeningIfNeeded;
- (void)_reset;
- (void)_saveRecordingBufferFrom:(unint64_t)a3 to:(unint64_t)a4 toURL:(id)a5;
- (void)_stopRecordingAudioQueueIfNeededWithCompletion:(id)a3;
- (void)attachTandemStream:(id)a3 toPrimaryStream:(id)a4 completion:(id)a5;
- (void)audioStreamWithRequest:(id)a3 streamName:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)destroyRecordingAudioQueue;
- (void)prepareAudioStream:(id)a3 request:(id)a4 completion:(id)a5;
- (void)saveRecordingBufferFrom:(unint64_t)a3 to:(unint64_t)a4 toURL:(id)a5;
- (void)saveRecordingBufferToEndFrom:(unint64_t)a3 toURL:(id)a4;
- (void)setAqStartCompletion:(id)a3;
- (void)setAqStopCompletion:(id)a3;
- (void)setAudioStream:(id)a3;
- (void)setCircularBuffer:(id)a3;
- (void)setLoggingQueue:(id)a3;
- (void)setProcessedSampleCount:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setRecordingAudioQueue:(OpaqueAudioQueue *)a3;
- (void)setTransaction:(id)a3;
- (void)setUUIDString:(id)a3;
- (void)setup;
- (void)startAudioStream:(id)a3 option:(id)a4 completion:(id)a5;
- (void)stopAudioStream:(id)a3 option:(id)a4 completion:(id)a5;
@end

@implementation CSAudioTapProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_destroyWeak((id *)&self->_audioStream);
  objc_storeStrong((id *)&self->_circularBuffer, 0);
  objc_storeStrong((id *)&self->_UUIDString, 0);
  objc_storeStrong(&self->_aqStopCompletion, 0);
  objc_storeStrong(&self->_aqStartCompletion, 0);
  objc_storeStrong((id *)&self->_loggingQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setTransaction:(id)a3
{
}

- (CSOSTransaction)transaction
{
  return self->_transaction;
}

- (void)setProcessedSampleCount:(unint64_t)a3
{
  self->_processedSampleCount = a3;
}

- (unint64_t)processedSampleCount
{
  return self->_processedSampleCount;
}

- (void)setAudioStream:(id)a3
{
}

- (CSAudioStream)audioStream
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioStream);
  return (CSAudioStream *)WeakRetained;
}

- (void)setCircularBuffer:(id)a3
{
}

- (CSAudioCircularBuffer)circularBuffer
{
  return self->_circularBuffer;
}

- (void)setUUIDString:(id)a3
{
}

- (NSString)UUIDString
{
  return self->_UUIDString;
}

- (void)setAqStopCompletion:(id)a3
{
}

- (id)aqStopCompletion
{
  return self->_aqStopCompletion;
}

- (void)setAqStartCompletion:(id)a3
{
}

- (id)aqStartCompletion
{
  return self->_aqStartCompletion;
}

- (void)setLoggingQueue:(id)a3
{
}

- (OS_dispatch_queue)loggingQueue
{
  return self->_loggingQueue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setRecordingAudioQueue:(OpaqueAudioQueue *)a3
{
  self->_recordingAudioQueue = a3;
}

- (OpaqueAudioQueue)recordingAudioQueue
{
  return self->_recordingAudioQueue;
}

- (id)playbackRoute
{
  return 0;
}

- (BOOL)isNarrowBand
{
  return 0;
}

- (id)recordSettings
{
  return 0;
}

- (id)audioDeviceInfo
{
  return 0;
}

- (id)recordDeviceInfo
{
  return 0;
}

- (id)recordRoute
{
  return 0;
}

- (BOOL)supportsDuckingOnCurrentRouteWithError:(id *)a3
{
  return 0;
}

- (id)holdAudioStreamWithDescription:(id)a3 option:(id)a4
{
  return 0;
}

- (void)_saveRecordingBufferFrom:(unint64_t)a3 to:(unint64_t)a4 toURL:(id)a5
{
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v9 = [(CSAudioCircularBuffer *)self->_circularBuffer copySamplesFrom:a3 to:a4];
  v10 = v9;
  if (v9)
  {
    loggingQueue = self->_loggingQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000170A8;
    v12[3] = &unk_100250C70;
    unint64_t v15 = a3;
    unint64_t v16 = a4;
    id v13 = v9;
    id v14 = v8;
    dispatch_async(loggingQueue, v12);
  }
}

- (void)saveRecordingBufferToEndFrom:(unint64_t)a3 toURL:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017224;
  block[3] = &unk_1002532A8;
  id v10 = v6;
  unint64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)saveRecordingBufferFrom:(unint64_t)a3 to:(unint64_t)a4 toURL:(id)a5
{
  id v8 = a5;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001733C;
  v11[3] = &unk_100250C70;
  unint64_t v13 = a3;
  unint64_t v14 = a4;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, v11);
}

- (id)audioChunkToEndFrom:(unint64_t)a3 channelIdx:(unint64_t)a4
{
  return 0;
}

- (id)audioChunkToEndFrom:(unint64_t)a3
{
  return 0;
}

- (id)audioChunkFrom:(unint64_t)a3 to:(unint64_t)a4 channelIdx:(unint64_t)a5
{
  return 0;
}

- (id)audioChunkFrom:(unint64_t)a3 to:(unint64_t)a4
{
  return 0;
}

- (void)prepareAudioStream:(id)a3 request:(id)a4 completion:(id)a5
{
  v5 = (void (**)(id, uint64_t, void))a5;
  if (v5) {
    v5[2](v5, 1, 0);
  }
}

- (BOOL)prepareAudioStreamSync:(id)a3 request:(id)a4 error:(id *)a5
{
  return 1;
}

- (void)attachTandemStream:(id)a3 toPrimaryStream:(id)a4 completion:(id)a5
{
  v5 = (void (**)(id, void, void *))a5;
  if (v5)
  {
    v7 = v5;
    id v6 = +[NSError errorWithDomain:CSErrorDomain code:2058 userInfo:0];
    v7[2](v7, 0, v6);

    v5 = v7;
  }
}

- (void)audioStreamWithRequest:(id)a3 streamName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id, void))a5;
  if (v10)
  {
    id v11 = [objc_alloc((Class)CSAudioStream) initWithAudioStreamProvider:self streamName:v9 streamRequest:v8];
    queue = self->_queue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000175C4;
    v14[3] = &unk_100253B08;
    v14[4] = self;
    id v13 = v11;
    id v15 = v13;
    dispatch_async(queue, v14);
    v10[2](v10, v13, 0);
  }
}

- (id)audioStreamWithRequest:(id)a3 streamName:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 requiresHistoricalBuffer])
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100017734;
    block[3] = &unk_100253AE0;
    block[4] = self;
    dispatch_async(queue, block);
  }
  id v10 = [objc_alloc((Class)CSAudioStream) initWithAudioStreamProvider:self streamName:v8 streamRequest:v7];
  id v11 = self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001784C;
  v16[3] = &unk_100253B08;
  v16[4] = self;
  id v12 = v10;
  id v17 = v12;
  dispatch_async(v11, v16);
  id v13 = v17;
  id v14 = v12;

  return v14;
}

- (BOOL)setCurrentContext:(id)a3 error:(id *)a4
{
  return 1;
}

- (unint64_t)audioStreamId
{
  return 1;
}

- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3
{
  v3 = CSLogCategoryAudio;
  if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[CSAudioTapProvider CSAudioServerCrashMonitorDidReceiveServerRestart:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s audiomxd/bridgeaudiod restarted", (uint8_t *)&v4, 0xCu);
  }
}

- (void)CSAudioServerCrashMonitorDidReceiveServerCrash:(id)a3
{
  int v4 = CSLogCategoryAudio;
  if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[CSAudioTapProvider CSAudioServerCrashMonitorDidReceiveServerCrash:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s audiomxd/bridgeaudiod crashed", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017A40;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (unsigned)_calculateBufferSize:(OpaqueAudioQueue *)a3 audioStreamBasicDescription:(AudioStreamBasicDescription *)a4 frameSizeInSec:(float)a5
{
  signed int mBytesPerPacket = a4->mBytesPerPacket;
  signed int outData = mBytesPerPacket;
  if (!mBytesPerPacket)
  {
    UInt32 ioDataSize = 4;
    AudioQueueGetProperty(a3, 0x786F7073u, &outData, &ioDataSize);
    signed int mBytesPerPacket = outData;
  }
  return fmin(a4->mSampleRate * (double)mBytesPerPacket * a5, 57344.0);
}

- (BOOL)isRecording
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100017BE0;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_stopRecordingAudioQueueIfNeededWithCompletion:(id)a3
{
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = sub_100018040;
  v18 = &unk_100253150;
  v19 = self;
  id v4 = a3;
  id v20 = v4;
  v5 = objc_retainBlock(&v15);
  uint64_t v6 = [(CSAudioTapProvider *)self aqStartCompletion];
  BOOL v7 = v6 == 0;

  if (!v7)
  {
    (*((void (**)(void))self->_aqStartCompletion + 2))();
    [(CSAudioTapProvider *)self setAqStartCompletion:0];
  }
  recordingAudioQueue = self->_recordingAudioQueue;
  if (recordingAudioQueue)
  {
    OSStatus v9 = AudioQueueStop(recordingAudioQueue, 1u);
    id v10 = CSLogCategoryAudio;
    if (v9)
    {
      if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v22 = "-[CSAudioTapProvider _stopRecordingAudioQueueIfNeededWithCompletion:]";
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Failed to stop Audio Queue", buf, 0xCu);
      }
      id v11 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v9 userInfo:0];
      if (v4) {
        ((void (*)(void ***, void, void *))v5[2])(v5, 0, v11);
      }
    }
    else
    {
      if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v22 = "-[CSAudioTapProvider _stopRecordingAudioQueueIfNeededWithCompletion:]";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Stopped Audio Queue successfully", buf, 0xCu);
      }
      if (v4)
      {
        id v13 = objc_retainBlock(v4);
        id aqStopCompletion = self->_aqStopCompletion;
        self->_id aqStopCompletion = v13;
      }
      id v11 = 0;
    }
  }
  else
  {
    id v12 = CSLogCategoryAudio;
    if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[CSAudioTapProvider _stopRecordingAudioQueueIfNeededWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s Recording queue does not exist, return as stopped successfully", buf, 0xCu);
    }
    ((void (*)(void ***, uint64_t, void))v5[2])(v5, 1, 0);
    id v11 = 0;
  }
}

- (void)stopAudioStream:(id)a3 option:(id)a4 completion:(id)a5
{
  id v6 = a5;
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100018158;
  v9[3] = &unk_1002535D8;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);
}

- (void)startAudioStream:(id)a3 option:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100018378;
  v23[3] = &unk_100253150;
  v23[4] = self;
  id v10 = a5;
  id v24 = v10;
  id v11 = objc_retainBlock(v23);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000183FC;
  block[3] = &unk_10024F7F8;
  id v18 = v8;
  id v19 = v9;
  id v20 = self;
  id v21 = v11;
  id v22 = v10;
  id v13 = v10;
  id v14 = v11;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(queue, block);
}

- (void)_releaseTransactionForStopListeningIfNeeded
{
  transaction = self->_transaction;
  if (transaction)
  {
    self->_transaction = 0;
  }
}

- (void)_holdTransactionForStartListening
{
  if (!self->_transaction)
  {
    char v3 = (CSOSTransaction *)[objc_alloc((Class)CSOSTransaction) initWithDescription:@"AudioTapProvider"];
    transaction = self->_transaction;
    self->_transaction = v3;
  }
}

- (void)_destroyRecordingAudioQueue
{
  recordingAudioQueue = self->_recordingAudioQueue;
  if (recordingAudioQueue)
  {
    AudioQueueRemovePropertyListener(recordingAudioQueue, 0x6171726Eu, (AudioQueuePropertyListenerProc)sub_100018964, self);
    uint64_t v4 = 0;
    *(void *)&long long v5 = 136315394;
    long long v13 = v5;
    do
    {
      id v6 = self->_audioBuffers[v4];
      if (v6)
      {
        OSStatus v7 = AudioQueueFreeBuffer(self->_recordingAudioQueue, v6);
        if (v7)
        {
          OSStatus v8 = v7;
          id v9 = CSLogCategoryAudio;
          if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v13;
            id v15 = "-[CSAudioTapProvider _destroyRecordingAudioQueue]";
            __int16 v16 = 1024;
            OSStatus v17 = v8;
            _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s AudioQueueFreeBuffer error: %i", buf, 0x12u);
          }
        }
      }
      ++v4;
    }
    while (v4 != 4);
    OSStatus v10 = AudioQueueDispose(self->_recordingAudioQueue, 1u);
    id v11 = CSLogCategoryAudio;
    if (v10)
    {
      OSStatus v12 = v10;
      if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v13;
        id v15 = "-[CSAudioTapProvider _destroyRecordingAudioQueue]";
        __int16 v16 = 1024;
        OSStatus v17 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Failed to dispose Audio Queue with error: %i", buf, 0x12u);
      }
    }
    else if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v15 = "-[CSAudioTapProvider _destroyRecordingAudioQueue]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Audio Queue has been disposed", buf, 0xCu);
    }
    self->_recordingAudioQueue = 0;
  }
  [(CSAudioTapProvider *)self _reset];
  [(CSAudioTapProvider *)self _releaseTransactionForStopListeningIfNeeded];
}

- (void)destroyRecordingAudioQueue
{
  unsigned __int8 v3 = [(CSAudioTapProvider *)self isRecording];
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100019094;
  v5[3] = &unk_100253AB8;
  unsigned __int8 v6 = v3;
  v5[4] = self;
  dispatch_async(queue, v5);
}

- (BOOL)_setupRecordingAudioQueueIfNeededWithOption:(id)a3
{
  id v4 = a3;
  if ([(CSAudioTapProvider *)self recordingAudioQueue])
  {
    BOOL v5 = 1;
    goto LABEL_21;
  }
  memset(&inFormat, 0, sizeof(inFormat));
  +[CSFAudioStreamBasicDescriptionFactory lpcmMonoNonInterleavedASBD];
  AudioQueueRef outAQ = 0;
  if (!AudioQueueNewInput(&inFormat, (AudioQueueInputCallback)sub_1000196C8, self, 0, 0, 0x800u, &outAQ))
  {
    id v7 = [objc_alloc((Class)AVAudioFormat) initWithStreamDescription:&inFormat];
    if ([v4 requestTelephonyDownlinkAudioTap]) {
      id v8 = [objc_alloc((Class)ATAudioTapDescription) initProcessTapWithFormat:v7 PID:4294967294];
    }
    else {
      id v8 = [objc_alloc((Class)ATAudioTapDescription) initSystemTapWithFormat:v7];
    }
    id v9 = v8;
    id v10 = [objc_alloc((Class)ATAudioTap) initWithTapDescription:v8];
    if (!v10)
    {
      id v11 = CSLogCategoryAudio;
      if (!os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      *(_DWORD *)buf = 136315138;
      v27 = "-[CSAudioTapProvider _setupRecordingAudioQueueIfNeededWithOption:]";
      OSStatus v12 = "%s Failed to create ATAudioTap!";
LABEL_37:
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v12, buf, 0xCu);
LABEL_17:
      if (outAQ) {
        AudioQueueDispose(outAQ, 1u);
      }
      goto LABEL_19;
    }
    if (AudioQueueSetProperty(outAQ, 0x71746F62u, v10, 8u))
    {
      id v11 = CSLogCategoryAudio;
      if (!os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      *(_DWORD *)buf = 136315138;
      v27 = "-[CSAudioTapProvider _setupRecordingAudioQueueIfNeededWithOption:]";
      OSStatus v12 = "%s Failed to set Audio Queue Process Tap!";
      goto LABEL_37;
    }
    UInt32 ioDataSize = 40;
    if (AudioQueueGetProperty(outAQ, 0x61716674u, &inFormat, &ioDataSize))
    {
      id v14 = CSLogCategoryAudio;
      if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "-[CSAudioTapProvider _setupRecordingAudioQueueIfNeededWithOption:]";
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Failed to get data format size!", buf, 0xCu);
      }
      if (outAQ) {
        AudioQueueDispose(outAQ, 1u);
      }
      goto LABEL_19;
    }
    if (outAQ)
    {
      -[CSAudioTapProvider setRecordingAudioQueue:](self, "setRecordingAudioQueue:");
      id v15 = [(CSAudioTapProvider *)self recordingAudioQueue];
      +[CSConfig inputRecordingBufferDuration];
      *(float *)&double v16 = v16;
      UInt32 v17 = [(CSAudioTapProvider *)self _calculateBufferSize:v15 audioStreamBasicDescription:&v22 frameSizeInSec:v16];
      for (uint64_t i = 8; i != 40; i += 8)
        AudioQueueAllocateBuffer([(CSAudioTapProvider *)self recordingAudioQueue], v17, (AudioQueueBufferRef *)((char *)self + i));
      OSStatus v19 = AudioQueueAddPropertyListener([(CSAudioTapProvider *)self recordingAudioQueue], 0x6171726Eu, (AudioQueuePropertyListenerProc)sub_100018964, self);
      id v20 = CSLogCategoryAudio;
      if (!v19)
      {
        if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v27 = "-[CSAudioTapProvider _setupRecordingAudioQueueIfNeededWithOption:]";
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s Successfully created audio Queue for tapping", buf, 0xCu);
        }
        BOOL v5 = 1;
        goto LABEL_20;
      }
      if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "-[CSAudioTapProvider _setupRecordingAudioQueueIfNeededWithOption:]";
        id v21 = "%s Failed to add isRunning listener!";
LABEL_35:
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v21, buf, 0xCu);
      }
    }
    else
    {
      id v20 = CSLogCategoryAudio;
      if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "-[CSAudioTapProvider _setupRecordingAudioQueueIfNeededWithOption:]";
        id v21 = "%s recordingAudioQueue is nil!";
        goto LABEL_35;
      }
    }
LABEL_19:
    BOOL v5 = 0;
LABEL_20:

    goto LABEL_21;
  }
  unsigned __int8 v6 = CSLogCategoryAudio;
  if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[CSAudioTapProvider _setupRecordingAudioQueueIfNeededWithOption:]";
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s Failed to create AudioQueue input!", buf, 0xCu);
  }
  if (outAQ) {
    AudioQueueDispose(outAQ, 1u);
  }
  BOOL v5 = 0;
LABEL_21:

  return v5;
}

- (void)_reset
{
  self->_processedSampleCount = 0;
  circularBuffer = self->_circularBuffer;
  if (circularBuffer) {
    [(CSAudioCircularBuffer *)circularBuffer reset];
  }
}

- (void)setup
{
  id v3 = +[CSAudioServerCrashMonitor sharedInstance];
  [v3 addObserver:self];
}

- (id)UUID
{
  return self->_UUIDString;
}

- (void)dealloc
{
  [(CSAudioTapProvider *)self _stopRecordingAudioQueueIfNeededWithCompletion:0];
  [(CSAudioTapProvider *)self _destroyRecordingAudioQueue];
  v3.receiver = self;
  v3.super_class = (Class)CSAudioTapProvider;
  [(CSAudioTapProvider *)&v3 dealloc];
}

- (CSAudioTapProvider)init
{
  v12.receiver = self;
  v12.super_class = (Class)CSAudioTapProvider;
  v2 = [(CSAudioTapProvider *)&v12 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSAudioTapProvider audioDispatchQueue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    BOOL v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, -2);
    dispatch_queue_t v6 = dispatch_queue_create("CSAudioTapProvider logging", v5);
    loggingQueue = v2->_loggingQueue;
    v2->_loggingQueue = (OS_dispatch_queue *)v6;

    id v8 = +[NSUUID UUID];
    uint64_t v9 = [v8 UUIDString];
    UUIDString = v2->_UUIDString;
    v2->_UUIDString = (NSString *)v9;

    v2->_processedSampleCount = 0;
  }
  return v2;
}

@end