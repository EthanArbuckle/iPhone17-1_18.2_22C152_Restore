@interface VideoMattingMetal
+ (id)textureFromCacheUsingPixelBuffer:(__CVBuffer *)a3 textureDescriptor:(id)a4 plane:(unint64_t)a5 textureCache:(__CVMetalTextureCache *)a6;
+ (void)decomposeYuvPixelBuffer:(__CVBuffer *)a3 yTexture:(id *)a4 uvTexture:(id *)a5 textureCache:(__CVMetalTextureCache *)a6;
+ (void)saveTexture:(id)a3 toFilename:(id)a4;
- (BOOL)bypassShiftCleanup;
- (BOOL)isBgColorLutBlack;
- (CGRect)primaryCaptureRect;
- (MTLTexture)colorSim;
- (MTLTexture)filteredBeforeSmoothDisparity;
- (NSDictionary)sbufMetadata;
- (VideoMattingMetal)initWithStaticParams:(const VideoMattingStaticParams *)a3 renderingDisparityUpdateRate:(float)a4 renderingDisparityBlurRadius:(float)a5 renderingLensFocalLength_mm:(float)a6 useTemporalConfidence:(BOOL)a7 metalContext:(void *)a8 error:(id *)a9;
- (__CVBuffer)createCVBufferWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5;
- (float)renderingDisparityUpdateRate;
- (id)disparityPostprocessingWithCanonicalDisparity:(const __CVBuffer *)a3 color:(const __CVBuffer *)a4 postProcessedDisparity:(__CVBuffer *)a5 staticParams:(const VideoMattingStaticParams *)a6 dynamicParams:(const void *)a7 postProcessingParams:(const VideoPostprocessingParams *)a8 facesArray:(id)a9 faceModel:(id)a10 isFinalStage:(BOOL)a11 callbackQueue:(id)a12 callback:(id)a13;
- (id)getPTTextureFromLuma:(id)a3 chroma:(id)a4;
- (pair<float,)blurRadiusAndStdAtInfinityForFocalLength:(float)a3 focusCanonicalDisparity:(float)a4 fNumber:(float)a5 xResolution:(float)a6 useNewCoCFormula:(BOOL)a7;
- (void)alphaMattingWithPostprocessedDisparity:(const __CVBuffer *)a3 source:(const __CVBuffer *)a4 inSegmentation:(__CVBuffer *)a5 alpha:(__CVBuffer *)a6 staticParams:(const VideoMattingStaticParams *)a7 dynamicParams:(const void *)a8 usePostprocessedDisparity:(BOOL)a9 isFinalStage:(BOOL)a10 dilateForegroundMask:(BOOL)a11 properties:(id)a12 callbackQueue:(id)a13 callback:(id)a14;
- (void)cropFrame:(const __CVBuffer *)a3 destination:(__CVBuffer *)a4 rect:(CGRect)a5;
- (void)dealloc;
- (void)downsampleWithHWScalerSource:(__CVBuffer *)a3 destination:(__CVBuffer *)a4;
- (void)encode420Bilinear2xDownsamplingToCommandBuffer:(id)a3 source:(__CVBuffer *)a4 destination:(__CVBuffer *)a5;
- (void)encode420HybridDownsamplingToCommandBuffer:(id)a3 source:(__CVBuffer *)a4 destination:(__CVBuffer *)a5;
- (void)encode420ScalingByMPSToCommandBuffer:(id)a3 source:(__CVBuffer *)a4 destination:(__CVBuffer *)a5;
- (void)encodeBackgroundFillToCommandBuffer:(id)a3 inputDisparity:(id)a4 inputMask:(id)a5 outputDisparity:(id)a6;
- (void)encodeColorSimL1ToCommandBuffer:(id)a3 prevSource:(id)a4 currSource:(id)a5 destination:(id)a6;
- (void)encodeColorSimToCommandBuffer:(id)a3 prevSource:(id)a4 currSource:(id)a5 destination:(id)a6 similarityScaleFactor:(float)a7;
- (void)encodeConfidenceMaskToCommandBuffer:(id)a3 inputDisparity:(id)a4 inputDisparityNoInvalid:(id)a5 outputConfidenceMask:(id)a6;
- (void)encodeCopyTextureToCommandBuffer:(id)a3 inTexture:(id)a4 outTexture:(id)a5;
- (void)encodeDiffusionMapToCommandBuffer:(id)a3 color:(id)a4 diffusionMap:(id)a5;
- (void)encodeDisparityCleanupToCommandBuffer:(id)a3 prevDisparity:(id)a4 currDisparity:(id)a5 colorSim:(id)a6 cleanDisparity:(id)a7;
- (void)encodeDisparityDecimateToCommandBuffer:(id)a3 canonicalDisparity:(__CVBuffer *)a4 disparityOut:(id)a5;
- (void)encodeDisparityMasksToCommandBuffer:(id)a3 inputDisparity:(id)a4 inputSegmentation:(id)a5 useSegmentationOnly:(BOOL)a6 outputForegroundMask:(id)a7 outputIsForeground:(id)a8 disparityMin:(float)a9 focusDisparity:(float)a10 hardness:(float)a11 minDistToDeweight:(float)a12 unconfidentWeight:(float)a13;
- (void)encodeDisparitySmoothingToCommandBuffer:(id)a3 disparity:(id)a4;
- (void)encodeDisparityTemporalFilterToCommandBuffer:(id)a3 currentDisparity:(id)a4 previousDisparity:(id)a5 currConfidence:(id)a6 prevSmoothConfidence:(id)a7 colorSim:(id)a8 outPrevSmoothConfidence:(id)a9 outTemporallyFilteredDisparity:(id)a10 disparityFallbackToInvalid:(BOOL)a11 disparityFilterUpdateRate:(float)a12 minimumConfidenceToKeepDisparity:(float)a13 maximumSimilarityToKeepDisparity:(float)a14;
- (void)encodeDomainTransformToCommandBuffer:(id)a3 inputDiffusionMap:(id)a4 inputDistanceFromKnownDisparity:(id)a5 outputDomainTransformX:(id)a6 outputDomainTransformY:(id)a7;
- (void)encodeEdgeAwareFillToCommandBuffer:(id)a3 inputDisparity:(id)a4 inputDomainTransformX:(id)a5 inputDomainTransformY:(id)a6 outputDisparity:(id)a7;
- (void)encodeFillAlphaToCommandBuffer:(id)a3 alpha:(id)a4;
- (void)encodeFillBackgroundDisparityToCommandBuffer:(id)a3 inputDisparity:(id)a4 inputFacemask:(id)a5 outputDistanceFromKnownDisparity:(id)a6 outputDisparity:(id)a7 backgroundDisparityValue:(float)a8 minimumDistanceFromValidDisparity:(float)a9;
- (void)encodeFilterCoefficientToBuffer:(id)a3 inputCoeff:(id)a4 prevCoeff:(id)a5 outCoeff:(id)a6 inColorSim:(id)a7 updateRate:(float)a8;
- (void)encodeForegroundMaskToBuffer:(id)a3 disparity:(id)a4 inSegmentation:(id)a5 useSegmentationOnly:(BOOL)a6 weight:(id)a7 foregroundMask:(id)a8 erodedForegroundMask:(id)a9 disparityMin:(float)a10 focusDisparity:(float)a11 hardness:(float)a12 minDistToDeweight:(float)a13 unconfidentWeight:(float)a14 dilateForegroundMask:(BOOL)a15 foregroundMaskDilationRadius:(float)a16 properties:(id)a17;
- (void)encodeGuidedFilterWeightToCommandBuffer:(id)a3 inputDisparity:(id)a4 inputSegmentation:(id)a5 useSegmentationOnly:(BOOL)a6 inputForegroundDistance:(id)a7 outputForegroundMask:(id)a8 outputWeight:(id)a9 minDistToDeweight:(float)a10 unconfidentWeight:(float)a11 dilateForegroundMask:(BOOL)a12 foregroundMaskDilationRadius:(float)a13;
- (void)encodeInvalidDisparityMaskToCommandBuffer:(id)a3 inputDisparity:(id)a4 outputMask:(id)a5;
- (void)encodeOutputDisparityToCommandBuffer:(id)a3 inputDisparity:(id)a4 outputDisparity:(id)a5;
- (void)encodeRotateAndFitIntoRectWithCommandBuffer:(id)a3 inTexture:(id)a4 outTexture:(id)a5 rotateClockwise:(BOOL)a6;
- (void)encodeScaleSourceToCommandBuffer:(id)a3 source:(__CVBuffer *)a4 targetWidth:(unint64_t)a5 targetHeight:(unint64_t)a6;
- (void)encodeSimpleConfidenceToCommandBuffer:(id)a3 disparity:(id)a4 outConfidence:(id)a5;
- (void)encodeUpdateConfidenceAndLastValidDisparityToCommandBuffer:(id)a3 disparity:(id)a4 prevSmoothConfidence:(id)a5 lastValidDisparityIn:(id)a6 lastValidDisparityOut:(id)a7 currConfidenceOut:(id)a8 useTemporalConfidence:(BOOL)a9;
- (void)initSourceTexture:(__CVBuffer *)a3;
- (void)prewarmGuidedFilter:(id)a3 device:(id)a4 commandBuffer:(id)a5 width:(int)a6 height:(int)a7 width2:(int)a8 height2:(int)a9;
- (void)renderContinuousWithSource:(const __CVBuffer *)a3 segmentationPixelBuffer:(const __CVBuffer *)a4 alpha:(const __CVBuffer *)a5 canonicalDisparity:(const __CVBuffer *)a6 disparityInFocus:(float)a7 focusCanonicalDisparity:(float)a8 fNumber:(float)a9 infConvolutionScale:(float)a10 noiseBits:(float)a11 disparityUpdateRate:(float)a12 focusThresholdHardness:(float)a13 cubeIntensity:(float)a14 usePostprocessedDisparity:(BOOL)a15 dstColor:(__CVBuffer *)a16 isFinalStage:(BOOL)a17 properties:(id)a18 callbackQueue:(id)a19 withCallback:(id)a20;
- (void)renderStageLightWithSource:(const __CVBuffer *)a3 alpha:(const __CVBuffer *)a4 canonicalDisparity:(const __CVBuffer *)a5 dstColor:(__CVBuffer *)a6 blackBackgroundIntensity:(float)a7 vignetteIntensity:(float)a8 isFinalStage:(BOOL)a9 callbackQueue:(id)a10 withCallback:(id)a11;
- (void)segmentationAverage:(__CVBuffer *)a3 callbackQueue:(id)a4 callback:(id)a5;
- (void)setAlphaLut:(float)a3 gammaExponent:(float)a4;
- (void)setBgLut:(id)a3;
- (void)setBypassShiftCleanup:(BOOL)a3;
- (void)setFgLut:(id)a3;
- (void)setIsBgColorLutBlack:(BOOL)a3;
- (void)setPortraitForegroundCubeData:(id)a3 backgroundCubeData:(id)a4;
- (void)setPrimaryCaptureRect:(CGRect)a3;
- (void)setRenderingDisparityUpdateRate:(float)a3;
- (void)setSbufMetadata:(id)a3;
- (void)setStageLightProxyCubeData:(id)a3 cubeData:(id)a4;
- (void)updateRenderRequestwithPerFrameMetadata:(id)a3 properties:(id)a4;
@end

@implementation VideoMattingMetal

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteredBeforeSmoothDisparity, 0);
  objc_storeStrong((id *)&self->_colorSim, 0);
  objc_storeStrong((id *)&self->_sbufMetadata, 0);
  objc_storeStrong((id *)&self->_foregroundRatioBuffer, 0);
  objc_storeStrong((id *)&self->_globalReductionAverage, 0);
  objc_storeStrong((id *)&self->_ptRenderRequest, 0);
  objc_storeStrong((id *)&self->_ptRenderState, 0);
  objc_storeStrong((id *)&self->_ptRenderPipeline, 0);
  objc_storeStrong((id *)&self->_mattingCallbackSemaphore, 0);
  objc_storeStrong((id *)&self->_synchronousMattingCallbackQueue, 0);
  objc_storeStrong((id *)&self->_renderingCallbackSemaphore, 0);
  objc_storeStrong((id *)&self->_synchronousRenderingCallbackQueue, 0);
  objc_storeStrong((id *)&self->_lastStageLightCubeData, 0);
  objc_storeStrong((id *)&self->_lastStageLightProxyCubeData, 0);
  objc_storeStrong((id *)&self->_lastFgLutData, 0);
  objc_storeStrong((id *)&self->_lastBgLutData, 0);
  objc_storeStrong((id *)&self->_yuvSourceDownsampledTexture, 0);
  objc_storeStrong((id *)&self->_smoothFilter, 0);
  objc_storeStrong((id *)&self->_facemaskRegionTexture, 0);
  objc_storeStrong((id *)&self->_tempFloatR32FloatTexture, 0);
  objc_storeStrong((id *)&self->_scaledSource[1], 0);
  objc_storeStrong((id *)self->_scaledSource, 0);
  objc_storeStrong((id *)&self->_correctlyRotatedAndReshapedSegmentation, 0);
  objc_storeStrong((id *)&self->_alphaNoPostprocessing, 0);
  objc_storeStrong((id *)&self->_distanceToForegroundTexture, 0);
  objc_storeStrong((id *)&self->_isForegroundTexture, 0);
  objc_storeStrong((id *)&self->_coeffHistory[1], 0);
  objc_storeStrong((id *)self->_coeffHistory, 0);
  objc_storeStrong((id *)&self->_coeff, 0);
  objc_storeStrong((id *)&self->_outputCanonicalDisparity, 0);
  objc_storeStrong((id *)&self->_initDisparity, 0);
  objc_storeStrong((id *)&self->_invalidDisparityMaskTexture, 0);
  objc_storeStrong((id *)&self->_bgFillTempTexture, 0);
  objc_storeStrong((id *)&self->_edgeAwareFillTempTexture, 0);
  objc_storeStrong((id *)&self->_domainTransformYTexture, 0);
  objc_storeStrong((id *)&self->_domainTransformXTexture, 0);
  objc_storeStrong((id *)&self->_distanceFromKnownDisparityTexture, 0);
  objc_storeStrong((id *)&self->_disparityIsValidTexture, 0);
  objc_storeStrong((id *)&self->_diffusionMapTexture, 0);
  objc_storeStrong((id *)&self->_roughDisparity, 0);
  objc_storeStrong((id *)&self->_smoothDisparity[1], 0);
  objc_storeStrong((id *)self->_smoothDisparity, 0);
  objc_storeStrong((id *)&self->_smoothConfidence[1], 0);
  objc_storeStrong((id *)self->_smoothConfidence, 0);
  objc_storeStrong((id *)&self->_disparityConfidenceMaskTexture, 0);
  objc_storeStrong((id *)&self->_temporallyFilteredDisparity, 0);
  objc_storeStrong((id *)&self->_filledDisparityNoInvalidTexture, 0);
  objc_storeStrong((id *)&self->_filledDisparityTexture, 0);
  objc_storeStrong((id *)&self->_facemaskDisparity, 0);
  objc_storeStrong((id *)&self->_disparity[1], 0);
  objc_storeStrong((id *)self->_disparity, 0);
  objc_storeStrong((id *)&self->_disparityLastValidValue[1], 0);
  objc_storeStrong((id *)self->_disparityLastValidValue, 0);
  objc_storeStrong((id *)&self->_gfWeight, 0);
  objc_storeStrong((id *)&self->_gfForegroundMask, 0);
  objc_storeStrong((id *)&self->_fgMaskErosionKernel, 0);
  objc_storeStrong((id *)&self->_fgBlurBoxKernel, 0);
  objc_storeStrong((id *)&self->_disparityBlurBoxKernel, 0);
  objc_storeStrong((id *)&self->_stageLightLut, 0);
  objc_storeStrong((id *)&self->_stageLightProxyLut, 0);
  objc_storeStrong((id *)&self->_fgColorLut, 0);
  objc_storeStrong((id *)&self->_bgColorLut, 0);
  objc_storeStrong((id *)&self->_disparityInScreenAspectRatio, 0);
  objc_storeStrong((id *)&self->_coc, 0);
  objc_storeStrong((id *)&self->_shift[1], 0);
  objc_storeStrong((id *)self->_shift, 0);
  objc_storeStrong((id *)&self->_deweightedDisparity, 0);
  objc_storeStrong((id *)&self->_blurredBg, 0);
  objc_storeStrong((id *)&self->_bg, 0);
  objc_storeStrong((id *)&self->_bTexture, 0);
  objc_storeStrong((id *)&self->_gTexture, 0);
  objc_storeStrong((id *)&self->_rTexture, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_guidedFilterWeightKernel, 0);
  objc_storeStrong((id *)&self->_temporalCoefficientsFilterKernel, 0);
  objc_storeStrong((id *)&self->_colorSimL1Kernel, 0);
  objc_storeStrong((id *)&self->_colorSimKernel, 0);
  objc_storeStrong((id *)&self->_halfDownSampler, 0);
  objc_storeStrong((id *)&self->_maskedVariableBlur, 0);
  objc_storeStrong((id *)&self->_rotateAndFitIntoRectKernel, 0);
  objc_storeStrong((id *)&self->_renderingDisparityFillAndFilterKernel, 0);
  objc_storeStrong((id *)&self->_disparityConfig, 0);
  objc_storeStrong((id *)&self->_renderingDisparityDeweightKernel, 0);
  objc_storeStrong((id *)&self->_temporalDisparityFilterKernel_fallbackToInvalid, 0);
  objc_storeStrong((id *)&self->_temporalDisparityFilterKernel, 0);
  objc_storeStrong((id *)&self->_roughDisparityKernel, 0);
  objc_storeStrong((id *)&self->_updateConfidenceAndLastValidDisparityKernel_useTemporalConfidence, 0);
  objc_storeStrong((id *)&self->_updateConfidenceAndLastValidDisparityKernel, 0);
  objc_storeStrong((id *)&self->_simpleConfidenceKernel, 0);
  objc_storeStrong((id *)&self->_disparityCleanupKernel_firstFrame, 0);
  objc_storeStrong((id *)&self->_disparityCleanupKernel, 0);
  objc_storeStrong((id *)&self->_alphaFillKernel, 0);
  objc_storeStrong((id *)&self->_disparityDecimateKernel, 0);
  objc_storeStrong((id *)&self->_internalDisparityToCanonicalDisparityKernel, 0);
  objc_storeStrong((id *)&self->_bgFillYKernel, 0);
  objc_storeStrong((id *)&self->_bgFillXKernel, 0);
  objc_storeStrong((id *)&self->_invalidDisparityMaskKernel, 0);
  objc_storeStrong((id *)&self->_edgeAwareFillYKernel, 0);
  objc_storeStrong((id *)&self->_edgeAwareFillXKernel, 0);
  objc_storeStrong((id *)&self->_domainTransformYKernel, 0);
  objc_storeStrong((id *)&self->_domainTransformXKernel, 0);
  objc_storeStrong((id *)&self->_disparityIsValidKernel, 0);
  objc_storeStrong((id *)&self->_disparityMasksKernel, 0);
  objc_storeStrong((id *)&self->_disparityConfidenceMaskKernel, 0);
  objc_storeStrong((id *)&self->_fillBackgroundDisparityKernel_faceMask, 0);
  objc_storeStrong((id *)&self->_fillBackgroundDisparityKernel, 0);
  objc_storeStrong((id *)&self->_diffusionMapKernel, 0);
  objc_storeStrong((id *)&self->_infConvolution, 0);
  objc_storeStrong((id *)&self->_diffusion, 0);
  objc_storeStrong((id *)&self->_distanceTransform, 0);
  objc_storeStrong((id *)&self->_renderComposite, 0);
  objc_storeStrong((id *)&self->_colorAlphaToFgBg, 0);
  objc_storeStrong((id *)&self->_stagelightFilter, 0);
  objc_storeStrong((id *)&self->_cvaGuidedFilter, 0);
  objc_storeStrong((id *)&self->_guidedFilter, 0);
  objc_storeStrong((id *)&self->_hybridResampler, 0);
  objc_storeStrong((id *)&self->_boxFilter, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_pipelineLibrary, 0);
  objc_storeStrong((id *)&self->_defaultLibrary, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (void)setIsBgColorLutBlack:(BOOL)a3
{
  self->_isBgColorLutBlack = a3;
}

- (BOOL)isBgColorLutBlack
{
  return self->_isBgColorLutBlack;
}

- (void)setPrimaryCaptureRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_primaryCaptureRect, &v3, 32, 1, 0);
}

- (CGRect)primaryCaptureRect
{
  objc_copyStruct(v6, &self->_primaryCaptureRect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setSbufMetadata:(id)a3
{
}

- (NSDictionary)sbufMetadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 1112, 1);
}

- (MTLTexture)filteredBeforeSmoothDisparity
{
  return (MTLTexture *)objc_getProperty(self, a2, 1168, 1);
}

- (MTLTexture)colorSim
{
  return (MTLTexture *)objc_getProperty(self, a2, 1160, 1);
}

- (void)setBypassShiftCleanup:(BOOL)a3
{
  self->_bypassShiftCleanup = a3;
}

- (BOOL)bypassShiftCleanup
{
  return self->_bypassShiftCleanup;
}

- (void)setRenderingDisparityUpdateRate:(float)a3
{
  self->_renderingDisparityUpdateRate = a3;
}

- (float)renderingDisparityUpdateRate
{
  return self->_renderingDisparityUpdateRate;
}

- (void)encodeFillAlphaToCommandBuffer:(id)a3 alpha:(id)a4
{
  id v6 = a4;
  v7 = [a3 computeCommandEncoder];
  [v7 setLabel:@"_alphaFillKernel"];
  [v7 setComputePipelineState:self->_alphaFillKernel];
  [v7 setTexture:v6 atIndex:0];
  v10[0] = (unint64_t)([v6 width] + 15) >> 4;
  v10[1] = (unint64_t)([v6 height] + 15) >> 4;
  v10[2] = 1;
  int64x2_t v8 = vdupq_n_s64(0x10uLL);
  uint64_t v9 = 1;
  [v7 dispatchThreadgroups:v10 threadsPerThreadgroup:&v8];
  [v7 endEncoding];
}

- (void)encode420ScalingByMPSToCommandBuffer:(id)a3 source:(__CVBuffer *)a4 destination:(__CVBuffer *)a5
{
  id v28 = a3;
  size_t Width = CVPixelBufferGetWidth(a4);
  size_t Height = CVPixelBufferGetHeight(a4);
  size_t v11 = CVPixelBufferGetWidth(a5);
  size_t v12 = CVPixelBufferGetHeight(a5);
  unint64_t v13 = v12;
  if (v11 <= 1)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"VideoMattingMetal.mm", 3281, @"targetWidth not in [2, inf" object file lineNumber description]);

    if (v13 > 1) {
      goto LABEL_3;
    }
  }
  else if (v12 > 1)
  {
    goto LABEL_3;
  }
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"VideoMattingMetal.mm", 3282, @"targetHeight not in [2, inf" object file lineNumber description]);

LABEL_3:
  IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(a4);
  IOSurfaceRef v15 = CVPixelBufferGetIOSurface(a5);
  v27 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:10 width:Width height:Height mipmapped:0];
  v16 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:30 width:Width >> 1 height:Height >> 1 mipmapped:0];
  v17 = (void *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v27 iosurface:IOSurface plane:0];
  v18 = (void *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v16 iosurface:IOSurface plane:1];
  v19 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:10 width:v11 height:v13 mipmapped:0];
  v20 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:30 width:v11 >> 1 height:v13 >> 1 mipmapped:0];
  [v19 setUsage:3];
  [v20 setUsage:3];
  v21 = (void *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v19 iosurface:v15 plane:0];
  v22 = (void *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v20 iosurface:v15 plane:1];
  v23 = [(CVAFilterHybridResampling *)self->_hybridResampler scaler];
  [v23 encodeToCommandBuffer:v28 sourceTexture:v17 destinationTexture:v21];

  v24 = [(CVAFilterHybridResampling *)self->_hybridResampler scaler];
  [v24 encodeToCommandBuffer:v28 sourceTexture:v18 destinationTexture:v22];
}

- (void)encode420Bilinear2xDownsamplingToCommandBuffer:(id)a3 source:(__CVBuffer *)a4 destination:(__CVBuffer *)a5
{
  id v26 = a3;
  size_t Width = CVPixelBufferGetWidth(a4);
  size_t Height = CVPixelBufferGetHeight(a4);
  IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(a4);
  IOSurfaceRef v11 = CVPixelBufferGetIOSurface(a5);
  [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:10 width:Width height:Height mipmapped:0];
  size_t v12 = Width >> 1;
  v21 = size_t v13 = Height >> 1;
  v24 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:30 width:Width >> 1 height:Height >> 1 mipmapped:0];
  v23 = (void *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v21 iosurface:IOSurface plane:0];
  v22 = (void *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v24 iosurface:IOSurface plane:1];
  v25 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:10 width:Width >> 1 height:Height >> 1 mipmapped:0];
  size_t v14 = Width >> 2;
  size_t v15 = Height >> 2;
  v16 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:30 width:v14 height:Height >> 2 mipmapped:0];
  [v25 setUsage:3];
  [v16 setUsage:3];
  v17 = (void *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v25 iosurface:v11 plane:0];
  v18 = (void *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v16 iosurface:v11 plane:1];
  v19 = [v26 computeCommandEncoder];
  [v19 setLabel:@"_halfDownSampler"];
  [v19 setComputePipelineState:self->_halfDownSampler];
  [v19 setTexture:v23 atIndex:0];
  [v19 setTexture:v17 atIndex:1];
  v32[0] = (v12 + 15) >> 4;
  v32[1] = (v13 + 15) >> 4;
  v32[2] = 1;
  int64x2_t v30 = vdupq_n_s64(0x10uLL);
  uint64_t v31 = 1;
  [v19 dispatchThreadgroups:v32 threadsPerThreadgroup:&v30];
  [v19 endEncoding];
  v20 = [v26 computeCommandEncoder];

  [v20 setLabel:@"_halfDownSampler"];
  [v20 setComputePipelineState:self->_halfDownSampler];
  [v20 setTexture:v22 atIndex:0];
  [v20 setTexture:v18 atIndex:1];
  v29[0] = (v14 + 15) >> 4;
  v29[1] = (v15 + 15) >> 4;
  v29[2] = 1;
  int64x2_t v27 = vdupq_n_s64(0x10uLL);
  uint64_t v28 = 1;
  [v20 dispatchThreadgroups:v29 threadsPerThreadgroup:&v27];
  [v20 endEncoding];
}

- (void)cropFrame:(const __CVBuffer *)a3 destination:(__CVBuffer *)a4 rect:(CGRect)a5
{
}

- (void)downsampleWithHWScalerSource:(__CVBuffer *)a3 destination:(__CVBuffer *)a4
{
  if (!self->_yuvSourceDownsampledBuffer)
  {
    int64x2_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"VideoMattingMetal.mm" lineNumber:3103 description:@"Relighting code should be rewritten to support different scale!"];

    size_t v9 = CVPixelBufferGetWidth(a3) >> 2;
    size_t v10 = CVPixelBufferGetHeight(a3) >> 2;
    uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    self->_yuvSourceDownsampledBuffer = [(VideoMattingMetal *)self createCVBufferWithWidth:v9 height:v10 format:PixelFormatType];
    if (PixelFormatType != 875704422)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2 object:self file:@"VideoMattingMetal.mm" lineNumber:3111 description:@"Unexpected source format in downsampleWithHWScalerSource()!"];
    }
    size_t v12 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:500 width:v9 height:v10 mipmapped:0];
    [v12 setUsage:3];
    size_t v13 = +[VideoMattingMetal textureFromCacheUsingPixelBuffer:self->_yuvSourceDownsampledBuffer textureDescriptor:v12 plane:0 textureCache:self->_textureCache];
    yuvSourceDownsampledTexture = self->_yuvSourceDownsampledTexture;
    self->_yuvSourceDownsampledTexture = v13;
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  v16 = (const void *)*MEMORY[0x1E4F1CFD0];
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F6ED60], (const void *)*MEMORY[0x1E4F1CFD0]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F6ECB8], v16);
  CVPixelBufferGetIOSurface(a3);
  CVPixelBufferGetIOSurface(self->_yuvSourceDownsampledBuffer);
  IOSurfaceAcceleratorTransformSurface();
  CVPixelBufferGetIOSurface(self->_yuvSourceDownsampledBuffer);
  CVPixelBufferGetIOSurface(a4);
  IOSurfaceAcceleratorTransformSurface();
  CFRelease(Mutable);
}

- (void)encode420HybridDownsamplingToCommandBuffer:(id)a3 source:(__CVBuffer *)a4 destination:(__CVBuffer *)a5
{
  id v9 = a3;
  yuvSourceDownsampledBuffer = self->_yuvSourceDownsampledBuffer;
  id v23 = v9;
  if (!yuvSourceDownsampledBuffer)
  {
    size_t Width = CVPixelBufferGetWidth(a4);
    size_t Height = CVPixelBufferGetHeight(a4);
    uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
    size_t v14 = Width >> 1;
    size_t v15 = Height >> 1;
    self->_yuvSourceDownsampledBuffer = [(VideoMattingMetal *)self createCVBufferWithWidth:v14 height:v15 format:PixelFormatType];
    v16 = +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats];
    v17 = [NSNumber numberWithUnsignedInt:PixelFormatType];
    char v18 = [v16 containsObject:v17];

    if ((v18 & 1) == 0)
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2 object:self file:@"VideoMattingMetal.mm" lineNumber:3061 description:@"Unexpected source format in encode420HybridDownsamplingToCommandBuffer()!"];
    }
    v19 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:500 width:v14 height:v15 mipmapped:0];
    [v19 setUsage:1];
    v20 = +[VideoMattingMetal textureFromCacheUsingPixelBuffer:self->_yuvSourceDownsampledBuffer textureDescriptor:v19 plane:0 textureCache:self->_textureCache];
    yuvSourceDownsampledTexture = self->_yuvSourceDownsampledTexture;
    self->_yuvSourceDownsampledTexture = v20;

    yuvSourceDownsampledBuffer = self->_yuvSourceDownsampledBuffer;
    id v9 = v23;
  }
  [(VideoMattingMetal *)self encode420Bilinear2xDownsamplingToCommandBuffer:v9 source:a4 destination:yuvSourceDownsampledBuffer];
  [(VideoMattingMetal *)self encode420ScalingByMPSToCommandBuffer:v23 source:self->_yuvSourceDownsampledBuffer destination:a5];
}

- (void)renderStageLightWithSource:(const __CVBuffer *)a3 alpha:(const __CVBuffer *)a4 canonicalDisparity:(const __CVBuffer *)a5 dstColor:(__CVBuffer *)a6 blackBackgroundIntensity:(float)a7 vignetteIntensity:(float)a8 isFinalStage:(BOOL)a9 callbackQueue:(id)a10 withCallback:(id)a11
{
  BOOL v11 = a9;
  id v32 = a10;
  id v31 = a11;
  if (a7 < 0.0 || a7 > 1.0)
  {
    int64x2_t v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2 object:self file:@"VideoMattingMetal.mm" lineNumber:2924 description:@"blackBackgroundIntensity not in [0,1]"];
  }
  v42[0] = 0;
  id v41 = 0;
  v21 = sub_1BA8621E4(a3);
  v22 = +[VideoMattingMetal textureFromCacheUsingPixelBuffer:a3 textureDescriptor:v21 plane:0 textureCache:self->_textureCache];

  id v23 = sub_1BA8621E4(a4);
  v24 = +[VideoMattingMetal textureFromCacheUsingPixelBuffer:a4 textureDescriptor:v23 plane:0 textureCache:self->_textureCache];

  CVPixelBufferRetain(a3);
  CVPixelBufferRetain(a4);
  CVPixelBufferRetain(a5);
  CVPixelBufferRetain(a6);
  +[VideoMattingMetal decomposeYuvPixelBuffer:a6 yTexture:v42 uvTexture:&v41 textureCache:self->_textureCache];
  [v42[0] setLabel:@"dstColorTex_Y"];
  [v41 setLabel:@"dstColorTex_uv"];
  v25 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  [v25 setLabel:@"renderContinuousWithSource"];
  *(float *)&double v26 = a7;
  *(float *)&double v27 = a8;
  [(CVAFilterRenderStagelight *)self->_stagelightFilter encodeToCommandBuffer:v25 srcColorTex:v22 srcAlphaTex:v24 dstYTex:v42[0] dstUVTex:v41 stageLightProxyLut:self->_stageLightProxyLut stageLightLut:v26 blackBackgroundIntensity:v27 vignetteIntensity:self->_stageLightLut];
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_renderingCallbackSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = sub_1BA855484;
  v33[3] = &unk_1E6228990;
  v37 = a3;
  v38 = a4;
  v39 = a5;
  id v28 = v32;
  id v34 = v28;
  v35 = self;
  id v29 = v31;
  id v36 = v29;
  v40 = a6;
  [v25 addCompletedHandler:v33];
  [v25 commit];

  self->_lastCommittedCommand = 3;
  if (v11) {
    ++self->_frameIndex;
  }
}

- (void)renderContinuousWithSource:(const __CVBuffer *)a3 segmentationPixelBuffer:(const __CVBuffer *)a4 alpha:(const __CVBuffer *)a5 canonicalDisparity:(const __CVBuffer *)a6 disparityInFocus:(float)a7 focusCanonicalDisparity:(float)a8 fNumber:(float)a9 infConvolutionScale:(float)a10 noiseBits:(float)a11 disparityUpdateRate:(float)a12 focusThresholdHardness:(float)a13 cubeIntensity:(float)a14 usePostprocessedDisparity:(BOOL)a15 dstColor:(__CVBuffer *)a16 isFinalStage:(BOOL)a17 properties:(id)a18 callbackQueue:(id)a19 withCallback:(id)a20
{
  v128[5] = *MEMORY[0x1E4F143B8];
  id v107 = a18;
  id v104 = a19;
  id v105 = a20;
  id v34 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  BOOL v102 = a15;
  [v34 setLabel:@"renderContinuousWithSource"];
  id v118 = 0;
  id v119 = 0;
  +[VideoMattingMetal decomposeYuvPixelBuffer:a16 yTexture:&v119 uvTexture:&v118 textureCache:self->_textureCache];
  [v119 setLabel:@"dstColorTextureY"];
  [v118 setLabel:@"dstColorTextureUV"];
  CVPixelBufferRetain(a3);
  CVPixelBufferRetain(a5);
  CVPixelBufferRetain(a6);
  CVPixelBufferRetain(a16);
  v106 = a6;
  pixelBuffer = a3;
  if (self->_sdofRenderingHasForegroundBlur)
  {
    if (!self->_renderStateIsConfigured)
    {
      id v123 = 0;
      v124 = &v123;
      uint64_t v125 = 0x2050000000;
      id v35 = (id)qword_1E9F768D0;
      uint64_t v126 = qword_1E9F768D0;
      if (!qword_1E9F768D0)
      {
        *(void *)__p = MEMORY[0x1E4F143A8];
        *(void *)&__p[8] = 3221225472;
        *(void *)&__p[16] = sub_1BA84E014;
        v121 = &unk_1E62286C0;
        v122 = &v123;
        sub_1BA84E014((uint64_t)__p);
        id v35 = v124[3];
      }
      id v36 = v35;
      _Block_object_dispose(&v123, 8);
      v37 = objc_msgSend(objc_alloc((Class)v36), "initWithDevice:version:colorSize:disparitySize:", self->_device, objc_msgSend(sub_1BA84DDA0(), "latestVersion"), (double)self->_width, (double)self->_height, (double)(unint64_t)-[MTLTexture width](self->_disparityInScreenAspectRatio, "width"), (double)(unint64_t)-[MTLTexture height](self->_disparityInScreenAspectRatio, "height"));
      [v37 setVerbose:0];
      uint64_t v38 = MEMORY[0x1E4F1CC28];
      v127[0] = &unk_1F1440420;
      v127[1] = &unk_1F1440438;
      v127[2] = &unk_1F1440450;
      v127[3] = &unk_1F1440468;
      v128[0] = MEMORY[0x1E4F1CC28];
      v128[1] = &unk_1F1440B38;
      v128[2] = &unk_1F1440B38;
      v128[3] = &unk_1F1440B28;
      v127[4] = &unk_1F1440480;
      int v39 = sub_1BA84F794(@"CVAPhotoDeadzoneInCinematic", @"com.apple.coremedia", 0);
      uint64_t v40 = MEMORY[0x1E4F1CC38];
      if (!v39) {
        uint64_t v40 = v38;
      }
      v128[4] = v40;
      id v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v128 forKeys:v127 count:5];
      [v37 setOptions:v41];

      v42 = (PTRenderPipeline *)[objc_alloc((Class)sub_1BA84DDA0()) initWithDescriptor:v37];
      ptRenderPipeline = self->_ptRenderPipeline;
      self->_ptRenderPipeline = v42;

      v44 = [(PTRenderPipeline *)self->_ptRenderPipeline createRenderStateWithQuality:0];
      ptRenderState = self->_ptRenderState;
      self->_ptRenderState = v44;

      id v123 = 0;
      v124 = &v123;
      uint64_t v125 = 0x2050000000;
      id v46 = (id)qword_1E9F768D8;
      uint64_t v126 = qword_1E9F768D8;
      if (!qword_1E9F768D8)
      {
        *(void *)__p = MEMORY[0x1E4F143A8];
        *(void *)&__p[8] = 3221225472;
        *(void *)&__p[16] = sub_1BA84DF4C;
        v121 = &unk_1E62286C0;
        v122 = &v123;
        sub_1BA84DF4C((uint64_t)__p);
        id v46 = v124[3];
      }
      id v47 = v46;
      _Block_object_dispose(&v123, 8);
      v48 = (PTRenderRequest *)[objc_alloc((Class)v47) init];
      ptRenderRequest = self->_ptRenderRequest;
      self->_ptRenderRequest = v48;

      [(PTRenderState *)self->_ptRenderState setSourceColorBitDepth:8];
      id v123 = 0;
      v124 = &v123;
      uint64_t v125 = 0x2050000000;
      id v50 = (id)qword_1E9F768E8;
      uint64_t v126 = qword_1E9F768E8;
      if (!qword_1E9F768E8)
      {
        *(void *)__p = MEMORY[0x1E4F143A8];
        *(void *)&__p[8] = 3221225472;
        *(void *)&__p[16] = sub_1BA84E0DC;
        v121 = &unk_1E62286C0;
        v122 = &v123;
        sub_1BA84E0DC((uint64_t)__p);
        id v50 = v124[3];
      }
      id v51 = v50;
      _Block_object_dispose(&v123, 8);
      id v52 = v51;
      if (qword_1E9F768A0 != -1) {
        dispatch_once(&qword_1E9F768A0, &unk_1F142F288);
      }
      v53 = (void *)qword_1E9F76898;
      -[PTRenderState setHwModelID:](self->_ptRenderState, "setHwModelID:", [v52 hwModelIDFromFigModelSpecificName:qword_1E9F76898]);

      self->_renderStateIsConfigured = 1;
    }
    v54 = [(VideoMattingMetal *)self getPTTextureFromLuma:v119 chroma:v118];
    *(void *)__p = 0;
    id v123 = 0;
    +[VideoMattingMetal decomposeYuvPixelBuffer:a3 yTexture:__p uvTexture:&v123 textureCache:self->_textureCache];
    v55 = [v34 blitCommandEncoder];
    [v55 copyFromTexture:*(void *)__p toTexture:v119];
    [v55 copyFromTexture:v123 toTexture:v118];
    [v55 endEncoding];
    v56 = [(VideoMattingMetal *)self getPTTextureFromLuma:*(void *)__p chroma:v123];
    v57 = sub_1BA8621E4(a6);
    v58 = a6;
    v59 = a16;
    v60 = +[VideoMattingMetal textureFromCacheUsingPixelBuffer:v58 textureDescriptor:v57 plane:0 textureCache:self->_textureCache];
    [(VideoMattingMetal *)self encodeRotateAndFitIntoRectWithCommandBuffer:v34 inTexture:v60 outTexture:self->_disparityInScreenAspectRatio rotateClockwise:0];
    CGPoint origin = self->_primaryCaptureRect.origin;
    CGSize size = self->_primaryCaptureRect.size;
    [(VideoMattingMetal *)self updateRenderRequestwithPerFrameMetadata:self->_sbufMetadata properties:v107];
    [(PTRenderRequest *)self->_ptRenderRequest setRenderState:self->_ptRenderState];
    [(PTRenderRequest *)self->_ptRenderRequest setSourceColor:v56];
    [(PTRenderRequest *)self->_ptRenderRequest setSourceDisparity:self->_disparityInScreenAspectRatio];
    [(PTRenderRequest *)self->_ptRenderRequest setDestinationColor:v54];
    double v61 = a9 / 1.149;
    *(float *)&double v61 = v61;
    [(PTRenderRequest *)self->_ptRenderRequest setFNumber:v61];
    *(float *)&double v62 = a8;
    [(PTRenderRequest *)self->_ptRenderRequest setFocusDisparity:v62];
    v63 = self->_ptRenderRequest;
    v117[0] = vcvtq_u64_f64((float64x2_t)origin);
    v117[1] = vcvtq_u64_f64((float64x2_t)size);
    [(PTRenderRequest *)v63 setScissorRect:v117];
    [(PTRenderRequest *)self->_ptRenderRequest setColorCube:self->_fgColorLut];
    [(PTRenderPipeline *)self->_ptRenderPipeline encodeRenderTo:v34 withRenderRequest:self->_ptRenderRequest];
  }
  else
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76540, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1E9F76540))
    {
      v97 = +[CVAPreferenceManager defaults];
      char v98 = [v97 BOOLForKey:@"CVAPhotoDebugStyle"];

      byte_1E9F76C00 = v98;
      __cxa_guard_release(&qword_1E9F76540);
    }
    if (byte_1E9F76C00)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"fNumber = %f", a9);
    }
    self->_infConvolutionScale = a10;
    int lastCommittedCommand = self->_lastCommittedCommand;
    if ((lastCommittedCommand - 1) >= 2)
    {
      v65 = [MEMORY[0x1E4F28B00] currentHandler];
      [v65 handleFailureInMethod:a2, self, @"VideoMattingMetal.mm", 2769, @"renderContinuousWithSource called in the wrong state: %d not in {%d, %d}", self->_lastCommittedCommand, 1, 2 object file lineNumber description];

      int lastCommittedCommand = self->_lastCommittedCommand;
    }
    if (lastCommittedCommand == 2) {
      NSLog(&cfstr_Rendercontinuo_1.isa);
    }
    sub_1BA862478((uint64_t *)__p, a3, a5, self->_device);
    v54 = *(void **)__p;
    v101 = *(void **)&__p[8];
    size_t Width = CVPixelBufferGetWidth(a3);
    size_t Height = CVPixelBufferGetHeight(a3);
    id v68 = [(CVAPhotoMTLRingBuffer *)self->_disparityConfig advancedBuffer];
    uint64_t v69 = [v68 contents];

    *(float *)&double v70 = a12;
    [(VideoMattingMetal *)self setRenderingDisparityUpdateRate:v70];
    *(float *)uint64_t v69 = a8;
    *(float *)(v69 + 4) = a8 * 0.5;
    [(VideoMattingMetal *)self renderingDisparityUpdateRate];
    *(_DWORD *)(v69 + 8) = v71;
    float v72 = 1.0 / a8;
    if (a8 <= 0.001) {
      float v72 = 1000.0;
    }
    *(float *)(v69 + 20) = a7;
    *(float *)(v69 + 24) = v72;
    *(float *)(v69 + 28) = v72 + v72;
    *(unsigned char *)(v69 + 32) = self->_frameIndex == 0;
    float v73 = 1.0 / fmaxf((float)(a8 - a7) * a13, 0.001);
    *(float *)(v69 + 12) = v73;
    *(float *)(v69 + 16) = a8 - (float)(1.0 / v73);
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76548, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1E9F76548))
    {
      qword_1E9F76558 = [NSNumber numberWithBool:0];
      __cxa_guard_release(&qword_1E9F76548);
    }
    if ((byte_1E9F76550 & 1) == 0)
    {
      __p[23] = 21;
      strcpy(__p, "newCoCFormulaDisabled");
      sub_1BA81CE64((uint64_t)&qword_1E9F76558, (uint64_t)__p);
      if ((__p[23] & 0x80000000) != 0) {
        operator delete(*(void **)__p);
      }
      byte_1E9F76550 = 1;
    }
    if ([(id)qword_1E9F76558 BOOLValue]) {
      unint64_t v78 = 0;
    }
    else {
      unint64_t v78 = ((unint64_t)sub_1BA81EA6C([v107 videoPipelineDevice]) >> 48) & 1;
    }
    if (Width <= Height) {
      unint64_t v79 = Height;
    }
    else {
      unint64_t v79 = Width;
    }
    *(float *)&double v77 = (float)v79;
    *(float *)&double v75 = a8;
    *(float *)&double v76 = a9;
    *(float *)&double v74 = self->_renderingLensFocalLength_mm;
    [(VideoMattingMetal *)self blurRadiusAndStdAtInfinityForFocalLength:v78 focusCanonicalDisparity:v74 fNumber:v75 xResolution:v76 useNewCoCFormula:v77];
    unsigned int v81 = v80;
    int v83 = v82;
    unsigned int frameIndex = self->_frameIndex;
    unsigned int v85 = (Height >> 1) - 1;
    if ((Height >> 1) <= 1)
    {
      NSLog(&cfstr_ErrorLargestco.isa);
      unsigned int v85 = 0;
    }
    float v86 = ceilf(a11);
    if (a11 < 0.0) {
      float v87 = 4.0;
    }
    else {
      float v87 = v86;
    }
    float v88 = 1.0;
    if (a11 >= 0.0) {
      float v88 = exp2f(a11 - v86);
    }
    [(CVAFilterColorAlphaToFgBg *)self->_colorAlphaToFgBg encodeToCommandBuffer:v34 srcColorTex:v54 srcAlphaTex:v101 dstForegroundTex:0 dstBackgroundTex:self->_bg];
    if (self->_renderingUsesPostprocessing && v102) {
      v89 = &OBJC_IVAR___VideoMattingMetal__smoothDisparity;
    }
    else {
      v89 = &OBJC_IVAR___VideoMattingMetal__disparity;
    }
    [(VideoMattingMetal *)self encodeDisparitySmoothingToCommandBuffer:v34 disparity:*(Class *)((char *)&self->super.super.isa + 8 * (self->_frameIndex & 1) + *v89)];
    if (self->_isBgColorLutBlack)
    {
      v91 = self->_bg;
    }
    else
    {
      LODWORD(v90) = v83;
      [(CVAFilterMaskedVariableBlur *)self->_maskedVariableBlur encodeToCommandBuffer:v34 source:self->_bg destination:self->_blurredBg mask:self->_coc maxBlurRadius:v90];
      v91 = self->_blurredBg;
    }
    unint64_t v94 = (unint64_t)v81 << 32;
    if (!v78) {
      unint64_t v94 = 0;
    }
    LODWORD(v99) = (int)v87;
    *(float *)&double v92 = v88;
    *(float *)&double v93 = a14;
    -[CVAFilterRenderComposite encodeToCommandBuffer:srcForegroundTex:srcBackgroundTex:srcCocTex:dstYTex:dstUVTex:fgColorLut:bgColorLut:frameNumber:seedGeneratorFactor:noiseBits:noiseBitsFactor:cubeIntensity:maxBlurRadius:](self->_renderComposite, "encodeToCommandBuffer:srcForegroundTex:srcBackgroundTex:srcCocTex:dstYTex:dstUVTex:fgColorLut:bgColorLut:frameNumber:seedGeneratorFactor:noiseBits:noiseBitsFactor:cubeIntensity:maxBlurRadius:", v34, v54, v91, self->_coc, v119, v118, v92, v93, self->_fgColorLut, self->_bgColorLut, __PAIR64__(v85, frameIndex), v99, v94 | v78);

    v59 = a16;
  }

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_renderingCallbackSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v110[0] = MEMORY[0x1E4F143A8];
  v110[1] = 3221225472;
  v110[2] = sub_1BA856548;
  v110[3] = &unk_1E6228990;
  v114 = a5;
  v115 = v106;
  v113 = pixelBuffer;
  v110[4] = self;
  id v95 = v104;
  id v111 = v95;
  id v96 = v105;
  id v112 = v96;
  v116 = v59;
  [v34 addCompletedHandler:v110];
  [v34 commit];

  self->_int lastCommittedCommand = 3;
  if (a17) {
    ++self->_frameIndex;
  }
}

- (void)updateRenderRequestwithPerFrameMetadata:(id)a3 properties:(id)a4
{
  id v40 = a3;
  id v6 = a4;
  v7 = [v40 objectForKeyedSubscript:@"FinalCropRectFromSource"];

  if (v7)
  {
    int64x2_t v8 = [v40 objectForKeyedSubscript:@"FinalCropRectFromSource"];
    id v9 = [v8 objectForKeyedSubscript:@"Width"];
    [v9 floatValue];
    float v11 = v10;
    size_t v12 = [v40 objectForKeyedSubscript:@"FinalCropRectFromSource"];
    size_t v13 = [v12 objectForKeyedSubscript:@"Height"];
    [v13 floatValue];
    float v15 = v14;

    sub_1BA81EA6C([v6 videoPipelineDevice]);
    *(float *)v16.i32 = 1.0 / v11;
    *(float *)&v16.i32[1] = 1.0 / v15;
    int8x8_t v18 = (int8x8_t)vceqd_s64(v17 & 1, 0);
    __asm { FMOV            V2.2S, #1.0 }
    _D8 = (float32x2_t)vbsl_s8(v18, v16, _D2);
    double v25 = COERCE_DOUBLE(vbsl_s8(v18, _D2, v16));
  }
  else
  {
    __asm { FMOV            V8.2S, #1.0 }
    double v25 = *(double *)&_D8;
  }
  int width = self->_width;
  double v28 = self->_primaryCaptureRect.size.width;
  double height = self->_primaryCaptureRect.size.height;
  int v29 = self->_height;
  [(PTRenderRequest *)self->_ptRenderRequest setVisCropFactor:v25];
  float v30 = v28;
  float v31 = v30 / (float)width;
  float v32 = height;
  float v33 = v32 / (float)v29;
  if (v31 >= v33) {
    float v31 = v33;
  }
  [(PTRenderRequest *)self->_ptRenderRequest setVisCropFactorPreview:COERCE_DOUBLE(vmul_n_f32(_D8, v31))];
  id v34 = [v40 objectForKeyedSubscript:@"FocalLenIn35mmFilm"];
  [v34 floatValue];
  -[PTRenderRequest setFocalLenIn35mmFilm:](self->_ptRenderRequest, "setFocalLenIn35mmFilm:");

  id v35 = [v40 objectForKeyedSubscript:@"SensorID"];
  -[PTRenderRequest setSensorID:](self->_ptRenderRequest, "setSensorID:", [v35 intValue]);

  id v36 = [v40 objectForKeyedSubscript:@"ConversionGain"];
  -[PTRenderRequest setConversionGain:](self->_ptRenderRequest, "setConversionGain:", [v36 intValue]);

  v37 = [v40 objectForKeyedSubscript:@"ReadNoise_1x"];
  -[PTRenderRequest setReadNoise_1x:](self->_ptRenderRequest, "setReadNoise_1x:", [v37 intValue]);

  uint64_t v38 = [v40 objectForKeyedSubscript:@"ReadNoise_8x"];
  -[PTRenderRequest setReadNoise_8x:](self->_ptRenderRequest, "setReadNoise_8x:", [v38 intValue]);

  int v39 = [v40 objectForKeyedSubscript:@"AGC"];
  -[PTRenderRequest setAGC:](self->_ptRenderRequest, "setAGC:", [v39 intValue]);
}

- (id)getPTTextureFromLuma:(id)a3 chroma:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v12 = 0;
  size_t v13 = &v12;
  uint64_t v14 = 0x2050000000;
  v7 = (void *)qword_1E9F768E0;
  uint64_t v15 = qword_1E9F768E0;
  if (!qword_1E9F768E0)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1BA84DCD8;
    v11[3] = &unk_1E62286C0;
    v11[4] = &v12;
    sub_1BA84DCD8((uint64_t)v11);
    v7 = (void *)v13[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v12, 8);
  id v9 = [v8 createYUV420:v5 chroma:v6];
  [v9 setColorPrimaries:*MEMORY[0x1E4F1ED00]];
  [v9 setTransferFunction:*MEMORY[0x1E4F24BE0]];
  [v9 setYCbCrMatrix:*MEMORY[0x1E4F24C40]];
  [v9 setYCbCrColorDepth:8];
  [v9 setYCbCrFullRange:1];

  return v9;
}

- (void)encodeDisparitySmoothingToCommandBuffer:(id)a3 disparity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 computeCommandEncoder];
  [v8 setLabel:@"_renderingDisparityDeweightKernel"];
  [v8 setComputePipelineState:self->_renderingDisparityDeweightKernel];
  [v8 setTexture:v7 atIndex:0];
  [v8 setTexture:self->_deweightedDisparity atIndex:1];
  id v9 = [(CVAPhotoMTLRingBuffer *)self->_disparityConfig currentBuffer];
  [v8 setBuffer:v9 offset:0 atIndex:0];

  v17[0] = (unint64_t)([v7 width] + 15) >> 4;
  v17[1] = (unint64_t)([v7 height] + 15) >> 4;
  v17[2] = 1;
  uint64_t v16 = 1;
  long long v15 = xmmword_1BA86C930;
  [v8 dispatchThreadgroups:v17 threadsPerThreadgroup:&v15];
  [v8 endEncoding];
  [(MPSImageBox *)self->_disparityBlurBoxKernel encodeToCommandBuffer:v6 sourceTexture:self->_deweightedDisparity destinationTexture:self->_shift[self->_frameIndex & 1]];
  [(CVAFilterBox *)self->_boxFilter encodeToCommandBuffer:v6 inTexture:self->_colorSim outTexture:self->_colorSim radius:5 normalize:2];
  float v10 = [v6 computeCommandEncoder];

  [v10 setLabel:@"_renderingDisparityFillAndFilterKernel"];
  [v10 setComputePipelineState:self->_renderingDisparityFillAndFilterKernel];
  [v10 setTexture:self->_shift[(self->_frameIndex & 1) == 0] atIndex:0];
  [v10 setTexture:self->_shift[self->_frameIndex & 1] atIndex:1];
  [v10 setTexture:self->_colorSim atIndex:2];
  [v10 setTexture:self->_shift[self->_frameIndex & 1] atIndex:3];
  [v10 setTexture:self->_coc atIndex:4];
  float v11 = [(CVAPhotoMTLRingBuffer *)self->_disparityConfig currentBuffer];
  [v10 setBuffer:v11 offset:0 atIndex:0];

  v14[0] = (unint64_t)([v7 width] + 15) >> 4;
  v14[1] = (unint64_t)([v7 height] + 15) >> 4;
  v14[2] = 1;
  uint64_t v13 = 1;
  long long v12 = xmmword_1BA86C930;
  [v10 dispatchThreadgroups:v14 threadsPerThreadgroup:&v12];
  [v10 endEncoding];
}

- (pair<float,)blurRadiusAndStdAtInfinityForFocalLength:(float)a3 focusCanonicalDisparity:(float)a4 fNumber:(float)a5 xResolution:(float)a6 useNewCoCFormula:(BOOL)a7
{
  BOOL v7 = a7;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76630, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76630))
  {
    double v27 = +[CVAPreferenceManager defaults];
    char v28 = [v27 BOOLForKey:@"CVAPhotoDebugCoC"];

    byte_1E9F76BF8 = v28;
    __cxa_guard_release(&qword_1E9F76630);
  }
  if (byte_1E9F76BF8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"f_mm = %f", a3);

    objc_msgSend(NSString, "stringWithFormat:", @"disparity = %f", a4);
    objc_msgSend(NSString, "stringWithFormat:", @"fDist_mm = %f", (float)(1000.0 / a4));

    objc_msgSend(NSString, "stringWithFormat:", @"fN = %f", a5);
    objc_msgSend(NSString, "stringWithFormat:", @"useNewCoCFormula = %d", v7);
  }
  if (a4 >= 2048.0)
  {
    float v17 = 0.0;
    if (byte_1E9F76BF8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"cocRadiusInPixels = %d", 0);

      objc_msgSend(NSString, "stringWithFormat:", @"maxBlurRadius = %d", 0);
    }
    float v15 = 0.0;
  }
  else if (v7)
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76758, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1E9F76758))
    {
      LODWORD(v29) = 1057896676;
      qword_1E9F76850 = [NSNumber numberWithFloat:v29];
      __cxa_guard_release(&qword_1E9F76758);
    }
    if ((byte_1E9F76848 & 1) == 0)
    {
      char v31 = 9;
      strcpy((char *)__p, "blurScale");
      sub_1BA81CE64((uint64_t)&qword_1E9F76850, (uint64_t)__p);
      if (v31 < 0) {
        operator delete(__p[0]);
      }
      byte_1E9F76848 = 1;
    }
    float v12 = (float)((float)(a6 / 36.0) * (float)((float)((float)(a3 * a3) * fmaxf(a4, 0.0)) / (float)(a5 * 1000.0))) * 0.5;
    [(id)qword_1E9F76850 floatValue];
    float v15 = v12 * v14;
    if ((float)(v12 * v14) >= 2.0) {
      float v16 = log2f(v15);
    }
    else {
      float v16 = v15 * 0.5;
    }
    float v22 = (pow(6.0, (float)(v16 - floorf(v16))) + -1.0) / 5.0 + v13;
    float v17 = exp2f(v22 * 1.585) + 0.5;
    if (byte_1E9F76BF8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"cocRadiusInPixels = %f", v12);

      id v23 = NSString;
      [(id)qword_1E9F76850 floatValue];
      objc_msgSend(v23, "stringWithFormat:", @"blurScale = %f", v24);

      objc_msgSend(NSString, "stringWithFormat:", @"maxBlurRadiusStd = %f", v15);
      objc_msgSend(NSString, "stringWithFormat:", @"mipLevel = %f", v22);

      objc_msgSend(NSString, "stringWithFormat:", @"effectiveRadiusInPixels = %f", v17);
      goto LABEL_25;
    }
  }
  else
  {
    float v18 = (float)((float)(a6 / 36.0) * (float)((float)((float)(a3 * a3) * fmaxf(a4, 0.0)) / (float)(a5 * 1000.0))) * 0.5;
    float v15 = v18 * 0.46111;
    if ((float)(v18 * 0.46111) >= 2.0) {
      float v19 = log2f(v18 * 0.46111);
    }
    else {
      float v19 = v15 * 0.5;
    }
    float v17 = 0.0;
    if (byte_1E9F76BF8)
    {
      float v20 = floorf(v19);
      float v21 = (pow(6.0, (float)(v19 - v20)) + -1.0) / 5.0 + v20;
      objc_msgSend(NSString, "stringWithFormat:", @"cocRadiusInPixels = %f", v18);

      objc_msgSend(NSString, "stringWithFormat:", @"blurScale = %f", 0x3FDD82D840000000);
      objc_msgSend(NSString, "stringWithFormat:", @"maxBlurRadiusStd = %f", v15);

      objc_msgSend(NSString, "stringWithFormat:", @"mipLevel = %f", v21);
LABEL_25:
    }
  }
  float v25 = v17;
  float v26 = v15;
  result.var1 = v26;
  result.var0 = v25;
  return result;
}

- (void)encodeDisparityDecimateToCommandBuffer:(id)a3 canonicalDisparity:(__CVBuffer *)a4 disparityOut:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  size_t Width = CVPixelBufferGetWidth(a4);
  size_t Height = CVPixelBufferGetHeight(a4);
  uint64_t v12 = [v9 width];
  uint64_t v13 = [v9 height];
  if (CVPixelBufferGetPixelFormatType(a4) == 1751411059) {
    uint64_t v14 = 25;
  }
  else {
    uint64_t v14 = 55;
  }
  float v15 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:v14 width:Width height:Height mipmapped:0];
  float v16 = +[VideoMattingMetal textureFromCacheUsingPixelBuffer:a4 textureDescriptor:v15 plane:0 textureCache:self->_textureCache];
  if (self->_sdofRenderingHasForegroundBlur)
  {
    [(VideoMattingMetal *)self encodeRotateAndFitIntoRectWithCommandBuffer:v8 inTexture:v16 outTexture:v9 rotateClockwise:0];
  }
  else
  {
    float v17 = [v8 computeCommandEncoder];
    [v17 setLabel:@"_disparityDecimateKernel"];
    [v17 setComputePipelineState:self->_disparityDecimateKernel];
    [v17 setTexture:v16 atIndex:0];
    [v17 setTexture:v9 atIndex:1];
    v20[0] = (unint64_t)(v12 + 15) >> 4;
    v20[1] = (unint64_t)(v13 + 15) >> 4;
    v20[2] = 1;
    uint64_t v19 = 1;
    long long v18 = xmmword_1BA86C930;
    [v17 dispatchThreadgroups:v20 threadsPerThreadgroup:&v18];
    [v17 endEncoding];
  }
}

- (void)encodeForegroundMaskToBuffer:(id)a3 disparity:(id)a4 inSegmentation:(id)a5 useSegmentationOnly:(BOOL)a6 weight:(id)a7 foregroundMask:(id)a8 erodedForegroundMask:(id)a9 disparityMin:(float)a10 focusDisparity:(float)a11 hardness:(float)a12 minDistToDeweight:(float)a13 unconfidentWeight:(float)a14 dilateForegroundMask:(BOOL)a15 foregroundMaskDilationRadius:(float)a16 properties:(id)a17
{
  BOOL v19 = a6;
  id v46 = a3;
  id v29 = a4;
  id v45 = a5;
  id v30 = a7;
  id v31 = a8;
  id v32 = a9;
  id v33 = a17;
  sub_1BA81EA6C([v33 videoPipelineDevice]);
  p_correctlyRotatedAndReshapedSegmentation = &self->_correctlyRotatedAndReshapedSegmentation;
  if (v35) {
    [(VideoMattingMetal *)self encodeRotateAndFitIntoRectWithCommandBuffer:v46 inTexture:v45 outTexture:*p_correctlyRotatedAndReshapedSegmentation rotateClockwise:1];
  }
  else {
    objc_storeStrong((id *)&self->_correctlyRotatedAndReshapedSegmentation, a5);
  }
  *(float *)&double v36 = a10;
  *(float *)&double v37 = a11;
  *(float *)&double v38 = a12;
  *(float *)&double v39 = a13;
  *(float *)&double v40 = a14;
  [(VideoMattingMetal *)self encodeDisparityMasksToCommandBuffer:v46 inputDisparity:v29 inputSegmentation:*p_correctlyRotatedAndReshapedSegmentation useSegmentationOnly:v19 outputForegroundMask:v31 outputIsForeground:self->_isForegroundTexture disparityMin:v36 focusDisparity:v37 hardness:v38 minDistToDeweight:v39 unconfidentWeight:v40];
  [(CVAFilterDistanceTransform *)self->_distanceTransform encodeToCommandBuffer:v46 sourceTexture:self->_isForegroundTexture destinationTexture:self->_distanceToForegroundTexture];
  LOBYTE(v44) = a15;
  *(float *)&double v41 = a13;
  *(float *)&double v42 = a14;
  *(float *)&double v43 = a16;
  [(VideoMattingMetal *)self encodeGuidedFilterWeightToCommandBuffer:v46 inputDisparity:v29 inputSegmentation:*p_correctlyRotatedAndReshapedSegmentation useSegmentationOnly:v19 inputForegroundDistance:self->_distanceToForegroundTexture outputForegroundMask:v31 outputWeight:v41 minDistToDeweight:v42 unconfidentWeight:v43 dilateForegroundMask:v30 foregroundMaskDilationRadius:v44];
  if (v32) {
    [(MPSImageAreaMin *)self->_fgMaskErosionKernel encodeToCommandBuffer:v46 sourceTexture:v31 destinationTexture:v32];
  }
}

- (void)encodeRotateAndFitIntoRectWithCommandBuffer:(id)a3 inTexture:(id)a4 outTexture:(id)a5 rotateClockwise:(BOOL)a6
{
  id v10 = a4;
  id v11 = a5;
  BOOL v19 = a6;
  *(float32x2_t *)v12.f32 = vcvt_f32_s32(*(int32x2_t *)&self->_width);
  v12.i64[1] = v12.i64[0];
  float32x4_t v18 = vdivq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)self->_primaryCaptureRect.origin), (float64x2_t)self->_primaryCaptureRect.size), v12);
  uint64_t v13 = [a3 computeCommandEncoder];
  [v13 setLabel:@"_rotateAndFitIntoRectKernel"];
  [v13 setComputePipelineState:self->_rotateAndFitIntoRectKernel];
  [v13 setTexture:v10 atIndex:0];
  [v13 setTexture:v11 atIndex:1];
  [v13 setBytes:&v18 length:16 atIndex:0];
  [v13 setBytes:&v19 length:1 atIndex:1];
  unint64_t v14 = [(MTLComputePipelineState *)self->_rotateAndFitIntoRectKernel threadExecutionWidth];
  unint64_t v15 = [(MTLComputePipelineState *)self->_rotateAndFitIntoRectKernel maxTotalThreadsPerThreadgroup];
  v17[0] = [v11 width];
  v17[1] = [v11 height];
  v17[2] = 1;
  v16[0] = v14;
  v16[1] = v15 / v14;
  v16[2] = 1;
  [v13 dispatchThreads:v17 threadsPerThreadgroup:v16];
  [v13 endEncoding];
}

- (void)encodeGuidedFilterWeightToCommandBuffer:(id)a3 inputDisparity:(id)a4 inputSegmentation:(id)a5 useSegmentationOnly:(BOOL)a6 inputForegroundDistance:(id)a7 outputForegroundMask:(id)a8 outputWeight:(id)a9 minDistToDeweight:(float)a10 unconfidentWeight:(float)a11 dilateForegroundMask:(BOOL)a12 foregroundMaskDilationRadius:(float)a13
{
  _S8 = a13;
  id v23 = a3;
  id v24 = a4;
  id v25 = a5;
  id v26 = a7;
  id v27 = a8;
  id v28 = a9;
  uint64_t v29 = [v26 width];
  if (v29 != [v24 width])
  {
    double v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2 object:self file:@"VideoMattingMetal.mm" lineNumber:2207 description:@"Precondition: inputForegroundDistance.width == disparity.width"];
  }
  uint64_t v30 = [v26 height];
  if (v30 != [v24 height])
  {
    double v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2 object:self file:@"VideoMattingMetal.mm" lineNumber:2209 description:@"Precondition: inputForegroundDistance.height == disparity.height"];
  }
  uint64_t v31 = [v28 width];
  if (v31 != [v24 width])
  {
    double v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2 object:self file:@"VideoMattingMetal.mm" lineNumber:2210 description:@"Precondition: outputWeight.width == disparity.width"];
  }
  uint64_t v32 = [v28 height];
  if (v32 != [v24 height])
  {
    double v42 = [MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInMethod:a2 object:self file:@"VideoMattingMetal.mm" lineNumber:2211 description:@"Precondition: outputWeight.height == disparity.height"];
  }
  *(float *)id v46 = a10;
  *(float *)&v46[1] = a11;
  BOOL v47 = a6;
  BOOL v49 = a12;
  __asm { FCVT            H0, S8 }
  __int16 v48 = _H0;
  double v38 = [v23 computeCommandEncoder];
  [v38 setLabel:@"_guidedFilterWeightKernel"];
  [v38 setComputePipelineState:self->_guidedFilterWeightKernel];
  [v38 setTexture:v24 atIndex:0];
  [v38 setTexture:v26 atIndex:1];
  [v38 setTexture:v25 atIndex:2];
  [v38 setTexture:v28 atIndex:3];
  [v38 setTexture:v27 atIndex:4];
  [v38 setBytes:v46 length:16 atIndex:0];
  v45[0] = (unint64_t)([v24 width] + 15) >> 4;
  v45[1] = (unint64_t)([v24 height] + 15) >> 4;
  v45[2] = 1;
  uint64_t v44 = 1;
  long long v43 = xmmword_1BA86C930;
  [v38 dispatchThreadgroups:v45 threadsPerThreadgroup:&v43];
  [v38 endEncoding];
}

- (void)encodeScaleSourceToCommandBuffer:(id)a3 source:(__CVBuffer *)a4 targetWidth:(unint64_t)a5 targetHeight:(unint64_t)a6
{
  id v27 = a3;
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
  id v11 = +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats];
  float32x4_t v12 = [NSNumber numberWithUnsignedInt:PixelFormatType];
  int v13 = [v11 containsObject:v12];

  if (v13) {
    uint64_t v14 = 500;
  }
  else {
    uint64_t v14 = 70;
  }
  unint64_t v15 = self->_frameIndex & 1;
  scaledSource = self->_scaledSource;
  if (!self->_scaledSource[v15])
  {
    if (v13) {
      uint64_t v17 = PixelFormatType;
    }
    else {
      uint64_t v17 = 1111970369;
    }
    self->_scaledSourceCV[v15] = [(VideoMattingMetal *)self createCVBufferWithWidth:a5 height:a6 format:v17];
    float32x4_t v18 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:v14 width:a5 height:a6 mipmapped:0];
    [v18 setUsage:3];
    uint64_t v19 = +[VideoMattingMetal textureFromCacheUsingPixelBuffer:self->_scaledSourceCV[v15] textureDescriptor:v18 plane:0 textureCache:self->_textureCache];
    float v20 = scaledSource[v15];
    scaledSource[v15] = (MTLTexture *)v19;
  }
  float v21 = +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats];
  float v22 = [NSNumber numberWithUnsignedInt:PixelFormatType];
  int v23 = [v21 containsObject:v22];

  if (v23)
  {
    [(VideoMattingMetal *)self encode420HybridDownsamplingToCommandBuffer:v27 source:a4 destination:self->_scaledSourceCV[v15]];
  }
  else
  {
    size_t Width = CVPixelBufferGetWidth(a4);
    id v25 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:v14 width:Width height:CVPixelBufferGetHeight(a4) mipmapped:0];
    id v26 = +[VideoMattingMetal textureFromCacheUsingPixelBuffer:a4 textureDescriptor:v25 plane:0 textureCache:self->_textureCache];
    [(CVAFilterHybridResampling *)self->_hybridResampler encodeHybridDownsamplingToCommandBuffer:v27 source:v26 destination:scaledSource[v15]];
  }
}

- (__CVBuffer)createCVBufferWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  CVPixelBufferRef v11 = 0;
  uint64_t v12 = *MEMORY[0x1E4F24D20];
  v13[0] = MEMORY[0x1E4F1CC08];
  CFDictionaryRef v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a3, a4, a5, v8, &v11);
  id v9 = v11;

  return v9;
}

- (void)encodeFilterCoefficientToBuffer:(id)a3 inputCoeff:(id)a4 prevCoeff:(id)a5 outCoeff:(id)a6 inColorSim:(id)a7 updateRate:(float)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  uint64_t v19 = [v15 width];
  uint64_t v20 = [v15 height];
  v25[0] = self->_frameIndex != 0;
  float v26 = 1.0 - a8;
  float v21 = [v14 computeCommandEncoder];
  [v21 setLabel:@"_temporalCoefficientsFilterKernel"];
  [v21 setComputePipelineState:self->_temporalCoefficientsFilterKernel];
  [v21 setTexture:v15 atIndex:0];
  [v21 setTexture:v16 atIndex:1];
  [v21 setTexture:v17 atIndex:2];
  [v21 setTexture:v18 atIndex:3];
  [v21 setBytes:v25 length:12 atIndex:0];
  v24[0] = (unint64_t)(v19 + 15) >> 4;
  v24[1] = (unint64_t)(v20 + 15) >> 4;
  v24[2] = 1;
  int64x2_t v22 = vdupq_n_s64(0x10uLL);
  uint64_t v23 = 1;
  [v21 dispatchThreadgroups:v24 threadsPerThreadgroup:&v22];
  [v21 endEncoding];
}

- (void)initSourceTexture:(__CVBuffer *)a3
{
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  id v10 = +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats];
  BOOL v7 = [NSNumber numberWithUnsignedInt:PixelFormatType];
  int v8 = [v10 containsObject:v7];

  if (v8) {
    uint64_t v9 = 500;
  }
  else {
    uint64_t v9 = 70;
  }
  id v11 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:v9 width:Width height:Height mipmapped:0];
  [v11 setStorageMode:0];
}

- (void)alphaMattingWithPostprocessedDisparity:(const __CVBuffer *)a3 source:(const __CVBuffer *)a4 inSegmentation:(__CVBuffer *)a5 alpha:(__CVBuffer *)a6 staticParams:(const VideoMattingStaticParams *)a7 dynamicParams:(const void *)a8 usePostprocessedDisparity:(BOOL)a9 isFinalStage:(BOOL)a10 dilateForegroundMask:(BOOL)a11 properties:(id)a12 callbackQueue:(id)a13 callback:(id)a14
{
  id v66 = a12;
  id v62 = a13;
  id v61 = a14;
  uint64_t v19 = sub_1BA8621E4(a4);
  uint64_t v20 = +[VideoMattingMetal textureFromCacheUsingPixelBuffer:a4 textureDescriptor:v19 plane:0 textureCache:self->_textureCache];

  v63 = (void *)v20;
  if (a5)
  {
    float v21 = sub_1BA8621E4(a5);
    v65 = +[VideoMattingMetal textureFromCacheUsingPixelBuffer:a5 textureDescriptor:v21 plane:0 textureCache:self->_textureCache];
  }
  else
  {
    v65 = 0;
  }
  int64x2_t v22 = sub_1BA8621E4(a6);
  uint64_t v23 = +[VideoMattingMetal textureFromCacheUsingPixelBuffer:a6 textureDescriptor:v22 plane:0 textureCache:self->_textureCache];

  float v24 = *((float *)a8 + 4);
  float v25 = *((float *)a8 + 10);
  v60 = (void *)v23;
  if (sub_1BA849834())
  {
    objc_msgSend(NSString, "stringWithFormat:", @"focusCanonicalDisparity = %5.3f", *((float *)a8 + 4));

    objc_msgSend(NSString, "stringWithFormat:", @"alphaMatte.cutoffCanonicalDisparity = %5.3f", (float)(*((float *)a8 + 4) - *((float *)a8 + 10)));
    objc_msgSend(NSString, "stringWithFormat:", @"alphaMatteDeltaCanonicalDisparity = %5.3f", *((float *)a8 + 10));

    float v26 = *((float *)a8 + 4);
    double v27 = 1.0 / (float)(v26 - *((float *)a8 + 10));
    double v28 = 1.0 / v26;
    float v29 = v27 - v28;
    *(float *)&double v27 = v27;
    objc_msgSend(NSString, "stringWithFormat:", @"alphaMatte.focus = %5.3fm delta = %5.3fm cutoff = %5.3fm", *(void *)&v28, v29, *(float *)&v27);
  }
  float v30 = *((float *)a8 + 2);
  float v31 = atan2f(*((float *)a8 + 8), *((float *)a8 + 7));
  v59 = a6;
  uint64_t v32 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  [v32 setLabel:@"alphaMattingWithPostprocessedDisparity"];
  *(float *)&double v33 = 1.0
                 / (float)((float)((float)((float)(v30 / 255.0) * (float)(v30 / 255.0))
                                 + (float)((float)(v30 / 255.0) * (float)(v30 / 255.0)))
                         * 3.0);
  [(VideoMattingMetal *)self encodeColorSimToCommandBuffer:v32 prevSource:self->_scaledSource[!(self->_frameIndex & 1)] currSource:self->_scaledSource[self->_frameIndex & 1] destination:self->_colorSim similarityScaleFactor:v33];
  if (self->_mattingUsesPostprocessing && a9) {
    double v40 = &OBJC_IVAR___VideoMattingMetal__smoothDisparity;
  }
  else {
    double v40 = &OBJC_IVAR___VideoMattingMetal__disparity;
  }
  LODWORD(v35) = *((_DWORD *)a8 + 4);
  LODWORD(v36) = *((_DWORD *)a8 + 6);
  *(float *)&double v38 = a7->guidedFilterUnconfidentWeight;
  *(float *)&double v37 = a7->guidedFilterMinDistToDeweight;
  *(float *)&double v39 = a7->foregroundMaskDilationRadius;
  LOBYTE(v56) = a11;
  *(float *)&double v34 = v24 - v25;
  -[VideoMattingMetal encodeForegroundMaskToBuffer:disparity:inSegmentation:useSegmentationOnly:weight:foregroundMask:erodedForegroundMask:disparityMin:focusDisparity:hardness:minDistToDeweight:unconfidentWeight:dilateForegroundMask:foregroundMaskDilationRadius:properties:](self, "encodeForegroundMaskToBuffer:disparity:inSegmentation:useSegmentationOnly:weight:foregroundMask:erodedForegroundMask:disparityMin:focusDisparity:hardness:minDistToDeweight:unconfidentWeight:dilateForegroundMask:foregroundMaskDilationRadius:properties:", v32, *(Class *)((char *)&self->super.super.isa + 8 * (self->_frameIndex & 1) + *v40), v34, v35, v36, v37, v38, v39, 0, v56, v66);
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76528, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76528))
  {
    LODWORD(v55) = 1008981770;
    qword_1E9F76538 = [NSNumber numberWithFloat:v55];
    __cxa_guard_release(&qword_1E9F76528);
  }
  if ((byte_1E9F76530 & 1) == 0)
  {
    HIBYTE(v73[2]) = 20;
    strcpy((char *)v73, "alphaGuidedFilterEps");
    sub_1BA81CE64((uint64_t)&qword_1E9F76538, (uint64_t)v73);
    if (SHIBYTE(v73[2]) < 0) {
      operator delete(v73[0]);
    }
    byte_1E9F76530 = 1;
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76520, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76520))
  {
    v58 = +[CVAPreferenceManager defaults];
    char v57 = [v58 BOOLForKey:@"CVAPhotoDebugStyle"];

    byte_1E9F76BF1 = v57;
    __cxa_guard_release(&qword_1E9F76520);
  }
  if (byte_1E9F76BF1)
  {
    double v41 = NSString;
    [(id)qword_1E9F76538 floatValue];
    objc_msgSend(v41, "stringWithFormat:", @"alphaGuidedFilterEps = %f", v42);
  }
  [(id)qword_1E9F76538 floatValue];
  -[MPSImageGuidedFilter setEpsilon:](self->_guidedFilter, "setEpsilon:");
  [(MPSImageGuidedFilter *)self->_guidedFilter encodeRegressionToCommandBuffer:v32 sourceTexture:self->_gfForegroundMask guidanceTexture:self->_scaledSource[self->_frameIndex & 1] weightsTexture:self->_gfWeight destinationCoefficientsTexture:self->_coeff];
  unint64_t v43 = self->_frameIndex & 1;
  uint64_t v44 = self->_coeffHistory[v43];
  id v45 = self->_coeffHistory[v43 ^ 1];
  LODWORD(v46) = *(_DWORD *)a8;
  [(VideoMattingMetal *)self encodeFilterCoefficientToBuffer:v32 inputCoeff:self->_coeff prevCoeff:v45 outCoeff:v44 inColorSim:self->_colorSim updateRate:v46];
  [(MPSImageGuidedFilter *)self->_guidedFilter encodeReconstructionToCommandBuffer:v32 guidanceTexture:v63 coefficientsTexture:v44 destinationTexture:self->_alphaNoPostprocessing];
  *(float *)&double v52 = fabsf(*((float *)a8 + 9));
  HIDWORD(v49) = 0;
  *(float *)&double v52 = *(float *)&v52 * (float)(*(float *)&v52 * (float)(*(float *)&v52 * *(float *)&v52));
  *(float *)&double v50 = *(float *)&v52 * 0.5;
  BOOL v51 = *(float *)&v52 <= 0.1;
  LODWORD(v52) = 1028443341;
  if (!v51) {
    *(float *)&double v52 = *(float *)&v50;
  }
  *(float *)&double v47 = self->_infConvolutionScale;
  *(float *)&double v50 = *(float *)&v47 * (float)(1.0 - *(float *)&v52);
  *(float *)&double v47 = *(float *)&v47 * *(float *)&v52;
  *(float *)&double v48 = self->_gammaExponent;
  *(float *)&double v52 = v31;
  *(float *)&double v49 = a7->alphaMaxLaplacian;
  [(CVAFilterGuided *)self->_cvaGuidedFilter encodePostProcessAlphaToCommandBuffer:v32 source:self->_alphaNoPostprocessing destination:v23 alphaMaxLaplacian:self->_enableInfConvolution infConvOrientation:v49 infConvMajorRadius:v52 infConvMinorRadius:v50 gammaExponent:v47 enableInfConvolution:v48];
  CVPixelBufferRetain(a4);
  CVPixelBufferRetain(v59);
  CVPixelBufferRetain(a5);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_mattingCallbackSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = sub_1BA858ED8;
  v67[3] = &unk_1E6228948;
  double v70 = a4;
  int v71 = a5;
  v67[4] = self;
  id v53 = v62;
  id v68 = v53;
  id v54 = v61;
  id v69 = v54;
  float v72 = v59;
  [v32 addCompletedHandler:v67];
  [v32 commit];

  self->_int lastCommittedCommand = 1;
  if (a10) {
    ++self->_frameIndex;
  }
}

- (id)disparityPostprocessingWithCanonicalDisparity:(const __CVBuffer *)a3 color:(const __CVBuffer *)a4 postProcessedDisparity:(__CVBuffer *)a5 staticParams:(const VideoMattingStaticParams *)a6 dynamicParams:(const void *)a7 postProcessingParams:(const VideoPostprocessingParams *)a8 facesArray:(id)a9 faceModel:(id)a10 isFinalStage:(BOOL)a11 callbackQueue:(id)a12 callback:(id)a13
{
  id v104 = a12;
  id v103 = a13;
  id v107 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  [v107 setLabel:@"disparityPostprocessingWithCanonicalDisparity"];
  [(VideoMattingMetal *)self encodeScaleSourceToCommandBuffer:v107 source:a4 targetWidth:self->_width2 targetHeight:self->_height2];
  disparity = self->_disparity;
  [(VideoMattingMetal *)self encodeDisparityDecimateToCommandBuffer:v107 canonicalDisparity:a3 disparityOut:self->_disparity[self->_frameIndex & 1]];
  if (!self->_sdofRenderingHasForegroundBlur)
  {
    if (self->_doDisparityDiffusion
      && ((BOOL v50 = [(VideoMattingMetal *)self bypassShiftCleanup], !*((unsigned char *)a7 + 80))
        ? (int v51 = 1)
        : (int v51 = v50),
          v51 != 1))
    {
      if (self->_doDisparityDiffusion)
      {
        [(VideoMattingMetal *)self encodeDiffusionMapToCommandBuffer:v107 color:self->_scaledSource[self->_frameIndex & 1] diffusionMap:self->_diffusionMapTexture];
        unint64_t frameIndex = self->_frameIndex;
        id v53 = disparity[frameIndex & 1];
        if (a8->useTemporalRejection)
        {
          smoothConfidence = self->_smoothConfidence;
          BOOL v55 = !(frameIndex & 1);
          uint64_t v56 = self->_smoothConfidence[v55];
          char v57 = &self->_disparityLastValidValue[v55];
          if (frameIndex) {
            v58 = v57;
          }
          else {
            v58 = self->_disparity;
          }
          LOBYTE(v101) = self->_useTemporalConfidence;
          [(VideoMattingMetal *)self encodeUpdateConfidenceAndLastValidDisparityToCommandBuffer:v107 disparity:v53 prevSmoothConfidence:v56 lastValidDisparityIn:*v58 lastValidDisparityOut:self->_disparityLastValidValue[self->_frameIndex & 1] currConfidenceOut:self->_disparityConfidenceMaskTexture useTemporalConfidence:v101];
          unint64_t v62 = self->_frameIndex;
          v63 = disparity[v62 & 1];
          if (v62)
          {
            BOOL v64 = !(v62 & 1);
            disparity = &self->_smoothDisparity[v64];
            disparityConfidenceMaskTexture = self->_disparityConfidenceMaskTexture;
            id v66 = smoothConfidence[v64];
          }
          else
          {
            disparityConfidenceMaskTexture = self->_disparityConfidenceMaskTexture;
            id v66 = disparityConfidenceMaskTexture;
          }
          *(float *)&double v59 = a6->shiftFilterUpdateRate;
          *(float *)&double v60 = a6->minimumConfidenceToKeepDisparity;
          *(float *)&double v61 = a6->maximumSimilarityToKeepDisparity;
          LOBYTE(v102) = self->_isBgColorLutBlack;
          [(VideoMattingMetal *)self encodeDisparityTemporalFilterToCommandBuffer:v107 currentDisparity:v63 previousDisparity:*disparity currConfidence:disparityConfidenceMaskTexture prevSmoothConfidence:v66 colorSim:self->_colorSim outPrevSmoothConfidence:v59 outTemporallyFilteredDisparity:v60 disparityFallbackToInvalid:v61 disparityFilterUpdateRate:smoothConfidence[v62 & 1] minimumConfidenceToKeepDisparity:self->_temporallyFilteredDisparity maximumSimilarityToKeepDisparity:v102];
        }
        else
        {
          [(VideoMattingMetal *)self encodeCopyTextureToCommandBuffer:v107 inTexture:v53 outTexture:self->_temporallyFilteredDisparity];
          [(VideoMattingMetal *)self encodeSimpleConfidenceToCommandBuffer:v107 disparity:disparity[self->_frameIndex & 1] outConfidence:self->_disparityConfidenceMaskTexture];
        }
        facemaskDisparity = self->_facemaskDisparity;
        self->_facemaskDisparity = 0;
        temporallyFilteredDisparity = self->_temporallyFilteredDisparity;
        self->_temporallyFilteredDisparity = 0;
        float v86 = self->_facemaskDisparity;
        self->_facemaskDisparity = temporallyFilteredDisparity;

        float v87 = self->_temporallyFilteredDisparity;
        self->_temporallyFilteredDisparity = facemaskDisparity;

        facemaskRegionTexture = 0;
        if (a10 && self->_doFaceMask) {
          facemaskRegionTexture = self->_facemaskRegionTexture;
        }
        p_filledDisparityTexture = &self->_filledDisparityTexture;
        LODWORD(v88) = *((_DWORD *)a7 + 5);
        *(float *)&double v89 = a8->backgroundFillMarginFromValidDisparity_px;
        [(VideoMattingMetal *)self encodeFillBackgroundDisparityToCommandBuffer:v107 inputDisparity:self->_facemaskDisparity inputFacemask:facemaskRegionTexture outputDistanceFromKnownDisparity:self->_distanceFromKnownDisparityTexture outputDisparity:self->_filledDisparityTexture backgroundDisparityValue:v88 minimumDistanceFromValidDisparity:v89];
        [(VideoMattingMetal *)self encodeDomainTransformToCommandBuffer:v107 inputDiffusionMap:self->_diffusionMapTexture inputDistanceFromKnownDisparity:self->_distanceFromKnownDisparityTexture outputDomainTransformX:self->_domainTransformXTexture outputDomainTransformY:self->_domainTransformYTexture];
        if (!a8->fillLargeHolesWithBackground && !self->_isBgColorLutBlack) {
          p_filledDisparityTexture = &self->_facemaskDisparity;
        }
        [(VideoMattingMetal *)self encodeEdgeAwareFillToCommandBuffer:v107 inputDisparity:*p_filledDisparityTexture inputDomainTransformX:self->_domainTransformXTexture inputDomainTransformY:self->_domainTransformYTexture outputDisparity:self->_initDisparity];
        [(VideoMattingMetal *)self encodeInvalidDisparityMaskToCommandBuffer:v107 inputDisparity:self->_initDisparity outputMask:self->_invalidDisparityMaskTexture];
        [(VideoMattingMetal *)self encodeBackgroundFillToCommandBuffer:v107 inputDisparity:self->_initDisparity inputMask:self->_invalidDisparityMaskTexture outputDisparity:self->_initDisparity];
        LODWORD(v101) = 15;
        [(CVAFilterDiffusion *)self->_diffusion encodeToCommandBuffer:v107 priorTexture:self->_initDisparity sourceTexture:self->_initDisparity destinationTexture:self->_smoothDisparity[self->_frameIndex & 1] diffusionMapTexture:self->_diffusionMapTexture confidenceTexture:self->_disparityConfidenceMaskTexture iterations:v101];
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_smoothDisparity[self->_frameIndex & 1], disparity[self->_frameIndex & 1]);
    }
    objc_storeStrong((id *)&self->_filteredBeforeSmoothDisparity, self->_smoothDisparity[self->_frameIndex & 1]);
    if (a5 && *((unsigned char *)a7 + 80))
    {
      size_t Width = CVPixelBufferGetWidth(a5);
      size_t Height = CVPixelBufferGetHeight(a5);
      if (CVPixelBufferGetPixelFormatType(a5) != 1751411059)
      {
        v100 = [MEMORY[0x1E4F28B00] currentHandler];
        [v100 handleFailureInMethod:a2 object:self file:@"VideoMattingMetal.mm" lineNumber:1725 description:@"Postprocessed disparity buffer is not kCVPixelFormatType_DisparityFloat16"];
      }
      unint64_t v94 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:25 width:Width height:Height mipmapped:0];
      [v94 setUsage:2];
      id v95 = +[VideoMattingMetal textureFromCacheUsingPixelBuffer:a5 textureDescriptor:v94 plane:0 textureCache:self->_textureCache];
      [(VideoMattingMetal *)self encodeOutputDisparityToCommandBuffer:v107 inputDisparity:self->_smoothDisparity[self->_frameIndex & 1] outputDisparity:v95];
    }
    goto LABEL_84;
  }
  if (sub_1BA84F794(@"CVAPhotoDeadzoneInCinematic", @"com.apple.coremedia", 0)) {
    goto LABEL_84;
  }
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  CVPixelBufferLockBaseAddress(a5, 0);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
  size_t v20 = CVPixelBufferGetHeight(a3);
  size_t v21 = CVPixelBufferGetWidth(a3);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  uint64_t v23 = (char *)CVPixelBufferGetBaseAddress(a5);
  CVPixelBufferGetHeight(a5);
  CVPixelBufferGetWidth(a5);
  size_t v24 = CVPixelBufferGetBytesPerRow(a5);
  int v25 = sub_1BA84F794(@"CVAPhotoBackgroundDeadzoneInCentimeters", @"com.apple.coremedia", 10);
  int v26 = sub_1BA84F794(@"CVAPhotoForegroundDeadzoneInCentimeters", @"com.apple.coremedia", 10);
  float v27 = (double)v25 / 100.0;
  float v28 = (double)v26 / 100.0;
  _S8 = *((float *)a7 + 4);
  float v30 = 1.0 / (float)((float)(1.0 / _S8) + v27);
  double v31 = 1.0 / _S8 - v28;
  double v32 = 1.0 / v31;
  BOOL v48 = v31 <= 0.05;
  double v33 = 20.0;
  if (!v48) {
    double v33 = v32;
  }
  float v34 = v33;
  float v35 = _S8 - v30;
  double v36 = fabsf(_S8 - v30);
  float v112 = v34;
  float v109 = -(float)(v34 - (float)(_S8 * 2.0));
  float v108 = _S8 - v109;
  __asm { FCVT            H10, S8 }
  if (fabsf(_S8 - v109) >= 0.01)
  {
    uint64_t v67 = 0;
    double v110 = v36;
    while (1)
    {
      uint64_t v68 = 0;
      do
      {
        _H0 = *(_WORD *)&BaseAddress[2 * v68];
        __asm { FCVT            S1, H0 }
        if (_S8 <= _S1 || v30 > _S1)
        {
          if (_S8 < _S1 && _S1 <= v112)
          {
            long double v73 = atan((float)((float)((float)-(float)(_S1 - (float)(_S8 * 2.0)) - v109) / v108) * 3.14159265);
            double v36 = v110;
            *(float *)&long double v73 = v73 / 1.26262726;
            _S0 = -(float)((float)(v109 + (float)(*(float *)&v73 * v108)) - (float)(_S8 * 2.0));
LABEL_38:
            __asm { FCVT            H0, S0 }
          }
        }
        else
        {
          _H0 = _H10;
          if (v36 >= 0.01)
          {
            long double v75 = atan((float)((float)(_S1 - v30) / v35) * 3.14159265);
            double v36 = v110;
            *(float *)&long double v75 = v75 / 1.26262726;
            _S0 = v30 + (float)(*(float *)&v75 * v35);
            goto LABEL_38;
          }
        }
        *(_WORD *)&v23[2 * v68++] = _H0;
      }
      while (v21 >= v68);
      ++v67;
      v23 += v24;
      BaseAddress += BytesPerRow;
      if (v20 < v67) {
        goto LABEL_67;
      }
    }
  }
  _S0 = -(float)(_S8 - (float)(_S8 * 2.0));
  __asm { FCVT            H13, S0 }
  if (v36 >= 0.01)
  {
    uint64_t v76 = 0;
    while (1)
    {
      uint64_t v77 = 0;
      do
      {
        _H0 = *(_WORD *)&BaseAddress[2 * v77];
        __asm { FCVT            S1, H0 }
        if (_S8 > _S1 && v30 <= _S1)
        {
          float v78 = atan((float)((float)(_S1 - v30) / v35) * 3.14159265) / 1.26262726;
          _S0 = v30 + (float)(v78 * v35);
          __asm { FCVT            H0, S0 }
LABEL_55:
          *(_WORD *)&v23[2 * v77] = _H0;
          goto LABEL_56;
        }
        if (_S8 >= _S1 || _S1 > v112) {
          goto LABEL_55;
        }
        *(_WORD *)&v23[2 * v77] = _H13;
LABEL_56:
        ++v77;
      }
      while (v21 >= v77);
      ++v76;
      v23 += v24;
      BaseAddress += BytesPerRow;
      if (v20 < v76) {
        goto LABEL_67;
      }
    }
  }
  uint64_t v44 = 0;
  do
  {
    uint64_t v45 = 0;
    do
    {
      _H0 = *(_WORD *)&BaseAddress[2 * v45];
      __asm { FCVT            S1, H0 }
      BOOL v48 = _S8 <= _S1 || v30 > _S1;
      if (v48)
      {
        if (_S8 >= _S1 || _S1 > v112) {
          *(_WORD *)&v23[2 * v45] = _H0;
        }
        else {
          *(_WORD *)&v23[2 * v45] = _H13;
        }
      }
      else
      {
        *(_WORD *)&v23[2 * v45] = _H10;
      }
      ++v45;
    }
    while (v21 >= v45);
    ++v44;
    v23 += v24;
    BaseAddress += BytesPerRow;
  }
  while (v20 >= v44);
LABEL_67:
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  CVPixelBufferUnlockBaseAddress(a5, 0);
LABEL_84:
  sub_1BA83AB2C(*((void *)self->_metalContext + 5), self->_device, self->_commandQueue);
  CVPixelBufferRetain(a4);
  CVPixelBufferRetain(a5);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_mattingCallbackSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v113[0] = MEMORY[0x1E4F143A8];
  v113[1] = 3221225472;
  v113[2] = sub_1BA859B90;
  v113[3] = &unk_1E6228920;
  v116 = a4;
  v113[4] = self;
  id v96 = v104;
  id v114 = v96;
  id v97 = v103;
  id v115 = v97;
  v117 = a5;
  [v107 addCompletedHandler:v113];
  [v107 commit];

  if (a11) {
    ++self->_frameIndex;
  }
  char v98 = self->_yuvSourceDownsampledTexture;

  return v98;
}

- (void)segmentationAverage:(__CVBuffer *)a3 callbackQueue:(id)a4 callback:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (!self->_foregroundRatioBuffer)
  {
    id v10 = (MTLBuffer *)[(MTLDeviceSPI *)self->_device newBufferWithLength:4 options:0];
    foregroundRatioBuffer = self->_foregroundRatioBuffer;
    self->_foregroundRatioBuffer = v10;
  }
  uint64_t v12 = sub_1BA8621E4(a3);
  int v13 = +[VideoMattingMetal textureFromCacheUsingPixelBuffer:a3 textureDescriptor:v12 plane:0 textureCache:self->_textureCache];

  id v14 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  [v14 setLabel:@"segmentationAverage"];
  [(GlobalReductionAverage *)self->_globalReductionAverage parallelReductionAverage:v14 inTexture:v13 outGlobalAverage:self->_foregroundRatioBuffer];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1BA859F48;
  void v17[3] = &unk_1E62288D0;
  v17[4] = self;
  id v15 = v8;
  id v18 = v15;
  id v16 = v9;
  id v19 = v16;
  [v14 addCompletedHandler:v17];
  [v14 commit];
}

- (void)encodeOutputDisparityToCommandBuffer:(id)a3 inputDisparity:(id)a4 outputDisparity:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v11 pixelFormat] != 25)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"VideoMattingMetal.mm", 1511, @"Output disparity texture should be MTLPixelFormatR16Float (%lu), but is %lu", 25, objc_msgSend(v11, "pixelFormat") object file lineNumber description];
  }
  uint64_t v12 = [v9 computeCommandEncoder];
  [v12 setLabel:@"_internalDisparityToCanonicalDisparityKernel"];
  [v12 setComputePipelineState:self->_internalDisparityToCanonicalDisparityKernel];
  [v12 setTexture:v10 atIndex:0];
  [v12 setTexture:self->_outputCanonicalDisparity atIndex:1];
  uint64_t v13 = [(MTLTexture *)self->_outputCanonicalDisparity width];
  uint64_t v14 = [(MTLTexture *)self->_outputCanonicalDisparity height];
  v18[0] = (unint64_t)(v13 + 15) >> 4;
  v18[1] = (unint64_t)(v14 + 15) >> 4;
  v18[2] = 1;
  uint64_t v17 = 1;
  long long v16 = xmmword_1BA86C930;
  [v12 dispatchThreadgroups:v18 threadsPerThreadgroup:&v16];
  [v12 endEncoding];
  [(CVAFilterHybridResampling *)self->_hybridResampler encodeBilinearScalingToCommandBuffer:v9 source:self->_outputCanonicalDisparity destination:v11 mode:2];
}

- (void)encodeConfidenceMaskToCommandBuffer:(id)a3 inputDisparity:(id)a4 inputDisparityNoInvalid:(id)a5 outputConfidenceMask:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v17 = 0x3F800000C59F6000;
  uint64_t v13 = [a3 computeCommandEncoder];
  [v13 setLabel:@"_disparityConfidenceMaskKernel"];
  [v13 setComputePipelineState:self->_disparityConfidenceMaskKernel];
  [v13 setTexture:v10 atIndex:0];
  [v13 setTexture:v11 atIndex:1];
  [v13 setTexture:v12 atIndex:2];
  [v13 setBytes:&v17 length:8 atIndex:0];
  v16[0] = (unint64_t)([v12 width] + 15) >> 4;
  v16[1] = (unint64_t)([v12 height] + 15) >> 4;
  v16[2] = 1;
  uint64_t v15 = 1;
  long long v14 = xmmword_1BA86C930;
  [v13 dispatchThreadgroups:v16 threadsPerThreadgroup:&v14];
  [v13 endEncoding];
}

- (void)encodeFillBackgroundDisparityToCommandBuffer:(id)a3 inputDisparity:(id)a4 inputFacemask:(id)a5 outputDistanceFromKnownDisparity:(id)a6 outputDisparity:(id)a7 backgroundDisparityValue:(float)a8 minimumDistanceFromValidDisparity:(float)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  *(float *)float v30 = a9;
  *(float *)&v30[1] = a8;
  size_t v21 = [v16 computeCommandEncoder];
  [v21 setLabel:@"_disparityIsValidKernel"];
  [v21 setComputePipelineState:self->_disparityIsValidKernel];
  [v21 setTexture:v17 atIndex:0];
  [v21 setTexture:self->_disparityIsValidTexture atIndex:1];
  v29[0] = (unint64_t)([v17 width] + 15) >> 4;
  v29[1] = (unint64_t)([v17 height] + 15) >> 4;
  v29[2] = 1;
  uint64_t v28 = 1;
  long long v27 = xmmword_1BA86C930;
  [v21 dispatchThreadgroups:v29 threadsPerThreadgroup:&v27];
  [v21 endEncoding];
  [(CVAFilterDistanceTransform *)self->_distanceTransform encodeToCommandBuffer:v16 sourceTexture:self->_disparityIsValidTexture destinationTexture:v19];
  int64x2_t v22 = [v16 computeCommandEncoder];

  if (v18)
  {
    [v22 setLabel:@"_fillBackgroundDisparityKernel_faceMask"];
    uint64_t v23 = &OBJC_IVAR___VideoMattingMetal__fillBackgroundDisparityKernel_faceMask;
  }
  else
  {
    [v22 setLabel:@"_fillBackgroundDisparityKernel"];
    uint64_t v23 = &OBJC_IVAR___VideoMattingMetal__fillBackgroundDisparityKernel;
  }
  [v22 setComputePipelineState:*(Class *)((char *)&self->super.super.isa + *v23)];
  [v22 setTexture:v17 atIndex:0];
  [v22 setTexture:v18 atIndex:1];
  [v22 setTexture:v19 atIndex:2];
  [v22 setTexture:v20 atIndex:3];
  [v22 setBytes:v30 length:8 atIndex:0];
  v26[0] = (unint64_t)([v20 width] + 15) >> 4;
  v26[1] = (unint64_t)([v20 height] + 15) >> 4;
  v26[2] = 1;
  uint64_t v25 = 1;
  long long v24 = xmmword_1BA86C930;
  [v22 dispatchThreadgroups:v26 threadsPerThreadgroup:&v24];
  [v22 endEncoding];
}

- (void)encodeDisparityMasksToCommandBuffer:(id)a3 inputDisparity:(id)a4 inputSegmentation:(id)a5 useSegmentationOnly:(BOOL)a6 outputForegroundMask:(id)a7 outputIsForeground:(id)a8 disparityMin:(float)a9 focusDisparity:(float)a10 hardness:(float)a11 minDistToDeweight:(float)a12 unconfidentWeight:(float)a13
{
  id v24 = a4;
  id v25 = a5;
  id v26 = a7;
  id v27 = a8;
  *(float *)double v32 = a9;
  *(float *)&v32[1] = 1.0 / fmaxf((float)(a10 - a9) * (float)(1.0 - a11), 0.001);
  *(float *)&v32[2] = a10;
  *(float *)&void v32[3] = a12;
  *(float *)&v32[4] = a13;
  BOOL v33 = a6;
  uint64_t v28 = [a3 computeCommandEncoder];
  [v28 setLabel:@"_disparityMasksKernel"];
  [v28 setComputePipelineState:self->_disparityMasksKernel];
  [v28 setTexture:v24 atIndex:0];
  [v28 setTexture:v25 atIndex:1];
  [v28 setTexture:v26 atIndex:2];
  [v28 setTexture:v27 atIndex:3];
  [v28 setBytes:v32 length:24 atIndex:0];
  v31[0] = (unint64_t)([v24 width] + 15) >> 4;
  v31[1] = (unint64_t)([v24 height] + 15) >> 4;
  v31[2] = 1;
  uint64_t v30 = 1;
  long long v29 = xmmword_1BA86C930;
  [v28 dispatchThreadgroups:v31 threadsPerThreadgroup:&v29];
  [v28 endEncoding];
}

- (void)encodeDiffusionMapToCommandBuffer:(id)a3 color:(id)a4 diffusionMap:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  unint64_t v14 = 0xC1A000003A83126FLL;
  id v10 = [a3 computeCommandEncoder];
  [v10 setLabel:@"_diffusionMapKernel"];
  [v10 setComputePipelineState:self->_diffusionMapKernel];
  [v10 setTexture:v8 atIndex:0];
  [v10 setTexture:v9 atIndex:1];
  [v10 setBytes:&v14 length:8 atIndex:0];
  v13[0] = (unint64_t)([v9 width] + 15) >> 4;
  v13[1] = (unint64_t)([v9 height] + 15) >> 4;
  void v13[2] = 1;
  uint64_t v12 = 1;
  long long v11 = xmmword_1BA86C930;
  [v10 dispatchThreadgroups:v13 threadsPerThreadgroup:&v11];
  [v10 endEncoding];
}

- (void)encodeDisparityTemporalFilterToCommandBuffer:(id)a3 currentDisparity:(id)a4 previousDisparity:(id)a5 currConfidence:(id)a6 prevSmoothConfidence:(id)a7 colorSim:(id)a8 outPrevSmoothConfidence:(id)a9 outTemporallyFilteredDisparity:(id)a10 disparityFallbackToInvalid:(BOOL)a11 disparityFilterUpdateRate:(float)a12 minimumConfidenceToKeepDisparity:(float)a13 maximumSimilarityToKeepDisparity:(float)a14
{
  id v23 = a4;
  id v24 = a5;
  id v25 = a6;
  id v26 = a7;
  id v27 = a8;
  id v28 = a9;
  id v29 = a10;
  *(float *)double v36 = a12;
  *(float *)&v36[1] = a13;
  *(float *)&v36[2] = a14;
  uint64_t v30 = [a3 computeCommandEncoder];
  double v31 = v30;
  if (a11)
  {
    [v30 setLabel:@"_temporalDisparityFilterKernel_fallbackToInvalid"];
    double v32 = &OBJC_IVAR___VideoMattingMetal__temporalDisparityFilterKernel_fallbackToInvalid;
  }
  else
  {
    [v30 setLabel:@"_temporalDisparityFilterKernel"];
    double v32 = &OBJC_IVAR___VideoMattingMetal__temporalDisparityFilterKernel;
  }
  [v31 setComputePipelineState:*(Class *)((char *)&self->super.super.isa + *v32)];
  [v31 setTexture:v23 atIndex:0];
  [v31 setTexture:v24 atIndex:1];
  [v31 setTexture:v25 atIndex:2];
  [v31 setTexture:v27 atIndex:3];
  [v31 setTexture:v26 atIndex:4];
  [v31 setTexture:v29 atIndex:5];
  [v31 setTexture:v28 atIndex:6];
  [v31 setBytes:v36 length:12 atIndex:0];
  v35[0] = (unint64_t)([v29 width] + 15) >> 4;
  v35[1] = (unint64_t)([v29 height] + 15) >> 4;
  v35[2] = 1;
  uint64_t v34 = 1;
  long long v33 = xmmword_1BA86C930;
  [v31 dispatchThreadgroups:v35 threadsPerThreadgroup:&v33];
  [v31 endEncoding];
}

- (void)encodeUpdateConfidenceAndLastValidDisparityToCommandBuffer:(id)a3 disparity:(id)a4 prevSmoothConfidence:(id)a5 lastValidDisparityIn:(id)a6 lastValidDisparityOut:(id)a7 currConfidenceOut:(id)a8 useTemporalConfidence:(BOOL)a9
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  BOOL v26 = self->_frameIndex == 0;
  id v20 = [a3 computeCommandEncoder];
  size_t v21 = v20;
  if (a9)
  {
    [v20 setLabel:@"_updateConfidenceAndLastValidDisparityKernel_useTemporalConfidence"];
    int64x2_t v22 = &OBJC_IVAR___VideoMattingMetal__updateConfidenceAndLastValidDisparityKernel_useTemporalConfidence;
  }
  else
  {
    [v20 setLabel:@"_updateConfidenceAndLastValidDisparityKernel"];
    int64x2_t v22 = &OBJC_IVAR___VideoMattingMetal__updateConfidenceAndLastValidDisparityKernel;
  }
  [v21 setComputePipelineState:*(Class *)((char *)&self->super.super.isa + *v22)];
  [v21 setTexture:v15 atIndex:0];
  [v21 setTexture:v16 atIndex:1];
  [v21 setTexture:v17 atIndex:2];
  [v21 setTexture:v18 atIndex:3];
  [v21 setTexture:v19 atIndex:4];
  [v21 setBytes:&v26 length:1 atIndex:0];
  v25[0] = (unint64_t)([v15 width] + 15) >> 4;
  v25[1] = (unint64_t)([v15 height] + 15) >> 4;
  v25[2] = 1;
  uint64_t v24 = 1;
  long long v23 = xmmword_1BA86C930;
  [v21 dispatchThreadgroups:v25 threadsPerThreadgroup:&v23];
  [v21 endEncoding];
}

- (void)encodeSimpleConfidenceToCommandBuffer:(id)a3 disparity:(id)a4 outConfidence:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 computeCommandEncoder];
  [v10 setLabel:@"_simpleConfidenceKernel"];
  [v10 setComputePipelineState:self->_simpleConfidenceKernel];
  [v10 setTexture:v8 atIndex:0];
  [v10 setTexture:v9 atIndex:1];
  v13[0] = (unint64_t)([v8 width] + 15) >> 4;
  v13[1] = (unint64_t)([v8 height] + 15) >> 4;
  void v13[2] = 1;
  uint64_t v12 = 1;
  long long v11 = xmmword_1BA86C930;
  [v10 dispatchThreadgroups:v13 threadsPerThreadgroup:&v11];
  [v10 endEncoding];
}

- (void)encodeBackgroundFillToCommandBuffer:(id)a3 inputDisparity:(id)a4 inputMask:(id)a5 outputDisparity:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  unint64_t v14 = [v10 computeCommandEncoder];
  [v14 setLabel:@"_bgFillYKernel"];
  [v14 setComputePipelineState:self->_bgFillYKernel];
  [v14 setTexture:v11 atIndex:0];
  [v14 setTexture:v12 atIndex:1];
  [v14 setTexture:self->_bgFillTempTexture atIndex:2];
  int64x2_t v22 = vdupq_n_s64(1uLL);
  uint64_t v20 = 1;
  unint64_t v21 = (unint64_t)([v11 width] + 31) >> 5;
  long long v19 = xmmword_1BA86C918;
  [v14 dispatchThreadgroups:&v21 threadsPerThreadgroup:&v19];
  [v14 endEncoding];
  id v15 = [v10 computeCommandEncoder];

  [v15 setLabel:@"_bgFillXKernel"];
  [v15 setComputePipelineState:self->_bgFillXKernel];
  [v15 setTexture:self->_bgFillTempTexture atIndex:0];
  [v15 setTexture:v12 atIndex:1];
  [v15 setTexture:v13 atIndex:2];
  v18[0] = 1;
  v18[1] = (unint64_t)([v11 height] + 31) >> 5;
  v18[2] = 1;
  uint64_t v17 = 1;
  long long v16 = xmmword_1BA86C900;
  [v15 dispatchThreadgroups:v18 threadsPerThreadgroup:&v16];
  [v15 endEncoding];
}

- (void)encodeInvalidDisparityMaskToCommandBuffer:(id)a3 inputDisparity:(id)a4 outputMask:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 computeCommandEncoder];
  [v10 setLabel:@"_invalidDisparityMaskKernel"];
  [v10 setComputePipelineState:self->_invalidDisparityMaskKernel];
  [v10 setTexture:v8 atIndex:0];
  [v10 setTexture:v9 atIndex:1];
  v13[0] = (unint64_t)([v8 width] + 15) >> 4;
  v13[1] = (unint64_t)([v8 height] + 15) >> 4;
  void v13[2] = 1;
  uint64_t v12 = 1;
  long long v11 = xmmword_1BA86C930;
  [v10 dispatchThreadgroups:v13 threadsPerThreadgroup:&v11];
  [v10 endEncoding];
}

- (void)encodeEdgeAwareFillToCommandBuffer:(id)a3 inputDisparity:(id)a4 inputDomainTransformX:(id)a5 inputDomainTransformY:(id)a6 outputDisparity:(id)a7
{
  id v12 = a3;
  id v19 = a4;
  id v13 = a5;
  id v14 = a6;
  id v20 = a7;
  v33[0] = 0x141700000;
  id v15 = [v12 computeCommandEncoder];
  [v15 setLabel:@"_edgeAwareFillXKernel"];
  [v15 setComputePipelineState:self->_edgeAwareFillXKernel];
  [v15 setTexture:v19 atIndex:0];
  [v15 setTexture:v13 atIndex:1];
  [v15 setTexture:self->_edgeAwareFillTempTexture atIndex:2];
  [v15 setBytes:v33 length:8 atIndex:0];
  v32[0] = (((unint64_t)[v13 width] >> 1) + 15) >> 4;
  v32[1] = (unint64_t)([v13 height] + 15) >> 4;
  v32[2] = 1;
  uint64_t v31 = 1;
  long long v30 = xmmword_1BA86C930;
  [v15 dispatchThreadgroups:v32 threadsPerThreadgroup:&v30];
  [v15 endEncoding];
  long long v16 = [v12 computeCommandEncoder];

  [v16 setLabel:@"_edgeAwareFillYKernel"];
  [v16 setComputePipelineState:self->_edgeAwareFillYKernel];
  [v16 setTexture:self->_edgeAwareFillTempTexture atIndex:0];
  [v16 setTexture:v14 atIndex:1];
  [v16 setTexture:v20 atIndex:2];
  [v16 setBytes:v33 length:8 atIndex:0];
  v29[0] = (unint64_t)([v14 width] + 15) >> 4;
  v29[1] = (((unint64_t)[v14 height] >> 1) + 15) >> 4;
  v29[2] = 1;
  uint64_t v28 = 1;
  long long v27 = xmmword_1BA86C930;
  [v16 dispatchThreadgroups:v29 threadsPerThreadgroup:&v27];
  [v16 endEncoding];
  uint64_t v17 = [v12 computeCommandEncoder];

  [v17 setLabel:@"_edgeAwareFillXKernel"];
  [v17 setComputePipelineState:self->_edgeAwareFillXKernel];
  [v17 setTexture:v20 atIndex:0];
  [v17 setTexture:v13 atIndex:1];
  [v17 setTexture:self->_edgeAwareFillTempTexture atIndex:2];
  [v17 setBytes:v33 length:8 atIndex:0];
  v26[0] = (((unint64_t)[v13 width] >> 1) + 15) >> 4;
  v26[1] = (unint64_t)([v13 height] + 15) >> 4;
  v26[2] = 1;
  uint64_t v25 = 1;
  long long v24 = xmmword_1BA86C930;
  [v17 dispatchThreadgroups:v26 threadsPerThreadgroup:&v24];
  [v17 endEncoding];
  id v18 = [v12 computeCommandEncoder];

  [v18 setLabel:@"_edgeAwareFillYKernel"];
  [v18 setComputePipelineState:self->_edgeAwareFillYKernel];
  [v18 setTexture:self->_edgeAwareFillTempTexture atIndex:0];
  [v18 setTexture:v14 atIndex:1];
  [v18 setTexture:v20 atIndex:2];
  [v18 setBytes:v33 length:8 atIndex:0];
  v23[0] = (unint64_t)([v14 width] + 15) >> 4;
  v23[1] = (((unint64_t)[v14 height] >> 1) + 15) >> 4;
  v23[2] = 1;
  uint64_t v22 = 1;
  long long v21 = xmmword_1BA86C930;
  [v18 dispatchThreadgroups:v23 threadsPerThreadgroup:&v21];
  [v18 endEncoding];
}

- (void)encodeDomainTransformToCommandBuffer:(id)a3 inputDiffusionMap:(id)a4 inputDistanceFromKnownDisparity:(id)a5 outputDomainTransformX:(id)a6 outputDomainTransformY:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  int v26 = 1087373312;
  uint64_t v17 = [v12 computeCommandEncoder];
  [v17 setLabel:@"_domainTransformXKernel"];
  [v17 setComputePipelineState:self->_domainTransformXKernel];
  [v17 setTexture:v13 atIndex:0];
  [v17 setTexture:v14 atIndex:1];
  [v17 setTexture:v15 atIndex:2];
  [v17 setBytes:&v26 length:4 atIndex:0];
  v25[0] = 1;
  v25[1] = (unint64_t)([v15 height] + 31) >> 5;
  v25[2] = 1;
  uint64_t v24 = 1;
  long long v23 = xmmword_1BA86C900;
  [v17 dispatchThreadgroups:v25 threadsPerThreadgroup:&v23];
  [v17 endEncoding];
  id v18 = [v12 computeCommandEncoder];

  [v18 setLabel:@"_domainTransformYKernel"];
  [v18 setComputePipelineState:self->_domainTransformYKernel];
  [v18 setTexture:v13 atIndex:0];
  [v18 setTexture:v14 atIndex:1];
  [v18 setTexture:v16 atIndex:2];
  [v18 setBytes:&v26 length:4 atIndex:0];
  int64x2_t v22 = vdupq_n_s64(1uLL);
  uint64_t v20 = 1;
  unint64_t v21 = (unint64_t)([v16 width] + 31) >> 5;
  long long v19 = xmmword_1BA86C918;
  [v18 dispatchThreadgroups:&v21 threadsPerThreadgroup:&v19];
  [v18 endEncoding];
}

- (void)encodeDisparityCleanupToCommandBuffer:(id)a3 prevDisparity:(id)a4 currDisparity:(id)a5 colorSim:(id)a6 cleanDisparity:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v22 = 0x3F0000003D4CCCCDLL;
  id v16 = [a3 computeCommandEncoder];
  uint64_t v17 = v16;
  if (self->_frameIndex)
  {
    [v16 setLabel:@"_disparityCleanupKernel"];
    id v18 = &OBJC_IVAR___VideoMattingMetal__disparityCleanupKernel;
  }
  else
  {
    [v16 setLabel:@"_disparityCleanupKernel_firstFrame"];
    id v18 = &OBJC_IVAR___VideoMattingMetal__disparityCleanupKernel_firstFrame;
  }
  [v17 setComputePipelineState:*(Class *)((char *)&self->super.super.isa + *v18)];
  [v17 setTexture:v12 atIndex:0];
  [v17 setTexture:v12 atIndex:1];
  [v17 setTexture:v13 atIndex:2];
  [v17 setTexture:v14 atIndex:3];
  [v17 setTexture:v15 atIndex:4];
  [v17 setBytes:&v22 length:8 atIndex:0];
  v21[0] = (unint64_t)([v15 width] + 15) >> 4;
  v21[1] = (unint64_t)([v15 height] + 15) >> 4;
  v21[2] = 1;
  uint64_t v20 = 1;
  long long v19 = xmmword_1BA86C930;
  [v17 dispatchThreadgroups:v21 threadsPerThreadgroup:&v19];
  [v17 endEncoding];
}

- (void)encodeColorSimL1ToCommandBuffer:(id)a3 prevSource:(id)a4 currSource:(id)a5 destination:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  int v17 = 1084227584;
  BOOL v18 = v10 == 0;
  id v13 = [a3 computeCommandEncoder];
  [v13 setLabel:@"_colorSimL1Kernel"];
  [v13 setComputePipelineState:self->_colorSimL1Kernel];
  [v13 setTexture:v10 atIndex:0];
  [v13 setTexture:v11 atIndex:1];
  [v13 setTexture:v12 atIndex:2];
  [v13 setBytes:&v17 length:8 atIndex:0];
  v16[0] = (unint64_t)([v12 width] + 15) >> 4;
  v16[1] = (unint64_t)([v12 height] + 15) >> 4;
  v16[2] = 1;
  uint64_t v15 = 1;
  long long v14 = xmmword_1BA86C930;
  [v13 dispatchThreadgroups:v16 threadsPerThreadgroup:&v14];
  [v13 endEncoding];
}

- (void)encodeColorSimToCommandBuffer:(id)a3 prevSource:(id)a4 currSource:(id)a5 destination:(id)a6 similarityScaleFactor:(float)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  float v19 = a7;
  BOOL v20 = v12 == 0;
  uint64_t v15 = [a3 computeCommandEncoder];
  [v15 setLabel:@"_colorSimKernel"];
  [v15 setComputePipelineState:self->_colorSimKernel];
  [v15 setTexture:v12 atIndex:0];
  [v15 setTexture:v13 atIndex:1];
  [v15 setTexture:v14 atIndex:2];
  [v15 setBytes:&v19 length:8 atIndex:0];
  v18[0] = (unint64_t)([v14 width] + 15) >> 4;
  v18[1] = (unint64_t)([v14 height] + 15) >> 4;
  v18[2] = 1;
  uint64_t v17 = 1;
  long long v16 = xmmword_1BA86C930;
  [v15 dispatchThreadgroups:v18 threadsPerThreadgroup:&v16];
  [v15 endEncoding];
}

- (void)encodeCopyTextureToCommandBuffer:(id)a3 inTexture:(id)a4 outTexture:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 width];
  uint64_t v11 = [v8 height];
  uint64_t v12 = [v8 depth];
  id v13 = [v7 blitCommandEncoder];
  memset(v16, 0, sizeof(v16));
  v15[0] = v10;
  v15[1] = v11;
  v15[2] = v12;
  memset(v14, 0, sizeof(v14));
  [v13 copyFromTexture:v8 sourceSlice:0 sourceLevel:0 sourceOrigin:v16 sourceSize:v15 toTexture:v9 destinationSlice:0 destinationLevel:0 destinationOrigin:v14];
  [v13 endEncoding];
}

- (void)setStageLightProxyCubeData:(id)a3 cubeData:(id)a4
{
  uint64_t v12 = (NSData *)a3;
  id v7 = (NSData *)a4;
  self->_isBgColorLutBlack = 1;
  if (self->_lastStageLightProxyCubeData != v12)
  {
    objc_storeStrong((id *)&self->_lastStageLightProxyCubeData, a3);
    sub_1BA862804(v12, self->_device);
    id v8 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    stageLightProxyLut = self->_stageLightProxyLut;
    self->_stageLightProxyLut = v8;
  }
  if (self->_lastStageLightCubeData != v7)
  {
    objc_storeStrong((id *)&self->_lastStageLightCubeData, a4);
    sub_1BA862804(v7, self->_device);
    uint64_t v10 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    stageLightLut = self->_stageLightLut;
    self->_stageLightLut = v10;
  }
}

- (void)setPortraitForegroundCubeData:(id)a3 backgroundCubeData:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  self->_isBgColorLutBlack = 0;
  [(VideoMattingMetal *)self setFgLut:v7];
  [(VideoMattingMetal *)self setBgLut:v6];
}

- (void)setFgLut:(id)a3
{
  id v5 = (NSData *)a3;
  if (self->_lastFgLutData != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)&self->_lastFgLutData, a3);
    sub_1BA862804(v8, self->_device);
    id v6 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    fgColorLut = self->_fgColorLut;
    self->_fgColorLut = v6;
  }

  MEMORY[0x1F41817F8]();
}

- (void)setBgLut:(id)a3
{
  id v5 = (NSData *)a3;
  if (self->_lastBgLutData != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)&self->_lastBgLutData, a3);
    sub_1BA862804(v8, self->_device);
    id v6 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    bgColorLut = self->_bgColorLut;
    self->_bgColorLut = v6;
  }

  MEMORY[0x1F41817F8]();
}

- (void)setAlphaLut:(float)a3 gammaExponent:(float)a4
{
  if (a3 != 2.0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"VideoMattingMetal.mm", 959, @"contrastExponent value %f is not supported", a3);
  }
  self->_gammaExponent = a4;
}

- (void)prewarmGuidedFilter:(id)a3 device:(id)a4 commandBuffer:(id)a5 width:(int)a6 height:(int)a7 width2:(int)a8 height2:(int)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v28 = 0;
  id v29 = 0;
  [v15 epsilon];
  int v19 = v18;
  LODWORD(v20) = 1008981770;
  [v15 setEpsilon:v20];
  unint64_t v21 = (void ***)operator new(0x40uLL);
  void *v21 = &v29;
  v21[1] = (void **)70;
  *((_DWORD *)v21 + 4) = a8;
  *((_DWORD *)v21 + 5) = a9;
  void v21[3] = 0;
  v21[4] = &v28;
  v21[5] = (void **)70;
  *((_DWORD *)v21 + 12) = a6;
  *((_DWORD *)v21 + 13) = a7;
  v21[7] = 0;
  uint64_t v22 = sub_1BA8627D0(v16, 70, a8, a9, 0);
  long long v23 = **v21;
  *void *v21 = (void *)v22;

  if (*v21)
  {
    uint64_t v24 = sub_1BA8627D0(v16, (uint64_t)v21[5], *((int *)v21 + 12), *((int *)v21 + 13), 0);
    uint64_t v25 = v21[4];
    int v26 = *v25;
    void *v25 = (void *)v24;

    if (v21[4])
    {
      [v15 encodeRegressionToCommandBuffer:v17 sourceTexture:self->_gfForegroundMask guidanceTexture:v29 weightsTexture:self->_gfWeight destinationCoefficientsTexture:self->_coeff];
      [v15 encodeReconstructionToCommandBuffer:v17 guidanceTexture:v28 coefficientsTexture:self->_coeffHistory[0] destinationTexture:self->_alphaNoPostprocessing];
      LODWORD(v27) = v19;
      [v15 setEpsilon:v27];
    }
  }
  operator delete(v21);
}

- (void)dealloc
{
  scaledSourceCV = self->_scaledSourceCV;
  double v4 = self->_scaledSourceCV[0];
  if (v4) {
    CVPixelBufferRelease(v4);
  }
  id v5 = scaledSourceCV[1];
  if (v5) {
    CVPixelBufferRelease(v5);
  }
  yuvSourceDownsampledBuffer = self->_yuvSourceDownsampledBuffer;
  if (yuvSourceDownsampledBuffer) {
    CVPixelBufferRelease(yuvSourceDownsampledBuffer);
  }
  hwScaler = self->_hwScaler;
  if (hwScaler)
  {
    CFRelease(hwScaler);
    self->_hwScaler = 0;
  }
  textureCache = self->_textureCache;
  if (textureCache) {
    CFRelease(textureCache);
  }
  v9.receiver = self;
  v9.super_class = (Class)VideoMattingMetal;
  [(ImageSaverRegistrator *)&v9 dealloc];
}

- (VideoMattingMetal)initWithStaticParams:(const VideoMattingStaticParams *)a3 renderingDisparityUpdateRate:(float)a4 renderingDisparityBlurRadius:(float)a5 renderingLensFocalLength_mm:(float)a6 useTemporalConfidence:(BOOL)a7 metalContext:(void *)a8 error:(id *)a9
{
  v343[1] = *MEMORY[0x1E4F143B8];
  v160.receiver = self;
  v160.super_class = (Class)VideoMattingMetal;
  id v16 = [(ImageSaverRegistrator *)&v160 init];
  id v17 = v16;
  if (v16)
  {
    v16->_sdofRenderingHasForegroundBlur = a3->supportsForegroundBlur;
    v16->_renderStateIsConfigured = 0;
    v16->_int width = a3->colorWidth;
    v16->_int height = a3->colorHeight;
    v16->_int width2 = a3->guidedFilterWidth;
    p_int width2 = &v16->_width2;
    p_height2 = &v16->_height2;
    v16->_height2 = a3->guidedFilterHeight;
    int width2 = v16->_width2;
    int v19 = NSString;
    double v20 = [NSString stringWithFormat:@"_width2: %d outside bounds [2, %d] for guided filter", width2, 0xFFFFLL];
    unint64_t v21 = [v19 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[VideoMattingMetal initWithStaticParams:renderingDisparityUpdateRate:renderingDisparityBlurRadius:renderingLensFocalLength_mm:useTemporalConfidence:metalContext:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/module/sdof/src/pipeline/VideoMattingMetal.mm", 419, v20];
    sub_1BA8161F4(width2 < 2, a9, 0, 4294944393, v21);

    if (width2 >= 2)
    {
      int v22 = *p_height2;
      long long v23 = NSString;
      uint64_t v24 = [NSString stringWithFormat:@"_height2: %d outside bounds [2, %d] for guided filter", *p_height2, 0xFFFFLL];
      uint64_t v25 = [v23 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[VideoMattingMetal initWithStaticParams:renderingDisparityUpdateRate:renderingDisparityBlurRadius:renderingLensFocalLength_mm:useTemporalConfidence:metalContext:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/module/sdof/src/pipeline/VideoMattingMetal.mm", 429, v24];
      sub_1BA8161F4(v22 < 2, a9, 0, 4294944393, v25);

      if (v22 >= 2)
      {
        v17->_infConvolutionScale = 1.0;
        v17->_doDisparityDiffusion = 1;
        id v28 = +[CVAPreferenceManager defaults];
        v17->_enableInfConvolution = [v28 BOOLForKey:@"disableInfConvolution"] ^ 1;

        id v29 = +[CVAPreferenceManager defaults];
        v17->_mattingUsesPostprocessing = [v29 BOOLForKey:@"disablePostprocessingForMatting"] ^ 1;

        long long v30 = +[CVAPreferenceManager defaults];
        v17->_renderingUsesPostprocessing = [v30 BOOLForKey:@"disablePostprocessingForRendering"] ^ 1;

        uint64_t v31 = +[CVAPreferenceManager defaults];
        v17->_doFaceMask = [v31 BOOLForKey:@"enableFaceMaskPostprocessing"];

        id v159 = (id)objc_opt_new();
        [v159 setConstantValue:p_width2 type:29 withName:@"kDistanceTransformWidth"];
        [v159 setConstantValue:p_height2 type:29 withName:@"kDistanceTransformHeight"];
        char v158 = 0;
        [v159 setConstantValue:&v158 type:53 withName:@"kDoVignetting"];
        p_device = (id *)&v17->_device;
        objc_storeStrong((id *)&v17->_device, *(id *)a8);
        p_commandQueue = (id *)&v17->_commandQueue;
        objc_storeStrong((id *)&v17->_commandQueue, *((id *)a8 + 1));
        p_defaultLibrary = (void **)&v17->_defaultLibrary;
        objc_storeStrong((id *)&v17->_defaultLibrary, *((id *)a8 + 2));
        p_pipelineLibrary = (void **)&v17->_pipelineLibrary;
        objc_storeStrong((id *)&v17->_pipelineLibrary, *((id *)a8 + 3));
        v17->_metalContext = a8;
        if (v17->_sdofRenderingHasForegroundBlur)
        {
          double v32 = -[GlobalReductionAverage initWithDevice:library:pipelineLibrary:textureSize:]([GlobalReductionAverage alloc], "initWithDevice:library:pipelineLibrary:textureSize:", *p_device, *p_defaultLibrary, *p_pipelineLibrary, 256.0, 192.0);
          globalReductionAverage = v17->_globalReductionAverage;
          v17->_globalReductionAverage = v32;
        }
        v17->_int lastCommittedCommand = 0;
        uint64_t v342 = *MEMORY[0x1E4F24C78];
        v343[0] = &unk_1F1440B28;
        CFDictionaryRef v34 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v343 forKeys:&v342 count:1];
        if (CVMetalTextureCacheCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v34, *p_device, 0, &v17->_textureCache)) {
          BOOL v35 = 0;
        }
        else {
          BOOL v35 = v17->_textureCache != 0;
        }
        double v36 = NSString;
        double v37 = [NSString stringWithFormat:@"Error allocating texture cache"];
        double v38 = [v36 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[VideoMattingMetal initWithStaticParams:renderingDisparityUpdateRate:renderingDisparityBlurRadius:renderingLensFocalLength_mm:useTemporalConfidence:metalContext:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/module/sdof/src/pipeline/VideoMattingMetal.mm", 474, v37];
        sub_1BA8161F4(!v35, a9, 0, 4294944382, v38);

        if (!v35) {
          goto LABEL_40;
        }
        v17->_isBgColorLutBlack = 0;
        v17->_renderingDisparityUpdateRate = a4;
        v17->_renderingDisparityBlurRadius = a5;
        v17->_renderingLensFocalLength_mm = a6;
        v17->_useTemporalConfidence = a7;
        double v39 = [[CVAPhotoMTLRingBuffer alloc] initWithLength:36 options:0 device:*p_device];
        disparityConfig = v17->_disparityConfig;
        v17->_disparityConfig = v39;

        double v41 = v17->_disparityConfig;
        float v42 = NSString;
        unint64_t v43 = objc_msgSend(NSString, "stringWithFormat:", @"[_Nonnull id<MTLDeviceSPI> newBufferWithLength:%lu] is nil", 36);
        uint64_t v44 = [v42 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[VideoMattingMetal initWithStaticParams:renderingDisparityUpdateRate:renderingDisparityBlurRadius:renderingLensFocalLength_mm:useTemporalConfidence:metalContext:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/module/sdof/src/pipeline/VideoMattingMetal.mm", 504, v43];
        sub_1BA8161F4(v41 == 0, a9, 0, 4294944382, v44);

        if (!v41) {
          goto LABEL_40;
        }
        uint64_t v45 = [CVAFilterDiffusion alloc];
        LODWORD(v46) = 998310275;
        LODWORD(v47) = 1.0;
        uint64_t v48 = [(CVAFilterDiffusion *)v45 initWithDevice:*p_device library:*p_defaultLibrary pipelineLibrary:*p_pipelineLibrary bufferWidth:*p_width2 bufferHeight:*p_height2 edgeVariance:a9 stepSize:v46 error:v47];
        diffusion = v17->_diffusion;
        v17->_diffusion = (CVAFilterDiffusion *)v48;

        if (!v17->_diffusion) {
          goto LABEL_40;
        }
        if (v17->_doFaceMask && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BA813000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "CVAPhoto: Facemask-based disparity post-processing has been deprecated.", buf, 2u);
        }
        BOOL v50 = [CVAFilterDistanceTransform alloc];
        id v51 = *p_device;
        double v52 = *p_defaultLibrary;
        id v53 = *p_pipelineLibrary;
        uint64_t v54 = *p_height2;
        v157[0] = *p_width2;
        v157[1] = v54;
        v157[2] = 1;
        uint64_t v55 = [(CVAFilterDistanceTransform *)v50 initWithDevice:v51 library:v52 pipelineLibrary:v53 textureSize:v157 error:a9];
        distanceTransform = v17->_distanceTransform;
        v17->_distanceTransform = (CVAFilterDistanceTransform *)v55;

        if (!v17->_distanceTransform) {
          goto LABEL_40;
        }
        char v57 = [CVAFilterBox alloc];
        id v58 = *p_device;
        double v59 = *p_defaultLibrary;
        double v60 = *p_pipelineLibrary;
        uint64_t v61 = *p_height2;
        v156[0] = *p_width2;
        v156[1] = v61;
        v156[2] = 1;
        uint64_t v62 = [(CVAFilterBox *)v57 initWithDevice:v58 library:v59 pipelineLibrary:v60 textureSize:v156 error:a9];
        boxFilter = v17->_boxFilter;
        v17->_boxFilter = (CVAFilterBox *)v62;

        if (!v17->_boxFilter) {
          goto LABEL_40;
        }
        BOOL v64 = [[CVAFilterColorAlphaToFgBg alloc] initWithDevice:*p_device library:*p_defaultLibrary pipelineLibrary:*p_pipelineLibrary error:a9];
        colorAlphaToFgBg = v17->_colorAlphaToFgBg;
        v17->_colorAlphaToFgBg = v64;

        if (!v17->_colorAlphaToFgBg) {
          goto LABEL_40;
        }
        id v66 = [[CVAFilterHybridResampling alloc] initWithDevice:*p_device library:*p_defaultLibrary pipelineLibrary:*p_pipelineLibrary commandQueue:*p_commandQueue error:a9];
        hybridResampler = v17->_hybridResampler;
        v17->_hybridResampler = v66;

        if (!v17->_hybridResampler) {
          goto LABEL_40;
        }
        int v141 = sub_1BA84F794(@"harvesting.enabled", @"com.apple.coremedia", 0);
        int v68 = (int)(float)((float)(floorf((float)((float)((float)a3->kernelSize * 0.5) * (float)*p_width2)/ (float)a3->alphaWidth)* 2.0)+ 1.0);
        if (!v141)
        {
          uint64_t v69 = [objc_alloc(MEMORY[0x1E4F35598]) initWithDevice:*p_device kernelDiameter:v68];
          guidedFilter = v17->_guidedFilter;
          v17->_guidedFilter = (MPSImageGuidedFilter *)v69;

          int v71 = v17->_guidedFilter;
          float v72 = NSString;
          long double v73 = [NSString stringWithFormat:@"MPSImageGuidedFilter is nil"];
          double v74 = [v72 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[VideoMattingMetal initWithStaticParams:renderingDisparityUpdateRate:renderingDisparityBlurRadius:renderingLensFocalLength_mm:useTemporalConfidence:metalContext:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/module/sdof/src/pipeline/VideoMattingMetal.mm", 597, v73];
          sub_1BA8161F4(v71 == 0, a9, 0, 4294944382, v74);

          if (!v71) {
            goto LABEL_40;
          }
        }
        [(MPSImageGuidedFilter *)v17->_guidedFilter setRescaleCoefficients:0];
        [(MPSImageGuidedFilter *)v17->_guidedFilter setReconstructionCoefficientsSampleBicubic:1];
        long double v75 = [CVAFilterGuided alloc];
        id v76 = *p_device;
        uint64_t v77 = *p_defaultLibrary;
        float v78 = *p_pipelineLibrary;
        id v79 = *p_commandQueue;
        uint64_t v80 = *p_width2;
        uint64_t v81 = *p_height2;
        uint64_t v82 = *(void *)&a3->alphaWidth;
        *(void *)&long long v83 = v82;
        *((void *)&v83 + 1) = HIDWORD(v82);
        long long v153 = v83;
        float laplacianLimitingDownsampling = a3->laplacianLimitingDownsampling;
        int infConvolutionDownsampling = (int)a3->infConvolutionDownsampling;
        v155[0] = v80;
        v155[1] = v81;
        v155[2] = 1;
        uint64_t v154 = 1;
        LODWORD(v140) = (int)laplacianLimitingDownsampling;
        HIDWORD(v140) = (int)a3->laplacianLimitingBlurSize;
        uint64_t v86 = -[CVAFilterGuided initWithDevice:library:pipelineLibrary:commandQueue:textureSize:alphaSize:kernelSize:infConvolutionDownsampling:laplacianLimitingDownsampling:laplacianLimitingBlurSize:error:](v75, "initWithDevice:library:pipelineLibrary:commandQueue:textureSize:alphaSize:kernelSize:infConvolutionDownsampling:laplacianLimitingDownsampling:laplacianLimitingBlurSize:error:", v76, v77, v78, v79, v155, &v153, __PAIR64__(infConvolutionDownsampling, v68), v140, a9);
        cvaGuidedFilter = v17->_cvaGuidedFilter;
        v17->_cvaGuidedFilter = (CVAFilterGuided *)v86;

        if (!v17->_cvaGuidedFilter) {
          goto LABEL_40;
        }
        double v88 = [[CVAFilterMaskedVariableBlur alloc] initWithDevice:*p_device library:*p_defaultLibrary pipelineLibrary:*p_pipelineLibrary commandQueue:*p_commandQueue kernelSize:7 error:a9];
        maskedVariableBlur = v17->_maskedVariableBlur;
        v17->_maskedVariableBlur = v88;

        if (!v17->_maskedVariableBlur) {
          goto LABEL_40;
        }
        double v90 = [[CVAFilterRenderStagelight alloc] initWithDevice:*p_device library:*p_defaultLibrary pipelineLibrary:*p_pipelineLibrary error:a9];
        stagelightFilter = v17->_stagelightFilter;
        v17->_stagelightFilter = v90;

        if (!v17->_stagelightFilter
          || (double v92 = [[CVAFilterRenderComposite alloc] initWithDevice:*p_device library:*p_defaultLibrary pipelineLibrary:*p_pipelineLibrary error:a9], renderComposite = v17->_renderComposite, v17->_renderComposite = v92, renderComposite, !v17->_renderComposite))
        {
LABEL_40:
          int v26 = 0;
LABEL_41:

          goto LABEL_5;
        }
        v152 = &v159;
        *(void *)buf = &v17->_disparityDecimateKernel;
        uint64_t v162 = @"disparityDecimate";
        id v163 = 0;
        p_colorSimKernel = &v17->_colorSimKernel;
        coeffHistory = @"colorSim";
        uint64_t v166 = 0;
        p_colorSimL1Kernel = &v17->_colorSimL1Kernel;
        v168 = @"colorSimL1";
        v169 = 0;
        uint64_t p_temporalCoefficientsFilterKernel = (uint64_t)&v17->_temporalCoefficientsFilterKernel;
        v171 = @"temporalFilterCoefficients";
        id v172 = 0;
        p_guidedFilterWeightKernel = &v17->_guidedFilterWeightKernel;
        uint64_t v174 = @"guidedFilterWeight";
        id v175 = 0;
        p_disparityConfidenceMaskKernel = &v17->_disparityConfidenceMaskKernel;
        p_gfForegroundMask = @"disparityConfidenceMask";
        uint64_t v178 = 0;
        p_disparityMasksKernel = &v17->_disparityMasksKernel;
        v180 = @"disparityMasks";
        p_gfWeight = 0;
        uint64_t p_disparityIsValidKernel = (uint64_t)&v17->_disparityIsValidKernel;
        v183 = @"disparityIsValid";
        id v184 = 0;
        p_domainTransformXKernel = &v17->_domainTransformXKernel;
        uint64_t v186 = @"domainTransformX";
        id v187 = v159;
        p_domainTransformYKernel = &v17->_domainTransformYKernel;
        v189 = @"domainTransformY";
        uint64_t v190 = (uint64_t)v187;
        p_edgeAwareFillXKernel = &v17->_edgeAwareFillXKernel;
        v192 = @"edgeAwareFillX";
        disparity = (MTLTexture **)(id)v190;
        uint64_t p_edgeAwareFillYKernel = (uint64_t)&v17->_edgeAwareFillYKernel;
        v195 = @"edgeAwareFillY";
        v196 = disparity;
        p_invalidDisparityMaskKernel = &v17->_invalidDisparityMaskKernel;
        uint64_t v198 = @"invalidDisparityMask";
        id v199 = 0;
        p_bgFillXKernel = &v17->_bgFillXKernel;
        p_disparityInScreenAspectRatio = @"bgFillX";
        uint64_t v202 = 0;
        p_bgFillYKernel = &v17->_bgFillYKernel;
        v204 = @"bgFillY";
        p_facemaskDisparity = 0;
        uint64_t p_internalDisparityToCanonicalDisparityKernel = (uint64_t)&v17->_internalDisparityToCanonicalDisparityKernel;
        v207 = @"internalDisparityToCanonicalDisparity";
        id v208 = 0;
        p_simpleConfidenceKernel = &v17->_simpleConfidenceKernel;
        uint64_t v210 = @"simpleConfidence";
        id v211 = 0;
        p_roughDisparityKernel = &v17->_roughDisparityKernel;
        p_filledDisparityNoInvalidTexture = @"roughDisparity";
        uint64_t v214 = 0;
        p_diffusionMapKernel = &v17->_diffusionMapKernel;
        v216 = @"diffusionMap";
        p_temporallyFilteredDisparity = 0;
        uint64_t p_renderingDisparityDeweightKernel = (uint64_t)&v17->_renderingDisparityDeweightKernel;
        v219 = @"disparityDeweightFg";
        id v220 = 0;
        p_renderingDisparityFillAndFilterKernel = &v17->_renderingDisparityFillAndFilterKernel;
        uint64_t v222 = @"disparityFillAndFilter";
        id v223 = 0;
        p_disparityCleanupKernel = &v17->_disparityCleanupKernel;
        smoothConfidence = @"disparityCleanup";
        uint64_t v226 = sub_1BA85E8F8(&v152, @"kFirstFrame", 0);
        p_disparityCleanupKernel_firstFrame = &v17->_disparityCleanupKernel_firstFrame;
        v228 = @"disparityCleanup";
        sub_1BA85E8F8(&v152, @"kFirstFrame", 1);
        v229 = (MTLTexture **)objc_claimAutoreleasedReturnValue();
        uint64_t p_updateConfidenceAndLastValidDisparityKernel = (uint64_t)&v17->_updateConfidenceAndLastValidDisparityKernel;
        v231 = @"updateConfidenceAndLastValidDisparity";
        sub_1BA85E8F8(&v152, @"kUseTemporalConfidence", 0);
        id v232 = (id)objc_claimAutoreleasedReturnValue();
        p_updateConfidenceAndLastValidDisparityKernel_useTemporalConfidence = &v17->_updateConfidenceAndLastValidDisparityKernel_useTemporalConfidence;
        uint64_t v234 = @"updateConfidenceAndLastValidDisparity";
        sub_1BA85E8F8(&v152, @"kUseTemporalConfidence", 1);
        id v235 = (id)objc_claimAutoreleasedReturnValue();
        p_temporalDisparityFilterKernel = &v17->_temporalDisparityFilterKernel;
        smoothDisparity = @"temporalDisparityFilter";
        uint64_t v238 = sub_1BA85E8F8(&v152, @"kTemporalDisparityFallbackToInvalid", 0);
        p_temporalDisparityFilterKernel_fallbackToInvalid = &v17->_temporalDisparityFilterKernel_fallbackToInvalid;
        v240 = @"temporalDisparityFilter";
        sub_1BA85E8F8(&v152, @"kTemporalDisparityFallbackToInvalid", 1);
        v241 = (MTLTexture **)objc_claimAutoreleasedReturnValue();
        uint64_t p_fillBackgroundDisparityKernel = (uint64_t)&v17->_fillBackgroundDisparityKernel;
        v243 = @"fillBackgroundDisparity";
        sub_1BA85E8F8(&v152, @"kUseFacemaskInFillBackgroundDisparity", 0);
        id v244 = (id)objc_claimAutoreleasedReturnValue();
        p_fillBackgroundDisparityKernel_faceMask = &v17->_fillBackgroundDisparityKernel_faceMask;
        uint64_t v246 = @"fillBackgroundDisparity";
        sub_1BA85E8F8(&v152, @"kUseFacemaskInFillBackgroundDisparity", 1);
        id v247 = (id)objc_claimAutoreleasedReturnValue();
        p_halfDownSampler = &v17->_halfDownSampler;
        p_outputCanonicalDisparity = @"halfDownsample";
        uint64_t v250 = 0;
        p_alphaFillKernel = &v17->_alphaFillKernel;
        v252 = @"fillAlpha";
        p_diffusionMapTexture = 0;
        uint64_t p_rotateAndFitIntoRectKernel = (uint64_t)&v17->_rotateAndFitIntoRectKernel;
        v255 = @"rotateAndFitIntoRectKernel";
        id v256 = 0;
        sub_1BA85E98C(&v150, (uint64_t)buf, 0x20uLL);

        unint64_t v94 = v150;
        id v95 = v151;
        if (v150 != v151)
        {
          while (1)
          {
            sub_1BA8328CC((void **)*v94, *p_defaultLibrary, *p_pipelineLibrary, *p_device, v94[1], a9, v94[2]);
            if (!*(void *)*v94) {
              break;
            }
            v94 += 3;
            if (v94 == v95) {
              goto LABEL_30;
            }
          }
          int v26 = 0;
          goto LABEL_49;
        }
LABEL_30:
        *(void *)buf = &v17->_coeff;
        uint64_t v162 = 125;
        LODWORD(v163) = *p_width2;
        HIDWORD(v163) = *p_height2;
        p_colorSimKernel = 0;
        coeffHistory = (__CFString *)v17->_coeffHistory;
        uint64_t v166 = 115;
        LODWORD(p_colorSimL1Kernel) = *p_width2;
        HIDWORD(p_colorSimL1Kernel) = *p_height2;
        v168 = 0;
        v169 = &v17->_coeffHistory[1];
        uint64_t p_temporalCoefficientsFilterKernel = 115;
        LODWORD(v171) = *p_width2;
        HIDWORD(v171) = *p_height2;
        id v172 = 0;
        p_guidedFilterWeightKernel = &v17->_alphaNoPostprocessing;
        uint64_t v174 = 10;
        id v175 = *(id *)&a3->alphaWidth;
        p_disparityConfidenceMaskKernel = 0;
        p_gfForegroundMask = (__CFString *)&v17->_gfForegroundMask;
        uint64_t v178 = 10;
        LODWORD(p_disparityMasksKernel) = *p_width2;
        HIDWORD(p_disparityMasksKernel) = *p_height2;
        v180 = 0;
        p_gfWeight = &v17->_gfWeight;
        uint64_t p_disparityIsValidKernel = 25;
        LODWORD(v183) = *p_width2;
        HIDWORD(v183) = *p_height2;
        id v184 = 0;
        p_domainTransformXKernel = v17->_disparityLastValidValue;
        uint64_t v186 = 25;
        LODWORD(v187) = *p_width2;
        HIDWORD(v187) = *p_height2;
        p_domainTransformYKernel = 0;
        v189 = (__CFString *)&v17->_disparityLastValidValue[1];
        uint64_t v190 = 25;
        LODWORD(p_edgeAwareFillXKernel) = *p_width2;
        HIDWORD(p_edgeAwareFillXKernel) = *p_height2;
        v192 = 0;
        disparity = v17->_disparity;
        uint64_t p_edgeAwareFillYKernel = 25;
        LODWORD(v195) = *p_width2;
        HIDWORD(v195) = *p_height2;
        v196 = 0;
        p_invalidDisparityMaskKernel = &v17->_disparity[1];
        uint64_t v198 = 25;
        LODWORD(v199) = *p_width2;
        HIDWORD(v199) = *p_height2;
        p_bgFillXKernel = 0;
        p_disparityInScreenAspectRatio = (__CFString *)&v17->_disparityInScreenAspectRatio;
        uint64_t v202 = 25;
        LODWORD(p_bgFillYKernel) = 2 * *p_width2;
        HIDWORD(p_bgFillYKernel) = 2 * *p_height2;
        v204 = 0;
        p_facemaskDisparity = &v17->_facemaskDisparity;
        uint64_t p_internalDisparityToCanonicalDisparityKernel = 25;
        LODWORD(v207) = *p_width2;
        HIDWORD(v207) = *p_height2;
        id v208 = 0;
        p_simpleConfidenceKernel = &v17->_filledDisparityTexture;
        uint64_t v210 = 25;
        LODWORD(v211) = *p_width2;
        HIDWORD(v211) = *p_height2;
        p_roughDisparityKernel = 0;
        p_filledDisparityNoInvalidTexture = (__CFString *)&v17->_filledDisparityNoInvalidTexture;
        uint64_t v214 = 25;
        LODWORD(p_diffusionMapKernel) = *p_width2;
        HIDWORD(p_diffusionMapKernel) = *p_height2;
        v216 = 0;
        p_temporallyFilteredDisparity = &v17->_temporallyFilteredDisparity;
        uint64_t p_renderingDisparityDeweightKernel = 25;
        LODWORD(v219) = *p_width2;
        HIDWORD(v219) = *p_height2;
        id v220 = 0;
        p_renderingDisparityFillAndFilterKernel = &v17->_disparityConfidenceMaskTexture;
        uint64_t v222 = 25;
        LODWORD(v223) = *p_width2;
        HIDWORD(v223) = *p_height2;
        p_disparityCleanupKernel = 0;
        smoothConfidence = (__CFString *)v17->_smoothConfidence;
        uint64_t v226 = 25;
        LODWORD(p_disparityCleanupKernel_firstFrame) = *p_width2;
        HIDWORD(p_disparityCleanupKernel_firstFrame) = *p_height2;
        v228 = 0;
        v229 = &v17->_smoothConfidence[1];
        uint64_t p_updateConfidenceAndLastValidDisparityKernel = 25;
        LODWORD(v231) = *p_width2;
        HIDWORD(v231) = *p_height2;
        id v232 = 0;
        p_updateConfidenceAndLastValidDisparityKernel_useTemporalConfidence = &v17->_colorSim;
        uint64_t v234 = 10;
        LODWORD(v235) = *p_width2;
        HIDWORD(v235) = *p_height2;
        p_temporalDisparityFilterKernel = 0;
        smoothDisparity = (__CFString *)v17->_smoothDisparity;
        uint64_t v238 = 55;
        LODWORD(p_temporalDisparityFilterKernel_fallbackToInvalid) = *p_width2;
        HIDWORD(p_temporalDisparityFilterKernel_fallbackToInvalid) = *p_height2;
        v240 = 0;
        v241 = &v17->_smoothDisparity[1];
        uint64_t p_fillBackgroundDisparityKernel = 55;
        LODWORD(v243) = *p_width2;
        HIDWORD(v243) = *p_height2;
        id v244 = 0;
        p_fillBackgroundDisparityKernel_faceMask = &v17->_roughDisparity;
        uint64_t v246 = 25;
        LODWORD(v247) = *p_width2;
        HIDWORD(v247) = *p_height2;
        p_halfDownSampler = 0;
        p_outputCanonicalDisparity = (__CFString *)&v17->_outputCanonicalDisparity;
        uint64_t v250 = 25;
        LODWORD(p_alphaFillKernel) = *p_width2;
        HIDWORD(p_alphaFillKernel) = *p_height2;
        v252 = 0;
        p_diffusionMapTexture = &v17->_diffusionMapTexture;
        uint64_t p_rotateAndFitIntoRectKernel = 25;
        LODWORD(v255) = *p_width2;
        HIDWORD(v255) = *p_height2;
        id v256 = 0;
        p_disparityIsValidTexture = &v17->_disparityIsValidTexture;
        uint64_t v258 = 13;
        int v259 = *p_width2;
        int v260 = *p_height2;
        uint64_t v261 = 0;
        p_distanceFromKnownDisparityTexture = &v17->_distanceFromKnownDisparityTexture;
        uint64_t v263 = 25;
        int v264 = *p_width2;
        int v265 = *p_height2;
        uint64_t v266 = 0;
        p_domainTransformXTexture = &v17->_domainTransformXTexture;
        uint64_t v268 = 25;
        int v269 = *p_width2;
        int v270 = *p_height2;
        uint64_t v271 = 0;
        p_domainTransformYTexture = &v17->_domainTransformYTexture;
        uint64_t v273 = 25;
        int v274 = *p_width2;
        int v275 = *p_height2;
        uint64_t v276 = 0;
        p_tempFloatR32FloatTexture = &v17->_tempFloatR32FloatTexture;
        uint64_t v278 = 55;
        int v279 = *p_width2;
        int v280 = *p_height2;
        uint64_t v281 = 0;
        p_edgeAwareFillTempTexture = &v17->_edgeAwareFillTempTexture;
        uint64_t v283 = 25;
        int v284 = *p_width2;
        int v285 = *p_height2;
        uint64_t v286 = 0;
        p_bgFillTempTexture = &v17->_bgFillTempTexture;
        uint64_t v288 = 25;
        int v289 = *p_width2;
        int v290 = *p_height2;
        uint64_t v291 = 0;
        p_invalidDisparityMaskTexture = &v17->_invalidDisparityMaskTexture;
        uint64_t v293 = 13;
        int v294 = *p_width2;
        int v295 = *p_height2;
        uint64_t v296 = 0;
        p_initDisparity = &v17->_initDisparity;
        uint64_t v298 = 25;
        int v299 = *p_width2;
        int v300 = *p_height2;
        uint64_t v301 = 0;
        p_isForegroundTexture = &v17->_isForegroundTexture;
        uint64_t v303 = 13;
        int v304 = *p_width2;
        int v305 = *p_height2;
        uint64_t v306 = 0;
        p_distanceToForegroundTexture = &v17->_distanceToForegroundTexture;
        uint64_t v308 = 25;
        int v309 = *p_width2;
        int v310 = *p_height2;
        uint64_t v311 = 0;
        p_correctlyRotatedAndReshapedSegmentation = &v17->_correctlyRotatedAndReshapedSegmentation;
        uint64_t v313 = 25;
        int v314 = *p_width2;
        int v315 = *p_height2;
        uint64_t v316 = 0;
        p_blurredBg = &v17->_blurredBg;
        uint64_t v318 = 70;
        int width = v17->_width;
        int height = v17->_height;
        uint64_t v321 = 0;
        p_deweightedDisparity = &v17->_deweightedDisparity;
        uint64_t v323 = 65;
        int v324 = *p_width2;
        int v325 = *p_height2;
        uint64_t v326 = 0;
        shift = v17->_shift;
        uint64_t v328 = 65;
        int v329 = *p_width2;
        int v330 = *p_height2;
        uint64_t v331 = 0;
        v332 = &v17->_shift[1];
        uint64_t v333 = 65;
        int v334 = *p_width2;
        int v335 = *p_height2;
        uint64_t v336 = 0;
        p_coc = &v17->_coc;
        uint64_t v338 = 10;
        int v339 = *p_width2;
        int v340 = *p_height2;
        uint64_t v341 = 0;
        sub_1BA85EA34(&__p, buf, 0x29uLL);
        id v97 = (void ***)__p;
        id v96 = v149;
        if (__p != v149)
        {
          do
          {
            uint64_t v98 = sub_1BA862650(*p_device, (uint64_t)v97[1], *((int *)v97 + 4), *((int *)v97 + 5), (uint64_t)v97[3], a9);
            uint64_t v99 = **v97;
            *void *v97 = (void *)v98;

            if (!**v97) {
              goto LABEL_46;
            }
            v97 += 4;
          }
          while (v97 != v96);
        }
        v100 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:25 width:*p_width2 height:*p_height2 mipmapped:0];
        [v100 setUsage:7];
        uint64_t v101 = [*p_device newTextureWithDescriptor:v100];
        facemaskRegionTexture = v17->_facemaskRegionTexture;
        v17->_facemaskRegionTexture = (MTLTexture *)v101;

        id v103 = v17->_facemaskRegionTexture;
        id v104 = NSString;
        id v105 = [NSString stringWithFormat:@"_facemaskRegionTexture is nil"];
        v106 = [v104 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[VideoMattingMetal initWithStaticParams:renderingDisparityUpdateRate:renderingDisparityBlurRadius:renderingLensFocalLength_mm:useTemporalConfidence:metalContext:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/module/sdof/src/pipeline/VideoMattingMetal.mm", 802, v105];
        sub_1BA8161F4(v103 == 0, a9, 0, 4294944382, v106);

        if (v103)
        {
          if (v17->_height >= v17->_width) {
            int v107 = v17->_width;
          }
          else {
            int v107 = v17->_height;
          }
          float v108 = objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 70);
          [v108 setUsage:3];
          [v108 setMipmapLevelCount:vcvtps_u32_f32(log2f((float)((unint64_t)v107 >> 3)))];
          uint64_t v109 = [*p_device newTextureWithDescriptor:v108];
          double v110 = NSString;
          id v111 = [NSString stringWithFormat:@"_bg is nil"];
          float v112 = [v110 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[VideoMattingMetal initWithStaticParams:renderingDisparityUpdateRate:renderingDisparityBlurRadius:renderingLensFocalLength_mm:useTemporalConfidence:metalContext:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/module/sdof/src/pipeline/VideoMattingMetal.mm", 816, v111];
          sub_1BA8161F4(v109 == 0, a9, 0, 4294944382, v112);

          if (v109)
          {
            bg = v17->_bg;
            v17->_bg = (MTLTexture *)v109;

            if (v141)
            {
LABEL_39:
              dispatch_semaphore_t v114 = dispatch_semaphore_create(0);
              semaphore = v17->_semaphore;
              v17->_semaphore = (OS_dispatch_semaphore *)v114;

              dispatch_semaphore_t v116 = dispatch_semaphore_create(5);
              renderingCallbackSemaphore = v17->_renderingCallbackSemaphore;
              v17->_renderingCallbackSemaphore = (OS_dispatch_semaphore *)v116;

              dispatch_queue_t v118 = dispatch_queue_create("_synchronousRenderingCallbackQueue", 0);
              synchronousRenderingCallbackQueue = v17->_synchronousRenderingCallbackQueue;
              v17->_synchronousRenderingCallbackQueue = (OS_dispatch_queue *)v118;

              dispatch_semaphore_t v120 = dispatch_semaphore_create(5);
              mattingCallbackSemaphore = v17->_mattingCallbackSemaphore;
              v17->_mattingCallbackSemaphore = (OS_dispatch_semaphore *)v120;

              dispatch_queue_t v122 = dispatch_queue_create("_synchronousMattingCallbackQueue", 0);
              synchronousMattingCallbackQueue = v17->_synchronousMattingCallbackQueue;
              v17->_synchronousMattingCallbackQueue = (OS_dispatch_queue *)v122;

              int v26 = v17;
              goto LABEL_47;
            }
            id v124 = objc_alloc(MEMORY[0x1E4F35588]);
            LODWORD(v125) = 1053609165;
            uint64_t v126 = [v124 initWithDevice:*p_device sigma:v125];
            smoothFilter = v17->_smoothFilter;
            v17->_smoothFilter = (MPSImageGaussianBlur *)v126;

            uint64_t v128 = [objc_alloc(MEMORY[0x1E4F35550]) initWithDevice:*p_device kernelWidth:(unint64_t)(float)((float)(v17->_renderingDisparityBlurRadius * 2.0) + 1.0) kernelHeight:(unint64_t)(float)((float)(v17->_renderingDisparityBlurRadius * 2.0) + 1.0)];
            disparityBlurBoxKernel = v17->_disparityBlurBoxKernel;
            v17->_disparityBlurBoxKernel = (MPSImageBox *)v128;

            [(MPSImageBox *)v17->_disparityBlurBoxKernel setEdgeMode:0];
            uint64_t v130 = [objc_alloc(MEMORY[0x1E4F35550]) initWithDevice:*p_device kernelWidth:7 kernelHeight:7];
            fgBlurBoxKernel = v17->_fgBlurBoxKernel;
            v17->_fgBlurBoxKernel = (MPSImageBox *)v130;

            [(MPSImageBox *)v17->_fgBlurBoxKernel setEdgeMode:1];
            uint64_t v132 = [objc_alloc(MEMORY[0x1E4F35540]) initWithDevice:*p_device kernelWidth:3 kernelHeight:3];
            fgMaskErosionKernel = v17->_fgMaskErosionKernel;
            v17->_fgMaskErosionKernel = (MPSImageAreaMin *)v132;

            [(MPSImageAreaMin *)v17->_fgMaskErosionKernel setEdgeMode:0];
            int v134 = IOSurfaceAcceleratorCreate();
            v135 = NSString;
            v136 = [NSString stringWithFormat:@"Failed to create IOAccelerator"];
            v137 = [v135 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[VideoMattingMetal initWithStaticParams:renderingDisparityUpdateRate:renderingDisparityBlurRadius:renderingLensFocalLength_mm:useTemporalConfidence:metalContext:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/module/sdof/src/pipeline/VideoMattingMetal.mm", 850, v136];
            sub_1BA8161F4(v134 != 0, a9, 0, 4294944396, v137);

            if (!v134)
            {
              v138 = [*p_commandQueue commandBuffer];
              [v138 setLabel:@"MPS-prewarming"];
              sub_1BA862D9C(v17->_disparityBlurBoxKernel, *p_device, v138, [(MTLTexture *)v17->_deweightedDisparity pixelFormat]);
              LODWORD(v139) = *p_height2;
              [(VideoMattingMetal *)v17 prewarmGuidedFilter:v17->_guidedFilter device:*p_device commandBuffer:v138 width:v17->_width height:v17->_height width2:*p_width2 height2:v139];
              [(VideoMattingMetal *)v17 encodeCopyTextureToCommandBuffer:v138 inTexture:v17->_disparity[0] outTexture:v17->_disparity[1]];
              [v138 commit];

              goto LABEL_39;
            }
          }
          else
          {
          }
        }
        else
        {
        }
LABEL_46:
        int v26 = 0;
LABEL_47:
        if (__p)
        {
          v149 = (void ***)__p;
          operator delete(__p);
        }
LABEL_49:
        sub_1BA85EAA4((void **)&v150);
        goto LABEL_41;
      }
    }
  }
  int v26 = 0;
LABEL_5:

  return v26;
}

+ (void)decomposeYuvPixelBuffer:(__CVBuffer *)a3 yTexture:(id *)a4 uvTexture:(id *)a5 textureCache:(__CVMetalTextureCache *)a6
{
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  uint64_t v12 = +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats];
  id v13 = [NSNumber numberWithUnsignedInt:PixelFormatType];
  char v14 = [v12 containsObject:v13];

  if ((v14 & 1) == 0)
  {
    int v22 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v23 = +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats];
    [v22 handleFailureInMethod:a2, a1, @"VideoMattingMetal.mm", 3415, @"yuvBuffer is not one of %@", v23 object file lineNumber description];
  }
  id v27 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:10 width:Width height:Height mipmapped:0];
  [v27 setUsage:3];
  id v15 = (void *)MEMORY[0x1E4F35330];
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 1uLL);
  id v17 = objc_msgSend(v15, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 30, WidthOfPlane, CVPixelBufferGetHeightOfPlane(a3, 1uLL), 0);
  [v17 setUsage:3];
  int v18 = objc_msgSend(a1, "textureFromCacheUsingPixelBuffer:textureDescriptor:plane:textureCache:", a3);
  id v19 = *a4;
  *a4 = v18;

  double v20 = [a1 textureFromCacheUsingPixelBuffer:a3 textureDescriptor:v17 plane:1 textureCache:a6];
  id v21 = *a5;
  *a5 = v20;
}

+ (id)textureFromCacheUsingPixelBuffer:(__CVBuffer *)a3 textureDescriptor:(id)a4 plane:(unint64_t)a5 textureCache:(__CVMetalTextureCache *)a6
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  CVMetalTextureRef image = 0;
  v26[0] = *MEMORY[0x1E4F24C88];
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "usage"));
  v27[0] = v11;
  v26[1] = *MEMORY[0x1E4F24C80];
  uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "storageMode"));
  v27[1] = v12;
  CFDictionaryRef v13 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
  MTLPixelFormat v14 = [v10 pixelFormat];
  size_t v15 = [v10 width];
  size_t v16 = [v10 height];
  uint64_t v17 = CVMetalTextureCacheCreateTextureFromImage((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a6, a3, v13, v14, v15, v16, a5, &image);

  if (v17)
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"VideoMattingMetal.mm", 3392, @"Cannot get textureRef from cache. Error code %ul", v17);
  }
  int v18 = image;
  if (!image)
  {
    int v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2 object:a1 file:@"VideoMattingMetal.mm" lineNumber:3393 description:@"Cannot get textureRef from cache"];

    int v18 = image;
  }
  id v19 = CVMetalTextureGetTexture(v18);
  CFRelease(image);
  if (!v19)
  {
    long long v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:a1 file:@"VideoMattingMetal.mm" lineNumber:3398 description:@"Cannot get texture from textureRef"];
  }

  return v19;
}

+ (void)saveTexture:(id)a3 toFilename:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 pixelFormat] != 252 && objc_msgSend(v7, "pixelFormat") != 55)
  {
    int v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:a1 file:@"VideoMattingMetal.mm" lineNumber:3354 description:@"unsupported pixel format!"];
  }
  unint64_t v9 = [v7 width];
  unint64_t v10 = [v7 height];
  double v11 = (double)v10;
  uint64_t v12 = malloc_type_malloc(vcvtd_n_u64_f64((double)v9 * (double)v10, 2uLL), 0x8D82C475uLL);
  unint64_t v13 = vcvtd_n_u64_f64((double)v9, 2uLL);
  memset(v19, 0, 24);
  v19[3] = (unint64_t)(double)v9;
  v19[4] = (unint64_t)(double)v10;
  v19[5] = 1;
  [v7 getBytes:v12 bytesPerRow:v13 fromRegion:v19 mipmapLevel:0];
  MTLPixelFormat v14 = objc_msgSend(NSString, "stringWithFormat:", @"_32f_%dx%d.raw", v9, v10);
  size_t v15 = [v8 stringByAppendingString:v14];

  id v16 = v15;
  uint64_t v17 = fopen((const char *)[v16 cStringUsingEncoding:4], "wb");
  fwrite(v12, 4uLL, (unint64_t)((double)(v13 >> 2) * v11), v17);
  fclose(v17);
  free(v12);
}

@end