@interface BWMatteMediaSuppressionNode
+ (void)initialize;
- (BOOL)smartStyleReversibilityEnabled;
- (BWMatteMediaSuppressionNode)initWithBehavior:(unsigned int)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setSmartStyleReversibilityEnabled:(BOOL)a3;
@end

@implementation BWMatteMediaSuppressionNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
}

- (void)setSmartStyleReversibilityEnabled:(BOOL)a3
{
  self->_smartStyleReversibilityEnabled = a3;
}

- (BWMatteMediaSuppressionNode)initWithBehavior:(unsigned int)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BWMatteMediaSuppressionNode;
  v4 = [(BWNode *)&v8 init];
  if (v4)
  {
    v5 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v4];
    [(BWNodeInput *)v5 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeInput *)v5 setPassthroughMode:1];
    [(BWNode *)v4 addInput:v5];

    v6 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v4];
    [(BWNodeOutput *)v6 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeOutput *)v6 setPassthroughMode:1];
    [(BWNode *)v4 addOutput:v6];

    v4->_behavior = a3;
  }
  return v4;
}

+ (void)initialize
{
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  CMGetAttachment(a3, @"BWStillImageCaptureSettings", 0);
  v6 = (void *)CMGetAttachment(a3, @"StillSettings", 0);
  if (objc_msgSend((id)objc_msgSend(v6, "processingSettings"), "provideDemosaicedRaw")) {
    goto LABEL_28;
  }
  unsigned int behavior = self->_behavior;
  if (behavior)
  {
    int v8 = BWSampleBufferGetAttachedMedia(a3, @"Depth") == 0;
    if ((behavior & 2) == 0) {
      goto LABEL_8;
    }
LABEL_6:
    if ((v8 & 1) == 0) {
      int v8 = BWSampleBufferHasDetectedFaces(a3, 0, 0, 1, 0, 1) ^ 1;
    }
    goto LABEL_8;
  }
  int v8 = 0;
  if ((behavior & 2) != 0) {
    goto LABEL_6;
  }
LABEL_8:
  if (behavior & 4) == 0 || (v8)
  {
    if (!v8) {
      goto LABEL_28;
    }
  }
  else if (BWSampleBufferHasDetectedFaces(a3, 0, 0, 1, 1, 1))
  {
    goto LABEL_28;
  }
  v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", 0x1EFA74420, @"PersonSemanticsHair", @"PersonSemanticsSkin", @"PersonSemanticsTeeth", @"PersonSemanticsGlasses", 0);
  __int16 v10 = BWStillImageProcessingFlagsForSampleBuffer(a3);
  if (self->_smartStyleReversibilityEnabled)
  {
    int v11 = v10 & 0x1000;
    if (objc_msgSend((id)objc_msgSend(v6, "requestedSettings"), "smartStyleReversibilitySupported")
      && v11 == 0)
    {
      uint64_t v13 = BWSemanticSegmentationMatteAttachedMediaKeysSupportedByDemosaicedRaw();
      if (v13) {
        [v9 removeObjectsInArray:v13];
      }
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v14 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v9);
        }
        BWSampleBufferRemoveAttachedMedia(a3, *(void *)(*((void *)&v18 + 1) + 8 * i));
      }
      uint64_t v15 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }
LABEL_28:
  [(BWNodeOutput *)self->super._output emitSampleBuffer:a3];
}

- (BOOL)smartStyleReversibilityEnabled
{
  return self->_smartStyleReversibilityEnabled;
}

@end