@interface BWPreviewStabilizationNode
+ (void)initialize;
- (BWPreviewStabilizationNode)initWithCameraInfoByPortType:(id)a3 forStillImagePreview:(BOOL)a4 updateFinalCropRectWithStabilizationShift:(BOOL)a5;
- (id)nodeSubType;
- (id)nodeType;
- (void)dealloc;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWPreviewStabilizationNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
}

- (id)nodeType
{
  return @"Effect";
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  CFTypeRef v113 = 0;
  CMAttachmentBearerRef target = 0;
  uint64_t v7 = *MEMORY[0x1E4F52DF0];
  id v8 = -[NSDictionary objectForKeyedSubscript:](self->_staticParametersByPortType, "objectForKeyedSubscript:", *MEMORY[0x1E4F52DF0], a4);
  uint64_t v9 = *MEMORY[0x1E4F52C78];
  objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E4F52C78]), "floatValue");
  if (v10 == 0.0)
  {
    fig_log_get_emitter();
    uint64_t v100 = v4;
    LODWORD(v99) = 0;
LABEL_101:
    FigDebugAssert3();
    goto LABEL_92;
  }
  float v11 = v10;
  v12 = (void *)CMGetAttachment(a3, @"LastRecommendedMasterSelectionReason", 0);
  if (v12)
  {
    v13 = v12;
    self->_int lastRecommendedMasterSelectionReason = [v12 intValue];
    int lastRecommendedMasterSelectionReason = [v13 intValue];
  }
  else
  {
    int lastRecommendedMasterSelectionReason = self->_lastRecommendedMasterSelectionReason;
  }
  CFTypeRef v15 = CMGetAttachment(a3, @"RecommendedMasterPortType", 0);
  if (v15)
  {
    v16 = (void *)v15;

    self->_lastRecommendedMasterPortType = (NSString *)v16;
  }
  BWOverCaptureSampleBufferUnpackAndRetain(a3, 0, &target, &v113, 0, 0);
  v17 = (void *)v113;
  if (!v113) {
    goto LABEL_98;
  }
  if (target) {
    CMAttachmentBearerRef v18 = target;
  }
  else {
    CMAttachmentBearerRef v18 = v113;
  }
  v19 = (void *)CMGetAttachment(v18, @"TotalZoomFactor", 0);
  if (v19)
  {
    [v19 floatValue];
    float v21 = v20;
  }
  else
  {
    float v21 = 1.0;
  }
  BOOL isStillImagePreview = 0;
  if (target)
  {
    if (self->_stabilizeFallbackCamera && lastRecommendedMasterSelectionReason == 1)
    {
      BOOL isStillImagePreview = 0;
      if (![(NSString *)self->_lastRecommendedMasterPortType isEqualToString:v7] && v21 > v11)
      {
        BOOL isStillImagePreview = self->_isStillImagePreview;
        if (self->_isStillImagePreview) {
          v17 = (void *)target;
        }
      }
    }
  }
  CFStringRef key = (const __CFString *)*MEMORY[0x1E4F53070];
  v23 = (void *)CMGetAttachment(v17, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (!v23)
  {
LABEL_98:
    fig_log_get_emitter();
    uint64_t v100 = v4;
    LODWORD(v99) = 0;
    goto LABEL_101;
  }
  v24 = v23;
  uint64_t v104 = v9;
  int v102 = lastRecommendedMasterSelectionReason;
  uint64_t v25 = *MEMORY[0x1E4F54128];
  v26 = (void *)[v23 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
  id v27 = [(NSDictionary *)self->_staticParametersByPortType objectForKeyedSubscript:v26];
  objc_msgSend((id)objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E4F52D28]), "floatValue");
  int v29 = v28;
  float64x2_t v106 = *(float64x2_t *)MEMORY[0x1E4F1DAD8];
  float64x2_t v111 = *(float64x2_t *)MEMORY[0x1E4F1DAD8];
  ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v17);
  unsigned int Width = CVPixelBufferGetWidth(ImageBuffer);
  v32 = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v17);
  unsigned int Height = CVPixelBufferGetHeight(v32);
  int v105 = Width;
  LODWORD(v34) = v29;
  if ([(BWPreviewGyroStabilization *)self->_previewStabilization computeStabilizationShiftUsingMetadata:v24 pixelBufferDimensions:Width | ((unint64_t)Height << 32) pixelSizeInMicrons:&v111 stabilizationShiftOut:v34])
  {
    fig_log_get_emitter();
    uint64_t v100 = v4;
    LODWORD(v99) = 0;
    goto LABEL_101;
  }
  int v103 = Height;
  v35 = (void *)CMGetAttachment(a3, @"UIZoomFactor", 0);
  if (!v35)
  {
    [v26 isEqual:v7];
    float v37 = 1.0;
LABEL_31:
    if (self->_lastStabilizingEnabled && self->_enableStabilizationTransitionRamps)
    {
      float v40 = 1.0;
      if ([(BWRamp *)self->_stabilizationTransitionRamp isRamping])
      {
        [(BWRamp *)self->_stabilizationTransitionRamp currentValue];
        float v40 = v41;
        [(BWRamp *)self->_stabilizationTransitionRamp reset];
      }
      *(float *)&double v39 = v40;
      [(BWRamp *)self->_stabilizationTransitionRamp startRampFrom:self->_stabilizationExitRampFrameCount to:2 iterations:v39 shape:0.0];
    }
    if ([(BWRamp *)self->_stabilizationTransitionRamp isRamping])
    {
      [(BWRamp *)self->_stabilizationTransitionRamp updateRampForNextIteration];
      BOOL v42 = 0;
      float64x2_t v44 = vmulq_n_f64(v111, v43);
    }
    else
    {
      BOOL v42 = 0;
      float64x2_t v44 = v106;
    }
    float64x2_t v111 = v44;
    goto LABEL_47;
  }
  [v35 floatValue];
  float v37 = v36;
  char v38 = [v26 isEqual:v7];
  if (v37 < 5.0 || (v38 & 1) == 0 && (!self->_stabilizeFallbackCamera || v102 != 1)) {
    goto LABEL_31;
  }
  if (!self->_lastStabilizingEnabled && self->_enableStabilizationTransitionRamps)
  {
    int v47 = 0;
    if ([(BWRamp *)self->_stabilizationTransitionRamp isRamping])
    {
      [(BWRamp *)self->_stabilizationTransitionRamp currentValue];
      int v47 = v48;
      [(BWRamp *)self->_stabilizationTransitionRamp reset];
    }
    LODWORD(v46) = 1.0;
    LODWORD(v45) = v47;
    [(BWRamp *)self->_stabilizationTransitionRamp startRampFrom:self->_stabilizationEnterRampFrameCount to:2 iterations:v45 shape:v46];
  }
  if ([(BWRamp *)self->_stabilizationTransitionRamp isRamping])
  {
    [(BWRamp *)self->_stabilizationTransitionRamp updateRampForNextIteration];
    float64x2_t v111 = vmulq_n_f64(v111, v49);
  }
  BOOL v42 = 1;
LABEL_47:
  v50.x = v111.f64[0];
  if (self->_isStillImagePreview)
  {
    double v51 = (float)((float)(v37 + -5.0) / 0.2);
    if (v51 > 1.0) {
      double v51 = 1.0;
    }
    float v52 = fmax(v51, 0.0);
    double v53 = v52;
    v50.x = v111.f64[0] * v53;
    v111.f64[0] = v111.f64[0] * v53;
    v111.f64[1] = v111.f64[1] * v53;
    if (isStillImagePreview)
    {
      v54 = (void *)CMGetAttachment(v113, key, 0);
      v55 = (void *)CMGetAttachment(target, key, 0);
      BOOL v101 = v42;
      uint64_t v56 = [v54 objectForKeyedSubscript:v25];
      uint64_t v57 = [v55 objectForKeyedSubscript:v25];
      objc_msgSend((id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_staticParametersByPortType, "objectForKeyedSubscript:", v56), "objectForKeyedSubscript:", v104), "floatValue");
      double v59 = v58;
      uint64_t v60 = *MEMORY[0x1E4F540F0];
      objc_msgSend((id)objc_msgSend(v54, "objectForKeyedSubscript:", *MEMORY[0x1E4F540F0]), "floatValue");
      if (v61 == 0.0) {
        double v62 = 1.0;
      }
      else {
        double v62 = v61;
      }
      float v63 = v62 * v59;
      objc_msgSend((id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_staticParametersByPortType, "objectForKeyedSubscript:", v57), "objectForKeyedSubscript:", v104), "floatValue");
      double v65 = v64;
      uint64_t v66 = v60;
      BOOL v42 = v101;
      objc_msgSend((id)objc_msgSend(v55, "objectForKeyedSubscript:", v66), "floatValue");
      if (v67 == 0.0) {
        double v68 = 1.0;
      }
      else {
        double v68 = v67;
      }
      float v69 = v68 * v65;
      CGPoint v50 = (CGPoint)vmulq_n_f64(v111, (float)(v63 / v69));
      float64x2_t v111 = (float64x2_t)v50;
    }
    v70 = &OBJC_IVAR___BWStreamStartStopSynchronizer__timeoutInSeconds;
    if (self->_stabilizationCameraFallbackRampEnabled)
    {
      if (([v26 isEqualToString:self->_lastPortType] & 1) == 0
        && self->_stabilizeFallbackCamera
        && v102 == 1
        && v21 > v11
        && self->_isStillImagePreview)
      {
        if ([(BWRamp *)self->_stabilizationCameraFallbackRamp isRamping]) {
          [(BWRamp *)self->_stabilizationCameraFallbackRamp reset];
        }
        LODWORD(v71) = 1.0;
        [(BWRamp *)self->_stabilizationCameraFallbackRamp startRampFrom:self->_stabilizationCameraFallbackRampFrameCount to:0 iterations:0.0 shape:v71];
        self->_lastTranslationBeforeCameraFallbackRampStart = self->_appliedTranslation;
      }
      if ([(BWRamp *)self->_stabilizationCameraFallbackRamp isRamping])
      {
        [(BWRamp *)self->_stabilizationCameraFallbackRamp updateRampForNextIteration];
        CGPoint v50 = (CGPoint)vmlaq_n_f64(vmulq_n_f64(v111, v72), (float64x2_t)self->_lastTranslationBeforeCameraFallbackRampStart, 1.0 - v72);
        float64x2_t v111 = (float64x2_t)v50;
      }
      else
      {
        v50.x = v111.f64[0];
      }
    }
  }
  else
  {
    v70 = &OBJC_IVAR___BWStreamStartStopSynchronizer__timeoutInSeconds;
  }
  float64_t v73 = v111.f64[1];
  if (v50.x != *MEMORY[0x1E4F1DAD8] || v111.f64[1] != *(double *)(MEMORY[0x1E4F1DAD8] + 8))
  {
    if (self->_updateFinalCropRectWithStabilizationShift)
    {
      v74 = (void *)CMGetAttachment(v113, key, 0);
      CGRect rect = *(CGRect *)ymmword_1A5F0CC30;
      CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[v74 objectForKeyedSubscript:*MEMORY[0x1E4F53260]], &rect);
      BOOL v75 = v42;
      v76 = CMSampleBufferGetImageBuffer(a3);
      CGFloat v77 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      v109.origin.x = *(CGFloat *)MEMORY[0x1E4F1DB28];
      v109.origin.y = v77;
      v109.size.width = (double)CVPixelBufferGetWidth(v76);
      v109.size.height = (double)CVPixelBufferGetHeight(v76);
      CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[v74 objectForKeyedSubscript:*MEMORY[0x1E4F54370]], &v109);
      FigCaptureMetadataUtilitiesNormalizeCropRect(v109.origin.x, v109.origin.y, v109.size.width, v109.size.height);
      CGFloat v82 = v81;
      CGFloat v83 = v78;
      CGFloat v84 = v79;
      CGFloat v85 = v80;
      double v86 = rect.origin.x + v111.f64[0] / (float)v105;
      BOOL v42 = v75;
      double v87 = rect.origin.y + v111.f64[1] / (float)v103;
      rect.origin.x = v86;
      rect.origin.y = v87;
      double v88 = rect.size.width;
      if (v79 < rect.size.width) {
        double v88 = v79;
      }
      double v89 = fmax(v88, 0.0);
      if (v80 >= rect.size.height) {
        double v90 = rect.size.height;
      }
      else {
        double v90 = v80;
      }
      double v108 = fmax(v90, 0.0);
      CGFloat v91 = v82;
      double MinX = CGRectGetMinX(*(CGRect *)(&v78 - 1));
      v114.origin.x = v82;
      v114.origin.y = v83;
      v114.size.width = v84;
      v114.size.height = v85;
      double v93 = CGRectGetMaxX(v114) - v89;
      if (v93 >= v86) {
        double v93 = v86;
      }
      if (MinX < v93) {
        double MinX = v93;
      }
      v115.origin.x = v82;
      v115.origin.y = v83;
      v115.size.width = v84;
      v115.size.height = v85;
      double MinY = CGRectGetMinY(v115);
      v116.origin.x = v82;
      v116.origin.y = v83;
      v116.size.width = v84;
      v116.size.height = v85;
      double v95 = CGRectGetMaxY(v116) - v108;
      if (v95 >= v87) {
        double v95 = v87;
      }
      if (MinY >= v95) {
        CGFloat v96 = MinY;
      }
      else {
        CGFloat v96 = v95;
      }
      rect.origin.x = MinX;
      rect.origin.y = v96;
      rect.size.width = v89;
      rect.size.height = v108;
      FigCFDictionarySetCGRect();
    }
    else
    {
      CFDictionaryRef DictionaryRepresentation = CGPointCreateDictionaryRepresentation(v50);
      CMSetAttachment(v113, (CFStringRef)*MEMORY[0x1E4F530C8], DictionaryRepresentation, 1u);
      if (DictionaryRepresentation) {
        CFRelease(DictionaryRepresentation);
      }
    }
  }
  self->_lastStabilizingEnabled = v42;
  self->_appliedTranslation = (CGPoint)v111;
  uint64_t v98 = v70[848];

  *(Class *)((char *)&self->super.super.isa + v98) = (Class)v26;
LABEL_92:
  if (v113) {
    CFRelease(v113);
  }
  if (target) {
    CFRelease(target);
  }
  -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3, v99, v100);
}

- (BWPreviewStabilizationNode)initWithCameraInfoByPortType:(id)a3 forStillImagePreview:(BOOL)a4 updateFinalCropRectWithStabilizationShift:(BOOL)a5
{
  BOOL v6 = a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)BWPreviewStabilizationNode;
  id v8 = [(BWNode *)&v35 init];
  uint64_t v9 = v8;
  if (a3)
  {
    if (!v8) {
      return v9;
    }
    BOOL v28 = a5;
    BOOL v29 = v6;
    float v10 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v8];
    [(BWNodeInput *)v10 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeInput *)v10 setPassthroughMode:1];
    [(BWNode *)v9 addInput:v10];
    float v11 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v9];
    [(BWNodeOutput *)v11 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeOutput *)v11 setPassthroughMode:1];
    v30 = v9;
    [(BWNode *)v9 addOutput:v11];
    v12 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v13 = (void *)[a3 allKeys];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v32;
      uint64_t v17 = *MEMORY[0x1E4F52D28];
      uint64_t v18 = *MEMORY[0x1E4F52C78];
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v20 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          float v21 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
          uint64_t v22 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v20), "objectForKeyedSubscript:", v17);
          if (!v22
            || ([v21 setObject:v22 forKeyedSubscript:v17],
                (uint64_t v23 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v20), "objectForKeyedSubscript:", v18)) == 0))
          {
            fig_log_get_emitter();
            FigDebugAssert3();
            uint64_t v9 = v30;
            goto LABEL_15;
          }
          [v21 setObject:v23 forKeyedSubscript:v18];
          [v12 setObject:v21 forKeyedSubscript:v20];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
    v24 = [[BWPreviewGyroStabilization alloc] initForStillImagePreview:v29];
    uint64_t v9 = v30;
    v30->_previewStabilization = v24;
    if (v24)
    {
      v30->_staticParametersByPortType = (NSDictionary *)v12;
      v30->_updateFinalCropRectWithStabilizationShift = v28;
      v30->_stabilizeFallbackCamera = 1;
      v30->_stabilizationEnterRampFrameCount = 50;
      v30->_stabilizationExitRampFrameCount = 25;
      v30->_stabilizationCameraFallbackRampFrameCount = 7;
      v30->_enableStabilizationTransitionRamps = 1;
      v30->_stabilizationCameraFallbackRampEnabled = 1;
      uint64_t v25 = [BWRamp alloc];
      v30->_stabilizationTransitionRamp = -[BWRamp initWithName:](v25, "initWithName:", [NSString stringWithFormat:@"StabilizationTransitionRamp"]);
      v26 = [BWRamp alloc];
      v30->_stabilizationCameraFallbackRamp = -[BWRamp initWithName:](v26, "initWithName:", [NSString stringWithFormat:@"StabilizationCameraFallbackRamp"]);
      v30->_BOOL isStillImagePreview = v29;
      return v9;
    }
    fig_log_get_emitter();
  }
  else
  {
    fig_log_get_emitter();
  }
  FigDebugAssert3();
LABEL_15:

  return 0;
}

+ (void)initialize
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWPreviewStabilizationNode;
  [(BWNode *)&v3 dealloc];
}

- (id)nodeSubType
{
  return @"PreviewStabilization";
}

@end