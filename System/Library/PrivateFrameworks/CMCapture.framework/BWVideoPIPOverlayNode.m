@interface BWVideoPIPOverlayNode
+ (void)initialize;
- (BOOL)releasesResourcesAtEndOfData;
- (BOOL)smartStyleRenderingEnabled;
- (BWVideoPIPOverlayNode)initWithDelegate:(id)a3 metalCommandQueue:(id)a4 secondaryCameraStreamingEnabled:(BOOL)a5 secondaryCameraFrameRate:(float)a6 maxLossyCompressionLevel:(int)a7 isDeviceBravoVariant:(BOOL)a8 baseZoomFactorsByPortType:(id)a9;
- (id)_reticleCIColorForPixelBuffer:(__CVBuffer *)a3 opacity:(float)a4;
- (id)_strokedRectangleImageWithRect:(CGRect)a3 thickness:(float)a4 c:(id)a5;
- (id)nodeSubType;
- (id)nodeType;
- (int)_drawOverlayRects:(id)a3 toPixelBuffer:(__CVBuffer *)a4 withinRect:(CGRect)a5;
- (int)_loadAndConfigureSmartStyleProxyRenderer;
- (int)_renderSmartStyleToIntermediateBufferWithInputSampleBuffer:(opaqueCMSampleBuffer *)a3 pipSourcePixelBuffer:(__CVBuffer *)a4 inputRect:(CGRect)a5 outputRect:(CGRect)a6;
- (uint64_t)_drawPIPUsingCPUAndMSRToOutputPixelBuffer:(double)a3 attachedPixelBuffer:(double)a4 outputRect:(double)a5 inputRect:(double)a6 normalizedReticleRect:(double)a7 primaryCaptureRect:(double)a8 uprightExifOrientation:(double)a9;
- (void)_drawPIPUsingGPUToOutputPixelBuffer:(double)a3 attachedPixelBuffer:(CGFloat)a4 filters:(double)a5 outputRect:(double)a6 inputRect:(double)a7 normalizedReticleRect:(double)a8 uprightExifOrientation:(double)a9 pipOpacity:(uint64_t)a10;
- (void)_ensureGPUResources;
- (void)_releaseResources;
- (void)_renderAttachedPixelBuffersFromSampleBuffer:(opaqueCMSampleBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4;
- (void)_updateCurrentStyle:(opaqueCMSampleBuffer *)a3;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setReleasesResourcesAtEndOfData:(BOOL)a3;
- (void)setSmartStyleRenderingEnabled:(BOOL)a3;
@end

@implementation BWVideoPIPOverlayNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  v6 = objc_msgSend((id)objc_msgSend(a4, "primaryMediaProperties"), "resolvedVideoFormat");
  if ([v6 pixelFormat] == 875704422
    || [v6 pixelFormat] == 875704438)
  {
    self->_useGPUForDrawing = 0;
  }
  output = self->super._output;
  [(BWNodeOutput *)output setFormat:a3];
}

- (id)nodeType
{
  return @"Effect";
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  if (self->_useGPUForDrawing) {
    [(BWVideoPIPOverlayNode *)self _ensureGPUResources];
  }
  else {
    self->_scalingSession = objc_alloc_init(BWScalingSession);
  }
  if (self->_smartStyleRenderingEnabled)
  {
    [(BWVideoPIPOverlayNode *)self _loadAndConfigureSmartStyleProxyRenderer];
    if (!self->_scalingSession) {
      self->_scalingSession = objc_alloc_init(BWScalingSession);
    }
  }
  v3.receiver = self;
  v3.super_class = (Class)BWVideoPIPOverlayNode;
  [(BWNode *)&v3 prepareForCurrentConfigurationToBecomeLive];
}

- (void)setSmartStyleRenderingEnabled:(BOOL)a3
{
  self->_smartStyleRenderingEnabled = a3;
}

- (BWVideoPIPOverlayNode)initWithDelegate:(id)a3 metalCommandQueue:(id)a4 secondaryCameraStreamingEnabled:(BOOL)a5 secondaryCameraFrameRate:(float)a6 maxLossyCompressionLevel:(int)a7 isDeviceBravoVariant:(BOOL)a8 baseZoomFactorsByPortType:(id)a9
{
  v26.receiver = self;
  v26.super_class = (Class)BWVideoPIPOverlayNode;
  v15 = [(BWNode *)&v26 init];
  if (v15)
  {
    v15->_metalCommandQueue = (MTLCommandQueue *)a4;
    v16 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v15];
    [(BWNodeInput *)v16 setPassthroughMode:1];
    v17 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v17 setSupportedPixelFormats:&unk_1EFB039E0];
    [(BWNodeInput *)v16 setFormatRequirements:v17];

    [(BWNode *)v15 addInput:v16];
    v18 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v15];
    [(BWNodeOutput *)v18 setPassthroughMode:1];
    v19 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWNodeOutput *)v18 setFormatRequirements:v19];

    [(BWNode *)v15 addOutput:v18];
    v15->_useGPUForDrawing = 1;
    v15->_overCaptureTargetRatio = 3.0;
    v15->_overCaptureTargetRatioSmoothingEnabled = 0;
    objc_msgSend((id)objc_msgSend(a9, "objectForKeyedSubscript:", *MEMORY[0x1E4F52DF0]), "floatValue");
    float v21 = v20;
    objc_msgSend((id)objc_msgSend(a9, "objectForKeyedSubscript:", *MEMORY[0x1E4F52DD8]), "floatValue");
    if ((int)FigCaptureRoundFloatToMultipleOf(1, v21 / v22) <= 4) {
      int v23 = 276;
    }
    else {
      int v23 = 312;
    }
    v15->_zoomPIPWidth = v23;
    v15->_overCaptureTargetInterpolationScale = 0.35;
    v15->_overCaptureTargetRatioInterpolationStart = 1.6149;
    v15->_reticleLineThickness = 4.0;
    v15->_baseZoomFactorsByPortType = (NSDictionary *)[a9 copy];
    v15->_secondaryCameraStreamingEnabled = a5;
    v15->_frameRate = a6;
    v15->_delegate = (BWVideoPIPOverlayDelegate *)a3;
    v15->_fadeRamp = [[BWRamp alloc] initWithName:@"FadeRamp"];
    v15->_fadeInDurationSeconds = 0.3;
    v15->_fadeOutDurationSeconds = 0.3;
    v15->_dropShadowWidth = 2.0;
    v15->_dropShadowBlurSigma = 10.0;
    v15->_dropShadowAlpha = 0.3;
    v15->_highQualitySamplingEnabled = 1;
    v15->_dropShadowEnabled = 1;
    v15->_releasesResourcesAtEndOfData = 1;
    CGSize v24 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v15->_normalizedOutputRect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v15->_normalizedOutputRect.size = v24;
    v15->_isDeviceBravoVariant = a8;
  }
  return v15;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  memset(&v8, 0, sizeof(v8));
  CMSampleBufferGetPresentationTimeStamp(&v8, a3);
  v6 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    CMTime time = v8;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  if (a3)
  {
    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    if (ImageBuffer) {
      [(BWVideoPIPOverlayNode *)self _renderAttachedPixelBuffersFromSampleBuffer:a3 toPixelBuffer:ImageBuffer];
    }
  }
  if (*v6 == 1) {
    kdebug_trace();
  }
  [(BWNodeOutput *)self->super._output emitSampleBuffer:a3];
}

- (void)_renderAttachedPixelBuffersFromSampleBuffer:(opaqueCMSampleBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4
{
  uint64_t v7 = MEMORY[0x1E4F1DB28];
  AttachedMedia = (void *)BWSampleBufferGetAttachedMedia(a3, 0x1EFA74680);
  CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F53070];
  CFDictionaryRef v10 = (const __CFDictionary *)CMGetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (!AttachedMedia || self->_frameRate == 0.0)
  {
    previousAttachedSampleBuffer = self->_previousAttachedSampleBuffer;
    if (previousAttachedSampleBuffer)
    {
      if (self->_frameRate != 0.0)
      {
        memset(&v167, 0, 24);
        CMSampleBufferGetPresentationTimeStamp((CMTime *)&v167, previousAttachedSampleBuffer);
        memset(&v166, 0, 24);
        CMSampleBufferGetPresentationTimeStamp((CMTime *)&v166, a3);
        memset(&v169, 0, 24);
        *(_OWORD *)&lhs.value = *(_OWORD *)&v166.a;
        lhs.epoch = *(void *)&v166.c;
        *(CGPoint *)&rhs.value = v167.origin;
        rhs.epoch = *(void *)&v167.size.width;
        CMTimeSubtract((CMTime *)&v169, &lhs, &rhs);
        double v14 = (float)(1.0 / self->_frameRate);
        *(CGPoint *)&lhs.value = v169.origin;
        lhs.epoch = *(void *)&v169.size.width;
        if (CMTimeGetSeconds(&lhs) <= v14 + v14)
        {
          AttachedMedia = self->_previousAttachedSampleBuffer;
          CFDictionaryRef v10 = (const __CFDictionary *)CMGetAttachment(AttachedMedia, v9, 0);
        }
      }
    }
  }
  else
  {
    memset(&v167, 0, 24);
    CMSampleBufferGetPresentationTimeStamp((CMTime *)&v167, (CMSampleBufferRef)AttachedMedia);
    memset(&v166, 0, 24);
    p_previousAttachedSampleBuffer = &self->_previousAttachedSampleBuffer;
    v12 = self->_previousAttachedSampleBuffer;
    if (v12)
    {
      CMSampleBufferGetPresentationTimeStamp((CMTime *)&v166, v12);
    }
    else
    {
      *(_OWORD *)&v166.a = *MEMORY[0x1E4F1FA48];
      v166.c = *(CGFloat *)(MEMORY[0x1E4F1FA48] + 16);
    }
    memset(&v169, 0, 24);
    *(CGPoint *)&lhs.value = v167.origin;
    lhs.epoch = *(void *)&v167.size.width;
    *(_OWORD *)&rhs.value = *(_OWORD *)&v166.a;
    rhs.epoch = *(void *)&v166.c;
    CMTimeSubtract((CMTime *)&v169, &lhs, &rhs);
    *(CGPoint *)&lhs.value = v169.origin;
    lhs.epoch = *(void *)&v169.size.width;
    Float64 Seconds = CMTimeGetSeconds(&lhs);
    v16 = *p_previousAttachedSampleBuffer;
    if (Seconds >= (float)(1.0 / self->_frameRate) + -0.00100000005)
    {
      if (v16) {
        CFRelease(v16);
      }
      BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)AttachedMedia, &self->_previousAttachedSampleBuffer);
    }
    else
    {
      AttachedMedia = *p_previousAttachedSampleBuffer;
    }
  }
  double v17 = *(double *)v7;
  double v18 = *(double *)(v7 + 8);
  double v20 = *(double *)(v7 + 16);
  double v19 = *(double *)(v7 + 24);
  p_fadeReferenceSampleBuffer = &self->_fadeReferenceSampleBuffer;
  fadeReferenceSampleBuffer = self->_fadeReferenceSampleBuffer;
  if (AttachedMedia)
  {
    if (fadeReferenceSampleBuffer)
    {
      float v23 = 1.0;
      if ([(BWRamp *)self->_fadeRamp isRamping])
      {
        [(BWRamp *)self->_fadeRamp updateRampForNextIteration];
        float v23 = v24;
      }
    }
    else
    {
      LODWORD(v167.origin.x) = 0;
      FigCFDictionaryGetFloatIfPresent();
      LODWORD(v26) = llroundf(self->_fadeInDurationSeconds * *(float *)&v167.origin.x);
      float v23 = 0.0;
      LODWORD(v27) = 1.0;
      [(BWRamp *)self->_fadeRamp startRampFrom:v26 to:1 iterations:0.0 shape:v27];
    }
    if (*p_fadeReferenceSampleBuffer)
    {
      CFRelease(*p_fadeReferenceSampleBuffer);
      *p_fadeReferenceSampleBuffer = 0;
    }
    BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)AttachedMedia, &self->_fadeReferenceSampleBuffer);
    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)AttachedMedia);
    goto LABEL_26;
  }
  if (!fadeReferenceSampleBuffer)
  {
LABEL_36:
    BOOL v29 = 0;
    goto LABEL_114;
  }
  if ([(BWRamp *)self->_fadeRamp isRamping])
  {
    [(BWRamp *)self->_fadeRamp updateRampForNextIteration];
    float v23 = v25;
  }
  else
  {
    CMGetAttachment(*p_fadeReferenceSampleBuffer, v9, 0);
    LODWORD(v167.origin.x) = 0;
    FigCFDictionaryGetFloatIfPresent();
    LODWORD(v40) = llroundf(self->_fadeOutDurationSeconds * *(float *)&v167.origin.x);
    float v23 = 1.0;
    LODWORD(v41) = 1.0;
    [(BWRamp *)self->_fadeRamp startRampFrom:v40 to:2 iterations:v41 shape:0.0];
  }
  BOOL v42 = [(BWRamp *)self->_fadeRamp isRamping];
  AttachedMedia = *p_fadeReferenceSampleBuffer;
  if (!v42)
  {
    if (AttachedMedia)
    {
      CFRelease(*p_fadeReferenceSampleBuffer);
      BOOL v29 = 0;
      *p_fadeReferenceSampleBuffer = 0;
      goto LABEL_114;
    }
    goto LABEL_36;
  }
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(*p_fadeReferenceSampleBuffer);
  CFDictionaryRef v10 = (const __CFDictionary *)CMGetAttachment(AttachedMedia, v9, 0);
LABEL_26:
  BOOL v29 = AttachedMedia != 0;
  if (AttachedMedia && ImageBuffer)
  {
    CFTypeID v30 = CFGetTypeID(ImageBuffer);
    if (v30 == CVPixelBufferGetTypeID())
    {
      memset(&v167, 0, sizeof(v167));
      CFStringRef v31 = (const __CFString *)*MEMORY[0x1E4F530D0];
      CFDictionaryRef v32 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F530D0], 0);
      CVPixelBufferRef pixelBuffer = a4;
      float v155 = v23;
      v33 = a4;
      CFDictionaryRef v34 = v10;
      if (v32)
      {
        CGRectMakeWithDictionaryRepresentation(v32, &v167);
        CVPixelBufferGetWidth(v33);
        CVPixelBufferGetHeight(v33);
        FigCaptureMetadataUtilitiesDenormalizeCropRect(v167.origin.x, v167.origin.y, v167.size.width, v167.size.height);
        double Width = v38;
      }
      else
      {
        double Width = (double)CVPixelBufferGetWidth(v33);
        double Height = (double)CVPixelBufferGetHeight(v33);
        CGFloat v35 = 0.0;
        CGFloat v36 = 0.0;
      }
      v167.origin.double x = v35;
      v167.origin.double y = v36;
      v167.size.width = Width;
      v167.size.height = Height;
      int v43 = CVPixelBufferGetWidth(ImageBuffer);
      int v44 = CVPixelBufferGetHeight(ImageBuffer);
      v166.a = 0.0;
      v166.b = 0.0;
      __asm { FMOV            V0.2D, #1.0 }
      *(_OWORD *)&v166.c = _Q0;
      CFDictionaryRef v49 = (const __CFDictionary *)CMGetAttachment(AttachedMedia, v31, 0);
      if (v49)
      {
        CGRectMakeWithDictionaryRepresentation(v49, (CGRect *)&v166);
        CGSize v50 = *(CGSize *)(v7 + 16);
        v169.origin = *(CGPoint *)v7;
        v169.size = v50;
        if (FigCFDictionaryGetCGRectIfPresent())
        {
          v166.a = FigCaptureMetadataUtilitiesScaleRect(v166.a, v166.b, v166.c, v166.d, (v169.size.width + v169.size.height) * 0.5);
          v166.b = v51;
          v166.c = v52;
          v166.d = v53;
        }
      }
      else
      {
        FigCFDictionaryGetCGRectIfPresent();
      }
      double v54 = (double)v43;
      double v55 = (double)v44;
      FigCaptureMetadataUtilitiesDenormalizeCropRect(v166.a, v166.b, v166.c, v166.d);
      CGFloat v57 = v56;
      CGFloat v59 = v58;
      double v61 = v60;
      double v63 = v62;
      CVPixelBufferGetWidth(pixelBuffer);
      CVPixelBufferGetHeight(pixelBuffer);
      FigCaptureRotationDegreesAndMirroringFromExifOrientation(6, 0);
      FigCaptureMetadataUtilitiesRoundRectToEvenCoordinates();
      double v160 = v64;
      double v161 = v65;
      double v162 = v66;
      double v163 = v67;
      CFDictionaryRef v68 = (const __CFDictionary *)CMGetAttachment(AttachedMedia, @"NarrowerCameraPreviewAlignmentShift", 0);
      CFDictionaryRef v10 = v34;
      double v156 = (double)v43;
      double v158 = v55;
      if (v68
        && (*(_OWORD *)&lhs.value = *MEMORY[0x1E4F1DAD8], CGPointMakeWithDictionaryRepresentation(v68, (CGPoint *)&lhs)))
      {
        v172.origin.double x = v57;
        v172.origin.double y = v59;
        v172.size.width = v61;
        v172.size.height = v63;
        CGRect v173 = CGRectOffset(v172, -*(double *)&lhs.value, -*(double *)&lhs.timescale);
        double x = v173.origin.x;
        double y = v173.origin.y;
        double v70 = v173.size.width;
        double v71 = v173.size.height;
        v169.origin.double x = 0.0;
        v169.origin.double y = 0.0;
        v169.size.width = (double)v43;
        v169.size.height = v55;
        FigCFDictionaryGetCGRectIfPresent();
        CGFloat v72 = v169.origin.x;
        CGFloat v73 = v169.origin.y;
        CGFloat v75 = v169.size.width;
        CGFloat v74 = v169.size.height;
        if (v169.size.width >= v70) {
          double v76 = v70;
        }
        else {
          double v76 = v169.size.width;
        }
        double v77 = fmax(v76, 0.0);
        if (v169.size.height >= v71) {
          double v78 = v71;
        }
        else {
          double v78 = v169.size.height;
        }
        double v63 = fmax(v78, 0.0);
        double MinX = CGRectGetMinX(v169);
        v174.origin.double x = v72;
        v174.origin.double y = v73;
        v174.size.width = v75;
        v174.size.height = v74;
        double v80 = CGRectGetMaxX(v174) - v77;
        if (v80 >= x) {
          double v80 = x;
        }
        if (MinX >= v80) {
          double v80 = MinX;
        }
        CGFloat v151 = v80;
        v175.origin.double x = v72;
        v175.origin.double y = v73;
        v175.size.width = v75;
        v175.size.height = v74;
        double MinY = CGRectGetMinY(v175);
        v176.origin.double x = v72;
        v176.origin.double y = v73;
        double v54 = (double)v43;
        double v55 = v158;
        v176.size.width = v75;
        double v61 = v77;
        v176.size.height = v74;
        double v82 = CGRectGetMaxY(v176) - v63;
        if (v82 >= y) {
          double v82 = y;
        }
        if (MinY >= v82) {
          double v82 = MinY;
        }
        CGFloat v150 = v82;
      }
      else
      {
        CGFloat v150 = v59;
        CGFloat v151 = v57;
      }
      a4 = pixelBuffer;
      if (v54 / v61 >= v55 / v63) {
        double v83 = v55 / v63;
      }
      else {
        double v83 = v54 / v61;
      }
      Value = (void *)CFDictionaryGetValue(v10, (const void *)*MEMORY[0x1E4F54128]);
      if (self->_isDeviceBravoVariant)
      {
        v85 = Value;
        v86 = (void *)CMGetAttachment(AttachedMedia, @"TotalZoomFactor", 0);
        CGFloat v87 = v63;
        if (v86)
        {
          [v86 floatValue];
          float v89 = v88;
        }
        else
        {
          float v89 = 1.0;
        }
        CGFloat v90 = v61;
        uint64_t v91 = *MEMORY[0x1E4F52DF0];
        if ([v85 isEqualToString:*MEMORY[0x1E4F52DF0]])
        {
          float v92 = v83;
          self->_float lastTeleMaxScale = v92;
          self->_float lastTeleMaxScaleZoomFactor = v89;
        }
        else if (self->_secondaryCameraStreamingEnabled)
        {
          double v83 = v83 * 0.699999988;
        }
        else
        {
          float lastTeleMaxScale = self->_lastTeleMaxScale;
          if (lastTeleMaxScale <= 0.0)
          {
            objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_baseZoomFactorsByPortType, "objectForKeyedSubscript:", v91), "floatValue");
            float v98 = v97;
            objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_baseZoomFactorsByPortType, "objectForKeyedSubscript:", v85), "floatValue");
            float v100 = v99;
            objc_msgSend((id)-[__CFDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", *MEMORY[0x1E4F540F0]), "floatValue");
            if (v101 == 0.0) {
              float v101 = 1.0;
            }
            double v83 = v83 / (float)(v98 / (float)(v100 * v101));
          }
          else
          {
            double v83 = lastTeleMaxScale;
            if (v89 > 0.0)
            {
              float lastTeleMaxScaleZoomFactor = self->_lastTeleMaxScaleZoomFactor;
              BOOL v95 = lastTeleMaxScaleZoomFactor <= 0.0;
              double v96 = v83 * (float)(v89 / lastTeleMaxScaleZoomFactor);
              if (!v95) {
                double v83 = v96;
              }
            }
          }
        }
      }
      else
      {
        CGFloat v87 = v63;
        CGFloat v90 = v61;
      }
      float overCaptureTargetRatioInterpolationStart = self->_overCaptureTargetRatioInterpolationStart;
      double v103 = overCaptureTargetRatioInterpolationStart;
      float v104 = v83 / overCaptureTargetRatioInterpolationStart;
      float v105 = self->_overCaptureTargetInterpolationScale * log2f(v104);
      float overCaptureTargetRatio = self->_overCaptureTargetRatio;
      double v107 = log2f(overCaptureTargetRatio / overCaptureTargetRatioInterpolationStart);
      if (fabs(v105) <= v107 * 1.57079633)
      {
        double v108 = sin(v105 / v107) * v107;
      }
      else
      {
        double v108 = -v107;
        if (v105 >= 0.0) {
          double v108 = v107;
        }
      }
      float v109 = v108;
      double v110 = v103 * exp2f(v109);
      double v111 = overCaptureTargetRatio;
      if (v110 > overCaptureTargetRatio) {
        double v110 = overCaptureTargetRatio;
      }
      double v112 = fmax(v110, 1.0);
      if (v83 <= v111) {
        double v111 = v83;
      }
      double v113 = fmax(v111, 1.0);
      if (self->_overCaptureTargetRatioSmoothingEnabled) {
        double v114 = v112;
      }
      else {
        double v114 = v113;
      }
      double v115 = FigCaptureMetadataUtilitiesScaleRect(v151, v150, v90, v87, v114);
      double v153 = v116;
      double v118 = v117;
      double v120 = v119;
      float v121 = v167.size.width / v167.size.height;
      int v122 = objc_msgSend((id)CMGetAttachment(pixelBuffer, @"RotationDegrees", 0), "intValue");
      int v123 = v122;
      if (v122 == 270 || v122 == 90) {
        float v125 = 1.0 / v121;
      }
      else {
        float v125 = v121;
      }
      double v126 = FigCaptureMetadataUtilitiesRectByCroppingRectToAspectRatio(v151, v150, v90, v87, v125);
      double v130 = FigCaptureMetadataUtilitiesRectNormalizedToRect(v126, v127, v128, v129, v115, v153, v118);
      v166.a = v130;
      v166.b = v131;
      v166.c = v132;
      v166.d = v133;
      if (v123 == 270 || v123 == 90)
      {
        v166.a = v131;
        v166.b = v130;
        v166.c = v133;
        v166.d = v132;
      }
      double v134 = v156 - v118;
      if (v156 - v118 >= v115) {
        double v134 = v115;
      }
      double pixelBuffera = fmax(v134, 0.0);
      double v135 = v158 - v120;
      if (v158 - v120 >= v153) {
        double v135 = v153;
      }
      double v136 = fmax(v135, 0.0);
      double v137 = FigCaptureMetadataUtilitiesRectNormalizedToRect(v160, v161, v162, v163, v167.origin.x, v167.origin.y, v167.size.width);
      double v157 = v138;
      double v159 = v137;
      double v154 = v139;
      double v19 = v140;
      CFTypeRef v141 = CMGetAttachment(AttachedMedia, @"FiltersForZoomPIPOverlay", 0);
      if (self->_smartStyleRenderingEnabled) {
        -[BWVideoPIPOverlayNode _renderSmartStyleToIntermediateBufferWithInputSampleBuffer:pipSourcePixelBuffer:inputRect:outputRect:](self, "_renderSmartStyleToIntermediateBufferWithInputSampleBuffer:pipSourcePixelBuffer:inputRect:outputRect:", a3, ImageBuffer, pixelBuffera, v136, v118, v120, v160, v161, v162, v163);
      }
      if (self->_useGPUForDrawing || v141 || (LODWORD(v142) = 1.0, *(float *)&double v143 = v155, v155 < 1.0))
      {
        [(BWVideoPIPOverlayNode *)self _ensureGPUResources];
        *(float *)&uint64_t v149 = v155;
        -[BWVideoPIPOverlayNode _drawPIPUsingGPUToOutputPixelBuffer:attachedPixelBuffer:filters:outputRect:inputRect:normalizedReticleRect:uprightExifOrientation:pipOpacity:](self, "_drawPIPUsingGPUToOutputPixelBuffer:attachedPixelBuffer:filters:outputRect:inputRect:normalizedReticleRect:uprightExifOrientation:pipOpacity:", a4, ImageBuffer, v141, 6, v160, v161, v162, v163, pixelBuffera, v136, v118, v120, *(void *)&v166.a, *(void *)&v166.b, *(void *)&v166.c, *(void *)&v166.d,
          v149);
      }
      else
      {
        -[BWVideoPIPOverlayNode _drawPIPUsingCPUAndMSRToOutputPixelBuffer:attachedPixelBuffer:outputRect:inputRect:normalizedReticleRect:primaryCaptureRect:uprightExifOrientation:](self, "_drawPIPUsingCPUAndMSRToOutputPixelBuffer:attachedPixelBuffer:outputRect:inputRect:normalizedReticleRect:primaryCaptureRect:uprightExifOrientation:", a4, ImageBuffer, 6, v160, v161, v162, v163, pixelBuffera, v136, v118, v120, *(void *)&v166.a, *(void *)&v166.b, *(void *)&v166.c, *(void *)&v166.d, *(void *)&v167.origin.x,
          *(void *)&v167.origin.y,
          *(void *)&v167.size.width,
          *(void *)&v167.size.height);
      }
      double v18 = v157;
      double v17 = v159;
      double v20 = v154;
    }
    BOOL v29 = 1;
  }
LABEL_114:
  v177.origin.double x = v17;
  v177.origin.double y = v18;
  v177.size.width = v20;
  v177.size.height = v19;
  if (!CGRectEqualToRect(v177, self->_normalizedOutputRect) && self->_delegate)
  {
    self->_normalizedOutputRect.origin.double x = v17;
    self->_normalizedOutputRect.origin.double y = v18;
    self->_normalizedOutputRect.size.width = v20;
    self->_normalizedOutputRect.size.height = v19;
    if (v10)
    {
      v178.origin.double x = v17;
      v178.origin.double y = v18;
      v178.size.width = v20;
      v178.size.height = v19;
      if (!CGRectIsEmpty(v178))
      {
        int v144 = objc_msgSend((id)CMGetAttachment(a4, @"RotationDegrees", 0), "intValue");
        int v145 = objc_msgSend((id)CMGetAttachment(a4, @"MirroredHorizontal", 0), "BOOLValue");
        int v146 = objc_msgSend((id)CMGetAttachment(a4, @"MirroredVertical", 0), "BOOLValue");
        CFDictionaryRef v147 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F530D8], 0);
        v169.origin.double x = 0.0;
        v169.origin.double y = 0.0;
        __asm { FMOV            V0.2D, #1.0 }
        v169.size = _Q0;
        CGRectMakeWithDictionaryRepresentation(v147, &v169);
        long long v168 = 0u;
        memset(&v167, 0, sizeof(v167));
        FigCaptureGetTransformForMirroringRotationAndCrop(v145, v146, v144, (uint64_t)&v167, v169.origin.x, v169.origin.y, v169.size.width, v169.size.height);
        *(CGPoint *)&v166.a = v167.origin;
        *(CGSize *)&v166.c = v167.size;
        *(_OWORD *)&v166.tdouble x = v168;
        v179.origin.double x = v17;
        v179.origin.double y = v18;
        v179.size.width = v20;
        v179.size.height = v19;
        CGRect v180 = CGRectApplyAffineTransform(v179, &v166);
        double v17 = v180.origin.x;
        double v18 = v180.origin.y;
        double v20 = v180.size.width;
        double v19 = v180.size.height;
      }
    }
    -[BWVideoPIPOverlayDelegate videoPIPOverlayNode:overlayRectDidChange:](self->_delegate, "videoPIPOverlayNode:overlayRectDidChange:", self, v17, v18, v20, v19);
  }
  if (v29)
  {
    BWSampleBufferRemoveAttachedMedia(a3, 0x1EFA74680);
    CMRemoveAttachment(a3, @"ZoomPIPSource");
  }
}

+ (void)initialize
{
}

- (void)dealloc
{
  [(BWVideoPIPOverlayNode *)self _releaseResources];

  v3.receiver = self;
  v3.super_class = (Class)BWVideoPIPOverlayNode;
  [(BWNode *)&v3 dealloc];
}

- (id)nodeSubType
{
  return @"VideoPIPOverlay";
}

- (void)_releaseResources
{
  self->_metalCommandQueue = 0;
  self->_scalingSession = 0;

  self->_drawRectangleFilter = 0;
  self->_drawDropShadowFilter = 0;

  self->_sourceOverBlendKernel = 0;
  self->_ciReticleColor = 0;

  self->_ciContext = 0;
  self->_fadeRamp = 0;
  bitmapContext = self->_bitmapContext;
  if (bitmapContext)
  {
    CFRelease(bitmapContext);
    self->_bitmapContext = 0;
  }
  previousAttachedSampleBuffer = self->_previousAttachedSampleBuffer;
  if (previousAttachedSampleBuffer)
  {
    CFRelease(previousAttachedSampleBuffer);
    self->_previousAttachedSampleBuffer = 0;
  }
  fadeReferenceSampleBuffer = self->_fadeReferenceSampleBuffer;
  if (fadeReferenceSampleBuffer)
  {
    CFRelease(fadeReferenceSampleBuffer);
    self->_fadeReferenceSampleBuffer = 0;
  }

  self->_smartStyleProxyRenderer = 0;
  smartStyleIntermediateUnstyled = self->_smartStyleIntermediateUnstyled;
  if (smartStyleIntermediateUnstyled)
  {
    CFRelease(smartStyleIntermediateUnstyled);
    self->_smartStyleIntermediateUnstyled = 0;
  }
  smartStyleIntermediateStyled = self->_smartStyleIntermediateStyled;
  if (smartStyleIntermediateStyled)
  {
    CFRelease(smartStyleIntermediateStyled);
    self->_smartStyleIntermediateStyled = 0;
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  if (self->_releasesResourcesAtEndOfData) {
    [(BWVideoPIPOverlayNode *)self _releaseResources];
  }
  v5.receiver = self;
  v5.super_class = (Class)BWVideoPIPOverlayNode;
  [(BWNode *)&v5 didReachEndOfDataForInput:a3];
}

- (void)_ensureGPUResources
{
  v6[3] = *MEMORY[0x1E4F143B8];
  if (!self->_gpuPathInitialized)
  {
    if (!self->_ciContext)
    {
      uint64_t v3 = *MEMORY[0x1E4F1E220];
      v5[0] = *MEMORY[0x1E4F1E1E0];
      v5[1] = v3;
      v6[0] = MEMORY[0x1E4F1CC38];
      v6[1] = MEMORY[0x1E4F1CC38];
      v5[2] = *MEMORY[0x1E4F1E240];
      v6[2] = [MEMORY[0x1E4F1CA98] null];
      uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];
      self->_ciContext = (CIContext *)(id)[MEMORY[0x1E4F1E018] contextWithMTLCommandQueue:self->_metalCommandQueue options:v4];
    }
    if (!self->_drawRectangleFilter) {
      self->_drawRectangleFilter = (CIRoundedRectangleStrokeGenerator *)(id)[MEMORY[0x1E4F1E040] roundedRectangleStrokeGeneratorFilter];
    }
    if (!self->_drawDropShadowFilter) {
      self->_drawDropShadowFilter = (CIBlurredRectangleGenerator *)(id)[MEMORY[0x1E4F1E040] blurredRectangleGeneratorFilter];
    }
    if (!self->_sourceOverBlendKernel) {
      self->_sourceOverBlendKernel = (CIBlendKernel *)(id)[MEMORY[0x1E4F1E000] sourceOver];
    }
    self->_gpuPathInitialized = 1;
  }
}

- (id)_strokedRectangleImageWithRect:(CGRect)a3 thickness:(float)a4 c:(id)a5
{
  CGRect v12 = CGRectInset(a3, a4 * -0.5, a4 * -0.5);
  CGRect v13 = CGRectIntegral(v12);
  [(CIRoundedRectangleStrokeGenerator *)self->_drawRectangleFilter setExtent:FigCaptureMetadataUtilitiesRoundRectToEvenCoordinatesPreservingSquareness(1u, v13.origin.x, *(float64x2_t *)&v13.origin.y, v13.size.width, v13.size.height, 0.0)];
  [(CIRoundedRectangleStrokeGenerator *)self->_drawRectangleFilter setRadius:0.0];
  *(float *)&double v8 = a4;
  [(CIRoundedRectangleStrokeGenerator *)self->_drawRectangleFilter setWidth:v8];
  [(CIRoundedRectangleStrokeGenerator *)self->_drawRectangleFilter setColor:a5];
  drawRectangleFilter = self->_drawRectangleFilter;
  return (id)[(CIRoundedRectangleStrokeGenerator *)drawRectangleFilter outputImage];
}

- (id)_reticleCIColorForPixelBuffer:(__CVBuffer *)a3 opacity:(float)a4
{
  CFTypeRef v6 = CVBufferCopyAttachment(a3, (CFStringRef)*MEMORY[0x1E4F24BC8], 0);
  if (v6) {
    uint64_t v7 = (void *)CFAutorelease(v6);
  }
  else {
    uint64_t v7 = 0;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F24BD8]])
  {
    double v8 = (const __CFString **)MEMORY[0x1E4F1DC48];
    float v9 = 238.0;
    float v10 = 230.0;
    float v11 = 120.0;
  }
  else
  {
    int v12 = [v7 isEqualToString:*MEMORY[0x1E4F24BE0]];
    double v8 = (const __CFString **)MEMORY[0x1E4F1DB90];
    if (v12) {
      float v11 = 20.0;
    }
    else {
      float v11 = 74.0;
    }
    if (v12)
    {
      double v8 = (const __CFString **)MEMORY[0x1E4F1DC98];
      float v10 = 212.0;
    }
    else
    {
      float v10 = 215.0;
    }
    if (v12) {
      float v9 = 254.0;
    }
    else {
      float v9 = 248.0;
    }
  }
  CFStringRef v13 = *v8;
  double v14 = [(CIColor *)self->_ciReticleColor colorSpace];
  if (v14) {
    CFStringRef Name = CGColorSpaceGetName(v14);
  }
  else {
    CFStringRef Name = 0;
  }
  [(CIColor *)self->_ciReticleColor alpha];
  double v16 = a4;
  BOOL v18 = v17 != v16 || Name == 0;
  if (!v18 && CFEqual(Name, v13)) {
    return self->_ciReticleColor;
  }

  double v19 = CGColorSpaceCreateWithName(v13);
  double v20 = (CIColor *)[objc_alloc(MEMORY[0x1E4F1E008]) initWithRed:v19 green:(float)(v9 / 255.0) blue:(float)(v10 / 255.0) alpha:(float)(v11 / 255.0) colorSpace:v16];
  CGColorSpaceRelease(v19);
  self->_ciReticleColor = v20;
  return v20;
}

- (void)_drawPIPUsingGPUToOutputPixelBuffer:(double)a3 attachedPixelBuffer:(CGFloat)a4 filters:(double)a5 outputRect:(double)a6 inputRect:(double)a7 normalizedReticleRect:(double)a8 uprightExifOrientation:(double)a9 pipOpacity:(uint64_t)a10
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v34 = (void *)[objc_alloc(MEMORY[0x1E4F1E070]) initWithPixelBuffer:a11];
  double v82 = a3;
  if (*(unsigned char *)(a1 + 310))
  {
    if (*(void *)(a1 + 328) && *(_DWORD *)(a1 + 312))
    {
      double v35 = a4;
      CGFloat v36 = &OBJC_IVAR___BWVideoPIPOverlayNode__smartStyleIntermediateStyled;
    }
    else
    {
      double v35 = a4;
      CGFloat v36 = &OBJC_IVAR___BWVideoPIPOverlayNode__smartStyleIntermediateUnstyled;
    }
    v37 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCVPixelBuffer:", *(void *)(a1 + *v36)), "imageByCroppingToRect:", *(double *)(a1 + 360), (double)CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 352))- *(double *)(a1 + 368)- *(double *)(a1 + 384), *(double *)(a1 + 376), *(double *)(a1 + 384));
    double v38 = *(double *)(a1 + 384);
    uint64_t v39 = (int)*(double *)(a1 + 376);
    memset(&v95, 0, sizeof(v95));
    FigCaptureExifOrientationGetAffineTransform(a14, v39 | ((unint64_t)(int)v38 << 32), (uint64_t)&v94);
    CGAffineTransformInvert(&v95, &v94);
    CGAffineTransform v93 = v95;
    uint64_t v40 = (void *)[v37 imageByApplyingTransform:&v93];
    [v40 extent];
    CGFloat v42 = -v41;
    [v40 extent];
    CGAffineTransformMakeTranslation(&v92, v42, -v43);
    int v44 = (void *)[v40 imageByApplyingTransform:&v92];
    double v45 = ss_conformRectForMSR420vfPixelBuffer(a11, 1, a2, v82, v35, a5);
    double v47 = v46;
    double v49 = v48;
    double v51 = v50;
    [v44 extent];
    CGFloat v53 = v49 / v52;
    [v44 extent];
    CGFloat v55 = v51 / v54;
    CGFloat v56 = (double)CVPixelBufferGetHeight(a11) - v47 - v51;
    CGAffineTransformMakeScale(&v91, v53, v55);
    CGFloat v57 = (void *)[v44 imageByApplyingTransform:&v91];
    CGAffineTransformMakeTranslation(&v90, v45, v56);
    uint64_t v58 = [v57 imageByApplyingTransform:&v90];
  }
  else
  {
    CGFloat v59 = (void *)[MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:a12];
    double v60 = (double)CVPixelBufferGetHeight(a12) - a7 - a9;
    double v61 = objc_msgSend(v59, "imageByCroppingToRect:", a6, v60, a8, a9);
    size_t Height = CVPixelBufferGetHeight(a11);
    CGAffineTransformMakeTranslation(&v95, a2, (double)Height - a3 - a5);
    CGAffineTransform t2 = v95;
    double v35 = a4;
    CGAffineTransformScale(&v93, &t2, a4, a5);
    CGAffineTransform v95 = v93;
    FigCaptureExifOrientationGetAffineTransform(a14, 0x100000001, (uint64_t)&v87);
    CGAffineTransformInvert(&t1, &v87);
    CGAffineTransform t2 = v95;
    CGAffineTransformConcat(&v93, &t1, &t2);
    CGAffineTransform v95 = v93;
    CGAffineTransform t2 = v93;
    CGAffineTransformScale(&v93, &t2, 1.0 / a8, 1.0 / a9);
    CGAffineTransform v95 = v93;
    CGAffineTransform t2 = v93;
    CGAffineTransformTranslate(&v93, &t2, -a6, -v60);
    CGAffineTransform v95 = v93;
    uint64_t v58 = [v61 imageByApplyingTransform:&v93 highQualityDownsample:*(unsigned __int8 *)(a1 + 392)];
  }
  double v63 = (void *)v58;
  v95.a = 0.0;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  uint64_t v64 = [a13 countByEnumeratingWithState:&v83 objects:v98 count:16];
  if (v64)
  {
    uint64_t v65 = v64;
    uint64_t v66 = *(void *)v84;
    uint64_t v67 = *MEMORY[0x1E4F1E480];
    do
    {
      for (uint64_t i = 0; i != v65; ++i)
      {
        if (*(void *)v84 != v66) {
          objc_enumerationMutation(a13);
        }
        v69 = *(void **)(*((void *)&v83 + 1) + 8 * i);
        [v69 setValue:v63 forKey:v67];
        double v63 = (void *)[v69 outputImage];
      }
      uint64_t v65 = [a13 countByEnumeratingWithState:&v83 objects:v98 count:16];
    }
    while (v65);
  }
  if (*(unsigned char *)(a1 + 308))
  {
    [v63 extent];
    CGRectInset(v100, (float)-*(float *)(a1 + 296), (float)-*(float *)(a1 + 296));
    FigCaptureMetadataUtilitiesRoundRectToEvenCoordinates();
    objc_msgSend(*(id *)(a1 + 192), "setExtent:");
    LODWORD(v70) = *(_DWORD *)(a1 + 300);
    [*(id *)(a1 + 192) setSigma:v70];
    objc_msgSend(*(id *)(a1 + 192), "setColor:", objc_msgSend(MEMORY[0x1E4F1E008], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, *(float *)(a1 + 304)));
    double v63 = objc_msgSend(v63, "imageByCompositingOverImage:", objc_msgSend(*(id *)(a1 + 192), "outputImage"));
  }
  if (a19 < 1.0)
  {
    double v96 = @"inputAVector";
    uint64_t v97 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:0.0 W:a19];
    double v63 = objc_msgSend(v63, "imageByApplyingFilter:withInputParameters:", @"CIColorMatrix", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1));
  }
  double v71 = FigCaptureMetadataUtilitiesRectDenormalizedToRect(a15, a16, a17, a18, a2, v82, v35);
  double v73 = v72;
  double v75 = v74;
  double v77 = (double)CVPixelBufferGetHeight(a11) - v76;
  double v78 = v77 - v75;
  *(float *)&double v77 = a19;
  uint64_t v79 = [(id)a1 _reticleCIColorForPixelBuffer:a11 opacity:v77];
  LODWORD(v80) = *(_DWORD *)(a1 + 176);
  uint64_t v81 = objc_msgSend((id)objc_msgSend((id)a1, "_strokedRectangleImageWithRect:thickness:c:", v79, v71, v78, v73, v75, v80), "imageByCompositingOverImage:", v63);
  [v34 setBlendKernel:*(void *)(a1 + 200)];
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 208), "startTaskToRender:toDestination:error:", v81, v34, &v95), "waitUntilCompletedAndReturnError:", &v95);
}

- (uint64_t)_drawPIPUsingCPUAndMSRToOutputPixelBuffer:(double)a3 attachedPixelBuffer:(double)a4 outputRect:(double)a5 inputRect:(double)a6 normalizedReticleRect:(double)a7 primaryCaptureRect:(double)a8 uprightExifOrientation:(double)a9
{
  CGFloat v36 = (void *)[MEMORY[0x1E4F1CA48] array];
  if (*(unsigned char *)(a1 + 310))
  {
    if (*(void *)(a1 + 328) && *(_DWORD *)(a1 + 312)) {
      v37 = &OBJC_IVAR___BWVideoPIPOverlayNode__smartStyleIntermediateStyled;
    }
    else {
      v37 = &OBJC_IVAR___BWVideoPIPOverlayNode__smartStyleIntermediateUnstyled;
    }
    a12 = *(void *)(a1 + *v37);
    a6 = *(double *)(a1 + 360);
    a7 = *(double *)(a1 + 368);
    a8 = *(double *)(a1 + 376);
    a9 = *(double *)(a1 + 384);
  }
  double v38 = *(void **)(a1 + 112);
  if ((int)a13 < 6) {
    objc_msgSend(v38, "scalePixelBuffer:rect:intoPixelBuffer:rect:", a12, a11, a6, a7, a8, a9, a2, a3, a4, a5);
  }
  else {
    objc_msgSend(v38, "scalePixelBuffer:rect:exifOrientation:intoPixelBuffer:rect:", a12, a13, a11, a6, a7, a8, a9, a2, a3, a4, a5);
  }
  uint64_t v39 = [[BWOverlaidRectangle alloc] initWithDisplayStyle:3];
  -[BWOverlaidRectangle setBounds:](v39, "setBounds:", a2, a3, a4, a5);
  [(BWOverlaidRectangle *)v39 setAnimationState:1];
  uint64_t v40 = [[BWRamp alloc] initWithName:@"OverlaidRectangleDisplayStyleVideo"];
  LODWORD(v41) = 1.0;
  [(BWRamp *)v40 startRampFrom:1 to:2 iterations:0.0 shape:v41];
  [(BWRamp *)v40 updateRampForNextIteration];
  [(BWOverlaidRectangle *)v39 setRampAnimation:v40];
  [v36 addObject:v39];
  double v42 = FigCaptureMetadataUtilitiesRectDenormalizedToRect(a14, a15, a16, a17, a2, a3, a4);
  double v44 = v43;
  double v46 = v45;
  double v48 = v47;
  double v49 = [[BWOverlaidRectangle alloc] initWithDisplayStyle:4];
  -[BWOverlaidRectangle setBounds:](v49, "setBounds:", v42, v44, v46, v48);
  [(BWOverlaidRectangle *)v49 setAnimationState:1];
  double v50 = [[BWRamp alloc] initWithName:@"PiP Reticle"];
  LODWORD(v51) = 1.0;
  [(BWRamp *)v50 startRampFrom:1 to:2 iterations:0.0 shape:v51];
  [(BWRamp *)v50 updateRampForNextIteration];
  [(BWOverlaidRectangle *)v49 setRampAnimation:v50];
  [v36 addObject:v49];
  if ([v36 count])
  {
    objc_msgSend((id)objc_msgSend(v36, "firstObject"), "bounds");
    a19 = CGRectGetMaxY(v56) + 10.0;
  }
  return objc_msgSend((id)a1, "_drawOverlayRects:toPixelBuffer:withinRect:", v36, a11, a18, a19, a20, a21);
}

- (int)_drawOverlayRects:(id)a3 toPixelBuffer:(__CVBuffer *)a4 withinRect:(CGRect)a5
{
  int result = 0;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3 && a4)
  {
    CVPixelBufferLockBaseAddress(a4, 0);
    size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a4, 0);
    size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a4, 0);
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
    if (FigCapturePixelFormatIsTenBit(PixelFormatType)) {
      size_t v12 = 16;
    }
    else {
      size_t v12 = 8;
    }
    if (self->_bitmapContext)
    {
      CVPixelBufferGetBaseAddressOfPlane(a4, 0);
      size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a4, 0);
      CGBitmapContextSetData();
    }
    else
    {
      DeviceGradouble y = CGColorSpaceCreateDeviceGray();
      BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a4, 0);
      size_t v15 = CVPixelBufferGetBytesPerRowOfPlane(a4, 0);
      self->_bitmapContext = CGBitmapContextCreate(BaseAddressOfPlane, WidthOfPlane, HeightOfPlane, v12, v15, DeviceGray, 0);
      *(_OWORD *)components = xmmword_1A5EFD700;
      double v16 = CGColorCreate(DeviceGray, components);
      v20.width = 1.0;
      v20.height = -1.0;
      CGContextSetShadowWithColor(self->_bitmapContext, v20, 0.0, v16);
      if (v16) {
        CFRelease(v16);
      }
      if (DeviceGray) {
        CFRelease(DeviceGray);
      }
    }
    if (objc_msgSend(a3, "count", BytesPerRowOfPlane))
    {
      CGContextSaveGState(self->_bitmapContext);
      BWOverlaidRectangleDrawRectanglesInBitmapContext(a3, self->_bitmapContext, a4);
      CGContextRestoreGState(self->_bitmapContext);
    }
    return CVPixelBufferUnlockBaseAddress(a4, 0);
  }
  return result;
}

- (int)_loadAndConfigureSmartStyleProxyRenderer
{
  uint64_t v3 = NSClassFromString((NSString *)objc_msgSend(NSString, "stringWithFormat:", @"CMISmartStyleV%d", 1));
  self->_smartStyleClass = v3;
  if (!v3
    || (v4 = NSClassFromString((NSString *)objc_msgSend(NSString, "stringWithFormat:", @"CMISmartStyleProxyRendererV%d", 1))) == 0|| (objc_super v5 = (CMISmartStyleProxyRenderer *)objc_msgSend([v4 alloc], "initWithOptionalMetalCommandQueue:", self->_metalCommandQueue), (self->_smartStyleProxyRenderer = v5) == 0))
  {
    int v14 = -12786;
LABEL_25:

    self->_smartStyleProxyRenderer = 0;
    return v14;
  }
  [(CMISmartStyleProxyRenderer *)v5 setMaxInputStylesCount:1];
  LODWORD(v6) = 0.5;
  [(CMISmartStyleProxyRenderer *)self->_smartStyleProxyRenderer setForegroundRatio:v6];
  smartStyleProxyRenderer = self->_smartStyleProxyRenderer;
  id v8 = (id)[(CMISmartStyleProxyRenderer *)smartStyleProxyRenderer externalMemoryDescriptorForConfiguration:0];
  if (!v8)
  {
    float v9 = 0;
    goto LABEL_17;
  }
  float v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F55F48]), "initWithDevice:allocatorType:", objc_msgSend((id)-[CMISmartStyleProxyRenderer metalCommandQueue](smartStyleProxyRenderer, "metalCommandQueue"), "device"), objc_msgSend(v8, "allocatorType"));
  if (!v9)
  {
LABEL_17:
    float v10 = 0;
    goto LABEL_18;
  }
  float v10 = objc_opt_new();
  if (!v10)
  {
LABEL_18:
    CFStringRef v13 = 0;
LABEL_19:
    int v14 = -12786;
    goto LABEL_10;
  }
  objc_msgSend(v10, "setMemSize:", objc_msgSend(v8, "memSize"));
  [v10 setWireMemory:1];
  [v10 setLabel:@"BWOverCaptureSmartStyleApplyNode-SmartStyleProxyRenderer-FigMetalAllocatorBackend"];
  objc_msgSend(v10, "setMemoryPoolId:", -[BWMemoryPool poolIdentifier](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "poolIdentifier"));
  int v11 = [v9 setupWithDescriptor:v10];
  if (v11)
  {
    int v14 = v11;
    CFStringRef v13 = 0;
    goto LABEL_10;
  }
  size_t v12 = objc_opt_new();
  CFStringRef v13 = v12;
  if (!v12) {
    goto LABEL_19;
  }
  [v12 setAllocatorBackend:v9];
  [(CMISmartStyleProxyRenderer *)smartStyleProxyRenderer setExternalMemoryResource:v13];
  int v14 = 0;
LABEL_10:

  if (v14) {
    goto LABEL_23;
  }
  int v15 = [(CMISmartStyleProxyRenderer *)self->_smartStyleProxyRenderer setup];
  if (v15)
  {
    int v14 = v15;
    fig_log_get_emitter();
LABEL_24:
    FigDebugAssert3();
    goto LABEL_25;
  }
  int v14 = [(CMISmartStyleProxyRenderer *)self->_smartStyleProxyRenderer prewarm];
  if (v14)
  {
LABEL_23:
    fig_log_get_emitter();
    goto LABEL_24;
  }
  self->_smartStyleRenderingMethod = 2;
  return v14;
}

- (void)_updateCurrentStyle:(opaqueCMSampleBuffer *)a3
{
  uint64_t v4 = objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F534C8]);
  if (v4)
  {
    id v5 = +[FigCaptureSmartStyle createFromDictionary:v4];
    if (v5)
    {
      double v6 = v5;
      currentStyle = self->_currentStyle;
      if (!currentStyle) {
        currentStyle = (CMISmartStyle *)objc_alloc_init(self->_smartStyleClass);
      }
      self->_currentStyle = currentStyle;
      -[CMISmartStyle setCastType:](self->_currentStyle, "setCastType:", [v6 cast]);
      [v6 intensity];
      -[CMISmartStyle setCastIntensity:](self->_currentStyle, "setCastIntensity:");
      [v6 toneBias];
      -[CMISmartStyle setToneBias:](self->_currentStyle, "setToneBias:");
      [v6 colorBias];
      id v8 = self->_currentStyle;
      -[CMISmartStyle setColorBias:](v8, "setColorBias:");
    }
  }
}

- (int)_renderSmartStyleToIntermediateBufferWithInputSampleBuffer:(opaqueCMSampleBuffer *)a3 pipSourcePixelBuffer:(__CVBuffer *)a4 inputRect:(CGRect)a5 outputRect:(CGRect)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  v36[1] = *MEMORY[0x1E4F143B8];
  if (a6.size.width >= a6.size.height) {
    double v12 = a6.size.width;
  }
  else {
    double v12 = a6.size.height;
  }
  if (a5.size.width >= a5.size.height) {
    double v13 = a5.size.width;
  }
  else {
    double v13 = a5.size.height;
  }
  double v14 = v12 / v13;
  unint64_t v15 = vcvtpd_u64_f64(a5.size.width * v14);
  unint64_t v16 = vcvtpd_u64_f64(a5.size.height * v14);
  smartStyleIntermediateUnstyled = self->_smartStyleIntermediateUnstyled;
  BOOL v18 = &OBJC_IVAR___BWStillImageFilterNode__renderList;
  if (!smartStyleIntermediateUnstyled || !self->_smartStyleIntermediateStyled) {
    goto LABEL_20;
  }
  size_t v19 = CVPixelBufferGetWidth(smartStyleIntermediateUnstyled);
  size_t v20 = CVPixelBufferGetHeight(self->_smartStyleIntermediateUnstyled);
  float v21 = self->_smartStyleIntermediateUnstyled;
  if (v19 > ((v15 + 15) & 0xFFFFFFFFFFFFFFF0) || v20 > ((v16 + 15) & 0xFFFFFFFFFFFFFFF0))
  {
    if (v21)
    {
      CFRelease(v21);
      self->_smartStyleIntermediateUnstyled = 0;
    }
    smartStyleIntermediateStyled = self->_smartStyleIntermediateStyled;
    BOOL v18 = &OBJC_IVAR___BWStillImageFilterNode__renderList;
    if (!smartStyleIntermediateStyled) {
      goto LABEL_20;
    }
    CFRelease(smartStyleIntermediateStyled);
    self->_smartStyleIntermediateStyled = 0;
    float v21 = self->_smartStyleIntermediateUnstyled;
  }
  BOOL v18 = &OBJC_IVAR___BWStillImageFilterNode__renderList;
  if (!v21 || (LODWORD(v24) = 352, !self->_smartStyleIntermediateStyled))
  {
LABEL_20:
    float v25 = v18;
    CVPixelBufferGetPixelFormatType(a4);
    self->_smartStyleIntermediateUnstyled = (__CVBuffer *)CreatePixelBuffer();
    PixelBuffer = (objc_class *)CreatePixelBuffer();
    uint64_t v24 = v25[605];
    *(Class *)((char *)&self->super.super.isa + v24) = PixelBuffer;
    CVBufferPropagateAttachments(a4, self->_smartStyleIntermediateUnstyled);
    CVBufferPropagateAttachments(a4, *(CVBufferRef *)((char *)&self->super.super.isa + v24));
    float v21 = self->_smartStyleIntermediateUnstyled;
  }
  self->_smartStyleIntermediateROI.origin.double x = 0.0;
  self->_smartStyleIntermediateROI.origin.double y = 0.0;
  self->_smartStyleIntermediateROI.size.double width = (double)v15;
  self->_smartStyleIntermediateROI.size.double height = (double)v16;
  double v27 = ss_conformRectForMSR420vfPixelBuffer(v21, 1, 0.0, 0.0, (double)v15, (double)v16);
  self->_smartStyleIntermediateROI.origin.double x = v27;
  self->_smartStyleIntermediateROI.origin.double y = v28;
  self->_smartStyleIntermediateROI.size.double width = v29;
  self->_smartStyleIntermediateROI.size.double height = v30;
  -[BWScalingSession scalePixelBuffer:rect:intoPixelBuffer:rect:](self->_scalingSession, "scalePixelBuffer:rect:intoPixelBuffer:rect:", a4, self->_smartStyleIntermediateUnstyled, x, y, width, height, v27, v28, v29, v30);
  [(BWVideoPIPOverlayNode *)self _updateCurrentStyle:a3];
  if (!self->_currentStyle) {
    return 0;
  }
  int smartStyleRenderingMethod = self->_smartStyleRenderingMethod;
  if (smartStyleRenderingMethod == 2)
  {
    int v32 = [(CMISmartStyleProxyRenderer *)self->_smartStyleProxyRenderer prepareToProcess:1];
    if (!v32) {
      goto LABEL_30;
    }
    goto LABEL_28;
  }
  if (smartStyleRenderingMethod == 3)
  {
    int v32 = [(CMISmartStyleProxyRenderer *)self->_smartStyleProxyRenderer prepareToProcess:2];
    if (!v32)
    {
LABEL_30:
      v36[0] = self->_currentStyle;
      -[CMISmartStyleProxyRenderer setInputStyles:](self->_smartStyleProxyRenderer, "setInputStyles:", [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1]);
      [(CMISmartStyleProxyRenderer *)self->_smartStyleProxyRenderer setInputPixelBuffer:self->_smartStyleIntermediateUnstyled];
      [(CMISmartStyleProxyRenderer *)self->_smartStyleProxyRenderer setOutputPixelBuffer:*(Class *)((char *)&self->super.super.isa + (int)v24)];
      [(CMISmartStyleProxyRenderer *)self->_smartStyleProxyRenderer setInputMetadata:CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0)];
      int v33 = [(CMISmartStyleProxyRenderer *)self->_smartStyleProxyRenderer process];
      if (v33)
      {
        int smartStyleRenderingMethod = v33;
        fig_log_get_emitter();
      }
      else
      {
        int smartStyleRenderingMethod = [(CMISmartStyleProxyRenderer *)self->_smartStyleProxyRenderer finishProcessing];
        if (!smartStyleRenderingMethod) {
          return smartStyleRenderingMethod;
        }
        fig_log_get_emitter();
      }
      goto LABEL_26;
    }
LABEL_28:
    int smartStyleRenderingMethod = v32;
    fig_log_get_emitter();
    goto LABEL_26;
  }
  if (smartStyleRenderingMethod)
  {
    fig_log_get_emitter();
    int smartStyleRenderingMethod = -12782;
LABEL_26:
    FigDebugAssert3();
  }
  return smartStyleRenderingMethod;
}

- (BOOL)releasesResourcesAtEndOfData
{
  return self->_releasesResourcesAtEndOfData;
}

- (void)setReleasesResourcesAtEndOfData:(BOOL)a3
{
  self->_releasesResourcesAtEndOfData = a3;
}

- (BOOL)smartStyleRenderingEnabled
{
  return self->_smartStyleRenderingEnabled;
}

@end