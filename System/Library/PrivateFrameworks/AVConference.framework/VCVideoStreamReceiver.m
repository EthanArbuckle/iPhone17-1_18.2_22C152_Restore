@interface VCVideoStreamReceiver
- (BOOL)canDequeue:(opaqueCMBufferQueue *)a3 forTimestamp:(unsigned int)a4;
- (BOOL)handleRemoteVideoAttributesChange:(__CVBuffer *)a3;
- (BOOL)startSynchronization:(id)a3;
- (VCVideoStreamReceiver)initWithConfig:(tagVCVideoStreamReceiverConfig *)a3;
- (id)syncSource;
- (int)createDecodeSession:(opaqueCMFormatDescription *)a3;
- (int)decodeFrame:(opaqueCMSampleBuffer *)a3 showFrame:(BOOL)a4;
- (int)processVideoRTCP;
- (int)processVideoRTP;
- (int)scheduleDecodeForFrameWithBuffer:(VCVideoReceiverSampleBuffer_t *)a3 timestamp:(unsigned int)a4 hostTime:(double)a5 showFrame:(BOOL)a6;
- (int)showDecodedFrame:(__CVBuffer *)a3 atTime:(id *)a4;
- (int)startNetworkReceiveThread;
- (int)stopNetworkReceiveThread;
- (tagVCVideoPacketBufferConfig)newVideoPacketBufferConfig:(SEL)a3;
- (void)dealloc;
- (void)dequeueAndDecodeForTimestamp:(unsigned int)a3;
- (void)gatherRealtimeStats:(__CFDictionary *)a3;
- (void)handleActiveConnectionChange:(id)a3;
- (void)handleAlarmForTimeStamp:(unsigned int)a3;
- (void)networkReceivePackets;
- (void)processReceptionReportBlock:(tagRTCP_RRB *)a3 blockCount:(unsigned int)a4 arrivalNTPTime:(tagNTP)a5;
- (void)processVideoRTP;
- (void)reportVideoStallStatus:(BOOL)a3;
- (void)reportingVideoStreamEvent:(unsigned __int16)a3;
- (void)rtcpSendIntervalElapsed;
- (void)scheduleDecodeForTimestamp:(unsigned int)a3;
- (void)scheduleVideoDecode:(unsigned int)a3;
- (void)setDeferredAssemblyEnabled:(BOOL)a3;
- (void)setEnableCVO:(BOOL)a3 cvoExtensionID:(unint64_t)a4;
- (void)setEnableRateAdaptation:(BOOL)a3 maxBitrate:(unsigned int)a4 minBitrate:(unsigned int)a5 adaptationInterval:(double)a6;
- (void)setJitterBufferMode:(int)a3;
- (void)setLooseAVSyncEnabled:(BOOL)a3;
- (void)setSyncSource:(id)a3;
- (void)startVideo;
- (void)stopSynchronization;
- (void)stopVideo;
- (void)teardownDecodeSession:(BOOL)a3;
- (void)updateSequenceNumber:(unsigned __int16)a3;
- (void)updateVideoStallStatus:(BOOL)a3;
@end

@implementation VCVideoStreamReceiver

- (VCVideoStreamReceiver)initWithConfig:(tagVCVideoStreamReceiverConfig *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoStreamReceiver initWithConfig:]();
      }
    }
    goto LABEL_17;
  }
  id var1 = a3->var1;
  if (!var1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoStreamReceiver initWithConfig:]();
      }
    }
LABEL_17:

    return 0;
  }
  v16.receiver = self;
  v16.super_class = (Class)VCVideoStreamReceiver;
  v6 = [(VCVideoReceiverBase *)&v16 initWithDelegate:var1 delegateFunctions:&a3->var2];
  v7 = v6;
  if (v6)
  {
    v6->_hRTP = a3->var0;
    v6->_receivedFirstPacket = 0;
    v6->_stats = objc_alloc_init(VCMediaStreamStats);
    var3 = a3->var3;
    if (var3) {
      var3 = (opaqueRTCReporting *)CFRetain(var3);
    }
    v7->_reportingAgent = var3;
    v7->_reportingModuleID = VCReporting_GetDynamicReportingModuleID();
    reportingInheritModuleSpecificInfoFromParent();
    v9 = (VCVideoStreamRateAdaptation *)a3->var10;
    v7->_rateAdaptation = v9;
    [(VCVideoStreamRateAdaptation *)v9 setStats:v7->_stats];
    v7->_rtcpContext = a3->var8;
    v7->_rtcpPacketsCallback = a3->var9;
    CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CallbacksForUnsortedSampleBuffers = CMBufferQueueGetCallbacksForUnsortedSampleBuffers();
    CMBufferQueueCreate(v10, 0, CallbacksForUnsortedSampleBuffers, &v7->_videoQueue);
    v12 = CMMemoryPoolCreate(0);
    v7->_blockBufferMemoryPool = v12;
    CFAllocatorRef Allocator = CMMemoryPoolGetAllocator(v12);
    v7->_blockBufferMemoryPoolCFAllocatorRef Allocator = Allocator;
    CFRetain(Allocator);
    pthread_mutex_init(&v7->_decompressionSessionMutex, 0);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v7->_videoStreamReceiverQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVideoReceiver.videoStreamReceiverQueue", 0, CustomRootQueue);
    v7->_enableReceiveBitstreamDump = [+[VCDefaults sharedInstance] enableRxDecodeYUVDump] != 0;
    v7->super._rtpTimestampRate = 90000;
    if (a3->var7 && (VCTransportStreamRunLoopVTPCreate(v10, &v7->_runLoop) & 0x80000000) != 0)
    {

      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCVideoStreamReceiver initWithConfig:]();
        }
      }
      return 0;
    }
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [(VCVideoStreamReceiver *)self stopNetworkReceiveThread];
  [(VCVideoStreamReceiver *)self stopSynchronization];
  [(VCVideoStreamReceiver *)self teardownDecodeSession:0];
  pthread_mutex_destroy(&self->_decompressionSessionMutex);
  videoPacketBuffer = self->_videoPacketBuffer;
  if (videoPacketBuffer)
  {
    VideoPacketBuffer_Destroy((uint64_t)videoPacketBuffer);
    self->_videoPacketBuffer = 0;
  }

  formatDescription = self->_formatDescription;
  if (formatDescription) {
    CFRelease(formatDescription);
  }
  blockBufferMemoryPoolCFAllocatorRef Allocator = self->_blockBufferMemoryPoolAllocator;
  if (blockBufferMemoryPoolAllocator)
  {
    CFRelease(blockBufferMemoryPoolAllocator);
    self->_blockBufferMemoryPoolCFAllocatorRef Allocator = 0;
  }
  blockBufferMemoryPool = self->_blockBufferMemoryPool;
  if (blockBufferMemoryPool)
  {
    CMMemoryPoolInvalidate(blockBufferMemoryPool);
    v7 = self->_blockBufferMemoryPool;
    if (v7)
    {
      CFRelease(v7);
      self->_blockBufferMemoryPool = 0;
    }
  }
  videoQueue = self->_videoQueue;
  if (videoQueue) {
    CFRelease(videoQueue);
  }
  dispatch_release((dispatch_object_t)self->_videoStreamReceiverQueue);
  reportingCacheModuleSpecificInfo();
  reportingAgent = self->_reportingAgent;
  if (reportingAgent) {
    CFRelease(reportingAgent);
  }
  runLoop = self->_runLoop;
  if (runLoop) {
    CFRelease(runLoop);
  }

  v11.receiver = self;
  v11.super_class = (Class)VCVideoStreamReceiver;
  [(VCVideoReceiverBase *)&v11 dealloc];
}

- (void)setEnableCVO:(BOOL)a3 cvoExtensionID:(unint64_t)a4
{
  self->_enableCVO = a3;
  self->_cvoExtensionID = a4;
}

- (void)setEnableRateAdaptation:(BOOL)a3 maxBitrate:(unsigned int)a4 minBitrate:(unsigned int)a5 adaptationInterval:(double)a6
{
}

- (void)startVideo
{
  [(VCVideoStreamReceiver *)self startNetworkReceiveThread];

  reportingRegisterPeriodicTaskWeak();
}

uint64_t __35__VCVideoStreamReceiver_startVideo__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "gatherRealtimeStats:");
}

- (void)stopVideo
{
  if (self->_reportingAgent) {
    reportingUnregisterPeriodicTask();
  }
  [(VCVideoStreamReceiver *)self stopNetworkReceiveThread];
  [(VCVideoStreamReceiver *)self stopSynchronization];
  [(VCVideoStreamReceiver *)self teardownDecodeSession:1];
  videoPacketBuffer = self->_videoPacketBuffer;
  if (videoPacketBuffer)
  {
    VideoPacketBuffer_Destroy((uint64_t)videoPacketBuffer);
    self->_videoPacketBuffer = 0;
  }
}

- (BOOL)startSynchronization:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)VCVideoStreamReceiver;
  BOOL v4 = [(VCVideoReceiverBase *)&v8 startSynchronization:a3];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46__VCVideoStreamReceiver_startSynchronization___block_invoke;
    v7[3] = &unk_1E6DB6950;
    v7[4] = v5;
    VCMediaStreamSynchronizer_setDestinationAlarmHandler((uint64_t)self->super._mediaStreamSynchronizer, v7);
  }
  return v4;
}

void __46__VCVideoStreamReceiver_startSynchronization___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0)
  {
    id v5 = (id)MEMORY[0x1E4E56580]([*(id *)(a1 + 32) weak]);
    [v5 handleAlarmForTimeStamp:a2];
  }
}

- (void)stopSynchronization
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  VCMediaStreamSynchronizer_setDestinationAlarmHandler((uint64_t)self->super._mediaStreamSynchronizer, 0);
  v3.receiver = self;
  v3.super_class = (Class)VCVideoStreamReceiver;
  [(VCVideoReceiverBase *)&v3 stopSynchronization];
}

- (id)syncSource
{
  return objc_loadWeak((id *)&self->super._syncSource);
}

- (void)setSyncSource:(id)a3
{
}

- (int)startNetworkReceiveThread
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  videoStreamReceiverQueue = self->_videoStreamReceiverQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__VCVideoStreamReceiver_startNetworkReceiveThread__block_invoke;
  block[3] = &unk_1E6DB3EB8;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(videoStreamReceiverQueue, block);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __50__VCVideoStreamReceiver_startNetworkReceiveThread__block_invoke(uint64_t a1)
{
  v6[1] = *(const void **)MEMORY[0x1E4F143B8];
  *(_WORD *)(*(void *)(a1 + 32) + 210) = 0;
  *(_DWORD *)(*(void *)(a1 + 32) + 212) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 216) = 0;
  *(void *)(*(void *)(a1 + 32) + 224) = 0;
  double v2 = micro();
  *(double *)(*(void *)(a1 + 32) + 64) = v2;
  *(double *)(*(void *)(a1 + 32) + 72) = v2;
  *(unsigned char *)(*(void *)(a1 + 32) + 208) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 209) = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(void *)(v3 + 440))
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 292) = VTP_Socket(2, 1, 6);
    uint64_t v3 = *(void *)(a1 + 32);
    if (*(_DWORD *)(v3 + 292) == -1)
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *__error() | 0xC01F0000;
      uint64_t v3 = *(void *)(a1 + 32);
    }
  }
  if (!*(void *)(v3 + 280))
  {
    v6[0] = @"com.apple.AVConference.VCVideoReceiver.NetworkReceiveProc";
    CFDictionaryRef v4 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], MEMORY[0x1E4F21EA8], v6, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    *(unsigned char *)(*(void *)(a1 + 32) + 288) = 1;
    int v5 = FigThreadCreate();
    if (v4) {
      CFRelease(v4);
    }
    if (v5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __50__VCVideoStreamReceiver_startNetworkReceiveThread__block_invoke_cold_1();
        }
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5 | 0xA01F0000;
    }
  }
}

- (int)stopNetworkReceiveThread
{
  v4[5] = *MEMORY[0x1E4F143B8];
  videoStreamReceiverQueue = self->_videoStreamReceiverQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__VCVideoStreamReceiver_stopNetworkReceiveThread__block_invoke;
  v4[3] = &unk_1E6DB3DC8;
  v4[4] = self;
  dispatch_sync(videoStreamReceiverQueue, v4);
  return 0;
}

void __49__VCVideoStreamReceiver_stopNetworkReceiveThread__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 288) = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 440);
  if (v3)
  {
    CFDictionaryRef v4 = *(void (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable() + 16) + 32);
    if (v4) {
      v4(v3);
    }
  }
  else
  {
    int v5 = *(_DWORD *)(v2 + 292);
    if (v5 != -1)
    {
      VTP_Close(v5);
      *(_DWORD *)(*(void *)(a1 + 32) + 292) = -1;
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(void *)(v6 + 280))
  {
    FigThreadJoin();
    *(void *)(*(void *)(a1 + 32) + 280) = 0;
    uint64_t v6 = *(void *)(a1 + 32);
  }
  uint64_t v7 = *(void *)(v6 + 296);
  if (v7)
  {
    VideoPacketBuffer_Destroy(v7);
    *(void *)(*(void *)(a1 + 32) + 296) = 0;
  }
}

- (void)networkReceivePackets
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  while (self->_runNetworkReceiveThread)
  {
    unsigned int v7 = 48;
    hRTP = self->_hRTP;
    runLoop = self->_runLoop;
    if (runLoop)
    {
      if ((RTPGetReceiveStatusWithRunLoop((uint64_t)&hRTP, &v7, 1, (uint64_t)runLoop) & 0x80000000) == 0) {
        goto LABEL_4;
      }
    }
    else if ((RTPGetReceiveStatus((uint64_t)&hRTP, &v7, 1, self->_sRecvReset) & 0x80000000) == 0)
    {
LABEL_4:
      char v4 = v7;
      if ((v7 & 0x10) != 0)
      {
        [(VCVideoStreamReceiver *)self processVideoRTP];
        char v4 = v7;
      }
      if ((v4 & 0x20) != 0) {
        [(VCVideoStreamReceiver *)self processVideoRTCP];
      }
      continue;
    }
    usleep(0x2710u);
  }
  return 0;
}

- (void)updateSequenceNumber:(unsigned __int16)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int sequenceNumberOutOfOrder = self->_sequenceNumberOutOfOrder;
  if (sequenceNumberOutOfOrder != -1)
  {
    if (sequenceNumberOutOfOrder == a3 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      unsigned int v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int lastSequenceNumber = self->_lastSequenceNumber;
        int v10 = 136316162;
        uint64_t v11 = v6;
        __int16 v12 = 2080;
        v13 = "-[VCVideoStreamReceiver updateSequenceNumber:]";
        __int16 v14 = 1024;
        int v15 = 381;
        __int16 v16 = 1024;
        int v17 = sequenceNumberOutOfOrder;
        __int16 v18 = 1024;
        int v19 = lastSequenceNumber;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Out of order packets[%d,%d]", (uint8_t *)&v10, 0x28u);
      }
    }
    self->_int sequenceNumberOutOfOrder = -1;
  }
  unsigned __int16 v9 = self->_lastSequenceNumber;
  if ((unsigned __int16)(a3 - v9) == 2)
  {
    self->_int sequenceNumberOutOfOrder = (unsigned __int16)(v9 + 1);
  }
  else if ((__int16)(a3 - v9) < 0)
  {
    return;
  }
  self->_int lastSequenceNumber = a3;
}

- (void)scheduleDecodeForTimestamp:(unsigned int)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  while (1)
  {
    int v14 = -1;
    int v15 = 0;
    int v16 = -1431655936;
    double v5 = micro();
    v13 = 0;
    int v12 = 1;
    int NextFrame = VideoPacketBuffer_GetNextFrame((uint64_t)self->_videoPacketBuffer, a3, 0, &v14, &v12, &v15, 0, 0, &v16, &v13, 0, 0);
    unsigned int v7 = v16;
    if ((v16 & 0x80) != 0)
    {
      self->super._remoteVideoOrientation = v16 & 3;
      self->_remoteVideoCamera = (v7 >> 3) & 1;
      self->_remoteVideoMirrored = (v7 & 4) != 0;
    }
    int v8 = v14;
    if (v14 != -1) {
      break;
    }
LABEL_7:
    if (!NextFrame) {
      goto LABEL_18;
    }
LABEL_8:
    if (v13[14])
    {
      -[VCVideoStreamReceiver scheduleDecodeForFrameWithBuffer:timestamp:hostTime:showFrame:](self, "scheduleDecodeForFrameWithBuffer:timestamp:hostTime:showFrame:", 0.0);
      if (v8 == -1) {
        [(VCMediaStreamStats *)self->_stats recordDataWithSize:(double)atomic_fetch_and_explicit((atomic_uint *volatile)&self->_receivedBytes, 0, memory_order_relaxed) atTime:v5];
      }
    }
    VCVideoReceiverSampleBuffer_Destroy(&v13);
  }
  if (v14)
  {
    RTCPSetSendPLI();
    [(VCVideoStreamReceiver *)self updateVideoStallStatus:1];
    goto LABEL_7;
  }
  ++self->_firSequenceNumber;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    int v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int firSequenceNumber = self->_firSequenceNumber;
      *(_DWORD *)buf = 136315906;
      *(void *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCVideoStreamReceiver scheduleDecodeForTimestamp:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 428;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = firSequenceNumber;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Sending RTCP PSFB FIR(%d)", buf, 0x22u);
    }
  }
  memset(buf, 0, sizeof(buf));
  uint64_t v25 = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  buf[24] = self->_firSequenceNumber;
  *(_DWORD *)buf = 64;
  if ((RTPSendControlPacket((uint64_t)self->_hRTP, (int *)buf) & 0x80000000) == 0) {
    [(VCVideoStreamReceiver *)self reportingVideoStreamEvent:221];
  }
  if (NextFrame) {
    goto LABEL_8;
  }
LABEL_18:
  VCVideoReceiverSampleBuffer_Destroy(&v13);
}

- (void)scheduleVideoDecode:(unsigned int)a3
{
  unsigned int mostRecentTimestamp = self->_mostRecentTimestamp;
  if (!mostRecentTimestamp
    || (a3 != mostRecentTimestamp ? (BOOL v4 = a3 - mostRecentTimestamp > 0x7FFFFFFE) : (BOOL v4 = 1), !v4))
  {
    self->_unsigned int mostRecentTimestamp = a3;
    unsigned int mostRecentTimestamp = a3;
  }
  unsigned int lastVideoTimestamp = self->_lastVideoTimestamp;
  BOOL v6 = mostRecentTimestamp >= lastVideoTimestamp;
  unsigned int v7 = mostRecentTimestamp - lastVideoTimestamp;
  if (!v6 && v7 <= 0x7FFFFFFE)
  {
    ++self->_videoTimestampWrapCount;
    unsigned int mostRecentTimestamp = self->_mostRecentTimestamp;
  }
  self->_unsigned int lastVideoTimestamp = mostRecentTimestamp;
  -[VCVideoStreamReceiver scheduleDecodeForTimestamp:](self, "scheduleDecodeForTimestamp:");
}

- (tagVCVideoPacketBufferConfig)newVideoPacketBufferConfig:(SEL)a3
{
  *(void *)&retstr->var16.rttForRTxFulfillmentWaitTime = 0;
  *(_OWORD *)&retstr->var16.nackThrottlingFactorBuckets[2] = 0u;
  *(_OWORD *)&retstr->var16.nackThrottlingPlrBuckets[2] = 0u;
  *(_OWORD *)&retstr->var15 = 0u;
  *(_OWORD *)&retstr->var16.nackThrottlingBitRateLimitingMaxRatio = 0u;
  *(_OWORD *)&retstr->var12.id var1 = 0u;
  *(_OWORD *)&retstr->var13.id var1 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var9 = 0u;
  *(_OWORD *)&retstr->var4[168] = 0u;
  *(_OWORD *)&retstr->var4[184] = 0u;
  *(_OWORD *)&retstr->var4[136] = 0u;
  *(_OWORD *)&retstr->var4[152] = 0u;
  *(_OWORD *)&retstr->var4[104] = 0u;
  *(_OWORD *)&retstr->var4[120] = 0u;
  *(_OWORD *)&retstr->var4[72] = 0u;
  *(_OWORD *)&retstr->var4[88] = 0u;
  *(_OWORD *)&retstr->var4[40] = 0u;
  *(_OWORD *)&retstr->var4[56] = 0u;
  *(_OWORD *)&retstr->var4[8] = 0u;
  *(_OWORD *)&retstr->var4[24] = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
  retstr->var0 = a4->var3;
  retstr->id var1 = a4->var4;
  retstr->var2 = 90000;
  strcpy(retstr->var4, "video-stream-receiver");
  *(_WORD *)&retstr->var6 = 256;
  retstr->var9 = 0;
  result = (tagVCVideoPacketBufferConfig *)objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-video-enable-late-frame-recovery", @"enableLateVideoFrameRecovery", MEMORY[0x1E4F1CC28], 0), "BOOLValue");
  retstr->var10 = (char)result;
  return result;
}

- (int)processVideoRTP
{
  uint64_t v2 = MEMORY[0x1F4188790](self);
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  memset(__b, 170, sizeof(__b));
  unsigned int v45 = 0;
  unsigned __int8 v44 = 0;
  uint64_t v48 = 0;
  memset(v47, 0, sizeof(v47));
  v43 = 0;
  int v3 = RTPRecvRTP(*(void *)(v2 + 112), &v43);
  if ((v3 & 0x80000000) == 0)
  {
    BOOL v4 = v43;
    if (*(unsigned char *)(v2 + 317))
    {
      int v5 = VCCVOExtensionUtils_CameraStatusBitsFromCVOExtension(*(unsigned __int8 *)(v2 + 320), v43[18], *((_DWORD *)v43 + 34), &v44);
      int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (!v5)
      {
        if (ErrorLogLevelForModule < 7) {
          goto LABEL_14;
        }
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        int v14 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTP]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 518;
        int v10 = " [%s] %s:%d Invalid header extension profile or CVO Extension ID";
        uint64_t v11 = v14;
        uint32_t v12 = 28;
        goto LABEL_11;
      }
      if (ErrorLogLevelForModule >= 8)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        int v8 = *MEMORY[0x1E4F47A50];
        uint64_t v9 = *MEMORY[0x1E4F47A50];
        if (!*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
            -[VCVideoStreamReceiver processVideoRTP].cold.5();
          }
          goto LABEL_14;
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          *(void *)&buf[4] = v7;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTP]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 516;
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = v44;
          int v10 = " [%s] %s:%d bCameraStatusBits = %x";
          uint64_t v11 = v8;
          uint32_t v12 = 34;
LABEL_11:
          _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
        }
      }
    }
LABEL_14:
    if ((int)VRTraceGetErrorLogLevelForModule() > 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      int v16 = *MEMORY[0x1E4F47A50];
      int v17 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          long long v18 = v4[20];
          *(_DWORD *)buf = 136315906;
          *(void *)&buf[4] = v15;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTP]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 522;
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = v18;
          _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d processVideoRTP called RTPRecvRTP packet (%d bytes)", buf, 0x22u);
        }
      }
      else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        -[VCVideoStreamReceiver processVideoRTP].cold.4();
      }
    }
    if (*((_DWORD *)v4 + 3) == 123)
    {
      if (v4[20])
      {
        atomic_fetch_add_explicit((atomic_uint *volatile)(v2 + 408), *((_DWORD *)v4 + 30), memory_order_relaxed);
        *(double *)(v2 + 64) = micro();
        __memcpy_chk();
        if (*(unsigned char *)(v2 + 208))
        {
          long long v19 = *(unsigned __int16 **)(v2 + 296);
        }
        else
        {
          *(unsigned char *)(v2 + 208) = 1;
          long long v19 = *(unsigned __int16 **)(v2 + 296);
          if (!v19)
          {
            memcpy(buf, &unk_1E259F560, 0x168uLL);
            [(id)v2 newVideoPacketBufferConfig:v4 + 1];
            long long v19 = VideoPacketBuffer_Create(buf);
            *(void *)(v2 + 296) = v19;
          }
          *(_WORD *)(v2 + 210) = *((_WORD *)v4 + 10) - 1;
          *(_DWORD *)(v2 + 212) = -1;
        }
        *(void *)&v39[2] = 0xAAAAAAAAAAAAAAAALL;
        v41 = v4 + 1;
        unint64_t v42 = 0xAAAAAAAAAAAAAA00;
        long long v34 = xmmword_1E259C140;
        v35 = v4 + 19;
        long long v36 = 0xAAAAAAAA00000000;
        int v37 = 0;
        __int16 v38 = v44;
        *(_DWORD *)v39 = 0;
        v40 = v47;
        VideoPacketBuffer_AddPacket((uint64_t)v19, (int *)&v34, 0, 0, 0);
        if (VideoPacketBuffer_SchedulePastIncompleteFrame(*(void *)(v2 + 296), *((_DWORD *)v4 + 6), &v45, 0, 0, 0))
        {
          char v20 = 0;
          unsigned int v21 = 0;
          do
          {
            unsigned int v22 = v45;
            if ((v20 & 1) != 0 && v21 == v45) {
              break;
            }
            [(id)v2 scheduleVideoDecode:v45];
            char v23 = VideoPacketBuffer_SchedulePastIncompleteFrame(*(void *)(v2 + 296), *((_DWORD *)v4 + 6), &v45, 0, 0, 0);
            char v20 = 1;
            unsigned int v21 = v22;
          }
          while ((v23 & 1) != 0);
        }
        while (VideoPacketBuffer_ScheduleFutureFrame(*(void *)(v2 + 296), *((_DWORD *)v4 + 7), *((_DWORD *)v4 + 6), &v45, 0, 0, 0, *(double *)(v2 + 64)))[(id)v2 scheduleVideoDecode:v45];
        [(id)v2 updateSequenceNumber:*((unsigned __int16 *)v4 + 10)];
        [*(id *)(v2 + 232) updateRTPReceiveWithTimestamp:*((unsigned int *)v4 + 6) sampleRate:90000 time:*((unsigned int *)v4 + 40) size:*((_DWORD *)v4 + 2) > 0 endOfFrame:micro()];
        kdebug_trace();
        int v24 = 0;
      }
      else
      {
        int v24 = -2145452031;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v29 = VRTraceErrorLogLevelToCSTR();
          v30 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            int v31 = *((unsigned __int16 *)v4 + 10);
            int v32 = *((_DWORD *)v4 + 6);
            int v33 = *((_DWORD *)v4 + 3);
            *(_DWORD *)buf = 136316418;
            *(void *)&buf[4] = v29;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTP]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 528;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = v31;
            *(_WORD *)&buf[34] = 1024;
            *(_DWORD *)&buf[36] = v32;
            *(_WORD *)&buf[40] = 1024;
            *(_DWORD *)&buf[42] = v33;
            _os_log_error_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_ERROR, " [%s] %s:%d Received zero length packet (seq:%d, ts:%d, payload:%d)", buf, 0x2Eu);
          }
        }
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if (VRTraceIsOSFaultDisabled())
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCVideoStreamReceiver processVideoRTP]();
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          -[VCVideoStreamReceiver processVideoRTP]();
        }
      }
      int v24 = 15;
    }
    goto LABEL_35;
  }
  int v24 = v3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v26 = VRTraceErrorLogLevelToCSTR();
    v27 = *MEMORY[0x1E4F47A50];
    v28 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = v26;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTP]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 510;
        _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to read RTP packet", buf, 0x1Cu);
      }
    }
    else if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      -[VCVideoStreamReceiver processVideoRTP]();
    }
  }
LABEL_35:
  RTPReleaseRTPPacket(*(void *)(v2 + 112), (_DWORD **)&v43);
  return v24;
}

- (void)rtcpSendIntervalElapsed
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(VCVideoStreamRateAdaptation *)self->_rateAdaptation runVideoStreamRateAdaptation];
  int v4 = 0;
  RTPGetRTCPHasPendingPLI((uint64_t)self->_hRTP, &v4);
  uint64_t v8 = 0;
  memset(v7, 0, sizeof(v7));
  if ((RTPSendControlPacket((uint64_t)self->_hRTP, (int *)v7) & 0x80000000) == 0 && v4) {
    [(VCVideoStreamReceiver *)self reportingVideoStreamEvent:223];
  }
  if (v3)
  {
    v5[0] = 0x1F3D47B50;
    v6[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VCVideoStreamRateAdaptation operatingBitrate](self->_rateAdaptation, "operatingBitrate"));
    v5[1] = 0x1F3D47B30;
    v6[1] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VCVideoStreamRateAdaptation sendTmmbrBitrate](self->_rateAdaptation, "sendTmmbrBitrate"));
    v5[2] = 0x1F3D47B70;
    v6[2] = objc_msgSend(NSNumber, "numberWithBool:", -[VCVideoStreamRateAdaptation isOperatingAtMaxBitrate](self->_rateAdaptation, "isOperatingAtMaxBitrate"));
    v5[3] = 0x1F3D47B90;
    v6[3] = objc_msgSend(NSNumber, "numberWithBool:", -[VCVideoStreamRateAdaptation isOperatingAtMinBitrate](self->_rateAdaptation, "isOperatingAtMinBitrate"));
    -[VCVideoReceiverDelegate vcVideoReceiver:downlinkQualityDidChange:](-[VCVideoReceiverBase delegate](self, "delegate"), "vcVideoReceiver:downlinkQualityDidChange:", self, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:4]);
  }
}

- (void)processReceptionReportBlock:(tagRTCP_RRB *)a3 blockCount:(unsigned int)a4 arrivalNTPTime:(tagNTP)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int v17 = 0;
  if ((RTPGetLocalSSRC((uint64_t)self->_hRTP, &v17) & 0x80000000) != 0)
  {
    if ((VCVideoStreamReceiver *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return;
      }
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v19 = v10;
      __int16 v20 = 2080;
      unsigned int v21 = "-[VCVideoStreamReceiver processReceptionReportBlock:blockCount:arrivalNTPTime:]";
      __int16 v22 = 1024;
      int v23 = 617;
      uint32_t v12 = " [%s] %s:%d Could not get the local SSRC";
      uint64_t v13 = v11;
      uint32_t v14 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v9 = (__CFString *)[(VCVideoStreamReceiver *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v9 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return;
      }
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      int v16 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v19 = v15;
      __int16 v20 = 2080;
      unsigned int v21 = "-[VCVideoStreamReceiver processReceptionReportBlock:blockCount:arrivalNTPTime:]";
      __int16 v22 = 1024;
      int v23 = 617;
      __int16 v24 = 2112;
      uint64_t v25 = v9;
      __int16 v26 = 2048;
      v27 = self;
      uint32_t v12 = " [%s] %s:%d %@(%p) Could not get the local SSRC";
      uint64_t v13 = v16;
      uint32_t v14 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    return;
  }
  if (a4)
  {
    while (a3->var0 != v17)
    {
      ++a3;
      if (!--a4) {
        return;
      }
    }
    [(VCVideoReceiverBase *)self setRoundTripTime:(double)RTCPComputeRoundTripTimeMiddle32((uint64_t)a3, a5.wide) * 0.0000152587891];
  }
}

- (int)processVideoRTCP
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  bzero(&v87, 0x668uLL);
  int v3 = RTPRecvRTCP((uint64_t)self->_hRTP, &v87);
  if (v3 < 0) {
    return v3;
  }
  *(double *)&long long v4 = micro();
  *(void *)&self->super._lastReceivedVideoRTCPPacketTime = v4;
  if (!v88)
  {
    kdebug_trace();
    goto LABEL_72;
  }
  double v5 = *(double *)&v4;
  int v70 = v3;
  char v72 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 2;
  *(void *)&long long v4 = 136316930;
  long long v69 = v4;
  while (2)
  {
    uint64_t v9 = (unsigned __int16 *)*(&v87 + v8);
    unsigned int v10 = *v9;
    switch(v10 >> 8)
    {
      case 0xC0u:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v11 = VRTraceErrorLogLevelToCSTR();
          uint32_t v12 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = v11;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTCP]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 728;
            uint64_t v13 = v12;
            uint32_t v14 = " [%s] %s:%d Received RTCP FIR RFC 2032";
            goto LABEL_28;
          }
        }
        goto LABEL_65;
      case 0xC1u:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v15 = VRTraceErrorLogLevelToCSTR();
          int v16 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = v15;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTCP]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 732;
            uint64_t v13 = v16;
            uint32_t v14 = " [%s] %s:%d Received RTCP NACK RFC 2032";
            goto LABEL_28;
          }
        }
        goto LABEL_65;
      case 0xC8u:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v20 = VRTraceErrorLogLevelToCSTR();
          unsigned int v21 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = v20;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTCP]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 651;
            _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received RTCP SR", buf, 0x1Cu);
          }
        }
        int v22 = *((_DWORD *)v9 + 4);
        double v23 = NTPToMicro(*((unsigned int *)v9 + 3) | ((unint64_t)*((unsigned int *)v9 + 2) << 32));
        [(VCVideoStreamReceiver *)self processReceptionReportBlock:v9 + 14 blockCount:*v9 & 0x1F arrivalNTPTime:v87];
        if (self->super._mediaStreamSynchronizer)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v24 = VRTraceErrorLogLevelToCSTR();
            uint64_t v25 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              mediaStreamSynchronizer = self->super._mediaStreamSynchronizer;
              *(_DWORD *)buf = 136316674;
              *(void *)&uint8_t buf[4] = v24;
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTCP]";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 662;
              *(_WORD *)&buf[28] = 2048;
              *(void *)&buf[30] = self;
              *(_WORD *)&buf[38] = 2048;
              *(void *)&buf[40] = mediaStreamSynchronizer;
              *(_WORD *)&uint8_t buf[48] = 2048;
              *(double *)&buf[50] = v23;
              *(_WORD *)&buf[58] = 1024;
              *(_DWORD *)&buf[60] = v22;
              _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VideoStreamReceiver (%p) updating MediaStreamSynchronizer (%p) with ntpTime=%.6f and rtpTimeStamp=%u", buf, 0x40u);
            }
          }
          VCMediaStreamSynchronizer_updateDestinationNTPTime((uint64_t)self->super._mediaStreamSynchronizer, v22, v23);
        }
        goto LABEL_65;
      case 0xC9u:
        [(VCVideoStreamReceiver *)self processReceptionReportBlock:v9 + 4 blockCount:v10 & 0x1F arrivalNTPTime:v87];
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v27 = VRTraceErrorLogLevelToCSTR();
          uint64_t v28 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = v27;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTCP]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 669;
            uint64_t v13 = v28;
            uint32_t v14 = " [%s] %s:%d Received RTCP RR";
            goto LABEL_28;
          }
        }
        goto LABEL_65;
      case 0xCAu:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v29 = VRTraceErrorLogLevelToCSTR();
          v30 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = v29;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTCP]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 673;
            uint64_t v13 = v30;
            uint32_t v14 = " [%s] %s:%d Received RTCP SDES";
LABEL_28:
            uint32_t v31 = 28;
            goto LABEL_57;
          }
        }
        goto LABEL_65;
      case 0xCCu:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v32 = VRTraceErrorLogLevelToCSTR();
          int v33 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = v32;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTCP]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 736;
            _os_log_impl(&dword_1E1EA4000, v33, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received RTCP APP", buf, 0x1Cu);
          }
        }
        if (*((_DWORD *)v9 + 2) == 1380144204)
        {
          int v79 = -1431655766;
          *(void *)&long long v78 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v78 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v34 = *(_OWORD *)(v9 + 6);
          int v79 = *((_DWORD *)v9 + 7);
          long long v78 = v34;
          memset(v80, 0, sizeof(v80));
          __int16 v74 = 0;
          int v73 = 16843010;
          VCMediaControlInfoUnserializeWithData((uint64_t)v80, (unsigned __int16 *)&v78, 0x14uLL, (unsigned __int8 *)&v73);
          uint64_t v35 = v7;
          int v36 = *(unsigned __int16 *)&v80[24];
          double v37 = RTPUnpackDouble(*(unsigned int *)&v80[28]);
          rateAdaptation = self->_rateAdaptation;
          *(void *)buf = 2;
          *(double *)&buf[8] = v5;
          *(void *)&buf[16] = 0;
          *(_DWORD *)&buf[24] = v36;
          *(_DWORD *)&buf[28] = *(_DWORD *)&v80[20];
          uint64_t v7 = v35;
          *(_DWORD *)&buf[32] = *(unsigned __int16 *)&v80[2];
          *(_DWORD *)&buf[36] = 0;
          *(_DWORD *)&buf[40] = *(unsigned __int16 *)&v80[4];
          *(void *)&buf[44] = 0;
          *(_DWORD *)&buf[60] = 0;
          LODWORD(v76) = 0;
          *(void *)&buf[52] = *(unsigned __int16 *)&v80[10] + *(unsigned __int16 *)&v80[6];
          DWORD1(v76) = *(unsigned __int16 *)v80;
          *((void *)&v76 + 1) = 0;
          *(double *)v77 = v37;
          memset((char *)v77 + 8, 0, 80);
          *(_OWORD *)((char *)&v77[5] + 8) = 0u;
          *(_OWORD *)((char *)&v77[6] + 8) = 0u;
          [(VCVideoStreamRateAdaptation *)rateAdaptation updateRateControlInfoWithStatisticsMessage:buf];
        }
        goto LABEL_65;
      case 0xCDu:
        int v39 = v10 & 0x1F;
        if (v39 == 4)
        {
          uint64_t v40 = v6;
          unsigned int v54 = *((_DWORD *)v9 + 4);
          int v55 = (v54 >> 9) & 0x1FFFF;
          uint64_t v41 = (v55 << (v54 >> 26));
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            uint64_t v56 = VRTraceErrorLogLevelToCSTR();
            v57 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316674;
              *(void *)&uint8_t buf[4] = v56;
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTCP]";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 719;
              *(_WORD *)&buf[28] = 1024;
              *(_DWORD *)&buf[30] = v55 << (v54 >> 26);
              *(_WORD *)&buf[34] = 1024;
              *(_DWORD *)&buf[36] = (v54 >> 9) & 0x1FFFF;
              *(_WORD *)&buf[40] = 1024;
              *(_DWORD *)&buf[42] = v54 >> 26;
              *(_WORD *)&buf[46] = 1024;
              *(_DWORD *)&uint8_t buf[48] = v54 & 0x1FF;
              _os_log_impl(&dword_1E1EA4000, v57, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received TMMBN:%d, mantissa:%d, exponent:%d, overhead:%d", buf, 0x34u);
            }
          }
          -[VCVideoStreamRateAdaptation receivedTMMBN:](self->_rateAdaptation, "receivedTMMBN:", (v55 << (v54 >> 26)), v69);
          goto LABEL_52;
        }
        if (v39 == 3)
        {
          uint64_t v40 = v6;
          uint64_t v41 = v7;
          long long v76 = 0u;
          memset(v77, 0, 88);
          memset(buf, 0, sizeof(buf));
          unsigned int v42 = *((_DWORD *)v9 + 4);
          int v43 = (v42 >> 9) & 0x1FFFF;
          *(_DWORD *)buf = 16;
          unsigned int v71 = v43 << (v42 >> 26);
          *(_DWORD *)&uint8_t buf[48] = [(VCVideoReceiverDelegate *)[(VCVideoReceiverBase *)self delegate] vcVideoReceiver:self receivedTMMBR:v71];
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            uint64_t v44 = VRTraceErrorLogLevelToCSTR();
            unsigned int v45 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v80 = v69;
              *(void *)&v80[4] = v44;
              *(_WORD *)&v80[12] = 2080;
              *(void *)&v80[14] = "-[VCVideoStreamReceiver processVideoRTCP]";
              *(_WORD *)&v80[22] = 1024;
              *(_DWORD *)&v80[24] = 708;
              *(_WORD *)&v80[28] = 1024;
              *(_DWORD *)&v80[30] = v43 << (v42 >> 26);
              *(_WORD *)&v80[34] = 1024;
              *(_DWORD *)&v80[36] = (v42 >> 9) & 0x1FFFF;
              __int16 v81 = 1024;
              unsigned int v82 = v42 >> 26;
              __int16 v83 = 1024;
              int v84 = v42 & 0x1FF;
              __int16 v85 = 1024;
              int v86 = *(_DWORD *)&buf[48];
              _os_log_impl(&dword_1E1EA4000, v45, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received TMMBR:%d, mantissa:%d, exponent:%d, overhead:%d adjusted TMMBN bitrate:%d", v80, 0x3Au);
            }
          }
          RTPSendControlPacket((uint64_t)self->_hRTP, (int *)buf);
LABEL_52:
          uint64_t v7 = v41;
          uint64_t v6 = v40;
          goto LABEL_65;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v58 = VRTraceErrorLogLevelToCSTR();
          v59 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v60 = *v9 & 0x1F;
            *(_DWORD *)buf = 136315906;
            *(void *)&uint8_t buf[4] = v58;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTCP]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 723;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = v60;
            uint64_t v13 = v59;
            uint32_t v14 = " [%s] %s:%d Received unknown RTCP RTPFB:%d";
            goto LABEL_56;
          }
        }
LABEL_65:
        unint64_t v66 = v8++ - 1;
        if (v66 < v88) {
          continue;
        }
        if (v7)
        {
          kdebug_trace();
          int v3 = v70;
        }
        else
        {
          int v3 = v70;
          kdebug_trace();
        }
        if (v72)
        {
          v67 = (void *)MEMORY[0x1E4E56580](&self->super._delegate);
          [v67 vcVideoReceiverRequestKeyFrame:self rtcpPSFBType:v6];
        }
LABEL_72:
        ((void (*)(void *, uint64_t *))self->_rtcpPacketsCallback)(self->_rtcpContext, &v87);
        RTCPCleanupPacketList((uint64_t)&v87);
        return v3;
      case 0xCEu:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v46 = VRTraceErrorLogLevelToCSTR();
          v47 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v48 = *v9 & 0x1F;
            *(_DWORD *)buf = 136315906;
            *(void *)&uint8_t buf[4] = v46;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTCP]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 677;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = v48;
            _os_log_impl(&dword_1E1EA4000, v47, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received RTCP PSFB:%d", buf, 0x22u);
          }
        }
        uint64_t v6 = *v9 & 0x1F;
        if (v6 == 4)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() > 6)
          {
            uint64_t v49 = VRTraceErrorLogLevelToCSTR();
            uint64_t v50 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v51 = v7;
              double lastFIRArrivalTime = self->_lastFIRArrivalTime;
              [(VCVideoReceiverBase *)self roundTripTime];
              *(_DWORD *)buf = 136316418;
              *(void *)&uint8_t buf[4] = v49;
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTCP]";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 680;
              *(_WORD *)&buf[28] = 2048;
              *(double *)&buf[30] = v5;
              *(_WORD *)&buf[38] = 2048;
              *(double *)&buf[40] = lastFIRArrivalTime;
              uint64_t v7 = v51;
              *(_WORD *)&uint8_t buf[48] = 2048;
              *(void *)&buf[50] = v53;
              _os_log_impl(&dword_1E1EA4000, v50, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d currentTime=%.3f, lastFIRArrivalTime=%.3f, dRTT=%.3f", buf, 0x3Au);
            }
          }
          double v61 = self->_lastFIRArrivalTime;
          if (v61 == 0.0
            || (double v62 = v5 - v61, [(VCVideoReceiverBase *)self roundTripTime], v62 >= v63 + v63))
          {
            self->_double lastFIRArrivalTime = v5;
            char v72 = 1;
          }
          else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
          {
            uint64_t v64 = VRTraceErrorLogLevelToCSTR();
            v65 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              *(void *)&uint8_t buf[4] = v64;
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTCP]";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 683;
              _os_log_impl(&dword_1E1EA4000, v65, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Ignoring too many FIR", buf, 0x1Cu);
            }
          }
          uint64_t v6 = 4;
        }
        else
        {
          v72 |= (v6 - 1) < 2;
        }
        goto LABEL_65;
      default:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v17 = VRTraceErrorLogLevelToCSTR();
          long long v18 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v19 = *((unsigned __int8 *)v9 + 1);
            *(_DWORD *)buf = 136315906;
            *(void *)&uint8_t buf[4] = v17;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTCP]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 763;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = v19;
            uint64_t v13 = v18;
            uint32_t v14 = " [%s] %s:%d Received unknown RTCP packet type:%d";
LABEL_56:
            uint32_t v31 = 34;
LABEL_57:
            _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, v31);
          }
        }
        goto LABEL_65;
    }
  }
}

- (int)scheduleDecodeForFrameWithBuffer:(VCVideoReceiverSampleBuffer_t *)a3 timestamp:(unsigned int)a4 hostTime:(double)a5 showFrame:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  var0 = a3->var6.var0;
  if (var0)
  {
    formatDescription = self->_formatDescription;
    if (formatDescription)
    {
      CFRelease(formatDescription);
      self->_formatDescription = 0;
    }
    CMTimeValue var1 = a3->var6.var1;
    unint64_t v14 = a3->var7.var1;
    var2 = a3->var7.var2;
    parameterSetPointers.duration.CMTimeValue value = (CMTimeValue)a3->var6.var2;
    *(void *)&parameterSetPointers.duration.timescale = var2;
    parameterSetSizes.CMTimeValue value = var1;
    *(void *)&parameterSetSizes.timescale = v14;
    formatDescriptionOut.CMTimeValue value = 0;
    if (CMVideoFormatDescriptionCreateFromH264ParameterSets((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 2uLL, (const uint8_t *const *)&parameterSetPointers, (const size_t *)&parameterSetSizes, 4, (CMFormatDescriptionRef *)&formatDescriptionOut))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCVideoStreamReceiver scheduleDecodeForFrameWithBuffer:timestamp:hostTime:showFrame:].cold.4();
        }
      }
    }
    CMTimeValue value = formatDescriptionOut.value;
    self->_formatDescription = (opaqueCMFormatDescription *)formatDescriptionOut.value;
    if (!value)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCVideoStreamReceiver scheduleDecodeForFrameWithBuffer:timestamp:hostTime:showFrame:]();
        }
      }
      return 4;
    }
  }
  CMTime v31 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA70];
  CMTime v30 = *(CMTime *)(MEMORY[0x1E4F1FA70] + 48);
  if (self->super._mediaStreamSynchronizer)
  {
    CMTimeValue v16 = *(void *)(MEMORY[0x1E4F1FA70] + 24);
    uint64_t v17 = *(void *)(MEMORY[0x1E4F1FA70] + 32);
    CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA70] + 40);
    CMTimeMake(&v30, a4, 1);
  }
  else
  {
    memset(&parameterSetPointers, 170, 24);
    CMTimeMake(&parameterSetPointers.duration, a4, 90000);
    p_lastFrameTime = &self->_lastFrameTime;
    if (self->_receivedFirstRemoteFrame)
    {
      memset(&parameterSetSizes, 170, sizeof(parameterSetSizes));
      CMTime formatDescriptionOut = parameterSetPointers.duration;
      *(_OWORD *)&rhs.CMTimeValue value = *(_OWORD *)&p_lastFrameTime->value;
      rhs.CMTimeEpoch epoch = self->_lastFrameTime.epoch;
      CMTimeSubtract(&parameterSetSizes, &formatDescriptionOut, &rhs);
      CMTime rhs = (CMTime)self->_lastDisplayTime;
      CMTime v27 = parameterSetSizes;
      CMTimeAdd(&formatDescriptionOut, &rhs, &v27);
      uint64_t v17 = *(void *)&formatDescriptionOut.timescale;
      CMTimeValue v16 = formatDescriptionOut.value;
      CMTimeEpoch epoch = formatDescriptionOut.epoch;
    }
    else
    {
      HostTimeClock = CMClockGetHostTimeClock();
      CMClockGetTime(&parameterSetSizes, HostTimeClock);
      CMTimeValue v16 = parameterSetSizes.value;
      uint64_t v17 = *(void *)&parameterSetSizes.timescale;
      CMTimeEpoch epoch = parameterSetSizes.epoch;
    }
    self->_lastDisplayTime.CMTimeValue value = v16;
    *(void *)&self->_lastDisplayTime.timescale = v17;
    self->_lastDisplayTime.CMTimeEpoch epoch = epoch;
    *(_OWORD *)&p_lastFrameTime->CMTimeValue value = *(_OWORD *)&parameterSetPointers.duration.value;
    self->_lastFrameTime.CMTimeEpoch epoch = parameterSetPointers.duration.epoch;
    CMTime v30 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
    CMTimeMake(&v31, 1, 1);
  }
  blockBufferMemoryPoolCFAllocatorRef Allocator = self->_blockBufferMemoryPoolAllocator;
  int v22 = self->_formatDescription;
  double v23 = a3->var2;
  parameterSetPointers.duration = v31;
  parameterSetPointers.presentationTimeStamp.CMTimeValue value = v16;
  *(void *)&parameterSetPointers.presentationTimeStamp.timescale = v17;
  parameterSetPointers.presentationTimeStamp.CMTimeEpoch epoch = epoch;
  parameterSetPointers.decodeTimeStamp = v30;
  CMSampleBufferRef v24 = VideoUtil_CreateSampleFromBuffer(v23, &parameterSetPointers, (uint64_t)blockBufferMemoryPoolAllocator, v22);
  if (!v24)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoStreamReceiver scheduleDecodeForFrameWithBuffer:timestamp:hostTime:showFrame:]();
      }
    }
    return 4;
  }
  CMSampleBufferRef v25 = v24;
  if (var0)
  {
    self->_lastKeyFrameSampleBufferSize = CMBlockBufferGetDataLength(a3->var2);
    [(VCVideoStreamReceiver *)self reportingVideoStreamEvent:229];
    [(VCVideoStreamReceiver *)self updateVideoStallStatus:0];
  }
  if (self->super._mediaStreamSynchronizer)
  {
    if (CMBufferQueueEnqueue(self->_videoQueue, v25))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCVideoStreamReceiver scheduleDecodeForFrameWithBuffer:timestamp:hostTime:showFrame:]();
        }
      }
    }
    else
    {
      VCMediaStreamSynchronizer_scheduleDestinationPlaybackWithRTPTimestamp((uint64_t)self->super._mediaStreamSynchronizer, a4);
    }
  }
  else
  {
    [(VCVideoStreamReceiver *)self decodeFrame:v25 showFrame:v6];
  }
  CFRelease(v25);
  return 0;
}

- (void)reportVideoStallStatus:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (Mutable)
  {
    BOOL v6 = Mutable;
    BOOL valuePtr = v3;
    CFNumberRef v7 = CFNumberCreate(v4, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(v6, @"VCSPVideoDegraded", v7);
    CFRelease(v7);
    reportingGenericEvent();
    CFRelease(v6);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCVideoStreamReceiver reportVideoStallStatus:]();
    }
  }
}

- (void)updateVideoStallStatus:(BOOL)a3
{
  BOOL v3 = a3;
  double v6 = micro();
  double videoStallStartTime = self->_videoStallStartTime;
  if (!v3)
  {
    if (videoStallStartTime <= 0.0)
    {
      uint64_t v5 = 0;
      goto LABEL_8;
    }
    uint64_t v8 = ((v6 - videoStallStartTime) * 1000.0 + 0.5);
    atomic_fetch_add_explicit((atomic_uint *volatile)&self->_videoStallDurationMillis, v8, memory_order_relaxed);
    double v6 = 0.0;
LABEL_6:
    self->_double videoStallStartTime = v6;
    -[VCVideoStreamReceiver reportVideoStallStatus:](self, "reportVideoStallStatus:", v3, v5);
    uint64_t v5 = v8;
    goto LABEL_8;
  }
  uint64_t v8 = 0;
  uint64_t v5 = 0;
  if (videoStallStartTime == 0.0) {
    goto LABEL_6;
  }
LABEL_8:
  rateAdaptation = self->_rateAdaptation;

  -[VCVideoStreamRateAdaptation updateVideoStall:withStallDuration:](rateAdaptation, "updateVideoStall:withStallDuration:", v3, v5, v6);
}

- (int)createDecodeSession:(opaqueCMFormatDescription *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  outputCallback.decompressionOutputCallback = (VTDecompressionOutputCallback)decoderFrameCallback;
  outputCallback.decompressionOutputRefCon = self;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (Mutable)
  {
    CFDictionaryRef v7 = Mutable;
    uint64_t v8 = (const void *)*MEMORY[0x1E4F1CFD0];
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F24D18], (const void *)*MEMORY[0x1E4F1CFD0]);
    if (VCFeatureFlagManager_UseOutOfProcessVideoDecoding())
    {
      p_decompressionSession = &self->_decompressionSession;
      int v10 = VTDecompressionSessionCreate(v5, a3, 0, v7, &outputCallback, p_decompressionSession);
      if (!v10 && *p_decompressionSession)
      {
        int valuePtr = FigThreadGetMachThreadPriorityValue();
        CFNumberRef v11 = CFNumberCreate(v5, kCFNumberSInt32Type, &valuePtr);
        if (v11)
        {
          CFNumberRef v12 = v11;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v13 = VRTraceErrorLogLevelToCSTR();
            unint64_t v14 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              uint64_t v31 = v13;
              __int16 v32 = 2080;
              int v33 = "-[VCVideoStreamReceiver createDecodeSession:]";
              __int16 v34 = 1024;
              int v35 = 959;
              __int16 v36 = 1024;
              *(_DWORD *)double v37 = valuePtr;
              _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Adding machThreadPriority=%d as kVTDecompressionPropertyKey_MachThreadPriorityOfConsistentThreadCallingDecodeFrame", buf, 0x22u);
            }
          }
          VTDecompressionSessionSetProperty();
          CFRelease(v12);
        }
LABEL_18:
        int v10 = 0;
LABEL_19:
        CFRelease(v7);
        return v10;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_19;
      }
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      double v23 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
      VTDecompressionSessionRef v24 = *p_decompressionSession;
      *(_DWORD *)buf = 136316418;
      uint64_t v31 = v22;
      __int16 v32 = 2080;
      int v33 = "-[VCVideoStreamReceiver createDecodeSession:]";
      __int16 v34 = 1024;
      int v35 = 954;
      __int16 v36 = 1024;
      *(_DWORD *)double v37 = v10;
      *(_WORD *)&v37[4] = 1024;
      *(_DWORD *)&v37[6] = v10;
      __int16 v38 = 2048;
      VTDecompressionSessionRef v39 = v24;
      CMSampleBufferRef v25 = " [%s] %s:%d VTDecompressionSessionCreate() returned result=%d(0x%x), _decompressionSession=%p";
    }
    else
    {
      uint64_t v15 = CFDictionaryCreateMutable(v5, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      if ((int)VRTraceGetErrorLogLevelForModule() <= 6)
      {
        int v19 = (const void *)*MEMORY[0x1E4F44D78];
      }
      else
      {
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        uint64_t v17 = *MEMORY[0x1E4F47A50];
        BOOL v18 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
        int v19 = (const void *)*MEMORY[0x1E4F44D78];
        if (v18)
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v31 = v16;
          __int16 v32 = 2080;
          int v33 = "-[VCVideoStreamReceiver createDecodeSession:]";
          __int16 v34 = 1024;
          int v35 = 965;
          __int16 v36 = 2112;
          *(void *)double v37 = v19;
          _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Adding kVTDecompressionSessionOption_AllowClientProcessDecode=%@ to decompressionSessionOptions", buf, 0x26u);
        }
      }
      CFDictionaryAddValue(v15, v19, v8);
      uint64_t v20 = &self->_decompressionSession;
      int v10 = VTDecompressionSessionCreateWithOptions();
      if (v15) {
        CFRelease(v15);
      }
      if (!v10 && *v20) {
        goto LABEL_18;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_19;
      }
      uint64_t v26 = VRTraceErrorLogLevelToCSTR();
      double v23 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
      CMTime v27 = *v20;
      *(_DWORD *)buf = 136316418;
      uint64_t v31 = v26;
      __int16 v32 = 2080;
      int v33 = "-[VCVideoStreamReceiver createDecodeSession:]";
      __int16 v34 = 1024;
      int v35 = 969;
      __int16 v36 = 1024;
      *(_DWORD *)double v37 = v10;
      *(_WORD *)&v37[4] = 1024;
      *(_DWORD *)&v37[6] = v10;
      __int16 v38 = 2048;
      VTDecompressionSessionRef v39 = v27;
      CMSampleBufferRef v25 = " [%s] %s:%d VTDecompressionSessionCreateWithOptions() returned result=%d(0x%x), _decompressionSession=%p";
    }
    _os_log_error_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_ERROR, v25, buf, 0x32u);
    goto LABEL_19;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCVideoStreamReceiver createDecodeSession:]();
    }
  }
  return 0;
}

- (void)teardownDecodeSession:(BOOL)a3
{
  BOOL v3 = a3;
  p_decompressionSessionMutex = &self->_decompressionSessionMutex;
  pthread_mutex_lock(&self->_decompressionSessionMutex);
  decompressionSession = self->_decompressionSession;
  if (decompressionSession)
  {
    if (v3)
    {
      VTDecompressionSessionWaitForAsynchronousFrames(decompressionSession);
      decompressionSession = self->_decompressionSession;
    }
    VTDecompressionSessionInvalidate(decompressionSession);
    CFDictionaryRef v7 = self->_decompressionSession;
    if (v7)
    {
      CFRelease(v7);
      self->_decompressionSession = 0;
    }
  }

  pthread_mutex_unlock(p_decompressionSessionMutex);
}

- (int)decodeFrame:(opaqueCMSampleBuffer *)a3 showFrame:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  FormatDescription = CMSampleBufferGetFormatDescription(a3);
  decompressionSession = self->_decompressionSession;
  if (decompressionSession)
  {
    if (!VTDecompressionSessionCanAcceptFormatDescription(decompressionSession, FormatDescription))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        int v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v16 = v9;
          __int16 v17 = 2080;
          BOOL v18 = "-[VCVideoStreamReceiver decodeFrame:showFrame:]";
          __int16 v19 = 1024;
          int v20 = 1004;
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Resetting VTDecompressionSession due to format change", buf, 0x1Cu);
        }
      }
      [(VCVideoStreamReceiver *)self teardownDecodeSession:1];
    }
    CFNumberRef v11 = self->_decompressionSession;
    if (v11) {
      goto LABEL_10;
    }
  }
  if (![(VCVideoStreamReceiver *)self createDecodeSession:FormatDescription])
  {
    CFNumberRef v11 = self->_decompressionSession;
LABEL_10:
    if (v4) {
      VTDecodeFrameFlags v12 = 1;
    }
    else {
      VTDecodeFrameFlags v12 = 3;
    }
    VTDecodeInfoFlags infoFlagsOut = -1431655766;
    VTDecompressionSessionDecodeFrame(v11, a3, v12, 0, &infoFlagsOut);
    return 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCVideoStreamReceiver decodeFrame:showFrame:]();
    }
  }
  return 4;
}

- (BOOL)canDequeue:(opaqueCMBufferQueue *)a3 forTimestamp:(unsigned int)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    CFDictionaryRef v7 = *MEMORY[0x1E4F47A50];
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v13.value) = 136316162;
        *(CMTimeValue *)((char *)&v13.value + 4) = v6;
        LOWORD(v13.flags) = 2080;
        *(void *)((char *)&v13.flags + 2) = "-[VCVideoStreamReceiver canDequeue:forTimestamp:]";
        HIWORD(v13.epoch) = 1024;
        int v14 = 1023;
        __int16 v15 = 1024;
        unsigned int v16 = a4;
        __int16 v17 = 2048;
        CMItemCount BufferCount = CMBufferQueueGetBufferCount(a3);
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d timestamp:%08X count:%ld", (uint8_t *)&v13, 0x2Cu);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v13.value) = 136316162;
      *(CMTimeValue *)((char *)&v13.value + 4) = v6;
      LOWORD(v13.flags) = 2080;
      *(void *)((char *)&v13.flags + 2) = "-[VCVideoStreamReceiver canDequeue:forTimestamp:]";
      HIWORD(v13.epoch) = 1024;
      int v14 = 1023;
      __int16 v15 = 1024;
      unsigned int v16 = a4;
      __int16 v17 = 2048;
      CMItemCount BufferCount = CMBufferQueueGetBufferCount(a3);
      _os_log_debug_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEBUG, " [%s] %s:%d timestamp:%08X count:%ld", (uint8_t *)&v13, 0x2Cu);
    }
  }
  if (CMBufferQueueIsEmpty(a3))
  {
LABEL_8:
    LOBYTE(v9) = 0;
    return v9;
  }
  Head = (opaqueCMSampleBuffer *)CMBufferQueueGetHead(a3);
  memset(&v13, 170, sizeof(v13));
  CMSampleBufferGetDecodeTimeStamp(&v13, Head);
  if ((v13.flags & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v9) {
        return v9;
      }
      -[VCVideoStreamReceiver canDequeue:forTimestamp:]();
    }
    goto LABEL_8;
  }
  LOBYTE(v9) = LODWORD(v13.value) == a4 || LODWORD(v13.value) - a4 > 0x7FFFFFFE;
  return v9;
}

- (void)dequeueAndDecodeForTimestamp:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v5 = (opaqueCMSampleBuffer *)CMBufferQueueDequeueAndRetain(self->_videoQueue);
  if (v5)
  {
    uint64_t v6 = v5;
    BOOL v7 = [(VCVideoStreamReceiver *)self canDequeue:self->_videoQueue forTimestamp:v3];
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 48);
    *(_OWORD *)&sampleTimingArray.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 32);
    *(_OWORD *)&sampleTimingArray.decodeTimeStamp.CMTimeValue value = v8;
    sampleTimingArray.decodeTimeStamp.CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA70] + 64);
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 16);
    *(_OWORD *)&sampleTimingArray.duration.CMTimeValue value = *MEMORY[0x1E4F1FA70];
    *(_OWORD *)&sampleTimingArray.duration.CMTimeEpoch epoch = v9;
    HostTimeClock = CMClockGetHostTimeClock();
    CMClockGetTime(&sampleTimingArray.presentationTimeStamp, HostTimeClock);
    sampleTimingArray.decodeTimeStamp = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
    CMTimeMake(&v11, 1, 1);
    sampleTimingArray.duration = v11;
    v11.CMTimeValue value = 0;
    CMSampleBufferCreateCopyWithNewTiming((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v6, 1, &sampleTimingArray, (CMSampleBufferRef *)&v11);
    CFRelease(v6);
    if (v11.value)
    {
      [(VCVideoStreamReceiver *)self decodeFrame:v11.value showFrame:!v7];
      CFRelease((CFTypeRef)v11.value);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoStreamReceiver dequeueAndDecodeForTimestamp:]();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCVideoStreamReceiver dequeueAndDecodeForTimestamp:]();
    }
  }
}

- (void)handleAlarmForTimeStamp:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(VCVideoStreamReceiver *)self canDequeue:self->_videoQueue forTimestamp:*(void *)&a3])
  {
    do
      [(VCVideoStreamReceiver *)self dequeueAndDecodeForTimestamp:v3];
    while ([(VCVideoStreamReceiver *)self canDequeue:self->_videoQueue forTimestamp:v3]);
  }
}

- (BOOL)handleRemoteVideoAttributesChange:(__CVBuffer *)a3
{
  CFAllocatorRef v5 = objc_alloc_init(VideoAttributes);
  [(VideoAttributes *)v5 setOrientation:self->super._remoteVideoOrientation];
  [(VideoAttributes *)v5 setCamera:self->_remoteVideoCamera];
  [(VideoAttributes *)v5 setVideoMirrored:self->_remoteVideoMirrored];
  double Width = (double)CVPixelBufferGetWidth(a3);
  -[VideoAttributes setRatio:](v5, "setRatio:", Width, (double)CVPixelBufferGetHeight(a3));
  [self->_remoteVideoAttributes scaleFactor];
  -[VideoAttributes setScaleFactor:](v5, "setScaleFactor:");
  remoteVideoAttributes = self->_remoteVideoAttributes;
  if (remoteVideoAttributes)
  {
    if (VCVideoAttributes_IsEqual((uint64_t)remoteVideoAttributes, (uint64_t)v5))
    {

      return 0;
    }
  }
  self->_remoteVideoAttributes = v5;
  return 1;
}

- (int)showDecodedFrame:(__CVBuffer *)a3 atTime:(id *)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (-[VCVideoStreamReceiver handleRemoteVideoAttributesChange:](self, "handleRemoteVideoAttributesChange:"))
  {
    [(VCVideoStreamReceiver *)self reportingVideoStreamEvent:211];
    remoteVideoAttributes = self->_remoteVideoAttributes;
  }
  else
  {
    remoteVideoAttributes = 0;
  }
  didReceiveRemoteFrame = (void (*)(VCVideoReceiverDelegate *, __CVBuffer *, long long *, VideoAttributes *, void, BOOL))self->super._delegateFunctions.didReceiveRemoteFrame;
  delegate = self->super._delegate;
  BOOL v10 = !self->_receivedFirstRemoteFrame;
  long long v12 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  didReceiveRemoteFrame(delegate, a3, &v12, remoteVideoAttributes, 0, v10);
  if (!self->_receivedFirstRemoteFrame) {
    self->_receivedFirstRemoteFrame = 1;
  }
  if (self->_enableReceiveBitstreamDump) {
    DumpFrameYuvWithTimestamp(1, a3, a4->var0);
  }
  return 0;
}

- (void)gatherRealtimeStats:(__CFDictionary *)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (__CFDictionary *)selectDestinationForRTMetrics();
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
      BOOL v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        [(VCMediaStreamStats *)self->_stats framerate];
        uint64_t v9 = v8;
        unsigned int v10 = [(VCMediaStreamStats *)self->_stats bitrateKbps];
        *(_DWORD *)buf = 136316162;
        uint64_t v42 = v6;
        __int16 v43 = 2080;
        uint64_t v44 = "-[VCVideoStreamReceiver gatherRealtimeStats:]";
        __int16 v45 = 1024;
        int v46 = 1149;
        __int16 v47 = 2048;
        uint64_t v48 = v9;
        __int16 v49 = 1024;
        unsigned int v50 = v10;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @=@ Health: VideoStreamReceiver videoRxFrameRate=%f, videoRxBitrate=%d kbps", buf, 0x2Cu);
      }
    }
  }
  self->_reportingLastUpdateTime = v5;
  if (v4)
  {
    CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%d", [(VCVideoStreamRateAdaptation *)self->_rateAdaptation sendTmmbrBitrate]);
    CFDictionaryAddValue(v4, @"VCVSTMMB", v12);
    CFRelease(v12);
    CFStringRef v13 = CFStringCreateWithFormat(v11, 0, @"%d", [(VCVideoStreamRateAdaptation *)self->_rateAdaptation operatingBitrate]);
    CFDictionaryAddValue(v4, @"VCVSRxOperatingBitrate", v13);
    CFRelease(v13);
    [(VCVideoStreamRateAdaptation *)self->_rateAdaptation packetLossPercentage];
    CFStringRef v15 = CFStringCreateWithFormat(v11, 0, @"%.5f", v14);
    CFDictionaryAddValue(v4, @"VCVSRxPacketLossPercentage", v15);
    CFRelease(v15);
    [(VCVideoStreamRateAdaptation *)self->_rateAdaptation roundTripTime];
    CFStringRef v17 = CFStringCreateWithFormat(v11, 0, @"%.5f", v16);
    CFDictionaryAddValue(v4, @"VCVSRxRoundTripTime", v17);
    CFRelease(v17);
    [(VCVideoStreamRateAdaptation *)self->_rateAdaptation maxOWRD];
    CFStringRef v19 = CFStringCreateWithFormat(v11, 0, @"%.5f", v18);
    CFDictionaryAddValue(v4, @"VCVSRxMaxOWRD", v19);
    CFRelease(v19);
    [(VCVideoStreamRateAdaptation *)self->_rateAdaptation setMaxOWRD:0.0];
    [(VCVideoStreamRateAdaptation *)self->_rateAdaptation nowrd];
    CFStringRef v21 = CFStringCreateWithFormat(v11, 0, @"%.5f", v20);
    CFDictionaryAddValue(v4, @"VCVSRxNOWRD", v21);
    CFRelease(v21);
    [(VCVideoStreamRateAdaptation *)self->_rateAdaptation nowrdShort];
    CFStringRef v23 = CFStringCreateWithFormat(v11, 0, @"%.5f", v22);
    CFDictionaryAddValue(v4, @"VCVSRxNOWRDSHORT", v23);
    CFRelease(v23);
    [(VCVideoStreamRateAdaptation *)self->_rateAdaptation nowrdAcc];
    CFStringRef v25 = CFStringCreateWithFormat(v11, 0, @"%.5f", v24);
    CFDictionaryAddValue(v4, @"VCVSRxNOWRDACC", v25);
    CFRelease(v25);
    CFStringRef v26 = CFStringCreateWithFormat(v11, 0, @"%u", atomic_fetch_and_explicit((atomic_uint *volatile)&self->_videoStallDurationMillis, 0, memory_order_relaxed));
    CFDictionaryAddValue(v4, @"VCVSRxVideoStallDuration", v26);
    CFRelease(v26);
    CFStringRef v27 = CFStringCreateWithFormat(v11, 0, @"%u", [(VCMediaStreamStats *)self->_stats maxFrameDurationMillis]);
    CFDictionaryAddValue(v4, @"VCVSRxMaxFrameDuration", v27);
    CFRelease(v27);
    [(VCMediaStreamStats *)self->_stats setMaxFrameDurationMillis:0];
    CFStringRef v28 = CFStringCreateWithFormat(v11, 0, @"%u", [(VCMediaStreamStats *)self->_stats getBitrateKbpsSinceTime:self->_reportingIntervalStartTime]);
    CFDictionaryAddValue(v4, @"VCVSRxAvgBitrate", v28);
    CFRelease(v28);
    CFStringRef v29 = CFStringCreateWithFormat(v11, 0, @"%u", [(VCMediaStreamStats *)self->_stats maxBitrateKbps]);
    CFDictionaryAddValue(v4, @"VCVSRxMaxBitrate", v29);
    CFRelease(v29);
    [(VCMediaStreamStats *)self->_stats setMaxBitrateKbps:0];
    CFStringRef v30 = CFStringCreateWithFormat(v11, 0, @"%u", [(VCMediaStreamStats *)self->_stats minBitrateKbps]);
    CFDictionaryAddValue(v4, @"VCVSRxMinBitrate", v30);
    CFRelease(v30);
    [(VCMediaStreamStats *)self->_stats setMinBitrateKbps:0xFFFFFFFFLL];
    [(VCMediaStreamStats *)self->_stats getFramerateSinceTime:self->_reportingIntervalStartTime];
    CFStringRef v32 = CFStringCreateWithFormat(v11, 0, @"%5.2f", v31);
    CFDictionaryAddValue(v4, @"VCVSRxAvgFramerate", v32);
    CFRelease(v32);
    [(VCMediaStreamStats *)self->_stats maxFramerate];
    CFStringRef v34 = CFStringCreateWithFormat(v11, 0, @"%5.2f", v33);
    CFDictionaryAddValue(v4, @"VCVSRxMaxFramerate", v34);
    CFRelease(v34);
    [(VCMediaStreamStats *)self->_stats setMaxFramerate:0.0];
    [(VCMediaStreamStats *)self->_stats minFramerate];
    CFStringRef v36 = CFStringCreateWithFormat(v11, 0, @"%5.2f", v35);
    CFDictionaryAddValue(v4, @"VCVSRxMinFramerate", v36);
    CFRelease(v36);
    [(VCMediaStreamStats *)self->_stats setMinFramerate:1.79769313e308];
    self->_reportingIntervalStartTime = v5;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v37 = VRTraceErrorLogLevelToCSTR();
      __int16 v38 = *MEMORY[0x1E4F47A50];
      VTDecompressionSessionRef v39 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v40 = objc_msgSend((id)-[__CFDictionary description](v4, "description"), "UTF8String");
          *(_DWORD *)buf = 136315906;
          uint64_t v42 = v37;
          __int16 v43 = 2080;
          uint64_t v44 = "-[VCVideoStreamReceiver gatherRealtimeStats:]";
          __int16 v45 = 1024;
          int v46 = 1228;
          __int16 v47 = 2080;
          uint64_t v48 = v40;
          _os_log_impl(&dword_1E1EA4000, v38, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Rx RTCReporting:%s", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        [(VCVideoStreamReceiver *)v37 gatherRealtimeStats:v38];
      }
    }
  }
}

- (void)reportingVideoStreamEvent:(unsigned __int16)a3
{
  int v3 = a3;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  switch(v3)
  {
    case 229:
      CFStringRef v11 = CFStringCreateWithFormat(v5, 0, @"%zu", self->_lastKeyFrameSampleBufferSize);
      CFStringRef v12 = @"VCVSKeyFrameSize";
      break;
    case 223:
      [(VCVideoStreamRateAdaptation *)self->_rateAdaptation packetLossPercentage];
      CFStringRef v11 = CFStringCreateWithFormat(v5, 0, @"%.5f", v13);
      CFStringRef v12 = @"VCVSRxPacketLossPercentage";
      break;
    case 211:
      [self->_remoteVideoAttributes ratio];
      CFStringRef v8 = CFStringCreateWithFormat(v5, 0, @"%f", v7);
      CFDictionaryAddValue(Mutable, @"VCVSRxVideoWidth", v8);
      CFRelease(v8);
      [self->_remoteVideoAttributes ratio];
      CFStringRef v10 = CFStringCreateWithFormat(v5, 0, @"%f", v9);
      CFDictionaryAddValue(Mutable, @"VCVSRxVideoHeight", v10);
      CFRelease(v10);
      CFStringRef v11 = CFStringCreateWithFormat(v5, 0, @"%u", [self->_remoteVideoAttributes orientation]);
      CFStringRef v12 = @"VCVSRxVideoOrientation";
      break;
    default:
      goto LABEL_8;
  }
  CFDictionaryAddValue(Mutable, v12, v11);
  CFRelease(v11);
LABEL_8:
  reportingVideoStreamEvent();

  CFRelease(Mutable);
}

- (void)handleActiveConnectionChange:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    BOOL v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      CFStringRef v8 = "-[VCVideoStreamReceiver handleActiveConnectionChange:]";
      __int16 v9 = 1024;
      int v10 = 1269;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Handling active connection change is not implemented for VCVSR", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)setJitterBufferMode:(int)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    BOOL v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      CFStringRef v8 = "-[VCVideoStreamReceiver setJitterBufferMode:]";
      __int16 v9 = 1024;
      int v10 = 1275;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Handling setting the jitter buffer mode is not implemented for VCVSR", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)setDeferredAssemblyEnabled:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    BOOL v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      CFStringRef v8 = "-[VCVideoStreamReceiver setDeferredAssemblyEnabled:]";
      __int16 v9 = 1024;
      int v10 = 1279;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Handling setting deferred assembly at runtime is not implemented for VCVSR", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)setLooseAVSyncEnabled:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    BOOL v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      CFStringRef v8 = "-[VCVideoStreamReceiver setLooseAVSyncEnabled:]";
      __int16 v9 = 1024;
      int v10 = 1283;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Handling setting loose av sync at runtime is not implemented for VCVSR", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)initWithConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d no config specified!", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d no delegate specified!", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:.cold.3()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCVideoStreamReceiver initWithConfig:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCTransportStreamRunLoopVTPCreate failed %d", v2, *(const char **)v3, (unint64_t)"-[VCVideoStreamReceiver initWithConfig:]" >> 16, v4);
}

void __50__VCVideoStreamReceiver_startNetworkReceiveThread__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCVideoStreamReceiver startNetworkReceiveThread]_block_invoke";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Network receive thread create failed (%d)", v2, *(const char **)v3, (unint64_t)"-[VCVideoStreamReceiver startNetworkReceiveThread]_block_invoke" >> 16, v4);
}

- (void)processVideoRTP
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_1E1EA4000, v0, v1, " [%s] %s:%d bCameraStatusBits = %x", v2, v3, v4, 516);
}

- (void)scheduleDecodeForFrameWithBuffer:timestamp:hostTime:showFrame:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d CMSampleBufferCreate failed", v2, v3, v4, v5, v6);
}

- (void)scheduleDecodeForFrameWithBuffer:timestamp:hostTime:showFrame:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCVideoStreamReceiver scheduleDecodeForFrameWithBuffer:timestamp:hostTime:showFrame:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d CMBufferQueueEnqueue failed %d", v2, *(const char **)v3, (unint64_t)"-[VCVideoStreamReceiver scheduleDecodeForFrameWithBuffer:timestamp:hostTime:showFrame:]" >> 16, v4);
}

- (void)scheduleDecodeForFrameWithBuffer:timestamp:hostTime:showFrame:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to read format from sampleBuffer", v2, v3, v4, v5, v6);
}

- (void)scheduleDecodeForFrameWithBuffer:timestamp:hostTime:showFrame:.cold.4()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "_VCVideoStreamReceiver_CreateVideoFormatDescription";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d CMVideoFormatDescriptionCreateFromH264ParameterSets failed (%d)", v2, *(const char **)v3, (unint64_t)"_VCVideoStreamReceiver_CreateVideoFormatDescription" >> 16, v4);
}

- (void)reportVideoStallStatus:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create reporting event dictionary", v2, v3, v4, v5, v6);
}

- (void)createDecodeSession:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create pixelBufferAttributes", v2, v3, v4, v5, v6);
}

- (void)decodeFrame:showFrame:.cold.1()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v4 = "-[VCVideoStreamReceiver decodeFrame:showFrame:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  __int16 v5 = v0;
  int v6 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d -createDecodeSession: returned result=%d(0x%x)", v3, 0x28u);
}

- (void)canDequeue:forTimestamp:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCVideoStreamReceiver canDequeue:forTimestamp:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d CMSampleBufferGetDecodeTimeStamp is invalid timestamp:%u", v2, *(const char **)v3, (unint64_t)"-[VCVideoStreamReceiver canDequeue:forTimestamp:]" >> 16, v4);
}

- (void)dequeueAndDecodeForTimestamp:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d CMBufferQueueDequeueAndRetain returned null!", v2, v3, v4, v5, v6);
}

- (void)dequeueAndDecodeForTimestamp:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCVideoStreamReceiver dequeueAndDecodeForTimestamp:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d CMSampleBufferCreateCopyWithNewTiming failed %d", v2, *(const char **)v3, (unint64_t)"-[VCVideoStreamReceiver dequeueAndDecodeForTimestamp:]" >> 16, v4);
}

- (void)gatherRealtimeStats:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
  int v7 = 136315906;
  uint64_t v8 = a1;
  __int16 v9 = 2080;
  OUTLINED_FUNCTION_8();
  int v10 = 1228;
  __int16 v11 = v5;
  uint64_t v12 = v6;
  _os_log_debug_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Rx RTCReporting:%s", (uint8_t *)&v7, 0x26u);
}

@end