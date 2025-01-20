@interface BWPreviewStitcherNode
+ (void)initialize;
- ($2825F4736939C4A6D3AD43837233062D)outputDimensions;
- (BOOL)_currentlyZoomingOrSwitchingCameras;
- (BOOL)centerRegistrationValid;
- (BOOL)displaysWidestCameraOnly;
- (BOOL)flipHorizontal;
- (BOOL)flipVertical;
- (BOOL)forceBlackFillBorderEnabled;
- (BOOL)generatesHistogram;
- (BOOL)overCaptureNotSupportedByDownstreamNodes;
- (BOOL)previewTapRegistered;
- (BOOL)previewsWideBeforeSlaveStreamStarts;
- (BOOL)rebuildingGraphForTrueVideoTransition;
- (BOOL)superWideFallbackForMacroSceneEnabled;
- (BOOL)thermalPressureIsCritical;
- (BOOL)tooCloseFor1xStitching;
- (BOOL)tooCloseForSuperWideRegistration;
- (BOOL)trueVideoCaptureEnabled;
- (BOOL)trueVideoCaptureFormatIs4K;
- (BOOL)waitsForFencedUpdateBeforeFirstEmit;
- (BOOL)waitsForRegistrationToComplete;
- (BWPreviewStitcherDelegate)delegate;
- (BWPreviewStitcherNode)initWithCameraInfoByPortType:(id)a3 sensorBinningFactor:(id)a4 inputBuffersHaveHorizontalOverscanOnly:(BOOL)a5 registrationType:(int)a6 registrationMetalCommandQueue:(id)a7 excludeStaticComponentFromAlignmentShifts:(BOOL)a8 propagateDepth:(BOOL)a9 propagateStyles:(BOOL)a10 parallaxMitigationBasedOnZoomFactorEnabled:(BOOL)a11 zoomPIPOverlayEnabled:(BOOL)a12 zoomPIPMinimumUIZoomFactor:(float)a13 zoomPIPSingleStreamModeEnabled:(BOOL)a14 preallocateOutputBufferPool:(BOOL)a15;
- (BWPreviewStitcherNode)initWithStitchingDisabledAndZoomPIPOverlayEnabled:(BOOL)a3 zoomPIPMinimumUIZoomFactor:(float)a4 zoomPIPSingleStreamModeEnabled:(BOOL)a5 propagateDepth:(BOOL)a6 propagateStyles:(BOOL)a7 parallaxMitigationBasedOnZoomFactorEnabled:(BOOL)a8 preallocateOutputBufferPool:(BOOL)a9;
- (CMSampleBufferRef)_copySampleBufferToAttachForZoomPIPFromWiderSampleBuffer:(const void *)a3 narrowerSampleBuffer:;
- (CMSampleBufferRef)_newStitchedSampleBufferFromWide:(opaqueCMSampleBuffer *)a3 tele:(float64x2_t *)a4 wideRegionsShifts:(CGRect *)a5 teleShift:(double *)a6 primaryCaptureRectOut:(double *)a7 primaryCaptureRectBeforeCroppingOut:(void *)a8 centerWideShiftOut:(float64_t)a9 currentFrameRate:(float64_t)a10 inputCropRectOut:(float)a11;
- (_BYTE)_updateOverCaptureStatusWithWiderSampleBuffer:(CMAttachmentBearerRef)a3 narrowerSampleBuffer:;
- _setOverCaptureStatus:(_DWORD *)result;
- (__CFString)_displayStringForPortType:(__CFString *)result;
- (double)_computeBravoWideToTeleShiftFromWideSampleBuffer:(uint64_t)a3 teleSampleBuffer:;
- (double)_scaleFactorAppliedForPixelBuffer:(void *)a3 usedSourceRect:(double)result primaryCaptureRectAspectRatio:(double)a5 metadata:(double)a6;
- (double)_wideBaseZoomFactorWithOverride;
- (double)_wideBaseZoomFactorWithOverrideLocked;
- (double)primaryCameraAspectRatio;
- (double)primaryCaptureRectCenterX;
- (double)primaryCaptureRectYInset;
- (double)trueVideoCaptureAdditionalZoomFactor;
- (double)trueVideoTransitionPercentComplete;
- (float)superWideFocusDistance;
- (float)wideFocusDistance;
- (id)focusingDescription;
- (id)nodeSubType;
- (id)nodeType;
- (id)overCaptureStatusString;
- (id)previewRegistrationType;
- (id)primaryCameraShortDisplayName;
- (id)wideFallbackDescription;
- (int)maxLossyCompressionLevel;
- (int)rotationDegrees;
- (int32x2_t)_teleOpacityPool;
- (opaqueCMSampleBuffer)trueVideoTransitionReferenceSampleBuffer;
- (uint64_t)_callDelegateWithAppliedWiderShift:(CVPixelBufferRef)a3 narrowerShift:(uint64_t)a4 widerScaleFactor:(uint64_t)a5 narrowerScaleFactor:(uint64_t)a6 widerPixelBuffer:(int)a7 narrowerPixelBuffer:(int)a8 widerNondisruptiveSwitchingZoomFactor:(double)a9 narrowerNondisruptiveSwitchingZoomFactor:(double)a10 widerPortType:(double)a11 narrowerPortType:(double)a12 inSuperWideMacroMode:(float)a13 widerShiftAtBaseZoom:(double)a14;
- (uint64_t)_compensateForMissingFOVUsingPixelBuffer:(__CVBuffer *)a3 sourceRect:(int)a4 destinationContainingRect:(int)a5 destinationInsetRect:(int)a6 outputPixelBuffer:(int)a7;
- (uint64_t)_featheredImageWithTeleImage:(uint64_t)a3 wideImage:(int)a4 teleClipRect:(CGFloat)a5 wideClipRect:(CGFloat)a6 zoomingIn:(CGFloat)a7 progress:(CGFloat)a8;
- (uint64_t)_primaryCameraPortType;
- (uint64_t)_renderHDRPixelBufferToSDR:(uint64_t)a3 toOutputPixelBuffer:(float)a4 progress:;
- (uint64_t)_renderOpacityRampToPixelBuffer:(__CVBuffer *)a3 bounds:(__CVBuffer *)a4 withWidePixelBuffer:(int)a5 telePixelBuffer:(double)a6 zoomingIn:(double)a7 progress:(double)a8 teleBounds:(double)a9 teleShift:(float)a10;
- (uint64_t)_scale30FPSFrameCount:(float)a3 toFrameRate:;
- (uint64_t)_transferPixelBuffer:(CVPixelBufferRef)pixelBuffer rect:(int)a4 intoPixelBuffer:(_OWORD *)a5 rect:(int)a6 isFinalOutput:(int)a7 withInputShift:(int)a8 scale:(CGFloat)a9 inputSourceRectOut:(CGFloat)a10;
- (uint64_t)_updateInputRequirements;
- (uint64_t)_updateShiftCorrectionsAsyncFromComputedShift:(void *)a3 byRegisteringWide:(uint64_t)a4 tele:(double)a5 macroTransitionType:(double)a6;
- (uint64_t)_updateZoomStatusFromWideSampleBuffer:(CMAttachmentBearerRef)target teleSampleBuffer:;
- (unint64_t)_scaleOpacityFrameCount:(int)a3 forCameraFallbackFromWideToTele:(double)a4 recenteringShiftOffset:(double)a5 recenteringStrength:(float)a6 registrationShiftOffset:(double)a7;
- (void)_cameraDisplayTransitionFrameCountForCameraFallbackChange:(float)a3 currentFrameRate:;
- (void)_getInputRect:(CGFloat *)a3 outputRect:(double *)a4 inputShiftAppliedInOutputRect:(__CVBuffer *)a5 toTransferPixelBuffer:(uint64_t)a6 rect:(int)a7 intoPixelBufferDimensions:(int)a8 rect:(CGFloat)a9 withInputShift:(CGFloat)a10 shiftOutsideBoundingRectAllowed:(CGFloat)a11 scale:(CGFloat)a12 forFinalOutput:(CGFloat)a13;
- (void)_initTeleOpacityCIContextWithColorManagementEnabled:(uint64_t)a1;
- (void)_preheatCIRenderingAsync;
- (void)_releaseResources;
- (void)_restitchAndEmitLastInputForAspectAndCenterChange;
- (void)_updateAndGetWideRegionShifts:(double *)a3 teleShift:(int)a4 wideIsSuperWide:(int)a5 forComputedShift:(double)a6 registrationEnabled:(double)a7 currentFrameRate:(float)a8;
- (void)_updateUprightExifOrientationOnSampleBufferIfNeeded:(uint64_t)a1;
- (void)_waitForCIPreheatingToFinish;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)markDelayedEndOfData;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)rampToAdditionalZoomFactor:(double)a3 momentMovieRecordingRecenteringEnabled:(BOOL)a4;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDisplaysWidestCameraOnly:(BOOL)a3;
- (void)setFlipHorizontal:(BOOL)a3;
- (void)setFlipVertical:(BOOL)a3;
- (void)setForceBlackFillBorderEnabled:(BOOL)a3;
- (void)setGeneratesHistogram:(BOOL)a3;
- (void)setMaxLossyCompressionLevel:(int)a3;
- (void)setOutputDimensions:(id)a3;
- (void)setOverCaptureNotSupportedByDownstreamNodes:(BOOL)a3;
- (void)setPreviewTapRegistered:(BOOL)a3;
- (void)setPreviewsWideBeforeSlaveStreamStarts:(BOOL)a3;
- (void)setPrimaryCameraAspectRatio:(double)a3;
- (void)setPrimaryCaptureRectAspectRatio:(double)a3 center:(CGPoint)a4 trueVideoTransitionPercentComplete:(double)a5 trueVideoTransitionReferenceSampleBuffer:(opaqueCMSampleBuffer *)a6 fencePortSendRight:(id)a7;
- (void)setPrimaryCaptureRectCenterX:(double)a3;
- (void)setPrimaryCaptureRectYInset:(double)a3;
- (void)setRebuildingGraphForTrueVideoTransition:(BOOL)a3;
- (void)setRotationDegrees:(int)a3;
- (void)setStoppingForModeSwitch:(BOOL)a3 delayedEndOfDataEnabled:(BOOL)a4 ispFastSwitchEnabled:(BOOL)a5 smartStyleRenderingEnabledInTrueVideoGraph:(BOOL)a6;
- (void)setSuperWideFallbackForMacroSceneEnabled:(BOOL)a3;
- (void)setThermalPressureIsCritical:(BOOL)a3;
- (void)setTrueVideoCaptureAdditionalZoomFactor:(double)a3;
- (void)setTrueVideoCaptureEnabled:(BOOL)a3;
- (void)setTrueVideoCaptureFormatIs4K:(BOOL)a3;
- (void)setWaitsForFencedUpdateBeforeFirstEmit:(BOOL)a3;
- (void)setWaitsForRegistrationToComplete:(BOOL)a3;
@end

@implementation BWPreviewStitcherNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v7 = [(BWNodeOutput *)self->super._output formatRequirements];
  v8 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1EFB02CF0];
  v9 = v8;
  if (!LOBYTE(self->_lastInputPTS.epoch)) {
    [v8 insertObject:&unk_1EFAFE3A0 atIndex:0];
  }
  int v10 = [(BWVideoFormat *)[(BWNodeInput *)self->super._input videoFormat] pixelFormat];
  char IsFullRange = FigCapturePixelFormatIsFullRange(v10);
  char IsTenBit = FigCapturePixelFormatIsTenBit(v10);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __50__BWPreviewStitcherNode_didSelectFormat_forInput___block_invoke;
  v15[3] = &__block_descriptor_34_e35_B24__0__NSNumber_8__NSDictionary_16l;
  char v16 = IsFullRange;
  char v17 = IsTenBit;
  objc_msgSend(v9, "filterUsingPredicate:", objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithBlock:", v15));
  [(BWFormatRequirements *)v7 setSupportedPixelFormats:v9];
  p_outputDimensions = &self->_outputDimensions;
  if (FigCaptureVideoDimensionsAreValid((uint64_t)*p_outputDimensions))
  {
    [(BWFormatRequirements *)v7 setWidth:p_outputDimensions->width];
    uint64_t height = p_outputDimensions->height;
  }
  else
  {
    -[BWFormatRequirements setWidth:](v7, "setWidth:", objc_msgSend((id)objc_msgSend(a4, "videoFormat"), "width"));
    uint64_t height = objc_msgSend((id)objc_msgSend(a4, "videoFormat"), "height");
  }
  [(BWFormatRequirements *)v7 setHeight:height];
  v18[0] = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a3, "colorSpaceProperties"));
  -[BWFormatRequirements setSupportedColorSpaceProperties:](v7, "setSupportedColorSpaceProperties:", [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1]);
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  if (LOBYTE(self->_lastInputPTS.epoch)) {
    [(BWPreviewStitcherDelegate *)self->_delegate previewStitcher:self overCaptureStatusDidChange:HIDWORD(self->_trueVideoCaptureAdditionalZoomFactor)];
  }
  v9.receiver = self;
  v9.super_class = (Class)BWPreviewStitcherNode;
  [(BWNode *)&v9 configurationWithID:a3 updatedFormat:a4 didBecomeLiveForInput:a5];
}

BOOL __50__BWPreviewStitcherNode_didSelectFormat_forInput___block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 intValue];
  return *(unsigned __int8 *)(a1 + 32) == FigCapturePixelFormatIsFullRange(v3)
      && *(unsigned __int8 *)(a1 + 33) == FigCapturePixelFormatIsTenBit(v3);
}

- (void)setOverCaptureNotSupportedByDownstreamNodes:(BOOL)a3
{
  BYTE1(self->_blackFilledBorderRectsBySurfaceID) = a3;
}

- (id)nodeType
{
  return @"Effect";
}

- (void)setPreviewTapRegistered:(BOOL)a3
{
  self->_zoomPIPOverlayEnabled = a3;
}

- (void)setRotationDegrees:(int)a3
{
  self->_rotationDegrees = a3;
}

- (void)setGeneratesHistogram:(BOOL)a3
{
  self->_generatesHistogram = a3;
}

- (void)setFlipVertical:(BOOL)a3
{
  self->_flipVertical = a3;
}

- (void)setFlipHorizontal:(BOOL)a3
{
  self->_flipHorizontal = a3;
}

- (uint64_t)_callDelegateWithAppliedWiderShift:(CVPixelBufferRef)a3 narrowerShift:(uint64_t)a4 widerScaleFactor:(uint64_t)a5 narrowerScaleFactor:(uint64_t)a6 widerPixelBuffer:(int)a7 narrowerPixelBuffer:(int)a8 widerNondisruptiveSwitchingZoomFactor:(double)a9 narrowerNondisruptiveSwitchingZoomFactor:(double)a10 widerPortType:(double)a11 narrowerPortType:(double)a12 inSuperWideMacroMode:(float)a13 widerShiftAtBaseZoom:(double)a14
{
  if (result)
  {
    uint64_t v18 = result;
    if (!*(unsigned char *)(result + 1562) && !*(unsigned char *)(result + 384))
    {
      int v26 = LODWORD(a14);
      double v29 = a11;
      double v32 = *MEMORY[0x1E4F1DAD8];
      double v33 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      double v34 = *MEMORY[0x1E4F1DAD8];
      double v35 = v33;
      double v36 = *MEMORY[0x1E4F1DAD8];
      double v37 = v33;
      if (pixelBuffer)
      {
        double v47 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        double v48 = *MEMORY[0x1E4F1DAD8];
        int Width = CVPixelBufferGetWidth(pixelBuffer);
        int Height = CVPixelBufferGetHeight(pixelBuffer);
        double v33 = v47;
        double v32 = v48;
        double v40 = (float)((float)Width * a15);
        double v34 = -a9 / v40;
        a11 = (float)((float)Height * a15);
        double v35 = -a10 / a11;
        double v36 = -*(double *)&a17 / v40;
        a14 = -*(double *)&a18;
        double v37 = -*(double *)&a18 / a11;
      }
      if (a3)
      {
        double v49 = v34;
        double v41 = v36;
        double v42 = v37;
        double v43 = v35;
        int v44 = CVPixelBufferGetWidth(a3);
        int v45 = CVPixelBufferGetHeight(a3);
        double v35 = v43;
        double v37 = v42;
        double v36 = v41;
        double v34 = v49;
        double v32 = -v29 / (float)((float)v44 * a16);
        a11 = -a12;
        double v33 = -a12 / (float)((float)v45 * a16);
      }
      v46 = *(void **)(v18 + 376);
      *(float *)&a11 = a13;
      LODWORD(a14) = v26;
      return objc_msgSend(v46, "previewStitcher:didApplyWiderShift:widerScaleFactor:forWiderPortType:narrowerShift:narrowerScaleFactor:forNarrowerPortType:inSuperWideMacroMode:widerShiftAtBaseZoom:", v18, a4, a5, a6, v34, v35, a11, v32, v33, a14, v36, v37);
    }
  }
  return result;
}

- (double)_computeBravoWideToTeleShiftFromWideSampleBuffer:(uint64_t)a3 teleSampleBuffer:
{
  if (!a1) {
    return 0.0;
  }
  v6 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  v7 = (void *)[v6 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
  int v8 = [v7 isEqualToString:*MEMORY[0x1E4F52DE8]];
  if (v8)
  {
    double v9 = -[BWPreviewStitcherNode _wideBaseZoomFactorWithOverrideLocked](a1);
    float v10 = *(float *)(a1 + 156);
    v11 = &OBJC_IVAR___BWPreviewStitcherNode__superWideNondisruptiveSwitchingScaleFactor;
  }
  else
  {
    float v12 = *(float *)(a1 + 248);
    if (v12 <= 0.0)
    {
      LODWORD(v9) = *(_DWORD *)(a1 + 164);
      float v10 = *(float *)(a1 + 160);
    }
    else
    {
      float v10 = *(float *)(a1 + 160);
      *(float *)&double v9 = v12 * v10;
    }
    v11 = &OBJC_IVAR___BWPreviewStitcherNode__wideNondisruptiveSwitchingScaleFactor;
  }
  [*(id *)(a1 + 416) computeCameraShiftForWiderCamera:target narrowerCamera:a3 widerToNarrowerCameraScale:(float)(*(float *)&v9 / (float)(v10 * *(float *)(a1 + *v11)))];
  if (*(unsigned char *)(a1 + 264)) {
    double v15 = v14;
  }
  else {
    double v15 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  if (*(unsigned char *)(a1 + 264)) {
    double v16 = v13;
  }
  else {
    double v16 = *MEMORY[0x1E4F1DAD8];
  }
  objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E4F540F0]), "floatValue");
  if (v17 != 0.0)
  {
    double v16 = v16 / v17;
    double v15 = v15 / v17;
  }
  if (v17 <= 1.0 || *(unsigned char *)(a1 + 1560) == 0) {
    int v19 = 0;
  }
  else {
    int v19 = v8;
  }
  if (v19 == 1)
  {
    double v16 = *(double *)(a1 + 272);
    double v15 = *(double *)(a1 + 280);
  }
  float v20 = *(float *)(a1 + 260);
  v21 = &OBJC_IVAR___BWPreviewStitcherNode__wideToTeleBravoShift;
  if (v8) {
    v21 = &OBJC_IVAR___BWPreviewStitcherNode__superWideToWideBravoShift;
  }
  v22 = (double *)(a1 + *v21);
  float v23 = v16;
  float v24 = *v22;
  double *v22 = BWModifiedMovingAverage(v23, v24, v20);
  float v25 = v15;
  float v26 = v22[1];
  v22[1] = BWModifiedMovingAverage(v25, v26, v20);
  return *v22;
}

- (double)_wideBaseZoomFactorWithOverrideLocked
{
  if (!a1) {
    return 0.0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 388));
  double v2 = -[BWPreviewStitcherNode _wideBaseZoomFactorWithOverride]((float *)a1);
  int v3 = LODWORD(v2);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 388));
  LODWORD(result) = v3;
  return result;
}

- (double)_wideBaseZoomFactorWithOverride
{
  if (!a1) {
    return 0.0;
  }
  float v1 = a1[46];
  if (v1 <= 0.0)
  {
    float v1 = a1[45];
    if (v1 <= 0.0)
    {
      float v1 = a1[43];
      if (v1 <= 0.0) {
        float v1 = a1[40];
      }
    }
  }
  *(float *)&double result = v1 * a1[56];
  return result;
}

- (void)_getInputRect:(CGFloat *)a3 outputRect:(double *)a4 inputShiftAppliedInOutputRect:(__CVBuffer *)a5 toTransferPixelBuffer:(uint64_t)a6 rect:(int)a7 intoPixelBufferDimensions:(int)a8 rect:(CGFloat)a9 withInputShift:(CGFloat)a10 shiftOutsideBoundingRectAllowed:(CGFloat)a11 scale:(CGFloat)a12 forFinalOutput:(CGFloat)a13
{
  if (!a1) {
    return;
  }
  if (a5)
  {
    int v30 = *(unsigned __int8 *)(a1 + 1501);
    FigCaptureMetadataUtilitiesScaleRect2D(a9, a10, a11, a12, a19);
    double width = v68.size.width;
    double height = v68.size.height;
    double v59 = a19;
    double v33 = a14 + (a16 - v68.size.height) * 0.5 + a18 * a19;
    double v34 = a13 + (a15 - v68.size.width) * 0.5 + a17 * a19;
    v68.origin.x = v34;
    v68.origin.y = v33;
    v74.origin.x = a13;
    v74.origin.y = a14;
    v74.size.double width = a15;
    v74.size.double height = a16;
    CGRect v69 = CGRectIntersection(v68, v74);
    CGFloat v57 = a13;
    CGFloat v58 = a16;
    CGFloat v56 = a14;
    if (a7) {
      psn_conformRectForMSR420vfBoundedByDimensions(v69.origin.x, v69.origin.y, v69.size.width, v69.size.height, a6, a8);
    }
    else {
      double v35 = psn_conformRectForMSR420vfBoundedByRect(1, v69.origin.x, v69.origin.y, v69.size.width, v69.size.height, a13, a14, a15, a16);
    }
    CGFloat v39 = v38;
    CGFloat v40 = a15;
    CGFloat v66 = v35;
    double v41 = a9 + a11 * ((v35 - v34) / width);
    double v42 = a10 + a12 * ((v36 - v33) / height);
    double v43 = a11 * (v37 / width);
    double v44 = a12 * (v38 / height);
    CGFloat v45 = v37;
    CGFloat v46 = v36;
    if (a7)
    {
      int v47 = CVPixelBufferGetWidth(a5);
      int v48 = CVPixelBufferGetHeight(a5);
      if (v30)
      {
        if (v43 <= (double)v47) {
          double v49 = v43;
        }
        else {
          double v49 = (double)v47;
        }
        if (v49 >= 0.0) {
          double v50 = v49;
        }
        else {
          double v50 = 0.0;
        }
        if (v44 <= (double)v48) {
          double v51 = v44;
        }
        else {
          double v51 = (double)v48;
        }
        if (v51 < 0.0) {
          double v51 = 0.0;
        }
        double v52 = (double)v47 - v50;
        if (v52 >= v41) {
          double v52 = v41;
        }
        if (v52 < 0.0) {
          double v52 = 0.0;
        }
        double v53 = (double)v48 - v51;
        if (v53 >= v42) {
          double v53 = v42;
        }
        if (v53 < 0.0) {
          double v53 = 0.0;
        }
        if (!a2) {
          goto LABEL_36;
        }
      }
      else
      {
        psn_conformRectForMSR420vfBoundedByDimensions(v41, v42, v43, v44, v47 | ((unint64_t)v48 << 32), 0);
        if (!a2) {
          goto LABEL_36;
        }
      }
    }
    else if (v30)
    {
      double v52 = psn_rectBoundedByRect(v41, v42, v43, v44, a9, a10, a11, a12);
      if (!a2) {
        goto LABEL_36;
      }
    }
    else
    {
      double v52 = psn_conformRectForMSR420vfBoundedByRect(0, v41, v42, v43, v44, a9, a10, a11, a12);
      if (!a2)
      {
LABEL_36:
        if (a3)
        {
          *a3 = v66;
          a3[1] = v46;
          a3[2] = v45;
          a3[3] = v39;
        }
        if (a4)
        {
          v70.origin.x = v66;
          v70.origin.y = v46;
          v70.size.double width = v45;
          v70.size.double height = v39;
          double MidX = CGRectGetMidX(v70);
          v71.origin.x = v57;
          v71.origin.y = v56;
          v71.size.double width = v40;
          v71.size.double height = v58;
          double v65 = MidX - CGRectGetMidX(v71);
          v72.origin.x = v66;
          v72.origin.y = v46;
          v72.size.double width = v45;
          v72.size.double height = v39;
          double MidY = CGRectGetMidY(v72);
          v73.origin.x = v57;
          v73.origin.y = v56;
          v73.size.double width = v40;
          v73.size.double height = v58;
          CGFloat v55 = CGRectGetMidY(v73);
          *a4 = v65 / v59;
          a4[1] = (MidY - v55) / v59;
        }
        return;
      }
    }
    *a2 = v52;
    a2[1] = v53;
    a2[2] = v50;
    a2[3] = v51;
    goto LABEL_36;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
}

- (void)_updateAndGetWideRegionShifts:(double *)a3 teleShift:(int)a4 wideIsSuperWide:(int)a5 forComputedShift:(double)a6 registrationEnabled:(double)a7 currentFrameRate:(float)a8
{
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  int v9 = a5;
  double v14 = (double *)MEMORY[0x1E4F1DAD8];
  long long v145 = *MEMORY[0x1E4F1DAD8];
  long long v146 = v145;
  long long v143 = v145;
  long long v147 = v145;
  if (a5)
  {
    int v15 = *(unsigned char *)(a1 + 425) == 0;
    if (!*(unsigned char *)(a1 + 400))
    {
      if (*(unsigned __int8 *)(a1 + 426) | *(unsigned __int8 *)(a1 + 425) || *(unsigned char *)(a1 + 1449))
      {
        [*(id *)(a1 + 416) waitForRegistrationToComplete];
        *(unsigned char *)(a1 + 425) = 1;
        if (*MEMORY[0x1E4F1EBA8] == 1) {
          kdebug_trace();
        }
      }
      else
      {
        int v15 = 1;
      }
    }
  }
  else
  {
    int v15 = 0;
  }
  int v16 = [(id)a1 displaysWidestCameraOnly];
  int v17 = *(unsigned __int8 *)(a1 + 818);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 428));
  uint64_t v142 = a1;
  if (v9)
  {
    if (*(unsigned char *)(a1 + 425))
    {
      int v9 = 1;
    }
    else
    {
      int v18 = *(_DWORD *)(a1 + 396);
      if (!v18) {
        goto LABEL_16;
      }
      int v19 = &OBJC_IVAR___BWPreviewStitcherNode__wideToTeleShiftCorrections;
      if (a4) {
        int v19 = &OBJC_IVAR___BWPreviewStitcherNode__superWideToWideShiftCorrections;
      }
      if (*(_DWORD *)(a1 + *v19 + 148) >= v18)
      {
        int v9 = 1;
        *(unsigned char *)(a1 + 425) = 1;
        if (*MEMORY[0x1E4F1EBA8] == 1) {
          kdebug_trace();
        }
      }
      else
      {
LABEL_16:
        int v9 = 0;
      }
    }
  }
  int v135 = *(unsigned __int8 *)(a1 + 400);
  int v136 = a4;
  if (v135 != v9)
  {
    *(unsigned char *)(a1 + 400) = v9;
    for (uint64_t i = 32; i != 200; i += 56)
    {
      *(unsigned char *)(a1 + 600 + i) = 1;
      *(unsigned char *)(a1 + 432 + i) = 1;
    }
  }
  if (!v16)
  {
    if (!*(unsigned char *)(a1 + 818))
    {
      double v29 = *(void **)(a1 + 864);
      if (v29)
      {
        if (([v29 isRamping] & 1) == 0)
        {
          [*(id *)(a1 + 864) currentValue];
          if (v30 == 0.0)
          {
            *(unsigned char *)(a1 + 818) = 1;

            *(void *)(a1 + 864) = 0;
            *(unsigned char *)(a1 + 904) = 0;
          }
        }
      }
    }
    if (!*(unsigned char *)(a1 + 818)) {
      goto LABEL_38;
    }
    if (!v9)
    {
      int v31 = 0;
      goto LABEL_73;
    }
    int v24 = *(_DWORD *)(a1 + 396);
    if (v24)
    {
      float v25 = &OBJC_IVAR___BWPreviewStitcherNode__wideToTeleShiftCorrections;
      if (a4) {
        float v25 = &OBJC_IVAR___BWPreviewStitcherNode__superWideToWideShiftCorrections;
      }
      int v24 = *(_DWORD *)(a1 + *v25 + 148) >= v24;
      if (a4)
      {
LABEL_36:
        uint64_t v26 = a1;
        int v27 = *(unsigned __int8 *)(a1 + 1388);
        if (!*(unsigned char *)(a1 + 1388))
        {
          int v28 = *(unsigned __int8 *)(a1 + 1360);
LABEL_68:
          if (*(unsigned char *)(v26 + 1306) || *(float *)(a1 + 824) != *(float *)(a1 + 164))
          {
            int v31 = v28 | v27;
            if (v24) {
              goto LABEL_73;
            }
          }
          else
          {
            int v31 = 0;
            if (v24)
            {
LABEL_73:
              *(unsigned char *)(a1 + 818) = 0;
              if (!*(void *)(a1 + 864))
              {
                BOOL v62 = v31 != 0;
                char v63 = a4;
                if (!v31) {
                  char v63 = 0;
                }
                *(unsigned char *)(a1 + 904) = v63;
                *(void *)(a1 + 864) = [[BWRamp alloc] initWithName:@"TeleOpacityRamp"];
                v64 = -[BWPreviewStitcherNode _cameraDisplayTransitionFrameCountForCameraFallbackChange:currentFrameRate:]((void *)a1, v62, a8);
                LODWORD(v65) = 1065017672;
                LODWORD(v66) = 1.0;
                [*(id *)(a1 + 864) startRampFrom:v64 to:2 iterations:0.0 shape:v66 exponentialConvergenceFraction:v65];
                char v38 = v62;
                if (*(unsigned char *)(a1 + 964))
                {
                  float v67 = *(float *)(a1 + 824);
                  char v38 = v62;
                  if (v67 != 0.0)
                  {
                    char v38 = v62;
                    if ((float)(v67 / *(float *)(a1 + 828)) > 1.1) {
                      char v38 = 1;
                    }
                  }
                }
                BOOL v132 = v62;
                goto LABEL_140;
              }
            }
          }
          BOOL v132 = v31 != 0;
          goto LABEL_75;
        }
LABEL_49:
        int v27 = 0;
        int v28 = 0;
        goto LABEL_68;
      }
    }
    else if (a4)
    {
      goto LABEL_36;
    }
    uint64_t v26 = a1;
    if (!*(unsigned char *)(a1 + 1304))
    {
      int v28 = 0;
      int v27 = *(unsigned char *)(a1 + 1305) != 0;
      goto LABEL_68;
    }
    goto LABEL_49;
  }
  if (*(unsigned char *)(a1 + 818))
  {
LABEL_38:
    BOOL v132 = 0;
LABEL_75:
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 428));
    int v39 = 0;
    goto LABEL_76;
  }
  if (!v9)
  {
    BOOL v132 = 0;
    goto LABEL_56;
  }
  int v21 = *(_DWORD *)(a1 + 396);
  if (v21)
  {
    v22 = &OBJC_IVAR___BWPreviewStitcherNode__wideToTeleShiftCorrections;
    if (a4) {
      v22 = &OBJC_IVAR___BWPreviewStitcherNode__superWideToWideShiftCorrections;
    }
    int v21 = *(_DWORD *)(a1 + *v22 + 148) >= v21;
    if (a4)
    {
LABEL_27:
      if (*(unsigned char *)(a1 + 1388))
      {
        float v23 = &OBJC_IVAR___BWPreviewStitcherNode__superWideFallbackShiftRampTargetValueIsSuperWide;
        goto LABEL_53;
      }
      goto LABEL_55;
    }
  }
  else if (a4)
  {
    goto LABEL_27;
  }
  if (*(unsigned char *)(a1 + 1304))
  {
    float v23 = &OBJC_IVAR___BWPreviewStitcherNode__wideFallbackShiftRampTargetValueIsWide;
LABEL_53:
    BOOL v132 = *(unsigned __int8 *)(a1 + *v23) == 0;
    if (!v21) {
      goto LABEL_75;
    }
    goto LABEL_56;
  }
LABEL_55:
  BOOL v132 = 0;
  if (!v21) {
    goto LABEL_75;
  }
LABEL_56:
  if (*(unsigned char *)(a1 + 152))
  {
    if (*(unsigned char *)(a1 + 1440))
    {
      if (*(unsigned char *)(a1 + 904))
      {
        double v32 = *(void **)(a1 + 864);
        if (v32)
        {
          if (([v32 isRamping] & 1) == 0)
          {
            [*(id *)(a1 + 864) currentValue];
            if (v33 == 1.0)
            {

              *(void *)(a1 + 864) = 0;
              *(unsigned char *)(a1 + 904) = 0;
            }
          }
        }
      }
    }
  }
  double v34 = *(void **)(a1 + 864);
  if (v34)
  {
    if (([v34 isRamping] & 1) == 0)
    {
      *(unsigned char *)(a1 + 818) = 1;

      *(void *)(a1 + 864) = 0;
      *(unsigned char *)(a1 + 904) = 0;
    }
    goto LABEL_75;
  }
  *(unsigned char *)(a1 + 904) = v132 & a4;
  *(void *)(a1 + 864) = [[BWRamp alloc] initWithName:@"TeleOpacityRamp"];
  double v35 = -[BWPreviewStitcherNode _cameraDisplayTransitionFrameCountForCameraFallbackChange:currentFrameRate:]((void *)a1, v132, a8);
  LODWORD(v36) = 1065017672;
  LODWORD(v37) = 1.0;
  [*(id *)(a1 + 864) startRampFrom:v35 to:2 iterations:v37 shape:0.0 exponentialConvergenceFraction:v36];
  char v38 = *(unsigned char *)(a1 + 964);
LABEL_140:
  *(unsigned char *)(a1 + 1004) = v38;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 428));
  [*(id *)(a1 + 416) waitForRegistrationToComplete];
  int v39 = 1;
LABEL_76:
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 428));
  int v141 = v9 ^ 1;
  CGFloat v40 = &OBJC_IVAR___BWPreviewStitcherNode__wideToTeleShiftCorrections;
  if (a4) {
    CGFloat v40 = &OBJC_IVAR___BWPreviewStitcherNode__superWideToWideShiftCorrections;
  }
  uint64_t v41 = a1 + *v40;
  if (v39)
  {
    for (uint64_t j = 32; j != 200; j += 56)
      *(unsigned char *)(v41 + j) = 1;
  }
  double v139 = v14[1];
  double v140 = *v14;
  int v134 = v39;
  if (v16)
  {
    if (!v9)
    {
      int v141 = 1;
      double v137 = v14[1];
      double v138 = *v14;
LABEL_108:
      uint64_t v47 = a1;
      goto LABEL_109;
    }
  }
  else if (!a4 || !v9 || *(unsigned char *)(a1 + 1129))
  {
    double v137 = v14[1];
    double v138 = *v14;
    goto LABEL_91;
  }
  if (*(unsigned char *)(v41 + 32) || (double v137 = v14[1], v138 = *v14, *(unsigned char *)(v41 + 88)))
  {
    double v137 = *(double *)(v41 + 136);
    double v138 = *(double *)(v41 + 128);
    int v141 = 1;
  }
LABEL_91:
  if (v135 == v9) {
    int v43 = v39;
  }
  else {
    int v43 = 1;
  }
  if (!v9 || !v43) {
    goto LABEL_108;
  }
  for (uint64_t k = 0; k != 168; k += 56)
  {
    if (!v16 || k == 112 || *(unsigned char *)(v142 + 1389))
    {
      uint64_t v45 = v41 + k;

      *(void *)(v45 + 40) = 0;
      *(void *)(v45 + 48) = 0;
      char v46 = v141 ^ 1;
      if (k == 112) {
        char v46 = 1;
      }
      if (v46)
      {
        *(_OWORD *)uint64_t v45 = *(_OWORD *)(v45 + 16);
      }
      else
      {
        *(double *)uint64_t v45 = v138;
        *(double *)(v45 + 8) = v137;
      }
      *(unsigned char *)(v41 + k + 32) = 0;
    }
  }
  uint64_t v47 = v142;
  *(unsigned char *)(v142 + 1389) = 0;
LABEL_109:
  int v133 = v9;
  if ((v39 & 1) != 0 || (a4 | v16) == 1 && v17 == v16)
  {
    uint64_t v48 = v142;
    if (*(unsigned __int8 *)(v47 + 1305) != *(unsigned __int8 *)(v142 + 1304))
    {
      if (*(unsigned char *)(v142 + 1304))
      {
        *(_OWORD *)(v142 + 1288) = *(_OWORD *)(v142 + 560);
        *(float64x2_t *)(v142 + 1288) = vmulq_n_f64(*(float64x2_t *)(v142 + 1288), dbl_1A5EFDD40[*(unsigned char *)(v142 + 1306) == 0]);
      }
      uint64_t v49 = -[BWPreviewStitcherNode _scale30FPSFrameCount:toFrameRate:](v142, 90, a8);
      if (*(unsigned char *)(v142 + 1307)) {
        uint64_t v49 = -[BWPreviewStitcherNode _scale30FPSFrameCount:toFrameRate:](v142, 55, a8);
      }
      uint64_t v50 = v49;
      int v51 = 0;
      if (!*(unsigned char *)(v142 + 1304))
      {
        [*(id *)(v142 + 1280) currentValue];
        int v51 = v52;
      }
      if ([*(id *)(v142 + 1280) isRamping])
      {
        [*(id *)(v142 + 1280) currentValue];
        int v51 = LODWORD(v53.f64[0]);
        if (*(unsigned char *)(v142 + 1304) || *(float *)v53.f64 == 0.0)
        {
          uint64_t v48 = v142;
        }
        else
        {
          uint64_t v48 = v142;
          double v59 = &dbl_1A5EFDD40[*(unsigned char *)(v142 + 1306) == 0];
          float64x2_t v54 = *(float64x2_t *)(v142 + 1288);
          float64x2_t v60 = vld1q_dup_f64(v59);
          float64x2_t v56 = *(float64x2_t *)(v142 + 560);
          float64x2_t v55 = vsubq_f64(v56, vdivq_f64(v54, v60));
          float64x2_t v53 = vsubq_f64(v54, vmulq_n_f64(v55, (1.0 - *(float *)v53.f64) / *(float *)v53.f64));
          *(float64x2_t *)(v142 + 1288) = v53;
        }
      }
      if (*(unsigned char *)(v48 + 408))
      {
        if (*(unsigned char *)(v48 + 1307)) {
          *(float *)v55.f64 = 49.0;
        }
        else {
          *(float *)v55.f64 = 20.0;
        }
        LODWORD(v57) = 981668463;
        if (*(unsigned char *)(v48 + 1304)) {
          LODWORD(v54.f64[0]) = 1.0;
        }
        else {
          v54.f64[0] = 0.0;
        }
        LODWORD(v56.f64[0]) = 24.0;
        LODWORD(v53.f64[0]) = v51;
        *(float *)&double v58 = a8;
        [*(id *)(v48 + 1280) startSpringRampFrom:v53.f64[0] to:v54.f64[0] withTension:v55.f64[0] friction:v56.f64[0] snapFraction:v57 frameRate:v58];
      }
      else
      {
        LODWORD(v55.f64[0]) = 1065269330;
        if (*(unsigned char *)(v48 + 1304)) {
          LODWORD(v54.f64[0]) = 1.0;
        }
        else {
          v54.f64[0] = 0.0;
        }
        LODWORD(v53.f64[0]) = v51;
        [*(id *)(v48 + 1280) startRampFrom:v50 to:2 iterations:v53.f64[0] shape:v54.f64[0] exponentialConvergenceFraction:v55.f64[0]];
      }
      uint64_t v48 = v142;
      if (*(unsigned char *)(v142 + 1306)) {
        [*(id *)(v142 + 1280) updateRampForNextIteration];
      }
      *(unsigned char *)(v142 + 1305) = *(unsigned char *)(v142 + 1304);
    }
    int v61 = *(unsigned __int8 *)(v48 + 1360);
    if (v39) {
      goto LABEL_151;
    }
  }
  else
  {
    int v61 = *(unsigned __int8 *)(v142 + 1360);
  }
  if ((a4 & (v16 ^ 1) & 1) != 0 || v17 != v16) {
    goto LABEL_175;
  }
LABEL_151:
  if (v61 != *(unsigned __int8 *)(v142 + 1388))
  {
    if (*(unsigned char *)(v142 + 1388))
    {
      if (*(unsigned char *)(v142 + 1464))
      {
        *(_OWORD *)(v142 + 1368) = v143;
      }
      else
      {
        *(_DWORD *)(v142 + 1384) = 1050253722;
        if (((*(unsigned char *)(v142 + 1391) == 0) & ~v15) == 0) {
          *(_DWORD *)(v142 + 1384) = 0;
        }
        *(_OWORD *)(v142 + 1368) = *(_OWORD *)(v142 + 728);
        *(float64x2_t *)(v142 + 1368) = vmulq_n_f64(*(float64x2_t *)(v142 + 1368), 1.0 - *(float *)(v142 + 1384));
      }
    }
    uint64_t v68 = -[BWPreviewStitcherNode _scale30FPSFrameCount:toFrameRate:](v142, 90, a8);
    int v69 = *(unsigned __int8 *)(v142 + 1388);
    if (*(unsigned char *)(v142 + 1388) && !*(unsigned char *)(v142 + 1464) && *(float *)(v142 + 1384) == 0.0)
    {
      int v70 = 0;
      uint64_t v68 = 1;
    }
    else
    {
      if (*(unsigned char *)(v142 + 1391))
      {
        uint64_t v68 = -[BWPreviewStitcherNode _scale30FPSFrameCount:toFrameRate:](v142, 55, a8);
        int v69 = *(unsigned __int8 *)(v142 + 1388);
      }
      int v70 = 0;
      if (!v69)
      {
        [*(id *)(v142 + 1352) currentValue];
        int v70 = v71;
      }
    }
    if ([*(id *)(v142 + 1352) isRamping])
    {
      [*(id *)(v142 + 1352) currentValue];
      int v70 = LODWORD(v72.f64[0]);
      int v75 = *(unsigned __int8 *)(v142 + 1388);
      if (!*(unsigned char *)(v142 + 1388) && *(float *)v72.f64 != 0.0)
      {
        float64x2_t v74 = *(float64x2_t *)(v142 + 1368);
        float64x2_t v72 = vsubq_f64(v74, vmulq_n_f64(vsubq_f64(*(float64x2_t *)(v142 + 728), vdivq_f64(v74, (float64x2_t)vdupq_lane_s64(COERCE__INT64(1.0 - *(float *)(v142 + 1384)), 0))), (1.0 - *(float *)v72.f64) / *(float *)v72.f64));
        *(float64x2_t *)(v142 + 1368) = v72;
        goto LABEL_173;
      }
    }
    else
    {
      int v75 = *(unsigned __int8 *)(v142 + 1388);
    }
    if (v75)
    {
      v76 = *(void **)(v142 + 1352);
      LODWORD(v74.f64[0]) = 1065269330;
      LODWORD(v73) = 1.0;
LABEL_174:
      LODWORD(v72.f64[0]) = v70;
      [v76 startRampFrom:v68 to:2 iterations:v72.f64[0] shape:v73 exponentialConvergenceFraction:v74.f64[0]];
      *(unsigned char *)(v142 + 1360) = *(unsigned char *)(v142 + 1388);
      goto LABEL_175;
    }
LABEL_173:
    v76 = *(void **)(v142 + 1352);
    LODWORD(v74.f64[0]) = 1065269330;
    double v73 = 0.0;
    goto LABEL_174;
  }
LABEL_175:
  v77 = (double *)&v145 + 1;
  unsigned int v78 = -3;
  double v80 = v139;
  double v79 = v140;
  uint64_t v81 = v142;
  do
  {
    unsigned int v82 = v78 + 3;
    if (v78 < 0xFFFFFFFD) {
      uint64_t v83 = v78;
    }
    else {
      uint64_t v83 = v82;
    }
    v84 = &OBJC_IVAR___BWPreviewStitcherNode__wideToTeleShiftCorrections;
    if (v78 >= 0xFFFFFFFD) {
      v84 = &OBJC_IVAR___BWPreviewStitcherNode__superWideToWideShiftCorrections;
    }
    uint64_t v85 = v81 + *v84;
    uint64_t v86 = v85 + 56 * v83;
    if (*(unsigned char *)(v86 + 32))
    {
      uint64_t v144 = v78 + 3;
      uint64_t v87 = v85 + 56 * v83;
      v90 = *(void **)(v87 + 40);
      v89 = (id *)(v87 + 40);
      v88 = v90;
      BOOL v91 = v83 != 2;
      if ((v141 & v91) != 0) {
        double v92 = v138;
      }
      else {
        double v92 = *((double *)v89 - 3);
      }
      if ((v141 & v91) != 0) {
        double v93 = v137;
      }
      else {
        double v93 = *((double *)v89 - 2);
      }
      *(unsigned char *)(v86 + 32) = 0;
      if (v88)
      {
        [v88 updateRampForNextIteration];
        *(double *)uint64_t v86 = v94;
      }
      uint64_t v95 = v85 + 56 * v83;
      v98 = *(void **)(v95 + 48);
      v97 = (id *)(v95 + 48);
      v96 = v98;
      if (v98)
      {
        [v96 updateRampForNextIteration];
        *(double *)(v86 + 8) = v99;
      }
      v100 = [BWRamp alloc];
      v101 = -[BWRamp initWithName:](v100, "initWithName:", objc_msgSend(NSString, "stringWithFormat:", @"ShiftCorrectionRampX[%d]", v144));
      v102 = [BWRamp alloc];
      v103 = -[BWRamp initWithName:](v102, "initWithName:", objc_msgSend(NSString, "stringWithFormat:", @"ShiftCorrectionRampY[%d]", v144));
      int v104 = -[BWPreviewStitcherNode _scale30FPSFrameCount:toFrameRate:](v142, *(unsigned int *)(v142 + 772), a8);
      HIDWORD(v106) = 1073427251;
      if (*(_DWORD *)(v142 + 1124) == 3) {
        int v104 = (int)((double)v104 * 1.7);
      }
      if (v134) {
        int v104 = -[BWPreviewStitcherNode _cameraDisplayTransitionFrameCountForCameraFallbackChange:currentFrameRate:]((void *)v142, v132, a8);
      }
      if (v135 == v133) {
        uint64_t v107 = v104;
      }
      else {
        uint64_t v107 = 6;
      }
      double v108 = *(double *)v86;
      *(float *)&double v108 = *(double *)v86;
      *(float *)&double v106 = v92;
      LODWORD(v105) = 1065017672;
      [(BWRamp *)v101 startRampFrom:v107 to:2 iterations:v108 shape:v106 exponentialConvergenceFraction:v105];
      double v109 = *(double *)(v86 + 8);
      *(float *)&double v109 = v109;
      *(float *)&double v110 = v93;
      LODWORD(v111) = 1065017672;
      [(BWRamp *)v103 startRampFrom:v107 to:2 iterations:v109 shape:v110 exponentialConvergenceFraction:v111];

      id *v89 = v101;
      id *v97 = v103;
      *(double *)uint64_t v86 = v92;
      *(double *)(v86 + 8) = v93;
      uint64_t v81 = v142;
      unsigned int v82 = v78 + 3;
      a4 = v136;
    }
    if (v82 >= 3 && a4)
    {
      a6 = *(double *)(v81 + 288);
      a7 = *(double *)(v81 + 296);
    }
    uint64_t v112 = v85 + 56 * v83;
    v115 = *(void **)(v112 + 40);
    v114 = (id *)(v112 + 40);
    v113 = v115;
    if (!v115)
    {
      uint64_t v123 = v85 + 56 * v83;
      v124 = *(void **)(v123 + 48);
      v120 = (id *)(v123 + 48);
      v119 = v124;
      double v117 = *(double *)v86;
      if (!v124)
      {
        double v122 = *(double *)(v86 + 8);
        goto LABEL_213;
      }
LABEL_207:
      [v119 updateRampForNextIteration];
      double v122 = v125;
      goto LABEL_208;
    }
    [v113 updateRampForNextIteration];
    double v117 = v116;
    uint64_t v118 = v85 + 56 * v83;
    v121 = *(void **)(v118 + 48);
    v120 = (id *)(v118 + 48);
    v119 = v121;
    if (v121) {
      goto LABEL_207;
    }
    double v122 = *(double *)(v86 + 8);
LABEL_208:
    if (([*v114 isRamping] & 1) == 0)
    {

      id *v114 = 0;
    }
    if (([*v120 isRamping] & 1) == 0)
    {

      id *v120 = 0;
    }
LABEL_213:
    double v126 = a7 + v122;
    double v127 = a6 + v117;
    if (a4)
    {
      if (v82 > 2)
      {
        if (v78 == 2)
        {
          double v80 = a7 + v122;
          double v79 = a6 + v117;
        }
      }
      else
      {
        *(v77 - 1) = v127;
        double *v77 = v126;
      }
    }
    else
    {
      double v80 = v139;
      double v79 = v140;
      if (v82 >= 3)
      {
        v128 = (double *)(&v145 + v83);
        double *v128 = v127;
        v128[1] = v126;
        double v80 = v139;
        double v79 = v140;
      }
    }
    v77 += 2;
    ++v78;
  }
  while (v78 != 3);
  *(unsigned char *)(v81 + 820) = -[BWPreviewStitcherNode _currentlyZoomingOrSwitchingCameras](v81);
  os_unfair_lock_unlock((os_unfair_lock_t)(v81 + 428));
  if (a2)
  {
    long long v129 = v146;
    *a2 = v145;
    a2[1] = v129;
    a2[2] = v147;
  }
  if (a3)
  {
    *a3 = v79;
    a3[1] = v80;
  }
}

- (BOOL)_currentlyZoomingOrSwitchingCameras
{
  if (result)
  {
    float v1 = (unsigned __int8 *)result;
    return *(float *)(result + 824) != 0.0
        || ([*(id *)(result + 864) isRamping] & 1) != 0
        || v1[818] != [v1 displaysWidestCameraOnly];
  }
  return result;
}

- (BOOL)displaysWidestCameraOnly
{
  p_configurationLocuint64_t k = &self->_configurationLock;
  os_unfair_lock_lock(&self->_configurationLock);
  BOOL displaysWidestCameraOnly = self->_displaysWidestCameraOnly;
  os_unfair_lock_unlock(p_configurationLock);
  return (displaysWidestCameraOnly || self->_currentZoomRequiresWiderCamera)
      && LOBYTE(self->_lastInputPTS.epoch)
      && !self->_displaysPrimaryCameraOnly;
}

- (uint64_t)_scale30FPSFrameCount:(float)a3 toFrameRate:
{
  if (!a1) {
    return 0;
  }
  if (a3 > 0.0 && *(unsigned char *)(a1 + 912)) {
    return FigCaptureRoundFloatToMultipleOf(1, (float)((float)(int)a2 * a3) / 30.0);
  }
  return a2;
}

- (int)rotationDegrees
{
  return self->_rotationDegrees;
}

- (BWPreviewStitcherNode)initWithCameraInfoByPortType:(id)a3 sensorBinningFactor:(id)a4 inputBuffersHaveHorizontalOverscanOnly:(BOOL)a5 registrationType:(int)a6 registrationMetalCommandQueue:(id)a7 excludeStaticComponentFromAlignmentShifts:(BOOL)a8 propagateDepth:(BOOL)a9 propagateStyles:(BOOL)a10 parallaxMitigationBasedOnZoomFactorEnabled:(BOOL)a11 zoomPIPOverlayEnabled:(BOOL)a12 zoomPIPMinimumUIZoomFactor:(float)a13 zoomPIPSingleStreamModeEnabled:(BOOL)a14 preallocateOutputBufferPool:(BOOL)a15
{
  BOOL v15 = a8;
  v65.receiver = self;
  v65.super_class = (Class)BWPreviewStitcherNode;
  v22 = [(BWNode *)&v65 init];
  uint64_t v23 = (uint64_t)v22;
  if (!v22) {
    return (BWPreviewStitcherNode *)v23;
  }
  BOOL v62 = a5;
  uint64_t v63 = (uint64_t)a4;
  id v61 = a7;
  BOOL v64 = v15;
  LOBYTE(v22->_lastInputPTS.epoch) = a3 != 0;
  v22->_additionalZoomFactorSpring = (BWSpringSimulation *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int v24 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v23];
  float v25 = objc_alloc_init(BWVideoFormatRequirements);
  [(BWNodeInputMediaConfiguration *)[(BWNodeInput *)v24 primaryMediaConfiguration] setFormatRequirements:v25];
  [(BWNodeInputMediaConfiguration *)[(BWNodeInput *)v24 primaryMediaConfiguration] setRetainedBufferCount:1];
  *(unsigned char *)(v23 + 1492) = a12;
  *(float *)(v23 + 1496) = a13;
  *(unsigned char *)(v23 + 1493) = a14;
  *(unsigned char *)(v23 + 1494) = a14;
  uint64_t v26 = *(unsigned __int8 *)(v23 + 1040);
  int v27 = *(unsigned __int8 *)(v23 + 1492);
  if (v26 | v27)
  {
    [(BWNodeInputMediaConfiguration *)[(BWNodeInput *)v24 primaryMediaConfiguration] setIndefinitelyHeldBufferCount:v26 | (2 * (v27 != 0))];
    if (*(unsigned char *)(v23 + 1040) || *(unsigned char *)(v23 + 1492) && !*(unsigned char *)(v23 + 1493))
    {
      int v28 = objc_alloc_init(BWNodeInputMediaConfiguration);
      [(BWNodeInputMediaConfiguration *)v28 setFormatRequirements:v25];
      [(BWNodeInputMediaConfiguration *)v28 setPassthroughMode:0];
      [(BWNodeInputMediaConfiguration *)v28 setRetainedBufferCount:1];
      [(BWNodeInputMediaConfiguration *)v28 setIndefinitelyHeldBufferCount:v26];
      [(BWNodeInput *)v24 setMediaConfiguration:v28 forAttachedMediaKey:@"SynchronizedSlaveFrame"];
    }
  }
  *(unsigned char *)(v23 + 1502) = a9;
  if (a9)
  {
    double v29 = objc_alloc_init(BWNodeInputMediaConfiguration);
    [(BWNodeInputMediaConfiguration *)v29 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeInputMediaConfiguration *)v29 setPassthroughMode:1];
    [(BWNodeInputMediaConfiguration *)v29 setRetainedBufferCount:1];
    [(BWNodeInput *)v24 setMediaConfiguration:v29 forAttachedMediaKey:@"Depth"];
  }
  *(unsigned char *)(v23 + 1503) = a10;
  BOOL v30 = v15;
  if (a10)
  {
    int v31 = objc_alloc_init(BWNodeInputMediaConfiguration);
    [(BWNodeInputMediaConfiguration *)v31 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeInputMediaConfiguration *)v31 setPassthroughMode:1];
    [(BWNodeInputMediaConfiguration *)v31 setRetainedBufferCount:1];
    [(BWNodeInput *)v24 setMediaConfiguration:v31 forAttachedMediaKey:0x1EFA74840];
    double v32 = objc_alloc_init(BWNodeInputMediaConfiguration);
    [(BWNodeInputMediaConfiguration *)v32 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeInputMediaConfiguration *)v32 setPassthroughMode:1];
    [(BWNodeInputMediaConfiguration *)v32 setRetainedBufferCount:1];
    [(BWNodeInput *)v24 setMediaConfiguration:v32 forAttachedMediaKey:0x1EFA748A0];
  }
  float v33 = objc_alloc_init(BWNodeInputMediaConfiguration);
  [(BWNodeInputMediaConfiguration *)v33 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
  [(BWNodeInputMediaConfiguration *)v33 setPassthroughMode:0];
  [(BWNodeInputMediaConfiguration *)v33 setRetainedBufferCount:1];
  [(BWNodeInput *)v24 setUnspecifiedAttachedMediaConfiguration:v33];
  [(id)v23 addInput:v24];

  -[BWPreviewStitcherNode _updateInputRequirements](v23);
  double v34 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v23];
  [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)v34 primaryMediaConfiguration] setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
  [(BWNodeOutput *)v34 setPoolPreallocationEnabled:a15];
  [(id)v23 addOutput:v34];

  *(void *)(v23 + 112) = 0;
  *(void *)(v23 + 128) = 0x3FE0000000000000;
  *(_DWORD *)(v23 + 260) = 1065353216;
  *(unsigned char *)(v23 + 264) = 1;
  if (!a3)
  {
    *(_DWORD *)(v23 + 388) = 0;
    goto LABEL_31;
  }
  double v35 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F52DE8]];
  double v36 = v35;
  double v37 = (void *)MEMORY[0x1E4F52C78];
  char v38 = (void *)MEMORY[0x1E4F52D10];
  if (v35)
  {
    *(unsigned char *)(v23 + 153) = 1;
    objc_msgSend((id)objc_msgSend(v35, "objectForKeyedSubscript:", *v37), "floatValue");
    *(_DWORD *)(v23 + 156) = v39;
    objc_msgSend((id)objc_msgSend(v36, "objectForKeyedSubscript:", *MEMORY[0x1E4F52C80]), "floatValue");
    *(_DWORD *)(v23 + 168) = v40;
    *(void *)(v23 + 232) = (id)[v36 objectForKeyedSubscript:*v38];
    *(_DWORD *)(v23 + 240) = 1065353216;
    BOOL v41 = *(void *)(v23 + 232) != 0;
    *(unsigned char *)(v23 + 1560) = v41;
    *(unsigned char *)(v23 + 1005) = v41;
    *(unsigned char *)(v23 + 244) = 0;
  }
  double v42 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F52DD8]];
  if (v42)
  {
    int v43 = v42;
    objc_msgSend((id)objc_msgSend(v42, "objectForKeyedSubscript:", *v37), "floatValue");
    *(_DWORD *)(v23 + 160) = v44;
    *(void *)(v23 + 216) = (id)[v43 objectForKeyedSubscript:*v38];
    *(_DWORD *)(v23 + 224) = 1065353216;
    *(_DWORD *)(v23 + 228) = 1065353216;
    if (v36)
    {
      *(_DWORD *)(v23 + 172) = *(_DWORD *)(v23 + 160);
      if ([&unk_1EFB02CD8 containsObject:FigCaptureGetModelSpecificName()])
      {
        *(unsigned char *)(v23 + 176) = 1;
        goto LABEL_21;
      }
      int v45 = *(unsigned __int8 *)(v23 + 1560);
      *(unsigned char *)(v23 + 176) = v45;
      if (v45)
      {
LABEL_21:
        double v46 = *(float *)(v23 + 172);
        if (*(unsigned char *)(v23 + 1560))
        {
          float v47 = v46 * 1.03;
          *(float *)(v23 + 188) = v47;
        }
        else
        {
          float v48 = v46 * 1.03916449;
          *(float *)(v23 + 188) = v48;
          *(_DWORD *)(v23 + 192) = 1166331904;
          *(_DWORD *)(v23 + 196) = 1167001600;
          *(_DWORD *)(v23 + 200) = 1065353216;
        }
      }
    }
  }
  uint64_t v49 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F52DF0]];
  if (v49)
  {
    *(unsigned char *)(v23 + 154) = 1;
    objc_msgSend((id)objc_msgSend(v49, "objectForKeyedSubscript:", *v37), "floatValue");
    *(float *)(v23 + 164) = v50;
    if (v50 <= 0.0) {
      goto LABEL_46;
    }
    *(_DWORD *)(v23 + 248) = 0;
  }
  *(void *)(v23 + 252) = v63;
  if (!FigCaptureVideoDimensionsAreValid(v63)) {
    goto LABEL_46;
  }
  *(unsigned char *)(v23 + 204) = v62;
  *(_DWORD *)(v23 + 208) = 1084227584;
  *(_DWORD *)(v23 + 388) = 0;
  if (*(unsigned char *)(v23 + 1040))
  {
    *(_DWORD *)(v23 + 404) = a6;
    int v51 = [[BWPreviewRegistration alloc] initWithCameraInfoByPortType:a3 sensorBinningFactor:v63 registrationType:*(unsigned int *)(v23 + 404) metalCommandQueue:v61 excludeStaticComponentFromAlignmentShifts:v64];
    *(void *)(v23 + 416) = v51;
    if (v51)
    {
      *(unsigned char *)(v23 + 408) = v30;
      *(unsigned char *)(v23 + 394) = 1;
      *(_DWORD *)(v23 + 428) = 0;
      *(_DWORD *)(v23 + 768) = 22;
      *(_DWORD *)(v23 + 772) = 21;
      *(unsigned char *)(v23 + 776) = 1;
      *(unsigned char *)(v23 + 426) = 0;
      *(void *)(v23 + 784) = 0;
      goto LABEL_31;
    }
LABEL_46:
    fig_log_get_emitter();
    FigDebugAssert3();

    return 0;
  }
LABEL_31:
  *(void *)(v23 + 792) = 0;
  *(unsigned char *)(v23 + 816) = 0;
  *(unsigned char *)(v23 + 817) = 0;
  *(_DWORD *)(v23 + 140) = 0;
  *(unsigned char *)(v23 + 912) = 1;
  *(void *)(v23 + 920) = FigDispatchQueueCreateWithPriority();
  *(_WORD *)(v23 + 964) = 1;
  *(_DWORD *)(v23 + 968) = 1064514355;
  *(_DWORD *)(v23 + 972) = 1008981770;
  *(_DWORD *)(v23 + 976) = 1068708659;
  *(_DWORD *)(v23 + 980) = 1057803469;
  *(_DWORD *)(v23 + 984) = 1073322394;
  *(_DWORD *)(v23 + 988) = 1069547520;
  *(_DWORD *)(v23 + 992) = 1045220557;
  *(_DWORD *)(v23 + 996) = 1070050836;
  *(_DWORD *)(v23 + 1000) = 1064682127;
  int v52 = objc_alloc_init(BWSpringSimulation);
  *(void *)(v23 + 1088) = v52;
  [(BWSpringSimulation *)v52 resetWithInput:1.0 initialOutput:1.0 initialVelocity:0.0];
  *(_DWORD *)(v23 + 1056) = 1065353216;
  *(_DWORD *)(v23 + 1060) = 0;
  BWSmartCameraSceneInitialize(v23 + 1128, 1, 4, 1, (uint64_t)"Wide Focus Distance Far Enough", 41.0, 6.0, 0.25);
  *(unsigned char *)(v23 + 1129) = 1;
  *(_DWORD *)(v23 + 1124) = 4 * *(unsigned __int8 *)(v23 + 1040);
  *(unsigned char *)(v23 + 1168) = 1;
  *(unsigned char *)(v23 + 1171) = 1;
  *(unsigned char *)(v23 + 1172) = 1;
  BWSmartCameraSceneInitialize(v23 + 1176, 1, 4, 1, (uint64_t)"Wider Camera FoV Fills Over Capture", 20.0, 16.0, 0.75);
  *(unsigned char *)(v23 + 1177) = 1;
  BWSmartCameraSceneUpdateResetTemporalHysteresisAndFiltering((unsigned char *)(v23 + 1176));
  *(unsigned char *)(v23 + 1220) = 1;
  *(_DWORD *)(v23 + 1224) = 1;
  BWSmartCameraSceneInitialize(v23 + 1232, 1, 10, 7, (uint64_t)"Wide Focus Distance Far Enough To Use Tele", 61.0, 6.0, 0.2);
  *(unsigned char *)(v23 + 1233) = 1;
  *(void *)(v23 + 1280) = [[BWRamp alloc] initWithName:@"WideFallbackShiftRamp"];
  *(unsigned char *)(v23 + 1306) = v30;
  *(void *)(v23 + 1456) = [[BWFencedAnimationQueue alloc] initWithQueueSize:1];
  BWSmartCameraSceneInitialize(v23 + 1312, 1, 3, 0, (uint64_t)"Wide Focus Distance Far Enough To Use Wide", 16.0, 2.0, 0.8);
  *(unsigned char *)(v23 + 1313) = 1;
  *(void *)(v23 + 1352) = [[BWRamp alloc] initWithName:@"SuperWideFallbackShiftRamp"];
  *(_DWORD *)(v23 + 1384) = 1050253722;
  *(unsigned char *)(v23 + 1393) = 1;
  *(unsigned char *)(v23 + 1390) = 1;
  *(_WORD *)(v23 + 1440) = 1;
  *(_DWORD *)(v23 + 1444) = 1028443341;
  *(unsigned char *)(v23 + 1448) = 0;
  BWSmartCameraSceneInitialize(v23 + 1400, 1, 4, 2, (uint64_t)"Super Wide Focus Distance Far Enough For Registration", 7.5, 1.5, 0.5);
  *(unsigned char *)(v23 + 1401) = 1;
  *(_DWORD *)(v23 + 1468) = 30;
  char v53 = *(unsigned char *)(v23 + 1040);
  if (v53) {
    char v53 = *(void *)(v23 + 216) != 0;
  }
  *(unsigned char *)(v23 + 1472) = v53;
  *(_DWORD *)(v23 + 1476) = 1098907648;
  float64x2_t v54 = *(void **)(v23 + 216);
  if (v54)
  {
    float v55 = *(float *)(v23 + 164);
    objc_msgSend((id)objc_msgSend(v54, "lastObject"), "floatValue");
    float v57 = v55 / v56;
  }
  else
  {
    float v57 = 0.0;
  }
  BOOL v59 = v57 > 0.0 && *(unsigned char *)(v23 + 1040) != 0;
  if (v57 >= 2.0) {
    BOOL v59 = 0;
  }
  *(unsigned char *)(v23 + 1480) = v59;
  *(_DWORD *)(v23 + 1484) = 1067198710;
  *(_DWORD *)(v23 + 1488) = 1069547520;
  *(unsigned char *)(v23 + 245) = *(void *)(v23 + 216) != 0;
  *(unsigned char *)(v23 + 1501) = (int)FigCapturePlatformIdentifier() > 8;
  *(unsigned char *)(v23 + 1512) = a11;
  BWSmartCameraSceneInitialize(v23 + 1520, 1, 16, 0, (uint64_t)"Narrower Camera FoV Fills Over Capture", 0.99, 0.0, 0.9);
  *(unsigned char *)(v23 + 1521) = 1;
  *(unsigned char *)(v23 + 1576) = 1;
  return (BWPreviewStitcherNode *)v23;
}

- (uint64_t)_updateInputRequirements
{
  if (result)
  {
    uint64_t v1 = result;
    double v2 = (void *)[*(id *)(result + 8) formatRequirements];
    int v3 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1EFB02D08];
    objc_msgSend(v3, "addObjectsFromArray:", FigCaptureSupportedPixelFormatsForCompressionType(1, 1, 1, 0));
    objc_msgSend(v3, "addObjectsFromArray:", FigCaptureSupportedPixelFormatsForCompressionType(4, 1, 1, *(_DWORD *)(v1 + 148)));
    return [v2 setSupportedPixelFormats:v3];
  }
  return result;
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  v21.i32[0] = [(BWVideoFormat *)[(BWNodeOutput *)self->super._output videoFormat] width];
  v21.i32[1] = [(BWVideoFormat *)[(BWNodeOutput *)self->super._output videoFormat] height];
  FigCaptureSwapVideoDimensionsFor90Or270Rotation(&v21, self->_rotationDegrees);
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  VTPixelRotationSessionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &self->_intermediateRotationSession);
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F45088];
  VTSessionSetProperty(self->_intermediateRotationSession, (CFStringRef)*MEMORY[0x1E4F45088], MEMORY[0x1E4F1CC38]);
  v5 = (CFStringRef *)MEMORY[0x1E4F45160];
  if (self->_zoomPIPSingleStreamModeEnabled) {
    VTSessionSetProperty(self->_intermediateRotationSession, (CFStringRef)*MEMORY[0x1E4F45160], MEMORY[0x1E4F1CC38]);
  }
  p_outputRotationSession = &self->_outputRotationSession;
  VTPixelRotationSessionCreate(v3, &self->_outputRotationSession);
  outputRotationSession = self->_outputRotationSession;
  CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F450C0];
  int v9 = (const void *)FigCaptureVTRotationFromDegrees(self->_rotationDegrees);
  VTSessionSetProperty(outputRotationSession, v8, v9);
  VTSessionSetProperty(self->_outputRotationSession, v4, MEMORY[0x1E4F1CC38]);
  if (self->_zoomPIPSingleStreamModeEnabled) {
    VTSessionSetProperty(*p_outputRotationSession, *v5, MEMORY[0x1E4F1CC38]);
  }
  if (self->_flipHorizontal) {
    VTSessionSetProperty(*p_outputRotationSession, (CFStringRef)*MEMORY[0x1E4F45098], MEMORY[0x1E4F1CC38]);
  }
  if (self->_flipVertical)
  {
    VTSessionSetProperty(*p_outputRotationSession, (CFStringRef)*MEMORY[0x1E4F450A0], MEMORY[0x1E4F1CC38]);
    BOOL flipVertical = self->_flipVertical;
  }
  else
  {
    BOOL flipVertical = 0;
  }
  unsigned __int8 v20 = 0;
  int v11 = ptn_rotationDegreesAndMirroringFromLiveConfiguration(self->_rotationDegrees, self->_flipHorizontal, flipVertical, (char *)&v20);
  FigCaptureMakeMirrorAndRotateVideoTransform(v21.i32[0], v21.i32[1], v20, v11, (uint64_t)v19);
  long long v12 = v19[1];
  *(_OWORD *)&self->_outputTransform.a = v19[0];
  *(_OWORD *)&self->_outputTransform.c = v12;
  *(_OWORD *)&self->_outputTransform.tx = v19[2];
  if (self->_generatesHistogram) {
    VTSessionSetProperty(*p_outputRotationSession, (CFStringRef)*MEMORY[0x1E4F45090], (CFTypeRef)[NSNumber numberWithBool:1]);
  }
  if (self->_primaryCaptureRectYInset != 0.0)
  {
    self->_unint64_t primaryCaptureRectPixelInset = (int)(self->_primaryCaptureRectYInset
                                              * (double)[(BWVideoFormat *)[(BWNodeInput *)self->super._input videoFormat] height]);
    if (self->_primaryCaptureRectPixelInset > ([(BWVideoFormat *)[(BWNodeInput *)self->super._input videoFormat] height]- 2) >> 1)[(BWVideoFormat *)[(BWNodeInput *)self->super._input videoFormat] height]; {
    unint64_t v13 = [(BWVideoFormat *)[(BWNodeInput *)self->super._input videoFormat] height];
    }
    unint64_t primaryCaptureRectPixelInset = self->_primaryCaptureRectPixelInset;
    if (primaryCaptureRectPixelInset > (v13 - 2) >> 1) {
      unint64_t primaryCaptureRectPixelInset = ([(BWVideoFormat *)[(BWNodeInput *)self->super._input videoFormat] height]+ 0x1FFFFFFFELL) >> 1;
    }
    self->_unint64_t primaryCaptureRectPixelInset = primaryCaptureRectPixelInset;
  }
  double primaryCaptureRectCenterX = self->_primaryCaptureRectCenterX;
  if (primaryCaptureRectCenterX != 0.5) {
    self->_primaryCaptureRectCenterXPixelOffset = (int)((primaryCaptureRectCenterX + -0.5) * (double)v21.i32[0]);
  }
  uint64_t v16 = MEMORY[0x1E4F1FA48];
  *(_OWORD *)&self->_lastSampleBuffer = *MEMORY[0x1E4F1FA48];
  *(void *)&self->_lastInputPTS.timescale = *(void *)(v16 + 16);
  if (LOBYTE(self->_lastInputPTS.epoch)) {
    self->_drawWiderCameraOnly = 1;
  }
  MGGetFloat32Answer();
  self->_screenScale = FigCaptureRoundFloatToMultipleOf(1, v17);
  BYTE1(self->_trueVideoHDRtoSDRBlendRamp) = BWColorSpacePropertiesIsHDR([(BWVideoFormat *)[(BWNodeInputMediaProperties *)[(BWNodeInput *)self->super._input primaryMediaProperties] resolvedVideoFormat] colorSpaceProperties]);
  if (!(BYTE2(self->_blackFilledBorderRectsBySurfaceID) | LOBYTE(self->_lastInputPTS.epoch))
    || LOBYTE(self->_trueVideoHDRtoSDRBlendRamp))
  {
    self->_havePreheatedCI = 1;
  }
  else
  {
    self->_teleOpacityPoolReadyAssertion = (BWMemoryPoolFlushAssertion *)[+[BWMemoryPool sharedMemoryPool] newFlushAssertion:@"BWPreviewStitcherNode teleOpacityPool"];
    if (BYTE2(self->_blackFilledBorderRectsBySurfaceID)) {
      -[BWPreviewStitcherNode _preheatCIRenderingAsync]((uint64_t)self);
    }
  }
  self->_metalSubmissionAndCompletionQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
  v18.receiver = self;
  v18.super_class = (Class)BWPreviewStitcherNode;
  [(BWNode *)&v18 prepareForCurrentConfigurationToBecomeLive];
}

- (void)_updateUprightExifOrientationOnSampleBufferIfNeeded:(uint64_t)a1
{
  if (a1)
  {
    int v4 = objc_msgSend((id)CMGetAttachment(target, @"UprightExifOrientation", 0), "intValue");
    if (*(_DWORD *)(a1 + 104) || *(unsigned char *)(a1 + 108))
    {
      BOOL v5 = 0;
      if (!v4) {
        return;
      }
    }
    else
    {
      BOOL v5 = *(unsigned char *)(a1 + 109) == 0;
      if (!v4) {
        return;
      }
    }
    if (!v5)
    {
      char v12 = 0;
      int v6 = FigCaptureRotationDegreesAndMirroringFromExifOrientation(v4, &v12);
      char v11 = 0;
      int v7 = ptn_rotationDegreesAndMirroringFromLiveConfiguration(*(unsigned int *)(a1 + 104), *(unsigned __int8 *)(a1 + 108), *(unsigned __int8 *)(a1 + 109), &v11);
      if (v11) {
        BOOL v8 = v12 == 0;
      }
      else {
        BOOL v8 = v12 != 0;
      }
      if (v8 && (v7 == 270 || v7 == 90)) {
        v6 += 180;
      }
      int v9 = FigCaptureNormalizeAngle(v6 - v7);
      float v10 = (const void *)objc_msgSend(NSNumber, "numberWithInt:", FigCaptureExifOrientationFromRotationDegreesAndMirroring(v9, v8));
      CMSetAttachment(target, @"UprightExifOrientation", v10, 1u);
    }
  }
}

- (double)_scaleFactorAppliedForPixelBuffer:(void *)a3 usedSourceRect:(double)result primaryCaptureRectAspectRatio:(double)a5 metadata:(double)a6
{
  if (!a1) {
    return 0.0;
  }
  if (a2)
  {
    CGRect v15 = *(CGRect *)ymmword_1A5EFDD50;
    CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F53260]], &v15);
    CVPixelBufferGetWidth(a2);
    CVPixelBufferGetHeight(a2);
    FigCaptureMetadataUtilitiesDenormalizeCropRect(v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
    double result = 1.0;
    if (v11 / v12 < a8) {
      double result = a8 / (v11 / v12);
    }
    double v13 = a7 * result;
    double v14 = vabdd_f64(a7 * result, v12);
    LODWORD(result) = 1.0;
    if (v14 > 2.0)
    {
      double result = v13 / v12;
      *(float *)&double result = v13 / v12;
    }
  }
  else
  {
    LODWORD(result) = 1.0;
  }
  return result;
}

- (_BYTE)_updateOverCaptureStatusWithWiderSampleBuffer:(CMAttachmentBearerRef)a3 narrowerSampleBuffer:
{
  if (!result) {
    return result;
  }
  uint64_t v3 = (uint64_t)result;
  if (result[1562] || result[384]) {
    return result;
  }
  if (!result[1105])
  {
    CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F53070];
    int v8 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]), "isEqualToString:", *MEMORY[0x1E4F52DE8]);
    if (v8) {
      CMAttachmentBearerRef v9 = a3;
    }
    else {
      CMAttachmentBearerRef v9 = target;
    }
    float v10 = (void *)CMGetAttachment(v9, v7, 0);
    psn_updateFocusDistanceBasedScene(v3 + 1128, v10);
    if (target) {
      a3 = target;
    }
    double v11 = (void *)CMGetAttachment(a3, @"TotalZoomFactor", 0);
    if (v11) {
      [v11 floatValue];
    }
    else {
      float v12 = 1.0;
    }
    if (!v8)
    {
      unsigned int v17 = 1;
      if (*(unsigned char *)(v3 + 1172) && !*(unsigned char *)(v3 + 153))
      {
        if (v12 >= 1.7 || *(float *)(v3 + 824) == *(float *)(v3 + 164)) {
          unsigned int v17 = 1;
        }
        else {
          unsigned int v17 = 2;
        }
      }
      goto LABEL_39;
    }
    int v13 = *(unsigned __int8 *)(v3 + 1168);
    float v14 = *(float *)(v3 + 160);
    float v15 = *(float *)(v3 + 824);
    int v16 = v15 != 0.0;
    if (v15 != v14) {
      int v16 = 0;
    }
    if ((v16 & 1) != 0 || v12 >= v14)
    {
      if (!*(unsigned char *)(v3 + 1169))
      {
        if (!*(unsigned char *)(v3 + 1172)) {
          goto LABEL_62;
        }
        if (((*(unsigned char *)(v3 + 1177) == 0) & ~v16) != 0)
        {
LABEL_61:
          unsigned int v17 = 2;
          goto LABEL_39;
        }
        if (*(void *)(v3 + 232))
        {
          if (*(unsigned char *)(v3 + 1388)) {
            unsigned int v17 = 2;
          }
          else {
            unsigned int v17 = 1;
          }
          if (!*(unsigned char *)(v3 + 1168) || *(unsigned char *)(v3 + 1388)) {
            goto LABEL_39;
          }
        }
        else
        {
LABEL_62:
          if (!*(unsigned char *)(v3 + 1168)) {
            goto LABEL_38;
          }
        }
        if (!*(unsigned char *)(v3 + 1129) || *(unsigned char *)(v3 + 1388))
        {
          unsigned int v17 = 3;
LABEL_39:
          int v19 = objc_msgSend((id)CMGetAttachment(a3, @"OverCaptureSlaveStreamStatus", 0), "intValue");
          if (v19 == 1 || *(unsigned char *)(v3 + 394) && !*(unsigned char *)(v3 + 425)) {
            unsigned int v17 = 4;
          }
          if (*(unsigned char *)(v3 + 1220)) {
            BOOL v20 = (v19 & 0xFFFFFFFE) == 2;
          }
          else {
            BOOL v20 = 0;
          }
          if (v20) {
            uint64_t v4 = 5;
          }
          else {
            uint64_t v4 = v17;
          }
          goto LABEL_49;
        }
      }
    }
    else if (v13 | *(unsigned __int8 *)(v3 + 1172))
    {
      if (*(unsigned char *)(v3 + 1168)) {
        int v13 = *(unsigned char *)(v3 + 1129) == 0;
      }
      if (!*(unsigned char *)(v3 + 1172) && !v13 || *(unsigned char *)(v3 + 1177))
      {
        if (v13) {
          unsigned int v17 = 3;
        }
        else {
          unsigned int v17 = 1;
        }
        goto LABEL_39;
      }
      goto LABEL_61;
    }
LABEL_38:
    unsigned int v17 = 1;
    goto LABEL_39;
  }
  uint64_t v4 = 0;
LABEL_49:
  return -[BWPreviewStitcherNode _setOverCaptureStatus:]((_DWORD *)v3, v4);
}

- (uint64_t)_updateZoomStatusFromWideSampleBuffer:(CMAttachmentBearerRef)target teleSampleBuffer:
{
  if (!a1) {
    return 0;
  }
  CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F53070];
  int v8 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  uint64_t v9 = *MEMORY[0x1E4F54128];
  float v10 = (void *)[v8 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
  double v11 = (void *)CMGetAttachment(a2, v7, 0);
  float v12 = (void *)[v11 objectForKeyedSubscript:v9];
  double v122 = v10;
  uint64_t v115 = *MEMORY[0x1E4F52DF0];
  int v13 = objc_msgSend(v10, "isEqualToString:");
  float v14 = &OBJC_IVAR___BWPreviewStitcherNode__wideBaseZoomFactor;
  if (v13) {
    float v14 = &OBJC_IVAR___BWPreviewStitcherNode__teleBaseZoomFactor;
  }
  float v15 = *(float *)(a1 + *v14);
  float v16 = 0.0;
  int v123 = v13;
  if ((v13 & 1) == 0)
  {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 216), "firstObject"), "floatValue");
    float v16 = v17;
  }
  v120 = a2;
  CMAttachmentBearerRef targeta = target;
  if (a2) {
    CMAttachmentBearerRef v18 = a2;
  }
  else {
    CMAttachmentBearerRef v18 = target;
  }
  int v19 = (void *)CMGetAttachment(v18, @"TotalZoomFactor", 0);
  float v20 = 1.0;
  if (v19)
  {
    [v19 floatValue];
    float v20 = v21;
  }
  v22 = (void *)*MEMORY[0x1E4F52DD8];
  int v23 = [v10 isEqualToString:*MEMORY[0x1E4F52DD8]];
  float v116 = v12;
  v114 = v22;
  int v24 = [v12 isEqualToString:v22];
  uint64_t v119 = *MEMORY[0x1E4F52DE8];
  int v25 = objc_msgSend(v10, "isEqualToString:");
  v121 = v8;
  if (v23) {
    uint64_t v26 = v8;
  }
  else {
    uint64_t v26 = v11;
  }
  uint64_t v27 = *MEMORY[0x1E4F540F0];
  objc_msgSend((id)objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E4F540F0]), "floatValue");
  if (v28 == 0.0) {
    float v28 = 1.0;
  }
  *(float *)(a1 + 224) = v28;
  *(unsigned char *)(a1 + 246) = 0;
  float v29 = *(float *)(a1 + 228);
  float v30 = *(float *)(a1 + 224);
  if (v29 != v30)
  {
    if (v23
      && v29 == 2.0
      && v30 == 1.0
      && *(unsigned char *)(a1 + 245)
      && [v8 objectForKeyedSubscript:*MEMORY[0x1E4F54370]])
    {
      *(unsigned char *)(a1 + 246) = 1;
    }
    else
    {
      *(_DWORD *)(a1 + 396) = 0;
      *(_DWORD *)(a1 + 228) = *(_DWORD *)(a1 + 224);
    }
  }
  int v31 = v8;
  if (!v25) {
    int v31 = 0;
  }
  if (v23) {
    double v32 = v11;
  }
  else {
    double v32 = v31;
  }
  objc_msgSend((id)objc_msgSend(v32, "objectForKeyedSubscript:", v27), "floatValue");
  if (v33 == 0.0) {
    float v33 = 1.0;
  }
  *(float *)(a1 + 240) = v33;
  if (!*(unsigned char *)(a1 + 176))
  {
    *(_DWORD *)(a1 + 180) = 0;
    double v34 = a2;
    double v35 = v122;
    double v36 = targeta;
    goto LABEL_70;
  }
  double v34 = a2;
  double v35 = v122;
  double v36 = targeta;
  if (*(unsigned char *)(a1 + 1560))
  {
    float v37 = *(float *)(a1 + 172);
    if ((v23 | v25) == 1)
    {
      float v38 = *(float *)(a1 + 188);
      float v39 = *(float *)(a1 + 156);
      if (v37 >= v20) {
        float v40 = v20;
      }
      else {
        float v40 = *(float *)(a1 + 172);
      }
      if (v40 < v39) {
        float v40 = *(float *)(a1 + 156);
      }
      float v41 = (float)((float)(v40 - v39) / (float)(v37 - v39)) + 0.0;
      double v42 = *(void **)(a1 + 864);
      if (v42)
      {
        [v42 currentValue];
        double v44 = 1.0 - v43;
        float v37 = *(float *)(a1 + 172);
      }
      else
      {
        double v44 = 1.0;
        if (!*(unsigned char *)(a1 + 1360)) {
          double v44 = 0.0;
        }
      }
      float v54 = v44 * v41;
      if (v54 > 1.0) {
        float v54 = 1.0;
      }
      if (v54 < 0.0) {
        float v54 = 0.0;
      }
      float v37 = v37 + (float)((float)(v38 - v37) * v54);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 388));
    goto LABEL_62;
  }
  if ((v23 | v24) == 1)
  {
    objc_msgSend((id)objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E4F54118]), "floatValue");
    float v46 = v45;
    float v47 = *(float *)(a1 + 188);
    float v48 = *(float *)(a1 + 172);
    float v49 = *(float *)(a1 + 192);
    float v50 = *(float *)(a1 + 196);
    if (v50 <= v49)
    {
      float v112 = *(float *)(a1 + 192);
      float v113 = *(float *)(a1 + 188);
      fig_log_get_emitter();
      uint64_t v111 = v3;
      LODWORD(v110) = 0;
      FigDebugAssert3();
      float v49 = v112;
      float v47 = v113;
    }
    if (v50 >= v46) {
      float v51 = v46;
    }
    else {
      float v51 = v50;
    }
    if (v51 < v49) {
      float v51 = v49;
    }
    float v37 = v48 + (float)((float)(v47 - v48) * (float)((float)(v51 - v49) / (float)(v50 - v49)));
    float v52 = *(float *)(a1 + 200);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 388));
    float v53 = *(float *)(a1 + 180);
    if (v53 > 0.0 && v52 < 1.0)
    {
      *(float *)(a1 + 180) = BWModifiedMovingAverage(v37, v53, v52);
LABEL_63:
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 388));
      goto LABEL_64;
    }
LABEL_62:
    *(float *)(a1 + 180) = v37;
    goto LABEL_63;
  }
LABEL_64:
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 388));
  float v55 = 0.0;
  if (v123)
  {
    float v56 = *(void **)(a1 + 864);
    if (v56)
    {
      objc_msgSend(v56, "currentValue", 0.0);
    }
    else if (!*(unsigned char *)(a1 + 818))
    {
      float v55 = 1.0;
    }
  }
  *(float *)(a1 + 184) = *(float *)(a1 + 172)
                       + (float)((float)(*(float *)(a1 + 180) - *(float *)(a1 + 172)) * (float)(1.0 - v55));
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 388));
LABEL_70:
  float v57 = (void *)CMGetAttachment(v36, @"RecommendedMasterPortType", 0);
  if (!v57)
  {
    float v57 = (void *)CMGetAttachment(v34, @"RecommendedMasterPortType", 0);
    if (!v57) {
      goto LABEL_93;
    }
  }
  if ((!v36 || (int v58 = [v57 isEqualToString:v35], v34) || v58)
    && (!v34 || (char v59 = [v57 isEqualToString:v116], v36) || (v59 & 1) != 0))
  {
    if (!*(unsigned char *)(a1 + 152)) {
      goto LABEL_92;
    }
    if ([v57 isEqualToString:v119])
    {
      if (!v36) {
        goto LABEL_92;
      }
    }
    else
    {
      char v62 = [v57 isEqualToString:v115];
      if (!v36 || (v62 & 1) == 0) {
        goto LABEL_92;
      }
    }
    int v63 = objc_msgSend(v57, "isEqualToString:", v35, v110, v111);
    if (!v34) {
      goto LABEL_92;
    }
    if (v63) {
      goto LABEL_92;
    }
    char v64 = [v57 isEqualToString:v116];
    id v61 = v114;
    if (v64) {
      goto LABEL_92;
    }
  }
  else
  {
    char v60 = objc_msgSend(v35, "isEqualToString:", v119, v110, v111);
    id v61 = v116;
    if (v36) {
      id v61 = v35;
    }
    if (v60) {
      goto LABEL_92;
    }
  }
  float v57 = v61;
  if (!v61) {
    goto LABEL_93;
  }
LABEL_92:
  if (objc_msgSend(v57, "isEqualToString:", *(void *)(a1 + 832), v110))
  {
LABEL_93:
    int targetb = 0;
    goto LABEL_95;
  }

  *(void *)(a1 + 832) = v57;
  int targetb = [v57 isEqualToString:v35];
LABEL_95:
  objc_super v65 = (void *)CMGetAttachment(v36, @"PreferredMasterPortType", 0);
  if ((v65 || (objc_super v65 = (void *)CMGetAttachment(v34, @"PreferredMasterPortType", 0)) != 0)
    && (objc_msgSend(v65, "isEqualToString:", *(void *)(a1 + 840), v110) & 1) == 0)
  {

    *(void *)(a1 + 840) = v65;
  }
  if (*(unsigned char *)(a1 + 152))
  {
    int v66 = [*(id *)(a1 + 840) isEqual:v119] && v20 >= *(float *)(a1 + 160);
    if (*(unsigned __int8 *)(a1 + 1392) != v66)
    {
      *(unsigned char *)(a1 + 1392) = v66;
      if ((v123 & 1) == 0 && *(unsigned char *)(a1 + 1393) && v66) {
        *(_DWORD *)(a1 + 396) = 0;
      }
    }
  }
  if (v123)
  {
    uint64_t v67 = *MEMORY[0x1E4F53EE0];
    uint64_t v68 = v122;
    if (!*(unsigned char *)(a1 + 1233)
      && objc_msgSend((id)objc_msgSend(v121, "objectForKeyedSubscript:", *MEMORY[0x1E4F53EE0]), "intValue") == 1)
    {
      goto LABEL_114;
    }
    int v69 = v11;
  }
  else
  {
    uint64_t v67 = *MEMORY[0x1E4F53EE0];
    int v69 = v121;
    uint64_t v68 = v122;
  }
  psn_updateFocusDistanceBasedScene(a1 + 1232, v69);
  psn_updateFocusDistanceBasedScene(a1 + 1312, v69);
LABEL_114:
  if (v123) {
    int v70 = v11;
  }
  else {
    int v70 = v121;
  }
  *(unsigned char *)(a1 + 1272) = objc_msgSend((id)objc_msgSend(v70, "objectForKeyedSubscript:", v67, v110), "intValue") == 1;
  if (v123)
  {
    *(unsigned char *)(a1 + 1273) = objc_msgSend((id)objc_msgSend(v121, "objectForKeyedSubscript:", v67), "intValue") == 1;
  }
  else if (*(unsigned char *)(a1 + 152) {
         && objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", v67), "intValue") != 1)
  }
  {
    psn_updateFocusDistanceBasedScene(a1 + 1400, v11);
  }
  int v71 = (void *)CMGetAttachment(v36, @"RampZoomFactorOfInterest", 0);
  if (!v71) {
    int v71 = (void *)CMGetAttachment(v34, @"RampZoomFactorOfInterest", 0);
  }
  [v71 floatValue];
  float v73 = v72;
  int v74 = *(unsigned __int8 *)(a1 + 1304);
  int v75 = *(_DWORD *)(a1 + 1224);
  if (!v75)
  {
    *(unsigned char *)(a1 + 1304) = 0;
    goto LABEL_145;
  }
  float v76 = *(float *)(a1 + 164);
  if (v20 < v76 && v73 != v76)
  {
    int v77 = *(unsigned __int8 *)(a1 + 153);
    if (*(unsigned char *)(a1 + 153)) {
      int v77 = *(unsigned char *)(a1 + 154) != 0;
    }
    if (v75 == 1 || v77)
    {
      char v79 = 1;
      goto LABEL_140;
    }
    if (v75 != 2) {
      goto LABEL_145;
    }
LABEL_138:
    char v79 = *(unsigned char *)(a1 + 1233) ^ 1;
LABEL_140:
    *(unsigned char *)(a1 + 1304) = v79;
    goto LABEL_145;
  }
  if (v75 == 2) {
    goto LABEL_138;
  }
  if (v75 == 1)
  {
    if ([*(id *)(a1 + 832) isEqualToString:v114])
    {
      char v78 = 1;
    }
    else if (*(unsigned char *)(a1 + 152))
    {
      char v78 = [*(id *)(a1 + 832) isEqualToString:v119];
    }
    else
    {
      char v78 = 0;
    }
    uint64_t v68 = v122;
    *(unsigned char *)(a1 + 1304) = v78;
  }
LABEL_145:
  if (*(unsigned __int8 *)(a1 + 1304) == v74)
  {
    if (v123) {
      BOOL v80 = v74 != *(unsigned __int8 *)(a1 + 1305);
    }
    else {
      BOOL v80 = 0;
    }
  }
  else
  {
    if (*(unsigned char *)(a1 + 1306)) {
      *(unsigned char *)(a1 + 1307) = (*(_DWORD *)(a1 + 1308) & 0xFFFFFFFD) == 0;
    }
    BOOL v80 = 1;
  }
  [*(id *)(a1 + 1280) updateRampForNextIteration];
  uint64_t v81 = (void *)CMGetAttachment(v36, @"LastRecommendedMasterSelectionReason", 0);
  if (v81 || (uint64_t v81 = (void *)CMGetAttachment(v34, @"LastRecommendedMasterSelectionReason", 0)) != 0) {
    *(_DWORD *)(a1 + 1308) = [v81 intValue];
  }
  if (!*(unsigned char *)(a1 + 152))
  {
    BOOL v85 = 0;
    int v83 = targetb;
    goto LABEL_181;
  }
  int v82 = *(unsigned __int8 *)(a1 + 1388);
  if (!v75)
  {
    char v86 = 0;
LABEL_168:
    *(unsigned char *)(a1 + 1388) = v86;
    int v83 = targetb;
    goto LABEL_169;
  }
  if (v75 == 2)
  {
    char v86 = *(unsigned char *)(a1 + 1313) ^ 1;
    goto LABEL_168;
  }
  int v83 = targetb;
  if (v75 != 1 || ((float v84 = *(float *)(a1 + 160), v20 < v84) || !*(_DWORD *)(a1 + 1308)) && v73 != v84)
  {
LABEL_169:
    if (*(unsigned __int8 *)(a1 + 1388) != v82)
    {
LABEL_177:
      if (*(unsigned char *)(a1 + 1390)) {
        *(unsigned char *)(a1 + 1391) = *(_DWORD *)(a1 + 1308) == 2;
      }
      BOOL v85 = 1;
      goto LABEL_180;
    }
    if (v123) {
      goto LABEL_171;
    }
LABEL_176:
    BOOL v85 = v82 != *(unsigned __int8 *)(a1 + 1360);
    goto LABEL_180;
  }
  *(unsigned char *)(a1 + 1388) = [*(id *)(a1 + 832) isEqualToString:v119];
  if ((v123 & 1) == 0)
  {
    if (*(unsigned char *)(a1 + 1388)) {
      BOOL v87 = 1;
    }
    else {
      BOOL v87 = *(float *)(a1 + 240) > 1.0;
    }
    *(unsigned char *)(a1 + 1388) = v87;
    if (*(unsigned __int8 *)(a1 + 1388) != v82) {
      goto LABEL_177;
    }
    goto LABEL_176;
  }
  if (*(unsigned __int8 *)(a1 + 1388) != v82) {
    goto LABEL_177;
  }
LABEL_171:
  BOOL v85 = 0;
LABEL_180:
  [*(id *)(a1 + 1352) updateRampForNextIteration];
LABEL_181:
  uint64_t v88 = 0;
  if (v20 < v15) {
    int v89 = v83;
  }
  else {
    int v89 = 0;
  }
  if (v89 == 1 && v73 == 0.0) {
    uint64_t v88 = vabds_f32(1.0, v20 / v15) >= 0.1;
  }
  uint64_t v90 = -[BWPreviewStitcherNode _primaryCameraPortType](a1);
  uint64_t v91 = *(void *)(a1 + 848);
  if (v68 && ([v68 isEqualToString:*(void *)(a1 + 848)] & 1) == 0)
  {
    if ([v68 isEqualToString:v115] && (!*(unsigned char *)(a1 + 818) || *(void *)(a1 + 864)))
    {
      *(unsigned char *)(a1 + 818) = 1;

      *(void *)(a1 + 864) = 0;
      double v93 = &OBJC_IVAR___BWPreviewStitcherNode__teleOpacityRampForSuperMacroFallbackTransition;
    }
    else
    {
      if (![v68 isEqualToString:v114] || !*(unsigned char *)(a1 + 818) && !*(void *)(a1 + 864)) {
        goto LABEL_199;
      }
      *(unsigned char *)(a1 + 818) = 0;

      *(void *)(a1 + 864) = 0;
      *(unsigned char *)(a1 + 904) = 0;
      double v93 = &OBJC_IVAR___BWPreviewStitcherNode__teleFocusingOneShot;
    }
    *(unsigned char *)(a1 + *v93) = 0;
    uint64_t v68 = v122;
LABEL_199:
    *(_DWORD *)(a1 + 824) = 0;
    *(_DWORD *)(a1 + 396) = 0;

    *(void *)(a1 + 848) = v68;
    *(unsigned char *)(a1 + 856) = v123;
    *(unsigned char *)(a1 + 1389) = *(unsigned char *)(a1 + 1388);
    char v92 = 1;
    goto LABEL_200;
  }
  char v92 = 0;
LABEL_200:
  int v94 = -[BWPreviewStitcherNode _currentlyZoomingOrSwitchingCameras](a1);
  if ((v92 & 1) != 0 || ((v73 == 0.0) & ~v94) != 0)
  {
    if (v20 >= v15)
    {
      v96 = &OBJC_IVAR___BWPreviewStitcherNode__wantSuperWideFallback;
      if (v123) {
        v96 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
      }
      BOOL v95 = *(unsigned char *)(a1 + *v96) != 0;
    }
    else
    {
      BOOL v95 = 1;
    }
    *(unsigned char *)(a1 + 819) = v95;
    if (!v120 && *(unsigned char *)(a1 + 819)) {
      *(unsigned char *)(a1 + 819) = 0;
    }
    if (!v91)
    {
      int v97 = *(unsigned __int8 *)(a1 + 819);
      if (*(unsigned __int8 *)(a1 + 818) != v97) {
        *(unsigned char *)(a1 + 818) = v97;
      }
    }
  }
  float v98 = *(float *)(a1 + 824);
  BOOL v99 = v98 == 0.0;
  if (v73 == 0.0) {
    BOOL v99 = 0;
  }
  float v100 = v20;
  if (v99 || v98 != 0.0 && (float v100 = 0.0, v73 == 0.0)) {
    *(float *)(a1 + 828) = v100;
  }
  *(float *)(a1 + 824) = v73;
  if (v73 > 0.0)
  {
    if (v73 == v15 || v73 == v16)
    {
      float v101 = *(float *)(a1 + 824);
      if (v101 == 0.0 || vabds_f32(1.0, *(float *)(a1 + 828) / v101) < 0.1)
      {
        if (!v80) {
          goto LABEL_235;
        }
        if (!*(unsigned char *)(a1 + 1306))
        {
          int v104 = (void *)-[BWPreviewStitcherNode _primaryCameraPortType](a1);
          goto LABEL_236;
        }
      }
      if (v20 >= 1.07)
      {
        v103 = &OBJC_IVAR___BWPreviewStitcherNode__wantSuperWideFallback;
        if (v123) {
          v103 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
        }
        BOOL v102 = *(unsigned char *)(a1 + *v103) != 0;
      }
      else
      {
        BOOL v102 = 1;
      }
      *(unsigned char *)(a1 + 819) = v102;
    }
    else if (v73 != 1.0)
    {
      goto LABEL_235;
    }
    uint64_t v88 = v88 | v99;
  }
LABEL_235:
  int v104 = (void *)-[BWPreviewStitcherNode _primaryCameraPortType](a1);
  if (!v80 && !v85)
  {
LABEL_237:
    [v104 isEqualToString:v90];
    goto LABEL_239;
  }
LABEL_236:
  if ([v104 isEqualToString:v90]) {
    goto LABEL_237;
  }
  *(_DWORD *)(a1 + 396) = 0;
LABEL_239:
  double v105 = (void *)CMGetAttachment(v120, @"UIZoomFactor", 0);
  if (v105)
  {
    [v105 floatValue];
    float v107 = v106;
  }
  else
  {
    float v107 = 1.0;
  }
  float v108 = *(float *)(a1 + 1216);
  if (v107 != v108)
  {
    if (v108 != 0.0)
    {
      BWSmartCameraSceneUpdateResetTemporalHysteresisAndFiltering((unsigned char *)(a1 + 1176));
      BWSmartCameraSceneUpdateResetTemporalHysteresisAndFiltering((unsigned char *)(a1 + 1520));
    }
    *(float *)(a1 + 1216) = v107;
  }
  return v88;
}

- (uint64_t)_primaryCameraPortType
{
  if (result)
  {
    if (*(unsigned char *)(result + 1040))
    {
      uint64_t v1 = *MEMORY[0x1E4F52DE8];
      uint64_t v2 = *MEMORY[0x1E4F52DD8];
      if (*(unsigned char *)(result + 856))
      {
        uint64_t v1 = *MEMORY[0x1E4F52DD8];
        uint64_t v2 = *MEMORY[0x1E4F52DF0];
      }
      if (*(unsigned char *)(result + 819)) {
        return v1;
      }
      else {
        return v2;
      }
    }
    else
    {
      return *(void *)(result + 848);
    }
  }
  return result;
}

- (void)setTrueVideoCaptureFormatIs4K:(BOOL)a3
{
  BYTE4(self->_blackFilledBorderRectsBySurfaceID) = a3;
}

- (void)setTrueVideoCaptureEnabled:(BOOL)a3
{
  BYTE3(self->_blackFilledBorderRectsBySurfaceID) = a3;
}

- (void)setTrueVideoCaptureAdditionalZoomFactor:(double)a3
{
  *(double *)&self->_forceBlackFillBorderEnabled = a3;
}

- (void)setThermalPressureIsCritical:(BOOL)a3
{
  LOBYTE(self->_trueVideoHDRtoSDRBlendRamp) = a3;
}

- (void)setSuperWideFallbackForMacroSceneEnabled:(BOOL)a3
{
  self->_superWideFallbackForMacroSceneEnabled = a3;
}

- (void)setRebuildingGraphForTrueVideoTransition:(BOOL)a3
{
  BYTE2(self->_blackFilledBorderRectsBySurfaceID) = a3;
}

- (void)setPrimaryCaptureRectCenterX:(double)a3
{
  self->_double primaryCaptureRectCenterX = a3;
}

- (void)setPrimaryCameraAspectRatio:(double)a3
{
  p_configurationLocuint64_t k = &self->_configurationLock;
  os_unfair_lock_lock(&self->_configurationLock);
  self->_primaryCameraAspectRatio = a3;
  os_unfair_lock_unlock(p_configurationLock);
}

- (void)setPreviewsWideBeforeSlaveStreamStarts:(BOOL)a3
{
  self->_previewsWideBeforeSlaveStreamStarts = a3;
}

- (void)setOutputDimensions:(id)a3
{
  self->_outputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setMaxLossyCompressionLevel:(int)a3
{
  if (self->_maxLossyCompressionLevel != a3)
  {
    self->_maxLossyCompressionLevel = a3;
    -[BWPreviewStitcherNode _updateInputRequirements]((uint64_t)self);
  }
}

- (void)setForceBlackFillBorderEnabled:(BOOL)a3
{
  LOBYTE(self->_blackFilledBorderRectsBySurfaceID) = a3;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (BWPreviewStitcherDelegate *)a3;
}

- (CMSampleBufferRef)_newStitchedSampleBufferFromWide:(opaqueCMSampleBuffer *)a3 tele:(float64x2_t *)a4 wideRegionsShifts:(CGRect *)a5 teleShift:(double *)a6 primaryCaptureRectOut:(double *)a7 primaryCaptureRectBeforeCroppingOut:(void *)a8 centerWideShiftOut:(float64_t)a9 currentFrameRate:(float64_t)a10 inputCropRectOut:(float)a11
{
  if (!result) {
    return result;
  }
  uint64_t v16 = (uint64_t)result;
  if (sbuf)
  {
    if (!*((unsigned char *)result + 394) || *((unsigned char *)result + 425) || *((unsigned char *)result + 818))
    {
      ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
      int v17 = 1;
    }
    else
    {
      int v17 = 0;
      ImageBuffer = 0;
    }
    CMSampleBufferRef v18 = sbuf;
  }
  else
  {
    int v17 = 0;
    ImageBuffer = 0;
    CMSampleBufferRef v18 = a3;
  }
  v1033 = a3;
  v1019 = CMSampleBufferGetImageBuffer(a3);
  int v19 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(v16 + 16), "livePixelBufferPool"), "newPixelBuffer");
  *(void *)&v1047.origin.double y = v19;
  v1059.i32[0] = CVPixelBufferGetWidth(v19);
  v1059.i32[1] = CVPixelBufferGetHeight(v19);
  FigCaptureSwapVideoDimensionsFor90Or270Rotation(&v1059, *(_DWORD *)(v16 + 104));
  CMSampleBufferRef v1058 = 0;
  float v20 = (void *)CMGetAttachment(v18, @"TotalZoomFactor", 0);
  if (v20) {
    [v20 floatValue];
  }
  else {
    float v21 = 1.0;
  }
  *(float *)&v1047.origin.double x = v21;
  CFStringRef v22 = (const __CFString *)*MEMORY[0x1E4F53070];
  v1036 = (void *)CMGetAttachment(v1033, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  v1034 = 0;
  if (v17) {
    v1034 = (void *)CMGetAttachment(sbuf, v22, 0);
  }
  if (v19) {
    BOOL v23 = v1019 == 0;
  }
  else {
    BOOL v23 = 1;
  }
  if (v23)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v556 = 0;
    v557 = 0;
    v558 = 0;
    v753 = 0;
    goto LABEL_668;
  }
  unint64_t v1032 = (unint64_t)sbuf;
  CFStringRef v901 = v22;
  int v962 = *(unsigned __int8 *)(v16 + 1501);
  os_unfair_lock_lock((os_unfair_lock_t)(v16 + 388));
  int v24 = (void *)MEMORY[0x1A6272C70]();
  int v25 = (void *)[*(id *)(v16 + 1456) dequeueFencedAnimation];
  if (v25)
  {
    uint64_t v26 = v25;
    [v25 primaryCaptureAspectRatio];
    double v28 = v27;
    int v924 = [v26 primaryCaptureRectCenterXPixelOffset];
    *(void *)(v16 + 808) = (id)[v26 fencePortSendRight];
    uint64_t v882 = [v26 fencePortGenerationCount];
    if (*MEMORY[0x1E4F1EBA8] == 1)
    {
      [*(id *)(v16 + 1456) count];
      [*(id *)(v16 + 808) port];
      kdebug_trace();
    }
  }
  else
  {
    uint64_t v882 = 0;
    double v28 = *(double *)(v16 + 792);
    int v924 = *(_DWORD *)(v16 + 136);
  }
  v885 = *(void **)(v16 + 808);
  *(void *)(v16 + 808) = 0;
  int v930 = *(_DWORD *)(v16 + 140);
  if ([*(id *)(v16 + 1088) isCompleted]) {
    goto LABEL_33;
  }
  if ((*(unsigned char *)(v16 + 1076) & 1) == 0)
  {
    CMSampleBufferGetPresentationTimeStamp((CMTime *)&propertyValueOut, v1033);
    *(_OWORD *)(v16 + 1064) = *(_OWORD *)&propertyValueOut.a;
    *(CGFloat *)(v16 + 1080) = propertyValueOut.c;
  }
  memset(&propertyValueOut, 0, 24);
  CMSampleBufferGetPresentationTimeStamp((CMTime *)&propertyValueOut, v1033);
  v1047.size = *(CGSize *)&propertyValueOut.a;
  v1048.CGFloat width = propertyValueOut.c;
  rhs.origin = *(CGPoint *)(v16 + 1064);
  rhs.size.CGFloat width = *(CGFloat *)(v16 + 1080);
  CMTimeSubtract(&time, (CMTime *)&v1047.size, (CMTime *)&rhs);
  float Seconds = CMTimeGetSeconds(&time);
  int v30 = FigCaptureRoundFloatToMultipleOf(1, Seconds * 60.0);
  int v31 = [*(id *)(v16 + 1088) updateCount];
  BOOL v32 = __OFSUB__(v30, v31);
  int v33 = v30 - v31;
  if (!((v33 < 0) ^ v32 | (v33 == 0)))
  {
    do
    {
      [*(id *)(v16 + 1088) update];
      --v33;
    }
    while (v33);
  }
  if (*(float *)(v16 + 1060) <= 0.0)
  {
LABEL_33:
    float v36 = *(float *)(v16 + 1056);
  }
  else
  {
    [*(id *)(v16 + 1088) output];
    float v35 = v34;
    if (v35 > 1.0) {
      float v35 = 1.0;
    }
    if (v35 < 0.0) {
      float v35 = 0.0;
    }
    float v36 = *(float *)(v16 + 1060) + (float)((float)(*(float *)(v16 + 1056) - *(float *)(v16 + 1060)) * v35);
  }
  float v996 = v36;
  int v37 = *(unsigned __int8 *)(v16 + 1464);
  os_unfair_lock_unlock((os_unfair_lock_t)(v16 + 388));
  float v38 = (CGPoint *)MEMORY[0x1E4F1DAD8];
  if (v37
    && *(unsigned char *)(v16 + 1388)
    && (*(double *)(v16 + 1368) != *MEMORY[0x1E4F1DAD8]
     || *(double *)(v16 + 1376) != *(double *)(MEMORY[0x1E4F1DAD8] + 8)))
  {
    *(_OWORD *)(v16 + 1368) = *MEMORY[0x1E4F1DAD8];
    uint64_t v40 = -[BWPreviewStitcherNode _scale30FPSFrameCount:toFrameRate:](v16, *(unsigned int *)(v16 + 1468), a11);
    float v41 = *(float *)(v16 + 1384);
    if ([*(id *)(v16 + 1352) isRamping])
    {
      [*(id *)(v16 + 1352) currentValue];
      float v41 = v41 * *(float *)&v42;
    }
    LODWORD(v44) = 1065269330;
    LODWORD(v43) = 1.0;
    *(float *)&double v42 = v41;
    [*(id *)(v16 + 1352) startRampFrom:v40 to:2 iterations:v42 shape:v43 exponentialConvergenceFraction:v44];
    if (!*(unsigned char *)(v16 + 1107) && (*(unsigned char *)(v16 + 1564) || *(unsigned char *)(v16 + 1561)))
    {
      if (*(unsigned char *)(v16 + 1563)) {
        *(float *)&double v47 = 88.0;
      }
      else {
        *(float *)&double v47 = 70.0;
      }
      LODWORD(v49) = 981668463;
      LODWORD(v50) = 1114636288;
      LODWORD(v46) = 1.0;
      LODWORD(v48) = 17.0;
      *(float *)&double v45 = v41;
      [*(id *)(v16 + 1352) startSpringRampFrom:v45 to:v46 withTension:v47 friction:v48 snapFraction:v49 frameRate:v50];
    }
  }
  uint64_t v51 = *MEMORY[0x1E4F54128];
  float v52 = (void *)[v1036 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
  int v53 = [v52 isEqualToString:*MEMORY[0x1E4F52DF0]];
  float v54 = (void **)MEMORY[0x1E4F52DD8];
  if (v53)
  {
    float v55 = *(float *)(v16 + 164);
    float v56 = *(float *)(v16 + 248);
    if (v56 <= 0.0) {
      float v57 = *(float *)(v16 + 164);
    }
    else {
      float v57 = v56 * *(float *)(v16 + 160);
    }
  }
  else
  {
    float v57 = 1.0;
    float v55 = 1.0;
    if ([v52 isEqualToString:*MEMORY[0x1E4F52DD8]])
    {
      float v55 = *(float *)(v16 + 160) * *(float *)(v16 + 224);
      double v58 = -[BWPreviewStitcherNode _wideBaseZoomFactorWithOverride]((float *)v16);
      float v57 = *(float *)&v58;
    }
  }
  uint64_t v890 = v51;
  uint64_t v59 = [v1034 objectForKeyedSubscript:v51];
  char v60 = (void *)MEMORY[0x1E4F52DE8];
  if (v1032 | v59)
  {
    id v61 = *v54;
    char v62 = (void *)v59;
  }
  else
  {
    int v63 = (void *)*MEMORY[0x1E4F52DE8];
    int v64 = [v52 isEqualToString:*MEMORY[0x1E4F52DE8]];
    id v61 = *v54;
    if (v53) {
      objc_super v65 = *v54;
    }
    else {
      objc_super v65 = v63;
    }
    if (v64) {
      char v62 = 0;
    }
    else {
      char v62 = v65;
    }
  }
  if ([v62 isEqualToString:v61])
  {
    float v66 = *(float *)(v16 + 160) * *(float *)(v16 + 224);
LABEL_72:
    float v877 = 1.0;
    float v73 = v66;
    goto LABEL_73;
  }
  if (![v62 isEqualToString:*v60] || !*(unsigned char *)(v16 + 153))
  {
    float v66 = v55 * 0.5;
    goto LABEL_72;
  }
  float v67 = *(float *)(v16 + 156);
  float v68 = *(float *)(v16 + 240);
  int v69 = (void *)CMGetAttachment((CMAttachmentBearerRef)v1032, @"ZoomFactorLowerBoundAfterGDCAndFocus", 0);
  LODWORD(v70) = 1.0;
  if (v69) {
    objc_msgSend(v69, "floatValue", v70);
  }
  float v71 = v67 * v68;
  float v72 = *(float *)(v16 + 240);
  float v66 = *(float *)&v70 * v72;
  if ((float)(*(float *)&v70 * v72) > 1.0)
  {
    float v877 = v71 / v66;
    char v60 = (void *)MEMORY[0x1E4F52DE8];
LABEL_185:
    float v73 = v67 * v68;
    goto LABEL_73;
  }
  float v194 = *(float *)(v16 + 168);
  float v877 = 1.0;
  if (v194 <= 0.0)
  {
    float v73 = v67 * v68;
    float v66 = v67 * v68;
    char v60 = (void *)MEMORY[0x1E4F52DE8];
  }
  else
  {
    char v60 = (void *)MEMORY[0x1E4F52DE8];
    if (v194 != *(float *)(v16 + 156))
    {
      float v66 = v72 * v194;
      float v877 = v71 / (float)(v72 * v194);
      goto LABEL_185;
    }
    float v73 = v67 * v68;
    float v66 = v67 * v68;
  }
LABEL_73:
  v908 = v62;
  float v939 = v73;
  if (*(unsigned char *)(v16 + 1040)) {
    BOOL v74 = *(unsigned char *)(v16 + 817) != 0;
  }
  else {
    BOOL v74 = 1;
  }
  int v879 = v74;
  int v75 = *(unsigned __int8 *)(v16 + 818);
  if (v53) {
    float v76 = &OBJC_IVAR___BWPreviewStitcherNode__wideNondisruptiveSwitchingScaleFactor;
  }
  else {
    float v76 = &OBJC_IVAR___BWPreviewStitcherNode__superWideNondisruptiveSwitchingScaleFactor;
  }
  double v77 = *(float *)(v16 + *v76);
  float64x2_t r2 = vmulq_n_f64(a4[1], v77);
  double v78 = a4[2].f64[0] * v77;
  double v79 = a4[2].f64[1] * v77;
  float64x2_t v979 = vmulq_n_f64(*(float64x2_t *)(v16 + 1288), *(float *)(v16 + 224));
  float v80 = *(float *)(v16 + 240);
  float64x2_t v986 = vmulq_n_f64(*(float64x2_t *)(v16 + 1368), v80);
  uint64_t v1002 = (uint64_t)v52;
  double x = v38->x;
  double y = v38->y;
  float v878 = v66;
  float64x2_t v1020 = vmulq_n_f64(*a4, v77);
  float64x2_t v915 = *(float64x2_t *)(v16 + 712);
  double v970 = *(float *)(v16 + 224);
  if (!*(unsigned char *)(v16 + 1040))
  {
    double v89 = v38->y;
    double v90 = v38->x;
    char v86 = v1019;
    goto LABEL_108;
  }
  uint64_t v81 = &OBJC_IVAR___BWPreviewStitcherNode__superWideFallbackShiftRamp;
  if (v53) {
    uint64_t v81 = &OBJC_IVAR___BWPreviewStitcherNode__wideFallbackShiftRamp;
  }
  int v82 = *(void **)(v16 + *v81);
  float v83 = v66 / v80;
  float v84 = *(float *)&v1047.origin.x;
  if (v55 < *(float *)&v1047.origin.x) {
    float v84 = v55;
  }
  if (v84 < v83) {
    float v84 = v83;
  }
  double v85 = (float)((float)((float)(v84 - v83) / (float)(v55 - v83)) + 0.0) * 1.57079633;
  char v86 = v1019;
  if (fabs(v85) <= 1.57079633)
  {
    double v88 = sin(v85);
  }
  else
  {
    BOOL v87 = v85 < 0.0;
    double v88 = 1.0;
    if (v87) {
      double v88 = -1.0;
    }
  }
  double v1024 = v88;
  [v82 currentValue];
  double v92 = v1024 * (1.0 - v91);
  double v93 = 1.0 - v92;
  if (*(unsigned char *)(v16 + 1560))
  {
    double v1006 = v1024 * (1.0 - v91);
    int v94 = [v52 isEqualToString:*v60];
    double v92 = v1006;
    if (v94) {
      double v93 = 0.0;
    }
  }
  if (v93 == 0.0) {
    double v89 = y;
  }
  else {
    double v89 = -(v93 * v79);
  }
  if (v93 == 0.0) {
    double v90 = x;
  }
  else {
    double v90 = -(v93 * v78);
  }
  float64x2_t r2 = vmulq_n_f64(r2, v92);
  double v78 = v78 * v92;
  double v79 = v79 * v92;
  float64x2_t v1020 = vmulq_n_f64(v1020, v92);
  if (v53)
  {
    float64x2_t v95 = v979;
    if (v979.f64[0] != x || (float64x2_t v95 = v979, v979.f64[1] != y))
    {
LABEL_107:
      float64x2_t v1007 = v95;
      [v82 currentValue];
      unsigned int v991 = v96;
      [v82 currentValue];
      float64x2_t v98 = vmulq_f64(v1007, vmulq_n_f64(vcvtq_f64_f32((float32x2_t)__PAIR64__(v97, v991)), v1024));
      float64x2_t r2 = vaddq_f64(r2, v98);
      float64x2_t v1020 = vaddq_f64(v1020, v98);
      double v78 = v78 + v98.f64[0];
      double v79 = v79 + v98.f64[1];
      double v90 = v90 + v98.f64[0];
      double v89 = v89 + v98.f64[1];
    }
  }
  else
  {
    float64x2_t v95 = v986;
    if (v986.f64[0] != x) {
      goto LABEL_107;
    }
    float64x2_t v95 = v986;
    if (v986.f64[1] != y) {
      goto LABEL_107;
    }
  }
LABEL_108:
  memset(&recta, 0, sizeof(recta));
  recta.origin.double x = psn_pixelBufferRect(v86);
  recta.origin.double y = v99;
  recta.size.CGFloat width = v100;
  recta.size.CGFloat height = v101;
  CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[v1036 objectForKeyedSubscript:*MEMORY[0x1E4F54370]], &recta);
  CGRect v1055 = *(CGRect *)ymmword_1A5EFDD50;
  uint64_t v927 = *MEMORY[0x1E4F53260];
  CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v1036, "objectForKeyedSubscript:"), &v1055);
  if (v996 > 0.0)
  {
    v1055.origin.double x = FigCaptureMetadataUtilitiesScaleRect2D(v1055.origin.x, v1055.origin.y, v1055.size.width, v1055.size.height, 1.0 / v996);
    v1055.origin.double y = v102;
    v1055.size.CGFloat width = v103;
    v1055.size.CGFloat height = v104;
  }
  memset(&rect1, 0, sizeof(rect1));
  CVPixelBufferGetWidth(v86);
  CVPixelBufferGetHeight(v86);
  FigCaptureMetadataUtilitiesDenormalizeCropRect(v1055.origin.x, v1055.origin.y, v1055.size.width, v1055.size.height);
  rect1.origin.double x = v105;
  rect1.origin.double y = v106;
  rect1.size.CGFloat width = v107;
  rect1.size.CGFloat height = v108;
  CFDictionaryRef v109 = (const __CFDictionary *)CMGetAttachment(v1033, (CFStringRef)*MEMORY[0x1E4F530C8], 0);
  CFDictionaryRef v110 = v109;
  CGPoint v111 = *v38;
  CGPoint rect2 = *v38;
  CGPoint point = *v38;
  float v112 = (void *)v1032;
  *(double *)&uint64_t v928 = v79;
  *(double *)&uint64_t v929 = v78;
  float v113 = &OBJC_IVAR___FigCaptureCMSession__cmsession;
  float v889 = v57;
  float v982 = v55;
  if (v109)
  {
    double v952 = v90;
    double v954 = v89;
    double v957 = v28;
    CGPointMakeWithDictionaryRepresentation(v109, &point);
    double v1025 = point.x;
    double v967 = point.y;
    CGFloat v114 = rect1.origin.x;
    CGFloat v115 = rect1.origin.y;
    CGFloat width = rect1.size.width;
    CGFloat height = rect1.size.height;
    CGFloat v119 = recta.origin.x;
    CGFloat v118 = recta.origin.y;
    CGFloat v120 = recta.size.width;
    CGFloat v121 = recta.size.height;
    double MinX = CGRectGetMinX(recta);
    v1060.origin.double x = v114;
    v1060.origin.double y = v115;
    v1060.size.CGFloat width = width;
    v1060.size.CGFloat height = height;
    double v942 = MinX - CGRectGetMinX(v1060);
    CGFloat v992 = v119;
    v1061.origin.double x = v119;
    v1061.origin.double y = v118;
    v1061.size.CGFloat width = v120;
    v1061.size.CGFloat height = v121;
    double MaxX = CGRectGetMaxX(v1061);
    v1062.origin.double x = v114;
    v1062.origin.double y = v115;
    v1062.size.CGFloat width = width;
    CGFloat v1009 = height;
    v1062.size.CGFloat height = height;
    BOOL v87 = MaxX - CGRectGetMaxX(v1062) < v1025;
    double v123 = v1025;
    if (v87)
    {
      v1063.origin.double x = v992;
      v1063.origin.double y = v118;
      v1063.size.CGFloat width = v120;
      v1063.size.CGFloat height = v121;
      double v124 = CGRectGetMaxX(v1063);
      v1064.origin.double x = v114;
      v1064.origin.double y = v115;
      v1064.size.CGFloat width = width;
      v1064.size.CGFloat height = v1009;
      double v123 = v124 - CGRectGetMaxX(v1064);
    }
    CGFloat v965 = width;
    if (v942 <= v123)
    {
      v1067.origin.double x = v992;
      v1067.origin.double y = v118;
      v1067.size.CGFloat width = v120;
      v1067.size.CGFloat height = v121;
      double v943 = CGRectGetMaxX(v1067);
      v1068.origin.double x = v114;
      v1068.origin.double y = v115;
      v1068.size.CGFloat width = width;
      CGFloat v125 = v115;
      CGFloat v126 = v114;
      CGFloat v127 = v120;
      CGFloat v128 = v118;
      CGFloat v129 = v1009;
      v1068.size.CGFloat height = v1009;
      if (v943 - CGRectGetMaxX(v1068) >= v1025) {
        goto LABEL_119;
      }
      v1069.origin.double x = v992;
      v1069.origin.double y = v118;
      v1069.size.CGFloat width = v127;
      v1069.size.CGFloat height = v121;
      double v131 = CGRectGetMaxX(v1069);
      v1070.origin.double x = v126;
      v1070.origin.double y = v125;
      v1070.size.CGFloat width = width;
      v1070.size.CGFloat height = v1009;
      double v130 = v131 - CGRectGetMaxX(v1070);
    }
    else
    {
      v1065.origin.double x = v992;
      v1065.origin.double y = v118;
      v1065.size.CGFloat width = v120;
      v1065.size.CGFloat height = v121;
      double v1026 = CGRectGetMinX(v1065);
      v1066.origin.double x = v114;
      v1066.origin.double y = v115;
      v1066.size.CGFloat width = width;
      CGFloat v125 = v115;
      CGFloat v126 = v114;
      CGFloat v127 = v120;
      CGFloat v128 = v118;
      CGFloat v129 = v1009;
      v1066.size.CGFloat height = v1009;
      double v130 = v1026 - CGRectGetMinX(v1066);
    }
    double v1025 = v130;
LABEL_119:
    v1071.origin.double x = v992;
    v1071.origin.double y = v128;
    v1071.size.CGFloat width = v127;
    v1071.size.CGFloat height = v121;
    double MinY = CGRectGetMinY(v1071);
    v1072.origin.double x = v126;
    v1072.origin.double y = v125;
    v1072.size.CGFloat width = v965;
    v1072.size.CGFloat height = v129;
    double v944 = MinY - CGRectGetMinY(v1072);
    v1073.origin.double x = v992;
    v1073.origin.double y = v128;
    v1073.size.CGFloat width = v127;
    v1073.size.CGFloat height = v121;
    double MaxY = CGRectGetMaxY(v1073);
    v1074.origin.double x = v126;
    v1074.origin.double y = v125;
    v1074.size.CGFloat width = v965;
    v1074.size.CGFloat height = v129;
    BOOL v87 = MaxY - CGRectGetMaxY(v1074) < v967;
    double v134 = v967;
    if (v87)
    {
      v1075.origin.double x = v992;
      v1075.origin.double y = v128;
      v1075.size.CGFloat width = v127;
      v1075.size.CGFloat height = v121;
      double v135 = CGRectGetMaxY(v1075);
      v1076.origin.double x = v126;
      v1076.origin.double y = v125;
      v1076.size.CGFloat width = v965;
      v1076.size.CGFloat height = v1009;
      double v134 = v135 - CGRectGetMaxY(v1076);
    }
    if (v944 <= v134)
    {
      v1079.origin.double x = v992;
      v1079.origin.double y = v128;
      v1079.size.CGFloat width = v127;
      v1079.size.CGFloat height = v121;
      double v138 = CGRectGetMaxY(v1079);
      v1080.origin.double x = v126;
      v1080.origin.double y = v125;
      v1080.size.CGFloat width = v965;
      v1080.size.CGFloat height = v1009;
      CGFloat v139 = CGRectGetMaxY(v1080);
      double v140 = v967;
      if (v138 - v139 >= v967)
      {
LABEL_127:
        HIDWORD(v111.x) = HIDWORD(v1025);
        point.double x = v1025;
        point.double y = v140;
        double v79 = *(double *)&v928;
        double v78 = *(double *)&v929;
        float v57 = v889;
        float v55 = v982;
        double v28 = v957;
        double v90 = v952;
        double v89 = v954;
        goto LABEL_128;
      }
      v1081.origin.double x = v992;
      v1081.origin.double y = v128;
      v1081.size.CGFloat width = v127;
      v1081.size.CGFloat height = v121;
      double v136 = CGRectGetMaxY(v1081);
      v1082.origin.double x = v126;
      v1082.origin.double y = v125;
      v1082.size.CGFloat width = v965;
      v1082.size.CGFloat height = v1009;
      double v137 = CGRectGetMaxY(v1082);
    }
    else
    {
      v1077.origin.double x = v992;
      v1077.origin.double y = v128;
      v1077.size.CGFloat width = v127;
      v1077.size.CGFloat height = v121;
      double v136 = CGRectGetMinY(v1077);
      v1078.origin.double x = v126;
      v1078.origin.double y = v125;
      v1078.size.CGFloat width = v965;
      v1078.size.CGFloat height = v1009;
      double v137 = CGRectGetMinY(v1078);
    }
    double v140 = v136 - v137;
    goto LABEL_127;
  }
LABEL_128:
  int v141 = *(unsigned __int8 *)(v16 + 1040);
  CFDictionaryRef v886 = v110;
  if (!*(unsigned char *)(v16 + 1040))
  {
    double v918 = v89 - point.y;
    double v916 = v90 - point.x;
    double v144 = 1.0;
    double v953 = v79;
    double v955 = v78;
    goto LABEL_162;
  }
  float v142 = *(float *)(v16 + 164);
  if (v142 <= 0.0) {
    char v143 = 1;
  }
  else {
    char v143 = v53;
  }
  if (v143)
  {
    float v142 = v55 + v55;
    *(float *)&v111.double x = v55;
LABEL_137:
    double v146 = (float)(v939 / v57);
    goto LABEL_138;
  }
  long long v145 = *(void **)(v16 + 216);
  *(float *)&v111.double x = v55;
  if (!v145) {
    goto LABEL_137;
  }
  objc_msgSend((id)objc_msgSend(v145, "firstObject", v111.x), "floatValue");
  float v142 = *(float *)(v16 + 164);
  if (*(unsigned char *)(v16 + 1040)) {
    goto LABEL_137;
  }
  double v146 = 1.0;
LABEL_138:
  double v1027 = v146;
  v147.f64[0] = a9;
  v147.f64[1] = a10;
  r1double a = v147;
  float v148 = *(float *)&v1047.origin.x;
  if (v142 < *(float *)&v1047.origin.x) {
    float v148 = v142;
  }
  if (v148 < *(float *)&v111.x) {
    float v148 = *(float *)&v111.x;
  }
  double v149 = (float)((float)((float)(v148 - *(float *)&v111.x) / (float)(v142 - *(float *)&v111.x)) + 0.0) * 1.57079633;
  if (fabs(v149) <= 1.57079633)
  {
    double v150 = sin(v149);
  }
  else if (v149 >= 0.0)
  {
    double v150 = 1.0;
  }
  else
  {
    double v150 = -1.0;
  }
  float64x2_t v151 = vmulq_n_f64(r1a, v970);
  if (v53)
  {
    float64x2_t v152 = vmulq_n_f64(v151, v150);
    double v153 = v1027;
    float64x2_t v154 = vmulq_n_f64(v152, v1027);
    if (v986.f64[0] == x && v986.f64[1] == y) {
      goto LABEL_155;
    }
    float64x2_t r1f = v154;
    double v155 = -[BWPreviewStitcherNode _wideBaseZoomFactorWithOverride]((float *)v16);
    double v1010 = (float)(*(float *)&v155 / *(float *)(v16 + 156));
    [*(id *)(v16 + 1352) currentValue];
    unsigned int v993 = v156;
    [*(id *)(v16 + 1352) currentValue];
    float64x2_t v157 = r1f;
    double v153 = v1027;
    float64x2_t v158 = vsubq_f64(vmulq_n_f64(v986, v1010), vmulq_n_f64(v915, v1010));
    float64x2_t v160 = vcvtq_f64_f32((float32x2_t)__PAIR64__(v159, v993));
  }
  else
  {
    double v1011 = v150;
    float64x2_t r1g = v151;
    [*(id *)(v16 + 1280) currentValue];
    double v162 = r1g.f64[0];
    double v153 = v1027;
    float64x2_t v154 = vmulq_n_f64(vmulq_n_f64(r1g, v1011 * (1.0 - v161)), v1027);
    double v163 = x;
    if (v979.f64[0] == x)
    {
      double v163 = v979.f64[1];
      double v162 = y;
      if (v979.f64[1] == y) {
        goto LABEL_155;
      }
    }
    float64x2_t r1h = v154;
    objc_msgSend(*(id *)(v16 + 1280), "currentValue", v163, v162, v979.f64[0]);
    unsigned int v994 = v164;
    [*(id *)(v16 + 1280) currentValue];
    float64x2_t v157 = r1h;
    double v153 = v1027;
    float64x2_t v160 = vmulq_n_f64(vmulq_n_f64(vcvtq_f64_f32((float32x2_t)__PAIR64__(v165, v994)), v1011), v1027);
    float64x2_t v158 = v979;
  }
  float64x2_t v154 = vaddq_f64(v157, vmulq_f64(v158, v160));
LABEL_155:
  double v166 = point.x;
  float64x2_t v167 = vmlsq_lane_f64(v154, (float64x2_t)point, v153, 0);
  float64x2_t r2 = vaddq_f64(r2, v167);
  float64x2_t v1020 = vaddq_f64(v1020, v167);
  double v953 = v79 + v167.f64[1];
  double v955 = v78 + v167.f64[0];
  int v141 = *(unsigned __int8 *)(v16 + 1040);
  double v168 = point.y;
  if (*(unsigned char *)(v16 + 1040)) {
    double v168 = 0.0;
  }
  double v918 = v89 + v167.f64[1] - v168;
  if (*(unsigned char *)(v16 + 1040)) {
    double v166 = 0.0;
  }
  double v916 = v90 + v167.f64[0] - v166;
  if (*(unsigned char *)(v16 + 1040))
  {
    double v144 = (float)(v57 / v939);
    int v141 = 1;
  }
  else
  {
    double v144 = 1.0;
  }
LABEL_162:
  uint64_t v169 = MEMORY[0x1E4F1DB28];
  float v170 = v28;
  if (*(unsigned char *)(v16 + 1560))
  {
    if ([v52 isEqualToString:*MEMORY[0x1E4F52DE8]]) {
      double v144 = 1.0;
    }
    int v141 = *(unsigned __int8 *)(v16 + 1040);
  }
  CGSize v893 = *(CGSize *)(v169 + 16);
  CGPoint v894 = *(CGPoint *)v169;
  v1052.origin = *(CGPoint *)v169;
  v1052.size = v893;
  CGFloat v171 = rect1.size.width;
  CGFloat v172 = rect1.size.height;
  float v173 = rect1.size.width / rect1.size.height;
  float v909 = v173;
  if (v170 <= 0.0) {
    float v174 = rect1.size.width / rect1.size.height;
  }
  else {
    float v174 = v170;
  }
  if (v141)
  {
    if (v55 != v57)
    {
      CGFloat v175 = FigCaptureMetadataUtilitiesScaleRect2D(rect1.origin.x, rect1.origin.y, rect1.size.width, rect1.size.height, (float)(v57 / v55));
      CGFloat v171 = v176;
      CGFloat v172 = v177;
      rect1.origin.double x = v175;
      rect1.origin.double y = v178;
      rect1.size.CGFloat width = v176;
      rect1.size.CGFloat height = v177;
    }
    if (v53)
    {
      double v179 = -[BWPreviewStitcherNode _wideBaseZoomFactorWithOverride]((float *)v16);
      CGFloat v180 = FigCaptureMetadataUtilitiesScaleRect2D(rect1.origin.x, rect1.origin.y, v171, v172, (float)(*(float *)&v179 / (float)(*(float *)(v16 + 160) * *(float *)(v16 + 224))));
      CGFloat v171 = v181;
      CGFloat v172 = v182;
      rect1.origin.double x = v180;
      rect1.origin.double y = v183;
      rect1.size.CGFloat width = v181;
      rect1.size.CGFloat height = v182;
    }
  }
  float v995 = v174;
  double v987 = v144;
  if (*(unsigned char *)(v16 + 1564) || *(unsigned char *)(v16 + 1107))
  {
    double v184 = *(double *)(v16 + 1112);
    v185 = (void *)[v1036 objectForKeyedSubscript:v890];
    if (!*(unsigned char *)(v16 + 1107) && [v185 isEqual:*MEMORY[0x1E4F52DF8]])
    {
      v186 = (void *)CMGetAttachment(v1033, @"TotalZoomFactor", 0);
      if (v186) {
        [v186 floatValue];
      }
      else {
        float v187 = 1.0;
      }
      double v184 = v184 / v187;
    }
    int v195 = *(unsigned __int8 *)(v16 + 1107);
    float v196 = 1.0 / v184;
    float v197 = v184;
    if (*(unsigned char *)(v16 + 1107)) {
      float v197 = 1.0;
    }
    else {
      float v196 = 1.0;
    }
    float v198 = 1.7778;
    if (v174 <= 1.7778) {
      float v198 = v174;
    }
    float v199 = v197 - v196;
    float v200 = (float)(v198 + -1.3333) / 0.44444;
    BOOL v87 = v198 < 1.3333;
    float v201 = 0.0;
    if (!v87) {
      float v201 = v200;
    }
    float v996 = v196 + (float)(v199 * v201);
    float v202 = 1.0 / v996;
    CGFloat v203 = recta.origin.x;
    CGFloat v980 = recta.origin.y;
    CGFloat v204 = recta.size.width;
    double v205 = recta.size.height;
    double v206 = recta.size.width / rect1.size.width;
    if (recta.size.width / rect1.size.width >= recta.size.height / rect1.size.height) {
      double v206 = recta.size.height / rect1.size.height;
    }
    double v902 = v202;
    double v905 = rect1.size.width;
    if (v206 > v202) {
      double v206 = v202;
    }
    CGFloat v208 = FigCaptureMetadataUtilitiesScaleRect2D(rect1.origin.x, rect1.origin.y, rect1.size.width, rect1.size.height, v206);
    CGFloat v1012 = v209;
    CGFloat v210 = v207;
    CGFloat v212 = v211;
    float v213 = v207 / v211;
    BOOL v214 = v174 <= v213;
    double v215 = v211 * v213 / v174;
    BOOL v216 = v215 > v205;
    if (v214 && v216) {
      double v215 = v205;
    }
    double v977 = v215;
    if (v214 && v216) {
      double v217 = v205 * v174;
    }
    else {
      double v217 = v207;
    }
    v1083.origin.double x = v203;
    v1083.origin.double y = v980;
    v1083.size.CGFloat width = v204;
    v1083.size.CGFloat height = v205;
    double v920 = CGRectGetMinX(v1083);
    CGFloat v1028 = v203;
    v1084.origin.double x = v203;
    CGFloat v218 = v980;
    v1084.origin.double y = v980;
    v1084.size.CGFloat width = v204;
    v1084.size.CGFloat height = v205;
    keydouble b = CGRectGetMaxX(v1084) - v217;
    v1085.origin.double x = v208;
    v1085.origin.double y = v1012;
    v1085.size.CGFloat width = v210;
    v1085.size.CGFloat height = v212;
    double v968 = v217;
    CGFloat v958 = v210;
    CGFloat v945 = v212;
    if (keyb >= CGRectGetMidX(v1085) - v217 * 0.5)
    {
      v1087.origin.double x = v208;
      v1087.origin.double y = v1012;
      v1087.size.CGFloat width = v210;
      v1087.size.CGFloat height = v212;
      double v220 = CGRectGetMidX(v1087) - v217 * 0.5;
      CGFloat v219 = v1028;
    }
    else
    {
      CGFloat v219 = v1028;
      v1086.origin.double x = v1028;
      v1086.origin.double y = v980;
      v1086.size.CGFloat width = v204;
      v1086.size.CGFloat height = v205;
      double v220 = CGRectGetMaxX(v1086) - v217;
    }
    BOOL v221 = v920 <= v220;
    CGFloat v222 = v219;
    if (v221)
    {
      CGFloat v226 = v980;
      CGFloat v227 = v204;
      double v228 = v205;
      CGFloat v229 = CGRectGetMaxX(*(CGRect *)&v222) - v217;
      v1088.origin.double x = v208;
      v1088.origin.double y = v1012;
      v1088.size.CGFloat width = v958;
      v1088.size.CGFloat height = v212;
      if (v229 >= CGRectGetMidX(v1088) - v217 * 0.5)
      {
        v1090.origin.double x = v208;
        v1090.origin.double y = v1012;
        v1090.size.CGFloat width = v958;
        v1090.size.CGFloat height = v212;
        double key = CGRectGetMidX(v1090) - v217 * 0.5;
      }
      else
      {
        v1089.origin.double x = v219;
        v1089.origin.double y = v980;
        v1089.size.CGFloat width = v204;
        v1089.size.CGFloat height = v205;
        double key = CGRectGetMaxX(v1089) - v217;
      }
      CGFloat v218 = v980;
    }
    else
    {
      CGFloat v223 = v980;
      CGFloat v224 = v204;
      double v225 = v205;
      double key = CGRectGetMinX(*(CGRect *)&v222);
    }
    v1091.origin.double x = v219;
    v1091.origin.double y = v218;
    v1091.size.CGFloat width = v204;
    v1091.size.CGFloat height = v205;
    double v921 = CGRectGetMinY(v1091);
    v1092.origin.double x = v219;
    v1092.origin.double y = v218;
    v1092.size.CGFloat width = v204;
    v1092.size.CGFloat height = v205;
    CGFloat v230 = CGRectGetMaxY(v1092) - v977;
    v1093.origin.double x = v208;
    v1093.origin.double y = v1012;
    v1093.size.CGFloat width = v958;
    v1093.size.CGFloat height = v212;
    double v231 = v977 * 0.5;
    if (v230 >= CGRectGetMidY(v1093) - v977 * 0.5)
    {
      v1095.origin.double x = v208;
      v1095.origin.double y = v1012;
      v1095.size.CGFloat width = v958;
      v1095.size.CGFloat height = v945;
      double v232 = CGRectGetMidY(v1095) - v231;
    }
    else
    {
      v1094.origin.double x = v1028;
      v1094.origin.double y = v980;
      v1094.size.CGFloat width = v204;
      v1094.size.CGFloat height = v205;
      double v232 = CGRectGetMaxY(v1094) - v977;
    }
    if (v921 <= v232)
    {
      v1097.origin.double x = v1028;
      v1097.origin.double y = v980;
      v1097.size.CGFloat width = v204;
      v1097.size.CGFloat height = v205;
      CGFloat v233 = CGRectGetMaxY(v1097) - v977;
      v1098.origin.double x = v208;
      v1098.origin.double y = v1012;
      v1098.size.CGFloat width = v958;
      v1098.size.CGFloat height = v945;
      if (v233 >= CGRectGetMidY(v1098) - v231)
      {
        v1100.origin.double x = v208;
        v1100.origin.double y = v1012;
        v1100.size.CGFloat width = v958;
        v1100.size.CGFloat height = v945;
        double v191 = CGRectGetMidY(v1100) - v231;
      }
      else
      {
        v1099.origin.double x = v1028;
        v1099.origin.double y = v980;
        v1099.size.CGFloat width = v204;
        v1099.size.CGFloat height = v205;
        double v191 = CGRectGetMaxY(v1099) - v977;
      }
      CGFloat v172 = v977;
    }
    else
    {
      v1096.origin.double x = v1028;
      v1096.origin.double y = v980;
      v1096.size.CGFloat width = v204;
      v1096.size.CGFloat height = v205;
      double v191 = CGRectGetMinY(v1096);
      CGFloat v172 = v977;
    }
    double v189 = key;
    float v174 = v995;
    float v55 = v982;
    double v144 = v987;
    CGFloat v171 = v968;
    if (v195) {
      float v188 = v902 / (v968 / v905);
    }
    else {
      float v188 = 1.0;
    }
  }
  else
  {
    float v188 = 1.0;
    if (v170 <= 0.0) {
      goto LABEL_227;
    }
    double v189 = FigCaptureMetadataUtilitiesRectByCroppingRectToAspectRatio(rect1.origin.x, rect1.origin.y, v171, v172, v170);
    double v191 = v190;
    CGFloat v171 = v192;
    CGFloat v172 = v193;
  }
  rect1.origin.double x = v189;
  rect1.origin.double y = v191;
  rect1.size.CGFloat width = v171;
  rect1.size.CGFloat height = v172;
LABEL_227:
  float v234 = v55;
  if (v962) {
    double v235 = psn_rectBoundedByRect(rect1.origin.x, rect1.origin.y, v171, v172, recta.origin.x, recta.origin.y, recta.size.width, recta.size.height);
  }
  else {
    double v235 = psn_conformRectForMSR420vfBoundedByRect(0, rect1.origin.x, rect1.origin.y, v171, v172, recta.origin.x, recta.origin.y, recta.size.width, recta.size.height);
  }
  int v239 = v930 + v924;
  rect1.origin.double x = v235;
  rect1.origin.double y = v236;
  rect1.size.CGFloat width = v237;
  rect1.size.CGFloat height = v238;
  v1101.size.CGFloat width = (double)v1059.i32[0];
  v1101.size.CGFloat height = (double)v1059.i32[1];
  v1101.origin.double x = 0.0;
  v1101.origin.double y = 0.0;
  CGRect v1102 = CGRectInset(v1101, (double)*(int *)(v16 + 120), (double)*(int *)(v16 + 120));
  double v240 = v1102.size.width;
  double v241 = v1102.size.height;
  if (v188 > 1.0 && *(unsigned char *)(v16 + 1576))
  {
    v1102.origin.double x = FigCaptureMetadataUtilitiesScaleRect2D(v1102.origin.x, v1102.origin.y, v1102.size.width, v1102.size.height, (float)(1.0 / v188));
    double v240 = v242;
    double v241 = v243;
  }
  double v244 = (double)v239;
  double v922 = (double)v239;
  if (!v239) {
    double v244 = -0.0;
  }
  double v245 = v244 + v1102.origin.x;
  r1double b = v1102.origin.y;
  v1103.origin.double x = FigCaptureMetadataUtilitiesRectByCroppingRectToAspectRatio(v244 + v1102.origin.x, v1102.origin.y, v240, v241, v174);
  CGRect v1052 = v1103;
  long long v246 = *(_OWORD *)(v16 + 344);
  *(_OWORD *)&propertyValueOut.double a = *(_OWORD *)(v16 + 328);
  *(_OWORD *)&propertyValueOut.double c = v246;
  *(_OWORD *)&propertyValueOut.tdouble x = *(_OWORD *)(v16 + 360);
  CGRect v1104 = CGRectApplyAffineTransform(v1103, &propertyValueOut);
  double v247 = v1104.origin.y;
  double v248 = v1104.size.width;
  if (a5) {
    *a5 = v1104;
  }
  double v969 = v1104.origin.x;
  double v971 = v1104.size.height;
  v249 = ImageBuffer;
  if (a6)
  {
    double v250 = v909;
    double v251 = v174;
    if (v174 <= v909)
    {
      double v253 = 1.0;
      double v252 = v250 / v251;
    }
    else
    {
      double v252 = 1.0;
      double v253 = v251 / v250;
    }
    *a6 = (1.0 - v252) * 0.5;
    a6[1] = (1.0 - v253) * 0.5;
    a6[2] = v252;
    a6[3] = v253;
  }
  int v925 = v930 + v924;
  if (*(unsigned char *)(v16 + 145))
  {
    v1105.origin.double x = psn_conformRectForMSR420vfBoundedByRect(1, v969, v247, v248, v971, v969, v247, v248, v971);
    CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v1105);
    VTSessionSetProperty(*(VTSessionRef *)(v16 + 312), (CFStringRef)*MEMORY[0x1E4F450B0], DictionaryRepresentation);
    if (DictionaryRepresentation) {
      CFRelease(DictionaryRepresentation);
    }
  }
  CGFloat v981 = v247;
  if (*(unsigned char *)(v16 + 246))
  {
    double v255 = recta.size.width;
    double v256 = v255 / (double)CVPixelBufferGetWidth(v86);
    double v257 = recta.size.height;
    if (v256 >= v257 / (double)CVPixelBufferGetHeight(v86))
    {
      double v258 = recta.size.height;
      size_t v259 = CVPixelBufferGetHeight(v86);
    }
    else
    {
      double v258 = recta.size.width;
      size_t v259 = CVPixelBufferGetWidth(v86);
    }
    float v260 = v258 / (double)v259;
  }
  else
  {
    float v260 = 1.0;
  }
  CGFloat v966 = v248;
  if (*(float *)&v1047.origin.x < v234 || *(float *)&v1047.origin.x < (float)(v234 / v260))
  {
    acpr_conformRectForMSR420vf(v1052.origin.x, v1052.origin.y, v1052.size.width, v1052.size.height);
    double v268 = v266 / (rect1.size.width + rect1.size.width) + v267 / (rect1.size.height + rect1.size.height);
    double v269 = v260;
    if (v260 == 1.0) {
      double v269 = 1.0;
    }
    double v265 = v269 * v268;
    double v270 = 1.0 - *(float *)&v1047.origin.x / v234 * v269;
    *(CGRect *)&double v261 = CGRectInset(v1052, v270 * v1052.size.width * 0.5, v270 * v1052.size.height * 0.5);
  }
  else
  {
    double v261 = psn_smallestBoundingRectAlignedToMultipleOf(*(_DWORD *)(v16 + 908), v1052.origin.x, v1052.origin.y, v1052.size.width, v1052.size.height);
    double v265 = 0.0;
  }
  double v271 = v245 - v922;
  v1052.origin.double x = v261;
  v1052.origin.double y = v262;
  v1052.size.CGFloat width = v263;
  v1052.size.CGFloat height = v264;
  int v272 = objc_msgSend((id)objc_msgSend(*(id *)(v16 + 16), "videoFormat"), "pixelFormat");
  int v978 = v75;
  double v1029 = v265;
  if (FigCapturePixelFormatIsTenBit(v272))
  {
    *(void *)&propertyValueOut.double a = 0x200000002;
    if (FigCapturePixelFormatIsTenBitPacked(v272))
    {
      *(void *)&propertyValueOut.double a = 0x200000006;
    }
    else if (FigCapturePixelFormatGetCompressionType(v272))
    {
      *(void *)&propertyValueOut.double a = FigCapturePixelFormatTileAlignment(v272);
    }
    FigCaptureSwapVideoDimensionsFor90Or270Rotation((int32x2_t *)&propertyValueOut, *(_DWORD *)(v16 + 104));
    int a_high = HIDWORD(propertyValueOut.a);
    int a_low = LODWORD(propertyValueOut.a);
    int v289 = v1059.i32[0];
    int v288 = v1059.i32[1];
    double v290 = psn_rectBoundedByRect(v1052.origin.x, v1052.origin.y, v1052.size.width, v1052.size.height, v271, r1b, v240, v241);
    double v292 = v291;
    CGFloat v293 = v240;
    CGFloat v294 = v241;
    double v296 = v295;
    double v1013 = v297;
    float v298 = v290 + 0.001;
    int v299 = FigCaptureFloorFloatToMultipleOf(a_low, v298);
    float v300 = v292 + 0.001;
    int v301 = FigCaptureFloorFloatToMultipleOf(a_high, v300);
    float v302 = v290 + v296 + -0.001;
    double v303 = (double)(int)FigCaptureCeilFloatToMultipleOf(a_low, v302);
    float v304 = v292 + v1013 + -0.001;
    double v305 = (double)(int)FigCaptureCeilFloatToMultipleOf(a_high, v304);
    v1106.origin.double x = v245 - v922;
    v1106.origin.double y = r1b;
    v1106.size.CGFloat width = v293;
    v1106.size.CGFloat height = v294;
    double v959 = CGRectGetMinX(v1106);
    double v1014 = (double)a_low;
    v1107.origin.double x = v245 - v922;
    v1107.origin.double y = r1b;
    v1107.size.CGFloat width = v293;
    CGFloat v306 = v294;
    v1107.size.CGFloat height = v294;
    double v307 = CGRectGetMinY(v1107);
    double v308 = (double)v289;
    BOOL v221 = v303 <= (double)v289;
    char v86 = v1019;
    float v112 = (void *)v1032;
    float v113 = &OBJC_IVAR___FigCaptureCMSession__cmsession;
    if (v221)
    {
      v1108.origin.double x = v271;
      v1108.origin.double y = r1b;
      v1108.size.CGFloat width = v293;
      v1108.size.CGFloat height = v306;
      if (CGRectGetMaxX(v1108) >= v303) {
        double v308 = v303;
      }
      else {
        double v308 = v303 - v1014;
      }
    }
    double v309 = (double)v288;
    BOOL v221 = v305 <= (double)v288;
    int v75 = v978;
    if (v221)
    {
      v1109.origin.double x = v271;
      v1109.origin.double y = r1b;
      v1109.size.CGFloat width = v293;
      v1109.size.CGFloat height = v306;
      if (CGRectGetMaxY(v1109) >= v305) {
        double v309 = v305;
      }
      else {
        double v309 = v305 - (double)a_high;
      }
    }
    double v310 = -0.0;
    if (v307 <= (double)v301) {
      double v311 = -0.0;
    }
    else {
      double v311 = (double)a_high;
    }
    double v312 = v311 + (double)v301;
    if (v959 > (double)v299) {
      double v310 = v1014;
    }
    double v281 = v308 - (v310 + (double)v299);
    double v903 = v310 + (double)v299;
    CGFloat v906 = v312;
    v1052.origin.double x = v903;
    v1052.origin.double y = v312;
    double v283 = v309 - v312;
    v1052.size.CGFloat width = v281;
    v1052.size.CGFloat height = v309 - v312;
    v249 = ImageBuffer;
    float v52 = (void *)v1002;
    float v285 = v982;
    double v144 = v987;
  }
  else
  {
    v1052.origin.double x = psn_smallestBoundingRectAlignedToMultipleOf(2, v1052.origin.x, v1052.origin.y, v1052.size.width, v1052.size.height);
    v1052.origin.double y = v273;
    v1052.size.CGFloat width = v274;
    v1052.size.CGFloat height = v275;
    double v279 = psn_conformRectForMSR420vfBoundedByRect(1, v1052.origin.x, v273, v274, v275, v271, r1b, v240, v241);
    double v281 = v280;
    double v283 = v282;
    double v903 = v279;
    CGFloat v906 = v284;
    v1052.origin.double x = v279;
    v1052.origin.double y = v284;
    v1052.size.CGFloat width = v280;
    v1052.size.CGFloat height = v282;
    float v285 = v234;
  }
  double v313 = v916 * v144;
  double v314 = v918 * v144;
  BOOL v23 = v916 == x;
  double keya = v918 * v144;
  double v917 = v916 * v144;
  CGFloat v868 = v281;
  CGFloat v910 = v283;
  if (!v23 || (double v315 = v283, v316 = v281, v317 = y, v318 = x, v918 != y))
  {
    double v319 = v281 / (rect1.size.width + rect1.size.width) + v283 / (rect1.size.height + rect1.size.height);
    CGFloat v320 = recta.origin.x;
    CGFloat v321 = recta.origin.y;
    CGFloat v322 = recta.size.width;
    CGFloat v323 = recta.size.height;
    *(CGPoint *)&propertyValueOut.double a = rect2;
    double v324 = v314;
    double v325 = v313;
    if (!*(unsigned char *)(v16 + 1040))
    {
      double v324 = v314;
      double v325 = v313;
      if (*(unsigned char *)(v16 + 1512))
      {
        CVPixelBufferGetWidth(v86);
        CVPixelBufferGetHeight(v86);
        FigCaptureMetadataUtilitiesNormalizeCropRect(rect1.origin.x, rect1.origin.y, rect1.size.width, rect1.size.height);
        double v327 = v326;
        double v330 = (1.0 - v329) * 0.5;
        double v325 = v917 - (v331 - (1.0 - v328) * 0.5) * (double)CVPixelBufferGetWidth(v86);
        double v332 = v327 - v330;
        float v285 = v982;
        double v324 = keya - v332 * (double)CVPixelBufferGetHeight(v86);
        double v281 = v868;
      }
    }
    float v333 = v319;
    -[BWPreviewStitcherNode _getInputRect:outputRect:inputShiftAppliedInOutputRect:toTransferPixelBuffer:rect:intoPixelBufferDimensions:rect:withInputShift:shiftOutsideBoundingRectAllowed:scale:forFinalOutput:](v16, &rect1.origin.x, &v1052.origin.x, &propertyValueOut.a, v86, *(void *)&v1059, 0, 0, v320, v321, v322, v323, v903, v906, v281, v910, v325, v324, v333);
    double v318 = propertyValueOut.a / v987;
    double v316 = v1052.size.width;
    double v315 = v1052.size.height;
    double v317 = propertyValueOut.b / v987;
  }
  int v334 = *(unsigned __int8 *)(v16 + 1040);
  double v335 = v316 / rect1.size.width;
  if (*(unsigned char *)(v16 + 1040)) {
    double v336 = 4.0 / ((*(float *)(v16 + 208) / 100.0 + 1.0) * (float)(v285 / v939));
  }
  else {
    double v336 = 4.0;
  }
  double v896 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v897 = *MEMORY[0x1E4F1DB20];
  double v895 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v919 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  double v337 = v315 / rect1.size.height;
  double v864 = v317;
  double v865 = v318;
  if (v335 > v336 || v337 > v336)
  {
    double v1015 = v315 / rect1.size.height;
    CGFloat v339 = v1052.origin.x;
    CGFloat v340 = v1052.origin.y;
    double v341 = CGRectGetWidth(*(CGRect *)(&v316 - 2)) / v336;
    r1double c = v335;
    if (v962)
    {
      double v342 = CGRectGetHeight(v1052) / v336;
    }
    else
    {
      float v343 = v341;
      double v341 = (double)(int)FigCaptureCeilFloatToMultipleOf(2, v343);
      float v344 = CGRectGetHeight(v1052) / v336;
      double v342 = (double)(int)FigCaptureCeilFloatToMultipleOf(2, v344);
    }
    double v345 = rect1.origin.y;
    double v346 = rect1.size.width;
    double v347 = rect1.size.height;
    double v988 = rect1.origin.x;
    CGFloat v348 = CGRectGetMidX(rect1) - v341 * 0.5;
    CGFloat MidY = CGRectGetMidY(rect1);
    rect1.origin.double x = v348;
    rect1.origin.double y = MidY - v342 * 0.5;
    rect1.size.CGFloat width = v341;
    rect1.size.CGFloat height = v342;
    double v350 = psn_rectBoundedByRect(v348, rect1.origin.y, v341, v342, recta.origin.x, recta.origin.y, recta.size.width, recta.size.height);
    double v352 = v351;
    double v354 = v353;
    CGFloat v356 = v355;
    v1171.origin.double x = v350;
    v1171.origin.double y = v351;
    v1171.size.CGFloat width = v353;
    v1171.size.CGFloat height = v355;
    if (!CGRectEqualToRect(rect1, v1171) && !*(unsigned char *)(v16 + 1040))
    {
      rect1.origin.double x = v350;
      rect1.origin.double y = v352;
      rect1.size.CGFloat width = v354;
      rect1.size.CGFloat height = v356;
      double v357 = FigCaptureMetadataUtilitiesRectNormalizedToRect(v988, v345, v346, v347, v350, v352, v354);
      double v896 = v358;
      double v897 = v357;
      double v895 = v359;
      double v919 = v360;
    }
    if (!v962)
    {
      rect1.origin.double x = acpr_conformRectForMSR420vf(rect1.origin.x, rect1.origin.y, rect1.size.width, rect1.size.height);
      rect1.origin.double y = v361;
      rect1.size.CGFloat width = v362;
      rect1.size.CGFloat height = v363;
    }
    double v337 = (r1c + v1015) * 0.5;
    double v338 = v337 / v336;
    int v334 = *(unsigned __int8 *)(v16 + 1040);
    float v285 = v982;
  }
  else
  {
    double v338 = 1.0;
  }
  int v364 = 0;
  v365 = &OBJC_IVAR___FigCaptureCMSession__cmsession;
  double v931 = v338;
  if (!v75)
  {
    if (v334)
    {
      LODWORD(v337) = LODWORD(v1047.origin.x);
      if (*(float *)&v1047.origin.x > v285)
      {
        if ((objc_msgSend(*(id *)(v16 + 864), "isRamping", v337) & 1) == 0
          && *(unsigned __int8 *)(v16 + 818) == [(id)v16 displaysWidestCameraOnly])
        {
          r1double d = FigCaptureMetadataUtilitiesRectNormalizedToRect(0.0, 0.0, (double)v1059.i32[0], (double)v1059.i32[1], v1052.origin.x, v1052.origin.y, v1052.size.width);
          CGFloat v367 = v366;
          double v369 = v368;
          double v1016 = v370;
          if (*(unsigned char *)(v16 + 246))
          {
            double v371 = recta.origin.x;
            double v372 = recta.origin.y;
            double v373 = recta.size.width;
            double v374 = recta.size.height;
          }
          else
          {
            double v371 = psn_pixelBufferRect(v86);
            double v372 = v378;
            double v373 = v379;
            double v374 = v380;
          }
          double v381 = FigCaptureMetadataUtilitiesScaleRect2D(rect1.origin.x, rect1.origin.y, rect1.size.width, rect1.size.height, 1.0 / v338);
          double v385 = v382;
          if (!v962)
          {
            double v381 = acpr_conformRectForMSR420vf(v381, v382, v383, v384);
            double v385 = v386;
          }
          double v989 = v381;
          double v387 = v381;
          double v960 = v385;
          double v946 = v383;
          double v388 = v383;
          if (v338 <= 1.0)
          {
            double v387 = rect1.origin.x;
            double v385 = rect1.origin.y;
            double v388 = rect1.size.width;
          }
          v1110.origin.double x = FigCaptureMetadataUtilitiesRectNormalizedToRect(v371, v372, v373, v374, v387, v385, v388);
          CGFloat v389 = v1110.origin.x;
          CGFloat v390 = v1110.origin.y;
          CGFloat v391 = v1110.size.width;
          CGFloat v392 = v1110.size.height;
          v1172.origin.double x = r1d;
          v1172.origin.double y = v367;
          v1172.size.CGFloat width = v369;
          v1172.size.CGFloat height = v1016;
          BOOL v393 = CGRectContainsRect(v1110, v1172);
          BOOL v394 = v393;
          if (v886)
          {
            v1111.origin.double x = r1d;
            v1111.origin.double y = v367;
            v1111.size.CGFloat width = v369;
            v1111.size.CGFloat height = v1016;
            v1173.origin.double x = v389;
            v1173.origin.double y = v390;
            v1173.size.CGFloat width = v391;
            v1173.size.CGFloat height = v392;
            CGRect v1112 = CGRectIntersection(v1111, v1173);
            float v395 = v1112.size.width * v1112.size.height / (v369 * v1016);
            if (!v394)
            {
              if (v395 >= 0.99)
              {
                float v398 = v395 * 0.95;
                float v395 = v398;
              }
              BWSmartCameraSceneUpdateWithConfidence(v16 + 1520, v395);
              goto LABEL_334;
            }
            BWSmartCameraSceneUpdateWithConfidence(v16 + 1520, v395);
            if (!*(unsigned char *)(v16 + 1521))
            {
LABEL_334:
              int v364 = 0;
              float v52 = (void *)v1002;
              goto LABEL_335;
            }
          }
          else if (!v393)
          {
            goto LABEL_334;
          }
          v396 = *(void **)(v16 + 216);
          float v52 = (void *)v1002;
          v365 = &OBJC_IVAR___FigCaptureCMSession__cmsession;
          if (!v396 || (LODWORD(v337) = *(_DWORD *)(v16 + 224), *(float *)&v337 != 1.0))
          {
            int v364 = 1;
            double v338 = v931;
LABEL_337:
            float v285 = v982;
            if (v112) {
              goto LABEL_338;
            }
            goto LABEL_310;
          }
          objc_msgSend((id)objc_msgSend(v396, "firstObject"), "floatValue");
          float v397 = *(float *)&v337;
          if ((float)(*(float *)&v337 / *(float *)(v16 + 160)) < 2.0)
          {
            fig_log_get_emitter();
            uint64_t v855 = v11;
            LODWORD(v852) = 0;
            FigDebugAssert3();
          }
          if (*(float *)(v16 + 824) >= v397
            || (LODWORD(v337) = LODWORD(v1047.origin.x), *(float *)&v1047.origin.x >= v397))
          {
            double v841 = psn_pixelBufferRect(v86);
            double v845 = FigCaptureMetadataUtilitiesScaleRect2D(v841, v842, v843, v844, (float)(1.0 / (float)(v397 / *(float *)(v16 + 160))));
            double v849 = v989;
            double v850 = v960;
            double v851 = v946;
            if (v931 <= 1.0)
            {
              double v849 = rect1.origin.x;
              double v850 = rect1.origin.y;
              double v851 = rect1.size.width;
            }
            v1168.origin.double x = FigCaptureMetadataUtilitiesRectNormalizedToRect(v845, v846, v847, v848, v849, v850, v851);
            v1200.origin.double x = r1d;
            v1200.origin.double y = v367;
            v1200.size.CGFloat width = v369;
            v1200.size.CGFloat height = v1016;
            int v364 = CGRectContainsRect(v1168, v1200);
          }
          else
          {
            int v364 = 1;
          }
LABEL_335:
          double v338 = v931;
          v365 = &OBJC_IVAR___FigCaptureCMSession__cmsession;
          goto LABEL_337;
        }
        int v364 = 0;
        v365 = &OBJC_IVAR___FigCaptureCMSession__cmsession;
      }
    }
  }
  if (v112)
  {
LABEL_338:
    if (!v112 || v53 == 1)
    {
      BOOL v375 = v364;
      goto LABEL_370;
    }
    BOOL v375 = v364;
    if (*(unsigned __int8 *)(v16 + 1169) == v364)
    {
      if (*(unsigned char *)(v16 + 1170) && (*(unsigned char *)(v16 + 1129) || *(unsigned char *)(v16 + 819))) {
        *(unsigned char *)(v16 + 1170) = 0;
      }
      goto LABEL_352;
    }
    if (v364)
    {
      char v399 = 0;
    }
    else
    {
      if (*(unsigned char *)(v16 + 1129))
      {
LABEL_351:
        *(unsigned char *)(v16 + 1169) = v364;
LABEL_352:
        float v400 = *(float *)(v16 + 824);
        int v401 = *(unsigned __int8 *)(v16 + 1171);
        if (*(unsigned char *)(v16 + 394) && *(unsigned char *)(v16 + 1389))
        {
          int v402 = objc_msgSend(v908, "isEqualToString:", *MEMORY[0x1E4F52DE8], v337);
          int v403 = *(_DWORD *)(v16 + 396);
          if (v403)
          {
            v404 = &OBJC_IVAR___BWPreviewStitcherNode__wideToTeleShiftCorrections;
            if (v402) {
              v404 = &OBJC_IVAR___BWPreviewStitcherNode__superWideToWideShiftCorrections;
            }
            LOBYTE(v403) = *(_DWORD *)(v16 + *v404 + 148) >= v403;
          }
        }
        else
        {
          LOBYTE(v403) = 1;
        }
        if (!v75 && v1052.size.height >= (double)v1059.i32[1])
        {
          char v405 = v879;
          if (!*(unsigned char *)(v16 + 1170)) {
            char v405 = 1;
          }
          if (v401 && (v405 & 1) == 0 && v400 != v878) {
            goto LABEL_369;
          }
          if (!*(unsigned char *)(v16 + 1389)) {
            LOBYTE(v403) = 1;
          }
          if ((v403 & 1) == 0)
          {
LABEL_369:
            BOOL v375 = 1;
            int v879 = 1;
          }
        }
        goto LABEL_370;
      }
      char v399 = 1;
    }
    *(unsigned char *)(v16 + 1170) = v399;
    goto LABEL_351;
  }
LABEL_310:
  if (!*(unsigned char *)(v16 + 1040)) {
    goto LABEL_338;
  }
  BOOL v375 = *(_DWORD *)(v16 + 1124) != 4;
  v376 = *(void **)(v16 + v365[963]);
  if (v376)
  {
    v377 = v365;

    *(void *)(v16 + v377[963]) = 0;
    *(unsigned char *)(v16 + 904) = 0;
  }
LABEL_370:
  double v406 = vaddvq_f64(vdivq_f64((float64x2_t)v1052.size, vaddq_f64((float64x2_t)rect1.size, (float64x2_t)rect1.size)));
  if (v75)
  {
    int v407 = v925;
    if (v1029 > 0.0) {
      double v406 = v1029 * (float)(*(float *)&v1047.origin.x / v285);
    }
  }
  else
  {
    int v407 = v925;
  }
  double v876 = v406;
  CGFloat v408 = *(double *)v169;
  CGFloat v409 = *(double *)(v169 + 8);
  CGFloat v410 = *(double *)(v169 + 24);
  double a = *(double *)v169;
  double b = v409;
  double c = *(double *)(v169 + 16);
  double d = v410;
  CGFloat v414 = v410;
  CGFloat r1e = c;
  CGFloat v1030 = v409;
  CGFloat v990 = *(double *)v169;
  CGFloat v961 = c;
  if (v249)
  {
    *(_OWORD *)&propertyValueOut.double a = *(_OWORD *)ymmword_1A5EFDD50;
    *(_OWORD *)&propertyValueOut.double c = *(_OWORD *)&ymmword_1A5EFDD50[16];
    CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[v1034 objectForKeyedSubscript:v927], (CGRect *)&propertyValueOut);
    CVPixelBufferGetWidth(v249);
    CVPixelBufferGetHeight(v249);
    FigCaptureMetadataUtilitiesDenormalizeCropRect(propertyValueOut.a, propertyValueOut.b, propertyValueOut.c, propertyValueOut.d);
    double a = v415;
    double b = v416;
    double c = v417;
    double d = v418;
    if ((v879 | v375))
    {
      CGFloat v414 = v410;
      CGFloat r1e = v961;
      CGFloat v1030 = v409;
      CGFloat v408 = v990;
      goto LABEL_480;
    }
    double v419 = v876 * (float)(v889 / v939);
    float v420 = *(float *)(v16 + 164) * *(float *)(v16 + 1488);
    float v869 = v420;
    if (*(unsigned char *)(v16 + 1040) && *(unsigned char *)(v16 + 1480))
    {
      objc_msgSend((id)objc_msgSend(*(id *)(v16 + 216), "firstObject"), "floatValue");
      BOOL v421 = 0;
      if (*(float *)&v1047.origin.x > v422 && *(float *)&v1047.origin.x < v420)
      {
        v1113.origin.double x = v903;
        v1113.origin.double y = v906;
        v1113.size.CGFloat width = v868;
        v1113.size.CGFloat height = v910;
        BOOL v421 = CGRectGetMaxX(v1113) < (double)v1059.i32[0];
      }
    }
    else
    {
      BOOL v421 = 0;
    }
    *(float *)&int v423 = v419;
    int v880 = v423;
    CGFloat v887 = v409;
    CGFloat rect2a = v410;
    if (v75)
    {
      double v424 = v955;
      float v425 = v878;
      if (v407) {
        double v424 = v955 + (float)((float)v407 / *(float *)&v423);
      }
      double v426 = (double)v1059.i32[0];
      if (v421)
      {
        double v424 = v424 + (v426 - (v1052.origin.x + v1052.size.width - v426 + v426 + 2.0)) * 0.5 / *(float *)&v423;
        double v426 = v1052.origin.x + v1052.size.width - v426 + v426 + 2.0;
      }
      int v427 = v1059.i32[1];
      if (*(unsigned char *)(v16 + 1560)
        && *(float *)(v16 + 240) > 1.0
        && [v908 isEqualToString:*MEMORY[0x1E4F52DE8]])
      {
        double v428 = FigCaptureMetadataUtilitiesNormalizedSensorCenterOffsetInValidBufferRect(v112);
        double v430 = v429;
        int v431 = CVPixelBufferGetWidth(v249);
        CVPixelBufferGetHeight(v249);
        double v432 = v428;
        float v425 = v878;
        double v424 = v424 - FigCaptureMetadataUtilitiesDenormalizePoint(v432, v430, (double)v431);
        double v434 = v953 - v433;
      }
      else
      {
        double v434 = v953;
      }
      double v435 = psn_pixelBufferRect(v249);
      double v442 = psn_wideBoundingRect(*(unsigned __int8 *)(v16 + 204), v435, v436, v437, v438, v425 / *(float *)(v16 + 240), *(float *)&v1047.origin.x, v996, v877);
      double v947 = v443;
      double v933 = v445;
      double v1018 = v442;
      double v871 = v444;
      if (*(unsigned char *)(v16 + 1005) && *(float *)(v16 + 240) > 1.0 && (float)(*(float *)&v1047.origin.x / v982) < 1.0)
      {
        v1047.size = (CGSize)v894;
        CGSize v1048 = v893;
        rhs.origin = v894;
        rhs.size = v893;
        -[BWPreviewStitcherNode _getInputRect:outputRect:inputShiftAppliedInOutputRect:toTransferPixelBuffer:rect:intoPixelBufferDimensions:rect:withInputShift:shiftOutsideBoundingRectAllowed:scale:forFinalOutput:](v16, &v1047.size.width, &rhs.origin.x, 0, v249, *(void *)&v1059, 1, 1, v442, v443, v444, v445, 0.0, 0.0, v426, (double)v427, v424, v434, *(float *)&v423);
        long long v446 = *(_OWORD *)(v16 + 344);
        *(_OWORD *)&propertyValueOut.double a = *(_OWORD *)(v16 + 328);
        *(_OWORD *)&propertyValueOut.double c = v446;
        *(_OWORD *)&propertyValueOut.tdouble x = *(_OWORD *)(v16 + 360);
        CGRect v1114 = CGRectApplyAffineTransform(rhs, &propertyValueOut);
        CGRect rhs = v1114;
        double v447 = FigCaptureMetadataUtilitiesScaleRect2D(v1114.origin.x, v1114.origin.y, v1114.size.width, v1114.size.height, 1.0 / (float)(*(float *)&v1047.origin.x / v982));
        CGFloat v449 = v448;
        CGFloat v451 = v450;
        CGFloat v453 = v452;
        -[BWPreviewStitcherNode _compensateForMissingFOVUsingPixelBuffer:sourceRect:destinationContainingRect:destinationInsetRect:outputPixelBuffer:](v16, v249, *(__CVBuffer **)&v1047.origin.y, v454, v455, v456, v457, v458, v1047.size.width, v1047.size.height, v1048.width, v1048.height, v447, v448, v452, v450, *(uint64_t *)&rhs.origin.x, *(uint64_t *)&rhs.origin.y, *(uint64_t *)&rhs.size.width,
          *(uint64_t *)&rhs.size.height);
        v1115.origin.double x = v990;
        v1115.origin.double y = v887;
        v1115.size.CGFloat width = v961;
        CGFloat v410 = rect2a;
        v1115.size.CGFloat height = rect2a;
        v1174.origin.double x = v990;
        v1174.origin.double y = v887;
        v1174.size.CGFloat width = v961;
        v1174.size.CGFloat height = rect2a;
        int v75 = v978;
        if (CGRectEqualToRect(v1115, v1174))
        {
          CGFloat v1021 = v447;
          CGFloat v1030 = v449;
          double v459 = v931;
          CGFloat v414 = v451;
          CGFloat r1e = v453;
        }
        else
        {
          v1125.origin.double x = v447;
          v1125.origin.double y = v449;
          v1125.size.CGFloat width = v453;
          v1125.size.CGFloat height = v451;
          v1181.origin.double x = v990;
          v1181.origin.double y = v887;
          v1181.size.CGFloat width = v961;
          v1181.size.CGFloat height = rect2a;
          CGRect v1126 = CGRectUnion(v1125, v1181);
          CGFloat v1021 = v1126.origin.x;
          CGFloat v1030 = v1126.origin.y;
          CGFloat r1e = v1126.size.width;
          CGFloat v414 = v1126.size.height;
          double v459 = v931;
        }
        CGFloat v409 = v887;
        double b = v1047.size.height;
        double d = v1048.height;
        double c = v1048.width;
        double v521 = v1018;
        double v491 = v1047.size.width - v1018;
        if (v1047.size.width - v1018 >= v1047.size.height - v947) {
          double v491 = v1047.size.height - v947;
        }
        double a = v1047.size.width;
        if (v491 >= v521 + v871 - (v1047.size.width + v1048.width)) {
          double v491 = v521 + v871 - (v1047.size.width + v1048.width);
        }
        double v492 = v947 + v933;
      }
      else
      {
        propertyValueOut.double a = v442;
        propertyValueOut.double b = v443;
        propertyValueOut.double c = v444;
        propertyValueOut.double d = v445;
        -[BWPreviewStitcherNode _transferPixelBuffer:rect:intoPixelBuffer:rect:isFinalOutput:withInputShift:scale:inputSourceRectOut:](v16, v249, *(CVPixelBufferRef *)&v1047.origin.y, 1, &propertyValueOut, v439, v440, v441, v442, v443, v444, v445, 0.0, 0.0, v426, (double)v427, *(uint64_t *)&v424, *(uint64_t *)&v434, v423);
        CGFloat v461 = v460;
        CGFloat v463 = v462;
        CGFloat v465 = v464;
        CGFloat v467 = v466;
        v1116.origin.double x = v990;
        v1116.origin.double y = v887;
        v1116.size.CGFloat width = v961;
        CGFloat v410 = rect2a;
        v1116.size.CGFloat height = rect2a;
        v1175.origin.double x = v990;
        v1175.origin.double y = v887;
        v1175.size.CGFloat width = v961;
        v1175.size.CGFloat height = rect2a;
        int v75 = v978;
        if (CGRectEqualToRect(v1116, v1175))
        {
          CGFloat v1021 = v461;
          CGFloat v1030 = v463;
          double v459 = v931;
          CGFloat v414 = v467;
          CGFloat r1e = v465;
        }
        else
        {
          v1118.origin.double x = v461;
          v1118.origin.double y = v463;
          v1118.size.CGFloat width = v465;
          v1118.size.CGFloat height = v467;
          v1177.origin.double x = v990;
          v1177.origin.double y = v887;
          v1177.size.CGFloat width = v961;
          v1177.size.CGFloat height = rect2a;
          CGRect v1119 = CGRectUnion(v1118, v1177);
          CGFloat v1021 = v1119.origin.x;
          CGFloat v1030 = v1119.origin.y;
          CGFloat r1e = v1119.size.width;
          CGFloat v414 = v1119.size.height;
          double v459 = v931;
        }
        CGFloat v409 = v887;
        double b = propertyValueOut.b;
        double c = propertyValueOut.c;
        double d = propertyValueOut.d;
        double v490 = v1018;
        double v491 = propertyValueOut.a - v1018;
        if (propertyValueOut.a - v1018 >= propertyValueOut.b - v947) {
          double v491 = propertyValueOut.b - v947;
        }
        double a = propertyValueOut.a;
        if (v491 >= v490 + v871 - (propertyValueOut.a + propertyValueOut.c)) {
          double v491 = v490 + v871 - (propertyValueOut.a + propertyValueOut.c);
        }
        double v492 = v947 + v933;
      }
      double v522 = v492 - (b + d);
      if (v491 >= v522) {
        double v491 = v522;
      }
      float v523 = v491;
      if (v523 >= 0.0) {
        float v520 = v523;
      }
      else {
        float v520 = 0.0;
      }
    }
    else
    {
      double v934 = d;
      double v983 = c;
      double v948 = b;
      double v468 = psn_pixelBufferRect(v249);
      propertyValueOut.double a = psn_wideBoundingRect(*(unsigned __int8 *)(v16 + 204), v468, v469, v470, v471, v878, *(float *)&v1047.origin.x, v996, v877);
      propertyValueOut.double b = v472;
      propertyValueOut.double c = v473;
      propertyValueOut.double d = v474;
      CGFloat v475 = (double)v1059.i32[0] * 0.5 + v922 + 2.0;
      double v860 = *(float *)&v423;
      *(float *)&int v856 = v419;
      *(double *)&uint64_t v853 = v1020.f64[0] + v475 * 0.5 / *(float *)&v423 - 2.0 / *(float *)&v423;
      double v872 = propertyValueOut.a;
      double v1031 = v472;
      double v862 = v473;
      v1020.f64[0] = v474;
      -[BWPreviewStitcherNode _transferPixelBuffer:rect:intoPixelBuffer:rect:isFinalOutput:withInputShift:scale:inputSourceRectOut:](v16, v249, *(CVPixelBufferRef *)&v1047.origin.y, 1, &propertyValueOut, v476, v477, v478, propertyValueOut.a, v472, v473, v474, 0.0, 0.0, v475, (double)v1059.i32[1], v853, *(uint64_t *)&v1020.f64[1], v856);
      CGFloat v480 = v479;
      CGFloat v482 = v481;
      CGFloat v484 = v483;
      CGFloat v486 = v485;
      v1117.origin.double x = v990;
      v1117.origin.double y = v409;
      v1117.size.CGFloat width = v961;
      v1117.size.CGFloat height = v410;
      v1176.origin.double x = v990;
      v1176.origin.double y = v409;
      v1176.size.CGFloat width = v961;
      v1176.size.CGFloat height = v410;
      if (CGRectEqualToRect(v1117, v1176))
      {
        CGFloat v858 = v480;
        CGFloat v487 = v486;
        CGFloat v488 = v484;
        CGFloat v489 = v482;
      }
      else
      {
        v1120.origin.double x = v480;
        v1120.origin.double y = v482;
        v1120.size.CGFloat width = v484;
        v1120.size.CGFloat height = v486;
        v1178.origin.double x = v990;
        v1178.origin.double y = v409;
        v1178.size.CGFloat width = v961;
        v1178.size.CGFloat height = v410;
        CGRect v1121 = CGRectUnion(v1120, v1178);
        CGFloat v858 = v1121.origin.x;
        CGFloat v489 = v1121.origin.y;
        CGFloat v488 = v1121.size.width;
        CGFloat v487 = v1121.size.height;
      }
      double v493 = propertyValueOut.a - v872;
      if (propertyValueOut.a - v872 >= propertyValueOut.b - v1031) {
        double v493 = propertyValueOut.b - v1031;
      }
      double v494 = v872 + v862 - (propertyValueOut.a + propertyValueOut.c);
      if (v493 < v494) {
        double v494 = v493;
      }
      if (v494 >= v1031 + v1020.f64[0] - (propertyValueOut.b + propertyValueOut.d)) {
        double v494 = v1031 + v1020.f64[0] - (propertyValueOut.b + propertyValueOut.d);
      }
      float v495 = v494;
      if (v495 < 0.0) {
        float v495 = 0.0;
      }
      float v857 = v495;
      double v496 = psn_pixelBufferRect(v249);
      double v503 = psn_wideBoundingRect(*(unsigned __int8 *)(v16 + 204), v496, v497, v498, v499, v878, *(float *)&v1047.origin.x, v996, v877);
      propertyValueOut.double a = v503;
      propertyValueOut.double b = v504;
      propertyValueOut.double c = v505;
      propertyValueOut.double d = v506;
      double v507 = (double)v1059.i32[0] * 0.5 + v922;
      double v508 = (double)v1059.i32[0] - v507;
      CGFloat v509 = v488;
      if (v421) {
        double v508 = v508 + v1052.origin.x + v1052.size.width - (double)v1059.i32[0] + 2.0;
      }
      *(double *)&uint64_t v854 = r2.f64[0] + v508 * -0.5 / v860;
      double v859 = v505;
      double v861 = v503;
      double v873 = v504;
      double v863 = v506;
      -[BWPreviewStitcherNode _transferPixelBuffer:rect:intoPixelBuffer:rect:isFinalOutput:withInputShift:scale:inputSourceRectOut:](v16, v249, *(CVPixelBufferRef *)&v1047.origin.y, 1, &propertyValueOut, v500, v501, v502, v503, v504, v505, v506, v507, 0.0, v508, (double)v1059.i32[1], v854, *(uint64_t *)&r2.f64[1], v880);
      CGFloat v511 = v510;
      CGFloat v513 = v512;
      CGFloat r1e = v514;
      CGFloat v516 = v515;
      v1122.origin.double x = v858;
      v1122.origin.double y = v489;
      v1122.size.CGFloat width = v509;
      v1122.size.CGFloat height = v487;
      v1179.origin.double x = v990;
      v1179.origin.double y = v887;
      v1179.size.CGFloat width = v961;
      v1179.size.CGFloat height = v410;
      if (CGRectEqualToRect(v1122, v1179))
      {
        CGFloat v414 = v516;
        CGFloat v1021 = v511;
        CGFloat v1030 = v513;
      }
      else
      {
        v1123.origin.double x = v511;
        v1123.origin.double y = v513;
        v1123.size.CGFloat width = r1e;
        v1123.size.CGFloat height = v516;
        v1180.origin.double x = v858;
        v1180.origin.double y = v489;
        v1180.size.CGFloat width = v509;
        v1180.size.CGFloat height = v487;
        CGRect v1124 = CGRectUnion(v1123, v1180);
        CGFloat v1021 = v1124.origin.x;
        CGFloat v1030 = v1124.origin.y;
        CGFloat r1e = v1124.size.width;
        CGFloat v414 = v1124.size.height;
      }
      double v459 = v931;
      double c = v983;
      double v517 = propertyValueOut.a - v861;
      if (propertyValueOut.a - v861 >= propertyValueOut.b - v873) {
        double v517 = propertyValueOut.b - v873;
      }
      double v518 = v861 + v859 - (propertyValueOut.a + propertyValueOut.c);
      if (v517 < v518) {
        double v518 = v517;
      }
      if (v518 >= v873 + v863 - (propertyValueOut.b + propertyValueOut.d)) {
        double v518 = v873 + v863 - (propertyValueOut.b + propertyValueOut.d);
      }
      float v519 = v518;
      if (v519 < 0.0) {
        float v519 = 0.0;
      }
      if (v857 >= v519) {
        float v520 = v519;
      }
      else {
        float v520 = v857;
      }
      double b = v948;
      double d = v934;
      CGFloat v409 = v887;
    }
    CGFloat v408 = v1021;
    double v338 = v459;
    if (!v421)
    {
      float v52 = (void *)v1002;
      int v407 = v925;
LABEL_479:
      BWSmartCameraSceneUpdateWithConfidence(v16 + 1176, v520 * *(float *)&v880);
      goto LABEL_480;
    }
    double v949 = b;
    if (v75) {
      double v524 = v955;
    }
    else {
      double v524 = r2.f64[0];
    }
    if (v75) {
      double v525 = v953;
    }
    else {
      double v525 = r2.f64[1];
    }
    double v526 = v1052.origin.x;
    double v527 = v1052.size.width;
    int v528 = v1059.i32[1];
    double v935 = d;
    float v874 = v520;
    if (v459 > 1.0) {
      double v526 = FigCaptureMetadataUtilitiesScaleRect2D(v1052.origin.x, v1052.origin.y, v1052.size.width, v1052.size.height, 1.0 / v459);
    }
    double v529 = v526 + v527;
    double v530 = (double)v1059.i32[0] - (v526 + v527);
    double v531 = (double)v528;
    double v532 = psn_pixelBufferRect(v249);
    double v536 = psn_wideBoundingRect(*(unsigned __int8 *)(v16 + 204), v532, v533, v534, v535, v878, *(float *)&v1047.origin.x, v996, v877);
    v1047.size.CGFloat width = v536;
    v1047.size.CGFloat height = v537;
    v1048.CGFloat width = v538;
    v1048.CGFloat height = v539;
    if (v925)
    {
      float v540 = *(float *)&v880;
      double v524 = v524 + (float)((float)v925 / *(float *)&v880);
      float v52 = (void *)v1002;
    }
    else
    {
      float v52 = (void *)v1002;
      float v540 = *(float *)&v880;
    }
    double v541 = v540;
    -[BWPreviewStitcherNode _getInputRect:outputRect:inputShiftAppliedInOutputRect:toTransferPixelBuffer:rect:intoPixelBufferDimensions:rect:withInputShift:shiftOutsideBoundingRectAllowed:scale:forFinalOutput:](v16, &v1047.size.width, 0, 0, v249, *(void *)&v1059, 1, 1, v536, v537, v538, v539, v529, 0.0, v530, (double)v528, v524 + v529 * -0.5 / v540, v525, v540);
    float v542 = v530 / (v1048.width * v541);
    float v543 = *(float *)(v16 + 164);
    if (*(float *)&v1047.origin.x >= v543)
    {
      float v548 = *(float *)&v1047.origin.x;
      if (v869 < *(float *)&v1047.origin.x) {
        float v548 = v869;
      }
      if (v548 < v543) {
        float v548 = *(float *)(v16 + 164);
      }
      float v547 = *(float *)(v16 + 1484)
           + (float)((float)(1.0 - *(float *)(v16 + 1484)) * (float)((float)(v548 - v543) / (float)(v869 - v543)));
      if (v547 <= v542) {
        goto LABEL_472;
      }
    }
    else
    {
      objc_msgSend((id)objc_msgSend(*(id *)(v16 + 216), "firstObject"), "floatValue");
      float v545 = *(float *)(v16 + 164);
      float v546 = *(float *)&v1047.origin.x;
      if (v545 < *(float *)&v1047.origin.x) {
        float v546 = *(float *)(v16 + 164);
      }
      if (v546 < v544) {
        float v546 = v544;
      }
      float v547 = (float)((float)(*(float *)(v16 + 1484) + -1.0) * (float)((float)(v546 - v544) / (float)(v545 - v544)))
           + 1.0;
      if (v547 <= v542)
      {
        float v550 = v1048.width * v541 * v547;
        double v530 = (double)(int)FigCaptureRoundFloatToMultipleOf(2, v550);
LABEL_472:
        int v407 = v925;
        psn_conformRectForMSR420vfBoundedByDimensions(v529, 0.0, v530, v531, *(void *)&v1059, 1);
        long long v551 = *(_OWORD *)(v16 + 344);
        *(_OWORD *)&propertyValueOut.double a = *(_OWORD *)(v16 + 328);
        *(_OWORD *)&propertyValueOut.double c = v551;
        *(_OWORD *)&propertyValueOut.tdouble x = *(_OWORD *)(v16 + 360);
        CGRect v1128 = CGRectApplyAffineTransform(v1127, &propertyValueOut);
        if (v1128.size.width <= 0.0 || (CGFloat v552 = v1128.size.height, v1128.size.height <= 0.0))
        {
          CGFloat v552 = v414;
          CGFloat v555 = r1e;
        }
        else
        {
          CGFloat v553 = v1128.origin.x;
          CGFloat v554 = v1128.origin.y;
          CGFloat v555 = v1128.size.width;
          VTPixelRotationSessionRotateSubImage();
          v1129.origin.double x = v1021;
          v1129.origin.double y = v1030;
          v1129.size.CGFloat width = r1e;
          v1129.size.CGFloat height = v414;
          v1182.origin.double x = v990;
          v1182.origin.double y = v887;
          v1182.size.CGFloat width = v961;
          v1182.size.CGFloat height = rect2a;
          if (CGRectEqualToRect(v1129, v1182))
          {
            CGFloat v1030 = v554;
            CGFloat v1021 = v553;
          }
          else
          {
            v1130.origin.double x = v553;
            v1130.origin.double y = v554;
            v1130.size.CGFloat width = v555;
            v1130.size.CGFloat height = v552;
            v1183.origin.double x = v1021;
            v1183.origin.double y = v1030;
            v1183.size.CGFloat width = r1e;
            v1183.size.CGFloat height = v414;
            CGRect v1131 = CGRectUnion(v1130, v1183);
            CGFloat v1021 = v1131.origin.x;
            CGFloat v1030 = v1131.origin.y;
            CGFloat v555 = v1131.size.width;
            CGFloat v552 = v1131.size.height;
          }
        }
        CGFloat v409 = v887;
        CGFloat v414 = v552;
        CGFloat r1e = v555;
        double b = v949;
        double v338 = v931;
        double d = v935;
        CGFloat v410 = rect2a;
        CGFloat v408 = v1021;
        float v520 = v874;
        goto LABEL_479;
      }
    }
    float v549 = v530 / (float)(v547 * *(float *)&v880);
    v1048.CGFloat width = (double)(int)FigCaptureRoundFloatToMultipleOf(2, v549);
    goto LABEL_472;
  }
LABEL_480:
  BOOL v867 = v375;
  if (!v75)
  {
    CGFloat v950 = b;
    CGFloat v984 = c;
    CGFloat v888 = v409;
    rect2double b = v410;
    CGFloat r2a = v414;
    if (v375)
    {
      CGFloat v561 = v408;
      double v936 = d;
      CGFloat v562 = recta.origin.x;
      CGFloat v563 = recta.origin.y;
      CGFloat v564 = recta.size.width;
      CGFloat v565 = recta.size.height;
      propertyValueOut.double a = recta.origin.x;
      propertyValueOut.double b = recta.origin.y;
      *(CGSize *)&propertyValueOut.double c = recta.size;
      double v566 = v917;
      if (v407) {
        double v566 = v917 + v922 / v876;
      }
      double v567 = (double)v1059.i32[0];
      double v568 = (double)v1059.i32[1];
      v559 = (opaqueCMSampleBuffer *)v112;
      if (*(unsigned char *)(v16 + 1560))
      {
        unint64_t v560 = 0x1E4F28000;
        if (*(float *)(v16 + 240) > 1.0 && [v52 isEqualToString:*MEMORY[0x1E4F52DE8]])
        {
          double v997 = FigCaptureMetadataUtilitiesNormalizedSensorCenterOffsetInValidBufferRect(v1033);
          double v973 = v569;
          int v570 = CVPixelBufferGetWidth(v86);
          CVPixelBufferGetHeight(v86);
          double v566 = v566 - FigCaptureMetadataUtilitiesDenormalizePoint(v997, v973, (double)v570);
          double v572 = keya - v571;
        }
        else
        {
          double v572 = keya;
        }
      }
      else
      {
        double v572 = keya;
        unint64_t v560 = 0x1E4F28000;
      }
      *(float *)&int v580 = v876;
      -[BWPreviewStitcherNode _transferPixelBuffer:rect:intoPixelBuffer:rect:isFinalOutput:withInputShift:scale:inputSourceRectOut:](v16, v86, *(CVPixelBufferRef *)&v1047.origin.y, 1, &propertyValueOut, v276, v277, v278, v562, v563, v564, v565, 0.0, 0.0, v567, v568, *(uint64_t *)&v566, *(uint64_t *)&v572, v580);
      CGFloat v408 = v581;
      CGFloat v583 = v582;
      CGFloat v585 = v584;
      CGFloat v587 = v586;
      v1132.origin.double x = v561;
      v1132.origin.double y = v1030;
      v1132.size.CGFloat width = r1e;
      v1132.size.CGFloat height = r2a;
      v1184.origin.double x = v990;
      v1184.origin.double y = v888;
      v1184.size.CGFloat width = v961;
      v1184.size.CGFloat height = rect2b;
      if (!CGRectEqualToRect(v1132, v1184))
      {
        v1133.origin.double x = v408;
        v1133.origin.double y = v583;
        v1133.size.CGFloat width = v585;
        v1133.size.CGFloat height = v587;
        v1185.origin.double x = v561;
        v1185.origin.double y = v1030;
        v1185.size.CGFloat width = r1e;
        v1185.size.CGFloat height = r2a;
        CGRect v1134 = CGRectUnion(v1133, v1185);
        CGFloat v408 = v1134.origin.x;
        CGFloat v583 = v1134.origin.y;
        CGFloat v585 = v1134.size.width;
        CGFloat v587 = v1134.size.height;
      }
      double c = v984;
      v556 = 0;
      v557 = 0;
      v558 = 0;
      rect1.origin = *(CGPoint *)&propertyValueOut.a;
      rect1.size = *(CGSize *)&propertyValueOut.c;
      CGFloat v414 = v587;
      CGFloat r1e = v585;
      CGFloat v1030 = v583;
      double b = v950;
      double v338 = v931;
      double d = v936;
      CGFloat v410 = rect2b;
      CGFloat v409 = v888;
      goto LABEL_592;
    }
    CGFloat v1022 = v408;
    if (*(unsigned char *)(v16 + 1440) && *(unsigned char *)(v16 + 904))
    {
      int v573 = 1;
    }
    else
    {
      int v573 = 0;
      double v903 = v1052.origin.x;
      CGFloat v906 = v1052.origin.y;
      CGFloat v868 = v1052.size.width;
      CGFloat v910 = v1052.size.height;
    }
    uint64_t v574 = v890;
    double v575 = 1.0 / v338;
    double v576 = FigCaptureMetadataUtilitiesScaleRect2D(rect1.origin.x, rect1.origin.y, rect1.size.width, rect1.size.height, 1.0 / v338);
    if (v962)
    {
      double v891 = v579;
      double v923 = v578;
    }
    else
    {
      double v576 = acpr_conformRectForMSR420vf(v576, v577, v578, v579);
      double v923 = v588;
      double v891 = v589;
    }
    double v926 = v576;
    double v963 = v577;
    if (!*(unsigned char *)(v16 + 1040)) {
      goto LABEL_504;
    }
    if (v338 <= 1.0) {
      goto LABEL_504;
    }
    double v590 = FigCaptureMetadataUtilitiesRectNormalizedToRect(0.0, 0.0, (double)v1059.i32[0], (double)v1059.i32[1], v1052.origin.x, v1052.origin.y, v1052.size.width);
    CGFloat v592 = v591;
    double v593 = d;
    CGFloat v595 = v594;
    CGFloat v597 = v596;
    v1135.origin.double x = FigCaptureMetadataUtilitiesRectNormalizedToRect(rect1.origin.x, rect1.origin.y, rect1.size.width, rect1.size.height, v926, v963, v923);
    v1186.origin.double x = v590;
    v1186.origin.double y = v592;
    v1186.size.CGFloat width = v595;
    double d = v593;
    CGFloat v414 = r2a;
    v1186.size.CGFloat height = v597;
    if (!CGRectContainsRect(v1135, v1186))
    {
      double v604 = FigCaptureMetadataUtilitiesScaleRect2D(v1052.origin.x, v1052.origin.y, v1052.size.width, v1052.size.height, v575);
      double v875 = acpr_conformRectForMSR420vf(v604, v605, v606, v607);
      double v870 = v608;
      double v881 = v609;
      double v610 = v575;
      CGFloat v599 = v611;
      double v612 = FigCaptureMetadataUtilitiesScaleRect2D(v903, v906, v868, v910, v610);
      double v601 = acpr_conformRectForMSR420vf(v612, v613, v614, v615);
      CGFloat v868 = v616;
      CGFloat v603 = v617;
      int v598 = 1;
      CGFloat v600 = v891;
    }
    else
    {
LABEL_504:
      int v598 = 0;
      double v875 = v1052.origin.x;
      double v870 = v1052.origin.y;
      CGFloat v599 = v1052.size.width;
      double v881 = v1052.size.height;
      double v963 = rect1.origin.y;
      double v923 = rect1.size.width;
      double v926 = rect1.origin.x;
      CGFloat v600 = rect1.size.height;
      double v601 = v903;
      CGFloat v602 = v906;
      CGFloat v603 = v910;
    }
    if (v249 && *(void *)(v16 + 864))
    {
      double v904 = v601;
      double v907 = v602;
      -[BWPreviewStitcherNode _waitForCIPreheatingToFinish](v16);
      v558 = (__CVBuffer *)-[int32x2_t newPixelBuffer](-[BWPreviewStitcherNode _teleOpacityPool]((int32x2_t *)v16), "newPixelBuffer");
      uint64_t v618 = -[int32x2_t newPixelBuffer](-[BWPreviewStitcherNode _teleOpacityPool]((int32x2_t *)v16), "newPixelBuffer");
      v557 = (__CVBuffer *)v618;
      if (v558 && v618 && !VTPixelRotationSessionRotateSubImage())
      {
        v1187.size.CGFloat width = v599;
        v1187.size.CGFloat height = v881;
        *(float *)&int v619 = v876 * (float)(v889 / v939);
        v1136.origin.double x = v904;
        v1136.origin.double y = v907;
        v1136.size.CGFloat width = v868;
        v1136.size.CGFloat height = v603;
        v1187.origin.double x = v875;
        v1187.origin.double y = v870;
        double v940 = v1187.size.width;
        if (CGRectEqualToRect(v1136, v1187)) {
          goto LABEL_525;
        }
        v1137.origin.double x = v904;
        v1137.origin.double y = v907;
        v1137.size.CGFloat width = v868;
        v1137.size.CGFloat height = v603;
        v1188.origin.double x = v875;
        v1188.origin.double y = v870;
        v1188.size.CGFloat width = v940;
        v1188.size.CGFloat height = v881;
        if (!CGRectContainsRect(v1137, v1188))
        {
LABEL_525:
          double v620 = v955 - v865;
          double v621 = v953 - v864;
        }
        else
        {
          double x = v875 - v904;
          double y = v870 - v907;
          double v621 = v953;
          double v620 = v955;
        }
        double v631 = psn_pixelBufferRect(v249);
        propertyValueOut.double a = psn_wideBoundingRect(*(unsigned __int8 *)(v16 + 204), v631, v632, v633, v634, v878, *(float *)&v1047.origin.x, v996, v877);
        propertyValueOut.double b = v635;
        propertyValueOut.double c = v636;
        propertyValueOut.double d = v637;
        -[BWPreviewStitcherNode _transferPixelBuffer:rect:intoPixelBuffer:rect:isFinalOutput:withInputShift:scale:inputSourceRectOut:](v16, v249, v557, 0, &propertyValueOut, v638, v639, v640, propertyValueOut.a, v635, v636, v637, v990, v409, v868, v603, *(uint64_t *)&v620, *(uint64_t *)&v621, v619);
        if (v598)
        {
          double a = FigCaptureMetadataUtilitiesScaleRect2D(propertyValueOut.a, propertyValueOut.b, propertyValueOut.c, propertyValueOut.d, v931);
          CGFloat v642 = v641;
          CGFloat v644 = v643;
          CGFloat v646 = v645;
        }
        else
        {
          double a = propertyValueOut.a;
          CGFloat v642 = propertyValueOut.b;
          CGFloat v644 = propertyValueOut.c;
          CGFloat v646 = propertyValueOut.d;
        }
        v647 = *(void **)(v16 + 1608);
        char v86 = v1019;
        if (v647)
        {

          *(void *)(v16 + 1608) = 0;
          v648 = *(const void **)(v16 + 1584);
          if (v648)
          {
            CFRelease(v648);
            *(void *)(v16 + 1584) = 0;
          }
        }
        CGFloat v937 = v646;
        CGFloat v950 = v642;
        [*(id *)(v16 + 864) updateRampForNextIteration];
        int v649 = [*(id *)(v16 + 864) isRampingUp];
        [*(id *)(v16 + 864) currentValue];
        if (v649) {
          float v651 = v650;
        }
        else {
          float v651 = 1.0 - v650;
        }
        v556 = (__CVBuffer *)-[int32x2_t newPixelBuffer](-[BWPreviewStitcherNode _teleOpacityPool]((int32x2_t *)v16), "newPixelBuffer");

        *(void *)(v16 + 880) = 0;
        -[BWPreviewStitcherNode _renderOpacityRampToPixelBuffer:bounds:withWidePixelBuffer:telePixelBuffer:zoomingIn:progress:teleBounds:teleShift:](v16, v556, v557, v558, v649, v990, v409, v868, v603, v651, v652, v653, v654, v990, v409, v940, v881, x, y);
        *(unsigned char *)(v16 + 936) = 1;
        if (([*(id *)(v16 + 864) isRamping] & 1) == 0)
        {
          [*(id *)(v16 + 864) currentValue];
          if (v655 == 1.0
            && (!v573 || ![*(id *)(v16 + 1352) isRamping] || *(unsigned char *)(v16 + 1388)))
          {

            *(void *)(v16 + 864) = 0;
            *(unsigned char *)(v16 + 904) = 0;
          }
        }
        CGFloat v984 = v644;
        long long v656 = *(_OWORD *)(v16 + 344);
        *(_OWORD *)&propertyValueOut.double a = *(_OWORD *)(v16 + 328);
        *(_OWORD *)&propertyValueOut.double c = v656;
        *(_OWORD *)&propertyValueOut.tdouble x = *(_OWORD *)(v16 + 360);
        double v657 = v904;
        *(double *)&long long v656 = v907;
        CGFloat v658 = v868;
        CGFloat v659 = v603;
        CGRect v1138 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v656 - 8), &propertyValueOut);
        CGFloat v660 = v1138.origin.y;
        CGFloat v661 = v1138.size.width;
        CGFloat v662 = v1138.size.height;
        CGFloat v999 = v1138.origin.x;
        if (!VTPixelRotationSessionRotateSubImage())
        {
          v1189.origin.double y = v409;
          v1139.origin.double x = v1022;
          v1139.origin.double y = v1030;
          v1139.size.CGFloat width = r1e;
          v1139.size.CGFloat height = r2a;
          v1189.origin.double x = v990;
          v1189.size.CGFloat width = v961;
          v1189.size.CGFloat height = rect2b;
          v559 = (opaqueCMSampleBuffer *)v1032;
          float v113 = &OBJC_IVAR___FigCaptureCMSession__cmsession;
          unint64_t v560 = 0x1E4F28000;
          if (CGRectEqualToRect(v1139, v1189))
          {
            CGFloat v414 = v662;
            CGFloat r1e = v661;
            CGFloat v1030 = v660;
            CGFloat v408 = v999;
          }
          else
          {
            v1140.origin.double x = v999;
            v1140.origin.double y = v660;
            v1140.size.CGFloat width = v661;
            v1140.size.CGFloat height = v662;
            v1190.origin.double x = v1022;
            v1190.origin.double y = v1030;
            v1190.size.CGFloat width = r1e;
            v1190.size.CGFloat height = r2a;
            CGRect v1141 = CGRectUnion(v1140, v1190);
            CGFloat v408 = v1141.origin.x;
            CGFloat v1030 = v1141.origin.y;
            CGFloat r1e = v1141.size.width;
            CGFloat v414 = v1141.size.height;
          }
LABEL_545:
          v663 = &unk_1EFB058A8;
          double b = v950;
          double v338 = v931;
          double d = v937;
          CGFloat v410 = rect2b;
          double c = v984;
          goto LABEL_589;
        }
        goto LABEL_693;
      }
    }
    else
    {
      CGFloat v937 = d;
      CGFloat v892 = v600;
      if (!*(void *)(v16 + 1608))
      {
        char v86 = v1019;
        v559 = (opaqueCMSampleBuffer *)v1032;
        float v113 = &OBJC_IVAR___FigCaptureCMSession__cmsession;
        if (*(void *)(v16 + 1616))
        {
          -[BWPreviewStitcherNode _waitForCIPreheatingToFinish](v16);
          [*(id *)(v16 + 1616) updateRampForNextIteration];
          [*(id *)(v16 + 1616) currentValue];
          float v665 = v664;
          v558 = (__CVBuffer *)-[int32x2_t newPixelBuffer](-[BWPreviewStitcherNode _teleOpacityPool]((int32x2_t *)v16), "newPixelBuffer");
          v556 = (__CVBuffer *)-[int32x2_t newPixelBuffer](-[BWPreviewStitcherNode _teleOpacityPool]((int32x2_t *)v16), "newPixelBuffer");

          *(void *)(v16 + 880) = 0;
          if (!VTPixelRotationSessionRotateSubImage())
          {
            float v1000 = v665;
            -[BWPreviewStitcherNode _renderHDRPixelBufferToSDR:toOutputPixelBuffer:progress:](v16, v558, (uint64_t)v556, v665);
            long long v666 = *(_OWORD *)(v16 + 344);
            *(_OWORD *)&propertyValueOut.double a = *(_OWORD *)(v16 + 328);
            *(_OWORD *)&propertyValueOut.double c = v666;
            *(_OWORD *)&propertyValueOut.tdouble x = *(_OWORD *)(v16 + 360);
            double v667 = v875;
            *(double *)&long long v666 = v870;
            CGFloat v668 = v599;
            double v669 = v881;
            CGRect v1142 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v666 - 8), &propertyValueOut);
            CGFloat v670 = v1142.origin.y;
            CGFloat v671 = v1142.size.width;
            CGFloat v672 = v1142.size.height;
            CGFloat v974 = v1142.origin.x;
            if (!VTPixelRotationSessionRotateSubImage())
            {
              v1143.origin.double x = v1022;
              v1143.origin.double y = v1030;
              v1143.size.CGFloat width = r1e;
              v1143.size.CGFloat height = v414;
              v1191.origin.double x = v990;
              v1191.origin.double y = v409;
              v1191.size.CGFloat width = v961;
              v1191.size.CGFloat height = rect2b;
              if (CGRectEqualToRect(v1143, v1191))
              {
                CGFloat v414 = v672;
                CGFloat r1e = v671;
                CGFloat v1030 = v670;
                CGFloat v408 = v974;
              }
              else
              {
                v1150.origin.double x = v974;
                v1150.origin.double y = v670;
                v1150.size.CGFloat width = v671;
                v1150.size.CGFloat height = v672;
                v1195.origin.double x = v1022;
                v1195.origin.double y = v1030;
                v1195.size.CGFloat width = r1e;
                v1195.size.CGFloat height = v414;
                CGRect v1151 = CGRectUnion(v1150, v1195);
                CGFloat v408 = v1151.origin.x;
                CGFloat v1030 = v1151.origin.y;
                CGFloat r1e = v1151.size.width;
                CGFloat v414 = v1151.size.height;
              }
              psn_propagatePixelBufferDolbyVisionRPUData(v1019, *(CVBufferRef *)&v1047.origin.y);
              psn_propagatePixelBufferAmbientViewingEnvironment(v1019, *(__CVBuffer **)&v1047.origin.y);
              unint64_t v560 = 0x1E4F28000uLL;
              *(float *)&double v739 = v1000;
              v663 = (void *)[NSNumber numberWithFloat:v739];
              v557 = 0;
              double b = v950;
              double v338 = v931;
              double d = v937;
              CGFloat v410 = rect2b;
LABEL_589:
              if (*(unsigned char *)(v16 + 1107) && *(unsigned char *)(v16 + 1625))
              {
                CMSetAttachment(*(CMAttachmentBearerRef *)&v1047.origin.y, @"AmbientViewingEnvironmentStrength", v663, 1u);
                unint64_t v560 = 0x1E4F28000uLL;
                IOSurface = CVPixelBufferGetIOSurface(*(CVPixelBufferRef *)&v1047.origin.y);
                BWUtilitiesApplyAVEStrength(IOSurface, v663);
              }
              goto LABEL_592;
            }
          }
          fig_log_get_emitter();
          FigDebugAssert3();
          v557 = 0;
        }
        else
        {
          long long v732 = *(_OWORD *)(v16 + 344);
          *(_OWORD *)&propertyValueOut.double a = *(_OWORD *)(v16 + 328);
          *(_OWORD *)&propertyValueOut.double c = v732;
          *(_OWORD *)&propertyValueOut.tdouble x = *(_OWORD *)(v16 + 360);
          double v733 = v875;
          *(double *)&long long v732 = v870;
          CGFloat v734 = v599;
          double v735 = v881;
          CGRect v1148 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v732 - 8), &propertyValueOut);
          CGFloat v408 = v1148.origin.x;
          CGFloat v736 = v1148.origin.y;
          CGFloat v737 = v1148.size.width;
          CGFloat v738 = v1148.size.height;
          unint64_t v560 = 0x1E4F28000;
          if (!VTPixelRotationSessionRotateSubImage())
          {
            v1149.origin.double x = v1022;
            v1149.origin.double y = v1030;
            v1149.size.CGFloat width = r1e;
            v1149.size.CGFloat height = v414;
            v1194.origin.double x = v990;
            v1194.origin.double y = v409;
            v1194.size.CGFloat width = v961;
            v1194.size.CGFloat height = rect2b;
            if (CGRectEqualToRect(v1149, v1194))
            {
              v556 = 0;
              v557 = 0;
              v558 = 0;
              CGFloat v414 = v738;
              CGFloat r1e = v737;
              CGFloat v1030 = v736;
            }
            else
            {
              v1169.origin.double x = v408;
              v1169.origin.double y = v736;
              v1169.size.CGFloat width = v737;
              v1169.size.CGFloat height = v738;
              v1201.origin.double x = v1022;
              v1201.origin.double y = v1030;
              v1201.size.CGFloat width = r1e;
              v1201.size.CGFloat height = v414;
              CGRect v1170 = CGRectUnion(v1169, v1201);
              CGFloat v408 = v1170.origin.x;
              CGFloat v1030 = v1170.origin.y;
              CGFloat r1e = v1170.size.width;
              CGFloat v414 = v1170.size.height;
              v556 = 0;
              v557 = 0;
              v558 = 0;
            }
            goto LABEL_545;
          }
          fig_log_get_emitter();
          FigDebugAssert3();
          v556 = 0;
          v557 = 0;
          v558 = 0;
        }
LABEL_696:
        v753 = v885;
        goto LABEL_668;
      }
      -[BWPreviewStitcherNode _waitForCIPreheatingToFinish](v16);
      v558 = (__CVBuffer *)-[int32x2_t newPixelBuffer](-[BWPreviewStitcherNode _teleOpacityPool]((int32x2_t *)v16), "newPixelBuffer");
      uint64_t v622 = -[int32x2_t newPixelBuffer](-[BWPreviewStitcherNode _teleOpacityPool]((int32x2_t *)v16), "newPixelBuffer");
      v557 = (__CVBuffer *)v622;
      char v86 = v1019;
      if (v558 && v622 && !VTPixelRotationSessionRotateSubImage())
      {
        propertyValueOut.double a = 0.0;
        BWCMSampleBufferCreateCopyIncludingMetadata(*(CMSampleBufferRef *)(v16 + 1584), (CMSampleBufferRef *)&propertyValueOut);
        v1047.size.CGFloat width = 0.0;
        rhs.origin.double x = 0.0;
        BWOverCaptureSampleBufferUnpackAndRetain(*(CMAttachmentBearerRef *)&propertyValueOut.a, 1, &v1047.size.width, (CFTypeRef *)&rhs, 0, 0);
        if (*(void *)&propertyValueOut.a) {
          CFRelease(*(CFTypeRef *)&propertyValueOut.a);
        }
        CGFloat v941 = v599;
        CGFloat v623 = rhs.origin.x;
        v624 = objc_msgSend(v1036, "objectForKeyedSubscript:", v574, v852, v855);
        v911 = objc_msgSend((id)CMGetAttachment(*(CMAttachmentBearerRef *)&v1047.size.width, v901, 0), "objectForKeyedSubscript:", v574);
        if (objc_msgSend(v624, "isEqual:")) {
          CGFloat v625 = v1047.size.width;
        }
        else {
          CGFloat v625 = v623;
        }
        CGFloat v998 = v625;
        v626 = CMSampleBufferGetImageBuffer(*(CMSampleBufferRef *)&v625);
        uint64_t v627 = *MEMORY[0x1E4F54380];
        v628 = (void *)[v1036 objectForKeyedSubscript:*MEMORY[0x1E4F54380]];
        if (v628)
        {
          [v628 floatValue];
          float v630 = v629;
        }
        else
        {
          float v630 = 1.0;
        }
        uint64_t v673 = *MEMORY[0x1E4F540F0];
        v674 = (void *)[v1036 objectForKeyedSubscript:*MEMORY[0x1E4F540F0]];
        if (v674)
        {
          [v674 floatValue];
          float v630 = v630 * v675;
        }
        v676 = (void *)CMGetAttachment(*(CMAttachmentBearerRef *)&v998, v901, 0);
        v677 = (void *)[v676 objectForKeyedSubscript:v627];
        if (v677)
        {
          [v677 floatValue];
          float v679 = v678;
        }
        else
        {
          float v679 = 1.0;
        }
        v680 = (void *)[v676 objectForKeyedSubscript:v673];
        v681 = v680;
        if (v680)
        {
          [v680 floatValue];
          float v679 = v679 * v682;
        }
        float v113 = &OBJC_IVAR___FigCaptureCMSession__cmsession;
        psn_pixelBufferRect(v1019);
        CGFloat v964 = FigCaptureMetadataUtilitiesScaleRect2D(v926, v963, v923, v892, 1.0 / (v683 * v630));
        CGFloat v685 = v684;
        CGFloat v687 = v686;
        CGFloat v689 = v688;
        psn_pixelBufferRect(v626);
        double v691 = v690 * v679;
        double v692 = psn_pixelBufferRect(v626);
        double v694 = v693;
        double v696 = v695;
        double v698 = v697;
        FigCaptureMetadataUtilitiesScaleRect2D(v964, v685, v687, v689, v691);
        CGFloat v700 = v699;
        CGFloat v702 = v701;
        double v703 = v692 + (v696 - v699) * 0.5;
        double v704 = v694 + (v698 - v701) * 0.5;
        [v681 floatValue];
        if (v705 <= 1.0)
        {
          v559 = (opaqueCMSampleBuffer *)v1032;
          double c = v984;
          CGFloat v706 = r1e;
        }
        else
        {
          v559 = (opaqueCMSampleBuffer *)v1032;
          double c = v984;
          CGFloat v706 = r1e;
          if ([v911 isEqualToString:*MEMORY[0x1E4F52DE8]])
          {
            double v707 = FigCaptureMetadataUtilitiesNormalizedSensorCenterOffsetInValidBufferRect(*(void **)&v998);
            double v709 = v708;
            int v710 = psn_pixelBufferDimensions(v626);
            double v703 = v703 + FigCaptureMetadataUtilitiesDenormalizePoint(v707, v709, (double)v710);
            double v704 = v704 + v711;
          }
        }
        if (v704 < 0.0)
        {
          FigCaptureMetadataUtilitiesScaleRect2D(v703, v704, v700, v702, 1.0);
          FigCaptureMetadataUtilitiesScaleRect2D(v990, v888, v941, v881, 1.0);
        }
        int v712 = VTPixelRotationSessionRotateSubImage();
        if (*(void *)&v1047.size.width) {
          CFRelease(*(CFTypeRef *)&v1047.size.width);
        }
        if (*(void *)&rhs.origin.x) {
          CFRelease(*(CFTypeRef *)&rhs.origin.x);
        }
        if (!v712)
        {
          [*(id *)(v16 + 1608) currentValue];
          float v714 = v713;
          [*(id *)(v16 + 1608) updateRampForNextIteration];
          if ((uint64_t)llroundf(a11) <= 59 && !*(unsigned char *)(v16 + 1041) && v714 != 1.0) {
            [*(id *)(v16 + 1608) updateRampForNextIteration];
          }
          [*(id *)(v16 + 1608) currentValue];
          float v716 = v715;
          v556 = (__CVBuffer *)-[int32x2_t newPixelBuffer](-[BWPreviewStitcherNode _teleOpacityPool]((int32x2_t *)v16), "newPixelBuffer");

          *(void *)(v16 + 880) = 0;
          -[BWPreviewStitcherNode _renderOpacityRampToPixelBuffer:bounds:withWidePixelBuffer:telePixelBuffer:zoomingIn:progress:teleBounds:teleShift:](v16, v556, v557, v558, 0, v990, v888, v941, v881, v716, v717, v718, v719, v990, v888, v941, v881, x, y);
          *(unsigned char *)(v16 + 936) = 1;
          long long v720 = *(_OWORD *)(v16 + 344);
          *(_OWORD *)&propertyValueOut.double a = *(_OWORD *)(v16 + 328);
          *(_OWORD *)&propertyValueOut.double c = v720;
          *(_OWORD *)&propertyValueOut.tdouble x = *(_OWORD *)(v16 + 360);
          double v721 = v875;
          *(double *)&long long v720 = v870;
          CGFloat v722 = v941;
          double v723 = v881;
          CGRect v1144 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v720 - 8), &propertyValueOut);
          CGFloat v724 = v1144.origin.y;
          CGFloat v725 = v1144.size.width;
          CGFloat v726 = v1144.size.height;
          CGFloat v1001 = v1144.origin.x;
          if (!VTPixelRotationSessionRotateSubImage())
          {
            v1192.origin.double x = v990;
            v1145.origin.double x = v1022;
            v1145.origin.double y = v1030;
            v1145.size.CGFloat width = v706;
            v1145.size.CGFloat height = r2a;
            v1192.origin.double y = v888;
            v1192.size.CGFloat width = v961;
            v1192.size.CGFloat height = rect2b;
            if (CGRectEqualToRect(v1145, v1192))
            {
              CGFloat v414 = v726;
              CGFloat r1e = v725;
              CGFloat v1030 = v724;
              CGFloat v408 = v1001;
            }
            else
            {
              v1146.origin.double x = v1001;
              v1146.origin.double y = v724;
              v1146.size.CGFloat width = v725;
              v1146.size.CGFloat height = v726;
              v1193.origin.double x = v1022;
              v1193.origin.double y = v1030;
              v1193.size.CGFloat width = v706;
              v1193.size.CGFloat height = r2a;
              CGRect v1147 = CGRectUnion(v1146, v1193);
              CGFloat v408 = v1147.origin.x;
              CGFloat v1030 = v1147.origin.y;
              CGFloat r1e = v1147.size.width;
              CGFloat v414 = v1147.size.height;
            }
            double v338 = v931;
            psn_propagatePixelBufferDolbyVisionRPUData(v1019, *(CVBufferRef *)&v1047.origin.y);
            psn_propagatePixelBufferAmbientViewingEnvironment(v1019, *(__CVBuffer **)&v1047.origin.y);
            unint64_t v560 = 0x1E4F28000uLL;
            v727 = NSNumber;
            [*(id *)(v16 + 1608) currentValue];
            *(float *)&double v729 = 1.0 - v728;
            v663 = (void *)[v727 numberWithFloat:v729];
            double b = v950;
            double d = v937;
            CGFloat v410 = rect2b;
            CGFloat v409 = v888;
            if (([*(id *)(v16 + 1608) isRamping] & 1) == 0)
            {
              [*(id *)(v16 + 1608) currentValue];
              if (v730 == 0.0)
              {

                *(void *)(v16 + 1608) = 0;
                v731 = *(const void **)(v16 + 1584);
                if (v731)
                {
                  CFRelease(v731);
                  *(void *)(v16 + 1584) = 0;
                }
              }
            }
            goto LABEL_589;
          }
LABEL_693:
          fig_log_get_emitter();
          FigDebugAssert3();
          goto LABEL_696;
        }
      }
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    v556 = 0;
    goto LABEL_696;
  }
  v556 = 0;
  v557 = 0;
  v558 = 0;
  v559 = (opaqueCMSampleBuffer *)v112;
  unint64_t v560 = 0x1E4F28000;
LABEL_592:
  double v951 = b;
  double v985 = c;
  double v938 = d;
  if (*(unsigned char *)(v16 + v113[849]))
  {
    if (*(unsigned char *)(v16 + 1472))
    {
      objc_msgSend((id)objc_msgSend(*(id *)(v16 + 216), "firstObject"), "floatValue");
      if (*(float *)&v1047.origin.x >= v741 && *(float *)&v1047.origin.x < *(float *)(v16 + 164) && !v867)
      {
        -[BWPreviewStitcherNode _initTeleOpacityCIContextWithColorManagementEnabled:](v16, 0);
        v1047.origin.double x = psn_blurPixelBufferBorder(*(void **)(v16 + 896), *(CVPixelBufferRef *)&v1047.origin.y, v408, v1030, r1e, v414, *(float *)(v16 + 1476));
        v1196.size.CGFloat height = v410;
        CGFloat v743 = v742;
        CGFloat v745 = v744;
        CGFloat v747 = v746;
        v1152.origin.double x = v408;
        v1152.origin.double y = v1030;
        v1152.size.CGFloat width = r1e;
        v1152.size.CGFloat height = v414;
        v1196.origin.double y = v409;
        v1196.origin.double x = v990;
        v1196.size.CGFloat width = v961;
        CGFloat v748 = v1196.size.height;
        if (CGRectEqualToRect(v1152, v1196))
        {
          CGFloat v414 = v747;
          CGFloat r1e = v745;
          CGFloat v1030 = v743;
          CGFloat v408 = v1047.origin.x;
        }
        else
        {
          v1153.origin.double x = v1047.origin.x;
          v1153.origin.double y = v743;
          v1153.size.CGFloat width = v745;
          v1153.size.CGFloat height = v747;
          v1197.origin.double x = v408;
          v1197.origin.double y = v1030;
          v1197.size.CGFloat width = r1e;
          v1197.size.CGFloat height = v414;
          CGRect v1154 = CGRectUnion(v1153, v1197);
          CGFloat v408 = v1154.origin.x;
          CGFloat v1030 = v1154.origin.y;
          CGFloat r1e = v1154.size.width;
          CGFloat v414 = v1154.size.height;
        }
        double b = v951;
        CGFloat v410 = v748;
        double v338 = v931;
        double d = v938;
      }
    }
  }
  v749 = *(void **)(v16 + 1096);
  if (v749
    && (int v750 = *(unsigned __int8 *)(v16 + 1104),
        (v751 = CVPixelBufferGetIOSurface(*(CVPixelBufferRef *)&v1047.origin.y)) != 0))
  {
    uint64_t ID = IOSurfaceGetID(v751);
    *(CGPoint *)&propertyValueOut.double a = v894;
    *(CGSize *)&propertyValueOut.double c = v893;
    if (!v750) {
      CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v749, "objectForKeyedSubscript:", objc_msgSend(*(id *)(v560 + 3792), "numberWithUnsignedInt:", ID)), (CGRect *)&propertyValueOut);
    }
    v1155.origin.double x = propertyValueOut.a;
    v1155.origin.double y = propertyValueOut.b;
    v1155.size.CGFloat width = propertyValueOut.c;
    v1155.size.CGFloat height = propertyValueOut.d;
    v1198.origin.double x = v990;
    v1198.origin.double y = v409;
    v1198.size.CGFloat width = v961;
    v1198.size.CGFloat height = v410;
    v753 = v885;
    if (CGRectEqualToRect(v1155, v1198)) {
      goto LABEL_607;
    }
    v1199.origin.double x = propertyValueOut.a;
    v1199.origin.double y = propertyValueOut.b;
    v1199.size.CGFloat width = propertyValueOut.c;
    v1199.size.CGFloat height = propertyValueOut.d;
    v1156.origin.double x = v408;
    v1156.origin.double y = v1030;
    v1156.size.CGFloat width = r1e;
    v1156.size.CGFloat height = v414;
    if (!CGRectContainsRect(v1156, v1199)) {
LABEL_607:
    }
      VTFillPixelBufferBorderWithBlack();
    v1157.origin.double x = v408;
    v1157.origin.double y = v1030;
    v1157.size.CGFloat width = r1e;
    v1157.size.CGFloat height = v414;
    CFDictionaryRef v754 = CGRectCreateDictionaryRepresentation(v1157);
    objc_msgSend(v749, "setObject:forKeyedSubscript:", CFAutorelease(v754), objc_msgSend(*(id *)(v560 + 3792), "numberWithUnsignedInt:", ID));
    v559 = (opaqueCMSampleBuffer *)v1032;
  }
  else
  {
    VTFillPixelBufferBorderWithBlack();
    v753 = v885;
  }
  if (v978) {
    v755 = v559;
  }
  else {
    v755 = v1033;
  }
  v756 = ImageBuffer;
  if (!BWCMSampleBufferCreateCopyWithNewPixelBuffer(v755, *(__CVBuffer **)&v1047.origin.y, (CFTypeRef *)(v16 + 320), &v1058))
  {
    CGFloat v1023 = v408;
    if (v978) {
      v757 = ImageBuffer;
    }
    else {
      v757 = v86;
    }
    CFStringRef v758 = (const __CFString *)*MEMORY[0x1E4F24BB8];
    CFTypeRef v759 = CMGetAttachment(v757, (CFStringRef)*MEMORY[0x1E4F24BB8], 0);
    CMSetAttachment(*(CMAttachmentBearerRef *)&v1047.origin.y, v758, v759, 1u);
    double v760 = -[BWPreviewStitcherNode _scaleFactorAppliedForPixelBuffer:usedSourceRect:primaryCaptureRectAspectRatio:metadata:](v16, ImageBuffer, v1034, a, b, c, d, v995);
    float v761 = *(float *)&v760;
    double v762 = -[BWPreviewStitcherNode _scaleFactorAppliedForPixelBuffer:usedSourceRect:primaryCaptureRectAspectRatio:metadata:](v16, v86, v1036, rect1.origin.x, rect1.origin.y, rect1.size.width, rect1.size.height, v995);
    float v763 = *(float *)&v762;
    r2double b = v414;
    if (v338 <= 1.0)
    {
      double v764 = v338;
    }
    else
    {
      float v761 = v761 / v338;
      double v764 = v338;
      float v763 = *(float *)&v762 / v338;
    }
    double v765 = v917 + point.x;
    double v766 = keya + point.y;
    uint64_t v767 = *MEMORY[0x1E4F540F0];
    objc_msgSend((id)objc_msgSend(v1036, "objectForKeyedSubscript:", *MEMORY[0x1E4F540F0], v852), "floatValue");
    float v769 = 1.0;
    if (v768 == 0.0) {
      float v770 = 1.0;
    }
    else {
      float v770 = v768;
    }
    objc_msgSend((id)objc_msgSend(v1034, "objectForKeyedSubscript:", v767), "floatValue");
    if (v773 != 0.0) {
      float v769 = v773;
    }
    if (*(unsigned char *)(v16 + 152))
    {
      CFStringRef v775 = v901;
      if (*(unsigned char *)(v16 + 1388) && *(unsigned char *)(v16 + 1360) && ([*(id *)(v16 + 864) isRamping] & 1) == 0)
      {
        if (*(unsigned char *)(v16 + 244)) {
          uint64_t v776 = [*(id *)(v16 + 1352) isRamping] ^ 1;
        }
        else {
          uint64_t v776 = 1;
        }
      }
      else
      {
        uint64_t v776 = 0;
      }
    }
    else
    {
      uint64_t v776 = 0;
      CFStringRef v775 = v901;
    }
    *(float *)&double v774 = v763;
    -[BWPreviewStitcherNode _callDelegateWithAppliedWiderShift:narrowerShift:widerScaleFactor:narrowerScaleFactor:widerPixelBuffer:narrowerPixelBuffer:widerNondisruptiveSwitchingZoomFactor:narrowerNondisruptiveSwitchingZoomFactor:widerPortType:narrowerPortType:inSuperWideMacroMode:widerShiftAtBaseZoom:](v16, ImageBuffer, v86, (uint64_t)v908, v1002, v776, v771, v772, v955, v953, v765, v766, v761, v774, v769, v770, v929, v928);
    v777 = (void *)CMGetAttachment(v1058, v775, 0);
    if (v764 <= 1.0
      && (v1158.origin.double x = v897,
          v1158.origin.double y = v896,
          v1158.size.CGFloat width = v895,
          v1158.size.CGFloat height = v919,
          CGRectIsNull(v1158)))
    {
      [v777 setObject:0 forKeyedSubscript:v927];
      uint64_t v778 = v882;
    }
    else
    {
      v1159.origin.double x = v897;
      v1159.origin.double y = v896;
      v1159.size.CGFloat width = v895;
      v1159.size.CGFloat height = v919;
      uint64_t v778 = v882;
      if (CGRectIsNull(v1159))
      {
        double v779 = v969;
        double v780 = v981;
        double v781 = v966;
        double v782 = FigCaptureMetadataUtilitiesScaleRect2D(v969, v981, v966, v971, 1.0 / v764);
      }
      else
      {
        memset(&propertyValueOut, 0, sizeof(propertyValueOut));
        CGSize v785 = *(CGSize *)(v16 + 344);
        v1047.size = *(CGSize *)(v16 + 328);
        CGSize v1048 = v785;
        long long v1049 = *(_OWORD *)(v16 + 360);
        CGAffineTransformInvert(&propertyValueOut, (CGAffineTransform *)&v1047.size);
        v1047.size = *(CGSize *)&propertyValueOut.a;
        CGSize v1048 = *(CGSize *)&propertyValueOut.c;
        long long v1049 = *(_OWORD *)&propertyValueOut.tx;
        double v779 = v969;
        v1160.origin.double x = v969;
        double v780 = v981;
        v1160.origin.double y = v981;
        double v781 = v966;
        v1160.size.CGFloat width = v966;
        v1160.size.CGFloat height = v971;
        CGRect v1161 = CGRectApplyAffineTransform(v1160, (CGAffineTransform *)&v1047.size);
        v1162.origin.double x = FigCaptureMetadataUtilitiesRectDenormalizedToRect(v897, v896, v895, v919, v1161.origin.x, v1161.origin.y, v1161.size.width);
        CGSize v786 = *(CGSize *)(v16 + 344);
        v1047.size = *(CGSize *)(v16 + 328);
        CGSize v1048 = v786;
        long long v1049 = *(_OWORD *)(v16 + 360);
        *(CGRect *)&double v782 = CGRectApplyAffineTransform(v1162, (CGAffineTransform *)&v1047.size);
      }
      v1047.origin.double x = v782;
      double v1037 = v783;
      double v1035 = v784;
      double v787 = psn_pixelBufferRect(*(__CVBuffer **)&v1047.origin.y);
      double v789 = v788;
      double v791 = v790;
      double v793 = FigCaptureMetadataUtilitiesRectNormalizedToRect(v787, v788, v790, v792, v779, v780, v781);
      double v797 = FigCaptureMetadataUtilitiesRectDenormalizedToRect(v793, v794, v795, v796, v1047.origin.x, v1037, v1035);
      FigCaptureMetadataUtilitiesRectNormalizedToRect(v797, v798, v799, v800, v787, v789, v791);
      FigCFDictionarySetCGRect();
    }
    v1163.origin.double x = v1023;
    v1163.origin.double y = v1030;
    v1163.size.CGFloat width = r1e;
    v1163.size.CGFloat height = r2b;
    if (!CGRectIsEmpty(v1163))
    {
      double v801 = (double)CVPixelBufferGetWidth(*(CVPixelBufferRef *)&v1047.origin.y);
      unint64_t v560 = 0x1E4F28000uLL;
      size_t v802 = CVPixelBufferGetHeight(*(CVPixelBufferRef *)&v1047.origin.y);
      v803.f64[0] = 0.0;
      v804.f64[0] = v1023;
      v1164.origin.double x = FigCaptureMetadataUtilitiesClampRectToBoundingRect(v804, v1030, r1e, r2b, v803, 0.0, v801, (double)v802);
      CFDictionaryRef v805 = CGRectCreateDictionaryRepresentation(v1164);
      CMSetAttachment(v1058, @"OverCaptureStitchedValidBufferRect", v805, 1u);
      if (v805) {
        CFRelease(v805);
      }
    }
    if (v753) {
      CMSetAttachment(v1058, @"CAContextFencePortSendRight", v753, 1u);
    }
    if (v778 >= 1) {
      CMSetAttachment(v1058, @"CAContextFencePortGenerationID", (CFTypeRef)[*(id *)(v560 + 3792) numberWithLongLong:v778], 1u);
    }
    if (v995 != *(float *)(v16 + 800)) {
      *(float *)(v16 + 800) = v995;
    }
    if (*(unsigned char *)(v16 + 145))
    {
      propertyValueOut.double a = 0.0;
      VTSessionCopyProperty(*(VTSessionRef *)(v16 + 312), (CFStringRef)*MEMORY[0x1E4F450A8], (CFAllocatorRef)*MEMORY[0x1E4F1CF80], &propertyValueOut);
      v806 = (void *)[*(id *)&propertyValueOut.a copy];
      CMSetAttachment(v1058, (CFStringRef)*MEMORY[0x1E4F531B0], v806, 1u);
    }
    double v807 = v966;
    if (ImageBuffer) {
      CMSetAttachment(v1058, @"IsOverCaptureFrame", (CFTypeRef)[*(id *)(v560 + 3792) numberWithBool:1], 1u);
    }
    if (*(_DWORD *)(v16 + 104)) {
      CMSetAttachment(*(CMAttachmentBearerRef *)&v1047.origin.y, @"RotationDegrees", (CFTypeRef)objc_msgSend(*(id *)(v560 + 3792), "numberWithInt:"), 1u);
    }
    if (*(unsigned char *)(v16 + 108))
    {
      v808 = kBWNodeBufferAttachmentKey_MirroredHorizontal;
    }
    else
    {
      if (!*(unsigned char *)(v16 + 109))
      {
LABEL_657:
        -[BWPreviewStitcherNode _updateUprightExifOrientationOnSampleBufferIfNeeded:](v16, v1058);
        memset(&propertyValueOut, 0, sizeof(propertyValueOut));
        CGSize v809 = *(CGSize *)(v16 + 344);
        v1047.size = *(CGSize *)(v16 + 328);
        CGSize v1048 = v809;
        long long v1049 = *(_OWORD *)(v16 + 360);
        CGAffineTransformInvert(&propertyValueOut, (CGAffineTransform *)&v1047.size);
        v1047.size = *(CGSize *)&propertyValueOut.a;
        CGSize v1048 = *(CGSize *)&propertyValueOut.c;
        long long v1049 = *(_OWORD *)&propertyValueOut.tx;
        v1165.origin.double x = v969;
        v1165.origin.double y = v981;
        v1165.size.CGFloat width = v966;
        v1165.size.CGFloat height = v971;
        CGRect v1166 = CGRectApplyAffineTransform(v1165, (CGAffineTransform *)&v1047.size);
        double v810 = v1166.origin.x;
        double v811 = v1166.origin.y;
        double v812 = v1166.size.width;
        double v813 = v1166.size.height;
        v1047.size = *(CGSize *)&propertyValueOut.a;
        CGSize v1048 = *(CGSize *)&propertyValueOut.c;
        long long v1049 = *(_OWORD *)&propertyValueOut.tx;
        v1166.origin.double x = v1023;
        v1166.origin.double y = v1030;
        v1166.size.CGFloat width = r1e;
        v1166.size.CGFloat height = r2b;
        CGRect v1167 = CGRectApplyAffineTransform(v1166, (CGAffineTransform *)&v1047.size);
        double v814 = FigCaptureMetadataUtilitiesRectNormalizedToRect(v810, v811, v812, v813, v1167.origin.x, v1167.origin.y, v1167.size.width);
        if (v978)
        {
          double v818 = FigCaptureMetadataUtilitiesRectDenormalizedToRect(v814, v815, v816, v817, a, v951, v985);
          double v820 = v819;
          double v822 = v821;
          double v824 = v823;
        }
        else if (v867)
        {
          double v818 = FigCaptureMetadataUtilitiesRectDenormalizedToRect(v814, v815, v816, v817, rect1.origin.x, rect1.origin.y, rect1.size.width);
          double v820 = v825;
          double v822 = v826;
          double v824 = v827;
          v756 = v1019;
        }
        else
        {
          double v818 = rect1.origin.x;
          double v820 = rect1.origin.y;
          v756 = v1019;
          double v822 = rect1.size.width;
          double v824 = rect1.size.height;
        }
        if (a8)
        {
          CVPixelBufferGetWidth(v756);
          CVPixelBufferGetHeight(v756);
          double v807 = v966;
          FigCaptureMetadataUtilitiesNormalizeCropRect(v818, v820, v822, v824);
          *a8 = v828;
          a8[1] = v829;
          a8[2] = v830;
          a8[3] = v831;
        }
        LOBYTE(v1047.size.width) = 0;
        int v832 = ptn_rotationDegreesAndMirroringFromLiveConfiguration(*(unsigned int *)(v16 + 104), *(unsigned __int8 *)(v16 + 108), *(unsigned __int8 *)(v16 + 109), (char *)&v1047.size);
        BWUpdateCameraIntrinsicsMatrixOnSampleBuffer(v1058, (const __CFString *)*MEMORY[0x1E4F1F218], v832, LOBYTE(v1047.size.width), v818, v820, v822, v824, v969, v981, v807, v971);
        if (*(unsigned char *)(v16 + 1502))
        {
          double v833 = FigCaptureMetadataUtilitiesScaleRect2D(v818, v820, v822, v824, 1.0 / v931);
          double v835 = v834;
          double v837 = v836;
          double v839 = v838;
          unint64_t v840 = psn_pixelBufferDimensions(v1019);
          BWUpdateTrackedFacesMetadataOnSampleBuffer(v1058, v833, v835, v837, v839, v969, v981, v807, v971, v840, v832, LOBYTE(v1047.size.width));
        }
        if (a7)
        {
          *a7 = v955;
          a7[1] = v953;
        }
        goto LABEL_668;
      }
      v808 = kBWNodeBufferAttachmentKey_MirroredVertical;
    }
    CMSetAttachment(*(CMAttachmentBearerRef *)&v1047.origin.y, *v808, MEMORY[0x1E4F1CC38], 1u);
    goto LABEL_657;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
LABEL_668:
  if (*(void *)&v1047.origin.y) {
    CFRelease(*(CFTypeRef *)&v1047.origin.y);
  }
  if (v558) {
    CFRelease(v558);
  }
  if (v557) {
    CFRelease(v557);
  }
  if (v556) {
    CFRelease(v556);
  }

  return v1058;
}

- (uint64_t)_transferPixelBuffer:(CVPixelBufferRef)pixelBuffer rect:(int)a4 intoPixelBuffer:(_OWORD *)a5 rect:(int)a6 isFinalOutput:(int)a7 withInputShift:(int)a8 scale:(CGFloat)a9 inputSourceRectOut:(CGFloat)a10
{
  if (result)
  {
    uint64_t v28 = result;
    CGSize v29 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    long long v41 = *MEMORY[0x1E4F1DB28];
    CGSize v42 = v29;
    long long v39 = v41;
    CGSize v40 = v29;
    unsigned int Width = CVPixelBufferGetWidth(pixelBuffer);
    unint64_t v31 = Width | ((unint64_t)CVPixelBufferGetHeight(pixelBuffer) << 32);
    unint64_t v38 = v31;
    if (a4)
    {
      FigCaptureSwapVideoDimensionsFor90Or270Rotation((int32x2_t *)&v38, *(_DWORD *)(v28 + 104));
      unint64_t v31 = v38;
    }
    -[BWPreviewStitcherNode _getInputRect:outputRect:inputShiftAppliedInOutputRect:toTransferPixelBuffer:rect:intoPixelBufferDimensions:rect:withInputShift:shiftOutsideBoundingRectAllowed:scale:forFinalOutput:](v28, (double *)&v39, (CGFloat *)&v41, 0, a2, v31, 1, a4, a9, a10, a11, a12, a13, a14, a15, a16, *(double *)&a17, *(double *)&a18, *(float *)&a19);
    if (a5)
    {
      CGSize v32 = v40;
      *a5 = v39;
      a5[1] = v32;
    }
    if (a4)
    {
      v43.origin.double y = *((CGFloat *)&v41 + 1);
      v43.size = v42;
      long long v33 = *(_OWORD *)(v28 + 344);
      *(_OWORD *)&v37.double a = *(_OWORD *)(v28 + 328);
      *(_OWORD *)&v37.double c = v33;
      *(_OWORD *)&v37.tdouble x = *(_OWORD *)(v28 + 360);
      *(void *)&v43.origin.double x = v41;
      CGRect v44 = CGRectApplyAffineTransform(v43, &v37);
      *(CGFloat *)&long long v41 = v44.origin.x;
      *((void *)&v41 + 1) = *(void *)&v44.origin.y;
      v42.CGFloat width = v44.size.width;
      v42.CGFloat height = v44.size.height;
    }
    double result = VTPixelRotationSessionRotateSubImage();
    if (result)
    {
      fig_log_get_emitter();
      return FigDebugAssert3();
    }
  }
  return result;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  CMAttachmentBearerRef target = 0;
  CMAttachmentBearerRef cf = 0;
  if (self->_superMacroEdgeFeatheringBlurEnabled) {
    [(BWPreviewRegistration *)self->_registration waitForRegistrationToComplete];
  }
  memset(&v127, 0, sizeof(v127));
  CMSampleBufferGetPresentationTimeStamp(&v127, a3);
  int v6 = (int *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    BWGetOriginalPresentationTimeStampFromBuffer(a3, (uint64_t)&v126);
    CMTime time = v126;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  if (![(BWNodeOutput *)self->super._output liveFormat]) {
    goto LABEL_31;
  }
  CMTime time = v127;
  CMTime time2 = *(CMTime *)&self->_lastSampleBuffer;
  if ((CMTimeCompare(&time, &time2) & 0x80000000) == 0)
  {
    if (LOBYTE(self->_lastInputPTS.epoch))
    {
      if (!BWSampleBufferGetAttachedMedia(a3, @"SynchronizedSlaveFrame"))
      {
        int v14 = objc_msgSend((id)CMGetAttachment(a3, @"OverCaptureSlaveStreamStatus", 0), "intValue");
        if (v14 == 4 || v14 == 1 && !self->_previewsWideBeforeSlaveStreamStarts)
        {
LABEL_31:
          int v15 = *v6;
          goto LABEL_63;
        }
      }
    }
    os_unfair_lock_lock(&self->_configurationLock);
    CFStringRef v7 = *(opaqueCMSampleBuffer **)&self->_featherEdgesForOpacityRamp;
    time.value = 0;
    BWCMSampleBufferCreateCopyIncludingMetadata(a3, (CMSampleBufferRef *)&time);
    *(void *)&v115.size.CGFloat width = v7;
    if (v7 == a3)
    {
      if (!time.value)
      {
        os_unfair_lock_unlock(&self->_configurationLock);
        float v10 = 0;
        goto LABEL_33;
      }
      float v10 = (void *)CFRetain((CFTypeRef)time.value);
    }
    else
    {
      int v8 = *(const void **)&self->_featherEdgesForOpacityRamp;
      value = (const void *)time.value;
      *(void *)&self->_featherEdgesForOpacityRamp = time.value;
      if (value) {
        CFRetain(value);
      }
      if (v8) {
        CFRelease(v8);
      }
      *(CMTime *)&self->_lastSampleBuffer = v127;
      float v10 = a3;
    }
    if (time.value) {
      CFRelease((CFTypeRef)time.value);
    }
    os_unfair_lock_unlock(&self->_configurationLock);
    if (*(opaqueCMSampleBuffer **)&v115.size.width != a3)
    {
      int v12 = BYTE1(self->_lastInputPTS.epoch);
      uint64_t UpTimeNanoseconds = FigGetUpTimeNanoseconds();
      if (v12)
      {
        if (UpTimeNanoseconds - *(void *)&self->_multiCameraStitchingEnabled <= 24000000) {
          goto LABEL_62;
        }
        BYTE1(self->_lastInputPTS.epoch) = 0;
        os_unfair_lock_lock(&self->_configurationLock);
        if (BYTE3(self->_blackFilledBorderRectsBySurfaceID)
          || !BYTE4(self->_narrowerCameraFoVFillsOverCapture.name)
          || *(double *)&self->_superWideSensorCenterOffsetEnabled != 0.0
          || BYTE5(self->_narrowerCameraFoVFillsOverCapture.name))
        {
          os_unfair_lock_unlock(&self->_configurationLock);
        }
        else
        {
          BYTE4(self->_narrowerCameraFoVFillsOverCapture.name) = 0;
          int v66 = BYTE2(self->_blackFilledBorderRectsBySurfaceID);
          os_unfair_lock_unlock(&self->_configurationLock);
          if (v66) {
            [(BWPreviewStitcherDelegate *)self->_delegate previewStitcherTrueVideoExitTransitionDidComplete:self];
          }
        }
LABEL_35:
        if (v127.flags)
        {
          uint64_t v16 = &self->_havePreheatedCI + 4;
          if (self->_firstFramePTS.timescale)
          {
            if (!self->_havePreheatedCI)
            {
              memset(&time, 0, sizeof(time));
              CMTime time2 = v127;
              *(_OWORD *)&rhs.value = *(_OWORD *)v16;
              rhs.epoch = *(void *)&self->_firstFramePTS.flags;
              CMTimeSubtract(&time, &time2, &rhs);
              CMTimeMake(&v122, 750, 1000);
              CMTime time2 = time;
              if ((CMTimeCompare(&time2, &v122) & 0x80000000) == 0) {
                -[BWPreviewStitcherNode _preheatCIRenderingAsync]((uint64_t)self);
              }
            }
          }
          else
          {
            *(_OWORD *)uint64_t v16 = *(_OWORD *)&v127.value;
            *(void *)&self->_firstFramePTS.flags = v127.epoch;
            [(BWPreviewStitcherDelegate *)self->_delegate previewStitcherReadyForPrimaryCaptureRectUpdates:self];
          }
        }
        if (!LOBYTE(self->_trueVideoCaptureAdditionalZoomFactor))
        {
LABEL_45:
          if (self->_zoomPIPUseNarrowerCamera
            && (AttachedMedidouble a = (const void *)BWSampleBufferGetAttachedMedia(v10, @"Depth")) != 0)
          {
            CFTypeRef v20 = CFRetain(AttachedMedia);
          }
          else
          {
            CFTypeRef v20 = 0;
          }
          int v21 = *((unsigned __int8 *)&self->_zoomPIPUseNarrowerCamera + 1);
          if (LOBYTE(self->_lastInputPTS.epoch) || LOBYTE(self->_borderStretchScaleFactor))
          {
            BWOverCaptureSampleBufferUnpackAndRetain(v10, v21 == 0, &cf, &target, 0, 0);
            if (target) {
              goto LABEL_52;
            }
          }
          else if (v10)
          {
            CFTypeRef v65 = CFRetain(v10);
            CMAttachmentBearerRef target = v65;
            if (v65)
            {
              if (!v21) {
                BWSampleBufferRemoveAllAttachedMedia(v65);
              }
LABEL_52:
              if (*(&self->_zoomPIPUseNarrowerCamera + 1))
              {
                CMAttachmentBearerRef v22 = target;
                if (psn_attachedMediaKeysToPropagateForStyles_onceToken != -1) {
                  dispatch_once(&psn_attachedMediaKeysToPropagateForStyles_onceToken, &__block_literal_global_661);
                }
                BWSampleBufferFilterWithAllowedAttachedMedia(v22, (void *)psn_attachedMediaKeysToPropagateForStyles_propagatingKeysForStyles);
                CMAttachmentBearerRef v23 = cf;
                if (psn_attachedMediaKeysToPropagateForStyles_onceToken != -1) {
                  dispatch_once(&psn_attachedMediaKeysToPropagateForStyles_onceToken, &__block_literal_global_661);
                }
                BWSampleBufferFilterWithAllowedAttachedMedia(v23, (void *)psn_attachedMediaKeysToPropagateForStyles_propagatingKeysForStyles);
              }
              if (self->_zoomPIPUseNarrowerCamera)
              {
                if (objc_msgSend((id)CMGetAttachment(target, @"DepthDisabled", 0), "BOOLValue")) {
                  char v107 = 1;
                }
                else {
                  char v107 = objc_msgSend((id)CMGetAttachment(cf, @"DepthDisabled", 0), "BOOLValue");
                }
              }
              else
              {
                char v107 = 0;
              }
              int v24 = (double *)MEMORY[0x1E4F1DAD8];
              CMSampleBufferRef v114 = -[BWPreviewStitcherNode _copySampleBufferToAttachForZoomPIPFromWiderSampleBuffer:narrowerSampleBuffer:]((CMSampleBufferRef)self, cf, target);
              if (LOBYTE(self->_borderStretchScaleFactor))
              {
                int epoch_low = LOBYTE(self->_lastInputPTS.epoch);
                if (LOBYTE(self->_lastInputPTS.epoch) || !cf)
                {
LABEL_72:
                  double v27 = *v24;
                  double v26 = v24[1];
                  uint64_t v111 = (uint64_t)v20;
                  float v112 = v10;
                  if (epoch_low)
                  {
                    int v108 = -[BWPreviewStitcherNode _updateZoomStatusFromWideSampleBuffer:teleSampleBuffer:]((uint64_t)self, cf, target);
                    CFStringRef v28 = (const __CFString *)*MEMORY[0x1E4F53070];
                    if (cf)
                    {
                      CGSize v29 = (void *)CMGetAttachment(cf, (CFStringRef)*MEMORY[0x1E4F53070], 0);
                      int v30 = (void *)CMGetAttachment(target, v28, 0);
                      uint64_t v31 = *MEMORY[0x1E4F54300];
                      CGSize v32 = (void *)[v29 objectForKeyedSubscript:*MEMORY[0x1E4F54300]];
                      if (!v32)
                      {
                        CGSize v32 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
                        [v29 setObject:v32 forKeyedSubscript:v31];
                      }
                      uint64_t v33 = *MEMORY[0x1E4F54128];
                      uint64_t v34 = [v30 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
                      if (!v34)
                      {
                        fig_log_get_emitter();
                        FigDebugAssert3();
                        CFTypeRef v20 = (CFTypeRef)v111;
                        float v10 = v112;
                        CMSampleBufferRef v77 = v114;
                        goto LABEL_220;
                      }
                      uint64_t v35 = v34;
                      if (![v32 objectForKeyedSubscript:v34])
                      {
                        float v36 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
                        objc_msgSend(v36, "setObject:forKeyedSubscript:", objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E4F53F80]), *MEMORY[0x1E4F53F80]);
                        objc_msgSend(v36, "setObject:forKeyedSubscript:", objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E4F53F88]), *MEMORY[0x1E4F53F88]);
                        [v32 setObject:v36 forKeyedSubscript:v35];
                      }
                      double v37 = -[BWPreviewStitcherNode _computeBravoWideToTeleShiftFromWideSampleBuffer:teleSampleBuffer:]((uint64_t)self, cf, (uint64_t)target);
                      double v39 = v38;
LABEL_85:
                      int v41 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(cf, v28, 0), "objectForKeyedSubscript:", v33), "isEqualToString:", *MEMORY[0x1E4F52DE8]);
                      registrationEnabledouble d = self->_registrationEnabled;
                      BOOL v43 = self->_registrationEnabled;
                      if (cf) {
                        CMAttachmentBearerRef v44 = cf;
                      }
                      else {
                        CMAttachmentBearerRef v44 = target;
                      }
                      int v45 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(v44, v28, 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F53530]), "BOOLValue");
                      if (self->_deviceIsStationary != v45)
                      {
                        char v46 = BYTE1(self->_superWideFallbackRecenteringStrength);
                        if (v46) {
                          char v46 = LOBYTE(self->_superWideFallbackRecenteringStrength) != 0;
                        }
                        self->_pendingRegistrationAfterDeviceBecomesStationardouble y = v45 & (v46 ^ 1);
                        self->_deviceIsStationardouble y = v45;
                      }
                      int v113 = v41;
                      double v47 = (void *)CMGetAttachment(target, v28, 0);
                      uint64_t v48 = [v47 objectForKeyedSubscript:v33];
                      if (LOBYTE(self->_lastInputPTS.epoch))
                      {
                        if (self->_excludeStaticComponentFromAlignmentShiftsEnabled)
                        {
                          double v49 = (void *)v48;
                          CMTime time = v127;
                          CMTime time2 = *(CMTime *)(&self->_havePreheatedCI + 4);
                          if (!CMTimeCompare(&time, &time2))
                          {
                            if ([v49 isEqualToString:*MEMORY[0x1E4F52DD8]])
                            {
                              ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)target);
                              unint64_t v51 = psn_pixelBufferDimensions(ImageBuffer);
                              [(BWPreviewRegistration *)self->_registration computeApproximateCorrectionForWiderCamera:target narrowerCameraPortType:*MEMORY[0x1E4F52DF0] narrowerPixelBufferDimensions:v51 widerToNarrowerCameraScale:(float)(self->_teleBaseZoomFactor/ (float)(self->_wideBaseZoomFactor * self->_wideNondisruptiveSwitchingScaleFactor))];
                              double v53 = v52;
                              double v55 = v54;
                              objc_msgSend((id)objc_msgSend(v47, "objectForKeyedSubscript:", *MEMORY[0x1E4F540F0]), "floatValue");
                              if (v56 != 0.0)
                              {
                                double v57 = v56;
                                double v53 = v53 / v57;
                                double v55 = v55 / v57;
                              }
                              os_unfair_lock_lock(&self->_shiftCorrectionsUpdateLock);
                              for (uint64_t i = 0; i != 3; ++i)
                              {
                                uint64_t v59 = &self->_wideToTeleShiftCorrections[i];
                                v59->updatedValue.double x = v53;
                                v59->updatedValue.double y = v55;
                                v59->valueIsUpdatedouble d = 1;
                              }
                              *(CGPoint *)&self->_wideFallbackShiftRamp = self->_wideToTeleShiftCorrections[2].updatedValue;
                              os_unfair_lock_unlock(&self->_shiftCorrectionsUpdateLock);
                            }
                          }
                        }
                      }
                      if (LOBYTE(self->_lastInputPTS.epoch)) {
                        BOOL v60 = !registrationEnabled;
                      }
                      else {
                        BOOL v60 = 1;
                      }
                      if (!v60)
                      {
                        if (cf) {
                          BOOL v61 = target == 0;
                        }
                        else {
                          BOOL v61 = 1;
                        }
                        BOOL v43 = !v61 && registrationEnabled;
                      }
                      if (LOBYTE(self->_lastInputPTS.epoch)) {
                        BOOL v63 = !v43;
                      }
                      else {
                        BOOL v63 = 1;
                      }
                      if (v63) {
                        goto LABEL_188;
                      }
                      if (self->_lastRegistrationEnabled == v43 && *(void *)&v115.size.width == (void)a3) {
                        goto LABEL_188;
                      }
                      if ((!-[BWPreviewStitcherNode _currentlyZoomingOrSwitchingCameras]((BOOL)self) | v108))
                      {
                        if (!cf) {
                          goto LABEL_188;
                        }
                      }
                      else
                      {
                        if (self->_lastRegisteredFrameCaptureID) {
                          BOOL v67 = 1;
                        }
                        else {
                          BOOL v67 = cf == 0;
                        }
                        if (v67) {
                          goto LABEL_188;
                        }
                      }
                      int v68 = objc_msgSend((id)objc_msgSend(v47, "objectForKeyedSubscript:", *MEMORY[0x1E4F542D8]), "intValue");
                      int registrationFrameSkipCount = self->_registrationFrameSkipCount;
                      int v106 = v68;
                      lastRegisteredFrameCaptureuint64_t ID = self->_lastRegisteredFrameCaptureID;
                      uint64_t v71 = v68 - lastRegisteredFrameCaptureID;
                      if (v71 < 0) {
                        uint64_t v71 = lastRegisteredFrameCaptureID - v68;
                      }
                      if (v108)
                      {
                        registrationFrameSkipCount /= 4;
                      }
                      else if (HIDWORD(self->_trueVideoCaptureAdditionalZoomFactor) == 3)
                      {
                        int registrationFrameSkipCount = (int)((double)registrationFrameSkipCount * 1.5);
                      }
                      if (v71 < registrationFrameSkipCount
                        && (!self->_registerFirstFrame || lastRegisteredFrameCaptureID)
                        && !self->_pendingRegistrationAfterDeviceBecomesStationary)
                      {
                        goto LABEL_188;
                      }
                      if (v113)
                      {
                        BOOL v109 = 0;
                        BOOL v72 = BYTE4(self->_superWideFallbackRecenteringShiftOffset.y) != 0;
                      }
                      else
                      {
                        BOOL v72 = 0;
                        BOOL v109 = LOBYTE(self->_wideFallbackRecenteringShiftOffset.y) != 0;
                      }
                      if (cf) {
                        CMAttachmentBearerRef v73 = cf;
                      }
                      else {
                        CMAttachmentBearerRef v73 = target;
                      }
                      BOOL v74 = (void *)CMGetAttachment(v73, @"TotalZoomFactor", 0);
                      if (v74)
                      {
                        [v74 floatValue];
                        float v76 = v75;
                      }
                      else
                      {
                        float v76 = 1.0;
                      }
                      if (((v72 | v113 ^ 1) & 1) == 0) {
                        BOOL v72 = [self->_wideFocusDistanceFarEnoughToUseWide.name isRamping]
                      }
                           && !LOBYTE(self->_superWideFallbackShiftRamp)
                           && self->_haveSuperWideCamera
                           && self->_haveTeleCamera
                           && v76 >= self->_teleBaseZoomFactor;
                      BOOL v78 = self->_deviceIsStationary && !self->_pendingRegistrationAfterDeviceBecomesStationary;
                      if (v113)
                      {
                        BOOL v79 = !self->_superMacroRangeRegistrationTuningEnabled;
                        if (!self->_superMacroRangeRegistrationTuningEnabled)
                        {
                          if (self->_lastRegisteredFrameCaptureID)
                          {
LABEL_188:
                            v131[0] = *(float64x2_t *)MEMORY[0x1E4F1DAD8];
                            v131[1] = v131[0];
                            v131[2] = v131[0];
                            float64x2_t v110 = v131[0];
                            float64x2_t v121 = v131[0];
                            objc_msgSend((id)objc_msgSend(v47, "objectForKeyedSubscript:", *MEMORY[0x1E4F53DA0]), "floatValue");
                            float v84 = v83;
                            [(BWPreviewStitcherNode *)(uint64_t)self _updateAndGetWideRegionShifts:v121.f64 teleShift:v113 wideIsSuperWide:v43 forComputedShift:v37 registrationEnabled:v39 currentFrameRate:v83];
                            if (LOBYTE(self->_lastInputPTS.epoch)) {
                              -[BWPreviewStitcherNode _updateOverCaptureStatusWithWiderSampleBuffer:narrowerSampleBuffer:](self, cf, target);
                            }
                            memset(&v120, 0, sizeof(v120));
                            long long v118 = 0u;
                            CGSize v119 = (CGSize)0;
                            memset(&v117, 0, sizeof(v117));
                            CGPoint v116 = (CGPoint)v110;
                            CMSampleBufferRef v85 = [(BWPreviewStitcherNode *)(CMSampleBufferRef)self _newStitchedSampleBufferFromWide:(opaqueCMSampleBuffer *)target tele:v131 wideRegionsShifts:&v120 teleShift:(double *)&v118 primaryCaptureRectOut:&v116.x primaryCaptureRectBeforeCroppingOut:&v117 centerWideShiftOut:v121.f64[0] currentFrameRate:v121.f64[1] inputCropRectOut:v84];
                            float v10 = v112;
                            CMSampleBufferRef v77 = v114;
                            if (v85)
                            {
                              CMSampleBufferRef v86 = v85;
                              if (LOBYTE(self->_borderStretchScaleFactor) && v114)
                              {
                                BOOL v87 = (void *)CMGetAttachment(cf, v28, 0);
                                double v88 = (void *)CMGetAttachment(v114, v28, 0);
                                double x = v116.x;
                                if (v116.x != v27 || (double x = v116.y, v116.y != v26))
                                {
                                  if (objc_msgSend((id)objc_msgSend(v87, "objectForKeyedSubscript:", v33, x), "isEqualToString:", objc_msgSend(v88, "objectForKeyedSubscript:", v33)))
                                  {
                                    CFDictionaryRef DictionaryRepresentation = CGPointCreateDictionaryRepresentation(v116);
                                    CMSetAttachment(v114, @"NarrowerCameraPreviewAlignmentShift", DictionaryRepresentation, 1u);
                                    if (DictionaryRepresentation) {
                                      CFRelease(DictionaryRepresentation);
                                    }
                                  }
                                }
                                BWSampleBufferSetAttachedMedia(v86, 0x1EFA74680, (uint64_t)v114);
                              }
                              CFTypeRef v20 = (CFTypeRef)v111;
                              if (v111) {
                                BWSampleBufferSetAttachedMedia(v86, @"Depth", v111);
                              }
                              if (self->_zoomPIPUseNarrowerCamera
                                && ((v107 & 1) != 0 || BYTE4(self->_superWideFallbackRecenteringShiftOffset.y)))
                              {
                                CMSetAttachment(v86, @"DepthDisabled", MEMORY[0x1E4F1CC38], 1u);
                              }
                              if (*(&self->_zoomPIPUseNarrowerCamera + 1))
                              {
                                float v91 = 0;
                                transitionReferenceSampleBuffer = self->_transitionReferenceSampleBuffer;
                                if (transitionReferenceSampleBuffer) {
                                  int v93 = 8;
                                }
                                else {
                                  int v93 = 18;
                                }
                                int zoomPIPMinimumUIZoomFactor_low = LOBYTE(self->_zoomPIPMinimumUIZoomFactor);
                                if (LOBYTE(self->_zoomPIPMinimumUIZoomFactor) && transitionReferenceSampleBuffer)
                                {
                                  CFRetain(self->_transitionReferenceSampleBuffer);
                                  ++LODWORD(self->_transitionReferenceLearnedCoefficientsSampleBuffer);
                                  int zoomPIPMinimumUIZoomFactor_low = LOBYTE(self->_zoomPIPMinimumUIZoomFactor);
                                  float v91 = transitionReferenceSampleBuffer;
                                }
                                if (zoomPIPMinimumUIZoomFactor_low)
                                {
                                  float64x2_t v95 = self->_transitionReferenceSampleBuffer;
                                  if (v95)
                                  {
                                    if (SLODWORD(self->_transitionReferenceLearnedCoefficientsSampleBuffer) >= v93)
                                    {
                                      CFRelease(v95);
                                      self->_transitionReferenceSampleBuffer = 0;
                                    }
                                  }
                                }
                                CFDictionaryRef v96 = CGRectCreateDictionaryRepresentation(v117);
                                CMSetAttachment(v86, (CFStringRef)*MEMORY[0x1E4F53040], v96, 1u);
                                if (v96) {
                                  CFRelease(v96);
                                }
                                CMSetAttachment(v86, @"PreviewStitcherPrimaryCameraTransitionInProgress", (CFTypeRef)[NSNumber numberWithInt:self->_teleOpacityRamp != 0], 1u);
                                CMSampleBufferRef v77 = v114;
                              }
                              else
                              {
                                float v91 = 0;
                              }
                              CGPoint origin = v120.origin;
                              CGSize size = v120.size;
                              long long v100 = v118;
                              *(void *)&v115.origin.double x = v118;
                              CGSize v101 = v119;
                              CGFloat v102 = CMSampleBufferGetImageBuffer(v86);
                              CVPixelBufferGetWidth(v102);
                              CVPixelBufferGetHeight(v102);
                              FigCaptureMetadataUtilitiesNormalizeCropRect(origin.x, origin.y, size.width, size.height);
                              CFDictionaryRef v103 = CGRectCreateDictionaryRepresentation(v133);
                              CMSetAttachment(v86, (CFStringRef)*MEMORY[0x1E4F530D0], v103, 1u);
                              if (v103) {
                                CFRelease(v103);
                              }
                              v134.origin.double x = v115.origin.x;
                              v134.origin.double y = *((CGFloat *)&v100 + 1);
                              v134.CGSize size = v101;
                              CFDictionaryRef v104 = CGRectCreateDictionaryRepresentation(v134);
                              CMSetAttachment(v86, (CFStringRef)*MEMORY[0x1E4F530D8], v104, 1u);
                              if (v104) {
                                CFRelease(v104);
                              }
                              if (!LOBYTE(self->_zoomPIPMinimumUIZoomFactor))
                              {
                                if (!BYTE3(self->_blackFilledBorderRectsBySurfaceID)
                                  && BYTE2(self->_narrowerCameraFoVFillsOverCapture.name))
                                {
                                  CMSetAttachment(v86, @"SmartStyleApplyWithIdentityCoefficients", MEMORY[0x1E4F1CC38], 1u);
                                }
                                if (BYTE2(self->_blackFilledBorderRectsBySurfaceID)
                                  && !BYTE3(self->_blackFilledBorderRectsBySurfaceID))
                                {
                                  if (!BYTE1(self->_zoomPIPMinimumUIZoomFactor))
                                  {
                                    CMTime time = v127;
                                    float v105 = CMTimeGetSeconds(&time) + 0.3;
                                    *(float *)&self->_previewTapRegisteredouble d = v105;
                                    BYTE1(self->_zoomPIPMinimumUIZoomFactor) = 1;
                                  }
                                  CMTime time = v127;
                                  if (CMTimeGetSeconds(&time) < *(float *)&self->_previewTapRegistered) {
                                    CMSetAttachment(v86, @"SmartStyleApplyWithIdentityCoefficients", MEMORY[0x1E4F1CC38], 1u);
                                  }
                                }
                              }
                              [(BWNodeOutput *)self->super._output emitSampleBuffer:v86];
                              char v97 = 0;
                              goto LABEL_228;
                            }
                            CFTypeRef v20 = (CFTypeRef)v111;
LABEL_220:
                            CMSampleBufferGetPresentationTimeStamp((CMTime *)&v115.size.height, (CMSampleBufferRef)v10);
                            [(BWNodeOutput *)self->super._output emitDroppedSample:+[BWDroppedSample newDroppedSampleWithReason:0x1EFA67F20 pts:&v115.size.height]];
                            CMSampleBufferRef v86 = 0;
                            float v91 = 0;
                            char v97 = 1;
LABEL_228:
                            if (*(opaqueCMSampleBuffer **)&v115.size.width == a3 && v10) {
                              CFRelease(v10);
                            }
                            if (cf) {
                              CFRelease(cf);
                            }
                            if (target) {
                              CFRelease(target);
                            }
                            if (v77) {
                              CFRelease(v77);
                            }
                            if (v20) {
                              CFRelease(v20);
                            }
                            if (v91) {
                              CFRelease(v91);
                            }
                            if (*MEMORY[0x1E4F1EBA8] == 1)
                            {
                              objc_msgSend((id)CMGetAttachment(v86, @"CAContextFencePortGenerationID", 0), "integerValue");
                              kdebug_trace();
                            }
                            if ((v97 & 1) == 0) {
                              CFRelease(v86);
                            }
                            return;
                          }
                          os_unfair_lock_lock(&self->_shiftCorrectionsUpdateLock);
                          self->_lastRegisteredFrameCaptureuint64_t ID = self->_superWideToWideShiftCorrections[2].registeredFrameCaptureID;
                          os_unfair_lock_unlock(&self->_shiftCorrectionsUpdateLock);
                        }
                        if (!self->_lastRegisteredFrameCaptureID)
                        {
                          if ((HIDWORD(self->_wideFallbackRecenteringShiftOffset.y) - 1) <= 1)
                          {
                            if (BYTE4(self->_superWideFallbackRecenteringShiftOffset.y)) {
                              uint64_t v80 = 1;
                            }
                            else {
                              uint64_t v80 = 2;
                            }
                            goto LABEL_183;
                          }
LABEL_177:
                          if (BYTE1(self->_superWideFallbackRecenteringStrength))
                          {
                            int v81 = v113;
                            if (!LOBYTE(self->_superWideFallbackRecenteringStrength)) {
                              int v81 = 0;
                            }
                            int v82 = v106;
                            uint64_t v80 = v81 == 1 && BYTE4(self->_superWideFallbackRecenteringShiftOffset.y) == 0;
                            goto LABEL_187;
                          }
                          uint64_t v80 = 0;
LABEL_183:
                          int v82 = v106;
LABEL_187:
                          self->_lastRegisteredFrameCaptureuint64_t ID = v82;
                          self->_pendingRegistrationAfterDeviceBecomesStationardouble y = 0;
                          [(BWPreviewStitcherNode *)(uint64_t)self _updateShiftCorrectionsAsyncFromComputedShift:(void *)target byRegisteringWide:v80 tele:v37 macroTransitionType:v39];
                          goto LABEL_188;
                        }
                      }
                      else
                      {
                        if (!self->_lastRegisteredFrameCaptureID) {
                          goto LABEL_177;
                        }
                        BOOL v79 = 0;
                      }
                      if (v109 || v72 || v78 || v79) {
                        goto LABEL_188;
                      }
                      goto LABEL_177;
                    }
                    uint64_t v33 = *MEMORY[0x1E4F54128];
                  }
                  else
                  {
                    if (!self->_lastNarrowerPortType) {
                      [(BWPreviewStitcherDelegate *)self->_delegate previewStitcher:self overCaptureStatusDidChange:HIDWORD(self->_trueVideoCaptureAdditionalZoomFactor)];
                    }
                    CFStringRef v28 = (const __CFString *)*MEMORY[0x1E4F53070];
                    CGSize v40 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);

                    uint64_t v33 = *MEMORY[0x1E4F54128];
                    int v108 = 0;
                    self->_lastNarrowerPortType = (NSString *)(id)[v40 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
                  }
                  double v37 = v27;
                  double v39 = v26;
                  goto LABEL_85;
                }
                CFRelease(cf);
                CMAttachmentBearerRef cf = 0;
              }
              int epoch_low = LOBYTE(self->_lastInputPTS.epoch);
              goto LABEL_72;
            }
          }
          else
          {
            CMAttachmentBearerRef target = 0;
          }
          fig_log_get_emitter();
          FigDebugAssert3();
          CMSampleBufferRef v77 = 0;
          goto LABEL_220;
        }
        uint64_t v17 = *(void *)&self->_thermalPressureIsCritical;
        uint64_t v18 = mach_absolute_time();
        if (v17)
        {
          if ((float)((float)(FigHostTimeToNanoseconds() / 1000) / 1000000.0) >= 0.037)
          {
            LOBYTE(self->_trueVideoCaptureAdditionalZoomFactor) = 0;
            goto LABEL_45;
          }
        }
        else
        {
          *(void *)&self->_thermalPressureIsCritical = v18;
        }
LABEL_62:
        int v15 = *MEMORY[0x1E4F1EBA8];
LABEL_63:
        if (v15 == 1) {
          kdebug_trace();
        }
        return;
      }
LABEL_34:
      *(void *)&self->_multiCameraStitchingEnabledouble d = UpTimeNanoseconds;
      goto LABEL_35;
    }
LABEL_33:
    BYTE1(self->_lastInputPTS.epoch) = 1;
    uint64_t UpTimeNanoseconds = FigGetUpTimeNanoseconds();
    goto LABEL_34;
  }
  if (*v6 == 1) {
    kdebug_trace();
  }
  if ([*(id *)&self->_superMacroEdgeFeatheringShowBlurMask count])
  {
    metalSubmissionAndCompletionQueue = self->_metalSubmissionAndCompletionQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__BWPreviewStitcherNode_renderSampleBuffer_forInput___block_invoke;
    block[3] = &unk_1E5C24430;
    block[4] = self;
    dispatch_async(metalSubmissionAndCompletionQueue, block);
  }
}

- _setOverCaptureStatus:(_DWORD *)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (result[281] != a2)
    {
      [result overCaptureStatusString];
      v3[281] = a2;
      uint64_t v4 = (void *)*((void *)v3 + 47);
      return (_DWORD *)[v4 previewStitcher:v3 overCaptureStatusDidChange:a2];
    }
  }
  return result;
}

- (CMSampleBufferRef)_copySampleBufferToAttachForZoomPIPFromWiderSampleBuffer:(const void *)a3 narrowerSampleBuffer:
{
  if (result)
  {
    CMSampleBufferRef v3 = result;
    CMSampleBufferRef sampleBufferOut = 0;
    if (!*((unsigned char *)result + 1492)) {
      return 0;
    }
    if (*((unsigned char *)result + 1494)) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = a2 == 0;
    }
    if (v6) {
      CFStringRef v7 = a3;
    }
    else {
      CFStringRef v7 = a2;
    }
    int v8 = (void *)CMGetAttachment(v7, @"UIZoomFactor", 0);
    float v9 = 1.0;
    float v10 = 1.0;
    if (v8)
    {
      [v8 floatValue];
      float v10 = v11;
    }
    CFStringRef v12 = (const __CFString *)*MEMORY[0x1E4F53070];
    int v13 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    uint64_t v14 = *MEMORY[0x1E4F54128];
    int v15 = (void *)[v13 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
    CFTypeRef v16 = CMGetAttachment(a2, v12, 0);
    if ([v15 isEqualToString:*MEMORY[0x1E4F52DD8]]) {
      uint64_t v17 = v13;
    }
    else {
      uint64_t v17 = (void *)v16;
    }
    objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E4F540F0]), "floatValue");
    double result = 0;
    if (v18 != 0.0) {
      float v9 = v18;
    }
    float v19 = *((float *)v3 + 374);
    if (v19 == 0.0 || v10 > v19)
    {
      int v21 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(v7, v12, 0), "objectForKeyedSubscript:", v14), "isEqualToString:", *MEMORY[0x1E4F52DE8])? 0: v7;
      CMAttachmentBearerRef v22 = *((unsigned char *)v3 + 1500) ? 0 : (void *)v21;
      int v23 = objc_msgSend((id)CMGetAttachment(v22, @"OverCaptureSlaveStreamStatus", 0), "intValue");
      double result = 0;
      unsigned int v24 = v23 & 0xFFFFFFFE;
      if (v22 && v24 != 2)
      {
        int v26 = objc_msgSend((id)CMGetAttachment(v22, (CFStringRef)*MEMORY[0x1E4F55D38], 0), "intValue");
        double result = 0;
        if (v26 <= 2)
        {
          if (!*((unsigned char *)v3 + 1494) && v9 != 2.0) {
            return 0;
          }
          BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)v22, &sampleBufferOut);
          BWSampleBufferRemoveAllAttachedMedia(sampleBufferOut);
          return sampleBufferOut;
        }
      }
    }
  }
  return result;
}

- (BOOL)waitsForFencedUpdateBeforeFirstEmit
{
  return LOBYTE(self->_trueVideoCaptureAdditionalZoomFactor);
}

- (void)setPrimaryCaptureRectAspectRatio:(double)a3 center:(CGPoint)a4 trueVideoTransitionPercentComplete:(double)a5 trueVideoTransitionReferenceSampleBuffer:(opaqueCMSampleBuffer *)a6 fencePortSendRight:(id)a7
{
  CGFloat x = a4.x;
  v48.i32[0] = [(BWVideoFormat *)[(BWNodeOutput *)self->super._output videoFormat] width];
  v48.i32[1] = [(BWVideoFormat *)[(BWNodeOutput *)self->super._output videoFormat] height];
  FigCaptureSwapVideoDimensionsFor90Or270Rotation(&v48, self->_rotationDegrees);
  int v13 = v48.i32[0];
  if (BYTE2(self->_blackFilledBorderRectsBySurfaceID)) {
    uint64_t v14 = a6;
  }
  else {
    uint64_t v14 = 0;
  }
  os_unfair_lock_lock(&self->_configurationLock);
  int v15 = BYTE3(self->_blackFilledBorderRectsBySurfaceID);
  double primaryCameraAspectRatio = 0.999;
  if (a5 < 0.999 && v15 != 0) {
    goto LABEL_25;
  }
  if (!BYTE3(self->_blackFilledBorderRectsBySurfaceID))
  {
    if (a5 <= 0.0)
    {
      if (BYTE1(self->_lastInputPTS.epoch))
      {
        if (v14) {
          BOOL v19 = 0;
        }
        else {
          BOOL v19 = BYTE4(self->_narrowerCameraFoVFillsOverCapture.name) == 0;
        }
        if (!v19) {
          goto LABEL_25;
        }
      }
      else if (v14)
      {
        goto LABEL_25;
      }
      double primaryCameraAspectRatio = self->_primaryCameraAspectRatio;
      if (primaryCameraAspectRatio == a3 || !BYTE4(self->_narrowerCameraFoVFillsOverCapture.name)) {
        goto LABEL_10;
      }
    }
LABEL_25:
    BOOL v18 = 1;
    goto LABEL_26;
  }
LABEL_10:
  if (BYTE5(self->_narrowerCameraFoVFillsOverCapture.name))
  {
    LOBYTE(primaryCameraAspectRatio) = BYTE6(self->_narrowerCameraFoVFillsOverCapture.name);
    BOOL v18 = v15 == 0;
    if ((double)*(unint64_t *)&primaryCameraAspectRatio > a3) {
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }
LABEL_26:
  int v20 = a3 >= 1.33323333 && v18;
  if (BYTE4(self->_narrowerCameraFoVFillsOverCapture.name) == v20
    || (BYTE4(self->_narrowerCameraFoVFillsOverCapture.name) = v20, BYTE3(self->_blackFilledBorderRectsBySurfaceID)))
  {
    int v21 = 0;
  }
  else if (BYTE2(self->_blackFilledBorderRectsBySurfaceID))
  {
    int v21 = v20 ^ 1;
  }
  else
  {
    int v21 = 0;
  }
  CMAttachmentBearerRef v22 = objc_msgSend((id)CMGetAttachment(v14, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]);
  if (v14)
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(v14);
    if (ImageBuffer) {
      LOBYTE(ImageBuffer) = BWPixelBufferIsHDR(ImageBuffer);
    }
  }
  else
  {
    LOBYTE(ImageBuffer) = 0;
  }
  double v25 = (double)v13;
  if (BYTE1(self->_trueVideoHDRtoSDRBlendRamp)) {
    char v26 = 0;
  }
  else {
    char v26 = (char)ImageBuffer;
  }
  if (!v14 || *(void *)&self->_allowEdgeInsetDuringTrueVideoTransitions) {
    goto LABEL_103;
  }
  if (LOBYTE(self->_trueVideoHDRtoSDRBlendRamp)) {
    BOOL v27 = 0;
  }
  else {
    BOOL v27 = *(void *)&self->_transitionReferenceLearnedCoefficientsSampleBufferApplyCount == 0;
  }
  if (!v27) {
    char v26 = 1;
  }
  if (v26)
  {
LABEL_103:
    if (v20)
    {
      if (BYTE3(self->_blackFilledBorderRectsBySurfaceID))
      {
        if (BYTE1(self->_trueVideoHDRtoSDRBlendRamp))
        {
          double v23 = *(double *)&self->_superWideSensorCenterOffsetEnabled;
          if (v23 > a5 && !LOBYTE(self->_trueVideoHDRtoSDRBlendRamp) && !self->_transitionReferenceOpacityRamp)
          {
            if (BYTE4(self->_blackFilledBorderRectsBySurfaceID)) {
              uint64_t v28 = 7;
            }
            else {
              uint64_t v28 = 12;
            }
            CGSize v29 = [[BWRamp alloc] initWithName:@"TrueVideoHDRtoSDRTransitionRamp"];
            self->_transitionReferenceOpacityRamp = v29;
            LODWORD(v30) = 1045220557;
            LODWORD(v31) = 1.0;
            [(BWRamp *)v29 startRampFrom:v28 to:0 iterations:v31 shape:v30];
          }
        }
      }
    }
  }
  else
  {
    *(void *)&self->_allowEdgeInsetDuringTrueVideoTransitions = CFRetain(v14);
    *(void *)&self->_transitionReferenceLearnedCoefficientsSampleBufferApplyCount = [[BWRamp alloc] initWithName:@"TrueVideoTransitionOpacityRamp"];
    AttachedMedidouble a = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(v14, 0x1EFA74840);
    if (LOBYTE(self->_zoomPIPMinimumUIZoomFactor) && AttachedMedia)
    {
      transitionReferenceSampleBuffer = self->_transitionReferenceSampleBuffer;
      self->_transitionReferenceSampleBuffer = AttachedMedia;
      CFRetain(AttachedMedia);
      if (transitionReferenceSampleBuffer) {
        CFRelease(transitionReferenceSampleBuffer);
      }
      LODWORD(self->_transitionReferenceLearnedCoefficientsSampleBuffer) = 0;
    }
    if (BYTE3(self->_blackFilledBorderRectsBySurfaceID)) {
      float v34 = 147.0;
    }
    else {
      float v34 = 166.0;
    }
    int v35 = objc_msgSend((id)CMGetAttachment(v14, @"TrueVideoTransitionLargeSphereTravelDetected", 0), "BOOLValue");
    if (BYTE4(self->_blackFilledBorderRectsBySurfaceID)
      || (int v40 = v35, [v22 isEqual:*MEMORY[0x1E4F52DF8]]))
    {
      double v41 = v34 * 0.843373494;
      *(float *)&double v36 = v41;
    }
    else if (v40)
    {
      *(float *)&double v36 = v34 + -4.0;
    }
    else
    {
      *(float *)&double v36 = v34;
    }
    LODWORD(v38) = 981668463;
    LODWORD(v39) = 1114636288;
    LODWORD(v41) = 1.0;
    LODWORD(v37) = 24.0;
    [*(id *)&self->_transitionReferenceLearnedCoefficientsSampleBufferApplyCount startSpringRampFrom:v41 to:0.0 withTension:v36 friction:v37 snapFraction:v38 frameRate:v39];
  }
  double v42 = (x + -0.5) * v25;
  int v43 = BYTE3(self->_blackFilledBorderRectsBySurfaceID);
  if (v14 && BYTE3(self->_blackFilledBorderRectsBySurfaceID))
  {
    if ([v22 isEqual:*MEMORY[0x1E4F52DF8]])
    {
      CMAttachmentBearerRef v44 = (void *)CMGetAttachment(v14, @"TotalZoomFactor", 0);
      if (v44)
      {
        [v44 floatValue];
        double v46 = v45;
      }
      else
      {
        double v46 = 1.0;
      }
      double v23 = *(double *)&self->_forceBlackFillBorderEnabled / v46;
      *(double *)&self->_forceBlackFillBorderEnabledouble d = v23;
    }
    int v43 = BYTE3(self->_blackFilledBorderRectsBySurfaceID);
  }
  if (v43
    || !BYTE4(self->_narrowerCameraFoVFillsOverCapture.name)
    || (double v23 = *(double *)&self->_superWideSensorCenterOffsetEnabled, v23 <= 0.0)
    || v23 >= a5
    || (double v23 = self->_primaryCameraAspectRatio, v23 >= a3))
  {
    id v47 = a7;
    if (BYTE5(self->_narrowerCameraFoVFillsOverCapture.name))
    {
      LOBYTE(v23) = BYTE6(self->_narrowerCameraFoVFillsOverCapture.name);
      if ((double)*(unint64_t *)&v23 > a3) {
        BYTE5(self->_narrowerCameraFoVFillsOverCapture.name) = 0;
      }
    }
  }
  else
  {
    BYTE5(self->_narrowerCameraFoVFillsOverCapture.name) = 1;
    BYTE6(self->_narrowerCameraFoVFillsOverCapture.name) = a3 != 0.0;
    id v47 = a7;
  }
  *(double *)&self->_superWideSensorCenterOffsetEnabledouble d = a5;
  self->_double primaryCameraAspectRatio = a3;
  self->_double primaryCaptureRectCenterX = x;
  self->_primaryCaptureRectCenterXPixelOffset = (int)v42;
  os_unfair_lock_unlock(&self->_configurationLock);
  if (v47)
  {
    objc_msgSend(*(id *)&self->_superMacroEdgeFeatheringShowBlurMask, "enqueueFencedAnimation:", +[BWPreviewStitcherFencedAnimationInfo fencedAnimationInfoWithAspectRatio:centerX:centerXPixelOffset:fencePortSendRight:](BWPreviewStitcherFencedAnimationInfo, "fencedAnimationInfoWithAspectRatio:centerX:centerXPixelOffset:fencePortSendRight:", (int)v42, v47, a3, x));
    if (*MEMORY[0x1E4F1EBA8] == 1)
    {
      [*(id *)&self->_superMacroEdgeFeatheringShowBlurMask count];
      [v47 port];
      kdebug_trace();
    }
    if (LOBYTE(self->_trueVideoCaptureAdditionalZoomFactor)) {
      LOBYTE(self->_trueVideoCaptureAdditionalZoomFactor) = 0;
    }
    -[BWPreviewStitcherNode _restitchAndEmitLastInputForAspectAndCenterChange]((uint64_t)self);
  }
  if (v21) {
    [(BWPreviewStitcherDelegate *)self->_delegate previewStitcherTrueVideoExitTransitionDidComplete:self];
  }
}

- (void)_restitchAndEmitLastInputForAspectAndCenterChange
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 388));
    uint64_t v2 = *(const void **)(a1 + 1008);
    if (v2)
    {
      CFTypeRef v3 = CFRetain(v2);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 388));
      if (v3)
      {
        id v4 = +[BWNodeSampleBufferMessage newMessageWithSampleBuffer:v3];
        objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "connection"), "consumeMessage:fromOutput:", v4, objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "connection"), "output"));

        CFRelease(v3);
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 388));
    }
  }
}

- (double)primaryCaptureRectCenterX
{
  return self->_primaryCaptureRectCenterX;
}

- (double)primaryCameraAspectRatio
{
  p_configurationLocuint64_t k = &self->_configurationLock;
  os_unfair_lock_lock(&self->_configurationLock);
  double primaryCameraAspectRatio = self->_primaryCameraAspectRatio;
  os_unfair_lock_unlock(p_configurationLock);
  return primaryCameraAspectRatio;
}

- (uint64_t)_featheredImageWithTeleImage:(uint64_t)a3 wideImage:(int)a4 teleClipRect:(CGFloat)a5 wideClipRect:(CGFloat)a6 zoomingIn:(CGFloat)a7 progress:(CGFloat)a8
{
  if (!a1) {
    return 0;
  }
  if (*(unsigned char *)(a1 + 965)) {
    a2 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithColor:", objc_msgSend(MEMORY[0x1E4F1E008], "redColor"));
  }
  double v25 = &OBJC_IVAR___BWPreviewStitcherNode__zoomOutFeatheringInnerRadiusStart;
  if (a13 <= 1.0) {
    float v26 = a13;
  }
  else {
    float v26 = 1.0;
  }
  if (v26 < 0.0) {
    float v26 = 0.0;
  }
  if (a4) {
    double v25 = &OBJC_IVAR___BWPreviewStitcherNode__zoomInFeatheringInnerRadiusStart;
  }
  BOOL v27 = &OBJC_IVAR___BWPreviewStitcherNode__zoomOutFeatheringInnerRadiusEnd;
  if (a4) {
    BOOL v27 = &OBJC_IVAR___BWPreviewStitcherNode__zoomInFeatheringInnerRadiusEnd;
  }
  uint64_t v28 = &OBJC_IVAR___BWPreviewStitcherNode__zoomOutFeatheringOuterRadiusStart;
  if (a4) {
    uint64_t v28 = &OBJC_IVAR___BWPreviewStitcherNode__zoomInFeatheringOuterRadiusStart;
  }
  CGSize v29 = &OBJC_IVAR___BWPreviewStitcherNode__zoomOutFeatheringOuterRadiusEnd;
  if (a4) {
    CGSize v29 = &OBJC_IVAR___BWPreviewStitcherNode__zoomInFeatheringOuterRadiusEnd;
  }
  float v30 = *(float *)(a1 + *v25) + (float)((float)(*(float *)(a1 + *v27) - *(float *)(a1 + *v25)) * v26);
  float v31 = *(float *)(a1 + *v28) + (float)((float)(*(float *)(a1 + *v29) - *(float *)(a1 + *v28)) * v26);
  float v32 = 1.0 - a13;
  if (a4) {
    float v32 = a13;
  }
  int v33 = *(unsigned __int8 *)(a1 + 1004);
  double v34 = v32;
  int v35 = (void *)[MEMORY[0x1E4F1E040] radialGradientFilter];
  v68.origin.CGFloat x = a5;
  v68.origin.double y = a6;
  v68.size.CGFloat width = a7;
  v68.size.CGFloat height = a8;
  double MidX = CGRectGetMidX(v68);
  v69.origin.CGFloat x = a5;
  v69.origin.double y = a6;
  v69.size.CGFloat width = a7;
  v69.size.CGFloat height = a8;
  objc_msgSend(v35, "setCenter:", MidX, CGRectGetMidY(v69));
  if (a7 >= a8) {
    double v37 = a8;
  }
  else {
    double v37 = a7;
  }
  double v38 = v37 * v30 * 0.5;
  *(float *)&double v38 = v38;
  [v35 setRadius0:v38];
  double v39 = v37 * v31 * 0.5;
  *(float *)&double v39 = v39;
  [v35 setRadius1:v39];
  int v40 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC88]);
  objc_msgSend(v35, "setColor0:", objc_msgSend(MEMORY[0x1E4F1E008], "colorWithRed:green:blue:colorSpace:", v40, v34, v34, v34));
  double v41 = 0.0;
  if (!v33) {
    double v41 = v34;
  }
  objc_msgSend(v35, "setColor1:", objc_msgSend(MEMORY[0x1E4F1E008], "colorWithRed:green:blue:colorSpace:", v40, v41, v41, v41));
  double v42 = (void *)[v35 outputImage];
  CGColorSpaceRelease(v40);
  long long v61 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v67.double a = *MEMORY[0x1E4F1DAB8];
  long long v60 = *(_OWORD *)&v67.a;
  *(_OWORD *)&v67.double c = v61;
  *(_OWORD *)&v67.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v59 = *(_OWORD *)&v67.tx;
  [v35 center];
  CGFloat v44 = -v43;
  [v35 center];
  CGAffineTransformMakeTranslation(&t2, v44, -v45);
  *(_OWORD *)&t1.double a = v60;
  *(_OWORD *)&t1.double c = v61;
  *(_OWORD *)&t1.tCGFloat x = v59;
  CGAffineTransformConcat(&v67, &t1, &t2);
  CGAffineTransformMakeScale(&v64, fmax(a7 / v37 * 0.949999988, 1.0), fmax(a8 / v37 * 0.949999988, 1.0));
  CGAffineTransform v63 = v67;
  CGAffineTransformConcat(&t1, &v63, &v64);
  CGAffineTransform v67 = t1;
  [v35 center];
  CGFloat v47 = v46;
  [v35 center];
  CGAffineTransformMakeTranslation(&v63, v47, v48);
  CGAffineTransform v62 = v67;
  CGAffineTransformConcat(&t1, &v62, &v63);
  CGAffineTransform v67 = t1;
  uint64_t v49 = objc_msgSend((id)objc_msgSend(v42, "imageByApplyingTransform:", &t1), "imageByCroppingToRect:", a5, a6, a7, a8);
  double v50 = (void *)[MEMORY[0x1E4F1E040] blendWithMaskFilter];
  [v50 setInputImage:a2];
  [v50 setMaskImage:v49];
  [v50 setBackgroundImage:a3];
  unint64_t v51 = (void *)[v50 outputImage];
  if (*(unsigned char *)(a1 + 1441) && *(unsigned char *)(a1 + 904) && !*(unsigned char *)(a1 + 1388))
  {
    float v52 = *(float *)(a1 + 1444);
    [*(id *)(a1 + 1352) currentValue];
    return psn_imageWithBlurredEdges(v51, *(unsigned char *)(a1 + 1448), a5, a6, a7, a8, a9, a10, a11, a12, v52, v53);
  }
  return (uint64_t)v51;
}

- (uint64_t)_renderOpacityRampToPixelBuffer:(__CVBuffer *)a3 bounds:(__CVBuffer *)a4 withWidePixelBuffer:(int)a5 telePixelBuffer:(double)a6 zoomingIn:(double)a7 progress:(double)a8 teleBounds:(double)a9 teleShift:(float)a10
{
  v42[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v25 = result;
    -[BWPreviewStitcherNode _initTeleOpacityCIContextWithColorManagementEnabled:](result, *(unsigned char *)(result + 1625));
    uint64_t v41 = *MEMORY[0x1E4F1E3A8];
    v42[0] = MEMORY[0x1E4F1CC38];
    uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
    uint64_t v27 = [MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:a3 options:v26];
    uint64_t v28 = (void *)[MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:a4 options:v26];
    uint64_t v29 = [v28 colorSpace];
    double v30 = (double)CVPixelBufferGetHeight(a4) - a17;
    float v31 = objc_msgSend(v28, "imageByCroppingToRect:", a14, v30, a16, a17);
    CGAffineTransformMakeTranslation(&v40, a18, -a19);
    uint64_t v32 = [v31 imageByApplyingTransform:&v40];
    size_t Height = CVPixelBufferGetHeight(a3);
    uint64_t v34 = -[BWPreviewStitcherNode _featheredImageWithTeleImage:wideImage:teleClipRect:wideClipRect:zoomingIn:progress:](v25, v32, v27, a5, a14 + a18, v30 - a19, a16, a17, a6, (double)Height - a9, a8, a9, a10);
    double v35 = (double)CVPixelBufferGetHeight(a2) - a9;
    id v36 = (id)[objc_alloc(MEMORY[0x1E4F1E070]) initWithPixelBuffer:a2];
    [v36 setColorSpace:v29];
    uint64_t v39 = 0;
    return objc_msgSend((id)objc_msgSend(*(id *)(v25 + 896), "startTaskToRender:fromRect:toDestination:atPoint:error:", v34, v36, 0, a6, v35, a8, a9, a6, v35), "waitUntilCompletedAndReturnError:", &v39);
  }
  return result;
}

- (id)overCaptureStatusString
{
  uint64_t trueVideoCaptureAdditionalZoomFactor_high = SHIDWORD(self->_trueVideoCaptureAdditionalZoomFactor);
  if (trueVideoCaptureAdditionalZoomFactor_high > 5) {
    return 0;
  }
  else {
    return off_1E5C25428[trueVideoCaptureAdditionalZoomFactor_high];
  }
}

- (int32x2_t)_teleOpacityPool
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    double result = (int32x2_t *)result[109];
    if (!result)
    {
      v8.i32[0] = objc_msgSend((id)objc_msgSend(*(id *)&v1[2], "videoFormat"), "width");
      v8.i32[1] = objc_msgSend((id)objc_msgSend(*(id *)&v1[2], "videoFormat"), "height");
      unsigned int v2 = objc_msgSend((id)objc_msgSend(*(id *)&v1[2], "videoFormat", COERCE_DOUBLE(FigCaptureSwapVideoDimensionsFor90Or270Rotation(&v8, v1[13].i32[0]))), "pixelFormat");
      if (v2 == 1882468912) {
        uint64_t v3 = 2016686640;
      }
      else {
        uint64_t v3 = v2;
      }
      uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)&v1[2], "videoFormat"), "colorSpaceProperties");
      BOOL v5 = +[BWMemoryPool sharedMemoryPool];
      int32x2_t v6 = v8;
      CFStringRef v7 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWVideoFormatRequirements *)v7 setWidth:(int)FigCaptureRoundFloatToMultipleOf(2, (float)v6.i32[0])];
      [(BWVideoFormatRequirements *)v7 setHeight:(int)FigCaptureRoundFloatToMultipleOf(2, (float)v6.i32[1])];
      v11[0] = [NSNumber numberWithUnsignedInt:v3];
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v7, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1]);
      uint64_t v10 = [NSNumber numberWithInt:v4];
      -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v7, "setSupportedColorSpaceProperties:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1]);
      float v9 = v7;
      v1[109] = (int32x2_t)-[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1]), 3, @"BWPreviewStitcherNode tele opacity ramp", v5);
      v1[111] = v8;
      return (int32x2_t *)v1[109];
    }
  }
  return result;
}

- (void)_initTeleOpacityCIContextWithColorManagementEnabled:(uint64_t)a1
{
  if (a1 && !*(void *)(a1 + 896))
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v4 = [NSNumber numberWithInt:*MEMORY[0x1E4F1E2F0]];
    [v8 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F1E248]];
    [v8 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F1E1E0]];
    [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F1E220]];
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BWMemoryPool poolIdentifier](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "poolIdentifier")), @"kCIContextIOSurfaceMemoryPoolID");
    if ((a2 & 1) == 0)
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
      [v8 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F1E240]];
    }
    id v6 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F55F60], "metalDevice"), "newCommandQueue");
    uint64_t v7 = *(void *)(a1 + 1640);
    if (!v7)
    {
      uint64_t v7 = FigDispatchQueueCreateWithPriority();
      *(void *)(a1 + 1640) = v7;
    }
    [v6 setCompletionQueue:v7];
    [v6 setSubmissionQueue:v7];
    *(void *)(a1 + 896) = (id)[MEMORY[0x1E4F1E018] contextWithMTLCommandQueue:v6 options:v8];
  }
}

+ (void)initialize
{
}

- (BWPreviewStitcherNode)initWithStitchingDisabledAndZoomPIPOverlayEnabled:(BOOL)a3 zoomPIPMinimumUIZoomFactor:(float)a4 zoomPIPSingleStreamModeEnabled:(BOOL)a5 propagateDepth:(BOOL)a6 propagateStyles:(BOOL)a7 parallaxMitigationBasedOnZoomFactorEnabled:(BOOL)a8 preallocateOutputBufferPool:(BOOL)a9
{
  BYTE5(v10) = a9;
  BYTE4(v10) = a5;
  BYTE3(v10) = a3;
  BYTE2(v10) = a8;
  BYTE1(v10) = a7;
  LOBYTE(v10) = a6;
  return -[BWPreviewStitcherNode initWithCameraInfoByPortType:sensorBinningFactor:inputBuffersHaveHorizontalOverscanOnly:registrationType:registrationMetalCommandQueue:excludeStaticComponentFromAlignmentShifts:propagateDepth:propagateStyles:parallaxMitigationBasedOnZoomFactorEnabled:zoomPIPOverlayEnabled:zoomPIPMinimumUIZoomFactor:zoomPIPSingleStreamModeEnabled:preallocateOutputBufferPool:](self, "initWithCameraInfoByPortType:sensorBinningFactor:inputBuffersHaveHorizontalOverscanOnly:registrationType:registrationMetalCommandQueue:excludeStaticComponentFromAlignmentShifts:propagateDepth:propagateStyles:parallaxMitigationBasedOnZoomFactorEnabled:zoomPIPOverlayEnabled:zoomPIPMinimumUIZoomFactor:zoomPIPSingleStreamModeEnabled:preallocateOutputBufferPool:", 0, 0, 0, 0, 0, 0, v10);
}

- (void)dealloc
{
  -[BWPreviewStitcherNode _releaseResources]((uint64_t)self);
  intermediateRotationSession = self->_intermediateRotationSession;
  if (intermediateRotationSession) {
    CFRelease(intermediateRotationSession);
  }
  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription) {
    CFRelease(outputFormatDescription);
  }
  outputRotationSession = self->_outputRotationSession;
  if (outputRotationSession) {
    CFRelease(outputRotationSession);
  }

  unint64_t v6 = 0;
  p_rampY = &self->_superWideToWideShiftCorrections[0].rampY;
  do
  {

    v6 += 56;
  }
  while (v6 != 168);
  id v8 = *(const void **)&self->_featherEdgesForOpacityRamp;
  if (v8) {
    CFRelease(v8);
  }

  float v9 = *(const void **)&self->_allowEdgeInsetDuringTrueVideoTransitions;
  if (v9) {
    CFRelease(v9);
  }
  transitionReferenceSampleBuffer = self->_transitionReferenceSampleBuffer;
  if (transitionReferenceSampleBuffer) {
    CFRelease(transitionReferenceSampleBuffer);
  }

  v11.receiver = self;
  v11.super_class = (Class)BWPreviewStitcherNode;
  [(BWNode *)&v11 dealloc];
}

- (void)_releaseResources
{
  if (a1)
  {
    [*(id *)(a1 + 416) cleanupResources];
    *(unsigned char *)(a1 + 424) = 0;
    VTPixelRotationSessionInvalidate(*(VTPixelRotationSessionRef *)(a1 + 304));
    unsigned int v2 = *(const void **)(a1 + 304);
    if (v2)
    {
      CFRelease(v2);
      *(void *)(a1 + 304) = 0;
    }
    VTPixelRotationSessionInvalidate(*(VTPixelRotationSessionRef *)(a1 + 312));
    uint64_t v3 = *(const void **)(a1 + 312);
    if (v3)
    {
      CFRelease(v3);
      *(void *)(a1 + 312) = 0;
    }
    uint64_t v4 = *(const void **)(a1 + 1008);
    if (v4)
    {
      CFRelease(v4);
      *(void *)(a1 + 1008) = 0;
    }

    *(void *)(a1 + 872) = 0;
    *(void *)(a1 + 896) = 0;

    *(void *)(a1 + 880) = 0;
  }
}

- (BWPreviewStitcherDelegate)delegate
{
  return self->_delegate;
}

- (double)trueVideoTransitionPercentComplete
{
  p_configurationLocuint64_t k = &self->_configurationLock;
  os_unfair_lock_lock(&self->_configurationLock);
  double v4 = *(double *)&self->_superWideSensorCenterOffsetEnabled;
  os_unfair_lock_unlock(p_configurationLock);
  return v4;
}

- (opaqueCMSampleBuffer)trueVideoTransitionReferenceSampleBuffer
{
  p_configurationLocuint64_t k = &self->_configurationLock;
  os_unfair_lock_lock(&self->_configurationLock);
  double v4 = *(const void **)&self->_featherEdgesForOpacityRamp;
  if (v4) {
    uint64_t v5 = (void *)CFRetain(v4);
  }
  else {
    uint64_t v5 = 0;
  }
  os_unfair_lock_unlock(p_configurationLock);
  return (opaqueCMSampleBuffer *)v5;
}

- (void)setDisplaysWidestCameraOnly:(BOOL)a3
{
  p_configurationLocuint64_t k = &self->_configurationLock;
  os_unfair_lock_lock(&self->_configurationLock);
  self->_BOOL displaysWidestCameraOnly = a3;
  os_unfair_lock_unlock(p_configurationLock);
}

- (void)rampToAdditionalZoomFactor:(double)a3 momentMovieRecordingRecenteringEnabled:(BOOL)a4
{
  p_configurationLocuint64_t k = &self->_configurationLock;
  os_unfair_lock_lock(&self->_configurationLock);
  epoch = (void *)self->_additionalZoomFactorSpringStartPTS.epoch;
  if (*(float *)&self->_lastRenderTime >= a3) {
    double v9 = 22.0;
  }
  else {
    double v9 = 24.0;
  }
  [self->_additionalZoomFactorSpringStartPTS.epoch setTension:dbl_1A5EFDD30[*(float *)&self->_lastRenderTime < a3]];
  [epoch setFriction:v9];
  [epoch resetWithInput:1.0 initialOutput:0.0 initialVelocity:0.0 convergedSpeed:0.001];
  HIDWORD(self->_lastRenderTime) = self->_lastRenderTime;
  float v10 = a3;
  *(float *)&self->_lastRenderTime = v10;
  uint64_t v11 = MEMORY[0x1E4F1F9F8];
  *(_OWORD *)&self->_additionalZoomFactor = *MEMORY[0x1E4F1F9F8];
  *(void *)&self->_additionalZoomFactorSpringStartPTS.timescale = *(void *)(v11 + 16);
  LOBYTE(self->_fencedAnimationQueue) = a4;
  os_unfair_lock_unlock(p_configurationLock);
}

- (void)setStoppingForModeSwitch:(BOOL)a3 delayedEndOfDataEnabled:(BOOL)a4 ispFastSwitchEnabled:(BOOL)a5 smartStyleRenderingEnabledInTrueVideoGraph:(BOOL)a6
{
  BOOL v6 = a4;
  self->_stoppingForModeSwitch = a3;
  BYTE1(self->_narrowerCameraFoVFillsOverCapture.name) = a4;
  BYTE3(self->_narrowerCameraFoVFillsOverCapture.name) = a5;
  LOBYTE(self->_zoomPIPMinimumUIZoomFactor) = a6;
  if (LOBYTE(self->_lastInputPTS.epoch)) {
    BOOL v8 = !a3;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8 && (BYTE4(self->_narrowerCameraFoVFillsOverCapture.name) || a4)) {
    -[BWPreviewStitcherNode _setOverCaptureStatus:](self, 0);
  }
  if (!BYTE3(self->_blackFilledBorderRectsBySurfaceID))
  {
    if (BYTE4(self->_narrowerCameraFoVFillsOverCapture.name)) {
      BOOL v10 = 0;
    }
    else {
      BOOL v10 = !v6;
    }
    if (!v10) {
      LOBYTE(self->_fencedAnimationQueue) = 1;
    }
  }
}

- (void)markDelayedEndOfData
{
  if (BYTE1(self->_narrowerCameraFoVFillsOverCapture.name))
  {
    if (BYTE2(self->_narrowerCameraFoVFillsOverCapture.name))
    {
      id v3 = +[BWNodeEndOfDataMessage newMessage];
      [(BWNodeConnection *)[(BWNodeInput *)self->super._input connection] consumeMessage:v3 fromOutput:[(BWNodeConnection *)[(BWNodeInput *)self->super._input connection] output]];
    }
    else
    {
      BYTE2(self->_narrowerCameraFoVFillsOverCapture.name) = 1;
    }
  }
}

- (BOOL)previewTapRegistered
{
  return self->_zoomPIPOverlayEnabled;
}

- ($2825F4736939C4A6D3AD43837233062D)outputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_outputDimensions;
}

- (BOOL)flipHorizontal
{
  return self->_flipHorizontal;
}

- (BOOL)flipVertical
{
  return self->_flipVertical;
}

- (void)setPrimaryCaptureRectYInset:(double)a3
{
  self->_primaryCaptureRectYInset = a3;
}

- (double)primaryCaptureRectYInset
{
  return self->_primaryCaptureRectYInset;
}

- (BOOL)previewsWideBeforeSlaveStreamStarts
{
  return self->_previewsWideBeforeSlaveStreamStarts;
}

- (BOOL)generatesHistogram
{
  return self->_generatesHistogram;
}

- (int)maxLossyCompressionLevel
{
  return self->_maxLossyCompressionLevel;
}

- (BOOL)superWideFallbackForMacroSceneEnabled
{
  return self->_superWideFallbackForMacroSceneEnabled;
}

- (BOOL)overCaptureNotSupportedByDownstreamNodes
{
  return BYTE1(self->_blackFilledBorderRectsBySurfaceID);
}

- (BOOL)forceBlackFillBorderEnabled
{
  return (BOOL)self->_blackFilledBorderRectsBySurfaceID;
}

- (BOOL)rebuildingGraphForTrueVideoTransition
{
  return BYTE2(self->_blackFilledBorderRectsBySurfaceID);
}

- (BOOL)trueVideoCaptureEnabled
{
  return BYTE3(self->_blackFilledBorderRectsBySurfaceID);
}

- (BOOL)trueVideoCaptureFormatIs4K
{
  return BYTE4(self->_blackFilledBorderRectsBySurfaceID);
}

- (double)trueVideoCaptureAdditionalZoomFactor
{
  return *(double *)&self->_forceBlackFillBorderEnabled;
}

- (BOOL)thermalPressureIsCritical
{
  return (BOOL)self->_trueVideoHDRtoSDRBlendRamp;
}

- (void)setWaitsForFencedUpdateBeforeFirstEmit:(BOOL)a3
{
  LOBYTE(self->_trueVideoCaptureAdditionalZoomFactor) = a3;
}

- (float)wideFocusDistance
{
  return *(float *)&self->_wideFocusDistanceFarEnoughForStitching.enabled;
}

- (float)superWideFocusDistance
{
  return *(float *)&self->_superWideFocusDistanceFarEnoughForRegistration.enabled;
}

- (id)focusingDescription
{
  if (BYTE1(self->_wideFocusDistanceFarEnoughToUseTele.name)) {
    id v3 = @" T: One Shot";
  }
  else {
    id v3 = &stru_1EFA403E0;
  }
  double v4 = NSString;
  [(BWPreviewStitcherNode *)self wideFocusDistance];
  double v6 = v5;
  if (LOBYTE(self->_wideFocusDistanceFarEnoughToUseTele.name)) {
    uint64_t v7 = " One Shot";
  }
  else {
    uint64_t v7 = "";
  }
  return (id)[v4 stringWithFormat:@"W: \t%.1fcm%s\t%@", *(void *)&v6, v7, v3];
}

- (id)primaryCameraShortDisplayName
{
  id v3 = (void *)-[BWPreviewStitcherNode _primaryCameraPortType]((uint64_t)self);
  double v4 = NSString;
  float v5 = -[BWPreviewStitcherNode _displayStringForPortType:]((__CFString *)self, v3);
  return (id)[v4 stringWithFormat:@"%@ (Rec %@)", v5, -[BWPreviewStitcherNode _displayStringForPortType:]((__CFString *)self, self->_lastRecommendedMasterPortType)];
}

- (__CFString)_displayStringForPortType:(__CFString *)result
{
  if (result)
  {
    if ([a2 isEqualToString:*MEMORY[0x1E4F52DE8]])
    {
      return @"SuperWide";
    }
    else if ([a2 isEqualToString:*MEMORY[0x1E4F52DD8]])
    {
      return @"Wide";
    }
    else if ([a2 isEqualToString:*MEMORY[0x1E4F52DF0]])
    {
      return @"Tele";
    }
    else
    {
      return (__CFString *)BWPortTypeToDisplayString(a2, v3);
    }
  }
  return result;
}

- (BOOL)tooCloseFor1xStitching
{
  return !*(&self->_waitsForFencedUpdateBeforeFirstEmit + 1);
}

- (BOOL)tooCloseForSuperWideRegistration
{
  return !self->_superMacroRangeRegistrationTuningEnabled;
}

- (BOOL)centerRegistrationValid
{
  if (!LOBYTE(self->_lastInputPTS.epoch)) {
    return 0;
  }
  p_shiftCorrectionsUpdateLocuint64_t k = &self->_shiftCorrectionsUpdateLock;
  os_unfair_lock_lock(&self->_shiftCorrectionsUpdateLock);
  if (self->_lastNarrowerCameraIsTele) {
    double v4 = &OBJC_IVAR___BWPreviewStitcherNode__wideToTeleShiftCorrections;
  }
  else {
    double v4 = &OBJC_IVAR___BWPreviewStitcherNode__superWideToWideShiftCorrections;
  }
  BOOL v5 = *(&self->_generatesHistogram + *v4);
  os_unfair_lock_unlock(p_shiftCorrectionsUpdateLock);
  return v5;
}

- (id)wideFallbackDescription
{
  if (BYTE1(self->_wideFallbackRecenteringShiftOffset.y)) {
    id v3 = @"Yes";
  }
  else {
    id v3 = @"No";
  }
  double v4 = NSString;
  [*(id *)&self->_wideFocusingOneShot currentValue];
  return (id)[v4 stringWithFormat:@"%@ : %ld%%", v3, llroundf((float)(v5 * 100.0) * flt_1A5EFDC78[BYTE2(self->_wideFallbackRecenteringShiftOffset.y) == 0])];
}

- (id)previewRegistrationType
{
  if ([(BWPreviewRegistration *)self->_registration previewRegistrationType] == 1) {
    return @"AdaptiveCorrection";
  }
  else {
    return @"Vision";
  }
}

- (id)nodeSubType
{
  return @"PreviewStitcher";
}

- (void)_preheatCIRenderingAsync
{
  if (a1)
  {
    if (*(unsigned __int8 *)(a1 + 1106) | *(unsigned __int8 *)(a1 + 1040)) {
      BOOL v2 = *(unsigned char *)(a1 + 1624) == 0;
    }
    else {
      BOOL v2 = 0;
    }
    if (v2 && !*(void *)(a1 + 928) && !*(unsigned char *)(a1 + 936))
    {
      *(void *)(a1 + 928) = dispatch_group_create();
      *(unsigned char *)(a1 + 936) = 1;
      id v3 = *(NSObject **)(a1 + 928);
      double v4 = *(NSObject **)(a1 + 920);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49__BWPreviewStitcherNode__preheatCIRenderingAsync__block_invoke;
      block[3] = &unk_1E5C24430;
      block[4] = a1;
      dispatch_group_async(v3, v4, block);
    }
  }
}

void __53__BWPreviewStitcherNode_renderSampleBuffer_forInput___block_invoke(uint64_t a1)
{
}

- (uint64_t)_updateShiftCorrectionsAsyncFromComputedShift:(void *)a3 byRegisteringWide:(uint64_t)a4 tele:(double)a5 macroTransitionType:(double)a6
{
  if (result)
  {
    uint64_t v11 = result;
    CFStringRef v12 = (const __CFString *)*MEMORY[0x1E4F53070];
    int v13 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    uint64_t v14 = (void *)[v13 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
    int v15 = [v14 isEqualToString:*MEMORY[0x1E4F52DE8]];
    char v16 = v15;
    if (v15)
    {
      double v17 = -[BWPreviewStitcherNode _wideBaseZoomFactorWithOverrideLocked](v11);
      float v18 = *(float *)&v17;
    }
    else
    {
      float v19 = *(float *)(v11 + 248);
      if (v19 <= 0.0)
      {
        float v21 = *(float *)(v11 + 164);
        float v20 = *(float *)(v11 + 160);
      }
      else
      {
        float v20 = *(float *)(v11 + 160);
        float v21 = v19 * v20;
      }
      float v18 = v21 / (float)(v20 * *(float *)(v11 + 224));
    }
    objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E4F540F0]), "floatValue");
    int v23 = v22;
    int v24 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a3, v12, 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F542D8]), "intValue");
    if (*(unsigned char *)(v11 + 1233)) {
      BOOL v25 = *(unsigned char *)(v11 + 1129) == 0;
    }
    else {
      BOOL v25 = 1;
    }
    double v26 = v18;
    if (!*(unsigned char *)(v11 + 424))
    {
      memset(&v32, 0, sizeof(v32));
      CMSampleBufferGetPresentationTimeStamp(&v32, (CMSampleBufferRef)a3);
      if (*MEMORY[0x1E4F1EBA8] == 1)
      {
        CMTime time = v32;
        CMTimeGetSeconds(&time);
        kdebug_trace();
      }
      objc_msgSend(*(id *)(v11 + 416), "allocateResourcesAsynchronouslyWithVideoFormat:", objc_msgSend(*(id *)(v11 + 8), "videoFormat"));
      *(unsigned char *)(v11 + 424) = 1;
    }
    uint64_t v27 = *(void **)(v11 + 416);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __114__BWPreviewStitcherNode__updateShiftCorrectionsAsyncFromComputedShift_byRegisteringWide_tele_macroTransitionType___block_invoke;
    v28[3] = &unk_1E5C25408;
    char v31 = v16;
    v28[4] = v11;
    int v29 = v23;
    *(double *)&v28[5] = a5;
    *(double *)&v28[6] = a6;
    int v30 = v24;
    return [v27 registerWiderCamera:target narrowerCamera:a3 widerToNarrowerCameraScale:v25 isMacroScene:a4 macroTransitionType:v28 completionHandler:v26];
  }
  return result;
}

- (void)didReachEndOfDataForInput:(id)a3
{
  if (BYTE1(self->_narrowerCameraFoVFillsOverCapture.name) && !BYTE2(self->_narrowerCameraFoVFillsOverCapture.name))
  {
    BYTE2(self->_narrowerCameraFoVFillsOverCapture.name) = 1;
  }
  else
  {
    if (!self->_stoppingForModeSwitch) {
      -[BWPreviewStitcherNode _setOverCaptureStatus:](self, 0);
    }
    -[BWPreviewStitcherNode _waitForCIPreheatingToFinish]((uint64_t)self);

    self->_fencePortSendRight = 0;
    [*(id *)&self->_superMacroEdgeFeatheringShowBlurMask flush];
    dispatch_sync((dispatch_queue_t)self->_metalSubmissionAndCompletionQueue, &__block_literal_global_25);
    if (!BYTE4(self->_narrowerCameraFoVFillsOverCapture.name) && !BYTE3(self->_blackFilledBorderRectsBySurfaceID)) {
      -[BWPreviewStitcherNode _releaseResources]((uint64_t)self);
    }
    v5.receiver = self;
    v5.super_class = (Class)BWPreviewStitcherNode;
    [(BWNode *)&v5 didReachEndOfDataForInput:a3];
  }
}

- (void)_waitForCIPreheatingToFinish
{
  if (a1)
  {
    BOOL v2 = *(NSObject **)(a1 + 928);
    if (v2)
    {
      dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);

      *(void *)(a1 + 928) = 0;
    }
  }
}

- (uint64_t)_compensateForMissingFOVUsingPixelBuffer:(__CVBuffer *)a3 sourceRect:(int)a4 destinationContainingRect:(int)a5 destinationInsetRect:(int)a6 outputPixelBuffer:(int)a7
{
  v86[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v27 = result;
    CVPixelBufferGetWidth(pixelBuffer);
    double v28 = (double)CVPixelBufferGetHeight(pixelBuffer) - (a10 + a12);
    CVPixelBufferGetWidth(a3);
    CVPixelBufferGetHeight(a3);
    uint64_t v85 = *MEMORY[0x1E4F1E3A8];
    v86[0] = MEMORY[0x1E4F1CC38];
    uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:&v85 count:1];
    int v30 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCVPixelBuffer:options:", pixelBuffer, v29), "imageByCroppingToRect:", a9, v28, a11, a12);
    long long v72 = *MEMORY[0x1E4F1DAB8];
    long long v73 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v83.double a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v83.double c = v73;
    long long v71 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    *(_OWORD *)&v83.tCGFloat x = v71;
    CGAffineTransformRotate(&v84, &v83, -1.57079633);
    char v31 = (void *)[v30 imageByApplyingTransform:&v84];
    [v31 extent];
    CMTime v32 = objc_msgSend(v31, "imageByCroppingToRect:");
    [v32 extent];
    float v34 = *(double *)&a19 / v33;
    [v32 extent];
    float v36 = *(double *)&a20 / v35;
    if (v34 <= v36) {
      float v37 = *(double *)&a20 / v35;
    }
    else {
      float v37 = v34;
    }
    *(_OWORD *)&v83.double a = v72;
    *(_OWORD *)&v83.double c = v73;
    *(_OWORD *)&v83.tCGFloat x = v71;
    [v32 extent];
    CGFloat v38 = -CGRectGetMidX(v87);
    [v32 extent];
    CGFloat MidY = CGRectGetMidY(v88);
    CGAffineTransformMakeTranslation(&t2, v38, -MidY);
    *(_OWORD *)&t1.double a = v72;
    *(_OWORD *)&t1.double c = v73;
    *(_OWORD *)&t1.tCGFloat x = v71;
    CGAffineTransformConcat(&v83, &t1, &t2);
    CGAffineTransformMakeScale(&v80, v37, v37);
    CGAffineTransform v79 = v83;
    CGAffineTransformConcat(&t1, &v79, &v80);
    CGAffineTransform v83 = t1;
    [v32 extent];
    CGFloat MidX = CGRectGetMidX(v89);
    [v32 extent];
    CGFloat v41 = CGRectGetMidY(v90);
    CGAffineTransformMakeTranslation(&v78, MidX, v41);
    CGAffineTransform v79 = v83;
    CGAffineTransformConcat(&t1, &v79, &v78);
    CGAffineTransform v83 = t1;
    double v42 = (void *)[v32 imageByApplyingTransform:&t1];
    [v32 extent];
    float v44 = a15 / v43;
    [v32 extent];
    float v46 = a16 / v45;
    if (v44 <= v46) {
      float v44 = a16 / v45;
    }
    *(_OWORD *)&t1.double a = v72;
    *(_OWORD *)&t1.double c = v73;
    *(_OWORD *)&t1.tCGFloat x = v71;
    [v32 extent];
    CGFloat v47 = -CGRectGetMidX(v91);
    [v32 extent];
    CGFloat v48 = CGRectGetMidY(v92);
    CGAffineTransformMakeTranslation(&v77, v47, -v48);
    *(_OWORD *)&v79.double a = v72;
    *(_OWORD *)&v79.double c = v73;
    *(_OWORD *)&v79.tCGFloat x = v71;
    CGAffineTransformConcat(&t1, &v79, &v77);
    CGAffineTransformMakeScale(&v76, v44, v44);
    CGAffineTransform v75 = t1;
    CGAffineTransformConcat(&v79, &v75, &v76);
    CGAffineTransform t1 = v79;
    [v32 extent];
    CGFloat v49 = CGRectGetMidX(v93);
    [v32 extent];
    CGFloat v50 = CGRectGetMidY(v94);
    CGAffineTransformMakeTranslation(&v74, v49, v50);
    CGAffineTransform v75 = t1;
    CGAffineTransformConcat(&v79, &v75, &v74);
    CGAffineTransform t1 = v79;
    unint64_t v51 = (void *)[v32 imageByApplyingTransform:&v79];
    float v52 = (void *)[v42 imageByCompositingOverImage:v51];
    [v42 extent];
    CGFloat v54 = v53;
    CGFloat v56 = v55;
    CGFloat v58 = v57;
    CGFloat v60 = v59;
    [v51 extent];
    uint64_t v65 = psn_imageWithBlurredEdges(v52, 0, v54, v56, v58, v60, v61, v62, v63, v64, 0.0, 0.5);
    uint64_t v66 = [v32 colorSpace];
    id v67 = (id)[objc_alloc(MEMORY[0x1E4F1E070]) initWithPixelBuffer:a3];
    [v67 setColorSpace:v66];
    CGRect v68 = *(void **)(v27 + 896);
    [v52 extent];
    CGRect v69 = objc_msgSend(v68, "startTaskToRender:fromRect:toDestination:atPoint:error:", v65, v67, 0);
    v79.double a = 0.0;
    return [v69 waitUntilCompletedAndReturnError:&v79];
  }
  return result;
}

- (uint64_t)_renderHDRPixelBufferToSDR:(uint64_t)a3 toOutputPixelBuffer:(float)a4 progress:
{
  v23[2] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v9 = MEMORY[0x1E4F1CC38];
    uint64_t v10 = *MEMORY[0x1E4F1E3F8];
    v22[0] = *MEMORY[0x1E4F1E3A8];
    uint64_t v8 = v22[0];
    v22[1] = v10;
    v23[0] = MEMORY[0x1E4F1CC38];
    v23[1] = MEMORY[0x1E4F1CC38];
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
    uint64_t v20 = v8;
    uint64_t v21 = v9;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    int v13 = (void *)[MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:a2 options:v12];
    uint64_t v14 = [MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:a2 options:v11];
    CGFloat Width = (double)CVPixelBufferGetWidth(a2);
    CGFloat Height = (double)CVPixelBufferGetHeight(a2);
    uint64_t v17 = -[BWPreviewStitcherNode _featheredImageWithTeleImage:wideImage:teleClipRect:wideClipRect:zoomingIn:progress:](v7, v14, (uint64_t)v13, 0, 0.0, 0.0, Width, Height, 0.0, 0.0, Width, Height, a4);
    id v18 = (id)[objc_alloc(MEMORY[0x1E4F1E070]) initWithPixelBuffer:a3];
    objc_msgSend(v18, "setColorSpace:", objc_msgSend(v13, "colorSpace"));
    uint64_t v19 = 0;
    return objc_msgSend((id)objc_msgSend(*(id *)(v7 + 896), "startTaskToRender:fromRect:toDestination:atPoint:error:", v17, v18, 0, 0.0, 0.0, Width, Height, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8)), "waitUntilCompletedAndReturnError:", &v19);
  }
  return result;
}

void __49__BWPreviewStitcherNode__preheatCIRenderingAsync__block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)MEMORY[0x1A6272C70]();
  id v3 = (__CVBuffer *)-[int32x2_t newPixelBuffer](-[BWPreviewStitcherNode _teleOpacityPool](*(int32x2_t **)(a1 + 32)), "newPixelBuffer");
  double v4 = (__CVBuffer *)-[int32x2_t newPixelBuffer](-[BWPreviewStitcherNode _teleOpacityPool](*(int32x2_t **)(a1 + 32)), "newPixelBuffer");
  objc_super v5 = (__CVBuffer *)-[int32x2_t newPixelBuffer](-[BWPreviewStitcherNode _teleOpacityPool](*(int32x2_t **)(a1 + 32)), "newPixelBuffer");

  *(void *)(*(void *)(a1 + 32) + 880) = 0;
  double v6 = *(unsigned char **)(a1 + 32);
  if (v6[1107] && v6[1625])
  {
    -[BWPreviewStitcherNode _renderHDRPixelBufferToSDR:toOutputPixelBuffer:progress:]((uint64_t)v6, v4, (uint64_t)v5, 0.5);
    double v6 = *(unsigned char **)(a1 + 32);
  }
  if (v6[1106])
  {
    VTFillPixelBufferWithBlack();
    VTFillPixelBufferWithBlack();
    VTFillPixelBufferWithBlack();
  }
  double v7 = psn_pixelBufferRect(v5);
  double v11 = FigCaptureMetadataUtilitiesScaleRect2D(v7, v8, v9, v10, 0.9);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v18 = psn_pixelBufferRect(v5);
  double v22 = FigCaptureMetadataUtilitiesScaleRect2D(v18, v19, v20, v21, 0.8);
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v29 = acpr_conformRectForMSR420vf(v11, v13, v15, v17);
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v36 = acpr_conformRectForMSR420vf(v22, v24, v26, v28);
  double v38 = v37;
  double v40 = v39;
  double v42 = v41;
  -[BWPreviewStitcherNode _renderOpacityRampToPixelBuffer:bounds:withWidePixelBuffer:telePixelBuffer:zoomingIn:progress:teleBounds:teleShift:](*(void *)(a1 + 32), v5, v3, v4, 1, v29, v31, v33, v35, 0.5, v43, v44, v45, v36, v37, v39, v41, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  uint64_t v46 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v46 + 1472))
  {
    psn_blurPixelBufferBorder(*(void **)(v46 + 896), v5, v29, v31, v33, v35, *(float *)(v46 + 1476));
    uint64_t v46 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v46 + 1005))
  {
    *(double *)&uint64_t v47 = FigCaptureMetadataUtilitiesScaleRect2D(v29, v31, v33, v35, 0.5);
    -[BWPreviewStitcherNode _compensateForMissingFOVUsingPixelBuffer:sourceRect:destinationContainingRect:destinationInsetRect:outputPixelBuffer:](v46, v4, v5, v48, v49, v50, v51, v52, v36, v38, v40, v42, v29, v31, v33, v35, v47, v53, v54,
      v55);
  }
  if (v3) {
    CFRelease(v3);
  }
  if (v4) {
    CFRelease(v4);
  }
  if (v5) {
    CFRelease(v5);
  }
}

- (void)_cameraDisplayTransitionFrameCountForCameraFallbackChange:(float)a3 currentFrameRate:
{
  if (!result) {
    return result;
  }
  uint64_t v5 = (uint64_t)result;
  char v6 = [result displaysWidestCameraOnly];
  if (!a2)
  {
    if (*(unsigned char *)(v5 + 153) && *(unsigned char *)(v5 + 154) && *(float *)(v5 + 824) == *(float *)(v5 + 164))
    {
      unint64_t v7 = 13;
    }
    else
    {
      float v8 = *(float *)(v5 + 824);
      if (v8 == 0.0 || vabds_f32(1.0, *(float *)(v5 + 828) / v8) < 0.1)
      {
        if (*(unsigned char *)(v5 + 1233)) {
          unsigned int v9 = 12;
        }
        else {
          unsigned int v9 = 13;
        }
        if (*(unsigned char *)(v5 + 1129)) {
          unint64_t v7 = v9;
        }
        else {
          unint64_t v7 = v9 + 1;
        }
      }
      else
      {
        unint64_t v7 = 9;
      }
    }
    goto LABEL_39;
  }
  if (!*(unsigned char *)(v5 + 1391)
    || *(unsigned char *)(v5 + 856)
    || *(unsigned __int8 *)(v5 + 1388) == *(unsigned __int8 *)(v5 + 1360))
  {
    if (*(unsigned char *)(v5 + 1307))
    {
      unint64_t v7 = 22;
      if (*(unsigned char *)(v5 + 856))
      {
        if (*(unsigned __int8 *)(v5 + 1304) == *(unsigned __int8 *)(v5 + 1305)) {
          unint64_t v7 = 22;
        }
        else {
          unint64_t v7 = 15;
        }
      }
    }
    else
    {
      unint64_t v7 = 22;
    }
  }
  else
  {
    unint64_t v7 = 16;
  }
  int v10 = *(unsigned __int8 *)(v5 + 152);
  if (*(unsigned char *)(v5 + 152))
  {
    if (*(unsigned char *)(v5 + 1388)) {
      char v11 = 1;
    }
    else {
      char v11 = v6;
    }
    int v10 = (v11 & 1) == 0 && *(unsigned char *)(v5 + 856) == 0;
  }
  if (*(unsigned char *)(v5 + 1304))
  {
    if (v10)
    {
      BOOL v12 = 0;
LABEL_37:
      float v13 = *(float *)(v5 + 1384);
      double v14 = *(double *)(v5 + 1368);
      double v15 = *(double *)(v5 + 1376);
      double v16 = *(double *)(v5 + 728);
      double v17 = *(double *)(v5 + 736);
      unint64_t v18 = v5;
LABEL_38:
      unint64_t v7 = -[BWPreviewStitcherNode _scaleOpacityFrameCount:forCameraFallbackFromWideToTele:recenteringShiftOffset:recenteringStrength:registrationShiftOffset:](v18, v7, v12, v14, v15, v13, v16, v17);
    }
  }
  else
  {
    BOOL v12 = *(unsigned __int8 *)(v5 + 856) != 0;
    if (v10) {
      goto LABEL_37;
    }
    if (*(unsigned char *)(v5 + 856) && *(unsigned char *)(v5 + 408))
    {
      float v13 = flt_1A5EFDC78[*(unsigned char *)(v5 + 1306) == 0];
      double v14 = *(double *)(v5 + 1288);
      double v15 = *(double *)(v5 + 1296);
      double v16 = *(double *)(v5 + 560);
      double v17 = *(double *)(v5 + 568);
      unint64_t v18 = v5;
      BOOL v12 = 1;
      goto LABEL_38;
    }
  }
LABEL_39:
  return (void *)-[BWPreviewStitcherNode _scale30FPSFrameCount:toFrameRate:](v5, v7, a3);
}

- (unint64_t)_scaleOpacityFrameCount:(int)a3 forCameraFallbackFromWideToTele:(double)a4 recenteringShiftOffset:(double)a5 recenteringStrength:(float)a6 registrationShiftOffset:(double)a7
{
  if (result)
  {
    float v10 = (a8 - a5 / (1.0 - a6)) * (a8 - a5 / (1.0 - a6)) + (a7 - a4 / (1.0 - a6)) * (a7 - a4 / (1.0 - a6));
    float v11 = sqrtf(v10);
    unint64_t v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(result + 8), "primaryMediaProperties"), "resolvedVideoFormat"), "height");
    float v13 = v11 / (float)v12;
    float v14 = 0.13;
    if (v13 <= 0.13) {
      float v14 = v11 / (float)v12;
    }
    if (v14 >= 0.035) {
      float v15 = (float)(v14 + -0.035) / 0.095;
    }
    else {
      float v15 = 0.0;
    }
    if (a3)
    {
      if (v13 > 0.035) {
        float v13 = 0.035;
      }
      if (v13 >= 0.009) {
        float v16 = (float)(v13 + -0.009) / 0.026;
      }
      else {
        float v16 = 0.0;
      }
      float v17 = (float)(v16 * 1.3) + 1.0;
    }
    else
    {
      float v17 = (float)(v15 * 1.3) + 1.0;
    }
    return llroundf(v17 * (float)a2);
  }
  return result;
}

void __114__BWPreviewStitcherNode__updateShiftCorrectionsAsyncFromComputedShift_byRegisteringWide_tele_macroTransitionType___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 64)) {
    uint64_t v5 = &OBJC_IVAR___BWPreviewStitcherNode__superWideToWideShiftCorrections;
  }
  else {
    uint64_t v5 = &OBJC_IVAR___BWPreviewStitcherNode__wideToTeleShiftCorrections;
  }
  uint64_t v6 = *v5;
  CFDictionaryRef v7 = *(const __CFDictionary **)(v4 + 784);
  if (v7)
  {
    CGPoint v19 = (CGPoint)*MEMORY[0x1E4F1DAD8];
    CGPointMakeWithDictionaryRepresentation(v7, &v19);
    for (uint64_t i = 0; i != 72; i += 24)
    {
      uint64_t v9 = a2 + i;
      *(unsigned char *)uint64_t v9 = 1;
      *(CGPoint *)(v9 + 8) = v19;
    }
    float v10 = *(os_unfair_lock_s **)(a1 + 32);
  }
  else
  {
    float v10 = (os_unfair_lock_s *)v4;
  }
  uint64_t v11 = v4 + v6;
  os_unfair_lock_lock(v10 + 107);
  uint64_t v12 = 0;
  int v13 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 820);
  float v14 = (float64x2_t *)(a2 + 8);
  do
  {
    char v15 = LOBYTE(v14[-1].f64[1]);
    if (v15)
    {
      float v16 = *(float *)(a1 + 56);
      if (v16 == 0.0)
      {
        float64x2_t v17 = *v14;
      }
      else
      {
        float64x2_t v17 = vdivq_f64(*v14, (float64x2_t)vdupq_lane_s64(COERCE__INT64(v16), 0));
        *float v14 = v17;
      }
      *(float64x2_t *)(v11 + v12 + 16) = vsubq_f64(v17, *(float64x2_t *)(a1 + 40));
      if (!v13) {
        *(unsigned char *)(v11 + v12 + 32) = 1;
      }
    }
    uint64_t v18 = v11 + v12;
    *(unsigned char *)(v18 + 33) = v15;
    *(_DWORD *)(v18 + 36) = *(_DWORD *)(a1 + 60);
    float v14 = (float64x2_t *)((char *)v14 + 24);
    v12 += 56;
  }
  while (v12 != 168);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 428));
}

- (void)setWaitsForRegistrationToComplete:(BOOL)a3
{
  self->_superMacroEdgeFeatheringBlurEnabledouble d = a3;
}

- (BOOL)waitsForRegistrationToComplete
{
  return self->_superMacroEdgeFeatheringBlurEnabled;
}

@end