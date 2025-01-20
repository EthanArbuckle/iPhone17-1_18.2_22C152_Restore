@interface BWFrameRateGovernorNode
+ (void)initialize;
- (BOOL)dropsStartupFramesWithUnstableAE;
- (BOOL)dropsStillBracketFramesToMaintainConsistentFrameRate;
- (BOOL)preservesMotionDataFromDroppedFrames;
- (BWFrameRateGovernorNode)init;
- (id)nodeSubType;
- (id)nodeType;
- (int)aeStabilityTuning;
- (void)dealloc;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setAeStabilityTuning:(int)a3;
- (void)setDropsStartupFramesWithUnstableAE:(BOOL)a3;
- (void)setDropsStillBracketFramesToMaintainConsistentFrameRate:(BOOL)a3;
- (void)setPreservesMotionDataFromDroppedFrames:(BOOL)a3;
@end

@implementation BWFrameRateGovernorNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
}

- (id)nodeType
{
  return @"Effect";
}

- (void)setPreservesMotionDataFromDroppedFrames:(BOOL)a3
{
  self->_preservesMotionDataFromDroppedFrames = a3;
}

- (void)setDropsStartupFramesWithUnstableAE:(BOOL)a3
{
  self->_dropsStartupFramesWithUnstableAE = a3;
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  if (self->_preservesMotionDataFromDroppedFrames && !*(void *)&self->_activeBracketSequenceRate) {
    *(void *)&self->_activeBracketSequenceRate = [[BWMotionDataPreserver alloc] initWithName:[(BWNode *)self description]];
  }
  uint64_t aeStabilityTuning = self->_aeStabilityTuning;
  if (aeStabilityTuning <= 2)
  {
    int v4 = dword_1A5F0CA10[aeStabilityTuning];
    int v5 = dword_1A5F0CA1C[aeStabilityTuning];
    HIDWORD(self->_frameCount) = v4;
    *(_DWORD *)&self->_aeStableAfterStartStreaming = v5;
  }
  v6.receiver = self;
  v6.super_class = (Class)BWFrameRateGovernorNode;
  [(BWNode *)&v6 prepareForCurrentConfigurationToBecomeLive];
}

- (void)setDropsStillBracketFramesToMaintainConsistentFrameRate:(BOOL)a3
{
  self->_dropsStillBracketFramesToMaintainConsistentFrameRate = a3;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  int v7 = objc_msgSend((id)CMGetAttachment(a3, @"StillImageCaptureType", 0), "intValue");
  v8 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  memset(&v33, 0, sizeof(v33));
  CFDictionaryRef v9 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F530C0], 0);
  CMTimeMakeFromDictionary(&v33, v9);
  char flags = v33.flags;
  if ((v33.flags & 1) == 0)
  {
    CMSampleBufferGetPresentationTimeStamp(&v32, a3);
    CMTime v33 = v32;
    char flags = v32.flags;
  }
  if ((flags & 1) == 0 || !v8)
  {
    fig_log_get_emitter();
    uint64_t v26 = v4;
    LODWORD(v25) = 0;
    FigDebugAssert3();
    goto LABEL_55;
  }
  if (!self->_motionDataPreserver && self->_aeStabilityTuning == 2)
  {
    v11 = (void *)[v8 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
    if ([v11 isEqual:*MEMORY[0x1E4F52DE8]])
    {
      int v12 = 8;
    }
    else
    {
      if (![v11 isEqual:*MEMORY[0x1E4F52DF8]]) {
        goto LABEL_12;
      }
      int v12 = 5;
    }
    HIDWORD(self->_frameCount) = v12;
    *(_DWORD *)&self->_aeStableAfterStartStreaming = v12;
  }
LABEL_12:
  ++self->_motionDataPreserver;
  if (self->_dropsStartupFramesWithUnstableAE && !LOBYTE(self->_frameCount))
  {
    if ((objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E4F53BC8]), "BOOLValue") & 1) != 0
      || objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E4F53BB0]), "BOOLValue"))
    {
      int aeStableTimeoutFrameCount = self->_aeStableTimeoutFrameCount;
      BOOL v14 = aeStableTimeoutFrameCount >= *(_DWORD *)&self->_aeStableAfterStartStreaming
         || (uint64_t)self->_motionDataPreserver > SHIDWORD(self->_frameCount);
      LOBYTE(self->_frameCount) = v14;
      int v15 = aeStableTimeoutFrameCount + 1;
    }
    else
    {
      int v15 = 0;
      BOOL v14 = (uint64_t)self->_motionDataPreserver > SHIDWORD(self->_frameCount);
      LOBYTE(self->_frameCount) = v14;
    }
    self->_int aeStableTimeoutFrameCount = v15;
    if (!v14) {
      goto LABEL_59;
    }
  }
  if (!self->_dropsStillBracketFramesToMaintainConsistentFrameRate)
  {
LABEL_54:
    *(CMTime *)(&self->_preservesMotionDataFromDroppedFrames + 4) = v33;
LABEL_55:
    objc_msgSend(*(id *)&self->_activeBracketSequenceRate, "prependPreservedMotionDataToSampleBuffer:", a3, v25, v26);
    [(BWNodeOutput *)self->super._output emitSampleBuffer:a3];
    return;
  }
  memset(&v32, 0, sizeof(v32));
  CMTime lhs = v33;
  CMTime rhs = *(CMTime *)(&self->_preservesMotionDataFromDroppedFrames + 4);
  CMTimeSubtract(&v32, &lhs, &rhs);
  if ((v7 & 0xFFFFFFFE) != 4)
  {
    char v16 = 0;
    goto LABEL_43;
  }
  if ((objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E4F54138]), "BOOLValue") & 1) == 0)
  {
    if (HIDWORD(self->_lastEmittedStreamingFrameDuration.epoch) || (v32.flags & 1) == 0) {
      goto LABEL_42;
    }
    CMTime lhs = v32;
    v17 = (_OWORD *)((char *)&self->_lastEmittedPTS.epoch + 4);
    CMTime rhs = *(CMTime *)((char *)&self->_lastEmittedPTS.epoch + 4);
    double v18 = 1.0 / CMTimeGetSeconds(&rhs);
    if (v18 <= 21.0)
    {
      CMTime rhs = lhs;
      double v20 = 1.0 / CMTimeGetSeconds(&rhs);
      if (v20 > 21.0)
      {
        int v19 = 2;
        goto LABEL_41;
      }
      if (v7 == 4 && v20 > 15.0)
      {
        *(_OWORD *)&rhs.value = *v17;
        rhs.epoch = *(void *)&self->_lastEmittedStreamingFrameDuration.flags;
        CMTime v28 = lhs;
        CMTimeSubtract(&v27, &rhs, &v28);
        if (CMTimeGetSeconds(&v27) > 0.002)
        {
          int v19 = 4;
          goto LABEL_41;
        }
      }
    }
    else if (v7 == 4 && v18 < 25.0)
    {
      *(_OWORD *)&rhs.value = *v17;
      rhs.epoch = *(void *)&self->_lastEmittedStreamingFrameDuration.flags;
      CMTime v28 = lhs;
      CMTimeSubtract(&time, &rhs, &v28);
      if (CMTimeGetSeconds(&time) > 0.002)
      {
        int v19 = 3;
LABEL_41:
        HIDWORD(self->_lastEmittedStreamingFrameDuration.epoch) = v19;
LABEL_42:
        char v16 = 1;
        goto LABEL_43;
      }
    }
    int v19 = 1;
    goto LABEL_41;
  }
  char v16 = 0;
LABEL_43:
  int epoch_high = HIDWORD(self->_lastEmittedStreamingFrameDuration.epoch);
  if (epoch_high && v7 != 4 && v7 != 5)
  {
    HIDWORD(self->_lastEmittedStreamingFrameDuration.epoch) = 0;
    goto LABEL_52;
  }
  if ((epoch_high - 2) > 2) {
    goto LABEL_52;
  }
  int v22 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E4F53D38]), "intValue");
  int v23 = HIDWORD(self->_lastEmittedStreamingFrameDuration.epoch);
  if (v23 == 4)
  {
    unsigned int v24 = v22 & 0x80000003;
    goto LABEL_58;
  }
  if (v23 == 3)
  {
    unsigned int v24 = v22 % 5;
LABEL_58:
    if (v24 == 1) {
      goto LABEL_59;
    }
LABEL_52:
    if ((v16 & 1) == 0) {
      *(CMTime *)((char *)&self->_lastEmittedPTS.epoch + 4) = v32;
    }
    goto LABEL_54;
  }
  if (v23 != 2 || (v22 & 1) != 0) {
    goto LABEL_52;
  }
LABEL_59:
  [*(id *)&self->_activeBracketSequenceRate preserveMotionDataForSoonToBeDroppedSampleBuffer:a3];
}

- (BWFrameRateGovernorNode)init
{
  v11.receiver = self;
  v11.super_class = (Class)BWFrameRateGovernorNode;
  v2 = [(BWNode *)&v11 init];
  if (v2)
  {
    v3 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v2];
    uint64_t v4 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWNodeInput *)v3 setFormatRequirements:v4];

    [(BWNodeInput *)v3 setPassthroughMode:1];
    [v2 addInput:v3];

    int v5 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v2];
    objc_super v6 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWNodeOutput *)v5 setFormatRequirements:v6];

    [(BWNodeOutput *)v5 setPassthroughMode:1];
    [v2 addOutput:v5];

    uint64_t v7 = MEMORY[0x1E4F1F9F8];
    long long v8 = *MEMORY[0x1E4F1F9F8];
    *(_OWORD *)(v2 + 108) = *MEMORY[0x1E4F1F9F8];
    uint64_t v9 = *(void *)(v7 + 16);
    *(void *)(v2 + 124) = v9;
    *(_OWORD *)(v2 + 132) = v8;
    *(void *)(v2 + 148) = v9;
  }
  return (BWFrameRateGovernorNode *)v2;
}

+ (void)initialize
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWFrameRateGovernorNode;
  [(BWNode *)&v3 dealloc];
}

- (id)nodeSubType
{
  return @"FrameRateGovernor";
}

- (BOOL)dropsStillBracketFramesToMaintainConsistentFrameRate
{
  return self->_dropsStillBracketFramesToMaintainConsistentFrameRate;
}

- (BOOL)dropsStartupFramesWithUnstableAE
{
  return self->_dropsStartupFramesWithUnstableAE;
}

- (void)setAeStabilityTuning:(int)a3
{
  self->_uint64_t aeStabilityTuning = a3;
}

- (int)aeStabilityTuning
{
  return self->_aeStabilityTuning;
}

- (BOOL)preservesMotionDataFromDroppedFrames
{
  return self->_preservesMotionDataFromDroppedFrames;
}

@end