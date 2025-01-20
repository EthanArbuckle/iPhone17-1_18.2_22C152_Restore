@interface VCAudioRelay
- (BOOL)canSetPropertyWithError:(id *)a3;
- (BOOL)createAudioConvertersWithError:(id *)a3;
- (BOOL)isRelayRunning;
- (BOOL)setClientIO:(id)a3 withError:(id *)a4;
- (BOOL)setIOBufferDuration:(double)a3 withError:(id *)a4;
- (BOOL)setNetworkClockID:(unint64_t)a3 withError:(id *)a4;
- (BOOL)setRemoteIO:(id)a3 withError:(id *)a4;
- (BOOL)startClientIO;
- (BOOL)startRelayIO:(tagVCAudioRelayIOInfo *)a3 otherRelayIO:(tagVCAudioRelayIOInfo *)a4;
- (BOOL)startRelayThreadWithError:(id *)a3;
- (BOOL)startRemoteIO;
- (OS_dispatch_source)periodicHealthPrintDispatchSource;
- (OpaqueAudioConverter)clientToRemoteConverter;
- (OpaqueAudioConverter)newAudioConverterWithInputFormat:(AudioStreamBasicDescription *)a3 outputFormat:(AudioStreamBasicDescription *)a4 withError:(id *)a5;
- (OpaqueAudioConverter)remoteToClientConverter;
- (VCAudioRelay)init;
- (VCAudioRelayIO)clientIO;
- (VCAudioRelayIO)remoteIO;
- (double)IOBufferDuration;
- (double)ioBufferDurationWithFirstIO:(id)a3 secondIO:(id)a4;
- (float)clientDownlinkPowerMovingAverage;
- (float)clientUplinkPowerMovingAverage;
- (float)rmsPowerOfBuffer:(float *)a3 numSamples:(unsigned int)a4;
- (unsigned)blocksRelayedCount;
- (void)dealloc;
- (void)destroyAudioConverters;
- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3;
- (void)forwardSamplesFromIO:(id)a3 toIO:(id)a4 withConverter:(OpaqueAudioConverter *)a5 withHostTime:(double)a6;
- (void)internalStopRelayThread;
- (void)lock;
- (void)printStreamFormats;
- (void)relayCallback;
- (void)relayProcessSamples;
- (void)releasePTPClock;
- (void)setClientIO:(id)a3;
- (void)setRemoteIO:(id)a3;
- (void)sleepForTime:(timespec *)a3;
- (void)startClientIO;
- (void)startPeriodicHealthPrint;
- (void)startRemoteIO;
- (void)stopClientIO;
- (void)stopRelayIO:(tagVCAudioRelayIOInfo *)a3 otherRelayIO:(tagVCAudioRelayIOInfo *)a4;
- (void)stopRelayThread;
- (void)stopRemoteIO;
- (void)unlock;
- (void)updateRealTimeStats;
- (void)updateRemoteCodecInfo:(const _VCRemoteCodecInfo *)a3;
@end

@implementation VCAudioRelay

- (VCAudioRelay)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCAudioRelay;
  v2 = [(VCAudioRelay *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_IOBufferDuration = NAN;
    pthread_mutex_init(&v2->_relayLock, 0);
    pthread_mutex_init(&v3->_clientIOInfo.lock, 0);
    pthread_mutex_init(&v3->_remoteIOInfo.lock, 0);
    v3->_clientIOInfo.ioFriendlyName = (NSString *)[@"vcaudiorelay.client" copy];
    v3->_clientIOInfo.audioRecordingFileName = (NSString *)[@"client_relay_io" copy];
    v3->_remoteIOInfo.ioFriendlyName = (NSString *)[@"vcaudiorelay.remote" copy];
    v3->_remoteIOInfo.audioRecordingFileName = (NSString *)[@"remote_relay_io" copy];
    v3->_remoteCodecInfo.codecType = 0;
    v3->_remoteCodecInfo.sampleRate = 24000.0;
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [(VCAudioRelay *)self stopClientIO];
  [(VCAudioRelay *)self stopRemoteIO];
  [(VCAudioRelay *)self destroyAudioConverters];

  v3 = self->_clientIOInfo.audioRecordingFileName;
  v4 = self->_remoteIOInfo.ioFriendlyName;
  objc_super v5 = self->_remoteIOInfo.audioRecordingFileName;
  [(VCAudioRelay *)self releasePTPClock];
  pthread_mutex_destroy(&self->_relayLock);
  pthread_mutex_destroy(&self->_clientIOInfo.lock);
  pthread_mutex_destroy(&self->_remoteIOInfo.lock);
  v6.receiver = self;
  v6.super_class = (Class)VCAudioRelay;
  [(VCAudioRelay *)&v6 dealloc];
}

- (void)releasePTPClock
{
  if (self->_ptpClock)
  {
    TimeSyncClockDispose();
    self->_ptpClock = 0;
  }
}

- (void)lock
{
}

- (void)unlock
{
}

- (BOOL)setIOBufferDuration:(double)a3 withError:(id *)a4
{
  [(VCAudioRelay *)self lock];
  BOOL v7 = [(VCAudioRelay *)self canSetPropertyWithError:a4];
  if (v7)
  {
    self->_IOBufferDuration = a3;
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCAudioRelay setIOBufferDuration:withError:]();
    }
  }
  [(VCAudioRelay *)self unlock];
  return v7;
}

- (double)ioBufferDurationWithFirstIO:(id)a3 secondIO:(id)a4
{
  if (a3)
  {
    [a3 preferredIODuration];
    double v6 = fmin(v5, 0.02);
    if (!a4) {
      return v6;
    }
  }
  else
  {
    double v6 = 0.02;
    if (!a4) {
      return v6;
    }
  }
  [a4 preferredIODuration];
  if (v7 < v6) {
    return v7;
  }
  return v6;
}

- (void)updateRemoteCodecInfo:(const _VCRemoteCodecInfo *)a3
{
  if (a3)
  {
    self->_remoteCodecInfo = *a3;
  }
  else
  {
    self->_remoteCodecInfo.codecType = 0;
    self->_remoteCodecInfo.sampleRate = 24000.0;
  }
}

- (VCAudioRelayIO)remoteIO
{
  return self->_remoteIOInfo.relayIO;
}

- (BOOL)setRemoteIO:(id)a3 withError:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v14[0] = 0;
  [(VCAudioRelay *)self lock];
  pthread_mutex_lock(&self->_remoteIOInfo.lock);
  [(VCAudioRelay *)self destroyAudioConverters];

  relayIO = (VCAudioRelayIO *)[a3 copy];
  self->_remoteIOInfo.relayIO = relayIO;
  if (relayIO)
  {
    if (!self->_clientIOInfo.relayIO) {
      goto LABEL_5;
    }
    BOOL v8 = [(VCAudioRelay *)self createAudioConvertersWithError:v14];
    relayIO = self->_remoteIOInfo.relayIO;
    if (!v8)
    {

      BOOL v9 = 0;
      self->_remoteIOInfo.relayIO = 0;
      goto LABEL_7;
    }
    if (relayIO)
    {
LABEL_5:
      [(VCAudioRelayIO *)relayIO setRelay:self];
      relayIO = self->_remoteIOInfo.relayIO;
    }
  }
  [(VCAudioRelay *)self updateRemoteCodecInfo:[(VCAudioRelayIO *)relayIO remoteCodecInfo]];
  BOOL v9 = 1;
LABEL_7:
  _VCRemoteCodecInfo remoteCodecInfo = self->_remoteCodecInfo;
  pthread_mutex_unlock(&self->_remoteIOInfo.lock);
  [(VCAudioRelay *)self unlock];
  p_lock = &self->_clientIOInfo.lock;
  pthread_mutex_lock(&self->_clientIOInfo.lock);
  v11 = self->_clientIOInfo.relayIO;
  pthread_mutex_unlock(p_lock);
  [(VCAudioRelayIO *)v11 didUpdateBasebandCodec:&remoteCodecInfo];

  if (a4 && !v9) {
    *a4 = (id)v14[0];
  }
  return v9;
}

- (VCAudioRelayIO)clientIO
{
  return self->_clientIOInfo.relayIO;
}

- (BOOL)setClientIO:(id)a3 withError:(id *)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v11[0] = 0;
  [(VCAudioRelay *)self lock];
  pthread_mutex_lock(&self->_clientIOInfo.lock);
  [(VCAudioRelay *)self destroyAudioConverters];

  double v7 = (VCAudioRelayIO *)[a3 copy];
  self->_clientIOInfo.relayIO = v7;
  BOOL v8 = 1;
  if (self->_remoteIOInfo.relayIO
    && v7
    && ![(VCAudioRelay *)self createAudioConvertersWithError:v11])
  {

    BOOL v8 = 0;
    self->_clientIOInfo.relayIO = 0;
  }
  _VCRemoteCodecInfo remoteCodecInfo = self->_remoteCodecInfo;
  pthread_mutex_unlock(&self->_clientIOInfo.lock);
  [(VCAudioRelay *)self unlock];
  [a3 didUpdateBasebandCodec:&remoteCodecInfo];
  if (a4 && !v8) {
    *a4 = (id)v11[0];
  }
  return v8;
}

- (BOOL)canSetPropertyWithError:(id *)a3
{
  BOOL isRelayRunning = self->_isRelayRunning;
  if (self->_isRelayRunning) {
    +[GKVoiceChatError getNSError:a3 code:32005 detailedCode:0 filePath:0 description:@"Cannot set VCAudioRelay property" reason:@"VCAudioRelay is running"];
  }
  return !isRelayRunning;
}

- (BOOL)startRelayIO:(tagVCAudioRelayIOInfo *)a3 otherRelayIO:(tagVCAudioRelayIOInfo *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v28 = 0;
  if (!a3 || !a3->relayIO)
  {
    v18 = (void *)MEMORY[0x1E4F28C58];
    v19 = @"Can't start: relay IO is nil";
LABEL_26:
    BOOL v14 = 0;
    uint64_t v28 = [v18 AVConferenceServiceError:32016 detailCode:0 description:v19];
    goto LABEL_23;
  }
  if (!a4)
  {
    v18 = (void *)MEMORY[0x1E4F28C58];
    v19 = @"Invalid IO";
    goto LABEL_26;
  }
  if ([(VCAudioRelayIO *)a3->relayIO isRunning])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v30 = v20;
        __int16 v31 = 2080;
        v32 = "-[VCAudioRelay startRelayIO:otherRelayIO:]";
        __int16 v33 = 1024;
        int v34 = 317;
        _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Relay IO is already started", buf, 0x1Cu);
      }
    }
    goto LABEL_22;
  }
  relayIO = a3->relayIO;
  if ([(VCAudioRelayIO *)a4->relayIO isRunning]) {
    BOOL v8 = a4->relayIO;
  }
  else {
    BOOL v8 = 0;
  }
  [(VCAudioRelay *)self ioBufferDurationWithFirstIO:relayIO secondIO:v8];
  double v10 = v9;
  if ([(VCAudioRelayIO *)a4->relayIO isRunning]
    && (p_IOBufferDuration = &self->_IOBufferDuration, vabdd_f64(self->_IOBufferDuration, v10) > 2.22044605e-16))
  {
    pthread_mutex_lock(&a4->lock);
    [(VCAudioRelayIO *)a4->relayIO destroyPacketThread];
    double *p_IOBufferDuration = v10;
    BOOL v12 = [(VCAudioRelayIO *)a4->relayIO createPacketThreadWithIOBufferDuration:a4->ioFriendlyName name:&v28 error:v10];
    pthread_mutex_unlock(&a4->lock);
    if (!v12)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioRelay startRelayIO:otherRelayIO:]();
        }
      }
      [(VCAudioRelay *)self internalStopRelayThread];
      [(VCAudioRelayIO *)a4->relayIO closeRecordings];
    }
  }
  else
  {
    self->_IOBufferDuration = v10;
    p_IOBufferDuration = &self->_IOBufferDuration;
  }
  pthread_mutex_lock(&a3->lock);
  BOOL v13 = [(VCAudioRelayIO *)a3->relayIO createPacketThreadWithIOBufferDuration:a3->ioFriendlyName name:&v28 error:*p_IOBufferDuration];
  pthread_mutex_unlock(&a3->lock);
  if (!v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E4F47A50];
      BOOL v14 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v30 = v22;
      __int16 v31 = 2080;
      v32 = "-[VCAudioRelay startRelayIO:otherRelayIO:]";
      __int16 v33 = 1024;
      int v34 = 346;
      __int16 v35 = 2112;
      uint64_t v36 = v28;
      _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to create packet thread: %@", buf, 0x26u);
    }
LABEL_37:
    BOOL v14 = 0;
    goto LABEL_23;
  }
  if ([(VCAudioRelayIO *)self->_clientIOInfo.relayIO isRunning]
    && [(VCAudioRelayIO *)self->_remoteIOInfo.relayIO isRunning])
  {
    goto LABEL_21;
  }
  if (![(VCAudioRelay *)self startRelayThreadWithError:&v28])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v30 = v24;
        __int16 v31 = 2080;
        v32 = "-[VCAudioRelay startRelayIO:otherRelayIO:]";
        __int16 v33 = 1024;
        int v34 = 351;
        __int16 v35 = 2112;
        uint64_t v36 = v28;
        _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to start the relay thread: %@", buf, 0x26u);
      }
    }
    [(VCAudioRelayIO *)a3->relayIO destroyPacketThread];
    goto LABEL_37;
  }
  [(VCAudioRelay *)self startPeriodicHealthPrint];
LABEL_21:
  [(VCAudioRelayIO *)a3->relayIO createRecordingsWithName:a3->audioRecordingFileName];
  [(VCAudioRelayIO *)a3->relayIO printStreamFormats];
LABEL_22:
  BOOL v14 = 1;
LABEL_23:
  v15 = a3->relayIO;
  global_queue = dispatch_get_global_queue(2, 0);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __42__VCAudioRelay_startRelayIO_otherRelayIO___block_invoke;
  v26[3] = &unk_1E6DB3E18;
  BOOL v27 = v14;
  v26[4] = v15;
  v26[5] = v28;
  dispatch_async(global_queue, v26);
  return v14;
}

uint64_t __42__VCAudioRelay_startRelayIO_otherRelayIO___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) startCompletionHandler];
  if (result)
  {
    v3 = *(uint64_t (**)(void))([*(id *)(a1 + 32) startCompletionHandler] + 16);
    return v3();
  }
  return result;
}

- (void)internalStopRelayThread
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  periodicHealthPrintDispatchSource = self->_periodicHealthPrintDispatchSource;
  if (periodicHealthPrintDispatchSource)
  {
    dispatch_source_cancel(periodicHealthPrintDispatchSource);
    v4 = self->_periodicHealthPrintDispatchSource;
    if (v4)
    {
      dispatch_release(v4);
      self->_periodicHealthPrintDispatchSource = 0;
    }
  }
  [(VCAudioRelay *)self stopRelayThread];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    double v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315650;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      double v10 = "-[VCAudioRelay internalStopRelayThread]";
      __int16 v11 = 1024;
      int v12 = 384;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCAudioRelay stopped", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

- (void)stopRelayIO:(tagVCAudioRelayIOInfo *)a3 otherRelayIO:(tagVCAudioRelayIOInfo *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3 && a3->relayIO)
  {
    if (a4)
    {
      if ([(VCAudioRelayIO *)a3->relayIO isRunning])
      {
        if (![(VCAudioRelayIO *)self->_clientIOInfo.relayIO isRunning]
          || ![(VCAudioRelayIO *)self->_remoteIOInfo.relayIO isRunning])
        {
          [(VCAudioRelay *)self internalStopRelayThread];
        }
        [(VCAudioRelayIO *)a3->relayIO closeRecordings];
        pthread_mutex_lock(&a3->lock);
        [(VCAudioRelayIO *)a3->relayIO destroyPacketThread];
        pthread_mutex_unlock(&a3->lock);
        if ([(VCAudioRelayIO *)a4->relayIO isRunning])
        {
          [(VCAudioRelayIO *)a4->relayIO preferredIODuration];
          double v8 = v7;
          if (vabdd_f64(self->_IOBufferDuration, v7) > 2.22044605e-16)
          {
            pthread_mutex_lock(&a4->lock);
            [(VCAudioRelayIO *)a4->relayIO destroyPacketThread];
            self->_IOBufferDuration = v8;
            BOOL v9 = [(VCAudioRelayIO *)a4->relayIO createPacketThreadWithIOBufferDuration:a4->ioFriendlyName name:0 error:v8];
            pthread_mutex_unlock(&a4->lock);
            if (!v9)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                  -[VCAudioRelay stopRelayIO:otherRelayIO:]();
                }
              }
              [(VCAudioRelay *)self internalStopRelayThread];
              [(VCAudioRelayIO *)a4->relayIO closeRecordings];
            }
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        __int16 v11 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 136315650;
          uint64_t v13 = v10;
          __int16 v14 = 2080;
          v15 = "-[VCAudioRelay stopRelayIO:otherRelayIO:]";
          __int16 v16 = 1024;
          int v17 = 391;
          _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Relay IO is not started", (uint8_t *)&v12, 0x1Cu);
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioRelay stopRelayIO:otherRelayIO:]();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCAudioRelay stopRelayIO:otherRelayIO:]();
    }
  }
}

- (BOOL)startClientIO
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315650;
      uint64_t v8 = v3;
      __int16 v9 = 2080;
      uint64_t v10 = "-[VCAudioRelay startClientIO]";
      __int16 v11 = 1024;
      int v12 = 424;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Starting client relay IO", (uint8_t *)&v7, 0x1Cu);
    }
  }
  [(VCAudioRelay *)self lock];
  BOOL v5 = [(VCAudioRelay *)self startRelayIO:&self->_clientIOInfo otherRelayIO:&self->_remoteIOInfo];
  if (!v5 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCAudioRelay startClientIO]();
    }
  }
  [(VCAudioRelay *)self unlock];
  return v5;
}

- (BOOL)startRemoteIO
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315650;
      uint64_t v8 = v3;
      __int16 v9 = 2080;
      uint64_t v10 = "-[VCAudioRelay startRemoteIO]";
      __int16 v11 = 1024;
      int v12 = 436;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Starting remote relay IO", (uint8_t *)&v7, 0x1Cu);
    }
  }
  [(VCAudioRelay *)self lock];
  BOOL v5 = [(VCAudioRelay *)self startRelayIO:&self->_remoteIOInfo otherRelayIO:&self->_clientIOInfo];
  if (!v5 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCAudioRelay startRemoteIO]();
    }
  }
  [(VCAudioRelay *)self unlock];
  return v5;
}

- (void)stopClientIO
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v4 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule > 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    double v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315650;
      uint64_t v10 = v5;
      __int16 v11 = 2080;
      int v12 = "-[VCAudioRelay stopClientIO]";
      __int16 v13 = 1024;
      int v14 = 447;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Stopping client relay IO", (uint8_t *)&v9, 0x1Cu);
    }
  }
  [(VCAudioRelay *)self lock];
  [(VCAudioRelay *)self stopRelayIO:&self->_clientIOInfo otherRelayIO:&self->_remoteIOInfo];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315650;
      uint64_t v10 = v7;
      __int16 v11 = 2080;
      int v12 = "-[VCAudioRelay stopClientIO]";
      __int16 v13 = 1024;
      int v14 = 450;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCAudioRelay client stopped", (uint8_t *)&v9, 0x1Cu);
    }
  }
  [(VCAudioRelay *)self unlock];
}

- (void)stopRemoteIO
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v4 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule > 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    double v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315650;
      uint64_t v10 = v5;
      __int16 v11 = 2080;
      int v12 = "-[VCAudioRelay stopRemoteIO]";
      __int16 v13 = 1024;
      int v14 = 455;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Stopping remote relay IO", (uint8_t *)&v9, 0x1Cu);
    }
  }
  [(VCAudioRelay *)self lock];
  [(VCAudioRelay *)self stopRelayIO:&self->_remoteIOInfo otherRelayIO:&self->_clientIOInfo];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315650;
      uint64_t v10 = v7;
      __int16 v11 = 2080;
      int v12 = "-[VCAudioRelay stopRemoteIO]";
      __int16 v13 = 1024;
      int v14 = 458;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCAudioRelay remote stopped", (uint8_t *)&v9, 0x1Cu);
    }
  }
  [(VCAudioRelay *)self unlock];
}

- (BOOL)setNetworkClockID:(unint64_t)a3 withError:(id *)a4
{
  [(VCAudioRelay *)self lock];
  if (![(VCAudioRelay *)self canSetPropertyWithError:a4])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioRelay setNetworkClockID:withError:]();
      }
    }
    goto LABEL_12;
  }
  [(VCAudioRelay *)self releasePTPClock];
  if (*MEMORY[0x1E4FAF2F0] != a3)
  {
    uint64_t v7 = (void *)TimeSyncClockCreateWithClockIdentifier();
    self->_ptpClock = v7;
    if (!v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioRelay setNetworkClockID:withError:]();
        }
      }
      +[GKVoiceChatError getNSError:a4 code:32016 detailedCode:0 filePath:0 description:@"Failed to create network clock" reason:@"Create network clock returned NULL value"];
LABEL_12:
      BOOL v8 = 0;
      goto LABEL_13;
    }
  }
  BOOL v8 = 1;
LABEL_13:
  [(VCAudioRelay *)self unlock];
  return v8;
}

- (BOOL)startRelayThreadWithError:(id *)a3
{
  keys[2] = *(void **)MEMORY[0x1E4F143B8];
  p_wakeUpCondition = &self->_wakeUpCondition;
  int v6 = pthread_cond_init(&self->_wakeUpCondition, 0);
  if (v6)
  {
    +[GKVoiceChatError getNSError:a3 code:32005 detailedCode:v6 filePath:0 description:@"createRelayThreadWithError failed" reason:@"pthread_cond_init failed"];
    return 0;
  }
  int v7 = pthread_mutex_init(&self->_wakeUpMutex, 0);
  if (v7)
  {
    +[GKVoiceChatError getNSError:a3 code:32005 detailedCode:v7 filePath:0 description:@"createRelayThreadWithError failed" reason:@"pthread_mutex_init failed"];
    pthread_cond_destroy(p_wakeUpCondition);
    return 0;
  }
  self->_BOOL isRelayRunning = 1;
  uint64_t v10 = (void *)*MEMORY[0x1E4F21EB0];
  keys[0] = *(void **)MEMORY[0x1E4F21EA8];
  keys[1] = v10;
  __int16 v11 = (void *)*MEMORY[0x1E4F1CFC8];
  values[0] = @"com.apple.avconference.audiorelay";
  values[1] = v11;
  CFDictionaryRef v12 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)keys, (const void **)values, 2, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  int v13 = FigThreadCreate();
  if (v12) {
    CFRelease(v12);
  }
  BOOL v8 = v13 == 0;
  if (v13)
  {
    +[GKVoiceChatError getNSError:a3 code:32005 detailedCode:v13 filePath:0 description:@"createRelayThreadWithError failed" reason:@"pthread_create failed"];
    pthread_cond_destroy(p_wakeUpCondition);
    pthread_mutex_destroy(&self->_wakeUpMutex);
    self->_BOOL isRelayRunning = 0;
  }
  return v8;
}

- (void)stopRelayThread
{
  if (self->_isRelayRunning)
  {
    self->_BOOL isRelayRunning = 0;
    p_wakeUpMutex = &self->_wakeUpMutex;
    pthread_mutex_lock(&self->_wakeUpMutex);
    pthread_cond_signal(&self->_wakeUpCondition);
    pthread_mutex_unlock(p_wakeUpMutex);
    if (self->_relayThread)
    {
      FigThreadJoin();
      self->_relayThread = 0;
    }
    pthread_mutex_destroy(p_wakeUpMutex);
    pthread_cond_destroy(&self->_wakeUpCondition);
  }
}

- (BOOL)createAudioConvertersWithError:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(VCAudioRelayIO *)self->_remoteIOInfo.relayIO clientFormat];
  uint64_t v6 = *(void *)&v5->format.mBitsPerChannel;
  long long v7 = *(_OWORD *)&v5->format.mBytesPerPacket;
  long long v23 = *(_OWORD *)&v5->format.mSampleRate;
  long long v24 = v7;
  uint64_t v25 = v6;
  BOOL v8 = [(VCAudioRelayIO *)self->_clientIOInfo.relayIO clientFormat];
  uint64_t v9 = *(void *)&v8->format.mBitsPerChannel;
  long long v10 = *(_OWORD *)&v8->format.mBytesPerPacket;
  long long v20 = *(_OWORD *)&v8->format.mSampleRate;
  long long v21 = v10;
  uint64_t v22 = v9;
  v19 = 0;
  self->_remoteToClientConverter = [(VCAudioRelay *)self newAudioConverterWithInputFormat:&v23 outputFormat:&v20 withError:&v19];
  __int16 v11 = v19;
  if (v19)
  {
    if (!a3) {
      return 0;
    }
    goto LABEL_7;
  }
  CFDictionaryRef v12 = [(VCAudioRelayIO *)self->_clientIOInfo.relayIO clientFormat];
  uint64_t v13 = *(void *)&v12->format.mBitsPerChannel;
  long long v14 = *(_OWORD *)&v12->format.mBytesPerPacket;
  long long v23 = *(_OWORD *)&v12->format.mSampleRate;
  long long v24 = v14;
  uint64_t v25 = v13;
  uint64_t v15 = [(VCAudioRelayIO *)self->_remoteIOInfo.relayIO clientFormat];
  uint64_t v16 = *(void *)&v15->format.mBitsPerChannel;
  long long v17 = *(_OWORD *)&v15->format.mBytesPerPacket;
  long long v20 = *(_OWORD *)&v15->format.mSampleRate;
  long long v21 = v17;
  uint64_t v22 = v16;
  self->_clientToRemoteConverter = [(VCAudioRelay *)self newAudioConverterWithInputFormat:&v23 outputFormat:&v20 withError:&v19];
  if (v19)
  {
    [(VCAudioRelay *)self destroyAudioConverters];
    if (!a3) {
      return 0;
    }
    __int16 v11 = v19;
LABEL_7:
    BOOL result = 0;
    *a3 = v11;
    return result;
  }
  return 1;
}

- (OpaqueAudioConverter)newAudioConverterWithInputFormat:(AudioStreamBasicDescription *)a3 outputFormat:(AudioStreamBasicDescription *)a4 withError:(id *)a5
{
  outAudioConverter[1] = *(AudioConverterRef *)MEMORY[0x1E4F143B8];
  outAudioConverter[0] = 0;
  if (!memcmp(a4, a3, 0x28uLL)) {
    return 0;
  }
  OSStatus v8 = AudioConverterNew(a3, a4, outAudioConverter);
  if (v8)
  {
    OSStatus v9 = v8;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioRelay newAudioConverterWithInputFormat:outputFormat:withError:]();
      }
    }
    +[GKVoiceChatError getNSError:a5 code:32005 detailedCode:v9 filePath:0 description:@"newAudioConverterFromFormat failed" reason:@"AudioConverter new failed"];
    return 0;
  }
  int inPropertyData = 2;
  if (AudioConverterSetProperty(outAudioConverter[0], 0x70726D6Du, 4u, &inPropertyData))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioRelay newAudioConverterWithInputFormat:outputFormat:withError:]();
      }
    }
  }
  return outAudioConverter[0];
}

- (void)destroyAudioConverters
{
  clientToRemoteConverter = self->_clientToRemoteConverter;
  if (clientToRemoteConverter)
  {
    AudioConverterDispose(clientToRemoteConverter);
    self->_clientToRemoteConverter = 0;
  }
  remoteToClientConverter = self->_remoteToClientConverter;
  if (remoteToClientConverter)
  {
    AudioConverterDispose(remoteToClientConverter);
    self->_remoteToClientConverter = 0;
  }
}

- (void)printStreamFormats
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v4 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315650;
      uint64_t v10 = v5;
      __int16 v11 = 2080;
      CFDictionaryRef v12 = "-[VCAudioRelay printStreamFormats]";
      __int16 v13 = 1024;
      int v14 = 648;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Remote relay IO:", (uint8_t *)&v9, 0x1Cu);
    }
  }
  [(VCAudioRelayIO *)self->_remoteIOInfo.relayIO printStreamFormats];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    OSStatus v8 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315650;
      uint64_t v10 = v7;
      __int16 v11 = 2080;
      CFDictionaryRef v12 = "-[VCAudioRelay printStreamFormats]";
      __int16 v13 = 1024;
      int v14 = 650;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Client relay IO:", (uint8_t *)&v9, 0x1Cu);
    }
  }
  [(VCAudioRelayIO *)self->_clientIOInfo.relayIO printStreamFormats];
}

- (float)rmsPowerOfBuffer:(float *)a3 numSamples:(unsigned int)a4
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  float __C = NAN;
  vDSP_rmsqv(a3, 1, &__C, a4);
  return fmax(log10f(__C) * 20.0, -120.0);
}

- (void)forwardSamplesFromIO:(id)a3 toIO:(id)a4 withConverter:(OpaqueAudioConverter *)a5 withHostTime:(double)a6
{
  if (a3)
  {
    if ([a3 isRunning])
    {
      unsigned int v10 = *(_DWORD *)([a3 relayFormat] + 40);
      VCAudioBufferList_SetSampleCount([a3 speakerBuffer], v10);
      VCAudioBufferList_SetTime([a3 speakerBuffer], objc_msgSend(a3, "speakerTimestamp"), a6);
      objc_msgSend(a3, "pullAudioSamples:", objc_msgSend(a3, "speakerBuffer"));
      objc_msgSend(a3, "setSpeakerTimestamp:", objc_msgSend(a3, "speakerTimestamp") + v10);
      if (*(_DWORD *)([a3 relayFormat] + 24) == 4)
      {
        *(float *)&double v11 = VCAudioBufferList_GetAveragePower([a3 speakerBuffer]);
        [a3 setSpeakerPowerRMS:v11];
      }
    }
  }
  if (a4 && [a4 isRunning])
  {
    unsigned int v12 = *(_DWORD *)([a4 relayFormat] + 40);
    uint64_t v13 = [a4 micBuffer];
    if (a3 && [a3 isRunning])
    {
      uint64_t v14 = [a3 speakerBuffer];
      if (a5) {
        VCAudioBufferList_Convert(v14, [a4 micBuffer], a5);
      }
      else {
        uint64_t v13 = v14;
      }
    }
    else
    {
      VCAudioBufferList_ZeroMemory(v13);
      VCAudioBufferList_SetPriority(v13, 1);
    }
    VCAudioBufferList_SetTime(v13, [a4 micTimestamp], a6);
    VCAudioBufferList_SetSampleCount(v13, v12);
    *(float *)&double v15 = VCAudioBufferList_GetAveragePower(v13);
    [a4 setMicPowerRMS:v15];
    [a4 pushAudioSamples:v13];
    uint64_t v16 = [a4 micTimestamp] + v12;
    [a4 setMicTimestamp:v16];
  }
}

- (void)sleepForTime:(timespec *)a3
{
  p_wakeUpMutex = &self->_wakeUpMutex;
  pthread_mutex_lock(&self->_wakeUpMutex);
  pthread_cond_timedwait_relative_np(&self->_wakeUpCondition, p_wakeUpMutex, a3);

  pthread_mutex_unlock(p_wakeUpMutex);
}

- (void)updateRealTimeStats
{
  ++self->_blocksRelayedCount;
  [(VCAudioRelayIO *)[(VCAudioRelay *)self clientIO] speakerPowerRMS];
  float v4 = self->_clientUplinkPowerMovingAverage * 0.8 + v3 * 0.2;
  self->_clientUplinkPowerMovingAverage = v4;
  [(VCAudioRelayIO *)[(VCAudioRelay *)self clientIO] micPowerRMS];
  float v6 = self->_clientDownlinkPowerMovingAverage * 0.8 + v5 * 0.2;
  self->_clientDownlinkPowerMovingAverage = v6;
}

- (void)startPeriodicHealthPrint
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Periodic health print already initialized", v2, v3, v4, v5, v6);
}

void __40__VCAudioRelay_startPeriodicHealthPrint__block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [*(id *)(a1 + 32) strong];
  if (v1)
  {
    uint64_t v2 = (void *)v1;
    if (*(void *)(v1 + 440))
    {
      mach_absolute_time();
      uint64_t ClockTimeAndGrandmasterIdentityLocalPortForHostTime = TimeSyncClockGetClockTimeAndGrandmasterIdentityLocalPortForHostTime();
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v4 = VRTraceErrorLogLevelToCSTR();
        uint64_t v5 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v6 = [v2 blocksRelayedCount];
          [v2 clientUplinkPowerMovingAverage];
          double v8 = v7;
          [v2 clientDownlinkPowerMovingAverage];
          *(_DWORD *)buf = 136317186;
          uint64_t v20 = v4;
          __int16 v21 = 2080;
          uint64_t v22 = "-[VCAudioRelay startPeriodicHealthPrint]_block_invoke";
          __int16 v23 = 1024;
          int v24 = 761;
          __int16 v25 = 1024;
          int v26 = v6;
          __int16 v27 = 2048;
          double v28 = v8;
          __int16 v29 = 2048;
          double v30 = v9;
          __int16 v31 = 2048;
          uint64_t v32 = ClockTimeAndGrandmasterIdentityLocalPortForHostTime;
          __int16 v33 = 2048;
          unint64_t v34 = 0xAAAAAAAAAAAAAAAALL;
          __int16 v35 = 1024;
          int v36 = 43690;
          unsigned int v10 = " [%s] %s:%d @=@ Health: VCAudioRelay blocksRelayedCount=%d, clientUplinkPowerMovingAverage=%f, clientDow"
                "nlinkPowerMovingAverage=%f, currentPTPTime=%llu, ptpGMIdentity=%llu, ptpLocalPort=%u";
          double v11 = v5;
          uint32_t v12 = 80;
LABEL_9:
          _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v15 = [v2 blocksRelayedCount];
        [v2 clientUplinkPowerMovingAverage];
        double v17 = v16;
        [v2 clientDownlinkPowerMovingAverage];
        *(_DWORD *)buf = 136316418;
        uint64_t v20 = v13;
        __int16 v21 = 2080;
        uint64_t v22 = "-[VCAudioRelay startPeriodicHealthPrint]_block_invoke";
        __int16 v23 = 1024;
        int v24 = 767;
        __int16 v25 = 1024;
        int v26 = v15;
        __int16 v27 = 2048;
        double v28 = v17;
        __int16 v29 = 2048;
        double v30 = v18;
        unsigned int v10 = " [%s] %s:%d @=@ Health: VCAudioRelay blocksRelayedCount=%d, clientUplinkPowerMovingAverage=%f, clientDownl"
              "inkPowerMovingAverage=%f";
        double v11 = v14;
        uint32_t v12 = 54;
        goto LABEL_9;
      }
    }
  }
}

- (void)relayProcessSamples
{
  p_lock = &self->_clientIOInfo.lock;
  int v4 = pthread_mutex_trylock(&self->_clientIOInfo.lock);
  int v5 = pthread_mutex_trylock(&self->_remoteIOInfo.lock);
  if (v5)
  {
    int v6 = 0;
    if (v4) {
      goto LABEL_3;
    }
LABEL_6:
    relayIO = self->_clientIOInfo.relayIO;
    double v9 = micro();
    -[VCAudioRelay forwardSamplesFromIO:toIO:withConverter:withHostTime:](self, "forwardSamplesFromIO:toIO:withConverter:withHostTime:", v6, relayIO, self->_remoteToClientConverter);
    [(VCAudioRelay *)self forwardSamplesFromIO:relayIO toIO:v6 withConverter:self->_clientToRemoteConverter withHostTime:v9];
    [(VCAudioRelay *)self updateRealTimeStats];
    pthread_mutex_unlock(p_lock);
    if (v5) {
      return;
    }
    goto LABEL_7;
  }
  int v6 = self->_remoteIOInfo.relayIO;
  if (!v4) {
    goto LABEL_6;
  }
LABEL_3:
  double v7 = micro();
  -[VCAudioRelay forwardSamplesFromIO:toIO:withConverter:withHostTime:](self, "forwardSamplesFromIO:toIO:withConverter:withHostTime:", v6, 0, self->_remoteToClientConverter);
  [(VCAudioRelay *)self forwardSamplesFromIO:0 toIO:v6 withConverter:self->_clientToRemoteConverter withHostTime:v7];
  [(VCAudioRelay *)self updateRealTimeStats];
  if (v5) {
    return;
  }
LABEL_7:

  pthread_mutex_unlock(&self->_remoteIOInfo.lock);
}

- (void)relayCallback
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d setRealTimeConstraints() failed with error %d", v2, v3, v4, v5);
}

- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [(VCAudioRelay *)self lock];
  [(VCAudioRelay *)self updateRemoteCodecInfo:a3];
  _VCRemoteCodecInfo remoteCodecInfo = self->_remoteCodecInfo;
  pthread_mutex_lock(&self->_clientIOInfo.lock);
  int v5 = self->_clientIOInfo.relayIO;
  pthread_mutex_unlock(&self->_clientIOInfo.lock);
  [(VCAudioRelay *)self unlock];
  [(VCAudioRelayIO *)v5 didUpdateBasebandCodec:&remoteCodecInfo];
}

- (BOOL)isRelayRunning
{
  return self->_isRelayRunning;
}

- (double)IOBufferDuration
{
  return self->_IOBufferDuration;
}

- (OpaqueAudioConverter)remoteToClientConverter
{
  return self->_remoteToClientConverter;
}

- (OpaqueAudioConverter)clientToRemoteConverter
{
  return self->_clientToRemoteConverter;
}

- (OS_dispatch_source)periodicHealthPrintDispatchSource
{
  return self->_periodicHealthPrintDispatchSource;
}

- (unsigned)blocksRelayedCount
{
  return self->_blocksRelayedCount;
}

- (float)clientDownlinkPowerMovingAverage
{
  return self->_clientDownlinkPowerMovingAverage;
}

- (float)clientUplinkPowerMovingAverage
{
  return self->_clientUplinkPowerMovingAverage;
}

- (void)setRemoteIO:(id)a3
{
}

- (void)setClientIO:(id)a3
{
}

- (void)setIOBufferDuration:withError:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Trying to set the IO duration while relay is running", v2, v3, v4, v5, v6);
}

- (void)startRelayIO:otherRelayIO:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to restart the other IO", v2, v3, v4, v5, v6);
}

- (void)stopRelayIO:otherRelayIO:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Can't stop: relay IO is nil", v2, v3, v4, v5, v6);
}

- (void)stopRelayIO:otherRelayIO:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Can't stop: invalid IO", v2, v3, v4, v5, v6);
}

- (void)stopRelayIO:otherRelayIO:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to restart the other IO", v2, v3, v4, v5, v6);
}

- (void)startClientIO
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to start client IO", v2, v3, v4, v5, v6);
}

- (void)startRemoteIO
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to start remote IO", v2, v3, v4, v5, v6);
}

- (void)setNetworkClockID:withError:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create PTP clock", v2, v3, v4, v5, v6);
}

- (void)setNetworkClockID:withError:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Trying to set network clock while relay is running", v2, v3, v4, v5, v6);
}

- (void)newAudioConverterWithInputFormat:outputFormat:withError:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AudioConverterSetProperty(kAudioConverterPrimeMethod) failed with error %d", v2, v3, v4, v5);
}

- (void)newAudioConverterWithInputFormat:outputFormat:withError:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d newAudioConverterFromFormat failed with error %d", v2, v3, v4, v5);
}

@end