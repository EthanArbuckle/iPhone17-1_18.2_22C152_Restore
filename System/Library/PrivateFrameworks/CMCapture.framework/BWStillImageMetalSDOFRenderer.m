@interface BWStillImageMetalSDOFRenderer
+ (void)initialize;
- (BOOL)adjustsMetadata;
- (BOOL)shouldEnableForegroundBlur;
- (BOOL)supportsAnimation;
- (BWStillImageMetalSDOFRenderer)initWithSDOFRenderingTuningParameters:(id)a3 imageDimensions:(id)a4 depthDataMapDimensions:(id)a5 portraitRenderQuality:(int)a6 metalCommandQueue:(id)a7;
- (NSString)displayName;
- (int)prepareForRenderingWithParameters:(id)a3 inputVideoFormat:(id)a4 inputMediaPropertiesByAttachedMediaKey:(id)a5;
- (signed)type;
- (uint64_t)_loadAndConfigureSDOFRenderer;
- (uint64_t)bundleOptionsDictionary;
- (void)dealloc;
- (void)renderUsingParameters:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 originalPixelBuffer:(__CVBuffer *)a6 processedPixelBuffer:(__CVBuffer *)a7 completionHandler:(id)a8;
@end

@implementation BWStillImageMetalSDOFRenderer

+ (void)initialize
{
}

- (BWStillImageMetalSDOFRenderer)initWithSDOFRenderingTuningParameters:(id)a3 imageDimensions:(id)a4 depthDataMapDimensions:(id)a5 portraitRenderQuality:(int)a6 metalCommandQueue:(id)a7
{
  v14.receiver = self;
  v14.super_class = (Class)BWStillImageMetalSDOFRenderer;
  v12 = [(BWStillImageMetalSDOFRenderer *)&v14 init];
  if (v12)
  {
    *((void *)v12 + 1) = a3;
    *($2825F4736939C4A6D3AD43837233062D *)(v12 + 28) = a4;
    *($2825F4736939C4A6D3AD43837233062D *)(v12 + 36) = a5;
    *((_DWORD *)v12 + 6) = a6;
    *((void *)v12 + 6) = a7;
    -[BWStillImageMetalSDOFRenderer _loadAndConfigureSDOFRenderer]((uint64_t)v12);
  }
  return (BWStillImageMetalSDOFRenderer *)v12;
}

- (uint64_t)_loadAndConfigureSDOFRenderer
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v12 = 0;
    v2 = (void *)-[BWStillImageMetalSDOFRenderer bundleOptionsDictionary](result);
    if (!v2) {
      goto LABEL_19;
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
LABEL_19:
      fig_log_get_emitter();
LABEL_23:
      FigDebugAssert3();
      return FigSignalErrorAt();
    }
    v10 = v9;
    if ([v9 loadAndReturnError:&v12])
    {
      v11 = objc_msgSend(objc_alloc((Class)objc_msgSend(v10, "classNamed:", @"FigSDOFEffectRendering")), "initWithCommandQueue:", *(void *)(v1 + 48));
      *(void *)(v1 + 16) = v11;
      if (v11 && ![v11 setOptions:v3])
      {
        if (objc_opt_respondsToSelector())
        {
          if (objc_msgSend(*(id *)(v1 + 16), "allocateResourcesForInputImageWidth:inputImageHeight:shiftMapWidth:shiftMapHeight:enableForegroundBlur:", *(int *)(v1 + 28), *(int *)(v1 + 32), *(int *)(v1 + 36), *(int *)(v1 + 40), objc_msgSend((id)v1, "shouldEnableForegroundBlur")))return 0; {
        }
          }
        else if ([*(id *)(v1 + 16) allocateResourcesForInputImageWidth:*(int *)(v1 + 28) inputImageHeight:*(int *)(v1 + 32) shiftMapWidth:*(int *)(v1 + 36) shiftMapHeight:*(int *)(v1 + 40)])
        {
          return 0;
        }
      }
      fig_log_get_emitter();
      goto LABEL_23;
    }
    return 4294954510;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageMetalSDOFRenderer;
  [(BWStillImageMetalSDOFRenderer *)&v3 dealloc];
}

- (signed)type
{
  return 2;
}

- (NSString)displayName
{
  return (NSString *)@"SDOF Metal Renderer";
}

- (int)prepareForRenderingWithParameters:(id)a3 inputVideoFormat:(id)a4 inputMediaPropertiesByAttachedMediaKey:(id)a5
{
  return 0;
}

- (void)renderUsingParameters:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 originalPixelBuffer:(__CVBuffer *)a6 processedPixelBuffer:(__CVBuffer *)a7 completionHandler:(id)a8
{
  CFTypeRef v13 = CMGetAttachment(a5, @"PortraitStillImageFaceAdjustedBlurMap", 0);
  if (!v13
    || ((CFTypeRef v14 = v13, (AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a5, 0x1EFA74420)) == 0)
      ? (CVImageBufferRef ImageBuffer = 0)
      : (CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia)),
        (v17 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a5, 0x1EFA4EB60)) == 0
      ? (CVImageBufferRef v18 = 0)
      : (CVImageBufferRef v18 = CMSampleBufferGetImageBuffer(v17)),
        [(FigSDOFEffectRendering *)self->_sdofEffectRenderer runSamplingWithImage:a5 inputPixelBuffer:a4 inputFaceAdjustedBlurMap:v14 inputAlphaMask:ImageBuffer inputGainMap:v18 resultImage:a7]))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v19 = 0;
    if (!a8) {
      return;
    }
  }
  else
  {
    uint64_t v19 = 2;
    if (!a8) {
      return;
    }
  }
  v20 = (void (*)(id, uint64_t, void))*((void *)a8 + 2);
  v20(a8, v19, 0);
}

- (uint64_t)bundleOptionsDictionary
{
  v4[2] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    if (*(void *)(result + 8))
    {
      uint64_t v1 = *MEMORY[0x1E4F535B0];
      v4[0] = *(void *)(result + 8);
      uint64_t v2 = *MEMORY[0x1E4F55BD0];
      v3[0] = v1;
      v3[1] = v2;
      v4[1] = [NSNumber numberWithInt:*(_DWORD *)(result + 24) != 0];
      return [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
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

- (BOOL)shouldEnableForegroundBlur
{
  uint64_t v2 = (void *)-[BWStillImageMetalSDOFRenderer bundleOptionsDictionary]((uint64_t)self);
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

- (BOOL)supportsAnimation
{
  return 0;
}

- (BOOL)adjustsMetadata
{
  return 0;
}

@end