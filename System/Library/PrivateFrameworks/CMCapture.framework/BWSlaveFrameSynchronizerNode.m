@interface BWSlaveFrameSynchronizerNode
+ (void)initialize;
- (BOOL)emitsUnsynchronizedFramesWhileStopping;
- (BWSlaveFrameSynchronizerNode)initWithDepthEnabled:(BOOL)a3 numberOfInputs:(int)a4 syncSlaveForMasterPortTypes:(id)a5 separateDepthComponentsEnabled:(BOOL)a6 preLTMThumbnailEnabled:(BOOL)a7 postColorProcessingThumbnailEnabled:(BOOL)a8 numberOfSecondaryFramesToSkip:(int)a9;
- (BWSlaveFrameSynchronizerNode)initWithDepthEnabled:(BOOL)a3 numberOfInputs:(int)a4 syncSlaveForMasterPortTypes:(id)a5 separateDepthComponentsEnabled:(BOOL)a6 preLTMThumbnailEnabledInputs:(id)a7 postColorProcessingThumbnailEnabledInputs:(id)a8 differentInputFormatsSupported:(BOOL)a9 bufferSize:(int)a10 numberOfSlaveFramesToSkip:(int)a11 startEmittingMasterFramesBeforeSlaveStreamStarts:(BOOL)a12;
- (id)nodeSubType;
- (id)nodeType;
- (uint64_t)_setupAttachedMediaConfigurationForInput:(uint64_t)a3 attachedMediaKey:;
- (uint64_t)_setupAttachedMediaConfigurationForOutput:(uint64_t)a3 attachedMediaKey:(uint64_t)a4 inputIndexesDrivingAttachedMediaOutput:;
- (unint64_t)_printState;
- (void)_emitDroppedFrame:(uint64_t)a1 captureID:(CMTime *)a2 inputIndex:;
- (void)_emitDroppedFrames:(uint64_t)a1 captureID:(CMTime *)a2 inputIndex:(int)a3;
- (void)_purgeAllBuffers;
- (void)_purgeAllPurgeableBuffers;
- (void)_tryToEmitBuffersWithSynchronizationEnabled:(uint64_t)a1;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)handleDroppedSample:(id)a3 forInput:(id)a4;
- (void)handleNodeError:(id)a3 forInput:(id)a4;
- (void)handleStillImageReferenceFrameBracketedCaptureSequenceNumber:(int)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setEmitsUnsynchronizedFramesWhileStopping:(BOOL)a3;
@end

@implementation BWSlaveFrameSynchronizerNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  v30[1] = *MEMORY[0x1E4F143B8];
  v9 = [(BWNode *)self output];
  v21 = self;
  if ([a5 isEqualToString:@"PrimaryFormat"])
  {
    if (!self->_differentInputFormatsSupported)
    {
      v28[0] = @"PrimaryFormat";
      v28[1] = @"SynchronizedSlaveFrame";
      v10 = (void *)MEMORY[0x1E4F1C978];
      v11 = (__CFString **)v28;
      uint64_t v12 = 2;
      goto LABEL_9;
    }
    if ([a4 index] == 1)
    {
      v30[0] = @"PrimaryFormat";
      v10 = (void *)MEMORY[0x1E4F1C978];
      v11 = (__CFString **)v30;
    }
    else
    {
      v29 = @"SynchronizedSlaveFrame";
      v10 = (void *)MEMORY[0x1E4F1C978];
      v11 = &v29;
    }
  }
  else
  {
    uint64_t v27 = -[BWNodeOutput attachedMediaKeyDrivenByInputAttachedMediaKey:inputIndex:](v9, "attachedMediaKeyDrivenByInputAttachedMediaKey:inputIndex:", a5, [a4 index]);
    v10 = (void *)MEMORY[0x1E4F1C978];
    v11 = (__CFString **)&v27;
  }
  uint64_t v12 = 1;
LABEL_9:
  v13 = (void *)[v10 arrayWithObjects:v11 count:v12];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v19 = [(BWNodeOutput *)v9 mediaPropertiesForAttachedMediaKey:v18];
        if (!v19)
        {
          if ([v18 isEqualToString:@"PrimaryFormat"])
          {
            uint64_t v20 = [NSString stringWithFormat:@"%@ output %@ has no media properties for the primary format (provided media key is %@)", v21, v9, a5];
            objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v20 userInfo:0]);
          }
          v19 = objc_alloc_init(BWNodeOutputMediaProperties);
          [(BWNodeOutput *)v9 _setMediaProperties:v19 forAttachedMediaKey:v18];
        }
        [(BWNodeOutputMediaProperties *)v19 setResolvedFormat:a3];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v15);
  }
}

- (id)nodeType
{
  return @"Muxer";
}

- (BWSlaveFrameSynchronizerNode)initWithDepthEnabled:(BOOL)a3 numberOfInputs:(int)a4 syncSlaveForMasterPortTypes:(id)a5 separateDepthComponentsEnabled:(BOOL)a6 preLTMThumbnailEnabled:(BOOL)a7 postColorProcessingThumbnailEnabled:(BOOL)a8 numberOfSecondaryFramesToSkip:(int)a9
{
  BOOL v9 = a8;
  BOOL v10 = a6;
  uint64_t v12 = *(void *)&a4;
  BOOL v13 = a3;
  if (a7)
  {
    uint64_t v15 = (void *)[MEMORY[0x1E4F1CA48] array];
    if ((int)v12 >= 1)
    {
      uint64_t v16 = 0;
      do
      {
        objc_msgSend(v15, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v16));
        uint64_t v16 = (v16 + 1);
      }
      while (v12 != v16);
    }
  }
  else
  {
    uint64_t v15 = 0;
  }
  if (v9)
  {
    v17 = (void *)[MEMORY[0x1E4F1CA48] array];
    if ((int)v12 >= 1)
    {
      uint64_t v18 = 0;
      do
      {
        objc_msgSend(v17, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v18));
        uint64_t v18 = (v18 + 1);
      }
      while (v12 != v18);
    }
  }
  else
  {
    v17 = 0;
  }
  BYTE4(v21) = 1;
  HIDWORD(v20) = 1;
  LODWORD(v21) = a9;
  LOBYTE(v20) = 0;
  return -[BWSlaveFrameSynchronizerNode initWithDepthEnabled:numberOfInputs:syncSlaveForMasterPortTypes:separateDepthComponentsEnabled:preLTMThumbnailEnabledInputs:postColorProcessingThumbnailEnabledInputs:differentInputFormatsSupported:bufferSize:numberOfSlaveFramesToSkip:startEmittingMasterFramesBeforeSlaveStreamStarts:](self, "initWithDepthEnabled:numberOfInputs:syncSlaveForMasterPortTypes:separateDepthComponentsEnabled:preLTMThumbnailEnabledInputs:postColorProcessingThumbnailEnabledInputs:differentInputFormatsSupported:bufferSize:numberOfSlaveFramesToSkip:startEmittingMasterFramesBeforeSlaveStreamStarts:", v13, v12, a5, v10, v15, v17, v20, v21);
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(BWNode *)self inputs];
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(BWNodeInput **)(*((void *)&v10 + 1) + 8 * i);
        if (v8 != self->super._input) {
          [(BWFormat *)[(BWNodeInput *)v8 format] isEqual:[(BWNodeInput *)self->super._input format]];
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  self->_slaveStreamHasStarted = 0;
  self->_numSlaveFramesReceived = 0;
  v9.receiver = self;
  v9.super_class = (Class)BWSlaveFrameSynchronizerNode;
  [(BWNode *)&v9 prepareForCurrentConfigurationToBecomeLive];
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

- (void)_emitDroppedFrame:(uint64_t)a1 captureID:(CMTime *)a2 inputIndex:
{
  if (a1)
  {
    if (*MEMORY[0x1E4F1EBA8] == 1)
    {
      CMTime v5 = *a2;
      CMTimeGetSeconds(&v5);
      kdebug_trace();
    }
    CMTime v5 = *a2;
    id v4 = +[BWDroppedSample newDroppedSampleWithReason:0x1EFA67EA0 pts:&v5];
    [*(id *)(a1 + 16) emitDroppedSample:v4];
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  if (BWSampleBufferIsMarkerBuffer(a3))
  {
    [(BWNodeOutput *)self->super._output emitSampleBuffer:a3];
  }
  else
  {
    inputSampleBufferQueues = self->_inputSampleBufferQueues;
    objc_super v9 = inputSampleBufferQueues[[a4 index]];
    CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F53070];
    long long v11 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    uint64_t v12 = *MEMORY[0x1E4F542D8];
    objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E4F542D8]), "intValue");
    uint64_t v13 = *MEMORY[0x1E4F542E0];
    if (objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E4F542E0]), "BOOLValue"))
    {
      self->_mostRecentMasterInputIndex = [a4 index];
    }
    else if (!self->_slaveStreamHasStarted)
    {
      self->_slaveStreamHasStarted = 1;
    }
    if (CMSimpleQueueGetCount(v9) == self->_numBufferedFrames)
    {
      uint64_t v14 = (void *)CMSimpleQueueDequeue(v9);
      uint64_t v15 = (void *)CMGetAttachment(v14, v10, 0);
      int v16 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", v12), "intValue");
      objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", v13), "BOOLValue");
      memset(&v20, 0, sizeof(v20));
      CMSampleBufferGetPresentationTimeStamp(&v20, (CMSampleBufferRef)v14);
      memset(&v19, 0, sizeof(v19));
      CMSampleBufferGetPresentationTimeStamp(&v19, a3);
      -[BWSlaveFrameSynchronizerNode _printState]((unint64_t)self);
      [a4 index];
      CMTime v18 = v20;
      -[BWSlaveFrameSynchronizerNode _emitDroppedFrames:captureID:inputIndex:]((uint64_t)self, &v18, v16);
      if (v14) {
        CFRelease(v14);
      }
    }
    if (a3) {
      CFTypeRef v17 = CFRetain(a3);
    }
    else {
      CFTypeRef v17 = 0;
    }
    if (CMSimpleQueueEnqueue(v9, v17))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      if (a3) {
        CFRelease(a3);
      }
    }
    else
    {
      -[BWSlaveFrameSynchronizerNode _purgeAllPurgeableBuffers](self);
      -[BWSlaveFrameSynchronizerNode _tryToEmitBuffersWithSynchronizationEnabled:]((uint64_t)self, 1);
    }
  }
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)_tryToEmitBuffersWithSynchronizationEnabled:(uint64_t)a1
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (!a1 || !objc_msgSend((id)objc_msgSend((id)a1, "inputs"), "count")) {
    return;
  }
  unint64_t v3 = 0;
  BOOL v46 = 0;
  uint64_t v4 = 0;
  v45 = 0;
  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F53070];
  uint64_t v6 = *MEMORY[0x1E4F542E0];
  uint64_t v48 = *MEMORY[0x1E4F542D8];
  CFTypeRef v43 = (CFTypeRef)*MEMORY[0x1E4F1CFD0];
  uint64_t v44 = *MEMORY[0x1E4F54128];
  int v47 = -1;
  int v7 = -1;
  do
  {
    Head = CMSimpleQueueGetHead(*(CMSimpleQueueRef *)(*(void *)(a1 + 104) + 8 * v3));
    if (Head)
    {
      objc_super v9 = Head;
      CFStringRef v10 = (void *)CMGetAttachment(Head, v5, 0);
      if (objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", v6), "BOOLValue"))
      {
        int v11 = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", v48), "intValue");
        if (v11 > v7)
        {
          int v12 = v11;
          BOOL v46 = CMGetAttachment(v9, @"IsHarvestedStillFrame", 0) == v43;
          uint64_t v4 = [v10 objectForKeyedSubscript:v44];
          v45 = v10;
          int v7 = v12;
          int v47 = v3;
        }
      }
    }
    ++v3;
  }
  while (objc_msgSend((id)objc_msgSend((id)a1, "inputs"), "count") > v3);
  int v13 = v47;
  if (v47 == -1 || !v4) {
    return;
  }
  uint64_t v14 = *(opaqueCMSimpleQueue **)(*(void *)(a1 + 104) + 8 * v47);
  uint64_t v15 = CMSimpleQueueGetHead(v14);
  int v16 = v15;
  if (!*(unsigned char *)(a1 + 116) && *(unsigned char *)(a1 + 128)) {
    sfsn_setOverCaptureSlaveStreamStatusOnSampleBuffer(v15, 1);
  }
  if (v46) {
    sfsn_setOverCaptureSlaveStreamStatusOnSampleBuffer(v16, 4);
  }
  CFTypeRef v17 = CMSimpleQueueGetHead(v14);
  unsigned int v18 = objc_msgSend((id)CMGetAttachment(v17, @"OverCaptureSlaveStreamStatus", 0), "intValue");
  if (v18 > 4 || ((1 << v18) & 0x1A) == 0)
  {
    CMTime v20 = *(void **)(a1 + 152);
    if (!v20)
    {
      if (!a2)
      {
LABEL_41:
        v31 = *(opaqueCMSimpleQueue **)(*(void *)(a1 + 104) + 8 * v13);
        v32 = (opaqueCMSampleBuffer *)CMSimpleQueueGetHead(v31);
        int v33 = 0;
        v34 = 0;
LABEL_42:
        memset(&v50, 0, sizeof(v50));
        CMSampleBufferGetPresentationTimeStamp(&v50, v32);
        CMTime v49 = v50;
        -[BWSlaveFrameSynchronizerNode _emitDroppedFrames:captureID:inputIndex:](a1, &v49, -1);
        [*(id *)(a1 + 16) emitSampleBuffer:v32];
        v35 = CMSimpleQueueDequeue(v31);
        if (v35) {
          CFRelease(v35);
        }
        if (v33)
        {
          v36 = CMSimpleQueueDequeue(v34);
          if (v36) {
            CFRelease(v36);
          }
        }
        return;
      }
      goto LABEL_33;
    }
  }
  else
  {
    CMTime v20 = *(void **)(a1 + 152);
    if (!v20) {
      goto LABEL_41;
    }
  }
  if (![v20 containsObject:v4]) {
    goto LABEL_41;
  }
  uint64_t v21 = (void *)[v45 objectForKeyedSubscript:*MEMORY[0x1E4F54300]];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v22 = (void *)[v21 allValues];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (!v23) {
    goto LABEL_41;
  }
  uint64_t v24 = v23;
  int v25 = 0;
  uint64_t v26 = *(void *)v52;
  uint64_t v27 = *MEMORY[0x1E4F54260];
  do
  {
    for (uint64_t i = 0; i != v24; ++i)
    {
      if (*(void *)v52 != v26) {
        objc_enumerationMutation(v22);
      }
      v25 += objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v51 + 1) + 8 * i), "objectForKeyedSubscript:", v27), "BOOLValue");
    }
    uint64_t v24 = [v22 countByEnumeratingWithState:&v51 objects:v55 count:16];
  }
  while (v24);
  int v13 = v47;
  if (v25 < 1 || (a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_33:
  if (objc_msgSend((id)objc_msgSend((id)a1, "inputs"), "count"))
  {
    uint64_t v29 = 0;
    while (1)
    {
      if (v13 != v29)
      {
        v30 = CMSimpleQueueGetHead(*(CMSimpleQueueRef *)(*(void *)(a1 + 104) + 8 * v29));
        if (v30)
        {
          if (objc_msgSend((id)objc_msgSend((id)CMGetAttachment(v30, v5, 0), "objectForKeyedSubscript:", v48), "intValue") == v7)break; {
        }
          }
      }
      if (objc_msgSend((id)objc_msgSend((id)a1, "inputs"), "count") <= (unint64_t)++v29) {
        return;
      }
    }
    if (v29 != -1)
    {
      uint64_t v37 = *(void *)(a1 + 104);
      if (v13 <= (int)v29) {
        int v38 = v29;
      }
      else {
        int v38 = v13;
      }
      v31 = *(opaqueCMSimpleQueue **)(v37 + 8 * v38);
      if (v13 >= (int)v29) {
        int v39 = v29;
      }
      else {
        int v39 = v13;
      }
      v34 = *(opaqueCMSimpleQueue **)(v37 + 8 * v39);
      v32 = (opaqueCMSampleBuffer *)CMSimpleQueueGetHead(v31);
      v40 = (opaqueCMSampleBuffer *)CMSimpleQueueGetHead(v34);
      v41 = v40;
      if (v40 && (++*(_DWORD *)(a1 + 120), *(_DWORD *)(a1 + 120) <= *(_DWORD *)(a1 + 124)) && !*(void *)(a1 + 152))
      {
        if (!*(unsigned char *)(a1 + 128)) {
          return;
        }
        if (objc_msgSend((id)objc_msgSend((id)CMGetAttachment(v40, v5, 0), "objectForKeyedSubscript:", v44), "isEqualToString:", *MEMORY[0x1E4F52DD8]))v32 = v41; {
        int v33 = 1;
        }
        sfsn_setOverCaptureSlaveStreamStatusOnSampleBuffer(v32, 1);
      }
      else
      {
        BWSampleBufferSetAttachedMedia(v32, @"SynchronizedSlaveFrame", (uint64_t)v40);
        int v33 = 1;
      }
      goto LABEL_42;
    }
  }
}

- (void)_purgeAllPurgeableBuffers
{
  if (result)
  {
    v1 = result;
    if (objc_msgSend((id)objc_msgSend(result, "inputs"), "count"))
    {
      unint64_t v2 = 0;
      CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F53070];
      uint64_t v4 = *MEMORY[0x1E4F542D8];
      int v5 = -1;
      uint64_t v6 = (uint64_t *)MEMORY[0x1E4F542E0];
      uint64_t v7 = *MEMORY[0x1E4F542E0];
      do
      {
        Head = (opaqueCMSampleBuffer *)CMSimpleQueueGetHead(*(CMSimpleQueueRef *)(v1[13] + 8 * v2));
        if (Head)
        {
          objc_super v9 = Head;
          CFStringRef v10 = (void *)CMGetAttachment(Head, v3, 0);
          int v11 = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", v4), "intValue");
          if (v11 > v5)
          {
            int v12 = v11;
            objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", v7), "BOOLValue");
            CMSampleBufferGetPresentationTimeStamp(&v27, v9);
            int v5 = v12;
          }
        }
        ++v2;
      }
      while (objc_msgSend((id)objc_msgSend(v1, "inputs"), "count") > v2);
    }
    else
    {
      uint64_t v6 = (uint64_t *)MEMORY[0x1E4F542E0];
      int v5 = -1;
    }
    result = objc_msgSend((id)objc_msgSend(v1, "inputs"), "count");
    if (result)
    {
      unint64_t v13 = 0;
      char v25 = 0;
      CFStringRef v14 = (const __CFString *)*MEMORY[0x1E4F53070];
      uint64_t v15 = *MEMORY[0x1E4F542D8];
      uint64_t v16 = *v6;
      do
      {
        CFTypeRef v17 = *(opaqueCMSimpleQueue **)(v1[13] + 8 * v13);
        unsigned int v18 = (opaqueCMSampleBuffer *)CMSimpleQueueGetHead(v17);
        if (v18)
        {
          CMTime v19 = v18;
          CMTime v20 = (void *)CMGetAttachment(v18, v14, 0);
          int v21 = objc_msgSend((id)objc_msgSend(v20, "objectForKeyedSubscript:", v15), "intValue");
          if (v21 < v5)
          {
            int v22 = v21;
            do
            {
              objc_msgSend((id)objc_msgSend(v20, "objectForKeyedSubscript:", v16), "BOOLValue");
              memset(&v27, 0, sizeof(v27));
              CMSampleBufferGetPresentationTimeStamp(&v27, v19);
              uint64_t v23 = CMSimpleQueueDequeue(v17);
              CMTime v26 = v27;
              -[BWSlaveFrameSynchronizerNode _emitDroppedFrames:captureID:inputIndex:]((uint64_t)v1, &v26, v22);
              if (v23) {
                CFRelease(v23);
              }
              uint64_t v24 = (opaqueCMSampleBuffer *)CMSimpleQueueGetHead(v17);
              if (!v24) {
                break;
              }
              CMTime v19 = v24;
              CMTime v20 = (void *)CMGetAttachment(v24, v14, 0);
              int v22 = objc_msgSend((id)objc_msgSend(v20, "objectForKeyedSubscript:", v15), "intValue");
            }
            while (v22 < v5);
            char v25 = 1;
          }
        }
        ++v13;
        result = objc_msgSend((id)objc_msgSend(v1, "inputs"), "count");
      }
      while ((unint64_t)result > v13);
      if (v25) {
        return (void *)-[BWSlaveFrameSynchronizerNode _printState]((unint64_t)v1);
      }
    }
  }
  return result;
}

- (void)_emitDroppedFrames:(uint64_t)a1 captureID:(CMTime *)a2 inputIndex:(int)a3
{
  if (a1)
  {
    while ([*(id *)(a1 + 136) count])
    {
      CFDictionaryRef v6 = (const __CFDictionary *)[*(id *)(a1 + 136) objectAtIndexedSubscript:0];
      memset(&v9, 0, sizeof(v9));
      CMTimeMakeFromDictionary(&v9, v6);
      CMTime time1 = v9;
      CMTime v7 = *a2;
      if (CMTimeCompare(&time1, &v7) >= 1) {
        break;
      }
      CMTime time1 = v9;
      -[BWSlaveFrameSynchronizerNode _emitDroppedFrame:captureID:inputIndex:](a1, &time1);
      [*(id *)(a1 + 136) removeObject:v6];
    }
    if (a3 != -1)
    {
      CMTime v9 = *a2;
      -[BWSlaveFrameSynchronizerNode _emitDroppedFrame:captureID:inputIndex:](a1, &v9);
    }
  }
}

- (unint64_t)_printState
{
  if (result)
  {
    unint64_t v1 = result;
    unint64_t v2 = (void *)[MEMORY[0x1E4F28E78] string];
    result = objc_msgSend((id)objc_msgSend((id)v1, "inputs"), "count");
    if (result)
    {
      unint64_t v3 = 0;
      CFStringRef key = (const __CFString *)*MEMORY[0x1E4F53070];
      uint64_t v4 = *MEMORY[0x1E4F542E0];
      uint64_t v5 = *MEMORY[0x1E4F542D8];
      do
      {
        Head = CMSimpleQueueGetHead(*(CMSimpleQueueRef *)(*(void *)(v1 + 104) + 8 * v3));
        uint64_t Count = CMSimpleQueueGetCount(*(CMSimpleQueueRef *)(*(void *)(v1 + 104) + 8 * v3));
        uint64_t v8 = *(unsigned int *)(v1 + 112);
        objc_msgSend(v2, "appendFormat:", @" [%d] = {", v3);
        if (Head)
        {
          CMTime v9 = (void *)CMGetAttachment(Head, key, 0);
          int v10 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", v4), "BOOLValue");
          uint64_t v11 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", v5), "intValue");
          int v12 = "s";
          if (v10) {
            int v12 = "m";
          }
          objc_msgSend(v2, "appendFormat:", @" %d/%d head:%d(%s) ", Count, v8, v11, v12);
        }
        [v2 appendFormat:@"}"];
        ++v3;
        result = objc_msgSend((id)objc_msgSend((id)v1, "inputs"), "count");
      }
      while (result > v3);
    }
  }
  return result;
}

- (BWSlaveFrameSynchronizerNode)initWithDepthEnabled:(BOOL)a3 numberOfInputs:(int)a4 syncSlaveForMasterPortTypes:(id)a5 separateDepthComponentsEnabled:(BOOL)a6 preLTMThumbnailEnabledInputs:(id)a7 postColorProcessingThumbnailEnabledInputs:(id)a8 differentInputFormatsSupported:(BOOL)a9 bufferSize:(int)a10 numberOfSlaveFramesToSkip:(int)a11 startEmittingMasterFramesBeforeSlaveStreamStarts:(BOOL)a12
{
  BOOL v32 = a6;
  BOOL v34 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BWSlaveFrameSynchronizerNode;
  uint64_t v16 = [(BWNode *)&v35 init];
  CFTypeRef v17 = v16;
  if (v16)
  {
    id v29 = a5;
    [(BWNode *)v16 setSupportsConcurrentLiveInputCallbacks:1];
    v17->_numBufferedFrames = a10;
    v17->_differentInputFormatsSupported = a9;
    int v33 = (void *)[MEMORY[0x1E4F1CA48] array];
    v31 = (void *)[MEMORY[0x1E4F1CA48] array];
    int v30 = a4;
    if (a4 >= 1)
    {
      uint64_t v18 = 0;
      do
      {
        CMTime v19 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v17 index:v18];
        [(BWNodeInputMediaConfiguration *)[(BWNodeInput *)v19 primaryMediaConfiguration] setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
        [(BWNodeInputMediaConfiguration *)[(BWNodeInput *)v19 primaryMediaConfiguration] setPassthroughMode:1];
        [(BWNodeInputMediaConfiguration *)[(BWNodeInput *)v19 primaryMediaConfiguration] setDelayedBufferCount:v17->_numBufferedFrames];
        if (v18)
        {
          CMTime v20 = objc_alloc_init(BWNodeInputMediaConfiguration);
          [(BWNodeInputMediaConfiguration *)v20 setPassthroughMode:0];
          [(BWNodeInput *)v19 setUnspecifiedAttachedMediaConfiguration:v20];
          if (v34)
          {
            int v21 = @"Depth";
            if (v32)
            {
              -[BWSlaveFrameSynchronizerNode _setupAttachedMediaConfigurationForInput:attachedMediaKey:]((uint64_t)v17, v19, @"DepthData_DX");
              int v21 = @"DepthData_DY";
            }
            -[BWSlaveFrameSynchronizerNode _setupAttachedMediaConfigurationForInput:attachedMediaKey:]((uint64_t)v17, v19, (uint64_t)v21);
            objc_msgSend(v31, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v18));
          }
        }
        if (objc_msgSend(a7, "containsObject:", objc_msgSend(NSNumber, "numberWithInt:", v18))) {
          -[BWSlaveFrameSynchronizerNode _setupAttachedMediaConfigurationForInput:attachedMediaKey:]((uint64_t)v17, v19, 0x1EFA68BE0);
        }
        if (objc_msgSend(a8, "containsObject:", objc_msgSend(NSNumber, "numberWithInt:", v18))) {
          -[BWSlaveFrameSynchronizerNode _setupAttachedMediaConfigurationForInput:attachedMediaKey:]((uint64_t)v17, v19, 0x1EFA74960);
        }
        [(BWNode *)v17 addInput:v19];

        if (v18 || !v17->_differentInputFormatsSupported) {
          objc_msgSend(v33, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v18));
        }
        ++v18;
      }
      while (v30 != v18);
    }
    int v22 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v17];
    [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)v22 primaryMediaConfiguration] setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)v22 primaryMediaConfiguration] setPassthroughMode:1];
    [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)v22 primaryMediaConfiguration] setIndexesOfInputsWhichDrivesThisOutput:v33];
    uint64_t v23 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    [(BWNodeOutputMediaConfiguration *)v23 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeOutputMediaConfiguration *)v23 setPassthroughMode:1];
    [(BWNodeOutputMediaConfiguration *)v23 setIndexesOfInputsWhichDrivesThisOutput:v33];
    [(BWNodeOutputMediaConfiguration *)v23 setAttachedMediaKeyOfInputWhichDrivesThisOutput:@"PrimaryFormat"];
    [(BWNodeOutput *)v22 setMediaConfiguration:v23 forAttachedMediaKey:@"SynchronizedSlaveFrame"];
    if (v34)
    {
      if (v32)
      {
        uint64_t v24 = (uint64_t)v31;
        -[BWSlaveFrameSynchronizerNode _setupAttachedMediaConfigurationForOutput:attachedMediaKey:inputIndexesDrivingAttachedMediaOutput:]((uint64_t)v17, v22, @"DepthData_DX", (uint64_t)v31);
        char v25 = BWAttachedMediaKey_DepthData_DY;
      }
      else
      {
        char v25 = BWAttachedMediaKey_Depth;
        uint64_t v24 = (uint64_t)v31;
      }
      -[BWSlaveFrameSynchronizerNode _setupAttachedMediaConfigurationForOutput:attachedMediaKey:inputIndexesDrivingAttachedMediaOutput:]((uint64_t)v17, v22, (uint64_t)*v25, v24);
    }
    if ([a7 count]) {
      -[BWSlaveFrameSynchronizerNode _setupAttachedMediaConfigurationForOutput:attachedMediaKey:inputIndexesDrivingAttachedMediaOutput:]((uint64_t)v17, v22, 0x1EFA68BE0, (uint64_t)a7);
    }
    if ([a8 count]) {
      -[BWSlaveFrameSynchronizerNode _setupAttachedMediaConfigurationForOutput:attachedMediaKey:inputIndexesDrivingAttachedMediaOutput:]((uint64_t)v17, v22, 0x1EFA74960, (uint64_t)a8);
    }
    [(BWNode *)v17 addOutput:v22];

    v17->_bufferServicingLock._os_unfair_lock_opaque = 0;
    v17->_inputSampleBufferQueues = (opaqueCMSimpleQueue **)malloc_type_calloc(v30, 8uLL, 0x2004093837F09uLL);
    if (v30 >= 1)
    {
      uint64_t v26 = 0;
      CFAllocatorRef v27 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      do
      {
        if (CMSimpleQueueCreate(v27, v17->_numBufferedFrames, &v17->_inputSampleBufferQueues[v26])) {
          FigSignalErrorAt();
        }
        ++v26;
      }
      while (v30 != v26);
    }
    v17->_startEmittingMasterFramesBeforeSlaveStreamStarts = a12;
    v17->_numSlaveFramesToSkip = a11;
    v17->_droppedFramePTSs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v17->_mostRecentMasterInputIndex = -1;
    v17->_syncSlaveForMasterPortTypes = (NSArray *)[v29 copy];
  }
  return v17;
}

- (uint64_t)_setupAttachedMediaConfigurationForInput:(uint64_t)a3 attachedMediaKey:
{
  if (result)
  {
    uint64_t v5 = objc_alloc_init(BWNodeInputMediaConfiguration);
    [(BWNodeInputMediaConfiguration *)v5 setPassthroughMode:1];
    return [a2 setMediaConfiguration:v5 forAttachedMediaKey:a3];
  }
  return result;
}

- (uint64_t)_setupAttachedMediaConfigurationForOutput:(uint64_t)a3 attachedMediaKey:(uint64_t)a4 inputIndexesDrivingAttachedMediaOutput:
{
  if (result)
  {
    CMTime v7 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    [(BWNodeOutputMediaConfiguration *)v7 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeOutputMediaConfiguration *)v7 setPassthroughMode:1];
    [(BWNodeOutputMediaConfiguration *)v7 setIndexesOfInputsWhichDrivesThisOutput:a4];
    [(BWNodeOutputMediaConfiguration *)v7 setAttachedMediaKeyOfInputWhichDrivesThisOutput:a3];
    return [a2 setMediaConfiguration:v7 forAttachedMediaKey:a3];
  }
  return result;
}

+ (void)initialize
{
}

- (void)dealloc
{
  -[BWSlaveFrameSynchronizerNode _purgeAllBuffers](self);
  if ([(NSArray *)[(BWNode *)self inputs] count])
  {
    unint64_t v3 = 0;
    do
    {
      FigSimpleQueueRelease();
      ++v3;
    }
    while ([(NSArray *)[(BWNode *)self inputs] count] > v3);
  }
  free(self->_inputSampleBufferQueues);

  v4.receiver = self;
  v4.super_class = (Class)BWSlaveFrameSynchronizerNode;
  [(BWNode *)&v4 dealloc];
}

- (void)_purgeAllBuffers
{
  if (result)
  {
    unint64_t v1 = result;
    result = objc_msgSend((id)objc_msgSend(result, "inputs"), "count");
    if (result)
    {
      for (unint64_t i = 0; i < (unint64_t)result; ++i)
      {
        while (1)
        {
          unint64_t v3 = CMSimpleQueueDequeue(*(CMSimpleQueueRef *)(v1[13] + 8 * i));
          if (!v3) {
            break;
          }
          CFRelease(v3);
        }
        result = objc_msgSend((id)objc_msgSend(v1, "inputs"), "count");
      }
    }
  }
  return result;
}

- (id)nodeSubType
{
  return @"SlaveFrameSynchronizer";
}

- (void)didReachEndOfDataForInput:(id)a3
{
  unsigned int v4 = atomic_fetch_add_explicit(&self->_numEODMessagesReceived, 1u, memory_order_relaxed) + 1;
  if ([(NSArray *)[(BWNode *)self inputs] count] == v4)
  {
    os_unfair_lock_lock(&self->_bufferServicingLock);
    if (self->_emitsUnsynchronizedFramesWhileStopping) {
      -[BWSlaveFrameSynchronizerNode _tryToEmitBuffersWithSynchronizationEnabled:]((uint64_t)self, 0);
    }
    -[BWSlaveFrameSynchronizerNode _purgeAllBuffers](self);
    [(BWNodeOutput *)self->super._output markEndOfLiveOutput];
    os_unfair_lock_unlock(&self->_bufferServicingLock);
    self->_numEODMessagesReceived = 0;
  }
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
  [a4 index];
  memset(&v11[1], 0, sizeof(CMTime));
  if (a3) {
    [a3 pts];
  }
  os_unfair_lock_lock(&self->_bufferServicingLock);
  uint64_t mostRecentMasterInputIndex = self->_mostRecentMasterInputIndex;
  if ([a4 index] == mostRecentMasterInputIndex)
  {
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    v11[0] = v11[1];
    CFDictionaryRef v9 = CMTimeCopyAsDictionary(v11, v8);
    if (v9)
    {
      CFDictionaryRef v10 = v9;
      [(NSMutableArray *)self->_droppedFramePTSs addObject:v9];
      CFRelease(v10);
    }
  }
  os_unfair_lock_unlock(&self->_bufferServicingLock);
}

- (void)handleStillImageReferenceFrameBracketedCaptureSequenceNumber:(int)a3 forInput:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  [(BWNodeOutput *)self->super._output emitStillImageReferenceFrameBracketedCaptureSequenceNumberMessageWithSequenceNumber:v4];
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (BOOL)emitsUnsynchronizedFramesWhileStopping
{
  return self->_emitsUnsynchronizedFramesWhileStopping;
}

- (void)setEmitsUnsynchronizedFramesWhileStopping:(BOOL)a3
{
  self->_emitsUnsynchronizedFramesWhileStopping = a3;
}

@end