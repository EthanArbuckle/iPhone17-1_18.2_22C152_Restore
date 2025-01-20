@interface BWStereoVideoMetadataNode
+ (void)initialize;
- (BWStereoVideoMetadataNode)initWithPorts:(id)a3 secondaryPort:(id)a4 cameraInfoByPortType:(id)a5 errStatus:(int *)a6;
- (id)nodeSubType;
- (id)nodeType;
- (void)_sendSpatialAggressorsSeenMarkerBufferForPTS:(double)a3 measuredDuration:;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWStereoVideoMetadataNode

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWStereoVideoMetadataNode)initWithPorts:(id)a3 secondaryPort:(id)a4 cameraInfoByPortType:(id)a5 errStatus:(int *)a6
{
  if ([a3 isEqualToString:a4])
  {
    FigDebugAssert3();
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)BWStereoVideoMetadataNode;
    self = [(BWNode *)&v20 init];
    if (!self)
    {
      *a6 = 0;
      return self;
    }
    v11 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:self];
    v12 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWNodeInputMediaConfiguration *)[(BWNodeInput *)v11 primaryMediaConfiguration] setFormatRequirements:v12];

    [(BWNodeInputMediaConfiguration *)[(BWNodeInput *)v11 primaryMediaConfiguration] setPassthroughMode:1];
    [(BWNode *)self addInput:v11];

    v13 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:self];
    v14 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)v13 primaryMediaConfiguration] setFormatRequirements:v14];

    [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)v13 primaryMediaConfiguration] setPassthroughMode:1];
    [(BWNode *)self addOutput:v13];

    float32x4_t bytes = 0uLL;
    int v15 = BWStereoUtilitiesComputeRectificationQuaternion((uint64_t)a3, (uint64_t)a4, (uint64_t)a5, &bytes);
    if (v15)
    {
      int v17 = v15;
      FigDebugAssert3();
      goto LABEL_6;
    }
    v16 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const UInt8 *)&bytes, 16);
    self->_serializedRectificationQuaternion = v16;
    if (v16)
    {
      int v17 = 0;
      self->_consecutiveSpatiallyAggressiveFramesThreshold = 30;
      goto LABEL_6;
    }
    FigDebugAssert3();
  }
  int v17 = FigSignalErrorAt();
LABEL_6:
  *a6 = v17;
  if (v17)
  {

    return 0;
  }
  return self;
}

- (void)dealloc
{
  serializedRectificationQuaternion = self->_serializedRectificationQuaternion;
  if (serializedRectificationQuaternion) {
    CFRelease(serializedRectificationQuaternion);
  }
  v4.receiver = self;
  v4.super_class = (Class)BWStereoVideoMetadataNode;
  [(BWNode *)&v4 dealloc];
}

- (id)nodeType
{
  return @"Effect";
}

- (id)nodeSubType
{
  return @"RealtimeStereoVideo";
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
}

- (void)didReachEndOfDataForInput:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BWStereoVideoMetadataNode;
  [(BWNode *)&v3 didReachEndOfDataForInput:a3];
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  if (BWSampleBufferIsMarkerBuffer(a3))
  {
    memset(&v21, 0, sizeof(v21));
    CMSampleBufferGetPresentationTimeStamp(&v21, a3);
    CFTypeRef v6 = CMGetAttachment(a3, @"FileWriterAction", 0);
    if (v6)
    {
      v7 = v6;
      if (CFEqual(v6, @"Start") || CFEqual(v7, @"Resume"))
      {
        self->_numberOfConsecutiveLuxLevelAggressiveFrames = 0;
        self->_numberOfConsecutiveFocusDistanceAggressiveFrames = 0;
        if (CFEqual(v7, @"Start"))
        {
          self->_numberOfFramesEvaluatedForAggressiveStatus = 0;
          self->_int numberOfLuxLevelAggressiveFrames = 0;
          self->_int numberOfFocusDistanceAggressiveFrames = 0;
          CMSampleBufferGetPresentationTimeStamp(&v20, a3);
          self->_$95D729B680665BEAEFA1D6FCA8238556 startingPTS = ($95D729B680665BEAEFA1D6FCA8238556)v20;
          self->_aggregateStereoVideoCaptureStatus = 0;
        }
      }
      else if ((CFEqual(v7, @"Stop") || CFEqual(v7, @"Terminate")) {
             && self->_numberOfFramesEvaluatedForAggressiveStatus >= 1)
      }
      {
        memset(&v20, 0, sizeof(v20));
        CMTime lhs = v21;
        $95D729B680665BEAEFA1D6FCA8238556 startingPTS = self->_startingPTS;
        CMTimeSubtract(&v20, &lhs, (CMTime *)&startingPTS);
        if (v20.flags)
        {
          CMTime lhs = v20;
          $95D729B680665BEAEFA1D6FCA8238556 startingPTS = *($95D729B680665BEAEFA1D6FCA8238556 *)*(void *)&MEMORY[0x1E4F1FA48];
          if (CMTimeCompare(&lhs, (CMTime *)&startingPTS) >= 1)
          {
            CMTime lhs = v20;
            double Seconds = CMTimeGetSeconds(&lhs);
            CMTime lhs = v21;
            -[BWStereoVideoMetadataNode _sendSpatialAggressorsSeenMarkerBufferForPTS:measuredDuration:]((uint64_t)self, (uint64_t)&lhs, Seconds);
          }
        }
      }
    }
    [(BWNodeOutput *)self->super._output emitSampleBuffer:a3];
  }
  else
  {
    v8 = objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", 0x1EFA73660);
    if (v8)
    {
      char v9 = [v8 intValue];
      ++self->_numberOfFramesEvaluatedForAggressiveStatus;
      if ((v9 & 2) != 0)
      {
        int consecutiveSpatiallyAggressiveFramesThreshold = self->_consecutiveSpatiallyAggressiveFramesThreshold;
        int v11 = self->_numberOfConsecutiveLuxLevelAggressiveFrames + 1;
        self->_numberOfConsecutiveLuxLevelAggressiveFrames = v11;
        if (v11 >= consecutiveSpatiallyAggressiveFramesThreshold)
        {
          int numberOfLuxLevelAggressiveFrames = self->_numberOfLuxLevelAggressiveFrames;
          self->_int numberOfLuxLevelAggressiveFrames = numberOfLuxLevelAggressiveFrames + 1;
          if (self->_numberOfConsecutiveLuxLevelAggressiveFrames == consecutiveSpatiallyAggressiveFramesThreshold)
          {
            self->_int numberOfLuxLevelAggressiveFrames = numberOfLuxLevelAggressiveFrames
                                                    + consecutiveSpatiallyAggressiveFramesThreshold;
            self->_aggregateStereoVideoCaptureStatus |= 2u;
          }
        }
      }
      else
      {
        self->_numberOfConsecutiveLuxLevelAggressiveFrames = 0;
      }
      if ((v9 & 4) != 0)
      {
        int v13 = self->_consecutiveSpatiallyAggressiveFramesThreshold;
        int v14 = self->_numberOfConsecutiveFocusDistanceAggressiveFrames + 1;
        self->_numberOfConsecutiveFocusDistanceAggressiveFrames = v14;
        if (v14 >= v13)
        {
          int numberOfFocusDistanceAggressiveFrames = self->_numberOfFocusDistanceAggressiveFrames;
          self->_int numberOfFocusDistanceAggressiveFrames = numberOfFocusDistanceAggressiveFrames + 1;
          if (self->_numberOfConsecutiveFocusDistanceAggressiveFrames == v13)
          {
            self->_int numberOfFocusDistanceAggressiveFrames = numberOfFocusDistanceAggressiveFrames + v13;
            self->_aggregateStereoVideoCaptureStatus |= 4u;
          }
        }
      }
      else
      {
        self->_numberOfConsecutiveFocusDistanceAggressiveFrames = 0;
      }
    }
    CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F55CC0], self->_serializedRectificationQuaternion, 1u);
    output = self->super._output;
    [(BWNodeOutput *)output emitSampleBuffer:a3];
  }
}

- (void)_sendSpatialAggressorsSeenMarkerBufferForPTS:(double)a3 measuredDuration:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 48);
    *(_OWORD *)&sampleTimingArray.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 32);
    *(_OWORD *)&sampleTimingArray.decodeTimeStamp.value = v5;
    CMTimeEpoch v6 = *(void *)(MEMORY[0x1E4F1FA70] + 64);
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 16);
    *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E4F1FA70];
    *(_OWORD *)&sampleTimingArray.duration.epoch = v7;
    *(_OWORD *)&sampleTimingArray.presentationTimeStamp.value = *(_OWORD *)a2;
    CMTimeEpoch v8 = *(void *)(a2 + 16);
    sampleTimingArray.decodeTimeStamp.epoch = v6;
    CMAttachmentBearerRef target = 0;
    sampleTimingArray.presentationTimeStamp.epoch = v8;
    if (CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 1u, 0, 0, 0, 0, 1, &sampleTimingArray, 0, 0, (CMSampleBufferRef *)&target))
    {
      FigDebugAssert3();
    }
    else
    {
      int v9 = *(_DWORD *)(a1 + 108);
      if (v9 < 1)
      {
        float v11 = 0.0;
        float v10 = 0.0;
      }
      else
      {
        float v10 = (float)*(int *)(a1 + 116) / (float)v9;
        float v11 = (float)*(int *)(a1 + 124) / (float)v9;
      }
      if (dword_1E96B6DA8)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      CMSetAttachment(target, @"FileWriterAction", @"SpatialAggressorsSeen", 1u);
      CMSetAttachment(target, @"StereoVideoCaptureStatus", (CFTypeRef)[NSNumber numberWithInt:*(unsigned int *)(a1 + 152)], 1u);
      CMSetAttachment(target, @"StereoVideoCaptureDuration", (CFTypeRef)[NSNumber numberWithDouble:a3], 1u);
      *(float *)&double v13 = v10;
      CMSetAttachment(target, @"StereoVideoCaptureStatusPercentageOfFramesWithAggressiveLuxLevel", (CFTypeRef)[NSNumber numberWithFloat:v13], 1u);
      *(float *)&double v14 = v11;
      CMSetAttachment(target, @"StereoVideoCaptureStatusPercentageOfFramesWithAggressiveFocusDistance", (CFTypeRef)[NSNumber numberWithFloat:v14], 1u);
      [*(id *)(a1 + 16) emitSampleBuffer:target];
    }
    if (target) {
      CFRelease(target);
    }
  }
}

@end