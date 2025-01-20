@interface BWStillImageDisparitySplitterNode
+ (void)initialize;
- (BWNodeOutput)disparityOutput;
- (BWNodeOutput)processedOutput;
- (BWStillImageDisparitySplitterNode)init;
- (id)nodeSubType;
- (id)nodeType;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)handleDroppedSample:(id)a3 forInput:(id)a4;
- (void)handleNodeError:(id)a3 forInput:(id)a4;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWStillImageDisparitySplitterNode

+ (void)initialize
{
}

- (BWStillImageDisparitySplitterNode)init
{
  v11.receiver = self;
  v11.super_class = (Class)BWStillImageDisparitySplitterNode;
  v2 = [(BWNode *)&v11 init];
  if (v2)
  {
    v3 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v2];
    v4 = [(BWNodeInput *)v3 primaryMediaConfiguration];
    [(BWNodeInputMediaConfiguration *)v4 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    char v5 = 1;
    [(BWNodeInputMediaConfiguration *)v4 setPassthroughMode:1];
    [(BWNode *)v2 addInput:v3];
    uint64_t v6 = 0;
    v2->_outputs = (id *)malloc_type_malloc(0x10uLL, 0x80040B8603338uLL);
    v2->_numberOfOutputs = 2;
    do
    {
      char v7 = v5;
      v8 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v2];
      v9 = [(BWNodeOutput *)v8 primaryMediaConfiguration];
      [(BWNodeOutputMediaConfiguration *)v9 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
      [(BWNodeOutputMediaConfiguration *)v9 setPassthroughMode:1];
      [(BWNode *)v2 addOutput:v8];
      char v5 = 0;
      v2->_outputs[v6] = v8;
      uint64_t v6 = 1;
    }
    while ((v7 & 1) != 0);
    [(BWNodeOutput *)[(BWStillImageDisparitySplitterNode *)v2 disparityOutput] setName:@"Disparity"];
    [(BWNodeOutput *)[(BWStillImageDisparitySplitterNode *)v2 processedOutput] setName:@"Processed"];
  }
  return v2;
}

- (void)dealloc
{
  outputs = self->_outputs;
  if (outputs)
  {
    free(outputs);
    self->_outputs = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)BWStillImageDisparitySplitterNode;
  [(BWNode *)&v4 dealloc];
}

- (id)nodeType
{
  return @"Muxer";
}

- (id)nodeSubType
{
  return @"DisparityFusionSplitter";
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  if ([a5 isEqualToString:@"PrimaryFormat"])
  {
    if (self->_numberOfOutputs)
    {
      unint64_t v9 = 0;
      do
        [self->_outputs[v9++] setFormat:a3];
      while (v9 < self->_numberOfOutputs);
    }
  }
  else if ([a5 isEqualToString:0x1EFA74380])
  {
    v10 = [(BWStillImageDisparitySplitterNode *)self disparityOutput];
    if (!-[BWNodeOutput attachedMediaKeyDrivenByInputAttachedMediaKey:inputIndex:](v10, "attachedMediaKeyDrivenByInputAttachedMediaKey:inputIndex:", a5, [a4 index]))
    {
      if ([(BWNodeOutput *)v10 mediaPropertiesForAttachedMediaKey:0])
      {
        uint64_t v12 = [NSString stringWithFormat:@"%@ output %@ unexpectedly has mediaPropertiesForAttachedMediaKey %@ (provided media key was %@)", self, v10, 0, a5];
        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v12 userInfo:0]);
      }
      objc_super v11 = objc_alloc_init(BWNodeOutputMediaProperties);
      [(BWNodeOutput *)v10 _setMediaProperties:v11 forAttachedMediaKey:0];
      [(BWNodeOutputMediaProperties *)v11 setResolvedFormat:a3];
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)BWStillImageDisparitySplitterNode;
    [(BWNode *)&v13 didSelectFormat:a3 forInput:a4 forAttachedMediaKey:a5];
  }
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  if (self->_numberOfOutputs)
  {
    unint64_t v6 = 0;
    do
      objc_msgSend(self->_outputs[v6++], "makeConfiguredFormatLive", a3, a4, a5);
    while (v6 < self->_numberOfOutputs);
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  if (self->_numberOfOutputs)
  {
    unint64_t v4 = 0;
    do
      objc_msgSend(self->_outputs[v4++], "markEndOfLiveOutput", a3);
    while (v4 < self->_numberOfOutputs);
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  sampleBufferOut[1] = *(CMSampleBufferRef *)MEMORY[0x1E4F143B8];
  if (a3)
  {
    unint64_t v6 = (void *)CMGetAttachment(a3, @"BWStillImageCaptureSettings", 0);
    int v7 = [v6 captureType];
    v8 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    unint64_t v9 = (void *)[v8 objectForKeyedSubscript:*MEMORY[0x1E4F53450]];
    v10 = (void *)[v8 objectForKeyedSubscript:*MEMORY[0x1E4F53D38]];
    objc_super v11 = (void *)CMGetAttachment(a3, @"HasUnreliableBracketingMetadata", 0);
    __int16 v12 = objc_msgSend((id)CMGetAttachment(a3, @"StillImageProcessingFlags", 0), "unsignedIntegerValue");
    int v13 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E4F54138]), "BOOLValue");
    if ((v12 & 0x400) != 0) {
      int v14 = 0;
    }
    else {
      int v14 = v13;
    }
    int v15 = [v11 BOOLValue];
    int v16 = v15;
    if (v7 == 3)
    {
      int v18 = v9 && ([v9 doubleValue], v17 == 0.0) && (int)objc_msgSend(v10, "intValue") > 0;
    }
    else if ((v12 & 0x400) != 0)
    {
      int v18 = 0;
    }
    else
    {
      int v18 = (v7 == 10) & ~v15 & ~v14;
    }
    uint64_t v19 = [v6 captureFlags];
    BOOL v24 = v7 != 3 && v7 != 10;
    if ((v19 & 0x20000) == 0) {
      BOOL v24 = 1;
    }
    if (((v24 | v14) & 1) == 0)
    {
      MEMORY[0x1F4188790](v19, v20, v21, v22);
      outputs = (id *)&v32;
      if ((v30 & ~v16 | v18)) {
        v31 = [(BWStillImageDisparitySplitterNode *)self disparityOutput];
      }
      else {
        v31 = [(BWStillImageDisparitySplitterNode *)self processedOutput];
      }
      unint64_t v27 = 0;
      v32 = v31;
LABEL_36:
      objc_msgSend(outputs[v27], "emitSampleBuffer:", a3, v32);
      return;
    }
    if ((v18 & 1) == 0)
    {
      unint64_t numberOfOutputs = self->_numberOfOutputs;
      if (numberOfOutputs)
      {
        outputs = self->_outputs;
        unint64_t v27 = numberOfOutputs - 1;
        if (numberOfOutputs != 1)
        {
          uint64_t v28 = 0;
          do
          {
            sampleBufferOut[0] = 0;
            BWCMSampleBufferCreateCopyIncludingMetadata(a3, sampleBufferOut);
            v29 = (BWNodeOutput *)outputs[v28];
            if (v29 != [(BWStillImageDisparitySplitterNode *)self disparityOutput]) {
              BWSampleBufferRemoveAttachedMedia(sampleBufferOut[0], 0x1EFA74380);
            }
            [outputs[v28] emitSampleBuffer:sampleBufferOut[0]];
            if (sampleBufferOut[0]) {
              CFRelease(sampleBufferOut[0]);
            }
            ++v28;
          }
          while (v27 != v28);
        }
        goto LABEL_36;
      }
    }
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  if (self->_numberOfOutputs)
  {
    unint64_t v6 = 0;
    do
      objc_msgSend(self->_outputs[v6++], "emitNodeError:", a3, a4);
    while (v6 < self->_numberOfOutputs);
  }
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  if (self->_numberOfOutputs)
  {
    unint64_t v6 = 0;
    do
      objc_msgSend(self->_outputs[v6++], "emitDroppedSample:", a3, a4);
    while (v6 < self->_numberOfOutputs);
  }
}

- (BWNodeOutput)disparityOutput
{
  return (BWNodeOutput *)*self->_outputs;
}

- (BWNodeOutput)processedOutput
{
  return (BWNodeOutput *)*((void *)self->_outputs + 1);
}

@end