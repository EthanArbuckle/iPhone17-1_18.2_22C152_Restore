@interface BWScalerProcessorController
+ (BOOL)usesCustomProcessingFlow;
- (BWScalerProcessorController)initWithConfiguration:(id)a3;
- (VTPixelTransferSessionRef)_ensurePixelTransferSessionForMediaKey:(uint64_t)a1;
- (id)requestForInput:(id)a3 delegate:(id)a4 errOut:(int *)a5;
- (int)prepare;
- (int)process;
- (uint64_t)_zoomSampleBuffer:(void *)a3 settings:(int)a4 applyZoom:(void *)a5 mediaKey:(uint64_t)a6 bufferType:(void *)a7 request:(CMAttachmentBearerRef *)a8 newZoomedSampleBufferOut:;
- (void)dealloc;
- (void)reset;
@end

@implementation BWScalerProcessorController

+ (BOOL)usesCustomProcessingFlow
{
  return 0;
}

- (BWScalerProcessorController)initWithConfiguration:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BWScalerProcessorController;
  v3 = [(BWStillImageProcessorController *)&v5 initWithName:@"ScalerPC" type:18 configuration:a3];
  if (v3)
  {
    v3->_pixelTransferSessionByMediaKey = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3->_formatDescriptionByMediaKey = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v3;
}

- (void)dealloc
{
  [(BWScalerProcessorController *)self reset];

  v3.receiver = self;
  v3.super_class = (Class)BWScalerProcessorController;
  [(BWStillImageProcessorController *)&v3 dealloc];
}

- (void)reset
{
  [(NSMutableDictionary *)self->_pixelTransferSessionByMediaKey removeAllObjects];
  formatDescriptionByMediaKey = self->_formatDescriptionByMediaKey;
  [(NSMutableDictionary *)formatDescriptionByMediaKey removeAllObjects];
}

- (id)requestForInput:(id)a3 delegate:(id)a4 errOut:(int *)a5
{
  v6 = [(BWStillImageProcessorControllerRequest *)[BWScalerProcessorControllerRequest alloc] initWithInput:a3 delegate:a4];
  if (v6) {
    int v7 = 0;
  }
  else {
    int v7 = -12786;
  }
  if (a5) {
    *a5 = v7;
  }
  return v6;
}

- (int)prepare
{
  return 0;
}

- (int)process
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  objc_super v3 = [(BWStillImageProcessorController *)self currentRequest];
  v4 = v3;
  if (!v3)
  {
    uint64_t v28 = v2;
    LODWORD(v27) = 0;
    FigDebugAssert3();
    uint64_t v24 = 0;
    v6 = 0;
LABEL_43:
    int v7 = 0;
    v18 = 0;
    uint64_t v25 = 4294954516;
    goto LABEL_39;
  }
  objc_super v5 = [(BWStillImageProcessorControllerRequest *)v3 input];
  v6 = v5;
  if (!v5)
  {
    uint64_t v24 = 0;
    goto LABEL_43;
  }
  if ([(BWStillImageProcessorControllerInput *)v5 frame])
  {
    if ([(BWStillImageProcessorControllerInput *)v6 bufferType])
    {
      uint64_t v29 = [(BWStillImageProcessorControllerInput *)v6 bufferType];
      int v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", -[BWStillImageProcessorControllerInput frame](v6, "frame"), @"PrimaryFormat", 0);
      v30 = (BWStillImageProcessorControllerInput *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v8 = BWSampleBufferCopyDictionaryOfAttachedMedia((const void *)[(BWStillImageProcessorControllerInput *)v6 frame]);
      [v7 addEntriesFromDictionary:v8];

      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      uint64_t v34 = [v7 countByEnumeratingWithState:&v42 objects:v47 count:16];
      if (v34)
      {
        uint64_t v31 = *(void *)v43;
        while (2)
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v43 != v31) {
              objc_enumerationMutation(v7);
            }
            v10 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            char v11 = objc_msgSend(v10, "isEqualToString:", @"PrimaryFormat", v27, v28);
            if (v11) {
              uint64_t v12 = 1;
            }
            else {
              uint64_t v12 = BWStillImageBufferTypeForAttachedMediaKey(v10);
            }
            v13 = (opaqueCMSampleBuffer *)[v7 objectForKeyedSubscript:v10];
            CFTypeRef cf = 0;
            unsigned int v14 = -[BWScalerProcessorController _zoomSampleBuffer:settings:applyZoom:mediaKey:bufferType:request:newZoomedSampleBufferOut:](self, v13, [(BWStillImageProcessorControllerInput *)v6 stillImageSettings], [(BWStillImageProcessorControllerInput *)v6 applyZoom], v10, v12, v4, &cf);
            if (v14)
            {
              unsigned int v33 = v14;
              int v40 = 0;
              os_log_type_t type = OS_LOG_TYPE_DEFAULT;
              os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
              if (v11)
              {
                uint64_t v28 = v2;
                LODWORD(v27) = 0;
                FigDebugAssert3();
                v18 = 0;
                uint64_t v24 = v29;
                v6 = v30;
                uint64_t v25 = v33;
                goto LABEL_39;
              }
            }
            else
            {
              if (cf) {
                CFTypeRef v16 = cf;
              }
              else {
                CFTypeRef v16 = v13;
              }
              [(BWStillImageProcessorControllerInput *)v30 setObject:v16 forKeyedSubscript:v10];
            }
            if (cf) {
              CFRelease(cf);
            }
          }
          uint64_t v34 = [v7 countByEnumeratingWithState:&v42 objects:v47 count:16];
          if (v34) {
            continue;
          }
          break;
        }
      }
      v6 = v30;
      v17 = (const void *)[(BWStillImageProcessorControllerInput *)v30 objectForKeyedSubscript:@"PrimaryFormat", v27];
      v18 = v17;
      if (v17)
      {
        BWSampleBufferRemoveAllAttachedMedia(v17);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        uint64_t v19 = [(BWStillImageProcessorControllerInput *)v30 countByEnumeratingWithState:&v35 objects:v46 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v36;
          do
          {
            for (uint64_t j = 0; j != v20; ++j)
            {
              if (*(void *)v36 != v21) {
                objc_enumerationMutation(v30);
              }
              v23 = *(void **)(*((void *)&v35 + 1) + 8 * j);
              if (([v23 isEqualToString:@"PrimaryFormat"] & 1) == 0) {
                BWSampleBufferSetAttachedMedia(v18, (uint64_t)v23, [(BWStillImageProcessorControllerInput *)v30 objectForKeyedSubscript:v23]);
              }
            }
            uint64_t v20 = [(BWStillImageProcessorControllerInput *)v30 countByEnumeratingWithState:&v35 objects:v46 count:16];
          }
          while (v20);
        }
        uint64_t v24 = v29;
        if (*MEMORY[0x1E4F1EBA8] == 1) {
          kdebug_trace();
        }
        uint64_t v25 = 0;
      }
      else
      {
        uint64_t v28 = v2;
        LODWORD(v27) = 0;
        FigDebugAssert3();
        uint64_t v25 = 4294954516;
        uint64_t v24 = v29;
      }
    }
    else
    {
      uint64_t v28 = v2;
      LODWORD(v27) = 0;
      FigDebugAssert3();
      uint64_t v24 = 0;
      v6 = 0;
      int v7 = 0;
      v18 = 0;
      uint64_t v25 = 4294894083;
    }
  }
  else
  {
    uint64_t v25 = 4294894082;
    uint64_t v28 = v2;
    LODWORD(v27) = 0;
    FigDebugAssert3();
    uint64_t v24 = 0;
    v6 = 0;
    int v7 = 0;
    v18 = 0;
  }
LABEL_39:
  [(BWStillImageProcessorControllerDelegate *)[(BWStillImageProcessorControllerRequest *)v4 delegate] processorController:self didFinishProcessingSampleBuffer:v18 type:v24 processorInput:[(BWStillImageProcessorControllerRequest *)v4 input] err:v25];

  [(BWScalerProcessorController *)self reset];
  return v25;
}

- (uint64_t)_zoomSampleBuffer:(void *)a3 settings:(int)a4 applyZoom:(void *)a5 mediaKey:(uint64_t)a6 bufferType:(void *)a7 request:(CMAttachmentBearerRef *)a8 newZoomedSampleBufferOut:
{
  target[25] = *(CMAttachmentBearerRef *)MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  CFTypeRef cf = 0;
  target[0] = 0;
  int v13 = [a5 isEqualToString:@"PrimaryFormat"];
  uint64_t v14 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "configuration"), "mainImageDownscalingFactorByAttachedMediaKey"), "objectForKeyedSubscript:", a5);
  v15 = (void *)v14;
  if ((v13 & 1) != 0 || v14)
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(a2);
    if (!ImageBuffer)
    {
      uint64_t v82 = 4294894082;
      FigDebugAssert3();
      v70 = 0;
      goto LABEL_66;
    }
    uint64_t v104 = (uint64_t)a1;
    v95 = ImageBuffer;
    int64_t v17 = psn_pixelBufferDimensions(ImageBuffer);
    if (!CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0))
    {
      FigDebugAssert3();
      v70 = 0;
      uint64_t v82 = 4294894083;
      goto LABEL_66;
    }
    v18 = (void *)[a3 requestedSettings];
    float v19 = 1.0;
    if ((v13 & 1) == 0)
    {
      [v15 floatValue];
      float v19 = v20;
    }
    uint64_t v21 = (int)(float)((float)[v18 outputWidth] / v19);
    uint64_t v96 = (int)(float)((float)[v18 outputHeight] / v19);
    uint64_t v97 = v21;
    double v22 = (double)(int)v21;
    double v23 = (double)(int)v96;
    if (a4)
    {
      double FinalCropRect = FigCaptureMetadataUtilitiesGetFinalCropRect();
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      CGFloat v30 = v29;
    }
    else
    {
      CGFloat v28 = 1.0;
      double FinalCropRect = 0.0;
      CGFloat v26 = 0.0;
      CGFloat v30 = 1.0;
    }
    double v100 = v30;
    double v101 = v26;
    double v87 = v22 / v23;
    if (v13) {
      FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect((int)v17, v17 >> 32, FinalCropRect, v26, v28, v30, v22 / v23);
    }
    else {
      double v31 = FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRectForAttachedMedia((int)v17, v17 >> 32, FinalCropRect, v26, v28, v30, v22 / v23, (double)(int)[v15 intValue]);
    }
    double v35 = v31;
    double v36 = v32;
    double v37 = v33;
    double v38 = v34;
    if (CGRectIsNull(*(CGRect *)&v31))
    {
      FigDebugAssert3();
      v70 = 0;
      uint64_t v82 = 4294954516;
      goto LABEL_66;
    }
    double v93 = (double)(int)v21;
    v102 = a2;
    LODWORD(a2) = llround(v37);
    LODWORD(v21) = llround(v38);
    FigCaptureMetadataUtilitiesDenormalizeCropRect(FinalCropRect, v101, v28, v100);
    v105 = a5;
    if (!a4 || ((v41 = vabdd_f64(v40, v38), vabdd_f64(v39, v37) <= 2.0) ? (BOOL v42 = v41 <= 2.0) : (BOOL v42 = 0), v42))
    {
      int v94 = 0;
    }
    else
    {
      FigCaptureMetadataUtilitiesNormalizeCropRect(v35, v36, v37, v38);
      int v94 = 1;
    }
    BOOL v98 = FigCaptureVideoDimensionsAreEqual(v17, (unint64_t)a2 | (v21 << 32));
    uint64_t v43 = v97 | (v96 << 32);
    BOOL v44 = FigCaptureVideoDimensionsAreEqual(v17, v43);
    BOOL v45 = FigCaptureVideoDimensionsAreEqual((unint64_t)a2 | (v21 << 32), v43);
    BOOL v46 = (llround(v35) & 1) == 0 && ((llround(v36) | a2) & 1) == 0 && (v21 & 1) == 0;
    uint64_t v47 = a6;
    BOOL v48 = [v18 outputFormat] == 1785750887
       || [v18 outputFormat] == 1752589105;
    BOOL v49 = FigCapturePixelFormatIsDemosaicedRaw([v18 rawOutputFormat])
       && [v18 outputFormat] == 0;
    int v50 = 0;
    if (v48 || v49)
    {
      uint64_t v51 = v47;
      if (a4)
      {
        if (v98) {
          int v50 = v44;
        }
        else {
          int v50 = v45 && v46;
        }
      }
    }
    else
    {
      uint64_t v51 = v47;
    }
    v52 = (void *)[a7 delegate];
    uint64_t v53 = [a7 input];
    uint64_t v54 = v51;
    if ((v13 & 1) == 0) {
      uint64_t v54 = BWStillImageBufferTypeForAttachedMediaKey(v105);
    }
    unint64_t v55 = [v52 processorController:v104 outputPixelBufferDimensionsForProcessorInput:v53 type:v54 attachedMediaKey:v105];
    uint64_t v56 = v55;
    unint64_t v99 = HIDWORD(v55);
    if ((a4 & (v50 ^ 1) & 1) == 0 && (int)v17 <= (int)v55 && SHIDWORD(v17) <= SHIDWORD(v55))
    {
      v70 = 0;
      uint64_t v82 = 0;
      goto LABEL_66;
    }
    VTPixelTransferSessionRef v57 = -[BWScalerProcessorController _ensurePixelTransferSessionForMediaKey:](v104, (uint64_t)v105);
    if (v57)
    {
      v58 = v57;
      uint64_t v59 = [a7 delegate];
      uint64_t v60 = [a7 input];
      if ((v13 & 1) == 0) {
        uint64_t v51 = BWStillImageBufferTypeForAttachedMediaKey(v105);
      }
      v61 = (void *)v59;
      v62 = (id *)v104;
      uint64_t v63 = [v61 processorController:v104 newOutputPixelBufferForProcessorInput:v60 type:v51 attachedMediaKey:v105];
      if (!v63)
      {
        v70 = 0;
        uint64_t v82 = 4294954510;
        goto LABEL_66;
      }
      v64 = (__CVBuffer *)v63;
      double v65 = *MEMORY[0x1E4F1DB20];
      CGFloat v66 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      CGFloat v67 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      double v68 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      BOOL v69 = FigCaptureVideoDimensionsAreEqual(v43, v56);
      CGFloat v91 = v66;
      CGFloat v92 = v65;
      CGFloat v89 = v68;
      CGFloat v90 = v67;
      v70 = v64;
      if (!v69)
      {
        if ((int)v56 < (int)v97 || (int)v99 < (int)v96)
        {
          uint64_t v82 = 4294954516;
          goto LABEL_66;
        }
        double v65 = 0.0;
        CGFloat v66 = 0.0;
        double v68 = (double)(int)v96;
        CGFloat v67 = v93;
        if ((a4 & 1) == 0)
        {
          float v72 = v87;
          double v65 = FigCaptureMetadataUtilitiesRectByCroppingRectToAspectRatio(0.0, 0.0, (double)(int)v56, (double)(int)v99, v72);
          CGFloat v66 = v73;
          CGFloat v67 = v74;
          double v68 = v75;
        }
      }
      if (dword_1EB4C5590)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v62 = (id *)v104;
        v70 = v64;
      }
      uint64_t v77 = BWScalePixelBuffer(v95, v70, v58, v35, v36, v37, v38, v65, v66, v67, v68);
      if (v77)
      {
        uint64_t v82 = v77;
        goto LABEL_66;
      }
      CFTypeRef cf = (id)[v62[8] objectForKeyedSubscript:v105];
      uint64_t v78 = BWCMSampleBufferCreateCopyWithNewPixelBuffer(v102, v70, &cf, (CMSampleBufferRef *)target);
      if (v78)
      {
        uint64_t v82 = v78;
        FigDebugAssert3();
        goto LABEL_66;
      }
      [v62[8] setObject:cf forKeyedSubscript:v105];
      id v79 = BWCMSampleBufferCopyReattachAndReturnMutableMetadata(target[0]);
      CVBufferRemoveAttachment(v70, (CFStringRef)*MEMORY[0x1E4F24A78]);
      if (v94) {
        FigCFDictionarySetCGRect();
      }
      FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v79, v17, v56, v35, v36, v37, v38, v65, v66, v67, v68);
      FigCaptureMetadataUtilitiesUpdateMetadataForNewFinalDimensions((uint64_t)v79, v17, v56);
      if (a4)
      {
        v110.origin.x = v65;
        v110.origin.y = v66;
        v110.size.width = v67;
        v110.size.height = v68;
        v111.origin.y = v91;
        v111.origin.x = v92;
        v111.size.height = v89;
        v111.size.width = v90;
        if (CGRectEqualToRect(v110, v111)) {
          FigCaptureMetadataUtilitiesPreventFurtherCropping(v79, v80);
        }
      }
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v62, "configuration", v85, v86), "memoryAnalyticsPayload"), "setScaledStillCaptureTaken:", 1);
      if (CMGetAttachment(target[0], @"OriginalCameraIntrinsicMatrixReferenceDimensions", 0))
      {
        v109.width = (double)(int)v56;
        v109.height = (double)(int)v99;
        CFDictionaryRef v81 = CGSizeCreateDictionaryRepresentation(v109);
        CMSetAttachment(target[0], @"OriginalCameraIntrinsicMatrixReferenceDimensions", v81, 1u);
        BWUpdateCameraIntrinsicsMatrixOnSampleBuffer(target[0], @"OriginalCameraIntrinsicMatrix", 0, 0, v35, v36, v37, v38, v65, v66, v67, v68);
      }
      goto LABEL_65;
    }
    FigDebugAssert3();
  }
  v70 = 0;
LABEL_65:
  uint64_t v82 = 0;
LABEL_66:
  if (dword_1EB4C5590)
  {
    v83 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v82)
  {
    if (target[0]) {
      CFRelease(target[0]);
    }
  }
  else if (a8)
  {
    *a8 = target[0];
  }
  CVPixelBufferRelease(v70);
  if (cf) {
    CFRelease(cf);
  }
  return v82;
}

- (VTPixelTransferSessionRef)_ensurePixelTransferSessionForMediaKey:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  v4 = (OpaqueVTPixelTransferSession *)[*(id *)(a1 + 56) objectForKeyedSubscript:a2];
  VTPixelTransferSessionRef pixelTransferSessionOut = v4;
  if (!v4)
  {
    OSStatus v5 = VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &pixelTransferSessionOut);
    v4 = pixelTransferSessionOut;
    if (!v5)
    {
      [*(id *)(a1 + 56) setObject:pixelTransferSessionOut forKeyedSubscript:a2];
      if (pixelTransferSessionOut)
      {
        CFRelease(pixelTransferSessionOut);
        return pixelTransferSessionOut;
      }
      else
      {
        return 0;
      }
    }
  }
  return v4;
}

@end