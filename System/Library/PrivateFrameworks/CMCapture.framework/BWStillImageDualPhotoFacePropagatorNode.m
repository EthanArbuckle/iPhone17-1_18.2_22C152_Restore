@interface BWStillImageDualPhotoFacePropagatorNode
+ (void)initialize;
- (BWStillImageDualPhotoFacePropagatorNode)initWithBaseZoomFactors:(id)a3;
- (id)nodeSubType;
- (id)nodeType;
- (uint64_t)_emitBuffersAndErrorsToOutputs;
- (void)_clearCaptureRequestState;
- (void)_processWiderAndNarrowerFOVInput;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)handleNodeError:(id)a3 forInput:(id)a4;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWStillImageDualPhotoFacePropagatorNode

+ (void)initialize
{
}

- (BWStillImageDualPhotoFacePropagatorNode)initWithBaseZoomFactors:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)BWStillImageDualPhotoFacePropagatorNode;
  v4 = [(BWNode *)&v15 init];
  v5 = v4;
  if (v4)
  {
    v4->_currentSettingsID = -1;
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:a3];
    uint64_t v7 = 0;
    v5->_baseZoomFactors = (NSArray *)v6;
    char v8 = 1;
    do
    {
      char v9 = v8;
      v10 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v5 index:v7];
      v11 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWNodeInput *)v10 setFormatRequirements:v11];

      [(BWNodeInput *)v10 setPassthroughMode:1];
      [(BWNodeInput *)v10 setRetainedBufferCount:1];
      [(BWNode *)v5 addInput:v10];

      v12 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v5];
      v13 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWNodeOutput *)v12 setFormatRequirements:v13];
      [(BWNodeOutput *)v12 setPassthroughMode:1];
      [(BWNodeOutput *)v12 setIndexOfInputWhichDrivesThisOutput:v7];

      [(BWNode *)v5 addOutput:v12];
      char v8 = 0;
      uint64_t v7 = 1;
    }
    while ((v9 & 1) != 0);
    v5->_widerFOVInput = (BWNodeInput *)[(NSArray *)[(BWNode *)v5 inputs] objectAtIndexedSubscript:0];
    v5->_narrowerFOVInput = (BWNodeInput *)[(NSArray *)[(BWNode *)v5 inputs] objectAtIndexedSubscript:1];
    v5->_widerFOVOutput = (BWNodeOutput *)[(NSArray *)[(BWNode *)v5 outputs] objectAtIndexedSubscript:0];
    v5->_narrowerFOVOutput = (BWNodeOutput *)[(NSArray *)[(BWNode *)v5 outputs] objectAtIndexedSubscript:1];
  }
  return v5;
}

- (void)dealloc
{
  -[BWStillImageDualPhotoFacePropagatorNode _clearCaptureRequestState]((uint64_t)self);

  self->_baseZoomFactors = 0;
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageDualPhotoFacePropagatorNode;
  [(BWNode *)&v3 dealloc];
}

- (void)_clearCaptureRequestState
{
  if (a1)
  {
    v2 = *(const void **)(a1 + 112);
    if (v2)
    {
      CFRelease(v2);
      *(void *)(a1 + 112) = 0;
    }
    objc_super v3 = *(const void **)(a1 + 120);
    if (v3)
    {
      CFRelease(v3);
      *(void *)(a1 + 120) = 0;
    }

    *(void *)(a1 + 128) = 0;
    *(void *)(a1 + 136) = 0;
  }
}

- (id)nodeType
{
  return @"Synchronizer";
}

- (id)nodeSubType
{
  return @"GenericSynchronizer";
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  id v5 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", [a4 index]);
  [v5 setFormat:a3];
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (-[BWNode allInputsHaveReachedState:](self, "allInputsHaveReachedState:", 1, a4, a5))
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = [(BWNode *)self outputs];
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v10++) makeConfiguredFormatLive];
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(BWNode *)self allInputsHaveReachedState:0])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v4 = [(BWNode *)self outputs];
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) markEndOfLiveOutput];
        }
        while (v6 != v8);
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)CMGetAttachment(a3, @"StillSettings", 0);
  if ([v7 settingsID] != self->_currentSettingsID)
  {
    -[BWStillImageDualPhotoFacePropagatorNode _clearCaptureRequestState]((uint64_t)self);
    self->_currentSettingsID = [v7 settingsID];
  }
  if ((unint64_t)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "requestedSettings"), "bravoConstituentImageDeliveryDeviceTypes"), "count") >= 2)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v8 = objc_msgSend((id)CMGetAttachment(a3, @"BWStillImageCaptureSettings", 0), "captureStreamSettings", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = 0;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v8);
          }
          v11 += [*(id *)(*((void *)&v16 + 1) + 8 * i) hasValidFrames];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
      if (v11 > 1)
      {
        if (self->_widerFOVInput == a4)
        {
          uint64_t v14 = 112;
          if (self->_widerFOVBuffer)
          {
            -[BWNodeOutput emitSampleBuffer:](self->_widerFOVOutput, "emitSampleBuffer:");
            CFRelease(self->_widerFOVBuffer);
          }
          if (!a3)
          {
LABEL_19:
            objc_super v15 = 0;
LABEL_24:
            *(Class *)((char *)&self->super.super.isa + v14) = v15;
            goto LABEL_25;
          }
        }
        else
        {
          if (self->_narrowerFOVInput != a4)
          {
LABEL_25:
            -[BWStillImageDualPhotoFacePropagatorNode _processWiderAndNarrowerFOVInput]((uint64_t)self);
            return;
          }
          uint64_t v14 = 120;
          if (self->_narrowerFOVBuffer)
          {
            -[BWNodeOutput emitSampleBuffer:](self->_narrowerFOVOutput, "emitSampleBuffer:");
            CFRelease(self->_narrowerFOVBuffer);
          }
          if (!a3) {
            goto LABEL_19;
          }
        }
        objc_super v15 = (objc_class *)CFRetain(a3);
        goto LABEL_24;
      }
    }
  }
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(a4, "index")), "emitSampleBuffer:", a3);
}

- (void)_processWiderAndNarrowerFOVInput
{
  if (!a1) {
    return;
  }
  v2 = *(const void **)(a1 + 112);
  if (!v2)
  {
    if (!*(void *)(a1 + 128)) {
      return;
    }
    if (*(void *)(a1 + 120)) {
      goto LABEL_8;
    }
LABEL_7:
    if (!*(void *)(a1 + 136)) {
      return;
    }
    goto LABEL_8;
  }
  objc_super v3 = *(const void **)(a1 + 120);
  if (!v3) {
    goto LABEL_7;
  }
  BWProcessWiderAndNarrowerFOVBuffersForFacePropagation(v2, v3, *(void **)(a1 + 104));
LABEL_8:
  -[BWStillImageDualPhotoFacePropagatorNode _emitBuffersAndErrorsToOutputs](a1);
  -[BWStillImageDualPhotoFacePropagatorNode _clearCaptureRequestState](a1);
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  uint64_t v7 = (void *)[a3 stillImageSettings];
  if ([v7 settingsID] != self->_currentSettingsID)
  {
    -[BWStillImageDualPhotoFacePropagatorNode _clearCaptureRequestState]((uint64_t)self);
    self->_currentSettingsID = [v7 settingsID];
  }
  if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "requestedSettings"), "bravoConstituentImageDeliveryDeviceTypes"), "count"))
  {
    objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(a4, "index")), "emitNodeError:", a3);
    goto LABEL_13;
  }
  if (self->_widerFOVInput != a4)
  {
    if (self->_narrowerFOVInput != a4) {
      goto LABEL_13;
    }
    uint64_t v8 = 136;
    if (!self->_narrowerFOVError) {
      goto LABEL_12;
    }
    uint64_t v9 = 168;
    goto LABEL_11;
  }
  uint64_t v8 = 128;
  if (self->_widerFOVError)
  {
    uint64_t v9 = 160;
LABEL_11:
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v9), "emitNodeError:");
  }
LABEL_12:
  *(Class *)((char *)&self->super.super.isa + v8) = (Class)a3;
LABEL_13:
  -[BWStillImageDualPhotoFacePropagatorNode _processWiderAndNarrowerFOVInput]((uint64_t)self);
}

- (uint64_t)_emitBuffersAndErrorsToOutputs
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(void *)(result + 112)) {
      result = objc_msgSend(*(id *)(result + 160), "emitSampleBuffer:");
    }
    if (*(void *)(v1 + 128)) {
      result = objc_msgSend(*(id *)(v1 + 160), "emitNodeError:");
    }
    if (*(void *)(v1 + 120)) {
      result = objc_msgSend(*(id *)(v1 + 168), "emitSampleBuffer:");
    }
    if (*(void *)(v1 + 136))
    {
      v2 = *(void **)(v1 + 168);
      return objc_msgSend(v2, "emitNodeError:");
    }
  }
  return result;
}

@end