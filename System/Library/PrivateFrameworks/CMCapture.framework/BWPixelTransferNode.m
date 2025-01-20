@interface BWPixelTransferNode
+ (void)initialize;
- ($2825F4736939C4A6D3AD43837233062D)validOutputDimensions;
- (BOOL)_zeroFillBuffers;
- (BOOL)allows422To420Conversion;
- (BOOL)appliesPrimaryCaptureRect;
- (BOOL)appliesUprightExifOrientationTransformToInput;
- (BOOL)deviceOrientationCorrectionEnabled;
- (BOOL)expectsMarkerBuffers;
- (BOOL)firstFrameProcessed;
- (BOOL)flipHorizontal;
- (BOOL)flipVertical;
- (BOOL)generatesHistogram;
- (BOOL)hasNonLiveConfigurationChanges;
- (BOOL)isConverting10BitVideoRangeTo8BitFullRangeEncouraged;
- (BOOL)lowSpeed;
- (BOOL)passesBuffersThroughWhenPossible;
- (BOOL)updatesSampleBufferMetadataForIrisVIS;
- (BWPixelTransferNode)init;
- (BWPixelTransferNode)initWithfractionalSourceRectEnabled:(BOOL)a3;
- (CGFloat)_getUpdatedPrimaryCaptureRectForOutputSampleBuffer:(uint64_t)a1 inputDimensions:(CMAttachmentBearerRef)target;
- (CGRect)inputCropRect;
- (OS_dispatch_semaphore)emitSampleBufferSemaphore;
- (id)nodeSubType;
- (id)nodeType;
- (id)preferredOutputPixelFormats;
- (int)conversionMethodForStillImagesDuringHDRVideos;
- (int)cropMode;
- (int)maxInputLossyCompressionLevel;
- (int)maxLossyCompressionLevel;
- (int)maxOutputLossyCompressionLevel;
- (int)outputColorSpaceProperties;
- (int)rotationDegrees;
- (uint64_t)_convertUsingHDRProcessing:(__CVBuffer *)a3 toSDR:;
- (uint64_t)_emitIfMarkerBuffer:(uint64_t)result;
- (uint64_t)_ensureDeviceOrientationMonitor;
- (uint64_t)_ensureIntermediatePoolWithDimensions:(uint64_t)a1;
- (uint64_t)_ensureRotationSession;
- (uint64_t)_ensureTransferSession;
- (uint64_t)_intermediateBufferDimensionsForInputDimensions:(uint64_t)a3 outputDimensions:;
- (uint64_t)_makeCurrentConfigurationLive;
- (uint64_t)_supportedOutputPixelFormats;
- (uint64_t)_updateInputRequirements;
- (uint64_t)_updateLiveRotationAndFlipsToApplyUprightExifOrientation:(uint64_t)result;
- (uint64_t)_updateMetadataForOutputSampleBuffer:(CGFloat)a3 destinationRect:(CGFloat)a4;
- (uint64_t)_updateOutputRequirements;
- (uint64_t)_updatePassthroughModes;
- (unint64_t)outputHeight;
- (unint64_t)outputWidth;
- (unsigned)_updateLiveDeviceOrientationAffectedMetadataForOutputSampleBuffer:(double)a3 inputDims:(double)a4 inputCropRect:(double)a5;
- (unsigned)outputPixelFormat;
- (void)_ensureIntermediatePixelBufferForStillHDRToSDRConversionIfNeeded;
- (void)_ensureRotationSession;
- (void)_ensureTransferSession;
- (void)_updatePrimaryCaptureRect:(CGFloat)a3 forOutputSampleBuffer:(CGFloat)a4;
- (void)_updateUprightExifOrientationOnSampleBufferIfNeeded:(uint64_t)a1;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)handleDroppedSample:(id)a3 forInput:(id)a4;
- (void)makeCurrentConfigurationLive;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setAllows422To420Conversion:(BOOL)a3;
- (void)setAppliesPrimaryCaptureRect:(BOOL)a3;
- (void)setAppliesUprightExifOrientationTransformToInput:(BOOL)a3;
- (void)setConversionMethodForStillImagesDuringHDRVideos:(int)a3;
- (void)setConverting10BitVideoRangeTo8BitFullRangeEncouraged:(BOOL)a3;
- (void)setCropMode:(int)a3;
- (void)setDeviceOrientationCorrectionEnabled:(BOOL)a3;
- (void)setEmitSampleBufferSemaphore:(id)a3;
- (void)setExpectsMarkerBuffers:(BOOL)a3;
- (void)setFirstFrameProcessed:(BOOL)a3;
- (void)setFlipHorizontal:(BOOL)a3;
- (void)setFlipVertical:(BOOL)a3;
- (void)setGeneratesHistogram:(BOOL)a3;
- (void)setInputCropRect:(CGRect)a3;
- (void)setLowSpeed:(BOOL)a3;
- (void)setMaxInputLossyCompressionLevel:(int)a3;
- (void)setMaxLossyCompressionLevel:(int)a3;
- (void)setMaxOutputLossyCompressionLevel:(int)a3;
- (void)setOutputColorSpaceProperties:(int)a3;
- (void)setOutputHeight:(unint64_t)a3;
- (void)setOutputPixelFormat:(unsigned int)a3;
- (void)setOutputWidth:(unint64_t)a3;
- (void)setPassesBuffersThroughWhenPossible:(BOOL)a3;
- (void)setPreferredOutputPixelFormats:(id)a3;
- (void)setRotationDegrees:(int)a3;
- (void)setUpdatesSampleBufferMetadataForIrisVIS:(BOOL)a3;
- (void)setValidOutputDimensions:(id)a3;
@end

@implementation BWPixelTransferNode

- (BOOL)_zeroFillBuffers
{
  if (result)
  {
    uint64_t v1 = result;
    return (objc_msgSend((id)objc_msgSend(*(id *)(result + 16), "videoFormat"), "prewireBuffers") & 1) == 0
        && FigCapturePixelFormatGetCompressionType(objc_msgSend((id)objc_msgSend(*(id *)(v1 + 16), "videoFormat"), "pixelFormat")) == 0;
  }
  return result;
}

BOOL __51__BWPixelTransferNode__supportedOutputPixelFormats__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = [a2 intValue];
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v5 + 356) == 1
    && objc_msgSend((id)objc_msgSend(*(id *)(v5 + 8), "videoFormat"), "isHLGColorSpace")
    && FigCapturePixelFormatGetCompressionType(v4))
  {
    return 0;
  }
  if (FigCapturePixelFormatIsFullRange(v4)) {
    uint64_t v6 = FigCaptureVideoRangePixelFormatForPixelFormat(v4);
  }
  else {
    uint64_t v6 = FigCaptureFullRangePixelFormatForPixelFormat(v4);
  }
  uint64_t v7 = v6;
  if (([*(id *)(*(void *)(a1 + 32) + 232) containsObject:a2] & 1) != 0
    || *(_DWORD *)(*(void *)(a1 + 32) + 224) == v4)
  {
    if (FigCapturePixelFormatIsTenBit(v4)) {
      int IsFullRange = 0;
    }
    else {
      int IsFullRange = FigCapturePixelFormatIsFullRange(v4);
    }
    uint64_t v9 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v9 + 361))
    {
      if (*(unsigned char *)(a1 + 40)) {
        int v10 = IsFullRange ^ 1;
      }
      else {
        int v10 = 1;
      }
    }
    else
    {
      int v10 = 1;
    }
    if (v7 == v4
      || (objc_msgSend(*(id *)(v9 + 232), "containsObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v7)) & v10) != 1)
    {
      return 1;
    }
    int v11 = FigCapturePixelFormatIsFullRange(v4);
    int v12 = *(unsigned __int8 *)(a1 + 41);
  }
  else
  {
    if (*(unsigned __int8 *)(a1 + 41) != FigCapturePixelFormatIsFullRange(v4)
      || *(unsigned __int8 *)(a1 + 42) != FigCapturePixelFormatIsTenBit(v4))
    {
      return 0;
    }
    if (*(unsigned char *)(*(void *)(a1 + 32) + 360)) {
      return 1;
    }
    int v11 = FigCapturePixelFormatIs422(v4);
    int v12 = *(unsigned __int8 *)(a1 + 43);
  }
  return v12 == v11;
}

- (uint64_t)_updateOutputRequirements
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    v2 = (void *)[*(id *)(result + 16) formatRequirements];
    v3 = (void *)[*(id *)(v1 + 8) videoFormat];
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)(v1 + 208);
    if (!v5) {
      uint64_t v5 = [v3 width];
    }
    [v2 setWidth:v5];
    uint64_t v6 = *(void *)(v1 + 216);
    if (!v6) {
      uint64_t v6 = [v4 height];
    }
    [v2 setHeight:v6];
    if (*(_DWORD *)(v1 + 224))
    {
      v10[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
      result = objc_msgSend(v2, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v10, 1));
    }
    else
    {
      [v2 setSupportedPixelFormats:-[BWPixelTransferNode _supportedOutputPixelFormats](v1)];
      result = [v2 setPreferredPixelFormats:*(void *)(v1 + 232)];
    }
    if (*(_DWORD *)(v1 + 240))
    {
      uint64_t v9 = objc_msgSend(NSNumber, "numberWithInt:");
      uint64_t v7 = &v9;
    }
    else
    {
      if (!v4) {
        return result;
      }
      uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "colorSpaceProperties"));
      uint64_t v7 = &v8;
    }
    return objc_msgSend(v2, "setSupportedColorSpaceProperties:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v7, 1, v8, v9));
  }
  return result;
}

- (uint64_t)_supportedOutputPixelFormats
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v2 = ptn_supportedPixelFormats(*(_DWORD *)(a1 + 260));
  uint64_t v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "videoFormat"), "pixelFormat");
  if (v3)
  {
    uint64_t v4 = v3;
    if (FigCapturePixelFormatIsDepthData(v3))
    {
      v14[0] = [NSNumber numberWithUnsignedInt:v4];
      return [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    }
    else
    {
      char IsFullRange = FigCapturePixelFormatIsFullRange(v4);
      char IsTenBit = FigCapturePixelFormatIsTenBit(v4);
      char v7 = FigCapturePixelFormatIs422(v4);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __51__BWPixelTransferNode__supportedOutputPixelFormats__block_invoke;
      v9[3] = &unk_1E5C24DB0;
      v9[4] = a1;
      char v10 = IsTenBit & (IsFullRange ^ 1);
      char v11 = IsFullRange;
      char v12 = IsTenBit;
      char v13 = v7;
      objc_msgSend(v2, "filterUsingPredicate:", objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithBlock:", v9));
    }
  }
  return (uint64_t)v2;
}

- (id)nodeType
{
  return @"Converter";
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v307 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  if (self->_makeCurrentConfigurationLiveOnNextRenderCallback)
  {
    -[BWPixelTransferNode _makeCurrentConfigurationLive]((uint64_t)self);
    self->_makeCurrentConfigurationLiveOnNextRenderCallback = 0;
    [(BWNodeOutput *)self->super._output makeConfiguredFormatLive];
  }
  if (!self->_liveExpectsMarkerBuffers || (-[BWPixelTransferNode _emitIfMarkerBuffer:]((uint64_t)self, a3) & 1) == 0)
  {
    if (self->_doGMLogging && dword_1EB4C56F0 != 0)
    {
      LODWORD(origin.f64[0]) = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    emitSampleBufferSemaphore = self->_emitSampleBufferSemaphore;
    if (emitSampleBufferSemaphore) {
      dispatch_semaphore_wait(emitSampleBufferSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    }
    CGSize v291 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    *(_OWORD *)sbuf = *MEMORY[0x1E4F1DB28];
    float64x2_t origin = *(float64x2_t *)MEMORY[0x1E4F1DB28];
    CGSize v304 = v291;
    pixelBuffer = CMSampleBufferGetImageBuffer(a3);
    BOOL fractionalSourceRectEnabled = self->_fractionalSourceRectEnabled;
    *(void *)type = 0;
    int liveCropMode = self->_liveCropMode;
    if (liveCropMode == 2)
    {
      if (!CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0)
        || !FigCFDictionaryGetCGRectIfPresent())
      {
        goto LABEL_29;
      }
    }
    else
    {
      if (liveCropMode == 1)
      {
        v24 = (__CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
        if (v24)
        {
          v25 = v24;
          v26 = (const void *)*MEMORY[0x1E4F53260];
          if (FigCFDictionaryGetCGRectIfPresent())
          {
            float64x2_t v27 = origin;
            double height = v304.height;
            size_t Width = CVPixelBufferGetWidth(pixelBuffer);
            size_t v30 = CVPixelBufferGetHeight(pixelBuffer);
            if (fractionalSourceRectEnabled)
            {
              origin.f64[0] = origin.f64[0] * (double)Width;
              origin.f64[1] = origin.f64[1] * (double)v30;
              v304.width = v304.width * (double)Width;
              double v31 = v304.height * (double)v30;
            }
            else
            {
              v35.i64[0] = Width;
              v35.i64[1] = v30;
              float64x2_t v36 = vcvtq_f64_u64(v35);
              __asm { FMOV            V2.2D, #0.5 }
              float64x2_t v41 = vrndaq_f64(vmulq_f64(vmulq_f64(origin, v36), _Q2));
              float64x2_t origin = vaddq_f64(v41, v41);
              _Q2.f64[0] = round(v304.width * v36.f64[0] * 0.5);
              v304.width = _Q2.f64[0] + _Q2.f64[0];
              v36.f64[0] = round(vmuld_lane_f64(v304.height, v36, 1) * 0.5);
              double v31 = v36.f64[0] + v36.f64[0];
            }
            v304.double height = v31;
            CFDictionaryRemoveValue(v25, v26);
            if (self->_liveUpdatesSampleBufferMetadataForIrisVIS)
            {
              int v305 = 0;
              v42 = (const void *)*MEMORY[0x1E4F53EE8];
              if (FigCFDictionaryGetInt32IfPresent()) {
                CFDictionarySetValue(v25, v42, (const void *)[NSNumber numberWithInt:(int)(height * (double)v305)]);
              }
              rect.float64x2_t origin = *(CGPoint *)sbuf;
              rect.CGSize size = v291;
              if (FigCFDictionaryGetCGRectIfPresent())
              {
                *(void *)v301 = 0;
                FigCFDictionaryGetInt32IfPresent();
                FigCFDictionaryGetInt32IfPresent();
                double v43 = ceil(v27.f64[0] * rect.size.width);
                double v44 = floor(v27.f64[0] * rect.size.width);
                if (v27.f64[0] * rect.size.width >= 0.0) {
                  double v45 = v44;
                }
                else {
                  double v45 = v43;
                }
                double v46 = rect.origin.x + v45;
                double v47 = ceil(v27.f64[1] * rect.size.height);
                double v48 = floor(v27.f64[1] * rect.size.height);
                if (v27.f64[1] * rect.size.height < 0.0) {
                  double v48 = v47;
                }
                rect.origin.CGFloat x = v46;
                rect.origin.CGFloat y = rect.origin.y + v48;
                rect.size.width = (double)*(int *)&v301[4] - v46 * 2.0;
                rect.size.double height = (double)*(int *)v301 - rect.origin.y * 2.0;
                FigCFDictionarySetCGRect();
              }
            }
            goto LABEL_43;
          }
        }
        goto LABEL_29;
      }
      if (liveCropMode) {
        goto LABEL_29;
      }
      BOOL haveLiveInputCropRect = self->_haveLiveInputCropRect;
      CGSize size = self->_liveInputCropRect.size;
      float64x2_t origin = (float64x2_t)self->_liveInputCropRect.origin;
      CGSize v304 = size;
      if ([(BWPixelTransferNode *)self appliesPrimaryCaptureRect])
      {
        CFStringRef v13 = (const __CFString *)*MEMORY[0x1E4F530D0];
        CFDictionaryRef v14 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F530D0], 0);
        if (v14)
        {
          CFDictionaryRef v15 = v14;
          memset(&rect, 0, sizeof(rect));
          size_t v16 = CVPixelBufferGetWidth(pixelBuffer);
          size_t v17 = CVPixelBufferGetHeight(pixelBuffer);
          CGRectMakeWithDictionaryRepresentation(v15, &rect);
          FigCaptureMetadataUtilitiesDenormalizeCropRect(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
          rect.origin.CGFloat x = v18;
          rect.origin.CGFloat y = v19;
          rect.size.width = v20;
          rect.size.double height = v21;
          CMSetAttachment(a3, v13, 0, 1u);
          if (haveLiveInputCropRect)
          {
            float v22 = v304.width;
            float v23 = v304.height;
          }
          else
          {
            float v22 = (float)v16;
            float v23 = (float)v17;
          }
          origin.f64[0] = FigCaptureMetadataUtilitiesRectByCroppingRectToAspectRatio(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, v22 / v23);
          origin.f64[1] = v49;
          v304.width = v50;
          v304.double height = v51;
          goto LABEL_43;
        }
      }
      if (!haveLiveInputCropRect)
      {
LABEL_29:
        unint64_t v32 = psn_pixelBufferDimensions(pixelBuffer);
        int v33 = 0;
        unint64_t v34 = HIDWORD(v32);
        goto LABEL_44;
      }
    }
LABEL_43:
    LODWORD(v32) = (int)v304.width;
    unint64_t v34 = (int)v304.height;
    int v33 = 1;
LABEL_44:
    unint64_t destinationBuffer = v34;
    sbufa = a3;
    if (self->_liveDeviceOrientationCorrectionEnabled)
    {
      -[BWPixelTransferNode _ensureDeviceOrientationMonitor]((uint64_t)self);
      v52 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      v53 = (void *)[v52 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
      int v287 = v33;
      if ([v53 isEqualToString:*MEMORY[0x1E4F52DF8]]) {
        int v54 = 1;
      }
      else {
        int v54 = [v53 isEqualToString:*MEMORY[0x1E4F52E10]];
      }
      BOOL IsExtensionDeviceType = BWDeviceTypeIsExtensionDeviceType(objc_msgSend((id)objc_msgSend(v52, "objectForKeyedSubscript:", *MEMORY[0x1E4F53DE0], v253, v257), "integerValue"));
      int v56 = [(BWDeviceOrientationMonitor *)self->_deviceOrientationMonitor mostRecentPortraitLandscapeOrientation];
      [(BWGraph *)[(BWNode *)self graph] clientExpectsCameraMountedInLandscapeOrientation];
      int liveRotationDegrees = FigCaptureRotationDegreesFromOrientation(v56, v54, IsExtensionDeviceType, 0);
      self->_int liveRotationDegrees = liveRotationDegrees;
      if (self->_prevLiveDeviceOrientationCorrectionDegrees != liveRotationDegrees)
      {
        if (dword_1EB4C56F0)
        {
          *(_DWORD *)&v301[4] = 0;
          v301[0] = OS_LOG_TYPE_DEFAULT;
          v58 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          uint64_t v6 = (_DWORD *)MEMORY[0x1E4F1EBA8];
          if (dword_1EB4C56F0)
          {
            *(_DWORD *)&v301[4] = 0;
            v301[0] = OS_LOG_TYPE_DEFAULT;
            v59 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
        self->_BOOL doGMLogging = 1;
        self->_prevLiveDeviceOrientationCorrectionDegrees = self->_liveRotationDegrees;
        int liveRotationDegrees = self->_liveRotationDegrees;
      }
      int v33 = v287;
      if (liveRotationDegrees)
      {
        int v60 = destinationBuffer;
        int v61 = v32;
        if (liveRotationDegrees != 90)
        {
          int v60 = destinationBuffer;
          int v61 = v32;
          if (liveRotationDegrees != 270)
          {
            int v60 = v32;
            int v61 = destinationBuffer;
          }
        }
        origin.f64[0] = FigCaptureMakeRectWithAspectRatioInsideDimensions(v32 | (destinationBuffer << 32), 0, (float)v60 / (float)v61);
        origin.f64[1] = v62;
        v304.width = v63;
        v304.double height = v64;
        int v33 = 1;
        if (self->_doGMLogging && dword_1EB4C56F0)
        {
          *(_DWORD *)&v301[4] = 0;
          v301[0] = OS_LOG_TYPE_DEFAULT;
          v65 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT);
          int v33 = 1;
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      else if (self->_doGMLogging && dword_1EB4C56F0)
      {
        *(_DWORD *)&v301[4] = 0;
        v301[0] = OS_LOG_TYPE_DEFAULT;
        v66 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        int v33 = v287;
      }
    }
    if (self->_liveCropMode == 3
      && [(BWNodeInput *)self->super._input passthroughMode] == 1
      && [(BWNodeOutput *)self->super._output passthroughMode] == 1
      || (!self->_livePassesBuffersThroughWhenPossible ? (char v67 = 1) : (char v67 = v33), (v67 & 1) == 0))
    {
      if (self->_doGMLogging && dword_1EB4C56F0)
      {
        *(_DWORD *)&v301[4] = 0;
        v301[0] = OS_LOG_TYPE_DEFAULT;
        v80 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      self->_BOOL doGMLogging = 0;
      -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3, v253, v257);
      LODWORD(v132) = 0;
      goto LABEL_250;
    }
    if (self->_liveAppliesUprightExifOrientationTransformToInput)
    {
      int v68 = objc_msgSend((id)CMGetAttachment(a3, @"UprightExifOrientation", 0), "intValue");
      -[BWPixelTransferNode _updateLiveRotationAndFlipsToApplyUprightExifOrientation:]((uint64_t)self, v68);
    }
    v69 = [(BWPixelBufferPool *)[(BWNodeOutput *)self->super._output livePixelBufferPool] newPixelBuffer];
    if (v69) {
      BWCMSampleBufferCreateCopyWithNewPixelBuffer(a3, v69, (CFTypeRef *)&self->_outputFormatDescription, (CMSampleBufferRef *)type);
    }
    if (*(void *)type)
    {
      unint64_t v70 = psn_pixelBufferDimensions(v69);
      uint64_t v71 = v32;
      double v72 = -[BWPixelTransferNode _getUpdatedPrimaryCaptureRectForOutputSampleBuffer:inputDimensions:]((uint64_t)self, *(CMAttachmentBearerRef *)type);
      double v74 = v73;
      double v76 = v75;
      double v280 = v77;
      if (v33)
      {
        double v78 = origin.f64[1];
        double v274 = origin.f64[0];
        propertyKeCGFloat y = v304.height;
        double v79 = v304.width;
      }
      else
      {
        double v79 = (double)(int)v32;
        propertyKeCGFloat y = (double)(int)destinationBuffer;
        double v78 = 0.0;
        double v274 = 0.0;
      }
      LOBYTE(rect.origin.x) = 0;
      int v81 = ptn_rotationDegreesAndMirroringFromLiveConfiguration(self->_liveRotationDegrees, self->_liveFlipHorizontal, self->_liveFlipVertical, (char *)&rect);
      v308.origin.CGFloat x = v72;
      v308.origin.CGFloat y = v74;
      v308.size.width = v76;
      v308.size.double height = v280;
      BOOL IsNull = CGRectIsNull(v308);
      double v83 = 0.0;
      int v288 = v33;
      double v273 = v72;
      CGFloat v272 = v74;
      double v271 = v76;
      if (IsNull)
      {
        double v84 = (double)SHIDWORD(v70);
        double v85 = (double)SHIDWORD(v70);
        double v86 = (double)(int)v70;
        double v87 = (double)(int)v70;
        double v88 = 0.0;
        double v89 = propertyKey;
        double v90 = v274;
      }
      else
      {
        double v275 = FigCaptureMetadataUtilitiesRectDenormalizedToRect(v72, v74, v76, v280, v274, v78, v79);
        CFStringRef propertyKeyc = v91;
        double v79 = v92;
        double v94 = v93;
        double v95 = v72;
        double v96 = v76;
        double v86 = (double)(int)v70;
        double v84 = (double)SHIDWORD(v70);
        double v97 = FigCaptureMetadataUtilitiesRectDenormalizedToRect(v95, v74, v96, v280, 0.0, 0.0, (double)(int)v70);
        double v90 = v275;
        double v89 = v94;
        double v78 = *(double *)&propertyKeyc;
        double v88 = v97;
        double v83 = v98;
        double v87 = v99;
        double v85 = v100;
      }
      BWUpdateCameraIntrinsicsMatrixOnSampleBuffer(*(const void **)type, (const __CFString *)*MEMORY[0x1E4F1F218], v81, LOBYTE(rect.origin.x), v90, v78, v79, v89, v88, v83, v87, v85);
      CFStringRef v101 = (const __CFString *)*MEMORY[0x1E4F53070];
      CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      rect.origin.CGFloat x = 1.0;
      FigCFDictionaryGetCGFloatIfPresent();
      int v102 = self->_liveRotationDegrees;
      double v103 = v84;
      if (v102 == 270 || (double v104 = v84, v102 == 90)) {
        double v104 = v86;
      }
      rect.origin.CGFloat x = rect.origin.x * v104 / (float)(int)destinationBuffer;
      double v105 = v271;
      CGFloat v106 = v273;
      CGFloat v107 = v280;
      if (rect.origin.x > 1.0) {
        FigCFDictionarySetCGFloat();
      }
      uint64_t v108 = -[BWPixelTransferNode _intermediateBufferDimensionsForInputDimensions:outputDimensions:]((uint64_t)self, v71 | (destinationBuffer << 32), v70);
      uint64_t v109 = v108;
      destinationBuffera = v69;
      if (!v108 || !HIDWORD(v108))
      {
        v131 = 0;
        goto LABEL_160;
      }
      *(float64x2_t *)v264 = origin;
      double v265 = v304.width;
      if (fractionalSourceRectEnabled)
      {
        double v261 = v86;
        double v276 = v84;
        __asm { FMOV            V0.2D, #0.5 }
        float64x2_t v111 = vrndmq_f64(vmulq_f64(origin, _Q0));
        float64x2_t v112 = vaddq_f64(v111, v111);
        float64x2_t v113 = vrndpq_f64(vmulq_f64(vaddq_f64(vsubq_f64(v112, v112), (float64x2_t)v304), _Q0));
        float64x2_t origin = v112;
        CGSize v304 = (CGSize)vaddq_f64(v113, v113);
        memset(&rect, 0, sizeof(rect));
        CGFloat v114 = *MEMORY[0x1E4F1DB28];
        CGFloat v115 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        CGFloat v116 = (double)CVPixelBufferGetWidth(pixelBuffer);
        size_t v117 = CVPixelBufferGetHeight(pixelBuffer);
        rect.origin.CGFloat x = v114;
        rect.origin.CGFloat y = v115;
        rect.size.width = v116;
        rect.size.double height = (double)v117;
        CFDictionaryRef v118 = (const __CFDictionary *)objc_msgSend((id)CMGetAttachment(a3, v101, 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F54370]);
        CGRectMakeWithDictionaryRepresentation(v118, &rect);
        double v120 = origin.f64[1];
        double v119 = origin.f64[0];
        double v121 = v304.width;
        CGFloat x = rect.origin.x;
        CGFloat y = rect.origin.y;
        CGFloat v124 = rect.size.width;
        CGFloat v125 = rect.size.height;
        if (rect.size.width < v304.width) {
          double v121 = rect.size.width;
        }
        if (v121 >= 0.0) {
          double v126 = v121;
        }
        else {
          double v126 = 0.0;
        }
        if (rect.size.height >= v304.height) {
          double v127 = v304.height;
        }
        else {
          double v127 = rect.size.height;
        }
        if (v127 < 0.0) {
          double v127 = 0.0;
        }
        double v260 = v127;
        double MinX = CGRectGetMinX(rect);
        v309.origin.CGFloat x = x;
        v309.origin.CGFloat y = y;
        v309.size.width = v124;
        v309.size.double height = v125;
        *(double *)&CFStringRef propertyKeya = v126;
        _NF = CGRectGetMaxX(v309) - v126 < v119;
        double v129 = v119;
        if (_NF)
        {
          v310.origin.CGFloat x = x;
          v310.origin.CGFloat y = y;
          v310.size.width = v124;
          v310.size.double height = v125;
          double v129 = CGRectGetMaxX(v310) - v126;
        }
        if (MinX <= v129)
        {
          v312.origin.CGFloat x = x;
          v312.origin.CGFloat y = y;
          v312.size.width = v124;
          v312.size.double height = v125;
          double v130 = v260;
          if (CGRectGetMaxX(v312) - *(double *)&propertyKeya < v119)
          {
            v313.origin.CGFloat x = x;
            v313.origin.CGFloat y = y;
            v313.size.width = v124;
            v313.size.double height = v125;
            double v119 = CGRectGetMaxX(v313) - *(double *)&propertyKeya;
          }
        }
        else
        {
          v311.origin.CGFloat x = x;
          v311.origin.CGFloat y = y;
          v311.size.width = v124;
          v311.size.double height = v125;
          double v119 = CGRectGetMinX(v311);
          double v130 = v260;
        }
        v314.origin.CGFloat x = x;
        v314.origin.CGFloat y = y;
        v314.size.width = v124;
        v314.size.double height = v125;
        double MinY = CGRectGetMinY(v314);
        v315.origin.CGFloat x = x;
        v315.origin.CGFloat y = y;
        v315.size.width = v124;
        v315.size.double height = v125;
        _NF = CGRectGetMaxY(v315) - v130 < v120;
        double v134 = v120;
        if (_NF)
        {
          v316.origin.CGFloat x = x;
          v316.origin.CGFloat y = y;
          v316.size.width = v124;
          v316.size.double height = v125;
          double v134 = CGRectGetMaxY(v316) - v130;
        }
        if (MinY <= v134)
        {
          v318.origin.CGFloat x = x;
          v318.origin.CGFloat y = y;
          v318.size.width = v124;
          v318.size.double height = v125;
          double v86 = v261;
          if (CGRectGetMaxY(v318) - v130 < v120)
          {
            v319.origin.CGFloat x = x;
            v319.origin.CGFloat y = y;
            v319.size.width = v124;
            v319.size.double height = v125;
            double v120 = CGRectGetMaxY(v319) - v130;
          }
        }
        else
        {
          v317.origin.CGFloat x = x;
          v317.origin.CGFloat y = y;
          v317.size.width = v124;
          v317.size.double height = v125;
          double v120 = CGRectGetMinY(v317);
          double v86 = v261;
        }
        origin.f64[0] = v119;
        origin.f64[1] = v120;
        *(void *)&v304.width = propertyKeya;
        v304.double height = v130;
        CGFloat v106 = v273;
        double v103 = v276;
        double v74 = v272;
        double v105 = v271;
        CGFloat v107 = v280;
      }
      -[BWPixelTransferNode _ensureIntermediatePoolWithDimensions:]((uint64_t)self, v109);
      -[BWPixelTransferNode _ensureTransferSession]((uint64_t)self);
      v135 = [(BWPixelBufferPool *)self->_intermediateBufferPool newPixelBuffer];
      if (v135)
      {
        v131 = v135;
        if (v288)
        {
          double v136 = v304.width;
          if (v304.width < 16.0)
          {
            int v137 = 16 - (int)v304.width;
            v304.width = 16.0;
            int v138 = 17 - (int)v136;
            if ((int)v136 <= 16) {
              int v138 = v137;
            }
            double v139 = origin.f64[0] - (double)(v138 >> 1);
            if (v139 < 0.0) {
              double v139 = 0.0;
            }
            origin.f64[0] = v139;
          }
          double v140 = v304.height;
          if (v304.height < 16.0)
          {
            int v141 = 16 - (int)v304.height;
            v304.double height = 16.0;
            int v142 = 17 - (int)v140;
            if ((int)v140 <= 16) {
              int v142 = v141;
            }
            double v143 = origin.f64[1] - (double)(v142 >> 1);
            if (v143 < 0.0) {
              double v143 = 0.0;
            }
            origin.f64[1] = v143;
          }
          OSType PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
          int IsTenBitPacked = FigCapturePixelFormatIsTenBitPacked(PixelFormatType);
          double v146 = origin.f64[0];
          if (IsTenBitPacked)
          {
            float v147 = origin.f64[0];
            double v146 = (double)(int)FigCaptureRoundFloatToMultipleOf(6, v147);
            origin.f64[0] = v146;
          }
          float64_t v148 = origin.f64[1];
          float64x2_t v149 = (float64x2_t)v304;
          CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(*(CGRect *)&v146);
          if (self->_doGMLogging && dword_1EB4C56F0)
          {
            *(_DWORD *)&v301[4] = 0;
            v301[0] = OS_LOG_TYPE_DEFAULT;
            v151 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v151, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
        else
        {
          CFDictionaryRef DictionaryRepresentation = 0;
        }
        v132 = (__CFString *)VTSessionSetProperty(self->_transferSession, (CFStringRef)*MEMORY[0x1E4F45170], DictionaryRepresentation);
        if (v132)
        {
          limitedGMErrorLogger = self->_limitedGMErrorLogger;
          v153 = NSString;
          v255 = [(BWNode *)self name];
          v154 = v153;
          a3 = sbufa;
          -[BWLimitedGMErrorLogger logErrorNumber:errorString:](limitedGMErrorLogger, "logErrorNumber:errorString:", v132, [v154 stringWithFormat:@"%@: %p: %p: setting source crop rect transfer property to %@", v255, self, self->_transferSession, DictionaryRepresentation]);
        }
        if (DictionaryRepresentation) {
          CFRelease(DictionaryRepresentation);
        }
        if (v132) {
          goto LABEL_155;
        }
        v281 = v131;
        v155 = (__CFString *)VTPixelTransferSessionTransferImage(self->_transferSession, pixelBuffer, v131);
        BOOL doGMLogging = self->_doGMLogging;
        int v157 = dword_1EB4C56F0;
        if (self->_doGMLogging && dword_1EB4C56F0)
        {
          *(_DWORD *)&v301[4] = 0;
          v301[0] = OS_LOG_TYPE_DEFAULT;
          v158 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          BOOL doGMLogging = self->_doGMLogging;
          int v157 = dword_1EB4C56F0;
          a3 = sbufa;
        }
        if (doGMLogging && v157)
        {
          *(_DWORD *)&v301[4] = 0;
          v301[0] = OS_LOG_TYPE_DEFAULT;
          v159 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v159, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          BOOL doGMLogging = self->_doGMLogging;
          int v157 = dword_1EB4C56F0;
          a3 = sbufa;
        }
        if (doGMLogging && v157)
        {
          *(_DWORD *)&v301[4] = 0;
          v301[0] = OS_LOG_TYPE_DEFAULT;
          v160 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v160, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          a3 = sbufa;
        }
        if (v155)
        {
          v132 = v155;
          v161 = self->_limitedGMErrorLogger;
          v162 = NSString;
          v163 = [(BWNode *)self name];
          CMSampleBufferGetPresentationTimeStamp(&v300, a3);
          v131 = v281;
          -[BWLimitedGMErrorLogger logErrorNumber:errorString:](v161, "logErrorNumber:errorString:", v132, [v162 stringWithFormat:@"%@: %p: %.4lf: %p: transferring from %p to %p", v163, self, CMTimeGetSeconds(&v300), self->_transferSession, pixelBuffer, v281]);
LABEL_155:
          FigDebugAssert3();
LABEL_247:
          CFRelease(v131);
          goto LABEL_248;
        }
        v131 = v281;
        if (fractionalSourceRectEnabled)
        {
          origin.f64[0] = ptn_rectBoundedByDimensions(v109, (double)(int)v109 / v304.width * (*(double *)v264 - origin.f64[0]), (double)SHIDWORD(v109) / v304.height * (*(double *)&v264[1] - origin.f64[1]), (double)(int)v109 / v304.width * v265);
          origin.f64[1] = v164;
          v304.width = v165;
          v304.double height = v166;
          int v288 = 1;
        }
        else
        {
          int v288 = 0;
        }
        pixelBuffer = v281;
LABEL_160:
        -[BWPixelTransferNode _ensureRotationSession]((uint64_t)self);
        if (self->_generatesHistogram)
        {
          v320.origin.CGFloat x = v106;
          v320.size.width = v105;
          v320.size.double height = v107;
          double v167 = v74;
          v320.origin.CGFloat y = v74;
          double v168 = v320.size.height;
          BOOL v169 = CGRectIsNull(v320);
          double v170 = 0.0;
          double v171 = 0.0;
          double v172 = v86;
          double v173 = v103;
          if (!v169)
          {
            FigCaptureMetadataUtilitiesDenormalizeCropRect(v273, v167, v105, v168);
            double v175 = v174;
            double v277 = v103;
            double v177 = v176;
            double v282 = v178;
            *(float *)&double v179 = v179;
            double v170 = (double)(int)FigCaptureRoundFloatToMultipleOf(2, *(float *)&v179);
            float v180 = v175;
            double v171 = (double)(int)FigCaptureRoundFloatToMultipleOf(2, v180);
            float v181 = v177;
            double v103 = v277;
            double v86 = (double)(int)FigCaptureRoundFloatToMultipleOf(2, v181);
            float v182 = v282;
            double v173 = (double)(int)FigCaptureRoundFloatToMultipleOf(2, v182);
          }
          double v183 = v170;
          double v184 = v171;
          double v185 = v86;
          CFDictionaryRef v186 = CGRectCreateDictionaryRepresentation(*(CGRect *)(&v173 - 3));
          VTSessionSetProperty(self->_rotationSession, (CFStringRef)*MEMORY[0x1E4F450B0], v186);
          double v86 = v172;
          CGFloat v107 = v168;
          CGFloat v106 = v273;
          if (v186) {
            CFRelease(v186);
          }
        }
        if (v288)
        {
          double v187 = 0.0;
          if (self->_liveCropMode == 2
            && FigCaptureVideoDimensionsAreValid(*(void *)&self->_liveValidOutputDimensions))
          {
            v321.origin.CGFloat x = 0.0;
            v321.origin.CGFloat y = 0.0;
            v321.size.width = v86;
            v321.size.double height = v103;
            CGRect v322 = CGRectInset(v321, (v86 - (double)self->_liveValidOutputDimensions.width) * 0.5, (v103 - (double)self->_liveValidOutputDimensions.height) * 0.5);
            double v188 = v322.origin.y;
            CGFloat v189 = v322.size.width;
            double v103 = v322.size.height;
            *(float *)&v322.origin.CGFloat x = v322.origin.x;
            double v187 = (double)(int)FigCaptureRoundFloatToMultipleOf(2, *(float *)&v322.origin.x);
            float v190 = v188;
            double v86 = v189;
            double v191 = (double)(int)FigCaptureRoundFloatToMultipleOf(2, v190);
          }
          else
          {
            double v191 = 0.0;
          }
          OSType v201 = CVPixelBufferGetPixelFormatType(pixelBuffer);
          if (FigCapturePixelFormatIsTenBitPacked(v201))
          {
            float v202 = origin.f64[0];
            origin.f64[0] = (double)(int)FigCaptureRoundFloatToMultipleOf(6, v202);
          }
          uint64_t v203 = VTPixelRotationSessionRotateSubImage();
          BOOL v204 = self->_doGMLogging;
          int v205 = dword_1EB4C56F0;
          if (self->_doGMLogging && dword_1EB4C56F0)
          {
            *(_DWORD *)&v301[4] = 0;
            v301[0] = OS_LOG_TYPE_DEFAULT;
            v206 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v206, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            BOOL v204 = self->_doGMLogging;
            int v205 = dword_1EB4C56F0;
            a3 = sbufa;
          }
          if (v204 && v205)
          {
            *(_DWORD *)&v301[4] = 0;
            v301[0] = OS_LOG_TYPE_DEFAULT;
            v210 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v210, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            BOOL v204 = self->_doGMLogging;
            int v205 = dword_1EB4C56F0;
            a3 = sbufa;
          }
          if (v204 && v205)
          {
            *(_DWORD *)&v301[4] = 0;
            v301[0] = OS_LOG_TYPE_DEFAULT;
            v211 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v211, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            a3 = sbufa;
          }
          if (v203)
          {
            v132 = (__CFString *)v203;
            v289 = NSString;
            v292 = self->_limitedGMErrorLogger;
            v212 = [(BWNode *)self name];
            CMSampleBufferGetPresentationTimeStamp(&v299, sbufa);
            double v213 = v86;
            Float64 Seconds = CMTimeGetSeconds(&v299);
            rotationSession = self->_rotationSession;
            OSType v216 = CVPixelBufferGetPixelFormatType(pixelBuffer);
            v217 = BWStringFromCVPixelFormatType(v216);
            v218 = BWStringFromCGRect(origin.f64[0], origin.f64[1], v304.width, v304.height);
            v69 = destinationBuffera;
            OSType v219 = CVPixelBufferGetPixelFormatType(destinationBuffera);
            v259 = BWStringFromCVPixelFormatType(v219);
            v256 = v212;
            a3 = sbufa;
            -[BWLimitedGMErrorLogger logErrorNumber:errorString:](v292, "logErrorNumber:errorString:", v132, [v289 stringWithFormat:@"%@: %p: %.4lf: %p: rotating sub-image with input %@ rect %@, dest %@ rect %@", v256, self, *(void *)&Seconds, rotationSession, v217, v218, v259, BWStringFromCGRect(v187, v191, v213, v103)]);
            FigDebugAssert3();
            goto LABEL_246;
          }
LABEL_220:
          if (self->_generatesHistogram)
          {
            rect.origin.CGFloat x = 0.0;
            LODWORD(v132) = VTSessionCopyProperty(self->_rotationSession, (CFStringRef)*MEMORY[0x1E4F450A8], (CFAllocatorRef)*MEMORY[0x1E4F1CF80], &rect);
            v231 = (void *)[*(id *)&rect.origin.x copy];
            v69 = destinationBuffera;
            if (!v132) {
              CMSetAttachment(*(CMAttachmentBearerRef *)type, (CFStringRef)*MEMORY[0x1E4F531B0], v231, 1u);
            }
          }
          else
          {
            LODWORD(v132) = 0;
            v69 = destinationBuffera;
          }
          -[BWPixelTransferNode _updateMetadataForOutputSampleBuffer:destinationRect:]((uint64_t)self, *(CMAttachmentBearerRef *)type, v187, v191, v86, v103);
          -[BWPixelTransferNode _updateUprightExifOrientationOnSampleBufferIfNeeded:]((uint64_t)self, *(CMAttachmentBearerRef *)type);
          -[BWPixelTransferNode _updatePrimaryCaptureRect:forOutputSampleBuffer:]((uint64_t)self, *(CMAttachmentBearerRef *)type, v106, v272, v105, v107);
          if (self->_liveDeviceOrientationCorrectionEnabled)
          {
            if (!self->_liveRotationDegrees) {
              goto LABEL_230;
            }
            FormatDescription = CMSampleBufferGetFormatDescription(a3);
            CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(FormatDescription);
            -[BWPixelTransferNode _updateLiveDeviceOrientationAffectedMetadataForOutputSampleBuffer:inputDims:inputCropRect:]((unsigned int *)self, *(CMAttachmentBearerRef *)type, (double)Dimensions.width, (double)Dimensions.height, origin.f64[0], origin.f64[1], v304.width, v304.height);
          }
          if (self->_liveRotationDegrees)
          {
            CFTypeRef v234 = (CFTypeRef)[NSNumber numberWithInt:self->_rotationDegrees];
            goto LABEL_232;
          }
LABEL_230:
          if (!v288) {
            goto LABEL_233;
          }
          CFTypeRef v234 = CMGetAttachment(pixelBuffer, @"RotationDegrees", 0);
LABEL_232:
          CMSetAttachment(v69, @"RotationDegrees", v234, 1u);
LABEL_233:
          if (self->_liveFlipHorizontal)
          {
            CFStringRef v235 = @"MirroredHorizontal";
          }
          else
          {
            if (!self->_liveFlipVertical)
            {
              if (!v288) {
                goto LABEL_239;
              }
              CFTypeRef v252 = CMGetAttachment(pixelBuffer, @"MirroredHorizontal", 0);
              CMSetAttachment(v69, @"MirroredHorizontal", v252, 1u);
              CFTypeRef v236 = CMGetAttachment(pixelBuffer, @"MirroredVertical", 0);
              v237 = v69;
              CFStringRef v235 = @"MirroredVertical";
LABEL_238:
              CMSetAttachment(v237, v235, v236, 1u);
LABEL_239:
              CFStringRef v238 = (const __CFString *)*MEMORY[0x1E4F24BB8];
              CFTypeRef v239 = CMGetAttachment(pixelBuffer, (CFStringRef)*MEMORY[0x1E4F24BB8], 0);
              CMSetAttachment(v69, v238, v239, 1u);
              CFTypeRef v240 = CMGetAttachment(pixelBuffer, @"AmbientViewingEnvironmentStrength", 0);
              if (v240)
              {
                v241 = (void *)v240;
                IOSurface = CVPixelBufferGetIOSurface(v69);
                BWUtilitiesApplyAVEStrength(IOSurface, v241);
              }
              if (self->_doGMLogging && dword_1EB4C56F0)
              {
                *(_DWORD *)&v301[4] = 0;
                v301[0] = OS_LOG_TYPE_DEFAULT;
                v243 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(v243, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
                a3 = sbufa;
              }
              self->_BOOL doGMLogging = 0;
              -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", *(void *)type, v254, v258);
LABEL_246:
              if (!v131) {
                goto LABEL_248;
              }
              goto LABEL_247;
            }
            CFStringRef v235 = @"MirroredVertical";
          }
          CFTypeRef v236 = (CFTypeRef)MEMORY[0x1E4F1CC38];
          v237 = v69;
          goto LABEL_238;
        }
        if ((self->_conversionMethodForStillImagesDuringHDRVideo | 2) == 3
          && self->_intermediatePixelBufferForStillHDRToSDRConversion)
        {
          Attributes = (void *)CVPixelBufferGetAttributes();
          CFStringRef v193 = (const __CFString *)*MEMORY[0x1E4F45100];
          uint64_t v266 = *MEMORY[0x1E4F24C18];
          objc_msgSend(Attributes, "objectForKeyedSubscript:");
          CFStringRef propertyKeyb = v193;
          VTPixelRotationSessionSetProperty();
          CFStringRef v194 = (const __CFString *)*MEMORY[0x1E4F450E0];
          uint64_t v263 = *MEMORY[0x1E4F24A90];
          objc_msgSend(Attributes, "objectForKeyedSubscript:");
          CFStringRef v195 = v194;
          VTPixelRotationSessionSetProperty();
          CFStringRef v196 = (const __CFString *)*MEMORY[0x1E4F450F8];
          uint64_t v262 = *MEMORY[0x1E4F24BC8];
          objc_msgSend(Attributes, "objectForKeyedSubscript:");
          VTPixelRotationSessionSetProperty();
          uint64_t v197 = VTPixelRotationSessionRotateImage(self->_rotationSession, pixelBuffer, self->_intermediatePixelBufferForStillHDRToSDRConversion);
          BOOL v198 = self->_doGMLogging;
          int v199 = dword_1EB4C56F0;
          if (self->_doGMLogging && dword_1EB4C56F0)
          {
            *(_DWORD *)&v301[4] = 0;
            v301[0] = OS_LOG_TYPE_DEFAULT;
            v200 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v200, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            BOOL v198 = self->_doGMLogging;
            int v199 = dword_1EB4C56F0;
          }
          if (v198 && v199)
          {
            *(_DWORD *)&v301[4] = 0;
            v301[0] = OS_LOG_TYPE_DEFAULT;
            v221 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v221, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            BOOL v198 = self->_doGMLogging;
            int v199 = dword_1EB4C56F0;
          }
          if (v198 && v199)
          {
            *(_DWORD *)&v301[4] = 0;
            v301[0] = OS_LOG_TYPE_DEFAULT;
            v222 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v222, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          -[BWPixelTransferNode _ensureTransferSession]((uint64_t)self);
          id v223 = +[BWVideoFormat pixelBufferAttachmentsForColorSpaceProperties:self->_outputColorSpaceProperties];
          VTSessionSetProperty(self->_transferSession, propertyKeyb, (CFTypeRef)[v223 objectForKeyedSubscript:v266]);
          VTSessionSetProperty(self->_transferSession, v195, (CFTypeRef)[v223 objectForKeyedSubscript:v263]);
          VTSessionSetProperty(self->_transferSession, v196, (CFTypeRef)[v223 objectForKeyedSubscript:v262]);
          VTSessionSetProperty(self->_transferSession, (CFStringRef)*MEMORY[0x1E4F45078], MEMORY[0x1E4F1CC28]);
          uint64_t v224 = v197;
          if (v197) {
            goto LABEL_244;
          }
          int conversionMethodForStillImagesDuringHDRVideo = self->_conversionMethodForStillImagesDuringHDRVideo;
          double v187 = 0.0;
          if (conversionMethodForStillImagesDuringHDRVideo == 3)
          {
            -[BWPixelTransferNode _convertUsingHDRProcessing:toSDR:]((uint64_t)self, self->_intermediatePixelBufferForStillHDRToSDRConversion, destinationBuffera);
            double v191 = 0.0;
            uint64_t v6 = (_DWORD *)MEMORY[0x1E4F1EBA8];
            a3 = sbufa;
            goto LABEL_220;
          }
          uint64_t v6 = (_DWORD *)MEMORY[0x1E4F1EBA8];
          a3 = sbufa;
          if (conversionMethodForStillImagesDuringHDRVideo != 1)
          {
            double v191 = 0.0;
            goto LABEL_220;
          }
          unsigned int v283 = VTPixelTransferSessionTransferImage(self->_transferSession, self->_intermediatePixelBufferForStillHDRToSDRConversion, destinationBuffera);
          BOOL v226 = self->_doGMLogging;
          int v227 = dword_1EB4C56F0;
          if (self->_doGMLogging && dword_1EB4C56F0)
          {
            *(_DWORD *)&v301[4] = 0;
            v301[0] = OS_LOG_TYPE_DEFAULT;
            v228 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v228, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            BOOL v226 = self->_doGMLogging;
            int v227 = dword_1EB4C56F0;
            a3 = sbufa;
          }
          if (v226 && v227)
          {
            *(_DWORD *)&v301[4] = 0;
            v301[0] = OS_LOG_TYPE_DEFAULT;
            v229 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v229, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            BOOL v226 = self->_doGMLogging;
            int v227 = dword_1EB4C56F0;
            a3 = sbufa;
          }
          if (v226 && v227) {
            goto LABEL_217;
          }
          goto LABEL_218;
        }
        unsigned int v283 = VTPixelRotationSessionRotateImage(self->_rotationSession, pixelBuffer, v69);
        BOOL v207 = self->_doGMLogging;
        int v208 = dword_1EB4C56F0;
        if (self->_doGMLogging)
        {
          a3 = sbufa;
          if (!dword_1EB4C56F0)
          {
LABEL_192:
            if (v207 && v208)
            {
              *(_DWORD *)&v301[4] = 0;
              v301[0] = OS_LOG_TYPE_DEFAULT;
              v220 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(v220, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
              BOOL v207 = self->_doGMLogging;
              int v208 = dword_1EB4C56F0;
              a3 = sbufa;
            }
            if (v207 && v208)
            {
LABEL_217:
              *(_DWORD *)&v301[4] = 0;
              v301[0] = OS_LOG_TYPE_DEFAULT;
              v230 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(v230, OS_LOG_TYPE_DEFAULT);
              a3 = sbufa;
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
LABEL_218:
            double v187 = 0.0;
            uint64_t v224 = v283;
            if (!v283)
            {
              double v191 = 0.0;
              goto LABEL_220;
            }
LABEL_244:
            v290 = NSString;
            v293 = self->_limitedGMErrorLogger;
            v284 = [(BWNode *)self name];
            a3 = sbufa;
            CMSampleBufferGetPresentationTimeStamp(&v298, sbufa);
            Float64 v244 = CMTimeGetSeconds(&v298);
            v279 = self->_rotationSession;
            OSType v245 = CVPixelBufferGetPixelFormatType(pixelBuffer);
            v246 = BWStringFromCVPixelFormatType(v245);
            size_t v247 = CVPixelBufferGetWidth(pixelBuffer);
            size_t v248 = CVPixelBufferGetHeight(pixelBuffer);
            v69 = destinationBuffera;
            OSType v249 = CVPixelBufferGetPixelFormatType(destinationBuffera);
            v132 = BWStringFromCVPixelFormatType(v249);
            size_t v250 = CVPixelBufferGetWidth(destinationBuffera);
            -[BWLimitedGMErrorLogger logErrorNumber:errorString:](v293, "logErrorNumber:errorString:", v224, [v290 stringWithFormat:@"%@: %p: %.4lf: %p: rotating scaler rect %@ 0, 0, %lu x %lu, output %@ %lu x %lu, input %p, output %p", v284, self, *(void *)&v244, v279, v246, v247, v248, v132, v250, CVPixelBufferGetHeight(destinationBuffera), pixelBuffer, destinationBuffera]);
            FigDebugAssert3();
            uint64_t v6 = (_DWORD *)MEMORY[0x1E4F1EBA8];
            LODWORD(v132) = v224;
            goto LABEL_246;
          }
          *(_DWORD *)&v301[4] = 0;
          v301[0] = OS_LOG_TYPE_DEFAULT;
          v209 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v209, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          BOOL v207 = self->_doGMLogging;
          int v208 = dword_1EB4C56F0;
        }
        a3 = sbufa;
        goto LABEL_192;
      }
      FigDebugAssert3();
      LODWORD(v132) = FigSignalErrorAt();
    }
    else
    {
      LODWORD(v132) = -12780;
    }
LABEL_248:
    if (v69) {
      CFRelease(v69);
    }
LABEL_250:
    if (*(void *)type) {
      CFRelease(*(CFTypeRef *)type);
    }
    if (v132)
    {
      CMSampleBufferGetPresentationTimeStamp(&v297, a3);
      id v251 = +[BWDroppedSample newDroppedSampleWithReason:0x1EFA67EC0 pts:&v297];
      [(BWNodeOutput *)self->super._output emitDroppedSample:v251];
    }
    if (*v6 == 1) {
      kdebug_trace();
    }
  }
}

- (uint64_t)_intermediateBufferDimensionsForInputDimensions:(uint64_t)a3 outputDimensions:
{
  if (!a1)
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    return v11 | v10;
  }
  int v3 = *(_DWORD *)(a1 + 180);
  double v4 = COERCE_DOUBLE(vrev64_s32((int32x2_t)__PAIR64__(a2, HIDWORD(a2))));
  if (v3 == 270) {
    double v4 = COERCE_DOUBLE(__PAIR64__(a2, HIDWORD(a2)));
  }
  if (v3 == 90) {
    double v4 = COERCE_DOUBLE(__PAIR64__(a2, HIDWORD(a2)));
  }
  float32x2_t v5 = vcvt_f32_s32((int32x2_t)vext_s8((int8x8_t)__PAIR64__(a3, HIDWORD(a3)), *(int8x8_t *)&v4, 4uLL));
  float32x2_t v6 = (float32x2_t)vdup_lane_s32((int32x2_t)v5, 1);
  BOOL v7 = v3 == 90 || v3 == 270;
  float v8 = vdiv_f32(v5, v6).f32[0];
  float v9 = (float)SHIDWORD(a3) / (float)SHIDWORD(v4);
  if (v8 > 4.0)
  {
    if (v9 >= 0.25) {
      goto LABEL_17;
    }
    goto LABEL_14;
  }
  if (v8 < 0.25 && v9 > 4.0)
  {
LABEL_14:
    FigDebugAssert3();
    goto LABEL_15;
  }
  if (v9 <= 4.0)
  {
    if (v8 < 0.25 || v9 < 0.25)
    {
      v24.i64[0] = SHIDWORD(a2);
      v24.i64[1] = (int)a2;
      __asm { FMOV            V3.2D, #0.25 }
      float64x2_t v26 = vmulq_f64(vcvtq_f64_s64(v24), _Q3);
      __asm { FMOV            V3.2D, #0.5 }
      *(int32x2_t *)&v26.f64[0] = vmovn_s64(vcvtq_s64_f64(vrndpq_f64(vmulq_f64(v26, _Q3))));
      double v28 = COERCE_DOUBLE(vadd_s32(*(int32x2_t *)&v26.f64[0], *(int32x2_t *)&v26.f64[0]));
      v24.i64[0] = SHIDWORD(a3);
      v24.i64[1] = (int)a3;
      __asm { FMOV            V4.2D, #4.0 }
      int32x2_t v30 = vmovn_s64(vcvtq_s64_f64(vrndmq_f64(vmulq_f64(vmulq_f64(vcvtq_f64_s64(v24), _Q4), _Q3))));
      double v20 = COERCE_DOUBLE(vadd_s32(v30, v30));
      if (!_ZF) {
        double v20 = 0.0;
      }
      if (!*(_DWORD *)(a1 + 100)) {
        double v20 = v28;
      }
      goto LABEL_18;
    }
LABEL_15:
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    return v11 | v10;
  }
LABEL_17:
  v12.i64[0] = SHIDWORD(a3);
  v12.i64[1] = (int)a3;
  __asm { FMOV            V1.2D, #0.25 }
  float64x2_t v18 = vmulq_f64(vcvtq_f64_s64(v12), _Q1);
  __asm { FMOV            V1.2D, #0.5 }
  *(int32x2_t *)&v18.f64[0] = vmovn_s64(vcvtq_s64_f64(vrndpq_f64(vmulq_f64(v18, _Q1))));
  double v20 = COERCE_DOUBLE(vadd_s32(*(int32x2_t *)&v18.f64[0], *(int32x2_t *)&v18.f64[0]));
LABEL_18:
  if (v7) {
    int v21 = HIDWORD(v20);
  }
  else {
    int v21 = LODWORD(v20);
  }
  if (v7) {
    LODWORD(v11) = LODWORD(v20);
  }
  else {
    LODWORD(v11) = HIDWORD(v20);
  }
  if ((int)v11 <= 16) {
    uint64_t v11 = 16;
  }
  else {
    uint64_t v11 = v11;
  }
  if (v21 <= 16) {
    uint64_t v22 = 16;
  }
  else {
    uint64_t v22 = v21;
  }
  uint64_t v10 = v22 << 32;
  return v11 | v10;
}

- (CGFloat)_getUpdatedPrimaryCaptureRectForOutputSampleBuffer:(uint64_t)a1 inputDimensions:(CMAttachmentBearerRef)target
{
  if (a1)
  {
    CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    rect.float64x2_t origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    rect.CGSize size = v3;
    CFDictionaryRef v4 = (const __CFDictionary *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F530D0], 0);
    if (v4 && (*(_DWORD *)(a1 + 176) || *(unsigned char *)(a1 + 184) || *(unsigned char *)(a1 + 186)))
    {
      CGRectMakeWithDictionaryRepresentation(v4, &rect);
      memset(&v8, 0, sizeof(v8));
      if (*(unsigned char *)(a1 + 184)) {
        BOOL v5 = 1;
      }
      else {
        BOOL v5 = *(unsigned char *)(a1 + 186) != 0;
      }
      FigCaptureMakeMirrorAndRotateVideoTransform(1, 1, v5, *(_DWORD *)(a1 + 176), (uint64_t)&v8);
      CGAffineTransform v7 = v8;
      CGRect rect = CGRectApplyAffineTransform(rect, &v7);
    }
  }
  else
  {
    memset(&rect, 0, sizeof(rect));
  }
  return rect.origin.x;
}

- (uint64_t)_ensureRotationSession
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  result = *(void *)(result + 272);
  v2 = &OBJC_IVAR___FigCaptureCMSession__cmsession;
  CGSize v3 = &OBJC_IVAR___FigCaptureCMSession__cmsession;
  CFDictionaryRef v4 = &OBJC_IVAR___FigCaptureCMSession__cmsession;
  if (!result) {
    goto LABEL_5;
  }
  if (*(_DWORD *)(v1 + 280) != *(_DWORD *)(v1 + 180))
  {
    CFRelease((CFTypeRef)result);
    *(void *)(v1 + 272) = 0;
LABEL_5:
    [*(id *)(v1 + 392) resetCurrentLoggingCounter];
    VTPixelRotationSessionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (VTPixelRotationSessionRef *)(v1 + 272));
    *(unsigned char *)(v1 + 400) = 1;
    if (*(unsigned char *)(v1 + 400)) {
      BOOL v5 = dword_1EB4C56F0 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (!v5)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      CGSize v3 = &OBJC_IVAR___FigCaptureCMSession__cmsession;
      v2 = &OBJC_IVAR___FigCaptureCMSession__cmsession;
    }
    CGAffineTransform v7 = *(void **)(v1 + 392);
    if (*(void *)(v1 + 272)) {
      [v7 resetCurrentLoggingCounter];
    }
    else {
      [v7 logErrorNumber:4294954516 errorString:@"failed to create rotation session"];
    }
    *(_DWORD *)(v1 + 280) = *(_DWORD *)(v1 + 180);
    CGAffineTransform v8 = *(const void **)(v1 + 272);
    if (!v8) {
      -[BWPixelTransferNode _ensureRotationSession]();
    }
    CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F450C0];
    uint64_t v10 = (const void *)FigCaptureVTRotationFromDegrees(*(_DWORD *)(v1 + 180));
    result = VTSessionSetProperty(v8, v9, v10);
    if (result) {
      result = [*(id *)(v1 + 392) logErrorNumber:4294954516 errorString:@"failed to set rotation degrees"];
    }
    *(unsigned char *)(v1 + 284) = 0;
    *(unsigned char *)(v1 + 285) = 0;
    *(unsigned char *)(v1 + 286) = 0;
    *(unsigned char *)(v1 + v2[495]) = 0;
    *(_DWORD *)(v1 + v3[496]) = 0;
    CFDictionaryRef v4 = &OBJC_IVAR___FigCaptureCMSession__cmsession;
    *(unsigned char *)(v1 + 288) = 0;
    if (*(unsigned char *)(v1 + 401)) {
      result = VTSessionSetProperty(*(VTSessionRef *)(v1 + 272), (CFStringRef)*MEMORY[0x1E4F45160], MEMORY[0x1E4F1CC38]);
    }
  }
  int v11 = *(unsigned __int8 *)(v1 + 185);
  if (*(unsigned __int8 *)(v1 + 284) != v11)
  {
    result = VTSessionSetProperty(*(VTSessionRef *)(v1 + 272), (CFStringRef)*MEMORY[0x1E4F45098], (CFTypeRef)objc_msgSend(NSNumber, "numberWithBool:", v11 != 0, v21, v22));
    *(unsigned char *)(v1 + 284) = *(unsigned char *)(v1 + 185);
  }
  int v12 = *(unsigned __int8 *)(v1 + 187);
  if (*(unsigned __int8 *)(v1 + 285) != v12)
  {
    result = VTSessionSetProperty(*(VTSessionRef *)(v1 + 272), (CFStringRef)*MEMORY[0x1E4F450A0], (CFTypeRef)objc_msgSend(NSNumber, "numberWithBool:", v12 != 0, v21, v22));
    *(unsigned char *)(v1 + 285) = *(unsigned char *)(v1 + 187);
  }
  int v13 = *(unsigned __int8 *)(v1 + 188);
  if (*(unsigned __int8 *)(v1 + 286) != v13)
  {
    result = VTSessionSetProperty(*(VTSessionRef *)(v1 + 272), (CFStringRef)*MEMORY[0x1E4F450C8], (CFTypeRef)objc_msgSend(NSNumber, "numberWithBool:", v13 != 0, v21, v22));
    *(unsigned char *)(v1 + 286) = *(unsigned char *)(v1 + 188);
  }
  if (*(unsigned __int8 *)(v1 + v2[495]) != *(unsigned __int8 *)(v1 + 205))
  {
    if (*(unsigned char *)(v1 + 205)) {
      CFDictionaryRef v14 = (CFTypeRef *)MEMORY[0x1E4F1CFC8];
    }
    else {
      CFDictionaryRef v14 = (CFTypeRef *)MEMORY[0x1E4F1CFD0];
    }
    result = VTSessionSetProperty(*(VTSessionRef *)(v1 + 272), (CFStringRef)*MEMORY[0x1E4F45088], *v14);
    *(unsigned char *)(v1 + v2[495]) = *(unsigned char *)(v1 + 205);
  }
  if (*(_DWORD *)(v1 + v3[496]) != *(_DWORD *)(v1 + 240))
  {
    id v15 = +[BWVideoFormat pixelBufferAttachmentsForColorSpaceProperties:](BWVideoFormat, "pixelBufferAttachmentsForColorSpaceProperties:");
    [v15 objectForKeyedSubscript:*MEMORY[0x1E4F24C18]];
    VTPixelRotationSessionSetProperty();
    [v15 objectForKeyedSubscript:*MEMORY[0x1E4F24A90]];
    VTPixelRotationSessionSetProperty();
    [v15 objectForKeyedSubscript:*MEMORY[0x1E4F24BC8]];
    result = VTPixelRotationSessionSetProperty();
    *(_DWORD *)(v1 + v3[496]) = *(_DWORD *)(v1 + 240);
  }
  int v16 = *(unsigned __int8 *)(v1 + 355);
  if (*(unsigned __int8 *)(v1 + v4[497]) != v16)
  {
    result = VTSessionSetProperty(*(VTSessionRef *)(v1 + 272), (CFStringRef)*MEMORY[0x1E4F45090], (CFTypeRef)objc_msgSend(NSNumber, "numberWithBool:", v16 != 0, v21, v22));
    *(unsigned char *)(v1 + v4[497]) = *(unsigned char *)(v1 + 355);
  }
  if (*(_DWORD *)(v1 + 356) == 2)
  {
    size_t v17 = (void *)[*(id *)(v1 + 8) videoFormat];
    float64x2_t v18 = (void *)[*(id *)(v1 + 16) videoFormat];
    if ([v17 isHLGColorSpace] && !objc_msgSend(v18, "isHLGColorSpace"))
    {
      CGFloat v19 = (const void *)MEMORY[0x1E4F1CC38];
      double v20 = (const void *)MEMORY[0x1E4F1CC28];
    }
    else
    {
      CGFloat v19 = (const void *)MEMORY[0x1E4F1CC28];
      double v20 = (const void *)MEMORY[0x1E4F1CC38];
    }
    VTSessionSetProperty(*(VTSessionRef *)(v1 + 272), (CFStringRef)*MEMORY[0x1E4F45080], v20);
    return VTSessionSetProperty(*(VTSessionRef *)(v1 + 272), (CFStringRef)*MEMORY[0x1E4F45078], v19);
  }
  return result;
}

- (void)_updateUprightExifOrientationOnSampleBufferIfNeeded:(uint64_t)a1
{
  if (a1)
  {
    int v4 = objc_msgSend((id)CMGetAttachment(target, @"UprightExifOrientation", 0), "intValue");
    int v5 = v4;
    if (*(_DWORD *)(a1 + 180) || *(unsigned char *)(a1 + 185))
    {
      BOOL v6 = 0;
      if (v4) {
        goto LABEL_5;
      }
    }
    else
    {
      BOOL v6 = *(unsigned char *)(a1 + 187) == 0;
      if (v4)
      {
LABEL_5:
        if (!v6)
        {
          char v13 = 0;
          int v7 = FigCaptureRotationDegreesAndMirroringFromExifOrientation(v4, &v13);
          char v12 = 0;
          int v8 = ptn_rotationDegreesAndMirroringFromLiveConfiguration(*(unsigned int *)(a1 + 180), *(unsigned __int8 *)(a1 + 185), *(unsigned __int8 *)(a1 + 187), &v12);
          if (v12) {
            BOOL v9 = v13 == 0;
          }
          else {
            BOOL v9 = v13 != 0;
          }
          if (v9 && (v8 == 270 || v8 == 90)) {
            v7 += 180;
          }
          int v10 = FigCaptureNormalizeAngle(v7 - v8);
          int v11 = (const void *)objc_msgSend(NSNumber, "numberWithInt:", FigCaptureExifOrientationFromRotationDegreesAndMirroring(v10, v9));
          CMSetAttachment(target, @"UprightExifOrientation", v11, 1u);
        }
      }
    }
    *(_DWORD *)(a1 + 296) = v5;
  }
}

- (void)_updatePrimaryCaptureRect:(CGFloat)a3 forOutputSampleBuffer:(CGFloat)a4
{
  if (a1)
  {
    CFStringRef v11 = (const __CFString *)*MEMORY[0x1E4F530D0];
    if (CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F530D0], 0))
    {
      v14.origin.CGFloat x = a3;
      v14.origin.CGFloat y = a4;
      v14.size.width = a5;
      v14.size.double height = a6;
      if (!CGRectIsNull(v14))
      {
        v15.origin.CGFloat x = a3;
        v15.origin.CGFloat y = a4;
        v15.size.width = a5;
        v15.size.double height = a6;
        CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v15);
        CMSetAttachment(target, v11, DictionaryRepresentation, 1u);
        if (DictionaryRepresentation)
        {
          CFRelease(DictionaryRepresentation);
        }
      }
    }
  }
}

- (uint64_t)_updateMetadataForOutputSampleBuffer:(CGFloat)a3 destinationRect:(CGFloat)a4
{
  if (!result) {
    return result;
  }
  uint64_t v10 = result;
  result = (uint64_t)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (!result) {
    return result;
  }
  CFStringRef v11 = (void *)result;
  int v12 = *(_DWORD *)(v10 + 100);
  if (v12)
  {
    if (v12 == 2)
    {
      if (FigCaptureVideoDimensionsAreValid(*(void *)(v10 + 252)))
      {
        v36.origin.CGFloat x = a3;
        v36.origin.CGFloat y = a4;
        v36.size.width = a5;
        v36.size.double height = a6;
        CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v36);
        CFTypeRef v30 = CFAutorelease(DictionaryRepresentation);
        uint64_t v31 = *MEMORY[0x1E4F54370];
        unint64_t v32 = v11;
LABEL_14:
        return [v32 setObject:v30 forKeyedSubscript:v31];
      }
    }
    else if (v12 != 1)
    {
      return result;
    }
LABEL_13:
    uint64_t v31 = *MEMORY[0x1E4F54370];
    unint64_t v32 = v11;
    CFTypeRef v30 = 0;
    goto LABEL_14;
  }
  if (*(unsigned char *)(v10 + 168)) {
    goto LABEL_13;
  }
  if (!*(_DWORD *)(v10 + 180))
  {
    CGSize v13 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v33.float64x2_t origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v33.CGSize size = v13;
    uint64_t v14 = *MEMORY[0x1E4F54370];
    result = CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[(id)result objectForKeyedSubscript:*MEMORY[0x1E4F54370]], &v33);
    if (result)
    {
      CGRect v15 = (void *)[*(id *)(v10 + 8) liveFormat];
      int v16 = (void *)[*(id *)(v10 + 16) liveFormat];
      double v17 = (double)(unint64_t)[v16 width];
      double v18 = v17 / (double)(unint64_t)[v15 width];
      double v19 = (double)(unint64_t)[v16 height];
      double v20 = v19 / (double)(unint64_t)[v15 height];
      float v21 = v18 * v33.origin.x;
      CGFloat v22 = (double)(int)FigCaptureCeilFloatToMultipleOf(2, v21);
      float v23 = v20 * v33.origin.y;
      CGFloat v24 = (double)(int)FigCaptureCeilFloatToMultipleOf(2, v23);
      float v25 = v18 * v33.size.width;
      CGFloat v26 = (double)(int)FigCaptureFloorFloatToMultipleOf(2, v25);
      float v27 = v20 * v33.size.height;
      v35.size.double height = (double)(int)FigCaptureFloorFloatToMultipleOf(2, v27);
      v35.origin.CGFloat x = v22;
      v35.origin.CGFloat y = v24;
      v35.size.width = v26;
      CFDictionaryRef v28 = CGRectCreateDictionaryRepresentation(v35);
      return [v11 setObject:CFAutorelease(v28) forKeyedSubscript:v14];
    }
  }
  return result;
}

- (BOOL)appliesPrimaryCaptureRect
{
  return self->_appliesPrimaryCaptureRect;
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  if (a4)
  {
    outputFormatDescription = self->_outputFormatDescription;
    if (outputFormatDescription)
    {
      CFRelease(outputFormatDescription);
      self->_outputFormatDescription = 0;
    }
  }
  -[BWPixelTransferNode _makeCurrentConfigurationLive]((uint64_t)self);
  v10.receiver = self;
  v10.super_class = (Class)BWPixelTransferNode;
  [(BWNode *)&v10 configurationWithID:a3 updatedFormat:a4 didBecomeLiveForInput:a5];
}

- (uint64_t)_makeCurrentConfigurationLive
{
  if (result)
  {
    uint64_t v1 = result;
    *(_DWORD *)(result + 100) = *(_DWORD *)(result + 96);
    *(unsigned char *)(result + 168) = !CGRectEqualToRect(*(CGRect *)(result + 104), *MEMORY[0x1E4F1DB28]);
    long long v2 = *(_OWORD *)(v1 + 120);
    *(_OWORD *)(v1 + 136) = *(_OWORD *)(v1 + 104);
    *(_OWORD *)(v1 + 152) = v2;
    *(unsigned char *)(v1 + 170) = *(unsigned char *)(v1 + 169);
    *(unsigned char *)(v1 + 207) = *(unsigned char *)(v1 + 206);
    *(void *)(v1 + 252) = *(void *)(v1 + 244);
    *(unsigned char *)(v1 + 172) = *(unsigned char *)(v1 + 171);
    *(_DWORD *)(v1 + 180) = *(_DWORD *)(v1 + 176);
    *(unsigned char *)(v1 + 185) = *(unsigned char *)(v1 + 184);
    *(unsigned char *)(v1 + 187) = *(unsigned char *)(v1 + 186);
    result = -[BWPixelTransferNode _zeroFillBuffers](v1);
    *(unsigned char *)(v1 + 188) = result;
    *(unsigned char *)(v1 + 190) = *(unsigned char *)(v1 + 189);
    *(unsigned char *)(v1 + 205) = *(unsigned char *)(v1 + 204);
    *(unsigned char *)(v1 + 353) = *(unsigned char *)(v1 + 352);
    if (*(unsigned char *)(v1 + 168))
    {
      if (*(unsigned char *)(v1 + 400))
      {
        if (dword_1EB4C56F0)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          return fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
    }
  }
  return result;
}

- (void)setRotationDegrees:(int)a3
{
  self->_rotationDegrees = a3;
}

- (void)setFlipVertical:(BOOL)a3
{
  self->_flipVertical = a3;
}

- (void)setFlipHorizontal:(BOOL)a3
{
  self->_flipHorizontal = a3;
}

- (void)setDeviceOrientationCorrectionEnabled:(BOOL)a3
{
  self->_deviceOrientationCorrectionEnabled = a3;
}

- (uint64_t)_updatePassthroughModes
{
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  if (*(_DWORD *)(result + 96) == 3)
  {
    long long v2 = *(void **)(result + 8);
    uint64_t v3 = 1;
    uint64_t v4 = 1;
  }
  else
  {
    long long v2 = *(void **)(result + 8);
    if (!*(unsigned char *)(v1 + 169))
    {
      [v2 setPassthroughMode:0];
      uint64_t v3 = 0;
      goto LABEL_7;
    }
    uint64_t v3 = 2;
    uint64_t v4 = 2;
  }
  [v2 setPassthroughMode:v4];
LABEL_7:
  [*(id *)(v1 + 16) setPassthroughMode:v3];
  BOOL v5 = [*(id *)(v1 + 8) passthroughMode] != 0;
  BOOL v6 = *(void **)(v1 + 8);
  return [v6 setConversionToPassthroughModeNeverAllowed:v5];
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  if (objc_msgSend(a4, "passthroughMode", a3))
  {
    -[BWNodeOutput setFormat:](self->super._output, "setFormat:", [a4 format]);
    if ([a4 passthroughMode] == 1)
    {
      uint64_t v6 = [NSString stringWithFormat:@"Passthrough %@", -[BWNode name](self, "name")];
      [(BWNode *)self setName:v6];
    }
  }
  else
  {
    self->_passesBuffersThroughWhenPossible = 0;
    -[BWPixelTransferNode _updateOutputRequirements]((uint64_t)self);
  }
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  v3.receiver = self;
  v3.super_class = (Class)BWPixelTransferNode;
  [(BWNode *)&v3 prepareForCurrentConfigurationToBecomeLive];
  -[BWPixelTransferNode _ensureIntermediatePixelBufferForStillHDRToSDRConversionIfNeeded]((uint64_t)self);
}

- (void)_ensureIntermediatePixelBufferForStillHDRToSDRConversionIfNeeded
{
  if (a1)
  {
    long long v2 = (void *)[*(id *)(a1 + 8) videoFormat];
    uint64_t v3 = [*(id *)(a1 + 16) videoFormat];
    if ((*(_DWORD *)(a1 + 356) | 2) == 3
      && (uint64_t v4 = (void *)v3, [v2 isHLGColorSpace])
      && ([v4 isHLGColorSpace] & 1) == 0
      && (FigCapturePixelFormatIsTenBit([v4 pixelFormat]) & 1) == 0)
    {
      uint64_t v6 = *(__CVBuffer **)(a1 + 368);
      if (!v6
        || (size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(v6, 0), WidthOfPlane != [v4 width])
        || (size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(*(CVPixelBufferRef *)(a1 + 368), 0),
            HeightOfPlane != [v4 height]))
      {
        BOOL v9 = *(const void **)(a1 + 368);
        if (v9)
        {
          CFRelease(v9);
          *(void *)(a1 + 368) = 0;
        }
        CFDictionaryRef v10 = +[BWVideoFormat pixelBufferAttachmentsForColorSpaceProperties:](BWVideoFormat, "pixelBufferAttachmentsForColorSpaceProperties:", [v2 colorSpaceProperties]);
        CFStringRef v11 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
        [v11 setObject:MEMORY[0x1E4F1CC08] forKeyedSubscript:*MEMORY[0x1E4F24D20]];
        if (FigCapturePlatformIOSurfaceWiringAssertionEnabled()) {
          [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F24D30]];
        }
        [v11 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F24990]];
        CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        size_t v13 = [v4 width];
        size_t v14 = [v4 height];
        if (FigCapturePixelFormatIsTenBit([v2 pixelFormat])) {
          OSType v15 = 2016686640;
        }
        else {
          OSType v15 = [v4 pixelFormat];
        }
        if (!CVPixelBufferCreate(v12, v13, v14, v15, (CFDictionaryRef)v11, (CVPixelBufferRef *)(a1 + 368)))
        {
          CVBufferSetAttachments(*(CVBufferRef *)(a1 + 368), v10, kCVAttachmentMode_ShouldPropagate);
          if (*(_DWORD *)(a1 + 356) == 3)
          {

            *(void *)(a1 + 376) = 0;
            int v16 = *(const void **)(a1 + 384);
            if (v16)
            {
              CFRelease(v16);
              *(void *)(a1 + 384) = 0;
            }
            long long v21 = 0u;
            long long v20 = 0u;
            HIDWORD(v21) = 1;
            LODWORD(v19) = [v4 width];
            HIDWORD(v19) = objc_msgSend(v4, "height", v19);
            DWORD1(v20) = 100;
            DWORD2(v20) = [v4 pixelFormat];
            *(void *)&long long v21 = *MEMORY[0x1E4F24AC0];
            uint64_t v23 = 0;
            CGFloat v24 = &v23;
            uint64_t v25 = 0x3052000000;
            CGFloat v26 = __Block_byref_object_copy__4;
            float v27 = __Block_byref_object_dispose__4;
            double v17 = (objc_class *)getHDRProcessorClass_softClass;
            uint64_t v28 = getHDRProcessorClass_softClass;
            if (!getHDRProcessorClass_softClass)
            {
              v22[0] = MEMORY[0x1E4F143A8];
              v22[1] = 3221225472;
              v22[2] = __getHDRProcessorClass_block_invoke;
              v22[3] = &unk_1E5C24978;
              v22[4] = &v23;
              __getHDRProcessorClass_block_invoke((uint64_t)v22);
              double v17 = (objc_class *)v24[5];
            }
            _Block_object_dispose(&v23, 8);
            uint64_t v18 = [[v17 alloc] initWithConfig:&v19];
            *(void *)(a1 + 376) = v18;
            if (v18) {
              IOSurfaceAcceleratorCreate();
            }
          }
        }
      }
    }
    else
    {
      BOOL v5 = *(const void **)(a1 + 368);
      if (v5)
      {
        CFRelease(v5);
        *(void *)(a1 + 368) = 0;
      }
    }
  }
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (self->_emitSampleBufferSemaphore)
  {
    v7[0] = self->_emitSampleBufferSemaphore;
    id v5 = +[BWDroppedSample newDroppedSampleFromDroppedSample:backPressureSemaphoresToIgnore:](BWDroppedSample, "newDroppedSampleFromDroppedSample:backPressureSemaphoresToIgnore:", a3, [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1]);
  }
  else
  {
    id v5 = a3;
  }
  uint64_t v6 = v5;
  [(BWNodeOutput *)self->super._output emitDroppedSample:v5];
}

- (void)setCropMode:(int)a3
{
  if (self->_cropMode != a3)
  {
    self->_cropMode = a3;
    -[BWPixelTransferNode _updatePassthroughModes]((uint64_t)self);
  }
}

- (void)setOutputWidth:(unint64_t)a3
{
  if (self->_outputWidth != a3)
  {
    self->_outputsize_t Width = a3;
    -[BWPixelTransferNode _updateOutputRequirements]((uint64_t)self);
  }
}

- (void)setOutputHeight:(unint64_t)a3
{
  if (self->_outputHeight != a3)
  {
    self->_outputHeight = a3;
    -[BWPixelTransferNode _updateOutputRequirements]((uint64_t)self);
  }
}

- (void)setMaxOutputLossyCompressionLevel:(int)a3
{
  if (self->_maxOutputLossyCompressionLevel != a3)
  {
    self->_maxOutputLossyCompressionLevel = a3;
    -[BWPixelTransferNode _updateOutputRequirements]((uint64_t)self);
  }
}

- (void)setMaxLossyCompressionLevel:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[BWPixelTransferNode setMaxInputLossyCompressionLevel:](self, "setMaxInputLossyCompressionLevel:");
  [(BWPixelTransferNode *)self setMaxOutputLossyCompressionLevel:v3];
}

- (void)setMaxInputLossyCompressionLevel:(int)a3
{
  if (self->_maxInputLossyCompressionLevel != a3)
  {
    self->_maxInputLossyCompressionLevel = a3;
    -[BWPixelTransferNode _updateInputRequirements]((uint64_t)self);
  }
}

- (uint64_t)_updateInputRequirements
{
  if (result)
  {
    uint64_t v1 = result;
    long long v2 = (void *)[*(id *)(result + 8) formatRequirements];
    uint64_t v3 = ptn_supportedPixelFormats(*(_DWORD *)(v1 + 264));
    return [v2 setSupportedPixelFormats:v3];
  }
  return result;
}

- (BWPixelTransferNode)init
{
  return [(BWPixelTransferNode *)self initWithfractionalSourceRectEnabled:0];
}

- (BWPixelTransferNode)initWithfractionalSourceRectEnabled:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)BWPixelTransferNode;
  uint64_t v4 = [(BWNode *)&v11 init];
  if (v4)
  {
    id v5 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v4];
    uint64_t v6 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWNodeInput *)v5 setFormatRequirements:v6];

    [(BWNode *)v4 addInput:v5];
    [(BWFormatRequirements *)[(BWNodeInput *)v4->super._input formatRequirements] setSupportedPixelFormats:ptn_supportedPixelFormats(v4->_maxInputLossyCompressionLevel)];
    int v7 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v4];
    int v8 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v8 setSupportedCacheModes:+[BWVideoFormatRequirements cacheModesForOptimizedDisplayAccess]];
    [(BWVideoFormatRequirements *)v8 setPrewireBuffers:0];
    [(BWNodeOutput *)v7 setFormatRequirements:v8];
    [(BWNodeOutput *)v7 setIndexOfInputWhichDrivesThisOutput:0];

    [(BWNode *)v4 addOutput:v7];
    -[BWPixelTransferNode _updateOutputRequirements]((uint64_t)v4);
    [(BWNode *)v4 setSupportsLiveReconfiguration:1];
    BOOL v9 = [BWLimitedGMErrorLogger alloc];
    v4->_limitedGMErrorLogger = -[BWLimitedGMErrorLogger initWithName:maxLoggingCount:](v9, "initWithName:maxLoggingCount:", objc_msgSend(NSString, "stringWithFormat:", @"PixelTransfer %p", v4), 10);
    v4->_BOOL fractionalSourceRectEnabled = a3;
  }
  return v4;
}

- (void)setInputCropRect:(CGRect)a3
{
  self->_inputCropRect = a3;
}

- (void)setAppliesPrimaryCaptureRect:(BOOL)a3
{
  self->_appliesPrimaryCaptureRect = a3;
}

- (void)setOutputPixelFormat:(unsigned int)a3
{
  if (self->_outputPixelFormat != a3)
  {
    self->_outputPixelFormat = a3;
    -[BWPixelTransferNode _updateOutputRequirements]((uint64_t)self);
  }
}

- (void)setPassesBuffersThroughWhenPossible:(BOOL)a3
{
  if (self->_passesBuffersThroughWhenPossible != a3)
  {
    self->_passesBuffersThroughWhenPossible = a3;
    -[BWPixelTransferNode _updatePassthroughModes]((uint64_t)self);
  }
}

- (void)setOutputColorSpaceProperties:(int)a3
{
  if (self->_outputColorSpaceProperties != a3)
  {
    self->_outputColorSpaceProperties = a3;
    -[BWPixelTransferNode _updateOutputRequirements]((uint64_t)self);
  }
}

- (void)setPreferredOutputPixelFormats:(id)a3
{
  if (([a3 isEqualToArray:self->_preferredOutputPixelFormats] & 1) == 0)
  {

    self->_preferredOutputPixelFormats = (NSArray *)[a3 copy];
    -[BWPixelTransferNode _updateOutputRequirements]((uint64_t)self);
  }
}

- (void)setGeneratesHistogram:(BOOL)a3
{
  self->_generatesHistogram = a3;
}

- (void)setAllows422To420Conversion:(BOOL)a3
{
  if (self->_allows422To420Conversion != a3)
  {
    self->_allows422To420Conversion = a3;
    -[BWPixelTransferNode _updateOutputRequirements]((uint64_t)self);
  }
}

- (int)rotationDegrees
{
  return self->_rotationDegrees;
}

- (BOOL)flipVertical
{
  return self->_flipVertical;
}

- (BOOL)flipHorizontal
{
  return self->_flipHorizontal;
}

- (void)setConverting10BitVideoRangeTo8BitFullRangeEncouraged:(BOOL)a3
{
  self->_isConverting10BitVideoRangeTo8BitFullRangeEncouraged = a3;
}

- (void)setConversionMethodForStillImagesDuringHDRVideos:(int)a3
{
  if (a3 == 2 && self->_fractionalSourceRectEnabled) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(NSString, "stringWithFormat:", @"Internal inconsistency, conversionMethodForStillImagesDuringHDRVideos(%d) can not be set when fractional rects is enabled", 2), 0 reason userInfo]);
  }
  if (self->_conversionMethodForStillImagesDuringHDRVideo != a3)
  {
    self->_int conversionMethodForStillImagesDuringHDRVideo = a3;
    -[BWPixelTransferNode _updateOutputRequirements]((uint64_t)self);
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)dealloc
{
  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription) {
    CFRelease(outputFormatDescription);
  }
  rotationSession = self->_rotationSession;
  if (rotationSession) {
    CFRelease(rotationSession);
  }
  transferSession = self->_transferSession;
  if (transferSession) {
    CFRelease(transferSession);
  }

  intermediatePixelBufferForStillHDRToSDRConversion = self->_intermediatePixelBufferForStillHDRToSDRConversion;
  if (intermediatePixelBufferForStillHDRToSDRConversion) {
    CFRelease(intermediatePixelBufferForStillHDRToSDRConversion);
  }
  msrScalerForHDRProcessing = self->_msrScalerForHDRProcessing;
  if (msrScalerForHDRProcessing) {
    CFRelease(msrScalerForHDRProcessing);
  }

  v8.receiver = self;
  v8.super_class = (Class)BWPixelTransferNode;
  [(BWNode *)&v8 dealloc];
}

- (id)nodeSubType
{
  return @"VideoConverter";
}

- (void)makeCurrentConfigurationLive
{
  self->_makeCurrentConfigurationLiveOnNextRenderCallback = 1;
  FigMemoryBarrier();
}

- (BOOL)hasNonLiveConfigurationChanges
{
  int v3 = [(BWFormat *)[(BWNodeOutput *)self->super._output liveFormat] isEqual:[(BWNodeOutput *)self->super._output format]];
  int cropMode = self->_cropMode;
  int liveCropMode = self->_liveCropMode;
  int v6 = v3 & CGRectEqualToRect(self->_inputCropRect, self->_liveInputCropRect) ^ 1;
  if (cropMode != liveCropMode) {
    LOBYTE(v6) = 1;
  }
  if (self->_passesBuffersThroughWhenPossible != self->_livePassesBuffersThroughWhenPossible) {
    LOBYTE(v6) = 1;
  }
  BOOL v7 = self->_validOutputDimensions.width != self->_liveValidOutputDimensions.width
    || self->_validOutputDimensions.height != self->_liveValidOutputDimensions.height;
  char v8 = v7 | v6;
  if (self->_appliesUprightExifOrientationTransformToInput == self->_liveAppliesUprightExifOrientationTransformToInput) {
    char v9 = v8;
  }
  else {
    char v9 = 1;
  }
  if (!self->_appliesUprightExifOrientationTransformToInput)
  {
    BOOL v10 = self->_rotationDegrees == self->_liveRotationDegrees && self->_flipHorizontal == self->_liveFlipHorizontal;
    if (!v10 || self->_flipVertical != self->_liveFlipVertical) {
      char v9 = 1;
    }
  }
  if (self->_liveZeroFillBuffers == -[BWPixelTransferNode _zeroFillBuffers]((BOOL)self)) {
    char v12 = v9;
  }
  else {
    char v12 = 1;
  }
  if (self->_lowSpeed == self->_liveLowSpeed) {
    BOOL v13 = v12;
  }
  else {
    BOOL v13 = 1;
  }
  return self->_expectsMarkerBuffers != self->_liveExpectsMarkerBuffers || v13;
}

- (void)didReachEndOfDataForInput:(id)a3
{
  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription)
  {
    CFRelease(outputFormatDescription);
    self->_outputFormatDescription = 0;
  }
  rotationSession = self->_rotationSession;
  if (rotationSession)
  {
    CFRelease(rotationSession);
    self->_rotationSession = 0;
  }
  transferSession = self->_transferSession;
  if (transferSession)
  {
    CFRelease(transferSession);
    self->_transferSession = 0;
  }

  self->_intermediateBufferPool = 0;
  [(BWDeviceOrientationMonitor *)self->_deviceOrientationMonitor stop];

  self->_deviceOrientationMonitor = 0;
  v8.receiver = self;
  v8.super_class = (Class)BWPixelTransferNode;
  [(BWNode *)&v8 didReachEndOfDataForInput:a3];
}

- (uint64_t)_emitIfMarkerBuffer:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    CFTypeRef v4 = CMGetAttachment(target, @"RecordingSettings", 0);
    CFTypeRef v5 = CMGetAttachment(target, @"FileWriterAction", 0);
    CFTypeRef v6 = CMGetAttachment(target, @"IrisMovieRequest", 0);
    if (v4) {
      BOOL v7 = 0;
    }
    else {
      BOOL v7 = v5 == 0;
    }
    if (v7 && v6 == 0)
    {
      return 0;
    }
    else
    {
      [*(id *)(v3 + 16) emitSampleBuffer:target];
      return 1;
    }
  }
  return result;
}

- (uint64_t)_ensureDeviceOrientationMonitor
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 190))
    {
      if (!*(void *)(result + 192))
      {
        long long v2 = objc_alloc_init(BWDeviceOrientationMonitor);
        *(void *)(v1 + 192) = v2;
        result = [(BWDeviceOrientationMonitor *)v2 start];
        *(_DWORD *)(v1 + 200) = -1;
      }
    }
  }
  return result;
}

- (uint64_t)_updateLiveRotationAndFlipsToApplyUprightExifOrientation:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    char v7 = 0;
    if (a2) {
      result = FigCaptureRotationDegreesAndMirroringFromExifOrientation(a2, &v7);
    }
    else {
      result = 0;
    }
    if (result != *(_DWORD *)(v2 + 180)) {
      *(_DWORD *)(v2 + 180) = result;
    }
    BOOL v3 = result != 270;
    BOOL v4 = result == 270;
    if (result == 90)
    {
      BOOL v3 = 0;
      BOOL v4 = 1;
    }
    if (v7) {
      int v5 = v3;
    }
    else {
      int v5 = 0;
    }
    if (v7) {
      int v6 = v4;
    }
    else {
      int v6 = 0;
    }
    if (*(unsigned __int8 *)(v2 + 185) != v5 || *(unsigned __int8 *)(v2 + 187) != v6)
    {
      *(unsigned char *)(v2 + 185) = v5;
      *(unsigned char *)(v2 + 187) = v6;
    }
  }
  return result;
}

- (uint64_t)_ensureIntermediatePoolWithDimensions:(uint64_t)a1
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    unint64_t v4 = HIDWORD(a2);
    if (*(void *)(a1 + 320) != a2)
    {
      context = (void *)MEMORY[0x1A6272C70]();
      int v5 = objc_alloc_init(BWVideoFormatRequirements);
      int v6 = (void *)[*(id *)(a1 + 8) liveFormat];
      char v7 = (__CFString *)[(id)a1 name];
      if (!v7) {
        char v7 = @"PixelTransfer";
      }
      uint64_t v8 = [(__CFString *)v7 stringByAppendingString:@" Intermediate"];
      [(BWVideoFormatRequirements *)v5 setWidth:(int)a2];
      [(BWVideoFormatRequirements *)v5 setHeight:a2 >> 32];
      v15[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v6, "pixelFormat"));
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v5, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1]);
      size_t v14 = v5;
      id v9 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1]);
      if (v9)
      {
        id v10 = v9;
        if (*(unsigned char *)(a1 + 400) && dword_1EB4C56F0)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }

        *(void *)(a1 + 312) = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v10, 1, v8, [*(id *)(a1 + 16) memoryPool]);
        *(_DWORD *)(a1 + 320) = a2;
        *(_DWORD *)(a1 + 324) = v4;
      }
      else
      {
        FigDebugAssert3();
      }
    }
  }
  return 0;
}

- (uint64_t)_ensureTransferSession
{
  if (result)
  {
    uint64_t v1 = result;
    if (!*(void *)(result + 304))
    {
      VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (VTPixelTransferSessionRef *)(result + 304));
      *(unsigned char *)(v1 + 400) = 1;
      if (*(unsigned char *)(v1 + 400)) {
        BOOL v2 = dword_1EB4C56F0 == 0;
      }
      else {
        BOOL v2 = 1;
      }
      if (!v2)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      unint64_t v4 = *(void **)(v1 + 392);
      if (*(void *)(v1 + 304)) {
        result = [v4 resetCurrentLoggingCounter];
      }
      else {
        result = [v4 logErrorNumber:4294954516 errorString:@"failed to create transfer session"];
      }
      if (!*(void *)(v1 + 304)) {
        -[BWPixelTransferNode _ensureTransferSession]();
      }
    }
  }
  return result;
}

- (uint64_t)_convertUsingHDRProcessing:(__CVBuffer *)a3 toSDR:
{
  v47[3] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    if (*(void *)(result + 376) && *(void *)(result + 384))
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1C9B8]);
      char v7 = (void *)MEMORY[0x1E4F1CA60];
      uint64_t v41 = 0;
      v42 = &v41;
      uint64_t v43 = 0x2020000000;
      uint64_t v8 = (void *)getkHDRProcessingDolbyVisionRPUDataKeySymbolLoc_ptr;
      uint64_t v44 = getkHDRProcessingDolbyVisionRPUDataKeySymbolLoc_ptr;
      if (!getkHDRProcessingDolbyVisionRPUDataKeySymbolLoc_ptr)
      {
        uint64_t v36 = MEMORY[0x1E4F143A8];
        uint64_t v37 = 3221225472;
        v38 = __getkHDRProcessingDolbyVisionRPUDataKeySymbolLoc_block_invoke;
        v39 = &unk_1E5C24978;
        v40 = &v41;
        id v9 = (void *)HDRProcessingLibrary();
        v42[3] = (uint64_t)dlsym(v9, "kHDRProcessingDolbyVisionRPUDataKey");
        getkHDRProcessingDolbyVisionRPUDataKeySymbolLoc_ptr = *(void *)(v40[1] + 24);
        uint64_t v8 = (void *)v42[3];
      }
      _Block_object_dispose(&v41, 8);
      if (!v8) {
        -[BWPixelTransferNode _convertUsingHDRProcessing:toSDR:]();
      }
      uint64_t v10 = [v7 dictionaryWithObject:v6 forKey:*v8];
      IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(a2);
      if (!IOSurface) {
        return FigSignalErrorAt();
      }
      IOSurfaceRef v12 = CVPixelBufferGetIOSurface(a3);
      if (!v12) {
        return FigSignalErrorAt();
      }
      int v35 = 0;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v28 = 0u;
      WORD5(v31) = 3073;
      BYTE12(v31) = 18;
      if (IOSurfaceSetBulkAttachments2()) {
        return FigSignalErrorAt();
      }
      int v27 = 0;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v20 = 0u;
      WORD5(v23) = 3073;
      BYTE12(v23) = 1;
      if (IOSurfaceSetBulkAttachments2())
      {
        return FigSignalErrorAt();
      }
      else
      {
        id v19 = 0;
        if ([*(id *)(v3 + 376) generateMSRColorConfigWithOperation:4 inputSurface:IOSurface outputSurface:v12 metadata:v10 histogram:0 config:&v19] != -17000)goto LABEL_19; {
        BOOL v13 = malloc_type_malloc(0x28uLL, 0x10000407607B2BCuLL);
        }
        *(_DWORD *)BOOL v13 = 3;
        v13[1] = [v19 bytes];
        *((_DWORD *)v13 + 4) = [v19 length];
        *(void *)((char *)v13 + 28) = 0;
        *(void *)((char *)v13 + 20) = 0;
        uint64_t v14 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v13 length:40 freeWhenDone:1];
        uint64_t v15 = *MEMORY[0x1E4F6EC48];
        uint64_t v45 = v14;
        v46[0] = v15;
        uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
        uint64_t v17 = *MEMORY[0x1E4F6EC88];
        v47[0] = v16;
        v47[1] = MEMORY[0x1E4F1CC38];
        uint64_t v18 = *MEMORY[0x1E4F6ED60];
        v46[1] = v17;
        v46[2] = v18;
        v47[2] = MEMORY[0x1E4F1CC28];
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:3];
        result = IOSurfaceAcceleratorTransformSurface();
        if (result)
        {
LABEL_19:
          FigDebugAssert3();
          return 4294954514;
        }
      }
    }
    else
    {
      return FigSignalErrorAt();
    }
  }
  return result;
}

- (unsigned)_updateLiveDeviceOrientationAffectedMetadataForOutputSampleBuffer:(double)a3 inputDims:(double)a4 inputCropRect:(double)a5
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v8 = result;
    result = (unsigned int *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    if (result)
    {
      id v9 = result;
      uint64_t v10 = *MEMORY[0x1E4F53DC8];
      float64_t v49 = (void *)[result objectForKeyedSubscript:*MEMORY[0x1E4F53DC8]];
      result = (unsigned int *)[v49 count];
      if (result)
      {
        unsigned __int8 v84 = 0;
        result = (unsigned int *)ptn_rotationDegreesAndMirroringFromLiveConfiguration(v8[45], *((unsigned __int8 *)v8 + 185), *((unsigned __int8 *)v8 + 187), (char *)&v84);
        if (result | v84)
        {
          int v11 = (int)result;
          double v46 = v9;
          BOOL v12 = round(a3) != round(a7);
          int v13 = round(a4) != round(a8) || v12;
          long long v82 = 0u;
          long long v83 = 0u;
          long long v81 = 0u;
          FigCaptureMakeMirrorAndRotateVideoTransform(1, 1, v84 != 0, (int)result, (uint64_t)&v81);
          int v80 = 0;
          long long v76 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          long long v79 = 0u;
          id obj = (id)[v49 allKeys];
          uint64_t v50 = [obj countByEnumeratingWithState:&v76 objects:v86 count:16];
          if (v50)
          {
            int v55 = v11;
            uint64_t v14 = 0;
            uint64_t v48 = *(void *)v77;
            uint64_t v53 = *MEMORY[0x1E4F538F8];
            double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
            double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
            uint64_t v17 = *MEMORY[0x1E4F54180];
            uint64_t v56 = *MEMORY[0x1E4F54190];
            double v57 = v16;
            double v61 = v15;
            do
            {
              for (uint64_t i = 0; i != v50; ++i)
              {
                int v54 = v14;
                if (*(void *)v77 != v48) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v52 = *(void *)(*((void *)&v76 + 1) + 8 * i);
                float64_t v51 = objc_msgSend(v49, "objectForKeyedSubscript:");
                id v19 = (void *)[v51 objectForKeyedSubscript:v53];
                long long v72 = 0u;
                long long v73 = 0u;
                long long v74 = 0u;
                long long v75 = 0u;
                id v59 = v19;
                uint64_t v20 = [v19 countByEnumeratingWithState:&v72 objects:v85 count:16];
                if (v20)
                {
                  uint64_t v21 = v20;
                  long long v22 = 0;
                  uint64_t v23 = *(void *)v73;
                  do
                  {
                    uint64_t v24 = 0;
                    uint64_t v58 = v21;
                    do
                    {
                      if (*(void *)v73 != v23) {
                        objc_enumerationMutation(v59);
                      }
                      long long v25 = *(void **)(*((void *)&v72 + 1) + 8 * v24);
                      memset(&rect, 0, sizeof(rect));
                      CFDictionaryRef v26 = (const __CFDictionary *)[v25 objectForKeyedSubscript:v17];
                      double v27 = v15;
                      double v28 = v16;
                      if (v26)
                      {
                        CGRectMakeWithDictionaryRepresentation(v26, &rect);
                        long long v68 = v81;
                        long long v69 = v82;
                        long long v70 = v83;
                        ptn_rotateRect(v13, &v68, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, a3, a4, a6, v29, a5, a6, a7, a8);
                        double v28 = v30;
                        double v27 = v31;
                      }
                      if (v28 > 0.0 && v27 > 0.0)
                      {
                        CFDictionaryRef v32 = (const __CFDictionary *)[v25 objectForKeyedSubscript:v17];
                        double v33 = v16;
                        double v34 = v15;
                        if (v32)
                        {
                          CGRectMakeWithDictionaryRepresentation(v32, &rect);
                          long long v68 = v81;
                          long long v69 = v82;
                          long long v70 = v83;
                          ptn_rotateRect(v13, &v68, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, a3, a4, a6, v35, a5, a6, a7, a8);
                          double v33 = v36;
                        }
                        double v60 = v34;
                        CFDictionaryRef v37 = (const __CFDictionary *)[v25 objectForKeyedSubscript:v56];
                        double v38 = v61;
                        if (v37)
                        {
                          CGRectMakeWithDictionaryRepresentation(v37, &rect);
                          long long v68 = v81;
                          long long v69 = v82;
                          long long v70 = v83;
                          ptn_rotateRect(v13, &v68, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, a3, a4, a6, v39, a5, a6, a7, a8);
                          double v16 = v40;
                          double v38 = v41;
                        }
                        uint64_t v42 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v25];
                        FigCFDictionarySetCGRect();
                        if (v33 > 0.0 && v60 > 0.0) {
                          FigCFDictionarySetCGRect();
                        }
                        if (v16 > 0.0 && v38 > 0.0) {
                          FigCFDictionarySetCGRect();
                        }
                        if (FigCFDictionaryGetInt32IfPresent())
                        {
                          int v43 = v80;
                          if (v84) {
                            int v43 = -v80;
                          }
                          FigCaptureNormalizeAngle(v43 + v55);
                          FigCFDictionarySetInt32();
                        }
                        double v16 = v57;
                        double v15 = v61;
                        if (FigCFDictionaryGetInt32IfPresent())
                        {
                          if (v84) {
                            int v44 = -v80;
                          }
                          else {
                            int v44 = v80;
                          }
                          FigCaptureNormalizeAngle(v44);
                          FigCFDictionarySetInt32();
                        }
                        if (FigCFDictionaryGetInt32IfPresent())
                        {
                          FigCaptureNormalizeAngle(v80);
                          FigCFDictionarySetInt32();
                        }
                        if (!v22) {
                          long long v22 = (void *)[MEMORY[0x1E4F1CA48] array];
                        }
                        [v22 addObject:v42];
                        uint64_t v21 = v58;
                      }
                      ++v24;
                    }
                    while (v21 != v24);
                    uint64_t v21 = [v59 countByEnumeratingWithState:&v72 objects:v85 count:16];
                  }
                  while (v21);
                }
                else
                {
                  long long v22 = 0;
                }
                if ([v22 count])
                {
                  uint64_t v14 = v54;
                  if (!v54) {
                    uint64_t v14 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
                  }
                  uint64_t v45 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v51];
                  [v45 setObject:v22 forKeyedSubscript:v53];
                  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithDictionary:", v45), v52);
                }
                else
                {
                  uint64_t v14 = v54;
                }
              }
              uint64_t v50 = [obj countByEnumeratingWithState:&v76 objects:v86 count:16];
            }
            while (v50);
          }
          else
          {
            uint64_t v14 = 0;
          }
          [v46 setObject:v14 forKeyedSubscript:v10];
          return (unsigned int *)[v46 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F53DC0]];
        }
      }
    }
  }
  return result;
}

- (int)cropMode
{
  return self->_cropMode;
}

- (CGRect)inputCropRect
{
  double x = self->_inputCropRect.origin.x;
  double y = self->_inputCropRect.origin.y;
  double width = self->_inputCropRect.size.width;
  double height = self->_inputCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setUpdatesSampleBufferMetadataForIrisVIS:(BOOL)a3
{
  self->_updatesSampleBufferMetadataForIrisVIS = a3;
}

- (BOOL)updatesSampleBufferMetadataForIrisVIS
{
  return self->_updatesSampleBufferMetadataForIrisVIS;
}

- (BOOL)passesBuffersThroughWhenPossible
{
  return self->_passesBuffersThroughWhenPossible;
}

- (unint64_t)outputWidth
{
  return self->_outputWidth;
}

- (unint64_t)outputHeight
{
  return self->_outputHeight;
}

- (unsigned)outputPixelFormat
{
  return self->_outputPixelFormat;
}

- (id)preferredOutputPixelFormats
{
  return self->_preferredOutputPixelFormats;
}

- (int)outputColorSpaceProperties
{
  return self->_outputColorSpaceProperties;
}

- (void)setValidOutputDimensions:(id)a3
{
  self->_validOutputCMVideoDimensions Dimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- ($2825F4736939C4A6D3AD43837233062D)validOutputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_validOutputDimensions;
}

- (int)maxLossyCompressionLevel
{
  if (self->_maxInputLossyCompressionLevel <= self->_maxOutputLossyCompressionLevel) {
    return self->_maxOutputLossyCompressionLevel;
  }
  else {
    return self->_maxInputLossyCompressionLevel;
  }
}

- (int)maxInputLossyCompressionLevel
{
  return self->_maxInputLossyCompressionLevel;
}

- (int)maxOutputLossyCompressionLevel
{
  return self->_maxOutputLossyCompressionLevel;
}

- (void)setAppliesUprightExifOrientationTransformToInput:(BOOL)a3
{
  self->_appliesUprightExifOrientationTransformToInput = a3;
}

- (BOOL)appliesUprightExifOrientationTransformToInput
{
  return self->_appliesUprightExifOrientationTransformToInput;
}

- (BOOL)deviceOrientationCorrectionEnabled
{
  return self->_deviceOrientationCorrectionEnabled;
}

- (void)setLowSpeed:(BOOL)a3
{
  self->_lowSpeed = a3;
}

- (BOOL)lowSpeed
{
  return self->_lowSpeed;
}

- (void)setEmitSampleBufferSemaphore:(id)a3
{
  emitSampleBufferSemaphore = self->_emitSampleBufferSemaphore;
  if (emitSampleBufferSemaphore != a3)
  {

    self->_emitSampleBufferSemaphore = (OS_dispatch_semaphore *)a3;
  }
}

- (OS_dispatch_semaphore)emitSampleBufferSemaphore
{
  return self->_emitSampleBufferSemaphore;
}

- (void)setExpectsMarkerBuffers:(BOOL)a3
{
  self->_expectsMarkerBuffers = a3;
}

- (BOOL)expectsMarkerBuffers
{
  return self->_expectsMarkerBuffers;
}

- (BOOL)generatesHistogram
{
  return self->_generatesHistogram;
}

- (int)conversionMethodForStillImagesDuringHDRVideos
{
  return self->_conversionMethodForStillImagesDuringHDRVideo;
}

- (BOOL)allows422To420Conversion
{
  return self->_allows422To420Conversion;
}

- (BOOL)isConverting10BitVideoRangeTo8BitFullRangeEncouraged
{
  return self->_isConverting10BitVideoRangeTo8BitFullRangeEncouraged;
}

- (BOOL)firstFrameProcessed
{
  return self->_firstFrameProcessed;
}

- (void)setFirstFrameProcessed:(BOOL)a3
{
  self->_firstFrameProcessed = a3;
}

- (void)_ensureTransferSession
{
  __assert_rtn("-[BWPixelTransferNode _ensureTransferSession]", "BWPixelTransferNode.m", 1633, "_transferSession != NULL");
}

- (void)_ensureRotationSession
{
  __assert_rtn("-[BWPixelTransferNode _ensureRotationSession]", "BWPixelTransferNode.m", 1520, "_rotationSession != NULL");
}

- (void)_convertUsingHDRProcessing:toSDR:.cold.1()
{
  v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkHDRProcessingDolbyVisionRPUDataKey(void)"), @"BWPixelTransferNode.m", 65, @"%s", dlerror());
  __break(1u);
}

@end