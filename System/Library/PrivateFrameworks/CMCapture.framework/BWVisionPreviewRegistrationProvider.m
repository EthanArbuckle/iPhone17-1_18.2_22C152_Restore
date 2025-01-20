@interface BWVisionPreviewRegistrationProvider
+ (void)initialize;
- ($7ED615D2D7860C891326C80484EFDF14)registerWiderCamera:(SEL)a3 narrowerCamera:(opaqueCMSampleBuffer *)a4 widerToNarrowerCameraScale:(opaqueCMSampleBuffer *)a5 isMacroScene:(double)a6 macroTransitionType:(BOOL)a7;
- (BWVisionPreviewRegistrationProvider)initWithCameraInfoByPortType:(id)a3 sensorBinningFactor:(id)a4;
- (CGPoint)computeCameraShiftForWiderCamera:(opaqueCMSampleBuffer *)a3 narrowerCamera:(opaqueCMSampleBuffer *)a4 widerToNarrowerCameraScale:(double)a5;
- (double)_shiftCorrectionForLeftStrip:(CMSampleBufferRef)sbuf byRegisteringWide:(opaqueCMSampleBuffer *)a4 tele:(int)a5 centerBias:(int)a6 widerToNarrowerCameraScale:(int *)a7 isMacroScene:(double)a8 err:;
- (void)allocateResourcesWithVideoFormat:(id)a3 metalContext:(id)a4;
- (void)cleanupResources;
- (void)dealloc;
@end

@implementation BWVisionPreviewRegistrationProvider

+ (void)initialize
{
}

- (BWVisionPreviewRegistrationProvider)initWithCameraInfoByPortType:(id)a3 sensorBinningFactor:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)BWVisionPreviewRegistrationProvider;
  v6 = [(BWVisionPreviewRegistrationProvider *)&v12 init];
  if (v6)
  {
    if (!a3
      || (v7 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F52DE8]],
          v8 = (void *)MEMORY[0x1E4F52D20],
          v7)
      && (!CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)[v7 objectForKeyedSubscript:*MEMORY[0x1E4F52D20]], &v6->_superWideOpticalCenterOffset)|| FigMotionSphereShiftStateInitialize((uint64_t)&v6->_superWideToWideShiftState, (const __CFDictionary *)a3, 7))|| (v9 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F52DD8])) != 0&& !CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v9, "objectForKeyedSubscript:", *v8), &v6->_wideOpticalCenterOffset)|| (v10 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F52DF0])) != 0&& (!CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v10, "objectForKeyedSubscript:", *v8), &v6->_teleOpticalCenterOffset)|| FigMotionSphereShiftStateInitialize((uint64_t)&v6->_wideToTeleShiftState, (const __CFDictionary *)a3, 7)))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
    else
    {
      v6->_sensorBinningFactor = ($470D365275581EF16070F5A11344F73E)a4;
    }
  }
  return v6;
}

- (void)dealloc
{
  [(BWVisionPreviewRegistrationProvider *)self cleanupResources];
  v3.receiver = self;
  v3.super_class = (Class)BWVisionPreviewRegistrationProvider;
  [(BWVisionPreviewRegistrationProvider *)&v3 dealloc];
}

- (void)allocateResourcesWithVideoFormat:(id)a3 metalContext:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (!self->_registrationPool)
  {
    v6 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v6, "setWidth:", (int)FigCaptureRoundFloatToMultipleOf(4, (float)(unint64_t)[a3 width] * 0.3));
    -[BWVideoFormatRequirements setHeight:](v6, "setHeight:", (int)FigCaptureRoundFloatToMultipleOf(4, (float)(unint64_t)[a3 height]));
    v10[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", FigCaptureUncompressedPixelFormatForPixelFormat(objc_msgSend(a3, "pixelFormat")));
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v6, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1]);
    v9 = v6;
    self->_registrationPool = -[BWPixelBufferPool initWithVideoFormat:capacity:name:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:", +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1]), 2, @"BWVisionPreviewRegistrationProvider");
  }
  registrationRotationSession = self->_registrationRotationSession;
  p_registrationRotationSession = &self->_registrationRotationSession;
  if (!registrationRotationSession)
  {
    VTPixelRotationSessionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], p_registrationRotationSession);
    VTSessionSetProperty(*p_registrationRotationSession, (CFStringRef)*MEMORY[0x1E4F45088], MEMORY[0x1E4F1CC38]);
  }
}

- (void)cleanupResources
{
  self->_registrationPool = 0;
  registrationRotationSession = self->_registrationRotationSession;
  if (registrationRotationSession)
  {
    VTPixelRotationSessionInvalidate(registrationRotationSession);
    v4 = self->_registrationRotationSession;
    if (v4)
    {
      CFRelease(v4);
      self->_registrationRotationSession = 0;
    }
  }
}

- ($7ED615D2D7860C891326C80484EFDF14)registerWiderCamera:(SEL)a3 narrowerCamera:(opaqueCMSampleBuffer *)a4 widerToNarrowerCameraScale:(opaqueCMSampleBuffer *)a5 isMacroScene:(double)a6 macroTransitionType:(BOOL)a7
{
  BOOL v8 = a7;
  int v44 = 0;
  v14 = (void *)MEMORY[0x1A6272C70](self, a3, a4, a5, a7, *(void *)&a8);
  double v15 = -[BWVisionPreviewRegistrationProvider _shiftCorrectionForLeftStrip:byRegisteringWide:tele:centerBias:widerToNarrowerCameraScale:isMacroScene:err:]((uint64_t)self, 1, a4, a5, 0, v8, &v44, a6);
  CGFloat v17 = v16;
  BOOL v18 = v44 == 0;
  v19 = (void *)MEMORY[0x1A6272C70]();
  double v20 = -[BWVisionPreviewRegistrationProvider _shiftCorrectionForLeftStrip:byRegisteringWide:tele:centerBias:widerToNarrowerCameraScale:isMacroScene:err:]((uint64_t)self, 0, a4, a5, 0, v8, &v44, a6);
  CGFloat v22 = v21;
  BOOL v23 = v44 == 0;
  v24 = (void *)MEMORY[0x1A6272C70]();
  double v25 = -[BWVisionPreviewRegistrationProvider _shiftCorrectionForLeftStrip:byRegisteringWide:tele:centerBias:widerToNarrowerCameraScale:isMacroScene:err:]((uint64_t)self, 1, a4, a5, 1, v8, &v44, a6);
  double v27 = v26;
  int v28 = v44;
  v29 = (void *)MEMORY[0x1A6272C70]();
  double v30 = -[BWVisionPreviewRegistrationProvider _shiftCorrectionForLeftStrip:byRegisteringWide:tele:centerBias:widerToNarrowerCameraScale:isMacroScene:err:]((uint64_t)self, 0, a4, a5, 1, v8, &v44, a6);
  double v32 = v31;
  int v33 = v44;
  *(_OWORD *)&retstr->var0[0].var0 = 0u;
  *(_OWORD *)&retstr->var0[0].var1.y = 0u;
  retstr->var0[2].var1.y = 0.0;
  retstr->var0[1].var1 = 0u;
  *(_OWORD *)&retstr->var0[2].var0 = 0u;
  retstr->var0[0].var0 = v18;
  retstr->var0[0].var1.x = v15;
  retstr->var0[0].var1.y = v17;
  retstr->var0[1].var0 = v23;
  retstr->var0[1].var1.x = v20;
  retstr->var0[1].var1.y = v22;
  if (v28 && v33)
  {
    BOOL v35 = 0;
    retstr->var0[2].var1 = (CGPoint)*MEMORY[0x1E4F1DAD8];
  }
  else
  {
    double v36 = -0.0;
    if (v28) {
      double v37 = -0.0;
    }
    else {
      double v37 = v25;
    }
    double v38 = v37 + *MEMORY[0x1E4F1DAD8];
    if (v28) {
      double v39 = -0.0;
    }
    else {
      double v39 = v27;
    }
    double v40 = v39 + *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    if (v33) {
      double v41 = -0.0;
    }
    else {
      double v41 = v30;
    }
    double v42 = v41 + v38;
    if (!v33) {
      double v36 = v32;
    }
    double v43 = v36 + v40;
    if (!(v28 | v33))
    {
      double v42 = v42 * 0.5;
      double v43 = v43 * 0.5;
    }
    retstr->var0[2].var1.x = v42;
    retstr->var0[2].var1.y = v43;
    BOOL v35 = 1;
  }
  retstr->var0[2].var0 = v35;
  return result;
}

- (double)_shiftCorrectionForLeftStrip:(CMSampleBufferRef)sbuf byRegisteringWide:(opaqueCMSampleBuffer *)a4 tele:(int)a5 centerBias:(int)a6 widerToNarrowerCameraScale:(int *)a7 isMacroScene:(double)a8 err:
{
  v78[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0.0;
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
  double v16 = CMSampleBufferGetImageBuffer(a4);
  double v71 = *MEMORY[0x1E4F1DAD8];
  double v72 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  CFStringRef v17 = (const __CFString *)*MEMORY[0x1E4F53070];
  int v18 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(sbuf, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]), "isEqualToString:", *MEMORY[0x1E4F52DE8]);
  if (!ImageBuffer || !v16)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v66 = -12780;
    if (!a7) {
      return v71;
    }
    goto LABEL_37;
  }
  int v19 = v18;
  v70 = a7;
  double v20 = (__CVBuffer *)[*(id *)(a1 + 8) newPixelBuffer];
  uint64_t v21 = [*(id *)(a1 + 8) newPixelBuffer];
  CGFloat v22 = (const void *)v21;
  if (v20 && v21)
  {
    double v68 = a8;
    psn_pixelBufferRect(v20);
    double v24 = v23;
    double v25 = (void *)CMGetAttachment(a4, v17, 0);
    rect.a = psn_pixelBufferRect(v16);
    rect.CGFloat b = v26;
    rect.double c = v27;
    rect.CGFloat d = v28;
    CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[v25 objectForKeyedSubscript:*MEMORY[0x1E4F54370]], (CGRect *)&rect);
    v76.a = 0.0;
    v76.CGFloat b = 0.0;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v76.double c = _Q0;
    CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[v25 objectForKeyedSubscript:*MEMORY[0x1E4F53260]], (CGRect *)&v76);
    if (a5)
    {
      v79.origin.x = v76.a;
      v79.origin.double y = v76.b;
      v79.size.double width = v76.c;
      v79.size.double height = v76.d;
      CGRect v80 = CGRectInset(v79, 0.25, 0.0);
      v76.a = v80.origin.x;
      v76.CGFloat b = v80.origin.y;
      v76.double c = v80.size.width;
      v76.CGFloat d = v80.size.height;
    }
    CVPixelBufferGetWidth(v16);
    CVPixelBufferGetHeight(v16);
    FigCaptureMetadataUtilitiesDenormalizeCropRect(v76.a, v76.b, v76.c, v76.d);
    CGFloat b = rect.b;
    CGFloat d = rect.d;
    if (a2)
    {
      float MinX = CGRectGetMinX(*(CGRect *)&v34);
      double v41 = (double)(int)FigCaptureRoundFloatToMultipleOf(2, MinX);
      if (rect.c >= v24) {
        double c = v24;
      }
      else {
        double c = rect.c;
      }
    }
    else
    {
      if (rect.c >= v24) {
        double c = v24;
      }
      else {
        double c = rect.c;
      }
      float MaxX = CGRectGetMaxX(*(CGRect *)&v34);
      double v41 = (double)(int)FigCaptureRoundFloatToMultipleOf(2, MaxX) - c;
    }
    if (VTPixelRotationSessionRotateSubImage())
    {
      fig_log_get_emitter();
    }
    else
    {
      CGFloat v44 = (double)CVPixelBufferGetWidth(v16) * 0.5;
      CGFloat v45 = (double)CVPixelBufferGetHeight(v16) * 0.5;
      memset(&rect, 0, sizeof(rect));
      CGAffineTransformMakeTranslation(&rect, -v44, -v45);
      CGAffineTransformMakeScale(&t2, 1.0 / v68, 1.0 / v68);
      CGAffineTransform t1 = rect;
      CGAffineTransformConcat(&v76, &t1, &t2);
      CGAffineTransform rect = v76;
      CGAffineTransformMakeTranslation(&v73, v44, v45);
      CGAffineTransform t1 = rect;
      CGAffineTransformConcat(&v76, &t1, &v73);
      CGAffineTransform rect = v76;
      v81.origin.x = v41;
      v81.origin.double y = b;
      v81.size.double width = c;
      v81.size.double height = d;
      CGRect v82 = CGRectApplyAffineTransform(v81, &v76);
      double y = v82.origin.y;
      double width = v82.size.width;
      double height = v82.size.height;
      *(float *)&v82.origin.x = v82.origin.x;
      FigCaptureRoundFloatToMultipleOf(1, *(float *)&v82.origin.x);
      float v49 = y;
      FigCaptureRoundFloatToMultipleOf(1, v49);
      float v50 = width;
      FigCaptureRoundFloatToMultipleOf(2, v50);
      float v51 = height;
      FigCaptureRoundFloatToMultipleOf(2, v51);
      if (!VTPixelRotationSessionRotateSubImage())
      {
        id v52 = objc_alloc((Class)getVNImageRequestHandlerClass());
        uint64_t v53 = MEMORY[0x1E4F1CC08];
        v54 = (void *)[v52 initWithCVPixelBuffer:v22 options:MEMORY[0x1E4F1CC08]];
        v55 = (void *)[objc_alloc((Class)getVNTranslationalImageRegistrationRequestClass()) initWithTargetedCVPixelBuffer:v20 options:v53];
        t1.a = 0.0;
        v78[0] = v55;
        double tx = v71;
        tdouble y = v72;
        if (objc_msgSend(v54, "performRequests:error:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v78, 1), &t1))
        {
          v58 = objc_msgSend((id)objc_msgSend(v55, "results"), "firstObject");
          if (v58)
          {
            v59 = v58;
            [v58 alignmentTransform];
            double tx = rect.tx;
            [v59 alignmentTransform];
            tdouble y = v76.ty;
          }
          else
          {
            fig_log_get_emitter();
            FigDebugAssert3();
            double tx = v71;
            tdouble y = v72;
          }
        }

        double v60 = tx / v68;
        double v61 = 0.01;
        double v62 = 0.05;
        if (v19) {
          double v61 = 0.05;
        }
        else {
          double v62 = 0.042;
        }
        if (a6) {
          double v63 = v61 * 1.5;
        }
        else {
          double v63 = v61;
        }
        if (a6) {
          double v64 = v62 * 1.5;
        }
        else {
          double v64 = v62;
        }
        double v65 = (double)CVPixelBufferGetWidth(ImageBuffer);
        int v66 = -12780;
        if (fabs(v60) <= round(v64 * v65) && fabs(-ty / v68) <= round(v63 * v65))
        {
          int v66 = 0;
          double v71 = v60;
        }
        goto LABEL_33;
      }
      fig_log_get_emitter();
    }
    FigDebugAssert3();
    int v66 = -12780;
LABEL_33:
    CFRelease(v20);
    goto LABEL_34;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  int v66 = -12780;
  if (v20) {
    goto LABEL_33;
  }
LABEL_34:
  if (v22) {
    CFRelease(v22);
  }
  a7 = v70;
  if (v70) {
LABEL_37:
  }
    *a7 = v66;
  return v71;
}

- (CGPoint)computeCameraShiftForWiderCamera:(opaqueCMSampleBuffer *)a3 narrowerCamera:(opaqueCMSampleBuffer *)a4 widerToNarrowerCameraScale:(double)a5
{
  CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F53070];
  v9 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  CFDictionaryRef v10 = (const __CFDictionary *)CMGetAttachment(a4, v8, 0);
  v11 = (void *)[v9 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
  int v12 = [v11 isEqualToString:*MEMORY[0x1E4F52DE8]];
  CMSampleBufferGetPresentationTimeStamp(&time, a3);
  double Seconds = CMTimeGetSeconds(&time);
  CMSampleBufferGetPresentationTimeStamp(&v29, a4);
  double v14 = CMTimeGetSeconds(&v29);
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  size_t Width = CVPixelBufferGetWidth(ImageBuffer);
  size_t Height = CVPixelBufferGetHeight(ImageBuffer);
  double v31 = 0.0;
  double v32 = 0.0;
  uint64_t v18 = 720;
  if (v12) {
    uint64_t v18 = 80;
  }
  uint64_t v19 = 40;
  uint64_t v20 = 24;
  if (!v12)
  {
    uint64_t v20 = 40;
    uint64_t v19 = 56;
  }
  uint64_t v21 = (char *)self + v18;
  float64x2_t v22 = *(float64x2_t *)((char *)&self->super.isa + v20);
  float64x2_t v27 = *(float64x2_t *)((char *)&self->super.isa + v19);
  float64x2_t v28 = v22;
  float v23 = (float)Height;
  FigMotionSphereShiftStateUpdateWithMetadata((uint64_t)self + v18, (CFDictionaryRef)v9);
  LODWORD(v26) = self->_sensorBinningFactor.height;
  FigMotionComputeWideToNarrowShift((const __CFDictionary *)v9, v10, 0, &v28, &v27, (int)(float)Width, (int)v23, self->_sensorBinningFactor.width, Seconds, v14, 0.0, v26, 0, (uint64_t)v21, &v31, 0);
  double v24 = -v31;
  double v25 = -v32;
  result.double y = v25;
  result.x = v24;
  return result;
}

@end