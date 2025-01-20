@interface BWSceneClassifierFrameGateNode
+ (void)initialize;
- (BOOL)discardsBlurryFrames;
- (BWSceneClassifierFrameGateNode)initWithMaxOutputFrameRate:(int)a3;
- (id)nodeSubType;
- (id)nodeType;
- (void)dealloc;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setDiscardsBlurryFrames:(BOOL)a3;
@end

@implementation BWSceneClassifierFrameGateNode

+ (void)initialize
{
}

- (BWSceneClassifierFrameGateNode)initWithMaxOutputFrameRate:(int)a3
{
  if (a3 <= 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    return 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)BWSceneClassifierFrameGateNode;
    v5 = [(BWNode *)&v9 init];
    if (v5)
    {
      v6 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v5];
      [(BWNodeInput *)v6 setPassthroughMode:1];
      [(BWNode *)v5 addInput:v6];

      v7 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v5];
      [(BWNodeOutput *)v7 setPassthroughMode:1];
      [(BWNode *)v5 addOutput:v7];

      v5->_maxFrameRate = a3;
      v5->_discardsBlurryFrames = 1;
    }
  }
  return v5;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)BWSceneClassifierFrameGateNode;
  [(BWNode *)&v2 dealloc];
}

- (id)nodeType
{
  return @"Effect";
}

- (id)nodeSubType
{
  return @"SceneClassifierFrameGate";
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  ++self->_inputFrameCount;
  if (!objc_msgSend((id)CMGetAttachment(a3, @"UprightExifOrientation", 0), "intValue"))
  {
    if (self->_inputFrameCount < 31) {
      return;
    }
    CMSetAttachment(a3, @"UprightExifOrientation", &unk_1EFB00308, 1u);
  }
  CFDictionaryRef v6 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F530C0], 0);
  if (v6) {
    CMTimeMakeFromDictionary(&lhs, v6);
  }
  else {
    CMSampleBufferGetPresentationTimeStamp(&lhs, a3);
  }
  CMTimeValue value = lhs.value;
  CMTimeFlags flags = lhs.flags;
  CMTimeScale timescale = lhs.timescale;
  CMTimeEpoch epoch = lhs.epoch;
  p_lastEmittedPTS = &self->_lastEmittedPTS;
  if (self->_lastEmittedPTS.flags & 1) != 0 && (lhs.flags)
  {
    lhs.CMTimeValue value = value;
    lhs.CMTimeScale timescale = timescale;
    *(_OWORD *)&v16.CMTimeValue value = *(_OWORD *)&p_lastEmittedPTS->value;
    v16.CMTimeEpoch epoch = self->_lastEmittedPTS.epoch;
    CMTimeSubtract(&time, &lhs, &v16);
    float v10 = 0.95 / CMTimeGetSeconds(&time);
    float maxFrameRate = (float)self->_maxFrameRate;
    if (!self->_discardsBlurryFrames || v10 > maxFrameRate)
    {
      if (v10 > maxFrameRate) {
        return;
      }
LABEL_18:
      p_lastEmittedPTS->CMTimeValue value = value;
      self->_lastEmittedPTS.CMTimeScale timescale = timescale;
      self->_lastEmittedPTS.CMTimeFlags flags = flags;
      self->_lastEmittedPTS.CMTimeEpoch epoch = epoch;
      [(BWNodeOutput *)self->super._output emitSampleBuffer:a3];
      return;
    }
  }
  else if (!self->_discardsBlurryFrames)
  {
    goto LABEL_18;
  }
  v12 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  int v13 = objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E4F53BF8]), "intValue");
  int v14 = objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E4F53EE0]), "intValue");
  if (v13 == 4 || v14 != 1) {
    goto LABEL_18;
  }
}

- (void)setDiscardsBlurryFrames:(BOOL)a3
{
  self->_discardsBlurryFrames = a3;
}

- (BOOL)discardsBlurryFrames
{
  return self->_discardsBlurryFrames;
}

@end