@interface BWTimeOfFlightSynchronizerNode
+ (void)initialize;
- (BWNodeInput)pointCloudInput;
- (BWNodeInput)videoInput;
- (BWTimeOfFlightSynchronizerNode)init;
- (id)nodeSubType;
- (id)nodeType;
- (uint64_t)_attachPointCloudsToSampleBufferOrReportMissing:(unsigned char *)a3 pointCloudsAreMissing:;
- (uint64_t)_mergePointClouds:(__CVBuffer *)a3 intoDataBuffer:(_DWORD *)a4 numberOfPoints:;
- (unint64_t)_cleanupPointCloudBufferQueue;
- (unint64_t)_tryToEmitBuffers;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)handleDroppedSample:(id)a3 forInput:(id)a4;
- (void)handleNodeError:(id)a3 forInput:(id)a4;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWTimeOfFlightSynchronizerNode

+ (void)initialize
{
}

- (BWTimeOfFlightSynchronizerNode)init
{
  v11.receiver = self;
  v11.super_class = (Class)BWTimeOfFlightSynchronizerNode;
  v2 = [(BWNode *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_lastEmittedPTS = 0.0;
    v2->_maxVideoBufferQueueDepth = 1;
    v2->_maxPointCloudBufferQueueDepth = 10;
    [(BWNode *)v2 setSupportsConcurrentLiveInputCallbacks:1];
    v4 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v3 index:0];
    v3->_videoInput = v4;
    [(BWNodeInput *)v4 setRetainedBufferCount:v3->_maxVideoBufferQueueDepth];
    [(BWNodeInput *)v3->_videoInput setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeInput *)v3->_videoInput setPassthroughMode:1];
    [(BWNode *)v3 addInput:v3->_videoInput];
    v5 = [[BWNodeInput alloc] initWithMediaType:1885564004 node:v3 index:1];
    v3->_pointCloudInput = v5;
    [(BWNodeInput *)v5 setRetainedBufferCount:v3->_maxPointCloudBufferQueueDepth];
    [(BWNodeInput *)v3->_pointCloudInput setPassthroughMode:0];
    v6 = objc_alloc_init(BWPointCloudFormatRequirements);
    [(BWPointCloudFormatRequirements *)v6 setSupportedDataFormats:&unk_1EFB03020];
    [(BWNodeInput *)v3->_pointCloudInput setFormatRequirements:v6];
    [(BWNode *)v3 addInput:v3->_pointCloudInput];
    v7 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v3];
    [(BWNodeOutput *)v7 setPassthroughMode:1];
    [(BWNodeOutput *)v7 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    v8 = objc_alloc_init(BWPointCloudFormatRequirements);
    [(BWPointCloudFormatRequirements *)v8 setSupportedDataFormats:&unk_1EFB03038];
    v9 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    [(BWNodeOutputMediaConfiguration *)v9 setPassthroughMode:0];
    [(BWNodeOutputMediaConfiguration *)v9 setFormatRequirements:v8];
    [(BWNodeOutputMediaConfiguration *)v9 setProvidesDataBufferPool:1];
    [(BWNodeOutput *)v7 setMediaConfiguration:v9 forAttachedMediaKey:0x1EFA742C0];
    [(BWNode *)v3 addOutput:v7];
    v3->_pointCloudBufferQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v3->_videoBufferQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v3->_bufferServicingLock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

- (void)dealloc
{
  pointCloudFormatDescription = self->_pointCloudFormatDescription;
  if (pointCloudFormatDescription) {
    CFRelease(pointCloudFormatDescription);
  }

  v4.receiver = self;
  v4.super_class = (Class)BWTimeOfFlightSynchronizerNode;
  [(BWNode *)&v4 dealloc];
}

- (id)nodeType
{
  return @"Muxer";
}

- (id)nodeSubType
{
  return @"TimeOfFlightSynchronizer";
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (self->_videoInput == a4)
  {
    if ([a5 isEqualToString:@"PrimaryFormat"]) {
      [(BWNodeOutput *)self->super._output setFormat:a3];
    }
  }
  else
  {
    v9 = objc_alloc_init(BWPointCloudFormatRequirements);
    [(BWPointCloudFormatRequirements *)v9 setSupportedDataFormats:&unk_1EFB03050];
    -[BWPointCloudFormatRequirements setDataBufferSize:](v9, "setDataBufferSize:", 4 * [a3 dataBufferSize]);
    -[BWPointCloudFormatRequirements setMaxPoints:](v9, "setMaxPoints:", 4 * [a3 maxPoints]);
    v10 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    [(BWNodeOutputMediaConfiguration *)v10 setPassthroughMode:0];
    [(BWNodeOutputMediaConfiguration *)v10 setFormatRequirements:v9];
    [(BWNodeOutput *)self->super._output setMediaConfiguration:v10 forAttachedMediaKey:0x1EFA742C0];
    v12[0] = v9;
    self->_dataBufferPool = -[BWDataBufferPool initWithFormat:capacity:name:clientProvidesPool:]([BWDataBufferPool alloc], "initWithFormat:capacity:name:clientProvidesPool:", +[BWPointCloudFormat formatByResolvingRequirements:](BWPointCloudFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1]), 10, @"Time of flight pool", 0);
  }
  v11.receiver = self;
  v11.super_class = (Class)BWTimeOfFlightSynchronizerNode;
  [(BWNode *)&v11 didSelectFormat:a3 forInput:a4 forAttachedMediaKey:a5];
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  if (![(BWNodeOutput *)self->super._output liveFormat]) {
    [(BWNodeOutput *)self->super._output makeConfiguredFormatLive];
  }
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)didReachEndOfDataForInput:(id)a3
{
  unsigned int v4 = atomic_fetch_add_explicit(&self->_numEODMessagesReceived, 1u, memory_order_relaxed) + 1;
  if ([(NSArray *)[(BWNode *)self inputs] count] == v4)
  {
    os_unfair_lock_lock(&self->_bufferServicingLock);
    [(BWNodeOutput *)self->super._output markEndOfLiveOutput];
    os_unfair_lock_unlock(&self->_bufferServicingLock);
    self->_numEODMessagesReceived = 0;
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  if (self->_videoInput == a4) {
    v8 = &OBJC_IVAR___BWTimeOfFlightSynchronizerNode__videoBufferQueue;
  }
  else {
    v8 = &OBJC_IVAR___BWTimeOfFlightSynchronizerNode__pointCloudBufferQueue;
  }
  [*(id *)((char *)&self->super.super.isa + *v8) addObject:a3];
  -[BWTimeOfFlightSynchronizerNode _tryToEmitBuffers]((unint64_t)self);
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (unint64_t)_tryToEmitBuffers
{
  if (result)
  {
    unint64_t v1 = result;
    if ([*(id *)(result + 136) count])
    {
      CFStringRef v2 = (const __CFString *)*MEMORY[0x1E4F53070];
      uint64_t v3 = *MEMORY[0x1E4F530C0];
      uint64_t v4 = *MEMORY[0x1E4F53E48];
      do
      {
        v5 = (const void *)[*(id *)(v1 + 136) objectAtIndexedSubscript:0];
        BOOL v6 = [*(id *)(v1 + 136) count] > (unint64_t)*(int *)(v1 + 156)
          || [*(id *)(v1 + 128) count] > (unint64_t)*(int *)(v1 + 160);
        char v11 = 0;
        char v7 = -[BWTimeOfFlightSynchronizerNode _attachPointCloudsToSampleBufferOrReportMissing:pointCloudsAreMissing:](v1, v5, &v11);
        if (!v6 && (v7 & 1) == 0 && !v11) {
          break;
        }
        v8 = (void *)CMGetAttachment(v5, v2, 0);
        CMTimeMakeFromDictionary(&time, (CFDictionaryRef)[v8 objectForKeyedSubscript:v3]);
        double Seconds = CMTimeGetSeconds(&time);
        objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", v4), "doubleValue");
        *(double *)(v1 + 104) = Seconds + v10 * 0.5;
        [*(id *)(v1 + 16) emitSampleBuffer:v5];
        [*(id *)(v1 + 136) removeObject:v5];
      }
      while ([*(id *)(v1 + 136) count]);
    }
    return -[BWTimeOfFlightSynchronizerNode _cleanupPointCloudBufferQueue](v1);
  }
  return result;
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  [(BWNodeOutput *)self->super._output emitNodeError:a3];
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  if (self->_videoInput == a4)
  {
    p_bufferServicingLock = &self->_bufferServicingLock;
    os_unfair_lock_lock(&self->_bufferServicingLock);
    [(BWNodeOutput *)self->super._output emitDroppedSample:a3];
    os_unfair_lock_unlock(p_bufferServicingLock);
  }
}

- (uint64_t)_attachPointCloudsToSampleBufferOrReportMissing:(unsigned char *)a3 pointCloudsAreMissing:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  CFTypeRef cf = 0;
  BOOL v6 = (const void *)[*(id *)(a1 + 128) lastObject];
  if (!v6) {
    return 0;
  }
  CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F53070];
  v8 = (void *)CMGetAttachment(v6, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  uint64_t v9 = *MEMORY[0x1E4F530C0];
  CMTimeMakeFromDictionary(&time, (CFDictionaryRef)[v8 objectForKeyedSubscript:*MEMORY[0x1E4F530C0]]);
  double Seconds = CMTimeGetSeconds(&time);
  char v11 = (void *)CMGetAttachment(a2, v7, 0);
  CMTimeMakeFromDictionary(&time, (CFDictionaryRef)[v11 objectForKeyedSubscript:v9]);
  double v12 = CMTimeGetSeconds(&time);
  objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E4F53E48]), "doubleValue");
  double v14 = v12 + v13 * 0.5;
  if (Seconds + 0.0083 <= v14 + 0.0166) {
    return 0;
  }
  v29 = a3;
  v15 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", Seconds + 0.0083);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v16 = *(void **)(a1 + 128);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v32 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(const void **)(*((void *)&v31 + 1) + 8 * i);
        CFDictionaryRef v22 = (const __CFDictionary *)objc_msgSend((id)CMGetAttachment(v21, v7, 0), "objectForKeyedSubscript:", v9);
        CMTimeMakeFromDictionary(&time, v22);
        double v23 = CMTimeGetSeconds(&time);
        if (v23 > v14 + -0.0166 && v23 <= v14 + 0.0166) {
          [v15 addObject:v21];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v18);
  }
  if (![v15 count] && Seconds > v14)
  {
    uint64_t v25 = 0;
    unsigned char *v29 = 1;
    return v25;
  }
  if (![v15 count]) {
    return 0;
  }
  v26 = (__CVBuffer *)[*(id *)(a1 + 168) newDataBuffer];
  if (!v26) {
    return 0;
  }
  v27 = v26;
  unsigned int v30 = 0;
  if (-[BWTimeOfFlightSynchronizerNode _mergePointClouds:intoDataBuffer:numberOfPoints:](a1, v15, v26, &v30))
  {
    CMTime time = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
    BWSampleBufferCreateFromDataBufferWithNumberOfPoints(v27, (uint64_t)&time, 0x6A737070u, (CFTypeRef *)(a1 + 144), &cf, v30);
    if (cf)
    {
      BWSampleBufferSetAttachedMedia(a2, 0x1EFA742C0, (uint64_t)cf);
      uint64_t v25 = 1;
      goto LABEL_24;
    }
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  uint64_t v25 = 0;
LABEL_24:
  CFRelease(v27);
  if (cf) {
    CFRelease(cf);
  }
  return v25;
}

- (unint64_t)_cleanupPointCloudBufferQueue
{
  if (result)
  {
    unint64_t v1 = result;
    result = [*(id *)(result + 128) count];
    if (result)
    {
      CFStringRef v2 = (const __CFString *)*MEMORY[0x1E4F53070];
      uint64_t v3 = *MEMORY[0x1E4F530C0];
      do
      {
        uint64_t v4 = (const void *)[*(id *)(v1 + 128) objectAtIndexedSubscript:0];
        CFDictionaryRef v5 = (const __CFDictionary *)objc_msgSend((id)CMGetAttachment(v4, v2, 0), "objectForKeyedSubscript:", v3);
        CMTimeMakeFromDictionary(&time, v5);
        double Seconds = CMTimeGetSeconds(&time);
        double v7 = *(double *)(v1 + 104);
        if (v7 == 0.0 || Seconds > v7 + 0.0166)
        {
          result = objc_msgSend(*(id *)(v1 + 128), "count", Seconds);
          if (result <= *(int *)(v1 + 160)) {
            break;
          }
        }
        objc_msgSend(*(id *)(v1 + 128), "removeObject:", v4, Seconds);
        result = [*(id *)(v1 + 128) count];
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)_mergePointClouds:(__CVBuffer *)a3 intoDataBuffer:(_DWORD *)a4 numberOfPoints:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    id obj = (id)[MEMORY[0x1E4F1CA48] array];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v7 = [a2 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      LODWORD(v9) = 0;
      uint64_t v10 = *(void *)v33;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(a2);
        }
        CVDataBuffer = (__CVBuffer *)BWSampleBufferGetCVDataBuffer(*(opaqueCMSampleBuffer **)(*((void *)&v32 + 1)
                                                                                            + 8 * v11));
        id v13 = (id)[objc_alloc((Class)getADJasperPointCloudClass()) initWithDataBuffer:CVDataBuffer];
        if (!v13) {
          goto LABEL_24;
        }
        id v14 = v13;
        uint64_t v9 = [v13 length] + v9;
        [obj addObject:v14];
        if (v8 == ++v11)
        {
          uint64_t v8 = [a2 countByEnumeratingWithState:&v32 objects:v37 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_12;
        }
      }
    }
    uint64_t v9 = 0;
    CVDataBuffer = 0;
LABEL_12:
    result = [(id)getADJasperPointCloudClass() prepareDataBuffer:a3 forLength:v9];
    if (result)
    {
      id v15 = (id)[objc_alloc((Class)getADMutableJasperPointCloudClass()) initWithDataBuffer:a3];
      if (!v15)
      {
LABEL_24:
        fig_log_get_emitter();
        FigDebugAssert3();
        return 0;
      }
      v16 = v15;
      buffer = a3;
      v26 = a4;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      uint64_t v17 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        int v19 = 0;
        uint64_t v20 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v29 != v20) {
              objc_enumerationMutation(obj);
            }
            CFDictionaryRef v22 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            objc_msgSend(v16, "replacePointsInRange:withPointsFrom:range:", v19, (int)objc_msgSend(v22, "length"), v22, 0, (int)objc_msgSend(v22, "length"));
            v19 += [v22 length];
          }
          uint64_t v18 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
        }
        while (v18);
      }
      if (CVDataBuffer)
      {
        CFTypeRef v23 = CVBufferCopyAttachment(CVDataBuffer, @"CameraCalibration", 0);
        if (v23) {
          CFTypeRef v24 = CFAutorelease(v23);
        }
        else {
          CFTypeRef v24 = 0;
        }
        CVBufferSetAttachment(buffer, @"CameraCalibration", v24, kCVAttachmentMode_ShouldPropagate);
      }
      _DWORD *v26 = v9;
      return 1;
    }
  }
  return result;
}

- (BWNodeInput)videoInput
{
  return self->_videoInput;
}

- (BWNodeInput)pointCloudInput
{
  return self->_pointCloudInput;
}

@end