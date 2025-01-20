@interface AXLTAudioOutTranscriber
- (AVAudioFormat)tapFormat;
- (AXLTAudioOutTranscriber)initWithPID:(int)a3 appID:(id)a4 appName:(id)a5 delegate:(id)a6;
- (AXLTTranscriber)transcriber;
- (AXLTTranscriberDelegateProtocol)delegate;
- (BOOL)_isSilenceOnlyInBuffer:(AudioQueueBuffer *)a3 packetCount:(unsigned int)a4;
- (BOOL)createAudioBuffersWithBufferByteSize:(unsigned int)a3 error:(id *)a4;
- (NSDate)bufferLogTime;
- (NSDate)sessionStartTime;
- (NSDate)textLogTime;
- (NSString)appID;
- (NSString)appName;
- (OpaqueAudioQueue)audioQueue;
- (int)pid;
- (int64_t)_findSilencePacketOffset:(AudioQueueBuffer *)a3 packetCount:(unsigned int)a4 silentSamplesMin:(int64_t)a5 zeroOffsetOnly:(BOOL)a6;
- (int64_t)silentBuffersCount;
- (int64_t)silentSamplesTailCount;
- (void)_appendBuffer:(AudioQueueBuffer *)a3 offsetInPackets:(unsigned int)a4 packetCount:(unsigned int)a5;
- (void)_calcHistogramForBuffer:(AudioQueueBuffer *)a3 packetCount:(unsigned int)a4 isSilence:(BOOL)a5;
- (void)_pauseSpeechRecognition;
- (void)cleanup;
- (void)handleAudioBuffer:(AudioQueueBuffer *)a3 audioQueue:(OpaqueAudioQueue *)a4 timestamp:(const AudioTimeStamp *)a5 packetCount:(unsigned int)a6 packetDesc:(const AudioStreamPacketDescription *)a7;
- (void)setAppID:(id)a3;
- (void)setAppName:(id)a3;
- (void)setAudioQueue:(OpaqueAudioQueue *)a3;
- (void)setBufferLogTime:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPid:(int)a3;
- (void)setSessionStartTime:(id)a3;
- (void)setSilentBuffersCount:(int64_t)a3;
- (void)setSilentSamplesTailCount:(int64_t)a3;
- (void)setTapFormat:(id)a3;
- (void)setTextLogTime:(id)a3;
- (void)setTranscriber:(id)a3;
- (void)setupTranscriberIfNeeded;
@end

@implementation AXLTAudioOutTranscriber

- (AXLTAudioOutTranscriber)initWithPID:(int)a3 appID:(id)a4 appName:(id)a5 delegate:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)AXLTAudioOutTranscriber;
  v14 = [(AXLTAudioOutTranscriber *)&v23 init];
  v15 = v14;
  if (v14)
  {
    v14->_pid = a3;
    objc_storeStrong((id *)&v14->_appID, a4);
    objc_storeStrong((id *)&v15->_appName, a5);
    uint64_t v16 = [objc_alloc(MEMORY[0x263EF9388]) initWithCommonFormat:3 sampleRate:1 channels:0 interleaved:16000.0];
    tapFormat = v15->_tapFormat;
    v15->_tapFormat = (AVAudioFormat *)v16;

    objc_storeWeak((id *)&v15->_delegate, v13);
    uint64_t v18 = +[AXLTTranscriber sharedInstance];
    transcriber = v15->_transcriber;
    v15->_transcriber = (AXLTTranscriber *)v18;

    uint64_t v20 = [MEMORY[0x263EFF910] date];
    sessionStartTime = v15->_sessionStartTime;
    v15->_sessionStartTime = (NSDate *)v20;
  }
  return v15;
}

- (void)setupTranscriberIfNeeded
{
  v3 = [(AXLTAudioOutTranscriber *)self transcriber];
  char v4 = objc_msgSend(v3, "isTranscribingForPID:", -[AXLTAudioOutTranscriber pid](self, "pid"));

  if ((v4 & 1) == 0)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__AXLTAudioOutTranscriber_setupTranscriberIfNeeded__block_invoke;
    block[3] = &unk_264E398B0;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __51__AXLTAudioOutTranscriber_setupTranscriberIfNeeded__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) transcriber];
  uint64_t v3 = [*(id *)(a1 + 32) pid];
  char v4 = [*(id *)(a1 + 32) appName];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__AXLTAudioOutTranscriber_setupTranscriberIfNeeded__block_invoke_2;
  v7[3] = &unk_264E39888;
  uint64_t v8 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__AXLTAudioOutTranscriber_setupTranscriberIfNeeded__block_invoke_277;
  v6[3] = &unk_264E398B0;
  v6[4] = v8;
  [v2 startTranscriptionForPID:v3 appName:v4 callback:v7 completionCallback:v6];

  v5 = [*(id *)(a1 + 32) transcriber];
  objc_msgSend(v5, "resumeTranscriptionForPID:", objc_msgSend(*(id *)(a1 + 32), "pid"));
}

void __51__AXLTAudioOutTranscriber_setupTranscriberIfNeeded__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v6 = [v5 formattedString];
  uint64_t v7 = [*(id *)(a1 + 32) textLogTime];
  if (!v7) {
    goto LABEL_3;
  }
  uint64_t v8 = (void *)v7;
  v9 = [MEMORY[0x263EFF910] now];
  v10 = [*(id *)(a1 + 32) textLogTime];
  [v9 timeIntervalSinceDate:v10];
  double v12 = v11;

  if (v12 > 5.0)
  {
LABEL_3:
    id v13 = AXLogLiveTranscription();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
      v15 = [*(id *)(a1 + 32) appName];
      *(_DWORD *)buf = 138412546;
      v29 = v14;
      __int16 v30 = 2112;
      v31 = v15;
      _os_log_impl(&dword_23C242000, v13, OS_LOG_TYPE_DEFAULT, "Transcribed text: %@ for app: %@", buf, 0x16u);
    }
    uint64_t v16 = [MEMORY[0x263EFF910] now];
    [*(id *)(a1 + 32) setTextLogTime:v16];
  }
  v17 = +[AXLTAudioTextDumper sharedInstance];
  uint64_t v18 = [*(id *)(a1 + 32) appName];
  v19 = [*(id *)(a1 + 32) sessionStartTime];
  [v17 saveTranscribedText:v6 appName:v18 sessionStartTime:v19];

  uint64_t v20 = [AXLTTranscribedData alloc];
  v21 = [MEMORY[0x263EFF910] date];
  uint64_t v22 = [*(id *)(a1 + 32) pid];
  objc_super v23 = [*(id *)(a1 + 32) appID];
  v24 = [*(id *)(a1 + 32) appName];
  LOBYTE(v27) = 0;
  v25 = [(AXLTTranscribedData *)v20 initWithTranscription:v5 requestType:1 timestamp:v21 pid:v22 appID:v23 appName:v24 downloadProgress:a3 silence:v27];

  v26 = [*(id *)(a1 + 32) delegate];
  [v26 transcriberOutputData:v25];
}

void __51__AXLTAudioOutTranscriber_setupTranscriberIfNeeded__block_invoke_277(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = AXLogLiveTranscription();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) appName];
    *(_DWORD *)buf = 138412290;
    id v13 = v3;
    _os_log_impl(&dword_23C242000, v2, OS_LOG_TYPE_DEFAULT, "Recognized text for app: %@", buf, 0xCu);
  }
  char v4 = [AXLTTranscribedData alloc];
  id v5 = [MEMORY[0x263EFF910] date];
  uint64_t v6 = [*(id *)(a1 + 32) pid];
  uint64_t v7 = [*(id *)(a1 + 32) appID];
  uint64_t v8 = [*(id *)(a1 + 32) appName];
  LOBYTE(v11) = 0;
  v9 = [(AXLTTranscribedData *)v4 initWithTranscription:0 requestType:1 timestamp:v5 pid:v6 appID:v7 appName:v8 downloadProgress:-2 silence:v11];

  v10 = [*(id *)(a1 + 32) delegate];
  [v10 transcriberOutputData:v9];
}

- (void)cleanup
{
}

- (BOOL)createAudioBuffersWithBufferByteSize:(unsigned int)a3 error:(id *)a4
{
  v22[1] = *MEMORY[0x263EF8340];
  AudioQueueBufferRef outBuffer = 0;
  uint64_t v6 = AudioQueueAllocateBuffer([(AXLTAudioOutTranscriber *)self audioQueue], a3, &outBuffer);
  if (v6)
  {
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to allocate buffer: %d", v6);
    uint64_t v8 = AXLogLiveTranscription();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AXLTAudioOutTranscriber createAudioBuffersWithBufferByteSize:error:]((uint64_t)v7, v8);
    }

    v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = *MEMORY[0x263F07F80];
    v22[0] = v7;
    v10 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
    uint64_t v11 = v9;
    uint64_t v12 = 8;
LABEL_9:
    *a4 = [v11 errorWithDomain:@"com.apple.accessibility.LiveTranscription" code:v12 userInfo:v10];

    return 0;
  }
  id v13 = [(AXLTAudioOutTranscriber *)self audioQueue];
  uint64_t v14 = AudioQueueEnqueueBuffer(v13, outBuffer, 0, 0);
  if (v14)
  {
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to enqueue buffer: %d", v14);
    v15 = AXLogLiveTranscription();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[AXLTAudioOutTranscriber createAudioBuffersWithBufferByteSize:error:]((uint64_t)v7, v15);
    }

    uint64_t v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = *MEMORY[0x263F07F80];
    uint64_t v20 = v7;
    v10 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    uint64_t v11 = v16;
    uint64_t v12 = 9;
    goto LABEL_9;
  }
  self->_mBuffers[0] = outBuffer;
  return 1;
}

- (void)handleAudioBuffer:(AudioQueueBuffer *)a3 audioQueue:(OpaqueAudioQueue *)a4 timestamp:(const AudioTimeStamp *)a5 packetCount:(unsigned int)a6 packetDesc:(const AudioStreamPacketDescription *)a7
{
  uint64_t v7 = *(void *)&a6;
  v10 = AXLogLiveTranscription();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[AXLTAudioOutTranscriber handleAudioBuffer:audioQueue:timestamp:packetCount:packetDesc:]((int *)a3, v7, v10);
  }

  if ([(AXLTAudioOutTranscriber *)self _isSilenceOnlyInBuffer:a3 packetCount:v7])
  {
    if (self->_silentBuffersCount <= 9) {
      [(AXLTAudioOutTranscriber *)self _appendBuffer:a3 offsetInPackets:0 packetCount:v7];
    }
    int v11 = [(AXLTAudioOutTranscriber *)self pid];
    int64_t silentBuffersCount = self->_silentBuffersCount;
    if (v11 != -2 && silentBuffersCount >= 11)
    {
      [(AXLTAudioOutTranscriber *)self _pauseSpeechRecognition];
      int64_t silentBuffersCount = self->_silentBuffersCount;
    }
    self->_int64_t silentBuffersCount = silentBuffersCount + 1;
  }
  else
  {
    [(AXLTAudioOutTranscriber *)self _appendBuffer:a3 offsetInPackets:0 packetCount:v7];
    self->_int64_t silentBuffersCount = 0;
  }
  AudioQueueEnqueueBuffer([(AXLTAudioOutTranscriber *)self audioQueue], a3, 0, 0);
}

- (void)_pauseSpeechRecognition
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = AXLogLiveTranscription();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    char v4 = [NSNumber numberWithInteger:self->_silentBuffersCount];
    *(_DWORD *)buf = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_23C242000, v3, OS_LOG_TYPE_DEFAULT, "Pause recognition for silence %@", buf, 0xCu);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__AXLTAudioOutTranscriber__pauseSpeechRecognition__block_invoke;
  block[3] = &unk_264E398B0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __50__AXLTAudioOutTranscriber__pauseSpeechRecognition__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) transcriber];
  objc_msgSend(v2, "stopTranscriptionForPID:", objc_msgSend(*(id *)(a1 + 32), "pid"));
}

- (int64_t)_findSilencePacketOffset:(AudioQueueBuffer *)a3 packetCount:(unsigned int)a4 silentSamplesMin:(int64_t)a5 zeroOffsetOnly:(BOOL)a6
{
  if (a4)
  {
    unint64_t v6 = 0;
    uint64_t v7 = 0;
    int64_t result = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      v9 = (__int16 *)((char *)a3->mAudioData + 2 * v6);
      int v10 = *v9;
      if (v10 < 0) {
        int v10 = -v10;
      }
      int v11 = v9[1];
      if (v11 < 0) {
        int v11 = -v11;
      }
      if ((__int16)v10 <= 10 && (__int16)v11 <= 10)
      {
        if (!v7) {
          int64_t result = v6;
        }
        if (++v7 >= a5) {
          return result;
        }
      }
      else
      {
        int64_t result = 0x7FFFFFFFFFFFFFFFLL;
        if (a6) {
          return result;
        }
        uint64_t v7 = 0;
      }
      v6 += 2;
      if (v6 >= a4) {
        return result;
      }
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_isSilenceOnlyInBuffer:(AudioQueueBuffer *)a3 packetCount:(unsigned int)a4
{
  if (!a4) {
    return 1;
  }
  mAudioData = (__int16 *)a3->mAudioData;
  int v5 = *mAudioData;
  if (v5 < 0) {
    int v5 = -v5;
  }
  unsigned __int16 v6 = v5;
  if ((__int16)v5 <= 10)
  {
    unint64_t v7 = 0;
    uint64_t v8 = mAudioData + 1;
    while (a4 - 1 != v7)
    {
      int v9 = v8[v7];
      if (v9 < 0) {
        int v9 = -v9;
      }
      unsigned __int16 v6 = v9;
      ++v7;
      if ((__int16)v9 >= 11)
      {
        BOOL v10 = v7 >= a4;
        goto LABEL_13;
      }
    }
    return 1;
  }
  BOOL v10 = 0;
LABEL_13:
  int v11 = AXLogLiveTranscription();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[AXLTAudioOutTranscriber _isSilenceOnlyInBuffer:packetCount:](v6, v11);
  }

  return v10;
}

- (void)_calcHistogramForBuffer:(AudioQueueBuffer *)a3 packetCount:(unsigned int)a4 isSilence:(BOOL)a5
{
  BOOL v5 = a5;
  int v9 = [(AXLTAudioOutTranscriber *)self transcriber];
  int v10 = objc_msgSend(v9, "isTranscribingForPID:", -[AXLTAudioOutTranscriber pid](self, "pid"));

  if (v10)
  {
    if (v5)
    {
      int v11 = objc_opt_new();
      uint64_t v12 = 16;
      do
      {
        [v11 addObject:&unk_26EFE6DA0];
        --v12;
      }
      while (v12);
    }
    else
    {
      int v11 = +[AXLTHistogramCalculator histogramForAudioQueueBuffer:a3 packetCount:a4 channelsCount:1 format:3];
    }
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __73__AXLTAudioOutTranscriber__calcHistogramForBuffer_packetCount_isSilence___block_invoke;
    v14[3] = &unk_264E398D8;
    v14[4] = self;
    id v15 = v11;
    id v13 = v11;
    dispatch_async(MEMORY[0x263EF83A0], v14);
  }
}

void __73__AXLTAudioOutTranscriber__calcHistogramForBuffer_packetCount_isSilence___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = AXLogLiveTranscription();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) appName];
    int v6 = 138412290;
    unint64_t v7 = v3;
    _os_log_impl(&dword_23C242000, v2, OS_LOG_TYPE_INFO, "Histogram for app: %@", (uint8_t *)&v6, 0xCu);
  }
  char v4 = -[AXLTAudioInfo initWithAudioInfo:requestType:pid:]([AXLTAudioInfo alloc], "initWithAudioInfo:requestType:pid:", *(void *)(a1 + 40), 1, [*(id *)(a1 + 32) pid]);
  BOOL v5 = [*(id *)(a1 + 32) delegate];
  [v5 audioInfoData:v4];
}

- (void)_appendBuffer:(AudioQueueBuffer *)a3 offsetInPackets:(unsigned int)a4 packetCount:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v41 = *MEMORY[0x263EF8340];
  [(AXLTAudioOutTranscriber *)self setupTranscriberIfNeeded];
  int v9 = [(AXLTAudioOutTranscriber *)self tapFormat];
  uint64_t v10 = [v9 streamDescription];
  uint64_t v11 = *(void *)(v10 + 32);
  long long v12 = *(_OWORD *)(v10 + 16);
  long long v35 = *(_OWORD *)v10;
  long long v36 = v12;
  uint64_t v37 = v11;

  id v13 = (void *)[objc_alloc(MEMORY[0x263EF9388]) initWithStreamDescription:&v35];
  id v14 = objc_alloc(MEMORY[0x263EF93B0]);
  id v15 = objc_msgSend(v14, "initWithPCMFormat:frameCapacity:", v13, v5, v35, v36, v37);
  [v15 setFrameLength:v5];
  uint64_t v16 = *(void **)([v15 mutableAudioBufferList] + 16);
  unsigned int v17 = 2 * a4;
  size_t v18 = (2 * v5);
  uint64_t v19 = AXLogLiveTranscription();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    UInt32 mAudioDataByteSize = a3->mAudioDataByteSize;
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v39 = v17;
    *(_WORD *)&v39[4] = 1024;
    *(_DWORD *)&v39[6] = v18;
    LOWORD(v40) = 1024;
    *(_DWORD *)((char *)&v40 + 2) = mAudioDataByteSize;
    _os_log_debug_impl(&dword_23C242000, v19, OS_LOG_TYPE_DEBUG, "Copy offsetInBytes = %d, dataByteSize = %d, full data size = %d", buf, 0x14u);
  }

  memcpy(v16, (char *)a3->mAudioData + v17, v18);
  uint64_t v20 = [(AXLTAudioOutTranscriber *)self bufferLogTime];
  if (!v20) {
    goto LABEL_5;
  }
  uint64_t v21 = (void *)v20;
  uint64_t v22 = [MEMORY[0x263EFF910] now];
  objc_super v23 = [(AXLTAudioOutTranscriber *)self bufferLogTime];
  [v22 timeIntervalSinceDate:v23];
  double v25 = v24;

  if (v25 > 5.0)
  {
LABEL_5:
    v26 = AXLogLiveTranscription();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v15, "frameCapacity"));
      v28 = [(AXLTAudioOutTranscriber *)self appName];
      *(_DWORD *)buf = 138412546;
      *(void *)v39 = v27;
      *(_WORD *)&v39[8] = 2112;
      v40 = v28;
      _os_log_impl(&dword_23C242000, v26, OS_LOG_TYPE_DEFAULT, "Sent audio buffer with size: %@ for app: %@", buf, 0x16u);
    }
    v29 = [MEMORY[0x263EFF910] now];
    [(AXLTAudioOutTranscriber *)self setBufferLogTime:v29];
  }
  __int16 v30 = [(AXLTAudioOutTranscriber *)self transcriber];
  objc_msgSend(v30, "appendAudioPCMBuffer:forPID:", v15, -[AXLTAudioOutTranscriber pid](self, "pid"));

  v31 = +[AXLTAudioTextDumper sharedInstance];
  uint64_t v32 = [(AXLTAudioOutTranscriber *)self appName];
  v33 = [(AXLTAudioOutTranscriber *)self sessionStartTime];
  [v31 saveAudioBuffer:v15 appName:v32 sessionStartTime:v33];
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
}

- (NSString)appName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAppName:(id)a3
{
}

- (AVAudioFormat)tapFormat
{
  return self->_tapFormat;
}

- (void)setTapFormat:(id)a3
{
}

- (OpaqueAudioQueue)audioQueue
{
  return self->_audioQueue;
}

- (void)setAudioQueue:(OpaqueAudioQueue *)a3
{
  self->_audioQueue = a3;
}

- (AXLTTranscriber)transcriber
{
  return (AXLTTranscriber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTranscriber:(id)a3
{
}

- (AXLTTranscriberDelegateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXLTTranscriberDelegateProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)silentSamplesTailCount
{
  return self->_silentSamplesTailCount;
}

- (void)setSilentSamplesTailCount:(int64_t)a3
{
  self->_silentSamplesTailCount = a3;
}

- (NSDate)sessionStartTime
{
  return self->_sessionStartTime;
}

- (void)setSessionStartTime:(id)a3
{
}

- (NSDate)bufferLogTime
{
  return self->_bufferLogTime;
}

- (void)setBufferLogTime:(id)a3
{
}

- (NSDate)textLogTime
{
  return self->_textLogTime;
}

- (void)setTextLogTime:(id)a3
{
}

- (int64_t)silentBuffersCount
{
  return self->_silentBuffersCount;
}

- (void)setSilentBuffersCount:(int64_t)a3
{
  self->_int64_t silentBuffersCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLogTime, 0);
  objc_storeStrong((id *)&self->_bufferLogTime, 0);
  objc_storeStrong((id *)&self->_sessionStartTime, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transcriber, 0);
  objc_storeStrong((id *)&self->_tapFormat, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_appID, 0);
}

- (void)createAudioBuffersWithBufferByteSize:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23C242000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

- (void)handleAudioBuffer:(os_log_t)log audioQueue:timestamp:packetCount:packetDesc:.cold.1(int *a1, int a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v3 = a1[4];
  int v4 = *a1;
  v5[0] = 67109632;
  v5[1] = a2;
  __int16 v6 = 1024;
  int v7 = v3;
  __int16 v8 = 1024;
  int v9 = v4;
  _os_log_debug_impl(&dword_23C242000, log, OS_LOG_TYPE_DEBUG, "handleAudioBuffer packets: %i, data size: %i, buffer capacity: %i", (uint8_t *)v5, 0x14u);
}

- (void)_isSilenceOnlyInBuffer:(unsigned __int16)a1 packetCount:(NSObject *)a2 .cold.1(unsigned __int16 a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_23C242000, a2, OS_LOG_TYPE_DEBUG, "Found a sample of %d", (uint8_t *)v2, 8u);
}

@end