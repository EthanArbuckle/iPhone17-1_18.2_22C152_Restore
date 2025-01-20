@interface BWRedEyeReducerNode
+ (void)initialize;
- (BWRedEyeReducerNode)initWithVersion:(int)a3 sensorConfigurationsByPortType:(id)a4;
- (id)inferenceAttachmentKey;
- (id)nodeSubType;
- (id)nodeType;
- (int)inferenceType;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)handleNodeError:(id)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setInferenceAttachmentKey:(id)a3;
- (void)setInferenceType:(int)a3;
@end

@implementation BWRedEyeReducerNode

+ (void)initialize
{
}

- (BWRedEyeReducerNode)initWithVersion:(int)a3 sensorConfigurationsByPortType:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)BWRedEyeReducerNode;
  v6 = [(BWNode *)&v21 init];
  if (v6)
  {
    v7 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a4, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v8 = [a4 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(a4);
          }
          -[NSDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *(void *)(*((void *)&v17 + 1) + 8 * v11)), "sensorIDDictionary"), "objectForKeyedSubscript:", @"RedEyeReductionParameters"), *(void *)(*((void *)&v17 + 1) + 8 * v11));
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [a4 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v9);
    }
    v6->_redEyeReductionParametersByPortType = v7;
    v12 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v6];
    v13 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v13 setSupportedPixelFormats:&unk_1EFB03548];
    [(BWNodeInput *)v12 setFormatRequirements:v13];
    [(BWNodeInput *)v12 setPassthroughMode:1];

    [(BWNode *)v6 addInput:v12];
    v14 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v6];
    v15 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v15 setSupportedPixelFormats:&unk_1EFB03560];
    [(BWNodeOutput *)v14 setFormatRequirements:v15];
    [(BWNodeOutput *)v14 setPassthroughMode:1];

    [(BWNode *)v6 addOutput:v14];
    v6->_ciContext = (CIContext *)objc_alloc_init(MEMORY[0x1E4F1E018]);
    v6->_primaryImageSampleBuffer = 0;
    v6->_skipRepair = 0;
    v6->_redEyeReductionVersion = a3;
  }
  return v6;
}

- (void)dealloc
{
  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription) {
    CFRelease(outputFormatDescription);
  }
  primaryImageSampleBuffer = self->_primaryImageSampleBuffer;
  if (primaryImageSampleBuffer) {
    CFRelease(primaryImageSampleBuffer);
  }

  v5.receiver = self;
  v5.super_class = (Class)BWRedEyeReducerNode;
  [(BWNode *)&v5 dealloc];
}

- (void)setInferenceType:(int)a3
{
  self->_inferenceType = a3;
}

- (int)inferenceType
{
  return self->_inferenceType;
}

- (void)setInferenceAttachmentKey:(id)a3
{
  self->_inferenceAttachmentKey = (NSString *)a3;
}

- (id)inferenceAttachmentKey
{
  return self->_inferenceAttachmentKey;
}

- (id)nodeType
{
  return @"Effect";
}

- (id)nodeSubType
{
  return @"RedEyeReducer";
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  v4.receiver = self;
  v4.super_class = (Class)BWRedEyeReducerNode;
  [(BWNode *)&v4 prepareForCurrentConfigurationToBecomeLive];
  if (!self->_redEyeRepairSession)
  {
    v3 = (CIDualRedEyeRepairSession *)objc_alloc_init(MEMORY[0x1E4F1E038]);
    self->_redEyeRepairSession = v3;
    [(CIDualRedEyeRepairSession *)v3 setContext:self->_ciContext];
    [(CIDualRedEyeRepairSession *)self->_redEyeRepairSession prepareRepair];
  }
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  if (a4)
  {
    outputFormatDescription = self->_outputFormatDescription;
    if (outputFormatDescription)
    {
      CFRelease(outputFormatDescription);
      self->_outputFormatDescription = 0;
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)BWRedEyeReducerNode;
  [(BWNode *)&v10 configurationWithID:a3 updatedFormat:a4 didBecomeLiveForInput:a5];
}

- (void)didReachEndOfDataForInput:(id)a3
{
  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription)
  {
    CFRelease(outputFormatDescription);
    self->_outputFormatDescription = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)BWRedEyeReducerNode;
  [(BWNode *)&v6 didReachEndOfDataForInput:a3];
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  objc_super v6 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  char v7 = objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E4F54188]), "BOOLValue");
  uint64_t v8 = (void *)CMGetAttachment(a3, @"BWStillImageCaptureSettings", 0);
  uint64_t v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
  int v10 = objc_msgSend((id)objc_msgSend(v8, "captureStreamSettingsForPortType:", v9), "captureFlags");
  if ([v8 captureType] != 2 || (*(void *)&v10 & 0x10000) == 0)
  {
    primaryImageSampleBuffer = self->_primaryImageSampleBuffer;
    if (primaryImageSampleBuffer)
    {
      CFRelease(primaryImageSampleBuffer);
      self->_primaryImageSampleBuffer = 0;
    }
LABEL_19:
    [(BWNodeOutput *)self->super._output emitSampleBuffer:a3];
    return;
  }
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  CVImageBufferRef v14 = ImageBuffer;
  if ((v7 & 1) == 0)
  {
    if (!self->_primaryImageSampleBuffer && self->_inferenceType && self->_inferenceAttachmentKey)
    {
      uint64_t AttachedInference = BWInferenceGetAttachedInference(a3, [(BWRedEyeReducerNode *)self inferenceType], (uint64_t)[(BWRedEyeReducerNode *)self inferenceAttachmentKey]);
      long long v17 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      unint64_t v18 = [v8 sceneFlags];
      uint64_t v19 = [NSNumber numberWithBool:(v18 >> 5) & 1];
      [v17 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F1DFE8]];
      uint64_t v20 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F53248]];
      [v17 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F1DFC8]];
      [v17 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F1DFD8]];
      uint64_t v21 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F540F8]];
      [v17 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F1DFD0]];
      [v17 setObject:FigCaptureGetModelSpecificName() forKeyedSubscript:*MEMORY[0x1E4F1DFC0]];
      if ([(NSDictionary *)self->_redEyeReductionParametersByPortType objectForKeyedSubscript:v9])
      {
        uint64_t v24 = v9;
        v25[0] = [(NSDictionary *)self->_redEyeReductionParametersByPortType objectForKeyedSubscript:v9];
        uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
        [v17 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F1DFE0]];
      }
      char v23 = [(CIDualRedEyeRepairSession *)self->_redEyeRepairSession setPrimary:v14 observations:AttachedInference metadata:v17];
      self->_skipRepair = v23 ^ 1;
      if (v23)
      {
        self->_primaryImageSampleBuffer = (opaqueCMSampleBuffer *)CFRetain(a3);
        return;
      }
    }
    goto LABEL_19;
  }
  if (!self->_skipRepair)
  {
    [(CIDualRedEyeRepairSession *)self->_redEyeRepairSession repairPrimaryWithSecondary:ImageBuffer];
    [(BWNodeOutput *)self->super._output emitSampleBuffer:self->_primaryImageSampleBuffer];
    v15 = self->_primaryImageSampleBuffer;
    if (v15)
    {
      CFRelease(v15);
      self->_primaryImageSampleBuffer = 0;
    }
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  if (self->_primaryImageSampleBuffer)
  {
    [(CIDualRedEyeRepairSession *)self->_redEyeRepairSession setPrimary:0 observations:0 metadata:0];
    [(BWNodeOutput *)self->super._output emitSampleBuffer:self->_primaryImageSampleBuffer];
    primaryImageSampleBuffer = self->_primaryImageSampleBuffer;
    if (primaryImageSampleBuffer)
    {
      CFRelease(primaryImageSampleBuffer);
      self->_primaryImageSampleBuffer = 0;
    }
  }
  else
  {
    output = self->super._output;
    -[BWNodeOutput emitNodeError:](output, "emitNodeError:", a3, a4);
  }
}

@end