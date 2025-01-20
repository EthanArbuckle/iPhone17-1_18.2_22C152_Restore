@interface BWImageQueueSinkNode
+ (void)initialize;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)previewPTSAtHostTime:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)previewPTSDisplayedAtHostTime:(SEL)a3 allowingExtrapolation:(unint64_t)a4;
- (BOOL)cleanupImageQueueAtEndOfData;
- (BOOL)fenceSupportEnabled;
- (BOOL)hasNonLiveConfigurationChanges;
- (BOOL)videoHDRImageStatisticsEnabled;
- (BWFigVideoCaptureDevice)captureDevice;
- (BWImageQueueSinkNode)initWithHFRSupport:(BOOL)a3 ispJitterCompensationEnabled:(BOOL)a4 clientAuditToken:(id *)a5 sinkID:(id)a6;
- (BWImageQueueSinkNodePreviewTapDelegate)previewTapDelegate;
- (FigCaptureVideoTransform)transform;
- (_CAImageQueue)imageQueue;
- _createContextForBuffer:(uint64_t)a3 bufferId:(long long *)a4 framePTS:;
- (__n128)_createFrameSender;
- (double)_displayTimeSyncedWithFramePTS:(uint64_t)a1;
- (double)_processBufferContext:(uint64_t)a1;
- (double)_processReleasedContexts;
- (id)nodeSubType;
- (int)maxLossyCompressionLevel;
- (int)syncStrategy;
- (uint64_t)_bufferIDForSurface:(uint64_t)a1;
- (uint64_t)_cleanupImageQueueContext;
- (uint64_t)_collectUnconsumedBuffersWithReason:(uint64_t)result collectMostFutureBuffers:;
- (uint64_t)_ensureImageQueue;
- (uint64_t)_removeBufferFromInternalQueues:(uint64_t)a3 bufferId:;
- (uint64_t)_updateInputRequirements;
- (unsigned)imageQueueSlot;
- (void)_cleanupIOSurfaces;
- (void)_storePreviewPTS:(uint64_t)a3 withHostTime:(int)a4 isOverCaptureFrame:;
- (void)_transferIOSurfaceOwnershipToEnqueuedBufferContext;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)fencePortGenerationIDWillChange;
- (void)handleDroppedSample:(id)a3 forInput:(id)a4;
- (void)inputConnectionWillBeEnabled;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)registerSurfacesFromSourcePool:(id)a3;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setCaptureDevice:(id)a3;
- (void)setCleanupImageQueueAtEndOfData:(BOOL)a3;
- (void)setFenceSupportEnabled:(BOOL)a3;
- (void)setMaxLossyCompressionLevel:(int)a3;
- (void)setPreviewTapDelegate:(id)a3;
- (void)setSyncStrategy:(int)a3;
- (void)setTransform:(FigCaptureVideoTransform)a3;
- (void)setVideoHDRImageStatisticsEnabled:(BOOL)a3;
- (void)updateClientAuditToken:(id *)a3;
@end

@implementation BWImageQueueSinkNode

- (unsigned)imageQueueSlot
{
  return self->_imageQueueSlot;
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  v3.receiver = self;
  v3.super_class = (Class)BWImageQueueSinkNode;
  [(BWNode *)&v3 prepareForCurrentConfigurationToBecomeLive];
  self->_lastDisplayVSyncInterval = 0.0;
  self->_lastDisplaySamplingTime = 0.0;
  self->_lastFramePTS = 0.0;
  self->_lastDisplayTime = 0.0;
  self->_lateFrameIntervalStartPTS = 0.0;
  self->_lastHarmonicFractionalVSyncInterval = NAN;
  self->_previousFrameDuration = 0.0;
  self->_framesSinceLastHarmonicCompensation = 0;
  self->_lastFencedGenerationID = 0;
  pthread_mutex_lock((pthread_mutex_t *)self->_previewPTSHistoryMutex);
  [(NSMutableArray *)self->_previewPTSHistory removeAllObjects];
  self->_firstFramePTS = *($95D729B680665BEAEFA1D6FCA8238556 *)*(void *)&MEMORY[0x1E4F1F9F8];
  self->_firstDisplayedFrameHostTime = 0;
  self->_didCallFirstFrameAtHostTimeCallback = 0;
  self->_didCallFirstFrameCallback = 0;
  self->_firstOverCaptureDisplayedFrameHostTime = 0;
  self->_didLogFirstOverCaptureFrame = 0;
  pthread_mutex_unlock((pthread_mutex_t *)self->_previewPTSHistoryMutex);
  -[BWImageQueueSinkNode _ensureImageQueue]((uint64_t)self);
  if (self->_fenceSupportEnabled) {
    self->_imageQueueContext = (CAContext *)FPSupport_CopyCAContext();
  }
  -[BWImageQueueSinkNode _createFrameSender]((uint64_t)self);
}

- (uint64_t)_ensureImageQueue
{
  if (result)
  {
    uint64_t v1 = result;
    FPSupport_EnsureCAImageQueue();
    CAImageQueueGetFlags();
    CAImageQueueSetFlags();
    uint64_t v2 = *(void *)(v1 + 184);
    return MEMORY[0x1F40F4BA0](v2, 0);
  }
  return result;
}

- (void)updateClientAuditToken:(id *)a3
{
  p_clientPIDLock = &self->_clientPIDLock;
  os_unfair_lock_lock(&self->_clientPIDLock);
  long long v6 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_clientAuditToken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_clientAuditToken.val[4] = v6;
  long long v7 = *(_OWORD *)&a3->var0[4];
  v9[0] = *(_OWORD *)a3->var0;
  v9[1] = v7;
  self->_clientPID = FigCaptureGetPIDFromAuditToken(v9);
  holdingBuffersForClientAssertion = self->_holdingBuffersForClientAssertion;
  self->_holdingBuffersForClientAssertion = (OS_os_transaction *)FigOSTransactionCreate();

  os_unfair_lock_unlock(p_clientPIDLock);
  -[BWImageQueueSinkNode _createFrameSender]((uint64_t)self);
}

- (__n128)_createFrameSender
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 676));
    long long v2 = *(_OWORD *)(a1 + 660);
    long long v15 = *(_OWORD *)(a1 + 644);
    long long v16 = v2;
    long long v3 = *(_OWORD *)(a1 + 232);
    long long v17 = *(_OWORD *)(a1 + 216);
    long long v18 = v3;
    int v4 = *(_DWORD *)(a1 + 640);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 676));
    long long v13 = v15;
    long long v14 = v16;
    if (FigCaptureAuditTokenIsValid((uint64_t)&v13))
    {
      long long v13 = v15;
      long long v14 = v16;
      v12[0] = v17;
      v12[1] = v18;
      if (!FigCaptureAuditTokensAreEqual(&v13, v12))
      {
        uint64_t v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v15 length:32];
        uint64_t v7 = getpid();
        if (v4 == v7)
        {
          uint64_t v8 = 0;
          uint64_t v9 = 0;
        }
        else
        {
          uint64_t v8 = v7;
          long long v13 = 0u;
          long long v14 = 0u;
          uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &v13, 32, FigCaptureGetCurrentProcessAuditToken(&v13));
        }
        v10 = -[CMCaptureFrameSenderService initWithEndpointType:endpointPID:endpointProxyPID:endpointAuditToken:endpointProxyAuditToken:endpointCameraUniqueID:]([CMCaptureFrameSenderService alloc], "initWithEndpointType:endpointPID:endpointProxyPID:endpointAuditToken:endpointProxyAuditToken:endpointCameraUniqueID:", @"VideoPreview", *(unsigned int *)(a1 + 640), v8, v6, v9, objc_msgSend((id)objc_msgSend(*(id *)(a1 + 632), "captureStream"), "uniqueID"));
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 676));

        *(void *)(a1 + 208) = v10;
        long long v11 = v16;
        *(_OWORD *)(a1 + 216) = v15;
        *(_OWORD *)(a1 + 232) = v11;
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 676));
      }
    }
  }
  return result;
}

void __46__BWImageQueueSinkNode__processBufferContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  int v3 = *(unsigned __int8 *)(a1 + 72);
  CMTime v4 = *(CMTime *)(a1 + 48);
  -[BWImageQueueSinkNode _storePreviewPTS:withHostTime:isOverCaptureFrame:](v2, &v4, v1, v3);
}

- (void)_storePreviewPTS:(uint64_t)a3 withHostTime:(int)a4 isOverCaptureFrame:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    context = (void *)MEMORY[0x1A6272C70]();
    long long v28 = *(_OWORD *)&a2->value;
    CMTimeEpoch epoch = a2->epoch;
    uint64_t v30 = a3;
    uint64_t v6 = [MEMORY[0x1E4F29238] valueWithBytes:&v28 objCType:"{_PreviewPTSInfo={?=qiIq}Q}"];
    pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 448));
    [*(id *)(a1 + 440) addObject:v6];
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v8 = *(void **)(a1 + 440);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v31 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v25;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v24 + 1) + 8 * v12);
        memset(time1, 0, sizeof(time1));
        [v13 getValue:time1];
        memset(&v22, 0, sizeof(v22));
        CMTime lhs = *a2;
        CMTime rhs = *(CMTime *)time1;
        CMTimeSubtract(&v22, &lhs, &rhs);
        CMTimeMake(&time2, 3, 1);
        CMTime lhs = v22;
        if (CMTimeCompare(&lhs, &time2) <= 0) {
          break;
        }
        [v7 addObject:v13];
        if (v10 == ++v12)
        {
          uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v31 count:16];
          if (v10) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
    [*(id *)(a1 + 440) removeObjectsInArray:v7];
    if (!*(void *)(a1 + 488))
    {
      *(_OWORD *)time1 = *(_OWORD *)&a2->value;
      *(void *)&time1[16] = a2->epoch;
      CMTime v22 = *(CMTime *)(a1 + 464);
      if ((CMTimeCompare((CMTime *)time1, &v22) & 0x80000000) == 0)
      {
        *(void *)(a1 + 488) = a3;
        long long v14 = *(_OWORD *)&a2->value;
        *(void *)(a1 + 512) = a2->epoch;
        *(_OWORD *)(a1 + 496) = v14;
      }
    }
    if (!*(void *)(a1 + 552))
    {
      *(_OWORD *)time1 = *(_OWORD *)&a2->value;
      *(void *)&time1[16] = a2->epoch;
      CMTime v22 = *(CMTime *)(a1 + 464);
      if ((CMTimeCompare((CMTime *)time1, &v22) & 0x80000000) == 0)
      {
        if (a4)
        {
          *(void *)(a1 + 552) = a3;
          long long v15 = *(_OWORD *)&a2->value;
          *(void *)(a1 + 540) = a2->epoch;
          *(_OWORD *)(a1 + 524) = v15;
        }
      }
    }
    pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 448));
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  memset(&v43, 0, sizeof(v43));
  if (a3)
  {
    CFDictionaryRef v6 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F530C0], 0);
    CMTimeMakeFromDictionary(&v43, v6);
  }
  else
  {
    CMTime v43 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  }
  if ((v43.flags & 1) == 0)
  {
    CMSampleBufferGetPresentationTimeStamp(&time, a3);
    CMTime v43 = time;
  }
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    CMTime time = v43;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  if (a3)
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(ImageBuffer);
    pthread_mutex_lock((pthread_mutex_t *)self->_surfaceRegistrationMutex);
    uint64_t v35 = -[BWImageQueueSinkNode _bufferIDForSurface:]((uint64_t)self, (uint64_t)IOSurface);
    pthread_mutex_unlock((pthread_mutex_t *)self->_surfaceRegistrationMutex);
    ++self->_numFramesReceived;
    if (objc_msgSend((id)CMGetAttachment(a3, @"FrameIsBlackened", 0), "BOOLValue"))
    {
      BOOL v9 = 1;
      if (!self->_receivingBlackenedFrames && dword_1EB4C5290)
      {
        int v42 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        BOOL v9 = 1;
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    else
    {
      BOOL v9 = 0;
      if (self->_receivingBlackenedFrames && dword_1EB4C5290)
      {
        int v42 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        uint64_t v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        BOOL v9 = 0;
      }
    }
    self->_receivingBlackenedFrames = v9;
    if (!self->_didCallFirstFrameAtHostTimeCallback)
    {
      if ((self->_firstFramePTS.flags & 1) == 0) {
        self->_firstFramePTS = ($95D729B680665BEAEFA1D6FCA8238556)v43;
      }
      if (self->_firstDisplayedFrameHostTime)
      {
        if (*MEMORY[0x1E4F1EBA8])
        {
          mach_absolute_time();
          if (*MEMORY[0x1E4F1EBA8] == 1)
          {
            FigHostTimeToNanoseconds();
            CMTime time = (CMTime)self->_firstDisplayedFramePTS;
            CMTimeGetSeconds(&time);
            kdebug_trace();
          }
        }
        if (!self->_didCallFirstFrameCallback)
        {
          [(BWImageQueueSinkNodePreviewTapDelegate *)self->_previewTapDelegate imageQueueSinkNodeDidDisplayFirstFrame:self];
          self->_didCallFirstFrameCallback = 1;
          if (dword_1EB4C5290)
          {
            int v42 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            v34 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
        -[BWImageQueueSinkNodePreviewTapDelegate imageQueueSinkNodeDidDisplayFirstFrame:atHostTime:](self->_previewTapDelegate, "imageQueueSinkNodeDidDisplayFirstFrame:atHostTime:", self, self->_firstDisplayedFrameHostTime, v32, v33);
        self->_didCallFirstFrameAtHostTimeCallback = 1;
      }
    }
    if (self->_firstOverCaptureDisplayedFrameHostTime && *MEMORY[0x1E4F1EBA8] && !self->_didLogFirstOverCaptureFrame)
    {
      mach_absolute_time();
      if (*MEMORY[0x1E4F1EBA8] == 1)
      {
        FigHostTimeToNanoseconds();
        CMTime time = *(CMTime *)(&self->_didCallFirstFrameCallback + 3);
        CMTimeGetSeconds(&time);
        kdebug_trace();
      }
      self->_didLogFirstOverCaptureFrame = 1;
    }
    if (!self->_didCallFirstFrameCallback
      && self->_numFramesReceived >= self->_numFramesReceivedBeforeFirstDisplayTimeout)
    {
      [(BWImageQueueSinkNodePreviewTapDelegate *)self->_previewTapDelegate imageQueueSinkNodeDidDisplayFirstFrame:self];
      self->_didCallFirstFrameCallback = 1;
      if (dword_1EB4C5290)
      {
        int v42 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        uint64_t v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    if (self->_fenceSupportEnabled)
    {
      if (self->_fencePortGenerationIDWillChange)
      {
        self->_fencePortGenerationIDWillChange = 0;
        self->_framesSinceLastFenceIDWillChange = 0;
        if (!self->_savedSyncStrategy) {
          self->_int savedSyncStrategy = self->_liveSyncStrategy;
        }
        self->_int liveSyncStrategy = 1;
      }
      else
      {
        int savedSyncStrategy = self->_savedSyncStrategy;
        if (savedSyncStrategy && self->_framesSinceLastFenceIDWillChange >= 16 && self->_framesSinceLastFence >= 16)
        {
          self->_int liveSyncStrategy = savedSyncStrategy;
          self->_int savedSyncStrategy = 0;
        }
      }
      ++self->_framesSinceLastFenceIDWillChange;
    }
    int liveSyncStrategy = self->_liveSyncStrategy;
    if (liveSyncStrategy == 3)
    {
      CMTime time = v43;
      double Seconds = CMTimeGetSeconds(&time);
      double InsertionTime = -[BWImageQueueSinkNode _displayTimeSyncedWithFramePTS:]((uint64_t)self, Seconds);
    }
    else
    {
      if (liveSyncStrategy != 2)
      {
        Float64 v16 = -1.0e10;
        goto LABEL_51;
      }
      if (self->_resetPreviewSynchronizerOnNextFrame)
      {
        BWPreviewSynchronizerReset((uint64_t)self->_previewSynchronizer);
        self->_resetPreviewSynchronizerOnNextFrame = 0;
      }
      double InsertionTime = BWPreviewSynchronizerGetInsertionTime((double *)self->_previewSynchronizer, a3);
    }
    Float64 v16 = InsertionTime;
LABEL_51:
    CFTimeInterval v17 = CACurrentMediaTime();
    if (self->_imageQueueCurrentFreeSlots <= self->_imageQueueRequiredFreeSlots)
    {
      unint64_t v18 = CAImageQueueCollect();
      self->_imageQueueCurrentFreeSlots = v18;
      if (v18 <= self->_imageQueueRequiredFreeSlots) {
        -[BWImageQueueSinkNode _collectUnconsumedBuffersWithReason:collectMostFutureBuffers:]((uint64_t)self);
      }
    }
    if ([(BWFigVideoCaptureDevice *)self->_captureDevice cinematicVideoEnabled])
    {
      memset(&time, 0, sizeof(time));
      CMTimeMakeWithSeconds(&lhs, v16, 1000000000);
      CMTime rhs = v43;
      CMTimeSubtract(&time, &lhs, &rhs);
      frameDisplayLatencyStats = self->_frameDisplayLatencyStats;
      CMTime rhs = time;
      [(BWStats *)frameDisplayLatencyStats addDataPoint:CMTimeGetSeconds(&rhs)];
      [(BWStats *)self->_frameDisplayLatencyStats average];
      *(float *)&double v20 = v20;
      [(BWFigVideoCaptureDevice *)self->_captureDevice setCinematicVideoAverageRenderingTime:v20];
      [(BWStats *)self->_frameDisplayLatencyStats max];
      *(float *)&double v21 = v21;
      [(BWFigVideoCaptureDevice *)self->_captureDevice setCinematicVideoWorstCaseRenderingTime:v21];
    }
    CFTypeRef v22 = CMGetAttachment(a3, @"CAContextFencePortSendRight", 0);
    int v23 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F534C0]), "BOOLValue");
    if (self->_imageQueueCurrentFreeSlots > self->_imageQueueRequiredFreeSlots || v22 || v23)
    {
      BWSampleBufferRemoveAllAttachedMedia(a3);
      CMTime time = v43;
      long long v26 = -[BWImageQueueSinkNode _createContextForBuffer:bufferId:framePTS:]((uint64_t)self, a3, v35, (long long *)&time.value);
      if (self->_fenceSupportEnabled)
      {
        long long v27 = (void *)CMGetAttachment(a3, @"CAContextFencePortSendRight", 0);
        uint64_t v28 = objc_msgSend((id)CMGetAttachment(a3, @"CAContextFencePortGenerationID", 0), "longLongValue");
        [MEMORY[0x1E4F39CF8] begin];
        [MEMORY[0x1E4F39CF8] activateBackground:1];
        if (v27 && v28 > self->_lastFencedGenerationID)
        {
          -[CAContext setFencePort:](self->_imageQueueContext, "setFencePort:", [v27 port]);
          [v27 port];
          [v27 invalidate];
          self->_lastFencedGenerationID = v28;
          self->_framesSinceLastFence = 0;
        }
        ++self->_framesSinceLastFence;
        ++self->_framesSinceLastFenceIDWillChange;
      }
      if (*MEMORY[0x1E4F1EBA8] == 1)
      {
        CMTime time = v43;
        CMTimeGetSeconds(&time);
        CMTimeMakeWithSeconds(&v38, v17, 1000000000);
        CMTime time = v43;
        CMTimeSubtract(&v39, &v38, &time);
        CMTime time = v39;
        CMTimeGetSeconds(&time);
        CMTimeMakeWithSeconds(&v36, v16, 1000000000);
        CMTime time = v43;
        CMTimeSubtract(&v37, &v36, &time);
        CMTime time = v37;
        CMTimeGetSeconds(&time);
        kdebug_trace();
        if (*MEMORY[0x1E4F1EBA8] == 1)
        {
          CMTime time = v43;
          CMTimeGetSeconds(&time);
          kdebug_trace();
        }
      }
      FigCaptureTransformFlipAppliedBeforeRotationToAfter(self->_transform.mirrored, self->_transform.rotationDegrees);
      uint64_t inserted = CAImageQueueInsertImageWithRotation();
      if (inserted)
      {
        os_unfair_lock_lock(&self->_clientPIDLock);
        frameSender = self->_frameSender;
        if (frameSender) {
          [(CMCaptureFrameSenderService *)frameSender sendFrame:a3];
        }
        else {
          [(BWLimitedGMErrorLogger *)self->_limitedGMErrorLogger logErrorNumber:0xFFFFFFFFLL errorString:@"Frame sender is nil during render.  Skipping sending frame."];
        }
        os_unfair_lock_unlock(&self->_clientPIDLock);
        pthread_mutex_lock((pthread_mutex_t *)self->_surfaceRegistrationMutex);
        -[NSMutableArray addObject:](self->_bufferIDsInQueue, "addObject:", [NSNumber numberWithUnsignedLongLong:v35]);
        pthread_mutex_unlock((pthread_mutex_t *)self->_surfaceRegistrationMutex);
      }
      else
      {
        iqsn_cleanupBufferContext((uint64_t)v26);
        iqsn_releaseBufferContext(v26);
      }
      if (self->_fenceSupportEnabled) {
        [MEMORY[0x1E4F39CF8] commit];
      }
      self->_imageQueueCurrentFreeSlots = CAImageQueueCollect();
      double v24 = -[BWImageQueueSinkNode _processReleasedContexts]((uint64_t)self);
      if (inserted) {
        goto LABEL_83;
      }
    }
    else
    {
      uint64_t inserted = 0;
    }
    if (*MEMORY[0x1E4F1EBA8] == 1)
    {
      CMTime time = v43;
      CMTimeGetSeconds(&time);
      kdebug_trace();
    }
LABEL_83:
    previewTapDelegate = self->_previewTapDelegate;
    if (previewTapDelegate) {
      -[BWImageQueueSinkNodePreviewTapDelegate imageQueueSinkNode:didAttemptToEnqueuePreviewSampleBuffer:withSuccess:](previewTapDelegate, "imageQueueSinkNode:didAttemptToEnqueuePreviewSampleBuffer:withSuccess:", self, a3, inserted, v24);
    }
  }
}

- (double)_processReleasedContexts
{
  if (a1)
  {
    do
    {
      if (!*(void *)(a1 + 432)) {
        break;
      }
      unint64_t v2 = 0;
      uint64_t v3 = 0;
      char v4 = 0;
      do
      {
        uint64_t v5 = *(void *)(*(void *)(a1 + 424) + 8 * v2);
        if (*(void *)(v5 + 24) && *(_DWORD *)(v5 + 120) == 1)
        {
          if (!v3 || (time1 = *(CMTime *)(v3 + 32), CMTime v7 = *(CMTime *)(v5 + 32), CMTimeCompare(&time1, &v7) >= 1)) {
            uint64_t v3 = *(void *)(*(void *)(a1 + 424) + 8 * v2);
          }
          char v4 = 1;
        }
        ++v2;
      }
      while (*(void *)(a1 + 432) > v2);
      if (v3) {
        double result = -[BWImageQueueSinkNode _processBufferContext:](a1, v3);
      }
    }
    while ((v4 & 1) != 0);
  }
  return result;
}

- _createContextForBuffer:(uint64_t)a3 bufferId:(long long *)a4 framePTS:
{
  if (!a1) {
    return 0;
  }
  unint64_t v8 = *(void *)(a1 + 432);
  if (!v8) {
    goto LABEL_10;
  }
  unint64_t v9 = 0;
  do
  {
    uint64_t v10 = *(void *)(a1 + 424);
    if (*(void *)(*(void *)(v10 + 8 * v9) + 24)) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = *(_DWORD **)(v10 + 8 * v9);
    }
    ++v9;
  }
  while (v8 > v9 && !v11);
  if (!v11)
  {
LABEL_10:
    unint64_t v12 = v8 + 1;
    *(void *)(a1 + 432) = v12;
    *(void *)(a1 + 424) = malloc_type_realloc(*(void **)(a1 + 424), 8 * v12, 0x2004093837F09uLL);
    uint64_t v11 = malloc_type_calloc(0x80uLL, 1uLL, 0xF4519E87uLL);
    *(void *)(*(void *)(a1 + 424) + 8 * *(void *)(a1 + 432) - 8) = v11;
    v11[30] = 1;
  }
  *(void *)uint64_t v11 = cf;
  CFRetain(cf);
  *((void *)v11 + 2) = a3;
  *((void *)v11 + 3) = a1;
  *((void *)v11 + 1) = 0;
  long long v13 = *a4;
  *((void *)v11 + 6) = *((void *)a4 + 2);
  *((_OWORD *)v11 + 2) = v13;
  ++v11[30];
  return v11;
}

- (uint64_t)_bufferIDForSurface:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  char v4 = *(void **)(a1 + 384);
  if (!v4)
  {
    *(void *)(a1 + 384) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    goto LABEL_6;
  }
  uint64_t v5 = [v4 indexOfObjectIdenticalTo:a2];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_6:
    uint64_t v6 = CAImageQueueRegisterIOSurfaceBuffer();
    uint64_t v7 = *(void *)(a1 + 400) + 1;
    *(void *)(a1 + 400) = v7;
    unint64_t v8 = malloc_type_realloc(*(void **)(a1 + 392), 8 * v7, 0x100004000313F17uLL);
    *(void *)(a1 + 392) = v8;
    v8[*(void *)(a1 + 400) - 1] = v6;
    [*(id *)(a1 + 384) addObject:a2];
    return v6;
  }
  return *(void *)(*(void *)(a1 + 392) + 8 * v5);
}

- (double)_displayTimeSyncedWithFramePTS:(uint64_t)a1
{
  v41[24] = *(double *)MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0.0;
  }
  double v4 = CACurrentMediaTime();
  double v5 = a2 - *(double *)(a1 + 296);
  double v6 = v5 + *(double *)(a1 + 304);
  unint64_t Times = CAImageQueueGetTimes();
  if (Times)
  {
    if (Times == 1)
    {
      double v8 = 0.0166666667;
    }
    else
    {
      double v16 = v41[0];
      double v8 = v41[1] - v41[0];
      if (*(unsigned char *)(a1 + 336))
      {
        double v17 = *(double *)(a1 + 272);
        if (v17 > 0.0)
        {
          double v18 = v41[0] - v17;
          double v19 = round(v18 / v8);
          double v20 = v19 >= 1.0 ? v18 / v19 : *(double *)(a1 + 280);
          if (vabdd_f64(v20, v8) / v8 <= 0.1)
          {
            *(double *)(a1 + 280) = v20;
            double v8 = v20;
          }
        }
        *(double *)(a1 + 272) = v16;
      }
      if (v8 <= 0.001) {
        goto LABEL_62;
      }
      if (Times > 0x17)
      {
LABEL_7:
        double v10 = v5 / v8;
        double v11 = round(v5 / v8);
        double v12 = *(double *)(a1 + 304);
        if (v5 / v8 >= 1.0) {
          double v13 = v11;
        }
        else {
          double v13 = v5 / v8;
        }
        double v6 = v12 + v8 * v13;
        double v14 = vabdd_f64(1.0 / *(double *)(a1 + 320), 1.0 / v5);
        if ((v6 - a2 > 0.166 || *(unsigned char *)(a1 + 337) && v6 - v4 > v5 * 3.0) && v12 > 0.0)
        {
          if (v10 < 1.5 && *(unsigned char *)(a1 + 338))
          {
            double v15 = v12 + v8 * 0.01;
            if (v15 <= v41[0]) {
              double v6 = v41[0];
            }
            else {
              double v6 = v15;
            }
            if (*MEMORY[0x1E4F1EBA8] == 1) {
              kdebug_trace();
            }
          }
          else
          {
            double v6 = v8 + v12;
          }
        }
        double v21 = fmod(v5, v8);
        if (v14 <= 0.9)
        {
          double v28 = v21 / v8;
          if (v28 < 0.1 || v28 > 0.9)
          {
            if (*(unsigned char *)(a1 + 339))
            {
              float v35 = v10 - v13;
              float v36 = *(double *)(a1 + 288);
              double v37 = BWModifiedMovingAverage(fabsf(v35), v36, 0.01);
              *(double *)(a1 + 288) = v37;
            }
            else
            {
              double v37 = vabdd_f64(v10, v13);
            }
            double v39 = 1.0;
            unint64_t v40 = *(void *)(a1 + 328) + 1;
            *(void *)(a1 + 328) = v40;
            if (vcvtad_u64_f64(1.0 / v37) - 1 < v40)
            {
              *(void *)(a1 + 328) = 0;
              if (v13 > 1.0) {
                double v39 = -1.0;
              }
              double v6 = v6 + v8 * v13 * v39;
            }
          }
          else
          {
            unint64_t v29 = *(void *)(a1 + 328) + 1;
            *(void *)(a1 + 328) = v29;
            if (*(unsigned char *)(a1 + 339))
            {
              float v30 = v28;
              float v31 = *(double *)(a1 + 288);
              double v28 = BWModifiedMovingAverage(v30, v31, 0.01);
              *(double *)(a1 + 288) = v28;
              unint64_t v29 = *(void *)(a1 + 328);
            }
            unint64_t v32 = vcvtad_u64_f64(1.0 / v28);
            if (v29 >= v32)
            {
              *(void *)(a1 + 328) = 0;
              BOOL v33 = v32 <= 2 || v13 > 1.0;
              double v34 = -1.0;
              if (!v33) {
                double v34 = 1.0;
              }
              double v6 = v6 + v8 * v34;
            }
          }
        }
        else
        {
          *(void *)(a1 + 328) = 0;
          *(void *)(a1 + 288) = 0x7FF8000000000000;
        }
        unint64_t v22 = 0;
        double v23 = -v8;
        while (1)
        {
          double v24 = v41[v22];
          if (v6 < v24 && v4 < v24 + v23 * 0.5) {
            break;
          }
          if (++v22 == 24) {
            goto LABEL_62;
          }
        }
        if (v22 < 2 || (double v26 = v41[v22 - 1], v4 >= v26 + v23 * 0.5))
        {
          long long v27 = (double *)(a1 + 312);
          double v26 = v24;
        }
        else
        {
          long long v27 = (double *)(a1 + 312);
          if (a2 - *(double *)(a1 + 312) <= 2.0) {
            goto LABEL_52;
          }
        }
        *long long v27 = a2;
        double v24 = v26;
LABEL_52:
        double v6 = v24 + v23 * 0.25;
        goto LABEL_62;
      }
    }
    double v9 = v41[Times - 1];
    do
    {
      double v9 = v8 + v9;
      v41[Times++] = v9;
    }
    while (Times != 24);
    goto LABEL_7;
  }
LABEL_62:
  *(double *)(a1 + 296) = a2;
  *(double *)(a1 + 304) = v6;
  *(double *)(a1 + 320) = v5;
  return v6;
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  if (objc_msgSend((id)objc_msgSend(a3, "reason"), "isEqualToString:", 0x1EFA67EC0)) {
    -[BWImageQueueSinkNode _collectUnconsumedBuffersWithReason:collectMostFutureBuffers:]((uint64_t)self);
  }
  v7.receiver = self;
  v7.super_class = (Class)BWImageQueueSinkNode;
  [(BWNode *)&v7 handleDroppedSample:a3 forInput:a4];
}

- (void)setPreviewTapDelegate:(id)a3
{
  self->_previewTapDelegate = (BWImageQueueSinkNodePreviewTapDelegate *)a3;
}

- (void)setMaxLossyCompressionLevel:(int)a3
{
  if (self->_maxLossyCompressionLevel != a3)
  {
    self->_maxLossyCompressionLevel = a3;
    -[BWImageQueueSinkNode _updateInputRequirements]((uint64_t)self);
  }
}

- (BWImageQueueSinkNode)initWithHFRSupport:(BOOL)a3 ispJitterCompensationEnabled:(BOOL)a4 clientAuditToken:(id *)a5 sinkID:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BWImageQueueSinkNode;
  double v9 = [(BWSinkNode *)&v23 initWithSinkID:a6];
  uint64_t v10 = (uint64_t)v9;
  if (v9)
  {
    if (v8) {
      int v11 = 5;
    }
    else {
      int v11 = 3;
    }
    unsigned int v12 = v11 + (v8 && v7);
    v9->_imageQueueCapacity = v12;
    v9->_imageQueueRequiredFreeSlots = v12 - 3;
    v9->_imageQueueCurrentFreeSlots = v9->_imageQueueCapacity;
    v9->_imageQueueWidth = 640;
    v9->_imageQueueHeight = 480;
    v9->_resetPreviewSynchronizerOnNextFrame = 0;
    v9->_bufferIDsInQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *(void *)(v10 + 440) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *(void *)(v10 + 448) = FigSimpleMutexCreate();
    *(void *)(v10 + 456) = FigDispatchQueueCreateWithPriority();
    *(void *)(v10 + 360) = 40;
    long long v13 = *(_OWORD *)&a5->var0[4];
    long long v21 = *(_OWORD *)a5->var0;
    long long v22 = v13;
    if (FigCaptureClientIsRunningInXCTest(&v21)) {
      *(void *)(v10 + 360) = 0;
    }
    BOOL v14 = (int)FigCapturePlatformIdentifier() > 5;
    *(unsigned char *)(v10 + 336) = v14;
    *(unsigned char *)(v10 + 337) = v14;
    *(unsigned char *)(v10 + 338) = v14;
    *(unsigned char *)(v10 + 339) = v14;
    double v15 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v10];
    double v16 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v16 setSupportedCacheModes:+[BWVideoFormatRequirements cacheModesForOptimizedDisplayAccess]];
    [(BWNodeInput *)v15 setFormatRequirements:v16];
    [(BWNodeInput *)v15 setRetainedBufferCount:*(unsigned int *)(v10 + 168)];
    [(id)v10 addInput:v15];

    -[BWImageQueueSinkNode _updateInputRequirements](v10);
    [(id)v10 setSupportsLiveReconfiguration:1];
    *(void *)(v10 + 408) = FigSimpleMutexCreate();
    *(void *)(v10 + 624) = objc_alloc_init(BWStats);
    long long v17 = *(_OWORD *)&a5->var0[4];
    long long v21 = *(_OWORD *)a5->var0;
    long long v22 = v17;
    *(_DWORD *)(v10 + 640) = FigCaptureGetPIDFromAuditToken(&v21);
    long long v18 = *(_OWORD *)&a5->var0[4];
    *(_OWORD *)(v10 + 644) = *(_OWORD *)a5->var0;
    *(_OWORD *)(v10 + 660) = v18;
    *(_DWORD *)(v10 + 676) = 0;
    *(void *)&long long v18 = -1;
    *((void *)&v18 + 1) = -1;
    *(_OWORD *)(v10 + 216) = v18;
    *(_OWORD *)(v10 + 232) = v18;
    double v19 = [BWLimitedGMErrorLogger alloc];
    *(void *)(v10 + 688) = -[BWLimitedGMErrorLogger initWithName:maxLoggingCount:](v19, "initWithName:maxLoggingCount:", [NSString stringWithFormat:@"''%@", v10], 5);
  }
  return (BWImageQueueSinkNode *)v10;
}

- (uint64_t)_updateInputRequirements
{
  if (result)
  {
    uint64_t v1 = result;
    unint64_t v2 = (void *)[*(id *)(result + 8) formatRequirements];
    FigGetAlignmentForIOSurfaceOutput();
    [v2 setBytesPerRowAlignment:0];
    [v2 setPlaneAlignment:0];
    uint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] array];
    [v3 addObjectsFromArray:&unk_1EFB044A8];
    objc_msgSend(v3, "addObjectsFromArray:", FigCaptureSupportedPixelFormatsForCompressionType(4, 1, 0, *(_DWORD *)(v1 + 600)));
    [v2 setSupportedPixelFormats:v3];
    return [v2 setMemoryPoolUseAllowed:0];
  }
  return result;
}

- (void)setVideoHDRImageStatisticsEnabled:(BOOL)a3
{
  self->_videoHDRImageStatisticsEnabled = a3;
}

- (void)setTransform:(FigCaptureVideoTransform)a3
{
  self->_transform = a3;
}

- (void)setSyncStrategy:(int)a3
{
  self->_syncStrategy = a3;
}

- (void)setFenceSupportEnabled:(BOOL)a3
{
  self->_fenceSupportEnabled = a3;
}

- (void)setCaptureDevice:(id)a3
{
}

- (double)_processBufferContext:(uint64_t)a1
{
  if (a1)
  {
    if (*(void *)(a2 + 24) == a1)
    {
      CMTime v18 = *(CMTime *)(a2 + 32);
      uint64_t v4 = *(void *)(a2 + 80);
      memset(&v17, 0, sizeof(v17));
      int64_t v5 = FigHostTimeToNanoseconds();
      CMTimeMake(&v17, v5, 1000000000);
      memset(&v16, 0, sizeof(v16));
      CFTimeInterval v6 = CACurrentMediaTime();
      CMTimeMakeWithSeconds(&v16, v6, 1000000000);
      if (*MEMORY[0x1E4F1EBA8] == 1)
      {
        CMTime time = v18;
        CMTimeGetSeconds(&time);
        CMTime time = v17;
        CMTimeGetSeconds(&time);
        CMTime time = v16;
        CMTime rhs = v17;
        CMTimeSubtract(&v15, &time, &rhs);
        CMTime time = v15;
        CMTimeGetSeconds(&time);
        kdebug_trace();
      }
      if (v4 && *(void *)(a1 + 440))
      {
        if (*(_DWORD *)(a2 + 56))
        {
          uint64_t v7 = *(void *)(a2 + 80);
          CMGetAttachment(*(CMAttachmentBearerRef *)a2, @"IsOverCaptureFrame", 0);
          BOOL v8 = FigCFEqual() != 0;
          double v9 = *(NSObject **)(a1 + 456);
          v11[0] = MEMORY[0x1E4F143A8];
          v11[1] = 3221225472;
          v11[2] = __46__BWImageQueueSinkNode__processBufferContext___block_invoke;
          v11[3] = &unk_1E5C2BEE8;
          CMTime v12 = v18;
          v11[4] = a1;
          v11[5] = v7;
          BOOL v13 = v8;
          dispatch_async(v9, v11);
        }
      }
      -[BWImageQueueSinkNode _removeBufferFromInternalQueues:bufferId:](a1, *(opaqueCMSampleBuffer **)a2, *(void *)(a2 + 16));
    }
    return iqsn_cleanupBufferContext(a2);
  }
  return result;
}

- (uint64_t)_removeBufferFromInternalQueues:(uint64_t)a3 bufferId:
{
  if (result)
  {
    uint64_t v5 = result;
    pthread_mutex_lock(*(pthread_mutex_t **)(result + 408));
    uint64_t v6 = objc_msgSend(*(id *)(v5 + 416), "indexOfObject:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", a3));
    if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
      [*(id *)(v5 + 416) removeObjectAtIndex:v6];
    }
    pthread_mutex_unlock(*(pthread_mutex_t **)(v5 + 408));
    ImageBuffer = CMSampleBufferGetImageBuffer(a2);
    IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(ImageBuffer);
    double v9 = *(void **)(v5 + 384);
    if (!v9 || (double result = [v9 indexOfObject:IOSurface], result == 0x7FFFFFFFFFFFFFFFLL))
    {
      return CAImageQueueUnregisterBuffer();
    }
  }
  return result;
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(BWSinkNode *)self isActive])
  {
    if (dword_1EB4C5290)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return;
  }
  if (a4)
  {
    unsigned int v10 = [a4 width];
    unsigned int v11 = [a4 height];
    self->_imageQueueWidth = v10;
    self->_imageQueueHeight = v11;
    -[BWImageQueueSinkNode _ensureImageQueue]((uint64_t)self);
    os_unfair_lock_lock(&self->_clientPIDLock);
    if (!self->_holdingBuffersForClientAssertion)
    {
      long long v12 = *(_OWORD *)&self->_clientAuditToken.val[4];
      v15[0] = *(_OWORD *)self->_clientAuditToken.val;
      v15[1] = v12;
      if (FigCaptureAuditTokenIsValid((uint64_t)v15)) {
        self->_holdingBuffersForClientAssertion = (OS_os_transaction *)FigOSTransactionCreate();
      }
    }
    os_unfair_lock_unlock(&self->_clientPIDLock);
  }
  else if (!self)
  {
    goto LABEL_11;
  }
  self->_int liveSyncStrategy = self->_syncStrategy;
  self->_int savedSyncStrategy = 0;
  self->_liveVideoHDRImageStatisticsEnabled = self->_videoHDRImageStatisticsEnabled;
  self->_cleanupImageQueueAtEndOfData = 0;
LABEL_11:
  self->_resetPreviewSynchronizerOnNextFrame = 0;
  previewSynchronizer = (const void **)self->_previewSynchronizer;
  if (self->_liveSyncStrategy == 2)
  {
    if (previewSynchronizer) {
      BWPreviewSynchronizerReset((uint64_t)previewSynchronizer);
    }
    else {
      self->_previewSynchronizer = (OpaqueBWPreviewSynchronizer *)BWPreviewSynchronizerCreate(self->_imageQueue);
    }
    self->_imageQueueRequiredFreeSlots = 0;
  }
  else
  {
    BWPreviewSynchronizerDestroy(previewSynchronizer);
    self->_previewSynchronizer = 0;
    if (self->_liveSyncStrategy == 3)
    {
      self->_imageQueueRequiredFreeSlots = 0;
      self->_lastFramePTS = 0.0;
      self->_lastDisplayTime = 0.0;
    }
    else
    {
      self->_imageQueueRequiredFreeSlots = self->_imageQueueCapacity - 3;
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)BWImageQueueSinkNode;
  [(BWSinkNode *)&v14 configurationWithID:a3 updatedFormat:a4 didBecomeLiveForInput:a5];
}

- (void)fencePortGenerationIDWillChange
{
  if (self->_fenceSupportEnabled) {
    self->_fencePortGenerationIDWillChange = 1;
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)dealloc
{
  self->_previewPTSHistory = 0;
  FigSimpleMutexDestroy();
  BWPreviewSynchronizerDestroy((const void **)self->_previewSynchronizer);
  self->_previewSynchronizer = 0;
  uint64_t v3 = [(NSMutableArray *)self->_bufferIDsInQueue count];
  if (v3)
  {
    uint64_t v4 = v3;
    for (uint64_t i = 0; i != v4; ++i)
    {
      objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_bufferIDsInQueue, "objectAtIndexedSubscript:", i), "unsignedLongLongValue");
      CAImageQueueUnregisterBuffer();
    }
  }
  -[BWImageQueueSinkNode _cleanupIOSurfaces]((uint64_t)self);
  -[BWImageQueueSinkNode _cleanupImageQueueContext]((uint64_t)self);
  imageQueue = self->_imageQueue;
  if (imageQueue) {
    CFRelease(imageQueue);
  }

  self->_bufferIDsInQueue = 0;
  enqueuedBufferContexts = self->_enqueuedBufferContexts;
  if (enqueuedBufferContexts)
  {
    if (self->_enqueuedBufferContextCount)
    {
      unint64_t v8 = 0;
      do
      {
        iqsn_releaseBufferContext(self->_enqueuedBufferContexts[v8]);
        self->_enqueuedBufferContexts[v8++] = 0;
      }
      while (v8 < self->_enqueuedBufferContextCount);
      enqueuedBufferContexts = self->_enqueuedBufferContexts;
    }
    free(enqueuedBufferContexts);
  }

  if (self->_imageQueueSlot)
  {
    FPSupport_DeleteCASlot();
    self->_imageQueueSlot = 0;
  }

  self->_holdingBuffersForClientAssertion = 0;
  FigSimpleMutexDestroy();

  v9.receiver = self;
  v9.super_class = (Class)BWImageQueueSinkNode;
  [(BWSinkNode *)&v9 dealloc];
}

- (void)_cleanupIOSurfaces
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 400);
    if (v2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if ((objc_msgSend(*(id *)(a1 + 416), "containsObject:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", *(void *)(*(void *)(a1 + 392) + 8 * i))) & 1) == 0)CAImageQueueUnregisterBuffer(); {
      }
        }
    }
    *(void *)(a1 + 400) = 0;
    free(*(void **)(a1 + 392));
    *(void *)(a1 + 392) = 0;

    *(void *)(a1 + 384) = 0;
  }
}

- (uint64_t)_cleanupImageQueueContext
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(void *)(result + 592))
    {
      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] activateBackground:1];

      *(void *)(v1 + 592) = 0;
      uint64_t v2 = (void *)MEMORY[0x1E4F39CF8];
      return [v2 commit];
    }
  }
  return result;
}

- (_CAImageQueue)imageQueue
{
  return self->_imageQueue;
}

- (int)syncStrategy
{
  return self->_syncStrategy;
}

- (BOOL)fenceSupportEnabled
{
  return self->_fenceSupportEnabled;
}

- (int)maxLossyCompressionLevel
{
  return self->_maxLossyCompressionLevel;
}

- (FigCaptureVideoTransform)transform
{
  p_transform = &self->_transform;
  uint64_t v3 = *(void *)&self->_transform.mirrored;
  $470D365275581EF16070F5A11344F73E dimensions = p_transform->dimensions;
  result.$470D365275581EF16070F5A11344F73E dimensions = dimensions;
  result.mirrored = v3;
  result.rotationDegrees = HIDWORD(v3);
  return result;
}

- (BOOL)videoHDRImageStatisticsEnabled
{
  return self->_videoHDRImageStatisticsEnabled;
}

- (id)nodeSubType
{
  return @"ImageQueue";
}

- (BOOL)hasNonLiveConfigurationChanges
{
  return 0;
}

- (void)registerSurfacesFromSourcePool:(id)a3
{
  if (self->_imageQueue)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __55__BWImageQueueSinkNode_registerSurfacesFromSourcePool___block_invoke;
    v4[3] = &unk_1E5C2BEC0;
    v4[4] = self;
    [a3 enumerateSurfacesUsingBlock:v4];
    pthread_mutex_lock((pthread_mutex_t *)self->_surfaceRegistrationMutex);
    if ([(BWVideoFormat *)[(BWNodeInput *)self->super.super._input videoFormat] colorSpaceProperties])
    {
      -[BWImageQueueSinkNode _cleanupIOSurfaces]((uint64_t)self);
    }
    pthread_mutex_unlock((pthread_mutex_t *)self->_surfaceRegistrationMutex);
  }
}

uint64_t __55__BWImageQueueSinkNode_registerSurfacesFromSourcePool___block_invoke(uint64_t a1, uint64_t a2)
{
  pthread_mutex_lock(*(pthread_mutex_t **)(*(void *)(a1 + 32) + 408));
  -[BWImageQueueSinkNode _bufferIDForSurface:](*(void *)(a1 + 32), a2);
  uint64_t v4 = *(pthread_mutex_t **)(*(void *)(a1 + 32) + 408);
  return pthread_mutex_unlock(v4);
}

- (void)inputConnectionWillBeEnabled
{
  if (self->_previewSynchronizer) {
    self->_resetPreviewSynchronizerOnNextFrame = 1;
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)previewPTSDisplayedAtHostTime:(SEL)a3 allowingExtrapolation:(unint64_t)a4
{
  BOOL v20 = a5;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  pthread_mutex_lock((pthread_mutex_t *)self->_previewPTSHistoryMutex);
  int v7 = [(NSMutableArray *)self->_previewPTSHistory count];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v22 = self;
  unint64_t v8 = (void *)[(NSMutableArray *)self->_previewPTSHistory reverseObjectEnumerator];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    char v11 = 0;
    uint64_t v12 = *(void *)v30;
    while (2)
    {
      uint64_t v13 = 0;
      int v14 = v7;
      v7 -= v10;
      do
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v8);
        }
        CMTime v15 = *(void **)(*((void *)&v29 + 1) + 8 * v13);
        long long v27 = 0u;
        long long v28 = 0u;
        [v15 getValue:&v27];
        uint64_t v16 = *((void *)&v28 + 1);
        unint64_t v17 = a4 - *((void *)&v28 + 1);
        if (a4 >= *((void *)&v28 + 1))
        {
          *(_OWORD *)&retstr->var0 = v27;
          retstr->var3 = v28;
          if (!(v11 & 1 | (v14 < 2)) && v20)
          {
            long long v27 = 0u;
            long long v28 = 0u;
            objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](v22->_previewPTSHistory, "objectAtIndexedSubscript:", (v14 - 2)), "getValue:", &v27);
            *(_OWORD *)&rhs.value = v27;
            rhs.CMTimeEpoch epoch = v28;
            memset(&v26, 0, sizeof(v26));
            CMTime lhs = (CMTime)*retstr;
            unint64_t v18 = v17 / (v16 - *((void *)&v28 + 1));
            CMTimeSubtract(&v26, &lhs, &rhs);
            memset(&lhs, 0, sizeof(lhs));
            CMTime rhs = v26;
            CMTimeMultiply(&v23, &rhs, v18);
            CMTime rhs = (CMTime)*retstr;
            CMTimeAdd(&lhs, &rhs, &v23);
            FigHostTimeToNanoseconds();
            FigHostTimeToNanoseconds();
            FigHostTimeToNanoseconds();
            *(CMTime *)retstr = lhs;
          }
          return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)pthread_mutex_unlock((pthread_mutex_t *)v22->_previewPTSHistoryMutex);
        }
        ++v13;
        --v14;
        char v11 = 1;
      }
      while (v10 != v13);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)pthread_mutex_unlock((pthread_mutex_t *)v22->_previewPTSHistoryMutex);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)previewPTSAtHostTime:(SEL)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  pthread_mutex_lock((pthread_mutex_t *)self->_previewPTSHistoryMutex);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int v7 = (void *)[(NSMutableArray *)self->_previewPTSHistory reverseObjectEnumerator];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v14 = 0u;
        long long v15 = 0u;
        [v12 getValue:&v14];
        if (*((void *)&v15 + 1) <= a4)
        {
          *(_OWORD *)&retstr->var0 = v14;
          retstr->var3 = v15;
          return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)pthread_mutex_unlock((pthread_mutex_t *)self->_previewPTSHistoryMutex);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)pthread_mutex_unlock((pthread_mutex_t *)self->_previewPTSHistoryMutex);
}

- (void)didReachEndOfDataForInput:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  mach_absolute_time();
  FigHostTimeToNanoseconds();
  if (dword_1EB4C5290)
  {
    int v9 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[BWImageQueueSinkNode _collectUnconsumedBuffersWithReason:collectMostFutureBuffers:]((uint64_t)self);
  -[BWImageQueueSinkNode _processReleasedContexts]((uint64_t)self);
  -[BWImageQueueSinkNode _cleanupIOSurfaces]((uint64_t)self);
  -[BWImageQueueSinkNode _cleanupImageQueueContext]((uint64_t)self);
  -[BWImageQueueSinkNode _transferIOSurfaceOwnershipToEnqueuedBufferContext]((uint64_t)self);
  os_unfair_lock_lock(&self->_clientPIDLock);

  self->_frameSender = 0;
  *(void *)&long long v6 = -1;
  *((void *)&v6 + 1) = -1;
  *(_OWORD *)self->_frameSenderClientAuditToken.val = v6;
  *(_OWORD *)&self->_frameSenderClientAuditToken.val[4] = v6;
  os_unfair_lock_unlock(&self->_clientPIDLock);
  pthread_mutex_lock((pthread_mutex_t *)self->_previewPTSHistoryMutex);
  [(NSMutableArray *)self->_previewPTSHistory removeAllObjects];
  pthread_mutex_unlock((pthread_mutex_t *)self->_previewPTSHistoryMutex);
  self->_numFramesReceived = 0;
  self->_receivingBlackenedFrames = 0;
  self->_firstDisplayedFrameHostTime = 0;
  self->_didCallFirstFrameAtHostTimeCallback = 0;
  self->_didCallFirstFrameCallback = 0;
  self->_firstOverCaptureDisplayedFrameHostTime = 0;
  self->_didLogFirstOverCaptureFrame = 0;
  [(BWLimitedGMErrorLogger *)self->_limitedGMErrorLogger resetCurrentLoggingCounter];
  self->_cleanupImageQueueAtEndOfData = 0;
  v7.receiver = self;
  v7.super_class = (Class)BWImageQueueSinkNode;
  [(BWSinkNode *)&v7 didReachEndOfDataForInput:a3];
}

- (uint64_t)_collectUnconsumedBuffersWithReason:(uint64_t)result collectMostFutureBuffers:
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(_DWORD *)(result + 252) != 1) {
      CACurrentMediaTime();
    }
    CAImageQueueConsumeUnconsumedInRange();
    FigCaptureVideoTransform result = CAImageQueueCollect();
    *(void *)(v1 + 200) = result;
  }
  return result;
}

- (void)_transferIOSurfaceOwnershipToEnqueuedBufferContext
{
  if (a1 && *(void *)(a1 + 432))
  {
    unint64_t v2 = 0;
    do
    {
      uint64_t v3 = *(void *)(*(void *)(a1 + 424) + 8 * v2);
      if (v3 && *(void *)v3)
      {
        ImageBuffer = CMSampleBufferGetImageBuffer(*(CMSampleBufferRef *)v3);
        IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(ImageBuffer);
        if (IOSurface) {
          IOSurfaceRef IOSurface = CFRetain(IOSurface);
        }
        *(void *)(v3 + 8) = IOSurface;
        if (*(void *)v3)
        {
          CFRelease(*(CFTypeRef *)v3);
          *(void *)uint64_t v3 = 0;
        }
      }
      ++v2;
    }
    while (*(void *)(a1 + 432) > v2);
  }
}

- (BWImageQueueSinkNodePreviewTapDelegate)previewTapDelegate
{
  return self->_previewTapDelegate;
}

- (BWFigVideoCaptureDevice)captureDevice
{
  return self->_captureDevice;
}

- (BOOL)cleanupImageQueueAtEndOfData
{
  return self->_cleanupImageQueueAtEndOfData;
}

- (void)setCleanupImageQueueAtEndOfData:(BOOL)a3
{
  self->_cleanupImageQueueAtEndOfData = a3;
}

@end