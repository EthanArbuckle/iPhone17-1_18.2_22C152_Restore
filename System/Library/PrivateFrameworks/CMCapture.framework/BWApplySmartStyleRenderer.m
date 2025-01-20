@interface BWApplySmartStyleRenderer
+ (void)initialize;
- (BOOL)adjustsMetadata;
- (BOOL)supportsAnimation;
- (BWApplySmartStyleRenderer)initWithMetalCommandQueue:(id)a3 smartStyleRenderingVersion:(int)a4;
- (NSString)displayName;
- (int)prepareForRenderingWithParameters:(id)a3 inputVideoFormat:(id)a4 inputMediaPropertiesByAttachedMediaKey:(id)a5;
- (signed)type;
- (void)dealloc;
- (void)renderUsingParameters:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 originalPixelBuffer:(__CVBuffer *)a6 processedPixelBuffer:(__CVBuffer *)a7 completionHandler:(id)a8;
@end

@implementation BWApplySmartStyleRenderer

+ (void)initialize
{
}

- (BWApplySmartStyleRenderer)initWithMetalCommandQueue:(id)a3 smartStyleRenderingVersion:(int)a4
{
  v8.receiver = self;
  v8.super_class = (Class)BWApplySmartStyleRenderer;
  v6 = [(BWApplySmartStyleRenderer *)&v8 init];
  if (v6)
  {
    v6->_mtlCommandQueue = (MTLCommandQueue *)a3;
    v6->_smartStyleRenderingVersion = a4;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWApplySmartStyleRenderer;
  [(BWApplySmartStyleRenderer *)&v3 dealloc];
}

- (signed)type
{
  return 6;
}

- (NSString)displayName
{
  return (NSString *)@"Apply Smart Style Renderer";
}

- (BOOL)supportsAnimation
{
  return 0;
}

- (BOOL)adjustsMetadata
{
  return 0;
}

- (int)prepareForRenderingWithParameters:(id)a3 inputVideoFormat:(id)a4 inputMediaPropertiesByAttachedMediaKey:(id)a5
{
  int v6 = BWLoadCreateAndSetupMetalImageBufferProcessor(@"SmartStyle", self->_smartStyleRenderingVersion, @"CMI", @"SmartStyle", self->_smartStyleRenderingVersion, (uint64_t)&unk_1EFB6FEA8, 0, 0, (uint64_t)self->_mtlCommandQueue, 0, &self->_smartStyleProcessor);
  if (!v6)
  {
    [(CMISmartStyleProcessor *)self->_smartStyleProcessor setInstanceLabel:@"PortraitApply"];
    [(CMISmartStyleProcessor *)self->_smartStyleProcessor setUseLiveMetalAllocations:1];
    -[CMISmartStyleProcessor setConfiguration:](self->_smartStyleProcessor, "setConfiguration:", [(id)objc_opt_class() getDefaultProcessorConfigurationForStills]);
    self->_smartStyleProcessorInputOutputClass = NSClassFromString((NSString *)objc_msgSend(NSString, "stringWithFormat:", @"CMISmartStyleProcessorInputOutputV%d", self->_smartStyleRenderingVersion));
  }
  return v6;
}

- (void)renderUsingParameters:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 originalPixelBuffer:(__CVBuffer *)a6 processedPixelBuffer:(__CVBuffer *)a7 completionHandler:(id)a8
{
  CFTypeRef v14 = CMGetAttachment(a5, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (!v14) {
    goto LABEL_18;
  }
  v15 = (void *)v14;
  [(CMISmartStyleProcessor *)self->_smartStyleProcessor resetState];
  if ((BWStillImageProcessingFlagsForSampleBuffer(a5) & 0x800000) != 0)
  {
    id v38 = 0;
    uint64_t v39 = 0;
LABEL_15:

    uint64_t v40 = 0;
    if (!a8) {
      return;
    }
    goto LABEL_16;
  }
  AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a5, 0x1EFA747A0);
  if (!AttachedMedia) {
    goto LABEL_18;
  }
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
  v18 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a5, 0x1EFA4EB60);
  CVImageBufferRef v19 = v18 ? CMSampleBufferGetImageBuffer(v18) : 0;
  double FinalCropRect = FigCaptureMetadataUtilitiesGetFinalCropRect();
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  uint64_t v27 = *MEMORY[0x1E4F53538];
  v28 = (void *)[v15 objectForKeyedSubscript:*MEMORY[0x1E4F53538]];
  uint64_t v29 = *MEMORY[0x1E4F535F8];
  if (![v28 objectForKeyedSubscript:*MEMORY[0x1E4F535F8]]) {
    goto LABEL_18;
  }
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", v27), "objectForKeyedSubscript:", v29), "doubleValue");
  double v31 = v30;
  size_t Width = CVPixelBufferGetWidth(a4);
  size_t Height = CVPixelBufferGetHeight(a4);
  FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect(Width, Height, FinalCropRect, v22, v24, v26, v31);
  double x = v44.origin.x;
  double y = v44.origin.y;
  double v36 = v44.size.width;
  double v37 = v44.size.height;
  if (!CGRectIsNull(v44))
  {
    id v38 = objc_alloc_init(self->_smartStyleProcessorInputOutputClass);
    if (!v38)
    {
      fig_log_get_emitter();
      uint64_t v43 = v8;
      LODWORD(v42) = 0;
      FigDebugAssert3();
    }
    objc_msgSend(v38, "setInputUnstyledPixelBuffer:", a4, v42, v43);
    [v38 setInputMetadataDict:v15];
    objc_msgSend(v38, "setInputUnstyledCropRect:", x, y, v36, v37);
    [v38 setInputStyleCoefficientsPixelBuffer:ImageBuffer];
    [v38 setOutputStyledPixelBuffer:a7];
    objc_msgSend(v38, "setOutputStyledCropRect:", x, y, v36, v37);
    [v38 setOutputGainMapPixelBuffer:v19];
    [v38 setResidualsCalculationDisabled:1];
    [(CMISmartStyleProcessor *)self->_smartStyleProcessor setInputOutput:v38];
    if (![(CMISmartStyleProcessor *)self->_smartStyleProcessor prepareToProcess:6]&& ![(CMISmartStyleProcessor *)self->_smartStyleProcessor process]&& ![(CMISmartStyleProcessor *)self->_smartStyleProcessor finishProcessing])
    {
      uint64_t v39 = 2;
      goto LABEL_15;
    }
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else
  {
LABEL_18:
    id v38 = 0;
  }

  uint64_t v40 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-2 userInfo:0];
  uint64_t v39 = 0;
  if (!a8) {
    return;
  }
LABEL_16:
  (*((void (**)(id, uint64_t, uint64_t))a8 + 2))(a8, v39, v40);
}

@end