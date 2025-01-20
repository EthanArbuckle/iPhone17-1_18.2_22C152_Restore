@interface BWDeepZoomInferenceProvider
+ (void)initialize;
- (BWDeepZoomInferenceProvider)initWithConfiguration:(id)a3 resourceProvider:(id)a4;
- (int)createInputTiles:(id)a3 withInputs:(id)a4 atPosition:(id *)a5 cmdBuffer:;
- (int)preProcessOutputBuffer:(__CVBuffer *)a3 forMediaKey:(id)a4;
- (int)prepareForSubmissionWithWorkQueue:(id)a3;
- (int)prewarmUsingLimitedMemory:(BOOL)a3;
- (int)propagateInferenceResultForOutputRequirement:(id)a3 storage:(id)a4 propagationSampleBuffer:(opaqueCMSampleBuffer *)a5;
- (int)purgeIntermediateResources;
- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7;
- (int)writeOutputFor:(id)a3 to:(__CVBuffer *)a4 fromNetworkOutputTiles:(id)a5 withAdditionalPixelBuffers:(id)a6 withInputTilePixelBuffers:(id)a7 withInputFullPixelBuffers:(id)a8 atPosition:(id *)a9 cmdBuffer:;
- (uint64_t)_tuningParametersForPortType:(uint64_t)result;
- (unsigned)allowedPixelBufferCompressionDirection;
- (void)dealloc;
@end

@implementation BWDeepZoomInferenceProvider

+ (void)initialize
{
}

- (BWDeepZoomInferenceProvider)initWithConfiguration:(id)a3 resourceProvider:(id)a4
{
  v37[1] = *MEMORY[0x1E4F143B8];
  if (!a3
    || ![a3 version]
    || ![a3 tuningParameters]
    || [a3 type] != 1
    && [a3 type] != 2
    && [a3 type] != 3)
  {
    id v20 = 0;
    p_super = 0;
    v7 = 0;
    goto LABEL_41;
  }
  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v7) {
    goto LABEL_40;
  }
  v8 = [[BWInferenceLazyVideoRequirement alloc] initWithAttachedMediaKey:@"PrimaryFormat" preparedByAttachedMediaKey:@"PrimaryFormat" videoFormatProvider:&__block_literal_global_121];
  if (!v8) {
    goto LABEL_40;
  }
  [(NSMutableArray *)v7 addObject:v8];
  if ([a3 type] != 3) {
    goto LABEL_19;
  }
  v9 = [[BWInferenceLazyVideoRequirement alloc] initWithAttachedMediaKey:0x1EFA6A660 preparedByAttachedMediaKey:0x1EFA6A660 videoFormatProvider:&__block_literal_global_5_0];
  if (!v9)
  {
LABEL_40:
    id v20 = 0;
    p_super = 0;
    goto LABEL_41;
  }
  [(NSMutableArray *)v7 addObject:v9];
  if (FigCaptureVideoDimensionsAreValid([a3 stereoPhotoOutputDimensions]))
  {
    int v10 = [a3 type];
    v11 = @"Lite";
    if (v10 == 2) {
      v11 = @"Standard";
    }
    if (v10 == 3) {
      v12 = @"Transfer";
    }
    else {
      v12 = v11;
    }
    v13 = (void *)[a3 tuningParameters];
    uint64_t v14 = *MEMORY[0x1E4F52DE8];
    if (!objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E4F52DE8]), "objectForKeyedSubscript:", v12))
    {
      v15 = objc_msgSend((id)objc_msgSend(a3, "tuningParameters"), "mutableCopy");
      v16 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", v14), "mutableCopy");
      v17 = (void *)[a3 tuningParameters];
      objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E4F52DD8]), "objectForKeyedSubscript:", v12), v12);
      [v15 setObject:v16 forKeyedSubscript:v14];
      [a3 setTuningParameters:v15];
    }
  }
LABEL_19:
  v18 = -[BWInferenceLazyVideoRequirement initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:]([BWInferenceLazyVideoRequirement alloc], "initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:", [a3 outputAttachedMediaKey], objc_msgSend(a3, "outputAttachedMediaKey"), &__block_literal_global_7_0);
  p_super = &v18->super;
  if (v18
    && (v37[0] = v18,
        v35.receiver = self,
        v35.super_class = (Class)BWDeepZoomInferenceProvider,
        (self = -[BWTiledEspressoInferenceProvider initWithConfiguration:inputVideoRequirements:outputVideoRequirements:resourceProvider:](&v35, sel_initWithConfiguration_inputVideoRequirements_outputVideoRequirements_resourceProvider_, a3, v7, [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1], a4)) != 0)&& BWLoadProcessorBundle(@"SuperResolution", objc_msgSend(a3, "version")))
  {
    id v20 = objc_alloc_init(NSClassFromString((NSString *)objc_msgSend(NSString, "stringWithFormat:", @"CMIDeepZoomProcessorV%d", objc_msgSend(a3, "version"))));
    if (v20)
    {
      objc_msgSend(v20, "setTuningParameters:", objc_msgSend(a3, "tuningParameters"));
      objc_msgSend(v20, "setMetalCommandQueue:", objc_msgSend(a3, "metalCommandQueue"));
      int v21 = [a3 type];
      int v22 = [a3 mode];
      if (v21 == 3)
      {
        unsigned int v24 = v22 == 5 ? 5 : 3;
        uint64_t v23 = v22 == 4 ? 4 : v24;
      }
      else
      {
        uint64_t v23 = v21 == 2 ? 2 : 1;
      }
      if (![v20 prepareToProcess:v23])
      {
        self->_inputVideoRequirements = v7;
        self->_outputVideoRequirement = p_super;
        self->_deepZoomProcessor = (CMIDeepZoomProcessor *)v20;
        self->_inferenceConfig = (BWDeepZoomInferenceConfiguration *)a3;
        v25 = [(BWVideoFormat *)[(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)p_super videoFormat] underlyingVideoFormat] formatDescription];
        if (v25) {
          v25 = (opaqueCMFormatDescription *)CFRetain(v25);
        }
        self->_outputFormatDescription = v25;
        return self;
      }
    }
  }
  else
  {
    id v20 = 0;
  }
LABEL_41:

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v27 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v32 != v29) {
          objc_enumerationMutation(v7);
        }
      }
      uint64_t v28 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v28);
  }

  return 0;
}

id __70__BWDeepZoomInferenceProvider_initWithConfiguration_resourceProvider___block_invoke(uint64_t a1, void *a2)
{
  LOWORD(v5) = [a2 width];
  HIWORD(v5) = [a2 height];
  uint64_t v3 = [a2 pixelFormat];
  return +[BWTiledEspressoInferenceProvider videoFormatWithPixelFormat:v3 size:v5 includesInvalidContent:1];
}

id __70__BWDeepZoomInferenceProvider_initWithConfiguration_resourceProvider___block_invoke_2(uint64_t a1, void *a2)
{
  LOWORD(v5) = [a2 width];
  HIWORD(v5) = [a2 height];
  uint64_t v3 = [a2 pixelFormat];
  return +[BWTiledEspressoInferenceProvider videoFormatWithPixelFormat:v3 size:v5 includesInvalidContent:0];
}

id __70__BWDeepZoomInferenceProvider_initWithConfiguration_resourceProvider___block_invoke_3(uint64_t a1, void *a2)
{
  LOWORD(v5) = [a2 width];
  HIWORD(v5) = [a2 height];
  uint64_t v3 = [a2 pixelFormat];
  return +[BWTiledEspressoInferenceProvider videoFormatWithPixelFormat:v3 size:v5 includesInvalidContent:1];
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  inputVideoRequirements = self->_inputVideoRequirements;
  uint64_t v4 = [(NSMutableArray *)inputVideoRequirements countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(inputVideoRequirements);
        }
      }
      uint64_t v5 = [(NSMutableArray *)inputVideoRequirements countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription) {
    CFRelease(outputFormatDescription);
  }
  v9.receiver = self;
  v9.super_class = (Class)BWDeepZoomInferenceProvider;
  [(BWTiledEspressoInferenceProvider *)&v9 dealloc];
}

- (unsigned)allowedPixelBufferCompressionDirection
{
  if ([(BWDeepZoomInferenceConfiguration *)self->_inferenceConfig type] == 3) {
    return 3;
  }
  else {
    return 0;
  }
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7
{
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  [(CMIDeepZoomProcessor *)self->_deepZoomProcessor finishProcessing];
  if (!a3) {
    goto LABEL_52;
  }
  CFTypeRef v10 = CMGetAttachment(a3, @"StillSettings", 0);
  if (!v10) {
    goto LABEL_59;
  }
  long long v11 = (void *)v10;
  int v127 = BWStillImageProcessingFlagsForSampleBuffer(a3);
  CFStringRef v12 = (const __CFString *)*MEMORY[0x1E4F53070];
  CFTypeRef v13 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (!v13) {
    goto LABEL_52;
  }
  uint64_t v14 = (void *)v13;
  [(CMIDeepZoomProcessor *)self->_deepZoomProcessor resetMetadata];
  [(CMIDeepZoomProcessor *)self->_deepZoomProcessor updateMetadata:v14 forInputFullPixelBuffer:CMSampleBufferGetImageBuffer(a3)];
  double FinalCropRect = FigCaptureMetadataUtilitiesGetFinalCropRect();
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  int v22 = [(BWDeepZoomInferenceConfiguration *)self->_inferenceConfig type];
  AttachedMedia = a3;
  if (v22 == 3)
  {
    AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1EFA6A660);
    if (!AttachedMedia) {
      goto LABEL_59;
    }
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
  if (!ImageBuffer)
  {
LABEL_59:
    uint64_t v36 = 4294935584;
    int v39 = -31712;
    goto LABEL_54;
  }
  CFStringRef key = v12;
  unint64_t v25 = psn_pixelBufferDimensions(ImageBuffer);
  self->_inputReferencePixelBufferDimensions = ($470D365275581EF16070F5A11344F73E)v25;
  if (!FigCaptureVideoDimensionsAreValid(v25))
  {
    uint64_t v36 = 4294935585;
    int v39 = -31711;
    goto LABEL_54;
  }
  unsigned int v26 = objc_msgSend((id)objc_msgSend(v11, "requestedSettings"), "outputWidth");
  LODWORD(v27) = objc_msgSend((id)objc_msgSend(v11, "requestedSettings"), "outputHeight");
  id v120 = a6;
  if ((v127 & 0x100000) != 0)
  {
    unsigned int v26 = [(BWDeepZoomInferenceConfiguration *)self->_inferenceConfig stereoPhotoOutputDimensions];
    unint64_t v27 = (unint64_t)[(BWDeepZoomInferenceConfiguration *)self->_inferenceConfig stereoPhotoOutputDimensions] >> 32;
  }
  double v28 = (double)v26;
  double v29 = (double)v27;
  double v30 = (double)v26 / (double)v27;
  p_denormalizedSourceCropRect = (float64x2_t *)&self->_denormalizedSourceCropRect;
  FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect(self->_inputReferencePixelBufferDimensions.width, self->_inputReferencePixelBufferDimensions.height, FinalCropRect, v17, v19, v21, v30);
  self->_denormalizedSourceCropRect.origin.x = v35;
  self->_denormalizedSourceCropRect.origin.y = v32;
  self->_denormalizedSourceCropRect.size.width = v33;
  self->_denormalizedSourceCropRect.size.height = v34;
  uint64_t v36 = 4294935586;
  if (v35 < 0.0) {
    goto LABEL_53;
  }
  if (v32 < 0.0) {
    goto LABEL_53;
  }
  double v37 = v33;
  if (v33 <= 0.0) {
    goto LABEL_53;
  }
  double v38 = v34;
  int v39 = -31710;
  if (v34 > 0.0)
  {
    uint64_t v40 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
    if (v40)
    {
      uint64_t v41 = v40;
      if (![(NSDictionary *)[(BWInferenceConfiguration *)self->_inferenceConfig tuningParameters] objectForKeyedSubscript:v40])goto LABEL_53; {
      v42 = (void *)-[BWDeepZoomInferenceProvider _tuningParametersForPortType:]((uint64_t)self, v41);
      }
      if (!v42) {
        goto LABEL_53;
      }
      v43 = v42;
      objc_msgSend((id)objc_msgSend(v42, "objectForKeyedSubscript:", @"MinScaleFactor"), "floatValue");
      float v45 = v44;
      objc_msgSend((id)objc_msgSend(v43, "objectForKeyedSubscript:", @"MaxScaleFactor"), "floatValue");
      float v47 = v46;
      if ((objc_msgSend((id)objc_msgSend(v11, "captureSettings"), "captureFlags") & 0x10) != 0
        && [v43 objectForKeyedSubscript:@"QSub"])
      {
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v43, "objectForKeyedSubscript:", @"QSub"), "objectForKeyedSubscript:", @"MinScaleFactor"), "floatValue");
        float v45 = v48;
      }
      if (v45 < 1.0) {
        goto LABEL_53;
      }
      uint64_t v125 = v41;
      int v39 = -31710;
      if (v47 < v45) {
        goto LABEL_54;
      }
      if ([(BWDeepZoomInferenceConfiguration *)self->_inferenceConfig type] != 3) {
        goto LABEL_35;
      }
      v49 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1EFA6A660);
      if (!v49) {
        goto LABEL_54;
      }
      v50 = v49;
      CFTypeRef v51 = CMGetAttachment(v49, key, 0);
      if (!v51) {
        goto LABEL_53;
      }
      CFTypeRef v52 = v51;
      CVImageBufferRef v53 = CMSampleBufferGetImageBuffer(a3);
      if (!v53) {
        goto LABEL_53;
      }
      v54 = v53;
      CVImageBufferRef v55 = CMSampleBufferGetImageBuffer(v50);
      if (!v55) {
        goto LABEL_53;
      }
      v56 = v55;
      double v118 = v30;
      float v112 = v45;
      double v113 = v37;
      [(CMIDeepZoomProcessor *)self->_deepZoomProcessor updateMetadata:v52 forInputFullPixelBuffer:v55];
      int64_t v57 = psn_pixelBufferDimensions(v54);
      psn_pixelBufferDimensions(v56);
      double v59 = FigCaptureMetadataUtilitiesGetFinalCropRect();
      CGFloat v61 = v60;
      CGFloat v63 = v62;
      CGFloat v64 = v58;
      double v116 = v28;
      double v117 = v29;
      float v115 = v47;
      double v114 = v38;
      if ((v127 & 0x100000) != 0)
      {
        double v81 = FigCaptureMetadataUtilitiesGetFinalCropRect();
        double v83 = v88;
        double v85 = v89;
        double v87 = v90;
        v139.size.height = v64;
        v139.size.width = v63;
        v139.origin.y = v61;
        v139.origin.x = v59;
      }
      else
      {
        CGFloat v128 = v58;
        long long v65 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        *(_OWORD *)&v134.a = *MEMORY[0x1E4F1DAB8];
        long long v66 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        *(_OWORD *)&v134.c = v65;
        *(_OWORD *)&v134.tx = v66;
        if (FigCaptureMetadataUtilitiesComputeNormalizedPixelBufferCoordinateTransformBetweenSampleBuffers(a3, v50, 1, &v134))
        {
          int v39 = 0;
          uint64_t v36 = 4294935586;
          goto LABEL_54;
        }
        double ValidBufferRect = FigCaptureMetadataUtilitiesGetValidBufferRect();
        double v69 = v68;
        FigCaptureMetadataUtilitiesNormalizeCropRect(ValidBufferRect, v70, v68, v71);
        double v111 = v72;
        double v74 = v73;
        double v76 = v75;
        CGAffineTransform v133 = v134;
        v135.origin.x = v59;
        v135.origin.y = v61;
        v135.size.width = v63;
        CGFloat v64 = v128;
        v135.size.height = v128;
        CGRect v136 = CGRectApplyAffineTransform(v135, &v133);
        double updated = FigCaptureUpdateRectSizeAndMaintainCenter(v136.origin.x, v136.origin.y, v136.size.width, v136.size.height, v28 / v69);
        double v81 = FigCaptureMetadataUtilitiesRectDenormalizedToRect(fmax(updated, 0.0), fmax(v78, 0.0), v79, v80, v111, v74, v76);
        double v83 = v82;
        double v85 = v84;
        double v87 = v86;
        memset(&v133, 0, sizeof(v133));
        CGAffineTransform v132 = v134;
        CGAffineTransformInvert(&v133, &v132);
        CGAffineTransform v132 = v133;
        v137.origin.x = v81;
        v137.origin.y = v83;
        v137.size.width = v85;
        v137.size.height = v87;
        CGRect v138 = CGRectApplyAffineTransform(v137, &v132);
        v141.origin.x = 0.0;
        v141.origin.y = 0.0;
        v141.size.width = 1.0;
        v141.size.height = 1.0;
        CGRect v139 = CGRectIntersection(v138, v141);
      }
      FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect((int)v57, v57 >> 32, v139.origin.x, v139.origin.y, v139.size.width, v139.size.height, v118);
      self->_denormalizedDeepTransferLowResROI = v140;
      if (!CGRectIsNull(v140))
      {
        FigCaptureMetadataUtilitiesNormalizeCropRect(self->_denormalizedDeepTransferLowResROI.origin.x, self->_denormalizedDeepTransferLowResROI.origin.y, self->_denormalizedDeepTransferLowResROI.size.width, self->_denormalizedDeepTransferLowResROI.size.height);
        self->_cachedInputImageFinalCropRect.origin.x = v59;
        self->_cachedInputImageFinalCropRect.origin.y = v61;
        self->_cachedInputImageFinalCropRect.size.width = v63;
        self->_cachedInputImageFinalCropRect.size.height = v64;
        FigCFDictionarySetCGRect();
        FigCFDictionarySetCGRect();
        FigCaptureMetadataUtilitiesDenormalizeCropRect(v81, v83, v85, v87);
        p_denormalizedSourceCropRect->f64[0] = v91;
        self->_denormalizedSourceCropRect.origin.y = v92;
        self->_denormalizedSourceCropRect.size.width = v93;
        self->_denormalizedSourceCropRect.size.height = v94;
        self->_deepTransferLowResBufferDims = ($470D365275581EF16070F5A11344F73E)v57;
        double v28 = v116;
        double v29 = v117;
        float v47 = v115;
        double v37 = v113;
        double v38 = v114;
        float v45 = v112;
LABEL_35:
        *(float *)&unsigned int v95 = v28 / v37;
        *(float *)&unsigned int v96 = v29 / v38;
        float keya = *(float *)&v95;
        float v119 = *(float *)&v96;
        *(double *)&unint64_t v129 = COERCE_DOUBLE(__PAIR64__(v96, v95));
        if (objc_msgSend((id)objc_msgSend(v43, "objectForKeyedSubscript:", @"UpsamplingDisabled"), "BOOLValue"))
        {
          __asm { FMOV            V8.2S, #1.0 }
          uint64_t v101 = v125;
          float32x2_t v102 = (float32x2_t)v129;
LABEL_46:
          float32x2_t v106 = vdiv_f32(v102, *(float32x2_t *)&_D8);
          if (v106.f32[0] >= 1.0 && v106.f32[1] >= 1.0)
          {
            [(CMIDeepZoomProcessor *)self->_deepZoomProcessor setInputROI:COERCE_DOUBLE(vuzp1_s16((int16x4_t)vmovn_s64(vcvtq_s64_f64(*p_denormalizedSourceCropRect)), (int16x4_t)vmovn_s64(vcvtq_s64_f64((float64x2_t)self->_denormalizedSourceCropRect.size))))];
            [(CMIDeepZoomProcessor *)self->_deepZoomProcessor setZoomFactor:_D8];
            [(CMIDeepZoomProcessor *)self->_deepZoomProcessor setPortType:v101];
            [(CMIDeepZoomProcessor *)self->_deepZoomProcessor tileCount];
            HIWORD(v130) = v108;
            LOWORD(v130) = v109;
            v131.receiver = self;
            v131.super_class = (Class)BWDeepZoomInferenceProvider;
            *(_OWORD *)&v134.a = *(_OWORD *)&a5->var0;
            *(void *)&v134.c = a5->var3;
            int v39 = [(BWTiledEspressoInferenceProvider *)&v131 submitForSampleBuffer:a3 usingStorage:a4 withSubmissionTime:&v134 workQueue:v120 completionHandler:a7 currentTileCount:v130];
            goto LABEL_56;
          }
          BWSampleBufferRemoveAttachedMedia(a3, 0x1EFA4EB60);
          goto LABEL_52;
        }
        if (keya >= v119) {
          float v103 = v119;
        }
        else {
          float v103 = keya;
        }
        uint64_t v101 = v125;
        if (v103 >= v45)
        {
          if (keya >= v119) {
            float v104 = keya;
          }
          else {
            float v104 = v119;
          }
          BOOL v105 = v104 <= v47;
          float32x2_t v102 = (float32x2_t)v129;
          _D8 = *(double *)&v129;
          if (!v105) {
            _D8 = 2.00000048;
          }
          goto LABEL_46;
        }
LABEL_52:
        uint64_t v36 = 4294935586;
LABEL_53:
        int v39 = -31710;
        goto LABEL_54;
      }
      fig_log_get_emitter();
      FigDebugAssert3();
      uint64_t v36 = 4294935582;
      int v39 = -31714;
    }
  }
LABEL_54:
  if (a7)
  {
    (*((void (**)(id, uint64_t))a7 + 2))(a7, v36);
    int v39 = v36;
  }
LABEL_56:
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  return v39;
}

- (uint64_t)_tuningParametersForPortType:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    int v4 = [*(id *)(result + 104) type];
    uint64_t v5 = @"Lite";
    if (v4 == 2) {
      uint64_t v5 = @"Standard";
    }
    if (v4 == 3) {
      uint64_t v6 = @"Transfer";
    }
    else {
      uint64_t v6 = v5;
    }
    v7 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 104), "tuningParameters"), "objectForKeyedSubscript:", a2);
    return [v7 objectForKeyedSubscript:v6];
  }
  return result;
}

- (int)preProcessOutputBuffer:(__CVBuffer *)a3 forMediaKey:(id)a4
{
  int result = -[CMIDeepZoomProcessor clearOutputBuffer:](self->_deepZoomProcessor, "clearOutputBuffer:", a3, a4);
  if (result) {
    return -31710;
  }
  return result;
}

- (int)createInputTiles:(id)a3 withInputs:(id)a4 atPosition:(id *)a5 cmdBuffer:
{
  uint64_t v6 = v5;
  uint64_t v11 = [a3 count];
  CFStringRef v12 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (!v11 || ![a4 count]) {
    goto LABEL_13;
  }
  if (*v12 == 1) {
    kdebug_trace();
  }
  if ((CFTypeRef v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a4, "count")),
        objc_msgSend(v13, "setObject:atIndexedSubscript:", objc_msgSend(a4, "objectForKeyedSubscript:", @"PrimaryFormat"), 0), objc_msgSend(v13, "objectAtIndexedSubscript:", 0))&& (!objc_msgSend(a4, "objectForKeyedSubscript:", 0x1EFA6A660)|| (objc_msgSend(v13, "setObject:atIndexedSubscript:", objc_msgSend(a4, "objectForKeyedSubscript:", 0x1EFA6A660), 1), objc_msgSend(v13, "objectAtIndexedSubscript:", 1)))&& !-[CMIDeepZoomProcessor createInputTiles:atPosition:inputFullPixelBuffers:cmdBuffer:](self->_deepZoomProcessor, "createInputTiles:atPosition:inputFullPixelBuffers:cmdBuffer:", a3, a5, v13, v6))
  {
    int v14 = 0;
  }
  else
  {
LABEL_13:
    int v14 = -31710;
  }
  if (*v12 == 1) {
    kdebug_trace();
  }
  return v14;
}

- (int)writeOutputFor:(id)a3 to:(__CVBuffer *)a4 fromNetworkOutputTiles:(id)a5 withAdditionalPixelBuffers:(id)a6 withInputTilePixelBuffers:(id)a7 withInputFullPixelBuffers:(id)a8 atPosition:(id *)a9 cmdBuffer:
{
  objc_super v9 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (!a4
    || ![a5 count]
    || ![a7 count]
    || ![a8 count]
    || !objc_msgSend(a3, "isEqualToString:", -[BWDeepZoomInferenceConfiguration outputAttachedMediaKey](self->_inferenceConfig, "outputAttachedMediaKey")))
  {
    goto LABEL_15;
  }
  if (*v9 == 1) {
    kdebug_trace();
  }
  double v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a8, "count"));
  objc_msgSend(v16, "setObject:atIndexedSubscript:", objc_msgSend(a8, "objectForKeyedSubscript:", @"PrimaryFormat"), 0);
  if ([a8 objectForKeyedSubscript:0x1EFA6A660]) {
    objc_msgSend(v16, "setObject:atIndexedSubscript:", objc_msgSend(a8, "objectForKeyedSubscript:", 0x1EFA6A660), 1);
  }
  if (![(CMIDeepZoomProcessor *)self->_deepZoomProcessor writeOutputTiles:a5 atPosition:a9 outputPixelBuffer:a4 inputTilePixelBuffers:a7 inputFullPixelBuffers:v16 cmdBuffer:v19])int v17 = 0; {
  else
  }
LABEL_15:
    int v17 = -31710;
  if (*v9 == 1) {
    kdebug_trace();
  }
  return v17;
}

- (int)propagateInferenceResultForOutputRequirement:(id)a3 storage:(id)a4 propagationSampleBuffer:(opaqueCMSampleBuffer *)a5
{
  CMAttachmentBearerRef target = 0;
  v8 = (__CVBuffer *)objc_msgSend(a4, "pixelBufferForRequirement:");
  objc_super v9 = (void *)[a3 attachedMediaKey];
  CFTypeRef v10 = 0;
  int v11 = -31710;
  if (a5 && v8)
  {
    uint64_t v12 = (uint64_t)v9;
    if (objc_msgSend(v9, "isEqualToString:", -[BWDeepZoomInferenceConfiguration outputAttachedMediaKey](self->_inferenceConfig, "outputAttachedMediaKey"))&& !BWSampleBufferGetAttachedMedia(a5, v12)&& (BWCMSampleBufferCreateDeepCopyWithNewPixelBuffer(a5, v8, 1, (CFTypeRef *)&self->_outputFormatDescription, (CMSampleBufferRef *)&target), target)&& (v13 = (const __CFString *)*MEMORY[0x1E4F53070], (int v14 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0)) != 0))
    {
      CFTypeRef v10 = (void *)[v14 mutableCopy];
      if (!v10) {
        goto LABEL_17;
      }
      CMSetAttachment(target, v13, v10, 1u);
      unint64_t v15 = psn_pixelBufferDimensions(v8);
      CFTypeRef v16 = CMGetAttachment(target, @"StillSettings", 0);
      if (v16)
      {
        int v17 = (void *)v16;
        int v18 = objc_msgSend((id)CMGetAttachment(target, @"StillImageProcessingFlags", 0), "unsignedIntValue");
        if ([(BWDeepZoomInferenceConfiguration *)self->_inferenceConfig type] != 3)
        {
          double width = self->_denormalizedSourceCropRect.size.width;
          [(CMIDeepZoomProcessor *)self->_deepZoomProcessor zoomFactor];
          double v28 = width * v27;
          double height = self->_denormalizedSourceCropRect.size.height;
          [(CMIDeepZoomProcessor *)self->_deepZoomProcessor zoomFactor];
          FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v10, *(void *)&self->_inputReferencePixelBufferDimensions, v15, self->_denormalizedSourceCropRect.origin.x, self->_denormalizedSourceCropRect.origin.y, self->_denormalizedSourceCropRect.size.width, self->_denormalizedSourceCropRect.size.height, 0.0, 0.0, v28, height * v30);
LABEL_16:
          CMSetAttachment(target, @"StillImageProcessingFlags", (CFTypeRef)[NSNumber numberWithUnsignedInt:v18 | 0x20000u], 1u);
          long long v31 = [(BWDeepZoomInferenceConfiguration *)self->_inferenceConfig outputAttachedMediaKey];
          BWSampleBufferSetAttachedMedia(a5, (uint64_t)v31, (uint64_t)target);
          int v11 = 0;
          goto LABEL_17;
        }
        AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(target, 0x1EFA6A660);
        if (AttachedMedia && CMGetAttachment(AttachedMedia, v13, 0))
        {
          FigCFDictionarySetCGRect();
          unsigned int v20 = objc_msgSend((id)objc_msgSend(v17, "requestedSettings"), "outputWidth");
          LODWORD(v21) = objc_msgSend((id)objc_msgSend(v17, "requestedSettings"), "outputHeight");
          if ((v18 & 0x100000) != 0)
          {
            unsigned int v20 = [(BWDeepZoomInferenceConfiguration *)self->_inferenceConfig stereoPhotoOutputDimensions];
            unint64_t v21 = (unint64_t)[(BWDeepZoomInferenceConfiguration *)self->_inferenceConfig stereoPhotoOutputDimensions] >> 32;
          }
          double v22 = (double)v20;
          double v23 = (double)v21;
          uint64_t v24 = *MEMORY[0x1E4F53DE8];
          uint64_t v25 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F53DE8]];
          FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v10, *(void *)&self->_deepTransferLowResBufferDims, v15, self->_denormalizedDeepTransferLowResROI.origin.x, self->_denormalizedDeepTransferLowResROI.origin.y, self->_denormalizedDeepTransferLowResROI.size.width, self->_denormalizedDeepTransferLowResROI.size.height, 0.0, 0.0, v22, v23);
          [v10 setObject:v25 forKeyedSubscript:v24];
          BWSampleBufferRemoveAttachedMedia(target, 0x1EFA6A660);
          goto LABEL_16;
        }
        int v11 = -31710;
      }
      else
      {
        int v11 = -31712;
      }
    }
    else
    {
      CFTypeRef v10 = 0;
    }
  }
LABEL_17:

  if (target) {
    CFRelease(target);
  }
  return v11;
}

- (int)purgeIntermediateResources
{
  return 0;
}

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  if (![(CMIDeepZoomProcessor *)self->_deepZoomProcessor modelNetworkBaseName])
  {
    id v13 = 0;
    id v6 = 0;
    int v43 = -31710;
    goto LABEL_18;
  }
  id v5 = +[BWEspressoInferenceAdapter espressoNetworkURLForPlatformedResourceBaseName:[(CMIDeepZoomProcessor *)self->_deepZoomProcessor modelNetworkBaseName] embedPlatformOrDeviceID:1];
  if (!v5)
  {
    id v13 = 0;
    id v6 = 0;
LABEL_21:
    int v43 = -31702;
    goto LABEL_18;
  }
  id v45 = a3;
  id v46 = v5;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (objc_msgSend((id)-[CMIDeepZoomProcessor modelInputBindingNames](self->_deepZoomProcessor, "modelInputBindingNames"), "count"))
  {
    uint64_t v7 = 0;
    unsigned int v8 = 1;
    do
    {
      __int16 v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[CMIDeepZoomProcessor modelInputSizes](self->_deepZoomProcessor, "modelInputSizes"), "objectAtIndexedSubscript:", v7), "objectAtIndexedSubscript:", 0), "unsignedShortValue");
      __int16 v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[CMIDeepZoomProcessor modelInputSizes](self->_deepZoomProcessor, "modelInputSizes"), "objectAtIndexedSubscript:", v7), "objectAtIndexedSubscript:", 1), "unsignedShortValue");
      if ([(CMIDeepZoomProcessor *)self->_deepZoomProcessor modelInputSlicesCount]) {
        uint64_t v11 = objc_msgSend((id)objc_msgSend((id)-[CMIDeepZoomProcessor modelInputSlicesCount](self->_deepZoomProcessor, "modelInputSlicesCount"), "objectAtIndexedSubscript:", v7), "unsignedShortValue");
      }
      else {
        uint64_t v11 = 0;
      }
      HIWORD(v49) = v10;
      LOWORD(v49) = v9;
      objc_msgSend(v6, "setObject:forKeyedSubscript:", +[BWTiledEspressoInferenceProvider videoFormatWithPixelFormat:size:sliceCount:](BWTiledEspressoInferenceProvider, "videoFormatWithPixelFormat:size:sliceCount:", objc_msgSend((id)objc_msgSend((id)-[CMIDeepZoomProcessor modelInputPixelFormats](self->_deepZoomProcessor, "modelInputPixelFormats"), "objectAtIndexedSubscript:", v7), "unsignedIntegerValue"), v49, v11), objc_msgSend((id)-[CMIDeepZoomProcessor modelInputBindingNames](self->_deepZoomProcessor, "modelInputBindingNames"), "objectAtIndexedSubscript:", v7));
      uint64_t v7 = v8;
      BOOL v12 = objc_msgSend((id)-[CMIDeepZoomProcessor modelInputBindingNames](self->_deepZoomProcessor, "modelInputBindingNames"), "count") > (unint64_t)v8++;
    }
    while (v12);
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (objc_msgSend((id)-[CMIDeepZoomProcessor modelOutputBindingNames](self->_deepZoomProcessor, "modelOutputBindingNames"), "count"))
  {
    uint64_t v14 = 0;
    unsigned int v15 = 1;
    do
    {
      __int16 v16 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[CMIDeepZoomProcessor modelOutputSizes](self->_deepZoomProcessor, "modelOutputSizes"), "objectAtIndexedSubscript:", v14), "objectAtIndexedSubscript:", 0), "unsignedShortValue");
      __int16 v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[CMIDeepZoomProcessor modelOutputSizes](self->_deepZoomProcessor, "modelOutputSizes"), "objectAtIndexedSubscript:", v14), "objectAtIndexedSubscript:", 1), "unsignedShortValue");
      if ([(CMIDeepZoomProcessor *)self->_deepZoomProcessor modelOutputSlicesCount]) {
        uint64_t v18 = objc_msgSend((id)objc_msgSend((id)-[CMIDeepZoomProcessor modelOutputSlicesCount](self->_deepZoomProcessor, "modelOutputSlicesCount"), "objectAtIndexedSubscript:", v14), "unsignedShortValue");
      }
      else {
        uint64_t v18 = 0;
      }
      HIWORD(v48) = v17;
      LOWORD(v48) = v16;
      objc_msgSend(v13, "setObject:forKeyedSubscript:", +[BWTiledEspressoInferenceProvider videoFormatWithPixelFormat:size:sliceCount:](BWTiledEspressoInferenceProvider, "videoFormatWithPixelFormat:size:sliceCount:", objc_msgSend((id)objc_msgSend((id)-[CMIDeepZoomProcessor modelOutputPixelFormats](self->_deepZoomProcessor, "modelOutputPixelFormats"), "objectAtIndexedSubscript:", v14), "unsignedIntegerValue"), v48, v18), objc_msgSend((id)-[CMIDeepZoomProcessor modelOutputBindingNames](self->_deepZoomProcessor, "modelOutputBindingNames"), "objectAtIndexedSubscript:", v14));
      uint64_t v14 = v15;
      BOOL v12 = objc_msgSend((id)-[CMIDeepZoomProcessor modelOutputBindingNames](self->_deepZoomProcessor, "modelOutputBindingNames"), "count") > (unint64_t)v15++;
    }
    while (v12);
  }
  unint64_t v19 = [(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)self->_outputVideoRequirement videoFormat] width];
  [(CMIDeepZoomProcessor *)self->_deepZoomProcessor tileSize];
  unint64_t v21 = v19 + v20;
  [(CMIDeepZoomProcessor *)self->_deepZoomProcessor tileOverlap];
  unint64_t v23 = v21 + (~v22 | 0xFFFFFFFFFFFF0000);
  [(CMIDeepZoomProcessor *)self->_deepZoomProcessor tileSize];
  int32x2_t v25 = v24;
  [(CMIDeepZoomProcessor *)self->_deepZoomProcessor tileOverlap];
  int32x2_t v27 = vzip1_s32(v25, v26);
  v28.i64[0] = v27.u32[0];
  v28.i64[1] = v27.u32[1];
  v29.i64[0] = 0xFFFFLL;
  v29.i64[1] = 0xFFFFLL;
  int64x2_t v30 = (int64x2_t)vandq_s8(v28, v29);
  unint64_t v31 = v23 / vsubq_s64(v30, vdupq_laneq_s64(v30, 1)).u64[0];
  unint64_t v32 = [(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)self->_outputVideoRequirement videoFormat] height];
  [(CMIDeepZoomProcessor *)self->_deepZoomProcessor tileSize];
  unint64_t v34 = v32 + v33;
  [(CMIDeepZoomProcessor *)self->_deepZoomProcessor tileOverlap];
  unint64_t v36 = v34 + (~v35 | 0xFFFFFFFFFFFF0000);
  [(CMIDeepZoomProcessor *)self->_deepZoomProcessor tileSize];
  int32x2_t v38 = v37;
  [(CMIDeepZoomProcessor *)self->_deepZoomProcessor tileOverlap];
  int32x2_t v40 = vzip2_s32(v38, v39);
  v28.i64[0] = v40.u32[0];
  v28.i64[1] = v40.u32[1];
  v41.i64[0] = 0xFFFFLL;
  v41.i64[1] = 0xFFFFLL;
  int64x2_t v42 = (int64x2_t)vandq_s8(v28, v41);
  LOWORD(v47) = v31;
  HIWORD(v47) = v36 / vsubq_s64(v42, vdupq_laneq_s64(v42, 1)).u64[0];
  v51.receiver = self;
  v51.super_class = (Class)BWDeepZoomInferenceProvider;
  if ([(BWTiledEspressoInferenceProvider *)&v51 loadNetworkWithURL:v46 configName:0 inferenceType:[(BWTiledEspressoInferenceProvider *)self type] maxTileCount:v47 inputFormatsByBindingName:v6 outputFormatsByBindingName:v13 additionalVideoRequirements:0])
  {
    goto LABEL_21;
  }
  v50.receiver = self;
  v50.super_class = (Class)BWDeepZoomInferenceProvider;
  if ([(BWTiledEspressoInferenceProvider *)&v50 prepareForSubmissionWithWorkQueue:v45])
  {
    goto LABEL_21;
  }
  int v43 = 0;
LABEL_18:

  return v43;
}

- (int)prewarmUsingLimitedMemory:(BOOL)a3
{
  int result = [(CMIDeepZoomProcessor *)self->_deepZoomProcessor prewarm];
  if (result) {
    return -31710;
  }
  return result;
}

@end