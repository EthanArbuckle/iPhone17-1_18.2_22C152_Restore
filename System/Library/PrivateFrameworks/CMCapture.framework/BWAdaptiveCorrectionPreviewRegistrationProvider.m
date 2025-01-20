@interface BWAdaptiveCorrectionPreviewRegistrationProvider
+ (void)initialize;
- ($7ED615D2D7860C891326C80484EFDF14)registerWiderCamera:(SEL)a3 narrowerCamera:(opaqueCMSampleBuffer *)a4 widerToNarrowerCameraScale:(opaqueCMSampleBuffer *)a5 isMacroScene:(double)a6 macroTransitionType:(BOOL)a7;
- (BWAdaptiveCorrectionPreviewRegistrationProvider)initWithCameraInfoByPortType:(id)a3 excludeStaticComponentFromAlignmentShifts:(BOOL)a4;
- (CGPoint)computeApproximateCorrectionForWiderCamera:(opaqueCMSampleBuffer *)a3 narrowerCameraPortType:(id)a4 narrowerPixelBufferDimensions:(id)a5 widerToNarrowerCameraScale:(double)a6;
- (CGPoint)computeCameraShiftForWiderCamera:(opaqueCMSampleBuffer *)a3 narrowerCamera:(opaqueCMSampleBuffer *)a4 widerToNarrowerCameraScale:(double)a5;
- (void)allocateResourcesWithVideoFormat:(id)a3 metalContext:(id)a4;
- (void)cleanupResources;
- (void)dealloc;
@end

@implementation BWAdaptiveCorrectionPreviewRegistrationProvider

- (BWAdaptiveCorrectionPreviewRegistrationProvider)initWithCameraInfoByPortType:(id)a3 excludeStaticComponentFromAlignmentShifts:(BOOL)a4
{
  BOOL v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)BWAdaptiveCorrectionPreviewRegistrationProvider;
  v6 = [(BWAdaptiveCorrectionPreviewRegistrationProvider *)&v9 init];
  if (v6)
  {
    v7 = [[BWAdaptiveCorrectionPreviewRegistration alloc] initWithCameraInfoByPortType:a3 excludeStaticComponentFromAlignmentShifts:v4];
    v6->_registration = v7;
    if (!v7)
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
  }
  return v6;
}

- (CGPoint)computeApproximateCorrectionForWiderCamera:(opaqueCMSampleBuffer *)a3 narrowerCameraPortType:(id)a4 narrowerPixelBufferDimensions:(id)a5 widerToNarrowerCameraScale:(double)a6
{
  memset(__src, 0, sizeof(__src));
  double v7 = 1.0 / a6;
  if ([(BWAdaptiveCorrectionPreviewRegistration *)self->_registration computeApproximateCorrectionForWiderCamera:a3 narrowerCameraPortType:a4 narrowerPixelBufferDimensions:a5 narrowerToWiderCameraScale:__src narrowerToWiderTransformsOut:1.0 / a6])
  {
    double v8 = *MEMORY[0x1E4F1DAD8];
    double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    memcpy(__dst, __src, sizeof(__dst));
    +[BWAdaptiveCorrectionPreviewRegistration flattenNarrowerToWiderTransforms:narrowerDimensions:narrowerFinalCropRect:atNarrowerToWiderCameraScale:useYAnchorAtHeightCenter:](BWAdaptiveCorrectionPreviewRegistration, "flattenNarrowerToWiderTransforms:narrowerDimensions:narrowerFinalCropRect:atNarrowerToWiderCameraScale:useYAnchorAtHeightCenter:", __dst, a5, 1, 0.0, 0.0, 1.0, 1.0, v7);
    double v8 = -v13;
    double v9 = -v14;
  }
  double v10 = v8;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGPoint)computeCameraShiftForWiderCamera:(opaqueCMSampleBuffer *)a3 narrowerCamera:(opaqueCMSampleBuffer *)a4 widerToNarrowerCameraScale:(double)a5
{
  memset(__src, 0, sizeof(__src));
  if ([(BWAdaptiveCorrectionPreviewRegistration *)self->_registration computeAlignmentFromWiderSampleBuffer:a3 narrowerSampleBuffer:a4 narrowerToWiderTransformsOut:__src])
  {
    double v7 = *MEMORY[0x1E4F1DAD8];
    double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(a4);
    unsigned int Width = CVPixelBufferGetWidth(ImageBuffer);
    LODWORD(ImageBuffer) = CVPixelBufferGetHeight(ImageBuffer);
    double v11 = (void *)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    rect.origin.y = 0.0;
    rect.origin.x = 0.0;
    __asm { FMOV            V0.2D, #1.0 }
    rect.size = _Q0;
    CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[v11 objectForKeyedSubscript:*MEMORY[0x1E4F53260]], &rect);
    memcpy(v17, __src, sizeof(v17));
    +[BWAdaptiveCorrectionPreviewRegistration flattenNarrowerToWiderTransforms:narrowerDimensions:narrowerFinalCropRect:atNarrowerToWiderCameraScale:useYAnchorAtHeightCenter:](BWAdaptiveCorrectionPreviewRegistration, "flattenNarrowerToWiderTransforms:narrowerDimensions:narrowerFinalCropRect:atNarrowerToWiderCameraScale:useYAnchorAtHeightCenter:", v17, Width | ((unint64_t)ImageBuffer << 32), 1, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, 1.0 / a5);
    double v7 = -v18;
    double v8 = -v19;
  }
  result.y = v8;
  result.x = v7;
  return result;
}

+ (void)initialize
{
}

- (void)dealloc
{
  [(BWAdaptiveCorrectionPreviewRegistrationProvider *)self cleanupResources];

  v3.receiver = self;
  v3.super_class = (Class)BWAdaptiveCorrectionPreviewRegistrationProvider;
  [(BWAdaptiveCorrectionPreviewRegistrationProvider *)&v3 dealloc];
}

- (void)allocateResourcesWithVideoFormat:(id)a3 metalContext:(id)a4
{
}

- (void)cleanupResources
{
}

- ($7ED615D2D7860C891326C80484EFDF14)registerWiderCamera:(SEL)a3 narrowerCamera:(opaqueCMSampleBuffer *)a4 widerToNarrowerCameraScale:(opaqueCMSampleBuffer *)a5 isMacroScene:(double)a6 macroTransitionType:(BOOL)a7
{
  retstr->var0[2].var1.y = 0.0;
  retstr->var0[1].var1 = 0u;
  *(_OWORD *)&retstr->var0[2].var0 = 0u;
  double v11 = (double *)MEMORY[0x1E4F1DB28];
  *(_OWORD *)&retstr->var0[0].var0 = 0u;
  *(_OWORD *)&retstr->var0[0].var1.y = 0u;
  double v12 = *v11;
  double v13 = v11[1];
  double v14 = v11[2];
  double v15 = v11[3];
  memset(__src, 0, sizeof(__src));
  CGPoint result = ($7ED615D2D7860C891326C80484EFDF14 *)-[BWAdaptiveCorrectionPreviewRegistration registerWiderSampleBufferUsingADC:narrowerSampleBuffer:narrowerRect:macroTransitionType:narrowerToWiderTransformsOut:](self->_registration, "registerWiderSampleBufferUsingADC:narrowerSampleBuffer:narrowerRect:macroTransitionType:narrowerToWiderTransformsOut:", a4, a5, *(void *)&a8, __src, v12, v13, v14, v15);
  if (!result)
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(a5);
    unsigned int Width = CVPixelBufferGetWidth(ImageBuffer);
    LODWORD(ImageBuffer) = CVPixelBufferGetHeight(ImageBuffer);
    double v19 = (void *)CMGetAttachment(a5, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    rect.origin.y = 0.0;
    rect.origin.x = 0.0;
    __asm { FMOV            V0.2D, #1.0 }
    rect.size = _Q0;
    CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[v19 objectForKeyedSubscript:*MEMORY[0x1E4F53260]], &rect);
    memcpy(v27, __src, 0x120uLL);
    CGPoint result = ($7ED615D2D7860C891326C80484EFDF14 *)+[BWAdaptiveCorrectionPreviewRegistration flattenNarrowerToWiderTransforms:narrowerDimensions:narrowerFinalCropRect:atNarrowerToWiderCameraScale:useYAnchorAtHeightCenter:](BWAdaptiveCorrectionPreviewRegistration, "flattenNarrowerToWiderTransforms:narrowerDimensions:narrowerFinalCropRect:atNarrowerToWiderCameraScale:useYAnchorAtHeightCenter:", v27, Width | ((unint64_t)ImageBuffer << 32), 0, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, 1.0 / a6);
    p_var1 = &retstr->var0[0].var1;
    for (uint64_t i = 64; i != 352; i += 96)
    {
      *(float64x2_t *)p_var1 = vnegq_f64(*(float64x2_t *)&v27[i + 288]);
      LOBYTE(p_var1[-1].y) = 1;
      p_var1 = (CGPoint *)((char *)p_var1 + 24);
    }
  }
  return result;
}

@end