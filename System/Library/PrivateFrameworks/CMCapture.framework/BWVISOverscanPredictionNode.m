@interface BWVISOverscanPredictionNode
+ (void)initialize;
- (BWVISOverscanPredictionNode)initWithCameraInfoByPortType:(id)a3 delegate:(id)a4;
- (id)nodeSubType;
- (id)nodeType;
- (void)dealloc;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWVISOverscanPredictionNode

+ (void)initialize
{
}

- (BWVISOverscanPredictionNode)initWithCameraInfoByPortType:(id)a3 delegate:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)BWVISOverscanPredictionNode;
  v6 = [(BWNode *)&v11 init];
  v7 = v6;
  if (a3)
  {
    if (v6)
    {
      v8 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v6];
      [(BWNodeInput *)v8 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
      [(BWNodeInput *)v8 setPassthroughMode:1];
      [(BWNode *)v7 addInput:v8];
      v9 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v7];
      [(BWNodeOutput *)v9 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
      [(BWNodeOutput *)v9 setPassthroughMode:1];
      [(BWNode *)v7 addOutput:v9];
      v7->_delegate = (BWVISOverscanPredictionDelegate *)a4;
      v7->_cameraInfoByPortType = (NSDictionary *)a3;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    return 0;
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWVISOverscanPredictionNode;
  [(BWNode *)&v3 dealloc];
}

- (id)nodeType
{
  return @"Effect";
}

- (id)nodeSubType
{
  return @"VISOverscanPredictor";
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  v17.receiver = self;
  v17.super_class = (Class)BWVISOverscanPredictionNode;
  [(BWNode *)&v17 prepareForCurrentConfigurationToBecomeLive];
  visOverscanPredictor = self->_visOverscanPredictor;
  if (visOverscanPredictor) {

  }
  v4 = [(BWVideoFormat *)[(BWNodeInput *)self->super._input videoFormat] pixelBufferAttributes];
  if (!v4)
  {
    fig_log_get_emitter();
LABEL_8:
    FigDebugAssert3();
    return;
  }
  v5 = v4;
  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F24D08]), "floatValue");
  __asm { FMOV            V1.2S, #-1.0 }
  *((float *)&_D1 + 1) = v11 * 0.025;
  uint64_t v15 = _D1;
  v12 = [GVSOverscanPredictor alloc];
  cameraInfoByPortType = self->_cameraInfoByPortType;
  v16[0] = 1045220557;
  v16[1] = v15;
  v16[2] = 1065353216;
  v14 = [(GVSOverscanPredictor *)v12 initWithConfig:v16 cameraInfoByPortType:cameraInfoByPortType visInputPixelBufferAttributes:v5];
  self->_visOverscanPredictor = v14;
  if (!v14)
  {
    fig_log_get_emitter();
    goto LABEL_8;
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  if (a3 && (CFTypeRef v7 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0)) != 0)
  {
    v8 = (void *)v7;
    ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    CGFloat Width = (double)CVPixelBufferGetWidth(ImageBuffer);
    float v11 = CMSampleBufferGetImageBuffer(a3);
    rect.origin.x = 0.0;
    rect.origin.y = 0.0;
    rect.size.width = Width;
    rect.size.height = (double)CVPixelBufferGetHeight(v11);
    uint64_t v12 = *MEMORY[0x1E4F54370];
    if ([v8 objectForKeyedSubscript:*MEMORY[0x1E4F54370]]) {
      CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[v8 objectForKeyedSubscript:v12], &rect);
    }
    CGSize v13 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v20.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v20.size = v13;
    CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[v8 objectForKeyedSubscript:*MEMORY[0x1E4F53260]], &v20);
    FigCaptureMetadataUtilitiesDenormalizeCropRect(v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);
    v20.origin.x = v14;
    v20.origin.y = v15;
    v20.size.width = v16;
    v20.size.height = v17;
    -[BWVISOverscanPredictionDelegate visOverscanPredictor:allowsReducedOverscan:](self->_delegate, "visOverscanPredictor:allowsReducedOverscan:", self, -[GVSOverscanPredictor predictOverscanFitsFromMetadata:finalCropRect:boundingRect:](self->_visOverscanPredictor, "predictOverscanFitsFromMetadata:finalCropRect:boundingRect:", v8));
  }
  else
  {
    fig_log_get_emitter();
    uint64_t v19 = v4;
    LODWORD(v18) = 0;
    FigDebugAssert3();
  }
  -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3, v18, v19);
}

@end