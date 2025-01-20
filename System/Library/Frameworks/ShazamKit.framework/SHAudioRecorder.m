@interface SHAudioRecorder
+ (BOOL)hasAudioQueueFailedWithStatus:(int)a3 annotateError:(id *)a4;
+ (BOOL)isAudioQueueRunning:(OpaqueAudioQueue *)a3;
- (AudioStreamBasicDescription)audioStreamBasicDescription;
- (BOOL)isRunning;
- (BOOL)stopAudioQueueAndClearBuffersWithError:(id *)a3;
- (NSString)description;
- (OS_dispatch_queue)audioRecorderDispatchQueue;
- (OpaqueAudioQueue)audioQueue;
- (SHAudioRecorder)initWithRecordingSource:(int64_t)a3;
- (SHAudioRecorderDelegate)delegate;
- (int64_t)recordingSource;
- (void)dealloc;
- (void)setAudioQueue:(OpaqueAudioQueue *)a3;
- (void)setAudioRecorderDispatchQueue:(id)a3;
- (void)setAudioStreamBasicDescription:(AudioStreamBasicDescription *)a3;
- (void)setDelegate:(id)a3;
- (void)setRecordingSource:(int64_t)a3;
- (void)startAudioQueueAfterRetrySecondsWithCompletion:(id)a3;
- (void)startRecordingWithCompletion:(id)a3;
@end

@implementation SHAudioRecorder

- (void)dealloc
{
  v3 = sh_log_object();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Deallocating SHAudioRecorder", buf, 2u);
  }

  [(SHAudioRecorder *)self stopAudioQueueAndClearBuffersWithError:0];
  v4.receiver = self;
  v4.super_class = (Class)SHAudioRecorder;
  [(SHAudioRecorder *)&v4 dealloc];
}

- (SHAudioRecorder)initWithRecordingSource:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SHAudioRecorder;
  objc_super v4 = [(SHAudioRecorder *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_recordingSource = a3;
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.ShazamKit.shazamaudiorecorder.dispatch", 0);
    audioRecorderDispatchQueue = v5->_audioRecorderDispatchQueue;
    v5->_audioRecorderDispatchQueue = (OS_dispatch_queue *)v6;
  }
  return v5;
}

- (BOOL)isRunning
{
  v3 = objc_opt_class();
  audioQueue = self->_audioQueue;

  return [v3 isAudioQueueRunning:audioQueue];
}

- (void)startRecordingWithCompletion:(id)a3
{
  objc_super v4 = (void (**)(id, void, id))a3;
  if (![(SHAudioRecorder *)self isRunning])
  {
    id v6 = [objc_alloc((Class)AVAudioFormat) initStandardFormatWithSampleRate:1 channels:44100.0];
    v7 = [v6 streamDescription];
    uint64_t v8 = v7[4];
    long long v9 = *((_OWORD *)v7 + 1);
    *(_OWORD *)&self->_audioStreamBasicDescription.mSampleRate = *(_OWORD *)v7;
    *(_OWORD *)&self->_audioStreamBasicDescription.mBytesPerPacket = v9;
    *(void *)&self->_audioStreamBasicDescription.mBitsPerChannel = v8;
    uint64_t v10 = AudioQueueNewInput(&self->_audioStreamBasicDescription, (AudioQueueInputCallback)sub_100027DC8, self, 0, 0, ((id)[(SHAudioRecorder *)self recordingSource] != (id)2) << 11, &self->_audioQueue);
    id v32 = 0;
    unsigned int v11 = [(id)objc_opt_class() hasAudioQueueFailedWithStatus:v10 annotateError:&v32];
    id v12 = v32;
    if (v11)
    {
      v13 = sh_log_object();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v12;
        v14 = "Failed to create a new audio queue input with error %@";
        v15 = v13;
        uint32_t v16 = 12;
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
      }
    }
    else
    {
      if ((id)[(SHAudioRecorder *)self recordingSource] == (id)1)
      {
        id v17 = [objc_alloc((Class)ATAudioTapDescription) initSystemTapWithFormat:v6];
        id v18 = [objc_alloc((Class)ATAudioTap) initWithTapDescription:v17];
        uint64_t v19 = AudioQueueSetProperty(self->_audioQueue, 0x71746F62u, v18, 8u);
        id v31 = v12;
        unsigned int v20 = [(id)objc_opt_class() hasAudioQueueFailedWithStatus:v19 annotateError:&v31];
        id v21 = v31;

        if (v20)
        {
          v22 = sh_log_object();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to set audio queue property", buf, 2u);
          }

          v4[2](v4, 0, v21);
          id v12 = v21;
          goto LABEL_20;
        }
      }
      else
      {
        id v21 = v12;
      }
      uint64_t v23 = AudioQueueAddPropertyListener(self->_audioQueue, 0x6171726Eu, (AudioQueuePropertyListenerProc)sub_100027ECC, self);
      id v30 = v21;
      unsigned __int8 v24 = [(id)objc_opt_class() hasAudioQueueFailedWithStatus:v23 annotateError:&v30];
      id v12 = v30;

      if ((v24 & 1) == 0)
      {
        for (uint64_t i = 8; i != 32; i += 8)
        {
          AudioQueueAllocateBuffer(self->_audioQueue, 0x2000u, (AudioQueueBufferRef *)((char *)self + i));
          AudioQueueEnqueueBuffer(self->_audioQueue, *(AudioQueueBufferRef *)((char *)&self->super.isa + i), 0, 0);
        }
        OSStatus v26 = AudioQueueStart(self->_audioQueue, 0);
        if (v26)
        {
          v27 = +[NSError errorWithDomain:SHCoreErrorDomain code:v26 userInfo:0];
          v28 = sh_log_object();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v34 = v27;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to start audio queue with error %@, retry one more time", buf, 0xCu);
          }

          v29 = [(SHAudioRecorder *)self delegate];
          [v29 recorder:self failedToStartWithError:v27];

          [(SHAudioRecorder *)self startAudioQueueAfterRetrySecondsWithCompletion:v4];
        }
        else
        {
          v4[2](v4, 1, 0);
        }
        goto LABEL_20;
      }
      v13 = sh_log_object();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v14 = "Failed to add isRunning property listener";
        v15 = v13;
        uint32_t v16 = 2;
        goto LABEL_18;
      }
    }

    v4[2](v4, 0, v12);
LABEL_20:

    goto LABEL_21;
  }
  v5 = sh_log_object();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Already running audio queue", buf, 2u);
  }

  v4[2](v4, 1, 0);
LABEL_21:
}

+ (BOOL)isAudioQueueRunning:(OpaqueAudioQueue *)a3
{
  UInt32 ioDataSize = 4;
  int outData = 0;
  uint64_t v5 = 0;
  unsigned __int8 v3 = objc_msgSend(a1, "hasAudioQueueFailedWithStatus:annotateError:", AudioQueueGetProperty(a3, 0x6171726Eu, &outData, &ioDataSize), &v5);
  return (outData != 0) & ~v3;
}

- (BOOL)stopAudioQueueAndClearBuffersWithError:(id *)a3
{
  audioQueue = self->_audioQueue;
  if (!audioQueue) {
    return 1;
  }
  uint64_t v6 = AudioQueueStop(audioQueue, 1u);
  unsigned int v7 = [(id)objc_opt_class() hasAudioQueueFailedWithStatus:v6 annotateError:a3];
  char v8 = v7;
  if (a3 && v7)
  {
    long long v9 = sh_log_object();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = *a3;
      int v20 = 138412290;
      id v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to stop audio queue %@", (uint8_t *)&v20, 0xCu);
    }
  }
  char v11 = v8 ^ 1;
  uint64_t v12 = AudioQueueRemovePropertyListener(self->_audioQueue, 0x6171726Eu, (AudioQueuePropertyListenerProc)sub_100027ECC, self);
  unsigned int v13 = [(id)objc_opt_class() hasAudioQueueFailedWithStatus:v12 annotateError:a3];
  if (a3 && v13)
  {
    v14 = sh_log_object();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = *a3;
      int v20 = 138412290;
      id v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to remove isRunning property listener %@", (uint8_t *)&v20, 0xCu);
    }
  }
  uint64_t v16 = AudioQueueDispose(self->_audioQueue, 0);
  if ([(id)objc_opt_class() hasAudioQueueFailedWithStatus:v16 annotateError:a3])
  {
    if (a3)
    {
      id v17 = sh_log_object();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = *a3;
        int v20 = 138412290;
        id v21 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to dispose audio queue %@", (uint8_t *)&v20, 0xCu);
      }
    }
  }
  else
  {
    self->_audioQueue = 0;
  }
  return v11;
}

+ (BOOL)hasAudioQueueFailedWithStatus:(int)a3 annotateError:(id *)a4
{
  if (a3 && a4)
  {
    *a4 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:a3 userInfo:0];
  }
  return a3 != 0;
}

- (void)startAudioQueueAfterRetrySecondsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  uint64_t v6 = [(SHAudioRecorder *)self audioRecorderDispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100028398;
  block[3] = &unk_1000758A8;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v7 = v4;
  dispatch_after(v5, v6, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"Recorder using source %li", [(SHAudioRecorder *)self recordingSource]];
}

- (SHAudioRecorderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SHAudioRecorderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)recordingSource
{
  return self->_recordingSource;
}

- (void)setRecordingSource:(int64_t)a3
{
  self->_recordingSource = a3;
}

- (OpaqueAudioQueue)audioQueue
{
  return self->_audioQueue;
}

- (void)setAudioQueue:(OpaqueAudioQueue *)a3
{
  self->_audioQueue = a3;
}

- (AudioStreamBasicDescription)audioStreamBasicDescription
{
  long long v3 = *(_OWORD *)&self[2].mSampleRate;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[1].mBytesPerFrame;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(void *)&retstr->mBitsPerChannel = *(void *)&self[2].mBytesPerPacket;
  return self;
}

- (void)setAudioStreamBasicDescription:(AudioStreamBasicDescription *)a3
{
  long long v3 = *(_OWORD *)&a3->mSampleRate;
  long long v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(void *)&self->_audioStreamBasicDescription.mBitsPerChannel = *(void *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_audioStreamBasicDescription.mSampleRate = v3;
  *(_OWORD *)&self->_audioStreamBasicDescription.mBytesPerPacket = v4;
}

- (OS_dispatch_queue)audioRecorderDispatchQueue
{
  return self->_audioRecorderDispatchQueue;
}

- (void)setAudioRecorderDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioRecorderDispatchQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end