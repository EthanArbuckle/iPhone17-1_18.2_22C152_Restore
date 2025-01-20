@interface VCVideoStreamTransmitter
- (BOOL)isKeyFrame:(opaqueCMSampleBuffer *)a3;
- (BOOL)prependSPSPPS:(unint64_t *)a3 dataPointer:(char *)a4 sampleBuffer:(opaqueCMSampleBuffer *)a5;
- (BOOL)setEncodingMode:(int)a3;
- (VCVideoStreamTransmitter)initWithConfig:(id)a3;
- (__CFDictionary)forceKeyFrameProperties;
- (int)transmitEncodedVideoFrame:(char *)a3 size:(unint64_t)a4 timestamp:(unsigned int)a5 hostTime:(double)a6 cameraStatusBits:(unsigned __int8)a7;
- (int)transmitFrameInGroups:(char *)a3 numOfPackets:(int)a4 timestamp:(unsigned int)a5 hostTime:(double)a6 cameraStatusBits:(unsigned __int8)a7;
- (int)transmitVideoPackets:(const char *)a3 packetSizes:(int *)a4 startPacket:(int)a5 packetCount:(int)a6 lastGroup:(int)a7 timestamp:(unsigned int)a8 hostTime:(double)a9 cameraStatusBits:(unsigned __int8)a10 bytesSent:(int *)a11;
- (unsigned)setTemporaryMaximumBitrate:(unsigned int)a3;
- (void)dealloc;
- (void)encodeVideoFrame:(opaqueCMSampleBuffer *)a3;
- (void)gatherRealtimeStats:(__CFDictionary *)a3;
- (void)generateKeyFrameWithFIRType:(int)a3;
- (void)handleActiveConnectionChange:(id)a3;
- (void)handleThermalLevelChange:(int)a3;
- (void)initVideoCompressionWithWidth:(unsigned int)a3 height:(unsigned int)a4 bitrate:(unsigned int)a5 keyFrameIntervalDuration:(unsigned int)a6;
- (void)reportingVideoStreamEvent:(unsigned __int16)a3;
- (void)setFECRedundancyVector:(id *)a3;
- (void)setMediaSuggestion:(VCRateControlMediaSuggestion *)a3;
- (void)setTargetBitrate:(unsigned int)a3;
- (void)startVideo;
- (void)stopVideo;
- (void)transmitEncodedVideoFrame:(opaqueCMSampleBuffer *)a3 cameraStatusBits:(unsigned __int8)a4;
- (void)updateSendStatisticsWithTimestamp:(unsigned int)a3 frameSize:(unsigned int)a4 packetsInFrame:(unsigned int)a5;
- (void)updateWindowState:(int)a3 isLocal:(BOOL)a4 windowRect:(CGRect)a5;
@end

@implementation VCVideoStreamTransmitter

- (VCVideoStreamTransmitter)initWithConfig:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)VCVideoStreamTransmitter;
  v4 = [(VCVideoStreamTransmitter *)&v24 init];
  if (!v4)
  {
LABEL_32:

    return 0;
  }
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoStreamTransmitter initWithConfig:]();
      }
    }
    goto LABEL_32;
  }
  v4->_videoCodecType = [a3 codecType];
  v4->_videoSource = [a3 videoSource];
  if ((unint64_t)[a3 framerate] <= 0x3C && objc_msgSend(a3, "framerate")) {
    v4->super._targetFramerate = [a3 framerate];
  }
  v4->super._txMaxBitrate = [a3 txMaxBitrate];
  v4->super._txMinBitrate = [a3 txMinBitrate];
  v4->super._temporaryMaximumBitrate = [a3 txMinBitrate];
  if ([a3 videoResolution] == 27)
  {
    v4->super._unsigned int encodingWidth = [a3 customWidth];
    unsigned int v5 = [a3 customHeight];
  }
  else
  {
    +[VideoUtil sizeForVideoResolution:](VideoUtil, "sizeForVideoResolution:", [a3 videoResolution]);
    v4->super._unsigned int encodingWidth = v6;
    unsigned int v5 = v7;
  }
  v4->super._unsigned int encodingHeight = v5;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int encodingWidth = v4->super._encodingWidth;
      unsigned int encodingHeight = v4->super._encodingHeight;
      LODWORD(buf.value) = 136316162;
      *(CMTimeValue *)((char *)&buf.value + 4) = v8;
      LOWORD(buf.flags) = 2080;
      *(void *)((char *)&buf.flags + 2) = "-[VCVideoStreamTransmitter initWithConfig:]";
      HIWORD(buf.epoch) = 1024;
      int v26 = 140;
      __int16 v27 = 1024;
      unsigned int v28 = encodingWidth;
      __int16 v29 = 1024;
      unsigned int v30 = encodingHeight;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d encode = %dx%d", (uint8_t *)&buf, 0x28u);
    }
  }
  v4->_stats = objc_alloc_init(VCMediaStreamStats);
  pthread_mutex_init(&v4->_xMBs, 0);
  v4->_recommendedMTU = [a3 recommendedMTU];
  v4->_statisticsCollector = (AVCStatisticsCollector *)(id)[a3 statisticsCollector];
  v4->_keyFrameIntervalDuration = [a3 keyFrameInterval];
  v12 = [VCVideoRule alloc];
  uint64_t v13 = v4->super._encodingWidth;
  uint64_t v14 = v4->super._encodingHeight;
  *(float *)&double v15 = (float)(unint64_t)[a3 framerate];
  v4->super._videoRule = [(VCVideoRule *)v12 initWithFrameWidth:v13 frameHeight:v14 frameRate:v15];
  v4->_dwRefreshFrameCounter = 0;
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  v4->_transmitterQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVideoStreamTransmitter.transmitterQueue", 0, CustomRootQueue);
  CFAllocatorRef v17 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CallbacksForUnsortedSampleBuffers = CMBufferQueueGetCallbacksForUnsortedSampleBuffers();
  if (CMBufferQueueCreate(v17, 0, CallbacksForUnsortedSampleBuffers, &v4->_bufferQueue))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoStreamTransmitter initWithConfig:].cold.4();
      }
    }
    goto LABEL_32;
  }
  if (VTU_CreatePacketAllocator([a3 recommendedMTU], (uint64_t)v17, &v4->_videoPacketAllocator))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoStreamTransmitter initWithConfig:]();
      }
    }
    goto LABEL_32;
  }
  v4->_bufferQueueSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  uint64_t v19 = VCRealTimeThread_Initialize(18, (uint64_t)VCVideoStreamEncoderProc, (uint64_t)v4, "com.apple.AVConference.VCVideoStreamTransmitter.encoderThread", 0);
  v4->_encoderThread = (tagVCRealTimeThread *)v19;
  if (!v19)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoStreamTransmitter initWithConfig:]();
      }
    }
    goto LABEL_32;
  }
  [(VCVideoStreamTransmitter *)v4 generateKeyFrameWithFIRType:0];
  v4->_forceDisableBitrateCap = [+[VCDefaults sharedInstance] forceVideoStreamDisableBitrateCap];
  reportingAgent = v4->_reportingAgent;
  v21 = (opaqueRTCReporting *)[a3 reportingAgent];
  v4->_reportingAgent = v21;
  if (v21) {
    CFRetain(v21);
  }
  if (reportingAgent) {
    CFRelease(reportingAgent);
  }
  v4->_reportingModuleID = VCReporting_GetDynamicReportingModuleID();
  [a3 reportingParentID];
  reportingInheritModuleSpecificInfoFromParent();
  v4->_enableCVO = [a3 enableCVO];
  v4->_cvoExtensionID = [a3 cvoExtensionID];
  v4->super._controlInfoGenerator = (void *)VCMediaControlInfoGeneratorCreateWithType(2);
  v4->_videoRTP = *(tagHANDLE **)[a3 streamConfigs];
  v4->super._timestamp = 0;
  CMTimeMake(&buf, 0, 90000);
  long long v22 = *(_OWORD *)&buf.value;
  v4->super._latestSampleBufferTimestamp.epoch = buf.epoch;
  *(_OWORD *)&v4->super._latestSampleBufferTimestamp.value = v22;
  v4->_encodingArgPool = (tagVCMemoryPool *)VCMemoryPool_Create(0x1C8uLL);
  v4->_tilesPerFrame = [a3 tilesPerFrame];
  v4->super._profileLevel = (NSString *)(id)[a3 profileLevel];
  v4->super._realtimeSPI.enqueueVideoFrame = VCVideoStreamTransmitter_EnqueueVideoFrame;
  v4->super._realtimeSPI.setFECRatio = VCVideoStreamTransmitter_SetFECRatio;
  v4->super._realtimeSPI.setMediaQueueSize = VCVideoStreamTransmitter_SetMediaQueueSize;
  return v4;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  pthread_mutex_destroy(&self->_xMBs);

  VCRealTimeThread_Finalize((uint64_t)self->_encoderThread);
  dispatch_release((dispatch_object_t)self->_transmitterQueue);
  dispatch_release((dispatch_object_t)self->_bufferQueueSemaphore);
  bufferQueue = self->_bufferQueue;
  if (bufferQueue) {
    CFRelease(bufferQueue);
  }
  buffer = self->_buffer;
  if (buffer) {
    free(buffer);
  }
  free(self->_packetSizes);
  free(self->_packetFlags);

  VCMemoryPool_Destroy((OSQueueHead *)self->_encodingArgPool);
  reportingCacheModuleSpecificInfo();
  reportingAgent = self->_reportingAgent;
  if (reportingAgent) {
    CFRelease(reportingAgent);
  }
  controlInfoGenerator = self->super._controlInfoGenerator;
  if (controlInfoGenerator) {
    CFRelease(controlInfoGenerator);
  }
  videoPacketAllocator = self->_videoPacketAllocator;
  if (videoPacketAllocator) {
    CFRelease(videoPacketAllocator);
  }

  v8.receiver = self;
  v8.super_class = (Class)VCVideoStreamTransmitter;
  [(VCVideoTransmitterBase *)&v8 dealloc];
}

- (void)startVideo
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CMTime buf = 136315650;
      uint64_t v8 = v3;
      __int16 v9 = 2080;
      v10 = "-[VCVideoStreamTransmitter startVideo]";
      __int16 v11 = 1024;
      int v12 = 224;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCVideoStreamTransmitter startVideo", buf, 0x1Cu);
    }
  }
  transmitterQueue = self->_transmitterQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__VCVideoStreamTransmitter_startVideo__block_invoke;
  block[3] = &unk_1E6DB3DC8;
  block[4] = self;
  dispatch_sync(transmitterQueue, block);
}

uint64_t __38__VCVideoStreamTransmitter_startVideo__block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 224) = 0;
  [*(id *)(a1 + 32) initVideoCompressionWithWidth:*(unsigned int *)(*(void *)(a1 + 32) + 24) height:*(unsigned int *)(*(void *)(a1 + 32) + 28) bitrate:*(unsigned int *)(*(void *)(a1 + 32) + 52) keyFrameIntervalDuration:*(unsigned int *)(*(void *)(a1 + 32) + 260)];
  VCRealTimeThread_Start(*(void *)(*(void *)(a1 + 32) + 176));

  return reportingRegisterPeriodicTaskWeak();
}

uint64_t __38__VCVideoStreamTransmitter_startVideo__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "gatherRealtimeStats:");
}

- (void)stopVideo
{
  v3[5] = *MEMORY[0x1E4F143B8];
  transmitterQueue = self->_transmitterQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __37__VCVideoStreamTransmitter_stopVideo__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_sync(transmitterQueue, v3);
}

intptr_t __37__VCVideoStreamTransmitter_stopVideo__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 400))
  {
    reportingUnregisterPeriodicTask();
    uint64_t v2 = *(void *)(a1 + 32);
  }
  VCRealTimeThread_Stop(*(void *)(v2 + 176));
  *(unsigned char *)(*(void *)(a1 + 32) + 184) = 1;
  intptr_t result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 192));
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    unsigned int v5 = (void *)(v4 + 416);
    intptr_t result = *(void *)(v4 + 432);
    if (result != 0xFFFFFFFFLL)
    {
      intptr_t result = (*(uint64_t (**)(void))(*v5 + 8))();
      v5[2] = 0xFFFFFFFFLL;
    }
  }
  return result;
}

- (void)generateKeyFrameWithFIRType:(int)a3
{
  int v4 = 0;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  atomic_compare_exchange_strong_explicit(&self->_shouldGenerateKeyFrame, (unsigned int *)&v4, 1u, memory_order_relaxed, memory_order_relaxed);
  BOOL v5 = v4 == 0;
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v5)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315906;
        uint64_t v12 = v7;
        __int16 v13 = 2080;
        uint64_t v14 = "-[VCVideoStreamTransmitter generateKeyFrameWithFIRType:]";
        __int16 v15 = 1024;
        int v16 = 281;
        __int16 v17 = 1024;
        int v18 = a3;
        __int16 v9 = " [%s] %s:%d key frame requested for next pixel buffer, FIRType %d.";
LABEL_8:
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 0x22u);
      }
    }
  }
  else if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315906;
      uint64_t v12 = v10;
      __int16 v13 = 2080;
      uint64_t v14 = "-[VCVideoStreamTransmitter generateKeyFrameWithFIRType:]";
      __int16 v15 = 1024;
      int v16 = 283;
      __int16 v17 = 1024;
      int v18 = a3;
      __int16 v9 = " [%s] %s:%d key frame was already requested, FIRType: %d";
      goto LABEL_8;
    }
  }
}

- (unsigned)setTemporaryMaximumBitrate:(unsigned int)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  transmitterQueue = self->_transmitterQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__VCVideoStreamTransmitter_setTemporaryMaximumBitrate___block_invoke;
  block[3] = &unk_1E6DB3F08;
  block[4] = self;
  unsigned int v7 = a3;
  dispatch_sync(transmitterQueue, block);
  return self->super._temporaryMaximumBitrate;
}

void __55__VCVideoStreamTransmitter_setTemporaryMaximumBitrate___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    if (*(void *)(v1 + 432) != 0xFFFFFFFFLL)
    {
      int v4 = (const void *)(a1 + 40);
      unsigned int v3 = *(_DWORD *)(a1 + 40);
      if (*(_DWORD *)(v1 + 52) != v3 && *(_DWORD *)(v1 + 44) >= v3 && *(_DWORD *)(v1 + 48) <= v3)
      {
        CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
        if (Mutable)
        {
          unsigned int v7 = Mutable;
          CFNumberRef v8 = CFNumberCreate(v5, kCFNumberIntType, v4);
          if (v8)
          {
            CFNumberRef v9 = v8;
            CFArrayAppendValue(v7, v8);
            CFRelease(v9);
            uint64_t v10 = *(void *)(a1 + 32);
            if (v10)
            {
              int v11 = (void *)(v10 + 416);
              uint64_t v12 = v11[2];
              if (v12 != 0xFFFFFFFFLL) {
                (*(void (**)(uint64_t, __CFArray *))(*v11 + 24))(v12, v7);
              }
            }
            CFRelease(v7);
            *(_DWORD *)(*(void *)(a1 + 32) + 52) = *(_DWORD *)(a1 + 40);
          }
          else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              __55__VCVideoStreamTransmitter_setTemporaryMaximumBitrate___block_invoke_cold_2();
            }
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            __55__VCVideoStreamTransmitter_setTemporaryMaximumBitrate___block_invoke_cold_1();
          }
        }
      }
    }
  }
}

- (void)setTargetBitrate:(unsigned int)a3
{
  if (self->super._temporaryMaximumBitrate >= a3 && self->super._txMaxBitrate >= a3 && self->super._txMinBitrate <= a3)
  {
    self->super._targetBitrate = a3;
    -[VCVideoStreamTransmitter setTemporaryMaximumBitrate:](self, "setTemporaryMaximumBitrate:");
  }
}

- (void)setFECRedundancyVector:(id *)a3
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCVideoStreamTransmitter setFECRedundancyVector:]();
    }
  }
}

- (void)setMediaSuggestion:(VCRateControlMediaSuggestion *)a3
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCVideoStreamTransmitter setMediaSuggestion:]();
    }
  }
}

- (BOOL)setEncodingMode:(int)a3
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCVideoStreamTransmitter setEncodingMode:]();
    }
  }
  return 0;
}

- (void)handleThermalLevelChange:(int)a3
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCVideoStreamTransmitter handleThermalLevelChange:]();
    }
  }
}

- (void)updateWindowState:(int)a3 isLocal:(BOOL)a4 windowRect:(CGRect)a5
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCVideoStreamTransmitter updateWindowState:isLocal:windowRect:]();
    }
  }
}

- (void)initVideoCompressionWithWidth:(unsigned int)a3 height:(unsigned int)a4 bitrate:(unsigned int)a5 keyFrameIntervalDuration:(unsigned int)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v8 = 0u;
  long long v21 = 0u;
  long long v20 = 0u;
  long long v19 = 0u;
  long long v18 = 0u;
  long long v17 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v12 = 0u;
  long long v11 = 0u;
  long long v10 = 0u;
  v7[0] = a3;
  v7[1] = a4;
  DWORD2(v9) = a5;
  LODWORD(v8) = a6;
  uint64_t v14 = encoderFrameCallback;
  __int16 v15 = self;
  DWORD1(v16) = self->_tilesPerFrame;
  *(void *)&long long v17 = self->super._profileLevel;
  p_encoder = &self->_encoder;
  VCVideoEncoderVTInitialize((uint64_t)&self->_encoder);
  if (p_encoder->encoderHandle == (tagHANDLE *)0xFFFFFFFFLL) {
    (*(void (**)(tagHANDLE **, _DWORD *))p_encoder->encoderVTable)(&p_encoder->encoderHandle, v7);
  }
}

- (__CFDictionary)forceKeyFrameProperties
{
  keys[1] = *(void **)MEMORY[0x1E4F143B8];
  int v2 = 1;
  atomic_compare_exchange_strong_explicit(&self->_shouldGenerateKeyFrame, (unsigned int *)&v2, 0, memory_order_relaxed, memory_order_relaxed);
  if (v2 != 1) {
    return 0;
  }
  ++self->_totalKeyFramesSent;
  keys[0] = *(void **)MEMORY[0x1E4F44ED8];
  values = (void *)*MEMORY[0x1E4F1CFD0];
  return CFDictionaryCreate(0, (const void **)keys, (const void **)&values, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
}

- (void)encodeVideoFrame:(opaqueCMSampleBuffer *)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (ImageBuffer)
  {
    CVImageBufferRef v6 = ImageBuffer;
    unsigned int v7 = [(VCVideoStreamTransmitter *)self forceKeyFrameProperties];
    int valuePtr = -1431655766;
    CFNumberRef v8 = (const __CFNumber *)CMGetAttachment(a3, @"cameraStatusBits", 0);
    CFNumberGetValue(v8, kCFNumberSInt32Type, &valuePtr);
    long long v9 = (char *)VCMemoryPool_Alloc((OSQueueHead *)self->_encodingArgPool);
    *((void *)v9 + 11) = v6;
    *((void *)v9 + 40) = v7;
    CMSampleBufferGetOutputPresentationTimeStamp(&v13, a3);
    *(CMTime *)(v9 + 292) = v13;
    v9[328] = valuePtr;
    encoderHandle = self->_encoder.encoderHandle;
    if (encoderHandle == (tagHANDLE *)0xFFFFFFFFLL
      || ((int v11 = (*((uint64_t (**)(tagHANDLE *, char *))self->_encoder.encoderVTable + 4))(encoderHandle, v9),
           v11 != -2146959339)
        ? (BOOL v12 = v11 == -2146959358)
        : (BOOL v12 = 1),
          v12))
    {
      VCMemoryPool_Free((OSQueueHead *)self->_encodingArgPool, v9);
    }
    if (v7) {
      CFRelease(v7);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCVideoStreamTransmitter encodeVideoFrame:]();
    }
  }
}

- (BOOL)prependSPSPPS:(unint64_t *)a3 dataPointer:(char *)a4 sampleBuffer:(opaqueCMSampleBuffer *)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  size_t bufferSize = *a3 + 400;
  buffer = self->_buffer;
  if (self->_bufferSize >= bufferSize)
  {
    size_t bufferSize = self->_bufferSize;
    goto LABEL_7;
  }
  if (buffer) {
    free(self->_buffer);
  }
  int v11 = (char *)malloc_type_malloc(bufferSize, 0xFCF6ECDEuLL);
  self->_buffer = v11;
  if (v11)
  {
    buffer = v11;
    self->_size_t bufferSize = bufferSize;
LABEL_7:
    size_t SPSPPSFromSampleBuffer = VideoUtil_ExtractSPSPPSFromSampleBuffer(a5, (uint64_t)buffer, bufferSize);
    memcpy(&self->_buffer[SPSPPSFromSampleBuffer], a4, *a3);
    *a3 += SPSPPSFromSampleBuffer;
    return 1;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
    return 0;
  }
  uint64_t v14 = VRTraceErrorLogLevelToCSTR();
  uint64_t v15 = *MEMORY[0x1E4F47A50];
  BOOL v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v16)
  {
    unint64_t v17 = self->_bufferSize;
    int v18 = 136315906;
    uint64_t v19 = v14;
    __int16 v20 = 2080;
    long long v21 = "-[VCVideoStreamTransmitter prependSPSPPS:dataPointer:sampleBuffer:]";
    __int16 v22 = 1024;
    int v23 = 445;
    __int16 v24 = 1024;
    int v25 = v17;
    _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sendFrame: Error while allocating %d bytes", (uint8_t *)&v18, 0x22u);
    return 0;
  }
  return result;
}

- (BOOL)isKeyFrame:(opaqueCMSampleBuffer *)a3
{
  BOOLean[1] = *(CFBooleanRef *)MEMORY[0x1E4F143B8];
  CFArrayRef SampleAttachmentsArray = CMSampleBufferGetSampleAttachmentsArray(a3, 0);
  CFIndex Count = CFArrayGetCount(SampleAttachmentsArray);
  if (Count)
  {
    BOOLean[0] = 0;
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(SampleAttachmentsArray, 0);
    if (CFDictionaryGetValueIfPresent(ValueAtIndex, (const void *)*MEMORY[0x1E4F1F200], (const void **)BOOLean)) {
      LOBYTE(Count) = CFBooleanGetValue(BOOLean[0]) == 0;
    }
    else {
      LOBYTE(Count) = 1;
    }
  }
  return Count;
}

- (void)transmitEncodedVideoFrame:(opaqueCMSampleBuffer *)a3 cameraStatusBits:(unsigned __int8)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return;
  }
  uint64_t v4 = a4;
  dataPointerOut = 0;
  size_t SampleSize = CMSampleBufferGetSampleSize(a3, 0);
  if (SampleSize)
  {
    DataBuffer = CMSampleBufferGetDataBuffer(a3);
    if (DataBuffer)
    {
      if (CMBlockBufferGetDataPointer(DataBuffer, 0, 0, 0, &dataPointerOut)
        && (int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        long long v9 = *MEMORY[0x1E4F47A50];
        long long v10 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf.value) = 136315650;
            *(CMTimeValue *)((char *)&buf.value + 4) = v8;
            LOWORD(buf.flags) = 2080;
            *(void *)((char *)&buf.flags + 2) = "-[VCVideoStreamTransmitter transmitEncodedVideoFrame:cameraStatusBits:]";
            HIWORD(buf.epoch) = 1024;
            int v42 = 488;
            _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sendFrame: Error: Error getting data buffer", (uint8_t *)&buf, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          -[VCVideoStreamTransmitter transmitEncodedVideoFrame:cameraStatusBits:]();
        }
      }
    }
  }
  BOOL v11 = [(VCVideoStreamTransmitter *)self isKeyFrame:a3];
  if (dataPointerOut)
  {
    BOOL v12 = v11;
    if (v11
      && !-[VCVideoStreamTransmitter prependSPSPPS:dataPointer:sampleBuffer:](self, "prependSPSPPS:dataPointer:sampleBuffer:", &SampleSize))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v33 = VRTraceErrorLogLevelToCSTR();
        uint64_t v26 = *MEMORY[0x1E4F47A50];
        v34 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf.value) = 136315650;
            *(CMTimeValue *)((char *)&buf.value + 4) = v33;
            LOWORD(buf.flags) = 2080;
            *(void *)((char *)&buf.flags + 2) = "-[VCVideoStreamTransmitter transmitEncodedVideoFrame:cameraStatusBits:]";
            HIWORD(buf.epoch) = 1024;
            int v42 = 502;
            __int16 v27 = " [%s] %s:%d Failed To Prepend SPS/PPS";
            goto LABEL_34;
          }
        }
        else if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          -[VCVideoStreamTransmitter transmitEncodedVideoFrame:cameraStatusBits:]();
        }
      }
      return;
    }
    memset(&v38, 170, sizeof(v38));
    CMSampleBufferGetPresentationTimeStamp(&v38, a3);
    p_latestSampleBufferTimestamp = &self->super._latestSampleBufferTimestamp;
    CMTimeValue value = self->super._latestSampleBufferTimestamp.value;
    if (value)
    {
      CMTime lhs = v38;
      *(_OWORD *)&rhs.CMTimeValue value = *(_OWORD *)&p_latestSampleBufferTimestamp->value;
      rhs.CMTimeEpoch epoch = self->super._latestSampleBufferTimestamp.epoch;
      CMTimeSubtract(&buf, &lhs, &rhs);
      CMTimeValue value = buf.value;
      uint64_t v15 = *(void *)&buf.timescale;
      CMTimeEpoch epoch = buf.epoch;
    }
    else
    {
      uint64_t v15 = *(void *)&self->super._latestSampleBufferTimestamp.timescale;
      CMTimeEpoch epoch = self->super._latestSampleBufferTimestamp.epoch;
    }
    memset(&v35, 170, sizeof(v35));
    buf.CMTimeValue value = value;
    *(void *)&buf.timescale = v15;
    buf.CMTimeEpoch epoch = epoch;
    CMTimeConvertScale(&v35, &buf, 90000, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    self->super._timestamp += LODWORD(v35.value);
    long long v17 = *(_OWORD *)&v38.value;
    *(_OWORD *)&p_latestSampleBufferTimestamp->CMTimeValue value = *(_OWORD *)&v38.value;
    CMTimeEpoch v18 = v38.epoch;
    self->super._latestSampleBufferTimestamp.CMTimeEpoch epoch = v38.epoch;
    *(_OWORD *)&buf.CMTimeValue value = v17;
    buf.CMTimeEpoch epoch = v18;
    double Seconds = CMTimeGetSeconds(&buf);
    if (self->_enableCVO
      && ((int lastCameraStatusBits = self->_lastCameraStatusBits, (lastCameraStatusBits & 0x80u) == 0)
        ? (BOOL v21 = lastCameraStatusBits == v4)
        : (BOOL v21 = 0),
          !v21 ? (int v22 = 1) : (int v22 = v12),
          v22 == 1))
    {
      self->_int lastCameraStatusBits = v4;
      if (!v12)
      {
LABEL_26:
        p_dataPointerOut = &dataPointerOut;
        goto LABEL_29;
      }
    }
    else
    {
      uint64_t v4 = 0;
      if (!v12) {
        goto LABEL_26;
      }
    }
    p_dataPointerOut = &self->_buffer;
LABEL_29:
    int v24 = [(VCVideoStreamTransmitter *)self transmitEncodedVideoFrame:*p_dataPointerOut size:SampleSize timestamp:self->super._timestamp hostTime:v4 cameraStatusBits:Seconds];
    if (v24 < 0)
    {
      int v28 = v24;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v29 = VRTraceErrorLogLevelToCSTR();
        unsigned int v30 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf.value) = 136316418;
          *(CMTimeValue *)((char *)&buf.value + 4) = v29;
          LOWORD(buf.flags) = 2080;
          *(void *)((char *)&buf.flags + 2) = "-[VCVideoStreamTransmitter transmitEncodedVideoFrame:cameraStatusBits:]";
          HIWORD(buf.epoch) = 1024;
          int v42 = 528;
          __int16 v43 = 1024;
          int v44 = v28;
          __int16 v45 = 1024;
          int v46 = v28;
          __int16 v47 = 1024;
          BOOL v48 = v12;
          _os_log_error_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_ERROR, " [%s] %s:%d sendFrame: transmitEncodedVideoFrame returned error %d (0x%08x). isKeyFrame=%d", (uint8_t *)&buf, 0x2Eu);
        }
      }
    }
    else if (v12)
    {
      self->_lastKeyFrameSampleBufferSize = SampleSize;
      [(VCVideoTransmitterBase *)self setLastKeyFrameSentTime:micro()];
      [(VCVideoStreamTransmitter *)self reportingVideoStreamEvent:228];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v25 = VRTraceErrorLogLevelToCSTR();
        uint64_t v26 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.value) = 136315650;
          *(CMTimeValue *)((char *)&buf.value + 4) = v25;
          LOWORD(buf.flags) = 2080;
          *(void *)((char *)&buf.flags + 2) = "-[VCVideoStreamTransmitter transmitEncodedVideoFrame:cameraStatusBits:]";
          HIWORD(buf.epoch) = 1024;
          int v42 = 534;
          __int16 v27 = " [%s] %s:%d successfully sent key frame";
LABEL_34:
          _os_log_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_DEFAULT, v27, (uint8_t *)&buf, 0x1Cu);
          return;
        }
      }
    }
    return;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v31 = VRTraceErrorLogLevelToCSTR();
    uint64_t v26 = *MEMORY[0x1E4F47A50];
    v32 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.value) = 136315650;
        *(CMTimeValue *)((char *)&buf.value + 4) = v31;
        LOWORD(buf.flags) = 2080;
        *(void *)((char *)&buf.flags + 2) = "-[VCVideoStreamTransmitter transmitEncodedVideoFrame:cameraStatusBits:]";
        HIWORD(buf.epoch) = 1024;
        int v42 = 496;
        __int16 v27 = " [%s] %s:%d sendFrame: Error while getting image buffer data";
        goto LABEL_34;
      }
    }
    else if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      -[VCVideoStreamTransmitter transmitEncodedVideoFrame:cameraStatusBits:]();
    }
  }
}

- (int)transmitEncodedVideoFrame:(char *)a3 size:(unint64_t)a4 timestamp:(unsigned int)a5 hostTime:(double)a6 cameraStatusBits:(unsigned __int8)a7
{
  uint64_t v7 = a7;
  uint64_t v8 = *(void *)&a5;
  int v9 = a4;
  v24[3] = *MEMORY[0x1E4F143B8];
  memset(v24, 170, 20);
  *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v21[1] = (unsigned __int16 *)0xAAAAAAAAAAAA000ALL;
  long long v22 = v13;
  v23[0] = v13;
  v23[1] = v13;
  v21[0] = (unsigned __int16 *)v24;
  v21[2] = (unsigned __int16 *)&self->_iSMBCount;
  v21[3] = (unsigned __int16 *)&self->_xMBs;
  v21[4] = (unsigned __int16 *)&self->_packetSizes;
  v21[5] = (unsigned __int16 *)&self->_packetFlags;
  v21[6] = (unsigned __int16 *)&self->_maxPacketCount;
  *((void *)&v23[0] + 1) = self->_videoPacketAllocator;
  *(void *)((char *)&v22 + 7) = 0;
  *(void *)&long long v22 = 0;
  IsIPCVImageBufferRef v6 = RTPGetIsIPv6((uint64_t)self->_videoRTP, (BOOL *)v23 + 2);
  if (IsIPv6 < 0)
  {
    int v17 = IsIPv6;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoStreamTransmitter transmitEncodedVideoFrame:size:timestamp:hostTime:cameraStatusBits:]();
      }
    }
  }
  else
  {
    if (BYTE2(v23[0])) {
      unsigned int v15 = 1280;
    }
    else {
      unsigned int v15 = 1450;
    }
    LOWORD(v23[0]) = v15;
    BYTE4(v23[0]) = 0;
    if (self->_recommendedMTU && self->_recommendedMTU < v15) {
      LOWORD(v23[0]) = self->_recommendedMTU;
    }
    LOWORD(v23[0]) -= VTU_GetOverhead(0, 0, 0, BYTE2(v23[0]) != 0);
    if (self->_forceDisableBitrateCap) {
      unsigned int temporaryMaximumBitrate = self->super._temporaryMaximumBitrate;
    }
    else {
      unsigned int temporaryMaximumBitrate = 164000;
    }
    ptr = (void *)0xAAAAAAAAAAAAAAAALL;
    uint64_t v18 = VTU_SplitVideoIntoPackets(v21, 123, a3, v9, &ptr, 0, 0, 1, 0, 0, temporaryMaximumBitrate, 0);
    if (v18)
    {
      int v17 = [(VCVideoStreamTransmitter *)self transmitFrameInGroups:ptr numOfPackets:v18 timestamp:v8 hostTime:v7 cameraStatusBits:a6];
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCVideoStreamTransmitter transmitEncodedVideoFrame:size:timestamp:hostTime:cameraStatusBits:]();
        }
      }
      int v17 = -2147418105;
    }
    if (ptr && ptr != a3) {
      CFAllocatorDeallocate(self->_videoPacketAllocator, ptr);
    }
  }
  return v17;
}

- (int)transmitFrameInGroups:(char *)a3 numOfPackets:(int)a4 timestamp:(unsigned int)a5 hostTime:(double)a6 cameraStatusBits:(unsigned __int8)a7
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  int v23 = 0;
  if (a4 < 1)
  {
    uint64_t v12 = 0;
    uint64_t v11 = 0;
    int v16 = 0;
  }
  else
  {
    int v9 = a4;
    LODWORD(v11) = 0;
    uint64_t v12 = 0;
    int v13 = 0;
    do
    {
      if (v9 == 9) {
        unsigned int v14 = 5;
      }
      else {
        unsigned int v14 = 8;
      }
      if (v9 >= 8) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = v9;
      }
      v9 -= v15;
      LOBYTE(v19) = a7;
      int v16 = [(VCVideoStreamTransmitter *)self transmitVideoPackets:&a3[(int)v11] packetSizes:self->_packetSizes startPacket:v12 packetCount:v15 lastGroup:v9 < 1 timestamp:a5 hostTime:a6 cameraStatusBits:v19 bytesSent:&v23];
      if (v16 < 0 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v20 = VRTraceErrorLogLevelToCSTR();
        int v17 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)CMTime buf = 136316674;
          uint64_t v25 = v20;
          __int16 v26 = 2080;
          __int16 v27 = "-[VCVideoStreamTransmitter transmitFrameInGroups:numOfPackets:timestamp:hostTime:cameraStatusBits:]";
          __int16 v28 = 1024;
          int v29 = 626;
          __int16 v30 = 1024;
          int v31 = 626;
          __int16 v32 = 2048;
          uint64_t v33 = v16;
          __int16 v34 = 1024;
          int v35 = v13;
          __int16 v36 = 1024;
          int v37 = v15;
          _os_log_error_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCVideoStreamTransmitter.m:%d: VideoTransmitter transmitGroup failed (%08lX) for group (%d) #packet (%d)", buf, 0x38u);
        }
      }
      uint64_t v11 = (v23 + v11);
      uint64_t v12 = (v15 + v12);
      ++v13;
    }
    while (v9 > 0);
  }
  [(VCMediaStreamStats *)self->_stats recordDataWithSize:(double)(int)v11 atTime:micro()];
  [(VCVideoStreamTransmitter *)self updateSendStatisticsWithTimestamp:a5 frameSize:v11 packetsInFrame:v12];
  return v16;
}

- (int)transmitVideoPackets:(const char *)a3 packetSizes:(int *)a4 startPacket:(int)a5 packetCount:(int)a6 lastGroup:(int)a7 timestamp:(unsigned int)a8 hostTime:(double)a9 cameraStatusBits:(unsigned __int8)a10 bytesSent:(int *)a11
{
  v31[1] = *MEMORY[0x1E4F143B8];
  *a11 = 0;
  if (a6 < 1) {
    return 0;
  }
  unint64_t v13 = 0;
  int v14 = -2147418092;
  uint64_t v26 = 4 * (a6 - 1);
  uint64_t v25 = 4 * a6;
  uint64_t v15 = &a4[a5];
  while (1)
  {
    ControlInfo = 0;
    signed int v17 = v15[v13 / 4];
    if (a7) {
      BOOL v18 = v26 == v13;
    }
    else {
      BOOL v18 = 0;
    }
    int v19 = v18;
    v31[0] = 0xAAAAAAAAAAAAAAAALL;
    if ((a10 & 0x80) != 0 && self->_enableCVO && v19 != 0)
    {
      VCCVOExtensionUtils_FillCVOExtension(a10, self->_cvoExtensionID, (uint64_t)v31);
      controlInfoGenerator = self->super._controlInfoGenerator;
      if (controlInfoGenerator)
      {
        ControlInfo = VCMediaControlInfoGeneratorCreateControlInfo((uint64_t)controlInfoGenerator);
        VCMediaControlInfoSetInfo(ControlInfo, (const char *)9, (uint64_t)v31, 8);
      }
      else
      {
        ControlInfo = 0;
      }
    }
    videoRTP = self->_videoRTP;
    int v30 = 0;
    int v23 = RTPSendH264Packet((uint64_t)videoRTP, 123, 1u, v19, a8, (void *)&a3[*a11], v17, &v30, a9, 0, 0, v13 == 0, 0, a10, 0, 0, 0, self->_dwRefreshFrameCounter, (uint64_t)ControlInfo,
            0,
            0,
            0,
            0);
    if (v23 == -2147418092) {
      break;
    }
    *a11 += v15[v13 / 4];
    v13 += 4;
    if (v25 == v13) {
      return v23;
    }
  }
  [(VCVideoStreamTransmitter *)self generateKeyFrameWithFIRType:0];
  return v14;
}

- (void)updateSendStatisticsWithTimestamp:(unsigned int)a3 frameSize:(unsigned int)a4 packetsInFrame:(unsigned int)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  self->_totalBytesSent += a4;
  self->_totalPacketsSent += a5;
  int v25 = 0;
  long long v24 = 0u;
  long long v23 = 0u;
  long long v22 = 0u;
  long long v21 = 0u;
  long long v20 = 0u;
  long long v19 = 0u;
  long long v18 = 0u;
  long long v17 = 0u;
  long long v16 = 0u;
  long long v15 = 0u;
  double v7 = micro();
  unint64_t totalBytesSent = self->_totalBytesSent;
  unsigned int totalPacketsSent = self->_totalPacketsSent;
  statisticsCollector = self->_statisticsCollector;
  v11[0] = 6;
  *(double *)&v11[1] = v7;
  v11[2] = 0;
  unsigned int v12 = a3 >> 8;
  unsigned int v13 = totalPacketsSent;
  int v14 = totalBytesSent;
  VCRateControlSetStatistics(statisticsCollector, v11);
}

- (void)gatherRealtimeStats:(__CFDictionary *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (__CFDictionary *)selectDestinationForRTMetrics();
  double v5 = micro();
  if (self->_reportingIntervalStartTime == 0.0) {
    self->_reportingIntervalStartTime = v5;
  }
  if (self->_reportingLastUpdateTime > 0.0)
  {
    -[VCMediaStreamStats updateMinMaxSinceTime:](self->_stats, "updateMinMaxSinceTime:");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      double v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        [(VCMediaStreamStats *)self->_stats framerate];
        uint64_t v9 = v8;
        unsigned int v10 = [(VCMediaStreamStats *)self->_stats bitrateKbps];
        *(_DWORD *)CMTime buf = 136316162;
        uint64_t v28 = v6;
        __int16 v29 = 2080;
        int v30 = "-[VCVideoStreamTransmitter gatherRealtimeStats:]";
        __int16 v31 = 1024;
        int v32 = 709;
        __int16 v33 = 2048;
        uint64_t v34 = v9;
        __int16 v35 = 1024;
        unsigned int v36 = v10;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VideoStreamStats - Tx - framerate:%f, bitrate:%dkbps", buf, 0x2Cu);
      }
    }
  }
  self->_reportingLastUpdateTime = v5;
  if (v4)
  {
    CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%u", [(VCMediaStreamStats *)self->_stats maxFrameDurationMillis]);
    CFDictionaryAddValue(v4, @"VCVSTxMaxFrameDuration", v12);
    CFRelease(v12);
    [(VCMediaStreamStats *)self->_stats setMaxFrameDurationMillis:0];
    CFStringRef v13 = CFStringCreateWithFormat(v11, 0, @"%u", [(VCMediaStreamStats *)self->_stats getBitrateKbpsSinceTime:self->_reportingIntervalStartTime]);
    CFDictionaryAddValue(v4, @"VCVSTxAvgBitrate", v13);
    CFRelease(v13);
    CFStringRef v14 = CFStringCreateWithFormat(v11, 0, @"%u", [(VCMediaStreamStats *)self->_stats maxBitrateKbps]);
    CFDictionaryAddValue(v4, @"VCVSTxMaxBitrate", v14);
    CFRelease(v14);
    [(VCMediaStreamStats *)self->_stats setMaxBitrateKbps:0];
    CFStringRef v15 = CFStringCreateWithFormat(v11, 0, @"%u", [(VCMediaStreamStats *)self->_stats minBitrateKbps]);
    CFDictionaryAddValue(v4, @"VCVSTxMinBitrate", v15);
    CFRelease(v15);
    [(VCMediaStreamStats *)self->_stats setMinBitrateKbps:0xFFFFFFFFLL];
    [(VCMediaStreamStats *)self->_stats getFramerateSinceTime:self->_reportingIntervalStartTime];
    CFStringRef v17 = CFStringCreateWithFormat(v11, 0, @"%5.2f", v16);
    CFDictionaryAddValue(v4, @"VCVSTxAvgFramerate", v17);
    CFRelease(v17);
    [(VCMediaStreamStats *)self->_stats maxFramerate];
    CFStringRef v19 = CFStringCreateWithFormat(v11, 0, @"%5.2f", v18);
    CFDictionaryAddValue(v4, @"VCVSTxMaxFramerate", v19);
    CFRelease(v19);
    [(VCMediaStreamStats *)self->_stats setMaxFramerate:0.0];
    [(VCMediaStreamStats *)self->_stats minFramerate];
    CFStringRef v21 = CFStringCreateWithFormat(v11, 0, @"%5.2f", v20);
    CFDictionaryAddValue(v4, @"VCVSTxMinFramerate", v21);
    CFRelease(v21);
    [(VCMediaStreamStats *)self->_stats setMinFramerate:1.79769313e308];
    CFStringRef v22 = CFStringCreateWithFormat(v11, 0, @"%d", self->_totalKeyFramesSent);
    CFDictionaryAddValue(v4, @"VCVSTxKeyFramesSent", v22);
    CFRelease(v22);
    self->_reportingIntervalStartTime = v5;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      long long v24 = *MEMORY[0x1E4F47A50];
      int v25 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v26 = objc_msgSend((id)-[__CFDictionary description](v4, "description"), "UTF8String");
          *(_DWORD *)CMTime buf = 136315906;
          uint64_t v28 = v23;
          __int16 v29 = 2080;
          int v30 = "-[VCVideoStreamTransmitter gatherRealtimeStats:]";
          __int16 v31 = 1024;
          int v32 = 754;
          __int16 v33 = 2080;
          uint64_t v34 = v26;
          _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Tx RTCReporting:%s", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        [(VCVideoStreamTransmitter *)v23 gatherRealtimeStats:v24];
      }
    }
  }
}

- (void)reportingVideoStreamEvent:(unsigned __int16)a3
{
  int v3 = a3;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (v3 == 228)
  {
    CFStringRef v7 = CFStringCreateWithFormat(v5, 0, @"%zu", self->_lastKeyFrameSampleBufferSize);
    CFDictionaryAddValue(Mutable, @"VCVSKeyFrameSize", v7);
    CFRelease(v7);
  }
  reportingVideoStreamEvent();

  CFRelease(Mutable);
}

- (void)handleActiveConnectionChange:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      uint64_t v8 = "-[VCVideoStreamTransmitter handleActiveConnectionChange:]";
      __int16 v9 = 1024;
      int v10 = 777;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Handling active connection change is not implemented for VCVST", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)initWithConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Configuration pointer is nil", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:.cold.2()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v3 = "-[VCVideoStreamTransmitter initWithConfig:]";
  __int16 v4 = 1024;
  int v5 = 163;
  __int16 v6 = v0;
  __int16 v7 = "com.apple.AVConference.VCVideoStreamTransmitter.encoderThread";
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to create thread \"%s\"", v2, 0x26u);
}

- (void)initWithConfig:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create video packet allocator: %d", v2, v3, v4, v5);
}

- (void)initWithConfig:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create buffer queue", v2, v3, v4, v5, v6);
}

void __55__VCVideoStreamTransmitter_setTemporaryMaximumBitrate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate bitRate array", v2, v3, v4, v5, v6);
}

void __55__VCVideoStreamTransmitter_setTemporaryMaximumBitrate___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create bitRate value", v2, v3, v4, v5, v6);
}

- (void)setFECRedundancyVector:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Not implemented!", v2, v3, v4, v5, v6);
}

- (void)setMediaSuggestion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Not implemented!", v2, v3, v4, v5, v6);
}

- (void)setEncodingMode:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Not implemented!", v2, v3, v4, v5, v6);
}

- (void)handleThermalLevelChange:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Not implemented!", v2, v3, v4, v5, v6);
}

- (void)updateWindowState:isLocal:windowRect:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Not implemented!", v2, v3, v4, v5, v6);
}

- (void)encodeVideoFrame:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to get image buffer", v2, v3, v4, v5, v6);
}

- (void)transmitEncodedVideoFrame:cameraStatusBits:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d sendFrame: Error while getting image buffer data", v2, v3, v4, v5, v6);
}

- (void)transmitEncodedVideoFrame:cameraStatusBits:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed To Prepend SPS/PPS", v2, v3, v4, v5, v6);
}

- (void)transmitEncodedVideoFrame:cameraStatusBits:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d sendFrame: Error: Error getting data buffer", v2, v3, v4, v5, v6);
}

- (void)transmitEncodedVideoFrame:size:timestamp:hostTime:cameraStatusBits:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d RTPGetIsIPv6 failed %d", v2, v3, v4, v5);
}

- (void)transmitEncodedVideoFrame:size:timestamp:hostTime:cameraStatusBits:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VTU_SplitVideoIntoPackets returned 0", v2, v3, v4, v5, v6);
}

- (void)gatherRealtimeStats:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v4 = 136315906;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  __int16 v7 = "-[VCVideoStreamTransmitter gatherRealtimeStats:]";
  __int16 v8 = 1024;
  int v9 = 754;
  __int16 v10 = 2080;
  uint64_t v11 = objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
  _os_log_debug_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Tx RTCReporting:%s", (uint8_t *)&v4, 0x26u);
}

@end