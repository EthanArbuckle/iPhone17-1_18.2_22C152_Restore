@interface BWPhotoEncoderController
+ (BOOL)usesCustomProcessingFlow;
- (BOOL)_addAlternateImageForEncodingScheme:(int)a3 flexGTCColorSpace:(CGColorSpace *)a4 isP3primaries:(BOOL)a5 tonemapItemMetadata:(id)a6 parentImageHandle:(int64_t)a7 gainMapHandle:(int64_t)a8;
- (BOOL)_addConstantColorConfidenceMapForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4;
- (BOOL)_addDepthForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 primaryOutputAspectRatio:(double)a5 parentImageHandle:(int64_t)a6;
- (BOOL)_addGainMapForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 outputDimensions:(id)a5 primaryOutputAspectRatio:(double)a6 parentImageHandle:(int64_t)a7;
- (BOOL)_addGainMapMetadataForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 parentImageHandle:(int64_t)a5;
- (BOOL)_addPortraitEffectsMatteForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 primaryOutputAspectRatio:(double)a5 parentImageHandle:(int64_t)a6;
- (BOOL)_addSemanticMattesForEncodingScheme:(int)a3 attachedMediaKey:(id)a4 sampleBuffer:(opaqueCMSampleBuffer *)a5 primaryOutputAspectRatio:(double)a6 settingsID:(int64_t)a7 orientation:(int)a8 parentImageHandle:(int64_t)a9;
- (BOOL)_addSmartStyleDeltaMapForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 stillImageSettings:(id)a5 primaryOutputAspectRatio:(double)a6;
- (BOOL)_addSmartStyleLinearThumbnailForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 primaryOutputAspectRatio:(double)a5;
- (BOOL)_depthEncodingNeededForSettings:(id)a3 deferredPhotoProxy:(BOOL)a4;
- (BOOL)_finalImageExpectingSmartStyleReversibilityDataForDeferredPhotoProxy:(BOOL)a3 settings:(id)a4 adjustedPhoto:(BOOL)a5;
- (BOOL)_personMaskEncodingNeededForSettings:(id)a3 encodingScheme:(int)a4 deferredPhotoProxy:(BOOL)a5 adjustedPhoto:(BOOL)a6;
- (BOOL)_postponeSelectResourceAllocations;
- (BOOL)_smartStyleReversibilityDataNeededForSettings:(id)a3 adjustedPhoto:(BOOL)a4 deferredPhotoProxy:(BOOL)a5;
- (BOOL)_waitUntilTimeoutForInferenceGroupToCompleteAndReturnSuccess;
- (BOOL)clientExpectsCameraMountedInLandscapeOrientation;
- (BOOL)intermediateResourceTrackingAllowedForAttachedMediaKey:(id)a3;
- (BOOL)preferMainImageDownscalingFactorByAttachedMediaKeyFromSampleBuffer;
- (BWPhotoEncoderController)initWithConfiguration:(id)a3;
- (BWPhotoEncoderControllerDelegate)primaryOwnerDelegate;
- (CGImageMetadata)_newAuxiliaryImagePropertiesFromPortraitEffectsMatteMetadata:(id)a3;
- (CGImageMetadata)_newAuxiliaryImagePropertiesFromSemanticMatteSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (CGImageMetadata)_newGainMapAuxiliaryImagePropertiesForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 denormalizedCropRect:(CGRect)a5 requiresPhotosAdjustment:(BOOL)a6 encodingOptionsOut:(id *)a7 flexGTCColorSpaceOut:(CGColorSpace *)a8 tonemapItemMetadataOut:(id *)a9 isP3PrimariesOut:(BOOL *)a10;
- (CGRect)_cropRectForRequestedSettings:(id)a3 inputDimensions:(id)a4 metadata:(id)a5 processingFlags:(unsigned int)a6;
- (NSDictionary)resolvedVideoFormatsByAttachedMediaKey;
- (NSString)currentInputsCaptureRequestIdentifier;
- (__IOSurface)_closeContainerAndCopySurfaceForEncodingScheme:(int)a3;
- (double)_aspectRatioAdjustmentFactorForSettings:(id)a3;
- (double)_primaryOutputAspectRatioForSettings:(id)a3;
- (float)mainImageDownscalingFactorForAttachedMediaKey:(id)a3 attachedMediaMetadata:(id)a4;
- (id)_depthEncodingOptionsFromDepthMetadata:(id)a3 pixelFormat:(unsigned int)a4;
- (id)_encoderManagerForEncodingScheme:(int)a3;
- (id)_newMetadataAttachmentsForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 requestedSettings:(id)a5 captureType:(int)a6;
- (id)_newRawMetadataAttachmentsForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 dngDictionary:(id)a5 requestedSettings:(id)a6 captureType:(int)a7 dngContainsDepthData:(BOOL)a8 dngContainsSemanticSegmentationMattes:(BOOL)a9;
- (id)_semanticSegmentationMatteMediaKeysEncodingNeededForSettings:(id)a3 encodingScheme:(int)a4 deferredPhotoProxy:(BOOL)a5 adjustedPhoto:(BOOL)a6;
- (id)_thumbnailOptionsForImageWithMetadata:(id)a3 requestedStillImageCaptureSettings:(id)a4 resolvedStillImageCaptureSettings:(id)a5 processingFlags:(unsigned int)a6 cropRect:(CGRect)a7 codecType:(unsigned int)a8 maxPixelSize:(unint64_t)a9;
- (id)inputForStillImageSettings:(id)a3 portType:(id)a4 portraitAdjustedImage:(BOOL)a5 optionalSampleBuffer:(opaqueCMSampleBuffer *)a6 forEarlyEncoding:(BOOL)a7;
- (id)inputFormatForAttachedMediaKey:(id)a3;
- (id)inputInferenceVideoFormatForAttachedMediaKey:(id)a3;
- (id)inputVideoFormatForAttachedMediaKey:(id)a3;
- (id)outputFormatForAttachedMediaKey:(id)a3;
- (id)outputVideoFormatForAttachedMediaKey:(id)a3;
- (id)requestForInput:(id)a3 delegate:(id)a4 errOut:(int *)a5;
- (int)_addCompressedThumbnailForEncodingScheme:(int)a3 thumbnailSurface:(__IOSurface *)a4 thumbnailSurfaceSize:(unint64_t)a5;
- (int)_addMetadataAttachmentsForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 requestedSettings:(id)a5 captureType:(int)a6 parentImageHandle:(int64_t)a7;
- (int)_addOrPrewarmForAttachedMediaKey:(id)a3 encodingScheme:(int)a4 sampleBuffer:(opaqueCMSampleBuffer *)a5 metadata:(id)a6 stillImageSettings:(id)a7 parentImageHandle:(int64_t)a8;
- (int)_addSmartStyleMetadataForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 requestedStillImageCaptureSettings:(id)a5;
- (int)_addThumbnailForEncodingScheme:(int)a3 thumbnailPixelBuffer:(__CVBuffer *)a4 metadata:(id)a5 requestedStillImageCaptureSettings:(id)a6 resolvedStillImageCaptureSettings:(id)a7 processingFlags:(unsigned int)a8 cropRect:(CGRect)a9 codecType:(unsigned int)a10 maxPixelSize:(unint64_t)a11 parentImageHandle:(int64_t)a12;
- (int)_addUnstyledImageForEncodingScheme:(int)a3 sbuf:(opaqueCMSampleBuffer *)a4 imageDimensions:(id)a5 processingFlags:(unsigned int)a6 metadata:(id)a7 requestedStillImageCaptureSettings:(id)a8 resolvedStillImageCaptureSettings:(id)a9 cropRect:(CGRect)a10 usePixelsOutsideCrop:(BOOL)a11;
- (int)_addValue:(id)a3 toAuxiliaryImageProperties:(CGImageMetadata *)a4 namespace:(__CFString *)a5 prefix:(__CFString *)a6 key:(__CFString *)a7;
- (int)_computeAndAddSmartStyleDeltaMapToClosedSurfaceContainer:(__IOSurface *)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 encodingScheme:(int)a5 stillImageSettings:(id)a6 processingFlags:(unsigned int)a7;
- (int)_decompressSmartStylePhotoSurface:(__IOSurface *)a3;
- (int)_encodeDNGForEncodingScheme:(int)a3 rawSampleBuffer:(opaqueCMSampleBuffer *)a4 dngDictionary:(id)a5 requestedSettings:(id)a6 captureType:(int)a7 cropRect:(CGRect)a8 dngContainsDepthData:(BOOL)a9 dngContainsSemanticSegmentationMattes:(BOOL)a10 processingFlags:(unsigned int)a11;
- (int)_encodePhotoForEncodingScheme:(int)a3 pixelBuffer:(__CVBuffer *)a4 imageDimensions:(id)a5 processingFlags:(unsigned int)a6 metadata:(id)a7 thumbnailOptions:(id)a8 requestedStillImageCaptureSettings:(id)a9 resolvedStillImageCaptureSettings:(id)a10 cropRect:(CGRect)a11 usePixelsOutsideCrop:(BOOL)a12 usedContainerOptionsOut:(id *)a13 usedEncodingOptionsOut:(id *)a14 mainImageHandleInOut:(int64_t *)a15;
- (int)_ensureSetupForPostponedResources;
- (int)_generatePhotoSurfaceFromEncodedImageBuffer:(opaqueCMSampleBuffer *)a3 photoSurfaceOut:(__IOSurface *)a4 photoSurfaceSizeOut:(unint64_t *)a5;
- (int)_generatePreviewForSampleBuffer:(opaqueCMSampleBuffer *)a3 requestedStillImageCaptureSettings:(id)a4 cropRect:(CGRect)a5 previewPixelBuffer:(__CVBuffer *)a6;
- (int)_getColorSpacePropertiesForSourcePixelFormat:(unsigned int)a3 sourceWidth:(int)a4 sourceHeight:(int)a5 destinationPixelFormat:(unsigned int)a6;
- (int)_loadCreateAndSetupSmartStyleRenderingProcessor;
- (int)_optionsForEncodingScheme:(int)a3 pixelBuffer:(__CVBuffer *)a4 imageDimensions:(id)a5 processingFlags:(unsigned int)a6 metadata:(id)a7 thumbnailOptions:(id)a8 requestedStillImageCaptureSettings:(id)a9 resolvedStillImageCaptureSettings:(id)a10 cropRect:(CGRect)a11 usePixelsOutsideCrop:(BOOL)a12 containerOptionsOut:(id *)a13 encodingOptionsOut:(id *)a14;
- (int)_processSbuf;
- (int)_updateSmartStyleDeltaMapForSampleBufferIfNeeded:(opaqueCMSampleBuffer *)a3 decompressedStyledPixelBuffer:(__CVBuffer *)a4 stillImageSettings:(id)a5 encodingScheme:(int)a6 processingFlags:(unsigned int)a7;
- (int)prepare;
- (int)prepareForCurrentConfigurationToBecomeLive;
- (opaqueCMSampleBuffer)_newAuxImageEncodingTriggerSbufForSettings:(id)a3 metadata:(id)a4;
- (unint64_t)type;
- (void)_addOrPrewarmAuxImagesIfNeededForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 metadata:(id)a5 stillImageSettings:(id)a6 processingFlags:(unsigned int)a7 parentImageHandle:(int64_t)a8;
- (void)_addQualityOptionsToDictionary:(id)a3 codecType:(unsigned int)a4 pixelBuffer:(__CVBuffer *)a5 imageDimensions:(id)a6 metadata:(id)a7 requestedStillImageCaptureSettings:(id)a8 resolvedStillImageCaptureSettings:(id)a9 enableHEIFTiling:(BOOL)a10 enableHEIFOrientation:(BOOL)a11 auxImageType:(int)a12;
- (void)_closeContainerForEncodingScheme:(int)a3;
- (void)_flushCurrentRequest;
- (void)_flushInputsByCaptureIdentifier;
- (void)_getAssetsSizeForEncodingScheme:(int)a3 containerSizeOut:(unint64_t *)a4 thumbnailSizeOut:(unint64_t *)a5 auxiliaryImagesSizeOut:(unint64_t *)a6;
- (void)_handlePrewarmForConstantColorConfidenceMapForEncodingScheme:(int)a3 requestedStillImageCaptureSettings:(id)a4 confidenceMapDimensions:(id)a5;
- (void)_handlePrewarmForDepthForEncodingScheme:(int)a3 requestedStillImageCaptureSettings:(id)a4 prewarmingMetadata:(id)a5;
- (void)_handlePrewarmForGainMapForEncodingScheme:(int)a3 requestedStillImageCaptureSettings:(id)a4 prewarmingMetadata:(id)a5;
- (void)_handlePrewarmForMainImageForEncodingScheme:(int)a3 prewarmingMetadata:(id)a4 stillImageSettings:(id)a5;
- (void)_handlePrewarmForPortraitEffectsMatteForEncodingScheme:(int)a3 requestedStillImageCaptureSettings:(id)a4;
- (void)_performInferenceWithBuffer:(opaqueCMSampleBuffer *)a3;
- (void)_prewarmAndReserveMainImageHandleForEncodingScheme:(int)a3 prewarmingMetadata:(id)a4 stillImageSettings:(id)a5;
- (void)_propagateSampleBufferGainMapMetadata:(opaqueCMSampleBuffer *)a3 toSampleBufferMetadata:(opaqueCMSampleBuffer *)a4;
- (void)_releaseResources;
- (void)_removeCurrentRequestFromInputsByCaptureIdentifier;
- (void)_tagStereoPairGroupForEncodingScheme:(int)a3 stereoPhotoImageHandles:(id *)a4 groupMetadata:(id)a5;
- (void)_updateStillImageProcessingFlagsWithDepthMetadataForSbuf:(opaqueCMSampleBuffer *)a3 stillImageSettings:(id)a4;
- (void)_waitForPiecemealEncodingGroupToComplete;
- (void)_waitForPiecemealEncodingQueueToComplete;
- (void)_waitForPreviewGenerationGroupToComplete;
- (void)_waitForPreviewGenerationQueueToComplete;
- (void)_waitForPrewarmingQueueToComplete;
- (void)cancelProcessing;
- (void)dealloc;
- (void)inputReceivedNewAuxMedia:(id)a3 auxSbuf:(opaqueCMSampleBuffer *)a4 attachedMediaKey:(id)a5 primaryImageMetadata:(id)a6 processingFlags:(unsigned int)a7;
- (void)inputReceivedNewInputData:(id)a3;
- (void)reset;
- (void)setClientExpectsCameraMountedInLandscapeOrientation:(BOOL)a3;
- (void)setPreferMainImageDownscalingFactorByAttachedMediaKeyFromSampleBuffer:(BOOL)a3;
- (void)setPrimaryOwnerDelegate:(id)a3;
- (void)setResolvedVideoFormatsByAttachedMediaKey:(id)a3;
- (void)waitForAllAsynchronousProcessingToComplete;
@end

@implementation BWPhotoEncoderController

- (void)setPreferMainImageDownscalingFactorByAttachedMediaKeyFromSampleBuffer:(BOOL)a3
{
  self->_preferMainImageDownscalingFactorByAttachedMediaKeyFromSampleBuffer = a3;
}

- (void)setPrimaryOwnerDelegate:(id)a3
{
}

- (BWPhotoEncoderController)initWithConfiguration:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)BWPhotoEncoderController;
  v4 = [(BWStillImageProcessorController *)&v14 initWithName:@"PhotoEncoder" type:19 configuration:a3];
  if (v4)
  {
    v5 = (BWPhotoEncoderControllerConfiguration *)a3;
    v4->_configuration = v5;
    [(BWStillImageProcessorControllerConfiguration *)v5 figThreadPriority];
    v4->_previewGenerationQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    v4->_previewGenerationGroup = (OS_dispatch_group *)dispatch_group_create();
    int v6 = FigCapturePlatformIdentifier();
    uint64_t v7 = 12;
    if (v6 > 8) {
      uint64_t v7 = 10;
    }
    v4->_dngBitDepth = v7;
    int v13 = 1;
    size_t v12 = 4;
    if (sysctlbyname("hw.logicalcpu", &v13, &v12, 0, 0))
    {
      uint64_t v8 = 6;
      int v13 = 6;
    }
    else
    {
      uint64_t v8 = v13;
    }
    v4->_uint64_t maxThreads = v8;
    if ([(BWPhotoEncoderControllerConfiguration *)v4->_configuration deferredPhotoProcessorEnabled])
    {
      uint64_t maxThreads = v4->_maxThreads;
      if ((unint64_t)maxThreads <= 1) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = (int)(maxThreads >> 1);
      }
      v4->_uint64_t maxThreads = v10;
    }
    v4->_heifForceEmbedThumb = 0;
    v4->_heifQualityOverride = NAN;
    v4->_heifUseTiling = 1;
    v4->_heifTileWidth = 0;
    v4->_heifTileHeight = 0;
    v4->_allowHEIFPrewarming = 1;
    v4->_addUnstyledImageToHEIF = 0;
    if (v4->_allowHEIFPrewarming) {
      v4->_prewarmQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coremedia.photoencoder.prewarm", 0);
    }
    v4->_adaptiveQualityValueForHEIF = (NSDictionary *)(id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[FigCaptureCameraParameters photoEncoderParameters](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "photoEncoderParameters"), "objectForKeyedSubscript:", @"HEIFParameters"), "objectForKeyedSubscript:", @"AdaptiveQualityValue");
    v4->_inputsByCaptureIdentifier = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v4->_inputsByCaptureIdentifierQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coremedia.photoencodercontroller.inputsbycaptureidentifierqueue", 0);
    [(BWStillImageProcessorControllerConfiguration *)v4->_configuration figThreadPriority];
    v4->_encodingQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    v4->_encodingGroup = (OS_dispatch_group *)dispatch_group_create();
  }
  return v4;
}

+ (BOOL)usesCustomProcessingFlow
{
  return 0;
}

- (int)prepareForCurrentConfigurationToBecomeLive
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(BWStillImageProcessorControllerConfiguration *)self->_configuration inferenceScheduler])
  {
    self->_inferenceEngine = [[BWInferenceEngine alloc] initWithScheduler:[(BWStillImageProcessorControllerConfiguration *)self->_configuration inferenceScheduler] priority:14];
    self->_inferenceGroup = (OS_dispatch_group *)dispatch_group_create();
    v3 = [[BWPhotosCurationInferenceConfiguration alloc] initWithInferenceType:803];
    [(BWPhotosCurationInferenceConfiguration *)v3 setSemanticDevelopmentVersion:[(BWPhotoEncoderControllerConfiguration *)self->_configuration semanticDevelopmentVersion]];
    [(BWVisionInferenceConfiguration *)v3 setShouldPreventRequestForSampleBuffer:&__block_literal_global_98];
    [(BWInferenceEngine *)self->_inferenceEngine addInferenceOfType:803 version:BWInferenceVersionMake(2u, 0, 0) & 0xFFFFFFFFFFFFLL configuration:v3];
    if ((int)FigCapturePlatformIdentifier() >= 7)
    {
      v4 = [(BWInferenceConfiguration *)[BWFaceprintInferenceConfiguration alloc] initWithInferenceType:161];
      [(BWFaceprintInferenceConfiguration *)v4 setMaximumNumberOfFaces:4];
      [(BWInferenceEngine *)self->_inferenceEngine addInferenceOfType:161 version:BWPhotoEncoderFacePrintInferenceVersion() & 0xFFFFFFFFFFFFLL configuration:v4];
    }
  }
  if (!self->_cmPhotoEncoderManager)
  {
    v5 = [[BWCMPhotoEncoderManager alloc] initWithDeferredPhotoProcessorEnabled:[(BWPhotoEncoderControllerConfiguration *)self->_configuration deferredPhotoProcessorEnabled]];
    self->_cmPhotoEncoderManager = v5;
    if (!v5)
    {
      int v18 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[BWPhotoEncoderControllerConfiguration attachedMediaConfigurationByAttachedMediaKey](self->_configuration, "attachedMediaConfigurationByAttachedMediaKey", v12, v14), "objectForKeyedSubscript:", 0x1EFA745E0), "mainImageDownscalingFactor");
  if (v7 != 0.0 && !self->_dngEncoderManager)
  {
    uint64_t v8 = objc_alloc_init(BWDNGEncoderManager);
    self->_dngEncoderManager = v8;
    if (!v8)
    {
      int v18 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  if (!self->_jpegPixelConverter) {
    self->_jpegPixelConverter = objc_alloc_init(FigCapturePixelConverter);
  }
  if (objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_resolvedVideoFormatsByAttachedMediaKey, "objectForKeyedSubscript:", @"PrimaryFormat", v13, v15), "pixelFormat") == 875704438)-[FigCapturePixelConverter updateOutputPixelFormat:dimensions:poolCapacity:colorSpaceProperties:alwaysUseHardwareForConversion:](self->_jpegPixelConverter, "updateOutputPixelFormat:dimensions:poolCapacity:colorSpaceProperties:alwaysUseHardwareForConversion:", 875704422, objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_resolvedVideoFormatsByAttachedMediaKey, "objectForKeyedSubscript:", @"PrimaryFormat"), "width") | ((unint64_t)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_resolvedVideoFormatsByAttachedMediaKey, {
                                                                      "objectForKeyedSubscript:",
  }
                                                                      @"PrimaryFormat"),
                                                                    "height") << 32),
      1,
      1,
      1);
  if (!self->_thumbnailPixelConverter) {
    self->_thumbnailPixelConverter = objc_alloc_init(FigCapturePixelConverter);
  }
  if (!self->_clientThumbnailPixelConverter) {
    self->_clientThumbnailPixelConverter = objc_alloc_init(FigCapturePixelConverter);
  }
  if (!self->_previewPixelConverter) {
    self->_previewPixelConverter = objc_alloc_init(FigCapturePixelConverter);
  }
  if (self->_inferenceEngine)
  {
    previewGenerationQueue = self->_previewGenerationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__BWPhotoEncoderController_prepareForCurrentConfigurationToBecomeLive__block_invoke_223;
    block[3] = &unk_1E5C24430;
    block[4] = self;
    dispatch_async(previewGenerationQueue, block);
  }
  int result = [(BWPhotoEncoderControllerConfiguration *)self->_configuration smartStyleReversibilityEnabled];
  if (result)
  {
    if ([(BWPhotoEncoderController *)self _postponeSelectResourceAllocations]) {
      return 0;
    }
    else {
      return [(BWPhotoEncoderController *)self _loadCreateAndSetupSmartStyleRenderingProcessor];
    }
  }
  return result;
}

BOOL __70__BWPhotoEncoderController_prepareForCurrentConfigurationToBecomeLive__block_invoke(uint64_t a1, uint64_t a2, const void *a3)
{
  getVN5kJNH3eYuyaLxNpZr5Z7ziClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v4 = (void *)CMGetAttachment(a3, @"BWStillImageCaptureSettings", 0);
  v5 = (void *)CMGetAttachment(a3, @"StillImageSettings", 0);
  objc_opt_class();
  BOOL v6 = (objc_opt_isKindOfClass() & 1) == 0 || [v5 semanticStyle] == 0;
  if ([v4 captureType] != 10
    && [v4 captureType] != 11
    && [v4 captureType] != 12)
  {
    BOOL v6 = 0;
  }
  return !v6;
}

uint64_t __70__BWPhotoEncoderController_prepareForCurrentConfigurationToBecomeLive__block_invoke_223(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 184) prewarmInferencesUsingLimitedMemory:0];
}

- (void)waitForAllAsynchronousProcessingToComplete
{
  [(BWPhotoEncoderController *)self _waitForPrewarmingQueueToComplete];
  [(BWPhotoEncoderController *)self _waitForPiecemealEncodingQueueToComplete];
  [(BWPhotoEncoderController *)self _waitForPreviewGenerationQueueToComplete];
}

- (void)dealloc
{
  [(BWPhotoEncoderController *)self _releaseResources];

  self->_configuration = 0;
  self->_adaptiveQualityValueForHEIF = 0;

  self->_resolvedVideoFormatsByAttachedMediaKey = 0;
  v3.receiver = self;
  v3.super_class = (Class)BWPhotoEncoderController;
  [(BWStillImageProcessorController *)&v3 dealloc];
}

- (unint64_t)type
{
  return 19;
}

- (void)reset
{
  [(BWPhotoEncoderController *)self _waitForPrewarmingQueueToComplete];
  [(BWPhotoEncoderController *)self _waitForPiecemealEncodingGroupToComplete];
}

- (id)inputForStillImageSettings:(id)a3 portType:(id)a4 portraitAdjustedImage:(BOOL)a5 optionalSampleBuffer:(opaqueCMSampleBuffer *)a6 forEarlyEncoding:(BOOL)a7
{
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3052000000;
  v31 = __Block_byref_object_copy__35;
  v32 = __Block_byref_object_dispose__35;
  uint64_t v33 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3052000000;
  v25 = __Block_byref_object_copy__35;
  v26 = __Block_byref_object_dispose__35;
  uint64_t v27 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  if (!a3) {
    goto LABEL_11;
  }
  if (!a7
    || !objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "bravoConstituentImageDeliveryDeviceTypes"), "count")&& !FigCapturePixelFormatIsDemosaicedRaw(objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "rawOutputFormat")))
  {
    inputsByCaptureIdentifierQueue = self->_inputsByCaptureIdentifierQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __124__BWPhotoEncoderController_inputForStillImageSettings_portType_portraitAdjustedImage_optionalSampleBuffer_forEarlyEncoding___block_invoke;
    block[3] = &unk_1E5C2B2C8;
    BOOL v17 = a5;
    block[4] = a3;
    void block[5] = self;
    block[6] = a4;
    block[7] = &v28;
    block[8] = &v18;
    block[9] = &v22;
    dispatch_sync(inputsByCaptureIdentifierQueue, block);
    if (a6) {
      [(id)v29[5] addSampleBuffer:a6];
    }
    if (*((unsigned char *)v19 + 24))
    {
      if ([(BWStillImageProcessorController *)self enqueueInputForProcessing:v29[5] delegate:objc_loadWeak((id *)&self->_primaryOwnerDelegate)]|| (uint64_t v13 = v23[5]) != 0&& [(BWStillImageProcessorController *)self enqueueInputForProcessing:v13 delegate:objc_loadWeak((id *)&self->_primaryOwnerDelegate)])
      {
LABEL_11:
        v29[5] = 0;
      }
    }
  }
  uint64_t v14 = (void *)v29[5];
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
  return v14;
}

uint64_t __124__BWPhotoEncoderController_inputForStillImageSettings_portType_portraitAdjustedImage_optionalSampleBuffer_forEarlyEncoding___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "requestedSettings"), "captureRequestIdentifier");
  if (*(unsigned char *)(a1 + 80)) {
    objc_super v3 = @"-PortraitAdjusted";
  }
  else {
    objc_super v3 = @"-Original";
  }
  uint64_t v4 = [v2 stringByAppendingString:v3];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(*(void *)(a1 + 40) + 272) objectForKeyedSubscript:v4];
  v5 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v5)
  {
    id v6 = v5;
    return (uint64_t)v6;
  }
  else
  {
    if (*(unsigned char *)(a1 + 80)) {
      char v8 = [*(id *)(*(void *)(a1 + 40) + 56) deferredPhotoProcessorEnabled];
    }
    else {
      char v8 = 0;
    }
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = -[BWPhotoEncoderControllerInput initWithStillImageSettings:portType:requiresPhotosAdjustment:]([BWPhotoEncoderControllerInput alloc], *(void *)(a1 + 32), *(void *)(a1 + 48), v8);
    uint64_t result = [*(id *)(*(void *)(a1 + 40) + 272) setObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forKeyedSubscript:v4];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    if (!*(unsigned char *)(a1 + 80))
    {
      uint64_t result = BWCIFilterArrayContainsPortraitFilters(objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "requestedSettings"), "processedImageFilters"));
      if (result)
      {
        uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "captureSettings"), "captureFlags");
        if ((result & 0x800) != 0)
        {
          uint64_t v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "requestedSettings"), "captureRequestIdentifier"), "stringByAppendingString:", @"-PortraitAdjusted");
          *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = -[BWPhotoEncoderControllerInput initWithStillImageSettings:portType:requiresPhotosAdjustment:]([BWPhotoEncoderControllerInput alloc], *(void *)(a1 + 32), *(void *)(a1 + 48), [*(id *)(*(void *)(a1 + 40) + 56) deferredPhotoProcessorEnabled]);
          uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
          v11 = *(void **)(*(void *)(a1 + 40) + 272);
          return [v11 setObject:v10 forKeyedSubscript:v9];
        }
      }
    }
  }
  return result;
}

- (NSString)currentInputsCaptureRequestIdentifier
{
  v2 = [(BWStillImageSettings *)[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] stillImageSettings] requestedSettings];
  return [(FigCaptureStillImageSettings *)v2 captureRequestIdentifier];
}

- (void)inputReceivedNewInputData:(id)a3
{
  if (-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input") == a3&& ([a3 receivedAllFramesInSingleContainer] & 1) == 0)
  {
    [(BWPhotoEncoderController *)self _processSbuf];
  }
  [(BWStillImageProcessorController *)self currentRequestChanged];
}

- (void)inputReceivedNewAuxMedia:(id)a3 auxSbuf:(opaqueCMSampleBuffer *)a4 attachedMediaKey:(id)a5 primaryImageMetadata:(id)a6 processingFlags:(unsigned int)a7
{
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = a4;
  if (a4) {
    CFRetain(a4);
  }
  encodingGroup = self->_encodingGroup;
  encodingQueue = self->_encodingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __115__BWPhotoEncoderController_inputReceivedNewAuxMedia_auxSbuf_attachedMediaKey_primaryImageMetadata_processingFlags___block_invoke;
  block[3] = &unk_1E5C262C8;
  block[4] = a5;
  void block[5] = a3;
  block[6] = self;
  block[7] = a6;
  block[8] = v14;
  dispatch_group_async(encodingGroup, encodingQueue, block);
  _Block_object_dispose(v14, 8);
}

void __115__BWPhotoEncoderController_inputReceivedNewAuxMedia_auxSbuf_attachedMediaKey_primaryImageMetadata_processingFlags___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [NSString stringWithFormat:@"Receiving aux media {%@}", *(void *)(a1 + 32)];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2 == objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "currentRequest"), "input"))
  {
    if (dword_1EB4C5590)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(*(id *)(a1 + 48), "_waitForPrewarmingQueueToComplete", v9, v10);
    uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "currentRequest"), "input"), "stillImageSettings");
    uint64_t v5 = BWPhotoEncoderResolveEncodingSchemeForRequestedSettings((void *)[v4 requestedSettings]);
    if ([*(id *)(a1 + 40) reservedPrimaryImageHandle] == -1) {
      [*(id *)(a1 + 48) _prewarmAndReserveMainImageHandleForEncodingScheme:v5 prewarmingMetadata:*(void *)(a1 + 56) stillImageSettings:v4];
    }
    id v6 = (const void *)[*(id *)(a1 + 48) _newAuxImageEncodingTriggerSbufForSettings:v4 metadata:*(void *)(a1 + 56)];
    if (v6)
    {
      float v7 = v6;
      BWSampleBufferSetAttachedMedia(v6, *(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
      objc_msgSend(*(id *)(a1 + 48), "_addOrPrewarmForAttachedMediaKey:encodingScheme:sampleBuffer:metadata:stillImageSettings:parentImageHandle:", *(void *)(a1 + 32), v5, v7, *(void *)(a1 + 56), v4, objc_msgSend(*(id *)(a1 + 40), "reservedPrimaryImageHandle"));
      CFRelease(v7);
    }
  }
  char v8 = *(const void **)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  if (v8)
  {
    CFRelease(v8);
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
}

- (void)cancelProcessing
{
  if ([(BWStillImageProcessorController *)self currentRequest]) {
    [(BWPhotoEncoderController *)self _flushCurrentRequest];
  }
  [(BWPhotoEncoderController *)self _flushInputsByCaptureIdentifier];
  v3.receiver = self;
  v3.super_class = (Class)BWPhotoEncoderController;
  [(BWStillImageProcessorController *)&v3 cancelProcessing];
}

- (id)requestForInput:(id)a3 delegate:(id)a4 errOut:(int *)a5
{
  id v6 = [(BWStillImageProcessorControllerRequest *)[BWPhotoEncoderControllerRequest alloc] initWithInput:a3 delegate:a4];
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
  objc_super v3 = [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] stillImageSettings];
  uint64_t v4 = [(BWStillImageSettings *)v3 requestedSettings];
  if (![(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] sbufToProcess]&& self->_allowHEIFPrewarming&& (BWPhotoEncoderResolveEncodingSchemeForRequestedSettings(v4) == 2|| BWPhotoEncoderResolveEncodingSchemeForCompressedPhotoWithLinDNG(v4) == 2))
  {
    [(BWPhotoEncoderController *)self _waitForPiecemealEncodingGroupToComplete];
    prewarmQueue = self->_prewarmQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__BWPhotoEncoderController_prepare__block_invoke;
    block[3] = &unk_1E5C26F78;
    int v8 = 2;
    block[4] = self;
    void block[5] = v3;
    dispatch_async(prewarmQueue, block);
  }
  return 0;
}

uint64_t __35__BWPhotoEncoderController_prepare__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[*(id *)(a1 + 32) _encoderManagerForEncodingScheme:*(unsigned int *)(a1 + 48)];
  if ([*(id *)(a1 + 32) _postponeSelectResourceAllocations]
    && [*(id *)(a1 + 32) _ensureSetupForPostponedResources])
  {
    uint64_t result = [v2 isContainerOpen];
    if (result)
    {
      return [v2 closeContainer];
    }
  }
  else
  {
    uint64_t v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "currentRequest"), "input"), "primaryImageMetadataForPrewarming");
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "currentRequest"), "input"), "reservedPrimaryImageHandle") == -1)objc_msgSend(*(id *)(a1 + 32), "_prewarmAndReserveMainImageHandleForEncodingScheme:prewarmingMetadata:stillImageSettings:", *(unsigned int *)(a1 + 48), v3, *(void *)(a1 + 40)); {
    uint64_t v4 = [*(id *)(a1 + 32) _newAuxImageEncodingTriggerSbufForSettings:*(void *)(a1 + 40) metadata:v3];
    }
    if (v4)
    {
      uint64_t v5 = (const void *)v4;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "currentRequest", 0), "input"), "stashedAttacheMediaSampleBuffersByAttachedMediaKey");
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v13;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v13 != v9) {
              objc_enumerationMutation(v6);
            }
            BWSampleBufferSetAttachedMedia(v5, *(void *)(*((void *)&v12 + 1) + 8 * i), objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "currentRequest"), "input"), "stashedAttacheMediaSampleBuffersByAttachedMediaKey"), "objectForKeyedSubscript:", *(void *)(*((void *)&v12 + 1) + 8 * i)));
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v8);
      }
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "currentRequest"), "input"), "stashedAttacheMediaSampleBuffersByAttachedMediaKey"), "removeAllObjects");
      objc_msgSend(*(id *)(a1 + 32), "_addOrPrewarmAuxImagesIfNeededForEncodingScheme:sampleBuffer:metadata:stillImageSettings:processingFlags:parentImageHandle:", *(unsigned int *)(a1 + 48), v5, v3, *(void *)(a1 + 40), objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "currentRequest"), "input"), "processingFlagsForPrewarming"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "currentRequest"), "input"), "reservedPrimaryImageHandle"));
      CFRelease(v5);
    }
    uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "currentRequest"), "input"), "reservedPrimaryImageHandle");
    if (result == -1) {
      return [v2 closeContainer];
    }
  }
  return result;
}

- (int)_processSbuf
{
  v279[16] = *MEMORY[0x1E4F143B8];
  CFTypeRef v260 = 0;
  uint64_t v259 = 0;
  uint64_t v258 = 0;
  uint64_t v257 = 0;
  uint64_t v256 = 0;
  uint64_t v252 = 0;
  v253 = &v252;
  uint64_t v254 = 0x2020000000;
  int v255 = 0;
  uint64_t v248 = 0;
  v249 = &v248;
  uint64_t v250 = 0x2020000000;
  uint64_t v251 = 0;
  uint64_t v244 = 0;
  v245 = &v244;
  uint64_t v246 = 0x2020000000;
  int v247 = 0;
  uint64_t v240 = 0;
  v241 = &v240;
  uint64_t v242 = 0x2020000000;
  uint64_t v243 = 0;
  uint64_t v239 = 0;
  uint64_t v235 = 0;
  v236 = &v235;
  uint64_t v237 = 0x2020000000;
  int v238 = 0;
  uint64_t v231 = 0;
  v232 = &v231;
  uint64_t v233 = 0x2020000000;
  uint64_t v234 = 0;
  v230[0] = 0;
  v230[1] = v230;
  v230[2] = 0x2020000000;
  v230[3] = 0;
  v229[0] = 0;
  v229[1] = v229;
  v229[2] = 0x2020000000;
  v229[3] = 0;
  target = (void *)[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] sbufToProcess];
  v203 = [(BWStillImageProcessorController *)self currentRequest];
  if (!target)
  {
    target = 0;
    goto LABEL_310;
  }
  uint64_t v5 = (void *)CMGetAttachment(target, @"StillSettings", 0);
  if (!v5)
  {
LABEL_310:
    BOOL IsPrimaryFrame = 0;
    BOOL v180 = 0;
    uint64_t v193 = 0;
    cfa = 0;
    int v12 = 0;
    v197 = 0;
    CVPixelBufferRef pixelBuffera = 0;
    uint64_t v177 = 0;
LABEL_324:
    uint64_t v45 = 4294954516;
    goto LABEL_225;
  }
  -[NSString isEqualToString:](-[FigCaptureStillImageSettings captureRequestIdentifier](-[BWStillImageSettings requestedSettings](-[BWStillImageProcessorControllerInput stillImageSettings](-[BWStillImageProcessorControllerRequest input](v203, "input"), "stillImageSettings"), "requestedSettings"), "captureRequestIdentifier"), "isEqualToString:", objc_msgSend((id)objc_msgSend(v5, "requestedSettings"), "captureRequestIdentifier"));
  if (dword_1EB4C5590)
  {
    unsigned int v228 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v3 = objc_msgSend(v5, "requestedSettings", v162, v163);
  v190 = (void *)[v5 captureSettings];
  uint64_t v177 = [v3 settingsID];
  unsigned int v202 = BWStillImageProcessingFlagsForSampleBuffer(target);
  BOOL IsPrimaryFrame = BWPhotoEncoderIsPrimaryFrame(v202);
  uint64_t v7 = BWIsDeferredPhotoProxyImage(v202);
  int v181 = BWPhotoEncoderDecompressStyledImageForDeltaMap((void *)[v3 smartStyle], v7);
  if ([(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v203 input] fatalErrorOccurred])
  {
    unsigned int v228 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    LODWORD(v45) = 0;
    goto LABEL_303;
  }
  kedouble y = (const __CFString *)*MEMORY[0x1E4F53070];
  id v196 = (id)objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0), "copy");
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  int v9 = [v3 outputWidth];
  LODWORD(v10) = [v3 outputHeight];
  if ((([(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v203 input] isStereoPhotoCapture] ^ 1 | IsPrimaryFrame) & 1) == 0)
  {
    int v9 = (int)[(BWPhotoEncoderControllerConfiguration *)self->_configuration stereoPhotoOutputDimensions];
    unint64_t v10 = (unint64_t)[(BWPhotoEncoderControllerConfiguration *)self->_configuration stereoPhotoOutputDimensions] >> 32;
  }
  v280.double width = (double)v9;
  v280.height = (double)(int)v10;
  CFDictionaryRef value = CGSizeCreateDictionaryRepresentation(v280);
  uint64_t v2 = BWPhotoEncoderResolveEncodingSchemeForRequestedSettings(v3);
  unsigned int v11 = BWPhotoEncoderResolveEncodingSchemeForCompressedPhotoWithLinDNG(v3);
  BOOL IsLinDNGEncodingScheme = BWPhotoEncoderIsLinDNGEncodingScheme(v2);
  uint64_t v226 = 0;
  int v12 = [v3 previewEnabled] & IsPrimaryFrame;
  HIDWORD(v193) = BWPhotoEncoderShouldGenerateClientThumbnail(v3, v2, &v226) && IsPrimaryFrame;
  if (((v12 | HIDWORD(v193)) & 1) == 0 && !v2)
  {
    BOOL v180 = 0;
    uint64_t v193 = 0;
    int v12 = 0;
LABEL_314:
    cfa = 0;
    v197 = 0;
    CVPixelBufferRef pixelBuffera = 0;
LABEL_224:
    uint64_t v45 = 0;
    goto LABEL_225;
  }
  uint64_t v225 = -1;
  uint64_t v224 = 0;
  uint64_t v223 = 0;
  int v222 = 0;
  uint64_t v221 = 0;
  uint64_t v220 = 0;
  LODWORD(v193) = BWPhotoEncoderThumbnailEnabled(v2, v3, &v222, &v221, &v220);
  ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)target);
  pixelBuffer = ImageBuffer;
  if (!ImageBuffer)
  {
    uint64_t v163 = v172;
    LODWORD(v162) = 0;
    FigDebugAssert3();
    BOOL v180 = 0;
LABEL_323:
    cfa = 0;
    v197 = 0;
    CVPixelBufferRef pixelBuffera = 0;
    goto LABEL_324;
  }
  unsigned int cf = CVPixelBufferGetWidth(ImageBuffer);
  unsigned int Height = CVPixelBufferGetHeight(pixelBuffer);
  unint64_t v14 = cf | ((unint64_t)Height << 32);
  [(BWPhotoEncoderController *)self _cropRectForRequestedSettings:v3 inputDimensions:v14 metadata:v196 processingFlags:v202];
  double x = v281.origin.x;
  double y = v281.origin.y;
  double width = v281.size.width;
  double v18 = v281.size.height;
  double v19 = *MEMORY[0x1E4F1DB28];
  double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v284.origin.double x = *(CGFloat *)MEMORY[0x1E4F1DB28];
  v284.origin.double y = v20;
  v284.size.double width = v21;
  v284.size.height = v22;
  BOOL v23 = CGRectEqualToRect(v281, v284);
  int v24 = (int)width;
  if (v23) {
    int v24 = cf;
  }
  unsigned int v185 = v24;
  if (v23) {
    uint64_t v25 = Height;
  }
  else {
    uint64_t v25 = (int)v18;
  }
  uint64_t v183 = v25;
  v282.origin.double x = x;
  v282.origin.double y = y;
  v282.size.double width = width;
  v282.size.height = v18;
  v285.origin.double x = v19;
  v285.origin.double y = v20;
  v285.size.double width = v21;
  v285.size.height = v22;
  if (CGRectEqualToRect(v282, v285))
  {
    CFTypeRef v26 = CVBufferCopyAttachment(pixelBuffer, (CFStringRef)*MEMORY[0x1E4F24A78], 0);
    if (v26)
    {
      uint64_t v27 = (void *)CFAutorelease(v26);
      uint64_t v28 = v27;
      if (v27)
      {
        v29 = (void *)[v27 objectForKeyedSubscript:*MEMORY[0x1E4F24A88]];
        uint64_t v30 = [v28 objectForKeyedSubscript:*MEMORY[0x1E4F24A68]];
        if (v29)
        {
          v31 = (void *)v30;
          if (v30)
          {
            unsigned int v185 = [v29 intValue];
            uint64_t v183 = [v31 intValue];
          }
        }
      }
    }
  }
  BOOL v32 = v221 == v185 && HIDWORD(v221) == v183;
  int v33 = v32;
  int v167 = v33;
  int v34 = v193;
  if (!v32) {
    int v34 = 0;
  }
  int v174 = v34;
  BOOL v36 = v2 == 1 || v11 == 1;
  BOOL v187 = v36;
  BOOL v38 = v2 == 2 || v11 == 2;
  BOOL v176 = v38;
  BOOL v182 = BWPhotoEncoderIsLinDNGEncodingScheme(v2);
  BOOL v179 = [(BWPhotoEncoderController *)self _smartStyleReversibilityDataNeededForSettings:v5 adjustedPhoto:(v202 >> 3) & 1 deferredPhotoProxy:v7];
  unsigned int v171 = v202 & 8;
  unsigned int v199 = v2;
  if (dword_1EB4C5590)
  {
    v191 = v3;
    int v39 = v12;
    unsigned int v228 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v40 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v41 = v228;
    if (os_log_type_enabled(v40, type)) {
      unsigned int v42 = v41;
    }
    else {
      unsigned int v42 = v41 & 0xFFFFFFFE;
    }
    if (v42)
    {
      BOOL v43 = [(BWPhotoEncoderControllerConfiguration *)self->_configuration smartStyleReversibilityEnabled];
      int v44 = objc_msgSend((id)objc_msgSend(v5, "requestedSettings"), "smartStyleReversibilitySupported");
      *(_DWORD *)v267 = 136316418;
      *(void *)&v267[4] = "-[BWPhotoEncoderController _processSbuf]";
      __int16 v268 = 1026;
      *(_DWORD *)v269 = v43;
      *(_WORD *)&v269[4] = 1026;
      *(_DWORD *)&v269[6] = v44;
      LOWORD(v270) = 1026;
      *(_DWORD *)((char *)&v270 + 2) = v171 >> 3;
      HIWORD(v270) = 1026;
      LODWORD(v271) = v7;
      WORD2(v271) = 1026;
      *(_DWORD *)((char *)&v271 + 6) = v179;
      LODWORD(v163) = 42;
      v162 = v267;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    uint64_t v2 = v199;
    int v12 = v39;
    uint64_t v3 = v191;
  }
  if (v2
    && [(BWPhotoEncoderControllerConfiguration *)self->_configuration inputColorInfo]
    && !objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_resolvedVideoFormatsByAttachedMediaKey, "objectForKeyedSubscript:", @"PrimaryFormat"), "colorSpaceProperties"))
  {
    CVBufferSetAttachments(pixelBuffer, (CFDictionaryRef)[(BWPhotoEncoderControllerConfiguration *)self->_configuration inputColorInfo], kCVAttachmentMode_ShouldPropagate);
  }
  if ((v187 | (v182 && IsLinDNGEncodingScheme) & v174) == 1
    && CVPixelBufferGetPixelFormatType(pixelBuffer) == 875704438)
  {
    v46 = CVBufferCopyAttachments(pixelBuffer, kCVAttachmentMode_ShouldPropagate);
    v47 = target;
    if (v46) {
      v46 = CFAutorelease(v46);
    }
    if (objc_msgSend((id)CFDictionaryGetValue((CFDictionaryRef)v46, (const void *)*MEMORY[0x1E4F24A90]), "isEqualToString:", *MEMORY[0x1E4F24AC0]))uint64_t v48 = 3; {
    else
    }
      uint64_t v48 = 1;
    if (-[FigCapturePixelConverter updateOutputPixelFormat:dimensions:poolCapacity:colorSpaceProperties:alwaysUseHardwareForConversion:](self->_jpegPixelConverter, "updateOutputPixelFormat:dimensions:poolCapacity:colorSpaceProperties:alwaysUseHardwareForConversion:", 875704422, v14, 1, v48, 1, v162, v163))
    {
      if (v12) {
        goto LABEL_65;
      }
    }
    else
    {
      -[FigCapturePixelConverter convertPixelBuffer:cropRect:allocateOutputFromBufferPool:outputPixelBuffer:](self->_jpegPixelConverter, "convertPixelBuffer:cropRect:allocateOutputFromBufferPool:outputPixelBuffer:", pixelBuffer, 1, &v260, v19, v20, v21, v22);
      v84 = pixelBuffer;
      if (v260) {
        v84 = (__CVBuffer *)v260;
      }
      pixelBuffer = v84;
      if (v12) {
        goto LABEL_65;
      }
    }
LABEL_76:
    BOOL v180 = 0;
    goto LABEL_77;
  }
  v47 = target;
  if (!v12) {
    goto LABEL_76;
  }
LABEL_65:
  BOOL v180 = 0;
  if (self->_inferenceEngine && (v202 & 0x201) == 0)
  {
    BOOL v50 = (v202 & 8) == 0 && v2 != 1;
    BOOL v180 = v50;
  }
  previewGenerationGroup = self->_previewGenerationGroup;
  previewGenerationQueue = self->_previewGenerationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__BWPhotoEncoderController__processSbuf__block_invoke;
  block[3] = &unk_1E5C2B2F0;
  block[4] = self;
  void block[5] = v3;
  *(double *)&block[12] = x;
  *(double *)&block[13] = y;
  *(double *)&block[14] = width;
  *(double *)&block[15] = v18;
  BOOL v219 = v180;
  block[8] = &v248;
  void block[9] = v230;
  block[7] = &v252;
  void block[6] = v196;
  unsigned int v217 = cf;
  unsigned int v218 = Height;
  block[11] = v47;
  void block[10] = v229;
  dispatch_group_async(previewGenerationGroup, previewGenerationQueue, block);
LABEL_77:
  if (HIDWORD(v193))
  {
    v53 = self->_previewGenerationGroup;
    v54 = self->_previewGenerationQueue;
    v215[0] = MEMORY[0x1E4F143A8];
    v215[1] = 3221225472;
    v215[2] = __40__BWPhotoEncoderController__processSbuf__block_invoke_2;
    v215[3] = &unk_1E5C24D40;
    v215[12] = v226;
    *(double *)&v215[8] = x;
    *(double *)&v215[9] = y;
    *(double *)&v215[10] = width;
    *(double *)&v215[11] = v18;
    v215[5] = &v235;
    v215[4] = self;
    v215[7] = pixelBuffer;
    v215[6] = &v231;
    dispatch_group_async(v53, v54, v215);
  }
  if (!v2) {
    goto LABEL_314;
  }
  if (![(BWPhotoEncoderController *)self _encoderManagerForEncodingScheme:v2])
  {
    uint64_t v163 = v172;
    LODWORD(v162) = 0;
    FigDebugAssert3();
    cfa = 0;
    v197 = 0;
    CVPixelBufferRef pixelBuffera = 0;
    uint64_t v45 = 4294954510;
    goto LABEL_225;
  }
  unsigned int v175 = BWPhotoEncoderCodecTypeForEncodingScheme(v2);
  unsigned int v178 = BWPhotoEncoderFileTypeForEncodingScheme(v2);
  if (BWPhotoEncoderIsLinDNGEncodingScheme(v2))
  {
    if ([v3 rawOutputFileType] != v178)
    {
LABEL_322:
      uint64_t v163 = v172;
      LODWORD(v162) = 0;
      FigDebugAssert3();
      goto LABEL_323;
    }
    if (v11)
    {
      unsigned int v175 = BWPhotoEncoderCodecTypeForEncodingScheme(v11);
      unsigned int v168 = BWPhotoEncoderFileTypeForEncodingScheme(v11);
      if ([v3 outputFormat] != v175
        || [v3 outputFileType] != v168)
      {
        goto LABEL_322;
      }
    }
    else
    {
      unsigned int v168 = v178;
    }
  }
  else
  {
    if ([v3 outputFormat] != v175
      || [v3 outputFileType] != v178)
    {
      goto LABEL_322;
    }
    unsigned int v168 = v178;
    unsigned int v178 = 0;
  }
  [(BWPhotoEncoderController *)self _waitForPrewarmingQueueToComplete];
  [(BWPhotoEncoderController *)self _waitForPiecemealEncodingGroupToComplete];
  if ([(BWPhotoEncoderController *)self _postponeSelectResourceAllocations])
  {
    uint64_t v45 = [(BWPhotoEncoderController *)self _ensureSetupForPostponedResources];
    if (v45)
    {
      cfa = 0;
      v197 = 0;
      CVPixelBufferRef pixelBuffera = 0;
      goto LABEL_225;
    }
  }
  if ([(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v203 input] isStereoPhotoCapture]&& [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v203 input] reservedPrimaryImageHandle] == -1)
  {
    [(BWPhotoEncoderController *)self _prewarmAndReserveMainImageHandleForEncodingScheme:v2 prewarmingMetadata:v196 stillImageSettings:v5];
  }
  if (IsPrimaryFrame) {
    uint64_t v225 = [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v203 input] reservedPrimaryImageHandle];
  }
  v192 = v5;
  v55 = target;
  if (dword_1EB4C5590)
  {
    unsigned int v166 = v7;
    v56 = v3;
    unsigned int v228 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v57 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    int v58 = v12;
    unsigned int v59 = v228;
    if (os_log_type_enabled(v57, type)) {
      unsigned int v60 = v59;
    }
    else {
      unsigned int v60 = v59 & 0xFFFFFFFE;
    }
    if (v60)
    {
      v165 = BWStringFromPixelBuffer(pixelBuffer);
      IOSurface = CVPixelBufferGetIOSurface(pixelBuffer);
      v62 = BWStringFromSurface(IOSurface);
      uint64_t v63 = BWPhotoEncoderStringFromEncodingScheme(v199);
      v283.origin.double x = x;
      v283.origin.double y = y;
      v283.size.double width = width;
      v283.size.height = v18;
      if (CGRectIsEmpty(v283)) {
        v64 = &stru_1EFA403E0;
      }
      else {
        v64 = (__CFString *)[NSString stringWithFormat:@" cropRect:%@", BWStringFromCGRect(x, y, width, v18)];
      }
      int v65 = v225;
      uint64_t v66 = [v56 settingsID];
      *(_DWORD *)v267 = 136318211;
      *(void *)&v267[4] = "-[BWPhotoEncoderController _processSbuf]";
      __int16 v268 = 2114;
      *(void *)v269 = v165;
      *(_WORD *)&v269[8] = 2112;
      uint64_t v270 = (uint64_t)v62;
      LOWORD(v271) = 2114;
      *(void *)((char *)&v271 + 2) = v63;
      WORD5(v271) = 1026;
      HIDWORD(v271) = v58;
      __int16 v272 = 1026;
      *(_DWORD *)v273 = v193;
      *(_WORD *)&v273[4] = 1026;
      *(_DWORD *)&v273[6] = HIDWORD(v193);
      LOWORD(v274) = 1026;
      *(_DWORD *)((char *)&v274 + 2) = v180;
      HIWORD(v274) = 2114;
      *(void *)v275 = v64;
      *(_WORD *)&v275[8] = 1026;
      *(_DWORD *)v276 = v185;
      *(_WORD *)&v276[4] = 1026;
      *(_DWORD *)&v276[6] = v183;
      __int16 v277 = 1025;
      *(_DWORD *)v278 = v65;
      *(_WORD *)&v278[4] = 2050;
      *(void *)&v278[6] = v66;
      LODWORD(v163) = 104;
      v162 = v267;
      _os_log_send_and_compose_impl();
      v55 = target;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    int v12 = v58;
    uint64_t v3 = v56;
    uint64_t v7 = v166;
  }
  if (((v181 | !v179) & 1) == 0)
  {
    int v67 = [(BWPhotoEncoderController *)self _updateSmartStyleDeltaMapForSampleBufferIfNeeded:v55 decompressedStyledPixelBuffer:0 stillImageSettings:v192 encodingScheme:v199 processingFlags:v202];
    if (v67)
    {
      uint64_t v163 = v172;
      LODWORD(v162) = v67;
      FigDebugAssert3();
    }
  }
  if (v187)
  {
    unsigned int v228 = 0;
    v279[0] = 0;
    *(void *)v267 = 0;
    int v68 = BWPhotoEncoderThumbnailEnabled(1, v3, &v228, v279, v267);
    if (v68)
    {
      v69 = self->_previewGenerationGroup;
      v70 = self->_previewGenerationQueue;
      v214[0] = MEMORY[0x1E4F143A8];
      v214[1] = 3221225472;
      v214[2] = __40__BWPhotoEncoderController__processSbuf__block_invoke_251;
      v214[3] = &unk_1E5C24D40;
      v214[12] = v279[0];
      *(double *)&v214[8] = x;
      *(double *)&v214[9] = y;
      *(double *)&v214[10] = width;
      *(double *)&v214[11] = v18;
      v214[5] = &v244;
      v214[4] = self;
      v214[7] = pixelBuffer;
      v214[6] = &v240;
      dispatch_group_async(v69, v70, v214);
    }
    LOBYTE(v164) = 0;
    uint64_t v71 = -[BWPhotoEncoderController _encodePhotoForEncodingScheme:pixelBuffer:imageDimensions:processingFlags:metadata:thumbnailOptions:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:cropRect:usePixelsOutsideCrop:usedContainerOptionsOut:usedEncodingOptionsOut:mainImageHandleInOut:](self, "_encodePhotoForEncodingScheme:pixelBuffer:imageDimensions:processingFlags:metadata:thumbnailOptions:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:cropRect:usePixelsOutsideCrop:usedContainerOptionsOut:usedEncodingOptionsOut:mainImageHandleInOut:", 1, pixelBuffer, v185 | (unint64_t)(v183 << 32), v202, v196, 0, x, y, width, v18, v3, v190, v164, &v224, &v223,
            &v225);
    uint64_t v45 = v71;
    if (v71) {
      int v72 = 0;
    }
    else {
      int v72 = v68;
    }
    if (v72 == 1)
    {
      dispatch_group_wait((dispatch_group_t)self->_previewGenerationGroup, 0xFFFFFFFFFFFFFFFFLL);
      if (!*((_DWORD *)v245 + 6))
      {
        LODWORD(v162) = v228;
        int v74 = -[BWPhotoEncoderController _addThumbnailForEncodingScheme:thumbnailPixelBuffer:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:processingFlags:cropRect:codecType:maxPixelSize:parentImageHandle:](self, "_addThumbnailForEncodingScheme:thumbnailPixelBuffer:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:processingFlags:cropRect:codecType:maxPixelSize:parentImageHandle:", 1, v241[3], v196, v3, v190, v202, 0.0, 0.0, (double)SLODWORD(v279[0]), (double)SHIDWORD(v279[0]), v162, *(void *)v267, v225);
        *((_DWORD *)v245 + 6) = v74;
      }
    }
    else if (v71)
    {
      goto LABEL_128;
    }
  }
  else
  {
    if (!v176) {
      goto LABEL_170;
    }
    unsigned int v228 = 0;
    v279[0] = 0;
    *(void *)v267 = 0;
    if (BWPhotoEncoderThumbnailEnabled(2, v3, &v228, v279, v267)) {
      id v73 = -[BWPhotoEncoderController _thumbnailOptionsForImageWithMetadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:processingFlags:cropRect:codecType:maxPixelSize:](self, "_thumbnailOptionsForImageWithMetadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:processingFlags:cropRect:codecType:maxPixelSize:", v196, v3, v190, v202, v228, *(void *)v267, x, y, width, v18);
    }
    else {
      id v73 = 0;
    }
    LOBYTE(v164) = 0;
    uint64_t v45 = -[BWPhotoEncoderController _encodePhotoForEncodingScheme:pixelBuffer:imageDimensions:processingFlags:metadata:thumbnailOptions:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:cropRect:usePixelsOutsideCrop:usedContainerOptionsOut:usedEncodingOptionsOut:mainImageHandleInOut:](self, "_encodePhotoForEncodingScheme:pixelBuffer:imageDimensions:processingFlags:metadata:thumbnailOptions:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:cropRect:usePixelsOutsideCrop:usedContainerOptionsOut:usedEncodingOptionsOut:mainImageHandleInOut:", 2, pixelBuffer, v185 | (unint64_t)(v183 << 32), v202, v196, v73, x, y, width, v18, v3, v190, v164, &v224, &v223,
            &v225);
    if (v45) {
      goto LABEL_128;
    }
  }
  if (v176) {
    uint64_t v75 = 2;
  }
  else {
    uint64_t v75 = 1;
  }
  [(BWPhotoEncoderController *)self _addOrPrewarmAuxImagesIfNeededForEncodingScheme:v75 sampleBuffer:v55 metadata:v196 stillImageSettings:v192 processingFlags:v202 parentImageHandle:v225];
  if (BWPhotoEncoderSupportsAddingAuxiliaryMetadataSeparately(v75)) {
    [(BWPhotoEncoderController *)self _addGainMapMetadataForEncodingScheme:v75 sampleBuffer:v55 parentImageHandle:v225];
  }
  [(BWPhotoEncoderController *)self _updateStillImageProcessingFlagsWithDepthMetadataForSbuf:v55 stillImageSettings:v192];
  v76 = (void *)CMGetAttachment(v55, key, 0);
  if (v179)
  {
    if (self->_addUnstyledImageToHEIF
      && (LOBYTE(v163) = 0,
          v77 = -[BWPhotoEncoderController _addUnstyledImageForEncodingScheme:sbuf:imageDimensions:processingFlags:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:cropRect:usePixelsOutsideCrop:](self, "_addUnstyledImageForEncodingScheme:sbuf:imageDimensions:processingFlags:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:cropRect:usePixelsOutsideCrop:", v75, v55, v185 | (unint64_t)(v183 << 32), v202, v196, v3, x, y, width, v18, v190, v163), uint64_t v45 = v77, v77)|| ([v76 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F53510]], v77 = -[BWPhotoEncoderController _addSmartStyleMetadataForEncodingScheme:sampleBuffer:requestedStillImageCaptureSettings:](
                  self,
                  "_addSmartStyleMetadataForEncodingScheme:sampleBuffer:requestedStillImageCaptureSettings:",
                  v75,
                  v55,
                  v3),
          uint64_t v45 = v77,
          v77))
    {
      uint64_t v163 = v172;
      LODWORD(v162) = v77;
      FigDebugAssert3();
      cfa = 0;
      v197 = 0;
      CVPixelBufferRef pixelBuffera = 0;
      uint64_t v2 = v199;
      goto LABEL_225;
    }
  }
  else if ([(BWPhotoEncoderController *)self _finalImageExpectingSmartStyleReversibilityDataForDeferredPhotoProxy:v7 settings:v192 adjustedPhoto:v171 != 0])
  {
    [v76 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F534D0]];
  }
  BWPhotoEncoderApplyCropRectOnSampleBufferMetadata(v55, x, y, width, v18);
  FigCaptureMetadataUtilitiesNormalizeCropRect(x, y, width, v18);
  BWUpdateLandmarksForStillImageCrop(v55, 801, v78, v79, v80, v81);
  CMSetAttachment(v55, @"EncodedImageSurfaceCGSize", value, 1u);
  if ([v3 payloadType] != 1
    || (uint64_t v82 = [v190 captureType],
        uint64_t v45 = [(BWPhotoEncoderController *)self _addMetadataAttachmentsForEncodingScheme:v75 sampleBuffer:v55 requestedSettings:v3 captureType:v82 parentImageHandle:v225], !v45))
  {
    if ([(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v203 input] isStereoPhotoCapture]&& [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v203 input] receivedAllFramesInSingleContainer])
    {
      v83 = [(BWStillImageProcessorControllerRequest *)v203 input];
      if (v83)
      {
        [(BWStillImageProcessorControllerInput *)v83 stereoPhotoImageHandles];
        if (v212 == -1) {
          goto LABEL_167;
        }
      }
      else
      {
        uint64_t v212 = 0;
        uint64_t v211 = 0;
        uint64_t v213 = 0;
      }
      v85 = [(BWStillImageProcessorControllerRequest *)v203 input];
      if (v85)
      {
        [(BWStillImageProcessorControllerInput *)v85 stereoPhotoImageHandles];
        if (v210 == -1) {
          goto LABEL_167;
        }
      }
      else
      {
        v209[4] = 0;
        v209[3] = 0;
        uint64_t v210 = 0;
      }
      v86 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      [v86 setObject:&unk_1EFB011C0 forKeyedSubscript:*MEMORY[0x1E4F56328]];
      v87 = (void *)[MEMORY[0x1E4F1CA48] array];
      char v88 = objc_msgSend((id)objc_msgSend(v196, "objectForKeyedSubscript:", 0x1EFA73660), "intValue");
      if ((v88 & 4) != 0)
      {
        uint64_t v265 = *MEMORY[0x1E4F34920];
        uint64_t v266 = *MEMORY[0x1E4F34918];
        objc_msgSend(v87, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v266, &v265, 1));
      }
      if ((v88 & 2) != 0)
      {
        uint64_t v263 = *MEMORY[0x1E4F34920];
        uint64_t v264 = *MEMORY[0x1E4F34910];
        objc_msgSend(v87, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v264, &v263, 1));
      }
      [v86 setObject:v87 forKeyedSubscript:*MEMORY[0x1E4F56330]];
      uint64_t v89 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[BWStillImageProcessorControllerInput monoImageLocationType](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "monoImageLocationType"));
      [v86 setObject:v89 forKeyedSubscript:*MEMORY[0x1E4F34958]];
      v90 = [(BWStillImageProcessorControllerRequest *)v203 input];
      if (v90) {
        [(BWStillImageProcessorControllerInput *)v90 stereoPhotoImageHandles];
      }
      else {
        memset(v209, 0, 24);
      }
      [(BWPhotoEncoderController *)self _tagStereoPairGroupForEncodingScheme:v75 stereoPhotoImageHandles:v209 groupMetadata:v86];
    }
LABEL_167:
    if ([(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v203 input] receivedAllFramesInSingleContainer])
    {
      cfa = [(BWPhotoEncoderController *)self _closeContainerAndCopySurfaceForEncodingScheme:v75];
      if (cfa)
      {
        [(BWPhotoEncoderController *)self _getAssetsSizeForEncodingScheme:v75 containerSizeOut:&v259 thumbnailSizeOut:0 auxiliaryImagesSizeOut:0];
        goto LABEL_171;
      }
    }
LABEL_170:
    cfa = 0;
LABEL_171:
    if (!v182)
    {
      v95 = 0;
      CFTypeRef v189 = 0;
      v96 = 0;
      BOOL v186 = 0;
      unsigned int v184 = 0;
      goto LABEL_200;
    }
    AttachedMedia = (void *)BWSampleBufferGetAttachedMedia(v55, 0x1EFA745E0);
    if (!AttachedMedia)
    {
      v197 = 0;
      CVPixelBufferRef pixelBuffera = 0;
      uint64_t v45 = 4294954516;
      goto LABEL_130;
    }
    if ((v193 ^ 1 | v167) == 1)
    {
      if (v174)
      {
        LOBYTE(v164) = 0;
        int v92 = -[BWPhotoEncoderController _encodePhotoForEncodingScheme:pixelBuffer:imageDimensions:processingFlags:metadata:thumbnailOptions:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:cropRect:usePixelsOutsideCrop:usedContainerOptionsOut:usedEncodingOptionsOut:mainImageHandleInOut:](self, "_encodePhotoForEncodingScheme:pixelBuffer:imageDimensions:processingFlags:metadata:thumbnailOptions:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:cropRect:usePixelsOutsideCrop:usedContainerOptionsOut:usedEncodingOptionsOut:mainImageHandleInOut:", IsLinDNGEncodingScheme, pixelBuffer, v221, v202, v196, 0, x, y, width, v18, v3, v190, v164, 0, 0,
                &v225);
        *((_DWORD *)v245 + 6) = v92;
        if (v92
          || (BWPhotoEncoderApplyCropRectOnSampleBufferMetadata(v55, x, y, width, v18),
              CMSetAttachment(v55, @"EncodedImageSurfaceCGSize", value, 1u),
              uint64_t v93 = [v190 captureType],
              int v94 = [(BWPhotoEncoderController *)self _addMetadataAttachmentsForEncodingScheme:IsLinDNGEncodingScheme sampleBuffer:v55 requestedSettings:v3 captureType:v93 parentImageHandle:v225], (*((_DWORD *)v245 + 6) = v94) != 0))
        {
          v95 = 0;
        }
        else
        {
          v95 = [(BWPhotoEncoderController *)self _closeContainerAndCopySurfaceForEncodingScheme:IsLinDNGEncodingScheme];
          if (v95) {
            [(BWPhotoEncoderController *)self _getAssetsSizeForEncodingScheme:IsLinDNGEncodingScheme containerSizeOut:&v239 thumbnailSizeOut:0 auxiliaryImagesSizeOut:0];
          }
        }
        if (*((_DWORD *)v245 + 6)) {
          [(BWPhotoEncoderController *)self _closeContainerForEncodingScheme:IsLinDNGEncodingScheme];
        }
        goto LABEL_184;
      }
    }
    else
    {
      v97 = self->_previewGenerationGroup;
      v98 = self->_previewGenerationQueue;
      v208[0] = MEMORY[0x1E4F143A8];
      v208[1] = 3221225472;
      v208[2] = __40__BWPhotoEncoderController__processSbuf__block_invoke_257;
      v208[3] = &unk_1E5C24D40;
      v208[12] = v221;
      *(double *)&v208[8] = x;
      *(double *)&v208[9] = y;
      *(double *)&v208[10] = width;
      *(double *)&v208[11] = v18;
      v208[4] = self;
      v208[5] = &v244;
      v208[6] = &v240;
      v208[7] = pixelBuffer;
      dispatch_group_async(v97, v98, v208);
      if (v174)
      {
LABEL_183:
        v95 = 0;
LABEL_184:
        -[BWPhotoEncoderController _propagateSampleBufferGainMapMetadata:toSampleBufferMetadata:](self, "_propagateSampleBufferGainMapMetadata:toSampleBufferMetadata:", v55, AttachedMedia, v162, v163);
        CFTypeRef v99 = CMGetAttachment(AttachedMedia, key, 0);
        [(BWPhotoEncoderController *)self _cropRectForRequestedSettings:v3 inputDimensions:BWPixelBufferDimensionsFromSampleBuffer((opaqueCMSampleBuffer *)AttachedMedia) metadata:v99 processingFlags:v202];
        double v101 = v100;
        double v103 = v102;
        double v105 = v104;
        double v107 = v106;
        BWPhotoEncoderApplyCropRectOnSampleBufferMetadata(AttachedMedia, v100, v102, v104, v106);
        CMSetAttachment(AttachedMedia, @"EncodedImageSurfaceCGSize", value, 1u);
        CFTypeRef v189 = CMGetAttachment(AttachedMedia, @"RawDNGDictionary", 0);
        if (!v189)
        {
          v197 = v95;
          CVPixelBufferRef pixelBuffera = 0;
          uint64_t v45 = 0;
          goto LABEL_130;
        }
        BOOL v186 = BWSampleBufferContainsDepthAttachedMedia(v55);
        unsigned int v184 = BWSampleBufferContainsSemanticSegmentationMatteAttachedMediaSupportedByDemosaicedRaw(v55);
        HIDWORD(v162) = v202;
        LOBYTE(v162) = v184;
        uint64_t v45 = -[BWPhotoEncoderController _encodeDNGForEncodingScheme:rawSampleBuffer:dngDictionary:requestedSettings:captureType:cropRect:dngContainsDepthData:dngContainsSemanticSegmentationMattes:processingFlags:](self, "_encodeDNGForEncodingScheme:rawSampleBuffer:dngDictionary:requestedSettings:captureType:cropRect:dngContainsDepthData:dngContainsSemanticSegmentationMattes:processingFlags:", v199, AttachedMedia, v189, v3, [v190 captureType], v186, v101, v103, v105, v107, v162);
        if (!v45)
        {
          objc_msgSend((id)-[BWStillImageProcessorControllerInput encodedAttachedMediaKeys](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "encodedAttachedMediaKeys"), "removeAllObjects");
          [(BWPhotoEncoderController *)self _addOrPrewarmAuxImagesIfNeededForEncodingScheme:v199 sampleBuffer:v55 metadata:v196 stillImageSettings:v192 processingFlags:v202 parentImageHandle:v225];
          if (BWPhotoEncoderSupportsAddingAuxiliaryMetadataSeparately(v199)) {
            [(BWPhotoEncoderController *)self _addGainMapMetadataForEncodingScheme:v199 sampleBuffer:v55 parentImageHandle:v225];
          }
          [(BWPhotoEncoderController *)self _updateStillImageProcessingFlagsWithDepthMetadataForSbuf:v55 stillImageSettings:v192];
          uint64_t v108 = v199;
          if (!v193) {
            goto LABEL_198;
          }
          if (v167)
          {
            if (!*((_DWORD *)v245 + 6))
            {
              int v109 = [(BWPhotoEncoderController *)self _addCompressedThumbnailForEncodingScheme:v199 thumbnailSurface:v95 thumbnailSurfaceSize:v239];
              *((_DWORD *)v245 + 6) = v109;
              uint64_t v108 = v199;
              if (!v109)
              {
LABEL_198:
                v96 = [(BWPhotoEncoderController *)self _closeContainerAndCopySurfaceForEncodingScheme:v108];
                if (v96) {
                  [(BWPhotoEncoderController *)self _getAssetsSizeForEncodingScheme:v199 containerSizeOut:&v258 thumbnailSizeOut:&v257 auxiliaryImagesSizeOut:&v256];
                }
LABEL_200:
                CVPixelBufferRef pixelBuffera = v96;
                v197 = v95;
                uint64_t v2 = v199;
                target = (void *)[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v203 input] primarySampleBuffer];
                if (!v176 && !v187) {
                  goto LABEL_220;
                }
                if (!cfa)
                {
                  cfa = 0;
LABEL_219:
                  CMSetAttachment(target, @"EncodedImageCodecType", (CFTypeRef)objc_msgSend(NSNumber, "numberWithUnsignedInt:", v175, v162, v163), 1u);
                  CMSetAttachment(target, @"EncodedImageFileType", (CFTypeRef)[NSNumber numberWithInt:v168], 1u);
LABEL_220:
                  if (v182)
                  {
                    if (pixelBuffera)
                    {
                      CMSetAttachment(target, @"RawImageSurface", pixelBuffera, 1u);
                      v261[0] = 0x1EFA74140;
                      v262[0] = [NSNumber numberWithUnsignedLong:v258];
                      v261[1] = 0x1EFA74160;
                      v262[1] = [NSNumber numberWithUnsignedLong:v257];
                      v261[2] = 0x1EFA74180;
                      v262[2] = [NSNumber numberWithUnsignedLong:v256];
                      CMSetAttachment(target, @"RawImageAssetSizes", (CFTypeRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v262 forKeys:v261 count:3], 1u);
                    }
                    CMSetAttachment(target, @"RawImageFileType", (CFTypeRef)[NSNumber numberWithInt:v178], 1u);
                    CMSetAttachment(target, @"RawDNGDictionary", v189, 1u);
                    CMSetAttachment(target, @"RawImageBitDepth", (CFTypeRef)[NSNumber numberWithUnsignedLong:self->_dngBitDepth], 1u);
                    CMSetAttachment(target, @"RawImageContainsDepthData", (CFTypeRef)[NSNumber numberWithBool:v186], 1u);
                    CMSetAttachment(target, @"RawImageContainsSemanticSegmentationMattes", (CFTypeRef)[NSNumber numberWithBool:v184], 1u);
                  }
                  goto LABEL_224;
                }
                if ((v181 & v179) == 1)
                {
                  if (v176) {
                    uint64_t v112 = 2;
                  }
                  else {
                    uint64_t v112 = 1;
                  }
                  v113 = target;
                  int v114 = [(BWPhotoEncoderController *)self _computeAndAddSmartStyleDeltaMapToClosedSurfaceContainer:cfa sampleBuffer:target encodingScheme:v112 stillImageSettings:v192 processingFlags:v202];
                  if (v114)
                  {
                    unsigned int v228 = 0;
                    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                    v115 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                    unsigned int v116 = v228;
                    if (os_log_type_enabled(v115, type)) {
                      unsigned int v117 = v116;
                    }
                    else {
                      unsigned int v117 = v116 & 0xFFFFFFFE;
                    }
                    if (v117)
                    {
                      *(_DWORD *)v267 = 136315394;
                      *(void *)&v267[4] = "-[BWPhotoEncoderController _processSbuf]";
                      __int16 v268 = 1026;
                      *(_DWORD *)v269 = v114;
                      LODWORD(v163) = 18;
                      v162 = v267;
                      _os_log_send_and_compose_impl();
                    }
                    fig_log_call_emit_and_clean_up_after_send_and_compose();
                  }
                  else
                  {
                    CFRelease(cfa);
                    cfa = [(BWPhotoEncoderController *)self _closeContainerAndCopySurfaceForEncodingScheme:v112];
                    if (!cfa)
                    {
                      cfa = 0;
                      CMSetAttachment(target, @"EncodedImageSurface", 0, 1u);
                      goto LABEL_218;
                    }
                    [(BWPhotoEncoderController *)self _getAssetsSizeForEncodingScheme:v112 containerSizeOut:&v259 thumbnailSizeOut:0 auxiliaryImagesSizeOut:0];
                  }
                }
                else
                {
                  v113 = target;
                }
                CMSetAttachment(v113, @"EncodedImageSurface", cfa, 1u);
LABEL_218:
                CMSetAttachment(target, @"EncodedImageSurfaceSize", (CFTypeRef)[NSNumber numberWithUnsignedLong:v259], 1u);
                goto LABEL_219;
              }
            }
          }
          else
          {
            dispatch_group_wait((dispatch_group_t)self->_previewGenerationGroup, 0xFFFFFFFFFFFFFFFFLL);
            if (!*((_DWORD *)v245 + 6))
            {
              double v18 = (double)SHIDWORD(v221);
              double width = (double)(int)v221;
              double x = 0.0;
              double y = 0.0;
LABEL_197:
              LODWORD(v162) = v222;
              int v111 = -[BWPhotoEncoderController _addThumbnailForEncodingScheme:thumbnailPixelBuffer:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:processingFlags:cropRect:codecType:maxPixelSize:parentImageHandle:](self, "_addThumbnailForEncodingScheme:thumbnailPixelBuffer:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:processingFlags:cropRect:codecType:maxPixelSize:parentImageHandle:", v108, v241[3], v196, v3, v190, v202, x, y, width, v18, v162, v220, v225);
              *((_DWORD *)v245 + 6) = v111;
              goto LABEL_198;
            }
          }
          v110 = (const void *)v241[3];
          v241[3] = (uint64_t)pixelBuffer;
          CFRetain(pixelBuffer);
          if (v110) {
            CFRelease(v110);
          }
          goto LABEL_197;
        }
        v197 = v95;
        goto LABEL_129;
      }
    }
    BWPhotoEncoderApplyCropRectOnSampleBufferMetadata(v55, x, y, width, v18);
    goto LABEL_183;
  }
LABEL_128:
  cfa = 0;
  v197 = 0;
LABEL_129:
  CVPixelBufferRef pixelBuffera = 0;
LABEL_130:
  uint64_t v2 = v199;
LABEL_225:
  dispatch_group_wait((dispatch_group_t)self->_previewGenerationGroup, 0xFFFFFFFFFFFFFFFFLL);
  if (!*((_DWORD *)v253 + 6) && v249[3])
  {
    if ([v3 payloadType] == 1)
    {
      IOSurfaceRef v124 = CVPixelBufferGetIOSurface((CVPixelBufferRef)v249[3]);
      if (v124) {
        CMSetAttachment(target, @"PreviewSurface", v124, 1u);
      }
    }
    else if (![v3 payloadType])
    {
      CMSetAttachment(target, @"PreviewPixelBuffer", (CFTypeRef)v249[3], 1u);
    }
  }
  v118 = target;
  if (HIDWORD(v193))
  {
    if (!*((_DWORD *)v236 + 6))
    {
      v144 = (__CVBuffer *)v232[3];
      if (v144)
      {
        IOSurfaceRef v145 = CVPixelBufferGetIOSurface(v144);
        if (v145) {
          CMSetAttachment(target, @"ThumbnailSurface", v145, 1u);
        }
      }
    }
  }
  if (v180)
  {
    if ([(BWPhotoEncoderControllerConfiguration *)self->_configuration alwaysAwaitInference]) {
      [(BWPhotoEncoderController *)self _waitUntilTimeoutForInferenceGroupToCompleteAndReturnSuccess];
    }
    unsigned __int8 v119 = atomic_load((unsigned __int8 *)&self->_opportunisticInferenceCompleted);
    if (v119)
    {
      v125 = self->_previewGenerationQueue;
      v207[0] = MEMORY[0x1E4F143A8];
      v207[1] = 3221225472;
      v207[2] = __40__BWPhotoEncoderController__processSbuf__block_invoke_258;
      v207[3] = &unk_1E5C26FC0;
      v207[4] = self;
      v207[5] = v230;
      v118 = target;
      v207[6] = target;
      dispatch_sync(v125, v207);
    }
    else
    {
      v118 = target;
      unint64_t UpTimeNanoseconds = FigGetUpTimeNanoseconds();
      int v121 = objc_msgSend((id)BWInferenceGetAttachedInference(target, 802, 0x1EFA6A0A0), "count");
      if (*MEMORY[0x1E4F1EBA8] == 1) {
        kdebug_trace();
      }
      uint64_t v122 = objc_msgSend((id)BWInferenceGetAttachedInference(target, 802, 0x1EFA6A0C0), "count");
      if (v121 > 0 || v122) {
        BWPhotoEncoderApplyFinalCropToFaceObservationsForSampleBuffer(target);
      }
      v123 = self->_previewGenerationQueue;
      v205[0] = MEMORY[0x1E4F143A8];
      v205[1] = 3221225472;
      v205[2] = __40__BWPhotoEncoderController__processSbuf__block_invoke_2_259;
      v205[3] = &unk_1E5C2B318;
      int v206 = v121;
      v205[4] = self;
      v205[5] = v229;
      v205[6] = v230;
      v205[7] = UpTimeNanoseconds / 0xF4240;
      dispatch_async(v123, v205);
    }
  }
  v126 = (const void *)BWSampleBufferGetAttachedMedia(v118, 0x1EFA4EB60);
  if (v126)
  {
    CFStringRef v127 = (const __CFString *)*MEMORY[0x1E4F53070];
    CFTypeRef v128 = CMGetAttachment(v126, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    if (v128)
    {
      v129 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", CMGetAttachment(target, v127, 0));
      [v129 setObject:v128 forKeyedSubscript:*MEMORY[0x1E4F53310]];
      CMSetAttachment(target, v127, v129, 1u);
    }
  }
  if (cfa)
  {
    v130 = NSString;
    v131 = BWStringFromSurface(cfa);
    v132 = (__CFString *)[v130 stringWithFormat:@"[enabled:1 %@ size:%lu]", v131, v259];
  }
  else
  {
    v132 = @"[enabled:0]";
  }
  if (pixelBuffera)
  {
    v133 = NSString;
    v134 = BWStringFromSurface(pixelBuffera);
    v135 = (__CFString *)[v133 stringWithFormat:@"linDNG:[enabled:1 %@ size:%lu]", v134, v258];
    if (v12)
    {
LABEL_251:
      v136 = NSString;
      v137 = BWStringFromPixelBufferSurface((__CVBuffer *)v249[3]);
      v138 = (__CFString *)[v136 stringWithFormat:@"[enabled:1 %@ err:%d]", v137, *((unsigned int *)v253 + 6)];
      goto LABEL_254;
    }
  }
  else
  {
    v135 = @"linDNG:[enabled:0]";
    if (v12) {
      goto LABEL_251;
    }
  }
  v138 = @"[enabled:0]";
LABEL_254:
  if (v193)
  {
    v139 = (__CVBuffer *)v241[3];
    if (v139)
    {
      v140 = NSString;
      v141 = BWStringFromPixelBufferSurface(v139);
      v142 = (__CFString *)[v140 stringWithFormat:@"[enabled:1 %@ err:%d]", v141, *((unsigned int *)v245 + 6)];
    }
    else
    {
      v142 = @"[enabled:0]";
    }
    if (v197)
    {
      v146 = NSString;
      v147 = BWStringFromSurface(v197);
      v143 = (__CFString *)[v146 stringWithFormat:@"[enabled:1 %@ size:%lu err:%d]", v147, v239, *((unsigned int *)v245 + 6)];
    }
    else
    {
      v143 = @"[enabled:0]";
    }
  }
  else
  {
    v142 = @"[enabled:0]";
    v143 = @"[enabled:0]";
  }
  if (HIDWORD(v193))
  {
    v148 = NSString;
    v149 = BWStringFromPixelBufferSurface((__CVBuffer *)v232[3]);
    v150 = (__CFString *)[v148 stringWithFormat:@"[enabled:1 %@ err:%d]", v149, *((unsigned int *)v236 + 6)];
  }
  else
  {
    v150 = @"[enabled:0]";
  }
  if (dword_1EB4C5590)
  {
    unsigned int v228 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v151 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v152 = v228;
    if (os_log_type_enabled(v151, type)) {
      unsigned int v153 = v152;
    }
    else {
      unsigned int v153 = v152 & 0xFFFFFFFE;
    }
    if (v153)
    {
      v154 = "failed";
      *(_DWORD *)v267 = 136317443;
      *(void *)&v267[4] = "-[BWPhotoEncoderController _processSbuf]";
      __int16 v268 = 2082;
      if (!v45) {
        v154 = "succeeded";
      }
      *(void *)v269 = v154;
      *(_WORD *)&v269[8] = 2050;
      uint64_t v270 = v177;
      LOWORD(v271) = 1026;
      *(_DWORD *)((char *)&v271 + 2) = v45;
      WORD3(v271) = 2113;
      *((void *)&v271 + 1) = v132;
      __int16 v272 = 2113;
      *(void *)v273 = v135;
      *(_WORD *)&v273[8] = 2113;
      v274 = v138;
      *(_WORD *)v275 = 2113;
      *(void *)&v275[2] = v142;
      *(_WORD *)v276 = 2113;
      *(void *)&v276[2] = v143;
      __int16 v277 = 2113;
      *(void *)v278 = v150;
      LODWORD(v163) = 98;
      v162 = v267;
      _os_log_send_and_compose_impl();
    }
    uint64_t v2 = v2;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v260) {
    CFRelease(v260);
  }
  if (cfa) {
    CFRelease(cfa);
  }
  if (pixelBuffera) {
    CFRelease(pixelBuffera);
  }
  v155 = (const void *)v249[3];
  if (v155) {
    CFRelease(v155);
  }
  v156 = (const void *)v241[3];
  if (v156) {
    CFRelease(v156);
  }
  if (v197) {
    CFRelease(v197);
  }
  v157 = (const void *)v232[3];
  if (v157) {
    CFRelease(v157);
  }
  int v158 = [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v203 input] receivedAllFramesInSingleContainer];
  if (v45) {
    BOOL v159 = IsPrimaryFrame;
  }
  else {
    BOOL v159 = 0;
  }
  if (v159)
  {
    [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v203 input] setFatalErrorOccurred:1];
  }
  else if (!v158)
  {
    int v160 = 0;
    goto LABEL_299;
  }
  [(BWPhotoEncoderController *)self _closeContainerForEncodingScheme:v2];
  -[BWStillImageProcessorControllerDelegate processorController:didFinishProcessingSampleBuffer:type:processorInput:err:](-[BWStillImageProcessorControllerRequest delegate](v203, "delegate"), "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", self, target, objc_msgSend((id)CMGetAttachment(target, @"StillImageBufferFrameType", 0), "unsignedLongLongValue"), -[BWStillImageProcessorControllerRequest input](v203, "input"), v45);
  int v160 = 1;
LABEL_299:
  [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v203 input] finishedProcessingSbuf];
  if (v160) {
    [(BWPhotoEncoderController *)self _removeCurrentRequestFromInputsByCaptureIdentifier];
  }
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
LABEL_303:
  _Block_object_dispose(v229, 8);
  _Block_object_dispose(v230, 8);
  _Block_object_dispose(&v231, 8);
  _Block_object_dispose(&v235, 8);
  _Block_object_dispose(&v240, 8);
  _Block_object_dispose(&v244, 8);
  _Block_object_dispose(&v248, 8);
  _Block_object_dispose(&v252, 8);
  return v45;
}

unint64_t __40__BWPhotoEncoderController__processSbuf__block_invoke(uint64_t a1)
{
  unint64_t result = objc_msgSend(*(id *)(a1 + 32), "_generatePreviewForSampleBuffer:requestedStillImageCaptureSettings:cropRect:previewPixelBuffer:", *(void *)(a1 + 88), *(void *)(a1 + 40), *(void *)(*(void *)(a1 + 64) + 8) + 24, *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) && *(unsigned char *)(a1 + 136))
  {
    BWCMSampleBufferCreateCopyWithNewPixelBuffer(*(opaqueCMSampleBuffer **)(a1 + 88), *(__CVBuffer **)(*(void *)(*(void *)(a1 + 64) + 8) + 24), (CFTypeRef *)(*(void *)(a1 + 32) + 216), (CMSampleBufferRef *)(*(void *)(*(void *)(a1 + 72) + 8) + 24));
    id v3 = (id)[*(id *)(a1 + 48) mutableCopy];
    CMSetAttachment(*(CMAttachmentBearerRef *)(*(void *)(*(void *)(a1 + 72) + 8) + 24), (CFStringRef)*MEMORY[0x1E4F53070], v3, 1u);
    if (!CGRectIsEmpty(*(CGRect *)(a1 + 96)))
    {
      unsigned int v4 = [*(id *)(a1 + 40) previewWidth];
      unint64_t v5 = v4 | (unint64_t)([*(id *)(a1 + 40) previewHeight] << 32);
      FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v3, *(void *)(a1 + 128), v5, *(CGFloat *)(a1 + 96), *(CGFloat *)(a1 + 104), *(CGFloat *)(a1 + 112), *(CGFloat *)(a1 + 120), *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
      FigCaptureMetadataUtilitiesUpdateMetadataForNewFinalDimensions((uint64_t)v3, *(void *)(a1 + 128), v5);
    }
    BWPhotoEncoderApplyFinalCropToFaceObservationsForSampleBuffer(*(const void **)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                                 + 24));
    [*(id *)(a1 + 32) _performInferenceWithBuffer:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
    unint64_t result = FigGetUpTimeNanoseconds();
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = result / 0xF4240;
  }
  return result;
}

uint64_t __40__BWPhotoEncoderController__processSbuf__block_invoke_2(uint64_t a1)
{
  CFDictionaryRef v2 = CVBufferCopyAttachments(*(CVBufferRef *)(a1 + 56), kCVAttachmentMode_ShouldPropagate);
  if (v2) {
    CFTypeRef v3 = CFAutorelease(v2);
  }
  else {
    CFTypeRef v3 = 0;
  }
  uint64_t result = BWPhotoEncoderScalePixelBuffer(*(__CVBuffer **)(a1 + 56), *(void *)(a1 + 96), +[BWVideoFormat colorSpacePropertiesForPixelBufferAttachments:v3], *(void **)(*(void *)(a1 + 32) + 104), 0, *(void *)(*(void *)(a1 + 48) + 8) + 24, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __40__BWPhotoEncoderController__processSbuf__block_invoke_251(uint64_t a1)
{
  CFDictionaryRef v2 = CVBufferCopyAttachments(*(CVBufferRef *)(a1 + 56), kCVAttachmentMode_ShouldPropagate);
  if (v2) {
    CFTypeRef v3 = CFAutorelease(v2);
  }
  else {
    CFTypeRef v3 = 0;
  }
  uint64_t result = BWPhotoEncoderScalePixelBuffer(*(__CVBuffer **)(a1 + 56), *(void *)(a1 + 96), +[BWVideoFormat colorSpacePropertiesForPixelBufferAttachments:v3], *(void **)(*(void *)(a1 + 32) + 96), 1, *(void *)(*(void *)(a1 + 48) + 8) + 24, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __40__BWPhotoEncoderController__processSbuf__block_invoke_257(uint64_t a1)
{
  CFDictionaryRef v2 = CVBufferCopyAttachments(*(CVBufferRef *)(a1 + 56), kCVAttachmentMode_ShouldPropagate);
  if (v2) {
    CFTypeRef v3 = CFAutorelease(v2);
  }
  else {
    CFTypeRef v3 = 0;
  }
  uint64_t result = BWPhotoEncoderScalePixelBuffer(*(__CVBuffer **)(a1 + 56), *(void *)(a1 + 96), +[BWVideoFormat colorSpacePropertiesForPixelBufferAttachments:v3], *(void **)(*(void *)(a1 + 32) + 96), 1, *(void *)(*(void *)(a1 + 48) + 8) + 24, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __40__BWPhotoEncoderController__processSbuf__block_invoke_258(uint64_t a1)
{
  atomic_store(0, (unsigned __int8 *)(*(void *)(a1 + 32) + 193));
  CFDictionaryRef v2 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v2)
  {
    CFTypeRef v3 = CMGetAttachment(v2, @"Inferences", 0);
    CFTypeRef v4 = v3 ? v3 : (CFTypeRef)MEMORY[0x1E4F1CC08];
    CMSetAttachment(*(CMAttachmentBearerRef *)(a1 + 48), @"Inferences", v4, 1u);
    unint64_t v5 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    if (v5)
    {
      CFRelease(v5);
    }
  }
}

void __40__BWPhotoEncoderController__processSbuf__block_invoke_2_259(uint64_t a1)
{
  atomic_store(0, (unsigned __int8 *)(*(void *)(a1 + 32) + 193));
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  unint64_t UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  unint64_t v3 = UpTimeNanoseconds / 0xF4240 - *(void *)(a1 + 56);
  unint64_t v4 = UpTimeNanoseconds / 0xF4240 - *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  unint64_t v5 = objc_alloc_init(BWOpportunisticInferenceAnalyticsPayload);
  [(BWOpportunisticInferenceAnalyticsPayload *)v5 setInferenceDeadlineOverdue:v3];
  [(BWOpportunisticInferenceAnalyticsPayload *)v5 setTotalInferenceExecutionTime:v4];
  [(BWOpportunisticInferenceAnalyticsPayload *)v5 setFacesProcessedCount:*(unsigned int *)(a1 + 64)];
  [+[BWCoreAnalyticsReporter sharedInstance] sendEvent:v5];
  id v6 = *(const void **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v6)
  {
    CFRelease(v6);
  }
}

- (void)_removeCurrentRequestFromInputsByCaptureIdentifier
{
  inputsByCaptureIdentifierQueue = self->_inputsByCaptureIdentifierQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__BWPhotoEncoderController__removeCurrentRequestFromInputsByCaptureIdentifier__block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_sync(inputsByCaptureIdentifierQueue, block);
}

uint64_t __78__BWPhotoEncoderController__removeCurrentRequestFromInputsByCaptureIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  CFDictionaryRef v2 = *(void **)(*(void *)(a1 + 32) + 272);
  uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * v6);
        uint64_t v8 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "currentRequest"), "input");
        uint64_t result = [*(id *)(*(void *)(a1 + 32) + 272) objectForKeyedSubscript:v7];
        if (v8 == result)
        {
          if (v7) {
            return [*(id *)(*(void *)(a1 + 32) + 272) removeObjectForKey:v7];
          }
          return result;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v4 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (void)_flushInputsByCaptureIdentifier
{
  inputsByCaptureIdentifierQueue = self->_inputsByCaptureIdentifierQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__BWPhotoEncoderController__flushInputsByCaptureIdentifier__block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_sync(inputsByCaptureIdentifierQueue, block);
}

uint64_t __59__BWPhotoEncoderController__flushInputsByCaptureIdentifier__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 272) removeAllObjects];
}

- (void)_flushCurrentRequest
{
  v22[16] = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5590)
  {
    LODWORD(v17) = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v4 = [(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input];
  BOOL v5 = [(BWCMPhotoEncoderManager *)self->_cmPhotoEncoderManager isContainerOpen];
  BOOL v6 = [(BWDNGEncoderManager *)self->_dngEncoderManager isContainerOpen];
  uint64_t v7 = BWPhotoEncoderResolveEncodingSchemeForRequestedSettings([(BWStillImageSettings *)[(BWStillImageProcessorControllerInput *)v4 stillImageSettings] requestedSettings]);
  if (BWPhotoEncoderResolveEncodingSchemeForCompressedPhotoWithLinDNG([(BWStillImageSettings *)[(BWStillImageProcessorControllerInput *)v4 stillImageSettings] requestedSettings]) == 2|| v7 == 2)
  {
    uint64_t v9 = 2;
  }
  else
  {
    uint64_t v9 = 1;
  }
  if (([(BWStillImageProcessorControllerInput *)v4 fatalErrorOccurred] & 1) != 0
    || ![(BWStillImageProcessorControllerInput *)v4 primarySampleBuffer])
  {
    if (v5) {
      [(BWPhotoEncoderController *)self _closeContainerForEncodingScheme:v9];
    }
    if (v6) {
      [(BWPhotoEncoderController *)self _closeContainerForEncodingScheme:v7];
    }
  }
  else
  {
    if (v5)
    {
      v22[0] = 0;
      long long v10 = [(BWPhotoEncoderController *)self _closeContainerAndCopySurfaceForEncodingScheme:v9];
      if (v10)
      {
        long long v11 = v10;
        [(BWPhotoEncoderController *)self _getAssetsSizeForEncodingScheme:v9 containerSizeOut:v22 thumbnailSizeOut:0 auxiliaryImagesSizeOut:0];
        CMSetAttachment((CMAttachmentBearerRef)[(BWStillImageProcessorControllerInput *)v4 primarySampleBuffer], @"EncodedImageSurface", v11, 1u);
        long long v12 = (const void *)[(BWStillImageProcessorControllerInput *)v4 primarySampleBuffer];
        CMSetAttachment(v12, @"EncodedImageSurfaceSize", (CFTypeRef)[NSNumber numberWithUnsignedLong:v22[0]], 1u);
      }
    }
    if (v6)
    {
      v22[0] = 0;
      uint64_t v21 = 0;
      uint64_t v17 = 0;
      long long v13 = [(BWPhotoEncoderController *)self _closeContainerAndCopySurfaceForEncodingScheme:v7];
      if (v13)
      {
        uint64_t v14 = v13;
        [(BWPhotoEncoderController *)self _getAssetsSizeForEncodingScheme:v7 containerSizeOut:v22 thumbnailSizeOut:&v21 auxiliaryImagesSizeOut:&v17];
        CMSetAttachment((CMAttachmentBearerRef)[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] primarySampleBuffer], @"RawImageSurface", v14, 1u);
        v19[0] = 0x1EFA74140;
        v20[0] = [NSNumber numberWithUnsignedLong:v22[0]];
        v19[1] = 0x1EFA74160;
        v20[1] = [NSNumber numberWithUnsignedLong:v21];
        v19[2] = 0x1EFA74180;
        v20[2] = [NSNumber numberWithUnsignedLong:v17];
        CMSetAttachment((CMAttachmentBearerRef)-[BWStillImageProcessorControllerInput primarySampleBuffer](v4, "primarySampleBuffer"), @"RawImageAssetSizes", (CFTypeRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3], 1u);
      }
    }
    -[BWStillImageProcessorControllerDelegate processorController:didFinishProcessingSampleBuffer:type:processorInput:err:](-[BWStillImageProcessorControllerRequest delegate](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "delegate"), "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", self, -[BWStillImageProcessorControllerInput primarySampleBuffer](v4, "primarySampleBuffer"), objc_msgSend((id)CMGetAttachment((CMAttachmentBearerRef)-[BWStillImageProcessorControllerInput primarySampleBuffer](v4, "primarySampleBuffer"), @"StillImageBufferFrameType", 0), "unsignedLongLongValue"), -[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), 4294950496);
  }
  [(BWPhotoEncoderController *)self _removeCurrentRequestFromInputsByCaptureIdentifier];
  [(BWPhotoEncoderController *)self reset];
}

- (void)_propagateSampleBufferGainMapMetadata:(opaqueCMSampleBuffer *)a3 toSampleBufferMetadata:(opaqueCMSampleBuffer *)a4
{
  AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a3, 0x1EFA4EB60);
  CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F53070];
  CFTypeRef v7 = CMGetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  CFDictionaryRef value = objc_msgSend((id)CMGetAttachment(a4, v6, 0), "mutableCopy");
  [value setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F53310]];
  CMSetAttachment(a4, v6, value, 1u);
}

- (double)_primaryOutputAspectRatioForSettings:(id)a3
{
  unsigned int v5 = objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "outputWidth");
  unsigned int v6 = objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "outputHeight");
  -[BWPhotoEncoderController _aspectRatioAdjustmentFactorForSettings:](self, "_aspectRatioAdjustmentFactorForSettings:", [a3 requestedSettings]);
  return (double)v5 / (double)v6 * v7;
}

- (int)_addOrPrewarmForAttachedMediaKey:(id)a3 encodingScheme:(int)a4 sampleBuffer:(opaqueCMSampleBuffer *)a5 metadata:(id)a6 stillImageSettings:(id)a7 parentImageHandle:(int64_t)a8
{
  uint64_t v12 = *(void *)&a4;
  uint64_t AttachedMedia = BWSampleBufferGetAttachedMedia(a5, (uint64_t)a3);
  uint64_t v16 = @"Adding";
  if (!AttachedMedia) {
    uint64_t v16 = @"Prewarming";
  }
  [NSString stringWithFormat:@"%@ aux image {%@}", v16, a3];
  [(BWPhotoEncoderController *)self _primaryOutputAspectRatioForSettings:a7];
  double v18 = v17;
  uint64_t v19 = objc_msgSend((id)objc_msgSend(a6, "objectForKeyedSubscript:", *MEMORY[0x1E4F53248]), "intValue");
  if ([a3 isEqualToString:0x1EFA4EB60])
  {
    if (AttachedMedia)
    {
      double v20 = (const void *)BWSampleBufferGetAttachedMedia(a5, (uint64_t)a3);
      [(BWPhotoEncoderController *)self mainImageDownscalingFactorForAttachedMediaKey:a3 attachedMediaMetadata:CMGetAttachment(v20, (CFStringRef)*MEMORY[0x1E4F53070], 0)];
      BOOL v22 = -[BWPhotoEncoderController _addGainMapForEncodingScheme:sampleBuffer:outputDimensions:primaryOutputAspectRatio:parentImageHandle:](self, "_addGainMapForEncodingScheme:sampleBuffer:outputDimensions:primaryOutputAspectRatio:parentImageHandle:", v12, a5, (float)((float)objc_msgSend((id)objc_msgSend(a7, "requestedSettings"), "outputWidth")/ v21) | ((unint64_t)(float)((float)objc_msgSend((id)objc_msgSend(a7, "requestedSettings"), "outputHeight")/ v21) << 32), a8, v18);
      if (([a3 isEqualToString:@"Depth"] & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    -[BWPhotoEncoderController _handlePrewarmForGainMapForEncodingScheme:requestedStillImageCaptureSettings:prewarmingMetadata:](self, "_handlePrewarmForGainMapForEncodingScheme:requestedStillImageCaptureSettings:prewarmingMetadata:", v12, [a7 requestedSettings], a6);
    if (([a3 isEqualToString:@"Depth"] & 1) == 0) {
      goto LABEL_14;
    }
  }
  else
  {
    if (([a3 isEqualToString:@"Depth"] & 1) == 0)
    {
      int v23 = 0;
      BOOL v22 = 0;
      goto LABEL_15;
    }
    if (AttachedMedia)
    {
LABEL_9:
      BOOL v22 = [(BWPhotoEncoderController *)self _addDepthForEncodingScheme:v12 sampleBuffer:a5 primaryOutputAspectRatio:a8 parentImageHandle:v18];
LABEL_10:
      int v23 = 0;
      goto LABEL_15;
    }
  }
  -[BWPhotoEncoderController _handlePrewarmForDepthForEncodingScheme:requestedStillImageCaptureSettings:prewarmingMetadata:](self, "_handlePrewarmForDepthForEncodingScheme:requestedStillImageCaptureSettings:prewarmingMetadata:", v12, [a7 requestedSettings], a6);
LABEL_14:
  BOOL v22 = 0;
  int v23 = 1;
LABEL_15:
  if ([a3 isEqualToString:0x1EFA74420])
  {
    if (AttachedMedia)
    {
      BOOL v22 = [(BWPhotoEncoderController *)self _addPortraitEffectsMatteForEncodingScheme:v12 sampleBuffer:a5 primaryOutputAspectRatio:a8 parentImageHandle:v18];
    }
    else
    {
      -[BWPhotoEncoderController _handlePrewarmForPortraitEffectsMatteForEncodingScheme:requestedStillImageCaptureSettings:](self, "_handlePrewarmForPortraitEffectsMatteForEncodingScheme:requestedStillImageCaptureSettings:", v12, [a7 requestedSettings]);
      int v23 = 1;
    }
  }
  if (([a3 isEqualToString:@"PersonSemanticsHair"] & 1) != 0
    || ([a3 isEqualToString:@"PersonSemanticsSkin"] & 1) != 0
    || ([a3 isEqualToString:@"PersonSemanticsTeeth"] & 1) != 0
    || ([a3 isEqualToString:@"PersonSemanticsGlasses"] & 1) != 0)
  {
    if (AttachedMedia) {
LABEL_24:
    }
      BOOL v22 = -[BWPhotoEncoderController _addSemanticMattesForEncodingScheme:attachedMediaKey:sampleBuffer:primaryOutputAspectRatio:settingsID:orientation:parentImageHandle:](self, "_addSemanticMattesForEncodingScheme:attachedMediaKey:sampleBuffer:primaryOutputAspectRatio:settingsID:orientation:parentImageHandle:", v12, a3, a5, objc_msgSend((id)objc_msgSend(a7, "requestedSettings"), "settingsID"), v19, a8, v18);
  }
  else
  {
    int v27 = [a3 isEqualToString:0x1EFA745A0];
    if (AttachedMedia && v27) {
      goto LABEL_24;
    }
  }
  int v24 = [a3 isEqualToString:0x1EFA74740];
  if (AttachedMedia && v24) {
    BOOL v22 = [(BWPhotoEncoderController *)self _addSmartStyleLinearThumbnailForEncodingScheme:v12 sampleBuffer:a5 primaryOutputAspectRatio:v18];
  }
  if ([a3 isEqualToString:0x1EFA74920])
  {
    if (AttachedMedia)
    {
      BOOL v22 = [(BWPhotoEncoderController *)self _addConstantColorConfidenceMapForEncodingScheme:v12 sampleBuffer:a5];
      if (v23) {
        goto LABEL_35;
      }
LABEL_33:
      int v25 = 0;
      goto LABEL_36;
    }
    -[BWPhotoEncoderController _handlePrewarmForConstantColorConfidenceMapForEncodingScheme:requestedStillImageCaptureSettings:confidenceMapDimensions:](self, "_handlePrewarmForConstantColorConfidenceMapForEncodingScheme:requestedStillImageCaptureSettings:confidenceMapDimensions:", v12, [a7 requestedSettings], -[BWPhotoEncoderControllerConfiguration constantColorConfidenceMapDimensions](self->_configuration, "constantColorConfidenceMapDimensions"));
  }
  else if (!v23)
  {
    goto LABEL_33;
  }
LABEL_35:
  int v25 = 1;
LABEL_36:
  if (v22) {
    return 2;
  }
  else {
    return v25;
  }
}

- (void)_addOrPrewarmAuxImagesIfNeededForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 metadata:(id)a5 stillImageSettings:(id)a6 processingFlags:(unsigned int)a7 parentImageHandle:(int64_t)a8
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if ((a7 & 0x40) == 0
    || ![(BWPhotoEncoderControllerConfiguration *)self->_configuration portraitRenderQuality])
  {
    uint64_t v12 = BWIsDeferredPhotoProxyImage(a7);
    long long v13 = (void *)[MEMORY[0x1E4F1CA48] array];
    int v40 = 0;
    uint64_t v38 = 0;
    uint64_t v39 = 0;
    int v14 = BWPhotoEncoderThumbnailEnabled(a3, (void *)[a6 requestedSettings], &v40, &v39, &v38);
    uint64_t AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a4, 0x1EFA4EB60);
    [(BWPhotoEncoderController *)self mainImageDownscalingFactorForAttachedMediaKey:0x1EFA4EB60 attachedMediaMetadata:CMGetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E4F53070], 0)];
    if (v16 != 0.0 && (!BWPhotoEncoderIsLinDNGEncodingScheme(a3) | v14) == 1) {
      [v13 addObject:0x1EFA4EB60];
    }
    if ([(BWPhotoEncoderController *)self _depthEncodingNeededForSettings:a6 deferredPhotoProxy:v12])
    {
      [v13 addObject:@"Depth"];
    }
    uint64_t v17 = (a7 >> 3) & 1;
    if ([(BWPhotoEncoderController *)self _personMaskEncodingNeededForSettings:a6 encodingScheme:a3 deferredPhotoProxy:v12 adjustedPhoto:v17])
    {
      [v13 addObject:0x1EFA74420];
    }
    id v18 = [(BWPhotoEncoderController *)self _semanticSegmentationMatteMediaKeysEncodingNeededForSettings:a6 encodingScheme:a3 deferredPhotoProxy:v12 adjustedPhoto:(a7 >> 3) & 1];
    if ([v18 count]) {
      [v13 addObjectsFromArray:v18];
    }
    if ([(BWPhotoEncoderController *)self _smartStyleReversibilityDataNeededForSettings:a6 adjustedPhoto:v17 deferredPhotoProxy:v12])
    {
      [v13 addObject:0x1EFA74740];
    }
    if ([(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] deltaMapIsValid])
    {
      [(BWPhotoEncoderController *)self _primaryOutputAspectRatioForSettings:a6];
      -[BWPhotoEncoderController _addSmartStyleDeltaMapForEncodingScheme:sampleBuffer:stillImageSettings:primaryOutputAspectRatio:](self, "_addSmartStyleDeltaMapForEncodingScheme:sampleBuffer:stillImageSettings:primaryOutputAspectRatio:", a3, a4, a6);
    }
    if (objc_msgSend((id)objc_msgSend(a6, "requestedSettings"), "constantColorEnabled")
      && BWIsConstantColorPrimaryFrame(a4))
    {
      [v13 addObject:0x1EFA74920];
    }
    uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v30 = [MEMORY[0x1E4F1CA48] array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v21 = [v13 countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v35 != v23) {
            objc_enumerationMutation(v13);
          }
          uint64_t v25 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          char v26 = objc_msgSend((id)-[BWStillImageProcessorControllerInput encodedAttachedMediaKeys](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "encodedAttachedMediaKeys"), "containsObject:", v25);
          int v27 = (void *)v19;
          if ((v26 & 1) == 0)
          {
            int v28 = [(BWPhotoEncoderController *)self _addOrPrewarmForAttachedMediaKey:v25 encodingScheme:a3 sampleBuffer:a4 metadata:a5 stillImageSettings:a6 parentImageHandle:a8];
            int v27 = (void *)v20;
            if (v28 != 2)
            {
              if (v28 != 1) {
                continue;
              }
              int v27 = (void *)v30;
            }
          }
          [v27 addObject:v25];
        }
        uint64_t v22 = [v13 countByEnumeratingWithState:&v34 objects:v41 count:16];
      }
      while (v22);
    }
    if (dword_1EB4C5590)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

- (float)mainImageDownscalingFactorForAttachedMediaKey:(id)a3 attachedMediaMetadata:(id)a4
{
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F533D0]), "floatValue");
  if (!self->_preferMainImageDownscalingFactorByAttachedMediaKeyFromSampleBuffer || result == 0.0)
  {
    id v7 = [(NSDictionary *)[(BWPhotoEncoderControllerConfiguration *)self->_configuration attachedMediaConfigurationByAttachedMediaKey] objectForKeyedSubscript:a3];
    [v7 mainImageDownscalingFactor];
  }
  return result;
}

- (BOOL)_postponeSelectResourceAllocations
{
  BOOL v3 = BWDeviceSupportsDeferredPhotoProcessorPrewarming();
  return [(BWPhotoEncoderControllerConfiguration *)self->_configuration deferredPhotoProcessorEnabled]&& v3;
}

- (int)_ensureSetupForPostponedResources
{
  if (self->_smartStyleProcessor
    || ![(BWPhotoEncoderControllerConfiguration *)self->_configuration smartStyleReversibilityEnabled]|| [(BWPhotoEncoderControllerConfiguration *)self->_configuration smartStyleRenderingVersion] < 1)
  {
    return 0;
  }
  int v3 = [(BWPhotoEncoderController *)self _loadCreateAndSetupSmartStyleRenderingProcessor];
  if (v3) {
    FigDebugAssert3();
  }
  return v3;
}

- (void)_handlePrewarmForMainImageForEncodingScheme:(int)a3 prewarmingMetadata:(id)a4 stillImageSettings:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  CMVideoFormatDescriptionRef v53 = 0;
  uint64_t v8 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  id v44 = [(BWPhotoEncoderController *)self _encoderManagerForEncodingScheme:v6];
  if (v44)
  {
    uint64_t v9 = (void *)[a5 requestedSettings];
    unsigned int v10 = [v9 outputWidth];
    uint64_t v11 = [v9 outputHeight];
    CMVideoCodecType codecType = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_resolvedVideoFormatsByAttachedMediaKey, "objectForKeyedSubscript:", @"PrimaryFormat"), "pixelFormat");
    uint64_t v12 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_resolvedVideoFormatsByAttachedMediaKey, "objectForKeyedSubscript:", @"PrimaryFormat"), "colorSpaceProperties");
    if (!v12) {
      uint64_t v12 = -[BWPhotoEncoderController _getColorSpacePropertiesForSourcePixelFormat:sourceWidth:sourceHeight:destinationPixelFormat:](self, "_getColorSpacePropertiesForSourcePixelFormat:sourceWidth:sourceHeight:destinationPixelFormat:", codecType, objc_msgSend(v9, "outputWidth", v12), objc_msgSend(v9, "outputHeight"), codecType);
    }
    CFDictionaryRef v13 = +[BWVideoFormat pixelBufferAttachmentsForColorSpaceProperties:v12];
    unint64_t v14 = v10 | (unint64_t)(v11 << 32);
    [(BWPhotoEncoderController *)self _cropRectForRequestedSettings:v9 inputDimensions:v14 metadata:a4 processingFlags:[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] processingFlagsForPrewarming]];
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    double v20 = v19;
    double v22 = v21;
    if ([(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] requiresPhotosAdjustment])
    {
      v54.origin.double x = v16;
      v54.origin.double y = v18;
      v54.size.double width = v20;
      v54.size.height = v22;
      if (!CGRectIsEmpty(v54))
      {
        unsigned int v10 = (int)v20;
        LODWORD(v11) = (int)v22;
      }
    }
    CFAllocatorRef v23 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFDictionaryRef extensions = v13;
    if (!CMVideoFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], codecType, v10, v11, v13, &formatDescriptionOut))
    {
      uint64_t v41 = *MEMORY[0x1E4F560D0];
      objc_msgSend(v8, "setObject:forKeyedSubscript:", formatDescriptionOut);
      uint64_t v24 = BWPhotoEncoderCodecTypeForEncodingScheme(v6);
      uint64_t v25 = [NSNumber numberWithUnsignedInt:v24];
      uint64_t v26 = *MEMORY[0x1E4F560B8];
      [v8 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F560B8]];
      if ([(BWPhotoEncoderControllerConfiguration *)self->_configuration usesHighEncodingPriority])
      {
        [v8 setObject:&unk_1EFB011D8 forKeyedSubscript:*MEMORY[0x1E4F56140]];
      }
      uint64_t v27 = objc_msgSend((id)objc_msgSend(a5, "captureSettings"), "learnedNRStereoPhotoFrameFlag");
      uint64_t v43 = v27;
      if (a4 || v27)
      {
        if (v27) {
          [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F56138]];
        }
        [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F56168]];
      }
      if ([(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] requiresPhotosAdjustment])
      {
        [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F56090]];
        uint64_t v28 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F53248]];
        [v8 setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F560F8]];
      }
      uint64_t v29 = [a5 captureSettings];
      BYTE1(v39) = 1;
      LOBYTE(v39) = self->_heifUseTiling;
      -[BWPhotoEncoderController _addQualityOptionsToDictionary:codecType:pixelBuffer:imageDimensions:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:enableHEIFTiling:enableHEIFOrientation:auxImageType:](self, "_addQualityOptionsToDictionary:codecType:pixelBuffer:imageDimensions:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:enableHEIFTiling:enableHEIFOrientation:auxImageType:", v8, v24, 0, v14, a4, v9, v29, v39);
      unsigned int v51 = 0;
      uint64_t v49 = 0;
      uint64_t v50 = 0;
      if (BWPhotoEncoderThumbnailEnabled(v6, v9, &v51, &v50, &v49))
      {
        if (([(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] requiresPhotosAdjustment] & 1) == 0)
        {
          CMVideoCodecType v30 = FigCaptureUncompressedPixelFormatForPixelFormat(codecType);
          if (!CMVideoFormatDescriptionCreate(v23, v30, v50, SHIDWORD(v50), extensions, &v53))
          {
            v31 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
            [v31 setObject:v53 forKeyedSubscript:v41];
            objc_msgSend(v31, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v51), v26);
            if ([(BWPhotoEncoderControllerConfiguration *)self->_configuration usesHighEncodingPriority])
            {
              [v31 setObject:&unk_1EFB011D8 forKeyedSubscript:*MEMORY[0x1E4F56140]];
            }
            uint64_t v32 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BWStillImageProcessorControllerConfiguration figThreadPriority](self->_configuration, "figThreadPriority"));
            [v31 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4F56178]];
            uint64_t v33 = [NSNumber numberWithUnsignedLong:v49];
            [v31 setObject:v33 forKeyedSubscript:*MEMORY[0x1E4F56120]];
            uint64_t v34 = v51;
            uint64_t v35 = [a5 captureSettings];
            LOWORD(v40) = 0;
            -[BWPhotoEncoderController _addQualityOptionsToDictionary:codecType:pixelBuffer:imageDimensions:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:enableHEIFTiling:enableHEIFOrientation:auxImageType:](self, "_addQualityOptionsToDictionary:codecType:pixelBuffer:imageDimensions:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:enableHEIFTiling:enableHEIFOrientation:auxImageType:", v31, v34, 0, v50, 0, v9, v35, v40);
            [v8 setObject:v31 forKeyedSubscript:*MEMORY[0x1E4F56108]];
          }
        }
      }
      uint64_t v48 = [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] reservedPrimaryImageHandle];
      if (![v44 addMainImage:0 metadata:0 options:v8 imageHandleOut:&v48])
      {
        [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] setReservedPrimaryImageHandle:v48];
        objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[BWPhotoEncoderControllerConfiguration attachedMediaConfigurationByAttachedMediaKey](self->_configuration, "attachedMediaConfigurationByAttachedMediaKey"), "objectForKeyedSubscript:", 0x1EFA4EB60), "mainImageDownscalingFactor");
        float v37 = v36;
        unsigned int v38 = [+[FigCaptureCameraParameters sharedInstance] gainMapVersion];
        if (v37 != 0.0 && v43 && v38 >= 2)
        {
          uint64_t v47 = [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] toneMapAlternateGroupHandle];
          [v44 addAlternateImageWithDerivedImageHandles:0 options:0 parentImageHandle:0 alternateGroupHandleInOut:&v47];
          [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] setToneMapAlternateGroupHandle:v47];
        }
      }
    }
  }
  if (v53) {
    CFRelease(v53);
  }
  if (formatDescriptionOut) {
    CFRelease(formatDescriptionOut);
  }
}

- (void)_handlePrewarmForDepthForEncodingScheme:(int)a3 requestedStillImageCaptureSettings:(id)a4 prewarmingMetadata:(id)a5
{
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  id v8 = [(BWPhotoEncoderController *)self _encoderManagerForEncodingScheme:*(void *)&a3];
  if (v8)
  {
    uint64_t v9 = v8;
    if ([a4 depthDataDeliveryEnabled])
    {
      if ([a4 embedsDepthDataInImage])
      {
        id v10 = [(NSDictionary *)self->_resolvedVideoFormatsByAttachedMediaKey objectForKeyedSubscript:@"Depth"];
        uint64_t v11 = BWPhotoEncoderAuxImageTypeForDepthPixelFormat([v10 pixelFormat]);
        if (v11)
        {
          uint64_t v12 = v11;
          CFDictionaryRef v13 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
          if (([a4 depthDataFiltered] & 1) == 0)
          {
            if (FigDepthFormatIs16Bit([v10 pixelFormat])) {
              uint64_t v14 = [NSNumber numberWithShort:0x7FFFLL];
            }
            else {
              uint64_t v14 = [NSNumber numberWithInt:2143289344];
            }
            [v13 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F560A0]];
          }
          int32_t v15 = [v10 width];
          int32_t v16 = [v10 height];
          OSStatus v17 = CMVideoFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], [v10 pixelFormat], v15, v16, 0, &formatDescriptionOut);
          CMVideoFormatDescriptionRef v18 = formatDescriptionOut;
          if (!v17)
          {
            [v13 setObject:formatDescriptionOut forKeyedSubscript:*MEMORY[0x1E4F560D0]];
            if ([(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] requiresPhotosAdjustment])
            {
              [v13 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F56090]];
              uint64_t v19 = [a5 objectForKeyedSubscript:*MEMORY[0x1E4F53248]];
              [v13 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F560F8]];
            }
            if ([(BWPhotoEncoderControllerConfiguration *)self->_configuration usesHighEncodingPriority])
            {
              [v13 setObject:&unk_1EFB011D8 forKeyedSubscript:*MEMORY[0x1E4F56140]];
            }
            uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BWStillImageProcessorControllerConfiguration figThreadPriority](self->_configuration, "figThreadPriority"));
            [v13 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F56178]];
            [v9 addAuxImage:0 type:v12 auxImageMetadata:0 options:v13 parentImageHandle:0 auxImageHandleOut:0];
            CMVideoFormatDescriptionRef v18 = formatDescriptionOut;
          }
          if (v18) {
            CFRelease(v18);
          }
        }
      }
    }
  }
}

- (void)_handlePrewarmForGainMapForEncodingScheme:(int)a3 requestedStillImageCaptureSettings:(id)a4 prewarmingMetadata:(id)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  id v8 = [(BWPhotoEncoderController *)self _encoderManagerForEncodingScheme:*(void *)&a3];
  if (v8)
  {
    uint64_t v19 = v8;
    id v9 = [(NSDictionary *)self->_resolvedVideoFormatsByAttachedMediaKey objectForKeyedSubscript:0x1EFA4EB60];
    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[BWPhotoEncoderControllerConfiguration attachedMediaConfigurationByAttachedMediaKey](self->_configuration, "attachedMediaConfigurationByAttachedMediaKey"), "objectForKeyedSubscript:", 0x1EFA4EB60), "mainImageDownscalingFactor");
    float v11 = v10;
    int32_t v12 = (int)(float)((float)[a4 outputWidth] / v10);
    int32_t v13 = (int)(float)((float)[a4 outputHeight] / v11);
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", BWPhotoEncoderEncodingOptionsForAuxiliaryImage(v12, v13, objc_msgSend(v9, "pixelBufferAttributes"), -[BWPhotoEncoderControllerConfiguration usesHighEncodingPriority](self->_configuration, "usesHighEncodingPriority"), -[BWStillImageProcessorControllerConfiguration figThreadPriority](self->_configuration, "figThreadPriority")));
    if ([(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] requiresPhotosAdjustment])
    {
      [v14 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F56090]];
      uint64_t v15 = [a5 objectForKeyedSubscript:*MEMORY[0x1E4F53248]];
      [v14 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F560F8]];
      uint64_t v21 = *MEMORY[0x1E4F24BC8];
      v22[0] = *MEMORY[0x1E4F24C10];
      CFDictionaryRef v16 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    }
    else
    {
      CFDictionaryRef v16 = 0;
    }
    OSStatus v17 = CMVideoFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], [v9 pixelFormat], v12, v13, v16, &formatDescriptionOut);
    CMVideoFormatDescriptionRef v18 = formatDescriptionOut;
    if (!v17)
    {
      [v14 setObject:formatDescriptionOut forKeyedSubscript:*MEMORY[0x1E4F560D0]];
      BWPhotoEncoderAddGainMapQualityControllerParametersToEncodingOptions(v14);
      [v19 addAuxImage:0 type:1 auxImageMetadata:0 options:v14 parentImageHandle:0 auxImageHandleOut:0];
      CMVideoFormatDescriptionRef v18 = formatDescriptionOut;
    }
    if (v18) {
      CFRelease(v18);
    }
  }
}

- (void)_handlePrewarmForPortraitEffectsMatteForEncodingScheme:(int)a3 requestedStillImageCaptureSettings:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  id v6 = [(BWPhotoEncoderController *)self _encoderManagerForEncodingScheme:*(void *)&a3];
  if (v6)
  {
    CFDictionaryRef v16 = v6;
    id v7 = [(NSDictionary *)self->_resolvedVideoFormatsByAttachedMediaKey objectForKeyedSubscript:0x1EFA74420];
    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[BWPhotoEncoderControllerConfiguration attachedMediaConfigurationByAttachedMediaKey](self->_configuration, "attachedMediaConfigurationByAttachedMediaKey"), "objectForKeyedSubscript:", 0x1EFA74420), "mainImageDownscalingFactor");
    if (v8 == 0.0) {
      float v9 = 1.0;
    }
    else {
      float v9 = v8;
    }
    int32_t v10 = (int)(float)((float)[a4 outputWidth] / v9);
    int32_t v11 = (int)(float)((float)[a4 outputHeight] / v9);
    int32_t v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", BWPhotoEncoderEncodingOptionsForAuxiliaryImage(v10, v11, objc_msgSend(v7, "pixelBufferAttributes"), -[BWPhotoEncoderControllerConfiguration usesHighEncodingPriority](self->_configuration, "usesHighEncodingPriority"), -[BWStillImageProcessorControllerConfiguration figThreadPriority](self->_configuration, "figThreadPriority")));
    uint64_t v18 = *MEMORY[0x1E4F24BC8];
    v19[0] = *MEMORY[0x1E4F24BE8];
    CFDictionaryRef v13 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    OSStatus v14 = CMVideoFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], [v7 pixelFormat], v10, v11, v13, &formatDescriptionOut);
    CMVideoFormatDescriptionRef v15 = formatDescriptionOut;
    if (!v14)
    {
      [v12 setObject:formatDescriptionOut forKeyedSubscript:*MEMORY[0x1E4F560D0]];
      [v16 addAuxImage:0 type:4 auxImageMetadata:0 options:v12 parentImageHandle:0 auxImageHandleOut:0];
      CMVideoFormatDescriptionRef v15 = formatDescriptionOut;
    }
    if (v15) {
      CFRelease(v15);
    }
  }
}

- (void)_handlePrewarmForConstantColorConfidenceMapForEncodingScheme:(int)a3 requestedStillImageCaptureSettings:(id)a4 confidenceMapDimensions:(id)a5
{
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  id v9 = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:", *(void *)&a3, a4);
  if (v9)
  {
    id v7 = [(NSDictionary *)self->_resolvedVideoFormatsByAttachedMediaKey objectForKeyedSubscript:0x1EFA74920];
    float v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", BWPhotoEncoderEncodingOptionsForAuxiliaryImage(a5.var0, *(uint64_t *)&a5 >> 32, objc_msgSend(v7, "pixelBufferAttributes"), -[BWPhotoEncoderControllerConfiguration usesHighEncodingPriority](self->_configuration, "usesHighEncodingPriority"), -[BWStillImageProcessorControllerConfiguration figThreadPriority](self->_configuration, "figThreadPriority")));
    if (!CMVideoFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], [v7 pixelFormat], a5.var0, a5.var1, 0, &formatDescriptionOut))
    {
      [v8 setObject:formatDescriptionOut forKeyedSubscript:*MEMORY[0x1E4F560D0]];
      [v9 addAuxImage:0 type:11 auxImageMetadata:0 options:v8 parentImageHandle:0 auxImageHandleOut:0];
    }
  }
}

- (void)_prewarmAndReserveMainImageHandleForEncodingScheme:(int)a3 prewarmingMetadata:(id)a4 stillImageSettings:(id)a5
{
  v15[2] = *MEMORY[0x1E4F143B8];
  if (a3 == 2)
  {
    id v9 = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:");
    unsigned int v5 = v9;
    if (v9)
    {
      if (([v9 isContainerOpen] & 1) == 0)
      {
        uint64_t v10 = *MEMORY[0x1E4F56048];
        v14[0] = *MEMORY[0x1E4F56058];
        v14[1] = v10;
        v15[0] = &unk_1EFB011F0;
        v15[1] = &unk_1EFB01208;
        int v11 = objc_msgSend(v5, "openContainerWithOptions:settingsID:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v15, v14, 2), objc_msgSend((id)objc_msgSend(a5, "requestedSettings"), "settingsID"));
        if (v11)
        {
          int v12 = v11;
          goto LABEL_8;
        }
      }
      [(BWPhotoEncoderController *)self _handlePrewarmForMainImageForEncodingScheme:2 prewarmingMetadata:a4 stillImageSettings:a5];
    }
    int v12 = 0;
  }
  else
  {
    int v12 = 0;
  }
LABEL_8:
  if (dword_1EB4C5590)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v12)
  {
    if ([v5 isContainerOpen]) {
      [v5 closeContainer];
    }
  }
}

- (void)_releaseResources
{
  [(BWPhotoEncoderController *)self _waitForPrewarmingQueueToComplete];

  self->_prewarmQueue = 0;
  [(BWPhotoEncoderController *)self _waitUntilTimeoutForInferenceGroupToCompleteAndReturnSuccess];

  self->_inferenceGroup = 0;
  [(BWPhotoEncoderController *)self _waitForPreviewGenerationGroupToComplete];

  self->_previewGenerationGroup = 0;
  [(BWPhotoEncoderController *)self _waitForPreviewGenerationQueueToComplete];

  self->_previewGenerationQueue = 0;
  self->_cmPhotoEncoderManager = 0;

  self->_dngEncoderManager = 0;
  self->_jpegPixelConverter = 0;

  self->_previewPixelConverter = 0;
  self->_thumbnailPixelConverter = 0;

  self->_clientThumbnailPixelConverter = 0;
  self->_inferenceEngine = 0;

  self->_inferenceInputVideoFormat = 0;
  inferenceInputFormatDescription = self->_inferenceInputFormatDescription;
  if (inferenceInputFormatDescription)
  {
    CFRelease(inferenceInputFormatDescription);
    self->_inferenceInputFormatDescription = 0;
  }

  self->_smartStyleProcessor = 0;
  smartStyleDeltaMapPixelBuffer = self->_smartStyleDeltaMapPixelBuffer;
  if (smartStyleDeltaMapPixelBuffer)
  {
    CFRelease(smartStyleDeltaMapPixelBuffer);
    self->_smartStyleDeltaMapPixelBuffer = 0;
  }
  smartStyleDecompressedStyledPixelBuffer = self->_smartStyleDecompressedStyledPixelBuffer;
  if (smartStyleDecompressedStyledPixelBuffer)
  {
    CFRelease(smartStyleDecompressedStyledPixelBuffer);
    self->_smartStyleDecompressedStyledPixelBuffer = 0;
  }
  [(BWPhotoEncoderController *)self _waitForPiecemealEncodingQueueToComplete];

  self->_encodingQueue = 0;
  [(BWPhotoEncoderController *)self _waitForPiecemealEncodingGroupToComplete];

  self->_encodingGroup = 0;
}

- (id)_encoderManagerForEncodingScheme:(int)a3
{
  if ((a3 - 1) > 3) {
    return 0;
  }
  else {
    return *(Class *)((char *)&self->super.super.isa + *off_1E5C2B338[a3 - 1]);
  }
}

- (int)_loadCreateAndSetupSmartStyleRenderingProcessor
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__BWPhotoEncoderController__loadCreateAndSetupSmartStyleRenderingProcessor__block_invoke;
  v5[3] = &unk_1E5C26228;
  v5[4] = self;
  p_smartStyleProcessor = &self->_smartStyleProcessor;
  int v3 = BWLoadCreateAndSetupMetalImageBufferProcessor(@"SmartStyle", [(BWPhotoEncoderControllerConfiguration *)self->_configuration smartStyleRenderingVersion], @"CMI", @"SmartStyle", [(BWPhotoEncoderControllerConfiguration *)self->_configuration smartStyleRenderingVersion], (uint64_t)&unk_1EFB6FEA8, 0, 0, 0, (uint64_t)v5, &self->_smartStyleProcessor);
  if (!v3)
  {
    [(CMISmartStyleProcessor *)*p_smartStyleProcessor setUseLiveMetalAllocations:1];
    [(CMISmartStyleProcessor *)*p_smartStyleProcessor setShouldFlushCVMTLTextureCacheAfterProcessing:1];
  }
  return v3;
}

uint64_t __75__BWPhotoEncoderController__loadCreateAndSetupSmartStyleRenderingProcessor__block_invoke(uint64_t a1, void *a2)
{
  int v3 = NSString;
  int v4 = [*(id *)(*(void *)(a1 + 32) + 56) deferredPhotoProcessorEnabled];
  unsigned int v5 = @"EncoderNode";
  if (v4) {
    unsigned int v5 = @"EncoderNode-Deferred";
  }
  [a2 setInstanceLabel:objc_msgSend(v3, "stringWithFormat:", @"%@", v5)];
  return 0;
}

- (BOOL)_depthEncodingNeededForSettings:(id)a3 deferredPhotoProxy:(BOOL)a4
{
  BOOL v4 = a4;
  char v6 = objc_msgSend((id)-[BWStillImageProcessorControllerInput encodedAttachedMediaKeys](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "encodedAttachedMediaKeys"), "containsObject:", @"Depth");
  if (objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "depthDataDeliveryEnabled")) {
    int v7 = objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "embedsDepthDataInImage");
  }
  else {
    int v7 = 0;
  }
  int v8 = BWCIFilterArrayContainsPortraitFilters(objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "processedImageFilters"));
  unint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "captureFlags");
  if (v6) {
    LOBYTE(v10) = 0;
  }
  else {
    return v7 & (!v4 | v8) | (v9 >> 38) & 1;
  }
  return v10;
}

- (BOOL)_personMaskEncodingNeededForSettings:(id)a3 encodingScheme:(int)a4 deferredPhotoProxy:(BOOL)a5 adjustedPhoto:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  char v11 = objc_msgSend((id)-[BWStillImageProcessorControllerInput encodedAttachedMediaKeys](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "encodedAttachedMediaKeys"), "containsObject:", 0x1EFA74420);
  if (objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "portraitEffectsMatteDeliveryEnabled")) {
    char v12 = objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "embedsPortraitEffectsMatteInImage");
  }
  else {
    char v12 = 0;
  }
  char v13 = BWCIFilterArrayContainsPortraitFilters(objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "processedImageFilters"));
  BOOL IsLinDNGEncodingScheme = BWPhotoEncoderIsLinDNGEncodingScheme(a4);
  if ([(BWPhotoEncoderController *)self _smartStyleReversibilityDataNeededForSettings:a3 adjustedPhoto:v6 deferredPhotoProxy:v7])
  {
    BOOL v15 = [(NSDictionary *)[(BWPhotoEncoderControllerConfiguration *)self->_configuration attachedMediaConfigurationByAttachedMediaKey] objectForKeyedSubscript:0x1EFA74420] != 0;
  }
  else
  {
    BOOL v15 = 0;
  }
  char v16 = v12 & (!v7 | v13) | (IsLinDNGEncodingScheme || v15);
  if (v11) {
    return 0;
  }
  else {
    return v16;
  }
}

- (id)_semanticSegmentationMatteMediaKeysEncodingNeededForSettings:(id)a3 encodingScheme:(int)a4 deferredPhotoProxy:(BOOL)a5 adjustedPhoto:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  char v11 = (void *)[MEMORY[0x1E4F1CA48] array];
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "enabledSemanticSegmentationMatteURNs"), "count"))
  {
    int v12 = objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "embedsSemanticSegmentationMattesInImage");
  }
  else
  {
    int v12 = 0;
  }
  int v13 = BWCIFilterArrayContainsPortraitFilters(objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "processedImageFilters"));
  BOOL IsLinDNGEncodingScheme = BWPhotoEncoderIsLinDNGEncodingScheme(a4);
  BOOL v15 = [(BWPhotoEncoderController *)self _smartStyleReversibilityDataNeededForSettings:a3 adjustedPhoto:v6 deferredPhotoProxy:v7];
  if (v12)
  {
    if (!v7 | v13)
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      char v16 = objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "enabledSemanticSegmentationMatteURNs");
      uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v34;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v34 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = BWPhotoEncoderAttachedMediaKeyForSemanticSegmentationMatteURN(*(void **)(*((void *)&v33 + 1)
                                                                                         + 8 * v20));
            if ((objc_msgSend((id)-[BWStillImageProcessorControllerInput encodedAttachedMediaKeys](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "encodedAttachedMediaKeys"), "containsObject:", v21) & 1) == 0)objc_msgSend(v11, "addObject:", v21); {
            ++v20;
            }
          }
          while (v18 != v20);
          uint64_t v18 = [v16 countByEnumeratingWithState:&v33 objects:v38 count:16];
        }
        while (v18);
      }
    }
  }
  if (IsLinDNGEncodingScheme || v15)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    double v22 = [(BWPhotoEncoderControllerConfiguration *)self->_configuration attachedMediaConfigurationByAttachedMediaKey];
    uint64_t v23 = [(NSDictionary *)v22 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v30;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v30 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void **)(*((void *)&v29 + 1) + 8 * v26);
          if ((objc_msgSend((id)-[BWStillImageProcessorControllerInput encodedAttachedMediaKeys](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "encodedAttachedMediaKeys"), "containsObject:", v27) & 1) == 0&& objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[BWPhotoEncoderControllerConfiguration attachedMediaConfigurationByAttachedMediaKey](self->_configuration, "attachedMediaConfigurationByAttachedMediaKey"), "objectForKeyedSubscript:", v27), "requiresEncoding")&& BWPhotoEncoderSemanticSegmentationMatteURNForAttachedMediaKey(v27))
          {
            [v11 addObject:v27];
          }
          ++v26;
        }
        while (v24 != v26);
        uint64_t v24 = [(NSDictionary *)v22 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v24);
    }
  }
  return v11;
}

- (BOOL)_smartStyleReversibilityDataNeededForSettings:(id)a3 adjustedPhoto:(BOOL)a4 deferredPhotoProxy:(BOOL)a5
{
  BOOL v8 = [(BWPhotoEncoderControllerConfiguration *)self->_configuration smartStyleReversibilityEnabled];
  if (v8)
  {
    if (objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "smartStyleReversibilitySupported")) {
      LOBYTE(v8) = !a4 && !a5;
    }
    else {
      LOBYTE(v8) = 0;
    }
  }
  return v8;
}

- (BOOL)_finalImageExpectingSmartStyleReversibilityDataForDeferredPhotoProxy:(BOOL)a3 settings:(id)a4 adjustedPhoto:(BOOL)a5
{
  if (a3)
  {
    BOOL v7 = [(BWPhotoEncoderControllerConfiguration *)self->_configuration smartStyleReversibilityEnabled];
    if (v7) {
      LOBYTE(v7) = objc_msgSend((id)objc_msgSend(a4, "requestedSettings"), "smartStyleReversibilitySupported") & !a5;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)_performInferenceWithBuffer:(opaqueCMSampleBuffer *)a3
{
  inferenceGroup = self->_inferenceGroup;
  previewGenerationQueue = self->_previewGenerationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__BWPhotoEncoderController__performInferenceWithBuffer___block_invoke;
  v5[3] = &unk_1E5C24F10;
  v5[4] = self;
  void v5[5] = a3;
  dispatch_group_async(inferenceGroup, previewGenerationQueue, v5);
}

uint64_t __56__BWPhotoEncoderController__performInferenceWithBuffer___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 192)) {
    goto LABEL_5;
  }
  uint64_t result = objc_msgSend(*(id *)(v2 + 184), "prepareForInputVideoFormat:attachedMediaKey:", objc_msgSend(*(id *)(v2 + 88), "outputFormat"), @"PrimaryFormat");
  if (!result)
  {
    uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 184), "prepareForInferenceWithFormatProvider:");
    if (!result)
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 192) = 1;
      uint64_t v2 = *(void *)(a1 + 32);
LABEL_5:
      uint64_t result = [*(id *)(v2 + 184) performInferencesOnSampleBuffer:*(void *)(a1 + 40) attachingResultsToSampleBuffer:*(void *)(a1 + 40)];
    }
  }
  atomic_store(1u, (unsigned __int8 *)(*(void *)(a1 + 32) + 193));
  return result;
}

- (CGRect)_cropRectForRequestedSettings:(id)a3 inputDimensions:(id)a4 metadata:(id)a5 processingFlags:(unsigned int)a6
{
  BOOL v10 = (long long *)MEMORY[0x1E4F1DB28];
  CGFloat v11 = *MEMORY[0x1E4F1DB28];
  CGFloat v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  if (!objc_msgSend((id)objc_msgSend(a3, "bravoConstituentImageDeliveryDeviceTypes"), "count"))
  {
    double v30 = v12;
    if (FigCaptureVideoDimensionsAreValid([(BWPhotoEncoderControllerConfiguration *)self->_configuration stereoPhotoOutputDimensions])&& [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] isStereoPhotoCapture]&& !BWPhotoEncoderIsPrimaryFrame(a6))
    {
      int v15 = (int)[(BWPhotoEncoderControllerConfiguration *)self->_configuration stereoPhotoOutputDimensions];
      unint64_t v16 = (unint64_t)[(BWPhotoEncoderControllerConfiguration *)self->_configuration stereoPhotoOutputDimensions] >> 32;
    }
    else
    {
      int v15 = [a3 outputWidth];
      LODWORD(v16) = [a3 outputHeight];
    }
    long long v31 = *v10;
    long long v32 = v10[1];
    FigCFDictionaryGetCGRectIfPresent();
    [(BWPhotoEncoderController *)self _aspectRatioAdjustmentFactorForSettings:a3];
    double v18 = v17;
    FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect(a4.var0, *(uint64_t *)&a4 >> 32, *(CGFloat *)&v31, *((CGFloat *)&v31 + 1), *(CGFloat *)&v32, *((CGFloat *)&v32 + 1), (double)v15 / (double)(int)v16 * v17);
    CGFloat x = v33.origin.x;
    CGFloat y = v33.origin.y;
    double width = v33.size.width;
    double height = v33.size.height;
    if (CGRectIsNull(v33))
    {
      FigDebugAssert3();
      CGFloat v12 = v30;
    }
    else
    {
      BOOL v23 = width == (double)v15 && height == (double)(int)v16;
      BOOL v24 = v23 && (v15 != a4.var0 || v16 != a4.var1);
      BOOL v23 = v18 == 1.0;
      CGFloat v12 = v30;
      if (!v23 || v24)
      {
        double v13 = height;
        double v14 = width;
        CGFloat v12 = y;
        CGFloat v11 = x;
      }
    }
  }
  double v26 = v11;
  double v27 = v12;
  double v28 = v14;
  double v29 = v13;
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.CGFloat y = v27;
  result.origin.CGFloat x = v26;
  return result;
}

- (void)_addQualityOptionsToDictionary:(id)a3 codecType:(unsigned int)a4 pixelBuffer:(__CVBuffer *)a5 imageDimensions:(id)a6 metadata:(id)a7 requestedStillImageCaptureSettings:(id)a8 resolvedStillImageCaptureSettings:(id)a9 enableHEIFTiling:(BOOL)a10 enableHEIFOrientation:(BOOL)a11 auxImageType:(int)a12
{
  v70[1] = *MEMORY[0x1E4F143B8];
  [a3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F56118]];
  if (a4 == 1752589105)
  {
    uint64_t v24 = [NSNumber numberWithBool:a10];
    [a3 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F56180]];
    uint64_t v25 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    double v27 = self;
    adaptiveQualityValueForHEIF = self->_adaptiveQualityValueForHEIF;
    if (adaptiveQualityValueForHEIF)
    {
      if (a6.var1 * a6.var0 <= 11999999) {
        double v29 = @"Default";
      }
      else {
        double v29 = @"12MPAndLarger";
      }
      objc_msgSend(-[NSDictionary objectForKeyedSubscript:](adaptiveQualityValueForHEIF, "objectForKeyedSubscript:", v29), "floatValue");
      float v31 = v30;
      uint64_t v32 = objc_msgSend(NSNumber, "numberWithFloat:");
      [v25 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4F56358]];
    }
    else
    {
      float v31 = 0.85;
    }
    uint64_t v41 = v25;
    *(float *)&double v26 = self->_heifQualityOverride;
    char v42 = 0;
    id v43 = a8;
    if (a12 == 12)
    {
      objc_msgSend(a8, "smartStyle", v26);
      float v44 = BWPhotoEncoderHEIFDeltaMapDownscalingFactor();
      if (v44 > 1.0)
      {
        if (a6.var0 <= a6.var1) {
          int var1 = a6.var1;
        }
        else {
          int var1 = a6.var0;
        }
        uint64_t v46 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", vcvts_n_u32_f32(floorf((float)((float)((float)(unint64_t)var1 / v44) + 63.0) * 0.015625), 6uLL));
        [a3 setObject:v46 forKeyedSubscript:*MEMORY[0x1E4F56120]];
      }
      float v31 = BWPhotoEncoderHEIFDeltaMapQuality((void *)[a8 smartStyle]);
      char v42 = 1;
    }
    if (v31 < 0.0) {
      float v31 = 0.0;
    }
    int v47 = objc_msgSend((id)objc_msgSend(a7, "objectForKeyedSubscript:", *MEMORY[0x1E4F53258]), "intValue");
    if (a7) {
      BOOL v48 = 1;
    }
    else {
      BOOL v48 = a5 == 0;
    }
    if (!v48 || (v42 & 1) != 0 || v47 == 4)
    {
      float v52 = fminf(v31, 1.0);
      uint64_t v53 = *MEMORY[0x1E4F56158];
      if (v52 == 1.0)
      {
        [a3 setObject:&unk_1EFB01238 forKeyedSubscript:v53];
        BOOL v54 = a11;
        v55 = v41;
LABEL_51:
        if ([v55 count]) {
          [a3 setObject:v55 forKeyedSubscript:*MEMORY[0x1E4F56150]];
        }
        if (v54)
        {
          v57 = (void *)[a9 masterPortType];
          if ([v57 isEqualToString:*MEMORY[0x1E4F52DF8]])
          {
            int v58 = 1;
          }
          else
          {
            unsigned int v59 = (void *)[a9 masterPortType];
            int v58 = [v59 isEqualToString:*MEMORY[0x1E4F52E10]];
          }
          BOOL IsExtensionDeviceType = BWDeviceTypeIsExtensionDeviceType(objc_msgSend((id)objc_msgSend(a7, "objectForKeyedSubscript:", *MEMORY[0x1E4F53DE0]), "integerValue"));
          uint64_t v61 = FigCaptureMetadataUtilitiesExifOrientationFromOrientationAndCameraPosition([v43 outputOrientation], objc_msgSend(v43, "outputMirroring"), v58, IsExtensionDeviceType, 0);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v62 = (void *)[v43 metadata];
            unsigned int v63 = objc_msgSend((id)objc_msgSend(v62, "objectForKeyedSubscript:", *MEMORY[0x1E4F2FCA0]), "intValue");
            if (v63) {
              uint64_t v61 = v63;
            }
            else {
              uint64_t v61 = v61;
            }
          }
          uint64_t v64 = [NSNumber numberWithInt:v61];
          uint64_t v65 = *MEMORY[0x1E4F560F8];
          [a3 setObject:v64 forKeyedSubscript:v65];
        }
        return;
      }
      [a3 setObject:&unk_1EFB01220 forKeyedSubscript:v53];
      *(float *)&double v56 = v52;
      uint64_t v50 = (void *)[NSNumber numberWithFloat:v56];
      unsigned int v51 = (void *)MEMORY[0x1E4F56358];
    }
    else
    {
      BOOL IsHighGainImage = BWPhotoEncoderIsHighGainImage((BOOL)a7, [a9 captureType], -[BWPhotoEncoderControllerConfiguration zeroShutterLagEnabled](v27->_configuration, "zeroShutterLagEnabled"));
      [a3 setObject:&unk_1EFB01250 forKeyedSubscript:*MEMORY[0x1E4F56158]];
      if (IsHighGainImage) {
        uint64_t v50 = &unk_1EFB01208;
      }
      else {
        uint64_t v50 = &unk_1EFB01220;
      }
      unsigned int v51 = (void *)MEMORY[0x1E4F56350];
    }
    v55 = v41;
    [v41 setObject:v50 forKeyedSubscript:*v51];
    BOOL v54 = a11;
    goto LABEL_51;
  }
  if (a4 != 1785750887) {
    return;
  }
  double v18 = self;
  uint64_t v19 = (void *)[a8 vtCompressionProperties];
  uint64_t v20 = (void *)[v19 objectForKeyedSubscript:*MEMORY[0x1E4F44AB0]];
  uint64_t v21 = v20;
  if (v20)
  {
    [v20 floatValue];
    float v23 = v22;
  }
  else
  {
    float v23 = 0.85;
  }
  int v33 = objc_msgSend((id)objc_msgSend(a7, "objectForKeyedSubscript:", *MEMORY[0x1E4F53258]), "intValue");
  if (a7) {
    BOOL v34 = 1;
  }
  else {
    BOOL v34 = a5 == 0;
  }
  if (!v34 || (!v21 ? (BOOL v35 = v33 == 4) : (BOOL v35 = 1), v35))
  {
    float v38 = 0.0;
    if (v23 >= 0.0) {
      float v38 = v23;
    }
    float v39 = fminf(v38, 1.0);
    id v36 = a3;
    [a3 setObject:&unk_1EFB01220 forKeyedSubscript:*MEMORY[0x1E4F56158]];
    uint64_t v69 = *MEMORY[0x1E4F56358];
    *(float *)&double v40 = v39;
    v70[0] = [NSNumber numberWithFloat:v40];
    uint64_t v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:&v69 count:1];
    goto LABEL_25;
  }
  char v68 = 0;
  unsigned int v67 = 0;
  if (!BWPhotoEncoderDefaultJPEGIndexedQTable(a5, (BOOL)a7, [a9 captureType], (int *)&v67, &v68, -[BWPhotoEncoderControllerConfiguration zeroShutterLagEnabled](v18->_configuration, "zeroShutterLagEnabled")))
  {
    id v36 = a3;
    [a3 setObject:&unk_1EFB01208 forKeyedSubscript:*MEMORY[0x1E4F56158]];
    uint64_t v37 = [NSNumber numberWithInt:v67];
LABEL_25:
    [v36 setObject:v37 forKeyedSubscript:*MEMORY[0x1E4F56150]];
    return;
  }
  FigDebugAssert3();
}

- (int)_optionsForEncodingScheme:(int)a3 pixelBuffer:(__CVBuffer *)a4 imageDimensions:(id)a5 processingFlags:(unsigned int)a6 metadata:(id)a7 thumbnailOptions:(id)a8 requestedStillImageCaptureSettings:(id)a9 resolvedStillImageCaptureSettings:(id)a10 cropRect:(CGRect)a11 usePixelsOutsideCrop:(BOOL)a12 containerOptionsOut:(id *)a13 encodingOptionsOut:(id *)a14
{
  CGFloat height = a11.size.height;
  CGFloat width = a11.size.width;
  CGFloat y = a11.origin.y;
  CGFloat x = a11.origin.x;
  uint64_t v21 = *(void *)&a3;
  float v23 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", *(void *)&a3, a4, a5, *(void *)&a6);
  uint64_t v24 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if ([(BWPhotoEncoderController *)self _encoderManagerForEncodingScheme:v21])
  {
    v34.origin.CGFloat x = x;
    v34.origin.CGFloat y = y;
    v34.size.CGFloat width = width;
    v34.size.CGFloat height = height;
    if (!CGRectIsEmpty(v34))
    {
      v35.origin.CGFloat x = x;
      v35.origin.CGFloat y = y;
      v35.size.CGFloat width = width;
      v35.size.CGFloat height = height;
      CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v35);
      [v24 setObject:DictionaryRepresentation forKeyedSubscript:*MEMORY[0x1E4F56170]];
      if (DictionaryRepresentation) {
        CFRelease(DictionaryRepresentation);
      }
    }
    if (a12) {
      [v24 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F56198]];
    }
    uint64_t v26 = BWPhotoEncoderCodecTypeForEncodingScheme(v21);
    BOOL v27 = v21 == 2 && self->_heifUseTiling;
    LOBYTE(v32) = v27;
    BYTE1(v32) = v21 == 2;
    -[BWPhotoEncoderController _addQualityOptionsToDictionary:codecType:pixelBuffer:imageDimensions:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:enableHEIFTiling:enableHEIFOrientation:auxImageType:](self, "_addQualityOptionsToDictionary:codecType:pixelBuffer:imageDimensions:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:enableHEIFTiling:enableHEIFOrientation:auxImageType:", v24, v26, a4, a5, a7, a9, a10, v32);
    uint64_t v28 = [NSNumber numberWithUnsignedInt:v26];
    [v24 setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F560B8]];
    if ([(BWPhotoEncoderControllerConfiguration *)self->_configuration usesHighEncodingPriority])
    {
      [v24 setObject:&unk_1EFB011D8 forKeyedSubscript:*MEMORY[0x1E4F56140]];
    }
    uint64_t v29 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BWStillImageProcessorControllerConfiguration figThreadPriority](self->_configuration, "figThreadPriority"));
    [v24 setObject:v29 forKeyedSubscript:*MEMORY[0x1E4F56178]];
    objc_msgSend(v23, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", BWPhotoEncoderContainerFormatForEncodingScheme(v21)), *MEMORY[0x1E4F56058]);
    [v23 setObject:&unk_1EFB01208 forKeyedSubscript:*MEMORY[0x1E4F56048]];
    if (v21 == 1)
    {
      [v24 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F56118]];
      if (![a9 payloadType]) {
        [v24 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F560F0]];
      }
    }
    if ([(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] requiresPhotosAdjustment])
    {
      [v24 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F56090]];
      uint64_t v30 = [a7 objectForKeyedSubscript:*MEMORY[0x1E4F53248]];
      [v24 setObject:v30 forKeyedSubscript:*MEMORY[0x1E4F560F8]];
    }
    [v24 setObject:a8 forKeyedSubscript:*MEMORY[0x1E4F56108]];
  }
  if (a13) {
    *a13 = v23;
  }
  if (a14) {
    *a14 = v24;
  }
  return 0;
}

- (int)_encodePhotoForEncodingScheme:(int)a3 pixelBuffer:(__CVBuffer *)a4 imageDimensions:(id)a5 processingFlags:(unsigned int)a6 metadata:(id)a7 thumbnailOptions:(id)a8 requestedStillImageCaptureSettings:(id)a9 resolvedStillImageCaptureSettings:(id)a10 cropRect:(CGRect)a11 usePixelsOutsideCrop:(BOOL)a12 usedContainerOptionsOut:(id *)a13 usedEncodingOptionsOut:(id *)a14 mainImageHandleInOut:(int64_t *)a15
{
  uint64_t v17 = *(void *)&a6;
  double height = a11.size.height;
  double width = a11.size.width;
  double y = a11.origin.y;
  double x = a11.origin.x;
  uint64_t v23 = *(void *)&a3;
  uint64_t v25 = a15;
  uint64_t v26 = a13;
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v92 = 0;
  uint64_t v93 = 0;
  if (a15) {
    int64_t v27 = *a15;
  }
  else {
    int64_t v27 = -1;
  }
  uint64_t v28 = a14;
  int64_t v91 = v27;
  id v79 = [(BWPhotoEncoderController *)self _encoderManagerForEncodingScheme:*(void *)&a3];
  if (!v79) {
    goto LABEL_56;
  }
  LOBYTE(v74) = a12;
  int v29 = -[BWPhotoEncoderController _optionsForEncodingScheme:pixelBuffer:imageDimensions:processingFlags:metadata:thumbnailOptions:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:cropRect:usePixelsOutsideCrop:containerOptionsOut:encodingOptionsOut:](self, "_optionsForEncodingScheme:pixelBuffer:imageDimensions:processingFlags:metadata:thumbnailOptions:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:cropRect:usePixelsOutsideCrop:containerOptionsOut:encodingOptionsOut:", v23, a4, a5, v17, a7, a8, x, y, width, height, a9, a10, v74, &v93, &v92);
  if (v29)
  {
    int v69 = v29;
    uint64_t v73 = v76;
    LODWORD(v72) = v29;
    FigDebugAssert3();
    goto LABEL_70;
  }
  uint64_t v30 = v79;
  int v31 = [v79 isContainerOpen];
  if (!v31 || v27 == -1)
  {
    if (!v31) {
      goto LABEL_13;
    }
    if [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] receivedFramesCount] > 1|| ([(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] isStereoPhotoCapture])
    {
      goto LABEL_14;
    }
    int v33 = [v79 closeContainer];
    if (v33)
    {
      int v69 = v33;
      uint64_t v73 = v76;
      LODWORD(v72) = v33;
    }
    else
    {
LABEL_13:
      int v34 = objc_msgSend(v79, "openContainerWithOptions:settingsID:", v93, objc_msgSend(a9, "settingsID"));
      if (!v34) {
        goto LABEL_14;
      }
      int v69 = v34;
      uint64_t v73 = v76;
      LODWORD(v72) = v34;
    }
LABEL_47:
    FigDebugAssert3();
    uint64_t v28 = a14;
    goto LABEL_48;
  }
  uint64_t v32 = [NSNumber numberWithLong:v27];
  [v92 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4F56148]];
LABEL_14:
  if (![(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] isStereoPhotoCapture])
  {
    CGRect v35 = a4;
    int v37 = 0;
    int v77 = 0;
    int v36 = 0;
    goto LABEL_38;
  }
  if (BWPhotoEncoderIsPrimaryFrame(v17))
  {
    CGRect v35 = a4;
    [v92 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F56138]];
    int v77 = 0;
    int v36 = 0;
    int v37 = 1;
LABEL_38:
    uint64_t v66 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BWStillImageProcessorControllerConfiguration figThreadPriority](self->_configuration, "figThreadPriority"));
    [v92 setObject:v66 forKeyedSubscript:*MEMORY[0x1E4F56178]];
    if (v27 == -1) {
      unsigned int v67 = &v91;
    }
    else {
      unsigned int v67 = 0;
    }
    int v68 = [v30 addMainImage:v35 metadata:0 options:v92 imageHandleOut:v67];
    if (v68 == -17109 || (int v69 = v68) == 0)
    {
      long long v84 = 0uLL;
      int64_t v85 = 0;
      v70 = [(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input];
      uint64_t v28 = a14;
      if (v70)
      {
        [(BWStillImageProcessorControllerInput *)v70 stereoPhotoImageHandles];
        if (v37)
        {
LABEL_45:
          *(void *)&long long v84 = v91;
LABEL_55:
          long long v82 = v84;
          int64_t v83 = v85;
          long long v80 = v84;
          int64_t v81 = v85;
          [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] setStereoPhotoImageHandles:&v80];
LABEL_56:
          int v69 = 0;
          goto LABEL_57;
        }
      }
      else
      {
        long long v84 = 0uLL;
        int64_t v85 = 0;
        if (v37) {
          goto LABEL_45;
        }
      }
      if (v77)
      {
        *((void *)&v84 + 1) = v91;
      }
      else if (v36)
      {
        int64_t v85 = v91;
      }
      goto LABEL_55;
    }
    uint64_t v73 = v76;
    LODWORD(v72) = v68;
    goto LABEL_47;
  }
  int IsLeftEyeFrameForCurrentRequest = BWPhotoEncoderIsLeftEyeFrameForCurrentRequest(a7);
  uint64_t v39 = *MEMORY[0x1E4F54128];
  double v40 = (void *)[a7 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
  uint64_t v41 = *MEMORY[0x1E4F52DD8];
  int v77 = IsLeftEyeFrameForCurrentRequest;
  if ([v40 isEqual:*MEMORY[0x1E4F52DD8]])
  {
    if (IsLeftEyeFrameForCurrentRequest) {
      uint64_t v42 = 1;
    }
    else {
      uint64_t v42 = 2;
    }
    id v43 = [(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input];
    uint64_t v44 = v42;
    int IsLeftEyeFrameForCurrentRequest = v77;
    [(BWStillImageProcessorControllerInput *)v43 setMonoImageLocationType:v44];
  }
  uint64_t v45 = (void *)[a7 objectForKeyedSubscript:v39];
  uint64_t v46 = *MEMORY[0x1E4F52DE8];
  int v47 = [v45 isEqual:*MEMORY[0x1E4F52DE8]];
  double v48 = 0.0;
  if (v47)
  {
    uint64_t v75 = v46;
    uint64_t v49 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", 0.0);
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    uint64_t v50 = [(BWStillImageProcessorControllerConfiguration *)self->_configuration sensorConfigurationsByPortType];
    uint64_t v51 = [(NSDictionary *)v50 countByEnumeratingWithState:&v87 objects:v96 count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)v88;
      do
      {
        for (uint64_t i = 0; i != v52; ++i)
        {
          if (*(void *)v88 != v53) {
            objc_enumerationMutation(v50);
          }
          objc_msgSend(v49, "setObject:forKeyedSubscript:", objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[BWStillImageProcessorControllerConfiguration sensorConfigurationsByPortType](self->_configuration, "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", *(void *)(*((void *)&v87 + 1) + 8 * i)), "cameraInfo"), *(void *)(*((void *)&v87 + 1) + 8 * i));
        }
        uint64_t v52 = [(NSDictionary *)v50 countByEnumeratingWithState:&v87 objects:v96 count:16];
      }
      while (v52);
    }
    float v86 = 0.0;
    int v55 = BWStereoUtilitiesComputeStereoBaseline(v41, v75, v49, &v86);
    if (v55)
    {
      int v69 = v55;
      uint64_t v73 = v76;
      LODWORD(v72) = v55;
      FigDebugAssert3();
      uint64_t v26 = a13;
      uint64_t v25 = a15;
      goto LABEL_70;
    }
    float v56 = v86;
    int IsLeftEyeFrameForCurrentRequest = v77;
    if (v77) {
      float v56 = -v86;
    }
    *(float *)&double v48 = v56 / 1000.0;
    uint64_t v26 = a13;
    uint64_t v25 = a15;
  }
  v95[0] = [NSNumber numberWithFloat:v48];
  v95[1] = &unk_1EFB059C8;
  v95[2] = &unk_1EFB059C8;
  uint64_t v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:3];
  int v58 = (void *)[a7 objectForKeyedSubscript:*MEMORY[0x1E4F53538]];
  if (v58)
  {
    unsigned int v59 = (void *)[v58 objectForKeyedSubscript:*MEMORY[0x1E4F53610]];
    if (v59)
    {
      CGRect v35 = a4;
      int v36 = IsLeftEyeFrameForCurrentRequest ^ 1;
      [v59 doubleValue];
      double v61 = __tanpi(v60 / 360.0);
      double v62 = (double)a5.var0 / (v61 + v61);
      v94[0] = [NSNumber numberWithDouble:v62];
      v94[1] = &unk_1EFB059C8;
      v94[2] = [NSNumber numberWithDouble:(double)a5.var0 * 0.5];
      v94[3] = &unk_1EFB059C8;
      v94[4] = [NSNumber numberWithDouble:v62];
      v94[5] = [NSNumber numberWithDouble:(double)a5.var1 * 0.5];
      v94[6] = &unk_1EFB059C8;
      v94[7] = &unk_1EFB059C8;
      v94[8] = &unk_1EFB059D8;
      unsigned int v63 = v26;
      uint64_t v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:9];
      [v92 setObject:v57 forKeyedSubscript:*MEMORY[0x1E4F560D8]];
      [v92 setObject:&unk_1EFB04208 forKeyedSubscript:*MEMORY[0x1E4F560E0]];
      uint64_t v65 = v64;
      uint64_t v26 = v63;
      [v92 setObject:v65 forKeyedSubscript:*MEMORY[0x1E4F56110]];
      int v37 = 0;
      uint64_t v30 = v79;
      goto LABEL_38;
    }
    uint64_t v73 = v76;
    LODWORD(v72) = 0;
  }
  else
  {
    uint64_t v73 = v76;
    LODWORD(v72) = 0;
  }
  FigDebugAssert3();
  int v69 = -12783;
LABEL_70:
  uint64_t v28 = a14;
  uint64_t v30 = v79;
LABEL_48:
  if (objc_msgSend(v30, "isContainerOpen", v72, v73)) {
    [v30 closeContainer];
  }
LABEL_57:
  if (v26) {
    *uint64_t v26 = v93;
  }
  if (v28) {
    *uint64_t v28 = v92;
  }
  if (v25) {
    *uint64_t v25 = v91;
  }
  return v69;
}

- (int)_encodeDNGForEncodingScheme:(int)a3 rawSampleBuffer:(opaqueCMSampleBuffer *)a4 dngDictionary:(id)a5 requestedSettings:(id)a6 captureType:(int)a7 cropRect:(CGRect)a8 dngContainsDepthData:(BOOL)a9 dngContainsSemanticSegmentationMattes:(BOOL)a10 processingFlags:(unsigned int)a11
{
  BOOL v12 = a9;
  CGFloat height = a8.size.height;
  CGFloat width = a8.size.width;
  CGFloat y = a8.origin.y;
  CGFloat x = a8.origin.x;
  uint64_t v21 = *(void *)&a3;
  id v23 = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:");
  if (!v23)
  {
    int v42 = 0;
    id v39 = 0;
    goto LABEL_21;
  }
  uint64_t v24 = v23;
  unsigned int v46 = a7;
  uint64_t v25 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  unsigned int v26 = [a6 rawOutputFileBitDepth];
  if (v26) {
    unint64_t dngBitDepth = v26;
  }
  else {
    unint64_t dngBitDepth = self->_dngBitDepth;
  }
  uint64_t v28 = [NSNumber numberWithUnsignedLong:dngBitDepth];
  [v25 setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F56200]];
  uint64_t v29 = [NSNumber numberWithUnsignedLong:self->_maxThreads];
  [v25 setObject:v29 forKeyedSubscript:*MEMORY[0x1E4F56228]];
  [v25 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F56238]];
  uint64_t v30 = [a5 objectForKeyedSubscript:*MEMORY[0x1E4F533A0]];
  if (v30) {
    [v25 setObject:v30 forKeyedSubscript:*MEMORY[0x1E4F561F8]];
  }
  if (v21 == 4)
  {
    [v25 setObject:&unk_1EFB01268 forKeyedSubscript:*MEMORY[0x1E4F56210]];
    int v31 = BWIsDeferredPhotoProxyImage(a11);
    uint64_t v32 = *MEMORY[0x1E4F56218];
    if (v31)
    {
      [v25 setObject:&unk_1EFB01250 forKeyedSubscript:v32];
      uint64_t v33 = *MEMORY[0x1E4F56220];
      int v34 = &unk_1EFB05848;
LABEL_14:
      [v25 setObject:v34 forKeyedSubscript:v33];
      goto LABEL_15;
    }
    [v25 setObject:&unk_1EFB01220 forKeyedSubscript:v32];
LABEL_13:
    int v36 = NSNumber;
    [a6 rawOutputFileCodecQuality];
    int v34 = objc_msgSend(v36, "numberWithFloat:");
    uint64_t v33 = *MEMORY[0x1E4F56220];
    goto LABEL_14;
  }
  [a6 rawOutputFileCodecQuality];
  if (v35 != 0.0) {
    goto LABEL_13;
  }
LABEL_15:
  v47.origin.CGFloat x = x;
  v47.origin.CGFloat y = y;
  v47.size.CGFloat width = width;
  v47.size.CGFloat height = height;
  if (!CGRectIsEmpty(v47))
  {
    v48.origin.CGFloat x = x;
    v48.origin.CGFloat y = y;
    v48.size.CGFloat width = width;
    v48.size.CGFloat height = height;
    [v25 setObject:CGRectCreateDictionaryRepresentation(v48) forKeyedSubscript:*MEMORY[0x1E4F56240]];
  }
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a4);
  if (!ImageBuffer)
  {
    id v39 = 0;
    goto LABEL_24;
  }
  CVImageBufferRef v38 = ImageBuffer;
  LOBYTE(v44) = a10;
  id v39 = [(BWPhotoEncoderController *)self _newRawMetadataAttachmentsForEncodingScheme:v21 sampleBuffer:a4 dngDictionary:a5 requestedSettings:a6 captureType:v46 dngContainsDepthData:v12 dngContainsSemanticSegmentationMattes:v44];
  if (!v39)
  {
LABEL_24:
    int v42 = -12780;
    goto LABEL_28;
  }
  int v40 = objc_msgSend(v24, "openContainerWithOptions:settingsID:", 0, objc_msgSend(a6, "settingsID"));
  if (v40)
  {
    int v42 = v40;
    uint64_t v45 = v11;
    LODWORD(v44) = v40;
  }
  else
  {
    int v41 = [v24 addMainImage:v38 metadata:v39 options:v25 imageHandleOut:0];
    int v42 = v41;
    if (!v41) {
      goto LABEL_21;
    }
    uint64_t v45 = v11;
    LODWORD(v44) = v41;
  }
  FigDebugAssert3();
LABEL_28:
  if (objc_msgSend(v24, "isContainerOpen", v44, v45)) {
    [v24 closeContainer];
  }
LABEL_21:

  return v42;
}

- (id)_thumbnailOptionsForImageWithMetadata:(id)a3 requestedStillImageCaptureSettings:(id)a4 resolvedStillImageCaptureSettings:(id)a5 processingFlags:(unsigned int)a6 cropRect:(CGRect)a7 codecType:(unsigned int)a8 maxPixelSize:(unint64_t)a9
{
  uint64_t v10 = *(void *)&a8;
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3, a4, a5, *(void *)&a6);
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  if (!CGRectIsEmpty(v27))
  {
    v28.origin.CGFloat x = x;
    v28.origin.CGFloat y = y;
    v28.size.CGFloat width = width;
    v28.size.CGFloat height = height;
    CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v28);
    [v19 setObject:DictionaryRepresentation forKeyedSubscript:*MEMORY[0x1E4F56170]];
    if (DictionaryRepresentation) {
      CFRelease(DictionaryRepresentation);
    }
  }
  LOWORD(v26) = 0;
  -[BWPhotoEncoderController _addQualityOptionsToDictionary:codecType:pixelBuffer:imageDimensions:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:enableHEIFTiling:enableHEIFOrientation:auxImageType:](self, "_addQualityOptionsToDictionary:codecType:pixelBuffer:imageDimensions:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:enableHEIFTiling:enableHEIFOrientation:auxImageType:", v19, v10, 0, [a4 thumbnailWidth] | (unint64_t)(objc_msgSend(a4, "thumbnailHeight") << 32), a3, a4, a5, v26);
  uint64_t v21 = [NSNumber numberWithUnsignedInt:v10];
  [v19 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F560B8]];
  uint64_t v22 = [NSNumber numberWithUnsignedLong:a9];
  [v19 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F56120]];
  if ([(BWPhotoEncoderControllerConfiguration *)self->_configuration usesHighEncodingPriority])
  {
    [v19 setObject:&unk_1EFB011D8 forKeyedSubscript:*MEMORY[0x1E4F56140]];
  }
  uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BWStillImageProcessorControllerConfiguration figThreadPriority](self->_configuration, "figThreadPriority"));
  [v19 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F56178]];
  if ([(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] requiresPhotosAdjustment])
  {
    [v19 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F56090]];
    uint64_t v24 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F53248]];
    [v19 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F560F8]];
  }
  if ([a4 outputFormat] == 1785750887)
  {
    [v19 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F56118]];
    if (![a4 payloadType]) {
      [v19 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F560F0]];
    }
  }
  return v19;
}

- (int)_addThumbnailForEncodingScheme:(int)a3 thumbnailPixelBuffer:(__CVBuffer *)a4 metadata:(id)a5 requestedStillImageCaptureSettings:(id)a6 resolvedStillImageCaptureSettings:(id)a7 processingFlags:(unsigned int)a8 cropRect:(CGRect)a9 codecType:(unsigned int)a10 maxPixelSize:(unint64_t)a11 parentImageHandle:(int64_t)a12
{
  double height = a9.size.height;
  double width = a9.size.width;
  double y = a9.origin.y;
  double x = a9.origin.x;
  uint64_t v16 = *(void *)&a8;
  v31[1] = *MEMORY[0x1E4F143B8];
  id v23 = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:");
  if (!v23) {
    return 0;
  }
  uint64_t v24 = v23;
  if (([v23 isContainerOpen] & 1) == 0)
  {
    FigDebugAssert3();
    return 0;
  }
  if ((a3 - 3) >= 2)
  {
    if (a3 == 1)
    {
      id v26 = -[BWPhotoEncoderController _thumbnailOptionsForImageWithMetadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:processingFlags:cropRect:codecType:maxPixelSize:](self, "_thumbnailOptionsForImageWithMetadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:processingFlags:cropRect:codecType:maxPixelSize:", a5, a6, a7, v16, a10, a11, x, y, width, height);
      goto LABEL_9;
    }
  }
  else
  {
    v32.origin.double x = x;
    v32.origin.double y = y;
    v32.size.double width = width;
    v32.size.double height = height;
    if (!CGRectIsEmpty(v32))
    {
      v33.origin.double x = x;
      v33.origin.double y = y;
      v33.size.double width = width;
      v33.size.double height = height;
      CFDictionaryRef v25 = CGRectCreateDictionaryRepresentation(v33);
      if (v25)
      {
        uint64_t v30 = *MEMORY[0x1E4F56240];
        v31[0] = v25;
        id v26 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
LABEL_9:
        id v27 = v26;
        goto LABEL_11;
      }
    }
  }
  id v27 = 0;
LABEL_11:
  int v28 = [v24 addThumbnailImage:a4 options:v27 parentImageHandle:a12];
  if (v28) {
    FigDebugAssert3();
  }
  return v28;
}

- (int)_addCompressedThumbnailForEncodingScheme:(int)a3 thumbnailSurface:(__IOSurface *)a4 thumbnailSurfaceSize:(unint64_t)a5
{
  id v7 = [(BWPhotoEncoderController *)self _encoderManagerForEncodingScheme:*(void *)&a3];
  if (!v7) {
    return 0;
  }
  BOOL v8 = v7;
  if (([v7 isContainerOpen] & 1) == 0)
  {
    FigDebugAssert3();
    return 0;
  }
  int v9 = [v8 addCompressedThumbnailImage:a4 thumbnailImageSize:a5 options:0];
  if (v9) {
    FigDebugAssert3();
  }
  return v9;
}

- (BOOL)_addDepthForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 primaryOutputAspectRatio:(double)a5 parentImageHandle:(int64_t)a6
{
  id v11 = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:");
  if (!v11) {
    return 0;
  }
  BOOL v12 = v11;
  if (![v11 isContainerOpen]) {
    return 0;
  }
  if (!CMGetAttachment(a4, @"StillSettings", 0)) {
    return 0;
  }
  uint64_t AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a4, @"Depth");
  if (!AttachedMedia) {
    return 0;
  }
  double v14 = AttachedMedia;
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
  if (!ImageBuffer) {
    return 0;
  }
  uint64_t v16 = ImageBuffer;
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(ImageBuffer);
  unsigned int v18 = BWPhotoEncoderAuxImageTypeForDepthPixelFormat(PixelFormatType);
  if (!v18) {
    return 0;
  }
  unsigned int v40 = v18;
  CFTypeRef v19 = CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F55B40], 0);
  if (!v19
    || ((uint64_t v20 = (void *)v19,
         id v39 = v16,
         (CFTypeRef v21 = CMGetAttachment(a4, @"PortraitStillImageAuxDepthMetadata", 0)) == 0)
     || (AuxiliaryImagePropertiesFromDepthMetadata = CFRetain(v21)) == 0)
    && (AuxiliaryImagePropertiesFromDepthMetadata = FigCaptureMetadataUtilitiesCreateAuxiliaryImagePropertiesFromDepthMetadata(v20)) == 0)
  {
    FigSignalErrorAt();
    return 0;
  }
  int64_t v38 = a6;
  id v23 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if ((objc_msgSend((id)objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E4F55870]), "BOOLValue") & 1) == 0)
  {
    if (FigDepthFormatIs16Bit(PixelFormatType)) {
      uint64_t v24 = [NSNumber numberWithShort:0x7FFFLL];
    }
    else {
      uint64_t v24 = [NSNumber numberWithInt:2143289344];
    }
    [v23 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F560A0]];
  }
  char v25 = objc_msgSend((id)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F53270], 0), "BOOLValue");
  double v26 = BWPhotoEncoderDenormalizedZoomRectForAttachedMedia(v14, a5, 1.0);
  if ((v25 & 1) == 0)
  {
    CGFloat v30 = v26;
    CGFloat v31 = v27;
    CGFloat v32 = v28;
    CGFloat v33 = v29;
    if (!CGRectIsNull(*(CGRect *)&v26))
    {
      v41.origin.double x = v30;
      v41.origin.double y = v31;
      v41.size.double width = v32;
      v41.size.double height = v33;
      [v23 setObject:CGRectCreateDictionaryRepresentation(v41) forKeyedSubscript:*MEMORY[0x1E4F56170]];
      [v23 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F56198]];
    }
  }
  if ([(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] requiresPhotosAdjustment])
  {
    [v23 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F56090]];
    objc_msgSend(v23, "setObject:forKeyedSubscript:", objc_msgSend((id)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F53248]), *MEMORY[0x1E4F560F8]);
  }
  if (a3 == 4)
  {
    uint64_t v34 = [NSNumber numberWithInt:0];
    [v23 setObject:v34 forKeyedSubscript:*MEMORY[0x1E4F56210]];
  }
  if (!v23)
  {
    FigSignalErrorAt();
LABEL_33:
    BOOL v36 = 0;
    goto LABEL_28;
  }
  if ([(BWPhotoEncoderControllerConfiguration *)self->_configuration usesHighEncodingPriority])
  {
    [v23 setObject:&unk_1EFB011D8 forKeyedSubscript:*MEMORY[0x1E4F56140]];
  }
  uint64_t v35 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BWStillImageProcessorControllerConfiguration figThreadPriority](self->_configuration, "figThreadPriority"));
  [v23 setObject:v35 forKeyedSubscript:*MEMORY[0x1E4F56178]];
  if ([v12 addAuxImage:v39 type:v40 auxImageMetadata:AuxiliaryImagePropertiesFromDepthMetadata options:v23 parentImageHandle:v38 auxImageHandleOut:0])goto LABEL_33; {
  objc_msgSend((id)-[BWStillImageProcessorControllerInput encodedAttachedMediaKeys](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "encodedAttachedMediaKeys"), "addObject:", @"Depth");
  }
  BOOL v36 = 1;
LABEL_28:
  CFRelease(AuxiliaryImagePropertiesFromDepthMetadata);
  return v36;
}

- (id)_depthEncodingOptionsFromDepthMetadata:(id)a3 pixelFormat:(unsigned int)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F55870]), "BOOLValue"))
  {
    id result = 0;
    char v6 = 1;
  }
  else
  {
    if (FigDepthFormatIs16Bit(a4))
    {
      uint64_t v5 = [NSNumber numberWithShort:0x7FFFLL];
      if (v5)
      {
LABEL_4:
        uint64_t v8 = *MEMORY[0x1E4F560A0];
        v9[0] = v5;
        char v6 = 1;
        id result = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v5 = [NSNumber numberWithInt:2143289344];
      if (v5) {
        goto LABEL_4;
      }
    }
    FigDebugAssert3();
    char v6 = 0;
    id result = 0;
  }
LABEL_5:
  if ((v6 & (result == 0)) != 0) {
    return (id)MEMORY[0x1E4F1CC08];
  }
  return result;
}

- (BOOL)_addPortraitEffectsMatteForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 primaryOutputAspectRatio:(double)a5 parentImageHandle:(int64_t)a6
{
  id v11 = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:");
  if (!v11) {
    goto LABEL_23;
  }
  BOOL v12 = v11;
  if (([v11 isContainerOpen] & 1) == 0)
  {
    FigDebugAssert3();
    goto LABEL_23;
  }
  uint64_t AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a4, 0x1EFA74420);
  double v14 = AttachedMedia;
  if (!AttachedMedia) {
    return (char)v14;
  }
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
  if (!ImageBuffer
    || (uint64_t v16 = ImageBuffer,
        size_t Width = CVPixelBufferGetWidth(ImageBuffer),
        size_t Height = CVPixelBufferGetHeight(v16),
        CVPixelBufferGetPixelFormatType(v16) != 1278226488))
  {
LABEL_23:
    LOBYTE(v14) = 0;
    return (char)v14;
  }
  unint64_t v43 = Height;
  char v19 = objc_msgSend((id)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F53270], 0), "BOOLValue");
  CFTypeRef v20 = CMGetAttachment(v14, (CFStringRef)*MEMORY[0x1E4F55B80], 0);
  if (!v20
    || (CFTypeRef v21 = [(BWPhotoEncoderController *)self _newAuxiliaryImagePropertiesFromPortraitEffectsMatteMetadata:v20]) == 0)
  {
    FigSignalErrorAt();
    goto LABEL_23;
  }
  int v40 = a3;
  CGRect v41 = v21;
  int64_t v42 = a6;
  Attributes = (void *)CVPixelBufferGetAttributes();
  id v23 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", BWPhotoEncoderEncodingOptionsForAuxiliaryImage(Width, v43, Attributes, -[BWPhotoEncoderControllerConfiguration usesHighEncodingPriority](self->_configuration, "usesHighEncodingPriority"), -[BWStillImageProcessorControllerConfiguration figThreadPriority](self->_configuration, "figThreadPriority")));
  CFStringRef v24 = (const __CFString *)*MEMORY[0x1E4F53070];
  [(BWPhotoEncoderController *)self mainImageDownscalingFactorForAttachedMediaKey:0x1EFA74420 attachedMediaMetadata:CMGetAttachment(v14, (CFStringRef)*MEMORY[0x1E4F53070], 0)];
  double v26 = BWPhotoEncoderDenormalizedZoomRectForAttachedMedia(v14, a5, v25);
  if ((v19 & 1) == 0)
  {
    CGFloat v30 = v26;
    CGFloat v31 = v27;
    CGFloat v32 = v28;
    CGFloat v33 = v29;
    if (!CGRectIsNull(*(CGRect *)&v26))
    {
      v44.origin.double x = v30;
      v44.origin.double y = v31;
      v44.size.double width = v32;
      v44.size.double height = v33;
      CFDictionaryRef v34 = CGRectCreateDictionaryRepresentation(v44);
      BOOL IsLinDNGEncodingScheme = BWPhotoEncoderIsLinDNGEncodingScheme(v40);
      BOOL v36 = (void *)MEMORY[0x1E4F56240];
      if (!IsLinDNGEncodingScheme) {
        BOOL v36 = (void *)MEMORY[0x1E4F56170];
      }
      [v23 setObject:v34 forKeyedSubscript:*v36];
      [v23 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F56198]];
    }
  }
  if ([(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] requiresPhotosAdjustment])
  {
    [v23 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F56090]];
    objc_msgSend(v23, "setObject:forKeyedSubscript:", objc_msgSend((id)CMGetAttachment(a4, v24, 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F53248]), *MEMORY[0x1E4F560F8]);
  }
  if (v12 == [(BWPhotoEncoderController *)self _encoderManagerForEncodingScheme:4])
  {
    uint64_t v37 = [NSNumber numberWithInt:0];
    [v23 setObject:v37 forKeyedSubscript:*MEMORY[0x1E4F56210]];
  }
  int v38 = [v12 addAuxImage:v16 type:4 auxImageMetadata:v41 options:v23 parentImageHandle:v42 auxImageHandleOut:0];
  LOBYTE(v14) = v38 == 0;
  if (v38) {
    FigDebugAssert3();
  }
  else {
    objc_msgSend((id)-[BWStillImageProcessorControllerInput encodedAttachedMediaKeys](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "encodedAttachedMediaKeys"), "addObject:", 0x1EFA74420);
  }
  CFRelease(v41);
  return (char)v14;
}

- (CGImageMetadata)_newAuxiliaryImagePropertiesFromPortraitEffectsMatteMetadata:(id)a3
{
  Mutable = CGImageMetadataCreateMutable();
  char v6 = Mutable;
  if (!Mutable)
  {
    FigSignalErrorAt();
    return v6;
  }
  uint64_t v7 = *MEMORY[0x1E4F55A98];
  uint64_t v8 = *MEMORY[0x1E4F55AA0];
  if (!CGImageMetadataRegisterNamespaceForPrefix(Mutable, (CFStringRef)*MEMORY[0x1E4F55A98], (CFStringRef)*MEMORY[0x1E4F55AA0], 0))
  {
    if (!FigSignalErrorAt()) {
      return v6;
    }
    goto LABEL_9;
  }
  uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F55AB0]), "intValue");
  uint64_t v10 = [NSNumber numberWithInt:v9];
  if ([(BWPhotoEncoderController *)self _addValue:v10 toAuxiliaryImageProperties:v6 namespace:v7 prefix:v8 key:*MEMORY[0x1E4F55AA8]])
  {
    FigDebugAssert3();
LABEL_9:
    CFRelease(v6);
    return 0;
  }
  return v6;
}

- (BOOL)_addGainMapForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 outputDimensions:(id)a5 primaryOutputAspectRatio:(double)a6 parentImageHandle:(int64_t)a7
{
  uint64_t v11 = *(void *)&a3;
  id v13 = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:");
  if (!v13) {
    return 0;
  }
  double v14 = v13;
  if (([v13 isContainerOpen] & 1) == 0)
  {
    FigDebugAssert3();
    return 0;
  }
  uint64_t AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a4, 0x1EFA4EB60);
  if (!AttachedMedia) {
    return 0;
  }
  uint64_t v16 = AttachedMedia;
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
  if (!ImageBuffer) {
    return 0;
  }
  unsigned int v18 = ImageBuffer;
  int64_t v35 = a7;
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(ImageBuffer);
  BOOL v20 = PixelFormatType == 1278226488;
  if (PixelFormatType != 1278226488) {
    return 0;
  }
  unint64_t v21 = psn_pixelBufferDimensions(v18);
  if (objc_msgSend((id)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F53270], 0), "BOOLValue"))
  {
    if (FigCaptureVideoDimensionsAreEqual(v21, *(void *)&a5))
    {
      double v23 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      double v22 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      double v25 = *MEMORY[0x1E4F1DB20];
      double v24 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      goto LABEL_11;
    }
    return 0;
  }
  [(BWPhotoEncoderController *)self mainImageDownscalingFactorForAttachedMediaKey:0x1EFA4EB60 attachedMediaMetadata:CMGetAttachment(v16, (CFStringRef)*MEMORY[0x1E4F53070], 0)];
  if (v26 <= 0.0) {
    return 0;
  }
  double v25 = BWPhotoEncoderDenormalizedZoomRectForAttachedMedia(v16, a6, v26);
  double v24 = v27;
  double v23 = v28;
  double v22 = v29;
LABEL_11:
  id v37 = 0;
  CGFloat v30 = -[BWPhotoEncoderController _newGainMapAuxiliaryImagePropertiesForEncodingScheme:sampleBuffer:denormalizedCropRect:requiresPhotosAdjustment:encodingOptionsOut:flexGTCColorSpaceOut:tonemapItemMetadataOut:isP3PrimariesOut:](self, "_newGainMapAuxiliaryImagePropertiesForEncodingScheme:sampleBuffer:denormalizedCropRect:requiresPhotosAdjustment:encodingOptionsOut:flexGTCColorSpaceOut:tonemapItemMetadataOut:isP3PrimariesOut:", v11, a4, [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] requiresPhotosAdjustment], &v37, 0, 0, v25, v24, v23, v22, 0);
  if (!v30) {
    return 0;
  }
  CGFloat v31 = v30;
  if (![v37 count])
  {
    BOOL v33 = 0;
LABEL_18:
    CFRelease(v31);
    return v33;
  }
  uint64_t v36 = -1;
  if (BWPhotoEncoderSupportsAddingAuxiliaryMetadataSeparately(v11))
  {
    CFRelease(v31);
    CGFloat v31 = 0;
  }
  int v32 = [v14 addAuxImage:v18 type:v20 auxImageMetadata:v31 options:v37 parentImageHandle:v35 auxImageHandleOut:&v36];
  BOOL v33 = v32 == 0;
  if (!v32)
  {
    [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] setGainMapHandle:v36];
    objc_msgSend((id)-[BWStillImageProcessorControllerInput encodedAttachedMediaKeys](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "encodedAttachedMediaKeys"), "addObject:", 0x1EFA4EB60);
  }
  if (v31) {
    goto LABEL_18;
  }
  return v33;
}

- (CGImageMetadata)_newGainMapAuxiliaryImagePropertiesForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 denormalizedCropRect:(CGRect)a5 requiresPhotosAdjustment:(BOOL)a6 encodingOptionsOut:(id *)a7 flexGTCColorSpaceOut:(CGColorSpace *)a8 tonemapItemMetadataOut:(id *)a9 isP3PrimariesOut:(BOOL *)a10
{
  BOOL v13 = a6;
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  CFTypeRef cf = 0;
  uint64_t v50 = 0;
  CFTypeRef v20 = CMGetAttachment(a4, @"StillSettings", 0);
  if (v20
    && (unint64_t v21 = (void *)v20,
        (uint64_t AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a4, 0x1EFA4EB60)) != 0))
  {
    double v23 = AttachedMedia;
    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
    BOOL v25 = (char)ImageBuffer;
    if (ImageBuffer)
    {
      BOOL v44 = v13;
      unsigned int v46 = a8;
      sbuf = a4;
      uint64_t v45 = a7;
      int64_t v26 = psn_pixelBufferDimensions(ImageBuffer);
      Attributes = (void *)CVPixelBufferGetAttributes();
      double v28 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", BWPhotoEncoderEncodingOptionsForAuxiliaryImage((int)v26, v26 >> 32, Attributes, -[BWPhotoEncoderControllerConfiguration usesHighEncodingPriority](self->_configuration, "usesHighEncodingPriority"), -[BWStillImageProcessorControllerConfiguration figThreadPriority](self->_configuration, "figThreadPriority")));
      objc_msgSend((id)objc_msgSend(v21, "captureSettings"), "captureFlags");
      CFStringRef v29 = (const __CFString *)*MEMORY[0x1E4F53070];
      CGFloat v30 = (void *)CMGetAttachment(v23, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      AuxiliaryImagePropertiesFromGainMapSampleBuffer = FigCaptureMetadataUtilitiesCreateAuxiliaryImagePropertiesFromGainMapSampleBuffer(v30);
      if (!AuxiliaryImagePropertiesFromGainMapSampleBuffer)
      {
        FigSignalErrorAt();
        BOOL v25 = 0;
        goto LABEL_30;
      }
      int v32 = a3;
      unsigned int v33 = a3 - 3;
      CFDictionaryRef v34 = (void *)[v30 objectForKeyedSubscript:*MEMORY[0x1E4F532E8]];
      int64_t v35 = v34;
      if (((a3 - 1) < 2 || v33 <= 1) && v34)
      {
        if (BWPhotoEncoderTonemapItemMetadataFromGainMapMetadata(v34, &v50))
        {
          FigDebugAssert3();
          goto LABEL_47;
        }
        if ((a3 == 1 || v33 <= 1) && v50) {
          [v28 setObject:v50 forKeyedSubscript:*MEMORY[0x1E4F560A8]];
        }
      }
      uint64_t v36 = *MEMORY[0x1E4F53370];
      if (![v30 objectForKeyedSubscript:*MEMORY[0x1E4F53370]])
      {
        BOOL v25 = 0;
        BOOL v41 = v44;
LABEL_23:
        v51.origin.CGFloat x = x;
        v51.origin.CGFloat y = y;
        v51.size.CGFloat width = width;
        v51.size.CGFloat height = height;
        if (!CGRectIsNull(v51))
        {
          v52.origin.CGFloat x = x;
          v52.origin.CGFloat y = y;
          v52.size.CGFloat width = width;
          v52.size.CGFloat height = height;
          CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v52);
          [v28 setObject:DictionaryRepresentation forKeyedSubscript:*MEMORY[0x1E4F56170]];
          [v28 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F56198]];
          if (DictionaryRepresentation) {
            CFRelease(DictionaryRepresentation);
          }
        }
        BWPhotoEncoderAddGainMapQualityControllerParametersToEncodingOptions(v28);
        if (BWPhotoEncoderIsLinDNGEncodingScheme(v32)) {
          [v28 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F561F0]];
        }
        if (v41)
        {
          [v28 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F56090]];
          objc_msgSend(v28, "setObject:forKeyedSubscript:", objc_msgSend((id)CMGetAttachment(sbuf, v29, 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F53248]), *MEMORY[0x1E4F560F8]);
        }
LABEL_30:
        a7 = v45;
        a8 = v46;
        if (!v45) {
          goto LABEL_32;
        }
        goto LABEL_31;
      }
      id v37 = CMSampleBufferGetImageBuffer(sbuf);
      if (v37)
      {
        CFTypeRef v38 = CVBufferCopyAttachment(v37, (CFStringRef)*MEMORY[0x1E4F24A90], 0);
        int v39 = FigCFEqual();
        BOOL v40 = v39 != 0;
        if (v38) {
          CFRelease(v38);
        }
        if (BWPhotoEncoderCreateGTCColorSpaceFromGainMapMetadata(v35, [v30 objectForKeyedSubscript:v36], v39 != 0, &cf))
        {
          BOOL v41 = v44;
          int v32 = a3;
          BOOL v25 = v40;
        }
        else
        {
          int v32 = a3;
          BOOL v41 = v44;
          BOOL v25 = v40;
          if (a3 <= 4 && ((1 << a3) & 0x1A) != 0) {
            [v28 setObject:cf forKeyedSubscript:*MEMORY[0x1E4F560C0]];
          }
        }
        goto LABEL_23;
      }
      FigSignalErrorAt();
LABEL_47:
      BOOL v25 = 0;
      goto LABEL_30;
    }
  }
  else
  {
    BOOL v25 = 0;
  }
  AuxiliaryImagePropertiesFromGainMapSampleBuffer = 0;
  double v28 = 0;
  if (a7) {
LABEL_31:
  }
    *a7 = v28;
LABEL_32:
  if (a8)
  {
    *a8 = (CGColorSpace *)cf;
  }
  else if (cf)
  {
    CFRelease(cf);
  }
  if (a9) {
    *a9 = v50;
  }
  if (a10) {
    *a10 = v25;
  }
  return AuxiliaryImagePropertiesFromGainMapSampleBuffer;
}

- (BOOL)_addAlternateImageForEncodingScheme:(int)a3 flexGTCColorSpace:(CGColorSpace *)a4 isP3primaries:(BOOL)a5 tonemapItemMetadata:(id)a6 parentImageHandle:(int64_t)a7 gainMapHandle:(int64_t)a8
{
  v31[4] = *MEMORY[0x1E4F143B8];
  if (a8 == -1) {
    goto LABEL_15;
  }
  BOOL v11 = a5;
  id v14 = [(BWPhotoEncoderController *)self _encoderManagerForEncodingScheme:*(void *)&a3];
  if (!v14) {
    return (char)v14;
  }
  int v15 = v14;
  if (([v14 isContainerOpen] & 1) == 0)
  {
    FigDebugAssert3();
LABEL_15:
    LOBYTE(v14) = 0;
    return (char)v14;
  }
  if (a4)
  {
    uint64_t v16 = (void *)CFRetain(a4);
  }
  else
  {
    uint64_t v17 = (CFStringRef *)MEMORY[0x1E4F1DBA0];
    if (!v11) {
      uint64_t v17 = (CFStringRef *)MEMORY[0x1E4F1DC68];
    }
    uint64_t v16 = CGColorSpaceCreateWithName(*v17);
  }
  unsigned int v18 = v16;
  if (v16)
  {
    v30[0] = *MEMORY[0x1E4F560C8];
    uint64_t v19 = *MEMORY[0x1E4F562F8];
    v28[0] = *MEMORY[0x1E4F56300];
    v28[1] = v19;
    v29[0] = &unk_1EFB01250;
    v29[1] = a6;
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
    uint64_t v21 = *MEMORY[0x1E4F560C0];
    v31[0] = v20;
    v31[1] = v18;
    uint64_t v22 = *MEMORY[0x1E4F560B0];
    v30[1] = v21;
    v30[2] = v22;
    v30[3] = *MEMORY[0x1E4F560F8];
    void v31[2] = &unk_1EFB01280;
    v31[3] = &unk_1EFB01250;
    uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:4];
    uint64_t v26 = [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] toneMapAlternateGroupHandle];
    v27[0] = [NSNumber numberWithLong:a7];
    v27[1] = [NSNumber numberWithLong:a8];
    int v24 = objc_msgSend(v15, "addAlternateImageWithDerivedImageHandles:options:parentImageHandle:alternateGroupHandleInOut:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v27, 2), v23, a7, &v26);
    if (!v24) {
      [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] setToneMapAlternateGroupHandle:v26];
    }
    CFRelease(v18);
    LOBYTE(v14) = v24 != 0;
  }
  else
  {
    FigDebugAssert3();
    LOBYTE(v14) = 1;
  }
  return (char)v14;
}

- (BOOL)_addGainMapMetadataForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 parentImageHandle:(int64_t)a5
{
  uint64_t v7 = *(void *)&a3;
  CFTypeRef cf = 0;
  uint64_t v9 = [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] gainMapHandle];
  if (v9 == -1)
  {
    LOBYTE(v12) = 0;
    return (char)v12;
  }
  uint64_t v10 = v9;
  id v11 = [(BWPhotoEncoderController *)self _encoderManagerForEncodingScheme:v7];
  BOOL v12 = v11;
  if (v11)
  {
    if ([v11 isContainerOpen])
    {
      if (CMGetAttachment(a4, @"StillSettings", 0))
      {
        uint64_t AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a4, 0x1EFA4EB60);
        if (AttachedMedia)
        {
          if (CMGetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E4F53070], 0))
          {
            uint64_t v19 = 0;
            id v20 = 0;
            unsigned __int8 v18 = 0;
            uint64_t v14 = [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] requiresPhotosAdjustment];
            int v15 = -[BWPhotoEncoderController _newGainMapAuxiliaryImagePropertiesForEncodingScheme:sampleBuffer:denormalizedCropRect:requiresPhotosAdjustment:encodingOptionsOut:flexGTCColorSpaceOut:tonemapItemMetadataOut:isP3PrimariesOut:](self, "_newGainMapAuxiliaryImagePropertiesForEncodingScheme:sampleBuffer:denormalizedCropRect:requiresPhotosAdjustment:encodingOptionsOut:flexGTCColorSpaceOut:tonemapItemMetadataOut:isP3PrimariesOut:", v7, a4, v14, &v20, &cf, &v19, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24), &v18);
            if (v15)
            {
              uint64_t v16 = v15;
              if (![v20 count]
                || [v12 addAuxImageMetadata:v16 type:1 auxImageHandle:v10 options:v20 parentImageHandle:a5])
              {
                LOBYTE(v12) = 0;
              }
              else
              {
                LOBYTE(v12) = 1;
                if (v7 == 2 && v19) {
                  [(BWPhotoEncoderController *)self _addAlternateImageForEncodingScheme:2 flexGTCColorSpace:cf isP3primaries:v18 tonemapItemMetadata:v19 parentImageHandle:a5 gainMapHandle:v10];
                }
              }
              CFRelease(v16);
              goto LABEL_14;
            }
          }
        }
      }
    }
    else
    {
      FigDebugAssert3();
    }
    LOBYTE(v12) = 0;
  }
LABEL_14:
  if (cf) {
    CFRelease(cf);
  }
  return (char)v12;
}

- (BOOL)_addSemanticMattesForEncodingScheme:(int)a3 attachedMediaKey:(id)a4 sampleBuffer:(opaqueCMSampleBuffer *)a5 primaryOutputAspectRatio:(double)a6 settingsID:(int64_t)a7 orientation:(int)a8 parentImageHandle:(int64_t)a9
{
  id v16 = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:");
  if (!v16) {
    goto LABEL_25;
  }
  uint64_t v17 = v16;
  if (([v16 isContainerOpen] & 1) == 0)
  {
    FigDebugAssert3();
LABEL_25:
    CFTypeRef v38 = 0;
    BOOL v39 = 0;
    goto LABEL_19;
  }
  if (BWPhotoEncoderIsLinDNGEncodingScheme(a3)) {
    unsigned __int8 v18 = (void *)MEMORY[0x1E4F56240];
  }
  else {
    unsigned __int8 v18 = (void *)MEMORY[0x1E4F56170];
  }
  uint64_t AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a5, (uint64_t)a4);
  unsigned int v20 = BWPhotoEncoderNodeAuxImageTypeForSemanticMatteAttachedMediaKey(a4);
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
  if (!ImageBuffer) {
    goto LABEL_27;
  }
  uint64_t v22 = ImageBuffer;
  unsigned int v43 = a8;
  size_t Width = CVPixelBufferGetWidth(ImageBuffer);
  size_t Height = CVPixelBufferGetHeight(v22);
  if (CVPixelBufferGetPixelFormatType(v22) != 1278226488) {
    goto LABEL_27;
  }
  uint64_t v45 = [(BWPhotoEncoderController *)self _newAuxiliaryImagePropertiesFromSemanticMatteSampleBuffer:AttachedMedia];
  if (!v45)
  {
    FigSignalErrorAt();
LABEL_27:
    CFTypeRef v38 = 0;
LABEL_28:
    BOOL v39 = 0;
    goto LABEL_19;
  }
  int64_t v42 = v18;
  unsigned int v44 = v20;
  int64_t v25 = a9;
  Attributes = (void *)CVPixelBufferGetAttributes();
  double v27 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", BWPhotoEncoderEncodingOptionsForAuxiliaryImage(Width, Height, Attributes, -[BWPhotoEncoderControllerConfiguration usesHighEncodingPriority](self->_configuration, "usesHighEncodingPriority"), -[BWStillImageProcessorControllerConfiguration figThreadPriority](self->_configuration, "figThreadPriority")));
  [(BWPhotoEncoderController *)self mainImageDownscalingFactorForAttachedMediaKey:a4 attachedMediaMetadata:CMGetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E4F53070], 0)];
  double v29 = BWPhotoEncoderDenormalizedZoomRectForAttachedMedia(AttachedMedia, a6, v28);
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  if ((objc_msgSend((id)CMGetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E4F53270], 0), "BOOLValue") & 1) != 0
    || (v46.origin.CGFloat x = v29, v46.origin.y = v31, v46.size.width = v33, v46.size.height = v35, CGRectIsNull(v46)))
  {
LABEL_13:
    if ([(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] requiresPhotosAdjustment])
    {
      [v27 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F56090]];
      uint64_t v36 = [NSNumber numberWithInt:v43];
      [v27 setObject:v36 forKeyedSubscript:*MEMORY[0x1E4F560F8]];
    }
    if (v17 == [(BWPhotoEncoderController *)self _encoderManagerForEncodingScheme:4])
    {
      uint64_t v37 = [NSNumber numberWithInt:0];
      [v27 setObject:v37 forKeyedSubscript:*MEMORY[0x1E4F56210]];
    }
    CFTypeRef v38 = v45;
    if (![v17 addAuxImage:v22 type:v44 auxImageMetadata:v45 options:v27 parentImageHandle:v25 auxImageHandleOut:0])
    {
      objc_msgSend((id)-[BWStillImageProcessorControllerInput encodedAttachedMediaKeys](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "encodedAttachedMediaKeys"), "addObject:", a4);
      BOOL v39 = 1;
      goto LABEL_19;
    }
    goto LABEL_28;
  }
  if (*v42)
  {
    v47.origin.CGFloat x = v29;
    v47.origin.CGFloat y = v31;
    v47.size.CGFloat width = v33;
    v47.size.CGFloat height = v35;
    [v27 setObject:CGRectCreateDictionaryRepresentation(v47) forKeyedSubscript:*v42];
    [v27 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F56198]];
    goto LABEL_13;
  }
  FigSignalErrorAt();
  BOOL v39 = 0;
  CFTypeRef v38 = v45;
LABEL_19:
  if (dword_1EB4C5590)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v38) {
    CFRelease(v38);
  }
  return v39;
}

- (int)_decompressSmartStylePhotoSurface:(__IOSurface *)a3
{
  int result = CMPhotoDecompressionSessionCreate();
  if (!result) {
    return CMPhotoDecompressionSessionCreateContainer();
  }
  return result;
}

- (int)_updateSmartStyleDeltaMapForSampleBufferIfNeeded:(opaqueCMSampleBuffer *)a3 decompressedStyledPixelBuffer:(__CVBuffer *)a4 stillImageSettings:(id)a5 encodingScheme:(int)a6 processingFlags:(unsigned int)a7
{
  LODWORD(v7) = a7;
  BOOL v12 = self;
  id v70 = objc_alloc_init(NSClassFromString((NSString *)[NSString stringWithFormat:@"CMI%@V%d", @"SmartStyleProcessorInputOutput", -[BWPhotoEncoderControllerConfiguration smartStyleRenderingVersion](self->_configuration, "smartStyleRenderingVersion")]));
  int v13 = BWPhotoEncoderDeltaMapPixelFormat(objc_msgSend((id)objc_msgSend(a5, "requestedSettings"), "smartStyle"), a6);
  uint64_t v14 = &OBJC_IVAR___BWPhotoEncoderController__inferenceInputFormatDescription;
  CVImageBufferRef ImageBuffer = a4;
  if (!a4)
  {
    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    if (!ImageBuffer)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      unsigned int v43 = v70;
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      int v59 = -12783;
      goto LABEL_49;
    }
  }
  unint64_t v16 = psn_pixelBufferDimensions(ImageBuffer);
  smartStyleDeltaMapPixelBuffer = v12->_smartStyleDeltaMapPixelBuffer;
  if (smartStyleDeltaMapPixelBuffer)
  {
    unint64_t v18 = psn_pixelBufferDimensions(smartStyleDeltaMapPixelBuffer);
    int v19 = v18;
    unint64_t v20 = HIDWORD(v18);
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(v12->_smartStyleDeltaMapPixelBuffer);
    uint64_t v22 = v12->_smartStyleDeltaMapPixelBuffer;
    if (v19 == v16 && v20 == HIDWORD(v16) && PixelFormatType == v13)
    {
      if (v22) {
        goto LABEL_15;
      }
    }
    else if (v22)
    {
      CFRelease(v22);
      v12->_smartStyleDeltaMapPixelBuffer = 0;
    }
  }
  uint64_t v25 = [(BWStillImageProcessorControllerDelegate *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)v12 currentRequest] delegate] processorController:v12 newOutputPixelBufferForProcessorInput:[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)v12 currentRequest] input] type:48 dimensions:v16];
  v12->_smartStyleDeltaMapPixelBuffer = (__CVBuffer *)v25;
  if (!v25)
  {
LABEL_36:
    int v59 = -12780;
    unsigned int v43 = v70;
LABEL_48:
    uint64_t v14 = &OBJC_IVAR___BWPhotoEncoderController__inferenceInputFormatDescription;
    goto LABEL_49;
  }
LABEL_15:
  uint64_t AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1EFA747C0);
  if (!AttachedMedia) {
    goto LABEL_36;
  }
  CVImageBufferRef v27 = CMSampleBufferGetImageBuffer(AttachedMedia);
  if (!v27)
  {
    double v61 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT);
    goto LABEL_46;
  }
  CVImageBufferRef v28 = v27;
  uint64_t v71 = v12;
  double v29 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1EFA74780);
  if (v29)
  {
    CVImageBufferRef v30 = CMSampleBufferGetImageBuffer(v29);
    if (!v30)
    {
      CGFloat v31 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
      BOOL v12 = v71;
LABEL_46:
      unsigned int v43 = v70;
      goto LABEL_47;
    }
  }
  else
  {
    CVImageBufferRef v30 = 0;
  }
  CFStringRef v32 = (const __CFString *)*MEMORY[0x1E4F53070];
  CFTypeRef v33 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (!v33)
  {
    double v62 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT);
    BOOL v12 = v71;
    unsigned int v43 = v70;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    int v59 = -12780;
    goto LABEL_48;
  }
  if (a4)
  {
    double v34 = (double)(int)v16;
    double v35 = (double)SHIDWORD(v16);
    double v36 = 0.0;
    double v37 = 0.0;
    uint64_t v7 = v7;
  }
  else
  {
    uint64_t v7 = v7;
    -[BWPhotoEncoderController _cropRectForRequestedSettings:inputDimensions:metadata:processingFlags:](v71, "_cropRectForRequestedSettings:inputDimensions:metadata:processingFlags:", [a5 requestedSettings], v16, v33, v7);
    double v36 = v38;
    double v37 = v39;
    double v34 = v40;
    double v35 = v41;
  }
  int64_t v42 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1EFA74760);
  unsigned int v43 = v70;
  if (!v42
    || (unsigned int v44 = v42, (v45 = CMGetAttachment(v42, v32, 0)) == 0)
    || (v46 = v45, (CGRect v47 = CMSampleBufferGetImageBuffer(v44)) == 0))
  {
    FigDebugAssert3();
    unsigned int v63 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT);
    BOOL v12 = v71;
LABEL_47:
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    int v59 = -12783;
    goto LABEL_48;
  }
  CGRect v48 = v47;
  -[BWPhotoEncoderController _cropRectForRequestedSettings:inputDimensions:metadata:processingFlags:](v71, "_cropRectForRequestedSettings:inputDimensions:metadata:processingFlags:", [a5 requestedSettings], psn_pixelBufferDimensions(v47), v46, v7);
  double v50 = v49;
  double v52 = v51;
  double v54 = v53;
  double v56 = v55;
  int v57 = [(CMISmartStyleProcessor *)v71->_smartStyleProcessor resetState];
  if (v57)
  {
    int v59 = v57;
    uint64_t v64 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT);
    BOOL v12 = v71;
  }
  else
  {
    [v70 setInputUnstyledPixelBuffer:ImageBuffer];
    objc_msgSend(v70, "setInputUnstyledCropRect:", v36, v37, v34, v35);
    if (v30) {
      [v70 setInputUnstyledThumbnailPixelBuffer:v30];
    }
    [v70 setInputStyleCoefficientsPixelBuffer:v28];
    [v70 setInputReferenceForDeltaMapComputationPixelBuffer:v48];
    objc_msgSend(v70, "setInputReferenceForDeltaMapComputationCropRect:", v50, v52, v54, v56);
    objc_msgSend(v70, "setOutputStyledCropRect:", v36, v37, v34, v35);
    BOOL v12 = v71;
    [v70 setOutputDeltaMapPixelBuffer:v71->_smartStyleDeltaMapPixelBuffer];
    objc_msgSend(v70, "setOutputDeltaMapCropRect:", v36, v37, v34, v35);
    [(CMISmartStyleProcessor *)v71->_smartStyleProcessor setInputOutput:v70];
    -[CMISmartStyleProcessor setConfiguration:](v71->_smartStyleProcessor, "setConfiguration:", [(id)objc_opt_class() getDefaultProcessorConfigurationForStillsReversibility]);
    int v58 = [(CMISmartStyleProcessor *)v71->_smartStyleProcessor prepareToProcess:4];
    if (v58 || (int v58 = [(CMISmartStyleProcessor *)v71->_smartStyleProcessor process]) != 0)
    {
      int v59 = v58;
      uint64_t v65 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT);
    }
    else
    {
      int v59 = [(CMISmartStyleProcessor *)v71->_smartStyleProcessor finishProcessing];
      if (!v59)
      {
        [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)v71 currentRequest] input] setDeltaMapIsValid:1];

        return v59;
      }
      uint64_t v66 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT);
    }
  }
  uint64_t v14 = &OBJC_IVAR___BWPhotoEncoderController__inferenceInputFormatDescription;
  fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_49:

  uint64_t v68 = v14[5];
  int v69 = *(Class *)((char *)&v12->super.super.isa + v68);
  if (v69)
  {
    CFRelease(v69);
    *(Class *)((char *)&v12->super.super.isa + v68) = 0;
  }
  return v59;
}

- (int)_computeAndAddSmartStyleDeltaMapToClosedSurfaceContainer:(__IOSurface *)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 encodingScheme:(int)a5 stillImageSettings:(id)a6 processingFlags:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v9 = *(void *)&a5;
  v25[18] = *MEMORY[0x1E4F143B8];
  int v13 = -[BWPhotoEncoderController _decompressSmartStylePhotoSurface:](self, "_decompressSmartStylePhotoSurface:");
  if (v13
    || (int v13 = [(BWPhotoEncoderController *)self _updateSmartStyleDeltaMapForSampleBufferIfNeeded:a4 decompressedStyledPixelBuffer:self->_smartStyleDecompressedStyledPixelBuffer stillImageSettings:a6 encodingScheme:v9 processingFlags:v7]) != 0)
  {
    int v18 = v13;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  }
  else
  {
    id v14 = [(BWPhotoEncoderController *)self _encoderManagerForEncodingScheme:v9];
    if (!v14)
    {
      uint64_t v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      int v18 = 0;
      goto LABEL_6;
    }
    int v15 = v14;
    uint64_t v16 = BWPhotoEncoderContainerFormatForEncodingScheme(v9);
    v24[0] = *MEMORY[0x1E4F56058];
    uint64_t v17 = [NSNumber numberWithInt:v16];
    v24[1] = *MEMORY[0x1E4F56048];
    v25[0] = v17;
    v25[1] = &unk_1EFB01208;
    int v18 = objc_msgSend(v15, "openExistingContainer:options:", a3, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v25, v24, 2));
    if (!v18)
    {
      [(BWPhotoEncoderController *)self _primaryOutputAspectRatioForSettings:a6];
      -[BWPhotoEncoderController _addSmartStyleDeltaMapForEncodingScheme:sampleBuffer:stillImageSettings:primaryOutputAspectRatio:](self, "_addSmartStyleDeltaMapForEncodingScheme:sampleBuffer:stillImageSettings:primaryOutputAspectRatio:", v9, a4, a6);
      goto LABEL_6;
    }
    uint64_t v23 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
  }
  fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_6:
  if (dword_1EB4C5590)
  {
    int v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v18;
}

- (int)_addUnstyledImageForEncodingScheme:(int)a3 sbuf:(opaqueCMSampleBuffer *)a4 imageDimensions:(id)a5 processingFlags:(unsigned int)a6 metadata:(id)a7 requestedStillImageCaptureSettings:(id)a8 resolvedStillImageCaptureSettings:(id)a9 cropRect:(CGRect)a10 usePixelsOutsideCrop:(BOOL)a11
{
  if (a3 != 2) {
    goto LABEL_16;
  }
  CGFloat height = a10.size.height;
  CGFloat width = a10.size.width;
  CGFloat y = a10.origin.y;
  CGFloat x = a10.origin.x;
  id v20 = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:", *(void *)&a3, a4, a5, *(void *)&a6);
  if (!v20) {
    return (int)v20;
  }
  uint64_t AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a4, 0x1EFA74760);
  if (!AttachedMedia || (CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia)) == 0)
  {
LABEL_16:
    LODWORD(v20) = 0;
    return (int)v20;
  }
  CVImageBufferRef v23 = ImageBuffer;
  int v24 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  if (!CGRectIsEmpty(v32))
  {
    v33.origin.CGFloat x = x;
    v33.origin.CGFloat y = y;
    v33.size.CGFloat width = width;
    v33.size.CGFloat height = height;
    CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v33);
    [v24 setObject:DictionaryRepresentation forKeyedSubscript:*MEMORY[0x1E4F56170]];
    if (DictionaryRepresentation) {
      CFRelease(DictionaryRepresentation);
    }
  }
  if (a11) {
    [v24 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F56198]];
  }
  uint64_t v26 = BWPhotoEncoderCodecTypeForEncodingScheme(2u);
  BYTE1(v31) = 1;
  LOBYTE(v31) = self->_heifUseTiling;
  -[BWPhotoEncoderController _addQualityOptionsToDictionary:codecType:pixelBuffer:imageDimensions:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:enableHEIFTiling:enableHEIFOrientation:auxImageType:](self, "_addQualityOptionsToDictionary:codecType:pixelBuffer:imageDimensions:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:enableHEIFTiling:enableHEIFOrientation:auxImageType:", v24, v26, v23, a5, a7, a8, a9, v31);
  uint64_t v27 = [NSNumber numberWithUnsignedInt:v26];
  [v24 setObject:v27 forKeyedSubscript:*MEMORY[0x1E4F560B8]];
  if ([(BWPhotoEncoderControllerConfiguration *)self->_configuration usesHighEncodingPriority])
  {
    [v24 setObject:&unk_1EFB011D8 forKeyedSubscript:*MEMORY[0x1E4F56140]];
  }
  uint64_t v28 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BWStillImageProcessorControllerConfiguration figThreadPriority](self->_configuration, "figThreadPriority"));
  [v24 setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F56178]];
  if ([(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] requiresPhotosAdjustment])
  {
    [v24 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F56090]];
    uint64_t v29 = [a7 objectForKeyedSubscript:*MEMORY[0x1E4F53248]];
    [v24 setObject:v29 forKeyedSubscript:*MEMORY[0x1E4F560F8]];
  }
  LODWORD(v20) = [v20 addMainImage:v23 metadata:0 options:v24 imageHandleOut:0];
  if (v20) {
    FigDebugAssert3();
  }
  return (int)v20;
}

- (BOOL)_addSmartStyleLinearThumbnailForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 primaryOutputAspectRatio:(double)a5
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id AttachedMedia = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:");
  if (AttachedMedia)
  {
    id v10 = AttachedMedia;
    LODWORD(AttachedMedia) = [AttachedMedia isContainerOpen];
    if (AttachedMedia)
    {
      id AttachedMedia = (id)BWSampleBufferGetAttachedMedia(a4, 0x1EFA74740);
      if (AttachedMedia)
      {
        id v11 = (opaqueCMSampleBuffer *)AttachedMedia;
        target = a4;
        CGRect v32 = v10;
        id AttachedMedia = CMSampleBufferGetImageBuffer((CMSampleBufferRef)AttachedMedia);
        if (AttachedMedia)
        {
          BOOL v12 = (__CVBuffer *)AttachedMedia;
          size_t Width = CVPixelBufferGetWidth((CVPixelBufferRef)AttachedMedia);
          size_t Height = CVPixelBufferGetHeight(v12);
          Attributes = (void *)CVPixelBufferGetAttributes();
          uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", BWPhotoEncoderEncodingOptionsForAuxiliaryImage(Width, Height, Attributes, -[BWPhotoEncoderControllerConfiguration usesHighEncodingPriority](self->_configuration, "usesHighEncodingPriority"), -[BWStillImageProcessorControllerConfiguration figThreadPriority](self->_configuration, "figThreadPriority")));
          if (CVPixelBufferGetPixelFormatType(v12) != 2019963440) {
            goto LABEL_17;
          }
          if (a3 == 3) {
            uint64_t v17 = (void *)MEMORY[0x1E4F56240];
          }
          else {
            uint64_t v17 = (void *)MEMORY[0x1E4F56170];
          }
          int v18 = target;
          char v19 = objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53270], 0), "BOOLValue");
          double v20 = BWPhotoEncoderDenormalizedZoomRectForAttachedMedia(v11, a5, 1.0);
          if ((v19 & 1) == 0)
          {
            CGFloat v24 = v20;
            CGFloat v25 = v21;
            CGFloat v26 = v22;
            CGFloat v27 = v23;
            if (!CGRectIsNull(*(CGRect *)&v20))
            {
              v35.origin.CGFloat x = v24;
              v35.origin.CGFloat y = v25;
              v35.size.CGFloat width = v26;
              v35.size.CGFloat height = v27;
              [v16 setObject:CGRectCreateDictionaryRepresentation(v35) forKeyedSubscript:*v17];
              [v16 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F56198]];
            }
          }
          if ([(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] requiresPhotosAdjustment])
          {
            [v16 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F56090]];
            objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend((id)CMGetAttachment(v18, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F53248]), *MEMORY[0x1E4F560F8]);
          }
          [v16 setObject:&unk_1EFB01220 forKeyedSubscript:*MEMORY[0x1E4F56158]];
          uint64_t v33 = *MEMORY[0x1E4F56358];
          LODWORD(v28) = 1050253722;
          v34[0] = [NSNumber numberWithFloat:v28];
          uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
          [v16 setObject:v29 forKeyedSubscript:*MEMORY[0x1E4F56150]];
          if ([v32 addAuxImage:v12 type:10 auxImageMetadata:0 options:v16 parentImageHandle:0 auxImageHandleOut:0])
          {
LABEL_17:
            LOBYTE(AttachedMedia) = 0;
          }
          else
          {
            objc_msgSend((id)-[BWStillImageProcessorControllerInput encodedAttachedMediaKeys](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "encodedAttachedMediaKeys"), "addObject:", 0x1EFA74740);
            LOBYTE(AttachedMedia) = 1;
          }
        }
      }
    }
  }
  return (char)AttachedMedia;
}

- (BOOL)_addSmartStyleDeltaMapForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 stillImageSettings:(id)a5 primaryOutputAspectRatio:(double)a6
{
  id v11 = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:");
  if (v11)
  {
    id v12 = v11;
    LODWORD(v11) = [v11 isContainerOpen];
    if (v11)
    {
      smartStyleDeltaMapPixelBuffer = self->_smartStyleDeltaMapPixelBuffer;
      if (!smartStyleDeltaMapPixelBuffer) {
        goto LABEL_24;
      }
      double v44 = a6;
      CFTypeRef v46 = v12;
      id v14 = a5;
      size_t Width = CVPixelBufferGetWidth(smartStyleDeltaMapPixelBuffer);
      size_t Height = CVPixelBufferGetHeight(smartStyleDeltaMapPixelBuffer);
      CFTypeRef v45 = smartStyleDeltaMapPixelBuffer;
      Attributes = (void *)CVPixelBufferGetAttributes();
      unint64_t v18 = Width;
      char v19 = v14;
      unsigned int v20 = a3;
      double v21 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", BWPhotoEncoderEncodingOptionsForAuxiliaryImage(v18, Height, Attributes, -[BWPhotoEncoderControllerConfiguration usesHighEncodingPriority](self->_configuration, "usesHighEncodingPriority"), -[BWStillImageProcessorControllerConfiguration figThreadPriority](self->_configuration, "figThreadPriority")));
      CGFloat v22 = *MEMORY[0x1E4F1DB28];
      CGFloat v23 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      CGFloat v24 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      CGFloat v25 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      unsigned int v26 = BWStillImageProcessingFlagsForSampleBuffer(a4);
      char v27 = BWIsDeferredPhotoProxyImage(v26);
      CGFloat v28 = v23;
      double v29 = v24;
      double v30 = v25;
      double v31 = v22;
      if ((BWPhotoEncoderDecompressStyledImageForDeltaMap(objc_msgSend((id)objc_msgSend(v19, "requestedSettings"), "smartStyle"), v27) & 1) == 0)
      {
        double v31 = BWPhotoEncoderDenormalizedZoomRectForAttachedMedia(a4, v44, 1.0);
        CGFloat v28 = v32;
        double v29 = v33;
        double v30 = v34;
        if ((objc_msgSend((id)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F53270], 0), "BOOLValue") & 1) == 0)
        {
          v47.origin.CGFloat x = v31;
          v47.origin.CGFloat y = v28;
          v47.size.CGFloat width = v29;
          v47.size.CGFloat height = v30;
          if (!CGRectIsNull(v47))
          {
            CGRect v35 = (void *)MEMORY[0x1E4F56240];
            if (a3 != 3) {
              CGRect v35 = (void *)MEMORY[0x1E4F56170];
            }
            v48.origin.CGFloat x = v31;
            v48.origin.CGFloat y = v28;
            v48.size.CGFloat width = v29;
            v48.size.CGFloat height = v30;
            [v21 setObject:CGRectCreateDictionaryRepresentation(v48) forKeyedSubscript:*v35];
            [v21 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F56198]];
          }
        }
      }
      double v36 = (void *)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      if ([(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] requiresPhotosAdjustment])
      {
        [v21 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F56090]];
        uint64_t v37 = [v36 objectForKeyedSubscript:*MEMORY[0x1E4F53248]];
        [v21 setObject:v37 forKeyedSubscript:*MEMORY[0x1E4F560F8]];
      }
      uint64_t v38 = BWPhotoEncoderCodecTypeForEncodingScheme(v20);
      v49.origin.CGFloat x = v31;
      v49.origin.CGFloat y = v28;
      v49.size.CGFloat width = v29;
      v49.size.CGFloat height = v30;
      v50.origin.CGFloat x = v22;
      v50.origin.CGFloat y = v23;
      v50.size.CGFloat width = v24;
      v50.size.CGFloat height = v25;
      BOOL v39 = CGRectEqualToRect(v49, v50);
      unint64_t v40 = v39 ? v18 : (int)v29;
      size_t Height = v39 ? Height : (int)v30;
      BOOL v41 = v20 == 2 && self->_heifUseTiling;
      HIDWORD(v43) = 12;
      LOWORD(v43) = v41;
      -[BWPhotoEncoderController _addQualityOptionsToDictionary:codecType:pixelBuffer:imageDimensions:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:enableHEIFTiling:enableHEIFOrientation:auxImageType:](self, "_addQualityOptionsToDictionary:codecType:pixelBuffer:imageDimensions:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:enableHEIFTiling:enableHEIFOrientation:auxImageType:", v21, v38, v45, v40 | (Height << 32), v36, [v19 requestedSettings], objc_msgSend(v19, "captureSettings"), v43);
      if ([v46 addAuxImage:v45 type:12 auxImageMetadata:0 options:v21 parentImageHandle:0 auxImageHandleOut:0])
      {
LABEL_24:
        LOBYTE(v11) = 0;
      }
      else
      {
        objc_msgSend((id)-[BWStillImageProcessorControllerInput encodedAttachedMediaKeys](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "encodedAttachedMediaKeys"), "addObject:", 0x1EFA74820);
        LOBYTE(v11) = 1;
      }
    }
  }
  return (char)v11;
}

- (int)_addSmartStyleMetadataForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 requestedStillImageCaptureSettings:(id)a5
{
  id v7 = [(BWPhotoEncoderController *)self _encoderManagerForEncodingScheme:*(void *)&a3];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  if (([v7 isContainerOpen] & 1) == 0)
  {
    FigDebugAssert3();
    return 0;
  }
  id AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a4, 0x1EFA747C0);
  if (AttachedMedia) {
    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
  }
  else {
    CVImageBufferRef ImageBuffer = 0;
  }
  id v11 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a4, 0x1EFA747E0);
  if (v11) {
    id v12 = CMSampleBufferGetImageBuffer(v11);
  }
  else {
    id v12 = 0;
  }
  int v13 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a4, 0x1EFA74800);
  if (v13) {
    id v14 = CMSampleBufferGetImageBuffer(v13);
  }
  else {
    id v14 = 0;
  }
  CFStringRef v15 = (const __CFString *)*MEMORY[0x1E4F53070];
  uint64_t v16 = (void *)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  uint64_t v17 = (const void *)BWSampleBufferGetAttachedMedia(a4, 0x1EFA74740);
  if (!v17) {
    return 0;
  }
  unint64_t v18 = (void *)CMGetAttachment(v17, v15, 0);
  if (!v18) {
    return 0;
  }
  char v19 = BWSmartStyleInfoDictionary(v16, v18, ImageBuffer, v12, v14, (uint64_t)a5, 0);
  if (![v19 count]) {
    return 0;
  }
  uint64_t v20 = *MEMORY[0x1E4F561C8];
  return [v8 addCustomMetadataContents:v19 URI:v20 name:@"metadata"];
}

- (BOOL)_addConstantColorConfidenceMapForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4
{
  id AttachedMedia = [(BWPhotoEncoderController *)self _encoderManagerForEncodingScheme:*(void *)&a3];
  if (AttachedMedia)
  {
    id v7 = AttachedMedia;
    LODWORD(AttachedMedia) = [AttachedMedia isContainerOpen];
    if (AttachedMedia)
    {
      id AttachedMedia = (id)BWSampleBufferGetAttachedMedia(a4, 0x1EFA74920);
      if (AttachedMedia)
      {
        id AttachedMedia = CMSampleBufferGetImageBuffer((CMSampleBufferRef)AttachedMedia);
        if (AttachedMedia)
        {
          uint64_t v8 = (__CVBuffer *)AttachedMedia;
          size_t Width = CVPixelBufferGetWidth((CVPixelBufferRef)AttachedMedia);
          size_t Height = CVPixelBufferGetHeight(v8);
          Attributes = (void *)CVPixelBufferGetAttributes();
          id v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", BWPhotoEncoderEncodingOptionsForAuxiliaryImage(Width, Height, Attributes, -[BWPhotoEncoderControllerConfiguration usesHighEncodingPriority](self->_configuration, "usesHighEncodingPriority"), -[BWStillImageProcessorControllerConfiguration figThreadPriority](self->_configuration, "figThreadPriority")));
          if ([(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] requiresPhotosAdjustment])
          {
            [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F56090]];
            objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend((id)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F53248]), *MEMORY[0x1E4F560F8]);
          }
          LOBYTE(AttachedMedia) = [v7 addAuxImage:v8 type:11 auxImageMetadata:0 options:v12 parentImageHandle:0 auxImageHandleOut:0] == 0;
        }
      }
    }
  }
  return (char)AttachedMedia;
}

- (void)_tagStereoPairGroupForEncodingScheme:(int)a3 stereoPhotoImageHandles:(id *)a4 groupMetadata:(id)a5
{
  id v7 = [(BWPhotoEncoderController *)self _encoderManagerForEncodingScheme:*(void *)&a3];
  if (v7)
  {
    uint64_t v8 = v7;
    if ([v7 isContainerOpen])
    {
      long long v9 = *(_OWORD *)&a4->var0;
      int64_t var2 = a4->var2;
      [v8 tagStereoPairGroupWithStereoPhotoImageHandles:&v9 groupMetadata:a5];
    }
  }
}

- (CGImageMetadata)_newAuxiliaryImagePropertiesFromSemanticMatteSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  CFTypeRef v4 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F55B88], 0);
  if (!v4)
  {
    FigSignalErrorAt();
    return 0;
  }
  uint64_t v5 = (void *)v4;
  Mutable = CGImageMetadataCreateMutable();
  id v7 = Mutable;
  if (!Mutable)
  {
    FigSignalErrorAt();
    return v7;
  }
  CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F55BA8];
  CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F55BB0];
  CFErrorRef err = 0;
  if (!CGImageMetadataRegisterNamespaceForPrefix(Mutable, v8, v9, &err))
  {
LABEL_9:
    CFRelease(v7);
    return 0;
  }
  uint64_t v10 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E4F55BC0]), "intValue");
  uint64_t v11 = [NSNumber numberWithInt:v10];
  if ([(BWPhotoEncoderController *)self _addValue:v11 toAuxiliaryImageProperties:v7 namespace:v8 prefix:v9 key:*MEMORY[0x1E4F55BB8]])
  {
    FigDebugAssert3();
    goto LABEL_9;
  }
  return v7;
}

- (int)_addValue:(id)a3 toAuxiliaryImageProperties:(CGImageMetadata *)a4 namespace:(__CFString *)a5 prefix:(__CFString *)a6 key:(__CFString *)a7
{
  if (a3)
  {
    CGImageMetadataTagRef v10 = CGImageMetadataTagCreate(a5, a6, a7, kCGImageMetadataTypeDefault, a3);
    if (v10)
    {
      uint64_t v11 = v10;
      id v12 = (__CFString *)[[NSString alloc] initWithFormat:@"%@:%@", a6, a7];
      if (v12)
      {
        if (CGImageMetadataSetTagWithPath(a4, 0, v12, v11))
        {
          int v13 = 0;
        }
        else
        {
          FigDebugAssert3();
          int v13 = -16992;
        }
      }
      else
      {
        FigDebugAssert3();
        int v13 = -16991;
      }
      CFRelease(v11);
    }
    else
    {
      FigDebugAssert3();
      id v12 = 0;
      int v13 = -16991;
    }
  }
  else
  {
    id v12 = 0;
    int v13 = -17102;
  }

  return v13;
}

- (int)_addMetadataAttachmentsForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 requestedSettings:(id)a5 captureType:(int)a6 parentImageHandle:(int64_t)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v11 = *(void *)&a3;
  id v13 = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:");
  if (!v13) {
    goto LABEL_7;
  }
  id v14 = v13;
  if (([v13 isContainerOpen] & 1) == 0)
  {
    FigDebugAssert3();
LABEL_7:
    int v16 = 0;
    id v15 = 0;
    goto LABEL_5;
  }
  id v15 = [(BWPhotoEncoderController *)self _newMetadataAttachmentsForEncodingScheme:v11 sampleBuffer:a4 requestedSettings:a5 captureType:v8];
  if (v15) {
    int v16 = [v14 addMetadata:v15 parentImageHandle:a7];
  }
  else {
    int v16 = 0;
  }
LABEL_5:

  return v16;
}

- (id)_newMetadataAttachmentsForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 requestedSettings:(id)a5 captureType:(int)a6
{
  unsigned int v22 = 5;
  if (a3 == 1)
  {
    double v21 = 0;
  }
  else
  {
    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a4);
    CFTypeRef v11 = CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    if (BWPhotoEncoderDefaultJPEGIndexedQTable(ImageBuffer, (BOOL)v11, a6, (int *)&v22, 0, [(BWPhotoEncoderControllerConfiguration *)self->_configuration zeroShutterLagEnabled]))return 0; {
    double v21 = BWPhotoEncoderTranscodeQualityHintFromQuantizationTableIndex(v22);
    }
  }
  id v12 = objc_msgSend((id)CMGetAttachment(a4, @"PhotoManifest", 0), "descriptorForSampleBuffer:", a4);
  BWStillImageProcessingFlagsForSampleBuffer(a4);
  int v13 = [a5 outputOrientation];
  int v14 = [a5 outputMirroring];
  int v15 = [(BWPhotoEncoderControllerConfiguration *)self->_configuration cameraSupportsFlash];
  int v16 = [a5 flashMode];
  StillImageMetadataInSettingsForSampleBuffer = (const void *)FigCaptureMetadataUtilitiesGetStillImageMetadataInSettingsForSampleBuffer(a5, a4);
  IrisAssetIdentifierForSettingsAndSampleBuffer = (const void *)FigCaptureMetadataUtilitiesGetIrisAssetIdentifierForSettingsAndSampleBuffer(a5, a4);
  MetadataAttachments = FigCaptureMetadataUtilitiesCreateMetadataAttachments(a4, v13, v14, v15, 1, v16, 0, 1, 0, 1, 0, 0, 0, 0, StillImageMetadataInSettingsForSampleBuffer, IrisAssetIdentifierForSettingsAndSampleBuffer, (const void *)[a5 imageGroupIdentifier], v21, objc_msgSend(v12, "time"),
                          self->_clientExpectsCameraMountedInLandscapeOrientation);
  if ([(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] requiresPhotosAdjustment])[(__CFDictionary *)MetadataAttachments setObject:&unk_1EFB01298 forKeyedSubscript:*MEMORY[0x1E4F2FCA0]]; {
  return MetadataAttachments;
  }
}

- (id)_newRawMetadataAttachmentsForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 dngDictionary:(id)a5 requestedSettings:(id)a6 captureType:(int)a7 dngContainsDepthData:(BOOL)a8 dngContainsSemanticSegmentationMattes:(BOOL)a9
{
  BOOL v9 = a8;
  id v13 = [(BWPhotoEncoderController *)self _newMetadataAttachmentsForEncodingScheme:*(void *)&a3 sampleBuffer:a4 requestedSettings:a6 captureType:*(void *)&a7];
  if (v13)
  {
    int v14 = (void *)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    int v15 = [a6 rawOutputFileCodec];
    int v16 = BWCreateRawMetadataFromMetadata(v13, a5, 0x10000u, [v14 objectForKeyedSubscript:*MEMORY[0x1E4F53D70]], v9, a9, v15);
  }
  else
  {
    int v16 = 0;
  }

  return v16;
}

- (__IOSurface)_closeContainerAndCopySurfaceForEncodingScheme:(int)a3
{
  char v6 = 0;
  int result = [(BWPhotoEncoderController *)self _encoderManagerForEncodingScheme:*(void *)&a3];
  if (result)
  {
    uint64_t v5 = result;
    if ([(__IOSurface *)result isContainerOpen])
    {
      [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] setReservedPrimaryImageHandle:-1];
      [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] setToneMapAlternateGroupHandle:-1];
      [(__IOSurface *)v5 closeContainerAndCopySurfaceOut:&v6];
      return v6;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)_getAssetsSizeForEncodingScheme:(int)a3 containerSizeOut:(unint64_t *)a4 thumbnailSizeOut:(unint64_t *)a5 auxiliaryImagesSizeOut:(unint64_t *)a6
{
  id v9 = [(BWPhotoEncoderController *)self _encoderManagerForEncodingScheme:*(void *)&a3];
  if (v9)
  {
    CGImageMetadataTagRef v10 = v9;
    if (a5) {
      *a5 = [v9 thumbnailImageSize];
    }
    if (a6) {
      *a6 = [v10 auxiliaryImagesSize];
    }
    if (a4) {
      *a4 = [v10 containerSize];
    }
  }
}

- (void)_closeContainerForEncodingScheme:(int)a3
{
  id v4 = [(BWPhotoEncoderController *)self _encoderManagerForEncodingScheme:*(void *)&a3];
  if (v4)
  {
    uint64_t v5 = v4;
    if ([v4 isContainerOpen])
    {
      [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] setReservedPrimaryImageHandle:-1];
      [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] setToneMapAlternateGroupHandle:-1];
      [v5 closeContainer];
    }
  }
}

- (int)_generatePhotoSurfaceFromEncodedImageBuffer:(opaqueCMSampleBuffer *)a3 photoSurfaceOut:(__IOSurface *)a4 photoSurfaceSizeOut:(unint64_t *)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  CMBlockBufferRef blockBufferOut = 0;
  DataBuffer = CMSampleBufferGetDataBuffer(a3);
  if (!a4 || !DataBuffer)
  {
    FigDebugAssert3();
    LODWORD(v11) = -12780;
    goto LABEL_8;
  }
  OSStatus v8 = CMBlockBufferCreateContiguous((CFAllocatorRef)*MEMORY[0x1E4F1CF80], DataBuffer, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0, 0, &blockBufferOut);
  if (v8)
  {
    LODWORD(v11) = v8;
    goto LABEL_14;
  }
  size_t totalLengthOut = 0;
  dataPointerOut = 0;
  OSStatus DataPointer = CMBlockBufferGetDataPointer(blockBufferOut, 0, 0, &totalLengthOut, &dataPointerOut);
  if (DataPointer)
  {
    LODWORD(v11) = DataPointer;
    goto LABEL_14;
  }
  uint64_t v18 = *MEMORY[0x1E4F2EFB8];
  v19[0] = [NSNumber numberWithUnsignedLong:totalLengthOut];
  CGImageMetadataTagRef v10 = IOSurfaceCreate((CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1]);
  CFTypeRef v11 = v10;
  if (!v10)
  {
LABEL_14:
    FigDebugAssert3();
    goto LABEL_8;
  }
  BaseAddress = IOSurfaceGetBaseAddress(v10);
  memcpy(BaseAddress, dataPointerOut, totalLengthOut);
  size_t v13 = totalLengthOut;
  *a4 = v11;
  LODWORD(v11) = 0;
  if (a5) {
    *a5 = v13;
  }
LABEL_8:
  if (blockBufferOut) {
    CFRelease(blockBufferOut);
  }
  return (int)v11;
}

- (int)_generatePreviewForSampleBuffer:(opaqueCMSampleBuffer *)a3 requestedStillImageCaptureSettings:(id)a4 cropRect:(CGRect)a5 previewPixelBuffer:(__CVBuffer *)a6
{
  if (!self->_previewPixelConverter)
  {
    FigDebugAssert3();
    return -12786;
  }
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (!ImageBuffer
    || (int v14 = ImageBuffer,
        uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(ImageBuffer),
        size_t v16 = CVPixelBufferGetWidth(v14),
        size_t v17 = CVPixelBufferGetHeight(v14),
        unsigned int v26 = [a4 previewWidth],
        uint64_t v18 = [a4 previewHeight],
        unsigned int v19 = [a4 payloadType],
        v19 >= 2))
  {
    FigDebugAssert3();
    return -12780;
  }
  unsigned int v20 = v19;
  CGFloat v25 = a6;
  if (v19)
  {
    uint64_t v21 = 0;
  }
  else if ([a4 bracketType])
  {
    uint64_t v21 = [a4 bracketImageCount];
  }
  else
  {
    uint64_t v21 = 1;
  }
  int v22 = -[FigCapturePixelConverter updateOutputPixelFormat:dimensions:poolCapacity:colorSpaceProperties:alwaysUseHardwareForConversion:](self->_previewPixelConverter, "updateOutputPixelFormat:dimensions:poolCapacity:colorSpaceProperties:alwaysUseHardwareForConversion:", [a4 previewFormat], v26 | (unint64_t)(v18 << 32), v21, -[BWPhotoEncoderController _getColorSpacePropertiesForSourcePixelFormat:sourceWidth:sourceHeight:destinationPixelFormat:](self, "_getColorSpacePropertiesForSourcePixelFormat:sourceWidth:sourceHeight:destinationPixelFormat:", PixelFormatType, v16, v17, objc_msgSend(a4, "previewFormat")), 1);
  if (v22)
  {
    int v23 = v22;
    goto LABEL_16;
  }
  char v27 = 0;
  int v23 = -[FigCapturePixelConverter convertPixelBuffer:cropRect:allocateOutputFromBufferPool:outputPixelBuffer:](self->_previewPixelConverter, "convertPixelBuffer:cropRect:allocateOutputFromBufferPool:outputPixelBuffer:", v14, v20 == 0, &v27, x, y, width, height);
  if (v23)
  {
LABEL_16:
    FigDebugAssert3();
    return v23;
  }
  *CGFloat v25 = v27;
  return v23;
}

- (int)_getColorSpacePropertiesForSourcePixelFormat:(unsigned int)a3 sourceWidth:(int)a4 sourceHeight:(int)a5 destinationPixelFormat:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v9 = *(void *)&a3;
  int v10 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_resolvedVideoFormatsByAttachedMediaKey, "objectForKeyedSubscript:", @"PrimaryFormat"), "colorSpaceProperties");
  if ((v10 - 3) < 2) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = 4 * ((v10 & 0xFFFFFFFD) == 5);
  }
  return +[BWVideoFormat colorSpacePropertiesWithSourceColorSpace:v11 sourcePixelFormat:v9 sourceDimensions:a4 | (unint64_t)(v7 << 32) requestedPixelFormat:v6];
}

- (double)_aspectRatioAdjustmentFactorForSettings:(id)a3
{
  double v4 = 1.0;
  if ([(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] requiresPhotosAdjustment])
  {
    [a3 nonDestructiveCropSize];
    if (v5 > 0.0 && v6 > 0.0) {
      return v5 / v6;
    }
  }
  return v4;
}

- (opaqueCMSampleBuffer)_newAuxImageEncodingTriggerSbufForSettings:(id)a3 metadata:(id)a4
{
  CMSampleBufferRef v12 = 0;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 48);
  *(_OWORD *)&sampleTimingArray.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 32);
  *(_OWORD *)&sampleTimingArray.decodeTimeStamp.CFDictionaryRef value = v6;
  sampleTimingArray.decodeTimeStamp.epoch = *(void *)(MEMORY[0x1E4F1FA70] + 64);
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 16);
  *(_OWORD *)&sampleTimingArray.duration.CFDictionaryRef value = *MEMORY[0x1E4F1FA70];
  *(_OWORD *)&sampleTimingArray.duration.epoch = v7;
  OSStatus v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "processingSettings"), "photoManifest"), "photoDescriptors"), "firstObject");
  if (v8) {
    [v8 presentationTimeStamp];
  }
  else {
    memset(&v10, 0, sizeof(v10));
  }
  sampleTimingArray.presentationTimeStamp = v10;
  if (!CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 1u, 0, 0, 0, 0, 1, &sampleTimingArray, 0, 0, &v12))
  {
    CMSetAttachment(v12, (CFStringRef)*MEMORY[0x1E4F53070], a4, 1u);
    CMSetAttachment(v12, @"StillSettings", a3, 1u);
    CMSetAttachment(v12, @"PhotoManifest", (CFTypeRef)objc_msgSend((id)objc_msgSend(a3, "processingSettings"), "photoManifest"), 1u);
  }
  return v12;
}

- (void)_updateStillImageProcessingFlagsWithDepthMetadataForSbuf:(opaqueCMSampleBuffer *)a3 stillImageSettings:(id)a4
{
  if (objc_msgSend((id)-[BWStillImageProcessorControllerInput encodedAttachedMediaKeys](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "encodedAttachedMediaKeys"), "containsObject:", @"Depth"))
  {
    CFTypeRef v6 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F55B40], 0);
    if (v6)
    {
      long long v7 = (void *)v6;
      int v8 = BWStillImageProcessingFlagsForSampleBuffer(a3);
      if (objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E4F55870]), "BOOLValue"))int v9 = 32; {
      else
      }
        int v9 = 16;
      int v10 = v9 | v8;
      if (BWCIFilterArrayContainsPortraitFilters(objc_msgSend((id)objc_msgSend(a4, "requestedSettings"), "processedImageFilters")))int v11 = v10; {
      else
      }
        int v11 = v10 | 0x1000000;
      BWStillImageSetProcessingFlagsForSampleBuffer(a3, v11);
    }
  }
}

- (void)_waitForPrewarmingQueueToComplete
{
  if (self->_prewarmQueue)
  {
    if (!_FigIsNotCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    prewarmQueue = self->_prewarmQueue;
    dispatch_sync(prewarmQueue, &__block_literal_global_513);
  }
}

- (void)_waitForPiecemealEncodingGroupToComplete
{
  encodingGroup = self->_encodingGroup;
  if (encodingGroup) {
    dispatch_group_wait(encodingGroup, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (void)_waitForPiecemealEncodingQueueToComplete
{
  if (self->_encodingQueue)
  {
    if (!_FigIsNotCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    encodingQueue = self->_encodingQueue;
    dispatch_sync(encodingQueue, &__block_literal_global_516);
  }
}

- (void)_waitForPreviewGenerationGroupToComplete
{
  previewGenerationGroup = self->_previewGenerationGroup;
  if (previewGenerationGroup) {
    dispatch_group_wait(previewGenerationGroup, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (BOOL)_waitUntilTimeoutForInferenceGroupToCompleteAndReturnSuccess
{
  if (!self->_inferenceGroup) {
    return 0;
  }
  if ([(BWPhotoEncoderControllerConfiguration *)self->_configuration alwaysAwaitInference]) {
    dispatch_time_t v3 = dispatch_time(0, 1000000000);
  }
  else {
    dispatch_time_t v3 = 0;
  }
  return dispatch_group_wait((dispatch_group_t)self->_inferenceGroup, v3) == 0;
}

- (void)_waitForPreviewGenerationQueueToComplete
{
  if (!_FigIsNotCurrentDispatchQueue()) {
    FigDebugAssert3();
  }
  previewGenerationQueue = self->_previewGenerationQueue;
  dispatch_sync(previewGenerationQueue, &__block_literal_global_519);
}

- (id)inputFormatForAttachedMediaKey:(id)a3
{
  return 0;
}

- (id)inputVideoFormatForAttachedMediaKey:(id)a3
{
  return 0;
}

- (id)inputInferenceVideoFormatForAttachedMediaKey:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id result = self->_inferenceInputVideoFormat;
  if (!result)
  {
    double v5 = [(BWVideoFormatRequirements *)[BWInferenceVideoFormatRequirements alloc] initWithPixelBufferAttributes:[(BWVideoFormat *)[(FigCapturePixelConverter *)self->_previewPixelConverter outputFormat] pixelBufferAttributes]];
    [(BWInferenceVideoFormatRequirements *)v5 setIncludesInvalidContent:0];
    v6[0] = v5;
    id result = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1]);
    self->_inferenceInputVideoFormat = (BWInferenceVideoFormat *)result;
  }
  return result;
}

- (id)outputFormatForAttachedMediaKey:(id)a3
{
  return 0;
}

- (id)outputVideoFormatForAttachedMediaKey:(id)a3
{
  return 0;
}

- (BOOL)intermediateResourceTrackingAllowedForAttachedMediaKey:(id)a3
{
  return 0;
}

- (NSDictionary)resolvedVideoFormatsByAttachedMediaKey
{
  return (NSDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (void)setResolvedVideoFormatsByAttachedMediaKey:(id)a3
{
}

- (BOOL)clientExpectsCameraMountedInLandscapeOrientation
{
  return self->_clientExpectsCameraMountedInLandscapeOrientation;
}

- (void)setClientExpectsCameraMountedInLandscapeOrientation:(BOOL)a3
{
  self->_clientExpectsCameraMountedInLandscapeOrientation = a3;
}

- (BWPhotoEncoderControllerDelegate)primaryOwnerDelegate
{
  return (BWPhotoEncoderControllerDelegate *)objc_loadWeak((id *)&self->_primaryOwnerDelegate);
}

- (BOOL)preferMainImageDownscalingFactorByAttachedMediaKeyFromSampleBuffer
{
  return self->_preferMainImageDownscalingFactorByAttachedMediaKeyFromSampleBuffer;
}

- (void).cxx_destruct
{
}

@end