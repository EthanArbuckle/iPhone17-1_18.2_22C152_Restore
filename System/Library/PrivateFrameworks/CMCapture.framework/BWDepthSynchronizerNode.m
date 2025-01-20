@interface BWDepthSynchronizerNode
+ (void)initialize;
- (BOOL)discardsDegradedDepthBuffers;
- (BOOL)flushOnDepthEOD;
- (BWNodeInput)depthInput;
- (BWNodeInput)imageInput;
- (id)initForStreaming:(BOOL)a3 maxQueueDepth:(int)a4 separateDepthComponentsEnabled:(BOOL)a5;
- (id)initForStreaming:(BOOL)a3 separateDepthComponentsEnabled:(BOOL)a4;
- (id)nodeSubType;
- (id)nodeType;
- (uint64_t)_attachDepthDataToSampleBufferOrReportDepthMissing:(unsigned char *)a3 isDepthMissing:;
- (uint64_t)_cleanupDepthBufferQueue;
- (uint64_t)_setupDepthMediaConfigurationForOutput:(uint64_t)a3 inputAttachedMediaKey:(uint64_t)a4 outputAttachedMediaKey:;
- (unint64_t)_isDepthExpectedForSampleBuffer:(uint64_t)a1;
- (void)_tryToEmitBuffers;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)handleDroppedSample:(id)a3 forInput:(id)a4;
- (void)handleNodeError:(id)a3 forInput:(id)a4;
- (void)handleStillImageReferenceFrameBracketedCaptureSequenceNumber:(int)a3 forInput:(id)a4;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setDiscardsDegradedDepthBuffers:(BOOL)a3;
- (void)setFlushOnDepthEOD:(BOOL)a3;
@end

@implementation BWDepthSynchronizerNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v7 = [(BWNode *)self outputs];
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v21 + 1) + 8 * v11);
        uint64_t v13 = objc_msgSend(v12, "attachedMediaKeyDrivenByInputAttachedMediaKey:inputIndex:", a5, objc_msgSend(a4, "index"));
        if (v13)
        {
          v14 = (void *)v13;
          if ([v12 passthroughMode])
          {
            v15 = (BWNodeOutputMediaProperties *)[v12 mediaPropertiesForAttachedMediaKey:v14];
            int v16 = [v14 isEqualToString:@"PrimaryFormat"];
            if (v15)
            {
              if ((v16 & 1) == 0)
              {
                uint64_t v17 = [NSString stringWithFormat:@"%@ output %@ unexpectedly has mediaPropertiesForAttachedMediaKey %@ (provided media key was %@)", self, v12, v14, a5];
                goto LABEL_18;
              }
            }
            else
            {
              if (v16)
              {
                uint64_t v17 = [NSString stringWithFormat:@"%@ output %@ has no media properties for the primary format (provided media key is %@)", self, v12, a5, v18];
LABEL_18:
                objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v17 userInfo:0]);
              }
              v15 = objc_alloc_init(BWNodeOutputMediaProperties);
              [v12 _setMediaProperties:v15 forAttachedMediaKey:v14];
            }
            [(BWNodeOutputMediaProperties *)v15 setResolvedFormat:a3];
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }
}

- (void)setDiscardsDegradedDepthBuffers:(BOOL)a3
{
  self->_discardsDegradedDepthBuffers = a3;
}

- (id)initForStreaming:(BOOL)a3 separateDepthComponentsEnabled:(BOOL)a4
{
  return [(BWDepthSynchronizerNode *)self initForStreaming:a3 maxQueueDepth:2 separateDepthComponentsEnabled:a4];
}

- (BWNodeInput)imageInput
{
  return self->_imageInput;
}

- (BWNodeInput)depthInput
{
  return self->_depthInput;
}

- (uint64_t)_setupDepthMediaConfigurationForOutput:(uint64_t)a3 inputAttachedMediaKey:(uint64_t)a4 outputAttachedMediaKey:
{
  if (result)
  {
    v7 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    [(BWNodeOutputMediaConfiguration *)v7 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeOutputMediaConfiguration *)v7 setPassthroughMode:1];
    [(BWNodeOutputMediaConfiguration *)v7 setIndexOfInputWhichDrivesThisOutput:1];
    [(BWNodeOutputMediaConfiguration *)v7 setAttachedMediaKeyOfInputWhichDrivesThisOutput:a3];
    return [a2 setMediaConfiguration:v7 forAttachedMediaKey:a4];
  }
  return result;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  int v8 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F542D8]), "intValue");
  if (self->_imageInput == a4) {
    uint64_t v9 = &OBJC_IVAR___BWDepthSynchronizerNode__lastReceivedImageID;
  }
  else {
    uint64_t v9 = &OBJC_IVAR___BWDepthSynchronizerNode__lastReceivedDepthID;
  }
  int v10 = *(_DWORD *)((char *)&self->super.super.isa + *v9);
  memset(&v23, 0, sizeof(v23));
  CMSampleBufferGetPresentationTimeStamp(&v23, a3);
  if (self->_streaming)
  {
    int v11 = 0;
  }
  else
  {
    __int16 v12 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a3, @"StillSettings", 0), "captureSettings"), "captureFlags");
    if ((v12 & 0x2000) != 0) {
      int v11 = 10;
    }
    else {
      int v11 = 0;
    }
    if ((v12 & 0x2000) != 0) {
      goto LABEL_14;
    }
  }
  if (v8 < v10 && (v10 - 16777205) >= 0xFF000016)
  {
    int v22 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_22;
  }
LABEL_14:
  if (self->_imageInput == a4)
  {
    p_lastReceivedImageID = &self->_lastReceivedImageID;
    int v19 = self->_lastReceivedImageID - v11;
    int imageIDWrapAroundCounter = self->_imageIDWrapAroundCounter;
    if (v8 < v19) {
      self->_int imageIDWrapAroundCounter = ++imageIDWrapAroundCounter;
    }
    uint64_t v17 = &OBJC_IVAR___BWDepthSynchronizerNode__lastReceivedImagePTS;
    uint64_t v18 = &OBJC_IVAR___BWDepthSynchronizerNode__imageBufferQueue;
  }
  else
  {
    p_lastReceivedImageID = &self->_lastReceivedDepthID;
    int v15 = self->_lastReceivedDepthID - v11;
    int imageIDWrapAroundCounter = self->_depthIDWrapAroundCounter;
    if (v8 < v15) {
      self->_depthIDWrapAroundCounter = ++imageIDWrapAroundCounter;
    }
    uint64_t v17 = &OBJC_IVAR___BWDepthSynchronizerNode__lastReceivedDepthPTS;
    uint64_t v18 = &OBJC_IVAR___BWDepthSynchronizerNode__depthBufferQueue;
  }
  CMSetAttachment(a3, @"ExtendedCaptureID", (CFTypeRef)[NSNumber numberWithInt:v8 | (imageIDWrapAroundCounter << 24)], 0);
  [*(id *)((char *)&self->super.super.isa + *v18) addObject:a3];
  int *p_lastReceivedImageID = v8;
  *(CMTime *)((char *)&self->super.super.isa + *v17) = v23;
  -[BWDepthSynchronizerNode _tryToEmitBuffers]((uint64_t)self);
LABEL_22:
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)_tryToEmitBuffers
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    char v2 = 0;
    if ([*(id *)(a1 + 104) count])
    {
      while (1)
      {
        v3 = objc_msgSend(*(id *)(a1 + 104), "objectAtIndexedSubscript:", 0, v19, v20);
        int v4 = -[BWDepthSynchronizerNode _isDepthExpectedForSampleBuffer:](a1, v3);
        unint64_t v5 = [*(id *)(a1 + 104) count];
        unint64_t v6 = *(int *)(a1 + 120);
        int v23 = objc_msgSend((id)CMGetAttachment(v3, @"ExtendedCaptureID", 0), "intValue");
        int v7 = 0;
        char v27 = 0;
        if (v4) {
          int v7 = -[BWDepthSynchronizerNode _attachDepthDataToSampleBufferOrReportDepthMissing:isDepthMissing:](a1, v3, &v27);
        }
        char v22 = v2;
        BOOL v8 = !*(unsigned char *)(a1 + 176)
          && *(void *)(a1 + 136)
          && (uint64_t v13 = (void *)CMGetAttachment(v3, @"StillSettings", 0),
              (objc_msgSend((id)objc_msgSend(v13, "captureSettings"), "captureFlags") & 0x2000) != 0)
          && (unint64_t)[v13 settingsID] <= *(void *)(a1 + 136);
        int v9 = v4 ^ 1;
        if (v5 > v6) {
          int v9 = 1;
        }
        int v10 = v9 | v7;
        if (v27) {
          int v10 = 1;
        }
        char v11 = v10 | v8;
        if (!*(unsigned char *)(a1 + 176))
        {
          int v12 = dword_1E96B6A28 ? v10 | v8 : 0;
          if (v12 == 1)
          {
            int v26 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
        if ((v11 & 1) == 0) {
          break;
        }
        CMRemoveAttachment(v3, @"ExtendedCaptureID");
        [*(id *)(a1 + 16) emitSampleBuffer:v3];
        *(_DWORD *)(a1 + 124) = v23;
        [*(id *)(a1 + 104) removeObject:v3];
        char v2 = 1;
        if (![*(id *)(a1 + 104) count]) {
          goto LABEL_24;
        }
      }
      char v2 = v22;
    }
LABEL_24:
    v14 = *(void **)(a1 + 184);
    if (v14
      && ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "stillImageSettings"), "captureSettings"), "captureFlags") & 0x800) == 0|| objc_msgSend(*(id *)(a1 + 112), "count")|| *(void *)(a1 + 192)))
    {
      objc_msgSend(*(id *)(a1 + 16), "emitNodeError:", *(void *)(a1 + 184), v19, v20);
      int v15 = *(void **)(a1 + 112);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __44__BWDepthSynchronizerNode__tryToEmitBuffers__block_invoke;
      v24[3] = &unk_1E5C292A8;
      v24[4] = a1;
      int v16 = (void *)[v15 indexesOfObjectsPassingTest:v24];
      if ([v16 count]) {
        [*(id *)(a1 + 112) removeObjectsAtIndexes:v16];
      }
      -[BWDepthSynchronizerNode _cleanupDepthBufferQueue](a1);
    }
    else
    {
      -[BWDepthSynchronizerNode _cleanupDepthBufferQueue](a1);
      if ((v2 & 1) == 0) {
        return;
      }
    }
    uint64_t v17 = *(void **)(a1 + 184);
    if (v17)
    {

      *(void *)(a1 + 184) = 0;
    }
    uint64_t v18 = *(void **)(a1 + 192);
    if (v18)
    {

      *(void *)(a1 + 192) = 0;
    }
  }
}

- (unint64_t)_isDepthExpectedForSampleBuffer:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  if (!*(unsigned char *)(a1 + 176)) {
    return ((unint64_t)objc_msgSend((id)CMGetAttachment(target, @"BWStillImageCaptureSettings", 0), "captureFlags") >> 11) & 1;
  }
  char v2 = objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F54300]);
  BOOL v3 = [v2 count] != 0;
  int v4 = (void *)[v2 objectForKeyedSubscript:*MEMORY[0x1E4F52E00]];
  if (v4) {
    return objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F53FB8]), "intValue") == 2;
  }
  return v3;
}

- (uint64_t)_cleanupDepthBufferQueue
{
  if (result)
  {
    uint64_t v1 = result;
    for (result = [*(id *)(result + 112) count]; result; result = objc_msgSend(*(id *)(v1 + 112), "count"))
    {
      char v2 = (const void *)[*(id *)(v1 + 112) objectAtIndexedSubscript:0];
      result = objc_msgSend((id)CMGetAttachment(v2, @"ExtendedCaptureID", 0), "intValue");
      if ((int)result > *(_DWORD *)(v1 + 124)) {
        break;
      }
      [*(id *)(v1 + 112) removeObject:v2];
    }
    if (!*(unsigned char *)(v1 + 176) && *(void *)(v1 + 136))
    {
      BOOL v3 = *(void **)(v1 + 112);
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __51__BWDepthSynchronizerNode__cleanupDepthBufferQueue__block_invoke;
      v5[3] = &unk_1E5C292A8;
      v5[4] = v1;
      int v4 = (void *)[v3 indexesOfObjectsPassingTest:v5];
      result = [v4 count];
      if (result) {
        return [*(id *)(v1 + 112) removeObjectsAtIndexes:v4];
      }
    }
  }
  return result;
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  if (self->_imageInput == a4)
  {
    p_bufferServicingLock = &self->_bufferServicingLock;
    os_unfair_lock_lock(&self->_bufferServicingLock);
    [(BWNodeOutput *)self->super._output emitDroppedSample:a3];
    os_unfair_lock_unlock(p_bufferServicingLock);
  }
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

- (id)nodeType
{
  return @"Muxer";
}

- (id)initForStreaming:(BOOL)a3 maxQueueDepth:(int)a4 separateDepthComponentsEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  v27.receiver = self;
  v27.super_class = (Class)BWDepthSynchronizerNode;
  BOOL v8 = [(BWNode *)&v27 init];
  uint64_t v9 = (uint64_t)v8;
  if (v8)
  {
    v8->_streaming = a3;
    v8->_separateDepthComponentsEnabled = v5;
    [(BWNode *)v8 setSupportsConcurrentLiveInputCallbacks:v8->_streaming];
    char v10 = 0;
    uint64_t v11 = 0;
    if (a4 <= 2) {
      int v12 = 2;
    }
    else {
      int v12 = a4;
    }
    *(_DWORD *)(v9 + 120) = v12;
    char v13 = 1;
    do
    {
      char v14 = v13;
      int v15 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v9 index:v11];
      [(BWNodeInput *)v15 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
      [(BWNodeInput *)v15 setPassthroughMode:1];
      [(BWNodeInput *)v15 setRetainedBufferCount:*(_DWORD *)(v9 + 120) + *(unsigned __int8 *)(v9 + 176)];
      if (v10)
      {
        int v16 = objc_alloc_init(BWNodeInputMediaConfiguration);
        uint64_t v17 = v16;
        if (v5)
        {
          [(BWNodeInputMediaConfiguration *)v16 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
          [(BWNodeInputMediaConfiguration *)v17 setPassthroughMode:1];
          [(BWNodeInput *)v15 setMediaConfiguration:v17 forAttachedMediaKey:@"DepthData_DY"];
        }
        else
        {
          [(BWNodeInputMediaConfiguration *)v16 setPassthroughMode:0];
          [(BWNodeInput *)v15 setUnspecifiedAttachedMediaConfiguration:v17];
          [(BWNodeInput *)v15 setRetainedBufferCount:1];
        }
      }
      [(id)v9 addInput:v15];

      char v13 = 0;
      char v10 = 1;
      uint64_t v11 = 1;
    }
    while ((v14 & 1) != 0);
    *(void *)(v9 + 160) = objc_msgSend((id)objc_msgSend((id)v9, "inputs"), "objectAtIndexedSubscript:", 0);
    *(void *)(v9 + 168) = objc_msgSend((id)objc_msgSend((id)v9, "inputs"), "objectAtIndexedSubscript:", 1);
    uint64_t v18 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v9];
    [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)v18 primaryMediaConfiguration] setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeOutput *)v18 setPassthroughMode:1];
    uint64_t v19 = @"PrimaryFormat";
    if (*(unsigned char *)(v9 + 153))
    {
      -[BWDepthSynchronizerNode _setupDepthMediaConfigurationForOutput:inputAttachedMediaKey:outputAttachedMediaKey:](v9, v18, @"PrimaryFormat", @"DepthData_DX");
      uint64_t v20 = v9;
      long long v21 = v18;
      uint64_t v19 = @"DepthData_DY";
      char v22 = @"DepthData_DY";
    }
    else
    {
      char v22 = @"Depth";
      uint64_t v20 = v9;
      long long v21 = v18;
    }
    -[BWDepthSynchronizerNode _setupDepthMediaConfigurationForOutput:inputAttachedMediaKey:outputAttachedMediaKey:](v20, v21, (uint64_t)v19, (uint64_t)v22);
    [(id)v9 addOutput:v18];

    *(_DWORD *)(v9 + 200) = 0;
    *(void *)(v9 + 104) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *(void *)(v9 + 112) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v23 = MEMORY[0x1E4F1F9F8];
    long long v24 = *MEMORY[0x1E4F1F9F8];
    *(_OWORD *)(v9 + 228) = *MEMORY[0x1E4F1F9F8];
    uint64_t v25 = *(void *)(v23 + 16);
    *(void *)(v9 + 244) = v25;
    *(_OWORD *)(v9 + 204) = v24;
    *(void *)(v9 + 220) = v25;
    atomic_store(0, (unsigned __int8 *)(v9 + 100));
  }
  return (id)v9;
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
  v3.receiver = self;
  v3.super_class = (Class)BWDepthSynchronizerNode;
  [(BWNode *)&v3 dealloc];
}

- (id)nodeSubType
{
  return @"DepthSynchronizer";
}

- (BOOL)discardsDegradedDepthBuffers
{
  return self->_discardsDegradedDepthBuffers;
}

- (void)didReachEndOfDataForInput:(id)a3
{
  unsigned int v5 = atomic_fetch_add_explicit(&self->_numEODMessagesReceived, 1u, memory_order_relaxed) + 1;
  if ([(NSArray *)[(BWNode *)self inputs] count] == v5)
  {
    os_unfair_lock_lock(&self->_bufferServicingLock);
    [(BWNodeOutput *)self->super._output markEndOfLiveOutput];
    os_unfair_lock_unlock(&self->_bufferServicingLock);
    self->_numEODMessagesReceived = 0;
  }
  else if (self->_flushOnDepthEOD && self->_depthInput == a3)
  {
    atomic_store(1u, (unsigned __int8 *)&self->_depthInputHasReceivedEOD);
    os_unfair_lock_lock(&self->_bufferServicingLock);
    -[BWDepthSynchronizerNode _tryToEmitBuffers]((uint64_t)self);
    os_unfair_lock_unlock(&self->_bufferServicingLock);
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  if (self->_streaming) {
    goto LABEL_6;
  }
  if ([a3 errorCode] == -16800
    || [a3 errorCode] == -16802
    || [a3 errorCode] == -16806)
  {
    [(NSMutableArray *)self->_imageBufferQueue removeAllObjects];
    [(NSMutableArray *)self->_depthBufferQueue removeAllObjects];

    self->_errorForImageInput = 0;
    self->_errorForDepthInput = 0;
LABEL_6:
    [(BWNodeOutput *)self->super._output emitNodeError:a3];
    goto LABEL_7;
  }
  if (self->_imageInput != a4)
  {
    self->_lastReceivedDepthErrorSettingsID = objc_msgSend((id)objc_msgSend(a3, "stillImageSettings"), "settingsID");
    p_errorForDepthInput = &self->_errorForDepthInput;
LABEL_14:

    goto LABEL_15;
  }
  p_errorForDepthInput = &self->_errorForImageInput;
  if (self->_errorForImageInput)
  {
    -[BWNodeOutput emitNodeError:](self->super._output, "emitNodeError:");
    goto LABEL_14;
  }
LABEL_15:
  *p_errorForDepthInput = (BWNodeError *)a3;
  -[BWDepthSynchronizerNode _tryToEmitBuffers]((uint64_t)self);
LABEL_7:
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)handleStillImageReferenceFrameBracketedCaptureSequenceNumber:(int)a3 forInput:(id)a4
{
}

- (uint64_t)_attachDepthDataToSampleBufferOrReportDepthMissing:(unsigned char *)a3 isDepthMissing:
{
  if (!a1) {
    return 0;
  }
  if (!*(unsigned char *)(a1 + 176) && *(void *)(a1 + 192)) {
    goto LABEL_20;
  }
  int v6 = objc_msgSend((id)CMGetAttachment(target, @"ExtendedCaptureID", 0), "intValue");
  if (![*(id *)(a1 + 112) count])
  {
LABEL_16:
    if (![*(id *)(a1 + 112) count])
    {
      if (*(unsigned char *)(a1 + 177))
      {
        unsigned __int8 v12 = atomic_load((unsigned __int8 *)(a1 + 100));
        if (v12)
        {
LABEL_20:
          uint64_t v11 = 0;
          *a3 = 1;
          return v11;
        }
      }
    }
    return 0;
  }
  uint64_t v7 = 0;
  while (1)
  {
    BOOL v8 = (void *)[*(id *)(a1 + 112) objectAtIndexedSubscript:v7];
    int v9 = objc_msgSend((id)CMGetAttachment(v8, @"ExtendedCaptureID", 0), "intValue");
    if (v6 < v9)
    {
      *a3 = 1;
      goto LABEL_16;
    }
    if (v6 == v9) {
      break;
    }
    if ([*(id *)(a1 + 112) count] <= (unint64_t)++v7) {
      goto LABEL_16;
    }
  }
  char v10 = (void *)CMGetAttachment(v8, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if ((objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E4F542C8]), "BOOLValue") & 1) != 0
    || *(unsigned char *)(a1 + 152)
    && objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E4F542C0]), "BOOLValue"))
  {
    *a3 = 1;
    [*(id *)(a1 + 112) removeObject:v8];
    CMSetAttachment(target, (CFStringRef)*MEMORY[0x1E4F55B30], &unk_1EFB002F0, 1u);
    goto LABEL_16;
  }
  memset(&v21, 0, sizeof(v21));
  CMSampleBufferGetPresentationTimeStamp(&v21, (CMSampleBufferRef)target);
  CFTypeRef cf = 0;
  CMTime v19 = v21;
  long long v17 = *MEMORY[0x1E4F1F9F8];
  uint64_t v18 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  if (BWCMSampleBufferCreateCopyWithNewTimingIncludingMetadata((opaqueCMSampleBuffer *)v8, &v19, &v17, (CMSampleBufferRef *)&cf))
  {
    if (v8) {
      CFTypeRef v14 = CFRetain(v8);
    }
    else {
      CFTypeRef v14 = 0;
    }
    CFTypeRef cf = v14;
  }
  else
  {
    CFTypeRef v14 = cf;
  }
  CMRemoveAttachment(v14, @"ExtendedCaptureID");
  int v15 = @"Depth";
  if (*(unsigned char *)(a1 + 153))
  {
    BWSampleBufferRemoveAttachedMedia(target, @"Depth");
    uint64_t AttachedMedia = BWSampleBufferGetAttachedMedia(cf, @"DepthData_DY");
    BWSampleBufferSetAttachedMedia(target, @"DepthData_DY", AttachedMedia);
    BWSampleBufferRemoveAttachedMedia(cf, @"DepthData_DY");
    int v15 = @"DepthData_DX";
  }
  BWSampleBufferSetAttachedMedia(target, (uint64_t)v15, (uint64_t)cf);
  if (cf) {
    CFRelease(cf);
  }
  uint64_t v11 = 1;
  CMSetAttachment(target, (CFStringRef)*MEMORY[0x1E4F55B48], MEMORY[0x1E4F1CC38], 1u);
  [*(id *)(a1 + 112) removeObject:v8];
  return v11;
}

BOOL __44__BWDepthSynchronizerNode__tryToEmitBuffers__block_invoke(uint64_t a1, CMAttachmentBearerRef target)
{
  objc_super v3 = (void *)CMGetAttachment(target, @"BWStillImageCaptureSettings", 0);
  uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 184), "stillImageSettings"), "settingsID");
  if (v4 == [v3 settingsID]) {
    return 1;
  }
  uint64_t v6 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 192), "stillImageSettings"), "settingsID");
  return v6 == [v3 settingsID];
}

BOOL __51__BWDepthSynchronizerNode__cleanupDepthBufferQueue__block_invoke(uint64_t a1, CMAttachmentBearerRef target)
{
  objc_super v3 = (void *)CMGetAttachment(target, @"StillSettings", 0);
  return (objc_msgSend((id)objc_msgSend(v3, "captureSettings"), "captureFlags") & 0x2000) != 0
      && (unint64_t)[v3 settingsID] <= *(void *)(*(void *)(a1 + 32) + 136);
}

- (BOOL)flushOnDepthEOD
{
  return self->_flushOnDepthEOD;
}

- (void)setFlushOnDepthEOD:(BOOL)a3
{
  self->_flushOnDepthEOD = a3;
}

@end