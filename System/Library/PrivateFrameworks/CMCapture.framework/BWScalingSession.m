@interface BWScalingSession
- (BWScalingSession)init;
- (id)_newIntermediatePoolWithDimensions:(id)a3 pixelFormat:(unsigned int)a4;
- (int)scalePixelBuffer:(__CVBuffer *)a3 rect:(CGRect)a4 exifOrientation:(int)a5 intoPixelBuffer:(__CVBuffer *)a6 rect:(CGRect)a7;
- (int)scalePixelBuffer:(__CVBuffer *)a3 rect:(CGRect)a4 intoPixelBuffer:(__CVBuffer *)a5 rect:(CGRect)a6;
- (void)_ensurePixelTransferSession;
- (void)dealloc;
- (void)invalidate;
@end

@implementation BWScalingSession

- (BWScalingSession)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWScalingSession;
  v2 = [(BWScalingSession *)&v5 init];
  v3 = v2;
  if (v2)
  {
    VTSessionSetProperty(v2->_rotationSession, (CFStringRef)*MEMORY[0x1E4F45088], MEMORY[0x1E4F1CC38]);
    [(BWScalingSession *)v3 _ensurePixelTransferSession];
    if (!v3->_transferSession)
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
  }
  return v3;
}

- (void)_ensurePixelTransferSession
{
  p_transferSession = &self->_transferSession;
  if (!self->_transferSession)
  {
    VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], p_transferSession);
    v3 = (const void *)MEMORY[0x1E4F1CC38];
    VTSessionSetProperty(*p_transferSession, (CFStringRef)*MEMORY[0x1E4F45118], MEMORY[0x1E4F1CC38]);
    VTSessionSetProperty(*p_transferSession, (CFStringRef)*MEMORY[0x1E4F45120], v3);
    VTSessionSetProperty(*p_transferSession, (CFStringRef)*MEMORY[0x1E4F45188], MEMORY[0x1E4F1CC28]);
    VTPixelTransferSessionRef v4 = *p_transferSession;
    CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F45128];
    VTSessionSetProperty(v4, v5, v3);
  }
}

- (void)dealloc
{
  rotationSession = self->_rotationSession;
  if (rotationSession)
  {
    VTPixelRotationSessionInvalidate(rotationSession);
    VTPixelTransferSessionRef v4 = self->_rotationSession;
    if (v4) {
      CFRelease(v4);
    }
  }
  transferSession = self->_transferSession;
  if (transferSession)
  {
    VTPixelTransferSessionInvalidate(transferSession);
    v6 = self->_transferSession;
    if (v6) {
      CFRelease(v6);
    }
  }

  v7.receiver = self;
  v7.super_class = (Class)BWScalingSession;
  [(BWScalingSession *)&v7 dealloc];
}

- (int)scalePixelBuffer:(__CVBuffer *)a3 rect:(CGRect)a4 intoPixelBuffer:(__CVBuffer *)a5 rect:(CGRect)a6
{
  if (!a3 || !a5)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  double v11 = a4.size.height;
  double v12 = a4.size.width;
  double v13 = a4.origin.y;
  double v14 = a4.origin.x;
  if (CGRectIsNull(a4))
  {
    double v14 = psn_pixelBufferRect(a3);
    double v13 = v17;
    double v12 = v18;
    double v11 = v19;
  }
  v48.origin.double x = x;
  v48.origin.double y = y;
  v48.size.double width = width;
  v48.size.double height = height;
  if (CGRectIsNull(v48))
  {
    double x = psn_pixelBufferRect(a5);
    double y = v20;
    double width = v21;
    double height = v22;
  }
  double v23 = ss_conformRectForMSR420vfPixelBuffer(a3, 0, v14, v13, v12, v11);
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  double v30 = ss_conformRectForMSR420vfPixelBuffer(a5, 1, x, y, width, height);
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  transferSession = self->_transferSession;
  CFStringRef v38 = (const __CFString *)*MEMORY[0x1E4F45170];
  v49.origin.double x = v23;
  v49.origin.double y = v25;
  v49.size.double width = v27;
  v49.size.double height = v29;
  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v49);
  CFTypeRef v40 = CFAutorelease(DictionaryRepresentation);
  OSStatus v41 = VTSessionSetProperty(transferSession, v38, v40);
  if (v41) {
    goto LABEL_12;
  }
  v42 = self->_transferSession;
  CFStringRef v43 = (const __CFString *)*MEMORY[0x1E4F450F0];
  v50.origin.double x = v30;
  v50.origin.double y = v32;
  v50.size.double width = v34;
  v50.size.double height = v36;
  CFDictionaryRef v44 = CGRectCreateDictionaryRepresentation(v50);
  CFTypeRef v45 = CFAutorelease(v44);
  OSStatus v41 = VTSessionSetProperty(v42, v43, v45);
  if (v41)
  {
LABEL_12:
    OSStatus v46 = v41;
    fig_log_get_emitter();
LABEL_15:
    FigDebugAssert3();
    return v46;
  }
  OSStatus v46 = VTPixelTransferSessionTransferImage(self->_transferSession, a3, a5);
  if (v46)
  {
    fig_log_get_emitter();
    goto LABEL_15;
  }
  return v46;
}

- (int)scalePixelBuffer:(__CVBuffer *)a3 rect:(CGRect)a4 exifOrientation:(int)a5 intoPixelBuffer:(__CVBuffer *)a6 rect:(CGRect)a7
{
  if (!a3 || !a6 || (a5 - 9) <= 0xFFFFFFF7) {
    goto LABEL_47;
  }
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  double v13 = a4.size.height;
  double v14 = a4.size.width;
  CGFloat v15 = a4.origin.y;
  CGFloat v16 = a4.origin.x;
  if (CGRectIsNull(a4))
  {
    CGFloat v16 = psn_pixelBufferRect(a3);
    CGFloat v15 = v19;
    double v14 = v20;
    double v13 = v21;
  }
  v42.origin.CGFloat x = x;
  v42.origin.CGFloat y = y;
  v42.size.CGFloat width = width;
  v42.size.CGFloat height = height;
  double v40 = v16;
  double v41 = v15;
  if (CGRectIsNull(v42))
  {
    psn_pixelBufferRect(a6);
    CGFloat width = v22;
    CGFloat height = v23;
  }
  int v24 = FigCaptureRotationDegreesAndMirroringFromExifOrientation(a5, 0);
  int v25 = v24;
  if (v24 == 270 || (double v26 = width, v27 = height, v24 == 90))
  {
    double v26 = height;
    double v27 = width;
  }
  if (v26 / v14 < 0.251256281 || v26 / v14 > 3.98 || v27 / v13 > 3.98 || v27 / v13 < 0.251256281)
  {
    uint64_t v29 = (int)v26;
    uint64_t v30 = (int)v27;
    if (self->_intermediateBufferPool)
    {
      uint64_t v31 = v29 | (v30 << 32);
      BOOL v32 = FigCaptureVideoDimensionsAreEqual(*(void *)&self->_intermediateBufferPoolDimensions, v31);
      intermediateBufferPool = self->_intermediateBufferPool;
      if (v32)
      {
LABEL_21:
        if (intermediateBufferPool)
        {
          double v28 = [(BWPixelBufferPool *)intermediateBufferPool newPixelBuffer];
          OSStatus v34 = -[BWScalingSession scalePixelBuffer:rect:intoPixelBuffer:rect:](self, "scalePixelBuffer:rect:intoPixelBuffer:rect:", a3, v28, v40, v41, v14, v13, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), v26, v27);
          if (v34) {
            goto LABEL_48;
          }
          goto LABEL_23;
        }
LABEL_47:
        fig_log_get_emitter();
        FigDebugAssert3();
        return 0;
      }
    }
    else
    {
      intermediateBufferPool = 0;
      uint64_t v31 = v29 | (v30 << 32);
    }

    intermediateBufferPool = [(BWScalingSession *)self _newIntermediatePoolWithDimensions:v31 pixelFormat:CVPixelBufferGetPixelFormatType(a3)];
    self->_intermediateBufferPool = intermediateBufferPool;
    self->_intermediateBufferPoolDimensions.CGFloat width = v29;
    self->_intermediateBufferPoolDimensions.CGFloat height = v30;
    goto LABEL_21;
  }
  double v28 = 0;
LABEL_23:
  p_rotationSession = (VTSessionRef *)&self->_rotationSession;
  rotationSession = self->_rotationSession;
  if (rotationSession)
  {
    if (self->_rotationSessionDegrees == v25)
    {
LABEL_36:
      int v38 = VTPixelRotationSessionRotateSubImage();
      if (!v38) {
        goto LABEL_37;
      }
      fig_log_get_emitter();
      goto LABEL_49;
    }
    CFRelease(rotationSession);
    VTSessionRef *p_rotationSession = 0;
  }
  OSStatus v34 = VTPixelRotationSessionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &self->_rotationSession);
  if (!v34)
  {
    if (v25 == 270)
    {
      v37 = (CFTypeRef *)MEMORY[0x1E4F45358];
    }
    else if (v25 == 180)
    {
      v37 = (CFTypeRef *)MEMORY[0x1E4F45350];
    }
    else
    {
      v37 = (CFTypeRef *)(v25 == 90 ? MEMORY[0x1E4F45360] : MEMORY[0x1E4F45348]);
    }
    OSStatus v34 = VTSessionSetProperty(*p_rotationSession, (CFStringRef)*MEMORY[0x1E4F450C0], *v37);
    if (!v34)
    {
      self->_rotationSessionDegrees = v25;
      if (!self->_rotationSession)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        int v38 = 0;
        goto LABEL_37;
      }
      goto LABEL_36;
    }
  }
LABEL_48:
  int v38 = v34;
  fig_log_get_emitter();
LABEL_49:
  FigDebugAssert3();
LABEL_37:
  if (v28) {
    CFRelease(v28);
  }
  return v38;
}

- (id)_newIntermediatePoolWithDimensions:(id)a3 pixelFormat:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v9[1] = *MEMORY[0x1E4F143B8];
  v6 = objc_alloc_init(BWVideoFormatRequirements);
  v9[0] = [NSNumber numberWithUnsignedInt:v4];
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v6, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1]);
  [(BWVideoFormatRequirements *)v6 setWidth:a3.var0];
  [(BWVideoFormatRequirements *)v6 setHeight:*(uint64_t *)&a3 >> 32];
  v8 = v6;
  return -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1]), 1, @"BWVideoPIPOverlayNode Intermediate Pool", +[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"));
}

- (void)invalidate
{
  rotationSession = self->_rotationSession;
  if (rotationSession)
  {
    VTPixelRotationSessionInvalidate(rotationSession);
    uint64_t v4 = self->_rotationSession;
    if (v4)
    {
      CFRelease(v4);
      self->_rotationSession = 0;
    }
  }
  transferSession = self->_transferSession;
  if (transferSession)
  {
    VTPixelTransferSessionInvalidate(transferSession);
    v6 = self->_transferSession;
    if (v6)
    {
      CFRelease(v6);
      self->_transferSession = 0;
    }
  }
}

@end