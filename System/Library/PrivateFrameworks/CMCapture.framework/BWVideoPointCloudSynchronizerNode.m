@interface BWVideoPointCloudSynchronizerNode
+ (void)initialize;
- (BOOL)_attachPointCloudDataToSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (BOOL)_shouldEmitBuffer;
- (BWNodeInput)imageInput;
- (BWNodeInput)pointCloudInput;
- (BWVideoPointCloudSynchronizerNode)initWithCaptureDevice:(id)a3 timeOfFlightCameraType:(int)a4;
- (void)_setUpPointCloudMediaConfigurationForOutput:(id)a3 inputAttachedMediaKey:(id)a4 outputAttachedMediaKey:(id)a5;
- (void)_tryToEmitBuffersWithRGBBuffer:(opaqueCMSampleBuffer *)a3;
- (void)_updateNumberOfReceivedRGBFramesBeforeEmittingDepthFrameWithDepthMaxFrameRate:(float)a3 rgbMaxFrameRate:(float)a4;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didChangeDepthMaxFrameRate:(float)a3;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)handleDroppedSample:(id)a3 forInput:(id)a4;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWVideoPointCloudSynchronizerNode

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWVideoPointCloudSynchronizerNode)initWithCaptureDevice:(id)a3 timeOfFlightCameraType:(int)a4
{
  v15.receiver = self;
  v15.super_class = (Class)BWVideoPointCloudSynchronizerNode;
  v6 = [(BWNode *)&v15 init];
  if (v6)
  {
    v7 = (BWFigVideoCaptureDevice *)a3;
    v6->_captureDevice = v7;
    [(BWFigVideoCaptureDevice *)v7 depthMaxFrameRate];
    v6->_depthMaxFrameRate = v8;
    v6->_depthMaxFrameRateAdjustmentPending = 1;
    v6->_multiplePointCloudAttachmentsEnabled = a4 == 2;
    if (a4 == 2) {
      int v9 = 2;
    }
    else {
      int v9 = 1;
    }
    v6->_latestPointCloudBuffersCapacity = v9;
    v6->_latestPointCloudBuffers = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v6->_latestPointCloudBuffersCapacity];
    v10 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v6 index:0];
    [(BWNodeInput *)v10 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeInput *)v10 setPassthroughMode:1];
    [(BWNode *)v6 addInput:v10];
    v11 = [[BWNodeInput alloc] initWithMediaType:1885564004 node:v6 index:1];
    [(BWNodeInput *)v11 setFormatRequirements:objc_alloc_init(BWPointCloudFormatRequirements)];
    [(BWNodeInput *)v11 setPassthroughMode:1];
    [(BWNodeInput *)v11 setRetainedBufferCount:v6->_latestPointCloudBuffersCapacity];
    v12 = objc_alloc_init(BWNodeInputMediaConfiguration);
    [(BWNodeInputMediaConfiguration *)v12 setPassthroughMode:0];
    [(BWNodeInput *)v11 setUnspecifiedAttachedMediaConfiguration:v12];
    [(BWNode *)v6 addInput:v11];
    v6->_imageInput = v10;
    v6->_pointCloudInput = v11;
    v13 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v6];
    [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)v13 primaryMediaConfiguration] setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeOutput *)v13 setPassthroughMode:1];
    [(BWVideoPointCloudSynchronizerNode *)v6 _setUpPointCloudMediaConfigurationForOutput:v13 inputAttachedMediaKey:@"PrimaryFormat" outputAttachedMediaKey:0x1EFA68B60];
    if (v6->_multiplePointCloudAttachmentsEnabled) {
      [(BWVideoPointCloudSynchronizerNode *)v6 _setUpPointCloudMediaConfigurationForOutput:v13 inputAttachedMediaKey:@"PrimaryFormat" outputAttachedMediaKey:0x1EFA74620];
    }
    [(BWNode *)v6 addOutput:v13];
    v6->_bufferServicingLock._os_unfair_lock_opaque = 0;
    [(BWFigVideoCaptureDevice *)v6->_captureDevice setMaxDepthFrameRateChangedDelegate:v6];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWVideoPointCloudSynchronizerNode;
  [(BWNode *)&v3 dealloc];
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  if (self->_imageInput == a4)
  {
    if (self->_depthMaxFrameRateAdjustmentPending)
    {
      objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F53DA0]), "floatValue");
      LODWORD(v10) = v9;
      *(float *)&double v11 = self->_depthMaxFrameRate;
      [(BWVideoPointCloudSynchronizerNode *)self _updateNumberOfReceivedRGBFramesBeforeEmittingDepthFrameWithDepthMaxFrameRate:v11 rgbMaxFrameRate:v10];
      self->_depthMaxFrameRateAdjustmentPending = 0;
    }
    if (self->_shouldLetThroughFrames) {
      ++self->_numberOfReceivedRGBFramesSinceLastDepthFrameEmission;
    }
    if ([(BWVideoPointCloudSynchronizerNode *)self _shouldEmitBuffer]) {
      [(BWVideoPointCloudSynchronizerNode *)self _tryToEmitBuffersWithRGBBuffer:a3];
    }
  }
  else if (self->_pointCloudInput == a4)
  {
    unint64_t v8 = self->_numberOfReceivedPointCloudFramesBeforeEmitted % self->_latestPointCloudBuffersCapacity;
    self->_indexForLatestReceivedPointCloudFrame = v8;
    [(NSMutableArray *)self->_latestPointCloudBuffers setObject:a3 atIndexedSubscript:(int)v8];
    ++self->_numberOfReceivedPointCloudFramesBeforeEmitted;
  }
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obj = [(BWNode *)self outputs];
  uint64_t v28 = [(NSArray *)obj countByEnumeratingWithState:&v34 objects:v41 count:16];
  if (v28)
  {
    uint64_t v25 = *(void *)v35;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v35 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v6;
        v7 = *(void **)(*((void *)&v34 + 1) + 8 * v6);
        uint64_t v8 = objc_msgSend(v7, "attachedMediaKeyDrivenByInputAttachedMediaKey:inputIndex:", a5, objc_msgSend(a4, "index"));
        if (v8)
        {
          int v9 = (void *)v8;
          if ([v7 passthroughMode])
          {
            if (self->_multiplePointCloudAttachmentsEnabled
              && [v9 isEqualToString:0x1EFA68B60])
            {
              v40[0] = 0x1EFA68B60;
              v40[1] = 0x1EFA74620;
              double v10 = (void *)MEMORY[0x1E4F1C978];
              double v11 = (void **)v40;
              uint64_t v12 = 2;
            }
            else
            {
              v39 = v9;
              double v10 = (void *)MEMORY[0x1E4F1C978];
              double v11 = &v39;
              uint64_t v12 = 1;
            }
            v13 = (void *)[v10 arrayWithObjects:v11 count:v12];
            long long v32 = 0u;
            long long v33 = 0u;
            long long v30 = 0u;
            long long v31 = 0u;
            uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v38 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v31;
              do
              {
                for (uint64_t i = 0; i != v15; ++i)
                {
                  if (*(void *)v31 != v16) {
                    objc_enumerationMutation(v13);
                  }
                  v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
                  v19 = (BWNodeOutputMediaProperties *)[v7 mediaPropertiesForAttachedMediaKey:v18];
                  int v20 = [v18 isEqualToString:@"PrimaryFormat"];
                  if (v19)
                  {
                    if ((v20 & 1) == 0)
                    {
                      uint64_t v21 = [NSString stringWithFormat:@"%@ output %@ unexpectedly has mediaPropertiesForAttachedMediaKey %@ (provided media key was %@)", self, v7, v18, a5];
                      goto LABEL_28;
                    }
                  }
                  else
                  {
                    if (v20)
                    {
                      uint64_t v21 = [NSString stringWithFormat:@"%@ output %@ has no media properties for the primary format (provided media key is %@)", self, v7, a5, v22];
LABEL_28:
                      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v21 userInfo:0]);
                    }
                    v19 = objc_alloc_init(BWNodeOutputMediaProperties);
                    [v7 _setMediaProperties:v19 forAttachedMediaKey:v18];
                  }
                  [(BWNodeOutputMediaProperties *)v19 setResolvedFormat:a3];
                }
                uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v38 count:16];
              }
              while (v15);
            }
          }
        }
        uint64_t v6 = v29 + 1;
      }
      while (v29 + 1 != v28);
      uint64_t v28 = [(NSArray *)obj countByEnumeratingWithState:&v34 objects:v41 count:16];
    }
    while (v28);
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

- (void)didReachEndOfDataForInput:(id)a3
{
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  [(BWNodeOutput *)self->super._output markEndOfLiveOutput];
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
}

- (void)_tryToEmitBuffersWithRGBBuffer:(opaqueCMSampleBuffer *)a3
{
  if ([(BWVideoPointCloudSynchronizerNode *)self _attachPointCloudDataToSampleBuffer:a3])
  {
    [(BWNodeOutput *)self->super._output emitSampleBuffer:a3];
    self->_numberOfReceivedRGBFramesSinceLastDepthFrameEmission = 0;
  }
}

- (BOOL)_attachPointCloudDataToSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  os_unfair_lock_assert_owner(&self->_bufferServicingLock);
  if (self->_numberOfReceivedPointCloudFramesBeforeEmitted < self->_latestPointCloudBuffersCapacity) {
    return 0;
  }
  if (self->_multiplePointCloudAttachmentsEnabled)
  {
    v5 = (opaqueCMSampleBuffer *)[(NSMutableArray *)self->_latestPointCloudBuffers objectAtIndexedSubscript:self->_indexForLatestReceivedPointCloudFrame == 0];
    uint64_t v6 = (opaqueCMSampleBuffer *)[(NSMutableArray *)self->_latestPointCloudBuffers objectAtIndexedSubscript:self->_indexForLatestReceivedPointCloudFrame];
    memset(&v16, 0, sizeof(v16));
    CMSampleBufferGetPresentationTimeStamp(&v16, v5);
    memset(&v15, 0, sizeof(v15));
    CMSampleBufferGetPresentationTimeStamp(&v15, v6);
    CMTime lhs = v15;
    CMTime v12 = v16;
    CMTimeSubtract(&time, &lhs, &v12);
    float Seconds = CMTimeGetSeconds(&time);
    float v8 = Seconds * 1000.0;
    BOOL v9 = v8 < 40.0;
    if (v8 < 40.0)
    {
      BWSampleBufferSetAttachedMedia(a3, 0x1EFA68B60, (uint64_t)v5);
      BWSampleBufferSetAttachedMedia(a3, 0x1EFA74620, (uint64_t)v6);
      [(NSMutableArray *)self->_latestPointCloudBuffers removeAllObjects];
      unint64_t v10 = 0;
    }
    else
    {
      [(NSMutableArray *)self->_latestPointCloudBuffers removeObject:v5];
      unint64_t v10 = 1;
    }
    self->_numberOfReceivedPointCloudFramesBeforeEmitted = v10;
  }
  else
  {
    BWSampleBufferSetAttachedMedia(a3, 0x1EFA68B60, [(NSMutableArray *)self->_latestPointCloudBuffers objectAtIndexedSubscript:0]);
    self->_numberOfReceivedPointCloudFramesBeforeEmitted = 0;
    return 1;
  }
  return v9;
}

- (void)_setUpPointCloudMediaConfigurationForOutput:(id)a3 inputAttachedMediaKey:(id)a4 outputAttachedMediaKey:(id)a5
{
  float v8 = objc_alloc_init(BWNodeOutputMediaConfiguration);
  [(BWNodeOutputMediaConfiguration *)v8 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
  [(BWNodeOutputMediaConfiguration *)v8 setPassthroughMode:1];
  [(BWNodeOutputMediaConfiguration *)v8 setIndexOfInputWhichDrivesThisOutput:1];
  [(BWNodeOutputMediaConfiguration *)v8 setAttachedMediaKeyOfInputWhichDrivesThisOutput:a4];
  [a3 setMediaConfiguration:v8 forAttachedMediaKey:a5];
}

- (BOOL)_shouldEmitBuffer
{
  return self->_numberOfReceivedRGBFramesSinceLastDepthFrameEmission >= self->_numberOfReceivedRGBFramesBeforeEmittingDepthFrame
      && self->_shouldLetThroughFrames;
}

- (void)_updateNumberOfReceivedRGBFramesBeforeEmittingDepthFrameWithDepthMaxFrameRate:(float)a3 rgbMaxFrameRate:(float)a4
{
  os_unfair_lock_assert_owner(&self->_bufferServicingLock);
  if (a3 == 0.0)
  {
    signed __int16 v7 = 0;
  }
  else if (vabds_f32(a4, a3) >= 0.1)
  {
    signed __int16 v7 = vcvtps_s32_f32(a4 / a3);
  }
  else
  {
    signed __int16 v7 = 1;
  }
  self->_shouldLetThroughFrames = a3 != 0.0;
  self->_numberOfReceivedRGBFramesBeforeEmittingDepthFrame = v7;
  if (dword_1E96B6C68)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)didChangeDepthMaxFrameRate:(float)a3
{
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  if (self->_depthMaxFrameRate != a3)
  {
    self->_depthMaxFrameRate = a3;
    self->_depthMaxFrameRateAdjustmentPending = 1;
  }
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (BWNodeInput)imageInput
{
  return self->_imageInput;
}

- (BWNodeInput)pointCloudInput
{
  return self->_pointCloudInput;
}

@end