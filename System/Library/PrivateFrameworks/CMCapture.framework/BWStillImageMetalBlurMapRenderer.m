@interface BWStillImageMetalBlurMapRenderer
+ (void)initialize;
- (BOOL)adjustsMetadata;
- (BOOL)shouldEnableForegroundBlur;
- (BOOL)supportsAnimation;
- (BWStillImageMetalBlurMapRenderer)initWithSDOFRenderingTuningParameters:(id)a3 imageDimensions:(id)a4 depthDataMapDimensions:(id)a5 portraitRenderQuality:(int)a6 metalCommandQueue:(id)a7 backPressureDrivenPipelining:(BOOL)a8;
- (NSString)displayName;
- (int)prepareForRenderingWithParameters:(id)a3 inputVideoFormat:(id)a4 inputMediaPropertiesByAttachedMediaKey:(id)a5;
- (signed)type;
- (uint64_t)_allocateBlurMapPixelBufferPoolForBuffersOfWidth:(uint64_t)a3 height:(int)a4 enableForegroundBlur:;
- (uint64_t)_loadAndConfigureSDOFBlurMapRenderer;
- (uint64_t)bundleOptionsDictionary;
- (void)dealloc;
- (void)renderUsingParameters:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 originalPixelBuffer:(__CVBuffer *)a6 processedPixelBuffer:(__CVBuffer *)a7 completionHandler:(id)a8;
@end

@implementation BWStillImageMetalBlurMapRenderer

+ (void)initialize
{
}

- (BWStillImageMetalBlurMapRenderer)initWithSDOFRenderingTuningParameters:(id)a3 imageDimensions:(id)a4 depthDataMapDimensions:(id)a5 portraitRenderQuality:(int)a6 metalCommandQueue:(id)a7 backPressureDrivenPipelining:(BOOL)a8
{
  v16.receiver = self;
  v16.super_class = (Class)BWStillImageMetalBlurMapRenderer;
  v14 = [(BWStillImageMetalBlurMapRenderer *)&v16 init];
  if (v14)
  {
    v14->_sdofRenderingTuningParameters = (NSDictionary *)a3;
    v14->_imageDimensions = ($470D365275581EF16070F5A11344F73E)a4;
    v14->_depthDataMapDimensions = ($470D365275581EF16070F5A11344F73E)a5;
    v14->_portraitRenderQuality = a6;
    v14->_mtlCommandQueue = (MTLCommandQueue *)a7;
    v14->_backPressureDrivenPipelining = a8;
    -[BWStillImageMetalBlurMapRenderer _loadAndConfigureSDOFBlurMapRenderer]((uint64_t)v14);
  }
  return v14;
}

- (uint64_t)_loadAndConfigureSDOFBlurMapRenderer
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v12 = 0;
    v2 = (void *)-[BWStillImageMetalBlurMapRenderer bundleOptionsDictionary](result);
    if (!v2) {
      goto LABEL_16;
    }
    v3 = v2;
    v4 = (void *)[v2 objectForKeyedSubscript:*MEMORY[0x1E4F535B0]];
    if (!v4 || (v5 = (void *)[v4 objectForKeyedSubscript:*MEMORY[0x1E4F535B8]]) == 0)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return FigSignalErrorAt();
    }
    int v6 = [v5 intValue];
    uint64_t v7 = v6 >= 5 ? 5 : v6;
    uint64_t v8 = [NSString stringWithFormat:@"%@/%@V%d.bundle", @"/System/Library/VideoProcessors", @"SDOFRendering", v7, v12];
    v9 = (void *)[MEMORY[0x1E4F28B50] bundleWithPath:v8];
    if (!v9)
    {
LABEL_16:
      fig_log_get_emitter();
LABEL_20:
      FigDebugAssert3();
      return FigSignalErrorAt();
    }
    v10 = v9;
    if ([v9 loadAndReturnError:&v12])
    {
      v11 = objc_msgSend(objc_alloc((Class)objc_msgSend(v10, "classNamed:", @"FigSDOFBlurMapRendering")), "initWithCommandQueue:", *(void *)(v1 + 56));
      *(void *)(v1 + 16) = v11;
      if (v11
        && ![v11 setOptions:v3]
        && (objc_msgSend(*(id *)(v1 + 16), "allocateResourcesForInputImageWidth:inputImageHeight:shiftMapWidth:shiftMapHeight:enableForegroundBlur:", *(int *)(v1 + 40), *(int *)(v1 + 44), *(int *)(v1 + 48), *(int *)(v1 + 52), objc_msgSend((id)v1, "shouldEnableForegroundBlur")) & 1) != 0)
      {
        return 0;
      }
      fig_log_get_emitter();
      goto LABEL_20;
    }
    return 4294954510;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageMetalBlurMapRenderer;
  [(BWStillImageMetalBlurMapRenderer *)&v3 dealloc];
}

- (signed)type
{
  return 1;
}

- (NSString)displayName
{
  return (NSString *)@"SDOF Metal Renderer";
}

- (BOOL)shouldEnableForegroundBlur
{
  v2 = (void *)-[BWStillImageMetalBlurMapRenderer bundleOptionsDictionary]((uint64_t)self);
  if (v2
    && (objc_super v3 = (void *)[v2 objectForKeyedSubscript:*MEMORY[0x1E4F535B0]]) != 0
    && (v4 = v3, (v5 = (void *)[v3 objectForKeyedSubscript:*MEMORY[0x1E4F535B8]]) != 0)
    && (uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v5, "unsignedIntValue")),
        (uint64_t v7 = [NSString stringWithFormat:@"RenderingV%@", v6]) != 0)
    && (uint64_t v8 = v7, (v9 = [NSString stringWithFormat:@"RenderingV%@_NMP", v6]) != 0))
  {
    uint64_t v10 = v9;
    v11 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", v8), "objectForKeyedSubscript:", @"fgNRings");
    uint64_t v12 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", v10), "objectForKeyedSubscript:", @"fgNRings");
    if (v11 && [v11 unsignedIntValue]) {
      return 1;
    }
    if (v12) {
      return [v12 unsignedIntValue] != 0;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
  }
  return 0;
}

- (uint64_t)bundleOptionsDictionary
{
  v3[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = *(void *)(result + 8);
    if (v1)
    {
      uint64_t v2 = *MEMORY[0x1E4F535B0];
      v3[0] = v1;
      return [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return 0;
    }
  }
  return result;
}

- (int)prepareForRenderingWithParameters:(id)a3 inputVideoFormat:(id)a4 inputMediaPropertiesByAttachedMediaKey:(id)a5
{
  if (!self->_blurMapPixelBufferPool)
  {
    int v7 = objc_msgSend(a4, "width", a3);
    if (v7 >= 0) {
      int v8 = v7;
    }
    else {
      int v8 = v7 + 1;
    }
    int v9 = [a4 height];
    if (v9 >= 0) {
      int v10 = v9;
    }
    else {
      int v10 = v9 + 1;
    }
    -[BWStillImageMetalBlurMapRenderer _allocateBlurMapPixelBufferPoolForBuffersOfWidth:height:enableForegroundBlur:]((uint64_t)self, (uint64_t)v8 >> 1, (uint64_t)v10 >> 1, [(BWStillImageMetalBlurMapRenderer *)self shouldEnableForegroundBlur]);
  }
  return 0;
}

- (uint64_t)_allocateBlurMapPixelBufferPoolForBuffersOfWidth:(uint64_t)a3 height:(int)a4 enableForegroundBlur:
{
  v22[4] = *MEMORY[0x1E4F143B8];
  if (a1 && !*(void *)(a1 + 24))
  {
    if (a4) {
      uint64_t v6 = 843264056;
    }
    else {
      uint64_t v6 = 1278226488;
    }
    v21[0] = *MEMORY[0x1E4F24E10];
    v22[0] = [NSNumber numberWithUnsignedLong:a2];
    v21[1] = *MEMORY[0x1E4F24D08];
    v22[1] = [NSNumber numberWithUnsignedLong:a3];
    v21[2] = *MEMORY[0x1E4F24D70];
    uint64_t v7 = [NSNumber numberWithUnsignedInt:v6];
    v21[3] = *MEMORY[0x1E4F24D20];
    v22[2] = v7;
    v22[3] = MEMORY[0x1E4F1CC08];
    int v8 = -[BWVideoFormatRequirements initWithPixelBufferAttributes:]([BWVideoFormatRequirements alloc], "initWithPixelBufferAttributes:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:4]);
    v20 = v8;
    id v9 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1]);

    uint64_t v18 = *MEMORY[0x1E4F24990];
    uint64_t v16 = *MEMORY[0x1E4F24BC8];
    uint64_t v17 = *MEMORY[0x1E4F24BE8];
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    v11 = [BWPixelBufferPool alloc];
    uint64_t v12 = +[BWMemoryPool sharedMemoryPool];
    LOBYTE(v15) = *(unsigned char *)(a1 + 32);
    uint64_t v13 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:additionalPixelBufferAttributes:providesBackPressure:reportSlowBackPressureAllocations:](v11, "initWithVideoFormat:capacity:name:memoryPool:additionalPixelBufferAttributes:providesBackPressure:reportSlowBackPressureAllocations:", v9, 2, @"Still Image Blur Map Pool", v12, v10, v15);
    *(void *)(a1 + 24) = v13;
    if (!v13)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
  return 0;
}

- (void)renderUsingParameters:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 originalPixelBuffer:(__CVBuffer *)a6 processedPixelBuffer:(__CVBuffer *)a7 completionHandler:(id)a8
{
  AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a5, @"Depth");
  if (!AttachedMedia || (CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia)) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_6;
  }
  CVImageBufferRef v13 = ImageBuffer;
  v14 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a5, 0x1EFA74420);
  if (v14) {
    CVImageBufferRef v15 = CMSampleBufferGetImageBuffer(v14);
  }
  else {
    CVImageBufferRef v15 = 0;
  }
  uint64_t v17 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a5, 0x1EFA74440);
  if (v17) {
    CVImageBufferRef v18 = CMSampleBufferGetImageBuffer(v17);
  }
  else {
    CVImageBufferRef v18 = 0;
  }
  uint64_t v19 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a5, @"PersonSemanticsHair");
  if (v19) {
    CVImageBufferRef v20 = CMSampleBufferGetImageBuffer(v19);
  }
  else {
    CVImageBufferRef v20 = 0;
  }
  v21 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a5, @"PersonSemanticsGlasses");
  if (v21) {
    CVImageBufferRef v22 = CMSampleBufferGetImageBuffer(v21);
  }
  else {
    CVImageBufferRef v22 = 0;
  }
  if (!self->_sdofBlurMapRenderer || !self->_blurMapPixelBufferPool)
  {
LABEL_6:
    uint64_t v16 = 0;
    if (!a8) {
      goto LABEL_26;
    }
LABEL_25:
    (*((void (**)(id, void, void))a8 + 2))(a8, 0, 0);
    goto LABEL_26;
  }
  [(FigSDOFBlurMapRendering *)self->_sdofBlurMapRenderer setFaceLandmarksArray:BWInferenceGetAttachedInference(a5, 801, 0x1EFA6A0A0)];
  uint64_t v16 = [(BWPixelBufferPool *)self->_blurMapPixelBufferPool newPixelBuffer];
  if (v18) {
    CVImageBufferRef v23 = v18;
  }
  else {
    CVImageBufferRef v23 = v13;
  }
  if (![(FigSDOFBlurMapRendering *)self->_sdofBlurMapRenderer computeBlurMapWithImage:a5 shiftMap:v23 personSegmentationMask:v15 hairSemanticSegmentationMask:v20 glassesSemanticSegmentationMask:v22 resultFaceAdjustedBlurMap:v16])
  {
    CMSetAttachment(a5, @"PortraitStillImageFaceAdjustedBlurMap", v16, 1u);
    if (!a8) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  if (a8) {
    goto LABEL_25;
  }
LABEL_26:
  if (v16)
  {
    CFRelease(v16);
  }
}

- (BOOL)supportsAnimation
{
  return 0;
}

- (BOOL)adjustsMetadata
{
  return 0;
}

@end